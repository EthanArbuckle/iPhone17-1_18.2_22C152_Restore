@interface MSMessageExtensionBrowserViewController
+ (void)invalidateSnapshotForKey:(id)a3;
- (BOOL)_canCurrentPluginShowInBrowserPluginIdentifier:(id)a3;
- (BOOL)_shouldVendRemoteViewControllerForCardSwipeSPI;
- (BOOL)allowAllPayloadCommits;
- (BOOL)canReplaceDataSource;
- (BOOL)dragManager:(id)a3 canPeelItem:(id)a4;
- (BOOL)dragManager:(id)a3 canRotateItem:(id)a4;
- (BOOL)dragManager:(id)a3 canScaleItem:(id)a4;
- (BOOL)dragManager:(id)a3 shouldCancelDraggingForItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6;
- (BOOL)extensionIsActive;
- (BOOL)extensionLoadRequestInFlight;
- (BOOL)extensionWantsDraftAssetArchives;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isAlive;
- (BOOL)isDismissing;
- (BOOL)isFromValidExtension;
- (BOOL)isGenerativePlaygroundExtension;
- (BOOL)isInDeferredTeardown;
- (BOOL)isLoaded;
- (BOOL)isPhotosExtensionBrowser;
- (BOOL)isShowingAssetExplorerShelf;
- (BOOL)isWaitingForReply;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (IMBalloonAppExtension)balloonExtensionPlugin;
- (MSMessage)message;
- (MSMessageExtensionBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (MSTouchTracker)touchTracker;
- (NSMutableArray)extensionLoadRequestCompletionBlockArray;
- (NSString)description;
- (NSString)lastDraftConversationID;
- (NSUUID)sessionUUID;
- (UIView)snapshotView;
- (UIViewController)assetExplorerShelfViewController;
- (UIViewController)remoteViewController;
- (_MSMessageComposeExtensionImplProtocol)appContext;
- (_MSMessageComposeExtensionProtocol)remoteProxy;
- (_MSMessageMediaPayload)currentDragPayload;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_arrayForApplePlistKey:(id)a3;
- (id)_bundleIDsForSwipeGestureDisablement;
- (id)_configurePhotosDraftAssetArchivesWithConversationID:(id)a3;
- (id)_itemPayloadFromMSMessage:(id)a3;
- (id)assetExplorerTransport;
- (id)cancelTouchesInView;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)completionHandler;
- (id)conversationEngramID;
- (id)currentConversationState;
- (id)extension;
- (id)fetchPluginPayloadsAndClear:(BOOL)a3;
- (id)fetchPluginStagedIdentifiers;
- (id)generatedSummary;
- (id)generativeContext;
- (id)iMessageLoginID;
- (id)navigationItem;
- (id)recipients;
- (id)requestSnapshotDataForPersistance;
- (id)sender;
- (id)substituteNameInString:(id)a3;
- (id)substituteNameInString:(id)a3 withAppID:(id)a4;
- (id)workingDirForDraft;
- (unint64_t)extensionLoadRequestCount;
- (unint64_t)presentationStyle;
- (unint64_t)sheetDetentStyle;
- (void)_addRemoteViewController;
- (void)_addRemoteViewControllerAndConfigureExtension;
- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)_assetArchiveRemoved:(id)a3;
- (void)_callAndDequeueLoadCompletionBlocks:(BOOL)a3;
- (void)_canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)_cancelExtensionRequest;
- (void)_configureMessage:(id)a3 withConversation:(id)a4;
- (void)_didRemoveStickerPreview;
- (void)_dismiss;
- (void)_dismissAndPresentPhotosApp;
- (void)_handleExtensionInterruption:(id)a3;
- (void)_instantiateRemoteViewControllerIfNeeded:(id)a3;
- (void)_instantiateRemoteViewControllerIfNeededWithIntent:(int64_t)a3 completion:(id)a4;
- (void)_markCurrentMessageAsPlayedIfNeeded;
- (void)_openURL:(id)a3 completionHandler:(id)a4;
- (void)_postCurrentPluginBrowserViewDidPrepareForDisplay;
- (void)_prepareForAddStickerFromSubjectLift;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)_remoteViewDidBecomeReadyForDisplay;
- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_removeRemoteViewController;
- (void)_removeRemoteViewControllerAndCancelExtensionRequestIfNeeded;
- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3;
- (void)_requestHostSceneIdentifierWithCompletion:(id)a3;
- (void)_requestPresentationStyle:(unint64_t)a3;
- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)_requestStickerExtensionMetadataDictionary:(id)a3;
- (void)_sendBecomeActiveMessage;
- (void)_sendInstantiationRequestToExtensionWithHandler:(id)a3;
- (void)_sendResignActiveMessage;
- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4;
- (void)_showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6;
- (void)_stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6;
- (void)_stickerDruidDragEndedWithPayload:(id)a3;
- (void)_stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4;
- (void)_stickerDruidDragStarted;
- (void)_transportStagingStateDidChange;
- (void)_updateSnapshotForNextLaunch:(id)a3;
- (void)appendDraftAssetArchivesIfNeeded:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)beginDisablingUserInteraction;
- (void)beginSuppressingAppearanceMethods;
- (void)browserScrolledOffScreen;
- (void)browserScrolledOnScreen;
- (void)chatKitTransport:(id)a3 commitPayload:(id)a4;
- (void)chatKitTransport:(id)a3 didUpdatePersistedURLsForPackageIdentifier:(id)a4;
- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3;
- (void)clearAllStagedPluginPackages;
- (void)clearPluginPackagesWithIdentifiers:(id)a3;
- (void)datasourcePayloadDidChange:(id)a3 updateFlags:(unint64_t)a4;
- (void)dealloc;
- (void)deferredForceTearDownRemoteView;
- (void)didCancelSendingPluginPayload:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didSelectGPAsset:(id)a3 recipeData:(id)a4 completion:(id)a5;
- (void)didStartSendingPluginPayload:(id)a3;
- (void)dismiss;
- (void)dragManager:(id)a3 didBeginDraggingItem:(id)a4;
- (void)dragManager:(id)a3 didEndDraggingItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6;
- (void)dropAssertion;
- (void)endDisablingUserInteraction;
- (void)endSuppressingAppearanceMethods;
- (void)forceTearDownRemoteView;
- (void)forceTearDownRemoteViewOverridingExceptions:(BOOL)a3;
- (void)handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5;
- (void)killExtensionProcess;
- (void)loadProxyIfNeededWithCompletion:(id)a3;
- (void)loadRemoteViewWithCompletion:(id)a3;
- (void)messageAddedWithDataSource:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)packageTransport:(id)a3 didUnstagePackageWithIdentifier:(id)a4;
- (void)prepareForDisplay;
- (void)prepareForPresentationWithCompletionHandler:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeSnapshot;
- (void)requestStickerExtensionMetadataDictionary:(id)a3;
- (void)restoreDraftStateFromPayload:(id)a3;
- (void)saveSnapshotForBrowserViewController;
- (void)setAppContext:(id)a3;
- (void)setAssetExplorerShelfViewController:(id)a3;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversationEngramID:(id)a3;
- (void)setCurrentDragPayload:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setExtensionIsActive:(BOOL)a3;
- (void)setExtensionLoadRequestCompletionBlockArray:(id)a3;
- (void)setExtensionLoadRequestCount:(unint64_t)a3;
- (void)setExtensionLoadRequestInFlight:(BOOL)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGenerativeContext:(id)a3;
- (void)setIsInDeferredTeardown:(BOOL)a3;
- (void)setIsShowingAssetExplorerShelf:(BOOL)a3;
- (void)setIsWaitingForReply:(BOOL)a3;
- (void)setLastDraftConversationID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setSender:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setShouldAutomaticallyForwardAppearanceMethods:(BOOL)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTouchTracker:(id)a3;
- (void)showSnapshotForSize:(CGSize)a3;
- (void)stageAssetToTransportAndNotifySendDelegate:(id)a3;
- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6;
- (void)unloadRemoteView;
- (void)validatePayloadForSending:(id)a3 associatedText:(id)a4 completionHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidTransitionToCompactPresentation;
- (void)viewDidTransitionToExpandedPresentation;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToCompactPresentation;
- (void)viewWillTransitionToExpandedPresentation;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)volumeButtonPressed:(BOOL)a3;
@end

@implementation MSMessageExtensionBrowserViewController

- (IMBalloonAppExtension)balloonExtensionPlugin
{
  v2 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (IMBalloonAppExtension *)v2;
}

- (MSMessageExtensionBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MSMessageExtensionBrowserViewController;
  v7 = [(MSMessageExtensionBrowserViewController *)&v21 initWithBalloonPlugin:a3 dataSource:v6];
  if (v7)
  {
    uint64_t v8 = [v6 message];
    message = v7->_message;
    v7->_message = (MSMessage *)v8;

    v7->_shouldAutomaticallyForwardAppearanceMethods = 1;
    sessionUUID = v7->_sessionUUID;
    v7->_sessionUUID = 0;

    remoteViewController = v7->_remoteViewController;
    v7->_remoteViewController = 0;

    v7->_extensionIsActive = 0;
    v7->_extensionLoadRequestCount = 0;
    v7->_extensionLoadRequestInFlight = 0;
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    extensionLoadRequestCompletionBlockArray = v7->_extensionLoadRequestCompletionBlockArray;
    v7->_extensionLoadRequestCompletionBlockArray = v12;

    v14 = objc_alloc_init(MSTouchTracker);
    touchTracker = v7->_touchTracker;
    v7->_touchTracker = v14;

    [v6 setDelegate:v7];
    if (CKIsRunningInMessages())
    {
      v16 = +[BKSTouchDeliveryObservationService sharedInstance];
      [v16 addObserver:v7];

      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v7 selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

      v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:v7 selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
    }
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v7 selector:"_handleExtensionInterruption:" name:IMExtensionRemoteConnectionWasInterrupted object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[MSMessageExtensionBrowserViewController dealloc]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s %lX", buf, 0x16u);
  }

  [self->_assetExplorerTransport unregisterChangeObserver:self context:MSAssetExplorerTransportContext];
  [(MSMessageExtensionBrowserViewController *)self forceTearDownRemoteView];
  if (CKIsRunningInMessages())
  {
    v4 = +[BKSTouchDeliveryObservationService sharedInstance];
    [v4 removeObserver:self];
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v6 dealloc];
}

- (NSString)description
{
  v3 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  v4 = [v3 identifier];
  v5 = +[NSString stringWithFormat:@"<%@ %p %@>", v4, self, objc_opt_class()];

  return (NSString *)v5;
}

- (id)navigationItem
{
  v3 = [(UIViewController *)self->_remoteViewController navigationItem];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MSMessageExtensionBrowserViewController;
    id v5 = [(MSMessageExtensionBrowserViewController *)&v8 navigationItem];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)childViewControllerForStatusBarHidden
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionBrowserViewController;
  v2 = [(MSMessageExtensionBrowserViewController *)&v4 childViewControllerForStatusBarHidden];

  return v2;
}

- (id)childViewControllerForStatusBarStyle
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionBrowserViewController;
  v2 = [(MSMessageExtensionBrowserViewController *)&v4 childViewControllerForStatusBarStyle];

  return v2;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  if ([(MSMessageExtensionBrowserViewController *)self _shouldVendRemoteViewControllerForCardSwipeSPI])
  {
    v3 = self->_remoteViewController;
  }
  else
  {
    v3 = 0;
  }

  return (_UIRemoteViewController *)v3;
}

- (BOOL)_shouldVendRemoteViewControllerForCardSwipeSPI
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(MSMessageExtensionBrowserViewController *)self linkedBeforeYukon] & 1) == 0)
  {
    objc_super v4 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    id v5 = [v4 extension];
    objc_super v6 = v5;
    if (v5)
    {
      v7 = [v5 infoDictionary];
      objc_super v8 = [v7 objectForKeyedSubscript:kCFBundleIdentifierKey];
      if (v8
        && (-[MSMessageExtensionBrowserViewController _bundleIDsForSwipeGestureDisablement](self, "_bundleIDsForSwipeGestureDisablement"), __int16 v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 containsObject:v8], v9, v10))
      {
        unsigned int v3 = [(MSMessageExtensionBrowserViewController *)self linkedBeforeDawn] ^ 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_bundleIDsForSwipeGestureDisablement
{
  if (qword_46F08 != -1) {
    dispatch_once(&qword_46F08, &stru_3CE10);
  }
  v2 = (void *)qword_46F00;

  return v2;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self extension];

  if (v5)
  {
    objc_super v6 = [(MSMessageExtensionBrowserViewController *)self extension];
    v7 = [v6 _extensionContextForUUID:self->_sessionUUID];
    objc_super v8 = [v7 _auxiliaryConnection];
    __int16 v9 = [v8 valueForEntitlement:v4];

    if (v9)
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

  return isKindOfClass & 1;
}

- (BOOL)isLoaded
{
  if (self->_sessionUUID) {
    return 1;
  }
  id v4 = [(MSMessageExtensionBrowserViewController *)self extension];
  if (v4) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = self->_remoteViewController != 0;
  }

  return v2;
}

- (void)_postCurrentPluginBrowserViewDidPrepareForDisplay
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DBF8;
  block[3] = &unk_3C9E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadRemoteViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = IMLogHandleForCategory();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  objc_super v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "extensionLoading", (const char *)&unk_3803B, buf, 2u);
  }

  unsigned __int8 v9 = [(MSMessageExtensionBrowserViewController *)self isInDeferredTeardown];
  unsigned int v10 = self->_remoteViewController;
  v11 = ms_defaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = self;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "loadRemoteView %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_DEDC;
  v15[3] = &unk_3CE38;
  v16 = v10;
  v17 = self;
  unsigned __int8 v21 = v9;
  v18 = v8;
  id v19 = v4;
  os_signpost_id_t v20 = v6;
  v12 = v8;
  id v13 = v4;
  v14 = v10;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeeded:v15];
}

- (void)unloadRemoteView
{
  unsigned int v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "unloadRemoteView %@", (uint8_t *)&v4, 0xCu);
  }

  [(MSMessageExtensionBrowserViewController *)self _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
}

- (BOOL)mayBeKeptInViewHierarchy
{
  unsigned int v3 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  int v4 = [v3 proxy];

  uint64_t v5 = [v4 objectForInfoDictionaryKey:@"NSCameraUsageDescription" ofClass:objc_opt_class() inScope:0];

  uint64_t v6 = [v4 objectForInfoDictionaryKey:@"NSMicrophoneUsageDescription" ofClass:objc_opt_class() inScope:0];
  uint64_t v7 = v5 | v6;

  unsigned __int8 v8 = [(MSMessageExtensionBrowserViewController *)self inFullScreenModalPresentation];
  if (v7) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)setBalloonPluginDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self balloonPluginDataSource];
  id v6 = v4;
  if (v5 != v6)
  {
    [v5 setDelegate:0];
    [v6 setDelegate:self];
    uint64_t v7 = [v6 message];
    message = self->_message;
    self->_message = v7;

    v11.receiver = self;
    v11.super_class = (Class)MSMessageExtensionBrowserViewController;
    [(MSMessageExtensionBrowserViewController *)&v11 setBalloonPluginDataSource:v6];
    BOOL v9 = [(MSMessageExtensionBrowserViewController *)self currentConversationState];
    unsigned int v10 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
    [v10 _conversationDidChangeWithConversationState:v9];

    [(MSMessageExtensionBrowserViewController *)self _markCurrentMessageAsPlayedIfNeeded];
  }
}

- (BOOL)canReplaceDataSource
{
  return 1;
}

- (void)_removeRemoteViewControllerAndCancelExtensionRequestIfNeeded
{
  unsigned int v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSNumber numberWithUnsignedInteger:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]];
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_removeRemoteViewControllerAndCancelExtensionRequestIfNeeded current request count %@", buf, 0xCu);
  }
  if ([(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]) {
    [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestCount:(char *)[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]- 1];
  }
  if (![(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E43C;
    block[3] = &unk_3C9E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_cancelExtensionRequest
{
  if (self->_sessionUUID)
  {
    unsigned int v3 = [(MSMessageExtensionBrowserViewController *)self extension];
    [v3 cancelExtensionRequestWithIdentifier:self->_sessionUUID];

    id v4 = ms_defaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, " cancelled extension request for extension %@", (uint8_t *)&v6, 0xCu);
    }

    p_super = &self->_sessionUUID->super;
    self->_sessionUUID = 0;
  }
  else
  {
    p_super = ms_defaultLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, " no _sessionUUID could not cancel %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)deferredForceTearDownRemoteView
{
  if (![(MSMessageExtensionBrowserViewController *)self isInDeferredTeardown]
    && ![(MSMessageExtensionBrowserViewController *)self isWaitingForReply])
  {
    [(MSMessageExtensionBrowserViewController *)self setIsInDeferredTeardown:1];
    unsigned int v3 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
    [v3 _hostDidBeginDeferredTeardown];

    im_dispatch_after();
  }
}

- (void)dropAssertion
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self extension];
  [v2 _dropAssertion];
}

- (void)killExtensionProcess
{
  unsigned int v3 = +[CKPluginExtensionStateObserver sharedInstance];
  unsigned int v4 = [v3 passKitUIPresented];

  if (v4)
  {
    id v5 = ms_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v11 = self;
      int v6 = "self %@ killExtensionProcess not doing  work as we are suspending due to passkit UI";
LABEL_7:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v7 = +[CKPluginExtensionStateObserver sharedInstance];
  unsigned int v8 = [v7 iTunesStoreDialogPresented];

  if (v8)
  {
    id v5 = ms_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v11 = self;
      int v6 = "self %@ killExtensionProcess not  suspend work as we are suspending due to iTunesStore UI";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    id v9 = [(MSMessageExtensionBrowserViewController *)self extension];
    [v9 _kill:9];
  }
}

- (BOOL)isAlive
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSMessageExtensionBrowserViewController;
  -[MSMessageExtensionBrowserViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (a3) {
    [(MSMessageExtensionBrowserViewController *)self setIsInDeferredTeardown:0];
  }
}

- (BOOL)prefersStatusBarHidden
{
  BOOL v3 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  unsigned int v4 = [v3 identifier];
  objc_super v5 = IMBalloonExtensionIDWithSuffix();
  unsigned int v6 = [v4 isEqualToString:v5];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];

  if (v7)
  {
    unsigned int v8 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
    unsigned __int8 v9 = [v8 prefersStatusBarHidden];

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MSMessageExtensionBrowserViewController;
    return [(MSMessageExtensionBrowserViewController *)&v11 prefersStatusBarHidden];
  }
}

- (void)forceTearDownRemoteView
{
}

- (void)forceTearDownRemoteViewOverridingExceptions:(BOOL)a3
{
  [(MSMessageExtensionBrowserViewController *)self setIsInDeferredTeardown:0];
  if (a3) {
    goto LABEL_2;
  }
  unsigned __int8 v21 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  uint64_t v22 = [v21 identifier];
  unsigned int v23 = [(id)v22 containsString:IMBalloonPluginIdentifierSurf];

  v24 = +[CKPluginExtensionStateObserver sharedInstance];
  LOBYTE(v22) = [v24 passKitUIPresented];

  if ((v22 & 1) != 0 || v23)
  {
    v27 = ms_defaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      v30 = self;
      v28 = "self %@ prepareForSuspend not doing suspend work as we are suspending due to passkit UI/ Apple Pay UI";
      goto LABEL_17;
    }
LABEL_18:

    return;
  }
  v25 = +[CKPluginExtensionStateObserver sharedInstance];
  unsigned int v26 = [v25 iTunesStoreDialogPresented];

  if (v26)
  {
    v27 = ms_defaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      v30 = self;
      v28 = "self %@ prepareForSuspend not doing suspend work as we are suspending due to iTunesStore UI";
LABEL_17:
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v29, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
LABEL_2:
  objc_super v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    remoteViewController = self->_remoteViewController;
    sessionUUID = self->_sessionUUID;
    unsigned int v8 = +[NSNumber numberWithUnsignedInteger:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]];
    int v29 = 138412802;
    v30 = (MSMessageExtensionBrowserViewController *)remoteViewController;
    __int16 v31 = 2112;
    v32 = sessionUUID;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "forceTearDownRemoteView current remoteViewController %@, sessionUUID %@, request count %@", (uint8_t *)&v29, 0x20u);
  }
  [(MSMessageExtensionBrowserViewController *)self _sendResignActiveMessage];
  [(MSMessageExtensionBrowserViewController *)self setIsWaitingForReply:0];
  unsigned __int8 v9 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];

  if (v9)
  {
    unsigned int v10 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
    [v10 removeFromParentViewController];

    objc_super v11 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
    v12 = [v11 view];
    [v12 removeFromSuperview];

    [(MSMessageExtensionBrowserViewController *)self setRemoteViewController:0];
  }
  [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestCount:0];
  id v13 = ms_traceLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_24D4C(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  [(MSMessageExtensionBrowserViewController *)self _cancelExtensionRequest];
  if (![(MSMessageExtensionBrowserViewController *)self mayBeKeptInViewHierarchy]) {
    [(MSMessageExtensionBrowserViewController *)self killExtensionProcess];
  }
}

- (void)prepareForDisplay
{
}

- (void)_addRemoteViewController
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    id v28 = [(UIViewController *)remoteViewController view];
    [v28 setAutoresizingMask:18];
    unsigned int v4 = [(MSMessageExtensionBrowserViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = [(UIViewController *)self->_remoteViewController view];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    uint64_t v14 = +[CKUIBehavior sharedBehaviors];
    uint64_t v15 = [v14 theme];
    uint64_t v16 = [v15 browserCardBackgroundColor];
    uint64_t v17 = [(MSMessageExtensionBrowserViewController *)self view];
    [v17 setBackgroundColor:v16];

    if (+[_MSPresentationState isRunningInCameraContext])
    {
      uint64_t v18 = [(MSMessageExtensionBrowserViewController *)self view];
      [v18 addSubview:v28];

      uint64_t v19 = +[UIColor secondarySystemBackgroundColor];
      uint64_t v20 = [(UIViewController *)self->_remoteViewController view];
      [v20 setBackgroundColor:v19];

      [(MSMessageExtensionBrowserViewController *)self addChildViewController:self->_remoteViewController];
      [(UIViewController *)self->_remoteViewController beginAppearanceTransition:1 animated:0];
    }
    else
    {
      uint64_t v22 = +[CKUIBehavior sharedBehaviors];
      unsigned int v23 = [v22 theme];
      v24 = [v23 browserCardBackgroundColor];
      v25 = [(UIViewController *)self->_remoteViewController view];
      [v25 setBackgroundColor:v24];

      [(MSMessageExtensionBrowserViewController *)self addChildViewController:self->_remoteViewController];
      [(UIViewController *)self->_remoteViewController beginAppearanceTransition:1 animated:0];
      unsigned int v26 = [(MSMessageExtensionBrowserViewController *)self view];
      [v26 addSubview:v28];
    }
    v27 = [(MSMessageExtensionBrowserViewController *)self view];
    [v27 setNeedsLayout];

    [(UIViewController *)self->_remoteViewController endAppearanceTransition];
    [(UIViewController *)self->_remoteViewController didMoveToParentViewController:self];
  }
  else
  {
    unsigned __int8 v21 = ms_defaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_24DC4(v21);
    }
  }
}

- (void)_removeRemoteViewController
{
  BOOL v3 = [(UIViewController *)self->_remoteViewController parentViewController];

  if (v3 == self)
  {
    [(UIViewController *)self->_remoteViewController beginAppearanceTransition:0 animated:0];
    id v4 = [(UIViewController *)self->_remoteViewController view];
    [v4 removeFromSuperview];
    [(UIViewController *)self->_remoteViewController removeFromParentViewController];
    [(UIViewController *)self->_remoteViewController endAppearanceTransition];
  }
}

- (void)_addRemoteViewControllerAndConfigureExtension
{
  BOOL v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    double v5 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_addRemoteViewControllerAndConfigureExtension %@", (uint8_t *)&v4, 0xCu);
  }

  [(MSMessageExtensionBrowserViewController *)self _sendBecomeActiveMessage];
  [(MSMessageExtensionBrowserViewController *)self _addRemoteViewController];
}

- (void)applicationDidEnterBackground:(id)a3
{
  if (CKIsRunningInMessages())
  {
    id v4 = +[BKSTouchDeliveryObservationService sharedInstance];
    [v4 removeObserver:self];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  if (CKIsRunningInMessages())
  {
    id v4 = +[BKSTouchDeliveryObservationService sharedInstance];
    [v4 addObserver:self];
  }
}

- (void)_handleExtensionInterruption:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:IMExtensionRemoteConnectionInterruptedBundleIdentifier];

  double v6 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  double v7 = [v6 identifier];
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    double v9 = ms_defaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      double v11 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBrowserViewController _handleExtensionInterruption for identifier %@", (uint8_t *)&v10, 0xCu);
    }

    [(MSMessageExtensionBrowserViewController *)self _cancelExtensionRequest];
    [(MSMessageExtensionBrowserViewController *)self setSessionUUID:0];
    [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestCount:0];
    [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestInFlight:0];
  }
}

- (id)_arrayForApplePlistKey:(id)a3
{
  id v4 = a3;
  double v5 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  double v6 = [v5 proxy];

  if (v6)
  {
    double v7 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    unsigned int v8 = [v7 proxy];
    id v9 = [v8 objectForInfoDictionaryKey:v4 ofClass:objc_opt_class() inScope:2];
  }
  else
  {
    int v10 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    double v11 = [v10 appBundle];
    double v7 = [v11 objectForInfoDictionaryKey:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v12 = v7;
    }
    else {
      double v12 = 0;
    }
    id v9 = v12;
  }

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = &__NSArray0__struct;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)shouldShowChatChrome
{
  return 1;
}

- (BOOL)wantsDarkUI
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  BOOL v3 = [v2 proxy];
  id v4 = [v3 objectForInfoDictionaryKey:@"MSMessagesOverlayAppearanceDark" ofClass:objc_opt_class() inScope:2];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)wantsOpaqueUI
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  BOOL v3 = [v2 proxy];
  id v4 = [v3 objectForInfoDictionaryKey:@"MSMessagesOverlayAppearanceOpaque" ofClass:objc_opt_class() inScope:2];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)shouldSuppressEntryView
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  BOOL v3 = [v2 proxy];
  id v4 = [v3 objectForInfoDictionaryKey:@"MSExpandedPresentationHidesComposeField" ofClass:objc_opt_class() inScope:2];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (unint64_t)sheetDetentStyle
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self _arrayForApplePlistKey:@"MSMessagesAppViewControllerSupportedPresentationStyles"];
  unsigned int v3 = [v2 containsObject:@"MSMessagesAppPresentationStyleCompact"];
  unsigned int v4 = [v2 containsObject:@"MSMessagesAppPresentationStyleExpanded"];
  uint64_t v5 = 2;
  if (v4 ^ 1 | v3) {
    uint64_t v5 = 0;
  }
  if (v3 ^ 1 | v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)requestSnapshotDataForPersistance
{
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_F880;
  __int16 v31 = sub_F890;
  id v32 = 0;
  unsigned int v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  unsigned __int8 v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  unsigned int v23 = sub_F898;
  v24 = &unk_3CE60;
  unsigned int v26 = &v27;
  unsigned int v4 = v3;
  v25 = v4;
  uint64_t v5 = objc_retainBlock(&v21);
  unint64_t v6 = ms_traceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_24E08(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v14 _requestSnapshotWithCompletion:v5];

  dispatch_time_t v15 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v4, v15))
  {
    uint64_t v16 = ms_defaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
      uint64_t v18 = [v17 identifier];
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Timed out generating snapshot for %@", buf, 0xCu);
    }
  }
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v19;
}

- (BOOL)allowAllPayloadCommits
{
  return [(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.BypassShelfAccess"];
}

- (id)cancelTouchesInView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v3 = [(UIViewController *)self->_remoteViewController _cancelTouchesForCurrentEventInHostedContent];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (id)extension
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  unsigned int v3 = [v2 extension];

  return v3;
}

- (_MSMessageComposeExtensionProtocol)remoteProxy
{
  unsigned int v3 = [(MSMessageExtensionBrowserViewController *)self extension];

  if (v3)
  {
    unsigned int v4 = [(MSMessageExtensionBrowserViewController *)self extension];
    uint64_t v5 = [(UIViewController *)v4 _extensionContextForUUID:self->_sessionUUID];
    unint64_t v6 = [v5 _auxiliaryConnection];
    uint64_t v7 = [v6 remoteObjectProxy];
  }
  else
  {
    unsigned int v4 = self->_remoteViewController;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(UIViewController *)v4 appContext];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return (_MSMessageComposeExtensionProtocol *)v7;
}

- (void)_callAndDequeueLoadCompletionBlocks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCompletionBlockArray];
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
    uint64_t v8 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412802;
    unsigned __int8 v21 = v7;
    __int16 v22 = 2112;
    unsigned int v23 = v8;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Will dequeue %@ blocks with result %@ %@", buf, 0x20u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCompletionBlockArray];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v13) + 16))();
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  id v14 = [(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCompletionBlockArray];
  [v14 removeAllObjects];
}

- (void)_sendInstantiationRequestToExtensionWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IMLogHandleForCategory();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "extensionLoading", (const char *)&unk_3803B, buf, 2u);
  }

  uint64_t v9 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v10 = [v9 extension];
  if (v10)
  {
    id v37 = v4;
    id v11 = objc_alloc_init((Class)NSExtensionItem);
    int v12 = CKIsRunningInCameraAppsClient();
    int v13 = CKIsRunningInUserGeneratedStickersExtension();
    [(MSMessageExtensionBrowserViewController *)self preferredContentSize];
    if (v15 == CGSizeZero.width && v14 == CGSizeZero.height)
    {
      unsigned int v23 = [(MSMessageExtensionBrowserViewController *)self view];
      [v23 bounds];
      double x = v24;
      double y = v25;
      double v20 = v26;
      double v22 = v27;
    }
    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      [(MSMessageExtensionBrowserViewController *)self preferredContentSize];
      double v20 = v19;
      double v22 = v21;
    }
    v40[0] = _MSExtensionItemHostViewBoundsKey;
    id v28 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v20, v22);
    v41[0] = v28;
    v40[1] = _MSExtensionContextIsPrimary;
    unsigned int v29 = [(MSMessageExtensionBrowserViewController *)self isPrimaryViewController];
    v30 = &off_3E068;
    if (v29) {
      __int16 v31 = &off_3E050;
    }
    else {
      __int16 v31 = &off_3E068;
    }
    if (v12) {
      id v32 = &off_3E050;
    }
    else {
      id v32 = &off_3E068;
    }
    v41[1] = v31;
    v41[2] = v32;
    v40[2] = _MSExtensionItemContextIsMessagesCameraKey;
    v40[3] = _MSExtensionItemContextIsUserGeneratedStickerKey;
    if (v13) {
      v30 = &off_3E050;
    }
    v41[3] = v30;
    __int16 v33 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
    [v11 setUserInfo:v33];

    id v39 = v11;
    v34 = +[NSArray arrayWithObjects:&v39 count:1];
    id v4 = v37;
    [v10 instantiateViewControllerWithInputItems:v34 listenerEndpoint:0 connectionHandler:v37];
  }
  v35 = v8;
  v36 = v35;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v36, OS_SIGNPOST_INTERVAL_END, v6, "extensionLoading", (const char *)&unk_3803B, buf, 2u);
  }
}

- (void)_instantiateRemoteViewControllerIfNeeded:(id)a3
{
}

- (void)_instantiateRemoteViewControllerIfNeededWithIntent:(int64_t)a3 completion:(id)a4
{
  os_signpost_id_t v6 = (void (**)(id, uint64_t))a4;
  [(MSMessageExtensionBrowserViewController *)self setIsInDeferredTeardown:0];
  uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self extension];

  if (!v7)
  {
    if (self->_remoteViewController)
    {
      if (v6) {
        v6[2](v6, 1);
      }
    }
    else
    {
      __int16 v31 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
      id v32 = [v31 appBundle];
      id v33 = objc_alloc_init((Class)[v32 principalClass]);

      id v34 = [objc_alloc((Class)_MSMessageAppBundleContext) initWithViewController:v33 wantsLiveView:0];
      [(MSMessageExtensionBrowserViewController *)self setAppContext:v34];
      id v35 = [objc_alloc((Class)_MSMessageAppContext) initWithAppContext:v34];
      [v33 setAppContext:v35];

      id v36 = [objc_alloc((Class)_MSMessageAppBundleHostContext) initWithAppContext:0];
      [v36 setDelegate:self];
      [v34 setHostContext:v36];
      [(MSMessageExtensionBrowserViewController *)self setRemoteViewController:v33];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_105DC;
      block[3] = &unk_3CD58;
      block[4] = self;
      v47 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    goto LABEL_40;
  }
  uint64_t v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]];
    id v10 = objc_retainBlock(v6);
    id v11 = +[NSNumber numberWithBool:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestInFlight]];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v49 = 2112;
    CFStringRef v50 = (const __CFString *)v10;
    __int16 v51 = 2112;
    v52 = self;
    __int16 v53 = 2112;
    v54 = v11;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_instantiateRemoteViewController. Current request count %@, block %@ self %@ request in flight %@", buf, 0x2Au);
  }
  [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestCount:(char *)[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount] + 1];
  if ((char *)[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount] == (char *)&dword_0 + 1) {
    unsigned int v12 = ![(MSMessageExtensionBrowserViewController *)self extensionLoadRequestInFlight];
  }
  else {
    unsigned int v12 = 0;
  }
  if ([(MSMessageExtensionBrowserViewController *)self extensionLoadRequestInFlight])
  {
    if (v6) {
      goto LABEL_12;
    }
LABEL_26:
    if ((v12 & 1) == 0)
    {
      id v37 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
      [v37 beginAppearanceTransition:1 animated:1];

      v38 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
      [v38 endAppearanceTransition];

      char v19 = 0;
      if (!v6) {
        goto LABEL_40;
      }
      goto LABEL_36;
    }
    char v19 = 0;
LABEL_28:
    double v21 = ms_defaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "_instantiateRemoteViewController. Instantiating remote VC  %@", buf, 0xCu);
    }

    [(MSMessageExtensionBrowserViewController *)self setExtensionLoadRequestInFlight:1];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    double v22 = ms_traceLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_24E80(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_10634;
    v44 = &unk_3CEB0;
    objc_copyWeak(v45, (id *)buf);
    v45[1] = (id)a3;
    v30 = objc_retainBlock(&v41);
    -[MSMessageExtensionBrowserViewController _sendInstantiationRequestToExtensionWithHandler:](self, "_sendInstantiationRequestToExtensionWithHandler:", v30, v41, v42, v43, v44);

    objc_destroyWeak(v45);
    objc_destroyWeak((id *)buf);
    if (!v6) {
      goto LABEL_40;
    }
LABEL_36:
    if ((v19 & 1) == 0)
    {
      id v39 = ms_defaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = +[NSNumber numberWithUnsignedInteger:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v40;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Calling block immediately. Updated Request count %@", buf, 0xCu);
      }
      v6[2](v6, 1);
    }
    goto LABEL_40;
  }
  if (v6) {
    char v20 = v12;
  }
  else {
    char v20 = 0;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_12:
  int v13 = ms_defaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = +[NSNumber numberWithUnsignedInteger:[(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCount]];
    if (v12) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    if ([(MSMessageExtensionBrowserViewController *)self extensionLoadRequestInFlight]) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v49 = 2112;
    CFStringRef v50 = v15;
    __int16 v51 = 2112;
    v52 = (MSMessageExtensionBrowserViewController *)v16;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Request in flight or we will try loading extension. Queueing block in array. Updated Request count %@, shouldLoadExtension %@, extension request in flight %@", buf, 0x20u);
  }
  long long v17 = [(MSMessageExtensionBrowserViewController *)self extensionLoadRequestCompletionBlockArray];
  id v18 = [v6 copy];
  [v17 addObject:v18];

  if (v12)
  {
    char v19 = 1;
    goto LABEL_28;
  }
LABEL_40:
}

- (void)beginSuppressingAppearanceMethods
{
  BOOL v3 = ms_traceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_24EF8(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  [(MSMessageExtensionBrowserViewController *)self setShouldAutomaticallyForwardAppearanceMethods:0];
}

- (void)endSuppressingAppearanceMethods
{
  BOOL v3 = ms_traceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_24F70(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  [(MSMessageExtensionBrowserViewController *)self setShouldAutomaticallyForwardAppearanceMethods:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_24FE8();
  }

  v6.receiver = self;
  v6.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v6 viewWillAppear:v3];
}

- (void)showSnapshotForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(MSMessageExtensionBrowserViewController *)self shouldDisableSnapshotView] & 1) == 0)
  {
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self view];
      [v7 bounds];
      double width = v8;
      double height = v9;
    }
    [(MSMessageExtensionBrowserViewController *)self removeSnapshot];
    uint64_t v10 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    id v11 = [v10 identifier];
    unsigned int v12 = [(MSMessageExtensionBrowserViewController *)self view];
    int v13 = [v12 traitCollection];
    +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v11, [v13 userInterfaceStyle], CGPointZero.x, CGPointZero.y, width, height);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    double v14 = +[CKBalloonPluginManager sharedInstance];
    CFStringRef v15 = [v14 browserSnapshotForKey:v19];
    [(MSMessageExtensionBrowserViewController *)self setSnapshotView:v15];

    CFStringRef v16 = [(MSMessageExtensionBrowserViewController *)self snapshotView];

    if (v16)
    {
      long long v17 = [(MSMessageExtensionBrowserViewController *)self view];
      id v18 = [(MSMessageExtensionBrowserViewController *)self snapshotView];
      [v17 insertSubview:v18 atIndex:0];
    }
  }
}

- (void)removeSnapshot
{
  BOOL v3 = [(MSMessageExtensionBrowserViewController *)self snapshotView];
  [v3 removeFromSuperview];

  [(MSMessageExtensionBrowserViewController *)self setSnapshotView:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_250B0();
  }

  v6.receiver = self;
  v6.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_25178();
  }

  v6.receiver = self;
  v6.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v6 viewWillDisappear:v3];
  if (CKIsRunningInMacCatalyst())
  {
    if ([(MSMessageExtensionBrowserViewController *)self isBeingDismissed]) {
      [(MSMessageExtensionBrowserViewController *)self saveSnapshotForBrowserViewController];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_25240();
  }

  v6.receiver = self;
  v6.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v6 viewDidDisappear:v3];
}

- (void)browserScrolledOnScreen
{
  BOOL v3 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
  if (v3)
  {
    id v9 = v3;
    uint64_t v4 = [v3 parentViewController];

    BOOL v3 = v9;
    if (v4 != self)
    {
      [(MSMessageExtensionBrowserViewController *)self _addRemoteViewController];
      uint64_t v5 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
      objc_super v6 = [v5 view];
      [v6 setNeedsLayout];

      uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
      double v8 = [v7 view];
      [v8 layoutIfNeeded];

      BOOL v3 = v9;
    }
  }
}

- (void)browserScrolledOffScreen
{
  if (![(MSMessageExtensionBrowserViewController *)self isInDeferredTeardown])
  {
    BOOL v3 = [(MSMessageExtensionBrowserViewController *)self remoteViewController];
    uint64_t v4 = [v3 parentViewController];

    if (v4 == self)
    {
      [(MSMessageExtensionBrowserViewController *)self _removeRemoteViewController];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)MSMessageExtensionBrowserViewController;
  -[MSMessageExtensionBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4);
  if (CKIsRunningInMacCatalyst()) {
    -[MSMessageExtensionBrowserViewController showSnapshotForSize:](self, "showSnapshotForSize:", width, height);
  }
}

- (void)viewWillTransitionToExpandedPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v5 viewWillTransitionToExpandedPresentation];
  id v3 = objc_alloc_init((Class)_MSPresentationState);
  [v3 setPresentationStyle:1];
  uint64_t v4 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v4 _presentationWillChangeToPresentationState:v3];
}

- (void)viewDidTransitionToExpandedPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v5 viewDidTransitionToExpandedPresentation];
  id v3 = objc_alloc_init((Class)_MSPresentationState);
  [v3 setPresentationStyle:1];
  uint64_t v4 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v4 _presentationDidChangeToPresentationState:v3];
}

- (void)viewWillTransitionToCompactPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v5 viewWillTransitionToCompactPresentation];
  id v3 = objc_alloc_init((Class)_MSPresentationState);
  [v3 setPresentationStyle:0];
  uint64_t v4 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v4 _presentationWillChangeToPresentationState:v3];
}

- (void)viewDidTransitionToCompactPresentation
{
  v8.receiver = self;
  v8.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v8 viewDidTransitionToCompactPresentation];
  id v3 = objc_alloc_init((Class)_MSPresentationState);
  [v3 setPresentationStyle:0];
  if (objc_opt_respondsToSelector())
  {
    remoteViewController = self->_remoteViewController;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_115DC;
    v6[3] = &unk_3CAD8;
    v6[4] = self;
    id v7 = v3;
    [(UIViewController *)remoteViewController synchronizeAnimationsInActions:v6];
  }
  else
  {
    objc_super v5 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
    [v5 _presentationDidChangeToPresentationState:v3];
  }
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v13 viewWillLayoutSubviews];
  id v3 = [(MSMessageExtensionBrowserViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  unsigned int v12 = [(UIViewController *)self->_remoteViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MSMessageExtensionBrowserViewController;
  [(MSMessageExtensionBrowserViewController *)&v2 didReceiveMemoryWarning];
}

- (id)iMessageLoginID
{
  objc_super v2 = +[IMAccountController sharedInstance];
  id v3 = +[IMServiceImpl iMessageService];
  double v4 = [v2 operationalAccountsForService:v3];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    double v9 = 0;
    goto LABEL_15;
  }
  id v7 = v6;
  double v8 = 0;
  double v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      unsigned int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v12, "accountType", (void)v18) == (char *)&dword_0 + 2)
      {
        objc_super v13 = v9;
        double v14 = v8;
        double v9 = v12;
      }
      else
      {
        objc_super v13 = v8;
        double v14 = v12;
        if ([v12 accountType] != (char *)&dword_0 + 1) {
          continue;
        }
      }
      id v15 = v12;

      double v8 = v14;
    }
    id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (v8)
  {
    CFStringRef v16 = [v8 strippedLogin];
    goto LABEL_16;
  }
LABEL_15:
  CFStringRef v16 = objc_msgSend(v9, "strippedLogin", (void)v18);
  double v8 = 0;
LABEL_16:

  return v16;
}

- (id)currentConversationState
{
  id v3 = objc_alloc_init((Class)_MSConversationState);
  uint64_t v4 = [(MSMessageExtensionBrowserViewController *)self conversationID];
  id v5 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v6 = [v5 identifier];

  id v7 = +[IMBalloonPluginManager sharedInstance];
  double v8 = [v7 conversationID:v4 appID:v6];
  [v3 setConversationIdentifier:v8];

  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowConversationIdentifierAccess"])
  {
    double v9 = [(MSMessageExtensionBrowserViewController *)self conversationID];
    [v3 setConversationID:v9];

    uint64_t v10 = [(MSMessageExtensionBrowserViewController *)self conversationEngramID];
    [v3 setConversationEngramID:v10];

    objc_msgSend(v3, "setIsiMessage:", -[MSMessageExtensionBrowserViewController isiMessage](self, "isiMessage"));
    double v11 = +[CKConversationList sharedConversationList];
    unsigned int v12 = [v11 conversationForExistingChatWithGUID:v4];

    objc_super v13 = [v12 chat];
    double v14 = [v13 groupID];
    [v3 setGroupID:v14];

    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v3, "setIsBusiness:", -[MSMessageExtensionBrowserViewController isBusiness](self, "isBusiness"));
    }
    id v15 = ms_defaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if ([v3 isiMessage]) {
        CFStringRef v16 = @"YES";
      }
      else {
        CFStringRef v16 = @"NO";
      }
      if ([v3 isBusiness]) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v45 = v16;
      __int16 v46 = 2112;
      CFStringRef v47 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBrowserViewController. Entitled for conversation identifiers. Configured conversationState with isiMessage: %@, isBusiness: %@.", buf, 0x16u);
    }
  }
  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowParticipantAddressAccess"])
  {
    long long v18 = [(MSMessageExtensionBrowserViewController *)self iMessageLoginID];
    [v3 setiMessageLoginID:v18];

    long long v19 = [(MSMessageExtensionBrowserViewController *)self sender];
    [v3 setSenderAddress:v19];

    long long v20 = [(MSMessageExtensionBrowserViewController *)self recipients];
    [v3 setRecipientAddresses:v20];
  }
  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowConversationContextAccess"])
  {
    long long v21 = [(MSMessageExtensionBrowserViewController *)self generativeContext];
    [v3 setConversationContext:v21];

    double v22 = [(MSMessageExtensionBrowserViewController *)self generatedSummary];
    [v3 setGeneratedSummary:v22];
  }
  uint64_t v23 = +[IMBalloonPluginManager sharedInstance];
  id v37 = (void *)v4;
  uint64_t v24 = [v23 localParticipantIdentifierForAppID:v6 conversationID:v4];
  v38 = v3;
  [v3 setSenderIdentifier:v24];

  uint64_t v25 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v26 = [(MSMessageExtensionBrowserViewController *)self recipients];
  id v27 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v32 = +[IMBalloonPluginManager sharedInstance];
        id v33 = [v32 recipientIDForRecipient:v31 appID:v6];

        [v25 addObject:v33];
      }
      id v28 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v28);
  }

  id v34 = [v25 copy];
  [v38 setRecipientIdentifiers:v34];

  id v35 = [(MSMessage *)self->_message copy];
  [(MSMessageExtensionBrowserViewController *)self _configureMessage:v35 withConversation:v38];

  [v38 setActiveMessage:self->_message];

  return v38;
}

- (void)_markCurrentMessageAsPlayedIfNeeded
{
  id v6 = [(MSMessageExtensionBrowserViewController *)self message];
  if ([v6 shouldExpire])
  {
    if (([v6 isFromMe] & 1) == 0)
    {
      id v3 = [(MSMessageExtensionBrowserViewController *)self balloonPluginDataSource];
      unsigned __int8 v4 = [v3 isPlayed];

      if ((v4 & 1) == 0)
      {
        id v5 = [(MSMessageExtensionBrowserViewController *)self balloonPluginDataSource];
        [v5 markAsPlayed];
      }
    }
  }
}

- (unint64_t)presentationStyle
{
  if ([(MSMessageExtensionBrowserViewController *)self inExpandedPresentation]) {
    return 1;
  }
  if ([(MSMessageExtensionBrowserViewController *)self inFullScreenModalPresentation])return 3; {
  return 0;
  }
}

- (void)_configureMessage:(id)a3 withConversation:(id)a4
{
  id v10 = a3;
  if ([v10 isFromMe])
  {
    id v5 = +[IMBalloonPluginManager sharedInstance];
    id v6 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    id v7 = [v6 identifier];
    double v8 = [(MSMessageExtensionBrowserViewController *)self conversationID];
    double v9 = [v5 localParticipantIdentifierForAppID:v7 conversationID:v8];
    [v10 setSenderParticipantIdentifier:v9];
  }
  [v10 _sanitize];
}

- (void)_sendBecomeActiveMessage
{
  id v3 = [(MSMessageExtensionBrowserViewController *)self currentConversationState];
  [(MSMessageExtensionBrowserViewController *)self appendDraftAssetArchivesIfNeeded:v3];
  id v4 = objc_alloc_init((Class)_MSPresentationState);
  objc_msgSend(v4, "setPresentationStyle:", -[MSMessageExtensionBrowserViewController presentationStyle](self, "presentationStyle"));
  id v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_25308(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  objc_super v13 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v13 _becomeActiveWithConversationState:v3 presentationState:v4];

  [(MSMessageExtensionBrowserViewController *)self _markCurrentMessageAsPlayedIfNeeded];
}

- (void)_sendResignActiveMessage
{
  id v3 = ms_traceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_25380(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v11 _resignActive];
}

- (void)saveSnapshotForBrowserViewController
{
  id v3 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v4 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(MSMessageExtensionBrowserViewController *)self view];
  uint64_t v7 = [v6 traitCollection];
  id v8 = [(id)v7 userInterfaceStyle];
  uint64_t v9 = [(MSMessageExtensionBrowserViewController *)self view];
  [v9 bounds];
  uint64_t v10 = +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v5, v8);

  id v11 = objc_alloc_init((Class)IMTimingCollection);
  [v11 startTimingForKey:@"_saveSnapshotForBrowserViewController:"];
  uint64_t v12 = [v3 snapshotCache];
  objc_super v13 = [v10 stringValue];
  LOBYTE(v7) = [v12 isGeneratingPreviewForKey:v13];

  if ((v7 & 1) == 0)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = sub_F880;
    v26[4] = sub_F890;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_F880;
    v24[4] = sub_F890;
    id v25 = 0;
    double v14 = [v3 snapshotCache];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_123D8;
    v23[3] = &unk_3CF00;
    v23[4] = self;
    v23[5] = v26;
    v23[6] = v24;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_12548;
    v18[3] = &unk_3CF50;
    id v19 = v3;
    long long v21 = v24;
    id v20 = v10;
    double v22 = v26;
    id v15 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    CFStringRef v16 = [v15 identifier];
    [v14 enqueueGenerationBlock:v23 completion:v18 withPriority:-1 forKey:v16];

    [v11 stopTimingForKey:@"_saveSnapshotForBrowserViewController:"];
    CFStringRef v17 = ms_traceLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_253F8();
    }

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
}

+ (void)invalidateSnapshotForKey:(id)a3
{
  id v3 = [a3 stringValue];
  uint64_t v4 = CKBrowserSnapshotPreviewURL();

  uint64_t v5 = +[NSFileManager defaultManager];
  uint64_t v6 = 0;
  [v5 removeItemAtURL:v4 error:&v6];
}

- (id)substituteNameInString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self substituteNameInString:v4 withAppID:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)substituteNameInString:(id)a3 withAppID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v43 = v6;
    uint64_t v9 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v10 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    id v11 = [(MSMessageExtensionBrowserViewController *)self sender];

    if (v11)
    {
      if (v10)
      {
        uint64_t v12 = [(MSMessageExtensionBrowserViewController *)self sender];

        if (v12)
        {
          objc_super v13 = [(MSMessageExtensionBrowserViewController *)self sender];
          CFArrayAppendValue(v10, v13);
        }
      }
      if (v9)
      {
        double v14 = +[IMBalloonPluginManager sharedInstance];
        id v15 = [(MSMessageExtensionBrowserViewController *)self conversationID];
        CFStringRef v16 = [v14 localParticipantIdentifierForAppID:v8 conversationID:v15];
        CFStringRef v17 = [v16 UUIDString];

        if (v17)
        {
          long long v18 = +[IMBalloonPluginManager sharedInstance];
          id v19 = [(MSMessageExtensionBrowserViewController *)self conversationID];
          id v20 = [v18 localParticipantIdentifierForAppID:v8 conversationID:v19];
          long long v21 = [v20 UUIDString];
          CFArrayAppendValue(v9, v21);
        }
      }
    }
    v44 = v8;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v42 = self;
    double v22 = [(MSMessageExtensionBrowserViewController *)self recipients];
    id v23 = [v22 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(const void **)(*((void *)&v45 + 1) + 8 * i);
          id v28 = +[IMBalloonPluginManager sharedInstance];
          uint64_t v29 = [v28 recipientIDForRecipient:v27 appID:v44];
          v30 = [v29 UUIDString];

          if (v9 && v30) {
            CFArrayAppendValue(v9, v30);
          }
          if (v10 && v27) {
            CFArrayAppendValue(v10, v27);
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v24);
    }

    id v31 = [(__CFArray *)v9 count];
    if (v31 == [(__CFArray *)v10 count])
    {
      id v32 = [v43 mutableCopy];
      if ([(__CFArray *)v9 count])
      {
        unint64_t v33 = 0;
        do
        {
          id v34 = [(__CFArray *)v10 objectAtIndexedSubscript:v33];
          id v35 = +[NSString stringWithFormat:@"$(%@)", v34];

          id v36 = [(__CFArray *)v9 objectAtIndexedSubscript:v33];
          id v37 = [@"$" stringByAppendingString:v36];

          -[NSObject replaceOccurrencesOfString:withString:options:range:](v32, "replaceOccurrencesOfString:withString:options:range:", v37, v35, 2, 0, [v32 length]);
          ++v33;
        }
        while ((unint64_t)[(__CFArray *)v9 count] > v33);
      }
      id v38 = [v32 copy];
      id v6 = v43;
    }
    else
    {
      id v32 = ms_defaultLog();
      id v6 = v43;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        long long v40 = +[NSNumber numberWithUnsignedInteger:[(__CFArray *)v9 count]];
        long long v41 = +[NSNumber numberWithUnsignedInteger:[(__CFArray *)v10 count]];
        *(_DWORD *)buf = 138412802;
        CFStringRef v50 = v42;
        __int16 v51 = 2112;
        id v52 = v40;
        __int16 v53 = 2112;
        v54 = v41;
        _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "self %@ substituteNameInString [recipientIdentifiers count] %@ != [recipientName count] %@ ", buf, 0x20u);
      }
      id v38 = 0;
    }

    id v8 = v44;
  }
  else
  {
    ms_defaultLog();
    uint64_t v9 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v50 = self;
      __int16 v51 = 2112;
      id v52 = v6;
      __int16 v53 = 2112;
      v54 = v8;
      _os_log_error_impl(&dword_0, (os_log_t)v9, OS_LOG_TYPE_ERROR, "self %@ substituteNameInString invalid parameters string %@ appID %@", buf, 0x20u);
    }
    id v38 = 0;
  }

  return v38;
}

- (void)_openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowConversationIdentifierAccess"])
  {
    id v8 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
    uint64_t v9 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    uint64_t v10 = [v9 identifier];
    [v8 openURL:v6 pluginID:v10 completionHandler:v7];

    id v11 = ms_defaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Entitled App. Allowing opening all URLs", buf, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v12 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  unsigned int v13 = [v12 isLaunchProhibited];

  double v14 = ms_defaultLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Not entitled App. Allowing opening containing app", buf, 2u);
    }

    CFStringRef v16 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    CFStringRef v17 = [v16 appBundle];
    id v11 = [v17 bundleIdentifier];

    long long v18 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
    id v19 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
    id v20 = [v19 identifier];
    [v18 openURL:v6 applicationIdentifier:v11 pluginID:v20 completionHandler:v7];

    goto LABEL_12;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Not allowing openURL for launch prohibited app", buf, 2u);
  }

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12FA4;
    block[3] = &unk_3CA60;
    double v22 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v11 = v22;
LABEL_12:
  }
}

- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_13088;
  v11[3] = &unk_3CFA0;
  unsigned int v13 = self;
  id v14 = a5;
  id v12 = v8;
  BOOL v15 = a4;
  id v9 = v8;
  id v10 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (id)_itemPayloadFromMSMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v6 = [v5 adamID];

  id v7 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v8 = [v7 browserDisplayName];

  id v9 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  id v10 = [v9 canSendDataPayloads];

  id v11 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v12 = objc_msgSend(v11, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
  unsigned int v13 = +[MSMessageExtensionDataSource pluginPayloadFromMessagePayload:v4 appIconData:v12 appName:v8 adamID:v6 allowDataPayloads:v10];

  id v14 = [v4 session];

  BOOL v15 = [(MSMessageExtensionBrowserViewController *)self message];
  CFStringRef v16 = [v15 session];
  LODWORD(v12) = [v14 isEqual:v16];

  if (v12)
  {
    [v13 setUpdate:1];
    CFStringRef v17 = [(MSMessageExtensionBrowserViewController *)self balloonPluginDataSource];
    long long v18 = [v17 sessionGUID];
    [v13 setAssociatedMessageGUID:v18];
  }
  id v19 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v20 = [v19 attributionInfo];
  [v13 setAttributionInfo:v20];

  long long v21 = [v13 statusText];
  double v22 = [(MSMessageExtensionBrowserViewController *)self substituteNameInString:v21];
  [v13 setStatusText:v22];

  id v23 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v24 = [v23 identifier];
  [v13 setPluginBundleID:v24];

  return v13;
}

- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_139D4;
  v13[3] = &unk_3CFC8;
  BOOL v17 = a4;
  BOOL v15 = self;
  id v16 = a6;
  id v14 = v10;
  BOOL v18 = a5;
  id v11 = v16;
  id v12 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)_stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1444C;
  v11[3] = &unk_3CFA0;
  unsigned int v13 = self;
  id v14 = a5;
  BOOL v15 = a4;
  id v12 = v8;
  id v9 = v8;
  id v10 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)_startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_14768;
  v15[3] = &unk_3CFF0;
  void v15[4] = self;
  id v16 = a3;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  id v17 = a5;
  id v18 = a6;
  id v12 = v17;
  id v13 = v18;
  id v14 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
}

- (void)_stickerDruidDragStarted
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14AF0;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14C94;
  v5[3] = &unk_3CAD8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14ECC;
  block[3] = &unk_3CD80;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_requestPresentationStyle:(unint64_t)a3
{
  unint64_t v5 = [(MSMessageExtensionBrowserViewController *)self presentationStyle];
  if (v5 != 3)
  {
LABEL_6:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_150D0;
    block[3] = &unk_3D018;
    BOOL v13 = v5 == 3;
    void block[4] = self;
    void block[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
  id v6 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  id v7 = [v6 identifier];
  id v8 = IMBalloonExtensionIDWithSuffix();
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = ms_traceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_25598(v10);
    }

    goto LABEL_6;
  }
  id v11 = ms_defaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_255DC(v11);
  }
}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = ms_traceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_25698(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1536C;
  block[3] = &unk_3D040;
  void block[4] = self;
  *(CGFloat *)&void block[5] = width;
  *(CGFloat *)&void block[6] = height;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dismiss
{
}

- (void)_dismiss
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_154A8;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_dismissAndPresentPhotosApp
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_156A8;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15864;
    block[3] = &unk_3D068;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    id v18 = self;
    id v19 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(MSMessageExtensionBrowserViewController *)self hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_15ABC;
    v17[3] = &unk_3D090;
    id v18 = v12;
    id v19 = v13;
    id v20 = v14;
    id v23 = v16;
    id v21 = v15;
    CGFloat v22 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
  }
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15E1C;
  block[3] = &unk_3C9E8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateSnapshotForNextLaunch:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15EBC;
  v4[3] = &unk_3CAD8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_16314;
    v6[3] = &unk_3CD58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ms_traceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_25800(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  id v16 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
    [v18 _requestPresentationWithStickerType:v6 identifier:v7];
  }
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_16578;
  v4[3] = &unk_3CD58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)requestStickerExtensionMetadataDictionary:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_166A4;
  v4[3] = &unk_3CD58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)beginDisablingUserInteraction
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v2 beginDisablingUserInteraction];
}

- (void)endDisablingUserInteraction
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v2 endDisablingUserInteraction];
}

- (void)datasourcePayloadDidChange:(id)a3 updateFlags:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = [v6 message];
  objc_storeStrong((id *)&self->_message, v7);
  if ((v4 & 3) != 0)
  {
    uint64_t v8 = [(MSMessageExtensionBrowserViewController *)self currentConversationState];
    uint64_t v9 = ms_traceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_258F0(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    char v17 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
    id v18 = [v7 _sanitizedCopy];
    [v17 _didReceiveMessage:v18 conversationState:v8];
  }
}

- (void)messageAddedWithDataSource:(id)a3
{
  char v4 = [a3 pluginPayload];
  id v5 = +[MSMessageExtensionDataSource messagePayloadFromPluginPayload:v4];

  id v6 = [(MSMessageExtensionBrowserViewController *)self currentConversationState];
  id v7 = ms_traceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_25968(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v15 _didReceiveMessage:v5 conversationState:v6];

  [(MSMessageExtensionBrowserViewController *)self _markCurrentMessageAsPlayedIfNeeded];
}

- (void)dragManager:(id)a3 didBeginDraggingItem:(id)a4
{
  id v13 = a4;
  id v5 = [(MSMessageExtensionBrowserViewController *)self currentDragPayload];
  if (v5 == v13)
  {
    id v6 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    id v7 = [v6 identifier];

    uint64_t v8 = +[MSMessageExtensionUtilities isValidSticker:v13];
    if (!v8)
    {
      uint64_t v9 = [v13 convertToStickerWithExtensionIdentifier:v7];
      if (v9)
      {
        uint64_t v10 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          uint64_t v12 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
          [v12 didBeginDraggingSticker:v9];
        }
      }
    }
  }
}

- (BOOL)dragManager:(id)a3 shouldCancelDraggingForItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  return a6 == 3;
}

- (void)dragManager:(id)a3 didEndDraggingItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(MSMessageExtensionBrowserViewController *)self currentDragPayload];
  if (v12 == v10)
  {
    id v13 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
    uint64_t v14 = [v13 identifier];

    uint64_t v15 = +[MSMessageExtensionUtilities isValidSticker:v10];
    uint64_t v16 = [(MSMessageExtensionBrowserViewController *)self completionHandler];
    char v17 = (void (**)(void, void, void))v16;
    if (v15)
    {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v15);
    }
    else
    {
      if (a6 == 3)
      {
        id v18 = +[NSError errorWithDomain:@"MSMessageExtensionBrowserViewController" code:1 userInfo:0];
        ((void (**)(void, uint64_t, void *))v17)[2](v17, 1, v18);
      }
      else
      {
        id v18 = [v10 convertToStickerWithExtensionIdentifier:v14];
        id v19 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
        id v20 = [v21 draggedSticker];
        [v19 commitSticker:v18 withDragTarget:v11 draggedSticker:v20];

        v17[2](v17, 0, 0);
      }
    }
    [(MSMessageExtensionBrowserViewController *)self setCurrentDragPayload:0];
    [(MSMessageExtensionBrowserViewController *)self setCompletionHandler:0];
  }
}

- (BOOL)dragManager:(id)a3 canScaleItem:(id)a4
{
  return 1;
}

- (BOOL)dragManager:(id)a3 canRotateItem:(id)a4
{
  return 1;
}

- (BOOL)dragManager:(id)a3 canPeelItem:(id)a4
{
  return 1;
}

- (void)validatePayloadForSending:(id)a3 associatedText:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_16D9C;
  v11[3] = &unk_3D0E0;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeededWithIntent:2 completion:v11];
}

- (void)didStartSendingPluginPayload:(id)a3
{
  id v4 = a3;
  id v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "didStartSendingPluginPayload %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1728C;
  v7[3] = &unk_3D108;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeededWithIntent:2 completion:v7];
}

- (void)didCancelSendingPluginPayload:(id)a3
{
  id v4 = a3;
  id v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "didCancelSendingPluginPayload %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_174C4;
  v7[3] = &unk_3D108;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeededWithIntent:2 completion:v7];
}

- (void)didSelectGPAsset:(id)a3 recipeData:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_176D8;
  v11[3] = &unk_3D0E0;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeeded:v11];
}

- (void)handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ms_traceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_25B48(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_179F8;
  v27[3] = &unk_3D158;
  v27[4] = self;
  id v28 = v10;
  id v19 = v10;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_17A80;
  v23[3] = &unk_3D0E0;
  v23[4] = self;
  id v24 = v8;
  id v25 = v9;
  uint64_t v26 = objc_retainBlock(v27);
  id v20 = v26;
  id v21 = v9;
  id v22 = v8;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeeded:v23];
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = ms_traceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_25BC0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_17C40;
  v14[3] = &unk_3D158;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(MSMessageExtensionBrowserViewController *)self _instantiateRemoteViewControllerIfNeeded:v14];
}

- (void)volumeButtonPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v4 _volumeButtonPressed:v3];
}

- (void)loadProxyIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_17E38;
    v6[3] = &unk_3CDA8;
    uint64_t v7 = v4;
    [(MSMessageExtensionBrowserViewController *)self loadRemoteViewWithCompletion:v6];
  }
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17F08;
  v7[3] = &unk_3D180;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(MSMessageExtensionBrowserViewController *)v8 loadProxyIfNeededWithCompletion:v7];
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1801C;
  v7[3] = &unk_3D180;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(MSMessageExtensionBrowserViewController *)v8 loadProxyIfNeededWithCompletion:v7];
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18130;
  v7[3] = &unk_3D180;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(MSMessageExtensionBrowserViewController *)v8 loadProxyIfNeededWithCompletion:v7];
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1826C;
  v12[3] = &unk_3D1A8;
  id v13 = self;
  id v14 = a3;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v15 = a5;
  id v10 = v15;
  id v11 = v14;
  [(MSMessageExtensionBrowserViewController *)v13 loadProxyIfNeededWithCompletion:v12];
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_183B8;
  v14[3] = &unk_3D1D0;
  id v15 = self;
  id v16 = a3;
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  int64_t v22 = a5;
  id v17 = a6;
  id v12 = v17;
  id v13 = v16;
  [(MSMessageExtensionBrowserViewController *)v15 loadProxyIfNeededWithCompletion:v14];
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_18500;
  v12[3] = &unk_3D1A8;
  id v13 = self;
  id v14 = a3;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v15 = a5;
  id v10 = v15;
  id v11 = v14;
  [(MSMessageExtensionBrowserViewController *)v13 loadProxyIfNeededWithCompletion:v12];
}

- (void)_prepareForAddStickerFromSubjectLift
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_185C8;
  v2[3] = &unk_3C9E8;
  v2[4] = self;
  [(MSMessageExtensionBrowserViewController *)self loadProxyIfNeededWithCompletion:v2];
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_186A0;
  v4[3] = &unk_3CD58;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MSMessageExtensionBrowserViewController *)v5 loadProxyIfNeededWithCompletion:v4];
}

- (void)_didRemoveStickerPreview
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_18760;
  v2[3] = &unk_3C9E8;
  v2[4] = self;
  [(MSMessageExtensionBrowserViewController *)self loadProxyIfNeededWithCompletion:v2];
}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_18848;
  v6[3] = &unk_3D1F8;
  uint64_t v7 = self;
  id v8 = a3;
  double v9 = a4;
  id v5 = v8;
  [(MSMessageExtensionBrowserViewController *)v7 loadProxyIfNeededWithCompletion:v6];
}

- (void)_canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([(MSMessageExtensionBrowserViewController *)self _canCurrentPluginShowInBrowserPluginIdentifier:v8])
  {
    uint64_t v7 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
    [v7 canShowBrowserForPluginIdentifier:v8 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)_showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_18A04;
  v9[3] = &unk_3D220;
  v9[4] = self;
  id v10 = a3;
  id v11 = a5;
  unint64_t v12 = a4;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (BOOL)_canCurrentPluginShowInBrowserPluginIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  id v6 = [v5 identifier];

  id v7 = IMStickersExtensionIdentifier();
  id v8 = IMBalloonExtensionIDWithSuffix();

  if ([v6 isEqualToString:v8]
    && ([v4 isEqualToString:IMBalloonPluginIdentifierAppStore] & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = ms_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_25C38();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self touchTracker];
  [v5 checkForTouchWithCompletion:v4];
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  id v8 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  id v10 = [v8 extension];

  if ([v10 pidForRequestIdentifier:self->_sessionUUID] == a6)
  {
    BOOL v9 = [(MSMessageExtensionBrowserViewController *)self touchTracker];
    [v9 touchReceived];
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return self->_shouldAutomaticallyForwardAppearanceMethods;
}

- (void)setShouldAutomaticallyForwardAppearanceMethods:(BOOL)a3
{
  self->_shouldAutomaticallyForwardAppearanceMethods = a3;
}

- (id)conversationEngramID
{
  return self->_conversationEngramID;
}

- (void)setConversationEngramID:(id)a3
{
}

- (UIViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (id)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (id)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (id)generativeContext
{
  return self->_generativeContext;
}

- (void)setGenerativeContext:(id)a3
{
}

- (id)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (MSMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (_MSMessageComposeExtensionImplProtocol)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (_MSMessageMediaPayload)currentDragPayload
{
  return self->_currentDragPayload;
}

- (void)setCurrentDragPayload:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)extensionIsActive
{
  return self->_extensionIsActive;
}

- (void)setExtensionIsActive:(BOOL)a3
{
  self->_extensionIsActive = a3;
}

- (unint64_t)extensionLoadRequestCount
{
  return self->_extensionLoadRequestCount;
}

- (void)setExtensionLoadRequestCount:(unint64_t)a3
{
  self->_extensionLoadRequestCount = a3;
}

- (BOOL)extensionLoadRequestInFlight
{
  return self->_extensionLoadRequestInFlight;
}

- (void)setExtensionLoadRequestInFlight:(BOOL)a3
{
  self->_extensionLoadRequestInFlight = a3;
}

- (NSMutableArray)extensionLoadRequestCompletionBlockArray
{
  return self->_extensionLoadRequestCompletionBlockArray;
}

- (void)setExtensionLoadRequestCompletionBlockArray:(id)a3
{
}

- (BOOL)isInDeferredTeardown
{
  return self->_isInDeferredTeardown;
}

- (void)setIsInDeferredTeardown:(BOOL)a3
{
  self->_isInDeferredTeardown = a3;
}

- (BOOL)isWaitingForReply
{
  return self->_isWaitingForReply;
}

- (void)setIsWaitingForReply:(BOOL)a3
{
  self->_isWaitingForReplCGFloat y = a3;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (MSTouchTracker)touchTracker
{
  return self->_touchTracker;
}

- (void)setTouchTracker:(id)a3
{
}

- (BOOL)isShowingAssetExplorerShelf
{
  return self->_isShowingAssetExplorerShelf;
}

- (void)setIsShowingAssetExplorerShelf:(BOOL)a3
{
  self->_isShowingAssetExplorerShelf = a3;
}

- (UIViewController)assetExplorerShelfViewController
{
  return self->_assetExplorerShelfViewController;
}

- (void)setAssetExplorerShelfViewController:(id)a3
{
}

- (NSString)lastDraftConversationID
{
  return self->_lastDraftConversationID;
}

- (void)setLastDraftConversationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDraftConversationID, 0);
  objc_storeStrong((id *)&self->_assetExplorerShelfViewController, 0);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_extensionLoadRequestCompletionBlockArray, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentDragPayload, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_generativeContext, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_conversationEngramID, 0);

  objc_storeStrong((id *)&self->_assetExplorerTransport, 0);
}

- (BOOL)isPhotosExtensionBrowser
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v3 = [v2 identifier];
  id v4 = IMBalloonExtensionIDWithSuffix();
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)isGenerativePlaygroundExtension
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v3 = [v2 identifier];
  id v4 = IMBalloonExtensionIDWithSuffix();
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)extensionWantsDraftAssetArchives
{
  if ([(MSMessageExtensionBrowserViewController *)self isPhotosExtensionBrowser]) {
    return 1;
  }

  return [(MSMessageExtensionBrowserViewController *)self isGenerativePlaygroundExtension];
}

- (BOOL)isFromValidExtension
{
  uint64_t v3 = [(MSMessageExtensionBrowserViewController *)self balloonExtensionPlugin];
  id v4 = [(id)v3 identifier];

  uint64_t v5 = IMBalloonExtensionIDWithSuffix();
  LOBYTE(v3) = [v4 isEqualToString:v5];

  uint64_t v6 = IMBalloonExtensionIDWithSuffix();
  LOBYTE(v5) = [v4 isEqualToString:v6];

  id v7 = IMBalloonExtensionIDWithSuffix();
  LOBYTE(v6) = [v4 isEqualToString:v7];

  id v8 = IMBalloonExtensionIDWithSuffix();
  unsigned __int8 v9 = [v4 isEqualToString:v8];

  id v10 = IMBalloonExtensionIDWithSuffix();
  unsigned __int8 v11 = [v4 isEqualToString:v10];

  unint64_t v12 = IMBalloonExtensionIDWithSuffix();
  unsigned __int8 v13 = [v4 isEqualToString:v12];

  char v14 = v3 | v5 | v6 | v9 | v11 | v13 | [(MSMessageExtensionBrowserViewController *)self isGenerativePlaygroundExtension];
  id v15 = ms_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    if (v14) {
      CFStringRef v16 = @"YES";
    }
    int v18 = 138412546;
    CGFloat v19 = v4;
    __int16 v20 = 2112;
    CFStringRef v21 = v16;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "checking if it's valid for extension: [%@], result: [%@]", (uint8_t *)&v18, 0x16u);
  }

  return v14 & 1;
}

- (id)assetExplorerTransport
{
  assetExplorerTransport = self->_assetExplorerTransport;
  if (!assetExplorerTransport)
  {
    id v4 = (objc_class *)qword_46F40;
    if (!qword_46F40)
    {
      id v4 = (objc_class *)IMWeakLinkClass();
      qword_46F40 = (uint64_t)v4;
    }
    uint64_t v5 = objc_alloc_init(v4);
    [v5 setDelegate:self];
    [v5 registerChangeObserver:self context:MSAssetExplorerTransportContext];
    if CKIsRunningInMessagesViewService() && (objc_opt_respondsToSelector()) {
      [v5 setShouldHideReviewController:1];
    }
    uint64_t v6 = self->_assetExplorerTransport;
    self->_assetExplorerTransport = v5;

    assetExplorerTransport = self->_assetExplorerTransport;
  }

  return assetExplorerTransport;
}

- (void)appendDraftAssetArchivesIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(MSMessageExtensionBrowserViewController *)self extensionWantsDraftAssetArchives])
  {
    if ([(MSMessageExtensionBrowserViewController *)self isPhotosExtensionBrowser])
    {
      uint64_t v5 = [v4 conversationID];
      uint64_t v6 = [(MSMessageExtensionBrowserViewController *)self _configurePhotosDraftAssetArchivesWithConversationID:v5];
    }
    else
    {
      uint64_t v5 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
      id v7 = [v4 conversationID];
      uint64_t v6 = [v5 configurePhotosDraftAssetArchivesWithConversationID:v7];
    }
    if ([v6 count])
    {
      id v8 = ms_defaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        id v11 = [v6 count];
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Appended %tu drafts to initial conversation state", (uint8_t *)&v10, 0xCu);
      }

      [v4 setDraftAssetArchives:v6];
    }
    unsigned __int8 v9 = [v4 conversationID];
    [(MSMessageExtensionBrowserViewController *)self setLastDraftConversationID:v9];
  }
}

- (id)_configurePhotosDraftAssetArchivesWithConversationID:(id)a3
{
  id v21 = a3;
  if ([(MSMessageExtensionBrowserViewController *)self isPhotosExtensionBrowser])
  {
    id v4 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
    CGFloat v19 = [v4 orderedStagedIdentifiers];
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if ([v19 count])
    {
      uint64_t v6 = [(MSMessageExtensionBrowserViewController *)self lastDraftConversationID];
      if ([v6 length])
      {
        id v7 = [(MSMessageExtensionBrowserViewController *)self lastDraftConversationID];
        unsigned __int8 v8 = [v21 isEqualToString:v7];

        if ((v8 & 1) == 0)
        {
          [v4 unstagePackagesWithIdentifiers:v19 evictFiles:0];
LABEL_25:
          id v9 = objc_msgSend(v5, "copy", v19);

          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = -[NSObject stagedPackageForIdentifier:](v4, "stagedPackageForIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * i), v19);
          if (v14)
          {
            id v22 = 0;
            id v15 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v22];
            id v16 = v22;
            if (v16 && IMOSLoggingEnabled())
            {
              CGFloat v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v28 = v16;
                _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Asset Archive Error! %@", buf, 0xCu);
              }
            }
            [v5 addObject:v15];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }

    goto LABEL_25;
  }
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_25E7C(v4);
  }
  id v9 = &__NSArray0__struct;
LABEL_26:

  return v9;
}

- (id)fetchPluginPayloadsAndClear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  id v5 = [v4 orderedStagedIdentifiers];
  uint64_t v6 = [v4 orderedStagedPayloads];
  if (v3) {
    [v4 unstagePackagesWithIdentifiers:v5 evictFiles:0];
  }

  return v6;
}

- (void)restoreDraftStateFromPayload:(id)a3
{
  id v5 = [a3 attachments];
  if (v5)
  {
    id v4 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
    [v4 stagePersistedPayloads:v5];
  }
}

- (id)fetchPluginStagedIdentifiers
{
  id v2 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  BOOL v3 = [v2 orderedStagedIdentifiers];

  return v3;
}

- (void)clearPluginPackagesWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  [v5 unstagePackagesWithIdentifiers:v4 evictFiles:1];
}

- (void)clearAllStagedPluginPackages
{
  id v3 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  id v2 = [v3 orderedStagedIdentifiers];
  [v3 unstagePackagesWithIdentifiers:v2 evictFiles:1];
}

- (void)_stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_217B8;
  v9[3] = &unk_3CBA0;
  v9[4] = self;
  id v10 = a3;
  BOOL v12 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)stageAssetToTransportAndNotifySendDelegate:(id)a3
{
  id v8 = a3;
  id v4 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  [v4 stagePackage:v8];

  id v5 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v8 browserItemPayload];
    if (v6)
    {
      id v7 = [v8 identifier];
      [v5 didStageAssetArchive:v6 identifier:v7];
    }
  }
}

- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Call to _removeAssetArchiveWithIdentifier: %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21D90;
  block[3] = &unk_3D180;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_assetArchiveRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  [v5 _didRemoveAssetArchiveWithIdentifier:v4];
}

- (void)packageTransport:(id)a3 didUnstagePackageWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 eagerUploadCancelIdentifier:v5];
  }
  id v7 = [(MSMessageExtensionBrowserViewController *)self remoteProxy];
  id v8 = ms_defaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v11 = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "packageTransport:didUnstagePackageWithIdentifier: Signal %@ asset archive was removed with identifier: %@", (uint8_t *)&v11, 0x16u);
    }

    [v7 _didRemoveAssetArchiveWithIdentifier:v5];
  }
  else
  {
    if (v9)
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "packageTransport:didUnstagePackageWithIdentifier: Current browser is not this extension, asking send delegate to notify active browser of : %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
    [v10 notifyActiveBrowserAssetArchiveWasRemoved:v5];
  }
}

- (void)chatKitTransport:(id)a3 commitPayload:(id)a4
{
  id v5 = a4;
  id v6 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  [v6 commitPayload:v5];
}

- (id)workingDirForDraft
{
  id v3 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  id v4 = [(MSMessageExtensionBrowserViewController *)self balloonPlugin];
  id v5 = [v4 identifier];
  id v6 = [v3 workingDraftDirForPluginIdentifier:v5];

  return v6;
}

- (void)chatKitTransport:(id)a3 didUpdatePersistedURLsForPackageIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v9 payloadForIdentifier:v6];
    if (v7)
    {
      id v8 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 generatePreviewAndStoreInCacheForSendingPhotoFromPayload:v7];
      }
    }
  }
}

- (void)_transportStagingStateDidChange
{
  id v3 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  id v4 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
  id v5 = [v4 orderedStagedIdentifiers];

  id v6 = [v5 count];
  if ((uint64_t)v6 < 1)
  {
    if (!v6
      && [(MSMessageExtensionBrowserViewController *)self isShowingAssetExplorerShelf])
    {
      [v3 dismissEntryViewShelf];
      [(MSMessageExtensionBrowserViewController *)self setAssetExplorerShelfViewController:0];
      [(MSMessageExtensionBrowserViewController *)self setIsShowingAssetExplorerShelf:0];
    }
  }
  else if (![(MSMessageExtensionBrowserViewController *)self isShowingAssetExplorerShelf])
  {
    id v7 = (objc_class *)qword_46F50;
    if (!qword_46F50)
    {
      id v7 = (objc_class *)IMWeakLinkClass();
      qword_46F50 = (uint64_t)v7;
    }
    id v8 = [v7 alloc];
    id v9 = [(MSMessageExtensionBrowserViewController *)self assetExplorerTransport];
    id v10 = [v8 initWithPackageTransport:v9];

    if (objc_opt_respondsToSelector()) {
      [v10 setEntryViewDelegate:self];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_22420;
    v11[3] = &unk_3D440;
    void v11[4] = self;
    [v3 showEntryViewPhotosShelf:v10 completion:v11];
    [(MSMessageExtensionBrowserViewController *)self setAssetExplorerShelfViewController:v10];
    [(MSMessageExtensionBrowserViewController *)self setIsShowingAssetExplorerShelf:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && MSAssetExplorerTransportContext == a5) {
    [(MSMessageExtensionBrowserViewController *)self _transportStagingStateDidChange];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MSMessageExtensionBrowserViewController *)self sendDelegate];
  [v10 showModalViewController:v9 animated:v5 completion:v8];
}

@end