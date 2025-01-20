@interface EDWebContentParser
+ (OS_os_log)signpostLog;
- (BOOL)isDataDetectionEnabled;
- (EDWebContentParser)initWithOptions:(unint64_t)a3 cancelationToken:(id)a4;
- (EFScheduler)backgroundWorkScheduler;
- (WKWebView)webView;
- (id)_extractDataDetectorResultsMetadata:(id)a3;
- (id)_extractOneTimeCodeFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withSubject:(id)a6;
- (id)_extractPlainTextFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5;
- (id)_getDataDetectionCategoryString:(int)a3;
- (id)_parseHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withOptions:(unint64_t)a6 messageID:(id)a7;
- (id)_richLinkMetadataScript;
- (id)webViewConfiguration;
- (unint64_t)options;
- (unint64_t)signpostID;
- (void)_addRemoteContentWebViewObserver;
- (void)_disableDataDetection;
- (void)_enableDataDetection;
- (void)_retrieveRichLinkMetadata:(id)a3;
- (void)_updateContentRuleListsIfNeededForWebViewConfiguration:(id)a3;
- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4;
- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4;
- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4;
- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5;
- (void)dealloc;
- (void)logWebBundleMessage:(id)a3;
- (void)parseHTMLData:(id)a3 characterEncodingName:(id)a4 withOptions:(unint64_t)a5 forMessage:(id)a6 withSubject:(id)a7 completionHandler:(id)a8;
- (void)parseHTMLString:(id)a3 withOptions:(unint64_t)a4 forMessage:(id)a5 withSubject:(id)a6 completionHandler:(id)a7;
- (void)requestDataDetectionResultsWithBaseURL:(id)a3;
- (void)setIsDataDetectionEnabled:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)test_tearDown;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation EDWebContentParser

void ___ef_log_EDWebContentParser_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDWebContentParser");
  v1 = (void *)_ef_log_EDWebContentParser_log;
  _ef_log_EDWebContentParser_log = (uint64_t)v0;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDWebContentParser_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_11 != -1) {
    dispatch_once(&signpostLog_onceToken_11, block);
  }
  v2 = (void *)signpostLog_log_11;

  return (OS_os_log *)v2;
}

void __33__EDWebContentParser_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_11;
  signpostLog_log_11 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDWebContentParser)initWithOptions:(unint64_t)a3 cancelationToken:(id)a4
{
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EDWebContentParser;
  v8 = [(EDWebContentParser *)&v23 init];
  v9 = v8;
  if (v8)
  {
    [(EDWebContentParser *)v8 setOptions:a3];
    objc_storeStrong((id *)&v9->_token, a4);
    id v10 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithObject:v11];
    state = v9->_state;
    v9->_state = (EFLocked *)v12;

    v14 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    contentRuleListsObservationToken = v9->_contentRuleListsObservationToken;
    v9->_contentRuleListsObservationToken = v14;

    v16 = [[ECWebContentObserver alloc] initWithParser:v9];
    webContentObserver = v9->_webContentObserver;
    v9->_webContentObserver = v16;

    v9->_remoteContentParserLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDWebContentParser" qualityOfService:9];
    backgroundWorkScheduler = v9->_backgroundWorkScheduler;
    v9->_backgroundWorkScheduler = (EFScheduler *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentContentRuleLists = v9->_currentContentRuleLists;
    v9->_currentContentRuleLists = v20;

    v9->_contentRuleListsNeedUpdate = 1;
    v9->_contentRuleListsLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)dealloc
{
  if (self->_options)
  {
    id v3 = [(WKWebView *)self->_webView _remoteObjectRegistry];
    [v3 unregisterExportedObject:self->_webContentObserver interface:self->_webContentObserverInterface];
  }
  [(EFCancelationToken *)self->_contentRuleListsObservationToken cancel];
  v4.receiver = self;
  v4.super_class = (Class)EDWebContentParser;
  [(EDWebContentParser *)&v4 dealloc];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDWebContentParser.m", 142, @"%s can only be called from unit tests", "-[EDWebContentParser test_tearDown]");
  }
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v5 = [(EDWebContentParser *)self backgroundWorkScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__EDWebContentParser_test_tearDown__block_invoke;
  v9[3] = &unk_1E6BFF2F0;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlock:v9];
  while (1)
  {

    if ([v6 tryLockWhenCondition:1]) {
      break;
    }
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.001];
    id v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v7 runUntilDate:v5];

    [MEMORY[0x1E4F29060] sleepUntilDate:v5];
  }
  [v6 unlock];
}

uint64_t __35__EDWebContentParser_test_tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlockWithCondition:1];
}

- (id)webViewConfiguration
{
  if (pthread_main_np() != 1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"EDWebContentParser.m" lineNumber:164 description:@"Current thread must be main"];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EDWebContentParser_webViewConfiguration__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  if (webViewConfiguration_onceToken[0] != -1) {
    dispatch_once(webViewConfiguration_onceToken, block);
  }
  [(EDWebContentParser *)self _updateContentRuleListsIfNeededForWebViewConfiguration:webViewConfiguration_configuration];
  return (id)webViewConfiguration_configuration;
}

void __42__EDWebContentParser_webViewConfiguration__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(getWKWebViewConfigurationClass());
  id v3 = (void *)webViewConfiguration_configuration;
  webViewConfiguration_configuration = (uint64_t)v2;

  [(id)webViewConfiguration_configuration _setClientNavigationsRunAtForegroundPriority:1];
  id v12 = [(id)webViewConfiguration_configuration defaultWebpagePreferences];
  [v12 setAllowsContentJavaScript:0];

  if (_os_feature_enabled_impl() && ([*(id *)(a1 + 32) options] & 2) != 0) {
    [(id)webViewConfiguration_configuration setDataDetectorTypes:-1];
  }
  id v13 = objc_alloc_init(get_WKProcessPoolConfigurationClass());
  objc_super v4 = [MEMORY[0x1E4F60818] bundle];
  v5 = [v4 URLForResource:@"EmailCore" withExtension:@"wkbundle" subdirectory:@"PlugIns"];
  [v13 setInjectedBundleURL:v5];

  id v6 = (void *)[objc_alloc(getWKProcessPoolClass()) _initWithConfiguration:v13];
  [(id)webViewConfiguration_configuration setProcessPool:v6];
  getWKUserContentControllerClass();
  id v7 = objc_opt_new();
  [(id)webViewConfiguration_configuration setUserContentController:v7];

  if (([*(id *)(a1 + 32) options] & 4) != 0)
  {
    v8 = [*(id *)(a1 + 32) _richLinkMetadataScript];
    if (v8)
    {
      v9 = [(id)webViewConfiguration_configuration userContentController];
      [v9 addUserScript:v8];
    }
    id v10 = [(id)webViewConfiguration_configuration userContentController];
    [v10 addScriptMessageHandler:*(void *)(a1 + 32) name:@"MetadataMessageHandler"];

    v11 = [(id)webViewConfiguration_configuration userContentController];
    [v11 addScriptMessageHandler:*(void *)(a1 + 32) name:@"LogHandler"];
  }
}

- (WKWebView)webView
{
  if (pthread_main_np() != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"EDWebContentParser.m" lineNumber:211 description:@"Current thread must be main"];
  }
  webView = self->_webView;
  if (!webView)
  {
    uint32_t v5 = arc4random_uniform(3u);
    if (arc4random()) {
      int v6 = 1;
    }
    else {
      int v6 = -1;
    }
    EFARC4NormallyDistributedRandomDoubleInRange();
    int v8 = v6 * (int)v7;
    EFARC4NormallyDistributedRandomDoubleInRange();
    int v10 = v6 * (int)v9;
    double v11 = (double)(v8 + 390);
    double v12 = (double)(v10 + 844);
    double v13 = (double)(v8 + 834);
    double v14 = (double)(v10 + 1194);
    if (v5)
    {
      double v13 = 0.0;
      double v14 = 0.0;
    }
    if (v5 != 1)
    {
      double v11 = v13;
      double v12 = v14;
    }
    if (v5 == 2) {
      double v15 = (double)(v8 + 1325);
    }
    else {
      double v15 = v11;
    }
    if (v5 == 2) {
      double v16 = (double)(v10 + 906);
    }
    else {
      double v16 = v12;
    }
    id v17 = objc_alloc(getWKWebViewClass());
    uint64_t v18 = [(EDWebContentParser *)self webViewConfiguration];
    v19 = (WKWebView *)objc_msgSend(v17, "initWithFrame:configuration:", v18, 0.0, 0.0, v15, v16);
    v20 = self->_webView;
    self->_webView = v19;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    [(EDWebContentParser *)self _addRemoteContentWebViewObserver];
    webView = self->_webView;
  }

  return webView;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
}

- (id)_richLinkMetadataScript
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EDWebContentParser__richLinkMetadataScript__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  if (_richLinkMetadataScript_onceToken != -1) {
    dispatch_once(&_richLinkMetadataScript_onceToken, block);
  }
  id v2 = objc_alloc(MEMORY[0x1E4F466A8]);
  id v3 = (void *)[v2 initWithSource:_richLinkMetadataScript_findRichLinkMetadataSource injectionTime:1 forMainFrameOnly:0];

  return v3;
}

void __45__EDWebContentParser__richLinkMetadataScript__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  os_log_t v1 = [v0 pathForResource:@"FindRichLinkMetadata" ofType:@"js"];

  id v7 = 0;
  uint64_t v2 = [[NSString alloc] initWithContentsOfFile:v1 encoding:4 error:&v7];
  id v3 = v7;
  objc_super v4 = (void *)_richLinkMetadataScript_findRichLinkMetadataSource;
  _richLinkMetadataScript_findRichLinkMetadataSource = v2;

  if (!_richLinkMetadataScript_findRichLinkMetadataSource)
  {
    _ef_log_EDWebContentParser();
    uint32_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = objc_msgSend(v3, "ef_publicDescription");
      __45__EDWebContentParser__richLinkMetadataScript__block_invoke_cold_1(v6, buf, v5);
    }
  }
}

- (void)parseHTMLData:(id)a3 characterEncodingName:(id)a4 withOptions:(unint64_t)a5 forMessage:(id)a6 withSubject:(id)a7 completionHandler:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, void *))a8;
  if ((a5 & 2) != 0)
  {
    v19 = _ef_log_EDWebContentParser();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v16;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_INFO, "Scheduling data detection work for message %@", buf, 0xCu);
    }
  }
  if ((a5 & 8) != 0)
  {
    v20 = [(EDWebContentParser *)self _extractOneTimeCodeFromHTMLString:0 orWithData:v14 characterEncodingName:v15 withSubject:v17];
    v18[2](v18, v20);
  }
  backgroundWorkScheduler = self->_backgroundWorkScheduler;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __111__EDWebContentParser_parseHTMLData_characterEncodingName_withOptions_forMessage_withSubject_completionHandler___block_invoke;
  v26[3] = &unk_1E6C07B58;
  v26[4] = self;
  id v22 = v14;
  id v27 = v22;
  id v23 = v15;
  id v28 = v23;
  unint64_t v31 = a5;
  id v24 = v16;
  id v29 = v24;
  v25 = v18;
  v30 = v25;
  [(EFScheduler *)backgroundWorkScheduler performBlock:v26];
}

void __111__EDWebContentParser_parseHTMLData_characterEncodingName_withOptions_forMessage_withSubject_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _parseHTMLString:0 orWithData:*(void *)(a1 + 40) characterEncodingName:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 72) messageID:*(void *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)parseHTMLString:(id)a3 withOptions:(unint64_t)a4 forMessage:(id)a5 withSubject:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void *))a7;
  if ((a4 & 2) != 0)
  {
    id v16 = _ef_log_EDWebContentParser();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_INFO, "Scheduling data detection work for message %@", buf, 0xCu);
    }
  }
  if ((a4 & 8) != 0)
  {
    id v17 = [(EDWebContentParser *)self _extractOneTimeCodeFromHTMLString:v12 orWithData:0 characterEncodingName:0 withSubject:v14];
    v15[2](v15, v17);
  }
  backgroundWorkScheduler = self->_backgroundWorkScheduler;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__EDWebContentParser_parseHTMLString_withOptions_forMessage_withSubject_completionHandler___block_invoke;
  v22[3] = &unk_1E6C00EE8;
  v22[4] = self;
  id v19 = v12;
  id v23 = v19;
  unint64_t v26 = a4;
  id v20 = v13;
  id v24 = v20;
  v21 = v15;
  v25 = v21;
  [(EFScheduler *)backgroundWorkScheduler performBlock:v22];
}

void __91__EDWebContentParser_parseHTMLString_withOptions_forMessage_withSubject_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _parseHTMLString:*(void *)(a1 + 40) orWithData:0 characterEncodingName:0 withOptions:*(void *)(a1 + 64) messageID:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_extractPlainTextFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    int v10 = ECConvertCharacterSetNameToEncoding();
    double v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 4;
    }
    uint64_t v13 = [[NSString alloc] initWithData:v8 encoding:v12];

    id v7 = (id)v13;
  }
  if (v7)
  {
    id v14 = [MEMORY[0x1E4F608B0] snippetFromHTMLBody:v7 options:32 maxLength:0x7FFFFFFFFFFFFFFFLL preservingQuotedForwardedContent:0];
  }
  else
  {
    id v15 = _ef_log_EDWebContentParser();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EDWebContentParser _extractPlainTextFromHTMLString:orWithData:characterEncodingName:](v15);
    }

    id v14 = 0;
  }

  return v14;
}

- (id)_extractOneTimeCodeFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withSubject:(id)a6
{
  id v10 = a6;
  double v11 = [(EDWebContentParser *)self _extractPlainTextFromHTMLString:a3 orWithData:a4 characterEncodingName:a5];
  uint64_t v12 = +[EDDataDetectionUtilities extractOneTimeCode:v11 withSubject:v10];
  uint64_t v13 = objc_alloc_init(EDWebContentParserResults);
  [(EDWebContentParserResults *)v13 setOneTimeCode:v12];

  return v13;
}

- (id)_parseHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withOptions:(unint64_t)a6 messageID:(id)a7
{
  char v8 = a6;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v56 = a4;
  id v12 = a5;
  id v13 = a7;
  if ([(EFCancelationToken *)self->_token isCanceled])
  {
    v57 = 0;
  }
  else
  {
    uint64_t v54 = (uint64_t)v13;
    v57 = objc_alloc_init(EDWebContentParserResults);
    if ((v8 & 2) != 0)
    {
      id v14 = _ef_log_EDWebContentParser();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v54;
        _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_INFO, "Starting data detection work for message %@", buf, 0xCu);
      }

      [(EDWebContentParser *)self _enableDataDetection];
      id v15 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v16 = [(EDWebContentParser *)self signpostID];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EDWebContentParserDataDetection", "", buf, 2u);
      }
    }
    uint64_t v17 = v8 & 1;
    if (v8)
    {
      uint64_t v18 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v19 = [(EDWebContentParser *)self signpostID];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "EDWebContentParserLinkParsing", "", buf, 2u);
      }
    }
    os_unfair_lock_lock(&self->_remoteContentParserLock);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v92 = __Block_byref_object_copy__49;
    v93 = __Block_byref_object_dispose__49;
    id v94 = 0;
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__49;
    v87 = __Block_byref_object_dispose__49;
    id v88 = 0;
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__49;
    v81 = __Block_byref_object_dispose__49;
    id v82 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__49;
    v75 = __Block_byref_object_dispose__49;
    id v76 = 0;
    if (!v12)
    {
      CFStringConvertEncodingToIANACharSetName(0x600u);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v20 = v8 & 2;
    state = self->_state;
    v67[0] = MEMORY[0x1E4F143A8];
    uint64_t v22 = v8 & 4;
    v67[1] = 3221225472;
    v67[2] = __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke;
    v67[3] = &unk_1E6C07B80;
    char v68 = (v8 & 2) >> 1;
    v67[4] = self;
    v67[5] = &v83;
    char v69 = v8 & 1;
    char v70 = (v8 & 4) >> 2;
    v67[6] = &v77;
    v67[7] = &v71;
    v67[8] = buf;
    [(EFLocked *)state performWhileLocked:v67];
    id v23 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke_2;
    v61[3] = &unk_1E6C07BA8;
    id v62 = v55;
    v63 = self;
    v66 = buf;
    id v52 = v56;
    id v64 = v52;
    id v53 = v12;
    id v65 = v53;
    id v24 = [v23 performCancelableBlock:v61];

    if (v17)
    {
      unint64_t v26 = (void *)v78[5];
      id v60 = 0;
      id v27 = [v26 resultWithTimeout:&v60 error:10.0];
      id v25 = v60;
      [(EDWebContentParserResults *)v57 setRemoteContentLinks:v27];
    }
    else
    {
      id v25 = 0;
    }
    if (v20)
    {
      uint64_t v29 = (void *)v84[5];
      id v59 = 0;
      v30 = [v29 resultWithTimeout:&v59 error:10.0];
      id v28 = v59;
      [(EDWebContentParserResults *)v57 setDataDetectionResults:v30];
    }
    else
    {
      id v28 = 0;
    }
    if (v22)
    {
      v32 = (void *)v72[5];
      id v58 = 0;
      id v33 = [v32 resultWithTimeout:&v58 error:10.0];
      id v31 = v58;
      [(EDWebContentParserResults *)v57 setRichLinkResults:v33];
    }
    else
    {
      id v31 = 0;
    }
    if (objc_msgSend(v25, "ef_isTimeoutError"))
    {
      uint64_t v34 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v35 = [(EDWebContentParser *)self signpostID];
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v89 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v34, OS_SIGNPOST_INTERVAL_END, v35, "EDWebContentParserLinkParsing", "Parsing remote content links timed out", v89, 2u);
      }

      [v24 cancel];
    }
    if (v20 && objc_msgSend(v28, "ef_isTimeoutError"))
    {
      v36 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v37 = [(EDWebContentParser *)self signpostID];
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)v89 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v36, OS_SIGNPOST_INTERVAL_END, v37, "EDWebContentParserDataDetection", "Data detection timed out", v89, 2u);
      }

      v38 = _ef_log_EDWebContentParser();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v89 = 138412290;
        uint64_t v90 = v54;
        _os_log_impl(&dword_1DB39C000, v38, OS_LOG_TYPE_INFO, "Data detection for message %@ timed out", v89, 0xCu);
      }

      [v24 cancel];
    }
    if (objc_msgSend(v31, "ef_isTimeoutError"))
    {
      v39 = _ef_log_EDWebContentParser();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[EDWebContentParser _parseHTMLString:orWithData:characterEncodingName:withOptions:messageID:](v54, v39);
      }

      [v24 cancel];
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v77, 8);

    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(buf, 8);

    os_unfair_lock_unlock(&self->_remoteContentParserLock);
    if (v17)
    {
      v40 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v41 = [(EDWebContentParser *)self signpostID];
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        v42 = [(EDWebContentParserResults *)v57 remoteContentLinks];
        uint64_t v43 = [v42 count];
        uint64_t v44 = [v52 length];
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v44;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v40, OS_SIGNPOST_INTERVAL_END, v41, "EDWebContentParserLinkParsing", "Parsed NumberOfRemoteLinks=%{public,signpost.telemetry:number1}lu from SizeOfBody=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
      }
    }
    id v13 = (id)v54;
    if (v20)
    {
      v45 = +[EDWebContentParser signpostLog];
      os_signpost_id_t v46 = [(EDWebContentParser *)self signpostID];
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        v47 = [(EDWebContentParserResults *)v57 dataDetectionResults];
        uint64_t v48 = [v47 count];
        uint64_t v49 = [v52 length];
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v49;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v45, OS_SIGNPOST_INTERVAL_END, v46, "EDWebContentParserDataDetection", "Found NumberOfDataDtectionResults=%{public,signpost.telemetry:number1}lu from SizeOfBody=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
      }
      v50 = _ef_log_EDWebContentParser();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v54;
        _os_log_impl(&dword_1DB39C000, v50, OS_LOG_TYPE_INFO, "Data detection for message %@ finished.", buf, 0xCu);
      }

      id v12 = v53;
      id v13 = (id)v54;
    }
    else
    {
      id v12 = v53;
    }
  }

  return v57;
}

void __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v35 = v3;
  if (*(unsigned char *)(a1 + 72))
  {
    objc_super v4 = [v3 dataDetectionPromise];
    [v4 cancel];

    uint32_t v5 = [MEMORY[0x1E4F60E18] promise];
    [v35 setDataDetectionPromise:v5];

    int v6 = *(void **)(*(void *)(a1 + 32) + 24);
    id v7 = [v35 dataDetectionPromise];
    [v6 addCancelable:v7];

    char v8 = [v35 dataDetectionPromise];
    uint64_t v9 = [v8 future];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v3 = v35;
  }
  if (*(unsigned char *)(a1 + 73))
  {
    id v12 = [v3 remoteContentPromise];
    [v12 cancel];

    id v13 = [MEMORY[0x1E4F60E18] promise];
    [v35 setRemoteContentPromise:v13];

    id v14 = *(void **)(*(void *)(a1 + 32) + 24);
    id v15 = [v35 remoteContentPromise];
    [v14 addCancelable:v15];

    os_signpost_id_t v16 = [v35 remoteContentPromise];
    uint64_t v17 = [v16 future];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    os_signpost_id_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  if (*(unsigned char *)(a1 + 74))
  {
    uint64_t v20 = [v35 richLinkPromise];
    [v20 cancel];

    v21 = [MEMORY[0x1E4F60E18] promise];
    [v35 setRichLinkPromise:v21];

    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 24);
    id v23 = [v35 richLinkPromise];
    [v22 addCancelable:v23];

    id v24 = [v35 richLinkPromise];
    uint64_t v25 = [v24 future];
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  id v28 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v28 setScheme:@"x-apple-mail-parser"];
  uint64_t v29 = _parseHTMLString_orWithData_characterEncodingName_withOptions_messageID__baseURLCount++;
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v29);
  [v28 setPath:v30];

  id v31 = [v28 URL];
  [v35 setBaseURL:v31];

  uint64_t v32 = [v35 baseURL];
  uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;
}

void __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke_2(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)a1[5];
  if (a1[4])
  {
    objc_super v4 = [v3 webView];
    id v5 = (id)[v4 loadHTMLString:a1[4] baseURL:*(void *)(*(void *)(a1[8] + 8) + 40)];
  }
  else
  {
    objc_super v4 = [v3 webView];
    id v6 = (id)[v4 loadData:a1[6] MIMEType:@"text/html" characterEncodingName:a1[7] baseURL:*(void *)(*(void *)(a1[8] + 8) + 40)];
  }
}

- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  os_signpost_id_t v19 = __Block_byref_object_copy__49;
  uint64_t v20 = __Block_byref_object_dispose__49;
  id v21 = 0;
  state = self->_state;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __58__EDWebContentParser_baseURL_didRequestRemoteContentURLs___block_invoke;
  id v13 = &unk_1E6C07BD0;
  id v9 = v6;
  id v14 = v9;
  id v15 = &v16;
  [(EFLocked *)state performWhileLocked:&v10];
  objc_msgSend((id)v17[5], "finishWithResult:", v7, v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
}

void __58__EDWebContentParser_baseURL_didRequestRemoteContentURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 baseURL];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    uint64_t v6 = [v9 remoteContentPromise];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)_addRemoteContentWebViewObserver
{
  id v3 = [(objc_class *)get_WKRemoteObjectInterfaceClass() remoteObjectInterfaceWithProtocol:&unk_1F35EE280];
  webContentObserverInterface = self->_webContentObserverInterface;
  self->_webContentObserverInterface = v3;

  id v5 = self->_webContentObserverInterface;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v5, "setClasses:forSelector:argumentIndex:ofReply:");

  uint64_t v6 = self->_webContentObserverInterface;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v6, "setClasses:forSelector:argumentIndex:ofReply:");

  id v9 = self->_webContentObserverInterface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:");

  id v15 = [(WKWebView *)self->_webView _remoteObjectRegistry];
  [v15 registerExportedObject:self->_webContentObserver interface:self->_webContentObserverInterface];
}

- (void)_enableDataDetection
{
  if (![(EDWebContentParser *)self isDataDetectionEnabled])
  {
    [(EDWebContentParser *)self setIsDataDetectionEnabled:1];
  }
}

- (void)_disableDataDetection
{
  if ([(EDWebContentParser *)self isDataDetectionEnabled])
  {
    [(EDWebContentParser *)self setIsDataDetectionEnabled:0];
  }
}

- (void)requestDataDetectionResultsWithBaseURL:(id)a3
{
  id v4 = a3;
  if (self->_webView && [(EDWebContentParser *)self isDataDetectionEnabled])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__49;
    id v24 = __Block_byref_object_dispose__49;
    id v25 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__49;
    v18[4] = __Block_byref_object_dispose__49;
    id v19 = 0;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__49;
    uint64_t v16 = __Block_byref_object_dispose__49;
    id v17 = 0;
    state = self->_state;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__EDWebContentParser_requestDataDetectionResultsWithBaseURL___block_invoke;
    v6[3] = &unk_1E6C07BF8;
    id v9 = &v20;
    uint64_t v10 = v18;
    id v7 = v4;
    uint64_t v8 = self;
    uint64_t v11 = &v12;
    [(EFLocked *)state performWhileLocked:v6];
    [(id)v21[5] finishWithResult:v13[5]];

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v20, 8);
  }
}

void __61__EDWebContentParser_requestDataDetectionResultsWithBaseURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v15 = v3;
  id v5 = [v3 baseURL];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    uint64_t v6 = [v15 dataDetectionPromise];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 80) _dataDetectionResults];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [*(id *)(a1 + 40) _extractDataDetectorResultsMetadata:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (id)_extractDataDetectorResultsMetadata:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v31;
  uint64_t v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16, v31);
  if (v5)
  {
    uint64_t v6 = *(void *)v36;
    uint64_t v34 = *MEMORY[0x1E4F5F108];
    uint64_t v32 = *MEMORY[0x1E4F5F028];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v9 = -[EDWebContentParser _getDataDetectionCategoryString:](self, "_getDataDetectionCategoryString:", [v8 category]);
        uint64_t v10 = v9;
        if (v9)
        {
          if ([v9 isEqualToString:@"link"])
          {
            uint64_t v11 = [v8 type];
            if ([v11 isEqualToString:v34])
            {
            }
            else
            {
              uint64_t v12 = [v8 type];
              char v13 = [v12 isEqualToString:v32];

              if ((v13 & 1) == 0) {
                goto LABEL_26;
              }
            }
          }
          if ([v10 isEqualToString:@"misc"])
          {
            uint64_t v14 = [v8 type];

            uint64_t v10 = (void *)v14;
          }
          if ([v10 isEqualToString:@"link"])
          {
            id v15 = [v8 type];
            if ([v15 isEqualToString:v34])
            {
            }
            else
            {
              uint64_t v16 = [v8 type];
              char v17 = [v16 isEqualToString:v32];

              if ((v17 & 1) == 0) {
                goto LABEL_26;
              }
            }
          }
          if ([v10 isEqualToString:@"misc"])
          {
            uint64_t v18 = [v8 type];

            uint64_t v10 = (void *)v18;
          }
          id v19 = [v4 objectForKeyedSubscript:v10];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v4 setObject:v21 forKeyedSubscript:v10];
          }
          if ([v8 category] != 1
            || ([v8 url],
                uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                [v22 absoluteString],
                id v23 = objc_claimAutoreleasedReturnValue(),
                BOOL v24 = v23 == 0,
                v23,
                v22,
                v24))
          {
            id v25 = [v4 objectForKeyedSubscript:v10];
            uint64_t v26 = [v8 value];
            [v25 addObject:v26];
          }
          else
          {
            id v25 = [v4 objectForKeyedSubscript:v10];
            uint64_t v26 = [v8 url];
            id v27 = [v26 absoluteString];
            [v25 addObject:v27];
          }
        }
LABEL_26:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v5);
  }

  _ef_log_EDWebContentParser();
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [MEMORY[0x1E4F60E00] partiallyRedactedDictionary:v4];
    *(_DWORD *)buf = 138412290;
    v40 = v29;
    _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Found data detection results: %@", buf, 0xCu);
  }

  return v4;
}

- (id)_getDataDetectionCategoryString:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E6C07C80[a3 - 1];
  }
}

- (void)_updateContentRuleListsIfNeededForWebViewConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"EDWebContentParser.m" lineNumber:582 description:@"Current thread must be main"];
  }
  os_unfair_lock_lock(&self->_contentRuleListsLock);
  if (self->_contentRuleListsNeedUpdate)
  {
    uint64_t v6 = [(NSMutableArray *)self->_currentContentRuleLists copy];
    uint64_t v7 = (void *)v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    id v9 = v8;

    self->_contentRuleListsNeedUpdate = 0;
    os_unfair_lock_unlock(&self->_contentRuleListsLock);
    uint64_t v10 = [v5 userContentController];
    [v10 removeAllContentRuleLists];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addContentRuleList:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_contentRuleListsLock);
  }
}

- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4
{
  p_contentRuleListsLock = &self->_contentRuleListsLock;
  id v6 = a4;
  os_unfair_lock_lock(p_contentRuleListsLock);
  [(NSMutableArray *)self->_currentContentRuleLists addObject:v6];

  self->_contentRuleListsNeedUpdate = 1;

  os_unfair_lock_unlock(p_contentRuleListsLock);
}

- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  os_unfair_lock_lock(&self->_contentRuleListsLock);
  [(NSMutableArray *)self->_currentContentRuleLists removeObject:v7];
  [(NSMutableArray *)self->_currentContentRuleLists addObject:v8];
  self->_contentRuleListsNeedUpdate = 1;
  os_unfair_lock_unlock(&self->_contentRuleListsLock);
}

- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4
{
  p_contentRuleListsLock = &self->_contentRuleListsLock;
  id v6 = a4;
  os_unfair_lock_lock(p_contentRuleListsLock);
  [(NSMutableArray *)self->_currentContentRuleLists removeObject:v6];

  self->_contentRuleListsNeedUpdate = 1;

  os_unfair_lock_unlock(p_contentRuleListsLock);
}

- (void)_retrieveRichLinkMetadata:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v21;
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v3)
  {
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v6 = [v5 objectForKeyedSubscript:@"url"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
        {
          id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
          if (v7)
          {
            id v8 = [v5 objectForKeyedSubscript:@"title"];
            uint64_t v31 = 0;
            uint64_t v32 = &v31;
            uint64_t v33 = 0x2050000000;
            id v9 = (void *)getLPLinkMetadataClass_softClass;
            uint64_t v34 = getLPLinkMetadataClass_softClass;
            if (!getLPLinkMetadataClass_softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getLPLinkMetadataClass_block_invoke;
              long long v36 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6C07C48;
              long long v37 = (void (*)(uint64_t))&v31;
              __getLPLinkMetadataClass_block_invoke((uint64_t)buf);
              id v9 = (void *)v32[3];
            }
            id v10 = v9;
            _Block_object_dispose(&v31, 8);
            id v11 = objc_opt_new();
            [v11 setTitle:v8];
            [v11 setOriginalURL:v7];
            _ef_log_EDWebContentParser();
            uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
              uint64_t v14 = (void *)MEMORY[0x1E4F60E00];
              id v15 = [v7 absoluteString];
              long long v16 = [v14 partiallyRedactedStringForString:v15];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v13;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Found rich link with title: %@ and url: %@", buf, 0x16u);
            }
            long long v17 = [EDRichLinkData alloc];
            long long v18 = [v11 dataRepresentation];
            long long v19 = [(EDRichLinkData *)v17 initWithTitle:v8 url:v7 data:v18];

            [v23 addObject:v19];
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v3);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v36 = __Block_byref_object_copy__49;
  long long v37 = __Block_byref_object_dispose__49;
  id v38 = 0;
  state = self->_state;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__EDWebContentParser__retrieveRichLinkMetadata___block_invoke;
  v26[3] = &unk_1E6C07C20;
  v26[4] = buf;
  [(EFLocked *)state performWhileLocked:v26];
  [*(id *)(*(void *)&buf[8] + 40) finishWithResult:v23];
  _Block_object_dispose(buf, 8);
}

void __48__EDWebContentParser__retrieveRichLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 richLinkPromise];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)logWebBundleMessage:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = _ef_log_EDWebContentParser();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "[WebBundle] %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 name];
  int v7 = [v6 isEqual:@"MetadataMessageHandler"];

  if (v7)
  {
    id v8 = [v5 body];
    [(EDWebContentParser *)self _retrieveRichLinkMetadata:v8];
  }
  id v9 = [v5 name];
  int v10 = [v9 isEqual:@"LogHandler"];

  if (v10)
  {
    _ef_log_EDWebContentParser();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v5 body];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)isDataDetectionEnabled
{
  return self->_isDataDetectionEnabled;
}

- (void)setIsDataDetectionEnabled:(BOOL)a3
{
  self->_isDataDetectionEnabled = a3;
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentRuleListsObservationToken, 0);
  objc_storeStrong((id *)&self->_currentContentRuleLists, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_webContentObserver, 0);

  objc_storeStrong((id *)&self->_webContentObserverInterface, 0);
}

void __45__EDWebContentParser__richLinkMetadataScript__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "could not load  FindRichLinkMetadata.js: %{public}@", buf, 0xCu);
}

- (void)_extractPlainTextFromHTMLString:(os_log_t)log orWithData:characterEncodingName:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Data from HTML in this message could not be decoded with our UTF8 encoding protocol.", v1, 2u);
}

- (void)_parseHTMLString:(uint64_t)a1 orWithData:(NSObject *)a2 characterEncodingName:withOptions:messageID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Extracting rich links for message %@ timed out", (uint8_t *)&v2, 0xCu);
}

@end