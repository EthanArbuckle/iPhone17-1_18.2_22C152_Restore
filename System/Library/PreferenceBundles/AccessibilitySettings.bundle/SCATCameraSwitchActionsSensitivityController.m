@interface SCATCameraSwitchActionsSensitivityController
- (AXSwitch)storedSwitch;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)cameraSwitchType;
- (void)_saveSwitchToSettings:(id)a3;
- (void)setCameraSwitchType:(unint64_t)a3;
- (void)setStoredSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATCameraSwitchActionsSensitivityController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(SCATCameraSwitchActionsSensitivityController *)self specifier];
    v6 = [v5 propertyForKey:@"SCATCameraExpressionType"];

    if (v6) {
      -[SCATCameraSwitchActionsSensitivityController setCameraSwitchType:](self, "setCameraSwitchType:", [v6 unsignedIntegerValue]);
    }
    v25 = v6;
    uint64_t v26 = v3;
    v7 = [(SCATCameraSwitchActionsSensitivityController *)self specifier];
    v8 = [v7 propertyForKey:@"StoredCameraSwitch"];
    [(SCATCameraSwitchActionsSensitivityController *)self setStoredSwitch:v8];

    v9 = [(SCATCameraSwitchActionsSensitivityController *)self storedSwitch];
    if (![v9 expressionSensitivity])
    {
      [v9 setExpressionSensitivity:2];
      [(SCATCameraSwitchActionsSensitivityController *)self _saveSwitchToSettings:v9];
    }
    v24 = v9;
    v10 = objc_opt_new();
    v11 = +[PSSpecifier emptyGroupSpecifier];
    v12 = AXParameterizedLocalizedString();
    [v11 setProperty:v12 forKey:PSFooterTextGroupKey];

    v23 = v11;
    [v10 addObject:v11];
    v13 = +[AXSSMotionTracker supportedExpressionSensitivitiesAscending];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v18 unsignedIntegerValue];
          v19 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpressionSensitivity();
          v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v20 setProperty:v18 forKey:@"CameraExpressionSensitivity"];
          [v10 addObject:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }
    v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v26];
    *(void *)&self->AXUISettingsBaseListController_opaque[v26] = v10;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v26];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCameraSwitchActionsSensitivityController;
  [(SCATCameraSwitchActionsSensitivityController *)&v4 viewWillAppear:a3];
  [(SCATCameraSwitchActionsSensitivityController *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SCATCameraSwitchActionsSensitivityController;
  id v6 = a4;
  v7 = [(SCATCameraSwitchActionsSensitivityController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[SCATCameraSwitchActionsSensitivityController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);

  v9 = [v8 propertyForKey:@"CameraExpressionSensitivity"];
  id v10 = [v9 unsignedIntegerValue];

  v11 = [(SCATCameraSwitchActionsSensitivityController *)self storedSwitch];
  v12 = v11;
  if (v11) {
    objc_msgSend(v7, "setChecked:", objc_msgSend(v11, "expressionSensitivity") == v10);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCATCameraSwitchActionsSensitivityController;
  [(SCATCameraSwitchActionsSensitivityController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(SCATCameraSwitchActionsSensitivityController *)self specifierAtIndexPath:v6];
  v8 = [v7 propertyForKey:@"CameraExpressionSensitivity"];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = [(SCATCameraSwitchActionsSensitivityController *)self storedSwitch];
  v11 = v10;
  if (v10 && [v10 expressionSensitivity] != v9)
  {
    [v11 setExpressionSensitivity:v9];
    [(SCATCameraSwitchActionsSensitivityController *)self _saveSwitchToSettings:v11];
  }
  [(SCATCameraSwitchActionsSensitivityController *)self updateTableCheckedSelection:v6];
}

- (void)_saveSwitchToSettings:(id)a3
{
}

- (unint64_t)cameraSwitchType
{
  return self->_cameraSwitchType;
}

- (void)setCameraSwitchType:(unint64_t)a3
{
  self->_cameraSwitchType = a3;
}

- (AXSwitch)storedSwitch
{
  return self->_storedSwitch;
}

- (void)setStoredSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end