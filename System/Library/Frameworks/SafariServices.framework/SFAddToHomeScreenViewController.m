@interface SFAddToHomeScreenViewController
- (NSString)trustedClientBundleIdentifier;
- (SFAddToHomeScreenViewController)initWithAddToHomeScreenActivityItem:(id)a3 completion:(id)a4;
- (SFAddToHomeScreenViewController)initWithWebView:(id)a3 completion:(id)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_issueReadOnlySandboxExtensionForURL:(id)a3;
- (id)_stagedCookiesDirectoryURL;
- (id)serviceProxy;
- (void)_addPlaceholderView;
- (void)_addRemoteViewControllerIfNeeded;
- (void)_connectToService;
- (void)_copyCurrentCookiesToStagingDirectory;
- (void)_didLoadRemoteViewController:(id)a3;
- (void)_fetchWebClipMetadataViaJavaScript;
- (void)_initializeViewService;
- (void)_removePlaceholderView;
- (void)_removeStageCookiesDirectoryIfNeeded;
- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)loadView;
- (void)remoteViewController:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)serviceProxyWillQueueInvocation:(id)a3;
- (void)viewDidLoad;
@end

@implementation SFAddToHomeScreenViewController

- (SFAddToHomeScreenViewController)initWithWebView:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFAddToHomeScreenViewController;
  v9 = [(SFAddToHomeScreenViewController *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v7 URL];
    initialURL = v9->_initialURL;
    v9->_initialURL = (NSURL *)v10;

    objc_storeStrong((id *)&v9->_webView, a3);
    uint64_t v12 = MEMORY[0x1AD0C36A0](v8);
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = (id)v12;

    if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle"))
    {
      v14 = objc_alloc_init(SFWebAppDataProvider);
      provider = v9->_provider;
      v9->_provider = v14;

      [(SFWebAppDataProvider *)v9->_provider setDelegate:v9];
    }
    else
    {
      [(SFAddToHomeScreenViewController *)v9 _initializeViewService];
    }
    webView = v9->_webView;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__SFAddToHomeScreenViewController_initWithWebView_completion___block_invoke;
    v20[3] = &unk_1E5C75E60;
    v17 = v9;
    v21 = v17;
    [(WKWebView *)webView _getApplicationManifestWithCompletionHandler:v20];
    v18 = v17;
  }
  return v9;
}

void __62__SFAddToHomeScreenViewController_initWithWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), a2);
  v4 = objc_opt_new();
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 1016);
  if (v7)
  {
    [v4 setObject:v7 forKeyedSubscript:@"Manifest"];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  id v8 = [*(id *)(v6 + 1008) title];

  if (v8)
  {
    v9 = [*(id *)(*(void *)(a1 + 32) + 1008) title];
    [v5 setObject:v9 forKeyedSubscript:@"PageTitle"];
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 1008) URL];

  if (v10)
  {
    v11 = [*(id *)(*(void *)(a1 + 32) + 1008) URL];
    [v5 setObject:v11 forKeyedSubscript:@"PageURL"];
  }
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 1008) themeColor];

  if (v12)
  {
    v13 = [*(id *)(*(void *)(a1 + 32) + 1008) themeColor];
    [v5 setObject:v13 forKeyedSubscript:@"PageThemeColor"];
  }
  v14 = [*(id *)(*(void *)(a1 + 32) + 1008) underPageBackgroundColor];

  if (v14)
  {
    v15 = [*(id *)(*(void *)(a1 + 32) + 1008) underPageBackgroundColor];
    [v5 setObject:v15 forKeyedSubscript:@"UnderPageBackgroundColor"];
  }
  char v16 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle");
  uint64_t v17 = *(void *)(a1 + 32);
  if (v16)
  {
    [*(id *)(v17 + 1040) prepareWithManifestData:v5];
    v18 = [*(id *)(*(void *)(a1 + 32) + 1040) activityViewController];
    [*(id *)(a1 + 32) addChildViewController:v18];
    v19 = [v18 view];
    v20 = [*(id *)(a1 + 32) view];
    [v20 addSubview:v19];

    v21 = [*(id *)(a1 + 32) view];
    [v21 bounds];
    objc_msgSend(v19, "setFrame:");

    [v19 setAutoresizingMask:18];
  }
  else
  {
    [*(id *)(v17 + 992) didFetchManifestData:v5];
  }
  [*(id *)(a1 + 32) _fetchWebClipMetadataViaJavaScript];
}

- (SFAddToHomeScreenViewController)initWithAddToHomeScreenActivityItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SFAddToHomeScreenViewController;
  id v8 = [(SFAddToHomeScreenViewController *)&v38 init];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = MEMORY[0x1AD0C36A0](v7);
  id completionHandler = v8->_completionHandler;
  v8->_id completionHandler = (id)v9;

  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [v6 title];
  [v11 setObject:v12 forKeyedSubscript:@"PageTitle"];

  v13 = [v6 URL];
  [v11 setObject:v13 forKeyedSubscript:@"PageURL"];

  uint64_t v14 = [v6 URL];
  initialURL = v8->_initialURL;
  v8->_initialURL = (NSURL *)v14;

  [(SFAddToHomeScreenViewController *)v8 _initializeViewService];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke;
  v36[3] = &unk_1E5C75E88;
  char v16 = v8;
  v37 = v16;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v36);
  if (objc_opt_respondsToSelector())
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2;
    v31[3] = &unk_1E5C75ED8;
    id v32 = v6;
    id v33 = v11;
    v34 = v16;
    v35 = v17;
    [v32 getHomeScreenWebAppInfoWithCompletionHandler:v31];

    id v18 = v32;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      ((void (**)(void, void *))v17)[2](v17, v11);
      goto LABEL_8;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_10;
    v27[3] = &unk_1E5C75F28;
    id v28 = v6;
    id v29 = v11;
    v30 = v17;
    [v28 getWebAppManifestWithCompletionHandler:v27];

    id v18 = v28;
  }

LABEL_8:
  if (objc_opt_respondsToSelector())
  {
    v19 = [v6 iconItemProvider];
    if (v19 && [v19 canLoadObjectOfClass:objc_opt_class()])
    {
      uint64_t v20 = objc_opt_class();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_16;
      v24[3] = &unk_1E5C75F50;
      id v25 = v6;
      v26 = v16;
      id v21 = (id)[v19 loadObjectOfClass:v20 completionHandler:v24];
    }
  }
  id v22 = v16;

LABEL_14:
  return v8;
}

uint64_t __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 992) didFetchManifestData:a2];
  v3 = *(void **)(*(void *)(a1 + 32) + 992);

  return [v3 didFetchWebClipMetadata:0];
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_3;
  block[3] = &unk_1E5C75EB0;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) manifest];

  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F46748]);
    id v4 = [*(id *)(a1 + 32) manifest];
    v5 = [v4 jsonData];
    id v6 = [*(id *)(a1 + 32) manifest];
    id v7 = [v6 manifestURL];
    id v8 = [*(id *)(a1 + 40) URL];
    id v9 = (void *)[v3 initWithJSONData:v5 manifestURL:v7 documentURL:v8];

    if (v9)
    {
      [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:@"Manifest"];
      id v10 = [*(id *)(a1 + 32) websiteCookies];

      if (v10)
      {
        uint64_t v11 = [*(id *)(a1 + 32) websiteCookies];
        uint64_t v12 = *(void *)(a1 + 56);
        v13 = *(void **)(v12 + 1056);
        *(void *)(v12 + 1056) = v11;

        [*(id *)(a1 + 56) _copyCurrentCookiesToStagingDirectory];
LABEL_12:

        return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      v15 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      char v16 = "Website cookies not provided.";
      uint64_t v17 = buf;
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v20 = 0;
      char v16 = "Could not create _WKApplicationManifest.";
      uint64_t v17 = (uint8_t *)&v20;
    }
    _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    goto LABEL_12;
  }
  uint64_t v14 = WBS_LOG_CHANNEL_PREFIXWebApp();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_DEFAULT, "SFAddToHomeScreenInfo or BEWebAppManifest was nil. Cannot apply to web clip.", v19, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_10(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2_11;
  v5[3] = &unk_1E5C75F00;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2_11(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F46748]);
    id v3 = [*(id *)(a1 + 32) jsonData];
    id v4 = [*(id *)(a1 + 32) manifestURL];
    v5 = [*(id *)(a1 + 40) URL];
    id v6 = (void *)[v2 initWithJSONData:v3 manifestURL:v4 documentURL:v5];

    if (v6)
    {
      [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:@"Manifest"];
    }
    else
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_DEFAULT, "Could not create _WKApplicationManifest.", buf, 2u);
      }
    }
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "BEWebAppManifest was nil. Cannot apply to web clip.", v10, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 40) + 992) didReceiveWebClipIcon:v5];
  }
  else if (v6)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_16_cold_1(a1, v8, v7);
    }
  }
}

- (id)_stagedCookiesDirectoryURL
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 temporaryDirectory];
  id v4 = [v3 URLByAppendingPathComponent:@"StagedCookies"];

  return v4;
}

- (void)_removeStageCookiesDirectoryIfNeeded
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A690B000, v6, v7, "Failed to clean up staged cookies, URL: %@, error: %{public}@", v8, v9, v10, v11, v12);
}

- (id)_issueReadOnlySandboxExtensionForURL:(id)a3
{
  [a3 fileSystemRepresentation];
  uint64_t v3 = sandbox_extension_issue_file();
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [NSString stringWithUTF8String:v3];
    free(v4);
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SFAddToHomeScreenViewController _issueReadOnlySandboxExtensionForURL:](v6);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)_copyCurrentCookiesToStagingDirectory
{
  [(SFAddToHomeScreenViewController *)self _removeStageCookiesDirectoryIfNeeded];
  uint64_t v3 = [(SFAddToHomeScreenViewController *)self _stagedCookiesDirectoryURL];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke;
  v15 = &unk_1E5C73530;
  char v16 = self;
  id v4 = v3;
  id v17 = v4;
  id v5 = (void (**)(void, void))MEMORY[0x1AD0C36A0](&v12);
  if (self->_webView)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F98A80], "sharedController", v12, v13, v14, v15, v16);
    [v6 copyCookiesFromWebView:self->_webView intoFolderAtURL:v4 completionHandler:v5];
  }
  else if (self->_cookies)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F98A80], "sharedController", v12, v13, v14, v15, v16);
    cookies = self->_cookies;
    uint64_t v9 = [(NSURL *)self->_initialURL host];
    uint64_t v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");
    uint64_t v11 = [v7 copyCookiesFromArray:cookies matchingDomain:v10 intoFolderAtURL:v4];

    v5[2](v5, v11);
  }
}

void __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _issueReadOnlySandboxExtensionForURL:*(void *)(a1 + 40)];
    if (v3)
    {
      id v8 = v3;
      char v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle");
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      if (v4) {
        [*(id *)(v6 + 1040) updateWithStagedCookiesDirectoryURL:v5 sandboxExtensionToken:v8];
      }
      else {
        [*(id *)(v6 + 992) didCopyStagedCookiesToURL:v5 sandboxExtensionToken:v8];
      }
      uint64_t v3 = v8;
    }
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke_cold_1(v7);
    }
  }
}

- (void)_fetchWebClipMetadataViaJavaScript
{
  uint64_t v3 = +[_SFWebClipMetadataFetcher metadataFetcherScriptSource];
  char v4 = [v3 stringByAppendingString:@"return WebClipMetadataFinderJS.webClipMetadata();"];

  webView = self->_webView;
  uint64_t v6 = [MEMORY[0x1E4F46678] worldWithName:@"WebClipMetadataFetcherWorld"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke;
  v7[3] = &unk_1E5C75F78;
  v7[4] = self;
  [(WKWebView *)webView callAsyncJavaScript:v4 arguments:0 inFrame:0 inContentWorld:v6 completionHandler:v7];
}

void __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke_cold_1((uint64_t)v7, v8);
    }
    char v9 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle");
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9) {
      [*(id *)(v10 + 1040) updateWithWebClipMetadata:MEMORY[0x1E4F1CC08]];
    }
    else {
      [*(id *)(v10 + 992) didFetchWebClipMetadata:0];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1024), a2);
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 1024);
    if (v13) {
      [v11 setObject:v13 forKeyedSubscript:@"MetaAndLinkTags"];
    }
    char v14 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle");
    uint64_t v15 = *(void *)(a1 + 32);
    if (v14) {
      [*(id *)(v15 + 1040) updateWithWebClipMetadata:v12];
    }
    else {
      [*(id *)(v15 + 992) didFetchWebClipMetadata:v12];
    }
    [*(id *)(a1 + 32) _copyCurrentCookiesToStagingDirectory];
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SFAddToHomeScreenViewController;
  [(SFAddToHomeScreenViewController *)&v3 loadView];
  [(SFAddToHomeScreenViewController *)self _addPlaceholderView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SFAddToHomeScreenViewController;
  [(SFAddToHomeScreenViewController *)&v5 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  char v4 = [(SFAddToHomeScreenViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)_initializeViewService
{
  if (!self->_serviceProxy)
  {
    objc_super v3 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC70078];
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFAddToHomeScreenServiceProtocol *)v3;

    [(SFAddToHomeScreenServiceProtocol *)self->_serviceProxy setDelegate:self];
    [(SFAddToHomeScreenViewController *)self _connectToService];
  }
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SFAddToHomeScreenViewController__connectToService__block_invoke;
  v6[3] = &unk_1E5C751F0;
  v6[4] = self;
  char v4 = +[SFAddToHomeScreenRemoteViewController requestViewControllerWithConnectionHandler:v6];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;
}

void __52__SFAddToHomeScreenViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 984);
  *(void *)(v7 + 984) = 0;

  if (v5)
  {
    [*(id *)(a1 + 32) _didLoadRemoteViewController:v5];
  }
  else
  {
    char v9 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__SFAddToHomeScreenViewController__connectToService__block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
}

- (id)serviceProxy
{
  [(SFAddToHomeScreenViewController *)self _initializeViewService];
  serviceProxy = self->_serviceProxy;

  return serviceProxy;
}

- (void)_didLoadRemoteViewController:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  id v6 = [v5 serviceViewControllerProxy];
  [(SFAddToHomeScreenServiceProtocol *)self->_serviceProxy setTarget:v6];

  [v5 setDelegate:self];
  if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle"))
  {
    [(SFAddToHomeScreenViewController *)self _addRemoteViewControllerIfNeeded];
  }
  else
  {
    serviceProxy = self->_serviceProxy;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__SFAddToHomeScreenViewController__didLoadRemoteViewController___block_invoke;
    v8[3] = &unk_1E5C724D8;
    v8[4] = self;
    [(SFAddToHomeScreenServiceProtocol *)serviceProxy prepareForDisplayWithCompletionHandler:v8];
  }
}

uint64_t __64__SFAddToHomeScreenViewController__didLoadRemoteViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRemoteViewControllerIfNeeded];
}

- (void)_addRemoteViewControllerIfNeeded
{
  [(SFAddToHomeScreenViewController *)self _removePlaceholderView];
  [(SFAddToHomeScreenViewController *)self addChildViewController:self->_remoteViewController];
  id v7 = [(SFAddToHomeScreenRemoteViewController *)self->_remoteViewController view];
  id v3 = [(SFAddToHomeScreenViewController *)self view];
  [v3 addSubview:v7];

  char v4 = [(SFAddToHomeScreenViewController *)self view];
  [v4 bounds];
  objc_msgSend(v7, "setFrame:");

  [v7 setAutoresizingMask:18];
  [(_UIRemoteViewController *)self->_remoteViewController didMoveToParentViewController:self];
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  id v6 = [(SFAddToHomeScreenViewController *)self view];
  [v6 setBackgroundColor:v5];
}

- (void)_addPlaceholderView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB19E8]);
  char v4 = objc_alloc_init(SFWebClipPlaceholderViewController);
  id v5 = (UINavigationController *)[v3 initWithRootViewController:v4];
  wrappingPlaceholderNavigationController = self->_wrappingPlaceholderNavigationController;
  self->_wrappingPlaceholderNavigationController = v5;

  [(SFAddToHomeScreenViewController *)self addChildViewController:self->_wrappingPlaceholderNavigationController];
  id v8 = [(SFAddToHomeScreenViewController *)self view];
  id v7 = [(UINavigationController *)self->_wrappingPlaceholderNavigationController view];
  [v8 addSubview:v7];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAutoresizingMask:18];
  [(UINavigationController *)self->_wrappingPlaceholderNavigationController didMoveToParentViewController:self];
}

- (void)_removePlaceholderView
{
  wrappingPlaceholderNavigationController = self->_wrappingPlaceholderNavigationController;
  if (wrappingPlaceholderNavigationController)
  {
    [(UINavigationController *)wrappingPlaceholderNavigationController willMoveToParentViewController:0];
    char v4 = [(UINavigationController *)self->_wrappingPlaceholderNavigationController view];
    [v4 removeFromSuperview];

    [(UINavigationController *)self->_wrappingPlaceholderNavigationController removeFromParentViewController];
    id v5 = self->_wrappingPlaceholderNavigationController;
    self->_wrappingPlaceholderNavigationController = 0;
  }
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest) {
    [(SFAddToHomeScreenViewController *)self _connectToService];
  }
}

- (void)remoteViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  [(SFAddToHomeScreenViewController *)self _removeStageCookiesDirectoryIfNeeded];
  if (v4) {
    [(id)*MEMORY[0x1E4FB2608] suspend];
  }
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    id v7 = (void (*)(void))*((void *)completionHandler + 2);
    v7();
  }
}

- (NSString)trustedClientBundleIdentifier
{
  if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle")) {
    return (NSString *)@"com.apple.mobilesafari";
  }
  else {
    return 0;
  }
}

- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4
{
  id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a4);
  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cookies, 0);
  objc_storeStrong((id *)&self->_wrappingPlaceholderNavigationController, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcherResult, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_16_cold_1(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 URL];
  id v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A690B000, v8, v9, "Failed to receive icon, URL: %{sensitive}@, error: %{public}@", v10, v11, v12, v13, v14);
}

- (void)_issueReadOnlySandboxExtensionForURL:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A690B000, v1, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token for copying cookies, errno = %d", (uint8_t *)v3, 8u);
}

void __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to copy cookies into temporary directory", v1, 2u);
}

void __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote view controller with error: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __52__SFAddToHomeScreenViewController__connectToService__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote view controller with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end