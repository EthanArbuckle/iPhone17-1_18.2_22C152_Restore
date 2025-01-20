@interface BKUIPasscodeEntryController
+ (BOOL)isDevicePasscodeSet;
- (BKUIPasscodeEntryController)initWithVerifiedPasscodeAction:(id)a3;
- (BOOL)isModalInPresentation;
- (BOOL)passcodeViewController:(id)a3 shouldEnableCompletionButtonForPasscode:(id)a4;
- (BOOL)verifyPasscode:(id)a3;
- (id)completionButtonTitleForPasscodeViewController:(id)a3;
- (id)passcodeEntryAction;
- (int)simplePasscodeType;
- (int)unlockType;
- (void)cancelPasscodeEntry;
- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4;
- (void)setPasscodeEntryAction:(id)a3;
- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4;
- (void)viewDidLoad;
@end

@implementation BKUIPasscodeEntryController

- (BKUIPasscodeEntryController)initWithVerifiedPasscodeAction:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"PASSCODE_TITLE"];
  v7 = [v5 localizedStringForKey:v6 value:&stru_1F4081468 table:@"Pearl-periocular"];

  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"PASSCODE_DETAIL"];
  v10 = [v8 localizedStringForKey:v9 value:&stru_1F4081468 table:@"Pearl-periocular"];

  v15.receiver = self;
  v15.super_class = (Class)BKUIPasscodeEntryController;
  v11 = [(BKUIPasscodeEntryController *)&v15 initWithTitle:v7 detailText:v10 icon:0];
  if (v11)
  {
    uint64_t v12 = [v4 copy];
    id passcodeEntryAction = v11->_passcodeEntryAction;
    v11->_id passcodeEntryAction = (id)v12;
  }
  return v11;
}

+ (BOOL)isDevicePasscodeSet
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int)unlockType
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 unlockScreenType];

  return v3;
}

- (int)simplePasscodeType
{
  int v4 = 0;
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  [v2 unlockScreenTypeWithOutSimplePasscodeType:&v4];

  return v4;
}

- (BOOL)verifyPasscode:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F74230];
  id v4 = a3;
  v5 = [v3 sharedConnection];
  id v10 = 0;
  char v6 = [v5 unlockDeviceWithPasscode:v4 outError:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BKUIPasscodeEntryController verifyPasscode:](v7, v8);
    }
  }
  return v6;
}

- (void)setUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  if (a3 == 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 1;
  }
  else
  {
    if (!a3)
    {
      switch(a4)
      {
        case 0:
          uint64_t v5 = 0;
          uint64_t v4 = 4;
          goto LABEL_10;
        case 1:
          uint64_t v5 = 0;
          uint64_t v4 = 6;
          goto LABEL_10;
        case -1:
          -[BKUIPasscodeEntryController setUnlockScreenType:simplePasscodeType:]();
      }
    }
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
LABEL_10:
  v6.receiver = self;
  v6.super_class = (Class)BKUIPasscodeEntryController;
  [(OBPasscodeViewController *)&v6 configureForPasscodeEntry:v5 length:v4];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)BKUIPasscodeEntryController;
  [(OBPasscodeViewController *)&v8 viewDidLoad];
  [(OBPasscodeViewController *)self setDelegate:self];
  [(BKUIPasscodeEntryController *)self setUnlockScreenType:[(BKUIPasscodeEntryController *)self unlockType] simplePasscodeType:[(BKUIPasscodeEntryController *)self simplePasscodeType]];
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_1F4081468 table:@"Pearl-periocular"];
  objc_super v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel_cancelPasscodeEntry];

  id v7 = [(OBBaseWelcomeController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];
}

- (void)cancelPasscodeEntry
{
  v2 = [(BKUIPasscodeEntryController *)self passcodeEntryAction];
  v2[2](v2, 0);
}

- (id)completionButtonTitleForPasscodeViewController:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"NEXT" value:&stru_1F4081468 table:@"Pearl-periocular"];

  return v4;
}

- (void)passcodeViewController:(id)a3 didEnterPasscode:(id)a4
{
  id v6 = a4;
  if (-[BKUIPasscodeEntryController verifyPasscode:](self, "verifyPasscode:"))
  {
    uint64_t v5 = [(BKUIPasscodeEntryController *)self passcodeEntryAction];
    ((void (**)(void, id))v5)[2](v5, v6);
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

- (id)passcodeEntryAction
{
  return self->_passcodeEntryAction;
}

- (void)setPasscodeEntryAction:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)verifyPasscode:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "Failed to verify passcode %@", (uint8_t *)&v4, 0xCu);
}

- (void)setUnlockScreenType:simplePasscodeType:.cold.1()
{
}

@end