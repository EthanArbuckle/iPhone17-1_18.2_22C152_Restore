@interface GEOResourceManifestManager
+ (id)modernManager;
+ (id)modernManagerForConfiguration:(id)a3;
+ (id)modernManagerForTileGroupIdentifier:(unsigned int)a3;
+ (id)modernManagerNoCreate;
+ (id)sharedManager;
+ (void)configureInProcessSingletonWithConfiguration:(id)a3;
+ (void)disableServerConnection;
+ (void)setServerProxyClass:(Class)a3;
+ (void)useLocalProxy;
+ (void)useRemoteProxy;
- (BOOL)hasActiveTileGroup;
- (BOOL)hasLoadedActiveTileGroup;
- (BOOL)hasResourceManifest;
- (BOOL)isMuninEnabled;
- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5;
- (GEOActiveTileGroup)_loadActiveTileGroupIfNecessary:(uint64_t)a1;
- (GEOActiveTileGroup)activeTileGroup;
- (GEOResourceManifestManager)init;
- (GEOResourceManifestServerProxy)serverProxy;
- (double)timeToLiveForTileKey:(uint64_t)a3;
- (id)_generateOfflineActiveTileGroup:(id)a3;
- (id)activeTileGroupForCurrentOfflineModeForAuditToken:(id)a3;
- (id)allRegionalResourceNames;
- (id)allResourceNames;
- (id)allResourcePaths;
- (id)authToken;
- (id)bestLocalizedStringForDisplayStringAtIndex:(unint64_t)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)detailedDescription;
- (id)disputedBordersQueryItemsForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5;
- (id)languageForTileKey:(uint64_t)a3;
- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4;
- (id)localizationURLStringIfNecessaryForActiveTileSet:(void *)a3 tileKey:(uint64_t)a4 overrideLocale:(void *)a5;
- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4;
- (id)pathForResourceWithName:(id)a3;
- (id)updateProgress;
- (int)mapMatchingTileSetStyle;
- (uint64_t)isAvailableForTileKey:(uint64_t)a3;
- (uint64_t)isDisputedBordersAllowlistedForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5;
- (uint64_t)requestStyleForTileKey:(uint64_t)a3;
- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3;
- (uint64_t)versionForTileKey:(uint64_t)a3;
- (unsigned)_fromgeod_maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5;
- (unsigned)activeTileGroupIdentifier;
- (unsigned)mapMatchingZoomLevel;
- (void)_buildResourceNamesToPaths;
- (void)_localeChanged:(id)a3;
- (void)_notifyObserversOfResourcesChange;
- (void)_offlineStateChanged:(id)a3;
- (void)_purgeCachedResourceInfo;
- (void)_scheduleCachedResourceInfoPurgeTimer;
- (void)activateResourceName:(id)a3;
- (void)activateResourceScale:(int)a3;
- (void)activateResourceScenario:(int)a3;
- (void)addNetworkActivityHandler:(id)a3;
- (void)addServerProxyObserver:(id)a3;
- (void)addTileGroupObserver:(id)a3 queue:(id)a4;
- (void)closeServerConnection;
- (void)closeServerConnection:(BOOL)a3;
- (void)deactivateResourceName:(id)a3;
- (void)deactivateResourceScale:(int)a3;
- (void)deactivateResourceScenario:(int)a3;
- (void)dealloc;
- (void)devResourcesFolderDidChange;
- (void)fakeTileGroupChange;
- (void)getResourceManifestWithHandler:(id)a3;
- (void)initWithConfiguration:(void *)a1;
- (void)openServerConnection;
- (void)removeDevResources;
- (void)removeServerProxyObserver:(id)a3;
- (void)removeTileGroupObserver:(id)a3;
- (void)resetActiveTileGroup;
- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5;
- (void)serverProxy:(id)a3 didLoadActiveTileGroup:(id)a4;
- (void)serverProxyNeedsWiFiResourceActivity:(id)a3;
- (void)setActiveTileGroupIdentifier:(unsigned int)a3;
- (void)setActiveTileGroupIdentifier:(unsigned int)a3 updateType:(int64_t)a4 completionHandler:(id)a5;
- (void)setConstantlyChangeTileGroup:(BOOL)a3;
- (void)setConstantlyChangeTileGroupInterval:(double)a3;
- (void)setManifestToken:(id)a3 completionHandler:(id)a4;
- (void)updateManifest:(id)a3;
- (void)updateManifest:(int64_t)a3 completionHandler:(id)a4;
- (void)updateManifestIfNecessary:(id)a3;
@end

@implementation GEOResourceManifestManager

- (BOOL)isMuninEnabled
{
  if (qword_1EB29FB48 != -1) {
    dispatch_once(&qword_1EB29FB48, &__block_literal_global_153);
  }
  if (!byte_1EB29FAD1) {
    return 0;
  }
  v3 = [(GEOResourceManifestManager *)self activeTileGroup];
  char v4 = [v3 isMuninEnabled];

  return v4;
}

void __56__GEOResourceManifestManager__buildResourceNamesToPaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initFileURLWithPath:v6 isDirectory:0 relativeToURL:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_3(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v4 = [v3 fileExistsAtPath:*(void *)(a1 + 32)];

    int v5 = v4 ^ 1;
    if (((v4 ^ 1) & 1) != 0 || _devResourcesStream)
    {
      if (!_devResourcesStream) {
        int v5 = 0;
      }
      if (v5 == 1)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        _stopObservingFolder();
      }
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = *(id *)(a1 + 32);
      id v8 = v7;
      if (!_devResourcesStream)
      {
        v17[0] = v7;
        v9 = (void *)MEMORY[0x1E4F1C978];
        id v10 = v6;
        CFArrayRef v11 = [v9 arrayWithObjects:v17 count:1];
        context.version = 0;
        v12 = (void *)[v10 copy];

        context.info = v12;
        context.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
        context.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
        context.copyDescription = (CFAllocatorCopyDescriptionCallBack)MEMORY[0x1E4F1C220];

        FSEventStreamRef v13 = FSEventStreamCreate(0, (FSEventStreamCallback)_eventStreamCallback, &context, v11, 0xFFFFFFFFFFFFFFFFLL, 0.0, 0x10u);
        _devResourcesStream = (uint64_t)v13;
        if (v13)
        {
          v14 = v13;
          global_workloop = geo_get_global_workloop();
          FSEventStreamSetDispatchQueue(v14, global_workloop);

          if (!FSEventStreamStart((FSEventStreamRef)_devResourcesStream))
          {
            FSEventStreamRelease((FSEventStreamRef)_devResourcesStream);
            _devResourcesStream = 0;
          }
        }
      }
    }
  }
}

- (id)pathForResourceWithName:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  resourceNamesToPaths = self->_resourceNamesToPaths;
  if (!resourceNamesToPaths)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    resourceNamesToPaths = self->_resourceNamesToPaths;
  }
  id v6 = [(NSDictionary *)resourceNamesToPaths objectForKey:v4];
  id v7 = [v6 path];

  os_unfair_lock_unlock(&self->_resourceNamesToPathsLock);
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = GEORegionalResourcesDirectory(self->_configuration);
    id v10 = [v9 stringByAppendingPathComponent:v4];

    CFArrayRef v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v12 = [v11 fileExistsAtPath:v10];

    if (v12) {
      id v8 = v10;
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

uint64_t __46__GEOResourceManifestManager_allResourcePaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 path];
}

- (id)activeTileGroupForCurrentOfflineModeForAuditToken:(id)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[GEOApplicationAuditToken currentProcessAuditToken];
  }
  id v7 = v6;
  id v8 = [v6 offlineCohortId];
  unsigned __int8 v9 = +[GEOOfflineService activeStateForCohortId:v8];

  if (v9 < 2u)
  {
LABEL_14:
    id v10 = [(GEOResourceManifestManager *)self activeTileGroup];
    goto LABEL_15;
  }
  if (v9 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v9;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)location, 8u);
    }
    goto LABEL_14;
  }
  os_unfair_lock_lock_with_options();
  id v10 = self->_offlineActiveTileGroup;
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  if (!v10)
  {
    CFArrayRef v11 = [v5 offlineCohortId];
    v12.var0 = +[GEOOfflineService activeStateForCohortId:v11];

    id v10 = [(GEOResourceManifestManager *)self _generateOfflineActiveTileGroup:v12.var0];
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_offlineActiveTileGroup, v10);
    if (self->_offlineDataVersionChangeNotifyToken == -1)
    {
      objc_initWeak(location, self);
      FSEventStreamRef v13 = GEOOfflineDataActiveVersionsDidChangeDarwinNotification;
      global_queue = geo_get_global_queue();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __80__GEOResourceManifestManager_activeTileGroupForCurrentOfflineModeForAuditToken___block_invoke;
      v20 = &unk_1E53E2BA8;
      objc_copyWeak(&v22, location);
      v21 = self;
      notify_register_dispatch(v13, &self->_offlineDataVersionChangeNotifyToken, global_queue, &v17);

      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(&self->_activeTileGroupLock);
    if (!v10) {
      goto LABEL_14;
    }
  }
LABEL_15:

  return v10;
}

- (GEOActiveTileGroup)_loadActiveTileGroupIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    int v5 = (GEOActiveTileGroup *)*(id *)(a1 + 24);
    id v6 = v5;
    if (*(unsigned char *)(a1 + 72)) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v6 = [*(id *)(a1 + 8) activeTileGroup];
      id v8 = GEOActiveTileGroupPath(*(void **)(a1 + 160));
      unsigned __int8 v9 = v8;
      if (!v6)
      {
        if ([v8 length])
        {
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:1 error:0];
          if (v10) {
            id v6 = [[GEOActiveTileGroup alloc] initWithData:v10];
          }
          else {
            id v6 = 0;
          }
        }
        else
        {
          id v6 = 0;
        }
      }
      if (a2)
      {
        objc_storeStrong((id *)(a1 + 24), v6);
        *(unsigned char *)(a1 + 72) = 0;
      }
    }
    os_unfair_lock_unlock(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOActiveTileGroup)activeTileGroup
{
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);

  return -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:]((uint64_t)self, 1);
}

- (void)_scheduleCachedResourceInfoPurgeTimer
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void *)(a1 + 104);
    os_unfair_lock_unlock(v2);
    if (v3 >= 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
      id v4 = *(NSObject **)(a1 + 168);
      if (v4)
      {
        dispatch_source_cancel(v4);
        int v5 = *(void **)(a1 + 168);
        *(void *)(a1 + 168) = 0;
      }
      id v6 = (id)geo_dispatch_timer_create_on_qos();
      BOOL v7 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v6;

      if (*(void *)(a1 + 168)) {
        dispatch_activate(v6);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    }
  }
}

+ (id)modernManagerForConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && ![v4 isDefaultConfiguration])
  {
    if (qword_1EB29FB08 != -1) {
      dispatch_once(&qword_1EB29FB08, &__block_literal_global_32);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB29FAD8);
    id v6 = [(id)qword_1EB29FB00 objectForKey:v5];
    if (!v6)
    {
      id v6 = -[GEOResourceManifestManager initWithConfiguration:]((void **)[GEOResourceManifestManager alloc], v5);
      [(id)qword_1EB29FB00 setObject:v6 forKey:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB29FAD8);
  }
  else
  {
    id v6 = [a1 modernManager];
  }

  return v6;
}

+ (id)modernManager
{
  if (qword_1EB29FAF0 != -1) {
    dispatch_once(&qword_1EB29FAF0, &__block_literal_global_29);
  }
  v2 = (void *)qword_1EB29FAF8;

  return v2;
}

- (id)languageForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  int v5 = [v4 languageForTileKey:a3];

  return v5;
}

- (void)_buildResourceNamesToPaths
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      *(void *)(a1 + 48) = 0;
    }
    uint64_t v3 = *(void **)(v1 + 56);
    if (v3)
    {
      *(void *)(v1 + 56) = 0;
    }
    id v4 = *(void **)(v1 + 64);
    if (v4)
    {
      *(void *)(v1 + 64) = 0;
    }
    int v5 = GEOResourcesPath(*(void **)(v1 + 160));
    if ([v5 length])
    {
      id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
      BOOL v7 = -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:](v1, 0);
      id v8 = (void *)MEMORY[0x1E4F1CAD0];
      unsigned __int8 v9 = [v7 resourceCanonicalNameToFileName];
      id v10 = [v9 allKeys];
      CFArrayRef v11 = [v8 setWithArray:v10];

      $BD055F43A5DF7FBAA8066526AB28D3ED v12 = (void *)MEMORY[0x1E4F1CAD0];
      FSEventStreamRef v13 = [v7 regionalResourceCanonicalNameToFileName];
      v14 = [v13 allValues];
      v51 = [v12 setWithArray:v14];

      v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      v16 = +[GEOFilePaths pathFor:12];
      uint64_t v17 = [v15 contentsOfDirectoryAtPath:v16 error:0];

      uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      v19 = [v7 resourceCanonicalNameToFileName];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __56__GEOResourceManifestManager__buildResourceNamesToPaths__block_invoke;
      v63[3] = &unk_1E53E2BD0;
      id v50 = v6;
      id v64 = v50;
      id v57 = v18;
      id v65 = v57;
      [v19 enumerateKeysAndObjectsUsingBlock:v63];

      if ([v17 count])
      {
        v48 = v5;
        uint64_t v49 = v1;
        v47 = v11;
        v20 = (void *)[v11 mutableCopy];
        v21 = [v7 regionalResourceCanonicalNameToFileName];
        id v22 = [v21 allKeys];
        v56 = v20;
        [v20 addObjectsFromArray:v22];

        v23 = (void *)MEMORY[0x1E4F1CB10];
        v24 = +[GEOFilePaths pathFor:12];
        v55 = [v23 fileURLWithPath:v24 isDirectory:1];

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id obj = v17;
        v25 = v17;
        v26 = v57;
        uint64_t v58 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
        if (!v58) {
          goto LABEL_23;
        }
        unint64_t v27 = 0x1E4F1C000uLL;
        uint64_t v54 = *(void *)v60;
        v52 = v17;
        while (1)
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v60 != v54) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(*((void *)&v59 + 1) + 8 * v28);
            v30 = (void *)[objc_alloc(*(Class *)(v27 + 2832)) initFileURLWithPath:v29 isDirectory:0 relativeToURL:v55];
            v31 = [v29 stringByDeletingPathExtension];
            v32 = [v31 pathExtension];
            if ([v32 length]) {
              [v26 setObject:v30 forKeyedSubscript:v31];
            }
            [v26 setObject:v30 forKeyedSubscript:v29];
            [v56 addObject:v29];
            v33 = [v7 resourceCanonicalNameToFileName];
            uint64_t v34 = [v33 objectForKeyedSubscript:v29];
            if (v34)
            {
              v35 = (void *)v34;

              v26 = v57;
            }
            else
            {
              [v7 regionalResourceCanonicalNameToFileName];
              unint64_t v36 = v27;
              v38 = v37 = v7;
              v35 = [v38 objectForKeyedSubscript:v29];

              BOOL v7 = v37;
              unint64_t v27 = v36;
              v25 = v52;

              v26 = v57;
              if (!v35) {
                goto LABEL_21;
              }
            }
            [v26 setObject:v30 forKeyedSubscript:v35];

LABEL_21:
            ++v28;
          }
          while (v58 != v28);
          uint64_t v58 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
          if (!v58)
          {
LABEL_23:

            v39 = (void *)[v56 copy];
            int v5 = v48;
            uint64_t v1 = v49;
            goto LABEL_25;
          }
        }
      }
      v39 = v11;
      v25 = v17;
      v26 = v57;
LABEL_25:
      uint64_t v40 = [v26 copy];
      v41 = *(void **)(v1 + 48);
      *(void *)(v1 + 48) = v40;

      v42 = *(void **)(v1 + 56);
      *(void *)(v1 + 56) = v39;
      id v43 = v39;

      v44 = v26;
      v45 = *(void **)(v1 + 64);
      *(void *)(v1 + 64) = v51;
      id v46 = v51;
    }
  }
}

- (GEOResourceManifestServerProxy)serverProxy
{
  return self->_serverProxy;
}

- (id)authToken
{
  return (id)[(GEOResourceManifestServerProxy *)self->_serverProxy authToken];
}

- (BOOL)hasLoadedActiveTileGroup
{
  v2 = self;
  p_activeTileGroupLock = &self->_activeTileGroupLock;
  os_unfair_lock_lock(&self->_activeTileGroupLock);
  LOBYTE(v2) = v2->_activeTileGroup != 0;
  os_unfair_lock_unlock(p_activeTileGroupLock);
  return (char)v2;
}

+ (id)modernManagerNoCreate
{
  os_unfair_lock_lock(&stru_1EB29FAD4);
  id v2 = (id)qword_1EB29FAF8;
  os_unfair_lock_unlock(&stru_1EB29FAD4);

  return v2;
}

- (BOOL)hasActiveTileGroup
{
  id v2 = [(GEOResourceManifestManager *)self activeTileGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

void __43__GEOResourceManifestManager_modernManager__block_invoke()
{
  os_unfair_lock_lock(&stru_1EB29FAD4);
  v0 = [GEOResourceManifestManager alloc];
  uint64_t v1 = -[GEOResourceManifestManager initWithConfiguration:]((void **)&v0->super.isa, unk_1EB29FAE0);
  id v2 = (void *)qword_1EB29FAF8;
  qword_1EB29FAF8 = (uint64_t)v1;

  os_unfair_lock_unlock(&stru_1EB29FAD4);
}

- (void)addTileGroupObserver:(id)a3 queue:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  tileGroupObservers = self->_tileGroupObservers;
  if (!tileGroupObservers)
  {
    unsigned __int8 v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = self->_tileGroupObservers;
    self->_tileGroupObservers = v9;

    tileGroupObservers = self->_tileGroupObservers;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  CFArrayRef v11 = tileGroupObservers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
        if (v16) {
          id v17 = (id)v16[3];
        }
        else {
          id v17 = 0;
        }
        if (v17 == v7)
        {
          v19 = v16;

          if (v16) {
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v13 = v18;
      if (v18) {
        continue;
      }
      break;
    }
  }

LABEL_17:
  v20 = objc_alloc_init(_GEOResourceManifestTileGroupObserverProxy);
  v19 = v20;
  if (v20) {
    objc_storeStrong((id *)&v20->_queue, a4);
  }
  -[NSMutableArray addObject:](self->_tileGroupObservers, "addObject:", v19, (void)v21);
LABEL_20:
  -[_GEOResourceManifestTileGroupObserverProxy registerObserver:](v19, "registerObserver:", v6, (void)v21);
  os_unfair_recursive_lock_unlock();
}

- (void)initWithConfiguration:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)GEOResourceManifestManager;
    int v5 = (void **)objc_msgSendSuper2(&v21, sel_init);
    a1 = v5;
    if (v5)
    {
      id v6 = v5 + 20;
      objc_storeStrong(v5 + 20, a2);
      if (!a1[20])
      {
        id v7 = objc_alloc_init(GEOResourceManifestConfiguration);
        id v8 = *v6;
        *id v6 = v7;
      }
      unsigned __int8 v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:a1 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];

      *((_DWORD *)a1 + 11) = 0;
      *((_DWORD *)a1 + 38) = 0;
      a1[11] = 0;
      uint64_t v10 = geo_isolater_create();
      CFArrayRef v11 = a1[18];
      a1[18] = (void *)v10;

      *((unsigned char *)a1 + 72) = 1;
      a1[13] = (void *)1;
      *((_DWORD *)a1 + 24) = 0;
      uint64_t v12 = objc_alloc_init(GEOLocalizationRegionsInfo);
      uint64_t v13 = a1[16];
      a1[16] = v12;

      if ((_MergedGlobals_236 & 1) == 0)
      {
        if (qword_1EB29FAE8)
        {
          id v14 = (id)qword_1EB29FAE8;
        }
        else
        {
          objc_opt_class();
          id v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v15 = [objc_alloc((Class)v14) initWithDelegate:a1 configuration:v4];
        v16 = a1[1];
        a1[1] = (void *)v15;
      }
      v20 = a1;
      geo_dispatch_async_qos();
      id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v20 selector:sel__offlineStateChanged_ name:@"GEOOfflineStateChangedNotification" object:0];

      *((_DWORD *)v20 + 10) = -1;
      global_queue = (void *)geo_get_global_queue();
      GEORegisterPListStateCaptureLegacy();

      a1 = v20;
    }
  }

  return a1;
}

uint64_t __44__GEOResourceManifestManager_isMuninEnabled__block_invoke()
{
  uint64_t result = GEOConfigGetBOOL(MapsFeaturesConfig_IsMuninEnabled, (uint64_t)off_1E9111BE8);
  byte_1EB29FAD1 = result;
  return result;
}

- (id)allResourceNames
{
  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  allResourceNames = self->_allResourceNames;
  if (!allResourceNames)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    allResourceNames = self->_allResourceNames;
  }
  int v5 = allResourceNames;
  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);

  return v5;
}

- (void)updateManifest:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)activateResourceScale:(int)a3
{
}

void __52__GEOResourceManifestManager_initWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    BOOL v2 = qword_1EB29FB50 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    BOOL v3 = +[GEOFilePaths pathFor:12];
    id v4 = [v3 stringByDeletingLastPathComponent];
    objc_initWeak(&location, v1);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke;
    v28[3] = &unk_1E53D7B90;
    objc_copyWeak(&v29, &location);
    int v5 = (void *)MEMORY[0x18C120660](v28);
    global_queue = geo_get_global_queue();
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
    id v8 = (void *)qword_1EB29FB58;
    qword_1EB29FB58 = (uint64_t)v7;

    dispatch_source_set_timer((dispatch_source_t)qword_1EB29FB58, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    unsigned __int8 v9 = qword_1EB29FB58;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_2;
    handler[3] = &unk_1E53D7B90;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_activate((dispatch_object_t)qword_1EB29FB58);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_3;
    v22[3] = &unk_1E53E2C98;
    objc_copyWeak(&v25, &location);
    id v10 = v3;
    id v23 = v10;
    id v11 = v5;
    id v24 = v11;
    id v12 = v4;
    uint64_t v13 = v22;
    if (!qword_1EB29FB50)
    {
      v31[0] = 0;
      id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v15 = [v14 fileExistsAtPath:v12 isDirectory:v31];

      if (v15)
      {
        unsigned int v16 = open((const char *)[v12 fileSystemRepresentation], 0x8000);
        _devResourceParentFD = v16;
        if ((v16 & 0x80000000) == 0)
        {
          int v21 = v31[0];
          global_workloop = geo_get_global_workloop();
          if (v21) {
            uintptr_t v18 = 107;
          }
          else {
            uintptr_t v18 = 111;
          }
          dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F144A8], v16, v18, global_workloop);
          v20 = (void *)qword_1EB29FB50;
          qword_1EB29FB50 = (uint64_t)v19;

          if (qword_1EB29FB50)
          {
            dispatch_source_set_event_handler((dispatch_source_t)qword_1EB29FB50, v13);
            dispatch_resume((dispatch_object_t)qword_1EB29FB50);
          }
          else
          {
            close(_devResourceParentFD);
            _devResourceParentFD = -1;
          }
        }
      }
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (void)openServerConnection
{
  p_closedCountLock = &self->_closedCountLock;
  os_unfair_lock_lock_with_options();
  int64_t v4 = self->_closedCount - 1;
  self->_closedCount = v4;
  os_unfair_lock_unlock(p_closedCountLock);
  if (!v4)
  {
    os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
    cachedResourceInfoPurgeTimer = self->_cachedResourceInfoPurgeTimer;
    if (cachedResourceInfoPurgeTimer)
    {
      dispatch_source_cancel(cachedResourceInfoPurgeTimer);
      id v6 = self->_cachedResourceInfoPurgeTimer;
      self->_cachedResourceInfoPurgeTimer = 0;
    }
    os_unfair_lock_unlock(&self->_resourceNamesToPathsLock);
    [(GEOResourceManifestServerProxy *)self->_serverProxy openConnection];
    if (self->_needsToLoadTileGroupFromDisk) {
      id v7 = -[GEOResourceManifestManager _loadActiveTileGroupIfNecessary:]((uint64_t)self, 1);
    }
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(GEOResourceManifestManager *)self hasResourceManifest]) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  [v4 setObject:v5 forKeyedSubscript:@"Has Resource Manifest"];
  os_unfair_lock_lock_with_options();
  id v6 = [(GEOActiveTileGroup *)self->_activeTileGroup uniqueIdentifier];
  id v7 = [(GEOActiveTileGroup *)self->_activeTileGroup environment];
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  uint64_t v8 = [(GEOResourceManifestConfiguration *)self->_configuration environment];
  unsigned __int8 v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<null>";
  }
  [v4 setObject:v10 forKeyedSubscript:@"Configured Environment"];

  id v11 = @"prod";
  if (v6)
  {
    id v12 = v6;
  }
  else
  {
    id v11 = @"<null>";
    id v12 = @"<null>";
  }
  if (v7) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = v11;
  }
  [v4 setObject:v13 forKeyedSubscript:@"Tile Group Environment"];
  [v4 setObject:v12 forKeyedSubscript:@"Tile Group ID"];
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v15 = GEOResourcesPath(self->_configuration);
  int v16 = [v14 fileExistsAtPath:v15];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    uintptr_t v18 = GEOResourcesPath(self->_configuration);
    id v31 = 0;
    dispatch_source_t v19 = [v17 contentsOfDirectoryAtPath:v18 error:&v31];
    id v20 = v31;

    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v20;
        _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error fetching directory contents for GEOResourcesPath for State Capture: %@", buf, 0xCu);
      }
    }
    else
    {
      [v4 setObject:v19 forKey:@"Downloaded Resources"];
    }
  }
  int v21 = GEORegionalResourcesDirectory(self->_configuration);
  long long v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v23 = [v22 fileExistsAtPath:v21];

  if (v23)
  {
    id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = 0;
    id v25 = [v24 contentsOfDirectoryAtPath:v21 error:&v30];
    id v26 = v30;

    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v26;
        _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error fetching directory contents for GEORegionalResourcesDirectory for State Capture: %@", buf, 0xCu);
      }
    }
    else
    {
      [v4 setObject:v25 forKey:@"Downloaded Regional Resources"];
    }
  }
  id v27 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  uint64_t v28 = [v27 dictionaryForAuthTokenState];
  [v4 setObject:v28 forKey:@"Auth Token State"];

  return v4;
}

- (BOOL)hasResourceManifest
{
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = GEOResourceManifestPath(self->_configuration);
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)allRegionalResourceNames
{
  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  allRegionalResourceNames = self->_allRegionalResourceNames;
  if (!allRegionalResourceNames)
  {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
    allRegionalResourceNames = self->_allRegionalResourceNames;
  }
  char v5 = (void *)[(NSSet *)allRegionalResourceNames mutableCopy];
  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = GEORegionalResourcesDirectory(self->_configuration);
  uint64_t v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];

  unsigned __int8 v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [v5 intersectSet:v9];

  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);

  return v5;
}

- (void)closeServerConnection:(BOOL)a3
{
  BOOL v3 = a3;
  p_closedCountLock = &self->_closedCountLock;
  os_unfair_lock_lock_with_options();
  int64_t closedCount = self->_closedCount;
  self->_int64_t closedCount = closedCount + 1;
  os_unfair_lock_unlock(p_closedCountLock);
  if (!closedCount)
  {
    [(GEOResourceManifestServerProxy *)self->_serverProxy closeConnection];
    if (v3)
    {
      -[GEOResourceManifestManager _purgeCachedResourceInfo]((uint64_t)self);
    }
    else
    {
      -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
    }
  }
}

void __56__GEOResourceManifestManager_addNetworkActivityHandler___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = v3;

    BOOL v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  id v6 = (id)MEMORY[0x18C120660](*(void *)(a1 + 40));
  [v2 addObject:v6];
}

- (void)addNetworkActivityHandler:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    id v3 = v4;
    geo_isolate_sync_data();
  }
}

- (id)allResourcePaths
{
  p_resourceNamesToPathsLock = &self->_resourceNamesToPathsLock;
  os_unfair_lock_lock(&self->_resourceNamesToPathsLock);
  if (!self->_allResourceNames) {
    -[GEOResourceManifestManager _buildResourceNamesToPaths]((uint64_t)self);
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  char v5 = [(NSDictionary *)self->_resourceNamesToPaths allValues];
  id v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_resourceNamesToPathsLock);
  id v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v7, "_geo_map:", &__block_literal_global_135);

  -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer]((uint64_t)self);
  unsigned __int8 v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

  return v9;
}

+ (void)disableServerConnection
{
  _MergedGlobals_236 = 1;
}

+ (void)setServerProxyClass:(Class)a3
{
  qword_1EB29FAE8 = (uint64_t)a3;
}

+ (void)useRemoteProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 setServerProxyClass:v3];
}

+ (void)useLocalProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 setServerProxyClass:v3];
}

+ (void)configureInProcessSingletonWithConfiguration:(id)a3
{
  objc_storeStrong(&qword_1EB29FAE0, a3);
  id v5 = a3;
  uint64_t v6 = objc_opt_class();

  [a1 setServerProxyClass:v6];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_84);
  }

  return +[GEOResourceManifestManager modernManager];
}

void __43__GEOResourceManifestManager_sharedManager__block_invoke()
{
  id v0 = +[GEOResourceManifestManager modernManager];
  [v0 openServerConnection];
}

+ (id)modernManagerForTileGroupIdentifier:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a3;
    id v5 = objc_alloc_init(GEOResourceManifestConfiguration);
    [(GEOResourceManifestConfiguration *)v5 setTileGroupIdentifier:v4];
    uint64_t v6 = [a1 modernManagerForConfiguration:v5];
  }
  else
  {
    uint64_t v6 = [a1 modernManager];
  }

  return v6;
}

void __60__GEOResourceManifestManager_modernManagerForConfiguration___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = (void *)qword_1EB29FB00;
  qword_1EB29FB00 = v0;
}

- (GEOResourceManifestManager)init
{
  return (GEOResourceManifestManager *)-[GEOResourceManifestManager initWithConfiguration:]((void **)&self->super.isa, 0);
}

- (void)dealloc
{
  if (self)
  {
    dispatch_source_set_timer((dispatch_source_t)qword_1EB29FB58, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1EB29FB58, &__block_literal_global_171);
    uint64_t v3 = (void *)qword_1EB29FB58;
    qword_1EB29FB58 = 0;

    if (qword_1EB29FB50)
    {
      dispatch_source_cancel((dispatch_source_t)qword_1EB29FB50);
      uint64_t v4 = (void *)qword_1EB29FB50;
      qword_1EB29FB50 = 0;
    }
    if ((_devResourceParentFD & 0x80000000) == 0)
    {
      close(_devResourceParentFD);
      _devResourceParentFD = -1;
    }
    _stopObservingFolder();
  }
  GEOUnregisterStateCaptureLegacy();
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  int offlineDataVersionChangeNotifyToken = self->_offlineDataVersionChangeNotifyToken;
  if (offlineDataVersionChangeNotifyToken != -1) {
    notify_cancel(offlineDataVersionChangeNotifyToken);
  }
  [(GEOResourceManifestServerProxy *)self->_serverProxy setDelegate:0];
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestManager;
  [(GEOResourceManifestManager *)&v7 dealloc];
}

- (id)_generateOfflineActiveTileGroup:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = +[GEOOfflineDataAccess sharedInstance];
  id v37 = 0;
  uint64_t v6 = [v5 offlineTileMetadataWithState:a3.var0 error:&v37];
  id v7 = v37;

  if (v6)
  {
    uint64_t v28 = self;
    id v29 = v7;
    id v31 = objc_alloc_init(GEOActiveTileGroup);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v6[1];
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (!v8) {
      goto LABEL_23;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * v11);
        uint64_t v13 = objc_alloc_init(GEOActiveTileSet);
        id v14 = v13;
        if (!v12)
        {
          [(GEOActiveTileSet *)v13 setStyle:0];
LABEL_12:
          uint64_t v16 = 0;
          goto LABEL_14;
        }
        if ((*(unsigned char *)(v12 + 40) & 2) != 0) {
          uint64_t v15 = *(unsigned int *)(v12 + 36);
        }
        else {
          uint64_t v15 = 0;
        }
        -[GEOActiveTileSet setStyle:](v13, "setStyle:", v15, v28);
        if ((*(unsigned char *)(v12 + 40) & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v16 = *(unsigned int *)(v12 + 32);
LABEL_14:
        -[GEOActiveTileSet setSize:](v14, "setSize:", v16, v28);
        [(GEOActiveTileSet *)v14 setScale:0];
        unint64_t v17 = 0;
        if (v12)
        {
LABEL_15:
          unint64_t v18 = *(void *)(v12 + 16);
          goto LABEL_16;
        }
        while (1)
        {
          unint64_t v18 = 0;
LABEL_16:
          if (v17 >= v18) {
            break;
          }
          int v19 = -[GEOPBTileStyleZoomAvailability zoomAtIndex:](v12, v17);
          v32[0] = 1 << v19;
          v32[1] = 1 << v19;
          v32[2] = v19;
          v32[3] = 0;
          v32[4] = 0;
          v32[5] = v19;
          [(GEOActiveTileSet *)v14 addAvailableTiles:v32];
          ++v17;
          if (v12) {
            goto LABEL_15;
          }
        }
        [(GEOActiveTileGroup *)v31 addTileSet:v14];

        ++v11;
      }
      while (v11 != v9);
      uint64_t v20 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      uint64_t v9 = v20;
      if (!v20)
      {
LABEL_23:

        int v21 = [(GEOResourceManifestManager *)v28 activeTileGroup];
        long long v22 = [v21 activeResources];
        int v23 = (void *)[v22 mutableCopy];
        [(GEOActiveTileGroup *)v31 setActiveResources:v23];

        id v24 = [v21 regionalResources];
        id v25 = (void *)[v24 mutableCopy];
        [(GEOActiveTileGroup *)v31 setRegionalResources:v25];

        id v26 = [v21 urlInfoSet];
        [(GEOActiveTileGroup *)v31 setUrlInfoSet:v26];

        id v7 = v29;
        goto LABEL_25;
      }
    }
  }
  id v31 = 0;
LABEL_25:

  return v31;
}

void __80__GEOResourceManifestManager_activeTileGroupForCurrentOfflineModeForAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;

    os_unfair_lock_unlock(WeakRetained + 11);
    id v5 = +[GEOApplicationAuditToken currentProcessAuditToken];
    uint64_t v6 = [v5 offlineCohortId];
    unsigned int v7 = +[GEOOfflineService activeStateForCohortId:v6];
    if (v7 < 2)
    {
LABEL_10:

      goto LABEL_11;
    }
    if (v7 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v10[0] = 67109120;
        v10[1] = v7;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v10, 8u);
      }
      goto LABEL_10;
    }

    uint64_t v8 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Offline tile config changed. Posting tile group change notifications", (uint8_t *)v10, 2u);
    }

    -[GEOResourceManifestManager _notifyObserversOfResourcesChange](*(void *)(a1 + 32));
  }
LABEL_11:
}

- (void)_notifyObserversOfResourcesChange
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v2 = (os_unfair_lock_s *)(a1 + 152);
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    uint64_t v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    os_unfair_lock_unlock(v2);
    os_unfair_recursive_lock_lock_with_options();
    id v5 = (void *)[*(id *)(a1 + 80) copy];
    os_unfair_recursive_lock_unlock();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke;
          v34[3] = &unk_1E53E2C70;
          v34[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v11, v34, 0);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v8);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_2;
          v29[3] = &unk_1E53E2C70;
          v29[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v17, v29, 0);
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v14);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * v22);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_3;
          v24[3] = &unk_1E53E2C70;
          v24[4] = a1;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v23, v24, 0);
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v20);
    }
  }
}

- (void)closeServerConnection
{
}

- (void)_purgeCachedResourceInfo
{
  if (a1)
  {
    BOOL v2 = (void *)MEMORY[0x18C1203C0]();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    uint64_t v3 = *(NSObject **)(a1 + 168);
    if (v3)
    {
      dispatch_source_cancel(v3);
      uint64_t v4 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = 0;
    }
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v6 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    uint64_t v7 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    os_unfair_lock_lock_with_options();
    uint64_t v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v9 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    *(unsigned char *)(a1 + 72) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  }
}

- (void)_localeChanged:(id)a3
{
  id v3 = [(GEOResourceManifestManager *)self activeTileGroup];
  [v3 _resetBestLanguages];
}

- (void)addServerProxyObserver:(id)a3
{
  id v4 = a3;
  serverProxyObservers = self->_serverProxyObservers;
  id v8 = v4;
  if (!serverProxyObservers)
  {
    id v6 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED7AB880 queue:0];
    uint64_t v7 = self->_serverProxyObservers;
    self->_serverProxyObservers = v6;

    id v4 = v8;
    serverProxyObservers = self->_serverProxyObservers;
  }
  [(GEOObserverHashTable *)serverProxyObservers registerObserver:v4];
}

- (void)removeServerProxyObserver:(id)a3
{
}

- (void)removeTileGroupObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = (void *)[(NSMutableArray *)self->_tileGroupObservers copy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = v4;
        uint64_t v13 = v12;
        if (v11)
        {
          uint64_t v14 = (void *)MEMORY[0x18C1203C0]();
          os_unfair_lock_lock_with_options();
          [*(id *)(v11 + 8) removeObject:v13];
          os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 16));

          os_unfair_lock_lock_with_options();
          uint64_t v15 = [*(id *)(v11 + 8) count];
          os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 16));
          if (v15) {
            goto LABEL_9;
          }
        }
        else
        {
        }
        [(NSMutableArray *)self->_tileGroupObservers removeObject:v11];
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v16;
    }
    while (v16);
  }

  os_unfair_recursive_lock_unlock();
}

- (int)mapMatchingTileSetStyle
{
  return 53;
}

- (unsigned)mapMatchingZoomLevel
{
  id v3 = [(GEOResourceManifestManager *)self activeTileGroup];
  id v4 = objc_msgSend(v3, "activeTileSetForTileType:scale:", -[GEOResourceManifestManager mapMatchingTileSetStyle](self, "mapMatchingTileSetStyle"), 0);
  unsigned int v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (id)localizationURLStringIfNecessaryForActiveTileSet:(void *)a3 tileKey:(uint64_t)a4 overrideLocale:(void *)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 localizationURL];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = [v8 bestLanguageWithOverrideLocale:v9];
    if (v12
      && (([v8 baseURL],
           uint64_t v13 = objc_claimAutoreleasedReturnValue(),
           uint64_t v14 = [v13 length],
           v13,
           !v14)
       || [*(id *)(a1 + 128) needsLocalizationForKey:a4 language:v12]))
    {
      uint64_t v15 = [v8 localizationURL];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (uint64_t)versionForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  uint64_t v5 = [v4 versionForTileKey:a3];

  return v5;
}

- (uint64_t)requestStyleForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  uint64_t v5 = [v4 requestStyleForTileKey:a3];

  return v5;
}

- (double)timeToLiveForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  [v4 timeToLiveForTileKey:a3];
  double v6 = v5;

  return v6;
}

- (uint64_t)isAvailableForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  uint64_t v5 = [v4 isAvailableForTileKey:a3];

  return v5;
}

- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 activeTileGroup];
  id v8 = [v7 languageForTileKey:a3 overrideLocale:v6];

  return v8;
}

- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3
{
  id v4 = [a1 activeTileGroup];
  uint64_t v5 = [v4 useProxyAuthForTileKey:a3];

  return v5;
}

- (uint64_t)isDisputedBordersAllowlistedForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a1 activeTileGroup];
  uint64_t v11 = [v10 activeTileSetForKey:a3];
  uint64_t v12 = [v11 isDisputedBordersAllowlistedForCountry:v9 region:v8];

  return v12;
}

- (id)disputedBordersQueryItemsForTileKey:(uint64_t)a3 country:(void *)a4 region:(void *)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a1 activeTileGroup];
  uint64_t v11 = [v10 activeTileSetForKey:a3];
  uint64_t v12 = [v11 disputedBordersQueryItemsForCountry:v9 region:v8];

  return v12;
}

- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  id v8 = [(GEOResourceManifestManager *)self activeTileGroup];
  LOBYTE(v5) = [v8 supportsTileStyle:v7 size:v6 scale:v5];

  return v5;
}

- (unsigned)_fromgeod_maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  return [(GEOResourceManifestServerProxy *)self->_serverProxy maximumZoomLevelForStyle:*(void *)&a3 scale:*(void *)&a4 outSize:a5];
}

void __67__GEOResourceManifestManager__scheduleCachedResourceInfoPurgeTimer__block_invoke(uint64_t a1)
{
}

- (id)bestLocalizedStringForDisplayStringAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(GEOResourceManifestManager *)self activeTileGroup];
  uint64_t v6 = [v5 displayStrings];
  unint64_t v7 = [v6 count];

  if (v7 >= a3)
  {
    id v9 = [(GEOResourceManifestManager *)self activeTileGroup];
    uint64_t v10 = [v9 displayStrings];
    uint64_t v11 = [v10 objectAtIndexedSubscript:a3];
    uint64_t v12 = [v11 localizedStrings];

    if ([v12 count])
    {
      id v8 = +[GEOLocalizedString bestLocalizedStringForCurrentLocale:v12 fallbackToFirstAvailable:0];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setConstantlyChangeTileGroup:(BOOL)a3
{
  self->_constantlyChangeTileGroup = a3;
  -[GEOResourceManifestManager fakeTileGroupChange]((uint64_t)self);
}

- (void)fakeTileGroupChange
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 112))
    {
      dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 120) * 1000000000.0));
      id v3 = [*(id *)(a1 + 8) serverQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke;
      block[3] = &unk_1E53D79D8;
      block[4] = a1;
      dispatch_after(v2, v3, block);
    }
  }
}

- (void)setConstantlyChangeTileGroupInterval:(double)a3
{
  self->_constantlyChangeTileGroupInterval = a3;
}

void __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  id v4 = [v2 activeTileGroup];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke_2;
  v5[3] = &unk_1E53D79D8;
  v5[4] = *(void *)(a1 + 32);
  [v2 serverProxy:v3 didChangeActiveTileGroup:v4 finishedCallback:v5];
}

uint64_t __49__GEOResourceManifestManager_fakeTileGroupChange__block_invoke_2(uint64_t a1)
{
  return -[GEOResourceManifestManager fakeTileGroupChange](*(void *)(a1 + 32));
}

- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v22 = (void *)[(NSMutableArray *)self->_tileGroupObservers mutableCopy];
  os_unfair_recursive_lock_unlock();
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke;
  v43[3] = &unk_1E53D94C8;
  v43[4] = self;
  id v11 = v8;
  id v44 = v11;
  id v12 = v9;
  id v45 = v12;
  id v20 = v10;
  id v46 = v20;
  uint64_t v13 = (void *)MEMORY[0x18C120660](v43);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2_142;
  v39[3] = &unk_1E53D94C8;
  v39[4] = self;
  id v19 = v12;
  id v40 = v19;
  id v24 = v11;
  id v41 = v24;
  id v21 = v13;
  id v42 = v21;
  uint64_t v14 = (void (**)(void))MEMORY[0x18C120660](v39);
  if ([v22 count])
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2810000000;
    v37[3] = "";
    int v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    uint64_t v36 = 0;
    uint64_t v36 = objc_msgSend(v22, "count", v19);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v22;
    uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v29 = v35;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_5;
          v30[3] = &unk_1E53E2C70;
          v30[4] = self;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_6;
          v25[3] = &unk_1E53E2C48;
          long long v28 = v37;
          id v26 = v24;
          long long v27 = v14;
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v18, v30, v25);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v47 count:16];
      }
      while (v15);
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
  else
  {
    v14[2](v14);
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2;
  v6[3] = &unk_1E53E2BF8;
  dispatch_group_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v4 = v2;
  [v3 enumerateObserversWithGroup:v4 visitor:v6];
  uint64_t v5 = [*(id *)(a1 + 40) serverQueue];
  dispatch_group_notify(v4, v5, *(dispatch_block_t *)(a1 + 56));
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_140;
    v6[3] = &unk_1E53D79D8;
    id v7 = *(id *)(a1 + 32);
    [v3 serverProxy:v4 didChangeActiveTileGroup:v5 finishedCallback:v6];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: observer != ((void *)0)", buf, 2u);
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_140(uint64_t a1)
{
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_2_142(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  dispatch_group_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 104);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 96));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 44));
  id v22 = *(id *)(*(void *)(a1 + 32) + 24);
  id v20 = v2;
  if (v4 < 1)
  {
LABEL_12:
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    -[GEOResourceManifestManager _scheduleCachedResourceInfoPurgeTimer](*(void *)(a1 + 32));
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v39 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_opt_respondsToSelector())
          {

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = 0;
  }
  uint64_t v12 = a1 + 32;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 44));
  os_unfair_lock_lock_with_options();
  uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)v12 + 48) = 0;

  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)v12 + 56) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 152));
  [*(id *)(*(void *)(a1 + 32) + 128) reset];
  if ([v2 count])
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2810000000;
    v36[3] = "";
    int v37 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v35 = [v2 count];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v2;
    uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_3;
          v28[3] = &unk_1E53E2C20;
          void v28[4] = *(void *)(a1 + 32);
          id v29 = v22;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_4;
          v23[3] = &unk_1E53E2C48;
          id v26 = v36;
          long long v27 = v34;
          id v24 = *(id *)(a1 + 48);
          id v25 = *(id *)(a1 + 56);
          -[_GEOResourceManifestTileGroupObserverProxy forEachObserver:finished:](v19, v28, v23);
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector()) {
    [v6 resourceManifestManagerDidChangeActiveTileGroup:*(void *)(a1 + 32)];
  }
  if (objc_opt_respondsToSelector())
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = (os_unfair_lock_s *)(v3 + 44);
    id v5 = *(id *)(v3 + 24);
    os_unfair_lock_unlock(v4);
    [v6 resourceManifestManager:*(void *)(a1 + 32) didChangeActiveTileGroup:v5 fromOldTileGroup:*(void *)(a1 + 40)];
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_4(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) serverQueue];
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 40));
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 resourceManifestManagerWillChangeActiveTileGroup:*(void *)(a1 + 32)];
  }
}

void __84__GEOResourceManifestManager_serverProxy_didChangeActiveTileGroup_finishedCallback___block_invoke_6(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) serverQueue];
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)serverProxy:(id)a3 didLoadActiveTileGroup:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_activeTileGroupLock);
  activeTileGroup = self->_activeTileGroup;
  if (activeTileGroup)
  {
    id v10 = [(GEOActiveTileGroup *)activeTileGroup uniqueIdentifier];
    uint64_t v11 = [v7 uniqueIdentifier];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_activeTileGroup.uniqueIdentifier isEqualToString:activeTileGroup.uniqueIdentifier]", v13, 2u);
    }
    objc_storeStrong((id *)&self->_activeTileGroup, a4);
  }
  os_unfair_lock_unlock(&self->_activeTileGroupLock);
  [(GEOObserverHashTable *)self->_serverProxyObservers serverProxy:v8 didLoadActiveTileGroup:v7];
}

- (void)serverProxyNeedsWiFiResourceActivity:(id)a3
{
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
}

- (void)updateManifestIfNecessary:(id)a3
{
}

- (void)updateManifest:(id)a3
{
}

- (id)updateProgress
{
  return (id)[(GEOResourceManifestServerProxy *)self->_serverProxy updateProgress];
}

- (void)activateResourceScenario:(int)a3
{
}

- (void)activateResourceName:(id)a3
{
}

- (void)deactivateResourceScale:(int)a3
{
}

- (void)deactivateResourceScenario:(int)a3
{
}

- (void)deactivateResourceName:(id)a3
{
}

- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v6 = [(GEOResourceManifestManager *)self activeTileGroup];
  id v7 = [v6 muninBucketURLForId:v5 lod:v4];

  return v7;
}

- (id)detailedDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1ED51F370];
  objc_msgSend(v3, "appendFormat:", @"Has Resource Manifest: %i\n", -[GEOResourceManifestManager hasResourceManifest](self, "hasResourceManifest"));
  uint64_t v4 = [(GEOResourceManifestManager *)self activeTileGroup];
  [v3 appendFormat:@"Active Tile Group: %@\n\n", v4];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = GEOResourcesPath(self->_configuration);
  id v7 = [v5 contentsOfDirectoryAtPath:v6 error:0];
  [v3 appendFormat:@"Downloaded Resources: %@\n\n", v7];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = GEORegionalResourcesDirectory(self->_configuration);
  id v10 = [v8 contentsOfDirectoryAtPath:v9 error:0];
  [v3 appendFormat:@"Downloaded Regional Resources: %@", v10];

  return v3;
}

- (void)getResourceManifestWithHandler:(id)a3
{
}

- (unsigned)activeTileGroupIdentifier
{
  uint64_t v2 = [(GEOResourceManifestManager *)self activeTileGroup];
  unsigned int v3 = [v2 identifier];

  return v3;
}

- (void)setActiveTileGroupIdentifier:(unsigned int)a3
{
  serverProxy = self->_serverProxy;
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(GEOResourceManifestServerProxy *)serverProxy setActiveTileGroupIdentifier:v4];
}

- (void)setActiveTileGroupIdentifier:(unsigned int)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  serverProxy = self->_serverProxy;
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = [v8 numberWithUnsignedInt:v6];
  [(GEOResourceManifestServerProxy *)serverProxy setActiveTileGroupIdentifier:v10 updateType:a4 completionHandler:v9];
}

- (void)resetActiveTileGroup
{
}

- (void)_offlineStateChanged:(id)a3
{
  id v4 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Online/offline state changed. Posting tile group change notifications", v5, 2u);
  }

  -[GEOResourceManifestManager _notifyObserversOfResourcesChange]((uint64_t)self);
}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained devResourcesFolderDidChange];
}

void __56__GEOResourceManifestManager_startObservingDevResources__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOResourceManifestManager _notifyObserversOfResourcesChange]((uint64_t)WeakRetained);
}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 resourceManifestManagerWillChangeActiveTileGroup:*(void *)(a1 + 32)];
  }
}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 resourceManifestManagerDidChangeActiveTileGroup:*(void *)(a1 + 32)];
  }
}

void __63__GEOResourceManifestManager__notifyObserversOfResourcesChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (os_unfair_lock_s *)(v3 + 44);
    id v5 = *(id *)(v3 + 24);
    os_unfair_lock_unlock(v4);
    [v6 resourceManifestManager:*(void *)(a1 + 32) didChangeActiveTileGroup:v5 fromOldTileGroup:v5];
  }
}

- (void)devResourcesFolderDidChange
{
  uint64_t v2 = qword_1EB29FB58;
  if (qword_1EB29FB58)
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

- (void)removeDevResources
{
  dispatch_time_t v3 = +[GEOFilePaths pathFor:12];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v5 = [v4 enumeratorAtPath:v3];
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = 0;
      do
      {
        id v9 = v8;
        id v10 = [v3 stringByAppendingPathComponent:v7];
        id v12 = v8;
        [v4 removeItemAtPath:v10 error:&v12];
        id v8 = v12;

        uint64_t v11 = [v5 nextObject];

        id v7 = (void *)v11;
      }
      while (v11);
    }
  }
  [(GEOResourceManifestManager *)self devResourcesFolderDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResourceInfoPurgeTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_networkActivityHandlersIsolation, 0);
  objc_storeStrong((id *)&self->_networkActivityHandlers, 0);
  objc_storeStrong((id *)&self->_localizationRegionsInfo, 0);
  objc_storeStrong((id *)&self->_tileGroupObservers, 0);
  objc_storeStrong((id *)&self->_allRegionalResourceNames, 0);
  objc_storeStrong((id *)&self->_allResourceNames, 0);
  objc_storeStrong((id *)&self->_resourceNamesToPaths, 0);
  objc_storeStrong((id *)&self->_offlineActiveTileGroup, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_serverProxyObservers, 0);

  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end