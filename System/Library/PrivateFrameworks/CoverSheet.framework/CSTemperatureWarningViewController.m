@interface CSTemperatureWarningViewController
- (CSTemperatureWarningViewController)initWithThermalStatusProvider:(id)a3;
- (int64_t)presentationPriority;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)handleSecondaryActionForView:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSTemperatureWarningViewController

- (CSTemperatureWarningViewController)initWithThermalStatusProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSTemperatureWarningViewController;
  v6 = [(CSTemperatureWarningViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_thermalStatusProvider, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(CSModalViewControllerBase *)self view];
  [v4 setShowsDateView:0];
  id v5 = [v3 localizedStringForKey:@"IPHONE_TOO_HOT" value:&stru_1F3020248 table:@"CoverSheet"];
  [v4 setTitleText:v5];

  v6 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"THERMAL_ALERT_STRING"];
  v7 = [v3 localizedStringForKey:v6 value:&stru_1F3020248 table:@"CoverSheet"];
  [v4 setSubtitleText:v7];

  v8 = [v3 localizedStringForKey:@"DASHBOARD_BLOCK_EMERGENCY_BUTTON" value:&stru_1F3020248 table:@"CoverSheet"];
  [v4 setSecondaryActionButtonText:v8];

  objc_super v9 = objc_msgSend((id)objc_opt_class(), "thermometerGlyphForThermalStatus:", (-[CSThermalStatusProviding thermalStatus](self->_thermalStatusProvider, "thermalStatus") >> 63) | 1);
  [v4 setImage:v9];

  v10.receiver = self;
  v10.super_class = (Class)CSTemperatureWarningViewController;
  [(CSModalViewControllerBase *)&v10 viewDidLoad];
}

- (void)aggregateAppearance:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CSTemperatureWarningViewController;
  id v4 = a3;
  [(CSModalViewControllerBase *)&v19 aggregateAppearance:v4];
  id v5 = +[CSComponent statusBar];
  v6 = [v5 priority:80];
  v7 = [v6 hidden:0];
  [v4 addComponent:v7];

  v8 = +[CSComponent homeAffordance];
  objc_super v9 = [v8 priority:80];
  objc_super v10 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  v11 = [v9 identifier:v10];
  v12 = [v11 hidden:1];
  [v4 addComponent:v12];

  v13 = +[CSComponent proudLock];
  v14 = [v13 priority:80];
  v15 = [v14 hidden:1];
  [v4 addComponent:v15];

  v16 = +[CSComponent whitePoint];
  v17 = [v16 priority:80];
  v18 = [v17 hidden:1];
  [v4 addComponent:v18];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSTemperatureWarningViewController;
  id v3 = a3;
  [(CSModalViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "addRestrictedCapabilities:", 1048632, v4.receiver, v4.super_class);
}

- (int64_t)presentationPriority
{
  return 580;
}

- (void)handleSecondaryActionForView:(id)a3
{
  id v4 = +[CSAction actionWithType:2];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];
}

- (void).cxx_destruct
{
}

@end