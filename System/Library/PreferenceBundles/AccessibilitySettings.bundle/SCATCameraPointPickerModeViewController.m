@interface SCATCameraPointPickerModeViewController
- (NSArray)modesSpecifiers;
- (NSArray)movementToleranceSpecifiers;
- (NSDictionary)modeToFooterTextExplanation;
- (PSSpecifier)trackingModeGroup;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unitsStringForSpecifier:(id)a3;
- (void)_updateFooterTextForMode:(unint64_t)a3;
- (void)setModeToFooterTextExplanation:(id)a3;
- (void)setModesSpecifiers:(id)a3;
- (void)setMovementToleranceSpecifiers:(id)a3;
- (void)setTrackingModeGroup:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation SCATCameraPointPickerModeViewController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATCameraPointPickerModeViewController;
  [(SCATCameraPointPickerModeViewController *)&v5 viewWillAppear:a3];
  v4 = +[AXSettings sharedInstance];
  -[SCATCameraPointPickerModeViewController _updateFooterTextForMode:](self, "_updateFooterTextForMode:", [v4 switchControlCameraPointPickerMode]);
}

- (void)willBecomeActive
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCameraPointPickerModeViewController;
  [(SCATCameraPointPickerModeViewController *)&v4 willBecomeActive];
  v3 = +[AXSettings sharedInstance];
  -[SCATCameraPointPickerModeViewController _updateFooterTextForMode:](self, "_updateFooterTextForMode:", [v3 switchControlCameraPointPickerMode]);
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v33 = OBJC_IVAR___PSListController__specifiers;
    v34 = self;
    v31 = +[NSMutableArray array];
    objc_super v4 = AXParameterizedLocalizedString();
    uint64_t v5 = +[PSSpecifier groupSpecifierWithName:v4];

    v32 = (void *)v5;
    v6 = +[NSMutableArray arrayWithObject:v5];
    v35 = +[NSMutableDictionary dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = [&off_22BE70 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(&off_22BE70);
          }
          id v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) unsignedIntegerValue];
          v12 = AXSSHumanReadableDescriptionForMotionTrackingMode();
          v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v14 = +[NSNumber numberWithUnsignedInteger:v11];
          [v13 setProperty:v14 forKey:@"CameraPointPickerMode"];

          [v6 axSafelyAddObject:v13];
          v15 = AXSSHumanReadableExplanationForMotionTrackingMode();
          if (v15)
          {
            v16 = +[NSNumber numberWithUnsignedInteger:v11];
            [v35 setObject:v15 forKey:v16];
          }
        }
        id v8 = [&off_22BE70 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v8);
    }
    id v17 = [v35 copy];
    [(SCATCameraPointPickerModeViewController *)v34 setModeToFooterTextExplanation:v17];

    [(SCATCameraPointPickerModeViewController *)v34 setTrackingModeGroup:v32];
    id v18 = [v6 copy];
    [(SCATCameraPointPickerModeViewController *)v34 setModesSpecifiers:v18];

    v19 = [(SCATCameraPointPickerModeViewController *)v34 modesSpecifiers];
    [v31 addObjectsFromArray:v19];

    v20 = +[NSMutableArray array];
    v21 = AXParameterizedLocalizedString();
    v22 = +[PSSpecifier groupSpecifierWithName:v21];

    v23 = AXParameterizedLocalizedString();
    [v22 setProperty:v23 forKey:PSFooterTextGroupKey];

    [v20 addObject:v22];
    v24 = +[PSSpecifier preferenceSpecifierNamed:0 target:v34 set:0 get:"stringValueForSpecifier:" detail:0 cell:4 edit:0];
    [v24 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v24 setProperty:@"CameraPointPickerMovementTolerance" forKey:PSIDKey];
    [v20 addObject:v24];
    id v25 = [v20 copy];
    [(SCATCameraPointPickerModeViewController *)v34 setMovementToleranceSpecifiers:v25];

    v26 = +[AXSettings sharedInstance];
    v27 = (char *)[v26 switchControlCameraPointPickerMode];

    if (v27 == (unsigned char *)&dword_0 + 1)
    {
      v28 = [(SCATCameraPointPickerModeViewController *)v34 movementToleranceSpecifiers];
      [v31 addObjectsFromArray:v28];
    }
    v29 = *(void **)&v34->AXUISettingsBaseListController_opaque[v33];
    *(void *)&v34->AXUISettingsBaseListController_opaque[v33] = v31;

    v3 = *(void **)&v34->AXUISettingsBaseListController_opaque[v33];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SCATCameraPointPickerModeViewController;
  objc_super v4 = [(SCATCameraPointPickerModeViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 specifier];
  v6 = [v5 propertyForKey:@"CameraPointPickerMode"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 integerValue];
    uint64_t v9 = +[AXSettings sharedInstance];
    objc_msgSend(v4, "setChecked:", objc_msgSend(v9, "switchControlCameraPointPickerMode") == v8);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCATCameraPointPickerModeViewController *)self specifierForIndexPath:v7];
  uint64_t v9 = [v8 propertyForKey:@"CameraPointPickerMode"];
  if (v9)
  {
    [(SCATCameraPointPickerModeViewController *)self beginUpdates];
    v20.receiver = self;
    v20.super_class = (Class)SCATCameraPointPickerModeViewController;
    [(SCATCameraPointPickerModeViewController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
    v10 = (char *)[v9 integerValue];
    [(SCATCameraPointPickerModeViewController *)self _updateFooterTextForMode:v10];
    objc_super v11 = +[AXSettings sharedInstance];
    v12 = (char *)[v11 switchControlCameraPointPickerMode];

    v13 = +[AXSettings sharedInstance];
    v14 = (char *)[v13 switchControlCameraPointPickerMode];

    v15 = +[AXSettings sharedInstance];
    [v15 setSwitchControlCameraPointPickerMode:v10];

    [(SCATCameraPointPickerModeViewController *)self updateTableCheckedSelection:v7];
    if (v10 != (unsigned char *)&dword_0 + 1 || v12 == (unsigned char *)&dword_0 + 1)
    {
      if (v10 == (unsigned char *)&dword_0 + 1 || v14 != (unsigned char *)&dword_0 + 1) {
        goto LABEL_9;
      }
      id v17 = [(SCATCameraPointPickerModeViewController *)self movementToleranceSpecifiers];
      [(SCATCameraPointPickerModeViewController *)self removeContiguousSpecifiers:v17 animated:1];
    }
    else
    {
      v16 = [(SCATCameraPointPickerModeViewController *)self movementToleranceSpecifiers];
      id v17 = +[NSArray axArrayWithPossiblyNilArrays:](NSArray, "axArrayWithPossiblyNilArrays:", 1, v16);

      id v18 = [(SCATCameraPointPickerModeViewController *)self modesSpecifiers];
      v19 = [v18 lastObject];
      [(SCATCameraPointPickerModeViewController *)self insertContiguousSpecifiers:v17 afterSpecifier:v19 animated:1];
    }
LABEL_9:
    [(SCATCameraPointPickerModeViewController *)self endUpdates];
  }
}

- (void)_updateFooterTextForMode:(unint64_t)a3
{
  uint64_t v5 = [(SCATCameraPointPickerModeViewController *)self modeToFooterTextExplanation];
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [v5 objectForKey:v6];

  id v7 = [(SCATCameraPointPickerModeViewController *)self trackingModeGroup];
  [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

  id v8 = [(SCATCameraPointPickerModeViewController *)self trackingModeGroup];
  [(SCATCameraPointPickerModeViewController *)self reloadSpecifier:v8 animated:1];
}

- (double)valueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerMovementTolerance"];

  double v5 = 0.0;
  if (v4)
  {
    id v6 = +[AXSettings sharedInstance];
    [v6 switchControlCameraPointPickerMovementToleranceInJoystickMode];
    double v5 = (double)switchControlUserPreferenceForNormalizedHeadTrackingMovementToleranceInJoystickMode();
  }
  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  double v5 = [a3 propertyForKey:PSIDKey];
  unsigned int v6 = [v5 isEqualToString:@"CameraPointPickerMovementTolerance"];

  if (v6)
  {
    id v7 = +[AXSettings sharedInstance];
    [v7 switchControlCameraPointPickerMovementToleranceInJoystickMode];
    uint64_t v8 = switchControlUserPreferenceForNormalizedHeadTrackingMovementToleranceInJoystickMode();

    if ((double)v8 != a4)
    {
      switchControlNormalizedHeadTrackingMovementToleranceInJoystickModeForUserPreference();
      double v10 = v9;
      id v11 = +[AXSettings sharedInstance];
      [v11 setSwitchControlCameraPointPickerMovementToleranceInJoystickMode:v10];
    }
  }
}

- (double)stepValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerMovementTolerance"];

  double result = 0.0;
  if (v4) {
    return 5.0;
  }
  return result;
}

- (double)minimumValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerMovementTolerance"];

  double result = (double)kSwitchControlHeadTrackingMovementToleranceInJoystickModeMinUserPreference;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (double)maximumValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"CameraPointPickerMovementTolerance"];

  double result = (double)kSwitchControlHeadTrackingMovementToleranceInJoystickModeMaxUserPreference;
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
  [(SCATCameraPointPickerModeViewController *)self valueForSpecifier:a3];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned int v4 = AXFormatNumberWithOptions();

  return v4;
}

- (NSArray)modesSpecifiers
{
  return self->_modesSpecifiers;
}

- (void)setModesSpecifiers:(id)a3
{
}

- (NSArray)movementToleranceSpecifiers
{
  return self->_movementToleranceSpecifiers;
}

- (void)setMovementToleranceSpecifiers:(id)a3
{
}

- (PSSpecifier)trackingModeGroup
{
  return self->_trackingModeGroup;
}

- (void)setTrackingModeGroup:(id)a3
{
}

- (NSDictionary)modeToFooterTextExplanation
{
  return self->_modeToFooterTextExplanation;
}

- (void)setModeToFooterTextExplanation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeToFooterTextExplanation, 0);
  objc_storeStrong((id *)&self->_trackingModeGroup, 0);
  objc_storeStrong((id *)&self->_movementToleranceSpecifiers, 0);

  objc_storeStrong((id *)&self->_modesSpecifiers, 0);
}

@end