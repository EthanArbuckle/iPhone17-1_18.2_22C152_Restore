@interface MPVoicemailTableViewController
- (BOOL)allowTableViewScrolling;
- (BOOL)isAccountProvisioningRequired;
- (BOOL)isPendingAudioSessionActivation;
- (BOOL)isSearchViewController;
- (BOOL)isTranscriptionUnavailable;
- (BOOL)loadTipHeaderView;
- (BOOL)playMessageFromPlaybackQueue;
- (BOOL)playMessageOnReloadData;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (BOOL)shouldShowTranscriptionModelWarningHeaderViewForCount:(int64_t)a3;
- (BOOL)shouldSuppressAudioRouteAlertController;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableViewCanPerformReloadData:(id)a3;
- (BOOL)visible;
- (BOOL)voicemailMessageTableViewCell:(id)a3 shouldShowRTTButtonForRowWithIndexPath:(id)a4;
- (CGPoint)fixedTableViewContentOffset;
- (CNAvatarCardController)cardController;
- (MPVoicemailConnectionUnavailableView)connectionUnavailableView;
- (MPVoicemailController)voicemailController;
- (MPVoicemailTableViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4;
- (MPVoicemailTableViewControllerDelegate)fetchDelegate;
- (MPVoicemailTranscriptionUnavailableView)transcriptionUnavailableView;
- (NSArray)allVoicemails;
- (NSCache)voicemailMessageViewModelCache;
- (NSIndexPath)detailIndexPath;
- (NSMutableArray)messagePlaybackQueue;
- (NSMutableArray)observations;
- (NSMutableArray)voicemails;
- (PHAudioDeviceController)audioDeviceController;
- (PHAudioRoutingMenuController)routeListController;
- (PhoneNavigationController)phoneNavigationController;
- (TUFeatureFlags)featureFlags;
- (UIColor)dimmedColor;
- (UIGestureRecognizer)leftBarButtonItemGestureRecognizer;
- (UIGestureRecognizer)navBarGestureRecognizer;
- (UIGestureRecognizer)rightBarButtonItemGestureRecognizer;
- (VMAccountProvisioningViewController)accountProvisioningViewController;
- (VMMessageTranscriptionProgressView)progressView;
- (id)_allVoicemails;
- (id)audioPlaybackRequestBlock;
- (id)backgroundViewForTableView;
- (id)contactViewControllerForVoicemail:(id)a3;
- (id)currentExpandedVoicemailMessageCell;
- (id)indexPathForMessageID:(id)a3;
- (id)indexPathsForMessages:(id)a3;
- (id)messageAtIndex:(int64_t)a3;
- (id)messageToPlayFromPlaybackQueue;
- (id)messagesAtIndexPaths:(id)a3;
- (id)playerController;
- (id)preFetchingPredicate;
- (id)senderHandleForMessage:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unknownContactForMessage:(id)a3;
- (id)voicemailMessageViewModelForVoicemail:(id)a3 isExpanded:(BOOL)a4;
- (id)voicemails:(id)a3 passingTest:(id)a4;
- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4;
- (int64_t)senderHandleTypeForMessage:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchCurrentVoicemailsWithCompletion:(id)a3;
- (void)_fetchCurrentVoicemailsWithPredicate:(id)a3 completion:(id)a4;
- (void)_handleNavBarTap:(id)a3;
- (void)_updateUIForMaskViewChange;
- (void)addMessageToPlaybackQueue:(id)a3;
- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4;
- (void)cancelPlaybackRequest;
- (void)checkTranscriptionModelAvailability;
- (void)configureAudioButtonForRowAtIndexPath:(id)a3;
- (void)configureCellWithSeparatorColor:(id)a3 atIndexPath:(id)a4;
- (void)configureLegacyVoicemailCell:(id)a3 for:(id)a4 showLabel:(BOOL)a5 onCallTapped:(id)a6;
- (void)dealloc;
- (void)didTapContinueWithViewController:(id)a3;
- (void)didTapSettingsWithViewController:(id)a3;
- (void)exportVoicemailDataForVoicemail:(id)a3;
- (void)fetchRoutesForAudioRoutingMenuController:(id)a3 completionHandler:(id)a4;
- (void)handleDialVoiceMail:(id)a3;
- (void)handleMPRTTTranscriptionDidLoadNotification:(id)a3;
- (void)handleMPVoicemailControllerMessagesDidChangeNotification:(id)a3;
- (void)handlePHAudioDeviceControllerAudioRoutesChangedNotification:(id)a3;
- (void)handlePHAudioDeviceControllerPickedRouteChangedNotification:(id)a3;
- (void)handlePHDeviceCellularRadioEnabledDidChangeNotification:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)handleUIApplicationDidEnterBackgroundNotification:(id)a3;
- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3;
- (void)handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3;
- (void)handleVMVoicemailOnlineStatusChangedNotification:(id)a3;
- (void)handleVoicemailTranscriptionStatusChangedNotification:(id)a3;
- (void)hideProgressView;
- (void)layoutTableHeaderView;
- (void)loadTableHeaderView;
- (void)loadView;
- (void)performDeleteAtIndexPaths:(id)a3 completionBlock:(id)a4;
- (void)playMessage:(id)a3;
- (void)popViewControllerIfNeeded;
- (void)reloadDataIfNeeded;
- (void)reloadDataIfNil;
- (void)resetSelectedIndexPath;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAccountProvisioningViewController:(id)a3;
- (void)setAllVoicemails:(id)a3;
- (void)setAllowTableViewScrolling:(BOOL)a3;
- (void)setAudioPlaybackRequestBlock:(id)a3;
- (void)setCardController:(id)a3;
- (void)setConnectionUnavailableView:(id)a3;
- (void)setDetailIndexPath:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFetchDelegate:(id)a3;
- (void)setFixedTableViewContentOffset:(CGPoint)a3;
- (void)setIsPendingAudioSessionActivation:(BOOL)a3;
- (void)setIsSearchViewController:(BOOL)a3;
- (void)setLeftBarButtonItemGestureRecognizer:(id)a3;
- (void)setNavBarGestureRecognizer:(id)a3;
- (void)setObservations:(id)a3;
- (void)setPlayMessageOnReloadData:(BOOL)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setRightBarButtonItemGestureRecognizer:(id)a3;
- (void)setRouteListController:(id)a3;
- (void)setTranscriptionUnavailable:(BOOL)a3;
- (void)setTranscriptionUnavailableView:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVoicemails:(id)a3;
- (void)showHideProgressView;
- (void)showProgressView;
- (void)startObservingPreferences;
- (void)stopObservingPreferences;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 collapseRowAtIndexPath:(id)a4 animated:(BOOL)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 expandRowAtIndexPath:(id)a4 animated:(BOOL)a5;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLargeTitleInsets;
- (void)updateScreenTimeRestrictedViewForMessage:(id)a3 withViewModel:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voicemailMessageCellDidTapToCollapse:(id)a3;
- (void)voicemailMessageDetailViewController:(id)a3 destructiveActionPerformedForMessage:(id)a4 completionBlock:(id)a5;
- (void)voicemailMessageTableViewCell:(id)a3 actionButtonTappedForRowWithIndexPath:(id)a4;
- (void)voicemailMessageTableViewCell:(id)a3 audioRouteButtonTappedForRowWithIndexPath:(id)a4;
- (void)voicemailMessageTableViewCell:(id)a3 dialRequestButtonTappedForRowWithIndexPath:(id)a4;
- (void)voicemailMessageTableViewCell:(id)a3 didChangeElapsedTime:(double)a4;
- (void)voicemailMessageTableViewCell:(id)a3 didReceiveTranscriptFeedback:(unint64_t)a4;
- (void)voicemailMessageTableViewCell:(id)a3 didReceiveTranscriptTapGesture:(id)a4;
- (void)voicemailMessageTableViewCell:(id)a3 didRequestPlayState:(int64_t)a4;
- (void)voicemailMessageTableViewCell:(id)a3 moveButtonTappedForRowWithIndexPath:(id)a4;
- (void)voicemailMessageTableViewCell:(id)a3 rttButtonTappedForRowWithIndexPath:(id)a4;
- (void)voicemailMessageTableViewCellDidBeginScrubbing:(id)a3;
- (void)voicemailMessageTableViewCellDidCancelScrubbing:(id)a3;
- (void)voicemailMessageTableViewCellDidEndScrubbing:(id)a3;
- (void)voicemailMessageTableViewCellShouldPresentWelcomeViewController:(id)a3;
@end

@implementation MPVoicemailTableViewController

- (MPVoicemailTableViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MPVoicemailTableViewController;
  v8 = [(MPVoicemailTableViewController *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_phoneNavigationController, v6);
    objc_storeWeak((id *)&v9->_voicemailController, v7);
    v9->_allowTableViewScrolling = 1;
    uint64_t v10 = +[NSMutableArray array];
    messagePlaybackQueue = v9->_messagePlaybackQueue;
    v9->_messagePlaybackQueue = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    observations = v9->_observations;
    v9->_observations = (NSMutableArray *)v12;

    v14 = (NSCache *)objc_alloc_init((Class)NSCache);
    voicemailMessageViewModelCache = v9->_voicemailMessageViewModelCache;
    v9->_voicemailMessageViewModelCache = v14;

    v16 = (PHAudioDeviceController *)+[PHAudioDeviceController sharedAudioDeviceController];
    v9->_audioDeviceController = v16;
    [(PHAudioDeviceController *)v16 setDelegate:v9];
    v17 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v9->_featureFlags;
    v9->_featureFlags = v17;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __83__MPVoicemailTableViewController_initWithNavigationController_voicemailController___block_invoke;
    block[3] = &unk_10027C670;
    v19 = v9;
    v24 = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v20 = +[NSNotificationCenter defaultCenter];
    v21 = [(MPVoicemailTableViewController *)v19 voicemailController];
    [v20 addObserver:v19 selector:"handleMPVoicemailControllerMessagesDidChangeNotification:" name:@"MPVoicemailControllerMessagesDidChangeNotification" object:v21];
  }
  return v9;
}

id __83__MPVoicemailTableViewController_initWithNavigationController_voicemailController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsReloadData:1];
  [*(id *)(a1 + 32) reloadDataIfNeeded];
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished initial setup of %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setPlayMessageOnReloadData:1];
  return [*(id *)(a1 + 32) playMessageFromPlaybackQueue];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  navBarGestureRecognizer = self->_navBarGestureRecognizer;
  if (navBarGestureRecognizer)
  {
    [(UIGestureRecognizer *)navBarGestureRecognizer setDelegate:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneNavigationController);
    uint64_t v6 = [WeakRetained navigationBar];
    [v6 removeGestureRecognizer:self->_navBarGestureRecognizer];
  }
  leftBarButtonItemGestureRecognizer = self->_leftBarButtonItemGestureRecognizer;
  if (leftBarButtonItemGestureRecognizer)
  {
    [(UIGestureRecognizer *)leftBarButtonItemGestureRecognizer setDelegate:0];
    v8 = [(UIGestureRecognizer *)self->_leftBarButtonItemGestureRecognizer view];
    [v8 removeGestureRecognizer:self->_leftBarButtonItemGestureRecognizer];
  }
  rightBarButtonItemGestureRecognizer = self->_rightBarButtonItemGestureRecognizer;
  if (rightBarButtonItemGestureRecognizer)
  {
    [(UIGestureRecognizer *)rightBarButtonItemGestureRecognizer setDelegate:0];
    uint64_t v10 = [(UIGestureRecognizer *)self->_rightBarButtonItemGestureRecognizer view];
    [v10 removeGestureRecognizer:self->_rightBarButtonItemGestureRecognizer];
  }
  v11.receiver = self;
  v11.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v11 dealloc];
}

- (VMAccountProvisioningViewController)accountProvisioningViewController
{
  accountProvisioningViewController = self->_accountProvisioningViewController;
  if (!accountProvisioningViewController)
  {
    v4 = [VMAccountProvisioningViewController alloc];
    int v5 = [(MPVoicemailTableViewController *)self voicemailController];
    uint64_t v6 = [v5 accountManager];
    id v7 = [(VMViewController *)v4 initWithManager:v6];
    v8 = self->_accountProvisioningViewController;
    self->_accountProvisioningViewController = v7;

    accountProvisioningViewController = self->_accountProvisioningViewController;
  }

  return accountProvisioningViewController;
}

- (UIColor)dimmedColor
{
  v2 = [(MPVoicemailTableViewController *)self traitCollection];
  if ([v2 userInterfaceStyle] == (id)2) {
    +[UIColor blackColor];
  }
  else {
  uint64_t v3 = +[UIColor systemMidGrayColor];
  }
  v4 = [v3 colorWithAlphaComponent:0.600000024];

  return (UIColor *)v4;
}

- (void)_updateUIForMaskViewChange
{
  uint64_t v3 = [(MPVoicemailTableViewController *)self detailIndexPath];

  v4 = [(MPVoicemailTableViewController *)self navigationItem];
  int v5 = [v4 leftBarButtonItem];
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 setEnabled:0];

    id v7 = [(MPVoicemailTableViewController *)self navigationItem];
    v8 = [v7 rightBarButtonItem];
    [v8 setEnabled:0];

    v9 = [(MPVoicemailTableViewController *)self navigationController];
    uint64_t v10 = [v9 navigationBar];
    objc_super v11 = [(MPVoicemailTableViewController *)self navBarGestureRecognizer];
    [v10 addGestureRecognizer:v11];

    uint64_t v12 = [(MPVoicemailTableViewController *)self navigationController];
    v13 = [v12 navigationBar];
    v14 = [v13 currentLeftView];
    v15 = [(MPVoicemailTableViewController *)self leftBarButtonItemGestureRecognizer];
    [v14 addGestureRecognizer:v15];

    v16 = [(MPVoicemailTableViewController *)self navigationController];
    v17 = [v16 navigationBar];
    v18 = [v17 currentRightView];
    v19 = [(MPVoicemailTableViewController *)self rightBarButtonItemGestureRecognizer];
    [v18 addGestureRecognizer:v19];

    BOOL v20 = [(MPVoicemailTableViewController *)self visible];
    [(MPVoicemailTableViewController *)self setEditing:0 animated:v20];
  }
  else
  {
    [v5 setEnabled:1];

    v21 = [(MPVoicemailTableViewController *)self navigationItem];
    v22 = [v21 rightBarButtonItem];
    [v22 setEnabled:1];

    v23 = [(MPVoicemailTableViewController *)self navBarGestureRecognizer];

    if (v23)
    {
      v24 = [(MPVoicemailTableViewController *)self navBarGestureRecognizer];
      [v24 setDelegate:0];

      objc_super v25 = [(MPVoicemailTableViewController *)self navigationController];
      v26 = [v25 navigationBar];
      v27 = [(MPVoicemailTableViewController *)self navBarGestureRecognizer];
      [v26 removeGestureRecognizer:v27];

      [(MPVoicemailTableViewController *)self setNavBarGestureRecognizer:0];
    }
    v28 = [(MPVoicemailTableViewController *)self leftBarButtonItemGestureRecognizer];

    if (v28)
    {
      v29 = [(MPVoicemailTableViewController *)self leftBarButtonItemGestureRecognizer];
      [v29 setDelegate:0];

      v30 = [(MPVoicemailTableViewController *)self navigationController];
      v31 = [v30 navigationBar];
      v32 = [v31 currentLeftView];
      v33 = [(MPVoicemailTableViewController *)self leftBarButtonItemGestureRecognizer];
      [v32 removeGestureRecognizer:v33];

      [(MPVoicemailTableViewController *)self setLeftBarButtonItemGestureRecognizer:0];
    }
    v34 = [(MPVoicemailTableViewController *)self rightBarButtonItemGestureRecognizer];

    if (v34)
    {
      v35 = [(MPVoicemailTableViewController *)self rightBarButtonItemGestureRecognizer];
      [v35 setDelegate:0];

      v36 = [(MPVoicemailTableViewController *)self navigationController];
      v37 = [v36 navigationBar];
      v38 = [v37 currentRightView];
      v39 = [(MPVoicemailTableViewController *)self rightBarButtonItemGestureRecognizer];
      [v38 removeGestureRecognizer:v39];

      [(MPVoicemailTableViewController *)self setRightBarButtonItemGestureRecognizer:0];
    }
  }
}

- (UIGestureRecognizer)navBarGestureRecognizer
{
  navBarGestureRecognizer = self->_navBarGestureRecognizer;
  if (!navBarGestureRecognizer)
  {
    v4 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleNavBarTap:"];
    int v5 = self->_navBarGestureRecognizer;
    self->_navBarGestureRecognizer = v4;

    [(UIGestureRecognizer *)self->_navBarGestureRecognizer setDelegate:self];
    navBarGestureRecognizer = self->_navBarGestureRecognizer;
  }

  return navBarGestureRecognizer;
}

- (UIGestureRecognizer)leftBarButtonItemGestureRecognizer
{
  leftBarButtonItemGestureRecognizer = self->_leftBarButtonItemGestureRecognizer;
  if (!leftBarButtonItemGestureRecognizer)
  {
    v4 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleNavBarTap:"];
    int v5 = self->_leftBarButtonItemGestureRecognizer;
    self->_leftBarButtonItemGestureRecognizer = v4;

    [(UIGestureRecognizer *)self->_leftBarButtonItemGestureRecognizer setDelegate:self];
    leftBarButtonItemGestureRecognizer = self->_leftBarButtonItemGestureRecognizer;
  }

  return leftBarButtonItemGestureRecognizer;
}

- (UIGestureRecognizer)rightBarButtonItemGestureRecognizer
{
  rightBarButtonItemGestureRecognizer = self->_rightBarButtonItemGestureRecognizer;
  if (!rightBarButtonItemGestureRecognizer)
  {
    v4 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleNavBarTap:"];
    int v5 = self->_rightBarButtonItemGestureRecognizer;
    self->_rightBarButtonItemGestureRecognizer = v4;

    [(UIGestureRecognizer *)self->_rightBarButtonItemGestureRecognizer setDelegate:self];
    rightBarButtonItemGestureRecognizer = self->_rightBarButtonItemGestureRecognizer;
  }

  return rightBarButtonItemGestureRecognizer;
}

- (void)_handleNavBarTap:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v5 = [(MPVoicemailTableViewController *)self tableView];
    v4 = [(MPVoicemailTableViewController *)self detailIndexPath];
    [(MPVoicemailTableViewController *)self tableView:v5 collapseRowAtIndexPath:v4 animated:1];
  }
}

- (id)unknownContactForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 senderDestinationID];
  if ([v5 length])
  {
    uint64_t v6 = [(MPVoicemailTableViewController *)self senderHandleForMessage:v4];
    if (v6)
    {
      id v7 = [v4 senderISOCountryCode];
      v8 = [(MPVoicemailTableViewController *)self voicemailController];
      v9 = [v8 metadataCache];
      uint64_t v10 = +[CNMutableContact contactForHandle:v6 isoCountryCode:v7 metadataCache:v9];

      if (v10) {
        id v11 = [v10 copy];
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;

      v13 = v12;
    }
    else
    {
      v13 = objc_opt_new();
      id v12 = 0;
    }
  }
  else
  {
    id v12 = (id)objc_opt_new();
    v13 = v12;
  }

  return v13;
}

- (id)senderHandleForMessage:(id)a3
{
  uint64_t v3 = [a3 senderDestinationID];
  if ([v3 length])
  {
    id v4 = +[TUHandle normalizedHandleWithDestinationID:v3];
  }
  else
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MPVoicemailTableViewController: senderDestinationID is nil so the handle is nil", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (int64_t)senderHandleTypeForMessage:(id)a3
{
  uint64_t v3 = [(MPVoicemailTableViewController *)self senderHandleForMessage:a3];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = (int64_t)[v3 type];
  }
  else
  {
    uint64_t v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MPVoicemailTableViewController: sender handle is nil so we default the handle type to TUHandleTypeGeneric", v8, 2u);
    }

    int64_t v5 = 1;
  }

  return v5;
}

- (void)loadView
{
  v29.receiver = self;
  v29.super_class = (Class)MPVoicemailTableViewController;
  [(MPVoicemailTableViewController *)&v29 loadView];
  +[PHVoicemailMessageTableViewCell marginWidth];
  double v4 = v3;
  int64_t v5 = [(MPVoicemailTableViewController *)self tableView];
  [v5 _setMarginWidth:v4];

  uint64_t v6 = [(MPVoicemailTableViewController *)self tableView];
  [v6 setRowHeight:UITableViewAutomaticDimension];

  id v7 = [(MPVoicemailTableViewController *)self tableView];
  [v7 setPrefetchDataSource:self];

  v8 = +[UIApplication sharedApplication];
  v9 = [v8 preferredContentSizeCategory];
  +[PHVoicemailMessageTableViewCell separatorInsetForContentSizeCategory:v9];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(MPVoicemailTableViewController *)self tableView];
  [v18 setSeparatorInset:v11, v13, v15, v17];

  v19 = [(MPVoicemailTableViewController *)self tableView];
  [v19 setEstimatedRowHeight:60.0];

  BOOL v20 = [(MPVoicemailTableViewController *)self tableView];
  [v20 setRowHeight:UITableViewAutomaticDimension];

  v21 = [(MPVoicemailTableViewController *)self tableView];
  uint64_t v22 = objc_opt_class();
  v23 = +[PHVoicemailMessageTableViewCell reuseIdentifier];
  [v21 registerClass:v22 forCellReuseIdentifier:v23];

  v24 = [(MPVoicemailTableViewController *)self tableView];
  [v24 registerClass:objc_opt_class() forCellReuseIdentifier:@"CallVoicemail"];

  uint64_t v25 = [(MPVoicemailTableViewController *)self voicemails];
  if (v25)
  {
    v26 = (void *)v25;
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(MPVoicemailTableViewController *)self allVoicemails];
      [(MPVoicemailTableViewController *)self willShowVoicemails:v28];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v7 viewWillAppear:a3];
  [(MPVoicemailTableViewController *)self reloadDataIfNil];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleVoicemailTranscriptionStatusChangedNotification:" name:VMVoicemailTranscribingStatusChangedNotification object:0];

  [(MPVoicemailTableViewController *)self loadTableHeaderView];
  [(MPVoicemailTableViewController *)self showHideProgressView];
  if ((+[UIImage cappedSizedImagesAreValid] & 1) == 0)
  {
    int64_t v5 = [(MPVoicemailTableViewController *)self tableView];
    [v5 setEditing:0 animated:0];

    uint64_t v6 = [(MPVoicemailTableViewController *)self tableView];
    [v6 reloadData];
  }
  [(MPVoicemailTableViewController *)self startObservingPreferences];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v7 viewWillDisappear:a3];
  double v4 = [(MPVoicemailTableViewController *)self detailIndexPath];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v5 = [(MPVoicemailTableViewController *)self tableView];
      [(MPVoicemailTableViewController *)self tableView:v5 collapseRowAtIndexPath:v4 animated:1];
    }
  }
  [(MPVoicemailTableViewController *)self hideProgressView];
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:VMVoicemailTranscribingStatusChangedNotification object:0];

  [(MPVoicemailTableViewController *)self stopObservingPreferences];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v11 viewDidLoad];
  double v3 = +[NSNotificationCenter defaultCenter];
  double v4 = +[PHDevice currentDevice];
  [v3 addObserver:self selector:"handlePHDeviceCellularRadioEnabledDidChangeNotification:" name:@"PHDeviceCellularRadioEnabledDidChangeNotification" object:v4];

  uint64_t v5 = VMVoicemailManagerAccountsDidChangeNotification;
  uint64_t v6 = [(MPVoicemailTableViewController *)self voicemailController];
  objc_super v7 = [v6 accountManager];
  [v3 addObserver:self selector:"handleVMVoicemailManagerAccountsDidChangeNotification:" name:v5 object:v7];

  uint64_t v8 = VMVoicemailOnlineStatusChangedNotification;
  v9 = [(MPVoicemailTableViewController *)self voicemailController];
  double v10 = [v9 accountManager];
  [v3 addObserver:self selector:"handleVMVoicemailOnlineStatusChangedNotification:" name:v8 object:v10];

  [v3 addObserver:self selector:"handleMPRTTTranscriptionDidLoadNotification:" name:@"MPVoicemailRTTTranscriptDidLoadNotification" object:0];
  [(MPVoicemailTableViewController *)self updateLargeTitleInsets];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPVoicemailTableViewController;
  [(MPVoicemailTableViewController *)&v9 viewDidAppear:a3];
  [(MPVoicemailTableViewController *)self setVisible:1];
  double v4 = [(MPVoicemailTableViewController *)self view];
  uint64_t v5 = [(MPVoicemailTableViewController *)self cardController];
  [v5 setSourceView:v4];

  uint64_t v6 = [(MPVoicemailTableViewController *)self messageToPlayFromPlaybackQueue];

  if (v6)
  {
    [(MPVoicemailTableViewController *)self playMessageFromPlaybackQueue];
  }
  else
  {
    objc_super v7 = [(MPVoicemailTableViewController *)self detailIndexPath];
    if (v7)
    {
      uint64_t v8 = [(MPVoicemailTableViewController *)self tableView];
      [(MPVoicemailTableViewController *)self tableView:v8 expandRowAtIndexPath:v7 animated:0];
    }
  }
  [(MPVoicemailTableViewController *)self checkTranscriptionModelAvailability];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailTableViewController;
  [(MPVoicemailTableViewController *)&v4 viewDidDisappear:a3];
  [(MPVoicemailTableViewController *)self setVisible:0];
  if ([(MPVoicemailTableViewController *)self isEditing]) {
    [(MPVoicemailTableViewController *)self setEditing:0 animated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v4 traitCollectionDidChange:a3];
  [(MPVoicemailTableViewController *)self updateLargeTitleInsets];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  if (![(MPVoicemailTableViewController *)self allowTableViewScrolling])
  {
    id v4 = [(MPVoicemailTableViewController *)self tableView];

    if (v4 == v5)
    {
      [(MPVoicemailTableViewController *)self fixedTableViewContentOffset];
      [v5 setContentOffset:];
    }
  }
}

- (void)checkTranscriptionModelAvailability
{
  if (([UIApp launchedToTest] & 1) == 0)
  {
    if (CPIsInternalDevice())
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke;
      v3[3] = &unk_10027D4E0;
      v3[4] = self;
      +[SFSpeechRecognizer _fetchSupportedForcedOfflineLocalesWithCompletion:v3];
    }
  }
}

void __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke_2;
  block[3] = &unk_10027CBE0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) shouldShowTranscriptionModelWarningHeaderViewForCount:[v2 count]];
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      id v4 = PHDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke_2_cold_1((uint64_t *)(a1 + 48), v4, v5);
      }
    }
    id v3 = 0;
  }
  return [*(id *)(a1 + 40) setTranscriptionUnavailable:v3];
}

- (void)setTranscriptionUnavailable:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_transcriptionUnavailable != v3)
  {
    self->_transcriptionUnavailable = v3;
    [(MPVoicemailTableViewController *)self loadTableHeaderView];
  }
}

- (BOOL)shouldShowTranscriptionModelWarningHeaderViewForCount:(int64_t)a3
{
  if (([UIApp launchedToTest] & 1) != 0 || !CPIsInternalDevice()) {
    return 0;
  }
  uint64_t v5 = [(MPVoicemailTableViewController *)self voicemailController];
  id v6 = [v5 accountManager];
  unsigned __int8 v7 = [v6 isTranscriptionEnabled];
  if (a3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7;
  }

  return v8;
}

- (id)_allVoicemails
{
  v2 = [(MPVoicemailTableViewController *)self voicemailController];
  BOOL v3 = [v2 audioMessages];

  return v3;
}

- (void)_fetchCurrentVoicemailsWithCompletion:(id)a3
{
  id v9 = a3;
  id v4 = [(MPVoicemailTableViewController *)self featureFlags];
  unsigned int v5 = [v4 voicemailSearchEnabled];

  if (v5)
  {
    id preFetchingPredicate = self->_preFetchingPredicate;
    if (preFetchingPredicate)
    {
      [(MPVoicemailTableViewController *)self _fetchCurrentVoicemailsWithPredicate:preFetchingPredicate completion:v9];
      goto LABEL_7;
    }
    unsigned __int8 v7 = [(id)objc_opt_class() voicemailPredicate];
    [(MPVoicemailTableViewController *)self _fetchCurrentVoicemailsWithPredicate:v7 completion:v9];
  }
  else
  {
    unsigned __int8 v7 = [(MPVoicemailTableViewController *)self voicemailController];
    BOOL v8 = [(id)objc_opt_class() voicemailPredicate];
    [v7 audioMessagesPassingTest:v8 withCompletion:v9];
  }
LABEL_7:
}

- (void)_fetchCurrentVoicemailsWithPredicate:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [(MPVoicemailTableViewController *)self featureFlags];
  unsigned int v8 = [v7 voicemailSearchEnabled];

  if (v8)
  {
    id v9 = [(MPVoicemailTableViewController *)self voicemailController];
    [v9 audioMessagesPassingTest:v10 withCompletion:v6];
  }
}

- (id)voicemails:(id)a3 passingTest:(id)a4
{
  id v5 = a3;
  id v6 = (unsigned int (**)(id, void))a4;
  unsigned __int8 v7 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v6[2](v6, v13)) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [v7 copy];

  return v14;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MPVoicemailTableViewController *)self detailIndexPath];
  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v5 row];
    id v9 = [(MPVoicemailTableViewController *)self voicemails];
    BOOL v7 = v8 < [v9 count];
  }
  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v8 = a3;
    [(MPVoicemailTableViewController *)self performTableViewDestructiveActionAtIndexPath:a5];
    [v8 setEditing:0];
  }
}

- (void)addMessageToPlaybackQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
  id v6 = [v4 identifier];
  unsigned __int8 v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Message already exists in queue: %@ not adding it", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v10 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
    uint64_t v11 = [v4 identifier];
    [v10 addObject:v11];
  }
}

- (void)showHideProgressView
{
  BOOL v3 = [(MPVoicemailTableViewController *)self voicemailController];
  id v4 = [v3 accountManager];
  uint64_t v5 = [v4 transcriptionProgress];

  if (!v5
    || ([v5 isFinished] & 1) != 0
    || ([(MPVoicemailTableViewController *)self progressView],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    unsigned __int8 v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Hiding progress view", v9, 2u);
    }

    [(MPVoicemailTableViewController *)self hideProgressView];
  }
  else
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing progress view", buf, 2u);
    }

    [(MPVoicemailTableViewController *)self showProgressView];
  }
}

- (void)showProgressView
{
  BOOL v3 = [(MPVoicemailTableViewController *)self tableView];
  [v3 setContentInset:0.0, 0.0, 40.0, 0.0];

  id v4 = [VMMessageTranscriptionProgressView alloc];
  uint64_t v5 = [(MPVoicemailTableViewController *)self tabBarController];
  id v6 = [v5 tabBar];
  [v6 frame];
  double v8 = v7;
  id v9 = [(MPVoicemailTableViewController *)self tabBarController];
  id v10 = [v9 tabBar];
  [v10 frame];
  double v12 = v11 + -40.0;
  uint64_t v13 = [(MPVoicemailTableViewController *)self tabBarController];
  id v14 = [v13 tabBar];
  [v14 frame];
  double v15 = -[VMMessageTranscriptionProgressView initWithFrame:](v4, "initWithFrame:", v8, v12);
  [(MPVoicemailTableViewController *)self setProgressView:v15];

  long long v16 = [(MPVoicemailTableViewController *)self voicemailController];
  long long v17 = [v16 accountManager];
  long long v18 = [v17 transcriptionProgress];
  long long v19 = [(MPVoicemailTableViewController *)self progressView];
  BOOL v20 = [v19 progressView];
  [v20 setObservedProgress:v18];

  id v23 = [(MPVoicemailTableViewController *)self tabBarController];
  v21 = [v23 view];
  uint64_t v22 = [(MPVoicemailTableViewController *)self progressView];
  [v21 addSubview:v22];
}

- (void)hideProgressView
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v6 = [(MPVoicemailTableViewController *)self tableView];
  [v6 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  double v7 = [(MPVoicemailTableViewController *)self progressView];
  [v7 removeFromSuperview];

  [(MPVoicemailTableViewController *)self setProgressView:0];
}

- (void)handleVoicemailTranscriptionStatusChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v7, 0x16u);
  }
  [(MPVoicemailTableViewController *)self showHideProgressView];
  if (([(TUFeatureFlags *)self->_featureFlags callScreeningEnabled] & 1) == 0)
  {
    [(PHTableViewController *)self setNeedsReloadData:1];
    [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  }
}

- (void)handleVMVoicemailOnlineStatusChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v7, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(MPVoicemailTableViewController *)self loadTableHeaderView];
}

- (void)handleMPVoicemailControllerMessagesDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v7, 0x16u);
  }
  [(PHTableViewController *)self setNeedsReloadData:1];
  [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  [(MPVoicemailTableViewController *)self playMessageFromPlaybackQueue];
}

- (void)handlePHAudioDeviceControllerAudioRoutesChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v10 = 138412546;
    double v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v10, 0x16u);
  }
  int v7 = [(MPVoicemailTableViewController *)self routeListController];
  [v7 reload];

  double v8 = [(MPVoicemailTableViewController *)self detailIndexPath];

  if (v8)
  {
    __int16 v9 = [(MPVoicemailTableViewController *)self detailIndexPath];
    [(MPVoicemailTableViewController *)self configureAudioButtonForRowAtIndexPath:v9];
  }
}

- (void)handlePHAudioDeviceControllerPickedRouteChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  int v7 = [(MPVoicemailTableViewController *)self detailIndexPath];

  if (v7)
  {
    double v8 = [(MPVoicemailTableViewController *)self detailIndexPath];
    [(MPVoicemailTableViewController *)self configureAudioButtonForRowAtIndexPath:v8];
  }
}

- (void)handlePHDeviceCellularRadioEnabledDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);
  }
  int v7 = +[PHDevice currentDevice];
  unsigned int v8 = [v7 isCellularRadioEnabled];

  int v9 = [(MPVoicemailTableViewController *)self connectionUnavailableView];

  if (v9)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    int v10 = [(MPVoicemailTableViewController *)self connectionUnavailableView];
    [v10 setButtonHidden:v8 ^ 1 animated:1];

    [(MPVoicemailTableViewController *)self loadTableHeaderView];
  }
}

- (void)handleUIApplicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);
  }
  if ([(MPVoicemailTableViewController *)self isViewLoaded])
  {
    int v7 = [(MPVoicemailTableViewController *)self view];
    unsigned int v8 = [v7 window];

    if (v8)
    {
      int v9 = [(MPVoicemailTableViewController *)self detailIndexPath];
      if (v9)
      {
        int v10 = [(MPVoicemailTableViewController *)self tableView];
        [(MPVoicemailTableViewController *)self tableView:v10 collapseRowAtIndexPath:v9 animated:0];
      }
    }
  }
}

- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v4;
    id v6 = v21;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  v19.receiver = self;
  v19.super_class = (Class)MPVoicemailTableViewController;
  [(PHTableViewController *)&v19 handleUIContentSizeCategoryDidChangeNotification:v4];
  [(MPVoicemailTableViewController *)self loadTableHeaderView];
  int v7 = [v4 userInfo];
  unsigned int v8 = [v7 objectForKeyedSubscript:UIContentSizeCategoryNewValueKey];

  if (v8)
  {
    +[PHVoicemailMessageTableViewCell separatorInsetForContentSizeCategory:v8];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    long long v17 = [(MPVoicemailTableViewController *)self tableView];
    [v17 setSeparatorInset:v10, v12, v14, v16];
  }
  [(MPVoicemailTableViewController *)self setEditing:0 animated:0];
  long long v18 = [(MPVoicemailTableViewController *)self tableView];
  [v18 reloadData];
}

- (void)handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MPVoicemailTableViewController_handleVMVoicemailManagerAccountsDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __88__MPVoicemailTableViewController_handleVMVoicemailManagerAccountsDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadTableHeaderView];
}

- (void)handleMPRTTTranscriptionDidLoadNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v18 = 138412546;
    objc_super v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v18, 0x16u);
  }
  int v7 = [(MPVoicemailTableViewController *)self detailIndexPath];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = +[NSIndexPath indexPathForRow:0 inSection:0];

    int v7 = (void *)v8;
  }
  if (v7)
  {
    id v9 = [(MPVoicemailTableViewController *)self detailIndexPath];
    __int16 v10 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v9 row]);

    id v11 = [v4 userInfo];
    double v12 = [v11 objectForKey:@"MPVoicemailRTTTranscriptDidLoadCallIDKey"];

    double v13 = [v10 callUUID];
    double v14 = [v13 UUIDString];
    unsigned int v15 = [v14 isEqualToString:v12];

    if (v15)
    {
      double v16 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelCache];
      long long v17 = [v10 identifier];
      [v16 removeObjectForKey:v17];

      [(PHTableViewController *)self setNeedsReloadData:1];
      [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
    }
  }
}

- (BOOL)tableViewCanPerformReloadData:(id)a3
{
  if ([(MPVoicemailTableViewController *)self isEditing])
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = (id)objc_opt_class();
      id v5 = v13;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ cannot reload data because we are editing.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  id v4 = [(MPVoicemailTableViewController *)self tableView];
  v11.receiver = self;
  v11.super_class = (Class)MPVoicemailTableViewController;
  if (![(PHTableViewController *)&v11 tableViewCanPerformReloadData:v4])
  {
LABEL_7:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  id v6 = objc_opt_new();
  if ([v6 fullScreenVoicemailDetailsEnabled])
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v8 = [(MPVoicemailTableViewController *)self detailIndexPath];
    if (v8)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      id v9 = [(MPVoicemailTableViewController *)self playerController];
      unsigned int v7 = [v9 isPlaying] ^ 1;
    }
  }

LABEL_13:
  return v7;
}

- (void)reloadDataIfNeeded
{
  if ([(PHTableViewController *)self needsReloadData]
    && ([(MPVoicemailTableViewController *)self isViewLoaded] & 1) != 0
    || [(MPVoicemailTableViewController *)self isSearchViewController])
  {
    if (![(PHTableViewController *)self isReloadingData])
    {
      BOOL v3 = PHDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = (id)objc_opt_class();
        id v4 = v13;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ We are already loading data, will keep needs reload data to reload once done.", buf, 0xCu);
      }
    }
    id v5 = [(MPVoicemailTableViewController *)self tableView];
    unsigned __int8 v6 = [(MPVoicemailTableViewController *)self tableViewCanPerformReloadData:v5];

    if (v6)
    {
      objc_initWeak((id *)buf, self);
      [(PHTableViewController *)self setReloadingData:1];
      [(PHTableViewController *)self setNeedsReloadData:0];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke;
      v10[3] = &unk_10027D508;
      objc_copyWeak(&v11, (id *)buf);
      v10[4] = self;
      [(MPVoicemailTableViewController *)self _fetchCurrentVoicemailsWithCompletion:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      unsigned int v7 = PHDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        id v9 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Failing to reload data because tableViewCanPerformReloadData returned false.", buf, 0xCu);
      }
    }
  }
}

void __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained voicemailController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke_2;
  v7[3] = &unk_10027CCF0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = v6;
  [v5 audioMessagesWithCompletion:v7];

  objc_destroyWeak(&v9);
}

void __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke_3;
  v7[3] = &unk_10027D470;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v11);
}

void __52__MPVoicemailTableViewController_reloadDataIfNeeded__block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setReloadingData:0];
    uint64_t v4 = [v3 tableView];
    unsigned __int8 v5 = [v3 tableViewCanPerformReloadData:v4];

    if (v5)
    {
      id v6 = a1[4];
      unsigned int v7 = [v3 voicemailMessageViewModelCache];
      [v7 removeAllObjects];

      [a1[5] willShowVoicemails:v6];
      id v8 = [a1[6] mutableCopy];
      [v3 setVoicemails:v8];

      [v3 setAllVoicemails:v6];
      if (!*((unsigned char *)a1[5] + 57))
      {
        uint64_t v9 = [v3 tableView];
        [v9 reloadData];
      }
      id v10 = PHDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_opt_class();
        id v12 = v11;
        id v13 = [v3 voicemails];
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2048;
        id v25 = [v13 count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ completed updating voicemail list. current voicemails count: %ld", (uint8_t *)&v22, 0x16u);
      }
      if (([v3 needsReloadData] & 1) == 0) {
        [v3 updateTitleDisplayModeIfNeeded];
      }
      [v3 popViewControllerIfNeeded];
      double v14 = a1[5];
      unsigned int v15 = (void *)v14[13];
      if (v15)
      {
        double v16 = [v3 voicemails];
        [v15 tableViewController:v14 didChangeVoicemails:v16];
      }
      if ([v3 needsReloadData])
      {
        long long v17 = PHDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = objc_opt_class();
          int v22 = 138412290;
          id v23 = v18;
          id v19 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ reloading data again because needsReloadData is set.", (uint8_t *)&v22, 0xCu);
        }
        [v3 reloadDataIfNeeded];
      }
      else if ([a1[5] playMessageOnReloadData] {
             && [a1[5] playMessageFromPlaybackQueue])
      }
      {
        [a1[5] setPlayMessageOnReloadData:0];
      }
    }
    else
    {
      __int16 v20 = PHDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = (id)objc_opt_class();
        id v21 = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ fetched data but failed to reload because tableViewCanPerformReloadData returned false.", (uint8_t *)&v22, 0xCu);
      }
      [v3 setNeedsReloadData:1];
    }
  }
}

- (void)reloadDataIfNil
{
  id v3 = [(MPVoicemailTableViewController *)self voicemails];

  if (!v3)
  {
    [(PHTableViewController *)self setNeedsReloadData:1];
    [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  }
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  id v3 = [(MPVoicemailTableViewController *)self voicemails];
  if (v3)
  {
    uint64_t v4 = [(MPVoicemailTableViewController *)self voicemails];
    if ([v4 count]) {
      BOOL v5 = !self->_isSearchViewController;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MPVoicemailTableViewController;
  [(MPVoicemailTableViewController *)&v6 setEditing:a3 animated:a4];
  if (!a3) {
    [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  }
}

- (id)indexPathForMessageID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MPVoicemailTableViewController *)self voicemails];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __56__MPVoicemailTableViewController_indexPathForMessageID___block_invoke;
  v12[3] = &unk_10027D530;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v12];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(MPVoicemailTableViewController *)self tableView];
    BOOL v10 = [(MPVoicemailTableViewController *)self numberOfSectionsInTableView:v9] == (id)2;

    id v8 = +[NSIndexPath indexPathForRow:v7 inSection:v10];
  }

  return v8;
}

id __56__MPVoicemailTableViewController_indexPathForMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)indexPathsForMessages:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier:v15];
        id v12 = [(MPVoicemailTableViewController *)self indexPathForMessageID:v11];

        if (v12) {
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

- (id)messagesAtIndexPaths:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [-self messageAtIndex:[v14 row]];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)messageAtIndex:(int64_t)a3
{
  id v4 = [(MPVoicemailTableViewController *)self voicemails];
  BOOL v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSNumber numberWithInteger:a3];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not find an item at index %@.", (uint8_t *)&v10, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (void)updateScreenTimeRestrictedViewForMessage:(id)a3 withViewModel:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MPVoicemailTableViewController *)self voicemailController];
  unsigned int v8 = [v7 isRestrictedMessage:v11];

  if (v8)
  {
    [v6 setShowsRestrictedAlertView:1];
    uint64_t v9 = [(MPVoicemailTableViewController *)self voicemailController];
    int v10 = [v9 localizedAttributedDowntimeTitleForMessage:v11];
    [v6 setLocalizedAttributedRestrictedAlertTitle:v10];

    id v6 = v9;
  }
  else
  {
    [v6 setShowsRestrictedAlertView:0];
    [v6 setLocalizedAttributedRestrictedAlertTitle:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MPVoicemailTableViewController *)self voicemails];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = +[PHVoicemailMessageTableViewCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  int v10 = [(MPVoicemailTableViewController *)self detailIndexPath];
  id v11 = [v10 isEqual:v6];

  id v12 = [v6 row];
  id v13 = [(MPVoicemailTableViewController *)self messageAtIndex:v12];
  long long v14 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelCache];
  long long v15 = [v13 identifier];
  long long v16 = [v14 objectForKey:v15];

  if (!v16)
  {
    long long v16 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelForVoicemail:v13 isExpanded:v11];
    long long v17 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelCache];
    long long v18 = [v13 identifier];
    [v17 setObject:v16 forKey:v18];
  }
  id v19 = [(MPVoicemailTableViewController *)self detailIndexPath];
  if (v19) {
    uint64_t v20 = v11 ^ 1;
  }
  else {
    uint64_t v20 = 0;
  }

  [v9 configureWithVoicemailMessageViewModel:v16 expanded:v11 shouldGrayForeground:v20];
  id v21 = [(MPVoicemailTableViewController *)self tableView];
  int v22 = [v21 safeAreaLayoutGuide];
  [v22 layoutFrame];
  [v9 setMaximumAllowedHeight:v23 * 0.699999988];

  [v9 setDelegate:self];

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MPVoicemailTableViewController *)self detailIndexPath];

  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v6 == 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldHighlightRowAtIndexPath: %@ highlighted: %d", (uint8_t *)&v9, 0x12u);
  }

  return v6 == 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didSelectRowAtIndexPath: %@", (uint8_t *)&v13, 0xCu);
  }

  if (([v6 isDecelerating] & 1) == 0
    && ([v6 isEditing] & 1) == 0
    && ([v6 isDragging] & 1) == 0)
  {
    id v9 = [v7 row];
    id v10 = [(MPVoicemailTableViewController *)self voicemails];
    id v11 = [v10 count];

    if (v9 < v11)
    {
      BOOL v12 = [(MPVoicemailTableViewController *)self tableView];
      [(MPVoicemailTableViewController *)self tableView:v12 expandRowAtIndexPath:v7 animated:1];
    }
    [v6 deselectRowAtIndexPath:v7 animated:0];
  }
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5 = a4;
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prefetching rows at indexPaths: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(MPVoicemailTableViewController *)self voicemailController];
  unsigned int v8 = [(MPVoicemailTableViewController *)self messagesAtIndexPaths:v5];
  [v7 loadLocalizedTitlesForMessages:v8];
}

- (void)popViewControllerIfNeeded
{
  id v7 = [(MPVoicemailTableViewController *)self navigationController];
  id v3 = [v7 viewControllers];
  id v4 = [v3 firstObject];
  if (v4 == self || ![(MPVoicemailTableViewController *)self visible])
  {
  }
  else
  {
    unsigned __int8 v5 = [(MPVoicemailTableViewController *)self hasContentToDisplay];

    if (v5) {
      return;
    }
    id v7 = [(MPVoicemailTableViewController *)self navigationController];
    id v6 = [v7 popToRootViewControllerAnimated:1];
  }
}

- (CNAvatarCardController)cardController
{
  cardController = self->_cardController;
  if (!cardController)
  {
    id v4 = (CNAvatarCardController *)objc_alloc_init((Class)CNAvatarCardController);
    unsigned __int8 v5 = self->_cardController;
    self->_cardController = v4;

    [(CNAvatarCardController *)self->_cardController setDelegate:self];
    cardController = self->_cardController;
  }

  return cardController;
}

- (id)contactViewControllerForVoicemail:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MPVoicemailTableViewController *)self voicemailController];
  id v6 = [v5 contactStore];
  id v7 = +[CNContactViewController descriptorForRequiredKeys];
  v35 = v7;
  unsigned int v8 = +[NSArray arrayWithObjects:&v35 count:1];
  int v9 = [v4 contactUsingContactStore:v6 withKeysToFetch:v8];

  if (v9)
  {
    id v10 = +[CNContactViewController viewControllerForContact:v9];
    [v10 setShouldShowLinkedContacts:1];
    goto LABEL_19;
  }
  int v9 = [(MPVoicemailTableViewController *)self unknownContactForMessage:v4];
  id v10 = +[CNContactViewController viewControllerForUnknownContact:v9];
  id v11 = [v4 senderDestinationID];
  id v12 = [v11 length];

  if (!v12)
  {
    [v10 setAllowsActions:0];
    long long v17 = +[NSBundle mainBundle];
    long long v18 = [v17 localizedStringForKey:@"UNKNOWN_CALLER_DETAIL" value:&stru_100285990 table:@"General"];
    [v10 setAlternateName:v18];
    id v19 = 0;
LABEL_13:

    goto LABEL_15;
  }
  [v10 setActions:[v10 actions] | 0x80];
  int64_t v13 = [(MPVoicemailTableViewController *)self senderHandleTypeForMessage:v4];
  id v14 = [(MPVoicemailTableViewController *)self featureFlags];
  unsigned int v15 = [v14 callScreeningEnabledM3];

  if (v15)
  {
    if ((unint64_t)(v13 - 1) > 2) {
      goto LABEL_10;
    }
    long long v16 = (NSString *const *)*(&off_10027D668 + v13 - 1);
  }
  else
  {
    long long v16 = &CNContactPhoneNumbersKey;
  }
  [v10 setPrimaryPropertyKey:*v16];
LABEL_10:
  uint64_t v20 = [(MPVoicemailTableViewController *)self voicemailController];
  id v21 = [v20 suggestedContactStore];
  [v10 setContactStore:v21];

  long long v17 = +[TUMetadataDestinationID metadataDestinationIDWithVoicemailMessage:v4];
  if (v17)
  {
    int v22 = [(MPVoicemailTableViewController *)self voicemailController];
    double v23 = [v22 metadataCache];
    long long v18 = [v23 metadataForDestinationID:v17];

    id v19 = [v18 metadataForProvider:objc_opt_class()];
    if (![v19 length])
    {
      uint64_t v24 = [v18 metadataForProvider:objc_opt_class()];

      id v19 = (void *)v24;
    }
    goto LABEL_13;
  }
  id v19 = 0;
LABEL_15:

  if ([v19 length])
  {
    uint64_t v25 = +[NSString stringWithString:v19];
    if (v25)
    {
      v26 = (void *)v25;
      [v10 setMessage:v25];
    }
  }

LABEL_19:
  char v27 = [v4 date];

  if (v27)
  {
    v28 = objc_alloc_init(MPVoicemailContactHeaderViewController);
    objc_super v29 = [v4 date:kCHCallOccurrenceDateKey];
    v34[0] = v29;
    v33[1] = kCHCallOccurrenceCallStatusKey;
    v30 = +[NSNumber numberWithUnsignedInt:kCHCallStatusMissed];
    v34[1] = v30;
    v31 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [(MPVoicemailContactHeaderViewController *)v28 setCallOccurrence:v31];

    [v10 setContactHeaderViewController:v28];
  }

  return v10;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v11 = a4;
  id v6 = [a3 cellForRowAtIndexPath:];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(MPVoicemailTableViewController *)self playerController];
    [v7 pause];

    unsigned int v8 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v11 row]);
    if (v8)
    {
      int v9 = [(MPVoicemailTableViewController *)self contactViewControllerForVoicemail:v8];
      id v10 = [(MPVoicemailTableViewController *)self navigationController];
      [v10 pushViewController:v9 animated:1];
    }
  }
}

- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unsigned int v8 = [(MPVoicemailTableViewController *)self tableView];
  if ([v8 isEditing]) {
    goto LABEL_6;
  }
  int v9 = [(MPVoicemailTableViewController *)self tableView];
  if (![v9 isDragging])
  {
    id v10 = [(MPVoicemailTableViewController *)self tableView];
    if ([v10 isDecelerating])
    {
LABEL_4:

      goto LABEL_5;
    }
    int64_t v13 = [(MPVoicemailTableViewController *)self detailIndexPath];

    if (v13) {
      goto LABEL_7;
    }
    id v14 = [(MPVoicemailTableViewController *)self tableView];
    unsigned int v15 = [(MPVoicemailTableViewController *)self view];
    long long v16 = [(MPVoicemailTableViewController *)self tableView];
    [v15 convertPoint:v16 toView:x, y];
    unsigned int v8 = [v14 indexPathForRowAtPoint:];

    if (v8)
    {
      int v9 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v8 row]);
      if (v9)
      {
        long long v17 = [(MPVoicemailTableViewController *)self tableView];
        id v10 = [v17 cellForRowAtIndexPath:v8];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_4;
        }
        [v7 setHighlightView:v10];
        long long v18 = [(MPVoicemailTableViewController *)self tableView];
        v42 = v10;
        [v10 frame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        char v27 = [(MPVoicemailTableViewController *)self view];
        [v18 convertRect:v27 toView:v20];
        [v7 setSourceRect:];

        v28 = [(MPVoicemailTableViewController *)self voicemailController];
        objc_super v29 = [v28 contactStore];
        v30 = +[CNAvatarCardController descriptorForRequiredKeys];
        v43 = v30;
        v31 = +[NSArray arrayWithObjects:&v43 count:1];
        v32 = [v9 contactUsingContactStore:v29 withKeysToFetch:v31];
        v33 = v32;
        if (v32)
        {
          id v34 = v32;
        }
        else
        {
          id v34 = [(MPVoicemailTableViewController *)self unknownContactForMessage:v9];
        }
        v35 = v34;

        if (v35)
        {
          [v7 setContact:v35];
          v36 = +[TUMetadataDestinationID metadataDestinationIDWithVoicemailMessage:v9];
          v37 = v42;
          if (v36)
          {
            v38 = [(MPVoicemailTableViewController *)self voicemailController];
            v39 = [v38 metadataCache];
            v40 = [v39 metadataForDestinationID:v36];

            v41 = [v40 metadataForProvider:objc_opt_class()];
            [v7 setMessage:v41];
          }
          int64_t v11 = 0;
        }
        else
        {
          int64_t v11 = 2;
          v37 = v42;
        }
      }
      else
      {
        int64_t v11 = 1;
      }
    }
    else
    {
      int64_t v11 = 1;
    }

    goto LABEL_8;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  int64_t v11 = 1;
LABEL_8:

  return v11;
}

- (void)tableView:(id)a3 collapseRowAtIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Collapsing rowAtIndexPath: %@ animated: %d", buf, 0x12u);
  }

  int64_t v11 = [v8 cellForRowAtIndexPath:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    int64_t v13 = [(MPVoicemailTableViewController *)self detailIndexPath];
    [v8 scrollToRowAtIndexPath:v13 atScrollPosition:0 animated:0];

    [(MPVoicemailTableViewController *)self resetSelectedIndexPath];
    [v12 setExpanded:0 animated:v5];
    id v14 = +[UIColor separatorColor];
    [(MPVoicemailTableViewController *)self configureCellWithSeparatorColor:v14 atIndexPath:v9];

    [(MPVoicemailTableViewController *)self setAllowTableViewScrolling:1];
    [v8 setUserInteractionEnabled:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke;
    v17[3] = &unk_10027D308;
    id v18 = v8;
    double v19 = self;
    BOOL v20 = v5;
    unsigned int v15 = objc_retainBlock(v17);
    long long v16 = v15;
    if (v5) {
      ((void (*)(void *))v15[2])(v15);
    }
    else {
      +[UIView performWithoutAnimation:v15];
    }
  }
}

void __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundView:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_2;
  v5[3] = &unk_10027C838;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_4;
  v3[3] = &unk_10027D268;
  id v4 = v2;
  [v4 performBatchUpdates:v5 completion:v3];
}

void __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_2(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_3;
  v4[3] = &unk_10027C670;
  v4[4] = *(void *)(a1 + 32);
  v2 = objc_retainBlock(v4);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    +[UIView animateWithDuration:196608 delay:v2 options:0 animations:0.300000012 completion:0.0];
  }
  else {
    ((void (*)(void *))v2[2])(v2);
  }
}

id __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_3(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [*(id *)(a1 + 32) tableView];
  id v3 = [v2 visibleCells];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setForegroundColor:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 32) _updateUIForMaskViewChange];
}

id __76__MPVoicemailTableViewController_tableView_collapseRowAtIndexPath_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserInteractionEnabled:1];
}

- (void)tableView:(id)a3 expandRowAtIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  long long v9 = a4;
  long long v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v69 = v9;
    __int16 v70 = 1024;
    int v71 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Expanding rowAtIndexPath: %@ animated: %d", buf, 0x12u);
  }

  long long v11 = [v8 cellForRowAtIndexPath:v9];
  if (!v11)
  {
    long long v12 = [(MPVoicemailTableViewController *)self tableView];
    id v13 = [v12 numberOfRowsInSection:[v9 section]];
    id v14 = [v9 row];

    if ((uint64_t)v13 <= (uint64_t)v14)
    {
      unsigned int v15 = PHDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MPVoicemailTableViewController tableView:expandRowAtIndexPath:animated:]((uint64_t)v9, v15, v16);
      }
    }
    else
    {
      [v8 scrollToRowAtIndexPath:v9 atScrollPosition:2 animated:0];
    }
    long long v11 = [v8 cellForRowAtIndexPath:v9];
  }
  long long v17 = [(MPVoicemailTableViewController *)self featureFlags];
  if ([v17 fullScreenVoicemailDetailsEnabled])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v19 = [(MPVoicemailTableViewController *)self messageAtIndex:[v9 row]];
      BOOL v20 = [(MPVoicemailTableViewController *)self featureFlags];
      unsigned int v21 = [v20 callHistorySearchEnabled];

      if (!v21 || v19)
      {
        v47 = [PHVoicemailMessageDetailViewController alloc];
        v48 = [(MPVoicemailTableViewController *)self phoneNavigationController];
        v49 = [(MPVoicemailTableViewController *)self voicemailController];
        id v22 = [(PHVoicemailMessageDetailViewController *)v47 initWithMessage:v19 navigationController:v48 voicemailController:v49];

        [v22 setDelegate:self];
        v50 = [(MPVoicemailTableViewController *)self featureFlags];
        LODWORD(v48) = [v50 voicemailSearchEnabled];

        if (v48) {
          [(MPVoicemailTableViewController *)self phoneNavigationController];
        }
        else {
        v51 = [(MPVoicemailTableViewController *)self navigationController];
        }
        [v51 pushViewController:v22 animated:1];
      }
      else
      {
        id v22 = PHDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[MPVoicemailTableViewController tableView:expandRowAtIndexPath:animated:](v9, v22);
        }
      }
LABEL_40:

      goto LABEL_41;
    }
  }
  else
  {
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:self selector:"handlePHAudioDeviceControllerAudioRoutesChangedNotification:" name:@"PHAudioDeviceControllerAudioRoutesChangedNotification" object:0];

    BOOL v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:self selector:"handlePHAudioDeviceControllerPickedRouteChangedNotification:" name:@"PHAudioDeviceControllerPickedRouteChangedNotification" object:0];

    [v8 setUserInteractionEnabled:0];
    [(MPVoicemailTableViewController *)self setDetailIndexPath:v9];
    v53 = v11;
    id v55 = v11;
    double v25 = [(MPVoicemailTableViewController *)self messageAtIndex:[v9 row]];
    double v26 = PHDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      char v27 = [v25 identifier];
      unsigned int v28 = [v25 isTranscriptionAvailable];
      *(_DWORD *)buf = 138412546;
      v69 = v27;
      __int16 v70 = 1024;
      int v71 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Expanding voicemail %@ with transcription %d.", buf, 0x12u);
    }
    objc_super v29 = [v55 item];
    v52 = v25;
    [(MPVoicemailTableViewController *)self updateScreenTimeRestrictedViewForMessage:v25 withViewModel:v29];

    [v55 setExpanded:1 animated:v5];
    v30 = +[UIColor clearColor];
    [(MPVoicemailTableViewController *)self configureCellWithSeparatorColor:v30 atIndexPath:v9];

    [(MPVoicemailTableViewController *)self configureAudioButtonForRowAtIndexPath:v9];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = __74__MPVoicemailTableViewController_tableView_expandRowAtIndexPath_animated___block_invoke;
    v63[3] = &unk_10027CBE0;
    id v54 = v8;
    id v64 = v8;
    v65 = self;
    v31 = v9;
    v66 = v31;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = __74__MPVoicemailTableViewController_tableView_expandRowAtIndexPath_animated___block_invoke_2;
    v60[3] = &unk_10027C8F0;
    id v32 = v64;
    id v61 = v32;
    v62 = self;
    [v32 performBatchUpdates:v63 completion:v60];
    [v32 scrollToRowAtIndexPath:v31 atScrollPosition:0 animated:v5];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v33 = [(MPVoicemailTableViewController *)self tableView];
    id v34 = [v33 visibleCells];

    id v35 = [v34 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v40 = [(MPVoicemailTableViewController *)self tableView];
          v41 = [v40 indexPathForCell:v39];

          id v42 = v39;
          if ([v41 isEqual:v31])
          {
            [v42 setForegroundColor:0];
          }
          else
          {
            v43 = [(MPVoicemailTableViewController *)self dimmedColor];
            [v42 setForegroundColor:v43];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v36);
    }

    v44 = [(MPVoicemailTableViewController *)self voicemailController];
    id v22 = v52;
    unsigned int v45 = [v44 isRestrictedMessage:v52];

    id v8 = v54;
    double v19 = v55;
    if (v52 && (([v52 isRead] | v45) & 1) == 0)
    {
      v46 = PHDefaultLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v52;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Found voicemail that needs playback: %@", buf, 0xCu);
      }

      [(MPVoicemailTableViewController *)self voicemailMessageTableViewCell:v55 didRequestPlayState:1];
    }

    long long v11 = v53;
    goto LABEL_40;
  }
LABEL_41:
}

id __74__MPVoicemailTableViewController_tableView_expandRowAtIndexPath_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) backgroundViewForTableView];
  [*(id *)(a1 + 32) setBackgroundView:v2];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [*(id *)(a1 + 40) tableView];
  id v4 = [v3 visibleCells];

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        long long v10 = [*(id *)(a1 + 40) tableView];
        long long v11 = [v10 indexPathForCell:v9];

        id v12 = v9;
        if ([v11 isEqual:*(void *)(a1 + 48)])
        {
          [v12 setForegroundColor:0];
        }
        else
        {
          id v13 = [*(id *)(a1 + 40) dimmedColor];
          [v12 setForegroundColor:v13];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return [*(id *)(a1 + 40) _updateUIForMaskViewChange];
}

id __74__MPVoicemailTableViewController_tableView_expandRowAtIndexPath_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  [*(id *)(a1 + 40) setAllowTableViewScrolling:0];
  [*(id *)(a1 + 32) contentOffset];
  v2 = *(void **)(a1 + 40);

  return [v2 setFixedTableViewContentOffset:];
}

- (void)configureCellWithSeparatorColor:(id)a3 atIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(MPVoicemailTableViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  if (v8)
  {
    [v8 setSeparatorColor:v12];
    long long v9 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v6 row] - 1, objc_msgSend(v6, "section"));
    long long v10 = [(MPVoicemailTableViewController *)self tableView];
    long long v11 = [v10 cellForRowAtIndexPath:v9];

    if (v11) {
      [v11 setSeparatorColor:v12];
    }
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    long long v9 = [(MPVoicemailTableViewController *)self detailIndexPath];
    unsigned __int8 v10 = [v9 isEqual:v7];

    if (v10)
    {
      long long v11 = [(MPVoicemailTableViewController *)self dimmedColor];
      [v8 setForegroundColor:v11];
    }
    else
    {
      [v8 setForegroundColor:0];
    }
  }
}

- (void)handleTapGesture:(id)a3
{
  id v5 = [(MPVoicemailTableViewController *)self tableView];
  id v4 = [(MPVoicemailTableViewController *)self detailIndexPath];
  [(MPVoicemailTableViewController *)self tableView:v5 collapseRowAtIndexPath:v4 animated:1];
}

- (id)backgroundViewForTableView
{
  id v3 = objc_alloc((Class)UIView);
  id v4 = [(MPVoicemailTableViewController *)self tableView];
  [v4 bounds];
  id v5 = [v3 initWithFrame:];

  id v6 = [(MPVoicemailTableViewController *)self dimmedColor];
  [v5 setBackgroundColor:v6];

  id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapGesture:"];
  [v5 addGestureRecognizer:v7];

  return v5;
}

- (id)playerController
{
  v2 = [(MPVoicemailTableViewController *)self phoneNavigationController];
  id v3 = [v2 playerController];

  return v3;
}

- (void)loadTableHeaderView
{
  id v3 = [(MPVoicemailTableViewController *)self tableView];
  id v4 = [(MPVoicemailTableViewController *)self voicemailController];
  id v5 = [v4 accountManager];
  if (([v5 isOnline] & 1) != 0
    || ([UIApp isRunningTest] & 1) != 0
    || ([UIApp launchedToTest] & 1) != 0)
  {
  }
  else
  {
    char v12 = TUCallScreeningEnabled();

    if ((v12 & 1) == 0)
    {
      id v13 = objc_alloc_init(MPVoicemailConnectionUnavailableView);
      [(MPVoicemailConnectionUnavailableView *)v13 setAutoresizingMask:18];
      id v14 = +[PHDevice currentDevice];
      -[MPVoicemailConnectionUnavailableView setButtonHidden:](v13, "setButtonHidden:", [v14 isCellularRadioEnabled] ^ 1);

      long long v15 = [(MPVoicemailConnectionUnavailableView *)v13 button];
      [v15 addTarget:self action:"handleDialVoiceMail:" forControlEvents:64];

      [(MPVoicemailTableViewController *)self setConnectionUnavailableView:v13];
      id v8 = [(MPVoicemailTableViewController *)self connectionUnavailableView];

      if (v8)
      {
        [v3 setTableHeaderView:v8];
        long long v16 = PHDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Voicemail showing ConnectionUnavailable in tableHeaderView", buf, 2u);
        }

        goto LABEL_12;
      }
    }
  }
  if ([(MPVoicemailTableViewController *)self isAccountProvisioningRequired])
  {
    id v6 = [(MPVoicemailTableViewController *)self accountProvisioningViewController];
    id v7 = [v6 view];
    [v3 setTableHeaderView:v7];

    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      long long v9 = "Voicemail showing accountProvisioning in tableHeaderView";
      unsigned __int8 v10 = (uint8_t *)&v18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([(MPVoicemailTableViewController *)self isTranscriptionUnavailable])
  {
    long long v11 = [(MPVoicemailTableViewController *)self transcriptionUnavailableView];
    [v3 setTableHeaderView:v11];

    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      long long v9 = "Voicemail showing transcriptionUnavailableView in tableHeaderView";
      unsigned __int8 v10 = (uint8_t *)&v17;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (![(MPVoicemailTableViewController *)self loadTipHeaderView])
  {
    [v3 setTableHeaderView:0];
    goto LABEL_14;
  }
LABEL_13:
  [(MPVoicemailTableViewController *)self layoutTableHeaderView];
LABEL_14:
}

- (BOOL)loadTipHeaderView
{
  return 0;
}

- (void)layoutTableHeaderView
{
  id v3 = [(MPVoicemailTableViewController *)self tableView];
  v2 = [v3 tableHeaderView];
  [v2 setNeedsUpdateConstraints];
  [v2 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  [v2 frame];
  [v2 setFrame:];
  [v3 setTableHeaderView:v2];
}

- (id)voicemailMessageViewModelForVoicemail:(id)a3 isExpanded:(BOOL)a4
{
  id v4 = (id)a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MPVoicemailMessageViewModel);
  id v8 = [v6 date];
  [(MPVoicemailMessageViewModel *)v7 setDate:v8];

  long long v9 = PHVoicemailCellDateFormatter();
  unsigned __int8 v10 = [v6 date];
  long long v11 = [v9 stringFromDate:v10];
  [(MPVoicemailMessageViewModel *)v7 setLocalizedDate:v11];

  char v12 = [(MPVoicemailTableViewController *)self voicemailController];
  id v13 = [v12 localizedTitleForMessage:v6];
  [(MPVoicemailMessageViewModel *)v7 setLocalizedTitle:v13];

  [v6 duration];
  long long v15 = PHVoicemailFormatTime(v14);
  [(MPVoicemailMessageViewModel *)v7 setLocalizedDuration:v15];

  long long v16 = [(MPVoicemailTableViewController *)self voicemailController];
  uint64_t v17 = [v16 localizedSubtitleForMessage:v6];
  [(MPVoicemailMessageViewModel *)v7 setLocalizedSubtitle:v17];

  -[MPVoicemailMessageViewModel setIsRead:](v7, "setIsRead:", [v6 isRead]);
  -[MPVoicemailMessageViewModel setIsDeleted:](v7, "setIsDeleted:", [v6 folder] == (id)2);
  id v18 = [v6 isTranscriptionAvailable];
  double v19 = PHDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [v6 identifier];
    *(_DWORD *)buf = 138412546;
    v41 = v20;
    __int16 v42 = 1024;
    int v43 = (int)v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Voicemail %@ has a transcript available: %d", buf, 0x12u);
  }
  [(MPVoicemailMessageViewModel *)v7 setShowsTranscriptionView:v18];
  [(MPVoicemailMessageViewModel *)v7 setShowsPlayerControls:1];
  [v6 duration];
  -[MPVoicemailMessageViewModel setDuration:](v7, "setDuration:");
  if (+[PHDevice isGeminiCapable])
  {
    id v21 = [(MPVoicemailTableViewController *)self voicemailController];
    id v22 = [v21 callProviderManager];
    __int16 v23 = [v22 telephonyProvider];
    BOOL v24 = [v23 prioritizedSenderIdentities];
    if ((unint64_t)[v24 count] < 2)
    {
    }
    else
    {
      double v25 = [v6 receiverDestinationID];
      id v26 = [v25 length];

      if (!v26) {
        goto LABEL_9;
      }
      id v27 = objc_alloc((Class)TUHandle);
      unsigned int v28 = [v6 receiverDestinationID];
      id v21 = [v27 initWithType:2 value:v28];

      objc_super v29 = [v6 receiverISOCountryCode];
      id v22 = [v21 canonicalHandleForISOCountryCode:v29];

      v39 = [(MPVoicemailTableViewController *)self voicemailController];
      v30 = [v39 callProviderManager];
      v31 = [v30 telephonyProvider];
      [v31 senderIdentityForHandle:v22];
      v33 = id v32 = v4;
      __int16 v23 = [v33 localizedShortName];

      id v4 = v32;
      [(MPVoicemailMessageViewModel *)v7 setLocalizedSenderIdentityTitle:v23];
    }
  }
LABEL_9:
  if (v4)
  {
    id v34 = [(MPVoicemailTableViewController *)self voicemailController];
    id v4 = [v34 isRestrictedMessage:v6];

    if (v4)
    {
      id v35 = [(MPVoicemailTableViewController *)self voicemailController];
      id v36 = [v35 localizedAttributedDowntimeTitleForMessage:v6];
    }
    else
    {
      id v36 = 0;
    }
    uint64_t v37 = [[VMMessageTranscriptViewModel alloc] initWithMPMessage:v6];
    [(MPVoicemailMessageViewModel *)v7 setTranscriptViewModel:v37];
  }
  else
  {
    id v36 = 0;
  }
  [(MPVoicemailMessageViewModel *)v7 setShowsRestrictedAlertView:v4];
  [(MPVoicemailMessageViewModel *)v7 setLocalizedAttributedRestrictedAlertTitle:v36];

  return v7;
}

- (id)currentExpandedVoicemailMessageCell
{
  id v3 = [(MPVoicemailTableViewController *)self detailIndexPath];
  if (v3)
  {
    id v4 = [(MPVoicemailTableViewController *)self tableView];
    id v5 = [v4 cellForRowAtIndexPath:v3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateLargeTitleInsets
{
  id v3 = [(MPVoicemailTableViewController *)self featureFlags];
  unsigned __int8 v4 = [v3 phoneRecentsAvatarsEnabled];

  if ((v4 & 1) == 0)
  {
    id v5 = [(MPVoicemailTableViewController *)self navigationItem];
    [v5 largeTitleInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    +[PHVoicemailMessageTableViewCell marginWidth];
    double v13 = v12;
    double v14 = [(MPVoicemailTableViewController *)self navigationItem];
    [v14 setLargeTitleInsets:v7, v13, v9, v11];

    id v16 = [(MPVoicemailTableViewController *)self navigationItem];
    long long v15 = [v16 navigationBar];
    [v15 setNeedsLayout];
  }
}

- (MPVoicemailTranscriptionUnavailableView)transcriptionUnavailableView
{
  transcriptionUnavailableView = self->_transcriptionUnavailableView;
  if (!transcriptionUnavailableView)
  {
    unsigned __int8 v4 = objc_alloc_init(MPVoicemailTranscriptionUnavailableView);
    id v5 = self->_transcriptionUnavailableView;
    self->_transcriptionUnavailableView = v4;

    [(MPVoicemailTranscriptionUnavailableView *)self->_transcriptionUnavailableView setAutoresizingMask:18];
    transcriptionUnavailableView = self->_transcriptionUnavailableView;
  }

  return transcriptionUnavailableView;
}

- (void)handleDialVoiceMail:(id)a3
{
}

- (void)resetSelectedIndexPath
{
  id v3 = [(MPVoicemailTableViewController *)self detailIndexPath];

  if (v3)
  {
    unsigned __int8 v4 = [(MPVoicemailTableViewController *)self tableView];
    id v5 = [(MPVoicemailTableViewController *)self detailIndexPath];
    double v6 = [v4 cellForRowAtIndexPath:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = +[NSNotificationCenter defaultCenter];
      [v7 removeObserver:self name:@"PHAudioDeviceControllerAudioRoutesChangedNotification" object:0];

      double v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self name:@"PHAudioDeviceControllerPickedRouteChangedNotification" object:0];

      id v9 = v6;
      double v10 = PHDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [(MPVoicemailTableViewController *)self detailIndexPath];
        int v12 = 138412290;
        double v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting to stop playback at indexPath: %@", (uint8_t *)&v12, 0xCu);
      }
      [(MPVoicemailTableViewController *)self voicemailMessageTableViewCell:v9 didRequestPlayState:0];

      [(MPVoicemailTableViewController *)self setDetailIndexPath:0];
    }
  }
}

- (void)configureAudioButtonForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailTableViewController *)self tableView];
  double v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    double v8 = [v7 toolbar];
    id v9 = [v8 audioRouteButton];

    double v10 = [(MPVoicemailTableViewController *)self audioDeviceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke;
    v13[3] = &unk_10027D580;
    id v14 = v9;
    long long v15 = self;
    id v16 = v7;
    id v11 = v7;
    id v12 = v9;
    [v10 fetchCurrentRouteWithCompletionHandler:v13];
  }
}

void __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) configureButtonUsingAudioRoute:a2];
  id v3 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_10027CBE0;
  id v4 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v3, block);
}

void __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke_2(id *a1)
{
  unsigned __int8 v2 = [a1[4] shouldSuppressAudioRouteAlertController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke_3;
  v5[3] = &unk_10027D558;
  id v6 = a1[5];
  unsigned __int8 v9 = v2;
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id __72__MPVoicemailTableViewController_configureAudioButtonForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) toolbar];
  [v2 updateAudioRouteButtonWithTouchUpInsideEnabled:*(unsigned __int8 *)(a1 + 56)];

  int v3 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = *(void **)(a1 + 40);
    id v4 = (void **)(a1 + 40);
    [v5 setMenu:0];
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) routeListController];
    id v7 = [v6 menu];
    id v8 = *(void **)(a1 + 40);
    id v4 = (void **)(a1 + 40);
    [v8 setMenu:v7];
  }
  unsigned __int8 v9 = *v4;

  return [v9 setShowsMenuAsPrimaryAction:v3 == 0];
}

- (BOOL)shouldSuppressAudioRouteAlertController
{
  int v3 = [(MPVoicemailTableViewController *)self audioDeviceController];
  id v4 = [v3 _unformattedPickableRoutesForAudioSessionCategory:AVAudioSessionCategoryVoiceMail];

  id v5 = [(MPVoicemailTableViewController *)self audioDeviceController];
  id v6 = [v5 routesForUnformattedPickableRoutes:v4];
  if ([v6 count] == (id)2)
  {
    id v7 = [(MPVoicemailTableViewController *)self audioDeviceController];
    if ([v7 handsetRouteAvailableForUnformattedPickableRoutes:v4])
    {
      id v8 = [(MPVoicemailTableViewController *)self audioDeviceController];
      unsigned __int8 v9 = [v8 speakerRouteAvailableForUnformattedPickableRoutes:v4];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (PHAudioRoutingMenuController)routeListController
{
  routeListController = self->_routeListController;
  if (!routeListController)
  {
    objc_initWeak(&location, self);
    unsigned __int8 v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = __53__MPVoicemailTableViewController_routeListController__block_invoke;
    id v12 = &unk_10027D5A8;
    objc_copyWeak(&v13, &location);
    id v4 = objc_retainBlock(&v9);
    id v5 = [PHAudioRoutingMenuController alloc];
    id v6 = -[PHAudioRoutingMenuController initWithStyle:dataSource:delegate:wantsAsyncReload:menuChangeHandler:](v5, "initWithStyle:dataSource:delegate:wantsAsyncReload:menuChangeHandler:", 3, self, self, 1, v4, v9, v10, v11, v12);
    id v7 = self->_routeListController;
    self->_routeListController = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    routeListController = self->_routeListController;
  }

  return routeListController;
}

void __53__MPVoicemailTableViewController_routeListController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    unsigned __int8 v2 = [WeakRetained detailIndexPath];

    id WeakRetained = v4;
    if (v2)
    {
      int v3 = [v4 detailIndexPath];
      [v4 configureAudioButtonForRowAtIndexPath:v3];

      id WeakRetained = v4;
    }
  }
}

- (void)fetchRoutesForAudioRoutingMenuController:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(MPVoicemailTableViewController *)self audioDeviceController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __93__MPVoicemailTableViewController_fetchRoutesForAudioRoutingMenuController_completionHandler___block_invoke;
  v8[3] = &unk_10027D5D0;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchRoutesWithCompletionHandler:v8];
}

uint64_t __93__MPVoicemailTableViewController_fetchRoutesForAudioRoutingMenuController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v12 = a4;
  id v5 = [(MPVoicemailTableViewController *)self audioDeviceController];
  id v6 = [v5 currentRoute];
  unsigned __int8 v7 = [v6 isEqualToRouteIgnoringIsRecommended:v12];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(MPVoicemailTableViewController *)self audioDeviceController];
    id v9 = [v12 uniqueIdentifier];
    [(id)v8 pickRouteWithUID:v9];

    uint64_t v10 = [(MPVoicemailTableViewController *)self playerController];
    LOBYTE(v8) = [v10 isPlaying];

    if ((v8 & 1) == 0)
    {
      id v11 = +[AVAudioSession sharedInstance];
      [v11 deactivateVoicemailAudioSession];
    }
  }
}

- (void)voicemailMessageCellDidTapToCollapse:(id)a3
{
  id v4 = [(MPVoicemailTableViewController *)self detailIndexPath];

  if (v4)
  {
    id v6 = [(MPVoicemailTableViewController *)self tableView];
    id v5 = [(MPVoicemailTableViewController *)self detailIndexPath];
    [(MPVoicemailTableViewController *)self tableView:v6 collapseRowAtIndexPath:v5 animated:1];
  }
}

- (void)voicemailMessageTableViewCell:(id)a3 actionButtonTappedForRowWithIndexPath:(id)a4
{
  -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", objc_msgSend(a4, "row", a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v5 = [(MPVoicemailTableViewController *)self exportVoicemailDataForVoicemail:v5];
    id v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (void)voicemailMessageTableViewCell:(id)a3 audioRouteButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __106__MPVoicemailTableViewController_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __106__MPVoicemailTableViewController_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __106__MPVoicemailTableViewController_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath___block_invoke_2;
  block[3] = &unk_10027C670;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __106__MPVoicemailTableViewController_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) audioDeviceController];
  int v3 = [v2 currentRoute];
  unsigned int v4 = [v3 isSpeaker];

  id v5 = [*(id *)(a1 + 32) audioDeviceController];
  id v6 = v5;
  if (v4) {
    [v5 pickHandsetRoute];
  }
  else {
    [v5 pickSpeakerRoute];
  }
}

- (void)voicemailMessageTableViewCell:(id)a3 moveButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  +[CATransaction begin];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = __100__MPVoicemailTableViewController_voicemailMessageTableViewCell_moveButtonTappedForRowWithIndexPath___block_invoke;
  id v11 = &unk_10027C940;
  id v12 = self;
  id v13 = v5;
  id v6 = v5;
  +[CATransaction setCompletionBlock:&v8];
  id v7 = [(MPVoicemailTableViewController *)self tableView];
  [(MPVoicemailTableViewController *)self tableView:v7 collapseRowAtIndexPath:v6 animated:1];

  +[CATransaction commit];
}

id __100__MPVoicemailTableViewController_voicemailMessageTableViewCell_moveButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1)
{
  char v2 = objc_opt_respondsToSelector();
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    return [v3 performTableViewRestoreActionAtIndexPath:v4];
  }
  else
  {
    return [v3 performTableViewDestructiveActionAtIndexPath:v4];
  }
}

- (BOOL)voicemailMessageTableViewCell:(id)a3 shouldShowRTTButtonForRowWithIndexPath:(id)a4
{
  uint64_t v4 = -[self messageAtIndex:[a4 row]];
  id v5 = [v4 transcript];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 transcript];
    uint64_t v8 = [v7 conversation];

    uint64_t v9 = [v8 utterances];
    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)voicemailMessageTableViewCell:(id)a3 rttButtonTappedForRowWithIndexPath:(id)a4
{
  [self messageAtIndex:[a4 row]];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v13 transcript];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = v13;
  if (isKindOfClass)
  {
    uint64_t v8 = [v13 transcript];
    uint64_t v9 = [v8 conversation];

    id v10 = RTTUIConversationViewControllerClass();
    if (v10 && v9)
    {
      id v11 = [v10 viewControllerForConversation:v9];
      id v12 = [(MPVoicemailTableViewController *)self navigationController];
      [v12 pushViewController:v11 animated:1];
    }
    id v7 = v13;
  }
}

- (void)voicemailMessageTableViewCellDidBeginScrubbing:(id)a3
{
  id v3 = [(MPVoicemailTableViewController *)self playerController];
  [v3 pause];
}

- (void)voicemailMessageTableViewCellDidEndScrubbing:(id)a3
{
  id v3 = [(MPVoicemailTableViewController *)self playerController];
  [v3 play];
}

- (void)voicemailMessageTableViewCellDidCancelScrubbing:(id)a3
{
  id v8 = [(MPVoicemailTableViewController *)self currentExpandedVoicemailMessageCell];
  if (v8)
  {
    uint64_t v4 = [(MPVoicemailTableViewController *)self playerController];
    [v4 currentTime];
    double v6 = v5;
    id v7 = [v8 playerControlsView];
    [v7 setElapsedTime:v6];
  }
}

- (void)voicemailMessageTableViewCell:(id)a3 didChangeElapsedTime:(double)a4
{
  id v6 = [(MPVoicemailTableViewController *)self playerController];
  *(float *)&double v5 = a4;
  [v6 seekToTime:v5];
}

- (void)voicemailMessageTableViewCell:(id)a3 didReceiveTranscriptTapGesture:(id)a4
{
  if (objc_msgSend(a4, "state", a3) == (id)3)
  {
    double v5 = [(MPVoicemailTableViewController *)self detailIndexPath];
    -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v5 row]);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [v15 transcript];

    if (v6)
    {
      id v7 = +[NSBundle mainBundle];
      id v8 = [v7 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_ALERT_ACTION_TITLE_CANCEL" value:&stru_100285990 table:@"VoicemailUI"];
      uint64_t v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];

      id v10 = +[NSBundle mainBundle];
      id v11 = [v10 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_ALERT_TITLE_DEBUG" value:&stru_100285990 table:@"VoicemailUI"];
      id v12 = [v15 transcript];
      id v13 = [v12 debugDescription];
      id v14 = +[UIAlertController alertControllerWithTitle:v11 message:v13 preferredStyle:1];

      [v14 addAction:v9];
      [(MPVoicemailTableViewController *)self presentViewController:v14 animated:1 completion:0];
    }
  }
}

- (void)voicemailMessageTableViewCellShouldPresentWelcomeViewController:(id)a3
{
  uint64_t v4 = [[_TtC11MobilePhone34LiveVoicemailWelcomeViewController alloc] initWithDelegate:self];
  [(MPVoicemailTableViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)voicemailMessageTableViewCell:(id)a3 didReceiveTranscriptFeedback:(unint64_t)a4
{
  id v6 = [(MPVoicemailTableViewController *)self detailIndexPath];
  id v7 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v6 row]);

  if (a4 - 1 <= 1)
  {
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = [(MPVoicemailTableViewController *)self voicemailController];
      uint64_t v9 = [v8 voicemailManager];
      id v10 = [v9 vmdVoiceMailManager];
      id v11 = [v7 vmMessage];
      [v10 reportTranscriptionRatedAccurate:a4 == 2 forVoicemail:v11];
    }
    else
    {
      id v12 = PHDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MPVoicemailTableViewController voicemailMessageTableViewCell:didReceiveTranscriptFeedback:](v12);
      }
    }
  }
  id v13 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app", v7];
  id v14 = [v13 localizedStringForKey:@"VOICEMAIL_TRANSCRIPTION_ALERT_TITLE" value:&stru_100285990 table:@"Voicemail"];
  id v15 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v16 = [v15 localizedStringForKey:@"VOICEMAIL_TRANSCRIPTION_ALERT_MESSAGE" value:&stru_100285990 table:@"Voicemail"];
  uint64_t v17 = +[UIAlertController alertControllerWithTitle:v14 message:v16 preferredStyle:1];

  id v18 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  double v19 = [v18 localizedStringForKey:@"VOICEMAIL_TRANSCRIPTION_ALERT_CANCEL" value:&stru_100285990 table:@"Voicemail"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __93__MPVoicemailTableViewController_voicemailMessageTableViewCell_didReceiveTranscriptFeedback___block_invoke;
  v29[3] = &unk_10027CC60;
  v29[4] = self;
  BOOL v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v29];
  [v17 addAction:v20];

  id v21 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v22 = [v21 localizedStringForKey:@"VOICEMAIL_TRANSCRIPTION_ALERT_ACCEPT" value:&stru_100285990 table:@"Voicemail"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __93__MPVoicemailTableViewController_voicemailMessageTableViewCell_didReceiveTranscriptFeedback___block_invoke_2;
  v26[3] = &unk_10027D5F8;
  id v27 = v25;
  unsigned int v28 = self;
  id v23 = v25;
  BOOL v24 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v26];
  [v17 addAction:v24];

  [(MPVoicemailTableViewController *)self presentViewController:v17 animated:1 completion:0];
}

id __93__MPVoicemailTableViewController_voicemailMessageTableViewCell_didReceiveTranscriptFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __93__MPVoicemailTableViewController_voicemailMessageTableViewCell_didReceiveTranscriptFeedback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [*(id *)(a1 + 40) voicemailController];
    double v5 = [v4 voicemailManager];
    id v6 = [v5 vmdVoiceMailManager];
    id v7 = [*(id *)(a1 + 32) vmMessage];
    [v6 reportTranscriptionProblemForVoicemail:v7];
  }
  else
  {
    uint64_t v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MPVoicemailTableViewController voicemailMessageTableViewCell:didReceiveTranscriptFeedback:](v4);
    }
  }

  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelPlaybackRequest
{
  id v3 = [(MPVoicemailTableViewController *)self audioPlaybackRequestBlock];

  if (v3)
  {
    uint64_t v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling playback request block", v6, 2u);
    }

    double v5 = [(MPVoicemailTableViewController *)self audioPlaybackRequestBlock];
    dispatch_block_cancel(v5);

    [(MPVoicemailTableViewController *)self setAudioPlaybackRequestBlock:0];
  }
}

- (void)voicemailMessageTableViewCell:(id)a3 didRequestPlayState:(int64_t)a4
{
  id v6 = a3;
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requested state: %ld for playbackControls", buf, 0xCu);
  }

  switch(a4)
  {
    case 2:
      uint64_t v9 = [(MPVoicemailTableViewController *)self playerController];
      [v9 pause];

      break;
    case 1:
      id v10 = [(MPVoicemailTableViewController *)self tableView];
      id v11 = [v10 indexPathForCell:v6];
      id v12 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [v11 row]);
      id v13 = [v12 dataURL];

      if (v13)
      {
        objc_initWeak((id *)buf, self);
        [(MPVoicemailTableViewController *)self setIsPendingAudioSessionActivation:1];
        [(MPVoicemailTableViewController *)self cancelPlaybackRequest];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke;
        block[3] = &unk_10027C8A0;
        objc_copyWeak(&v21, (id *)buf);
        id v20 = v13;
        dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
        [(MPVoicemailTableViewController *)self setAudioPlaybackRequestBlock:v14];

        id v15 = dispatch_get_global_queue(2, 0);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke_199;
        v17[3] = &unk_10027D380;
        objc_copyWeak(&v18, (id *)buf);
        dispatch_async(v15, v17);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }

      break;
    case 0:
      id v8 = [(MPVoicemailTableViewController *)self playerController];
      [v8 stop];

      [(MPVoicemailTableViewController *)self setIsPendingAudioSessionActivation:0];
      [(MPVoicemailTableViewController *)self cancelPlaybackRequest];
      break;
  }
  id v16 = [(MPVoicemailTableViewController *)self audioDeviceController];
  [v16 restorePickedRoute];
}

void __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Executing playback block for URL: %@", (uint8_t *)&v6, 0xCu);
    }

    double v5 = [WeakRetained playerController];
    [v5 playURL:*(void *)(a1 + 32)];

    [WeakRetained setAudioPlaybackRequestBlock:0];
  }
}

void __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke_199(uint64_t a1)
{
  char v2 = +[AVAudioSession sharedInstance];
  [v2 activateVoicemailAudioSession];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke_2;
  block[3] = &unk_10027D380;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void __84__MPVoicemailTableViewController_voicemailMessageTableViewCell_didRequestPlayState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained audioDeviceController];
    id v4 = [v3 currentRoute];
    uint64_t v5 = [v4 isReceiver] ? 2 : 0;

    int v6 = [v2 audioPlaybackRequestBlock];

    if (v6)
    {
      dispatch_time_t v7 = dispatch_time(0, 1000000000 * v5);
      id v8 = [v2 audioPlaybackRequestBlock];
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);

      uint64_t v9 = PHDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        uint64_t v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduled playback request block with delay %lu", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)playMessage:(id)a3
{
  id v4 = a3;
  if ([(MPVoicemailTableViewController *)self isViewLoaded]
    && [(MPVoicemailTableViewController *)self visible])
  {
    uint64_t v5 = [v4 identifier];
    int v6 = [(MPVoicemailTableViewController *)self indexPathForMessageID:v5];

    dispatch_time_t v7 = [(MPVoicemailTableViewController *)self voicemailController];
    unsigned int v8 = [v7 isRestrictedMessage:v4];

    if (v6)
    {
      if (!v4 || (([v4 isDataAvailable] ^ 1 | v8) & 1) != 0)
      {
        uint64_t v9 = PHDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412546;
          id v28 = v4;
          __int16 v29 = 1024;
          unsigned int v30 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asked to play voicemail %@ but will not as wither the voicemail is nil, data is not available, the message is restricted (%d) or it can't be found in the table", (uint8_t *)&v27, 0x12u);
        }

        goto LABEL_24;
      }
      id v12 = [(MPVoicemailTableViewController *)self voicemails];
      unsigned int v13 = [v12 containsObject:v4];

      if (v13)
      {
        dispatch_block_t v14 = [(MPVoicemailTableViewController *)self view];
        [v14 setUserInteractionEnabled:0];

        uint64_t v15 = [(MPVoicemailTableViewController *)self detailIndexPath];
        if (v15
          && (id v16 = (void *)v15,
              [(MPVoicemailTableViewController *)self detailIndexPath],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v18 = [v6 isEqual:v17],
              v17,
              v16,
              (v18 & 1) == 0))
        {
          id v21 = [(MPVoicemailTableViewController *)self tableView];
          id v22 = [(MPVoicemailTableViewController *)self detailIndexPath];
          [(MPVoicemailTableViewController *)self tableView:v21 collapseRowAtIndexPath:v22 animated:0];
        }
        else
        {
          double v19 = [(MPVoicemailTableViewController *)self detailIndexPath];

          if (v19)
          {
LABEL_28:
            BOOL v24 = [(MPVoicemailTableViewController *)self tableView];
            double v25 = [v24 cellForRowAtIndexPath:v6];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(MPVoicemailTableViewController *)self voicemailMessageTableViewCell:v25 didRequestPlayState:1];
            }
            id v26 = [(MPVoicemailTableViewController *)self view];
            [v26 setUserInteractionEnabled:1];

            goto LABEL_24;
          }
        }
        int64_t v23 = [(MPVoicemailTableViewController *)self tableView];
        [(MPVoicemailTableViewController *)self tableView:v23 expandRowAtIndexPath:v6 animated:0];

        goto LABEL_28;
      }
      id v20 = PHDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        id v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding message to playback queue since we did not find it in voicemail list %@", (uint8_t *)&v27, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = PHDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        id v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding message to playback queue since we did not find it in voicemail list %@", (uint8_t *)&v27, 0xCu);
      }

      [(MPVoicemailTableViewController *)self setPlayMessageOnReloadData:1];
    }
    [(MPVoicemailTableViewController *)self addMessageToPlaybackQueue:v4];
LABEL_24:

    goto LABEL_25;
  }
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding message to playback queue since view is not loaded %@", (uint8_t *)&v27, 0xCu);
  }

  [(MPVoicemailTableViewController *)self addMessageToPlaybackQueue:v4];
LABEL_25:
}

- (id)messageToPlayFromPlaybackQueue
{
  if ([(MPVoicemailTableViewController *)self isViewLoaded])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
    id v4 = [v3 reverseObjectEnumerator];

    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [(MPVoicemailTableViewController *)self indexPathForMessageID:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v9)
          {
            int v10 = (void *)v9;
            uint64_t v11 = [(MPVoicemailTableViewController *)self voicemails];
            id v12 = [v11 objectAtIndexedSubscript:[v10 row]];

            if (v12)
            {
              unsigned int v13 = [(MPVoicemailTableViewController *)self voicemailController];
              unsigned int v14 = [v13 isRestrictedMessage:v12];

              if (!v14)
              {

                goto LABEL_16;
              }
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_16:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)playMessageFromPlaybackQueue
{
  id v3 = [(MPVoicemailTableViewController *)self messageToPlayFromPlaybackQueue];
  if (v3)
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
      int v9 = 138412546;
      int v10 = v3;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found a message: %@ from the playback queue: %@ that needs to be played", (uint8_t *)&v9, 0x16u);
    }
    id v6 = [(MPVoicemailTableViewController *)self messagePlaybackQueue];
    uint64_t v7 = [v3 identifier];
    [v6 removeObject:v7];

    [(MPVoicemailTableViewController *)self playMessage:v3];
  }

  return v3 != 0;
}

- (void)exportVoicemailDataForVoicemail:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exporting data for voicemail %@", buf, 0xCu);
  }

  id v6 = [(MPVoicemailTableViewController *)self playerController];
  unsigned int v7 = [v6 isPlaying];

  if (v7)
  {
    unsigned int v8 = [(MPVoicemailTableViewController *)self playerController];
    [v8 pause];
  }
  int v9 = [v4 dataURL];
  int v10 = +[AVURLAsset assetWithURL:v9];

  id v11 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v10 presetName:AVAssetExportPresetAppleM4A];
  id v12 = [v4 identifier];
  unsigned int v13 = +[NSString stringWithFormat:@"voicemail-%lu.m4a", v12];

  unsigned int v14 = NSTemporaryDirectory();
  uint64_t v15 = [v14 stringByAppendingPathComponent:v13];
  long long v16 = +[NSURL fileURLWithPath:v15];
  [v11 setOutputURL:v16];

  long long v17 = +[NSFileManager defaultManager];
  long long v18 = [v11 outputURL];
  [v17 removeItemAtURL:v18 error:0];

  [v11 setOutputFileType:AVFileTypeAppleM4A];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke;
  v21[3] = &unk_10027CBE0;
  id v22 = v11;
  id v23 = v4;
  BOOL v24 = self;
  id v19 = v4;
  id v20 = v11;
  [v20 exportAsynchronouslyWithCompletionHandler:v21];
}

void __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke(uint64_t a1)
{
  char v2 = (char *)[*(id *)(a1 + 32) status];
  if ((unint64_t)v2 < 3)
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Voicemail Export: We got a completion handler callback for export, but no error", buf, 2u);
    }
  }
  else if ((unint64_t)(v2 - 4) >= 2)
  {
    if (v2 != (char *)3) {
      return;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_2;
    block[3] = &unk_10027CBE0;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    unsigned int v13 = v6;
    uint64_t v14 = v7;
    id v15 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v5 = v13;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_210;
    v8[3] = &unk_10027C940;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v9 = v3;
    uint64_t v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    id v5 = v9;
  }
}

void __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_2(uint64_t a1)
{
  char v2 = [PHVoicemailVoiceMemoActivity alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) voicemailController];
  id v5 = [v4 contactStore];
  id v6 = [(PHVoicemailVoiceMemoActivity *)v2 initWithVoicemail:v3 contactStore:v5];

  uint64_t v7 = [*(id *)(a1 + 48) outputURL];
  unsigned int v8 = [*(id *)(a1 + 40) voicemailController];
  int v9 = [v8 localizedTitleForMessage:*(void *)(a1 + 32)];
  uint64_t v10 = [(PHVoicemailVoiceMemoActivity *)v6 URLItemWithExportedURL:v7 localizedTitle:v9];

  id v11 = objc_alloc((Class)UIActivityViewController);
  long long v16 = v10;
  id v12 = +[NSArray arrayWithObjects:&v16 count:1];
  id v13 = [v11 initWithActivityItems:v12 applicationActivities:0];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_3;
  v14[3] = &unk_10027D620;
  id v15 = *(id *)(a1 + 48);
  [v13 setCompletionWithItemsHandler:v14];
  [*(id *)(a1 + 40) presentViewController:v13 animated:1 completion:0];
}

void __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_3(uint64_t a1)
{
  id v3 = +[NSFileManager defaultManager];
  char v2 = [*(id *)(a1 + 32) outputURL];
  [v3 removeItemAtURL:v2 error:0];
}

void __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_210(uint64_t a1)
{
  char v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_210_cold_1(a1, v2);
  }

  id v3 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  uint64_t v4 = [v3 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];
  id v5 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v6 = [v5 localizedStringForKey:@"VOICEMAIL_SHARE_ERROR_MESSAGE" value:&stru_100285990 table:@"Voicemail"];
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  unsigned int v8 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  int v9 = [v8 localizedStringForKey:@"OK" value:&stru_100285990 table:@"Voicemail"];
  uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
  [v7 addAction:v10];

  [*(id *)(a1 + 40) presentViewController:v7 animated:1 completion:0];
}

- (void)performDeleteAtIndexPaths:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  unsigned int v8 = [(MPVoicemailTableViewController *)self messagesAtIndexPaths:v6];
  int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v8;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing delete for messages: %@, with corresponding indexPaths: %@", buf, 0x16u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v14);
        long long v16 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelCache];
        long long v17 = [v15 identifier];
        [v16 removeObjectForKey:v17];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  long long v18 = [(MPVoicemailTableViewController *)self voicemails];
  [v18 removeObjectsInArray:v10];

  id v19 = [(MPVoicemailTableViewController *)self featureFlags];
  unsigned int v20 = [v19 voicemailSearchEnabled];

  if (v20 && ![(MPVoicemailTableViewController *)self visible])
  {
    [(PHTableViewController *)self setNeedsReloadData:1];
    if (v7) {
      v7[2](v7, v10);
    }
  }
  else
  {
    id v21 = [(MPVoicemailTableViewController *)self tableView];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __76__MPVoicemailTableViewController_performDeleteAtIndexPaths_completionBlock___block_invoke;
    v25[3] = &unk_10027C940;
    v25[4] = self;
    id v26 = v6;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __76__MPVoicemailTableViewController_performDeleteAtIndexPaths_completionBlock___block_invoke_2;
    v22[3] = &unk_10027D648;
    BOOL v24 = v7;
    id v23 = v10;
    [v21 performBatchUpdates:v25 completion:v22];
  }
}

void __76__MPVoicemailTableViewController_performDeleteAtIndexPaths_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 deleteRowsAtIndexPaths:*(void *)(a1 + 40) withRowAnimation:2];
}

uint64_t __76__MPVoicemailTableViewController_performDeleteAtIndexPaths_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)didTapContinueWithViewController:(id)a3
{
}

- (void)didTapSettingsWithViewController:(id)a3
{
}

- (void)voicemailMessageDetailViewController:(id)a3 destructiveActionPerformedForMessage:(id)a4 completionBlock:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  unsigned int v8 = [a4 identifier];
  int v9 = [(MPVoicemailTableViewController *)self indexPathForMessageID:v8];

  if (v9)
  {
    uint64_t v13 = v9;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __124__MPVoicemailTableViewController_voicemailMessageDetailViewController_destructiveActionPerformedForMessage_completionBlock___block_invoke;
    v11[3] = &unk_10027D5D0;
    id v12 = v7;
    [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v10 completionBlock:v11];
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __124__MPVoicemailTableViewController_voicemailMessageDetailViewController_destructiveActionPerformedForMessage_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSMutableArray)voicemails
{
  return self->_voicemails;
}

- (void)setVoicemails:(id)a3
{
}

- (BOOL)isPendingAudioSessionActivation
{
  return self->isPendingAudioSessionActivation;
}

- (void)setIsPendingAudioSessionActivation:(BOOL)a3
{
  self->isPendingAudioSessionActivation = a3;
}

- (NSArray)allVoicemails
{
  return self->_allVoicemails;
}

- (void)setAllVoicemails:(id)a3
{
}

- (MPVoicemailController)voicemailController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voicemailController);

  return (MPVoicemailController *)WeakRetained;
}

- (NSIndexPath)detailIndexPath
{
  return self->_detailIndexPath;
}

- (void)setDetailIndexPath:(id)a3
{
}

- (id)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (void)setPreFetchingPredicate:(id)a3
{
}

- (BOOL)isSearchViewController
{
  return self->_isSearchViewController;
}

- (void)setIsSearchViewController:(BOOL)a3
{
  self->_isSearchViewController = a3;
}

- (MPVoicemailTableViewControllerDelegate)fetchDelegate
{
  return self->_fetchDelegate;
}

- (void)setFetchDelegate:(id)a3
{
}

- (MPVoicemailConnectionUnavailableView)connectionUnavailableView
{
  return self->_connectionUnavailableView;
}

- (void)setConnectionUnavailableView:(id)a3
{
}

- (void)setTranscriptionUnavailableView:(id)a3
{
}

- (void)setAccountProvisioningViewController:(id)a3
{
}

- (BOOL)isTranscriptionUnavailable
{
  return self->_transcriptionUnavailable;
}

- (BOOL)allowTableViewScrolling
{
  return self->_allowTableViewScrolling;
}

- (void)setAllowTableViewScrolling:(BOOL)a3
{
  self->_allowTableViewScrolling = a3;
}

- (CGPoint)fixedTableViewContentOffset
{
  double x = self->_fixedTableViewContentOffset.x;
  double y = self->_fixedTableViewContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFixedTableViewContentOffset:(CGPoint)a3
{
  self->_fixedTableViewContentOffset = a3;
}

- (BOOL)playMessageOnReloadData
{
  return self->_playMessageOnReloadData;
}

- (void)setPlayMessageOnReloadData:(BOOL)a3
{
  self->_playMessageOnReloadData = a3;
}

- (id)audioPlaybackRequestBlock
{
  return self->_audioPlaybackRequestBlock;
}

- (void)setAudioPlaybackRequestBlock:(id)a3
{
}

- (void)setNavBarGestureRecognizer:(id)a3
{
}

- (void)setLeftBarButtonItemGestureRecognizer:(id)a3
{
}

- (void)setRightBarButtonItemGestureRecognizer:(id)a3
{
}

- (void)setCardController:(id)a3
{
}

- (NSCache)voicemailMessageViewModelCache
{
  return self->_voicemailMessageViewModelCache;
}

- (NSMutableArray)messagePlaybackQueue
{
  return self->_messagePlaybackQueue;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setRouteListController:(id)a3
{
}

- (VMMessageTranscriptionProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (PHAudioDeviceController)audioDeviceController
{
  return self->_audioDeviceController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (PhoneNavigationController)phoneNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneNavigationController);

  return (PhoneNavigationController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_phoneNavigationController);
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_messagePlaybackQueue, 0);
  objc_storeStrong((id *)&self->_voicemailMessageViewModelCache, 0);
  objc_storeStrong((id *)&self->_cardController, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItemGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItemGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navBarGestureRecognizer, 0);
  objc_storeStrong(&self->_audioPlaybackRequestBlock, 0);
  objc_storeStrong((id *)&self->_accountProvisioningViewController, 0);
  objc_storeStrong((id *)&self->_transcriptionUnavailableView, 0);
  objc_storeStrong((id *)&self->_connectionUnavailableView, 0);
  objc_storeStrong((id *)&self->_fetchDelegate, 0);
  objc_storeStrong(&self->_preFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_detailIndexPath, 0);
  objc_destroyWeak((id *)&self->_voicemailController);
  objc_storeStrong((id *)&self->_allVoicemails, 0);

  objc_storeStrong((id *)&self->_voicemails, 0);
}

- (BOOL)isAccountProvisioningRequired
{
  id v2 = self;
  char v3 = MPVoicemailTableViewController.isAccountProvisioningRequired.getter();

  return v3 & 1;
}

- (void)startObservingPreferences
{
  id v2 = self;
  MPVoicemailTableViewController.startObservingPreferences()();
}

- (void)stopObservingPreferences
{
  type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for NSMutableArray);
  char v3 = self;
  id v4 = (id)NSArray.init(arrayLiteral:)();
  [(MPVoicemailTableViewController *)v3 setObservations:v4];
}

- (void)voicemailMessageTableViewCell:(id)a3 dialRequestButtonTappedForRowWithIndexPath:(id)a4
{
  id v6 = (PHVoicemailMessageTableViewCell *)a3;
  id v7 = a4;
  unsigned int v8 = self;
  MPVoicemailTableViewController.voicemailMessageTableViewCell(tableViewCell:dialRequestButtonTappedForRowWithIndexPath:)(v6, (NSIndexPath)v7);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  }
}

- (void)configureLegacyVoicemailCell:(id)a3 for:(id)a4 showLabel:(BOOL)a5 onCallTapped:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  specialized MPVoicemailTableViewController.configureLegacyVoicemailCell(_:for:showLabel:onCallTapped:)((uint64_t)v12, (uint64_t)v13, a5, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v11);

  swift_release();
}

void __69__MPVoicemailTableViewController_checkTranscriptionModelAvailability__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, a2, a3, "%@", (uint8_t *)&v4);
}

- (void)tableView:(void *)a1 expandRowAtIndexPath:(NSObject *)a2 animated:.cold.1(void *a1, NSObject *a2)
{
  int v4 = 134217984;
  id v5 = [a1 row];
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, a2, v3, "Not expanding row as unable to find message at row: %ld", (uint8_t *)&v4);
}

- (void)tableView:(uint64_t)a1 expandRowAtIndexPath:(NSObject *)a2 animated:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, a2, a3, "Attempt to scroll table view to out-of-bound row at index: %@", (uint8_t *)&v3);
}

- (void)voicemailMessageTableViewCell:(os_log_t)log didReceiveTranscriptFeedback:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "VoiceMail rating: We failed to rate becuase we do not support it for FTMessages yet.", v1, 2u);
}

void __66__MPVoicemailTableViewController_exportVoicemailDataForVoicemail___block_invoke_210_cold_1(uint64_t a1, NSObject *a2)
{
  int v3 = [*(id *)(a1 + 32) error];
  int v5 = 138412290;
  id v6 = v3;
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, a2, v4, "Voicemail Export: Error exporting voicemail. Error was: %@", (uint8_t *)&v5);
}

@end