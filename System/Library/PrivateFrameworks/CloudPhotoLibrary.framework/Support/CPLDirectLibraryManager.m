@interface CPLDirectLibraryManager
- (BOOL)_isManagementLibraryManager;
- (BOOL)_isValidScopeForClient:(id)a3 error:(id *)a4;
- (BOOL)_resetStore:(id)a3 reason:(id)a4 resetSelector:(SEL)a5 error:(id *)a6;
- (BOOL)isLibraryManagerForEngineLibrary:(id)a3;
- (CPLDirectLibraryManager)initWithAbstractObject:(id)a3;
- (CPLEngineLibrary)engineLibrary;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (id)_cloudResourcesToLocalResourcesWithLocalResources:(id)a3 targetMapping:(id)a4;
- (id)_localResourceFromCloudResources:(id)a3 usingMapping:(id)a4;
- (id)_localResourceFromCloudResourcesAndErrors:(id)a3 usingMapping:(id)a4;
- (id)configureEngineBeforeOpeningBlock;
- (id)displayableNameForEngineLibrary:(id)a3;
- (id)ownerNameForEngineLibrary:(id)a3;
- (id)safeResourcesToDeleteFromProposedResources:(id)a3 realPrune:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 allowUnconfirmed:(BOOL)a6 resourcesToCheckOnServer:(id *)a7 targetScopeMapping:(id)a8 unsafeResources:(id)a9;
- (void)_cleanupComputeStateDownloadQueue;
- (void)_deleteResources:(id)a3 dryRun:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 completionHandler:(id)a6;
- (void)_dispatchForceSyncForScopeIdentifiers:(id)a3 errors:(id)a4 completionHandler:(id)a5;
- (void)_endComputeStateDownload;
- (void)_fetchExistingSharedLibraryScopeWithProgress:(id)a3 blocker:(id)a4 completionHandler:(id)a5;
- (void)_fetchTransportScopeForScope:(id)a3 transportGroup:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)_startComputeStateDownload;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)checkServerForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (void)closeWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMainScopeWithCompletionHandler:(id)a3;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)enableMainScopeWithCompletionHandler:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)engineLibrary:(id)a3 didCloseWithError:(id)a4;
- (void)engineLibrary:(id)a3 didDownloadResourceInBackground:(id)a4;
- (void)engineLibrary:(id)a3 didFailBackgroundDownloadOfResource:(id)a4;
- (void)engineLibrary:(id)a3 didStartUploadTask:(id)a4;
- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 noteClientIsInForeground:(BOOL)a4;
- (void)engineLibrary:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6;
- (void)engineLibrary:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6;
- (void)engineLibrary:(id)a3 pushAllChangesWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 sizeOfResourcesToUploadDidChangeToSize:(unint64_t)a4 sizeOfOriginalResourcesToUpload:(unint64_t)a5 numberOfImages:(unint64_t)a6 numberOfVideos:(unint64_t)a7 numberOfOtherItems:(unint64_t)a8;
- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didFinishWithError:(id)a5;
- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didProgress:(float)a5;
- (void)engineLibraryHasChangesInPullQueue:(id)a3;
- (void)engineLibraryHasStatusChanges:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4;
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
- (void)markLibraryManagerAsInvalid;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)noteClientReceivedNotificationOfServerChanges;
- (void)openWithCompletionHandler:(id)a3;
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
- (void)setClientQueue:(id)a3;
- (void)setConfigureEngineBeforeOpeningBlock:(id)a3;
- (void)setEngineLibrary:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLDirectLibraryManager

- (CPLDirectLibraryManager)initWithAbstractObject:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CPLDirectLibraryManager;
  v3 = [(CPLDirectLibraryManager *)&v12 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.librarymanager.direct.client", v4);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v5;

    v7 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    disablingReasons = v3->_disablingReasons;
    v3->_disablingReasons = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    currentComputeStateDownloadTasks = v3->_currentComputeStateDownloadTasks;
    v3->_currentComputeStateDownloadTasks = v9;
  }
  return v3;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(CPLDirectLibraryManager *)self abstractObject];
  v6 = [v5 clientLibraryBaseURL];
  if (v6)
  {
    v7 = [v5 cloudLibraryStateStorageURL];
    if (v7)
    {
      v8 = [v5 cloudLibraryResourceStorageURL];
      if (v8)
      {
        v9 = [v5 libraryIdentifier];
        BOOL v10 = v9 != 0;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10014AEAC;
  v36[3] = &unk_100279870;
  v36[4] = self;
  BOOL v38 = v10;
  id v11 = v4;
  id v37 = v11;
  objc_super v12 = objc_retainBlock(v36);
  v13 = v12;
  if (self->_engineLibrary)
  {
    ((void (*)(void *))v12[2])(v12);
  }
  else if (v10)
  {
    self->_ownsLibrary = 1;
    id v27 = objc_alloc((Class)CPLEngineLibrary);
    v30 = [(CPLDirectLibraryManager *)self abstractObject];
    v32 = [v30 clientLibraryBaseURL];
    v29 = [(CPLDirectLibraryManager *)self abstractObject];
    v31 = [v29 cloudLibraryStateStorageURL];
    v28 = [(CPLDirectLibraryManager *)self abstractObject];
    v14 = [v28 cloudLibraryResourceStorageURL];
    v26 = [(CPLDirectLibraryManager *)self abstractObject];
    v15 = [v26 libraryIdentifier];
    v16 = [(CPLDirectLibraryManager *)self abstractObject];
    v17 = [v16 mainScopeIdentifier];
    v18 = [(CPLDirectLibraryManager *)self abstractObject];
    v19 = (CPLEngineLibrary *)objc_msgSend(v27, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:", v32, v31, v14, v15, v17, objc_msgSend(v18, "libraryOptions"));
    engineLibrary = self->_engineLibrary;
    self->_engineLibrary = v19;

    [(CPLEngineLibrary *)self->_engineLibrary setOwner:self];
    if (!_CPLSilentLogging)
    {
      v21 = sub_10014B004();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = self->_engineLibrary;
        *(_DWORD *)buf = 138412546;
        v40 = self;
        __int16 v41 = 2112;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@ will own %@", buf, 0x16u);
      }
    }
    configureEngineBeforeOpeningBlock = (void (**)(id, CPLEngineLibrary *))self->_configureEngineBeforeOpeningBlock;
    if (configureEngineBeforeOpeningBlock) {
      configureEngineBeforeOpeningBlock[2](configureEngineBeforeOpeningBlock, self->_engineLibrary);
    }
    v24 = self->_engineLibrary;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10014BEE4;
    v33[3] = &unk_10027D3D8;
    v33[4] = self;
    id v34 = v13;
    id v35 = v11;
    [(CPLEngineLibrary *)v24 openWithCompletionHandler:v33];
  }
  else
  {
    v25 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Library Manager has no Engine to manage"];
    (*((void (**)(id, void *, void, void, void, void))v11 + 2))(v11, v25, 0, 0, 0, 0);
  }
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  self->_closing = 1;
  dispatch_queue_t v5 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
  v6 = v5;
  if (self->_foregroundCalls)
  {
    [v5 noteClientIsInBackground];
    self->_foregroundCallsHaveBeenQuiet = 0;
    self->_foregroundCalls = 0;
  }
  if ([(NSCountedSet *)self->_disablingReasons count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v7 = self->_disablingReasons;
    id v8 = [(NSCountedSet *)v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 enableSynchronizationWithReason:*(void *)(*((void *)&v25 + 1) + 8 * (void)v11)];
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSCountedSet *)v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v9);
    }

    [(NSCountedSet *)self->_disablingReasons removeAllObjects];
  }
  if (self->_significantWorkCalls) {
    self->_significantWorkCalls = 0;
  }
  if (self->_disablingMinglingCount)
  {
    [v6 enableMingling];
    self->_disablingMinglingCount = 0;
  }
  clientQueue = self->_clientQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10014C3C0;
  v24[3] = &unk_100275EA0;
  v24[4] = self;
  v13 = v24;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v30 = v13;
  v14 = clientQueue;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v15);

  engineLibrary = self->_engineLibrary;
  if (self->_ownsLibrary)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10014C464;
    v22[3] = &unk_1002766A8;
    v17 = &v23;
    v22[4] = self;
    id v23 = v4;
    id v18 = v4;
    [(CPLEngineLibrary *)engineLibrary closeAndDeactivate:0 completionHandler:v22];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10014C748;
    v20[3] = &unk_1002766A8;
    v17 = &v21;
    v20[4] = self;
    id v21 = v4;
    id v19 = v4;
    [(CPLEngineLibrary *)engineLibrary detachObject:self withCompletionHandler:v20];
  }
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10014CAC0;
  v13[3] = &unk_100275EA0;
  v13[4] = self;
  v6 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v15 = v6;
  v7 = clientQueue;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

  engineLibrary = self->_engineLibrary;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014CB48;
  v11[3] = &unk_100276D38;
  id v12 = v4;
  id v10 = v4;
  [(CPLEngineLibrary *)engineLibrary closeAndDeactivate:1 completionHandler:v11];
}

- (BOOL)_isManagementLibraryManager
{
  v2 = [(CPLDirectLibraryManager *)self abstractObject];
  v3 = [v2 delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 isManagementLibraryManager:v2];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014CD80;
  v7[3] = &unk_10027D450;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 blockWriteTransactionsWithCompletionHandler:v7];
}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014D1C8;
  v7[3] = &unk_10027D450;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 blockWriteTransactionsWithCompletionHandler:v7];
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLDirectLibraryManager *)self abstractObject];
  id v9 = [v8 mainScopeIdentifier];
  unsigned int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    [(CPLDirectLibraryManager *)self enableMainScopeWithCompletionHandler:v7];
  }
  else
  {
    [(CPLEngineLibrary *)self->_engineLibrary store];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10014D67C;
    v12[3] = &unk_10027D4A0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    id v11 = v13;
    [v11 blockWriteTransactionsWithCompletionHandler:v12];
  }
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLDirectLibraryManager *)self abstractObject];
  id v9 = [v8 mainScopeIdentifier];
  unsigned int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    [(CPLDirectLibraryManager *)self disableMainScopeWithCompletionHandler:v7];
  }
  else
  {
    [(CPLEngineLibrary *)self->_engineLibrary store];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10014DD70;
    v12[3] = &unk_10027D4A0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    id v11 = v13;
    [v11 blockWriteTransactionsWithCompletionHandler:v12];
  }
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLEngineLibrary *)self->_engineLibrary store];
  [v8 scopes];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014E444;
  v15[3] = &unk_100276590;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10014E5B0;
  v13[3] = &unk_10027D518;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v16;
  id v12 = [v8 performWriteTransactionWithBlock:v15 completionHandler:v13];
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 copy];
  if (!v13)
  {
    id v13 = +[CPLResourceTransferTaskOptions defaultOptions];
  }
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10014E7D8;
  v25[3] = &unk_10027D5E0;
  v25[4] = self;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v17;
  id v27 = v16;
  id v28 = v12;
  id v18 = v13;
  id v29 = v18;
  id v30 = v14;
  id v31 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v12;
  id v22 = v16;
  id v23 = objc_retainBlock(v25);
  if ([v18 isHighPriority]) {
    id v24 = [v17 performWriteTransactionWithBlock:v23 completionHandler:&stru_10027D620];
  }
  else {
    [v17 performBatchedWriteTransactionWithBlock:v23 completionHandler:&stru_10027D640];
  }
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (a4 - 2 > 2) {
    goto LABEL_4;
  }
  [(CPLDirectLibraryManager *)self engineLibrary];
  v49 = self;
  unint64_t v19 = a4;
  id v20 = a6;
  id v21 = a2;
  id v22 = v18;
  v24 = id v23 = v16;
  [v24 systemMonitor];
  id v25 = v15;
  id v27 = v26 = v17;
  unsigned int v28 = [v27 isNetworkConstrained];

  id v17 = v26;
  id v15 = v25;

  id v16 = v23;
  id v18 = v22;
  a2 = v21;
  a6 = v20;
  a4 = v19;
  self = v49;
  if (v28)
  {
    clientQueue = v49->_clientQueue;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10014F6E4;
    v64[3] = &unk_100275DF8;
    id v65 = v18;
    id v30 = v64;
    block = _NSConcreteStackBlock;
    uint64_t v67 = 3221225472;
    v68 = sub_10016C96C;
    v69 = &unk_100275DF8;
    id v70 = v30;
    id v31 = clientQueue;
    dispatch_block_t v32 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v31, v32);

    id v33 = v65;
  }
  else
  {
LABEL_4:
    id v34 = [v15 itemScopedIdentifier];

    if (v34)
    {
      id v35 = objc_opt_class();
      +[NSProgress progressWithTotalUnitCount:1];
      id v37 = v36 = v16;
      block = _NSConcreteStackBlock;
      uint64_t v67 = 3221225472;
      v68 = sub_10016C9B8;
      v69 = &unk_10027E948;
      id v70 = v35;
      SEL v71 = a2;
      [v37 setCancellationHandler:&block];
      BOOL v38 = [(CPLEngineLibrary *)self->_engineLibrary store];
      v39 = [v38 downloadQueue];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10014F764;
      v52[3] = &unk_10027D6B8;
      v52[4] = self;
      id v59 = v18;
      id v53 = v37;
      id v54 = v15;
      id v55 = v38;
      id v56 = v39;
      unint64_t v60 = a4;
      id v57 = v36;
      long long v40 = *(_OWORD *)&a6->var0.var3;
      long long v61 = *(_OWORD *)&a6->var0.var0;
      long long v62 = v40;
      long long v63 = *(_OWORD *)&a6->var1.var1;
      id v58 = v17;
      id v41 = v39;
      id v42 = v38;
      id v43 = v37;
      id v16 = v36;
      id v33 = v43;
      id v44 = [v42 performReadTransactionWithBlock:v52];
    }
    else
    {
      v45 = self->_clientQueue;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10014FFF0;
      v50[3] = &unk_100275DF8;
      id v51 = v18;
      v46 = v50;
      block = _NSConcreteStackBlock;
      uint64_t v67 = 3221225472;
      v68 = sub_10016C96C;
      v69 = &unk_100275DF8;
      id v70 = v46;
      v47 = v45;
      dispatch_block_t v48 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v47, v48);

      id v33 = v51;
    }
  }
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = objc_opt_class();
  id v11 = +[NSProgress progressWithTotalUnitCount:1];
  block = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_10016C9B8;
  id v26 = &unk_10027E948;
  id v27 = v10;
  SEL v28 = a2;
  [v11 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100150230;
  v18[3] = &unk_10027D730;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  id v19 = v11;
  id v20 = v9;
  v18[4] = self;
  id v13 = v18;
  block = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_10016C96C;
  id v26 = &unk_100275DF8;
  id v27 = v13;
  id v14 = clientQueue;
  id v15 = v11;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v17);
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CPLEngineLibrary *)self->_engineLibrary store];
  [v11 downloadQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001507F0;
  v18[3] = &unk_10027D870;
  v18[4] = self;
  id v19 = v8;
  id v20 = v11;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v9;
  id v23 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v21;
  id v15 = v11;
  id v16 = v8;
  id v17 = [v15 performReadTransactionWithBlock:v18];
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLEngineLibrary *)self->_engineLibrary store];
  [v8 idMapping];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001515AC;
  v17[3] = &unk_10027D478;
  id v18 = v6;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100151788;
  v14[3] = &unk_10027D8C0;
  id v15 = v20;
  id v16 = v7;
  id v9 = v20;
  id v10 = v7;
  id v11 = v19;
  id v12 = v6;
  id v13 = [v8 performWriteTransactionWithBlock:v17 completionHandler:v14];
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CPLEngineLibrary *)self->_engineLibrary store];
  [v10 idMapping];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100151944;
  v15[3] = &unk_10027D8E8;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v9;
  BOOL v19 = a4;
  id v16 = v8;
  id v11 = v17;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v10 performReadTransactionWithBlock:v15];
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!CPLIsInTestReadonlyMode())
  {
    if ([v7 scopeType] == (id)4 && (CPLIsSharedLibraryFeatureEnabled() & 1) == 0)
    {
      CFStringRef v13 = @"Shared Library is not enabled on this device";
    }
    else
    {
      if ([v7 scopeType] != (id)2
        || (+[CPLFingerprintScheme supportsEPP] & 1) != 0
        || ![v7 hasEPPAssets])
      {
        id v14 = objc_opt_class();
        id v15 = +[NSProgress progressWithTotalUnitCount:1];
        block = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472;
        dispatch_block_t v32 = sub_10016C9B8;
        id v33 = &unk_10027E948;
        id v34 = v14;
        SEL v35 = a2;
        [v15 setCancellationHandler:&block];
        id v16 = [(CPLDirectLibraryManager *)self engineLibrary];
        id v17 = [v16 store];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100151E94;
        v21[3] = &unk_10027DA78;
        id v26 = v8;
        id v22 = v15;
        id v23 = self;
        SEL v27 = a2;
        id v24 = v7;
        id v25 = v17;
        id v18 = v17;
        id v19 = v15;
        [v18 blockWriteTransactionsWithCompletionHandler:v21];

        goto LABEL_12;
      }
      CFStringRef v13 = @"EPP CMM is not enabled on this device";
    }
    id v20 = +[CPLErrors cplErrorWithCode:1002 description:v13];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v20);

    goto LABEL_12;
  }
  clientQueue = self->_clientQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100151E18;
  v28[3] = &unk_100275DF8;
  id v29 = v8;
  id v10 = v28;
  block = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  dispatch_block_t v32 = sub_10016C96C;
  id v33 = &unk_100275DF8;
  id v34 = v10;
  id v11 = clientQueue;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v12);

LABEL_12:
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100153194;
    v28[3] = &unk_100275DF8;
    id v29 = v8;
    id v10 = v28;
    block = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    dispatch_block_t v32 = sub_10016C96C;
    id v33 = &unk_100275DF8;
    id v34 = v10;
    id v11 = v8;
    dispatch_block_t v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v29;
  }
  else
  {
    id v15 = objc_opt_class();
    id v16 = +[NSProgress progressWithTotalUnitCount:1];
    block = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    dispatch_block_t v32 = sub_10016C9B8;
    id v33 = &unk_10027E948;
    id v34 = v15;
    SEL v35 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v18 = [v17 store];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100153210;
    v21[3] = &unk_10027DA78;
    id v26 = v8;
    id v22 = v16;
    id v23 = v18;
    id v24 = v7;
    id v25 = self;
    SEL v27 = a2;
    id v19 = v18;
    id v14 = v16;
    id v20 = v8;
    [v19 blockWriteTransactionsWithCompletionHandler:v21];
  }
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100154354;
    v27[3] = &unk_100275DF8;
    id v28 = v9;
    id v11 = v27;
    block = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_10016C96C;
    dispatch_block_t v32 = &unk_100275DF8;
    id v33 = v11;
    id v12 = v9;
    dispatch_block_t v13 = clientQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v13, v14);

    id v15 = v28;
  }
  else
  {
    id v16 = +[NSProgress progressWithTotalUnitCount:1];
    id v17 = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001543CC;
    v22[3] = &unk_10027DB90;
    v22[4] = self;
    id v25 = v9;
    BOOL v26 = a4;
    id v23 = v8;
    id v24 = v16;
    id v18 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_10016C96C;
    dispatch_block_t v32 = &unk_100275DF8;
    id v33 = v18;
    id v19 = v17;
    id v15 = v16;
    id v20 = v9;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v19, v21);
  }
}

- (void)_fetchTransportScopeForScope:(id)a3 transportGroup:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_block_t v14 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v15 = [v14 transport];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100154EE4;
  v21[3] = &unk_10027DBB8;
  id v22 = v10;
  id v16 = v10;
  id v17 = [v15 fetchTransportScopeForScope:v13 transportScope:0 completionHandler:v21];

  [v17 setTransportGroup:v12];
  [v17 setShouldCreateScopeIfNecessary:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100154EF8;
  v19[3] = &unk_100276018;
  v19[4] = self;
  id v20 = v17;
  id v18 = v17;
  [v11 performAsCurrentWithPendingUnitCount:1 usingBlock:v19];
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001551EC;
    v29[3] = &unk_100275DF8;
    id v30 = v8;
    id v10 = v29;
    block = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    id v33 = sub_10016C96C;
    id v34 = &unk_100275DF8;
    id v35 = v10;
    id v11 = v8;
    id v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v30;
  }
  else
  {
    id v15 = objc_opt_class();
    id v16 = +[NSProgress progressWithTotalUnitCount:1];
    block = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    id v33 = sub_10016C9B8;
    id v34 = &unk_10027E948;
    id v35 = v15;
    SEL v36 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v18 = [v17 store];

    id v19 = [(CPLDirectLibraryManager *)self engineLibrary];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100155268;
    v22[3] = &unk_10027DD10;
    id v27 = v8;
    id v23 = v16;
    id v24 = v18;
    id v25 = v7;
    BOOL v26 = self;
    SEL v28 = a2;
    id v20 = v18;
    id v14 = v16;
    id v21 = v8;
    [v19 blockEngineWithReason:@"Refreshing scope" onlyIfBlocked:0 block:v22];
  }
}

- (BOOL)_isValidScopeForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (((unint64_t)[v6 scopeType] & 0xFFFFFFFFFFFFFFFELL) != 4) {
    goto LABEL_4;
  }
  id v7 = [(CPLDirectLibraryManager *)self engineLibrary];
  unsigned __int8 v8 = [v7 libraryOptions];

  if ((v8 & 2) != 0) {
    goto LABEL_4;
  }
  id v9 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v10 = [v9 store];
  id v11 = [v6 scopeIdentifier];
  unsigned __int8 v12 = [v10 mainScopeSupportsSharingScopeWithIdentifier:v11];

  if (v12)
  {
LABEL_4:
    BOOL v13 = 1;
  }
  else
  {
    id v15 = [v6 scopeIdentifier];
    id v16 = +[CPLErrors cplErrorWithCode:2001, @"%@ is not a valid scope for this engine", v15 description];

    if (a4) {
      *a4 = v16;
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100156B78;
    v26[3] = &unk_100275DF8;
    id v27 = v8;
    id v10 = v26;
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    id v30 = sub_10016C96C;
    uint64_t v31 = &unk_100275DF8;
    id v32 = v10;
    id v11 = v8;
    unsigned __int8 v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v27;
  }
  else
  {
    id v15 = objc_opt_class();
    id v16 = +[NSProgress progressWithTotalUnitCount:1];
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    id v30 = sub_10016C9B8;
    uint64_t v31 = &unk_10027E948;
    id v32 = v15;
    SEL v33 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100156BF4;
    v22[3] = &unk_100277060;
    id v25 = v8;
    void v22[4] = self;
    id v23 = v16;
    id v24 = v7;
    id v18 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    id v30 = sub_10016C96C;
    uint64_t v31 = &unk_100275DF8;
    id v32 = v18;
    id v19 = v17;
    id v14 = v16;
    id v20 = v8;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v19, v21);
  }
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!CPLIsInTestReadonlyMode())
  {
    if ([v7 scopeType] == (id)5 && (CPLIsSharedLibraryFeatureEnabled() & 1) == 0)
    {
      id v14 = +[CPLErrors cplErrorWithCode:1002 description:@"Shared Library is not enabled on this device"];
    }
    else
    {
      id v26 = 0;
      unsigned __int8 v13 = [(CPLDirectLibraryManager *)self _isValidScopeForClient:v7 error:&v26];
      id v14 = v26;
      if (v13)
      {
        id v15 = objc_opt_class();
        id v16 = +[NSProgress progressWithTotalUnitCount:1];
        block = _NSConcreteStackBlock;
        uint64_t v30 = 3221225472;
        uint64_t v31 = sub_10016C9B8;
        id v32 = &unk_10027E948;
        id v33 = v15;
        SEL v34 = a2;
        [v16 setCancellationHandler:&block];
        id v17 = [(CPLDirectLibraryManager *)self engineLibrary];
        id v18 = [v17 store];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10015799C;
        v21[3] = &unk_10027DEC8;
        void v21[4] = self;
        id v25 = v8;
        id v22 = v16;
        id v23 = v7;
        id v24 = v18;
        id v19 = v18;
        id v20 = v16;
        [v19 blockWriteTransactionsWithCompletionHandler:v21];

LABEL_9:
        goto LABEL_10;
      }
    }
    (*((void (**)(id, id))v8 + 2))(v8, v14);
    goto LABEL_9;
  }
  clientQueue = self->_clientQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100157924;
  v27[3] = &unk_100275DF8;
  id v28 = v8;
  id v10 = v27;
  block = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10016C96C;
  id v32 = &unk_100275DF8;
  id v33 = v10;
  id v11 = clientQueue;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v12);

LABEL_10:
}

- (void)_fetchExistingSharedLibraryScopeWithProgress:(id)a3 blocker:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(CPLDirectLibraryManager *)self engineLibrary];
  dispatch_block_t v12 = [v11 transport];

  unsigned __int8 v13 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v14 = [v13 store];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001588EC;
  v21[3] = &unk_10027DEF0;
  id v22 = v14;
  id v23 = v8;
  id v24 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v14;
  [v12 fetchExistingSharedLibraryScopeTaskWithCompletionHandler:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100158E34;
  v19[3] = &unk_100276018;
  v19[4] = self;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v20;
  [v10 performAsCurrentWithPendingUnitCount:1 usingBlock:v19];
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001590DC;
    v22[3] = &unk_100275DF8;
    id v23 = v5;
    id v7 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    id v26 = sub_10016C96C;
    id v27 = &unk_100275DF8;
    id v28 = v7;
    id v8 = v5;
    id v9 = clientQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v9, v10);

    id v11 = v23;
  }
  else
  {
    dispatch_block_t v12 = objc_opt_class();
    unsigned __int8 v13 = +[NSProgress progressWithTotalUnitCount:1];
    block = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    id v26 = sub_10016C9B8;
    id v27 = &unk_10027E948;
    id v28 = v12;
    SEL v29 = a2;
    [v13 setCancellationHandler:&block];
    id v14 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v15 = [v14 store];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100159158;
    v18[3] = &unk_10027DF68;
    v18[4] = self;
    id v19 = v13;
    id v20 = v15;
    id v21 = v5;
    id v16 = v15;
    id v11 = v13;
    id v17 = v5;
    [v16 blockWriteTransactionsWithCompletionHandler:v18];
  }
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100159B9C;
    v30[3] = &unk_100275DF8;
    id v31 = v11;
    unsigned __int8 v13 = v30;
    block = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    SEL v34 = sub_10016C96C;
    id v35 = &unk_100275DF8;
    id v36 = v13;
    id v14 = v11;
    id v15 = clientQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v15, v16);

    id v17 = v31;
  }
  else
  {
    id v18 = +[NSProgress progressWithTotalUnitCount:1];
    id v19 = self->_clientQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100159C18;
    v24[3] = &unk_10027E080;
    v24[4] = self;
    id v27 = v11;
    int64_t v28 = a4;
    int64_t v29 = a5;
    id v25 = v10;
    id v26 = v18;
    id v20 = v24;
    block = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    SEL v34 = sub_10016C96C;
    id v35 = &unk_100275DF8;
    id v36 = v20;
    id v21 = v19;
    id v17 = v18;
    id v22 = v11;
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v21, v23);
  }
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10015AD54;
    v34[3] = &unk_100275DF8;
    id v35 = v14;
    dispatch_block_t v16 = v34;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    BOOL v38 = sub_10016C96C;
    v39 = &unk_100275DF8;
    id v40 = v16;
    id v17 = v14;
    id v18 = clientQueue;
    dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v18, v19);

    id v20 = v35;
  }
  else
  {
    id v21 = +[NSProgress progressWithTotalUnitCount:1];
    id v22 = self->_clientQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10015ADD0;
    v27[3] = &unk_10027E148;
    void v27[4] = self;
    id v31 = v14;
    id v28 = v13;
    int64_t v32 = a5;
    int64_t v33 = a6;
    id v29 = v12;
    id v30 = v21;
    dispatch_block_t v23 = v27;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    BOOL v38 = sub_10016C96C;
    v39 = &unk_100275DF8;
    id v40 = v23;
    id v24 = v22;
    id v20 = v21;
    id v25 = v14;
    dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v24, v26);
  }
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 < 0x1F5)
  {
    dispatch_block_t v16 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v17 = [v16 store];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10015CB28;
    v19[3] = &unk_10027E170;
    id v23 = v10;
    id v20 = v17;
    id v21 = v8;
    id v22 = self;
    unint64_t v24 = a4;
    id v15 = v17;
    id v18 = [v15 performReadTransactionWithBlock:v19];
  }
  else
  {
    clientQueue = self->_clientQueue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10015CAB8;
    v25[3] = &unk_100275DF8;
    id v26 = v9;
    id v12 = v25;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C96C;
    block[3] = &unk_100275DF8;
    id v28 = v12;
    id v13 = clientQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v13, v14);

    id v15 = v26;
  }
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = +[NSProgress progressWithTotalUnitCount:1];
  block = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  dispatch_block_t v19 = sub_10016C9B8;
  id v20 = &unk_10027E948;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015D4FC;
  v14[3] = &unk_100276AC8;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  id v9 = v14;
  block = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  dispatch_block_t v19 = sub_10016C96C;
  id v20 = &unk_100275DF8;
  id v21 = v9;
  id v10 = clientQueue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = +[NSProgress progressWithTotalUnitCount:1];
  block = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  unint64_t v24 = sub_10016C9B8;
  id v25 = &unk_10027E948;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10015DA34;
  v18[3] = &unk_100278C08;
  v18[4] = self;
  id v19 = v7;
  id v20 = v10;
  id v21 = v8;
  id v12 = v18;
  block = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  unint64_t v24 = sub_10016C96C;
  id v25 = &unk_100275DF8;
  id v26 = v12;
  dispatch_block_t v13 = clientQueue;
  id v14 = v10;
  id v15 = v8;
  id v16 = v7;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

- (void)_dispatchForceSyncForScopeIdentifiers:(id)a3 errors:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10015DF24;
  v18[3] = &unk_100277060;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v12 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v24 = v12;
  dispatch_block_t v13 = clientQueue;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLEngineLibrary *)self->_engineLibrary store];
  id v9 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015E108;
  v13[3] = &unk_10027E260;
  id v14 = v8;
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v9 getCurrentRequiredStateWithCompletionHandler:v13];
}

- (void)resetStatus
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_10014B004();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = NSStringFromSelector(a2);
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@ is not implemented", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)startSyncSession
{
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t foregroundCalls = self->_foregroundCalls;
  self->_unint64_t foregroundCalls = foregroundCalls + 1;
  if (foregroundCalls)
  {
    if (self->_foregroundCallsHaveBeenQuiet && !a3)
    {
      self->_foregroundCallsHaveBeenQuiet = 0;
      id v7 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
      [v7 noteClientIsInForegroundQuietly:0];
      [v7 noteClientIsInBackground];
    }
  }
  else
  {
    id v6 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
    [v6 noteClientIsInForegroundQuietly:v3];

    self->_foregroundCallsHaveBeenQuiet = v3;
  }
}

- (void)noteClientIsInBackground
{
  unint64_t foregroundCalls = self->_foregroundCalls;
  if (foregroundCalls)
  {
    unint64_t v4 = foregroundCalls - 1;
    self->_unint64_t foregroundCalls = v4;
    if (!v4)
    {
      int v5 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
      [v5 noteClientIsInBackground];

      self->_foregroundCallsHaveBeenQuiet = 0;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v7 = sub_10014B004();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(a2);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ called too many times", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)noteClientReceivedNotificationOfServerChanges
{
  if (!_CPLSilentLogging)
  {
    BOOL v3 = sub_10014B004();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Received notification of server changes from client", v5, 2u);
    }
  }
  unint64_t v4 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
  [v4 noteServerHasChanges];
}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  [(NSCountedSet *)self->_disablingReasons addObject:v5];
  if ((id)[(NSCountedSet *)self->_disablingReasons countForObject:v5] == (id)1)
  {
    unint64_t v4 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
    [v4 disableSynchronizationWithReason:v5];
  }
}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  if ([(NSCountedSet *)self->_disablingReasons countForObject:v5])
  {
    [(NSCountedSet *)self->_disablingReasons removeObject:v5];
    if (![(NSCountedSet *)self->_disablingReasons countForObject:v5])
    {
      id v6 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
      [v6 enableSynchronizationWithReason:v5];
LABEL_7:
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v6 = sub_10014B004();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromSelector(a2);
      int v8 = 138412546;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ has been called too many times with reason '%@'", (uint8_t *)&v8, 0x16u);
    }
    goto LABEL_7;
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_10014B004();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Getting system budgets", v7, 2u);
    }
  }
  id v6 = [(CPLEngineLibrary *)self->_engineLibrary transport];
  [v6 getSystemBudgetsWithCompletionHandler:v4];
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(CPLEngineLibrary *)self->_engineLibrary systemMonitor];
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10014B004();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        CFStringRef v8 = @"start overriding";
      }
      else {
        CFStringRef v8 = @"stop overriding";
      }
      int v9 = [(id)objc_opt_class() descriptionForBudgets:a4];
      int v10 = 138412546;
      CFStringRef v11 = v8;
      __int16 v12 = 2112;
      dispatch_block_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client asked to %@ system budgets %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v5) {
    [v6 startOverridingSystemBudgetsForClient:a4];
  }
  else {
    [v6 stopOverridingSystemBudgetsForClient:a4];
  }
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
  unint64_t significantWorkCalls = self->_significantWorkCalls;
  if (significantWorkCalls)
  {
    self->_unint64_t significantWorkCalls = significantWorkCalls - 1;
  }
  else if (!_CPLSilentLogging)
  {
    id v4 = sub_10014B004();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = NSStringFromSelector(a2);
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@ called too many times", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)disableMingling
{
  unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  if (!disablingMinglingCount)
  {
    id v4 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
    [v4 disableMingling];

    unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  }
  self->_unint64_t disablingMinglingCount = disablingMinglingCount + 1;
}

- (void)enableMingling
{
  unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  if (disablingMinglingCount)
  {
    unint64_t v3 = disablingMinglingCount - 1;
    self->_unint64_t disablingMinglingCount = v3;
    if (!v3)
    {
      id v7 = [(CPLEngineLibrary *)self->_engineLibrary scheduler];
      [v7 enableMingling];
    }
  }
  else if (!_CPLSilentLogging)
  {
    BOOL v5 = sub_10014B004();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      int v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
    }
  }
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLDirectLibraryManager *)self engineLibrary];
  int v6 = [v5 store];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015F72C;
  v10[3] = &unk_10027DE50;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = [v6 performReadTransactionWithBlock:v10];
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v9 = [v8 store];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015F8B0;
  v14[3] = &unk_10027E288;
  id v15 = v9;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v13 = [v12 performReadTransactionWithBlock:v14];
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v6 = [v5 store];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015FAF8;
  v10[3] = &unk_10027D428;
  id v12 = self;
  id v13 = v4;
  id v11 = v6;
  id v7 = v4;
  id v8 = v6;
  id v9 = [v8 performReadTransactionWithBlock:v10];
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v6 = [v5 store];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10015FD94;
  v12[3] = &unk_100276590;
  id v13 = v6;
  id v14 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015FE8C;
  v10[3] = &unk_1002773D8;
  id v11 = v14;
  id v7 = v14;
  id v8 = v6;
  id v9 = [v8 performWriteTransactionWithBlock:v12 completionHandler:v10];
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v8 = [v7 store];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001600C8;
  v14[3] = &unk_10027E2D8;
  id v15 = v8;
  id v16 = v6;
  BOOL v17 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001602C8;
  v12[3] = &unk_1002773D8;
  id v13 = v16;
  id v9 = v16;
  id v10 = v8;
  id v11 = [v10 performWriteTransactionWithBlock:v14 completionHandler:v12];
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v9 = [v8 store];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001604E8;
  v14[3] = &unk_10027E300;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v10 = v6;
  id v11 = v9;
  id v12 = v7;
  id v13 = [v11 performReadTransactionWithBlock:v14];
}

- (id)_cloudResourcesToLocalResourcesWithLocalResources:(id)a3 targetMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = [(CPLDirectLibraryManager *)self engineLibrary];
  id v10 = [v9 store];

  [v10 cloudCache];
  v26 = id v25 = v10;
  id v11 = [v10 idMapping];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        char v27 = 0;
        id v18 = [v17 itemScopedIdentifier];
        id v19 = [v11 cloudScopedIdentifierForLocalScopedIdentifier:v18 isFinal:&v27];

        if (!v19)
        {
          id v20 = [v17 itemScopedIdentifier];
          id v19 = [v20 copy];
        }
        id v21 = [v7 targetForRecordWithScopedIdentifier:v19];

        if (!v21)
        {
          id v22 = [v26 targetForRecordWithCloudScopedIdentifier:v19];
          [v7 setTarget:v22 forRecordWithScopedIdentifier:v19];
        }
        id v23 = [v17 copy];
        [v23 setItemScopedIdentifier:v19];
        [v8 setObject:v17 forKeyedSubscript:v23];
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  return v8;
}

- (id)_localResourceFromCloudResources:(id)a3 usingMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if (v13) {
            [v7 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)_localResourceFromCloudResourcesAndErrors:(id)a3 usingMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100160E34;
    v12[3] = &unk_10027E328;
    id v13 = v6;
    id v8 = v7;
    id v14 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    id v9 = v14;
    id v10 = v8;
  }
  else
  {
    id v10 = &__NSDictionary0__struct;
  }

  return v10;
}

- (void)checkServerForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(CPLDirectLibraryManager *)self engineLibrary];
  long long v15 = [v14 transport];
  long long v16 = [v10 allKeys];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100161018;
  v21[3] = &unk_10027E350;
  id v22 = v10;
  id v23 = v11;
  void v21[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = [v15 resourceCheckTaskForResources:v16 targetMapping:v13 transportScopeMapping:v12 completionHandler:v21];

  id v20 = [v14 syncManager];
  [v20 configureDirectTransportTask:v19];

  [v19 runWithNoSyncSession];
}

- (id)safeResourcesToDeleteFromProposedResources:(id)a3 realPrune:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 allowUnconfirmed:(BOOL)a6 resourcesToCheckOnServer:(id *)a7 targetScopeMapping:(id)a8 unsafeResources:(id)a9
{
  BOOL v85 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  id v16 = a9;
  id v89 = objc_alloc_init((Class)NSMutableArray);
  id v97 = objc_alloc_init((Class)NSMutableArray);
  id v17 = [(CPLEngineLibrary *)self->_engineLibrary store];
  v100 = [v17 scopes];
  v88 = [v17 cloudCache];
  v102 = [v17 outgoingResources];
  v94 = [v17 idMapping];
  v87 = v17;
  id v18 = [v17 resourceStorage];
  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  id v92 = objc_alloc_init((Class)NSMutableDictionary);
  id v86 = objc_alloc_init((Class)NSMutableSet);
  id v96 = objc_alloc_init((Class)NSMutableDictionary);
  id v98 = objc_alloc_init((Class)NSMutableSet);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_100162030;
  v113[3] = &unk_10027E378;
  id v81 = v18;
  id v114 = v81;
  BOOL v116 = a4;
  id v82 = v16;
  id v115 = v82;
  id v19 = objc_retainBlock(v113);
  BOOL v84 = v11;
  v83 = a7;
  if (v11)
  {
    if (qword_1002DBCC0 != -1) {
      dispatch_once(&qword_1002DBCC0, &stru_10027E968);
    }
    BOOL v103 = byte_1002DBCC8 != 0;
  }
  else
  {
    BOOL v103 = 0;
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v14;
  id v105 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
  if (v105)
  {
    uint64_t v104 = *(void *)v110;
    id v93 = v15;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v110 != v104) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v20);
        id v22 = [v21 itemScopedIdentifier];
        if (!v22)
        {
          if (_CPLSilentLogging)
          {
            id v24 = @"resource has no item identifier";
            uint64_t v25 = 50;
          }
          else
          {
            id v23 = sub_10014B004();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v118 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Client is asking to delete a resource with no item identifier: %@", buf, 0xCu);
            }
            id v24 = @"resource has no item identifier";
            uint64_t v25 = 50;
LABEL_21:
          }
          goto LABEL_22;
        }
        if ([v102 shouldUploadResource:v21])
        {
          if (!_CPLSilentLogging)
          {
            id v23 = sub_10014B004();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v118 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but that resource is still in transit for upload", buf, 0xCu);
            }
            id v24 = @"resource has not been uploaded yet";
            uint64_t v25 = 27;
            goto LABEL_21;
          }
          id v24 = @"resource has not been uploaded yet";
          uint64_t v25 = 27;
LABEL_22:
          if (!v103) {
            goto LABEL_112;
          }
          goto LABEL_23;
        }
        long long v30 = [v22 scopeIdentifier];
        if ([v98 containsObject:v30]) {
          goto LABEL_26;
        }
        id v24 = [v96 objectForKeyedSubscript:v30];
        if (!v24)
        {
          id v36 = [v100 scopeWithIdentifier:v30];
          if (v36)
          {
            uint64_t v37 = [v100 flagsForScope:v36];
            id v24 = @"scope has been deleted";
            if (([v37 valueForFlag:4] & 1) == 0)
            {
              id v24 = @"scope has been disabled";
              if (([v37 valueForFlag:8] & 1) == 0)
              {
                id v24 = @"scope is inactive";
                if (![v37 valueForFlag:16])
                {

                  [v98 addObject:v30];
LABEL_26:
                  char v108 = 0;
                  uint64_t v31 = [v94 cloudScopedIdentifierForLocalScopedIdentifier:v22 isFinal:&v108];
                  v99 = (void *)v31;
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    uint64_t v33 = [v92 objectForKey:v31];
                    if (v33)
                    {
                      SEL v34 = v33;
                      id v35 = +[NSNull null];

                      if (v34 == v35)
                      {

                        goto LABEL_71;
                      }
LABEL_42:
                      uint64_t v39 = [v90 objectForKey:v22];
                      if (!v39)
                      {
                        id v42 = [v87 transactionClientCacheView];
                        id v43 = [v42 recordViewWithScopedIdentifier:v22];
                        id v40 = [v43 changeForType:8];

                        if (!v40)
                        {
                          id v40 = +[NSNull null];
                          [v90 setObject:v40 forKey:v22];
                          goto LABEL_83;
                        }
                        if ([v40 supportsResources])
                        {
                          [v90 setObject:v40 forKey:v22];
                          goto LABEL_48;
                        }
                        if (!_CPLSilentLogging)
                        {
                          id v59 = sub_10014B004();
                          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                          {
                            unint64_t v60 = objc_opt_class();
                            *(_DWORD *)buf = 138412546;
                            v118 = v60;
                            __int16 v119 = 2112;
                            v120 = v21;
                            id v61 = v60;
                            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Client is asking to delete a resource for a record that does not support resources (%@): %@", buf, 0x16u);
                          }
                        }
                        long long v62 = +[NSNull null];
                        [v90 setObject:v62 forKey:v22];

LABEL_83:
                        v91 = 0;
                        goto LABEL_84;
                      }
                      id v40 = (void *)v39;
                      id v41 = +[NSNull null];

                      if (v40 == v41) {
                        goto LABEL_83;
                      }
LABEL_48:
                      v91 = v40;
                      v95 = objc_msgSend(v40, "resourceForType:", objc_msgSend(v21, "resourceType"));
                      id v44 = [v95 identity];
                      uint64_t v45 = [v44 fingerPrint];

                      v46 = [v21 identity];
                      uint64_t v47 = [v46 fingerPrint];

                      if (!v45 || !v47)
                      {

                        if (!(v45 | v47)) {
                          goto LABEL_61;
                        }
LABEL_64:
                        if (!_CPLSilentLogging)
                        {
                          id v55 = sub_10014B004();
                          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            v118 = v21;
                            __int16 v119 = 2112;
                            v120 = v95;
                            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but it does not match the client cache: %@", buf, 0x16u);
                          }
                        }
                        goto LABEL_68;
                      }
                      unsigned __int8 v48 = [(id)v45 isEqual:v47];

                      if ((v48 & 1) == 0) {
                        goto LABEL_64;
                      }
LABEL_61:
                      v50 = [v95 identity];
                      uint64_t v51 = [v50 fileUTI];

                      v52 = [v21 identity];
                      uint64_t v53 = [v52 fileUTI];

                      if (v51 && v53)
                      {
                        unsigned __int8 v54 = [(id)v51 isEqual:v53];

                        if ((v54 & 1) == 0) {
                          goto LABEL_64;
                        }
                      }
                      else
                      {

                        if (v51 | v53) {
                          goto LABEL_64;
                        }
                      }
                      id v40 = v95;
LABEL_84:

                      if ([v34 serverRecordIsCorrupted])
                      {
                        if (_CPLSilentLogging)
                        {
                          int v56 = 0;
                          id v24 = @"record's resources is corrupted";
                          uint64_t v25 = 31;
                          int v58 = v103;
                        }
                        else
                        {
                          long long v63 = sub_10014B004();
                          v95 = v63;
                          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            v118 = v21;
                            __int16 v119 = 2112;
                            v120 = v34;
                            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but we determined %@ is incoherent on server", buf, 0x16u);
                          }
                          int v56 = 0;
                          id v24 = @"record's resources is corrupted";
                          uint64_t v25 = 31;
LABEL_89:
                          int v58 = v103;
LABEL_105:
                        }
LABEL_107:

                        goto LABEL_108;
                      }
                      v95 = -[NSObject resourceForType:](v34, "resourceForType:", [v21 resourceType]);
                      v64 = [v95 identity];
                      uint64_t v65 = [v64 fingerPrint];

                      v66 = [v21 identity];
                      uint64_t v67 = [v66 fingerPrint];

                      if (v65 && v67)
                      {
                        unsigned __int8 v68 = [(id)v65 isEqual:v67];

                        if ((v68 & 1) == 0)
                        {
LABEL_98:
                          if (!_CPLSilentLogging)
                          {
                            v74 = sub_10014B004();
                            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412546;
                              v118 = v21;
                              __int16 v119 = 2112;
                              v120 = v95;
                              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but it does not match the cloud cache: %@", buf, 0x16u);
                            }
                            int v56 = 0;
                            v75 = v74;
                            id v24 = @"resource is stale";
                            goto LABEL_102;
                          }
LABEL_68:
                          int v56 = 0;
                          id v24 = @"resource is stale";
LABEL_69:
                          uint64_t v25 = 27;
                          goto LABEL_89;
                        }
                      }
                      else
                      {

                        if (v65 | v67) {
                          goto LABEL_98;
                        }
                      }
                      v69 = [v95 identity];
                      uint64_t v70 = [v69 fileUTI];

                      SEL v71 = [v21 identity];
                      uint64_t v72 = [v71 fileUTI];

                      if (v70 && v72)
                      {
                        unsigned __int8 v73 = [(id)v70 isEqual:v72];

                        if ((v73 & 1) == 0) {
                          goto LABEL_98;
                        }
                      }
                      else
                      {

                        if (v70 | v72) {
                          goto LABEL_98;
                        }
                      }
                      if ([v86 containsObject:v99])
                      {
                        if (_CPLSilentLogging)
                        {
                          id v24 = 0;
                          uint64_t v25 = 0;
                          int v56 = 1;
                          goto LABEL_89;
                        }
                        v76 = sub_10014B004();
                        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          v118 = v21;
                          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Client is asking to delete %@ and it seems safe to do so", buf, 0xCu);
                        }
                        v75 = v76;
                        id v24 = 0;
                        uint64_t v25 = 0;
                        int v56 = 1;
                        goto LABEL_103;
                      }
                      if (v84)
                      {
                        if (_CPLSilentLogging)
                        {
                          id v24 = 0;
                          uint64_t v25 = 0;
                          int v56 = 0;
                          int v58 = 1;
                          goto LABEL_105;
                        }
                        v77 = sub_10014B004();
                        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          v118 = v21;
                          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "Client is asking to delete %@ and we need to confirm with server", buf, 0xCu);
                        }
                        v75 = v77;
                        id v24 = 0;
                        uint64_t v25 = 0;
                        int v56 = 0;
                        int v58 = 1;
                      }
                      else
                      {
                        if (_CPLSilentLogging)
                        {
                          int v56 = 0;
                          id v24 = @"resource is not confirmed";
                          goto LABEL_69;
                        }
                        v78 = sub_10014B004();
                        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v118 = v21;
                          __int16 v119 = 2112;
                          v120 = v95;
                          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but it has not been confirmed yet: %@", buf, 0x16u);
                        }
                        int v56 = 0;
                        v75 = v78;
                        id v24 = @"resource is not confirmed";
LABEL_102:
                        uint64_t v25 = 27;
LABEL_103:
                        int v58 = v103;
                      }

                      goto LABEL_105;
                    }
                    buf[0] = 0;
                    char v107 = 0;
                    uint64_t v38 = [v88 recordWithScopedIdentifier:v32 isConfirmed:buf isStaged:&v107];
                    if (v38)
                    {
                      SEL v34 = v38;
                      [v92 setObject:v38 forKey:v32];
                      if (buf[0] || v85) {
                        [v86 addObject:v32];
                      }
                      goto LABEL_42;
                    }
                    id v57 = +[NSNull null];
                    [v92 setObject:v57 forKey:v32];
                  }
LABEL_71:
                  if (!_CPLSilentLogging)
                  {
                    SEL v34 = sub_10014B004();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v118 = v21;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but the record is not even in the cloud", buf, 0xCu);
                    }
                    int v56 = 0;
                    id v24 = @"record is not in the cloud";
                    uint64_t v25 = 25;
                    int v58 = v103;
                    goto LABEL_107;
                  }
                  int v56 = 0;
                  id v24 = @"record is not in the cloud";
                  uint64_t v25 = 25;
                  int v58 = v103;
LABEL_108:

                  if ((v58 & 1) == 0 && v56)
                  {
                    [v89 addObject:v21];
                    id v15 = v93;
                    goto LABEL_113;
                  }
                  id v15 = v93;
                  if (!v58) {
                    goto LABEL_112;
                  }
                  goto LABEL_23;
                }
              }
            }
          }
          else
          {
            id v24 = @"scope is unknown";
          }
          [v96 setObject:v24 forKeyedSubscript:v30];
        }
        if (!_CPLSilentLogging)
        {
          v49 = sub_10014B004();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v118 = v21;
            __int16 v119 = 2112;
            v120 = v24;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Client is asking to delete %@ but it's not safe because of its scope: %@", buf, 0x16u);
          }
        }
        if (!v103)
        {
          uint64_t v25 = 33;
LABEL_112:
          ((void (*)(void *, void *, uint64_t, __CFString *))v19[2])(v19, v21, v25, v24);
          goto LABEL_113;
        }
LABEL_23:
        id v26 = [v21 itemScopedIdentifier];
        char v27 = [v26 scopeIdentifier];

        id v106 = 0;
        unsigned int v28 = [v15 addTransportScopeForScopeIdentifier:v27 scopes:v100 useStagingScopeIfNecessary:1 error:&v106];
        id v29 = v106;
        if (v28) {
          [v97 addObject:v21];
        }
        else {
          ((void (*)(void *, void *, uint64_t, const __CFString *))v19[2])(v19, v21, 2001, @"can't find a valid transport scope");
        }

LABEL_113:
        id v20 = (char *)v20 + 1;
      }
      while (v105 != v20);
      id v79 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
      id v105 = v79;
    }
    while (v79);
  }

  if (v83) {
    id *v83 = v97;
  }

  return v89;
}

- (void)_deleteResources:(id)a3 dryRun:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v33 = a3;
  id v34 = a6;
  id v36 = [(CPLEngineLibrary *)self->_engineLibrary store];
  id v35 = [v36 resourceStorage];
  if ([(CPLEngineLibrary *)self->_engineLibrary iCloudLibraryClientVersionTooOld])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10014B004();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = "prune";
        if (v8) {
          BOOL v11 = "check (prune)";
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to %s some resources while engine not syncing due to server blacklisting client", (uint8_t *)&buf, 0xCu);
      }
    }
    clientQueue = self->_clientQueue;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1001628EC;
    v85[3] = &unk_100276C98;
    id v88 = v34;
    id v86 = v33;
    id v87 = v35;
    id v13 = v85;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    uint64_t v90 = (uint64_t)sub_10016C96C;
    v91 = (uint64_t (*)(uint64_t, uint64_t))&unk_100275DF8;
    id v92 = v13;
    id v14 = clientQueue;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v14, v15);
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v90 = 0x3032000000;
    v91 = sub_10014B620;
    id v92 = sub_10014B630;
    id v93 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_10014B620;
    v83[4] = sub_10014B630;
    id v84 = objc_alloc_init((Class)NSMutableArray);
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x3032000000;
    v81[3] = sub_10014B620;
    v81[4] = sub_10014B630;
    id v82 = objc_alloc_init((Class)NSMutableDictionary);
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x3032000000;
    v79[3] = sub_10014B620;
    v79[4] = sub_10014B630;
    id v80 = 0;
    id v16 = +[NSFileManager defaultManager];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100162990;
    v75[3] = &unk_10027E3A0;
    id v17 = v35;
    BOOL v78 = !v8;
    id v76 = v17;
    v77 = v81;
    id v18 = objc_retainBlock(v75);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100162A54;
    v67[3] = &unk_10027E3C8;
    BOOL v73 = v8;
    BOOL v74 = !v8;
    id v31 = v17;
    id v68 = v31;
    SEL v71 = v83;
    id v29 = v16;
    id v69 = v29;
    uint64_t v72 = v81;
    long long v30 = v18;
    id v70 = v30;
    id v19 = objc_retainBlock(v67);
    id v20 = objc_alloc_init((Class)CPLRecordTargetMapping);
    id v21 = objc_alloc((Class)CPLTransportScopeMapping);
    id v22 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v23 = [v22 transport];
    id v24 = [v21 initWithTranslator:v23];

    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = sub_10014B620;
    v65[4] = sub_10014B630;
    id v66 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100162DA4;
    v52[3] = &unk_10027E3F0;
    BOOL v63 = a5;
    v52[4] = self;
    BOOL v64 = !v8;
    id v53 = v33;
    int v58 = v79;
    id v54 = v24;
    id v59 = v81;
    SEL v62 = a2;
    id v57 = v19;
    p_long long buf = &buf;
    id v55 = v36;
    id v61 = v65;
    id v56 = v20;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100162FC8;
    v37[3] = &unk_10027E4E0;
    BOOL v50 = v8;
    uint64_t v45 = v83;
    v37[4] = self;
    id v43 = v34;
    id v38 = v53;
    BOOL v51 = !v8;
    id v39 = v31;
    v46 = v65;
    uint64_t v47 = v81;
    id v25 = v56;
    id v40 = v25;
    id v26 = v54;
    id v41 = v26;
    unsigned __int8 v48 = v79;
    id v42 = v55;
    v49 = &buf;
    char v27 = v57;
    id v44 = v27;
    id v28 = [v42 performWriteTransactionWithBlock:v52 completionHandler:v37];

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(v79, 8);

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v83, 8);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CPLEngineLibrary *)self->_engineLibrary store];
  id v9 = [v8 cloudCache];
  id v10 = [v8 outgoingResources];
  [v8 idMapping];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016438C;
  v18[3] = &unk_10027D5E0;
  id v19 = v6;
  id v20 = v8;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v9;
  id v23 = v10;
  id v24 = self;
  id v25 = v7;
  id v11 = v7;
  id v12 = v10;
  id v13 = v9;
  id v14 = v21;
  id v15 = v8;
  id v16 = v6;
  id v17 = [v15 performReadTransactionWithBlock:v18];
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100164D10;
  v10[3] = &unk_1002773D8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100164DE0;
  v8[3] = &unk_10027D518;
  id v9 = v4;
  id v5 = v4;
  id v6 = v11;
  id v7 = [v6 performWriteTransactionWithBlock:v10 completionHandler:v8];
}

- (void)markLibraryManagerAsInvalid
{
  if (self->_ownsLibrary)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = sub_10014B004();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = NSStringFromSelector(a2);
        int v7 = 138412546;
        BOOL v8 = v5;
        __int16 v9 = 2112;
        id v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Trying to call %@ while %@ does not own the engine", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  else
  {
    engineLibrary = self->_engineLibrary;
    [(CPLEngineLibrary *)engineLibrary markAttachedObjectAsInvalid:self];
  }
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CPLDirectLibraryManager *)self _isManagementLibraryManager])
  {
    engineLibrary = self->_engineLibrary;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001651E4;
    v19[3] = &unk_10027E530;
    void v19[4] = self;
    id v20 = v10;
    id v12 = v10;
    [(CPLEngineLibrary *)engineLibrary testKey:v8 value:v9 completionHandler:v19];
    id v13 = v20;
  }
  else
  {
    clientQueue = self->_clientQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100165140;
    v21[3] = &unk_100276210;
    void v21[4] = self;
    id v22 = v10;
    id v15 = v21;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C96C;
    block[3] = &unk_100275DF8;
    id v24 = v15;
    id v16 = clientQueue;
    id v17 = v10;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v16, v18);

    id v13 = v22;
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100165454;
  v12[3] = &unk_10027E558;
  id v14 = v6;
  id v15 = v7;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  id v9 = v13;
  id v10 = v7;
  id v11 = [v9 performReadTransactionWithBlock:v12];
}

- (void)engineLibrary:(id)a3 didCloseWithError:(id)a4
{
  if (!(self->_closing | _CPLSilentLogging))
  {
    id v5 = sub_10014B004();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      engineLibrary = self->_engineLibrary;
      int v7 = 138412290;
      id v8 = engineLibrary;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ was closed externally", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)engineLibraryHasChangesInPullQueue:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10014B004();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [(CPLDirectLibraryManager *)self abstractObject];
      id v6 = [v5 delegate];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ of changes in pull queue", (uint8_t *)&buf, 0xCu);
    }
  }
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001658A8;
  v11[3] = &unk_100275EA0;
  void v11[4] = self;
  id v8 = v11;
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v13 = sub_10016C96C;
  id v14 = &unk_100275DF8;
  id v15 = v8;
  id v9 = clientQueue;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v9, v10);
}

- (void)engineLibraryHasStatusChanges:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10014B004();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [(CPLDirectLibraryManager *)self abstractObject];
      id v6 = [v5 delegate];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ of status changes", (uint8_t *)&buf, 0xCu);
    }
  }
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100165AD8;
  v11[3] = &unk_100275EA0;
  void v11[4] = self;
  id v8 = v11;
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v13 = sub_10016C96C;
  id v14 = &unk_100275DF8;
  id v15 = v8;
  id v9 = clientQueue;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v9, v10);
}

- (void)engineLibrary:(id)a3 didDownloadResourceInBackground:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_10014B004();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(CPLDirectLibraryManager *)self abstractObject];
      id v8 = [v7 resourceProgressDelegate];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Notifying %@ that %@ was downloaded in background", buf, 0x16u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100165D54;
  v14[3] = &unk_100276018;
  void v14[4] = self;
  id v15 = v5;
  dispatch_block_t v10 = v14;
  *(void *)long long buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_10016C96C;
  id v17 = &unk_100275DF8;
  id v18 = v10;
  id v11 = clientQueue;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v11, v13);
}

- (void)engineLibrary:(id)a3 didFailBackgroundDownloadOfResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_10014B004();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(CPLDirectLibraryManager *)self abstractObject];
      id v8 = [v7 resourceProgressDelegate];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Notifying %@ that %@ did fail to download in background", buf, 0x16u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100165FC0;
  v14[3] = &unk_100276018;
  void v14[4] = self;
  id v15 = v5;
  dispatch_block_t v10 = v14;
  *(void *)long long buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_10016C96C;
  id v17 = &unk_100275DF8;
  id v18 = v10;
  id v11 = clientQueue;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v11, v13);
}

- (void)engineLibrary:(id)a3 didStartUploadTask:(id)a4
{
  id v5 = a4;
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100166174;
  v11[3] = &unk_100276018;
  void v11[4] = self;
  id v12 = v5;
  int v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = clientQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didProgress:(float)a5
{
  id v7 = a4;
  id v8 = [(CPLDirectLibraryManager *)self abstractObject];
  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100166348;
  v15[3] = &unk_10027E580;
  float v18 = a5;
  id v16 = v8;
  id v17 = v7;
  dispatch_block_t v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v20 = v10;
  id v11 = clientQueue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didFinishWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001664F8;
  v15[3] = &unk_1002760B0;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  dispatch_block_t v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v19 = v10;
  id v11 = clientQueue;
  id v12 = v8;
  id v13 = v7;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)engineLibrary:(id)a3 sizeOfResourcesToUploadDidChangeToSize:(unint64_t)a4 sizeOfOriginalResourcesToUpload:(unint64_t)a5 numberOfImages:(unint64_t)a6 numberOfVideos:(unint64_t)a7 numberOfOtherItems:(unint64_t)a8
{
  clientQueue = self->_clientQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100166680;
  v12[3] = &unk_10027E5A8;
  void v12[4] = self;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  v12[8] = a7;
  v12[9] = a8;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v14 = v9;
  dispatch_block_t v10 = clientQueue;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v11);
}

- (void)engineLibrary:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  clientQueue = self->_clientQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016682C;
  v17[3] = &unk_10027E5D0;
  void v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  Class v20 = a5;
  id v12 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v22 = v12;
  id v13 = clientQueue;
  id v14 = v10;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

- (void)engineLibrary:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100166AB4;
  v11[3] = &unk_100276288;
  void v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = clientQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSProgress progressWithTotalUnitCount:1];
  clientQueue = self->_clientQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100166DCC;
  v21[3] = &unk_100276428;
  id v22 = v12;
  id v23 = self;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v14 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C96C;
  block[3] = &unk_100275DF8;
  id v28 = v14;
  id v15 = clientQueue;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  id v19 = v12;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v20);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CPLDirectLibraryManager *)self abstractObject];
  id v5 = [v4 delegate];
  id v6 = +[NSString stringWithFormat:@"<%@ %@>", v3, v5];

  return (NSString *)v6;
}

- (BOOL)_resetStore:(id)a3 reason:(id)a4 resetSelector:(SEL)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v11, a5);
  LOBYTE(a6) = ((uint64_t (*)(id, SEL, id, id *))MethodImplementation)(v10, a5, v9, a6);

  return (char)a6;
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = [(CPLEngineLibrary *)self->_engineLibrary store];
  id v11 = v10;
  if (a3 == 101)
  {
    [v10 markAsCorrupted];
    v9[2](v9, 0);
  }
  else if (a3 == 100)
  {
    v9[2](v9, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001673C0;
    v19[3] = &unk_100275EA0;
    void v19[4] = self;
    [v11 wipeStoreAtNextOpeningWithReason:v8 completionBlock:v19];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100167430;
    v15[3] = &unk_10027E648;
    unint64_t v18 = a3;
    void v15[4] = self;
    id v16 = v10;
    id v17 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10016784C;
    v13[3] = &unk_10027DE50;
    void v13[4] = self;
    id v14 = v9;
    id v12 = [v16 performWriteTransactionWithBlock:v15 completionHandler:v13];
  }
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CPLEngineLibrary *)self->_engineLibrary store];
  [v10 scopes];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100167B34;
  v16[3] = &unk_10027E698;
  BOOL v21 = a4;
  id v17 = v10;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v8;
  id v20 = v9;
  id v11 = v8;
  id v12 = v18;
  id v13 = v10;
  id v14 = v9;
  id v15 = [v13 performReadTransactionWithBlock:v16];
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100168324;
  v12[3] = &unk_10027E300;
  void v12[4] = self;
  id v13 = v6;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v7;
  id v8 = v14;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 performReadTransactionWithBlock:v12];
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100168A04;
  v14[3] = &unk_10027E6C0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v9;
  BOOL v18 = a4;
  id v10 = v16;
  id v11 = v8;
  id v12 = v9;
  id v13 = [v10 performReadTransactionWithBlock:v14];
}

- (void)addInfoToLog:(id)a3
{
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLDirectLibraryManager *)self engineLibrary];
  [v5 forceBackupWithActivity:0 forceClientPush:1 completionHandler:v4];
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLDirectLibraryManager *)self engineLibrary];
  [v5 requestClientToPushAllChangesWithCompletionHandler:v4];
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLDirectLibraryManager *)self engineLibrary];
  [v8 requestClientToPullAllChangesWithScopeIdentifiers:v7 completionHandler:v6];
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  engineLibrary = self->_engineLibrary;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CPLEngineLibrary *)engineLibrary syncManager];
  [v10 addDropDerivativesRecipe:v9 writeToUserDefaults:v5 withCompletionHandler:v8];
}

- (id)displayableNameForEngineLibrary:(id)a3
{
  id v4 = [(CPLDirectLibraryManager *)self abstractObject];
  BOOL v5 = [v4 delegate];

  if (!v5
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([(CPLDirectLibraryManager *)self abstractObject],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 displayableNameForLibraryManager:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = +[NSProcessInfo processInfo];
    id v7 = [v8 processName];
  }
  return v7;
}

- (BOOL)isLibraryManagerForEngineLibrary:(id)a3
{
  id v4 = [(CPLDirectLibraryManager *)self abstractObject];
  BOOL v5 = [v4 delegate];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [(CPLDirectLibraryManager *)self abstractObject];
    unsigned __int8 v7 = [v5 isLibraryManager:v6];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10014B620;
  v24[4] = sub_10014B630;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001698FC;
  v17[3] = &unk_10027E710;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  id v19 = v8;
  id v20 = v26;
  BOOL v21 = v22;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100169E1C;
  v12[3] = &unk_10027E738;
  id v15 = v24;
  id v16 = v22;
  id v9 = v18;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  id v11 = [v9 performWriteTransactionWithBlock:v17 completionHandler:v12];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

- (void)_cleanupComputeStateDownloadQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(CPLEngineLibrary *)self->_engineLibrary store];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100169FAC;
  v5[3] = &unk_100276590;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v6;
  id v4 = [v3 performWriteTransactionWithBlock:v5 completionHandler:&stru_10027E758];
}

- (void)_startComputeStateDownload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ++self->_computeStateDownloadCount;
  cleanupComputeStateDownloadTimer = self->_cleanupComputeStateDownloadTimer;
  if (cleanupComputeStateDownloadTimer)
  {
    dispatch_source_cancel(cleanupComputeStateDownloadTimer);
    id v4 = self->_cleanupComputeStateDownloadTimer;
    self->_cleanupComputeStateDownloadTimer = 0;
  }
}

- (void)_endComputeStateDownload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unint64_t computeStateDownloadCount = self->_computeStateDownloadCount;
  if (computeStateDownloadCount)
  {
    unint64_t v5 = computeStateDownloadCount - 1;
    self->_unint64_t computeStateDownloadCount = v5;
    if (!v5)
    {
      id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_clientQueue);
      dispatch_time_t v7 = dispatch_time(0, 3600000000000);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10016A41C;
      v12[3] = &unk_100276018;
      id v8 = v6;
      id v13 = v8;
      id v14 = self;
      dispatch_source_set_event_handler(v8, v12);
      cleanupComputeStateDownloadTimer = self->_cleanupComputeStateDownloadTimer;
      self->_cleanupComputeStateDownloadTimer = (OS_dispatch_source *)v8;
      id v10 = v8;

      dispatch_activate(v10);
    }
  }
  else
  {
    uint64_t v11 = sub_1001CFE40(a2, self);
    sub_10016A41C(v11);
  }
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if ([v13 count])
  {
    id v16 = [(CPLEngineLibrary *)self->_engineLibrary store];
    id v17 = [v16 scopes];
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x3032000000;
    v84[3] = sub_10014B620;
    v84[4] = sub_10014B630;
    id v85 = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x3032000000;
    v82[3] = sub_10014B620;
    v82[4] = sub_10014B630;
    id v83 = 0;
    id v18 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v40 = [v18 transport];
    BOOL v39 = a5;

    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x3032000000;
    v80[3] = sub_10014B620;
    v80[4] = sub_10014B630;
    id v81 = 0;
    v78[0] = 0;
    v78[1] = v78;
    v78[2] = 0x3032000000;
    v78[3] = sub_10014B620;
    v78[4] = sub_10014B630;
    id v79 = 0;
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x3032000000;
    v76[3] = sub_10014B620;
    v76[4] = sub_10014B630;
    id v77 = 0;
    id v19 = objc_opt_class();
    id v20 = +[NSProgress progressWithTotalUnitCount:1];
    block = _NSConcreteStackBlock;
    uint64_t v87 = 3221225472;
    id v88 = sub_10016C9B8;
    id v89 = &unk_10027E948;
    id v90 = v19;
    SEL v91 = a2;
    [v20 setCancellationHandler:&block];
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    char v75 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10016AB60;
    v68[3] = &unk_10027E7A8;
    id v41 = self;
    v68[4] = self;
    SEL v71 = v74;
    uint64_t v72 = v76;
    BOOL v73 = v78;
    id v21 = v20;
    id v69 = v21;
    id v70 = v15;
    id v22 = objc_retainBlock(v68);
    char v23 = [v16 recordComputeStatePushQueue];
    [v23 noteComputeStateDownloadRequest];
    id v37 = v14;
    id v38 = v21;
    id v36 = v15;

    clientQueue = v41->_clientQueue;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10016AF44;
    v67[3] = &unk_100275EA0;
    void v67[4] = v41;
    id v25 = v67;
    block = _NSConcreteStackBlock;
    uint64_t v87 = 3221225472;
    id v88 = sub_10016C96C;
    id v89 = &unk_100275DF8;
    id v90 = v25;
    id v26 = clientQueue;
    dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v26, v27);

    id v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10016AF4C;
    v58[3] = &unk_10027E7F8;
    id v59 = v13;
    BOOL v63 = v84;
    id v60 = v17;
    id v61 = v16;
    id v62 = v28;
    BOOL v64 = v80;
    uint64_t v65 = v82;
    id v66 = v78;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10016B4BC;
    v42[3] = &unk_10027E8E8;
    id v29 = v22;
    id v50 = v29;
    id v30 = v62;
    id v43 = v30;
    id v44 = v41;
    id v45 = v59;
    BOOL v51 = v76;
    v52 = v84;
    id v53 = v82;
    id v54 = v78;
    id v55 = v80;
    id v31 = v61;
    id v46 = v31;
    id v32 = v60;
    id v47 = v32;
    BOOL v56 = v39;
    id v33 = v38;
    id v48 = v33;
    BOOL v57 = a6;
    id v34 = v40;
    id v49 = v34;
    id v35 = [v31 performWriteTransactionWithBlock:v58 completionHandler:v42];

    _Block_object_dispose(v74, 8);
    _Block_object_dispose(v76, 8);

    _Block_object_dispose(v78, 8);
    _Block_object_dispose(v80, 8);

    _Block_object_dispose(v82, 8);
    _Block_object_dispose(v84, 8);

    id v15 = v36;
    id v14 = v37;
  }
  else
  {
    (*((void (**)(id, void *, void))v15 + 2))(v15, &__NSDictionary0__struct, 0);
  }
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  engineLibrary = self->_engineLibrary;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineLibrary *)engineLibrary feedback];
  [v8 reportSetting:v7 hasBeenSetToValue:v6];
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:CPLMiscInformationAppendCPLReport];

  if (v5)
  {
    id v6 = [(CPLDirectLibraryManager *)self engineLibrary];
    id v7 = [v6 store];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016C090;
    v10[3] = &unk_10027D478;
    id v11 = v4;
    id v12 = v7;
    id v13 = self;
    id v8 = v7;
    id v9 = [v8 performReadTransactionWithBlock:v10];
  }
  else
  {
    id v8 = [(CPLEngineLibrary *)self->_engineLibrary feedback];
    [v8 reportMiscInformation:v4];
  }
}

- (void)blockEngineElement:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = [(CPLEngineLibrary *)engineLibrary scheduler];
    [v5 blockEngineElement:v4];
  }
}

- (void)unblockEngineElement:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = [(CPLEngineLibrary *)engineLibrary scheduler];
    [v5 unblockEngineElement:v4];
  }
}

- (void)unblockEngineElementOnce:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = [(CPLEngineLibrary *)engineLibrary scheduler];
    [v5 unblockEngineElementOnce:v4];
  }
}

- (void)engineLibrary:(id)a3 noteClientIsInForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CPLDirectLibraryManager *)self abstractObject];
  id v5 = [v6 owner];
  [v5 libraryManager:v6 noteClientIsInForeground:v4];
}

- (id)ownerNameForEngineLibrary:(id)a3
{
  id v3 = [(CPLDirectLibraryManager *)self abstractObject];
  BOOL v4 = [v3 owner];
  id v5 = [v4 ownerNameForLibraryManager:v3];

  return v5;
}

- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v8 = [(CPLDirectLibraryManager *)self abstractObject];
  id v6 = [v8 owner];
  id v7 = v6;
  if (v6) {
    [v6 libraryManager:v8 getStatusWithCompletionHandler:v5];
  }
  else {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v8 = [(CPLDirectLibraryManager *)self abstractObject];
  id v6 = [v8 owner];
  id v7 = v6;
  if (v6) {
    [v6 libraryManager:v8 getStatusDictionaryWithCompletionHandler:v5];
  }
  else {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (void)setEngineLibrary:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (id)configureEngineBeforeOpeningBlock
{
  return self->_configureEngineBeforeOpeningBlock;
}

- (void)setConfigureEngineBeforeOpeningBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configureEngineBeforeOpeningBlock, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_engineLibrary, 0);
  objc_storeStrong((id *)&self->_cleanupComputeStateDownloadTimer, 0);
  objc_storeStrong((id *)&self->_currentComputeStateDownloadTasks, 0);
  objc_storeStrong((id *)&self->_currentInMemoryDownloadTask, 0);
  objc_storeStrong((id *)&self->_currentRampingRequest, 0);
  objc_storeStrong((id *)&self->_disablingReasons, 0);
}

@end