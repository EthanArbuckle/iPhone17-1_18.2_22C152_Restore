@interface ASTMotionTrackingSettingsController
- (ASTMotionTrackingSettingsController)init;
- (ASTMotionTrackingSettingsHelper)motionTrackingSettingsHelper;
- (AXSSMotionTrackingHIDInput)eyeTracker;
- (BOOL)showingAutoHideSettings;
- (id)specifiers;
- (void)setEyeTracker:(id)a3;
- (void)setMotionTrackingSettingsHelper:(id)a3;
- (void)setShowingAutoHideSettings:(BOOL)a3;
- (void)updateSpecifiersForAutoHideSettingsChange;
@end

@implementation ASTMotionTrackingSettingsController

- (ASTMotionTrackingSettingsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)ASTMotionTrackingSettingsController;
  v2 = [(ASTMotionTrackingSettingsController *)&v10 init];
  if (v2)
  {
    v3 = +[AXSettings sharedInstance];
    v2->_showingAutoHideSettings = [v3 assistiveTouchEyeTrackingAutoHideEnabled];

    objc_initWeak(&location, v2);
    v4 = +[AXSettings sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __43__ASTMotionTrackingSettingsController_init__block_invoke;
    v7[3] = &unk_208798;
    objc_copyWeak(&v8, &location);
    [v4 registerUpdateBlock:v7 forRetrieveSelector:"assistiveTouchEyeTrackingAutoHideEnabled" withListener:v2];

    objc_destroyWeak(&v8);
    v5 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __43__ASTMotionTrackingSettingsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSpecifiersForAutoHideSettingsChange];
}

- (id)specifiers
{
  v3 = [(ASTMotionTrackingSettingsController *)self eyeTracker];

  if (!v3)
  {
    objc_opt_class();
    v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 objectForKeyedSubscript:@"AX_EYE_TRACKER_KEY"];
    [(ASTMotionTrackingSettingsController *)self setEyeTracker:v6];
  }
  v7 = [(ASTMotionTrackingSettingsController *)self motionTrackingSettingsHelper];

  if (!v7)
  {
    id v8 = [ASTMotionTrackingSettingsHelper alloc];
    v9 = [(ASTMotionTrackingSettingsController *)self eyeTracker];
    objc_super v10 = [(ASTMotionTrackingSettingsHelper *)v8 initWithEyeTracker:v9];
    [(ASTMotionTrackingSettingsController *)self setMotionTrackingSettingsHelper:v10];
  }
  uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
  v12 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v12)
  {
    id v13 = [objc_allocWithZone((Class)NSMutableArray) init];
    v14 = [(ASTMotionTrackingSettingsController *)self motionTrackingSettingsHelper];
    v15 = [v14 specifiers];
    [v13 axSafelyAddObjectsFromArray:v15];

    id v16 = [v13 copy];
    v17 = *(void **)&self->AXUISettingsBaseListController_opaque[v11];
    *(void *)&self->AXUISettingsBaseListController_opaque[v11] = v16;

    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v11];
  }

  return v12;
}

- (void)updateSpecifiersForAutoHideSettingsChange
{
  v3 = +[AXSettings sharedInstance];
  if ([v3 assistiveTouchEyeTrackingAutoHideEnabled])
  {
    unsigned __int8 v4 = [(ASTMotionTrackingSettingsController *)self showingAutoHideSettings];

    if ((v4 & 1) == 0)
    {
      v5 = [(ASTMotionTrackingSettingsController *)self motionTrackingSettingsHelper];
      v6 = [v5 autoHideTimeoutAndSliderContiguousSpecs];
      [(ASTMotionTrackingSettingsController *)self insertContiguousSpecifiers:v6 afterSpecifierID:@"AutoHideSwitchSpecifierKey" animated:1];

      v7 = self;
      uint64_t v8 = 1;
LABEL_11:
      [(ASTMotionTrackingSettingsController *)v7 setShowingAutoHideSettings:v8];
      return;
    }
  }
  else
  {
  }
  id v12 = +[AXSettings sharedInstance];
  if (([v12 assistiveTouchEyeTrackingAutoHideEnabled] & 1) == 0)
  {
    unsigned int v9 = [(ASTMotionTrackingSettingsController *)self showingAutoHideSettings];

    if (!v9) {
      return;
    }
    objc_super v10 = [(ASTMotionTrackingSettingsController *)self motionTrackingSettingsHelper];
    uint64_t v11 = [v10 autoHideTimeoutAndSliderContiguousSpecs];
    [(ASTMotionTrackingSettingsController *)self removeContiguousSpecifiers:v11 animated:1];

    v7 = self;
    uint64_t v8 = 0;
    goto LABEL_11;
  }
}

- (ASTMotionTrackingSettingsHelper)motionTrackingSettingsHelper
{
  return self->_motionTrackingSettingsHelper;
}

- (void)setMotionTrackingSettingsHelper:(id)a3
{
}

- (AXSSMotionTrackingHIDInput)eyeTracker
{
  return self->_eyeTracker;
}

- (void)setEyeTracker:(id)a3
{
}

- (BOOL)showingAutoHideSettings
{
  return self->_showingAutoHideSettings;
}

- (void)setShowingAutoHideSettings:(BOOL)a3
{
  self->_showingAutoHideSettings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeTracker, 0);

  objc_storeStrong((id *)&self->_motionTrackingSettingsHelper, 0);
}

@end