@interface FPDExtensionManager
- (FPDExtensionManager)initWithServer:(id)a3 updateHandler:(id)a4;
- (FPDPushConnection)pushConnection;
- (FPDServer)server;
- (id)_deserializedAlternateContentsDictionary;
- (id)_deserializedPausedSyncItemDictionary;
- (id)_domainForURL:(id)a3;
- (id)_matchingAttributes;
- (id)allProviders;
- (id)alternateContentsDictionaryForProviderIdentifier:(id)a3;
- (id)alternateContentsURLForItemID:(id)a3;
- (id)clouddocsExtensionIdentifier;
- (id)defaultProviderWithTopLevelBundleIdentifier:(id)a3;
- (id)domainForActionOperationLocator:(id)a3;
- (id)domainForURL:(id)a3 reason:(unint64_t *)a4;
- (id)domainFromItemID:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5;
- (id)domainFromItemID:(id)a3 reason:(unint64_t *)a4;
- (id)domainWithID:(id)a3 reason:(unint64_t *)a4;
- (id)domainsForAppBundleIdentifier:(id)a3;
- (id)extensionPointRecords;
- (id)extensionTypes;
- (id)extensionsByID:(id)a3;
- (id)nonEvictableSizeByProviderDomain;
- (id)providerDomainsByID;
- (id)providerDomainsByIDFromExtensionsByID:(id)a3;
- (id)providerWithIdentifier:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5;
- (id)providerWithIdentifier:(id)a3 reason:(unint64_t *)a4;
- (id)providersWithGroupContainers:(id)a3 bundleIdentifier:(id)a4;
- (id)providersWithTopLevelBundleIdentifier:(id)a3;
- (id)syncPausedBundleIDForItemID:(id)a3;
- (id)syncPausedFilesForBundleID:(id)a3;
- (id)uniquedExtensions:(id)a3;
- (void)_deserializedAlternateContentsDictionary;
- (void)_garbageCollectRemovedProvidersForInstalledProviderIdentifiers:(id)a3;
- (void)_loadAlternateContentsDictionary;
- (void)_loadPausedSyncItemsDictionary;
- (void)_serializeAlternateContentsURLDictionary:(id)a3;
- (void)_serializePausedSyncItemsDictionary:(id)a3;
- (void)_updateProviderListForFilteredFPDExtensions:(id)a3;
- (void)_updateProviderListForMatchingExtensionRecords:(id)a3;
- (void)afterFirstDiscovery;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dropLegacyDaemonCoreSpotlightIndexIfNeeded;
- (void)forceSynchronousProviderUpdate;
- (void)garbageCollectDomainsExceptIdentifiers:(id)a3 fromDirectory:(id)a4 isUserData:(BOOL)a5;
- (void)garbageCollectOnFirstLaunch;
- (void)handleAllExtensionsStarted:(id)a3;
- (void)helena_loadProvidersAndMonitor;
- (void)legacy_loadProvidersAndMonitor;
- (void)legacy_updateProviderListForMatchingExtensions:(id)a3;
- (void)loadProvidersAndMonitor;
- (void)migrateEnabledStateIfNecessary:(id)a3;
- (void)observerDidObserveDatabaseChange:(id)a3;
- (void)purge:(id)a3;
- (void)removePausedSyncItemID:(id)a3 forBundleID:(id)a4;
- (void)setAlternateContentsURL:(id)a3 forItemID:(id)a4;
- (void)setPausedSyncItemID:(id)a3 forBundleID:(id)a4;
- (void)setServer:(id)a3;
- (void)synchronousProviderUpdate:(BOOL)a3;
- (void)updateProviderOnAppearingVolume:(id)a3;
- (void)updateProviderOnDisappearingVolume:(id)a3 reason:(id)a4;
- (void)updateProvidersIfNecessary;
@end

@implementation FPDExtensionManager

- (id)providersWithGroupContainers:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FPDExtensionManager *)self allProviders];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke;
  v17 = &unk_1E6A76380;
  id v18 = v7;
  id v19 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = objc_msgSend(v8, "fp_filter:", &v14);

  v12 = objc_msgSend(v11, "fp_map:", &__block_literal_global_90_0, v14, v15, v16, v17);

  return v12;
}

- (id)allProviders
{
  v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  v4 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  objc_sync_exit(v3);

  return v4;
}

- (id)providerDomainsByIDFromExtensionsByID:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v31 = v3;
  id obj = [v3 allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v41;
    uint64_t v32 = *MEMORY[0x1E4F25C00];
    uint64_t v33 = *(void *)v41;
    do
    {
      uint64_t v8 = 0;
      uint64_t v34 = v6;
      do
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        id v10 = [v9 nsDomainsByID];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          uint64_t v12 = [v9 shouldHideDomainDisplayName];
          v13 = [v9 relevantDomainsByID];
          uint64_t v14 = [v13 allValues];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v37 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = [v9 providerDomainForDomain:*(void *)(*((void *)&v36 + 1) + 8 * i)];
                v21 = v20;
                if (v20)
                {
                  [v20 setShouldHideDomainDisplayName:v12];
                  v22 = [v21 identifier];
                  [v4 setObject:v21 forKeyedSubscript:v22];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v17);
            v23 = v15;
            uint64_t v7 = v33;
            uint64_t v6 = v34;
          }
          else
          {
            v23 = v15;
          }
        }
        else
        {
          v24 = [v9 descriptor];
          int v25 = [v24 defaultDomainVisible];

          if (!v25) {
            goto LABEL_22;
          }
          v26 = [v9 relevantDomainsByID];
          v23 = [v26 objectForKeyedSubscript:v32];

          v27 = [v9 providerDomainForDomain:v23];
          id v15 = v27;
          if (v27)
          {
            [v27 setShouldHideDomainDisplayName:1];
            v28 = [v9 providedItemsURLs];
            [v15 setStorageURLs:v28];

            v29 = [v15 identifier];
            [v4 setObject:v15 forKeyedSubscript:v29];
          }
        }

LABEL_22:
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)providersWithTopLevelBundleIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_providersByIdentifier;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  objc_sync_exit(v5);

  id v18 = (id)objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D9471CC0]();
        uint64_t v12 = [v10 descriptor];
        v13 = [v12 topLevelBundleIdentifier];
        if ([v13 isEqualToString:v4])
        {
        }
        else
        {
          uint64_t v14 = [v10 identifier];
          int v15 = [v14 isEqualToString:v4];

          if (!v15) {
            goto LABEL_11;
          }
        }
        if (objc_msgSend(v10, "isAppExtensionReachable", v18))
        {
          uint64_t v16 = [v10 asAppExtensionBackedProvider];
          [v18 addObject:v16];
        }
LABEL_11:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v18;
}

uint64_t __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 descriptor];
  uint64_t v5 = [v4 topLevelBundleIdentifier];
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 descriptor];
    uint64_t v8 = [v7 topLevelBundleIdentifier];
    if ([v6 hasPrefix:v8])
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [v3 descriptor];
      uint64_t v11 = [v10 documentGroupName];
      uint64_t v12 = [v9 containsObject:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)providerWithIdentifier:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = self->_providersByIdentifier;
  objc_sync_enter(v9);
  id v10 = [(NSMutableDictionary *)self->_providersByIdentifier objectForKeyedSubscript:v8];
  uint64_t v11 = v10;
  if (!a5 || v10)
  {
    if (([v10 invalidated] & v6) == 1)
    {
      id v12 = 0;
      *a5 = 2;
    }
    else
    {
      id v12 = v11;
    }
  }
  else
  {
    id v12 = 0;
    *a5 = 0;
  }

  objc_sync_exit(v9);
  return v12;
}

- (id)providerDomainsByID
{
  id v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableDictionary *)self->_providersByIdentifier copy];
  objc_sync_exit(v3);

  uint64_t v5 = [(FPDExtensionManager *)self providerDomainsByIDFromExtensionsByID:v4];

  return v5;
}

- (void)updateProvidersIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v4 = [v3 personaGenerationIdentifierWithError:0];

  if (updateProvidersIfNecessary_personaGeneration == v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v10 = 0;
    [v5 getKnowledgeUUID:0 andSequenceNumber:&v10];
    id v6 = v10;

    if (([v6 isEqualToNumber:updateProvidersIfNecessary_databaseGeneration] & 1) == 0)
    {
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v12 = updateProvidersIfNecessary_databaseGeneration;
        __int16 v13 = 2112;
        uint64_t v14 = (uint64_t)v6;
        _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] LS resync because of LS generation change (%@ -> %@)", buf, 0x16u);
      }

      if (v6) {
        id v8 = v6;
      }
      else {
        id v8 = &unk_1F2EDBC58;
      }
      objc_storeStrong((id *)&updateProvidersIfNecessary_databaseGeneration, v8);
      [(FPDExtensionManager *)self forceSynchronousProviderUpdate];
    }
  }
  else
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v12 = updateProvidersIfNecessary_personaGeneration;
      __int16 v13 = 2048;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1D744C000, v9, OS_LOG_TYPE_INFO, "[INFO] LS resync because of persona generation change (%llu -> %llu)", buf, 0x16u);
    }

    updateProvidersIfNecessary_personaGeneration = v4;
    [(FPDExtensionManager *)self forceSynchronousProviderUpdate];
  }
}

- (id)providerWithIdentifier:(id)a3 reason:(unint64_t *)a4
{
  return [(FPDExtensionManager *)self providerWithIdentifier:a3 checkInvalidation:0 reason:a4];
}

- (id)defaultProviderWithTopLevelBundleIdentifier:(id)a3
{
  id v3 = [(FPDExtensionManager *)self providersWithTopLevelBundleIdentifier:a3];
  [v3 sortUsingComparator:&__block_literal_global_86];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)domainForURL:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  if (([v6 hasDirectoryPath] & 1) != 0 || !objc_msgSend(v6, "fp_isSymlink"))
  {
    id v8 = [(FPDExtensionManager *)self _domainForURL:v6];
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = [v6 URLByDeletingLastPathComponent];
    id v8 = [(FPDExtensionManager *)self _domainForURL:v7];

    if (!a4) {
      goto LABEL_8;
    }
  }
  if (!v8) {
    *a4 = 3;
  }
LABEL_8:

  return v8;
}

- (id)_domainForURL:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self->_providersByIdentifier;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
    objc_sync_exit(v5);

    uint64_t v7 = objc_msgSend(v4, "fp_realpathURL");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          __int16 v13 = (void *)MEMORY[0x1D9471CC0]();
          uint64_t v14 = [v12 domainForRealPathURLFast:v7];
          if (v14)
          {

            id v27 = v14;
            goto LABEL_27;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v48 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v47 count:16];
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = *(void *)v34;
LABEL_12:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
        long long v21 = (void *)MEMORY[0x1D9471CC0](v16);
        long long v22 = objc_msgSend(v20, "domainForRealPathURLSlow:", v7, (void)v33);
        if (v22) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v47 count:16];
          uint64_t v17 = v16;
          if (v16) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      long long v22 = 0;
    }

    long long v23 = fssync_default_log();
    v24 = fp_default_log();
    os_signpost_id_t v25 = os_signpost_id_generate(v24);

    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = objc_msgSend(v22, "fp_prettyDescription");
      *(_DWORD *)buf = 138412290;
      long long v42 = v26;
      _os_signpost_emit_with_name_impl(&dword_1D744C000, v23, OS_SIGNPOST_EVENT, v25, "Slow domain lookup", "%@", buf, 0xCu);
    }
    id v27 = v22;
    if (v27)
    {
LABEL_27:
      v28 = fp_current_or_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v30 = objc_msgSend(v4, "fp_shortDescription");
        uint64_t v31 = [v8 count];
        uint64_t v32 = objc_msgSend(v27, "fp_prettyDescription");
        *(_DWORD *)buf = 138412802;
        long long v42 = v30;
        __int16 v43 = 2048;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        uint64_t v46 = v32;
        _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] testing if %@ is in our %lu registered file providers: it's in %@", buf, 0x20u);
      }
    }
    else
    {
      v28 = fp_current_or_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        [(FPDExtensionManager *)v4 _domainForURL:v28];
      }
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (FPDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (FPDServer *)WeakRetained;
}

- (id)alternateContentsDictionaryForProviderIdentifier:(id)a3
{
  id v4 = a3;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    uint64_t v11 = [NSString stringWithFormat:@"[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"];
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager alternateContentsDictionaryForProviderIdentifier:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1176, (const char *)[v11 UTF8String]);
  }
  id v6 = v4;
  uint64_t v7 = alternateContentsURLDictionary;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)self->_alternateContentsURLDictionary objectForKeyedSubscript:v6];
  uint64_t v9 = (void *)[v8 copy];

  objc_sync_exit(v7);
  return v9;
}

- (FPDExtensionManager)initWithServer:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FPDExtensionManager;
  id v8 = [(FPDExtensionManager *)&v22 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    providersByIdentifier = v9->_providersByIdentifier;
    v9->_providersByIdentifier = v10;

    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("FPDExtensionManager callback queue", v12);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sessionQueueForExtensionIdentifier = v9->_sessionQueueForExtensionIdentifier;
    v9->_sessionQueueForExtensionIdentifier = (NSMapTable *)v15;

    uint64_t v17 = [[FPDPushConnection alloc] initWithExtensionManager:v9];
    pushConnection = v9->_pushConnection;
    v9->_pushConnection = v17;

    uint64_t v19 = MEMORY[0x1D9471EC0](v7);
    id updateHandler = v9->_updateHandler;
    v9->_id updateHandler = (id)v19;
  }
  return v9;
}

- (void)afterFirstDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if ([MEMORY[0x1E4F25CE0] runningInSyncBubble])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: Skipping push connection because we're just finishing sync", v5, 2u);
    }
  }
  else
  {
    [(FPDPushConnection *)self->_pushConnection start];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend((id)objc_msgSend(WeakRetained, "fpfsClass"), "registerXPCActivities");
}

- (void)garbageCollectDomainsExceptIdentifiers:(id)a3 fromDirectory:(id)a4 isUserData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t section = __fp_create_section();
  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = objc_msgSend(v24, "fp_shortDescription");
    -[FPDExtensionManager garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:](v10, (uint64_t)v39, section, v9);
  }

  [v8 enumeratorAtURL:v24 includingPropertiesForKeys:0 options:1 errorHandler:&__block_literal_global_22];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    uint64_t v14 = "database";
    if (v5) {
      uint64_t v14 = "and archiving user data";
    }
    os_signpost_id_t v25 = v14;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
        if ([v17 length] && (objc_msgSend(v7, "containsObject:", v17) & 1) == 0)
        {
          uint64_t v18 = fp_current_or_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_super v22 = objc_msgSend(v16, "fp_shortDescription");
            *(_DWORD *)buf = 136315650;
            long long v33 = v25;
            __int16 v34 = 2114;
            id v35 = v17;
            __int16 v36 = 2114;
            long long v37 = v22;
            _os_log_debug_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] collecting %s for domain %{public}@ at %{public}@ because its provider is uninstalled or domain is lost", buf, 0x20u);
          }
          id v26 = 0;
          char v19 = [v8 removeItemAtURL:v16 error:&v26];
          id v20 = v26;
          if ((v19 & 1) == 0)
          {
            long long v21 = fp_current_or_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "fp_shortDescription");
              long long v23 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              long long v33 = v23;
              __int16 v34 = 2112;
              id v35 = v20;
              _os_log_error_impl(&dword_1D744C000, v21, OS_LOG_TYPE_ERROR, "[ERROR] can't remove: %@: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v12);
  }

  __fp_leave_section_Debug();
}

uint64_t __87__FPDExtensionManager_garbageCollectDomainsExceptIdentifiers_fromDirectory_isUserData___block_invoke()
{
  return 0;
}

- (void)_garbageCollectRemovedProvidersForInstalledProviderIdentifiers:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v62 = fileProviderDirectory();
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  v72 = v5;
  id v7 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:1 errorHandler:0];

  id v8 = objc_opt_new();
  v67 = v4;
  v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = [FPDAppMonitor alloc];
  v60 = self;
  uint64_t v10 = [(FPDExtensionManager *)self server];
  id v11 = [(FPDAppMonitor *)v9 initWithServer:v10];

  v61 = v11;
  v64 = [(FPDAppMonitor *)v11 listOfPlaceholderApps];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v98;
    uint64_t v66 = *(void *)v98;
    do
    {
      uint64_t v15 = 0;
      uint64_t v68 = v13;
      do
      {
        if (*(void *)v98 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v97 + 1) + 8 * v15);
        if (objc_msgSend(v16, "fp_isFolder"))
        {
          uint64_t v17 = [v16 URLByAppendingPathComponent:@"Domains.plist"];
          uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
          char v19 = [v17 path];
          id v20 = [v18 dictionaryWithContentsOfFile:v19];

          if (v20)
          {
            v70 = v17;
            long long v21 = [v16 lastPathComponent];
            v71 = v20;
            if ([v67 containsObject:v21])
            {
LABEL_21:
              id v74 = (id)objc_opt_new();
              long long v89 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              uint64_t v32 = [v20 keyEnumerator];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v89 objects:v109 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v90;
                do
                {
                  for (uint64_t i = 0; i != v34; ++i)
                  {
                    if (*(void *)v90 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v37 = *(void *)(*((void *)&v89 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v38 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", v21, v37);
                      long long v39 = fp_current_or_default_log();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        v102 = v38;
                        _os_log_debug_impl(&dword_1D744C000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] marking domain %{public}@ for preservation", buf, 0xCu);
                      }

                      [v8 addObject:v38];
                    }
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v89 objects:v109 count:16];
                }
                while (v34);
              }

              uint64_t v14 = v66;
              uint64_t v13 = v68;
              id v20 = v71;
              uint64_t v31 = v74;
            }
            else
            {
              v65 = v16;
              long long v95 = 0u;
              long long v96 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              id v73 = v64;
              uint64_t v22 = [v73 countByEnumeratingWithState:&v93 objects:v110 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v94;
                while (2)
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v94 != v24) {
                      objc_enumerationMutation(v73);
                    }
                    id v26 = *(void **)(*((void *)&v93 + 1) + 8 * j);
                    long long v27 = (void *)MEMORY[0x1D9471CC0]();
                    long long v28 = [v26 stringByAppendingString:@"."];
                    char v29 = [v21 hasPrefix:v28];

                    if (v29)
                    {

                      id v20 = v71;
                      goto LABEL_21;
                    }
                  }
                  uint64_t v23 = [v73 countByEnumeratingWithState:&v93 objects:v110 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              long long v30 = fp_current_or_default_log();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v102 = v65;
                __int16 v103 = 2114;
                v104 = v21;
                _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Will collect %{public}@ because %{public}@ is no longer installed", buf, 0x16u);
              }

              uint64_t v31 = [v65 path];
              [v63 addObject:v31];
              uint64_t v14 = v66;
              uint64_t v13 = v68;
              id v20 = v71;
            }

            uint64_t v17 = v70;
          }
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
    }
    while (v13);
  }

  uint64_t v40 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v62 isDirectory:1];
  [(FPDExtensionManager *)v60 garbageCollectDomainsExceptIdentifiers:v8 fromDirectory:v40 isUserData:0];

  long long v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_cloudStorageDirectory");
  [(FPDExtensionManager *)v60 garbageCollectDomainsExceptIdentifiers:v8 fromDirectory:v41 isUserData:1];

  if ([MEMORY[0x1E4F23838] isIndexingAvailable])
  {
    id v42 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v75 = v63;
    uint64_t v43 = [v75 countByEnumeratingWithState:&v85 objects:v108 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v86;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v86 != v45) {
            objc_enumerationMutation(v75);
          }
          v47 = *(void **)(*((void *)&v85 + 1) + 8 * k);
          v48 = [v47 lastPathComponent];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke;
          v81[3] = &unk_1E6A73530;
          id v82 = v48;
          id v83 = v72;
          v84 = v47;
          id v49 = v48;
          [v42 deleteAllSearchableItemsForBundleID:v49 completionHandler:v81];
        }
        uint64_t v44 = [v75 countByEnumeratingWithState:&v85 objects:v108 count:16];
      }
      while (v44);
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v42 = v63;
    uint64_t v50 = [v42 countByEnumeratingWithState:&v77 objects:v107 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v78;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v78 != v52) {
            objc_enumerationMutation(v42);
          }
          v54 = *(void **)(*((void *)&v77 + 1) + 8 * m);
          v55 = [v54 lastPathComponent];
          id v76 = 0;
          char v56 = [v72 removeItemAtPath:v54 error:&v76];
          id v57 = v76;
          if ((v56 & 1) == 0)
          {
            v58 = fp_current_or_default_log();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v59 = objc_msgSend(v57, "fp_prettyDescription");
              *(_DWORD *)buf = 138543874;
              v102 = v55;
              __int16 v103 = 2114;
              v104 = v54;
              __int16 v105 = 2114;
              v106 = v59;
              _os_log_error_impl(&dword_1D744C000, v58, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove domains entry for provider identifier %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v51 = [v42 countByEnumeratingWithState:&v77 objects:v107 count:16];
      }
      while (v51);
    }
  }
}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_2((uint64_t)a1, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_1((uint64_t)a1, v5);
  }

  uint64_t v12 = (void *)a1[5];
  uint64_t v13 = a1[6];
  id v18 = 0;
  char v14 = [v12 removeItemAtPath:v13 error:&v18];
  id v3 = v18;
  if ((v14 & 1) == 0)
  {
    BOOL v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = a1[4];
      uint64_t v16 = a1[6];
      uint64_t v17 = objc_msgSend(v3, "fp_prettyDescription");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      _os_log_error_impl(&dword_1D744C000, v5, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove domains entry for provider identifier %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)handleAllExtensionsStarted:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke;
  v9[3] = &unk_1E6A736C0;
  v9[4] = self;
  id v10 = v4;
  uint64_t v5 = handleAllExtensionsStarted__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&handleAllExtensionsStarted__onceToken, v9);
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke_2;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) allValues];
  [v1 migrateEnabledStateIfNecessary:v2];

  return +[FPDSharedScheduler checkIn];
}

uint64_t __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
}

- (void)garbageCollectOnFirstLaunch
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  if (garbageCollectOnFirstLaunch_onceToken != -1) {
    dispatch_once(&garbageCollectOnFirstLaunch_onceToken, block);
  }
}

void __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  id v3 = [*(id *)(a1 + 32) server];
  if ([v3 isPastBuddy])
  {
    char v4 = [MEMORY[0x1E4F25CE0] runningInSyncBubble];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
      id v6 = [v5 userPersonaUniqueString];

      if (v6
        || ([MEMORY[0x1E4FB36F8] sharedManager],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 isSharedIPad],
            v7,
            v8))
      {
        [*(id *)(a1 + 32) _garbageCollectRemovedProvidersForInstalledProviderIdentifiers:v2];
      }
      uint64_t v9 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
      id v10 = [v9 userPersonaUniqueString];

      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4FB36F8] sharedManager];
        uint64_t v12 = [v11 currentPersona];

        id v22 = 0;
        uint64_t v13 = [v12 userPersonaUniqueString];
        char v14 = v13;
        if (v13 == v10
          || ([v13 isEqualToString:v10] & 1) != 0
          || !voucher_process_can_use_arbitrary_personas())
        {
          char v19 = 0;
        }
        else
        {
          id v21 = 0;
          uint64_t v15 = (void *)[v12 copyCurrentPersonaContextWithError:&v21];
          id v16 = v21;
          id v17 = v22;
          id v22 = v15;

          if (v16)
          {
            id v18 = fp_current_or_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[FPDServer migrateLegacyFPFSLocations].cold.5();
            }
          }
          char v19 = [v12 generateAndRestorePersonaContextWithPersonaUniqueString:v10];

          if (v19)
          {
            uint64_t v20 = fp_current_or_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[FPDServer migrateLegacyFPFSLocations].cold.4();
            }
          }
        }
        [*(id *)(a1 + 32) _garbageCollectRemovedProvidersForInstalledProviderIdentifiers:v2];

        _FPRestorePersona();
      }
      goto LABEL_21;
    }
  }
  else
  {
  }
  id v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_1();
  }
LABEL_21:
}

- (id)extensionTypes
{
  return &unk_1F2EDBB80;
}

- (id)_matchingAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F282B0];
  v2 = [(FPDExtensionManager *)self extensionTypes];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)loadProvidersAndMonitor
{
  [(FPDExtensionManager *)self _loadAlternateContentsDictionary];
  id v3 = fp_default_log();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  uint64_t v5 = fp_default_log();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D744C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InitialEnumeration", "Initial enumeration of file providers", buf, 2u);
  }

  if (FPFeatureFlagHelenaIsEnabled()) {
    [(FPDExtensionManager *)self helena_loadProvidersAndMonitor];
  }
  else {
    [(FPDExtensionManager *)self legacy_loadProvidersAndMonitor];
  }
  [(FPDExtensionManager *)self _loadPausedSyncItemsDictionary];
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__FPDExtensionManager_loadProvidersAndMonitor__block_invoke;
  v8[3] = &unk_1E6A744F0;
  v8[4] = self;
  v8[5] = v4;
  dispatch_async(callbackQueue, v8);
}

void __46__FPDExtensionManager_loadProvidersAndMonitor__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) afterFirstDiscovery];
  v2 = fp_default_log();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D744C000, v3, OS_SIGNPOST_INTERVAL_END, v4, "InitialEnumeration", (const char *)&unk_1D753479F, v5, 2u);
  }
}

- (void)helena_loadProvidersAndMonitor
{
  if (self->_observer)
  {
    id v10 = [NSString stringWithFormat:@"[ASSERT] ‼️ you shouldn't call -loadProviders twice"];
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager helena_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 375, (const char *)[v10 UTF8String]);
  }
  id v3 = (LSObserver *)objc_alloc_init(MEMORY[0x1E4F22450]);
  observer = self->_observer;
  self->_observer = v3;

  [(LSObserver *)self->_observer setDelegate:self];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [(LSObserver *)self->_observer setName:v6];

  [(LSObserver *)self->_observer startObserving];
  uint64_t v7 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
  int v8 = [v7 addMonitor:self subjectMask:1];
  apSubscription = self->_apSubscription;
  self->_apSubscription = v8;

  [(FPDExtensionManager *)self forceSynchronousProviderUpdate];
}

- (void)legacy_loadProvidersAndMonitor
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_matchingContext)
  {
    uint64_t v7 = [NSString stringWithFormat:@"[ASSERT] ‼️ you shouldn't call -loadProviders twice"];
    int v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager legacy_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 395, (const char *)[v7 UTF8String]);
  }
  id v3 = (void *)MEMORY[0x1E4F28C70];
  os_signpost_id_t v4 = [(FPDExtensionManager *)v2 _matchingAttributes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke;
  v11[3] = &unk_1E6A76260;
  v11[4] = v2;
  uint64_t v5 = [v3 beginMatchingExtensionsWithAttributes:v4 completion:v11];
  id matchingContext = v2->_matchingContext;
  v2->_id matchingContext = (id)v5;

  if (!v2->_matchingContext)
  {
    uint64_t v9 = [NSString stringWithFormat:@"can't watch the list of extensions"];
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager legacy_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 420, (const char *)[v9 UTF8String]);
  }
  [(FPDExtensionManager *)v2 forceSynchronousProviderUpdate];
  objc_sync_exit(v2);
}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __fp_create_section();
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_2();
    }

    __fp_leave_section_Debug();
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    __fp_create_section();
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "legacy_updateProviderListForMatchingExtensions:", v5);
    __fp_leave_section_Debug();
    objc_sync_exit(v8);
  }
}

- (void)purge:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDExtensionManager *)self server];
  id v6 = [v5 volumeManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__FPDExtensionManager_purge___block_invoke;
  v8[3] = &unk_1E6A73508;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateLibrariesWithBlock:v8];
}

uint64_t __29__FPDExtensionManager_purge___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 purgatoryDirectory];
  [v2 purgeAsyncAtUrl:v3];

  return 1;
}

- (id)extensionPointRecords
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FPDExtensionManager_extensionPointRecords__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  if (extensionPointRecords_onceToken != -1) {
    dispatch_once(&extensionPointRecords_onceToken, block);
  }
  return (id)extensionPointRecords_ret;
}

void __44__FPDExtensionManager_extensionPointRecords__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [*(id *)(a1 + 32) extensionTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        id v11 = objc_alloc(MEMORY[0x1E4F22448]);
        id v18 = v9;
        uint64_t v12 = (void *)[v11 initWithIdentifier:v10 platform:2 error:&v18];
        id v6 = v18;

        if (v12)
        {
          [v2 addObject:v12];
        }
        else
        {
          uint64_t v13 = fp_current_or_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = objc_msgSend(v6, "fp_prettyDescription");
            *(_DWORD *)buf = 138412802;
            uint64_t v24 = v10;
            __int16 v25 = 1024;
            int v26 = 2;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            uint64_t v15 = (void *)v14;
            _os_log_error_impl(&dword_1D744C000, v13, OS_LOG_TYPE_ERROR, "[ERROR] Extension record %@ for platform %d missing: %@", buf, 0x1Cu);
          }
        }

        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v16 = [v2 copy];
  id v17 = (void *)extensionPointRecords_ret;
  extensionPointRecords_ret = v16;
}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FPDExtensionManager_observerDidObserveDatabaseChange___block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __56__FPDExtensionManager_observerDidObserveDatabaseChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronousProviderUpdate:0];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = [(FPDExtensionManager *)self allProviders];
  uint64_t v8 = objc_msgSend(v7, "fp_map:", &__block_literal_global_42);
  id v9 = [v5 setWithArray:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_2;
  v15[3] = &unk_1E6A762A8;
  id v10 = v9;
  id v16 = v10;
  id v11 = objc_msgSend(v6, "fp_filter:", v15);

  if ([v11 count])
  {
    callbackQueue = self->_callbackQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_45;
    v14[3] = &unk_1E6A73FE8;
    v14[4] = self;
    dispatch_async(callbackQueue, v14);
  }
  else
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[FPDExtensionManager appProtectionSubjectsChanged:forSubscription:]();
    }
  }
}

id __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 descriptor];
  id v3 = [v2 topLevelBundleIdentifier];

  return v3;
}

uint64_t __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 bundleIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_45(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_45_cold_1();
  }

  return [*(id *)(a1 + 32) forceSynchronousProviderUpdate];
}

- (void)forceSynchronousProviderUpdate
{
}

- (void)synchronousProviderUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (FPFeatureFlagHelenaIsEnabled())
  {
    id v5 = (id)objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [(FPDExtensionManager *)v4 extensionPointRecords];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = [MEMORY[0x1E4F223A0] enumeratorWithExtensionPointRecord:*(void *)(*((void *)&v20 + 1) + 8 * v9) options:0x4000000000000000];
          id v11 = [v10 allObjects];
          [v5 addObjectsFromArray:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_msgSend(v5, "fp_map:", &__block_literal_global_51);
    uint64_t v14 = [v12 setWithArray:v13];

    if (![(NSSet *)v4->_providerUUIDs isEqualToSet:v14] || v3)
    {
      [(FPDExtensionManager *)v4 _updateProviderListForMatchingExtensionRecords:v5];
      objc_storeStrong((id *)&v4->_providerUUIDs, v14);
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C70];
    id v16 = [(FPDExtensionManager *)v4 _matchingAttributes];
    id v19 = 0;
    uint64_t v14 = [v15 extensionsWithMatchingAttributes:v16 error:&v19];
    id v5 = v19;

    if (!v14)
    {
      id v17 = [NSString stringWithFormat:@"can't enumerate extensions: %@", v5];
      id v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDExtensionManager synchronousProviderUpdate:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 565, (const char *)[v17 UTF8String]);
    }
    [(FPDExtensionManager *)v4 legacy_updateProviderListForMatchingExtensions:v14];
  }

  objc_sync_exit(v4);
}

uint64_t __49__FPDExtensionManager_synchronousProviderUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)updateProviderOnAppearingVolume:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = dispatch_group_create();
  uint64_t v6 = self->_providersByIdentifier;
  objc_sync_enter(v6);
  uint64_t v15 = self;
  uint64_t v7 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  objc_sync_exit(v6);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 importDomainsFromLibrary:v4 updatePlist:0];
        dispatch_group_enter(v5);
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke;
        v18[3] = &unk_1E6A73FE8;
        id v19 = v5;
        [v12 startDomains:v13 completion:v18];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  callbackQueue = v15->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke_2;
  block[3] = &unk_1E6A73FE8;
  block[4] = v15;
  dispatch_group_notify(v5, callbackQueue, block);
}

void __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke(uint64_t a1)
{
}

uint64_t __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
}

- (void)updateProviderOnDisappearingVolume:(id)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_providersByIdentifier;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  objc_sync_exit(v8);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v13++) invalidateAllDomainsOnVolume:v6 reason:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__FPDExtensionManager_updateProviderOnDisappearingVolume_reason___block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __65__FPDExtensionManager_updateProviderOnDisappearingVolume_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained signalProviderChanges];
}

- (void)migrateEnabledStateIfNecessary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = fileProviderDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"LegacyEnabledStateHasBeenMigrated"];

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if ((v7 & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v3;
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
          [*(id *)(*((void *)&v17 + 1) + 8 * v12++) enableAllDomainsIfNoUserElection];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v16 = 0;
    char v13 = [&stru_1F2EC3618 writeToFile:v5 atomically:0 encoding:4 error:&v16];
    id v14 = v16;
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FPDExtensionManager migrateEnabledStateIfNecessary:](v14);
      }
    }
  }
}

- (id)extensionsByID:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v39;
    *(void *)&long long v6 = 138412290;
    long long v35 = v6;
    uint64_t v36 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", v35);

        if (v11)
        {
          uint64_t v12 = v10;
          char v13 = [v12 identifier];
          id v14 = [v4 objectForKeyedSubscript:v13];

          uint64_t v15 = v12;
          if (!v14) {
            goto LABEL_24;
          }
          id v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            long long v17 = [v12 identifier];
            long long v18 = [v14 identifier];
            long long v19 = [v12 identifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = v17;
            __int16 v44 = 2112;
            uint64_t v45 = v18;
            __int16 v46 = 2112;
            v47 = v19;
            _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_INFO, "[INFO] %@ and %@ are backing the same identifier, %@:", buf, 0x20u);

            uint64_t v8 = v36;
          }

          long long v20 = [v12 bundleVersion];
          uint64_t v21 = [v14 bundleVersion];
          uint64_t v22 = [v20 compare:v21 options:64];

          if (v22)
          {
            if (v22 == -1)
            {
              long long v23 = fp_current_or_default_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                uint64_t v24 = [v12 identifier];
                uint64_t v25 = [v12 bundleVersion];
                int v26 = [v14 identifier];
                __int16 v27 = [v14 bundleVersion];
                *(_DWORD *)buf = 138413058;
                uint64_t v43 = v24;
                __int16 v44 = 2112;
                uint64_t v45 = v25;
                __int16 v46 = 2112;
                v47 = v26;
                __int16 v48 = 2112;
                id v49 = v27;
                _os_log_impl(&dword_1D744C000, v23, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);

                uint64_t v8 = v36;
              }

              uint64_t v15 = v14;
              uint64_t v28 = v12;
LABEL_23:

LABEL_24:
              uint64_t v33 = [v12 identifier];
              [v4 setObject:v15 forKeyedSubscript:v33];

              goto LABEL_25;
            }
            uint64_t v28 = fp_current_or_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              char v29 = [v14 identifier];
              uint64_t v30 = [v14 bundleVersion];
              uint64_t v31 = [v12 identifier];
              uint64_t v32 = [v12 bundleVersion];
              *(_DWORD *)buf = 138413058;
              uint64_t v43 = v29;
              __int16 v44 = 2112;
              uint64_t v45 = v30;
              __int16 v46 = 2112;
              v47 = v31;
              __int16 v48 = 2112;
              id v49 = v32;
              _os_log_impl(&dword_1D744C000, v28, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);
LABEL_21:

              uint64_t v8 = v36;
            }
          }
          else
          {
            uint64_t v28 = fp_current_or_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              char v29 = [v14 identifier];
              uint64_t v30 = [v12 identifier];
              uint64_t v31 = [v12 bundleVersion];
              uint64_t v32 = [v12 identifier];
              *(_DWORD *)buf = 138413058;
              uint64_t v43 = v29;
              __int16 v44 = 2112;
              uint64_t v45 = v30;
              __int16 v46 = 2112;
              v47 = v31;
              __int16 v48 = 2112;
              id v49 = v32;
              _os_log_error_impl(&dword_1D744C000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Provider %@ and %@ have the same version number (%@). %@ will win nondeterministically.", buf, 0x2Au);
              goto LABEL_21;
            }
          }
          uint64_t v15 = v12;
          goto LABEL_23;
        }
        uint64_t v15 = fp_current_or_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          uint64_t v43 = v10;
          _os_log_error_impl(&dword_1D744C000, v15, OS_LOG_TYPE_ERROR, "[ERROR] ignoring extension without identifier: %@", buf, 0xCu);
        }
LABEL_25:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)uniquedExtensions:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v3;
  long long v6 = (void *)v4;
  id v7 = v5;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    long long v39 = (void *)v4;
    id v40 = v7;
    uint64_t v41 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (([v12 supportsFPFS] & 1) == 0)
        {
          char v13 = [v12 extensionStorageURLs];
          id v14 = [v13 firstObject];

          if (v14)
          {
            uint64_t v15 = v12;
            id v16 = [v6 objectForKeyedSubscript:v14];
            if (!v16) {
              goto LABEL_24;
            }
            long long v17 = fp_current_or_default_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              long long v18 = [v15 identifier];
              long long v19 = [v16 identifier];
              long long v20 = objc_msgSend(v14, "fp_shortDescription");
              *(_DWORD *)buf = 138412802;
              v47 = v18;
              __int16 v48 = 2112;
              id v49 = v19;
              __int16 v50 = 2112;
              uint64_t v51 = v20;
              _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_INFO, "[INFO] %@ and %@ are backing the same location, %@:", buf, 0x20u);

              id v7 = v40;
            }

            uint64_t v21 = [v15 bundleVersion];
            uint64_t v22 = [v16 bundleVersion];
            uint64_t v23 = [v21 compare:v22 options:64];

            if (v23)
            {
              if (v23 == -1)
              {
                uint64_t v24 = fp_current_or_default_log();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  uint64_t v25 = [v15 identifier];
                  int v26 = [v15 bundleVersion];
                  __int16 v27 = [v16 identifier];
                  uint64_t v28 = [v16 bundleVersion];
                  *(_DWORD *)buf = 138413058;
                  v47 = v25;
                  __int16 v48 = 2112;
                  id v49 = v26;
                  __int16 v50 = 2112;
                  uint64_t v51 = v27;
                  __int16 v52 = 2112;
                  v53 = v28;
                  _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);

                  long long v6 = v39;
                  id v7 = v40;
                }
                char v29 = v15;
                uint64_t v15 = v16;
LABEL_23:
                uint64_t v10 = v41;

LABEL_24:
                [v6 setObject:v15 forKeyedSubscript:v14];

LABEL_25:
                continue;
              }
              char v29 = fp_current_or_default_log();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
                goto LABEL_23;
              }
              uint64_t v30 = [v16 identifier];
              uint64_t v31 = [v16 bundleVersion];
              uint64_t v32 = [v15 identifier];
              uint64_t v33 = [v15 bundleVersion];
              *(_DWORD *)buf = 138413058;
              v47 = v30;
              __int16 v48 = 2112;
              id v49 = v31;
              __int16 v50 = 2112;
              uint64_t v51 = v32;
              __int16 v52 = 2112;
              v53 = v33;
              _os_log_impl(&dword_1D744C000, v29, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);
            }
            else
            {
              char v29 = fp_current_or_default_log();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                goto LABEL_23;
              }
              uint64_t v30 = [v16 identifier];
              uint64_t v31 = [v15 identifier];
              uint64_t v32 = [v15 bundleVersion];
              uint64_t v33 = [v15 identifier];
              *(_DWORD *)buf = 138413058;
              v47 = v30;
              __int16 v48 = 2112;
              id v49 = v31;
              __int16 v50 = 2112;
              uint64_t v51 = v32;
              __int16 v52 = 2112;
              v53 = v33;
              _os_log_error_impl(&dword_1D744C000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Provider %@ and %@ have the same version number (%@). %@ will win nondeterministically.", buf, 0x2Au);
            }

            id v7 = v40;
            long long v6 = v39;
            goto LABEL_23;
          }
          uint64_t v15 = fp_current_or_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[FPDExtensionManager uniquedExtensions:](v54, v12, &v55, v15);
          }
          goto LABEL_25;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v9);
  }

  objc_msgSend(v7, "fp_filter:", &__block_literal_global_63);
  v35 = uint64_t v34 = v6;
  uint64_t v36 = [v34 allValues];
  uint64_t v37 = [v36 arrayByAddingObjectsFromArray:v35];

  return v37;
}

uint64_t __41__FPDExtensionManager_uniquedExtensions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsFPFS];
}

- (void)legacy_updateProviderListForMatchingExtensions:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  long long v6 = (void *)[[v4 alloc] initWithSuiteName:@"com.apple.fileproviderd"];
  id v7 = [v6 stringForKey:@"provider-filter"];
  uint64_t v8 = [v7 lowercaseString];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __70__FPDExtensionManager_legacy_updateProviderListForMatchingExtensions___block_invoke;
  id v14 = &unk_1E6A76310;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  uint64_t v10 = objc_msgSend(v5, "fp_map:", &v11);

  -[FPDExtensionManager _updateProviderListForFilteredFPDExtensions:](self, "_updateProviderListForFilteredFPDExtensions:", v10, v11, v12, v13, v14);
}

id __70__FPDExtensionManager_legacy_updateProviderListForMatchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  id v5 = v4;
  if (*(void *)(a1 + 32)
    && ([v4 lowercaseString],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsString:*(void *)(a1 + 32)],
        v6,
        !v7))
  {
    char v13 = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKey:v5];
    if (!v8)
    {
      id v9 = [NSString stringWithFormat:@"extension session queue for %@", v5];
      uint64_t v10 = (const char *)[v9 UTF8String];
      uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v8 = dispatch_queue_create(v10, v11);

      [*(id *)(*(void *)(a1 + 40) + 64) setObject:v8 forKey:v5];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 96));
    char v13 = +[FPDExtension instanceWithExtension:v3 queue:v8 server:WeakRetained];
  }
  return v13;
}

- (void)_updateProviderListForMatchingExtensionRecords:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  long long v6 = (void *)[[v4 alloc] initWithSuiteName:@"com.apple.fileproviderd"];
  int v7 = [v6 stringForKey:@"provider-filter"];
  uint64_t v8 = [v7 lowercaseString];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __70__FPDExtensionManager__updateProviderListForMatchingExtensionRecords___block_invoke;
  id v14 = &unk_1E6A76338;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  uint64_t v10 = objc_msgSend(v5, "fp_map:", &v11);

  -[FPDExtensionManager _updateProviderListForFilteredFPDExtensions:](self, "_updateProviderListForFilteredFPDExtensions:", v10, v11, v12, v13, v14);
}

id __70__FPDExtensionManager__updateProviderListForMatchingExtensionRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 bundleIdentifier];
  id v5 = v4;
  if (*(void *)(a1 + 32)
    && ([v4 lowercaseString],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsString:*(void *)(a1 + 32)],
        v6,
        !v7))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    if (objc_msgSend(v5, "fp_isValidProviderIdentifierWithError:", 0))
    {
      id v9 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKey:v5];
      if (!v9)
      {
        id v10 = [NSString stringWithFormat:@"extension session queue for %@", v5];
        uint64_t v11 = (const char *)[v10 UTF8String];
        uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        id v9 = dispatch_queue_create(v11, v12);

        [*(id *)(*(void *)(a1 + 40) + 64) setObject:v9 forKey:v5];
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 96));
      uint64_t v8 = +[FPDExtension instanceWithExtensionRecord:v3 queue:v9 server:WeakRetained];
    }
  }

  return v8;
}

- (void)_updateProviderListForFilteredFPDExtensions:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  context = (void *)MEMORY[0x1D9471CC0]();
  uint64_t section = __fp_create_section();
  uint64_t v4 = fp_current_or_default_log();
  v47 = self;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v68 = section;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Updating list of extensions", buf, 0xCu);
  }

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v43 = (id)objc_opt_new();
  id v5 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  uint64_t v41 = (void *)[v5 mutableCopy];

  long long v38 = [(FPDExtensionManager *)self uniquedExtensions:v40];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = (id)[v38 mutableCopy];
  int v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D9471CC0]();
        uint64_t v12 = [v10 identifier];
        char v13 = v12;
        if (!v12)
        {
          id v14 = fp_current_or_default_log();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v68 = (uint64_t)v10;
          id v15 = v14;
          id v16 = "[NOTICE] File provider extension %@ has no identifier. Ignoring.";
          goto LABEL_20;
        }
        if (objc_msgSend(v12, "fp_isLegacyCloudDocsIdentifier")
          && FPIsCloudDocsWithFPFSEnabled())
        {
          id v14 = fp_current_or_default_log();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v68 = (uint64_t)v13;
          id v15 = v14;
          id v16 = "[NOTICE] ignoring non-FPFS %{public}@ extension";
LABEL_20:
          _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          goto LABEL_22;
        }
        if ([v13 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"]) {
          v6 |= [v10 isAppExtensionReachable];
        }
        long long v17 = [(NSMutableDictionary *)v47->_providersByIdentifier objectForKeyedSubscript:v13];
        id v14 = v17;
        if (v17 && [v17 isEqual:v10])
        {
          [v42 setObject:v14 forKeyedSubscript:v13];
          [v41 removeObject:v14];
        }
        else
        {
          [v42 setObject:v10 forKeyedSubscript:v13];
          [v43 addObject:v10];
        }
LABEL_22:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v7);
  }

  if (!(v6 & 1 | ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)))
  {
    long long v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] FPFS is enabled for iCloudDrive, but extension is missing.", buf, 2u);
    }
  }
  long long v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = (uint64_t)v40;
    __int16 v69 = 2114;
    v70 = v41;
    __int16 v71 = 2114;
    id v72 = v43;
    _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] %{public}@ -> {unregistering: %{public}@, registering: %{public}@}", buf, 0x20u);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v45 = v41;
  uint64_t v20 = [v45 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v45);
        }
        uint64_t v23 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        uint64_t v24 = [v23 descriptor];
        uint64_t v25 = [v24 topLevelBundleIdentifier];

        if (v25) {
          [(FPDPushConnection *)v47->_pushConnection setMessageDelegate:0 forApplicationBundleIdentifier:v25];
        }
        [v23 invalidateWithReason:@"extension was unregistered"];
      }
      uint64_t v20 = [v45 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v20);
  }

  int v26 = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v44 = v43;
  uint64_t v27 = [v44 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v44);
        }
        uint64_t v30 = *(void **)(*((void *)&v52 + 1) + 8 * k);
        dispatch_group_enter(v26);
        uint64_t v31 = [v30 descriptor];
        uint64_t v32 = [v31 topLevelBundleIdentifier];

        if (v32 && [v30 isAppExtensionReachable])
        {
          pushConnection = v47->_pushConnection;
          uint64_t v34 = [v30 asAppExtensionBackedProvider];
          [(FPDPushConnection *)pushConnection setMessageDelegate:v34 forApplicationBundleIdentifier:v32];
        }
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke;
        v50[3] = &unk_1E6A73FE8;
        uint64_t v51 = v26;
        [v30 startWithCompletion:v50];
      }
      uint64_t v27 = [v44 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v27);
  }

  long long v35 = v47->_providersByIdentifier;
  objc_sync_enter(v35);
  if (([(NSMutableDictionary *)v47->_providersByIdentifier isEqual:v42] & 1) == 0) {
    [(NSMutableDictionary *)v47->_providersByIdentifier setDictionary:v42];
  }
  objc_sync_exit(v35);

  [(FPDExtensionManager *)v47 garbageCollectOnFirstLaunch];
  callbackQueue = v47->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke_2;
  block[3] = &unk_1E6A736C0;
  block[4] = v47;
  id v49 = v42;
  id v37 = v42;
  dispatch_group_notify(v26, callbackQueue, block);

  __fp_leave_section_Notice();
}

void __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke(uint64_t a1)
{
}

uint64_t __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAllExtensionsStarted:*(void *)(a1 + 40)];
}

- (id)nonEvictableSizeByProviderDomain
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = self->_providersByIdentifier;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  objc_sync_exit(v4);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [v7 nsDomainsByID];
        BOOL v9 = [v8 count] == 0;

        if (!v9)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = [v7 relevantDomainsByID];
          uint64_t v11 = [v10 allValues];

          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v11);
                }
                id v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                if ([v15 isUsingFPFS])
                {
                  id v16 = [v15 providerDomainID];
                  long long v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "nonEvictableSpace"));
                  [v3 setObject:v17 forKeyedSubscript:v16];
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v3;
}

- (id)domainWithID:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "fp_toProviderID");
  uint64_t v8 = [(FPDExtensionManager *)self providerWithIdentifier:v7 checkInvalidation:0 reason:a4];

  BOOL v9 = objc_msgSend(v6, "fp_toDomainIdentifier");

  id v10 = [v8 domainForIdentifier:v9 reason:a4];

  return v10;
}

- (id)domainFromItemID:(id)a3 reason:(unint64_t *)a4
{
  return [(FPDExtensionManager *)self domainFromItemID:a3 checkInvalidation:0 reason:a4];
}

- (id)domainFromItemID:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [v8 providerID];
  id v10 = [(FPDExtensionManager *)self providerWithIdentifier:v9 checkInvalidation:v6 reason:a5];

  uint64_t v11 = [v8 domainIdentifier];

  uint64_t v12 = [v10 domainForIdentifier:v11 reason:a5];

  return v12;
}

- (id)domainForActionOperationLocator:(id)a3
{
  id v4 = a3;
  if ([v4 isProviderItem])
  {
    id v5 = [v4 asFPItem];

    BOOL v6 = [v5 itemID];
    uint64_t v7 = [(FPDExtensionManager *)self domainFromItemID:v6 reason:0];
  }
  else
  {
    id v5 = [v4 asURL];

    uint64_t v7 = [(FPDExtensionManager *)self domainForURL:v5 reason:0];
  }

  return v7;
}

- (id)domainsForAppBundleIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = self->_providersByIdentifier;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)self->_providersByIdentifier allValues];
  uint64_t v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v22)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v24 = v8;
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v11 = [v10 domainsByID];
        uint64_t v12 = [v11 allValues];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              long long v17 = [v10 providerDomainForDomain:v16];
              long long v18 = [v17 topLevelBundleIdentifier];
              int v19 = [v4 isEqualToString:v18];

              if (v19) {
                [v25 addObject:v16];
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v13);
        }

        uint64_t v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  return v25;
}

uint64_t __67__FPDExtensionManager_defaultProviderWithTopLevelBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  BOOL v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAppExtensionReachable])
  {
    id v3 = [v2 asAppExtensionBackedProvider];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setAlternateContentsURL:(id)a3 forItemID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    uint64_t v12 = [NSString stringWithFormat:@"[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"];
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager setAlternateContentsURL:forItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1147, (const char *)[v12 UTF8String]);
  }
  uint64_t v8 = v6;
  uint64_t v9 = alternateContentsURLDictionary;
  objc_sync_enter(v9);
  id v10 = [v8 providerID];
  if (v10)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_alternateContentsURLDictionary objectForKeyedSubscript:v10];
    if (!v11)
    {
      if (!v14) {
        goto LABEL_8;
      }
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_alternateContentsURLDictionary setObject:v11 forKeyedSubscript:v10];
    }
    [v11 setObject:v14 forKeyedSubscript:v8];
  }
  [(FPDExtensionManager *)self _serializeAlternateContentsURLDictionary:self->_alternateContentsURLDictionary];
LABEL_8:

  objc_sync_exit(v9);
}

- (id)alternateContentsURLForItemID:(id)a3
{
  id v4 = a3;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    uint64_t v13 = [NSString stringWithFormat:@"[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"];
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager alternateContentsURLForItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1168, (const char *)[v13 UTF8String]);
  }
  id v6 = v4;
  uint64_t v7 = alternateContentsURLDictionary;
  objc_sync_enter(v7);
  uint64_t v8 = self->_alternateContentsURLDictionary;
  uint64_t v9 = [v6 providerID];
  id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];

  objc_sync_exit(v7);
  return v11;
}

- (void)_loadAlternateContentsDictionary
{
  id v3 = [(FPDExtensionManager *)self _deserializedAlternateContentsDictionary];
  id v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  self->_alternateContentsURLDictionary = v4;
}

- (void)_serializeAlternateContentsURLDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v41;
    long long v33 = (void *)*MEMORY[0x1E4F25C00];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void *)(*((void *)&v40 + 1) + 8 * v4);
        uint64_t v32 = v4;
        id v5 = [obj objectForKeyedSubscript:v27];
        id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v37 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v13 = [v7 objectForKeyedSubscript:v12];
              id v14 = [v13 path];
              if (v14)
              {
                uint64_t v15 = [v12 domainIdentifier];
                uint64_t v16 = (void *)v15;
                long long v17 = v33;
                if (v15) {
                  long long v17 = (void *)v15;
                }
                long long v18 = v17;

                int v19 = [v6 objectForKeyedSubscript:v18];
                if (!v19)
                {
                  int v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
                  [v6 setObject:v19 forKeyedSubscript:v18];
                }
                uint64_t v20 = [v12 identifier];
                [v19 setObject:v14 forKeyedSubscript:v20];
              }
              else
              {
                long long v18 = fp_current_or_default_log();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v45 = v13;
                  _os_log_error_impl(&dword_1D744C000, v18, OS_LOG_TYPE_ERROR, "[ERROR] nil path for url %@", buf, 0xCu);
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v9);
        }

        [v28 setObject:v6 forKeyedSubscript:v31];
        uint64_t v4 = v32 + 1;
      }
      while (v32 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v29);
  }

  id v35 = 0;
  uint64_t v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v28 format:200 options:0 error:&v35];
  id v22 = v35;
  if (!v21)
  {
    long long v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:](v22);
    }
    goto LABEL_30;
  }
  uint64_t v23 = alternateContentsPlistURL();
  id v34 = v22;
  char v24 = [v21 writeToURL:v23 options:1 error:&v34];
  id v25 = v34;

  if ((v24 & 1) == 0)
  {
    long long v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:](v25);
    }
    id v22 = v25;
LABEL_30:

    id v25 = v22;
  }
}

- (id)_deserializedAlternateContentsDictionary
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v4 = alternateContentsPlistURL();
  id v62 = 0;
  id v5 = [v3 dataWithContentsOfURL:v4 options:0 error:&v62];
  id v6 = v62;

  if (v5)
  {
    id v61 = 0;
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v61];
    id v8 = v61;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v7 = v7;
      uint64_t v38 = [v7 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v38)
      {
        long long v33 = self;
        id v34 = v8;
        id obj = v7;
        char v46 = 0;
        id v35 = v5;
        uint64_t v36 = *(void *)v58;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v58 != v36)
            {
              uint64_t v10 = v9;
              objc_enumerationMutation(obj);
              uint64_t v9 = v10;
            }
            uint64_t v40 = v9;
            uint64_t v48 = *(void *)(*((void *)&v57 + 1) + 8 * v9);
            uint64_t v11 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:");
            v47 = objc_opt_new();
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v66 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v54;
              uint64_t v41 = *(void *)v54;
              id v42 = v12;
              do
              {
                uint64_t v16 = 0;
                uint64_t v43 = v14;
                do
                {
                  if (*(void *)v54 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * v16);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v18 = [v12 objectForKeyedSubscript:v17];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v44 = v18;
                      uint64_t v45 = v16;
                      long long v51 = 0u;
                      long long v52 = 0u;
                      long long v49 = 0u;
                      long long v50 = 0u;
                      id v19 = v18;
                      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v65 count:16];
                      if (v20)
                      {
                        uint64_t v21 = v20;
                        uint64_t v22 = *(void *)v50;
                        do
                        {
                          for (uint64_t i = 0; i != v21; ++i)
                          {
                            if (*(void *)v50 != v22) {
                              objc_enumerationMutation(v19);
                            }
                            uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v25 = [v19 objectForKeyedSubscript:v24];
                              long long v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v25];
                              uint64_t v27 = v26;
                              if (v26)
                              {
                                if ([v26 checkResourceIsReachableAndReturnError:0])
                                {
                                  long long v28 = [objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderID:v48 domainIdentifier:v17 itemIdentifier:v24];
                                  [v47 setObject:v27 forKeyedSubscript:v28];
                                }
                                else
                                {
                                  long long v28 = fp_current_or_default_log();
                                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    v64 = v27;
                                    _os_log_error_impl(&dword_1D744C000, v28, OS_LOG_TYPE_ERROR, "[ERROR] url is not reachable: %@, GC-ing the URL (iWork should have done it)", buf, 0xCu);
                                  }
                                  char v46 = 1;
                                }
                              }
                              else
                              {
                                long long v28 = fp_current_or_default_log();
                                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  v64 = v25;
                                  _os_log_error_impl(&dword_1D744C000, v28, OS_LOG_TYPE_ERROR, "[ERROR] nil url for path %@", buf, 0xCu);
                                }
                              }
                            }
                          }
                          uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v65 count:16];
                        }
                        while (v21);
                      }

                      uint64_t v15 = v41;
                      id v12 = v42;
                      uint64_t v14 = v43;
                      long long v18 = v44;
                      uint64_t v16 = v45;
                    }
                  }
                  ++v16;
                }
                while (v16 != v14);
                uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v66 count:16];
              }
              while (v14);
            }

            [v37 setObject:v47 forKeyedSubscript:v48];
            uint64_t v9 = v40 + 1;
          }
          while (v40 + 1 != v38);
          uint64_t v38 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
        }
        while (v38);
        id v7 = obj;

        id v8 = v34;
        if (v46) {
          [(FPDExtensionManager *)v33 _serializeAlternateContentsURLDictionary:v37];
        }
        id v5 = v35;
      }
      else
      {
      }
    }
    else
    {
      uint64_t v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[FPDExtensionManager _deserializedAlternateContentsDictionary](v8);
      }

      id v37 = 0;
    }
  }
  else
  {
    uint64_t v29 = [v6 domain];
    if ([v29 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v30 = [v6 code];

      if (v30 == 260)
      {
        id v37 = 0;
        goto LABEL_53;
      }
    }
    else
    {
    }
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _deserializedAlternateContentsDictionary](v6);
    }
    id v37 = 0;
    id v8 = v6;
  }

  id v6 = v8;
LABEL_53:

  return v37;
}

- (void)dropLegacyDaemonCoreSpotlightIndexIfNeeded
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] deleting all fileproviderd searchable items", v2, v3, v4, v5, v6);
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_3(v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_2();
    }

    uint64_t v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    CFPreferencesSetAppValue(@"com.apple.fileproviderd.did-drop-daemon-corespotlight-index", &unk_1F2EDBC70, @"com.apple.fileproviderd");
    if (!CFPreferencesAppSynchronize(@"com.apple.fileproviderd"))
    {
      uint8_t v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    objc_sync_exit(v5);
  }
}

- (id)clouddocsExtensionIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_providersByIdentifier keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (void)_loadPausedSyncItemsDictionary
{
  id v3 = [(FPDExtensionManager *)self _deserializedPausedSyncItemDictionary];
  uint64_t v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  self->_syncPausedItemsDictionary = v4;
}

- (void)_serializePausedSyncItemsDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v40;
    uint64_t v4 = (void *)*MEMORY[0x1E4F25C00];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * v5);
        uint64_t v32 = v5;
        uint64_t v6 = [obj objectForKeyedSubscript:v27];
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v36 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              long long v14 = [v8 objectForKeyedSubscript:v13];
              if (v14)
              {
                uint64_t v15 = [v13 domainIdentifier];
                uint64_t v16 = (void *)v15;
                if (v15) {
                  uint64_t v17 = (void *)v15;
                }
                else {
                  uint64_t v17 = v4;
                }
                long long v18 = v17;

                id v19 = [v7 objectForKeyedSubscript:v18];
                if (!v19)
                {
                  id v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
                  [v7 setObject:v19 forKeyedSubscript:v18];
                }
                uint64_t v20 = [v13 identifier];
                [v19 setObject:v14 forKeyedSubscript:v20];
              }
              else
              {
                long long v18 = fp_current_or_default_log();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v44 = v13;
                  _os_log_error_impl(&dword_1D744C000, v18, OS_LOG_TYPE_ERROR, "[ERROR] nil bundleID for itemID %@", buf, 0xCu);
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v10);
        }

        [v28 setObject:v7 forKeyedSubscript:v31];
        uint64_t v5 = v32 + 1;
      }
      while (v32 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v29);
  }

  id v34 = 0;
  uint64_t v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v28 format:200 options:0 error:&v34];
  id v22 = v34;
  if (!v21)
  {
    long long v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:](v22);
    }
    goto LABEL_31;
  }
  uint64_t v23 = pausedSyncItemslistURL();
  id v33 = v22;
  char v24 = [v21 writeToURL:v23 options:1 error:&v33];
  id v25 = v33;

  if ((v24 & 1) == 0)
  {
    long long v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _serializePausedSyncItemsDictionary:](v25);
    }
    id v22 = v25;
LABEL_31:

    id v25 = v22;
  }
}

- (id)_deserializedPausedSyncItemDictionary
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v4 = pausedSyncItemslistURL();
  id v59 = 0;
  uint64_t v5 = [v3 dataWithContentsOfURL:v4 options:0 error:&v59];
  id v6 = v59;

  if (v5)
  {
    id v58 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v58];
    id v8 = v58;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v7 = v7;
      uint64_t v37 = [v7 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v37)
      {
        id v33 = self;
        id v34 = v5;
        char v9 = 0;
        uint64_t v35 = *(void *)v55;
        id obj = v7;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v55 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = v10;
            uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * v10);
            long long v12 = [obj objectForKeyedSubscript:v11];
            uint64_t v45 = objc_opt_new();
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v63 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v51;
              uint64_t v40 = *(void *)v51;
              id v41 = v13;
              do
              {
                uint64_t v17 = 0;
                uint64_t v42 = v15;
                do
                {
                  if (*(void *)v51 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * v17);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v19 = [v13 objectForKeyedSubscript:v18];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v43 = v19;
                      uint64_t v44 = v17;
                      long long v48 = 0u;
                      long long v49 = 0u;
                      long long v46 = 0u;
                      long long v47 = 0u;
                      id v20 = v19;
                      uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v62 count:16];
                      if (v21)
                      {
                        uint64_t v22 = v21;
                        uint64_t v23 = *(void *)v47;
                        do
                        {
                          for (uint64_t i = 0; i != v22; ++i)
                          {
                            if (*(void *)v47 != v23) {
                              objc_enumerationMutation(v20);
                            }
                            uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderID:v11 domainIdentifier:v18 itemIdentifier:v25];
                              uint64_t v27 = [v20 objectForKeyedSubscript:v25];
                              if (v27)
                              {
                                [v45 setObject:v27 forKeyedSubscript:v26];
                              }
                              else
                              {
                                long long v28 = fp_current_or_default_log();
                                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  id v61 = v26;
                                  _os_log_error_impl(&dword_1D744C000, v28, OS_LOG_TYPE_ERROR, "[ERROR] nil bundleID for itemID %@", buf, 0xCu);
                                }

                                char v9 = 1;
                              }
                            }
                          }
                          uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v62 count:16];
                        }
                        while (v22);
                      }

                      uint64_t v16 = v40;
                      id v13 = v41;
                      uint64_t v15 = v42;
                      id v19 = v43;
                      uint64_t v17 = v44;
                    }
                  }
                  ++v17;
                }
                while (v17 != v15);
                uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v63 count:16];
              }
              while (v15);
            }

            [v36 setObject:v45 forKeyedSubscript:v11];
            uint64_t v10 = v39 + 1;
          }
          while (v39 + 1 != v37);
          uint64_t v7 = obj;
          uint64_t v37 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
        }
        while (v37);

        if (v9) {
          [(FPDExtensionManager *)v33 _serializePausedSyncItemsDictionary:v36];
        }
        uint64_t v5 = v34;
      }
      else
      {
      }
    }
    else
    {
      uint64_t v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[FPDExtensionManager _deserializedAlternateContentsDictionary](v8);
      }

      id v36 = 0;
    }
  }
  else
  {
    uint64_t v29 = [v6 domain];
    if ([v29 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v30 = [v6 code];

      if (v30 == 260)
      {
        id v36 = 0;
        goto LABEL_50;
      }
    }
    else
    {
    }
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionManager _deserializedAlternateContentsDictionary](v6);
    }
    id v36 = 0;
    id v8 = v6;
  }

  id v6 = v8;
LABEL_50:

  return v36;
}

- (void)setPausedSyncItemID:(id)a3 forBundleID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    uint64_t v18 = [NSString stringWithFormat:@"[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"];
    id v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager setPausedSyncItemID:forBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1485, (const char *)[v18 UTF8String]);
  }
  char v9 = v7;
  id obj = syncPausedItemsDictionary;
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 providerID];
        if (v15)
        {
          uint64_t v16 = [(NSMutableDictionary *)self->_syncPausedItemsDictionary objectForKeyedSubscript:v15];
          if (!v16)
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
            [(NSMutableDictionary *)self->_syncPausedItemsDictionary setObject:v16 forKeyedSubscript:v15];
          }
          uint64_t v17 = [v16 objectForKeyedSubscript:v14];
          if (v17)
          {

            goto LABEL_16;
          }
          [v16 setObject:v9 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [(FPDExtensionManager *)self _serializePausedSyncItemsDictionary:self->_syncPausedItemsDictionary];
LABEL_16:
  objc_sync_exit(obj);
}

- (void)removePausedSyncItemID:(id)a3 forBundleID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    id v19 = [NSString stringWithFormat:@"[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"];
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager removePausedSyncItemID:forBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1510, (const char *)[v19 UTF8String]);
  }
  char v9 = v7;
  id obj = syncPausedItemsDictionary;
  objc_sync_enter(obj);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [v14 providerID];
        if (v15)
        {
          uint64_t v16 = [(NSMutableDictionary *)self->_syncPausedItemsDictionary objectForKeyedSubscript:v15];
          uint64_t v17 = v16;
          if (v16)
          {
            uint64_t v18 = [v16 objectForKeyedSubscript:v14];
            if ([v18 isEqualToString:v9]) {
              [v17 setObject:0 forKeyedSubscript:v14];
            }
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  [(FPDExtensionManager *)self _serializePausedSyncItemsDictionary:self->_syncPausedItemsDictionary];
  objc_sync_exit(obj);
}

- (id)syncPausedBundleIDForItemID:(id)a3
{
  id v4 = a3;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    id v13 = [NSString stringWithFormat:@"[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"];
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager syncPausedBundleIDForItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1530, (const char *)[v13 UTF8String]);
  }
  id v6 = v4;
  id v7 = syncPausedItemsDictionary;
  objc_sync_enter(v7);
  id v8 = self->_syncPausedItemsDictionary;
  char v9 = [v6 providerID];
  id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];

  objc_sync_exit(v7);
  return v11;
}

- (id)syncPausedFilesForBundleID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_syncPausedItemsDictionary)
  {
    uint64_t v15 = [NSString stringWithFormat:@"[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"];
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionManager syncPausedFilesForBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1538, (const char *)[v15 UTF8String]);
  }
  uint64_t v5 = v4;
  id v6 = objc_opt_new();
  id obj = self->_syncPausedItemsDictionary;
  objc_sync_enter(obj);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(NSMutableDictionary *)self->_syncPausedItemsDictionary allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_syncPausedItemsDictionary objectForKeyedSubscript:v11];
        id v13 = [v12 allKeysForObject:v5];
        if (v13) {
          [v6 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v6;
}

- (void)setServer:(id)a3
{
}

- (FPDPushConnection)pushConnection
{
  return self->_pushConnection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_syncPausedItemsDictionary, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_sessionQueueForExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateContentsURLDictionary, 0);
  objc_storeStrong((id *)&self->_providerUUIDs, 0);
  objc_storeStrong((id *)&self->_apSubscription, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_providersByIdentifier, 0);
}

- (void)garbageCollectDomainsExceptIdentifiers:(uint64_t)a3 fromDirectory:(NSObject *)a4 isUserData:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, a4, a3, "[DEBUG] ┏%llx garbage collecting in %@", (uint8_t *)a2);
}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted all searchable items for %{public}@", (uint8_t *)&v3, 0xCu);
}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Not garbage collecting the domains yet", v2, v3, v4, v5, v6);
}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, v0, (uint64_t)v0, "[DEBUG] ┏%llx updating provider list: %@", v1);
}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, v0, (uint64_t)v0, "[DEBUG] ┏%llx received an error after initial load of extensions; %@",
    v1);
}

- (void)appProtectionSubjectsChanged:forSubscription:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] app protection settings changed, but no file provider app involved", v2, v3, v4, v5, v6);
}

void __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_45_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] app protection settings changed, refreshing all providers", v2, v3, v4, v5, v6);
}

- (void)migrateEnabledStateIfNecessary:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Couldn't create marker for legacy state migration: %@", v4, v5, v6, v7, v8);
}

- (void)uniquedExtensions:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D744C000, a4, OS_LOG_TYPE_ERROR, "[ERROR] ignoring extension without File Provider Storage URL: %@", a1, 0xCu);
}

- (void)_domainForURL:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "fp_shortDescription");
  int v7 = 138412546;
  uint8_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = [a2 count];
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, a3, v6, "[DEBUG] testing if %@ is in our %lu registered file providers: it's not", (uint8_t *)&v7);
}

- (void)_serializeAlternateContentsURLDictionary:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] failed to create plist data from dictionary: %@", v4, v5, v6, v7, v8);
}

- (void)_serializeAlternateContentsURLDictionary:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = alternateContentsPlistURL();
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v4, v5, "[ERROR] failed to write _alternateContentsURLDictionary to URL %@: %@", v6, v7, v8, v9, v10);
}

- (void)_deserializedAlternateContentsDictionary
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] nil serialized dictionary: %@", v4, v5, v6, v7, v8);
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] deleted all fileproviderd searchable items", v2, v3, v4, v5, v6);
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_3(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] failed to delete all fileproviderd searchable items: %@", v4, v5, v6, v7, v8);
}

- (void)_serializePausedSyncItemsDictionary:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = pausedSyncItemslistURL();
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v4, v5, "[ERROR] failed to write _pausedSyncItemsDictionary to URL %@: %@", v6, v7, v8, v9, v10);
}

@end