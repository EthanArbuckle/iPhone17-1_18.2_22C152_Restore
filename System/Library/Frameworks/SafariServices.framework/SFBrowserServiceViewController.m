@interface SFBrowserServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)hostWindowSceneIdentifierForServiceWindowSceneIdentifier:(id)a3;
+ (void)setHostWindowSceneIdentifier:(id)a3 forServiceViewController:(id)a4;
- (ASWebAuthenticationSessionCallback)hostApplicationCallback;
- (BOOL)_ensureWebsiteDataStoreURL:(id)a3 cookieStoreURL:(id)a4;
- (BOOL)_isUsedForAuthentication;
- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3;
- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3;
- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4;
- (BOOL)_shouldAcceptMessage:(id)a3;
- (BOOL)_shouldReloadImmediatelyAfterPageLoadError;
- (BOOL)_willURLOpenHostApp:(id)a3;
- (SFBrowserServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SFSystemAlert)webAuthenticationDataSharingConfirmation;
- (id)_applicationPayloadForOpeningInSafari;
- (id)_cookieStoreURL;
- (id)_createPersistentDataStoreWithConfiguration:(id)a3;
- (id)_safariWebDataStoreRootURL;
- (id)_sharedWebDataStoreRootURL;
- (id)_trustedReportEndpoint;
- (id)_webDataStoreRootURL;
- (id)_websiteDataStoreURL;
- (id)processPool;
- (id)processPoolConfiguration;
- (id)websiteDataStoreConfiguration;
- (int64_t)_persona;
- (void)_didLoadWebView;
- (void)_didResolveDestinationURL:(id)a3 pendingAppLinkCheck:(BOOL)a4;
- (void)_dismiss;
- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5;
- (void)_getSafariDataSharingModeWithCompletion:(id)a3;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_openCurrentURLInSafari;
- (void)_prewarmConnectionsToURLs:(id)a3;
- (void)_trustedReportEndpoint;
- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3;
- (void)_updateRemoteSwipeGestureState;
- (void)_willAppearInRemoteViewController;
- (void)activityViewController:(id)a3 didCompleteActivity:(id)a4 success:(BOOL)a5;
- (void)addClickAttribution:(id)a3;
- (void)browserViewDidReceiveTouchEvent:(id)a3;
- (void)clearWebsiteDataWithCompletionHandler:(id)a3;
- (void)closeDatabasesOnBackgroundingOrDismissal;
- (void)dealloc;
- (void)decideCookieSharingForURL:(id)a3 callback:(id)a4 proxiedAssociatedDomains:(id)a5;
- (void)didDetectRemoteViewControllerViewIsHidden;
- (void)didDetectUserInteractionFromHostApp;
- (void)didFetchCustomActivities:(id)a3 excludedActivityTypes:(id)a4;
- (void)didRequestShowLinkPreviews:(BOOL)a3;
- (void)invalidatePrewarmingTokenWithID:(unint64_t)a3;
- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4;
- (void)loadURL:(id)a3;
- (void)openCurrentURLInSafariFromPreviewAction;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)processPool;
- (void)repostNotificationInViewService:(id)a3;
- (void)requestPrewarmingWithTokens:(id)a3;
- (void)safariActivity:(id)a3 didFinish:(BOOL)a4;
- (void)setAdditionalHeaderFieldsForInitialLoad:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDismissButtonStyle:(int64_t)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setHostApplicationCallback:(id)a3;
- (void)setHostWindowSceneIdentifier:(id)a3;
- (void)setIsRunningTransitionAnimation:(BOOL)a3;
- (void)setPreferredBarTintColor:(id)a3 controlTintColor:(id)a4;
- (void)setWebAuthenticationDataSharingConfirmation:(id)a3;
- (void)set_isUsedForAuthentication:(BOOL)a3;
- (void)startResolveRedirectionForURL:(id)a3;
- (void)updateScrollViewIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4;
- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4;
- (void)webViewController:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4;
- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webViewController:(id)a3 willPerformClientRedirectToURL:(id)a4 withDelay:(double)a5;
- (void)webViewControllerDidCancelClientRedirect:(id)a3;
- (void)webViewControllerWebProcessDidCrash:(id)a3;
@end

@implementation SFBrowserServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC4F428];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC3D740];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_didFetchCustomActivities_excludedActivityTypes_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_requestPrewarmingWithTokens_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)hostWindowSceneIdentifierForServiceWindowSceneIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)hostWindowSceneIdentifierToServiceViewController;
  id v3 = (id)[obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v7 = [(id)hostWindowSceneIdentifierToServiceViewController objectForKey:v6];
        v8 = [v7 view];
        v9 = [v8 window];
        v10 = [v9 windowScene];
        v11 = [v10 _sceneIdentifier];
        char v12 = [v11 isEqualToString:v15];

        if (v12)
        {
          id v3 = v6;

          goto LABEL_11;
        }
      }
      id v3 = (id)[obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);

  return v3;
}

+ (void)setHostWindowSceneIdentifier:(id)a3 forServiceViewController:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  v6 = (void *)hostWindowSceneIdentifierToServiceViewController;
  if (!hostWindowSceneIdentifierToServiceViewController)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v8 = (void *)hostWindowSceneIdentifierToServiceViewController;
    hostWindowSceneIdentifierToServiceViewController = v7;

    v6 = (void *)hostWindowSceneIdentifierToServiceViewController;
  }
  [v6 setObject:v5 forKey:v9];
  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 _isBeingUsedForCellularServiceBootstrap]
    && ([(SFBrowserServiceViewController *)self _hostAuditToken],
        WBSAuditTokenHasEntitlement()))
  {
    [v4 _setEphemeral:1];
  }
  else
  {
    objc_msgSend(v4, "set_isBeingUsedForCellularServiceBootstrap:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v5 setConfiguration:v4];
}

- (SFBrowserServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFBrowserServiceViewController;
  v8 = [(_SFBrowserContentViewController *)&v17 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1E600];
    if (webBrowsingServicesBundle(void)::onceToken != -1) {
      dispatch_once(&webBrowsingServicesBundle(void)::onceToken, &__block_literal_global_362);
    }
    [v9 setDefaultEffectiveBundle:webBrowsingServicesBundle(void)::bundle];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastHostApplicationSuspendDate = v8->_lastHostApplicationSuspendDate;
    v8->_lastHostApplicationSuspendDate = (NSDate *)v10;

    v8->_canNotifyHostApplicationOfRedirects = 1;
    char v12 = [(_SFBrowserContentViewController *)v8 wkPreferences];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(_SFBrowserContentViewController *)v8 wkPreferences];
      [v14 _setMediaCapabilityGrantsEnabled:0];
    }
    id v15 = v8;
  }

  return v8;
}

- (void)dealloc
{
  [(_SFWebViewUsageMonitor *)self->_usageMonitor auditUsageIfNeeded];
  if (self->_hasConnectedToHostApplication)
  {
    id v3 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
    [(id)allHostAppBundleIDs removeObject:v3];
    updatePowerLogEventForAllHostApps();

    id v4 = +[_SFLocationManager sharedLocationManager];
    objc_super v5 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
    [v4 removeClientForApplication:v5];

    uint64_t v6 = [(SFBrowserServiceViewController *)self _hostProcessIdentifier];
    if (self->_processPool)
    {
      id v7 = safariViewControllerProcessPoolStorage();
      [v7 decrementReferenceForPID:v6];
    }
    if (self->_persistentDataStore)
    {
      v8 = safariViewControllerDataStoreStorage();
      [v8 decrementReferenceForPID:v6];
    }
  }
  [(SFBrowserServiceViewController *)self closeDatabasesOnBackgroundingOrDismissal];
  [(SFSystemAlert *)self->_webAuthenticationDataSharingConfirmation cancel];
  [(_SFBrowserContentViewController *)self _invalidateUserActivity];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redirectNotificationTimer);
  [WeakRetained invalidate];

  v10.receiver = self;
  v10.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v10 dealloc];
}

- (void)_willAppearInRemoteViewController
{
  self->_hasConnectedToHostApplication = 1;
  objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(SFBrowserServiceViewController *)self view];
  id v4 = [v3 window];
  [v4 setTintColor:v13];

  id v5 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
  uint64_t v6 = (void *)allHostAppBundleIDs;
  id v14 = v5;
  if (!allHostAppBundleIDs)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    v8 = (void *)allHostAppBundleIDs;
    allHostAppBundleIDs = v7;

    uint64_t v6 = (void *)allHostAppBundleIDs;
    id v5 = v14;
  }
  [v6 addObject:v5];
  updatePowerLogEventForAllHostApps();

  if (!self->_usageMonitor)
  {
    id v9 = [[_SFWebViewUsageMonitor alloc] initWithHostAppIdentifier:v14];
    usageMonitor = self->_usageMonitor;
    self->_usageMonitor = v9;
  }
  v11 = +[_SFLocationManager sharedLocationManager];
  char v12 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
  [v11 addClientForApplication:v12];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v8 viewDidAppear:a3];
  if (![(_SFBrowserContentViewController *)self viewDidAppearInHostApp]) {
    self->_hostApplicationIsForeground = 1;
  }
  [(_SFBrowserContentViewController *)self setViewDidAppearInHostApp:1];
  id v4 = [(SFBrowserServiceViewController *)self view];
  id v5 = [v4 window];
  uint64_t v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  [(SFBrowserServiceViewController *)self _updateRemoteSwipeGestureState];
  prewarmingRequestThrottler = self->_prewarmingRequestThrottler;
  self->_prewarmingRequestThrottler = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v4 viewDidDisappear:a3];
  [(_SFBrowserContentViewController *)self setViewDidAppearInHostApp:0];
}

- (void)setDisplayMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController setDisplayMode:](&v7, sel_setDisplayMode_);
  if (a3 == 1)
  {
    id v5 = [(_SFBrowserContentViewController *)self browserView];
    uint64_t v6 = [v5 previewHeader];
    [v6 setDelegate:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  [(SFBrowserServiceViewController *)&v7 viewWillDisappear:a3];
  if (![(_SFWebViewUsageMonitor *)self->_usageMonitor userInteracted])
  {
    objc_super v4 = [(_SFBrowserContentViewController *)self browserView];
    -[_SFWebViewUsageMonitor setUserInteracted:](self->_usageMonitor, "setUserInteracted:", [v4 hasReceivedTouchEvents]);
  }
  [(SFBrowserServiceViewController *)self closeDatabasesOnBackgroundingOrDismissal];
  id v5 = [(_SFBrowserContentViewController *)self webViewController];
  uint64_t v6 = [v5 webView];
  objc_msgSend(v6, "_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata");
}

- (void)setPreferredBarTintColor:(id)a3 controlTintColor:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(_SFBrowserContentViewController *)self setPreferredBarTintColor:v7];
  [(_SFBrowserContentViewController *)self setPreferredControlTintColor:v6];
}

- (id)processPoolConfiguration
{
  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  id v3 = [(_SFBrowserContentViewController *)&v7 processPoolConfiguration];
  objc_super v4 = (void *)[v3 copy];

  objc_msgSend(v4, "setPresentingApplicationPID:", -[SFBrowserServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier"));
  if (objc_opt_respondsToSelector())
  {
    [(SFBrowserServiceViewController *)self _hostAuditToken];
    v6[0] = v6[2];
    v6[1] = v6[3];
    [v4 setPresentingApplicationProcessToken:v6];
  }

  return v4;
}

- (void)updateScrollViewIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  v15[3] = *MEMORY[0x1E4F143B8];
  if ((_SFInsetIsInvalid() & 1) != 0 || _SFInsetIsInvalid())
  {
    id v13 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v14 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
      -[SFBrowserServiceViewController updateScrollViewIndicatorVerticalInsets:horizontalInsets:](v14, (uint64_t)v15);
    }
  }
  else
  {
    -[_SFBrowserContentViewController _updateScrollIndicatorVerticalInsets:horizontalInsets:](self, "_updateScrollIndicatorVerticalInsets:horizontalInsets:", v11, v10, v9, v8, top, left, bottom, right);
  }
}

- (id)processPool
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  processPool = self->_processPool;
  if (!processPool)
  {
    uint64_t v4 = [(SFBrowserServiceViewController *)self _hostProcessIdentifier];
    if (!v4 && [MEMORY[0x1E4F98AF8] hasInternalContent])
    {
      id v5 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        uint64_t v6 = objc_opt_class();
        [(SFBrowserServiceViewController *)v6 processPool];
      }
    }
    objc_super v7 = safariViewControllerProcessPoolStorage();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__SFBrowserServiceViewController_processPool__block_invoke;
    v13[3] = &unk_1E5C74990;
    v13[4] = self;
    uint64_t v8 = [v7 incrementReferenceForPID:v4 valueCreationBlock:v13];
    p_processPool = &self->_processPool;
    double v10 = *p_processPool;
    *p_processPool = (WKProcessPool *)v8;

    processPool = *p_processPool;
  }
  double v11 = processPool;

  return v11;
}

id __45__SFBrowserServiceViewController_processPool__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) newProcessPool];

  return v1;
}

- (void)loadURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F18AE0];
  [(SFBrowserServiceViewController *)self _hostAuditToken];
  [v5 handleSSOExtensionIdentifier:v19];
  [(_SFWebViewUsageMonitor *)self->_usageMonitor checkURL:v4];
  objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([(NSDictionary *)self->_additionalHeaderFieldsForInitialRequest count])
  {
    objc_super v7 = (void *)[v6 mutableCopy];

    additionalHeaderFieldsForInitialRequest = self->_additionalHeaderFieldsForInitialRequest;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__SFBrowserServiceViewController_loadURL___block_invoke;
    v17[3] = &unk_1E5C749B8;
    id v6 = v7;
    id v18 = v6;
    [(NSDictionary *)additionalHeaderFieldsForInitialRequest enumerateKeysAndObjectsUsingBlock:v17];
  }
  [(_SFBrowserContentViewController *)self loadRequest:v6];
  double v9 = [(_SFBrowserContentViewController *)self configuration];
  uint64_t v10 = [v9 _redirectNotificationBehavior];

  if (v10 == 1)
  {
    objc_initWeak(&location, self);
    double v11 = (void *)MEMORY[0x1E4F1CB00];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__SFBrowserServiceViewController_loadURL___block_invoke_2;
    v14[3] = &unk_1E5C749E0;
    objc_copyWeak(&v15, &location);
    char v12 = [v11 timerWithTimeInterval:0 repeats:v14 block:10.0];
    [v12 setTolerance:1.0];
    id v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v13 addTimer:v12 forMode:*MEMORY[0x1E4F1C4B0]];

    objc_storeWeak((id *)&self->_redirectNotificationTimer, v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __42__SFBrowserServiceViewController_loadURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void __42__SFBrowserServiceViewController_loadURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[2025] = 1;
  }
}

- (BOOL)_shouldAcceptMessage:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 originIdentifier] != 0xC181BADB23D8497BLL)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserServiceViewController _shouldAcceptMessage:]((uint64_t)v12, [v3 originIdentifier], v8);
    }

    goto LABEL_12;
  }
  unint64_t v4 = [v3 timestamp];
  if (v4 <= -[SFBrowserServiceViewController _shouldAcceptMessage:]::lastSeenBackBoardTimestamp)
  {
    double v9 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserServiceViewController _shouldAcceptMessage:]();
    }
    goto LABEL_12;
  }
  id v5 = [MEMORY[0x1E4F4F2A0] sharedInstance];
  uint64_t v6 = [v5 authenticateMessage:v3];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserServiceViewController _shouldAcceptMessage:]();
    }
LABEL_12:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  -[SFBrowserServiceViewController _shouldAcceptMessage:]::lastSeenBackBoardTimestamp = v4;
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (id)_trustedReportEndpoint
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F223F8];
  [(SFBrowserServiceViewController *)self _hostAuditToken];
  id v13 = 0;
  id v3 = [v2 bundleRecordForAuditToken:v14 error:&v13];
  id v4 = v13;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    BOOL v7 = [v3 infoDictionary];
    uint64_t v10 = [v7 objectForKey:@"NSAdvertisingAttributionReportEndpoint" ofClass:objc_opt_class()];
    double v9 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    if ((objc_msgSend(v9, "safari_isHTTPSURL") & 1) == 0)
    {
      double v11 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SFBrowserServiceViewController _trustedReportEndpoint]();
      }

      double v9 = 0;
    }
  }
  else
  {
    BOOL v7 = (id)WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      [(SFBrowserServiceViewController *)v8 _trustedReportEndpoint];
    }
    double v9 = 0;
  }

  return v9;
}

- (void)addClickAttribution:(id)a3
{
  id v9 = a3;
  id v4 = [v9 eventMessage];
  BOOL v5 = [(SFBrowserServiceViewController *)self _shouldAcceptMessage:v4];

  if (v5)
  {
    BOOL v6 = [(SFBrowserServiceViewController *)self _trustedReportEndpoint];
    if (v6)
    {
      BOOL v7 = [v9 clickAttributionWithReportEndpoint:v6];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1760]) initWithUISClickAttribution:v7];
      [(_SFBrowserContentViewController *)self addTrustedEventAttribution:v8];
    }
  }
}

- (void)decideCookieSharingForURL:(id)a3 callback:(id)a4 proxiedAssociatedDomains:(id)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v41 = a5;
  objc_initWeak(&location, self);
  if ([v9 callbackType] != 1)
  {
LABEL_6:
    [(SFBrowserServiceViewController *)self set_isUsedForAuthentication:1];
    [(SFBrowserServiceViewController *)self setHostApplicationCallback:v9];
    [(_SFBrowserContentViewController *)self setStoreBannersAreDisabled:1];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke;
    v44[3] = &unk_1E5C74A08;
    objc_copyWeak(&v46, &location);
    id v14 = v8;
    id v45 = v14;
    id v15 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v44);
    if ([(SFBrowserServiceViewController *)self _isUsedForAuthentication])
    {
      uint64_t v16 = [(_SFBrowserContentViewController *)self configuration];
      uint64_t v17 = [v16 _storageModeForAuthenticationSession];

      if (v17 == 1)
      {
        uint64_t v18 = 3;
        goto LABEL_22;
      }
      if (v17 == 2)
      {
        uint64_t v18 = 1;
LABEL_22:
        v15[2](v15, v18);
LABEL_23:

        objc_destroyWeak(&v46);
        goto LABEL_24;
      }
    }
    long long v19 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
    v20 = (void *)MEMORY[0x1E4F783A0];
    uint64_t v21 = objc_msgSend(v14, "safari_highLevelDomain");
    v22 = v21;
    if (!v21)
    {
      v22 = [v14 host];
    }
    v23 = [v20 webAuthenticationAlertForDomain:v22 appBundleID:v19];
    webAuthenticationDataSharingConfirmation = self->_webAuthenticationDataSharingConfirmation;
    self->_webAuthenticationDataSharingConfirmation = v23;

    if (!v21) {
    v25 = self->_webAuthenticationDataSharingConfirmation;
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke_2;
    v42[3] = &unk_1E5C74A30;
    v43 = v15;
    [(SFSystemAlert *)v25 scheduleWithCompletionBlock:v42];

    goto LABEL_23;
  }
  if ([v41 count])
  {
    [(SFBrowserServiceViewController *)self _hostAuditToken];
    if ((WBSAuditTokenHasEntitlement() & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28588];
      v52[0] = @"Process is not entitled to perform proxied requests.";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v28 = [v26 errorWithDomain:*MEMORY[0x1E4F18A90] code:1 userInfo:v27];

      v29 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SFBrowserServiceViewController decideCookieSharingForURL:callback:proxiedAssociatedDomains:]();
      }
      v30 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
      [v30 didDecideCookieSharingForURL:v8 shouldCancel:1 withError:v28];

      goto LABEL_24;
    }
    uint64_t v10 = [v9 host];
    char v11 = [v41 containsObject:v10];

    if (v11) {
      goto LABEL_6;
    }
  }
  char v12 = (void *)MEMORY[0x1E4F29268];
  [(SFBrowserServiceViewController *)self _hostAuditToken];
  id v13 = [v9 host];
  LOBYTE(v12) = objc_msgSend(v12, "safari_applicationWithAuditToken:hasApprovedWebCredentialsDomainAssociationForDomain:", v47, v13);

  if (v12) {
    goto LABEL_6;
  }
  v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v49 = *MEMORY[0x1E4F28588];
  v32 = NSString;
  v33 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
  v34 = [v9 host];
  v36 = v35 = [v9 host];
  v50 = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v38 = [v31 errorWithDomain:*MEMORY[0x1E4F18A90] code:1 userInfo:v37];

  v39 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    -[SFBrowserServiceViewController decideCookieSharingForURL:callback:proxiedAssociatedDomains:]();
  }
  v40 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v40 didDecideCookieSharingForURL:v8 shouldCancel:1 withError:v38];

LABEL_24:
  objc_destroyWeak(&location);
}

void __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    [WeakRetained setWebAuthenticationDataSharingConfirmation:0];
    if (a2 != 2)
    {
      uint64_t v5 = 3;
      if (a2 == 3) {
        uint64_t v5 = 4;
      }
      if (a2 == 1) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = v5;
      }
      [v8 setSafariDataSharingMode:v6];
    }
    BOOL v7 = [v8 _remoteViewControllerProxy];
    [v7 didDecideCookieSharingForURL:*(void *)(a1 + 32) shouldCancel:a2 == 2 withError:0];

    id WeakRetained = v8;
  }
}

uint64_t __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startResolveRedirectionForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_SFBrowserContentViewController *)self configuration];
  char v6 = [v5 _isEphemeral];

  if (v6)
  {
    [(_SFBrowserContentViewController *)self setSafariDataSharingMode:4];
    [(_SFBrowserContentViewController *)self _setUpWebViewControllerIfNeeded];
    [(SFBrowserServiceViewController *)self loadURL:v4];
  }
  else
  {
    BOOL v7 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserServiceViewController startResolveRedirectionForURL:]();
    }
    id v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
    [v8 didResolveRedirectionWithURL:v4 appLink:0];
  }
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  id v4 = [(_SFBrowserContentViewController *)self browserView];
  [v4 setContentReadyForDisplay];

  v5[2]();
}

- (void)requestPrewarmingWithTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_prewarmingRequestThrottler)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = objc_alloc_init(_SFSafariViewControllerPrewarmingRequestThrottler);
    prewarmingRequestThrottler = self->_prewarmingRequestThrottler;
    self->_prewarmingRequestThrottler = v5;

    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self->_prewarmingRequestThrottler setMinimumRequestDelay:2.0];
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self->_prewarmingRequestThrottler setMaximumValidConnectionCount:20];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__SFBrowserServiceViewController_requestPrewarmingWithTokens___block_invoke;
    v15[3] = &unk_1E5C74A58;
    objc_copyWeak(&v16, &location);
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self->_prewarmingRequestThrottler setConnectionHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[_SFSafariViewControllerPrewarmingRequestThrottler requestToken:](self->_prewarmingRequestThrottler, "requestToken:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v8);
  }
}

void __62__SFBrowserServiceViewController_requestPrewarmingWithTokens___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _prewarmConnectionsToURLs:v3];
}

- (void)invalidatePrewarmingTokenWithID:(unint64_t)a3
{
}

- (void)_prewarmConnectionsToURLs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__SFBrowserServiceViewController__prewarmConnectionsToURLs___block_invoke;
    v5[3] = &unk_1E5C72628;
    id v6 = v4;
    id v7 = self;
    [(_SFBrowserContentViewController *)self decideDataSharingModeAndSetUpWebViewWithCompletionHandler:v5];
  }
}

void __60__SFBrowserServiceViewController__prewarmConnectionsToURLs___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138739971;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Prewarming connections to %{sensitive}@", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) webView];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "_preconnectToServer:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)clearWebsiteDataWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (![(_SFBrowserContentViewController *)self safariDataSharingMode])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__SFBrowserServiceViewController_clearWebsiteDataWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5C74770;
    v9[4] = self;
    [(SFBrowserServiceViewController *)self _getSafariDataSharingModeWithCompletion:v9];
  }
  if ([(_SFBrowserContentViewController *)self safariDataSharingMode] == 1
    || [(_SFBrowserContentViewController *)self safariDataSharingMode] == 3)
  {
    v4[2](v4);
  }
  else
  {
    id v5 = [(SFBrowserServiceViewController *)self websiteDataStoreConfiguration];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreWithConfiguration:", v5);
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F46710], "safari_allDataTypes");
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v6 removeDataOfTypes:v7 modifiedSince:v8 completionHandler:v4];
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __72__SFBrowserServiceViewController_clearWebsiteDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSafariDataSharingMode:a2];
}

- (void)setHostWindowSceneIdentifier:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() setHostWindowSceneIdentifier:v4 forServiceViewController:self];
}

- (void)setAdditionalHeaderFieldsForInitialLoad:(id)a3
{
  id v6 = a3;
  id v4 = (NSDictionary *)[v6 copy];
  additionalHeaderFieldsForInitialRequest = self->_additionalHeaderFieldsForInitialRequest;
  self->_additionalHeaderFieldsForInitialRequest = v4;
}

- (void)_didResolveDestinationURL:(id)a3 pendingAppLinkCheck:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(_SFBrowserContentViewController *)self configuration];
  char v8 = [v7 _isEphemeral];

  if ((v8 & 1) != 0
    && ![(_SFBrowserContentViewController *)self viewDidAppearInHostApp]
    && ![(_SFBrowserContentViewController *)self isShowingErrorPage])
  {
    if (a4)
    {
      long long v9 = (void *)MEMORY[0x1E4F22398];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke;
      v11[3] = &unk_1E5C74AA8;
      v11[4] = self;
      id v12 = v6;
      [v9 getAppLinkWithURL:v12 completionHandler:v11];
    }
    else
    {
      long long v10 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
      [v10 didResolveRedirectionWithURL:v6 appLink:0];
    }
  }
}

void __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke_2;
  block[3] = &unk_1E5C74A80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) _remoteViewControllerProxy];
    [v2 didResolveRedirectionWithURL:*(void *)(a1 + 48) appLink:*(void *)(a1 + 32)];
  }
}

- (void)openCurrentURLInSafariFromPreviewAction
{
  v2.receiver = self;
  v2.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v2 _openCurrentURLInSafari];
}

- (void)_openCurrentURLInSafari
{
  id v3 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v3 willOpenCurrentPageInBrowser];

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v4 _openCurrentURLInSafari];
}

- (id)_safariWebDataStoreRootURL
{
  objc_super v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = _SFSafariContainerPath();
  objc_super v4 = [v3 stringByAppendingPathComponent:@"/Library"];
  id v5 = [v4 stringByResolvingSymlinksInPath];
  id v6 = [v2 fileURLWithPath:v5 isDirectory:1];

  return v6;
}

- (id)_sharedWebDataStoreRootURL
{
  id v3 = +[_SFSafariDataSharingController sharedController];
  objc_super v4 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
  id v5 = [v3 systemDataContainerURLWithAppBundleID:v4];

  id v6 = [v5 URLByAppendingPathComponent:@"/Library"];

  return v6;
}

- (id)_webDataStoreRootURL
{
  if ([(_SFBrowserContentViewController *)self safariDataSharingMode] == 3
    || [(_SFBrowserContentViewController *)self safariDataSharingMode] == 1)
  {
    id v3 = [(SFBrowserServiceViewController *)self _safariWebDataStoreRootURL];
  }
  else if ([(_SFBrowserContentViewController *)self safariDataSharingMode] == 2)
  {
    id v3 = [(SFBrowserServiceViewController *)self _sharedWebDataStoreRootURL];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_websiteDataStoreURL
{
  objc_super v2 = [(SFBrowserServiceViewController *)self _webDataStoreRootURL];
  id v3 = [v2 URLByAppendingPathComponent:@"/WebKit/WebsiteData/"];

  return v3;
}

- (id)_cookieStoreURL
{
  objc_super v2 = [(SFBrowserServiceViewController *)self _webDataStoreRootURL];
  id v3 = [v2 URLByAppendingPathComponent:@"/Cookies/"];

  return v3;
}

- (BOOL)_ensureWebsiteDataStoreURL:(id)a3 cookieStoreURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [v5 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if ((v11 & 1) == 0)
    {
      id v23 = 0;
      char v12 = [v9 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v23];
      id v13 = v23;
      id v14 = v13;
      if ((v12 & 1) == 0)
      {
        uint64_t v18 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = objc_msgSend(v14, "safari_privacyPreservingDescription");
          -[SFBrowserServiceViewController _ensureWebsiteDataStoreURL:cookieStoreURL:]((uint64_t)v5, v19, (uint64_t)v24);
        }
        goto LABEL_14;
      }
    }
    uint64_t v15 = [v7 path];
    char v16 = [v9 fileExistsAtPath:v15];

    if (v16)
    {
      BOOL v8 = 1;
LABEL_16:

      goto LABEL_17;
    }
    id v22 = 0;
    char v17 = [v9 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v14 = v22;
    if (v17)
    {
      BOOL v8 = 1;
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v18 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v14, "safari_privacyPreservingDescription");
      -[SFBrowserServiceViewController _ensureWebsiteDataStoreURL:cookieStoreURL:]((uint64_t)v7, v20, (uint64_t)v24);
    }
LABEL_14:

    BOOL v8 = 0;
    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (id)websiteDataStoreConfiguration
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F467D8]);
  objc_super v4 = [(SFBrowserServiceViewController *)self _webDataStoreRootURL];
  id v5 = [(SFBrowserServiceViewController *)self _websiteDataStoreURL];
  id v6 = [(SFBrowserServiceViewController *)self _cookieStoreURL];
  if ([(SFBrowserServiceViewController *)self _ensureWebsiteDataStoreURL:v5 cookieStoreURL:v6])
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
      int v20 = 138543618;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Data Store URL for app %{public}@ is %{public}@.", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = [v6 path];
    char v11 = [v10 stringByAppendingPathComponent:@"/Cookies.binarycookies"];
    char v12 = [v9 fileURLWithPath:v11 isDirectory:0];
    [v3 _setCookieStorageFile:v12];

    [v3 _setWebStorageDirectory:v5];
    [v3 _setWebSQLDatabaseDirectory:v5];
    [v3 _setResourceLoadStatisticsDirectory:v5];
    [v3 _setIndexedDBDatabaseDirectory:v5];
    [v3 _setCacheStorageDirectory:v5];
    [v3 _setServiceWorkerRegistrationDirectory:v5];
    [v3 setSourceApplicationBundleIdentifier:@"com.apple.mobilesafari"];
    if (objc_opt_respondsToSelector()) {
      [v3 setAlternativeServicesStorageDirectory:v5];
    }
    if (objc_opt_respondsToSelector()) {
      [v3 setHSTSStorageDirectory:v5];
    }
    if (objc_opt_respondsToSelector())
    {
      id v13 = [v5 URLByAppendingPathComponent:@"Default" isDirectory:1];
      [v3 setGeneralStorageDirectory:v13];
    }
    id v14 = [v5 URLByAppendingPathComponent:@"NetworkCache" isDirectory:1];
    [v3 setNetworkCacheDirectory:v14];

    uint64_t v15 = [v5 URLByAppendingPathComponent:@"OfflineWebApplicationCache" isDirectory:1];
    [v3 setApplicationCacheDirectory:v15];

    char v16 = [v5 URLByAppendingPathComponent:@"MediaCache" isDirectory:1];
    [v3 setMediaCacheDirectory:v16];

    char v17 = [v5 URLByAppendingPathComponent:@"MediaKeys" isDirectory:1];
    [v3 setMediaKeysStorageDirectory:v17];

    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = v3;
    id v3 = 0;
  }

  return v3;
}

- (id)_createPersistentDataStoreWithConfiguration:(id)a3
{
  id v4 = a3;
  persistentDataStore = self->_persistentDataStore;
  if (persistentDataStore)
  {
    id v6 = persistentDataStore;
  }
  else
  {
    uint64_t v7 = [(SFBrowserServiceViewController *)self _hostProcessIdentifier];
    BOOL v8 = safariViewControllerDataStoreStorage();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SFBrowserServiceViewController__createPersistentDataStoreWithConfiguration___block_invoke;
    v12[3] = &unk_1E5C74AD0;
    id v13 = v4;
    id v14 = self;
    uint64_t v9 = [v8 incrementReferenceForPID:v7 additionalKey:0 valueCreationBlock:v12];
    id v10 = self->_persistentDataStore;
    self->_persistentDataStore = v9;

    id v6 = self->_persistentDataStore;
  }

  return v6;
}

id __78__SFBrowserServiceViewController__createPersistentDataStoreWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)SFBrowserServiceViewController;
  objc_super v2 = objc_msgSendSuper2(&v4, sel__createPersistentDataStoreWithConfiguration_, v1);

  return v2;
}

- (void)_getSafariDataSharingModeWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(_SFBrowserContentViewController *)self configuration];
  int v6 = [v5 _isEphemeral];

  if (!v6)
  {
    uint64_t v7 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
    BOOL v8 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v7];
    if (([v7 hasPrefix:@"com.apple."] & 1) != 0
      || ([v8 dataContainerURL], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (![(SFBrowserServiceViewController *)self _isUsedForAuthentication])
      {
        char v12 = WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          id v14 = v7;
          _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "SFSafariViewController is used by system app %{public}@, which may not have data container", (uint8_t *)&v13, 0xCu);
        }
        uint64_t v11 = 1;
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v10 = +[_SFSafariDataSharingController sharedController];
    [v10 checkInAppBundleIDIfNeeded:v7];

    uint64_t v11 = 2;
LABEL_11:
    v4[2](v4, v11);

    goto LABEL_12;
  }
  v4[2](v4, 4);
LABEL_12:
}

- (void)didFetchCustomActivities:(id)a3 excludedActivityTypes:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if (self->_activityViewControllerInfoFetchCompletionHandler)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v19;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = [[SFHostApplicationCustomActivity alloc] initWithActivityProxy:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
          [(_SFActivity *)v12 setDelegate:self];
          [v7 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    if (![(SFBrowserServiceViewController *)self _isUsedForAuthentication])
    {
      int v13 = objc_alloc_init(_SFAddBookmarkActivity);
      [(_SFActivity *)v13 setDelegate:self];
      [v7 addObject:v13];
    }
    id v14 = [_SFFindOnPageUIActivity alloc];
    uint64_t v15 = [(_SFBrowserContentViewController *)self activeWebView];
    char v16 = [(_SFFindOnPageUIActivity *)v14 initWithWebView:v15];
    [v7 addObject:v16];

    char v17 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](self->_activityViewControllerInfoFetchCompletionHandler);
    id activityViewControllerInfoFetchCompletionHandler = self->_activityViewControllerInfoFetchCompletionHandler;
    self->_id activityViewControllerInfoFetchCompletionHandler = 0;

    ((void (**)(void, void *, id))v17)[2](v17, v7, v6);
  }
}

- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)[v9 copy];
  id activityViewControllerInfoFetchCompletionHandler = self->_activityViewControllerInfoFetchCompletionHandler;
  self->_id activityViewControllerInfoFetchCompletionHandler = v10;

  char v12 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v12 fetchActivityViewControllerInfoForURL:v13 title:v8];
}

- (void)repostNotificationInViewService:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4FB2738]]) {
    [(_SFBrowserContentViewController *)self setViewDidAppearInHostApp:0];
  }
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v4 postNotificationName:v6 object:v5];
}

- (void)setIsRunningTransitionAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(_SFWebViewUsageMonitor *)self->_usageMonitor setUserInteracted:1];
  id v6 = [(SFBrowserServiceViewController *)self view];
  id v5 = [v6 window];
  [v5 setUserInteractionEnabled:!v3];
}

- (void)setDismissButtonStyle:(int64_t)a3
{
  id v4 = [(_SFBrowserContentViewController *)self browserView];
  [v4 updateDismissButtonStyle:a3];
}

- (void)didDetectRemoteViewControllerViewIsHidden
{
}

- (void)didDetectUserInteractionFromHostApp
{
}

- (void)didRequestShowLinkPreviews:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(_SFBrowserContentViewController *)self browserView];
  id v5 = [v9 previewHeader];
  [v5 setLinkPreviewEnabled:v3];

  id v6 = [NSNumber numberWithBool:v3];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  id v10 = v6;
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E4F789F0], v6, (CFStringRef)*MEMORY[0x1E4F1D3B8]);
  CFPreferencesAppSynchronize(v7);
  id v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v8 didDecideShouldShowLinkPreviews:v3];
}

- (void)_dismiss
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "nil SFRemoteViewControllerProtocol", v2, v3, v4, v5, v6);
}

- (void)_updateRemoteSwipeGestureState
{
  id v3 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  objc_msgSend(v3, "setRemoteSwipeGestureEnabled:", -[_SFBrowserContentViewController remoteSwipeGestureEnabled](self, "remoteSwipeGestureEnabled"));
}

- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_SFBrowserContentViewController *)self configuration];
  uint64_t v6 = [v5 _redirectNotificationBehavior];

  if (!v6 && v3 && self->_isExpectingClientRedirect) {
    return 0;
  }
  id v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v8 didFinishInitialLoad:v3];

  return 1;
}

- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(ASWebAuthenticationSessionCallback *)self->_hostApplicationCallback matchesURL:v4];
  if (v5)
  {
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
      hostApplicationCallback = self->_hostApplicationCallback;
      int v11 = 138543618;
      char v12 = v7;
      __int16 v13 = 2114;
      id v14 = hostApplicationCallback;
      _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Application %{public}@ is able to handle %{public}@ for authentication", (uint8_t *)&v11, 0x16u);
    }
    id v9 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
    [v9 willOpenURLInHostApplication:v4];
  }
  return v5;
}

- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4
{
  id v5 = a3;
  [MEMORY[0x1E4F18AE0] resetSSOExtensionIdentifier];
  uint64_t v6 = [v5 URL];
  BOOL v7 = [(SFBrowserServiceViewController *)self _redirectToHostAppForAuthenticationSession:v6];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v5 URL];
    BOOL v8 = [(SFBrowserServiceViewController *)self _willURLOpenHostApp:v9];
  }
  return v8;
}

- (BOOL)_willURLOpenHostApp:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v6 = [v5 applicationsAvailableForOpeningURL:v4];

  if ([v6 count])
  {
    BOOL v7 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "bundleIdentifier", (void)v17);
          int v13 = [v12 isEqualToString:v7];

          if (v13)
          {
            uint64_t v15 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
            [v15 willOpenURLInHostApplication:v4];

            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_12:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_didLoadWebView
{
  id v2 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v2 didLoadWebView];
}

- (void)_hostApplicationWillEnterForeground
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v3, (uint64_t)v3, "Failed to set PID to hinerit application state from: %{public}@", v4);
}

- (void)_hostApplicationDidEnterBackground
{
  self->_hostApplicationIsForeground = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  BOOL v3 = (void *)*MEMORY[0x1E4FB2608];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke;
  v8[3] = &unk_1E5C72498;
  v8[4] = &v9;
  uint64_t v4 = [v3 beginBackgroundTaskWithName:@"com.apple.SafariViewService.stopCountingUsageTimeForBackgroundedApp" expirationHandler:v8];
  v10[3] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke_2;
  v7[3] = &unk_1E5C72498;
  v7[4] = &v9;
  [(_SFBrowserContentViewController *)self stopDigitalHealthTrackingWithCompletionHandler:v7];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  lastHostApplicationSuspendDate = self->_lastHostApplicationSuspendDate;
  self->_lastHostApplicationSuspendDate = v5;

  [(SFBrowserServiceViewController *)self closeDatabasesOnBackgroundingOrDismissal];
  [(SFSystemAlert *)self->_webAuthenticationDataSharingConfirmation cancel];
  _Block_object_dispose(&v9, 8);
}

uint64_t __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)closeDatabasesOnBackgroundingOrDismissal
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  BOOL v3 = (void *)*MEMORY[0x1E4FB2608];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke;
  v11[3] = &unk_1E5C72498;
  v11[4] = &v12;
  uint64_t v4 = [v3 beginBackgroundTaskWithName:@"com.apple.SafariViewService.closeDatabasesOnBackgroundingOrDismissalTask" expirationHandler:v11];
  v13[3] = v4;
  id v5 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_239;
  v10[3] = &unk_1E5C72498;
  v10[4] = &v12;
  [v5 savePendingProviderChangesWithCompletion:v10];

  if ([(_SFBrowserContentViewController *)self safariDataSharingMode] == 1
    || [(_SFBrowserContentViewController *)self safariDataSharingMode] == 3)
  {
    uint64_t v6 = [(_SFBrowserContentViewController *)self webView];
    BOOL v7 = [v6 configuration];
    id v8 = [v7 websiteDataStore];
    uint64_t v9 = [v8 httpCookieStore];

    if (objc_opt_respondsToSelector()) {
      [v9 _flushCookiesToDiskWithCompletionHandler:&__block_literal_global_23];
    }
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXViewService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_cold_1();
  }
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_239(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (id)_applicationPayloadForOpeningInSafari
{
  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  BOOL v3 = [(_SFBrowserContentViewController *)&v8 _applicationPayloadForOpeningInSafari];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = [(SFBrowserServiceViewController *)self _hostApplicationBundleIdentifier];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F78790]];

  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

- (int64_t)_persona
{
  if ([(SFBrowserServiceViewController *)self _isUsedForAuthentication]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)_shouldReloadImmediatelyAfterPageLoadError
{
  return self->_hostApplicationIsForeground;
}

- (void)webViewController:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v11 webViewController:v6 didReceiveServerRedirectForProvisionalNavigation:v7];
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    objc_super v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
    uint64_t v9 = [v6 webView];
    uint64_t v10 = [v9 URL];
    [v8 initialLoadDidRedirectToURL:v10];
  }
}

- (void)webViewControllerDidCancelClientRedirect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v4 webViewControllerDidCancelClientRedirect:a3];
  self->_isExpectingClientRedirect = 0;
}

- (void)webViewController:(id)a3 willPerformClientRedirectToURL:(id)a4 withDelay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v12 webViewController:v8 willPerformClientRedirectToURL:v9 withDelay:a5];
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    uint64_t v10 = [(_SFBrowserContentViewController *)self configuration];
    uint64_t v11 = [v10 _redirectNotificationBehavior];

    if (a5 == 0.0 || v11) {
      self->_isExpectingClientRedirect = 1;
    }
  }
}

- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v13 webViewController:v6 didStartProvisionalNavigation:v7];
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    if (self->_isExpectingClientRedirect)
    {
      id v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
      id v9 = [v6 webView];
      uint64_t v10 = [v9 URL];
      [v8 initialLoadDidRedirectToURL:v10];
    }
    else if (self->_hasBegunFirstNavigation)
    {
      uint64_t v11 = [(_SFBrowserContentViewController *)self configuration];
      uint64_t v12 = [v11 _redirectNotificationBehavior];

      if (!v12) {
        self->_canNotifyHostApplicationOfRedirects = 0;
      }
    }
    self->_hasBegunFirstNavigation = 1;
  }
}

- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v10 webViewController:v6 didFinishDocumentLoadForNavigation:v7];
  id v8 = [(_SFBrowserContentViewController *)self configuration];
  uint64_t v9 = [v8 _redirectNotificationBehavior];

  if (!v9 && !self->_isExpectingClientRedirect) {
    self->_canNotifyHostApplicationOfRedirects = 0;
  }
}

- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v8 webViewController:v6 didChangeFullScreen:v4];
  id v7 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v7 didChangeFullScreen:v4];
}

- (void)webViewControllerWebProcessDidCrash:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v6 webViewControllerWebProcessDidCrash:v4];
  id v5 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
  [v5 didChangeFullScreen:0];
}

- (void)safariActivity:(id)a3 didFinish:(BOOL)a4
{
  id v12 = a3;
  id v5 = [v12 activityType];
  char v6 = [v5 isEqualToString:@"com.apple.mobilesafari.activity.addBookmark"];

  if ((v6 & 1) == 0)
  {
    id v7 = v12;
    objc_super v8 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
    uint64_t v9 = NSNumber;
    objc_super v10 = [v7 activityProxy];
    uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "activityProxyID"));
    [v8 executeCustomActivityProxyID:v11];
  }
}

- (void)browserViewDidReceiveTouchEvent:(id)a3
{
  id v5 = [(_SFBrowserContentViewController *)self configuration];
  if ([v5 _redirectNotificationBehavior] == 1)
  {
    BOOL touchEventsShouldStopRedirectNotifications = self->_touchEventsShouldStopRedirectNotifications;

    if (touchEventsShouldStopRedirectNotifications) {
      self->_canNotifyHostApplicationOfRedirects = 0;
    }
  }
  else
  {
  }
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3
{
  if (self->_hostApplicationIsForeground)
  {
    v3.receiver = self;
    v3.super_class = (Class)SFBrowserServiceViewController;
    [(_SFBrowserContentViewController *)&v3 _updateMaxVisibleHeightPercentageUserDriven:a3];
  }
}

- (void)activityViewController:(id)a3 didCompleteActivity:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFBrowserServiceViewController;
  [(_SFBrowserContentViewController *)&v11 activityViewController:v8 didCompleteActivity:v9 success:v5];
  if ([v9 isEqualToString:@"com.apple.mobilesafari.activity.addToHomeScreen"] & v5)
  {
    objc_super v10 = [(SFBrowserServiceViewController *)self _remoteViewControllerProxy];
    [v10 suspendApplication];
  }
}

- (BOOL)_isUsedForAuthentication
{
  return self->_isUsedForAuthentication;
}

- (void)set_isUsedForAuthentication:(BOOL)a3
{
  self->_isUsedForAuthentication = a3;
}

- (SFSystemAlert)webAuthenticationDataSharingConfirmation
{
  return self->_webAuthenticationDataSharingConfirmation;
}

- (void)setWebAuthenticationDataSharingConfirmation:(id)a3
{
}

- (ASWebAuthenticationSessionCallback)hostApplicationCallback
{
  return self->_hostApplicationCallback;
}

- (void)setHostApplicationCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationCallback, 0);
  objc_storeStrong((id *)&self->_webAuthenticationDataSharingConfirmation, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFieldsForInitialRequest, 0);
  objc_storeStrong((id *)&self->_prewarmingRequestThrottler, 0);
  objc_destroyWeak((id *)&self->_redirectNotificationTimer);
  objc_storeStrong((id *)&self->_persistentDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_lastHostApplicationSuspendDate, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);

  objc_storeStrong(&self->_activityViewControllerInfoFetchCompletionHandler, 0);
}

- (void)updateScrollViewIndicatorVerticalInsets:(void *)a1 horizontalInsets:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A690B000, v3, OS_LOG_TYPE_FAULT, "Received invalid scroll view indicator insets from host app: %{public}@", v4, 0xCu);
}

- (void)processPool
{
  id v5 = (id)OUTLINED_FUNCTION_5(a1, (uint64_t)a2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A690B000, a3, OS_LOG_TYPE_FAULT, "%{public}@ was asked to create its process pool before it has the host app's information", a2, 0xCu);
}

- (void)_shouldAcceptMessage:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v0, v1, "Private click not accepted because authentication failed with status %ld", v2);
}

- (void)_shouldAcceptMessage:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Private click not accepted because its timestamp indicates it was reused", v2, v3, v4, v5, v6);
}

- (void)_shouldAcceptMessage:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a3, (uint64_t)a3, "Private click not accepted because its origin identifier was %llu", (uint8_t *)a1);
}

- (void)_trustedReportEndpoint
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v0, v1, "Private click not accepted because report endpoint <%@> was not a valid https URL", v2);
}

- (void)decideCookieSharingForURL:callback:proxiedAssociatedDomains:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v0, v1, "%{public}@", v2);
}

- (void)startResolveRedirectionForURL:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Redirection resolving is only allowed in ephemeral mode", v2, v3, v4, v5, v6);
}

- (void)_ensureWebsiteDataStoreURL:(uint64_t)a3 cookieStoreURL:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to create cookie data store URL at %{public}@, error: %{public}@", v4, 0x16u);
}

- (void)_ensureWebsiteDataStoreURL:(uint64_t)a3 cookieStoreURL:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to create data store URL at %{public}@, error: %{public}@", v4, 0x16u);
}

void __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Background task expired while waiting for Contact AutoFill database to close and touch icon cache to save", v2, v3, v4, v5, v6);
}

@end