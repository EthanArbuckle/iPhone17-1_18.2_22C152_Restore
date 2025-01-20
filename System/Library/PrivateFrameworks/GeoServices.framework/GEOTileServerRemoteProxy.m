@interface GEOTileServerRemoteProxy
- (GEOTileServerRemoteProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8;
- (unint64_t)calculateFreeableSizeSync;
- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3;
- (void)_handleEditionUpgrade:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handleNetworkBegan:(id)a3;
- (void)_handleTile:(id)a3;
- (void)beginPreloadSessionOfSize:(unint64_t)a3;
- (void)calculateFreeableSize;
- (void)cancel:(const void *)a3 batchID:(int)a4;
- (void)dealloc;
- (void)endPreloadSession;
- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6;
- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5;
- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3;
- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12;
- (void)reportCorruptTile:(const void *)a3;
- (void)reprioritizeKey:(const void *)a3 newPriority:(unsigned int)a4 batchID:(int)a5;
- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOTileServerRemoteProxy

void __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

- (void)_handleEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C1203C0]();
  v6 = GEOGetTileServerRemoteProxyLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    v8 = (char *)MEMORY[0x18C121170](v4);
    v9 = GEOGetTileServerRemoteProxyLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "event: %s", buf, 0xCu);
    }

    free(v8);
  }
  uint64_t v10 = MEMORY[0x18C1213B0](v4);
  if (v10 == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_remote_connection(v4);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    v15 = [(OS_dispatch_queue *)self->_connectionIncomingQueue xpcConnection];

    if (v4 != (id)MEMORY[0x1E4F14528] || v14 && v14 == v15)
    {
      uint64_t v16 = -15;
    }
    else
    {
      v20 = GEOGetTileServerRemoteProxyLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v14;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_INFO, "Connection invalid from cancelled connection <%p>", buf, 0xCu);
      }

      uint64_t v16 = -2;
    }
    v17 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:v16];
    delegateQueue = self->super._delegateQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__GEOTileServerRemoteProxy__handleEvent___block_invoke;
    v21[3] = &unk_1E53D8998;
    v21[4] = self;
    id v22 = v17;
    id v19 = v17;
    dispatch_async(delegateQueue, v21);
  }
  else if (v10 == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v4, "event");
    if (string)
    {
      v12 = string;
      if (!strcmp("tiles.tile", string))
      {
        [(GEOTileServerRemoteProxy *)self _handleTile:v4];
      }
      else if (!strcmp("tiles.err", v12))
      {
        [(GEOTileServerRemoteProxy *)self _handleError:v4];
      }
      else if (!strcmp("tiles.net", v12))
      {
        [(GEOTileServerRemoteProxy *)self _handleNetworkBegan:v4];
      }
      else if (!strcmp("tiles.upgrade", v12))
      {
        [(GEOTileServerRemoteProxy *)self _handleEditionUpgrade:v4];
      }
      else if (strcmp("tiles.finished", v12))
      {
        v13 = GEOGetTileServerRemoteProxyLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v24 = v12;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Unhandled event type %{public}s", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_handleTile:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v33 = 0uLL;
  if (getTileKeyFromXPCDictionary(&v33, v4))
  {
    v5 = xpc_dictionary_get_value(v4, "tileData");
    if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
    {
      id v26 = 0;
      uint64_t v10 = [[GEOTileData alloc] initWithXPCDictionary:v5 error:&v26];
      v11 = (GEOTileData *)v26;
      if (v10)
      {
LABEL_13:
        id v19 = xpc_dictionary_get_value(v4, "tileInfo");
        v20 = v19;
        if (v19)
        {
          id v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "_geo_dictionaryFromXPCObject:", v19);
        }
        delegateQueue = self->super._delegateQueue;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __40__GEOTileServerRemoteProxy__handleTile___block_invoke_2;
        v29[3] = &unk_1E53E1358;
        long long v32 = v33;
        v29[4] = self;
        v30 = v10;
        id v31 = v19;
        id v22 = v19;
        v14 = v10;
        dispatch_async(delegateQueue, v29);

        goto LABEL_16;
      }
      uint64_t v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Failed to decode tile data over XPC"];

      if (v10)
      {
        v12 = objc_alloc_init(GEOTileKeyList);
        [(GEOTileKeyList *)v12 addKey:&v33];
        v13 = self->super._delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__GEOTileServerRemoteProxy__handleTile___block_invoke;
        block[3] = &unk_1E53D99F0;
        block[4] = self;
        v24 = v12;
        uint64_t v25 = v10;
        v11 = v10;
        v14 = v12;
        dispatch_async(v13, block);

LABEL_16:
        goto LABEL_17;
      }
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    uint64_t v6 = MEMORY[0x18C1213B0](v5);
    uint64_t v7 = MEMORY[0x1E4F14580];
    if (v6 != MEMORY[0x1E4F14580])
    {
LABEL_17:

      goto LABEL_18;
    }
    v8 = xpc_dictionary_get_value(v4, "tileData");
    if (MEMORY[0x18C1213B0]() == v7)
    {
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      size_t length = xpc_data_get_length(v8);
      global_queue = geo_get_global_queue();
      destructor[0] = MEMORY[0x1E4F143A8];
      destructor[1] = 3221225472;
      destructor[2] = __dataFromXPCDictionary_block_invoke;
      destructor[3] = &unk_1E53D79D8;
      id v28 = v8;
      id v18 = v8;
      v9 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);

      if (v9) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v9 = [MEMORY[0x1E4F1C9B8] data];
LABEL_11:
    uint64_t v10 = [[GEOTileData alloc] initWithData:v9];

    goto LABEL_12;
  }
LABEL_18:
}

- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3
{
  id v4 = GEOGetTileLoadingLog();
  v5 = v4;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v5, OS_SIGNPOST_INTERVAL_END, a3, "TileLoaderRequest.client", "", v6, 2u);
  }
}

- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5
{
  uint64_t v7 = GEOGetTileLoadingLog();
  v8 = v7;
  if ((a5 & 0x40) != 0)
  {
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      v9 = "PreliminaryOnly=1";
      uint64_t v10 = buf;
      goto LABEL_8;
    }
  }
  else if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    __int16 v11 = 0;
    v9 = "";
    uint64_t v10 = (uint8_t *)&v11;
LABEL_8:
    _os_signpost_emit_with_name_impl(&dword_188D96000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "TileLoaderRequest.client", v9, v10, 2u);
  }
}

void __40__GEOTileServerRemoteProxy__handleTile___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) loadedTile:*(void *)(a1 + 40) forKey:&v3 info:*(void *)(a1 + 48)];
}

- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12
{
  __int16 v18 = a11;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a12;
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v21, "message", "tiles.lt");
  v45 = v20;
  if (v20)
  {
    id v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
    v23 = v22;
    if (v22)
    {
      id v24 = v19;
      uint64_t v25 = self;
      id v26 = a5;
      v27 = a6;
      id v28 = a8;
      id v29 = v22;
      v43 = a7;
      uint64_t v30 = [v29 bytes];
      id v31 = v29;
      a8 = v28;
      a6 = v27;
      a5 = v26;
      self = v25;
      id v19 = v24;
      __int16 v18 = a11;
      size_t v32 = [v31 length];
      long long v33 = (const void *)v30;
      a7 = v43;
      xpc_dictionary_set_data(v21, "__audit_token", v33, v32);
    }
  }
  v44 = (void *)[v19 newXPCData];
  xpc_dictionary_set_value(v21, "list", v44);
  xpc_dictionary_set_int64(v21, "batch", a4);
  xpc_object_t v34 = xpc_data_create(a5, 4 * [v19 count]);
  xpc_dictionary_set_value(v21, "priorities", v34);
  xpc_object_t v35 = xpc_data_create(a6, [v19 count]);
  xpc_dictionary_set_value(v21, "has_additional_infos", v35);
  xpc_object_t v36 = xpc_data_create(a7, 16 * [v19 count]);
  xpc_dictionary_set_value(v21, "additional_infos", v36);
  xpc_object_t v37 = xpc_data_create(a8, 8 * [v19 count]);
  xpc_dictionary_set_value(v21, "signposts", v37);
  if (a9)
  {
    xpc_object_t v38 = xpc_data_create(a9, 8 * [v19 count]);
    xpc_dictionary_set_value(v21, "ctime", v38);
  }
  xpc_dictionary_set_uint64(v21, "reason", a10);
  xpc_dictionary_set_BOOL(v21, "disk", v18 & 1);
  xpc_dictionary_set_BOOL(v21, "net", (v18 & 2) != 0);
  xpc_dictionary_set_BOOL(v21, "wifi", (v18 & 8) != 0);
  xpc_dictionary_set_BOOL(v21, "preload", (v18 & 4) != 0);
  if ((v18 & 0x100) != 0) {
    xpc_dictionary_set_BOOL(v21, "proactively_load_on_failure", 1);
  }
  setManifestConfiguration(v21, self->super._manifestConfiguration);
  setLocale(v21, self->super._locale);
  v39 = (void *)MEMORY[0x18C121170](v21);
  v40 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v48 = v39;
    _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_DEBUG, "load tiles: %s", buf, 0xCu);
  }

  free(v39);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  uint64_t v42 = *(void *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __142__GEOTileServerRemoteProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke;
  v46[3] = &unk_1E53E1380;
  v46[4] = self;
  [(OS_dispatch_queue *)connectionIncomingQueue sendMessage:v21 withReply:v42 handler:v46];
}

- (GEOTileServerRemoteProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)GEOTileServerRemoteProxy;
  id v20 = [(GEOTileServerProxy *)&v35 initWithCacheDBLocation:v14 cacheFilesLocation:v15 manifestConfiguration:v16 locale:v17 delegateQueue:v18 delegate:v19];
  if (v20)
  {
    id v29 = v15;
    uint64_t v21 = geo_dispatch_queue_create();
    id v22 = (void *)*((void *)v20 + 6);
    *((void *)v20 + 6) = v21;

    objc_initWeak(&location, v20);
    uint64_t v23 = *((void *)v20 + 6);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke;
    v32[3] = &unk_1E53DF960;
    objc_copyWeak(&v33, &location);
    uint64_t v24 = +[GEOXPCConnection createServerConnectionFor:16 debugIdentifier:@"TileServer" queue:v23 eventHandler:v32];
    uint64_t v25 = (void *)*((void *)v20 + 7);
    *((void *)v20 + 7) = v24;

    [*((id *)v20 + 7) setReconnectAutomatically:1];
    id v26 = _GEOTileLoaderDidDeleteExternalTileDataDarwinNotification;
    v27 = *((void *)v20 + 6);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_2;
    handler[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch(v26, (int *)v20 + 11, v27, handler);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    id v15 = v29;
  }

  return (GEOTileServerRemoteProxy *)v20;
}

uint64_t __142__GEOTileServerRemoteProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEvent:a2];
}

void __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)WeakRetained + 1);
    uint64_t v4 = v3;
    if (v3)
    {
      v5 = v2[2];
      if (v5)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_6;
        v6[3] = &unk_1E53D8998;
        id v7 = v3;
        v8 = v2;
        dispatch_async(v5, v6);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: strongSelf->_delegateQueue != ((void *)0)", buf, 2u);
      }
    }
  }
}

uint64_t __123__GEOTileServerRemoteProxy_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) proxyDidDeleteExternalTileData:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connectionIncomingQueue = self->_connectionIncomingQueue;
    *(_DWORD *)buf = 134217984;
    v8 = connectionIncomingQueue;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Closed open connection <%p>", buf, 0xCu);
  }

  v5 = self->_connectionIncomingQueue;
  self->_connectionIncomingQueue = 0;

  notify_cancel(*(&self->super._resourceNotificationToken + 1));
  v6.receiver = self;
  v6.super_class = (Class)GEOTileServerRemoteProxy;
  [(GEOTileServerProxy *)&v6 dealloc];
}

void __41__GEOTileServerRemoteProxy__handleEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) failedToLoadAllPendingTilesWithError:*(void *)(a1 + 40)];
}

void __40__GEOTileServerRemoteProxy__handleTile___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained proxy:a1[4] failedToLoadTiles:a1[5] error:a1[6]];
}

- (void)_handleError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0uLL;
  if (getTileKeyFromXPCDictionary(&v19, v4))
  {
    v5 = xpc_dictionary_get_value(v4, "err");
    if (v5)
    {
      objc_super v6 = objc_msgSend(MEMORY[0x1E4F28C58], "_geo_errorFromXPCData:", v5);
      if ([v6 code] == -5)
      {
        id v7 = [v6 domain];
        v8 = GEOErrorDomain();
        int v9 = [v7 isEqualToString:v8];

        if (v9)
        {
          uint64_t v10 = GEOGetTileLoadingLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "Process attempted to load a restricted tile without the corresponding entitlement", buf, 2u);
          }
        }
      }
    }
    else
    {
      objc_super v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    }
    __int16 v11 = objc_alloc_init(GEOTileKeyList);
    [(GEOTileKeyList *)v11 addKey:&v19];
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__GEOTileServerRemoteProxy__handleError___block_invoke;
    block[3] = &unk_1E53D99F0;
    block[4] = self;
    id v16 = v11;
    id v17 = v6;
    id v13 = v6;
    id v14 = v11;
    dispatch_async(delegateQueue, block);
  }
}

void __41__GEOTileServerRemoteProxy__handleError___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained proxy:a1[4] failedToLoadTiles:a1[5] error:a1[6]];
}

- (void)_handleNetworkBegan:(id)a3
{
  id v4 = xpc_dictionary_get_value(a3, "list");
  v5 = +[GEOTileKeyList listFromXPCData:v4];
  delegateQueue = self->super._delegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__GEOTileServerRemoteProxy__handleNetworkBegan___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(delegateQueue, v8);
}

void __48__GEOTileServerRemoteProxy__handleNetworkBegan___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) willGoToNetworkForTiles:*(void *)(a1 + 40)];
}

- (void)_handleEditionUpgrade:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = xpc_dictionary_get_value(a3, "UserInfo");
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  objc_super v6 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Edition upgrade: %@", buf, 0xCu);
  }

  delegateQueue = self->super._delegateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__GEOTileServerRemoteProxy__handleEditionUpgrade___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(delegateQueue, v9);
}

void __50__GEOTileServerRemoteProxy__handleEditionUpgrade___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOTileDBEditionUpgradeNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)reprioritizeKey:(const void *)a3 newPriority:(unsigned int)a4 batchID:(int)a5
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "message", "tiles.reprioritize");
  xpc_dictionary_set_data(xdict, "key", a3, 0x10uLL);
  xpc_dictionary_set_uint64(xdict, "priority", a4);
  xpc_dictionary_set_int64(xdict, "batch", a5);
  setManifestConfiguration(xdict, a1[3]);
  setLocale(xdict, a1[4]);
  [a1[7] sendMessage:xdict];
}

- (void)cancel:(const void *)a3 batchID:(int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "message", "tiles.x");
  xpc_dictionary_set_data(v7, "key", a3, 0x10uLL);
  xpc_dictionary_set_int64(v7, "batch", a4);
  setManifestConfiguration(v7, a1[3]);
  setLocale(v7, a1[4]);
  id v8 = (void *)MEMORY[0x18C121170](v7);
  id v9 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    __int16 v11 = v8;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "cancel load: %s", (uint8_t *)&v10, 0xCu);
  }

  free(v8);
  [a1[7] sendMessage:v7];
}

- (void)reportCorruptTile:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.corrupt");
  xpc_dictionary_set_data(v5, "key", a3, 0x10uLL);
  setManifestConfiguration(v5, a1[3]);
  setLocale(v5, a1[4]);
  objc_super v6 = (void *)MEMORY[0x18C121170](v5);
  xpc_object_t v7 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = v6;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "corrupt: %s", (uint8_t *)&v8, 0xCu);
  }

  free(v6);
  [a1[7] sendMessage:v5];
}

- (void)calculateFreeableSize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.canshrink");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  id v4 = (void *)MEMORY[0x18C121170](v3);
  xpc_object_t v5 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "getFreeableSize: %s", buf, 0xCu);
  }

  free(v4);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  uint64_t v7 = *(void *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke;
  v8[3] = &unk_1E53E1380;
  v8[4] = self;
  [(OS_dispatch_queue *)connectionIncomingQueue sendMessage:v3 withReply:v7 handler:v8];
}

void __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "sz");
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke_2;
  v6[3] = &unk_1E53D79B0;
  void v6[4] = v4;
  v6[5] = uint64;
  dispatch_async(v5, v6);
}

void __49__GEOTileServerRemoteProxy_calculateFreeableSize__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) canShrinkDiskCacheByAmount:*(void *)(a1 + 40)];
}

- (unint64_t)calculateFreeableSizeSync
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.canshrinkSync");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  uint64_t v4 = (void *)MEMORY[0x18C121170](v3);
  xpc_object_t v5 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "getFreeableSize: %s", buf, 0xCu);
  }

  free(v4);
  objc_super v6 = [(OS_dispatch_queue *)self->_connectionIncomingQueue sendMessageWithReplySync:v3];
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "sz");
  delegateQueue = self->super._delegateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__GEOTileServerRemoteProxy_calculateFreeableSizeSync__block_invoke;
  v10[3] = &unk_1E53D79B0;
  v10[4] = self;
  v10[5] = uint64;
  dispatch_async(delegateQueue, v10);

  return uint64;
}

void __53__GEOTileServerRemoteProxy_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) canShrinkDiskCacheByAmount:*(void *)(a1 + 40)];
}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "message", "tiles.shrink");
  xpc_dictionary_set_uint64(v10, "sz", a3);
  setManifestConfiguration(v10, self->super._manifestConfiguration);
  setLocale(v10, self->super._locale);
  uint64_t v11 = (void *)MEMORY[0x18C121170](v10);
  uint64_t v12 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = v11;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "shrinkDiskCacheToSize: %s", buf, 0xCu);
  }

  free(v11);
  connectionIncomingQueue = self->_connectionIncomingQueue;
  uint64_t v14 = *(void *)&self->_diskCacheDeletedExternalDataNotifyToken;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E53DE268;
  id v18 = v8;
  id v19 = v9;
  id v15 = v8;
  id v16 = v9;
  [(OS_dispatch_queue *)connectionIncomingQueue sendMessage:v10 withReply:v14 handler:v17];
}

void __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "sz");
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = uint64;
    objc_super v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke_2;
    v7[3] = &unk_1E53D8C38;
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __82__GEOTileServerRemoteProxy_shrinkDiskCacheToSize_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.shrinkSync");
  xpc_dictionary_set_uint64(v5, "sz", a3);
  setManifestConfiguration(v5, self->super._manifestConfiguration);
  setLocale(v5, self->super._locale);
  objc_super v6 = (void *)MEMORY[0x18C121170](v5);
  uint64_t v7 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    uint64_t v12 = v6;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "shrinkDiskCacheToSize: %s", (uint8_t *)&v11, 0xCu);
  }

  free(v6);
  id v8 = [(OS_dispatch_queue *)self->_connectionIncomingQueue sendMessageWithReplySync:v5];
  uint64_t uint64 = xpc_dictionary_get_uint64(v8, "sz");

  return uint64;
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "message", "tiles.bpld");
  xpc_dictionary_set_uint64(v5, "sz", a3);
  setManifestConfiguration(v5, self->super._manifestConfiguration);
  setLocale(v5, self->super._locale);
  objc_super v6 = (void *)MEMORY[0x18C121170](v5);
  uint64_t v7 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    uint64_t v9 = v6;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "beginPreloadSessionOfSize: %s", (uint8_t *)&v8, 0xCu);
  }

  free(v6);
  [(OS_dispatch_queue *)self->_connectionIncomingQueue sendMessage:v5];
}

- (void)endPreloadSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "message", "tiles.epld");
  setManifestConfiguration(v3, self->super._manifestConfiguration);
  setLocale(v3, self->super._locale);
  uint64_t v4 = (void *)MEMORY[0x18C121170](v3);
  xpc_object_t v5 = GEOGetTileServerRemoteProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    uint64_t v7 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "endPreloadSession: %s", (uint8_t *)&v6, 0xCu);
  }

  free(v4);
  [(OS_dispatch_queue *)self->_connectionIncomingQueue sendMessage:v3];
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  id v10 = a4;
  int v11 = a5;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v13, "message", "tiles.enumerate");
  xpc_dictionary_set_BOOL(v13, "include_data", a3);
  setManifestConfiguration(v13, self->super._manifestConfiguration);
  setLocale(v13, self->super._locale);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke;
  v18[3] = &unk_1E53E13A8;
  id v14 = v12;
  id v19 = v14;
  id v15 = +[GEOXPCConnection createServerConnectionFor:16 debugIdentifier:@"TileEnumeration" queue:v10 eventHandler:v18];
  if (v15)
  {
    dispatch_group_enter(v11);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2;
    v16[3] = &unk_1E53E1380;
    id v17 = v11;
    [v15 sendMessage:v13 withReply:v10 handler:v16];
  }
}

void __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = [[GEOTileEnumeration alloc] initWithXPCDictionary:v3 error:0];
    xpc_object_t v5 = v4;
    if (v4)
    {
      v16[0] = 0;
      v16[1] = 0;
      int v6 = [(GEOTileEnumeration *)v4 key];
      [v6 getBytes:v16 length:16];

      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [(GEOTileEnumeration *)v5 data];
      uint64_t v9 = [(GEOTileEnumeration *)v5 current];
      id v10 = [(GEOTileEnumeration *)v5 eTag];
      uint64_t v11 = [(GEOTileEnumeration *)v5 originalLoadReason];
      [(GEOTileEnumeration *)v5 age];
      char v12 = (*(uint64_t (**)(uint64_t, void *, void *, uint64_t, void *, uint64_t))(v7 + 16))(v7, v16, v8, v9, v10, v11);

      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      id v14 = reply;
      if (reply)
      {
        xpc_dictionary_get_remote_connection(reply);
        id v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          xpc_dictionary_set_BOOL(v14, "cont", v12);
          xpc_connection_send_message(v15, v14);
        }
      }
    }
  }
}

void __84__GEOTileServerRemoteProxy_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIncomingQueue, 0);

  objc_storeStrong((id *)&self->_diskCacheDeletedExternalDataNotifyToken, 0);
}

@end