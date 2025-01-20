@interface PasswordSharingStartViewController
- (BOOL)displayNameIsDevice;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (NSDictionary)userInfo;
- (NSString)peerDisplayName;
- (OS_dispatch_queue)dispatchQueue;
- (_TtC18SharingViewService34PasswordSharingStartViewController)initWithContentView:(id)a3;
- (void)configureUIElementsDefault;
- (void)configureUIElementsForHotspot;
- (void)handleAllowButtonPressed:(id)a3;
- (void)handleDismissButtonPressed:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDisplayNameIsDevice:(BOOL)a3;
- (void)setPeerDisplayName:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasswordSharingStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006E440();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PasswordSharingStartViewController;
  [(SVSBaseViewController *)&v4 viewDidAppear:a3];
  if ([self->super._mainController autoGrant])
  {
    if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(PasswordSharingStartViewController *)self handleAllowButtonPressed:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)PasswordSharingStartViewController;
  [(PasswordSharingStartViewController *)&v7 viewDidDisappear:v3];
  id mainController = self->super._mainController;
  self->super._id mainController = 0;

  v6 = *(NSString **)((char *)&self->_peerDisplayName + 1);
  *(NSString **)((char *)&self->_peerDisplayName + 1) = 0;
}

- (_TtC18SharingViewService34PasswordSharingStartViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_type] = 0;
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_activityIndicatorTitle];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PasswordSharingStartViewController();
  return [(PasswordSharingStartViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_peerDisplayName + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dispatchQueue + 1), 0);
  objc_storeStrong((id *)(&self->_displayNameIsDevice + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_detailLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_acceptButton + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return *(NSDictionary **)((char *)&self->_peerDisplayName + 1);
}

- (void)setPeerDisplayName:(id)a3
{
}

- (NSString)peerDisplayName
{
  return *(NSString **)((char *)&self->_dispatchQueue + 1);
}

- (void)setDisplayNameIsDevice:(BOOL)a3
{
  BYTE1(self->_titleLabel) = a3;
}

- (BOOL)displayNameIsDevice
{
  return BYTE1(self->_titleLabel);
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return *(OS_dispatch_queue **)(&self->_displayNameIsDevice + 1);
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handleDismissButtonPressed:(id)a3
{
  id v4 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleAllowButtonPressed:(id)a3
{
  id v4 = a3;
  if (dword_1001CC5A8 <= 30 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:0];

  if (![self->super._mainController touchDelayActive]
    || ([self->super._mainController autoGrant] & 1) != 0)
  {
    [*(id *)((char *)&self->_acceptButton + 1) setHidden:0];
    [*(id *)((char *)&self->_acceptButton + 1) startAnimating];
    [*(id *)((char *)&self->_imageView + 1) setHidden:0];
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setHidden:1];
    unsigned int v6 = [self->super._mainController testMode];
    if (v6 <= 5)
    {
      if (((1 << v6) & 0x16) != 0)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10010FCD8;
        v8[3] = &unk_1001A1B88;
        dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        v10 = self;
        objc_super v7 = v9;
        dispatch_source_set_event_handler(v7, v8);
        SFDispatchTimerSet();
        dispatch_resume(v7);

        goto LABEL_17;
      }
      if (((1 << v6) & 0x28) != 0)
      {
        [self->super._mainController showDoneUI:4294960596];
        goto LABEL_17;
      }
    }
    [self->super._mainController _sessionStart];
    goto LABEL_17;
  }
  if (dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_17:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 view];
  objc_super v7 = [v5 view];

  return v6 == v7;
}

- (void)configureUIElementsForHotspot
{
  if (!*(OS_dispatch_queue **)((char *)&self->_dispatchQueue + 1)
    || [self->super._mainController testMode] == 4
    || [self->super._mainController testMode] == 5)
  {
    CFStringRef v3 = @"John Appleseed";
  }
  else
  {
    CFStringRef v3 = (const __CFString *)*(id *)((char *)&self->_dispatchQueue + 1);
  }
  v20 = (__CFString *)v3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"HOTSPOT_SHARING_ACTIVITY" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_activityIndicatorView + 1) setText:v5];

  v13 = sub_100138494(@"HOTSPOT_SHARING_DETAIL_FORMAT", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v20);
  [*(id *)((char *)&self->_activityLabel + 1) setText:v13];

  v14 = +[UIImage imageNamed:@"Hotspot.png"];
  [*(id *)((char *)&self->_infoLabel + 1) setImage:v14];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"HOTSPOT_SHARING_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_progressView + 1) setText:v16];

  v17 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"HOTSPOT_SHARING_BUTTON" value:&stru_1001A1DC0 table:@"Localizable"];
  [v17 setTitle:v19 forState:0];
}

- (void)configureUIElementsDefault
{
  CFStringGetTypeID();
  CFStringRef v3 = CFDictionaryGetTypedValue();
  if (!v3 && dword_1001CC5A8 <= 50 && (dword_1001CC5A8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v4 = SFIsGreenTeaDevice();
  id v5 = @"WIFI_SHARING_TITLE";
  if (v4) {
    id v5 = @"WIFI_SHARING_TITLE_WLAN";
  }
  uint64_t v6 = v5;
  if ([self->super._mainController testMode] == 2
    || [self->super._mainController testMode] == 6)
  {
    int v7 = SFIsGreenTeaDevice();
    uint64_t v8 = @"WIFI_SHARING_DETAIL_FORMAT";
    if (v7) {
      uint64_t v8 = @"WIFI_SHARING_DETAIL_FORMAT_WLAN";
    }
    v16 = v8;
    if (BYTE1(self->_titleLabel))
    {
      uint64_t v17 = +[NSString stringWithFormat:@"%@_DEVICE", v16];

      v16 = (__CFString *)v17;
    }
    sub_100138494(v16, v9, v10, v11, v12, v13, v14, v15, @"WiFiNetwork");
LABEL_15:
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ([self->super._mainController testMode] == 7)
  {

    v16 = +[NSBundle mainBundle];
    id v39 = [(__CFString *)v16 localizedStringForKey:@"WIFI_SHARING_DETAIL_LONG" value:&stru_1001A1DC0 table:@"Localizable"];
    uint64_t v6 = @"WIFI_SHARING_TITLE_LONG";
  }
  else
  {
    uint64_t v25 = *(uint64_t *)((char *)&self->_dispatchQueue + 1);
    int v26 = SFIsGreenTeaDevice();
    if (v3) {
      BOOL v27 = v25 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27)
    {
      v30 = @"WIFI_SHARING_DETAIL_FORMAT";
      if (v26) {
        v30 = @"WIFI_SHARING_DETAIL_FORMAT_WLAN";
      }
      v16 = v30;
      if (BYTE1(self->_titleLabel))
      {
        uint64_t v38 = +[NSString stringWithFormat:@"%@_DEVICE", v16];

        v16 = (__CFString *)v38;
      }
      sub_100138494(v16, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v3);
      goto LABEL_15;
    }
    v28 = @"WIFI_SHARING_DETAIL_GENERIC";
    if (v26) {
      v28 = @"WIFI_SHARING_DETAIL_GENERIC_WLAN";
    }
    v29 = v28;
    v16 = +[NSBundle mainBundle];
    id v39 = [(__CFString *)v16 localizedStringForKey:v29 value:&stru_1001A1DC0 table:@"Localizable"];
  }
LABEL_16:

  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"WIFI_SHARING_ACTIVITY" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_activityIndicatorView + 1) setText:v19];

  [*(id *)((char *)&self->_activityLabel + 1) setText:v39];
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:v6 value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_progressView + 1) setText:v21];

  v22 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"WIFI_SHARING_BUTTON" value:&stru_1001A1DC0 table:@"Localizable"];
  [v22 setTitle:v24 forState:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PasswordSharingStartViewController;
  [(SVSBaseViewController *)&v8 viewWillAppear:a3];
  int v4 = [self->super._mainController _remoteViewControllerProxy];
  [v4 setStatusBarHidden:1 withDuration:0.0];

  if ([self->super._mainController hotspot]) {
    [(PasswordSharingStartViewController *)self configureUIElementsForHotspot];
  }
  else {
    [(PasswordSharingStartViewController *)self configureUIElementsDefault];
  }
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v5 setDelegate:self];
  [v5 setNumberOfTapsRequired:1];
  [v5 setCancelsTouchesInView:0];
  uint64_t v6 = [(PasswordSharingStartViewController *)self view];
  [v6 addGestureRecognizer:v5];

  int v7 = [(SVSBaseViewController *)self containerView];
  [v7 setSwipeDismissible:1];
}

@end