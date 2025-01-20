@interface SCATCameraSwitchActionsDwellController
- (ASTDwellMovementToleranceHelper)_dwellMovementToleranceHelper;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (void)set_dwellMovementToleranceHelper:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation SCATCameraSwitchActionsDwellController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = AXParameterizedLocalizedString();
    v7 = +[PSSpecifier groupSpecifierWithName:v6];

    v8 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    v20[0] = v7;
    v20[1] = v8;
    v9 = +[NSArray arrayWithObjects:v20 count:2];
    [v5 addObjectsFromArray:v9];

    v10 = [(SCATCameraSwitchActionsDwellController *)self _dwellMovementToleranceHelper];

    if (!v10)
    {
      v11 = [[ASTDwellMovementToleranceHelper alloc] initWithClientType:1];
      [(SCATCameraSwitchActionsDwellController *)self set_dwellMovementToleranceHelper:v11];

      v12 = [(SCATCameraSwitchActionsDwellController *)self _dwellMovementToleranceHelper];
      [v12 setSettingsController:self];

      v13 = settingsLocString(@"MOUSE_POINTER_DWELL_TOLERANCE", @"HandSettings");
      v14 = [(SCATCameraSwitchActionsDwellController *)self _dwellMovementToleranceHelper];
      [v14 setToleranceSpecifierGroupTitle:v13];
    }
    v15 = [(SCATCameraSwitchActionsDwellController *)self _dwellMovementToleranceHelper];
    v16 = [v15 dwellSpecifiers];
    [v5 axSafelyAddObjectsFromArray:v16];

    id v17 = [v5 copy];
    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v17;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 switchControlCameraPointPickerDwellActivationTimeout];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlCameraPointPickerDwellActivationTimeout:a4];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.25;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return kAXSSwitchControlHeadTrackingDwellActivationTimeoutMin;
}

- (double)maximumValueForSpecifier:(id)a3
{
  return kAXSSwitchControlHeadTrackingDwellActivationTimeoutMax;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(SCATCameraSwitchActionsDwellController *)self valueForSpecifier:a3];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

- (ASTDwellMovementToleranceHelper)_dwellMovementToleranceHelper
{
  return self->__dwellMovementToleranceHelper;
}

- (void)set_dwellMovementToleranceHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end