@interface WiFiSetupView
- (WiFiSetupView)initWithFrame:(CGRect)a3;
@end

@implementation WiFiSetupView

- (WiFiSetupView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)WiFiSetupView;
  v3 = -[SetupView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = NSString;
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"CONNECT_OVER_WIFI_LABEL" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    int v7 = MGGetBoolAnswer();
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    if (v7) {
      v10 = @"WIFI_CH";
    }
    else {
      v10 = @"WIFI_UPPERCASE";
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v12 = objc_msgSend(v4, "stringWithFormat:", v6, v11);
    [(SetupView *)v3 setTitle:v12];

    v13 = (void *)MEMORY[0x263F827E8];
    v14 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:2 scale:30.0];
    v15 = [v13 _systemImageNamed:@"wifi" withConfiguration:v14];
    [(SetupView *)v3 setIcon:v15];

    v16 = NSString;
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"CONNECT_OVER_WIFI_STEP_1" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v19 = WMSGetCurrentDeviceName();
    int v20 = MGGetBoolAnswer();
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = v21;
    if (v20) {
      v23 = @"WIFI_CH";
    }
    else {
      v23 = @"WIFI";
    }
    v24 = [v21 localizedStringForKey:v23 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    v25 = objc_msgSend(v16, "stringWithFormat:", v18, v19, v24);
    [(SetupView *)v3 addStep:v25];

    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"CONNECT_OVER_WIFI_STEP_2" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    [(SetupView *)v3 addStep:v27];
  }
  return v3;
}

@end