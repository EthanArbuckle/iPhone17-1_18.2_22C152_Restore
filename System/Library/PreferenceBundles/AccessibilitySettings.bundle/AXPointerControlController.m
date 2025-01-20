@interface AXPointerControlController
- (id)allowCustomPointerShapes:(id)a3;
- (id)autoHidePointer:(id)a3;
- (id)globalDevicePreferences;
- (id)ignoreTrackpad:(id)a3;
- (id)increasePointerContrast:(id)a3;
- (id)localizedCurrentDoubleTapDragMode:(id)a3;
- (id)pointerColorDescription:(id)a3;
- (id)pointerEffectScalingEnabled:(id)a3;
- (id)pointerInertiaEnabled:(id)a3;
- (id)pointerScrollAccelerationFactor:(id)a3;
- (id)pointerSizeMultiplier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_showAssistiveTouchSettings:(id)a3;
- (void)connectedPointerDevicesDidChange:(id)a3;
- (void)setAllowCustomPointerShapes:(id)a3 specifier:(id)a4;
- (void)setAutoHidePointer:(id)a3 specifier:(id)a4;
- (void)setIgnoreTrackpad:(id)a3 specifier:(id)a4;
- (void)setIncreasePointerContrast:(id)a3 specifier:(id)a4;
- (void)setPointerEffectScalingEnabled:(id)a3 specifier:(id)a4;
- (void)setPointerInertiaEnabled:(id)a3 specifier:(id)a4;
- (void)setPointerScrollAccelerationFactor:(id)a3 specifier:(id)a4;
- (void)setPointerSizeMultiplier:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXPointerControlController

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v73 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = settingsLocString(@"PointerAppearanceTitle", @"Accessibility-hello");
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    uint64_t v7 = PSIDKey;
    [v6 setProperty:@"PointerAppearanceGroupSpecifier" forKey:PSIDKey];
    v72 = v6;
    [v4 addObject:v6];
    v8 = settingsLocString(@"PointerIncreaseContrast", @"Accessibility-hello");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:v2 set:"setIncreasePointerContrast:specifier:" get:"increasePointerContrast:" detail:0 cell:6 edit:0];

    [v9 setProperty:@"PointerIncreaseContrastSpecifier" forKey:v7];
    v71 = v9;
    [v4 addObject:v9];
    v10 = settingsLocString(@"PointerAutoHideTitle", @"Accessibility-hello");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:v2 set:"setAutoHidePointer:specifier:" get:"autoHidePointer:" detail:0 cell:6 edit:0];

    [v11 setProperty:@"PointerAutoHideSpecifier" forKey:v7];
    v70 = v11;
    [v4 addObject:v11];
    v12 = settingsLocString(@"PointerColorTitle", @"Accessibility-hello");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:v2 set:0 get:"pointerColorDescription:" detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:@"PointerColorSpecifier" forKey:v7];
    v69 = v13;
    [v4 addObject:v13];
    v14 = settingsLocString(@"PointerSizeTitle", @"Accessibility-hello");
    v15 = +[PSSpecifier groupSpecifierWithName:v14];

    [v15 setProperty:@"PointerSizeGroupSpecifier" forKey:v7];
    v68 = v15;
    [v4 addObject:v15];
    v16 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:"setPointerSizeMultiplier:specifier:" get:"pointerSizeMultiplier:" detail:0 cell:5 edit:0];
    [v16 setProperty:@"PointerSizeSpecifier" forKey:v7];
    uint64_t v66 = PSSliderIsSegmented;
    objc_msgSend(v16, "setProperty:forKey:", &__kCFBooleanFalse);
    uint64_t v64 = PSSliderIsContinuous;
    objc_msgSend(v16, "setProperty:forKey:", &__kCFBooleanTrue);
    LODWORD(v17) = kAXSPointerSetSizeMultiplierMinimum;
    v18 = +[NSNumber numberWithFloat:v17];
    uint64_t v65 = PSControlMinimumKey;
    objc_msgSend(v16, "setProperty:forKey:", v18);

    LODWORD(v19) = kAXSPointerSetSizeMultiplierMaximum;
    v20 = +[NSNumber numberWithFloat:v19];
    uint64_t v63 = PSControlMaximumKey;
    objc_msgSend(v16, "setProperty:forKey:", v20);

    [v4 addObject:v16];
    v21 = +[AXPointerDeviceManager sharedInstance];
    unsigned int v22 = [v21 containsTrackpad];

    if (v22)
    {
      v23 = settingsLocString(@"TrackpadTitle", @"Accessibility-hello");
      v24 = +[PSSpecifier groupSpecifierWithName:v23];

      v25 = settingsLocString(@"PointerInertiaDescription", @"Accessibility-hello");
      [v24 setProperty:v25 forKey:PSFooterTextGroupKey];

      [v4 addObject:v24];
      v26 = settingsLocString(@"IgnoreTrackpad", @"Accessibility-hello");
      v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:v2 set:"setIgnoreTrackpad:specifier:" get:"ignoreTrackpad:" detail:0 cell:6 edit:0];

      [v27 setProperty:@"IgnoreTrackpad" forKey:v7];
      [v4 addObject:v27];
      v28 = +[AXPointerDeviceManager sharedInstance];
      LODWORD(v26) = [v28 containsDragLockCompatibleDevice];

      if (v26)
      {
        v29 = settingsLocString(@"PointerDragging", @"Accessibility-hello");
        v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v2 set:0 get:"localizedCurrentDoubleTapDragMode:" detail:objc_opt_class() cell:2 edit:0];

        [v4 addObject:v30];
      }
      v31 = settingsLocString(@"PointerInertia", @"Accessibility-hello");
      v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:v2 set:"setPointerInertiaEnabled:specifier:" get:"pointerInertiaEnabled:" detail:0 cell:6 edit:0];

      [v32 setProperty:@"PointerInertia" forKey:v7];
      [v4 addObject:v32];
    }
    if (AXDeviceIsPad())
    {
      v33 = +[PSSpecifier emptyGroupSpecifier];
      v34 = settingsLocString(@"PointerCustomShapesGroup", @"Accessibility-hello");
      [v33 setProperty:v34 forKey:PSFooterTextGroupKey];

      [v4 addObject:v33];
      v35 = settingsLocString(@"PointerCustomShapes", @"Accessibility-hello");
      v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:v2 set:"setAllowCustomPointerShapes:specifier:" get:"allowCustomPointerShapes:" detail:0 cell:6 edit:0];

      [v36 setProperty:@"PointerCustomShapes" forKey:v7];
      [v4 addObject:v36];
    }
    v37 = settingsLocString(@"DeviceScrollSpeed", @"Accessibility-hello");
    v38 = +[PSSpecifier groupSpecifierWithName:v37];

    [v4 addObject:v38];
    v39 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:"setPointerScrollAccelerationFactor:specifier:" get:"pointerScrollAccelerationFactor:" detail:0 cell:5 edit:0];
    [v39 setProperty:&__kCFBooleanFalse forKey:v66];
    [v39 setProperty:&__kCFBooleanFalse forKey:v64];
    [v39 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v39 setProperty:&off_22C4D0 forKey:v65];
    [v39 setProperty:&off_22C4E0 forKey:v63];
    [v39 setProperty:&off_22C4F0 forKey:PSDefaultValueKey];
    v40 = AXTortoiseImage();
    [v39 setProperty:v40 forKey:PSSliderLeftImageKey];

    v41 = AXHareImage();
    [v39 setProperty:v41 forKey:PSSliderRightImageKey];

    [v39 setProperty:@"DeviceScrollSpeed" forKey:v7];
    [v4 addObject:v39];
    v42 = +[AXMouseEventListener sharedInstance];
    v43 = [v42 discoveredMouseDevices];
    id v44 = [v43 count];

    if (v44)
    {
      v45 = +[PSSpecifier emptyGroupSpecifier];
      v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      [v45 setProperty:v47 forKey:PSFooterCellClassGroupKey];

      v48 = settingsLocString(@"PointerButtonCustomizationFooter", @"Accessibility-hello");
      settingsLocString(@"PointerButtonCustomizationAssistiveTouchLink", @"Accessibility-hello");
      v67 = v2;
      v49 = v4;
      v50 = v16;
      v52 = v51 = v38;
      v53 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v48, v52);

      v54 = settingsLocString(@"PointerButtonCustomizationAssistiveTouchLink", @"Accessibility-hello");
      id v55 = [v53 rangeOfString:v54];
      NSUInteger v57 = v56;

      [v45 setProperty:v53 forKey:PSFooterHyperlinkViewTitleKey];
      v75.location = (NSUInteger)v55;
      v38 = v51;
      v16 = v50;
      v4 = v49;
      v2 = v67;
      v75.length = v57;
      v58 = NSStringFromRange(v75);
      [v45 setProperty:v58 forKey:PSFooterHyperlinkViewLinkRangeKey];

      v59 = +[NSValue valueWithNonretainedObject:v67];
      [v45 setProperty:v59 forKey:PSFooterHyperlinkViewTargetKey];

      v60 = NSStringFromSelector("_showAssistiveTouchSettings:");
      [v45 setProperty:v60 forKey:PSFooterHyperlinkViewActionKey];

      [v4 addObject:v45];
    }
    v61 = *(void **)&v2->AXUISettingsBaseListController_opaque[v73];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v73] = v4;

    v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v73];
  }

  return v3;
}

- (id)ignoreTrackpad:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 ignoreTrackpad]);

  return v4;
}

- (void)setIgnoreTrackpad:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setIgnoreTrackpad:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AXPointerControlController;
  id v6 = a4;
  uint64_t v7 = [(AXPointerControlController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[AXPointerControlController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v7 control];
    scrollSpeedSlider = self->_scrollSpeedSlider;
    self->_scrollSpeedSlider = v9;
LABEL_6:

    goto LABEL_7;
  }
  v11 = [v8 propertyForKey:PSIDKey];
  unsigned int v12 = [v11 isEqualToString:@"PointerSizeSpecifier"];

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      scrollSpeedSlider = [v7 control];
      v13 = +[UIColor colorWithWhite:0.596078431 alpha:1.0];
      [scrollSpeedSlider setMinimumTrackTintColor:v13];

      v14 = +[UIColor colorWithWhite:0.596078431 alpha:1.0];
      [scrollSpeedSlider setMaximumTrackTintColor:v14];

      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AXPointerControlController;
  [(AXPointerControlController *)&v5 viewDidLoad];
  v3 = settingsLocString(@"PointerControlTitle", @"Accessibility-hello");
  [(AXPointerControlController *)self setTitle:v3];

  id v4 = +[AXPointerDeviceManager sharedInstance];
  [v4 addObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXPointerControlController;
  [(AXPointerControlController *)&v4 viewWillAppear:a3];
  [(AXPointerControlController *)self reloadSpecifiers];
}

- (void)_showAssistiveTouchSettings:(id)a3
{
  id v4 = [(AXPointerControlController *)self navigationController];
  v3 = objc_opt_new();
  [v4 pushViewController:v3 animated:1];
}

- (id)globalDevicePreferences
{
  v2 = +[BKSMousePointerService sharedInstance];
  v3 = [v2 globalDevicePreferences];

  if (!v3)
  {
    v3 = +[BKSMousePointerDevicePreferences defaultPreferencesForHardwareType:9];
  }

  return v3;
}

- (void)connectedPointerDevicesDidChange:(id)a3
{
}

id __63__AXPointerControlController_connectedPointerDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)pointerSizeMultiplier:(id)a3
{
  _AXSPointerSizeMultiplier();

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setPointerSizeMultiplier:(id)a3 specifier:(id)a4
{
  id v4 = [a3 floatValue];

  __AXSPointerSetSizeMultiplier(v4);
}

- (id)allowCustomPointerShapes:(id)a3
{
  uint64_t v3 = _AXSPointerAllowAppCustomizationEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAllowCustomPointerShapes:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerAllowAppCustomizationSetEnabled(v4);
}

- (id)pointerInertiaEnabled:(id)a3
{
  uint64_t v3 = _AXSPointerInertiaEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setPointerInertiaEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerInertiaSetEnabled(v4);
}

- (id)pointerEffectScalingEnabled:(id)a3
{
  uint64_t v3 = _AXSPointerEffectScalingEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setPointerEffectScalingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerEffectScalingSetEnabled(v4);
}

- (id)increasePointerContrast:(id)a3
{
  uint64_t v3 = _AXSPointerIncreasedContrastEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setIncreasePointerContrast:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerIncreasedContrastSetEnabled(v4);
}

- (id)autoHidePointer:(id)a3
{
  uint64_t v3 = _AXSPointerAutoHideEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAutoHidePointer:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSPointerAutoHideSetEnabled(v4);
}

- (id)pointerColorDescription:(id)a3
{
  uint64_t v3 = _AXSPointerStrokeColor();

  return +[AXPointerControlColorController localizedNameForColor:v3];
}

- (id)pointerScrollAccelerationFactor:(id)a3
{
  uint64_t v3 = [(AXPointerControlController *)self globalDevicePreferences];
  [v3 scrollAccelerationFactor];
  id v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v4;
}

- (void)setPointerScrollAccelerationFactor:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  float v6 = v5;
  if (fabs(v5 + -0.3125) < 0.03
    && ([(UISlider *)self->_scrollSpeedSlider isTracking] & 1) == 0)
  {
    float v6 = 0.3125;
    LODWORD(v7) = 0.3125;
    [(UISlider *)self->_scrollSpeedSlider setValue:1 animated:v7];
  }
  id v10 = [(AXPointerControlController *)self globalDevicePreferences];
  *(float *)&double v8 = v6;
  [v10 setScrollAccelerationFactor:v8];
  v9 = +[BKSMousePointerService sharedInstance];
  [v9 setGlobalDevicePreferences:v10];
}

- (id)localizedCurrentDoubleTapDragMode:(id)a3
{
  uint64_t v3 = [(AXPointerControlController *)self globalDevicePreferences];
  id v4 = +[AXPointerControlDraggingController localizedNameForDoubleTapDragMode:](AXPointerControlDraggingController, "localizedNameForDoubleTapDragMode:", [v3 doubleTapDragMode]);

  return v4;
}

- (void).cxx_destruct
{
}

@end