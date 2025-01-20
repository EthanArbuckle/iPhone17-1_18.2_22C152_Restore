@interface _SFPageLoadErrorController
+ (void)clearOldCertificateBypasses;
- (BOOL)reloadingFailedRequest;
- (BOOL)updateCrashesAndShowCrashError:(id)a3 URLString:(id)a4;
- (NSURLProtectionSpace)protectionSpaceForInvalidCertificateBypass;
- (NSURLRequest)failedRequest;
- (SFDialogPresenting)dialogPresenter;
- (_SFPageLoadErrorController)initWithWebView:(id)a3;
- (_SFPageLoadErrorControllerDelegate)delegate;
- (id)_certificateWarningPagePresenterProxy;
- (id)_errorMessageForNSURLErrorDomain:(id)a3 url:(id)a4;
- (id)_firstItemWithUniqueURLInBackListFromURL:(id)a3;
- (id)_genericMessageForError:(id)a3;
- (id)_titleForError:(id)a3;
- (unint64_t)crashesSinceLastSuccessfulLoad;
- (void)_cacheSecIdentityIfNeeded:(__SecIdentity *)a3 forIdentityDomain:(id)a4;
- (void)_clearCertificateWarningPageHandlerInterface;
- (void)_continueAfterCertificateAlertWithURL:(id)a3 trust:(__SecTrust *)a4 recoveryAttempter:(id)a5;
- (void)_continueWithoutCredentialsUsingAlertContext:(id)a3;
- (void)_dismissCertificateViewButtonTapped;
- (void)_fetchSpecializedMessageForError:(id)a3 URL:(id)a4 completionHandler:(id)a5;
- (void)_handleCertificateError:(id)a3 forURL:(id)a4 isMainFrame:(BOOL)a5 recoveryAttempter:(id)a6 completionHandler:(id)a7;
- (void)_handleFrameLoadError:(id)a3 forURL:(id)a4 recoveryAttempter:(id)a5;
- (void)_loadCertificateWarningPageForContext:(id)a3;
- (void)_reachabilityChanged:(id)a3;
- (void)_resetCrashCount:(id)a3;
- (void)_resetCrashCountSoon;
- (void)_setFailedRequest:(id)a3;
- (void)_setUpCertificateWarningPageHandlerInterface;
- (void)_showRepeatedWebProcessCrashError:(id)a3 URLString:(id)a4;
- (void)addAlert:(id)a3;
- (void)addAlertWithTitle:(id)a3 bodyText:(id)a4;
- (void)addDialog:(id)a3;
- (void)addDisallowedFileURLAlert;
- (void)addDisallowedUseOfJavaScriptAlert;
- (void)addDownloadFailedAlertWithDescription:(id)a3;
- (void)addFormAlertWithTitle:(id)a3 decisionHandler:(id)a4;
- (void)addInvalidProfileAlert;
- (void)addInvalidURLAlert;
- (void)clearCrashCountResetTimer;
- (void)clearFailedRequest;
- (void)dealloc;
- (void)goBackButtonClicked;
- (void)handleClientCertificateAuthenticationChallenge:(id)a3 completionHandler:(id)a4;
- (void)handleFrameLoadError:(id)a3;
- (void)handleLegacyTLSWithFailingURL:(id)a3 clickThroughURL:(id)a4 authenticationChallenge:(id)a5;
- (void)handleSubframeCertificateError:(id)a3;
- (void)invalidate;
- (void)openClockSettings;
- (void)performAction:(int)a3 forAlert:(id)a4;
- (void)reloadAfterError;
- (void)scheduleResetCrashCount;
- (void)setDelegate:(id)a3;
- (void)setDialogPresenter:(id)a3;
- (void)setProtectionSpaceForInvalidCertificateBypass:(id)a3;
- (void)showCertificateInformation;
- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 forError:(id)a5;
- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 learnMoreLink:(id)a5 forError:(id)a6;
- (void)visitInsecureWebsite;
- (void)visitInsecureWebsiteWithTemporaryBypass;
- (void)visitWebsiteWithoutPrivateRelay;
- (void)webViewDidCommitErrorPagePreview:(id)a3;
@end

@implementation _SFPageLoadErrorController

- (void)setDialogPresenter:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)_setUpCertificateWarningPageHandlerInterface
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC06528];
  certificateWarningPageHandlerInterface = self->_certificateWarningPageHandlerInterface;
  self->_certificateWarningPageHandlerInterface = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v5 = [WeakRetained _remoteObjectRegistry];
  [v5 registerExportedObject:self interface:self->_certificateWarningPageHandlerInterface];
}

- (_SFPageLoadErrorController)initWithWebView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPageLoadErrorController;
  v5 = [(_SFPageLoadErrorController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    [(_SFPageLoadErrorController *)v6 _setUpCertificateWarningPageHandlerInterface];
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A690B000, log, OS_LOG_TYPE_FAULT, "-[_SFPageLoadErrorController dealloc] must be called on the main thread", v1, 2u);
}

- (void)invalidate
{
  if (!self->_certificateWarningPageHandlerInterfaceInvalidated)
  {
    self->_certificateWarningPageHandlerInterfaceInvalidated = 1;
    [(_SFPageLoadErrorController *)self _clearCertificateWarningPageHandlerInterface];
  }
}

- (void)_cacheSecIdentityIfNeeded:(__SecIdentity *)a3 forIdentityDomain:(id)a4
{
  id v6 = a4;
  secIdentitiesCache = self->_secIdentitiesCache;
  id v10 = v6;
  if (!secIdentitiesCache)
  {
    v8 = (WBSSecIdentitiesCache *)objc_alloc_init(MEMORY[0x1E4F98E38]);
    objc_super v9 = self->_secIdentitiesCache;
    self->_secIdentitiesCache = v8;

    id v6 = v10;
    secIdentitiesCache = self->_secIdentitiesCache;
  }
  [(WBSSecIdentitiesCache *)secIdentitiesCache setSecIdentity:a3 forDomain:v6];
}

- (void)_clearCertificateWarningPageHandlerInterface
{
  if (self->_certificateWarningPageHandlerInterface)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v5 = [WeakRetained _remoteObjectRegistry];

    [v5 unregisterExportedObject:self interface:self->_certificateWarningPageHandlerInterface];
    certificateWarningPageHandlerInterface = self->_certificateWarningPageHandlerInterface;
    self->_certificateWarningPageHandlerInterface = 0;
  }
}

- (void)_fetchSpecializedMessageForError:(id)a3 URL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [v8 failingURL];
  if (!v11)
  {
    id v11 = v9;
    v12 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v11) {
        goto LABEL_4;
      }
LABEL_18:
      v10[2](v10, 0);
      goto LABEL_11;
    }
    -[_SFPageLoadErrorController _fetchSpecializedMessageForError:URL:completionHandler:](v12, v8);
    if (!v11) {
      goto LABEL_18;
    }
  }
LABEL_4:
  if (!objc_msgSend(v8, "safari_isPrivacyProxyError"))
  {
    if (objc_msgSend(v8, "safari_isLocalNetworkContentFilteringError"))
    {
      v14 = [v11 host];
      [v8 fetchLocalNetworkContentFilteringErrorMessageForFailingURLString:v14 withCompletionHandler:v10];
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0]))
    {
      uint64_t v13 = [(_SFPageLoadErrorController *)self _errorMessageForNSURLErrorDomain:v8 url:v11];
      goto LABEL_6;
    }
    if (!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E4F28798])
      || [v8 code] != 54)
    {
      v10[2](v10, 0);
      goto LABEL_10;
    }
  }
  uint64_t v13 = _WBSLocalizedString();
LABEL_6:
  v14 = (void *)v13;
  v10[2](v10, v13);
LABEL_9:

LABEL_10:
LABEL_11:
}

- (id)_errorMessageForNSURLErrorDomain:(id)a3 url:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 userInfo];
  id v8 = objc_msgSend(v7, "safari_URLForKey:", *MEMORY[0x1E4F289B0]);
  id v9 = [v8 absoluteString];
  id v10 = [v9 stringByRemovingPercentEncoding];

  uint64_t v11 = [v5 code];
  v12 = 0;
  if (v11 > -1103)
  {
    switch(v11)
    {
      case -1018:
      case -1014:
      case -1011:
      case -1010:
      case -1008:
      case -1007:
      case -1006:
      case -1005:
      case -1004:
      case -1003:
      case -1001:
      case -1000:
        goto LABEL_24;
      case -1017:
      case -1016:
      case -1015:
      case -1013:
      case -1012:
        goto LABEL_25;
      case -1009:
        goto LABEL_10;
      case -1002:
        v17 = NSString;
        v16 = _WBSLocalizedString();
        uint64_t v18 = objc_msgSend(v6, "safari_userVisibleScheme");
        goto LABEL_19;
      default:
        if (v11 == -1102)
        {
          v20 = NSString;
          v16 = _WBSLocalizedString();
          v19 = [MEMORY[0x1E4F28CB8] defaultManager];
          v21 = [v6 path];
          v22 = [v19 displayNameAtPath:v21];
          v12 = objc_msgSend(v20, "stringWithFormat:", v16, v22);

          goto LABEL_22;
        }
        if (v11 != -1100) {
          goto LABEL_25;
        }
        v17 = NSString;
        v16 = _WBSLocalizedString();
        uint64_t v18 = [v6 path];
        break;
    }
    goto LABEL_19;
  }
  if (v11 > -1201)
  {
    if (v11 == -1200)
    {
      if (isDiffieHellmanError(v5))
      {
        v17 = NSString;
        v16 = _WBSLocalizedString();
        uint64_t v18 = [v6 host];
LABEL_19:
        v19 = (void *)v18;
        v12 = objc_msgSend(v17, "stringWithFormat:", v16, v18);
LABEL_22:

        goto LABEL_23;
      }
    }
    else if (v11 != -1103)
    {
      goto LABEL_25;
    }
  }
  else if (v11 == -2000)
  {
LABEL_10:
    uint64_t v13 = [MEMORY[0x1E4F98AA8] currentDevice];
    int v14 = [v13 deviceClass];

    if (v14 == 3 && [v10 length])
    {
      v15 = NSString;
      v16 = _WBSLocalizedString();
      v12 = objc_msgSend(v15, "stringWithFormat:", v16, v10);
LABEL_23:

      goto LABEL_25;
    }
  }
  else if (v11 != -1205)
  {
    goto LABEL_25;
  }
LABEL_24:
  v12 = _WBSLocalizedString();
LABEL_25:

  return v12;
}

- (id)_genericMessageForError:(id)a3
{
  v3 = objc_msgSend(a3, "_web_localizedDescription");
  if (!v3)
  {
    v3 = _WBSLocalizedString();
  }
  id v4 = NSString;
  id v5 = _WBSLocalizedString();
  id v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

  return v6;
}

- (void)addDialog:(id)a3
{
  p_dialogPresenter = &self->_dialogPresenter;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dialogPresenter);
  [WeakRetained presentDialog:v5 sender:self];

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v6 pageLoadErrorControllerDidAddAlert:self];
  }
}

- (void)addAlert:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F78270];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __39___SFPageLoadErrorController_addAlert___block_invoke;
  uint64_t v11 = &unk_1E5C726A0;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v4;
  v7 = [v5 dialogWithWebUIAlert:v6 completionHandler:&v8];
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v7, v8, v9, v10, v11);
}

- (void)_continueAfterCertificateAlertWithURL:(id)a3 trust:(__SecTrust *)a4 recoveryAttempter:(id)a5
{
  uint64_t v11 = (void (**)(void))a5;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (a4)
  {
    CFIndex CertificateCount = SecTrustGetCertificateCount(a4);
    if (CertificateCount >= 1)
    {
      CFIndex v8 = CertificateCount;
      for (CFIndex i = 0; i != v8; ++i)
      {
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a4, i);
        if (CertificateAtIndex) {
          [v6 addObject:CertificateAtIndex];
        }
      }
    }
  }
  if (v11) {
    v11[2]();
  }
}

- (void)_continueWithoutCredentialsUsingAlertContext:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 objectForKey:@"reason"];
    int v5 = [v4 isEqualToString:@"reasonAuthenticationChallenge"];

    id v3 = v8;
    if (v5)
    {
      uint64_t v6 = [v8 objectForKey:@"completionHandler"];
      v7 = (void *)v6;
      if (v6) {
        (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 3, 0);
      }

      id v3 = v8;
    }
  }
}

- (void)performAction:(int)a3 forAlert:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [v6 type];
  if (v7 == 4)
  {
    if (a3 != 4)
    {
      if (a3 != 5) {
        goto LABEL_19;
      }
      id v10 = [v6 context];
      uint64_t v11 = [v6 selectedIdentity];
      if (v11)
      {
        id v12 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = v12;
          int v14 = [v6 identities];
          int v26 = 134217984;
          uint64_t v27 = [v14 count];
          _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEFAULT, "User has selected an identity out of %lu", (uint8_t *)&v26, 0xCu);
        }
        v15 = [v10 objectForKey:@"authenticationChallenge"];
        v16 = [v15 protectionSpace];
        v17 = objc_msgSend(v16, "safari_identityPreferenceDomain");
        [(_SFPageLoadErrorController *)self _cacheSecIdentityIfNeeded:v11 forIdentityDomain:v17];

        proceedWithClientCertificateIdentity((uint64_t)v11, v10);
        uint64_t v18 = [v6 identities];
        uint64_t v19 = [v18 count];

        if (v19 == 1)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v21 = [WeakRetained pageLoadErrorControllerGetSecIdentityPreferencesController:self];

          v22 = [v10 objectForKeyedSubscript:@"authenticationChallenge"];
          v23 = [v22 protectionSpace];
          v24 = objc_msgSend(v23, "_sf_highLevelDomainAndPort");
          [v21 saveShouldUseOnlyAvailableIdentityWithoutPrompting:1 forDomainAndPort:v24];
        }
      }

LABEL_18:
      goto LABEL_19;
    }
    v25 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1A690B000, v25, OS_LOG_TYPE_DEFAULT, "User has cancelled identities picker", (uint8_t *)&v26, 2u);
    }
LABEL_17:
    id v10 = [v6 context];
    [(_SFPageLoadErrorController *)self _continueWithoutCredentialsUsingAlertContext:v10];
    goto LABEL_18;
  }
  if (v7 != 3) {
    goto LABEL_19;
  }
  if (a3 == 4) {
    goto LABEL_17;
  }
  if (a3 == 5)
  {
    id v8 = [v6 context];
    uint64_t v9 = newAlertToListPossibleClientSideCertificatesWithContext(v8);

    [(_SFPageLoadErrorController *)self addAlert:v9];
  }
LABEL_19:
}

- (void)addFormAlertWithTitle:(id)a3 decisionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4F78270];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68___SFPageLoadErrorController_addFormAlertWithTitle_decisionHandler___block_invoke;
  v10[3] = &unk_1E5C726C8;
  id v11 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 formSubmissionDialogWithMessage:a3 completionHandler:v10];
  [(_SFPageLoadErrorController *)self addDialog:v9];
}

- (void)addAlertWithTitle:(id)a3 bodyText:(id)a4
{
  id v5 = [MEMORY[0x1E4F78270] genericErrorDialogWithTitle:a3 message:a4 applicationModal:1];
  [(_SFPageLoadErrorController *)self addDialog:v5];
}

- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 learnMoreLink:(id)a5 forError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [a6 failingURL];
  if (v13)
  {
    int v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 pathForResource:@"StandardError" ofType:@"html"];

    if (v15)
    {
      v42 = [NSString stringWithContentsOfFile:v15 encoding:4 error:0];
      if (v42)
      {
        v16 = objc_msgSend(v11, "safari_stringByReplacingMarkupCharactersWithHTMLEntities");
        v17 = objc_msgSend(v16, "safari_stringByReplacingLastOccurrenceOfWhitespaceWithANonBreakingSpace");

        uint64_t v18 = [v17 stringByReplacingOccurrencesOfString:@"\\n" withString:@"<br>"];

        uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"<br>"];

        v41 = (void *)v19;
        if (v19)
        {
          if (v12)
          {
            v20 = NSString;
            v21 = _WBSLocalizedString();
            v22 = [v20 stringWithFormat:@" <a href=\"%@\">%@</a>", v12, v21];
            uint64_t v23 = [v41 stringByAppendingString:v22];

            v41 = (void *)v23;
          }
          v24 = [MEMORY[0x1E4F1CA20] preferredLanguages];
          uint64_t v25 = [v24 firstObject];

          int v26 = (void *)v25;
          uint64_t v27 = &stru_1EFB97EB8;
          v40 = v26;
          if (v26 && objc_msgSend(MEMORY[0x1E4F1CA20], "characterDirectionForLanguage:") == 2) {
            uint64_t v27 = @"body { direction: rtl; }\n";
          }
          uint64_t v28 = (void *)MEMORY[0x1E4F98AA8];
          v29 = v27;
          v30 = [v28 currentDevice];
          int v31 = [v30 deviceClass];

          v32 = @"phone";
          if (v31 == 6) {
            v32 = @"watch";
          }
          if (v31 == 3) {
            v32 = @"pad";
          }
          v33 = v32;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          int v35 = [WeakRetained pageLoadErrorControllerIsInPreviewMode:self];

          if (v35)
          {
            uint64_t v36 = [(__CFString *)v33 stringByAppendingFormat:@" %@", @"preview"];

            v33 = (__CFString *)v36;
          }
          v37 = NSString;
          v38 = objc_msgSend(v10, "safari_stringByReplacingMarkupCharactersWithHTMLEntities");
          v39 = objc_msgSend(v37, "stringWithFormat:", v42, v40, v29, v38, v33, v41);

          if (v39)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __85___SFPageLoadErrorController_showErrorPageWithTitle_bodyText_learnMoreLink_forError___block_invoke;
            block[3] = &unk_1E5C72350;
            block[4] = self;
            id v44 = v39;
            id v45 = v13;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
        }
      }
    }
  }
}

- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 forError:(id)a5
{
}

- (id)_certificateWarningPagePresenterProxy
{
  certificateWarningPagePresenterProxy = self->_certificateWarningPagePresenterProxy;
  if (!certificateWarningPagePresenterProxy)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v5 = [WeakRetained _remoteObjectRegistry];
    id v6 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC608D0];
    int v7 = [v5 remoteObjectProxyWithInterface:v6];
    id v8 = self->_certificateWarningPagePresenterProxy;
    self->_certificateWarningPagePresenterProxy = v7;

    certificateWarningPagePresenterProxy = self->_certificateWarningPagePresenterProxy;
  }

  return certificateWarningPagePresenterProxy;
}

- (void)_loadCertificateWarningPageForContext:(id)a3
{
  id v4 = a3;
  if (!self->_certificateWarningPageHandlerInterfaceInvalidated)
  {
    id v5 = [(_SFPageLoadErrorController *)self _certificateWarningPagePresenterProxy];
    [v5 prepareCertificateWarningPage:v4];

    id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
    int v7 = [v6 URLForResource:@"CertificateWarningFall2023" withExtension:@"html"];

    id v8 = [NSString stringWithContentsOfURL:v7 encoding:4 error:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68___SFPageLoadErrorController__loadCertificateWarningPageForContext___block_invoke;
    v11[3] = &unk_1E5C726F0;
    v11[4] = self;
    id v12 = v8;
    id v13 = v7;
    id v14 = v4;
    id v9 = v7;
    id v10 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

- (void)_handleCertificateError:(id)a3 forURL:(id)a4 isMainFrame:(BOOL)a5 recoveryAttempter:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, uint64_t))a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v17 = [WeakRetained pageLoadErrorControllerShouldHandleCertificateError:self];

  if (v17)
  {
    if (v9 && objc_msgSend(v12, "safari_isPrivacyProxyFailClosedError"))
    {
      uint64_t v18 = [MEMORY[0x1E4F98CF0] sharedManager];
      uint64_t v19 = [v18 isPrivacyProxySetToTrackersAndWebsites];

      id v20 = objc_alloc(MEMORY[0x1E4F98A10]);
      v21 = [(_SFPageLoadErrorController *)self _firstItemWithUniqueURLInBackListFromURL:v13];
      v22 = (void *)[v20 initPrivateRelayFailClosedNavigationWarningWithFailingURL:v13 isPrivateRelaySetToTrackersAndWebsites:v19 canGoBack:v21 != 0];
      [(_SFPageLoadErrorController *)self _loadCertificateWarningPageForContext:v22];

      if (v15) {
        v15[2](v15, 1);
      }
      goto LABEL_37;
    }
    if (objc_msgSend(v12, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0]))
    {
      id v48 = v14;
      uint64_t v23 = [v12 failingURL];
      hostname = [v23 host];

      uint64_t v24 = [v12 code];
      unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
      if ((v24 & 0xFFFFFFFFFFFFFFFCLL) != 0xFFFFFFFFFFFFFB4CLL && v25 != -1206)
      {
        id v14 = v48;
        if (v15) {
          v15[2](v15, 0);
        }
        goto LABEL_36;
      }
      int v26 = WBS_LOG_CHANNEL_PREFIXCertificates();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_SFPageLoadErrorController _handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:](v26, v12);
      }
      if (v25 == -1206)
      {
        uint64_t v27 = newAlertToHandleClientSideCertificateErrorCode(v24, 0);
        uint64_t v28 = v27;
        if (v27)
        {
          [v27 setHideAction:4];
          [(_SFPageLoadErrorController *)self addAlert:v28];
        }
        id v14 = v48;
        if (v15) {
          v15[2](v15, 1);
        }

        goto LABEL_36;
      }
      v46 = [v12 userInfo];
      v29 = [v46 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v30 = [v12 userInfo];
      certificates = [v30 objectForKeyedSubscript:@"NSErrorPeerCertificateChainKey"];

      id v45 = v29;
      int v31 = [v29 userInfo];
      v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F19108]];

      SecTrustRef trust = (SecTrustRef)v32;
      if (v32)
      {
        id v14 = v48;
      }
      else
      {
        id v14 = v48;
        if (certificates)
        {
          SecPolicyRef SSL = SecPolicyCreateSSL(1u, hostname);
          SecTrustCreateWithCertificates(certificates, SSL, &trust);
          CFRelease(SSL);
          CFAutorelease(trust);
          v32 = trust;
        }
        if (!v32)
        {
          v40 = v45;
          v39 = v46;
          v41 = certificates;
          if (v15) {
            v15[2](v15, 0);
          }
          goto LABEL_35;
        }
      }
      id v34 = objc_loadWeakRetained((id *)&self->_delegate);
      int v35 = [MEMORY[0x1E4F98A08] sharedManager];
      id v49 = v34;
      int v36 = objc_msgSend(v35, "didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:inPrivateBrowsing:", self->_protectionSpaceForInvalidCertificateBypass, objc_msgSend(v34, "pageLoadErrorControllerShouldPermanentlyAcceptCertificate:", self));

      self->_certificateTrust = (__SecTrust *)CFRetain(trust);
      v37 = (void *)MEMORY[0x1AD0C36A0](v14);
      id certificateRecoveryAttempter = self->_certificateRecoveryAttempter;
      self->_id certificateRecoveryAttempter = v37;

      objc_storeStrong((id *)&self->_certificateFailingURL, a4);
      if (v9)
      {
        if (!v36)
        {
          v43 = (void *)MEMORY[0x1E4F1C9C8];
          double v44 = *MEMORY[0x1E4F992C0];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke;
          v51[3] = &unk_1E5C72740;
          v51[4] = self;
          id v52 = v12;
          v41 = certificates;
          id v53 = certificates;
          id v54 = v13;
          v55 = v15;
          objc_msgSend(v43, "safari_dateFromNTPServerWithTimeout:completionHandler:", v51, v44);

          v40 = v45;
          v39 = v46;
          v42 = v49;
LABEL_34:

LABEL_35:
LABEL_36:

          goto LABEL_37;
        }
        [(_SFPageLoadErrorController *)self _continueAfterCertificateAlertWithURL:v13 trust:self->_certificateTrust recoveryAttempter:v14];
      }
      v40 = v45;
      v39 = v46;
      v41 = certificates;
      v42 = v49;
      if (v15) {
        v15[2](v15, 1);
      }
      goto LABEL_34;
    }
  }
  if (v15) {
    v15[2](v15, 0);
  }
LABEL_37:
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = objc_msgSend(v4, "safari_BOOLForKey:", *MEMORY[0x1E4F4BDA8]);

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [WeakRetained pageLoadErrorControllerShouldReloadAfterError:self];

    if (v7)
    {
      [(_SFPageLoadErrorController *)self reloadAfterError];
    }
    else
    {
      self->_reloadAfterResume = 1;
    }
  }
}

- (void)_setFailedRequest:(id)a3
{
  int v5 = (NSURLRequest *)a3;
  failedRequest = self->_failedRequest;
  id v14 = v5;
  if (failedRequest != v5)
  {
    if (failedRequest)
    {
      char v7 = [(NSURLRequest *)failedRequest URL];
      id v8 = [v7 host];

      if (v8)
      {
        BOOL v9 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
        [v9 removeObserver:self forHostname:v8];
      }
    }
    objc_storeStrong((id *)&self->_failedRequest, a3);
    self->_reloadAfterResume = 0;
    id v10 = self->_failedRequest;
    if (v10)
    {
      id v11 = [(NSURLRequest *)v10 URL];
      id v12 = [v11 host];

      if (v12)
      {
        id v13 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
        [v13 addObserver:self selector:sel__reachabilityChanged_ forHostname:v12];
      }
    }
  }
}

- (id)_titleForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  if (v4 != -1205 && v4 != -1102 && v4 != -1100) {
    isDiffieHellmanError(v3);
  }
  int v5 = _WBSLocalizedString();

  return v5;
}

- (void)_handleFrameLoadError:(id)a3 forURL:(id)a4 recoveryAttempter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 code];
  if ((!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E4F46808]) || v11 != 102)
    && (!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0]) || v11 != -1012 && v11 != -999))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke;
    v12[3] = &unk_1E5C727B8;
    v12[4] = self;
    id v13 = v8;
    uint64_t v15 = v11;
    id v14 = v9;
    [(_SFPageLoadErrorController *)self _handleCertificateError:v13 forURL:v14 isMainFrame:1 recoveryAttempter:v10 completionHandler:v12];
  }
}

- (void)addDisallowedUseOfJavaScriptAlert
{
  _WBSLocalizedString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _WBSLocalizedString();
  [(_SFPageLoadErrorController *)self addAlertWithTitle:v4 bodyText:v3];
}

- (void)addDisallowedFileURLAlert
{
  id v3 = (void *)MEMORY[0x1E4F78270];
  _WBSLocalizedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 pageLoadErrorWithMessage:v5];
  [(_SFPageLoadErrorController *)self addDialog:v4];
}

- (void)clearFailedRequest
{
  self->_reloadingFailedRequest = 0;
}

- (void)reloadAfterError
{
  self->_failedRequest;
  self->_reloadingFailedRequest = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pageLoadErrorController:self loadFailedRequestAfterError:self->_failedRequest];
}

- (void)handleFrameLoadError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 failingURL];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___SFPageLoadErrorController_handleFrameLoadError___block_invoke;
  v7[3] = &unk_1E5C727E0;
  id v8 = v4;
  id v6 = v4;
  [(_SFPageLoadErrorController *)self _handleFrameLoadError:v6 forURL:v5 recoveryAttempter:v7];
}

- (void)handleSubframeCertificateError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 failingURL];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___SFPageLoadErrorController_handleSubframeCertificateError___block_invoke;
  v7[3] = &unk_1E5C727E0;
  id v8 = v4;
  id v6 = v4;
  [(_SFPageLoadErrorController *)self _handleCertificateError:v6 forURL:v5 isMainFrame:0 recoveryAttempter:v7 completionHandler:0];
}

- (void)handleLegacyTLSWithFailingURL:(id)a3 clickThroughURL:(id)a4 authenticationChallenge:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100___SFPageLoadErrorController_handleLegacyTLSWithFailingURL_clickThroughURL_authenticationChallenge___block_invoke;
  v11[3] = &unk_1E5C72808;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handleClientCertificateAuthenticationChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained pageLoadErrorControllerGetSecIdentityPreferencesController:self];

  id v10 = [v6 protectionSpace];
  uint64_t v11 = objc_msgSend(v10, "_sf_highLevelDomainAndPort");

  uint64_t v12 = [v9 shouldUseOnlyAvailableIdentityWithoutPromptingForDomainAndPort:v11];
  id v13 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    uint64_t v28 = v11;
    __int16 v29 = 1024;
    int v30 = v12;
    _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEFAULT, "Received challenge for domain: %{sensitive}@, use only available identity without prompt: %d", buf, 0x12u);
  }
  v26[0] = v6;
  v26[1] = @"reasonAuthenticationChallenge";
  id v14 = objc_msgSend(v7, "copy", @"authenticationChallenge", @"reason", @"completionHandler");

  v26[2] = v14;
  v25[3] = @"useOnlyAvailableIdentityWithoutPrompting";
  uint64_t v15 = [NSNumber numberWithBool:v12];
  v26[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  secIdentitiesCache = self->_secIdentitiesCache;
  uint64_t v18 = [v6 protectionSpace];
  uint64_t v19 = objc_msgSend(v18, "safari_identityPreferenceDomain");
  uint64_t v20 = [(WBSSecIdentitiesCache *)secIdentitiesCache secIdentityForDomain:v19];

  v21 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v21, OS_LOG_TYPE_DEFAULT, "Found a preferred identity to skip prompting", buf, 2u);
    }
    proceedWithClientCertificateIdentity(v20, v16);
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v21, OS_LOG_TYPE_DEFAULT, "Could not find a preferred identity to skip prompting", buf, 2u);
    }
    uint64_t v23 = newAlertToHandleClientSideCertificateErrorCode(-1206, v16);
    uint64_t v24 = v23;
    if (v23)
    {
      [v23 setHideAction:4];
      [v24 setContext:v16];
      [(_SFPageLoadErrorController *)self addAlert:v24];
    }
  }
}

- (void)addInvalidURLAlert
{
  id v3 = (void *)MEMORY[0x1E4F78270];
  _WBSLocalizedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 pageLoadErrorWithMessage:v5];
  [(_SFPageLoadErrorController *)self addDialog:v4];
}

- (void)addInvalidProfileAlert
{
  id v3 = (void *)MEMORY[0x1E4F78270];
  _WBSLocalizedString();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = _WBSLocalizedString();
  id v5 = [v3 genericErrorDialogWithTitle:v6 message:v4 applicationModal:0];
  [(_SFPageLoadErrorController *)self addDialog:v5];
}

- (void)addDownloadFailedAlertWithDescription:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _WBSLocalizedString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v4;
  id v5 = (void *)MEMORY[0x1E4F78270];
  id v6 = _WBSLocalizedString();
  id v7 = [v5 genericErrorDialogWithTitle:v6 message:v8 applicationModal:0];
  [(_SFPageLoadErrorController *)self addDialog:v7];
}

- (void)_showRepeatedWebProcessCrashError:(id)a3 URLString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _WBSLocalizedString();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = NSString;
  id v9 = _WBSLocalizedString();
  id v10 = objc_msgSend(v8, "stringWithFormat:", v9, v6);

  [(_SFPageLoadErrorController *)self showErrorPageWithTitle:v11 bodyText:v10 forError:v7];
}

- (void)_resetCrashCount:(id)a3
{
  self->_crashesSinceLastSuccessfulLoad = 0;
}

- (void)clearCrashCountResetTimer
{
  [(NSTimer *)self->_crashCountResetTimer invalidate];
  crashCountResetTimer = self->_crashCountResetTimer;
  self->_crashCountResetTimer = 0;
}

- (void)_resetCrashCountSoon
{
  [(_SFPageLoadErrorController *)self clearCrashCountResetTimer];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__resetCrashCount_ selector:0 userInfo:0 repeats:30.0];
  crashCountResetTimer = self->_crashCountResetTimer;
  self->_crashCountResetTimer = v3;
}

- (BOOL)updateCrashesAndShowCrashError:(id)a3 URLString:(id)a4
{
  unint64_t v4 = self->_crashesSinceLastSuccessfulLoad + 1;
  self->_crashesSinceLastSuccessfulLoad = v4;
  if (v4 >= 2)
  {
    self->_crashesSinceLastSuccessfulLoad = 0;
    [(_SFPageLoadErrorController *)self _showRepeatedWebProcessCrashError:a3 URLString:a4];
  }
  return v4 > 1;
}

- (void)scheduleResetCrashCount
{
  if (self->_crashesSinceLastSuccessfulLoad) {
    [(_SFPageLoadErrorController *)self _resetCrashCountSoon];
  }
}

- (void)webViewDidCommitErrorPagePreview:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v3 stringWithFormat:@"document.body.classList.remove('%@')", @"preview"];
  [v4 evaluateJavaScript:v5 completionHandler:0];
}

- (void)goBackButtonClicked
{
  protectionSpaceForInvalidCertificateBypass = self->_protectionSpaceForInvalidCertificateBypass;
  self->_protectionSpaceForInvalidCertificateBypass = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained backForwardList];
  id v6 = [v5 currentItem];
  id v7 = [v6 URL];

  id v8 = [WeakRetained backForwardList];
  id v9 = [v8 backItem];
  id v10 = [v9 URL];

  if (objc_msgSend(v7, "safari_isEqualToURL:", v10))
  {
    id v11 = [(_SFPageLoadErrorController *)self _firstItemWithUniqueURLInBackListFromURL:v7];
    if (v11) {
      id v12 = (id)[WeakRetained goToBackForwardListItem:v11];
    }
    else {
      [v4 pageLoadErrorControllerClosePage:self];
    }
  }
  else if ([WeakRetained canGoBack])
  {
    id v13 = (id)[WeakRetained goBack];
  }
  else
  {
    [v4 pageLoadErrorControllerClosePage:self];
  }
}

- (id)_firstItemWithUniqueURLInBackListFromURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = [WeakRetained backForwardList];
  id v7 = [v6 backList];

  id v8 = [WeakRetained backForwardList];
  id v9 = [v8 currentItem];

  id v10 = [v9 URL];
  char v11 = objc_msgSend(v4, "safari_isEqualToURL:", v10);

  if (v11)
  {
    uint64_t v23 = v7;
    id v24 = v4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = [v7 reverseObjectEnumerator];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          char v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = [v9 URL];
          uint64_t v19 = [v17 URL];
          int v20 = objc_msgSend(v18, "safari_isEqualToURL:", v19);

          if (!v20)
          {
            id v21 = v17;

            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v21 = 0;
LABEL_13:
    id v7 = v23;
    id v4 = v24;
  }
  else
  {
    id v21 = v9;
  }

  return v21;
}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  id v3 = [MEMORY[0x1E4F98A08] sharedManager];
  [v3 rememberCertificateBypassForProtectionSpace:self->_protectionSpaceForInvalidCertificateBypass inPrivateBrowsing:1];

  [(_SFPageLoadErrorController *)self _continueAfterCertificateAlertWithURL:self->_certificateFailingURL trust:self->_certificateTrust recoveryAttempter:self->_certificateRecoveryAttempter];
  protectionSpaceForInvalidCertificateBypass = self->_protectionSpaceForInvalidCertificateBypass;
  self->_protectionSpaceForInvalidCertificateBypass = 0;
}

- (void)visitInsecureWebsite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  legacyTLSWarningPageContext = self->_legacyTLSWarningPageContext;
  if (legacyTLSWarningPageContext)
  {
    id v5 = [(WBSCertificateWarningPageContext *)legacyTLSWarningPageContext failingURL];
    [WeakRetained pageLoadErrorController:self allowLegacyTLSConnectionForURL:v5 navigateToURL:self->_clickThroughURL];

    id v6 = self->_legacyTLSWarningPageContext;
    self->_legacyTLSWarningPageContext = 0;

    clickThroughURL = self->_clickThroughURL;
    self->_clickThroughURL = 0;
  }
  else if ([WeakRetained pageLoadErrorControllerShouldPermanentlyAcceptCertificate:self])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50___SFPageLoadErrorController_visitInsecureWebsite__block_invoke;
    v9[3] = &unk_1E5C724D8;
    v9[4] = self;
    id v8 = [MEMORY[0x1E4F78270] permanentlyAcceptCertificateDialogWithAcceptanceHandler:v9];
    [(_SFPageLoadErrorController *)self addDialog:v8];
  }
  else
  {
    [(_SFPageLoadErrorController *)self visitInsecureWebsiteWithTemporaryBypass];
  }
}

- (void)openClockSettings
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=DATE_AND_TIME"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

+ (void)clearOldCertificateBypasses
{
  id v2 = [MEMORY[0x1E4F58108] defaultTrustManager];
  [v2 removeAllTrusts];
}

- (void)showCertificateInformation
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v3 = (void *)getCertificateViewControllerClass_softClass;
  uint64_t v18 = getCertificateViewControllerClass_softClass;
  if (!getCertificateViewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getCertificateViewControllerClass_block_invoke;
    v14[3] = &unk_1E5C723B0;
    v14[4] = &v15;
    __getCertificateViewControllerClass_block_invoke((uint64_t)v14);
    id v3 = (void *)v16[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v15, 8);
  id v5 = (void *)[[v4 alloc] initWithTrust:self->_certificateTrust action:2];
  id v6 = _WBSLocalizedString();
  [v5 setTitle:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v8 = _WBSLocalizedString();
  id v9 = (void *)[v7 initWithTitle:v8 style:2 target:self action:sel__dismissCertificateViewButtonTapped];
  id v10 = [v5 navigationItem];
  [v10 setRightBarButtonItem:v9];

  char v11 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  certificateNavigationViewController = self->_certificateNavigationViewController;
  self->_certificateNavigationViewController = v11;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pageLoadErrorController:self presentViewController:self->_certificateNavigationViewController];
}

- (void)_dismissCertificateViewButtonTapped
{
  [(UINavigationController *)self->_certificateNavigationViewController dismissViewControllerAnimated:1 completion:0];
  certificateNavigationViewController = self->_certificateNavigationViewController;
  self->_certificateNavigationViewController = 0;
}

- (void)visitWebsiteWithoutPrivateRelay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pageLoadErrorControllerReloadWithoutPrivateRelay:self];
}

- (_SFPageLoadErrorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFPageLoadErrorControllerDelegate *)WeakRetained;
}

- (BOOL)reloadingFailedRequest
{
  return self->_reloadingFailedRequest;
}

- (NSURLRequest)failedRequest
{
  return self->_failedRequest;
}

- (unint64_t)crashesSinceLastSuccessfulLoad
{
  return self->_crashesSinceLastSuccessfulLoad;
}

- (SFDialogPresenting)dialogPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);

  return (SFDialogPresenting *)WeakRetained;
}

- (NSURLProtectionSpace)protectionSpaceForInvalidCertificateBypass
{
  return self->_protectionSpaceForInvalidCertificateBypass;
}

- (void)setProtectionSpaceForInvalidCertificateBypass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionSpaceForInvalidCertificateBypass, 0);
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_storeStrong((id *)&self->_failedRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificateNavigationViewController, 0);
  objc_storeStrong((id *)&self->_clickThroughURL, 0);
  objc_storeStrong((id *)&self->_certificateFailingURL, 0);
  objc_storeStrong(&self->_certificateRecoveryAttempter, 0);
  objc_storeStrong((id *)&self->_certificateWarningPageHandlerInterface, 0);
  objc_storeStrong((id *)&self->_certificateWarningPagePresenterProxy, 0);
  objc_storeStrong((id *)&self->_legacyTLSWarningPageContext, 0);
  objc_storeStrong((id *)&self->_secIdentitiesCache, 0);
  objc_storeStrong((id *)&self->_crashCountResetTimer, 0);

  objc_destroyWeak((id *)&self->_webView);
}

- (void)_fetchSpecializedMessageForError:(void *)a1 URL:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v9 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

- (void)_handleCertificateError:(void *)a1 forURL:(void *)a2 isMainFrame:recoveryAttempter:completionHandler:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  os_log_t v5 = [a2 userInfo];
  os_log_type_t v6 = objc_msgSend(v5, "safari_numberForKey:", *MEMORY[0x1E4F18EE0]);
  [v6 intValue];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v7, v8, v9, v10, v11, 0x12u);
}

@end