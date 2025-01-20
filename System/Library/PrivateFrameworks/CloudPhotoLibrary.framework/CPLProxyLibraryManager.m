@interface CPLProxyLibraryManager
+ (id)clientProtocolInterface;
+ (id)daemonProtocolInterface;
- (BOOL)_setStatusFromDictionary:(id)a3;
- (CPLProxyLibraryManager)initWithAbstractObject:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_connection;
- (id)_uploadTaskDidStartForResource:(id)a3 withTaskIdentifier:(id)a4;
- (id)proxyWithErrorHandler:(id)a3;
- (void)_dispatchBlockWhenOpen:(id)a3;
- (void)_dispatchFailedDownloadTaskForResource:(id)a3 options:(id)a4 proposedTaskIdentifier:(id)a5 withError:(id)a6 withCompletionHandler:(id)a7;
- (void)_dispatchFailedForceSyncTaskForScopeIdentifiers:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5;
- (void)_dispatchFailedInMemoryDownloadTaskForResource:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5;
- (void)_dropConnectionCompletly;
- (void)_dropConnectionCompletlyLocked;
- (void)_dropVoucherForTaskWithIdentifier:(id)a3;
- (void)_invokeOutstandingInvocationsWithTaskIdentifier:(id)a3;
- (void)_invokeSyncOutstandingInvocationsWithTaskIdentifier:(id)a3;
- (void)_markConnectionAsInvalid;
- (void)_reallyOpenWithCompletionHandler:(id)a3;
- (void)_setupConnection;
- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4;
- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)backgroundDownloadDidFailForResource:(id)a3;
- (void)backgroundDownloadDidFinishForResource:(id)a3;
- (void)barrier;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelSyncTask:(id)a3;
- (void)cancelTask:(id)a3;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)closeWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)dispatchBlockWhenLibraryIsOpen:(id)a3;
- (void)downloadDidFinishForResourceTransferTask:(id)a3 finalResource:(id)a4 withError:(id)a5;
- (void)downloadDidProgress:(float)a3 forResourceTransferTask:(id)a4;
- (void)downloadDidStartForResourceTransferTask:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSyncDidFinishForTask:(id)a3 withErrors:(id)a4;
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
- (void)inMemoryDownloadDidFinishForResourceTransferTask:(id)a3 data:(id)a4 withError:(id)a5;
- (void)libraryManagerDidUpdateSizeOfResourcesToUploadToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7;
- (void)libraryManagerDidUpdateStatusWithProperties:(id)a3;
- (void)libraryManagerHasBeenReplaced;
- (void)libraryManagerHasChangesToPull;
- (void)libraryManagerHasStatusChanges;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)noteClientReceivedNotificationOfServerChanges;
- (void)openWithCompletionHandler:(id)a3;
- (void)provideCloudResource:(id)a3 completionHandler:(id)a4;
- (void)provideLocalResource:(id)a3 recordClassString:(id)a4 completionHandler:(id)a5;
- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5;
- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)pushAllChangesWithCompletionHandler:(id)a3;
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
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
- (void)uploadDidStartForResource:(id)a3 withResourceTransferTask:(id)a4;
- (void)uploadOfResource:(id)a3 didFinishForResourceTransferTask:(id)a4 withError:(id)a5;
- (void)uploadOfResource:(id)a3 didProgress:(float)a4 forResourceTransferTask:(id)a5;
@end

@implementation CPLProxyLibraryManager

+ (id)daemonProtocolInterface
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DBF490];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v2 classesForSelector:sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v7;
      __int16 v189 = 2112;
      id v190 = v8;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v12 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v2 classesForSelector:sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v13;
      __int16 v189 = 2112;
      id v190 = v14;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v18 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v2 classesForSelector:sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v19;
      __int16 v189 = 2112;
      id v190 = v20;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v24 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [v2 classesForSelector:sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v25;
      __int16 v189 = 2112;
      id v190 = v26;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v27 forSelector:sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v28 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [v2 classesForSelector:sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v29;
      __int16 v189 = 2112;
      id v190 = v30;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v31 forSelector:sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_ argumentIndex:2 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v32 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      id v33 = [v2 classesForSelector:sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_ argumentIndex:2 ofReply:0];
      NSStringFromSelector(sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v33;
      __int16 v189 = 2112;
      id v190 = v34;
      __int16 v191 = 2048;
      uint64_t v192 = 2;
      _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v35 forSelector:sel_getChangeBatchWithCompletionHandler_ argumentIndex:1 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v36 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      id v37 = [v2 classesForSelector:sel_getChangeBatchWithCompletionHandler_ argumentIndex:1 ofReply:1];
      NSStringFromSelector(sel_getChangeBatchWithCompletionHandler_);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v37;
      __int16 v189 = 2112;
      id v190 = v38;
      __int16 v191 = 2048;
      uint64_t v192 = 1;
      _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v39 forSelector:sel_acknowledgeChangeBatch_withCompletionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v40 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      id v41 = [v2 classesForSelector:sel_acknowledgeChangeBatch_withCompletionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_acknowledgeChangeBatch_withCompletionHandler_);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v41;
      __int16 v189 = 2112;
      id v190 = v42;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v40, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v43 forSelector:sel_commitChangeBatch_withCompletionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v44 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      id v45 = [v2 classesForSelector:sel_commitChangeBatch_withCompletionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_commitChangeBatch_withCompletionHandler_);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v45;
      __int16 v189 = 2112;
      id v190 = v46;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v44, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  [v2 setClasses:v49 forSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v50 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      id v51 = [v2 classesForSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v51;
      __int16 v189 = 2112;
      id v190 = v52;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v50, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  [v2 setClasses:v55 forSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v56 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      id v57 = [v2 classesForSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v57;
      __int16 v189 = 2112;
      id v190 = v58;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v59 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v60 = objc_opt_class();
  v61 = objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
  [v2 setClasses:v61 forSelector:sel_acknowledgeChangedStatuses_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v62 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      id v63 = [v2 classesForSelector:sel_acknowledgeChangedStatuses_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_acknowledgeChangedStatuses_);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v63;
      __int16 v189 = 2112;
      id v190 = v64;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v62, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v65 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  [v2 setClasses:v67 forSelector:sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v68 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      id v69 = [v2 classesForSelector:sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v69;
      __int16 v189 = 2112;
      id v190 = v70;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v68, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v71 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v72 = objc_opt_class();
  uint64_t v73 = objc_opt_class();
  v74 = objc_msgSend(v71, "setWithObjects:", v72, v73, objc_opt_class(), 0);
  [v2 setClasses:v74 forSelector:sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v75 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      id v76 = [v2 classesForSelector:sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v76;
      __int16 v189 = 2112;
      id v190 = v77;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v75, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v78 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v79 = objc_opt_class();
  v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  [v2 setClasses:v80 forSelector:sel_getChangedStatusesWithCompletionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v81 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    {
      id v82 = [v2 classesForSelector:sel_getChangedStatusesWithCompletionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_getChangedStatusesWithCompletionHandler_);
      id v83 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v82;
      __int16 v189 = 2112;
      id v190 = v83;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v81, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v84 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v85 = objc_opt_class();
  v86 = objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
  [v2 setClasses:v86 forSelector:sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v87 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      id v88 = [v2 classesForSelector:sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_);
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v88;
      __int16 v189 = 2112;
      id v190 = v89;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v87, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v90 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v91 = objc_opt_class();
  v92 = objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  [v2 setClasses:v92 forSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v93 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      id v94 = [v2 classesForSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      id v95 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v94;
      __int16 v189 = 2112;
      id v190 = v95;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v93, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v96 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v97 = objc_opt_class();
  uint64_t v98 = objc_opt_class();
  v99 = objc_msgSend(v96, "setWithObjects:", v97, v98, objc_opt_class(), 0);
  [v2 setClasses:v99 forSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:1 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v100 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      id v101 = [v2 classesForSelector:sel_deleteResources_checkServerIfNecessary_completionHandler_ argumentIndex:1 ofReply:1];
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      id v102 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v101;
      __int16 v189 = 2112;
      id v190 = v102;
      __int16 v191 = 2048;
      uint64_t v192 = 1;
      _os_log_impl(&dword_1B4CAC000, v100, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v103 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v104 = objc_opt_class();
  v105 = objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
  [v2 setClasses:v105 forSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v106 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    {
      id v107 = [v2 classesForSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      id v108 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v107;
      __int16 v189 = 2112;
      id v190 = v108;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v106, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v109 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v110 = objc_opt_class();
  uint64_t v111 = objc_opt_class();
  v112 = objc_msgSend(v109, "setWithObjects:", v110, v111, objc_opt_class(), 0);
  [v2 setClasses:v112 forSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:1 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v113 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
    {
      id v114 = [v2 classesForSelector:sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_ argumentIndex:1 ofReply:1];
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      id v115 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v114;
      __int16 v189 = 2112;
      id v190 = v115;
      __int16 v191 = 2048;
      uint64_t v192 = 1;
      _os_log_impl(&dword_1B4CAC000, v113, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v116 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v117 = objc_opt_class();
  v118 = objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
  [v2 setClasses:v118 forSelector:sel_getResourcesForItemWithScopedIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v119 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
    {
      id v120 = [v2 classesForSelector:sel_getResourcesForItemWithScopedIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
      NSStringFromSelector(sel_getResourcesForItemWithScopedIdentifier_completionHandler_);
      id v121 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v120;
      __int16 v189 = 2112;
      id v190 = v121;
      __int16 v191 = 2048;
      uint64_t v192 = 1;
      _os_log_impl(&dword_1B4CAC000, v119, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v122 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v123 = objc_opt_class();
  v124 = objc_msgSend(v122, "setWithObjects:", v123, objc_opt_class(), 0);
  [v2 setClasses:v124 forSelector:sel_queryUserDetailsForShareParticipants_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v125 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
    {
      id v126 = [v2 classesForSelector:sel_queryUserDetailsForShareParticipants_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_queryUserDetailsForShareParticipants_completionHandler_);
      id v127 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v126;
      __int16 v189 = 2112;
      id v190 = v127;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v125, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v128 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v129 = objc_opt_class();
  v130 = objc_msgSend(v128, "setWithObjects:", v129, objc_opt_class(), 0);
  [v2 setClasses:v130 forSelector:sel_queryUserDetailsForShareParticipants_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v131 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
    {
      id v132 = [v2 classesForSelector:sel_queryUserDetailsForShareParticipants_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_queryUserDetailsForShareParticipants_completionHandler_);
      id v133 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v132;
      __int16 v189 = 2112;
      id v190 = v133;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v131, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v134 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v135 = objc_opt_class();
  v136 = objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
  [v2 setClasses:v136 forSelector:sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v137 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
    {
      id v138 = [v2 classesForSelector:sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_);
      id v139 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v138;
      __int16 v189 = 2112;
      id v190 = v139;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v137, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v140 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v141 = objc_opt_class();
  v142 = objc_msgSend(v140, "setWithObjects:", v141, objc_opt_class(), 0);
  [v2 setClasses:v142 forSelector:sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v143 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
    {
      id v144 = [v2 classesForSelector:sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_);
      id v145 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v144;
      __int16 v189 = 2112;
      id v190 = v145;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v143, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v146 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v147 = objc_opt_class();
  v148 = objc_msgSend(v146, "setWithObjects:", v147, objc_opt_class(), 0);
  [v2 setClasses:v148 forSelector:sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v149 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
    {
      id v150 = [v2 classesForSelector:sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_);
      id v151 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v150;
      __int16 v189 = 2112;
      id v190 = v151;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v149, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v152 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v153 = objc_opt_class();
  uint64_t v154 = objc_opt_class();
  v155 = objc_msgSend(v152, "setWithObjects:", v153, v154, objc_opt_class(), 0);
  [v2 setClasses:v155 forSelector:sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v156 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
    {
      id v157 = [v2 classesForSelector:sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_);
      id v158 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v157;
      __int16 v189 = 2112;
      id v190 = v158;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v156, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v159 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v160 = objc_opt_class();
  v161 = objc_msgSend(v159, "setWithObjects:", v160, objc_opt_class(), 0);
  [v2 setClasses:v161 forSelector:sel_attachComputeStates_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v162 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
    {
      id v163 = [v2 classesForSelector:sel_attachComputeStates_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_attachComputeStates_completionHandler_);
      id v164 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v163;
      __int16 v189 = 2112;
      id v190 = v164;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v162, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v165 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v166 = objc_opt_class();
  uint64_t v167 = objc_opt_class();
  v168 = objc_msgSend(v165, "setWithObjects:", v166, v167, objc_opt_class(), 0);
  [v2 setClasses:v168 forSelector:sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v169 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
    {
      id v170 = [v2 classesForSelector:sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_);
      id v171 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v170;
      __int16 v189 = 2112;
      id v190 = v171;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v169, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  v172 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v173 = objc_opt_class();
  uint64_t v174 = objc_opt_class();
  v175 = objc_msgSend(v172, "setWithObjects:", v173, v174, objc_opt_class(), 0);
  [v2 setClasses:v175 forSelector:sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    v176 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
    {
      id v177 = [v2 classesForSelector:sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_ argumentIndex:0 ofReply:1];
      NSStringFromSelector(sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_);
      id v178 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v177;
      __int16 v189 = 2112;
      id v190 = v178;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v176, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  v179 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v180 = objc_opt_class();
  v181 = objc_msgSend(v179, "setWithObjects:", v180, objc_opt_class(), 0);
  [v2 setClasses:v181 forSelector:sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    v182 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
    {
      id v183 = [v2 classesForSelector:sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
      NSStringFromSelector(sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_);
      id v184 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v188 = v183;
      __int16 v189 = 2112;
      id v190 = v184;
      __int16 v191 = 2048;
      uint64_t v192 = 0;
      _os_log_impl(&dword_1B4CAC000, v182, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  id v185 = v2;

  return v185;
}

+ (id)clientProtocolInterface
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0D92EC0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_forceSyncDidFinishForTask_withErrors_ argumentIndex:1 ofReply:0];

  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v2 classesForSelector:sel_forceSyncDidFinishForTask_withErrors_ argumentIndex:1 ofReply:0];
      v9 = NSStringFromSelector(sel_forceSyncDidFinishForTask_withErrors_);
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2048;
      uint64_t v28 = 1;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_ argumentIndex:0 ofReply:0];

  if (!_CPLSilentLogging)
  {
    id v13 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [v2 classesForSelector:sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_ argumentIndex:0 ofReply:0];
      v15 = NSStringFromSelector(sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_);
      *(_DWORD *)buf = 138412802;
      v24 = v14;
      __int16 v25 = 2112;
      id v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_ argumentIndex:0 ofReply:1];

  if (!_CPLSilentLogging)
  {
    id v19 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v2 classesForSelector:sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_ argumentIndex:0 ofReply:1];
      v21 = NSStringFromSelector(sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_);
      *(_DWORD *)buf = 138412802;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);
    }
  }
  return v2;
}

- (CPLProxyLibraryManager)initWithAbstractObject:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CPLProxyLibraryManager;
  v3 = [(CPLPlatformObject *)&v21 initWithAbstractObject:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cpl.librarymanager.proxy", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    downloadTasks = v3->_downloadTasks;
    v3->_downloadTasks = v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inMemoryDownloadTasks = v3->_inMemoryDownloadTasks;
    v3->_inMemoryDownloadTasks = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uploadTasks = v3->_uploadTasks;
    v3->_uploadTasks = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    forceSyncTasks = v3->_forceSyncTasks;
    v3->_forceSyncTasks = v12;

    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    vouchersPerTaskIdentifier = v3->_vouchersPerTaskIdentifier;
    v3->_vouchersPerTaskIdentifier = v14;

    uint64_t v16 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    disablingReasons = v3->_disablingReasons;
    v3->_disablingReasons = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingBlocksAfterOpening = v3->_pendingBlocksAfterOpening;
    v3->_pendingBlocksAfterOpening = v18;

    v3->_realConnectionLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "%@ has been deallocated", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CPLProxyLibraryManager;
  [(CPLProxyLibraryManager *)&v4 dealloc];
}

- (id)_connection
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  p_realConnectionLock = &self->_realConnectionLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __37__CPLProxyLibraryManager__connection__block_invoke;
  id v8 = &unk_1E60A5CE8;
  v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_realConnectionLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __37__CPLProxyLibraryManager__connection__block_invoke(uint64_t a1)
{
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLProxyLibraryManager *)self _connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CPLProxyLibraryManager_proxyWithErrorHandler___block_invoke;
  v10[3] = &unk_1E60A5D10;
  id v11 = v5;
  id v12 = v4;
  id v6 = v5;
  id v7 = v4;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v10];

  return v8;
}

void __48__CPLProxyLibraryManager_proxyWithErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[CPLErrors invalidDaemonErrorWithConnectionError:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setupConnection
{
  p_realConnectionLock = &self->_realConnectionLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __42__CPLProxyLibraryManager__setupConnection__block_invoke;
  id v6 = &unk_1E60A5DD8;
  id v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_realConnectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Dropping former connection %@ for good and recreating a new one", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    [v2 _dropConnectionCompletlyLocked];
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.cloudphotod" options:0];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  objc_initWeak((id *)buf, *(id *)(*(void *)(a1 + 32) + 24));
  id v8 = [(id)objc_opt_class() daemonProtocolInterface];
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  [WeakRetained setRemoteObjectInterface:v8];

  uint64_t v10 = [(id)objc_opt_class() clientProtocolInterface];
  id v11 = objc_loadWeakRetained((id *)buf);
  [v11 setExportedInterface:v10];

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = objc_loadWeakRetained((id *)buf);
  [v13 setExportedObject:v12];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_268;
  v25[3] = &unk_1E60A5D88;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(&v27, (id *)buf);
  v25[4] = *(void *)(a1 + 32);
  id v14 = objc_loadWeakRetained((id *)buf);
  [v14 setInterruptionHandler:v25];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  objc_super v21 = __42__CPLProxyLibraryManager__setupConnection__block_invoke_2;
  uint64_t v22 = &unk_1E60A5DB0;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, (id *)buf);
  id v15 = objc_loadWeakRetained((id *)buf);
  [v15 setInvalidationHandler:&v19];

  id v16 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v16, "_setQueue:", *(void *)(*(void *)(a1 + 32) + 176), v19, v20, v21, v22);

  id v17 = objc_loadWeakRetained((id *)buf);
  [v17 setDelegate:*(void *)(a1 + 32)];

  id v18 = objc_loadWeakRetained((id *)buf);
  [v18 resume];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  objc_destroyWeak((id *)buf);
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_268(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _connection];
  uint64_t v4 = (id *)(a1 + 48);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));

  if (v3 == v5)
  {
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 173))
    {
      if (WeakRetained && *((unsigned char *)WeakRetained + 172))
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v12 = __CPLManagerOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [WeakRetained abstractObject];
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = (uint64_t)v13;
            __int16 v53 = 2114;
            uint64_t v54 = @"com.apple.cloudphotod";
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@: connection with %{public}@ was interrupted because it has been replaced with an other library manager", buf, 0x16u);
          }
        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v14 = __CPLManagerOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v15 = [WeakRetained abstractObject];
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = (uint64_t)v15;
            __int16 v53 = 2114;
            uint64_t v54 = @"com.apple.cloudphotod";
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "%@: connection with %{public}@ was interrupted", buf, 0x16u);
          }
        }
        if (!WeakRetained) {
          goto LABEL_56;
        }
      }
      id v7 = [WeakRetained abstractObject];
      id v8 = [v7 resourceProgressDelegate];
      id v16 = +[CPLErrors unknownError];
      if (!_CPLSilentLogging)
      {
        id v17 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [WeakRetained[4] count];
          *(_DWORD *)buf = 134217984;
          uint64_t v52 = v18;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "Failing %lu download tasks", buf, 0xCu);
        }
      }
      uint64_t v19 = [WeakRetained[4] count];
      [WeakRetained[8] removeAllObjects];
      if (v8)
      {
        id v20 = WeakRetained[4];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_269;
        v47[3] = &unk_1E60A5D38;
        uint64_t v48 = v7;
        id v49 = v8;
        id v50 = v16;
        [v20 enumerateKeysAndObjectsUsingBlock:v47];
      }
      [WeakRetained[4] removeAllObjects];
      if (v19) {
        +[CPLTransaction endTransactionWithIdentifier:@"cpl.activeresourcedownloads"];
      }
      if (!_CPLSilentLogging)
      {
        objc_super v21 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = [WeakRetained[5] count];
          *(_DWORD *)buf = 134217984;
          uint64_t v52 = v22;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEBUG, "Failing %lu in-memory download tasks", buf, 0xCu);
        }
      }
      if (v8)
      {
        id v23 = WeakRetained[5];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_275;
        v43[3] = &unk_1E60A5D38;
        id v44 = v8;
        id v45 = v7;
        id v46 = v16;
        [v23 enumerateKeysAndObjectsUsingBlock:v43];
      }
      [WeakRetained[5] removeAllObjects];
      if (!_CPLSilentLogging)
      {
        id v24 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [WeakRetained[6] count];
          *(_DWORD *)buf = 134217984;
          uint64_t v52 = v25;
          _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Failing %lu upload tasks", buf, 0xCu);
        }
      }
      if (v8)
      {
        id v26 = WeakRetained[6];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_276;
        v39[3] = &unk_1E60A5D38;
        id v40 = v8;
        id v41 = v7;
        id v42 = v16;
        [v26 enumerateKeysAndObjectsUsingBlock:v39];
      }
      [WeakRetained[6] removeAllObjects];
      if (!_CPLSilentLogging)
      {
        id v27 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = [WeakRetained[7] count];
          *(_DWORD *)buf = 134217984;
          uint64_t v52 = v28;
          _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEFAULT, "Failing %lu force sync tasks", buf, 0xCu);
        }
      }
      uint64_t v29 = [v7 forceSyncDelegate];
      uint64_t v30 = v29;
      if (v29)
      {
        id v31 = WeakRetained[7];
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        id v34 = __42__CPLProxyLibraryManager__setupConnection__block_invoke_277;
        v35 = &unk_1E60A5D60;
        id v36 = v29;
        id v37 = v7;
        id v38 = v16;
        [v31 enumerateKeysAndObjectsUsingBlock:&v32];
      }
      objc_msgSend(WeakRetained[7], "removeAllObjects", v32, v33, v34, v35);
      if (*((_DWORD *)WeakRetained + 38) != 2) {
        *((_DWORD *)WeakRetained + 38) = 1;
      }

      goto LABEL_54;
    }
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [WeakRetained abstractObject];
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = (uint64_t)v8;
        __int16 v53 = 2114;
        uint64_t v54 = @"com.apple.cloudphotod";
        v9 = "%@: connection with %{public}@ was interrupted during first try open";
        uint64_t v10 = v7;
        uint32_t v11 = 22;
        goto LABEL_10;
      }
LABEL_55:
    }
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = objc_loadWeakRetained(v4);
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = (uint64_t)v8;
          v9 = "Ignoring stale interruption handler for old %@";
          uint64_t v10 = v7;
          uint32_t v11 = 12;
LABEL_10:
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_54:

          goto LABEL_55;
        }
        goto LABEL_55;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring stale interruption handler for old connection", buf, 2u);
      }
      goto LABEL_55;
    }
  }
LABEL_56:
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_269(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  [v4 libraryManager:v6 downloadDidFinishForResourceTransferTask:a3 finalResource:0 withError:v5];
}

uint64_t __42__CPLProxyLibraryManager__setupConnection__block_invoke_275(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) libraryManager:*(void *)(a1 + 40) inMemoryDownloadDidFinishForResourceTransferTask:a3 data:0 withError:*(void *)(a1 + 48)];
}

uint64_t __42__CPLProxyLibraryManager__setupConnection__block_invoke_276(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) libraryManager:*(void *)(a1 + 40) uploadDidFinishForResourceTransferTask:a3 withError:*(void *)(a1 + 48)];
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_277(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 scopeIdentifiers];
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = +[CPLErrors errorsForIdentifiers:v8 error:a1[6]];
  [v5 libraryManager:v6 didFinishForceSyncTask:v4 withErrors:v7];
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _connection];
    uint64_t v5 = (id *)(a1 + 40);
    id v6 = objc_loadWeakRetained(v5);

    if (v4 == v6)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          id v13 = @"com.apple.cloudphotod";
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Connection with %@ was invalidated", (uint8_t *)&v12, 0xCu);
        }
      }
      [v3 _markConnectionAsInvalid];
    }
    else
    {
      id v7 = objc_loadWeakRetained(v5);

      if (v7)
      {
        if (!_CPLSilentLogging)
        {
          id v8 = __CPLManagerOSLogDomain();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = (__CFString *)objc_loadWeakRetained(v5);
            int v12 = 138412290;
            id v13 = v9;
            _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring stale invalidation handler for old %@", (uint8_t *)&v12, 0xCu);
          }
        }
      }
      else if (!_CPLSilentLogging)
      {
        uint32_t v11 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring stale invalidation handler for old connection", (uint8_t *)&v12, 2u);
        }
      }
    }
  }
}

- (void)_markConnectionAsInvalid
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_openingStatus != 4)
  {
    backoffRetryingConnectionDate = self->_backoffRetryingConnectionDate;
    if (!backoffRetryingConnectionDate
      || (([(NSDate *)backoffRetryingConnectionDate timeIntervalSinceNow], v4 >= -1800.0)
        ? ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1800.0],
           uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue())
        : (uint64_t v5 = 0),
          id v6 = self->_backoffRetryingConnectionDate,
          self->_backoffRetryingConnectionDate = v5,
          v6,
          !self->_backoffRetryingConnectionDate))
    {
      id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
      id v8 = self->_backoffRetryingConnectionDate;
      self->_backoffRetryingConnectionDate = v7;
    }
    if (!_CPLSilentLogging)
    {
      v9 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = +[CPLDateFormatter stringFromDate:self->_backoffRetryingConnectionDate];
        int v11 = 138412290;
        int v12 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Marking connection as invalid until %@", (uint8_t *)&v11, 0xCu);
      }
    }
    self->_openingStatus = 4;
  }
}

- (void)_dropConnectionCompletlyLocked
{
  [(NSXPCConnection *)self->_realConnection setDelegate:0];
  [(NSXPCConnection *)self->_realConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_realConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_realConnection invalidate];
  realConnection = self->_realConnection;
  self->_realConnection = 0;
}

- (void)_dropConnectionCompletly
{
  p_realConnectionLock = &self->_realConnectionLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __50__CPLProxyLibraryManager__dropConnectionCompletly__block_invoke;
  id v6 = &unk_1E60A5DD8;
  id v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_realConnectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);
}

uint64_t __50__CPLProxyLibraryManager__dropConnectionCompletly__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dropConnectionCompletlyLocked];
}

- (void)_reallyOpenWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLProxyLibraryManager *)self _connection];
  self->_openingStatus = 2;
  id v6 = [(CPLPlatformObject *)self abstractObject];
  id v17 = [v6 clientLibraryBaseURL];
  id v16 = [v6 cloudLibraryStateStorageURL];
  id v7 = [v6 cloudLibraryResourceStorageURL];
  id v8 = [v6 libraryIdentifier];
  v9 = [v6 mainScopeIdentifier];
  uint64_t v10 = [v6 libraryOptions];
  BOOL firstTryOpeningLibrary = self->_firstTryOpeningLibrary;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke;
  v30[3] = &unk_1E60A5E00;
  v30[4] = self;
  BOOL v32 = firstTryOpeningLibrary;
  id v12 = v4;
  id v31 = v12;
  uint64_t v13 = [(CPLProxyLibraryManager *)self proxyWithErrorHandler:v30];
  uint64_t v14 = v13;
  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E60A5E50;
    id v19 = v13;
    id v20 = v17;
    id v21 = v16;
    id v22 = v7;
    id v23 = v8;
    uint64_t v28 = v10;
    id v24 = v9;
    uint64_t v25 = self;
    id v26 = v5;
    BOOL v29 = firstTryOpeningLibrary;
    id v27 = v12;
    [v19 connectWithCompletionHandler:v18];

    id v15 = v19;
  }
  else
  {
    [(CPLProxyLibraryManager *)self _markConnectionAsInvalid];
    id v15 = +[CPLErrors libraryClosedError];
    (*((void (**)(id, id, void, void, void, void))v12 + 2))(v12, v15, 0, 0, 0, 0);
  }
}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _connection];

  if (v7 == v6)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _markConnectionAsInvalid];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E60A5E28;
  v9 = *(void **)(a1 + 88);
  void v10[4] = *(void *)(a1 + 80);
  id v11 = v9;
  char v13 = *(unsigned char *)(a1 + 112);
  id v12 = *(id *)(a1 + 96);
  [v2 openLibraryWithClientLibraryBaseURL:v3 cloudLibraryStateStorageURL:v4 cloudLibraryResourceStorageURL:v5 libraryIdentifier:v6 mainScopeIdentifier:v7 options:v8 completionHandler:v10];
}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = [*(id *)(a1 + 32) _connection];
  id v22 = *(void **)(a1 + 40);

  if (v21 == v22)
  {
    if (v15)
    {
      id v23 = v16;
      if (!*(unsigned char *)(a1 + 56)) {
        [*(id *)(a1 + 32) _markConnectionAsInvalid];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v23 = v16;
      [*(id *)(a1 + 32) _setStatusFromDictionary:v16];
      id v26 = [*(id *)(a1 + 32) abstractObject];
      [v26 _setSizeOfResourcesToUpload:a4 sizeOfOriginalResourcesToUpload:a5 numberOfImages:a6 numberOfVideos:a7 numberOfOtherItems:a8];

      *(_DWORD *)(*(void *)(a1 + 32) + 152) = 3;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v23 = v16;
    if (!_CPLSilentLogging)
    {
      id v24 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v25;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "Received completion for opening for %@ too late", buf, 0xCu);
      }
    }
  }
}

- (void)_dispatchBlockWhenOpen:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(CPLProxyLibraryManager *)self _connection];

  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      id v19 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = @"com.apple.cloudphotod";
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Trying to send messages to %@ but we have no connection ready", buf, 0xCu);
      }
    }
    goto LABEL_20;
  }
  int openingStatus = self->_openingStatus;
  if (openingStatus <= 0) {
    -[CPLProxyLibraryManager _dispatchBlockWhenOpen:]();
  }
  if (openingStatus != 1)
  {
    if (openingStatus != 4) {
      goto LABEL_14;
    }
    backoffRetryingConnectionDate = self->_backoffRetryingConnectionDate;
    if (backoffRetryingConnectionDate)
    {
      [(NSDate *)backoffRetryingConnectionDate timeIntervalSinceNow];
      if (v8 >= 0.0)
      {
        if (!_CPLSilentLogging)
        {
          id v20 = __CPLManagerOSLogDomain();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [(CPLProxyLibraryManager *)self _connection];
            *(_DWORD *)buf = 138412290;
            id v26 = v21;
            _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEBUG, "%@ has been invalidated recently, will not try to re-open one yet", buf, 0xCu);
          }
        }
        goto LABEL_20;
      }
    }
    if (!_CPLSilentLogging)
    {
      v9 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(CPLProxyLibraryManager *)self _connection];
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%@ has been invalidated a long time, will try re-opening one", buf, 0xCu);
      }
    }
    [(CPLProxyLibraryManager *)self _setupConnection];
    self->_int openingStatus = 1;
  }
  if (self->_killed)
  {
LABEL_20:
    v4[2](v4);
    goto LABEL_21;
  }
  id v11 = [(CPLPlatformObject *)self abstractObject];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke;
  v22[3] = &unk_1E60A5EC0;
  id v23 = v11;
  id v24 = self;
  id v12 = v11;
  [(CPLProxyLibraryManager *)self _reallyOpenWithCompletionHandler:v22];

  int openingStatus = self->_openingStatus;
LABEL_14:
  if (openingStatus > 2) {
    goto LABEL_20;
  }
  pendingBlocksAfterOpening = self->_pendingBlocksAfterOpening;
  uint64_t v14 = (void *)[v4 copy];
  id v18 = (void *)MEMORY[0x1BA994060](v14, v15, v16, v17);
  [(NSMutableArray *)pendingBlocksAfterOpening addObject:v18];

LABEL_21:
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v40 = v12;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v53 = @"com.apple.cloudphotod";
        __int16 v54 = 2112;
        id v55 = v11;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Unable to reopen connection with %@: %@", buf, 0x16u);
      }
    }
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = +[CPLErrors libraryClosedError];
    [v17 _setStatus:1 andError:v18];

    id v19 = [*(id *)(a1 + 32) delegate];
    [v19 libraryManagerStatusDidChange:*(void *)(a1 + 32)];
    goto LABEL_23;
  }
  [*(id *)(a1 + 32) _setLibraryVersion:v12];
  id v20 = [*(id *)(a1 + 32) delegate];
  [v20 libraryManagerStatusDidChange:*(void *)(a1 + 32)];

  uint64_t v21 = *(void *)(a1 + 40);
  if (*(void *)(v21 + 72))
  {
    id v22 = [(id)v21 proxyWithErrorHandler:&__block_literal_global];
    [v22 noteClientIsInForegroundQuietly:*(unsigned __int8 *)(*(void *)(a1 + 40) + 80)];

    uint64_t v21 = *(void *)(a1 + 40);
  }
  if ([*(id *)(v21 + 88) count])
  {
    id v39 = v13;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v23 = *(id *)(*(void *)(a1 + 40) + 88);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          BOOL v29 = *(void **)(a1 + 40);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_289;
          v45[3] = &unk_1E60A5E98;
          v45[4] = v28;
          uint64_t v30 = [v29 proxyWithErrorHandler:v45];
          [v30 disableSynchronizationWithReason:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v25);
    }

    id v13 = v39;
    id v11 = 0;
  }
  id v31 = *(void **)(a1 + 40);
  if (v31[12])
  {
    unint64_t v32 = 0;
    do
    {
      uint64_t v33 = [v31 proxyWithErrorHandler:&__block_literal_global_292];
      [v33 disableMingling];

      ++v32;
      id v31 = *(void **)(a1 + 40);
    }
    while (v32 < v31[12]);
  }
  if (v31[13])
  {
    id v19 = [v31 proxyWithErrorHandler:&__block_literal_global_295];
    [v19 noteClientIsBeginningSignificantWork];
LABEL_23:
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v34 = *(id *)(*(void *)(a1 + 40) + 144);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(v34);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v36);
  }

  [*(id *)(*(void *)(a1 + 40) + 144) removeAllObjects];
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_288(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Unable to re-establish foreground after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_289(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    int v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Unable to disable sync for reason '%@' after automatic re-opening: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_290(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Unable to disable mingling after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_293(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Unable to re-establish significant work after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)dispatchBlockWhenLibraryIsOpen:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CPLProxyLibraryManager_dispatchBlockWhenLibraryIsOpen___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __57__CPLProxyLibraryManager_dispatchBlockWhenLibraryIsOpen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:*(void *)(a1 + 40)];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  v2 = *(_DWORD **)(a1 + 32);
  if (v2[38]) {
    __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_cold_1(_CPLSilentLogging == 0, v3, a1);
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*v3 abstractObject];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@ opening connection with daemon", (uint8_t *)&buf, 0xCu);
    }
    v2 = *v3;
  }
  id v6 = [v2 abstractObject];
  uint64_t v7 = _connectedLibraryManagerRegisterQueue();
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v16 = ___registerConnectedLibraryManager_block_invoke;
  uint64_t v17 = &unk_1E60A5DD8;
  id v18 = v6;
  id v8 = v6;
  dispatch_sync(v7, &buf);

  [*(id *)(a1 + 32) _setupConnection];
  uint64_t v9 = *(void *)(a1 + 32);
  dispatch_block_t v10 = *(NSObject **)(v9 + 176);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_301;
  handler[3] = &unk_1E60A5F10;
  handler[4] = v9;
  notify_register_dispatch("com.apple.cpl.cloudphotoddidlaunch", (int *)(v9 + 168), v10, handler);
  *(unsigned char *)(*(void *)(a1 + 32) + 173) = 1;
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_303;
  v12[3] = &unk_1E60A5F38;
  v12[4] = v11;
  id v13 = *(id *)(a1 + 40);
  [v11 _reallyOpenWithCompletionHandler:v12];
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_301(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 172) && *(_DWORD *)(v2 + 168) == a2)
  {
    int v3 = *(_DWORD *)(v2 + 152);
    if (v3 == 4)
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v5 = 0;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "cloudphotod has been relaunched but our current connection is invalid - will reconnect only when necessary", v5, 2u);
        }
      }
    }
    else if (v3 == 1)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_2;
      v6[3] = &unk_1E60A5DD8;
      v6[4] = v2;
      [(id)v2 _dispatchBlockWhenOpen:v6];
    }
  }
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 152) == 1)
  {
    if (_CPLSilentLogging) {
      return;
    }
    v1 = __CPLManagerOSLogDomain();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v4 = 0;
    uint64_t v2 = "Failed to reconnect to cloudphotod";
    int v3 = (uint8_t *)&v4;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    return;
  }
  v1 = __CPLManagerOSLogDomain();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v2 = "Automatically reconnected to cloudphotod";
    int v3 = buf;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  }
LABEL_9:
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_303(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  *(unsigned char *)(*(void *)(a1 + 32) + 173) = 0;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [*(id *)(a1 + 32) abstractObject];
        id v18 = [v17 libraryIdentifier];
        *(_DWORD *)long long buf = 138543618;
        id v23 = v18;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "First try opening library manager for %{public}@ failed, will retry once - error: %@", buf, 0x16u);
      }
    }
    uint64_t v19 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_304;
    v20[3] = &unk_1E60A5F38;
    v20[4] = v19;
    id v21 = *(id *)(a1 + 40);
    [v19 _reallyOpenWithCompletionHandler:v20];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_304(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [*(id *)(a1 + 32) abstractObject];
        id v18 = [v17 libraryIdentifier];
        int v23 = 138543618;
        __int16 v24 = v18;
        __int16 v25 = 2112;
        id v26 = v11;
        uint64_t v19 = "Second try opening library manager for %{public}@ failed: %@";
        id v20 = v16;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        uint32_t v22 = 22;
LABEL_8:
        _os_log_impl(&dword_1B4CAC000, v20, v21, v19, (uint8_t *)&v23, v22);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v16 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [*(id *)(a1 + 32) abstractObject];
      id v18 = [v17 libraryIdentifier];
      int v23 = 138543362;
      __int16 v24 = v18;
      uint64_t v19 = "Second try opening library manager for %{public}@ succeeded";
      id v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      uint32_t v22 = 12;
      goto LABEL_8;
    }
LABEL_9:
  }
  (*(void (**)(void, id, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v12, v13);
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [*(id *)(a1 + 32) abstractObject];
      *(_DWORD *)long long buf = 138412290;
      dispatch_block_t v10 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%@ closing connection to daemon", buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 32) abstractObject];
  _unregisterConnectedLibraryManager(v4);

  id v5 = *(int **)(a1 + 32);
  int v6 = v5[42];
  if (v6)
  {
    notify_cancel(v6);
    *(_DWORD *)(*(void *)(a1 + 32) + 168) = 0;
    id v5 = *(int **)(a1 + 32);
  }
  if (v5[38] > 1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_305;
    v7[3] = &unk_1E60A5EE8;
    v7[4] = v5;
    id v8 = *(id *)(a1 + 40);
    [v5 _dispatchBlockWhenOpen:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_305(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E60A5F88;
  int v3 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v4 = [v3 proxyWithErrorHandler:v12];
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E60A5FB0;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = v5;
    v9[4] = v6;
    id v10 = v2;
    [v4 closeLibraryWithCompletionHandler:v9];

    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
  }
}

uint64_t __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  int v3 = [*(id *)(a1 + 32) _connection];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) _dropConnectionCompletly];
  }
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60A5EE8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) abstractObject];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%@ deactivating then closing connection to daemon", (uint8_t *)&buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 32) abstractObject];
  _unregisterConnectedLibraryManager(v4);

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(v5 + 168);
  if (v6)
  {
    notify_cancel(v6);
    *(_DWORD *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  BOOL v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_306;
  v23[3] = &unk_1E60A5FD8;
  v23[4] = v5;
  id v24 = *(id *)(a1 + 40);
  p_long long buf = &buf;
  uint64_t v7 = (void *)MEMORY[0x1BA994060](v23);
  id v8 = [*(id *)(a1 + 32) _connection];
  dispatch_block_t v9 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_307;
  v20[3] = &unk_1E60A6028;
  v20[4] = v9;
  uint32_t v22 = &buf;
  id v10 = v7;
  id v21 = v10;
  id v11 = [v9 proxyWithErrorHandler:v20];
  if (v11)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_309;
    v16[3] = &unk_1E60A6050;
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    uint64_t v19 = &buf;
    id v18 = v10;
    [v11 deactivateLibraryWithCompletionHandler:v16];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Proxy has disappeared before deactivation", v15, 2u);
      }
    }
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  _Block_object_dispose(&buf, 8);
}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_306(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) abstractObject];
      int v5 = 138412290;
      int v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Daemon library for %@ has been fully deactivated", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) _dropConnectionCompletly];
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 176);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_308;
  v15[3] = &unk_1E60A6000;
  id v16 = v5;
  id v17 = v6;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v14;
  long long v18 = v14;
  dispatch_block_t v9 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v9;
  id v10 = v7;
  id v11 = v6;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_308(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "%@ failed to deactivate library manager: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_309(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 176);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_310;
  v11[3] = &unk_1E60A6000;
  id v12 = v3;
  id v13 = *(id *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v10;
  long long v14 = v10;
  int v6 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  uint64_t v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_310(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = a1[4];
        uint64_t v4 = a1[5];
        int v11 = 138412546;
        uint64_t v12 = v4;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "%@ failed to deactivate library manager: %@", (uint8_t *)&v11, 0x16u);
      }

      uint64_t v2 = (void *)a1[4];
    }
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = v2;
    id v8 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
LABEL_10:

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  if (!_CPLSilentLogging)
  {
    id v8 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[5];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "%@ deactivated library manager", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_10;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  long long v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 activateScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
}

uint64_t __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  long long v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 deactivateScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
}

uint64_t __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  long long v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 boostPriorityForScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
}

uint64_t __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)_invokeOutstandingInvocationsWithTaskIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t outstandingInvocationsCount = self->_outstandingInvocationsCount;
  if (!outstandingInvocationsCount) {
    -[CPLProxyLibraryManager _invokeOutstandingInvocationsWithTaskIdentifier:]();
  }
  id v6 = v4;
  if (v4)
  {
    id v7 = [(NSMutableDictionary *)self->_outstandingInvocations objectForKey:v4];
    if (v7)
    {
      [(NSMutableDictionary *)self->_outstandingInvocations removeObjectForKey:v6];
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 138412546;
          uint64_t v19 = v6;
          __int16 v20 = 2112;
          id v21 = v7;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Got some callbacks for task with identifier %@ before we actually knew about it, redispatching: %@", (uint8_t *)&v18, 0x16u);
        }
      }
      if (([v7 isInMemoryRequest] & 1) == 0)
      {
        if ([v7 didStart]) {
          [(CPLProxyLibraryManager *)self downloadDidStartForResourceTransferTask:v6];
        }
        [v7 progress];
        if (v11 > 0.0)
        {
          [v7 progress];
          -[CPLProxyLibraryManager downloadDidProgress:forResourceTransferTask:](self, "downloadDidProgress:forResourceTransferTask:", v6);
        }
        if (![v7 didFinish]) {
          goto LABEL_18;
        }
        uint64_t v9 = [v7 finalResource];
        long long v10 = [v7 finalError];
        [(CPLProxyLibraryManager *)self downloadDidFinishForResourceTransferTask:v6 finalResource:v9 withError:v10];
        goto LABEL_17;
      }
      if ([v7 didFinish])
      {
        uint64_t v9 = [v7 finalData];
        long long v10 = [v7 finalError];
        [(CPLProxyLibraryManager *)self inMemoryDownloadDidFinishForResourceTransferTask:v6 data:v9 withError:v10];
LABEL_17:
      }
    }
LABEL_18:

    unint64_t outstandingInvocationsCount = self->_outstandingInvocationsCount;
  }
  unint64_t v12 = outstandingInvocationsCount - 1;
  self->_unint64_t outstandingInvocationsCount = v12;
  if (!v12)
  {
    if ([(NSMutableDictionary *)self->_outstandingInvocations count]) {
      BOOL v13 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      uint64_t v14 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [(NSMutableDictionary *)self->_outstandingInvocations allKeys];
        id v16 = [v15 componentsJoinedByString:@", "];
        int v18 = 138412290;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Dropping outstanding invocations for tasks with identifiers %@", (uint8_t *)&v18, 0xCu);
      }
    }
    outstandingInvocations = self->_outstandingInvocations;
    self->_outstandingInvocations = 0;
  }
}

- (void)_dispatchFailedDownloadTaskForResource:(id)a3 options:(id)a4 proposedTaskIdentifier:(id)a5 withError:(id)a6 withCompletionHandler:(id)a7
{
  id v23 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void *))a7;
  id v15 = a4;
  id v16 = [CPLResourceTransferTask alloc];
  id v17 = v16;
  if (v12)
  {
    int v18 = [(CPLResourceTransferTask *)v16 initWithResource:v23 taskIdentifier:v12];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    __int16 v20 = [v19 UUIDString];
    int v18 = [(CPLResourceTransferTask *)v17 initWithResource:v23 taskIdentifier:v20];
  }
  [(CPLResourceTransferTask *)v18 setOptions:v15];

  v14[2](v14, v18);
  id v21 = [(CPLPlatformObject *)self abstractObject];
  uint64_t v22 = [v21 resourceProgressDelegate];
  [v22 libraryManager:v21 downloadDidFinishForResourceTransferTask:v18 finalResource:v23 withError:v13];
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  int v18 = (void *)voucher_copy();
  queue = self->_queue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  v29[3] = &unk_1E60A60F0;
  v29[4] = self;
  id v30 = v13;
  id v31 = v15;
  id v32 = v16;
  id v35 = v17;
  SEL v36 = a2;
  id v33 = v14;
  id v34 = v18;
  __int16 v20 = v29;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v38 = v20;
  id v21 = queue;
  id v22 = v18;
  id v23 = v14;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v13;
  dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v21, v28);
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A60F0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  id v11 = v3;
  uint64_t v12 = v4;
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_3;
  v26[3] = &unk_1E60A60A0;
  v26[4] = v2;
  id v27 = *(id *)(a1 + 40);
  id v28 = v3[2];
  id v29 = v3[3];
  id v30 = v3[6];
  uint64_t v4 = [v2 proxyWithErrorHandler:v26];
  uint64_t v5 = *v3;
  if (v4)
  {
    uint64_t v6 = v5[15];
    if (v5[14])
    {
      v5[15] = v6 + 1;
    }
    else
    {
      if (v6) {
        __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2_cold_1();
      }
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = (void *)*((void *)*v3 + 14);
      *((void *)*v3 + 14) = v11;

      *((void *)*v3 + 15) = 1;
    }
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_322;
    v19[3] = &unk_1E60A60C8;
    id v17 = v13;
    uint64_t v18 = *(void *)(a1 + 32);
    id v20 = v17;
    uint64_t v21 = v18;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 80);
    id v24 = *(id *)(a1 + 56);
    [v4 beginDownloadForResource:v17 clientBundleID:v15 options:v14 proposedTaskIdentifier:v16 reply:v19];

    id v10 = v20;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = +[CPLErrors unknownError];
    [v5 _dispatchFailedDownloadTaskForResource:v7 options:v8 proposedTaskIdentifier:v9 withError:v10 withCompletionHandler:*(void *)(a1 + 80)];
  }
}

uint64_t __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _dispatchFailedDownloadTaskForResource:*(void *)(a1 + 40) options:*(void *)(a1 + 48) proposedTaskIdentifier:*(void *)(a1 + 56) withError:a3 withCompletionHandler:*(void *)(a1 + 64)];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invokeOutstandingInvocationsWithTaskIdentifier:0];
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_322(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = [(CPLResourceTransferTask *)[CPLProxyResourceTransferTask alloc] initWithResource:*(void *)(a1 + 32) taskIdentifier:v8];
    [(CPLProxyResourceTransferTask *)v3 setProxyLibraryManager:*(void *)(a1 + 40)];
    [(CPLResourceTransferTask *)v3 setOptions:*(void *)(a1 + 48)];
    if (![*(id *)(*(void *)(a1 + 40) + 32) count]) {
      +[CPLTransaction beginTransactionWithIdentifier:@"cpl.activeresourcedownloads" description:@"resource downloads are active" keepPower:1];
    }
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v3 forKey:v8];
    [*(id *)(a1 + 40) _storeVoucher:*(void *)(a1 + 56) forTaskWithIdentifier:v8];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    id v3 = +[CPLErrors unknownError];
    [v4 _dispatchFailedDownloadTaskForResource:v5 options:v6 proposedTaskIdentifier:v7 withError:v3 withCompletionHandler:*(void *)(a1 + 72)];
  }

  [*(id *)(a1 + 40) _invokeOutstandingInvocationsWithTaskIdentifier:v8];
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v29 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = objc_opt_class();
  uint64_t v18 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  long long v43 = ___CPLProgressForAsyncCall_block_invoke;
  long long v44 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v45 = v17;
  SEL v46 = a2;
  [v18 setCancellationHandler:&block];
  queue = self->_queue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  long long v20 = *(_OWORD *)&a6->var0.var3;
  long long v38 = *(_OWORD *)&a6->var0.var0;
  v31[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v31[3] = &unk_1E60A6190;
  v31[4] = self;
  id v32 = v18;
  id v36 = v16;
  unint64_t v37 = a4;
  id v33 = v29;
  id v34 = v14;
  long long v39 = v20;
  long long v40 = *(_OWORD *)&a6->var1.var1;
  id v35 = v15;
  uint64_t v21 = v31;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  long long v43 = __cpl_dispatch_async_block_invoke;
  long long v44 = &unk_1E60A6978;
  id v45 = v21;
  id v22 = queue;
  id v23 = v15;
  id v24 = v14;
  id v25 = v29;
  id v26 = v18;
  id v27 = v16;
  dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v22, v28);
}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60A6190;
  v6[4] = v2;
  id v11 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 80);
  id v8 = v3;
  uint64_t v12 = v4;
  id v9 = *(id *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v13 = *(_OWORD *)(a1 + 88);
  long long v14 = v5;
  long long v15 = *(_OWORD *)(a1 + 120);
  id v10 = *(id *)(a1 + 64);
  [v2 _dispatchBlockWhenOpen:v6];
}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_3;
  v22[3] = &unk_1E60A6118;
  id v24 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v22];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v5 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_4;
    v11[3] = &unk_1E60A6168;
    id v12 = v3;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 80);
    id v13 = v6;
    uint64_t v18 = v7;
    id v14 = *(id *)(a1 + 56);
    long long v8 = *(_OWORD *)(a1 + 104);
    long long v19 = *(_OWORD *)(a1 + 88);
    long long v20 = v8;
    long long v21 = *(_OWORD *)(a1 + 120);
    id v15 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 72);
    if (v9)
    {
      id v10 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v9 + 16))(v9, 0, 0, 0, 0, v10);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void, void, void, void, uint64_t))(v4 + 16))(v4, 0, 0, 0, 0, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  id v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_5;
  v9[3] = &unk_1E60A6140;
  uint64_t v6 = *(void *)(a1 + 80);
  id v11 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 104);
  v8[0] = *(_OWORD *)(a1 + 88);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 120);
  [v2 getStreamingURLForResource:v3 intent:v6 hints:v4 timeRange:v8 clientBundleID:v5 completionHandler:v9];
}

uint64_t __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = ___CPLProgressForAsyncCall_block_invoke;
  id v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v27 = v10;
  SEL v28 = a2;
  [v11 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke;
  v18[3] = &unk_1E60A61E0;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v9;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  id v13 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __cpl_dispatch_async_block_invoke;
  id v26 = &unk_1E60A6978;
  id v27 = v13;
  id v14 = queue;
  id v15 = v11;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v17);
}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A61E0;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A61E0;
    id v9 = v3;
    long long v12 = *(_OWORD *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      long long v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_5;
  v5[3] = &unk_1E60A61B8;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v2 rampingRequestForResourceType:v3 numRequested:v4 completionHandler:v5];
}

uint64_t __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)_dispatchFailedInMemoryDownloadTaskForResource:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  long long v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [CPLResourceTransferTask alloc];
  long long v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  id v16 = [(CPLResourceTransferTask *)v11 initWithResource:v10 taskIdentifier:v13];

  [(CPLResourceTransferTask *)v16 setHighPriority:0];
  v8[2](v8, v16);

  id v14 = [(CPLPlatformObject *)self abstractObject];
  id v15 = [v14 resourceProgressDelegate];
  [v15 libraryManager:v14 inMemoryDownloadDidFinishForResourceTransferTask:v16 data:0 withError:v9];
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = (void *)voucher_copy();
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  v21[3] = &unk_1E60A6258;
  v21[4] = self;
  id v22 = v9;
  id v25 = v11;
  SEL v26 = a2;
  id v23 = v10;
  id v24 = v12;
  id v14 = v21;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v28 = v14;
  id v15 = queue;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v20);
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6258;
  void v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v9 = v3;
  uint64_t v10 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_3;
  v20[3] = &unk_1E60A6208;
  v20[4] = v2;
  id v21 = *(id *)(a1 + 40);
  id v22 = v3[4];
  uint64_t v4 = [v2 proxyWithErrorHandler:v20];
  uint64_t v5 = *v3;
  if (v4)
  {
    uint64_t v6 = v5[15];
    if (v5[14])
    {
      v5[15] = v6 + 1;
    }
    else
    {
      if (v6) {
        __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2_cold_1();
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = (void *)*((void *)*v3 + 14);
      *((void *)*v3 + 14) = v9;

      *((void *)*v3 + 15) = 1;
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_330;
    v15[3] = &unk_1E60A6230;
    id v13 = v11;
    uint64_t v14 = *(void *)(a1 + 32);
    id v16 = v13;
    uint64_t v17 = v14;
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    [v4 beginInMemoryDownloadOfResource:v13 clientBundleID:v12 reply:v15];

    id v8 = v16;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = +[CPLErrors unknownError];
    [v5 _dispatchFailedInMemoryDownloadTaskForResource:v7 withError:v8 withCompletionHandler:*(void *)(a1 + 64)];
  }
}

uint64_t __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _dispatchFailedInMemoryDownloadTaskForResource:*(void *)(a1 + 40) withError:a3 withCompletionHandler:*(void *)(a1 + 48)];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invokeOutstandingInvocationsWithTaskIdentifier:0];
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_330(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [(CPLResourceTransferTask *)[CPLProxyResourceTransferTask alloc] initWithResource:*(void *)(a1 + 32) taskIdentifier:v7];
    [(CPLProxyResourceTransferTask *)v3 setProxyLibraryManager:*(void *)(a1 + 40)];
    [(CPLResourceTransferTask *)v3 setHighPriority:0];
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:v3 forKey:v7];
    [*(id *)(a1 + 40) _storeVoucher:*(void *)(a1 + 48) forTaskWithIdentifier:v7];
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, CPLProxyResourceTransferTask *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v3 = +[CPLErrors unknownError];
    [v5 _dispatchFailedInMemoryDownloadTaskForResource:v6 withError:v3 withCompletionHandler:*(void *)(a1 + 56)];
  }

  [*(id *)(a1 + 40) _invokeOutstandingInvocationsWithTaskIdentifier:v7];
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 resolveLocalScopedIdentifiersForCloudScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
}

uint64_t __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6280;
  id v17 = v8;
  id v18 = v9;
  v16[4] = self;
  BOOL v19 = a4;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6280;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 getMappedScopedIdentifiersForScopedIdentifiers:*(void *)(a1 + 40) inAreLocalIdentifiers:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      char v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
}

uint64_t __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  id v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A62A8;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 createScope:v3 completionHandler:v4];
}

uint64_t __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  id v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A62A8;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 updateShareForScope:v3 completionHandler:v4];
}

uint64_t __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke;
  v18[3] = &unk_1E60A6348;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v8;
  id v21 = v9;
  BOOL v22 = a4;
  id v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v24 = v12;
  id v13 = queue;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6348;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 64);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60A6118;
  id v16 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v14];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6320;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    char v13 = *(unsigned char *)(a1 + 64);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      char v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_5;
  v5[3] = &unk_1E60A5D10;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 deleteScopeWithIdentifier:v3 forced:v4 completionHandler:v5];
}

uint64_t __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  char v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A62A8;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 refreshScopeWithIdentifier:v3 completionHandler:v4];
}

uint64_t __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  char v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A62A8;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchSharedScopeFromShareURL:v3 completionHandler:v4];
}

uint64_t __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  char v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A5D10;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 acceptSharedScope:v3 completionHandler:v4];
}

uint64_t __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = ___CPLProgressForAsyncCall_block_invoke;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  id v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __cpl_dispatch_async_block_invoke;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E60A6118;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v12];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6078;
    id v9 = v3;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60A62A8;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 fetchExistingSharedLibraryScopeWithCompletionHandler:v3];
}

uint64_t __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v20[3] = &unk_1E60A6398;
  v20[4] = self;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  int64_t v24 = a4;
  int64_t v25 = a5;
  id v14 = v20;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v27 = v14;
  id v15 = queue;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);
}

void __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6398;
  void v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A5F88;
  id v14 = *(id *)(a1 + 56);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6370;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    long long v12 = *(_OWORD *)(a1 + 64);
    id v11 = *(id *)(a1 + 56);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];

    id v6 = v9;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    id v6 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v6);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startExitFromSharedScopeWithIdentifier:*(void *)(a1 + 40) retentionPolicy:*(void *)(a1 + 56) exitSource:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v24[3] = &unk_1E60A63E8;
  v24[4] = self;
  id v25 = v15;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  int64_t v29 = a5;
  int64_t v30 = a6;
  id v17 = v24;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v32 = v17;
  id v18 = queue;
  id v19 = v13;
  id v20 = v12;
  id v21 = v15;
  id v22 = v14;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);
}

void __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A63E8;
  void v3[4] = v2;
  id v7 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 72);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60A5F88;
  id v15 = *(id *)(a1 + 64);
  uint64_t v3 = [v2 proxyWithErrorHandler:v14];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A63C0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    long long v13 = *(_OWORD *)(a1 + 72);
    id v12 = *(id *)(a1 + 64);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];

    id v6 = v9;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7)
  {
    id v6 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v6);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeParticipants:*(void *)(a1 + 40) fromSharedScopeWithIdentifier:*(void *)(a1 + 48) retentionPolicy:*(void *)(a1 + 64) exitSource:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 56)];
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = ___CPLProgressForAsyncCall_block_invoke;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  id v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __cpl_dispatch_async_block_invoke;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E60A6118;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v12];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6078;
    id v9 = v3;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60A6410;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 sharedLibraryRampCheckWithCompletionHandler:v3];
}

uint64_t __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6438;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a4;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v8 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A5F88;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 getStatusForPendingRecordsSharedToScopeWithIdentifier:*(void *)(a1 + 40) maximumCount:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
}

uint64_t __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int64_t v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int64_t v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  id v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  void v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A6460;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 queryUserDetailsForShareParticipants:v3 completionHandler:v4];
}

uint64_t __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke;
  v18[3] = &unk_1E60A64B0;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  id v13 = queue;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A64B0;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_3;
  id v7 = &unk_1E60A6488;
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 proxyWithErrorHandler:&v4];
  objc_msgSend(v3, "testKey:value:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v4, v5, v6, v7);
}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138413058;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to execute test function %@(%@): %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  int v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3;
  v6[3] = &unk_1E60A64D8;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  long long v4 = [v2 proxyWithErrorHandler:v6];
  [v4 getTargetsForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to execute %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6528;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a4;
  __int16 v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6528;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60A6500;
  uint64_t v2 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v18];
  id v4 = v3;
  if (v3)
  {
    [v3 deleteResources:*(void *)(a1 + 40) checkServerIfNecessary:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v7 = +[CPLErrors unknownError];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      *(_DWORD *)long long buf = 138412802;
      id v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to delete %lu resources: %@", buf, 0x20u);
    }
  }
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6528;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a4;
  uint64_t v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  uint64_t v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6528;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60A6500;
  uint64_t v2 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v18];
  id v4 = v3;
  if (v3)
  {
    [v3 checkResourcesAreSafeToPrune:*(void *)(a1 + 40) checkServerIfNecessary:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v7 = +[CPLErrors unknownError];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      *(_DWORD *)long long buf = 138412802;
      id v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check purgeable %lu resources: %@", buf, 0x20u);
    }
  }
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetStatus
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __37__CPLProxyLibraryManager_resetStatus__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __37__CPLProxyLibraryManager_resetStatus__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CPLProxyLibraryManager_resetStatus__block_invoke_2;
  v3[3] = &unk_1E60A5DD8;
  void v3[4] = v1;
  return [v1 _dispatchBlockWhenOpen:v3];
}

void __37__CPLProxyLibraryManager_resetStatus__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) proxyWithErrorHandler:&__block_literal_global_336];
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 resetStatus];
  }
  else if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v4, 2u);
    }
  }
}

void __37__CPLProxyLibraryManager_resetStatus__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "%@ failed to reset status: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)startSyncSession
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __42__CPLProxyLibraryManager_startSyncSession__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __42__CPLProxyLibraryManager_startSyncSession__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CPLProxyLibraryManager_startSyncSession__block_invoke_2;
  v3[3] = &unk_1E60A5DD8;
  void v3[4] = v1;
  return [v1 _dispatchBlockWhenOpen:v3];
}

void __42__CPLProxyLibraryManager_startSyncSession__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) proxyWithErrorHandler:&__block_literal_global_338];
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 startSyncSession];
  }
  else if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v4, 2u);
    }
  }
}

void __42__CPLProxyLibraryManager_startSyncSession__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "%@ failed to start a sync session: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)noteClientReceivedNotificationOfServerChanges
{
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "-[CPLLibraryManager noteClientReceivedNotificationOfServerChanges] should not be called in this configuration", v3, 2u);
    }
  }
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke;
  v7[3] = &unk_1E60A6570;
  void v7[4] = self;
  void v7[5] = a2;
  BOOL v8 = a3;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_2;
  v2[3] = &unk_1E60A6570;
  long long v3 = *(_OWORD *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 48);
  return [(id)v3 _dispatchBlockWhenOpen:v2];
}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_2(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72) == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_3;
    v9[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v9[4] = *(void *)(a1 + 40);
    long long v3 = [(id)v2 proxyWithErrorHandler:v9];
    char v4 = v3;
    if (v3)
    {
      [v3 noteClientIsInForegroundQuietly:*(unsigned __int8 *)(a1 + 48)];
      *(unsigned char *)(*(void *)(a1 + 32) + 80) = *(unsigned char *)(a1 + 48);
LABEL_16:

      return;
    }
    if (_CPLSilentLogging) {
      goto LABEL_16;
    }
    dispatch_block_t v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
LABEL_14:
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(v2 + 80) && !*(unsigned char *)(a1 + 48))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_340;
    v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v7[4] = *(void *)(a1 + 40);
    id v5 = [(id)v2 proxyWithErrorHandler:v7];
    char v4 = v5;
    if (v5)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
      [v5 noteClientIsInForegroundQuietly:0];
      [v4 noteClientIsInBackground];
      goto LABEL_16;
    }
    if (_CPLSilentLogging) {
      goto LABEL_16;
    }
    dispatch_block_t v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)noteClientIsInBackground
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  long long v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  char v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_2;
  v2[3] = &unk_1E60A6598;
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:v2];
}

void __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 72);
  if (v3)
  {
    *(void *)(v2 + 72) = v3 - 1;
    char v4 = *(void **)(a1 + 32);
    if (v4[9]) {
      return;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v11[4] = *(void *)(a1 + 40);
    dispatch_block_t v5 = [v4 proxyWithErrorHandler:v11];
    id v6 = v5;
    if (v5)
    {
      [v5 noteClientIsInBackground];
      *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
      goto LABEL_10;
    }
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    int v7 = __CPLManagerOSLogDomain();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)long long buf = 0;
    id v8 = "Proxy has disappeared";
    int v9 = v7;
    uint32_t v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging) {
    return;
  }
  id v6 = __CPLManagerOSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)long long buf = 138412290;
    __int16 v13 = v7;
    id v8 = "%@ has been called too many times";
    int v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_8;
  }
LABEL_10:
}

void __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60A65C0;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  int v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_2;
  v5[3] = &unk_1E60A65C0;
  void v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 88) addObject:a1[5]];
  if ([*(id *)(a1[4] + 88) countForObject:a1[5]] == 1)
  {
    uint64_t v2 = (void *)a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_3;
    v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v7[4] = a1[6];
    id v3 = [v2 proxyWithErrorHandler:v7];
    uint64_t v4 = v3;
    if (v3)
    {
      [v3 disableSynchronizationWithReason:a1[5]];
    }
    else if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
      }
    }
  }
}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60A65C0;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_2;
  v5[3] = &unk_1E60A65C0;
  void v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 88) countForObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 88) countForObject:*(void *)(a1 + 40)]) {
      return;
    }
    uint64_t v2 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_3;
    _OWORD v8[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v8[4] = *(void *)(a1 + 48);
    id v3 = [v2 proxyWithErrorHandler:v8];
    uint64_t v4 = v3;
    if (v3)
    {
      [v3 enableSynchronizationWithReason:*(void *)(a1 + 40)];
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    uint64_t v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      dispatch_block_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "%@ has been called too many times with reason '%@'", buf, 0x16u);
    }
  }
}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)disableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __41__CPLProxyLibraryManager_disableMingling__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke_2;
  v2[3] = &unk_1E60A6598;
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:v2];
}

void __41__CPLProxyLibraryManager_disableMingling__block_invoke_2(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 96);
  v1 = *(void **)(a1 + 32);
  if (v1[12] == 1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke_3;
    v6[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v6[4] = *(void *)(a1 + 40);
    uint64_t v2 = [v1 proxyWithErrorHandler:v6];
    id v3 = v2;
    if (v2)
    {
      [v2 disableMingling];
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_block_t v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v5, 2u);
      }
    }
  }
}

void __41__CPLProxyLibraryManager_disableMingling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)enableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __40__CPLProxyLibraryManager_enableMingling__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke_2;
  v2[3] = &unk_1E60A6598;
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:v2];
}

void __40__CPLProxyLibraryManager_enableMingling__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  if (v3)
  {
    *(void *)(v2 + 96) = v3 - 1;
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4[12]) {
      return;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v11[4] = *(void *)(a1 + 40);
    dispatch_block_t v5 = [v4 proxyWithErrorHandler:v11];
    id v6 = v5;
    if (v5)
    {
      [v5 enableMingling];
      goto LABEL_10;
    }
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)long long buf = 0;
    id v8 = "Proxy has disappeared";
    int v9 = v7;
    uint32_t v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging) {
    return;
  }
  id v6 = __CPLManagerOSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)long long buf = 138412290;
    __int16 v13 = v7;
    id v8 = "%@ has been called too many times";
    int v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_8;
  }
LABEL_10:
}

void __40__CPLProxyLibraryManager_enableMingling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)noteClientIsBeginningSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_2;
  v2[3] = &unk_1E60A6598;
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:v2];
}

void __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_2(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 104);
  v1 = *(void **)(a1 + 32);
  if (v1[13] == 1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_3;
    v6[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v6[4] = *(void *)(a1 + 40);
    uint64_t v2 = [v1 proxyWithErrorHandler:v6];
    uint64_t v3 = v2;
    if (v2)
    {
      [v2 noteClientIsBeginningSignificantWork];
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_block_t v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v5, 2u);
      }
    }
  }
}

void __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60A5F60;
  void v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _dispatchBlockWhenOpen:v4];
}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  void v7[4] = a1[6];
  long long v3 = [v2 proxyWithErrorHandler:v7];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 getSystemBudgetsWithCompletionHandler:a1[5]];
  }
  else if (!_CPLSilentLogging)
  {
    long long v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }
  }
}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke;
  _OWORD v8[3] = &unk_1E60A65E8;
  void v8[4] = self;
  void v8[5] = a2;
  BOOL v9 = a3;
  v8[6] = a4;
  id v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v11 = v5;
  id v6 = queue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

uint64_t __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_2;
  v2[3] = &unk_1E60A65E8;
  long long v3 = *(_OWORD *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 48);
  return [(id)v3 _dispatchBlockWhenOpen:v2];
}

void __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  void v7[4] = *(void *)(a1 + 40);
  long long v3 = [v2 proxyWithErrorHandler:v7];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setShouldOverride:*(unsigned __int8 *)(a1 + 56) forSystemBudgets:*(void *)(a1 + 48)];
  }
  else if (!_CPLSilentLogging)
  {
    char v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }
  }
}

void __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)noteClientIsEndingSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  long long v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_2;
  v2[3] = &unk_1E60A6598;
  return [*(id *)(a1 + 32) _dispatchBlockWhenOpen:v2];
}

void __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 104);
  if (v3)
  {
    *(void *)(v2 + 104) = v3 - 1;
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4[13]) {
      return;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    void v11[4] = *(void *)(a1 + 40);
    dispatch_block_t v5 = [v4 proxyWithErrorHandler:v11];
    id v6 = v5;
    if (v5)
    {
      [v5 noteClientIsEndingSignificantWork];
      goto LABEL_10;
    }
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    dispatch_block_t v7 = __CPLManagerOSLogDomain();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)long long buf = 0;
    id v8 = "Proxy has disappeared";
    int v9 = v7;
    uint32_t v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging) {
    return;
  }
  id v6 = __CPLManagerOSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    dispatch_block_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)long long buf = 138412290;
    __int16 v13 = v7;
    id v8 = "%@ has been called too many times";
    int v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_8;
  }
LABEL_10:
}

void __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  dispatch_block_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60A5F60;
  void v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _dispatchBlockWhenOpen:v4];
}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E60A64D8;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v9;
  long long v12 = v9;
  uint64_t v4 = [v2 proxyWithErrorHandler:v11];
  long long v5 = v4;
  if (v4)
  {
    [v4 checkHasBackgroundDownloadOperationsWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v10 = 138412802;
      id v11 = v5;
      __int16 v12 = 2112;
      SEL v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check ongoing download operations %@: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  int v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60A64D8;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v9;
  long long v12 = v9;
  long long v4 = [v2 proxyWithErrorHandler:v11];
  id v5 = v4;
  if (v4)
  {
    [v4 getStatusForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v10 = 138412802;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check statuses %@: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60A5F60;
  void v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _dispatchBlockWhenOpen:v4];
}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E60A64D8;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v9;
  long long v12 = v9;
  long long v4 = [v2 proxyWithErrorHandler:v11];
  long long v5 = v4;
  if (v4)
  {
    [v4 getChangedStatusesWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v10 = 138412802;
      id v11 = v5;
      __int16 v12 = 2112;
      SEL v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check statuses %@: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke;
  v11[3] = &unk_1E60A65C0;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_2;
  v4[3] = &unk_1E60A65C0;
  void v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _dispatchBlockWhenOpen:v4];
}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  void v7[4] = a1[6];
  long long v3 = [v2 proxyWithErrorHandler:v7];
  long long v4 = v3;
  if (v3)
  {
    [v3 acknowledgeChangedStatuses:a1[5]];
  }
  else if (!_CPLSilentLogging)
  {
    long long v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }
  }
}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to acknowledge changed statuses %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v7 = a3;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke;
  v13[3] = &unk_1E60A6610;
  id v14 = v7;
  SEL v15 = a2;
  void v13[4] = self;
  BOOL v16 = a4;
  int v9 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);
}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_2;
  v5[3] = &unk_1E60A6610;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  char v7 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  void v7[4] = *(void *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v7];
  long long v4 = v3;
  if (v3)
  {
    [v3 addStatusChangesForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) persist:*(unsigned __int8 *)(a1 + 56)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }
  }
}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    char v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      dispatch_block_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to acknowledge changed statuses %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (BOOL)_setStatusFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"status"];
  id v6 = [v4 objectForKeyedSubscript:@"error"];

  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    id v8 = [MEMORY[0x1E4F1CA98] null];

    if (v6 == v8)
    {

      id v6 = 0;
    }
    int v9 = [(CPLPlatformObject *)self abstractObject];
    char v10 = [v9 _setStatus:v7 andError:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  char v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  __int16 v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60A64D8;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v9;
  long long v12 = v9;
  long long v4 = [v2 proxyWithErrorHandler:v11];
  id v5 = v4;
  if (v4)
  {
    [v4 getScopeStatusCountsForScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      long long v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get scope status counts %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invokeSyncOutstandingInvocationsWithTaskIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t syncOutstandingInvocationsCount = self->_syncOutstandingInvocationsCount;
  if (!syncOutstandingInvocationsCount) {
    -[CPLProxyLibraryManager _invokeSyncOutstandingInvocationsWithTaskIdentifier:]();
  }
  id v6 = v4;
  if (v4)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_syncOutstandingInvocations objectForKey:v4];
    if (v7)
    {
      [(NSMutableDictionary *)self->_syncOutstandingInvocations removeObjectForKey:v6];
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 138412546;
          id v17 = v6;
          __int16 v18 = 2112;
          id v19 = v7;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Got some callbacks for task with identifier %@ before we actually knew about it, redispatching: %@", (uint8_t *)&v16, 0x16u);
        }
      }
      if ([v7 didFinish])
      {
        int v9 = [v7 errors];
        [(CPLProxyLibraryManager *)self forceSyncDidFinishForTask:v6 withErrors:v9];
      }
    }

    unint64_t syncOutstandingInvocationsCount = self->_syncOutstandingInvocationsCount;
  }
  unint64_t v10 = syncOutstandingInvocationsCount - 1;
  self->_unint64_t syncOutstandingInvocationsCount = v10;
  if (!v10)
  {
    if ([(NSMutableDictionary *)self->_syncOutstandingInvocations count]) {
      BOOL v11 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      long long v12 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = [(NSMutableDictionary *)self->_syncOutstandingInvocations allKeys];
        id v14 = [v13 componentsJoinedByString:@", "];
        int v16 = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Dropping outstanding invocations for tasks with identifiers %@", (uint8_t *)&v16, 0xCu);
      }
    }
    syncOutstandingInvocations = self->_syncOutstandingInvocations;
    self->_syncOutstandingInvocations = 0;
  }
}

- (void)_dispatchFailedForceSyncTaskForScopeIdentifiers:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = (void (**)(id, CPLForceSyncTask *))a5;
  id v9 = a4;
  id v10 = a3;
  int v16 = [[CPLForceSyncTask alloc] initWithScopeIdentifiers:v10];
  BOOL v11 = [MEMORY[0x1E4F29128] UUID];
  long long v12 = [v11 UUIDString];
  [(CPLForceSyncTask *)v16 setTaskIdentifier:v12];

  v8[2](v8, v16);
  __int16 v13 = [(CPLPlatformObject *)self abstractObject];
  id v14 = [v13 forceSyncDelegate];
  uint64_t v15 = +[CPLErrors errorsForIdentifiers:v10 error:v9];

  [v14 libraryManager:v13 didFinishForceSyncTask:v16 withErrors:v15];
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)voucher_copy();
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  v17[3] = &unk_1E60A6638;
  v17[4] = self;
  id v18 = v7;
  id v20 = v8;
  SEL v21 = a2;
  id v19 = v9;
  BOOL v11 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v23 = v11;
  long long v12 = queue;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v16);
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6638;
  void v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v9 = v4;
  id v7 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2(id *a1)
{
  id v3 = a1 + 4;
  id v2 = a1[4];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_3;
  v19[3] = &unk_1E60A6208;
  void v19[4] = v2;
  id v20 = a1[5];
  id v21 = v3[3];
  uint64_t v4 = [v2 proxyWithErrorHandler:v19];
  id v5 = *v3;
  if (v4)
  {
    uint64_t v6 = v5[17];
    if (v5[16])
    {
      v5[17] = v6 + 1;
    }
    else
    {
      if (v6) {
        __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2_cold_1();
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (void *)*((void *)*v3 + 16);
      *((void *)*v3 + 16) = v9;

      *((void *)*v3 + 17) = 1;
    }
    id v11 = a1[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_349;
    v14[3] = &unk_1E60A6230;
    id v12 = v11;
    id v13 = a1[4];
    id v15 = v12;
    id v16 = v13;
    id v17 = a1[6];
    id v18 = a1[7];
    [v4 forceSyncForScopeIdentifiers:v12 reply:v14];

    id v8 = v15;
  }
  else
  {
    id v7 = a1[5];
    id v8 = +[CPLErrors unknownError];
    [v5 _dispatchFailedForceSyncTaskForScopeIdentifiers:v7 withError:v8 withCompletionHandler:a1[7]];
  }
}

uint64_t __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _dispatchFailedForceSyncTaskForScopeIdentifiers:*(void *)(a1 + 40) withError:a3 withCompletionHandler:*(void *)(a1 + 48)];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invokeSyncOutstandingInvocationsWithTaskIdentifier:0];
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_349(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = [(CPLForceSyncTask *)[CPLProxyForceSyncTask alloc] initWithScopeIdentifiers:*(void *)(a1 + 32)];
    [(CPLForceSyncTask *)v4 setTaskIdentifier:v3];
    [(CPLProxyForceSyncTask *)v4 setProxyLibraryManager:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:v4 forKeyedSubscript:v3];
    [*(id *)(a1 + 40) _storeVoucher:*(void *)(a1 + 48) forTaskWithIdentifier:v3];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    id v7 = 0;
    uint64_t v4 = +[CPLErrors unknownError];
    [v5 _dispatchFailedForceSyncTaskForScopeIdentifiers:v6 withError:v4 withCompletionHandler:*(void *)(a1 + 56)];
  }

  [*(id *)(a1 + 40) _invokeSyncOutstandingInvocationsWithTaskIdentifier:a2];
}

- (void)downloadDidStartForResourceTransferTask:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke;
  v11[3] = &unk_1E60A65C0;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60A65C0;
  void v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_3;
    v13[3] = &unk_1E60A6660;
    id v14 = v2;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v15 = v6;
    uint64_t v16 = v7;
    [v4 _withVoucherForTaskWithIdentifier:v5 do:v13];

    id v8 = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (v4[15])
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        dispatch_block_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        id v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);
      }
    }
    id v8 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
    [(CPLProxyLibraryManagerOutstandingInvocation *)v8 setDidStart:1];
    [*(id *)(*(void *)(a1 + 32) + 112) setObject:v8 forKey:*(void *)(a1 + 40)];
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    id v8 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1B4CAC000, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Download did start for %@ with task identifier %@.", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = [*(id *)(a1 + 48) abstractObject];
  id v6 = [v5 resourceProgressDelegate];
  [v6 libraryManager:v5 downloadDidStartForResourceTransferTask:*(void *)(a1 + 32)];
}

- (void)downloadDidProgress:(float)a3 forResourceTransferTask:(id)a4
{
  id v7 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke;
  v13[3] = &unk_1E60A66B0;
  void v13[4] = self;
  id v14 = v7;
  float v16 = a3;
  SEL v15 = a2;
  __int16 v9 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);
}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60A66B0;
  void v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_3;
    v14[3] = &unk_1E60A6688;
    int v18 = *(_DWORD *)(a1 + 56);
    SEL v15 = v2;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v16 = v6;
    uint64_t v17 = v7;
    [(id)v4 _withVoucherForTaskWithIdentifier:v5 do:v14];

    int v8 = v15;
LABEL_14:

    goto LABEL_15;
  }
  if (*(void *)(v4 + 120))
  {
    if (!_CPLSilentLogging)
    {
      __int16 v9 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);
      }
      uint64_t v4 = *(void *)(a1 + 32);
    }
    int v8 = [*(id *)(v4 + 112) objectForKey:*(void *)(a1 + 40)];
    if (!v8)
    {
      int v8 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
      [*(id *)(*(void *)(a1 + 32) + 112) setObject:v8 forKey:*(void *)(a1 + 40)];
    }
    LODWORD(v12) = *(_DWORD *)(a1 + 56);
    [(CPLProxyLibraryManagerOutstandingInvocation *)v8 setProgress:v12];
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    int v8 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      SEL v13 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1B4CAC000, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      double v3 = (float)(*(float *)(a1 + 56) * 100.0);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 134218498;
      double v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Download did progress to %.0f%% for %@ with task identifier %@.", (uint8_t *)&v9, 0x20u);
    }
  }
  id v6 = [*(id *)(a1 + 48) abstractObject];
  uint64_t v7 = [v6 resourceProgressDelegate];
  if (objc_opt_respondsToSelector())
  {
    LODWORD(v8) = *(_DWORD *)(a1 + 56);
    [v7 libraryManager:v6 downloadDidProgress:*(void *)(a1 + 32) forResourceTransferTask:v8];
  }
}

- (void)downloadDidFinishForResourceTransferTask:(id)a3 finalResource:(id)a4 withError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke;
  v19[3] = &unk_1E60A6700;
  void v19[4] = self;
  id v20 = v11;
  id v21 = v9;
  id v22 = v10;
  SEL v23 = a2;
  __int16 v13 = v19;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v25 = v13;
  uint64_t v14 = queue;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);
}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_2;
  v7[3] = &unk_1E60A6700;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v12 = v6;
  [v2 _dispatchBlockWhenOpen:v7];
}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) cplReinflatedErrorForXPC];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:*(void *)(a1 + 48)];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_3;
    v14[3] = &unk_1E60A66D8;
    id v15 = v3;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v7 = v2;
    uint64_t v8 = *(void *)(a1 + 40);
    id v18 = v7;
    uint64_t v19 = v8;
    [(id)v5 _withVoucherForTaskWithIdentifier:v6 do:v14];
    [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _dropVoucherForTaskWithIdentifier:*(void *)(a1 + 48)];
    if (![*(id *)(*(void *)(a1 + 40) + 32) count]) {
      +[CPLTransaction endTransactionWithIdentifier:@"cpl.activeresourcedownloads"];
    }

    uint64_t v9 = v15;
LABEL_16:

    goto LABEL_17;
  }
  if (*(void *)(v5 + 120))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        id v21 = v11;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);
      }
      uint64_t v5 = *(void *)(a1 + 40);
    }
    uint64_t v9 = [*(id *)(v5 + 112) objectForKey:*(void *)(a1 + 48)];
    if (!v9)
    {
      uint64_t v9 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
      [*(id *)(*(void *)(a1 + 40) + 112) setObject:v9 forKey:*(void *)(a1 + 48)];
    }
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setDidFinish:1];
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setFinalError:v2];
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setFinalResource:*(void *)(a1 + 56)];
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    uint64_t v9 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_1B4CAC000, &v9->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      int v14 = 138413058;
      uint64_t v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Download did finish for %@ with task identifier %@. Final resource: %@ / Error: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  id v7 = [*(id *)(a1 + 64) abstractObject];
  uint64_t v8 = [v7 resourceProgressDelegate];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = v10;
  id v13 = v9;
  [v8 libraryManager:v7 downloadDidFinishForResourceTransferTask:v13 finalResource:v12 withError:v11];
}

- (void)inMemoryDownloadDidFinishForResourceTransferTask:(id)a3 data:(id)a4 withError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke;
  v19[3] = &unk_1E60A6700;
  void v19[4] = self;
  id v20 = v11;
  id v21 = v9;
  id v22 = v10;
  SEL v23 = a2;
  id v13 = v19;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v25 = v13;
  int v14 = queue;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);
}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_2;
  v7[3] = &unk_1E60A6700;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v12 = v6;
  [v2 _dispatchBlockWhenOpen:v7];
}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) cplReinflatedErrorForXPC];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 48)];
  uint64_t v4 = v3;
  id v5 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_3;
    v14[3] = &unk_1E60A66D8;
    id v15 = v3;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v7 = v2;
    uint64_t v8 = *(void *)(a1 + 40);
    id v18 = v7;
    uint64_t v19 = v8;
    [v5 _withVoucherForTaskWithIdentifier:v6 do:v14];
    [*(id *)(a1 + 40) _dropVoucherForTaskWithIdentifier:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:*(void *)(a1 + 48)];

    uint64_t v9 = v15;
LABEL_12:

    goto LABEL_13;
  }
  if (v5[15])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        id v21 = v11;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);
      }
    }
    uint64_t v9 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setInMemoryRequest:1];
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setDidFinish:1];
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setFinalError:v2];
    [(CPLProxyLibraryManagerOutstandingInvocation *)v9 setFinalData:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 40) + 112) setObject:v9 forKey:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    uint64_t v9 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_1B4CAC000, &v9->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(a1 + 48) length];
      uint64_t v6 = *(void *)(a1 + 56);
      int v9 = 138413058;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "In-memory download did finish for %@ with task identifier %@. %lu bytes / Error: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  id v7 = [*(id *)(a1 + 64) abstractObject];
  uint64_t v8 = [v7 resourceProgressDelegate];
  [v8 libraryManager:v7 inMemoryDownloadDidFinishForResourceTransferTask:*(void *)(a1 + 32) data:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

- (void)backgroundDownloadDidFinishForResource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) abstractObject];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Background download for %@ did finish", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = [v2 resourceProgressDelegate];
  [v5 libraryManager:v2 backgroundDownloadDidFinishForResource:*(void *)(a1 + 40)];
}

- (void)backgroundDownloadDidFailForResource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  int v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) abstractObject];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Background download for %@ did finish", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = [v2 resourceProgressDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 libraryManager:v2 backgroundDownloadDidFailForResource:*(void *)(a1 + 40)];
  }
}

- (id)_uploadTaskDidStartForResource:(id)a3 withTaskIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_uploadTasks objectForKey:v7];
  if (!v8)
  {
    uint64_t v8 = [(CPLResourceTransferTask *)[CPLProxyResourceTransferTask alloc] initWithResource:v6 taskIdentifier:v7];
    [(CPLProxyResourceTransferTask *)v8 setProxyLibraryManager:self];
    [(NSMutableDictionary *)self->_uploadTasks setObject:v8 forKey:v7];
    dispatch_block_t v9 = [(CPLPlatformObject *)self abstractObject];
    uint64_t v10 = [v9 resourceProgressDelegate];
    [v10 libraryManager:v9 uploadDidStartForResourceTransferTask:v8];
  }
  return v8;
}

- (void)uploadDidStartForResource:(id)a3 withResourceTransferTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke;
  v14[3] = &unk_1E60A6660;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60A6660;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

id __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Upload task for %@ did start with identifier %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return (id)[*(id *)(a1 + 48) _uploadTaskDidStartForResource:*(void *)(a1 + 32) withTaskIdentifier:*(void *)(a1 + 40)];
}

- (void)uploadOfResource:(id)a3 didProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke;
  v16[3] = &unk_1E60A6688;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  float v19 = a4;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60A6688;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  int v9 = *(_DWORD *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Upload task for %@ with identifier %@ did progress", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v5 = [*(id *)(a1 + 48) _uploadTaskDidStartForResource:*(void *)(a1 + 32) withTaskIdentifier:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) abstractObject];
  id v7 = [v6 resourceProgressDelegate];
  if (objc_opt_respondsToSelector())
  {
    LODWORD(v8) = *(_DWORD *)(a1 + 56);
    [v7 libraryManager:v6 uploadDidProgress:v5 forResourceTransferTask:v8];
  }
}

- (void)uploadOfResource:(id)a3 didFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke;
  v18[3] = &unk_1E60A6750;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v8;
  id v21 = v9;
  uint64_t v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  uint64_t v13 = queue;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

void __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke_2;
  v5[3] = &unk_1E60A6750;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) cplReinflatedErrorForXPC];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v9 = 138412802;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v2;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Upload task for %@ with identifier %@ did finish with error %@", (uint8_t *)&v9, 0x20u);
    }
  }
  id v6 = [*(id *)(a1 + 56) _uploadTaskDidStartForResource:*(void *)(a1 + 40) withTaskIdentifier:*(void *)(a1 + 48)];
  id v7 = [*(id *)(a1 + 56) abstractObject];
  id v8 = [v7 resourceProgressDelegate];
  [v8 libraryManager:v7 uploadDidFinishForResourceTransferTask:v6 withError:v2];
  [*(id *)(*(void *)(a1 + 56) + 48) removeObjectForKey:*(void *)(a1 + 48)];
}

- (void)libraryManagerHasChangesToPull
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke_2;
  v3[3] = &unk_1E60A5DD8;
  void v3[4] = v1;
  return [v1 _dispatchBlockWhenOpen:v3];
}

void __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke_2(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_block_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changes to pull", v5, 2u);
    }
  }
  id v3 = [*(id *)(a1 + 32) abstractObject];
  uint64_t v4 = [v3 delegate];
  [v4 libraryManagerHasChangesToPull:v3];
}

- (void)libraryManagerDidUpdateStatusWithProperties:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke_2;
  v5[3] = &unk_1E60A6728;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changes status: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if ([*(id *)(a1 + 40) _setStatusFromDictionary:*(void *)(a1 + 32)])
  {
    uint64_t v4 = [*(id *)(a1 + 40) abstractObject];
    dispatch_block_t v5 = [v4 delegate];
    [v5 libraryManagerStatusDidChange:v4];
  }
}

- (void)libraryManagerDidUpdateSizeOfResourcesToUploadToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke;
  v11[3] = &unk_1E60A6778;
  void v11[4] = self;
  void v11[5] = a3;
  v11[6] = a4;
  v11[7] = a5;
  v11[8] = a6;
  v11[9] = a7;
  uint64_t v8 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v8;
  dispatch_block_t v9 = queue;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v10);
}

uint64_t __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke_2;
  v3[3] = &unk_1E60A6778;
  void v3[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  return [v1 _dispatchBlockWhenOpen:v3];
}

void __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changed size of resources to upload to %llu", (uint8_t *)&v5, 0xCu);
    }
  }
  long long v4 = [*(id *)(a1 + 32) abstractObject];
  [v4 _setSizeOfResourcesToUpload:*(void *)(a1 + 40) sizeOfOriginalResourcesToUpload:*(void *)(a1 + 48) numberOfImages:*(void *)(a1 + 56) numberOfVideos:*(void *)(a1 + 64) numberOfOtherItems:*(void *)(a1 + 72)];
}

- (void)libraryManagerHasStatusChanges
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  long long v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke_2;
  v3[3] = &unk_1E60A5DD8;
  void v3[4] = v1;
  return [v1 _dispatchBlockWhenOpen:v3];
}

void __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke_2(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_block_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has status changes", v5, 2u);
    }
  }
  uint64_t v3 = [*(id *)(a1 + 32) abstractObject];
  long long v4 = [v3 delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 libraryManagerHasStatusChanges:v3];
  }
}

- (void)forceSyncDidFinishForTask:(id)a3 withErrors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke;
  v15[3] = &unk_1E60A67C8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v7;
  SEL v18 = a2;
  dispatch_block_t v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_2;
  v7[3] = &unk_1E60A67C8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  [v2 _dispatchBlockWhenOpen:v7];
}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_3;
  v21[3] = &unk_1E60A67A0;
  id v4 = v2;
  id v22 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v21];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_4;
    v16[3] = &unk_1E60A6750;
    id v17 = v5;
    id v18 = *(id *)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 40);
    id v19 = v9;
    uint64_t v20 = v10;
    [(id)v7 _withVoucherForTaskWithIdentifier:v8 do:v16];
    [*(id *)(a1 + 40) _dropVoucherForTaskWithIdentifier:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 56) removeObjectForKey:*(void *)(a1 + 48)];

    uint64_t v11 = v17;
LABEL_14:

    goto LABEL_15;
  }
  if (*(void *)(v7 + 136))
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);
      }
      uint64_t v7 = *(void *)(a1 + 40);
    }
    uint64_t v11 = [*(id *)(v7 + 128) objectForKey:*(void *)(a1 + 48)];
    if (!v11)
    {
      uint64_t v11 = objc_alloc_init(CPLProxyLibraryManagerSyncOutstandingInvocation);
      [*(id *)(*(void *)(a1 + 40) + 128) setObject:v11 forKey:*(void *)(a1 + 48)];
    }
    [(CPLProxyLibraryManagerSyncOutstandingInvocation *)v11 setDidFinish:1];
    [(CPLProxyLibraryManagerSyncOutstandingInvocation *)v11 setErrors:v4];
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    uint64_t v11 = (CPLProxyLibraryManagerSyncOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1B4CAC000, &v11->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 cplReinflatedErrorForXPC];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v8 = 138412802;
      uint64_t v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Sync task did finish for %@ with task identifier %@. Errors: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  id v6 = [*(id *)(a1 + 56) abstractObject];
  uint64_t v7 = [v6 forceSyncDelegate];
  [v7 libraryManager:v6 didFinishForceSyncTask:*(void *)(a1 + 32) withErrors:*(void *)(a1 + 48)];
}

- (void)provideLocalResource:(id)a3 recordClassString:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  Class v11 = NSClassFromString(v9);
  if (v11 && (Class v12 = v11, ([(objc_class *)v11 isSubclassOfClass:objc_opt_class()] & 1) != 0))
  {
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke;
    v18[3] = &unk_1E60A67F0;
    void v18[4] = self;
    id v19 = v8;
    Class v21 = v12;
    id v20 = v10;
    uint64_t v14 = v18;
    *(void *)uint64_t block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __cpl_dispatch_async_block_invoke;
    id v23 = &unk_1E60A6978;
    id v24 = v14;
    uint64_t v15 = queue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v15, v16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t block = 138412546;
        *(void *)&void block[4] = v8;
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v9;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Received a request for (local) %@ with an invalid class name %@", block, 0x16u);
      }
    }
    (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, 2);
  }
}

void __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A67F0;
  void v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  [v2 _dispatchBlockWhenOpen:v5];
}

void __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) abstractObject];
  id v3 = [v2 delegate];
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        long long v7 = "Library manager has no delegate and so can't help recovering resources yet";
LABEL_14:
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 2u);
      }
LABEL_15:
    }
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        long long v7 = "Delegate does not support recovering resources yet";
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    long long v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to provide (local) %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [v3 libraryManager:v2 provideLocalResource:*(void *)(a1 + 40) recordClass:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
LABEL_17:
}

- (void)pushAllChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  long long v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60A5EE8;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abstractObject];
  id v3 = [v2 delegate];
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        id v6 = "Library manager has no delegate and so can't help pushing all changes yet";
        long long v7 = (uint8_t *)&v10;
LABEL_14:
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      }
LABEL_15:
    }
LABEL_16:
    uint64_t v8 = *(void *)(a1 + 40);
    dispatch_block_t v9 = +[CPLErrors notImplementedError];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        id v6 = "Delegate does not support pushing all changes yet";
        long long v7 = v11;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to push all changes", buf, 2u);
    }
  }
  [v3 libraryManager:v2 pushAllChangesWithCompletionHandler:*(void *)(a1 + 40)];
LABEL_17:
}

- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v28[3] = &unk_1E60A6818;
  id v12 = v11;
  id v29 = v12;
  id v30 = v10;
  id v13 = v10;
  uint64_t v14 = (void *)MEMORY[0x1BA994060](v28);
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v23[3] = &unk_1E60A6840;
  v23[4] = self;
  id v24 = v12;
  id v25 = v8;
  id v26 = v9;
  id v27 = v14;
  dispatch_block_t v16 = v23;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v32 = v16;
  id v17 = queue;
  id v18 = v14;
  id v19 = v9;
  id v20 = v8;
  id v21 = v12;
  dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);
}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) isCancelled];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    id v8 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
  }
  else
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v5);
  }
}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3;
  v3[3] = &unk_1E60A6840;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abstractObject];
  id v3 = [v2 recordComputeStateDelegate];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4;
    v10[3] = &unk_1E60A6840;
    id v11 = v3;
    id v12 = v2;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];

    id v6 = v11;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Library manager has no delegate and so can't help providing compute state payloads", v9, 2u);
      }
    }
    uint64_t v8 = *(void *)(a1 + 64);
    id v6 = +[CPLErrors notImplementedError];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v6);
  }
}

uint64_t __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) libraryManager:*(void *)(a1 + 40) providePayloadForComputeStates:*(void *)(a1 + 48) inFolderWithURL:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)libraryManagerHasBeenReplaced
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_FAULT, "2 different library managers tried to connect to the daemon at the same time", (uint8_t *)&buf, 2u);
    }

    if (!_CPLSilentLogging)
    {
      id v4 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = [(CPLPlatformObject *)self abstractObject];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "%@ should have been disconnected (close or deactivate) from the daemon before an other connection could connect", (uint8_t *)&buf, 0xCu);
      }
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLManagerOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v11 = 0x3032000000;
          id v12 = __Block_byref_object_copy_;
          id v13 = __Block_byref_object_dispose_;
          id v14 = 0;
          id v7 = _connectedLibraryManagerRegisterQueue();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = ___connectedLibraryManagers_block_invoke;
          block[3] = &unk_1E60A69C0;
          void block[4] = &buf;
          dispatch_sync(v7, block);

          id v8 = *(id *)(*((void *)&buf + 1) + 40);
          _Block_object_dispose(&buf, 8);

          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "All connected library managers from this process: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  self->_killed = 1;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v8 userInfo];
        uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F292F0]];
        int v13 = 138412290;
        id v14 = v11;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Connection is replying to %@", (uint8_t *)&v13, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v12 = NSStringFromSelector((SEL)[v8 selector]);
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2080;
      dispatch_block_t v16 = "";
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Connection will invoke %@%s", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  [v8 invoke];
}

- (void)cancelTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__CPLProxyLibraryManager_cancelTask___block_invoke;
  v10[3] = &unk_1E60A6728;
  id v11 = v4;
  id v12 = self;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __37__CPLProxyLibraryManager_cancelTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) taskIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CPLProxyLibraryManager_cancelTask___block_invoke_2;
  _OWORD v8[3] = &unk_1E60A5E98;
  id v3 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v4 = [v3 proxyWithErrorHandler:v8];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 cancelTaskWithIdentifier:v2];
  }
  else if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v7, 2u);
    }
  }
}

void __37__CPLProxyLibraryManager_cancelTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to cancel %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)cancelSyncTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke;
  v10[3] = &unk_1E60A6728;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) taskIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke_2;
  _OWORD v8[3] = &unk_1E60A5E98;
  id v3 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v4 = [v3 proxyWithErrorHandler:v8];
  id v5 = v4;
  if (v4)
  {
    [v4 cancelSyncTaskWithIdentifier:v2];
  }
  else if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v7, 2u);
    }
  }
}

void __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to cancel %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)barrier
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__CPLProxyLibraryManager_barrier__block_invoke;
  v9[3] = &unk_1E60A6728;
  void v9[4] = self;
  dispatch_semaphore_t v10 = v3;
  id v5 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v12 = v5;
  id v6 = queue;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __33__CPLProxyLibraryManager_barrier__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __33__CPLProxyLibraryManager_barrier__block_invoke_2;
    v3[3] = &unk_1E60A5DD8;
    id v4 = *(id *)(a1 + 40);
    [v2 addBarrierBlock:v3];
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

intptr_t __33__CPLProxyLibraryManager_barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  int v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  dispatch_semaphore_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6868;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A6500;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  dispatch_semaphore_t v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getResourcesForItemWithScopedIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_block_t v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get resources for %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60A5EE8;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 compactFileCacheWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to compact file cache: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6438;
  id v18 = v9;
  unint64_t v19 = a3;
  void v16[4] = self;
  id v17 = v8;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  uint64_t v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 resetCacheWithOption:*(void *)(a1 + 56) reason:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to reset caches: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60A5EE8;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getListOfComponentsWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get the list of components: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  __int16 v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getStatusForComponents:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  __int16 v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getStatusArrayForComponents:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6280;
  id v17 = v8;
  id v18 = v9;
  void v16[4] = self;
  BOOL v19 = a4;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  uint64_t v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6280;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getStatusesForScopesWithIdentifiers:*(void *)(a1 + 40) includeStorages:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  __int16 v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 getCloudCacheForRecordWithScopedIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get record: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6280;
  id v17 = v8;
  id v18 = v9;
  void v16[4] = self;
  BOOL v19 = a4;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  uint64_t v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6280;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A5F88;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 proxyWithErrorHandler:v9];
  id v4 = v3;
  if (v3)
  {
    [v3 cloudCacheGetDescriptionForRecordWithScopedIdentifier:*(void *)(a1 + 40) related:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
  }
}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get record: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInfoToLog:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_3;
  v7[3] = &unk_1E60A5E98;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 addInfoToLog:*(void *)(a1 + 40)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to say '%@'", buf, 0xCu);
    }
  }
}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to say '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = ___CPLProgressForAsyncCall_block_invoke;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  int v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __cpl_dispatch_async_block_invoke;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E60A6118;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v12];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6078;
    id v9 = v3;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60A5D10;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 forceBackupWithCompletionHandler:v3];
}

uint64_t __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = ___CPLProgressForAsyncCall_block_invoke;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  id v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __cpl_dispatch_async_block_invoke;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6078;
  void v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E60A6118;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v12];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A6078;
    id v9 = v3;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60A5D10;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 requestClientToPushAllChangesWithCompletionHandler:v3];
}

uint64_t __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___CPLProgressForAsyncCall_block_invoke;
  id v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __cpl_dispatch_async_block_invoke;
  id v25 = &unk_1E60A6978;
  id v26 = v12;
  id v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62F8;
  void v3[4] = v2;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A6118;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 proxyWithErrorHandler:v13];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_4;
    _OWORD v8[3] = &unk_1E60A62D0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors unknownError];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

uint64_t __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:v5];
}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60A5D10;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 requestClientToPullAllChangesInScopeIdentifier:v3 completionHandler:v4];
}

uint64_t __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke;
  v14[3] = &unk_1E60A6660;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_2;
  v3[3] = &unk_1E60A6660;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _dispatchBlockWhenOpen:v3];
}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_3;
  id v11 = &unk_1E60A6488;
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 proxyWithErrorHandler:&v8];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reportSetting:hasBeenSetToValue:", *(void *)(a1 + 40), *(void *)(a1 + 48), v8, v9, v10, v11, v12);
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to report setting '%@' has been set to '%@'", buf, 0x16u);
    }
  }
}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138413058;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to report setting '%@' has been set to '%@': %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_3;
  v7[3] = &unk_1E60A5E98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 reportMiscInformation:*(void *)(a1 + 40)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to report misc information '%@'", buf, 0xCu);
    }
  }
}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to report misc information '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)blockEngineElement:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_3;
  v7[3] = &unk_1E60A5E98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 blockEngineElement:*(void *)(a1 + 40)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to block '%@'", buf, 0xCu);
    }
  }
}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to block '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)unblockEngineElement:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_3;
  v7[3] = &unk_1E60A5E98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 unblockEngineElement:*(void *)(a1 + 40)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to unblock '%@'", buf, 0xCu);
    }
  }
}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to unblock '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_2;
  v2[3] = &unk_1E60A6728;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dispatchBlockWhenOpen:v2];
}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_3;
  v7[3] = &unk_1E60A5E98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 proxyWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 unblockEngineElementOnce:*(void *)(a1 + 40)];
  }
  else if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to unblock '%@' once", buf, 0xCu);
    }
  }
}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to unblock '%@' once: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  __int16 v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A64D8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v8;
  long long v10 = v8;
  long long v4 = [v2 proxyWithErrorHandler:v9];
  id v5 = v4;
  if (v4)
  {
    [v4 provideScopeChangeForScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  __int16 v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A64D8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v8;
  long long v10 = v8;
  long long v4 = [v2 proxyWithErrorHandler:v9];
  id v5 = v4;
  if (v4)
  {
    [v4 provideRecordWithCloudScopeIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  __int16 v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A64D8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v8;
  long long v10 = v8;
  long long v4 = [v2 proxyWithErrorHandler:v9];
  id v5 = v4;
  if (v4)
  {
    [v4 provideCloudResource:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E60A6890;
  id v19 = v10;
  SEL v20 = a2;
  v17[4] = self;
  id v18 = v9;
  BOOL v21 = a4;
  id v12 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  __int16 v13 = queue;
  id v14 = v9;
  id v15 = v10;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6890;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 64);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60A64D8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v8;
  long long v10 = v8;
  long long v4 = [v2 proxyWithErrorHandler:v9];
  id v5 = v4;
  if (v4)
  {
    [v4 addDropDerivativesRecipe:*(void *)(a1 + 40) writeToUserDefaults:*(unsigned __int8 *)(a1 + 64) withCompletionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  void v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  __int16 v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6438;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A64D8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v8;
  long long v10 = v8;
  long long v4 = [v2 proxyWithErrorHandler:v9];
  id v5 = v4;
  if (v4)
  {
    [v4 attachComputeStates:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    long long v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = objc_opt_class();
  id v16 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  id v36 = ___CPLProgressForAsyncCall_block_invoke;
  unint64_t v37 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v38 = v15;
  SEL v39 = a2;
  [v16 setCancellationHandler:&block];
  queue = self->_queue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke;
  v26[3] = &unk_1E60A6930;
  id v30 = v14;
  SEL v31 = a2;
  v26[4] = self;
  id v27 = v16;
  id v28 = v12;
  id v29 = v13;
  BOOL v32 = a5;
  BOOL v33 = a6;
  SEL v18 = v26;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  id v36 = __cpl_dispatch_async_block_invoke;
  unint64_t v37 = &unk_1E60A6978;
  id v38 = v18;
  id v19 = queue;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  id v23 = v14;
  dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v19, v24);
}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6930;
  void v5[4] = v2;
  long long v4 = *(_OWORD *)(a1 + 64);
  id v3 = (id)v4;
  long long v9 = v4;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  __int16 v10 = *(_WORD *)(a1 + 80);
  [v2 _dispatchBlockWhenOpen:v5];
}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_3;
  v19[3] = &unk_1E60A68B8;
  long long v11 = *(_OWORD *)(a1 + 64);
  id v3 = (id)v11;
  long long v21 = v11;
  id v20 = *(id *)(a1 + 40);
  long long v4 = [v2 proxyWithErrorHandler:v19];
  id v5 = v4;
  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_370;
    v12[3] = &unk_1E60A6908;
    id v13 = v4;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    __int16 v18 = *(_WORD *)(a1 + 80);
    id v17 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 40);
    [v6 performAsCurrentWithPendingUnitCount:1 usingBlock:v12];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
        *(_DWORD *)long long buf = 138412290;
        id v23 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);
      }
    }
    uint64_t v9 = *(void *)(a1 + 64);
    __int16 v10 = +[CPLErrors unknownError];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLManagerOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_370(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2_371;
  v7[3] = &unk_1E60A68E0;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  [v2 fetchComputeStatesForRecordsWithScopedIdentifiers:v3 validator:v4 shouldDecrypt:v5 onDemand:v6 completionHandler:v7];
}

uint64_t __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2_371(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4
{
  id v9 = (void (**)(void))a4;
  uint64_t v6 = [(NSMutableDictionary *)self->_vouchersPerTaskIdentifier objectForKeyedSubscript:a3];
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_backoffRetryingConnectionDate, 0);
  objc_storeStrong((id *)&self->_pendingBlocksAfterOpening, 0);
  objc_storeStrong((id *)&self->_syncOutstandingInvocations, 0);
  objc_storeStrong((id *)&self->_outstandingInvocations, 0);
  objc_storeStrong((id *)&self->_disablingReasons, 0);
  objc_storeStrong((id *)&self->_vouchersPerTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_forceSyncTasks, 0);
  objc_storeStrong((id *)&self->_uploadTasks, 0);
  objc_storeStrong((id *)&self->_inMemoryDownloadTasks, 0);
  objc_storeStrong((id *)&self->_downloadTasks, 0);
  objc_storeStrong((id *)&self->_realConnection, 0);
}

- (void)_dispatchBlockWhenOpen:.cold.1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Trying to talk to library manager before opening it", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_cold_1(char a1, id *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v6))
    {
      uint64_t v7 = [*a2 abstractObject];
      *(_DWORD *)long long buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Trying to open %@ twice", buf, 0xCu);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = *(void *)(a3 + 48);
  id v10 = *a2;
  __int16 v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  id v12 = [*a2 abstractObject];
  [v8 handleFailureInMethod:v9, v10, v11, 570, @"Trying to open %@ twice", v12 object file lineNumber description];

  abort();
}

- (void)_invokeOutstandingInvocationsWithTaskIdentifier:.cold.1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Inconsistency in outstanding invocations", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2_cold_1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2_cold_1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

- (void)_invokeSyncOutstandingInvocationsWithTaskIdentifier:.cold.1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Inconsistency in outstanding invocations", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2_cold_1()
{
  if (!_CPLSilentLogging)
  {
    v1 = __CPLGenericOSLogDomain();
    if (OUTLINED_FUNCTION_1(v1)) {
      OUTLINED_FUNCTION_0(&dword_1B4CAC000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);
    }
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m"];
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

@end