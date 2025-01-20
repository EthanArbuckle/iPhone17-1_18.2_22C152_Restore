@interface BCChatSuggestRemoteViewController
- (BCActionsListViewController)actionsViewController;
- (BCAlertActionItem)headerActionItem;
- (BCChatSuggestRemoteViewController)init;
- (BCChatSuggestRemoteViewController)initWithDeviceState:(id)a3 presenter:(id)a4;
- (BCDeviceStateProtocol)deviceState;
- (BCPresenterProtocol)presenter;
- (BCSBusinessItem)bizItem;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)chatSuggestRemoteViewControllerDismissed;
- (BOOL)chatSuggestUIPresented;
- (BOOL)hadBizItemWhenPhoneNumberUIPresented;
- (BOOL)phoneNumberDisplayLogged;
- (BOOL)phoneNumberUIPresented;
- (BSAction)dialRequestAction;
- (NSArray)pendingActionItems;
- (NSXPCConnection)connection;
- (UIAlertController)alertController;
- (double)phoneNumberUIPresentedTime;
- (double)viewControllerDidLoadTime;
- (id)callAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4;
- (id)defaultAlertActionForDialRequestAction:(id)a3;
- (id)headerAlertActionForBizItem:(id)a3;
- (id)messageAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4;
- (int64_t)_latencyFromViewDidLoad;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)tapId;
- (void)_dismiss;
- (void)_logPhoneNumberDisplayedIfNecessary;
- (void)brandedHeaderViewController:(id)a3 logoFetchingDidFinishForBusinessItem:(id)a4 success:(BOOL)a5;
- (void)brandedHeaderViewController:(id)a3 logoFetchingWillBeginForBusinessItem:(id)a4;
- (void)configureAlertControllerForBusinessItem:(id)a3 dialRequestAction:(id)a4;
- (void)configureAlertControllerForDialRequestAction:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)fetchBizInfoForDialRequestAction:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setActionsViewController:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setBizItem:(id)a3;
- (void)setChatSuggestRemoteViewControllerDismissed:(BOOL)a3;
- (void)setChatSuggestUIPresented:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDialRequestAction:(id)a3;
- (void)setHadBizItemWhenPhoneNumberUIPresented:(BOOL)a3;
- (void)setHeaderActionItem:(id)a3;
- (void)setPendingActionItems:(id)a3;
- (void)setPhoneNumberDisplayLogged:(BOOL)a3;
- (void)setPhoneNumberUIPresented:(BOOL)a3;
- (void)setPhoneNumberUIPresentedTime:(double)a3;
- (void)setTapId:(unint64_t)a3;
- (void)setViewControllerDidLoadTime:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BCChatSuggestRemoteViewController

- (BCChatSuggestRemoteViewController)init
{
  v3 = objc_alloc_init(BCPresenter);
  v4 = objc_alloc_init(BCDeviceState);
  v5 = [(BCChatSuggestRemoteViewController *)self initWithDeviceState:v4 presenter:v3];

  [(BCPresenter *)v3 setPresentingViewController:v5];
  return v5;
}

- (BCChatSuggestRemoteViewController)initWithDeviceState:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCChatSuggestRemoteViewController;
  v9 = [(BCChatSuggestRemoteViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceState, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BCChatSuggestRemoteViewController;
  [(BCChatSuggestRemoteViewController *)&v5 viewDidLoad];
  [(BCChatSuggestRemoteViewController *)self setViewControllerDidLoadTime:CACurrentMediaTime()];
  v3 = +[UIColor clearColor];
  v4 = [(BCChatSuggestRemoteViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BCChatSuggestRemoteViewController;
  [(BCChatSuggestRemoteViewController *)&v3 viewDidDisappear:a3];
  byte_100016870 = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCChatSuggestRemoteViewController;
  [(BCChatSuggestRemoteViewController *)&v7 viewDidAppear:a3];
  v4 = [(BCChatSuggestRemoteViewController *)self dialRequestAction];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 50000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005734;
    block[3] = &unk_100010428;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setDialRequestAction:(id)a3
{
  v4 = (BSAction *)a3;
  dispatch_time_t v5 = sub_100007F6C();
  [(BCChatSuggestRemoteViewController *)self setTapId:os_signpost_id_generate(v5)];

  v6 = sub_100007F6C();
  unint64_t v7 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RenderBusinessChatUI", (const char *)&unk_10000FB72, buf, 2u);
    }
  }

  v9 = sub_100007F6C();
  unint64_t v10 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RenderBusinessChatCallAction", (const char *)&unk_10000FB72, v17, 2u);
    }
  }

  objc_super v12 = sub_100007F6C();
  unint64_t v13 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RenderBusinessChatMessageAction", (const char *)&unk_10000FB72, v16, 2u);
    }
  }

  if (v4) {
    [(BCChatSuggestRemoteViewController *)self fetchBizInfoForDialRequestAction:v4];
  }
  dialRequestAction = self->_dialRequestAction;
  self->_dialRequestAction = v4;
}

- (void)configureAlertControllerForBusinessItem:(id)a3 dialRequestAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [(BCChatSuggestRemoteViewController *)self deviceState];
  unsigned int v9 = [v8 isLocked];

  if (v9) {
    goto LABEL_2;
  }
  unint64_t v10 = [(BCChatSuggestRemoteViewController *)self actionsViewController];
  [v10 setBusinessItem:v6];

  os_signpost_id_t v11 = [(BCChatSuggestRemoteViewController *)self headerActionItem];

  if (!v11)
  {
    objc_super v12 = [(BCChatSuggestRemoteViewController *)self headerAlertActionForBizItem:v6];
    [(BCChatSuggestRemoteViewController *)self setHeaderActionItem:v12];

    unint64_t v13 = [(BCChatSuggestRemoteViewController *)self messageAlertActionForBizItem:v6 dialRequestAction:v7];
    os_signpost_id_t v14 = [(BCChatSuggestRemoteViewController *)self headerActionItem];
    v34[0] = v14;
    v34[1] = v13;
    v15 = +[NSArray arrayWithObjects:v34 count:2];
    [(BCChatSuggestRemoteViewController *)self setPendingActionItems:v15];

    uint64_t v16 = [(BCChatSuggestRemoteViewController *)self bizItem];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(BCChatSuggestRemoteViewController *)self bizItem];
      unsigned __int8 v19 = [v18 isAvailableForCalling];

      if ((v19 & 1) == 0)
      {
        v20 = [(BCChatSuggestRemoteViewController *)self bizItem];
        v21 = [(BCChatSuggestRemoteViewController *)self callAlertActionForBizItem:v20 dialRequestAction:v7];

        v22 = [(BCChatSuggestRemoteViewController *)self deviceState];
        unsigned __int8 v23 = [v22 isLocked];

        if (v23)
        {
          [(BCChatSuggestRemoteViewController *)self _dismiss];

LABEL_17:
          goto LABEL_18;
        }
        v24 = [(BCChatSuggestRemoteViewController *)self actionsViewController];
        [v24 replaceLastActionItem:v21 reloadRowImmediately:0];
      }
    }
  }
  if (![(BCChatSuggestRemoteViewController *)self chatSuggestUIPresented]
    || ([(BCChatSuggestRemoteViewController *)self pendingActionItems],
        v25 = objc_claimAutoreleasedReturnValue(),
        id v26 = [v25 count],
        v25,
        !v26))
  {
LABEL_14:
    +[BCCoreAnalytics logEventForView:@"com.apple.BusinessChatViewService.ChatSuggestAppears" bizItem:v6 bizItemReturnedAfterAction:0 latency:[(BCChatSuggestRemoteViewController *)self _latencyFromViewDidLoad]];
    [(BCChatSuggestRemoteViewController *)self _logPhoneNumberDisplayedIfNecessary];
    unint64_t v13 = sub_100007F6C();
    unint64_t v31 = [(BCChatSuggestRemoteViewController *)self tapId];
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v32 = v31;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v32, "RenderBusinessChatMessageAction", (const char *)&unk_10000FB72, v33, 2u);
      }
    }
    goto LABEL_17;
  }
  v27 = [(BCChatSuggestRemoteViewController *)self deviceState];
  unsigned int v28 = [v27 isLocked];

  if (!v28)
  {
    v29 = [(BCChatSuggestRemoteViewController *)self actionsViewController];
    v30 = [(BCChatSuggestRemoteViewController *)self pendingActionItems];
    [v29 addActionItems:v30];

    [(BCChatSuggestRemoteViewController *)self setPendingActionItems:0];
    goto LABEL_14;
  }
LABEL_2:
  [(BCChatSuggestRemoteViewController *)self _dismiss];
LABEL_18:
}

- (void)configureAlertControllerForDialRequestAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIAlertController);
  [v5 setPreferredStyle:0];
  [v5 _setShouldAlignToKeyboard:0];
  id v6 = +[NSMutableArray arrayWithCapacity:1];
  id v7 = [(BCChatSuggestRemoteViewController *)self bizItem];

  if (v7)
  {
    os_signpost_id_t v8 = [(BCChatSuggestRemoteViewController *)self pendingActionItems];
    unsigned int v9 = [(BCChatSuggestRemoteViewController *)self bizItem];
    unint64_t v10 = [(BCChatSuggestRemoteViewController *)self callAlertActionForBizItem:v9 dialRequestAction:v4];

    if ([v8 count])
    {
      os_signpost_id_t v11 = [v8 arrayByAddingObject:v10];

      [(BCChatSuggestRemoteViewController *)self setPendingActionItems:0];
    }
    else
    {
      unint64_t v13 = [(BCChatSuggestRemoteViewController *)self bizItem];
      os_signpost_id_t v14 = [(BCChatSuggestRemoteViewController *)self headerAlertActionForBizItem:v13];
      [(BCChatSuggestRemoteViewController *)self setHeaderActionItem:v14];

      v15 = [(BCChatSuggestRemoteViewController *)self bizItem];
      uint64_t v16 = [(BCChatSuggestRemoteViewController *)self messageAlertActionForBizItem:v15 dialRequestAction:v4];

      v17 = [(BCChatSuggestRemoteViewController *)self headerActionItem];
      v21[0] = v17;
      v21[1] = v16;
      v21[2] = v10;
      os_signpost_id_t v11 = +[NSArray arrayWithObjects:v21 count:3];
    }
    [v6 addObjectsFromArray:v11];
  }
  else
  {
    objc_super v12 = [(BCChatSuggestRemoteViewController *)self callAlertActionForBizItem:0 dialRequestAction:v4];
    [v6 addObject:v12];
  }
  v18 = [[BCActionsListViewController alloc] initWithActionItems:v6 brandedHeaderDelegate:self];
  unsigned __int8 v19 = [(BCChatSuggestRemoteViewController *)self bizItem];
  [(BCActionsListViewController *)v18 setBusinessItem:v19];

  [v5 setContentViewController:v18];
  v20 = [(BCChatSuggestRemoteViewController *)self defaultAlertActionForDialRequestAction:v4];
  [v5 addAction:v20];
  [(BCChatSuggestRemoteViewController *)self setActionsViewController:v18];
  [(BCChatSuggestRemoteViewController *)self setAlertController:v5];
  [(BCChatSuggestRemoteViewController *)self _logPhoneNumberDisplayedIfNecessary];
}

- (id)headerAlertActionForBizItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  unsigned int v5 = [v3 isVerified];

  if (v5)
  {
    id v6 = +[BCVSUtilities classBundle];
    id v7 = [v6 localizedStringForKey:@"VERIFIED" value:&stru_100010878 table:0];
  }
  else
  {
    id v7 = 0;
  }
  os_signpost_id_t v8 = [[BCAlertActionItem alloc] initWithTitle:v4 subTitle:v7 iconName:0 actionType:1 handler:0];

  return v8;
}

- (id)messageAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [BCAlertActionItem alloc];
  unsigned int v9 = [v6 messageTitle];
  unint64_t v10 = [v6 messageSubtitle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006368;
  v15[3] = &unk_100010450;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  unint64_t v13 = [(BCAlertActionItem *)v8 initWithTitle:v9 subTitle:v10 iconName:@"MessageIcon" actionType:2 handler:v15];

  return v13;
}

- (id)callAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 info];
  os_signpost_id_t v8 = [v7 objectForSetting:1];

  unsigned int v9 = +[TUHandle handleWithDictionaryRepresentation:v8];
  unint64_t v10 = [v9 value];
  id v11 = [v5 info];
  id v12 = [v11 objectForSetting:2];

  unint64_t v13 = [v5 info];
  os_signpost_id_t v14 = [v13 objectForSetting:3];

  v15 = +[NSString stringWithFormat:@"%@ %@", v14, v12];
  id v16 = [BCAlertActionItem alloc];
  v17 = [v6 callSubtitle];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100006870;
  v23[3] = &unk_100010450;
  v23[4] = self;
  id v24 = v5;
  id v25 = v10;
  id v18 = v10;
  id v19 = v5;
  v20 = [(BCAlertActionItem *)v16 initWithTitle:v15 subTitle:v17 iconName:@"PhoneIcon" actionType:2 handler:v23];

  return v20;
}

- (id)defaultAlertActionForDialRequestAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 info];
  id v6 = [v5 objectForSetting:4];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006CB4;
  v10[3] = &unk_100010478;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  os_signpost_id_t v8 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v10];

  return v8;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = sub_100007F6C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unint64_t v10 = "-[BCChatSuggestRemoteViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(BCChatSuggestRemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000104B8];
  [v7 setReachabilityDisabled:1];
  [v7 setAllowsAlertStacking:0];
  [v7 setOrientationChangedEventsEnabled:1];
  os_signpost_id_t v8 = +[UIApplication sharedApplication];
  [v7 setLaunchingInterfaceOrientation:[v8 activeInterfaceOrientation]];

  if (v5) {
    v5[2](v5);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_signpost_id_t v8 = sub_100007F6C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    os_signpost_id_t v14 = "-[BCChatSuggestRemoteViewController prepareForActivationWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  int v9 = [(BCChatSuggestRemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000104D8];
  [v9 setStatusBarHidden:1 withDuration:0.4];
  if ((byte_100016870 & 1) == 0)
  {
    byte_100016870 = 1;
    unint64_t v10 = [v6 actions];
    id v11 = [v10 allObjects];
    id v12 = [v11 firstObject];
    [(BCChatSuggestRemoteViewController *)self setDialRequestAction:v12];
  }
  if (v7) {
    v7[2](v7);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)_dismiss
{
  self->_chatSuggestUIPresented = 0;
  pendingActionItems = self->_pendingActionItems;
  self->_pendingActionItems = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = 0;

  dialRequestAction = self->_dialRequestAction;
  self->_dialRequestAction = 0;

  bizItem = self->_bizItem;
  self->_bizItem = 0;

  headerActionItem = self->_headerActionItem;
  self->_headerActionItem = 0;

  self->_chatSuggestRemoteViewControllerDismissed = 1;
  id v9 = [(BCChatSuggestRemoteViewController *)self _remoteViewControllerProxy];
  [v9 deactivate];
}

- (void)fetchBizInfoForDialRequestAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 info];
  id v6 = [v5 objectForSetting:1];

  id v7 = +[TUHandle handleWithDictionaryRepresentation:v6];
  if ([v7 type] == (id)2)
  {
    os_signpost_id_t v8 = [v7 value];
    id v9 = [v8 length];

    if (v9)
    {
      objc_initWeak(&location, self);
      id v10 = objc_alloc_init((Class)BCSBusinessQueryService);
      id v11 = [v7 value];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000736C;
      v12[3] = &unk_100010528;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      [v10 fetchBusinessItemForPhoneNumber:v11 completion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_logPhoneNumberDisplayedIfNecessary
{
  if (![(BCChatSuggestRemoteViewController *)self phoneNumberUIPresented])
  {
    [(BCChatSuggestRemoteViewController *)self setPhoneNumberUIPresentedTime:CACurrentMediaTime()];
    id v3 = [(BCChatSuggestRemoteViewController *)self bizItem];
    [(BCChatSuggestRemoteViewController *)self setHadBizItemWhenPhoneNumberUIPresented:v3 != 0];
  }
  [(BCChatSuggestRemoteViewController *)self setPhoneNumberUIPresented:1];
  id v4 = [(BCChatSuggestRemoteViewController *)self bizItem];

  if (v4 && ![(BCChatSuggestRemoteViewController *)self phoneNumberDisplayLogged])
  {
    [(BCChatSuggestRemoteViewController *)self setPhoneNumberDisplayLogged:1];
    [(BCChatSuggestRemoteViewController *)self phoneNumberUIPresentedTime];
    double v6 = v5;
    [(BCChatSuggestRemoteViewController *)self viewControllerDidLoadTime];
    uint64_t v8 = (uint64_t)((v6 - v7) * 1000.0);
    uint64_t v9 = [(BCChatSuggestRemoteViewController *)self hadBizItemWhenPhoneNumberUIPresented] ^ 1;
    id v10 = [(BCChatSuggestRemoteViewController *)self bizItem];
    +[BCCoreAnalytics logEventForView:@"com.apple.BusinessChatViewService.PhoneNumberAppears" bizItem:v10 bizItemReturnedAfterAction:v9 latency:v8];
  }
}

- (int64_t)_latencyFromViewDidLoad
{
  double v3 = CACurrentMediaTime();
  [(BCChatSuggestRemoteViewController *)self viewControllerDidLoadTime];
  return (uint64_t)((v3 - v4) * 1000.0);
}

- (void)brandedHeaderViewController:(id)a3 logoFetchingWillBeginForBusinessItem:(id)a4
{
  double v5 = sub_100007F6C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[BCChatSuggestRemoteViewController brandedHeaderViewController:logoFetchingWillBeginForBusinessItem:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  double v6 = sub_100007F6C();
  unint64_t v7 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RenderBusinessChatIcon", (const char *)&unk_10000FB72, (uint8_t *)&v9, 2u);
    }
  }
}

- (void)brandedHeaderViewController:(id)a3 logoFetchingDidFinishForBusinessItem:(id)a4 success:(BOOL)a5
{
  double v6 = sub_100007F6C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[BCChatSuggestRemoteViewController brandedHeaderViewController:logoFetchingDidFinishForBusinessItem:success:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
  }

  unint64_t v7 = sub_100007F6C();
  unint64_t v8 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v9, "RenderBusinessChatIcon", (const char *)&unk_10000FB72, (uint8_t *)&v16, 2u);
    }
  }

  id v10 = sub_100007F6C();
  unint64_t v11 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "RenderBusinessChatUI", (const char *)&unk_10000FB72, (uint8_t *)&v16, 2u);
    }
  }

  id v13 = sub_100007F6C();
  unint64_t v14 = [(BCChatSuggestRemoteViewController *)self tapId];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, v15, "ChatSuggestEnd", (const char *)&unk_10000FB72, (uint8_t *)&v16, 2u);
    }
  }
}

- (BCDeviceStateProtocol)deviceState
{
  return self->_deviceState;
}

- (BCPresenterProtocol)presenter
{
  return self->_presenter;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BCActionsListViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setActionsViewController:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BCAlertActionItem)headerActionItem
{
  return self->_headerActionItem;
}

- (void)setHeaderActionItem:(id)a3
{
}

- (BCSBusinessItem)bizItem
{
  return self->_bizItem;
}

- (void)setBizItem:(id)a3
{
}

- (BSAction)dialRequestAction
{
  return self->_dialRequestAction;
}

- (NSArray)pendingActionItems
{
  return self->_pendingActionItems;
}

- (void)setPendingActionItems:(id)a3
{
}

- (unint64_t)tapId
{
  return self->_tapId;
}

- (void)setTapId:(unint64_t)a3
{
  self->_tapId = a3;
}

- (BOOL)chatSuggestUIPresented
{
  return self->_chatSuggestUIPresented;
}

- (void)setChatSuggestUIPresented:(BOOL)a3
{
  self->_chatSuggestUIPresented = a3;
}

- (BOOL)phoneNumberUIPresented
{
  return self->_phoneNumberUIPresented;
}

- (void)setPhoneNumberUIPresented:(BOOL)a3
{
  self->_phoneNumberUIPresented = a3;
}

- (BOOL)phoneNumberDisplayLogged
{
  return self->_phoneNumberDisplayLogged;
}

- (void)setPhoneNumberDisplayLogged:(BOOL)a3
{
  self->_phoneNumberDisplayLogged = a3;
}

- (BOOL)chatSuggestRemoteViewControllerDismissed
{
  return self->_chatSuggestRemoteViewControllerDismissed;
}

- (void)setChatSuggestRemoteViewControllerDismissed:(BOOL)a3
{
  self->_chatSuggestRemoteViewControllerDismissed = a3;
}

- (double)viewControllerDidLoadTime
{
  return self->_viewControllerDidLoadTime;
}

- (void)setViewControllerDidLoadTime:(double)a3
{
  self->_viewControllerDidLoadTime = a3;
}

- (double)phoneNumberUIPresentedTime
{
  return self->_phoneNumberUIPresentedTime;
}

- (void)setPhoneNumberUIPresentedTime:(double)a3
{
  self->_phoneNumberUIPresentedTime = a3;
}

- (BOOL)hadBizItemWhenPhoneNumberUIPresented
{
  return self->_hadBizItemWhenPhoneNumberUIPresented;
}

- (void)setHadBizItemWhenPhoneNumberUIPresented:(BOOL)a3
{
  self->_hadBizItemWhenPhoneNumberUIPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActionItems, 0);
  objc_storeStrong((id *)&self->_dialRequestAction, 0);
  objc_storeStrong((id *)&self->_bizItem, 0);
  objc_storeStrong((id *)&self->_headerActionItem, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end