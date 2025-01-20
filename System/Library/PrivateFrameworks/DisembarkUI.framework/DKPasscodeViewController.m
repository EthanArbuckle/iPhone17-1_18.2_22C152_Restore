@interface DKPasscodeViewController
- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4;
- (DKPasscodeViewController)init;
- (id)completionButtonTitleForPasscodeViewController:(id)a3;
- (id)passcodeVerified;
- (id)verifyPasscode;
- (int)simplePasscodeType;
- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4;
- (void)setPasscodeVerified:(id)a3;
- (void)setSimplePasscodeType:(int)a3;
- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4;
- (void)setVerifyPasscode:(id)a3;
@end

@implementation DKPasscodeViewController

- (DKPasscodeViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PASSCODE_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PASSCODE_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];

  v10.receiver = self;
  v10.super_class = (Class)DKPasscodeViewController;
  v7 = [(DKPasscodeViewController *)&v10 initWithTitle:v4 detailText:v6 icon:0 contentLayout:2];
  v8 = v7;
  if (v7) {
    [(OBPasscodeViewController *)v7 setDelegate:v7];
  }

  return v8;
}

- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  [(DKPasscodeViewController *)self setSimplePasscodeType:*(void *)&a4];
  if (a3 == 2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
  }
  else
  {
    if (a3)
    {
LABEL_6:
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      goto LABEL_10;
    }
    if (a4)
    {
      if (a4 != 1)
      {
        if (a4 == -1) {
          -[DKPasscodeViewController setUnlockScreenType:simplePasscodeType:]();
        }
        goto LABEL_6;
      }
      uint64_t v8 = 0;
      uint64_t v7 = 6;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 4;
    }
  }
LABEL_10:
  [(OBPasscodeViewController *)self configureForPasscodeEntry:v8 length:v7];
}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"NEXT" value:&stru_26EAA9F58 table:@"Localizable"];

  return v4;
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  id v8 = a4;
  v5 = [(DKPasscodeViewController *)self verifyPasscode];
  int v6 = ((uint64_t (**)(void, id))v5)[2](v5, v8);

  if (v6)
  {
    uint64_t v7 = [(DKPasscodeViewController *)self passcodeVerified];
    ((void (**)(void, id, void))v7)[2](v7, v8, [(DKPasscodeViewController *)self simplePasscodeType]);
  }
  else
  {
    [(OBPasscodeViewController *)self shakePasscodeEntry];
    [(OBPasscodeViewController *)self clearPasscodeEntry];
  }
}

- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4
{
  return objc_msgSend(a4, "length", a3) != 0;
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

- (int)simplePasscodeType
{
  return self->_simplePasscodeType;
}

- (void)setSimplePasscodeType:(int)a3
{
  self->_simplePasscodeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeVerified, 0);
  objc_storeStrong(&self->_verifyPasscode, 0);
}

- (void)setUnlockScreenType:simplePasscodeType:.cold.1()
{
}

@end