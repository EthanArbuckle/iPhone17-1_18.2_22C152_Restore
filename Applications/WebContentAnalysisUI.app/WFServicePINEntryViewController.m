@interface WFServicePINEntryViewController
+ (BOOL)settingEnabled;
- (BOOL)isNumericPIN;
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)requiresKeyboard;
- (BOOL)simplePIN;
- (BOOL)validatePIN:(id)a3;
- (NSObject)delegate;
- (WFServicePINEntryViewController)init;
- (__CFString)blockTimeIntervalKey;
- (__CFString)blockedStateKey;
- (__CFString)defaultsID;
- (__CFString)failedAttemptsKey;
- (id)stringsTable;
- (unint64_t)supportedInterfaceOrientations;
- (void)setDelegate:(id)a3;
- (void)setPane:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFServicePINEntryViewController

- (WFServicePINEntryViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFServicePINEntryViewController;
  v2 = [(WFServicePINEntryViewController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = OBJC_IVAR___DevicePINController__mode;
    *(_DWORD *)&v2->DevicePINController_opaque[OBJC_IVAR___DevicePINController__mode] = 3;
    v5 = +[PSListController appearance];
    v6 = +[UIColor labelColor];
    [v5 setTextColor:v6];

    id v7 = objc_alloc_init((Class)DevicePINPane);
    [v7 setDelegate:v3];
    v8 = +[PSSpecifier emptyGroupSpecifier];
    v9 = +[NSNumber numberWithInt:*(unsigned int *)&v3->DevicePINController_opaque[v4]];
    [v8 setProperty:v9 forKey:@"mode"];

    [(WFServicePINEntryViewController *)v3 setSpecifier:v8];
    [(WFServicePINEntryViewController *)v3 setPane:v7];
  }
  return v3;
}

- (void)viewDidLoad
{
  v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = 17;
  }
  [(WFServicePINEntryViewController *)self setModalPresentationStyle:v5];
  v6.receiver = self;
  v6.super_class = (Class)WFServicePINEntryViewController;
  [(WFServicePINEntryViewController *)&v6 viewDidLoad];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 setProperty:v7 forKey:kDevicePINControllerDelegate];

    [(WFServicePINEntryViewController *)self setSpecifier:v6];
    uint64_t v5 = obj;
  }
}

- (void)setPane:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFServicePINEntryViewController;
  [(WFServicePINEntryViewController *)&v6 setPane:a3];
  unint64_t v4 = sub_100002580(@"PINCODE_TITLE_LOCKED");
  uint64_t v5 = [(WFServicePINEntryViewController *)self navigationItem];
  [v5 setTitle:v4];
}

+ (BOOL)settingEnabled
{
  return +[PSRestrictionsPINController settingEnabled];
}

- (id)stringsTable
{
  return @"WebContentAnalysisUI";
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 0;
}

- (BOOL)validatePIN:(id)a3
{
  return +[PSRestrictionsPasscodeController validatePIN:a3];
}

- (BOOL)requiresKeyboard
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (__CFString)defaultsID
{
  return @"com.apple.WebContentAnalysisUI";
}

- (__CFString)failedAttemptsKey
{
  return @"WCFRestrictedWebsiteFailedAttempts";
}

- (__CFString)blockTimeIntervalKey
{
  v3.receiver = self;
  v3.super_class = (Class)WFServicePINEntryViewController;
  return [(WFServicePINEntryViewController *)&v3 blockTimeIntervalKey];
}

- (__CFString)blockedStateKey
{
  v3.receiver = self;
  v3.super_class = (Class)WFServicePINEntryViewController;
  return [(WFServicePINEntryViewController *)&v3 blockedStateKey];
}

- (NSObject)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end