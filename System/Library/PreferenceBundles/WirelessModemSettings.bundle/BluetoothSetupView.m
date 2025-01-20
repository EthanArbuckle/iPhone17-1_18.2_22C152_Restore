@interface BluetoothSetupView
- (BluetoothSetupView)initWithFrame:(CGRect)a3;
@end

@implementation BluetoothSetupView

- (BluetoothSetupView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)BluetoothSetupView;
  v3 = -[SetupView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"CONNECT_OVER_BLUETOOTH_LABEL" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    [(SetupView *)v3 setTitle:v5];

    v6 = (void *)MEMORY[0x263F827E8];
    v7 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:2 scale:30.0];
    v8 = [v6 _systemImageNamed:@"bluetooth" withConfiguration:v7];
    [(SetupView *)v3 setIcon:v8];

    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = NSString;
    v11 = [MEMORY[0x263F82670] currentDevice];
    v12 = [v11 model];
    v13 = [v12 uppercaseString];
    v14 = [v10 stringWithFormat:@"%@_%@", @"CONNECT_OVER_BLUETOOTH_STEP_1", v13];
    v15 = [v9 localizedStringForKey:v14 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    [(SetupView *)v3 addStep:v15];

    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = NSString;
    v18 = [MEMORY[0x263F82670] currentDevice];
    v19 = [v18 model];
    v20 = [v19 uppercaseString];
    v21 = [v17 stringWithFormat:@"%@_%@", @"CONNECT_OVER_BLUETOOTH_STEP_2", v20];
    v22 = [v16 localizedStringForKey:v21 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    [(SetupView *)v3 addStep:v22];

    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = NSString;
    v25 = [MEMORY[0x263F82670] currentDevice];
    v26 = [v25 model];
    v27 = [v26 uppercaseString];
    v28 = [v24 stringWithFormat:@"%@_%@", @"CONNECT_OVER_BLUETOOTH_STEP_3", v27];
    v29 = [v23 localizedStringForKey:v28 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    [(SetupView *)v3 addStep:v29];
  }
  return v3;
}

@end