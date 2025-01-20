@interface SGDOMParser
- (id)_parseDocument:(id)a3;
- (id)parseHTML:(id)a3;
- (id)webView;
- (void)runJavascriptOnWebView:(id)a3 withCallback:(id)a4;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation SGDOMParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_loadedSem, 0);
}

- (void)runJavascriptOnWebView:(id)a3 withCallback:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[SGAsset localeAsset];
  v8 = [v7 filesystemPathForAssetDataRelativePath:@"HTMLPreprocessor.js"];

  if (v8)
  {
    id v15 = 0;
    v9 = [NSString stringWithContentsOfFile:v8 encoding:4 error:&v15];
    id v10 = v15;
    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__SGDOMParser_runJavascriptOnWebView_withCallback___block_invoke;
      v13[3] = &unk_1E65B8BC0;
      id v14 = v6;
      [v5 evaluateJavaScript:v9 completionHandler:v13];
    }
    else
    {
      v12 = sgEventsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v10;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGDOMParser: jsContent nil: %@", buf, 0xCu);
      }

      (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x1E4F1CC08]);
    }
  }
  else
  {
    v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGDOMParser: Nil path for HTMLPreprocessor from asset", buf, 2u);
    }

    (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x1E4F1CC08]);
  }
}

void __51__SGDOMParser_runJavascriptOnWebView_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = sgEventsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "Error evaluating JS: %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  loadedSem = self->_loadedSem;
  if (loadedSem) {
    dispatch_semaphore_signal(loadedSem);
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  loadedSem = self->_loadedSem;
  if (loadedSem) {
    dispatch_semaphore_signal(loadedSem);
  }
}

- (id)_parseDocument:(id)a3
{
  id v4 = a3;
  id v5 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__18447;
  v33[4] = __Block_byref_object_dispose__18448;
  id v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18447;
  v31 = __Block_byref_object_dispose__18448;
  id v32 = 0;
  id v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  loadedSem = self->_loadedSem;
  self->_loadedSem = v6;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SGDOMParser__parseDocument___block_invoke;
  block[3] = &unk_1E65C0700;
  v26 = v33;
  block[4] = self;
  id v8 = v4;
  id v25 = v8;
  dispatch_async(v5, block);

  [MEMORY[0x1E4F93B18] waitForSemaphore:self->_loadedSem];
  if (self->_webView)
  {
    id v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGDOMParser: Loaded HTML Document", buf, 2u);
    }

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __30__SGDOMParser__parseDocument___block_invoke_14;
    uint64_t v18 = &unk_1E65C06D8;
    v19 = self;
    v21 = v33;
    v22 = &v27;
    v11 = v10;
    v20 = v11;
    v12 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], &v15);

    objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:", v11, v15, v16, v17, v18, v19);
    id v13 = (id)v28[5];
  }
  else
  {
    id v13 = (id)v28[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v33, 8);

  return v13;
}

id __30__SGDOMParser__parseDocument___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) webView];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v5) {
    return (id)[v5 loadHTMLString:*(void *)(a1 + 40) baseURL:0];
  }
  v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGDOMParser: Unable to load WebView", v8, 2u);
  }

  return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

void __30__SGDOMParser__parseDocument___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__SGDOMParser__parseDocument___block_invoke_2;
  v3[3] = &unk_1E65B8B98;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 runJavascriptOnWebView:v1 withCallback:v3];
}

void __30__SGDOMParser__parseDocument___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)webView
{
  webView = self->_webView;
  if (webView)
  {
LABEL_18:
    dispatch_semaphore_t v10 = webView;
    goto LABEL_19;
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  id v4 = (void *)getWKWebViewConfigurationClass_softClass;
  uint64_t v43 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getWKWebViewConfigurationClass_block_invoke;
    v38 = &unk_1E65C0148;
    v39 = &v40;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v35);
    id v4 = (void *)v41[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v40, 8);
  uint64_t v6 = objc_opt_new();
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [getWKWebsiteDataStoreClass() nonPersistentDataStore];
    if (v8)
    {
      [v7 setWebsiteDataStore:v8];
    }
    else
    {
      v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v35) = 0;
        _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGDOMParser: datastore is nil", (uint8_t *)&v35, 2u);
      }
    }
    v12 = [v7 preferences];
    [v12 setJavaScriptCanOpenWindowsAutomatically:0];

    id v13 = [v7 preferences];
    [v13 _setWebAudioEnabled:0];

    id v14 = [v7 preferences];
    [v14 _setJavaScriptCanAccessClipboard:0];

    uint64_t v15 = [v7 preferences];
    [v15 _setStorageBlockingPolicy:2];

    uint64_t v16 = [v7 preferences];
    [v16 _setScreenCaptureEnabled:0];

    id v17 = [v7 preferences];
    [v17 _setPeerConnectionEnabled:0];

    uint64_t v18 = [v7 preferences];
    [v18 _setMediaDevicesEnabled:0];

    v19 = [v7 preferences];
    [v19 _setDOMPasteAllowed:0];

    v20 = [v7 preferences];
    [v20 _setAVFoundationEnabled:0];

    v21 = [v7 preferences];
    [v21 _setLoadsImagesAutomatically:0];

    v22 = [v7 preferences];
    [v22 _setRemotePlaybackEnabled:0];

    v23 = [v7 preferences];
    [v23 _setWebAudioEnabled:0];

    v24 = [v7 preferences];
    [v24 _setTextAutosizingEnabled:0];

    id v25 = [v7 preferences];
    [v25 _setShouldEnableTextAutosizingBoost:0];

    v26 = [getWKWebsiteDataStoreClass() nonPersistentDataStore];
    [v7 setWebsiteDataStore:v26];

    [v7 setAllowsAirPlayForMediaPlayback:0];
    [v7 _setAllowUniversalAccessFromFileURLs:0];
    [v7 _setLegacyEncryptedMediaAPIEnabled:0];
    [v7 _setAllowsJavaScriptMarkup:0];
    [v7 setAllowsInlineMediaPlayback:0];
    [v7 setAllowsPictureInPictureMediaPlayback:0];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    uint64_t v27 = (void *)getWKWebpagePreferencesClass_softClass;
    uint64_t v43 = getWKWebpagePreferencesClass_softClass;
    if (!getWKWebpagePreferencesClass_softClass)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __getWKWebpagePreferencesClass_block_invoke;
      v38 = &unk_1E65C0148;
      v39 = &v40;
      __getWKWebpagePreferencesClass_block_invoke((uint64_t)&v35);
      uint64_t v27 = (void *)v41[3];
    }
    id v28 = v27;
    _Block_object_dispose(&v40, 8);
    uint64_t v29 = objc_opt_new();
    [v29 setAllowsContentJavaScript:0];
    [v29 setPreferredContentMode:2];
    [v7 setDefaultWebpagePreferences:v29];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    v30 = (void *)getWKWebViewClass_softClass;
    uint64_t v43 = getWKWebViewClass_softClass;
    if (!getWKWebViewClass_softClass)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __getWKWebViewClass_block_invoke;
      v38 = &unk_1E65C0148;
      v39 = &v40;
      __getWKWebViewClass_block_invoke((uint64_t)&v35);
      v30 = (void *)v41[3];
    }
    v31 = v30;
    _Block_object_dispose(&v40, 8);
    id v32 = (WKWebView *)objc_msgSend([v31 alloc], "initWithFrame:configuration:", v7, 0.0, 0.0, 1366.0, 768.0);
    v33 = self->_webView;
    self->_webView = v32;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    webView = self->_webView;
    goto LABEL_18;
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v35) = 0;
    _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGGDOMParser: Unable to load WKWebConfiguration", (uint8_t *)&v35, 2u);
  }

  dispatch_semaphore_t v10 = 0;
LABEL_19:
  return v10;
}

- (id)parseHTML:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_html, a3);
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__18447;
  v46 = __Block_byref_object_dispose__18448;
  id v47 = 0;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", &v5->_html))
  {
    *(void *)buf = 0;
    v39 = buf;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    uint64_t v6 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__SGDOMParser_parseHTML___block_invoke;
    block[3] = &unk_1E65C06D8;
    uint64_t v36 = &v42;
    block[4] = v5;
    id v35 = v29;
    v37 = buf;
    dispatch_async(v6, block);

    uint64_t v7 = *MEMORY[0x1E4F1C3A0];
    do
    {
      if (v39[24]) {
        break;
      }
      id v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
      char v10 = [v8 runMode:v7 beforeDate:v9];
    }
    while ((v10 & 1) != 0);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = [(SGDOMParser *)v5 _parseDocument:v29];
    v12 = (void *)v43[5];
    v43[5] = v11;
  }
  id v13 = [(id)v43[5] objectForKeyedSubscript:@"plainText"];
  if (!v13
    || ([(id)v43[5] objectForKeyedSubscript:@"taggedCharacterRanges"],
        id v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == 0,
        v14,
        v13,
        v15))
  {
    v26 = 0;
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = [(id)v43[5] objectForKeyedSubscript:@"taggedCharacterRanges"];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1CB79B230]();
          v23 = [[SGTaggedCharacterRange alloc] initWithDict:v21];
          if (v23)
          {
            [v16 addObject:v23];
          }
          else
          {
            v24 = sgEventsLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v24, OS_LOG_TYPE_ERROR, "SGDOMParser: Error parsing tcr tags from js", buf, 2u);
            }
          }
          if (!v23)
          {
            v26 = 0;
            goto LABEL_25;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v48 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v25 = [SGDOMParserResult alloc];
    id v17 = [(id)v43[5] objectForKeyedSubscript:@"plainText"];
    v26 = [(SGDOMParserResult *)v25 initWithPlainText:v17 taggedCharacterRanges:v16];
LABEL_25:
  }
  _Block_object_dispose(&v42, 8);

  html = v5->_html;
  v5->_html = 0;

  objc_sync_exit(v5);
  return v26;
}

void __25__SGDOMParser_parseHTML___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _parseDocument:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

@end