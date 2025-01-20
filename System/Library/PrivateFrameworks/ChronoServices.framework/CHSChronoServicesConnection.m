@interface CHSChronoServicesConnection
+ (CHSChronoServicesConnection)sharedInstance;
+ (id)ncBridgeConnection;
+ (void)_debugRestartServer;
- (BOOL)reloadRemoteWidgetsWithError:(id *)a3;
- (BOOL)reloadTimeline:(id)a3 error:(id *)a4;
- (BOOL)remoteWidgetsEnabled;
- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)unpairDevice:(id)a3 error:(id *)a4;
- (CHSChronoServicesConnection)init;
- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4;
- (id)_filterExtensions:(id)a3 toOptions:(id)a4;
- (id)_initWithMachServiceName:(id)a3 listenForReconnect:(BOOL)a4;
- (id)_queue_remoteTargetCreatingConnectionIfNecessary:(BOOL)a3;
- (id)_subscribeToActivityService;
- (id)_subscribeToExtensions;
- (id)_subscribeToRemoteDevices;
- (id)_subscribeToTimelineEntryRelevance;
- (id)_subscribeToWidgetRelevance;
- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)allPairedDevices;
- (id)cachedExtensionsWithOptions:(id)a3;
- (id)subscribeToActivityPayloadUpdates:(id *)a3;
- (id)subscribeToExtensions:(id *)a3 fromClient:(id)a4 withOptions:(id)a5 outExtensions:(id *)a6;
- (id)subscribeToRemoteDevices:(id *)a3 outRemoteDevices:(id *)a4;
- (id)subscribeToTimelineEntryRelevance:(id *)a3 outTimelineEntryRelevance:(id *)a4;
- (id)subscribeToWidgetRelevanceEvents:(id *)a3;
- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3;
- (void)_queue_addClient:(id)a3;
- (void)_queue_createConnection;
- (void)_queue_invalidateConnection;
- (void)_queue_notifyDevicesDidChange:(id)a3;
- (void)_queue_notifyDidReceiveActivityUpdate:(id)a3 payloadID:(id)a4;
- (void)_queue_notifyExtensionsDidChange:(id)a3 generatedWithOptions:(id)a4;
- (void)_queue_notifyHandleWidgetRelevanceEvent:(id)a3;
- (void)_queue_notifyTimelineEntryRelevanceDidChange:(id)a3;
- (void)_queue_removeClient:(id)a3;
- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5;
- (void)activityDidUpdate:(id)a3 payloadID:(id)a4;
- (void)addClient:(id)a3;
- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4;
- (void)flushPowerlog;
- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)handleWidgetRelevanceEvent:(id)a3;
- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5;
- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5;
- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7;
- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4;
- (void)nearbyDevicesDidChange:(id)a3;
- (void)pairDevice:(id)a3 completion:(id)a4;
- (void)performDescriptorDiscoveryForHost:(id)a3;
- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4;
- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5;
- (void)removeClient:(id)a3;
- (void)removeWidgetHost:(id)a3;
- (void)retryStuckRemotePairings;
- (void)setCachedExtensions:(id)a3 withProviderOptions:(id)a4;
- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4;
- (void)timelineEntryRelevanceDidChange:(id)a3;
- (void)updateWidgetHostActivationState:(id)a3;
- (void)updateWidgetHostConfigurations:(id)a3;
- (void)widgetExtensionsDidChange:(id)a3;
@end

@implementation CHSChronoServicesConnection

+ (void)_debugRestartServer
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F29038]);
  [v4 setLaunchPath:@"/usr/bin/killall"];
  [v4 setArguments:&unk_1EE0C1D88];
  [v4 launch];
  [v4 waitUntilExit];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3 = +[CHSChronoServicesConnection sharedInstance];
  dispatch_after(v2, v3[2], &__block_literal_global_4);
}

void __50__CHSChronoServicesConnection__debugRestartServer__block_invoke()
{
  id v1 = +[CHSChronoServicesConnection sharedInstance];
  id v0 = (id)objc_msgSend(v1, "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
}

+ (CHSChronoServicesConnection)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  }
  dispatch_time_t v2 = (void *)sharedInstance___sharedInstance_0;
  return (CHSChronoServicesConnection *)v2;
}

void __45__CHSChronoServicesConnection_sharedInstance__block_invoke()
{
  id v0 = [[CHSChronoServicesConnection alloc] _initWithMachServiceName:@"com.apple.chronoservices" listenForReconnect:1];
  id v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
}

+ (id)ncBridgeConnection
{
  if (ncBridgeConnection_onceToken != -1) {
    dispatch_once(&ncBridgeConnection_onceToken, &__block_literal_global_16);
  }
  dispatch_time_t v2 = (void *)ncBridgeConnection___sharedInstance;
  return v2;
}

void __49__CHSChronoServicesConnection_ncBridgeConnection__block_invoke()
{
  id v0 = [[CHSChronoServicesConnection alloc] _initWithMachServiceName:@"com.apple.chronoservices.chronodbridge" listenForReconnect:0];
  id v1 = (void *)ncBridgeConnection___sharedInstance;
  ncBridgeConnection___sharedInstance = (uint64_t)v0;
}

- (CHSChronoServicesConnection)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSChronoServicesConnection.m" lineNumber:114 description:@"use +sharedInstance"];

  return 0;
}

- (id)_initWithMachServiceName:(id)a3 listenForReconnect:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CHSChronoServicesConnection;
  v7 = [(CHSChronoServicesConnection *)&v66 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    machServiceName = v7->_machServiceName;
    v7->_machServiceName = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    queue_observers = v7->_queue_observers;
    v7->_queue_observers = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    queue_extensionProviderOptionsByClient = v7->_queue_extensionProviderOptionsByClient;
    v7->_queue_extensionProviderOptionsByClient = (NSMapTable *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesConnection", v14);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesConnection.call-out", v17);
    callOutQueue = v7->_callOutQueue;
    v7->_callOutQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    queue_widgetHostsByHostIdentifier = v7->_queue_widgetHostsByHostIdentifier;
    v7->_queue_widgetHostsByHostIdentifier = (NSMutableDictionary *)v20;

    v7->_serverStartupToken = -1;
    p_serverStartupToken = &v7->_serverStartupToken;
    if (!v4)
    {
LABEL_8:
      v26 = [CHSServerSubscription alloc];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_2;
      v62[3] = &unk_1E56C8AA0;
      v27 = v7;
      v63 = v27;
      uint64_t v28 = [(CHSServerSubscription *)v26 initWithIdentifier:@"extensions" serverSubscriptionBlock:v62];
      notQueue_extensionsSubscription = v27->_notQueue_extensionsSubscription;
      v27->_notQueue_extensionsSubscription = (CHSServerSubscription *)v28;

      v30 = [CHSServerSubscription alloc];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_3;
      v60[3] = &unk_1E56C8AA0;
      v31 = v27;
      v61 = v31;
      uint64_t v32 = [(CHSServerSubscription *)v30 initWithIdentifier:@"remoteDevices" serverSubscriptionBlock:v60];
      notQueue_remoteDevicesSubscription = v31->_notQueue_remoteDevicesSubscription;
      v31->_notQueue_remoteDevicesSubscription = (CHSServerSubscription *)v32;

      v34 = [CHSServerSubscription alloc];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_4;
      v58[3] = &unk_1E56C8AA0;
      v35 = v31;
      v59 = v35;
      uint64_t v36 = [(CHSServerSubscription *)v34 initWithIdentifier:@"timelineEntryRelevance" serverSubscriptionBlock:v58];
      notQueue_timelineEntryRelevanceSubscription = v35->_notQueue_timelineEntryRelevanceSubscription;
      v35->_notQueue_timelineEntryRelevanceSubscription = (CHSServerSubscription *)v36;

      v38 = [CHSServerSubscription alloc];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_5;
      v56[3] = &unk_1E56C8AA0;
      v39 = v35;
      v57 = v39;
      uint64_t v40 = [(CHSServerSubscription *)v38 initWithIdentifier:@"widgetRelevance" serverSubscriptionBlock:v56];
      notQueue_widgetRelevanceSubscription = v39->_notQueue_widgetRelevanceSubscription;
      v39->_notQueue_widgetRelevanceSubscription = (CHSServerSubscription *)v40;

      v42 = [CHSServerSubscription alloc];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_6;
      v54[3] = &unk_1E56C8AA0;
      v43 = v39;
      v55 = v43;
      uint64_t v44 = [(CHSServerSubscription *)v42 initWithIdentifier:@"activityService" serverSubscriptionBlock:v54];
      notQueue_activityServiceSubscription = v43->_notQueue_activityServiceSubscription;
      v43->_notQueue_activityServiceSubscription = (CHSServerSubscription *)v44;

      v46 = (void *)MEMORY[0x1E4F1CAD0];
      v47 = v31->_notQueue_remoteDevicesSubscription;
      v68[0] = v27->_notQueue_extensionsSubscription;
      v68[1] = v47;
      v48 = v39->_notQueue_widgetRelevanceSubscription;
      v68[2] = v35->_notQueue_timelineEntryRelevanceSubscription;
      v68[3] = v48;
      v68[4] = v43->_notQueue_activityServiceSubscription;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
      uint64_t v50 = [v46 setWithArray:v49];
      notQueue_subscriptions = v43->_notQueue_subscriptions;
      v43->_notQueue_subscriptions = (NSSet *)v50;

      goto LABEL_9;
    }
    v67[0] = 0;
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary)
    {
      v67[1] = MEMORY[0x1E4F143A8];
      v67[2] = 3221225472;
      v67[3] = __ProactiveSuggestionClientModelLibraryCore_block_invoke;
      v67[4] = &__block_descriptor_40_e5_v8__0l;
      v67[5] = v67;
      long long v69 = xmmword_1E56C8E58;
      uint64_t v70 = 0;
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary)
    {
      v23 = (void *)v67[0];
      if (!v67[0])
      {
LABEL_7:
        v24 = CHSChronodStartupNotification;
        v25 = v7->_queue;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke;
        handler[3] = &unk_1E56C8A78;
        v65 = v7;
        notify_register_dispatch(v24, p_serverStartupToken, v25, handler);

        goto LABEL_8;
      }
    }
    else
    {
      v53 = [MEMORY[0x1E4F28B00] currentHandler];
      p_serverStartupToken = [NSString stringWithUTF8String:"void *ProactiveSuggestionClientModelLibrary(void)"];
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", p_serverStartupToken, @"CHSChronoServicesConnection.m", 43, @"%s", v67[0]);

      __break(1u);
    }
    free(v23);
    goto LABEL_7;
  }
LABEL_9:

  return v7;
}

id __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToExtensions];
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToRemoteDevices];
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToTimelineEntryRelevance];
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToWidgetRelevance];
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToActivityService];
}

- (void)dealloc
{
  int serverStartupToken = self->_serverStartupToken;
  if (serverStartupToken != -1) {
    notify_cancel(serverStartupToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHSChronoServicesConnection;
  [(CHSChronoServicesConnection *)&v4 dealloc];
}

- (id)cachedExtensionsWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CHSChronoServicesConnection_cachedExtensionsWithOptions___block_invoke;
  block[3] = &unk_1E56C8AC8;
  dispatch_queue_t v15 = &v16;
  id v6 = v4;
  id v13 = v6;
  v14 = self;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v17 + 24))
  {
    v7 = [(CHSServerSubscription *)self->_notQueue_extensionsSubscription cachedValue];
    uint64_t v8 = [v7 extensions];
    v9 = [(CHSChronoServicesConnection *)self _filterExtensions:v8 toOptions:v6];
  }
  else
  {
    v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 description];
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "cachedExtensionsWithOptions: Not using cache for %{public}@", buf, 0xCu);
    }
    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __59__CHSChronoServicesConnection_cachedExtensionsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSubsetOf:*(void *)(*(void *)(a1 + 40) + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CHSChronoServicesConnection_addClient___block_invoke;
  v7[3] = &unk_1E56C81F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__CHSChronoServicesConnection_addClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addClient:", *(void *)(a1 + 40));
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CHSChronoServicesConnection_removeClient___block_invoke;
  v7[3] = &unk_1E56C81F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__CHSChronoServicesConnection_removeClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeClient:", *(void *)(a1 + 40));
}

- (id)subscribeToTimelineEntryRelevance:(id *)a3 outTimelineEntryRelevance:(id *)a4
{
  return [(CHSServerSubscription *)self->_notQueue_timelineEntryRelevanceSubscription subscribeWithResult:a4 error:a3];
}

- (id)subscribeToWidgetRelevanceEvents:(id *)a3
{
  return [(CHSServerSubscription *)self->_notQueue_widgetRelevanceSubscription subscribeWithResult:0 error:a3];
}

- (id)subscribeToActivityPayloadUpdates:(id *)a3
{
  return [(CHSServerSubscription *)self->_notQueue_activityServiceSubscription subscribeWithResult:0 error:a3];
}

- (id)allPairedDevices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = (id)MEMORY[0x1E4F1CBF0];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CHSChronoServicesConnection_allPairedDevices__block_invoke;
  v5[3] = &unk_1E56C8260;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_2();
  }

  id v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 allPairedDevices];
    uint64_t v6 = [v5 devices];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_1();
    }
  }
}

- (void)pairDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Pairing device %@", (uint8_t *)&v10, 0xCu);
  }

  id v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_2();
  }

  v5 = objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v6 = v5;
  if (v5)
  {
    [v5 pairDeviceWith:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (BOOL)unpairDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke;
  v11[3] = &unk_1E56C8AF0;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  id v14 = &v16;
  dispatch_queue_t v15 = &v20;
  dispatch_sync(queue, v11);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Unpairing device %@", buf, 0xCu);
  }

  id v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_2();
  }

  v5 = objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = [v5 unpairDeviceWith:v7 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] serverUnavailable];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v13 = CHSLogChronoServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_1();
    }
  }
}

- (id)subscribeToRemoteDevices:(id *)a3 outRemoteDevices:(id *)a4
{
  return [(CHSServerSubscription *)self->_notQueue_remoteDevicesSubscription subscribeWithResult:a4 error:a3];
}

- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  dispatch_queue_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke;
  v8[3] = &unk_1E56C8B18;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  v8[6] = &v14;
  dispatch_sync(queue, v8);
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v3 = "enabled";
    }
    else {
      uint64_t v3 = "disabled";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = v3;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Setting remote widgets to %s", buf, 0xCu);
  }

  id v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_2();
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  if (v5)
  {
    char v6 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v5 toggleRemoteWidgetsEnabled:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] serverUnavailable];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    char v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_1();
    }
  }
}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke;
  block[3] = &unk_1E56C85D8;
  void block[4] = self;
  block[5] = &v8;
  block[6] = &v12;
  dispatch_sync(queue, block);
  if (a3) {
    *a3 = (id) v13[5];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Reloading remote widgets", buf, 2u);
  }

  uint64_t v3 = CHSLogChronoServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_2();
  }

  id v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    char v7 = [v4 reloadRemoteWidgetsWithError:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] serverUnavailable];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    char v11 = CHSLogChronoServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_1();
    }
  }
}

- (BOOL)remoteWidgetsEnabled
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke;
  v5[3] = &unk_1E56C8260;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 remoteWidgetsEnabled];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_1();
    }
  }
}

- (void)flushPowerlog
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CHSChronoServicesConnection_flushPowerlog__block_invoke;
  block[3] = &unk_1E56C8238;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __44__CHSChronoServicesConnection_flushPowerlog__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    dispatch_time_t v2 = CHSLogChronoServices();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __44__CHSChronoServicesConnection_flushPowerlog__block_invoke_cold_1();
    }

    char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 0);
    id v4 = v3;
    if (v3) {
      [v3 flushPowerlog];
    }
  }
}

- (void)retryStuckRemotePairings
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke;
  block[3] = &unk_1E56C8238;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 retryStuckRemotePairings];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_1();
    }
  }
}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 modifyDescriptorEnablement:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)performDescriptorDiscoveryForHost:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke;
  v7[3] = &unk_1E56C81F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 performDescriptorDiscoveryForHost:*(void *)(a1 + 40)];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_1();
    }
  }
}

- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 reloadDescriptorsForContainerBundleIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 fetchDescriptorsForContainerBundleIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (BOOL)reloadTimeline:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke;
  block[3] = &unk_1E56C8B40;
  void block[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(id *)(v6 + 40);
    [v3 reloadTimeline:v5 error:&v12];
    id v7 = v12;
    id v8 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] serverUnavailable];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    char v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_1();
    }
  }
}

- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke;
  block[3] = &unk_1E56C8B68;
  id v10 = v4;
  char v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 widgetEnvironmentDataForBundleIdentifier:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke;
  v13[3] = &unk_1E56C8B90;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _URLSessionDidCompleteForExtensionWithBundleIdentifier:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

- (void)removeWidgetHost:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(a1 + 40) + 56) setObject:0 forKeyedSubscript:v2];
  char v3 = CHSLogChronoServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_2();
  }

  id v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 removeWidgetHostWithIdentifier:v2];
  }
  else
  {
    id v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)updateWidgetHostConfigurations:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
  char v3 = CHSLogChronoServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_2((uint64_t)v2, v3);
  }

  id v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) configuration];
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "activationState"));
    [v4 setWidgetConfiguration:v5 activationState:v6 forWidgetHostWithIdentifier:v2];
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_1((uint64_t)v2, v5, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)updateWidgetHostActivationState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
  char v3 = CHSLogChronoServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_2();
  }

  id v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "activationState"));
    [v4 setActivationState:v6 forWidgetHostWithIdentifier:v5];
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_1();
    }
  }
}

- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 allWidgetConfigurationsByHostWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 getAppIntentsXPCListenerEndpointForBundleIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
  }
}

- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke;
  v15[3] = &unk_1E56C8BB8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_2();
  }

  char v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 launchLiveActivityWithID:*(void *)(a1 + 40) deviceID:*(void *)(a1 + 48) url:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_1();
    }
  }
}

- (id)subscribeToExtensions:(id *)a3 fromClient:(id)a4 withOptions:(id)a5 outExtensions:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke;
  block[3] = &unk_1E56C8BE0;
  void block[4] = self;
  id v13 = v11;
  id v31 = v13;
  v33 = &v34;
  id v14 = v10;
  id v32 = v14;
  dispatch_sync(queue, block);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2;
  v28[4] = __Block_byref_object_dispose__2;
  notQueue_extensionsSubscription = self->_notQueue_extensionsSubscription;
  id v27 = 0;
  id v16 = [(CHSServerSubscription *)notQueue_extensionsSubscription subscribeWithResult:&v27 forcingServerUpdate:*((unsigned __int8 *)v35 + 24) error:a3];
  id v17 = v27;
  id v29 = v16;
  objc_initWeak(&location, v14);
  id v18 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v19 = [v18 UUIDString];

  id v20 = objc_alloc(MEMORY[0x1E4F4F838]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_69;
  v24[3] = &unk_1E56C8C58;
  v24[4] = self;
  objc_copyWeak(&v25, &location);
  v24[5] = v28;
  v21 = (void *)[v20 initWithIdentifier:v19 forReason:@"extensionSubscription" invalidationBlock:v24];
  if (a6)
  {
    id v22 = [v17 extensions];
    *a6 = [(CHSChronoServicesConnection *)self _filterExtensions:v22 toOptions:v13];
  }
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(&v34, 8);
  return v21;
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  char v3 = [*(id *)(a1 + 40) mergedWith:v2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 isEqual:v3] ^ 1;
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v3);
  id v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 description];
    uint64_t v6 = (void *)v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "Extension subscription updating options to %{public}@, forcing update %@", (uint8_t *)&v8, 0x16u);
  }
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_69(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_2;
  v4[3] = &unk_1E56C8C30;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v6;
  v4[6] = v3;
  dispatch_async(v2, v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Extension subscription count reduced; adjusting server subscription and publishing results.",
      buf,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:WeakRetained];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 48) count] != 0;
  id v4 = [[CHSWidgetExtensionProviderOptions alloc] initWithWidgetsPredicate:0 controlsPredicate:0 includeIntents:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v4;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v8)];
        id v4 = [(CHSWidgetExtensionProviderOptions *)v9 mergedWith:v10];

        ++v8;
        uint64_t v9 = v4;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v4);
  id v11 = CHSLogChronoServices();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(CHSWidgetExtensionProviderOptions *)v4 description];
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEFAULT, "Extension subscription updating options to %{public}@", buf, 0xCu);
  }
  id v13 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_71;
  block[3] = &unk_1E56C8C08;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v13, block);
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_71(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1[5] + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v4 = *(void **)(a1[4] + 96);
    id v15 = 0;
    id v5 = [v4 updateSubscription:&v15];
    id v6 = v15;
    uint64_t v7 = [v5 extensions];
    uint64_t v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v9;
      _os_log_impl(&dword_190C6F000, v8, OS_LOG_TYPE_DEFAULT, "Extension subscription new extension count: %lu", buf, 0xCu);
    }

    uint64_t v10 = a1[4];
    id v11 = *(NSObject **)(v10 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_72;
    block[3] = &unk_1E56C81F0;
    void block[4] = v10;
    id v14 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

uint64_t __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyExtensionsDidChange:generatedWithOptions:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64));
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke;
  v23[3] = &unk_1E56C8C80;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_2();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 loadSuggestedWidget:*(void *)(a1 + 40) metrics:*(void *)(a1 + 48) stackIdentifier:*(void *)(a1 + 56) reason:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_1();
    }
  }
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_2();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  if (v3)
  {
    id v4 = +[CHSArrayBox boxedValue:*(void *)(a1 + 40)];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_75;
    void v6[3] = &unk_1E56C8CA8;
    id v7 = *(id *)(a1 + 48);
    [v3 suggestionBudgetsForStackIdentifiers:v4 completion:v6];

    id v5 = v7;
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_1();
    }
  }
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 value];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);
}

- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__2;
  id v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke;
  block[3] = &unk_1E56C8CD0;
  void block[4] = self;
  id v18 = &v26;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v19 = &v20;
  dispatch_sync(queue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_2();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = 0;
    uint64_t v8 = [v3 acquireKeepAliveAssertionForExtensionBundleIdentifier:v5 reason:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = CHSLogChronoServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_1();
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] serverUnavailable];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke;
  v15[3] = &unk_1E56C8CF8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 reloadWidgetRelevanceForExtensionIdentifier:*(void *)(a1 + 40) kind:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke;
  v15[3] = &unk_1E56C8CF8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 invalidateRelevancesOfKind:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke;
  v15[3] = &unk_1E56C8CF8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    [v3 acquireLifetimeAssertionForWidget:*(void *)(a1 + 40) metrics:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] serverUnavailable];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)timelineEntryRelevanceDidChange:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v5 = [v4 timelineRelevanceEntries];
  [(CHSServerSubscription *)self->_notQueue_timelineEntryRelevanceSubscription setCachedValue:v5];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CHSChronoServicesConnection_timelineEntryRelevanceDidChange___block_invoke;
  v8[3] = &unk_1E56C81F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __63__CHSChronoServicesConnection_timelineEntryRelevanceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyTimelineEntryRelevanceDidChange:", *(void *)(a1 + 40));
}

- (void)widgetExtensionsDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v5 = [v4 sequenceNumber];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  uint64_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  uint64_t v6 = CHSLogChronoServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 extensions];
    uint64_t v8 = [v7 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = v8;
    _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "Received extensions box sequence %lu, with %lu extensions", buf, 0x16u);
  }
  notQueue_extensionsSubscription = self->_notQueue_extensionsSubscription;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke;
  v15[3] = &unk_1E56C8D20;
  id v17 = &v19;
  uint64_t v18 = v5;
  id v10 = v4;
  id v16 = v10;
  [(CHSServerSubscription *)notQueue_extensionsSubscription updateCachedValue:v15];
  if (v20[5])
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke_78;
    v12[3] = &unk_1E56C8B68;
    v12[4] = self;
    id v14 = &v19;
    id v13 = v10;
    dispatch_async(queue, v12);
  }
  _Block_object_dispose(&v19, 8);
}

id __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 48);
  if (v4 <= [v3 sequenceNumber])
  {
    id v9 = CHSLogChronoServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v13 = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_190C6F000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring stale extensions box change %lu", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v8 = v3;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) extensions];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v11 = v8;

  return v11;
}

void __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke_78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) options];
  objc_msgSend(v2, "_queue_notifyExtensionsDidChange:generatedWithOptions:", v1);
}

- (void)handleWidgetRelevanceEvent:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CHSChronoServicesConnection_handleWidgetRelevanceEvent___block_invoke;
  v7[3] = &unk_1E56C81F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__CHSChronoServicesConnection_handleWidgetRelevanceEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyHandleWidgetRelevanceEvent:", *(void *)(a1 + 40));
}

- (void)nearbyDevicesDidChange:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v5 = [v4 devices];
  [(CHSServerSubscription *)self->_notQueue_remoteDevicesSubscription setCachedValue:v5];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CHSChronoServicesConnection_nearbyDevicesDidChange___block_invoke;
  v8[3] = &unk_1E56C81F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __54__CHSChronoServicesConnection_nearbyDevicesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDevicesDidChange:", *(void *)(a1 + 40));
}

- (void)activityDidUpdate:(id)a3 payloadID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CHSChronoServicesConnection_activityDidUpdate_payloadID___block_invoke;
  block[3] = &unk_1E56C83C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __59__CHSChronoServicesConnection_activityDidUpdate_payloadID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidReceiveActivityUpdate:payloadID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_notifyDevicesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v4 count];
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of %lu remote devices changed.", buf, 0xCu);
  }

  id v6 = (void *)[(NSHashTable *)self->_queue_observers copy];
  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CHSChronoServicesConnection__queue_notifyDevicesDidChange___block_invoke;
  v10[3] = &unk_1E56C81F0;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(callOutQueue, v10);
}

void __61__CHSChronoServicesConnection__queue_notifyDevicesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "nearbyDevicesDidChange:", *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_queue_notifyExtensionsDidChange:(id)a3 generatedWithOptions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  long long v8 = (void *)[(NSHashTable *)self->_queue_observers copy];
  long long v9 = CHSLogChronoServices();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 count];
    uint64_t v11 = [v6 count];
    uint64_t v12 = [v7 description];
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_190C6F000, v9, OS_LOG_TYPE_DEFAULT, "Notifying %lu clients of %lu widget extensions changed for opt %@.", buf, 0x20u);
  }
  id v13 = (void *)[(NSMapTable *)self->_queue_extensionProviderOptionsByClient copy];
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__CHSChronoServicesConnection__queue_notifyExtensionsDidChange_generatedWithOptions___block_invoke;
  block[3] = &unk_1E56C8D48;
  id v20 = v8;
  id v21 = v13;
  id v22 = v7;
  uint64_t v23 = self;
  id v24 = v6;
  id v15 = v6;
  id v16 = v7;
  id v17 = v13;
  id v18 = v8;
  dispatch_async(callOutQueue, block);
}

void __85__CHSChronoServicesConnection__queue_notifyExtensionsDidChange_generatedWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v2)
  {
    uint64_t v16 = *(void *)v18;
    *(void *)&long long v3 = 134218242;
    long long v14 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v17 + 1) + 8 * v4);
        if (objc_opt_respondsToSelector())
        {
          id v6 = [*(id *)(a1 + 40) objectForKey:v5];
          id v7 = v6;
          if (*(void *)(a1 + 48) && !objc_msgSend(v6, "isSubsetOf:"))
          {
            long long v8 = CHSLogChronoServices();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = [v7 description];
              *(_DWORD *)buf = v14;
              id v22 = v5;
              __int16 v23 = 2114;
              uint64_t v24 = (uint64_t)v12;
              _os_log_impl(&dword_190C6F000, v8, OS_LOG_TYPE_DEFAULT, "Not notifying client:%p because options don't match, wanted %{public}@", buf, 0x16u);
            }
          }
          else
          {
            long long v8 = objc_msgSend(*(id *)(a1 + 56), "_filterExtensions:toOptions:", *(void *)(a1 + 64), v7, v14);
            long long v9 = CHSLogChronoServices();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v10 = [v8 count];
              uint64_t v11 = [v7 description];
              *(_DWORD *)buf = 134218498;
              id v22 = v5;
              __int16 v23 = 2048;
              uint64_t v24 = v10;
              __int16 v25 = 2114;
              uint64_t v26 = v11;
              _os_log_impl(&dword_190C6F000, v9, OS_LOG_TYPE_DEFAULT, "Notifying client:%p of %lu widget extensions changed, opts: %{public}@.", buf, 0x20u);
            }
            [v5 widgetExtensionsDidChange:v8];
          }
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v13 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
      uint64_t v2 = v13;
    }
    while (v13);
  }
}

- (id)_filterExtensions:(id)a3 toOptions:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke;
  v31[3] = &unk_1E56C8D70;
  id v22 = v5;
  id v32 = v22;
  long long v19 = objc_msgSend(a3, "bs_filter:", v31);
  id v21 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v19;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [v9 orderedWidgetDescriptors];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_2;
        v25[3] = &unk_1E56C8288;
        id v11 = v22;
        id v26 = v11;
        uint64_t v12 = objc_msgSend(v10, "bs_filter:", v25);

        uint64_t v13 = [v9 orderedControlDescriptors];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_3;
        v23[3] = &unk_1E56C88E0;
        id v24 = v11;
        long long v14 = objc_msgSend(v13, "bs_filter:", v23);

        id v15 = (void *)[v9 mutableCopy];
        [v15 setOrderedWidgetDescriptors:v12];
        [v15 setOrderedControlDescriptors:v14];
        uint64_t v16 = (void *)[v15 copy];
        [v21 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  long long v17 = (void *)[v21 copy];
  return v17;
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesExtension:a2];
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesWidgetDescriptor:a2];
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesControlDescriptor:a2];
}

- (void)_queue_notifyTimelineEntryRelevanceDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  id v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v4 count];
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of %lu timeline entry relevance sets changed.", buf, 0xCu);
  }

  uint64_t v6 = (void *)[(NSHashTable *)self->_queue_observers copy];
  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CHSChronoServicesConnection__queue_notifyTimelineEntryRelevanceDidChange___block_invoke;
  v10[3] = &unk_1E56C81F0;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(callOutQueue, v10);
}

void __76__CHSChronoServicesConnection__queue_notifyTimelineEntryRelevanceDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "timelineEntryRelevanceDidChange:", *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_queue_notifyHandleWidgetRelevanceEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 description];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v6;
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of widget relevance event %@", buf, 0xCu);
  }
  long long v7 = (void *)[(NSHashTable *)self->_queue_observers copy];
  callOutQueue = self->_callOutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CHSChronoServicesConnection__queue_notifyHandleWidgetRelevanceEvent___block_invoke;
  v11[3] = &unk_1E56C81F0;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(callOutQueue, v11);
}

void __71__CHSChronoServicesConnection__queue_notifyHandleWidgetRelevanceEvent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "handleWidgetRelevanceEvent:", *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_queue_notifyDidReceiveActivityUpdate:(id)a3 payloadID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  long long v8 = CHSLogChronoServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_190C6F000, v8, OS_LOG_TYPE_DEFAULT, "Notifying of activity update %@ payload ID %@", buf, 0x16u);
  }

  long long v9 = (void *)[(NSHashTable *)self->_queue_observers copy];
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CHSChronoServicesConnection__queue_notifyDidReceiveActivityUpdate_payloadID___block_invoke;
  block[3] = &unk_1E56C83C8;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  dispatch_async(callOutQueue, block);
}

void __79__CHSChronoServicesConnection__queue_notifyDidReceiveActivityUpdate_payloadID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "activityDidUpdate:payloadID:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)_queue_remoteTargetCreatingConnectionIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    long long v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "Creating connection", v9, 2u);
    }

    [(CHSChronoServicesConnection *)self _queue_invalidateConnection];
    [(CHSChronoServicesConnection *)self _queue_createConnection];
    uint64_t v5 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  }
  return v5;
}

- (void)_queue_createConnection
{
  BSDispatchQueueAssert();
  if (!self->_queue_connection)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F50BB8];
    machServiceName = self->_machServiceName;
    uint64_t v5 = +[CHSChronoWidgetServiceSpecification identifier];
    BOOL v6 = [v3 endpointForMachName:machServiceName service:v5 instance:0];

    long long v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
    queue_connection = self->_queue_connection;
    self->_queue_connection = v7;

    long long v9 = self->_queue_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke;
    v10[3] = &unk_1E56C86D0;
    void v10[4] = self;
    [(BSServiceConnection *)v9 configureConnection:v10];
    [(BSServiceConnection *)self->_queue_connection activate];
  }
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CHSChronoWidgetServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = +[CHSChronoWidgetServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2;
  v8[3] = &unk_1E56C8D98;
  v8[4] = *(void *)(a1 + 32);
  [v3 setActivationHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_5;
  v7[3] = &unk_1E56C8D98;
  void v7[4] = *(void *)(a1 + 32);
  [v3 setInterruptionHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_100;
  void v6[3] = &unk_1E56C8D98;
  void v6[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection activated", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_96;
  block[3] = &unk_1E56C81F0;
  void block[4] = v5;
  id v7 = v3;
  id v32 = v7;
  dispatch_async(v6, block);
  if ([*(id *)(*(void *)(a1 + 32) + 96) resubscribeIfNecessary])
  {
    long long v8 = [*(id *)(*(void *)(a1 + 32) + 96) cachedValue];
    long long v9 = [v8 extensions];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v10 + 16);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_97;
    v29[3] = &unk_1E56C81F0;
    v29[4] = v10;
    id v30 = v9;
    id v12 = v9;
    dispatch_async(v11, v29);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 112) resubscribeIfNecessary])
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 112) cachedValue];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(NSObject **)(v14 + 16);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3;
    v27[3] = &unk_1E56C81F0;
    v27[4] = v14;
    id v28 = v13;
    id v16 = v13;
    dispatch_async(v15, v27);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 104) resubscribeIfNecessary])
  {
    id v17 = [*(id *)(*(void *)(a1 + 32) + 104) cachedValue];
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(NSObject **)(v18 + 16);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_4;
    id v24 = &unk_1E56C81F0;
    uint64_t v25 = v18;
    id v26 = v17;
    id v20 = v17;
    dispatch_async(v19, &v21);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "resubscribeIfNecessary", v21, v22, v23, v24, v25);
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_96(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v5];
        id v7 = [*(id *)(a1 + 40) remoteTarget];
        long long v8 = [v6 configuration];
        long long v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "activationState"));
        [v7 setWidgetConfiguration:v8 activationState:v9 forWidgetHostWithIdentifier:v5];
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v2);
  }
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_97(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyExtensionsDidChange:generatedWithOptions:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64));
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDevicesDidChange:", *(void *)(a1 + 40));
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyTimelineEntryRelevanceDidChange:", *(void *)(a1 + 40));
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection interrupted", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_99;
  block[3] = &unk_1E56C8238;
  void block[4] = v3;
  dispatch_async(v4, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "noteConnectionTerminated", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_99(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_100(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3_101;
  block[3] = &unk_1E56C8238;
  void block[4] = v2;
  dispatch_async(v3, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) noteConnectionTerminated];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v8 = CHSLogChronoServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_190C6F000, v8, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection invalidated", v9, 2u);
  }
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3_101(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

- (void)_queue_invalidateConnection
{
  BSDispatchQueueAssert();
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    [(BSServiceConnection *)queue_connection invalidate];
    id v4 = self->_queue_connection;
    self->_queue_connection = 0;
  }
}

- (void)_queue_addClient:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssert();
  id v5 = v7;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CHSChronoServicesConnection.m", 1062, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_queue_observers addObject:v5];
}

- (void)_queue_removeClient:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssert();
  id v5 = v7;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CHSChronoServicesConnection.m", 1069, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_queue_observers removeObject:v5];
  [(NSMapTable *)self->_queue_extensionProviderOptionsByClient removeObjectForKey:v7];
}

- (void)setCachedExtensions:(id)a3 withProviderOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[CHSWidgetExtensionsBox alloc] initWithExtensions:v6 generatedFrom:v7];
  [(CHSServerSubscription *)self->_notQueue_extensionsSubscription setCachedValue:v8];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CHSChronoServicesConnection_setCachedExtensions_withProviderOptions___block_invoke;
  v11[3] = &unk_1E56C81F0;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_sync(queue, v11);
}

void __71__CHSChronoServicesConnection_setCachedExtensions_withProviderOptions___block_invoke(uint64_t a1)
{
}

- (id)_subscribeToExtensions
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  long long v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke;
  void v6[3] = &unk_1E56C8260;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_2(a1, v2);
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_111;
    v10[3] = &unk_1E56C8DC0;
    objc_copyWeak(&v11, &location);
    void v10[4] = *(void *)(a1 + 40);
    [v3 subscribeToExtensionsWithProviderOptions:v4 completion:v10];
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) value];
      __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_1(v6, buf, v5);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "Completing extensions task failed; unable to obtain the remote target",
        buf,
        2u);
    }

    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = [MEMORY[0x1E4F28C58] serverUnavailable];
    [v8 setError:v9];
  }
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_111(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAssertion:v8];
      uint64_t v11 = [v7 sequenceNumber];
      id v12 = CHSLogChronoServices();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [v7 extensions];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        uint64_t v19 = [v13 count];
        _os_log_impl(&dword_190C6F000, v12, OS_LOG_TYPE_DEFAULT, "Subscription initial extensions box sequence %lu, with %lu extensions", (uint8_t *)&v16, 0x16u);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValue:v7];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setError:v9];
    }
    else if (v9)
    {
      uint64_t v14 = CHSLogChronoServices();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [v9 description];
        __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_111_cold_1(v15, (uint8_t *)&v16, v14);
      }
    }
  }
}

- (id)_subscribeToTimelineEntryRelevance
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke;
  void v6[3] = &unk_1E56C8260;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_113;
    v9[3] = &unk_1E56C8DE8;
    v9[4] = *(void *)(a1 + 40);
    [v3 subscribeToTimelineEntryRelevance:v9];
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "acquire relevance timeline monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    [v6 setError:v7];
  }
}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_113(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAssertion:v7];
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = [v11 timelineRelevanceEntries];
  [v9 setValue:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setError:v8];
}

- (id)_subscribeToRemoteDevices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke;
  void v6[3] = &unk_1E56C8260;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_115;
    v9[3] = &unk_1E56C8E10;
    v9[4] = *(void *)(a1 + 40);
    [v3 subscribeToRemoteDevices:v9];
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "acquire device monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    [v6 setError:v7];
  }
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_115(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAssertion:v7];
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = [v11 devices];
  [v9 setValue:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setError:v8];
}

- (id)_subscribeToWidgetRelevance
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke;
  void v6[3] = &unk_1E56C8260;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_117;
    v9[3] = &unk_1E56C8E38;
    v9[4] = *(void *)(a1 + 40);
    [v3 subscribeToWidgetRelevance:v9];
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "acquire widget relevance monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    [v6 setError:v7];
  }
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAssertion:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setError:v5];
}

- (id)_subscribeToActivityService
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke;
  void v6[3] = &unk_1E56C8260;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke(uint64_t a1)
{
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_cold_1();
  }

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_119;
    v9[3] = &unk_1E56C8E38;
    v9[4] = *(void *)(a1 + 40);
    [v3 subscribeToActivityPayloadUpdates:v9];
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "acquire widget relevance monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [MEMORY[0x1E4F28C58] serverUnavailable];
    [v6 setError:v7];
  }
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAssertion:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setError:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notQueue_activityServiceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_widgetRelevanceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_remoteDevicesSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_timelineEntryRelevanceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_extensionsSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_subscriptions, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue_currentExtensionSubscriptionProviderOptions, 0);
  objc_storeStrong((id *)&self->_queue_widgetHostsByHostIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_extensionProviderOptionsByClient, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "fetch all devices failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: allDevices", v2, v3, v4, v5, v6);
}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "pairing device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: pairDevice", v2, v3, v4, v5, v6);
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "unpair device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: unpairDevice", v2, v3, v4, v5, v6);
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "toggle remote widgets failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: toggleRemoteWidgetsOn", v2, v3, v4, v5, v6);
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "reload remote widgets failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: reloadRemoteWidgetsWithError", v2, v3, v4, v5, v6);
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "remoteWidgetsEnabled failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: remoteWidgetsEnabled", v2, v3, v4, v5, v6);
}

void __44__CHSChronoServicesConnection_flushPowerlog__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: flushPowerlog", v2, v3, v4, v5, v6);
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "retry stuck remote pairings failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: retryStuckRemotePairings", v2, v3, v4, v5, v6);
}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "perform modifyDescriptorEnablement failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: modifyDescriptorEnablement", v2, v3, v4, v5, v6);
}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "perform descriptor discovery failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: performDescriptorDiscovery", v2, v3, v4, v5, v6);
}

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "notifying server to reload descriptors failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: reloadDescriptorsIfNecessaryForContainerBundleIdentifier", v2, v3, v4, v5, v6);
}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "notifying server to fetch descriptors if necessary failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: fetchDescriptorsForContainerBundleIdentifier", v2, v3, v4, v5, v6);
}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "reloading timeline failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: reloadTimeline:", v2, v3, v4, v5, v6);
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: widgetEnvironmentDataForBundleIdentifier", v2, v3, v4, v5, v6);
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Completing NSURLSession task failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: _URLSessionDidCompleteForExtensionWithBundleIdentifier", v2, v3, v4, v5, v6);
}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: removeWidgetHostWithIdentifier", v2, v3, v4, v5, v6);
}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_190C6F000, a2, OS_LOG_TYPE_DEBUG, "xpc: setWidgetConfiguration with identifier=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Setting host activation state failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: setWidgetHostActivationState:forWidgetHostWithIdentifier:", v2, v3, v4, v5, v6);
}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Fetching widget configurations by host failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: allWidgetConfigurationsByHostWithCompletion", v2, v3, v4, v5, v6);
}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Fetching AppIntents XPC listener endpoint by host failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: getAppIntentsXPCListenerEndpointForBundleIdentifier", v2, v3, v4, v5, v6);
}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Launching app for remote Live Activity on device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: launchLiveActivityWithIDdeviceID", v2, v3, v4, v5, v6);
}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Loading suggested widget failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: loadSuggestedWidget", v2, v3, v4, v5, v6);
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Loading suggested budgets for stack identifiers failed; unable to obtain remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: suggestionBudgetsForStackIdentifiers", v2, v3, v4, v5, v6);
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "acquire keep alive assertion failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireKeepAliveAssertionWithError", v2, v3, v4, v5, v6);
}

void __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: reloadWidgetRelevance", v2, v3, v4, v5, v6);
}

void __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: invalidateRelevancesOfKind:inBundle:completion:", v2, v3, v4, v5, v6);
}

void __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireLifetimeAssertionForWidget:metrics:completion:", v2, v3, v4, v5, v6);
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_190C6F000, log, OS_LOG_TYPE_DEBUG, "xpc: extensions subscription - result: %@", buf, 0xCu);
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_190C6F000, a2, OS_LOG_TYPE_DEBUG, "xpc: extension subscription - options=%{public}@", (uint8_t *)&v3, 0xCu);
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_111_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Subscription resulted in error %{public}@", buf, 0xCu);
}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireRelevanceMonitorAssertion", v2, v3, v4, v5, v6);
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireDeviceMonitorAssertion", v2, v3, v4, v5, v6);
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireWidgetRelevanceMonitorAssertion", v2, v3, v4, v5, v6);
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_190C6F000, v0, v1, "xpc: acquireActivityServiceMonitorAssertion", v2, v3, v4, v5, v6);
}

@end