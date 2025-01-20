@interface DepthSetupFirstController
- (BOOL)legacyButtonStyles;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (DepthSetupFirstController)init;
- (id)_unitString;
- (id)alternateButtonTitle;
- (id)autoLaunchSetting;
- (id)detailString;
- (id)deviceDepthLimit;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation DepthSetupFirstController

- (DepthSetupFirstController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DepthSetupFirstController;
  v2 = [(DepthSetupFirstController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DepthSetupFirstController *)v2 setStyle:74];
  }
  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CHARON_SETUP_TITLE" value:&stru_8300 table:@"Localizable"];

  return v3;
}

- (id)_unitString
{
  v2 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierUnderwaterDepth];
  v3 = _HKGenerateDefaultUnitForQuantityType();

  v4 = [v3 unitString];
  objc_super v5 = +[HKUnit meterUnit];
  v6 = [v5 unitString];
  if ([v4 isEqualToString:v6]) {
    v7 = @"M";
  }
  else {
    v7 = @"FT";
  }
  v8 = v7;

  return v8;
}

- (id)deviceDepthLimit
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  objc_super v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [v5 valueForProperty:NRDevicePropertyAbsoluteDepthLimit];
    v7 = sub_5150();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "DepthSetupFirstController: Depth limit of current device is %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = sub_5150();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_611C(v7);
    }
    v6 = 0;
  }

  return v6;
}

- (id)detailString
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CHARON_SETUP_DETAIL" value:&stru_8300 table:@"Localizable"];

  objc_super v5 = [(DepthSetupFirstController *)self _unitString];
  v6 = +[NSString stringWithFormat:@"CHARON_MAX_DEPTH_%@", v5];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:v6 value:&stru_8300 table:@"Localizable"];

  int v9 = [(DepthSetupFirstController *)self deviceDepthLimit];
  if ([v9 intValue] == 6)
  {
    v10 = sub_5150();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "DepthSetupFirstController: detailString: Shallow use device", buf, 2u);
    }

    uint64_t v11 = +[NSString stringWithFormat:@"CHARON_MAX_DEPTH_SUNDRIFT_%@", v5];

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:v11 value:&stru_8300 table:@"Localizable-Sundrift"];

    v8 = (void *)v13;
    v6 = (void *)v11;
  }
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v8);

  return v14;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CHARON_SUGGESTED_BUTTON_TITLE" value:&stru_8300 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CHARON_ALTERNATE_BUTTON_TITLE" value:&stru_8300 table:@"Localizable"];

  return v3;
}

- (id)imageResource
{
  return @"Depth";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)autoLaunchSetting
{
  autoLaunchSetting = self->_autoLaunchSetting;
  if (!autoLaunchSetting)
  {
    v4 = (CSLPRFDepthAutoLaunchAppSetting *)objc_alloc_init((Class)CSLPRFDepthAutoLaunchAppSetting);
    objc_super v5 = self->_autoLaunchSetting;
    self->_autoLaunchSetting = v4;

    autoLaunchSetting = self->_autoLaunchSetting;
  }

  return autoLaunchSetting;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = [(DepthSetupFirstController *)self autoLaunchSetting];
  [v4 updateSettingsWithBlock:&stru_81E0];

  objc_super v5 = [(DepthSetupFirstController *)self deviceDepthLimit];
  unsigned int v6 = [v5 intValue];
  v7 = sub_5150();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "DepthFirstSetupController: Hiding scuba safety screen for shallow use device", buf, 2u);
    }

    int v9 = [(DepthSetupFirstController *)self miniFlowDelegate];
    [v9 miniFlowStepComplete:self];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "DepthFirstSetupController: Scuba device, presenting safety setup controller", v10, 2u);
    }

    int v9 = [(DepthSetupFirstController *)self miniFlowDelegate];
    [v9 miniFlowStepComplete:self nextControllerClass:objc_opt_class()];
  }
}

- (void)alternateButtonPressed:(id)a3
{
  v4 = [(DepthSetupFirstController *)self autoLaunchSetting];
  [v4 updateSettingsWithBlock:&stru_8200];

  id v5 = [(DepthSetupFirstController *)self miniFlowDelegate];
  [v5 miniFlowStepComplete:self nextControllerClass:objc_opt_class()];
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->miniFlowDelegate);

  objc_storeStrong((id *)&self->_autoLaunchSetting, 0);
}

@end