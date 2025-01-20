@interface PasswordSharingDoneViewController
- (NSDictionary)userInfo;
- (_TtC18SharingViewService33PasswordSharingDoneViewController)initWithContentView:(id)a3;
- (double)duration;
- (int)status;
- (void)configureUIElementsDefault;
- (void)configureUIElementsForHotspot;
- (void)handleDismissButton:(id)a3;
- (void)handleReportBugButton:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStatus:(int)a3;
- (void)setUserInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasswordSharingDoneViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10002E1C8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10002E96C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)PasswordSharingDoneViewController;
  [(PasswordSharingDoneViewController *)&v5 viewDidDisappear:v3];
}

- (_TtC18SharingViewService33PasswordSharingDoneViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_type] = 2;
  objc_super v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_model];
  done = (objc_class *)type metadata accessor for PasswordSharingDoneViewController();
  *(_OWORD *)objc_super v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((void *)v5 + 12) = 0;
  v8.receiver = self;
  v8.super_class = done;
  return [(PasswordSharingDoneViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_duration + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return *(NSDictionary **)((char *)&self->_duration + 1);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_titleLabel + 1) = a3;
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_titleLabel + 1);
}

- (void)setDuration:(double)a3
{
  *(double *)((char *)&self->_status + 1) = a3;
}

- (double)duration
{
  return *(double *)((char *)&self->_status + 1);
}

- (void)handleReportBugButton:(id)a3
{
  unsigned int v4 = [self->super._mainController hotspot:a3];
  CFStringRef v5 = @"WiFi";
  if (v4) {
    CFStringRef v5 = @"Hotspot";
  }
  CFStringRef v20 = v5;
  uint64_t v21 = *(unsigned int *)((char *)&self->_titleLabel + 1);
  v6 = NSPrintF();
  v27[0] = @"Classification";
  v27[1] = @"ComponentID";
  v28[0] = @"Serious Bug";
  v28[1] = @"886090";
  v27[2] = @"ComponentName";
  v27[3] = @"ComponentVersion";
  v28[2] = @"WiFi Password Sharing";
  v28[3] = @"all";
  v27[4] = @"ExtensionIdentifiers";
  v27[5] = @"Reproducibility";
  v28[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v28[5] = @"I Didn't Try";
  v27[6] = @"Title";
  v28[6] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 7, v20, v21);
  objc_super v8 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v9 objectForKeyedSubscript:v14];
        v16 = +[NSURLQueryItem queryItemWithName:v14 value:v15];
        [v8 addObject:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v17 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v17 setQueryItems:v8];
  v18 = (void *)UIApp;
  v19 = [v17 URL];
  [v18 openURL:v19 withCompletionHandler:0];

  if (dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController ensureStoppedWithDismiss:1 reason:5];
}

- (void)configureUIElementsForHotspot
{
  if (*(_DWORD *)((char *)&self->_titleLabel + 1))
  {
    BOOL v3 = +[NSMutableString stringWithString:@"HOTSPOT_SHARING_FAILED_DETAIL"];
    if (IsAppleInternalBuild()) {
      [v3 appendString:@"_FORMAT"];
    }
    id v4 = +[UIImage imageNamed:@"AlertCircle.png"];
    CFStringRef v5 = +[UIColor systemRedColor];
    v6 = [v4 _flatImageWithColor:v5];
    [*(id *)((char *)&self->_doneButton + 1) setImage:v6];

    if (IsAppleInternalBuild())
    {
      uint64_t v14 = sub_100138494(v3, v7, v8, v9, v10, v11, v12, v13, *(unsigned int *)((char *)&self->_titleLabel + 1));
      [*(id *)((char *)&self->_imageView + 1) setText:v14];
    }
    else
    {
      uint64_t v14 = +[NSBundle mainBundle];
      long long v24 = [v14 localizedStringForKey:v3 value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)((char *)&self->_imageView + 1) setText:v24];
    }
    long long v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"HOTSPOT_SHARING_FAILED_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_reportBugButton + 1) setText:v26];

    v27 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    long long v23 = +[NSBundle mainBundle];
    v28 = [v23 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    [v27 setTitle:v28 forState:0];
  }
  else
  {
    v15 = +[UIImage imageNamed:@"DoneCheck.png"];
    v16 = +[UIColor systemBlueColor];
    v17 = [v15 _flatImageWithColor:v16];
    [*(id *)((char *)&self->_doneButton + 1) setImage:v17];

    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"HOTSPOT_SHARING_SUCCESS_DETAIL" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_imageView + 1) setText:v19];

    CFStringRef v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"COMPLETE" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_reportBugButton + 1) setText:v21];

    long long v22 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    BOOL v3 = +[NSBundle mainBundle];
    long long v23 = [v3 localizedStringForKey:@"DONE" value:&stru_1001A1DC0 table:@"Localizable"];
    [v22 setTitle:v23 forState:0];
  }

  v29 = *(UILabel **)((char *)&self->_infoLabel + 1);

  [v29 setHidden:1];
}

- (void)configureUIElementsDefault
{
  if (*(_DWORD *)((char *)&self->_titleLabel + 1))
  {
    BOOL v3 = +[NSMutableString stringWithString:@"WIFI_SHARING_FAILED_DETAIL"];
    if (IsAppleInternalBuild()) {
      [v3 appendString:@"_FORMAT"];
    }
    if (SFIsGreenTeaDevice()) {
      [v3 appendString:@"_WLAN"];
    }
    id v4 = +[UIImage imageNamed:@"AlertCircle.png"];
    CFStringRef v5 = +[UIColor systemRedColor];
    v6 = [v4 _flatImageWithColor:v5];
    [*(id *)((char *)&self->_doneButton + 1) setImage:v6];

    if (IsAppleInternalBuild())
    {
      uint64_t v14 = sub_100138494(v3, v7, v8, v9, v10, v11, v12, v13, *(unsigned int *)((char *)&self->_titleLabel + 1));
      [*(id *)((char *)&self->_imageView + 1) setText:v14];
    }
    else
    {
      uint64_t v14 = +[NSBundle mainBundle];
      v26 = [v14 localizedStringForKey:v3 value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)((char *)&self->_imageView + 1) setText:v26];
    }
    v27 = +[NSBundle mainBundle];
    v28 = [v27 localizedStringForKey:@"WIFI_SHARING_FAILED_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_reportBugButton + 1) setText:v28];

    v29 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    long long v23 = +[NSBundle mainBundle];
    long long v24 = [v23 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
    long long v25 = v29;
  }
  else
  {
    BOOL v3 = +[NSMutableString stringWithString:@"WIFI_SHARING_SUCCESS_DETAIL"];
    if (SFIsGreenTeaDevice()) {
      [v3 appendString:@"_WLAN"];
    }
    v15 = +[UIImage imageNamed:@"DoneCheck.png"];
    v16 = +[UIColor systemBlueColor];
    v17 = [v15 _flatImageWithColor:v16];
    [*(id *)((char *)&self->_doneButton + 1) setImage:v17];

    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:v3 value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_imageView + 1) setText:v19];

    CFStringRef v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"COMPLETE" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_reportBugButton + 1) setText:v21];

    long long v22 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    long long v23 = +[NSBundle mainBundle];
    long long v24 = [v23 localizedStringForKey:@"DONE" value:&stru_1001A1DC0 table:@"Localizable"];
    long long v25 = v22;
  }
  [v25 setTitle:v24 forState:0];

  if (IsAppleInternalBuild() && *(double *)((char *)&self->_status + 1) > 0.0)
  {
    v30 = [*(id *)((char *)&self->_imageView + 1) text];
    v31 = [v30 stringByAppendingFormat:@" (internal: Duration = %f)", *(void *)((char *)&self->_status + 1)];
    [*(id *)((char *)&self->_imageView + 1) setText:v31];
  }
  v32 = *(UILabel **)((char *)&self->_infoLabel + 1);

  [v32 setHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)PasswordSharingDoneViewController;
  [(SVSBaseViewController *)&v6 viewWillAppear:v3];
  if ([self->super._mainController hotspot]) {
    [(PasswordSharingDoneViewController *)self configureUIElementsForHotspot];
  }
  else {
    [(PasswordSharingDoneViewController *)self configureUIElementsDefault];
  }
  CFStringRef v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:1];
}

@end