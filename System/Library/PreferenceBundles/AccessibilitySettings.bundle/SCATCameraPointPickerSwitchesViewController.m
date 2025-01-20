@interface SCATCameraPointPickerSwitchesViewController
- (NSArray)actionSpecifiers;
- (NSArray)modeSpecifiers;
- (NSArray)sensitivitySpecifiers;
- (PSSpecifier)cameraSwitchSpecifier;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)_actionForSpecifier:(id)a3;
- (id)_axSwitchWithType:(unint64_t)a3;
- (id)_customizationSpecifiers;
- (id)_setupSpecifiersForExpressions:(id)a3;
- (id)cameraSwitchEnabled:(id)a3;
- (id)modeSummary:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)unitsStringForSpecifier:(id)a3;
- (void)setActionSpecifiers:(id)a3;
- (void)setCameraSwitchEnabled:(id)a3 specifier:(id)a4;
- (void)setCameraSwitchSpecifier:(id)a3;
- (void)setModeSpecifiers:(id)a3;
- (void)setSensitivitySpecifiers:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATCameraPointPickerSwitchesViewController

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATCameraPointPickerSwitchesViewController;
  [(SCATCameraPointPickerSwitchesViewController *)&v6 viewWillAppear:a3];
  v4 = AXParameterizedLocalizedString();
  v5 = [(SCATCameraPointPickerSwitchesViewController *)self navigationItem];
  [v5 setTitle:v4];

  [(SCATCameraPointPickerSwitchesViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = AXParameterizedLocalizedString();
    uint64_t v33 = PSFooterTextGroupKey;
    objc_msgSend(v6, "setProperty:forKey:", v7);

    v36 = v6;
    [v5 addObject:v6];
    v8 = AXParameterizedLocalizedString();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setCameraSwitchEnabled:specifier:" get:"cameraSwitchEnabled:" detail:0 cell:6 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"CameraPointPickerSwitcher" forKey:PSIDKey];
    [v9 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [(SCATCameraPointPickerSwitchesViewController *)self setCameraSwitchSpecifier:v9];
    [v5 addObject:v9];
    v11 = AXParameterizedLocalizedString();
    uint64_t v12 = +[PSSpecifier groupSpecifierWithName:v11];

    v13 = AXParameterizedLocalizedString();
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"modeSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:@"CameraPointPickerMode" forKey:v10];
    v34 = v14;
    v35 = (void *)v12;
    v38[0] = v12;
    v38[1] = v14;
    v15 = +[NSArray arrayWithObjects:v38 count:2];
    [(SCATCameraPointPickerSwitchesViewController *)self setModeSpecifiers:v15];

    v16 = +[AXSwitch expressionToSwitchTypeMapping];
    v17 = [(SCATCameraPointPickerSwitchesViewController *)self _setupSpecifiersForExpressions:v16];

    v18 = AXParameterizedLocalizedString();
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"_actionForSpecifier:" detail:0 cell:2 edit:0];

    v20 = [(SCATCameraPointPickerSwitchesViewController *)self _axSwitchWithType:9];
    [v19 setProperty:v20 forKey:@"SCATCameraSwitch"];

    [v19 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v17 addObject:v19];
    if ([v17 count])
    {
      v21 = AXParameterizedLocalizedString();
      v22 = +[PSSpecifier groupSpecifierWithName:v21];
      [v17 insertObject:v22 atIndex:0];

      [(SCATCameraPointPickerSwitchesViewController *)self setActionSpecifiers:v17];
    }
    v23 = AXParameterizedLocalizedString();
    v24 = +[PSSpecifier groupSpecifierWithName:v23];

    v25 = AXParameterizedLocalizedString();
    [v24 setProperty:v25 forKey:v33];

    v26 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:"stringValueForSpecifier:" detail:0 cell:4 edit:0];
    [v26 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v26 setProperty:@"CameraPointPickerSensitivity" forKey:v10];
    v37[0] = v24;
    v37[1] = v26;
    v27 = +[NSArray arrayWithObjects:v37 count:2];
    [(SCATCameraPointPickerSwitchesViewController *)self setSensitivitySpecifiers:v27];

    v28 = +[AXSettings sharedInstance];
    unsigned int v29 = [v28 switchControlUseCameraForPointMode];

    if (v29)
    {
      v30 = [(SCATCameraPointPickerSwitchesViewController *)self _customizationSpecifiers];
      [v5 addObjectsFromArray:v30];
    }
    v31 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)_setupSpecifiersForExpressions:(id)a3
{
  id v4 = a3;
  id v24 = +[NSMutableArray array];
  v5 = +[AXSSMotionTracker supportedExpressions];
  objc_super v6 = [v5 allObjects];
  v7 = [v6 sortedArrayUsingSelector:"compare:"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    uint64_t v23 = PSEnabledKey;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v13 = [v12 unsignedIntValue];
        v14 = [v4 objectForKeyedSubscript:v12];

        if (v14)
        {
          v15 = [v4 objectForKeyedSubscript:v12];
          uint64_t v16 = [v15 unsignedIntValue];

          v17 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
          v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"_actionForSpecifier:" detail:0 cell:2 edit:0];

          v19 = [(SCATCameraPointPickerSwitchesViewController *)self _axSwitchWithType:v16];
          [v18 setProperty:v19 forKey:@"SCATCameraSwitch"];

          v20 = +[NSNumber numberWithUnsignedInteger:v13];
          [v18 setProperty:v20 forKey:@"SCATCameraExpressionType"];

          [v18 setProperty:&__kCFBooleanTrue forKey:v23];
          [v24 addObject:v18];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v24;
}

- (id)_customizationSpecifiers
{
  uint64_t v3 = [(SCATCameraPointPickerSwitchesViewController *)self actionSpecifiers];
  id v4 = [(SCATCameraPointPickerSwitchesViewController *)self modeSpecifiers];
  v5 = [(SCATCameraPointPickerSwitchesViewController *)self sensitivitySpecifiers];
  objc_super v6 = +[NSArray axArrayWithPossiblyNilArrays:](NSArray, "axArrayWithPossiblyNilArrays:", 3, v3, v4, v5);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCATCameraPointPickerSwitchesViewController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:@"SCATCameraSwitch"];
  if (v9)
  {
    uint64_t v10 = [[SCATCameraSwitchActionsController alloc] initWithSwitch:v9];
    [(SCATCameraSwitchActionsController *)v10 setParentController:self];
    v11 = [(SCATCameraPointPickerSwitchesViewController *)self rootController];
    [(SCATCameraSwitchActionsController *)v10 setRootController:v11];

    uint64_t v12 = AXParameterizedLocalizedString();
    unsigned int v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(SCATCameraSwitchActionsController *)v10 setSpecifier:v13];

    v14 = [v8 propertyForKey:@"SCATCameraExpressionType"];

    if (v14)
    {
      v15 = [v8 propertyForKey:@"SCATCameraExpressionType"];
      [v15 unsignedIntegerValue];

      uint64_t v16 = AXSSHumanReadableExplanationForMotionTrackingFacialExpression();
    }
    else
    {
      if ([v9 cameraSwitch] != (char *)&dword_8 + 1)
      {
LABEL_9:
        [(SCATCameraPointPickerSwitchesViewController *)self showController:v10 animate:1];

        goto LABEL_10;
      }
      uint64_t v16 = AXParameterizedLocalizedString();
    }
    v19 = (void *)v16;
    [(SCATCameraSwitchActionsController *)v10 setFooterText:v16];

    goto LABEL_9;
  }
  v17 = [v8 propertyForKey:PSIDKey];
  unsigned int v18 = [v17 isEqualToString:@"CameraPointPickerMode"];

  if (v18)
  {
    v20.receiver = self;
    v20.super_class = (Class)SCATCameraPointPickerSwitchesViewController;
    [(SCATCameraPointPickerSwitchesViewController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  }
LABEL_10:
}

- (id)_actionForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"SCATCameraSwitch"];
  id v4 = [v3 shortcutIdentifier];

  if (v4)
  {
    v5 = +[AXSiriShortcutsManager sharedManager];
    id v6 = [v3 shortcutIdentifier];
    id v7 = [v5 shortcutForIdentifier:v6];
    id v8 = [v7 shortcutName];
  }
  else
  {
    if ([v3 action]) {
      SCATLocStringForAction();
    }
    else {
    id v8 = AXParameterizedLocalizedString();
    }
  }

  return v8;
}

- (id)_axSwitchWithType:(unint64_t)a3
{
  id v4 = +[AXSettings sharedInstance];
  v5 = [v4 assistiveTouchCameraPointPickerSwitches];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v8 = SCATSwitchSourceMotionTracker;
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      unsigned int v13 = objc_msgSend(v12, "source", (void)v17);
      if ([v13 isEqualToString:v8])
      {
        id v14 = [v12 cameraSwitch];

        if (v14 == (id)a3)
        {
          id v15 = v12;

          if (v15) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
      }
      else
      {
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_14:
  +[AXSwitch switchWithAction:name:source:type:](AXSwitch, "switchWithAction:name:source:type:", 0, 0, v8, SCATSwitchTypeOptional, (void)v17);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 setCameraSwitch:a3];
  [v15 setExpressionSensitivity:2];
LABEL_15:

  return v15;
}

- (id)cameraSwitchEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlUseCameraForPointMode]);

  return v4;
}

- (void)setCameraSwitchEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 switchControlUseCameraForPointMode];

  if (v5 != v7)
  {
    uint64_t v8 = +[AXSettings sharedInstance];
    [v8 setSwitchControlUseCameraForPointMode:v5];

    id v10 = [(SCATCameraPointPickerSwitchesViewController *)self _customizationSpecifiers];
    if (v5)
    {
      id v9 = [(SCATCameraPointPickerSwitchesViewController *)self cameraSwitchSpecifier];
      [(SCATCameraPointPickerSwitchesViewController *)self insertContiguousSpecifiers:v10 afterSpecifier:v9 animated:1];
    }
    else
    {
      [(SCATCameraPointPickerSwitchesViewController *)self removeContiguousSpecifiers:v10 animated:1];
    }
  }
}

- (id)modeSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 switchControlCameraPointPickerMode];
  id v4 = AXSSHumanReadableDescriptionForMotionTrackingMode();

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerSensitivity"];

  double v5 = 0.0;
  if (v4)
  {
    id v6 = +[AXSettings sharedInstance];
    [v6 switchControlCameraPointPickerSensitivity];
    double v5 = (double)switchControlUserPreferenceForNormalizedHeadTrackingSensitivity();
  }
  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  double v5 = [a3 propertyForKey:PSIDKey];
  unsigned int v6 = [v5 isEqualToString:@"CameraPointPickerSensitivity"];

  if (v6)
  {
    unsigned int v7 = +[AXSettings sharedInstance];
    [v7 switchControlCameraPointPickerSensitivity];
    uint64_t v8 = switchControlUserPreferenceForNormalizedHeadTrackingSensitivity();

    if ((double)v8 != a4)
    {
      switchControlNormalizedHeadTrackingSensitivityForUserPreference();
      double v10 = v9;
      id v11 = +[AXSettings sharedInstance];
      [v11 setSwitchControlCameraPointPickerSensitivity:v10];
    }
  }
}

- (double)stepValueForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerSensitivity"];

  double result = 0.0;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (double)minimumValueForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerSensitivity"];

  double result = (double)kSwitchControlHeadTrackingSensitivityMinUserPreference;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (double)maximumValueForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerSensitivity"];

  double result = (double)kSwitchControlHeadTrackingSensitivityMaxUserPreference;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (id)unitsStringForSpecifier:(id)a3
{
  return &stru_20F6B8;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(SCATCameraPointPickerSwitchesViewController *)self valueForSpecifier:a3];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned int v4 = AXFormatNumberWithOptions();

  return v4;
}

- (NSArray)actionSpecifiers
{
  return self->_actionSpecifiers;
}

- (void)setActionSpecifiers:(id)a3
{
}

- (NSArray)modeSpecifiers
{
  return self->_modeSpecifiers;
}

- (void)setModeSpecifiers:(id)a3
{
}

- (NSArray)sensitivitySpecifiers
{
  return self->_sensitivitySpecifiers;
}

- (void)setSensitivitySpecifiers:(id)a3
{
}

- (PSSpecifier)cameraSwitchSpecifier
{
  return self->_cameraSwitchSpecifier;
}

- (void)setCameraSwitchSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_sensitivitySpecifiers, 0);
  objc_storeStrong((id *)&self->_modeSpecifiers, 0);

  objc_storeStrong((id *)&self->_actionSpecifiers, 0);
}

@end