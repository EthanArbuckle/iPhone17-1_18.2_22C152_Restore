@interface DKScreenTimePasscodeViewController
- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4;
- (DKScreenTimePasscodeViewController)initWithDeviceName:(id)a3;
- (id)completionButtonTitleForPasscodeViewController:(id)a3;
- (id)passcodeVerified;
- (id)verifyPasscode;
- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4;
- (void)setPasscodeVerified:(id)a3;
- (void)setVerifyPasscode:(id)a3;
@end

@implementation DKScreenTimePasscodeViewController

- (DKScreenTimePasscodeViewController)initWithDeviceName:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"SCREEN_TIME_PASSCODE_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  v8 = NSString;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"SCREEN_TIME_PASSCODE_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];
  v11 = objc_msgSend(v8, "stringWithFormat:", v10, v5);

  v15.receiver = self;
  v15.super_class = (Class)DKScreenTimePasscodeViewController;
  v12 = [(DKScreenTimePasscodeViewController *)&v15 initWithTitle:v7 detailText:v11 icon:0 contentLayout:2];
  v13 = v12;
  if (v12)
  {
    [(OBPasscodeViewController *)v12 setDelegate:v12];
    [(OBPasscodeViewController *)v13 configureForPasscodeEntry:0 length:4];
  }

  return v13;
}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[DKScreenTimePasscodeViewController completionButtonTitleForPasscodeViewController:]", "DKScreenTimePasscodeViewController.m", 37, "0");
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  id v5 = a4;
  v6 = [(DKScreenTimePasscodeViewController *)self verifyPasscode];
  int v7 = ((uint64_t (**)(void, id))v6)[2](v6, v5);

  if (v7)
  {
    v8 = [(DKScreenTimePasscodeViewController *)self passcodeVerified];
    v8[2]();
  }
  else
  {
    [(OBPasscodeViewController *)self shakePasscodeEntry];
    [(OBPasscodeViewController *)self clearPasscodeEntry];
  }
}

- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[DKScreenTimePasscodeViewController passcodeViewController:shouldEnableCompletionButtonForPasscode:]", "DKScreenTimePasscodeViewController.m", 53, "0");
}

- (id)verifyPasscode
{
  return self->_verifyPasscode;
}

- (void)setVerifyPasscode:(id)a3
{
}

- (id)passcodeVerified
{
  return self->_passcodeVerified;
}

- (void)setPasscodeVerified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeVerified, 0);
  objc_storeStrong(&self->_verifyPasscode, 0);
}

@end