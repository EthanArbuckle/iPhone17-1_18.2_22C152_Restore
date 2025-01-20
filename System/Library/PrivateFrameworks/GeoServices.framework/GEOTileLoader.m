@interface GEOTileLoader
+ (id)diskCacheExternalLocation;
+ (id)diskCacheLocation;
+ (id)modernLoader;
+ (id)modernLoaderForResourceManifestConfiguration:(id)a3 locale:(id)a4;
+ (id)modernLoaderForTileGroupIdentifier:(unsigned int)a3 locale:(id)a4;
+ (id)singletonConfiguration;
+ (void)setDiskCacheExternalLocation:(id)a3;
+ (void)setDiskCacheLocation:(id)a3;
+ (void)setMemoryCacheCountLimit:(unint64_t)a3;
+ (void)setMemoryCacheTotalCostLimit:(unint64_t)a3;
+ (void)setServerProxyClass:(Class)a3;
+ (void)useLocalLoader;
+ (void)useRemoteLoader;
- (BOOL)reprioritizeKey:(uint64_t)a3 forClient:(void *)a4 newPriority:(int)a5;
- (GEOTileLoader)init;
- (GEOTileLoader)initWithConfiguration:(id)a3;
- (GEOTileLoaderInternalDelegate)internalDelegate;
- (NSString)description;
- (__n128)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:;
- (id)_tileDecoderForTileKey:(uint64_t)a3 quickly:;
- (id)cachedTileForKey:(uint64_t *)a3 auditToken:(void *)a4;
- (id)descriptionDictionaryRepresentation;
- (id)initWithConfiguration:(id)a1 serverProxy:(void *)a2;
- (id)initWithConfiguration:serverProxy:;
- (id)proxy;
- (int)diskHits;
- (int)memoryHits;
- (int)networkHits;
- (uint64_t)_cancelIfNeeded:(uint64_t)result;
- (uint64_t)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:;
- (uint64_t)_requestOnlineTiles;
- (uint64_t)cachedTileForKey:(uint64_t)a3;
- (uint64_t)initWithConfiguration:serverProxy:;
- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 callbackQ:(uint64_t)a9 beginNetwork:(uint64_t)a10 callback:(uint64_t)a11;
- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 signpostID:(uint64_t)a9 createTime:(uint64_t)a10 callbackQ:(uint64_t)a11 beginNetwork:(uint64_t)a12 callback:;
- (uint64_t)loadKey:(void *)a1 priority:(uint64_t)a2 forClient:(uint64_t)a3 options:(uint64_t)a4 reason:(uint64_t)a5 qos:(uint64_t)a6 signpostID:(uint64_t)a7 auditToken:(int)a8 createTime:(uint64_t)a9 callbackQ:(uint64_t)a10 beginNetwork:(__int128)a11 callback:(uint64_t)a12;
- (unint64_t)calculateFreeableSizeSync;
- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3;
- (void)_cancel:(void *)a3 err:;
- (void)_cancelAllForClientOnLoadQueue:(uint64_t)a1;
- (void)_decodePreliminaryTileData:(void *)a3 forKey:(uint64_t *)a4;
- (void)_loadedTileForLocalKey:(uint64_t)a3 preliminary:(int)a4 quickly:(int)a5 tileDecoder:(void *)a6 data:(void *)a7 disburseTile:(void *)a8;
- (void)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:;
- (void)_notifyObserversOfFailure:(void *)a3 error:(uint64_t)a4 options:;
- (void)_notifyObserversOfSuccess:(uint64_t)a3 sizeInBytes:(uint64_t)a4 source:(uint64_t)a5 options:;
- (void)_requestOnlineTiles;
- (void)_scheduleCoalesceTimer;
- (void)beginPreloadSessionOfSize:(unint64_t)a3 forClient:(id)a4;
- (void)calculateFreeableSizeWithCallbackQ:(id)a3 finished:(id)a4;
- (void)cancelAllForClient:(id)a3;
- (void)cancelAllForClientSynchronous:(id)a3;
- (void)cancelKey:(uint64_t)a3 forClient:(void *)a4;
- (void)clearAllCaches;
- (void)clearCachedTilesMatchingBlock:(id)a3;
- (void)closeForClient:(id)a3;
- (void)dealloc;
- (void)endPreloadSessionForClient:(id)a3;
- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6;
- (void)expireTilesWithPredicate:(id)a3;
- (void)initWithConfiguration:serverProxy:;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(unsigned int)a6 options:(void *)a7 reason:(uint64_t)a8 qos:(char)a9 signpostID:(int)a10 auditToken:(uint64_t)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 auditToken:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:(void *)a14;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13;
- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(void *)a5 forClient:(uint64_t)a6 options:(unsigned int)a7 reason:(int)a8 qos:(double)a9 signpostID:(uint64_t)a10 createTime:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:;
- (void)loadKey:(uint64_t)a3 additionalInfo:(unint64_t *)a4 priority:(_OWORD *)a5 forClient:(int)a6 auditToken:(void *)a7 options:(void *)a8 reason:(void *)a9 qos:(char)a10 signpostID:(int)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15;
- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 auditToken:(void *)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11;
- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 callbackQ:(void *)a8 beginNetwork:(void *)a9 callback:(void *)a10;
- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12;
- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(unsigned int)a8 signpostID:(uint64_t)a9 auditToken:(void *)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13;
- (void)openForClient:(id)a3;
- (void)proxy:(id)a3 canShrinkDiskCacheByAmount:(unint64_t)a4;
- (void)proxy:(id)a3 failedToLoadAllPendingTilesWithError:(id)a4;
- (void)proxy:(id)a3 failedToLoadTiles:(id)a4 error:(id)a5;
- (void)proxy:(id)a3 willGoToNetworkForTiles:(id)a4;
- (void)proxy:(uint64_t)a3 loadedTile:(void *)a4 forKey:(long long *)a5 info:(void *)a6;
- (void)proxyDidDeleteExternalTileData:(id)a3;
- (void)proxyDidDownloadRegionalResources:(id)a3;
- (void)registerObserver:(id)a3;
- (void)registerTileDecoder:(id)a3;
- (void)registerTileLoader:(Class)a3;
- (void)reportCorruptTile:(char *)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setInternalDelegateQ:(id)a3;
- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQ:(id)a4 finished:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation GEOTileLoader

- (void)_loadedTileForLocalKey:(uint64_t)a3 preliminary:(int)a4 quickly:(int)a5 tileDecoder:(void *)a6 data:(void *)a7 disburseTile:(void *)a8
{
  uint64_t v11 = a3;
  uint64_t v12 = a2;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v58 = a2;
  *((void *)&v58 + 1) = a3;
  id v14 = a6;
  id v37 = a7;
  id v38 = a8;
  if (a1)
  {
    v36 = v14;
    _pruneErrors(a1);
    char v15 = v12;
    uint64_t v16 = (uint64_t)a1->_internal + 8;
    do
    {
      uint64_t v16 = *(void *)(v16 + 8);
      if ((GEOTileLoaderInternal *)v16 == (GEOTileLoaderInternal *)((char *)a1->_internal + 8))
      {
        uint64_t v19 = 0;
        id v14 = v36;
        goto LABEL_25;
      }
      v17 = (int8x8_t *)(v16 + 16);
    }
    while ((void)v58 != *(void *)(v16 + 16) || *((void *)&v58 + 1) != *(void *)(v16 + 24));
    if (a4)
    {
      *(_DWORD *)(v16 + 44) = 4;
    }
    else
    {
      *(_DWORD *)(v16 + 40) = 4;
      if (*(_DWORD *)(v16 + 44) == 1)
      {
        *(_DWORD *)(v16 + 44) = 3;
        buf[0] = 0;
        *(void *)&long long v55 = 0;
        v20 = (char *)operator new(0x28uLL);
        *(void *)v20 = &unk_1ED517810;
        *(_OWORD *)(v20 + 8) = v58;
        *((void *)v20 + 3) = &v55;
        *((void *)v20 + 4) = buf;
        v57[3] = v20;
        LoadItem::foreachRequester(*(void *)(v16 + 96), (uint64_t)v57);
        std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v57);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v21 = (id)v55;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v21);
              }
              LoadItem::deleteRequester(v17, *(NSString **)(*((void *)&v40 + 1) + 8 * i), 0, 0);
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v56 count:16];
          }
          while (v22);
        }
      }
    }
    unint64_t v25 = LoadItem::options((LoadItem *)v17);
    if ((v25 & 4) != 0)
    {

      id v14 = 0;
      a5 = 1;
    }
    else
    {
      id v14 = v36;
    }
    uint64_t v19 = (v25 >> 2) & 1;
    if ((LoadItem::options((LoadItem *)v17) & 0x60) != 0) {
      goto LABEL_27;
    }
LABEL_25:
    if (a4)
    {

      id v14 = 0;
      char v15 = v58;
      uint64_t v19 = 1;
      int v26 = 1;
      uint64_t v11 = *((void *)&v58 + 1);
      uint64_t v12 = v58;
      goto LABEL_28;
    }
LABEL_27:
    int v26 = a5;
LABEL_28:
    uint64_t v27 = -97;
    if ((v15 & 0x60) == 0) {
      uint64_t v27 = -1;
    }
    *(void *)&long long v55 = v27 & v12;
    *((void *)&v55 + 1) = v11;
    if (v14 && !v26)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke;
      v47 = &unk_1E53D8558;
      v48 = (GEOTileData *)v37;
      id v28 = v14;
      long long v52 = v55;
      id v49 = v28;
      v50 = a1;
      id v51 = v38;
      geo_dispatch_async_qos();

      v29 = v48;
LABEL_44:

      goto LABEL_45;
    }
    v30 = (GEOTileData *)v37;
    v29 = v30;
    if (!v14)
    {
LABEL_43:
      (*((void (**)(id, GEOTileData *, uint64_t))v38 + 2))(v38, v29, v19);
      goto LABEL_44;
    }
    id v39 = 0;
    v31 = [(GEOTileData *)v30 readDataWithError:&v39];
    id v32 = v39;
    if (v31)
    {
      v33 = [v14 decodeTile:v31 forKey:&v55];
      if (v33)
      {
        p_super = &v29->super;
        v29 = [[GEOTileData alloc] initWithDecodedRepresentation:v33];
LABEL_42:

        goto LABEL_43;
      }
      p_super = &v29->super;
    }
    else
    {
      p_super = GEOGetTileLoadingLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v32;
        _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "Failed to read supposedly-loaded tile from disk: %@", buf, 0xCu);
      }
      v33 = v29;
    }
    v29 = 0;
    goto LABEL_42;
  }
LABEL_45:
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v2 = (long long *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 80);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
  if ((v3 & 4) != 0) {
    unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL ^ 4;
  }
  if (*(char *)(a1 + 128) < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 80);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 112) + 8;
  do
  {
    uint64_t v6 = *(void *)(v6 + 8);
    if (v6 == *(void *)(*(void *)(a1 + 32) + 112) + 8)
    {
      long long v55 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 112) + 8);
      v10 = (void *)MEMORY[0x18C1203C0]();
      if ((*(unsigned char *)v2 & 0x7F) == 8)
      {
        if ((v5 & 4) == 0)
        {
          if ((*(void *)(a1 + 129) & 0x4000000000000000) != 0)
          {
            id v11 = 0;
            goto LABEL_57;
          }
          goto LABEL_34;
        }
      }
      else if ((v5 & 4) == 0)
      {
LABEL_34:
        uint64_t v18 = 32;
        if (*(char *)v2 < 0) {
          uint64_t v18 = 40;
        }
        id v19 = *(id *)(*(void *)(*(void *)(a1 + 32) + 112) + v18);
        v20 = [v19 tileForKey:v2];
        id v11 = v20;
        int v21 = v20 != 0;
        if (v20) {
          uint64_t v22 = [v20 length];
        }
        else {
          uint64_t v22 = 0;
        }

        goto LABEL_50;
      }
      uint64_t v54 = 0;
      int v21 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 112) + 32) containsKey:v2 cost:&v54];
      id v11 = 0;
      if (v21) {
        uint64_t v22 = v54;
      }
      else {
        uint64_t v22 = 0;
      }
LABEL_50:
      if (v21) {
        BOOL v31 = (v5 & 0x40) == 0;
      }
      else {
        BOOL v31 = 1;
      }
      if (!v31)
      {
        v33 = *(NSObject **)(a1 + 56);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_7;
        v64[3] = &unk_1E53D8350;
        v64[4] = *(void *)(a1 + 72);
        long long v65 = *v2;
        dispatch_async(v33, v64);
        uint64_t v34 = *(void *)(a1 + 32);
        v35 = _cacheMissErr();
        -[GEOTileLoader _notifyObserversOfFailure:error:options:](v34, v2, v35, *(void *)(a1 + 80));
        goto LABEL_63;
      }
      if (v21)
      {
        atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 32) + 112) + 80), 1u);
        id v32 = *(NSObject **)(a1 + 56);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_8;
        v58[3] = &unk_1E53D8378;
        uint64_t v60 = *(void *)(a1 + 72);
        long long v62 = *v2;
        id v11 = v11;
        id v59 = v11;
        uint64_t v61 = v22;
        char v63 = 0;
        dispatch_async(v32, v58);
        -[GEOTileLoader _notifyObserversOfSuccess:sizeInBytes:source:options:](*(void *)(a1 + 32), v2, [v11 length], 0, *(void *)(a1 + 80));
        v35 = v59;
        goto LABEL_63;
      }
LABEL_57:
      if ((v5 & 3) != 0)
      {
        uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 112);
        id v37 = operator new(0xB0uLL);
        *id v37 = 0;
        v37[1] = 0;
        *((_OWORD *)v37 + 1) = *v2;
        GEOMachAbsoluteTimeGetCurrent();
        v37[4] = v38;
        *((_DWORD *)v37 + 10) = 0;
        v37[6] = 0;
        *((_OWORD *)v37 + 5) = 0u;
        *((_OWORD *)v37 + 6) = 0u;
        *((_DWORD *)v37 + 28) = 1065353216;
        *((_DWORD *)v37 + 30) = 0;
        v37[16] = &unk_1ED513630;
        v37[17] = 0;
        v37[19] = &unk_1ED513630;
        v37[20] = 0;
        v37[1] = v36 + 8;
        uint64_t v39 = *(void *)(v36 + 8);
        *id v37 = v39;
        *(void *)(v39 + 8) = v37;
        *(void *)(v36 + 8) = v37;
        ++*(void *)(v36 + 24);
        if (*(unsigned char *)(a1 + 145)) {
          long long v40 = (_OWORD *)(a1 + 108);
        }
        else {
          long long v40 = 0;
        }
        LoadItem::addRequester(*(void *)(*(void *)(*(void *)(a1 + 32) + 112) + 8) + 16, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), v5, *(unsigned char *)(a1 + 144), *(double *)(a1 + 96), *(_DWORD *)(a1 + 104), v40, *(_DWORD *)(a1 + 124), *(void *)(a1 + 88));
        [*(id *)(a1 + 32) _scheduleCoalesceTimer];
        goto LABEL_64;
      }
      long long v41 = *(NSObject **)(a1 + 56);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_9;
      v56[3] = &unk_1E53D8350;
      v56[4] = *(void *)(a1 + 72);
      long long v57 = *v2;
      dispatch_async(v41, v56);
      uint64_t v42 = *(void *)(a1 + 32);
      v35 = _cacheMissErr();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v42, v2, v35, *(void *)(a1 + 80));
LABEL_63:

LABEL_64:
      return;
    }
  }
  while (*(void *)v2 != *(void *)(v6 + 16) || *(void *)(a1 + 136) != *(void *)(v6 + 24));
  long long v55 = (uint64_t *)v6;
  if (*(void *)(v6 + 104) && (v8 = *(uint64_t **)(v6 + 96)) != 0)
  {
    unsigned int v9 = 0;
    do
    {
      if (*((_DWORD *)v8 + 39) > v9) {
        unsigned int v9 = *((_DWORD *)v8 + 39);
      }
      v8 = (uint64_t *)*v8;
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
  }
  unint64_t v53 = LoadItem::options((LoadItem *)(v6 + 16));
  if (*(unsigned char *)(a1 + 145)) {
    uint64_t v12 = (_OWORD *)(a1 + 108);
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = LoadItem::addRequester(v6 + 16, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), v5, *(unsigned char *)(a1 + 144), *(double *)(a1 + 96), *(_DWORD *)(a1 + 104), v12, *(_DWORD *)(a1 + 124), *(void *)(a1 + 88));
  int v14 = *(_DWORD *)(v6 + 40);
  if ((-[GEOTileLoader _cancelIfNeeded:](*(void *)(a1 + 32), &v55) & 1) == 0)
  {
    if ((v5 & 3) == 0)
    {
      LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      uint64_t v23 = *(NSObject **)(a1 + 56);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_3;
      v74[3] = &unk_1E53D8350;
      v74[4] = *(void *)(a1 + 72);
      long long v75 = *v2;
      dispatch_async(v23, v74);
      uint64_t v24 = *(void *)(a1 + 32);
      unint64_t v25 = _cacheMissErr();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v24, v2, v25, *(void *)(a1 + 80));

      return;
    }
    if ((v5 & 2) == 0 && v14 == 2)
    {
      LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      char v15 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_4;
      block[3] = &unk_1E53D8350;
      block[4] = *(void *)(a1 + 72);
      long long v73 = *v2;
      dispatch_async(v15, block);
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = _noNetErr();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v16, v2, v17, *(void *)(a1 + 80));

      return;
    }
    int v26 = *(void **)(v6 + 136);
    if (v26 && (v5 & 0x60) != 0)
    {
      id v27 = v26;
      if ((v5 & 0x40) != 0) {
        LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      }
      BOOL v28 = (v5 & 0x40) == 0;
      queue = *(NSObject **)(a1 + 56);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_5;
      v68[3] = &unk_1E53D82D8;
      uint64_t v29 = *(void *)(a1 + 72);
      long long v71 = *v2;
      id v69 = v27;
      uint64_t v70 = v29;
      id v30 = v27;
      dispatch_async(queue, v68);

      if (v28) {
        goto LABEL_70;
      }
    }
    else
    {
      id v43 = *(id *)(v6 + 160);

      if (v43 && (v5 & 0x60) != 0)
      {
        id v44 = *(id *)(v6 + 160);
        geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset(v6 + 152, 0);
        [*(id *)(a1 + 32) _decodePreliminaryTileData:v44 forKey:v2];
      }
      if ((v5 & 0x40) != 0)
      {
        if (*(_DWORD *)(v6 + 44) == 3)
        {
          LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
          uint64_t v45 = *(NSObject **)(a1 + 56);
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_6;
          v66[3] = &unk_1E53D8350;
          v66[4] = *(void *)(a1 + 72);
          long long v67 = *v2;
          dispatch_async(v45, v66);
          uint64_t v46 = *(void *)(a1 + 32);
          v47 = _cacheMissErr();
          -[GEOTileLoader _notifyObserversOfFailure:error:options:](v46, v2, v47, *(void *)(a1 + 80));

          return;
        }
      }
      else
      {
LABEL_70:
        if (v14 == 2) {
          LoadItem::Requester::fireBeginNetwork((LoadItem::Requester *)v13);
        }
      }
      if (*(void *)(v6 + 104) && (v48 = *(uint64_t **)(v6 + 96)) != 0)
      {
        unsigned int v49 = 0;
        do
        {
          if (*((_DWORD *)v48 + 39) > v49) {
            unsigned int v49 = *((_DWORD *)v48 + 39);
          }
          v48 = (uint64_t *)*v48;
        }
        while (v48);
      }
      else
      {
        unsigned int v49 = 0;
      }
      if (v9 != v49 && (v14 - 1) <= 1) {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "reprioritizeKey:newPriority:batchID:", v2);
      }
      unint64_t v51 = LoadItem::options((LoadItem *)(v6 + 16));
      if (v53 >= 0x200 && v51 <= 0x1FF) {
        [*(id *)(a1 + 32) _scheduleCoalesceTimer];
      }
    }
  }
}

- (void)_scheduleCoalesceTimer
{
  if (self->_coalesceTimerEnabled)
  {
    internal = self->_internal;
    uint64_t v3 = (void *)*((void *)internal + 2);
    if (v3 == (void *)((char *)internal + 8))
    {
      uint64_t v8 = *((void *)internal + 6);
      if (*(_DWORD *)(v8 + 48) == 21) {
        goto LABEL_22;
      }
      dispatch_qos_class_t v4 = QOS_CLASS_DEFAULT;
      *(_DWORD *)(v8 + 48) = 21;
    }
    else
    {
      dispatch_qos_class_t v4 = QOS_CLASS_DEFAULT;
      do
      {
        if (v3[13])
        {
          uint64_t v5 = (uint64_t *)v3[12];
          if (v5)
          {
            dispatch_qos_class_t v6 = QOS_CLASS_UNSPECIFIED;
            v7 = (uint64_t *)v3[12];
            do
            {
              if (v6 <= *((_DWORD *)v7 + 45)) {
                dispatch_qos_class_t v6 = *((_DWORD *)v7 + 45);
              }
              v7 = (uint64_t *)*v7;
            }
            while (v7);
            if (v4 <= v6)
            {
              dispatch_qos_class_t v4 = QOS_CLASS_UNSPECIFIED;
              do
              {
                if (v4 <= *((_DWORD *)v5 + 45)) {
                  dispatch_qos_class_t v4 = *((_DWORD *)v5 + 45);
                }
                uint64_t v5 = (uint64_t *)*v5;
              }
              while (v5);
            }
          }
        }
        uint64_t v3 = (void *)v3[1];
      }
      while (v3 != (void *)((char *)internal + 8));
      uint64_t v8 = *((void *)internal + 6);
      if (*(_DWORD *)(v8 + 48) == v4) {
        goto LABEL_22;
      }
      *(_DWORD *)(v8 + 48) = v4;
      if (v4 == QOS_CLASS_UNSPECIFIED)
      {
        unsigned int v9 = *(NSObject **)(v8 + 8);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = ___ZN3geo13DispatchTimer8scheduleEyy11qos_class_t_block_invoke_2;
        v13[3] = &__block_descriptor_40_e5_v8__0l;
        v13[4] = v8;
        dispatch_source_set_event_handler(v9, v13);
LABEL_22:
        id v11 = *(NSObject **)(v8 + 8);
        dispatch_time_t v12 = dispatch_time(0, 5000000);
        dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0xC350uLL);
        return;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN3geo13DispatchTimer8scheduleEyy11qos_class_t_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v8;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v8 + 8), v10);

    goto LABEL_22;
  }
}

- (uint64_t)_cancelIfNeeded:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    dispatch_qos_class_t v4 = *a2;
    char v5 = LoadItem::options((LoadItem *)(*a2 + 2));
    if (v4[13])
    {
      int v6 = *((_DWORD *)v4 + 10);
      uint64_t v7 = v5 & 2;
      if (v6 == 1 && (v5 & 1) == 0 && v7 == 0)
      {
        id v11 = _cacheMissErr();
        -[GEOTileLoader _cancel:err:](v3, a2, v11);
      }
      else
      {
        if (v6 != 2 || v7 != 0) {
          return 0;
        }
        id v11 = _noNetErr();
        -[GEOTileLoader _cancel:err:](v3, a2, v11);
      }
    }
    else
    {
      id v11 = _cancelErr();
      -[GEOTileLoader _cancel:err:](v3, a2, v11);
    }

    return 1;
  }
  return result;
}

void __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_3(uint64_t a1)
{
}

uint64_t __32__GEOTileLoader_closeForClient___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 24) count];
  [*(id *)(a1[4] + 24) removeObject:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 24) count];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

uint64_t __31__GEOTileLoader_openForClient___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 24) containsObject:a1[5]])
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    dispatch_qos_class_t v4 = [NSString stringWithFormat:@"Already open for client (%@)", a1[5]];
    char v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];
    [v5 raise];
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 24) count];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void **)(a1[4] + 24);

  return [v7 addObject:v6];
}

void __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) objectEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_qos_class_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __48__GEOTileLoader__tileDecoderForTileKey_quickly___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_qos_class_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v12 objectForKeyedSubscript:@"GEOTileLoadResultIsPreliminary"];
  int v14 = [v13 BOOLValue];

  if (!v14 || (*(unsigned char *)(a1 + 48) & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained generateRequestedFromTileLoaderEndSignpost:*(void *)(a1 + 56)];
  }
  if (*(void *)a2 != *(void *)(a1 + 64) || *(void *)(a2 + 8) != *(void *)(a1 + 72))
  {
    uint64_t v17 = *(void *)(a2 + 8);
    uint64_t v18 = -97;
    if ((*(unsigned char *)a2 & 0x60) == 0) {
      uint64_t v18 = -1;
    }
    uint64_t v22 = v18 & *(void *)a2;
    uint64_t v23 = v17;
    if ((v22 != *(void *)(a1 + 64) || v17 != *(void *)(a1 + 72))
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v21 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: GEOTileKeyEquals(&onlineKey, &inputKey)", v21, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)modernLoaderForResourceManifestConfiguration:(id)a3 locale:(id)a4
{
  uint64_t v6 = (GEOResourceManifestConfiguration *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = [(GEOResourceManifestConfiguration *)v6 isDefaultConfiguration];
    if (v8) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v9;
    }
    if (v10) {
      goto LABEL_15;
    }
  }
  else
  {
    if (!v7)
    {
LABEL_15:
      v13 = [a1 modernLoader];
      goto LABEL_27;
    }
    uint64_t v6 = objc_alloc_init(GEOResourceManifestConfiguration);
  }
  if (qword_1EB29F418 != -1) {
    dispatch_once(&qword_1EB29F418, &__block_literal_global_114);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_179);
  id v11 = [(id)qword_1EB29F410 objectForKey:v6];
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [(id)qword_1EB29F410 setObject:v11 forKey:v6];
  }
  if (v8)
  {
    id v12 = v8;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v14 = v12;
  v13 = [v11 objectForKey:v12];
  if (!v13)
  {
    char v15 = +[GEOTileLoader singletonConfiguration]();
    uint64_t v16 = (void *)[v15 copy];

    [v16 setManifestConfiguration:v6];
    [v16 setLocale:v8];
    uint64_t v17 = [v16 manifestConfiguration];
    char v18 = [v17 isDefaultConfiguration];
    if (v8) {
      char v19 = 0;
    }
    else {
      char v19 = v18;
    }

    if ((v19 & 1) == 0)
    {
      v20 = [v16 manifestConfiguration];
      int v21 = [v20 dataDirectoryFor:5];

      if (v8)
      {
        uint64_t v22 = NSString;
        uint64_t v23 = [v8 localeIdentifier];
        uint64_t v24 = [v22 stringWithFormat:@"loc_%@", v23];
        uint64_t v25 = [v21 stringByAppendingPathComponent:v24];

        int v21 = (void *)v25;
      }
      int v26 = [v16 diskCacheLocation];
      id v27 = [v26 lastPathComponent];

      BOOL v28 = [v21 stringByAppendingPathComponent:v27];
      [v16 setDiskCacheLocation:v28];

      uint64_t v29 = [v16 diskCacheExternalLocation];
      id v30 = [v29 lastPathComponent];

      BOOL v31 = [v21 stringByAppendingPathComponent:v30];
      [v16 setDiskCacheExternalLocation:v31];
    }
    v13 = -[GEOTileLoader initWithConfiguration:serverProxy:]([GEOTileLoader alloc], v16);
    [v11 setObject:v13 forKey:v14];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_179);

LABEL_27:

  return v13;
}

+ (id)modernLoader
{
  if (qword_1EB29F408 != -1) {
    dispatch_once(&qword_1EB29F408, &__block_literal_global_111);
  }
  uint64_t v2 = (void *)qword_1EB29F3F0;

  return v2;
}

- (void)openForClient:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  id v4 = a3;
  geo_isolate_sync_data();
  if (!v6[3]) {
    [(GEOTileServerProxy *)self->_proxy open];
  }

  _Block_object_dispose(&v5, 8);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(unsigned int)a6 options:(void *)a7 reason:(uint64_t)a8 qos:(char)a9 signpostID:(int)a10 auditToken:(uint64_t)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15
{
  id v27 = a7;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  if (!v20)
  {
    id v20 = +[GEOApplicationAuditToken currentProcessAuditToken];
  }
  HIDWORD(v24) = a10;
  LOBYTE(v24) = a9;
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:auditToken:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:", a4, a5, a6, v27, v20, a8, a2, v24, a11, v21, v22, v23);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(unint64_t *)a4 priority:(_OWORD *)a5 forClient:(int)a6 auditToken:(void *)a7 options:(void *)a8 reason:(void *)a9 qos:(char)a10 signpostID:(int)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v21 = a7;
  id v22 = a8;
  id v40 = a13;
  id v37 = a14;
  id v38 = a15;
  if (!v38) {
    goto LABEL_33;
  }
  if (!a4)
  {
    (*((void (**)(id, void, void, void, void, void))v38 + 2))(v38, 0, 0, 0, 0, 0);
    goto LABEL_33;
  }
  if (!v22 || !v21 || !v40)
  {
    (*((void (**)(id, unint64_t *, void, void, void, void))v38 + 2))(v38, a4, 0, 0, 0, 0);
    goto LABEL_33;
  }
  id v23 = a12;
  if ((unint64_t)a12 + 1 <= 1)
  {
    uint64_t v24 = GEOGetTileLoadingLog();
    id v23 = (void *)os_signpost_id_generate(v24);
  }
  long long v62 = *(_OWORD *)a4;
  [a1[5] generateRequestedFromTileLoaderBeginSignpost:v23 tileKey:a4 options:a9];
  objc_initWeak(location, a1[5]);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke;
  v58[3] = &unk_1E53D8328;
  v60[1] = a9;
  objc_copyWeak(v60, location);
  v60[2] = v23;
  long long v61 = v62;
  id v59 = v38;
  v35 = (void *)MEMORY[0x18C120660](v58);
  id v39 = v22;
  if (!+[GEOPlatform isRunningInGeod])
  {
    if (((unsigned __int16)a9 & 0x400) == 0)
    {
      if (((unsigned __int16)a9 & 0x800) != 0)
      {
LABEL_26:
        uint64_t v32 = -97;
        if ((*(unsigned char *)a4 & 0x60) == 0) {
          uint64_t v32 = -1;
        }
        unint64_t v25 = v32 & *a4;
        goto LABEL_29;
      }
      id v34 = v39;
      int v26 = [v34 offlineCohortId];
      unsigned __int8 v27 = +[GEOOfflineService activeStateForCohortId:v26];

      if (v27 < 2u) {
        goto LABEL_25;
      }
      if (v27 != 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v27;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        }
        goto LABEL_25;
      }
      if ((a9 & 4) != 0)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    unsigned int v28 = *(unsigned char *)a4 & 0x7F;
    if (v28 >= 0x40)
    {
      unint64_t v29 = *a4;
    }
    else
    {
      unint64_t v29 = *a4;
      if (v28 != 8)
      {
        unsigned __int8 v30 = v29 & 0x9F | 0x40;
LABEL_22:
        unint64_t v25 = v29 & 0xFFFFFFFFFFFFFF00 | v30;
        goto LABEL_29;
      }
    }
    unsigned __int8 v30 = v29;
    goto LABEL_22;
  }
  unint64_t v25 = *a4;
LABEL_29:
  unint64_t v33 = a4[1];

  if (a5) {
    *(_OWORD *)buf = *a5;
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_2;
  location[4] = &unk_1E53D83A0;
  unint64_t v53 = v25;
  unint64_t v54 = v33;
  v47 = a9;
  location[5] = a1;
  id v42 = v21;
  id v43 = v39;
  id v44 = v40;
  id v45 = v37;
  uint64_t v46 = v35;
  char v55 = a10;
  int v50 = a6;
  BOOL v56 = a5 != 0;
  long long v51 = *(_OWORD *)buf;
  int v52 = a11;
  v48 = v23;
  double v49 = a2;
  geo_isolate_async();

  objc_destroyWeak(v60);
  objc_destroyWeak(location);
LABEL_33:
}

void __28__GEOTileLoader__timerFired__block_invoke(uint64_t a1)
{
  v106[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 112);
    uint64_t v3 = v2 + 8;
    uint64_t v4 = *(void *)(v2 + 16);
    if (v4 == v2 + 8)
    {
      unint64_t v5 = 0;
    }
    else
    {
      unint64_t v5 = 0;
      do
      {
        if ((unint64_t)LoadItem::options((LoadItem *)(v4 + 16)) >= 0x200
          && (*(_DWORD *)(v4 + 40) - 1) < 2)
        {
          ++v5;
        }
        uint64_t v4 = *(void *)(v4 + 8);
      }
      while (v4 != v3);
    }
    v88 = &v88;
    v89 = (uint64_t *)&v88;
    uint64_t v90 = 0;
    if ((unint64_t)[*(id *)(v1 + 80) backpressureControlCountLimit] < 8) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = (unint64_t)[*(id *)(v1 + 80) backpressureControlCountLimit] >> 2;
    }
    unint64_t v84 = v6;
    uint64_t v7 = *(void *)(v1 + 112);
    uint64_t v8 = *(void *)(v7 + 16);
    uint64_t v86 = v1;
    if (v8 != v7 + 8)
    {
      uint64_t v83 = 0;
      while (1)
      {
        if (!*(_DWORD *)(v8 + 40))
        {
          BOOL v9 = (unsigned char *)(v8 + 16);
          unint64_t v10 = LoadItem::options((LoadItem *)(v8 + 16));
          if (v10 < 0x200) {
            goto LABEL_27;
          }
          unint64_t v11 = v84;
          if (*(void *)(v8 + 104))
          {
            id v12 = *(uint64_t **)(v8 + 96);
            unint64_t v11 = v84;
            if (v12)
            {
              unsigned int v13 = 0;
              do
              {
                if (*((_DWORD *)v12 + 39) > v13) {
                  unsigned int v13 = *((_DWORD *)v12 + 39);
                }
                id v12 = (uint64_t *)*v12;
              }
              while (v12);
              unint64_t v11 = v84;
              if (v13 >= 0x7FFFFFFE) {
                unint64_t v11 = [*(id *)(v1 + 80) backpressureControlCountLimit];
              }
            }
          }
          if (v5 < v11)
          {
            ++v5;
LABEL_27:
            *(void *)(v8 + 48) = v10;
            v87[0] = 0;
            int v14 = v89;
            if (v89 != (uint64_t *)&v88)
            {
              do
              {
                if (*((_DWORD *)v14 + 13) == (*v9 & 0x7F) && ((*((_DWORD *)v14 + 10) ^ v10) & 7) == 0)
                {
                  if (*(void *)(v8 + 104) && (char v15 = *(uint64_t **)(v8 + 96)) != 0)
                  {
                    unsigned int v16 = 0;
                    do
                    {
                      if (v16 <= *((_DWORD *)v15 + 45)) {
                        unsigned int v16 = *((_DWORD *)v15 + 45);
                      }
                      char v15 = (uint64_t *)*v15;
                    }
                    while (v15);
                  }
                  else
                  {
                    unsigned int v16 = 0;
                  }
                  if (*((_DWORD *)v14 + 21) == v16)
                  {
                    uint64_t v17 = (void *)v14[11];
                    char v18 = LoadItem::voucher((LoadItem *)(v8 + 16));
                    if (v17 == v18)
                    {
                      int v19 = *((unsigned __int8 *)v14 + 48);
                      BOOL v20 = v19 == LoadItem::reason(*(LoadItem **)(v8 + 96));

                      if (v20)
                      {
                        if ((v10 & 8) == 0)
                        {
                          uint64_t v63 = v14[5];
                          if ((v63 & 8) != 0) {
                            v14[5] = v63 ^ 8;
                          }
                        }
                        id v21 = (void **)(v14 + 2);
                        v87[0] = v21;
                        goto LABEL_51;
                      }
                    }
                    else
                    {
                    }
                  }
                }
                int v14 = (uint64_t *)v14[1];
              }
              while (v14 != (uint64_t *)&v88);
              id v21 = (void **)v87[0];
              if (v87[0]) {
                goto LABEL_51;
              }
            }
            id v22 = *(LoadItem **)(v8 + 96);
            char v23 = LoadItem::reason(v22);
            unsigned int v24 = 0;
            if (*(void *)(v8 + 104) && v22)
            {
              unsigned int v24 = 0;
              do
              {
                if (v24 <= *((_DWORD *)v22 + 45)) {
                  unsigned int v24 = *((_DWORD *)v22 + 45);
                }
                id v22 = *(LoadItem **)v22;
              }
              while (v22);
            }
            char v25 = *(unsigned char *)(v8 + 16);
            int v26 = LoadItem::voucher((LoadItem *)(v8 + 16));
            unsigned __int8 v27 = operator new(0x60uLL);
            *unsigned __int8 v27 = 0;
            v27[1] = 0;
            geo::Batch::Batch((uint64_t)(v27 + 2), v10 & 0x1FF, v23, v25 & 0x7F, v24, v26);
            uint64_t v28 = (uint64_t)v88;
            *unsigned __int8 v27 = v88;
            v27[1] = &v88;
            *(void *)(v28 + 8) = v27;
            v88 = v27;
            ++v90;

            uint64_t v29 = (uint64_t)v88;
            id v21 = (void **)(v88 + 2);
            v87[0] = v88 + 2;
            int v30 = *(_DWORD *)(v86 + 88) + 1;
            *(_DWORD *)(v86 + 88) = v30;
            *(_DWORD *)(v29 + 80) = v30;
LABEL_51:
            *(_DWORD *)(v8 + 120) = *((_DWORD *)v21 + 16);
            *(_OWORD *)buf = *(_OWORD *)v9;
            BOOL v31 = *(void **)(v8 + 96);
            uint64_t v32 = (uint64_t *)(v8 + 96);
            if (*(void *)(v8 + 104))
            {
              unsigned int v33 = 0;
              if (v31)
              {
                id v34 = *(uint64_t **)(v8 + 96);
                do
                {
                  if (*((_DWORD *)v34 + 39) > v33) {
                    unsigned int v33 = *((_DWORD *)v34 + 39);
                  }
                  id v34 = (uint64_t *)*v34;
                }
                while (v34);
              }
              v35 = (uint64_t *)(v8 + 96);
              do
              {
                v35 = (uint64_t *)*v35;
                BOOL v36 = v35 != 0;
              }
              while (v35 && !*((unsigned char *)v35 + 161));
              id v37 = (uint64_t *)(v8 + 96);
              while (1)
              {
                id v37 = (uint64_t *)*v37;
                if (!v37) {
                  break;
                }
                if (*((unsigned char *)v37 + 161))
                {
                  uint64_t v38 = *(uint64_t *)((char *)v37 + 164);
                  uint64_t v39 = *(uint64_t *)((char *)v37 + 172);
                  goto LABEL_66;
                }
              }
            }
            else
            {
              BOOL v36 = 0;
              unsigned int v33 = 0;
            }
            uint64_t v39 = 0;
            uint64_t v38 = 0;
LABEL_66:
            unint64_t v85 = v5;
            uint64_t v40 = 0;
            if (v31)
            {
              LOBYTE(v41) = 0;
              do
              {
                if ((unint64_t)(v31[24] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                  && (!v40 || (v41 & 0x40) != 0 && (v31[18] & 0x40) == 0))
                {
                  uint64_t v41 = v31[18];
                  uint64_t v40 = v31[24];
                }
                BOOL v31 = (void *)*v31;
              }
              while (v31);
            }
            id v42 = (double *)(v8 + 96);
            while (1)
            {
              id v42 = *(double **)v42;
              if (!v42) {
                break;
              }
              double v43 = v42[25];
              if (v43 != 0.0) {
                goto LABEL_79;
              }
            }
            double v43 = 0.0;
LABEL_79:
            id v44 = (char *)v21[1];
            id v45 = (char *)v21[2];
            if (v44 >= v45)
            {
              uint64_t v47 = 0x6DB6DB6DB6DB6DB7 * ((v44 - (unsigned char *)*v21) >> 3);
              unint64_t v48 = v47 + 1;
              if ((unint64_t)(v47 + 1) > 0x492492492492492) {
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v49 = 0x6DB6DB6DB6DB6DB7 * ((v45 - (unsigned char *)*v21) >> 3);
              if (2 * v49 > v48) {
                unint64_t v48 = 2 * v49;
              }
              if (v49 >= 0x249249249249249) {
                unint64_t v50 = 0x492492492492492;
              }
              else {
                unint64_t v50 = v48;
              }
              if (v50)
              {
                v82 = v21;
                if (v50 > 0x492492492492492) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                uint64_t v51 = v38;
                uint64_t v52 = v39;
                unint64_t v53 = v50;
                unint64_t v54 = (char *)operator new(56 * v50);
                uint64_t v39 = v52;
                uint64_t v38 = v51;
                uint64_t v32 = (uint64_t *)(v8 + 96);
                unint64_t v50 = v53;
                id v21 = v82;
              }
              else
              {
                unint64_t v54 = 0;
              }
              char v55 = &v54[56 * v47];
              *(_OWORD *)char v55 = *(_OWORD *)buf;
              *((_DWORD *)v55 + 4) = v33;
              v55[20] = v36;
              *((void *)v55 + 3) = v38;
              *((void *)v55 + 4) = v39;
              *((void *)v55 + 5) = v40;
              *((double *)v55 + 6) = v43;
              long long v57 = (char *)*v21;
              BOOL v56 = (char *)v21[1];
              long long v58 = v55;
              if (v56 == *v21)
              {
                uint64_t v1 = v86;
                unint64_t v5 = v85;
              }
              else
              {
                uint64_t v1 = v86;
                unint64_t v5 = v85;
                do
                {
                  long long v59 = *(_OWORD *)(v56 - 56);
                  long long v60 = *(_OWORD *)(v56 - 40);
                  long long v61 = *(_OWORD *)(v56 - 24);
                  *((void *)v58 - 1) = *((void *)v56 - 1);
                  *(_OWORD *)(v58 - 24) = v61;
                  *(_OWORD *)(v58 - 40) = v60;
                  *(_OWORD *)(v58 - 56) = v59;
                  v58 -= 56;
                  v56 -= 56;
                }
                while (v56 != v57);
                BOOL v56 = (char *)*v21;
              }
              uint64_t v46 = v55 + 56;
              *id v21 = v58;
              v21[1] = v55 + 56;
              v21[2] = &v54[56 * v50];
              if (v56) {
                operator delete(v56);
              }
            }
            else
            {
              *(_OWORD *)id v44 = *(_OWORD *)v9;
              *((_DWORD *)v44 + 4) = v33;
              v44[20] = v36;
              *((void *)v44 + 3) = v38;
              *((void *)v44 + 4) = v39;
              *((void *)v44 + 5) = v40;
              *((double *)v44 + 6) = v43;
              uint64_t v46 = v44 + 56;
              uint64_t v1 = v86;
              unint64_t v5 = v85;
            }
            v21[1] = v46;
            v106[0] = &unk_1ED517658;
            v106[1] = v87;
            v106[3] = v106;
            LoadItem::foreachRequester(*v32, (uint64_t)v106);
            std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v106);
            if ((v10 & 0x60) != 0) {
              int v62 = 1;
            }
            else {
              int v62 = 3;
            }
            *(_DWORD *)(v8 + 40) = 1;
            *(_DWORD *)(v8 + 44) = v62;
            goto LABEL_103;
          }
          ++v83;
        }
LABEL_103:
        uint64_t v8 = *(void *)(v8 + 8);
        if (v8 == *(void *)(v1 + 112) + 8)
        {
          if (v83)
          {
            v64 = GEOGetTileLoadingLog();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              *(void *)&uint8_t buf[4] = v83;
              _os_log_impl(&dword_188D96000, v64, OS_LOG_TYPE_INFO, "Withholding %{public}llu tile requests from submission due to backpressure", buf, 0xCu);
            }
          }
          break;
        }
      }
    }
    for (uint64_t i = v89; i != (uint64_t *)&v88; uint64_t i = (uint64_t *)i[1])
    {
      unint64_t v66 = i[2];
      unint64_t v67 = i[3];
      unint64_t v68 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v67 - v66) >> 3));
      if (v67 == v66) {
        uint64_t v69 = 0;
      }
      else {
        uint64_t v69 = v68;
      }
      std::__introsort<std::_ClassicAlgPolicy,[(GEOTileLoader *)v66 _requestOnlineTiles];
      geo::BatchLoadHelper::BatchLoadHelper((uint64_t)v87, (long long **)i + 2);
      id v70 = (id)i[8];
      long long v71 = +[GEOApplicationAuditToken compositeTokenForTokens:v70];
      v72 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        long long v73 = v87[4];
        uint64_t v74 = [v73 count];
        int v75 = *((_DWORD *)i + 13);
        uint64_t v76 = objc_opt_class();
        *(_DWORD *)v98 = 134218754;
        uint64_t v99 = v74;
        __int16 v100 = 1024;
        int v101 = v75;
        __int16 v102 = 2112;
        v103 = v71;
        __int16 v104 = 2112;
        uint64_t v105 = v76;
        _os_log_impl(&dword_188D96000, v72, OS_LOG_TYPE_INFO, "Submitting batch of size %zu for provider %d and clients %@ to (%@)", v98, 0x26u);

        uint64_t v1 = v86;
      }

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3321888768;
      v92 = __36__GEOTileLoader__requestOnlineTiles__block_invoke;
      v93 = &__block_descriptor_64_ea8_32c49_ZTSKZ36__GEOTileLoader__requestOnlineTiles_E3__4_e5_v8__0l;
      id v77 = (id)v1;
      id v78 = v71;
      id v94 = v77;
      v95 = v87;
      v96 = i + 2;
      id v97 = v78;
      id v79 = v78;
      id v80 = v77;
      v81 = (void (**)(void))dispatch_block_create_with_voucher_and_qos_class();

      v81[2](v81);
      geo::BatchLoadHelper::~BatchLoadHelper(v87);
    }
    std::__list_imp<geo::Batch>::clear((uint64_t *)&v88);
  }
}

void __41__GEOTileLoader__loadedTile_forKey_info___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  geo_assert_isolated();
  unint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"GEOTileLoadResultMaxAge"];

  uint64_t v7 = (_OWORD *)(a1 + 64);
  uint64_t v8 = 31;
  if ((*(unsigned char *)(a1 + 64) & 0x60) == 0) {
    uint64_t v8 = 127;
  }
  BOOL v9 = (v8 & *(void *)(a1 + 64)) == 2
    && (((unint64_t)*(unsigned __int16 *)(a1 + 77) << 32) & 0xFFFC00000000) == 0x15000000000;
  if (!v5 || (a3 & 1) != 0)
  {
    if (!v5)
    {
      if (qword_1EB29F458 != -1) {
        dispatch_once(&qword_1EB29F458, &__block_literal_global_481);
      }
      id v17 = (id)qword_1EB29F450;
      char v18 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157955;
        *(_DWORD *)&uint8_t buf[4] = 16;
        LOWORD(v54) = 2097;
        *(void *)((char *)&v54 + 2) = a1 + 64;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Tile key: %{private,geo:TileKey}.*P failed to decode", buf, 0x12u);
      }

      id v19 = *(id *)(a1 + 32);
      id v12 = v17;
      *(void *)buf = buf;
      *(void *)&long long v54 = buf;
      *((void *)&v54 + 1) = 0;
      BOOL v20 = operator new(0x20uLL);
      v20[1] = *v7;
      *(void *)BOOL v20 = buf;
      *((void *)v20 + 1) = buf;
      *(void *)buf = v20;
      *(void *)&long long v54 = v20;
      *((void *)&v54 + 1) = 1;
      _appendError(v19, v12, (uint64_t)buf);
      std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(buf);

      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(NSObject **)(v21 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_230;
      block[3] = &unk_1E53D84B8;
      long long v52 = *v7;
      block[4] = v21;
      dispatch_async(v22, block);
      goto LABEL_19;
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 80)) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v6 == 0;
    }
    if (!v10) {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      uint64_t v11 = 40;
      if ((*(void *)(a1 + 64) & 0x80) == 0) {
        uint64_t v11 = 32;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 112) + v11) setTile:v5 forKey:a1 + 64 cost:*(void *)(a1 + 48)];
    }
  }
  id v12 = 0;
LABEL_19:
  unsigned int v13 = (int8x8_t *)(*(void *)(*(void *)(a1 + 32) + 112) + 8);
  while (1)
  {
    unsigned int v13 = (int8x8_t *)v13[1];
    if (v13 == (int8x8_t *)(*(void *)(*(void *)(a1 + 32) + 112) + 8)) {
      break;
    }
    int v14 = v13 + 2;
    if (*(void *)v7 == *(void *)&v13[2] && *(void *)(a1 + 72) == *(void *)&v13[3])
    {
      *(void *)buf = v13;
      unsigned int v16 = (unsigned char *)(a1 + 80);
      if (*(unsigned char *)(a1 + 80))
      {
        id v43 = 0;
        if (v5)
        {
          BOOL v38 = 0;
          goto LABEL_35;
        }
        BOOL v38 = 0;
        v13[5].i32[1] = 3;
LABEL_43:
        long long v45 = *v7;
        id v29 = v12;
        id v30 = *(id *)(a1 + 40);
        BOOL v31 = (char *)operator new(0x38uLL);
        *(void *)BOOL v31 = &unk_1ED518418;
        *(_OWORD *)(v31 + 8) = v45;
        *((void *)v31 + 3) = v29;
        id v25 = v30;
        *((void *)v31 + 4) = v25;
        *((void *)v31 + 5) = v16;
        *((void *)v31 + 6) = &v43;
        uint64_t v47 = v31;
        uint64_t v28 = v46;
        LoadItem::foreachRequester(*(void *)&v13[12], (uint64_t)v46);
      }
      else
      {
        BOOL v38 = (unint64_t)LoadItem::options((LoadItem *)&v13[2]) > 0x1FF;
        id v43 = 0;
        if (!v5)
        {
          v13[5].i32[0] = 3;
          goto LABEL_43;
        }
LABEL_35:
        id v23 = *(id *)(a1 + 40);
        if (*(unsigned char *)(a1 + 80))
        {
          uint64_t v24 = 14;
          if (a3) {
            uint64_t v24 = 17;
          }
          geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset((uint64_t)&v13[v24 + 2], v5);
          v13[5].i32[1] = 5;
        }
        else
        {
          v13[5].i32[0] = 5;
        }
        id v25 = v23;
        long long v48 = *v7;
        id v26 = v5;
        unsigned __int8 v27 = operator new(0x38uLL);
        *unsigned __int8 v27 = &unk_1ED5183C0;
        v27[1] = v25;
        *((_OWORD *)v27 + 1) = v48;
        v27[4] = v26;
        v27[5] = v16;
        v27[6] = &v43;
        unint64_t v50 = v27;
        uint64_t v28 = v49;
        LoadItem::foreachRequester(*(void *)&v13[12], (uint64_t)v49);
      }
      std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v28);

      if (*v16)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v32 = v43;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v40 != v34) {
                objc_enumerationMutation(v32);
              }
              LoadItem::deleteRequester(v14, *(NSString **)(*((void *)&v39 + 1) + 8 * i), 0, 0);
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v33);
        }

        -[GEOTileLoader _cancelIfNeeded:](*(void *)(a1 + 32), (uint64_t **)buf);
      }
      else
      {
        -[GEOTileLoader _notifyObserversOfSuccess:sizeInBytes:source:options:](*(void *)(a1 + 32), (long long *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)&v13[6]);
        uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 112);
        id v37 = (int8x8_t *)*v13;
        v37[1] = v13[1];
        **(void **)&v13[1] = v37;
        --*(void *)(v36 + 24);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)&v13[2]);
        operator delete(v13);
      }
      if (v38) {
        geo_isolate_async();
      }

      break;
    }
  }
}

- (uint64_t)_requestOnlineTiles
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)_notifyObserversOfSuccess:(uint64_t)a3 sizeInBytes:(uint64_t)a4 source:(uint64_t)a5 options:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v12 = 0;
    unsigned int v13 = &v12;
    uint64_t v14 = 0x3032000000;
    char v15 = __Block_byref_object_copy__0;
    unsigned int v16 = __Block_byref_object_dispose__0;
    id v17 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    geo_isolate_sync_data();
    if (objc_msgSend((id)v13[5], "count", v10, 3221225472, __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke, &unk_1E53D8210, a1, &v12))
    {
      long long v27 = *a2;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      BOOL v20 = __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke_2;
      uint64_t v21 = &unk_1E53D8238;
      uint64_t v22 = a1;
      id v23 = &v12;
      uint64_t v24 = a3;
      uint64_t v25 = a4;
      uint64_t v26 = a5;
      geo_dispatch_async_qos();
    }
    _Block_object_dispose(&v12, 8);
  }
}

- (void)proxy:(uint64_t)a3 loadedTile:(void *)a4 forKey:(long long *)a5 info:(void *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = v10;
  if (a1)
  {
    uint64_t v12 = [v10 objectForKey:@"GEOTileLoadResultSource"];
    uint64_t v13 = [v12 integerValue];

    uint64_t v14 = 88;
    if (v13 == 1) {
      uint64_t v14 = 84;
    }
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 112) + v14), 1u);
    char v15 = [v11 objectForKeyedSubscript:@"GEOTileLoadResultIsPreliminary"];
    char v16 = [v15 BOOLValue];

    char v23 = 1;
    id v17 = -[GEOTileLoader _tileDecoderForTileKey:quickly:](a1, (uint64_t)a5, (uint64_t)&v23);
    long long v41 = *a5;
    uint64_t v18 = [v9 length];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke;
    v35[3] = &unk_1E53D84E0;
    v35[4] = a1;
    id v19 = v11;
    long long v39 = v41;
    char v40 = v16;
    id v36 = v19;
    uint64_t v37 = v18;
    uint64_t v38 = v13;
    BOOL v20 = (void *)MEMORY[0x18C120660](v35);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_3;
    long long v27 = &unk_1E53D8508;
    uint64_t v28 = a1;
    long long v32 = v41;
    char v33 = v16;
    char v34 = v23;
    id v21 = v17;
    id v29 = v21;
    id v30 = v9;
    id v31 = v20;
    id v22 = v20;
    geo_isolate_sync();
  }
}

- (id)_tileDecoderForTileKey:(uint64_t)a3 quickly:
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v5 = -97;
    if ((*(unsigned char *)a2 & 0x60) == 0) {
      uint64_t v5 = -1;
    }
    v30[0] = v5 & *(void *)a2;
    v30[1] = v4;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__0;
    long long v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __48__GEOTileLoader__tileDecoderForTileKey_quickly___block_invoke;
    BOOL v20 = &unk_1E53D8210;
    uint64_t v21 = a1;
    id v22 = &v23;
    geo_isolate_sync_data();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)v24[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "canDecodeTile:quickly:", v30, a3, (void)v13))
          {
            id v11 = v10;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_14:

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
}

- (void)_requestOnlineTiles
{
}

- (void)proxyDidDownloadRegionalResources:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GEOTileLoader_proxyDidDownloadRegionalResources___block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __36__GEOTileLoader__requestOnlineTiles__block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[5];
  uint64_t v2 = a1[6];
  LOBYTE(v4) = *(unsigned char *)(v2 + 32);
  return [*(id *)(a1[4] + 40) loadTiles:v1[4] batchID:*(unsigned int *)(v2 + 64) priorities:*v1 hasAdditionalInfos:v1[1] additionalInfos:v1[2] signpostIDs:v1[3] createTimes:v1[5] reason:v4 options:*(void *)(v2 + 24) auditToken:a1[7]];
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 callbackQ:(void *)a8 beginNetwork:(void *)a9 callback:(void *)a10
{
  id v19 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  [a1 loadKey:a3 priority:a4 forClient:v19 options:a6 reason:a7 qos:qos_class_self() callbackQ:v16 beginNetwork:v17 callback:v18];
}

- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 callbackQ:(uint64_t)a9 beginNetwork:(uint64_t)a10 callback:(uint64_t)a11
{
  LODWORD(v12) = a8;
  return [a1 loadKey:a3 additionalInfo:0 priority:a4 forClient:a5 options:a6 reason:a7 qos:v12 callbackQ:a9 beginNetwork:a10 callback:a11];
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v22 = a6;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  GEOMachAbsoluteTimeGetCurrent();
  -[GEOTileLoader loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:](a1, a3, a4, a5, v22, a7, a8, a9, v21, 0, v18, v19, v20);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(void *)a5 forClient:(uint64_t)a6 options:(unsigned int)a7 reason:(int)a8 qos:(double)a9 signpostID:(uint64_t)a10 createTime:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:
{
  id v26 = a5;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  uint64_t v23 = v22;
  if (a1)
  {
    LODWORD(v24) = a8;
    [a1 loadKey:a2 additionalInfo:a3 priority:a4 forClient:v26 options:a6 reason:a7 qos:a9 signpostID:v24 auditToken:a10 createTime:0 callbackQ:v20 beginNetwork:v21 callback:v22];
  }
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 auditToken:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:(void *)a14
{
  id v25 = a6;
  id v18 = a11;
  id v19 = a12;
  id v20 = a13;
  id v21 = a14;
  GEOMachAbsoluteTimeGetCurrent();
  LODWORD(v22) = a9;
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, a5, v25, a7, a8, v22, a10, v18, v19, v20, v21);
}

void __51__GEOTileLoader_proxyDidDownloadRegionalResources___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOTileLoaderDidUpdateRegionalResourcesNotification" object:*(void *)(a1 + 32)];
}

- (void)closeForClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v5 = v4;
  uint64_t v7 = v5;
  geo_isolate_sync_data();
  if (!v9[3] && v13[3]) {
    [(GEOTileServerProxy *)self->_proxy close];
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void __29__GEOTileLoader_modernLoader__block_invoke()
{
  v0 = objc_alloc_init(GEOTileLoader);
  uint64_t v1 = (void *)qword_1EB29F3F0;
  qword_1EB29F3F0 = (uint64_t)v0;
}

- (GEOTileLoader)init
{
  uint64_t v3 = +[GEOTileLoader singletonConfiguration]();
  id v4 = (GEOTileLoader *)-[GEOTileLoader initWithConfiguration:serverProxy:](self, v3);

  return v4;
}

+ (id)singletonConfiguration
{
  self;
  if (qword_1EB29F3F8 != -1) {
    dispatch_once(&qword_1EB29F3F8, &__block_literal_global_4);
  }
  v0 = (void *)qword_1EB29F400;

  return v0;
}

void __39__GEOTileLoader_singletonConfiguration__block_invoke()
{
  v0 = objc_alloc_init(GEOTileLoaderConfiguration);
  uint64_t v1 = (void *)qword_1EB29F400;
  qword_1EB29F400 = (uint64_t)v0;
}

- (GEOTileLoader)initWithConfiguration:(id)a3
{
  return (GEOTileLoader *)-[GEOTileLoader initWithConfiguration:serverProxy:](self, a3);
}

- (void)registerTileDecoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    id v7 = v4;
    geo_isolate_sync_data();
    [(GEOTileLoader *)self clearAllCaches];
  }
}

- (void)clearAllCaches
{
  [*((id *)self->_internal + 4) removeAllObjects];
  uint64_t v3 = (void *)*((void *)self->_internal + 5);

  [v3 removeAllObjects];
}

- (id)initWithConfiguration:(id)a1 serverProxy:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)GEOTileLoader;
    a1 = objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      id v5 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v4;

      uint64_t v6 = objc_alloc_init(GEOTileLoaderInternal);
      id v7 = (void *)*((void *)a1 + 14);
      *((void *)a1 + 14) = v6;

      uint64_t v8 = geo_dispatch_queue_create_with_format();
      id v9 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v8;

      uint64_t v10 = geo_isolater_create_with_format();
      uint64_t v11 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v10;

      uint64_t v12 = geo_isolater_create_with_format();
      long long v13 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v12;

      uint64_t v14 = geo_isolater_create_with_format();
      uint64_t v15 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v14;

      uint64_t v16 = geo_isolater_create_with_format();
      id v17 = (void *)*((void *)a1 + 16);
      *((void *)a1 + 16) = v16;

      *((unsigned char *)a1 + 104) = 1;
      objc_initWeak(&location, a1);
      operator new();
    }
  }

  return a1;
}

- (void)initWithConfiguration:serverProxy:
{
}

void __37__GEOTileLoader_registerTileDecoder___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 addObject:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;
  }
}

void __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = v30;
    id v30 = v2;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v33 = *(_OWORD *)*(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 112) + 8;
        while (1)
        {
          uint64_t v8 = *(void *)(v8 + 8);
          if (v8 == *(void *)(*(void *)(a1 + 32) + 112) + 8) {
            break;
          }
          if ((void)v33 == *(void *)(v8 + 16) && *((void *)&v33 + 1) == *(void *)(v8 + 24))
          {
            uint64_t v24 = 0;
            id v25 = (uint64_t *)v8;
            uint64_t v22 = (uint64_t)&v22;
            uint64_t v23 = &v22;
            *(_DWORD *)(v8 + 40) = 2;
            if (*(_DWORD *)(v8 + 44) == 1) {
              *(_DWORD *)(v8 + 44) = 3;
            }
            long long v32 = 0;
            uint64_t v10 = operator new(0x28uLL);
            void *v10 = &unk_1ED518470;
            v10[1] = &v22;
            *((_OWORD *)v10 + 1) = v33;
            v10[4] = &v30;
            long long v32 = v10;
            LoadItem::foreachRequester(*(void *)(v8 + 96), (uint64_t)v31);
            std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v31);
            for (j = v23; j != &v22; j = (uint64_t *)j[1])
            {
              uint64_t v12 = (NSString *)(id)j[2];
              LoadItem::deleteRequester((int8x8_t *)(v8 + 16), v12, 0, 0);
            }
            if (v24)
            {
              if (!*(void *)(v8 + 104))
              {
                uint64_t v13 = *(void *)(a1 + 32);
                uint64_t v14 = _noNetErr();
                -[GEOTileLoader _notifyObserversOfFailure:error:options:](v13, &v33, v14, *(void *)(v8 + 48));
              }
              -[GEOTileLoader _cancelIfNeeded:](*(void *)(a1 + 32), &v25);
            }
            std::__list_imp<NSString * {__strong}>::clear(&v22);
            break;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v5);
  }

  id v15 = v30;
  if (v30)
  {
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    if (v16)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke_2;
      v19[3] = &unk_1E53D81E8;
      id v17 = v30;
      uint64_t v18 = *(void *)(a1 + 32);
      id v20 = v17;
      uint64_t v21 = v18;
      dispatch_async(v16, v19);

      id v15 = v30;
    }
  }
}

- (void)proxy:(id)a3 willGoToNetworkForTiles:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Will go to network for tiles %{geo:TileKeyList}@", buf, 0xCu);
  }

  id v6 = v4;
  geo_isolate_sync();
}

void __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (void)v8);
        [*(id *)(*(void *)(a1 + 40) + 64) tileLoader:*(void *)(a1 + 40) submittedTilesToNetwork:v7 forClient:v6];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 112);
  if (*(void *)(v1 + 72))
  {
    uint64_t v3 = *(void *)(v1 + 64);
    uint64_t v4 = (void *)MEMORY[0x18C120660](*(void *)(v3 + 24));
    uint64_t v5 = *(NSObject **)(v3 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke_2;
    v12[3] = &unk_1E53D85D0;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 40);
    id v13 = v6;
    uint64_t v14 = v7;
    dispatch_async(v5, v12);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 112);
    long long v10 = *(uint64_t **)(v8 + 64);
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v11 = *v10;
    *(void *)(v11 + 8) = v10[1];
    *(void *)v10[1] = v11;
    *(void *)(v8 + 72) = v9 - 1;
    std::__destroy_at[abi:ne180100]<_CacheRequester<void({block_pointer} {__strong})(unsigned long long)>,0>((uint64_t)(v10 + 2));
    operator delete(v10);
  }
}

- (void)proxy:(id)a3 canShrinkDiskCacheByAmount:(unint64_t)a4
{
}

+ (id)modernLoaderForTileGroupIdentifier:(unsigned int)a3 locale:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(GEOResourceManifestConfiguration);
  [(GEOResourceManifestConfiguration *)v7 setTileGroupIdentifier:v4];
  uint64_t v8 = [a1 modernLoaderForResourceManifestConfiguration:v7 locale:v6];

  return v8;
}

void __69__GEOTileLoader_modernLoaderForResourceManifestConfiguration_locale___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = (void *)qword_1EB29F410;
  qword_1EB29F410 = v0;
}

+ (void)setServerProxyClass:(Class)a3
{
  +[GEOTileLoader singletonConfiguration]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setServerProxyClass:a3];
}

+ (void)useRemoteLoader
{
  +[GEOTileLoader singletonConfiguration]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setServerProxyClass:objc_opt_class()];
}

+ (void)useLocalLoader
{
  +[GEOTileLoader singletonConfiguration]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setServerProxyClass:objc_opt_class()];
}

+ (void)setMemoryCacheCountLimit:(unint64_t)a3
{
  +[GEOTileLoader singletonConfiguration]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMemoryCacheCountLimit:a3];
}

+ (void)setMemoryCacheTotalCostLimit:(unint64_t)a3
{
  +[GEOTileLoader singletonConfiguration]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMemoryCacheCostLimit:a3];
}

+ (void)setDiskCacheLocation:(id)a3
{
  id v4 = a3;
  uint64_t v3 = +[GEOTileLoader singletonConfiguration]();
  [v3 setDiskCacheLocation:v4];
}

+ (id)diskCacheLocation
{
  id v2 = +[GEOTileLoader singletonConfiguration]();
  uint64_t v3 = [v2 diskCacheLocation];

  return v3;
}

+ (void)setDiskCacheExternalLocation:(id)a3
{
  id v4 = a3;
  uint64_t v3 = +[GEOTileLoader singletonConfiguration]();
  [v3 setDiskCacheExternalLocation:v4];
}

+ (id)diskCacheExternalLocation
{
  id v2 = +[GEOTileLoader singletonConfiguration]();
  uint64_t v3 = [v2 diskCacheExternalLocation];

  return v3;
}

- (int)memoryHits
{
  return atomic_load((unsigned int *)self->_internal + 20);
}

- (int)diskHits
{
  return atomic_load((unsigned int *)self->_internal + 21);
}

- (int)networkHits
{
  return atomic_load((unsigned int *)self->_internal + 22);
}

- (void)dealloc
{
  uint64_t v3 = [(GEOTileLoaderConfiguration *)self->_config manifestConfiguration];
  id v4 = +[GEOResourceManifestManager modernManagerForConfiguration:v3];
  [v4 removeTileGroupObserver:self];

  uint64_t v5 = +[GEOExperimentConfiguration sharedConfiguration];
  [v5 removeExperimentObserver:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  GEOUnregisterStateCaptureLegacy();
  v7.receiver = self;
  v7.super_class = (Class)GEOTileLoader;
  [(GEOTileLoader *)&v7 dealloc];
}

- (NSString)description
{
  id v4 = [MEMORY[0x1E4F28E78] string];
  geo_isolate_sync_data();
  id v2 = v4;

  return (NSString *)v2;
}

void __28__GEOTileLoader_description__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v20.receiver = *(id *)(a1 + 40);
  v20.super_class = (Class)GEOTileLoader;
  uint64_t v3 = objc_msgSendSuper2(&v20, sel_description);
  [v2 appendFormat:@"<%@> {\n", v3];

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tcacheCountLimit: %ld\n", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "memoryCacheCountLimit"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tcacheTotalCostLimit: %ld\n", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "memoryCacheCostLimit"));
  [*(id *)(a1 + 32) appendFormat:@"\tproxy: %@\n", *(void *)(*(void *)(a1 + 40) + 40)];
  id v19 = *(id *)(a1 + 32);
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tmemoryhits: %d\n", objc_msgSend(*(id *)(a1 + 40), "memoryHits"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tdiskhits: %d\n", objc_msgSend(*(id *)(a1 + 40), "diskHits"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tnetworkhits: %d\n", objc_msgSend(*(id *)(a1 + 40), "networkHits"));
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 112);
  uint64_t v6 = *(void *)(v5 + 16);
  while (v6 != v5 + 8)
  {
    objc_super v7 = LoadItem::description((LoadItem *)(v6 + 16));
    [v4 addObject:v7];

    uint64_t v6 = *(void *)(v6 + 8);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 112);
  }
  [*(id *)(a1 + 32) appendFormat:@"\tloadItems: %@\n", v4];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 112);
  uint64_t v10 = v9[13];
  if (v9[14] != v10)
  {
    unint64_t v11 = v9[16];
    uint64_t v12 = (void *)(v10 + 8 * (v11 / 0x49));
    id v13 = (ErrorInfo *)(*v12 + 56 * (v11 % 0x49));
    unint64_t v14 = *(void *)(v10 + 8 * ((v9[17] + v11) / 0x49)) + 56 * ((v9[17] + v11) % 0x49);
    while (v13 != (ErrorInfo *)v14)
    {
      id v15 = ErrorInfo::description(v13);
      [v8 addObject:v15];

      id v13 = (ErrorInfo *)((char *)v13 + 56);
      if ((ErrorInfo *)((char *)v13 - *v12) == (ErrorInfo *)4088)
      {
        uint64_t v16 = (ErrorInfo *)v12[1];
        ++v12;
        id v13 = v16;
      }
    }
  }
  id v17 = *(void **)(a1 + 32);
  uint64_t v18 = [v8 description];
  [v17 appendFormat:@"\terrors: %@\n", v18];
}

uint64_t __28__GEOTileLoader_description__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendFormat:@"\topeners: %@\n", *(void *)(*(void *)(a1 + 40) + 24)];
}

- (id)descriptionDictionaryRepresentation
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  geo_isolate_sync_data();
  id v2 = v4;

  return v2;
}

void __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "memoryCacheCountLimit"));
  [v2 setObject:v3 forKey:@"cacheCountLimit"];

  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "memoryCacheCostLimit"));
  [v2 setObject:v4 forKey:@"cacheTotalCostLimit"];

  uint64_t v5 = [NSString stringWithFormat:@"%@", *(void *)(*(void *)(a1 + 32) + 40)];
  [v2 setObject:v5 forKey:@"proxy"];

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  long long v33 = __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke_2;
  char v34 = &unk_1E53D81E8;
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v35 = v6;
  uint64_t v36 = v7;
  geo_isolate_sync_data();
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 32), "memoryHits"));
  [v6 setObject:v8 forKey:@"memoryhits"];

  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 32), "diskHits"));
  [v6 setObject:v9 forKey:@"diskhits"];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 32), "networkHits"));
  [v6 setObject:v10 forKey:@"networkhits"];

  unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 112);
  uint64_t v13 = *(void *)(v12 + 16);
  while (v13 != v12 + 8)
  {
    unint64_t v14 = LoadItem::description((LoadItem *)(v13 + 16));
    [v11 addObject:v14];

    uint64_t v13 = *(void *)(v13 + 8);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 112);
  }
  id v15 = [NSString stringWithFormat:@"%@", v11];
  [v6 setObject:v15 forKey:@"loadItems"];

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  id v17 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v18 = v17[13];
  if (v17[14] != v18)
  {
    unint64_t v19 = v17[16];
    objc_super v20 = (void *)(v18 + 8 * (v19 / 0x49));
    uint64_t v21 = (ErrorInfo *)(*v20 + 56 * (v19 % 0x49));
    unint64_t v22 = *(void *)(v18 + 8 * ((v17[17] + v19) / 0x49)) + 56 * ((v17[17] + v19) % 0x49);
    while (v21 != (ErrorInfo *)v22)
    {
      uint64_t v23 = ErrorInfo::description(v21);
      [v16 addObject:v23];

      uint64_t v21 = (ErrorInfo *)((char *)v21 + 56);
      if ((ErrorInfo *)((char *)v21 - *v20) == (ErrorInfo *)4088)
      {
        uint64_t v24 = (ErrorInfo *)v20[1];
        ++v20;
        uint64_t v21 = v24;
      }
    }
  }
  id v25 = NSString;
  long long v26 = [v16 description];
  long long v27 = [v25 stringWithFormat:@"%@", v26];
  [v6 setObject:v27 forKey:@"errors"];

  long long v28 = *(void **)(a1 + 40);
  v30.receiver = *(id *)(a1 + 32);
  v30.super_class = (Class)GEOTileLoader;
  long long v29 = objc_msgSendSuper2(&v30, sel_description);
  [v28 setObject:v6 forKey:v29];
}

void __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [NSString stringWithFormat:@"%@", *(void *)(*(void *)(a1 + 40) + 24)];
  objc_msgSend(v1, "setObject:forKey:");
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

void __34__GEOTileLoader_registerObserver___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 120))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:1];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 120);
    *(void *)(v3 + 120) = v2;
  }
  uint64_t v5 = [_GEOTileLoaderObserverWrapper alloc];
  id v6 = *(id *)(a1 + 40);
  if (v5
    && (v8.receiver = v5,
        v8.super_class = (Class)_GEOTileLoaderObserverWrapper,
        (uint64_t v7 = (id *)objc_msgSendSuper2(&v8, sel_init)) != 0))
  {
    objc_storeWeak(v7 + 1, v6);
    *((unsigned char *)v7 + 16) = objc_opt_respondsToSelector() & 1;
    *((unsigned char *)v7 + 17) = objc_opt_respondsToSelector() & 1;
    *((unsigned char *)v7 + 18) = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  [*(id *)(*(void *)(a1 + 32) + 120) setObject:v7 forKey:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __36__GEOTileLoader_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(a1 + 40)];
}

void __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v12 = *(void *)v14;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v14 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v13 + 1) + 8 * v3);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v7 = *(void *)(a1 + 64);
        id v8 = *(id *)(a1 + 32);
        if (v4)
        {
          if (*(unsigned char *)(v4 + 17))
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
            [WeakRetained tileLoader:v8 loadedTileKey:a1 + 72 fromSource:v5 withOptions:v7];
          }
          if (*(unsigned char *)(v4 + 16))
          {
            id v10 = objc_loadWeakRetained((id *)(v4 + 8));
            [v10 tileLoader:v8 loadedTileKey:a1 + 72 sizeInBytes:v6 fromSource:v5 withOptions:v7];
          }
        }

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v2);
  }
}

- (void)_notifyObserversOfFailure:(void *)a3 error:(uint64_t)a4 options:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    unint64_t v11 = __Block_byref_object_copy__0;
    uint64_t v12 = __Block_byref_object_dispose__0;
    id v13 = 0;
    geo_isolate_sync_data();
    if ([(id)v9[5] count])
    {
      long long v22 = *a2;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      long long v16 = __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke_2;
      id v17 = &unk_1E53D8260;
      objc_super v20 = &v8;
      uint64_t v18 = a1;
      id v19 = v7;
      uint64_t v21 = a4;
      geo_dispatch_async_qos();
    }
    _Block_object_dispose(&v8, 8);
  }
}

void __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) objectEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 56);
        id v9 = *(id *)(a1 + 32);
        id v10 = v7;
        if (v6 && *(unsigned char *)(v6 + 18))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
          objc_msgSend(WeakRetained, "tileLoader:failedTileKey:error:withOptions:", v9, a1 + 64, v10, v8, (void)v12);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)_cancel:(void *)a3 err:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *a2;
  long long v23 = *((_OWORD *)*a2 + 1);
  id v7 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68158211;
    int v18 = 16;
    __int16 v19 = 2097;
    objc_super v20 = &v23;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "_cancel %{private,geo:TileKey}.*P error: %@", buf, 0x1Cu);
  }

  if ((*((_DWORD *)v6 + 10) - 1) <= 1) {
    [*(id *)(a1 + 40) cancel:&v23 batchID:*((unsigned int *)v6 + 30)];
  }
  if (!v5)
  {
    _cancelErr();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__GEOTileLoader__cancel_err___block_invoke;
  v12[3] = &unk_1E53D8300;
  long long v14 = v23;
  id v8 = v5;
  id v13 = v8;
  long long v16 = 0;
  v15[0] = &unk_1ED5175A8;
  v15[1] = MEMORY[0x18C120660](v12);
  long long v16 = v15;
  LoadItem::foreachRequester(v6[12], (uint64_t)v15);
  std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v15);
  uint64_t v9 = *(void *)(a1 + 112);
  id v10 = *a2;
  uint64_t v11 = *v10;
  *(void *)(v11 + 8) = v10[1];
  *(void *)v10[1] = v11;
  --*(void *)(v9 + 24);
  std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v10 + 2));
  operator delete(v10);
}

void __29__GEOTileLoader__cancel_err___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x18C120660](*(void *)(a2 + 104));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__GEOTileLoader__cancel_err___block_invoke_2;
  block[3] = &unk_1E53D82D8;
  id v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v5 = v4;
  LoadItem::Requester::performAsyncOnCallbackQueue(a2, block);
}

uint64_t __29__GEOTileLoader__cancel_err___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a1 + 48, 0, 0, *(void *)(a1 + 32), 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  _cacheMissErr();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  _noNetErr();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_5(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 length];
  uint64_t v6 = @"GEOTileLoadResultIsPreliminary";
  v7[0] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, void, void *))(v3 + 16))(v3, a1 + 48, v2, v4, 0, v5);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  _cacheMissErr();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  _cacheMissErr();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_8(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  v8[0] = @"GEOTileLoadResultSource";
  v8[1] = @"OriginalLoadReason";
  v9[0] = &unk_1ED73D588;
  uint64_t v6 = [NSNumber numberWithUnsignedChar:v5];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void *))(v3 + 16))(v3, a1 + 56, v2, v4, 0, v7);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  _cacheMissErr();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, void))(v1 + 16))(v1, v2, 0, 0);
}

- (void)_decodePreliminaryTileData:(void *)a3 forKey:(uint64_t *)a4
{
  v11[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *a4;
  uint64_t v8 = a4[1];
  unsigned __int8 v10 = 1;
  long long v9 = -[GEOTileLoader _tileDecoderForTileKey:quickly:]((uint64_t)a1, (uint64_t)a4, (uint64_t)&v10);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__GEOTileLoader__decodePreliminaryTileData_forKey___block_invoke;
  v11[3] = &unk_1E53D83C8;
  v11[4] = a1;
  v11[5] = v7;
  v11[6] = v8;
  [(GEOTileLoader *)a1 _loadedTileForLocalKey:v8 preliminary:1 quickly:v10 tileDecoder:v9 data:v6 disburseTile:v11];
}

void __51__GEOTileLoader__decodePreliminaryTileData_forKey___block_invoke(uint64_t a1, void *a2, char a3)
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5 && (a3 & 1) == 0)
  {
    id v6 = (long long *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 112) + 8;
    while (1)
    {
      uint64_t v7 = *(void *)(v7 + 8);
      if (v7 == *(void *)(*(void *)(a1 + 32) + 112) + 8) {
        break;
      }
      uint64_t v8 = (int8x8_t *)(v7 + 16);
      if (*(void *)v6 == *(void *)(v7 + 16) && *(void *)(a1 + 48) == *(void *)(v7 + 24))
      {
        __int16 v21 = (uint64_t *)v7;
        if (*(_DWORD *)(v7 + 44) == 4)
        {
          geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset(v7 + 128, v5);
          id v20 = 0;
          long long v23 = *v6;
          id v10 = v5;
          uint64_t v11 = (char *)operator new(0x28uLL);
          *(void *)uint64_t v11 = &unk_1ED5184C8;
          *(_OWORD *)(v11 + 8) = v23;
          *((void *)v11 + 3) = v10;
          *((void *)v11 + 4) = &v20;
          v24[3] = v11;
          LoadItem::foreachRequester(*(void *)(v7 + 96), (uint64_t)v24);
          std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v24);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v12 = v20;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v22 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v17;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v17 != v14) {
                  objc_enumerationMutation(v12);
                }
                LoadItem::deleteRequester(v8, *(NSString **)(*((void *)&v16 + 1) + 8 * i), 0, 0);
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v22 count:16];
            }
            while (v13);
          }

          -[GEOTileLoader _cancelIfNeeded:](*(void *)(a1 + 32), &v21);
        }
        break;
      }
    }
  }
}

- (BOOL)reprioritizeKey:(uint64_t)a3 forClient:(void *)a4 newPriority:(int)a5
{
  id v8 = a4;
  long long v9 = v8;
  BOOL v10 = 0;
  if (a3 && v8 && a5)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v11 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke;
    block[3] = &unk_1E53D83F0;
    long long v15 = &v18;
    uint64_t v16 = a3;
    void block[4] = a1;
    id v14 = v8;
    int v17 = a5;
    dispatch_sync(v11, block);
    BOOL v10 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }

  return v10;
}

void __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  id v1 = (id)v2;
  geo_isolate_sync();
}

void __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 112) + 8;
  while (1)
  {
    uint64_t v3 = *(void *)(v3 + 8);
    if (v3 == *(void *)(*(void *)(a1 + 32) + 112) + 8) {
      break;
    }
    if (*v2 == *(void *)(v3 + 16) && v2[1] == *(void *)(v3 + 24))
    {
      int v5 = *(_DWORD *)(a1 + 64);
      id v6 = *(id *)(a1 + 40);
      id v13 = v6;
      if (*(_DWORD *)(v3 + 40) <= 2u
        && (uint64_t v7 = std::__hash_table<std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,LoadItem::_NSStringHashFunc,LoadItem::_NSStringEqualsFunc,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,LoadItem::_NSStringEqualsFunc,LoadItem::_NSStringHashFunc,true>,std::allocator<std::__hash_value_type<NSString * {__strong},LoadItem::Requester>>>::find<NSString * {__strong}>((void *)(v3 + 80), &v13)) != 0)
      {
        if (*(void *)(v3 + 104) && (id v8 = *(uint64_t **)(v3 + 96)) != 0)
        {
          unsigned int v9 = 0;
          BOOL v10 = *(uint64_t **)(v3 + 96);
          do
          {
            if (*((_DWORD *)v10 + 39) > v9) {
              unsigned int v9 = *((_DWORD *)v10 + 39);
            }
            BOOL v10 = (uint64_t *)*v10;
          }
          while (v10);
          *((_DWORD *)v7 + 39) = v5;
          do
          {
            if (*((_DWORD *)v8 + 39) > v10) {
              LODWORD(v10) = *((_DWORD *)v8 + 39);
            }
            id v8 = (uint64_t *)*v8;
          }
          while (v8);
        }
        else
        {
          unsigned int v9 = 0;
          LODWORD(v10) = 0;
          *((_DWORD *)v7 + 39) = v5;
        }
        BOOL v12 = v9 == v10;
        BOOL v11 = *(_DWORD *)(v3 + 40) == 0;
      }
      else
      {
        BOOL v11 = 0;
        BOOL v12 = 1;
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && !v12)
      {
        [*(id *)(*(void *)(a1 + 32) + 40) reprioritizeKey:*(void *)(a1 + 56) newPriority:*(unsigned int *)(a1 + 64) batchID:*(unsigned int *)(v3 + 120)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      return;
    }
  }
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 auditToken:(void *)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11
{
  id v21 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  [a1 loadKey:a3 priority:a4 forClient:v21 options:a6 reason:a7 qos:qos_class_self() signpostID:0 auditToken:v17 callbackQ:v18 beginNetwork:v19 callback:v20];
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v21 = a5;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  GEOMachAbsoluteTimeGetCurrent();
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, v21, a6, a7, a8, a9, 0, v18, v19, v20);
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(unsigned int)a8 signpostID:(uint64_t)a9 auditToken:(void *)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13
{
  id v23 = a5;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  GEOMachAbsoluteTimeGetCurrent();
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, v23, a6, a7, a8, a9, v18, v19, v20, v21);
}

- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 signpostID:(uint64_t)a9 createTime:(uint64_t)a10 callbackQ:(uint64_t)a11 beginNetwork:(uint64_t)a12 callback:
{
  LODWORD(v13) = a8;
  return objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, 0, a4, a5, a6, a7, v13, a9, 0, a10, a11, a12);
}

- (uint64_t)loadKey:(void *)a1 priority:(uint64_t)a2 forClient:(uint64_t)a3 options:(uint64_t)a4 reason:(uint64_t)a5 qos:(uint64_t)a6 signpostID:(uint64_t)a7 auditToken:(int)a8 createTime:(uint64_t)a9 callbackQ:(uint64_t)a10 beginNetwork:(__int128)a11 callback:(uint64_t)a12
{
  LODWORD(v13) = a8;
  return objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, 0, a4, a5, a6, a7, v13, a9, a10, a11, a12);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11
{
  id v21 = a6;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  LODWORD(v20) = qos_class_self();
  [a1 loadKey:a3 additionalInfo:a4 priority:a5 forClient:v21 options:a7 reason:a8 qos:v20 callbackQ:v17 beginNetwork:v18 callback:v19];
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v22 = a6;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  LODWORD(v21) = qos_class_self();
  [a1 loadKey:a3 additionalInfo:a4 priority:a5 forClient:v22 options:a7 reason:a8 qos:v21 signpostID:a9 callbackQ:v18 beginNetwork:v19 callback:v20];
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13
{
  id v23 = a6;
  id v18 = a11;
  id v19 = a12;
  id v20 = a13;
  GEOMachAbsoluteTimeGetCurrent();
  -[GEOTileLoader loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:](a1, a3, a4, a5, v23, a7, a8, a9, v21, a10, v18, v19, v20);
}

- (void)cancelKey:(uint64_t)a3 forClient:(void *)a4
{
  id v5 = a4;
  id v4 = v5;
  geo_isolate_async();
}

unint64_t __37__GEOTileLoader_cancelKey_forClient___block_invoke(unint64_t result)
{
  unint64_t v1 = result;
  long long v2 = (void *)(result + 48);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 112) + 8;
  while (1)
  {
    uint64_t v3 = *(void *)(v3 + 8);
    if (v3 == *(void *)(*(void *)(result + 32) + 112) + 8) {
      break;
    }
    if (*v2 == *(void *)(v3 + 16) && *(void *)(result + 56) == *(void *)(v3 + 24))
    {
      BOOL v12 = (uint64_t *)v3;
      if (*(void *)(v3 + 104) && (id v5 = *(uint64_t **)(v3 + 96)) != 0)
      {
        unsigned int v6 = 0;
        do
        {
          if (*((_DWORD *)v5 + 39) > v6) {
            unsigned int v6 = *((_DWORD *)v5 + 39);
          }
          id v5 = (uint64_t *)*v5;
        }
        while (v5);
      }
      else
      {
        unsigned int v6 = 0;
      }
      unint64_t v7 = LoadItem::options((LoadItem *)(v3 + 16));
      LoadItem::deleteRequester((int8x8_t *)(v3 + 16), *(NSString **)(v1 + 40), 1, 0);
      uint64_t result = -[GEOTileLoader _cancelIfNeeded:](*(void *)(v1 + 32), &v12);
      if ((result & 1) == 0)
      {
        if (*(void *)(v3 + 104) && (id v8 = *(uint64_t **)(v3 + 96)) != 0)
        {
          unsigned int v9 = 0;
          do
          {
            if (*((_DWORD *)v8 + 39) > v9) {
              unsigned int v9 = *((_DWORD *)v8 + 39);
            }
            id v8 = (uint64_t *)*v8;
          }
          while (v8);
        }
        else
        {
          unsigned int v9 = 0;
        }
        if (v9 != v6 && (*(_DWORD *)(v3 + 40) - 1) <= 1) {
          objc_msgSend(*(id *)(*(void *)(v1 + 32) + 40), "reprioritizeKey:newPriority:batchID:", v2);
        }
        uint64_t result = LoadItem::options((LoadItem *)(v3 + 16));
        if (v7 >= 0x200 && result <= 0x1FF)
        {
          BOOL v11 = *(void **)(v1 + 32);
          return [v11 _scheduleCoalesceTimer];
        }
      }
      return result;
    }
  }
  return result;
}

- (void)cancelAllForClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_async();
}

void __36__GEOTileLoader_cancelAllForClient___block_invoke(uint64_t a1)
{
}

- (void)_cancelAllForClientOnLoadQueue:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    long long v27 = &v27;
    long long v28 = &v27;
    uint64_t v29 = 0;
    uint64_t v4 = *(void *)(a1 + 112);
    id v5 = *(void **)(v4 + 16);
    if (v5 != (void *)(v4 + 8))
    {
      do
      {
        id v6 = v3;
        unint64_t v7 = [v6 hash];
        int8x8_t v8 = (int8x8_t)v5[11];
        if (v8)
        {
          unint64_t v9 = v7;
          uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
          v10.i16[0] = vaddlv_u8(v10);
          unint64_t v11 = v10.u32[0];
          if (v10.u32[0] > 1uLL)
          {
            unint64_t v12 = v7;
            if (v7 >= *(void *)&v8) {
              unint64_t v12 = v7 % *(void *)&v8;
            }
          }
          else
          {
            unint64_t v12 = (*(void *)&v8 - 1) & v7;
          }
          uint64_t v13 = *(uint64_t ****)(v5[10] + 8 * v12);
          if (v13)
          {
            for (uint64_t i = *v13; i; uint64_t i = (uint64_t **)*i)
            {
              unint64_t v15 = (unint64_t)i[1];
              if (v9 == v15)
              {
                if ([i[2] isEqualToString:v6])
                {

                  uint64_t v16 = operator new(0x18uLL);
                  id v17 = v27;
                  v16[1] = &v27;
                  v16[2] = v5;
                  *uint64_t v16 = v17;
                  v17[1] = v16;
                  long long v27 = v16;
                  ++v29;
                  goto LABEL_20;
                }
              }
              else
              {
                if (v11 > 1)
                {
                  if (v15 >= *(void *)&v8) {
                    v15 %= *(void *)&v8;
                  }
                }
                else
                {
                  v15 &= *(void *)&v8 - 1;
                }
                if (v15 != v12) {
                  break;
                }
              }
            }
          }
        }

LABEL_20:
        id v5 = (void *)v5[1];
      }
      while (v5 != (void *)(*(void *)(a1 + 112) + 8));
      uint64_t v18 = v29;
      if (v29)
      {
        id v19 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          __int16 v31 = 2050;
          uint64_t v32 = v18;
          _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "cancelAllForClient: %@ (%{public}zu in-flight)", buf, 0x16u);
        }
      }
    }
    id v20 = v28;
    if (v28 != &v27)
    {
      char v21 = 0;
      do
      {
        *(void *)buf = v20[2];
        id v22 = (int8x8_t *)(*(void *)buf + 16);
        unint64_t v23 = LoadItem::options((LoadItem *)(*(void *)buf + 16));
        LoadItem::deleteRequester(v22, (NSString *)v3, 1, 0);
        unint64_t v24 = LoadItem::options((LoadItem *)v22);
        int v25 = -[GEOTileLoader _cancelIfNeeded:](a1, (uint64_t **)buf);
        if (v23 < 0x200) {
          int v26 = 1;
        }
        else {
          int v26 = v25;
        }
        if (!v26) {
          v21 |= v24 < 0x200;
        }
        id v20 = (void *)v20[1];
      }
      while (v20 != &v27);
      if (v21) {
        [(id)a1 _scheduleCoalesceTimer];
      }
    }
    std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v27);
  }
}

- (void)cancelAllForClientSynchronous:(id)a3
{
  id v4 = a3;
  loadQ = self->_loadQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke;
  v7[3] = &unk_1E53D81E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(loadQ, v7);
}

void __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
}

void __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke_2(uint64_t a1)
{
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3 forClient:(id)a4
{
}

- (void)endPreloadSessionForClient:(id)a3
{
}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQ:(id)a4 finished:(id)a5
{
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  return [(GEOTileServerProxy *)self->_proxy shrinkDiskCacheToSizeSync:a3];
}

- (void)calculateFreeableSizeWithCallbackQ:(id)a3 finished:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internal = self->_internal;
  unint64_t v9 = operator new(0x40uLL);
  *unint64_t v9 = 0;
  v9[1] = 0;
  id v16 = v6;
  id v10 = v7;
  unint64_t v11 = v10;
  v9[2] = &unk_1ED513770;
  void v9[3] = 0;
  if (v10) {
    uint64_t v12 = [v10 copy];
  }
  else {
    uint64_t v12 = MEMORY[0x18C120660]();
  }
  uint64_t v13 = (void *)v9[3];
  void v9[3] = v12;

  geo::_retain_ptr<NSObject  {objcproto17OS_dispatch_queue}* {__strong},geo::_retain_dispatch_arc<NSObject  {objcproto17OS_dispatch_queue}* {__strong}>,geo::_release_dispatch_arc,geo::_hash_ptr,geo::_equal_ptr>::_retain_ptr(v9 + 5, v16);
  id v14 = (void *)*((void *)internal + 8);
  uint64_t v15 = *((void *)internal + 9);
  *unint64_t v9 = (char *)internal + 56;
  v9[1] = v14;
  *id v14 = v9;
  *((void *)internal + 8) = v9;
  *((void *)internal + 9) = v15 + 1;
  [(GEOTileServerProxy *)self->_proxy calculateFreeableSize];
}

- (unint64_t)calculateFreeableSizeSync
{
  return [(GEOTileServerProxy *)self->_proxy calculateFreeableSizeSync];
}

- (void)clearCachedTilesMatchingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__GEOTileLoader_clearCachedTilesMatchingBlock___block_invoke;
  v7[3] = &unk_1E53D8468;
  id v5 = v4;
  id v8 = v5;
  id v6 = (void *)MEMORY[0x18C120660](v7);
  [*((id *)self->_internal + 4) removeTilesMatchingPredicate:v6];
  [*((id *)self->_internal + 5) removeTilesMatchingPredicate:v6];
}

uint64_t __47__GEOTileLoader_clearCachedTilesMatchingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerTileLoader:(Class)a3
{
  if (objc_opt_respondsToSelector())
  {
    proxy = self->_proxy;
    [(GEOTileServerProxy *)proxy registerProvider:a3];
  }
}

- (void)expireTilesWithPredicate:(id)a3
{
  id v4 = a3;
  GEOMachAbsoluteTimeGetCurrent();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __42__GEOTileLoader_expireTilesWithPredicate___block_invoke;
  unint64_t v11 = &unk_1E53D8490;
  uint64_t v13 = v5;
  id v6 = v4;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x18C120660](&v8);
  objc_msgSend(*((id *)self->_internal + 5), "removeTilesMatchingPredicate:", v7, v8, v9, v10, v11);
}

uint64_t __42__GEOTileLoader_expireTilesWithPredicate___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40) - a2);
}

- (void)reportCorruptTile:(char *)a3
{
  uint64_t v5 = 40;
  if (*a3 >= 0) {
    uint64_t v5 = 32;
  }
  id v6 = *(id *)(*(void *)(a1 + 112) + v5);
  [v6 removeTileForKey:a3];
  [*(id *)(a1 + 40) reportCorruptTile:a3];
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
}

uint64_t __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_230(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) reportCorruptTile:&v2];
}

uint64_t __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCoalesceTimer];
}

void __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v2 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v3 = [v2 readDataWithError:&v9];
  id v4 = v9;
  if (!v3)
  {
    uint64_t v5 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Failed to read supposedly-loaded tile from disk: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  uint64_t v5 = [*(id *)(a1 + 40) decodeTile:v3 forKey:a1 + 64];
  if (!v5)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = [[GEOTileData alloc] initWithDecodedRepresentation:v5];
LABEL_7:

  id v8 = *(id *)(a1 + 56);
  id v7 = v6;
  geo_isolate_sync();
}

uint64_t __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)proxy:(id)a3 failedToLoadTiles:(id)a4 error:(id)a5
{
  v61[24] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v52 = 0;
  unint64_t v53 = &v52;
  uint64_t v54 = 0x4812000000;
  uint64_t v55 = __Block_byref_object_copy__233;
  BOOL v56 = __Block_byref_object_dispose__234;
  uint64_t v57 = 0;
  v58[0] = (uint64_t)v58;
  v58[1] = (uint64_t)v58;
  v58[2] = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x4812000000;
  v50[3] = __Block_byref_object_copy__235;
  v50[4] = __Block_byref_object_dispose__236;
  v50[5] = 0;
  v51[0] = v51;
  v51[1] = v51;
  v51[2] = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  uint64_t v38 = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke;
  long long v39 = &unk_1E53D85A8;
  id v17 = v7;
  id v40 = v17;
  long long v41 = self;
  id v20 = self;
  id v43 = v50;
  id v44 = &v46;
  long long v45 = &v52;
  id v18 = v8;
  id v42 = v18;
  geo_isolate_sync();
  uint64_t v9 = v53[7];
  for (uint64_t i = v53 + 6; (void *)v9 != i; v9 = *(void *)(v9 + 8))
  {
    long long v60 = *(_OWORD *)(v9 + 16);
    LoadItem::Requester::Requester((LoadItem::Requester *)v61, (const LoadItem::Requester *)(v9 + 32));
    long long v59 = v60;
    LoadItem::Requester::Requester((LoadItem::Requester *)&v21, (const LoadItem::Requester *)v61);
    if (v34) {
      id v10 = (void *)MEMORY[0x18C120660](v28);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = v33;
    id v12 = v22;
    uint64_t v13 = v32;
    uint64_t v14 = v31;
    id v15 = v26;
    id v16 = (void *)MEMORY[0x18C120660](v30);
    [(GEOTileLoader *)v20 loadKey:&v59 priority:v11 forClient:v12 options:v14 reason:v13 callbackQ:v15 beginNetwork:v10 callback:v16];

    uint64_t v29 = off_1ED513730;
    long long v27 = off_1ED513750;

    int v25 = off_1ED513710;
    unint64_t v23 = off_1ED5136B0;

    char v21 = off_1ED5136F0;
    v61[12] = off_1ED513730;

    v61[9] = off_1ED513750;
    v61[6] = off_1ED513710;

    v61[3] = off_1ED5136B0;
    v61[0] = off_1ED5136F0;
  }
  if (*((unsigned char *)v47 + 24)) {
    geo_isolate_async();
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(v51);
  _Block_object_dispose(&v52, 8);
  std::__list_imp<std::pair<_GEOTileKey,LoadItem::Requester>>::clear(v58);
}

void __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v16 != v3) {
          objc_enumerationMutation(obj);
        }
        long long v27 = *(_OWORD *)*(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v5 = (void *)(*(void *)(*(void *)(a1 + 40) + 112) + 8);
        while (1)
        {
          uint64_t v5 = (void *)v5[1];
          if (v5 == (void *)(*(void *)(*(void *)(a1 + 40) + 112) + 8)) {
            break;
          }
          if ((void)v27 == v5[2] && *((void *)&v27 + 1) == v5[3]) {
            goto LABEL_15;
          }
        }
        uint64_t v5 = (void *)(*(void *)(*(void *)(a1 + 40) + 112) + 8);
LABEL_15:
        id v7 = *(void **)(*(void *)(a1 + 56) + 8);
        id v8 = operator new(0x20uLL);
        v8[1] = v27;
        uint64_t v9 = v7[6];
        v7 += 6;
        *(void *)id v8 = v9;
        *((void *)v8 + 1) = v7;
        *(void *)(v9 + 8) = v8;
        void *v7 = v8;
        ++v7[2];
        if (v5 != (void *)(*(void *)(*(void *)(a1 + 40) + 112) + 8))
        {
          uint64_t v10 = v5[6];
          unint64_t v11 = LoadItem::options((LoadItem *)(v5 + 2));
          if (v11 >= 0x200) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          }
          *((_DWORD *)v5 + 10) = 3;
          if (*((_DWORD *)v5 + 11) == 1) {
            *((_DWORD *)v5 + 11) = 3;
          }
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_2;
          v19[3] = &unk_1E53D8580;
          uint64_t v22 = v10;
          unint64_t v23 = v11;
          uint64_t v21 = *(void *)(a1 + 72);
          long long v24 = v27;
          id v20 = *(id *)(a1 + 48);
          id v26 = 0;
          v25[0] = &unk_1ED5175A8;
          v25[1] = MEMORY[0x18C120660](v19);
          id v26 = v25;
          LoadItem::foreachRequester(v5[12], (uint64_t)v25);
          std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v25);
          -[GEOTileLoader _notifyObserversOfFailure:error:options:](*(void *)(a1 + 40), &v27, *(void **)(a1 + 48), v10);
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 112);
          uint64_t v13 = *v5;
          *(void *)(v13 + 8) = v5[1];
          *(void *)v5[1] = v13;
          --*(void *)(v12 + 24);
          std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v5 + 2));
          operator delete(v5);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v2);
  }

  _appendError(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 56) + 8) + 48);
}

void __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_2(uint64_t a1, const LoadItem::Requester *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = *(void *)(a1 + 48);
  if (v4 == *(void *)(a1 + 56)) {
    goto LABEL_8;
  }
  uint64_t v5 = (v4 >> 1) & 1;
  unint64_t v6 = *((void *)a2 + 15);
  if ((v6 & 2) == 0) {
    LODWORD(v5) = 1;
  }
  uint64_t v7 = (v6 >> 3) & 1;
  if ((*(void *)(a1 + 48) & 8) == 0) {
    LOBYTE(v7) = 1;
  }
  if v5 == 1 && (v7)
  {
LABEL_8:
    id v8 = (void *)MEMORY[0x18C120660](*((void *)a2 + 13));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_3;
    block[3] = &unk_1E53D82D8;
    long long v16 = *(_OWORD *)(a1 + 64);
    id v15 = v8;
    id v14 = *(id *)(a1 + 32);
    id v9 = v8;
    LoadItem::Requester::performAsyncOnCallbackQueue((uint64_t)a2, block);
  }
  else
  {
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 8);
    unint64_t v11 = operator new(0xD8uLL);
    *unint64_t v11 = 0;
    v11[1] = 0;
    *((_OWORD *)v11 + 1) = *(_OWORD *)(a1 + 64);
    LoadItem::Requester::Requester((LoadItem::Requester *)(v11 + 4), a2);
    uint64_t v12 = v10[6];
    v10 += 6;
    *unint64_t v11 = v12;
    v11[1] = v10;
    *(void *)(v12 + 8) = v11;
    void *v10 = v11;
    ++v10[2];
  }
}

uint64_t __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(void, long long *, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), &v2, 0, 0, *(void *)(a1 + 32), 0);
}

uint64_t __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCoalesceTimer];
}

- (void)proxy:(id)a3 failedToLoadAllPendingTilesWithError:(id)a4
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a4;
  geo_isolate_sync();
  if (*((unsigned char *)v6 + 24)) {
    geo_isolate_async();
  }

  _Block_object_dispose(&v5, 8);
}

void __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 112);
  if (*(void *)(v3 + 24))
  {
    id v4 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "All pending tiles fail with error %@", buf, 0xCu);
    }

    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 112);
  }
  unint64_t v6 = *(_DWORD **)(v3 + 16);
  if (v6 != (_DWORD *)(v3 + 8))
  {
    do
    {
      *(_OWORD *)buf = *((_OWORD *)v6 + 1);
      if ((v6[10] - 1) > 1)
      {
        unint64_t v6 = (_DWORD *)*((void *)v6 + 1);
      }
      else
      {
        v6[10] = 3;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= LoadItem::options((LoadItem *)(v6 + 4)) >> 9;
        if (v6[11] == 1) {
          v6[11] = 3;
        }
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_237;
        v10[3] = &unk_1E53D8300;
        long long v12 = *(_OWORD *)buf;
        id v11 = *(id *)(a1 + 40);
        id v14 = 0;
        v13[0] = &unk_1ED5175A8;
        v13[1] = MEMORY[0x18C120660](v10);
        id v14 = v13;
        LoadItem::foreachRequester(*((void *)v6 + 12), (uint64_t)v13);
        std::__function::__value_func<void ()(LoadItem::Requester &)>::~__value_func[abi:ne180100](v13);
        -[GEOTileLoader _notifyObserversOfFailure:error:options:](*(void *)(a1 + 32), (long long *)buf, *(void **)(a1 + 40), *((void *)v6 + 6));
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 112);
        uint64_t v8 = *(void *)v6;
        id v9 = (_DWORD *)*((void *)v6 + 1);
        *(void *)(v8 + 8) = v9;
        **((void **)v6 + 1) = v8;
        --*(void *)(v7 + 24);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v6 + 4));
        operator delete(v6);

        uint64_t v2 = *(void *)(a1 + 32);
        unint64_t v6 = v9;
      }
    }
    while (v6 != (_DWORD *)(*(void *)(v2 + 112) + 8));
  }
}

void __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_237(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x18C120660](*(void *)(a2 + 104));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_2;
  block[3] = &unk_1E53D82D8;
  id v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v5 = v4;
  LoadItem::Requester::performAsyncOnCallbackQueue(a2, block);
}

uint64_t __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a1 + 48, 0, 0, *(void *)(a1 + 32), 0);
}

uint64_t __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCoalesceTimer];
}

uint64_t __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)proxyDidDeleteExternalTileData:(id)a3
{
  geo_isolate_sync();
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"GEOTileLoaderDidDeleteExternalTileDataNotification" object:self];
}

void __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 112) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke_2;
  v4[3] = &unk_1E53D8620;
  v4[4] = &v5;
  [v1 removeTilesMatchingPredicate:v4];
  if (*((unsigned char *)v6 + 24))
  {
    uint64_t v2 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Removed file-backed tiles from the in-memory cache", v3, 2u);
    }
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 fileURL], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = 1;
    *(unsigned char *)(v6 + 24) = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)proxy
{
  return self->_proxy;
}

- (void)setInternalDelegate:(id)a3
{
}

- (GEOTileLoaderInternalDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (void)setInternalDelegateQ:(id)a3
{
}

- (uint64_t)cachedTileForKey:(uint64_t)a3
{
  return [a1 cachedTileForKey:a3 auditToken:0];
}

- (id)cachedTileForKey:(uint64_t *)a3 auditToken:(void *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (+[GEOPlatform isRunningInGeod])
  {
    long long v22 = *(_OWORD *)a3;
    LOBYTE(v7) = v22;
    goto LABEL_21;
  }
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[GEOApplicationAuditToken currentProcessAuditToken];
  }
  long long v9 = v8;
  uint64_t v10 = [v8 offlineCohortId];
  unsigned __int8 v11 = +[GEOOfflineService activeStateForCohortId:v10];

  if (v11 >= 2u)
  {
    if (v11 == 2)
    {

      unsigned int v12 = *(unsigned char *)a3 & 0x7F;
      if (v12 >= 0x40)
      {
        uint64_t v13 = *a3;
        uint64_t v15 = *a3;
      }
      else
      {
        uint64_t v13 = *a3;
        BOOL v14 = v12 == 8;
        uint64_t v15 = *a3 & 0x9F | 0x40;
        if (v14) {
          uint64_t v15 = *a3;
        }
      }
      unint64_t v7 = v13 & 0xFFFFFFFFFFFFFF00 | v15;
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v11;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
    }
  }

  uint64_t v17 = -97;
  if ((*(unsigned char *)a3 & 0x60) == 0) {
    uint64_t v17 = -1;
  }
  unint64_t v7 = v17 & *a3;
LABEL_20:
  uint64_t v18 = a3[1];
  *(void *)&long long v22 = v7;
  *((void *)&v22 + 1) = v18;
LABEL_21:

  uint64_t v19 = 40;
  if ((v7 & 0x80u) == 0) {
    uint64_t v19 = 32;
  }
  id v20 = [*(id *)(*(void *)(a1 + 112) + v19) tileForKey:&v22];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersIsolater, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_internalDelegateQ, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_storeStrong((id *)&self->_tileDecodersIsolater, 0);
  objc_storeStrong((id *)&self->_tileDecoders, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_openersIsolater, 0);
  objc_storeStrong((id *)&self->_openers, 0);
  objc_storeStrong((id *)&self->_loadQ, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

- (uint64_t)initWithConfiguration:serverProxy:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)initWithConfiguration:serverProxy:
{
  id v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1ED517760;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (__n128)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
  *(void *)a2 = &unk_1ED517810;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end