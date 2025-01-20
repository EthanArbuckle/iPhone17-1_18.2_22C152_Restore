@interface ASAccessoryInfoViewFactory
+ (id)forgetDeviceAlertBody;
+ (id)forgetDeviceAlertCancel;
+ (id)forgetDeviceAlertConfirm;
+ (id)forgetDeviceAlertTitle;
+ (id)forgetDeviceButtonTitle;
+ (id)infoViewControllerFromDevice:(id)a3;
@end

@implementation ASAccessoryInfoViewFactory

+ (id)infoViewControllerFromDevice:(id)a3
{
  id v3 = a3;
  if (gLogCategory_ASAccessoryInfoView <= 15
    && (gLogCategory_ASAccessoryInfoView != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = [[ASAccessoryInfoViewController alloc] initWithDevice:v3];

  return v4;
}

+ (id)forgetDeviceButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Forget Device" value:&stru_26F86DD88 table:0];

  return v3;
}

+ (id)forgetDeviceAlertTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Forget Device Title" value:&stru_26F86DD88 table:0];

  return v3;
}

+ (id)forgetDeviceAlertBody
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Forget Device Message" value:&stru_26F86DD88 table:0];

  return v3;
}

+ (id)forgetDeviceAlertConfirm
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Forget Device Confirm" value:&stru_26F86DD88 table:0];

  return v3;
}

+ (id)forgetDeviceAlertCancel
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Cancel" value:&stru_26F86DD88 table:0];

  return v3;
}

@end