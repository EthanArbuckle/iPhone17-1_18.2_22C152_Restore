@interface WHASetupDoneViewController
- (NSError)error;
- (int)status;
- (void)handleActionButton:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleReportBugButton:(id)a3;
- (void)setError:(id)a3;
- (void)setStatus:(int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_status + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_infoLabel + 1) = a3;
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_infoLabel + 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_status + 1);
}

- (void)handleReportBugButton:(id)a3
{
  id v4 = a3;
  v25[0] = @"Classification";
  v25[1] = @"ComponentID";
  v26[0] = @"Serious Bug";
  v26[1] = @"768684";
  v25[2] = @"ComponentName";
  v25[3] = @"ComponentVersion";
  v26[2] = @"Proximity Setup";
  v26[3] = @"all";
  v25[4] = @"ExtensionIdentifiers";
  v25[5] = @"Reproducibility";
  v26[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v26[5] = @"I Didn't Try";
  v25[6] = @"Title";
  if (*(void *)((char *)&self->_status + 1)) {
    uint64_t v19 = *(void *)((char *)&self->_status + 1);
  }
  else {
    uint64_t v19 = *(unsigned int *)((char *)&self->_infoLabel + 1);
  }
  v5 = NSPrintF();
  v26[6] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 7, v19);

  v7 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v8 objectForKeyedSubscript:v13];
        v15 = +[NSURLQueryItem queryItemWithName:v13 value:v14];
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v16 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v16 setQueryItems:v7];
  v17 = (void *)UIApp;
  v18 = [v16 URL];
  [v17 openURL:v18 withCompletionHandler:0];

  if (dword_1001CD068 <= 50 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleActionButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v5 = *(_DWORD *)((char *)&self->_infoLabel + 1) - 301000;
  if (v5 > 0xF)
  {
    CFStringRef v7 = @"prefs:root";
    uint64_t v6 = 5;
  }
  else
  {
    uint64_t v6 = dword_10017FAE0[v5];
    CFStringRef v7 = *(&off_1001A1CA0 + v5);
  }
  id mainController = self->super._mainController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001441EC;
  v9[3] = &unk_1001A1BD8;
  id v10 = (__CFString *)v7;
  [mainController dismiss:v6 completion:v9];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupDoneViewController;
  [(WHASetupDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v30.receiver = self;
  v30.super_class = (Class)WHASetupDoneViewController;
  [(SVSBaseViewController *)&v30 viewWillAppear:v3];
  int v12 = *(_DWORD *)((char *)&self->_infoLabel + 1);
  switch(v12)
  {
    case 301000:
      uint64_t v13 = sub_100138280(@"Localizable", @"WIFI_NOT_CONNECTED_TITLE");
      [*(id *)((char *)&self->_reportBugButton + 1) setText:v13];

      v14 = @"WIFI_NOT_CONNECTED_DETAIL_WHA";
      goto LABEL_11;
    case 301001:
    case 301002:
    case 301003:
    case 301008:
    case 301009:
    case 301012:
    case 301013:
    case 301014:
      goto LABEL_9;
    case 301004:
      v24 = sub_100138280(@"Localizable", @"WIFI_INCOMPATIBLE_TITLE");
      [*(id *)((char *)&self->_reportBugButton + 1) setText:v24];

      v14 = @"WIFI_INCOMPATIBLE_DETAIL_WHA";
LABEL_11:
      v25 = sub_100138280(@"Localizable", v14);
      [*(id *)((char *)&self->_titleLabel + 1) setText:v25];
      goto LABEL_15;
    case 301005:
    case 301007:
    case 301010:
    case 301015:
      break;
    case 301006:
      v26 = sub_100138280(@"Localizable", @"ICLOUD_INCOMPATIBLE_TITLE");
      [*(id *)((char *)&self->_reportBugButton + 1) setText:v26];

      v25 = +[NSBundle mainBundle];
      v27 = [v25 localizedStringForKey:@"ICLOUD_INCOMPATIBLE_DETAIL_WHA" value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)((char *)&self->_titleLabel + 1) setText:v27];
      goto LABEL_14;
    case 301011:
      v25 = +[UIImage imageNamed:@"iCloudIcon.png"];
      v27 = +[UIScreen mainScreen];
      [v27 scale];
      v28 = [v25 _applicationIconImageForFormat:2 precomposed:1];
      [*(id *)((char *)&self->_doneButton + 1) setImage:v28];

LABEL_14:
LABEL_15:

      break;
    default:
      if (v12)
      {
LABEL_9:
        long long v20 = sub_100138494(@"SETUP_FAILED_FORMAT", v5, v6, v7, v8, v9, v10, v11, *(unsigned int *)((char *)&self->_infoLabel + 1));
        [*(id *)((char *)&self->_reportBugButton + 1) setText:v20];

        long long v21 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
        long long v22 = +[NSBundle mainBundle];
        long long v23 = [v22 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
        [v21 setTitle:v23 forState:0];

        [*(id *)((char *)&self->_imageView + 1) setHidden:IsAppleInternalBuild() == 0];
      }
      else
      {
        v15 = +[NSBundle mainBundle];
        v16 = [v15 localizedStringForKey:@"WHA_SUCCESS_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
        [*(id *)((char *)&self->_reportBugButton + 1) setText:v16];

        v17 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
        v18 = +[NSBundle mainBundle];
        uint64_t v19 = [v18 localizedStringForKey:@"DONE" value:&stru_1001A1DC0 table:@"Localizable"];
        [v17 setTitle:v19 forState:0];
      }
      break;
  }
  v29 = [(SVSBaseViewController *)self containerView];
  [v29 setSwipeDismissible:1];
}

@end