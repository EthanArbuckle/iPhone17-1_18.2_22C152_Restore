@interface BuddyPasscodeMesaController
- (BOOL)allowsSkip;
- (BOOL)controllerNeedsToRun;
- (BOOL)passcodeViewControllerAllowSkip:(id)a3;
- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
@end

@implementation BuddyPasscodeMesaController

- (BOOL)controllerNeedsToRun
{
  char v12 = 0;
  v2 = [(BuddyPasscodeController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 supportsTouchID];

  if (v3)
  {
    v4 = [(BuddyPasscodeController *)self capabilities];
    char v12 = [(BYCapabilities *)v4 isTouchIDEnrolled] & 1;
  }
  else
  {
    v5 = [(BuddyPasscodeController *)self capabilities];
    unsigned __int8 v6 = [(BYCapabilities *)v5 supportsPearl];

    if (v6)
    {
      v7 = [(BuddyPasscodeController *)self capabilities];
      char v12 = [(BYCapabilities *)v7 isPearlEnrolled] & 1;
    }
  }
  char v10 = 0;
  char v8 = 0;
  if (v12)
  {
    v11 = [(BuddyPasscodeController *)self managedConfiguration];
    char v10 = 1;
    char v8 = [(MCProfileConnection *)v11 isPasscodeSet] ^ 1;
  }
  BOOL v14 = v8 & 1;
  if (v10) {

  }
  return v14;
}

- (BOOL)allowsSkip
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyPasscodeController *)v9 capabilities];
  unsigned __int8 v4 = [(BYCapabilities *)v3 supportsPearl];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v4) {
    char v10 = [(NSBundle *)v5 localizedStringForKey:@"ENTER_PASSCODE_SUBTITLE_FACEID" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else {
    char v10 = [(NSBundle *)v5 localizedStringForKey:@"ENTER_PASSCODE_SUBTITLE_TOUCHID" value:&stru_1002B4E18 table:@"Localizable"];
  }

  objc_storeStrong(location, 0);
  unsigned __int8 v6 = v10;

  return v6;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = [(BuddyPasscodeController *)v9 managedConfiguration];
  [(MCProfileConnection *)v5 setFingerprintUnlockAllowed:1 passcode:v7 completion:0];

  v6.receiver = v9;
  v6.super_class = (Class)BuddyPasscodeMesaController;
  [(BuddyPasscodeController *)&v6 passcodeViewController:location[0] didFinishWithPasscodeCreation:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

@end