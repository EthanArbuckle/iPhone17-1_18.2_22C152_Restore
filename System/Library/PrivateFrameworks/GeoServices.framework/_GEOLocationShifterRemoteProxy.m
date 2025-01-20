@interface _GEOLocationShifterRemoteProxy
- (BOOL)_isLocationShiftRequiredForCoordinateInProcess:(id)a3;
- (BOOL)_isLocationShiftRequiredForCoordinateViaProxy:(id)a3;
- (BOOL)_isLocationShiftRequiredForRegionInProcess:(id)a3;
- (BOOL)_isLocationShiftRequiredForRegionViaProxy:(id)a3;
- (BOOL)isLocationShiftEnabled;
- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3;
- (BOOL)isLocationShiftRequiredForRegion:(id)a3;
- (NSCache)memoryCache;
- (OS_dispatch_queue)queue;
- (_GEOLocationShifterRemoteProxy)init;
- (unsigned)locationShiftFunctionVersion;
- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)flushDiskCache;
- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)pruneDiskCache;
- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5;
@end

@implementation _GEOLocationShifterRemoteProxy

- (_GEOLocationShifterRemoteProxy)init
{
  v15.receiver = self;
  v15.super_class = (Class)_GEOLocationShifterRemoteProxy;
  v2 = [(_GEOLocationShifterRemoteProxy *)&v15 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    shiftFunctionCache = v2->_shiftFunctionCache;
    v2->_shiftFunctionCache = v5;

    [(NSCache *)v2->_shiftFunctionCache setMinimumObjectCount:GEOConfigGetUInteger(GeoServicesConfig_LocationShiftMinimumNumberToKeep, (uint64_t)off_1E9113E78)];
    objc_initWeak(&location, v2);
    v7 = +[GEOResourceManifestConfiguration defaultConfiguration];
    GEOActiveTileGroupChangedInternalDarwinNotificationName(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = v2->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38___GEOLocationShifterRemoteProxy_init__block_invoke;
    v12[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v9, (int *)&init_dispatchToken, v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)isLocationShiftEnabled
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[GEOResourceManifestManager modernManagerNoCreate];
  int v4 = [v3 hasLoadedActiveTileGroup];

  if (v4)
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "going local for location shifting state", buf, 2u);
    }

    v6 = _GEOGetURLWithSource(15, 0, 1, 0);
    char v7 = [v6 length] != 0;
  }
  else
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__21;
    v28 = __Block_byref_object_dispose__21;
    id v29 = 0;
    queue = self->_queue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56___GEOLocationShifterRemoteProxy_isLocationShiftEnabled__block_invoke;
    v23[3] = &unk_1E53D89C0;
    v23[4] = self;
    v23[5] = buf;
    dispatch_async_and_wait(queue, v23);
    v9 = (void *)*((void *)v25 + 5);
    if (v9)
    {
      char v7 = [v9 BOOLValue];
    }
    else
    {
      v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "going to geod for location shifting state", v30, 2u);
      }

      v11 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"enabled" eventHandler:0];
      v12 = [[GEOLocationShiftingEnabledRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
      id v13 = [(GEOXPCRequest *)v12 sendSync:v11 error:0];
      v14 = v13;
      if (v13)
      {
        objc_super v15 = [v13 error];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "enabled"));
          v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          shiftingEnabled = self->_shiftingEnabled;
          self->_shiftingEnabled = v17;

          GEOFindOrCreateLog("com.apple.GeoServices", "GEOLocationShifter");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v20 = [v14 enabled];
            v21 = @"DISABLED";
            if (v20) {
              v21 = @"ENABLED";
            }
            *(_DWORD *)v30 = 138412290;
            v31 = v21;
            _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Caching location shifting %@", v30, 0xCu);
          }
        }
      }
      char v7 = [v14 enabled];
    }
    _Block_object_dispose(buf, 8);
  }
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)memoryCache
{
  return self->_shiftFunctionCache;
}

- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"shift" eventHandler:0];
  v12 = [[GEOLocationShiftingFunctionRequest alloc] initWithTraits:0 auditToken:v9 throttleToken:0];

  [(GEOLocationShiftingFunctionRequest *)v12 setLatLng:v10];
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___GEOLocationShifterRemoteProxy_shiftLatLng_auditToken_completionHandler___block_invoke;
  v15[3] = &unk_1E53DEFD0;
  id v16 = v8;
  id v14 = v8;
  [(GEOXPCRequest *)v12 send:v11 withReply:queue handler:v15];
}

- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  BOOL v6 = [(_GEOLocationShifterRemoteProxy *)self isLocationShiftEnabled];
  if (v6)
  {
    char v7 = +[GEOResourceManifestManager modernManagerNoCreate];
    int v8 = [v7 hasLoadedActiveTileGroup];

    if (v8)
    {
      LOBYTE(v6) = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForCoordinateInProcess:](self, "_isLocationShiftRequiredForCoordinateInProcess:", var0, var1);
    }
    else
    {
      LOBYTE(v6) = -[_GEOLocationShifterRemoteProxy _isLocationShiftRequiredForCoordinateViaProxy:](self, "_isLocationShiftRequiredForCoordinateViaProxy:", var0, var1);
    }
  }
  return v6;
}

- (BOOL)isLocationShiftRequiredForRegion:(id)a3
{
  id v4 = a3;
  if ([(_GEOLocationShifterRemoteProxy *)self isLocationShiftEnabled])
  {
    v5 = +[GEOResourceManifestManager modernManagerNoCreate];
    int v6 = [v5 hasLoadedActiveTileGroup];

    if (v6) {
      BOOL v7 = [(_GEOLocationShifterRemoteProxy *)self _isLocationShiftRequiredForRegionInProcess:v4];
    }
    else {
      BOOL v7 = [(_GEOLocationShifterRemoteProxy *)self _isLocationShiftRequiredForRegionViaProxy:v4];
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isLocationShiftRequiredForCoordinateInProcess:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = +[GEOResourceManifestManager modernManager];
  int v6 = [v5 activeTileGroup];
  BOOL v7 = [v6 locationShiftEnabledRegions];

  if ([v7 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "containsCoordinate:", var0, var1, (void)v13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_isLocationShiftRequiredForRegionInProcess:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_GEOLocationShifterRemoteProxy *)self isLocationShiftEnabled])
  {
    double v5 = GEOMapRectForMapRegion(v4);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = +[GEOResourceManifestManager modernManager];
    long long v13 = [v12 activeTileGroup];
    long long v14 = [v13 locationShiftEnabledRegions];

    if ([v14 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            double v19 = GEOMapRectForMapRegion(*(void **)(*((void *)&v24 + 1) + 8 * i));
            if (GEOMapRectIntersectsRect(v19, v20, v21, v22, v5, v7, v9, v11))
            {
              LOBYTE(v16) = 1;
              goto LABEL_13;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_isLocationShiftRequiredForCoordinateViaProxy:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v5 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"required" eventHandler:0];
  double v6 = [[GEOLocationShiftingIsRequiredRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  -[GEOLocationShiftingIsRequiredRequest setCoordinate:](v6, "setCoordinate:", var0, var1);
  double v7 = [(GEOXPCRequest *)v6 sendSync:v5 error:0];
  char v8 = [v7 required];

  return v8;
}

- (BOOL)_isLocationShiftRequiredForRegionViaProxy:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"required" eventHandler:0];
  double v5 = [[GEOLocationShiftingIsRequiredRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOLocationShiftingIsRequiredRequest *)v5 setRegion:v3];

  double v6 = [(GEOXPCRequest *)v5 sendSync:v4 error:0];
  char v7 = [v6 required];

  return v7;
}

- (unsigned)locationShiftFunctionVersion
{
  id v3 = +[GEOResourceManifestManager modernManagerNoCreate];
  int v4 = [v3 hasLoadedActiveTileGroup];

  if (v4)
  {
    double v5 = +[GEOResourceManifestManager modernManager];
    double v6 = [v5 activeTileGroup];
    unsigned int v7 = [v6 locationShiftVersion];

    return v7;
  }
  else
  {
    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__21;
    long long v24 = __Block_byref_object_dispose__21;
    id v25 = 0;
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62___GEOLocationShifterRemoteProxy_locationShiftFunctionVersion__block_invoke;
    v19[3] = &unk_1E53D89C0;
    v19[4] = self;
    v19[5] = &v20;
    dispatch_async_and_wait(queue, v19);
    double v10 = (void *)v21[5];
    if (v10)
    {
      unsigned int v11 = [v10 unsignedIntValue];
    }
    else
    {
      v12 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"version" eventHandler:0];
      long long v13 = [[GEOLocationShiftingVersionRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
      long long v14 = [(GEOXPCRequest *)v13 sendSync:v12 error:0];
      id v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 error];

        if (!v16)
        {
          objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "version"));
          uint64_t v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          shiftingFxnVersion = self->_shiftingFxnVersion;
          self->_shiftingFxnVersion = v17;
        }
      }
      unsigned int v11 = [v15 version];
    }
    _Block_object_dispose(&v20, 8);

    return v11;
  }
}

- (void)flushDiskCache
{
  id v3 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"flush" eventHandler:0];
  v2 = [[GEOLocationShiftingFlushCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOXPCRequest *)v2 send:v3];
}

- (void)pruneDiskCache
{
  id v3 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"prune" eventHandler:0];
  v2 = [[GEOLocationShiftingPruneCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOXPCRequest *)v2 send:v3];
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  unsigned int v7 = a3;
  id v8 = a5;
  double v9 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"list" eventHandler:0];
  double v10 = [[GEOLocationShiftingListCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  dispatch_group_enter(v7);
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67___GEOLocationShifterRemoteProxy_getAllShiftEntries_queue_handler___block_invoke;
  v14[3] = &unk_1E53DEFF8;
  id v15 = v7;
  id v16 = v8;
  v12 = v7;
  id v13 = v8;
  [(GEOXPCRequest *)v10 send:v9 withReply:queue handler:v14];
}

- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = +[GEOXPCConnection createServerConnectionFor:8 debugIdentifier:@"shift" eventHandler:0];
  double v10 = [[GEOLocationShiftingCachedResponseFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOLocationShiftingCachedResponseFetchRequest *)v10 setLatLng:v8];

  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110___GEOLocationShifterRemoteProxy_fetchCachedShiftFunctionResponseForLocation_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E53DF020;
  id v14 = v7;
  id v12 = v7;
  [(GEOXPCRequest *)v10 send:v9 withReply:queue handler:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftFunctionCache, 0);
  objc_storeStrong((id *)&self->_shiftingFxnVersion, 0);
  objc_storeStrong((id *)&self->_shiftingEnabled, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end