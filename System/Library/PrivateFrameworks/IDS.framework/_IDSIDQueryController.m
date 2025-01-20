@interface _IDSIDQueryController
+ (id)_createXPCConnectionOnQueue:(id)a3;
+ (void)initialize;
- (BOOL)_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 waitForReply:(BOOL)a8 completionBlock:(id)a9 completionBlockWithError:(id)a10;
- (BOOL)_flushQueryCacheForService:(id)a3;
- (BOOL)_hasCacheForService:(id)a3;
- (BOOL)_isListenerWithID:(id)a3 listeningToService:(id)a4;
- (BOOL)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRefresh:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 queue:(id)a12 completionBlock:(id)a13;
- (BOOL)_sync_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 completionBlock:(id)a8;
- (BOOL)_sync_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7;
- (BOOL)_sync_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7;
- (BOOL)_warmupQueryCacheForService:(id)a3;
- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8;
- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10;
- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 forceRefresh:(BOOL)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)removeListenerID:(id)a3 forService:(id)a4;
- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (_IDSIDQueryController)init;
- (_IDSIDQueryController)initWithDelegateContext:(id)a3 queueController:(id)a4;
- (id)__sendMessage:(id)a3 queue:(id)a4 reply:(id)a5 failBlock:(id)a6 waitForReply:(BOOL)a7;
- (id)_cacheForService:(id)a3;
- (id)_cachedStatusForDestination:(id)a3 service:(id)a4;
- (id)_delegateMapForListenerID:(id)a3 service:(id)a4;
- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5;
- (void)IDQueryCompletedWithFromURI:(id)a3 idStatusUpdates:(id)a4 service:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)___oldDealloc;
- (void)_callDelegatesForService:(id)a3 destinationToVerifierResult:(id)a4;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_callDelegatesWithBlock:(id)a3 delegateMap:(id)a4;
- (void)_connect;
- (void)_disconnectFromQueryService;
- (void)_idStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRenew:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 completionBlock:(id)a12;
- (void)_purgeIDStatusCache;
- (void)_purgeIDStatusCacheAfter:(double)a3;
- (void)_requestCacheForService:(id)a3 completionBlock:(id)a4;
- (void)_requestCachedStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 respectExpiry:(BOOL)a7 listenerID:(id)a8 completionBlock:(id)a9;
- (void)_requestIDInfoForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10;
- (void)_requestRemoteDevicesForDestination:(id)a3 fromID:(id)a4 service:(id)a5 listenerID:(id)a6 waitForReply:(BOOL)a7 completionBlock:(id)a8;
- (void)_requestStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 forceRefresh:(BOOL)a7 bypassLimit:(BOOL)a8 listenerID:(id)a9 completionBlock:(id)a10;
- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5;
- (void)_updateCacheWithDictionary:(id)a3 service:(id)a4;
- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addListenerID:(id)a3 forService:(id)a4;
- (void)daemonDisconnected;
- (void)dealloc;
- (void)flushQueryCache;
- (void)ktPeerVerificationResultsUpdated:(id)a3 forService:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5;
- (void)setFromID:(id)a3;
@end

@implementation _IDSIDQueryController

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && qword_1EB2BD730 != -1)
  {
    dispatch_once(&qword_1EB2BD730, &unk_1EE2467A8);
  }
}

- (_IDSIDQueryController)init
{
  v13.receiver = self;
  v13.super_class = (Class)_IDSIDQueryController;
  uint64_t v2 = [(_IDSIDQueryController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    id delegateContext = v3->_delegateContext;
    v3->_id delegateContext = 0;

    serviceToken = v3->_serviceToken;
    v3->_serviceToken = 0;

    listenerIDToServicesMap = v3->_listenerIDToServicesMap;
    v3->_listenerIDToServicesMap = 0;

    delegateToInfo = v3->_delegateToInfo;
    v3->_delegateToInfo = 0;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("_IDSIDQueryControllerConnectionQueue", v9);
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v10;
  }
  return v3;
}

- (_IDSIDQueryController)initWithDelegateContext:(id)a3 queueController:(id)a4
{
  id v5 = a4;
  v6 = [(_IDSIDQueryController *)self init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F59E30] weakRefWithObject:v6->_delegateContext];
    id delegateContext = v6->_delegateContext;
    v6->_id delegateContext = (id)v7;

    connection = v6->_connection;
    v6->_connection = 0;

    uint64_t v10 = [v5 queue];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    if (!v6->_queue)
    {
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("_IDSIDQueryControllerQueue", v12);
      v14 = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v13;
    }
    uint64_t v15 = [NSString stringGUID];
    serviceToken = v6->_serviceToken;
    v6->_serviceToken = (NSString *)v15;

    uint64_t v17 = [NSString stringGUID];
    listenerGUID = v6->_listenerGUID;
    v6->_listenerGUID = (NSString *)v17;

    v19 = +[IDSDaemonController sharedInstance];
    v20 = [v19 listener];
    [v20 addHandler:v6];
  }
  return v6;
}

- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v40 = v10;
    __int16 v41 = 2112;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2048;
    id v46 = v13;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "addDelegate:forService:listenerID:queue:  (delegate: %p)   (service: %@)   (listenerID: %@)   (queue: %p)", buf, 0x2Au);
  }

  if (v10 && v13 && [v11 length] && objc_msgSend(v12, "length"))
  {
    listeners = self->_listeners;
    if (!listeners)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v17 = self->_listeners;
      self->_listeners = Mutable;

      listeners = self->_listeners;
    }
    v18 = [(NSMutableDictionary *)listeners objectForKey:v12];
    v19 = (void *)[v18 mutableCopy];
    v20 = v19;
    if (v19) {
      v21 = v19;
    }
    else {
      v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v22 = v21;

    v23 = [v22 objectForKey:v11];
    v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    }
    v26 = v25;

    v27 = [v26 objectForKey:v10];
    v28 = v27;
    if (v27) {
      id v29 = v27;
    }
    else {
      id v29 = objc_alloc_init(MEMORY[0x1E4F6B420]);
    }
    v30 = v29;

    [v30 setQueue:v13];
    [v26 setObject:v30 forKey:v10];
    [v22 setObject:v26 forKey:v11];
    [(NSMutableDictionary *)self->_listeners setObject:v22 forKey:v12];
    v31 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(NSMutableDictionary *)self->_listeners allKeys];
      *(_DWORD *)buf = 138412290;
      v40 = v32;
      _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "Listeners after ADD %@", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector())
    {
      v38 = v30;
      v33 = +[IDSDaemonController sharedInstance];
      listenerGUID = self->_listenerGUID;
      v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
      [v33 addListenerID:listenerGUID services:v35];

      v36 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_listenerGUID;
        *(_DWORD *)buf = 138412290;
        v40 = v37;
        _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "Adding listener for KT Peer Verification Results notification: %@", buf, 0xCu);
      }

      v30 = v38;
    }
  }
  else
  {
    v22 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Invalid add delegate params -- bailing...", buf, 2u);
    }
  }
}

- (void)daemonDisconnected
{
}

- (void)_purgeIDStatusCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19190D998;
  block[3] = &unk_1E5729000;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)___oldDealloc
{
  serviceToken = self->_serviceToken;
  self->_serviceToken = 0;

  listenerIDToServicesMap = self->_listenerIDToServicesMap;
  self->_listenerIDToServicesMap = 0;

  delegateToInfo = self->_delegateToInfo;
  self->_delegateToInfo = 0;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      uint64_t v7 = [(NSMapTable *)self->_delegateToInfo objectForKey:v11];

      if (!v7)
      {
        if (!self->_delegateToInfo)
        {
          v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v8;
        }
        id v10 = objc_alloc_init(MEMORY[0x1E4F6B420]);
        [v10 setQueue:v6];
        [(NSMapTable *)self->_delegateToInfo setObject:v10 forKey:v11];
      }
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMapTable *)self->_delegateToInfo removeObjectForKey:v4];
    if (![(NSMapTable *)self->_delegateToInfo count])
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_callDelegatesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = self->_delegateToInfo;
    uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [(NSMapTable *)self->_delegateToInfo objectForKey:v9];
          id v11 = [v10 queue];
          if (v11)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_19194FD28;
            block[3] = &unk_1E5729880;
            id v12 = v13;
            block[4] = v9;
            id v15 = v12;
            dispatch_async(v11, block);
          }
        }
        uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
}

- (void)_connect
{
  if (!self->_serviceToken)
  {
    self->_serviceToken = [NSString stringGUID];
    MEMORY[0x1F41817F8]();
  }
}

- (void)IDQueryCompletedWithFromURI:(id)a3 idStatusUpdates:(id)a4 service:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v29 = a6;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  context = (void *)MEMORY[0x192FE0160]();
  v14 = (void *)MEMORY[0x1E4F28DC0];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v28 = v18;
  v20 = v10;
  uint64_t v21 = objc_msgSend(v15, "setWithObjects:", v16, v17, v28, v19, objc_opt_class(), 0);
  id v34 = 0;
  v22 = [v14 _strictlyUnarchivedObjectOfClasses:v21 fromData:v11 error:&v34];
  id v23 = v34;

  v24 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = @"NO";
    *(_DWORD *)buf = 138413570;
    id v36 = v10;
    __int16 v37 = 2112;
    if (v29) {
      id v25 = @"YES";
    }
    v38 = v22;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v25;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2112;
    id v46 = v23;
    _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "Received IDQueryCompletedWithFromURI %@ idStatusUpdates %@ service %@ success %@ error %@ decodeError %@", buf, 0x3Eu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191950038;
  block[3] = &unk_1E57291B8;
  block[4] = self;
  id v33 = v22;
  id v27 = v22;
  dispatch_async(queue, block);
}

- (void)addListenerID:(id)a3 forService:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSMutableDictionary *)a3;
  id v7 = a4;
  v8 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "addListener:forService:", (uint8_t *)&v18, 2u);
  }

  if (![(NSMutableDictionary *)v6 length])
  {
    id v13 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    uint64_t v17 = "ListenerID is empty, bailing...";
LABEL_20:
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 2u);
    goto LABEL_21;
  }
  if (![v7 length])
  {
    id v13 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    uint64_t v17 = "Service name is empty, bailing...";
    goto LABEL_20;
  }
  listenerIDToServicesMap = self->_listenerIDToServicesMap;
  if (!listenerIDToServicesMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v11 = self->_listenerIDToServicesMap;
    self->_listenerIDToServicesMap = Mutable;

    listenerIDToServicesMap = self->_listenerIDToServicesMap;
  }
  id v12 = [(NSMutableDictionary *)listenerIDToServicesMap objectForKey:v6];
  id v13 = [v12 mutableCopy];

  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (([v13 containsObject:v7] & 1) == 0)
  {
    [v13 addObject:v7];
    v14 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "%@ -> %@", (uint8_t *)&v18, 0x16u);
    }
  }
  [(NSMutableDictionary *)self->_listenerIDToServicesMap setObject:v13 forKey:v6];
  id v15 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = self->_listenerIDToServicesMap;
    int v18 = 138412290;
    uint64_t v19 = v16;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Final map after add %@", (uint8_t *)&v18, 0xCu);
  }

LABEL_21:
}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSMutableDictionary *)a3;
  id v7 = a4;
  v8 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "removeListenerID:forService:", (uint8_t *)&v20, 2u);
  }

  if (![(NSMutableDictionary *)v6 length])
  {
    id v10 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v14 = "ListenerID is empty, bailing...";
LABEL_14:
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 2u);
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if (![v7 length])
  {
    id v10 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v14 = "Service name is empty, bailing...";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_listenerIDToServicesMap objectForKey:v6];
  id v10 = [v9 mutableCopy];

  if (v10)
  {
    [v10 removeObject:v7];
    id v11 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "%@ -> %@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v12 = [v10 count];
    listenerIDToServicesMap = self->_listenerIDToServicesMap;
    if (v12) {
      [(NSMutableDictionary *)listenerIDToServicesMap setObject:v10 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)listenerIDToServicesMap removeObjectForKey:v6];
    }
  }
  uint64_t v16 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = self->_listenerIDToServicesMap;
    int v20 = 138412290;
    uint64_t v21 = v17;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Final map after remove %@", (uint8_t *)&v20, 0xCu);
  }

  if (![(NSMutableDictionary *)self->_listenerIDToServicesMap count])
  {
    int v18 = self->_listenerIDToServicesMap;
    self->_listenerIDToServicesMap = 0;
  }
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

- (void)_disconnectFromQueryService
{
  v3 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out _connection, we're disconnecting", buf, 2u);
  }

  if (self->_connection)
  {
    id v4 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Forcing a disconnect, terminating connection", v6, 2u);
    }

    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (void)_requestCacheForService:(id)a3 completionBlock:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSMutableDictionary *)a3;
  id v7 = a4;
  if ([(NSMutableDictionary *)v6 length])
  {
    v8 = +[IDSLogging IDQuery];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v6;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Cache request for service %@", buf, 0xCu);
      }

      id v10 = [NSString stringGUID];
      id v11 = (void *)[v7 copy];
      transactionIDToBlockMap = self->_transactionIDToBlockMap;
      if (!transactionIDToBlockMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v14 = self->_transactionIDToBlockMap;
        self->_transactionIDToBlockMap = Mutable;

        transactionIDToBlockMap = self->_transactionIDToBlockMap;
      }
      BOOL v15 = (void *)MEMORY[0x192FE03B0](v11);
      [(NSMutableDictionary *)transactionIDToBlockMap setObject:v15 forKey:v10];

      uint64_t v16 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = self->_transactionIDToBlockMap;
        *(_DWORD *)buf = 138412290;
        id v42 = v17;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
      }

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1919D9A50;
      v38[3] = &unk_1E572C8E8;
      v38[4] = self;
      v8 = v10;
      __int16 v39 = v8;
      int v18 = v6;
      id v40 = v18;
      uint64_t v19 = (void (**)(void, void))MEMORY[0x192FE03B0](v38);
      xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
      uint64_t v21 = v20;
      if (v20)
      {
        xpc_dictionary_set_BOOL(v20, "service-cache-request", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        if (byte_1EB2BD678) {
          xpc_dictionary_set_BOOL(v21, "is-springboard", 1);
        }
        __int16 v22 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v42 = v18;
          __int16 v43 = 2112;
          id v44 = v8;
          _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Sending cache request for service %@ transactionID %@", buf, 0x16u);
        }

        uint64_t v23 = [(_IDSIDQueryController *)self __sendMessage:v21 queue:0 reply:0 failBlock:v19 waitForReply:1];
        if (!v23) {
          goto LABEL_31;
        }
        uint64_t v24 = (void *)v23;
        v35 = v19;
        id v36 = v7;
        id v25 = IMGetXPCStringFromDictionary();
        uint64_t v37 = IMGetXPCDictionaryFromDictionary();
        v26 = IMGetXPCStringFromDictionary();
        objc_opt_class();
        id v27 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
        uint64_t v28 = [(NSMutableDictionary *)self->_transactionIDToBlockMap objectForKey:v26];
        BOOL v29 = (void (**)(void, void, void, void, void))[v28 copy];

        v30 = (void *)v37;
        if (v29) {
          ((void (**)(void, uint64_t, void *, void, void *))v29)[2](v29, v37, v25, 0, v27);
        }
        if (v26)
        {
          [(NSMutableDictionary *)self->_transactionIDToBlockMap removeObjectForKey:v26];
          v31 = +[IDSLogging IDQuery];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = self->_transactionIDToBlockMap;
            *(_DWORD *)buf = 138412290;
            id v42 = v32;
            _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "transactionID map after REMOVE %@", buf, 0xCu);
          }

          v30 = (void *)v37;
        }

        uint64_t v19 = v35;
        id v7 = v36;
      }
      else
      {
        id v34 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "Could not create message for cache query", buf, 2u);
        }

        id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-1000 userInfo:0];
        ((void (**)(void, void *))v19)[2](v19, v25);
      }

LABEL_31:
      goto LABEL_32;
    }
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v42 = 0;
      id v33 = "No block %p, bailing...";
      goto LABEL_26;
    }
  }
  else
  {
    v8 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v6;
      id v33 = "No service %@, bailing...";
LABEL_26:
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
    }
  }
LABEL_32:
}

- (void)_requestCachedStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 respectExpiry:(BOOL)a7 listenerID:(id)a8 completionBlock:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  if (![v17 length])
  {
    id v27 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    id v50 = v17;
    id v36 = "No service %@, bailing...";
LABEL_23:
    _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    goto LABEL_31;
  }
  if (![v18 length])
  {
    id v27 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    id v50 = v18;
    id v36 = "No listenerID %@, bailing...";
    goto LABEL_23;
  }
  if (v19)
  {
    BOOL v39 = v10;
    BOOL v40 = v11;
    xpc_object_t v20 = [NSString stringGUID];
    uint64_t v21 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v50 = v15;
      __int16 v51 = 2112;
      id v52 = v17;
      __int16 v53 = 2112;
      id v54 = v18;
      __int16 v55 = 2112;
      v56 = v20;
      _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "Cached ID status request (destinations: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    __int16 v22 = (void *)[v19 copy];
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      id v25 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    v26 = (void *)MEMORY[0x192FE03B0](v22);
    [(NSMutableDictionary *)transactionIDToBlockMap setObject:v26 forKey:v20];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1919DA08C;
    v45[3] = &unk_1E572C910;
    v45[4] = self;
    id v27 = v20;
    id v46 = v27;
    id v28 = v17;
    id v47 = v28;
    id v29 = v18;
    id v48 = v29;
    uint64_t v41 = MEMORY[0x192FE03B0](v45);
    if ([v15 count])
    {
      xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
      v31 = v30;
      if (v30)
      {
        xpc_dictionary_set_BOOL(v30, "cached-id-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        if (v16)
        {
          v38 = objc_msgSend(v16, "unprefixedURI", v28, 0);
          IMInsertNSStringsToXPCDictionary();
        }
        if (byte_1EB2BD678) {
          xpc_dictionary_set_BOOL(v31, "is-springboard", 1);
        }
        if (v39) {
          xpc_dictionary_set_BOOL(v31, "respect-expiry", 1);
        }
        queue = self->_queue;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = sub_1919DA14C;
        v42[3] = &unk_1E572C938;
        v42[4] = self;
        __int16 v43 = v27;
        id v44 = v29;
        id v33 = self;
        id v34 = (void *)v41;
        id v35 = [(_IDSIDQueryController *)v33 __sendMessage:v31 queue:queue reply:v42 failBlock:v41 waitForReply:v40];
      }
      else
      {
        id v34 = (void *)v41;
      }
    }
    else
    {
      uint64_t v37 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v37, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      id v34 = (void *)v41;
      if (!v41) {
        goto LABEL_30;
      }
      v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-2000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v31);
    }

LABEL_30:
    goto LABEL_31;
  }
  id v27 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v50 = 0;
    id v36 = "No block %p, bailing...";
    goto LABEL_23;
  }
LABEL_31:
}

- (void)_requestStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 forceRefresh:(BOOL)a7 bypassLimit:(BOOL)a8 listenerID:(id)a9 completionBlock:(id)a10
{
  BOOL v10 = a8;
  BOOL v48 = a7;
  BOOL v11 = a6;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = (NSMutableDictionary *)a5;
  id v18 = (NSMutableDictionary *)a9;
  id v19 = a10;
  if (![(NSMutableDictionary *)v17 length])
  {
    v31 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v59 = v17;
    BOOL v39 = "No service %@, bailing...";
LABEL_27:
    _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
    goto LABEL_35;
  }
  if (![(NSMutableDictionary *)v18 length])
  {
    v31 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v59 = v18;
    BOOL v39 = "No listenerID %@, bailing...";
    goto LABEL_27;
  }
  if (v19)
  {
    BOOL v43 = v10;
    BOOL v44 = v11;
    uint64_t v45 = v16;
    xpc_object_t v20 = [NSString stringGUID];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = sub_1919DA9DC;
    v56[3] = &unk_1E572BD60;
    uint64_t v21 = v17;
    uint64_t v57 = v21;
    id v47 = v15;
    objc_msgSend(v15, "__imArrayByApplyingBlock:", v56);
    __int16 v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v59 = v22;
      __int16 v60 = 2112;
      v61 = v21;
      __int16 v62 = 2112;
      v63 = v18;
      __int16 v64 = 2112;
      v65 = v20;
      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "ID status renewal request (destinations: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    id v46 = v19;
    uint64_t v24 = (void *)[v19 copy];
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      id v27 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    id v28 = (void *)MEMORY[0x192FE03B0](v24);
    [(NSMutableDictionary *)transactionIDToBlockMap setObject:v28 forKey:v20];

    id v29 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v30 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      v59 = v30;
      _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1919DA9F4;
    v52[3] = &unk_1E572C910;
    v52[4] = self;
    v31 = v20;
    __int16 v53 = v31;
    v32 = v21;
    id v54 = v32;
    id v33 = v18;
    __int16 v55 = v33;
    id v34 = (void (**)(void, void))MEMORY[0x192FE03B0](v52);
    if ([v47 count])
    {
      xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
      id v36 = v35;
      id v19 = v46;
      if (v35)
      {
        xpc_dictionary_set_BOOL(v35, "id-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        uint64_t v41 = v32;
        IMInsertNSStringsToXPCDictionary();
        id v16 = v45;
        if (v45)
        {
          id v42 = objc_msgSend(v45, "unprefixedURI", v41, 0);
          IMInsertNSStringsToXPCDictionary();
        }
        if (v48) {
          xpc_dictionary_set_BOOL(v36, "force", 1);
        }
        if (v43) {
          xpc_dictionary_set_BOOL(v36, "bypass-limit", 1);
        }
        if (byte_1EB2BD678) {
          xpc_dictionary_set_BOOL(v36, "is-springboard", 1);
        }
        queue = self->_queue;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = sub_1919DAAB4;
        v49[3] = &unk_1E572C938;
        v49[4] = self;
        id v50 = v31;
        __int16 v51 = v33;
        id v38 = [(_IDSIDQueryController *)self __sendMessage:v36 queue:queue reply:v49 failBlock:v34 waitForReply:v44];

        id v19 = v46;
        id v15 = v47;
      }
      else
      {
        id v15 = v47;
        id v16 = v45;
      }
    }
    else
    {
      BOOL v40 = +[IDSLogging IDQuery];
      id v19 = v46;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v40, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      id v15 = v47;
      id v16 = v45;
      if (!v34) {
        goto LABEL_34;
      }
      id v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-2000 userInfo:0];
      ((void (**)(void, void *))v34)[2](v34, v36);
    }

LABEL_34:
    goto LABEL_35;
  }
  v31 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v59 = 0;
    BOOL v39 = "No block %p, bailing...";
    goto LABEL_27;
  }
LABEL_35:
}

- (void)_requestRemoteDevicesForDestination:(id)a3 fromID:(id)a4 service:(id)a5 listenerID:(id)a6 waitForReply:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v14 = (NSMutableDictionary *)a3;
  id v15 = a4;
  id v16 = (NSMutableDictionary *)a5;
  id v17 = (NSMutableDictionary *)a6;
  id v18 = a8;
  if (![(NSMutableDictionary *)v16 length])
  {
    id v28 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    id v54 = v16;
    BOOL v39 = "No service %@, bailing...";
LABEL_25:
    _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
    goto LABEL_33;
  }
  if (![(NSMutableDictionary *)v17 length])
  {
    id v28 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    id v54 = v17;
    BOOL v39 = "No listenerID %@, bailing...";
    goto LABEL_25;
  }
  if (v18)
  {
    BOOL v43 = v9;
    uint64_t v45 = v15;
    id v19 = [NSString stringGUID];
    xpc_object_t v20 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v54 = v14;
      __int16 v55 = 2112;
      v56 = v16;
      __int16 v57 = 2112;
      v58 = v17;
      __int16 v59 = 2112;
      __int16 v60 = v19;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "ID remote device request (destination: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    uint64_t v21 = (void *)[v18 copy];
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v24 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    id v25 = (void *)MEMORY[0x192FE03B0](v21);
    [(NSMutableDictionary *)transactionIDToBlockMap setObject:v25 forKey:v19];

    v26 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      id v54 = v27;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1919DB34C;
    v49[3] = &unk_1E572C910;
    v49[4] = self;
    id v28 = v19;
    id v50 = v28;
    id v29 = v16;
    __int16 v51 = v29;
    xpc_object_t v30 = v17;
    id v52 = v30;
    uint64_t v44 = MEMORY[0x192FE03B0](v49);
    v31 = [(NSMutableDictionary *)v14 destinationURIs];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
      id v34 = v33;
      if (v33)
      {
        xpc_dictionary_set_BOOL(v33, "remote-device-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        uint64_t v41 = v29;
        IMInsertNSStringsToXPCDictionary();
        id v15 = v45;
        if (v45)
        {
          id v42 = objc_msgSend(v45, "unprefixedURI", v41, 0);
          IMInsertNSStringsToXPCDictionary();
        }
        if (byte_1EB2BD678) {
          xpc_dictionary_set_BOOL(v34, "is-springboard", 1);
        }
        if (v43) {
          xpc_dictionary_set_BOOL(v34, "disallow-query", 1);
        }
        queue = self->_queue;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = sub_1919DB40C;
        v46[3] = &unk_1E572C938;
        v46[4] = self;
        id v47 = v28;
        BOOL v48 = v30;
        id v36 = queue;
        uint64_t v37 = (void *)v44;
        id v38 = [(_IDSIDQueryController *)self __sendMessage:v34 queue:v36 reply:v46 failBlock:v44 waitForReply:v43];
      }
      else
      {
        uint64_t v37 = (void *)v44;
        id v15 = v45;
      }
    }
    else
    {
      BOOL v40 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v40, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      uint64_t v37 = (void *)v44;
      id v15 = v45;
      if (!v44) {
        goto LABEL_32;
      }
      id v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-2000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v34);
    }

LABEL_32:
    goto LABEL_33;
  }
  id v28 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v54 = 0;
    BOOL v39 = "No block %p, bailing...";
    goto LABEL_25;
  }
LABEL_33:
}

- (void)_requestIDInfoForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v15 = (NSMutableDictionary *)a3;
  id v16 = a4;
  id v17 = (NSMutableDictionary *)a5;
  id v18 = a7;
  id v19 = (NSMutableDictionary *)a8;
  id v20 = a10;
  if (![(NSMutableDictionary *)v17 length])
  {
    xpc_object_t v30 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    __int16 v55 = v17;
    uint64_t v41 = "No service %@, bailing...";
LABEL_23:
    _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
    goto LABEL_31;
  }
  if (![(NSMutableDictionary *)v19 length])
  {
    xpc_object_t v30 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    __int16 v55 = v19;
    uint64_t v41 = "No listenerID %@, bailing...";
    goto LABEL_23;
  }
  if (v20)
  {
    uint64_t v45 = v18;
    id v46 = v16;
    uint64_t v21 = [NSString stringGUID];
    __int16 v22 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v55 = v15;
      __int16 v56 = 2112;
      __int16 v57 = v17;
      __int16 v58 = 2112;
      __int16 v59 = v19;
      __int16 v60 = 2112;
      uint64_t v61 = v21;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "ID remote device request (destination: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    uint64_t v23 = (void *)[v20 copy];
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v26 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    id v27 = (void *)MEMORY[0x192FE03B0](v23);
    [(NSMutableDictionary *)transactionIDToBlockMap setObject:v27 forKey:v21];

    id v28 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      __int16 v55 = v29;
      _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1919DBCD8;
    v50[3] = &unk_1E572C910;
    v50[4] = self;
    xpc_object_t v30 = v21;
    __int16 v51 = v30;
    id v52 = v17;
    v31 = v19;
    __int16 v53 = v31;
    uint64_t v44 = MEMORY[0x192FE03B0](v50);
    uint64_t v32 = [(NSMutableDictionary *)v15 destinationURIs];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v35 = v34;
      if (v34)
      {
        xpc_dictionary_set_BOOL(v34, "id-status-info-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        IMInsertIntsToXPCDictionary();
        id v18 = v45;
        IMInsertKeyedCodableObjectsToXPCDictionary();
        if (v46)
        {
          BOOL v43 = objc_msgSend(v46, "unprefixedURI", v45, 0);
          IMInsertNSStringsToXPCDictionary();
        }
        if (byte_1EB2BD678) {
          xpc_dictionary_set_BOOL(v35, "is-springboard", 1);
        }
        queue = self->_queue;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = sub_1919DBD98;
        v47[3] = &unk_1E572C938;
        v47[4] = self;
        BOOL v48 = v30;
        v49 = v31;
        uint64_t v37 = [v45 waitForReply];
        id v38 = queue;
        BOOL v39 = (void *)v44;
        id v40 = [(_IDSIDQueryController *)self __sendMessage:v35 queue:v38 reply:v47 failBlock:v44 waitForReply:v37];

        id v16 = v46;
      }
      else
      {
        id v18 = v45;
        id v16 = v46;
        BOOL v39 = (void *)v44;
      }
    }
    else
    {
      id v42 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      id v18 = v45;
      id v16 = v46;
      BOOL v39 = (void *)v44;
      if (!v44) {
        goto LABEL_30;
      }
      xpc_object_t v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-2000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v35);
    }

LABEL_30:
    goto LABEL_31;
  }
  xpc_object_t v30 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v55 = 0;
    uint64_t v41 = "No block %p, bailing...";
    goto LABEL_23;
  }
LABEL_31:
}

- (id)__sendMessage:(id)a3 queue:(id)a4 reply:(id)a5 failBlock:(id)a6 waitForReply:(BOOL)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (!v13)
    {
      id v13 = dispatch_get_global_queue(0, 0);
    }
    connection = self->_connection;
    if (connection)
    {
      id v17 = connection;
    }
    else
    {
      id v19 = [(id)objc_opt_class() _createXPCConnectionOnQueue:self->_connectionQueue];
      id v20 = self->_connection;
      self->_connection = v19;

      uint64_t v21 = self->_connection;
      if (!v21)
      {
        uint64_t v24 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "No connection to send message on", buf, 2u);
        }
        id v17 = 0;
        xpc_object_t v18 = 0;
        goto LABEL_16;
      }
      id v17 = v21;
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = sub_1919DC3D0;
      uint64_t v33 = &unk_1E5729000;
      xpc_object_t v34 = self;
      IMXPCConfigureConnection();
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1919DC4C4;
    v27[3] = &unk_1E572C960;
    id v28 = v15;
    id v29 = v14;
    __int16 v22 = (void (**)(void, void))MEMORY[0x192FE03B0](v27);
    uint64_t v23 = [MEMORY[0x1E4F28F80] processInfo];
    v26 = [v23 processName];
    IMInsertNSStringsToXPCDictionary();

    if (a7)
    {
      xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v17, v12);
      if (v22) {
        ((void (**)(void, xpc_object_t))v22)[2](v22, v18);
      }
    }
    else
    {
      xpc_connection_send_message_with_reply(v17, v12, v13, v22);
      xpc_object_t v18 = 0;
    }

    uint64_t v24 = v28;
LABEL_16:

    goto LABEL_17;
  }
  id v17 = +[IDSLogging IDQuery];
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = 0;
    _os_log_impl(&dword_19190B000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "No message to send %@, ignoring...", buf, 0xCu);
  }
  xpc_object_t v18 = 0;
LABEL_17:

  return v18;
}

+ (id)_createXPCConnectionOnQueue:(id)a3
{
  v3 = (void *)*MEMORY[0x1E4F6B5E0];
  id v4 = a3;
  [v3 UTF8String];
  uint64_t v5 = (void *)IMXPCCreateConnectionForServiceWithQueue();

  return v5;
}

- (void)dealloc
{
  [(_IDSIDQueryController *)self ___oldDealloc];
  [(_IDSIDQueryController *)self _disconnectFromQueryService];
  v3 = +[IDSDaemonController sharedInstance];
  [v3 removeListenerID:self->_listenerGUID];

  id v4 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [v4 listener];
  [v5 removeHandler:self];

  v6.receiver = self;
  v6.super_class = (Class)_IDSIDQueryController;
  [(_IDSIDQueryController *)&v6 dealloc];
}

- (void)setFromID:(id)a3
{
  v3 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "This has been deprecated, please adopt the preferredFromID query APIs", v4, 2u);
  }
}

- (BOOL)_isListenerWithID:(id)a3 listeningToService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v8 = [(NSMutableDictionary *)self->_listenerIDToServicesMap objectForKey:v6];
    if ([v8 containsObject:v7])
    {
      BOOL v9 = 1;
    }
    else
    {
      BOOL v10 = [(NSMutableDictionary *)self->_listeners objectForKey:v6];
      BOOL v11 = v10;
      if (v10)
      {
        id v12 = [v10 objectForKey:v7];
        BOOL v9 = v12 != 0;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_cacheForService:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_idStatusCache objectForKey:a3];
}

- (id)_cachedStatusForDestination:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_idStatusCache && [v6 length] && objc_msgSend(v7, "length"))
  {
    v8 = [(_IDSIDQueryController *)self _cacheForService:v7];
    BOOL v9 = [v8 objectForKey:v6];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateCacheWithDictionary:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_idStatusCache)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    idStatusCache = self->_idStatusCache;
    self->_idStatusCache = Mutable;

    [(_IDSIDQueryController *)self _purgeIDStatusCacheAfter:5.0];
  }
  if ([v6 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1919EBE18;
    v12[3] = &unk_1E572A440;
    v12[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else if ([v7 length])
  {
    BOOL v10 = self->_idStatusCache;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    [(NSMutableDictionary *)v10 setObject:v11 forKey:v7];
  }
}

- (void)_purgeIDStatusCacheAfter:(double)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self->_idStatusCache);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1919EBFBC;
  block[3] = &unk_1E5729568;
  objc_copyWeak(&v8, &location);
  block[4] = self;
  dispatch_after(v5, queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_callDelegatesWithBlock:(id)a3 delegateMap:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            id v13 = [v7 objectForKey:v12];
            id v14 = [v13 queue];
            if (v14)
            {
              v16[0] = MEMORY[0x1E4F143A8];
              v16[1] = 3221225472;
              v16[2] = sub_1919EC210;
              v16[3] = &unk_1E5729880;
              id v15 = v5;
              v16[4] = v12;
              id v17 = v15;
              dispatch_async(v14, v16);
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
  }
}

- (id)_delegateMapForListenerID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && [v7 length])
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_listeners objectForKey:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      BOOL v11 = [v9 objectForKey:v8];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_callDelegatesForService:(id)a3 destinationToVerifierResult:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "count"))
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_listeners allValues];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) objectForKey:v6];
          if (v13)
          {
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = sub_1919EC498;
            v14[3] = &unk_1E572CDA0;
            id v15 = v6;
            id v16 = v7;
            [(_IDSIDQueryController *)self _callDelegatesWithBlock:v14 delegateMap:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5
{
  int v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    uint64_t v11 = v10;
    if (v10)
    {
      xpc_dictionary_set_BOOL(v10, "set-id-status", 1);
      IMInsertIntsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      uint64_t v12 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        int v15 = v6;
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Sending ID status update (%d) for service %@ destination %@", buf, 0x1Cu);
      }

      id v13 = [(_IDSIDQueryController *)self __sendMessage:v11 queue:0 reply:0 failBlock:0 waitForReply:0];
    }
  }
}

- (void)flushQueryCache
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_BOOL(v3, "flush-query-cache", 1);
    id v5 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Sending query cache flush", v7, 2u);
    }

    id v6 = [(_IDSIDQueryController *)self __sendMessage:v4 queue:0 reply:0 failBlock:0 waitForReply:0];
  }
}

- (void)_idStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRenew:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 completionBlock:(id)a12
{
  BOOL v12 = a8;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a12;
  if (![v18 count])
  {
    uint64_t v23 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "No destinations, bailing...";
LABEL_25:
    _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    goto LABEL_26;
  }
  if (![v19 length])
  {
    uint64_t v23 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "No service, bailing...";
    goto LABEL_25;
  }
  if (![v21 length])
  {
    uint64_t v23 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "No listenerID, bailing...";
    goto LABEL_25;
  }
  if (!v22)
  {
    uint64_t v23 = +[IDSLogging IDQuery];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "No query complete block, bailing...";
    goto LABEL_25;
  }
  uint64_t v23 = [(_IDSIDQueryController *)self _cacheForService:v19];
  if (!v23 || a7)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1919ECC70;
    v47[3] = &unk_1E572CDC8;
    v47[4] = self;
    id v42 = v19;
    id v48 = v42;
    id v39 = v21;
    id v49 = v39;
    id v50 = v22;
    xpc_object_t v34 = (void *)MEMORY[0x192FE03B0](v47);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_1919ED200;
    v44[3] = &unk_1E572CDF0;
    BOOL v46 = a9;
    v44[4] = self;
    id v45 = v34;
    id v37 = v34;
    uint64_t v35 = MEMORY[0x192FE03B0](v44);
    uint64_t v36 = (void *)v35;
    if (a7 || a10) {
      [(_IDSIDQueryController *)self _requestStatusForDestinations:v18 fromID:v20 service:v42 waitForReply:a9 forceRefresh:a10 bypassLimit:a11 listenerID:v39 completionBlock:v35];
    }
    else {
      [(_IDSIDQueryController *)self _requestCachedStatusForDestinations:v18 fromID:v20 service:v42 waitForReply:a9 respectExpiry:v12 listenerID:v39 completionBlock:v35];
    }
  }
  else
  {
    id v38 = (void (**)(void, void *))v22;
    id v40 = v21;
    id v41 = v20;
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v43 = v18;
    id v25 = v18;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v31 = [(_IDSIDQueryController *)self _cachedStatusForDestination:v30 service:v19];
          if (v31) {
            [v24 setObject:v31 forKey:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v27);
    }

    uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F59E18]) initWithSuccess:v24];
    id v22 = v38;
    v38[2](v38, v32);

    id v20 = v41;
    id v18 = v43;
    id v21 = v40;
  }
LABEL_26:
}

- (BOOL)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRefresh:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 queue:(id)a12 completionBlock:(id)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a12;
  id v24 = a13;
  if (!v24)
  {
    id v25 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "No completion block, bailing...";
      goto LABEL_15;
    }
LABEL_16:
    BOOL v34 = 0;
    goto LABEL_17;
  }
  if (!v23 && !a9)
  {
    id v25 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "No queue, bailing...";
LABEL_15:
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (![v22 length])
  {
    id v25 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "No listener ID, bailing...";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (![v19 count])
  {
    id v25 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "No destinations, bailing...";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1919ED618;
  v37[3] = &unk_1E572CE18;
  BOOL v40 = a9;
  id v39 = v24;
  id v38 = v23;
  uint64_t v27 = MEMORY[0x192FE03B0](v37);
  BOOL v28 = v13;
  id v29 = v22;
  id v30 = v19;
  id v31 = v21;
  id v32 = v20;
  uint64_t v33 = (void *)v27;
  *(_WORD *)((char *)&v36 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v36) = a9;
  -[_IDSIDQueryController _idStatusForDestinations:service:preferredFromID:listenerID:allowRenew:respectExpiry:waitForReply:forceRefresh:bypassLimit:completionBlock:](self, "_idStatusForDestinations:service:preferredFromID:listenerID:allowRenew:respectExpiry:waitForReply:forceRefresh:bypassLimit:completionBlock:", v30, v32, v31, v29, v14, v28, v36, v27);

  id v20 = v32;
  id v21 = v31;
  id v19 = v30;
  id v22 = v29;

  BOOL v34 = 1;
  id v25 = v39;
LABEL_17:

  return v34;
}

- (BOOL)_sync_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7
{
  BYTE2(v8) = 0;
  LOWORD(v8) = 1;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v8, 0, a7);
}

- (BOOL)_sync_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 completionBlock:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1919ED820;
  v18[3] = &unk_1E572B2E0;
  id v19 = v14;
  id v15 = v14;
  BYTE2(v17) = 0;
  LOWORD(v17) = 1;
  LOBYTE(a7) = -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a7, 0, v9, v17, 0, v18);

  return (char)a7;
}

- (BOOL)_sync_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7
{
  return [(_IDSIDQueryController *)self _currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:a5 listenerID:a6 queue:0 waitForReply:1 completionBlock:a7 completionBlockWithError:0];
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 forceRefresh:(BOOL)a7 queue:(id)a8 completionBlock:(id)a9
{
  BYTE2(v10) = 0;
  BYTE1(v10) = a7;
  LOBYTE(v10) = 0;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v10, a8, a9);
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = IMSingleObjectArray();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1919EDA84;
  v25[3] = &unk_1E572CE40;
  id v27 = v15;
  id v28 = v16;
  id v26 = v14;
  id v21 = v15;
  id v22 = v14;
  id v23 = v16;
  LOBYTE(self) = [(_IDSIDQueryController *)self refreshIDStatusForDestinations:v20 service:v21 preferredFromID:v19 listenerID:v18 forceRefresh:0 queue:v17 completionBlock:v25];

  return (char)self;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  BYTE2(v9) = 1;
  LOWORD(v9) = 0;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v9, a7, a8);
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = IMSingleObjectArray();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1919EDD6C;
  v24[3] = &unk_1E572CE68;
  id v25 = v14;
  id v26 = v15;
  id v21 = v14;
  id v22 = v15;
  LOBYTE(self) = [(_IDSIDQueryController *)self requiredIDStatusForDestinations:v20 service:v19 preferredFromID:v18 listenerID:v17 queue:v16 completionBlock:v24];

  return (char)self;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  BOOL v11 = a6;
  id v16 = a9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1919EDF4C;
  v20[3] = &unk_1E572B2E0;
  id v21 = v16;
  id v17 = v16;
  BYTE2(v19) = 0;
  LOWORD(v19) = 0;
  LOBYTE(a8) = -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a7, 0, v11, v19, a8, v20);

  return (char)a8;
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = IMSingleObjectArray();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1919EE138;
  v25[3] = &unk_1E572CE90;
  id v26 = v15;
  id v27 = v16;
  id v22 = v15;
  id v23 = v16;
  LOBYTE(v11) = [(_IDSIDQueryController *)self currentIDStatusForDestinations:v21 service:v20 preferredFromID:v19 respectExpiry:v11 listenerID:v18 queue:v17 completionBlock:v25];

  return v11;
}

- (BOOL)_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 waitForReply:(BOOL)a8 completionBlock:(id)a9 completionBlockWithError:(id)a10
{
  BOOL v10 = a8;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1919EE3E0;
  v37[3] = &unk_1E572CEE0;
  void v37[4] = self;
  id v38 = v16;
  id v40 = v18;
  id v41 = v19;
  BOOL v42 = v10;
  id v39 = v17;
  id v33 = v17;
  id v32 = v19;
  id v31 = v18;
  id v20 = v16;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = (void *)MEMORY[0x192FE03B0](v37);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1919EEA48;
  v34[3] = &unk_1E572CDF0;
  BOOL v36 = v10;
  v34[4] = self;
  id v35 = v24;
  id v25 = v24;
  id v26 = (void *)MEMORY[0x192FE03B0](v34);
  id v27 = (void *)MEMORY[0x1E4F6B438];
  id v28 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];

  id v29 = [v27 destinationWithDestinations:v28];

  [(_IDSIDQueryController *)self _requestRemoteDevicesForDestination:v29 fromID:v21 service:v22 listenerID:v20 waitForReply:v10 completionBlock:v26];
  return 1;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return [(_IDSIDQueryController *)self _currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:a5 listenerID:a6 queue:a7 waitForReply:0 completionBlock:a8 completionBlockWithError:0];
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8
{
  return [(_IDSIDQueryController *)self _currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:a5 listenerID:a6 queue:a7 waitForReply:0 completionBlock:0 completionBlockWithError:a8];
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1919EEDBC;
  v32[3] = &unk_1E572CF58;
  v32[4] = self;
  id v33 = v16;
  id v35 = v17;
  id v36 = v18;
  id v34 = v15;
  id v19 = v17;
  id v20 = v15;
  id v30 = v18;
  id v21 = v16;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)MEMORY[0x192FE03B0](v32);
  id v26 = (void *)MEMORY[0x1E4F6B438];
  id v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];

  id v28 = [v26 destinationWithDestinations:v27];

  [(_IDSIDQueryController *)self _requestIDInfoForDestinations:v28 fromID:v22 service:v23 infoTypes:a6 options:v20 listenerID:v21 queue:v19 completionBlock:v25];
  return 1;
}

- (BOOL)_hasCacheForService:(id)a3
{
  return self->_idStatusCache != 0;
}

- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v5 = -[_IDSIDQueryController _cachedStatusForDestination:service:](self, "_cachedStatusForDestination:service:", a3, a4, a5);
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (BOOL)_warmupQueryCacheForService:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "_warmupQueryCacheForService:  (service: %@)", buf, 0xCu);
  }

  uint64_t v6 = [v4 length];
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1919EF578;
    v9[3] = &unk_1E572CF80;
    v9[4] = self;
    id v10 = v4;
    [(_IDSIDQueryController *)self _requestCacheForService:v10 completionBlock:v9];
  }
  else
  {
    id v7 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", buf, 2u);
    }
  }
  return v6 != 0;
}

- (BOOL)_flushQueryCacheForService:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "_flushQueryCacheForService:  (service: %@)", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 length];
  if (v6)
  {
    p_super = &self->_idStatusCache->super.super;
    self->_idStatusCache = 0;
  }
  else
  {
    p_super = +[IDSLogging IDQuery];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19190B000, p_super, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", (uint8_t *)&v9, 2u);
    }
  }

  return v6 != 0;
}

- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218498;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "removeDelegate:forService:listenerID:  (delegate: %p)   (service: %@)   (listenerID: %@)", (uint8_t *)&v19, 0x20u);
  }

  if (v8 && [v9 length] && objc_msgSend(v10, "length"))
  {
    id v12 = [(NSMutableDictionary *)self->_listeners objectForKey:v10];
    uint64_t v13 = [v12 mutableCopy];

    id v14 = [v13 objectForKey:v9];
    id v15 = v14;
    if (v13 && v14)
    {
      [v14 removeObjectForKey:v8];
      if (![v15 count]) {
        [v13 removeObjectForKey:v9];
      }
      if (![v13 count]) {
        [(NSMutableDictionary *)self->_listeners removeObjectForKey:v10];
      }
      if (![(NSMutableDictionary *)self->_listeners count])
      {
        listeners = self->_listeners;
        self->_listeners = 0;
      }
      id v17 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(NSMutableDictionary *)self->_listeners allKeys];
        int v19 = 138412290;
        id v20 = v18;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Listeners after REMOVE %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v13 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Invalid remove delegate params -- bailing...", (uint8_t *)&v19, 2u);
    }
  }
}

- (void)ktPeerVerificationResultsUpdated:(id)a3 forService:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28DC0];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v12 = (void *)qword_1EB2BD6B8;
  uint64_t v23 = qword_1EB2BD6B8;
  if (!qword_1EB2BD6B8)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v25 = sub_1919EFD28;
    id v26 = &unk_1E5728DD0;
    id v27 = &v20;
    sub_1919EFD28((uint64_t)&buf);
    id v12 = (void *)v21[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v20, 8);
  id v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v13, 0);
  id v19 = 0;
  id v15 = [v8 unarchivedObjectOfClasses:v14 fromData:v6 error:&v19];
  id v16 = v19;

  id v17 = +[IDSLogging IDQuery];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Error unarchiving resultData -- dropping { unarchiveError: %@ }", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Successfully unarchived results: %@", (uint8_t *)&buf, 0xCu);
    }

    [(_IDSIDQueryController *)self _callDelegatesForService:v7 destinationToVerifierResult:v15];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_listenerIDToServicesMap, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transactionIDToBlockMap, 0);
  objc_storeStrong((id *)&self->_idStatusCache, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_listenerGUID, 0);
}

@end