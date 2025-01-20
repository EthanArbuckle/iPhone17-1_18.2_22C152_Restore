@interface ZoomController
+ (void)setZoomEnabled:(BOOL)a3;
+ (void)setZoomEnabled:(BOOL)a3 initialFocusRect:(CGRect)a4 contextId:(unsigned int)a5;
- (BOOL)zoomScalePointerIsAllowed;
- (PSSpecifier)leaveKeyboardUnzoomedSpecifier;
- (ZoomController)init;
- (id)_zoomTouchEnabledSpecifier;
- (id)specifiers;
- (id)zoomAlwaysUseWindowZoomForTyping:(id)a3;
- (id)zoomFilterSummary:(id)a3;
- (id)zoomKeyboardShortcutsSettingsSummary:(id)a3;
- (id)zoomLensModeSummary:(id)a3;
- (id)zoomPanOptionDescription:(id)a3;
- (id)zoomScalePointerEnabled:(id)a3;
- (id)zoomShouldFollowFocus:(id)a3;
- (id)zoomShowWhileMirroring:(id)a3;
- (id)zoomSlugSettingsSummary:(id)a3;
- (id)zoomTouchEnabled:(id)a3;
- (id)zoomTrackpadGestureEnabled:(id)a3;
- (void)_updateOptionsFooterText:(BOOL)a3;
- (void)_zoomTouchEnabledChange;
- (void)connectedPointerDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)setLeaveKeyboardUnzoomedSpecifier:(id)a3;
- (void)setZoomAlwaysUseWindowZoomForTyping:(id)a3 specifier:(id)a4;
- (void)setZoomScalePointerEnabled:(id)a3 specifier:(id)a4;
- (void)setZoomShouldFollowFocus:(id)a3 specifier:(id)a4;
- (void)setZoomShowWhileMirroring:(id)a3 specifier:(id)a4;
- (void)setZoomTouchEnabled:(id)a3 specifier:(id)a4;
- (void)setZoomTrackpadGestureEnabled:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ZoomController

+ (void)setZoomEnabled:(BOOL)a3 initialFocusRect:(CGRect)a4 contextId:(unsigned int)a5
{
  BOOL v5 = a3;
  if (a5)
  {
    uint64_t v7 = *(void *)&a5;
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    v12 = +[AXBackBoardServer server];
    objc_msgSend(v12, "setZoomInitialFocusRect:fromContext:", v7, x, y, width, height);
  }

  objc_msgSend(a1, "setZoomEnabled:", v5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[AXSettings sharedInstance];
  [v4 setZoomInStandby:0];

  _AXSZoomTouchSetEnabled();

  __AXSZoomTouchSetToggledByPreferenceSwitch(v3);
}

- (ZoomController)init
{
  v30.receiver = self;
  v30.super_class = (Class)ZoomController;
  v2 = [(ZoomController *)&v30 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_zoomTouchEnabledChange, kAXSZoomTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v2);
    v4 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __22__ZoomController_init__block_invoke;
    v27[3] = &unk_208798;
    objc_copyWeak(&v28, &location);
    [v4 registerUpdateBlock:v27 forRetrieveSelector:"zoomPreferredCurrentLensMode" withListener:v2];

    objc_destroyWeak(&v28);
    BOOL v5 = +[AXSettings sharedInstance];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __22__ZoomController_init__block_invoke_2;
    v24[3] = &unk_208BB8;
    objc_copyWeak(&v26, &location);
    v6 = v2;
    v25 = v6;
    [v5 registerUpdateBlock:v24 forRetrieveSelector:"zoomCurrentLensEffect" withListener:v6];

    objc_destroyWeak(&v26);
    uint64_t v7 = +[AXSettings sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __22__ZoomController_init__block_invoke_3;
    v21[3] = &unk_208BB8;
    objc_copyWeak(&v23, &location);
    v8 = v6;
    v22 = v8;
    [v7 registerUpdateBlock:v21 forRetrieveSelector:"zoomShouldShowSlug" withListener:v8];

    objc_destroyWeak(&v23);
    v9 = +[AXSettings sharedInstance];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = __22__ZoomController_init__block_invoke_4;
    v18 = &unk_208BB8;
    objc_copyWeak(&v20, &location);
    v10 = v8;
    v19 = v10;
    [v9 registerUpdateBlock:&v15 forRetrieveSelector:"zoomKeyboardShortcutsEnabled" withListener:v10];

    objc_destroyWeak(&v20);
    v11 = +[AXSettings sharedInstance];
    unsigned int v12 = [v11 laserEnabled];

    if (v12)
    {
      v13 = +[AXPointerDeviceManager sharedInstance];
      [v13 addObserver:v10];
    }
    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__ZoomController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __22__ZoomController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForKey:@"ZoomFilter"];
  [WeakRetained reloadSpecifier:v2 animated:1];
}

void __22__ZoomController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForKey:@"ZoomSlug"];
  [WeakRetained reloadSpecifier:v2 animated:1];
}

void __22__ZoomController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForKey:@"ZoomKeyboardShortcuts"];
  [WeakRetained reloadSpecifier:v2 animated:1];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[AXPointerDeviceManager sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ZoomController;
  [(ZoomController *)&v5 dealloc];
}

- (id)specifiers
{
  BOOL v3 = (id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    objc_super v5 = [(ZoomController *)self loadSpecifiersFromPlistName:@"ZoomSettings" target:self];
    id v6 = [v5 mutableCopy];

    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
    uint64_t v8 = PSIDKey;
    [v7 setProperty:@"ZoomPreferredMaxZoomLevel" forKey:PSIDKey];
    [v6 addObject:v7];
    v9 = +[AXSettings sharedInstance];
    unsigned int v10 = [v9 laserEnabled];

    if (v10)
    {
      v11 = +[AXPointerDeviceManager sharedInstance];
      unsigned int v12 = [v11 connectedDevices];
      id v13 = [v12 count];

      if (v13)
      {
        v14 = settingsLocString(@"ZoomPointerGroupTitle", @"Accessibility-hello");
        v15 = +[PSSpecifier groupSpecifierWithName:v14];

        uint64_t v16 = settingsLocString(@"ZoomScalePointerDescription", @"Accessibility-hello");
        uint64_t v31 = PSFooterTextGroupKey;
        v32 = v15;
        objc_msgSend(v15, "setProperty:forKey:", v16);

        [v6 addObject:v15];
        v17 = settingsLocString(@"ZoomPanOptions", @"Accessibility-hello");
        objc_super v30 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"zoomPanOptionDescription:" detail:objc_opt_class() cell:2 edit:0];

        [v30 setProperty:@"ZoomPanningStyle" forKey:v8];
        [v6 addObject:v30];
        v18 = settingsLocString(@"ZoomScalePointer", @"Accessibility-hello");
        v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setZoomScalePointerEnabled:specifier:" get:"zoomScalePointerEnabled:" detail:0 cell:6 edit:0];

        id v20 = +[NSNumber numberWithBool:[(ZoomController *)self zoomScalePointerIsAllowed]];
        [v19 setProperty:v20 forKey:PSEnabledKey];

        [v19 setProperty:@"ZoomAdjustPointerSize" forKey:v8];
        [v6 addObject:v19];
        v21 = +[PSSpecifier emptyGroupSpecifier];
        v22 = settingsLocString(@"ZoomTrackpadGestureDescription", @"Accessibility-hello");
        [v21 setProperty:v22 forKey:v31];

        [v6 addObject:v21];
        id v23 = settingsLocString(@"ZoomTrackpadGesture", @"Accessibility-hello");
        v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"setZoomTrackpadGestureEnabled:specifier:" get:"zoomTrackpadGestureEnabled:" detail:0 cell:6 edit:0];

        [v24 setProperty:@"ZoomWithTrackpad" forKey:v8];
        [v6 addObject:v24];
      }
    }
    objc_storeStrong(v3, v6);
    v25 = [(ZoomController *)self specifierForID:@"ZoomAlwaysUseWindowZoomForTyping"];
    [(ZoomController *)self setLeaveKeyboardUnzoomedSpecifier:v25];

    id v26 = +[AXSettings sharedInstance];
    unsigned __int8 v27 = [v26 zoomShouldFollowFocus];

    if ((v27 & 1) == 0)
    {
      id v28 = [(ZoomController *)self leaveKeyboardUnzoomedSpecifier];
      [v6 removeObject:v28];

      [(ZoomController *)self _updateOptionsFooterText:0];
    }

    id v4 = *v3;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZoomController;
  [(ZoomController *)&v4 viewWillAppear:a3];
  [(ZoomController *)self reloadSpecifiers];
}

- (void)connectedPointerDevicesDidChange:(id)a3
{
}

id __51__ZoomController_connectedPointerDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)zoomPanOptionDescription:(id)a3
{
  return +[AXPointerControllerZoomOptionsController currentZoomStyleTitle];
}

- (void)setZoomScalePointerEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerScaleWithZoomLevelSetEnabled(v4);
}

- (id)zoomScalePointerEnabled:(id)a3
{
  if ([(ZoomController *)self zoomScalePointerIsAllowed])
  {
    BOOL v3 = +[NSNumber numberWithUnsignedChar:_AXSPointerScaleWithZoomLevelEnabled()];
  }
  else
  {
    BOOL v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (BOOL)zoomScalePointerIsAllowed
{
  v2 = +[AXSettings sharedInstance];
  BOOL v3 = [v2 zoomPreferredCurrentLensMode];
  char v4 = [v3 isEqualToString:AXZoomLensModeWindowAnchored] ^ 1;

  return v4;
}

- (void)setZoomTrackpadGestureEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomTrackpadGestureEnabled:v4];
}

- (id)zoomTrackpadGestureEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomTrackpadGestureEnabled]);

  return v4;
}

- (void)_zoomTouchEnabledChange
{
  id v3 = [(ZoomController *)self specifierForKey:@"ZoomTouchEnabled"];
  [(ZoomController *)self reloadSpecifier:v3];
}

- (void)_updateOptionsFooterText:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(ZoomController *)self specifierForID:@"ZoomOptionsGroup"];
  id v5 = +[AXSettings sharedInstance];
  unsigned __int8 v6 = [v5 zoomShouldFollowFocus];

  if ((v6 & 1) == 0)
  {
    [v8 removePropertyForKey:PSFooterTextGroupKey];
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v7 = settingsLocString(@"ZOOM_USE_WINDOW_FOR_TYPING_INSTRUCTIONS", @"ZoomSettings");
  [v8 setProperty:v7 forKey:PSFooterTextGroupKey];

  if (v3) {
LABEL_5:
  }
    [(ZoomController *)self reloadSpecifier:v8 animated:1];
LABEL_6:
}

- (id)_zoomTouchEnabledSpecifier
{
  return [(ZoomController *)self specifierForKey:@"ZoomTouchEnabled"];
}

- (id)zoomTouchEnabled:(id)a3
{
  uint64_t v3 = _AXSZoomTouchEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setZoomTouchEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(ZoomController *)self cellForSpecifierID:@"ZoomTouchEnabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 control];
    [v7 bounds];
    objc_msgSend(v7, "convertRect:toView:", 0);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [v7 window];
    objc_msgSend(v16, "convertRect:toWindow:", 0, v9, v11, v13, v15);

    v17 = [v7 window];
    AXUIConvertRectFromScreenToContextSpace();
    double x = v18;
    double y = v20;
    double width = v22;
    double height = v24;

    id v26 = [v7 window];
    id v27 = [v26 _contextId];
  }
  else
  {
    id v27 = 0;
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  unsigned __int8 v28 = [v5 BOOLValue];
  if (v28)
  {
    +[ZoomController setZoomEnabled:initialFocusRect:contextId:](ZoomController, "setZoomEnabled:initialFocusRect:contextId:", 1, v27, x, y, width, height);
  }
  else
  {
    unsigned __int8 v29 = v28;
    uint64_t v30 = [(ZoomController *)self parentController];
    if (v30
      && (uint64_t v31 = (void *)v30,
          [(ZoomController *)self parentController],
          v32 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v32,
          v31,
          (isKindOfClass & 1) != 0))
    {
      v34 = [(ZoomController *)self parentController];
      v35 = settingsLocString(@"CONFIRM_ZOT_REMOVAL", @"Accessibility");
      uint64_t v36 = kAXSZoomTouchEnabledByiTunesPreference;
      LOBYTE(v41) = v29;
      v37 = [(ZoomController *)self view];
      v38 = [v37 window];
      [v34 confirmDisablingWithString:v35 forKey:v36 confirmedBlock:&v40 canceledBlock:&v39 inWindow:v38];
    }
    else
    {
      +[ZoomController setZoomEnabled:0];
    }
  }
}

id __48__ZoomController_setZoomTouchEnabled_specifier___block_invoke(uint64_t a1)
{
  return +[ZoomController setZoomEnabled:*(unsigned __int8 *)(a1 + 32)];
}

void __48__ZoomController_setZoomTouchEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _zoomTouchEnabledSpecifier];
  [v2 setProperty:&__kCFBooleanTrue forKey:PSValueKey];
  [*(id *)(a1 + 32) reloadSpecifier:v2];
}

- (id)zoomShouldFollowFocus:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomShouldFollowFocus]);

  return v4;
}

- (void)setZoomShouldFollowFocus:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(ZoomController *)self beginUpdates];
  id v6 = [v5 BOOLValue];
  uint64_t v7 = +[AXSettings sharedInstance];
  [v7 setZoomShouldFollowFocus:v6];

  LODWORD(v6) = [v5 BOOLValue];
  double v8 = [(ZoomController *)self leaveKeyboardUnzoomedSpecifier];
  if (v6)
  {
    double v9 = [(ZoomController *)self specifierForID:@"ZoomShouldFollowFocus"];
    [(ZoomController *)self insertSpecifier:v8 afterSpecifier:v9 animated:1];
  }
  else
  {
    [(ZoomController *)self removeSpecifier:v8 animated:1];

    double v8 = +[AXSettings sharedInstance];
    [v8 setZoomAlwaysUseWindowedZoomForTyping:0];
  }

  [(ZoomController *)self _updateOptionsFooterText:1];

  [(ZoomController *)self endUpdates];
}

- (id)zoomAlwaysUseWindowZoomForTyping:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomAlwaysUseWindowedZoomForTyping]);

  return v4;
}

- (void)setZoomAlwaysUseWindowZoomForTyping:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomAlwaysUseWindowedZoomForTyping:v4];
}

- (id)zoomShowWhileMirroring:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 zoomShowWhileMirroring]);

  return v4;
}

- (void)setZoomShowWhileMirroring:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setZoomShowWhileMirroring:v4];
}

- (id)zoomLensModeSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 zoomPreferredCurrentLensMode];

  id v5 = AXLocalizedTitleForZoomLensMode(v4);

  return v5;
}

- (id)zoomFilterSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 zoomCurrentLensEffect];

  id v5 = AXUILocalizedTitleForZoomLensEffect();

  return v5;
}

- (id)zoomSlugSettingsSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 zoomShouldShowSlug];

  if (v4) {
    id v5 = @"ON";
  }
  else {
    id v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (id)zoomKeyboardShortcutsSettingsSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 zoomKeyboardShortcutsEnabled];

  if (v4) {
    id v5 = @"ON";
  }
  else {
    id v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (PSSpecifier)leaveKeyboardUnzoomedSpecifier
{
  return self->_leaveKeyboardUnzoomedSpecifier;
}

- (void)setLeaveKeyboardUnzoomedSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaveKeyboardUnzoomedSpecifier, 0);

  objc_storeStrong((id *)&self->_zoomOnSpecifier, 0);
}

@end