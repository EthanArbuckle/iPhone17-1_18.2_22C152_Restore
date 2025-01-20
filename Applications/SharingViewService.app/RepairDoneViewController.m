@interface RepairDoneViewController
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

@implementation RepairDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_status + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_doneButton + 1) = a3;
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_doneButton + 1);
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
  v25[5] = @"Keywords";
  v26[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v26[5] = @"794979";
  v26[6] = @"I Didn't Try";
  v25[6] = @"Reproducibility";
  v25[7] = @"Title";
  if (*(void *)((char *)&self->_status + 1)) {
    uint64_t v19 = *(void *)((char *)&self->_status + 1);
  }
  else {
    uint64_t v19 = *(unsigned int *)((char *)&self->_doneButton + 1);
  }
  v5 = NSPrintF();
  v26[7] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 8, v19);

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

  if (dword_1001CC9D8 <= 50 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleActionButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((*(_DWORD *)((char *)&self->_doneButton + 1) | 4) == 0x497CC)
  {
    v5 = @"prefs:root=WIFI";
    uint64_t v6 = 12;
  }
  else
  {
    v5 = UIApplicationOpenSettingsURLString;
    uint64_t v6 = 5;
  }
  id mainController = self->super._mainController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100127AE8;
  v9[3] = &unk_1001A1BD8;
  id v10 = v5;
  id v8 = v5;
  [mainController dismiss:v6 completion:v9];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)RepairDoneViewController;
  [(RepairDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v22.receiver = self;
  v22.super_class = (Class)RepairDoneViewController;
  [(SVSBaseViewController *)&v22 viewWillAppear:v3];
  int v12 = *(_DWORD *)((char *)&self->_doneButton + 1);
  if (!v12) {
    goto LABEL_12;
  }
  if (v12 == 301004)
  {
    v15 = sub_100138280(@"Localizable", @"WIFI_INCOMPATIBLE_TITLE");
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v15];

    v14 = @"AS_WIFI_INCOMPATIBLE_DETAIL";
    goto LABEL_10;
  }
  if (v12 != 301000)
  {
    v17 = sub_100138494(@"REPAIR_FAILED_TITLE_FORMAT", v5, v6, v7, v8, v9, v10, v11, *(unsigned int *)((char *)&self->_doneButton + 1));
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v17];

    v18 = *(UIButton **)((char *)&self->_reportBugButton + 1);
    uint64_t v19 = +[NSBundle mainBundle];
    long long v20 = [v19 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    [v18 setTitle:v20 forState:0];

    [*(id *)((char *)&self->_imageView + 1) setHidden:IsAppleInternalBuild() == 0];
LABEL_12:
    v16 = [self->super._mainController productImage];
    [*(id *)((char *)&self->_infoLabel + 1) setImage:v16];
    goto LABEL_13;
  }
  uint64_t v13 = sub_100138280(@"Localizable", @"WIFI_NOT_CONNECTED_TITLE");
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v13];

  v14 = @"AS_WIFI_NOT_CONNECTED_DETAIL";
LABEL_10:
  v16 = sub_100138280(@"Localizable", v14);
  [*(id *)((char *)&self->_titleLabel + 1) setText:v16];
LABEL_13:

  long long v21 = [(SVSBaseViewController *)self containerView];
  [v21 setSwipeDismissible:1];
}

@end