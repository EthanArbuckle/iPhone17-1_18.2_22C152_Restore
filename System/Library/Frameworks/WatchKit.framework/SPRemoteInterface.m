@interface SPRemoteInterface
+ (BOOL)sendDataToApp:(id)a3;
+ (BOOL)sendDataToApp:(id)a3 reply:(id)a4;
+ (id)SerializablePropertyValue:(id)a3;
+ (id)_remoteIdentifier;
+ (id)cacheIdentifier;
+ (id)controller:(id)a3 setupProperties:(id)a4 viewControllerID:(id)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7 classForType:(void *)a8;
+ (id)sharedRemoteInterface;
+ (id)startRemoteInterface;
+ (id)startRemoteInterfaceWithBundle:(id)a3;
+ (void)_logDuplicate:(id)a3 controller:(id)a4 key:(id)a5 property:(id)a6 value:(id)a7;
+ (void)_setupStorageForController:(id)a3;
+ (void)_updateAccessibility;
+ (void)clearStorageForController:(id)a3;
+ (void)controller:(id)a3 presentAddPassesControllerWithPasses:(id)a4 completion:(id)a5;
+ (void)controller:(id)a3 presentInterfaceController:(id)a4 context:(id)a5;
+ (void)controller:(id)a3 presentInterfaceControllers:(id)a4 contexts:(id)a5;
+ (void)controller:(id)a3 presentTextInputControllerWithSuggestions:(id)a4 allowedInputMode:(id)a5 completion:(id)a6;
+ (void)controller:(id)a3 presentTextInputControllerWithSuggestionsForLanguage:(id)a4 allowedInputMode:(id)a5 completion:(id)a6;
+ (void)controller:(id)a3 pushInterfaceController:(id)a4 context:(id)a5;
+ (void)controllerBecomeCurrentPage:(id)a3;
+ (void)controllerDismiss:(id)a3;
+ (void)controllerDismissAddPassesController:(id)a3;
+ (void)controllerDismissTextInputController:(id)a3;
+ (void)controllerPop:(id)a3;
+ (void)controllerPopToRoot:(id)a3;
+ (void)didFinishHandlingActivity:(id)a3;
+ (void)handleEvent:(id)a3;
+ (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5;
+ (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
+ (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4;
+ (void)openSystemURL:(id)a3;
+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4;
+ (void)removePageControllerAtIndexes:(id)a3;
+ (void)sendCacheRequest:(id)a3;
+ (void)sendCacheRequestMessage:(id)a3;
+ (void)setController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6;
+ (void)setControllerActive:(id)a3;
+ (void)setControllerInactive:(id)a3;
+ (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 interfaceController:(id)a6;
- (BOOL)_handleAction:(id)a3 forNotification:(id)a4 remoteNotificationContext:(id)a5 localNotification:(id)a6 unNotification:(id)a7 handler:(id)a8 controller:(id)a9;
- (BOOL)_sendDataToApp:(id)a3 reply:(id)a4;
- (NSBundle)extensionBundle;
- (NSMutableArray)activeComplicationsConnections;
- (NSMutableArray)openParentRequests;
- (NSMutableDictionary)interfaceControllers;
- (NSMutableDictionary)interfaceControllersOwners;
- (NSMutableSet)missingInterfaceControllers;
- (NSString)appClientIdentifier;
- (NSString)navigatingViewControllerID;
- (NSString)rootViewControllerID;
- (OS_dispatch_queue)interfaceControllersAccessQueue;
- (SPRemoteInterface)initWithBundle:(id)a3;
- (SPRemoteInterfaceDataDelegateProtocol)dataDelegate;
- (id)_allInterfaceControllers;
- (id)_host;
- (id)_interfaceControllerClientIDForControllerID:(id)a3;
- (id)_interfaceControllerID:(id)a3;
- (id)_interfaceControllerIDsForClientID:(id)a3;
- (id)_interfaceControllerWithID:(id)a3;
- (id)_setupSignal:(int)a3 handler:(id)a4;
- (id)addPassesCompletion;
- (id)audioRecorderControllerCompletion;
- (id)controllerMethods:(id)a3;
- (id)interfaceCreationContextForID:(id)a3;
- (id)mediaPlayerControllerCompletion;
- (id)pageInterfaceCreationContextForID:(id)a3;
- (id)runLoopObserver;
- (id)storeInterfaceCreationContext:(id)a3;
- (id)storePageInterfaceCreationContext:(id)a3;
- (id)textInputCompletion;
- (id)textInputSuggestions;
- (void)_activateViewController:(id)a3 clientIdentifier:(id)a4;
- (void)_deregisterInterfaceControllerID:(id)a3;
- (void)_dumpInterfaceDictionary;
- (void)_fillDataWithRandom:(id)a3 length:(int64_t)a4;
- (void)_inQueue_recoverFromMissingIntefaceControllerWithID:(id)a3;
- (void)_interfaceControllerWithID:(id)a3 performBlock:(id)a4;
- (void)_performAfterSendSetViewControllers:(id)a3;
- (void)_registerInterfaceController:(id)a3 interfaceControllerID:(id)a4 interfaceControllerClientID:(id)a5 applicationRootController:(BOOL)a6;
- (void)_requestTimingData:(id)a3;
- (void)_setupSignalHandlers;
- (void)_tellApplicationThatInterfaceControllerCantBeFound:(id)a3;
- (void)activateViewController:(id)a3 clientIdentifier:(id)a4;
- (void)applicationContentsDidReset:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidFinishConnecting:(id)a3;
- (void)applicationDidReceiveNotification:(id)a3 clientIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)applicationDidTerminate:(id)a3;
- (void)applicationHandleWatchTaskKeys:(id)a3 reasonForSnapshot:(unint64_t)a4 visibleVCID:(id)a5 barTaskUUID:(id)a6 clientIdentifier:(id)a7;
- (void)applicationIsStillActive;
- (void)applicationWillResignActive:(id)a3;
- (void)controller:(id)a3 presentInterfaceController:(id)a4 initializationContextID:(id)a5;
- (void)controller:(id)a3 presentInterfaceControllers:(id)a4 initializationContextIDs:(id)a5;
- (void)controller:(id)a3 pushInterfaceController:(id)a4 initializationContextID:(id)a5;
- (void)controllerBecomeCurrentPage:(id)a3;
- (void)controllerDismiss:(id)a3;
- (void)controllerDismissAddPassesController:(id)a3;
- (void)controllerDismissTextInputController:(id)a3;
- (void)controllerPop:(id)a3;
- (void)controllerPopToRoot:(id)a3;
- (void)controllerPresentAddPassesController:(id)a3 passes:(id)a4;
- (void)controllerPresentTextInputController:(id)a3 allowedInputMode:(id)a4 suggestions:(id)a5;
- (void)createViewController:(id)a3 className:(id)a4 properties:(id)a5 contextID:(id)a6 info:(id)a7 gestureDescriptions:(id)a8 clientIdentifier:(id)a9;
- (void)dataInterfaceDidBecomeActive:(id)a3;
- (void)dataInterfaceWillResignActive:(id)a3;
- (void)deactivateViewController:(id)a3 clientIdentifier:(id)a4;
- (void)dealloc;
- (void)didFinishHandlingActivity:(id)a3;
- (void)fetchNotificationForNotificationID:(id)a3 completion:(id)a4;
- (void)finishActivatingVCWithID:(id)a3 completion:(id)a4;
- (void)getComplicationData:(id)a3;
- (void)handlePlistDictionary:(id)a3 fromIdentifier:(id)a4;
- (void)handleProtoPlist:(id)a3 fromIdentifier:(id)a4;
- (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 initializationContextIDs:(id)a5;
- (void)layoutDirection:(int64_t)a3;
- (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4;
- (void)openSystemURL:(id)a3;
- (void)performAfterApplicationDidFinishLaunching:(id)a3;
- (void)preferredContentSizeCategory:(id)a3;
- (void)receiveData:(id)a3 fromIdentifier:(id)a4;
- (void)receiveNavigationReply:(id)a3 clientIdentifier:(id)a4;
- (void)receiveProtoData:(id)a3 fromIdentifier:(id)a4;
- (void)recoverFromMissingIntefaceControllerWithID:(id)a3;
- (void)reloadRootControllersWithNames:(id)a3 initializationContextIDs:(id)a4 pageIndex:(int64_t)a5 verticalPaging:(BOOL)a6;
- (void)removeInterfaceControllersForClient:(id)a3;
- (void)removePageControllerAtIndexes:(id)a3;
- (void)removePageInterfaceCreationContextsForIDs:(id)a3;
- (void)replyTimingData:(id)a3;
- (void)replyWithExtensionTimingData:(id)a3;
- (void)rootInterfaceController:(id)a3 performActionWithItemID:(id)a4 forNotificationID:(id)a5 userInfo:(id)a6 clientIdentifier:(id)a7 completionHandler:(id)a8;
- (void)sendCacheRequestMessage:(id)a3;
- (void)sendData:(id)a3 clientIdentifiers:(id)a4;
- (void)sendData:(id)a3 clientIdentifiers:(id)a4 reply:(id)a5;
- (void)sendPlist:(id)a3 clientIdentifiers:(id)a4;
- (void)sendSetViewController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6 clientIdentifiers:(id)a7;
- (void)sendSetViewController:(id)a3 values:(id)a4 clientIdentifiers:(id)a5;
- (void)sendWillActivateReplyForController:(id)a3;
- (void)setActiveComplicationsConnections:(id)a3;
- (void)setAddPassesCompletion:(id)a3;
- (void)setAppClientIdentifier:(id)a3;
- (void)setAudioRecorderControllerCompletion:(id)a3;
- (void)setDataDelegate:(id)a3;
- (void)setExtensionBundle:(id)a3;
- (void)setInterfaceControllers:(id)a3;
- (void)setInterfaceControllersAccessQueue:(id)a3;
- (void)setInterfaceControllersOwners:(id)a3;
- (void)setMediaPlayerControllerCompletion:(id)a3;
- (void)setMissingInterfaceControllers:(id)a3;
- (void)setNavigatingViewControllerID:(id)a3;
- (void)setOpenParentRequests:(id)a3;
- (void)setRootViewControllerID:(id)a3;
- (void)setRunLoopObserver:(id)a3;
- (void)setTextInputCompletion:(id)a3;
- (void)setTextInputSuggestions:(id)a3;
- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 controller:(id)a6;
@end

@implementation SPRemoteInterface

+ (id)sharedRemoteInterface
{
  return (id)__sharedRemoteInterface;
}

+ (id)startRemoteInterface
{
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [a1 startRemoteInterfaceWithBundle:v3];

  return v4;
}

+ (id)startRemoteInterfaceWithBundle:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = wk_extension_loading_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "+[SPRemoteInterface startRemoteInterfaceWithBundle:]";
    __int16 v13 = 1024;
    int v14 = 340;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: startRemoteInterfaceWithBundle:%{public}@", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SPRemoteInterface_startRemoteInterfaceWithBundle___block_invoke;
  block[3] = &unk_264598C20;
  id v10 = v3;
  uint64_t v5 = startRemoteInterfaceWithBundle__onceToken;
  id v6 = v3;
  if (v5 != -1) {
    dispatch_once(&startRemoteInterfaceWithBundle__onceToken, block);
  }
  id v7 = (id)__sharedRemoteInterface;

  return v7;
}

uint64_t __52__SPRemoteInterface_startRemoteInterfaceWithBundle___block_invoke(uint64_t a1)
{
  __sharedRemoteInterface = [[SPRemoteInterface alloc] initWithBundle:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (id)_remoteIdentifier
{
  if (_remoteIdentifier_onceToken != -1) {
    dispatch_once(&_remoteIdentifier_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_remoteIdentifier___remoteIdentifier;

  return v2;
}

void __38__SPRemoteInterface__remoteIdentifier__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 infoDictionary];

  v2 = [v1 objectForKeyedSubscript:@"NSExtension"];
  id v3 = [v2 objectForKeyedSubscript:@"NSExtensionAttributes"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"WKAppBundleIdentifier"];
  uint64_t v5 = (void *)_remoteIdentifier___remoteIdentifier;
  _remoteIdentifier___remoteIdentifier = v4;

  id v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    v9 = "+[SPRemoteInterface _remoteIdentifier]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 371;
    __int16 v12 = 2114;
    uint64_t v13 = _remoteIdentifier___remoteIdentifier;
    _os_log_impl(&dword_2211F3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->ComD Gizmo app identifier %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

  if (!_remoteIdentifier___remoteIdentifier)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__SPRemoteInterface__remoteIdentifier__block_invoke_cold_1();
    }
  }
}

+ (id)cacheIdentifier
{
  return +[SPRemoteInterface _remoteIdentifier];
}

- (SPRemoteInterface)initWithBundle:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SPRemoteInterface;
  id v6 = [(SPRemoteInterface *)&v29 init];
  [v6 _setupSignalHandlers];
  objc_storeStrong((id *)v6 + 16, a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_applicationAccessibilityChanged, @"_AXNotification_GizmoApplicationAccessibilityEnabled", 0, (CFNotificationSuspensionBehavior)0);
  +[SPRemoteInterface _updateAccessibility];
  uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  __int16 v10 = [v5 infoDictionary];
  int v11 = [v10 objectForKeyedSubscript:@"_SPDataDelegate"];
  __int16 v12 = v11;
  if (v11)
  {
    Class v13 = NSClassFromString(v11);
    if (v13)
    {
      Class v14 = v13;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __36__SPRemoteInterface_initWithBundle___block_invoke;
      v25[3] = &unk_264598C48;
      v26 = v12;
      id v27 = v6;
      Class v28 = v14;
      spUtils_dispatchAsyncToMainThread(v25);
    }
  }
  CFRunLoopObserverRef v15 = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)_RunLoopHandler, 0);
  id v16 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v15;

  Main = CFRunLoopGetMain();
  CFRunLoopAddObserver(Main, *((CFRunLoopObserverRef *)v6 + 3), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
  v19 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v18;

  uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
  v21 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v20;

  dispatch_queue_t v22 = dispatch_queue_create("com.apple.watchkit.interfaceControllers", MEMORY[0x263EF83A8]);
  v23 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v22;

  return (SPRemoteInterface *)v6;
}

void __36__SPRemoteInterface_initWithBundle___block_invoke(uint64_t a1)
{
  v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __36__SPRemoteInterface_initWithBundle___block_invoke_cold_1();
  }

  id v3 = objc_alloc_init(*(Class *)(a1 + 48));
  [*(id *)(a1 + 40) setDataDelegate:v3];
}

- (void)dealloc
{
  id v3 = [(SPRemoteInterface *)self runLoopObserver];

  if (v3)
  {
    Main = CFRunLoopGetMain();
    id v5 = [(SPRemoteInterface *)self runLoopObserver];
    CFRunLoopRemoveObserver(Main, v5, (CFRunLoopMode)*MEMORY[0x263EFFE78]);

    [(SPRemoteInterface *)self setRunLoopObserver:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)SPRemoteInterface;
  [(SPRemoteInterface *)&v6 dealloc];
}

+ (void)_updateAccessibility
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"GizmoApplicationAccessibilityEnabled", @"com.apple.Accessibility", 0);
  char v3 = _updateAccessibility___startedAccessibilityServer;
  if ((AppBooleanValue != 0) != _updateAccessibility___startedAccessibilityServer)
  {
    int v4 = AppBooleanValue;
    __41__SPRemoteInterface__updateAccessibility__block_invoke();
    if (v4)
    {
      if (v3)
      {
        if (objc_opt_respondsToSelector())
        {
          id v5 = __41__SPRemoteInterface__updateAccessibility__block_invoke();
          [v5 _accessibilityReenabled];
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        [__41__SPRemoteInterface__updateAccessibility__block_invoke() _accessibilityStartServer];
        _updateAccessibility___startedAccessibilityServer = 1;
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      id v6 = __41__SPRemoteInterface__updateAccessibility__block_invoke();
      [v6 _accessibilityStopServer];
    }
  }
}

id __41__SPRemoteInterface__updateAccessibility__block_invoke()
{
  if (__performAfterSendSetViewControllers_block_invoke_onceToken != -1) {
    dispatch_once(&__performAfterSendSetViewControllers_block_invoke_onceToken, &__block_literal_global_403);
  }
  v0 = (void *)__performAfterSendSetViewControllers_block_invoke___loaderClass;

  return v0;
}

Class __41__SPRemoteInterface__updateAccessibility__block_invoke_2()
{
  v0 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/UIAccessibility.framework"];
  [v0 load];

  Class result = NSClassFromString(&cfstr_Uiaccessibilit.isa);
  __performAfterSendSetViewControllers_block_invoke___loaderClass = (uint64_t)result;
  return result;
}

- (void)_setupSignalHandlers
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SPRemoteInterface__setupSignalHandlers__block_invoke;
  v4[3] = &unk_264598C20;
  v4[4] = self;
  uint64_t v2 = [(SPRemoteInterface *)self _setupSignal:31 handler:v4];
  char v3 = (void *)_setupSignalHandlers__sigUsr2Source;
  _setupSignalHandlers__sigUsr2Source = v2;
}

void __41__SPRemoteInterface__setupSignalHandlers__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 551;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ======== Companion App Extension", (uint8_t *)&v7, 0x12u);
  }

  char v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = +[SPRemoteInterface _remoteIdentifier];
    int v7 = 136446722;
    uint64_t v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 552;
    __int16 v11 = 2114;
    __int16 v12 = v4;
    _os_log_impl(&dword_2211F3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Remote Identifier: %{public}@", (uint8_t *)&v7, 0x1Cu);
  }
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 553;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -------- Interface Controllers", (uint8_t *)&v7, 0x12u);
  }

  [*(id *)(a1 + 32) _dumpInterfaceDictionary];
  id v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 555;
    _os_log_impl(&dword_2211F3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: --------", (uint8_t *)&v7, 0x12u);
  }
}

- (id)_setupSignal:(int)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_source_create(MEMORY[0x263EF83F0], a3, 0, MEMORY[0x263EF83A0]);
  if (v6)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__SPRemoteInterface__setupSignal_handler___block_invoke;
    handler[3] = &unk_264598C70;
    int v10 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    signal(a3, (void (__cdecl *)(int))1);
    int v7 = v10;
  }
  else
  {
    int v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface _setupSignal:handler:]();
    }
  }

  return v6;
}

uint64_t __42__SPRemoteInterface__setupSignal_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_host
{
  uint64_t v2 = [MEMORY[0x263F5E720] defaultService];
  char v3 = [v2 hostPrincipalForPlugInNamed:0];

  return v3;
}

- (void)sendData:(id)a3 clientIdentifiers:(id)a4
{
}

- (void)sendData:(id)a3 clientIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  __int16 v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SPRemoteInterface sendData:clientIdentifiers:reply:]();
  }

  __int16 v12 = [(SPRemoteInterface *)self _host];
  if (v12)
  {
    uint64_t v13 = +[SPRemoteInterface _remoteIdentifier];
    if (v10) {
      [v12 sendData:v8 identifier:v13 clientIdentifiers:v9 reply:v10];
    }
    else {
      [v12 sendData:v8 identifier:v13 clientIdentifiers:v9];
    }
  }
  else
  {
    uint64_t v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface sendData:clientIdentifiers:reply:]();
    }
  }
}

- (void)sendPlist:(id)a3 clientIdentifiers:(id)a4
{
  id v6 = a4;
  int v7 = +[SPProtoSerializer spPlistWithDictionary:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 data];
    if (v9)
    {
      [(SPRemoteInterface *)self sendData:v9 clientIdentifiers:v6];
    }
    else
    {
      id v10 = wk_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface sendPlist:clientIdentifiers:]();
      }
    }
  }
  else
  {
    id v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface sendPlist:clientIdentifiers:]();
    }
  }
}

- (void)sendSetViewController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6 clientIdentifiers:(id)a7
{
  v14[3] = *MEMORY[0x263EF8340];
  v13[0] = @"V";
  v13[1] = @"k";
  v14[0] = a3;
  v14[1] = @"#didActivate";
  v13[2] = @"v";
  v14[2] = MEMORY[0x263EFFA88];
  id v9 = NSDictionary;
  id v10 = a7;
  id v11 = a3;
  __int16 v12 = [v9 dictionaryWithObjects:v14 forKeys:v13 count:3];

  [(SPRemoteInterface *)self sendPlist:v12 clientIdentifiers:v10];
}

- (void)sendSetViewController:(id)a3 values:(id)a4 clientIdentifiers:(id)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"V";
  v13[1] = @"S";
  v14[0] = a3;
  v14[1] = a4;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  __int16 v12 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(SPRemoteInterface *)self sendPlist:v12 clientIdentifiers:v9];
}

- (void)_performAfterSendSetViewControllers:(id)a3
{
  uint64_t v3 = _performAfterSendSetViewControllers__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_performAfterSendSetViewControllers__onceToken, &__block_literal_global_420);
  }
  id v5 = (void *)__performAfterSendSetViewControllers;
  id v7 = (id)[v4 copy];

  id v6 = (void *)MEMORY[0x223C7C250](v7);
  [v5 addObject:v6];
}

uint64_t __57__SPRemoteInterface__performAfterSendSetViewControllers___block_invoke()
{
  __performAfterSendSetViewControllers = [MEMORY[0x263EFF980] array];

  return MEMORY[0x270F9A758]();
}

- (void)_requestTimingData:(id)a3
{
  id v4 = a3;
  id v5 = [(SPRemoteInterface *)self _host];
  if (v5)
  {
    id v6 = +[SPRemoteInterface _remoteIdentifier];
    [v5 requestTimingData:v6 timingMetaData:v4];
  }
  else
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface _requestTimingData:]();
    }
  }
}

- (void)replyWithExtensionTimingData:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v16 = [v3 objectForKeyedSubscript:@"V"];
  id v4 = [v3 objectForKeyedSubscript:@".sex"];
  id v5 = [v3 objectForKeyedSubscript:@".eex"];
  id v6 = [v3 objectForKeyedSubscript:@".idx"];
  id v7 = [v3 objectForKeyedSubscript:@".rs"];
  uint64_t v8 = [v7 integerValue];

  id v9 = [v3 objectForKeyedSubscript:@".bex"];

  v23[0] = @".sex";
  v23[1] = @".eex";
  v24[0] = v4;
  v24[1] = v5;
  v23[2] = @".bex";
  v23[3] = @".idx";
  v24[2] = v9;
  v24[3] = v6;
  id v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v21[0] = @"V";
  v21[1] = @"k";
  v22[0] = v16;
  v22[1] = @".PolDE";
  v21[2] = @"v";
  v22[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  __int16 v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v16];
  dispatch_time_t v13 = dispatch_time(0, 1000000 * (v8 / 30) + 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SPRemoteInterface_replyWithExtensionTimingData___block_invoke;
  block[3] = &unk_264598C98;
  void block[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  dispatch_after(v13, MEMORY[0x263EF83A0], block);
}

void __50__SPRemoteInterface_replyWithExtensionTimingData___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 sendPlist:v2 clientIdentifiers:v3];
}

- (void)replyTimingData:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v16 = [v3 objectForKeyedSubscript:@"V"];
  id v4 = [v3 objectForKeyedSubscript:@".scd"];
  id v5 = [v3 objectForKeyedSubscript:@".ecd"];
  id v6 = [v3 objectForKeyedSubscript:@".idx"];
  id v7 = [v3 objectForKeyedSubscript:@".rs"];
  uint64_t v8 = [v7 integerValue];

  id v9 = [v3 objectForKeyedSubscript:@".bcd"];

  v23[0] = @".scd";
  v23[1] = @".ecd";
  v24[0] = v4;
  v24[1] = v5;
  v23[2] = @".bcd";
  v23[3] = @".idx";
  v24[2] = v9;
  v24[3] = v6;
  id v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v21[0] = @"V";
  v21[1] = @"k";
  v22[0] = v16;
  v22[1] = @".PolD";
  v21[2] = @"v";
  v22[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  __int16 v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v16];
  dispatch_time_t v13 = dispatch_time(0, 1000000 * (v8 / 30) + 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SPRemoteInterface_replyTimingData___block_invoke;
  block[3] = &unk_264598C98;
  void block[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  dispatch_after(v13, MEMORY[0x263EF83A0], block);
}

void __37__SPRemoteInterface_replyTimingData___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 sendPlist:v2 clientIdentifiers:v3];
}

- (void)fetchNotificationForNotificationID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v21 = "-[SPRemoteInterface fetchNotificationForNotificationID:completion:]";
    __int16 v22 = 1024;
    int v23 = 1024;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_2211F3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->ComD, notificationID=%{public}@", buf, 0x1Cu);
  }

  id v9 = [(SPRemoteInterface *)self _host];
  if (v9)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke;
    v16[3] = &unk_264598CC0;
    id v17 = v7;
    [v9 fetchNotificationForNotificationID:v6 completion:v16];
    id v10 = v17;
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface fetchNotificationForNotificationID:completion:]();
    }

    __int16 v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    id v10 = [MEMORY[0x263F086E0] mainBundle];
    dispatch_time_t v13 = [v10 localizedStringForKey:@"SPErrorHostPrincipalForPluginNotFoundMessage" value:&stru_26D3103D0 table:0];
    id v19 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v15 = [v12 errorWithDomain:@"com.apple.watchkit.errors" code:8 userInfo:v14];
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v15);
  }
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    dispatch_time_t v13 = (void *)MEMORY[0x263F08928];
    getUNNotificationClass();
    id v21 = 0;
    id v14 = [v13 unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v21];
    id v15 = v21;
    if (!v14)
    {
      id v16 = wk_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_2();
      }

      id v14 = 0;
    }
    if (v10) {
      goto LABEL_7;
    }
LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v18 = v15;
    goto LABEL_14;
  }
  id v14 = 0;
  id v15 = 0;
  if (!v10) {
    goto LABEL_13;
  }
LABEL_7:
  id v20 = v15;
  id v17 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v20];
  id v18 = v20;

  if (!v17)
  {
    id v19 = wk_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_14:
}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 controller:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wk_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    uint64_t v26 = "-[SPRemoteInterface updateUserActivity:userInfo:webpageURL:controller:]";
    __int16 v27 = 1024;
    int v28 = 1056;
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2113;
    id v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    _os_log_impl(&dword_2211F3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:<-Plugin, activity type: %{public}@, userInfo: %{private}@, webpageURL:%{public}@", buf, 0x30u);
  }

  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  id v16 = v15;
  if (v10) {
    [v15 setObject:v10 forKeyedSubscript:@"uat"];
  }
  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"uai"];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:@"uau"];
  }
  id v17 = [(SPRemoteInterface *)self _interfaceControllerID:v13];
  id v18 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v17];
  if (v18)
  {
    id v19 = ArchiveWithArchiverDelegate(v16);
    int v23 = @"ua";
    __int16 v24 = v19;
    id v20 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    __int16 v22 = v18;
    id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [(SPRemoteInterface *)self sendPlist:v20 clientIdentifiers:v21];
  }
  else
  {
    id v20 = wk_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface updateUserActivity:userInfo:webpageURL:controller:]();
    }
  }
}

- (void)sendCacheRequestMessage:(id)a3
{
  id v4 = +[SPProtoSerializer dataWithObject:a3];
  if (v4)
  {
    id v5 = [(SPRemoteInterface *)self _host];
    if (v5)
    {
      id v6 = +[SPRemoteInterface _remoteIdentifier];
      [v5 sendCacheRequest:v4 identifier:v6];
    }
    else
    {
      id v6 = wk_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface sendCacheRequestMessage:]();
      }
    }
  }
  else
  {
    id v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface sendCacheRequestMessage:]();
    }
  }
}

+ (id)SerializablePropertyValue:(id)a3
{
  return SerializablePropertyValue(a3);
}

+ (void)handleEvent:(id)a3
{
}

+ (void)_setupStorageForController:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__recordedValues;
  id v23 = v3;
  if (!__recordedValues)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = (void *)__recordedValues;
    __recordedValues = v5;

    id v3 = v23;
    id v4 = (void *)__recordedValues;
  }
  id v7 = [v4 objectForKeyedSubscript:v3];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    [(id)__recordedValues setObject:v8 forKeyedSubscript:v23];
  }
  id v9 = (void *)__cachedRunLoopValues;
  if (!__cachedRunLoopValues)
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    id v11 = (void *)__cachedRunLoopValues;
    __cachedRunLoopValues = v10;

    id v9 = (void *)__cachedRunLoopValues;
  }
  id v12 = [v9 objectForKeyedSubscript:v23];

  if (!v12)
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)__cachedRunLoopValues setObject:v13 forKeyedSubscript:v23];
  }
  id v14 = (void *)__cachedActivationValues;
  if (!__cachedActivationValues)
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    id v16 = (void *)__cachedActivationValues;
    __cachedActivationValues = v15;

    id v14 = (void *)__cachedActivationValues;
  }
  id v17 = [v14 objectForKeyedSubscript:v23];

  if (!v17)
  {
    id v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)__cachedActivationValues setObject:v18 forKeyedSubscript:v23];
  }
  id v19 = (void *)__controllerActive;
  if (!__controllerActive)
  {
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    id v21 = (void *)__controllerActive;
    __controllerActive = v20;

    id v19 = (void *)__controllerActive;
  }
  __int16 v22 = [v19 objectForKeyedSubscript:v23];

  if (!v22) {
    [(id)__controllerActive setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v23];
  }
}

+ (void)clearStorageForController:(id)a3
{
  id v3 = (void *)__cachedActivationValues;
  id v4 = a3;
  [v3 removeObjectForKey:v4];
  [(id)__controllerActive removeObjectForKey:v4];
}

+ (void)setControllerActive:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__controllerActive;
  id v7 = v3;
  if (!__controllerActive)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = (void *)__controllerActive;
    __controllerActive = v5;

    id v3 = v7;
    id v4 = (void *)__controllerActive;
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v3];
}

+ (void)setControllerInactive:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__controllerActive;
  id v7 = v3;
  if (!__controllerActive)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = (void *)__controllerActive;
    __controllerActive = v5;

    id v3 = v7;
    id v4 = (void *)__controllerActive;
  }
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v3];
}

+ (void)setController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SPRemoteInterface_setController_key_property_value___block_invoke;
  v17[3] = &unk_264598CE8;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  spUtils_dispatchAsyncToMainThread(v17);
}

void __54__SPRemoteInterface_setController_key_property_value___block_invoke(uint64_t a1)
{
  v77[2] = *MEMORY[0x263EF8340];
  +[SPRemoteInterface _setupStorageForController:*(void *)(a1 + 32)];
  uint64_t v2 = [(id)__recordedValues objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v3 = [(id)__cachedRunLoopValues objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = [(id)__cachedActivationValues objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (![*(id *)(a1 + 40) isEqualToString:@".null"] || !objc_msgSend(v2, "count"))
  {
    uint64_t v5 = (__CFString *)*(id *)(a1 + 48);
    int v58 = [(__CFString *)v5 isEqualToString:@"#value"];
    if (v58)
    {

      uint64_t v5 = 0;
    }
    id v6 = [(id)__controllerActive objectForKeyedSubscript:*(void *)(a1 + 32)];
    char v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      +[SPRemoteInterface _logDuplicate:@"Controller is not active." controller:*(void *)(a1 + 32) key:*(void *)(a1 + 40) property:v5 value:*(void *)(a1 + 56)];
LABEL_63:

      goto LABEL_64;
    }
    if (*(void *)(a1 + 56) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v13 = SerializablePropertyValue(*(void **)(a1 + 56));
      uint64_t v14 = [(__CFString *)v5 length];
      uint64_t v15 = *(void *)(a1 + 40);
      if (v14)
      {
        v72[0] = @"k";
        v72[1] = @"p";
        v73[0] = v15;
        v73[1] = v5;
        v72[2] = @"v";
        v73[2] = v13;
        id v16 = NSDictionary;
        id v17 = v73;
        id v18 = v72;
        uint64_t v19 = 3;
      }
      else
      {
        v70[0] = @"k";
        v70[1] = @"v";
        v71[0] = v15;
        v71[1] = v13;
        id v16 = NSDictionary;
        id v17 = v71;
        id v18 = v70;
        uint64_t v19 = 2;
      }
      v59 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    }
    else
    {
      if ([(__CFString *)v5 length])
      {
        uint64_t v8 = *(void *)(a1 + 40);
        v76[0] = @"k";
        v76[1] = @"p";
        v77[0] = v8;
        v77[1] = v5;
        id v9 = NSDictionary;
        id v10 = v77;
        id v11 = (__CFString **)v76;
        uint64_t v12 = 2;
      }
      else
      {
        v74 = @"k";
        uint64_t v75 = *(void *)(a1 + 40);
        id v9 = NSDictionary;
        id v10 = &v75;
        id v11 = &v74;
        uint64_t v12 = 1;
      }
      v59 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
      id v13 = 0;
    }
    v57 = v13;
    if (([(__CFString *)v5 isEqualToString:@"rowTypes"] & 1) != 0
      || ([(__CFString *)v5 isEqualToString:@".insert"] & 1) != 0
      || [(__CFString *)v5 isEqualToString:@".remove"])
    {
      v55 = v5;
      v56 = v2;
      id v20 = [v4 allKeys];
      id v21 = (void *)[v20 copy];

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v65 != v25) {
              objc_enumerationMutation(v22);
            }
            __int16 v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            int v28 = [v27 pathComponents];
            unint64_t v29 = [v28 count];

            if (v29 >= 2) {
              [v4 removeObjectForKey:v27];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v24);
      }

      id v30 = [v3 allKeys];
      __int16 v31 = (void *)[v30 copy];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v61 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            v38 = [v37 pathComponents];
            unint64_t v39 = [v38 count];

            if (v39 >= 2) {
              [v3 removeObjectForKey:v37];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v60 objects:v68 count:16];
        }
        while (v34);
      }

      uint64_t v5 = v55;
      uint64_t v2 = v56;
      id v13 = v57;
    }
    if (v5 && ![(__CFString *)v5 isEqualToString:&stru_26D3103D0]
      || ([*(id *)(a1 + 40) isEqualToString:@"#item"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqualToString:@".null"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqualToString:@"#animateBegin"] & 1) != 0)
    {
      char v40 = 1;
    }
    else
    {
      char v40 = v58 | [*(id *)(a1 + 40) isEqualToString:@"#animateCommit"];
    }
    if (v5) {
      v41 = v5;
    }
    else {
      v41 = &stru_26D3103D0;
    }
    v42 = [NSString stringWithFormat:@"%@|%@", *(void *)(a1 + 40), v41];
    if (v40)
    {
      v43 = 0;
      goto LABEL_50;
    }
    v47 = [v3 objectForKey:v42];
    if (v47)
    {
      v43 = v47;
      objc_msgSend(v2, "replaceObjectAtIndex:withObject:", objc_msgSend(v47, "unsignedIntegerValue"), v59);
      v48 = SPRemoteInterface;
      uint64_t v49 = *(void *)(a1 + 32);
      uint64_t v50 = *(void *)(a1 + 40);
      v51 = *(void **)(a1 + 56);
      v52 = @"Duplicate call within run loop.";
LABEL_55:
      [(__objc2_class *)v48 _logDuplicate:v52 controller:v49 key:v50 property:v5 value:v51];
LABEL_62:

      goto LABEL_63;
    }
    v43 = [v4 objectForKey:v42];
    unint64_t v53 = 0x264598000uLL;
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_opt_class(), unint64_t v53 = 0x264598000, (objc_opt_isKindOfClass() & 1) == 0))
      {
        if ([v43 isEqual:*(void *)(a1 + 56)])
        {
          v51 = *(void **)(a1 + 56);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || *(void *)(a1 + 56))
          {
            id v13 = v57;
            goto LABEL_50;
          }
          v51 = 0;
        }
        id v13 = v57;
LABEL_68:
        v48 = *(__objc2_class **)(v53 + 1848);
        uint64_t v49 = *(void *)(a1 + 32);
        uint64_t v50 = *(void *)(a1 + 40);
        v52 = @"Duplicate call.";
        goto LABEL_55;
      }
      v51 = v43;
      id v13 = v57;
      if (v43 == *(void **)(a1 + 56)) {
        goto LABEL_68;
      }
    }
LABEL_50:
    [v2 addObject:v59];
    uint64_t v44 = [v2 count];
    v45 = [NSNumber numberWithUnsignedInteger:v44 - 1];
    [v3 setObject:v45 forKey:v42];

    if ((v40 & 1) == 0)
    {
      uint64_t v46 = *(void *)(a1 + 56);
      if (v46)
      {
        [v4 setObject:v46 forKey:v42];
      }
      else
      {
        v54 = [MEMORY[0x263EFF9D0] null];
        [v4 setObject:v54 forKey:v42];
      }
    }
    goto LABEL_62;
  }
LABEL_64:
}

+ (void)_logDuplicate:(id)a3 controller:(id)a4 key:(id)a5 property:(id)a6 value:(id)a7
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(id)__sharedRemoteInterface _interfaceControllerWithID:a4];
  id v16 = [NSString stringWithFormat:@"%@", v14];
  if ((unint64_t)[v16 length] >= 0x21)
  {
    id v17 = NSString;
    id v18 = [v16 substringToIndex:32];
    uint64_t v19 = [v17 stringWithFormat:@"%@...<truncated>", v18];

    id v16 = (void *)v19;
  }
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  NSLog(&cfstr_WatchkitDiscar.isa, v11, v20, v12, v13, v16, v21);
  id v22 = wk_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class();
    id v24 = v23;
    *(_DWORD *)buf = 136448003;
    __int16 v27 = "+[SPRemoteInterface _logDuplicate:controller:key:property:value:]";
    __int16 v28 = 1024;
    int v29 = 1456;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v23;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v13;
    __int16 v38 = 2113;
    unint64_t v39 = v16;
    __int16 v40 = 2114;
    id v41 = (id)objc_opt_class();
    id v25 = v41;
    _os_log_impl(&dword_2211F3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: WatchKit: %{public}@ Discarding call for %{public}@ key=%{public}@ property=%{public}@ value=%{private}@ value class=%{public}@", buf, 0x4Eu);
  }
}

+ (void)controller:(id)a3 pushInterfaceController:(id)a4 context:(id)a5
{
  char v7 = (void *)__sharedRemoteInterface;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 storeInterfaceCreationContext:a5];
  [(id)__sharedRemoteInterface controller:v9 pushInterfaceController:v8 initializationContextID:v10];
}

+ (void)controllerPop:(id)a3
{
}

+ (void)controllerPopToRoot:(id)a3
{
}

+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x263EFF980] array];
  unint64_t v8 = [v6 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v8 > 1) {
          objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", v14, (void)v18);
        }
        else {
        uint64_t v15 = [(id)__sharedRemoteInterface storeInterfaceCreationContext:v14];
        }
        objc_msgSend(v7, "addObject:", v15, (void)v18);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v16 = (void *)__sharedRemoteInterface;
  if ([v7 count]) {
    id v17 = v7;
  }
  else {
    id v17 = 0;
  }
  objc_msgSend(v16, "reloadRootControllersWithNames:initializationContextIDs:pageIndex:verticalPaging:", v5, v17, 0, 0, (void)v18);
}

+ (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", *(void *)(*((void *)&v19 + 1) + 8 * v15), (void)v19);
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = (void *)__sharedRemoteInterface;
  if ([v10 count]) {
    long long v18 = v10;
  }
  else {
    long long v18 = 0;
  }
  objc_msgSend(v17, "insertPageControllerAtIndexes:withNames:initializationContextIDs:", v7, v8, v18, (void)v19);
}

+ (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
}

+ (void)removePageControllerAtIndexes:(id)a3
{
}

+ (void)controllerBecomeCurrentPage:(id)a3
{
}

+ (void)controller:(id)a3 presentInterfaceController:(id)a4 context:(id)a5
{
  id v7 = (void *)__sharedRemoteInterface;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 storeInterfaceCreationContext:a5];
  [v7 controller:v9 presentInterfaceController:v8 initializationContextID:v10];
}

+ (void)controller:(id)a3 presentInterfaceControllers:(id)a4 contexts:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF980] array];
  unint64_t v11 = [v9 count];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v11 > 1) {
          objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", v17, (void)v21);
        }
        else {
        long long v18 = [(id)__sharedRemoteInterface storeInterfaceCreationContext:v17];
        }
        objc_msgSend(v10, "addObject:", v18, (void)v21);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  long long v19 = (void *)__sharedRemoteInterface;
  if ([v10 count]) {
    long long v20 = v10;
  }
  else {
    long long v20 = 0;
  }
  objc_msgSend(v19, "controller:presentInterfaceControllers:initializationContextIDs:", v7, v8, v20, (void)v21);
}

+ (void)controllerDismiss:(id)a3
{
}

+ (void)controller:(id)a3 presentTextInputControllerWithSuggestions:(id)a4 allowedInputMode:(id)a5 completion:(id)a6
{
  id v9 = (void *)__sharedRemoteInterface;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [v9 setTextInputCompletion:a6];
  [(id)__sharedRemoteInterface setTextInputSuggestions:0];
  [(id)__sharedRemoteInterface controllerPresentTextInputController:v12 allowedInputMode:v10 suggestions:v11];
}

+ (void)controller:(id)a3 presentTextInputControllerWithSuggestionsForLanguage:(id)a4 allowedInputMode:(id)a5 completion:(id)a6
{
  id v9 = (void *)__sharedRemoteInterface;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [v9 setTextInputCompletion:a6];
  [(id)__sharedRemoteInterface setTextInputSuggestions:v11];

  [(id)__sharedRemoteInterface controllerPresentTextInputController:v12 allowedInputMode:v10 suggestions:0];
}

+ (void)controllerDismissTextInputController:(id)a3
{
}

+ (void)openSystemURL:(id)a3
{
}

+ (void)controller:(id)a3 presentAddPassesControllerWithPasses:(id)a4 completion:(id)a5
{
  id v7 = (void *)__sharedRemoteInterface;
  id v8 = a5;
  [v7 controllerPresentAddPassesController:a3 passes:a4];
  [(id)__sharedRemoteInterface setAddPassesCompletion:v8];
}

+ (void)controllerDismissAddPassesController:(id)a3
{
}

+ (void)didFinishHandlingActivity:(id)a3
{
}

+ (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 interfaceController:(id)a6
{
}

+ (void)sendCacheRequest:(id)a3
{
  id v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[SPRemoteInterface sendCacheRequest:]();
  }
}

+ (void)sendCacheRequestMessage:(id)a3
{
}

+ (BOOL)sendDataToApp:(id)a3
{
  return [a1 sendDataToApp:a3 reply:0];
}

+ (BOOL)sendDataToApp:(id)a3 reply:(id)a4
{
  return [(id)__sharedRemoteInterface _sendDataToApp:a3 reply:a4];
}

- (BOOL)_sendDataToApp:(id)a3 reply:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    id v9 = appClientIdentifier;
  }
  else
  {
    id v9 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:self->_rootViewControllerID];
    if (!v9)
    {
LABEL_6:
      BOOL v10 = 0;
      goto LABEL_7;
    }
  }
  if (![v6 length]) {
    goto LABEL_6;
  }
  v13[0] = v9;
  BOOL v10 = 1;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(SPRemoteInterface *)self sendData:v6 clientIdentifiers:v11 reply:v7];

LABEL_7:
  return v10;
}

+ (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4
{
}

- (id)storeInterfaceCreationContext:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (!__interfaceCreationContexts)
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
      id v5 = (void *)__interfaceCreationContexts;
      __interfaceCreationContexts = v4;
    }
    id v6 = [NSNumber numberWithInteger:storeInterfaceCreationContext____contextCounter];
    [(id)__interfaceCreationContexts setObject:v3 forKey:v6];
    ++storeInterfaceCreationContext____contextCounter;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)interfaceCreationContextForID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [(id)__interfaceCreationContexts objectForKeyedSubscript:v3];
    [(id)__interfaceCreationContexts removeObjectForKey:v3];
    uint64_t v5 = [v3 integerValue];
    uint64_t v6 = v5 - 1;
    if (v5 >= 1)
    {
      while (1)
      {
        id v7 = [NSNumber numberWithInteger:v6];
        id v8 = [(id)__interfaceCreationContexts objectForKeyedSubscript:v7];

        if (!v8) {
          break;
        }
        [(id)__interfaceCreationContexts removeObjectForKey:v7];

        if (--v6 == -1) {
          goto LABEL_8;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_8:

  return v4;
}

- (id)storePageInterfaceCreationContext:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (!__pageInterfaceCreationContexts)
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v5 = (void *)__pageInterfaceCreationContexts;
      __pageInterfaceCreationContexts = v4;
    }
    uint64_t v6 = [NSNumber numberWithInteger:storePageInterfaceCreationContext____pageContextCounter];
    [(id)__pageInterfaceCreationContexts setObject:v3 forKey:v6];
    --storePageInterfaceCreationContext____pageContextCounter;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pageInterfaceCreationContextForID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend((id)__pageInterfaceCreationContexts, "objectForKeyedSubscript:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)removePageInterfaceCreationContextsForIDs:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SPRemoteInterface_removePageInterfaceCreationContextsForIDs___block_invoke;
  v5[3] = &unk_264598C20;
  id v6 = v3;
  id v4 = v3;
  spUtils_dispatchSyncToMainThread(v5);
}

uint64_t __63__SPRemoteInterface_removePageInterfaceCreationContextsForIDs___block_invoke(uint64_t a1)
{
  return [(id)__pageInterfaceCreationContexts removeObjectsForKeys:*(void *)(a1 + 32)];
}

- (void)controller:(id)a3 pushInterfaceController:(id)a4 initializationContextID:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SPRemoteInterface *)self _interfaceControllerID:v8];
  id v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v11];
  if (v12)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v11];
    v17[0] = @"V";
    v17[1] = @"n";
    v18[0] = v11;
    v18[1] = v9;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v14 = [v13 mutableCopy];

    if (v10) {
      [v14 setObject:v10 forKey:@"X"];
    }
    id v16 = v12;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(SPRemoteInterface *)self sendPlist:v14 clientIdentifiers:v15];
  }
  else
  {
    uint64_t v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controller:pushInterfaceController:initializationContextID:]();
    }
  }
}

- (void)controllerPop:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  id v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v5];
    v10[0] = @"V";
    v10[1] = @"n";
    v11[0] = v5;
    v11[1] = @".pop";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerPop:]();
    }
  }
}

- (void)controllerPopToRoot:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  id v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v5];
    v10[0] = @"V";
    v10[1] = @"n";
    v11[0] = v5;
    v11[1] = @".popR";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerPopToRoot:]();
    }
  }
}

- (void)reloadRootControllersWithNames:(id)a3 initializationContextIDs:(id)a4 pageIndex:(int64_t)a5 verticalPaging:(BOOL)a6
{
  BOOL v6 = a6;
  v31[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID) {
    rootViewControllerID = &stru_26D3103D0;
  }
  uint64_t v13 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    uint64_t v15 = appClientIdentifier;
  }
  else
  {
    uint64_t v15 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:self->_rootViewControllerID];
    if (!v15) {
      goto LABEL_9;
    }
  }
  v30[0] = @"V";
  v30[1] = @"rv";
  v31[0] = v13;
  v31[1] = @"rvr";
  v31[2] = v10;
  v30[2] = @"rvna";
  v30[3] = @"rvpidx";
  id v16 = [NSNumber numberWithInteger:a5];
  v31[3] = v16;
  v30[4] = @"rvv";
  uint64_t v17 = [NSNumber numberWithBool:v6];
  v31[4] = v17;
  long long v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:5];
  long long v19 = (void *)[v18 mutableCopy];

  if (v11) {
    [v19 setObject:v11 forKey:@"X"];
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __102__SPRemoteInterface_reloadRootControllersWithNames_initializationContextIDs_pageIndex_verticalPaging___block_invoke;
  v27[3] = &unk_264598C98;
  v27[4] = self;
  id v28 = v19;
  int v29 = v15;
  long long v20 = v15;
  id v21 = v19;
  long long v22 = (void (**)(void, void, void, void, void))MEMORY[0x223C7C250](v27);
  v22[2](v22, v23, v24, v25, v26);

LABEL_9:
}

void __102__SPRemoteInterface_reloadRootControllersWithNames_initializationContextIDs_pageIndex_verticalPaging___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 sendPlist:v2 clientIdentifiers:v3];
}

- (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 initializationContextIDs:(id)a5
{
  v20[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID) {
    rootViewControllerID = &stru_26D3103D0;
  }
  id v12 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    uint64_t v14 = appClientIdentifier;
  }
  else
  {
    uint64_t v14 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:self->_rootViewControllerID];
    if (!v14) {
      goto LABEL_9;
    }
  }
  v19[0] = @"V";
  v19[1] = @"rv";
  v20[0] = v12;
  v20[1] = @"rvi";
  v19[2] = @"rvna";
  v19[3] = @"rvidx";
  v20[2] = v9;
  v20[3] = v8;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  id v16 = (void *)[v15 mutableCopy];

  if (v10) {
    [v16 setObject:v10 forKey:@"X"];
  }
  long long v18 = v14;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [(SPRemoteInterface *)self sendPlist:v16 clientIdentifiers:v17];

LABEL_9:
}

- (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID) {
    rootViewControllerID = &stru_26D3103D0;
  }
  id v8 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    id v10 = appClientIdentifier;
LABEL_6:
    v18[0] = @"V";
    v18[1] = @"rv";
    v19[0] = v8;
    v19[1] = @"rvm";
    v18[2] = @"rvidx";
    id v11 = [NSNumber numberWithInteger:a3];
    v17[0] = v11;
    id v12 = [NSNumber numberWithInteger:a4];
    v17[1] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v19[2] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v16 = v10;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(SPRemoteInterface *)self sendPlist:v14 clientIdentifiers:v15];

    goto LABEL_7;
  }
  id v10 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:self->_rootViewControllerID];
  if (v10) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)removePageControllerAtIndexes:(id)a3
{
  void v13[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID) {
    rootViewControllerID = &stru_26D3103D0;
  }
  BOOL v6 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    id v8 = appClientIdentifier;
LABEL_6:
    v12[0] = @"V";
    v12[1] = @"rv";
    v13[0] = v6;
    v13[1] = @"rvd";
    v12[2] = @"rvidx";
    void v13[2] = v4;
    id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    id v11 = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [(SPRemoteInterface *)self sendPlist:v9 clientIdentifiers:v10];

    goto LABEL_7;
  }
  id v8 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:self->_rootViewControllerID];
  if (v8) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)controllerBecomeCurrentPage:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  BOOL v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    v17[0] = @"V";
    v17[1] = @"n";
    v18[0] = v5;
    v18[1] = @".page";
    id v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__SPRemoteInterface_controllerBecomeCurrentPage___block_invoke;
    void v14[3] = &unk_264598C98;
    void v14[4] = self;
    id v15 = v7;
    id v16 = v6;
    id v8 = v7;
    id v9 = (void (**)(void, void, void, void, void))MEMORY[0x223C7C250](v14);
    v9[2](v9, v10, v11, v12, v13);
  }
  else
  {
    id v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerBecomeCurrentPage:]();
    }
  }
}

void __49__SPRemoteInterface_controllerBecomeCurrentPage___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 sendPlist:v2 clientIdentifiers:v3];
}

- (void)controller:(id)a3 presentInterfaceController:(id)a4 initializationContextID:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SPRemoteInterface *)self _interfaceControllerID:v8];
  uint64_t v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v11];
  if (v12)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v11];
    v17[0] = @"V";
    v17[1] = @"nm";
    v18[0] = v11;
    v18[1] = v9;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v14 = [v13 mutableCopy];

    if (v10) {
      [v14 setObject:v10 forKey:@"X"];
    }
    id v16 = v12;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(SPRemoteInterface *)self sendPlist:v14 clientIdentifiers:v15];
  }
  else
  {
    uint64_t v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controller:presentInterfaceController:initializationContextID:]();
    }
  }
}

- (void)controller:(id)a3 presentInterfaceControllers:(id)a4 initializationContextIDs:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SPRemoteInterface *)self _interfaceControllerID:v8];
  uint64_t v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v11];
  if (v12)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v11];
    v17[0] = @"V";
    v17[1] = @"nm";
    v18[0] = v11;
    v18[1] = v9;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v14 = [v13 mutableCopy];

    if (v10) {
      [v14 setObject:v10 forKey:@"X"];
    }
    id v16 = v12;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(SPRemoteInterface *)self sendPlist:v14 clientIdentifiers:v15];
  }
  else
  {
    uint64_t v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controller:presentInterfaceControllers:initializationContextIDs:]();
    }
  }
}

- (void)controllerDismiss:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  BOOL v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:v5];
    v10[0] = @"V";
    v10[1] = @"nm";
    v11[0] = v5;
    v11[1] = @".pop";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerDismiss:]();
    }
  }
}

- (void)controllerPresentTextInputController:(id)a3 allowedInputMode:(id)a4 suggestions:(id)a5
{
  v20[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SPRemoteInterface *)self _interfaceControllerID:v8];
  uint64_t v12 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v11];
  if (v12)
  {
    if ([v10 count])
    {
      v19[0] = @"V";
      v19[1] = @"nm";
      v20[0] = v11;
      v20[1] = @"ti";
      v19[2] = @"tim";
      v19[3] = @"tI";
      v20[2] = v9;
      v20[3] = v10;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
    }
    else
    {
      v17[0] = @"V";
      v17[1] = @"nm";
      v18[0] = v11;
      v18[1] = @"ti";
      v18[2] = v9;
      void v17[2] = @"tim";
      v17[3] = @"tL";
      uint64_t v14 = [NSNumber numberWithInt:self->_textInputSuggestions != 0];
      void v18[3] = v14;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    }
    id v16 = v12;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(SPRemoteInterface *)self sendPlist:v13 clientIdentifiers:v15];
  }
  else
  {
    uint64_t v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerPresentTextInputController:allowedInputMode:suggestions:]();
    }
  }
}

- (void)controllerDismissTextInputController:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  BOOL v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    v10[0] = @"V";
    v10[1] = @"nm";
    v11[0] = v5;
    v11[1] = @".pop";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerDismissTextInputController:]();
    }
  }
}

- (void)openSystemURL:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    BOOL v6 = appClientIdentifier;
    id v7 = spUtils_serializeObject(a3);
    uint64_t v11 = @"ou";
    v12[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    [(SPRemoteInterface *)self sendPlist:v8 clientIdentifiers:v9];
  }
}

- (void)controllerPresentAddPassesController:(id)a3 passes:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPRemoteInterface *)self _interfaceControllerID:v6];
  id v9 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v8];
  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v14[0] = @"V";
    v14[1] = @"nm";
    v15[0] = v8;
    v15[1] = @"pka";
    v14[2] = @"pkp";
    v15[2] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    uint64_t v13 = v9;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [(SPRemoteInterface *)self sendPlist:v11 clientIdentifiers:v12];
  }
  else
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerPresentAddPassesController:passes:]();
    }
  }
}

- (void)controllerDismissAddPassesController:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  id v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    v10[0] = @"V";
    v10[1] = @"nm";
    v11[0] = v5;
    v11[1] = @".pop";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface controllerDismissAddPassesController:]();
    }
  }
}

- (void)didFinishHandlingActivity:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  id v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
  if (v6)
  {
    v10[0] = @"V";
    v10[1] = @"har";
    v11[0] = v5;
    v11[1] = MEMORY[0x263EFFA88];
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(SPRemoteInterface *)self sendPlist:v7 clientIdentifiers:v8];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface didFinishHandlingActivity:]();
    }
  }
}

- (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SPRemoteInterface *)self _interfaceControllerID:v6];
  id v8 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v7];
  if (v8)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        id v10 = 0;
        goto LABEL_10;
      }
      id v9 = SPApplicationNotificationTypeCustom;
    }
    else
    {
      id v9 = SPApplicationNotificationTypeDefault;
    }
    id v10 = *v9;
LABEL_10:
    v14[0] = @"V";
    v14[1] = @"nt";
    v15[0] = v7;
    v15[1] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v13 = v8;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [(SPRemoteInterface *)self sendPlist:v11 clientIdentifiers:v12];

    goto LABEL_11;
  }
  id v10 = wk_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SPRemoteInterface notificationController:showNotificationInterfaceType:]();
  }
LABEL_11:
}

- (void)sendWillActivateReplyForController:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SPRemoteInterface *)self _interfaceControllerID:v4];
  if (v5)
  {
    id v6 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(SPRemoteInterface *)self sendSetViewController:v5 key:@"#didActivate" property:0 value:0 clientIdentifiers:v7];
  }
  else
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446722;
      id v9 = "-[SPRemoteInterface sendWillActivateReplyForController:]";
      __int16 v10 = 1024;
      int v11 = 2311;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_2211F3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF: interfaceControllerID for controller:%{public}@ not found. Controller may already have been released.", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)recoverFromMissingIntefaceControllerWithID:(id)a3
{
  id v4 = a3;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SPRemoteInterface_recoverFromMissingIntefaceControllerWithID___block_invoke;
  v7[3] = &unk_264598D10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(interfaceControllersAccessQueue, v7);
}

uint64_t __64__SPRemoteInterface_recoverFromMissingIntefaceControllerWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_recoverFromMissingIntefaceControllerWithID:", *(void *)(a1 + 40));
}

- (void)_inQueue_recoverFromMissingIntefaceControllerWithID:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_missingInterfaceControllers containsObject:v4] & 1) == 0)
  {
    missingInterfaceControllers = self->_missingInterfaceControllers;
    if (!missingInterfaceControllers)
    {
      id v6 = [MEMORY[0x263EFF9C0] set];
      id v7 = self->_missingInterfaceControllers;
      self->_missingInterfaceControllers = v6;

      missingInterfaceControllers = self->_missingInterfaceControllers;
    }
    [(NSMutableSet *)missingInterfaceControllers addObject:v4];
    dispatch_time_t v8 = dispatch_time(0, 30000000000);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    __int16 v12 = __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke;
    id v13 = &unk_264598D10;
    uint64_t v14 = self;
    id v9 = v4;
    id v15 = v9;
    dispatch_after(v8, MEMORY[0x263EF83A0], &v10);

    -[SPRemoteInterface _tellApplicationThatInterfaceControllerCantBeFound:](self, "_tellApplicationThatInterfaceControllerCantBeFound:", v9, v10, v11, v12, v13, v14);
  }
}

void __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke_2;
  v3[3] = &unk_264598D10;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_barrier_async(v2, v3);
}

uint64_t __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)_tellApplicationThatInterfaceControllerCantBeFound:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F5E720] defaultService];
  uint64_t v5 = [v4 hostPrincipalForPlugInNamed:0];

  if (v5)
  {
    id v6 = [MEMORY[0x263F086E0] mainBundle];
    id v7 = [v6 bundleIdentifier];
    [v5 extensionWithIdentifier:v7 gotUnknownInterfaceController:v3];
  }
  else
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface _tellApplicationThatInterfaceControllerCantBeFound:]();
    }
  }
}

- (id)_interfaceControllerWithID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy_;
  long long v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SPRemoteInterface__interfaceControllerWithID___block_invoke;
  block[3] = &unk_264598D38;
  uint64_t v14 = &v15;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  id v7 = (void *)v16[5];
  if (!v7)
  {
    dispatch_time_t v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(NSMutableDictionary *)self->_interfaceControllersOwners objectForKeyedSubscript:v6];
      [(SPRemoteInterface *)(uint64_t)v6 _interfaceControllerWithID:(uint64_t)v21];
    }

    [(SPRemoteInterface *)self recoverFromMissingIntefaceControllerWithID:v6];
    id v7 = (void *)v16[5];
  }
  id v10 = v7;

  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __48__SPRemoteInterface__interfaceControllerWithID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (void)_interfaceControllerWithID:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v7)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = __Block_byref_object_copy_;
    id v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke;
    block[3] = &unk_264598D38;
    uint64_t v15 = &v16;
    void block[4] = self;
    id v9 = v6;
    id v14 = v9;
    dispatch_sync(interfaceControllersAccessQueue, block);
    if (v17[5])
    {
      v7[2](v7);
    }
    else
    {
      id v10 = self->_interfaceControllersAccessQueue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke_2;
      void v11[3] = &unk_264598D10;
      v11[4] = self;
      id v12 = v9;
      dispatch_async(v10, v11);
    }
    _Block_object_dispose(&v16, 8);
  }
}

uint64_t __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_recoverFromMissingIntefaceControllerWithID:", *(void *)(a1 + 40));
}

- (id)_interfaceControllerID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  long long v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SPRemoteInterface__interfaceControllerID___block_invoke;
  block[3] = &unk_264598D38;
  id v14 = &v15;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  id v7 = (void *)v16[5];
  if (!v7)
  {
    dispatch_time_t v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(NSMutableDictionary *)self->_interfaceControllersOwners objectForKeyedSubscript:v16[5]];
      [(SPRemoteInterface *)(uint64_t)v6 _interfaceControllerID:(uint64_t)v21];
    }

    id v7 = (void *)v16[5];
  }
  id v10 = v7;

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __44__SPRemoteInterface__interfaceControllerID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) allKeysForObject:a1[5]];
  uint64_t v2 = [v5 lastObject];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_interfaceControllerClientIDForControllerID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SPRemoteInterface__interfaceControllerClientIDForControllerID___block_invoke;
  block[3] = &unk_264598D38;
  id v13 = &v14;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  id v7 = (void *)v15[5];
  if (!v7)
  {
    dispatch_time_t v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface _interfaceControllerClientIDForControllerID:]();
    }

    id v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __65__SPRemoteInterface__interfaceControllerClientIDForControllerID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)_interfaceControllerIDsForClientID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SPRemoteInterface__interfaceControllerIDsForClientID___block_invoke;
  block[3] = &unk_264598D38;
  id v13 = &v14;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  id v7 = (void *)v15[5];
  if (!v7)
  {
    dispatch_time_t v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v21 = "-[SPRemoteInterface _interfaceControllerIDsForClientID:]";
      __int16 v22 = 1024;
      int v23 = 2446;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_2211F3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF: interfaceCotrollersIDs for clientIdentifier:%{public}@ not found", buf, 0x1Cu);
    }

    id v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __56__SPRemoteInterface__interfaceControllerIDsForClientID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 40) allKeysForObject:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_registerInterfaceController:(id)a3 interfaceControllerID:(id)a4 interfaceControllerClientID:(id)a5 applicationRootController:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = wk_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136447234;
    uint64_t v15 = "-[SPRemoteInterface _registerInterfaceController:interfaceControllerID:interfaceControllerClientID:application"
          "RootController:]";
    __int16 v16 = 1024;
    int v17 = 2458;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl(&dword_2211F3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: registering controller %{public}@ with id %{public}@ and clientIdentifier %{public}@", (uint8_t *)&v14, 0x30u);
  }

  if (v10)
  {
    [(NSMutableDictionary *)self->_interfaceControllers setObject:v10 forKey:v11];
    if (v6) {
      objc_storeStrong((id *)&self->_rootViewControllerID, a4);
    }
  }
  if (v11) {
    [(NSMutableDictionary *)self->_interfaceControllersOwners setObject:v12 forKey:v11];
  }
}

- (void)_deregisterInterfaceControllerID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(NSMutableDictionary *)self->_interfaceControllers objectForKeyedSubscript:v4];
    id v7 = [(NSMutableDictionary *)self->_interfaceControllersOwners objectForKeyedSubscript:v4];
    *(_DWORD *)buf = 136447234;
    __int16 v16 = "-[SPRemoteInterface _deregisterInterfaceControllerID:]";
    __int16 v17 = 1024;
    int v18 = 2501;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: deregistering controller %{public}@ with id %{public}@ and clientIdentifier %{public}@", buf, 0x30u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke;
  void v13[3] = &unk_264598C20;
  id v8 = v4;
  id v14 = v8;
  spUtils_dispatchAsyncToMainThread(v13);
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke_2;
  block[3] = &unk_264598D10;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_barrier_async(interfaceControllersAccessQueue, block);
}

uint64_t __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke(uint64_t a1)
{
  [(id)__recordedValues removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 32);

  return +[SPRemoteInterface clearStorageForController:v2];
}

void __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 64) isEqualToString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2) {
    id v4 = 0;
  }
  else {
    id v4 = *(void **)(v3 + 64);
  }

  objc_storeStrong((id *)(v3 + 64), v4);
}

- (id)_allInterfaceControllers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SPRemoteInterface__allInterfaceControllers__block_invoke;
  v5[3] = &unk_264598D60;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(interfaceControllersAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__SPRemoteInterface__allInterfaceControllers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) interfaceControllers];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_dumpInterfaceDictionary
{
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke;
  block[3] = &unk_264598C20;
  void block[4] = self;
  dispatch_sync(interfaceControllersAccessQueue, block);
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  uint64_t v15 = v1;
  if (v2 != [*(id *)(*(void *)v1 + 40) count])
  {
    uint64_t v3 = wk_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_2(v1, v3);
    }
  }
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_1(v1);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(*(void *)v1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        id v12 = wk_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = [*(id *)(*(void *)v15 + 32) objectForKeyedSubscript:v11];
          id v14 = [*(id *)(*(void *)v15 + 40) objectForKeyedSubscript:v11];
          *(_DWORD *)buf = 136447490;
          __int16 v21 = "-[SPRemoteInterface _dumpInterfaceDictionary]_block_invoke";
          __int16 v22 = 1024;
          int v23 = 2533;
          __int16 v24 = 1024;
          int v25 = v8;
          __int16 v26 = 2114;
          uint64_t v27 = v11;
          __int16 v28 = 2114;
          int v29 = v13;
          __int16 v30 = 2114;
          id v31 = v14;
          _os_log_error_impl(&dword_2211F3000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%d: #%d key=%{public}@ interfaceController=%{public}@ interfaceControllersOwner=%{public}@", buf, 0x36u);

          ++v8;
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v32 count:16];
    }
    while (v7);
  }
}

- (void)removeInterfaceControllersForClient:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SPRemoteInterface *)self _interfaceControllerIDsForClientID:v4];
  uint64_t v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v26 = "-[SPRemoteInterface removeInterfaceControllersForClient:]";
    __int16 v27 = 1024;
    int v28 = 2558;
    __int16 v29 = 2114;
    id v30 = v4;
    __int16 v31 = 2114;
    __int16 v32 = v5;
    _os_log_impl(&dword_2211F3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Release all controllers - clientIdentifier:%{public}@, interfaceControllerIDs:%{public}@", buf, 0x26u);
  }
  uint64_t v15 = v4;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v12, v15);
        id v14 = v13;
        if (v13)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __57__SPRemoteInterface_removeInterfaceControllersForClient___block_invoke;
          v16[3] = &unk_264598C98;
          id v17 = v13;
          long long v18 = self;
          uint64_t v19 = v12;
          +[SPRemoteInterface handleEvent:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

uint64_t __57__SPRemoteInterface_removeInterfaceControllersForClient___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didDeactivate];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _deregisterInterfaceControllerID:v3];
}

+ (id)controller:(id)a3 setupProperties:(id)a4 viewControllerID:(id)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7 classForType:(void *)a8
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v11 = (NSString *)a3;
  id v12 = a4;
  id v45 = a5;
  id v41 = [MEMORY[0x263EFF980] array];
  long long v47 = 0u;
  long long v48 = 0u;
  if (a8) {
    id v13 = (uint64_t (*)(NSString *))a8;
  }
  else {
    id v13 = (uint64_t (*)(NSString *))SPInterfaceObjectWithType;
  }
  uint64_t v42 = v13;
  long long v49 = 0uLL;
  long long v50 = 0uLL;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v48;
    *(void *)&long long v15 = 136447234;
    long long v40 = v15;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
        objc_msgSend(v20, "objectForKeyedSubscript:", @"property", v40);
        long long v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v20 objectForKeyedSubscript:@"type"];
        long long v23 = (NSString *)v22;
        if (v21) {
          BOOL v24 = v22 == 0;
        }
        else {
          BOOL v24 = 1;
        }
        if (!v24)
        {
          NSSelectorFromString(v21);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            __int16 v26 = wk_default_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
              __int16 v53 = 1024;
              int v54 = 2679;
              __int16 v55 = 2114;
              v56 = v21;
              __int16 v57 = 2114;
              int v58 = v11;
              _os_log_error_impl(&dword_2211F3000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%d: Unknown property in Interface description ('%{public}@') for controller %{public}@", buf, 0x26u);
            }
            uint64_t v25 = v17;
            goto LABEL_27;
          }
          uint64_t v25 = v17 + 1;
          __int16 v26 = [objc_alloc((Class)v42(v23)) _initWithInterfaceProperty:v21 viewControllerID:v45 propertyIndex:v17 tableIndex:a6 rowIndex:a7];
          [v26 _setupWithDescription:v20 forController:v11];
          if (v26)
          {
            SEL v27 = SetterForProperty(v21);
            if (v27)
            {
              int v28 = v27;
              if (([MEMORY[0x263F8C6D0] instancesRespondToSelector:v27] & 1) != 0
                || ([WKInterfaceControllerClass() instancesRespondToSelector:v28] & 1) != 0)
              {
                __int16 v29 = wk_default_log();
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_19;
                }
                NSStringFromSelector(v28);
                __int16 v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
                __int16 v53 = 1024;
                int v54 = 2670;
                __int16 v55 = 2114;
                v56 = v34;
                id v35 = v29;
                __int16 v36 = "%{public}s:%d: Cannot specify setter '%{public}@' for properties of NSObject or WKInterfaceController";
                uint32_t v37 = 28;
LABEL_35:
                _os_log_error_impl(&dword_2211F3000, v35, OS_LOG_TYPE_ERROR, v36, buf, v37);

                goto LABEL_19;
              }
              if (objc_opt_respondsToSelector())
              {
                [(NSString *)v11 performSelector:v28 withObject:v26];
                [v41 addObject:v26];
              }
              else
              {
                __int16 v29 = wk_default_log();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(v28);
                  __int16 v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136446978;
                  v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
                  __int16 v53 = 1024;
                  int v54 = 2667;
                  __int16 v55 = 2114;
                  v56 = v11;
                  __int16 v57 = 2114;
                  int v58 = v34;
                  id v35 = v29;
                  __int16 v36 = "%{public}s:%d: Controller %{public}@ does not implement setter '%{public}@'";
                  uint32_t v37 = 38;
                  goto LABEL_35;
                }
LABEL_19:
              }
LABEL_27:

              uint64_t v17 = v25;
              goto LABEL_28;
            }
            id v30 = wk_default_log();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_26:

              goto LABEL_27;
            }
            *(_DWORD *)buf = 136446722;
            v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
            __int16 v53 = 1024;
            int v54 = 2673;
            __int16 v55 = 2114;
            v56 = v21;
            __int16 v31 = v30;
            __int16 v32 = "%{public}s:%d: Invalid setter name for property '%{public}@'";
            uint32_t v33 = 28;
          }
          else
          {
            id v30 = wk_default_log();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = v40;
            v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
            __int16 v53 = 1024;
            int v54 = 2676;
            __int16 v55 = 2114;
            v56 = v23;
            __int16 v57 = 2114;
            int v58 = v21;
            __int16 v59 = 2114;
            long long v60 = v11;
            __int16 v31 = v30;
            __int16 v32 = "%{public}s:%d: Unable to instantiate object of type '%{public}@' for property %{public}@ in controller %{public}@";
            uint32_t v33 = 48;
          }
          _os_log_error_impl(&dword_2211F3000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
          goto LABEL_26;
        }
LABEL_28:

        ++v19;
      }
      while (v16 != v19);
      uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
      uint64_t v16 = v38;
    }
    while (v38);
  }

  return v41;
}

- (void)receiveProtoData:(id)a3 fromIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a3;
  id v6 = a4;
  unint64_t v7 = [(__CFString *)v5 length];
  uint64_t v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"...";
    int v12 = 136447234;
    id v13 = "-[SPRemoteInterface receiveProtoData:fromIdentifier:]";
    __int16 v14 = 1024;
    if (v7 < 0x10) {
      uint64_t v9 = v5;
    }
    int v15 = 2689;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2048;
    unint64_t v19 = v7;
    __int16 v20 = 2114;
    long long v21 = v9;
    _os_log_impl(&dword_2211F3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin clientIdentifier=%{public}@ len=%lu data=%{public}@", (uint8_t *)&v12, 0x30u);
  }

  uint64_t v10 = +[SPProtoSerializer objectWithData:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = +[SPCompanionAssetCache sharedInstance];
    [v11 handleCacheMessage:v10];
  }
}

- (void)receiveData:(id)a3 fromIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  uint64_t v8 = [[SPProtoSockPuppetPlist alloc] initWithData:v7];

  if (v8)
  {
    [(SPRemoteInterface *)self handleProtoPlist:v8 fromIdentifier:v6];
  }
  else
  {
    uint64_t v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface receiveData:fromIdentifier:]();
    }
  }
}

- (void)handleProtoPlist:(id)a3 fromIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SPProtoSerializer dictionaryWithSPPlist:v6];
  if (v8)
  {
    uint64_t v9 = [v6 data];
    unint64_t v10 = [v9 length];
    uint64_t v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"V"];
      id v13 = (void *)v12;
      int v15 = 136447235;
      __int16 v16 = "-[SPRemoteInterface handleProtoPlist:fromIdentifier:]";
      __int16 v14 = @"...";
      __int16 v17 = 1024;
      int v18 = 2749;
      if (v10 < 0x10) {
        __int16 v14 = (__CFString *)v9;
      }
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      unint64_t v22 = v10;
      __int16 v23 = 2113;
      BOOL v24 = v14;
      _os_log_debug_impl(&dword_2211F3000, v11, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ComF:->Plugin vcID=%{public}@ len=%lu data=%{private}@", (uint8_t *)&v15, 0x30u);
    }
    [(SPRemoteInterface *)self handlePlistDictionary:v8 fromIdentifier:v7];
  }
  else
  {
    uint64_t v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface handleProtoPlist:fromIdentifier:]();
    }
  }
}

- (void)handlePlistDictionary:(id)a3 fromIdentifier:(id)a4
{
  v142[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"V"];

  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"!"];
    unint64_t v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:@"C"])
      {
        uint64_t v11 = [v6 objectForKeyedSubscript:@"V"];
        uint64_t v12 = [v6 objectForKeyedSubscript:@"K"];
        id v13 = [v6 objectForKeyedSubscript:@"P"];
        __int16 v14 = [v6 objectForKeyedSubscript:@"X"];
        int v15 = [v6 objectForKeyedSubscript:@"I"];
        [(SPRemoteInterface *)self createViewController:v11 className:v12 properties:v13 contextID:v14 info:v15 gestureDescriptions:0 clientIdentifier:v7];

LABEL_5:
LABEL_49:

LABEL_126:
        goto LABEL_127;
      }
      if ([v10 isEqualToString:@"R"])
      {
        unint64_t v22 = [v6 objectForKeyedSubscript:@"V"];
        __int16 v23 = wk_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "-[SPRemoteInterface handlePlistDictionary:fromIdentifier:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2780;
          *(_WORD *)&buf[18] = 2114;
          *(void *)&buf[20] = v7;
          *(_WORD *)&buf[28] = 2114;
          *(void *)&buf[30] = v22;
          _os_log_impl(&dword_2211F3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Release controller - clientIdentifier:%{public}@, viewControllerIdentifier:%{public}@", buf, 0x26u);
        }

        [(SPRemoteInterface *)self _deregisterInterfaceControllerID:v22];
        goto LABEL_126;
      }
      if ([v10 isEqualToString:@"A"])
      {
        uint64_t v11 = [v6 objectForKeyedSubscript:@"V"];
        if ([v11 length])
        {
          [(SPRemoteInterface *)self activateViewController:v11 clientIdentifier:v7];
          goto LABEL_49;
        }
        id v45 = wk_default_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.4();
        }
      }
      else
      {
        if (![v10 isEqualToString:@"D"])
        {
          if ([v10 isEqualToString:@"N"])
          {
            uint64_t v11 = [v6 objectForKeyedSubscript:@"V"];
            [(SPRemoteInterface *)self receiveNavigationReply:v11 clientIdentifier:v7];
            goto LABEL_49;
          }
          if (![v10 isEqualToString:@"an"])
          {
            if ([v10 isEqualToString:@"aua"])
            {
              v56 = [v6 objectForKeyedSubscript:@"ua"];
              if (v56)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  __int16 v57 = spUtils_allowedClassesForUserActivity();
                  spUtils_deserializeObject(v56, v57);
                  id v58 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v58 = v56;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v79 = wk_default_log();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                    -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.6();
                  }
                }
                v80 = [v58 objectForKeyedSubscript:@"uai"];
                v129[0] = MEMORY[0x263EF8330];
                v129[1] = 3221225472;
                v129[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke;
                v129[3] = &unk_264598C98;
                id v130 = v6;
                v131 = self;
                id v132 = v80;
                id v81 = v80;
                +[SPRemoteInterface handleEvent:v129];
              }
            }
            goto LABEL_126;
          }
          uint64_t v11 = [v6 objectForKeyedSubscript:@"ni"];
          uint64_t v12 = [v6 objectForKeyedSubscript:@"ai"];
          id v13 = [v6 objectForKeyedSubscript:@"au"];
          __int16 v14 = [v6 objectForKeyedSubscript:@"V"];
          [(SPRemoteInterface *)self rootInterfaceController:v14 performActionWithItemID:v12 forNotificationID:v11 userInfo:v13 clientIdentifier:v7 completionHandler:0];
          goto LABEL_5;
        }
        uint64_t v11 = [v6 objectForKeyedSubscript:@"V"];
        if ([v11 length])
        {
          [(SPRemoteInterface *)self deactivateViewController:v11 clientIdentifier:v7];
          goto LABEL_49;
        }
        id v45 = wk_default_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.5();
        }
      }

      goto LABEL_49;
    }
    v95 = [v6 objectForKeyedSubscript:@"V"];
    id v94 = [(SPRemoteInterface *)self _interfaceControllerWithID:v95];
    __int16 v17 = [v6 objectForKeyedSubscript:@"a"];
    if (v17
      && ([(SPRemoteInterface *)self navigatingViewControllerID],
          int v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v95 isEqualToString:v18],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      v93 = [v6 objectForKeyedSubscript:@"a"];
      if ([(NSString *)v93 isEqualToString:@".Marco"])
      {
        v92 = objc_msgSend(v6, "objectForKeyedSubscript:");
        uint64_t v25 = [v92 objectForKeyedSubscript:@".idx"];
        uint64_t v91 = [v25 integerValue];

        __int16 v26 = [v92 objectForKeyedSubscript:@".tr"];
        int v90 = [v26 BOOLValue];

        SEL v27 = [v92 objectForKeyedSubscript:@".rs"];
        uint64_t v28 = [v27 integerValue];

        __int16 v29 = [MEMORY[0x263EFF990] dataWithCapacity:v28];
        [(SPRemoteInterface *)self _fillDataWithRandom:v29 length:v28];
        v141[0] = @".idx";
        id v30 = [NSNumber numberWithInteger:v91];
        v141[1] = @".pl";
        v142[0] = v30;
        v142[1] = v29;
        __int16 v31 = [NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];

        __int16 v32 = [(SPRemoteInterface *)self _interfaceControllerClientIDForControllerID:v95];
        v139[0] = @"V";
        v139[1] = @"k";
        v140[0] = v95;
        v140[1] = @".Polo";
        v139[2] = @"v";
        v140[2] = v31;
        uint32_t v33 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:3];
        v138 = v32;
        __int16 v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
        [(SPRemoteInterface *)self sendPlist:v33 clientIdentifiers:v34];

        if (v90)
        {
          dispatch_time_t v35 = dispatch_time(0, 5000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2;
          block[3] = &unk_264598D88;
          uint64_t v127 = v91;
          uint64_t v128 = v28;
          id v125 = v95;
          v126 = self;
          dispatch_after(v35, MEMORY[0x263EF83A0], block);
        }
      }
      else if ([(NSString *)v93 isEqualToString:@".select"])
      {
        uint32_t v37 = [v6 objectForKeyedSubscript:@"v"];
        uint64_t v38 = [v37 objectAtIndexedSubscript:0];
        unint64_t v39 = [v37 objectAtIndexedSubscript:1];
        uint64_t v40 = [v39 integerValue];

        v120[0] = MEMORY[0x263EF8330];
        v120[1] = 3221225472;
        v120[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3;
        v120[3] = &unk_264598DB0;
        id v94 = v94;
        id v121 = v94;
        id v122 = v38;
        uint64_t v123 = v40;
        id v41 = v38;
        +[SPRemoteInterface handleEvent:v120];
      }
      else if ([(NSString *)v93 isEqualToString:@".segue"])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        *(void *)&buf[24] = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v46 = [v6 objectForKeyedSubscript:@"v"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        [v6 objectForKeyedSubscript:@"v"];
        if (isKindOfClass) {
          long long v48 = {;
        }
          long long v49 = 0;
        }
        else {
          __int16 v59 = {;
        }
          long long v60 = [v59 objectAtIndexedSubscript:0];
          long long v49 = [v94 valueForKey:v60];

          long long v61 = [v59 objectAtIndexedSubscript:1];
          uint64_t v62 = [v61 integerValue];
          *(void *)(*(void *)&buf[8] + 24) = v62;

          long long v48 = [v59 objectAtIndexedSubscript:2];
        }
        long long v63 = [v48 objectForKeyedSubscript:@"type"];
        char v64 = [v63 isEqualToString:@"present"];

        long long v65 = [v48 objectForKeyedSubscript:@"destination"];
        objc_opt_class();
        char v66 = objc_opt_isKindOfClass();

        long long v67 = [v48 objectForKeyedSubscript:@"identifier"];
        v112[0] = MEMORY[0x263EF8330];
        v112[1] = 3221225472;
        v112[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4;
        v112[3] = &unk_264598DD8;
        id v68 = v49;
        id v113 = v68;
        char v118 = v66 & 1;
        id v94 = v94;
        id v114 = v94;
        id v69 = v67;
        id v115 = v69;
        v117 = buf;
        char v119 = v64;
        id v70 = v48;
        id v116 = v70;
        +[SPRemoteInterface handleEvent:v112];

        _Block_object_dispose(buf, 8);
      }
      else
      {
        long long v50 = [v6 objectForKeyedSubscript:@"v"];
        id v111 = v50;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v50 count] >= 2)
        {
          v51 = [v50 objectAtIndex:0];
          v52 = [v50 objectAtIndex:1];
          uint64_t v53 = [v52 integerValue];

          if ((unint64_t)[v50 count] < 3)
          {
            id v54 = 0;
          }
          else
          {
            id v54 = [v50 objectAtIndex:2];
          }

          id v111 = v54;
          v74 = [v94 valueForKey:v51];
          uint64_t v75 = v74;
          if (v74 && (v53 & 0x8000000000000000) == 0 && v53 < [v74 numberOfRows])
          {
            uint64_t v76 = [v75 rowControllerAtIndex:v53];

            id v94 = (id)v76;
          }
        }
        else
        {
          id v54 = v50;
        }
        if (![(NSString *)v93 isEqualToString:@".pickerSettle"]
          && ![(NSString *)v93 isEqualToString:@".pickerFocus"]
          && ![(NSString *)v93 isEqualToString:@".pickerClearFocus"])
        {
          SEL v77 = NSSelectorFromString(v93);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (+[WKInterfaceController instancesRespondToSelector:v77] & 1) == 0)
          {
            v82 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v77];
            v83 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v82];
            [v83 setTarget:v94];
            [v83 setSelector:v77];
            v84 = wk_default_log();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136447490;
              *(void *)&uint8_t buf[4] = "-[SPRemoteInterface handlePlistDictionary:fromIdentifier:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 3057;
              *(_WORD *)&buf[18] = 2114;
              *(void *)&buf[20] = v94;
              *(_WORD *)&buf[28] = 2114;
              *(void *)&buf[30] = v93;
              __int16 v134 = 2114;
              v135 = v82;
              __int16 v136 = 2114;
              v137 = v83;
              _os_log_impl(&dword_2211F3000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: controller controller=%{public}@ action=%{public}@ methodSignature=%{public}@ invocation=%{public}@", buf, 0x3Au);
            }

            if (v54 && (unint64_t)[v82 numberOfArguments] >= 3)
            {
              v85 = (const char *)[v82 getArgumentTypeAtIndex:2];
              if (!strcmp(v85, "@"))
              {
                [v83 setArgument:&v111 atIndex:2];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!strcmp(v85, "B"))
                  {
                    buf[0] = [v111 BOOLValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "q"))
                  {
                    *(void *)buf = [v111 integerValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "Q"))
                  {
                    *(void *)buf = [v111 unsignedIntegerValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "c"))
                  {
                    buf[0] = [v111 charValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "C"))
                  {
                    buf[0] = [v111 unsignedCharValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "s"))
                  {
                    *(_WORD *)buf = [v111 shortValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "S"))
                  {
                    *(_WORD *)buf = [v111 unsignedShortValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "i"))
                  {
                    *(_DWORD *)buf = [v111 intValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "I"))
                  {
                    *(_DWORD *)buf = [v111 unsignedIntValue];
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "f"))
                  {
                    [v111 floatValue];
                    *(_DWORD *)buf = v88;
                    [v83 setArgument:buf atIndex:2];
                  }
                  else if (!strcmp(v85, "d"))
                  {
                    [v111 doubleValue];
                    *(void *)buf = v86;
                    [v83 setArgument:buf atIndex:2];
                  }
                }
                else
                {
                  v87 = wk_default_log();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
                    -[SPRemoteInterface handlePlistDictionary:fromIdentifier:]();
                  }
                }
              }
            }
            v109[0] = MEMORY[0x263EF8330];
            v109[1] = 3221225472;
            v109[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_498;
            v109[3] = &unk_264598C20;
            id v110 = v83;
            id v89 = v83;
            +[SPRemoteInterface handleEvent:v109];

            id v54 = v111;
          }
          else if (![(NSString *)v93 isEqualToString:@".Marco"])
          {
            v78 = wk_default_log();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              -[SPRemoteInterface handlePlistDictionary:fromIdentifier:]();
            }
          }
        }
      }
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_499;
      v107[3] = &unk_264598C20;
      id v108 = v95;
      +[SPRemoteInterface handleEvent:v107];

      __int16 v21 = v93;
    }
    else
    {
      uint64_t v20 = [v6 objectForKeyedSubscript:@"k"];

      if (!v20)
      {
LABEL_125:

        goto LABEL_126;
      }
      v104[0] = MEMORY[0x263EF8330];
      v104[1] = 3221225472;
      v104[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2_500;
      v104[3] = &unk_264598D10;
      id v94 = v94;
      v105 = (NSString *)v94;
      id v106 = v6;
      +[SPRemoteInterface handleEvent:v104];

      __int16 v21 = v105;
    }

    goto LABEL_125;
  }
  __int16 v16 = [v6 objectForKeyedSubscript:@"tI"];

  if (v16)
  {
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3_501;
    v102[3] = &unk_264598D10;
    v102[4] = self;
    id v103 = v6;
    spUtils_dispatchAsyncToMainThread(v102);
  }
  else
  {
    BOOL v24 = [v6 objectForKeyedSubscript:@"tL"];

    if (v24)
    {
      v99[0] = MEMORY[0x263EF8330];
      v99[1] = 3221225472;
      v99[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4_502;
      v99[3] = &unk_264598C98;
      v99[4] = self;
      id v100 = v6;
      id v101 = v7;
      spUtils_dispatchAsyncToMainThread(v99);
    }
    else
    {
      __int16 v36 = [v6 objectForKeyedSubscript:@"pkf"];

      if (v36)
      {
        v98[0] = MEMORY[0x263EF8330];
        v98[1] = 3221225472;
        v98[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_5;
        v98[3] = &unk_264598C20;
        v98[4] = self;
        spUtils_dispatchAsyncToMainThread(v98);
      }
      else
      {
        uint64_t v42 = [v6 objectForKeyedSubscript:@"lm"];

        if (v42)
        {
          v43 = [v6 objectForKeyedSubscript:@"lm"];
          NSLog(&stru_26D310CB0.isa, v43);

          uint64_t v44 = wk_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[SPRemoteInterface handlePlistDictionary:fromIdentifier:](v6, @"lm");
          }
        }
        else
        {
          __int16 v55 = [v6 objectForKeyedSubscript:@"cc"];

          if (v55)
          {
            v96[0] = MEMORY[0x263EF8330];
            v96[1] = 3221225472;
            v96[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_503;
            v96[3] = &unk_264598D10;
            v96[4] = self;
            id v97 = v6;
            spUtils_dispatchAsyncToMainThread(v96);
          }
          else
          {
            v71 = [v6 objectForKeyedSubscript:@"cd"];

            if (v71)
            {
              v72 = [(SPRemoteInterface *)self activeComplicationsConnections];
              char v73 = [v72 containsObject:v7];

              if ((v73 & 1) == 0)
              {
                [(SPRemoteInterface *)self applicationDidFinishConnecting:v7];
                [(SPRemoteInterface *)self dataInterfaceDidBecomeActive:v7];
              }
              [(SPRemoteInterface *)self getComplicationData:v7];
            }
          }
        }
      }
    }
  }
LABEL_127:
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"V"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1 + 40) _interfaceControllerWithID:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
        [v7 handleUserActivity:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v2 firstObject];
  unint64_t v10 = [v8 _interfaceControllerWithID:v9];
  +[SPRemoteInterface didFinishHandlingActivity:v10];
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2(uint64_t a1)
{
  v6[3] = *MEMORY[0x263EF8340];
  v6[0] = *(void *)(a1 + 32);
  v5[0] = @"V";
  v5[1] = @".idx";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v6[1] = v2;
  v5[2] = @".rs";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v6[2] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  [*(id *)(a1 + 40) _requestTimingData:v4];
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 valueForKey:a1[5]];
  [v2 table:v3 didSelectRowAtIndex:a1[6]];
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v2)
    {
      uint64_t v6 = objc_msgSend(v3, "contextsForSegueWithIdentifier:inTable:rowIndex:", v5);
LABEL_6:
      id v7 = (void *)v6;
      id v13 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = objc_msgSend(v3, "contextForSegueWithIdentifier:inTable:rowIndex:", v5);
  }
  else
  {
    if (v2)
    {
      uint64_t v6 = [v3 contextsForSegueWithIdentifier:v5];
      goto LABEL_6;
    }
    uint64_t v8 = [v3 contextForSegueWithIdentifier:v5];
  }
  id v13 = (id)v8;
  id v7 = 0;
LABEL_10:
  int v9 = *(unsigned __int8 *)(a1 + 72);
  if (*(unsigned char *)(a1 + 73))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    long long v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"destination"];
    if (v9) {
      +[SPRemoteInterface controller:v10 presentInterfaceControllers:v11 contexts:v7];
    }
    else {
      +[SPRemoteInterface controller:v10 presentInterfaceController:v11 context:v13];
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 72)) {
      goto LABEL_17;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    long long v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"destination"];
    +[SPRemoteInterface controller:v12 pushInterfaceController:v11 context:v13];
  }

LABEL_17:
}

uint64_t __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_498(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

uint64_t __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_499(uint64_t a1)
{
  return +[SPRemoteInterface setController:*(void *)(a1 + 32) key:@".null" property:&stru_26D3103D0 value:0];
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2_500(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"v"];
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"k"];
  [v2 setValue:v4 forKey:v3];
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3_501(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"tI"];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
    if ([v8 count]) {
      id v3 = v8;
    }
    else {
      id v3 = 0;
    }
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = 0;
  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4_502(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 96);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"tL"];
    uint64_t v4 = (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v10 = @"tS";
    v11[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v7 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [v7 sendPlist:v6 clientIdentifiers:v8];
  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) addPassesCompletion];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) addPassesCompletion];
    v3[2]();

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 setAddPassesCompletion:0];
  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_503(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(v3 + 8);
    id v5 = [v2 objectForKeyedSubscript:@"cc"];
    [v4 remoteInterface:v3 setComplicationDataClassName:v5];
  }
}

- (void)createViewController:(id)a3 className:(id)a4 properties:(id)a5 contextID:(id)a6 info:(id)a7 gestureDescriptions:(id)a8 clientIdentifier:(id)a9
{
  id v15 = a3;
  uint64_t v16 = (NSString *)a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!WKInterfaceControllerClass()
    || (Class v22 = NSClassFromString(v16),
        ![(objc_class *)v22 isSubclassOfClass:WKInterfaceControllerClass()]))
  {
    Class v30 = NSClassFromString(v16);
    __int16 v31 = wk_default_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32) {
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:].cold.4();
      }

      [NSString stringWithFormat:@"%@ is not a subclass of WKInterfaceController", v16];
      uint32_t v33 = [NSString stringWithFormat:@"Condition failed:\"%s\". %@", "NO", objc_claimAutoreleasedReturnValue()];
      __int16 v34 = wk_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:]();
      }
    }
    else
    {
      if (v32) {
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:]();
      }

      [NSString stringWithFormat:@"Couldn't instantiate class %@", v16];
      uint32_t v33 = [NSString stringWithFormat:@"Condition failed:\"%s\". %@", "NO", objc_claimAutoreleasedReturnValue()];
      __int16 v34 = wk_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:]();
      }
    }

    __abort_with_reason([v33 UTF8String]);
    exit(1);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke;
  v35[3] = &unk_264598EF0;
  id v36 = v19;
  id v37 = v18;
  uint64_t v38 = self;
  id v39 = v21;
  id v40 = v15;
  id v41 = v16;
  id v42 = v17;
  id v43 = v20;
  id v23 = v20;
  id v24 = v17;
  uint64_t v25 = v16;
  id v26 = v15;
  id v27 = v21;
  id v28 = v18;
  id v29 = v19;
  +[SPRemoteInterface handleEvent:v35];
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"s"];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ir"];
  uint64_t v4 = [v3 BOOLValue];

  if ((unint64_t)[v2 count] < 4)
  {
    double v7 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    id v5 = [v2 objectAtIndexedSubscript:0];
    [v5 floatValue];
    double v7 = v6;
    id v8 = [v2 objectAtIndexedSubscript:1];
    [v8 floatValue];
    double v10 = v9;
    long long v11 = [v2 objectAtIndexedSubscript:2];
    [v11 floatValue];
    double v13 = v12;
    long long v14 = [v2 objectAtIndexedSubscript:3];
    [v14 floatValue];
    double v16 = v15;
  }
  uint64_t v17 = [*(id *)(a1 + 40) integerValue];
  uint64_t v19 = *(void *)(a1 + 40);
  id v18 = *(void **)(a1 + 48);
  if (v17 < 0) {
    [v18 pageInterfaceCreationContextForID:v19];
  }
  else {
  id v20 = [v18 interfaceCreationContextForID:v19];
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2;
  v31[3] = &unk_264598E78;
  id v32 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 64);
  id v34 = *(id *)(a1 + 72);
  id v21 = v20;
  id v35 = v21;
  double v39 = v7;
  double v40 = v10;
  double v41 = v13;
  double v42 = v16;
  id v36 = *(id *)(a1 + 80);
  id v22 = *(id *)(a1 + 88);
  uint64_t v23 = *(void *)(a1 + 48);
  id v37 = v22;
  uint64_t v38 = v23;
  char v43 = v4;
  id v24 = (void (**)(void, void, void, void, void, void))MEMORY[0x223C7C250](v31);
  if (__pageInterfaceCreationContexts_block_invoke_2_onceToken != -1) {
    dispatch_once(&__pageInterfaceCreationContexts_block_invoke_2_onceToken, &__block_literal_global_512);
  }
  if ([NSClassFromString(*(NSString **)(a1 + 72)) isSubclassOfClass:__pageInterfaceCreationContexts_block_invoke_2___wkUserNotificationInterfaceControllerClass])
  {
    uint64_t v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ni"];
    id v26 = v25;
    if (v25)
    {
      id v27 = *(void **)(a1 + 48);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_516;
      v28[3] = &unk_264598EC8;
      id v29 = v25;
      Class v30 = v24;
      [v27 fetchNotificationForNotificationID:v29 completion:v28];
    }
    else
    {
      v24[2](v24, v4, 0, 0, 0, 0);
    }
  }
  else
  {
    v24[2](v24, v4, 0, 0, 0, 0);
  }
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  double v41 = __Block_byref_object_copy_;
  double v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  double v13 = wk_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    id v45 = "-[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentif"
          "ier:]_block_invoke_2";
    __int16 v46 = 1024;
    int v47 = 3197;
    __int16 v48 = 2114;
    uint64_t v49 = v14;
    __int16 v50 = 2114;
    uint64_t v51 = v15;
    __int16 v52 = 2114;
    uint64_t v53 = v16;
    _os_log_impl(&dword_2211F3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Create controller - clientIdentifier:%{public}@, viewControllerIdentifier:%{public}@, className:%{public}@", buf, 0x30u);
  }

  uint64_t v17 = *(void **)(a1 + 40);
  id v18 = *(void **)(a1 + 48);
  id v20 = *(void **)(a1 + 56);
  uint64_t v19 = *(void **)(a1 + 64);
  id v21 = *(void **)(a1 + 72);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_506;
  v29[3] = &unk_264598E28;
  id v22 = v12;
  id v30 = v22;
  id v23 = v10;
  id v31 = v23;
  id v24 = v11;
  id v36 = &v38;
  uint64_t v25 = *(void *)(a1 + 80);
  id v32 = v24;
  uint64_t v33 = v25;
  id v34 = *(id *)(a1 + 40);
  id v35 = *(id *)(a1 + 32);
  char v37 = *(unsigned char *)(a1 + 120);
  id v26 = _WKInterfaceControllerCreateClass(v18, v20, v17, v19, v21, v29, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  if (a6)
  {
    [*(id *)(a1 + 80) extensionDidBeginNotificationUICreation];
    id v27 = (void *)v39[5];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_3;
    v28[3] = &unk_264598E50;
    void v28[4] = *(void *)(a1 + 80);
    v28[5] = &v38;
    [v27 _didReceiveNotification:v22 remoteNotification:v23 localNotification:v24 withCompletion:v28];
  }

  _Block_object_dispose(&v38, 8);
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_506(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40) || *(void *)(a1 + 48)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a2);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  float v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2_507;
  block[3] = &unk_264598E00;
  void block[4] = v5;
  id v9 = v4;
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  char v12 = *(unsigned char *)(a1 + 88);
  id v7 = v4;
  dispatch_barrier_sync(v6, block);
  [v7 didRegisterWithRemoteInterface];
}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2_507(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerInterfaceController:*(void *)(a1 + 40) interfaceControllerID:*(void *)(a1 + 48) interfaceControllerClientID:*(void *)(a1 + 56) applicationRootController:*(unsigned __int8 *)(a1 + 64)];
}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[SPRemoteInterface notificationController:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) showNotificationInterfaceType:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 extensionDidEndNotificationUICreation];
}

Class __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_4()
{
  Class result = NSClassFromString(&cfstr_Wkusernotifica.isa);
  __pageInterfaceCreationContexts_block_invoke_2___wkUserNotificationInterfaceControllerClass = (uint64_t)result;
  return result;
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_516(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    double v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_516_cold_1();
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_517;
  void v18[3] = &unk_264598EA0;
  id v14 = *(id *)(a1 + 40);
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  spUtils_dispatchAsyncToMainThread(v18);
}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_517(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t))(a1[7] + 16))(a1[7], 0, a1[4], a1[5], a1[6], 1);
}

- (void)activateViewController:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke;
    void v12[3] = &unk_264598C98;
    v12[4] = self;
    id v8 = v6;
    id v13 = v8;
    id v14 = v7;
    +[SPRemoteInterface handleEvent:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke_2;
    v10[3] = &unk_264598C20;
    id v11 = v8;
    +[SPRemoteInterface handleEvent:v10];
  }
  else
  {
    id v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface activateViewController:clientIdentifier:]();
    }
  }
}

uint64_t __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateViewController:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48)];
}

uint64_t __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke_2(uint64_t a1)
{
  return +[SPRemoteInterface setController:*(void *)(a1 + 32) key:@".null" property:&stru_26D3103D0 value:0];
}

- (void)_activateViewController:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(SPRemoteInterface *)self _interfaceControllerWithID:v5];
  +[SPRemoteInterface setControllerActive:v5];

  id v7 = wk_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 viewControllerID];
    int v9 = 136446722;
    id v10 = "-[SPRemoteInterface _activateViewController:clientIdentifier:]";
    __int16 v11 = 1024;
    int v12 = 3327;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_2211F3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling willActivate for %{public}@", (uint8_t *)&v9, 0x1Cu);
  }
  [v6 willActivate];
  [(SPRemoteInterface *)self sendWillActivateReplyForController:v6];
}

- (void)deactivateViewController:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(SPRemoteInterface *)self _interfaceControllerWithID:v6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __63__SPRemoteInterface_deactivateViewController_clientIdentifier___block_invoke;
    v10[3] = &unk_264598D10;
    id v11 = v6;
    id v12 = v8;
    int v9 = v8;
    +[SPRemoteInterface handleEvent:v10];
  }
  else
  {
    int v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SPRemoteInterface deactivateViewController:clientIdentifier:]();
    }
  }
}

uint64_t __63__SPRemoteInterface_deactivateViewController_clientIdentifier___block_invoke(uint64_t a1)
{
  +[SPRemoteInterface setControllerInactive:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 didDeactivate];
}

- (void)receiveNavigationReply:(id)a3 clientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(SPRemoteInterface *)self navigatingViewControllerID];
  int v7 = [v6 isEqualToString:v5];

  if (v7)
  {
    [(SPRemoteInterface *)self setNavigatingViewControllerID:0];
  }
}

- (void)applicationDidTerminate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v11 = "-[SPRemoteInterface applicationDidTerminate:]";
    __int16 v12 = 1024;
    int v13 = 3433;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  [(SPRemoteInterface *)self removeInterfaceControllersForClient:v4];
  id v6 = [(SPRemoteInterface *)self activeComplicationsConnections];
  uint64_t v7 = [v6 indexOfObject:v4];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(SPRemoteInterface *)self activeComplicationsConnections];
    [v8 removeObjectAtIndex:v7];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__SPRemoteInterface_applicationDidTerminate___block_invoke;
    v9[3] = &unk_264598C20;
    v9[4] = self;
    spUtils_dispatchAsyncToMainThread(v9);
  }
}

uint64_t __45__SPRemoteInterface_applicationDidTerminate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "dataInterfaceWillResignActive:");
  }
  return result;
}

- (void)applicationContentsDidReset:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[SPRemoteInterface applicationContentsDidReset:]";
    __int16 v8 = 1024;
    int v9 = 3449;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", (uint8_t *)&v6, 0x1Cu);
  }

  [(SPRemoteInterface *)self removeInterfaceControllersForClient:v4];
}

- (void)applicationDidFinishConnecting:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v8 = "-[SPRemoteInterface applicationDidFinishConnecting:]";
    __int16 v9 = 1024;
    int v10 = 3456;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SPRemoteInterface_applicationDidFinishConnecting___block_invoke;
  v6[3] = &unk_264598C20;
  void v6[4] = self;
  spUtils_dispatchAsyncToMainThread(v6);
}

uint64_t __52__SPRemoteInterface_applicationDidFinishConnecting___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "remoteInterfaceDidFinishConnecting:");
  }
  return result;
}

- (void)applicationDidBecomeActive:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    id v5 = "-[SPRemoteInterface applicationDidBecomeActive:]";
    __int16 v6 = 1024;
    int v7 = 3618;
    _os_log_impl(&dword_2211F3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v4, 0x12u);
  }
}

- (void)applicationWillResignActive:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    id v5 = "-[SPRemoteInterface applicationWillResignActive:]";
    __int16 v6 = 1024;
    int v7 = 3642;
    _os_log_impl(&dword_2211F3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v4, 0x12u);
  }
}

- (void)applicationDidReceiveNotification:(id)a3 clientIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (spUtils_isApplicationCompanionConnectionClientIdentifier(a4))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke;
    v9[3] = &unk_264598F18;
    id v10 = v7;
    id v11 = v8;
    spUtils_dispatchAsyncToMainThread(v9);
  }
}

void __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F08928];
  getUNNotificationClass();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = 0;
  id v5 = [v2 unarchivedObjectOfClass:v3 fromData:v4 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke_cold_1();
    }
  }
  id v8 = [getUNUserNotificationCenterClass() currentNotificationCenter];
  __int16 v9 = [v8 delegate];

  if (objc_opt_respondsToSelector())
  {
    NSClassFromString(&cfstr_Spapplicationd.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [getUNUserNotificationCenterClass() currentNotificationCenter];
      [v9 userNotificationCenter:v10 willPresentNotification:v5 withCompletionHandler:*(void *)(a1 + 40)];
    }
  }
}

- (void)finishActivatingVCWithID:(id)a3 completion:(id)a4
{
}

- (void)performAfterApplicationDidFinishLaunching:(id)a3
{
}

- (void)applicationHandleWatchTaskKeys:(id)a3 reasonForSnapshot:(unint64_t)a4 visibleVCID:(id)a5 barTaskUUID:(id)a6 clientIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (spUtils_isApplicationCompanionConnectionClientIdentifier(v14))
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke;
    void v15[3] = &unk_264598F40;
    void v15[4] = self;
    id v16 = v12;
    id v17 = v11;
    id v18 = v13;
    id v19 = v14;
    spUtils_dispatchAsyncToMainThread(v15);
  }
}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_2;
  void v5[3] = &unk_264598F40;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 64);
  [v2 performAfterApplicationDidFinishLaunching:v5];
}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = wk_bg_app_refresh_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) allKeys];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    id v13 = "-[SPRemoteInterface applicationHandleWatchTaskKeys:reasonForSnapshot:visibleVCID:barTaskUUID:clientIdentifier:"
          "]_block_invoke_2";
    __int16 v14 = 1024;
    int v15 = 3775;
    __int16 v16 = 2114;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Waiting on finishActivatingVCWithID:%{public}@ with taskKeys %{public}@, barTaskUUID=%{public}@", buf, 0x30u);
  }
  id v6 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_538;
  v8[3] = &unk_264598CE8;
  v8[4] = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 64);
  [v6 finishActivatingVCWithID:v7 completion:v8];
}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_538(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = wk_bg_app_refresh_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[SPRemoteInterface applicationHandleWatchTaskKeys:reasonForSnapshot:visibleVCID:barTaskUUID:clientIdentifier:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 3845;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Finished activating for snapshot", buf, 0x12u);
  }

  uint64_t v3 = (void *)a1[4];
  if (a1[5]) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = MEMORY[0x263EFFA78];
  }
  v10[0] = @"hT";
  v10[1] = @"Ui";
  v11[0] = v4;
  uint64_t v5 = (void *)a1[6];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263F08C38] UUID];
  }
  v11[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v9 = a1[7];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v3 sendPlist:v7 clientIdentifiers:v8];

  if (!v5) {
}
  }

- (void)applicationIsStillActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[SPRemoteInterface applicationIsStillActive]";
    __int16 v5 = 1024;
    int v6 = 3856;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v3, 0x12u);
  }
}

- (void)dataInterfaceDidBecomeActive:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v11 = "-[SPRemoteInterface dataInterfaceDidBecomeActive:]";
    __int16 v12 = 1024;
    int v13 = 3892;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  int v6 = [(SPRemoteInterface *)self activeComplicationsConnections];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    id v8 = [(SPRemoteInterface *)self activeComplicationsConnections];
    [v8 addObject:v4];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__SPRemoteInterface_dataInterfaceDidBecomeActive___block_invoke;
  v9[3] = &unk_264598C20;
  void v9[4] = self;
  spUtils_dispatchAsyncToMainThread(v9);
}

uint64_t __50__SPRemoteInterface_dataInterfaceDidBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "dataInterfaceDidBecomeActive:");
  }
  return result;
}

- (void)dataInterfaceWillResignActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v9 = "-[SPRemoteInterface dataInterfaceWillResignActive:]";
    __int16 v10 = 1024;
    int v11 = 3907;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  int v6 = [(SPRemoteInterface *)self activeComplicationsConnections];
  [v6 removeObject:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SPRemoteInterface_dataInterfaceWillResignActive___block_invoke;
  v7[3] = &unk_264598C20;
  v7[4] = self;
  spUtils_dispatchAsyncToMainThread(v7);
}

uint64_t __51__SPRemoteInterface_dataInterfaceWillResignActive___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "dataInterfaceWillResignActive:");
  }
  return result;
}

- (void)preferredContentSizeCategory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[SPRemoteInterface preferredContentSizeCategory:]";
    __int16 v9 = 1024;
    int v10 = 3918;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  if (v3 && (!preferredContentSizeCategory____textSize || objc_msgSend(v3, "compare:")))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__SPRemoteInterface_preferredContentSizeCategory___block_invoke;
    void v5[3] = &unk_264598C20;
    id v6 = v3;
    spUtils_dispatchAsyncToMainThread(v5);
  }
}

void __50__SPRemoteInterface_preferredContentSizeCategory___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)&preferredContentSizeCategory____textSize, *(id *)(a1 + 32));
  uint64_t v1 = preferredContentSizeCategory____textSize;
  uint64_t v2 = +[WKInterfaceDevice currentDevice];
  [v2 setPreferredContentSizeCategory:v1];

  uint64_t v6 = *MEMORY[0x263F1D190];
  v7[0] = preferredContentSizeCategory____textSize;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [MEMORY[0x263F089F8] notificationWithName:*MEMORY[0x263F1D158] object:0 userInfo:v3];
  __int16 v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotification:v4];
}

- (void)layoutDirection:(int64_t)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    uint64_t v6 = "-[SPRemoteInterface layoutDirection:]";
    __int16 v7 = 1024;
    int v8 = 3939;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_2211F3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %d", (uint8_t *)&v5, 0x18u);
  }
}

- (BOOL)_handleAction:(id)a3 forNotification:(id)a4 remoteNotificationContext:(id)a5 localNotification:(id)a6 unNotification:(id)a7 handler:(id)a8 controller:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = (__CFString *)v15;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  id v23 = (void *)getUNNotificationDefaultActionIdentifierSymbolLoc_ptr;
  uint64_t v55 = getUNNotificationDefaultActionIdentifierSymbolLoc_ptr;
  if (!getUNNotificationDefaultActionIdentifierSymbolLoc_ptr)
  {
    uint64_t v47 = MEMORY[0x263EF8330];
    uint64_t v48 = 3221225472;
    uint64_t v49 = __getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke;
    __int16 v50 = &unk_264598A90;
    uint64_t v51 = &v52;
    id v24 = (void *)UserNotificationsLibrary();
    v53[3] = (uint64_t)dlsym(v24, "UNNotificationDefaultActionIdentifier");
    getUNNotificationDefaultActionIdentifierSymbolLoc_ptr = *(void *)(v51[1] + 24);
    id v23 = (void *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v23) {
    -[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:]();
  }
  int v25 = [(__CFString *)v22 isEqualToString:*v23];
  id v26 = v22;
  if (v25)
  {

    id v26 = &stru_26D3103D0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v18 || v17 || v19)
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke;
      v40[3] = &unk_264598F68;
      id v41 = v20;
      double v42 = v22;
      id v43 = v19;
      id v44 = v17;
      id v45 = v18;
      id v46 = v21;
      +[SPRemoteInterface handleEvent:v40];

      BOOL v27 = 1;
      id v28 = v41;
    }
    else
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2;
      v36[3] = &unk_264598F90;
      id v37 = v21;
      id v38 = v20;
      double v39 = v26;
      [(SPRemoteInterface *)self fetchNotificationForNotificationID:v16 completion:v36];

      BOOL v27 = 1;
      id v28 = v37;
    }
  }
  else
  {
    id v29 = [getUNUserNotificationCenterClass() currentNotificationCenter];
    id v28 = [v29 delegate];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && (NSClassFromString(&cfstr_Spapplicationd.isa), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_3;
      v31[3] = &unk_264598CE8;
      id v28 = v28;
      id v32 = v28;
      uint64_t v33 = v22;
      id v34 = v19;
      id v35 = v21;
      +[SPRemoteInterface handleEvent:v31];

      BOOL v27 = 1;
    }
    else
    {
      BOOL v27 = 0;
    }
  }

  return v27;
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleActionWithIdentifier:*(void *)(a1 + 40) forNotification:*(void *)(a1 + 48) remoteNotification:*(void *)(a1 + 56) localNotification:*(void *)(a1 + 64)];
  uint64_t v2 = *(void *)(a1 + 72);

  return +[SPRemoteInterface didFinishHandlingActivity:v2];
}

void __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    uint64_t v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_cold_1();
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_545;
    void v22[3] = &unk_264598C20;
    uint64_t v14 = &v23;
    id v23 = a1[4];
    +[SPRemoteInterface handleEvent:v22];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_546;
    void v15[3] = &unk_264598F68;
    uint64_t v14 = &v16;
    id v16 = a1[5];
    id v17 = a1[6];
    id v18 = v11;
    id v19 = v9;
    id v20 = v10;
    id v21 = a1[4];
    +[SPRemoteInterface handleEvent:v15];
  }
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_545(uint64_t a1)
{
  return +[SPRemoteInterface didFinishHandlingActivity:*(void *)(a1 + 32)];
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_546(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleActionWithIdentifier:*(void *)(a1 + 40) forNotification:*(void *)(a1 + 48) remoteNotification:*(void *)(a1 + 56) localNotification:*(void *)(a1 + 64)];
  uint64_t v2 = *(void *)(a1 + 72);

  return +[SPRemoteInterface didFinishHandlingActivity:v2];
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_3(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:u"
                         "nNotification:handler:controller:]_block_invoke_3";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4111;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v3;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v4;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: on notifCenterDelegate %{public}@ with actionItemID %{public}@", buf, 0x26u);
  }

  int v5 = (void *)a1[4];
  uint64_t v6 = [getUNUserNotificationCenterClass() currentNotificationCenter];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  __int16 v7 = (void *)getUNNotificationResponseClass_softClass;
  uint64_t v14 = getUNNotificationResponseClass_softClass;
  if (!getUNNotificationResponseClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUNNotificationResponseClass_block_invoke;
    *(void *)&buf[24] = &unk_264598A90;
    *(void *)&buf[32] = &v11;
    __getUNNotificationResponseClass_block_invoke((uint64_t)buf);
    __int16 v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  id v9 = objc_msgSend(v8, "responseWithNotification:actionIdentifier:", a1[6], a1[5], v11);
  [v5 userNotificationCenter:v6 didReceiveNotificationResponse:v9 withCompletionHandler:&__block_literal_global_551];

  return +[SPRemoteInterface didFinishHandlingActivity:a1[7]];
}

- (void)rootInterfaceController:(id)a3 performActionWithItemID:(id)a4 forNotificationID:(id)a5 userInfo:(id)a6 clientIdentifier:(id)a7 completionHandler:(id)a8
{
  id v31 = a3;
  id v32 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(void))a8;
  id v15 = a6;
  uint64_t v16 = [v15 objectForKeyedSubscript:@"nC"];
  id v17 = [v15 objectForKeyedSubscript:@"nD"];
  id v18 = [v15 objectForKeyedSubscript:@"nUD"];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x263F08928];
    getUNNotificationClass();
    id v34 = 0;
    id v20 = [v19 unarchivedObjectOfClass:objc_opt_class() fromData:v18 error:&v34];
    id v21 = v34;
    if (!v20)
    {
      uint64_t v22 = wk_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:]();
      }
    }
  }
  if (v17)
  {
    id v33 = 0;
    id v23 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v33];
    id v24 = v33;
    int v25 = v31;
    if (!v23)
    {
      id v26 = wk_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SPRemoteInterface rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:]();
      }
    }
  }
  else
  {
    id v23 = 0;
    int v25 = v31;
  }
  BOOL v27 = v32;
  if (!v16)
  {
    id v28 = [0 request];
    id v29 = [v28 content];
    uint64_t v16 = [v29 userInfo];

    BOOL v27 = v32;
  }
  id v30 = [(SPRemoteInterface *)self _interfaceControllerWithID:v25];
  if (![(SPRemoteInterface *)self _handleAction:v27 forNotification:v13 remoteNotificationContext:v16 localNotification:v23 unNotification:0 handler:0 controller:v30])[(SPRemoteInterface *)self _handleAction:v27 forNotification:v13 remoteNotificationContext:v16 localNotification:v23 unNotification:0 handler:v30 controller:v30]; {
  if (v14)
  }
    v14[2](v14);
}

- (void)getComplicationData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[SPRemoteInterface getComplicationData:]";
    __int16 v9 = 1024;
    int v10 = 4391;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SPRemoteInterface_getComplicationData___block_invoke;
  v6[3] = &unk_264598C20;
  void v6[4] = self;
  spUtils_dispatchAsyncToMainThread(v6);
}

uint64_t __41__SPRemoteInterface_getComplicationData___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v3, "getComplicationData:");
  }
  return result;
}

- (void)_fillDataWithRandom:(id)a3 length:(int64_t)a4
{
  id v5 = a3;
  if ((_fillDataWithRandom_length__inited & 1) == 0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    srand(v6);
    _fillDataWithRandom_length__inited = 1;
  }
  int64_t v7 = a4 + 3;
  if (a4 >= 0) {
    int64_t v7 = a4;
  }
  if (a4 >= 4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7 >> 2;
    do
    {
      int v10 = 0;
      int v10 = rand();
      objc_msgSend(v5, "replaceBytesInRange:withBytes:", v8, 4, &v10);
      v8 += 4;
      --v9;
    }
    while (v9);
  }
}

- (id)controllerMethods:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  unsigned int outCount = 0;
  Class = object_getClass(v3);
  double v6 = class_copyMethodList(Class, &outCount);
  if (v6)
  {
    int64_t v7 = v6;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        SEL Name = 0;
        SEL Name = method_getName(v7[i]);
        uint64_t v9 = [MEMORY[0x263F08D40] valueWithBytes:&Name objCType:":"];
        [v4 addObject:v9];
      }
    }
    free(v7);
  }

  return v4;
}

- (SPRemoteInterfaceDataDelegateProtocol)dataDelegate
{
  return self->_dataDelegate;
}

- (void)setDataDelegate:(id)a3
{
}

- (NSMutableArray)activeComplicationsConnections
{
  return self->_activeComplicationsConnections;
}

- (void)setActiveComplicationsConnections:(id)a3
{
}

- (id)runLoopObserver
{
  return self->_runLoopObserver;
}

- (void)setRunLoopObserver:(id)a3
{
}

- (NSMutableDictionary)interfaceControllers
{
  return self->_interfaceControllers;
}

- (void)setInterfaceControllers:(id)a3
{
}

- (NSMutableDictionary)interfaceControllersOwners
{
  return self->_interfaceControllersOwners;
}

- (void)setInterfaceControllersOwners:(id)a3
{
}

- (NSMutableSet)missingInterfaceControllers
{
  return self->_missingInterfaceControllers;
}

- (void)setMissingInterfaceControllers:(id)a3
{
}

- (OS_dispatch_queue)interfaceControllersAccessQueue
{
  return self->_interfaceControllersAccessQueue;
}

- (void)setInterfaceControllersAccessQueue:(id)a3
{
}

- (NSString)rootViewControllerID
{
  return self->_rootViewControllerID;
}

- (void)setRootViewControllerID:(id)a3
{
}

- (NSString)navigatingViewControllerID
{
  return self->_navigatingViewControllerID;
}

- (void)setNavigatingViewControllerID:(id)a3
{
}

- (NSString)appClientIdentifier
{
  return self->_appClientIdentifier;
}

- (void)setAppClientIdentifier:(id)a3
{
}

- (id)textInputCompletion
{
  return self->_textInputCompletion;
}

- (void)setTextInputCompletion:(id)a3
{
}

- (id)textInputSuggestions
{
  return self->_textInputSuggestions;
}

- (void)setTextInputSuggestions:(id)a3
{
}

- (id)mediaPlayerControllerCompletion
{
  return self->_mediaPlayerControllerCompletion;
}

- (void)setMediaPlayerControllerCompletion:(id)a3
{
}

- (id)audioRecorderControllerCompletion
{
  return self->_audioRecorderControllerCompletion;
}

- (void)setAudioRecorderControllerCompletion:(id)a3
{
}

- (NSMutableArray)openParentRequests
{
  return self->_openParentRequests;
}

- (void)setOpenParentRequests:(id)a3
{
}

- (NSBundle)extensionBundle
{
  return self->_extensionBundle;
}

- (void)setExtensionBundle:(id)a3
{
}

- (id)addPassesCompletion
{
  return self->_addPassesCompletion;
}

- (void)setAddPassesCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_addPassesCompletion, 0);
  objc_storeStrong((id *)&self->_extensionBundle, 0);
  objc_storeStrong((id *)&self->_openParentRequests, 0);
  objc_storeStrong(&self->_audioRecorderControllerCompletion, 0);
  objc_storeStrong(&self->_mediaPlayerControllerCompletion, 0);
  objc_storeStrong(&self->_textInputSuggestions, 0);
  objc_storeStrong(&self->_textInputCompletion, 0);
  objc_storeStrong((id *)&self->_appClientIdentifier, 0);
  objc_storeStrong((id *)&self->_navigatingViewControllerID, 0);
  objc_storeStrong((id *)&self->_rootViewControllerID, 0);
  objc_storeStrong((id *)&self->_interfaceControllersAccessQueue, 0);
  objc_storeStrong((id *)&self->_missingInterfaceControllers, 0);
  objc_storeStrong((id *)&self->_interfaceControllersOwners, 0);
  objc_storeStrong((id *)&self->_interfaceControllers, 0);
  objc_storeStrong(&self->_runLoopObserver, 0);
  objc_storeStrong((id *)&self->_activeComplicationsConnections, 0);

  objc_storeStrong((id *)&self->_dataDelegate, 0);
}

void __38__SPRemoteInterface__remoteIdentifier__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:->ComD unable to find Gizmo app identifier in Info.plist", v2, v3, v4, v5, 2u);
}

void __36__SPRemoteInterface_initWithBundle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Initializing data delegate: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupSignal:handler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v3[7] = 567;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_2211F3000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: *** Could not set up signal handler for %d.", (uint8_t *)v3, 0x18u);
}

- (void)sendData:clientIdentifiers:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
}

- (void)sendData:clientIdentifiers:reply:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 623;
  _os_log_debug_impl(&dword_2211F3000, v0, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ComF:->ComD", (uint8_t *)v1, 0x12u);
}

- (void)sendPlist:clientIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: spPlistWithDictionary failed", v2, v3, v4, v5, 2u);
}

- (void)sendPlist:clientIdentifiers:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to serialize data", v2, v3, v4, v5, 2u);
}

- (void)_requestTimingData:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: ERROR: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
}

- (void)fetchNotificationForNotificationID:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Failed to unarchive localNotificationArchivedData: %{public}@", v2, v3, v4, v5, 2u);
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Failed to unarchive unnData: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)updateUserActivity:userInfo:webpageURL:controller:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)sendCacheRequestMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to serialize data", v2, v3, v4, v5, 2u);
}

- (void)sendCacheRequestMessage:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
}

+ (void)sendCacheRequest:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error: not implemented", v2, v3, v4, v5, 2u);
}

- (void)controller:pushInterfaceController:initializationContextID:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controllerPop:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controllerPopToRoot:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controllerBecomeCurrentPage:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controller:presentInterfaceController:initializationContextID:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controller:presentInterfaceControllers:initializationContextIDs:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controllerDismiss:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
}

- (void)controllerPresentTextInputController:allowedInputMode:suggestions:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)controllerDismissTextInputController:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)controllerPresentAddPassesController:passes:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)controllerDismissAddPassesController:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)didFinishHandlingActivity:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)notificationController:showNotificationInterfaceType:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
}

- (void)_tellApplicationThatInterfaceControllerCantBeFound:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Unable to connect to host to send gotUnknownInterfaceController: for %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_interfaceControllerWithID:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 136446978;
  *(void *)(a3 + 4) = "-[SPRemoteInterface _interfaceControllerWithID:]";
  *(_WORD *)(a3 + 12) = 1024;
  OUTLINED_FUNCTION_6(a1, (uint64_t)a2, a3);
  _os_log_error_impl(&dword_2211F3000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%d: ComF: interfaceController for interfaceControllerID:%{public}@ not found (clientIdentifier=%{public}@)", v4, 0x26u);
}

- (void)_interfaceControllerID:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 136446978;
  *(void *)(a3 + 4) = "-[SPRemoteInterface _interfaceControllerID:]";
  *(_WORD *)(a3 + 12) = 1024;
  OUTLINED_FUNCTION_6(a1, (uint64_t)a2, a3);
  _os_log_error_impl(&dword_2211F3000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%d: ComF: interfaceControllerID for controller:%{public}@ not found (clientIdentifier=%{public}@)", v4, 0x26u);
}

- (void)_interfaceControllerClientIDForControllerID:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF: clientIdentifier for interfaceControllerID:%{public}@ not found", v2, v3, v4, v5, 2u);
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 32) count];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7(&dword_2211F3000, v1, v2, "%{public}s:%d: %lu interfaceControllers", v3, v4, v5, v6, 2u);
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(*(void *)a1 + 32) count];
  [*(id *)(*(void *)a1 + 40) count];
  *(_DWORD *)uint64_t v6 = 136446978;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v6[7] = 2527;
  v6[9] = 2048;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_2211F3000, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: *********** ERROR interfaceControllers.count %lu != interfaceControllersOwners.count %lu", (uint8_t *)v6, 0x26u);
}

- (void)receiveData:fromIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: failed to initialize protoPlist", v2, v3, v4, v5, 2u);
}

- (void)handleProtoPlist:fromIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: failed to deserialize dictionary", v2, v3, v4, v5, 2u);
}

- (void)handlePlistDictionary:(void *)a1 fromIdentifier:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7(&dword_2211F3000, v3, v4, "%{public}s:%d: Sending message to debug console: \"%@\"", v5, v6, v7, v8, 2u);
}

- (void)handlePlistDictionary:fromIdentifier:.cold.2()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:->Plugin method %{public}@ is not implemented by the controller %{public}@", v2);
}

- (void)handlePlistDictionary:fromIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: ComF:->Plugin method %{public}@ has wrong parameter type", v2, v3, v4, v5, 2u);
}

- (void)handlePlistDictionary:fromIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Ignoring request to activate view controller with and empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
}

- (void)handlePlistDictionary:fromIdentifier:.cold.5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Ignoring request to deactivate view controller with and empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
}

- (void)handlePlistDictionary:fromIdentifier:.cold.6()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: userActivity %{public}@ should be of type NSDictionary", v2, v3, v4, v5, 2u);
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Critical failure. Simulating crash: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Couldn't instantiate class %{public}@", v2, v3, v4, v5, 2u);
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Critical failure. Simulating crash: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}@ is not a subclass of WKInterfaceController", v2, v3, v4, v5, 2u);
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_516_cold_1()
{
  LODWORD(v2) = 136446978;
  *(void *)((char *)&v2 + 4) = "-[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDes"
                                 "criptions:clientIdentifier:]_block_invoke";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error fetching notification context for notification with ID %{public}@: %{public}@", v2);
}

- (void)activateViewController:clientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Ignoring request for empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
}

- (void)deactivateViewController:clientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Ignoring request for empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
}

void __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Failed to unarchive unNotificationKeyedArchive: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:.cold.1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getUNNotificationDefaultActionIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPRemoteInterface.m", 94, @"%s", dlerror());

  __break(1u);
}

void __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Got error %{public}@", v2, v3, v4, v5, 2u);
}

- (void)rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Failed to unarchive a UILocalNotification: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Failed to unarchive a UNNotification: %{public}@", v2, v3, v4, v5, 2u);
}

@end