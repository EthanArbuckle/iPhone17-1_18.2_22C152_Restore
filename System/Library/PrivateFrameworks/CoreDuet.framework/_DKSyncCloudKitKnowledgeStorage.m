@interface _DKSyncCloudKitKnowledgeStorage
+ (id)deviceIDFromZoneID:(id)a3;
+ (id)mySyncZoneID;
+ (id)sharedInstance;
+ (id)zoneIDWithDeviceID:(id)a3;
+ (void)setMySyncZoneID:(uint64_t)a1;
- (BOOL)hasAdditionsFlagForPeer:(id)a3;
- (BOOL)hasDeletionsFlagForPeer:(id)a3;
- (_DKSyncCloudKitKnowledgeStorage)init;
- (__CFString)_handleAnySpecialnessWithOperationError:(id *)a1;
- (id)_previousServerChangeTokenForRecordZoneID:(uint64_t)a1;
- (id)_previousServerChangeTokenKeyForRecordZoneID:(uint64_t)a1;
- (id)executionCriteriaForUpdateSourceDeviceIdentifiersPeriodicJob;
- (id)name;
- (int64_t)transportType;
- (uint64_t)_queueOperationForPrivateCloudDatabase:(int)a3 dependent:(void *)a4 policy:(void *)a5 error:;
- (uint64_t)hasZoneAdditionChangesForZone:(uint64_t)a1;
- (uint64_t)hasZoneDeletionChangesForZone:(uint64_t)a1;
- (uint64_t)populateLastSeenDateIfNeededByPeer:(uint64_t)a1;
- (uint64_t)scheduleRetryUpdateSourceDeviceIdentifiers;
- (uint64_t)startShouldUpdateSourceDeviceIdentifiers;
- (void)_cloudSyncAvailabilityDidChange:(id)a3;
- (void)_createPushConnection;
- (void)_createZoneWithZoneID:(void *)a3 completion:;
- (void)_deleteZoneWithZoneID:(void *)a3 completion:;
- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:(void *)a1;
- (void)_registerCloudSyncAvailablityObserver;
- (void)_registerDatabaseChangesSubscription;
- (void)_resetPreviousServerChangeTokenForRecordZoneID:(uint64_t)a1;
- (void)_setPreviousServerChangeToken:(void *)a3 forRecordZoneID:;
- (void)_storeZoneIDFromRecords:(void *)a3 orError:;
- (void)_unregisterCloudSyncAvailablityObserver;
- (void)addSourceDeviceIdentifierWithRecordZoneID:(uint64_t)a1;
- (void)cancelOutstandingOperations;
- (void)clearPrewarmedFlag;
- (void)commitFetchDatabaseChangesServerChangeToken;
- (void)configurePeerWithSourceDeviceID:(void *)a3 zoneID:;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)fastForwardPastDeletionsInNewZone:(void *)a3 sourceDeviceID:;
- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchChangedZonesWithCompletion:(id *)a1;
- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8;
- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9;
- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)finishStartBecauseCloudIsAvailable;
- (void)finishStartOrError:(uint64_t)a1;
- (void)finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:(void *)a3 orError:(void *)a4 completion:;
- (void)performUpdateSourceDeviceIdentifiersWithCompletion:(uint64_t)a1;
- (void)prewarmFetchWithCompletion:(id)a3;
- (void)registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(id *)a1;
- (void)removeSourceDeviceIdentifierWithRecordZoneID:(id *)a1;
- (void)runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(uint64_t)a1;
- (void)setFetchDelegate:(id)a3;
- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4;
- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4;
- (void)setHasZoneAdditionChanges:(void *)a3 forZone:;
- (void)setHasZoneDeletionChanges:(void *)a3 forZone:;
- (void)setPrewarmedFlag;
- (void)setZoneIDsBySourceDeviceID:(uint64_t)a1;
- (void)start;
- (void)startShouldUpdateSourceDeviceIdentifiers;
- (void)syncDownAdditionsFromCloudWithZoneID:(void *)a3 windows:(void *)a4 streamNames:(unint64_t)a5 limit:(void *)a6 fetchOrder:(void *)a7 completion:;
- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 completion:;
- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 deletedRecordIDsAndTypes:(uint64_t)a4 attempt:(void *)a5 completion:;
- (void)syncUpToCloudWithRecordsToSave:(void *)a3 recordIDsToDelete:(void *)a4 completion:;
- (void)unregisterUpdateSourceDeviceIdentifiersPeriodicJob;
- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:(void *)a3 completion:;
- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6;
@end

@implementation _DKSyncCloudKitKnowledgeStorage

- (__CFString)_handleAnySpecialnessWithOperationError:(id *)a1
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (__CFString *)v3;
    if (+[_DKCKError isUnrecoverableDecryptionError:]((uint64_t)_DKCKError, v5))
    {
      if (_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounterInitialized != -1) {
        dispatch_once(&_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounterInitialized, &__block_literal_global_66);
      }
      v52 = v4;
      v6 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:]();
      }

      v51 = v5;
      v7 = +[_DKCKError zoneIDsWithUnrecoverableDecryptionError:]((uint64_t)_DKCKError, v5);
      v8 = +[_CDLogging syncChannel];
      unint64_t v9 = 0x1E560C000uLL;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = [(id)objc_opt_class() description];
        _CDPrettyPrintCollection(v7, 0, 0, 0);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v76 = v10;
        __int16 v77 = 2114;
        v78 = v11;
        _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_INFO, "%{public}@: Zones with unrecoverable decryption errors: %{public}@", buf, 0x16u);

        unint64_t v9 = 0x1E560C000uLL;
      }

      uint64_t v61 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      v12 = objc_opt_new();
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v85 count:16];
      v60 = v13;
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v71;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v71 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(__CFString **)(*((void *)&v70 + 1) + 8 * v17);
            if (![(__CFString *)v18 isEqual:v61])
            {
              v20 = +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:v18];
              if (v20)
              {
                v21 = [a1[4] existingPeerWithSourceDeviceID:v20];
                v22 = v21;
                if (v21)
                {
                  v23 = [v21 zoneName];

                  if (v23)
                  {
                    v24 = [*(id *)(v9 + 2288) syncChannel];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                    {
                      v57 = [(id)objc_opt_class() description];
                      int v27 = [v22 me];
                      v28 = @"pseudo ";
                      if (!v27) {
                        v28 = &stru_1EDDE58B8;
                      }
                      v55 = v28;
                      v59 = [v22 identifier];
                      uint64_t v29 = [v22 model];
                      v30 = &stru_1EDDE58B8;
                      v56 = (void *)v29;
                      if (v29)
                      {
                        v31 = NSString;
                        v54 = [v22 model];
                        v53 = [v31 stringWithFormat:@" (%@)", v54];
                        v30 = v53;
                      }
                      *(_DWORD *)buf = 138544386;
                      v76 = v57;
                      __int16 v77 = 2114;
                      v78 = v55;
                      __int16 v79 = 2114;
                      uint64_t v80 = (uint64_t)v59;
                      __int16 v81 = 2114;
                      v82 = v30;
                      __int16 v83 = 2114;
                      v84 = v18;
                      _os_log_error_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Deactivating %{public}@peer %{public}@%{public}@ due to unrecoverable decryption error for zone %{public}@", buf, 0x34u);
                      if (v56)
                      {
                      }
                      unint64_t v9 = 0x1E560C000;
                    }

                    [a1[4] removeActiveTransports:4 fromPeer:v22];
                    [a1 setHasAdditionsFlag:0 forPeer:v22];
                    [a1 setHasDeletionsFlag:0 forPeer:v22];
                    goto LABEL_29;
                  }
                }
                v25 = [*(id *)(v9 + 2288) syncChannel];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  v58 = [(id)objc_opt_class() description];
                  *(_DWORD *)buf = 138543618;
                  v76 = v58;
                  __int16 v77 = 2114;
                  v78 = v18;
                  _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecoverable decryption error for unknown peer zone %{public}@", buf, 0x16u);
                }
LABEL_27:
              }
              else
              {
                v22 = [*(id *)(v9 + 2288) syncChannel];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  v25 = [(id)objc_opt_class() description];
                  *(_DWORD *)buf = 138543618;
                  v76 = v25;
                  __int16 v77 = 2114;
                  v78 = v18;
                  _os_log_debug_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecoverable decryption error for non-peer zone %{public}@", buf, 0x16u);
                  goto LABEL_27;
                }
              }
LABEL_29:

              v13 = v60;
              goto LABEL_30;
            }
            -[_DKEventStatsCounter incrementCountByNumber:](_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter, 1);
            if ([a1[15] containsObject:v18])
            {
              v19 = [*(id *)(v9 + 2288) syncChannel];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v26 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                v76 = v26;
                __int16 v77 = 2114;
                v78 = v18;
                _os_log_error_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Repeating unrecoverable decryption error fix for zone %{public}@", buf, 0x16u);
              }
              -[_DKEventStatsCounter incrementCountByNumber:](_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter, 1);
            }
            [v12 addObject:v18];
LABEL_30:
            ++v17;
          }
          while (v15 != v17);
          uint64_t v32 = [v13 countByEnumeratingWithState:&v70 objects:v85 count:16];
          uint64_t v15 = v32;
        }
        while (v32);
      }

      id v33 = a1[15];
      if (v33)
      {
        [v33 unionSet:v13];
      }
      else
      {
        uint64_t v37 = [v13 mutableCopy];
        id v38 = a1[15];
        a1[15] = (id)v37;
      }
      v39 = (void *)v61;
      v40 = objc_opt_new();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v41 = v12;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v67 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(__CFString **)(*((void *)&v66 + 1) + 8 * i);
            v47 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v48 = [(id)objc_opt_class() description];
              *(_DWORD *)buf = 138543618;
              v76 = v48;
              __int16 v77 = 2114;
              v78 = v46;
              _os_log_impl(&dword_18ECEB000, v47, OS_LOG_TYPE_INFO, "%{public}@: Fixing unrecoverable decryption error for zone %{public}@", buf, 0x16u);

              v39 = (void *)v61;
            }

            if ([(__CFString *)v46 isEqual:v39]) {
              [a1[2] setBool:0 forKey:@"HaveCreatedMyZone"];
            }
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_87;
            v62[3] = &unk_1E560DB58;
            v62[4] = a1;
            v62[5] = v46;
            id v63 = v39;
            id v64 = v40;
            id v49 = v41;
            id v65 = v49;
            -[_DKSyncCloudKitKnowledgeStorage _deleteZoneWithZoneID:completion:]((uint64_t)a1, v46, v62);
          }
          uint64_t v43 = [v49 countByEnumeratingWithState:&v66 objects:v74 count:16];
        }
        while (v43);
      }

      +[_DKCKError errorMinusUnrecoverableDecryptionErrorsFromPartialError:]((uint64_t)_DKCKError, v51);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v4 = v52;
      v34 = v60;
    }
    else
    {
      if (!+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v5)) {
        goto LABEL_60;
      }
      v34 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [(id)objc_opt_class() description];
        v36 = [(__CFString *)v5 domain];
        *(_DWORD *)buf = 138544130;
        v76 = v35;
        __int16 v77 = 2114;
        v78 = v36;
        __int16 v79 = 2048;
        uint64_t v80 = [(__CFString *)v5 code];
        __int16 v81 = 2112;
        v82 = v5;
        _os_log_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_INFO, "%{public}@: Failure is temporary, ignoring : %{public}@:%lld (%@)", buf, 0x2Au);
      }
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_60:

  return v5;
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_initialized_0 != -1) {
    dispatch_once(&sharedInstance_initialized_0, &__block_literal_global_10);
  }
  v0 = (void *)sharedInstance_sharedInstance_0;
  return v0;
}

+ (id)mySyncZoneID
{
  return (id)_DKMySyncZoneID;
}

+ (void)setMySyncZoneID:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = (void *)_DKMySyncZoneID;
  _DKMySyncZoneID = (uint64_t)v2;
}

+ (id)zoneIDWithDeviceID:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@%@", @"source-device-id:", a3];
  id v4 = objc_alloc(MEMORY[0x1E4F1A320]);
  v5 = (void *)[v4 initWithZoneName:v3 ownerName:*MEMORY[0x1E4F19CC8]];

  return v5;
}

+ (id)deviceIDFromZoneID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 zoneName];
  int v5 = [v4 hasPrefix:@"source-device-id:"];

  if (v5)
  {
    v6 = [v3 zoneName];
    v7 = [v6 substringFromIndex:objc_msgSend(@"source-device-id:", "length")];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_DKSyncCloudKitKnowledgeStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DKSyncCloudKitKnowledgeStorage;
  id v2 = [(_DKSyncCloudKitKnowledgeStorage *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordZonesByZoneID = v2->_recordZonesByZoneID;
    v2->_recordZonesByZoneID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    outstandingOperations = v2->_outstandingOperations;
    v2->_outstandingOperations = (NSHashTable *)v5;
  }
  return v2;
}

- (void)dealloc
{
  -[_DKSyncCloudKitKnowledgeStorage _unregisterCloudSyncAvailablityObserver]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCloudKitKnowledgeStorage;
  [(_DKSyncCloudKitKnowledgeStorage *)&v3 dealloc];
}

- (void)_unregisterCloudSyncAvailablityObserver
{
  if (a1 && *(unsigned char *)(a1 + 48))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:a1 name:@"_DKCloudSyncAvailablityChangedNotification" object:0];
    *(unsigned char *)(a1 + 48) = 0;
  }
}

- (void)start
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Starting Cloud Transport", v3, v4, v5, v6, v7);
}

- (void)_registerCloudSyncAvailablityObserver
{
  if (a1 && !*(unsigned char *)(a1 + 48))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__cloudSyncAvailabilityDidChange_ name:@"_DKCloudSyncAvailablityChangedNotification" object:0];
    *(unsigned char *)(a1 + 48) = 1;
  }
}

- (void)finishStartBecauseCloudIsAvailable
{
  if (a1)
  {
    if (-[_DKSyncCloudKitKnowledgeStorage startShouldUpdateSourceDeviceIdentifiers]((uint64_t)a1))
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __69___DKSyncCloudKitKnowledgeStorage_finishStartBecauseCloudIsAvailable__block_invoke;
      v2[3] = &unk_1E560D730;
      v2[4] = a1;
      -[_DKSyncCloudKitKnowledgeStorage registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:](a1, v2);
    }
    else
    {
      -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:]((uint64_t)a1, 0);
    }
  }
}

- (void)_createPushConnection
{
  v0 = [(id)objc_opt_class() description];
  uint64_t v1 = _CDPrettyPrintCollection(&unk_1EDE1E458, 0, 0, 0);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Created connection for topics: %@", v4, v5, v6, v7, 2u);
}

- (uint64_t)startShouldUpdateSourceDeviceIdentifiers
{
  uint64_t v1 = a1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 32) isSingleDevice])
    {
      uint64_t v2 = [*(id *)(v1 + 16) numberForKey:@"HaveCreatedMyZone"];
      uint64_t v3 = v2;
      if (v2 && [v2 BOOLValue])
      {
        uint64_t v9 = 0;
        v10 = &v9;
        uint64_t v11 = 0x2020000000;
        char v12 = 0;
        uint64_t v4 = *(void **)(v1 + 24);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __75___DKSyncCloudKitKnowledgeStorage_startShouldUpdateSourceDeviceIdentifiers__block_invoke;
        v8[3] = &unk_1E560DB08;
        v8[4] = &v9;
        [v4 performNoMoreOftenInDaysThan:@"SingleDeviceUpdateSourceDeviceIdentifiers" name:v8 activityBlock:7.0];
        int v5 = *((unsigned __int8 *)v10 + 24);
        if (*((unsigned char *)v10 + 24))
        {
          uint64_t v6 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            [(id)objc_opt_class() description];
            objc_claimAutoreleasedReturnValue();
            -[_DKSyncCloudKitKnowledgeStorage startShouldUpdateSourceDeviceIdentifiers]();
          }
        }
        _Block_object_dispose(&v9, 8);
        uint64_t v1 = v5 != 0;
      }
      else
      {
        uint64_t v1 = 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return v1;
}

- (void)unregisterUpdateSourceDeviceIdentifiersPeriodicJob
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Unscheduling periodic job: %{public}@", v3, v4, v5, v6, v7);
}

- (void)finishStartOrError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    if (v3)
    {
      uint64_t v5 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:]();
      }
    }
    else
    {
      uint64_t v5 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      -[_DKSyncCloudKitKnowledgeStorage configureCloudPseudoPeerWithMySyncZoneID:](a1, v5);
      if (([*(id *)(a1 + 16) BOOLForKey:@"DidRegisterDatabaseChangesSubscription"] & 1) == 0) {
        -[_DKSyncCloudKitKnowledgeStorage _registerDatabaseChangesSubscription](a1);
      }
      if ((*(unsigned char *)(a1 + 152) & 1) == 0)
      {
        *(unsigned char *)(a1 + 152) = 1;
        uint64_t v6 = +[_CDObservationCenter sharedInstance];
        [v6 postNotificationName:@"_DKCloudTransportAvailablityChangedNotification" userInfo:0 sender:a1];
      }
    }
  }
}

- (void)registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    if (!a1[5])
    {
      uint64_t v5 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncCloudKitKnowledgeStorage registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:]();
      }

      objc_initWeak(&location, a1);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke;
      uint64_t v15 = &unk_1E560DFB8;
      objc_copyWeak(&v18, &location);
      uint64_t v16 = a1;
      id v17 = v3;
      uint64_t v6 = (void *)MEMORY[0x192FB31A0](&v12);
      uint8_t v7 = -[_DKSyncCloudKitKnowledgeStorage executionCriteriaForUpdateSourceDeviceIdentifiersPeriodicJob]((uint64_t)a1);
      objc_super v8 = +[_DKSyncSerializer underlyingQueue];
      uint64_t v9 = +[_CDPeriodicSchedulerJob jobWithInterval:@"com.apple.coreduet.sync.update-source-device-identifiers" schedulerJobName:v8 queue:1 asynchronousHandler:v6 handler:30.0];
      id v10 = a1[5];
      a1[5] = (id)v9;

      [a1[5] setExecutionCriteria:v7];
      uint64_t v11 = +[_CDPeriodicScheduler sharedInstance];
      [v11 registerJob:a1[5]];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_registerDatabaseChangesSubscription
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Queuing operation to register a database changes subscription", v3, v4, v5, v6, v7);
}

- (void)cancelOutstandingOperations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(NSHashTable *)self->_outstandingOperations allObjects];
  uint64_t v5 = (void *)[v4 copy];

  [(NSHashTable *)self->_outstandingOperations removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isFinished", (void)v12) & 1) == 0 && (objc_msgSend(v11, "isCancelled") & 1) == 0) {
          [v11 cancel];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (uint64_t)_queueOperationForPrivateCloudDatabase:(int)a3 dependent:(void *)a4 policy:(void *)a5 error:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  if (!a1)
  {
    uint64_t v20 = 0;
    goto LABEL_70;
  }
  uint64_t v11 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v11);

  if (a5) {
    *a5 = 0;
  }
  long long v12 = *(void **)(a1 + 56);
  if (!v12)
  {
    long long v13 = objc_opt_new();
    [v13 setUseZoneWidePCS:1];
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.knowledgestore4" environment:1];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v14 options:v13];
    uint64_t v16 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v15;

    if (!*(void *)(a1 + 56))
    {
      v34 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]();
      }

      if (a5)
      {
        *a5 = +[_DKSyncErrors disabled];
      }

LABEL_37:
      uint64_t v20 = 0;
      goto LABEL_69;
    }

    long long v12 = *(void **)(a1 + 56);
  }
  long long v13 = [v12 privateCloudDatabase];
  if (v13)
  {
    id v60 = v10;
    uint64_t v17 = objc_opt_new();
    [v17 setContainer:*(void *)(a1 + 56)];
    [v17 setTimeoutIntervalForResource:1800.0];
    [v17 setAutomaticallyRetryNetworkFailures:0];
    v57 = +[_DKSyncUrgencyTracker sharedInstance]();
    if ((unint64_t)-[_DKEventData version]((uint64_t)v57) > 9)
    {
      [v17 setAllowsCellularAccess:1];
      [v17 setQualityOfService:17];
      uint64_t v18 = 0;
    }
    else
    {
      [v17 setAllowsCellularAccess:0];
      uint64_t v18 = 2;
    }
    [v17 setDiscretionaryNetworkBehavior:v18];
    uint64_t v21 = [*(id *)(a1 + 160) syncType];
    v22 = (void *)v21;
    if (v21)
    {
      uint64_t v23 = -[_DKSyncType xpcActivity](v21);
    }
    else
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v23 = [*(id *)(a1 + 40) activity];
    }
    v24 = (void *)v23;
    if (v23)
    {
      [v17 setXpcActivity:v23];
    }
LABEL_22:
    v58 = v17;
    [v9 setConfiguration:v17];
    [v9 setDatabase:v13];
    if (a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
      v26 = WeakRetained;
      if (WeakRetained && ([WeakRetained isFinished] & 1) == 0) {
        [v9 addDependency:v26];
      }
      objc_storeWeak((id *)(a1 + 136), v9);
    }
    v59 = v13;
    id v27 = objc_alloc(MEMORY[0x1E4F1A010]);
    v28 = [v9 group];
    uint64_t v29 = [v28 name];
    v30 = (void *)[v27 initWithEventName:v29];

    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke;
    v66[3] = &unk_1E560DB80;
    id v31 = v30;
    id v67 = v31;
    id v32 = v9;
    id v68 = v32;
    uint64_t v69 = a1;
    +[_DKSyncBlockOperation blockOperationWithBlock:v66];
    v56 = id v55 = v32;
    [v56 addDependency:v32];
    if (!v22) {
      goto LABEL_59;
    }
    if (-[_DKSyncType forceSync]((BOOL)v22))
    {
      id v33 = @"forced";
    }
    else if (-[_DKSyncType isPeriodicSync]((BOOL)v22))
    {
      id v33 = @"periodic";
    }
    else if (-[_DKSyncType isTriggeredSync]((BOOL)v22))
    {
      id v33 = @"triggered";
    }
    else
    {
      if (!-[_DKSyncType isInitialSync]((BOOL)v22)) {
        goto LABEL_43;
      }
      id v33 = @"initial";
    }
    [v31 setMetricValue:v33 forKey:@"type"];
LABEL_43:
    v35 = [NSNumber numberWithUnsignedInteger:-[_DKSyncType urgency]((uint64_t)v22)];
    [v31 setMetricValue:v35 forKey:@"urgency"];

    if (-[_DKSyncType isPeriodicSync]((BOOL)v22))
    {
      v36 = [NSNumber numberWithDouble:-[_DKSyncType periodicSyncInterval]((uint64_t)v22)];
      [v31 setMetricValue:v36 forKey:@"interval"];
    }
    if (!-[_DKSyncType isTriggeredSync]((BOOL)v22)) {
      goto LABEL_55;
    }
    if (-[_DKSyncType didActivatePeer]((BOOL)v22))
    {
      uint64_t v37 = @"didActivatePeer";
    }
    else if (-[_DKSyncType didReceivePush]((BOOL)v22))
    {
      uint64_t v37 = @"didReceivePush";
    }
    else if (-[_DKSyncType didAddSyncedEvents]((BOOL)v22))
    {
      uint64_t v37 = @"didAddSyncedEvents";
    }
    else
    {
      if (!-[_DKSyncType didDeleteSyncedEvents]((BOOL)v22))
      {
        v54 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]();
        }

        goto LABEL_55;
      }
      uint64_t v37 = @"didDeleteSyncedEvents";
    }
    [v31 setMetricValue:v37 forKey:@"reason"];
LABEL_55:
    if (-[_DKSyncToggle isEnabled]((BOOL)v22)) {
      id v38 = @"YES";
    }
    else {
      id v38 = @"NO";
    }
    [v31 setMetricValue:v38 forKey:@"isSingleDevice"];
LABEL_59:
    id v61 = v9;
    +[_DKSyncUrgencyTracker sharedInstance]();
    v39 = (id *)objc_claimAutoreleasedReturnValue();
    v40 = -[_DKSyncUrgencyTracker allUrgencies](v39);

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v63 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          v47 = [v41 objectForKeyedSubscript:v46];
          v48 = [NSString stringWithFormat:@"clientUrgency: %@", v46];
          [v31 setMetricValue:v47 forKey:v48];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v43);
    }

    uint64_t v49 = +[_DKSync2Policy policyForSyncTransportType:4];
    uint64_t v50 = +[_DKSync2Policy policyForSyncTransportType:8];
    if (v49 | v50)
    {
      v51 = [(id)v49 version];
      [v31 setMetricValue:v51 forKey:@"version(down)"];

      v52 = [(id)v50 version];
      [v31 setMetricValue:v52 forKey:@"version(up)"];
    }
    +[_DKSyncSerializer addOperation:v55];
    [*(id *)(a1 + 144) addObject:v55];
    +[_DKSyncSerializer addOperation:v56];
    [*(id *)(a1 + 144) addObject:v56];
    unsigned __int8 v70 = 1;

    uint64_t v20 = v70;
    id v10 = v60;
    id v9 = v61;
    long long v13 = v59;
    goto LABEL_69;
  }
  v19 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]();
  }

  if (!a5) {
    goto LABEL_37;
  }
  +[_DKSyncErrors disabled];
  uint64_t v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

LABEL_70:
  return v20;
}

- (void)_cloudSyncAvailabilityDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67___DKSyncCloudKitKnowledgeStorage__cloudSyncAvailabilityDidChange___block_invoke;
  v3[3] = &unk_1E560D578;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:v3];
}

- (void)performUpdateSourceDeviceIdentifiersWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = *(void **)(a1 + 24);
    id v6 = +[_DKSyncSerializer underlyingQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke;
    v9[3] = &unk_1E560D618;
    v9[4] = a1;
    id v10 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2;
    v7[3] = &unk_1E560DA20;
    id v8 = v10;
    [v5 performNoMoreOftenInMinutesThan:@"UpdateSourceDeviceIdentifiers" name:v6 queue:v9 activityBlock:v7 throttleBlock:60.0];
  }
}

- (void)_createZoneWithZoneID:(void *)a3 completion:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v21 = a3;
  if (a1)
  {
    id v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = (void *)os_transaction_create();
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v5];
    v29[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:]();
    }

    uint64_t v11 = [(CKModifyRecordZonesOperation *)[_DKModifyRecordZonesOperation alloc] initWithRecordZonesToSave:v9 recordZoneIDsToDelete:0];
    long long v12 = objc_opt_new();
    [(_DKModifyRecordZonesOperation *)v11 setGroup:v12];

    long long v13 = [(_DKModifyRecordZonesOperation *)v11 group];
    [v13 setName:@"CreateZone"];

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke;
    v23[3] = &unk_1E560DC48;
    objc_copyWeak(&v27, &location);
    v23[4] = a1;
    id v14 = v9;
    id v24 = v14;
    id v15 = v21;
    id v26 = v15;
    id v16 = v7;
    id v25 = v16;
    [(CKModifyRecordZonesOperation *)v11 setModifyRecordZonesCompletionBlock:v23];
    uint64_t v17 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:]();
    }

    id v22 = 0;
    char v18 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:](a1, v11, 1, 0, &v22);
    id v19 = v22;
    if (v15) {
      char v20 = v18;
    }
    else {
      char v20 = 1;
    }
    if ((v20 & 1) == 0) {
      (*((void (**)(id, id))v15 + 2))(v15, v19);
    }
    if ((objc_msgSend(*(id *)(a1 + 16), "BOOLForKey:", @"DidRegisterDatabaseChangesSubscription", v21) & 1) == 0) {
      -[_DKSyncCloudKitKnowledgeStorage _registerDatabaseChangesSubscription](a1);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)_deleteZoneWithZoneID:(void *)a3 completion:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = (void *)os_transaction_create();
    v33[0] = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "%{public}@: Deleting zone %@", buf, 0x16u);
    }
    long long v12 = [(CKModifyRecordZonesOperation *)[_DKModifyRecordZonesOperation alloc] initWithRecordZonesToSave:0 recordZoneIDsToDelete:v9];
    long long v13 = objc_opt_new();
    [(_DKModifyRecordZonesOperation *)v12 setGroup:v13];

    id v14 = [(_DKModifyRecordZonesOperation *)v12 group];
    [v14 setName:@"DeleteZone"];

    objc_initWeak(&location, v12);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke;
    v23[3] = &unk_1E560DC48;
    objc_copyWeak(&v27, &location);
    v23[4] = a1;
    id v15 = v9;
    id v24 = v15;
    id v16 = v6;
    id v26 = v16;
    id v17 = v8;
    id v25 = v17;
    [(CKModifyRecordZonesOperation *)v12 setModifyRecordZonesCompletionBlock:v23];
    char v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _deleteZoneWithZoneID:completion:]();
    }

    id v22 = 0;
    char v19 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:](a1, v12, 1, 0, &v22);
    id v20 = v22;
    if (v16) {
      char v21 = v19;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0) {
      (*((void (**)(id, id))v16 + 2))(v16, v20);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:(void *)a1
{
  location[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = (void *)os_transaction_create();
    id v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage _performThrottledUpdateSourceDeviceIdentifiersWithCompletion:]();
    }

    uint64_t v7 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
    id v8 = objc_opt_new();
    [v7 setGroup:v8];

    id v9 = [v7 group];
    [v9 setName:@"UpdateSourceDeviceIdentifiers"];

    objc_initWeak(location, a1);
    objc_initWeak(&from, v7);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke;
    v17[3] = &unk_1E560DBD0;
    objc_copyWeak(&v20, location);
    objc_copyWeak(&v21, &from);
    v17[4] = a1;
    id v10 = v3;
    id v19 = v10;
    id v11 = v5;
    id v18 = v11;
    [v7 setFetchRecordZonesCompletionBlock:v17];
    long long v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _performThrottledUpdateSourceDeviceIdentifiersWithCompletion:]();
    }

    id v16 = 0;
    char v13 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v7, 1, 0, &v16);
    id v14 = v16;
    if (v10) {
      char v15 = v13;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      (*((void (**)(id, id))v10 + 2))(v10, v14);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

- (uint64_t)scheduleRetryUpdateSourceDeviceIdentifiers
{
  if (result)
  {
    double v1 = *(double *)(result + 72);
    double v2 = v1 + v1;
    BOOL v3 = v1 == 0.0;
    double v4 = 3600.0;
    if (!v3) {
      double v4 = v2;
    }
    *(double *)(result + 72) = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke;
    v5[3] = &unk_1E560D578;
    v5[4] = result;
    return +[_DKSyncSerializer performAfter:block:](_DKSyncSerializer, "performAfter:block:", v5);
  }
  return result;
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:(void *)a3 completion:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:]();
    }
    uint64_t v23 = v6;

    id v8 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
    id v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v26 = 0;
      uint64_t v11 = *(void *)v34;
      id v27 = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          char v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "zoneName", v23);
          if ([v14 hasPrefix:@"source-device-id:"])
          {
            char v15 = +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:v13];
            if ([v13 isEqual:v8])
            {
              id v16 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                id v19 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                id v38 = v19;
                __int16 v39 = 2112;
                v40 = v15;
                _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Found local device id %@", buf, 0x16u);

                id v8 = v27;
              }
              char v26 = 1;
            }
            else
            {
              uint64_t v17 = [v15 length];
              id v16 = +[_CDLogging syncChannel];
              BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
              if (v17)
              {
                if (v18)
                {
                  id v20 = [(id)objc_opt_class() description];
                  *(_DWORD *)buf = 138543618;
                  id v38 = v20;
                  __int16 v39 = 2112;
                  v40 = v15;
                  _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Found peer source device id %@", buf, 0x16u);
                }
                [v25 setObject:v13 forKeyedSubscript:v15];
                id v16 = [obj objectForKeyedSubscript:v13];
                [a1[11] setObject:v16 forKeyedSubscript:v13];
              }
              else if (v18)
              {
                id v21 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                id v38 = v21;
                __int16 v39 = 2112;
                v40 = v14;
                _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Invalid source device id from zone name: %@", buf, 0x16u);
              }
              id v8 = v27;
            }
          }
          [a1[15] removeObject:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v10);
    }
    else
    {
      char v26 = 0;
    }

    id v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:]();
    }

    id v6 = v23;
    id v5 = v24;
    if (v26)
    {
      -[_DKSyncCloudKitKnowledgeStorage finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:orError:completion:]((uint64_t)a1, v25, 0, v23);
    }
    else
    {
      [a1[2] setBool:0 forKey:@"HaveCreatedMyZone"];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke;
      v29[3] = &unk_1E560DBF8;
      v29[4] = a1;
      id v30 = v8;
      id v31 = v25;
      id v32 = v23;
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:]((uint64_t)a1, v30, v29);
    }
  }
}

- (void)finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:(void *)a3 orError:(void *)a4 completion:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void))v8;
  if (a1)
  {
    if (v7)
    {
      if (!v8) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    *(void *)(a1 + 72) = 0;
    -[_DKSyncCloudKitKnowledgeStorage setZoneIDsBySourceDeviceID:](a1, v10);
    if (v9) {
LABEL_4:
    }
      ((void (**)(void, id))v9)[2](v9, v7);
  }
LABEL_5:
}

- (void)setZoneIDsBySourceDeviceID:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 80), a2);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v12);
          -[_DKSyncCloudKitKnowledgeStorage configurePeerWithSourceDeviceID:zoneID:](a1, v10, v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)configurePeerWithSourceDeviceID:(void *)a3 zoneID:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) existingPeerWithSourceDeviceID:v5];
    uint64_t v8 = v7;
    if (v7 && ([v7 zoneName], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      if (([*(id *)(a1 + 32) activeTransportsForPeer:v8] & 4) == 0)
      {
        id v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v19 = [(id)objc_opt_class() description];
          long long v12 = &stru_1EDDE58B8;
          if ([v8 me]) {
            long long v13 = @"pseudo ";
          }
          else {
            long long v13 = &stru_1EDDE58B8;
          }
          long long v14 = [v8 identifier];
          long long v15 = [v8 model];
          if (v15)
          {
            id v16 = NSString;
            BOOL v18 = [v8 model];
            long long v12 = [v16 stringWithFormat:@" (%@)", v18];
          }
          uint64_t v17 = [v6 zoneName];
          *(_DWORD *)buf = 138544386;
          id v24 = v19;
          __int16 v25 = 2114;
          char v26 = v13;
          __int16 v27 = 2114;
          v28 = v14;
          __int16 v29 = 2114;
          id v30 = v12;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Instantiated existing %{public}@peer %{public}@%{public}@ with zone name %@", buf, 0x34u);

          if (v15)
          {
          }
        }

        -[_DKSyncCloudKitKnowledgeStorage populateLastSeenDateIfNeededByPeer:](a1, v8);
        [*(id *)(a1 + 32) addActiveTransports:4 toPeer:v8];
      }
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 88) objectForKeyedSubscript:v6];
      if (v11)
      {
        -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:](a1, v11, v5);
      }
      else
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __74___DKSyncCloudKitKnowledgeStorage_configurePeerWithSourceDeviceID_zoneID___block_invoke;
        v20[3] = &unk_1E560DD60;
        v20[4] = a1;
        id v21 = v6;
        id v22 = v5;
        -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:](a1, v20);
      }
    }
  }
}

- (void)_storeZoneIDFromRecords:(void *)a3 orError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    uint64_t v8 = +[_CDLogging syncChannel];
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:]();
      }

      uint64_t v10 = -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](a1, v6);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:]();
      }
      uint64_t v10 = 0;
      id v6 = v9;
    }

    id v6 = (id)v10;
  }
}

- (void)fetchChangedZonesWithCompletion:(id *)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  if (a1)
  {
    BOOL v3 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v3);

    id v4 = (void *)os_transaction_create();
    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.5();
    }

    id v6 = a1[2];
    id v7 = a1[16];
    if (!v7)
    {
      uint64_t v8 = [v6 dataForKey:@"FetchDatabaseChangesServerChangeToken"];
      if (v8)
      {
        id v41 = 0;
        id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v41];
        uint64_t v9 = v41;
        uint64_t v10 = v9;
        if (v7)
        {
          uint64_t v11 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            __int16 v25 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = 138544130;
            uint64_t v43 = v25;
            __int16 v44 = 2114;
            v45 = @"FetchDatabaseChangesServerChangeToken";
            __int16 v46 = 2112;
            id v47 = v7;
            __int16 v48 = 2112;
            uint64_t v49 = v8;
            _os_log_debug_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Token %{public}@ is %@ (%@)", buf, 0x2Au);
          }
          objc_storeStrong(a1 + 16, v7);
        }
        else
        {
          BOOL v12 = v9 == 0;
          long long v13 = +[_CDLogging syncChannel];
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
          if (v12)
          {
            if (v14) {
              -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:]();
            }
          }
          else if (v14)
          {
            -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.4((uint64_t)a1, v10);
          }

          [a1[2] removeObjectForKey:@"FetchDatabaseChangesServerChangeToken"];
        }
      }
      else
      {
        uint64_t v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:]();
        }
        id v7 = 0;
      }
    }
    long long v15 = [[_DKFetchDatabaseChangesOperation alloc] initWithPreviousServerChangeToken:v7];
    id v16 = objc_opt_new();
    [(_DKFetchDatabaseChangesOperation *)v15 setGroup:v16];

    uint64_t v17 = [(_DKFetchDatabaseChangesOperation *)v15 group];
    [v17 setName:@"FetchChangedZones"];

    [(_DKFetchDatabaseChangesOperation *)v15 setFetchAllChanges:1];
    objc_initWeak(&location, a1);
    objc_initWeak(&from, v15);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke;
    v37[3] = &unk_1E560DCC0;
    v37[4] = a1;
    objc_copyWeak(&v38, &location);
    [(_DKFetchDatabaseChangesOperation *)v15 setRecordZoneWithIDChangedBlock:v37];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_182;
    v35[3] = &unk_1E560DCC0;
    v35[4] = a1;
    objc_copyWeak(&v36, &location);
    [(_DKFetchDatabaseChangesOperation *)v15 setRecordZoneWithIDWasDeletedBlock:v35];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_184;
    v34[3] = &unk_1E560DCE8;
    v34[4] = a1;
    [(_DKFetchDatabaseChangesOperation *)v15 setChangeTokenUpdatedBlock:v34];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_187;
    v28[3] = &unk_1E560DD38;
    objc_copyWeak(&v32, &from);
    v28[4] = a1;
    objc_copyWeak(&v33, &location);
    id v18 = v6;
    id v29 = v18;
    id v19 = v26;
    id v31 = v19;
    id v20 = v4;
    id v30 = v20;
    [(_DKFetchDatabaseChangesOperation *)v15 setFetchDatabaseChangesCompletionBlock:v28];
    id v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:]();
    }

    id v27 = 0;
    char v22 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v15, 0, 0, &v27);
    id v23 = v27;
    if (v19) {
      char v24 = v22;
    }
    else {
      char v24 = 1;
    }
    if ((v24 & 1) == 0) {
      (*((void (**)(id, id))v19 + 2))(v19, v23);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)setHasZoneAdditionChanges:(void *)a3 forZone:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_14;
  }
  int v6 = -[_DKSyncCloudKitKnowledgeStorage hasZoneAdditionChangesForZone:](a1, v5);
  if ((a2 & 1) != 0 || !v6)
  {
    if ((a2 ^ 1 | v6)) {
      goto LABEL_14;
    }
    [*(id *)(a1 + 104) addObject:v5];
    id v7 = +[_CDLogging syncChannel];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v8 = [(id)objc_opt_class() description];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 104), "count"));
    uint64_t v10 = [*(id *)(a1 + 104) valueForKeyPath:@"zoneName"];
    uint64_t v11 = _CDPrettyPrintCollection(v10, 0, 0, 0);
    *(_DWORD *)buf = 138544130;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    BOOL v12 = "%{public}@: Adding %@ to additions changed zone list, now %@ changed zones: %@";
    goto LABEL_16;
  }
  [*(id *)(a1 + 104) removeObject:v5];
  id v7 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(id)objc_opt_class() description];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 104), "count"));
    uint64_t v10 = [*(id *)(a1 + 104) valueForKeyPath:@"zoneName"];
    uint64_t v11 = _CDPrettyPrintCollection(v10, 0, 0, 0);
    *(_DWORD *)buf = 138544130;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    BOOL v12 = "%{public}@: Removing %@ from additions changed zone list, %@ changed zones remain: %@";
LABEL_16:
    _os_log_debug_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEBUG, v12, buf, 0x2Au);
  }
LABEL_8:

  uint64_t v13 = *(void *)(a1 + 104);
  id v17 = 0;
  BOOL v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v17];
  id v15 = v17;
  if (v15)
  {
    id v16 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:]();
    }
  }
  else
  {
    [*(id *)(a1 + 16) setData:v14 forKey:@"ZoneIDsWithAdditionChanges"];
  }

LABEL_14:
}

- (void)setHasZoneDeletionChanges:(void *)a3 forZone:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_14;
  }
  int v6 = -[_DKSyncCloudKitKnowledgeStorage hasZoneDeletionChangesForZone:](a1, v5);
  if ((a2 & 1) != 0 || !v6)
  {
    if ((a2 ^ 1 | v6)) {
      goto LABEL_14;
    }
    [*(id *)(a1 + 112) addObject:v5];
    id v7 = +[_CDLogging syncChannel];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v8 = [(id)objc_opt_class() description];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 112), "count"));
    uint64_t v10 = [*(id *)(a1 + 112) valueForKeyPath:@"zoneName"];
    uint64_t v11 = _CDPrettyPrintCollection(v10, 0, 0, 0);
    *(_DWORD *)buf = 138544130;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    BOOL v12 = "%{public}@: Adding %@ to deletions changed zone list, now %@ changed zones: %@";
    goto LABEL_16;
  }
  [*(id *)(a1 + 112) removeObject:v5];
  id v7 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(id)objc_opt_class() description];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 112), "count"));
    uint64_t v10 = [*(id *)(a1 + 112) valueForKeyPath:@"zoneName"];
    uint64_t v11 = _CDPrettyPrintCollection(v10, 0, 0, 0);
    *(_DWORD *)buf = 138544130;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    BOOL v12 = "%{public}@: Removing %@ from deletions changed zone list, %@ changed zones remain: %@";
LABEL_16:
    _os_log_debug_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEBUG, v12, buf, 0x2Au);
  }
LABEL_8:

  uint64_t v13 = *(void *)(a1 + 112);
  id v17 = 0;
  BOOL v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v17];
  id v15 = v17;
  if (v15)
  {
    id v16 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:]();
    }
  }
  else
  {
    [*(id *)(a1 + 16) setData:v14 forKey:@"ZoneIDsWithDeletionChanges"];
  }

LABEL_14:
}

- (void)addSourceDeviceIdentifierWithRecordZoneID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [v3 zoneName];
    if ([v5 hasPrefix:@"source-device-id:"])
    {
      int v6 = +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:v3];
      id v7 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      if ([v6 length])
      {
        if (([v3 isEqual:v7] & 1) == 0)
        {
          uint64_t v8 = [*(id *)(a1 + 80) objectForKeyedSubscript:v6];

          if (!v8)
          {
            uint64_t v9 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
              -[_DKSyncCloudKitKnowledgeStorage addSourceDeviceIdentifierWithRecordZoneID:]();
            }

            [*(id *)(a1 + 80) setObject:v3 forKeyedSubscript:v6];
            -[_DKSyncCloudKitKnowledgeStorage configurePeerWithSourceDeviceID:zoneID:](a1, v6, v3);
          }
        }
      }
    }
  }
}

- (void)removeSourceDeviceIdentifierWithRecordZoneID:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [v3 zoneName];
    if ([v5 hasPrefix:@"source-device-id:"])
    {
      int v6 = +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:v3];
      id v7 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      if ([v6 length])
      {
        if (([v3 isEqual:v7] & 1) == 0)
        {
          uint64_t v8 = [a1[10] objectForKeyedSubscript:v6];

          if (v8)
          {
            uint64_t v9 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
              -[_DKSyncCloudKitKnowledgeStorage removeSourceDeviceIdentifierWithRecordZoneID:]();
            }

            [a1[10] setObject:0 forKeyedSubscript:v6];
            [a1[11] setObject:0 forKeyedSubscript:v3];
            id v10 = a1[4];
            uint64_t v11 = [v3 zoneName];
            BOOL v12 = [v10 peerWithZoneName:v11 sourceDeviceID:v6];

            [a1[4] removeActiveTransports:4 fromPeer:v12];
            [a1 setHasAdditionsFlag:0 forPeer:v12];
            [a1 setHasDeletionsFlag:0 forPeer:v12];
            if (![a1[4] activeTransportsForPeer:v12]) {
              [a1[4] removePeer:v12];
            }
          }
        }
      }
    }
  }
}

- (void)commitFetchDatabaseChangesServerChangeToken
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Done processing changed zones and ready to commit token %{public}@", v3, v4, v5, v6, v7);
}

- (void)setPrewarmedFlag
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Setting prewarm flag", v3, v4, v5, v6, v7);
}

- (void)fastForwardPastDeletionsInNewZone:(void *)a3 sourceDeviceID:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    uint8_t v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    uint64_t v8 = [v5 zoneID];
    uint64_t v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:]();
    }

    id v10 = [v5 currentServerChangeToken];
    if (v10)
    {
      -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:](a1, v10, v8);
    }
    else
    {
      uint64_t v11 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:]();
      }
    }
    BOOL v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v8 zoneName];
    BOOL v14 = [v12 peerWithZoneName:v13 sourceDeviceID:v6];

    id v15 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = [(id)objc_opt_class() description];
      int v16 = [v14 me];
      id v17 = &stru_1EDDE58B8;
      id v18 = @"pseudo ";
      if (!v16) {
        id v18 = &stru_1EDDE58B8;
      }
      __int16 v24 = v18;
      id v19 = [v14 identifier];
      __int16 v20 = [v14 model];
      if (v20)
      {
        id v21 = NSString;
        id v23 = [v14 model];
        id v17 = [v21 stringWithFormat:@" (%@)", v23];
      }
      __int16 v22 = [v8 zoneName];
      *(_DWORD *)buf = 138544386;
      id v27 = v25;
      __int16 v28 = 2114;
      id v29 = v24;
      __int16 v30 = 2114;
      id v31 = v19;
      __int16 v32 = 2114;
      id v33 = v17;
      __int16 v34 = 2114;
      long long v35 = v22;
      _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Instantiated %{public}@peer %{public}@%{public}@ from new zone with name %{public}@", buf, 0x34u);

      if (v20)
      {
      }
    }

    -[_DKSyncCloudKitKnowledgeStorage populateLastSeenDateIfNeededByPeer:](a1, v14);
    [*(id *)(a1 + 32) addActiveTransports:4 toPeer:v14];
  }
}

- (uint64_t)populateLastSeenDateIfNeededByPeer:(uint64_t)a1
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint8_t v7 = (void *)v3;
    id v5 = [(id)v3 lastSeenDate];
    if (!v5)
    {
      uint64_t v3 = [v7 me];
      uint64_t v4 = (uint64_t)v7;
      if (v3) {
        goto LABEL_6;
      }
      id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1296000.0];
      [*(id *)(a1 + 32) setLastSeenDate:v5 onPeer:v7];
    }

    uint64_t v4 = (uint64_t)v7;
  }
LABEL_6:
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)_setPreviousServerChangeToken:(void *)a3 forRecordZoneID:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a3);
    if (!v5)
    {
      uint64_t v8 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:]();
      }
      goto LABEL_10;
    }
    id v13 = 0;
    uint8_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
    uint64_t v8 = v13;
    if (v7)
    {
      [*(id *)(a1 + 16) setData:v7 forKey:v6];
      uint64_t v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138544130;
        id v15 = v10;
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v5;
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v7;
        _os_log_debug_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Setting token %{public}@ to %@ (%@)", buf, 0x2Au);
LABEL_13:
      }
    }
    else
    {
      uint64_t v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(id)objc_opt_class() description];
        uint64_t v11 = [v8 domain];
        uint64_t v12 = [v8 code];
        *(_DWORD *)buf = 138544386;
        id v15 = v10;
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 2114;
        id v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_error_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error archiving token %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

        goto LABEL_13;
      }
    }

LABEL_10:
  }
}

- (uint64_t)hasZoneAdditionChangesForZone:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = a1;
    if (hasZoneAdditionChangesForZone__onceToken != -1) {
      dispatch_once(&hasZoneAdditionChangesForZone__onceToken, block);
    }
    a1 = [*(id *)(a1 + 104) containsObject:v3];
  }

  return a1;
}

- (uint64_t)hasZoneDeletionChangesForZone:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = a1;
    if (hasZoneDeletionChangesForZone__onceToken != -1) {
      dispatch_once(&hasZoneDeletionChangesForZone__onceToken, block);
    }
    a1 = [*(id *)(a1 + 112) containsObject:v3];
  }

  return a1;
}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 zoneName];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint8_t v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19CC8]];
    char v8 = -[_DKSyncCloudKitKnowledgeStorage hasZoneAdditionChangesForZone:]((uint64_t)self, v7);
  }
  else
  {
    uint64_t v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
    }

    char v8 = 0;
  }

  return v8;
}

- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint8_t v7 = [v6 zoneName];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint64_t v9 = [v6 zoneName];
    id v10 = (void *)[v8 initWithZoneName:v9 ownerName:*MEMORY[0x1E4F19CC8]];

    -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:]((uint64_t)self, v4, v10);
  }
  else
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
    }
  }
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 zoneName];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint8_t v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19CC8]];
    char v8 = -[_DKSyncCloudKitKnowledgeStorage hasZoneDeletionChangesForZone:]((uint64_t)self, v7);
  }
  else
  {
    uint64_t v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
    }

    char v8 = 0;
  }

  return v8;
}

- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint8_t v7 = [v6 zoneName];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint64_t v9 = [v6 zoneName];
    id v10 = (void *)[v8 initWithZoneName:v9 ownerName:*MEMORY[0x1E4F19CC8]];

    -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:]((uint64_t)self, v4, v10);
  }
  else
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
    }
  }
}

- (void)clearPrewarmedFlag
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Clearing prewarm flag", v3, v4, v5, v6, v7);
}

- (void)prewarmFetchWithCompletion:(id)a3
{
  id v7 = a3;
  uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_isPrewarmed)
  {
    uint64_t v5 = v7;
    if (!v7) {
      goto LABEL_9;
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  else if (+[_DKCloudUtilities isSyncAvailableAndEnabled])
  {
    -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:]((id *)&self->super.isa, v7);
  }
  else
  {
    uint64_t v5 = v7;
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v6 = +[_DKSyncErrors disabled];
    (*((void (**)(id, void *))v7 + 2))(v7, v6);
  }
  uint64_t v5 = v7;
LABEL_9:
}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  __int16 v18 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v18);

  if (+[_DKCloudUtilities isSyncAvailableAndEnabled])
  {
    id v19 = [v14 zoneName];
    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v21 = (void *)[v20 initWithZoneName:v19 ownerName:*MEMORY[0x1E4F19CC8]];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __116___DKSyncCloudKitKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke;
      v24[3] = &unk_1E560DD88;
      id v25 = v17;
      -[_DKSyncCloudKitKnowledgeStorage syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:](self, v21, v15, v16, a6, (void *)a7, v24);
    }
    else
    {
      id v23 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
      }

      if (!v17) {
        goto LABEL_11;
      }
      uint64_t v21 = +[_DKSyncErrors invalidRequest];
      (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v21);
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v17)
  {
    __int16 v22 = +[_DKSyncErrors disabled];
    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v22);
  }
LABEL_12:
}

- (void)syncDownAdditionsFromCloudWithZoneID:(void *)a3 windows:(void *)a4 streamNames:(unint64_t)a5 limit:(void *)a6 fetchOrder:(void *)a7 completion:
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v66 = a2;
  id v67 = a3;
  id v63 = a4;
  id v64 = a7;
  id val = a1;
  if (a1)
  {
    long long v62 = (void *)os_transaction_create();
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v49 = [(id)objc_opt_class() description];
      uint64_t v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
      v51 = _CDPrettyPrintCollection(v63, 0, 0, 0);
      *(_DWORD *)buf = 138544130;
      v85 = v49;
      __int16 v86 = 2112;
      v87 = v50;
      __int16 v88 = 2112;
      id v89 = v66;
      __int16 v90 = 2114;
      id v91 = v51;
      _os_log_debug_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Syncing down records in %@ windows from %@ for streams %{public}@", buf, 0x2Au);
    }
    if ([v67 count])
    {
      if ((unint64_t)[v67 count] < 2)
      {
        id v16 = [v67 firstObject];
      }
      else
      {
        uint64_t v12 = [v67 firstObject];
        id v13 = -[_DKSyncWindow startDate]((uint64_t)v12);
        id v14 = [v67 lastObject];
        id v15 = -[_DKSyncType urgency]((uint64_t)v14);
        id v16 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v13, v15);

        id v17 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v52 = [(id)objc_opt_class() description];
          v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
          v54 = _CDPrettyPrintCollection(v63, 0, 0, 0);
          *(_DWORD *)buf = 138544642;
          v85 = v52;
          __int16 v86 = 2112;
          v87 = v53;
          __int16 v88 = 2114;
          id v89 = v16;
          __int16 v90 = 2114;
          id v91 = v67;
          __int16 v92 = 2112;
          id v93 = v66;
          __int16 v94 = 2114;
          v95 = v54;
          _os_log_error_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Combining sync down request windows into 1 of %@ windows (%{public}@ instead of %{public}@) from %@ for streams %{public}@", buf, 0x3Eu);
        }
      }
      __int16 v18 = -[_DKSyncWindow startDate]((uint64_t)v16);
      id v19 = -[_DKSyncType urgency]((uint64_t)v16);
      if (a6 == (void *)2) {
        id v20 = @"%K >= %@";
      }
      else {
        id v20 = @"%K > %@";
      }
      if (a6 == (void *)2) {
        uint64_t v21 = @"%K < %@";
      }
      else {
        uint64_t v21 = @"%K <= %@";
      }
      __int16 v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v20, @"eventCreationDate", v18);
      id v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v21, @"eventCreationDate", v19);
      uint64_t v24 = (void *)MEMORY[0x1E4F28BA0];
      v83[0] = v22;
      v83[1] = v23;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
      uint64_t v26 = [v24 andPredicateWithSubpredicates:v25];

      v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"streamName", v63];
      id v27 = (void *)MEMORY[0x1E4F28BA0];
      v82[0] = v26;
      v82[1] = v58;
      __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
      id v61 = [v27 andPredicateWithSubpredicates:v28];

      v57 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"eventCreationDate" ascending:a6 != (void *)2];
      id v29 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"DKEvent" predicate:v61];
      __int16 v81 = v57;
      __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      [v29 setSortDescriptors:v30];

      id v31 = @"SyncDownAdditionsFromCloud";
      if (a5 == 1) {
        id v31 = @"QueryRecordFromCloud";
      }
      v56 = v31;
      unint64_t v32 = *MEMORY[0x1E4F19CE8];
      if (a5) {
        unint64_t v33 = a5;
      }
      else {
        unint64_t v33 = *MEMORY[0x1E4F19CE8];
      }
      if (v33 > v32 && v32 != 0 && v33 > 1) {
        uint64_t v36 = (void *)*MEMORY[0x1E4F19CE8];
      }
      else {
        uint64_t v36 = (void *)v33;
      }
      uint64_t v37 = [(CKQueryOperation *)[_DKQueryOperation alloc] initWithQuery:v29];
      id v38 = objc_opt_new();
      [(_DKQueryOperation *)v37 setGroup:v38];

      __int16 v39 = [(_DKQueryOperation *)v37 group];
      [v39 setName:v56];

      [(_DKQueryOperation *)v37 setAllowsCellularAccess:0];
      [(CKQueryOperation *)v37 setResultsLimit:v36];
      [(CKQueryOperation *)v37 setZoneID:v66];
      objc_initWeak(&location, val);
      objc_initWeak(&from, v37);
      v40 = objc_opt_new();
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke;
      v77[3] = &unk_1E560DDB0;
      id v41 = v40;
      id v78 = v41;
      [(CKQueryOperation *)v37 setRecordFetchedBlock:v77];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_3;
      v69[3] = &unk_1E560DE00;
      v69[4] = val;
      id v42 = v41;
      id v70 = v42;
      id v71 = v66;
      id v72 = v67;
      objc_copyWeak(&v75, &from);
      v76[1] = v36;
      v76[2] = a6;
      id v43 = v64;
      id v74 = v43;
      objc_copyWeak(v76, &location);
      id v73 = v62;
      [(CKQueryOperation *)v37 setQueryCompletionBlock:v69];
      __int16 v44 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncCloudKitKnowledgeStorage syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:]();
      }

      v45 = +[_DKSync2Policy policyForSyncTransportType:4];
      id v68 = 0;
      char v46 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)val, v37, 1, v45, &v68);
      id v47 = v68;
      if (v43) {
        char v48 = v46;
      }
      else {
        char v48 = 1;
      }
      if ((v48 & 1) == 0) {
        (*((void (**)(id, void, void, id))v43 + 2))(v43, 0, 0, v47);
      }

      objc_destroyWeak(v76);
      objc_destroyWeak(&v75);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else if (v64)
    {
      id v60 = +[_DKSyncErrors internalFailure];
      (*((void (**)(id, void, void, void *))v64 + 2))(v64, 0, 0, v60);
    }
  }
}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  id v10 = a3;
  id v11 = a8;
  uint64_t v12 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v12);

  if (+[_DKCloudUtilities isSyncAvailableAndEnabled])
  {
    id v13 = [v10 zoneName];
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
      id v15 = (void *)[v14 initWithZoneName:v13 ownerName:*MEMORY[0x1E4F19CC8]];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __116___DKSyncCloudKitKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke;
      v17[3] = &unk_1E560DE28;
      id v18 = v11;
      -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:completion:](self, v15, v17);
    }
    else
    {
      id v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:]();
      }

      if (!v11) {
        goto LABEL_11;
      }
      id v15 = +[_DKSyncErrors invalidRequest];
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v15);
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v11)
  {
    id v13 = +[_DKSyncErrors disabled];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v13);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (void *)os_transaction_create();
    id v8 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_completion___block_invoke;
    v11[3] = &unk_1E560DE50;
    id v12 = v8;
    id v13 = v5;
    id v14 = v7;
    id v15 = v6;
    id v9 = v7;
    id v10 = v8;
    -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:](a1, v13, v10, 1, v11);
  }
}

- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 deletedRecordIDsAndTypes:(uint64_t)a4 attempt:(void *)a5 completion:
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v28 = a3;
  id v27 = a5;
  if (a1)
  {
    id v9 = +[_CDLogging syncChannel];
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:]();
      }

      id v10 = objc_opt_new();
      [v10 setDesiredKeys:MEMORY[0x1E4F1CBF0]];
      uint64_t v26 = -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenForRecordZoneID:]((uint64_t)a1, v8);
      if (v26) {
        [v10 setPreviousServerChangeToken:v26];
      }
      id v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", 1, a4);
      [v11 setObject:v10 forKeyedSubscript:v8];
      id v12 = [_DKFetchRecordZoneChangesOperation alloc];
      v40[0] = v8;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      id v14 = [(_DKFetchRecordZoneChangesOperation *)v12 initWithRecordZoneIDs:v13 optionsByRecordZoneID:v11];

      id v15 = objc_opt_new();
      [(_DKFetchRecordZoneChangesOperation *)v14 setGroup:v15];

      id v16 = [(_DKFetchRecordZoneChangesOperation *)v14 group];
      [v16 setName:@"SyncDownDeletionsFromCloud"];

      [(_DKFetchRecordZoneChangesOperation *)v14 setFetchAllChanges:1];
      objc_initWeak(&location, a1);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke;
      v37[3] = &unk_1E560DE78;
      id v17 = v28;
      id v38 = v17;
      [(_DKFetchRecordZoneChangesOperation *)v14 setRecordWithIDWasDeletedBlock:v37];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_3;
      v35[3] = &unk_1E560DEC8;
      objc_copyWeak(&v36, &location);
      [(_DKFetchRecordZoneChangesOperation *)v14 setRecordZoneFetchCompletionBlock:v35];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_5;
      v30[3] = &unk_1E560DF18;
      v30[4] = a1;
      id v31 = v8;
      objc_copyWeak(v34, &location);
      v34[1] = v25;
      id v32 = v17;
      id v18 = v27;
      id v33 = v18;
      [(_DKFetchRecordZoneChangesOperation *)v14 setFetchRecordZoneChangesCompletionBlock:v30];
      id v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:]();
      }

      id v20 = +[_DKSync2Policy policyForSyncTransportType:4];
      id v29 = 0;
      char v21 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v14, 1, v20, &v29);
      id v22 = v29;
      if (v18) {
        char v23 = v21;
      }
      else {
        char v23 = 1;
      }
      if ((v23 & 1) == 0) {
        (*((void (**)(id, id))v18 + 2))(v18, v22);
      }

      objc_destroyWeak(v34);
      objc_destroyWeak(&v36);

      objc_destroyWeak(&location);
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:]();
    }
  }
}

- (id)_previousServerChangeTokenKeyForRecordZoneID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [a2 zoneName];
    uint64_t v4 = [v2 stringWithFormat:@"FetchRecordZoneChangesPreviousServerChangeToken/%@", v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_previousServerChangeTokenForRecordZoneID:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a2);
    uint64_t v4 = [*(id *)(a1 + 16) dataForKey:v3];
    if (!v4)
    {
      id v6 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenForRecordZoneID:]();
      }
      id v5 = 0;
      goto LABEL_15;
    }
    id v15 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v15];
    id v6 = v15;
    if (v5)
    {
      id v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138544130;
        id v17 = v14;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v20 = 2112;
        char v21 = v5;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v4;
        _os_log_debug_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Token %{public}@ is %@ (%@)", buf, 0x2Au);
      }
      goto LABEL_15;
    }
    id v8 = +[_CDLogging syncChannel];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
      {
        id v10 = [(id)objc_opt_class() description];
        id v11 = [v6 domain];
        uint64_t v12 = [v6 code];
        *(_DWORD *)buf = 138544386;
        id v17 = v10;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v20 = 2114;
        char v21 = v11;
        __int16 v22 = 2048;
        uint64_t v23 = v12;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_error_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error unarchiving token %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

LABEL_20:
      }
    }
    else if (v9)
    {
      id v10 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v3;
      __int16 v20 = 2112;
      char v21 = v4;
      _os_log_error_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive token %{public}@: %@", buf, 0x20u);
      goto LABEL_20;
    }

    [*(id *)(a1 + 16) removeObjectForKey:v3];
LABEL_15:

    goto LABEL_16;
  }
  id v5 = 0;
LABEL_16:
  return v5;
}

- (void)_resetPreviousServerChangeTokenForRecordZoneID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a2);
    [*(id *)(a1 + 16) removeObjectForKey:v3];
    uint64_t v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage _resetPreviousServerChangeTokenForRecordZoneID:]();
    }
  }
}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 sourceDeviceID];
  id v11 = +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v12, v13);

  v23[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  __int16 v22 = v11;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke;
  v19[3] = &unk_1E560DF40;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v17 = v9;
  id v18 = v8;
  [(_DKSyncCloudKitKnowledgeStorage *)self fetchEventsFromPeer:v18 windows:v15 streamNames:v16 limit:1 fetchOrder:2 highPriority:v6 completion:v19];
}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 sourceDeviceID];
  id v11 = +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v12, v13);

  v23[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  __int16 v22 = v11;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke;
  v19[3] = &unk_1E560DF40;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v17 = v9;
  id v18 = v8;
  [(_DKSyncCloudKitKnowledgeStorage *)self fetchEventsFromPeer:v18 windows:v15 streamNames:v16 limit:1 fetchOrder:2 highPriority:v6 completion:v19];
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  id v12 = a3;
  id v6 = a5;
  id v7 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v12 sourceDeviceID];
    id v10 = (void *)[v8 initWithUUIDString:v9];

    if (v10)
    {
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, v10, 0, 0);
    }
    else
    {
      id v11 = +[_DKSyncErrors invalidData];
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v11);
    }
  }
}

- (void)setFetchDelegate:(id)a3
{
  uint64_t v4 = (_DKSyncRemoteKnowledgeStorageFetchDelegate *)a3;
  id v5 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;
}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (id *)a4;
  id v10 = a6;
  if ([v8 count] || -[_DKSyncDeletedEventIDs count]((uint64_t)v9))
  {
    unint64_t v11 = 0x1E560C000uLL;
    if ([v8 count])
    {
      id v12 = [_DKEventCKConverter alloc];
      id v13 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      id v14 = [(_DKEventCKConverter *)v12 initWithZoneID:v13];

      id v15 = [(_DKEventCKConverter *)v14 recordsFromEvents:v8];
    }
    else
    {
      id v15 = 0;
    }
    if (-[_DKSyncDeletedEventIDs count]((uint64_t)v9))
    {
      uint64_t v37 = v15;
      id v38 = v10;
      id v39 = v8;
      id v42 = objc_opt_new();
      -[_DKSyncDeletedEventIDs sourceDeviceIDs](v9);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v44 = *(void *)v46;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v46 != v44) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * v18);
            id v20 = (void *)MEMORY[0x192FB2F20]();
            unint64_t v21 = v11;
            __int16 v22 = [*(id *)(v11 + 4016) zoneIDWithDeviceID:v19];
            uint64_t v23 = [[_DKEventCKConverter alloc] initWithZoneID:v22];
            __int16 v24 = v9;
            id v25 = -[_DKSyncDeletedEventIDs deletedEventIDsForSourceDeviceID:](v9, v19);
            if ([v25 count])
            {
              uint64_t v26 = [(_DKEventCKConverter *)v23 recordIDsFromEventIDs:v25];
              if ([v26 count]) {
                [v42 addObjectsFromArray:v26];
              }
            }
            else
            {
              uint64_t v26 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                id v41 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                uint64_t v50 = v41;
                __int16 v51 = 2112;
                uint64_t v52 = v19;
                _os_log_error_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find deleted event ids for %@", buf, 0x16u);
              }
            }

            ++v18;
            id v9 = v24;
            unint64_t v11 = v21;
          }
          while (v17 != v18);
          uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v17);
      }

      id v10 = v38;
      id v8 = v39;
      id v15 = v37;
    }
    else
    {
      id v42 = 0;
    }
    uint64_t v27 = [v15 count];
    if (v27 != [v8 count])
    {
      id v28 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v31 = [(id)objc_opt_class() description];
        id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - objc_msgSend(v15, "count"));
        id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v31;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v32;
        __int16 v53 = 2112;
        v54 = v33;
        _os_log_error_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Unable to convert %@ of %@ added events", buf, 0x20u);
      }
    }
    uint64_t v29 = [v42 count];
    if (v29 != -[_DKSyncDeletedEventIDs count]((uint64_t)v9))
    {
      __int16 v30 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = [(id)objc_opt_class() description];
        long long v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count]((uint64_t)v9) - objc_msgSend(v42, "count"));
        id v36 = [NSNumber numberWithUnsignedInteger:-[_DKSyncDeletedEventIDs count]((uint64_t)v9)];
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v34;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v35;
        __int16 v53 = 2112;
        v54 = v36;
        _os_log_error_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Unable to convert %@ of %@ deleted events", buf, 0x20u);
      }
    }
    -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:](self, v15, v42, v10);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)syncUpToCloudWithRecordsToSave:(void *)a3 recordIDsToDelete:(void *)a4 completion:
{
  location[4] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v21 = a4;
  if (a1)
  {
    id v9 = (void *)os_transaction_create();
    id v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:]();
    }

    unint64_t v11 = [[_DKModifyRecordsOperation alloc] initWithRecordsToSave:v7 recordIDsToDelete:v8];
    id v12 = objc_opt_new();
    [(_DKModifyRecordsOperation *)v11 setGroup:v12];

    id v13 = [(_DKModifyRecordsOperation *)v11 group];
    [v13 setName:@"SyncUpToCloud"];

    [(_DKModifyRecordsOperation *)v11 setSavePolicy:1];
    [(_DKModifyRecordsOperation *)v11 setAtomic:1];
    objc_initWeak(location, a1);
    objc_initWeak(&from, v11);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke;
    v23[3] = &unk_1E560DF90;
    objc_copyWeak(&v28, &from);
    v23[4] = a1;
    id v24 = v7;
    id v25 = v8;
    objc_copyWeak(&v29, location);
    id v14 = v21;
    id v27 = v14;
    id v15 = v9;
    id v26 = v15;
    [(_DKModifyRecordsOperation *)v11 setModifyRecordsCompletionBlock:v23];
    uint64_t v16 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:]();
    }

    uint64_t v17 = +[_DKSync2Policy policyForSyncTransportType:8];
    id v22 = 0;
    char v18 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v11, 1, v17, &v22);
    id v19 = v22;
    if (v14) {
      char v20 = v18;
    }
    else {
      char v20 = 1;
    }
    if ((v20 & 1) == 0) {
      (*((void (**)(id, id))v14 + 2))(v14, v19);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

- (id)name
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not be called" userInfo:0];
  objc_exception_throw(v2);
}

- (int64_t)transportType
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not be called" userInfo:0];
  objc_exception_throw(v2);
}

- (void)runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:]();
    }

    id v6 = [*(id *)(a1 + 40) activity];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke;
    v8[3] = &unk_1E560DFE0;
    v8[4] = a1;
    id v9 = v6;
    id v10 = v3;
    id v7 = v6;
    -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:](a1, v8);
  }
}

- (id)executionCriteriaForUpdateSourceDeviceIdentifiersPeriodicJob
{
  keys[6] = *(char **)MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (char *)*MEMORY[0x1E4F141A8];
    keys[0] = *(char **)MEMORY[0x1E4F14170];
    keys[1] = v1;
    id v2 = (char *)*MEMORY[0x1E4F14330];
    keys[2] = *(char **)MEMORY[0x1E4F142F8];
    keys[3] = v2;
    id v3 = (char *)*MEMORY[0x1E4F14320];
    keys[4] = *(char **)MEMORY[0x1E4F142C8];
    keys[5] = v3;
    values[0] = xpc_int64_create(0);
    values[1] = xpc_int64_create(1);
    values[2] = xpc_BOOL_create(0);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
    values[5] = xpc_BOOL_create(1);
    xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    for (uint64_t i = 5; i != -1; --i)
  }
  else
  {
    xpc_object_t v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_outstandingOperations, 0);
  objc_destroyWeak((id *)&self->_previousDependentOperation);
  objc_storeStrong((id *)&self->_fetchDatabaseChangesServerChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithUnrecoverableDecryptionErrors, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithDeletionChanges, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithAdditionChanges, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsBySourceDeviceID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_updateSourceDeviceIdentifiersPeriodicJob, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_activityThrottler, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  id v5 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceivePublicToken:]();
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceiveIncomingMessage:]();
  }

  [(_DKKeyValueStore *)self->_keyValueStore setBool:1 forKey:@"DatabaseChangesExist"];
  id v7 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate) connection:didReceiveIncomingMessage:]();
  }

  if ([(_DKSyncPeerStatusTracker *)self->_tracker isSingleDevice])
  {
    id v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate) connection:didReceiveIncomingMessage:]();
    }

    -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]((uint64_t)self, 0);
  }
}

- (void)startShouldUpdateSourceDeviceIdentifiers
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_10_0(&dword_18ECEB000, v3, (uint64_t)v3, "%{public}@: Single device should update synced device identifiers", v4);
}

- (void)finishStartOrError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to finish start: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

- (void)registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Scheduling periodic job: %{public}@", v3, v4, v5, v6, v7);
}

- (void)configureCloudPseudoPeerWithMySyncZoneID:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15, long long a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v28;
  a28 = v29;
  id v31 = v30;
  id v33 = v32;
  a18 = *MEMORY[0x1E4F143B8];
  __int16 v34 = [(id)objc_opt_class() description];
  long long v35 = &stru_1EDDE58B8;
  if ([v33 me]) {
    id v36 = @"pseudo ";
  }
  else {
    id v36 = &stru_1EDDE58B8;
  }
  uint64_t v37 = [v33 identifier];
  id v38 = [v33 model];
  if (v38)
  {
    id v39 = NSString;
    id v33 = [v33 model];
    long long v35 = [v39 stringWithFormat:@" (%@)"];
  }
  LODWORD(buf) = 138544130;
  *(void *)((char *)&buf + 4) = v34;
  WORD6(buf) = 2114;
  *(void *)((char *)&buf + 14) = v36;
  a14 = 2114;
  a15 = v37;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v35;
  _os_log_debug_impl(&dword_18ECEB000, v31, OS_LOG_TYPE_DEBUG, "%{public}@: Configured %{public}@peer %{public}@%{public}@", (uint8_t *)&buf, 0x2Au);
  if (v38)
  {
  }
  OUTLINED_FUNCTION_30();
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Unable to instantiate container: %@", v3, v4, v5, v6, v7);
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Unable to instantiate private cloud database", v3, v4, v5, v6, v7);
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.3()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Missing trigger reason", v3, v4, v5, v6, v7);
}

- (void)_handleAnySpecialnessWithOperationError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Unrecoverable decryption error: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

- (void)_createZoneWithZoneID:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_10_0(&dword_18ECEB000, v3, (uint64_t)v3, "%{public}@: Queuing operation to create zone", v4);
}

- (void)_createZoneWithZoneID:completion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Creating zone %@", v3, v4, v5, v6, v7);
}

- (void)_deleteZoneWithZoneID:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_10_0(&dword_18ECEB000, v3, (uint64_t)v3, "%{public}@: Queuing operation to delete zone", v4);
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_10_0(&dword_18ECEB000, v3, (uint64_t)v3, "%{public}@: Queuing operation to fetch sync device identifiers", v4);
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Fetching sync device identifiers", v3, v4, v5, v6, v7);
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Done fetching zone identifiers", v3, v4, v5, v6, v7);
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Fetched %@ record zones", v5, v6, v7, v8, v9);
}

- (void)_storeZoneIDFromRecords:orError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10() firstObject];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Zone added: %@", v4, v5, v6, v7, v8);
}

- (void)_storeZoneIDFromRecords:orError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to create zone: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

- (void)fetchChangedZonesWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Queuing operation to fetch changed zones from token %{public}@", v4, v5);
}

- (void)fetchChangedZonesWithCompletion:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: No previous token %{public}@", v3, v4, v5, v6, v7);
}

- (void)fetchChangedZonesWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5(&dword_18ECEB000, v1, v2, "%{public}@: Failed to unarchive token %{public}@: %@", v3, v4, v5, v6, v7);
}

- (void)fetchChangedZonesWithCompletion:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v4 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_0(&dword_18ECEB000, v5, v6, "%{public}@: Error unarchiving token %{public}@: %{public}@:%lld (%@)", v7, v8, v9, v10, 2u);
}

- (void)fetchChangedZonesWithCompletion:.cold.5()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Fetching changed zones", v3, v4, v5, v6, v7);
}

- (void)setHasZoneAdditionChanges:forZone:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Error serializing _zoneIDsWithAdditionChanges - %@", v3, v4, v5, v6, v7);
}

- (void)setHasZoneDeletionChanges:forZone:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Error serializing _zoneIDsWithDeletionChanges - %@", v3, v4, v5, v6, v7);
}

- (void)addSourceDeviceIdentifierWithRecordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Adding peer source device id %@", v3, v4, v5, v6, v7);
}

- (void)removeSourceDeviceIdentifierWithRecordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Deleting peer source device id %{public}@", v3, v4, v5, v6, 2u);
}

- (void)fastForwardPastDeletionsInNewZone:sourceDeviceID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10() zoneName];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v2, v3, "%{public}@: Unable to fast forward past deletions in zone with name %{public}@ due to missing currentServerChangeToken", v4, v5, v6, v7, 2u);
}

- (void)fastForwardPastDeletionsInNewZone:sourceDeviceID:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10() zoneName];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Fast forwarding past deletions in zone with name %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_setPreviousServerChangeToken:forRecordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, 2u);
}

- (void)hasAdditionsFlagForPeer:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_18ECEB000, v1, v2, "%{public}@: Peer is missing zoneName: %@", v3, v4, v5, v6, v7);
}

- (void)syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Queuing operation to sync down records from %{public}@", v4, v5);
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Failed to sync down deletions from the cloud due to missing zoneID", v3, v4, v5, v6, v7);
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.2()
{
  OUTLINED_FUNCTION_32();
  *(_DWORD *)uint64_t v1 = 138543618;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Queuing operation to sync down deletions from the cloud for %@", v4, v5);
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.3()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Syncing down deletions from %@", v3, v4, v5, v6, v7);
}

- (void)_previousServerChangeTokenForRecordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: No previous token %{public}@", v3, v4, v5, v6, 2u);
}

- (void)_resetPreviousServerChangeTokenForRecordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Resetting token %{public}@", v3, v4, v5, v6, 2u);
}

- (void)syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_10_0(&dword_18ECEB000, v3, (uint64_t)v3, "%{public}@: Queuing operation to sync to the cloud", v4);
}

- (void)syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Syncing to the cloud", v3, v4, v5, v6, v7);
}

- (void)runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Running periodic job: %{public}@", v3, v4, v5, v6, v7);
}

@end