@interface IKAppContext
+ (BOOL)isInFactoryMode;
+ (id)currentAppContext;
+ (void)registerPrivateProtocols:(id)a3 forClass:(Class)a4;
- (BOOL)_prepareStartWithURL:(id)a3;
- (BOOL)appUsesDefaultStyleSheets;
- (BOOL)canAccessPendingQueue;
- (BOOL)canRequireSystemTrustForXHRs;
- (BOOL)cancelHighlightView;
- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7;
- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7;
- (BOOL)isInspectElementModeEnabled;
- (BOOL)isPrivileged;
- (BOOL)isRunning;
- (BOOL)isTrusted;
- (BOOL)isValid;
- (BOOL)mescalPrimeEnabledForXHRRequests;
- (BOOL)remoteInspectionEnabled;
- (BOOL)validateDOMDocument:(id)a3 error:(id *)a4;
- (IKAppCache)appCache;
- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 cache:(BOOL)a5 delegate:(id)a6;
- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (IKAppContextDelegate)delegate;
- (IKAppReloadContext)reloadContext;
- (IKAppScriptFallbackHandler)appScriptFallbackHandler;
- (IKApplication)app;
- (IKJSApplication)jsApp;
- (IKJSArrayBufferStore)arrayBufferStore;
- (IKJSFoundation)jsFoundation;
- (IKJSInspectorController)webInspectorController;
- (IKJSViewModelService)jsViewModelService;
- (IKJSWeakMap)jsWeakMap;
- (IKViewElementRegistry)viewElementRegistry;
- (JSContext)jsContext;
- (NSError)responseError;
- (NSMutableArray)onStartQueue;
- (NSMutableArray)pendingQueue;
- (NSMutableArray)postEvaluationBlocks;
- (NSString)nextJSChecksum;
- (NSString)responseScript;
- (NSURL)resolvedBootURL;
- (double)appScriptTimeoutInterval;
- (id)_appTraitCollection;
- (id)_errorWithMessage:(id)a3;
- (id)_preferredLaunchURL;
- (id)registerLoaderWithIdentifier:(id)a3;
- (unint64_t)mode;
- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3;
- (void)_dispatchError:(id)a3;
- (void)_doEvaluate:(id)a3;
- (void)_drainOnStartQueue;
- (void)_enqueueOnStartOrExecute:(id)a3;
- (void)_evaluate:(id)a3;
- (void)_evaluateFoundationWithDeviceConfig:(id)a3 addPrivateInterfaces:(BOOL)a4;
- (void)_invalidateJSThread;
- (void)_jsThreadMain;
- (void)_networkPropertiesChanged:(id)a3;
- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3;
- (void)_sourcePerform;
- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3;
- (void)_startWithScript:(id)a3 scriptUrl:(id)a4 wasLoadedFromFallback:(BOOL)a5;
- (void)_startWithURL:(id)a3 urlTrusted:(BOOL)a4;
- (void)_stopAndReload:(BOOL)a3;
- (void)addPostEvaluateBlock:(id)a3;
- (void)appCache:(id)a3 didUpdateWithChecksum:(id)a4;
- (void)appTraitCollectionChanged:(id)a3;
- (void)contextDidFailWithError:(id)a3;
- (void)contextDidStartWithJS:(id)a3 options:(id)a4;
- (void)contextDidStopWithOptions:(id)a3;
- (void)dealloc;
- (void)evaluate:(id)a3 completionBlock:(id)a4;
- (void)evaluateDelegateBlockSync:(id)a3;
- (void)evaluateFoundationJS;
- (void)exitAppWithOptions:(id)a3;
- (void)handleCacheUpdate;
- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5;
- (void)inspectElement:(id)a3;
- (void)inspectElementModeChanged:(BOOL)a3;
- (void)launchAppWithOptions:(id)a3;
- (void)openURLWithOptions:(id)a3;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)reload;
- (void)resetFoundationJS;
- (void)resumeWithOptions:(id)a3;
- (void)setAppScriptFallbackHandler:(id)a3;
- (void)setAppScriptTimeoutInterval:(double)a3;
- (void)setCanAccessPendingQueue:(BOOL)a3;
- (void)setCanRequireSystemTrustForXHRs:(BOOL)a3;
- (void)setException:(id)a3 withErrorMessage:(id)a4;
- (void)setIsValid:(BOOL)a3;
- (void)setJsApp:(id)a3;
- (void)setJsContext:(id)a3;
- (void)setJsFoundation:(id)a3;
- (void)setJsViewModelService:(id)a3;
- (void)setJsWeakMap:(id)a3;
- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3;
- (void)setNextJSChecksum:(id)a3;
- (void)setPendingQueue:(id)a3;
- (void)setPostEvaluationBlocks:(id)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setReloadContext:(id)a3;
- (void)setRemoteInspectionEnabled:(BOOL)a3;
- (void)setResponseError:(id)a3;
- (void)setResponseScript:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setTrusted:(BOOL)a3;
- (void)setWebInspectorController:(id)a3;
- (void)start;
- (void)stop;
- (void)suspendWithOptions:(id)a3;
- (void)unregisterLoaderWithIdentifier:(id)a3;
- (void)willPerformXhrRequest:(id)a3;
@end

@implementation IKAppContext

- (void)evaluateFoundationJS
{
  kdebug_trace();
  v3 = [(IKAppContext *)self jsContext];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  BOOL v46 = 0;
  BOOL v46 = +[IKUtilites isAppTrusted];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40__IKAppContext_JS__evaluateFoundationJS__block_invoke;
  v42[3] = &unk_1E6DE3888;
  v42[4] = self;
  v42[5] = &v65;
  v42[6] = &v59;
  v42[7] = &v53;
  v42[8] = &v47;
  v42[9] = &v43;
  [(IKAppContext *)self evaluateDelegateBlockSync:v42];
  v4 = [IKJSDevice alloc];
  v5 = [(IKJSDevice *)v4 initWithAppContext:self deviceConfig:v66[5]];
  if (*((unsigned char *)v44 + 24))
  {
    v6 = [MEMORY[0x1E4F30938] valueWithObject:v5 inContext:v3];
    v7 = [MEMORY[0x1E4FB8800] sharedInstance];
    v8 = [v7 guid];
    [v6 setObject:v8 forKeyedSubscript:@"guid"];
  }
  [v3 setObject:v5 forKeyedSubscript:@"Device"];
  v9 = [IKJSDeviceSettings alloc];
  v10 = [(IKJSDeviceSettings *)v9 initWithAppContext:self deviceConfig:v66[5]];
  [v3 setObject:v10 forKeyedSubscript:@"Settings"];

  v11 = [(IKJSObject *)[IKDOMImplementationRegistry alloc] initWithAppContext:self];
  [v3 setObject:v11 forKeyedSubscript:@"DOMImplementationRegistry"];

  v12 = [(IKJSObject *)[IKJSApplication alloc] initWithAppContext:self];
  [v3 setObject:v12 forKeyedSubscript:@"App"];

  if (v60[5])
  {
    v13 = [IKJSNavigationDocument alloc];
    v14 = [(IKJSNavigationDocument *)v13 initWithAppContext:self navigationController:v60[5]];
    [v3 setObject:v14 forKeyedSubscript:@"navigationDocument"];
  }
  if (v54[5])
  {
    v15 = [IKJSNavigationDocument alloc];
    v16 = [(IKJSNavigationDocument *)v15 initWithAppContext:self navigationController:v54[5]];
    [v3 setObject:v16 forKeyedSubscript:@"modal"];
  }
  if (v48[5])
  {
    v17 = [IKJSTabBar alloc];
    v18 = [(IKJSTabBar *)v17 initWithAppContext:self appTabBar:v48[5]];
    [v3 setObject:v18 forKeyedSubscript:@"tabBar"];
  }
  v19 = [[IKJSStorage alloc] initWithAppContext:self appStorage:0];
  [v3 setObject:v19 forKeyedSubscript:@"sessionStorage"];

  v20 = [(IKAppContext *)self app];
  v21 = [v20 localStorage];

  if (v21)
  {
    v22 = [[IKJSStorage alloc] initWithAppContext:self appStorage:v21];
    [v3 setObject:v22 forKeyedSubscript:@"localStorage"];
  }
  v23 = [(IKAppContext *)self app];
  v24 = [v23 vendorStorage];

  if (v24)
  {
    v25 = [[IKJSStorage alloc] initWithAppContext:self appStorage:v24];
    [v3 setObject:v25 forKeyedSubscript:@"vendorStorage"];
  }
  v26 = [(IKAppContext *)self app];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    v28 = [(IKAppContext *)self app];
    v29 = [v28 userDefaultsStorage];

    if (v29)
    {
      v30 = [[IKJSUserDefaults alloc] initWithAppContext:self userDefaultsStorage:v29];
      [v3 setObject:v30 forKeyedSubscript:@"userDefaults"];
    }
  }
  v31 = [(IKJSObject *)[IKJSApplication alloc] initWithAppContext:self];
  [(IKAppContext *)self setJsApp:v31];

  v32 = [(IKAppContext *)self jsApp];
  [v3 setObject:v32 forKeyedSubscript:@"App"];

  v33 = [[IKJSWeakMap alloc] initWithAppContext:self];
  [(IKAppContext *)self setJsWeakMap:v33];

  [v3 setObject:objc_opt_class() forKeyedSubscript:@"CharacterData"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Comment"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"CustomEvent"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Document"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"DocumentFragment"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"DOMException"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"DOMImplementation"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"DOMParser"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Element"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Event"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"HTMLCollection"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Impression"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"MediaItem"];
  v34 = objc_opt_new();
  [v3 setObject:v34 forKeyedSubscript:@"MediaItemChangeReason"];

  [v3 setObject:objc_opt_class() forKeyedSubscript:@"NamedNodeMap"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Node"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"NodeList"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Player"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Playlist"];
  v35 = objc_opt_new();
  [v3 setObject:v35 forKeyedSubscript:@"PlaylistEndAction"];

  v36 = objc_opt_new();
  [v3 setObject:v36 forKeyedSubscript:@"PlaylistRepeatMode"];

  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Text"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"XMLHttpRequest"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"XMLSerializer"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"XPathException"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"XPathExpression"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"XPathResult"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"Browser"];
  [v3 setObject:&__block_literal_global forKeyedSubscript:@"DataItem"];
  [v3 setObject:&__block_literal_global_173 forKeyedSubscript:@"DataSource"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"NSError"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"LoadIndexesRequest"];
  v37 = [(IKJSObject *)[IKJSViewModelService alloc] initWithAppContext:self];
  [(IKAppContext *)self setJsViewModelService:v37];

  [v3 setObject:objc_opt_class() forKeyedSubscript:@"ViewModelLink"];
  v38 = [(IKAppContext *)self jsViewModelService];
  [v3 setObject:v38 forKeyedSubscript:@"viewModelService"];

  [(IKAppContext *)self _evaluateFoundationWithDeviceConfig:v66[5] addPrivateInterfaces:1];
  v39 = [(IKAppContext *)self delegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    v41 = [(IKAppContext *)self delegate];
    [v41 appContext:self evaluateAppJavaScriptInContext:v3];
  }
  kdebug_trace();

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
}

void __40__IKAppContext_JS__evaluateFoundationJS__block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = [v3 deviceConfigForContext:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = [*(id *)(a1 + 32) delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) delegate];
    uint64_t v10 = [v9 navigationControllerForContext:*(void *)(a1 + 32)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  v13 = [*(id *)(a1 + 32) delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [*(id *)(a1 + 32) delegate];
    uint64_t v16 = [v15 modalControllerForContext:*(void *)(a1 + 32)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  v19 = [*(id *)(a1 + 32) delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [*(id *)(a1 + 32) delegate];
    uint64_t v22 = [v21 tabBarForContext:*(void *)(a1 + 32)];
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  v25 = [v26 app];
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v25 appIsTrusted];
  }
}

id __40__IKAppContext_JS__evaluateFoundationJS__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[IKJSDataItem makeDataItem:a2 :a3];
}

id __40__IKAppContext_JS__evaluateFoundationJS__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[IKJSDataSource makeDataSource:a2 :a3 :a4];
}

- (void)resetFoundationJS
{
  [(IKAppContext *)self setJsApp:0];
  [(IKAppContext *)self setJsFoundation:0];
  [(IKAppContext *)self setJsWeakMap:0];
  [(IKAppContext *)self setJsViewModelService:0];
}

- (void)launchAppWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKAppContext *)self jsContext];
  v6 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[IKAppContext(JS) launchAppWithOptions:]((uint64_t)v4, v6);
  }

  v7 = [v5 objectForKeyedSubscript:@"App"];
  char v8 = [v7 toObjectOfClass:objc_opt_class()];

  [v8 launchAppWithOptions:v4];
}

- (void)exitAppWithOptions:(id)a3
{
  id v4 = a3;
  id v8 = [(IKAppContext *)self jsContext];
  uint64_t v5 = [v8 objectForKeyedSubscript:@"App"];
  v6 = [v5 toObjectOfClass:objc_opt_class()];

  [v6 exitAppWithOptions:v4];
  v7 = [(IKAppContext *)self jsFoundation];
  [v7 stopTimers];
}

- (void)_evaluateFoundationWithDeviceConfig:(id)a3 addPrivateInterfaces:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[IKJSFoundation alloc] initWithAppContext:self deviceConfig:v6];
  [(IKAppContext *)self setJsFoundation:v7];

  id v8 = [(IKAppContext *)self jsContext];
  objc_initWeak(location, self);
  if (v4)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke;
    v58[3] = &unk_1E6DE38F0;
    objc_copyWeak(&v59, location);
    v9 = (void *)MEMORY[0x1E4E65800](v58);
    [v8 setObject:v9 forKeyedSubscript:@"imageScaleFactor"];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_2;
    v56[3] = &unk_1E6DE38F0;
    objc_copyWeak(&v57, location);
    uint64_t v10 = (void *)MEMORY[0x1E4E65800](v56);
    [v8 setObject:v10 forKeyedSubscript:@"layeredImageScaleFactor"];

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_3;
    v54[3] = &unk_1E6DE3918;
    objc_copyWeak(&v55, location);
    uint64_t v11 = (void *)MEMORY[0x1E4E65800](v54);
    [v8 setObject:v11 forKeyedSubscript:@"formatLocalizedNumber"];

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_4;
    v52[3] = &unk_1E6DE3940;
    objc_copyWeak(&v53, location);
    v12 = (void *)MEMORY[0x1E4E65800](v52);
    [v8 setObject:v12 forKeyedSubscript:@"formatLocalizedLocaleIdentifier"];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_5;
    v50[3] = &unk_1E6DE3940;
    objc_copyWeak(&v51, location);
    v13 = (void *)MEMORY[0x1E4E65800](v50);
    [v8 setObject:v13 forKeyedSubscript:@"joinComponentsWithLocalizedCommaAndSpace"];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_6;
    v48[3] = &unk_1E6DE3940;
    objc_copyWeak(&v49, location);
    char v14 = (void *)MEMORY[0x1E4E65800](v48);
    [v8 setObject:v14 forKeyedSubscript:@"joinComponentsWithLocalizedSemicolonAndSpace"];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);
  }
  [v8 setObject:&__block_literal_global_241 forKeyedSubscript:@"UUID"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_8;
  v46[3] = &unk_1E6DE3988;
  objc_copyWeak(&v47, location);
  v15 = (void *)MEMORY[0x1E4E65800](v46);
  [v8 setObject:v15 forKeyedSubscript:@"makeXMLHttpRequest"];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_9;
  v44[3] = &unk_1E6DE39B0;
  objc_copyWeak(&v45, location);
  uint64_t v16 = (void *)MEMORY[0x1E4E65800](v44);
  [v8 setObject:v16 forKeyedSubscript:@"evaluateScripts"];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_10;
  v42[3] = &unk_1E6DE39D8;
  objc_copyWeak(&v43, location);
  uint64_t v17 = (void *)MEMORY[0x1E4E65800](v42);
  [v8 setObject:v17 forKeyedSubscript:@"setInterval"];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_11;
  v40[3] = &unk_1E6DE3A00;
  objc_copyWeak(&v41, location);
  v18 = (void *)MEMORY[0x1E4E65800](v40);
  [v8 setObject:v18 forKeyedSubscript:@"clearInterval"];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_12;
  v38[3] = &unk_1E6DE39D8;
  objc_copyWeak(&v39, location);
  v19 = (void *)MEMORY[0x1E4E65800](v38);
  [v8 setObject:v19 forKeyedSubscript:@"setTimeout"];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_13;
  v36[3] = &unk_1E6DE3A00;
  objc_copyWeak(&v37, location);
  char v20 = (void *)MEMORY[0x1E4E65800](v36);
  [v8 setObject:v20 forKeyedSubscript:@"clearTimeout"];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_14;
  v34[3] = &unk_1E6DE3A28;
  objc_copyWeak(&v35, location);
  v21 = (void *)MEMORY[0x1E4E65800](v34);
  [v8 setObject:v21 forKeyedSubscript:@"formatDate"];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_15;
  v32[3] = &unk_1E6DE3940;
  objc_copyWeak(&v33, location);
  uint64_t v22 = (void *)MEMORY[0x1E4E65800](v32);
  [v8 setObject:v22 forKeyedSubscript:@"formatDuration"];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_16;
  v30[3] = &unk_1E6DE3A50;
  objc_copyWeak(&v31, location);
  uint64_t v23 = (void *)MEMORY[0x1E4E65800](v30);
  [v8 setObject:v23 forKeyedSubscript:@"formatNumber"];

  [v8 setObject:&__block_literal_global_292 forKeyedSubscript:@"canOpenURL"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_18;
  v28[3] = &unk_1E6DE3AC0;
  objc_copyWeak(&v29, location);
  v24 = (void *)MEMORY[0x1E4E65800](v28);
  [v8 setObject:v24 forKeyedSubscript:@"openURL"];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_20;
  v26[3] = &unk_1E6DE3B10;
  objc_copyWeak(&v27, location);
  v25 = (void *)MEMORY[0x1E4E65800](v26);
  [v8 setObject:v25 forKeyedSubscript:@"getActiveDocument"];

  [v8 setObject:&__block_literal_global_311 forKeyedSubscript:@"sort"];
  [v8 setObject:&__block_literal_global_318 forKeyedSubscript:@"atob"];
  [v8 setObject:&__block_literal_global_325 forKeyedSubscript:@"btoa"];
  [v8 setObject:&__block_literal_global_331 forKeyedSubscript:@"localizedUppercaseString"];
  [v8 setObject:&__block_literal_global_336 forKeyedSubscript:@"localizedLowercaseString"];
  [v8 setObject:&__block_literal_global_341 forKeyedSubscript:@"localizedCapitalizedString"];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(location);
}

double __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 floatValue];
    double v4 = v5;
  }
  if (v4 != 3.0 && v4 != 1.0 && v4 != 2.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"Invalid Display Scale"];

    double v4 = 1.0;
  }

  return v4;
}

double __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 floatValue];
    double v4 = v5;
  }
  if (v4 != 3.0 && v4 != 1.0 && v4 != 2.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"Invalid Display Scale"];

    double v4 = 1.0;
  }

  return v4;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [a2 toObject];
  if ([v11 isString])
  {
    uint64_t v16 = [v11 toString];
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([v12 isString])
  {
    uint64_t v17 = [v12 toString];
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([v13 isString])
  {
    v18 = [v13 toString];
  }
  else
  {
    v18 = 0;
  }
  v24 = v11;
  if ([v14 isString])
  {
    v19 = [v14 toString];
  }
  else
  {
    v19 = 0;
  }
  char v20 = (void *)v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    uint64_t v22 = [WeakRetained formatLocalizedNumber:v15 style:v20 postiveFormat:v17 negativeFormat:v18 currencyCode:v19];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatLocalizedNumber expects a Number object"];
    uint64_t v22 = 0;
  }

  return v22;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isString])
  {
    double v4 = [v3 toString];
  }
  else
  {
    double v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    id v6 = [WeakRetained formatLocalizedLocaleIdentifier:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatLocalizedLocaleIdentifier expects a String object"];
    id v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isArray])
  {
    double v4 = [v3 toArray];
  }
  else
  {
    double v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    id v6 = [WeakRetained joinComponentsWithLocalizedCommaAndSpace:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"joinComponentsWithLocalizedCommaAndSpace expects a String object"];
    id v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isArray])
  {
    double v4 = [v3 toArray];
  }
  else
  {
    double v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    id v6 = [WeakRetained joinComponentsWithLocalizedSemicolonAndSpace:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"joinComponentsWithLocalizedSemicolonAndSpace expects a String object"];
    id v6 = 0;
  }

  return v6;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_7()
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = [v0 UUIDString];

  return v1;
}

IKJSXMLHTTPRequest *__77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_8(uint64_t a1)
{
  v2 = [IKJSXMLHTTPRequest alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [(IKJSXMLHTTPRequest *)v2 initWithAppContext:WeakRetained jingleRequest:0];

  return v4;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [IKScriptsEvaluator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = [(IKScriptsEvaluator *)v7 initWithScripts:v6 withContext:WeakRetained callback:v5 jingleRequest:0];

  [(IKScriptsEvaluator *)v9 evaluate];
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained jsFoundation];
  id v8 = [v7 setInterval:v5 time:a3];

  return v8;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained jsFoundation];
  [v4 clearInterval:v3];
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained jsFoundation];
  id v8 = [v7 setTimeout:v5 time:a3];

  return v8;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_13(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained jsFoundation];
  [v4 clearTimeout:v3];
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 toObject];
  if ([v5 isString])
  {
    v7 = [v5 toString];
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    v9 = [WeakRetained formatDate:v6 format:v7];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatDate expects a Date object"];
    v9 = 0;
  }

  return v9;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = [a2 toObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    id v5 = [WeakRetained formatDuration:v3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatDuration expects a Number object"];
    id v5 = 0;
  }

  return v5;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [a2 toObject];
  if ([v9 isString])
  {
    id v13 = [v9 toString];
  }
  else
  {
    id v13 = 0;
  }
  if ([v10 isString])
  {
    id v14 = [v10 toString];
  }
  else
  {
    id v14 = 0;
  }
  if ([v11 isString])
  {
    v15 = [v11 toString];
  }
  else
  {
    v15 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[IKFormatting sharedInstance];
    uint64_t v17 = [WeakRetained formatNumber:v12 style:v13 postiveFormat:v14 negativeFormat:v15];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatNumber expects a Number object"];
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_17(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  v2 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v3 = a2;
  double v4 = (void *)[[v2 alloc] initWithString:v3];

  id v5 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v6 = [v5 canOpenURL:v4];

  return v6;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CB10];
    id v7 = a2;
    id v8 = (void *)[[v6 alloc] initWithString:v7];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_19;
    v11[3] = &unk_1E6DE3A98;
    id v12 = v8;
    id v13 = v5;
    id v10 = v8;
    [WeakRetained evaluateDelegateBlockSync:v11];
  }
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[IKUtilites isAppTrusted];
  id v8 = [v3 app];

  if (objc_opt_respondsToSelector())
  {
    if (([v8 appIsTrusted] & 1) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    char v6 = [v5 openSensitiveURL:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];

    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v4) {
    goto LABEL_5;
  }
LABEL_6:
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v7 openURL:*(void *)(a1 + 32)];

LABEL_7:
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_20(uint64_t a1)
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_21;
  v4[3] = &unk_1E6DE3AE8;
  v4[4] = &v5;
  [WeakRetained evaluateDelegateBlockSync:v4];

  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_21(uint64_t a1, void *a2)
{
  id v7 = [a2 app];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v7 activeDocument];
    uint64_t v4 = [v3 jsDocument];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    char v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v7 = 0;
    }
    else
    {
      id v7 = +[IKUtilites sort:v4 options:v5];
    }
  }

  return v7;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithBase64EncodedString:v3 options:0];

  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  return v5;
}

id __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isString])
  {
    id v3 = [v2 toString];
    id v4 = [v3 dataUsingEncoding:4];

    id v5 = [v4 base64EncodedStringWithOptions:0];
LABEL_5:

    goto LABEL_7;
  }
  if ([v2 isInstanceOf:objc_opt_class()])
  {
    id v4 = [v2 toObject];
    char v6 = [v4 data];
    id v5 = [v6 base64EncodedStringWithOptions:0];

    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 localizedUppercaseString];
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_26(uint64_t a1, void *a2)
{
  return [a2 localizedLowercaseString];
}

uint64_t __77__IKAppContext_JS___evaluateFoundationWithDeviceConfig_addPrivateInterfaces___block_invoke_27(uint64_t a1, void *a2)
{
  return [a2 localizedCapitalizedString];
}

- (IKJSArrayBufferStore)arrayBufferStore
{
  return self->_arrayBufferStore;
}

+ (id)currentAppContext
{
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  id v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"itmlAppContext"];

  return v4;
}

- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 cache:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  +[IKPreference setupJSCoreConsoleLogging];
  v43.receiver = self;
  v43.super_class = (Class)IKAppContext;
  id v12 = [(IKAppContext *)&v43 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_app, v10);
    v13->_remoteInspectionEnabled = 1;
    v13->_running = 0;
    id v14 = +[IKNetworkUtilities sharedInstance];
    v13->_isAirplaneModeEnabled = [v14 isAirplaneModeEnabled];

    id WeakRetained = objc_loadWeakRetained((id *)&v13->_app);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&v13->_app);
      uint64_t v18 = [v17 viewElementRegistry];
      viewElementRegistry = v13->_viewElementRegistry;
      v13->_viewElementRegistry = (IKViewElementRegistry *)v18;
    }
    v13->_appUsesDefaultStyleSheets = 1;
    id v20 = objc_loadWeakRetained((id *)&v13->_app);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&v13->_app);
      v13->_appUsesDefaultStyleSheets = [v22 appUsesDefaultStyleSheets];
    }
    id v23 = objc_loadWeakRetained((id *)&v13->_app);
    v13->_respondsToTraitCollection = objc_opt_respondsToSelector() & 1;

    v13->_mode = a4;
    id v24 = objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_delegateFlags.respondsToHighlightViewForOneElement = objc_opt_respondsToSelector() & 1;

    id v25 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToHighlightViewsForManyElements = objc_opt_respondsToSelector() & 1;

    id v26 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToCancelHighlightForAppContext = objc_opt_respondsToSelector() & 1;

    id v27 = objc_loadWeakRetained((id *)&v13->_delegate);
    v13->_delegateFlags.respondsToDidInspectElementModeChanged = objc_opt_respondsToSelector() & 1;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    onStartQueue = v13->_onStartQueue;
    v13->_onStartQueue = (NSMutableArray *)v28;

    v13->_appScriptTimeoutInterval = 30.0;
    v30 = [[IKJSArrayBufferStore alloc] initWithAppContext:v13];
    arrayBufferStore = v13->_arrayBufferStore;
    v13->_arrayBufferStore = v30;

    v13->_canRequireSystemTrustForXHRs = 1;
    if (!CFPreferencesGetAppBooleanValue(@"IgnoreCachedJS", @"com.apple.ITMLKit", 0) && v7)
    {
      v32 = [IKAppCache alloc];
      id v33 = objc_loadWeakRetained((id *)&v13->_app);
      uint64_t v34 = [(IKAppCache *)v32 initWithApplication:v33];
      appCache = v13->_appCache;
      v13->_appCache = (IKAppCache *)v34;

      [(IKAppCache *)v13->_appCache setDelegate:v13];
      [(IKAppCache *)v13->_appCache setAppContextDelegate:v11];
      [(IKAppCache *)v13->_appCache cleanBlobStorageWithCompletion:0];
    }
    dispatch_source_t v36 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, MEMORY[0x1E4F14428]);
    lowMemoryWarningSource = v13->_lowMemoryWarningSource;
    v13->_lowMemoryWarningSource = (OS_dispatch_source *)v36;

    if (v13->_lowMemoryWarningSource)
    {
      objc_initWeak(&location, v13);
      v38 = v13->_lowMemoryWarningSource;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke;
      v40[3] = &unk_1E6DE3C70;
      objc_copyWeak(&v41, &location);
      dispatch_source_set_event_handler(v38, v40);
      dispatch_resume((dispatch_object_t)v13->_lowMemoryWarningSource);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

uint64_t __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id WeakRetained = (id)[WeakRetained isValid];
    id v2 = v4;
    if (WeakRetained)
    {
      id WeakRetained = (id)[v4 evaluate:&__block_literal_global_11 completionBlock:0];
      id v2 = v4;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

void __56__IKAppContext_initWithApplication_mode_cache_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (const OpaqueJSContext *)[a2 JSGlobalContextRef];
  JSGarbageCollect(v2);
}

- (IKAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v8 appJSCachePath];
    id v11 = [v10 path];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = -[IKAppContext initWithApplication:mode:cache:delegate:](self, "initWithApplication:mode:cache:delegate:", v8, a4, [v11 length] != 0, v9);

  return v12;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IKAppContext;
  [(IKAppContext *)&v4 dealloc];
}

- (void)start
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1E2ACE000, v0, v1, "We have a preferredLaunchURL: %@", v2, v3, v4, v5, v6);
}

void __21__IKAppContext_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    uint8_t v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __21__IKAppContext_start__block_invoke_cold_1();
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __21__IKAppContext_start__block_invoke_102;
    v9[3] = &unk_1E6DE40E0;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    id v10 = v5;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:0];
    [WeakRetained contextDidFailWithError:v8];
  }
}

void __21__IKAppContext_start__block_invoke_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _prepareStartWithURL:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __21__IKAppContext_start__block_invoke_2(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained) {
    goto LABEL_19;
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  BOOL v46 = __Block_byref_object_copy__14;
  id v47 = __Block_byref_object_dispose__14;
  id v48 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [WeakRetained appCache];

  if (v5)
  {
    uint8_t v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __21__IKAppContext_start__block_invoke_2_cold_3(v6);
    }

    id v7 = [WeakRetained appCache];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __21__IKAppContext_start__block_invoke_104;
    v38[3] = &unk_1E6DE50C8;
    objc_copyWeak(&v42, v2);
    id v41 = &v43;
    id v39 = a1[4];
    id v8 = v4;
    char v40 = v8;
    [v7 appJSURLWithCompletion:v38];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v42);
  }
  if (!v44[5])
  {
    id v9 = +[IKNetworkUtilities sharedInstance];
    if (([v9 isNetworkReachable] & 1) == 0)
    {
      id v10 = a1[5];

      if (!v10) {
        goto LABEL_13;
      }
      id v11 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __21__IKAppContext_start__block_invoke_2_cold_2((uint64_t)(a1 + 5), v11, v12, v13, v14, v15, v16, v17);
      }

      uint64_t v18 = v44;
      id v19 = a1[5];
      id v9 = (void *)v18[5];
      v18[5] = (uint64_t)v19;
    }
  }
LABEL_13:
  if (!v44[5])
  {
    id v21 = a1[4];
    id v20 = a1 + 4;
    if (v21)
    {
      id v22 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __21__IKAppContext_start__block_invoke_2_cold_1((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);
      }

      id v29 = +[IKURLBagCache sharedCache];
      v30 = *v20;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __21__IKAppContext_start__block_invoke_106;
      v34[3] = &unk_1E6DE50F0;
      id v37 = &v43;
      id v35 = v30;
      id v31 = v4;
      dispatch_source_t v36 = v31;
      [v29 loadValueForKey:v35 completion:v34];

      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__IKAppContext_start__block_invoke_107;
  block[3] = &unk_1E6DE5118;
  objc_copyWeak(&v33, v2);
  block[4] = &v43;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v33);

  _Block_object_dispose(&v43, 8);
LABEL_19:
}

void __21__IKAppContext_start__block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_16;
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v9 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __21__IKAppContext_start__block_invoke_104_cold_1(a1 + 48, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v16 = [WeakRetained nextJSChecksum];
  char v17 = [v7 isEqualToString:v16];

  uint64_t v18 = [WeakRetained app];
  id v19 = [v18 appJSURL];
  if (v19)
  {

    if (v6) {
      char v20 = v17;
    }
    else {
      char v20 = 1;
    }
LABEL_14:
    if ((v20 & 1) == 0)
    {
      id v22 = [WeakRetained appCache];
      [v22 refreshWithCompletion:0];
    }
    goto LABEL_16;
  }
  uint64_t v21 = *(void *)(a1 + 32);

  if (v6) {
    char v20 = v17;
  }
  else {
    char v20 = 1;
  }
  if (v21) {
    goto LABEL_14;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __21__IKAppContext_start__block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __21__IKAppContext_start__block_invoke_106_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __21__IKAppContext_start__block_invoke_107(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:WeakRetained selector:sel__networkPropertiesChanged_ name:@"IKNetworkPropertiesChangedNotification" object:0];

    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(WeakRetained, "_prepareStartWithURL:");
    }
    else
    {
      id v3 = [WeakRetained app];
      uint64_t v4 = [v3 appJSURL];
      [WeakRetained _prepareStartWithURL:v4];
    }
  }
}

- (void)suspendWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__IKAppContext_suspendWithOptions___block_invoke;
  v6[3] = &unk_1E6DE40E0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IKAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__IKAppContext_suspendWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__IKAppContext_suspendWithOptions___block_invoke_2;
  v3[3] = &unk_1E6DE4108;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained evaluate:v3 completionBlock:0];
}

void __35__IKAppContext_suspendWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"App"];
  id v7 = [v4 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 32)) {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CC08];
  }
  [v7 suspendAppWithOptions:v5];
  id v6 = (const OpaqueJSContext *)[v3 JSGlobalContextRef];

  JSGarbageCollect(v6);
}

- (void)resumeWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__IKAppContext_resumeWithOptions___block_invoke;
  v6[3] = &unk_1E6DE5140;
  objc_copyWeak(&v8, &location);
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(IKAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__IKAppContext_resumeWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppContext_resumeWithOptions___block_invoke_2;
  v4[3] = &unk_1E6DE4238;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [WeakRetained evaluate:v4 completionBlock:0];
}

void __34__IKAppContext_resumeWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2ACE000, v4, OS_LOG_TYPE_INFO, "[StartQueue] resumeWithOptions evaluated", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isValid]) {
    id v5 = "yes";
  }
  else {
    id v5 = "no";
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_opt_class();
  NSLog(&cfstr_ValidContextSR.isa, v5, v6, v7);
  id v8 = [v3 objectForKeyedSubscript:@"App"];

  id v9 = [v8 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 40)) {
    uint64_t v10 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC08];
  }
  [v9 resumeAppWithOptions:v10];
}

- (void)openURLWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__IKAppContext_openURLWithOptions___block_invoke;
  v6[3] = &unk_1E6DE40E0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IKAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__IKAppContext_openURLWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__IKAppContext_openURLWithOptions___block_invoke_2;
  v3[3] = &unk_1E6DE4108;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained evaluate:v3 completionBlock:0];
}

void __35__IKAppContext_openURLWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"App"];
  id v5 = [v3 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC08];
  }
  [v5 openURLWithOptions:v4];
}

- (void)appTraitCollectionChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__IKAppContext_appTraitCollectionChanged___block_invoke;
  v6[3] = &unk_1E6DE40E0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IKAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__IKAppContext_appTraitCollectionChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__IKAppContext_appTraitCollectionChanged___block_invoke_2;
  v3[3] = &unk_1E6DE4108;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained evaluate:v3 completionBlock:0];
}

void __42__IKAppContext_appTraitCollectionChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"App"];
  id v5 = [v3 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC08];
  }
  [v5 traitCollectionChanged:v4];
}

- (void)reload
{
}

- (void)stop
{
}

- (void)evaluate:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ([(IKAppContext *)v8 canAccessPendingQueue])
  {
    objc_initWeak(&location, v8);
    id v9 = [IKRunLoopSourceRecord alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__IKAppContext_evaluate_completionBlock___block_invoke;
    v16[3] = &unk_1E6DE3C98;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    uint64_t v10 = [(IKRunLoopSourceRecord *)v9 initWithEvaluateBlock:v16 completionBlock:v7];
    uint64_t v11 = [(IKAppContext *)v8 pendingQueue];
    [v11 addObject:v10];

    if (v8->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v8->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v8->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    uint64_t v13 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__IKAppContext_evaluate_completionBlock___block_invoke_2;
    v14[3] = &unk_1E6DE4260;
    id v15 = v7;
    dispatch_async(v13, v14);
  }
  objc_sync_exit(v8);
}

void __41__IKAppContext_evaluate_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _evaluate:*(void *)(a1 + 32)];
}

uint64_t __41__IKAppContext_evaluate_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__IKAppContext_evaluateDelegateBlockSync___block_invoke;
  block[3] = &unk_1E6DE43C8;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  block[4] = self;
  id v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __42__IKAppContext_evaluateDelegateBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (void)addPostEvaluateBlock:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(IKAppContext *)self postEvaluationBlocks];

  if (v5)
  {
    id v6 = [(IKAppContext *)self postEvaluationBlocks];
    id v7 = (void *)[v4 copy];
    [(IKAppContext *)v6 addObject:v7];
  }
  else
  {
    id v6 = self;
    objc_sync_enter(v6);
    if ([(IKAppContext *)v6 canAccessPendingQueue])
    {
      objc_initWeak(&location, v6);
      id v8 = [IKRunLoopSourceRecord alloc];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __37__IKAppContext_addPostEvaluateBlock___block_invoke;
      v12[3] = &unk_1E6DE3C98;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      dispatch_semaphore_t v9 = [(IKRunLoopSourceRecord *)v8 initWithEvaluateBlock:v12 completionBlock:0];
      id v10 = [(IKAppContext *)v6 pendingQueue];
      [v10 insertObject:v9 atIndex:0];

      if (v6->_jsThreadRunLoop)
      {
        jsThreadRunLoopSource = v6->_jsThreadRunLoopSource;
        if (jsThreadRunLoopSource)
        {
          CFRunLoopSourceSignal(jsThreadRunLoopSource);
          CFRunLoopWakeUp(v6->_jsThreadRunLoop);
        }
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v6);
  }
}

void __37__IKAppContext_addPostEvaluateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doEvaluate:*(void *)(a1 + 32)];
}

- (void)setException:(id)a3 withErrorMessage:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(IKAppContext *)self jsContext];
  if (v11) {
    [MEMORY[0x1E4F30938] valueWithObject:v11 inContext:v7];
  }
  else {
  id v8 = [MEMORY[0x1E4F30938] valueWithNewErrorFromMessage:v6 inContext:v7];
  }
  dispatch_semaphore_t v9 = [MEMORY[0x1E4F30938] valueWithBool:1 inContext:v7];
  [v8 setObject:v9 forKeyedSubscript:@"errorDispatched"];

  [v7 setException:v8];
  id v10 = [(IKAppContext *)self _errorWithMessage:v6];
  [(IKAppContext *)self _dispatchError:v10];
}

+ (void)registerPrivateProtocols:(id)a3 forClass:(Class)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (a4 && v7)
  {
    id v8 = [a1 currentAppContext];
    dispatch_semaphore_t v9 = v8;
    if (v8 && [v8 isPrivileged])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            class_addProtocol(a4, *(Protocol **)(*((void *)&v15 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }
    }
  }
}

- (BOOL)validateDOMDocument:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(IKAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(IKAppContext *)self jsContext];
    id v15 = 0;
    char v9 = [v7 appContext:self validateDOMDocument:v6 inContext:v8 error:&v15];
    id v10 = v15;

    if ((v9 & 1) == 0 && a4 && v10)
    {
      if ([v10 code] == 2) {
        uint64_t v11 = 201;
      }
      else {
        uint64_t v11 = 200;
      }
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = [v10 userInfo];
      *a4 = [v12 errorWithDomain:@"ITMLKitErrorDomain" code:v11 userInfo:v13];
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke;
  block[3] = &unk_1E6DE5168;
  objc_copyWeak(v12, &location);
  id v11 = v8;
  v12[1] = (id)a3;
  v12[2] = *(id *)&a4;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_opt_new();
  [v3 setReloadData:*(void *)(a1 + 32)];
  id v4 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained setReloadContext:v3];
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = @"IKAppReloadUrgencyMinSuspensionTime";
    id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 appContext:WeakRetained needsReloadWithUrgency:v5 options:v7];

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(WeakRetained, v6);
    }
    goto LABEL_7;
  }
  [WeakRetained setReloadContext:v3];
  [v4 appContext:WeakRetained needsReloadWithUrgency:*(void *)(a1 + 48)];
LABEL_8:
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    [(IKAppContext *)self setResponseScript:v5];
  }
}

- (BOOL)_prepareStartWithURL:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(IKAppContext *)self mode];
  id v6 = v4;
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = [(IKAppContext *)self mode];
    *(_DWORD *)buf = 138412802;
    id v47 = v9;
    __int16 v48 = 2048;
    unint64_t v49 = v10;
    __int16 v50 = 2048;
    id v51 = self;
    _os_log_impl(&dword_1E2ACE000, v7, OS_LOG_TYPE_INFO, "<%@ (%lu): %p> Launching JavaScript app", buf, 0x20u);
  }
  if (+[IKAppContext isInFactoryMode]) {
    goto LABEL_5;
  }
  BOOL v13 = +[IKUtilites isAppTrusted];
  uint64_t v14 = [(IKAppContext *)self app];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
  {
    if (!v13) {
      goto LABEL_9;
    }
LABEL_12:
    char v11 = 1;
    uint64_t v12 = 1;
    goto LABEL_13;
  }
  long long v16 = [(IKAppContext *)self app];
  char v17 = [v16 appIsTrusted];

  if (v17) {
    goto LABEL_12;
  }
LABEL_9:
  long long v18 = [(IKAppContext *)self app];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
  {
LABEL_5:
    char v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v20 = [(IKAppContext *)self app];
  uint64_t v12 = [v20 appIsPrivileged];

  char v11 = 0;
LABEL_13:
  [(IKAppContext *)self setPrivileged:v12];
  uint64_t v21 = [v6 scheme];
  id v22 = [v21 lowercaseString];
  if (![v22 isEqualToString:@"https"])
  {
    uint64_t v23 = [(IKAppContext *)self app];
    char v24 = [v23 shouldIgnoreJSValidation];

    if (v24) {
      goto LABEL_16;
    }
LABEL_25:
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:0];
    [(IKAppContext *)self contextDidFailWithError:v25];
    LOBYTE(self) = 0;
    goto LABEL_26;
  }

LABEL_16:
  uint64_t v25 = self;
  objc_sync_enter(v25);
  uint64_t v26 = [(IKAppContext *)v25 pendingQueue];
  LODWORD(self) = v26 == 0;

  if (self)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(IKAppContext *)v25 setPendingQueue:v28];

    [(IKAppContext *)v25 setCanAccessPendingQueue:1];
    if (v5 != 1000)
    {
      id v29 = [[IKRunLoopSourceRecord alloc] initWithEvaluateBlock:&__block_literal_global_144 completionBlock:0];
      v30 = [(IKAppContext *)v25 pendingQueue];
      [v30 addObject:v29];
    }
    id v31 = [IKRunLoopSourceRecord alloc];
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    char v40 = __37__IKAppContext__prepareStartWithURL___block_invoke_2;
    id v41 = &unk_1E6DE5190;
    objc_copyWeak(&v43, &location);
    id v42 = v6;
    char v44 = v11;
    v32 = [(IKRunLoopSourceRecord *)v31 initWithEvaluateBlock:&v38 completionBlock:0];
    id v33 = [(IKAppContext *)v25 pendingQueue];
    [v33 addObject:v32];

    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:v25 selector:sel__jsThreadMain object:0];
    id v35 = v34;
    if (v5 == 1000) {
      uint64_t v36 = 9;
    }
    else {
      uint64_t v36 = 25;
    }
    [v34 setQualityOfService:v36];
    [v35 setName:@"ITMLKit"];
    [v35 start];

    objc_destroyWeak(&v43);
  }
  else
  {
    uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:100 userInfo:0];
    [(IKAppContext *)v25 contextDidFailWithError:v27];
  }
  objc_sync_exit(v25);
LABEL_26:

  objc_destroyWeak(&location);
  return (char)self;
}

uint64_t __37__IKAppContext__prepareStartWithURL___block_invoke()
{
  return +[IKTemplateStyleSheet loadStyleSheets];
}

void __37__IKAppContext__prepareStartWithURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startWithURL:*(void *)(a1 + 32) urlTrusted:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_startWithURL:(id)a3 urlTrusted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  kdebug_trace();
  objc_storeStrong((id *)&self->_resolvedBootURL, a3);
  [(IKAppContext *)self appScriptTimeoutInterval];
  double v9 = v8;
  if (+[IKPreference ignoreHTTPCache])
  {
    BOOL v10 = 1;
  }
  else
  {
    char v11 = [(IKAppContext *)self reloadContext];
    BOOL v10 = v11 != 0;
  }
  uint64_t v12 = [(IKAppContext *)self delegate];
  if ([v12 conformsToProtocol:&unk_1F3E41E80])
  {
    BOOL v13 = [(IKAppContext *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v12 = [(IKAppContext *)self delegate];
    if ([v12 shouldForceIgnoreHTTPCacheForAppContext:self]) {
      BOOL v10 = 1;
    }
  }

LABEL_9:
  char v15 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    long long v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [(IKAppContext *)self mode];
    *(_WORD *)&buf[22] = 2048;
    v110 = self;
    _os_log_impl(&dword_1E2ACE000, v15, OS_LOG_TYPE_INFO, "<%@ (%lu): %p> Attempting to start context with script", buf, 0x20u);
  }
  long long v18 = [(IKAppContext *)self delegate];
  if ([v18 conformsToProtocol:&unk_1F3E69928])
  {
    char v19 = [(IKAppContext *)self delegate];
    char v20 = objc_opt_respondsToSelector();
  }
  else
  {
    char v20 = 0;
  }

  [(IKAppContext *)self setTrusted:v4];
  if ([v7 isFileURL])
  {
    uint64_t v21 = [NSString stringWithContentsOfURL:v7 encoding:4 error:0];
    [(IKAppContext *)self _startWithScript:v21 scriptUrl:v7 wasLoadedFromFallback:0];
    goto LABEL_71;
  }
  if (v20)
  {
    id v22 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2ACE000, v22, OS_LOG_TYPE_INFO, "Fetch application script using App Script Loader", buf, 2u);
    }

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v110 = (IKAppContext *)__Block_byref_object_copy__14;
    v111 = __Block_byref_object_dispose__14;
    id v112 = 0;
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__14;
    v99 = __Block_byref_object_dispose__14;
    id v100 = 0;
    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x2020000000;
    v94[3] = 0;
    char v24 = [(IKAppContext *)self delegate];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke;
    v89[3] = &unk_1E6DE51B8;
    v91 = buf;
    v92 = &v95;
    v93 = v94;
    uint64_t v21 = v23;
    v90 = v21;
    [v24 appContext:self scriptForURL:v7 cachePolicy:v10 completion:v89];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (v96[5] || ![*(id *)(*(void *)&buf[8] + 40) length])
    {
      [(IKAppContext *)self _invalidateJSThread];
      uint64_t v25 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v68 = [(IKAppContext *)self mode];
        uint64_t v69 = v96[5];
        *(_DWORD *)v101 = 138413058;
        id v102 = v67;
        __int16 v103 = 2048;
        unint64_t v104 = v68;
        __int16 v105 = 2048;
        v106 = self;
        __int16 v107 = 2112;
        uint64_t v108 = v69;
        _os_log_error_impl(&dword_1E2ACE000, v25, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v101, 0x2Au);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_251;
      block[3] = &unk_1E6DE4018;
      void block[4] = self;
      void block[5] = v94;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      id v31 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v101 = 0;
        _os_log_impl(&dword_1E2ACE000, v31, OS_LOG_TYPE_INFO, "Downloaded application script sussessfully. Starting script...", v101, 2u);
      }

      [(IKAppContext *)self _startWithScript:*(void *)(*(void *)&buf[8] + 40) scriptUrl:v7 wasLoadedFromFallback:0];
    }

    _Block_object_dispose(v94, 8);
    _Block_object_dispose(&v95, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_71;
  }
  if (v4)
  {
    BOOL v26 = 1;
    goto LABEL_34;
  }
  if (!+[IKUtilites isAppleTV])
  {
    v32 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
    id v33 = [MEMORY[0x1E4FA8100] defaultStore];
    uint64_t v34 = [v33 activeAccount];
    id v35 = [v34 uniqueIdentifier];
    [v32 setUserIdentifier:v35];

    uint64_t v36 = [MEMORY[0x1E4FA82F8] URLBagForContext:v32];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v110) = 0;
    dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_2;
    v85[3] = &unk_1E6DE3EC8;
    v87 = buf;
    uint64_t v38 = v37;
    v86 = v38;
    [v36 getTrustForURL:v7 completionBlock:v85];
    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v26 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    -[IKAppContext setTrusted:](self, "setTrusted:");

    _Block_object_dispose(buf, 8);
LABEL_34:
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4FA8268]) initWithURL:v7];
    uint64_t v21 = v39;
    if (v10) {
      [v39 setCachePolicy:1];
    }
    [v21 setAllowedRetryCount:0];
    [v21 setTimeoutInterval:v9];
    char v40 = [(IKAppContext *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v41 = [v40 sourceApplicationBundleIdentifierForContext:self];
      [v21 setClientAuditBundleIdentifier:v41];
    }
    if (objc_opt_respondsToSelector())
    {
      id v42 = [v40 sourceApplicationAuditTokenDataForContext:self];
      [v21 setClientAuditTokenData:v42];
    }
    if (v26)
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4FB8858]);
      [v43 setNeedsURLBag:0];
      [v43 setUrlKnownToBeTrusted:1];
      +[IKJSITunesStore setITunesStoreHeaders:v21];
    }
    else
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4FB8868]);
    }
    [v43 setDelegate:self];
    char v44 = objc_opt_new();
    [v43 setDataProvider:v44];

    [v43 setRequestProperties:v21];
    uint64_t v45 = [MEMORY[0x1E4FB8838] mainQueue];
    [v45 addOperation:v43];

    dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_3;
    v83[3] = &unk_1E6DE3CC0;
    id v47 = v46;
    v84 = v47;
    [v43 setCompletionBlock:v83];
    dispatch_semaphore_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
    __int16 v48 = NSNumber;
    unint64_t v49 = [v43 response];
    id v70 = objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "itunes_statusCode"));

    __int16 v50 = [(IKAppContext *)self responseError];
    if (v50)
    {
      id v51 = [(IKAppContext *)self appScriptFallbackHandler];
      uint64_t v52 = [(IKAppContext *)self responseError];
      int v53 = [v51 canFallbackForError:v52];

      if (v53)
      {
        v54 = ITMLKitGetLogObject(0);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          -[IKAppContext _startWithURL:urlTrusted:].cold.4(self, v54);
        }

        id v55 = [(IKAppContext *)self appScriptFallbackHandler];
        id v82 = 0;
        v56 = [v55 retrieveScript:&v82];
        id v57 = v82;

        if (v56)
        {
          [(IKAppContext *)self _startWithScript:v56 scriptUrl:v7 wasLoadedFromFallback:1];
        }
        else
        {
          [(IKAppContext *)self _invalidateJSThread];
          id v64 = ITMLKitGetLogObject(0);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            -[IKAppContext _startWithURL:urlTrusted:](self);
          }

          uint64_t v65 = ITMLKitGetLogObject(0);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[IKAppContext _startWithURL:urlTrusted:](self);
          }

          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_264;
          v79[3] = &unk_1E6DE40B8;
          id v80 = v70;
          v81 = self;
          dispatch_async(MEMORY[0x1E4F14428], v79);
        }
        goto LABEL_70;
      }
    }
    id v58 = [(IKAppContext *)self responseError];
    if (v58)
    {
    }
    else
    {
      v60 = [(IKAppContext *)self responseScript];
      BOOL v61 = [v60 length] == 0;

      if (!v61)
      {
        id v57 = [(IKAppContext *)self responseScript];
        [(IKAppContext *)self _startWithScript:v57 scriptUrl:v7 wasLoadedFromFallback:0];
LABEL_70:

        [(IKAppContext *)self setResponseScript:0];
        [(IKAppContext *)self setResponseError:0];

        goto LABEL_71;
      }
    }
    [(IKAppContext *)self _invalidateJSThread];
    id v59 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[IKAppContext _startWithURL:urlTrusted:](self);
    }

    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_265;
    v76[3] = &unk_1E6DE40B8;
    id v77 = v70;
    v78 = self;
    dispatch_async(MEMORY[0x1E4F14428], v76);
    id v57 = v77;
    goto LABEL_70;
  }
  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v7 cachePolicy:v10 timeoutInterval:v9];
  id v74 = 0;
  id v75 = 0;
  uint64_t v27 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v21 returningResponse:&v75 error:&v74];
  id v28 = v75;
  id v29 = v74;
  if (v29 || ![v27 length]) {
    v30 = 0;
  }
  else {
    v30 = (void *)[[NSString alloc] initWithData:v27 encoding:4];
  }
  v62 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "itunes_statusCode"));
  if ([v30 length])
  {
    [(IKAppContext *)self _startWithScript:v30 scriptUrl:v7 wasLoadedFromFallback:0];
  }
  else
  {
    [(IKAppContext *)self _invalidateJSThread];
    v63 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      -[IKAppContext _startWithURL:urlTrusted:].cold.5(self);
    }

    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __41__IKAppContext__startWithURL_urlTrusted___block_invoke_268;
    v71[3] = &unk_1E6DE40B8;
    id v72 = v62;
    v73 = self;
    dispatch_async(MEMORY[0x1E4F14428], v71);
  }
LABEL_71:
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_251(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  id v6 = @"ITMLKitErrorHTTPStatus";
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  unint64_t v5 = [v2 errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:v4];

  [*(id *)(a1 + 32) contextDidFailWithError:v5];
}

intptr_t __41__IKAppContext__startWithURL_urlTrusted___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __41__IKAppContext__startWithURL_urlTrusted___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_264(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"ITMLKitErrorHTTPStatus";
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  unint64_t v5 = [v2 errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:v4];

  [*(id *)(a1 + 40) contextDidFailWithError:v5];
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_265(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"ITMLKitErrorHTTPStatus";
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  unint64_t v5 = [v2 errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:v4];

  [*(id *)(a1 + 40) contextDidFailWithError:v5];
}

void __41__IKAppContext__startWithURL_urlTrusted___block_invoke_268(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"ITMLKitErrorHTTPStatus";
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  unint64_t v5 = [v2 errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:v4];

  [*(id *)(a1 + 40) contextDidFailWithError:v5];
}

- (void)_startWithScript:(id)a3 scriptUrl:(id)a4 wasLoadedFromFallback:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    BOOL v10 = [(IKAppContext *)self delegate];
    if ([v10 conformsToProtocol:&unk_1F3E41E80])
    {
      char v11 = [(IKAppContext *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        BOOL v13 = [(IKAppContext *)self delegate];
        char v14 = [v13 appContext:self shouldStartWithScript:v8 scriptURL:v9 loadedFromFallback:v5];

        if ((v14 & 1) == 0)
        {
          char v15 = ITMLKitGetLogObject(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self, (uint64_t)v9, v15);
          }

          [(IKAppContext *)self stop];
          goto LABEL_24;
        }
      }
    }
    else
    {
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    long long v18 = [WeakRetained appIdentifier];

    uint64_t v19 = [(IKAppContext *)self remoteInspectionEnabled];
    id v20 = objc_loadWeakRetained((id *)&self->_app);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_app);
      uint64_t v19 = [v22 shouldAllowRemoteInspection];
    }
    JSRemoteInspectorGetInspectionEnabledByDefault();
    JSRemoteInspectorSetInspectionEnabledByDefault();
    id v23 = objc_alloc_init(MEMORY[0x1E4F30920]);
    if ([v18 length]) {
      [v23 setName:v18];
    }
    [v23 _setITMLDebuggableType];
    [v23 _setDebuggerRunLoop:self->_jsThreadRunLoop];
    [v23 _setRemoteInspectionEnabled:v19];
    JSRemoteInspectorSetInspectionEnabledByDefault();
    [(IKAppContext *)self setJsContext:v23];
    char v24 = [[IKJSInspectorController alloc] initWithAppContext:self];
    [(IKJSInspectorController *)v24 setDelegate:self];
    [(IKAppContext *)self setWebInspectorController:v24];
    [(IKAppContext *)self evaluateFoundationJS];
    +[IKDOMNode setup];
    id v25 = (id)[v23 evaluateScript:v8 withSourceURL:v9];
    BOOL v26 = [v23 exception];

    if (v26)
    {
      uint64_t v27 = [v23 exception];
      id v28 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        unint64_t v33 = [(IKAppContext *)self mode];
        [v27 toDictionary];
        *(_DWORD *)buf = 138413570;
        id v43 = v32;
        __int16 v44 = 2048;
        unint64_t v45 = v33;
        __int16 v46 = 2048;
        id v47 = self;
        __int16 v48 = 2112;
        id v49 = v9;
        __int16 v50 = 2112;
        id v51 = v27;
        v53 = __int16 v52 = 2112;
        uint64_t v34 = (void *)v53;
        _os_log_error_impl(&dword_1E2ACE000, v28, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Unable to start script (%@) because of %@: %@", buf, 0x3Eu);
      }
      [v23 setException:0];
      [(IKAppContext *)self _invalidateJSThread];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_275;
      v38[3] = &unk_1E6DE40B8;
      id v39 = v27;
      char v40 = self;
      id v29 = v27;
      dispatch_async(MEMORY[0x1E4F14428], v38);
    }
    else
    {
      [(IKAppContext *)self setIsValid:1];
      if (!v5)
      {
        v30 = [(IKAppContext *)self appScriptFallbackHandler];
        [v30 scriptEvaluated:v8];
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_2;
      v35[3] = &unk_1E6DE51E0;
      v35[4] = self;
      BOOL v37 = v5;
      id v36 = v8;
      [(IKAppContext *)self _evaluate:v35];
    }
  }
  else
  {
    long long v16 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[IKAppContext _startWithScript:scriptUrl:wasLoadedFromFallback:](self);
    }

    [(IKAppContext *)self _invalidateJSThread];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke;
    block[3] = &unk_1E6DE3CC0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_24:
}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:0];
  [*(id *)(a1 + 32) contextDidFailWithError:v2];
}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_275(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = [*(id *)(a1 + 32) toDictionary];
  id v4 = [v2 errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:v3];

  [*(id *)(a1 + 40) contextDidFailWithError:v4];
}

void __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mode] == 1000) {
    goto LABEL_29;
  }
  id v2 = [*(id *)(a1 + 32) app];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) app];
    id v4 = [v3 bagBootURLKey];
  }
  else
  {
    id v4 = 0;
  }

  BOOL v5 = [*(id *)(a1 + 32) app];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(a1 + 32) app];
    id v7 = [v6 offlineJSURL];
  }
  else
  {
    id v7 = 0;
  }

  id v8 = [*(id *)(a1 + 32) app];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_12:
    char v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    goto LABEL_13;
  }
  id v9 = [*(id *)(a1 + 32) app];
  BOOL v10 = [v9 appLaunchParams];
  char v11 = (void *)[v10 mutableCopy];

  if (!v11) {
    goto LABEL_12;
  }
LABEL_13:
  char v12 = [*(id *)(a1 + 32) resolvedBootURL];
  BOOL v13 = [*(id *)(a1 + 32) resolvedBootURL];
  char v14 = [v13 isEqual:v7];

  if ((v14 & 1) == 0)
  {
    if (!v4) {
      goto LABEL_17;
    }
    char v15 = (void *)MEMORY[0x1E4F1CB10];
    long long v16 = +[IKURLBagCache sharedCache];
    char v17 = [v16 valueForKey:v4];
    long long v18 = [v15 URLWithString:v17];

    if (v18)
    {
      id v19 = v18;
      id v20 = v19;
    }
    else
    {
LABEL_17:
      id v20 = [*(id *)(a1 + 32) app];
      id v19 = [v20 appJSURL];
    }
    id v21 = v19;

    char v12 = v21;
  }
  id v22 = [v11 objectForKey:@"location"];

  if (v12 && !v22)
  {
    id v23 = [v12 absoluteString];
    [v11 setObject:v23 forKey:@"location"];
  }
  char v24 = [*(id *)(a1 + 32) _preferredLaunchURL];
  id v25 = [*(id *)(a1 + 32) reloadContext];
  BOOL v26 = [v25 reloadData];

  if (v26)
  {
    uint64_t v27 = [*(id *)(a1 + 32) reloadContext];
    id v28 = [v27 reloadData];
    [v11 setObject:v28 forKey:@"reloadData"];
  }
  if (v24)
  {
    id v29 = [v24 absoluteString];
    [v11 setObject:v29 forKey:@"itml.location"];
  }
  if (*(unsigned char *)(a1 + 48)) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKey:@"itml.loadedFromFallback"];
  }
  v30 = *(void **)(a1 + 32);
  id v31 = (void *)[v11 copy];
  [v30 launchAppWithOptions:v31];

LABEL_29:
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_3;
  v33[3] = &unk_1E6DE40B8;
  v32 = *(void **)(a1 + 40);
  v33[4] = *(void *)(a1 + 32);
  id v34 = v32;
  dispatch_async(MEMORY[0x1E4F14428], v33);
}

uint64_t __65__IKAppContext__startWithScript_scriptUrl_wasLoadedFromFallback___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) contextDidStartWithJS:*(void *)(a1 + 40) options:0];
}

- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if ([(IKAppContext *)v4 canAccessPendingQueue])
  {
    [(IKAppContext *)v4 setCanAccessPendingQueue:0];
    objc_initWeak(&location, v4);
    BOOL v5 = [IKRunLoopSourceRecord alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __55__IKAppContext__addStopRecordToPendingQueueWithReload___block_invoke;
    v9[3] = &unk_1E6DE5208;
    objc_copyWeak(&v10, &location);
    BOOL v11 = a3;
    id v6 = [(IKRunLoopSourceRecord *)v5 initWithEvaluateBlock:v9 completionBlock:0];
    id v7 = [(IKAppContext *)v4 pendingQueue];
    [v7 addObject:v6];

    if (v4->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v4->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);
}

void __55__IKAppContext__addStopRecordToPendingQueueWithReload___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopAndReload:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopAndReload:(BOOL)a3
{
  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"IKNetworkPropertiesChangedNotification" object:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__IKAppContext__stopAndReload___block_invoke;
  v10[3] = &unk_1E6DE5230;
  v10[4] = self;
  BOOL v11 = a3;
  [(IKAppContext *)self _evaluate:v10];
  [(IKAppContext *)self setIsValid:0];
  [(IKAppContext *)self resetFoundationJS];
  [(IKAppContext *)self setJsContext:0];
  if (a3)
  {
    [(IKAppContext *)self setWebInspectorController:0];
    [(IKAppContext *)self _invalidateJSThread];
  }
  else
  {
    [(IKAppContext *)self setNextJSChecksum:0];
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(IKAppContext *)v6 onStartQueue];
    [v7 removeAllObjects];

    objc_sync_exit(v6);
    [(IKAppContext *)v6 setWebInspectorController:0];
    [(IKAppContext *)v6 _invalidateJSThread];
    [(IKAppContext *)v6 setReloadContext:0];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__IKAppContext__stopAndReload___block_invoke_2;
  v8[3] = &unk_1E6DE5258;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __31__IKAppContext__stopAndReload___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = @"true";
  if (!*(unsigned char *)(a1 + 40)) {
    id v2 = @"false";
  }
  id v4 = @"reloading";
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 exitAppWithOptions:v3];
}

uint64_t __31__IKAppContext__stopAndReload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) contextDidStopWithOptions:0];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 start];
  }
  return result;
}

- (void)_jsThreadMain
{
  uint64_t v3 = (void *)MEMORY[0x1E4E655C0](self, a2);
  v17.version = 0;
  v17.info = self;
  memset(&v17.retain, 0, 40);
  v17.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))IKRunLoopSourceScheduleCallBack;
  v17.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))IKRunLoopSourceCancelCallBack;
  v17.perform = (void (__cdecl *)(void *))IKRunLoopSourcePerformCallBack;
  id v4 = self;
  objc_sync_enter(v4);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v4->_jsThreadRunLoop = Current;
  CFRetain(Current);
  id v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v17);
  v4->_jsThreadRunLoopSource = v6;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  id v8 = objc_msgSend(MEMORY[0x1E4F29060], "currentThread", v17.version, v17.info, *(_OWORD *)&v17.retain, *(_OWORD *)&v17.copyDescription, v17.hash, v17.schedule, v17.cancel, v17.perform);
  BOOL v9 = [v8 threadDictionary];
  [v9 setObject:v4 forKeyedSubscript:@"itmlAppContext"];

  objc_sync_exit(v4);
  do
  {
    id v10 = (void *)MEMORY[0x1E4E655C0]();
    CFRunLoopRunResult v11 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
    char v12 = v4;
    objc_sync_enter(v12);
    jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
    objc_sync_exit(v12);
  }
  while ((v11 - 3) <= 0xFFFFFFFD && jsThreadRunLoopSource == v6);
  char v15 = v12;
  objc_sync_enter(v15);
  long long v16 = [v8 threadDictionary];
  [v16 removeObjectForKey:@"itmlAppContext"];
  CFRelease(v6);
  CFRelease(Current);

  objc_sync_exit(v15);
}

- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3
{
  CFRunLoopSourceSignal(self->_jsThreadRunLoopSource);
  jsThreadRunLoop = self->_jsThreadRunLoop;
  CFRunLoopWakeUp(jsThreadRunLoop);
}

- (void)_sourcePerform
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(IKAppContext *)v2 pendingQueue];
  objc_sync_exit(v2);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__IKAppContext__sourcePerform__block_invoke;
  v14[3] = &unk_1E6DE5280;
  void v14[4] = v2;
  id v4 = v3;
  id v15 = v4;
  BOOL v5 = (void (**)(void))MEMORY[0x1E4E65800](v14);
  uint64_t v6 = v5[2]();
  if (v6)
  {
    CFStringRef v7 = (void *)v6;
    do
    {
      id v8 = [v7 evaluateBlock];
      v8[2]();

      BOOL v9 = [v7 completionBlock];

      if (v9)
      {
        id v10 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__IKAppContext__sourcePerform__block_invoke_2;
        block[3] = &unk_1E6DE3CC0;
        id v13 = v7;
        dispatch_async(v10, block);
      }
      uint64_t v11 = ((void (*)(void (**)(void)))v5[2])(v5);

      CFStringRef v7 = (void *)v11;
    }
    while (v11);
  }
}

id __30__IKAppContext__sourcePerform__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 40) firstObject];
  if (v3) {
    [*(id *)(a1 + 40) removeObjectAtIndex:0];
  }
  objc_sync_exit(v2);

  return v3;
}

void __30__IKAppContext__sourcePerform__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) completionBlock];
  v1[2](v1, 1);
}

- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3
{
  obj = self;
  objc_sync_enter(obj);
  CFRunLoopRemoveSource(obj->_jsThreadRunLoop, obj->_jsThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRunLoopStop(obj->_jsThreadRunLoop);
  objc_sync_exit(obj);
}

- (void)_evaluate:(id)a3
{
  id v16 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [(IKAppContext *)self setPostEvaluationBlocks:v4];

  [(IKAppContext *)self _doEvaluate:v16];
  BOOL v5 = [(IKAppContext *)self postEvaluationBlocks];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    do
    {
      CFStringRef v7 = [(IKAppContext *)self postEvaluationBlocks];
      [v7 removeObjectAtIndex:0];

      id v8 = [(IKAppContext *)self jsContext];
      ((void (**)(void, void *))v6)[2](v6, v8);

      BOOL v9 = [(IKAppContext *)self jsContext];
      id v10 = [v9 exception];

      if (v10)
      {
        uint64_t v11 = [(IKAppContext *)self jsContext];
        char v12 = [v11 exception];
        [(IKAppContext *)self _dispatchError:v12];

        id v13 = [(IKAppContext *)self jsContext];
        [v13 setException:0];
      }
      char v14 = [(IKAppContext *)self postEvaluationBlocks];
      uint64_t v15 = [v14 firstObject];

      uint64_t v6 = (void (**)(void, void))v15;
    }
    while (v15);
  }
  [(IKAppContext *)self setPostEvaluationBlocks:0];
}

- (void)_invalidateJSThread
{
  obj = self;
  objc_sync_enter(obj);
  CFRunLoopSourceInvalidate(obj->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(obj->_jsThreadRunLoop);
  obj->_jsThreadRunLoop = 0;
  obj->_jsThreadRunLoopSource = 0;
  id v2 = [(IKAppContext *)obj pendingQueue];
  [v2 removeAllObjects];

  [(IKAppContext *)obj setPendingQueue:0];
  [(IKAppContext *)obj setCanAccessPendingQueue:0];
  [(IKAppContext *)obj setRunning:0];
  objc_sync_exit(obj);
}

- (void)_doEvaluate:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (![(IKAppContext *)self isValid])
  {
    BOOL v5 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[IKAppContext _doEvaluate:](self, v5);
    }
  }
  uint64_t v6 = [(IKAppContext *)self jsContext];
  v4[2](v4, v6);

  CFStringRef v7 = [(IKAppContext *)self jsContext];
  id v8 = [v7 exception];

  if (v8)
  {
    BOOL v9 = [(IKAppContext *)self jsContext];
    id v10 = [v9 exception];
    [(IKAppContext *)self _dispatchError:v10];

    uint64_t v11 = [(IKAppContext *)self jsContext];
    [v11 setException:0];
  }
}

- (id)_errorWithMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IKAppContext *)self jsContext];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Error"];
  CFStringRef v7 = [v6 constructWithArguments:MEMORY[0x1E4F1CBF0]];

  [v7 setObject:v4 forKeyedSubscript:@"message"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"stack", 0);
  BOOL v9 = [v8 toString];
  id v10 = [v9 componentsSeparatedByString:@"\n"];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v15 isEqualToString:@"[native code]"] & 1) == 0)
        {
          [v7 setObject:v15 forKeyedSubscript:@"sourceURL"];
          id v16 = [v15 componentsSeparatedByString:@":"];
          unint64_t v17 = [v16 count];
          if (v17 >= 3)
          {
            unint64_t v18 = v17;
            id v19 = [v16 objectAtIndex:v17 - 2];
            id v20 = [v16 objectAtIndex:v18 - 1];
            if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
            {
              [v7 setObject:v19 forKeyedSubscript:@"line"];
              [v7 setObject:v20 forKeyedSubscript:@"column"];
            }
          }
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)_dispatchError:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"errorDispatched"];
  char v6 = [v5 toBool];

  if ((v6 & 1) == 0)
  {
    CFStringRef v7 = [v4 objectForKeyedSubscript:@"message"];
    id v8 = [v7 toString];

    BOOL v9 = [v4 objectForKeyedSubscript:@"sourceURL"];
    id v10 = [v9 toString];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"line"];
    uint64_t v12 = [v11 toString];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"column"];
    char v14 = [v13 toString];

    if ([v8 length])
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@:%@", v12, v14];
      id v16 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138413570;
        long long v23 = v21;
        __int16 v24 = 2048;
        unint64_t v25 = [(IKAppContext *)self mode];
        __int16 v26 = 2048;
        uint64_t v27 = self;
        __int16 v28 = 2112;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        unint64_t v33 = v15;
        _os_log_error_impl(&dword_1E2ACE000, v16, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Error: %@ - %@ - line:%@", buf, 0x3Eu);
      }
      unint64_t v17 = [(IKAppContext *)self jsContext];
      unint64_t v18 = [v17 objectForKeyedSubscript:@"App"];
      id v19 = [v18 toObjectOfClass:objc_opt_class()];

      [v19 dispatchErrorWithMessage:v8 sourceURL:v10 line:v15];
    }
  }
}

- (id)_preferredLaunchURL
{
  if (+[IKUtilites runningAnInternalBuild])
  {
    id v2 = (void *)CFPreferencesCopyAppValue(@"JSURL", @"com.apple.ITMLKit");
    if ([v2 length])
    {
      uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_enqueueOnStartOrExecute:(id)a3
{
  CFStringRef v7 = (void (**)(void))a3;
  if ([(IKAppContext *)self isValid])
  {
    v7[2]();
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    BOOL v5 = [(IKAppContext *)v4 onStartQueue];
    char v6 = (void *)MEMORY[0x1E4E65800](v7);
    [v5 addObject:v6];

    objc_sync_exit(v4);
  }
}

- (void)_drainOnStartQueue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(IKAppContext *)v2 onStartQueue];
  id v4 = (void *)[v3 copy];

  BOOL v5 = [(IKAppContext *)v2 onStartQueue];
  [v5 removeAllObjects];

  objc_sync_exit(v2);
  if ([v4 count])
  {
    char v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2ACE000, v6, OS_LOG_TYPE_INFO, "[StartQueue] Draining start Queue", buf, 2u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  if (objc_msgSend(v7, "count", (void)v12))
  {
    uint64_t v11 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2ACE000, v11, OS_LOG_TYPE_INFO, "[StartQueue] Done Draining start Queue!", buf, 2u);
    }
  }
}

- (void)contextDidStopWithOptions:(id)a3
{
  id v4 = [(IKAppContext *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(IKAppContext *)self delegate];
    [v6 appContext:self didStopWithOptions:0];
  }
}

- (void)contextDidFailWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(IKAppContext *)self app];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(IKAppContext *)self app];
    id v7 = [v6 offlineJSURL];
  }
  else
  {
    id v7 = 0;
  }

  unint64_t v8 = [(IKAppContext *)self mode];
  [(IKAppContext *)self setRunning:0];
  if (v8 == 1000
    || ([(IKAppContext *)self resolvedBootURL],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqual:v7],
        v9,
        (v10 & 1) != 0)
    || !v7)
  {
    long long v13 = [(IKAppContext *)self resolvedBootURL];
    int v14 = [v13 isEqual:v7];

    if (v14)
    {
      long long v15 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[IKAppContext contextDidFailWithError:]();
      }
    }
    id v16 = [(IKAppContext *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(IKAppContext *)self delegate];
      [v18 appContext:self didFailWithError:v4];
    }
  }
  else
  {
    uint64_t v11 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [(IKAppContext *)self resolvedBootURL];
      int v19 = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      long long v22 = v7;
      _os_log_impl(&dword_1E2ACE000, v11, OS_LOG_TYPE_INFO, "This isn't a validation context, the resolved URL (%@) isn't the offline JS and we actually have an offline JS (%@). Starting offline JS...", (uint8_t *)&v19, 0x16u);
    }
    [(IKAppContext *)self _prepareStartWithURL:v7];
  }
}

- (void)contextDidStartWithJS:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  unint64_t v8 = [(IKAppContext *)self app];
  uint64_t v9 = 0;
  if (objc_opt_respondsToSelector())
  {
    char v10 = [(IKAppContext *)self app];
    uint64_t v9 = [v10 offlineJSURL];
  }
  uint64_t v11 = [(IKAppContext *)self resolvedBootURL];
  unint64_t v12 = [(IKAppContext *)self mode];
  long long v13 = [(IKAppContext *)self delegate];
  if ([v13 conformsToProtocol:&unk_1F3E41E80])
  {
    int v14 = [(IKAppContext *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = [(IKAppContext *)self delegate];
      [v16 appContext:self didStartWithOptions:v7 validatedJSString:v6];
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
  }
  char v17 = [(IKAppContext *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v16 = [(IKAppContext *)self delegate];
    [v16 appContext:self didStartWithOptions:v7];
    goto LABEL_9;
  }
LABEL_10:
  if (v12 != 1000 && ([v11 isEqual:v9] & 1) == 0 && (objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    int v19 = [(IKAppContext *)self appCache];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__IKAppContext_contextDidStartWithJS_options___block_invoke;
    v20[3] = &unk_1E6DE52A8;
    id v21 = v11;
    [v19 updateCacheWithValidatedJS:v6 completion:v20];
  }
  [(IKAppContext *)self _drainOnStartQueue];
}

void __46__IKAppContext_contextDidStartWithJS_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ITMLKitGetLogObject(2);
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1E2ACE000, v5, OS_LOG_TYPE_INFO, "Cached remote URL (%@) with checksum %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __46__IKAppContext_contextDidStartWithJS_options___block_invoke_cold_1(a1, v5);
  }
}

- (id)_appTraitCollection
{
  if (self->_respondsToTraitCollection)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    id v3 = [WeakRetained appTraitCollection];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToHighlightViewsForManyElements)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__IKAppContext_highlightViewsForElementsWithIDs_contentColor_paddingColor_borderColor_marginColor___block_invoke;
    v19[3] = &unk_1E6DE52D0;
    objc_copyWeak(&v27, &location);
    __int16 v26 = &v29;
    id v20 = v12;
    id v21 = self;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    [(IKAppContext *)self evaluateDelegateBlockSync:v19];

    objc_destroyWeak(&v27);
  }
  char v17 = *((unsigned char *)v30 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __99__IKAppContext_highlightViewsForElementsWithIDs_contentColor_paddingColor_borderColor_marginColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained app];
    int v7 = [v6 activeDocument];

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(v7, "_viewElementForNodeID:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "unsignedIntegerValue", (void)v16));
          if (v14) {
            [v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    id v15 = [*(id *)(a1 + 40) delegate];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v15 appContext:v3 highlightViewsForElements:v8 contentColor:*(void *)(a1 + 48) paddingColor:*(void *)(a1 + 56) borderColor:*(void *)(a1 + 64) marginColor:*(void *)(a1 + 72)];
  }
}

- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToHighlightViewForOneElement)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__IKAppContext_highlightViewForElementWithID_contentColor_paddingColor_borderColor_marginColor___block_invoke;
    v18[3] = &unk_1E6DE52F8;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    id v23 = &v26;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    id v22 = v15;
    [(IKAppContext *)self evaluateDelegateBlockSync:v18];

    objc_destroyWeak(v24);
  }
  char v16 = *((unsigned char *)v27 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __96__IKAppContext_highlightViewForElementWithID_contentColor_paddingColor_borderColor_marginColor___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained app];
    uint64_t v6 = [v5 activeDocument];

    int v7 = [v6 _viewElementForNodeID:*(void *)(a1 + 80)];
    if (v7)
    {
      uint64_t v8 = [v4 delegate];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 appContext:v9 highlightViewForElement:v7 contentColor:*(void *)(a1 + 32) paddingColor:*(void *)(a1 + 40) borderColor:*(void *)(a1 + 48) marginColor:*(void *)(a1 + 56)];
    }
  }
}

- (BOOL)cancelHighlightView
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToCancelHighlightForAppContext)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __35__IKAppContext_cancelHighlightView__block_invoke;
    v5[3] = &unk_1E6DE5320;
    objc_copyWeak(&v6, &location);
    v5[4] = &v8;
    [(IKAppContext *)self evaluateDelegateBlockSync:v5];
    objc_destroyWeak(&v6);
  }
  char v3 = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __35__IKAppContext_cancelHighlightView__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained delegate];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 cancelHighlightViewForAppContext:v6];
  }
}

- (void)inspectElementModeChanged:(BOOL)a3
{
  objc_initWeak(&location, self);
  if (self->_delegateFlags.respondsToDidInspectElementModeChanged)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __42__IKAppContext_inspectElementModeChanged___block_invoke;
    v5[3] = &unk_1E6DE5348;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    BOOL v7 = a3;
    [(IKAppContext *)self evaluateDelegateBlockSync:v5];
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __42__IKAppContext_inspectElementModeChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    char v3 = [WeakRetained delegate];
    [v3 appContext:*(void *)(a1 + 32) didChangeInspectElementMode:*(unsigned __int8 *)(a1 + 48)];

    id WeakRetained = v4;
  }
}

- (BOOL)isInspectElementModeEnabled
{
  id v2 = [(IKAppContext *)self webInspectorController];
  char v3 = [v2 isInspectElementModeEnabled];

  return v3;
}

- (void)inspectElement:(id)a3
{
  id v4 = a3;
  char v5 = [v4 itmlID];
  id v6 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[IKAppContext inspectElement:]();
  }

  BOOL v7 = [(IKAppContext *)self webInspectorController];
  objc_msgSend(v7, "inspectNodeWithID:", +[IKDOMNode ITMLIDForITMLIDString:](IKDOMNode, "ITMLIDForITMLIDString:", v5));
}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(IKAppContext *)self webInspectorController];
  id v6 = [v5 registerLoaderWithIdentifier:v4];

  return v6;
}

- (void)unregisterLoaderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppContext *)self webInspectorController];
  [v5 unregisterLoaderWithIdentifier:v4];
}

- (void)appCache:(id)a3 didUpdateWithChecksum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke;
    v8[3] = &unk_1E6DE40E0;
    objc_copyWeak(&v10, &location);
    id v9 = v7;
    [(IKAppContext *)self _enqueueOnStartOrExecute:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke(uint64_t a1)
{
  id v2 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_339;
  v4[3] = &unk_1E6DE48E8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  [WeakRetained evaluate:v4 completionBlock:0];

  objc_destroyWeak(&v6);
}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_339(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setNextJSChecksum:*(void *)(a1 + 32)];
    id v6 = [v3 objectForKeyedSubscript:@"App"];
    id v7 = [v6 toObjectOfClass:objc_opt_class()];

    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = @"checksum";
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 updatedAppWithOptions:v9];
  }
}

- (void)handleCacheUpdate
{
  id v2 = [(IKAppContext *)self appCache];
  [v2 refreshWithCompletion:0];
}

- (void)_networkPropertiesChanged:(id)a3
{
  id v4 = +[IKNetworkUtilities sharedInstance];
  int v5 = [v4 isAirplaneModeEnabled];

  if (self->_isAirplaneModeEnabled != v5)
  {
    id v6 = [(IKAppContext *)self appCache];
    if (v6)
    {
      BOOL isAirplaneModeEnabled = self->_isAirplaneModeEnabled;

      self->_BOOL isAirplaneModeEnabled = v5;
      if (isAirplaneModeEnabled && (v5 & 1) == 0)
      {
        id v8 = [(IKAppContext *)self appCache];
        [v8 refreshWithCompletion:0];
      }
    }
    else
    {
      self->_BOOL isAirplaneModeEnabled = v5;
    }
  }
}

+ (BOOL)isInFactoryMode
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"com.apple.ITMLKit";
  }
  BOOL v5 = CFPreferencesGetAppBooleanValue(@"FactoryMode", v4, 0) != 0;

  return v5;
}

- (void)willPerformXhrRequest:(id)a3
{
  id v5 = a3;
  id v4 = [(IKAppContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appContext:self willPerformXhrRequest:v5];
  }
}

- (IKApplication)app
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
  return (IKApplication *)WeakRetained;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (IKAppContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKAppContextDelegate *)WeakRetained;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)remoteInspectionEnabled
{
  return self->_remoteInspectionEnabled;
}

- (void)setRemoteInspectionEnabled:(BOOL)a3
{
  self->_remoteInspectionEnabled = a3;
}

- (BOOL)mescalPrimeEnabledForXHRRequests
{
  return self->_mescalPrimeEnabledForXHRRequests;
}

- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3
{
  self->_mescalPrimeEnabledForXHRRequests = a3;
}

- (BOOL)canRequireSystemTrustForXHRs
{
  return self->_canRequireSystemTrustForXHRs;
}

- (void)setCanRequireSystemTrustForXHRs:(BOOL)a3
{
  self->_canRequireSystemTrustForXHRs = a3;
}

- (IKAppScriptFallbackHandler)appScriptFallbackHandler
{
  return self->_appScriptFallbackHandler;
}

- (void)setAppScriptFallbackHandler:(id)a3
{
}

- (double)appScriptTimeoutInterval
{
  return self->_appScriptTimeoutInterval;
}

- (void)setAppScriptTimeoutInterval:(double)a3
{
  self->_appScriptTimeoutInterval = a3;
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (void)setJsContext:(id)a3
{
}

- (IKAppCache)appCache
{
  return self->_appCache;
}

- (NSString)nextJSChecksum
{
  return self->_nextJSChecksum;
}

- (void)setNextJSChecksum:(id)a3
{
}

- (NSMutableArray)onStartQueue
{
  return self->_onStartQueue;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (BOOL)canAccessPendingQueue
{
  return self->_canAccessPendingQueue;
}

- (void)setCanAccessPendingQueue:(BOOL)a3
{
  self->_canAccessPendingQueue = a3;
}

- (NSString)responseScript
{
  return self->_responseScript;
}

- (void)setResponseScript:(id)a3
{
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (IKAppReloadContext)reloadContext
{
  return self->_reloadContext;
}

- (void)setReloadContext:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSMutableArray)pendingQueue
{
  return self->_pendingQueue;
}

- (void)setPendingQueue:(id)a3
{
}

- (NSURL)resolvedBootURL
{
  return self->_resolvedBootURL;
}

- (NSMutableArray)postEvaluationBlocks
{
  return self->_postEvaluationBlocks;
}

- (void)setPostEvaluationBlocks:(id)a3
{
}

- (IKJSApplication)jsApp
{
  return self->_jsApp;
}

- (void)setJsApp:(id)a3
{
}

- (IKJSFoundation)jsFoundation
{
  return self->_jsFoundation;
}

- (void)setJsFoundation:(id)a3
{
}

- (IKJSWeakMap)jsWeakMap
{
  return self->_jsWeakMap;
}

- (void)setJsWeakMap:(id)a3
{
}

- (IKJSViewModelService)jsViewModelService
{
  return self->_jsViewModelService;
}

- (void)setJsViewModelService:(id)a3
{
}

- (BOOL)isPrivileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (IKViewElementRegistry)viewElementRegistry
{
  return self->_viewElementRegistry;
}

- (BOOL)appUsesDefaultStyleSheets
{
  return self->_appUsesDefaultStyleSheets;
}

- (IKJSInspectorController)webInspectorController
{
  return self->_webInspectorController;
}

- (void)setWebInspectorController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webInspectorController, 0);
  objc_storeStrong((id *)&self->_viewElementRegistry, 0);
  objc_storeStrong((id *)&self->_jsViewModelService, 0);
  objc_storeStrong((id *)&self->_jsWeakMap, 0);
  objc_storeStrong((id *)&self->_jsFoundation, 0);
  objc_storeStrong((id *)&self->_jsApp, 0);
  objc_storeStrong((id *)&self->_postEvaluationBlocks, 0);
  objc_storeStrong((id *)&self->_resolvedBootURL, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_reloadContext, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseScript, 0);
  objc_storeStrong((id *)&self->_onStartQueue, 0);
  objc_storeStrong((id *)&self->_nextJSChecksum, 0);
  objc_storeStrong((id *)&self->_appCache, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_appScriptFallbackHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_lowMemoryWarningSource, 0);
  objc_storeStrong((id *)&self->_arrayBufferStore, 0);
}

void __21__IKAppContext_start__block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1E2ACE000, v2, OS_LOG_TYPE_DEBUG, "Using bag boot url key (%@) for validation context (%@): %@", v3, 0x20u);
}

void __21__IKAppContext_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __21__IKAppContext_start__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __21__IKAppContext_start__block_invoke_2_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_DEBUG, "Trying to load from app cache...", v1, 2u);
}

void __21__IKAppContext_start__block_invoke_104_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __21__IKAppContext_start__block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1E2ACE000, v0, v1, "Bag URL using \"%@\" key is \"%@\"");
}

void __61__IKAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __int16 v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [a1 mode];
  id v7 = [a1 app];
  id v8 = [v7 appIdentifier];
  int v9 = 138413058;
  id v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  id v14 = a1;
  __int16 v15 = 2112;
  char v16 = v8;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> %@ hasn't implemented reload API", (uint8_t *)&v9, 0x2Au);
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.1(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 mode];
  __int16 v4 = [a1 responseError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1E2ACE000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.2(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 mode];
  OUTLINED_FUNCTION_1_1(&dword_1E2ACE000, v4, v5, "<%@ (%lu): %p> Failed to load bootstrap fallback with error: %@", v6, v7, v8, v9, 2u);
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.3(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 mode];
  uint64_t v4 = [a1 responseError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1E2ACE000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);
}

- (void)_startWithURL:(void *)a1 urlTrusted:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [a1 mode];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "<%@ (%lu): %p> Failed to load launch URL, trying bootstrap fallback", v6, 0x20u);
}

- (void)_startWithURL:(void *)a1 urlTrusted:.cold.5(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 mode];
  uint64_t v4 = [a1 responseError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1E2ACE000, v5, v6, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v7, v8, v9, v10, v11);
}

- (void)_startWithScript:(void *)a1 scriptUrl:wasLoadedFromFallback:.cold.1(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 mode];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1E2ACE000, v4, v5, "<%@ (%lu): %p> Trying to load a script with zero length from %@", v6, v7, v8, v9, v10);
}

- (void)_startWithScript:(void *)a1 scriptUrl:(uint64_t)a2 wasLoadedFromFallback:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [a1 mode];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_DEBUG, "<%@ (%lu): %p> Delegate opted to stop script loading from %@", v7, 0x2Au);
}

- (void)_doEvaluate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [a1 mode];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Evaluating block without JSContext", v6, 0x20u);
}

- (void)contextDidFailWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1E2ACE000, v0, OS_LOG_TYPE_ERROR, "Offline JS (%@) has failed startup!", v1, 0xCu);
}

void __46__IKAppContext_contextDidStartWithJS_options___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unable to cache remote URL (%@): %@", (uint8_t *)&v3, 0x16u);
}

- (void)inspectElement:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1E2ACE000, v0, v1, "Want to inspect itmlID (%@): %@");
}

void __47__IKAppContext_appCache_didUpdateWithChecksum___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = objc_loadWeakRetained(v4);
  uint64_t v9 = [v8 mode];
  id v10 = objc_loadWeakRetained(v4);
  uint64_t v11 = *(void *)(a1 + 32);
  int v12 = 138413314;
  __int16 v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = v9;
  __int16 v16 = 2048;
  id v17 = v10;
  __int16 v18 = 2112;
  id v19 = v10;
  __int16 v20 = 2112;
  uint64_t v21 = v11;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "<%@ (%lu): %p> Notifying App object on %@ about new AppJS with %@", (uint8_t *)&v12, 0x34u);
}

@end