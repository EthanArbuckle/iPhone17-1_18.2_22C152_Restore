@interface NSFileProviderManager
+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 knownFolders:(id)a6 error:(id *)a7;
+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)checkDomainsCanBeStored:(BOOL *)a3 onVolumeAtURL:(id)a4 unsupportedReason:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)fileProviderReadyForBackupOrMigrationForSourceURL:(id)a3 error:(id *)a4;
+ (BOOL)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 error:(id *)a6;
+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSFileProviderItem)metadata error:(NSError *)error;
+ (BOOL)writePlaceholderAtURL:(id)a3 withDictionary:(id)a4 error:(id *)a5;
+ (NSFileProviderManager)legacyDefaultManager;
+ (NSFileProviderManager)managerForDomain:(NSFileProviderDomain *)domain;
+ (NSFileProviderManager)managerWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5;
+ (NSURL)placeholderURLForURL:(NSURL *)url;
+ (id)resolvableErrorCodes;
+ (void)_registerNotificationsForProviderIdentifier:(id)a3;
+ (void)addDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler;
+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 completionHandler:(id)a8;
+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 synchronous:(BOOL)a8 completionHandler:(id)a9;
+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6;
+ (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5;
+ (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)getDomainsWithCompletionHandler:(void *)completionHandler;
+ (void)getIdentifierForUserVisibleFileAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
+ (void)importDomain:(NSFileProviderDomain *)domain fromDirectoryAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 completionHandler:(id)a6;
+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 knownFolders:(id)a6 completionHandler:(id)a7;
+ (void)registerDomainServicer:(id)a3 forDomain:(id)a4;
+ (void)registerRootURL:(id)a3 forDomain:(id)a4;
+ (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)removeAllDomainsWithCompletionHandler:(void *)completionHandler;
+ (void)removeDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler;
+ (void)removeDomain:(NSFileProviderDomain *)domain mode:(NSFileProviderDomainRemovalMode)mode completionHandler:(void *)completionHandler;
+ (void)removeDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5;
- (BOOL)isErrorSupportedForSignalResolved:(id)a3;
- (BOOL)removeDomain:(id)a3 options:(int64_t)a4 preservedLocation:(id *)a5 error:(id *)a6;
- (NSArray)listAvailableTestingOperationsWithError:(NSError *)error;
- (NSArray)presentedFiles;
- (NSDictionary)runTestingOperations:(NSArray *)operations error:(NSError *)error;
- (NSProgress)globalProgressForKind:(NSProgressFileOperationKind)kind;
- (NSString)providerIdentifier;
- (NSURL)documentStorageURL;
- (NSURL)temporaryDirectoryURLWithError:(NSError *)error;
- (id)_connection;
- (id)_initWithProviderIdentifier:(id)a3;
- (id)_initWithProviderIdentifier:(id)a3 domain:(id)a4;
- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4;
- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5;
- (id)_test_existingProgressForKind:(id)a3;
- (id)description;
- (id)enumeratorForMaterializedItems;
- (id)enumeratorForPendingItems;
- (id)itemIDForIdentifier:(id)a3;
- (id)providerDomainID;
- (id)startObservingGlobalProgressForKind:(id)a3;
- (id)stateDirectoryURLWithError:(id *)a3;
- (void)_cacheProviderInfo;
- (void)_callCompletionHandlers:(id)a3 error:(id)a4;
- (void)_failToSignalPendingChangesWithError:(id)a3 completionHandlersByItemID:(id)a4;
- (void)_fetchDomainServicer:(id)a3 forProviderDomainID:(id)a4 handler:(id)a5;
- (void)_signalPendingEnumerators;
- (void)addDomain:(id)a3 completionHandler:(id)a4;
- (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5;
- (void)claimKnownFolders:(id)a3 localizedReason:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5;
- (void)disconnectWithReason:(NSString *)localizedReason options:(NSFileProviderManagerDisconnectionOptions)options completionHandler:(void *)completionHandler;
- (void)domainServicerWithCompletionHandler:(id)a3;
- (void)evictItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)fetchDomainServicerSynchronously:(BOOL)a3 useOutgoingConnection:(BOOL)a4 completionHandler:(id)a5;
- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4;
- (void)getDomainsWithCompletionHandler:(id)a3;
- (void)getServiceWithName:(NSFileProviderServiceName)serviceName itemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)getUserVisibleURLForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5;
- (void)lookupRequestingApplicationIdentifier:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)reconnectWithCompletionHandler:(void *)completionHandler;
- (void)registerURLSessionTask:(NSURLSessionTask *)task forItemWithIdentifier:(NSFileProviderItemIdentifier)identifier completionHandler:(void *)completion;
- (void)reimportItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)releaseKnownFolders:(unint64_t)a3 localizedReason:(id)a4 completionHandler:(id)a5;
- (void)removeAllDomainsWithCompletionHandler:(id)a3;
- (void)removeDomain:(id)a3 completionHandler:(id)a4;
- (void)removeDomain:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)requestDownloadForItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier requestedRange:(NSRange)rangeToMaterialize completionHandler:(void *)completionHandler;
- (void)requestModificationOfFields:(NSFileProviderItemFields)fields forItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier options:(NSFileProviderModifyItemOptions)options completionHandler:(void *)completionHandler;
- (void)setEjectable:(BOOL)a3 completionHandler:(id)a4;
- (void)setPresentedFiles:(id)a3;
- (void)signalEnumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier completionHandler:(void *)completion;
- (void)signalErrorResolved:(NSError *)error completionHandler:(void *)completionHandler;
- (void)startObservingDownloadProgress;
- (void)startObservingUploadProgress;
- (void)waitForChangesOnItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)waitForSignalDeliveryWithCompletionHandler:(id)a3;
- (void)waitForStabilizationWithCompletionHandler:(void *)completionHandler;
@end

@implementation NSFileProviderManager

+ (void)_registerNotificationsForProviderIdentifier:(id)a3
{
  id v4 = a3;
  if (_registerNotificationsForProviderIdentifier__onceToken != -1) {
    dispatch_once(&_registerNotificationsForProviderIdentifier__onceToken, &__block_literal_global_144);
  }
  id v5 = a1;
  objc_sync_enter(v5);
  if (([(id)_registerNotificationsForProviderIdentifier__registeredNotificationDomains containsObject:v4] & 1) == 0)
  {
    v6 = [NSString stringWithFormat:@"%@.pendingSetChanged", v4];
    int out_token = 0;
    objc_msgSend(v6, "fp_libnotifyPerUserNotificationName");
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];
    v9 = _registerNotificationsForProviderIdentifier__setNotificationQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_2;
    handler[3] = &unk_1E5AF58F8;
    id v10 = v4;
    id v19 = v10;
    notify_register_dispatch(v8, &out_token, v9, handler);

    v11 = [NSString stringWithFormat:@"%@.materializedSetChanged", v10];
    objc_msgSend(v11, "fp_libnotifyPerUserNotificationName");
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = _registerNotificationsForProviderIdentifier__setNotificationQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_3;
    v16[3] = &unk_1E5AF58F8;
    id v15 = v10;
    id v17 = v15;
    notify_register_dispatch(v13, &out_token, v14, v16);

    [(id)_registerNotificationsForProviderIdentifier__registeredNotificationDomains addObject:v15];
  }
  objc_sync_exit(v5);
}

+ (void)registerRootURL:(id)a3 forDomain:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (createCaches_onceToken != -1) {
    dispatch_once(&createCaches_onceToken, &__block_literal_global_635);
  }
  id v6 = (id)rootURLByDomain;
  objc_sync_enter(v6);
  id v7 = (void *)rootURLByDomain;
  uint64_t v8 = [v5 identifier];
  v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"NSFileProviderDomainDefaultIdentifier";
  }
  [v7 setObject:v11 forKey:v10];

  objc_sync_exit(v6);
}

+ (void)registerDomainServicer:(id)a3 forDomain:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (createCaches_onceToken != -1) {
    dispatch_once(&createCaches_onceToken, &__block_literal_global_635);
  }
  id v6 = (id)domainServicerByDomain;
  objc_sync_enter(v6);
  id v7 = (void *)domainServicerByDomain;
  uint64_t v8 = [v5 identifier];
  v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"NSFileProviderDomainDefaultIdentifier";
  }
  [v7 setObject:v11 forKey:v10];

  objc_sync_exit(v6);
}

void __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _signalPendingEnumerators];
}

- (void)_signalPendingEnumerators
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┏%llx sending enumerator signals to daemon for domain %@");
}

- (void)fetchDomainServicerSynchronously:(BOOL)a3 useOutgoingConnection:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v49 = a4;
  BOOL v5 = a3;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (!v8->_providerIdentifier) {
    [(NSFileProviderManager *)v8 _cacheProviderInfo];
  }
  objc_sync_exit(v8);

  v9 = NSString;
  id v10 = [(NSFileProviderDomain *)v8->_domain identifier];
  uint64_t v11 = objc_msgSend(v10, "fp_obfuscatedFilename");
  id v12 = (void *)v11;
  v13 = @"NSFileProviderDomainDefaultIdentifier";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = [v9 stringWithFormat:@"domain servicer for %@", v13];

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke;
  v67[3] = &unk_1E5AF0D78;
  v67[4] = v8;
  id v15 = v7;
  id v69 = v15;
  id v16 = v14;
  id v68 = v16;
  v53 = (void (**)(void, void))MEMORY[0x1A6248B00](v67);
  if (v8->_providerIdentifier)
  {
    id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
    v50 = [v17 currentPersona];

    id v66 = 0;
    v51 = [v50 userPersonaUniqueString];
    v18 = [(NSFileProviderDomain *)v8->_domain personaIdentifier];
    if (v51 == v18)
    {
      v52 = 0;
      v26 = v51;
    }
    else
    {
      id v19 = [(NSFileProviderDomain *)v8->_domain personaIdentifier];
      char v20 = [v51 isEqualToString:v19];

      if ((v20 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
        goto LABEL_17;
      }
      id v65 = 0;
      v21 = (void *)[v50 copyCurrentPersonaContextWithError:&v65];
      id v22 = v65;
      id v23 = v66;
      id v66 = v21;

      if (v22)
      {
        v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
        }
      }
      v25 = [(NSFileProviderDomain *)v8->_domain personaIdentifier];
      v52 = [v50 generateAndRestorePersonaContextWithPersonaUniqueString:v25];

      if (!v52)
      {
LABEL_17:
        v52 = 0;
        goto LABEL_20;
      }
      v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [(NSFileProviderDomain *)v8->_domain personaIdentifier];
        -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](v27, (uint64_t)v52, (uint64_t)v70);
      }
    }

LABEL_20:
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 1;
    v28 = v8;
    objc_sync_enter(v28);
    v29 = v28->_remoteFileProvider;
    BOOL isIncomingConnection = v28->_isIncomingConnection;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      if (createCaches_onceToken != -1) {
        dispatch_once(&createCaches_onceToken, &__block_literal_global_635);
      }
      uint64_t v32 = [(NSFileProviderDomain *)v8->_domain identifier];
      v33 = (void *)v32;
      v34 = @"NSFileProviderDomainDefaultIdentifier";
      if (v32) {
        v34 = (__CFString *)v32;
      }
      v35 = v34;

      id v36 = (id)domainServicerByDomain;
      objc_sync_enter(v36);
      v31 = [(id)domainServicerByDomain objectForKey:v35];
      objc_sync_exit(v36);

      BOOL isIncomingConnection = 1;
    }
    objc_sync_exit(v28);

    if (v31)
    {
      if (!isIncomingConnection || !v49)
      {
        if (v15) {
          (*((void (**)(id, void *))v15 + 2))(v15, v31);
        }
        goto LABEL_41;
      }
      v37 = fp_current_or_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A33AE000, v37, OS_LOG_TYPE_INFO, "[INFO] forcing creation of a new connection to the daemon", buf, 2u);
      }

      *((unsigned char *)v62 + 24) = 0;
    }
    v38 = [(NSFileProviderManager *)v28 _connection];
    v39 = v38;
    if (v5) {
      [v38 synchronousRemoteObjectProxyWithErrorHandler:v53];
    }
    else {
    v40 = [v38 remoteObjectProxyWithErrorHandler:v53];
    }
    v41 = v16;
    v42 = NSString;
    providerIdentifier = v8->_providerIdentifier;
    uint64_t v44 = [(NSFileProviderDomain *)v8->_domain identifier];
    v45 = (void *)v44;
    if (v44) {
      v46 = (__CFString *)v44;
    }
    else {
      v46 = @"NSFileProviderDomainDefaultIdentifier";
    }
    v47 = objc_msgSend(v42, "fp_providerDomainIDFromProviderID:domainIdentifier:", providerIdentifier, v46);

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140;
    v54[3] = &unk_1E5AF58D0;
    v54[4] = v28;
    v58 = &v61;
    id v16 = v41;
    id v55 = v41;
    id v48 = v39;
    id v56 = v48;
    BOOL v59 = v49;
    id v57 = v15;
    [(NSFileProviderManager *)v28 _fetchDomainServicer:v40 forProviderDomainID:v47 handler:v54];

LABEL_41:
    _Block_object_dispose(&v61, 8);

    _FPRestorePersona(&v66);
    goto LABEL_42;
  }
  v52 = FPProviderNotRegistered(0, 0);
  ((void (**)(void, void *))v53)[2](v53, v52);
LABEL_42:
}

void __50__NSFileProviderManager__signalPendingEnumerators__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allKeys];
  v14 = v3;
  BOOL v5 = [v3 synchronousRemoteObjectProxy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        id v12 = fp_current_or_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v10;
          __int16 v24 = 2112;
          v25 = v5;
          _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] sending signal for %@ on %@", buf, 0x16u);
        }

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __50__NSFileProviderManager__signalPendingEnumerators__block_invoke_170;
        v16[3] = &unk_1E5AF4698;
        void v16[4] = *(void *)(a1 + 40);
        id v17 = v11;
        id v13 = v11;
        [v5 didChangeItemID:v10 completionHandler:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)_fetchDomainServicer:(id)a3 forProviderDomainID:(id)a4 handler:(id)a5
{
}

- (id)_connection
{
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    id v4 = connection;
  }
  else
  {
    BOOL v5 = objc_opt_new();
    uint64_t v6 = (void *)[v5 newXPCConnection];

    id location = 0;
    objc_initWeak(&location, v2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __36__NSFileProviderManager__connection__block_invoke;
    v16[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v17, &location);
    [v6 setInvalidationHandler:v16];
    id from = 0;
    objc_initWeak(&from, v6);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __36__NSFileProviderManager__connection__block_invoke_156;
    id v13 = &unk_1E5AF06C8;
    objc_copyWeak(&v14, &from);
    [v6 setInterruptionHandler:&v10];
    objc_msgSend(v6, "resume", v10, v11, v12, v13);
    uint64_t v7 = v2->_connection;
    v2->_connection = (FPDDaemon *)v6;
    id v8 = v6;

    id v4 = v2->_connection;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v4;
}

uint64_t __50__NSFileProviderManager__signalPendingEnumerators__block_invoke_170(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _callCompletionHandlers:*(void *)(a1 + 40) error:a2];
}

- (void)addDomain:(id)a3 completionHandler:(id)a4
{
}

+ (NSFileProviderManager)legacyDefaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSFileProviderManager_legacyDefaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (legacyDefaultManager_onceToken != -1) {
    dispatch_once(&legacyDefaultManager_onceToken, block);
  }
  v2 = (void *)legacyDefaultManager__defaultManager;

  return (NSFileProviderManager *)v2;
}

- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4
{
  return [(NSFileProviderManager *)self _initWithProviderIdentifier:a3 groupName:a4 domain:0];
}

- (void)_callCompletionHandlers:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_signalUpdateQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

void __86__NSFileProviderManager_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);

  dispatch_group_leave(v3);
}

- (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = [(NSFileProviderManager *)self providerIdentifier];
  [v10 addDomain:v9 forProviderIdentifier:v11 byImportingDirectoryAtURL:0 userAllowedDBDrop:v5 knownFolders:MEMORY[0x1E4F1CBF0] completionHandler:v8];
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 completionHandler:(id)a8
{
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 synchronous:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  long long v19 = (void (**)(id, id))a9;
  if (dyld_program_sdk_at_least())
  {
    BOOL v34 = a8;
    id v20 = a1;
    BOOL v21 = v11;
    id v22 = [v15 identifier];
    id v43 = 0;
    char v23 = objc_msgSend(v22, "fp_isValidDomainIdentifierWithError:", &v43);
    id v24 = v43;

    if ((v23 & 1) == 0)
    {
LABEL_9:
      v19[2](v19, v24);
      goto LABEL_10;
    }

    BOOL v11 = v21;
    a1 = v20;
    a8 = v34;
  }
  if ([v18 count])
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Known folders are not supported outside of macOS", buf, 2u);
    }

    uint64_t v26 = FPNotSupportedError();
LABEL_8:
    id v24 = (id)v26;
    goto LABEL_9;
  }
  uint64_t v27 = [v15 identifier];
  uint64_t v28 = [v27 length];

  if (!v28)
  {
    v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Domain identifier may not be empty.", buf, 2u);
    }

    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Domain identifier may not be empty.");
    goto LABEL_8;
  }
  BOOL v33 = v11;
  if (v17)
  {
    uint64_t v41 = 0;
    id v24 = +[FPSandboxingURLWrapper wrapperWithURL:v17 readonly:0 error:&v41];
    if (v24)
    {

      id v17 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }
  v30 = [MEMORY[0x1E4FB3700] currentPersona];
  v31 = [v30 userPersonaUniqueString];

  if (a8) {
    +[FPDaemonConnection synchronousSharedConnectionProxy];
  }
  else {
  v35 = +[FPDaemonConnection sharedConnectionProxy];
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke;
  v36[3] = &unk_1E5AF5B48;
  id v37 = v31;
  id v38 = v15;
  id v40 = a1;
  v39 = v19;
  id v32 = v31;
  [v35 addDomain:v38 forProviderIdentifier:v16 byImportingDirectoryAtURL:v24 nonWrappedURL:v17 userAllowedDBDrop:v33 knownFolders:v18 completionHandler:v36];

LABEL_10:
}

- (void)signalEnumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier completionHandler:(void *)completion
{
  id v6 = containerItemIdentifier;
  id v7 = completion;
  id v8 = [(NSFileProviderManager *)self itemIDForIdentifier:v6];
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderManager signalEnumeratorForContainerItemIdentifier:completionHandler:]();
  }

  uint64_t v10 = self;
  objc_sync_enter(v10);
  BOOL v11 = [(NSMutableDictionary *)v10->_completionHandlersByItemID objectForKeyedSubscript:v8];
  if (!v11)
  {
    BOOL v11 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)v10->_completionHandlersByItemID setObject:v11 forKeyedSubscript:v8];
  }
  dispatch_group_enter((dispatch_group_t)v10->_signalUpdateGroup);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __86__NSFileProviderManager_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke;
  id v17 = &unk_1E5AF0800;
  id v18 = v10;
  id v12 = v7;
  id v19 = v12;
  long long v13 = (void *)MEMORY[0x1A6248B00](&v14);
  objc_msgSend(v11, "addObject:", v13, v14, v15, v16, v17, v18);

  objc_sync_exit(v10);
  dispatch_source_merge_data((dispatch_source_t)v10->_signalUpdateSource, 1uLL);
}

- (id)itemIDForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [FPItemID alloc];
  id v6 = [(NSFileProviderManager *)self providerIdentifier];
  uint64_t v7 = [(NSFileProviderDomain *)self->_domain identifier];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = @"NSFileProviderDomainDefaultIdentifier";
  }
  uint64_t v10 = [(FPItemID *)v5 initWithProviderID:v6 domainIdentifier:v9 itemIdentifier:v4];

  return v10;
}

- (NSString)providerIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  providerIdentifier = v2->_providerIdentifier;
  if (!providerIdentifier)
  {
    [(NSFileProviderManager *)v2 _cacheProviderInfo];
    providerIdentifier = v2->_providerIdentifier;
  }
  id v4 = providerIdentifier;
  objc_sync_exit(v2);

  return v4;
}

- (void)setPresentedFiles:(id)a3
{
}

uint64_t __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke()
{
  fileProviderManagerByDomain = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];

  return MEMORY[0x1F41817F8]();
}

- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (_initWithProviderIdentifier_groupName_domain__onceToken != -1) {
    dispatch_once(&_initWithProviderIdentifier_groupName_domain__onceToken, &__block_literal_global_52);
  }
  id v12 = NSString;
  uint64_t v13 = [v11 identifier];
  uint64_t v14 = (void *)v13;
  if (v9 | v10) {
    [v12 stringWithFormat:@"%@;%@;%@", v9, v10, v13];
  }
  else {
  uint64_t v15 = [v12 stringWithFormat:@"%@", v13, v41, v42];
  }

  id v16 = (id)fileProviderManagerByDomain;
  objc_sync_enter(v16);
  id v17 = [(id)fileProviderManagerByDomain objectForKey:v15];
  objc_sync_exit(v16);

  if (!v17)
  {
    v46.receiver = self;
    v46.super_class = (Class)NSFileProviderManager;
    id v18 = [(NSFileProviderManager *)&v46 init];
    self = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_domain, a5);
      objc_storeStrong((id *)&self->_providerIdentifier, a3);
      objc_storeStrong((id *)&self->_groupName, a4);
      id v19 = (_FPFilePresenterObserver *)objc_opt_new();
      presentedFileObserver = self->_presentedFileObserver;
      self->_presentedFileObserver = v19;

      [(_FPFilePresenterObserver *)self->_presentedFileObserver setParentConnection:self];
      [(NSFileProviderManager *)self domainServicerWithCompletionHandler:&__block_literal_global_72];
      BOOL v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v22 = (OS_dispatch_queue *)dispatch_queue_create("FPM-SignalUpdateQueue", v21);
      signalUpdateQueue = self->_signalUpdateQueue;
      self->_signalUpdateQueue = v22;

      id v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)self->_signalUpdateQueue);
      signalUpdateSource = self->_signalUpdateSource;
      self->_signalUpdateSource = v24;

      uint64_t v26 = (OS_dispatch_group *)dispatch_group_create();
      signalUpdateGroup = self->_signalUpdateGroup;
      self->_signalUpdateGroup = v26;

      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v28 = self->_signalUpdateSource;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke_3;
      block[3] = &unk_1E5AF06C8;
      objc_copyWeak(&v44, &location);
      v29 = v28;
      dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
      dispatch_source_set_event_handler(v29, v30);

      dispatch_resume((dispatch_object_t)self->_signalUpdateSource);
      v31 = [MEMORY[0x1E4F1CA60] dictionary];
      completionHandlersByItemID = self->_completionHandlersByItemID;
      self->_completionHandlersByItemID = v31;

      BOOL v33 = objc_alloc_init(FPProgressUpdater);
      uploadProxy = self->_uploadProxy;
      self->_uploadProxy = v33;

      v35 = objc_alloc_init(FPProgressUpdater);
      downloadProxy = self->_downloadProxy;
      self->_downloadProxy = v35;

      [(FPProgressUpdater *)self->_uploadProxy setProgress:0];
      [(FPProgressUpdater *)self->_downloadProxy setProgress:0];
      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
    id v37 = (id)fileProviderManagerByDomain;
    objc_sync_enter(v37);
    id v38 = [(id)fileProviderManagerByDomain objectForKey:v15];
    id v17 = v38;
    if (v38) {
      id v39 = v38;
    }
    else {
      [(id)fileProviderManagerByDomain setObject:self forKey:v15];
    }

    objc_sync_exit(v37);
    if (!v17)
    {
      self = self;
      id v17 = self;
    }
  }

  return v17;
}

- (void)domainServicerWithCompletionHandler:(id)a3
{
  [(NSFileProviderManager *)self fetchDomainServicerSynchronously:a3 == 0 useOutgoingConnection:0 completionHandler:a3];
}

void __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "fp_isFileProviderInternalError:", 3))
  {
    uint64_t v7 = [v6 userInfo];
    id v8 = [v7 objectForKey:@"parameter"];
    int v9 = [v8 isEqual:@"currentPersona"];

    if (v9)
    {
      unint64_t v10 = [v6 userInfo];
      id v11 = [v10 objectForKey:@"actual"];

      id v12 = [v6 userInfo];
      uint64_t v13 = [v12 objectForKey:@"expected"];

      char v14 = [*(id *)(a1 + 32) isEqual:v11];
      uint64_t v15 = fp_current_or_default_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);
      if (v14)
      {
        if (v16)
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v21 = 138412802;
          id v22 = v11;
          __int16 v23 = 2112;
          id v24 = v13;
          __int16 v25 = 2112;
          uint64_t v26 = v17;
          _os_log_fault_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Called addDomain with an invalid persona; actual persona was %@, expected %@. Caller persona was %@.",
            (uint8_t *)&v21,
            0x20u);
        }
      }
      else if (v16)
      {
        __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke_cold_1();
      }
    }
  }
  if (v5)
  {
    id v18 = NSString;
    id v19 = [*(id *)(a1 + 40) identifier];
    id v20 = objc_msgSend(v18, "fp_providerDomainIDFromProviderID:domainIdentifier:", v5, v19);

    [*(id *)(a1 + 56) _registerNotificationsForProviderIdentifier:v20];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSURL)documentStorageURL
{
  id v3 = self;
  objc_sync_enter(v3);
  documentStorageURL = v3->_documentStorageURL;
  if (!documentStorageURL)
  {
    [(NSFileProviderManager *)v3 _cacheProviderInfo];
    documentStorageURL = v3->_documentStorageURL;
    if (!documentStorageURL)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, v3, @"NSFileProviderManager.m", 923, @"%@: documentStorageURL is not set. Extension may be missing %@ key, or current process may be missing necessary entitlements to access the specified container.", objc_opt_class(), @"NSExtensionFileProviderDocumentGroup" object file lineNumber description];

      documentStorageURL = v3->_documentStorageURL;
    }
  }
  id v5 = documentStorageURL;
  objc_sync_exit(v3);

  return v5;
}

- (void)_cacheProviderInfo
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] Could not look up containing app bundle (%{public}@).", v2, v3, v4, v5, v6);
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
    id v12 = fp_current_or_default_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v13) {
        __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_3(a1 + 32, v10, v12);
      }
    }
    else if (v13)
    {
      __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_2(v10);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  char v14 = [[FPXPCAutomaticErrorProxy alloc] initWithConnection:v7 protocol:&unk_1EF6EDE80 orError:v10 name:*(void *)(a1 + 40) requestPid:0];
  uint64_t v15 = a1 + 32;
  id v16 = *(id *)(a1 + 32);
  objc_sync_enter(v16);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 16);
  if (v18)
  {
    if (!*(unsigned char *)(v17 + 24) || !*(unsigned char *)(a1 + 72))
    {
      id v19 = v18;

      char v14 = v19;
    }
  }
  else
  {
    if (*(void *)(v17 + 32) != *(void *)(a1 + 48))
    {
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_1(a1 + 32, (void *)(a1 + 48), v20);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)v15 + 16), v14);
      *(unsigned char *)(*(void *)v15 + 24) = 0;
    }
  }
  if (v8) {
    +[NSFileProviderManager _registerNotificationsForProviderIdentifier:v8];
  }
  objc_sync_exit(v16);

  [(FPXPCAutomaticErrorProxy *)v14 _t_setFilePresenterObserver:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21) {
    (*(void (**)(uint64_t, FPXPCAutomaticErrorProxy *))(v21 + 16))(v21, v14);
  }
}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_registerNotificationsForProviderIdentifier__registeredNotificationDomains;
  _registerNotificationsForProviderIdentifier__registeredNotificationDomains = v0;

  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("set notifications", v4);
  uint64_t v3 = (void *)_registerNotificationsForProviderIdentifier__setNotificationQueue;
  _registerNotificationsForProviderIdentifier__setNotificationQueue = (uint64_t)v2;
}

- (id)_initWithProviderIdentifier:(id)a3
{
  return [(NSFileProviderManager *)self _initWithProviderIdentifier:a3 domain:0];
}

- (id)_initWithProviderIdentifier:(id)a3 domain:(id)a4
{
  return [(NSFileProviderManager *)self _initWithProviderIdentifier:a3 groupName:0 domain:a4];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@:%@>", objc_opt_class(), self, self->_providerIdentifier, self->_domain];
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v11 = [FPXPCAutomaticErrorProxy alloc];
    id v12 = NSString;
    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = objc_msgSend(v3, "fp_prettyDescription");
    uint64_t v15 = [v12 stringWithFormat:@"%@ (%@)", v13, v14];
    id v16 = [(FPXPCAutomaticErrorProxy *)v11 initWithConnection:0 protocol:&unk_1EF6EDE80 orError:v3 name:v15 requestPid:0];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  dispatch_queue_t v2 = objc_msgSend(*(id *)(a1 + 32), "fp_toDomainIdentifier");
  [v3 postNotificationName:@"NSFileProviderPendingSetDidChange" object:v2];
}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  dispatch_queue_t v2 = objc_msgSend(*(id *)(a1 + 32), "fp_toDomainIdentifier");
  [v3 postNotificationName:@"NSFileProviderMaterializedSetDidChange" object:v2];
}

void __36__NSFileProviderManager__connection__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] file provider manager connection invalidated", v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    objc_sync_enter(v5);
    uint64_t v6 = (void *)v5[4];
    v5[4] = 0;

    uint64_t v7 = (void *)v5[2];
    v5[2] = 0;

    objc_sync_exit(v5);
  }
}

void __36__NSFileProviderManager__connection__block_invoke_156(uint64_t a1)
{
  dispatch_queue_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] file provider manager connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

uint64_t __45__NSFileProviderManager_legacyDefaultManager__block_invoke(uint64_t a1)
{
  legacyDefaultManager__defaultManager = [objc_alloc(*(Class *)(a1 + 32)) _initWithProviderIdentifier:0 domain:0];

  return MEMORY[0x1F41817F8]();
}

- (id)providerDomainID
{
  id v3 = NSString;
  uint64_t v4 = [(NSFileProviderManager *)self providerIdentifier];
  uint64_t v5 = [(NSFileProviderDomain *)self->_domain identifier];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"NSFileProviderDomainDefaultIdentifier";
  }
  uint64_t v8 = objc_msgSend(v3, "fp_providerDomainIDFromProviderID:domainIdentifier:", v4, v7);

  return v8;
}

- (void)waitForSignalDeliveryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  signalUpdateGroup = self->_signalUpdateGroup;
  signalUpdateQueue = self->_signalUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NSFileProviderManager_waitForSignalDeliveryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5AF14E8;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(signalUpdateGroup, signalUpdateQueue, block);
}

uint64_t __68__NSFileProviderManager_waitForSignalDeliveryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_failToSignalPendingChangesWithError:(id)a3 completionHandlersByItemID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_signalUpdateQueue);
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NSFileProviderManager.m", 568, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v9 = [v8 allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
        [(NSFileProviderManager *)self _callCompletionHandlers:v14 error:v7];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)registerURLSessionTask:(NSURLSessionTask *)task forItemWithIdentifier:(NSFileProviderItemIdentifier)identifier completionHandler:(void *)completion
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = task;
  uint64_t v10 = identifier;
  uint64_t v11 = completion;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"NSFileProviderManager.m", 610, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"NSFileProviderManager.m", 611, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [(NSURLSessionTask *)v9 state];
  if (v12 != 1)
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      uint64_t v28 = v14;
      __int16 v29 = 2048;
      uint64_t v30 = 1;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = [(NSURLSessionTask *)v9 state];
      __int16 v35 = 2112;
      id v36 = (id)objc_opt_class();
      id v15 = v36;
      _os_log_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ must be called with a task in suspended (%li) state, but task %@ has state %li. %@ will suspend the task and resume it again to work around this. To avoid this warning, resume the task from the completion handler.", buf, 0x34u);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke;
  v21[3] = &unk_1E5AF5970;
  v21[4] = self;
  id v22 = v10;
  BOOL v26 = v12 != 1;
  id v24 = v11;
  SEL v25 = a2;
  __int16 v23 = v9;
  id v16 = v11;
  long long v17 = v9;
  long long v18 = v10;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v21];
}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 itemIDForIdentifier:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5AF5948;
  id v7 = *(id *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 72);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 56);
  [v5 resolveItemID:v6 completionHandler:v10];
}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([*(id *)(a1 + 32) state] == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "set_publishingURL:", v5);
      }
      else
      {
        if (!*(unsigned char *)(a1 + 72))
        {
          id v9 = fp_current_or_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
            id v11 = *(void **)(a1 + 32);
            *(_DWORD *)id v14 = 138413314;
            *(void *)&v14[4] = v10;
            *(_WORD *)&v14[12] = 2048;
            *(void *)&v14[14] = 1;
            *(_WORD *)&v14[22] = 2112;
            uint64_t v15 = v11;
            *(_WORD *)char v16 = 2048;
            *(void *)&v16[2] = [v11 state];
            *(_WORD *)&v16[10] = 2112;
            *(void *)&v16[12] = objc_opt_class();
            id v12 = *(id *)&v16[12];
            _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ must be called with a task in suspended (%li) state, but task %@ has state %li. %@ will suspend the task and resume it again to work around this. To avoid this warning, resume the task from the completion handler.", v14, 0x34u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "suspend", *(_OWORD *)v14, *(void *)&v14[16], v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
        objc_msgSend(*(id *)(a1 + 32), "set_publishingURL:", v5);
        [*(id *)(a1 + 32) resume];
      }
    }
  }
  else if (v6)
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, v7, v8);
    }
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
  }
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF5998;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  int64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v12];
}

void __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5AF0800;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 deleteSearchableItemsWithSpotlightDomainIdentifiers:v3 indexReason:v5 completionHandler:v6];
}

uint64_t __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)writePlaceholderAtURL:(id)a3 withDictionary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a4 format:200 options:0 error:&v13];
  id v9 = v13;
  id v10 = v9;
  if (v9)
  {
    NSLog(&cfstr_CouldNotSerial.isa, v9);
    char v11 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    char v11 = [v8 writeToURL:v7 options:1 error:a5];
  }

  return v11;
}

+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSFileProviderItem)metadata error:(NSError *)error
{
  id v9 = placeholderURL;
  NSFileProviderItem v10 = metadata;
  char v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"NSFileProviderManager.m", 696, @"Invalid parameter not satisfying: %@", @"placeholderURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"NSFileProviderManager.m", 697, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

LABEL_3:
  if (!_CFURLIsItemPromiseAtURL())
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v23 = NSStringFromSelector(a2);
    id v24 = NSStringFromSelector(sel_placeholderURLForURL_);
    [v22 handleFailureInMethod:a2, a1, @"NSFileProviderManager.m", 698, @"%@ must be called with a url returned from %@", v23, v24 object file lineNumber description];
  }
  id v12 = objc_opt_new();
  id v13 = [v11 filename];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1C6E8]];

  if (objc_opt_respondsToSelector())
  {
    id v14 = [v11 contentType];
    id v15 = [v14 identifier];
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1C728]];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F1C728];
    id v14 = [v11 typeIdentifier];
    [v12 setObject:v14 forKeyedSubscript:v16];
  }

  uint64_t v17 = [v11 documentSize];
  [v12 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1C5F8]];

  [v12 setObject:*MEMORY[0x1E4F1C5D0] forKeyedSubscript:*MEMORY[0x1E4F1C5C0]];
  char v18 = [a1 writePlaceholderAtURL:v9 withDictionary:v12 error:error];

  return v18;
}

+ (NSURL)placeholderURLForURL:(NSURL *)url
{
  uint64_t v3 = url;
  if (_CFURLIsItemPromiseAtURL()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = (NSURL *)_CFURLCopyPromiseURLOfLogicalURL();
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setEjectable:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF59C0;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v8];
}

void __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5AF0800;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 setDomainEjectable:v3 completionHandler:v5];
}

uint64_t __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __43__NSFileProviderManager__cacheProviderInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 bundleIdentifier];
  id v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)stateDirectoryURLWithError:(id *)a3
{
  if (createCaches_onceToken != -1) {
    dispatch_once(&createCaches_onceToken, &__block_literal_global_635);
  }
  uint64_t v5 = [(NSFileProviderDomain *)self->_domain identifier];
  id v6 = (void *)v5;
  uint64_t v7 = @"NSFileProviderDomainDefaultIdentifier";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  id v8 = v7;

  id v9 = (id)stateURLByDomain;
  objc_sync_enter(v9);
  id v10 = [(id)stateURLByDomain objectForKey:v8];
  objc_sync_exit(v9);

  if (!v10)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__28;
    __int16 v31 = __Block_byref_object_dispose__28;
    id v32 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__28;
    SEL v25 = __Block_byref_object_dispose__28;
    id v26 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke;
    v17[3] = &unk_1E5AF5A30;
    char v11 = v8;
    char v18 = v11;
    long long v19 = &v27;
    id v20 = &v21;
    [(NSFileProviderManager *)self fetchDomainServicerSynchronously:1 useOutgoingConnection:0 completionHandler:v17];
    if (v28[5])
    {
LABEL_7:
      id v12 = (id)stateURLByDomain;
      objc_sync_enter(v12);
      [(id)stateURLByDomain setObject:v28[5] forKey:v11];
      objc_sync_exit(v12);

      id v13 = (void *)v28[5];
      goto LABEL_10;
    }
    if (v22[5])
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
      uint64_t v16 = (void *)v22[5];
      v22[5] = v15;

      id v13 = (void *)v28[5];
      if (v13) {
        goto LABEL_7;
      }
    }
LABEL_10:
    if (a3 && !v13)
    {
      *a3 = (id) v22[5];
      id v13 = (void *)v28[5];
    }
    id v10 = v13;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }

  return v10;
}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 synchronousRemoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2;
  v4[3] = &unk_1E5AF5A08;
  id v5 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  [v3 stateDirectoryWithCompletionHandler:v4];
}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = [a2 url];
  if (v7)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2_cold_1(v7);
    }

    id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = v7;
  }
  else
  {
    id v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v10 = a3;
  }
  objc_storeStrong(v9, v10);
}

- (NSURL)temporaryDirectoryURLWithError:(NSError *)error
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (createCaches_onceToken != -1) {
    dispatch_once(&createCaches_onceToken, &__block_literal_global_635);
  }
  uint64_t v4 = [(NSFileProviderDomain *)self->_domain identifier];
  id v5 = (void *)v4;
  id v6 = @"NSFileProviderDomainDefaultIdentifier";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;

  id v8 = (id)temporaryURLByDomain;
  objc_sync_enter(v8);
  id v9 = [(id)temporaryURLByDomain objectForKey:v7];
  if (!v9) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = v9;
    pid_t v12 = getpid();
    id v13 = [v11 path];
    id v14 = (const char *)[v13 fileSystemRepresentation];
    int v15 = fpfs_lp_sandbox_check(v12, (uint64_t)"file-write-data", *MEMORY[0x1E4F14100] | 1u, v14);

    if (!v15)
    {
      id v41 = v11;
      int v16 = 1;
      goto LABEL_13;
    }
    [(id)temporaryURLByDomain removeObjectForKey:v7];
    if ([(id)cachedDirectoriesWithSecurityScope containsObject:v11])
    {
      [v11 stopAccessingSecurityScopedResource];
      [(id)cachedDirectoriesWithSecurityScope removeObject:v11];
    }
LABEL_12:
    int v16 = 0;
LABEL_13:

    id v10 = v9;
    goto LABEL_15;
  }
  id v10 = 0;
  if (error) {
    *error = (NSError *)v9;
  }
  int v16 = 1;
LABEL_15:

  objc_sync_exit(v8);
  if (v16) {
    goto LABEL_49;
  }
  uint64_t v17 = [MEMORY[0x1E4FB36F8] sharedManager];
  v54 = [v17 currentPersona];

  id v71 = 0;
  char v18 = [v54 userPersonaUniqueString];
  long long v19 = [(NSFileProviderDomain *)self->_domain personaIdentifier];
  if (v18 == v19)
  {

LABEL_28:
    v53 = 0;
    goto LABEL_29;
  }
  id v20 = [(NSFileProviderDomain *)self->_domain personaIdentifier];
  char v21 = [v18 isEqualToString:v20];

  if ((v21 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_28;
  }
  id v70 = 0;
  id v22 = (void *)[v54 copyCurrentPersonaContextWithError:&v70];
  id v23 = v70;
  id v24 = v71;
  id v71 = v22;

  if (v23)
  {
    SEL v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v26 = [(NSFileProviderDomain *)self->_domain personaIdentifier];
  v53 = [v54 generateAndRestorePersonaContextWithPersonaUniqueString:v26];

  if (!v53) {
    goto LABEL_28;
  }
  uint64_t v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = [(NSFileProviderDomain *)self->_domain personaIdentifier];
    -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](v28, (uint64_t)v53, (uint64_t)v78);
  }

LABEL_29:
  uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v30 = [v29 temporaryDirectory];

  id v69 = 0;
  uint64_t v31 = *MEMORY[0x1E4F1C820];
  [v30 getResourceValue:&v69 forKey:*MEMORY[0x1E4F1C820] error:0];
  id v32 = v69;
  id v33 = (id)rootURLByDomain;
  objc_sync_enter(v33);
  uint64_t v34 = [(id)rootURLByDomain objectForKey:v7];
  objc_sync_exit(v33);

  BOOL v35 = v34 != 0;
  if (!v32 || !v34) {
    goto LABEL_37;
  }
  id v68 = 0;
  [v34 getResourceValue:&v68 forKey:v31 error:0];
  id v36 = v68;
  if (![v32 isEqual:v36])
  {

LABEL_37:
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__28;
    v76 = __Block_byref_object_dispose__28;
    id v77 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x3032000000;
    id v65 = __Block_byref_object_copy__28;
    id v66 = __Block_byref_object_dispose__28;
    id v67 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke;
    v56[3] = &unk_1E5AF5A80;
    id v57 = v32;
    id v58 = v30;
    uint64_t v42 = v7;
    BOOL v59 = v42;
    v60 = &v72;
    uint64_t v61 = &v62;
    [(NSFileProviderManager *)self fetchDomainServicerSynchronously:1 useOutgoingConnection:0 completionHandler:v56];
    if (!v73[5])
    {
      if (!v63[5])
      {
        uint64_t v43 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
        BOOL v35 = v34 != 0;
        id v44 = (void *)v63[5];
        v63[5] = v43;

        if (v73[5]) {
          BOOL v35 = 0;
        }
      }
      if (v35)
      {
        BOOL v49 = NSString;
        v50 = objc_msgSend((id)v63[5], "fp_prettyDescription");
        v51 = [v49 stringWithFormat:@"cannot get a temporary URL for domain %@: %@", v42, v50];

        v52 = fp_current_or_default_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
          FPPerformWithPersona_cold_1();
        }

        __assert_rtn("-[NSFileProviderManager temporaryDirectoryURLWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSFileProviderManager.m", 1072, (const char *)[v51 UTF8String]);
      }
    }
    id v45 = (id)temporaryURLByDomain;
    objc_sync_enter(v45);
    uint64_t v46 = v73[5];
    if (!v46) {
      uint64_t v46 = v63[5];
    }
    [(id)temporaryURLByDomain setObject:v46 forKey:v42];
    objc_sync_exit(v45);

    v47 = (void *)v73[5];
    if (error && !v47)
    {
      *error = (NSError *) (id) v63[5];
      v47 = (void *)v73[5];
    }
    id v10 = v47;

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v72, 8);

    goto LABEL_48;
  }
  uint64_t v37 = fp_current_or_default_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    id v38 = objc_msgSend(v30, "fp_shortDescription");
    id v39 = [(__CFString *)v7 fp_obfuscatedFilename];
    [(NSFileProviderManager *)v38 temporaryDirectoryURLWithError:(uint64_t)&v72];
  }

  id v40 = (id)temporaryURLByDomain;
  objc_sync_enter(v40);
  [(id)temporaryURLByDomain setObject:v30 forKey:v7];
  objc_sync_exit(v40);

  id v10 = v30;
LABEL_48:

  _FPRestorePersona(&v71);
LABEL_49:

  return (NSURL *)v10;
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 synchronousRemoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2;
  v4[3] = &unk_1E5AF5A58;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 56);
  [v3 temporaryDirectoryWithCompletionHandler:v4];
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 url];
  id v17 = 0;
  [v7 getResourceValue:&v17 forKey:*MEMORY[0x1E4F1C820] error:0];
  id v8 = v17;
  id v9 = (void *)a1[4];
  if (v9 && [v9 isEqual:v8])
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_3((uint64_t)a1);
    }
LABEL_14:

    id v14 = (void *)a1[5];
    id v13 = (void **)(*(void *)(a1[7] + 8) + 40);
    goto LABEL_16;
  }
  if (!v7)
  {
    if (!objc_msgSend(v6, "fp_isFeatureUnsupportedError"))
    {
      id v13 = (void **)(*(void *)(a1[8] + 8) + 40);
      id v14 = v6;
      goto LABEL_16;
    }
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_1((uint64_t)a1);
    }
    goto LABEL_14;
  }
  if ([v7 startAccessingSecurityScopedResource])
  {
    id v11 = (id)temporaryURLByDomain;
    objc_sync_enter(v11);
    [(id)cachedDirectoriesWithSecurityScope addObject:v7];
    objc_sync_exit(v11);
  }
  pid_t v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_2(v7);
  }

  id v13 = (void **)(*(void *)(a1[7] + 8) + 40);
  id v14 = v7;
LABEL_16:
  id v15 = v14;
  int v16 = *v13;
  void *v13 = v15;
}

+ (id)resolvableErrorCodes
{
  if (resolvableErrorCodes_onceToken != -1) {
    dispatch_once(&resolvableErrorCodes_onceToken, &__block_literal_global_234);
  }
  dispatch_queue_t v2 = (void *)resolvableErrorCodes__resolvableErrorCodes;

  return v2;
}

void __45__NSFileProviderManager_resolvableErrorCodes__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [NSNumber numberWithLong:-1000];
  uint64_t v1 = [NSNumber numberWithLong:-1004];
  dispatch_queue_t v2 = [NSNumber numberWithLong:-1003];
  uint64_t v3 = [NSNumber numberWithLong:-2005];
  uint64_t v4 = [NSNumber numberWithLong:-2010];
  id v5 = [NSNumber numberWithLong:-5009];
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  id v7 = (void *)resolvableErrorCodes__resolvableErrorCodes;
  resolvableErrorCodes__resolvableErrorCodes = v6;
}

- (BOOL)isErrorSupportedForSignalResolved:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"FPResolveErrorItemIdentifierKey"];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v3 domain];
    if ([v7 isEqualToString:@"NSFileProviderErrorDomain"])
    {
      id v8 = +[NSFileProviderManager resolvableErrorCodes];
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
      char v6 = [v8 containsObject:v9];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (void)signalErrorResolved:(NSError *)error completionHandler:(void *)completionHandler
{
  char v6 = error;
  id v7 = completionHandler;
  BOOL v8 = [(NSFileProviderManager *)self isErrorSupportedForSignalResolved:v6];
  id v9 = fp_current_or_default_log();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSFileProviderManager signalErrorResolved:completionHandler:](v6, v10);
    }

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    BOOL v18 = 0;
    BOOL v18 = [(NSError *)v6 code] == -1000;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke;
    v12[3] = &unk_1E5AF5AD0;
    int v16 = v17;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    [(NSFileProviderManager *)self fetchDomainServicerSynchronously:0 useOutgoingConnection:0 completionHandler:v12];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSFileProviderManager signalErrorResolved:completionHandler:](v6);
    }

    id v11 = FPNotSupportedError();
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
  }
}

void __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5AF5AA8;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [v3 signalErrorResolved:v4 completionHandler:v7];
}

void __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5AF0800;
    v5[4] = v4;
    id v6 = *(id *)(a1 + 40);
    [v4 signalEnumeratorForContainerItemIdentifier:@"NSFileProviderWorkingSetContainerItemIdentifier" completionHandler:v5];
  }
}

uint64_t __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getUserVisibleURLForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  id v7 = itemIdentifier;
  long long v8 = [FPItemID alloc];
  providerIdentifier = self->_providerIdentifier;
  uint64_t v10 = [(NSFileProviderDomain *)self->_domain identifier];
  id v11 = (void *)v10;
  if (v10) {
    pid_t v12 = (__CFString *)v10;
  }
  else {
    pid_t v12 = @"NSFileProviderDomainDefaultIdentifier";
  }
  id v13 = [(FPItemID *)v8 initWithProviderID:providerIdentifier domainIdentifier:v12 itemIdentifier:v7];

  id v14 = +[FPItemManager defaultManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__NSFileProviderManager_getUserVisibleURLForItemIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF1848;
  void v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  [v14 fetchURLForItemID:v13 completionHandler:v16];
}

uint64_t __78__NSFileProviderManager_getUserVisibleURLForItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)getIdentifierForUserVisibleFileAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  id v5 = url;
  id v6 = completionHandler;
  id v7 = +[FPDaemonConnection sharedConnectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__NSFileProviderManager_getIdentifierForUserVisibleFileAtURL_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5AF8;
  id v11 = v5;
  id v12 = v6;
  long long v8 = v5;
  id v9 = v6;
  [v7 providerItemIDForURL:v8 completionHandler:v10];
}

void __80__NSFileProviderManager_getIdentifierForUserVisibleFileAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v9)
  {
    id v7 = [v9 identifier];
    long long v8 = [v9 domainIdentifier];
    (*(void (**)(uint64_t, void *, void *, id))(v6 + 16))(v6, v7, v8, v5);

LABEL_3:
    goto LABEL_6;
  }
  if (!v5)
  {
    id v7 = FPItemNotFoundErrorAtURL(*(void **)(a1 + 32));
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
    goto LABEL_3;
  }
  (*(void (**)(void, void, void, id))(v6 + 16))(*(void *)(a1 + 40), 0, 0, v5);
LABEL_6:
}

+ (BOOL)checkDomainsCanBeStored:(BOOL *)a3 onVolumeAtURL:(id)a4 unsupportedReason:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a4;
  if (FPFeatureFlagEbihilIsEnabled())
  {
    uint64_t v24 = 0;
    SEL v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v20 = 0;
    char v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__28;
    BOOL v18 = __Block_byref_object_dispose__28;
    id v19 = 0;
    uint64_t v10 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__NSFileProviderManager_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error___block_invoke;
    v13[3] = &unk_1E5AF5B20;
    v13[4] = &v24;
    v13[5] = &v20;
    v13[6] = &v14;
    [v10 checkLocationEligibilityForDomain:v9 completionHandler:v13];
    if (a3) {
      *a3 = *((unsigned char *)v25 + 24);
    }
    if (a5) {
      *a5 = v21[3];
    }
    if (a6) {
      *a6 = (id) v15[5];
    }
    BOOL v11 = v15[5] == 0;

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else if (a6)
  {
    FPNotSupportedError();
    BOOL v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __87__NSFileProviderManager_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error___block_invoke(void *a1, char a2, uint64_t a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

+ (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5
{
}

+ (void)addDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler
{
}

+ (void)removeDomain:(NSFileProviderDomain *)domain mode:(NSFileProviderDomainRemovalMode)mode completionHandler:(void *)completionHandler
{
  id v7 = domain;
  long long v8 = completionHandler;
  if ((unint64_t)mode >= (NSFileProviderDomainRemovalModePreserveDownloadedUserData|NSFileProviderDomainRemovalModePreserveDirtyUserData))
  {
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:description:", 22, @"Invalid options provided to removeDomain:options:%lu completionHandler:", mode);
    v8[2](v8, 0, v11);
  }
  else
  {
    uint64_t v9 = qword_1A34E4AA8[mode];
    uint64_t v10 = +[FPDaemonConnection sharedConnectionProxy];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__NSFileProviderManager_removeDomain_mode_completionHandler___block_invoke;
    v12[3] = &unk_1E5AF3A58;
    id v13 = v8;
    [v10 removeDomain:v7 mode:v9 completionHandler:v12];
  }
}

void __61__NSFileProviderManager_removeDomain_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)removeDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF1A60;
  id v9 = v6;
  id v7 = v6;
  [a1 removeDomain:domain mode:0 completionHandler:v8];
}

uint64_t __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)removeDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[FPDaemonConnection sharedConnectionProxy];
  BOOL v11 = NSString;
  id v12 = [v9 identifier];

  id v13 = objc_msgSend(v11, "fp_providerDomainIDFromProviderID:domainIdentifier:", v8, v12);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__NSFileProviderManager_removeDomain_forProviderIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E5AF3A58;
  id v16 = v7;
  id v14 = v7;
  [v10 removeDomainAndPreserveDataWithID:v13 mode:0 completionHandler:v15];
}

uint64_t __78__NSFileProviderManager_removeDomain_forProviderIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)removeAllDomainsWithCompletionHandler:(void *)completionHandler
{
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5
{
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v15 = [v14 currentPersona];

  id v25 = 0;
  id v16 = [v15 userPersonaUniqueString];
  id v17 = v16;
  if (v16 == v12
    || ([v16 isEqualToString:v12] & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    uint64_t v22 = 0;
  }
  else
  {
    id v24 = 0;
    BOOL v18 = (void *)[v15 copyCurrentPersonaContextWithError:&v24];
    id v19 = v24;
    id v20 = v25;
    id v25 = v18;

    if (v19)
    {
      char v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
      }
    }
    uint64_t v22 = [v15 generateAndRestorePersonaContextWithPersonaUniqueString:v12];

    if (v22)
    {
      uint64_t v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[NSFileProviderManager addDomain:forProviderIdentifier:persona:completionHandler:]();
      }
    }
  }
  [a1 addDomain:v10 forProviderIdentifier:v11 byImportingDirectoryAtURL:0 userAllowedDBDrop:0 knownFolders:MEMORY[0x1E4F1CBF0] completionHandler:v13];

  _FPRestorePersona(&v25);
}

+ (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FPDaemonConnection sharedConnectionProxy];
  [v7 removeAllDomainsForProviderIdentifier:v6 completionHandler:v5];
}

+ (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FPDaemonConnection sharedConnectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__NSFileProviderManager_getDomainsForProviderIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5B70;
  id v11 = v6;
  id v12 = a1;
  id v9 = v6;
  [v8 getDomainsForProviderIdentifier:v7 completionHandler:v10];
}

void __75__NSFileProviderManager_getDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = NSString;
        id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) identifier];
        id v16 = objc_msgSend(v14, "fp_providerDomainIDFromProviderID:domainIdentifier:", v7, v15);

        [*(id *)(a1 + 40) _registerNotificationsForProviderIdentifier:v16];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)getDomainsWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = getDomainsWithCompletionHandler__onceToken;
  id v5 = completionHandler;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&getDomainsWithCompletionHandler__onceToken, &__block_literal_global_256);
    id v6 = v7;
  }
  [a1 getDomainsForProviderIdentifier:0 completionHandler:v6];
}

void __57__NSFileProviderManager_getDomainsWithCompletionHandler___block_invoke()
{
  uint64_t v0 = objc_msgSend(@"com.apple.fileprovider.providers-changed", "fp_libnotifyPerUserNotificationName");
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.fileprovider.domain.changes", v1);
  id v3 = (void *)getDomainsWithCompletionHandler__queue;
  getDomainsWithCompletionHandler__queue = (uint64_t)v2;

  id v5 = v0;
  uint64_t v4 = (const char *)[v5 UTF8String];
  notify_register_dispatch(v4, (int *)&getDomainsWithCompletionHandler__notifyToken, (dispatch_queue_t)getDomainsWithCompletionHandler__queue, &__block_literal_global_262);
}

void __57__NSFileProviderManager_getDomainsWithCompletionHandler___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"NSFileProviderDomainDidChange" object:0];
}

+ (NSFileProviderManager)managerForDomain:(NSFileProviderDomain *)domain
{
  uint64_t v4 = domain;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithProviderIdentifier:0 domain:v4];

  return (NSFileProviderManager *)v5;
}

+ (NSFileProviderManager)managerWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) _initWithProviderIdentifier:v10 groupName:v9 domain:v8];

  return (NSFileProviderManager *)v11;
}

+ (BOOL)fileProviderReadyForBackupOrMigrationForSourceURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    FPNotSupportedError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)dealloc
{
  id location = 0;
  connection = self->_connection;
  id v4 = objc_initWeak(&location, connection);
  [(FPDDaemon *)connection invalidate];

  objc_destroyWeak(&location);
  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderManager;
  [(NSFileProviderManager *)&v5 dealloc];
}

- (void)removeDomain:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if ((unint64_t)a4 >= 3)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:description:", 22, @"Invalid options provided to removeDomain:options:%lu completionHandler:", a4);
    v8[2](v8, 0, v11);
  }
  else
  {
    uint64_t v9 = qword_1A34E4AA8[a4];
    id v10 = NSString;
    uint64_t v11 = [(NSFileProviderManager *)self providerIdentifier];
    uint64_t v12 = [v14 identifier];
    uint64_t v13 = objc_msgSend(v10, "fp_providerDomainIDFromProviderID:domainIdentifier:", v11, v12);
    +[FPProviderDomain removeDomainAndPreserveDataWithID:v13 mode:v9 completionHandler:v8];
  }
}

- (BOOL)removeDomain:(id)a3 options:(int64_t)a4 preservedLocation:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  if ((unint64_t)a4 >= 3)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:description:", 22, @"Invalid options provided to removeDomain:options:%lu completionHandler:", a4);
      BOOL v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    uint64_t v11 = qword_1A34E4AA8[a4];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__28;
    uint64_t v31 = __Block_byref_object_dispose__28;
    id v32 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__28;
    id v25 = __Block_byref_object_dispose__28;
    id v26 = 0;
    uint64_t v12 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    uint64_t v13 = NSString;
    id v14 = [(NSFileProviderManager *)self providerIdentifier];
    id v15 = [v10 identifier];
    id v16 = objc_msgSend(v13, "fp_providerDomainIDFromProviderID:domainIdentifier:", v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__NSFileProviderManager_removeDomain_options_preservedLocation_error___block_invoke;
    v20[3] = &unk_1E5AF5BB8;
    v20[4] = &v27;
    v20[5] = &v21;
    [v12 removeDomainAndPreserveDataWithID:v16 mode:v11 completionHandler:v20];

    long long v17 = (void *)v22[5];
    BOOL v18 = v17 == 0;
    if (v17)
    {
      if (a6) {
        *a6 = v17;
      }
    }
    else if (a5)
    {
      *a5 = [(id)v28[5] url];
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v18;
}

void __70__NSFileProviderManager_removeDomain_options_preservedLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)removeDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF1A60;
  id v9 = v6;
  id v7 = v6;
  [(NSFileProviderManager *)self removeDomain:a3 options:0 completionHandler:v8];
}

- (void)getDomainsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NSFileProviderManager *)self providerIdentifier];
  [v5 getDomainsForProviderIdentifier:v6 completionHandler:v4];
}

- (void)removeAllDomainsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NSFileProviderManager *)self providerIdentifier];
  [v5 removeAllDomainsForProviderIdentifier:v6 completionHandler:v4];
}

- (NSProgress)globalProgressForKind:(NSProgressFileOperationKind)kind
{
  id v4 = kind;
  if (![(NSString *)v4 isEqualToString:*MEMORY[0x1E4F28880]]
    && ![(NSString *)v4 isEqualToString:*MEMORY[0x1E4F28858]])
  {
    id v7 = [NSString stringWithFormat:@"Invalid kind given for global progress: %@", v4];
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      FPPerformWithPersona_cold_1();
    }

    __assert_rtn("-[NSFileProviderManager globalProgressForKind:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSFileProviderManager.m", 1626, (const char *)[v7 UTF8String]);
  }
  id v5 = [(NSFileProviderManager *)self startObservingGlobalProgressForKind:v4];

  return (NSProgress *)v5;
}

- (void)startObservingUploadProgress
{
  id v3 = [(FPProgressUpdater *)self->_uploadProxy progress];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__NSFileProviderManager_startObservingUploadProgress__block_invoke;
    v4[3] = &unk_1E5AF5BE0;
    void v4[4] = self;
    [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v4];
  }
}

uint64_t __53__NSFileProviderManager_startObservingUploadProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 120);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2;
  v5[3] = &unk_1E5AF1240;
  v5[4] = v2;
  return [a2 subscribeToUploadProgressUpdates:v3 completionHandler:v5];
}

void __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  id v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F281F8]] || objc_msgSend(v4, "code") > 4223)
  {

    goto LABEL_9;
  }
  uint64_t v6 = [v4 code];

  if (v6 <= 4096)
  {
LABEL_9:
    [*(id *)(*(void *)(a1 + 32) + 120) setProgress:0];
    goto LABEL_10;
  }
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) startObservingUploadProgress];
LABEL_10:
}

- (void)startObservingDownloadProgress
{
  id v3 = [(FPProgressUpdater *)self->_downloadProxy progress];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke;
    v4[3] = &unk_1E5AF5BE0;
    void v4[4] = self;
    [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v4];
  }
}

uint64_t __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 112);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2;
  v5[3] = &unk_1E5AF1240;
  v5[4] = v2;
  return [a2 subscribeToDownloadProgressUpdates:v3 completionHandler:v5];
}

void __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  id v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F281F8]] || objc_msgSend(v4, "code") > 4223)
  {

    goto LABEL_9;
  }
  uint64_t v6 = [v4 code];

  if (v6 <= 4096)
  {
LABEL_9:
    [*(id *)(*(void *)(a1 + 32) + 112) setProgress:0];
    goto LABEL_10;
  }
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) startObservingDownloadProgress];
LABEL_10:
}

- (id)startObservingGlobalProgressForKind:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    uint64_t v6 = *MEMORY[0x1E4F28880];
    int v7 = [v4 isEqualToString:*MEMORY[0x1E4F28880]];
    id v8 = (void *)MEMORY[0x1E4F28858];
    if (!v7
      || (p_downloadProxy = &self->_uploadProxy,
          [(FPProgressUpdater *)self->_uploadProxy progress],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      if (![v5 isEqualToString:*v8]) {
        goto LABEL_7;
      }
      p_downloadProxy = &self->_downloadProxy;
      id v11 = [(FPProgressUpdater *)self->_downloadProxy progress];

      if (!v11) {
        goto LABEL_7;
      }
    }
    uint64_t v12 = [(FPProgressUpdater *)*p_downloadProxy progress];
    if (!v12)
    {
LABEL_7:
      uint64_t v12 = objc_alloc_init(FPProgressProxy);
      [(FPProgressProxy *)v12 setUpdateFileCount:1];
      [(FPProgressProxy *)v12 setCompletedUnitCount:1];
      [(FPProgressProxy *)v12 setTotalUnitCount:1];
      [(FPProgressProxy *)v12 setFileCompletedCount:&unk_1EF6C3920];
      [(FPProgressProxy *)v12 setFileTotalCount:&unk_1EF6C3920];
      [(FPProgressProxy *)v12 setKind:*MEMORY[0x1E4F28898]];
      [(FPProgressProxy *)v12 setFileOperationKind:v5];
      if ([v5 isEqualToString:v6])
      {
        [(FPProgressUpdater *)self->_uploadProxy setProgress:v12];
        [(NSFileProviderManager *)self startObservingUploadProgress];
      }
      if ([v5 isEqualToString:*v8])
      {
        [(FPProgressUpdater *)self->_downloadProxy setProgress:v12];
        [(NSFileProviderManager *)self startObservingDownloadProgress];
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSArray)presentedFiles
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedFiles, 0);
  objc_storeStrong((id *)&self->_uploadProxy, 0);
  objc_storeStrong((id *)&self->_downloadProxy, 0);
  objc_storeStrong((id *)&self->_completionHandlersByItemID, 0);
  objc_storeStrong((id *)&self->_signalUpdateGroup, 0);
  objc_storeStrong((id *)&self->_signalUpdateSource, 0);
  objc_storeStrong((id *)&self->_signalUpdateQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_documentStorageURL, 0);
  objc_storeStrong((id *)&self->_presentedFileObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteFileProvider, 0);

  objc_storeStrong((id *)&self->_sem, 0);
}

- (id)enumeratorForMaterializedItems
{
  uint64_t v2 = [[FPMaterializedSetEnumerator alloc] initWithManager:self];

  return v2;
}

- (id)enumeratorForPendingItems
{
  uint64_t v2 = [[FPPendingSetEnumerator alloc] initWithManager:self];

  return v2;
}

+ (void)importDomain:(NSFileProviderDomain *)domain fromDirectoryAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v12 = domain;
  id v9 = url;
  id v10 = completionHandler;
  if (![(NSFileProviderDomain *)v12 isReplicated]
    && ![(NSFileProviderDomain *)v12 isReplicated])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderManager.m" lineNumber:1970 description:@"Trying to import a non-replicated domain"];
  }
  [a1 addDomain:v12 forProviderIdentifier:0 byImportingDirectoryAtURL:v9 userAllowedDBDrop:0 knownFolders:MEMORY[0x1E4F1CBF0] completionHandler:v10];
}

- (void)reimportItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v6 = itemIdentifier;
  id v7 = completionHandler;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5CF0;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NSFileProviderManager *)self fetchDomainServicerSynchronously:0 useOutgoingConnection:1 completionHandler:v10];
}

void __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5AF0800;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 reimportItemsBelowItemWithIdentifier:v3 completionHandler:v5];
}

uint64_t __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestModificationOfFields:(NSFileProviderItemFields)fields forItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier options:(NSFileProviderModifyItemOptions)options completionHandler:(void *)completionHandler
{
  id v9 = itemIdentifier;
  id v10 = completionHandler;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF5998;
  id v14 = v9;
  id v15 = self;
  id v16 = v10;
  NSFileProviderItemFields v17 = fields;
  id v11 = v10;
  uint64_t v12 = v9;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v13];
}

void __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5AF0800;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 ingestFromCacheItemWithIdentifier:v3 requestedFields:v5 completionHandler:v6];
}

uint64_t __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v15 isReplicated] & 1) == 0 && (objc_msgSend(v15, "isReplicated") & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderManager.m" lineNumber:2058 description:@"Trying to import a non-replicated domain"];
  }
  [a1 addDomain:v15 forProviderIdentifier:v11 byImportingDirectoryAtURL:v12 userAllowedDBDrop:0 knownFolders:MEMORY[0x1E4F1CBF0] completionHandler:v13];
}

+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 knownFolders:(id)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (([v18 isReplicated] & 1) == 0 && (objc_msgSend(v18, "isReplicated") & 1) == 0)
  {
    NSFileProviderItemFields v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderManager.m" lineNumber:2064 description:@"Trying to import a non-replicated domain"];
  }
  [a1 addDomain:v18 forProviderIdentifier:v13 byImportingDirectoryAtURL:v14 userAllowedDBDrop:0 knownFolders:v15 completionHandler:v16];
}

+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 knownFolders:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__28;
  id v24 = __Block_byref_object_dispose__28;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __117__NSFileProviderManager_ImportPrivate__addDomain_forProviderIdentifier_byImportingDirectoryAtURL_knownFolders_error___block_invoke;
  v19[3] = &unk_1E5AF29C0;
  v19[4] = &v20;
  [a1 addDomain:v12 forProviderIdentifier:v13 byImportingDirectoryAtURL:v14 userAllowedDBDrop:0 knownFolders:v15 synchronous:1 completionHandler:v19];
  id v16 = (void *)v21[5];
  if (a7 && v16)
  {
    *a7 = v16;
    id v16 = (void *)v21[5];
  }
  BOOL v17 = v16 == 0;
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __117__NSFileProviderManager_ImportPrivate__addDomain_forProviderIdentifier_byImportingDirectoryAtURL_knownFolders_error___block_invoke(uint64_t a1, void *a2)
{
}

+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 error:(id *)a5
{
  return [a1 addDomain:a3 forProviderIdentifier:a4 byImportingDirectoryAtURL:0 knownFolders:MEMORY[0x1E4F1CBF0] error:a5];
}

+ (BOOL)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 error:(id *)a6
{
  return [a1 addDomain:a3 forProviderIdentifier:a4 byImportingDirectoryAtURL:a5 knownFolders:MEMORY[0x1E4F1CBF0] error:a6];
}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  id v6 = itemIdentifier;
  id v7 = completionHandler;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__NSFileProviderManager_Barrier__waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5CF0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v10];
}

uint64_t __97__NSFileProviderManager_Barrier__waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 waitForChangesOnItemsBelowItemWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)waitForStabilizationWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__NSFileProviderManager_Stabilization__waitForStabilizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AF5C78;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v6];
}

uint64_t __82__NSFileProviderManager_Stabilization__waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 waitForStabilizationWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)evictItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  id v6 = itemIdentifier;
  id v7 = completionHandler;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5CF0;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v10];
}

void __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5AF0800;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 evictItemWithIdentifier:v3 completionHandler:v5];
}

void __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  id v8 = @"NSFileProviderErrorDomain";
  uint64_t v9 = v3;
  uint64_t v10 = *MEMORY[0x1E4F28798];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v8 count:3];
  id v7 = objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (void)lookupRequestingApplicationIdentifier:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF5998;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  unint64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v12];
}

void __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5AF0800;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 ingestFromCacheItemWithIdentifier:v3 requestedFields:v5 completionHandler:v6];
}

uint64_t __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)disconnectWithReason:(NSString *)localizedReason options:(NSFileProviderManagerDisconnectionOptions)options completionHandler:(void *)completionHandler
{
  domain = self->_domain;
  id v9 = completionHandler;
  id v10 = localizedReason;
  id v11 = (id)[(NSFileProviderDomain *)domain copy];
  [v11 setDisconnected:1];
  [v11 _setDisconnectionReason:v10];

  [v11 _setDisconnectionOptions:options];
  [(NSFileProviderManager *)self addDomain:v11 completionHandler:v9];
}

- (void)reconnectWithCompletionHandler:(void *)completionHandler
{
  domain = self->_domain;
  uint64_t v5 = completionHandler;
  id v6 = (id)[(NSFileProviderDomain *)domain copy];
  [v6 setDisconnected:0];
  [v6 _setDisconnectionReason:0];
  [v6 _setDisconnectionOptions:0];
  [(NSFileProviderManager *)self addDomain:v6 completionHandler:v5];
}

- (NSArray)listAvailableTestingOperationsWithError:(NSError *)error
{
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__28;
  uint64_t v22 = __Block_byref_object_dispose__28;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__28;
  unint64_t v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke;
  v11[3] = &unk_1E5AF5D18;
  v11[4] = &v18;
  v11[5] = &v12;
  [(NSFileProviderManager *)self fetchDomainServicerSynchronously:1 useOutgoingConnection:0 completionHandler:v11];
  id v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = 0;
    if (error) {
      *error = (NSError *)v6;
    }
  }
  else
  {
    id v8 = (void *)v19[5];
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"NSFileProviderManager.m" lineNumber:2233 description:@"missing operations"];

      id v8 = (void *)v19[5];
    }
    if (!v8) {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v7 = v8;
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return (NSArray *)v7;
}

void __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 synchronousRemoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke_2;
  v4[3] = &unk_1E5AF3DD8;
  long long v5 = *(_OWORD *)(a1 + 32);
  [v3 listAvailableTestingOperationsWithCompletionHandler:v4];
}

void __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSDictionary)runTestingOperations:(NSArray *)operations error:(NSError *)error
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__28;
  id v41 = __Block_byref_object_dispose__28;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__28;
  BOOL v35 = __Block_byref_object_dispose__28;
  id v36 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = operations;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (error)
          {
            FPInvalidParameterError(@"testingOperations", (uint64_t)v7, v11, v12, v13, v14, v15, v16);
            id v18 = 0;
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v18 = 0;
          }
          long long v19 = v7;
          goto LABEL_22;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v43 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke;
  v23[3] = &unk_1E5AF5A30;
  id v24 = v7;
  id v25 = &v37;
  id v26 = &v31;
  [(NSFileProviderManager *)self fetchDomainServicerSynchronously:1 useOutgoingConnection:0 completionHandler:v23];
  id v17 = (void *)v32[5];
  if (v17)
  {
    id v18 = 0;
    if (error) {
      *error = (NSError *)v17;
    }
  }
  else
  {
    uint64_t v20 = (void *)v38[5];
    if (!v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"NSFileProviderManager.m" lineNumber:2266 description:@"missing operations"];

      uint64_t v20 = (void *)v38[5];
    }
    if (!v20) {
      uint64_t v20 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v18 = v20;
  }
  long long v19 = v24;
LABEL_22:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return (NSDictionary *)v18;
}

void __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 synchronousRemoteObjectProxy];
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke_2;
  v5[3] = &unk_1E5AF3E28;
  long long v6 = *(_OWORD *)(a1 + 40);
  [v3 runTestingOperations:v4 completionHandler:v5];
}

void __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_test_existingProgressForKind:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F28880]])
  {
    uint64_t v5 = 120;
LABEL_5:
    id v6 = [*(id *)((char *)&self->super.isa + v5) progress];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F28858]])
  {
    uint64_t v5 = 112;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)getServiceWithName:(NSFileProviderServiceName)serviceName itemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v8 = serviceName;
  uint64_t v9 = itemIdentifier;
  id v10 = completionHandler;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF5D68;
  uint64_t v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  [(NSFileProviderManager *)self fetchDomainServicerSynchronously:0 useOutgoingConnection:0 completionHandler:v14];
}

void __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  uint64_t v7 = [v4 itemIDForIdentifier:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5AF5D40;
  id v12 = *(id *)(a1 + 56);
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  [v6 startAccessingServiceWithName:v3 itemID:v7 completionHandler:v10];
}

void __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!v7 || a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int8x16_t v9 = [FPService alloc];
    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6CAC98];
    int8x16_t v11 = [*(id *)(a1 + 32) providerDomainID];
    id v12 = [(FPService *)v9 initWithEndpoint:v7 interface:v10 lifetimeExtender:v8 providerDomainID:v11];

    uint64_t v13 = dispatch_group_create();
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = objc_alloc(MEMORY[0x1E4F28CD0]);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [(FPService *)v12 remoteObjectProxyCreating];
    id v18 = (void *)[v15 initWithName:v16 endpointCreatingProxy:v17 requestFinishedGroup:v13];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v18, 0);

    long long v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5AF0FF0;
    uint64_t v22 = v12;
    uint64_t v20 = v12;
    dispatch_group_notify(v13, v19, block);
  }
}

uint64_t __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)requestDownloadForItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier requestedRange:(NSRange)rangeToMaterialize completionHandler:(void *)completionHandler
{
  NSUInteger length = rangeToMaterialize.length;
  NSUInteger location = rangeToMaterialize.location;
  int8x16_t v9 = itemIdentifier;
  id v10 = completionHandler;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF5D90;
  void v13[4] = self;
  uint64_t v14 = v9;
  NSUInteger v16 = location;
  NSUInteger v17 = length;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v13];
}

void __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5AF0800;
  uint64_t v4 = *(void *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "materializeItemWithIdentifier:requestedRange:completionHandler:", v4, *(void *)(a1 + 56), *(void *)(a1 + 64), v5);
}

void __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  id v8 = @"NSFileProviderErrorDomain";
  uint64_t v9 = v3;
  uint64_t v10 = *MEMORY[0x1E4F28798];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v8 count:3];
  id v7 = objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF5CF0;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NSFileProviderManager *)self domainServicerWithCompletionHandler:v10];
}

void __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5AF1498;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  void v5[4] = a1[5];
  id v6 = v4;
  [a2 getDiagnosticAttributesForItems:v3 completionHandler:v5];
}

uint64_t __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)claimKnownFolders:(id)a3 localizedReason:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)releaseKnownFolders:(unint64_t)a3 localizedReason:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)fetchDomainServicerSynchronously:(void *)a1 useOutgoingConnection:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_10_1((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v6, v4, "[ERROR] Can't adopt persona %@: %@", v5);
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 32);
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, (uint64_t)a2, a3, "[DEBUG] connection mismatch (%p, %p), it was probably invalidated while fetching the proxy. Not going to cache the domain servicer", *(const void **)v3, *(const void **)&v3[8]);
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Couldn't instantiate embedded file provider: %@\nCheck whether your application has a file provider extension embedded.", v4, v5, v6, v7, v8);
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_140_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_9_3();
  uint64_t v8 = v5;
  OUTLINED_FUNCTION_29(&dword_1A33AE000, a3, v6, "[ERROR] Can't fetch remote file provider for identifier %@; %@", v7);
}

- (void)signalEnumeratorForContainerItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] signaling change on %@", v2, v3, v4, v5, v6);
}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_9_3();
  uint64_t v9 = v4;
  __int16 v10 = v6;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed registering URL session task %@ with item %@; %@",
    v8,
    0x20u);
}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] caching state URL (daemon) %@ for domain %@", v4, v5, v6, v7, v8);
}

- (void)temporaryDirectoryURLWithError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_10_1((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] registering temporary URL (system) %@ for domain %@", v5, 0x16u);
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] registering temporary URL (system) %@ for domain %@", v4, v5, v6, v7, v8);
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] registering temporary URL (daemon) %@ for domain %@", v4, v5, v6, v7, v8);
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_3(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] registering temporary URL (system) %@ for domain %@", v4, v5, v6, v7, v8);
}

- (void)signalErrorResolved:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Signaling as resolved error: %@", v4, 0xCu);
}

- (void)signalErrorResolved:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Failed signaling error as resolved: error %@ not supported.", v4, v5, v6, v7, v8);
}

void __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_2();
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_FAULT, "[CRIT] Persona transmission failed. Caller persona was %@, fileproviderd received %@.", v2, 0x16u);
}

+ (void)addDomain:forProviderIdentifier:persona:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v1, (uint64_t)v1, "[ERROR] Can't adopt persona %@: %@", v2);
}

void __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Restarting upload observation (%@)", v2, v3, v4, v5, v6);
}

void __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Restarting download observation (%@)", v2, v3, v4, v5, v6);
}

@end