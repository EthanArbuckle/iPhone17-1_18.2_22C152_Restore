@interface AXSpeechControllerSettingsController
- (id)showSpeechController:(id)a3;
- (id)specifiers;
- (id)speechControllerDoubleTapActionSummary:(id)a3;
- (id)speechControllerIdleOpacitySummary:(id)a3;
- (id)speechControllerLongPressActionSummary:(id)a3;
- (void)loadView;
- (void)setShowSpeechController:(id)a3 specifier:(id)a4;
@end

@implementation AXSpeechControllerSettingsController

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)AXSpeechControllerSettingsController;
  [(AXSpeechControllerSettingsController *)&v13 loadView];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __48__AXSpeechControllerSettingsController_loadView__block_invoke;
  v10[3] = &unk_208798;
  objc_copyWeak(&v11, &location);
  [v3 registerUpdateBlock:v10 forRetrieveSelector:"speechControllerDoubleTapAction" withListener:self];

  objc_destroyWeak(&v11);
  v4 = +[AXSettings sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __48__AXSpeechControllerSettingsController_loadView__block_invoke_2;
  v8[3] = &unk_208798;
  objc_copyWeak(&v9, &location);
  [v4 registerUpdateBlock:v8 forRetrieveSelector:"speechControllerLongPressAction" withListener:self];

  objc_destroyWeak(&v9);
  v5 = +[AXSettings sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__AXSpeechControllerSettingsController_loadView__block_invoke_3;
  v6[3] = &unk_208798;
  objc_copyWeak(&v7, &location);
  [v5 registerUpdateBlock:v6 forRetrieveSelector:"speechControllerIdleOpacity" withListener:self];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__AXSpeechControllerSettingsController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained specifierForID:@"SpeechControllerDoubleTapAction"];
  [WeakRetained reloadSpecifier:v1];
}

void __48__AXSpeechControllerSettingsController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained specifierForID:@"SpeechControllerLongPressAction"];
  [WeakRetained reloadSpecifier:v1];
}

void __48__AXSpeechControllerSettingsController_loadView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained specifierForID:@"SpeechControllerIdleOpacity"];
  [WeakRetained reloadSpecifier:v1];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AXSpeechControllerSettingsController *)self loadSpecifiersFromPlistName:@"SpeechControllerSettings" target:self];
    [(AXSpeechControllerSettingsController *)self setAllSpecifiersUnsearchable:v5];
    v6 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (id)showSpeechController:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showSpeechController]);

  return v4;
}

- (void)setShowSpeechController:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setShowSpeechController:v4];
}

- (id)speechControllerLongPressActionSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForSpeechControllerAction((unint64_t)[v3 speechControllerLongPressAction]);

  return v4;
}

- (id)speechControllerDoubleTapActionSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = AXLocalizedTitleForSpeechControllerAction((unint64_t)[v3 speechControllerDoubleTapAction]);

  return v4;
}

- (id)speechControllerIdleOpacitySummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 speechControllerIdleOpacity];
  id v4 = AXFormatFloatWithPercentage();

  return v4;
}

@end