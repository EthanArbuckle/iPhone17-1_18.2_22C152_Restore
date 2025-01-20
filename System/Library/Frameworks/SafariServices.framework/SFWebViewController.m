@interface SFWebViewController
- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4;
- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4;
- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4;
- (BOOL)didFirstPaint;
- (BOOL)didFirstVisuallyNonEmptyLayout;
- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3;
- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3;
- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3;
- (BOOL)hasFocusedInputFieldOnCurrentPage;
- (BOOL)hasFormControlInteraction;
- (BOOL)isLoading;
- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3;
- (BOOL)sfWebViewCanPromptForAccountSecurityRecommendation;
- (BOOL)sfWebViewShouldFillStringForFind:(id)a3;
- (NSString)alphanumericStrongPassword;
- (NSString)currentStrongPassword;
- (NSString)defaultStrongPassword;
- (NSURL)url;
- (NSUUID)UUID;
- (NSUUID)tabIDForAutoFill;
- (SFDialogController)dialogController;
- (SFWebViewController)initWithWebViewConfiguration:(id)a3 contentBlockerManager:(id)a4;
- (SFWebViewControllerDelegate)delegate;
- (WKWebView)webView;
- (WKWebViewConfiguration)webViewConfiguration;
- (_SFAuthenticationContext)autoFillAuthenticationContext;
- (_SFFormAutoFillController)autoFillController;
- (id)_presentingViewControllerForWebView:(id)a3;
- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4;
- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3;
- (id)currentSavedAccountContextForFormAutoFillController:(id)a3;
- (id)formAutoFillControllerURLForFormAutoFill:(id)a3;
- (id)permissionDialogThrottler;
- (id)sfWebView:(id)a3 didStartDownload:(id)a4;
- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4;
- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4;
- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4;
- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4;
- (unint64_t)autoFillFormType;
- (void)_automaticPasswordInputViewAutoFillContextProviderRequiredNotification:(id)a3;
- (void)_automaticPasswordInputViewNotification:(id)a3;
- (void)_loadWebView;
- (void)_loadWebViewIfNeeded;
- (void)_userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3;
- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4;
- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5;
- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4;
- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7;
- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4;
- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4;
- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4;
- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4;
- (void)_webView:(id)a3 didStartInputSession:(id)a4;
- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5;
- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5;
- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)_webView:(id)a3 printFrame:(id)a4;
- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6;
- (void)_webView:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5;
- (void)_webView:(id)a3 requestPresentingViewControllerWithCompletionHandler:(id)a4;
- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7;
- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5;
- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5;
- (void)_webView:(id)a3 willPerformClientRedirectToURL:(id)a4 delay:(double)a5;
- (void)_webView:(id)a3 willStartInputSession:(id)a4;
- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6;
- (void)_webViewDidCancelClientRedirect:(id)a3;
- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)_webViewDidEnterFullscreen:(id)a3;
- (void)_webViewDidExitElementFullscreen:(id)a3;
- (void)_webViewDidExitFullscreen:(id)a3;
- (void)_webViewDidShowSafeBrowsingWarning:(id)a3;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3;
- (void)copyCurrentStrongPassword;
- (void)dealloc;
- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)dialogController:(id)a3 willPresentDialog:(id)a4;
- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3;
- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4;
- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performPageLevelAutoFill;
- (void)presentDialog:(id)a3 sender:(id)a4;
- (void)reloadContentBlockers;
- (void)replaceCurrentPasswordWithPassword:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setUUID:(id)a3;
- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3;
- (void)sfWebViewDidBecomeFirstResponder:(id)a3;
- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3;
- (void)sfWebViewDidEndFormControlInteraction:(id)a3;
- (void)sfWebViewDidStartFormControlInteraction:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webView:(id)a3 navigationAction:(id)a4 didBecomeDownload:(id)a5;
- (void)webView:(id)a3 navigationResponse:(id)a4 didBecomeDownload:(id)a5;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7;
- (void)webViewDidClose:(id)a3;
- (void)willActivateWebViewController;
- (void)willBeginUserInitiatedNavigation;
@end

@implementation SFWebViewController

- (SFWebViewController)initWithWebViewConfiguration:(id)a3 contentBlockerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFWebViewController;
  v9 = [(SFWebViewController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webViewConfiguration, a3);
    objc_storeStrong((id *)&v10->_contentBlockerManager, a4);
    [(SFContentBlockerManager *)v10->_contentBlockerManager reloadUserContentControllerReadingStateFromDisk:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)contentBlockerDidChange, @"com.apple.SafariServices.ContentBlockerDidChange", 0, (CFNotificationSuspensionBehavior)1028);
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel__automaticPasswordInputViewNotification_ name:@"_SFAutomaticPasswordInputViewButtonPressedNotification" object:0];

    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel__automaticPasswordInputViewAutoFillContextProviderRequiredNotification_ name:@"SFAutomaticPasswordInputViewAutoFillContextProviderRequiredNotification" object:0];

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    tabIDForAutoFill = v10->_tabIDForAutoFill;
    v10->_tabIDForAutoFill = (NSUUID *)v16;

    v18 = v10;
  }

  return v10;
}

- (void)_loadWebView
{
  v3 = [_SFWebView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  webViewConfiguration = self->_webViewConfiguration;
  v9 = webViewConfiguration;
  if (!webViewConfiguration) {
    v9 = (WKWebViewConfiguration *)objc_alloc_init(MEMORY[0x1E4F466F8]);
  }
  v10 = -[_SFWebView initWithFrame:configuration:](v3, "initWithFrame:configuration:", v9, v4, v5, v6, v7);
  if (!webViewConfiguration) {

  }
  [(_SFWebView *)v10 setNavigationDelegate:self];
  [(_SFWebView *)v10 setUIDelegate:self];
  [(_SFWebView *)v10 _setFullscreenDelegate:self];
  [(_SFWebView *)v10 _setInputDelegate:self];
  [(_SFWebView *)v10 setDelegate:self];
  [(_SFWebView *)v10 _setBackgroundExtendsBeyondPage:1];
  [(_SFWebView *)v10 setAllowsLinkPreview:1];
  [(_SFWebView *)v10 setInspectable:1];
  [(_SFWebView *)v10 setAutoresizingMask:18];
  v11 = [(_SFWebView *)v10 scrollView];
  [v11 setScrollsToTop:1];

  [(_SFWebView *)v10 addObserver:self forKeyPath:@"estimatedProgress" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"URL" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"hasOnlySecureContent" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"_negotiatedLegacyTLS" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"_webProcessIsResponsive" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"themeColor" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 addObserver:self forKeyPath:@"underPageBackgroundColor" options:0 context:SFWebViewControllerObserverContext];
  [(_SFWebView *)v10 _setObservedRenderingProgressEvents:71];
  v12 = [[_SFFormAutoFillController alloc] initWithWebView:v10 delegate:self];
  autoFillController = self->_autoFillController;
  self->_autoFillController = v12;

  [(_SFFormAutoFillController *)self->_autoFillController setMetadataCorrectionsEnabled:1];
  v14 = (SFDialogController *)objc_alloc_init(MEMORY[0x1E4F78278]);
  dialogController = self->_dialogController;
  self->_dialogController = v14;

  [(SFDialogController *)self->_dialogController setDelegate:self];
  [(SFDialogController *)self->_dialogController setDialogPresenter:v10];
  [(SFDialogController *)self->_dialogController setViewControllerPresenter:self];
  [(SFDialogController *)self->_dialogController owningWebViewWillBecomeActive];
  webView = self->_webView;
  self->_webView = v10;
}

- (void)_loadWebViewIfNeeded
{
  if (!self->_webView) {
    [(SFWebViewController *)self _loadWebView];
  }
}

- (void)loadView
{
  [(SFWebViewController *)self _loadWebViewIfNeeded];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setAutoresizingMask:18];
  [v3 addSubview:self->_webView];
  [(SFWebViewController *)self setView:v3];
}

- (id)_presentingViewControllerForWebView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [WeakRetained presentingViewControllerForWebViewController:self];

  return v5;
}

- (WKWebView)webView
{
  [(SFWebViewController *)self _loadWebViewIfNeeded];
  webView = self->_webView;

  return (WKWebView *)webView;
}

- (void)dealloc
{
  id v3 = [(SFWebViewController *)self webView];
  [v3 setUIDelegate:0];
  [(SFDialogController *)self->_dialogController owningTabWillClose];
  double v4 = [v3 scrollView];
  [v4 setDelegate:0];

  [v3 removeObserver:self forKeyPath:@"estimatedProgress" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"URL" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"hasOnlySecureContent" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"_negotiatedLegacyTLS" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"_webProcessIsResponsive" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"themeColor" context:SFWebViewControllerObserverContext];
  [v3 removeObserver:self forKeyPath:@"underPageBackgroundColor" context:SFWebViewControllerObserverContext];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(_SFFormAutoFillController *)self->_autoFillController invalidate];

  v6.receiver = self;
  v6.super_class = (Class)SFWebViewController;
  [(SFWebViewController *)&v6 dealloc];
}

- (void)invalidate
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  if (self->_webView == a4)
  {
    v12 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([v12 isEqualToString:@"estimatedProgress"])
    {
      [WeakRetained webViewControllerDidChangeEstimatedProgress:self];
    }
    else if ([v12 isEqualToString:@"URL"])
    {
      [WeakRetained webViewControllerDidChangeURL:self];
    }
    else if (([v12 isEqualToString:@"hasOnlySecureContent"] & 1) != 0 {
           || [v12 isEqualToString:@"_negotiatedLegacyTLS"])
    }
    {
      [WeakRetained webViewControllerDidChangeHasOnlySecureContent:self];
    }
    else if ([v12 isEqualToString:@"_webProcessIsResponsive"])
    {
      v10 = [(SFWebViewController *)self webView];
      int v11 = [v10 _webProcessIsResponsive];

      if (v11) {
        [WeakRetained webViewControllerWebProcessDidBecomeResponsive:self];
      }
      else {
        [WeakRetained webViewControllerWebProcessDidBecomeUnresponsive:self];
      }
    }
    else if (([v12 isEqualToString:@"themeColor"] {
            || [v12 isEqualToString:@"underPageBackgroundColor"])
    }
           && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [WeakRetained webViewControllerDidUpdateThemeColor:self];
    }

    id v8 = v12;
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (!a3) {
      self->_shouldSuppressDialogsThatBlockWebProcess = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained webViewControllerDidChangeLoadingState:self];
  }
}

- (void)willActivateWebViewController
{
}

- (void)willBeginUserInitiatedNavigation
{
  self->_shouldSuppressDialogsThatBlockWebProcess = 1;
  [(SFDialogController *)self->_dialogController owningWebViewWillNavigate];
}

- (void)reloadContentBlockers
{
  [(SFContentBlockerManager *)self->_contentBlockerManager reloadUserContentControllerReadingStateFromDisk:1];
  contentBlockerManager = self->_contentBlockerManager;

  [(SFContentBlockerManager *)contentBlockerManager informObserversThatContentBlockerManagerExtensionListDidChange];
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
}

- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3
{
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a4;
  [(_SFFormAutoFillController *)self->_autoFillController offerToSaveUnsubmittedFormDataIfNeeded];
  [(SFWebViewController *)self setLoading:1];
  self->_didFinishDocumentLoad = 0;
  self->_didFirstLayout = 0;
  self->_didFirstVisuallyNonEmptyLayout = 0;
  self->_didFirstPaint = 0;
  [(WBSPermissionDialogThrottler *)self->_permissionDialogThrottler willPerformUserInitiatedNavigation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didStartProvisionalNavigation:v6];
}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self didReceiveServerRedirectForProvisionalNavigation:v6];
}

- (void)_webView:(id)a3 willPerformClientRedirectToURL:(id)a4 delay:(double)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self willPerformClientRedirectToURL:v8 withDelay:a5];
}

- (void)_webViewDidCancelClientRedirect:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewControllerDidCancelClientRedirect:self];
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  dialogController = self->_dialogController;
  id v8 = [v13 URL];
  [(SFDialogController *)dialogController owningWebViewDidCommitNavigationWithURL:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didCommitNavigation:v6];

  [(_SFFormAutoFillController *)self->_autoFillController setLastFilledCreditCardData:0];
  v10 = [v13 URL];
  int v11 = objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");

  if (([v11 isEqualToString:self->_domainWhereUserDeclinedAutomaticStrongPassword] & 1) == 0)
  {
    domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
    self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;
  }
  self->_hasFocusedInputFieldOnCurrentPage = 0;
  self->_shouldSuppressDialogsThatBlockWebProcess = 0;
  self->_hasFormControlInteraction = 0;
}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id v9 = a4;
  [(_SFFormAutoFillController *)self->_autoFillController offerToSaveUnsubmittedFormDataIfNeededInWebView:a3 fromSameDocumentNavigationOfType:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didSameDocumentNavigation:v9 ofType:a5];
}

- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  id v10 = a4;
  double v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained webViewController:self authenticationChallenge:v10 shouldAllowLegacyTLS:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authenticationChallengeDidNegotiateModernTLS:v5];
}

- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  id v11 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self decidePolicyForSOAuthorizationLoadWithCurrentPolicy:a4 forExtension:v11 completionHandler:v9];
  }
  else {
    v9[2](v9, 1);
  }
}

- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self willEndNavigationGestureToBackForwardListItem:v6];
}

- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self didEndNavigationGestureToBackForwardListItem:v6];
}

- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self willGoToBackForwardListItem:v8 inPageCache:v5];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a4;
  [(SFWebViewController *)self setLoading:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didFinishNavigation:v6];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  id v11 = a4;
  id v8 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained webViewController:self decidePolicyForNavigationAction:v11 decisionHandler:v8];
  }
  else {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v10 = a4;
  double v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained webViewController:self decidePolicyForNavigationResponse:v10 decisionHandler:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  [(SFWebViewController *)self setLoading:0];
  self->_didFirstVisuallyNonEmptyLayout = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didFailProvisionalNavigation:v9 withError:v7];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  [(SFWebViewController *)self setLoading:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didFailNavigation:v9 withError:v7];
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4 = a4;
  id v8 = a3;
  if (v4)
  {
    self->_didFirstLayout = 1;
    [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if ((v4 & 2) != 0)
  {
    self->_didFirstVisuallyNonEmptyLayout = 1;
    [WeakRetained webViewControllerDidFirstVisuallyNonEmptyLayout:self];
    [v7 webViewControllerUpdateNavigationBar:self];
  }
  if ((v4 & 0x40) != 0)
  {
    self->_didFirstPaint = 1;
    if (objc_opt_respondsToSelector()) {
      [v7 webViewControllerDidFirstPaint:self];
    }
  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  id v6 = a4;
  self->_didFinishDocumentLoad = 1;
  [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didFinishDocumentLoadForNavigation:v6];
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  [(SFDialogController *)self->_dialogController owningWebViewDidChangeProcessID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewControllerWebProcessDidCrash:self];
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained webViewController:self didReceiveAuthenticationChallenge:v10 completionHandler:v7];
  }
  else {
    v7[2](v7, 2, 0);
  }
}

- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self didStartLoadForQuickLookDocumentInMainFrameWithFileName:v9 uti:v8];
}

- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self didFinishLoadForQuickLookDocumentInMainFrame:v6];
}

- (void)webView:(id)a3 navigationAction:(id)a4 didBecomeDownload:(id)a5
{
  id v6 = a5;
  BOOL v5 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
  [v5 downloadDidStart:v6];
}

- (void)webView:(id)a3 navigationResponse:(id)a4 didBecomeDownload:(id)a5
{
  id v6 = a5;
  BOOL v5 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
  [v5 downloadDidStart:v6];
}

- (_SFAuthenticationContext)autoFillAuthenticationContext
{
  return [(_SFFormAutoFillController *)self->_autoFillController authenticationContext];
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return self->_didFinishDocumentLoad && self->_didFirstLayout;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  id v3 = [(SFWebViewController *)self webView];
  char v4 = [v3 URL];

  return v4;
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return 0;
}

- (id)currentSavedAccountContextForFormAutoFillController:(id)a3
{
  return 0;
}

- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3
{
  char v4 = [(SFWebViewController *)self webView];
  BOOL v5 = [v4 URL];
  id v6 = objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");

  LOBYTE(v4) = [v6 isEqualToString:self->_domainWhereUserDeclinedAutomaticStrongPassword];
  return (char)v4;
}

- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3
{
  domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
  self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;
}

- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 authenticationContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SFWebViewController_formAutoFillControllerGetAuthenticationForAutoFill_completion___block_invoke;
  v10[3] = &unk_1E5C75000;
  id v8 = v6;
  id v12 = v8;
  id v9 = v5;
  id v11 = v9;
  [v7 authenticateForClient:v9 userInitiated:1 completion:v10];
}

void __85__SFWebViewController_formAutoFillControllerGetAuthenticationForAutoFill_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) authenticationContext];
  char v4 = [v5 authenticatedContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, a2, v4);
}

- (void)performPageLevelAutoFill
{
}

- (void)_automaticPasswordInputViewNotification:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = [v10 userInfo];
  id v6 = [v5 objectForKey:@"SFAutoFillContextProviderIdentifierUserInfoKey"];
  id v7 = (void *)[v4 initWithUUIDString:v6];

  id v8 = [v10 userInfo];
  id v9 = objc_msgSend(v8, "safari_numberForKey:", @"_SFAutomaticPasswordInputViewNotificationPressedButtonUserInfoKey");

  if (v9 && [v9 integerValue] == 1)
  {
    [(_SFFormAutoFillController *)self->_autoFillController removeAutomaticPasswordButtonInitiatedByUser:1];
    [(SFWebViewController *)self _userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:v7];
  }
}

- (void)_userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3
{
  id v8 = a3;
  id v4 = [(SFWebViewController *)self webView];
  id v5 = [v4 URL];
  id v6 = objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");

  id v7 = [(SFWebViewController *)self UUID];
  LODWORD(v5) = [v8 isEqual:v7];

  if (v5) {
    objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, v6);
  }
}

- (void)_automaticPasswordInputViewAutoFillContextProviderRequiredNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"SFAutomaticPasswordInputViewControllerKey"];

  [v5 setAutoFillContextProvider:self];
}

- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3
{
  BOOL hasFocusedInputFieldOnCurrentPage = self->_hasFocusedInputFieldOnCurrentPage;
  self->_BOOL hasFocusedInputFieldOnCurrentPage = 1;
  if (!hasFocusedInputFieldOnCurrentPage)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained webViewControllerUpdateNavigationBar:self];
  }
}

- (void)_webView:(id)a3 requestPresentingViewControllerWithCompletionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self requestPresentingViewControllerWithCompletionHandler:v6];
  }
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewControllerDidExitElementFullscreen:self];
  }
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  id v6 = a4;
  id v5 = [[_SFFormAutoFillInputSession alloc] initWithFormInputSession:v6];
  if (![v6 requiresStrongPasswordAssistance]
    || (-[_SFFormAutoFillController prepareForShowingAutomaticStrongPasswordWithInputSession:](self->_autoFillController, "prepareForShowingAutomaticStrongPasswordWithInputSession:", v5), ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled] & 1) != 0))
  {
    [(_SFFormAutoFillController *)self->_autoFillController fieldWillFocusWithInputSession:v5];
  }
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  id v8 = a4;
  if (([v8 requiresStrongPasswordAssistance] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[_SFFormAutoFillController setShouldAutofillESimInformation:](self->_autoFillController, "setShouldAutofillESimInformation:", [WeakRetained webViewControllerShouldAutofillESimInformation:self]);
    }
    autoFillController = self->_autoFillController;
    id v7 = [[_SFFormAutoFillInputSession alloc] initWithFormInputSession:v8];
    [(_SFFormAutoFillController *)autoFillController fieldDidFocusWithInputSession:v7];
  }
}

- (void)_webViewDidShowSafeBrowsingWarning:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F98948], "sharedLogger", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 didShowSafeBrowsingWarningWithSource:0];
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_SFFormAutoFillController *)self->_autoFillController elementIsBeingFocusedForStreamlinedLogin:v7])
  {
    id v8 = [(SFWebViewController *)self presentedViewController];
    if (v8) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    id v8 = [v6 URL];
    id v10 = [v6 _committedURL];
    if ([v8 isEqual:v10]) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = 2;
    }
  }
  return v9;
}

- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4
{
  id v5 = a4;
  autoFillController = self->_autoFillController;
  id v7 = [[_SFFormAutoFillInputSession alloc] initWithFocusedElement:v5];
  id v8 = [(_SFFormAutoFillController *)autoFillController beginAutomaticPasswordInteractionWithInputSession:v7];
  LOBYTE(autoFillController) = v8 != 0;

  return (char)autoFillController;
}

- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4
{
}

- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"SFAutoFillContextProviderIdentifierUserInfoKey";
  id v3 = [(NSUUID *)self->_UUID UUIDString];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (NSString)currentStrongPassword
{
  return [(_SFFormAutoFillController *)self->_autoFillController currentStrongPassword];
}

- (NSString)defaultStrongPassword
{
  return [(_SFFormAutoFillController *)self->_autoFillController defaultStrongPassword];
}

- (NSString)alphanumericStrongPassword
{
  return (NSString *)[(_SFFormAutoFillController *)self->_autoFillController alphanumericStrongPassword];
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
}

- (void)copyCurrentStrongPassword
{
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E4F78270], "javaScriptAlertDialogWithMessage:completionHandler:", a4, a6, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");
}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E4F78270], "javaScriptConfirmDialogWithMessage:completionHandler:", a4, a6, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");
}

- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7
{
  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E4F78270], "javaScriptPromptDialogWithMessage:defaultText:completionHandler:", a4, a5, a7, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");
}

- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6
{
  dialogController = self->_dialogController;
  id v7 = [MEMORY[0x1E4F78270] requestStorageAccessDialogForDomain:a4 underCurrentDomain:a5 extensionsController:0 completionHandler:a6];
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");
}

- (void)webViewDidClose:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self webViewDidClose:v5];
}

- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7
{
  id v14 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void))a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v13 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained webViewController:self createWebViewWithConfiguration:v14 forNavigationAction:v10 completionHandler:v11];
  }
  else {
    v11[2](v11, 0);
  }
}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self contextMenuConfigurationForElement:v9 completionHandler:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self contextMenuWillPresentForElement:v6];
  }
}

- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [WeakRetained webViewController:self contextMenuContentPreviewForElement:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self contextMenuForElement:v9 willCommitWithAnimator:v7];
  }
}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self contextMenuDidEndForElement:v6];
  }
}

- (void)_webView:(id)a3 printFrame:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained webViewController:self printFrame:v6];
}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didChangeFullScreen:1];
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewController:self didChangeFullScreen:0];
}

- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = [WeakRetained browserPersonaForWebViewController:self];

  id v13 = +[_SFGeolocationPermissionManager sharedManager];
  [v13 requestPermissionForURL:v14 frame:v9 dialogPresenter:self browserPersona:v12 completionHandler:v10];
}

- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewControllerDidChangeSafeAreaShouldAffectObscuredInsets:self];
}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  return MEMORY[0x1F412FA70](0, a3);
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  return MEMORY[0x1F412FA70](1, a3);
}

- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[_SFFormDataController sharedController];
  id v10 = [(SFWebViewController *)self tabIDForAutoFill];
  id v11 = [(SFWebViewController *)self webView];
  uint64_t v12 = [v11 URL];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__SFWebViewController__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke;
  v14[3] = &unk_1E5C75028;
  id v13 = v8;
  id v15 = v13;
  [v9 canAutomaticallyRegisterPasskeyForUsername:v7 inTabWithID:v10 currentURL:v12 completionHandler:v14];
}

uint64_t __114__SFWebViewController__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7
{
  id v14 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = +[WBSUserMediaPermissionController sharedController];
  [v13 requestUserMediaAuthorizationForDevices:a4 url:v14 mainFrameURL:v11 decisionHandler:v12 dialogPresenter:self];
}

- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7
{
  id v13 = a4;
  id v10 = a5;
  id v11 = a7;
  id v12 = +[WBSUserMediaPermissionController sharedController];
  [v12 checkUserMediaPermissionForURL:v13 mainFrameURL:v10 frameIdentifier:a6 decisionHandler:v11];
}

- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  id v6 = [(SFWebViewController *)self delegate];
  [v6 webViewController:self mediaCaptureStateDidChange:a4];
}

- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v12 = [v9 protocol];
  [v11 setScheme:v12];

  id v13 = [v9 host];
  id v14 = objc_msgSend(v13, "_webkit_decodeHostName");
  [v11 setHost:v14];

  if ([v9 port])
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "port"));
    [v11 setPort:v15];
  }
  uint64_t v16 = [v11 host];
  if ([v8 isEqualToString:@"geolocation"])
  {
    v17 = +[_SFGeolocationPermissionManager sharedManager];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke;
    v23[3] = &unk_1E5C75050;
    id v24 = v10;
    [v17 getGeolocationSettingForDomain:v16 completionHandler:v23];
    v18 = &v24;
  }
  else
  {
    if (([v8 isEqualToString:@"camera"] & 1) == 0
      && ([v8 isEqualToString:@"microphone"] & 1) == 0)
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
      goto LABEL_9;
    }
    v19 = +[WBSUserMediaPermissionController sharedController];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5C75078;
    id v21 = v8;
    id v22 = v10;
    [v19 getPermissionForOrigin:v16 topLevelOrigin:v16 completionHandler:v20];
    v18 = &v21;

    v17 = v22;
  }

LABEL_9:
}

uint64_t __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = WBSUserMediaPermissionToWKPermissionDecision();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

uint64_t __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:@"camera"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v4 = WBSUserMediaPermissionToWKPermissionDecisionCamera();
  }
  else {
    uint64_t v4 = WBSUserMediaPermissionToWKPermissionDecisionMicrophone();
  }
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);

  return v5(v3, v4);
}

- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  id v6 = [v4 request];
  id v7 = [v6 URL];
  char v8 = [v5 isURLManaged:v7];

  return v8;
}

- (void)_webView:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self updatedAppBadge:v9 fromSecurityOrigin:v7];
  }
}

- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4
{
  id v5 = a4;
  if ([v5 completionHandlerBlocksWebProcess]
    && self->_shouldSuppressDialogsThatBlockWebProcess)
  {
    int64_t v6 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v6 = [WeakRetained webViewController:self presentationPolicyForDialog:v5];
  }
  return v6;
}

- (void)dialogController:(id)a3 willPresentDialog:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewControllerWillPresentJavaScriptDialog:self];
}

- (void)presentDialog:(id)a3 sender:(id)a4
{
}

- (id)permissionDialogThrottler
{
  permissionDialogThrottler = self->_permissionDialogThrottler;
  if (!permissionDialogThrottler)
  {
    id v4 = (WBSPermissionDialogThrottler *)objc_alloc_init(MEMORY[0x1E4F98CE0]);
    id v5 = self->_permissionDialogThrottler;
    self->_permissionDialogThrottler = v4;

    permissionDialogThrottler = self->_permissionDialogThrottler;
  }

  return permissionDialogThrottler;
}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  [(SFWebViewController *)self presentViewController:v8 animated:1 completion:0];
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7 = a4;
  id v6 = a5;
  [v7 dismissViewControllerAnimated:1 completion:0];
  objc_msgSend(v7, "_sf_animateAlongsideTransitionOrPerform:", v6);
}

- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webViewControllerDidChangeSafeAreaInsets:self];
}

- (void)sfWebViewDidBecomeFirstResponder:(id)a3
{
}

- (void)sfWebViewDidStartFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 1;
}

- (void)sfWebViewDidEndFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 0;
}

- (id)sfWebView:(id)a3 didStartDownload:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained webViewController:self didStartDownload:v5];

  return v7;
}

- (BOOL)sfWebViewCanPromptForAccountSecurityRecommendation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained webViewControllerCanPromptForAccountSecurityRecommendation:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)sfWebViewShouldFillStringForFind:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained webViewControllerShouldFillStringForFind:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained webViewControllerCanFindNextOrPrevious:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)_webView:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5
{
  id v9 = a4;
  id v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained webViewController:self requestNotificationPermissionForSecurityOrigin:v9 decisionHandler:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (_SFFormAutoFillController)autoFillController
{
  return self->_autoFillController;
}

- (NSURL)url
{
  int v2 = [(SFWebViewController *)self webView];
  uint64_t v3 = [v2 URL];

  return (NSURL *)v3;
}

- (unint64_t)autoFillFormType
{
  return [(_SFFormAutoFillController *)self->_autoFillController autoFillFormType];
}

- (NSUUID)tabIDForAutoFill
{
  return self->_tabIDForAutoFill;
}

- (SFWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFWebViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)didFirstVisuallyNonEmptyLayout
{
  return self->_didFirstVisuallyNonEmptyLayout;
}

- (WKWebViewConfiguration)webViewConfiguration
{
  return self->_webViewConfiguration;
}

- (SFDialogController)dialogController
{
  return self->_dialogController;
}

- (BOOL)didFirstPaint
{
  return self->_didFirstPaint;
}

- (BOOL)hasFocusedInputFieldOnCurrentPage
{
  return self->_hasFocusedInputFieldOnCurrentPage;
}

- (BOOL)hasFormControlInteraction
{
  return self->_hasFormControlInteraction;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabIDForAutoFill, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_permissionDialogThrottler, 0);
  objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end