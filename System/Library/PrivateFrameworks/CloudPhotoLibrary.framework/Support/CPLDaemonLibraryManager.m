@interface CPLDaemonLibraryManager
- (BOOL)isLibraryManager;
- (BOOL)isLibraryManager:(id)a3;
- (BOOL)isManagement;
- (BOOL)isManagementLibraryManager:(id)a3;
- (CPLDaemonLibraryManager)initWithConnection:(id)a3 name:(id)a4 allowedProcol:(id)a5 isManagement:(BOOL)a6;
- (CPLDaemonLibraryManagerDelegate)delegate;
- (CPLEngineWrapper)engineWrapper;
- (NSString)description;
- (NSString)name;
- (NSString)status;
- (NSXPCConnection)connection;
- (id)_clientWithErrorHandler:(id)a3;
- (id)displayableNameForLibraryManager:(id)a3;
- (void)_dropAllOtherLibraryManagersAndCallBlock:(id)a3;
- (void)_dropManagerWithCompletionBlock:(id)a3;
- (void)_dropVoucherForTaskWithIdentifier:(id)a3;
- (void)_dropWithCompletionBlock:(id)a3;
- (void)_killWithCompletionBlock:(id)a3;
- (void)_storeUploadTransferTask:(id)a3;
- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4;
- (void)_whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:(id)a3 callBlock:(id)a4;
- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 reply:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 reply:(id)a5;
- (void)beginPullSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)beginPushSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelSyncTaskWithIdentifier:(id)a3;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)closeLibraryWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)connectWithCompletionHandler:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateLibraryWithCompletionHandler:(id)a3;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)finalizeSessionWithCompletionHandler:(id)a3;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSyncForScopeIdentifiers:(id)a3 reply:(id)a4;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
- (void)getChangedStatusesWithCompletionHandler:(id)a3;
- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getListOfComponentsWithCompletionHandler:(id)a3;
- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5;
- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5;
- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4;
- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4;
- (void)libraryManager:(id)a3 didFinishForceSyncTask:(id)a4 withErrors:(id)a5;
- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4;
- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5;
- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManagerDidStartSynchronization:(id)a3;
- (void)libraryManagerHasChangesToPull:(id)a3;
- (void)libraryManagerHasStatusChanges:(id)a3;
- (void)libraryManagerStatusDidChange:(id)a3;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)openLibraryWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9;
- (void)processSessionContext:(id)a3;
- (void)provideCloudResource:(id)a3 completionHandler:(id)a4;
- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4;
- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)reportMiscInformation:(id)a3;
- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4;
- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3;
- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)resetStatus;
- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLDaemonLibraryManager

- (CPLDaemonLibraryManager)initWithConnection:(id)a3 name:(id)a4 allowedProcol:(id)a5 isManagement:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v44.receiver = self;
  v44.super_class = (Class)CPLDaemonLibraryManager;
  v14 = [(CPLDaemonLibraryManager *)&v44 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a3);
    v15->_processIdentifier = [v11 processIdentifier];
    v15->_isManagement = a6;
    if ([v12 hasPrefix:@"com.apple."])
    {
      uint64_t v16 = [v12 substringFromIndex:10];

      id v12 = (id)v16;
    }
    v17 = (NSString *)[v12 copy];
    name = v15->_name;
    v15->_name = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    downloadTasksPerIdentifier = v15->_downloadTasksPerIdentifier;
    v15->_downloadTasksPerIdentifier = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uploadTasksPerIdentifier = v15->_uploadTasksPerIdentifier;
    v15->_uploadTasksPerIdentifier = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    forceSyncTasksPerIdentifier = v15->_forceSyncTasksPerIdentifier;
    v15->_forceSyncTasksPerIdentifier = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    vouchersPerTaskIdentifier = v15->_vouchersPerTaskIdentifier;
    v15->_vouchersPerTaskIdentifier = v25;

    v27 = CPLCopyDefaultSerialQueueAttributes();
    v28 = [v11 _queue];
    dispatch_queue_t v29 = dispatch_queue_create_with_target_V2("com.apple.cloudphotod.daemon.librarymanager", v27, v28);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v15->_allowedProtocol, a5);
    uint64_t v31 = NSStringFromProtocol(v15->_allowedProtocol);
    protocolDescription = v15->_protocolDescription;
    v15->_protocolDescription = (NSString *)v31;

    if ([(NSString *)v15->_protocolDescription hasPrefix:@"CPLDaemon"])
    {
      uint64_t v33 = [(NSString *)v15->_protocolDescription substringFromIndex:9];
      v34 = v15->_protocolDescription;
      v15->_protocolDescription = (NSString *)v33;
    }
    if ([(NSString *)v15->_protocolDescription hasSuffix:@"Protocol"])
    {
      uint64_t v35 = [(NSString *)v15->_protocolDescription substringToIndex:(char *)[(NSString *)v15->_protocolDescription length] - 8];
      v36 = v15->_protocolDescription;
      v15->_protocolDescription = (NSString *)v35;
    }
    v15->_isLibraryManager = v15->_allowedProtocol == (Protocol *)&OBJC_PROTOCOL___CPLDaemonLibraryManagerProtocol;
    v37 = +[CPLProxyLibraryManager daemonProtocolInterface];
    [v11 setExportedInterface:v37];
    [v11 setExportedObject:v15];
    v38 = +[CPLProxyLibraryManager clientProtocolInterface];
    [v11 setRemoteObjectInterface:v38];
    [v11 _setQueue:v15->_queue];
    [v11 setDelegate:v15];
    objc_initWeak(&location, v11);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100019C1C;
    v40[3] = &unk_100276B38;
    objc_copyWeak(&v42, &location);
    v41 = v15;
    [v11 setInvalidationHandler:v40];
    [v11 resume];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v15;
}

- (void)dealloc
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_100019D60();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ has been deallocated", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CPLDaemonLibraryManager;
  [(CPLDaemonLibraryManager *)&v4 dealloc];
}

- (NSString)status
{
  engineWrapper = self->_engineWrapper;
  id v4 = objc_alloc((Class)NSString);
  v5 = v4;
  name = self->_name;
  uint64_t processIdentifier = self->_processIdentifier;
  if (engineWrapper)
  {
    v8 = [(CPLEngineWrapper *)self->_engineWrapper libraryIdentifier];
    id v9 = [v5 initWithFormat:@"%@ - pid: %d - proxy: %p - attached to %@", name, processIdentifier, self, v8];
  }
  else
  {
    id v9 = [v4 initWithFormat:@"%@ - pid: %d - proxy: %p - waiting for client to open a library manager", name, self->_processIdentifier, self];
  }
  return (NSString *)v9;
}

- (NSString)description
{
  engineWrapper = self->_engineWrapper;
  id v4 = objc_alloc((Class)NSString);
  v5 = v4;
  name = self->_name;
  uint64_t processIdentifier = self->_processIdentifier;
  protocolDescription = self->_protocolDescription;
  if (engineWrapper)
  {
    id v9 = [(CPLEngineWrapper *)self->_engineWrapper libraryIdentifier];
    id v10 = [v5 initWithFormat:@"<%@ (%d) %@ for %@>", name, processIdentifier, protocolDescription, v9];
  }
  else
  {
    id v10 = [v4 initWithFormat:@"<%@ (%d) %@ waiting for open>", name, self->_processIdentifier, protocolDescription];
  }
  return (NSString *)v10;
}

- (id)_clientWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (void)connectWithCompletionHandler:(id)a3
{
}

- (void)_dropManagerWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  manager = self->_manager;
  if (manager)
  {
    if (!_CPLSilentLogging)
    {
      v6 = sub_100019D60();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Closing current library manager", buf, 2u);
      }

      manager = self->_manager;
    }
    v7 = [(CPLLibraryManager *)manager currentSession];
    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        v8 = sub_100019D60();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          name = self->_name;
          int processIdentifier = self->_processIdentifier;
          id v11 = [(id)objc_opt_class() shortDescription];
          *(_DWORD *)buf = 138543874;
          v23 = (CPLDaemonLibraryManager *)name;
          __int16 v24 = 1024;
          LODWORD(v25[0]) = processIdentifier;
          WORD2(v25[0]) = 2112;
          *(void *)((char *)v25 + 6) = v11;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ (%d) unexpectedly quit during %@ session - might trigger a reset sync", buf, 0x1Cu);
        }
      }
      id v12 = self->_name;
      id v13 = [(id)objc_opt_class() shortDescription];
      +[CPLResetTracker registerLikelyResetReason:@"%@ unexpectedly quit during %@ session", v12, v13];
    }
    [(NSMutableDictionary *)self->_vouchersPerTaskIdentifier removeAllObjects];
    if (!_CPLSilentLogging)
    {
      v14 = sub_100019D60();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [(NSMutableDictionary *)self->_downloadTasksPerIdentifier count];
        *(_DWORD *)buf = 138412546;
        v23 = self;
        __int16 v24 = 2048;
        v25[0] = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ cancelling %lu tasks", buf, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_downloadTasksPerIdentifier enumerateKeysAndObjectsUsingBlock:&stru_100276B78];
    [(NSMutableDictionary *)self->_downloadTasksPerIdentifier removeAllObjects];
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = sub_100019D60();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [(NSMutableDictionary *)self->_forceSyncTasksPerIdentifier count];
        *(_DWORD *)buf = 138412546;
        v23 = self;
        __int16 v24 = 2048;
        v25[0] = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ cancelling %lu sync tasks", buf, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_forceSyncTasksPerIdentifier enumerateKeysAndObjectsUsingBlock:&stru_100276BB8];
    [(NSMutableDictionary *)self->_forceSyncTasksPerIdentifier removeAllObjects];
    [(NSMutableDictionary *)self->_uploadTasksPerIdentifier removeAllObjects];
    v18 = self->_manager;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001A380;
    v20[3] = &unk_100276390;
    v20[4] = self;
    v21 = v4;
    [(CPLLibraryManager *)v18 closeWithCompletionHandler:v20];
    v19 = self->_manager;
    self->_manager = 0;
  }
  else
  {
    v4[2](v4);
  }
}

- (void)_killWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001A534;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026948;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_dropWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001A954;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026948;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:(id)a3 callBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  dispatch_block_t v9 = [WeakRetained daemonLibraryManagerOtherLibraryManager:self withLibraryIdentifier:v6];

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v15 = self;
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ is connecting to engine while %@ is already connected. Will drop %@", buf, 0x20u);
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001ACB0;
    v11[3] = &unk_100275D40;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v9 _killWithCompletionBlock:v11];
  }
  else
  {
    v7[2](v7);
  }
}

- (void)_dropAllOtherLibraryManagersAndCallBlock:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = [(CPLDaemonLibraryManager *)self engineWrapper];
  id v8 = [v7 libraryIdentifier];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001AF40;
  v14[3] = &unk_100276C20;
  v14[4] = self;
  dispatch_group_t v15 = v5;
  dispatch_block_t v9 = v5;
  [WeakRetained enumerateDaemonLibraryManagersWithLibraryIdentifier:v8 block:v14];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B000;
  block[3] = &unk_100275DF8;
  id v13 = v4;
  id v11 = v4;
  dispatch_group_notify(v9, (dispatch_queue_t)queue, block);
}

- (void)openLibraryWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001B1B0;
  v30[3] = &unk_100276C70;
  v30[4] = self;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v22 = v19;
  id v34 = v22;
  id v35 = v20;
  unint64_t v37 = a8;
  SEL v38 = a2;
  id v36 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  v28 = objc_retainBlock(v30);
  dispatch_queue_t v29 = v28;
  if (self->_isLibraryManager) {
    [(CPLDaemonLibraryManager *)self _whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:v22 callBlock:v28];
  }
  else {
    ((void (*)(void *))v28[2])(v28);
  }
}

- (void)closeLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_group_t v5 = sub_100019D60();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Closing library manager for %@", buf, 0xCu);
      }
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001BDA0;
    v8[3] = &unk_100275DF8;
    id v9 = v4;
    [(CPLDaemonLibraryManager *)self _dropManagerWithCompletionBlock:v8];
    id v6 = v9;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v7 = sub_100019D60();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ tried to close a manager that is not present", buf, 0xCu);
      }
    }
    id v6 = +[CPLErrors unknownError];
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
}

- (void)deactivateLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_group_t v5 = sub_100019D60();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(CPLLibraryManager *)self->_manager libraryIdentifier];
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DEACTIVATING LIBRARY %{public}@", buf, 0xCu);
      }
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001BFA0;
    v10[3] = &unk_100276288;
    v10[4] = self;
    id v11 = v4;
    [(CPLDaemonLibraryManager *)self _dropAllOtherLibraryManagersAndCallBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v7 = sub_100019D60();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [(CPLEngineWrapper *)self->_engineWrapper libraryIdentifier];
        *(_DWORD *)buf = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        dispatch_group_t v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ tried to deactivate a manager for %@ that is not present", buf, 0x16u);
      }
    }
    id v9 = +[CPLErrors unknownError];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = [(CPLLibraryManager *)manager mainScopeIdentifier];
    unsigned int v10 = [v6 isEqualToString:v9];

    id v11 = self->_manager;
    if (v10) {
      [(CPLLibraryManager *)v11 enableMainScopeWithCompletionHandler:v7];
    }
    else {
      [(CPLLibraryManager *)v11 activateScopeWithIdentifier:v6 completionHandler:v7];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        dispatch_group_t v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to enable PrimarySync for a manager that is not present", (uint8_t *)&v14, 0xCu);
      }
    }
    id v13 = +[CPLErrors unknownError];
    v7[2](v7, v13);
  }
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = [(CPLLibraryManager *)manager mainScopeIdentifier];
    unsigned int v10 = [v6 isEqualToString:v9];

    id v11 = self->_manager;
    if (v10) {
      [(CPLLibraryManager *)v11 disableMainScopeWithCompletionHandler:v7];
    }
    else {
      [(CPLLibraryManager *)v11 deactivateScopeWithIdentifier:v6 completionHandler:v7];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        dispatch_group_t v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to enable PrimarySync for a manager that is not present", (uint8_t *)&v14, 0xCu);
      }
    }
    id v13 = +[CPLErrors unknownError];
    v7[2](v7, v13);
  }
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager boostPriorityForScopeWithIdentifier:v6 completionHandler:v7];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to boost priority for %@ for a manager that is not present", (uint8_t *)&v11, 0x16u);
      }
    }
    unsigned int v10 = +[CPLErrors unknownError];
    v7[2](v7, v10);
  }
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_manager)
  {
    id v17 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      id v18 = sub_100019D60();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412802;
        v30 = (CPLDaemonLibraryManager *)manager;
        __int16 v31 = 2112;
        id v32 = v12;
        __int16 v33 = 2112;
        id v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Asking %@ for a task to download %@(%@)", buf, 0x20u);
      }
    }
    id v20 = self->_manager;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001C8C4;
    v23[3] = &unk_100276CC0;
    id v24 = v12;
    id v25 = v14;
    id v26 = self;
    id v27 = v17;
    id v28 = v16;
    id v21 = v17;
    [(CPLLibraryManager *)v20 beginDownloadForResource:v24 clientBundleID:v13 options:v25 proposedTaskIdentifier:v15 completionHandler:v23];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_100019D60();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ tried to download a resource for a manager that is not present", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_group_t v5 = [(NSMutableDictionary *)self->_downloadTasksPerIdentifier objectForKey:v4];
    if (!v5)
    {
      dispatch_group_t v5 = [(NSMutableDictionary *)self->_uploadTasksPerIdentifier objectForKey:v4];
    }
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100019D60();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v7 = 138412290;
        id v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Cancelling %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [v5 cancelTask];
LABEL_12:

    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    dispatch_group_t v5 = sub_100019D60();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ tried to cancel a task with no identifier", (uint8_t *)&v7, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)processSessionContext:(id)a3
{
  manager = self->_manager;
  id v5 = a3;
  -[CPLLibraryManager setEstimatedInitialSizeForLocalLibrary:](manager, "setEstimatedInitialSizeForLocalLibrary:", [v5 estimatedInitialSizeForLocalLibrary]);
  id v6 = self->_manager;
  id v7 = [v5 estimatedInitialAssetCountForLocalLibrary];

  [(CPLLibraryManager *)v6 setEstimatedInitialAssetCountForLocalLibrary:v7];
}

- (void)beginPushSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412290;
        id v28 = (CPLDaemonLibraryManager *)manager;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Beginning push session with %@", buf, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startSyncTaskForDaemonLibraryManager:self];

    [(CPLDaemonLibraryManager *)self processSessionContext:v9];
    id v14 = [v9 resetTracker];
    id v15 = +[CPLResetTracker currentTracker];
    id v16 = [v14 earliestReasonDate];
    id v17 = [v15 earliestReasonDate];
    id v18 = [v16 compare:v17];

    if (v18 == (id)-1) {
      id v19 = v14;
    }
    else {
      id v19 = v15;
    }
    id v20 = v19;
    id v21 = self->_manager;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001CEE4;
    v24[3] = &unk_100276CE8;
    id v25 = v15;
    id v26 = v10;
    id v22 = v15;
    [(CPLLibraryManager *)v21 beginPushChangeSessionWithKnownLibraryVersion:v8 resetTracker:v20 completionHandler:v24];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_100019D60();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ tried to begin a push session for a manager that is not present", buf, 0xCu);
      }
    }
    id v14 = +[CPLErrors unknownError];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)beginPullSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412290;
        id v27 = (CPLDaemonLibraryManager *)manager;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Beginning pull session with %@", buf, 0xCu);
      }
    }
    [(CPLDaemonLibraryManager *)self processSessionContext:v9];
    id v13 = [v9 resetTracker];
    id v14 = +[CPLResetTracker currentTracker];
    id v15 = [v13 earliestReasonDate];
    id v16 = [v14 earliestReasonDate];
    id v17 = [v15 compare:v16];

    if (v17 == (id)-1) {
      id v18 = v13;
    }
    else {
      id v18 = v14;
    }
    id v19 = v18;
    id v20 = self->_manager;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001D2D8;
    v23[3] = &unk_100276D10;
    id v24 = v14;
    id v25 = v10;
    id v21 = v14;
    [(CPLLibraryManager *)v20 beginPullChangeSessionWithKnownLibraryVersion:v8 resetTracker:v19 completionHandler:v23];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_100019D60();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ tried to begin a pull session for a manager that is not present", buf, 0xCu);
      }
    }
    id v13 = +[CPLErrors unknownError];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

- (void)finalizeSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    id v6 = [(CPLLibraryManager *)manager currentSession];
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_100019D60();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Finalizing %@", buf, 0xCu);
        }
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001D6A8;
      v12[3] = &unk_100276D38;
      id v13 = v4;
      [(CPLDaemonLibraryManager *)v6 finalizeWithCompletionHandler:v12];
      id v8 = v13;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100019D60();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v11 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v15 = self;
          __int16 v16 = 2112;
          id v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to finalize a session for %@ but there is no current session", buf, 0x16u);
        }
      }
      id v8 = +[CPLErrors incorrectMachineStateErrorWithReason:@"No session opened"];
      (*((void (**)(id, void *))v4 + 2))(v4, v8);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to finalize a session for a manager that is not present", buf, 0xCu);
      }
    }
    id v6 = +[CPLErrors unknownError];
    (*((void (**)(id, CPLDaemonLibraryManager *))v4 + 2))(v4, v6);
  }
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    id v6 = [(CPLLibraryManager *)manager currentSession];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_100019D60();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Getting changes from %@", buf, 0xCu);
        }
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001DA7C;
      v12[3] = &unk_100276D60;
      id v13 = v4;
      [(CPLDaemonLibraryManager *)v6 getChangeBatchWithCompletionHandler:v12];
      id v8 = v13;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v9 = sub_100019D60();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v15 = self;
          __int16 v16 = 2112;
          id v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to get changes for %@ but there is no current pull session", buf, 0x16u);
        }
      }
      id v8 = +[CPLErrors incorrectMachineStateErrorWithReason:@"No session opened"];
      (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ tried to get changes for a manager that is not present", buf, 0xCu);
      }
    }
    id v6 = +[CPLErrors unknownError];
    (*((void (**)(id, CPLDaemonLibraryManager *, void))v4 + 2))(v4, v6, 0);
  }
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (CPLLibraryManager *)a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = [(CPLLibraryManager *)manager currentSession];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100019D60();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v9;
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Acknowledging batch from %@: %@", buf, 0x16u);
        }
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001DFD4;
      v15[3] = &unk_100276D88;
      id v16 = v7;
      [(CPLDaemonLibraryManager *)v9 acknowledgeChangeBatch:v6 withCompletionHandler:v15];
      int v11 = v16;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v12 = sub_100019D60();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v18 = self;
          __int16 v19 = 2112;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to acknowledge a batch for %@ but there is no current pull session", buf, 0x16u);
        }
      }
      int v11 = +[CPLErrors incorrectMachineStateErrorWithReason:@"No session opened"];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_100019D60();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ tried to acknowledge a batch for a manager that is not present", buf, 0xCu);
      }
    }
    id v9 = +[CPLErrors unknownError];
    (*((void (**)(id, CPLDaemonLibraryManager *, void))v7 + 2))(v7, v9, 0);
  }
}

- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (CPLLibraryManager *)a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = [(CPLLibraryManager *)manager currentSession];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100019D60();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v9;
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Committing batch to %@: %@", buf, 0x16u);
        }
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001E404;
      v15[3] = &unk_100276DB0;
      id v16 = v7;
      [(CPLDaemonLibraryManager *)v9 commitChangeBatch:v6 withUnderlyingCompletionHandler:v15];
      int v11 = v16;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v12 = sub_100019D60();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v18 = self;
          __int16 v19 = 2112;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to commit a batch for %@ but there is no current push session", buf, 0x16u);
        }
      }
      int v11 = +[CPLErrors incorrectMachineStateErrorWithReason:@"No session opened"];
      (*((void (**)(id, void *, void, void, void))v7 + 2))(v7, v11, 0, 0, 0);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_100019D60();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ tried to commit a batch for a manager that is not present", buf, 0xCu);
      }
    }
    id v9 = +[CPLErrors unknownError];
    (*((void (**)(id, CPLDaemonLibraryManager *, void, void, void))v7 + 2))(v7, v9, 0, 0, 0);
  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager deleteResources:v8 checkServerIfNecessary:v6 completionHandler:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ tried to delete resources for a manager that is not present", buf, 0xCu);
      }
    }
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = +[CPLErrors unknownError];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *(void *)(*((void *)&v19 + 1) + 8 * (void)v18), (void)v19);
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }

    v9[2](v9, &__NSArray0__struct, v12);
  }
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager checkResourcesAreSafeToPrune:v8 checkServerIfNecessary:v6 completionHandler:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ tried to check purgeable resources for a manager that is not present", buf, 0xCu);
      }
    }
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = +[CPLErrors unknownError];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *(void *)(*((void *)&v19 + 1) + 8 * (void)v18), (void)v19);
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }

    v9[2](v9, &__NSArray0__struct, v12);
  }
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getResourcesForItemWithScopedIdentifier:v6 completionHandler:v7];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to get resources for a manager that is not present", (uint8_t *)&v11, 0xCu);
      }
    }
    id v10 = +[CPLErrors unknownError];
    v7[2](v7, v10, 0);
  }
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager compactFileCacheWithCompletionHandler:v4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100019D60();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ tried to compact file cache for a manager that is not present", (uint8_t *)&v8, 0xCu);
      }
    }
    id v7 = +[CPLErrors unknownError];
    v4[2](v4, v7);
  }
}

- (void)startSyncSession
{
}

- (void)resetStatus
{
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
}

- (void)noteClientIsInBackground
{
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001ED5C;
    v11[3] = &unk_100276DD8;
    id v12 = v5;
    [(CPLLibraryManager *)manager checkHasBackgroundDownloadOperationsWithCompletionHandler:v11];
    int v8 = v12;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v8 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v8);
  }
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getStatusForRecordsWithScopedIdentifiers:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    id v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getChangedStatusesWithCompletionHandler:v5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_100019D60();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = NSStringFromSelector(a2);
        int v10 = 138412546;
        int v11 = self;
        __int16 v12 = 2112;
        int v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v10, 0x16u);
      }
    }
    id v9 = +[CPLErrors unknownError];
    v5[2](v5, 0, v9);
  }
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5 = a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager acknowledgeChangedStatuses:v5];
  }
  else if (!_CPLSilentLogging)
  {
    id v7 = sub_100019D60();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = NSStringFromSelector(a2);
      int v9 = 138412546;
      int v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager addStatusChangesForRecordsWithScopedIdentifiers:v7 persist:v4];
  }
  else if (!_CPLSilentLogging)
  {
    int v9 = sub_100019D60();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = NSStringFromSelector(a2);
      int v11 = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getScopeStatusCountsForScopeWithIdentifier:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    __int16 v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)disableSynchronizationWithReason:(id)a3
{
}

- (void)enableSynchronizationWithReason:(id)a3
{
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
}

- (void)disableMingling
{
}

- (void)enableMingling
{
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager testKey:v9 value:v10 completionHandler:v11];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v13 = sub_100019D60();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v16 = 138412546;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        long long v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v16, 0x16u);
      }
    }
    __int16 v15 = +[CPLErrors unknownError];
    v11[2](v11, 0, v15);
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getTargetsForRecordsWithScopedIdentifiers:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    __int16 v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager resetCacheWithOption:a3 reason:v9 completionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __int16 v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        int v16 = self;
        __int16 v17 = 2112;
        __int16 v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v10[2](v10, v14);
  }
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getListOfComponentsWithCompletionHandler:v5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_100019D60();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = NSStringFromSelector(a2);
        int v10 = 138412546;
        int v11 = self;
        __int16 v12 = 2112;
        int v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v10, 0x16u);
      }
    }
    id v9 = +[CPLErrors unknownError];
    v5[2](v5, 0, v9);
  }
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getStatusForComponents:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    __int16 v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getStatusArrayForComponents:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    __int16 v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  int v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getStatusesForScopesWithIdentifiers:v9 includeStorages:v6 completionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __int16 v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        int v16 = self;
        __int16 v17 = 2112;
        __int16 v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v10[2](v10, 0, v14);
  }
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getCloudCacheForRecordWithScopedIdentifier:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    __int16 v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager cloudCacheGetDescriptionForRecordWithScopedIdentifier:v9 related:v6 completionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __int16 v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        int v16 = self;
        __int16 v17 = 2112;
        __int16 v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v14);
  }
}

- (void)addInfoToLog:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager addInfoToLog:v4];
  }
  else if (!_CPLSilentLogging)
  {
    BOOL v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ wants to say '%@' but manager is not present", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  manager = self->_manager;
  if (manager)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002017C;
    v9[3] = &unk_100276D38;
    id v10 = v4;
    [(CPLLibraryManager *)manager forceBackupWithCompletionHandler:v9];
    int v7 = v10;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v8 = sub_100019D60();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ wants to force a backup but manager is not present", buf, 0xCu);
      }
    }
    int v7 = +[CPLErrors unknownError];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  manager = self->_manager;
  if (manager)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100020338;
    v9[3] = &unk_100276D38;
    id v10 = v4;
    [(CPLLibraryManager *)manager requestClientToPushAllChangesWithCompletionHandler:v9];
    int v7 = v10;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v8 = sub_100019D60();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ wants to force client to push all changes but manager is not present", buf, 0xCu);
      }
    }
    int v7 = +[CPLErrors unknownError];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void (**)(void, void))v7;
  manager = self->_manager;
  if (manager)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100020508;
    v12[3] = &unk_100276D38;
    id v13 = v7;
    [(CPLLibraryManager *)manager requestClientToPullAllChangesInScopeIdentifier:v6 completionHandler:v12];
    id v10 = v13;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ wants to force client to pull all changes but manager is not present", buf, 0xCu);
      }
    }
    id v10 = +[CPLErrors unknownError];
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager reportSetting:v6 hasBeenSetToValue:v7];
  }
  else if (!_CPLSilentLogging)
  {
    __int16 v9 = sub_100019D60();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      int v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ wants to report setting '%@' has been set to %@ but manager is not present", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager reportMiscInformation:v4];
  }
  else if (!_CPLSilentLogging)
  {
    id v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ wants to report misc information '%@' but manager is not present", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)blockEngineElement:(id)a3
{
}

- (void)unblockEngineElement:(id)a3
{
}

- (void)unblockEngineElementOnce:(id)a3
{
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager provideScopeChangeForScopeWithIdentifier:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", (uint8_t *)&v12, 0x16u);
      }
    }
    v8[2](v8, 0, 2);
  }
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager provideRecordWithCloudScopeIdentifier:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", (uint8_t *)&v12, 0x16u);
      }
    }
    v8[2](v8, 0, 2);
  }
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager provideCloudResource:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", (uint8_t *)&v12, 0x16u);
      }
    }
    v8[2](v8, 0, 2);
  }
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager addDropDerivativesRecipe:v9 writeToUserDefaults:v6 withCompletionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        int v14 = 138412546;
        id v15 = self;
        __int16 v16 = 2112;
        __int16 v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", (uint8_t *)&v14, 0x16u);
      }
    }
    v10[2](v10, 0);
  }
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager attachComputeStates:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", (uint8_t *)&v12, 0x16u);
      }
    }
    v8[2](v8, 0);
  }
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  __int16 v16 = (void (**)(void, void, void))v15;
  manager = self->_manager;
  if (manager)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100020F3C;
    v21[3] = &unk_100276E00;
    id v22 = v15;
    [(CPLLibraryManager *)manager fetchComputeStatesForRecordsWithScopedIdentifiers:v13 validator:v14 shouldDecrypt:v9 onDemand:v8 completionHandler:v21];
    __int16 v18 = v22;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      long long v19 = sub_100019D60();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v24 = self;
        __int16 v25 = 2112;
        id v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ called for '%@' but manager is not present", buf, 0x16u);
      }
    }
    __int16 v18 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v16)[2](v16, 0, v18);
  }
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  long long v19 = (void (**)(void, void, void, void, void, void))v18;
  manager = self->_manager;
  if (manager)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000211BC;
    void v25[3] = &unk_100276E28;
    id v26 = v18;
    long long v21 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0.var0;
    *(_OWORD *)&buf[16] = v21;
    long long v28 = *(_OWORD *)&a6->var1.var1;
    [(CPLLibraryManager *)manager getStreamingURLOrMediaMakerDataForResource:v15 intent:a4 hints:v16 timeRange:buf clientBundleID:v17 completionHandler:v25];
    id v22 = v26;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_100019D60();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    id v22 = +[CPLErrors unknownError];
    ((void (**)(void, void, void, void, void, void *))v19)[2](v19, 0, 0, 0, 0, v22);
  }
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = (void (**)(void, void, void, void))v9;
  manager = self->_manager;
  if (manager)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002141C;
    v15[3] = &unk_100276E50;
    id v16 = v9;
    [(CPLLibraryManager *)manager rampingRequestForResourceType:a3 numRequested:a4 completionHandler:v15];
    int v12 = v16;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100019D60();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        long long v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v12 = +[CPLErrors unknownError];
    ((void (**)(void, void, void, void *))v10)[2](v10, 0, 0, v12);
  }
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    int v11 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412546;
        id v23 = (CPLDaemonLibraryManager *)manager;
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Asking %@ for a task to download %@ in-memory", buf, 0x16u);
      }
    }
    id v14 = self->_manager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000216BC;
    v17[3] = &unk_100276E78;
    id v18 = v8;
    __int16 v19 = self;
    id v20 = v11;
    id v21 = v10;
    id v15 = v11;
    [(CPLLibraryManager *)v14 beginInMemoryDownloadOfResource:v18 clientBundleID:v9 completionHandler:v17];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_100019D60();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ tried to download in-memory a resource for a manager that is not present", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager resolveLocalScopedIdentifiersForCloudScopedIdentifiers:v7 completionHandler:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100019D60();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = NSStringFromSelector(a2);
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v13, 0x16u);
      }
    }
    int v12 = +[CPLErrors unknownError];
    v8[2](v8, 0, v12);
  }
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    if (v6) {
      [(CPLLibraryManager *)manager getCloudScopedIdentifiersForLocalScopedIdentifiers:v9 completionHandler:v10];
    }
    else {
      [(CPLLibraryManager *)manager getLocalScopedIdentifiersForCloudScopedIdentifiers:v9 completionHandler:v10];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v10[2](v10, 0, v14);
  }
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021C98;
    v14[3] = &unk_100276EA0;
    id v15 = v8;
    [(CPLLibraryManager *)manager createScope:v7 completionHandler:v14];
    int v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v11 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021EB4;
    v14[3] = &unk_100276EA0;
    id v15 = v8;
    [(CPLLibraryManager *)manager updateShareForScope:v7 completionHandler:v14];
    int v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v11 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  int v11 = (void (**)(void, void))v10;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000220D4;
    v16[3] = &unk_100276D38;
    id v17 = v10;
    [(CPLLibraryManager *)manager deleteScopeWithIdentifier:v9 forced:v6 completionHandler:v16];
    int v13 = v17;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_100019D60();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v13 = +[CPLErrors unknownError];
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000222D4;
    v14[3] = &unk_100276EA0;
    id v15 = v8;
    [(CPLLibraryManager *)manager refreshScopeWithIdentifier:v7 completionHandler:v14];
    int v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v11 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000224F0;
    v14[3] = &unk_100276EA0;
    id v15 = v8;
    [(CPLLibraryManager *)manager fetchSharedScopeFromShareURL:v7 completionHandler:v14];
    int v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v11 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100022708;
    v14[3] = &unk_100276D38;
    id v15 = v8;
    [(CPLLibraryManager *)manager acceptSharedScope:v7 completionHandler:v14];
    int v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    int v11 = +[CPLErrors unknownError];
    ((void (**)(void, void *))v9)[2](v9, v11);
  }
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000228EC;
    v11[3] = &unk_100276EA0;
    id v12 = v5;
    [(CPLLibraryManager *)manager fetchExistingSharedLibraryScopeWithCompletionHandler:v11];
    id v8 = v12;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    id v8 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v8);
  }
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  int v13 = (void (**)(void, void, void))v12;
  manager = self->_manager;
  if (manager)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100022B20;
    v18[3] = &unk_100276EC8;
    id v19 = v12;
    [(CPLLibraryManager *)manager startExitFromSharedScopeWithIdentifier:v11 retentionPolicy:a4 exitSource:a5 completionHandler:v18];
    __int16 v15 = v19;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_100019D60();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v21 = self;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    __int16 v15 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v15);
  }
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = (void (**)(void, void, void))v15;
  manager = self->_manager;
  if (manager)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100022D68;
    v21[3] = &unk_100276EC8;
    id v22 = v15;
    [(CPLLibraryManager *)manager removeParticipants:v13 fromSharedScopeWithIdentifier:v14 retentionPolicy:a5 exitSource:a6 completionHandler:v21];
    __int16 v18 = v22;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_100019D60();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v24 = self;
        __int16 v25 = 2112;
        id v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    __int16 v18 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v16)[2](v16, 0, v18);
  }
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100022F68;
    v11[3] = &unk_100276DD8;
    id v12 = v5;
    [(CPLLibraryManager *)manager sharedLibraryRampCheckWithCompletionHandler:v11];
    id v8 = v12;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    id v8 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v8);
  }
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    [(CPLLibraryManager *)manager getStatusForPendingRecordsSharedToScopeWithIdentifier:v9 maximumCount:a4 completionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        __int16 v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v10[2](v10, 0, v14);
  }
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000232C4;
    v14[3] = &unk_100276EF0;
    id v15 = v8;
    [(CPLLibraryManager *)manager queryUserDetailsForShareParticipants:v7 completionHandler:v14];
    id v11 = v15;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100019D60();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v17 = self;
        __int16 v18 = 2112;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ tried to call %@ for a manager that is not present", buf, 0x16u);
      }
    }
    id v11 = +[CPLErrors unknownError];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
}

- (void)forceSyncForScopeIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_manager)
  {
    id v8 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100019D60();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        id v11 = [v6 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        id v21 = (CPLDaemonLibraryManager *)manager;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Asking %@ for a task to sync %@", buf, 0x16u);
      }
    }
    id v12 = self->_manager;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100023570;
    v15[3] = &unk_100276F18;
    id v16 = v6;
    __int16 v17 = self;
    id v18 = v8;
    id v19 = v7;
    id v13 = v8;
    [(CPLLibraryManager *)v12 forceSynchronizingScopeWithIdentifiers:v16 completionHandler:v15];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_100019D60();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ tried to force sync for a manager that is not present", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)cancelSyncTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_forceSyncTasksPerIdentifier objectForKeyedSubscript:v4];
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100019D60();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v7 = 138412290;
        id v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Cancelling %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [v5 cancelTask];
LABEL_10:

    goto LABEL_11;
  }
  if (!_CPLSilentLogging)
  {
    id v5 = sub_100019D60();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ tried to cancel a task with no identifier", (uint8_t *)&v7, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)libraryManagerStatusDidChange:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_100019D60();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      id v7 = [(CPLLibraryManager *)manager status];
      id v8 = [(CPLLibraryManager *)self->_manager statusError];
      *(_DWORD *)buf = 138412802;
      id v18 = manager;
      __int16 v19 = 2048;
      id v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ status did change to %lu (status error: %@)", buf, 0x20u);
    }
  }
  id v9 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:&stru_100276F38];
  id v10 = +[NSNumber numberWithUnsignedInteger:[(CPLLibraryManager *)self->_manager status]];
  v15[1] = @"error";
  v16[0] = v10;
  id v11 = [(CPLLibraryManager *)self->_manager statusError];
  id v12 = [v11 cplSafeErrorForXPC];
  id v13 = v12;
  if (!v12)
  {
    id v13 = +[NSNull null];
  }
  v16[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v9 libraryManagerDidUpdateStatusWithProperties:v14];

  if (!v12) {
}
  }

- (void)libraryManagerDidStartSynchronization:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_100019D60();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = NSStringFromSelector(a2);
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ is not implemented yet", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)libraryManagerHasChangesToPull:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_100019D60();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      int v7 = 138412546;
      id v8 = manager;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ has changes to pull. Notifying %@", (uint8_t *)&v7, 0x16u);
    }
  }
  int v6 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:&stru_100276F58];
  [v6 libraryManagerHasChangesToPull];
}

- (void)libraryManagerHasStatusChanges:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_100019D60();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      int v7 = 138412546;
      id v8 = manager;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ has status changes. Notifying %@", (uint8_t *)&v7, 0x16u);
    }
  }
  int v6 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:&stru_100276F78];
  [v6 libraryManagerHasStatusChanges];
}

- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_100019D60();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      *(_DWORD *)buf = 138412802;
      __int16 v24 = manager;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      long long v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ wants (local) %@. Asking %@", buf, 0x20u);
    }
  }
  __int16 v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  __int16 v19 = sub_1000240DC;
  id v20 = &unk_1002766A8;
  id v21 = v9;
  id v22 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:&v17];
  id v16 = NSStringFromClass(a5);
  objc_msgSend(v15, "provideLocalResource:recordClassString:completionHandler:", v14, v16, v13, v17, v18, v19, v20);
}

- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    int v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      *(_DWORD *)buf = 138412546;
      id v13 = manager;
      __int16 v14 = 2112;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ wants client to push all changes. Asking %@", buf, 0x16u);
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002431C;
  v10[3] = &unk_100276D38;
  id v11 = v5;
  id v8 = v5;
  id v9 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v10];
  [v9 pushAllChangesWithCompletionHandler:v8];
}

- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    int v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Download for %@ dis start. Notifying %@", buf, 0x16u);
    }
  }
  [v5 taskIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024558;
  v9[3] = &unk_1002760B0;
  void v9[4] = self;
  id v10 = v5;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v11;
  id v8 = v5;
  [(CPLDaemonLibraryManager *)self _withVoucherForTaskWithIdentifier:v7 do:v9];
}

- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_100019D60();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v7;
      __int16 v17 = 2048;
      double v18 = (float)(a4 * 100.0);
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Download for %@ did progress to %.0f%%. Notifying %@", buf, 0x20u);
    }
  }
  [v7 taskIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002485C;
  v11[3] = &unk_100276FA0;
  void v11[4] = self;
  id v12 = v7;
  float v14 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  id v10 = v7;
  [(CPLDaemonLibraryManager *)self _withVoucherForTaskWithIdentifier:v9 do:v11];
}

- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!_CPLSilentLogging)
  {
    id v12 = sub_100019D60();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v9 resource];
      *(_DWORD *)buf = 138413058;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Download for %@ did finish with final resource %@ and error: %@. Notifying %@", buf, 0x2Au);
    }
  }
  [v9 taskIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100024BC4;
  v18[3] = &unk_100276FC8;
  void v18[4] = self;
  id v19 = v9;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v20;
  id v17 = v9;
  [(CPLDaemonLibraryManager *)self _withVoucherForTaskWithIdentifier:v16 do:v18];
  [(NSMutableDictionary *)self->_downloadTasksPerIdentifier removeObjectForKey:v16];
  [(CPLDaemonLibraryManager *)self _dropVoucherForTaskWithIdentifier:v16];
}

- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!_CPLSilentLogging)
  {
    id v12 = sub_100019D60();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v23 = v9;
      __int16 v24 = 2048;
      id v25 = [v10 length];
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      __int16 v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "In-memory download for %@ did finish with %lu bytes and error: %@. Notifying %@", buf, 0x2Au);
    }
  }
  [v9 taskIdentifier];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100024F4C;
  v17[3] = &unk_100276FC8;
  void v17[4] = self;
  id v18 = v9;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v19;
  id v16 = v9;
  [(CPLDaemonLibraryManager *)self _withVoucherForTaskWithIdentifier:v15 do:v17];
  [(NSMutableDictionary *)self->_downloadTasksPerIdentifier removeObjectForKey:v15];
  [(CPLDaemonLibraryManager *)self _dropVoucherForTaskWithIdentifier:v15];
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    int v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Background download for %@ did finish", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025230;
  v9[3] = &unk_100276328;
  id v10 = v5;
  id v7 = v5;
  id v8 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v9];
  [v8 backgroundDownloadDidFinishForResource:v7];
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    int v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Background download for %@ did fail", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025428;
  v9[3] = &unk_100276328;
  id v10 = v5;
  id v7 = v5;
  id v8 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v9];
  [v8 backgroundDownloadDidFailForResource:v7];
}

- (void)_storeUploadTransferTask:(id)a3
{
  id v6 = a3;
  id v4 = [v6 taskIdentifier];
  id v5 = [(NSMutableDictionary *)self->_uploadTasksPerIdentifier objectForKey:v4];

  if (!v5) {
    [(NSMutableDictionary *)self->_uploadTasksPerIdentifier setObject:v6 forKey:v4];
  }
}

- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_100019D60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v5 resource];
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Upload for %@ did start", buf, 0xCu);
    }
  }
  [(CPLDaemonLibraryManager *)self _storeUploadTransferTask:v5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000256F8;
  v12[3] = &unk_100276328;
  id v13 = v5;
  id v8 = v5;
  id v9 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v12];
  id v10 = [v8 resource];
  id v11 = [v8 taskIdentifier];
  [v9 uploadDidStartForResource:v10 withResourceTransferTask:v11];
}

- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!_CPLSilentLogging)
  {
    id v9 = sub_100019D60();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v7 resource];
      *(_DWORD *)buf = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Upload for %@ did finish with error %@", buf, 0x16u);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002599C;
  v18[3] = &unk_100276328;
  id v19 = v7;
  id v11 = v7;
  id v12 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v18];
  id v13 = [v11 resource];
  id v14 = [v11 taskIdentifier];
  id v15 = [v8 cplSafeErrorForXPC];
  [v12 uploadOfResource:v13 didFinishForResourceTransferTask:v14 withError:v15];

  uploadTasksPerIdentifier = self->_uploadTasksPerIdentifier;
  id v17 = [v11 taskIdentifier];
  [(NSMutableDictionary *)uploadTasksPerIdentifier removeObjectForKey:v17];
}

- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_100019D60();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v7 resource];
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2048;
      double v20 = (float)(a4 * 100.0);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Upload for %@ did progress to %.0f%%", buf, 0x16u);
    }
  }
  [(CPLDaemonLibraryManager *)self _storeUploadTransferTask:v7];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100025C10;
  v15[3] = &unk_100276328;
  id v16 = v7;
  id v10 = v7;
  id v11 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:v15];
  id v12 = [v10 resource];
  id v13 = [v10 taskIdentifier];
  *(float *)&double v14 = a4;
  [v11 uploadOfResource:v12 didProgress:v13 forResourceTransferTask:v14];
}

- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sizeOfResourcesToUpload];
  id v6 = [v4 sizeOfOriginalResourcesToUpload];
  id v7 = [v4 numberOfImagesToUpload];
  id v8 = [v4 numberOfVideosToUpload];
  id v9 = [v4 numberOfOtherItemsToUpload];

  if (!_CPLSilentLogging)
  {
    id v10 = sub_100019D60();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134217984;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Size of resources to upload did change to %llu", (uint8_t *)&v12, 0xCu);
    }
  }
  id v11 = [(CPLDaemonLibraryManager *)self _clientWithErrorHandler:&stru_100276FE8];
  [v11 libraryManagerDidUpdateSizeOfResourcesToUploadToSize:v5 sizeOfOriginalResourcesToUpload:v6 numberOfImages:v7 numberOfVideos:v8 numberOfOtherItems:v9];
}

- (BOOL)isLibraryManager:(id)a3
{
  return self->_isLibraryManager;
}

- (BOOL)isManagementLibraryManager:(id)a3
{
  return self->_isManagement;
}

- (void)libraryManager:(id)a3 didFinishForceSyncTask:(id)a4 withErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_100019D60();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = [v9 scopeIdentifiers];
      *(_DWORD *)buf = 138413058;
      id v26 = v9;
      __int16 v27 = 2112;
      __int16 v28 = v12;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Force sync %@ for %@ did finish with errors: %@. Notifying %@", buf, 0x2Au);
    }
  }
  id v13 = [v9 taskIdentifier];
  if ([v10 count])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100026118;
    v23[3] = &unk_100277010;
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v10, "count"));
    id v24 = v14;
    [v10 enumerateKeysAndObjectsUsingBlock:v23];
    id v15 = v14;

    id v10 = v15;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002618C;
  v19[3] = &unk_100277038;
  v19[4] = self;
  id v20 = v9;
  id v21 = v13;
  id v22 = v10;
  id v16 = v10;
  id v17 = v13;
  id v18 = v9;
  [(CPLDaemonLibraryManager *)self _withVoucherForTaskWithIdentifier:v17 do:v19];
  [(NSMutableDictionary *)self->_forceSyncTasksPerIdentifier removeObjectForKey:v17];
  [(CPLDaemonLibraryManager *)self _dropVoucherForTaskWithIdentifier:v17];
}

- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = +[NSProgress progressWithTotalUnitCount:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100026410;
  v16[3] = &unk_100277060;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  [v12 performAsCurrentWithPendingUnitCount:1 usingBlock:v16];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_100019D60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = [v10 userInfo];
        id v13 = [v12 objectForKey:_NSXPCConnectionInvocationReplyToSelectorKey];
        int v19 = 138412546;
        id v20 = self;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ is replying to %@", (uint8_t *)&v19, 0x16u);
      }
    }
LABEL_11:
    [v10 invoke];
    goto LABEL_12;
  }
  id v14 = (const char *)[v9 selector];
  if ((unint64_t)protocol_getMethodDescription(self->_allowedProtocol, v14, 1, 1).name)
  {
    if (!_CPLSilentLogging)
    {
      id v15 = sub_100019D60();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = NSStringFromSelector(v14);
        int v19 = 138412546;
        id v20 = self;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ is calling %@", (uint8_t *)&v19, 0x16u);
      }
    }
    goto LABEL_11;
  }
  if (!_CPLSilentLogging)
  {
    id v17 = sub_100019D60();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = NSStringFromSelector(v14);
      int v19 = 138412546;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ tried to call %@ but is not allowed to", (uint8_t *)&v19, 0x16u);
    }
  }
  [v8 invalidate];
LABEL_12:
}

- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = [(NSMutableDictionary *)self->_vouchersPerTaskIdentifier objectForKeyedSubscript:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    voucher_adopt();
    v9[2]();
  }
  else
  {
    v9[2]();
  }
}

- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self->_vouchersPerTaskIdentifier setObject:a3 forKeyedSubscript:a4];
  }
}

- (void)_dropVoucherForTaskWithIdentifier:(id)a3
{
}

- (id)displayableNameForLibraryManager:(id)a3
{
  return self->_name;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isLibraryManager
{
  return self->_isLibraryManager;
}

- (BOOL)isManagement
{
  return self->_isManagement;
}

- (CPLEngineWrapper)engineWrapper
{
  return self->_engineWrapper;
}

- (CPLDaemonLibraryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLDaemonLibraryManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_engineWrapper, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_protocolDescription, 0);
  objc_storeStrong((id *)&self->_allowedProtocol, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vouchersPerTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_forceSyncTasksPerIdentifier, 0);
  objc_storeStrong((id *)&self->_uploadTasksPerIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadTasksPerIdentifier, 0);
  objc_storeStrong((id *)&self->_platformManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end