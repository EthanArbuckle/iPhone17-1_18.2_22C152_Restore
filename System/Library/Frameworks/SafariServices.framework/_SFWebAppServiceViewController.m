@interface _SFWebAppServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)serviceViewControllers;
- (BOOL)_clientIsWebApp;
- (BOOL)_isURLOutOfLegacyScope:(id)a3 withLoginURLExempted:(BOOL)a4;
- (BOOL)_isURLOutOfManifestScope:(id)a3;
- (BOOL)_isURLOutOfScope:(id)a3 withLoginURLExempted:(BOOL)a4;
- (BOOL)_usesScrollToTopView;
- (BOOL)audioOnly;
- (BOOL)canOverrideStatusBar;
- (BOOL)canPrint;
- (NSString)URLString;
- (id)_canonicalPageURL;
- (id)createWebsiteDataStoreForWebClipIdentifier:(id)a3;
- (id)notificationPermissionsForWebsiteDataStore:(id)a3;
- (id)placeholderBundleIdentifierForDataStore:(id)a3;
- (id)processPool;
- (id)webViewConfiguration;
- (id)websiteDataStore;
- (id)websiteDataStoreConfigurationWithWebClipIdentifier:(id)a3;
- (int64_t)_persona;
- (int64_t)preferredStatusBarStyle;
- (void)_fetchApplicationManifestIfNeeded;
- (void)_handleHostStateUpdate:(id)a3;
- (void)_hostApplicationDidEnterBackground;
- (void)_initialLoadFinishedWithSuccess:(BOOL)a3;
- (void)_loadNextFallbackURL;
- (void)_loadWebClipPageURL:(id)a3;
- (void)_setCurrentWebViewController:(id)a3;
- (void)_showBlankViewWithAlertIfNeeded;
- (void)_updateDisplayMode;
- (void)_updateThemeColor;
- (void)clearWebViewAndWebsiteDataWithCompletion:(id)a3;
- (void)clearWebsiteDataWithWebClipIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handlePushNotificationActivation:(id)a3;
- (void)loadWebAppWithIdentifier:(id)a3;
- (void)muteMediaCapture;
- (void)navigationBarDoneButtonWasTapped:(id)a3;
- (void)processWebPushForWebAppWithIdentifier:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setupPreferences:(id)a3;
- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3;
- (void)viewDidLoad;
- (void)webAppDidBecomeActive;
- (void)webAppWillResignActive;
- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webViewController:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewController:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5;
- (void)webViewController:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5;
- (void)webViewControllerDidChangeLoadingState:(id)a3;
- (void)webViewControllerDidChangeURL:(id)a3;
- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3;
- (void)websiteDataStore:(id)a3 getDisplayedNotificationsForWorkerOrigin:(id)a4 completionHandler:(id)a5;
- (void)websiteDataStore:(id)a3 openWindow:(id)a4 fromServiceWorkerOrigin:(id)a5 completionHandler:(id)a6;
- (void)websiteDataStore:(id)a3 showNotification:(id)a4;
- (void)websiteDataStore:(id)a3 workerOrigin:(id)a4 updatedAppBadge:(id)a5;
@end

@implementation _SFWebAppServiceViewController

+ (id)serviceViewControllers
{
  if (serviceViewControllers_once != -1) {
    dispatch_once(&serviceViewControllers_once, &__block_literal_global_20);
  }
  v2 = (void *)serviceViewControllers_serviceViewControllers;

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC4F4A0];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC3D8F8];
}

- (BOOL)_clientIsWebApp
{
  v2 = [(_SFWebAppServiceViewController *)self _hostApplicationBundleIdentifier];
  char v3 = [v2 hasPrefix:@"com.apple.webapp"];

  return v3;
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_stateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SFWebAppServiceViewController;
  [(SFBrowserServiceViewController *)&v3 dealloc];
}

- (void)clearWebViewAndWebsiteDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(_SFBrowserContentViewController *)self webView];

  if (v5)
  {
    v6 = [(_SFBrowserContentViewController *)self webView];
    [v6 stopLoading];

    v7 = [(_SFBrowserContentViewController *)self webViewController];
    [v7 willMoveToParentViewController:0];
    v8 = [v7 view];
    [v8 removeFromSuperview];

    [v7 removeFromParentViewController];
  }
  v9 = [(_SFWebAppServiceViewController *)self websiteDataStore];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = *MEMORY[0x1E4FB2748];
  v10 = (void *)*MEMORY[0x1E4FB2608];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke;
  v19[3] = &unk_1E5C744F8;
  id v11 = v4;
  id v20 = v11;
  v21 = &v22;
  uint64_t v12 = [v10 beginBackgroundTaskWithName:@"com.apple.SafariViewService.deleteWebAppData" expirationHandler:v19];
  v23[3] = v12;
  [v9 _setCompletionHandlerForRemovalFromNetworkProcess:&__block_literal_global_129];
  v13 = objc_msgSend(MEMORY[0x1E4F46710], "safari_allDataTypes");
  v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_132;
  v16[3] = &unk_1E5C744F8;
  id v15 = v11;
  id v17 = v15;
  v18 = &v22;
  [v9 removeDataOfTypes:v13 modifiedSince:v14 completionHandler:v16];

  _Block_object_dispose(&v22, 8);
}

- (void)clearWebsiteDataWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() serviceViewControllers];
  v8 = [v7 objectForKey:v12];

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1F10] webClipWithIdentifier:v12];
    webClip = self->_webClip;
    self->_webClip = v10;

    v9 = self;
  }
  [(_SFWebAppServiceViewController *)v9 clearWebViewAndWebsiteDataWithCompletion:v6];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFWebAppServiceViewController *)&v8 viewDidLoad];
  [(SFBrowserServiceViewController *)self setDisplayMode:2];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  statusBarBackgroundView = self->_statusBarBackgroundView;
  self->_statusBarBackgroundView = v3;

  v5 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIView *)self->_statusBarBackgroundView setBackgroundColor:v5];

  id v6 = self->_statusBarBackgroundView;
  v7 = [(_SFBrowserContentViewController *)self browserView];
  [v7 setStatusBarBackgroundView:v6];
}

- (int64_t)preferredStatusBarStyle
{
  unint64_t v3 = [(_SFBrowserContentViewController *)self displayMode];
  int64_t result = 0;
  if (v3 <= 4 && ((1 << v3) & 0x16) != 0)
  {
    themeColor = self->_themeColor;
    if (themeColor)
    {
      if ([(UIColor *)themeColor safari_meetsThresholdForDarkAppearance])return 1; {
      else
      }
        return 3;
    }
    else
    {
      uint64_t v6 = [(UIWebClip *)self->_webClip webClipStatusBarStyle];
      return MEMORY[0x1F4166EF8](v6);
    }
  }
  return result;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  uint64_t v3 = [(UIWebClip *)self->_webClip webClipStatusBarStyle];
  if (v3 == 2)
  {
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_statusBarBackgroundView setBackgroundColor:v4];
  }
  else
  {
    [(_SFWebAppServiceViewController *)self _updateThemeColor];
    v5 = [(UIColor *)self->_themeColor colorWithAlphaComponent:1.0];
    if (!v5)
    {
      if ([(_SFWebAppServiceViewController *)self preferredStatusBarStyle]) {
        [MEMORY[0x1E4FB1618] blackColor];
      }
      else {
      v5 = [MEMORY[0x1E4FB1618] labelColor];
      }
    }
    uint64_t v6 = (void *)MEMORY[0x1E4FB1EB0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67___SFWebAppServiceViewController_setNeedsStatusBarAppearanceUpdate__block_invoke;
    v9[3] = &unk_1E5C72238;
    v9[4] = self;
    id v10 = v5;
    id v7 = v5;
    [v6 _animateUsingDefaultTimingWithOptions:50331648 animations:v9 completion:0];
  }
  [(_SFBrowserContentViewController *)self setWebViewLayoutUnderlapsStatusBar:v3 == 2];
  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFWebAppServiceViewController *)&v8 setNeedsStatusBarAppearanceUpdate];
}

- (void)_hostApplicationDidEnterBackground
{
  v6.receiver = self;
  v6.super_class = (Class)_SFWebAppServiceViewController;
  [(SFBrowserServiceViewController *)&v6 _hostApplicationDidEnterBackground];
  uint64_t v3 = [(WKWebsiteDataStore *)self->_websiteDataStore httpCookieStore];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(WKWebsiteDataStore *)self->_websiteDataStore httpCookieStore];
    [v5 _flushCookiesToDiskWithCompletionHandler:&__block_literal_global_145];
  }
}

- (void)webAppDidBecomeActive
{
  [(_SFWebAppServiceViewController *)self _showBlankViewWithAlertIfNeeded];
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
  {
    uint64_t v3 = [(_SFBrowserContentViewController *)self webViewController];
    char v4 = [v3 webView];
    [v4 _setPageMuted:0];
  }
  id v12 = [MEMORY[0x1E4F989B0] sharedManager];
  v5 = objc_opt_new();
  objc_super v6 = [(UIWebClip *)self->_webClip identifier];
  id v7 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  objc_super v8 = [v7 name];
  v9 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  id v10 = [v9 manifestId];
  id v11 = [v10 absoluteString];
  [v12 donateWebAppInFocusEventWithStarting:1 date:v5 webAppType:0 identifier:v6 name:v8 manifestId:v11];
}

- (void)webAppWillResignActive
{
  self->_mediaStateIconBeforeSuspension = [(_SFBrowserContentViewController *)self mediaStateIcon];
  uint64_t v3 = +[_SFWebAppMediaCaptureStatusBarManager sharedManager];
  [v3 cancelStatusBarOverride];

  char v4 = [MEMORY[0x1E4F989B0] sharedManager];
  v5 = objc_opt_new();
  objc_super v6 = [(UIWebClip *)self->_webClip identifier];
  id v7 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  objc_super v8 = [v7 name];
  v9 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  id v10 = [v9 manifestId];
  id v11 = [v10 absoluteString];
  [v4 donateWebAppInFocusEventWithStarting:0 date:v5 webAppType:0 identifier:v6 name:v8 manifestId:v11];

  if (self->_hasPendingDestroyScene)
  {
    id v12 = [(_SFWebAppServiceViewController *)self _remoteViewControllerProxy];
    [v12 destroyScene];
  }
}

- (void)_showBlankViewWithAlertIfNeeded
{
  [(UIWebClip *)self->_webClip _reloadProperties];
  uint64_t v3 = [(UIWebClip *)self->_webClip eligibilityStatus];
  if (v3)
  {
    uint64_t v4 = v3;
    containingAlertController = self->_containingAlertController;
    if (!containingAlertController)
    {
      objc_super v6 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
      id v7 = self->_containingAlertController;
      self->_containingAlertController = v6;

      [(UIViewController *)self->_containingAlertController setModalPresentationStyle:0];
      id v8 = objc_alloc(MEMORY[0x1E4FB1670]);
      v9 = [MEMORY[0x1E4FB1658] emptyConfiguration];
      id v10 = (void *)[v8 initWithConfiguration:v9];
      [(UIViewController *)self->_containingAlertController setView:v10];

      id v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      id v12 = [(UIViewController *)self->_containingAlertController view];
      [v12 setBackgroundColor:v11];

      containingAlertController = self->_containingAlertController;
    }
    v13 = [(UIViewController *)containingAlertController presentingViewController];

    if (!v13) {
      [(_SFBrowserContentViewController *)self presentViewController:self->_containingAlertController animated:0 completion:0];
    }
    if (!self->_alertController)
    {
      webClip = self->_webClip;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke;
      v20[3] = &unk_1E5C72678;
      v20[4] = self;
      id v15 = [(UIWebClip *)webClip eligibilityAlert:v20];
      alertController = self->_alertController;
      self->_alertController = v15;
    }
    if (v4 == 2)
    {
      v18 = (void *)MEMORY[0x1E4FA6CB8];
      v19 = [(UIWebClip *)self->_webClip identifier];
      [v18 launchWebClipWithIdentifier:v19];

      self->_hasPendingDestroyScene = 1;
    }
    else if (v4 == 1)
    {
      id v17 = [(UIAlertController *)self->_alertController presentingViewController];

      if (!v17) {
        [(UIViewController *)self->_containingAlertController presentViewController:self->_alertController animated:1 completion:0];
      }
    }
  }
}

- (void)webViewController:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void (**)(id, void))a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "requestNotificationPermissionForSecurityOrigin: Cannot get push placeholder bundle identifier from UIWebClip", buf, 2u);
    }
    v6[2](v6, 0);
  }
  id v8 = [(UIWebClip *)self->_webClip placeholderBundleIdentifier];
  v9 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    webClip = self->_webClip;
    id v11 = v9;
    id v12 = [(UIWebClip *)webClip identifier];
    *(_DWORD *)buf = 138543362;
    v18 = v12;
    _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Requesting push notification permission for Web Clip %{public}@", buf, 0xCu);
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke;
  v15[3] = &unk_1E5C74548;
  id v16 = v6;
  v14 = v6;
  [v13 requestAuthorizationWithOptions:7 completionHandler:v15];
}

- (void)webViewController:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v20 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v27) = 0;
    v21 = "Denied attempt to update app badge from a window object: Missing selector to verify script origin should be allowed";
    uint64_t v22 = v20;
    goto LABEL_13;
  }
  v9 = [(UIWebClip *)self->_webClip pageURL];
  char v10 = [v8 isSameSiteAsURL:v9];

  if (v10)
  {
    char v11 = objc_opt_respondsToSelector();
    id v12 = WBS_LOG_CHANNEL_PREFIXWebPush();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        webClip = self->_webClip;
        id v15 = v12;
        id v16 = [(UIWebClip *)webClip identifier];
        int v27 = 138543875;
        id v28 = v16;
        __int16 v29 = 2113;
        id v30 = v8;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_DEFAULT, "Web Clip with identifier '%{public}@', script from origin %{private}@ updated app badge count to %@", (uint8_t *)&v27, 0x20u);
      }
      id v17 = objc_alloc(MEMORY[0x1E4FB3398]);
      v18 = [(UIWebClip *)self->_webClip placeholderBundleIdentifier];
      uint64_t v19 = (void *)[v17 initWithBundleIdentifier:v18];

      [v19 setBadgeValue:v7];
      goto LABEL_14;
    }
    if (!v13) {
      goto LABEL_14;
    }
    LOWORD(v27) = 0;
    v21 = "Denied attempt to update app badge from a window object: Cannot get push placeholder bundle identifier from UIWebClip";
    uint64_t v22 = v12;
LABEL_13:
    _os_log_impl(&dword_1A690B000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, 2u);
    goto LABEL_14;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = self->_webClip;
    uint64_t v25 = v23;
    v26 = [(UIWebClip *)v24 pageURL];
    int v27 = 138478083;
    id v28 = v8;
    __int16 v29 = 2117;
    id v30 = v26;
    _os_log_impl(&dword_1A690B000, v25, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a window object: Script origin %{private}@ is a different site from Web Clip page URL %{sensitive}@", (uint8_t *)&v27, 0x16u);
  }
LABEL_14:
}

- (void)webViewControllerDidChangeLoadingState:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFWebAppServiceViewController;
  id v4 = a3;
  [(_SFBrowserContentViewController *)&v7 webViewControllerDidChangeLoadingState:v4];
  v5 = [(_SFWebAppServiceViewController *)self _remoteViewControllerProxy];
  uint64_t v6 = [v4 isLoading];

  [v5 didChangeLoadingState:v6];
}

- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFBrowserContentViewController *)&v5 webViewControllerDidFirstVisuallyNonEmptyLayout:a3];
  id v4 = [(_SFWebAppServiceViewController *)self _remoteViewControllerProxy];
  [v4 didFinishInitialLoad:1];
}

- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v9 request];
  id v12 = [v11 URL];

  uint64_t v13 = [v9 navigationType];
  v14 = [v9 targetFrame];
  if (v14)
  {
    id v15 = [v9 targetFrame];
    char v16 = [v15 isMainFrame];
  }
  else
  {
    char v16 = 1;
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v38[3] = &unk_1E5C74598;
  v38[4] = self;
  id v17 = v12;
  char v42 = v16;
  id v39 = v17;
  uint64_t v41 = v13;
  id v18 = v10;
  id v40 = v18;
  uint64_t v19 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v38);
  id v20 = [v9 request];
  v21 = [v20 valueForHTTPHeaderField:@"Referer"];

  id v36 = v8;
  uint64_t v22 = self;
  if (v21)
  {
    uint64_t v43 = *MEMORY[0x1E4F22370];
    v44[0] = v21;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  }
  else
  {
    uint64_t v35 = 0;
  }
  v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v24 = [v23 URLOverrideForURL:v17];

  uint64_t v25 = [v24 scheme];
  v26 = [v17 scheme];
  uint64_t v27 = [v25 caseInsensitiveCompare:v26];

  if (v27)
  {
    id v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    __int16 v29 = (void *)v35;
    [v28 openURL:v24 withOptions:v35];
  }
  else if ([v17 hasTelephonyScheme])
  {
    id v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v30 = (void *)MEMORY[0x1E4F1CB10];
    __int16 v31 = [v17 phoneNumber];
    id v32 = [v30 telephonyURLWithDestinationID:v31 promptUser:1];
    __int16 v29 = (void *)v35;
    [v28 openURL:v32 withOptions:v35];
  }
  else
  {
    if (([v17 isFaceTimeURL] & 1) == 0 && !objc_msgSend(v17, "isFaceTimeAudioURL"))
    {
      objc_msgSend(v9, "_sf_setAllowsExternalRedirectWithoutPrompting:", 1);
      v37.receiver = v22;
      v37.super_class = (Class)_SFWebAppServiceViewController;
      v34 = v36;
      [(_SFBrowserContentViewController *)&v37 webViewController:v36 decidePolicyForNavigationAction:v9 decisionHandler:v18];
      __int16 v29 = (void *)v35;
      goto LABEL_15;
    }
    id v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v33 = [MEMORY[0x1E4F1CB10] faceTimePromptURLWithURL:v17];
    __int16 v29 = (void *)v35;
    [v28 openURL:v33 withOptions:v35];
  }
  v19[2](v19, 0);
  v34 = v36;
LABEL_15:
}

- (BOOL)_isURLOutOfManifestScope:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 scope];
    if (v7)
    {
      if (objc_msgSend(v4, "safari_hasSameOriginAsURL:", v7))
      {
        id v8 = [v4 path];
        id v9 = [v7 path];
        int v10 = [v8 hasPrefix:v9] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_isURLOutOfLegacyScope:(id)a3 withLoginURLExempted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v9 = [(UIWebClip *)self->_webClip pageURL];
    int v10 = objc_msgSend(v9, "safari_absoluteStringWithoutFragment");

    char v11 = objc_msgSend(v6, "safari_absoluteStringWithoutFragment");
    char v12 = objc_msgSend(v11, "safari_isVisualDuplicateOfURLString:", v10);
    LOBYTE(v8) = (v4 | v12) ^ 1;
    if (v4 && (v12 & 1) == 0)
    {
      if (objc_msgSend(v11, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", v10))
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        uint64_t v13 = [(_SFBrowserContentViewController *)self webViewController];
        v14 = [v13 webView];
        id v15 = [v14 URL];
        char v16 = [v15 absoluteString];
        int v8 = objc_msgSend(v11, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", v16) ^ 1;
      }
    }
  }
  return v8;
}

- (BOOL)_isURLOutOfScope:(id)a3 withLoginURLExempted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(UIWebClip *)self->_webClip ignoreManifestScope] & 1) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(_SFWebAppServiceViewController *)self _isURLOutOfManifestScope:v6]
      || [(_SFWebAppServiceViewController *)self _isURLOutOfLegacyScope:v6 withLoginURLExempted:v4];
  }

  return v7;
}

- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFBrowserContentViewController *)&v6 webViewController:a3 didFailProvisionalNavigation:a4 withError:a5];
  [(_SFWebAppServiceViewController *)self _loadNextFallbackURL];
}

- (void)webViewController:(id)a3 didFinishNavigation:(id)a4
{
  fallbackURLs = self->_fallbackURLs;
  self->_fallbackURLs = 0;
  id v7 = a4;
  id v8 = a3;

  v9.receiver = self;
  v9.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFBrowserContentViewController *)&v9 webViewController:v8 didFinishNavigation:v7];

  [(_SFWebAppServiceViewController *)self _fetchApplicationManifestIfNeeded];
  [(_SFWebAppServiceViewController *)self _updateDisplayMode];
}

- (void)webViewControllerDidChangeURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFBrowserContentViewController *)&v4 webViewControllerDidChangeURL:a3];
  [(_SFWebAppServiceViewController *)self _updateDisplayMode];
}

- (void)_updateDisplayMode
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self webViewController];
  objc_super v4 = [(_SFBrowserContentViewController *)self rootWebViewController];
  objc_super v5 = [v3 webView];
  objc_super v6 = [v5 URL];

  BOOL v7 = [(_SFBrowserContentViewController *)self isShowingErrorPage];
  BOOL v8 = [(_SFWebAppServiceViewController *)self _isURLOutOfScope:v6 withLoginURLExempted:0];
  BOOL v9 = v8;
  uint64_t v10 = 2;
  if (v7) {
    uint64_t v10 = 3;
  }
  if (v8) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  [(SFBrowserServiceViewController *)self setDisplayMode:v11];
  if (v3 != v4 || v9 || v7)
  {
    if (v3 == v4)
    {
      uint64_t v13 = [v3 webView];
      v14 = [v13 backForwardList];
      id v15 = [v14 backList];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52___SFWebAppServiceViewController__updateDisplayMode__block_invoke;
      v19[3] = &unk_1E5C745C0;
      void v19[4] = self;
      BOOL v21 = v7;
      id v20 = v6;
      int v16 = objc_msgSend(v15, "safari_containsObjectPassingTest:", v19);

      uint64_t v12 = v16 ^ 1u;
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v17 = [(_SFBrowserContentViewController *)self browserView];
    id v18 = [v17 navigationBar];

    [v18 setDismissButtonHidden:v12];
  }
}

- (BOOL)canPrint
{
  return ![(_SFBrowserContentViewController *)self isBlockedByScreenTime];
}

- (id)websiteDataStoreConfigurationWithWebClipIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F467D8]);
  objc_super v6 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v7 = [MEMORY[0x1E4FB1F10] pathForWebClipStorageWithIdentifier:v4];
  BOOL v8 = [v6 fileURLWithPath:v7];

  BOOL v9 = [v8 URLByAppendingPathComponent:@"Default" isDirectory:1];
  [v5 _setWebStorageDirectory:v8];
  [v5 _setWebSQLDatabaseDirectory:v8];
  uint64_t v10 = [v5 _webSQLDatabaseDirectory];
  uint64_t v11 = [v10 URLByAppendingPathComponent:@"___IndexedDB"];
  [v5 _setIndexedDBDatabaseDirectory:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = [v8 URLByDeletingLastPathComponent];
  v14 = [v13 path];
  id v15 = [v14 stringByAppendingPathComponent:@"Cookies"];
  int v16 = [v15 stringByAppendingPathComponent:@"/Cookies.binarycookies"];
  id v17 = [v12 fileURLWithPath:v16 isDirectory:0];
  [v5 _setCookieStorageFile:v17];

  [v5 _setResourceLoadStatisticsDirectory:v8];
  [v5 setSourceApplicationBundleIdentifier:@"com.apple.mobilesafari"];
  if (objc_opt_respondsToSelector())
  {
    id v18 = [(_SFWebAppServiceViewController *)self _canonicalPageURL];
    [v5 setStandaloneApplicationURL:v18];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setAlternativeServicesStorageDirectory:v8];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setHSTSStorageDirectory:v8];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setGeneralStorageDirectory:v9];
  }
  [v5 _setCacheStorageDirectory:v8];
  [v5 _setServiceWorkerRegistrationDirectory:v8];
  uint64_t v19 = [v8 URLByAppendingPathComponent:@"NetworkCache" isDirectory:1];
  [v5 setNetworkCacheDirectory:v19];

  id v20 = [v8 URLByAppendingPathComponent:@"OfflineWebApplicationCache" isDirectory:1];
  [v5 setApplicationCacheDirectory:v20];

  BOOL v21 = [v8 URLByAppendingPathComponent:@"MediaCache" isDirectory:1];
  [v5 setMediaCacheDirectory:v21];

  uint64_t v22 = [v8 URLByAppendingPathComponent:@"MediaKeys" isDirectory:1];
  [v5 setMediaKeysStorageDirectory:v22];

  [v5 setWebPushMachServiceName:@"com.apple.webkit.webpushd.service"];
  if (objc_opt_respondsToSelector()) {
    [v5 setWebPushPartitionString:v4];
  }

  return v5;
}

- (id)createWebsiteDataStoreForWebClipIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F46710];
  id v5 = [(_SFWebAppServiceViewController *)self websiteDataStoreConfigurationWithWebClipIdentifier:a3];
  objc_super v6 = objc_msgSend(v4, "safari_dataStoreWithConfiguration:", v5);

  objc_msgSend(v6, "set_delegate:", self);
  if (objc_opt_respondsToSelector())
  {
    BOOL v7 = objc_opt_new();
    [(_SFWebAppServiceViewController *)self setupPreferences:v7];
    [v6 _setServiceWorkerOverridePreferences:v7];
  }
  BOOL v8 = [(UIWebClip *)self->_webClip _sf_stagedCookiesURL];
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F98A80] sharedController];
    [v12 copyCookiesFromFolderAtURL:v8 intoDataStore:v6];
  }

  return v6;
}

- (id)websiteDataStore
{
  websiteDataStore = self->_websiteDataStore;
  if (!websiteDataStore)
  {
    id v4 = [(UIWebClip *)self->_webClip identifier];
    id v5 = [(_SFWebAppServiceViewController *)self createWebsiteDataStoreForWebClipIdentifier:v4];
    objc_super v6 = self->_websiteDataStore;
    self->_websiteDataStore = v5;

    websiteDataStore = self->_websiteDataStore;
  }

  return websiteDataStore;
}

- (void)setupPreferences:(id)a3
{
  id v3 = a3;
  [v3 _setStandalone:1];
  [v3 _setNotificationsEnabled:1];
  [v3 _setPushAPIEnabled:1];
  [v3 _setNotificationEventEnabled:1];
  [v3 _setAppBadgeEnabled:1];
}

- (id)webViewConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  id v3 = [(_SFBrowserContentViewController *)&v8 webViewConfiguration];
  [v3 setIgnoresViewportScaleLimits:0];
  id v4 = [v3 preferences];
  [(_SFWebAppServiceViewController *)self setupPreferences:v4];

  id v5 = [(_SFWebAppServiceViewController *)self websiteDataStore];
  [v3 setWebsiteDataStore:v5];

  objc_super v6 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  [v3 _setApplicationManifest:v6];

  return v3;
}

- (void)_setCurrentWebViewController:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SFWebAppServiceViewController;
  [(_SFBrowserContentViewController *)&v7 _setCurrentWebViewController:v4];
  if (v4)
  {
    id v5 = [v4 webView];
    [v5 setAllowsLinkPreview:0];
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithRed:0.360784314 green:0.388235294 blue:0.403921569 alpha:1.0];
    [v5 setBackgroundColor:v6];

    [(_SFWebAppServiceViewController *)self _updateDisplayMode];
  }
}

- (BOOL)_usesScrollToTopView
{
  return 1;
}

- (id)processPool
{
  processPool = self->_processPool;
  if (!processPool)
  {
    id v4 = [(_SFBrowserContentViewController *)self newProcessPool];
    id v5 = self->_processPool;
    self->_processPool = v4;

    processPool = self->_processPool;
  }

  return processPool;
}

- (void)_initialLoadFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_fallbackURLs count])
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFWebAppServiceViewController;
    [(_SFBrowserContentViewController *)&v5 _initialLoadFinishedWithSuccess:v3];
  }
}

- (int64_t)_persona
{
  return 3;
}

- (void)navigationBarDoneButtonWasTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SFBrowserContentViewController *)self webViewController];
  objc_super v6 = [(_SFBrowserContentViewController *)self rootWebViewController];

  if (v5 == v6)
  {
    objc_super v7 = [v5 webView];
    objc_super v8 = [v7 backForwardList];
    BOOL v9 = [v8 backList];
    uint64_t v10 = [v9 reverseObjectEnumerator];
    int v11 = [v10 allObjects];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67___SFWebAppServiceViewController_navigationBarDoneButtonWasTapped___block_invoke;
    v15[3] = &unk_1E5C745E8;
    void v15[4] = self;
    uint64_t v12 = objc_msgSend(v11, "safari_firstObjectPassingTest:", v15);
    if (v12)
    {
      uint64_t v13 = [v5 webView];
      id v14 = (id)[v13 goToBackForwardListItem:v12];
    }
    else
    {
      [v4 setDismissButtonHidden:1];
    }
  }
  else
  {
    [(_SFBrowserContentViewController *)self _goBackToOwnerWebView];
  }
}

- (void)loadWebAppWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFWebAppServiceViewController *)self _clientIsWebApp])
  {
    objc_initWeak(&location, self);
    [(_SFBrowserContentViewController *)self setStoreBannersAreDisabled:1];
    objc_super v5 = [MEMORY[0x1E4FB1F10] webClipWithIdentifier:v4];
    webClip = self->_webClip;
    self->_webClip = v5;

    [(_SFWebAppServiceViewController *)self _showBlankViewWithAlertIfNeeded];
    objc_super v7 = (void *)MEMORY[0x1E4F1C9B8];
    objc_super v8 = [(UIWebClip *)self->_webClip _sf_applicationManifestPath];
    BOOL v9 = [v7 dataWithContentsOfURL:v8];

    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];

    [(UIWebClip *)self->_webClip _sf_setApplicationManifest:v10];
    if (objc_opt_respondsToSelector())
    {
      int v11 = (id)WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(UIWebClip *)self->_webClip bundleVersion];
        *(_DWORD *)buf = 138543618;
        id v28 = v4;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Loading UIWebClip with identifier '%{public}@'; version: %lu",
          buf,
          0x16u);
      }
    }
    else
    {
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v4;
        _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEFAULT, "Loading UIWebClip with identifier '%{public}@'; unable to get version information",
          buf,
          0xCu);
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([(UIWebClip *)self->_webClip ensurePlaceholderBundle] & 1) == 0)
    {
      id v14 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(_SFWebAppServiceViewController *)(uint64_t)v4 loadWebAppWithIdentifier:v15];
      }
    }
    [(_SFBrowserContentViewController *)self setSafariDataSharingMode:2];
    int v16 = [(UIWebClip *)self->_webClip pageURL];
    [(_SFWebAppServiceViewController *)self _loadWebClipPageURL:v16];

    id v17 = [(id)objc_opt_class() serviceViewControllers];
    [v17 setObject:self forKey:v4];

    [(_SFWebAppServiceViewController *)self setNeedsStatusBarAppearanceUpdate];
    id v18 = objc_alloc(MEMORY[0x1E4F4E278]);
    uint64_t v19 = [(_SFWebAppServiceViewController *)self _hostApplicationBundleIdentifier];
    v26 = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    BOOL v21 = (BKSApplicationStateMonitor *)[v18 initWithBundleIDs:v20 states:40];
    stateMonitor = self->_stateMonitor;
    self->_stateMonitor = v21;

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke;
    v23[3] = &unk_1E5C73AE8;
    objc_copyWeak(&v24, &location);
    [(BKSApplicationStateMonitor *)self->_stateMonitor setHandler:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (id)placeholderBundleIdentifierForDataStore:(id)a3
{
  BOOL v3 = NSString;
  id v4 = [a3 _webPushPartition];
  objc_super v5 = [v3 stringWithFormat:@"com.apple.WebKit.PushBundle.%@", v4];

  return v5;
}

- (id)notificationPermissionsForWebsiteDataStore:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F44680]);
  objc_super v6 = [(_SFWebAppServiceViewController *)self placeholderBundleIdentifierForDataStore:v4];
  objc_super v7 = (void *)[v5 initWithBundleIdentifier:v6];

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__2;
  uint64_t v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  BOOL v9 = dispatch_get_global_queue(33, 0);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  id v32 = __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke;
  uint64_t v33 = &unk_1E5C74418;
  id v10 = v7;
  id v34 = v10;
  id v36 = &v37;
  int v11 = v8;
  uint64_t v35 = v11;
  dispatch_async(v9, &v30);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v12 = objc_msgSend((id)v38[5], "authorizationStatus", v30, v31, v32, v33);
  uint64_t v13 = self->_webClip;
  id v14 = [(UIWebClip *)v13 identifier];
  uint64_t v15 = [v4 _webPushPartition];
  char v16 = [v14 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x1E4FB1F10];
    id v18 = [v4 _webPushPartition];
    uint64_t v19 = [v17 webClipWithIdentifier:v18];

    uint64_t v13 = (UIWebClip *)v19;
  }
  id v20 = [(UIWebClip *)v13 pageURL];
  BOOL v21 = [v20 absoluteString];
  uint64_t v22 = [v20 scheme];
  BOOL v23 = [v22 length] == 0;

  if (v23)
  {
    id v24 = objc_msgSend(v20, "safari_originalDataAsString");
    uint64_t v25 = objc_msgSend(v24, "_web_bestURLForUserTypedString");
    uint64_t v26 = [v25 absoluteString];

    BOOL v21 = (void *)v26;
  }
  uint64_t v43 = v21;
  uint64_t v27 = [NSNumber numberWithBool:v12 == 2];
  v44[0] = v27;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];

  _Block_object_dispose(&v37, 8);

  return v28;
}

- (void)websiteDataStore:(id)a3 showNotification:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    id v10 = [v6 _webPushPartition];
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v10;
    _os_log_impl(&dword_1A690B000, v9, OS_LOG_TYPE_DEFAULT, "About to show push notification with targetContentIdentifier %{public}@", buf, 0xCu);
  }
  int v11 = objc_opt_new();
  [v11 setDefaultActionBundleIdentifier:@"com.apple.webapp"];
  uint64_t v12 = [v6 _webPushPartition];
  [v11 setTargetContentIdentifier:v12];

  uint64_t v13 = [v7 title];
  [v11 setTitle:v13];

  id v14 = [v7 body];
  [v11 setBody:v14];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 alert] != 1)
  {
    uint64_t v15 = [MEMORY[0x1E4F44640] defaultSound];
    [v11 setSound:v15];
  }
  char v16 = self->_webClip;
  id v17 = [(UIWebClip *)v16 identifier];
  id v18 = [v6 _webPushPartition];
  char v19 = [v17 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    id v20 = (void *)MEMORY[0x1E4FB1F10];
    BOOL v21 = [v6 _webPushPartition];
    uint64_t v22 = [v20 webClipWithIdentifier:v21];

    char v16 = (UIWebClip *)v22;
  }
  BOOL v23 = [(UIWebClip *)v16 title];
  if (![v23 length])
  {
    id v24 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_SFWebAppServiceViewController websiteDataStore:showNotification:](v24);
    }
    uint64_t v25 = [v7 origin];

    BOOL v23 = (void *)v25;
  }
  uint64_t v26 = NSString;
  uint64_t v27 = _WBSLocalizedString();
  id v28 = objc_msgSend(v26, "stringWithFormat:", v27, v23);
  [v11 setSubtitle:v28];

  __int16 v29 = [v7 userInfo];
  [v11 setUserInfo:v29];

  uint64_t v30 = [(_SFWebAppServiceViewController *)self placeholderBundleIdentifierForDataStore:v6];
  uint64_t v31 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:v30];
  [v11 setIcon:v31];

  id v32 = (void *)MEMORY[0x1E4F44628];
  uint64_t v33 = [v7 identifier];
  id v34 = [v32 requestWithIdentifier:v33 content:v11 trigger:0];

  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v30];
  [v35 addNotificationRequest:v34 withCompletionHandler:&__block_literal_global_262];
}

- (void)websiteDataStore:(id)a3 getDisplayedNotificationsForWorkerOrigin:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  dispatch_semaphore_t v8 = [(_SFWebAppServiceViewController *)self placeholderBundleIdentifierForDataStore:a3];
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110___SFWebAppServiceViewController_websiteDataStore_getDisplayedNotificationsForWorkerOrigin_completionHandler___block_invoke;
  v11[3] = &unk_1E5C72BA8;
  id v12 = v7;
  id v10 = v7;
  [v9 getDeliveredNotificationsWithCompletionHandler:v11];
}

- (void)websiteDataStore:(id)a3 openWindow:(id)a4 fromServiceWorkerOrigin:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  BOOL v9 = (void (**)(id, void *))a6;
  if (objc_msgSend(v8, "safari_isEligibleToBeOpenedByServiceWorkers"))
  {
    id v10 = [(_SFWebAppServiceViewController *)self webViewConfiguration];
    int v11 = [(_SFBrowserContentViewController *)self _openNewWebViewIfNeededWithConfiguration:v10 forNavigationAction:0];

    if (v11)
    {
      id v12 = [MEMORY[0x1E4F18DA8] requestWithURL:v8];
      [(_SFBrowserContentViewController *)self loadRequest:v12];
    }
    v9[2](v9, v11);
  }
  else
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14[0] = 0;
      _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_INFO, "Web push notification URL is ineligible to be opened", (uint8_t *)v14, 2u);
    }
    v9[2](v9, 0);
  }
}

- (void)websiteDataStore:(id)a3 workerOrigin:(id)a4 updatedAppBadge:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    int v11 = self->_webClip;
    id v12 = [(UIWebClip *)v11 identifier];
    uint64_t v13 = [v8 _webPushPartition];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4FB1F10];
      char v16 = [v8 _webPushPartition];
      uint64_t v17 = [v15 webClipWithIdentifier:v16];

      int v11 = (UIWebClip *)v17;
    }
    id v18 = [(UIWebClip *)v11 pageURL];
    char v19 = [v9 isSameSiteAsURL:v18];

    if (v19)
    {
      char v20 = objc_opt_respondsToSelector();
      BOOL v21 = WBS_LOG_CHANNEL_PREFIXWebPush();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          BOOL v23 = v21;
          id v24 = [v8 _webPushPartition];
          int v32 = 138412803;
          id v33 = v24;
          __int16 v34 = 2113;
          id v35 = v9;
          __int16 v36 = 2112;
          id v37 = v10;
          _os_log_impl(&dword_1A690B000, v23, OS_LOG_TYPE_DEFAULT, "Web clip with identifier '%@' worker from origin %{private}@ updated app badge count to %@", (uint8_t *)&v32, 0x20u);
        }
        id v25 = objc_alloc(MEMORY[0x1E4FB3398]);
        uint64_t v26 = [(UIWebClip *)v11 placeholderBundleIdentifier];
        uint64_t v27 = (void *)[v25 initWithBundleIdentifier:v26];

        [v27 setBadgeValue:v10];
      }
      else if (v22)
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1A690B000, v21, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Cannot get push placeholder bundle identifier from UIWebClip", (uint8_t *)&v32, 2u);
      }
    }
    else
    {
      __int16 v29 = WBS_LOG_CHANNEL_PREFIXWebPush();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v29;
        uint64_t v31 = [(UIWebClip *)v11 pageURL];
        int v32 = 138478083;
        id v33 = v9;
        __int16 v34 = 2117;
        id v35 = v31;
        _os_log_impl(&dword_1A690B000, v30, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Worker origin %{private}@ is a different site from Web Clip page URL %{sensitive}@", (uint8_t *)&v32, 0x16u);
      }
    }
  }
  else
  {
    id v28 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1A690B000, v28, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Missing selector to verify worker script origin should be allowed", (uint8_t *)&v32, 2u);
    }
  }
}

- (void)processWebPushForWebAppWithIdentifier:(id)a3
{
  v32[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"%s for %@", "-[_SFWebAppServiceViewController processWebPushForWebAppWithIdentifier:]", v4];
  id v6 = (void *)*MEMORY[0x1E4FB2608];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke;
  v26[3] = &unk_1E5C724D8;
  id v7 = v4;
  id v27 = v7;
  uint64_t v8 = [v6 beginBackgroundTaskWithName:v5 expirationHandler:v26];
  id v9 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A690B000, v9, OS_LOG_TYPE_DEFAULT, "Processing push for Web clip with identifier: '%@'", (uint8_t *)&buf, 0xCu);
  }
  if (self->_webClip)
  {
    id v10 = [(_SFWebAppServiceViewController *)self websiteDataStore];
  }
  else
  {
    id v10 = 0;
  }
  int v11 = [v10 _webPushPartition];
  char v12 = [v11 isEqualToString:v7];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [(_SFWebAppServiceViewController *)self createWebsiteDataStoreForWebClipIdentifier:v7];

    id v10 = (void *)v13;
  }
  char v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  if (objc_opt_respondsToSelector())
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3042000000;
    uint64_t v30 = __Block_byref_object_copy__271;
    uint64_t v31 = __Block_byref_object_dispose__272;
    v32[0] = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_273;
    v22[3] = &unk_1E5C74638;
    BOOL v23 = v14;
    p_long long buf = &buf;
    id v15 = v10;
    id v24 = v15;
    char v16 = (void *)MEMORY[0x1AD0C36A0](v22);
    objc_storeWeak((id *)(*((void *)&buf + 1) + 40), v16);
    getAndProcessPendingPushMessage(v15, v16);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v32);
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_2;
    v19[3] = &unk_1E5C72B40;
    char v20 = v14;
    id v21 = v10;
    [v21 _getPendingPushMessages:v19];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_281;
  block[3] = &unk_1E5C722D8;
  block[4] = self;
  block[5] = v8;
  uint64_t v17 = self;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
}

- (void)handlePushNotificationActivation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  webClip = self->_webClip;
  id v5 = a3;
  id v6 = [(UIWebClip *)webClip identifier];
  id v7 = [NSString stringWithFormat:@"%s for %@", "-[_SFWebAppServiceViewController handlePushNotificationActivation:]", v6];
  uint64_t v8 = (void *)*MEMORY[0x1E4FB2608];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke;
  v19[3] = &unk_1E5C724D8;
  id v9 = v6;
  id v20 = v9;
  uint64_t v10 = [v8 beginBackgroundTaskWithName:v7 expirationHandler:v19];
  int v11 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Processing push notification activation for Web clip with identifier: '%@'", buf, 0xCu);
  }
  char v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  uint64_t v13 = [(_SFWebAppServiceViewController *)self websiteDataStore];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_282;
  v17[3] = &unk_1E5C72678;
  id v18 = v12;
  char v14 = v12;
  [v13 _processPersistentNotificationClick:v5 completionHandler:v17];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_283;
  block[3] = &unk_1E5C722D8;
  block[4] = self;
  block[5] = v10;
  id v15 = self;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
}

- (void)_handleHostStateUpdate:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F4E248]];
  unsigned int v5 = [v4 unsignedIntValue];

  unsigned int hostState = self->_hostState;
  if (v5 == 8 && hostState != 8)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = v9;
    int v11 = @"_UIViewServiceHostWillEnterForegroundNotification";
LABEL_11:
    [v9 postNotificationName:v11 object:self];

    goto LABEL_12;
  }
  if (v5 == 32 && hostState != 32)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = v9;
    int v11 = @"_UIViewServiceHostDidEnterBackgroundNotification";
    goto LABEL_11;
  }
LABEL_12:
  self->_unsigned int hostState = v5;
}

- (id)_canonicalPageURL
{
  v2 = [(UIWebClip *)self->_webClip pageURL];
  BOOL v3 = [v2 scheme];

  if (!v3)
  {
    id v4 = objc_msgSend(v2, "safari_originalDataAsString");
    uint64_t v5 = objc_msgSend(v4, "_web_bestURLForUserTypedString");

    v2 = (void *)v5;
  }
  id v6 = objc_msgSend(v2, "_webkit_canonicalize");

  return v6;
}

- (void)_loadWebClipPageURL:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFBrowserContentViewController *)self browserView];
  [v4 setContentReadyForDisplay];

  uint64_t v5 = [v11 scheme];

  if (v5)
  {
    id v6 = objc_msgSend(v11, "_webkit_canonicalize");
    [(SFBrowserServiceViewController *)self loadURL:v6];
  }
  else
  {
    id v7 = objc_msgSend(v11, "safari_originalDataAsString");
    uint64_t v8 = objc_msgSend(v7, "_web_possibleURLsForUserTypedString");
    id v6 = (void *)[v8 mutableCopy];

    if ([v6 count])
    {
      if ((unint64_t)[v6 count] >= 2)
      {
        id v9 = [v6 firstObject];
        [v6 addObject:v9];
      }
      objc_storeStrong((id *)&self->_fallbackURLs, v6);
      [(_SFWebAppServiceViewController *)self _loadNextFallbackURL];
    }
    else
    {
      uint64_t v10 = objc_msgSend(v11, "_webkit_canonicalize");
      [(SFBrowserServiceViewController *)self loadURL:v10];
    }
  }
}

- (void)_loadNextFallbackURL
{
  id v3 = [(NSMutableArray *)self->_fallbackURLs firstObject];
  if (v3)
  {
    [(NSMutableArray *)self->_fallbackURLs removeObjectAtIndex:0];
    [(SFBrowserServiceViewController *)self loadURL:v3];
  }
}

- (BOOL)canOverrideStatusBar
{
  return [(_SFBrowserContentViewController *)self displayMode] != 0;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if ([(_SFBrowserContentViewController *)self mediaStateIcon] != a3)
  {
    if ([(_SFBrowserContentViewController *)self mediaStateIcon] == 1)
    {
      BOOL v5 = a3 - 1 < 2;
      BOOL v6 = 1;
    }
    else
    {
      unint64_t v7 = [(_SFBrowserContentViewController *)self mediaStateIcon];
      BOOL v5 = a3 - 1 < 2;
      BOOL v6 = v7 == 2;
      if (v7 != 2 && a3 - 1 <= 1)
      {
        uint64_t v8 = +[_SFWebAppMediaCaptureStatusBarManager sharedManager];
        [v8 recordingDocumentDidBeginMediaCapture:self audioOnly:a3 == 1];
        goto LABEL_10;
      }
    }
    if (v5 || !v6) {
      goto LABEL_11;
    }
    uint64_t v8 = +[_SFWebAppMediaCaptureStatusBarManager sharedManager];
    [v8 recordingDocumentDidEndMediaCapture:self];
LABEL_10:

LABEL_11:
    v9.receiver = self;
    v9.super_class = (Class)_SFWebAppServiceViewController;
    [(_SFBrowserContentViewController *)&v9 setMediaStateIcon:a3];
  }
}

- (NSString)URLString
{
  v2 = [(_SFBrowserContentViewController *)self webView];
  id v3 = [v2 URL];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (void)muteMediaCapture
{
  [(_SFBrowserContentViewController *)self mediaStateIcon];
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
  {
    id v3 = [(_SFBrowserContentViewController *)self webViewController];
    id v4 = [v3 webView];
    [v4 _setPageMuted:2];

    [(_SFBrowserContentViewController *)self mediaStateIcon];
    uint64_t v5 = _SFMediaStateIconMutedVariant();
    v6.receiver = self;
    v6.super_class = (Class)_SFWebAppServiceViewController;
    [(_SFBrowserContentViewController *)&v6 setMediaStateIcon:v5];
  }
}

- (BOOL)audioOnly
{
  return [(_SFBrowserContentViewController *)self mediaStateIcon] == 1;
}

- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(_SFBrowserContentViewController *)self mediaStateIcon];
  uint64_t v5 = _WBSLocalizedString();
  objc_super v6 = _WBSLocalizedString();
  unint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  objc_super v9 = _WBSLocalizedString();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E5C74688;
  id v10 = v4;
  id v19 = v10;
  id v11 = [v8 actionWithTitle:v9 style:0 handler:v18];
  [v7 addAction:v11];

  char v12 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v13 = _WBSLocalizedString();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E5C74688;
  id v17 = v10;
  id v14 = v10;
  id v15 = [v12 actionWithTitle:v13 style:1 handler:v16];
  [v7 addAction:v15];

  [(_SFBrowserContentViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_fetchApplicationManifestIfNeeded
{
  id v3 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
  if (v3)
  {
  }
  else if (!self->_applicationManifestFetcher)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x1E4F98960]);
    uint64_t v5 = [(_SFBrowserContentViewController *)self webViewController];
    objc_super v6 = [v5 webView];
    unint64_t v7 = (WBSApplicationManifestFetcher *)[v4 initWithWebView:v6];
    applicationManifestFetcher = self->_applicationManifestFetcher;
    self->_applicationManifestFetcher = v7;

    objc_super v9 = self->_applicationManifestFetcher;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke;
    v20[3] = &unk_1E5C746B0;
    objc_copyWeak(&v21, &location);
    [(WBSApplicationManifestFetcher *)v9 getApplicationManifestWithCompletionHandler:v20];
    if (![(UIWebClip *)self->_webClip webClipStatusBarStyle]
      && !self->_activityJSController
      && !self->_webClipMetadataFetcher)
    {
      id v10 = [_SFInjectedJavaScriptController alloc];
      id v11 = [(_SFBrowserContentViewController *)self webViewController];
      char v12 = [v11 webView];
      uint64_t v13 = [(_SFInjectedJavaScriptController *)v10 initWithWebView:v12];
      activityJSController = self->_activityJSController;
      self->_activityJSController = v13;

      id v15 = [[_SFWebClipMetadataFetcher alloc] initWithInjectedJavascriptController:self->_activityJSController];
      webClipMetadataFetcher = self->_webClipMetadataFetcher;
      self->_webClipMetadataFetcher = v15;

      id v17 = self->_webClipMetadataFetcher;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke_2;
      v18[3] = &unk_1E5C746D8;
      objc_copyWeak(&v19, &location);
      [(_SFWebClipMetadataFetcher *)v17 fetchMetadataWithConsumer:v18];
      objc_destroyWeak(&v19);
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_updateThemeColor
{
  if (!self->_updatingThemeColor)
  {
    self->_updatingThemeColor = 1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F98E00]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51___SFWebAppServiceViewController__updateThemeColor__block_invoke;
    v8[3] = &unk_1E5C724D8;
    v8[4] = self;
    [v3 setHandler:v8];
    int64_t v4 = [(_SFBrowserContentViewController *)self displayMode];
    if (v4 != 3 && v4)
    {
      objc_super v6 = [(_SFBrowserContentViewController *)self webViewController];
      themeColor = [v6 webView];

      if (themeColor)
      {
        unint64_t v7 = [MEMORY[0x1E4F98F20] updateThemeColorForWebView:themeColor darkModeEnabled:0 allowFallbackColors:0 updateUnderPageBackgroundColor:1];
      }
      else
      {
        unint64_t v7 = 0;
      }
      objc_storeStrong((id *)&self->_themeColor, v7);
      if (themeColor) {
    }
      }
    else
    {
      themeColor = self->_themeColor;
      self->_themeColor = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAlertController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_websiteDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);

  objc_storeStrong((id *)&self->_webClip, 0);
}

- (void)loadWebAppWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a2, a3, "Fail to create placeholder bundle for UIWebClip with identifier: '%{public}@'.", (uint8_t *)&v3);
}

- (void)websiteDataStore:(os_log_t)log showNotification:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Web App title for notification source is empty. Falling back to notification source URL", v1, 2u);
}

@end