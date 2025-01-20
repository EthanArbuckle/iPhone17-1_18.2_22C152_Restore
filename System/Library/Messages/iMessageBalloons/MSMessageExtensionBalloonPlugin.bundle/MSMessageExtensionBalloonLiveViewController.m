@interface MSMessageExtensionBalloonLiveViewController
- (BOOL)_allowAllPresentationStyles;
- (BOOL)_applicationStateIsBackground;
- (BOOL)_hasValidSnapshot;
- (BOOL)_isInShelf;
- (BOOL)_isShowingLoadingView;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasLiveViewSize;
- (BOOL)isInShelf;
- (BOOL)needsResize;
- (BOOL)needsSnapshot;
- (BOOL)shouldDisableInsetsForGrabber;
- (CGSize)contentSize;
- (CGSize)lastRequestSize;
- (CGSize)liveView:(id)a3 sizeThatFits:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IMPluginPayload)payload;
- (MSMessageExtensionBalloonLiveViewController)initWithDataSource:(id)a3 fromMe:(BOOL)a4 conversationID:(id)a5 recipients:(id)a6;
- (MSMessageExtensionBalloonLiveViewControllerDelegate)delegate;
- (MSMessageExtensionBalloonLoadingView)loadingView;
- (MSMessageExtensionDataSource)dataSource;
- (NSArray)recipients;
- (NSString)conversationID;
- (NSTimer)sizeUpdater;
- (UIButton)contextualMenuPlacementButton;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIImage)appIcon;
- (UIView)snapshotView;
- (id)_iMessageLoginID;
- (id)_itemPayloadFromMSMessage:(id)a3;
- (id)_remoteProxy;
- (id)_snapshotView;
- (id)balloonExtensionPlugin;
- (id)balloonPlugin;
- (id)conversationState;
- (id)pluginBundleID;
- (id)remoteBalloonViewControllerContextIdentifier:(id)a3;
- (id)snapshotIdentifier;
- (id)substituteNameInString:(id)a3;
- (id)substituteNameInString:(id)a3 withAppID:(id)a4;
- (int64_t)snapshotViewInterfaceStyle;
- (void)_handleApplicationStateResumeFromInActive:(id)a3;
- (void)_handleDynamicTextSizeChange:(id)a3;
- (void)_handleLocaleChange:(id)a3;
- (void)_handleRemoteConnectionInterrupted:(id)a3;
- (void)_initializeContentSize;
- (void)_initializeStaticView;
- (void)_makeDelegateCallForBrowserPresentationStyle:(unint64_t)a3;
- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5;
- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6;
- (void)_remoteViewDidBecomeReadyForDisplay;
- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap;
- (void)_remoteViewProvidesExplicitSizeSnapshot;
- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3;
- (void)_requestHostSceneIdentifierWithCompletion:(id)a3;
- (void)_requestPresentationStyle:(unint64_t)a3;
- (void)_requestResize;
- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6;
- (void)_swapOutSnapshotView;
- (void)clearShelfPayload;
- (void)configureLiveViewForDisplay:(id)a3;
- (void)createRemoteBalloonViewControllerIsResuming:(BOOL)a3;
- (void)dealloc;
- (void)didFinishAnimatedBoundsChange;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)pluginPayloadDataDidChangeForLiveView:(id)a3;
- (void)pluginPayloadDidChangeForLiveView:(id)a3;
- (void)reloadRemoteViewIsResuming:(BOOL)a3;
- (void)remoteBalloonViewControllerDidLoad:(id)a3;
- (void)remoteBalloonViewControllerWillLoad:(id)a3;
- (void)requestSizeThatFits:(CGSize)a3 presentationStyle:(unint64_t)a4 completionHandler:(id)a5;
- (void)requestSnapshot;
- (void)sendDidBecomeActiveMessage;
- (void)setAppIcon:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContextualMenuPlacementButton:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasLiveViewSize:(BOOL)a3;
- (void)setLastRequestSize:(CGSize)a3;
- (void)setLoadingView:(id)a3;
- (void)setNeedsResize:(BOOL)a3;
- (void)setNeedsSnapshot:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setSizeUpdater:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setSnapshotViewInterfaceStyle:(int64_t)a3;
- (void)tearDownRemoteView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSMessageExtensionBalloonLiveViewController

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  -[MSMessageExtensionBalloonLiveViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (!a3) {
    [(_MSRemoteBalloonViewController *)self->_remoteViewController purgeRemoteViewController];
  }
}

- (void)dealloc
{
  v3 = [(MSMessageExtensionBalloonLiveViewController *)self sizeUpdater];
  [v3 invalidate];

  [(_MSRemoteBalloonViewController *)self->_remoteViewController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  [(MSMessageExtensionBalloonLiveViewController *)&v4 dealloc];
}

- (id)_remoteProxy
{
  return [(_MSRemoteBalloonViewController *)self->_remoteViewController remoteProxy];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  [(MSMessageExtensionBalloonLiveViewController *)&v4 viewDidLayoutSubviews];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_55FC;
  block[3] = &unk_3C9E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  [(MSMessageExtensionBalloonLiveViewController *)&v21 viewWillAppear:a3];
  objc_super v4 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
  double v10 = vabdd_f64(v6, v9);
  double v12 = vabdd_f64(v8, v11);

  if (v10 >= 0.00000011920929 || v12 >= 0.00000011920929)
  {
    v14 = ms_defaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      [v15 bounds];
      v28.width = v16;
      v28.height = v17;
      v18 = NSStringFromCGSize(v28);
      [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
      v19 = NSStringFromCGSize(v29);
      v20 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      *(_DWORD *)buf = 138412802;
      v23 = v18;
      __int16 v24 = 2112;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "LiveBubble. NeedResize because current view size %@ != contentSize %@ for messageGUID: %@", buf, 0x20u);
    }
    [(MSMessageExtensionDataSource *)self->_dataSource needsResize];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  [(MSMessageExtensionBalloonLiveViewController *)&v9 viewDidAppear:a3];
  objc_super v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_24818();
  }

  double v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 isRunningTest:CKPluginChatItemPPTName];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5910;
    block[3] = &unk_3C9E8;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MSMessageExtensionBalloonLiveViewController *)self createRemoteBalloonViewControllerIsResuming:0];
  }
}

- (void)didFinishAnimatedBoundsChange
{
  if (![(MSMessageExtensionBalloonLiveViewController *)self needsResize])
  {
    [(MSMessageExtensionBalloonLiveViewController *)self _swapOutSnapshotView];
  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  *a4 = 1;
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setRecipients:(id)a3
{
  if (self->_recipients != a3) {
    objc_storeStrong((id *)&self->_recipients, a3);
  }

  _objc_release_x1();
}

- (void)setConversationID:(id)a3
{
  if (self->_conversationID != a3) {
    objc_storeStrong((id *)&self->_conversationID, a3);
  }

  _objc_release_x1();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5C28;
  v9[3] = &unk_3CA10;
  v9[4] = self;
  -[MSMessageExtensionBalloonLiveViewController requestSizeThatFits:presentationStyle:completionHandler:](self, "requestSizeThatFits:presentationStyle:completionHandler:", 2, v9, a3.width, a3.height);
  objc_super v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
    double v5 = NSStringFromCGSize(v14);
    unsigned int v6 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    *(_DWORD *)buf = 138412546;
    double v11 = v5;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. Returning contentSize: %@ | messageGUID: %@", buf, 0x16u);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setNeedsResize:(BOOL)a3
{
  if (self->_needsResize != a3)
  {
    self->_needsResize = a3;
    if (a3) {
      -[MSMessageExtensionBalloonLiveViewController setLastRequestSize:](self, "setLastRequestSize:", CGSizeZero.width, CGSizeZero.height);
    }
  }
}

- (void)requestSizeThatFits:(CGSize)a3 presentationStyle:(unint64_t)a4 completionHandler:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  objc_super v9 = (void (**)(id, void))a5;
  if ([(MSMessageExtensionBalloonLiveViewController *)self needsResize])
  {
    double v10 = [(MSMessageExtensionBalloonLiveViewController *)self _remoteProxy];
    BOOL v11 = v10 == 0;

    __int16 v12 = ms_defaultLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v32 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
        remoteViewController = self->_remoteViewController;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v42 = 2112;
        v43 = remoteViewController;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "LiveBubble. Early returning size request for messageGUID: %@. Reason: remoteProxy is nil, remoteViewController %@", buf, 0x16u);
      }
      [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
      v9[2](v9, 0);
    }
    else
    {
      if (v13)
      {
        CGSize v14 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "LiveBubble. Attempting to request new size for messageGUID: %@", buf, 0xCu);
      }
      [(MSMessageExtensionBalloonLiveViewController *)self lastRequestSize];
      double v17 = CGSizeZero.height;
      BOOL v18 = vabdd_f64(CGSizeZero.width, width) >= 0.00000011920929;
      uint64_t v19 = vabdd_f64(v17, height) >= 0.00000011920929 || v18;
      BOOL v20 = vabdd_f64(v15, width) >= 0.00000011920929;
      uint64_t v21 = vabdd_f64(v16, height) >= 0.00000011920929 || v20;
      [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
      double v23 = vabdd_f64(v22, CGSizeZero.width);
      BOOL v25 = vabdd_f64(v24, v17) < 0.00000011920929 && v23 < 0.00000011920929;
      if (v25 || (v19 & v21 & 1) != 0)
      {
        -[MSMessageExtensionBalloonLiveViewController setLastRequestSize:](self, "setLastRequestSize:", width, height);
        v34 = [(MSMessageExtensionBalloonLiveViewController *)self sizeUpdater];
        [v34 invalidate];

        [(MSMessageExtensionBalloonLiveViewController *)self setSizeUpdater:0];
        v35 = +[UIApplication sharedApplication];
        LOBYTE(v34) = [v35 isRunningTest];

        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_6164;
        v37[3] = &unk_3CAB0;
        v39[1] = *(id *)&width;
        v39[2] = *(id *)&height;
        v39[3] = (id)a4;
        objc_copyWeak(v39, (id *)buf);
        v37[4] = self;
        v38 = v9;
        char v40 = (char)v34;
        v36 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v37 block:0.25];
        [(MSMessageExtensionBalloonLiveViewController *)self setSizeUpdater:v36];

        objc_destroyWeak(v39);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __int16 v26 = ms_defaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
          CGSize v28 = +[NSNumber numberWithBool:v21];
          CGSize v29 = +[NSNumber numberWithBool:v19];
          [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
          v30 = NSStringFromCGSize(v50);
          v31 = +[NSNumber numberWithBool:[(MSMessageExtensionBalloonLiveViewController *)self needsResize]];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v27;
          __int16 v42 = 2112;
          v43 = v28;
          __int16 v44 = 2112;
          v45 = v29;
          __int16 v46 = 2112;
          v47 = v30;
          __int16 v48 = 2112;
          v49 = v31;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "LiveBubble. Early returning size request for messageGUID : %@ | lastRequestSize != size : %@ | size != 0 : %@| current contentSize : %@ | needsResize : %@", buf, 0x34u);
        }
        [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
        v9[2](v9, 0);
      }
    }
  }
  else
  {
    [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
    v9[2](v9, 0);
  }
}

- (void)requestSnapshot
{
  v3 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  objc_super v4 = [v3 staticView];
  if (v4)
  {

    goto LABEL_7;
  }
  double v5 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
  double v11 = vabdd_f64(v7, v10);
  double v13 = vabdd_f64(v9, v12);

  if (v11 >= 0.00000011920929 || v13 >= 0.00000011920929)
  {
LABEL_7:
    double v15 = ms_defaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      double v17 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      BOOL v18 = [v17 staticView];
      uint64_t v19 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      [v19 bounds];
      v40.double width = v20;
      v40.double height = v21;
      double v22 = NSStringFromCGSize(v40);
      [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
      double v23 = NSStringFromCGSize(v41);
      *(_DWORD *)buf = 138413058;
      v33 = v16;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2112;
      v37 = v22;
      __int16 v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "LiveBubble. Not taking snapshot for messageGUID: %@. staticView %@ != nil or current view size %@ != contentSize %@", buf, 0x2Au);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  unsigned __int8 v24 = [(MSMessageExtensionBalloonLiveViewController *)self _isInShelf];
  BOOL v25 = ms_defaultLog();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if ((v24 & 1) == 0)
  {
    if (v26)
    {
      CGSize v29 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
      v30 = [v29 messageGUID];
      *(_DWORD *)buf = 138412290;
      v33 = v30;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "LiveBubble. Requesting snapshot for messageGUID: %@", buf, 0xCu);
    }
    if ([(_MSRemoteBalloonViewController *)self->_remoteViewController providesExplicitSizeSnapshot])
    {
      [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
      double v15 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
    }
    else
    {
      double v15 = 0;
    }
    double v16 = [(MSMessageExtensionBalloonLiveViewController *)self _remoteProxy];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_6B94;
    v31[3] = &unk_3CB00;
    v31[4] = self;
    [v16 _requestSnapshotThatFits:v15 completion:v31];
    goto LABEL_9;
  }
  if (v26)
  {
    v27 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "LiveBubble. Took snapshot for shelf message. messageGUID: %@ ", buf, 0xCu);
  }
  CGSize v28 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  double v15 = [v28 snapshotViewAfterScreenUpdates:0];

  [(MSMessageExtensionBalloonLiveViewController *)self setSnapshotView:v15];
LABEL_10:
}

- (BOOL)shouldDisableInsetsForGrabber
{
  return 0;
}

- (id)snapshotIdentifier
{
  if ([(MSMessageExtensionBalloonLiveViewController *)self _isInShelf])
  {
    v3 = [(MSMessageExtensionDataSource *)self->_dataSource chat];
    objc_super v4 = [v3 guid];
    double v5 = +[NSString stringWithFormat:@"%@-ShelfIdentifier", v4];
  }
  else
  {
    v3 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
    double v5 = [v3 messageGUID];
  }

  return v5;
}

- (void)clearShelfPayload
{
  if ([(MSMessageExtensionBalloonLiveViewController *)self _isInShelf])
  {
    id v8 = [(_MSRemoteBalloonViewController *)self->_remoteViewController requestUUID];
    if (v8)
    {
      v3 = +[IMBalloonPluginManager sharedInstance];
      objc_super v4 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
      double v5 = [v4 pluginBundleID];
      double v6 = [v3 balloonPluginForBundleID:v5];

      double v7 = [v6 extension];
      [v7 cancelExtensionRequestWithIdentifier:v8];
    }
  }
}

- (void)tearDownRemoteView
{
}

- (void)reloadRemoteViewIsResuming:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2484C();
  }

  [(MSMessageExtensionBalloonLiveViewController *)self createRemoteBalloonViewControllerIsResuming:v3];
}

- (id)conversationState
{
  BOOL v3 = +[IMBalloonPluginManager sharedInstance];
  objc_super v4 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
  double v5 = [v4 pluginPayload];
  double v6 = [v5 pluginBundleID];
  double v7 = [v3 balloonPluginForBundleID:v6];

  id v8 = objc_alloc_init((Class)_MSConversationState);
  uint64_t v9 = [(MSMessageExtensionBalloonLiveViewController *)self conversationID];
  v73 = v7;
  uint64_t v10 = [v7 identifier];
  double v11 = +[IMBalloonPluginManager sharedInstance];
  double v12 = [v11 conversationID:v9 appID:v10];
  [v8 setConversationIdentifier:v12];

  double v13 = +[IMBalloonPluginManager sharedInstance];
  v76 = (void *)v10;
  v71 = (void *)v9;
  CGSize v14 = [v13 localParticipantIdentifierForAppID:v10 conversationID:v9];
  v74 = v8;
  [v8 setSenderIdentifier:v14];

  double v15 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
  double v16 = [v15 message];
  double v17 = [v16 _sanitizedCopy];

  v77 = +[NSMutableArray array];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v72 = self;
  BOOL v18 = [(MSMessageExtensionBalloonLiveViewController *)self recipients];
  id v19 = [v18 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v19)
  {
    id v20 = v19;
    v75 = 0;
    uint64_t v21 = *(void *)v79;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v79 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        unsigned __int8 v24 = +[IMBalloonPluginManager sharedInstance];
        BOOL v25 = [v24 recipientIDForRecipient:v23 appID:v76];

        [v77 addObject:v25];
        if (([v17 isFromMe] & 1) == 0)
        {
          BOOL v26 = [v17 senderParticipantIdentifier];
          unsigned int v27 = [v25 isEqual:v26];

          if (v27)
          {
            id v28 = v23;

            v75 = v28;
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v20);
  }
  else
  {
    v75 = 0;
  }

  id v29 = [v77 copy];
  v30 = v74;
  [v74 setRecipientIdentifiers:v29];

  BOOL v31 = [(MSMessageExtensionBalloonLiveViewController *)v72 _isInShelf];
  [v17 setPending:v31];
  [v74 setActiveMessage:v17];
  v32 = &selRef_presentationStyle;
  if (v31)
  {
    v33 = ms_defaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v34 = [(MSMessageExtensionDataSource *)v72->_dataSource messageGUID];
      *(_DWORD *)buf = 138412546;
      v83 = v17;
      __int16 v84 = 2112;
      CFStringRef v85 = v34;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "LiveBubble. Configured message as pending: %@. messageGUID: %@", buf, 0x16u);
    }
  }
  v35 = ms_defaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v36 = [(MSMessageExtensionDataSource *)v72->_dataSource messageGUID];
    *(_DWORD *)buf = 138412546;
    v83 = v74;
    __int16 v84 = 2112;
    CFStringRef v85 = v36;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "LiveBubble. Configured conversationState: %@. messageGUID: %@", buf, 0x16u);
  }
  BOOL v37 = [(MSMessageExtensionBalloonLiveViewController *)v72 hasEntitlement:@"com.apple.messages.private.AllowConversationIdentifierAccess"];
  BOOL v38 = [(MSMessageExtensionBalloonLiveViewController *)v72 hasEntitlement:@"com.apple.messages.private.AllowParticipantAddressAccess"];
  uint64_t v39 = [(MSMessageExtensionBalloonLiveViewController *)v72 hasEntitlement:@"com.apple.messages.private.AllowGUIDAccess"];
  CGSize v40 = ms_defaultLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    CGSize v41 = +[NSNumber numberWithBool:v37];
    __int16 v42 = +[NSNumber numberWithBool:v38];
    +[NSNumber numberWithBool:v39];
    uint64_t v39 = v43 = v39;
    *(_DWORD *)buf = 138412802;
    v83 = v41;
    __int16 v84 = 2112;
    CFStringRef v85 = v42;
    __int16 v86 = 2112;
    CFStringRef v87 = (const __CFString *)v39;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "LiveBubble. Checking entitlements. hasAllowConversationIdentifierEntitlement: %@ | hasParticipantAddressEntitlement: %@ | _kAllowGUIDAccessEntitlement: %@", buf, 0x20u);

    LODWORD(v39) = v43;
    v32 = &selRef_presentationStyle;
  }
  if (v37 || v38)
  {
    __int16 v44 = +[CKConversationList sharedConversationList];
    v45 = [v44 conversationForExistingChatWithGUID:v72->_conversationID];

    if (v37)
    {
      int v70 = v39;
      [v74 setConversationID:v72->_conversationID];
      v49 = [v45 chat];
      CGSize v50 = [v49 engramID];
      [v74 setConversationEngramID:v50];

      v51 = [v45 chat];
      v52 = [v51 groupID];
      [v74 setGroupID:v52];

      v53 = [(MSMessageExtensionDataSource *)v72->_dataSource chat];
      v54 = [v53 account];
      v55 = [v54 service];
      v56 = +[IMServiceImpl iMessageService];
      [v74 setIsiMessage:v55 == v56];

      v57 = [(MSMessageExtensionDataSource *)v72->_dataSource chat];
      objc_msgSend(v74, "setIsBusiness:", objc_msgSend(v57, "isBusinessChat"));

      v58 = ms_defaultLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = [v45 chat];
        v60 = [v59 chatIdentifier];
        if ([v74 isiMessage]) {
          CFStringRef v61 = @"YES";
        }
        else {
          CFStringRef v61 = @"NO";
        }
        unsigned int v62 = [v74 isBusiness];
        *(_DWORD *)buf = 138412802;
        if (v62) {
          CFStringRef v63 = @"YES";
        }
        else {
          CFStringRef v63 = @"NO";
        }
        v83 = v60;
        __int16 v84 = 2112;
        CFStringRef v85 = v61;
        v30 = v74;
        __int16 v86 = 2112;
        CFStringRef v87 = v63;
        _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "LiveBubble.  Entitled for conversation identifiers. Configured conversationState for chat identifier: %@ with isiMessage: %@, isBusiness: %@.", buf, 0x20u);
      }
      v32 = &selRef_presentationStyle;
      LODWORD(v39) = v70;
      if (!v38)
      {
LABEL_24:
        if (!v39)
        {
LABEL_26:

          goto LABEL_27;
        }
LABEL_25:
        __int16 v46 = [*(id *)((char *)&v72->super.super.super.isa + *((int *)v32 + 921)) messageGUID];
        [v17 setGuid:v46];

        goto LABEL_26;
      }
    }
    else if (!v38)
    {
      goto LABEL_24;
    }
    v64 = [v45 senderIdentifier];
    [v30 setSenderAddress:v64];

    v65 = [v45 recipientStrings];
    [v30 setRecipientAddresses:v65];

    if ([v17 isFromMe])
    {
      v66 = [v30 senderAddress];

      if (v66) {
        [v30 senderAddress];
      }
      else {
      v67 = [(MSMessageExtensionBalloonLiveViewController *)v72 _iMessageLoginID];
      }
      [v17 setSenderAddress:v67];
    }
    else
    {
      [v17 setSenderAddress:v75];
      v67 = [(MSMessageExtensionBalloonLiveViewController *)v72 dataSource];
      v68 = [v67 pluginPayload];
      v69 = [v68 time];
      [v17 setTime:v69];
    }
    if (!v39) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_27:
  id v47 = v30;

  return v47;
}

- (MSMessageExtensionBalloonLiveViewController)initWithDataSource:(id)a3 fromMe:(BOOL)a4 conversationID:(id)a5 recipients:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MSMessageExtensionBalloonLiveViewController;
  CGSize v14 = [(MSMessageExtensionBalloonLiveViewController *)&v19 initWithNibName:0 bundle:0];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dataSource, a3);
    v15->_isFromMe = a4;
    objc_storeStrong((id *)&v15->_conversationID, a5);
    objc_storeStrong((id *)&v15->_recipients, a6);
    double v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v15 selector:"_handleDynamicTextSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
    [v16 addObserver:v15 selector:"_handleLocaleChange:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v16 addObserver:v15 selector:"_handleRemoteConnectionInterrupted:" name:IMExtensionRemoteConnectionWasInterrupted object:0];
    if (CKIsRunningInMacCatalyst()) {
      [v16 addObserver:v15 selector:"_handleApplicationStateResumeFromInActive:" name:CKApplicationStateResumeFromInActiveNotification object:0];
    }
    if (CKIsRunningInCarousel())
    {
      double v17 = ms_defaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_24880();
      }

      [(MSMessageExtensionBalloonLiveViewController *)v15 createRemoteBalloonViewControllerIsResuming:0];
    }
  }
  return v15;
}

- (void)loadView
{
  BOOL v3 = -[MSMessageExtensionBalloonLiveView initWithFrame:dataSource:fromMe:]([MSMessageExtensionBalloonLiveView alloc], "initWithFrame:dataSource:fromMe:", self->_dataSource, self->_isFromMe, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MSMessageExtensionBalloonLiveViewController *)self setView:v3];

  objc_super v4 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  [v4 setDelegate:self];

  double v5 = [MSMessageExtensionBalloonLoadingView alloc];
  double v6 = [(MSMessageExtensionBalloonLiveViewController *)self appIcon];
  double v7 = [(MSMessageExtensionBalloonLoadingView *)v5 initWithAppIcon:v6 fromMe:self->_isFromMe];

  [(MSMessageExtensionBalloonLiveViewController *)self setLoadingView:v7];
  [(MSMessageExtensionBalloonLiveViewController *)self _initializeStaticView];
  [(MSMessageExtensionBalloonLiveViewController *)self _initializeContentSize];
  if (![(MSMessageExtensionBalloonLiveViewController *)self _hasValidSnapshot]
    || [(MSMessageExtensionBalloonLiveViewController *)self _isShowingLoadingView])
  {
    [(MSMessageExtensionBalloonLiveViewController *)self setNeedsResize:1];
  }
  id v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
    uint64_t v10 = NSStringFromCGSize(v24);
    id v11 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    id v12 = [v11 staticView];
    id v13 = +[NSNumber numberWithBool:[(MSMessageExtensionBalloonLiveViewController *)self _hasValidSnapshot]];
    int v16 = 138413058;
    double v17 = v9;
    __int16 v18 = 2112;
    objc_super v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    double v23 = v13;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "LiveBubble. Initialized with messageGUID: %@, contentSize: %@, staticView: %@, hasValidSnapshot: %@", (uint8_t *)&v16, 0x2Au);
  }
  CGSize v14 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
  double v15 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  [v15 updateIconForPlugin:v14];
}

- (BOOL)_applicationStateIsBackground
{
  return +[CKApplicationState isBackground];
}

- (void)_initializeStaticView
{
  id v4 = [(MSMessageExtensionBalloonLiveViewController *)self _snapshotView];
  BOOL v3 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  [v3 setStaticView:v4];
}

- (BOOL)_isInShelf
{
  return [(MSMessageExtensionDataSource *)self->_dataSource payloadInShelf];
}

- (BOOL)_isShowingLoadingView
{
  BOOL v3 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  id v4 = [v3 staticView];
  if (v4)
  {
    double v5 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    double v6 = [v5 staticView];
    double v7 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_initializeContentSize
{
  id v19 = [(MSMessageExtensionBalloonLiveViewController *)self view];
  BOOL v3 = [v19 staticView];
  id v4 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];

  if (v3 == v4)
  {
    double v6 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];
    double v7 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    [v7 bounds];
    objc_msgSend(v6, "sizeThatFits:", v8, v9);
    double v11 = v10;
    double v13 = v12;

    double v5 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v11, v13);
  }
  else
  {
    double v5 = [v19 staticView];
    [v5 sizeToFit];
  }

  CGSize v14 = [v19 staticView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  -[MSMessageExtensionBalloonLiveViewController setContentSize:](self, "setContentSize:", v16, v18);
}

- (id)_snapshotView
{
  snapshotView = self->_snapshotView;
  if (!snapshotView)
  {
    id v4 = +[NSString stringWithFormat:@"%@-LiveBubbleSendAnimation", @"ShelfIdentifier"];
    uint64_t v5 = +[CKSnapshotUtilities _snapshotViewForGUID:v4];
    if (v5)
    {
      double v6 = (UIView *)v5;
    }
    else
    {
      double v7 = [(MSMessageExtensionBalloonLiveViewController *)self snapshotIdentifier];
      double v6 = +[CKSnapshotUtilities _snapshotViewForGUID:v7];

      if (!v6)
      {
        double v8 = [(MSMessageExtensionBalloonLiveViewController *)self snapshotIdentifier];
        double v9 = +[CKSnapshotUtilities snapshotForGUID:v8];

        if (!v9) {
          goto LABEL_7;
        }
        uint64_t v10 = [(MSMessageExtensionBalloonLiveViewController *)self snapshotIdentifier];

        double v11 = +[CKSnapshotUtilities snapshotForGUID:v10];
        double v6 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v11];

        id v4 = (void *)v10;
        if (!v6)
        {
LABEL_7:
          double v12 = ms_defaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            double v13 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v13;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "LiveBubble. No snapshot, will show loading view. messageGUID: %@", buf, 0xCu);
          }
          double v6 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];
          CGSize v14 = [(MSMessageExtensionBalloonLiveViewController *)self view];
          [v14 setForceHideAppIcon:1];
        }
      }
    }
    double v15 = ms_defaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      double v23 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "LiveBubble. Setting snapshotView to %@. messageGUID: %@", buf, 0x16u);
    }
    double v17 = self->_snapshotView;
    self->_snapshotView = v6;

    double v18 = [(MSMessageExtensionBalloonLiveViewController *)self traitCollection];
    -[MSMessageExtensionBalloonLiveViewController setSnapshotViewInterfaceStyle:](self, "setSnapshotViewInterfaceStyle:", [v18 userInterfaceStyle]);

    snapshotView = self->_snapshotView;
  }

  return snapshotView;
}

- (UIImage)appIcon
{
  appIcon = self->_appIcon;
  if (!appIcon)
  {
    id v4 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
    uint64_t v5 = [(MSMessageExtensionBalloonLiveViewController *)self traitCollection];
    objc_msgSend(v4, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
    double v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      double v7 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
      double v8 = [v7 payloadDictionary];

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_83B8;
      v11[3] = &unk_3CB28;
      v11[4] = self;
      double v6 = +[IMBalloonPlugin __ck_appIconFromPayloadDictionary:v8 withCompletionBlock:v11];
    }
    double v9 = self->_appIcon;
    self->_appIcon = v6;

    appIcon = self->_appIcon;
  }

  return appIcon;
}

- (BOOL)_hasValidSnapshot
{
  BOOL v3 = [(MSMessageExtensionBalloonLiveViewController *)self _snapshotView];
  if (v3)
  {
    id v4 = [(MSMessageExtensionBalloonLiveViewController *)self _snapshotView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (IMPluginPayload)payload
{
  v2 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
  BOOL v3 = [v2 pluginPayload];

  return (IMPluginPayload *)v3;
}

- (void)_handleDynamicTextSizeChange:(id)a3
{
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    int v6 = 138412290;
    double v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. Handling dynamic text size change. messageGUID: %@", (uint8_t *)&v6, 0xCu);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self setNeedsResize:1];
}

- (void)_handleLocaleChange:(id)a3
{
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    int v6 = 138412290;
    double v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. Handling locale change. messageGUID: %@", (uint8_t *)&v6, 0xCu);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self setNeedsResize:1];
}

- (void)configureLiveViewForDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    double v7 = +[NSNumber numberWithBool:[(_MSRemoteBalloonViewController *)self->_remoteViewController loadedRemoteView]];
    double v8 = +[NSNumber numberWithBool:[(_MSRemoteBalloonViewController *)self->_remoteViewController isReadyToDisplay]];
    int v14 = 138413058;
    id v15 = v4;
    __int16 v16 = 2112;
    double v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble. Configuring live view for display. LiveView: %@ | messageGUD: %@ | loadedRemoteView: %@ | isReadyForDisplay: %@", (uint8_t *)&v14, 0x2Au);
  }
  if (![(MSMessageExtensionBalloonLiveViewController *)self _isInShelf])
  {
    if ([(_MSRemoteBalloonViewController *)self->_remoteViewController loadedRemoteView]
      && [(_MSRemoteBalloonViewController *)self->_remoteViewController isReadyToDisplay])
    {
      [(MSMessageExtensionBalloonLiveViewController *)self _swapOutSnapshotView];
    }
    else
    {
      double v9 = [(MSMessageExtensionBalloonLiveViewController *)self traitCollection];
      id v10 = [v9 userInterfaceStyle];
      int64_t v11 = [(MSMessageExtensionBalloonLiveViewController *)self snapshotViewInterfaceStyle];

      if (v10 != (id)v11) {
        [(MSMessageExtensionBalloonLiveViewController *)self setSnapshotView:0];
      }
      double v12 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      double v13 = [(MSMessageExtensionBalloonLiveViewController *)self _snapshotView];
      [v12 setStaticView:v13];
    }
  }
}

- (void)pluginPayloadDidChangeForLiveView:(id)a3
{
  id v8 = a3;
  id v4 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
  uint64_t v5 = [v8 dataSource];
  int v6 = [v5 pluginPayload];

  if (v4 != v6)
  {
    double v7 = [v8 dataSource];
    [(MSMessageExtensionBalloonLiveViewController *)self setDataSource:v7];
  }
}

- (void)pluginPayloadDataDidChangeForLiveView:(id)a3
{
  id v6 = [(MSMessageExtensionBalloonLiveViewController *)self conversationState];
  id v4 = [(MSMessageExtensionBalloonLiveViewController *)self _remoteProxy];
  uint64_t v5 = [v6 activeMessage];
  [v4 _didUpdateMessage:v5 conversationState:v6];
}

- (CGSize)liveView:(id)a3 sizeThatFits:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  if ([(MSMessageExtensionBalloonLiveViewController *)self needsResize])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        double v9 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
        int v14 = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "LiveBubble. We don't have a good size as we need to resize. Returning the sizeThatFits size. messageGUID: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
    CGFloat width = v10;
    CGFloat height = v11;
  }

  double v12 = width;
  double v13 = height;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)_handleRemoteConnectionInterrupted:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:IMExtensionRemoteConnectionInterruptedBundleIdentifier];
  id v6 = ms_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    double v17 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "LiveBubble. Handling extension interruption for bundleID %@. messageGUID: %@", (uint8_t *)&v14, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(MSMessageExtensionDataSource *)self->_dataSource bundleID];
    double v9 = IMBalloonExtensionIDWithSuffix();
    unsigned int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      uint64_t v11 = [(MSMessageExtensionBalloonLiveViewController *)self pluginBundleID];

      id v8 = (void *)v11;
    }
    if ([v8 isEqualToIgnoringCase:v5])
    {
      double v12 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      [(MSMessageExtensionBalloonLiveViewController *)self _initializeStaticView];
      [(_MSRemoteBalloonViewController *)self->_remoteViewController handleRemoteInterruption];
      [(_MSRemoteBalloonViewController *)self->_remoteViewController willMoveToParentViewController:0];
      [v12 setRemoteBalloonView:0];
      [(_MSRemoteBalloonViewController *)self->_remoteViewController removeFromParentViewController];
      remoteViewController = self->_remoteViewController;
      self->_remoteViewController = 0;
    }
  }
}

- (void)_handleApplicationStateResumeFromInActive:(id)a3
{
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_248B4();
  }

  [(MSMessageExtensionBalloonLiveViewController *)self createRemoteBalloonViewControllerIsResuming:1];
}

- (void)remoteBalloonViewControllerWillLoad:(id)a3
{
  id v4 = [(_MSRemoteBalloonViewController *)self->_remoteViewController extensionContext];
  [v4 setDelegate:self];

  [(MSMessageExtensionBalloonLiveViewController *)self sendDidBecomeActiveMessage];
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInFullCKClient())
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v6 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v6 extension], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (void *)v7;
      double v9 = [(_MSRemoteBalloonViewController *)self->_remoteViewController requestUUID];
      unsigned int v10 = [v8 _extensionContextForUUID:v9];
      uint64_t v11 = [v10 _auxiliaryConnection];
      double v12 = [v11 valueForEntitlement:v4];

      if (v12)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 1;
    }
  }
  return isKindOfClass & 1;
}

- (void)remoteBalloonViewControllerDidLoad:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:[(MSMessageExtensionBalloonLiveViewController *)self needsResize]];
    uint64_t v7 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
    id v8 = +[NSNumber numberWithBool:[(_MSRemoteBalloonViewController *)self->_remoteViewController isReadyToDisplay]];
    double v9 = +[NSNumber numberWithBool:[(MSMessageExtensionBalloonLiveViewController *)self _hasValidSnapshot]];
    *(_DWORD *)buf = 138413314;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    double v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble remoteBalloonViewController did load remoteBalloonViewController: %@,  needsResize: %@ messageGUID: %@ isReadyToDisplay: %@ hasValidSnapshot: %@", buf, 0x34u);
  }
  if ([(_MSRemoteBalloonViewController *)self->_remoteViewController isReadyToDisplay]) {
    [(MSMessageExtensionBalloonLiveViewController *)self _swapOutSnapshotView];
  }
  if ([(MSMessageExtensionBalloonLiveViewController *)self _isInShelf])
  {
    unsigned int v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:IMPayloadDidLoadContent object:0];
  }
  else if ([(MSMessageExtensionBalloonLiveViewController *)self needsResize] {
         || ![(MSMessageExtensionBalloonLiveViewController *)self _hasValidSnapshot])
  }
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9198;
    block[3] = &unk_3C9E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)remoteBalloonViewControllerContextIdentifier:(id)a3
{
  id v4 = [(MSMessageExtensionBalloonLiveViewController *)self delegate];
  uint64_t v5 = [v4 liveViewControllerContextIdentifier:self];

  return v5;
}

- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_92CC;
  v11[3] = &unk_3CB78;
  id v13 = self;
  id v14 = a5;
  id v12 = v8;
  BOOL v15 = a4;
  id v9 = v14;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_9828;
  v10[3] = &unk_3CBA0;
  v10[4] = self;
  id v11 = a3;
  id v12 = a6;
  BOOL v13 = a4;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(MSMessageExtensionBalloonLiveViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9FA0;
    block[3] = &unk_3CBF0;
    __int16 v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = self;
    id v20 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v14 = v16;
  }
  else
  {
    id v14 = ms_defaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_24A88();
    }
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(MSMessageExtensionBalloonLiveViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_A220;
    v18[3] = &unk_3CC18;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    __int16 v22 = self;
    id v24 = v16;
    id v23 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

    id v17 = v19;
  }
  else
  {
    id v17 = ms_defaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_24A88();
    }
  }
}

- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![(MSMessageExtensionBalloonLiveViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    id v18 = ms_defaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_24A88();
    }
LABEL_6:

    goto LABEL_7;
  }
  id v17 = [v14 count];
  if (v17 != [v15 count])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_7;
    }
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "LiveBubble. We don't have matching number of button titles to styles. Abort.", buf, 2u);
    }
    goto LABEL_6;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_A6EC;
  v19[3] = &unk_3CCB8;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v23 = v15;
  id v24 = self;
  id v25 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

LABEL_7:
}

- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_AC0C;
  v15[3] = &unk_3CD08;
  v15[4] = self;
  id v16 = a3;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  id v17 = a4;
  id v18 = a6;
  id v12 = v18;
  id v13 = v17;
  id v14 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
}

- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AFA0;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B0F8;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B250;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_requestPresentationStyle:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (!a3) {
    goto LABEL_9;
  }
  if (a3 != 3)
  {
    if (a3 != 1)
    {
      uint64_t v5 = ms_defaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble requested unspported presentation style %ld, bailing.", (uint8_t *)&v7, 0xCu);
      }

      return;
    }
    goto LABEL_9;
  }
  if ([(MSMessageExtensionBalloonLiveViewController *)self _allowAllPresentationStyles])
  {
    unint64_t v3 = 2;
LABEL_9:
    [(MSMessageExtensionBalloonLiveViewController *)self _makeDelegateCallForBrowserPresentationStyle:v3];
    return;
  }
  id v6 = ms_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = 3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "LiveBubble requested disallowed presentation style %ld, bailing.", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  unsigned int v4 = [(MSMessageExtensionBalloonLiveViewController *)self _allowAllPresentationStyles];
  uint64_t v5 = ms_defaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble called _requestFullScreenModalPresentationWithSize. Modal presentation is supported, but live bubbles do not currently support custom modal sizes. Using default modal presentation", buf, 2u);
    }

    [(MSMessageExtensionBalloonLiveViewController *)self _makeDelegateCallForBrowserPresentationStyle:2];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble called _requestFullScreenModalPresentationWithSize which is unsupported", v7, 2u);
    }
  }
}

- (void)_makeDelegateCallForBrowserPresentationStyle:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B5D8;
  v3[3] = &unk_3CD30;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_requestResize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B6A0;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B790;
    v6[3] = &unk_3CD58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (BOOL)_allowAllPresentationStyles
{
  return [(MSMessageExtensionBalloonLiveViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAllPresentationStyles"];
}

- (BOOL)isInShelf
{
  v2 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
  unint64_t v3 = [v2 messageGUID];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)_swapOutSnapshotView
{
  if (![(MSMessageExtensionBalloonLiveViewController *)self _isShowingLoadingView]
    || self->_hasLiveViewSize
    && ([(MSMessageExtensionBalloonLiveViewController *)self view],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 window],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if (![(_MSRemoteBalloonViewController *)self->_remoteViewController needsSizeMatchBeforeSnapshotSwap])goto LABEL_11; {
    uint64_t v5 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    }
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
    double v11 = vabdd_f64(v7, v10);
    double v13 = vabdd_f64(v9, v12);

    if (v11 < 0.00000011920929 && v13 < 0.00000011920929)
    {
LABEL_11:
      CGFloat v22 = ms_defaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
        *(_DWORD *)buf = 138412290;
        *(void *)CGSize v50 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "LiveBubble swapping out snapshotView GUID: %@", buf, 0xCu);
      }
      unsigned int v24 = [(MSMessageExtensionBalloonLiveViewController *)self _isShowingLoadingView];
      id v25 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
      unsigned int v26 = [v25 payloadInShelf];

      unsigned int v27 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      id v28 = [(_MSRemoteBalloonViewController *)self->_remoteViewController view];
      id v29 = [(MSMessageExtensionBalloonLiveViewController *)self loadingView];
      if (v24)
      {
        [v28 setAlpha:0.33];
        double v30 = 1.0;
        if (v26) {
          double v30 = 0.0;
        }
        [v29 setAlpha:v30];
        BOOL v31 = [v27 iconView];
        [v31 setAlpha:0.0];

        v32 = [v29 layer];
        [v32 setValue:&off_3E008 forKeyPath:@"filters.gaussianBlur.inputRadius"];

        v33 = [v28 layer];
        [v33 setValue:&off_3E020 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      }
      [v27 setRemoteBalloonView:v28];
      [v27 setForceHideAppIcon:0];
      __int16 v34 = [(MSMessageExtensionBalloonLiveViewController *)self snapshotView];

      if (v34) {
        [(MSMessageExtensionBalloonLiveViewController *)self setSnapshotView:0];
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_BE80;
      v46[3] = &unk_3CAD8;
      id v15 = v27;
      id v47 = v15;
      __int16 v48 = self;
      v35 = objc_retainBlock(v46);
      __int16 v36 = v35;
      if (v24)
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_BEC4;
        v42[3] = &unk_3CD80;
        id v43 = v28;
        id v44 = v29;
        v45 = v15;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_BFB0;
        v40[3] = &unk_3CDA8;
        id v41 = v36;
        +[UIView animateWithDuration:0 delay:v42 options:v40 animations:0.25 completion:0.0];
      }
      else
      {
        ((void (*)(void *))v35[2])(v35);
      }
    }
    else
    {
      id v15 = ms_defaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(MSMessageExtensionBalloonLiveViewController *)self view];
        [v16 bounds];
        v51.CGFloat width = v17;
        v51.CGFloat height = v18;
        CGFloat v19 = NSStringFromCGSize(v51);
        [(MSMessageExtensionBalloonLiveViewController *)self contentSize];
        CGFloat v20 = NSStringFromCGSize(v52);
        CGFloat v21 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
        *(_DWORD *)buf = 138412802;
        *(void *)CGSize v50 = v19;
        *(_WORD *)&v50[8] = 2112;
        *(void *)&v50[10] = v20;
        *(_WORD *)&v50[18] = 2112;
        *(void *)&v50[20] = v21;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "LiveBubble. Not swapping out snapshotView, current view size %@ != contentSize %@. GUID: %@", buf, 0x20u);

LABEL_23:
      }
    }
  }
  else
  {
    id v15 = ms_defaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hasLiveViewSize = self->_hasLiveViewSize;
      BOOL v38 = [(MSMessageExtensionBalloonLiveViewController *)self view];
      CGFloat v19 = [v38 window];
      uint64_t v39 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)CGSize v50 = hasLiveViewSize;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v19;
      *(_WORD *)&v50[14] = 2112;
      *(void *)&v50[16] = v39;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "LiveBubble. Not swapping out snapshotView, currently showing loading view and don't have live view size: %i or no window: %@. GUID: %@", buf, 0x1Cu);

      goto LABEL_23;
    }
  }
}

- (id)pluginBundleID
{
  unint64_t v3 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
  BOOL v4 = [v3 pluginBundleID];

  uint64_t v5 = IMBalloonExtensionIDWithSuffix();
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    double v7 = ms_defaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
      double v9 = [v8 messageGUID];
      int v12 = 138412290;
      double v13 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "LiveBubble subbing screentime extension bundle ID with AskTo bundle ID for message with GUID: %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = IMBalloonExtensionIDWithSuffix();

    BOOL v4 = (void *)v10;
  }

  return v4;
}

- (id)balloonPlugin
{
  v2 = [(MSMessageExtensionBalloonLiveViewController *)self pluginBundleID];
  unint64_t v3 = +[IMBalloonPluginManager sharedInstance];
  BOOL v4 = [v3 balloonPluginForBundleID:v2];

  return v4;
}

- (void)createRemoteBalloonViewControllerIsResuming:(BOOL)a3
{
  if ([(MSMessageExtensionBalloonLiveViewController *)self _applicationStateIsBackground]&& !a3)
  {
    uint64_t v5 = ms_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      int v26 = 138412290;
      unsigned int v27 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "LiveBubble. ApplicationState is background and not resuming. messageGUID: %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_31;
  }
  if (self->_remoteViewController) {
    return;
  }
  uint64_t v5 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
  double v7 = [(MSMessageExtensionBalloonLiveViewController *)self recipients];
  unsigned __int8 v8 = [v5 shouldShowForRecipients:v7];

  if ((v8 & 1) == 0)
  {
    double v9 = ms_defaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(MSMessageExtensionDataSource *)self->_dataSource messageGUID];
      int v26 = 138412290;
      unsigned int v27 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "LiveBubble. Plugin should not be shown for specified recipients. messageGUID: %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v5 extension];
  }
  else
  {
    double v9 = 0;
  }
  double v11 = ms_defaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_24CB8(v9, v11);
  }

  int v12 = [(MSMessageExtensionBalloonLiveViewController *)self payload];
  uint64_t v13 = [v12 messageGUID];
  id v14 = (void *)v13;
  id v15 = @"_MSRemoteBalloonViewControllerShelfIdentifier";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  id v16 = v15;

  CGFloat v17 = ms_defaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_24C44();
  }

  if (v9)
  {
    CGFloat v18 = [[_MSRemoteBalloonViewController alloc] initWithExtension:v9 identifier:v16];
LABEL_22:
    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = v18;

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v18 = [[_MSRemoteBalloonViewController alloc] initWithPlugin:v5 identifier:v16];
    goto LABEL_22;
  }
LABEL_23:
  CGFloat v20 = self->_remoteViewController;
  if (v20)
  {
    [(_MSRemoteBalloonViewController *)v20 setDelegate:self];
    [(MSMessageExtensionBalloonLiveViewController *)self addChildViewController:self->_remoteViewController];
    CGFloat v21 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    CGFloat v22 = [v21 window];

    if (!v22)
    {
      id v23 = ms_defaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_24BA4((uint64_t)self, v23);
      }
    }
    unsigned int v24 = [(_MSRemoteBalloonViewController *)self->_remoteViewController view];
    id v25 = [(MSMessageExtensionBalloonLiveViewController *)self view];
    [v25 setRemoteBalloonView:v24];

    [(_MSRemoteBalloonViewController *)self->_remoteViewController didMoveToParentViewController:self];
  }

LABEL_30:
LABEL_31:
}

- (void)sendDidBecomeActiveMessage
{
  remoteViewController = self->_remoteViewController;
  id v3 = [(MSMessageExtensionBalloonLiveViewController *)self conversationState];
  [(_MSRemoteBalloonViewController *)remoteViewController becomeActiveWithConversationState:v3];
}

- (id)balloonExtensionPlugin
{
  v2 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return v2;
}

- (id)substituteNameInString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MSMessageExtensionBalloonLiveViewController *)self balloonExtensionPlugin];
    unsigned int v6 = [v5 identifier];
    double v7 = [(MSMessageExtensionBalloonLiveViewController *)self substituteNameInString:v4 withAppID:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)substituteNameInString:(id)a3 withAppID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = v7;
  if (v6 && v7)
  {
    id v43 = v6;
    double v9 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v10 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    double v11 = [(MSMessageExtensionBalloonLiveViewController *)self conversationState];
    int v12 = [v11 senderAddress];

    if (v12)
    {
      if (v10) {
        CFArrayAppendValue(v10, v12);
      }
      if (v9)
      {
        uint64_t v13 = +[IMBalloonPluginManager sharedInstance];
        id v14 = [(MSMessageExtensionBalloonLiveViewController *)self conversationID];
        id v15 = [v13 localParticipantIdentifierForAppID:v8 conversationID:v14];
        id v16 = [v15 UUIDString];

        if (v16)
        {
          CGFloat v17 = +[IMBalloonPluginManager sharedInstance];
          CGFloat v18 = [(MSMessageExtensionBalloonLiveViewController *)self conversationID];
          CGFloat v19 = [v17 localParticipantIdentifierForAppID:v8 conversationID:v18];
          CGFloat v20 = [v19 UUIDString];
          CFArrayAppendValue(v9, v20);
        }
      }
    }
    id v41 = self;
    __int16 v42 = (void *)v12;
    id v44 = v8;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    CGFloat v21 = [(MSMessageExtensionBalloonLiveViewController *)self recipients];
    id v22 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          int v26 = *(const void **)(*((void *)&v45 + 1) + 8 * i);
          unsigned int v27 = +[IMBalloonPluginManager sharedInstance];
          id v28 = [v27 recipientIDForRecipient:v26 appID:v44];
          id v29 = [v28 UUIDString];

          if (v9 && v29) {
            CFArrayAppendValue(v9, v29);
          }
          if (v10 && v26) {
            CFArrayAppendValue(v10, v26);
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v23);
    }

    id v30 = [(__CFArray *)v9 count];
    if (v30 == [(__CFArray *)v10 count])
    {
      BOOL v31 = [v43 mutableCopy];
      if ([(__CFArray *)v9 count])
      {
        unint64_t v32 = 0;
        do
        {
          v33 = [(__CFArray *)v10 objectAtIndexedSubscript:v32];
          __int16 v34 = +[NSString stringWithFormat:@"$(%@)", v33];

          v35 = [(__CFArray *)v9 objectAtIndexedSubscript:v32];
          __int16 v36 = [@"$" stringByAppendingString:v35];

          -[NSObject replaceOccurrencesOfString:withString:options:range:](v31, "replaceOccurrencesOfString:withString:options:range:", v36, v34, 2, 0, [v31 length]);
          ++v32;
        }
        while ((unint64_t)[(__CFArray *)v9 count] > v32);
      }
      id v37 = [v31 copy];
      id v6 = v43;
    }
    else
    {
      BOOL v31 = ms_defaultLog();
      id v6 = v43;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = +[NSNumber numberWithUnsignedInteger:[(__CFArray *)v9 count]];
        CGSize v40 = +[NSNumber numberWithUnsignedInteger:[(__CFArray *)v10 count]];
        *(_DWORD *)buf = 138412802;
        CGSize v50 = v41;
        __int16 v51 = 2112;
        id v52 = v39;
        __int16 v53 = 2112;
        v54 = v40;
        _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "self %@ substituteNameInString [recipientIdentifiers count] %@ != [recipientName count] %@ ", buf, 0x20u);
      }
      id v37 = 0;
    }

    unsigned __int8 v8 = v44;
  }
  else
  {
    ms_defaultLog();
    double v9 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CGSize v50 = self;
      __int16 v51 = 2112;
      id v52 = v6;
      __int16 v53 = 2112;
      v54 = v8;
      _os_log_error_impl(&dword_0, (os_log_t)v9, OS_LOG_TYPE_ERROR, "self %@ substituteNameInString invalid parameters string %@ appID %@", buf, 0x20u);
    }
    id v37 = 0;
  }

  return v37;
}

- (id)_itemPayloadFromMSMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSMessageExtensionBalloonLiveViewController *)self balloonPlugin];
  id v6 = [(MSMessageExtensionBalloonLiveViewController *)self balloonExtensionPlugin];
  id v7 = [v6 adamID];

  unsigned __int8 v8 = [v5 browserDisplayName];
  id v9 = [v5 canSendDataPayloads];
  uint64_t v10 = [(MSMessageExtensionBalloonLiveViewController *)self balloonExtensionPlugin];
  double v11 = objc_msgSend(v10, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
  int v12 = +[MSMessageExtensionDataSource pluginPayloadFromMessagePayload:v4 appIconData:v11 appName:v8 adamID:v7 allowDataPayloads:v9];

  uint64_t v13 = [v4 session];

  id v14 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
  id v15 = [v14 message];
  id v16 = [v15 session];
  unsigned int v17 = [v13 isEqual:v16];

  if (v17)
  {
    [v12 setUpdate:1];
    CGFloat v18 = [(MSMessageExtensionBalloonLiveViewController *)self dataSource];
    CGFloat v19 = [v18 sessionGUID];
    [v12 setAssociatedMessageGUID:v19];
  }
  CGFloat v20 = [(MSMessageExtensionBalloonLiveViewController *)self balloonExtensionPlugin];
  CGFloat v21 = [v20 attributionInfo];
  [v12 setAttributionInfo:v21];

  id v22 = [v12 statusText];
  id v23 = [(MSMessageExtensionBalloonLiveViewController *)self substituteNameInString:v22];
  [v12 setStatusText:v23];

  uint64_t v24 = [(MSMessageExtensionBalloonLiveViewController *)self balloonExtensionPlugin];
  id v25 = [v24 identifier];
  [v12 setPluginBundleID:v25];

  return v12;
}

- (id)_iMessageLoginID
{
  v2 = +[IMAccountController sharedInstance];
  id v3 = +[IMServiceImpl iMessageService];
  id v4 = [v2 operationalAccountsForService:v3];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    id v9 = 0;
    goto LABEL_15;
  }
  id v7 = v6;
  unsigned __int8 v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v12, "accountType", (void)v18) == (char *)&dword_0 + 2)
      {
        uint64_t v13 = v9;
        id v14 = v8;
        id v9 = v12;
      }
      else
      {
        uint64_t v13 = v8;
        id v14 = v12;
        if ([v12 accountType] != (char *)&dword_0 + 1) {
          continue;
        }
      }
      id v15 = v12;

      unsigned __int8 v8 = v14;
    }
    id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (v8)
  {
    id v16 = [v8 strippedLogin];
    goto LABEL_16;
  }
LABEL_15:
  id v16 = objc_msgSend(v9, "strippedLogin", (void)v18);
  unsigned __int8 v8 = 0;
LABEL_16:

  return v16;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)needsResize
{
  return self->_needsResize;
}

- (MSMessageExtensionBalloonLiveViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSMessageExtensionBalloonLiveViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MSMessageExtensionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)needsSnapshot
{
  return self->_needsSnapshot;
}

- (void)setNeedsSnapshot:(BOOL)a3
{
  self->_needsSnapshot = a3;
}

- (BOOL)hasLiveViewSize
{
  return self->_hasLiveViewSize;
}

- (void)setHasLiveViewSize:(BOOL)a3
{
  self->_BOOL hasLiveViewSize = a3;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (int64_t)snapshotViewInterfaceStyle
{
  return self->_snapshotViewInterfaceStyle;
}

- (void)setSnapshotViewInterfaceStyle:(int64_t)a3
{
  self->_snapshotViewInterfaceStyle = a3;
}

- (NSTimer)sizeUpdater
{
  return self->_sizeUpdater;
}

- (void)setSizeUpdater:(id)a3
{
}

- (CGSize)lastRequestSize
{
  double width = self->_lastRequestSize.width;
  double height = self->_lastRequestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastRequestSize:(CGSize)a3
{
  self->_lastRequestSize = a3;
}

- (UIButton)contextualMenuPlacementButton
{
  return self->_contextualMenuPlacementButton;
}

- (void)setContextualMenuPlacementButton:(id)a3
{
}

- (MSMessageExtensionBalloonLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void)setAppIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_contextualMenuPlacementButton, 0);
  objc_storeStrong((id *)&self->_sizeUpdater, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end