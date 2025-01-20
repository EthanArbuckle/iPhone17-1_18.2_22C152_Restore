@interface MPCPlayerPathCache
+ (MPCPlayerPathCache)sharedCache;
- (NSMutableDictionary)endpointInvalidationObservers;
- (NSMutableDictionary)endpointObservers;
- (NSMutableDictionary)playerPathObservers;
- (NSMutableDictionary)playerPathResolutions;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)calloutQueue;
- (id)_init;
- (id)observationTokenDescriptionForPlayerPath:(id)a3;
- (id)resolvedPlayerPathForPlayerPath:(id)a3;
- (void)_onQueue_clearObserversForPlayerPath:(id)a3;
- (void)_onQueue_registerForEndpointChangeWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4;
- (void)_onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4;
- (void)_onQueue_registerForInvalidationWithUnresolvedPlayerPath:(id)a3 invalidationPlayerPath:(void *)a4;
- (void)dealloc;
@end

@implementation MPCPlayerPathCache

- (void)_onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = [v7 route];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v7 route];
    v11 = [v10 endpoint];
    v12 = [v10 connection];
    if (v12)
    {
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v11 debugName];
        *(_DWORD *)buf = 138412546;
        id v26 = v6;
        __int16 v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for endpoint invalidations unresolved player path: %@, endpoint: %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      v15 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke;
      v22 = &unk_2643C4768;
      objc_copyWeak(&v24, (id *)buf);
      uint64_t v16 = *MEMORY[0x263F12378];
      id v17 = v6;
      id v23 = v17;
      v18 = [v15 addObserverForName:v16 object:v12 queue:0 usingBlock:&v19];

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointInvalidationObservers, "setObject:forKeyedSubscript:", v18, v17, v19, v20, v21, v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v5 || [v5 isInvalid])
  {
    id v6 = [[MPCFuture alloc] initWithQueue:*(void *)(a1[4] + 48)];
    uint64_t v7 = *(void *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setDebugLabel:@"resolvedPlayerPath"];
    [*(id *)(a1[4] + 8) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_2;
    v14[3] = &unk_2643C4670;
    v9 = (void *)a1[5];
    v14[4] = a1[4];
    id v15 = v9;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_4;
    v12[3] = &unk_2643C46C8;
    v12[4] = a1[4];
    long long v11 = *(_OWORD *)(a1 + 5);
    id v10 = (id)v11;
    long long v13 = v11;
    [v15 resolveWithRouteResolvedHandler:v14 completion:v12];
  }
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_5;
  block[3] = &unk_2643C46A0;
  id v14 = v6;
  id v15 = v5;
  uint64_t v16 = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  msv_dispatch_sync_on_queue();
}

uint64_t __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerForInvalidationWithUnresolvedPlayerPath:invalidationPlayerPath:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "mediaRemotePlayerPath"));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerForEndpointChangeWithUnresolvedPlayerPath:routeResolvedPlayerPath:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return objc_msgSend(v2, "_onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath:routeResolvedPlayerPath:", v3, v4);
}

- (void)_onQueue_registerForInvalidationWithUnresolvedPlayerPath:(id)a3 invalidationPlayerPath:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_initWeak(&location, self);
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    long long v13 = a4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for invalidation with player path %@ (unresolved %@)", buf, 0x16u);
  }

  objc_copyWeak(&v10, &location);
  id v9 = v6;
  v8 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler();
  [(NSMutableDictionary *)self->_playerPathObservers setObject:v8 forKeyedSubscript:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_onQueue_registerForEndpointChangeWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = [v6 deviceUID];
  if (v8)
  {
    id v9 = [v7 route];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [v7 route];
      long long v12 = [v11 endpoint];
      long long v13 = [v12 uniqueIdentifier];
      __int16 v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for endpoint topology changes with unresolved player path: %@, endpoint identifier: %@", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      id v15 = (void *)MRAVEndpointObserverCreateWithOutputDeviceUID();
      objc_copyWeak(&v18, (id *)buf);
      id v16 = v6;
      id v17 = v13;
      MRAVEndpointObserverAddEndpointChangedCallback();
      [(NSMutableDictionary *)self->_endpointObservers setObject:v15 forKeyedSubscript:v16];

      MEMORY[0x21D49CE30](v15);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (id)resolvedPlayerPathForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__25989;
  id v16 = __Block_byref_object_dispose__25990;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke;
  block[3] = &unk_2643C4648;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (MPCPlayerPathCache)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MPCPlayerPathCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedCache___onceToken != -1) {
    dispatch_once(&sharedCache___onceToken, block);
  }
  uint64_t v2 = (void *)sharedCache___sharedCache;

  return (MPCPlayerPathCache *)v2;
}

void __33__MPCPlayerPathCache_sharedCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlaybackCore/MRNowPlayingNotificationQueue", v3);
  id v5 = (void *)__mediaRemoteNotificationQueue;
  __mediaRemoteNotificationQueue = (uint64_t)v4;

  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  id v7 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = v6;
}

- (id)_init
{
  v18.receiver = self;
  v18.super_class = (Class)MPCPlayerPathCache;
  uint64_t v2 = [(MPCPlayerPathCache *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    playerPathResolutions = v2->_playerPathResolutions;
    v2->_playerPathResolutions = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    playerPathObservers = v2->_playerPathObservers;
    v2->_playerPathObservers = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    endpointObservers = v2->_endpointObservers;
    v2->_endpointObservers = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    endpointInvalidationObservers = v2->_endpointInvalidationObservers;
    v2->_endpointInvalidationObservers = (NSMutableDictionary *)v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCPlayerPathCache", v11);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCPlayerPathCache.callout", v14);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v15;

    _MRMediaRemoteRegisterForNowPlayingNotificationsEx();
  }
  return v2;
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_5(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = v2;
LABEL_3:
    id v5 = v3;
    [*(id *)(*(void *)(a1[8] + 8) + 40) finishWithError:v3];
    [*(id *)(a1[6] + 8) setObject:0 forKeyedSubscript:a1[7]];

    return;
  }
  if (!a1[5])
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"resolvedPlayerPath and error was nil");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  dispatch_queue_t v4 = *(void **)(*(void *)(a1[8] + 8) + 40);

  objc_msgSend(v4, "finishWithValue:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_endpointInvalidationObservers, 0);
  objc_storeStrong((id *)&self->_endpointObservers, 0);
  objc_storeStrong((id *)&self->_playerPathObservers, 0);

  objc_storeStrong((id *)&self->_playerPathResolutions, 0);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)endpointInvalidationObservers
{
  return self->_endpointInvalidationObservers;
}

- (NSMutableDictionary)endpointObservers
{
  return self->_endpointObservers;
}

- (NSMutableDictionary)playerPathObservers
{
  return self->_playerPathObservers;
}

- (NSMutableDictionary)playerPathResolutions
{
  return self->_playerPathResolutions;
}

- (void)_onQueue_clearObserversForPlayerPath:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointObservers, "objectForKeyedSubscript:");
  id v5 = (void *)v4;
  if (v4)
  {
    MEMORY[0x21D49CE50](v4);
    [(NSMutableDictionary *)self->_endpointObservers setObject:0 forKeyedSubscript:v9];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_playerPathObservers objectForKeyedSubscript:v9];
  if (v6)
  {
    MRMediaRemoteRemovePlayerPathInvalidationHandler();
    [(NSMutableDictionary *)self->_playerPathObservers setObject:0 forKeyedSubscript:v9];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_endpointInvalidationObservers objectForKeyedSubscript:v9];
  if (v7)
  {
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:v7];

    [(NSMutableDictionary *)self->_endpointInvalidationObservers setObject:0 forKeyedSubscript:v9];
  }
}

void __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[5];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2;
    block[3] = &unk_2643C6660;
    v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    dispatch_async(v6, block);
  }
}

void __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) object];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEBUG, "MRCPPC: Received invalidation for player path: %@, endpoint %@ ", (uint8_t *)&v6, 0x16u);
  }
  [v2 invalidate];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearObserversForPlayerPath:", *(void *)(a1 + 40));
}

void __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke(id *a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = WeakRetained[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2;
    v7[3] = &unk_2643C4718;
    __int16 v8 = WeakRetained;
    id v9 = a1[4];
    uint64_t v11 = a2;
    id v10 = a1[5];
    dispatch_async(v6, v7);
  }
}

void __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = [v3 uniqueIdentifier];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 48)];

  if ((v5 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEBUG, "MRCPPC: Received endpoint invalidation for unresolved player path: %@.", (uint8_t *)&v8, 0xCu);
    }

    [v2 invalidate];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearObserversForPlayerPath:", *(void *)(a1 + 40));
  }
}

void __102__MPCPlayerPathCache__onQueue_registerForInvalidationWithUnresolvedPlayerPath_invalidationPlayerPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v7 = [v6 result];
    int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      uint64_t v10 = a2;
      __int16 v11 = 2112;
      uint64_t v12 = [v7 mediaRemotePlayerPath];
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEBUG, "MRCPPC: Received invalidation for player path %@ (future player path: %@)", (uint8_t *)&v9, 0x16u);
    }

    [v6 invalidate];
    [v5[1] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    objc_msgSend(v5, "_onQueue_clearObserversForPlayerPath:", *(void *)(a1 + 32));
  }
}

- (id)observationTokenDescriptionForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__25989;
  id v16 = __Block_byref_object_dispose__25990;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MPCPlayerPathCache_observationTokenDescriptionForPlayerPath___block_invoke;
  block[3] = &unk_2643C4648;
  id v10 = v4;
  __int16 v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MPCPlayerPathCache_observationTokenDescriptionForPlayerPath___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_playerPathObservers allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        MRMediaRemoteRemovePlayerPathInvalidationHandler();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerPathCache;
  [(MPCPlayerPathCache *)&v8 dealloc];
}

@end