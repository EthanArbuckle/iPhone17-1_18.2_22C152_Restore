@interface BMDistributedContextService
+ (id)distributedContextManager;
+ (id)stringForIDSDeviceType:(int64_t)a3;
- (BMDistributedContextEventTranslation)eventTranslator;
- (BMDistributedContextService)init;
- (BMDistributedContextSubscriptionManager)subscriptionManager;
- (BMDistributedContextSubscriptionStorage)subscriptionStorage;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)rebootNotificationDelivered;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6 withError:(id *)a7;
- (BOOL)registerRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6;
- (BOOL)sendIDSMessageWithContent:(id)a3 asWaking:(BOOL)a4 toDevice:(id)a5 error:(id *)a6;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDevices:(id)a5 withError:(id *)a6;
- (BOOL)unregisterRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 forDevices:(id)a5;
- (IDSService)internetService;
- (IDSService)localService;
- (NSMutableDictionary)lockedUpdates;
- (NSMutableDictionary)subscriptionSinks;
- (NSString)deviceUUID;
- (NSUserDefaults)subscriptionDefaults;
- (NSXPCListener)listener;
- (OS_dispatch_queue)biomeQueue;
- (OS_dispatch_queue)idsQueue;
- (OS_dispatch_queue)queue;
- (id)devicesWithDeviceType:(int64_t)a3;
- (id)idsDeviceForDeviceUUID:(id)a3;
- (id)registerSinkWithIdentifier:(id)a3 withDSL:(id)a4;
- (void)assertLocalSubscriptionsToDevice:(id)a3 shouldSendIfNoSubscriptions:(BOOL)a4;
- (void)cancelSubscriptionForIdentifier:(id)a3;
- (void)connection:(id)a3 devicesChanged:(id)a4;
- (void)contextChanged:(id)a3 forSubscriptionWithIdentifier:(id)a4;
- (void)handleIncomingContextChangeMessage:(id)a3 forDevice:(id)a4;
- (void)initializeSinksForRemoteDSLIdentifiers;
- (void)loadSubscriptions;
- (void)logMetricsForMessage:(id)a3 andContext:(id)a4 fromDevice:(id)a5;
- (void)logMetricsForSubscription:(id)a3 uponReboot:(BOOL)a4;
- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withErrorHandler:(id)a8;
- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withErrorHandler:(id)a8;
- (void)removeAllSubscriptionsForDeadRemoteDevice:(id)a3;
- (void)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4;
- (void)saveRemoteSubscription:(id)a3 fromDevice:(id)a4;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setBiomeQueue:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setEventTranslator:(id)a3;
- (void)setIdsQueue:(id)a3;
- (void)setInternetService:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocalService:(id)a3;
- (void)setLockedUpdates:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRebootNotificationDelivered:(BOOL)a3;
- (void)setSubscriptionDefaults:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setSubscriptionSinks:(id)a3;
- (void)setSubscriptionStorage:(id)a3;
- (void)subscribeToBiomeWithRemoteDSL:(id)a3 forRemoteIdentifier:(id)a4;
- (void)teardownOneOffSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4;
- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withErrorHandler:(id)a7;
- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withErrorHandler:(id)a7;
- (void)updateSubscriptionsAfterUnlock;
@end

@implementation BMDistributedContextService

- (BMDistributedContextService)init
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)BMDistributedContextService;
  v2 = [(BMDistributedContextService *)&v33 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.biome.ContextSync"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.contextsync.subscriptions"];
    subscriptionDefaults = v2->_subscriptionDefaults;
    v2->_subscriptionDefaults = (NSUserDefaults *)v5;

    v7 = [[BMDistributedContextUserDefaultStorage alloc] initWithUserDefault:v2->_subscriptionDefaults];
    subscriptionStorage = v2->_subscriptionStorage;
    v2->_subscriptionStorage = (BMDistributedContextSubscriptionStorage *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.contextsync.queue", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.contextsync.idsQueue", v12);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.contextSync.receiverQueue", v15);
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.contextsync"];
    internetService = v2->_internetService;
    v2->_internetService = (IDSService *)v18;

    [(IDSService *)v2->_internetService addDelegate:v2 queue:v2->_idsQueue];
    uint64_t v20 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.contextsync.local"];
    localService = v2->_localService;
    v2->_localService = (IDSService *)v20;

    [(IDSService *)v2->_localService addDelegate:v2 queue:v2->_idsQueue];
    v22 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__BMDistributedContextService_init__block_invoke;
    block[3] = &unk_26455C350;
    v23 = v2;
    v32 = v23;
    dispatch_sync(v22, block);
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      deviceUUID = v23->_deviceUUID;
      *(_DWORD *)buf = 138412290;
      v35 = deviceUUID;
      _os_log_impl(&dword_2201A2000, v24, OS_LOG_TYPE_DEFAULT, "Local device %@", buf, 0xCu);
    }

    v26 = [[BMDistributedContextEventTranslation alloc] initWithLocalDeviceIdentifier:v23->_deviceUUID];
    eventTranslator = v23->_eventTranslator;
    v23->_eventTranslator = v26;

    uint64_t v28 = objc_opt_new();
    subscriptionSinks = v23->_subscriptionSinks;
    v23->_subscriptionSinks = (NSMutableDictionary *)v28;

    [(BMDistributedContextService *)v23 loadSubscriptions];
    [(NSXPCListener *)v2->_listener activate];
  }
  return v2;
}

uint64_t __35__BMDistributedContextService_init__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = IDSCopyLocalDeviceUniqueID();
  return MEMORY[0x270F9A758]();
}

+ (id)distributedContextManager
{
  if (distributedContextManager_onceToken != -1) {
    dispatch_once(&distributedContextManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)distributedContextManager_distributedContextManager;
  return v2;
}

uint64_t __56__BMDistributedContextService_distributedContextManager__block_invoke()
{
  distributedContextManager_distributedContextManager = objc_alloc_init(BMDistributedContextService);
  return MEMORY[0x270F9A758]();
}

- (void)loadSubscriptions
{
  uint64_t v3 = (void *)os_transaction_create();
  v4 = [(BMDistributedContextService *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke;
  block[3] = &unk_26455C350;
  void block[4] = self;
  dispatch_sync(v4, block);

  if (![(BMDistributedContextService *)self rebootNotificationDelivered])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke_44;
    v5[3] = &unk_26455C350;
    v5[4] = self;
    [MEMORY[0x263F61E30] runBlockWhenDeviceIsClassCUnlocked:v5];
  }
}

void __48__BMDistributedContextService_loadSubscriptions__block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2201A2000, v2, OS_LOG_TYPE_INFO, "Load Context Sync Subscriptions", buf, 2u);
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) stringForKey:@"lastBootUUID"];
  v4 = +[BMDistributedContextUtilities currentBootSessionUUID];
  int v5 = [v4 isEqualToString:v3];
  if ([MEMORY[0x263F61E30] isUnlocked]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [MEMORY[0x263F61E30] isClassCLocked] ^ 1;
  }
  v7 = +[BMDistributedContextSubscriptionManager loadFromStorage:*(void *)(*(void *)(a1 + 32) + 56) withLocalDeviceID:*(void *)(*(void *)(a1 + 32) + 40)];
  [*(id *)(a1 + 32) setSubscriptionManager:v7];

  [*(id *)(a1 + 32) initializeSinksForRemoteDSLIdentifiers];
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    id v9 = [v8 subscriptionDefaults];
    objc_msgSend(*(id *)(a1 + 32), "setRebootNotificationDelivered:", objc_msgSend(v9, "BOOLForKey:", @"rebootNotificationDelivered"));
  }
  else
  {
    unsigned int v45 = v6;
    int v42 = v5;
    v43 = v4;
    v44 = v3;
    dispatch_queue_t v10 = (void *)v8[8];
    v11 = [v8 deviceUUID];
    v12 = [v10 subscriptionsWithSubscribingDevice:v11];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v9 = v12;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v9);
          }
          v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v18 = [v17 dsl];

          if (v18)
          {
            [*(id *)(a1 + 32) logMetricsForSubscription:v17 uponReboot:1];
          }
          else
          {
            v19 = __biome_log_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = [v17 identifier];
              v21 = [*(id *)(a1 + 32) deviceUUID];
              *(_DWORD *)buf = 138412546;
              v56 = v20;
              __int16 v57 = 2112;
              v58 = v21;
              _os_log_error_impl(&dword_2201A2000, v19, OS_LOG_TYPE_ERROR, "Failed to log identifier %@ on device %@: No DSL found", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v14);
    }

    v22 = *(void **)(a1 + 32);
    v23 = (void *)v22[8];
    v24 = [v22 deviceUUID];
    [v23 removeAllSubscriptionsMadeBySubscribingDevice:v24];

    uint64_t v6 = v45;
    if (v45)
    {
      v25 = [BMDistributedContextSubscribeMessage alloc];
      v26 = [(BMDistributedContextSubscribeMessage *)v25 initWithSubscriptions:MEMORY[0x263EFFA68] localDevice:*(void *)(*(void *)(a1 + 32) + 40) messageIntent:6];
      v27 = [*(id *)(*(void *)(a1 + 32) + 64) deviceIdentifiersWithActiveSubscriptions];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v63 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            if (([v32 isEqualToString:*(void *)(*(void *)(a1 + 32) + 40)] & 1) == 0)
            {
              objc_super v33 = *(void **)(a1 + 32);
              v34 = [(BMDistributedContextSubscribeMessage *)v26 dictionaryRepresentation];
              uint64_t v46 = 0;
              [v33 sendIDSMessageWithContent:v34 asWaking:0 toDevice:v32 error:&v46];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v63 count:16];
        }
        while (v29);
      }
      [*(id *)(a1 + 32) setRebootNotificationDelivered:1];

      int v5 = v42;
      uint64_t v6 = v45;
    }
    else
    {
      [*(id *)(a1 + 32) setRebootNotificationDelivered:0];
      int v5 = v42;
    }
    v35 = [*(id *)(a1 + 32) subscriptionDefaults];
    objc_msgSend(v35, "setBool:forKey:", objc_msgSend(*(id *)(a1 + 32), "rebootNotificationDelivered"), @"rebootNotificationDelivered");

    v4 = v43;
    uint64_t v3 = v44;
  }

  uint64_t v36 = __biome_log_for_category();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [NSNumber numberWithBool:v5 ^ 1u];
    v38 = [NSNumber numberWithBool:v6];
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
    v40 = [*(id *)(*(void *)(a1 + 32) + 64) allSubscriptions];
    *(_DWORD *)buf = 138413058;
    v56 = v37;
    __int16 v57 = 2112;
    v58 = v38;
    __int16 v59 = 2112;
    v60 = v39;
    __int16 v61 = 2112;
    v62 = v40;
    _os_log_impl(&dword_2201A2000, v36, OS_LOG_TYPE_DEFAULT, "Rebooted %@, unlocked %@, delivered notifications %@, reloaded subscriptions %@", buf, 0x2Au);
  }
  v41 = [*(id *)(a1 + 32) subscriptionDefaults];
  [v41 setObject:v4 forKey:@"lastBootUUID"];
}

void __48__BMDistributedContextService_loadSubscriptions__block_invoke_44(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke_2;
  block[3] = &unk_26455C350;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

uint64_t __48__BMDistributedContextService_loadSubscriptions__block_invoke_2(uint64_t a1)
{
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2201A2000, v2, OS_LOG_TYPE_DEFAULT, "Device has class C unlocked", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateSubscriptionsAfterUnlock];
}

- (void)initializeSinksForRemoteDSLIdentifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribedDevice:self->_deviceUUID];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        dispatch_queue_t v10 = objc_msgSend(v9, "identifier", v15);
        v11 = [(NSMutableDictionary *)self->_subscriptionSinks objectForKeyedSubscript:v10];

        if (!v11)
        {
          v12 = [v9 dsl];
          uint64_t v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_impl(&dword_2201A2000, v13, OS_LOG_TYPE_INFO, "Recreating sink for %@", buf, 0xCu);
          }

          uint64_t v14 = [(BMDistributedContextService *)self registerSinkWithIdentifier:v10 withDSL:v12];
          [(NSMutableDictionary *)self->_subscriptionSinks setObject:v14 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)updateSubscriptionsAfterUnlock
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_rebootNotificationDelivered)
  {
    uint64_t v3 = [(BMDistributedContextService *)self subscriptionDefaults];
    uint64_t v4 = [v3 objectForKey:@"lockedUpdates"];

    if (v4 && [(BMDistributedContextSubscribeMessage *)v4 count])
    {
      long long v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v4;
        _os_log_impl(&dword_2201A2000, v5, OS_LOG_TYPE_DEFAULT, "Class C Unlocked: Notifying stored context changes %@", buf, 0xCu);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v30 = v4;
      uint64_t v6 = v4;
      uint64_t v7 = [(BMDistributedContextSubscribeMessage *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            v12 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithIdentifier:v11 subscribedToDevice:self->_deviceUUID];
            if ([v12 count])
            {
              uint64_t v13 = [(BMDistributedContextSubscribeMessage *)v6 objectForKeyedSubscript:v11];
              uint64_t v14 = [[BMDistributedContextContextChangedMessage alloc] initWithMessageDictionary:v13];
              if (v14)
              {
                [(BMDistributedContextService *)self contextChanged:v14 forSubscriptionWithIdentifier:v11];
              }
              else
              {
                long long v15 = __biome_log_for_category();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v43 = v13;
                  _os_log_error_impl(&dword_2201A2000, v15, OS_LOG_TYPE_ERROR, "Could not build context changed message from locked update %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v8 = [(BMDistributedContextSubscribeMessage *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v8);
      }

      long long v16 = [MEMORY[0x263EFF9A0] dictionary];
      [(BMDistributedContextService *)self setLockedUpdates:v16];

      long long v17 = [(BMDistributedContextService *)self subscriptionDefaults];
      [v17 removeObjectForKey:@"lockedUpdates"];

      uint64_t v4 = v30;
    }
    long long v18 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager deviceIdentifiersWithActiveSubscriptions];
    long long v19 = [BMDistributedContextSubscribeMessage alloc];
    uint64_t v20 = [(BMDistributedContextSubscribeMessage *)v19 initWithSubscriptions:MEMORY[0x263EFFA68] localDevice:self->_deviceUUID messageIntent:6];
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v20;
      _os_log_impl(&dword_2201A2000, v21, OS_LOG_TYPE_DEFAULT, "Class C Unlocked: Sending empty subscription for local device %@", buf, 0xCu);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v22 = v18;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          if (([v27 isEqualToString:self->_deviceUUID] & 1) == 0)
          {
            uint64_t v28 = [(BMDistributedContextSubscribeMessage *)v20 dictionaryRepresentation];
            uint64_t v31 = 0;
            [(BMDistributedContextService *)self sendIDSMessageWithContent:v28 asWaking:0 toDevice:v27 error:&v31];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v24);
    }

    [(BMDistributedContextService *)self setRebootNotificationDelivered:1];
    uint64_t v29 = [(BMDistributedContextService *)self subscriptionDefaults];
    objc_msgSend(v29, "setBool:forKey:", -[BMDistributedContextService rebootNotificationDelivered](self, "rebootNotificationDelivered"), @"rebootNotificationDelivered");
  }
}

- (id)registerSinkWithIdentifier:(id)a3 withDSL:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x263F2A758];
  id v8 = a4;
  uint64_t v9 = (void *)[[v7 alloc] initWithIdentifier:v6 targetQueue:self->_biomeQueue];
  dispatch_queue_t v10 = [v8 subscribeOn:v9];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke;
  v16[3] = &unk_26455C378;
  id v17 = v6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_48;
  v14[3] = &unk_26455C3C8;
  v14[4] = self;
  id v15 = v17;
  id v11 = v17;
  v12 = [v10 sinkWithCompletion:v16 receiveInput:v14];

  [(NSMutableDictionary *)self->_subscriptionSinks setObject:v12 forKeyedSubscript:v11];
  return v12;
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 state])
  {
    uint64_t v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_cold_1(a1, v3);
    }
  }
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 80) translateEvent:v3];
  uint64_t v5 = [v4 streamIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 eventData];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v4 eventDataVersion];

      if (v9)
      {
        dispatch_queue_t v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v3 eventBody];
          *(_DWORD *)buf = 138412290;
          id v22 = v11;
          _os_log_impl(&dword_2201A2000, v10, OS_LOG_TYPE_DEFAULT, "New event: %@", buf, 0xCu);
        }
        v12 = [[BMDistributedContextContextChangedMessage alloc] initWithSubscriptionIdentifier:*(void *)(a1 + 40) translatedEvent:v4 messageIntent:GetMessageIntentFromDistributedContextClientIdentifier(*(void **)(a1 + 40))];
        char v13 = [*(id *)(a1 + 32) rebootNotificationDelivered];
        uint64_t v14 = [*(id *)(a1 + 32) queue];
        if (v13)
        {
          id v15 = v19;
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          long long v16 = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_50;
        }
        else
        {
          id v15 = v20;
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          long long v16 = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_49;
        }
        v15[2] = v16;
        v15[3] = &unk_26455C3A0;
        long long v18 = *(void **)(a1 + 40);
        v15[4] = *(void *)(a1 + 32);
        v15[5] = v12;
        v15[6] = v18;
        id v17 = v12;
        dispatch_sync(v14, v15);

        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_48_cold_1();
  }
LABEL_13:
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_49(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) lockedUpdates];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) subscriptionDefaults];
    uint64_t v4 = [v3 objectForKey:@"lockedUpdates"];

    if (v4)
    {
      uint64_t v5 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v6 = (void *)v5;
    [*(id *)(a1 + 32) setLockedUpdates:v5];
  }
  uint64_t v7 = [*(id *)(a1 + 40) dictionaryRepresentation];
  id v8 = [*(id *)(a1 + 32) lockedUpdates];
  [v8 setObject:v7 forKey:*(void *)(a1 + 48)];

  uint64_t v9 = [*(id *)(a1 + 32) subscriptionDefaults];
  dispatch_queue_t v10 = [*(id *)(a1 + 32) lockedUpdates];
  [v9 setObject:v10 forKey:@"lockedUpdates"];

  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [*(id *)(a1 + 32) lockedUpdates];
    int v13 = 138412290;
    uint64_t v14 = v12;
    _os_log_impl(&dword_2201A2000, v11, OS_LOG_TYPE_DEFAULT, "Class C Locked: Stored updates are now %@", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_50(uint64_t a1)
{
  return [*(id *)(a1 + 32) contextChanged:*(void *)(a1 + 40) forSubscriptionWithIdentifier:*(void *)(a1 + 48)];
}

- (void)subscribeToBiomeWithRemoteDSL:(id)a3 forRemoteIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(BMDistributedContextService *)self registerSinkWithIdentifier:v7 withDSL:v6];
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v10 = [v6 rootStreamIdentifiers];
    id v11 = [v6 streamPublishers];
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_2201A2000, v9, OS_LOG_TYPE_DEFAULT, "Subscribed to Biome with %@, stream identifiers are %@, publishers are %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)removeAllSubscriptionsForDeadRemoteDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribingDevice:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138412290;
    long long v14 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "identifier", v14);
        [(BMDistributedContextService *)self removeSubscriptionWithIdentifier:v11 fromSubscribingDevice:v4];
        int v12 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscribingDevicesForIdentifier:v11 subscribedToDevice:self->_deviceUUID];
        if (![v12 count])
        {
          id v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v11;
            _os_log_impl(&dword_2201A2000, v13, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", buf, 0xCu);
          }

          [(BMDistributedContextService *)self cancelSubscriptionForIdentifier:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)cancelSubscriptionForIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2201A2000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing identifier %@ from Biome", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [(NSMutableDictionary *)self->_subscriptionSinks objectForKeyedSubscript:v4];
  long long v7 = v6;
  if (v6)
  {
    [v6 cancel];
    [(NSMutableDictionary *)self->_subscriptionSinks setObject:0 forKeyedSubscript:v4];
  }
  else
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMDistributedContextService cancelSubscriptionForIdentifier:]();
    }
  }
}

- (void)assertLocalSubscriptionsToDevice:(id)a3 shouldSendIfNoSubscriptions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v7 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribedDevice:v6];
  if ([v7 count]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    int v9 = [[BMDistributedContextSubscribeMessage alloc] initWithSubscriptions:v7 localDevice:self->_deviceUUID messageIntent:1];
    id v10 = [(BMDistributedContextSubscribeMessage *)v9 dictionaryRepresentation];
    uint64_t v11 = 0;
    [(BMDistributedContextService *)self sendIDSMessageWithContent:v10 asWaking:[(BMDistributedContextSubscribeMessage *)v9 shouldWake] toDevice:v6 error:&v11];
  }
}

- (void)saveRemoteSubscription:(id)a3 fromDevice:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v53 = objc_opt_new();
  BOOL v8 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  int v9 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribingDevice:v7];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v62 + 1) + 8 * i) identifier];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v11);
  }
  id v52 = v7;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v50 = v6;
  obuint64_t j = [v6 subscriptions];
  uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        subscriptionManager = self->_subscriptionManager;
        v21 = [v19 identifier];
        uint64_t v22 = [v19 subscribingDevice];
        uint64_t v23 = [v19 subscribedDevice];
        uint64_t v24 = [(BMDistributedContextSubscriptionManager *)subscriptionManager subscriptionForIdentifier:v21 fromSubscribingDevice:v22 onSubscribedDevice:v23];

        if (([v24 isEqual:v19] & 1) == 0)
        {
          uint64_t v25 = __biome_log_for_category();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v52;
            __int16 v70 = 2112;
            v71 = v19;
            _os_log_impl(&dword_2201A2000, v25, OS_LOG_TYPE_DEFAULT, "Updated existing subscription from remote %@: %@", buf, 0x16u);
          }

          [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager removeSubscription:v24];
          v26 = [v24 identifier];
          [(BMDistributedContextService *)self cancelSubscriptionForIdentifier:v26];

          v27 = [v19 dsl];
          uint64_t v28 = [v19 identifier];
          [(BMDistributedContextService *)self subscribeToBiomeWithRemoteDSL:v27 forRemoteIdentifier:v28];

          uint64_t v29 = self->_subscriptionManager;
          v67 = v19;
          uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
          [(BMDistributedContextSubscriptionManager *)v29 addSubscriptions:v30];
        }
        uint64_t v31 = [v19 identifier];
        [v53 addObject:v31];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v16);
  }

  long long v32 = __biome_log_for_category();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v8;
    _os_log_impl(&dword_2201A2000, v32, OS_LOG_TYPE_DEFAULT, "existingSubscriptions %@", buf, 0xCu);
  }

  long long v33 = __biome_log_for_category();
  long long v34 = v52;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v53;
    _os_log_impl(&dword_2201A2000, v33, OS_LOG_TYPE_DEFAULT, "activeSubscriptions %@", buf, 0xCu);
  }

  [v8 minusSet:v53];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v35 = v8;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        [(BMDistributedContextService *)self removeSubscriptionWithIdentifier:v40 fromSubscribingDevice:v34];
        v41 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscribingDevicesForIdentifier:v40 subscribedToDevice:self->_deviceUUID];
        if (![v41 count])
        {
          int v42 = __biome_log_for_category();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v40;
            _os_log_impl(&dword_2201A2000, v42, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", buf, 0xCu);
          }

          [(BMDistributedContextService *)self cancelSubscriptionForIdentifier:v40];
          long long v34 = v52;
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v37);
  }

  v43 = __biome_log_for_category();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager allSubscriptions];
    *(_DWORD *)buf = 138412546;
    v69 = v34;
    __int16 v70 = 2112;
    v71 = v44;
    _os_log_impl(&dword_2201A2000, v43, OS_LOG_TYPE_DEFAULT, "Updated all subscriptions from remote %@: %@", buf, 0x16u);
  }
  uint64_t v45 = [v50 subscriptions];
  if (!v45
    || (uint64_t v46 = (void *)v45,
        [v50 subscriptions],
        long long v47 = objc_claimAutoreleasedReturnValue(),
        uint64_t v48 = [v47 count],
        v47,
        v46,
        !v48))
  {
    long long v49 = __biome_log_for_category();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v34;
      _os_log_impl(&dword_2201A2000, v49, OS_LOG_TYPE_DEFAULT, "Subscription has no subscriptions meaning it is an unsubscribe, re-asserting subscriptions targetting subscribed device %@", buf, 0xCu);
    }

    [(BMDistributedContextService *)self assertLocalSubscriptionsToDevice:v34 shouldSendIfNoSubscriptions:0];
  }
}

- (void)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2201A2000, v8, OS_LOG_TYPE_DEFAULT, "unsubscribing from subscription %@ made by subscribing device %@", (uint8_t *)&v9, 0x16u);
  }

  [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager removeSubscriptionWithIdentifier:v6 fromSubscribingDevice:v7 onSubscribedDevice:self->_deviceUUID];
}

- (void)contextChanged:(id)a3 forSubscriptionWithIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v23 = v7;
  [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithIdentifier:v7 subscribedToDevice:self->_deviceUUID];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 configuration];
        long long v14 = [v13 wakeState];
        uint64_t v15 = [v14 integerValue] & 1;

        uint64_t v16 = [v6 dictionaryRepresentation];
        uint64_t v17 = [v12 subscribingDevice];
        id v25 = 0;
        LODWORD(v15) = [(BMDistributedContextService *)self sendIDSMessageWithContent:v16 asWaking:v15 toDevice:v17 error:&v25];
        id v18 = v25;

        if (v15)
        {
          long long v19 = [v12 configuration];
          uint64_t v20 = [v19 oneOffSubscription];
          int v21 = [v20 BOOLValue];

          if (v21)
          {
            uint64_t v22 = [v12 subscribingDevice];
            [(BMDistributedContextService *)self teardownOneOffSubscriptionWithIdentifier:v23 fromSubscribingDevice:v22];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
}

- (BOOL)registerRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v34 = a4;
  id v9 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v30 = v9;
    obuint64_t j = v9;
    uint64_t v37 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v37)
    {
      char v33 = 0;
      int v39 = 0;
      uint64_t v36 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = *(BMDistributedContextSubscription **)(*((void *)&v41 + 1) + 8 * i);
          id v12 = [(BMDistributedContextService *)self idsDeviceForDeviceUUID:v11];
          if (v12)
          {
            uint64_t v13 = [BMDistributedContextSubscriptionConfiguration alloc];
            long long v14 = [MEMORY[0x263EFF910] now];
            uint64_t v15 = [(BMDistributedContextSubscriptionConfiguration *)v13 initWithOptions:a5 lastChangedDate:v14];

            uint64_t v16 = [[BMDistributedContextSubscription alloc] initWithIdentifier:v34 dsl:v35 subscribingDevice:self->_deviceUUID subscribedDevice:v11 configuration:v15];
            uint64_t v17 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionForIdentifier:v34 fromSubscribingDevice:self->_deviceUUID onSubscribedDevice:v11];
            uint64_t v38 = v12;
            if ([v17 isEqual:v16])
            {
              id v18 = __biome_log_for_category();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v47 = v16;
                _os_log_impl(&dword_2201A2000, v18, OS_LOG_TYPE_DEFAULT, "Subscription %@ is unchanged, but we will re-assert it's existence to the subscribed device", buf, 0xCu);
              }
            }
            else if (v17)
            {
              [(BMDistributedContextService *)self logMetricsForSubscription:v17 uponReboot:0];
              [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager removeSubscription:v17];
            }
            subscriptionManager = self->_subscriptionManager;
            uint64_t v45 = v16;
            char v33 = 1;
            uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
            [(BMDistributedContextSubscriptionManager *)subscriptionManager addSubscriptions:v20];

            int v21 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribedDevice:v11];
            uint64_t v22 = [[BMDistributedContextSubscribeMessage alloc] initWithSubscriptions:v21 localDevice:self->_deviceUUID messageIntent:1];
            uint64_t v23 = +[BMDistributedContextService distributedContextManager];
            uint64_t v24 = [(BMDistributedContextSubscribeMessage *)v22 dictionaryRepresentation];
            uint64_t v25 = [(BMDistributedContextSubscribeMessage *)v22 shouldWake];
            uint64_t v40 = 0;
            v39 |= [v23 sendIDSMessageWithContent:v24 asWaking:v25 toDevice:v11 error:&v40];

            id v12 = v38;
          }
          else
          {
            uint64_t v15 = __biome_log_for_category();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v47 = v11;
              _os_log_error_impl(&dword_2201A2000, v15, OS_LOG_TYPE_ERROR, "Could not find: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v37);
    }
    else
    {
      char v33 = 0;
      LOBYTE(v39) = 0;
    }

    long long v27 = __biome_log_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager allSubscriptions];
      *(_DWORD *)buf = 138412290;
      long long v47 = v28;
      _os_log_impl(&dword_2201A2000, v27, OS_LOG_TYPE_DEFAULT, "Updated subscription for local: %@", buf, 0xCu);
    }
    char v26 = v33 & v39;
    id v9 = v30;
  }
  else
  {
    char v26 = 0;
  }

  return v26 & 1;
}

- (BOOL)unregisterRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 forDevices:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v8)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v29 = v8;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      int v33 = 0;
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        uint64_t v30 = v10;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
          uint64_t v15 = [(BMDistributedContextService *)self idsDeviceForDeviceUUID:v14];
          if (v15)
          {
            uint64_t v16 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionForIdentifier:v7 fromSubscribingDevice:self->_deviceUUID onSubscribedDevice:v14];
            if (v16)
            {
              [(BMDistributedContextService *)self logMetricsForSubscription:v16 uponReboot:0];
              [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager removeSubscriptionWithIdentifier:v7 fromSubscribingDevice:self->_deviceUUID onSubscribedDevice:v14];
              uint64_t v17 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscriptionsWithSubscribedDevice:v14];
              id v18 = [[BMDistributedContextSubscribeMessage alloc] initWithSubscriptions:v17 localDevice:self->_deviceUUID messageIntent:6];
              +[BMDistributedContextService distributedContextManager];
              long long v32 = v15;
              long long v19 = self;
              uint64_t v20 = v12;
              uint64_t v22 = v21 = v7;
              uint64_t v23 = [(BMDistributedContextSubscribeMessage *)v18 dictionaryRepresentation];
              uint64_t v24 = [(BMDistributedContextSubscribeMessage *)v18 shouldWake];
              uint64_t v34 = 0;
              v33 |= [v22 sendIDSMessageWithContent:v23 asWaking:v24 toDevice:v14 error:&v34];

              id v7 = v21;
              uint64_t v12 = v20;
              self = v19;
              uint64_t v15 = v32;

              uint64_t v10 = v30;
              char v11 = 1;
            }
            else
            {
              uint64_t v17 = __biome_log_for_category();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v40 = v7;
                __int16 v41 = 2112;
                long long v42 = v14;
                _os_log_error_impl(&dword_2201A2000, v17, OS_LOG_TYPE_ERROR, "Asked to remove subscription but couldn't find existing subscription %@ on subscribed device %@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v16 = __biome_log_for_category();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v14;
              _os_log_error_impl(&dword_2201A2000, v16, OS_LOG_TYPE_ERROR, "Could not find: %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
      LOBYTE(v33) = 0;
    }

    char v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager allSubscriptions];
      *(_DWORD *)buf = 138412290;
      id v40 = v27;
      _os_log_impl(&dword_2201A2000, v26, OS_LOG_TYPE_DEFAULT, "Updated subscription for local: %@", buf, 0xCu);
    }
    char v25 = v33 & v11;
    id v8 = v29;
  }
  else
  {
    char v25 = 0;
  }

  return v25 & 1;
}

- (void)handleIncomingContextChangeMessage:(id)a3 forDevice:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 translatedEvent];
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_2201A2000, v8, OS_LOG_TYPE_DEFAULT, "Saving new context changed message %@ from subscribed device %@", buf, 0x16u);
  }
  uint64_t v10 = [v6 translatedEvent];
  +[BMDistributedContextStreamWriter postEvent:v10];

  subscriptionManager = self->_subscriptionManager;
  uint64_t v12 = [v6 subscriptionIdentifier];
  uint64_t v13 = [(BMDistributedContextSubscriptionManager *)subscriptionManager subscriptionForIdentifier:v12 fromSubscribingDevice:self->_deviceUUID onSubscribedDevice:v7];

  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke;
  v18[3] = &unk_26455C3F0;
  id v19 = v13;
  id v20 = v7;
  id v21 = self;
  id v22 = v6;
  id v15 = v6;
  id v16 = v7;
  id v17 = v13;
  dispatch_sync(queue, v18);
}

void __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke_cold_1(a1, v12, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_11;
  }
  id v3 = [v2 configuration];
  BOOL v4 = [v3 oneOffSubscription];
  int v5 = [v4 BOOLValue];

  if (!v5) {
    return;
  }
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v22 = 138412290;
    uint64_t v23 = v7;
    _os_log_impl(&dword_2201A2000, v6, OS_LOG_TYPE_DEFAULT, "Received the contextual change value for one-off subscription, removing our subscription %@", (uint8_t *)&v22, 0xCu);
  }

  id v8 = *(void **)(*(void *)(a1 + 48) + 64);
  uint64_t v9 = [*(id *)(a1 + 56) subscriptionIdentifier];
  [v8 removeSubscriptionWithIdentifier:v9 fromSubscribingDevice:*(void *)(*(void *)(a1 + 48) + 40) onSubscribedDevice:*(void *)(a1 + 40)];

  uint64_t v10 = [*(id *)(a1 + 56) protocolVersion];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = __biome_log_for_category();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 != 2)
  {
    if (v13)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      int v22 = 138412290;
      uint64_t v23 = v21;
      _os_log_impl(&dword_2201A2000, v12, OS_LOG_TYPE_DEFAULT, "Device %@ does not support oneOff, sending explicit unsubscribe message", (uint8_t *)&v22, 0xCu);
    }
LABEL_11:

    [*(id *)(a1 + 48) assertLocalSubscriptionsToDevice:*(void *)(a1 + 40) shouldSendIfNoSubscriptions:1];
    return;
  }
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v22 = 138412290;
    uint64_t v23 = v14;
    _os_log_impl(&dword_2201A2000, v12, OS_LOG_TYPE_DEFAULT, "Device %@ supports oneOff, not sending unsubscribe", (uint8_t *)&v22, 0xCu);
  }
}

- (void)teardownOneOffSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_2201A2000, v8, OS_LOG_TYPE_DEFAULT, "Removing one-off subscription with identifer %@ from subscribing device %@", (uint8_t *)&v11, 0x16u);
  }

  [(BMDistributedContextService *)self removeSubscriptionWithIdentifier:v6 fromSubscribingDevice:v7];
  uint64_t v9 = [(BMDistributedContextSubscriptionManager *)self->_subscriptionManager subscribingDevicesForIdentifier:v6 subscribedToDevice:self->_deviceUUID];
  if (![v9 count])
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_2201A2000, v10, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", (uint8_t *)&v11, 0xCu);
    }

    [(BMDistributedContextService *)self cancelSubscriptionForIdentifier:v6];
  }
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  BOOL rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    uint64_t v15 = +[BMDistributedContextService distributedContextManager];
    uint64_t v16 = [v15 devicesWithDeviceType:a6];

    uint64_t v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:a5];
      uint64_t v19 = [NSNumber numberWithInteger:a6];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      long long v32 = v16;
      _os_log_impl(&dword_2201A2000, v17, OS_LOG_TYPE_DEFAULT, "Registering DSL %@ with options %@, for devices types %@, which includes %@", buf, 0x2Au);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    uint64_t v20 = [(BMDistributedContextService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDeviceTypes_withError___block_invoke;
    block[3] = &unk_26455C418;
    uint64_t v27 = buf;
    id v24 = v12;
    id v25 = v13;
    unint64_t v28 = a5;
    id v21 = v16;
    id v26 = v21;
    dispatch_sync(v20, block);

    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:3];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:2];
  }

  return rebootNotificationDelivered;
}

void __102__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDeviceTypes_withError___block_invoke(void *a1)
{
  id v2 = +[BMDistributedContextService distributedContextManager];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 registerRemoteDSLSubscription:a1[4] withRemoteIdentifier:a1[5] withOptions:a1[8] forDevices:a1[6]];
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6 withError:(id *)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  BOOL rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    uint64_t v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [NSNumber numberWithUnsignedInteger:a5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      id v27 = v14;
      _os_log_impl(&dword_2201A2000, v16, OS_LOG_TYPE_DEFAULT, "Registering DSL %@ with options %@, for devices %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    uint64_t v18 = [(BMDistributedContextService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDevices_withError___block_invoke;
    block[3] = &unk_26455C418;
    id v24 = buf;
    id v21 = v12;
    id v22 = v13;
    unint64_t v25 = a5;
    id v23 = v14;
    dispatch_sync(v18, block);

    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:3];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:2];
  }

  return rebootNotificationDelivered;
}

void __98__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDevices_withError___block_invoke(void *a1)
{
  id v2 = +[BMDistributedContextService distributedContextManager];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 registerRemoteDSLSubscription:a1[4] withRemoteIdentifier:a1[5] withOptions:a1[8] forDevices:a1[6]];
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  BOOL rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    id v13 = +[BMDistributedContextService distributedContextManager];
    id v14 = [v13 devicesWithDeviceType:a5];

    uint64_t v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [NSNumber numberWithInteger:a5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      id v29 = v14;
      _os_log_impl(&dword_2201A2000, v15, OS_LOG_TYPE_DEFAULT, "Unregistering DSL %@ for device types %@, which includes %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v29) = 0;
    uint64_t v17 = [(BMDistributedContextService *)self queue];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __92__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDeviceTypes_withError___block_invoke;
    id v23 = &unk_26455C440;
    id v27 = buf;
    id v24 = v10;
    id v25 = v11;
    id v18 = v14;
    id v26 = v18;
    dispatch_sync(v17, &v20);

    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 3, v20, v21, v22, v23, v24, v25);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:a6 withErrorCode:2];
  }

  return rebootNotificationDelivered;
}

void __92__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDeviceTypes_withError___block_invoke(void *a1)
{
  id v2 = +[BMDistributedContextService distributedContextManager];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 unregisterRemoteDSLSubscription:a1[4] withRemoteIdentifier:a1[5] forDevices:a1[6]];
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDevices:(id)a5 withError:(id *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_2201A2000, v14, OS_LOG_TYPE_DEFAULT, "Unregistering DSL %@ for devices %@", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v26 = 0;
    uint64_t v15 = [(BMDistributedContextService *)self queue];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __88__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDevices_withError___block_invoke;
    uint64_t v20 = &unk_26455C440;
    id v24 = buf;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    dispatch_sync(v15, &v17);

    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 3, v17, v18, v19, v20, v21, v22);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:a6 withErrorCode:2];
  }

  return rebootNotificationDelivered;
}

void __88__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDevices_withError___block_invoke(void *a1)
{
  id v2 = +[BMDistributedContextService distributedContextManager];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 unregisterRemoteDSLSubscription:a1[4] withRemoteIdentifier:a1[5] forDevices:a1[6]];
}

+ (id)stringForIDSDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"Unknown";
  }
  else {
    return off_26455C4D8[a3 - 1];
  }
}

- (id)idsDeviceForDeviceUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(IDSService *)self->_internetService devices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "uniqueIDOverride", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)devicesWithDeviceType:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = [(IDSService *)self->_internetService devices];
  id v5 = [v4 valueForKeyPath:@"uniqueIDOverride"];
  id v6 = v5;
  if (!a3)
  {
    id v22 = v5;
    goto LABEL_31;
  }
  int64_t v27 = a3;
  id v25 = v5;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  id v29 = [MEMORY[0x263EFF980] array];
  id v10 = [MEMORY[0x263EFF980] array];
  uint64_t v28 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  char v26 = v4;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if ([v16 deviceType] == 2)
      {
        uint64_t v17 = [v16 uniqueIDOverride];
        uint64_t v18 = v8;
      }
      else if ([v16 deviceType] == 4)
      {
        uint64_t v17 = [v16 uniqueIDOverride];
        uint64_t v18 = v9;
      }
      else if ([v16 deviceType] == 6)
      {
        uint64_t v17 = [v16 uniqueIDOverride];
        uint64_t v18 = v29;
      }
      else
      {
        if ([v16 deviceType] != 1) {
          goto LABEL_16;
        }
        uint64_t v17 = [v16 uniqueIDOverride];
        uint64_t v18 = v28;
      }
      [v18 addObject:v17];

LABEL_16:
      if ([v16 isLocallyPaired])
      {
        uint64_t v19 = [v16 uniqueIDOverride];
        [v10 addObject:v19];
      }
      uint64_t v20 = [v16 uniqueIDOverride];
      [v7 addObject:v20];
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v13);
LABEL_20:

  switch(v27)
  {
    case 1:
      id v21 = v8;
      goto LABEL_29;
    case 2:
      id v21 = v9;
      goto LABEL_29;
    case 3:
      id v23 = v29;
      goto LABEL_28;
    case 4:
      id v21 = v10;
      goto LABEL_29;
    case 5:
      id v23 = v28;
LABEL_28:
      id v21 = v23;
LABEL_29:
      id v22 = v21;
      break;
    case 6:
      id v22 = (id)objc_opt_new();
      [v22 addObjectsFromArray:v8];
      [v22 addObjectsFromArray:v9];
      [v22 addObjectsFromArray:v28];
      break;
    default:
      id v22 = 0;
      break;
  }
  id v6 = v25;
  id v4 = v26;

LABEL_31:
  return v22;
}

- (BOOL)sendIDSMessageWithContent:(id)a3 asWaking:(BOOL)a4 toDevice:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v79 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [(IDSService *)self->_internetService devices];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v86 objects:v104 count:16];
  unsigned int v77 = v7;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v87 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        uint64_t v17 = [v16 uniqueIDOverride];
        int v18 = [v17 isEqualToString:v9];

        if (v18)
        {
          id v19 = v16;

          uint64_t v13 = v19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v86 objects:v104 count:16];
    }
    while (v12);
    uint64_t v7 = v77;
    if (v13)
    {
LABEL_16:
      id v22 = (__CFString *)[v79 mutableCopy];
      id v23 = [NSNumber numberWithBool:v7];
      [(__CFString *)v22 setObject:v23 forKeyedSubscript:@"waking"];

      uint64_t v76 = IDSCopyIDForDevice();
      id v24 = [(__CFString *)v22 objectForKeyedSubscript:@"type"];

      if (v24 == @"subscription")
      {
        uint64_t v74 = v22;
        uint64_t v29 = [NSString stringWithFormat:@"%@:%@", self->_deviceUUID, v9];
        char v26 = (void *)v29;
        long long v30 = NSDictionary;
        if (v7)
        {
          v103[0] = v29;
          v103[1] = &unk_26D209BC0;
          long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
          uint64_t v32 = *MEMORY[0x263F49F48];
          v102[0] = *MEMORY[0x263F49F60];
          v102[1] = v32;
          long long v33 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v34 = v102;
          uint64_t v35 = 2;
        }
        else
        {
          v101[0] = &unk_26D209BD8;
          v101[1] = v29;
          v101[2] = &unk_26D209BC0;
          long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:3];
          uint64_t v47 = *MEMORY[0x263F49F60];
          v100[0] = *MEMORY[0x263F49F50];
          v100[1] = v47;
          v100[2] = *MEMORY[0x263F49F48];
          long long v33 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v34 = v100;
          uint64_t v35 = 3;
        }
        long long v42 = [v33 arrayWithObjects:v34 count:v35];
        uint64_t v27 = [v30 dictionaryWithObjects:v31 forKeys:v42];
      }
      else
      {
        id v25 = [(__CFString *)v22 objectForKeyedSubscript:@"type"];

        if (v25 != @"context")
        {
          char v26 = 0;
          uint64_t v27 = 0;
          uint64_t v28 = (__CFString *)v76;
          goto LABEL_31;
        }
        long long v36 = NSString;
        long long v37 = [(__CFString *)v22 objectForKeyedSubscript:@"identifier"];
        char v26 = [v36 stringWithFormat:@"%@:%@", v37, v9];

        uint64_t v74 = v22;
        long long v38 = [(__CFString *)v22 objectForKeyedSubscript:@"identifier"];
        uint64_t MessageIntentFromDistributedContextClientIdentifier = GetMessageIntentFromDistributedContextClientIdentifier(v38);

        id v40 = NSDictionary;
        __int16 v41 = (uint64_t *)MEMORY[0x263F49F48];
        if (v7)
        {
          v99[0] = v26;
          long long v31 = [NSNumber numberWithUnsignedInteger:MessageIntentFromDistributedContextClientIdentifier];
          v99[1] = v31;
          long long v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:2];
          uint64_t v43 = *v41;
          v98[0] = *MEMORY[0x263F49F60];
          v98[1] = v43;
          uint64_t v44 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v45 = v98;
          uint64_t v46 = 2;
        }
        else
        {
          v97[0] = &unk_26D209BD8;
          v97[1] = v26;
          long long v31 = [NSNumber numberWithUnsignedInteger:MessageIntentFromDistributedContextClientIdentifier];
          v97[2] = v31;
          long long v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:3];
          uint64_t v48 = *MEMORY[0x263F49F60];
          v96[0] = *MEMORY[0x263F49F50];
          v96[1] = v48;
          v96[2] = *MEMORY[0x263F49F48];
          uint64_t v44 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v45 = v96;
          uint64_t v46 = 3;
        }
        uint64_t v49 = [v44 arrayWithObjects:v45 count:v46];
        uint64_t v27 = [v40 dictionaryWithObjects:v42 forKeys:v49];
      }
      uint64_t v28 = (__CFString *)v76;
      if (v27)
      {
        id v22 = v74;
        if (v26) {
          goto LABEL_35;
        }
      }
      else
      {
        id v22 = v74;
      }
LABEL_31:
      long long v50 = __biome_log_for_category();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.4();
      }

      if (a6)
      {
        v75 = (void *)v27;
        [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:6 userInfo:0];
        id v51 = 0;
        BOOL v21 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        id v52 = @"com.apple.contextsync";
LABEL_66:

        goto LABEL_67;
      }
LABEL_35:
      v73 = v26;
      v75 = (void *)v27;
      if ([v13 isLocallyPaired])
      {
        long long v53 = __biome_log_for_category();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v28;
          _os_log_impl(&dword_2201A2000, v53, OS_LOG_TYPE_INFO, "Device is locally paired, will send over local service %@", buf, 0xCu);
        }

        long long v54 = __biome_log_for_category();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v22;
          _os_log_impl(&dword_2201A2000, v54, OS_LOG_TYPE_INFO, "Sending message over local service %@", buf, 0xCu);
        }

        localService = self->_localService;
        long long v56 = [MEMORY[0x263EFFA08] setWithObject:v28];
        id v84 = 0;
        v85 = @"com.apple.contextsync";
        char v57 = [(IDSService *)localService sendMessage:v22 toDestinations:v56 priority:300 options:v27 identifier:&v85 error:&v84];
        long long v58 = v85;
        id v59 = v84;

        long long v60 = __biome_log_for_category();
        long long v61 = v60;
        if (v57)
        {
          uint64_t v28 = (__CFString *)v76;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            long long v62 = @"nonwaking";
            *(_DWORD *)buf = 138412802;
            if (v77) {
              long long v62 = @"waking";
            }
            v91 = v62;
            __int16 v92 = 2112;
            id v93 = v79;
            __int16 v94 = 2112;
            uint64_t v95 = v76;
            _os_log_impl(&dword_2201A2000, v61, OS_LOG_TYPE_DEFAULT, "Sent %@ %@ to devices %@ over local service", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v28 = (__CFString *)v76;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:]();
          }
        }

        internetService = self->_internetService;
        v69 = [MEMORY[0x263EFFA08] setWithObject:v28];
        id v82 = v59;
        v83 = v58;
        LOBYTE(internetService) = [(IDSService *)internetService sendMessage:v22 toDestinations:v69 priority:300 options:v75 identifier:&v83 error:&v82];
        id v52 = v83;

        id v51 = v82;
        __int16 v70 = __biome_log_for_category();
        v66 = v70;
        if (internetService)
        {
          char v26 = v73;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            v67 = @"nonwaking";
            *(_DWORD *)buf = 138412802;
            if (v77) {
              v67 = @"waking";
            }
LABEL_56:
            v91 = v67;
            __int16 v92 = 2112;
            id v93 = v79;
            __int16 v94 = 2112;
            uint64_t v95 = (uint64_t)v28;
            _os_log_impl(&dword_2201A2000, v66, OS_LOG_TYPE_DEFAULT, "Sent %@ %@ to device %@ over internet service", buf, 0x20u);
            goto LABEL_57;
          }
          goto LABEL_57;
        }
        char v26 = v73;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:]();
        }

        v71 = a6;
        if (!a6) {
          goto LABEL_65;
        }
      }
      else
      {
        long long v63 = self->_internetService;
        long long v64 = [MEMORY[0x263EFFA08] setWithObject:v28];
        id v80 = 0;
        v81 = @"com.apple.contextsync";
        LOBYTE(v63) = [(IDSService *)v63 sendMessage:v22 toDestinations:v64 priority:300 options:v27 identifier:&v81 error:&v80];
        id v52 = v81;
        id v51 = v80;

        long long v65 = __biome_log_for_category();
        v66 = v65;
        if (v63)
        {
          char v26 = v73;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v67 = @"nonwaking";
            *(_DWORD *)buf = 138412802;
            if (v77) {
              v67 = @"waking";
            }
            goto LABEL_56;
          }
LABEL_57:

          BOOL v21 = 1;
          goto LABEL_66;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:]();
        }

        v71 = a6;
        char v26 = v73;
        if (!a6)
        {
LABEL_65:
          BOOL v21 = 0;
          goto LABEL_66;
        }
      }
      [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:6 userInfo:0];
      BOOL v21 = 0;
      id *v71 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_66;
    }
  }
  uint64_t v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.5();
  }

  [(BMDistributedContextService *)self removeAllSubscriptionsForDeadRemoteDevice:v9];
  if (!a6)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:6 userInfo:0];
  uint64_t v13 = 0;
  BOOL v21 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v21;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = [(IDSService *)self->_internetService deviceForFromID:v11];
  [(BMDistributedContextService *)self logMetricsForMessage:v10 andContext:v12 fromDevice:v13];
  if (v13)
  {
    uint64_t v14 = [v10 objectForKeyedSubscript:@"type"];
    int v15 = [v14 isEqualToString:@"subscription"];

    long long v16 = __biome_log_for_category();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        int v18 = [v13 uniqueIDOverride];
        id v19 = [v12 serverReceivedTime];
        *(_DWORD *)buf = 138412802;
        id v28 = v18;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v19;
        _os_log_impl(&dword_2201A2000, v16, OS_LOG_TYPE_DEFAULT, "Received new subscription from %@: %@ sent at %@", buf, 0x20u);
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__BMDistributedContextService_service_account_incomingMessage_fromID_context___block_invoke;
      block[3] = &unk_26455C3A0;
      id v24 = (BMDistributedContextContextChangedMessage *)v10;
      id v25 = v13;
      char v26 = self;
      dispatch_sync(queue, block);

      BOOL v21 = v24;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        _os_log_impl(&dword_2201A2000, v16, OS_LOG_TYPE_DEFAULT, "Received new context: %@", buf, 0xCu);
      }

      BOOL v21 = [[BMDistributedContextContextChangedMessage alloc] initWithMessageDictionary:v10];
      if (v21)
      {
        id v22 = [v13 uniqueIDOverride];
        [(BMDistributedContextService *)self handleIncomingContextChangeMessage:v21 forDevice:v22];
      }
    }
  }
  else
  {
    __biome_log_for_category();
    BOOL v21 = (BMDistributedContextContextChangedMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_FAULT)) {
      -[BMDistributedContextService service:account:incomingMessage:fromID:context:]();
    }
  }
}

void __78__BMDistributedContextService_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  id v2 = [BMDistributedContextSubscribeMessage alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uniqueIDOverride];
  uint64_t v7 = [(BMDistributedContextSubscribeMessage *)v2 initWithMessageDictionary:v3 fromRemoteDevice:v4 localDevice:*(void *)(*(void *)(a1 + 48) + 40)];

  if (v7)
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) uniqueIDOverride];
    [v5 saveRemoteSubscription:v7 fromDevice:v6];
  }
}

- (void)connection:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__BMDistributedContextService_connection_devicesChanged___block_invoke;
  v8[3] = &unk_26455C468;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __57__BMDistributedContextService_connection_devicesChanged___block_invoke(uint64_t a1)
{
  *(void *)((char *)&v36[1] + 4) = *MEMORY[0x263EF8340];
  id v24 = [*(id *)(a1 + 32) valueForKeyPath:@"uniqueIDOverride"];
  id v2 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithArray:");
  uint64_t v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36[0] = v2;
    _os_log_impl(&dword_2201A2000, v3, OS_LOG_TYPE_DEFAULT, "Potential device change: Current device set is %@", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 40);
  id v5 = (void *)v4[8];
  id v6 = [v4 deviceUUID];
  id v7 = [v5 subscriptionsWithSubscribedDevice:v6];

  id v8 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v15 = [v14 subscribingDevice];
        char v16 = [v2 containsObject:v15];

        if ((v16 & 1) == 0)
        {
          BOOL v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            __57__BMDistributedContextService_connection_devicesChanged___block_invoke_cold_1(buf, v14, v36, v17);
          }

          int v18 = [v14 subscribingDevice];
          [v8 addObject:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*(void *)(a1 + 40) + 64) removeAllSubscriptionsMadeBySubscribingDevice:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v21);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x223C679A0]();
  id v9 = [MEMORY[0x263F29E80] processWithXPCConnection:v7];
  uint64_t v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 executableName];
    int v16 = 138543618;
    BOOL v17 = v11;
    __int16 v18 = 1024;
    int v19 = [v9 pid];
    _os_log_impl(&dword_2201A2000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v16, 0x12u);
  }
  uint64_t v12 = [MEMORY[0x263F29E58] policyForProcess:v9 connectionFlags:0 useCase:*MEMORY[0x263F29E30]];
  char v13 = [v12 allowsAccessToContextSync];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D20BAE8];
    [v7 setExportedInterface:v14];
    [v7 setExportedObject:self];
    [v7 resume];
  }
  else
  {
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMDistributedContextService listener:shouldAcceptNewConnection:](v9);
    }
  }

  return v13;
}

- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withErrorHandler:(id)a8
{
  v38[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v34 = a8;
  char v13 = (void *)MEMORY[0x263EFF9A0];
  id v14 = a5;
  int v15 = [v13 dictionary];
  uint64_t v16 = *MEMORY[0x263F08320];
  [v15 setValue:@"Unknown Error" forKey:*MEMORY[0x263F08320]];
  uint64_t v33 = [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:0 userInfo:v15];
  uint64_t v35 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v17 = objc_msgSend(MEMORY[0x263F29E80], "processWithXPCConnection:");
  __int16 v18 = [MEMORY[0x263F29E58] policyForProcess:v17 connectionFlags:0 useCase:v14];

  if (v12
    && ([v11 rootStreamIdentifiers],
        int v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v18 allowsAccessToContextSyncStreams:v19],
        v19,
        (v20 & 1) != 0))
  {
    if (([v12 isEqualToString:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor"] & 1) != 0
      || [v12 isEqualToString:@"com.appleinternal.proactive.remoteactivitylevel"])
    {
      unint64_t v21 = a6 | 2;
      uint64_t v22 = (void (**)(void, void, void))v34;
    }
    else
    {
      uint64_t v22 = (void (**)(void, void, void))v34;
      unint64_t v21 = a6;
    }
    long long v29 = +[BMDistributedContextService distributedContextManager];
    id v36 = v33;
    char v30 = [v29 registerForUpdates:v11 withIdentifier:v12 withOptions:v21 forDeviceTypes:a7 withError:&v36];
    id v28 = v36;

    ((void (**)(void, BOOL, id))v22)[2](v22, (v30 & 1) != 0, v28);
  }
  else
  {
    id v23 = NSString;
    id v24 = [v17 executableName];
    long long v25 = [v23 stringWithFormat:@"'%@' is not entitled for context sync access to '%@'", v24, v12];

    long long v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = v16;
    v38[0] = v25;
    long long v27 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v28 = [v26 errorWithDomain:@"ContextSyncErrorDomain" code:5 userInfo:v27];

    uint64_t v22 = (void (**)(void, void, void))v34;
    (*((void (**)(id, void, id))v34 + 2))(v34, 0, v28);
  }
}

- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withErrorHandler:(id)a8
{
  v43[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v40 = a7;
  id v39 = a8;
  id v14 = (void *)MEMORY[0x263EFF9A0];
  id v15 = a5;
  uint64_t v16 = [v14 dictionary];
  uint64_t v17 = *MEMORY[0x263F08320];
  [v16 setValue:@"Unknown Error" forKey:*MEMORY[0x263F08320]];
  long long v38 = [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:0 userInfo:v16];
  __int16 v18 = [MEMORY[0x263F08D68] currentConnection];
  int v19 = [MEMORY[0x263F29E80] processWithXPCConnection:v18];
  char v20 = objc_msgSend(MEMORY[0x263F29E58], "policyForProcess:connectionFlags:useCase:");

  unint64_t v21 = v13;
  if (v13
    && ([v12 rootStreamIdentifiers],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v20 allowsAccessToContextSyncStreams:v22],
        v22,
        (v23 & 1) != 0))
  {
    id v24 = +[BMDistributedContextService distributedContextManager];
    id v41 = v38;
    char v25 = [v24 registerForUpdates:v12 withIdentifier:v21 withOptions:a6 forDevices:v40 withError:&v41];
    id v26 = v41;

    long long v27 = v39;
    (*((void (**)(id, BOOL, id))v39 + 2))(v39, (v25 & 1) != 0, v26);
  }
  else
  {
    id v28 = NSString;
    long long v29 = [v19 executableName];
    uint64_t v37 = v16;
    char v30 = v18;
    id v31 = v12;
    long long v32 = v21;
    uint64_t v33 = [v28 stringWithFormat:@"'%@' is not entitled for context sync access to '%@'", v29, v21];

    id v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = v17;
    v43[0] = v33;
    uint64_t v35 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    id v26 = [v34 errorWithDomain:@"ContextSyncErrorDomain" code:5 userInfo:v35];

    unint64_t v21 = v32;
    long long v27 = v39;
    (*((void (**)(id, void, id))v39 + 2))(v39, 0, v26);

    id v12 = v31;
    __int16 v18 = v30;
    uint64_t v16 = v37;
  }
}

- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withErrorHandler:(id)a7
{
  v36[1] = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, BOOL, id))a7;
  id v12 = (void *)MEMORY[0x263EFF9A0];
  id v13 = a5;
  id v14 = [v12 dictionary];
  uint64_t v15 = *MEMORY[0x263F08320];
  [v14 setValue:@"Unknown Error" forKey:*MEMORY[0x263F08320]];
  id v31 = [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:0 userInfo:v14];
  long long v32 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v16 = objc_msgSend(MEMORY[0x263F29E80], "processWithXPCConnection:");
  uint64_t v17 = [MEMORY[0x263F29E58] policyForProcess:v16 connectionFlags:0 useCase:v13];

  __int16 v18 = v10;
  if (v10
    && ([v33 rootStreamIdentifiers],
        int v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v17 allowsAccessToContextSyncStreams:v19],
        v19,
        (v20 & 1) != 0))
  {
    unint64_t v21 = +[BMDistributedContextService distributedContextManager];
    id v34 = v31;
    uint64_t v22 = v33;
    char v23 = [v21 unregisterForUpdates:v33 withIdentifier:v18 forDeviceTypes:a6 withError:&v34];
    id v24 = v34;

    v11[2](v11, (v23 & 1) != 0, v24);
  }
  else
  {
    char v25 = NSString;
    id v26 = [v16 executableName];
    long long v27 = [v25 stringWithFormat:@"'%@' is not entitled for context sync access to '%@'", v26, v10];

    id v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = v15;
    v36[0] = v27;
    long long v29 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v24 = [v28 errorWithDomain:@"ContextSyncErrorDomain" code:5 userInfo:v29];

    v11[2](v11, 0, v24);
    uint64_t v22 = v33;
  }
}

- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withErrorHandler:(id)a7
{
  v38[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v34 = a6;
  id v13 = (void (**)(id, BOOL, id))a7;
  id v14 = (void *)MEMORY[0x263EFF9A0];
  id v15 = a5;
  uint64_t v16 = [v14 dictionary];
  uint64_t v17 = *MEMORY[0x263F08320];
  [v16 setValue:@"Unknown Error" forKey:*MEMORY[0x263F08320]];
  __int16 v18 = [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:0 userInfo:v16];
  id v33 = [MEMORY[0x263F08D68] currentConnection];
  int v19 = objc_msgSend(MEMORY[0x263F29E80], "processWithXPCConnection:");
  char v20 = [MEMORY[0x263F29E58] policyForProcess:v19 connectionFlags:0 useCase:v15];

  uint64_t v35 = v12;
  if (v12
    && ([v11 rootStreamIdentifiers],
        unint64_t v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = [v20 allowsAccessToContextSyncStreams:v21],
        v21,
        (v22 & 1) != 0))
  {
    char v23 = +[BMDistributedContextService distributedContextManager];
    id v36 = v18;
    id v24 = v34;
    char v25 = [v23 unregisterForUpdates:v11 withIdentifier:v35 forDevices:v34 withError:&v36];
    id v26 = v36;

    v13[2](v13, (v25 & 1) != 0, v26);
  }
  else
  {
    long long v27 = NSString;
    id v28 = [v19 executableName];
    long long v29 = [v27 stringWithFormat:@"'%@' is not entitled for context sync access to '%@'", v28, v35];

    char v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = v17;
    v38[0] = v29;
    id v31 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v26 = [v30 errorWithDomain:@"ContextSyncErrorDomain" code:5 userInfo:v31];

    long long v32 = __biome_log_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[BMDistributedContextService unregisterForUpdates:withIdentifier:forUseCase:forDevices:withErrorHandler:]();
    }

    v13[2](v13, 0, v26);
    id v24 = v34;
  }
}

- (void)logMetricsForSubscription:(id)a3 uponReboot:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF910] now];
  id v7 = [v5 dsl];
  id v8 = [v7 streamPublishers];

  id v9 = v5;
  id v10 = [v5 subscribingDevice];
  id v11 = [(BMDistributedContextService *)self idsDeviceForDeviceUUID:v10];

  if (!v11)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMDistributedContextService logMetricsForSubscription:uponReboot:](v9);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v18 = v9;
        id v19 = v11;
        id v20 = v6;
        AnalyticsSendEventLazy();
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
}

id __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  [v2 setObject:v3 forKeyedSubscript:@"identifier"];

  id v4 = [*(id *)(a1 + 40) identifier];
  [v2 setObject:v4 forKeyedSubscript:@"context"];

  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = +[BMDistributedContextService stringForIDSDeviceType:](BMDistributedContextService, "stringForIDSDeviceType:", [v5 deviceType]);
    [v2 setObject:v6 forKeyedSubscript:@"subscriberDeviceType"];
  }
  id v7 = [*(id *)(a1 + 32) configuration];
  id v8 = [v7 wakeState];

  if ([v8 BOOLValue])
  {
    [v2 setObject:v8 forKeyedSubscript:@"waking"];
    id v9 = *(void **)(a1 + 56);
    id v10 = [*(id *)(a1 + 32) configuration];
    id v11 = [v10 lastChangedDate];
    [v9 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 == 0.0)
    {
      uint64_t v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_2((uint64_t)v8, a1);
      }
    }
    else
    {
      uint64_t v14 = [NSNumber numberWithDouble:v13 / 60.0];
      [v2 setObject:v14 forKeyedSubscript:@"duration"];
    }
  }
  uint64_t v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_1();
  }

  return v2;
}

- (void)logMetricsForMessage:(id)a3 andContext:(id)a4 fromDevice:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectForKeyedSubscript:@"version"];

  if (v10)
  {
    id v11 = v8;
    id v12 = v7;
    id v13 = v9;
    AnalyticsSendEventLazy();
  }
}

id __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) serverReceivedTime];
  [v3 timeIntervalSinceNow];
  if (fabs(v4) < 1.0) {
    double v4 = 0.0;
  }
  id v5 = [NSNumber numberWithDouble:v4];
  [v2 setObject:v5 forKeyedSubscript:@"latencySeconds"];

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"type"];
  [v2 setObject:v6 forKeyedSubscript:@"messageType"];

  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"type"];

  if (v7 == @"subscription")
  {
    id v8 = @"None";
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"streamIdentifier"];
  }
  [v2 setObject:v8 forKeyedSubscript:@"contextIdentifier"];
  id v9 = *(void **)(a1 + 48);
  if (v9)
  {
    id v10 = +[BMDistributedContextService stringForIDSDeviceType:](BMDistributedContextService, "stringForIDSDeviceType:", [v9 deviceType]);
    [v2 setObject:v10 forKeyedSubscript:@"subscriberDeviceType"];
  }
  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"waking"];
  [v2 setObject:v11 forKeyedSubscript:@"waking"];

  id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"version"];
  [v2 setObject:v12 forKeyedSubscript:@"messageVersion"];

  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke_cold_1();
  }

  return v2;
}

- (IDSService)localService
{
  return self->_localService;
}

- (void)setLocalService:(id)a3
{
}

- (IDSService)internetService
{
  return self->_internetService;
}

- (void)setInternetService:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (NSUserDefaults)subscriptionDefaults
{
  return self->_subscriptionDefaults;
}

- (void)setSubscriptionDefaults:(id)a3
{
}

- (BMDistributedContextSubscriptionStorage)subscriptionStorage
{
  return self->_subscriptionStorage;
}

- (void)setSubscriptionStorage:(id)a3
{
}

- (BMDistributedContextSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (NSMutableDictionary)subscriptionSinks
{
  return self->_subscriptionSinks;
}

- (void)setSubscriptionSinks:(id)a3
{
}

- (BMDistributedContextEventTranslation)eventTranslator
{
  return self->_eventTranslator;
}

- (void)setEventTranslator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
}

- (OS_dispatch_queue)biomeQueue
{
  return self->_biomeQueue;
}

- (void)setBiomeQueue:(id)a3
{
}

- (BOOL)rebootNotificationDelivered
{
  return self->_rebootNotificationDelivered;
}

- (void)setRebootNotificationDelivered:(BOOL)a3
{
  self->_BOOL rebootNotificationDelivered = a3;
}

- (NSMutableDictionary)lockedUpdates
{
  return self->_lockedUpdates;
}

- (void)setLockedUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedUpdates, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventTranslator, 0);
  objc_storeStrong((id *)&self->_subscriptionSinks, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_subscriptionStorage, 0);
  objc_storeStrong((id *)&self->_subscriptionDefaults, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_internetService, 0);
  objc_storeStrong((id *)&self->_localService, 0);
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_2201A2000, a2, OS_LOG_TYPE_FAULT, "Did not successfully set up sink with identifier: %@", (uint8_t *)&v3, 0xCu);
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_48_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2201A2000, v0, v1, "New event was not whitelisted, missing streamIdentifier, eventData, or dataVersion %@", v2, v3, v4, v5, v6);
}

- (void)cancelSubscriptionForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2201A2000, v0, v1, "Could not find a dsl for identifier %@", v2, v3, v4, v5, v6);
}

void __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Failed to send over internet service: %@ because %@");
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Failed to send over local service: %@ because %@");
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Failed to send %@: No queue identifier %@ / options");
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Cannot find %@ in device set %@");
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_2201A2000, v0, OS_LOG_TYPE_FAULT, "Received new message but dropping because could not find device %@", v1, 0xCu);
}

void __57__BMDistributedContextService_connection_devicesChanged___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 subscribingDevice];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2201A2000, a4, OS_LOG_TYPE_ERROR, "Disconnected subscribing device %@", a1, 0xCu);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  id v7 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)unregisterForUpdates:withIdentifier:forUseCase:forDevices:withErrorHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2201A2000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)logMetricsForSubscription:(void *)a1 uponReboot:.cold.1(void *a1)
{
  uint64_t v1 = [a1 subscribingDevice];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

void __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_2201A2000, v0, OS_LOG_TYPE_DEBUG, "Logged stream end: %@", v1, 0xCu);
}

void __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a2 + 64) subscriptionManager];
  id v8 = [v2 allSubscriptions];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x16u);
}

void __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_2201A2000, v0, OS_LOG_TYPE_DEBUG, "Logged new message: %@", v1, 0xCu);
}

@end