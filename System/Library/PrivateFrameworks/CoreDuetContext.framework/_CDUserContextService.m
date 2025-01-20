@interface _CDUserContextService
+ (id)sharedInstanceWithPersistence:(id)a3;
+ (id)sharedInstanceWithSharedMemoryStore:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)remoteDevicesHaveBeenActivated;
- (BOOL)setMappingObject:(id)a3 forContextualKeyPath:(id)a4;
- (NSMutableDictionary)firedRegistrationInfos;
- (NSMutableDictionary)mdcsEventSubscribersByToken;
- (NSMutableDictionary)notificationEventSubscribersByClientIdentifier;
- (NSMutableDictionary)notificationEventSubscribersByToken;
- (NSMutableDictionary)remoteDevicesByDeviceID;
- (NSMutableSet)clients;
- (NSMutableSet)firedRegistrations;
- (NSMutableSet)openRegistrations;
- (NSXPCListener)listener;
- (OS_dispatch_queue)workQueue;
- (_CDContextPersisting)persistence;
- (_CDInMemoryUserContext)userContext;
- (_CDUserContextService)initWithListener:(id)a3 withPersistence:(id)a4 withStorage:(id)a5 withStore:(id)a6;
- (_CDUserContextService)initWithListener:(id)a3 withStorage:(id)a4 withStore:(id)a5;
- (_CDXPCEventPublisher)mdcsEventPublisher;
- (_CDXPCEventPublisher)notificationEventPublisher;
- (id)obtainFiredRegistrationMatchingRegistration:(id)a3 info:(id *)a4;
- (id)proxySourceDeviceUUIDForUserID:(unsigned int)a3;
- (id)subscriberForSourceDeviceUUID:(id)a3;
- (id)subscribersForClientIdentifier:(id)a3;
- (unint64_t)tokenForSourceDeviceUUID:(id)a3;
- (void)addOpenRegistration:(id)a3;
- (void)addProxyWithSourceDeviceUUID:(id)a3;
- (void)addSubscriber:(id)a3;
- (void)clientWasInterrupted:(id)a3;
- (void)deleteSavedData;
- (void)fetchProxySourceDeviceUUIDFromSubscriber:(id)a3;
- (void)informClientOfFiredRegistration:(id)a3 info:(id)a4;
- (void)regenerateState;
- (void)removeOpenRegistration:(id)a3;
- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4;
- (void)removeTokenForUserID:(unsigned int)a3;
- (void)requestActivateDevicesFromAllSubscribersWithHandler:(id)a3;
- (void)requestActivateDevicesFromSubscriber:(id)a3 withHandler:(id)a4;
- (void)sendEvent:(id)a3 toClient:(id)a4 handler:(id)a5;
- (void)sendEvent:(id)a3 toClient:(id)a4 replyHandler:(id)a5;
- (void)sendEvent:(id)a3 toProxy:(id)a4 handler:(id)a5;
- (void)sendEvent:(id)a3 toProxy:(id)a4 replyHandler:(id)a5;
- (void)setClients:(id)a3;
- (void)setFiredRegistrationInfos:(id)a3;
- (void)setFiredRegistrations:(id)a3;
- (void)setListener:(id)a3;
- (void)setMdcsEventPublisher:(id)a3;
- (void)setMdcsEventSubscribersByToken:(id)a3;
- (void)setNotificationEventPublisher:(id)a3;
- (void)setNotificationEventSubscribersByClientIdentifier:(id)a3;
- (void)setNotificationEventSubscribersByToken:(id)a3;
- (void)setOpenRegistrations:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setProxySourceDeviceUUID:(id)a3 forUserID:(unsigned int)a4;
- (void)setRemoteDevicesHaveBeenActivated:(BOOL)a3;
- (void)setToken:(unint64_t)a3 forUserID:(unsigned int)a4;
- (void)setUserContext:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
@end

@implementation _CDUserContextService

- (BOOL)remoteDevicesHaveBeenActivated
{
  return self->_remoteDevicesHaveBeenActivated;
}

- (_CDContextPersisting)persistence
{
  return self->_persistence;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60___CDUserContextService_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_1E5609210;
    block[4] = self;
    if (listener_shouldAcceptNewConnection__initialized != -1) {
      dispatch_once(&listener_shouldAcceptNewConnection__initialized, block);
    }
  }
  if (listener_shouldAcceptNewConnection__isUnitTests) {
    goto LABEL_5;
  }
  v11 = [v7 valueForEntitlement:@"com.apple.coreduetd.context"];
  v8 = v11;
  if (v11 && ([v11 BOOLValue] & 1) != 0)
  {

LABEL_5:
    v8 = +[_CDUserContextServerClient clientOfService:self withConnection:v7 andContext:self->_userContext];
    v9 = self->_clients;
    objc_sync_enter(v9);
    [(NSMutableSet *)self->_clients addObject:v8];
    objc_sync_exit(v9);
    BOOL v10 = 1;
    goto LABEL_12;
  }
  v9 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_18EC9B000, &v9->super.super, OS_LOG_TYPE_INFO, "Client %@ does not have required entitlement", buf, 0xCu);
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (_CDUserContextService)initWithListener:(id)a3 withStorage:(id)a4 withStore:(id)a5
{
  return [(_CDUserContextService *)self initWithListener:a3 withPersistence:0 withStorage:a4 withStore:a5];
}

- (_CDUserContextService)initWithListener:(id)a3 withPersistence:(id)a4 withStorage:(id)a5 withStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v48.receiver = self;
  v48.super_class = (Class)_CDUserContextService;
  id v15 = [(_CDUserContextService *)&v48 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    clients = v15->_clients;
    v15->_clients = (NSMutableSet *)v16;

    uint64_t v18 = +[_CDInMemoryUserContext userContext];
    userContext = v15->_userContext;
    v15->_userContext = (_CDInMemoryUserContext *)v18;

    objc_storeStrong((id *)&v15->_listener, a3);
    if (v12)
    {
      v20 = (_CDContextPersisting *)v12;
    }
    else if (v13)
    {
      v20 = +[_CDCoreDataContextPersisting persistenceWithStorage:v13];
    }
    else
    {
      if (!v14)
      {
        v21 = [NSString stringWithFormat:@"/%@", @"CDCSS"];
        v45 = [MEMORY[0x1E4F5B450] keyValueStoreWithName:v21 size:0];
        uint64_t v46 = +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:v45];
        persistence = v15->_persistence;
        v15->_persistence = (_CDContextPersisting *)v46;

        goto LABEL_9;
      }
      v20 = +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:v14];
    }
    v21 = v15->_persistence;
    v15->_persistence = v20;
LABEL_9:

    [(_CDUserContextService *)v15 regenerateState];
    [(NSXPCListener *)v15->_listener setDelegate:v15];
    uint64_t v22 = objc_opt_new();
    mdcsEventSubscribersByToken = v15->_mdcsEventSubscribersByToken;
    v15->_mdcsEventSubscribersByToken = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    notificationEventSubscribersByToken = v15->_notificationEventSubscribersByToken;
    v15->_notificationEventSubscribersByToken = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    notificationEventSubscribersByClientIdentifier = v15->_notificationEventSubscribersByClientIdentifier;
    v15->_notificationEventSubscribersByClientIdentifier = (NSMutableDictionary *)v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v30 = dispatch_queue_create("com.apple.coreduet.context-work-queue", v29);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v30;

    v32 = (void *)MEMORY[0x1E4F5B470];
    v33 = v15->_workQueue;
    v34 = [MEMORY[0x1E4F5B418] mdcsChannel];
    uint64_t v35 = objc_msgSend(v32, "eventPublisherWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", "com.apple.coreduetcontext.mdcs_events", v15, v33, v34, "com.apple.coreduetcontext");
    mdcsEventPublisher = v15->_mdcsEventPublisher;
    v15->_mdcsEventPublisher = (_CDXPCEventPublisher *)v35;

    v37 = (void *)MEMORY[0x1E4F5B470];
    v38 = v15->_workQueue;
    v39 = [MEMORY[0x1E4F5B418] contextChannel];
    uint64_t v40 = objc_msgSend(v37, "eventPublisherWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", "com.apple.coreduetcontext.client_event_stream", v15, v38, v39, "com.apple.coreduetcontext");
    notificationEventPublisher = v15->_notificationEventPublisher;
    v15->_notificationEventPublisher = (_CDXPCEventPublisher *)v40;

    uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
    remoteDevicesByDeviceID = v15->_remoteDevicesByDeviceID;
    v15->_remoteDevicesByDeviceID = (NSMutableDictionary *)v42;
  }
  return v15;
}

+ (id)sharedInstanceWithPersistence:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___CDUserContextService_sharedInstanceWithPersistence___block_invoke;
  block[3] = &unk_1E5609210;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithPersistence__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithPersistence__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithPersistence__service;

  return v6;
}

+ (id)sharedInstanceWithSharedMemoryStore:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___CDUserContextService_sharedInstanceWithSharedMemoryStore___block_invoke;
  block[3] = &unk_1E5609210;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithSharedMemoryStore__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithSharedMemoryStore__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithSharedMemoryStore__service;

  return v6;
}

- (void)addOpenRegistration:(id)a3
{
  id v4 = a3;
  id v5 = self->_openRegistrations;
  objc_sync_enter(v5);
  id v6 = [(NSMutableSet *)self->_openRegistrations member:v4];
  objc_sync_exit(v5);

  if (!v6) {
    id v6 = v4;
  }
  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45___CDUserContextService_addOpenRegistration___block_invoke;
  v7[3] = &unk_1E5609E10;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v6 setInformativeCallback:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)removeOpenRegistration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_openRegistrations;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)self->_openRegistrations containsObject:v4])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_openRegistrations;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          BOOL v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "isEqual:", v4, (void)v11))
          {
            [(_CDInMemoryUserContext *)self->_userContext deregisterCallback:v10];
            [(NSMutableSet *)self->_openRegistrations removeObject:v10];
            goto LABEL_12;
          }
        }
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  objc_sync_exit(v5);
}

- (id)obtainFiredRegistrationMatchingRegistration:(id)a3 info:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self->_firedRegistrations;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableSet *)self->_firedRegistrations member:v6];
  if (v8)
  {
    [(NSMutableSet *)self->_firedRegistrations removeObject:v8];
    if (a4)
    {
      firedRegistrationInfos = self->_firedRegistrationInfos;
      BOOL v10 = [v8 identifier];
      *a4 = [(NSMutableDictionary *)firedRegistrationInfos objectForKeyedSubscript:v10];
    }
    long long v11 = self->_firedRegistrationInfos;
    long long v12 = [v8 identifier];
    [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];
  }
  objc_sync_exit(v7);

  return v8;
}

- (void)informClientOfFiredRegistration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 clientIdentifier];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_CDUserContextService informClientOfFiredRegistration:info:](v6);
    }

    BOOL v10 = [v6 identifier];
    id v21 = 0;
    long long v11 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:v10 info:v7 error:&v21];
    id v12 = v21;
    if (v11)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke;
      v19 = &unk_1E5609790;
      v20 = v6;
      [(_CDUserContextService *)self sendEvent:v11 toClient:v8 handler:&v16];
      long long v13 = v20;
    }
    else
    {
      long long v13 = [MEMORY[0x1E4F5B418] contextChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_CDUserContextService informClientOfFiredRegistration:info:]();
      }
    }
  }
  long long v14 = objc_msgSend(MEMORY[0x1E4F5B418], "contextChannel", v16, v17, v18, v19);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextService informClientOfFiredRegistration:info:](v6);
  }

  id v15 = [v6 identifier];
  notify_post((const char *)[v15 UTF8String]);
}

- (void)regenerateState
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_persistence = &self->_persistence;
  persistence = self->_persistence;
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
  [(_CDContextPersisting *)persistence deleteDataCreatedBefore:v5];

  v20 = [(_CDContextPersisting *)*p_persistence loadValues];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __40___CDUserContextService_regenerateState__block_invoke;
  v29[3] = &unk_1E5609E38;
  v29[4] = self;
  [v20 enumerateKeysAndObjectsUsingBlock:v29];
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = [(_CDContextPersisting *)*p_persistence loadRegistrations];
  uint64_t v8 = [v6 setWithArray:v7];
  openRegistrations = self->_openRegistrations;
  self->_openRegistrations = v8;

  BOOL v10 = [MEMORY[0x1E4F1CA80] set];
  firedRegistrations = self->_firedRegistrations;
  self->_firedRegistrations = v10;

  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableSet count](self->_openRegistrations, "count"));
  id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  firedRegistrationInfos = self->_firedRegistrationInfos;
  self->_firedRegistrationInfos = v12;

  v19 = self->_openRegistrations;
  objc_sync_enter(v19);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_openRegistrations;
  uint64_t v14 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_initWeak(&location, v18);
        v22[0] = v16;
        v22[1] = 3221225472;
        v22[2] = __40___CDUserContextService_regenerateState__block_invoke_2;
        v22[3] = &unk_1E5609E10;
        objc_copyWeak(&v23, &location);
        v22[4] = self;
        [v18 setInformativeCallback:v22];
        [(_CDInMemoryUserContext *)self->_userContext registerCallback:v18];
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      uint64_t v14 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v19);
}

- (void)start
{
}

- (void)deleteSavedData
{
}

- (void)clientWasInterrupted:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_clients;
    objc_sync_enter(v5);
    [(NSMutableSet *)self->_clients removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)sendEvent:(id)a3 toProxy:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  long long v11 = [(_CDUserContextService *)self subscriberForSourceDeviceUUID:v9];
  if (!v11)
  {
    long long v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService sendEvent:toProxy:handler:]();
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5B658];
    uint64_t v16 = (void *)MEMORY[0x1E4F5B698];
    goto LABEL_8;
  }
  mdcsEventPublisher = self->_mdcsEventPublisher;
  if (!mdcsEventPublisher)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5B658];
    uint64_t v16 = (void *)MEMORY[0x1E4F5B680];
LABEL_8:
    uint64_t v17 = [v14 errorWithDomain:v15 code:*v16 userInfo:0];
    v10[2](v10, v17);

    goto LABEL_9;
  }
  [(_CDXPCEventPublisher *)mdcsEventPublisher sendEvent:v8 toSubscriber:v11 handler:v10];
LABEL_9:
}

- (void)sendEvent:(id)a3 toProxy:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void, void *))a5;
  long long v11 = [(_CDUserContextService *)self subscriberForSourceDeviceUUID:v9];
  if (!v11)
  {
    long long v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService sendEvent:toProxy:handler:]();
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5B658];
    uint64_t v16 = (void *)MEMORY[0x1E4F5B698];
    goto LABEL_8;
  }
  mdcsEventPublisher = self->_mdcsEventPublisher;
  if (!mdcsEventPublisher)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5B658];
    uint64_t v16 = (void *)MEMORY[0x1E4F5B680];
LABEL_8:
    uint64_t v17 = [v14 errorWithDomain:v15 code:*v16 userInfo:0];
    v10[2](v10, 0, v17);

    goto LABEL_9;
  }
  [(_CDXPCEventPublisher *)mdcsEventPublisher sendEvent:v8 toSubscriber:v11 replyHandler:v10];
LABEL_9:
}

- (void)sendEvent:(id)a3 toClient:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  long long v11 = [(_CDUserContextService *)self subscribersForClientIdentifier:v9];
  id v12 = v11;
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService sendEvent:toClient:handler:]();
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5B658];
    v20 = (void *)MEMORY[0x1E4F5B690];
    goto LABEL_15;
  }
  if (!self->_notificationEventPublisher)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5B658];
    v20 = (void *)MEMORY[0x1E4F5B680];
LABEL_15:
    id v21 = [v18 errorWithDomain:v19 code:*v20 userInfo:0];
    v10[2](v10, v21);

    goto LABEL_16;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        [(_CDXPCEventPublisher *)self->_notificationEventPublisher sendEvent:v8 toSubscriber:*(void *)(*((void *)&v22 + 1) + 8 * i) handler:v10];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
LABEL_16:
}

- (void)sendEvent:(id)a3 toClient:(id)a4 replyHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void, void *))a5;
  long long v11 = [(_CDUserContextService *)self subscribersForClientIdentifier:v9];
  id v12 = v11;
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService sendEvent:toClient:handler:]();
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5B658];
    v20 = (void *)MEMORY[0x1E4F5B690];
    goto LABEL_15;
  }
  if (!self->_mdcsEventPublisher)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5B658];
    v20 = (void *)MEMORY[0x1E4F5B680];
LABEL_15:
    id v21 = [v18 errorWithDomain:v19 code:*v20 userInfo:0];
    v10[2](v10, 0, v21);

    goto LABEL_16;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        [(_CDXPCEventPublisher *)self->_notificationEventPublisher sendEvent:v8 toSubscriber:*(void *)(*((void *)&v22 + 1) + 8 * i) replyHandler:v10];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
LABEL_16:
}

- (BOOL)setMappingObject:(id)a3 forContextualKeyPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_debug_impl(&dword_18EC9B000, v9, OS_LOG_TYPE_DEBUG, "SET MAPPING %@ => %@ / %@", (uint8_t *)&v14, 0x20u);
  }

  BOOL v10 = [(_CDInMemoryUserContext *)self->_userContext setObject:v6 returningMetadataForContextualKeyPath:v7];
  long long v11 = v10;
  if (v10)
  {
    [v10 setLastModifiedDate:v8];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService setMappingObject:forContextualKeyPath:]();
    }
  }
  return v11 != 0;
}

- (void)setToken:(unint64_t)a3 forUserID:(unsigned int)a4
{
  id v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  id v9 = +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:v6];

  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [(_CDUserContextService *)self setMappingObject:v7 forContextualKeyPath:v9];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"_CDMDCSProxyTokenUpdated" object:self];
}

- (void)removeTokenForUserID:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v6 = +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:v4];

  [(_CDUserContextService *)self setMappingObject:0 forContextualKeyPath:v6];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"_CDMDCSProxyTokenUpdated" object:self];
}

- (void)addProxyWithSourceDeviceUUID:(id)a3
{
  id v9 = a3;
  id v4 = +[_CDContextQueries keyPathForMDCSProxies];
  id v5 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v4];
  if (([v5 containsObject:v9] & 1) == 0)
  {
    if (v5)
    {
      id v6 = (void *)[v5 mutableCopy];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    id v7 = v6;
    [v6 addObject:v9];
    uint64_t v8 = [v7 copy];

    [(_CDUserContextService *)self setMappingObject:v8 forContextualKeyPath:v4];
    id v5 = (void *)v8;
  }
}

- (void)setProxySourceDeviceUUID:(id)a3 forUserID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v10 = +[_CDContextQueries keyPathForMDCSUserIDWithProxySourceDeviceUUID:v6];
  id v7 = [NSNumber numberWithUnsignedInt:v4];
  [(_CDUserContextService *)self setMappingObject:v7 forContextualKeyPath:v10];

  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];
  id v9 = +[_CDContextQueries keyPathForMDCSProxySourceDeviceUUIDWithUserID:v8];

  [(_CDUserContextService *)self setMappingObject:v6 forContextualKeyPath:v9];
  [(_CDUserContextService *)self addProxyWithSourceDeviceUUID:v6];
}

- (id)proxySourceDeviceUUIDForUserID:(unsigned int)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = +[_CDContextQueries keyPathForMDCSProxySourceDeviceUUIDWithUserID:v4];

  id v6 = [(_CDInMemoryUserContext *)self->_userContext propertiesForContextualKeyPath:v5];
  id v7 = [v6 value];

  return v7;
}

- (id)subscriberForSourceDeviceUUID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_CDUserContextService *)self tokenForSourceDeviceUUID:v4];
  id v6 = self->_mdcsEventSubscribersByToken;
  objc_sync_enter(v6);
  mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v5];
  id v9 = [(NSMutableDictionary *)mdcsEventSubscribersByToken objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  return v9;
}

- (unint64_t)tokenForSourceDeviceUUID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[_CDContextQueries keyPathForMDCSUserIDWithProxySourceDeviceUUID:v4];
  id v6 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:v6];
    uint64_t v8 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v7];
    id v9 = v8;
    if (v8)
    {
      unint64_t v10 = [v8 unsignedLongLongValue];
    }
    else
    {
      long long v11 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_CDUserContextService tokenForSourceDeviceUUID:]();
      }

      unint64_t v10 = 0;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService tokenForSourceDeviceUUID:]();
    }
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)subscribersForClientIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_notificationEventSubscribersByClientIdentifier;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_notificationEventSubscribersByClientIdentifier objectForKeyedSubscript:v4];
  id v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  return v7;
}

- (void)fetchProxySourceDeviceUUIDFromSubscriber:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[_CDXPCCodecs fetchProxySourceDeviceUUIDEvent];
  if (v5)
  {
    mdcsEventPublisher = self->_mdcsEventPublisher;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke;
    v8[3] = &unk_1E5609D00;
    v8[4] = self;
    id v9 = v4;
    [(_CDXPCEventPublisher *)mdcsEventPublisher sendEvent:v5 toSubscriber:v9 replyHandler:v8];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService fetchProxySourceDeviceUUIDFromSubscriber:]();
    }
  }
}

- (void)requestActivateDevicesFromAllSubscribersWithHandler:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  unint64_t v5 = self->_mdcsEventSubscribersByToken;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_mdcsEventSubscribersByToken allValues];
  objc_sync_exit(v5);

  uint64_t v7 = [v6 count];
  id v17 = v4;
  if (v7)
  {
    uint64_t v8 = v7;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2810000000;
    v41[3] = &unk_18ECDBC02;
    int v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__3;
    v39[4] = __Block_byref_object_dispose__3;
    id v40 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__3;
    v36[4] = __Block_byref_object_dispose__3;
    id v37 = (id)os_transaction_create();
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke;
    block[3] = &unk_1E5609E60;
    v32 = v41;
    v33 = v39;
    uint64_t v11 = v8;
    uint64_t v35 = v8;
    id v12 = v4;
    id v31 = v12;
    v34 = v36;
    dispatch_after(v9, workQueue, block);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_38;
          v19[3] = &unk_1E5609E88;
          id v21 = v41;
          long long v22 = v39;
          v19[4] = v16;
          long long v23 = v38;
          uint64_t v25 = v11;
          uint64_t v20 = v12;
          long long v24 = v36;
          [(_CDUserContextService *)self requestActivateDevicesFromSubscriber:v16 withHandler:v19];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v43 count:16];
      }
      while (v13);
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v4[2](v4);
  }
}

- (void)requestActivateDevicesFromSubscriber:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = +[_CDXPCCodecs requestActivateDevicesEvent];
  if (v8)
  {
    mdcsEventPublisher = self->_mdcsEventPublisher;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke;
    v11[3] = &unk_1E5609EB0;
    id v12 = v7;
    [(_CDXPCEventPublisher *)mdcsEventPublisher sendEvent:v8 toSubscriber:v6 replyHandler:v11];
  }
  else
  {
    unint64_t v10 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextService requestActivateDevicesFromSubscriber:withHandler:]();
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 streamName];
  uint64_t v6 = [v4 token];
  uint64_t v7 = [v4 uid];
  uint64_t v8 = [NSString stringWithUTF8String:"com.apple.coreduetcontext.mdcs_events"];
  int v9 = [v8 isEqualToString:v5];

  if (v9)
  {
    unint64_t v10 = self->_mdcsEventSubscribersByToken;
    objc_sync_enter(v10);
    mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
    id v12 = [NSNumber numberWithUnsignedLongLong:v6];
    [(NSMutableDictionary *)mdcsEventSubscribersByToken setObject:v4 forKeyedSubscript:v12];

    objc_sync_exit(v10);
    [(_CDUserContextService *)self setToken:v6 forUserID:v7];
  }
  else
  {
    uint64_t v13 = [NSString stringWithUTF8String:"com.apple.coreduetcontext.client_event_stream"];
    int v14 = [v13 isEqualToString:v5];

    if (v14)
    {
      id v15 = self->_notificationEventSubscribersByToken;
      objc_sync_enter(v15);
      notificationEventSubscribersByToken = self->_notificationEventSubscribersByToken;
      id v17 = [NSNumber numberWithUnsignedLongLong:v6];
      [(NSMutableDictionary *)notificationEventSubscribersByToken setObject:v4 forKeyedSubscript:v17];

      objc_sync_exit(v15);
      __int16 v18 = self->_notificationEventSubscribersByClientIdentifier;
      objc_sync_enter(v18);
      uint64_t v19 = [v4 clientIdentifier];
      uint64_t v20 = [(NSMutableDictionary *)self->_notificationEventSubscribersByClientIdentifier objectForKeyedSubscript:v19];
      if (!v20)
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
        [(NSMutableDictionary *)self->_notificationEventSubscribersByClientIdentifier setObject:v20 forKeyedSubscript:v19];
      }
      [v20 addObject:v4];

      objc_sync_exit(v18);
    }
    else
    {
      __int16 v18 = [MEMORY[0x1E4F5B418] contextChannel];
      if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR)) {
        -[_CDUserContextService addSubscriber:]();
      }
    }
  }
  id v21 = [(_CDUserContextService *)self proxySourceDeviceUUIDForUserID:v7];
  if (v21)
  {
    [(_CDUserContextService *)self addProxyWithSourceDeviceUUID:v21];
  }
  else
  {
    [(_CDUserContextService *)self fetchProxySourceDeviceUUIDFromSubscriber:v4];
    [(_CDUserContextService *)self requestActivateDevicesFromSubscriber:v4 withHandler:0];
  }
}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [NSString stringWithUTF8String:"com.apple.coreduetcontext.mdcs_events"];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    int v9 = self->_mdcsEventSubscribersByToken;
    objc_sync_enter(v9);
    mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a3];
    id v12 = [(NSMutableDictionary *)mdcsEventSubscribersByToken objectForKeyedSubscript:v11];

    uint64_t v13 = self->_mdcsEventSubscribersByToken;
    int v14 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];

    objc_sync_exit(v9);
    if (v12) {
      -[_CDUserContextService removeTokenForUserID:](self, "removeTokenForUserID:", [v12 uid]);
    }
LABEL_7:

    goto LABEL_11;
  }
  id v15 = [NSString stringWithUTF8String:"com.apple.coreduetcontext.client_event_stream"];
  int v16 = [v15 isEqualToString:v6];

  if (v16)
  {
    id v17 = self->_notificationEventSubscribersByToken;
    objc_sync_enter(v17);
    notificationEventSubscribersByToken = self->_notificationEventSubscribersByToken;
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:a3];
    id v12 = [(NSMutableDictionary *)notificationEventSubscribersByToken objectForKeyedSubscript:v19];

    uint64_t v20 = self->_notificationEventSubscribersByToken;
    id v21 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)v20 setObject:0 forKeyedSubscript:v21];

    objc_sync_exit(v17);
    if (v12)
    {
      long long v22 = self->_notificationEventSubscribersByClientIdentifier;
      objc_sync_enter(v22);
      long long v23 = [v12 clientIdentifier];
      long long v24 = [(NSMutableDictionary *)self->_notificationEventSubscribersByClientIdentifier objectForKeyedSubscript:v23];
      [v24 removeObject:v12];

      objc_sync_exit(v22);
    }
    goto LABEL_7;
  }
  uint64_t v25 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[_CDUserContextService addSubscriber:]();
  }

LABEL_11:
}

- (void)setPersistence:(id)a3
{
}

- (_CDInMemoryUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)openRegistrations
{
  return self->_openRegistrations;
}

- (void)setOpenRegistrations:(id)a3
{
}

- (NSMutableSet)firedRegistrations
{
  return self->_firedRegistrations;
}

- (void)setFiredRegistrations:(id)a3
{
}

- (NSMutableDictionary)firedRegistrationInfos
{
  return self->_firedRegistrationInfos;
}

- (void)setFiredRegistrationInfos:(id)a3
{
}

- (_CDXPCEventPublisher)mdcsEventPublisher
{
  return self->_mdcsEventPublisher;
}

- (void)setMdcsEventPublisher:(id)a3
{
}

- (_CDXPCEventPublisher)notificationEventPublisher
{
  return self->_notificationEventPublisher;
}

- (void)setNotificationEventPublisher:(id)a3
{
}

- (NSMutableDictionary)mdcsEventSubscribersByToken
{
  return self->_mdcsEventSubscribersByToken;
}

- (void)setMdcsEventSubscribersByToken:(id)a3
{
}

- (NSMutableDictionary)notificationEventSubscribersByToken
{
  return self->_notificationEventSubscribersByToken;
}

- (void)setNotificationEventSubscribersByToken:(id)a3
{
}

- (NSMutableDictionary)notificationEventSubscribersByClientIdentifier
{
  return self->_notificationEventSubscribersByClientIdentifier;
}

- (void)setNotificationEventSubscribersByClientIdentifier:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setRemoteDevicesHaveBeenActivated:(BOOL)a3
{
  self->_remoteDevicesHaveBeenActivated = a3;
}

- (NSMutableDictionary)remoteDevicesByDeviceID
{
  return self->_remoteDevicesByDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevicesByDeviceID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationEventSubscribersByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_mdcsEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_mdcsEventPublisher, 0);
  objc_storeStrong((id *)&self->_firedRegistrationInfos, 0);
  objc_storeStrong((id *)&self->_firedRegistrations, 0);
  objc_storeStrong((id *)&self->_openRegistrations, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)informClientOfFiredRegistration:(void *)a1 info:.cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v2, v3, "CDUserContext: posting notification for registration %@.", v4, v5, v6, v7, v8);
}

- (void)informClientOfFiredRegistration:info:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "CDUserContext: Invalid registration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)informClientOfFiredRegistration:(void *)a1 info:.cold.3(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v2, v3, "CDUserContext: sending event for registration %@.", v4, v5, v6, v7, v8);
}

- (void)sendEvent:toProxy:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unknown proxy source device id: %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendEvent:toClient:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unknown client identifier: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setMappingObject:forContextualKeyPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Failed to set mapping %@", v2, v3, v4, v5, v6);
}

- (void)tokenForSourceDeviceUUID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Missing token user id for proxy source device id %{public}@", v2, v3, v4, v5, v6);
}

- (void)tokenForSourceDeviceUUID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Missing token for uid %@", v2, v3, v4, v5, v6);
}

- (void)fetchProxySourceDeviceUUIDFromSubscriber:.cold.1()
{
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_ERROR, "CDUserContext: failed to create event to fetch proxy source device uuid", v1, 2u);
}

- (void)requestActivateDevicesFromSubscriber:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_ERROR, "CDUserContext: failed to create event to request activate devices", v1, 2u);
}

- (void)addSubscriber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unknown event stream name: %{public}@", v2, v3, v4, v5, v6);
}

@end