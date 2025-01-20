@interface WFWKWebViewCapturer
+ (id)deniedExternalResourcesLoadError;
+ (void)loadWebResource:(id)a3 withSize:(CGSize)a4 configuration:(id)a5 coercionOptions:(id)a6 completionHandler:(id)a7;
- (BOOL)didAttemptToLoadRemoteResources;
- (BOOL)didPresentSmartPrompt;
- (BOOL)userDidAllowLoadingExternalResources;
- (WFCoercionOptions)coercionOptions;
- (WFWKWebViewCapturer)initWithSize:(CGSize)a3 configuration:(id)a4 coercionOptions:(id)a5;
- (WFWebResource)webResource;
- (WKNavigation)pageNavigation;
- (WKWebView)webView;
- (id)completionHandler;
- (id)errorWithErrorCode:(int64_t)a3;
- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6;
- (void)generateBlockingContentRuleListWithCompletionHandler:(id)a3;
- (void)loadWebResource:(id)a3 completionHandler:(id)a4;
- (void)setCoercionOptions:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDidAttemptToLoadRemoteResources:(BOOL)a3;
- (void)setDidPresentSmartPrompt:(BOOL)a3;
- (void)setPageNavigation:(id)a3;
- (void)setUserDidAllowLoadingExternalResources:(BOOL)a3;
- (void)setWebResource:(id)a3;
- (void)setWebView:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation WFWKWebViewCapturer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_coercionOptions, 0);
  objc_storeStrong((id *)&self->_webResource, 0);
  objc_storeStrong((id *)&self->_pageNavigation, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setDidPresentSmartPrompt:(BOOL)a3
{
  self->_didPresentSmartPrompt = a3;
}

- (BOOL)didPresentSmartPrompt
{
  return self->_didPresentSmartPrompt;
}

- (void)setUserDidAllowLoadingExternalResources:(BOOL)a3
{
  self->_userDidAllowLoadingExternalResources = a3;
}

- (BOOL)userDidAllowLoadingExternalResources
{
  return self->_userDidAllowLoadingExternalResources;
}

- (void)setDidAttemptToLoadRemoteResources:(BOOL)a3
{
  self->_didAttemptToLoadRemoteResources = a3;
}

- (BOOL)didAttemptToLoadRemoteResources
{
  return self->_didAttemptToLoadRemoteResources;
}

- (void)setCoercionOptions:(id)a3
{
}

- (WFCoercionOptions)coercionOptions
{
  return self->_coercionOptions;
}

- (void)setWebResource:(id)a3
{
}

- (WFWebResource)webResource
{
  return self->_webResource;
}

- (void)setPageNavigation:(id)a3
{
}

- (WKNavigation)pageNavigation
{
  return self->_pageNavigation;
}

- (void)setWebView:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (id)errorWithErrorCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"The web content could not be loaded because an internal error occurred.");
  v10[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:@"WFWKWebViewCapturerErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a6;
  if (![(WFWKWebViewCapturer *)self didPresentSmartPrompt])
  {
    if ([(WFWKWebViewCapturer *)self userDidAllowLoadingExternalResources])
    {
      v10 = getWFSecurityLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
        _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_DEBUG, "%s Ignoring WebKit content blocker delegate call because the user has already provided authorization to load external resources.", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_17;
    }
    if ([v8 blockedLoad])
    {
      v10 = [(WFWKWebViewCapturer *)self coercionOptions];
      if ([v10 shouldContinueLoadingWebContentIfExternalResourcesAreDenied])
      {
        v11 = getWFSecurityLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
          _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_DEBUG, "%s Ignoring WebKit content blocker delegate call because the coercion options specify that we should load web content anyway (may result in lossy output).", buf, 0xCu);
        }
      }
      else
      {
        [(WFWKWebViewCapturer *)self setDidAttemptToLoadRemoteResources:1];
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke;
        aBlock[3] = &unk_26428A060;
        aBlock[4] = self;
        v12 = _Block_copy(aBlock);
        v13 = [v9 host];
        v14 = getWFSecurityLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
          __int16 v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_DEBUG, "%s WFWKWebViewCapturer prevented loading of external resource at %@, using coercion options to request permission to load.", buf, 0x16u);
        }

        [(WFWKWebViewCapturer *)self setDidPresentSmartPrompt:1];
        [(WFWKWebViewCapturer *)self setPageNavigation:0];
        v15 = [v10 permissionRequestor];
        v16 = [(WFWKWebViewCapturer *)self webView];
        uint64_t v17 = [v16 URL];
        v18 = (void *)v17;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_119;
        v22[3] = &unk_2642885A8;
        if (v17) {
          id v19 = (id)v17;
        }
        else {
          id v19 = v9;
        }
        id v23 = v13;
        v24 = self;
        id v25 = v12;
        id v20 = v12;
        id v21 = v13;
        [v15 requestUserConsentToLoadWebContentAtURL:v19 completionHandler:v22];
      }
      goto LABEL_16;
    }
  }
LABEL_17:
}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = getWFSecurityLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]_block_invoke";
    _os_log_impl(&dword_216505000, v2, OS_LOG_TYPE_DEBUG, "%s User authorized loading external resources, reloading with no content list", buf, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) webView];
  [v3 stopLoading];

  [*(id *)(a1 + 32) setUserDidAllowLoadingExternalResources:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_118;
  block[3] = &unk_26428A060;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_119(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 136315651;
      v13 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]_block_invoke";
      __int16 v14 = 2113;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_INFO, "%s User denied loading external resource at %{private}@ with error %@, bailing out.", (uint8_t *)&v12, 0x20u);
    }

    [*(id *)(a1 + 40) setUserDidAllowLoadingExternalResources:0];
    id v8 = [*(id *)(a1 + 40) webView];
    [v8 stopLoading];

    id v9 = [*(id *)(a1 + 40) completionHandler];

    if (v9)
    {
      v10 = [*(id *)(a1 + 40) completionHandler];
      v11 = [(id)objc_opt_class() deniedExternalResourcesLoadError];
      ((void (**)(void, void, void *))v10)[2](v10, 0, v11);
    }
  }
}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_118(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [v2 webResource];
  v3 = [*(id *)(a1 + 32) completionHandler];
  [v2 loadWebResource:v4 completionHandler:v3];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = [(WFWKWebViewCapturer *)self pageNavigation];
  int v9 = [v8 isEqual:v7];

  v10 = v13;
  if (v9)
  {
    v11 = [(WFWKWebViewCapturer *)self completionHandler];

    if (v11)
    {
      int v12 = [(WFWKWebViewCapturer *)self completionHandler];
      ((void (**)(void, void, id))v12)[2](v12, 0, v13);
    }
    [(WFWKWebViewCapturer *)self setCompletionHandler:0];
    [(WFWKWebViewCapturer *)self setWebView:0];
    v10 = v13;
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = [(WFWKWebViewCapturer *)self pageNavigation];
  int v9 = [v8 isEqual:v7];

  v10 = v13;
  if (v9)
  {
    v11 = [(WFWKWebViewCapturer *)self completionHandler];

    if (v11)
    {
      int v12 = [(WFWKWebViewCapturer *)self completionHandler];
      ((void (**)(void, void, id))v12)[2](v12, 0, v13);
    }
    [(WFWKWebViewCapturer *)self setCompletionHandler:0];
    [(WFWKWebViewCapturer *)self setWebView:0];
    v10 = v13;
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFWKWebViewCapturer *)self pageNavigation];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 200000000);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__WFWKWebViewCapturer_webView_didFinishNavigation___block_invoke;
    v11[3] = &unk_264288C08;
    v11[4] = self;
    id v12 = v6;
    dispatch_after(v10, MEMORY[0x263EF83A0], v11);
  }
}

void __51__WFWKWebViewCapturer_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  if (v2)
  {
    v3 = (void *)v2;
    if ([*(id *)(a1 + 32) didAttemptToLoadRemoteResources])
    {
      char v4 = [*(id *)(a1 + 32) userDidAllowLoadingExternalResources];

      if ((v4 & 1) == 0) {
        return;
      }
    }
    else
    {
    }
    id v5 = [*(id *)(a1 + 32) completionHandler];
    v5[2](v5, *(void *)(a1 + 40), 0);

    id v6 = *(void **)(a1 + 32);
    [v6 setCompletionHandler:0];
  }
}

- (void)generateBlockingContentRuleListWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v4 = (void (**)(id, void, id))a3;
  id v17 = 0;
  id v5 = [MEMORY[0x263F08900] dataWithJSONObject:&unk_26C743B10 options:0 error:&v17];
  id v6 = v17;
  if (v6)
  {
    id v7 = getWFSecurityLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFWKWebViewCapturer generateBlockingContentRuleListWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_FAULT, "%s Failed to serialize JSON content rule list: %@", buf, 0x16u);
    }

    v4[2](v4, 0, v6);
  }
  else
  {
    id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    int v9 = (objc_class *)objc_opt_class();
    dispatch_time_t v10 = NSStringFromClass(v9);
    v11 = +[WFTemporaryFileManager createTemporaryDirectoryWithFilename:v10];

    if (v11)
    {
      uint64_t v18 = 0;
      id v19 = &v18;
      uint64_t v20 = 0x2050000000;
      id v12 = (void *)getWKContentRuleListStoreClass_softClass;
      uint64_t v21 = getWKContentRuleListStoreClass_softClass;
      if (!getWKContentRuleListStoreClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getWKContentRuleListStoreClass_block_invoke;
        id v23 = &unk_26428AC60;
        v24 = &v18;
        __getWKContentRuleListStoreClass_block_invoke((uint64_t)buf);
        id v12 = (void *)v19[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v18, 8);
      __int16 v14 = [v13 storeWithURL:v11];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __76__WFWKWebViewCapturer_generateBlockingContentRuleListWithCompletionHandler___block_invoke;
      v15[3] = &unk_264288580;
      __int16 v16 = v4;
      [v14 compileContentRuleListForIdentifier:@"com.apple.ContentKit.WFWKWebViewCapturerContentRuleList" encodedContentRuleList:v8 completionHandler:v15];
    }
    else
    {
      __int16 v14 = [(WFWKWebViewCapturer *)self errorWithErrorCode:1000];
      v4[2](v4, 0, v14);
    }
  }
}

void __76__WFWKWebViewCapturer_generateBlockingContentRuleListWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = getWFSecurityLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315394;
      id v8 = "-[WFWKWebViewCapturer generateBlockingContentRuleListWithCompletionHandler:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_FAULT, "%s Failed to create content rule list: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)loadWebResource:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_DEFAULT, "%s WFWKWebViewCapturer is loading resource: %@", buf, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = [v6 file];
    id v10 = +[WFApplicationContext sharedContext];
    uint64_t v11 = [v10 provider];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v9 fileURL];
      id v13 = NSURL;
      __int16 v14 = NSHomeDirectory();
      uint64_t v15 = [v13 fileURLWithPath:v14 isDirectory:1];
      char v16 = objc_msgSend(v12, "wf_isContainedByDirectoryAtURL:", v15);

      if (v16)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v10 = (void *)[v9 copy];
      +[WFWebResource webResourceWithFile:v10];
      uint64_t v11 = v6;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }
LABEL_9:
  [(WFWKWebViewCapturer *)self setCompletionHandler:v7];
  [(WFWKWebViewCapturer *)self setWebResource:v6];
  BOOL v17 = [(WFWKWebViewCapturer *)self userDidAllowLoadingExternalResources];
  uint64_t v18 = getWFSecurityLogObject();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
      _os_log_impl(&dword_216505000, v18, OS_LOG_TYPE_DEBUG, "%s User allowed loading external resources, removing content block list.", buf, 0xCu);
    }

    uint64_t v20 = [(WFWKWebViewCapturer *)self webView];
    uint64_t v21 = [v20 configuration];
    v22 = [v21 userContentController];
    [v22 removeAllContentRuleLists];

    id v23 = [(WFWKWebViewCapturer *)self webView];
    v24 = [v6 loadInWKWebView:v23];
    [(WFWKWebViewCapturer *)self setPageNavigation:v24];
  }
  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
      _os_log_impl(&dword_216505000, v18, OS_LOG_TYPE_DEBUG, "%s User didn't yet allow loading external resources, preventing it.", buf, 0xCu);
    }

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __57__WFWKWebViewCapturer_loadWebResource_completionHandler___block_invoke;
    __int16 v29 = &unk_264288558;
    v30 = self;
    id v31 = v6;
    [(WFWKWebViewCapturer *)self generateBlockingContentRuleListWithCompletionHandler:&v26];
  }
  uint64_t v25 = [(WFWKWebViewCapturer *)self webView];
  objc_setAssociatedObject(v25, &loadWebResource_completionHandler__WFWKWebViewCapturer, self, (void *)1);
}

void __57__WFWKWebViewCapturer_loadWebResource_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) webView];
    id v8 = [v7 configuration];
    __int16 v9 = [v8 userContentController];
    [v9 addContentRuleList:v5];

    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) webView];
    id v12 = [v10 loadInWKWebView:v11];
    [*(id *)(a1 + 32) setPageNavigation:v12];
  }
  else
  {
    id v13 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      BOOL v17 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create content rule list: %@", (uint8_t *)&v16, 0x16u);
    }

    __int16 v14 = [*(id *)(a1 + 32) completionHandler];
    uint64_t v15 = [*(id *)(a1 + 32) errorWithErrorCode:1001];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v15);
  }
}

- (WFWKWebViewCapturer)initWithSize:(CGSize)a3 configuration:(id)a4 coercionOptions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFWKWebViewCapturer.m", 81, @"Invalid parameter not satisfying: %@", @"coercionOptions" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFWKWebViewCapturer;
  id v12 = [(WFWKWebViewCapturer *)&v22 init];
  if (v12)
  {
    if (!v10)
    {
      uint64_t v28 = 0;
      __int16 v29 = &v28;
      uint64_t v30 = 0x2050000000;
      id v13 = (void *)getWKWebViewConfigurationClass_softClass_13561;
      uint64_t v31 = getWKWebViewConfigurationClass_softClass_13561;
      if (!getWKWebViewConfigurationClass_softClass_13561)
      {
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        uint64_t v25 = __getWKWebViewConfigurationClass_block_invoke_13562;
        uint64_t v26 = &unk_26428AC60;
        uint64_t v27 = &v28;
        __getWKWebViewConfigurationClass_block_invoke_13562((uint64_t)&v23);
        id v13 = (void *)v29[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v28, 8);
      id v10 = (id)objc_opt_new();
    }
    uint64_t v28 = 0;
    __int16 v29 = &v28;
    uint64_t v30 = 0x2050000000;
    uint64_t v15 = (void *)getWKWebViewClass_softClass_13563;
    uint64_t v31 = getWKWebViewClass_softClass_13563;
    if (!getWKWebViewClass_softClass_13563)
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getWKWebViewClass_block_invoke_13564;
      uint64_t v26 = &unk_26428AC60;
      uint64_t v27 = &v28;
      __getWKWebViewClass_block_invoke_13564((uint64_t)&v23);
      uint64_t v15 = (void *)v29[3];
    }
    int v16 = v15;
    _Block_object_dispose(&v28, 8);
    uint64_t v17 = objc_msgSend([v16 alloc], "initWithFrame:configuration:", v10, 0.0, 0.0, width, height);
    webView = v12->_webView;
    v12->_webView = (WKWebView *)v17;

    [(WKWebView *)v12->_webView setNavigationDelegate:v12];
    objc_storeStrong((id *)&v12->_coercionOptions, a5);
    *(_WORD *)&v12->_didAttemptToLoadRemoteResources = 0;
    v12->_didPresentSmartPrompt = 0;
    id v19 = v12;
  }

  return v12;
}

+ (id)deniedExternalResourcesLoadError
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v3 = WFLocalizedString(@"The web content could not be loaded because your privacy settings do not allow this shortcut to load external web content. You can change this in the Privacy tab of the shortcut's settings.");
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:@"WFWKWebViewCapturerErrorDomain" code:1002 userInfo:v4];

  return v5;
}

+ (void)loadWebResource:(id)a3 withSize:(CGSize)a4 configuration:(id)a5 coercionOptions:(id)a6 completionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __96__WFWKWebViewCapturer_loadWebResource_withSize_configuration_coercionOptions_completionHandler___block_invoke;
  uint64_t v26 = &unk_264288530;
  CGFloat v31 = width;
  CGFloat v32 = height;
  id v16 = v13;
  id v27 = v16;
  id v17 = v14;
  id v28 = v17;
  id v18 = v12;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  uint64_t v20 = _Block_copy(&v23);
  uint64_t v21 = (void *)MEMORY[0x263F08B88];
  objc_super v22 = v20;
  if (objc_msgSend(v21, "isMainThread", v23, v24, v25, v26)) {
    v22[2](v22);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v22);
  }
}

void __96__WFWKWebViewCapturer_loadWebResource_withSize_configuration_coercionOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[WFWKWebViewCapturer initWithSize:configuration:coercionOptions:]([WFWKWebViewCapturer alloc], "initWithSize:configuration:coercionOptions:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [(WFWKWebViewCapturer *)v2 loadWebResource:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

@end