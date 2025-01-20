@interface FPDDomain
- (BOOL)_isProviderBlockingConsumer:(id)a3;
- (BOOL)_shouldDisconnectDueToLowDiskSpace;
- (BOOL)_wantsPresenterNotifications;
- (BOOL)backgroundActivityIsPaused;
- (BOOL)createRootByImportingDirectoryAtURL:(id)a3 knownFolders:(id)a4 error:(id *)a5;
- (BOOL)ejectable;
- (BOOL)invalidated;
- (BOOL)isConnectedToAppExtension;
- (BOOL)isDefaultDomain;
- (BOOL)isHidden;
- (BOOL)isHiddenByUser;
- (BOOL)isHiddenDefaultDomain;
- (BOOL)isPendingInitialization;
- (BOOL)isProviderForRealPathURL:(id)a3;
- (BOOL)isUsingFPFS;
- (BOOL)shouldDisconnectWithStartupError;
- (BOOL)shouldIndexWhenStart;
- (BOOL)started;
- (BOOL)supportsPickingFolders;
- (BOOL)supportsRemoteVersions;
- (BOOL)supportsSearch;
- (BOOL)supportsSyncingTrash;
- (BOOL)unableToStartup;
- (BOOL)userEnabled;
- (Class)fpfsTestingBackendClass;
- (FPDDomain)initWithIdentifier:(id)a3 nsDomain:(id)a4 extensionStorageURLs:(id)a5 purposeIdentifier:(id)a6 fpfsClass:(Class)a7 provider:(id)a8 volume:(id)a9;
- (FPDDomainBackend)deactivatedBackend;
- (FPDDomainBackend)defaultBackend;
- (FPDDomainBackend)extensionBackend;
- (FPDDomainIndexer)indexer;
- (FPDExtensionSessionProtocol)session;
- (FPDProvider)provider;
- (FPDVolume)volume;
- (NSArray)checkableURLs;
- (NSArray)coordinationRootURLs;
- (NSArray)extensionStorageURLs;
- (NSArray)rootURLs;
- (NSCache)versionsCache;
- (NSData)fpfsRootBookmarkData;
- (NSDictionary)domainUserInfo;
- (NSError)errorReflectingDisconnectionState;
- (NSError)startupError;
- (NSFileProviderDomain)nsDomain;
- (NSFileProviderDomain)nsDomainOrNilForDefault;
- (NSMutableDictionary)filePresenters;
- (NSString)description;
- (NSString)fp_prettyDescription;
- (NSString)identifier;
- (NSString)providerDomainID;
- (NSString)purposeIdentifier;
- (NSURL)stateURL;
- (NSURL)supportURL;
- (OS_dispatch_queue)serialQueue;
- (OS_os_log)log;
- (id)_fileReactorID;
- (id)_physicalURLForURL:(id)a3;
- (id)_providedItemsOperationQueue;
- (id)_removeProgressForProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4;
- (id)_siblingDelegateForURL:(id)a3;
- (id)accumulatedSizeOfItems;
- (id)cleanupDomainWithMode:(unint64_t)a3;
- (id)getProvidedItemRecursiveGenerationCountForItemAtURL:(id)a3;
- (id)materializedURLForItemID:(id)a3;
- (id)providerSupportURL;
- (id)providerVersion;
- (id)rootURLsWithTransientState:(BOOL *)a3;
- (int64_t)accumulatedSizeOfPinnedItems;
- (int64_t)errorGenerationCount;
- (int64_t)nonEvictableSpace;
- (unint64_t)disconnectionState;
- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4;
- (void)_checkDomainConnectionPermittedWithCompletionHandler:(id)a3;
- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_prepareFileCoordinationProviders;
- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5;
- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_provideItemAtURL:(id)a3 withReaderID:(id)a4 withProcessID:(int)a5 withAuditToken:(id *)a6 kernelInfo:(id)a7 readingOptions:(unint64_t)a8 completionHandler:(id)a9;
- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4;
- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4;
- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5;
- (void)_registerFileCoordinatorAndSpaceForceWithCompletion:(id)a3;
- (void)_registerInSpaceForce;
- (void)_shouldDisconnectDueToLowDiskSpace;
- (void)_startObservingRootAndResumeIndexerWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5;
- (void)_startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5;
- (void)_unregisterFromFileCoordinatorAndSpaceForce;
- (void)_unregisterURLFromSpaceForce:(id)a3;
- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4;
- (void)callExtensionForItemDidChange:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)cancelPendingCoordinations;
- (void)createRootAndObserveIfNeededWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5;
- (void)createRootURLWithCompletion:(id)a3;
- (void)daemonSideItemChange:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)didChangeItemID:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)didRefreshRootURLsWithCompletionHandler:(id)a3;
- (void)diskImportFinished;
- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)downloadVersionThumbnail:(id)a3 version:(id)a4 completionHandler:(id)a5;
- (void)downloadVersionWithItemID:(id)a3 etag:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6;
- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)extensionIndexer:(id)a3 didChangeNeedsAuthentification:(BOOL)a4;
- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)finishSetup;
- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceIngestionAtURL:(id)a3;
- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)invalidateSession;
- (void)invalidateWithReason:(id)a3;
- (void)refreshConnectionState;
- (void)setDefaultBackend:(id)a3;
- (void)setDomainUserInfo:(id)a3;
- (void)setEjectable:(BOOL)a3;
- (void)setExtensionBackend:(id)a3;
- (void)setFilePresenters:(id)a3;
- (void)setFpfsRootBookmarkData:(id)a3;
- (void)setFpfsTestingBackendClass:(Class)a3;
- (void)setHiddenByUser:(BOOL)a3;
- (void)setIndexer:(id)a3;
- (void)setNsDomainOrNilForDefault:(id)a3;
- (void)setProvidedItemRecursiveGenerationCount:(id)a3 forItemAtURL:(id)a4;
- (void)setShouldIndexWhenStart:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStartupError:(id)a3;
- (void)setSupportsRemoteVersions:(BOOL)a3;
- (void)setSupportsSearch:(BOOL)a3;
- (void)setSupportsSyncingTrash:(BOOL)a3;
- (void)setUnableToStartup:(BOOL)a3;
- (void)setUserEnabled:(BOOL)a3;
- (void)shouldDisconnectWithStartupError;
- (void)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5;
- (void)stopIndexer;
- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
@end

@implementation FPDDomain

- (void)setNsDomainOrNilForDefault:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v6 = [(FPDDomainBackend *)self->_defaultBackend backingStoreIdentity];
  [v5 setBackingStoreIdentity:v6];

  v7 = self->_nsDomain;
  v8 = [v5 identifier];
  char v9 = [v8 isEqual:*MEMORY[0x1E4F25C00]];

  if ((v9 & 1) == 0) {
    objc_storeStrong((id *)&self->_nsDomainOrNilForDefault, a3);
  }
  if (v5) {
    objc_storeStrong((id *)&self->_nsDomain, a3);
  }
  [(FPDDomain *)self refreshConnectionState];
  if (self->_defaultBackend && (objc_opt_respondsToSelector() & 1) != 0) {
    [(FPDDomainBackend *)self->_defaultBackend didChangeDomainConfiguration:v7];
  }
  if ([(NSFileProviderDomain *)v7 isHidden]) {
    int v10 = 1;
  }
  else {
    int v10 = [(NSFileProviderDomain *)v7 isHiddenByUser];
  }
  if ([v5 isHidden])
  {
    int v11 = 1;
    if (!v7) {
      goto LABEL_17;
    }
  }
  else
  {
    int v11 = [v5 isHiddenByUser];
    if (!v7) {
      goto LABEL_17;
    }
  }
  if (v10 != v11)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v12 = [(FPDDomain *)self indexer];
    uint64_t v13 = [(FPDDomain *)self userEnabled] & (v11 ^ 1);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__FPDDomain_setNsDomainOrNilForDefault___block_invoke;
    v14[3] = &unk_1E6A74EF0;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    [v12 setIndexingEnabled:v13 completionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_17:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSFileProviderDomain)nsDomain
{
  return self->_nsDomain;
}

- (FPDDomainIndexer)indexer
{
  return self->_indexer;
}

- (BOOL)supportsSyncingTrash
{
  v2 = [(FPDDomain *)self nsDomain];
  char v3 = [v2 supportsSyncingTrash];

  return v3;
}

- (FPDVolume)volume
{
  volume = self->_volume;
  if (!volume)
  {
    v4 = [NSString stringWithFormat:@"[ASSERT] ‼️ FPDDomain must have a volume attached"];
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain volume]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 212, (const char *)[v4 UTF8String]);
  }
  return volume;
}

- (BOOL)userEnabled
{
  v2 = [(FPDDomain *)self nsDomain];
  char v3 = [v2 userEnabled];

  return v3;
}

- (BOOL)ejectable
{
  return self->_ejectable;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (unint64_t)disconnectionState
{
  if (self->_fpfsTestingBackendClass) {
    return 1;
  }
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  int v6 = [WeakRetained isAppExtensionReachable];

  if (!v6) {
    return 5;
  }
  if ([(NSFileProviderDomain *)self->_nsDomain isDisconnected])
  {
    if ([(NSFileProviderDomain *)self->_nsDomain _disconnectionOptions]) {
      return 3;
    }
    else {
      return 4;
    }
  }
  else if ([(FPDDomain *)self _shouldDisconnectDueToLowDiskSpace])
  {
    return 6;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_provider);
    v8 = [v7 descriptor];
    char v9 = [v8 disallowedByMDM];

    if (v9)
    {
      return 8;
    }
    else
    {
      if (!self->_unableToStartup) {
        return 1;
      }
      if ([(NSError *)self->_startupError fp_isFileProviderInternalError:22])
      {
        return 7;
      }
      else if ([(NSError *)self->_startupError fp_isFileProviderInternalError:23])
      {
        return 9;
      }
      else
      {
        return 2;
      }
    }
  }
}

- (BOOL)_shouldDisconnectDueToLowDiskSpace
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  shouldDisconnectDueToLowDiskSpace = v2->_shouldDisconnectDueToLowDiskSpace;
  if (!shouldDisconnectDueToLowDiskSpace)
  {
    id v5 = [(FPDDomain *)v2 volume];
    int v6 = v5;
    BOOL v4 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = [v5 monitorLowDiskSpaceRecovery];
      uint64_t v8 = [NSNumber numberWithBool:v7];
      char v9 = v2->_shouldDisconnectDueToLowDiskSpace;
      v2->_shouldDisconnectDueToLowDiskSpace = (NSNumber *)v8;

      if (!v7)
      {
        BOOL v4 = 0;
        goto LABEL_11;
      }
      int v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [(NSString *)v2->_providerDomainID fp_obfuscatedProviderDomainID];
        int v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] [diskspace] Disconnecting %@ due to low disk space.", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      int v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[FPDDomain _shouldDisconnectDueToLowDiskSpace]();
      }
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v4 = [(NSNumber *)shouldDisconnectDueToLowDiskSpace BOOLValue];
LABEL_12:
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)supportsSearch
{
  v2 = [(FPDDomain *)self nsDomain];
  char v3 = [v2 supportsSearch];

  return v3;
}

- (BOOL)supportsRemoteVersions
{
  v2 = [(FPDDomain *)self nsDomain];
  char v3 = [v2 supportsRemoteVersions];

  return v3;
}

- (BOOL)supportsPickingFolders
{
  if (self->_isUsingFPFS) {
    return 1;
  }
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  id v5 = [WeakRetained descriptor];
  if ([v5 supportsPickingFolders])
  {
    char v2 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_provider);
    uint64_t v7 = [v6 identifier];
    if ([v7 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
    {
      char v2 = 1;
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)p_provider);
      char v9 = [v8 identifier];
      if ([v9 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"])
      {
        char v2 = 1;
      }
      else
      {
        id v10 = objc_loadWeakRetained((id *)p_provider);
        int v11 = [v10 identifier];
        char v2 = [v11 isEqualToString:@"com.apple.FileProvider.LocalStorage"];
      }
    }
  }
  return v2;
}

- (BOOL)isUsingFPFS
{
  return self->_isUsingFPFS;
}

- (int64_t)errorGenerationCount
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }
  defaultBackend = self->_defaultBackend;
  return [(FPDDomainBackend *)defaultBackend errorGenerationCount];
}

- (BOOL)backgroundActivityIsPaused
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  defaultBackend = self->_defaultBackend;
  return [(FPDDomainBackend *)defaultBackend backgroundActivityIsPaused];
}

- (NSArray)rootURLs
{
  char v2 = self;
  objc_sync_enter(v2);
  if ([(FPDDomain *)v2 isPendingInitialization])
  {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v4 = [(FPDDomain *)v2 defaultBackend];
    char v3 = [v4 rootURLs];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  if ([(FPDDomain *)v4 isPendingInitialization])
  {
    *a3 = 1;
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v6 = [(FPDDomain *)v4 defaultBackend];
    id v5 = [v6 rootURLsWithTransientState:a3];
  }
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)isPendingInitialization
{
  if (!self->_defaultBackend) {
    return 1;
  }
  char v3 = [(FPDDomain *)self defaultBackend];
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && self->_deactivatedBackend == 0;

  return v4;
}

- (FPDDomainBackend)defaultBackend
{
  char v2 = self;
  objc_sync_enter(v2);
  defaultBackend = v2->_defaultBackend;
  if (!defaultBackend)
  {
    id v6 = [NSString stringWithFormat:@"[ASSERT] ‼️ not configured"];
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain defaultBackend]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 394, (const char *)[v6 UTF8String]);
  }
  BOOL v4 = defaultBackend;
  objc_sync_exit(v2);

  return v4;
}

- (NSArray)extensionStorageURLs
{
  return self->_extensionStorageURLs;
}

- (FPDExtensionSessionProtocol)session
{
  return self->_session;
}

- (NSFileProviderDomain)nsDomainOrNilForDefault
{
  return self->_nsDomainOrNilForDefault;
}

- (BOOL)unableToStartup
{
  return self->_unableToStartup;
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(FPDDomain *)self isPendingInitialization])
  {
    uint64_t v7 = FPDomainUnavailableError();
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v7);
  }
  else
  {
    [(FPDDomainBackend *)self->_defaultBackend fetchOperationServiceOrEndpointWithRequest:v8 completionHandler:v6];
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)didChangeItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v11;
  id v9 = v12;
  id v10 = v7;
  fp_dispatch_async_with_logs();
}

- (NSMutableDictionary)filePresenters
{
  return self->_filePresenters;
}

- (FPDProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (FPDProvider *)WeakRetained;
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (BOOL)isHiddenByUser
{
  char v2 = [(FPDDomain *)self nsDomain];
  char v3 = [v2 isHiddenByUser];

  return v3;
}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke(id *a1)
{
  char v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_cold_1((uint64_t)a1, v2, v3);
  }

  BOOL v4 = [a1[4] domainIdentifier];
  char v5 = [v4 isEqualToString:*((void *)a1[5] + 16)];

  if ((v5 & 1) == 0)
  {
    v14 = (void (**)(id, void *))a1[7];
    uint64_t v15 = [a1[4] domainIdentifier];
LABEL_9:
    id v16 = FPInvalidParameterError();
    v14[2](v14, v16);

    return;
  }
  id v6 = [a1[4] providerID];
  id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 26);
  id v8 = [WeakRetained identifier];
  char v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v14 = (void (**)(id, void *))a1[7];
    uint64_t v15 = [a1[4] providerID];
    goto LABEL_9;
  }
  id v10 = [a1[4] identifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F25CA8]];

  id v12 = a1[5];
  if (v11)
  {
    int v13 = [v12 defaultBackend];
    [v13 workingSetDidChangeWithCompletionHandler:a1[7]];
  }
  else
  {
    v17 = [v12 provider];
    uint64_t v18 = [v17 server];
    v19 = [(id)v18 presenterManager];
    [v19 signalPresentersForItemID:a1[4]];

    v20 = [a1[5] defaultBackend];
    LOBYTE(v18) = objc_opt_respondsToSelector();

    id v21 = a1[5];
    if (v18)
    {
      v22 = [v21 defaultBackend];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_207;
      v25[3] = &unk_1E6A738F0;
      int8x16_t v24 = *((int8x16_t *)a1 + 2);
      id v23 = (id)v24.i64[0];
      int8x16_t v26 = vextq_s8(v24, v24, 8uLL);
      id v27 = a1[6];
      id v28 = a1[7];
      [v22 didChangeItemID:v23 completionHandler:v25];
    }
    else
    {
      [v21 callExtensionForItemDidChange:a1[4] request:a1[6] completionHandler:a1[7]];
    }
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)refreshConnectionState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v2 = self;
  objc_sync_enter(v2);
  if ([(FPDDomain *)v2 isPendingInitialization]
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (objc_opt_class(), int isKindOfClass = objc_opt_isKindOfClass())
      : (int isKindOfClass = 1),
        ((isKindOfClass ^ [(FPDDomain *)v2 isConnectedToAppExtension]) & 1) != 0))
  {
    objc_sync_exit(v2);
  }
  else
  {
    BOOL v4 = [(FPDDomain *)v2 errorReflectingDisconnectionState];
    if (v4)
    {
      char v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        id v23 = v2;
        _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] domain %{public}@ is being disconnected, switching to a dead-end backend", (uint8_t *)&v22, 0xCu);
      }

      id v6 = [[FPDDeadEndExtensionSession alloc] initWithError:v4];
      id v7 = [[FPDDomainDeadEndBackend alloc] initWithDomain:v2];
      if ([(FPDDomain *)v2 isUsingFPFS]) {
        extensionBackend = v2->_extensionBackend;
      }
      else {
        extensionBackend = v2->_defaultBackend;
      }
      v14 = extensionBackend;
    }
    else
    {
      char v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        id v23 = v2;
        _os_log_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] domain %{public}@ is being re-connected, enabling extension backend", (uint8_t *)&v22, 0xCu);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&v2->_provider);
      int v11 = [WeakRetained asAppExtensionBackedProvider];

      id v12 = [FPDExtensionSession alloc];
      int v13 = [v11 sharedSessionQueue];
      id v6 = [(FPDExtensionSession *)v12 initWithDomain:v2 extension:v11 queue:v13];

      id v7 = v2->_deactivatedBackend;
      v14 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      [(FPDDomainBackend *)v2->_defaultBackend updateShouldRetryThrottledOperations:v4 == 0 completionHandler:&__block_literal_global_109];
    }
    [(FPDDeadEndExtensionSession *)v6 start];
    uint64_t v15 = v2->_session;
    objc_storeStrong((id *)&v2->_session, v6);
    BOOL v16 = [(FPDDomain *)v2 isUsingFPFS];
    uint64_t v17 = 112;
    if (v16) {
      uint64_t v17 = 120;
    }
    uint64_t v18 = *(Class *)((char *)&v2->super.isa + v17);
    *(Class *)((char *)&v2->super.isa + v17) = (Class)v7;
    v19 = v7;

    deactivatedBackend = v2->_deactivatedBackend;
    v2->_deactivatedBackend = v14;
    id v21 = v14;

    objc_sync_exit(v2);
    [(FPDExtensionSessionProtocol *)v15 cancelAsync];
    [(FPDExtensionSessionProtocol *)v15 invalidate];
    char v2 = (FPDDomain *)v15;
  }
}

- (BOOL)isConnectedToAppExtension
{
  return [(FPDDomain *)self disconnectionState] == 1;
}

- (FPDDomain)initWithIdentifier:(id)a3 nsDomain:(id)a4 extensionStorageURLs:(id)a5 purposeIdentifier:(id)a6 fpfsClass:(Class)a7 provider:(id)a8 volume:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v63 = a5;
  id v62 = a6;
  id v18 = a8;
  id v61 = a9;
  if (!v16)
  {
    v56 = [NSString stringWithFormat:@"[ASSERT] ‼️ no domain identifier"];
    v57 = fp_current_or_default_log();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 144, (const char *)[v56 UTF8String]);
  }
  v67.receiver = self;
  v67.super_class = (Class)FPDDomain;
  v19 = [(FPDDomain *)&v67 init];
  if (v19)
  {
    Class v59 = a7;
    v20 = NSString;
    [v18 identifier];
    id v21 = obj = v18;
    uint64_t v22 = objc_msgSend(v20, "fp_providerDomainIDFromProviderID:domainIdentifier:", v21, v16);
    providerDomainID = v19->_providerDomainID;
    v19->_providerDomainID = (NSString *)v22;

    id v24 = [(NSString *)v19->_providerDomainID fp_obfuscatedProviderDomainID];
    [v24 UTF8String];
    uint64_t v25 = fpfs_create_log_for_provider();
    log = v19->_log;
    v19->_log = (OS_os_log *)v25;

    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_nsDomain, a4);
    id v27 = [v17 identifier];
    if ([v27 isEqual:*MEMORY[0x1E4F25C00]]) {
      id v28 = 0;
    }
    else {
      id v28 = v17;
    }
    objc_storeStrong((id *)&v19->_nsDomainOrNilForDefault, v28);

    objc_storeWeak((id *)&v19->_provider, obj);
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    coordinatorMetadataPerURL = v19->_coordinatorMetadataPerURL;
    v19->_coordinatorMetadataPerURL = (NSMutableDictionary *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    providedItemRecursiveGenCountPerURL = v19->_providedItemRecursiveGenCountPerURL;
    v19->_providedItemRecursiveGenCountPerURL = (NSMutableDictionary *)v31;

    uint64_t v33 = objc_opt_new();
    versionsCache = v19->_versionsCache;
    v19->_versionsCache = (NSCache *)v33;

    [(NSCache *)v19->_versionsCache setCountLimit:128];
    if (providedItemsOperationQueue_onceToken != -1) {
      dispatch_once(&providedItemsOperationQueue_onceToken, &__block_literal_global_695);
    }
    objc_storeStrong((id *)&v19->_providedItemsOperationQueue, (id)providedItemsOperationQueue_operationQueue);
    objc_storeStrong((id *)&v19->_purposeIdentifier, a6);
    v35 = [(NSString *)v19->_providerDomainID fp_obfuscatedProviderDomainID];
    id v58 = [NSString stringWithFormat:@"%@: domain-queue", v35];
    v36 = (const char *)[v58 UTF8String];
    v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v38 = dispatch_queue_create(v36, v37);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v38;

    id v40 = [NSString stringWithFormat:@"%@: ext-domain-queue", v35];
    v41 = (const char *)[v40 UTF8String];
    v42 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v43 = dispatch_queue_create(v41, v42);
    extCallOutQueue = v19->_extCallOutQueue;
    v19->_extCallOutQueue = (OS_dispatch_queue *)v43;

    v19->_fpfsClass = v59;
    objc_storeStrong((id *)&v19->_extensionStorageURLs, a5);
    uint64_t v45 = [objc_alloc(MEMORY[0x1E4F25D50]) initWithName:@"root-creation" queue:v19->_serialQueue minFireInterval:1.0];
    rootCreationPacer = v19->_rootCreationPacer;
    v19->_rootCreationPacer = (FPPacer *)v45;

    id location = 0;
    objc_initWeak(&location, v19);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __106__FPDDomain_initWithIdentifier_nsDomain_extensionStorageURLs_purposeIdentifier_fpfsClass_provider_volume___block_invoke;
    v64[3] = &unk_1E6A74010;
    objc_copyWeak(&v65, &location);
    [(FPPacer *)v19->_rootCreationPacer setEventBlock:v64];
    id v18 = obj;
    if (!v19->_nsDomainOrNilForDefault)
    {
      v19->_isUsingFPFS = 0;
      [v17 setReplicated:0];
    }
    objc_storeStrong((id *)&v19->_volume, a9);
    v47 = [(FPDDomain *)v19 nsDomain];
    char v48 = [v47 isReplicated];

    if ((v48 & 1) == 0)
    {
      shouldDisconnectDueToLowDiskSpace = v19->_shouldDisconnectDueToLowDiskSpace;
      v19->_shouldDisconnectDueToLowDiskSpace = (NSNumber *)MEMORY[0x1E4F1CC28];
    }
    if (FPFeatureFlagSpaceAttributionIsEnabled())
    {
      uint64_t v50 = objc_opt_new();
      saPathManager = v19->_saPathManager;
      v19->_saPathManager = (SAPathManager *)v50;
    }
    v52 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C08] code:-2012 userInfo:0];
    v53 = [[FPDDomainDeadEndBackend alloc] initWithDomain:v19 materializationError:v52];
    defaultBackend = v19->_defaultBackend;
    v19->_defaultBackend = (FPDDomainBackend *)v53;

    objc_storeStrong((id *)&v19->_extensionBackend, v19->_defaultBackend);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  return v19;
}

void __106__FPDDomain_initWithIdentifier_nsDomain_extensionStorageURLs_purposeIdentifier_fpfsClass_provider_volume___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createRootAndObserveIfNeededWithReason:@"deferredRootCreation" userAllowedDBDrop:0 completion:&__block_literal_global_15];
}

- (NSError)errorReflectingDisconnectionState
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(FPDDomain *)self disconnectionState];
  if (v2 == 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F25C08];
    uint64_t v9 = *MEMORY[0x1E4F25C18];
    id v6 = [NSNumber numberWithUnsignedInteger:v2];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v3 = [v4 errorWithDomain:v5 code:-1004 userInfo:v7];
  }
  return (NSError *)v3;
}

- (BOOL)isHiddenDefaultDomain
{
  BOOL v3 = [(NSFileProviderDomain *)self->_nsDomain isHidden];
  if (v3)
  {
    identifier = self->_identifier;
    uint64_t v5 = *MEMORY[0x1E4F25C00];
    LOBYTE(v3) = [(NSString *)identifier isEqualToString:v5];
  }
  return v3;
}

- (BOOL)isDefaultDomain
{
  unint64_t v2 = [(FPDDomain *)self nsDomain];
  BOOL v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F25C00]];

  return v4;
}

- (BOOL)isHidden
{
  return [(NSFileProviderDomain *)self->_nsDomain isHidden];
}

- (NSArray)coordinationRootURLs
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(FPDDomain *)v2 isPendingInitialization])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    char v4 = [(FPDDomain *)v2 defaultBackend];
    BOOL v3 = [v4 coordinationRootURLs];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)checkableURLs
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(FPDDomain *)v2 isPendingInitialization])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    char v4 = [(FPDDomain *)v2 defaultBackend];
    BOOL v3 = [v4 checkableURLs];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FPDDomain *)self fp_prettyDescription];
  BOOL v6 = [(NSFileProviderDomain *)self->_nsDomain userEnabled];
  id v7 = @"user-disabled";
  if (v6) {
    id v7 = @"user-enabled";
  }
  if (self->_ejectable) {
    id v8 = @", ejectable";
  }
  else {
    id v8 = &stru_1F2EC3618;
  }
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p> %@, %@%@", v4, self, v5, v7, v8];

  return (NSString *)v9;
}

- (NSString)fp_prettyDescription
{
  BOOL v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  uint64_t v5 = [WeakRetained identifier];
  BOOL v6 = [(NSString *)self->_identifier fp_obfuscatedFilename];
  id v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return (NSString *)v7;
}

- (void)setDefaultBackend:(id)a3
{
  uint64_t v4 = (FPDDomainBackend *)a3;
  id obj = self;
  objc_sync_enter(obj);
  defaultBackend = obj->_defaultBackend;
  obj->_defaultBackend = v4;

  objc_sync_exit(obj);
}

- (FPDDomainBackend)extensionBackend
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_extensionBackend;
  objc_sync_exit(v2);

  return v3;
}

- (void)setExtensionBackend:(id)a3
{
  uint64_t v4 = (FPDDomainBackend *)a3;
  id obj = self;
  objc_sync_enter(obj);
  extensionBackend = obj->_extensionBackend;
  obj->_extensionBackend = v4;

  objc_sync_exit(obj);
}

void __35__FPDDomain_refreshConnectionState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __35__FPDDomain_refreshConnectionState__block_invoke_cold_1();
    }
  }
}

- (void)setUserEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_provider),
        [WeakRetained descriptor],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 canToggleDomainVisibility],
        v6,
        WeakRetained,
        (v7 & 1) != 0))
  {
    id v10 = [(FPDDomain *)self nsDomain];
    [v10 setUserEnabled:v3];
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = self;
      _os_log_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring user-disabling the domain, because its visibility cannot be changed for %@", buf, 0xCu);
    }

    uint64_t v9 = [(FPDDomain *)self nsDomain];
    [v9 setUserEnabled:1];
  }
}

- (void)setHiddenByUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_provider),
        [WeakRetained descriptor],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 canToggleDomainVisibility],
        v6,
        WeakRetained,
        (v7 & 1) != 0))
  {
    id v10 = [(FPDDomain *)self nsDomain];
    [v10 setHiddenByUser:v3];
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = self;
      _os_log_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring user-disabling the domain, because its visibility cannot be changed for %@", buf, 0xCu);
    }

    uint64_t v9 = [(FPDDomain *)self nsDomain];
    [v9 setHiddenByUser:0];
  }
}

void __40__FPDDomain_setNsDomainOrNilForDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = [*(id *)(a1 + 32) isHidden];
    int v7 = [WeakRetained[19] isHidden];
    v8[0] = 67109634;
    v8[1] = v6;
    __int16 v9 = 1024;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_1D744C000, v5, OS_LOG_TYPE_ERROR, "[ERROR] Failed switching indexer from %d to %d: %@", (uint8_t *)v8, 0x18u);
  }
}

- (BOOL)shouldDisconnectWithStartupError
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPDDomain *)self startupError];
  int v4 = objc_msgSend(v3, "fp_isPOSIXErrorCode:", 28);

  if (v4)
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = self;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Initializing disconnected (low disk space) provider for %@", (uint8_t *)&v14, 0xCu);
    }

    int v6 = [(FPDDomain *)self volume];
    int v7 = v6;
    if (v6)
    {
      [v6 monitorLowDiskSpaceRecovery];
    }
    else
    {
      id v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[FPDDomain shouldDisconnectWithStartupError]();
      }
    }
LABEL_15:

    return 1;
  }
  id v8 = [(FPDDomain *)self startupError];
  int v9 = objc_msgSend(v8, "fp_isFileProviderInternalError:", 22);

  if (v9)
  {
    int v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain shouldDisconnectWithStartupError]();
    }
    goto LABEL_15;
  }
  int v10 = [(FPDDomain *)self startupError];
  int v11 = objc_msgSend(v10, "fp_isFileProviderInternalError:", 23);

  if (v11)
  {
    int v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain shouldDisconnectWithStartupError]();
    }
    goto LABEL_15;
  }
  return 0;
}

- (void)finishSetup
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Initializing fpfs testing provider for %@", v2, v3, v4, v5, v6);
}

- (BOOL)createRootByImportingDirectoryAtURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(FPDDomainBackend *)self->_defaultBackend createRootByImportingURL:a3 knownFolders:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)createRootURLWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v5 = self->_defaultBackend;
  BOOL v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v7 = [v6 currentPersona];

  id v38 = 0;
  id v8 = [v7 userPersonaUniqueString];
  int v9 = [(FPDDomain *)self nsDomain];
  int v10 = [v9 personaIdentifier];
  if (v8 == v10)
  {

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  int v11 = [(FPDDomain *)self nsDomain];
  id v12 = [v11 personaIdentifier];
  char v13 = [v8 isEqualToString:v12];

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v37 = 0;
  int v14 = (void *)[v7 copyCurrentPersonaContextWithError:&v37];
  id v15 = v37;
  id v16 = v38;
  id v38 = v14;

  if (v15)
  {
    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FPDServer migrateLegacyFPFSLocations].cold.5();
    }
  }
  id v18 = [(FPDDomain *)self nsDomain];
  v19 = [v18 personaIdentifier];
  v20 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v19];

  if (v20)
  {
    id v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = [(FPDDomain *)self nsDomain];
      v32 = [v31 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v40 = v32;
      __int16 v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_1D744C000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  if ([(FPDDomain *)self isDefaultDomain])
  {
    if ([(FPDDomain *)self isHiddenDefaultDomain])
    {
      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomain createRootURLWithCompletion:]();
      }

      FPDomainUnavailableError();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v23);
    }
    else
    {
      int8x16_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomain createRootURLWithCompletion:]();
      }

      id v27 = (void *)MEMORY[0x1E4F25D30];
      id v28 = [(FPDDomain *)self providerDomainID];
      id v23 = [v27 rootItemIDWithProviderDomainID:v28];

      uint64_t v29 = (void *)[(FPDExtensionSessionProtocol *)self->_session newFileProviderProxyWithTimeout:0 pid:-1.0];
      v30 = [MEMORY[0x1E4F25DF0] requestFromTheSystem];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __41__FPDDomain_createRootURLWithCompletion___block_invoke;
      v33[3] = &unk_1E6A74F18;
      v33[4] = self;
      v35 = v4;
      v34 = v5;
      [v29 itemForItemID:v23 request:v30 completionHandler:v33];
    }
  }
  else
  {
    id v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain createRootURLWithCompletion:]();
    }

    id v36 = 0;
    uint64_t v25 = [(FPDDomainBackend *)v5 createRootByImportingURL:0 knownFolders:MEMORY[0x1E4F1CBF0] error:&v36];
    id v23 = v36;
    ((void (**)(id, void *, id))v4)[2](v4, v25, v23);
  }
  _FPRestorePersona();
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(NSObject **)(v6 + 168);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__FPDDomain_createRootURLWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6A747B0;
  id v10 = v5;
  uint64_t v11 = v6;
  id v13 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = fp_current_or_default_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_2((uint64_t)a1);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (v4) {
      __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_1((uint64_t)a1, v3, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)a1[6];
    id v14 = 0;
    id v12 = [v11 createRootByImportingURL:0 knownFolders:MEMORY[0x1E4F1CBF0] error:&v14];
    id v13 = v14;
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)_prepareFileCoordinationProviders
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = (id)fileCoordinationProviderByURL;
  objc_sync_enter(v3);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int8x16_t v26 = self;
  id v23 = v3;
  BOOL v4 = [(FPDDomain *)self coordinationRootURLs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  id obj = v4;
  uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v9 = (id)fileCoordinationProviderByURL;
        id v10 = (id)[v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v29;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
              if (objc_msgSend(v13, "fp_relationshipToItemAtURL:", v8) == 1)
              {
                id v14 = [(id)fileCoordinationProviderByURL objectForKeyedSubscript:v13];
                id v10 = v13;
                goto LABEL_16;
              }
            }
            id v10 = (id)[v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        id v14 = 0;
LABEL_16:

        id v15 = +[FPDKnownFolderArbiter desktopURL];
        BOOL v16 = objc_msgSend(v15, "fp_relationshipToItemAtURL:", v8) == 1;

        id v17 = +[FPDKnownFolderArbiter documentsURL];
        BOOL v18 = objc_msgSend(v17, "fp_relationshipToItemAtURL:", v8) == 1;

        if (v18) {
          v6 |= v16 | 2;
        }
        else {
          v6 |= v16;
        }
        if (v14)
        {
          [(id)fileCoordinationProviderByURL removeObjectForKey:v10];
        }
        else
        {
          id v14 = [[FPDFileCoordinationProvider alloc] initWithRootURL:v8];
          [(FPDFileCoordinationProvider *)v14 setExtensionIdentifier:v26->_identifier];
        }
        [(id)fileCoordinationProviderByURL setObject:v14 forKeyedSubscript:v8];
        [(FPDFileCoordinationProvider *)v14 setDelegate:v26];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v23);
  v19 = [(FPDDomain *)v26 nsDomain];
  BOOL v20 = v6 == [v19 replicatedKnownFolders];

  if (!v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v26->_provider);
    identifier = v26->_identifier;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__FPDDomain__prepareFileCoordinationProviders__block_invoke;
    v27[3] = &unk_1E6A73580;
    v27[4] = v26;
    [WeakRetained setReplicatedKnownFolders:v6 forDomainIdentifier:identifier completionHandler:v27];
  }
}

void __46__FPDDomain__prepareFileCoordinationProviders__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  uint64_t v1 = [WeakRetained manager];
  uint64_t v2 = [v1 server];
  [v2 signalProviderChanges];
}

- (void)_checkDomainConnectionPermittedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = [(FPDDomain *)self volume];
  int v6 = [v5 role];

  if (v6 == 3
    && ([(FPDDomain *)self session],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    extCallOutQueue = self->_extCallOutQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E6A73878;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(extCallOutQueue, v10);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = (void *)[v2 newFileProviderProxyWithTimeout:0 pid:180.0];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E6A73710;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 shouldConnectExternalDomainWithCompletionHandler:v5];
}

void __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E6A74AA8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_startObservingRootAndResumeIndexerWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  serialQueue = self->_serialQueue;
  id v9 = a5;
  dispatch_assert_queue_V2(serialQueue);
  id v10 = [(FPDDomain *)self provider];
  id v11 = [v10 asAppExtensionBackedProvider];

  self->_isObservingRoot = 1;
  [(FPDDomain *)self _prepareFileCoordinationProviders];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v7;
  id v12 = v11;
  id v13 = v7;
  fp_dispatch_async_with_logs();
  -[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:](self, "_registerFileCoordinatorAndSpaceForceWithCompletion:", v9, v14, 3221225472, __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke, &unk_1E6A740D8, self);
}

uint64_t __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t section = __fp_create_section();
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[19];
    id v7 = [v5 defaultBackend];
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = section;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    BOOL v18 = v7;
    _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting domain %@ with backend %@", buf, 0x20u);
  }
  id v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122;
  v8[3] = &unk_1E6A74F68;
  v8[4] = v3;
  id v9 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v3 _checkDomainConnectionPermittedWithCompletionHandler:v8];

  return __fp_leave_section_Debug();
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122_cold_2(v3, v4);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "fp_externalDomainRejectedErrorWithUnderlyingError:", v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) defaultBackend];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  id v25 = 0;
  char v9 = [v6 startWithReason:v7 userAllowedDBDrop:v8 error:&v25];
  id v5 = v25;

  if ((v9 & 1) == 0)
  {
LABEL_7:
    id v12 = *(id *)(*(void *)(a1 + 32) + 152);
    id v13 = [*(id *)(a1 + 48) server];
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122_cold_1((uint64_t)v12, v5, v14);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(NSObject **)(v15 + 168);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_123;
    v20[3] = &unk_1E6A73AC8;
    v20[4] = v15;
    id v21 = *(id *)(a1 + 48);
    id v22 = v12;
    id v5 = v5;
    id v23 = v5;
    id v24 = v13;
    id v17 = v13;
    id v18 = v12;
    dispatch_async(v16, v20);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(NSObject **)(v10 + 168);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_3;
    block[3] = &unk_1E6A73FE8;
    block[4] = v10;
    dispatch_async(v11, block);
  }
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_123(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 105))
  {
    id v4 = [*(id *)(a1 + 32) defaultBackend];
    [v4 invalidate];
  }
  else
  {
    uint64_t v1 = *(void **)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_2;
    v5[3] = &unk_1E6A74F40;
    uint64_t v3 = *(void *)(a1 + 56);
    id v6 = *(id *)(a1 + 64);
    [v1 reloadDomain:v2 unableToStartup:1 startupError:v3 completionHandler:v5];
  }
}

uint64_t __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalProviderChanges];
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaultBackend];
  uint64_t v3 = [v2 backingStoreIdentity];
  [*(id *)(*(void *)(a1 + 32) + 152) setBackingStoreIdentity:v3];

  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[105] || v4[51])
  {
    id v7 = [v4 defaultBackend];
    [v7 invalidate];
  }
  else if ([MEMORY[0x1E4F25CE0] runningInSyncBubble])
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] shared iPad: skipping indexing because we're just finishing sync", buf, 2u);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) indexer];
    [v6 start];

    *(unsigned char *)(*(void *)(a1 + 32) + 50) = 1;
  }
}

- (void)createRootAndObserveIfNeededWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  char v9 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v10 = [(FPDDomain *)self log];
  fpfs_adopt_log();
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_isObservingRoot)
  {
    v9[2](v9);
  }
  else if ([(FPDDomainBackend *)self->_defaultBackend needsRootsCreation])
  {
    char v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:]();
    }

    id v12 = self->_rootCreationPacer;
    [(FPPacer *)v12 suspend];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke;
    v15[3] = &unk_1E6A74F90;
    v15[4] = self;
    id v13 = v12;
    uint64_t v16 = v13;
    id v18 = v9;
    id v17 = v8;
    BOOL v19 = v6;
    [(FPDDomain *)self createRootURLWithCompletion:v15];
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:]();
    }

    [(FPDDomain *)self _startObservingRootAndResumeIndexerWithReason:v8 userAllowedDBDrop:v6 completion:v9];
  }
  __fp_pop_log();
}

void __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 168));
  id v7 = [*(id *)(a1 + 32) log];
  fpfs_adopt_log();
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = *(unsigned char **)(a1 + 32);
  if (v8[105])
  {
    char v9 = [*(id *)(a1 + 32) defaultBackend];
    [v9 invalidate];
  }
  else
  {
    if (!v6)
    {
      uint64_t v14 = *(unsigned __int8 *)(a1 + 64);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_126;
      v16[3] = &unk_1E6A73878;
      uint64_t v15 = *(void *)(a1 + 48);
      id v17 = *(id *)(a1 + 40);
      id v18 = *(id *)(a1 + 56);
      [v8 _startObservingRootAndResumeIndexerWithReason:v15 userAllowedDBDrop:v14 completion:v16];

      goto LABEL_4;
    }
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_cold_1();
    }

    char v11 = [*(id *)(a1 + 32) defaultBackend];
    [v11 invalidate];

    id v12 = *(unsigned char **)(a1 + 32);
    if (!v12[50])
    {
      id v13 = [v12 indexer];
      [v13 start];

      *(unsigned char *)(*(void *)(a1 + 32) + 50) = 1;
    }
  }
  [*(id *)(a1 + 40) resume];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_4:
  __fp_pop_log();
}

uint64_t __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_126(uint64_t a1)
{
  [*(id *)(a1 + 32) resume];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)didRefreshRootURLsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  fpfs_adopt_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  id v6 = [WeakRetained manager];
  id v7 = [v6 server];
  [v7 signalProviderChanges];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FPDDomain_didRefreshRootURLsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6A73878;
  block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(serialQueue, block);

  __fp_pop_log();
}

uint64_t __53__FPDDomain_didRefreshRootURLsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareFileCoordinationProviders];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _registerFileCoordinatorAndSpaceForceWithCompletion:v3];
}

- (void)diskImportFinished
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] disk import finished for domain %@", v2, v3, v4, v5, v6);
}

- (void)_startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v10 = [(FPDDomain *)self indexer];

  if (v10)
  {
    long long v31 = [NSString stringWithFormat:@"[ASSERT] ‼️ domain already registered"];
    long long v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 943, (const char *)[v31 UTF8String]);
  }
  id v11 = [(FPDDomain *)self identifier];

  if (!v11)
  {
    long long v33 = [NSString stringWithFormat:@"[ASSERT] ‼️ no domain"];
    long long v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 944, (const char *)[v33 UTF8String]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  if (!WeakRetained)
  {
    long long v35 = [NSString stringWithFormat:@"[ASSERT] ‼️ no provider"];
    id v36 = fp_current_or_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 945, (const char *)[v35 UTF8String]);
  }
  self->_started = 1;
  fpfs_adopt_log();
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t section = __fp_create_section();
  id v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(FPDDomain *)self identifier];
    uint64_t v15 = objc_msgSend(v14, "fp_obfuscatedProviderDomainID");
    *(_DWORD *)buf = 134218498;
    uint64_t v43 = section;
    __int16 v44 = 2114;
    uint64_t v45 = v15;
    __int16 v46 = 2114;
    id v47 = v8;
    _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx starting domain %{public}@ with reason %{public}@", buf, 0x20u);
  }
  [(FPDExtensionSessionProtocol *)self->_session start];
  uint64_t v16 = [(FPDDomain *)self provider];
  char v17 = [v16 isAppExtensionReachable];

  if ((v17 & 1) == 0)
  {
    id v21 = [(FPDDomain *)self defaultBackend];
    [v21 startWithReason:v8 userAllowedDBDrop:v6 error:0];

    goto LABEL_13;
  }
  if ([(FPDDomain *)self isHiddenDefaultDomain])
  {
LABEL_13:
    v9[2](v9);
    goto LABEL_14;
  }
  id v18 = [(FPDDomain *)self defaultBackend];
  int v19 = [v18 isDeadEndBackend];

  if (v19)
  {
    uint64_t v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v20, OS_LOG_TYPE_INFO, "[INFO] registering for coordination and returning early for deadend backend", buf, 2u);
    }

    [(FPDDomain *)self _prepareFileCoordinationProviders];
    [(FPDDomain *)self _registerFileCoordinatorAndSpaceForceWithCompletion:v9];
  }
  else
  {
    id v22 = [(FPDDomain *)self provider];
    id v23 = [v22 asAppExtensionBackedProvider];

    if ([(FPDDomain *)self userEnabled] && ![(FPDDomain *)self isHiddenByUser]) {
      uint64_t v24 = [(FPDDomain *)self isHidden] ^ 1;
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = [(FPDDomain *)self defaultBackend];
    id v39 = 0;
    int8x16_t v26 = [v25 createIndexerWithExtension:v23 enabled:v24 error:&v39];
    id v27 = v39;

    if (v26)
    {
      [v26 setDelegate:self];
      [(FPDDomain *)self setIndexer:v26];
      long long v28 = [(FPDDomain *)self indexer];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        id v37 = [NSString stringWithFormat:@"[ASSERT] ‼️ should not be nil"];
        uint64_t v38 = fp_current_or_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          +[FPDVolume prettyNameForDomain:]();
        }

        __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 996, (const char *)[v37 UTF8String]);
      }
      [(FPDDomain *)self createRootAndObserveIfNeededWithReason:v8 userAllowedDBDrop:v6 completion:v9];
      [(FPPacer *)self->_rootCreationPacer resume];
    }
    else
    {
      long long v30 = fp_current_or_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v27, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[FPDDomain _startWithReason:userAllowedDBDrop:completion:]();
      }

      v9[2](v9);
    }
  }
LABEL_14:
  __fp_leave_section_Notice();
  __fp_pop_log();
}

- (void)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__FPDDomain_startWithReason_userAllowedDBDrop_completion___block_invoke;
  v13[3] = &unk_1E6A74FB8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(serialQueue, v13);
}

uint64_t __58__FPDDomain_startWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithReason:*(void *)(a1 + 40) userAllowedDBDrop:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)cancelPendingCoordinations
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_coordinatorMetadataPerURL copy];
  [(NSMutableDictionary *)self->_coordinatorMetadataPerURL removeAllObjects];
  char v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28CE0], "responseWithError:");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v3;
  uint64_t v5 = [v3 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = [v10 allValues];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              BOOL v16 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) completionHandler];
              ((void (**)(void, void *))v16)[2](v16, v4);

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)stopIndexer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, a3, (uint64_t)a3, "[DEBUG] ┏%llx Stopping indexer %@...", (uint8_t *)&v4);
}

void __24__FPDDomain_stopIndexer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[51])
  {
    int v4 = [NSString stringWithFormat:@"[ASSERT] ‼️ Trying to stop already stopped indexer"];
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain stopIndexer]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1031, (const char *)[v4 UTF8String]);
  }
  if (v1[105])
  {
    __int16 v6 = [NSString stringWithFormat:@"[ASSERT] ‼️ Trying to stop indexer on invalided domain"];
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain stopIndexer]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1032, (const char *)[v6 UTF8String]);
  }
  v1[50] = 1;
  uint64_t v3 = [*(id *)(a1 + 32) indexer];
  [v3 invalidate];

  *(unsigned char *)(*(void *)(a1 + 32) + 51) = 1;
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_invalidated = 1;
  uint64_t section = __fp_create_section();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = section;
    __int16 v11 = 2112;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Invalidating %@ (reason: %{public}@)...", buf, 0x20u);
  }

  [(FPDDomain *)self _unregisterFromFileCoordinatorAndSpaceForce];
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__FPDDomain_invalidateWithReason___block_invoke;
  v7[3] = &unk_1E6A73FE8;
  void v7[4] = self;
  dispatch_sync(serialQueue, v7);
  [(NSURL *)self->_previouslyAccessedSecurityScopedURL stopAccessingSecurityScopedResource];
  __fp_leave_section_Notice();
}

void __34__FPDDomain_invalidateWithReason___block_invoke(uint64_t a1)
{
  id v4 = fpfs_adopt_log();
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 51))
  {
    *(unsigned char *)(v2 + 50) = 1;
    uint64_t v3 = [*(id *)(a1 + 32) indexer];
    [v3 invalidate];

    *(unsigned char *)(*(void *)(a1 + 32) + 51) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 112) invalidate];
  [*(id *)(a1 + 32) cancelPendingCoordinations];
  __fp_pop_log();
}

- (void)invalidateSession
{
}

- (id)cleanupDomainWithMode:(unint64_t)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(FPDDomain *)self provider];
  __int16 v6 = [v5 identifier];
  if ([v6 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
  {
    int v7 = 1;
  }
  else
  {
    uint64_t v8 = [(FPDDomain *)self provider];
    uint64_t v9 = [v8 identifier];
    int v7 = [v9 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"];
  }
  uint64_t v10 = [MEMORY[0x1E4F3A6E0] sharedInstance];
  __int16 v11 = [(FPDDomain *)self providerDomainID];
  v36[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v10 removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:v12 completionHandler:&__block_literal_global_147];

  if (objc_opt_respondsToSelector())
  {
    __int16 v13 = [(FPDDomainBackend *)self->_defaultBackend cleanupDomainWithMode:a3 error:0];
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 resultURL];
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
  BOOL v16 = [(FPDDomain *)self indexer];
  if (v16) {
    char v17 = v7;
  }
  else {
    char v17 = 1;
  }
  if (v17)
  {
    if (v7)
    {
      id v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        long long v19 = [(FPDDomain *)self providerDomainID];
        long long v20 = objc_msgSend(v19, "fp_obfuscatedProviderDomainID");
        -[FPDDomain cleanupDomainWithMode:](v20, (uint64_t)v35, v18, v19);
      }
    }
  }
  else
  {
    long long v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      long long v22 = [(FPDDomain *)self providerDomainID];
      long long v23 = objc_msgSend(v22, "fp_obfuscatedProviderDomainID");
      -[FPDDomain cleanupDomainWithMode:].cold.4(v23, (uint64_t)v35, v21, v22);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __35__FPDDomain_cleanupDomainWithMode___block_invoke_150;
    v31[3] = &unk_1E6A73580;
    v31[4] = self;
    [v16 dropIndexForReason:1 completion:v31];
  }
  long long v24 = [(FPDDomain *)self supportURL];
  long long v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v34 = v24;
    _os_log_impl(&dword_1D744C000, v25, OS_LOG_TYPE_INFO, "[INFO] removing support directory at %@", buf, 0xCu);
  }

  id v26 = v24;
  [v26 fileSystemRepresentation];
  if ((fpfs_recursive_unlinkat() & 0x80000000) != 0)
  {
    id v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = __error();
      uint64_t v29 = strerror(*v28);
      -[FPDDomain cleanupDomainWithMode:]((uint64_t)v29, (uint64_t)buf, (uint64_t)v26, v27);
    }
  }
  else
  {
    id v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain cleanupDomainWithMode:]();
    }
  }

  __fp_pop_log();
  return v15;
}

void __35__FPDDomain_cleanupDomainWithMode___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = [*(id *)(a1 + 32) indexer];
      int v7 = objc_msgSend(v3, "fp_prettyDescription");
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      __int16 v11 = v7;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to async drop index for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __35__FPDDomain_cleanupDomainWithMode___block_invoke_150_cold_1(a1, v5);
  }
}

- (void)extensionIndexer:(id)a3 didChangeNeedsAuthentification:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = fpfs_adopt_log();
  if (!v4 && !self->_isObservingRoot) {
    [(FPPacer *)self->_rootCreationPacer signal];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  uint64_t v8 = [WeakRetained manager];
  uint64_t v9 = [(id)v8 server];
  [v9 signalProviderChanges];

  __int16 v10 = [(FPDDomain *)self defaultBackend];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    __int16 v11 = [(FPDDomain *)self defaultBackend];
    [v11 didChangeNeedsAuthentification:v4];
  }
  __fp_pop_log();
}

- (id)_fileReactorID
{
  return self->_purposeIdentifier;
}

- (id)_providedItemsOperationQueue
{
  return self->_providedItemsOperationQueue;
}

- (id)_physicalURLForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_extensionBackend == self->_defaultBackend)
  {
    id v6 = 0;
    if (([v4 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      int v7 = [MEMORY[0x1E4F25DE0] placeholderURLForURL:v5];
      id v6 = 0;
      if ([v7 checkResourceIsReachableAndReturnError:0]) {
        id v6 = v7;
      }
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)_siblingDelegateForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPDDomain *)self provider];
  id v6 = [v5 domainForURL:v4];

  if (v6 == self) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

- (id)_removeProgressForProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(serialQueue);
  uint64_t v9 = [(NSMutableDictionary *)self->_coordinatorMetadataPerURL objectForKeyedSubscript:v6];
  __int16 v10 = [v9 objectForKeyedSubscript:v8];
  [v9 setObject:0 forKeyedSubscript:v8];

  if (![v9 count]) {
    [(NSMutableDictionary *)self->_coordinatorMetadataPerURL setObject:0 forKeyedSubscript:v6];
  }

  return v10;
}

- (id)getProvidedItemRecursiveGenerationCountForItemAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_providedItemRecursiveGenCountPerURL;
  if (([v4 hasDirectoryPath] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    int v7 = [v4 path];
    uint64_t v8 = [v6 fileURLWithPath:v7 isDirectory:1];

    id v4 = (id)v8;
  }
  uint64_t v9 = v5;
  objc_sync_enter(v9);
  __int16 v10 = [(NSMutableDictionary *)v9 objectForKey:v4];
  objc_sync_exit(v9);

  if (errorInjectionPointEnabled(0, 2)) {
    id v11 = (id)[objc_alloc(NSNumber) initWithLong:0xFFFFFFFFLL];
  }
  else {
    id v11 = v10;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)setProvidedItemRecursiveGenerationCount:(id)a3 forItemAtURL:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  int v7 = self->_providedItemRecursiveGenCountPerURL;
  if (([v6 hasDirectoryPath] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v6 path];
    uint64_t v10 = [v8 fileURLWithPath:v9 isDirectory:1];

    id v6 = (id)v10;
  }
  id v11 = v7;
  objc_sync_enter(v11);
  if (v12) {
    [(NSMutableDictionary *)v11 setObject:v12 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)v11 removeObjectForKey:v6];
  }
  objc_sync_exit(v11);
}

- (BOOL)_isProviderBlockingConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPDDomain *)self provider];
  objc_sync_enter(v5);
  id v6 = [(FPDDomain *)self provider];
  int v7 = [v6 blockedProcessNames];
  char v8 = [v7 containsObject:v4];

  objc_sync_exit(v5);
  return v8;
}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28CA0] _kernelMaterializationInfo];
  uint64_t v12 = [MEMORY[0x1E4F28CA0] _readingOptions];
  if (v9) {
    uint64_t v13 = [MEMORY[0x1E4F28CA0] _processIdentifierForID:v9];
  }
  else {
    uint64_t v13 = 0;
  }
  *(void *)&long long v14 = -1;
  *((void *)&v14 + 1) = -1;
  v15[0] = v14;
  v15[1] = v14;
  [(FPDDomain *)self _provideItemAtURL:v8 withReaderID:v9 withProcessID:v13 withAuditToken:v15 kernelInfo:v11 readingOptions:v12 completionHandler:v10];
}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    [v9 readerAuditToken];
  }
  else {
    memset(&atoken, 0, sizeof(atoken));
  }
  uint64_t v11 = audit_token_to_pid(&atoken);
  uint64_t v12 = [v9 readerID];
  if (v9) {
    [v9 readerAuditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  uint64_t v13 = [v9 kernelMaterializationInfo];
  -[FPDDomain _provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:](self, "_provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:", v8, v12, v11, v14, v13, [v9 readingOptions], v10);
}

- (void)_provideItemAtURL:(id)a3 withReaderID:(id)a4 withProcessID:(int)a5 withAuditToken:(id *)a6 kernelInfo:(id)a7 readingOptions:(unint64_t)a8 completionHandler:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v46 = a7;
  id v43 = a9;
  fpfs_adopt_log();
  unint64_t v57 = a8;
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  if (v12)
  {
    FPExecutableNameForProcessIdentifier();
    char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v17 = @"(unknown)";
  }
  id v18 = +[FPDCoordinator requestForClaimID:v16];
  long long v19 = v18;
  if (v18)
  {
    long long v20 = NSString;
    long long v21 = [v18 processName];
    uint64_t v48 = [v20 stringWithFormat:@"%@ (on behalf of %@)", v17, v21];

    memset(buf, 0, sizeof(buf));
    objc_msgSend(v19, "audit_token");
    if ((*(void *)buf & *(void *)&buf[8] & *(void *)&buf[16] & *(void *)&buf[24]) == -1)
    {
      long long v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        id v40 = objc_msgSend(v15, "fp_shortDescription");
        *(_DWORD *)v68 = 138412802;
        *(void *)&v68[4] = v40;
        __int16 v69 = 2112;
        v70 = v48;
        __int16 v71 = 2114;
        id v72 = v16;
        _os_log_fault_impl(&dword_1D744C000, v22, OS_LOG_TYPE_FAULT, "[CRIT] _provideItemAtURL for %@: requestToken is empty, consumer:%@, readerID: %{public}@", v68, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v48 = v17;
  }
  unint64_t v42 = v55[3];
  if ((v42 & 0x40000000) != 0)
  {
    id v47 = [v46 fileMaterializationInfo];
    int v44 = [v46 operation];
    if (v47)
    {
      uint64_t v45 = [NSString stringWithFormat:@"<%lld, %lld>", objc_msgSend(v47, "offset"), objc_msgSend(v47, "size")];
      goto LABEL_15;
    }
  }
  else
  {
    int v44 = 0;
  }
  uint64_t v45 = 0;
  id v47 = 0;
LABEL_15:
  *(void *)v68 = 0;
  *(void *)v68 = __fp_create_section();
  long long v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = a6;
    uint64_t v24 = v12;
    id v25 = v16;
    uint64_t v26 = *(void *)v68;
    id v27 = [(FPDDomain *)self fp_prettyDescription];
    long long v28 = objc_msgSend(v15, "fp_shortDescription");
    uint64_t v29 = objc_msgSend(NSString, "fp_coordinatorReadingOptions:", v55[3]);
    long long v30 = (void *)v29;
    long long v31 = @"<full>";
    *(_DWORD *)buf = 134219522;
    if (v45) {
      long long v31 = v45;
    }
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v28;
    __int16 v60 = 2112;
    id v61 = v48;
    __int16 v62 = 2114;
    id v16 = v25;
    id v63 = v25;
    __int16 v64 = 2114;
    uint64_t v65 = v29;
    __int16 v66 = 2114;
    objc_super v67 = v31;
    _os_log_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx ⭕️ NSFileCoordinator requested %@ to provide item at %@ (consumer: %@, readerID: %{public}@, options: %{public}@, range: %{public}@)", buf, 0x48u);

    uint64_t v12 = v24;
    a6 = v41;
  }
  if ((*((unsigned char *)v55 + 27) & 0x40) == 0) {
    goto LABEL_26;
  }
  uint64_t v32 = _executableNameIsBlockedForMaterialization_once;
  id v33 = v48;
  if (v32 != -1) {
    dispatch_once(&_executableNameIsBlockedForMaterialization_once, &__block_literal_global_698);
  }
  int v34 = [(id)_executableNameIsBlockedForMaterialization_blockedProcesses containsObject:v33];

  if (v34)
  {
    long long v35 = fp_current_or_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl(&dword_1D744C000, v35, OS_LOG_TYPE_INFO, "[INFO] ⛔️ item not provided, consumer %@ blocked by the system", buf, 0xCu);
    }

    uint64_t v36 = 1;
  }
  else
  {
LABEL_26:
    uint64_t v36 = 0;
  }
  if ([(FPDDomain *)self _isProviderBlockingConsumer:v48])
  {
    id v37 = fp_current_or_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v48;
      _os_log_impl(&dword_1D744C000, v37, OS_LOG_TYPE_INFO, "[INFO] ⛔️ item not provided, consumer %@ blocked by the provider", buf, 0xCu);
    }

    uint64_t v36 = 1;
  }
  if (!v19)
  {
    int v38 = fpfs_supports_partial_materialization() & v44;
    long long v39 = *(_OWORD *)&a6->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a6->var0;
    *(_OWORD *)&uint8_t buf[16] = v39;
    if (v38 == 1) {
      +[FPDRequest requestForPID:v12 auditToken:buf fromPOSIX:(v42 >> 30) & 1 kernelFileInfo:v47];
    }
    else {
    long long v19 = +[FPDRequest requestForPID:v12 auditToken:buf fromPOSIX:(v42 >> 30) & 1];
    }
  }
  [v19 setShouldFailCoordinationIfDownloadRequired:v36];
  id v49 = v15;
  id v50 = v16;
  id v51 = v19;
  id v52 = v48;
  id v53 = v43;
  fp_dispatch_async_with_logs();

  __fp_leave_section_Notice();
  _Block_object_dispose(&v54, 8);
  __fp_pop_log();
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke(uint64_t a1)
{
  fpfs_adopt_log();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];

    if (v4)
    {
      uint64_t v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_2();
      }

      goto LABEL_14;
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  int v6 = *(_DWORD *)(a1 + 88);
  if ((v6 & 0x10) != 0)
  {
    int v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_1();
    }

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= 0x20000uLL;
    int v6 = *(_DWORD *)(a1 + 88);
  }
  if ((v6 & 0xA) != 0) {
    [*(id *)(a1 + 56) setAllowsResurrection:1];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v10 = *(void **)(v8 + 112);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_170;
  v18[3] = &unk_1E6A75008;
  v18[4] = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 64);
  int v23 = *(_DWORD *)(a1 + 88);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v14 = (id)v17;
  long long v22 = v17;
  id v15 = [v10 startProvidingItemAtURL:v19 readerID:v12 readingOptions:v11 request:v13 completionHandler:v18];
  id v16 = [[FPCoordinationContext alloc] initWithProgress:v15 completionHandler:*(void *)(a1 + 72)];
  [v3 setObject:v16 forKeyedSubscript:*(void *)(a1 + 48)];

LABEL_14:
  __fp_pop_log();
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_170(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 168);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2;
  block[3] = &unk_1E6A74FE0;
  block[4] = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = *(id *)(a1 + 56);
  int v15 = *(_DWORD *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v8;
  long long v14 = v8;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _removeProgressForProvidingItemAtURL:*(void *)(a1 + 40) toReaderWithID:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = fp_current_or_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      id v7 = objc_msgSend(*(id *)(a1 + 56), "fp_prettyDescription");
      uint64_t v8 = *(void *)(a1 + 64);
      id v9 = *(void **)(a1 + 48);
      id v10 = objc_msgSend(NSString, "fp_coordinatorReadingOptions:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
      int v11 = *(_DWORD *)(a1 + 88);
      int v18 = 138413570;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      id v27 = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ❌ NSFileCoordinator: failed providing item at %@: %@ (consumer: %@, readerID: %{public}@, options: %{public}@, kernelOperation: 0x%x)", (uint8_t *)&v18, 0x3Au);
    }
  }
  else if (v5)
  {
    id v12 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    id v13 = *(void **)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 48);
    int v15 = objc_msgSend(NSString, "fp_coordinatorReadingOptions:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
    int v18 = 138413058;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: providing item at %@ (consumer: %@, readerID: %{public}@, options: %{public}@)", (uint8_t *)&v18, 0x2Au);
  }
  id v16 = [*(id *)(a1 + 32) getProvidedItemRecursiveGenerationCountForItemAtURL:*(void *)(a1 + 40)];
  if (v16) {
    [*(id *)(a1 + 32) setProvidedItemRecursiveGenerationCount:0 forItemAtURL:*(void *)(a1 + 40)];
  }
  if (v2)
  {
    long long v17 = [MEMORY[0x1E4F28CE0] responseWithError:*(void *)(a1 + 56)];
    -[NSObject setProvidedItemRecursiveGenerationCount:](v17, "setProvidedItemRecursiveGenerationCount:", [v16 unsignedLongLongValue]);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    long long v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2_cold_1();
    }
  }
}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v15 = fpfs_adopt_log();
  if (v7 && [MEMORY[0x1E4F28CA0] _processIdentifierForID:v7])
  {
    FPExecutableNameForProcessIdentifier();
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = @"(unknown)";
  }
  uint64_t section = __fp_create_section();
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(FPDDomain *)self fp_prettyDescription];
    int v11 = objc_msgSend(v6, "fp_shortDescription");
    *(_DWORD *)buf = 134219010;
    uint64_t v17 = section;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx ❌ NSFileCoordinator cancelled request for %@ to provide item at %@ (consumer: %@, readerID: %@)", buf, 0x34u);
  }
  id v12 = v6;
  id v13 = v7;
  fp_dispatch_async_with_logs();

  __fp_leave_section_Debug();
  __fp_pop_log();
}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 48;
  uint64_t v2 = [*(id *)(a1 + 32) _removeProgressForProvidingItemAtURL:*(void *)(a1 + 40) toReaderWithID:*(void *)(a1 + 48)];
  uint64_t v3 = fp_current_or_default_log();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_2(v2, v4);
    }

    uint64_t v4 = [v2 progress];
    [v4 cancel];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_1(v1, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28CA0] _processIdentifierForID:v6];
    if (v8)
    {
      FPExecutableNameForProcessIdentifier();
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = @"(unknown)";
LABEL_6:
  uint64_t section = __fp_create_section();
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = objc_msgSend(v7, "fp_shortDescription");
    *(_DWORD *)buf = 134218754;
    uint64_t v24 = section;
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v9;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx NSFileCoordinator is telling us the item at %@ was changed (consumer: %@, writerID: %@)", buf, 0x2Au);
  }
  int v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    [(FPDDomain *)self fp_prettyDescription];
    objc_claimAutoreleasedReturnValue();
    -[FPDDomain _writerWithID:didFinishWritingForURL:]();
  }

  defaultBackend = self->_defaultBackend;
  id v13 = +[FPDRequest requestForPID:v8];
  [(FPDDomainBackend *)defaultBackend itemChangedAtURL:v7 request:v13];

  uint64_t v14 = self->_defaultBackend;
  int v15 = +[FPDRequest requestForPID:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke;
  v18[3] = &unk_1E6A75078;
  id v16 = v7;
  id v19 = v16;
  __int16 v20 = self;
  int v21 = v8;
  [(FPDDomainBackend *)v14 itemForURL:v16 request:v15 completionHandler:v18];

  __fp_leave_section_Debug();
}

void __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = [v5 lastUsedDate];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [v5 lastUsedDate];
      int v11 = [v5 contentModificationDate];
      uint64_t v12 = [v10 compare:v11];

      if (v12 == -1)
      {
        id v13 = [v5 contentModificationDate];
        [v5 setLastUsedDate:v13];

        uint64_t v14 = *(void **)(a1 + 40);
        int v15 = +[FPDRequest requestForPID:*(unsigned int *)(a1 + 48)];
        [v14 daemonSideItemChange:v5 changedFields:8 request:v15 completionHandler:&__block_literal_global_175];
      }
    }
  }
}

- (BOOL)_wantsPresenterNotifications
{
  return 1;
}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t section = __fp_create_section();
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v19 = objc_msgSend(v6, "fp_shortDescription");
    __int16 v20 = [v7 presenterID];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = section;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v20;
    _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@ gaining presenter %@", buf, 0x20u);
  }
  if ([(FPDDomain *)self _wantsPresenterNotifications])
  {
    memset(buf, 0, 32);
    if (v7) {
      [v7 presenterAuditToken];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v10 = [WeakRetained server];
    int v11 = [v10 presenterManager];

    uint64_t v12 = [v7 presenterID];
    uint64_t v13 = [v11 promisePresenterWithID:v12];

    defaultBackend = self->_defaultBackend;
    int v15 = +[FPDRequest requestForSelf];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke;
    v21[3] = &unk_1E6A750A0;
    id v22 = v6;
    id v16 = v11;
    id v23 = v16;
    id v17 = v7;
    long long v26 = *(_OWORD *)buf;
    long long v27 = *(_OWORD *)&buf[16];
    id v24 = v17;
    uint64_t v25 = v13;
    [(FPDDomainBackend *)defaultBackend itemIDForURL:v22 requireProviderItemID:0 request:v15 completionHandler:v21];
  }
  else
  {
    __int16 v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:]();
    }
  }
  __fp_leave_section_Debug();
}

void __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 48) presenterID];
  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v12;
    [v8 addPresenter:v9 itemID:v5 urlHint:v10 auditToken:v13 promiseID:v11];
  }
  else
  {
    [v8 forgetPromiseForPresenterWithID:v9 promiseID:*(void *)(a1 + 56)];
  }
}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = fpfs_adopt_log();
  uint64_t section = __fp_create_section();
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = objc_msgSend(v6, "fp_shortDescription");
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = section;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@ losing presenter %@", buf, 0x20u);
  }
  if ([(FPDDomain *)self _wantsPresenterNotifications])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v10 = [WeakRetained server];
    uint64_t v11 = [v10 presenterManager];

    [v11 removePresenter:v7];
  }
  else
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:]();
    }
  }

  __fp_leave_section_Debug();
  __fp_pop_log();
}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  fpfs_adopt_log();
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t section = __fp_create_section();
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v22 = objc_msgSend(v8, "fp_shortDescription");
    id v23 = objc_msgSend(v10, "fp_shortDescription");
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = section;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v9;
    __int16 v36 = 2112;
    id v37 = v23;
    _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@, presenter %@, moving to %@", buf, 0x2Au);
  }
  if ([(FPDDomain *)self _wantsPresenterNotifications])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v13 = [WeakRetained server];
    uint64_t v14 = [v13 presenterManager];

    int v15 = [v14 presenterWithID:v9];
    uint64_t v16 = v15;
    if (v15)
    {
      memset(buf, 0, sizeof(buf));
      [v15 auditToken];
      [v14 removePresenter:v9];
      uint64_t v17 = [v14 promisePresenterWithID:v9];
      defaultBackend = self->_defaultBackend;
      __int16 v19 = +[FPDRequest requestForSelf];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke;
      v26[3] = &unk_1E6A750A0;
      id v27 = v10;
      __int16 v28 = v14;
      id v20 = v9;
      long long v31 = *(_OWORD *)buf;
      long long v32 = *(_OWORD *)&buf[16];
      id v29 = v20;
      uint64_t v30 = v17;
      [(FPDDomainBackend *)defaultBackend itemIDForURL:v27 requireProviderItemID:0 request:v19 completionHandler:v26];
    }
    else
    {
      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v24 = objc_msgSend(v8, "fp_shortDescription");
        uint64_t v25 = objc_msgSend(v10, "fp_shortDescription");
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v25;
        _os_log_error_impl(&dword_1D744C000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Move of a presenter %@ from %@ to %@ notified but no previous presenter existed", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:]();
    }
  }

  __fp_leave_section_Debug();
  __fp_pop_log();
}

void __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke_cold_1();
    }
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v12;
    [v8 addPresenter:v9 itemID:v5 urlHint:v10 auditToken:v13 promiseID:v11];
  }
  else
  {
    [v8 forgetPromiseForPresenterWithID:v9 promiseID:*(void *)(a1 + 56)];
  }
}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t section = __fp_create_section();
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = objc_msgSend(v8, "fp_shortDescription");
    uint64_t v16 = [v9 destinationDirectoryURL];
    uint64_t v17 = objc_msgSend(v16, "fp_shortDescription");
    *(_DWORD *)buf = 134218498;
    uint64_t v23 = section;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Checking if download is required for moving %@ to %@", buf, 0x20u);
  }
  long long v12 = [(FPDDomain *)self defaultBackend];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke;
  v18[3] = &unk_1E6A750C8;
  id v13 = v8;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  [v12 movingItemAtURL:v13 withInfo:v9 completionHandler:v18];

  __fp_leave_section_Debug();
}

void __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke_cold_1(v3, a1, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_registerFileCoordinatorAndSpaceForceWithCompletion:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  dispatch_block_t block = a3;
  fpfs_adopt_log();
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  if ([MEMORY[0x1E4F25CE0] runningInSyncBubble])
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_INFO, "[INFO] shared iPad: skipping file coordination registration because we're just finishing sync", buf, 2u);
    }

    dispatch_async((dispatch_queue_t)self->_serialQueue, block);
  }
  else
  {
    id v29 = objc_opt_new();
    id v5 = dispatch_group_create();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v30 = [WeakRetained identifier];

    id v7 = objc_loadWeakRetained((id *)&self->_provider);
    if (!v7)
    {
      uint64_t v21 = [NSString stringWithFormat:@"[ASSERT] ‼️ no provider"];
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1618, (const char *)[v21 UTF8String]);
    }
    if (!v30)
    {
      uint64_t v23 = [NSString stringWithFormat:@"[ASSERT] ‼️ no provider identifier"];
      __int16 v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1619, (const char *)[v23 UTF8String]);
    }
    id obj = (id)fileCoordinationProviderByURL;
    objc_sync_enter(obj);
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [(FPDDomain *)self coordinationRootURLs];
    long long v31 = [v8 setWithArray:v9];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = [(id)fileCoordinationProviderByURL allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v48;
      id v27 = v35;
      uint64_t v28 = v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          int v15 = objc_msgSend((id)fileCoordinationProviderByURL, "objectForKeyedSubscript:", v14, obj, block, v27, v28);
          uint64_t v16 = [v15 delegate];
          BOOL v17 = v16 == self;

          if (v17)
          {
            dispatch_group_enter(v5);
            if ([v31 containsObject:v14])
            {
              providedItemsOperationQueue = self->_providedItemsOperationQueue;
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v41[0] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke;
              v41[1] = &unk_1E6A73648;
              v41[2] = self;
              id v42 = v29;
              uint64_t v43 = v14;
              id v44 = v15;
              uint64_t v45 = v5;
              id v46 = v30;
              [(NSOperationQueue *)providedItemsOperationQueue addOperationWithBlock:v40];
            }
            else
            {
              [(id)fileCoordinationProviderByURL removeObjectForKey:v14];
              id v19 = self->_providedItemsOperationQueue;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v35[0] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_192;
              v35[1] = &unk_1E6A750F0;
              id v36 = v15;
              id v37 = v5;
              uint64_t v38 = self;
              uint64_t v39 = v14;
              [(NSOperationQueue *)v19 addOperationWithBlock:v34];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v11);
    }

    objc_sync_exit(obj);
    [(FPDDomain *)self _registerInSpaceForce];
    serialQueue = self->_serialQueue;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_193;
    v32[3] = &unk_1E6A75118;
    id v33 = block;
    dispatch_group_notify(v5, serialQueue, v32);
  }
  __fp_pop_log();
}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) provider];
  id v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

  id v5 = [*(id *)(a1 + 32) provider];
  id v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

  if ((v4 & 1) == 0 && (v7 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
    id v9 = [WeakRetained descriptor];
    if ([v9 hasExplicitExtensionStorageURLs]) {
      goto LABEL_11;
    }
    char v10 = [*(id *)(a1 + 32) isUsingFPFS];

    if (v10) {
      goto LABEL_13;
    }
  }
  unsigned __int8 v31 = 0;
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [*(id *)(a1 + 48) path];
  LODWORD(v11) = [v11 fileExistsAtPath:v12 isDirectory:&v31];
  int v13 = v31;

  if (!v11 || !v13)
  {
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v30 = 0;
    char v16 = [v14 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v30];
    id WeakRetained = v30;
    if (v16) {
      goto LABEL_12;
    }
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
      uint64_t v23 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
      __int16 v24 = objc_msgSend(WeakRetained, "fp_prettyDescription");
      *(_DWORD *)buf = 138412802;
      id v33 = v22;
      __int16 v34 = 2112;
      long long v35 = v23;
      __int16 v36 = 2112;
      id v37 = v24;
      _os_log_error_impl(&dword_1D744C000, v9, OS_LOG_TYPE_ERROR, "[ERROR] ❌ Error preparing documentStorage directory %@ for provider %@: %@", buf, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  id WeakRetained = 0;
LABEL_12:

LABEL_13:
  if ([*(id *)(a1 + 56) isRegistered])
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
  else
  {
    [*(id *)(a1 + 56) setRegistered:1];
    BOOL v17 = (void *)MEMORY[0x1E4F28CA0];
    uint64_t v18 = *(void *)(a1 + 56);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_191;
    v25[3] = &unk_1E6A73AC8;
    void v25[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 72);
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void **)(a1 + 56);
    id v26 = v19;
    uint64_t v27 = v20;
    id v28 = v21;
    id v29 = *(id *)(a1 + 64);
    [v17 _addFileProvider:v18 completionHandler:v25];
  }
}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_191(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) log];
  id v8 = fpfs_adopt_log();

  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    char v4 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    char v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] 🅿️ Registered file provider extension %@ (%@) for path %@: %@", buf, 0x2Au);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  __fp_pop_log();
}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_192(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isRegistered])
  {
    [*(id *)(a1 + 32) setRegistered:0];
    [MEMORY[0x1E4F28CA0] _removeFileProvider:*(void *)(a1 + 32)];
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = objc_msgSend(*(id *)(a1 + 48), "fp_prettyDescription");
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 208));
      uint64_t v5 = [WeakRetained identifier];
      id v6 = objc_msgSend(*(id *)(a1 + 56), "fp_shortDescription");
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138413058;
      char v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered file provider extension %@ (%@) for path %@: %@", (uint8_t *)&v9, 0x2Au);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    id v8 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v8);
  }
}

uint64_t __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerInSpaceForce
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(FPDDomain *)self isUsingFPFS] && FPFeatureFlagSpaceAttributionIsEnabled())
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = [(FPDDomain *)self checkableURLs];
      uint64_t v5 = [(FPDDomain *)self provider];
      id v6 = [v5 identifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: Space Attribution registration for paths %@ and bundle %@", buf, 0x20u);
    }
    uint64_t v7 = [(FPDDomain *)self checkableURLs];
    id v8 = objc_msgSend(v7, "fp_map:", &__block_literal_global_196);

    saPathManager = self->_saPathManager;
    char v10 = [(FPDDomain *)self provider];
    __int16 v11 = [v10 identifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__FPDDomain__registerInSpaceForce__block_invoke_2;
    v12[3] = &unk_1E6A73580;
    v12[4] = self;
    [(SAPathManager *)saPathManager registerPaths:v8 forBundleID:v11 completionHandler:v12];
  }
}

uint64_t __34__FPDDomain__registerInSpaceForce__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FA56E0] pathInfoWithURL:a2];
}

void __34__FPDDomain__registerInSpaceForce__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __34__FPDDomain__registerInSpaceForce__block_invoke_2_cold_1(a1, v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) checkableURLs];
    uint64_t v7 = [*(id *)(a1 + 32) provider];
    id v8 = [v7 identifier];
    int v9 = 138412546;
    char v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] Paths %@ were registered in Space Attribution with bundle %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_unregisterFromFileCoordinatorAndSpaceForce
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id obj = (id)fileCoordinationProviderByURL;
  objc_sync_enter(obj);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(FPDDomain *)self coordinationRootURLs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = objc_msgSend((id)fileCoordinationProviderByURL, "objectForKeyedSubscript:", v7, obj);
        int v9 = [v8 delegate];
        BOOL v10 = v9 == self;

        if (v10)
        {
          [(id)fileCoordinationProviderByURL removeObjectForKey:v7];
          providedItemsOperationQueue = self->_providedItemsOperationQueue;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          _OWORD v13[2] = __56__FPDDomain__unregisterFromFileCoordinatorAndSpaceForce__block_invoke;
          v13[3] = &unk_1E6A73418;
          id v14 = v8;
          __int16 v15 = self;
          uint64_t v16 = v7;
          [(NSOperationQueue *)providedItemsOperationQueue addOperationWithBlock:v13];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);
  [(NSOperationQueue *)self->_providedItemsOperationQueue waitUntilAllOperationsAreFinished];
  __fp_pop_log();
}

void __56__FPDDomain__unregisterFromFileCoordinatorAndSpaceForce__block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a1[4] isRegistered])
  {
    [a1[4] setRegistered:0];
    [MEMORY[0x1E4F28CA0] _removeFileProvider:a1[4]];
    [a1[5] _unregisterURLFromSpaceForce:a1[6]];
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = objc_msgSend(a1[5], "fp_prettyDescription");
      id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 26);
      uint64_t v5 = [WeakRetained identifier];
      id v6 = objc_msgSend(a1[6], "fp_shortDescription");
      id v7 = a1[4];
      int v8 = 138413058;
      int v9 = v3;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered file provider extension %@ (%@) for path %@: %@", (uint8_t *)&v8, 0x2Au);
    }
  }
}

- (void)_unregisterURLFromSpaceForce:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDDomain *)self isUsingFPFS] && FPFeatureFlagSpaceAttributionIsEnabled())
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(FPDDomain *)self provider];
      id v7 = [v6 identifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      long long v20 = v7;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: Space Attribution unregistration for path %@ and bundle %@", buf, 0x20u);
    }
    saPathManager = self->_saPathManager;
    id v14 = v4;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    __int16 v10 = [(FPDDomain *)self provider];
    __int16 v11 = [v10 identifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke;
    v12[3] = &unk_1E6A73C80;
    v12[4] = self;
    id v13 = v4;
    [(SAPathManager *)saPathManager unregisterURLs:v9 forBundleID:v11 completionHandler:v12];
  }
}

void __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) provider];
    int v8 = [v7 identifier];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] Path %@ was unregistered from Space Attribution with bundle %@", (uint8_t *)&v9, 0x16u);
  }
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDDomainBackend *)self->_defaultBackend isProviderForRealPathURL:v4])
  {
LABEL_2:
    char v5 = 1;
  }
  else
  {
    extensionBackend = self->_extensionBackend;
    if (self->_defaultBackend == extensionBackend)
    {
      if (![(FPDDomain *)self isConnectedToAppExtension])
      {
        id v7 = [(FPDDomain *)self provider];
        int v8 = [v7 extensionStorageURLs];

        int v9 = [(NSFileProviderDomain *)self->_nsDomain pathRelativeToDocumentStorage];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(id *)(*((void *)&v20 + 1) + 8 * i);
              uint64_t v16 = v15;
              __int16 v17 = v15;
              if (v9)
              {
                __int16 v17 = objc_msgSend(v15, "URLByAppendingPathComponent:", v9, (void)v20);
              }
              uint64_t v18 = objc_msgSend(v16, "fp_realPathRelationshipToItemAtRealPathURL:", v4, (void)v20);

              if (v18 != 2)
              {

                goto LABEL_2;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      char v5 = 0;
    }
    else
    {
      char v5 = [(FPDDomainBackend *)extensionBackend isProviderForRealPathURL:v4];
    }
  }

  return v5;
}

- (void)daemonSideItemChange:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = [(FPDDomain *)self defaultBackend];
  v22[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__FPDDomain_daemonSideItemChange_changedFields_request_completionHandler___block_invoke;
  v17[3] = &unk_1E6A75160;
  id v18 = v10;
  __int16 v19 = self;
  id v20 = v11;
  unint64_t v21 = a4;
  id v15 = v11;
  id v16 = v10;
  [v13 bulkItemChanges:v14 changedFields:a4 request:v12 completionHandler:v17];
}

void __74__FPDDomain_daemonSideItemChange_changedFields_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 itemIdentifier];
  int v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = [*(id *)(a1 + 32) itemIdentifier];
  id v11 = [v6 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [*(id *)(a1 + 40) identifier];
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138413058;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      long long v23 = v11;
      _os_log_error_impl(&dword_1D744C000, v12, OS_LOG_TYPE_ERROR, "[ERROR] can't notify extension %@ of item change %lu for item %@; %@",
        (uint8_t *)&v16,
        0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_207(id *a1)
{
  id v2 = a1[5];
  id v3 = a1[6];
  id v4 = a1[7];
  fp_dispatch_async_with_logs();
}

uint64_t __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callExtensionForItemDidChange:*(void *)(a1 + 40) request:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)callExtensionForItemDidChange:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  id v11 = a4;
  dispatch_assert_queue_V2(serialQueue);
  id v12 = [(FPDDomain *)self session];
  uint64_t v13 = [v11 pid];

  uint64_t v14 = [v12 existingFileProviderProxyWithTimeout:1 onlyAlreadyLifetimeExtended:v13 pid:180.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke;
  v17[3] = &unk_1E6A75188;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v14 didChangeItemID:v16 completionHandler:v17];
}

void __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
LABEL_9:
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  int v5 = objc_msgSend(v3, "fp_isCocoaErrorCode:", 3072);
  id v6 = fp_current_or_default_log();
  id v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke_cold_1(a1, v4, v7);
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) identifier];
    uint64_t v9 = *(void *)(a1 + 40);
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] Extension %@ signalled for item at %@ without active enumerators, not launching it", (uint8_t *)&v11, 0x16u);
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
  v10();
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (id)materializedURLForItemID:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v5 = [(FPDDomainBackend *)self->_defaultBackend materializedURLForItemID:v4];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)forceIngestionAtURL:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(FPDDomainBackend *)self->_defaultBackend forceIngestionAtURL:v4];
  }
}

- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(FPDDomainBackend *)self->_defaultBackend forceFSIngestionForItemID:v7 completionHandler:v6];
  }
  else {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (objc_opt_respondsToSelector())
  {
    [(FPDDomainBackend *)self->_defaultBackend forceIngestionForItemID:v8 completionHandler:v6];
  }
  else
  {
    id v7 = FPNotSupportedError();
    v6[2](v6, 0, v7);
  }
}

- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if (objc_opt_respondsToSelector())
  {
    [(FPDDomainBackend *)self->_defaultBackend downloadItemWithItemID:v14 request:v10 progress:v11 completionHandler:v12];
  }
  else
  {
    __int16 v13 = FPNotSupportedError();
    v12[2](v12, 0, v13);
  }
}

- (void)downloadVersionThumbnail:(id)a3 version:(id)a4 completionHandler:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  defaultBackend = self->_defaultBackend;
  id v12 = [v8 fileURL];
  __int16 v13 = [v9 version];
  v22[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke;
  v18[3] = &unk_1E6A751B0;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  -[FPDDomainBackend fetchThumbnailsAtURL:versions:size:perThumbnailCompletionHandler:completionHandler:](defaultBackend, "fetchThumbnailsAtURL:versions:size:perThumbnailCompletionHandler:completionHandler:", v12, v14, v18, &__block_literal_global_221, 1024.0, 1024.0);
}

void __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9 = a4;
  id v10 = a7;
  if (v10)
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke_cold_1(a1, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v13 = [v9 url];
    [v12 removeItemAtURL:v13 error:0];
  }
}

- (void)downloadVersionWithItemID:(id)a3 etag:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_opt_respondsToSelector())
  {
    defaultBackend = self->_defaultBackend;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke;
    v16[3] = &unk_1E6A75228;
    id v19 = v13;
    void v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    [(FPDDomainBackend *)defaultBackend itemForItemID:v18 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:1 request:v12 completionHandler:v16];
  }
  else
  {
    id v15 = FPNotSupportedError();
    (*((void (**)(id, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, v15);
  }
}

void __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_2;
    v26[3] = &unk_1E6A751D8;
    id v28 = a1[7];
    id v6 = v5;
    id v27 = v6;
    id v7 = (void *)MEMORY[0x1D9471EC0](v26);
    id v8 = [a1[4] versionsCache];
    id v9 = [v8 objectForKey:a1[5]];

    if (v9
      && ([v9 fpItemIdentifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToItemID:a1[6]],
          v10,
          v11))
    {
      id v12 = a1[4];
      id v13 = [v6 providerItemID];
      id v14 = [v9 version];
      id v15 = [v6 fileURL];
      [v12 downloadVersionWithItemID:v13 version:v14 originalURL:v15 completionHandler:v7];
    }
    else
    {
      id v16 = (void *)*((void *)a1[4] + 14);
      id v13 = [v6 fileURL];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_3;
      v19[3] = &unk_1E6A75200;
      id v17 = a1[5];
      id v18 = a1[4];
      id v20 = v17;
      id v21 = v18;
      id v22 = v6;
      id v24 = v7;
      id v25 = a1[7];
      id v23 = a1[6];
      [v16 listRemoteVersionsOfItemAtURL:v13 includeCachedVersions:1 completionHandler:v19];

      id v14 = v20;
    }
  }
}

uint64_t __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3, a4);
}

void __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "etag", (void)v18);
        int v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

        if (v11)
        {
          id v15 = *(void **)(a1 + 40);
          id v14 = [*(id *)(a1 + 48) providerItemID];
          id v16 = [v9 version];
          id v17 = [*(id *)(a1 + 48) fileURL];
          [v15 downloadVersionWithItemID:v14 version:v16 originalURL:v17 completionHandler:*(void *)(a1 + 64)];

          id v13 = v4;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = *(void *)(a1 + 72);
  id v13 = [*(id *)(a1 + 56) identifier];
  id v14 = FPItemNotFoundError();
  (*(void (**)(uint64_t, void, void, void, void *))(v12 + 16))(v12, 0, 0, 0, v14);
LABEL_11:
}

- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_respondsToSelector())
  {
    [(FPDDomainBackend *)self->_defaultBackend downloadVersionWithItemID:v14 version:v10 originalURL:v11 completionHandler:v12];
  }
  else
  {
    id v13 = FPNotSupportedError();
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v13);
  }
}

- (int64_t)nonEvictableSpace
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  defaultBackend = self->_defaultBackend;
  return [(FPDDomainBackend *)defaultBackend nonEvictableSpace];
}

- (int64_t)accumulatedSizeOfPinnedItems
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  defaultBackend = self->_defaultBackend;
  return [(FPDDomainBackend *)defaultBackend accumulatedSizeOfPinnedItems];
}

- (id)accumulatedSizeOfItems
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(FPDDomainBackend *)self->_defaultBackend accumulatedSizeOfItems];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)providerVersion
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(FPDDomainBackend *)self->_defaultBackend providerVersion];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setSupportsSyncingTrash:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FPDDomain *)self nsDomain];
  [v4 setSupportsSyncingTrash:v3];
}

- (void)setSupportsSearch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FPDDomain *)self nsDomain];
  [v4 setSupportsSearch:v3];
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FPDDomain *)self nsDomain];
  [v4 setSupportsRemoteVersions:v3];
}

- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v115 = a6;
  id v12 = [(FPDDomain *)self identifier];
  char v13 = [v12 isEqualToString:*MEMORY[0x1E4F25C00]];

  [v10 write:@"-----------------------------------------------------\n"];
  if (v13)
  {
    id v14 = @"(default)";
  }
  else
  {
    uint64_t v6 = [(FPDDomain *)self identifier];
    objc_msgSend(v6, "fp_obfuscatedFilename");
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v15 = [(FPDDomain *)self nsDomain];
  int v16 = [v15 isHidden];
  id v17 = &stru_1F2EC3618;
  long long v18 = @" (hidden)";
  if (!v16) {
    long long v18 = &stru_1F2EC3618;
  }
  [v10 write:@"domain: %@%@", v14, v18];

  if ((v13 & 1) == 0)
  {
  }
  long long v19 = [(FPDDomain *)self nsDomain];
  long long v20 = [v19 displayName];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    id v22 = [(FPDDomain *)self nsDomain];
    uint64_t v23 = [v22 displayName];
    id v24 = objc_msgSend(v23, "fp_obfuscatedFilename");
    [v10 write:@" (%@)", v24];
  }
  id v25 = [(FPDDomain *)self nsDomain];
  int v26 = [v25 containsPhotos];

  if (v26) {
    [v10 write:@" (photos)"];
  }
  id v27 = [(FPDDomain *)self nsDomain];
  int v28 = [v27 readOnly];

  if (v28) {
    [v10 write:@" (readOnly)"];
  }
  id v29 = [(FPDDomain *)self nsDomain];
  int v30 = [v29 isErasable];

  if (v30) {
    [v10 write:@" (erasable)"];
  }
  unsigned __int8 v31 = [(FPDDomain *)self nsDomain];
  int v32 = [v31 isContentManaged];

  if (v32)
  {
    [v10 startFgColor:1];
    [v10 startAttributes:2];
    [v10 write:@" (managed)"];
    [v10 reset];
  }
  [v10 write:@"\n"];
  [v10 write:@"-----------------------------------------------------\n"];
  id v33 = [(FPDDomain *)self session];
  [v33 dumpStateTo:v10];

  if (![(FPDDomain *)self userEnabled])
  {
    [v10 startFgColor:3];
    [v10 write:@"  + (⏹  user-disabled)\n"];
    [v10 reset];
  }
  if (self->_unableToStartup)
  {
    [v10 startFgColor:1];
    __int16 v34 = [(FPDDomain *)self startupError];
    int v35 = objc_msgSend(v34, "fp_isFileProviderInternalError:", 22);

    if (v35)
    {
      [v10 write:@"  + (⏹  unable to startup - needs reimport)\n"];
    }
    else
    {
      __int16 v36 = [(NSError *)self->_startupError fp_prettyDescription];
      [v10 write:@"  + (⏹  unable to startup)\n    %@\n", v36];
    }
    [v10 reset];
  }
  if ([(FPDDomain *)self disconnectionState] != 1)
  {
    [v10 startFgColor:3];
    [(FPDDomain *)self disconnectionState];
    id v37 = FPConnectionStateToPrettyString();
    [v10 write:@"  + %@\n", v37];
    [v10 reset];
  }
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  char v40 = [WeakRetained isAppExtensionReachable];

  if ((v40 & 1) == 0)
  {
    [v10 startFgColor:3];
    [v10 write:@"  + (❔ app-ext not reachable)\n"];
    [v10 reset];
  }
  if ([(FPDDomain *)self ejectable])
  {
    [v10 startFgColor:9];
    [v10 write:@"  + (ejectable)\n"];
    [v10 reset];
  }
  id v41 = [(FPDDomain *)self nsDomain];
  int v42 = [v41 isReplicated];

  uint64_t v43 = @"repl,";
  if (!v42) {
    uint64_t v43 = &stru_1F2EC3618;
  }
  id v44 = v43;
  uint64_t v45 = &stru_1F2EC3618;
  id v46 = &stru_1F2EC3618;
  if (v42)
  {
    long long v47 = [(FPDDomain *)self nsDomain];
    int v48 = [v47 supportsSyncingTrash];
    long long v49 = @"syncTrash,";
    if (!v48) {
      long long v49 = &stru_1F2EC3618;
    }
    long long v50 = v49;

    id v51 = [(FPDDomain *)self nsDomain];
    int v52 = [v51 supportsSearch];
    id v53 = @"search,";
    if (!v52) {
      id v53 = &stru_1F2EC3618;
    }
    uint64_t v45 = v53;

    uint64_t v54 = [(FPDDomain *)self nsDomain];
    int v55 = [v54 supportsRemoteVersions];
    uint64_t v56 = @"remoteVersions,";
    if (!v55) {
      uint64_t v56 = &stru_1F2EC3618;
    }
    id v46 = v56;

    id v17 = v50;
  }
  v111 = v46;
  v112 = v45;
  [v10 write:@"  + features: %@%@%@%@\n", v44, v17, v45, v46];
  unint64_t v57 = [(FPDDomain *)self rootURLs];
  uint64_t v58 = [v57 count];

  v117 = self;
  v113 = v44;
  v114 = v17;
  if (v58)
  {
    Class v59 = [(FPDDomain *)self rootURLs];
    uint64_t v60 = [v59 count];

    if (v60 == 1)
    {
      id v61 = [(FPDDomain *)self rootURLs];
      __int16 v62 = [v61 firstObject];
      id v63 = objc_msgSend(v62, "fp_shortDescription");
      [v10 write:@"  + root: %@\n", v63];
    }
    else
    {
      id v64 = v11;
      [v10 write:@"  + roots:\n"];
      long long v128 = 0u;
      long long v129 = 0u;
      long long v127 = 0u;
      long long v126 = 0u;
      uint64_t v65 = [(FPDDomain *)self rootURLs];
      uint64_t v66 = [v65 countByEnumeratingWithState:&v126 objects:v131 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v127;
        do
        {
          for (uint64_t i = 0; i != v67; ++i)
          {
            if (*(void *)v127 != v68) {
              objc_enumerationMutation(v65);
            }
            v70 = objc_msgSend(*(id *)(*((void *)&v126 + 1) + 8 * i), "fp_shortDescription");
            [v10 write:@"    + %@\n", v70];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v126 objects:v131 count:16];
        }
        while (v67);
      }

      id v11 = v64;
      self = v117;
    }
  }
  else
  {
    [v10 startFgColor:1];
    [v10 write:@"  + no root\n"];
    [v10 reset];
  }
  [v10 write:@"  + FPDDomain instance: <%@:%p>\n", objc_opt_class(), self];
  [v10 write:@"      - default backend: <%@:%p>\n", objc_opt_class(), self->_defaultBackend];
  [v10 write:@"      - extension backend: <%@:%p>\n", objc_opt_class(), self->_extensionBackend];
  [v10 write:@"      - deactivated backend: <%@:%p>\n", objc_opt_class(), self->_deactivatedBackend];
  [v10 write:@"      - volume: %@\n", self->_volume];
  __int16 v71 = [(FPDDomain *)self nsDomain];
  id v72 = [v71 personaIdentifier];
  id v73 = objc_loadWeakRetained((id *)p_provider);
  v74 = [v73 descriptor];
  uint64_t v75 = [v74 personaIdentifier];
  v76 = v10;
  id v116 = v11;
  if (v72 == (void *)v75)
  {
  }
  else
  {
    v77 = (void *)v75;
    [(FPDDomain *)self nsDomain];
    v78 = v110 = v73;
    v79 = [v78 personaIdentifier];
    id v80 = objc_loadWeakRetained((id *)p_provider);
    [v80 descriptor];
    v82 = v81 = v71;
    v83 = [v82 personaIdentifier];
    char v109 = [v79 isEqual:v83];

    self = v117;
    id v10 = v76;

    id v11 = v116;
    if ((v109 & 1) == 0) {
      [v76 startFgColor:1];
    }
  }
  v84 = [(FPDDomain *)self nsDomain];
  uint64_t v85 = [v84 personaIdentifier];
  v86 = (void *)v85;
  v87 = @"none";
  if (v85) {
    v87 = (__CFString *)v85;
  }
  [v10 write:@"  + persona: %@\n", v87];

  [v10 reset];
  v88 = [(FPDDomain *)self nsDomain];
  v89 = [v88 userInfo];

  if (v89)
  {
    v90 = [(FPDDomain *)self nsDomain];
    v91 = [v90 userInfo];

    objc_msgSend(v10, "write:", @"  + userInfo: %d keys\n", objc_msgSend(v91, "count"));
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v92 = v91;
    uint64_t v93 = [v92 countByEnumeratingWithState:&v122 objects:v130 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v123;
      do
      {
        for (uint64_t j = 0; j != v94; ++j)
        {
          if (*(void *)v123 != v95) {
            objc_enumerationMutation(v92);
          }
          uint64_t v97 = *(void *)(*((void *)&v122 + 1) + 8 * j);
          if ((a4 & 2) != 0)
          {
            v98 = [v92 objectForKeyedSubscript:*(void *)(*((void *)&v122 + 1) + 8 * j)];
            v102 = (objc_class *)objc_opt_class();
            v99 = NSStringFromClass(v102);
            v101 = [v92 objectForKeyedSubscript:v97];
            uint64_t v107 = v97;
            id v10 = v76;
            [v76 write:@"      %@: %@ - %@\n", v107, v99, v101];
          }
          else
          {
            v98 = objc_msgSend(*(id *)(*((void *)&v122 + 1) + 8 * j), "fp_obfuscatedFilename");
            v99 = [v92 objectForKeyedSubscript:v97];
            v100 = (objc_class *)objc_opt_class();
            v101 = NSStringFromClass(v100);
            id v10 = v76;
            [v76 write:@"      %@: %@\n", v98, v101, v108];
          }
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v122 objects:v130 count:16];
      }
      while (v94);
    }

    id v11 = v116;
    self = v117;
  }
  [v10 write:@"  + indexer:\n"];
  v103 = [(FPDDomain *)self indexer];
  [v103 dumpStateTo:v10];

  v104 = [(FPDDomain *)self defaultBackend];
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __59__FPDDomain_dumpStateTo_options_request_completionHandler___block_invoke;
  v119[3] = &unk_1E6A75188;
  v119[4] = self;
  id v120 = v10;
  id v121 = v115;
  id v105 = v115;
  id v106 = v10;
  [v104 dumpStateTo:v106 options:a4 request:v11 completionHandler:v119];
}

void __59__FPDDomain_dumpStateTo_options_request_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __59__FPDDomain_dumpStateTo_options_request_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6A747B0;
  uint64_t v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __59__FPDDomain_dumpStateTo_options_request_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  id v3 = [WeakRetained server];
  id v4 = [v3 presenterManager];
  uint64_t v5 = [v4 presentersForDomain:*(void *)(a1 + 32)];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "dumpStateTo:", *(void *)(a1 + 40), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 40) write:@"\n"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)providerSupportURL
{
  id v3 = [(FPDDomain *)self provider];
  id v4 = [v3 identifier];
  id v18 = 0;
  char v5 = objc_msgSend(v4, "fp_isValidProviderIdentifierWithError:", &v18);
  id v6 = v18;

  if ((v5 & 1) == 0)
  {
    long long v13 = NSString;
    long long v14 = [(FPDDomain *)self provider];
    uint64_t v16 = v15 = [v14 identifier];

    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain providerSupportURL]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 2289, (const char *)[v16 UTF8String]);
  }
  uint64_t v7 = [(FPDDomain *)self volume];
  uint64_t v8 = [v7 systemDirectory];
  uint64_t v9 = [(FPDDomain *)self provider];
  uint64_t v10 = [v9 identifier];
  long long v11 = [v8 URLByAppendingPathComponent:v10 isDirectory:1];

  return v11;
}

- (NSURL)supportURL
{
  id v3 = [(FPDDomain *)self identifier];
  id v15 = 0;
  char v4 = objc_msgSend(v3, "fp_isValidDomainIdentifierWithError:", &v15);
  id v5 = v15;

  if ((v4 & 1) == 0)
  {
    uint64_t v10 = NSString;
    long long v11 = [(FPDDomain *)self provider];
    long long v13 = v12 = [v11 identifier];

    long long v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomain supportURL]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 2297, (const char *)[v13 UTF8String]);
  }
  id v6 = [(FPDDomain *)self providerSupportURL];
  uint64_t v7 = [(FPDDomain *)self identifier];
  uint64_t v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];

  return (NSURL *)v8;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (void)setUnableToStartup:(BOOL)a3
{
  self->_unableToStartup = a3;
}

- (NSError)startupError
{
  return self->_startupError;
}

- (void)setStartupError:(id)a3
{
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (FPDDomainBackend)deactivatedBackend
{
  return self->_deactivatedBackend;
}

- (void)setFilePresenters:(id)a3
{
}

- (void)setDomainUserInfo:(id)a3
{
}

- (void)setIndexer:(id)a3
{
}

- (BOOL)shouldIndexWhenStart
{
  return self->_shouldIndexWhenStart;
}

- (void)setShouldIndexWhenStart:(BOOL)a3
{
  self->_shouldIndexWhenStart = a3;
}

- (NSData)fpfsRootBookmarkData
{
  return self->_fpfsRootBookmarkData;
}

- (void)setFpfsRootBookmarkData:(id)a3
{
}

- (Class)fpfsTestingBackendClass
{
  return self->_fpfsTestingBackendClass;
}

- (void)setFpfsTestingBackendClass:(Class)a3
{
}

- (NSURL)stateURL
{
  return self->_stateURL;
}

- (NSCache)versionsCache
{
  return self->_versionsCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionsCache, 0);
  objc_storeStrong((id *)&self->_stateURL, 0);
  objc_storeStrong((id *)&self->_fpfsTestingBackendClass, 0);
  objc_storeStrong((id *)&self->_fpfsRootBookmarkData, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_filePresenters, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_deactivatedBackend, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionStorageURLs, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_startupError, 0);
  objc_storeStrong((id *)&self->_nsDomain, 0);
  objc_storeStrong((id *)&self->_nsDomainOrNilForDefault, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extensionBackend, 0);
  objc_storeStrong((id *)&self->_defaultBackend, 0);
  objc_storeStrong((id *)&self->_extCallOutQueue, 0);
  objc_storeStrong((id *)&self->_saPathManager, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_rootCreationPacer, 0);
  objc_storeStrong((id *)&self->_previouslyAccessedSecurityScopedURL, 0);
  objc_storeStrong((id *)&self->_shouldDisconnectDueToLowDiskSpace, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_providedItemsOperationQueue, 0);
  objc_storeStrong((id *)&self->_providedItemRecursiveGenCountPerURL, 0);
  objc_storeStrong((id *)&self->_coordinatorMetadataPerURL, 0);
}

- (void)_shouldDisconnectDueToLowDiskSpace
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1D744C000, v0, v1, "[CRIT] domain %@ doesn't have a volume, cannot determine disk space state", v2, v3, v4, v5, v6);
}

void __35__FPDDomain_refreshConnectionState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_4(&dword_1D744C000, v0, v1, "[ERROR] error in updateShouldRetryThrottledOperations: %@", v2, v3, v4, v5, v6);
}

- (void)shouldDisconnectWithStartupError
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] [external rejected] Initializing disconnected provider for %@", v2, v3, v4, v5, v6);
}

- (void)createRootURLWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: is a hidden default domain, ignoring", v2, v3, v4, v5, v6);
}

- (void)createRootURLWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: is the default domain, fetching the root first", v2, v3, v4, v5, v6);
}

- (void)createRootURLWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: is not the default domain, creating a root right away", v2, v3, v4, v5, v6);
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_13_0();
  uint64_t v6 = v2;
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, v3, (uint64_t)v3, "[DEBUG] %@: can't get FP root, we'll retry once working set is signalled: %@", (uint8_t *)&v4);
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a3, v6, "[ERROR] domain %@ initialization failed with %@, disabling it", (uint8_t *)&v7);
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_122_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] domain initialization won't be attempted: provider rejected it with %@", v4, 0xCu);
}

- (void)createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: need root creation", v2, v3, v4, v5, v6);
}

- (void)createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: root already created", v2, v3, v4, v5, v6);
}

void __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v6, v4, "[ERROR] %@: error while creating root for domain: %@", v5);
}

- (void)_startWithReason:userAllowedDBDrop:completion:.cold.3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v6, v4, "[ERROR] cannot create indexer for domain %@: %@", v5);
}

- (void)cleanupDomainWithMode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a4, a3, "[ERROR] failed removing domainSupportFolder at %@: %s", (uint8_t *)a2);
}

- (void)cleanupDomainWithMode:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] removed support directory at %@", v2, v3, v4, v5, v6);
}

- (void)cleanupDomainWithMode:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a3, (uint64_t)a3, "[DEBUG] no index to remove for %@", (uint8_t *)a2);
}

- (void)cleanupDomainWithMode:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a3, (uint64_t)a3, "[DEBUG] removing index for %@", (uint8_t *)a2);
}

void __35__FPDDomain_cleanupDomainWithMode___block_invoke_150_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7(a1) indexer];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v4, "[DEBUG] async dropped index for %@", v5);
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Request to materialize recursively from kernel, adding recursiveContentProviding key.", v2, v3, v4, v5, v6);
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] readyID already registered", v1, 2u);
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] ☠️ NSFileCoordinator: already replied to coordination request", v2, v3, v4, v5, v6);
}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 progress];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v4, "[DEBUG] 🗑  cancel progress %@", v5);
}

- (void)_writerWithID:didFinishWritingForURL:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_6_0(v1, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, v7, v5, "[DEBUG] The item at %@ is provided by the domain %@", v6);
}

void __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_7(v2), "fp_shortDescription");
  OUTLINED_FUNCTION_5_1();
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, v0, v4, "[DEBUG] can't retrieve item for URL %@; %@", v5);
}

- (void)_providedItemAtURL:didGainPresenterWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] ignoring call for LocalStorage", v2, v3, v4, v5, v6);
}

void __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_7(v2), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(v1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, v5, "[ERROR] Item ID not found while adding presenter for item at %@: %@", v6);
}

void __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_7(v2), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(v1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, v5, "[ERROR] Item ID not found while updating presenter for item at %@: %@", v6);
}

void __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 requiresProviding]) {
    uint8_t v6 = "needs";
  }
  else {
    uint8_t v6 = "doesn't need";
  }
  int v7 = objc_msgSend(*(id *)(a2 + 32), "fp_shortDescription");
  uint64_t v8 = [a1 syncRootID];
  int v9 = 136315650;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  long long v12 = v7;
  __int16 v13 = 2112;
  long long v14 = v8;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s providing %@ (sync root %@)", (uint8_t *)&v9, 0x20u);
}

void __34__FPDDomain__registerInSpaceForce__block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = *(void **)(a1 + 32);
  int v7 = [v6 checkableURLs];
  uint64_t v8 = [*(id *)(a1 + 32) provider];
  int v9 = [v8 identifier];
  uint64_t v10 = objc_msgSend(a2, "fp_prettyDescription");
  int v13 = 138413058;
  long long v14 = v6;
  OUTLINED_FUNCTION_13_0();
  uint64_t v15 = v7;
  __int16 v16 = v11;
  id v17 = v9;
  __int16 v18 = v11;
  uint64_t v19 = v12;
  _os_log_fault_impl(&dword_1D744C000, a3, OS_LOG_TYPE_FAULT, "[CRIT] %@: paths %@ for bundle %@ Space Attribution registration error: %@", (uint8_t *)&v13, 0x2Au);
}

void __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = [v3 provider];
  uint8_t v6 = [v5 identifier];
  int v7 = objc_msgSend(v1, "fp_prettyDescription");
  int v10 = 138413058;
  __int16 v11 = v3;
  OUTLINED_FUNCTION_13_0();
  uint64_t v12 = v4;
  __int16 v13 = v8;
  long long v14 = v6;
  __int16 v15 = v8;
  uint64_t v16 = v9;
  _os_log_fault_impl(&dword_1D744C000, v0, OS_LOG_TYPE_FAULT, "[CRIT] %@: path %@ for bundle %@ Space Attribution unregistration error: %@", (uint8_t *)&v10, 0x2Au);
}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315394;
  uint64_t v5 = "-[FPDDomain didChangeItemID:request:completionHandler:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, a2, a3, "[DEBUG] %s: %@", (uint8_t *)&v4);
}

void __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  __int16 v6 = [*(id *)(a1 + 32) identifier];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = objc_msgSend(a2, "fp_prettyDescription");
  int v11 = 138412802;
  uint64_t v12 = v6;
  OUTLINED_FUNCTION_13_0();
  uint64_t v13 = v7;
  __int16 v14 = v9;
  uint64_t v15 = v10;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Could not tell extension %@ that item at %@ did change. Error: %@", (uint8_t *)&v11, 0x20u);
}

void __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v4 = [(id)OUTLINED_FUNCTION_7(a1) providerItemID];
  uint64_t v5 = [*(id *)(a1 + 40) etag];
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_9_0(&dword_1D744C000, a2, v6, "[DEBUG] failed to download the thumbnail for %@: %@", v7);
}

@end