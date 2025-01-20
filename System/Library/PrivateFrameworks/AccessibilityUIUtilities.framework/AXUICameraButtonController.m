@interface AXUICameraButtonController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cameraButtonEnabled:(id)a3;
- (id)_lightTouch:(id)a3;
- (id)_swipe:(id)a3;
- (id)specifiers;
- (void)_launchCameraButtonTips:(id)a3;
- (void)_setCameraButtonEnabled:(id)a3 specifier:(id)a4;
- (void)_setLightTouch:(id)a3 specifier:(id)a4;
- (void)_setSwipe:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXUICameraButtonController

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v76 = (int)*MEMORY[0x1E4F92F08];
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    v7 = NSString;
    v8 = AXUILocalizedStringForKeyWithTable(@"CAMERA_BUTTON_TOGGLE_FOOTER", @"Accessibility-D93");
    v9 = AXUILocalizedStringForKeyWithTable(@"CAMERA_BUTTON_LEARN_MORE_TITLE", @"Accessibility-D93");
    v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v6 setProperty:v12 forKey:*MEMORY[0x1E4F93140]];

    v75 = v10;
    [v6 setProperty:v10 forKey:*MEMORY[0x1E4F93160]];
    v13 = AXUILocalizedStringForKeyWithTable(@"CAMERA_BUTTON_LEARN_MORE_TITLE", @"Accessibility-D93");
    v78.location = [v10 rangeOfString:v13];
    v14 = NSStringFromRange(v78);
    [v6 setProperty:v14 forKey:*MEMORY[0x1E4F93150]];

    v15 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v6 setProperty:v15 forKey:*MEMORY[0x1E4F93158]];

    v16 = NSStringFromSelector(sel__launchCameraButtonTips_);
    [v6 setProperty:v16 forKey:*MEMORY[0x1E4F93148]];

    [v4 addObject:v6];
    v17 = (void *)MEMORY[0x1E4F92E70];
    v18 = AXUILocalizedStringForKeyWithTable(@"CAMERA_BUTTON_TITLE", @"Accessibility-D93");
    v19 = [v17 preferenceSpecifierNamed:v18 target:self set:sel__setCameraButtonEnabled_specifier_ get:sel__cameraButtonEnabled_ detail:0 cell:6 edit:0];

    uint64_t v20 = *MEMORY[0x1E4F93188];
    [v19 setProperty:@"CAMERA_CONTROL_SWITCH" forKey:*MEMORY[0x1E4F93188]];
    [v4 addObject:v19];
    v21 = (void *)MEMORY[0x1E4F92E70];
    v22 = AXUILocalizedStringForKeyWithTable(@"CONTROLS_GESTURE_HEADER", @"Accessibility-D93");
    v23 = [v21 groupSpecifierWithName:v22];

    v24 = AXUILocalizedStringForKeyWithTable(@"CONTROLS_GESTURE_FOOTER", @"Accessibility-D93");
    uint64_t v74 = *MEMORY[0x1E4F93170];
    objc_msgSend(v23, "setProperty:forKey:", v24);

    [v4 addObject:v23];
    [v5 addObject:v23];
    v25 = (void *)MEMORY[0x1E4F92E70];
    v26 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_LIGHT_PRESS_ENABLED", @"Accessibility-D93");
    v27 = [v25 preferenceSpecifierNamed:v26 target:self set:sel__setLightTouch_specifier_ get:sel__lightTouch_ detail:0 cell:6 edit:0];

    [v27 setProperty:@"LIGHT_PRESS" forKey:v20];
    [v4 addObject:v27];
    [v5 addObject:v27];
    v28 = (void *)MEMORY[0x1E4F92E70];
    v29 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_SWIPE_ENABLED", @"Accessibility-D93");
    v30 = [v28 preferenceSpecifierNamed:v29 target:self set:sel__setSwipe_specifier_ get:sel__swipe_ detail:0 cell:6 edit:0];

    [v30 setProperty:@"SWIPE" forKey:v20];
    [v4 addObject:v30];
    [v5 addObject:v30];
    v31 = (void *)MEMORY[0x1E4F92E70];
    v32 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_HEADER", @"Accessibility-D93");
    v33 = [v31 groupSpecifierWithName:v32];

    [v33 setProperty:@"LIGHT_PRESS_FORCE" forKey:v20];
    [v4 addObject:v33];
    [v5 addObject:v33];
    v34 = (void *)MEMORY[0x1E4F92E70];
    v35 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_SOFTER", @"Accessibility-D93");
    v36 = [v34 preferenceSpecifierNamed:v35 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v36 setProperty:&unk_1F1F20048 forKey:@"SENSTIVITY_VALUE"];
    [v4 addObject:v36];
    [v5 addObject:v36];
    v37 = (void *)MEMORY[0x1E4F92E70];
    v38 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_DEFAULT", @"Accessibility-D93");
    v39 = [v37 preferenceSpecifierNamed:v38 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v39 setProperty:&unk_1F1F20060 forKey:@"SENSTIVITY_VALUE"];
    [v4 addObject:v39];
    [v5 addObject:v39];
    v40 = (void *)MEMORY[0x1E4F92E70];
    v41 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_HARDER", @"Accessibility-D93");
    v42 = [v40 preferenceSpecifierNamed:v41 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v42 setProperty:&unk_1F1F20078 forKey:@"SENSTIVITY_VALUE"];
    [v4 addObject:v42];
    [v5 addObject:v42];
    v43 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];

    v44 = AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_TESTER_FOOTER", @"Accessibility-D93");
    [v43 setProperty:v44 forKey:v74];

    [v4 addObject:v43];
    [v5 addObject:v43];
    v45 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v45 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v45 setProperty:@"AXCameraButtonPracticeCell" forKey:v20];
    [v4 addObject:v45];
    [v5 addObject:v45];
    v46 = (void *)MEMORY[0x1E4F92E70];
    v47 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_PRESS_SPEED_HEADER", @"Accessibility-D93");
    v48 = [v46 groupSpecifierWithName:v47];

    [v48 setProperty:@"SENSITIVITY" forKey:v20];
    [v4 addObject:v48];
    [v5 addObject:v48];
    v49 = (void *)MEMORY[0x1E4F92E70];
    v50 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_PRESS_SPEED_DEFAULT", @"Accessibility-D93");
    v51 = [v49 preferenceSpecifierNamed:v50 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v51 setProperty:&unk_1F1F20090 forKey:@"DOUBLE_PRESS_SPEED_VALUE"];
    [v4 addObject:v51];
    [v5 addObject:v51];
    v52 = (void *)MEMORY[0x1E4F92E70];
    v53 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_PRESS_SPEED_SLOW", @"Accessibility-D93");
    v54 = [v52 preferenceSpecifierNamed:v53 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v54 setProperty:&unk_1F1F200A8 forKey:@"DOUBLE_PRESS_SPEED_VALUE"];
    [v4 addObject:v54];
    [v5 addObject:v54];
    v55 = (void *)MEMORY[0x1E4F92E70];
    v56 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_PRESS_SPEED_SLOWER", @"Accessibility-D93");
    v57 = [v55 preferenceSpecifierNamed:v56 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v57 setProperty:&unk_1F1F200C0 forKey:@"DOUBLE_PRESS_SPEED_VALUE"];
    [v4 addObject:v57];
    [v5 addObject:v57];
    v58 = (void *)MEMORY[0x1E4F92E70];
    v59 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_CLICK_SPEED_HEADER", @"Accessibility-D93");
    v60 = [v58 groupSpecifierWithName:v59];

    [v60 setProperty:@"CLICK_SENSITIVITY" forKey:v20];
    [v4 addObject:v60];
    [v5 addObject:v60];
    v61 = (void *)MEMORY[0x1E4F92E70];
    v62 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_CLICK_SPEED_DEFAULT", @"Accessibility-D93");
    v63 = [v61 preferenceSpecifierNamed:v62 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v63 setProperty:&unk_1F1F200D8 forKey:@"DOUBLE_CLICK_SPEED_VALUE"];
    [v4 addObject:v63];
    [v5 addObject:v63];
    v64 = (void *)MEMORY[0x1E4F92E70];
    v65 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_CLICK_SPEED_SLOW", @"Accessibility-D93");
    v66 = [v64 preferenceSpecifierNamed:v65 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v66 setProperty:&unk_1F1F200F0 forKey:@"DOUBLE_CLICK_SPEED_VALUE"];
    [v4 addObject:v66];
    [v5 addObject:v66];
    v67 = (void *)MEMORY[0x1E4F92E70];
    v68 = AXUILocalizedStringForKeyWithTable(@"DOUBLE_CLICK_SPEED_SLOWER", @"Accessibility-D93");
    v69 = [v67 preferenceSpecifierNamed:v68 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v69 setProperty:&unk_1F1F20108 forKey:@"DOUBLE_CLICK_SPEED_VALUE"];
    [v4 addObject:v69];
    [v5 addObject:v69];
    [(AXUISettingsBaseListController *)self setDetailItems:v5];
    v70 = [(AXUICameraButtonController *)self _cameraButtonEnabled:0];
    -[AXUISettingsBaseListController specifiersByRemovingDetailItemsFromOriginalSpecifiers:ifHidden:](self, "specifiersByRemovingDetailItemsFromOriginalSpecifiers:ifHidden:", v4, [v70 BOOLValue] ^ 1);
    v71 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v72 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v76);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v76) = v71;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v76);
  }
  return v3;
}

- (void)willBecomeActive
{
  v4.receiver = self;
  v4.super_class = (Class)AXUICameraButtonController;
  [(AXUICameraButtonController *)&v4 willBecomeActive];
  v3 = [(AXUICameraButtonController *)self _cameraButtonEnabled:0];
  -[AXUISettingsBaseListController setDetailItemsHidden:](self, "setDetailItemsHidden:", [v3 BOOLValue] ^ 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXUICameraButtonController;
  [(AXUICameraButtonController *)&v4 viewWillAppear:a3];
  [(AXUICameraButtonController *)self reloadSpecifiers];
}

- (void)_launchCameraButtonTips:(id)a3
{
  id v6 = [MEMORY[0x1E4F67E60] URLWithTopicID:@"iph0c397b154"];
  objc_super v4 = [MEMORY[0x1E4F67E60] helpViewControllerWithURL:v6];
  [v4 setShowTopicViewOnLoad:1];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v5 setModalPresentationStyle:1];
  [(AXUICameraButtonController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_setLightTouch:(id)a3 specifier:(id)a4
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F482A8]];
  uint64_t v7 = [v5 BOOLValue];

  [v8 setBool:v7 forKey:@"systemOverlay.halfPressGestureEnabled"];
}

- (id)_lightTouch:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F482A8]];
  id v6 = [v5 objectForKey:@"systemOverlay.halfPressGestureEnabled"];
  uint64_t v7 = __UIAccessibilitySafeClass();

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CC38];
  }
  id v9 = v8;

  return v9;
}

- (void)_setSwipe:(id)a3 specifier:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F482A8]];
  uint64_t v7 = [v5 BOOLValue];

  [v8 setBool:v7 forKey:@"systemOverlay.swipeToPresentEnabled"];
}

- (id)_swipe:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F482A8]];
  id v6 = [v5 objectForKey:@"systemOverlay.swipeToPresentEnabled"];
  uint64_t v7 = __UIAccessibilitySafeClass();

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CC38];
  }
  id v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v30 = a4;
  uint64_t v7 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 propertyForKey:@"SENSTIVITY_VALUE"];

    if (v8)
    {
      id v9 = [v7 propertyForKey:@"SENSTIVITY_VALUE"];
      [v9 doubleValue];
      double v11 = v10;
      v12 = [MEMORY[0x1E4F49458] sharedInstance];
      [v12 cameraButtonSensitivity];
      double v14 = vabdd_f64(v11, v13);

LABEL_15:
      [v30 setChecked:v14 < 0.001];
      goto LABEL_16;
    }
    v15 = [v7 propertyForKey:@"DOUBLE_PRESS_SPEED_VALUE"];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1CB18]);
      v17 = (void *)[v16 initWithSuiteName:*MEMORY[0x1E4F482A8]];
      v18 = [v17 objectForKey:@"systemOverlay.menuToggleMaxIntervalMilliseconds"];
      int v19 = [v18 intValue];

      if (v19) {
        int v20 = v19;
      }
      else {
        int v20 = 500;
      }
      v21 = @"DOUBLE_PRESS_SPEED_VALUE";
LABEL_14:
      id v9 = [v7 propertyForKey:v21];
      double v14 = vabdd_f64((double)(int)[v9 intValue], (double)v20);
      goto LABEL_15;
    }
    v22 = [v7 propertyForKey:@"DOUBLE_CLICK_SPEED_VALUE"];

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F1CB18]);
      v24 = (void *)[v23 initWithSuiteName:*MEMORY[0x1E4F482A8]];
      v25 = [v24 objectForKey:@"systemOverlay.doubleClickMaxIntervalMilliseconds"];
      int v26 = [v25 intValue];

      if (v26) {
        int v20 = v26;
      }
      else {
        int v20 = 400;
      }
      v21 = @"DOUBLE_CLICK_SPEED_VALUE";
      goto LABEL_14;
    }
    v27 = [v7 propertyForKey:*MEMORY[0x1E4F93188]];
    int v28 = [v27 isEqualToString:@"AXCameraButtonPracticeCell"];

    if (v28)
    {
      v29 = [MEMORY[0x1E4FB1618] clearColor];
      [v30 setBackgroundColor:v29];
    }
  }
LABEL_16:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXUICameraButtonController;
  [(AXUISettingsSetupCapableListController *)&v26 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(AXUISettingsBaseListController *)self specifierForIndexPath:v6];
  id v8 = [v7 propertyForKey:@"SENSTIVITY_VALUE"];

  if (v8)
  {
    id v9 = [v7 propertyForKey:@"SENSTIVITY_VALUE"];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [MEMORY[0x1E4F49458] sharedInstance];
    [v12 setCameraButtonSensitivity:v11];

    double v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [NSNumber numberWithDouble:v11];
      *(_DWORD *)buf = 138412290;
      int v28 = v14;
      _os_log_impl(&dword_1C39D1000, v13, OS_LOG_TYPE_DEFAULT, "CameraButton: setting camera sensitivity: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v15 = [v7 propertyForKey:@"DOUBLE_PRESS_SPEED_VALUE"];

  if (v15)
  {
    id v16 = [v7 propertyForKey:@"DOUBLE_PRESS_SPEED_VALUE"];
    int v17 = [v16 intValue];

    id v18 = objc_alloc(MEMORY[0x1E4F1CB18]);
    int v19 = [v18 initWithSuiteName:*MEMORY[0x1E4F482A8]];
    double v13 = v19;
    uint64_t v20 = v17;
    v21 = @"systemOverlay.menuToggleMaxIntervalMilliseconds";
LABEL_8:
    [v19 setInteger:v20 forKey:v21];
LABEL_9:

    [(AXUISettingsBaseListController *)self updateTableCheckedSelection:v6];
    goto LABEL_10;
  }
  v22 = [v7 propertyForKey:@"DOUBLE_CLICK_SPEED_VALUE"];

  if (v22)
  {
    id v23 = [v7 propertyForKey:@"DOUBLE_CLICK_SPEED_VALUE"];
    int v24 = [v23 intValue];

    id v25 = objc_alloc(MEMORY[0x1E4F1CB18]);
    int v19 = [v25 initWithSuiteName:*MEMORY[0x1E4F482A8]];
    double v13 = v19;
    uint64_t v20 = v24;
    v21 = @"systemOverlay.doubleClickMaxIntervalMilliseconds";
    goto LABEL_8;
  }
LABEL_10:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXUICameraButtonController *)self specifierAtIndex:[(AXUICameraButtonController *)self indexForIndexPath:v7]];
  id v9 = [v8 propertyForKey:*MEMORY[0x1E4F930A8]];
  uint64_t v10 = objc_opt_class();

  if (v9 == (void *)v10)
  {
    double v12 = 279.0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXUICameraButtonController;
    [(AXUICameraButtonController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double v12 = v11;
  }

  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:*MEMORY[0x1E4F93188]];
  char v6 = [v5 isEqualToString:@"AXCameraButtonPracticeCell"];

  return v6 ^ 1;
}

- (void)_setCameraButtonEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  -[AXUISettingsBaseListController setDetailItemsHidden:](self, "setDetailItemsHidden:", [v5 BOOLValue] ^ 1);
  id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v7 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F482D0]];
  LODWORD(self) = [v5 BOOLValue];

  [v7 setBool:self ^ 1 forKey:@"SBDisableCaptureButton"];
}

- (id)_cameraButtonEnabled:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F482D0]];
  int v6 = [v5 BOOLForKey:@"SBDisableCaptureButton"];

  id v7 = [NSNumber numberWithInt:v6 ^ 1u];
  id v8 = __UIAccessibilitySafeClass();

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CC38];
  }
  id v10 = v9;

  return v10;
}

@end