@interface HSPCManualEntryViewController
- (HSPCManualEntryViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSString)setupCode;
- (PRXAction)continueAction;
- (id)commitConfiguration;
- (id)onCameraButton;
- (void)configureNextViewController:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setNumberOfDigits:(int64_t)a3;
- (void)setSetupCode:(id)a3;
- (void)textDidChange:(id)a3;
@end

@implementation HSPCManualEntryViewController

- (HSPCManualEntryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HSPCManualEntryViewController;
  v9 = [(HSPCManualEntryViewController *)&v17 initWithContentView:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a3);
    objc_storeStrong((id *)&v10->_config, a4);
    v11 = sub_100060C64(@"HSSetupCodeTitleManuallyEnterSetupCode");
    [(HSPCManualEntryViewController *)v10 setTitle:v11];

    v12 = +[UIImage imageNamed:@"HomeKitCode"];
    [(HSPCPasscodeEntryViewController *)v10 setImage:v12];

    [(HSPCManualEntryViewController *)v10 setNumberOfDigits:8];
    [(HSPCPasscodeEntryViewController *)v10 setUseMonospacedFont:1];
    uint64_t v13 = [(HSPCManualEntryViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
    continueAction = v10->_continueAction;
    v10->_continueAction = (PRXAction *)v13;

    [(PRXAction *)v10->_continueAction setEnabled:0];
    id v15 = [(HSPCManualEntryViewController *)v10 addOptionalButtonWithTitleKey:@"HSSetupCodeActionButtonCamera" target:v10 futureSelector:"onCameraButton"];
  }

  return v10;
}

- (id)commitConfiguration
{
  v3 = [(HSPCManualEntryViewController *)self coordinator];
  v4 = [(HSPCManualEntryViewController *)self setupCode];
  v5 = [v3 didReceiveSetupCode:v4 fromViewController:self];
  v6 = [v5 flatMap:&stru_1000AAF70];

  return v6;
}

- (id)onCameraButton
{
  return +[NAFuture futureWithResult:&off_1000B0598];
}

- (void)configureNextViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v6;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setMode:0];
}

- (void)setNumberOfDigits:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HSPCManualEntryViewController;
  [(HSPCPasscodeEntryViewController *)&v14 setNumberOfDigits:a3];
  id v4 = objc_alloc((Class)NSAttributedString);
  uint64_t v5 = [(HSPCPasscodeEntryViewController *)self numberOfDigits];
  v12 = sub_100060D80(@"HSSetupCodeSubtitleFindSetupCodeFormat", @"%ld", v6, v7, v8, v9, v10, v11, v5);
  id v13 = [v4 initWithString:v12];
  [(HSPCPasscodeEntryViewController *)self setFootnote:v13];
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = [a3 text];
  [(HSPCManualEntryViewController *)self setSetupCode:v4];

  id v5 = [(HSPCManualEntryViewController *)self continueAction];
  [v5 setEnabled:1];
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  id v6 = [v5 length];
  id v7 = [v4 numberOfDigits];

  if (v6 != v7)
  {
    [(HSPCManualEntryViewController *)self setSetupCode:0];
    id v8 = [(HSPCManualEntryViewController *)self continueAction];
    [v8 setEnabled:0];
  }
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (void)setSetupCode:(id)a3
{
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end