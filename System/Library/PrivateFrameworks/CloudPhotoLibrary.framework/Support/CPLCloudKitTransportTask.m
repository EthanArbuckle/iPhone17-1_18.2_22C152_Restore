@interface CPLCloudKitTransportTask
+ (BOOL)allowsCellularForDownloadOperationOfResource:(id)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5;
+ (BOOL)allowsCellularForDownloadOperationOfSize:(unint64_t)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5;
+ (NSDictionary)mappingForMoveSteps;
+ (NSDictionary)reverseMappingForMoveSteps;
+ (id)copiedRecordFromSourceRecord:(id)a3 sourceDatabaseScope:(int64_t)a4 toRecordID:(id)a5 helper:(id)a6 action:(id)a7 error:(id *)a8;
+ (id)moveStepFaultInjector;
+ (void)initialize;
+ (void)setMoveStepFaultInjector:(id)a3;
- (BOOL)_mergeFoundCKRecords:(id)a3 updateFoundCPLRecords:(id)a4 remainingScopedIdentifiers:(id)a5 fetchedScopedIdentifiers:(id)a6 userRecordID:(id)a7 targetMapping:(id)a8 error:(id *)a9;
- (BOOL)_operationsShouldBeDiscretionary;
- (BOOL)allowsCellular;
- (BOOL)allowsFetchCache;
- (BOOL)deleteTemporaryFolderWithError:(id *)a3;
- (BOOL)foreground;
- (BOOL)hasBackgroundActivity;
- (BOOL)isBackgroundTask;
- (BOOL)isBoostable;
- (BOOL)isForcedTask;
- (BOOL)isHighPriorityBackground;
- (BOOL)isMetadata;
- (BOOL)isUpload;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (BOOL)shouldRunOperationsWithError:(id *)a3;
- (CKOperation)currentOperation;
- (CKOperationGroup)operationGroup;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCloudKitTaskController)controller;
- (CPLCloudKitTransportTask)initWithController:(id)a3;
- (CPLCloudKitTransportTaskGate)gate;
- (CPLEngineStoreUserIdentifier)transportUserIdentifier;
- (CPLEngineTransportGroup)transportGroup;
- (CPLFingerprintContext)fingerprintContext;
- (CPLSyncSession)session;
- (CPLTransportScopeMapping)transportScopeMapping;
- (NSArray)lastOperationRequestUUIDs;
- (NSDictionary)transportScopes;
- (NSString)idleDescription;
- (NSString)mainScopeIdentifier;
- (NSString)sourceBundleIdentifier;
- (OS_dispatch_queue)synchronousWorkQueue;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (id)_destinationRecordsFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 action:(id)a10 error:(id *)a11;
- (id)_errorForUpdateError:(id)a3 scopeProvider:(id)a4;
- (id)_interpretedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5;
- (id)_interpretedSharedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5;
- (id)_moveChangesFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 error:(id *)a10;
- (id)_networkBehaviorForConfiguration:(id)a3;
- (id)_recordWithRecordID:(id)a3 usingRealRecords:(id)a4 remappedRecordIDs:(id)a5 wantsAllRecords:(BOOL)a6;
- (id)_scopeIdentifierFromZoneID:(id)a3;
- (id)_sharedRecordToPrivateRecord:(id)a3 scopedIdentifier:(id)a4;
- (id)_stringForQoS:(int64_t)a3;
- (id)baseConfigurationForTask;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)blockWithAdaptedQOS:(id)a3;
- (id)callbackOperationDidFinishWithError:(id)a3;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)operationDidFinish:(id)a3 error:(id)a4;
- (id)operationDidFinishWithError:(id)a3;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)trackingContext;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)_acquireActivityAndLaunchOperation;
- (void)_applyMoveChanges:(id)a3 sourceType:(int64_t)a4 destinationType:(int64_t)a5 helper:(id)a6 operationContext:(id)a7 completionHandler:(id)a8;
- (void)_cancelAllOperationsIfBlocked;
- (void)_cancelCallbackProgress;
- (void)_createSparsePrivateRecordsIfNecessary:(id)a3 recordClass:(Class)a4 userRecordID:(id)a5 completionHandler:(id)a6;
- (void)_enumerateAllZonesForSharedDatabase:(BOOL)a3 block:(id)a4 completionHandler:(id)a5;
- (void)_fetchNextOperationType:(id)a3 followRemapping:(BOOL)a4 recordIDMapping:(id)a5 inResult:(id)a6 storeRequestUUIDsIn:(id)a7 completionHandler:(id)a8;
- (void)_fetchRecordWithScopedIdentifiers:(id)a3 followRemapping:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchRecordsFollowRemappingWithIDs:(id)a3 alreadyFetchRecordIDs:(id)a4 remappedRecordIDs:(id)a5 realRecords:(id)a6 type:(int64_t)a7 storeRequestUUIDsIn:(id)a8 completionHandler:(id)a9;
- (void)_fetchRecordsForRemainingScopedIdentifiers:(id)a3 alreadyFetchedScopedIdentifiers:(id)a4 userRecordID:(id)a5 foundCPLRecords:(id)a6 foundCKRecords:(id)a7 targetMapping:(id)a8 completionHandler:(id)a9;
- (void)_fetchZoneForZoneID:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5;
- (void)_mergePrivateRecord:(id)a3 withSharedRecord:(id)a4 merger:(id)a5;
- (void)_reallyStartOperation;
- (void)_runWithSyncSession:(id)a3;
- (void)_uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 operationContext:(id)a6 uploadAction:(id)a7 completionHandler:(id)a8;
- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)associateMetric:(id)a3;
- (void)cancel;
- (void)cancelIfBlocked;
- (void)copyRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9;
- (void)copyRecordsWithIDs:(id)a3 sourceType:(int64_t)a4 destinationRecordIDs:(id)a5 destinationType:(int64_t)a6 completionHandler:(id)a7;
- (void)dispatchAfter:(double)a3 block:(id)a4;
- (void)dispatchAsync:(id)a3;
- (void)dispatchCallbackOperation:(id)a3 progress:(id)a4;
- (void)dispatchSynchronousWork:(id)a3;
- (void)enumerateAllZonesWithBlock:(id)a3 completionHandler:(id)a4;
- (void)executeSynchronousWork:(id)a3 description:(id)a4 completionHandler:(id)a5;
- (void)executeSynchronousWork:(id)a3 onItems:(id)a4 description:(id)a5 completionHandler:(id)a6;
- (void)fetchFullRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5;
- (void)fetchPlaceholderRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordWithNames:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordWithNames:(id)a3 inScope:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchRecordsFollowRemappingWithIDs:(id)a3 wantsAllRecords:(BOOL)a4 type:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 completionHandler:(id)a8;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 perFoundRecordBlock:(id)a8 completionHandler:(id)a9;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 wantsAllRecords:(BOOL)a5 type:(int64_t)a6 completionHandler:(id)a7;
- (void)fetchUnknownTargetsInMapping:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordIDFetchWithCompletionHandler:(id)a3;
- (void)fetchZoneForScope:(id)a3 completionHandler:(id)a4;
- (void)getTemporaryFolderWithCompletionHandler:(id)a3;
- (void)getUserRecordIDFetchIfNecessaryWithCompletionHandler:(id)a3;
- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5;
- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5 sourceBundleIdentifiers:(id)a6;
- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9;
- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 finalizeMoveChanges:(id)a9 completionHandler:(id)a10;
- (void)popTaskOperation;
- (void)processErrorIfNeeded:(id)a3;
- (void)pushTaskOperation;
- (void)runOperations;
- (void)runWithNoSyncSession;
- (void)runWithinSyncSession:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAllowsFetchCache:(BOOL)a3;
- (void)setBackgroundTask:(BOOL)a3;
- (void)setBoostable:(BOOL)a3;
- (void)setFetchCache:(id)a3;
- (void)setForcedTask:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setGate:(id)a3;
- (void)setHasBackgroundActivity:(BOOL)a3;
- (void)setHighPriorityBackground:(BOOL)a3;
- (void)setIdleDescription:(id)a3;
- (void)setIsMetadata:(BOOL)a3;
- (void)setIsUpload:(BOOL)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setTrackingContext:(id)a3;
- (void)setTransportGroup:(id)a3;
- (void)setTransportScopeMapping:(id)a3;
- (void)setTransportScopes:(id)a3;
- (void)setTransportUserIdentifier:(id)a3;
- (void)setupConfigurationForOperation:(id)a3;
- (void)taskDidFinish;
- (void)updateContextWithBlock:(id)a3;
- (void)updateContextWithBlock:(id)a3 forOperation:(id)a4;
- (void)updateOneBatch;
- (void)updateOneBatchForOperation:(id)a3;
- (void)updatePrivatePropertiesOnAssetsWithScopedIdentifiers:(id)a3 desiredKeys:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 knownRecords:(id)a8 shouldUpdateRecord:(id)a9 updateBlock:(id)a10 completionHandler:(id)a11;
- (void)updateProgress:(double)a3;
- (void)updateProgress:(double)a3 forOperation:(id)a4;
- (void)updateRecords:(id)a3 cloudKitScope:(id)a4 completionHandler:(id)a5;
- (void)uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 completionHandler:(id)a6;
- (void)uploadRecords:(id)a3 cloudKitScope:(id)a4 scopeProvider:(id)a5 completionHandler:(id)a6;
@end

@implementation CPLCloudKitTransportTask

+ (id)copiedRecordFromSourceRecord:(id)a3 sourceDatabaseScope:(int64_t)a4 toRecordID:(id)a5 helper:(id)a6 action:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v68 = v13;
  v62 = a8;
  v64 = [v15 baseDestinationCKRecordForSourceCKRecord:v13 destinationCKRecordID:v14 error:a8];
  if (v64)
  {
    if (!_CPLSilentLogging)
    {
      v17 = sub_10004117C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = [v13 cplFullDescription];
        *(_DWORD *)buf = 138412546;
        id v88 = v16;
        __int16 v89 = 2112;
        v90 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ from record: %@", buf, 0x16u);
      }
    }
    id v61 = v16;
    id v58 = v14;
    v19 = [v14 zoneID];
    [v13 recordID];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000411D0;
    v80[3] = &unk_100277928;
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    id v81 = v57;
    int64_t v84 = a4;
    id v60 = v15;
    id v20 = v15;
    id v82 = v20;
    id v59 = v19;
    id v83 = v59;
    v21 = objc_retainBlock(v80);
    v22 = [v13 encryptedValues];
    v23 = v64;
    v66 = [v64 encryptedValues];
    id v24 = objc_alloc((Class)NSSet);
    v67 = v22;
    v25 = [v22 allKeys];
    id v26 = [v24 initWithArray:v25];

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v27 = v26;
    id v28 = [v27 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v77;
      while (2)
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v77 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          if (objc_msgSend(v20, "shouldCopyCKRecordKeyToDestinationCKRecord:", v32, v57))
          {
            v33 = [v67 objectForKeyedSubscript:v32];
            id v75 = 0;
            int v34 = ((uint64_t (*)(void *, void *, uint64_t, void *, id *))v21[2])(v21, v66, v32, v33, &v75);
            id v35 = v75;
            if (!v34)
            {
              id v63 = v35;

              v23 = 0;
              goto LABEL_20;
            }
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v29) {
          continue;
        }
        break;
      }
      id v63 = 0;
      v23 = v64;
    }
    else
    {
      id v63 = 0;
    }
LABEL_20:

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v37 = [v68 allKeys];
    id v38 = [v37 countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v72;
      v65 = v37;
      while (2)
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v72 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v71 + 1) + 8 * (void)j);
          if (objc_msgSend(v20, "shouldCopyCKRecordKeyToDestinationCKRecord:", v42, v57)
            && ([v27 containsObject:v42] & 1) == 0)
          {
            id v43 = v27;
            v44 = [v68 objectForKeyedSubscript:v42];
            id v70 = 0;
            v45 = (uint64_t (*)(void *, void *, uint64_t, void *, id *))v21[2];
            v46 = v21;
            v47 = v21;
            v48 = v23;
            int v49 = v45(v47, v23, v42, v44, &v70);
            id v50 = v70;
            id v51 = v50;
            if (!v49)
            {

              v53 = v57;
              id v14 = v58;
              v21 = v46;
              id v27 = v43;
              v52 = 0;
              v23 = v65;
              goto LABEL_34;
            }

            v23 = v48;
            v21 = v46;
            id v27 = v43;
            v37 = v65;
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    if (v23)
    {
      v44 = v63;
      id v69 = v63;
      v52 = [v20 finalizedDestinationCKRecordFromProposedCKRecord:v23 error:&v69];
      id v51 = v69;
      v53 = v57;
      id v14 = v58;
LABEL_34:

      id v63 = v51;
    }
    else
    {
      v52 = 0;
      v53 = v57;
      id v14 = v58;
    }
    id v15 = v60;
    if (v62 && !v52) {
      id *v62 = v63;
    }
    if (!_CPLSilentLogging)
    {
      v54 = sub_10004117C();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        v55 = [v52 cplFullDescription];
        *(_DWORD *)buf = 138412546;
        id v88 = v61;
        __int16 v89 = 2112;
        v90 = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%@ to record: %@", buf, 0x16u);
      }
    }
    id v36 = v52;

    id v16 = v61;
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (id)_destinationRecordsFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 action:(id)a10 error:(id *)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  uint64_t v21 = CPLCKDatabaseScopeForCPLCloudKitOperationType(a5);
  id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v15, "count"));
  id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v15, "count"));
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_1000416E8;
  v55 = sub_1000416F8;
  id v56 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100041700;
  v39[3] = &unk_100277950;
  id v36 = v15;
  id v40 = v36;
  id v24 = v17;
  SEL v49 = a2;
  id v41 = v24;
  uint64_t v42 = self;
  id v25 = v18;
  id v43 = v25;
  id v26 = v23;
  id v27 = v16;
  id v28 = v26;
  id v44 = v26;
  uint64_t v50 = v21;
  id v29 = v20;
  id v45 = v29;
  id v30 = v19;
  id v46 = v30;
  id v31 = v22;
  id v47 = v31;
  v48 = &v51;
  [v27 enumerateObjectsUsingBlock:v39];
  uint64_t v32 = (void *)v52[5];
  if (v32)
  {
    id v33 = 0;
    if (a11) {
      *a11 = v32;
    }
  }
  else
  {
    *a8 = v28;
    id v33 = v31;
  }

  _Block_object_dispose(&v51, 8);
  return v33;
}

- (void)_uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 operationContext:(id)a6 uploadAction:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v44 = 0;
  unsigned __int8 v19 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v44];
  id v20 = v44;
  if (v19)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v21 = sub_10004117C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Will upload copied records: %@", buf, 0xCu);
      }
    }
    id v22 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v14 recordIDsToDelete:0];
    id v23 = [(CPLCloudKitTransportTask *)self fetchCache];
    id v24 = v23;
    if (v23)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100041BC0;
      v42[3] = &unk_100277978;
      v42[4] = self;
      id v34 = v18;
      id v25 = v23;
      id v26 = v14;
      id v27 = v20;
      id v28 = v17;
      id v29 = v16;
      id v30 = v15;
      int64_t v31 = a4;
      id v32 = v23;
      id v43 = v32;
      [v22 setPerRecordSaveBlock:v42];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100041C7C;
      v40[3] = &unk_1002779A0;
      v40[4] = self;
      id v33 = v32;
      a4 = v31;
      id v15 = v30;
      id v16 = v29;
      id v17 = v28;
      id v20 = v27;
      id v14 = v26;
      id v24 = v25;
      id v18 = v34;
      id v41 = v33;
      [v22 setPerRecordDeleteBlock:v40];
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100041D38;
    v35[3] = &unk_100277A18;
    v35[4] = self;
    id v36 = v14;
    id v39 = v18;
    id v37 = v15;
    id v38 = v17;
    [v22 setModifyRecordsCompletionBlock:v35];
    [v22 setSavePolicy:2];
    [(CPLCloudKitTransportTask *)self launchOperation:v22 type:a4 withContext:v16];
  }
  else
  {
    (*((void (**)(id, id))v18 + 2))(v18, v20);
  }
}

- (void)uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 completionHandler:(id)a6
{
}

- (void)copyRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9
{
  BOOL v13 = a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if ([v16 count])
  {
    id v20 = [v16 count];
    if (v20 == [v17 count])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v21 = sub_10004117C();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v16;
          __int16 v39 = 2112;
          id v40 = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will copy %@ to %@", buf, 0x16u);
        }
      }
      id v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      id v27 = sub_10004241C;
      id v28 = &unk_100277A40;
      id v33 = v19;
      id v22 = v16;
      id v29 = v22;
      id v30 = v17;
      int64_t v31 = self;
      int64_t v34 = a5;
      id v32 = v18;
      SEL v35 = a2;
      int64_t v36 = a7;
      id v23 = objc_retainBlock(&v25);
      if (v13) {
        -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:](self, "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:", v22, 1, a5, v23, v25, v26, v27, v28, v29, v30, v31);
      }
      else {
        -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:](self, "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:", v22, 0, 1, a5, v23, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      id v24 = +[CPLErrors incorrectParametersErrorForParameter:@"destinationRecordIDs"];
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v24);
    }
  }
  else
  {
    (*((void (**)(id, void *, void))v19 + 2))(v19, &__NSDictionary0__struct, 0);
  }
}

- (void)copyRecordsWithIDs:(id)a3 sourceType:(int64_t)a4 destinationRecordIDs:(id)a5 destinationType:(int64_t)a6 completionHandler:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042760;
  v13[3] = &unk_100276E00;
  id v14 = a7;
  id v12 = v14;
  [(CPLCloudKitTransportTask *)self copyRecordsWithIDs:a3 followRemapping:0 sourceType:a4 destinationRecordIDs:a5 destinationType:a6 helper:self completionHandler:v13];
}

- (void)_applyMoveChanges:(id)a3 sourceType:(int64_t)a4 destinationType:(int64_t)a5 helper:(id)a6 operationContext:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v40 = 0;
  unsigned __int8 v18 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v40];
  id v19 = v40;
  if (v18)
  {
    if (!_CPLSilentLogging)
    {
      id v20 = sub_10004117C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v14;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Applying move changes: %@", buf, 0xCu);
      }
    }
    int64_t v31 = v15;
    if (qword_1002CE528 != -1) {
      dispatch_once(&qword_1002CE528, &stru_100277A60);
    }
    uint64_t v21 = [(CPLCloudKitTransportTask *)self controller];
    id v22 = [v21 databaseForOperationType:a4 relativeToOperationType:a5];

    id v23 = objc_alloc((Class)CKMovePhotosOperation);
    id v24 = [v14 changes];
    id v25 = [v23 initWithMoveChanges:v24 sourceDatabase:v22];

    uint64_t v26 = [(CPLCloudKitTransportTask *)self fetchCache];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100042AB8;
    v36[3] = &unk_100277A88;
    int64_t v27 = a5;
    id v28 = v14;
    id v37 = v28;
    id v38 = v26;
    __int16 v39 = self;
    id v29 = v26;
    [v25 setPerRecordMoveBlock:v36];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100042F34;
    v32[3] = &unk_100277AD8;
    v32[4] = self;
    id v35 = v17;
    id v33 = v28;
    id v34 = v31;
    [v25 setMovePhotosCompletionBlock:v32];
    int64_t v30 = v27;
    id v15 = v31;
    [(CPLCloudKitTransportTask *)self launchOperation:v25 type:v30 withContext:v16];
  }
  else
  {
    (*((void (**)(id, id))v17 + 2))(v17, v19);
  }
}

- (id)_moveChangesFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v35 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  uint64_t v19 = CPLCKDatabaseScopeForCPLCloudKitOperationType(a5);
  id v20 = -[CPLMoveChangesBatch initWithCapacity:]([CPLMoveChangesBatch alloc], "initWithCapacity:", [v15 count]);
  id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v15, "count"));
  uint64_t v48 = 0;
  SEL v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = sub_1000416E8;
  v52 = sub_1000416F8;
  id v53 = 0;
  if (qword_1002CE530)
  {
    id v22 = +[CPLCloudKitTransportTask mappingForMoveSteps];
  }
  else
  {
    id v22 = 0;
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100043424;
  v36[3] = &unk_100277950;
  id v23 = v15;
  id v37 = v23;
  id v24 = v16;
  SEL v46 = a2;
  id v38 = v24;
  __int16 v39 = self;
  id v25 = v17;
  id v40 = v25;
  id v26 = v21;
  id v41 = v26;
  uint64_t v47 = v19;
  id v27 = v22;
  id v42 = v27;
  id v28 = v18;
  id v43 = v28;
  id v29 = v20;
  id v44 = v29;
  id v45 = &v48;
  [v35 enumerateObjectsUsingBlock:v36];
  int64_t v30 = (void *)v49[5];
  if (v30)
  {
    int64_t v31 = 0;
    if (a10) {
      *a10 = v30;
    }
  }
  else
  {
    *a8 = v26;
    int64_t v31 = v29;
  }

  _Block_object_dispose(&v48, 8);
  return v31;
}

- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9
{
}

- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 finalizeMoveChanges:(id)a9 completionHandler:(id)a10
{
  BOOL v14 = a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if ([v16 count])
  {
    id v21 = [v16 count];
    if (v21 == [v17 count])
    {
      if (!_CPLSilentLogging)
      {
        id v22 = sub_10004117C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v16;
          __int16 v40 = 2112;
          id v41 = v17;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will move %@ to %@", buf, 0x16u);
        }
      }
      id v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      id v28 = sub_100043C08;
      id v29 = &unk_100277B40;
      id v34 = v20;
      id v23 = v16;
      id v30 = v23;
      id v31 = v17;
      id v32 = self;
      int64_t v36 = a5;
      id v33 = v18;
      id v35 = v19;
      int64_t v37 = a7;
      id v24 = objc_retainBlock(&v26);
      if (v14) {
        -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:](self, "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:", v23, 0, a5, v24, v26, v27, v28, v29, v30, v31, v32, v33, v34);
      }
      else {
        -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:](self, "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:", v23, 0, 0, a5, v24, v26, v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else
    {
      id v25 = +[CPLErrors incorrectParametersErrorForParameter:@"destinationRecordIDs"];
      (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v25);
    }
  }
  else
  {
    (*((void (**)(id, void *, void))v20 + 2))(v20, &__NSDictionary0__struct, 0);
  }
}

+ (id)moveStepFaultInjector
{
  id v2 = objc_retainBlock((id)qword_1002CE530);
  return v2;
}

+ (void)setMoveStepFaultInjector:(id)a3
{
  qword_1002CE530 = (uint64_t)[a3 copy];
  _objc_release_x1();
}

+ (NSDictionary)mappingForMoveSteps
{
  v4[0] = &off_100291C98;
  v4[1] = &off_100291CB0;
  v5[0] = @"none";
  v5[1] = @"originPreMoveRead";
  v4[2] = &off_100291CC8;
  v4[3] = &off_100291CE0;
  v5[2] = @"destinationPreMoveRead";
  v5[3] = @"originSignPostStamp";
  v4[4] = &off_100291CF8;
  v4[5] = &off_100291D10;
  v5[4] = @"destinationPostMoveRead";
  v5[5] = @"originPostMoveRead";
  v4[6] = &off_100291D28;
  v5[6] = @"originPostMoveUpdate";
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return (NSDictionary *)v2;
}

+ (NSDictionary)reverseMappingForMoveSteps
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044048;
  block[3] = &unk_1002763B0;
  block[4] = a1;
  if (qword_1002CE540 != -1) {
    dispatch_once(&qword_1002CE540, block);
  }
  id v2 = (void *)qword_1002CE538;
  return (NSDictionary *)v2;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)CKRecord);
  v9 = [v7 recordType];

  id v10 = [v8 initWithRecordType:v9 recordID:v6];
  return v10;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  return 1;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

+ (void)initialize
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  byte_1002CE718 = [v2 BOOLForKey:@"CPLTrackOperationTypes"];
}

- (CPLFingerprintContext)fingerprintContext
{
  id v2 = [(CPLCloudKitTransportTask *)self controller];
  v3 = [v2 fingerprintContext];

  return (CPLFingerprintContext *)v3;
}

- (CPLCloudKitTransportTask)initWithController:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPLCloudKitTransportTask;
  id v6 = [(CPLCloudKitTransportTask *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    id v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.cloudkit.task", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v7->_allowsCellular = 0;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    currentOperations = v7->_currentOperations;
    v7->_currentOperations = v11;

    v7->_isMetadata = 1;
    v7->_highPriorityBackground = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v7->_timeoutIntervalForRequest = _Q0;
    *(_WORD *)&v7->_boostable = 1;
  }

  return v7;
}

- (NSString)mainScopeIdentifier
{
  return (NSString *)[(CPLCloudKitTaskController *)self->_controller mainScopeIdentifier];
}

- (void)setTransportGroup:(id)a3
{
  id v5 = (CPLEngineTransportGroup *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transportGroup = self->_transportGroup;
    self->_transportGroup = v5;
  }
  else
  {
    id v7 = (CPLCloudKitTransportTask *)sub_1001CA2B8(v5, self, a2);
    [(CPLCloudKitTransportTask *)v7 operationGroup];
  }
}

- (CKOperationGroup)operationGroup
{
  return (CKOperationGroup *)self->_transportGroup;
}

- (BOOL)foreground
{
  if (self->_foregroundHasBeenChanged)
  {
    LOBYTE(v2) = self->_foreground;
  }
  else
  {
    v3 = [(CPLEngineTransportGroup *)self->_transportGroup defaultConfiguration];
    unsigned int v2 = [v3 cplDiscretionary] ^ 1;
  }
  return v2;
}

- (void)setForeground:(BOOL)a3
{
  self->_foregroundHasBeenChanged = 1;
  self->_foreground = a3;
}

- (void)_reallyStartOperation
{
  self->_mustCallTaskDidFinish = 1;
  [(CPLCloudKitTransportTask *)self runOperations];
  if (self->_mustCallTaskDidFinish
    && ![(NSMutableArray *)self->_currentOperations count]
    && !self->_nonCKOperationCount)
  {
    [(CPLCloudKitTransportTask *)self taskDidFinish];
  }
}

- (void)_acquireActivityAndLaunchOperation
{
  v3 = [(CPLSyncSession *)self->_session cloudKitRescheduler];
  id v4 = [v3 goodConditionsDescription];
  [(CPLCloudKitTransportTask *)self setIdleDescription:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100067824;
  v8[3] = &unk_100276128;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v5 acquireBackgroundActivityWithCompletionHandler:v8];
  id activityRequest = self->_activityRequest;
  self->_id activityRequest = v6;
}

- (void)_runWithSyncSession:(id)a3
{
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000673B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Launching %@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_session, a3);
  [(CPLCKRecordFetchCache *)self->_fetchCache resetTrackingCounts];
  [v5 createCloudKitReschedulerIfNecessary];
  id v7 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
  [v7 taskWillStart:self];

  SEL v8 = +[NSProgress currentProgress];
  if (v8)
  {
    self->_hasProgress = 1;
    id v9 = CPLCopyDefaultSerialQueueAttributes();
    id v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cpl.cloudkit.task.progress", v9);
    progressQueue = self->_progressQueue;
    self->_progressQueue = v10;

    id v12 = +[NSProgress progressWithTotalUnitCount:1];
    progress = self->_progress;
    self->_progress = v12;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100067BA8;
  v16[3] = &unk_100275EA0;
  v16[4] = self;
  [(CPLCloudKitTransportTask *)self dispatchAsync:v16];
  if (self->_hasProgress)
  {
    BOOL v14 = self->_progressQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100067D0C;
    v15[3] = &unk_100275EA0;
    v15[4] = self;
    dispatch_sync((dispatch_queue_t)v14, v15);
  }
}

- (void)runWithNoSyncSession
{
}

- (void)runWithinSyncSession:(id)a3
{
}

- (void)cancel
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000673B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cancelling %@", buf, 0xCu);
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100067FC0;
  v5[3] = &unk_100275EC8;
  v5[4] = self;
  v5[5] = a2;
  [(CPLCloudKitTransportTask *)self dispatchAsync:v5];
}

- (void)_cancelAllOperationsIfBlocked
{
  if (self->_cancelled) {
    return;
  }
  if (!self->_mustCallTaskDidFinish)
  {
LABEL_27:
    self->_cancelled = 1;
    return;
  }
  if (![(NSMutableArray *)self->_currentOperations count])
  {
    if (self->_cancelled) {
      return;
    }
    goto LABEL_27;
  }
  v3 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_currentOperations;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isOperationBlocked:*(void *)(*((void *)&v21 + 1) + 8 * i)])
        {

          self->_cancelled = 1;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = self->_currentOperations;
          id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
                [v3 operationHasBeenCancelled:v15];
                [v15 cancel];
              }
              id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
            }
            while (v12);
          }

          goto LABEL_25;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (!_CPLSilentLogging)
  {
    id v9 = sub_1000673B0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Delaying cancelling %@, giving it a chance to complete", buf, 0xCu);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000685A4;
  v16[3] = &unk_100275EA0;
  v16[4] = self;
  [(CPLCloudKitTransportTask *)self dispatchAfter:v16 block:5.0];
LABEL_25:
}

- (void)cancelIfBlocked
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000673B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cancelling %@ it not blocked", buf, 0xCu);
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000686C0;
  v5[3] = &unk_100275EC8;
  v5[4] = self;
  v5[5] = a2;
  [(CPLCloudKitTransportTask *)self dispatchAsync:v5];
}

- (id)blockWithAdaptedQOS:(id)a3
{
  id v4 = a3;
  if (self->_forcedTask)
  {
    dispatch_qos_class_t v5 = +[CPLEngineSyncManager qualityOfServiceForForcedTasks];
  }
  else
  {
    if (!self->_backgroundTask) {
      goto LABEL_6;
    }
    dispatch_qos_class_t v5 = +[CPLEngineSyncManager qualityOfServiceForSyncSessions];
  }
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5, 0, v4);

  id v4 = v6;
LABEL_6:
  id v7 = objc_retainBlock(v4);

  return v7;
}

- (void)dispatchAsync:(id)a3
{
  id v4 = [(CPLCloudKitTransportTask *)self blockWithAdaptedQOS:a3];
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000689B0;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  dispatch_block_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E440;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)dispatchAfter:(double)a3 block:(id)a4
{
  dispatch_block_t v6 = [(CPLCloudKitTransportTask *)self blockWithAdaptedQOS:a4];
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * (uint64_t)a3);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100068B24;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, (dispatch_queue_t)queue, v10);
}

- (BOOL)shouldRunOperationsWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_cancelled)
  {
    dispatch_qos_class_t v5 = +[CPLErrors operationCancelledError];
LABEL_5:
    dispatch_time_t v7 = v5;
    goto LABEL_6;
  }
  acquireError = self->_acquireError;
  if (acquireError)
  {
    dispatch_qos_class_t v5 = acquireError;
    goto LABEL_5;
  }
  activity = self->_activity;
  if (activity && [(CPLBackgroundActivity *)activity shouldDefer])
  {
    dispatch_qos_class_t v5 = +[CPLErrors sessionHasBeenDeferredError];
    goto LABEL_5;
  }
  gate = self->_gate;
  if (gate)
  {
    id v21 = 0;
    unsigned int v12 = [(CPLCloudKitTransportTaskGate *)gate shouldRunOperationsForTask:self error:&v21];
    id v13 = (NSError *)v21;
    dispatch_time_t v7 = v13;
    if (!v12) {
      goto LABEL_6;
    }
    BOOL v14 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
  controller = self->_controller;
  if (controller)
  {
    long long v20 = v14;
    unsigned int v16 = [(CPLCloudKitTaskController *)controller shouldRunOperationsWithError:&v20];
    dispatch_time_t v7 = v20;

    if (v16)
    {
      BOOL v14 = v7;
      goto LABEL_20;
    }
LABEL_6:
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_20:
  long long v17 = +[NSUserDefaults standardUserDefaults];
  long long v18 = [v17 stringForKey:@"CPLFailCloudKitTransportTaskClass"];

  if (v18 && NSClassFromString(v18) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v19 = +[CPLErrors cplErrorWithCode:150, @"Failing %@ for testing purpose", objc_opt_class() description];

    BOOL v8 = 0;
    BOOL v14 = (NSError *)v19;
  }
  else
  {
    BOOL v8 = 1;
  }

  dispatch_time_t v7 = v14;
  if (a3)
  {
LABEL_7:
    if (!v8) {
      *a3 = v7;
    }
  }
LABEL_9:

  return v8;
}

- (CKOperation)currentOperation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((unint64_t)[(NSMutableArray *)self->_currentOperations count] >= 2)
  {
    dispatch_block_t v6 = (CPLCloudKitTransportTask *)sub_1001CA594(a2, self, &self->_currentOperations);
    [(CPLCloudKitTransportTask *)v6 launchOperation:v8 type:v9 withContext:v10];
  }
  else
  {
    currentOperations = self->_currentOperations;
    return (CKOperation *)[(NSMutableArray *)currentOperations firstObject];
  }
  return result;
}

- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  unsigned int v12 = sourceBundleIdentifier;
  if (!sourceBundleIdentifier)
  {
    dispatch_qos_class_t v5 = [(CPLCloudKitTransportTask *)self controller];
    unsigned int v12 = [v5 defaultSourceBundleIdentifier];
  }
  BOOL v14 = v12;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];
  [(CPLCloudKitTransportTask *)self launchOperation:v9 type:a4 withContext:v10 sourceBundleIdentifiers:v13];

  if (!sourceBundleIdentifier)
  {
  }
}

- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5 sourceBundleIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (byte_1002CE718) {
    BOOL v14 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v15 = sub_1000673B0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v11 cplOperationClassDescription];
      long long v17 = (void *)v16;
      if ((unint64_t)(a4 - 1) > 3) {
        CFStringRef v18 = @"Container";
      }
      else {
        CFStringRef v18 = off_100278DA0[a4 - 1];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with %@", buf, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_mustCallTaskDidFinish)
  {
    sub_1001CA69C(self, v11, a2);
    __break(1u);
  }
  [(CPLCloudKitTransportTask *)self setupConfigurationForOperation:v11];
  if (![(NSMutableArray *)self->_currentOperations count])
  {
    uint64_t v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    lastOperationRequestUUIDs = self->_lastOperationRequestUUIDs;
    self->_lastOperationRequestUUIDs = v19;
  }
  [(NSMutableArray *)self->_currentOperations addObject:v11];
  [v11 requestCompletedBlock];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10006940C;
  v47[3] = &unk_100278A28;
  v47[4] = self;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v48 = v21;
  [v11 setRequestCompletedBlock:v47];
  if ([(CPLCloudKitTaskController *)self->_controller isForeground]
    && [(CPLCloudKitTransportTask *)self isBoostable]
    && [(CPLCloudKitTaskController *)self->_controller canBoostOperations])
  {
    long long v22 = [v11 configuration];
    if ([v22 cplDiscretionary])
    {
      if (!_CPLSilentLogging)
      {
        long long v23 = sub_1000673B0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [v11 cplOperationClassDescription];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Automatically boosting (background) %@ to non discretionary and requiring non-cellular", buf, 0xCu);
        }
      }
      [v22 setCPLDiscretionary:0];
      [v22 setAllowsCellularAccess:0];
    }
  }
  id v25 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
  [v25 operationWillStart:v11 forTask:self withContext:v12 bundleIdentifiers:v13];

  if ([(NSMutableSet *)self->_associatedMetrics count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = self->_associatedMetrics;
    id v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v44;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) associateWithOperation:v11];
        }
        id v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v27);
    }

    id v30 = [(NSMutableSet *)self->_associatedMetrics copy];
    id v31 = [v11 completionBlock];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v50 = sub_1000695B8;
    uint64_t v51 = sub_1000695C8;
    id v32 = v11;
    id v52 = v32;
    id v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    int64_t v37 = sub_1000695D0;
    id v38 = &unk_100278488;
    id v39 = self;
    id v33 = v30;
    id v40 = v33;
    id v42 = buf;
    id v34 = v31;
    id v41 = v34;
    [v32 setCompletionBlock:&v35];

    _Block_object_dispose(buf, 8);
  }
  -[CPLCloudKitTaskController launchOperation:type:](self->_controller, "launchOperation:type:", v11, a4, v35, v36, v37, v38, v39);
  if (self->_cancelled || self->_acquireError) {
    [v11 cancel];
  }
  else {
    [(CPLBackgroundActivity *)self->_activity attachToCKOperation:v11];
  }
}

- (void)updateOneBatch
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_currentOperations count] == (id)1)
  {
    id v7 = [(NSMutableArray *)self->_currentOperations lastObject];
    [(CPLCloudKitTransportTask *)self updateOneBatchForOperation:v7];
  }
  else
  {
    id v4 = (CPLCloudKitTransportTask *)sub_1001CA7B4(a2, self, &self->_currentOperations);
    [(CPLCloudKitTransportTask *)v4 updateProgress:v6];
  }
}

- (void)updateProgress:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_currentOperations count] == (id)1)
  {
    id v10 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    double v6 = [(NSMutableArray *)self->_currentOperations lastObject];
    [v10 operation:v6 updateProgress:a3];
  }
  else
  {
    id v7 = (CPLCloudKitTransportTask *)sub_1001CA8BC(a2, self, &self->_currentOperations);
    [(CPLCloudKitTransportTask *)v7 updateContextWithBlock:v9];
  }
}

- (void)updateContextWithBlock:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_currentOperations count] == (id)1)
  {
    SEL v5 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    double v6 = [(NSMutableArray *)self->_currentOperations lastObject];
    [v5 operation:v6 updateContextWithBlock:v10];
  }
  else
  {
    id v7 = (CPLCloudKitTransportTask *)sub_1001CA9C4(a2, self, &self->_currentOperations);
    [(CPLCloudKitTransportTask *)v7 operationDidFinishWithError:v9];
  }
}

- (id)operationDidFinishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_currentOperations count] == (id)1)
  {
    double v6 = [(NSMutableArray *)self->_currentOperations lastObject];
    id v7 = [(CPLCloudKitTransportTask *)self operationDidFinish:v6 error:v5];

    return v7;
  }
  else
  {
    id v9 = (CPLCloudKitTransportTask *)sub_1001CAACC(a2, self, &self->_currentOperations);
    [(CPLCloudKitTransportTask *)v9 _cancelCallbackProgress];
  }
  return result;
}

- (void)_cancelCallbackProgress
{
  if (self->_callbackOperationProgress)
  {
    id v4 = [(CPLCloudKitTransportTask *)self idleDescription];
    if (v4 && ([v4 hasSuffix:@" (cancelled)"] & 1) == 0)
    {
      v3 = [v4 stringByAppendingString:@" (cancelled)"];
      [(CPLCloudKitTransportTask *)self setIdleDescription:v3];
    }
    [(NSProgress *)self->_callbackOperationProgress cancel];
  }
}

- (void)dispatchCallbackOperation:(id)a3 progress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_callbackOperationProgress) {
    sub_1001CABD4((uint64_t)v6, self);
  }
  [(CPLCloudKitTransportTask *)self pushTaskOperation];
  [(CPLCloudKitTransportTask *)self setIdleDescription:v6];
  objc_storeStrong((id *)&self->_callbackOperationProgress, a4);
  [(NSProgress *)self->_progress setTotalUnitCount:(char *)[(NSProgress *)self->_progress totalUnitCount] + 1];
  [(NSProgress *)self->_progress addChild:self->_callbackOperationProgress withPendingUnitCount:1];
  if (self->_acquireError)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100069CBC;
    v14[3] = &unk_100275EA0;
    v14[4] = self;
    [(CPLCloudKitTransportTask *)self dispatchAsync:v14];
  }
  else if (self->_activity)
  {
    objc_initWeak(&location, self);
    activity = self->_activity;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100069CD0;
    v11[3] = &unk_100278A78;
    objc_copyWeak(&v12, &location);
    id v9 = [(CPLBackgroundActivity *)activity addDeferHandler:v11];
    id activityEligibilityChangeHandler = self->_activityEligibilityChangeHandler;
    self->_id activityEligibilityChangeHandler = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)callbackOperationDidFinishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_callbackOperationProgress)
  {
    uint64_t v17 = sub_1001CAD08(a2, self);
    return (id)sub_10006A00C(v17);
  }
  activity = self->_activity;
  if (activity)
  {
    [(CPLBackgroundActivity *)activity removeDeferHandler:self->_activityEligibilityChangeHandler];
    id activityEligibilityChangeHandler = self->_activityEligibilityChangeHandler;
    self->_id activityEligibilityChangeHandler = 0;
  }
  SEL v8 = (NSError *)v5;
  id v9 = v8;
  acquireError = self->_acquireError;
  if (acquireError)
  {
    id v11 = acquireError;
    id v12 = v9;
  }
  else
  {
    id v11 = v8;
    if (!v8) {
      goto LABEL_7;
    }
    id v11 = v8;
    if (!self->_activity) {
      goto LABEL_7;
    }
    if (!+[CPLCloudKitErrors isCloudKitOperationCancelledError:v8])
    {
      id v11 = v9;
      if (![(NSError *)v9 isCPLOperationCancelledError]) {
        goto LABEL_7;
      }
    }
    id v11 = v9;
    if (![(CPLBackgroundActivity *)self->_activity shouldDefer]) {
      goto LABEL_7;
    }
    uint64_t v15 = [(CPLCloudKitTransportTask *)self idleDescription];
    id v12 = (void *)v15;
    CFStringRef v16 = @"operation";
    if (v15) {
      CFStringRef v16 = (const __CFString *)v15;
    }
    id v11 = +[CPLErrors cplErrorWithCode:257, @"%@ has been deferred", v16 description];
  }
LABEL_7:
  [(NSProgress *)self->_callbackOperationProgress setCompletedUnitCount:[(NSProgress *)self->_callbackOperationProgress totalUnitCount]];
  callbackOperationProgress = self->_callbackOperationProgress;
  self->_callbackOperationProgress = 0;

  [(CPLCloudKitTransportTask *)self setIdleDescription:0];
  [(CPLCloudKitTransportTask *)self popTaskOperation];

  return v11;
}

- (OS_dispatch_queue)synchronousWorkQueue
{
  sub_10006A00C((uint64_t)self);
  synchronousWorkQueue = self->_synchronousWorkQueue;
  return synchronousWorkQueue;
}

- (void)dispatchSynchronousWork:(id)a3
{
  id v4 = a3;
  sub_10006A00C((uint64_t)self);
  id v5 = [(CPLCloudKitTransportTask *)self blockWithAdaptedQOS:v4];

  synchronousWorkQueue = self->_synchronousWorkQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006A1F4;
  v11[3] = &unk_100275DF8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E440;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  SEL v8 = synchronousWorkQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)executeSynchronousWork:(id)a3 description:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v20 = 0;
  unsigned __int8 v11 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v20];
  id v12 = v20;
  if (v11)
  {
    id v13 = +[NSProgress progressWithTotalUnitCount:1];
    [(CPLCloudKitTransportTask *)self dispatchCallbackOperation:v9 progress:v13];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006A360;
    v15[3] = &unk_100276608;
    id v16 = v13;
    uint64_t v17 = self;
    id v18 = v8;
    id v19 = v10;
    id v14 = v13;
    [(CPLCloudKitTransportTask *)self dispatchSynchronousWork:v15];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }
}

- (void)executeSynchronousWork:(id)a3 onItems:(id)a4 description:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  sub_10006A00C((uint64_t)self);
  id v15 = [v13 count];
  id v16 = +[NSProgress progressWithTotalUnitCount:v15];
  [(CPLCloudKitTransportTask *)self dispatchCallbackOperation:v12 progress:v16];
  uint64_t v17 = [v13 objectEnumerator];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006ABF8;
  v20[3] = &unk_100278B40;
  v20[4] = self;
  id v21 = v16;
  id v22 = v10;
  id v23 = v15;
  id v18 = v10;
  id v19 = v16;
  sub_10006A658(self, v14, v17, v12, v19, v20);
}

- (NSArray)lastOperationRequestUUIDs
{
  lastOperationRequestUUIDs = self->_lastOperationRequestUUIDs;
  if (lastOperationRequestUUIDs) {
    v3 = lastOperationRequestUUIDs;
  }
  else {
    v3 = (NSMutableArray *)&__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v17 = 0;
  unsigned __int8 v8 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = +[NSProgress progressWithTotalUnitCount:1];
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Acquiring helper %@", v6];
    [(CPLCloudKitTransportTask *)self dispatchCallbackOperation:v11 progress:v10];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006AEE8;
    v13[3] = &unk_1002763D8;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v10;
    id v16 = v7;
    id v12 = v10;
    [v12 performAsCurrentWithPendingUnitCount:1 usingBlock:v13];
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

- (void)getTemporaryFolderWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSURL *, void))a3;
  id v13 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v13];
  id v6 = v13;
  if (v5)
  {
    temporaryFolderURL = self->_temporaryFolderURL;
    if (temporaryFolderURL)
    {
      v4[2](v4, temporaryFolderURL, 0);
    }
    else
    {
      unsigned __int8 v8 = +[NSProgress progressWithTotalUnitCount:1];
      [(CPLCloudKitTransportTask *)self dispatchCallbackOperation:@"Getting a temporary folder" progress:v8];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10006B25C;
      v10[3] = &unk_100275D40;
      v10[4] = self;
      id v11 = v8;
      id v12 = v4;
      id v9 = v8;
      [v9 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
    }
  }
  else
  {
    ((void (**)(id, NSURL *, id))v4)[2](v4, 0, v6);
  }
}

- (BOOL)deleteTemporaryFolderWithError:(id *)a3
{
  if (self->_temporaryFolderURL)
  {
    unsigned __int8 v5 = +[NSFileManager defaultManager];
    temporaryFolderURL = self->_temporaryFolderURL;
    id v11 = 0;
    unsigned __int8 v7 = [v5 removeItemAtURL:temporaryFolderURL error:&v11];
    id v8 = v11;

    id v9 = self->_temporaryFolderURL;
    self->_temporaryFolderURL = 0;

    if (a3 && (v7 & 1) == 0)
    {
      id v8 = v8;
      unsigned __int8 v7 = 0;
      *a3 = v8;
    }
  }
  else
  {
    id v8 = 0;
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)associateMetric:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CPLCloudKitTaskController *)self->_controller associateMetric:v7];
  associatedMetrics = self->_associatedMetrics;
  if (associatedMetrics)
  {
    [(NSMutableSet *)associatedMetrics addObject:v7];
  }
  else
  {
    unsigned __int8 v5 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v7, 0);
    id v6 = self->_associatedMetrics;
    self->_associatedMetrics = v5;
  }
}

- (void)updateOneBatchForOperation:(id)a3
{
  id v10 = a3;
  if (-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:"))
  {
    unsigned __int8 v5 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    [v5 operationDidProgressOneBatch:v10];
  }
  else
  {
    id v6 = (CPLCloudKitTransportTask *)sub_1001CAE08(a2, v10, self);
    [(CPLCloudKitTransportTask *)v6 updateProgress:v9 forOperation:v8];
  }
}

- (void)updateProgress:(double)a3 forOperation:(id)a4
{
  id v12 = a4;
  if (-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:"))
  {
    SEL v7 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    [v7 operation:v12 updateProgress:a3];
  }
  else
  {
    id v8 = (CPLCloudKitTransportTask *)sub_1001CAF3C(a2, v12, self);
    [(CPLCloudKitTransportTask *)v8 updateContextWithBlock:v10 forOperation:v11];
  }
}

- (void)updateContextWithBlock:(id)a3 forOperation:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_currentOperations containsObject:v7])
  {
    id v8 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    [v8 operation:v7 updateContextWithBlock:v13];
  }
  else
  {
    SEL v9 = (CPLCloudKitTransportTask *)sub_1001CB070(a2, v7, self);
    [(CPLCloudKitTransportTask *)v9 operationDidFinish:v11 error:v12];
  }
}

- (id)operationDidFinish:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = (NSError *)a4;
  if (([(NSMutableArray *)self->_currentOperations containsObject:v7] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_1000673B0();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        long long v24 = (CPLCloudKitTransportTask *)objc_claimAutoreleasedReturnValue();
        id v25 = [v7 cplOperationClassDescription];
        *(_DWORD *)buf = 138412546;
        int64_t v37 = v24;
        __int16 v38 = 2112;
        id v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ for %@ called while it has not started yet", buf, 0x16u);
      }
    }
    id v26 = +[NSAssertionHandler currentHandler];
    id v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitTransportTask.m"];
    uint64_t v28 = NSStringFromSelector(a2);
    id v29 = [v7 cplOperationClassDescription];
    [v26 handleFailureInMethod:a2, self, v27, 1058, @"%@ for %@ called while it has not started yet", v28, v29 object file lineNumber description];

    abort();
  }
  if (!_CPLSilentLogging)
  {
    SEL v9 = sub_1000673B0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v37 = self;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ finished %@", buf, 0x16u);
    }
  }
  [(CPLCloudKitTransportTaskGate *)self->_gate operation:v7 forTask:self didFinishWithError:v8];
  [(CPLCloudKitTransportTask *)self processErrorIfNeeded:v8];
  SEL v10 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
  [v10 operationDidFinish:v7];

  id v30 = v7;
  [(NSMutableArray *)self->_currentOperations removeObject:v7];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = self->_associatedMetrics;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v17 submitted] & 1) == 0 && objc_msgSend(v17, "outstandingBeginCount"))
        {
          if (v14) {
            [v14 addObject:v17];
          }
          else {
            id v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v17, 0);
          }
        }
      }
      id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  objc_storeStrong((id *)&self->_associatedMetrics, v14);
  if (v8)
  {
    acquireError = self->_acquireError;
    if (acquireError)
    {
      id v19 = acquireError;
      id v20 = v30;
LABEL_23:

      id v8 = v19;
      goto LABEL_25;
    }
    activity = self->_activity;
    id v20 = v30;
    if (activity && [(CPLBackgroundActivity *)activity shouldDefer])
    {
      id v19 = +[CPLErrors sessionHasBeenDeferredError];
      goto LABEL_23;
    }
  }
  else
  {
    id v20 = v30;
  }
LABEL_25:
  [(CPLBackgroundActivity *)self->_activity detachFromCKOperation:v20];

  return v8;
}

- (void)taskDidFinish
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_currentOperations count])
  {
    sub_1001CB27C(a2, self, &self->_currentOperations);
LABEL_15:
    sub_1001CB1A4((uint64_t)self, (uint64_t)a2);
  }
  if (!self->_mustCallTaskDidFinish) {
    goto LABEL_15;
  }
  if (self->_temporaryFolderURL)
  {
    id v4 = +[NSFileManager defaultManager];
    temporaryFolderURL = self->_temporaryFolderURL;
    id v14 = 0;
    unsigned __int8 v6 = [v4 removeItemAtURL:temporaryFolderURL error:&v14];
    id v7 = v14;

    if ((v6 & 1) == 0 && !_CPLSilentLogging)
    {
      id v8 = sub_1000673B0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        SEL v9 = [(NSURL *)self->_temporaryFolderURL path];
        *(_DWORD *)buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to delete temporary folder at %@: %@", buf, 0x16u);
      }
    }
    SEL v10 = self->_temporaryFolderURL;
    self->_temporaryFolderURL = 0;
  }
  self->_mustCallTaskDidFinish = 0;
  if (self->_hasProgress)
  {
    progressQueue = self->_progressQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006BDCC;
    v13[3] = &unk_100275EA0;
    void v13[4] = self;
    dispatch_sync((dispatch_queue_t)progressQueue, v13);
  }
  else
  {
    id v12 = [(CPLCloudKitTaskController *)self->_controller operationTracker];
    [v12 taskDidFinish:self];
  }
}

- (void)pushTaskOperation
{
}

- (void)popTaskOperation
{
}

- (void)processErrorIfNeeded:(id)a3
{
}

- (void)runOperations
{
  id v4 = +[NSAssertionHandler currentHandler];
  unsigned __int8 v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitTransportTask.m"];
  unsigned __int8 v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 1127, @"%@ should be overriden", v6 object file lineNumber description];

  abort();
}

- (BOOL)_operationsShouldBeDiscretionary
{
  if (self->_forcedTask) {
    return 0;
  }
  uint64_t v3 = [(CPLCloudKitTransportTask *)self session];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self session];
    unsigned int v6 = [v5 shouldBeDiscretionary];

    if (!v6) {
      return 0;
    }
  }
  if (self->_activity) {
    return 0;
  }
  id v8 = [(CPLCloudKitTransportTask *)self operationGroup];
  SEL v9 = [v8 defaultConfiguration];
  unsigned __int8 v10 = [v9 cplDiscretionary];

  return v10;
}

- (void)setupConfigurationForOperation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self baseConfigurationForTask];
  unsigned int v6 = [(CPLCloudKitTransportTask *)self operationGroup];
  [v4 setGroup:v6];
  [v4 setConfiguration:v5];
  if (!_CPLSilentLogging)
  {
    id v7 = sub_1000673B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v6 defaultConfiguration];
      SEL v9 = sub_10006C180(self, v8);
      unsigned __int8 v10 = sub_10006C180(self, v5);
      int v11 = 138413314;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Setting up task %@ (CKOperation %@) with group %@ (%@) and configuration %@", (uint8_t *)&v11, 0x34u);
    }
  }
}

- (id)baseConfigurationForTask
{
  id v3 = [(CPLCloudKitTaskController *)self->_controller newOperationConfiguration];
  id v4 = [(CPLCloudKitTransportTask *)self operationGroup];
  unsigned __int8 v5 = [v4 defaultConfiguration];
  [(CPLBackgroundActivity *)self->_activity attachToCKOperationConfiguration:v3];
  BOOL v6 = [(CPLCloudKitTransportTask *)self _operationsShouldBeDiscretionary];
  if (!v6)
  {
    qos_class_t v7 = qos_class_self();
    uint64_t v8 = -1;
    uint64_t v9 = 25;
    uint64_t v10 = 33;
    if (v7 != QOS_CLASS_USER_INTERACTIVE) {
      uint64_t v10 = 9;
    }
    if (v7 != QOS_CLASS_USER_INITIATED) {
      uint64_t v9 = v10;
    }
    if (v7 != QOS_CLASS_DEFAULT) {
      uint64_t v8 = v9;
    }
    uint64_t v11 = -1;
    uint64_t v12 = 17;
    if (v7 != QOS_CLASS_UTILITY) {
      uint64_t v12 = 9;
    }
    if (v7) {
      uint64_t v11 = v12;
    }
    if ((int)v7 <= 20) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v8;
    }
    [v3 setQualityOfService:v13];
  }
  [v3 setCPLDiscretionary:v6];
  [(CPLCloudKitTransportTask *)self timeoutIntervalForRequest];
  double v15 = v14;
  [v5 timeoutIntervalForRequest];
  if (v15 >= 0.0 && (v16 < 0.0 || v15 < v16))
  {
    if (!_CPLSilentLogging)
    {
      __int16 v19 = sub_1000673B0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int v26 = 138412290;
        id v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Overriding request timeout for %@", (uint8_t *)&v26, 0xCu);
      }
    }
    id v18 = v3;
    double v17 = v15;
  }
  else
  {
    [v5 timeoutIntervalForRequest];
    id v18 = v3;
  }
  [v18 setTimeoutIntervalForRequest:v17];
  [(CPLCloudKitTransportTask *)self timeoutIntervalForResource];
  double v21 = v20;
  [v5 timeoutIntervalForResource];
  if (v6 && v22 < 0.0) {
    double v22 = 86400.0;
  }
  if (v21 >= 0.0 && (v22 < 0.0 || v21 < v22))
  {
    if (!_CPLSilentLogging)
    {
      long long v24 = sub_1000673B0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        int v26 = 138412290;
        id v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Overriding resource timeout for %@", (uint8_t *)&v26, 0xCu);
      }
    }
    double v22 = v21;
  }
  [v3 setTimeoutIntervalForResource:v22];
  if (self->_sourceBundleIdentifier) {
    objc_msgSend(v3, "setApplicationBundleIdentifierOverride:");
  }
  if ([(CPLCloudKitTransportTask *)self allowsCellular]
    && ([v5 allowsCellularAccess] & 1) == 0)
  {
    [v3 setAllowsCellularAccess:1];
  }

  return v3;
}

- (id)_stringForQoS:(int64_t)a3
{
  unint64_t v3 = __ROR8__(a3 - 9, 3);
  if (v3 > 3) {
    return @"def";
  }
  else {
    return off_100278DC0[v3];
  }
}

- (id)_networkBehaviorForConfiguration:(id)a3
{
  if ([a3 cplDiscretionary]) {
    return @"disc";
  }
  else {
    return @"non-disc";
  }
}

+ (BOOL)allowsCellularForDownloadOperationOfResource:(id)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = [a3 identity];
  id v9 = [v8 fileSize];

  return [a1 allowsCellularForDownloadOperationOfSize:v9 isForeground:v6 isHighPriority:v5];
}

+ (BOOL)allowsCellularForDownloadOperationOfSize:(unint64_t)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5
{
  return a3 - 1 < 0x63FFFFF && a4 && a5;
}

- (void)getUserRecordIDFetchIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, CPLEngineStoreUserIdentifier *, void))a3;
  if (self->_transportUserIdentifier && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = 0;
    unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v11];
    id v6 = v11;
    if (v5) {
      v4[2](v4, self->_transportUserIdentifier, 0);
    }
    else {
      ((void (**)(id, CPLEngineStoreUserIdentifier *, id))v4)[2](v4, 0, v6);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      qos_class_t v7 = sub_1000673B0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = (id)objc_opt_class();
        id v8 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will fetch user identifier as it has not been set on %@", buf, 0xCu);
      }
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006C7B0;
    v9[3] = &unk_100278BE0;
    v9[4] = self;
    uint64_t v10 = v4;
    [(CPLCloudKitTransportTask *)self fetchUserRecordIDFetchWithCompletionHandler:v9];
  }
}

- (void)fetchUserRecordIDFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v10];
  id v6 = v10;
  if (v5)
  {
    qos_class_t v7 = +[CKFetchRecordsOperation fetchCurrentUserRecordOperation];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006C950;
    v8[3] = &unk_100278C30;
    v8[4] = self;
    id v9 = v4;
    [v7 setFetchRecordsCompletionBlock:v8];
    [(CPLCloudKitTransportTask *)self launchOperation:v7 type:1 withContext:0];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (void)_enumerateAllZonesForSharedDatabase:(BOOL)a3 block:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v25 = 0;
  unsigned __int8 v10 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v25];
  id v11 = v25;
  if (v10)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    id v12 = objc_alloc_init((Class)CKFetchDatabaseChangesOperation);
    [v12 setFetchAllChanges:1];
    objc_initWeak(&location, v12);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006CEC4;
    v18[3] = &unk_100278C58;
    id v19 = v8;
    double v20 = v23;
    objc_copyWeak(&v21, &location);
    [v12 setRecordZoneWithIDChangedBlock:v18];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006CF30;
    v14[3] = &unk_100278CA8;
    v14[4] = self;
    double v16 = v23;
    BOOL v17 = v6;
    id v15 = v9;
    [v12 setFetchDatabaseChangesCompletionBlock:v14];
    if (v6) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    [(CPLCloudKitTransportTask *)self launchOperation:v12 type:v13 withContext:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    _Block_object_dispose(v23, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t, id))v9 + 2))(v9, 1, v11);
  }
}

- (void)enumerateAllZonesWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006D224;
  v9[3] = &unk_100278CD0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(CPLCloudKitTransportTask *)self _enumerateAllZonesForSharedDatabase:0 block:v7 completionHandler:v9];
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLTransportScopeMapping *)self->_transportScopeMapping objectForKeyedSubscript:v4];
  if (!v5)
  {
    unsigned __int8 v5 = [(CPLCloudKitTaskController *)self->_controller cloudKitScopeForScopeIdentifier:v4];
  }

  return v5;
}

- (NSDictionary)transportScopes
{
  id v4 = +[NSAssertionHandler currentHandler];
  unsigned __int8 v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitTransportTask.m"];
  id v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 1379, @"%@ should never be accessed to read here", v6 object file lineNumber description];

  abort();
}

- (void)setTransportScopes:(id)a3
{
  id v5 = a3;
  if (self->_transportScopeMapping)
  {
    uint64_t v11 = sub_1001CB384(a2, self);
    sub_10006D4F0(v11, v12, v13);
  }
  else
  {
    id v6 = v5;
    id v7 = objc_alloc((Class)CPLTransportScopeMapping);
    id v8 = [(CPLCloudKitTransportTask *)self controller];
    id v9 = (CPLTransportScopeMapping *)[v7 initWithTranslator:v8];
    transportScopeMapping = self->_transportScopeMapping;
    self->_transportScopeMapping = v9;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006D4F0;
    v14[3] = &unk_100278CF8;
    v14[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v4];
  id v6 = [v5 zoneID];

  if (!v6)
  {
    id v6 = [(CPLCloudKitTaskController *)self->_controller zoneIDFromScopeIdentifier:v4];
  }

  return v6;
}

- (id)_scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  cacheScopeIdentifiersPerZoneID = self->_cacheScopeIdentifiersPerZoneID;
  if (!cacheScopeIdentifiersPerZoneID)
  {
    if (self->_transportScopeMapping)
    {
      id v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[CPLTransportScopeMapping count](self->_transportScopeMapping, "count"));
      id v7 = self->_cacheScopeIdentifiersPerZoneID;
      self->_cacheScopeIdentifiersPerZoneID = v6;

      transportScopeMapping = self->_transportScopeMapping;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10006D684;
      v11[3] = &unk_100278D20;
      void v11[4] = self;
      [(CPLTransportScopeMapping *)transportScopeMapping enumerateConcreteScopesWithBlock:v11];
      cacheScopeIdentifiersPerZoneID = self->_cacheScopeIdentifiersPerZoneID;
    }
    else
    {
      cacheScopeIdentifiersPerZoneID = 0;
    }
  }
  id v9 = [(NSMutableDictionary *)cacheScopeIdentifiersPerZoneID objectForKeyedSubscript:v4];

  return v9;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLCloudKitTransportTask *)self _scopeIdentifierFromZoneID:v4];
  if (!v5)
  {
    id v5 = [(CPLCloudKitTaskController *)self->_controller scopeIdentifierFromZoneID:v4];
  }

  return v5;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 zoneID];
  id v6 = [(CPLCloudKitTransportTask *)self _scopeIdentifierFromZoneID:v5];

  if (v6)
  {
    id v7 = objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (void)setTransportUserIdentifier:(id)a3
{
}

- (CPLEngineTransportGroup)transportGroup
{
  return self->_transportGroup;
}

- (BOOL)isHighPriorityBackground
{
  return self->_highPriorityBackground;
}

- (void)setHighPriorityBackground:(BOOL)a3
{
  self->_highPriorityBackground = a3;
}

- (BOOL)isForcedTask
{
  return self->_forcedTask;
}

- (void)setForcedTask:(BOOL)a3
{
  self->_forcedTask = a3;
}

- (BOOL)isBackgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(BOOL)a3
{
  self->_backgroundTask = a3;
}

- (BOOL)allowsFetchCache
{
  return self->_allowsFetchCache;
}

- (void)setAllowsFetchCache:(BOOL)a3
{
  self->_allowsFetchCache = a3;
}

- (id)trackingContext
{
  return self->trackingContext;
}

- (void)setTrackingContext:(id)a3
{
}

- (CPLCloudKitTaskController)controller
{
  return self->_controller;
}

- (CPLCloudKitTransportTaskGate)gate
{
  return self->_gate;
}

- (void)setGate:(id)a3
{
}

- (CPLSyncSession)session
{
  return self->_session;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (void)setFetchCache:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (BOOL)isBoostable
{
  return self->_boostable;
}

- (void)setBoostable:(BOOL)a3
{
  self->_boostable = a3;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (BOOL)isUpload
{
  return self->_isUpload;
}

- (void)setIsUpload:(BOOL)a3
{
  self->_isUpload = a3;
}

- (BOOL)isMetadata
{
  return self->_isMetadata;
}

- (void)setIsMetadata:(BOOL)a3
{
  self->_isMetadata = a3;
}

- (NSString)idleDescription
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setIdleDescription:(id)a3
{
}

- (BOOL)hasBackgroundActivity
{
  return self->_hasBackgroundActivity;
}

- (void)setHasBackgroundActivity:(BOOL)a3
{
  self->_hasBackgroundActivity = a3;
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (void)setTransportScopeMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_idleDescription, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchCache, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong(&self->trackingContext, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
  objc_storeStrong(&self->_activityEligibilityChangeHandler, 0);
  objc_storeStrong((id *)&self->_callbackOperationProgress, 0);
  objc_storeStrong((id *)&self->_temporaryFolderURL, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_acquireError, 0);
  objc_storeStrong(&self->_activityRequest, 0);
  objc_storeStrong((id *)&self->_associatedMetrics, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_synchronousWorkQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheScopeIdentifiersPerZoneID, 0);
  objc_storeStrong((id *)&self->_cachedScopes, 0);
  objc_storeStrong((id *)&self->_lastOperationRequestUUIDs, 0);
  objc_storeStrong((id *)&self->_currentOperations, 0);
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 perFoundRecordBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v30 = a4;
  id v34 = a3;
  id v36 = a5;
  id v33 = a8;
  id v35 = (void (**)(id, void, void *, id))a9;
  id v52 = 0;
  LOBYTE(a8) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v52];
  id v12 = v52;
  long long v32 = v12;
  if ((a8 & 1) == 0)
  {
    v35[2](v35, 0, &__NSArray0__struct, v12);
    goto LABEL_38;
  }
  unsigned int v13 = [(CPLCloudKitTransportTask *)self allowsFetchCache];
  double v14 = 0;
  if (v36)
  {
    id v16 = 0;
    id v17 = 0;
  }
  else
  {
    id v15 = self;
    id v16 = 0;
    id v17 = 0;
    if (((v13 ^ 1) & 1) != 0 || v30) {
      goto LABEL_23;
    }
    double v14 = [(CPLCloudKitTransportTask *)self fetchCache];
    if (v14)
    {
      id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v34, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v19 = v34;
      id v16 = 0;
      id v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v49;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v49 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            char v24 = [(CPLCKRecordFetchCache *)v14 cachedRecordWithID:v23];
            if (v24)
            {
              if (!v16) {
                id v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v19, "count"));
              }
              [v16 setObject:v24 forKeyedSubscript:v23];
            }
            else
            {
              [v18 addObject:v23];
            }
          }
          id v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v20);
      }

      id v17 = [v18 copy];
    }
    else
    {
      double v14 = objc_alloc_init(CPLCKRecordFetchCache);
      [(CPLCloudKitTransportTask *)self setFetchCache:v14];
      id v16 = 0;
      id v17 = 0;
    }
  }
  id v15 = self;
LABEL_23:
  if (!a7) {
    sub_1001CC478((uint64_t)a2, (uint64_t)v15);
  }
  if (!v17) {
    id v17 = v34;
  }
  if ([v17 count])
  {
    if (v14) {
      -[CPLCKRecordFetchCache willFetchRecordCount:](v14, "willFetchRecordCount:", [v17 count]);
    }
    id v25 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v17];
    [v25 setShouldFetchAssetContent:v30];
    if (v36) {
      [v25 setDesiredKeys:v36];
    }
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    if (!_CPLSilentLogging)
    {
      int v26 = sub_10007DD68();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [v34 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        id v54 = v25;
        __int16 v55 = 2112;
        id v56 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Will launch %@ to fetch %@", buf, 0x16u);
      }
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10007DDBC;
    v43[3] = &unk_100279340;
    v43[4] = self;
    long long v46 = v47;
    id v44 = v34;
    id v45 = v33;
    [v25 setPerRecordCompletionBlock:v43];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10007DF08;
    v37[3] = &unk_1002793E0;
    v37[4] = self;
    id v38 = v17;
    BOOL v42 = a6;
    id v39 = v14;
    id v40 = v16;
    id v41 = v35;
    [v25 setFetchRecordsCompletionBlock:v37];
    [(CPLCloudKitTransportTask *)self launchOperation:v25 type:a7 withContext:0];

    _Block_object_dispose(v47, 8);
  }
  else
  {
    id v25 = [v16 copy];
    ((void (*)(void))v35[2])();
  }

LABEL_38:
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 wantsAllRecords:(BOOL)a5 type:(int64_t)a6 completionHandler:(id)a7
{
}

- (void)fetchRecordWithNames:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = (void (**)(void, void, void, void))v12;
  if (v11)
  {
    int v26 = self;
    BOOL v27 = v8;
    uint64_t v28 = (void (**)(void, void, void, void))v12;
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v21 = objc_alloc((Class)CKRecordID);
          double v22 = [v11 zoneID];
          id v23 = [v21 initWithRecordName:v20 zoneID:v22];

          [v14 addObject:v23];
        }
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }

    uint64_t v24 = CPLCloudKitOperationTypeForScope(v11);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10007E85C;
    v29[3] = &unk_100279430;
    unsigned int v13 = v28;
    BOOL v30 = v28;
    [(CPLCloudKitTransportTask *)v26 fetchRecordsWithIDs:v14 fetchResources:v27 wantsAllRecords:0 type:v24 completionHandler:v29];
  }
  else
  {
    id v25 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
    ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v25);
  }
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (a5)
  {
    uint64_t v12 = CPLCloudKitOperationTypeForScope(a5);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007EB40;
    v14[3] = &unk_100279430;
    id v15 = v11;
    [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v10 fetchResources:v8 wantsAllRecords:0 type:v12 completionHandler:v14];
  }
  else
  {
    unsigned int v13 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v13);
  }
}

- (void)fetchRecordWithNames:(id)a3 inScope:(id)a4 completionHandler:(id)a5
{
}

- (void)_fetchNextOperationType:(id)a3 followRemapping:(BOOL)a4 recordIDMapping:(id)a5 inResult:(id)a6 storeRequestUUIDsIn:(id)a7 completionHandler:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    id v19 = [v14 allKeys];
    uint64_t v20 = [v19 firstObject];

    id v21 = [v14 objectForKeyedSubscript:v20];
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    BOOL v27 = sub_10007ED4C;
    uint64_t v28 = &unk_100279458;
    id v29 = v17;
    id v30 = v16;
    id v31 = v15;
    id v32 = v14;
    id v22 = v20;
    id v33 = v22;
    long long v34 = self;
    BOOL v36 = v12;
    id v35 = v18;
    id v23 = objc_retainBlock(&v25);
    id v24 = objc_msgSend(v22, "integerValue", v25, v26, v27, v28);
    if (v12) {
      [(CPLCloudKitTransportTask *)self fetchRecordsFollowRemappingWithIDs:v21 wantsAllRecords:0 type:v24 completionHandler:v23];
    }
    else {
      [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v21 fetchResources:0 wantsAllRecords:0 type:v24 completionHandler:v23];
    }
  }
  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

- (void)_fetchRecordWithScopedIdentifiers:(id)a3 followRemapping:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v48 = 0;
  id v38 = self;
  LOBYTE(a5) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v48];
  id v10 = v48;
  id v11 = v10;
  if (a5)
  {
    BOOL v33 = v6;
    long long v34 = (void (**)(void, void, void, void))v9;
    id v35 = v10;
    id v39 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v36 = v8;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v45;
      id obj = v13;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v19 = [v18 identifier];
          uint64_t v20 = [v18 scopeIdentifier];
          id v21 = [(CPLCloudKitTransportTask *)v38 cloudKitScopeForScopeIdentifier:v20];

          if (!v21)
          {
            id v32 = +[CPLErrors cplErrorWithCode:80, @"Missing required zone for %@", v18 description];
            id v9 = v34;
            ((void (**)(void, void, void, void *))v34)[2](v34, 0, 0, v32);
            id v31 = v39;
            id v30 = obj;
            goto LABEL_15;
          }
          id v22 = [v21 recordIDWithRecordName:v19];
          id v23 = v12;
          [v12 setObject:v18 forKeyedSubscript:v22];
          uint64_t v24 = CPLCloudKitOperationTypeForScope(v21);
          id v25 = +[NSNumber numberWithInteger:v24];
          id v26 = [v39 objectForKeyedSubscript:v25];

          if (!v26)
          {
            id v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
            BOOL v27 = +[NSNumber numberWithInteger:v24];
            [v39 setObject:v26 forKeyedSubscript:v27];
          }
          [v26 addObject:v22];

          id v12 = v23;
        }
        id v13 = obj;
        id v15 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v28 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v13, "count"));
    id v29 = objc_alloc_init((Class)NSMutableArray);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10007F2CC;
    v40[3] = &unk_100279480;
    id v9 = v34;
    id v42 = v28;
    long long v43 = v34;
    id v41 = v29;
    id v19 = v28;
    id v30 = v29;
    id v31 = v39;
    [(CPLCloudKitTransportTask *)v38 _fetchNextOperationType:v39 followRemapping:v33 recordIDMapping:v12 inResult:v19 storeRequestUUIDsIn:v30 completionHandler:v40];

    id v32 = v43;
LABEL_15:

    id v11 = v35;
    id v8 = v36;
  }
  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v10);
  }
}

- (void)fetchRecordWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (id)_interpretedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v13 = 0;
    goto LABEL_28;
  }
  id v10 = a5;
  unsigned int v11 = objc_msgSend(v8, "cpl_inExpunged");
  id v28 = 0;
  id v12 = [v9 scopeIdentifier];
  id v13 = objc_msgSend(v8, "cpl_recordChangeMissingResourceProperties:scopeIdentifier:scopeProvider:currentUserRecordID:", &v28, v12, self, v10);

  id v14 = v28;
  if (v11 && v13)
  {
    if (([v13 allResourcesAreAvailable] & 1) == 0)
    {

      if (!_CPLSilentLogging)
      {
        id v13 = sub_10007DD68();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v30 = v15;
          __int16 v31 = 2112;
          id v32 = v9;
          id v16 = v15;
          id v17 = "Fetched <%@ %@> from server, it is expunged but is expired - discarding";
          id v18 = v13;
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x16u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
      goto LABEL_26;
    }
LABEL_10:
    if (v11)
    {
      if (_CPLSilentLogging) {
        goto LABEL_19;
      }
      uint64_t v20 = sub_10007DD68();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      id v21 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v30 = v21;
      __int16 v31 = 2112;
      id v32 = v9;
      id v22 = v21;
      id v23 = "Fetched <%@ %@> from server, it is expunged but not expired on server - keeping";
      uint64_t v24 = v20;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (_CPLSilentLogging) {
        goto LABEL_19;
      }
      uint64_t v20 = sub_10007DD68();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_18:

LABEL_19:
        if (![v13 isDelete]) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      id v26 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v30 = v26;
      __int16 v31 = 2112;
      id v32 = v9;
      id v22 = v26;
      id v23 = "Fetched <%@ %@> from server";
      uint64_t v24 = v20;
      os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0x16u);

    goto LABEL_18;
  }
  if (v13) {
    goto LABEL_10;
  }
  if (!_CPLSilentLogging)
  {
    id v13 = sub_10007DD68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 recordType];
      *(_DWORD *)buf = 138412546;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v9;
      id v17 = "Fetched <%@ %@> from server but failed to decode it";
      id v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_24;
    }
LABEL_25:
  }
LABEL_26:
  id v13 = 0;
LABEL_27:

LABEL_28:
  return v13;
}

- (id)_interpretedSharedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && ([v8 recordType],
        unsigned int v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [CPLRecordChangeClassForCKRecordType(v11) supportsSharing],
        v11,
        v12))
  {
    id v13 = [(CPLCloudKitTransportTask *)self _interpretedChangeFromCKRecord:v8 scopedIdentifier:v9 userRecordID:v10];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_sharedRecordToPrivateRecord:(id)a3 scopedIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 supportsSharingScopedIdentifier])
  {
    id v7 = [v5 scopedIdentifier];
    [v5 setSharingRecordScopedIdentifier:v7];
  }
  [v5 setScopedIdentifier:v6];
  [v5 awakeFromStorage];
  id v8 = [v5 recordChangeData];
  [v5 setSharingRecordChangeData:v8];

  [v5 setRecordChangeData:0];
  return v5;
}

- (void)_mergePrivateRecord:(id)a3 withSharedRecord:(id)a4 merger:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 scopedIdentifier];
  id v10 = [v11 scopedIdentifier];
  [v8 setScopedIdentifier:v10];

  [v8 awakeFromStorage];
  [v7 mergeRecord:v8 isSharedRecord:1 inPrivateRecord:v11];

  if ([v11 supportsSharingScopedIdentifier]) {
    [v11 setSharingRecordScopedIdentifier:v9];
  }
}

- (BOOL)_mergeFoundCKRecords:(id)a3 updateFoundCPLRecords:(id)a4 remainingScopedIdentifiers:(id)a5 fetchedScopedIdentifiers:(id)a6 userRecordID:(id)a7 targetMapping:(id)a8 error:(id *)a9
{
  id v180 = a3;
  id v170 = a4;
  id v15 = a5;
  id v155 = a6;
  id v179 = a7;
  id v16 = a8;
  id v17 = objc_alloc((Class)CPLSharedRecordMerger);
  v181 = self;
  id v18 = [(CPLCloudKitTransportTask *)self controller];
  os_log_type_t v19 = [v18 propertyMapping];
  id v148 = [v17 initWithMapping:v19];

  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  v172 = v15;
  id obj = [v15 allObjects];
  id v173 = [obj countByEnumeratingWithState:&v187 objects:v191 count:16];
  if (v173)
  {
    uint64_t v171 = *(void *)v188;
    id v169 = v16;
    do
    {
      for (i = 0; i != v173; i = (char *)i + 1)
      {
        if (*(void *)v188 != v171) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v187 + 1) + 8 * i);
        id v22 = [v16 targetForRecordWithScopedIdentifier:v21];
        id v23 = [v22 otherScopedIdentifier];
        uint64_t v24 = [v180 objectForKeyedSubscript:v21];
        os_log_type_t v25 = v24;
        if (!v24) {
          goto LABEL_9;
        }
        id v26 = v22;
        BOOL v27 = [v24 recordID];
        id v28 = [v27 recordName];
        id v29 = [v21 identifier];
        unsigned __int8 v30 = [v28 isEqualToString:v29];

        if (v30)
        {
          id v22 = v26;
LABEL_9:
          if (v23) {
            goto LABEL_10;
          }
          goto LABEL_23;
        }
        id v50 = objc_alloc((Class)CPLScopedIdentifier);
        long long v51 = [v25 recordID];
        id v52 = [v51 recordName];
        id v53 = [v50 initRelativeToScopedIdentifier:v21 identifier:v52];

        if (v23)
        {
          id v54 = objc_alloc((Class)CPLScopedIdentifier);
          __int16 v55 = [v25 recordID];
          id v56 = [v55 recordName];
          id v57 = [v54 initRelativeToScopedIdentifier:v23 identifier:v56];

          id v23 = v57;
        }
        id v22 = objc_msgSend(objc_alloc((Class)CPLRecordTarget), "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v53, v23, objc_msgSend(v26, "targetState"));

        [v16 setTarget:v22 forRecordWithScopedIdentifier:v21];
        if (v23)
        {
LABEL_10:
          v182[0] = _NSConcreteStackBlock;
          v182[1] = 3221225472;
          v182[2] = sub_1000808D0;
          v182[3] = &unk_1002794A8;
          v182[4] = v21;
          id v183 = v170;
          id v184 = v22;
          id v31 = v16;
          id v185 = v31;
          id v186 = v172;
          id v32 = objc_retainBlock(v182);
          BOOL v33 = [(CPLCloudKitTransportTask *)v181 _interpretedChangeFromCKRecord:v25 scopedIdentifier:v21 userRecordID:v179];
          if (!v33)
          {
LABEL_15:
            v162 = v25;
            id v174 = v22;
            long long v34 = [v180 objectForKeyedSubscript:v23];
            id v38 = v23;
            id v39 = v38;
            if (v34)
            {
              id v40 = [v34 recordID];
              id v41 = [v40 recordName];
              [v38 identifier];
              v43 = id v42 = v32;
              unsigned __int8 v44 = [v41 isEqual:v43];

              id v32 = v42;
              id v39 = v38;
              if ((v44 & 1) == 0)
              {
                id v45 = objc_alloc((Class)CPLScopedIdentifier);
                long long v46 = [v34 recordID];
                long long v47 = [v46 recordName];
                id v39 = [v45 initRelativeToScopedIdentifier:v38 identifier:v47];

                id v32 = v42;
              }
            }
            id v48 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v34 scopedIdentifier:v38 userRecordID:v179];
            if (v48)
            {
              long long v49 = [(CPLCloudKitTransportTask *)v181 _sharedRecordToPrivateRecord:v48 scopedIdentifier:v21];
              ((void (*)(void *, void *, id, uint64_t))v32[2])(v32, v49, v39, 2);
            }
            else if ([v155 containsObject:v38])
            {
              ((void (*)(void *, void, id, void))v32[2])(v32, 0, v39, 0);
            }

            id v16 = v169;
            id v22 = v174;
            os_log_type_t v25 = v162;
            goto LABEL_98;
          }
          long long v34 = v33;
          if ([v33 supportsSharingScopedIdentifier])
          {
            id v35 = v22;
            id v36 = [v23 scopeIdentifier];
            unsigned int v37 = [v34 isSharedInScopeWithIdentifier:v36];

            if (v37)
            {
              id v22 = v35;
              if ([v34 inExpunged])
              {

                goto LABEL_15;
              }
            }
            else
            {
              [v34 setSharingScopeIdentifier:0];
              id v22 = v35;
            }
          }
          if ([v34 isMasterChange])
          {
            id v175 = v22;
            unsigned int v62 = [v34 inExpunged];
            id v63 = [v180 objectForKeyedSubscript:v23];
            id v64 = v23;
            v65 = v64;
            if (v62)
            {
              v156 = (void (**)(void, void *, id, uint64_t))v32;
              id v66 = v64;
              v67 = v63;
              if (v63)
              {
                [v63 recordID];
                v68 = v163 = v63;
                id v69 = [v68 recordName];
                id v70 = [v65 identifier];
                unsigned __int8 v71 = [v69 isEqual:v70];

                v67 = v163;
                id v66 = v65;
                if ((v71 & 1) == 0)
                {
                  id v72 = objc_alloc((Class)CPLScopedIdentifier);
                  long long v73 = [v163 recordID];
                  long long v74 = [v73 recordName];
                  id v75 = v72;
                  v67 = v163;
                  id v66 = [v75 initRelativeToScopedIdentifier:v65 identifier:v74];
                }
              }
              long long v76 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v67 scopedIdentifier:v65 userRecordID:v179];
              long long v77 = v76;
              if (!v76)
              {
                id v16 = v169;
                if (([v155 containsObject:v65] & 1) == 0) {
                  goto LABEL_64;
                }
                goto LABEL_65;
              }
              id v16 = v169;
              if (([v76 inExpunged] & 1) == 0)
              {
                long long v78 = [(CPLCloudKitTransportTask *)v181 _sharedRecordToPrivateRecord:v77 scopedIdentifier:v21];
                v156[2](v156, v78, v66, 2);

                goto LABEL_66;
              }
LABEL_64:
              if ([v77 inExpunged]) {
LABEL_65:
              }
                v156[2](v156, v34, v66, 1);
LABEL_66:

              id v22 = v175;
              id v32 = v156;
LABEL_98:

              goto LABEL_99;
            }
            id v93 = v64;
            v94 = v63;
            if (v63)
            {
              [v63 recordID];
              v95 = v165 = v63;
              v96 = [v95 recordName];
              v97 = [v65 identifier];
              unsigned __int8 v98 = [v96 isEqual:v97];

              v94 = v165;
              id v93 = v65;
              if ((v98 & 1) == 0)
              {
                id v99 = objc_alloc((Class)CPLScopedIdentifier);
                v100 = [v165 recordID];
                v101 = [v100 recordName];
                v102 = v99;
                v94 = v165;
                id v93 = [v102 initRelativeToScopedIdentifier:v65 identifier:v101];
              }
            }
            v103 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v94 scopedIdentifier:v65 userRecordID:v179];
            v104 = v103;
            if (v103)
            {
              id v16 = v169;
              if (([v103 inExpunged] & 1) == 0)
              {
                uint64_t v105 = 3;
                goto LABEL_70;
              }
LABEL_68:
              if ([v104 inExpunged])
              {
LABEL_69:
                uint64_t v105 = 1;
LABEL_70:
                ((void (*)(void *, void *, id, uint64_t))v32[2])(v32, v34, v93, v105);
              }

              id v22 = v175;
              goto LABEL_98;
            }
            id v16 = v169;
            if (([v155 containsObject:v65] & 1) == 0) {
              goto LABEL_68;
            }
            goto LABEL_69;
          }
          if ([v34 supportsSharingScopedIdentifier])
          {
            if (![v34 inExpunged])
            {
              v106 = [v34 sharingRecordScopedIdentifier];
              if (v106)
              {
                v166 = v25;
                id v107 = v180;
                v108 = [v180 objectForKeyedSubscript:v106];
                v152 = v106;
                id v109 = v106;
                id v110 = v109;
                if (v108)
                {
                  v153 = v109;
                  v111 = [v108 recordID];
                  [v111 recordName];
                  v112 = id v177 = v22;
                  [v153 identifier];
                  v113 = v158 = v32;
                  unsigned __int8 v150 = [v112 isEqual:v113];

                  id v32 = v158;
                  id v107 = v180;

                  id v22 = v177;
                  id v109 = v153;
                  id v110 = v153;
                  if ((v150 & 1) == 0)
                  {
                    id v114 = objc_alloc((Class)CPLScopedIdentifier);
                    v115 = [v108 recordID];
                    v116 = [v115 recordName];
                    id v110 = [v114 initRelativeToScopedIdentifier:v153 identifier:v116];

                    id v32 = v158;
                    id v107 = v180;

                    id v109 = v153;
                    id v22 = v177;
                  }
                }
                v159 = v110;
                v154 = v108;
                v117 = v107;
                id v118 = v109;
                v119 = [v117 objectForKeyedSubscript:v109];
                v120 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v119 scopedIdentifier:v23 userRecordID:v179];

                if (v120)
                {
                  v121 = v118;
                  os_log_type_t v25 = v166;
                  if ([v120 inExpunged])
                  {
                    id v16 = v169;
                    if ([v34 inExpunged]) {
                      sub_1001CC548((uint64_t)v34, (uint64_t)a2, (uint64_t)v181);
                    }
                    id v149 = objc_alloc((Class)CPLScopedIdentifier);
                    [v121 scopeIdentifier];
                    v122 = v151 = v120;
                    [v21 identifier];
                    v124 = id v123 = v22;
                    id v125 = [v149 initWithScopeIdentifier:v122 identifier:v124];
                    ((void (*)(void *, void, id, uint64_t))v32[2])(v32, 0, v125, 1);

                    id v22 = v123;
                    v120 = v151;
                  }
                  else
                  {
                    [(CPLCloudKitTransportTask *)v181 _mergePrivateRecord:v34 withSharedRecord:v120 merger:v148];
                    ((void (*)(void *, void *, void *, uint64_t))v32[2])(v32, v34, v159, 3);
                    id v16 = v169;
                  }
                  v106 = v152;
                }
                else
                {
                  v138 = v118;
                  unsigned int v139 = [v155 containsObject:v118];
                  os_log_type_t v25 = v166;
                  if (v139)
                  {
                    id v140 = objc_alloc((Class)CPLScopedIdentifier);
                    id v141 = [v138 scopeIdentifier];
                    [v21 identifier];
                    v143 = id v142 = v22;
                    id v144 = [v140 initWithScopeIdentifier:v141 identifier:v143];
                    ((void (*)(void *, void, id, void))v32[2])(v32, 0, v144, 0);

                    id v22 = v142;
                  }
                  else
                  {
                    id v141 = [objc_alloc((Class)CPLRecordTarget) initWithScopedIdentifier:v21 otherScopedIdentifier:v138 targetState:0];
                    [v31 setTarget:v141 forRecordWithScopedIdentifier:v21];
                  }

                  id v16 = v169;
                  v120 = 0;
                  v106 = v152;
                }
              }
              else if ([v34 inExpunged])
              {
                v160 = (void (**)(void, void *, id, uint64_t))v32;
                id v178 = v22;
                v127 = [v180 objectForKeyedSubscript:v23];
                id v128 = v23;
                id v129 = v128;
                if (v127)
                {
                  v130 = [v127 recordID];
                  v131 = [v130 recordName];
                  v132 = [v128 identifier];
                  unsigned __int8 v167 = [v131 isEqual:v132];

                  id v129 = v128;
                  if ((v167 & 1) == 0)
                  {
                    id v133 = objc_alloc((Class)CPLScopedIdentifier);
                    v134 = [v127 recordID];
                    v135 = [v134 recordName];
                    id v129 = [v133 initRelativeToScopedIdentifier:v128 identifier:v135];
                  }
                }
                v168 = v127;
                v136 = [v180 objectForKeyedSubscript:v128];
                v137 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v136 scopedIdentifier:v128 userRecordID:v179];

                if (v137)
                {
                  id v32 = v160;
                  if ([v137 inExpunged])
                  {
                    v160[2](v160, v34, v129, 1);
                  }
                  else
                  {
                    v145 = [(CPLCloudKitTransportTask *)v181 _sharedRecordToPrivateRecord:v137 scopedIdentifier:v21];
                    v160[2](v160, v145, v129, 2);
                  }
                  v106 = 0;
                }
                else
                {
                  id v32 = v160;
                  v106 = 0;
                  if ([v155 containsObject:v128]) {
                    v160[2](v160, v34, v129, 1);
                  }
                }

                id v16 = v169;
                id v22 = v178;
              }
              else
              {
                ((void (*)(void *, void *, void *, uint64_t))v32[2])(v32, v34, v23, 1);
                id v16 = v169;
              }

              goto LABEL_98;
            }
            v157 = (void (**)(void, void *, id, uint64_t))v32;
            id v176 = v22;
            long long v79 = [v180 objectForKeyedSubscript:v23];
            id v80 = v23;
            id v81 = v80;
            v164 = v79;
            if (v79)
            {
              id v82 = [v79 recordID];
              id v83 = [v82 recordName];
              int64_t v84 = [v80 identifier];
              unsigned __int8 v85 = [v83 isEqual:v84];

              long long v79 = v164;
              id v81 = v80;
              if ((v85 & 1) == 0)
              {
                id v86 = objc_alloc((Class)CPLScopedIdentifier);
                v87 = [v164 recordID];
                id v88 = [v87 recordName];
                __int16 v89 = v86;
                long long v79 = v164;
                id v81 = [v89 initRelativeToScopedIdentifier:v80 identifier:v88];
              }
            }
            v90 = [(CPLCloudKitTransportTask *)v181 _interpretedSharedChangeFromCKRecord:v79 scopedIdentifier:v80 userRecordID:v179];
            v91 = v90;
            if (!v90)
            {
              unsigned __int8 v126 = [v155 containsObject:v80];
              id v22 = v176;
              id v32 = v157;
              if ((v126 & 1) == 0) {
                goto LABEL_73;
              }
              goto LABEL_74;
            }
            id v22 = v176;
            id v32 = v157;
            if (([v90 inExpunged] & 1) == 0)
            {
              v92 = [(CPLCloudKitTransportTask *)v181 _sharedRecordToPrivateRecord:v91 scopedIdentifier:v21];
              v157[2](v157, v92, v81, 2);

              goto LABEL_75;
            }
LABEL_73:
            if ([v91 inExpunged]) {
LABEL_74:
            }
              ((void (*)(void *, void *, id, uint64_t))v32[2])(v32, v34, v81, 1);
LABEL_75:
          }
          else
          {
            ((void (*)(void *, void *, void *, uint64_t))v32[2])(v32, v34, v23, 1);
          }
          id v16 = v169;
          goto LABEL_98;
        }
LABEL_23:
        id v58 = [(CPLCloudKitTransportTask *)v181 _interpretedChangeFromCKRecord:v25 scopedIdentifier:v21 userRecordID:v179];
        id v59 = v58;
        if (v58)
        {
          id v60 = [v58 scopedIdentifier];
          unsigned __int8 v61 = [v60 isEqual:v21];

          if ((v61 & 1) == 0)
          {
            [v59 setScopedIdentifier:v21];
            [v59 awakeFromStorage];
          }
          [v170 setObject:v59 forKeyedSubscript:v21];
        }
        [v172 removeObject:v21];

LABEL_99:
      }
      id v173 = [obj countByEnumeratingWithState:&v187 objects:v191 count:16];
    }
    while (v173);
  }

  return 1;
}

- (void)_fetchRecordsForRemainingScopedIdentifiers:(id)a3 alreadyFetchedScopedIdentifiers:(id)a4 userRecordID:(id)a5 foundCPLRecords:(id)a6 foundCKRecords:(id)a7 targetMapping:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([v15 count])
  {
    id v65 = 0;
    unsigned __int8 v22 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v65];
    id v23 = v65;
    uint64_t v24 = v23;
    if (v22)
    {
      id v41 = v23;
      id v42 = v19;
      long long v43 = v18;
      unsigned __int8 v44 = v17;
      id v25 = objc_alloc_init((Class)NSMutableArray);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_100080E08;
      v61[3] = &unk_1002794D0;
      id v45 = v16;
      id v26 = v16;
      BOOL v27 = self;
      id v28 = v26;
      id v62 = v26;
      id v63 = v27;
      id v39 = v27;
      id v40 = v25;
      id v64 = v40;
      id v29 = objc_retainBlock(v61);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v46 = v15;
      id v30 = v15;
      id v31 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v58;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v58 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            uint64_t v36 = objc_msgSend(v20, "targetForRecordWithScopedIdentifier:", v35, v39);
            if (!v36) {
              sub_1001CC630(v35, (uint64_t)a2, (uint64_t)v39);
            }
            unsigned int v37 = (void *)v36;
            if ([v28 containsObject:v35])
            {
              id v38 = [v37 otherScopedIdentifier];
              if (v38) {
                ((void (*)(void *, void *))v29[2])(v29, v38);
              }
            }
            else
            {
              ((void (*)(void *, uint64_t))v29[2])(v29, v35);
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v32);
      }

      if ([v40 count])
      {
        [v28 addObjectsFromArray:v40];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100080EA4;
        v48[3] = &unk_1002794F8;
        id v19 = v42;
        id v49 = v42;
        id v50 = v39;
        id v18 = v43;
        id v51 = v43;
        id v52 = v30;
        id v53 = v28;
        id v17 = v44;
        id v54 = v44;
        id v55 = v20;
        id v56 = v21;
        [(CPLCloudKitTransportTask *)v39 _fetchRecordWithScopedIdentifiers:v40 followRemapping:1 completionHandler:v48];
      }
      else
      {
        id v18 = v43;
        (*((void (**)(id, void *, void))v21 + 2))(v21, v43, 0);
        id v17 = v44;
        id v19 = v42;
      }
      uint64_t v24 = v41;

      id v16 = v45;
      id v15 = v46;
    }
    else
    {
      (*((void (**)(id, void, id))v21 + 2))(v21, 0, v23);
    }
  }
  else
  {
    (*((void (**)(id, id, void))v21 + 2))(v21, v18, 0);
  }
}

- (void)fetchFullRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000810A8;
  v11[3] = &unk_100279520;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v11];
}

- (void)fetchUnknownTargetsInMapping:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasUnknownTargets])
  {
    id v8 = [(CPLCloudKitTransportTask *)self transportScopeMapping];
    unsigned int v9 = [v8 hasStagingScopes];

    if (v9) {
      [v6 allTargetScopedIdentifiers];
    }
    else {
    id v10 = [v6 unknownTargetScopedIdentifiers];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000812EC;
    v11[3] = &unk_100279548;
    id v14 = [v10 count];
    char v15 = v9;
    id v12 = v6;
    id v13 = v7;
    [(CPLCloudKitTransportTask *)self fetchFullRecordsForScopedIdentifiers:v10 targetMapping:v12 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)fetchPlaceholderRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000814FC;
  v12[3] = &unk_1002795C0;
  id v13 = a3;
  id v14 = a4;
  id v16 = a5;
  SEL v17 = a2;
  char v15 = self;
  id v9 = v14;
  id v10 = v16;
  id v11 = v13;
  [(CPLCloudKitTransportTask *)self fetchUnknownTargetsInMapping:v9 completionHandler:v12];
}

- (void)_fetchZoneForZoneID:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v21 = 0;
  unsigned __int8 v10 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v21];
  id v11 = v21;
  if (v10)
  {
    id v12 = objc_alloc((Class)CKFetchRecordZonesOperation);
    id v22 = v8;
    id v13 = +[NSArray arrayWithObjects:&v22 count:1];
    id v14 = [v12 initWithRecordZoneIDs:v13];

    char v15 = [v14 operationID];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100081AB8;
    v17[3] = &unk_1002795E8;
    v17[4] = self;
    id v18 = v8;
    id v19 = v15;
    id v20 = v9;
    id v16 = v15;
    [v14 setFetchRecordZonesCompletionBlock:v17];
    [(CPLCloudKitTransportTask *)self launchOperation:v14 type:a4 withContext:0];
  }
  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v11);
  }
}

- (void)fetchZoneForScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 zoneID];
  if (v8)
  {
    uint64_t v9 = CPLCloudKitOperationTypeForScope(v6);
    unsigned __int8 v10 = [v6 zoneID];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081F0C;
    v12[3] = &unk_100279638;
    id v13 = v8;
    id v14 = self;
    uint64_t v16 = v9;
    id v15 = v7;
    [(CPLCloudKitTransportTask *)self _fetchZoneForZoneID:v10 operationType:v9 completionHandler:v12];
  }
  else
  {
    id v11 = +[CPLErrors cplErrorWithCode:32, @"No zone for %@", v6 description];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
  }
}

- (void)_fetchRecordsFollowRemappingWithIDs:(id)a3 alreadyFetchRecordIDs:(id)a4 remappedRecordIDs:(id)a5 realRecords:(id)a6 type:(int64_t)a7 storeRequestUUIDsIn:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000821D4;
  v25[3] = &unk_100279688;
  id v26 = a8;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  id v30 = v18;
  id v31 = self;
  id v32 = a9;
  int64_t v33 = a7;
  id v19 = v18;
  id v20 = v17;
  id v21 = v15;
  id v22 = v16;
  id v23 = v32;
  id v24 = v26;
  [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v21 fetchResources:0 wantsAllRecords:0 type:a7 completionHandler:v25];
}

- (id)_recordWithRecordID:(id)a3 usingRealRecords:(id)a4 remappedRecordIDs:(id)a5 wantsAllRecords:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 objectForKeyedSubscript:v9];
  if (v12)
  {
    id v13 = (void *)v12;
    goto LABEL_32;
  }
  id v14 = v9;
  uint64_t v15 = [v11 objectForKeyedSubscript:v14];
  id v16 = 0;
  if (v15)
  {
    id v9 = v14;
    while (1)
    {
      id v17 = (void *)v15;
      uint64_t v18 = [v10 objectForKeyedSubscript:v15];
      if (v18)
      {
        id v13 = (void *)v18;
        if (_CPLSilentLogging) {
          goto LABEL_31;
        }
        id v19 = sub_10007DD68();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543618;
          id v27 = v14;
          __int16 v28 = 2114;
          id v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ has been remapped to %{public}@", (uint8_t *)&v26, 0x16u);
        }
        goto LABEL_29;
      }
      if (!v16) {
        id v16 = objc_alloc_init((Class)NSMutableSet);
      }
      [v16 addObject:v9];
      if ([v16 containsObject:v17]) {
        break;
      }

      uint64_t v15 = [v11 objectForKeyedSubscript:v17];
      id v9 = v17;
      if (!v15)
      {
        if (v6) {
          goto LABEL_13;
        }
        goto LABEL_30;
      }
    }
    if (_CPLSilentLogging)
    {
      id v13 = 0;
      goto LABEL_31;
    }
    id v19 = sub_10007DD68();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v16 allObjects];
      id v24 = [v23 componentsJoinedByString:@", "];
      int v26 = 138543874;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v17;
      __int16 v30 = 2114;
      id v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ has been remapped to %{public}@ in an infinite loop: %{public}@", (uint8_t *)&v26, 0x20u);
    }
    id v13 = 0;
    goto LABEL_29;
  }
  id v17 = v14;
  if (!v6) {
    goto LABEL_30;
  }
LABEL_13:
  if ([v17 isEqual:v14])
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_10007DD68();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138543362;
        id v27 = v14;
        id v20 = "%{public}@ record not found on server";
        id v21 = v19;
        uint32_t v22 = 12;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v26, v22);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
LABEL_30:
    id v13 = 0;
    id v9 = v17;
    id v17 = 0;
    goto LABEL_31;
  }
  if (_CPLSilentLogging) {
    goto LABEL_30;
  }
  id v19 = sub_10007DD68();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v26 = 138543618;
    id v27 = v14;
    __int16 v28 = 2114;
    id v29 = v17;
    id v20 = "%{public}@ record (remapped to %{public}@) not found on server";
    id v21 = v19;
    uint32_t v22 = 22;
    goto LABEL_27;
  }
LABEL_28:
  id v13 = 0;
  id v9 = v17;
  id v17 = 0;
LABEL_29:

LABEL_31:
LABEL_32:

  return v13;
}

- (void)fetchRecordsFollowRemappingWithIDs:(id)a3 wantsAllRecords:(BOOL)a4 type:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [v10 count];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = [objc_alloc((Class)NSMutableSet) initWithCapacity:v12];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000829D8;
  v20[3] = &unk_1002796B0;
  id v21 = v13;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v27 = a4;
  id v23 = v10;
  id v24 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v12];
  id v25 = self;
  id v26 = v11;
  id v15 = v24;
  id v16 = v10;
  id v17 = v22;
  id v18 = v13;
  id v19 = v11;
  [(CPLCloudKitTransportTask *)self _fetchRecordsFollowRemappingWithIDs:v16 alreadyFetchRecordIDs:v14 remappedRecordIDs:v17 realRecords:v15 type:a5 storeRequestUUIDsIn:v18 completionHandler:v20];
}

- (void)_createSparsePrivateRecordsIfNecessary:(id)a3 recordClass:(Class)a4 userRecordID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v24 = a5;
  id v12 = a6;
  id v13 = [v11 propertyMapping];
  unsigned __int8 v14 = [v13 doesRecordClassSupportSparseRecords:a4];

  if ((v14 & 1) == 0) {
    sub_1001CD5B0((uint64_t)a4, (uint64_t)a2, (uint64_t)self);
  }
  id v15 = CKRecordTypeForCPLRecordChangeClass((uint64_t)a4);
  id v16 = [v11 sharedRecordIDsToMissingPrivateRecordIDs];
  if ([v16 count])
  {
    uint64_t v17 = [v11 sharedZoneIdentification];
    if (!v17) {
      sub_1001CD4E0((uint64_t)a2, (uint64_t)self);
    }
    id v18 = (void *)v17;
    id v19 = [v16 allKeys];
    id v20 = [v11 sharedZoneIdentification];
    id v23 = [v20 operationType];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100097250;
    v25[3] = &unk_100279DE0;
    id v32 = v12;
    id v26 = v16;
    id v27 = v15;
    __int16 v28 = self;
    SEL v33 = a2;
    Class v34 = a4;
    id v29 = v18;
    id v30 = v11;
    id v21 = v24;
    id v31 = v24;
    id v22 = v18;
    [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v19 fetchResources:0 wantsAllRecords:0 type:v23 completionHandler:v25];
  }
  else
  {
    (*((void (**)(id, void *, void))v12 + 2))(v12, &__NSDictionary0__struct, 0);
    id v21 = v24;
  }
}

- (id)_errorForUpdateError:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    id v9 = +[CPLCloudKitErrors realErrorForError:v8];

    id v10 = [v9 domain];
    unsigned int v11 = [v10 isEqualToString:CKErrorDomain];

    if (v11 && ([v9 code] == (id)26 || objc_msgSend(v9, "code") == (id)28))
    {
      id v12 = 0;
LABEL_8:

      goto LABEL_10;
    }
    if (v9)
    {
      uint64_t v13 = [(CPLCloudKitTransportTask *)self lastOperationRequestUUIDs];
      id v12 = +[CPLCloudKitErrors CPLErrorForCloudKitError:v9 scopeProvider:v7 withRequestUUIDs:v13 description:@"Failed to update records"];

      id v9 = (void *)v13;
      goto LABEL_8;
    }
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (void)updatePrivatePropertiesOnAssetsWithScopedIdentifiers:(id)a3 desiredKeys:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 knownRecords:(id)a8 shouldUpdateRecord:(id)a9 updateBlock:(id)a10 completionHandler:(id)a11
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100097A08;
  v34[3] = &unk_100279EA8;
  v34[4] = self;
  id v35 = v32;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v16;
  id v41 = a11;
  id v42 = v21;
  id v43 = v22;
  id v23 = v22;
  id v24 = v21;
  id v25 = v16;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v32;
  id v31 = v41;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v34];
}

- (void)updateRecords:(id)a3 cloudKitScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v22 = self;
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v18 = objc_msgSend(v17, "recordID", v22);
          [v11 setObject:v17 forKeyedSubscript:v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    id v19 = [v11 allKeys];
    uint64_t v20 = CPLCloudKitOperationTypeForScope(v9);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100098818;
    void v23[3] = &unk_100279ED0;
    id v24 = v12;
    id v28 = v10;
    id v25 = v11;
    id v26 = v22;
    id v27 = v9;
    id v21 = v11;
    [(CPLCloudKitTransportTask *)v22 fetchRecordsWithIDs:v19 fetchResources:0 desiredKeys:&__NSArray0__struct wantsAllRecords:0 type:v20 completionHandler:v23];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)uploadRecords:(id)a3 cloudKitScope:(id)a4 scopeProvider:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = 0;
  unsigned __int8 v14 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v24];
  id v15 = v24;
  if (v14)
  {
    if ([v10 count])
    {
      id v16 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:&__NSArray0__struct];
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = sub_100098B1C;
      uint64_t v20 = &unk_100279EF8;
      id v21 = self;
      id v23 = v13;
      id v22 = v12;
      [v16 setModifyRecordsCompletionBlock:&v17];
      objc_msgSend(v16, "setSavePolicy:", 1, v17, v18, v19, v20, v21);
      [(CPLCloudKitTransportTask *)self launchOperation:v16 type:CPLCloudKitOperationTypeForScope(v11) withContext:0];
    }
    else
    {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

@end