@interface iOSSetupDoneViewController
- (BOOL)_canShowWhileLocked;
- (NSError)error;
- (void)handleDismissButton:(id)a3;
- (void)handleReportBugButton:(id)a3;
- (void)setError:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_doneButton + 1);
}

- (void)handleReportBugButton:(id)a3
{
  v23[0] = @"Classification";
  v23[1] = @"ComponentID";
  v24[0] = @"Serious Bug";
  v24[1] = @"768684";
  v23[2] = @"ComponentName";
  v23[3] = @"ComponentVersion";
  v24[2] = @"Proximity Setup";
  v24[3] = @"all";
  v23[4] = @"ExtensionIdentifiers";
  v23[5] = @"Keywords";
  v24[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v24[5] = @"758122";
  v24[6] = @"I Didn't Try";
  v23[6] = @"Reproducibility";
  v23[7] = @"Title";
  uint64_t v17 = *(uint64_t *)((char *)&self->_doneButton + 1);
  v3 = NSPrintF();
  v24[7] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 8, v17);

  v5 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v6 objectForKeyedSubscript:v11];
        v13 = +[NSURLQueryItem queryItemWithName:v11 value:v12];
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v14 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v14 setQueryItems:v5];
  v15 = (void *)UIApp;
  v16 = [v14 URL];
  [v15 openURL:v16 withCompletionHandler:0];

  if (dword_1001CC338 <= 50 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupDoneViewController;
  [(iOSSetupDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v30.receiver = self;
  v30.super_class = (Class)iOSSetupDoneViewController;
  [(SVSBaseViewController *)&v30 viewWillAppear:v3];
  if (*(UIButton **)((char *)&self->_doneButton + 1))
  {
    uint64_t v5 = NSErrorToOSStatus();
    v13 = sub_100138494(@"SETUP_FAILED_FORMAT", v6, v7, v8, v9, v10, v11, v12, v5);
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v13];

    if (IsAppleInternalBuild())
    {
      uint64_t v29 = *(uint64_t *)((char *)&self->_doneButton + 1);
      v14 = NSPrintF();
      [*(id *)((char *)&self->_titleLabel + 1) setText:v14, v29];
    }
    else
    {
      [*(id *)((char *)&self->_titleLabel + 1) setHidden:1];
    }
  }
  else
  {
    unsigned int v15 = [self->super.super._mainController otherDeviceClassCode] - 1;
    if (v15 > 6) {
      CFStringRef v16 = @"_IPHONE";
    }
    else {
      CFStringRef v16 = off_1001A18E0[v15];
    }
    uint64_t v17 = [@"IOS_SETUP_FINISH_TITLE" stringByAppendingString:v16];
    long long v18 = sub_100138280(@"Localizable", v17);
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v18];

    long long v19 = [self->super.super._mainController myAppleID];
    id v20 = [v19 length];
    long long v21 = @"IOS_SETUP_FINISH_INFO";
    if (!v20) {
      long long v21 = @"IOS_SETUP_FINISH_INFO_NO_ID";
    }
    v22 = v21;

    unsigned int v23 = [self->super.super._mainController otherDeviceClassCode] - 1;
    if (v23 > 6) {
      CFStringRef v24 = @"_IPHONE";
    }
    else {
      CFStringRef v24 = off_1001A18E0[v23];
    }
    v25 = [(__CFString *)v22 stringByAppendingString:v24];

    v26 = sub_100138280(@"Localizable", v25);
    [*(id *)((char *)&self->_titleLabel + 1) setText:v26];
  }
  if (IsAppleInternalBuild()) {
    BOOL v27 = *(UIButton **)((char *)&self->_doneButton + 1) == 0;
  }
  else {
    BOOL v27 = 1;
  }
  [*(id *)((char *)&self->_infoLabel + 1) setHidden:v27];
  v28 = [(SVSBaseViewController *)self containerView];
  [v28 setSwipeDismissible:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end