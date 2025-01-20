@interface HDCloudSyncStore
+ (id)createOrUpdateShardStoresForProfile:(id)a3 throughDate:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 containerIdentifier:(id)a7 syncIdentity:(id)a8 error:(id *)a9;
+ (id)shardPredicatesForProfile:(id)a3 syncCircleName:(id)a4 currentDate:(id)a5 error:(id *)a6;
+ (id)syncStoreForProfile:(id)a3 storeIdentifier:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 syncIdentity:(id)a7 containerIdentifier:(id)a8 error:(id *)a9;
+ (void)samplesDeletedInProfile:(id)a3 byUser:(BOOL)a4 intervals:(id)a5;
- (BOOL)canPush;
- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3;
- (BOOL)clearAllSyncAnchorsWithError:(id *)a3;
- (BOOL)enforceSyncEntityOrdering;
- (BOOL)persistState:(id)a3 error:(id *)a4;
- (BOOL)replaceFrozenAnchorMap:(id)a3 updateDate:(id)a4 error:(id *)a5;
- (BOOL)replacePersistedAnchorMap:(id)a3 error:(id *)a4;
- (BOOL)resetReceivedSyncAnchorMapWithError:(id *)a3;
- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3;
- (BOOL)shouldEnforceSequenceOrdering;
- (BOOL)supportsRebase;
- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3;
- (BOOL)syncTombstonesOnly;
- (HDCloudSyncShardPredicate)shardPredicate;
- (HDProfile)profile;
- (HDSharingPredicate)sharingPredicate;
- (HDSyncIdentity)syncIdentity;
- (NSString)containerIdentifier;
- (NSString)description;
- (NSString)ownerIdentifier;
- (NSString)sharingIdentifier;
- (NSUUID)storeIdentifier;
- (id)_initWithProfile:(void *)a3 storeIdentifier:(void *)a4 syncCircleName:(void *)a5 ownerIdentifier:(void *)a6 syncIdentity:(void *)a7 containerIdentifier:(void *)a8 sharingIdentifier:(uint64_t)a9 sharingPredicate:shardPredicate:error:;
- (id)_supportedSyncEntities;
- (id)_syncAnchorMapByStrippingBlockedEntities:(id)a3;
- (id)_syncEntityDependencyIdentifiersForEntity:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)databaseIdentifier;
- (id)getPersistedAnchorMapWithError:(id *)a3;
- (id)orderedSyncEntities;
- (id)persistedStateWithError:(id *)a3;
- (id)primaryOrderedSyncEntities;
- (id)receivedSyncAnchorMapWithError:(id *)a3;
- (id)syncEntityDependenciesForSyncEntity:(Class)a3;
- (id)syncStoreDefaultSourceBundleIdentifier;
- (id)syncStoreForEpoch:(int64_t)a3;
- (id)syncStoreForProtocolVersion:(int)a3;
- (id)syncStoreForTombstoneSyncOnly:(BOOL)a3;
- (id)syncStoreIdentifier;
- (int)protocolVersion;
- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3;
- (int64_t)syncEpoch;
- (int64_t)syncProvenance;
- (int64_t)syncStoreType;
- (void)_requiredSyncEntitiesForSupportedSyncEntities:(void *)a1;
@end

@implementation HDCloudSyncStore

+ (void)samplesDeletedInProfile:(id)a3 byUser:(BOOL)a4 intervals:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v6) {
    double v8 = 86400.0;
  }
  else {
    double v8 = 1209600.0;
  }
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a5;
  v11 = [v9 dateWithTimeIntervalSinceNow:v8];
  id v23 = 0;
  BOOL v12 = +[HDCloudSyncStoreEntity rebaseRequiredByDate:v11 intervals:v10 profile:v7 error:&v23];

  id v13 = v23;
  if (!v12)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v22 = &stru_1F1728D60;
      if (v6) {
        v22 = @" by the user";
      }
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to record rebase requirement after samples were deleted%{public}@: %{public}@", buf, 0x16u);
    }
  }
  v15 = kHDEventNameCloudSync;
  if (v6) {
    v16 = &unk_1F17EEC70;
  }
  else {
    v16 = &unk_1F17EEC88;
  }
  v24[0] = @"rebase-trigger";
  v24[1] = @"deadline";
  v25[0] = v16;
  v17 = NSNumber;
  [v11 timeIntervalSinceReferenceDate];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v25[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  HDPowerLog(v15, v19, 1);

  v20 = [v7 daemon];
  v21 = [v20 analyticsSubmissionCoordinator];
  objc_msgSend(v21, "cloudSync_reportRebaseTriggeredByDeletionByUser:", v6);
}

+ (id)syncStoreForProfile:(id)a3 storeIdentifier:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 syncIdentity:(id)a7 containerIdentifier:(id)a8 error:(id *)a9
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)[HDCloudSyncStore alloc], v19, v18, v17, v16, v15, v14, 0, (uint64_t)a9);

  return v20;
}

- (id)_initWithProfile:(void *)a3 storeIdentifier:(void *)a4 syncCircleName:(void *)a5 ownerIdentifier:(void *)a6 syncIdentity:(void *)a7 containerIdentifier:(void *)a8 sharingIdentifier:(uint64_t)a9 sharingPredicate:shardPredicate:error:
{
  id v16 = a2;
  id v46 = a3;
  id v41 = a4;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  if (!a1)
  {
    v39 = 0;
    goto LABEL_9;
  }
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__143;
  v62 = __Block_byref_object_dispose__143;
  id v63 = 0;
  id v17 = [v16 database];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke;
  v48[3] = &unk_1E6306260;
  id v18 = v46;
  id v49 = v18;
  uint64_t v57 = 2;
  id v19 = v16;
  id v50 = v19;
  v55 = &v64;
  id v20 = v45;
  id v51 = v20;
  id v21 = v43;
  id v52 = v21;
  id v22 = v44;
  id v53 = v22;
  id v54 = v42;
  v56 = &v58;
  BOOL v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v17 error:a9 block:v48];

  if (v23)
  {
    v47.receiver = a1;
    v47.super_class = (Class)HDCloudSyncStore;
    v24 = (id *)objc_msgSendSuper2(&v47, sel_init);
    a1 = v24;
    if (v24)
    {
      objc_storeWeak(v24 + 8, v19);
      uint64_t v25 = [v20 copy];
      id v26 = a1[5];
      a1[5] = (id)v25;

      uint64_t v27 = [v21 copy];
      id v28 = a1[6];
      a1[6] = (id)v27;

      uint64_t v29 = [0 copy];
      id v30 = a1[10];
      a1[10] = (id)v29;

      uint64_t v31 = [v22 copy];
      id v32 = a1[7];
      a1[7] = (id)v31;

      objc_storeStrong(a1 + 11, 0);
      uint64_t v33 = [(id)v59[5] copy];
      id v34 = a1[9];
      a1[9] = (id)v33;

      uint64_t v35 = [v18 copy];
      id v36 = a1[4];
      a1[4] = (id)v35;

      a1[1] = (id)v65[3];
      *((_DWORD *)a1 + 6) = 16;
      v37 = [a1 persistedStateWithError:a9];
      v38 = v37;
      if (!v37)
      {
        v39 = 0;
        goto LABEL_8;
      }
      a1[2] = (id)[v37 baselineEpoch];
    }
    a1 = a1;
    v39 = a1;
  }
  else
  {
    v39 = 0;
  }
LABEL_8:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

LABEL_9:
  return v39;
}

uint64_t __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = [*(id *)(a1 + 40) database];
  v9 = +[HDSyncStoreEntity syncStoreEntityWithUUID:v7 type:v6 healthDatabase:v8 error:a3];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v9 syncProvenance];
    LODWORD(v20) = 16;
    id v10 = [[_HDCloudSyncStorePersistableState alloc] initWithServerChangeToken:0 baselineEpoch:0 rebaseDeadline:0 lastSyncDate:0 emptyZones:0 lastCheckDate:0 ownerIdentifier:*(void *)(a1 + 48) containerIdentifier:*(void *)(a1 + 56) syncIdentity:*(void *)(a1 + 64) syncProtocolVersion:v20];
    uint64_t v11 = *(void *)(a1 + 32);
    BOOL v12 = [*(id *)(a1 + 40) database];
    BOOL v13 = +[HDCloudSyncStoreEntity persistState:v10 storeUUID:v11 shouldReplace:0 healthDatabase:v12 error:a3];

    uint64_t v14 = 0;
    if (!v13)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (!*(void *)(a1 + 72))
    {
      uint64_t v14 = 1;
      goto LABEL_13;
    }
    id v15 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", [v9 persistentID]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke_2;
    v21[3] = &unk_1E6306238;
    v21[4] = *(void *)(a1 + 88);
    if ([(HDCloudSyncStoreEntity *)v15 fetchShardPropertiesInTransaction:v5 error:a3 handler:v21])
    {
      if ([*(id *)(a1 + 72) isEqual:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)])
      {
LABEL_8:
        uint64_t v14 = 1;
LABEL_11:

        goto LABEL_13;
      }
      id v16 = [*(id *)(a1 + 72) startDate];
      id v17 = [*(id *)(a1 + 72) endDate];
      BOOL v18 = -[HDCloudSyncStoreEntity updateShardStartDate:endDate:type:transaction:error:](v15, "updateShardStartDate:endDate:type:transaction:error:", v16, v17, (int)[*(id *)(a1 + 72) type], v5, a3);

      if (v18)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 72));
        goto LABEL_8;
      }
    }
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

uint64_t __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = [[HDCloudSyncShardPredicate alloc] initForShardType:a4 startDate:v8 endDate:v7];

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return 1;
}

+ (id)shardPredicatesForProfile:(id)a3 syncCircleName:(id)a4 currentDate:(id)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [v7 daemon];
  uint64_t v11 = [v10 behavior];
  int v12 = [v11 supportsCloudSyncStagingShard];

  if (v12)
  {
    id v13 = [[HDCloudSyncShardPredicate alloc] initForShardType:2 startDate:0 endDate:0];
    [v9 addObject:v13];
  }
  id v14 = [[HDCloudSyncShardPredicate alloc] initForShardType:0 startDate:0 endDate:0];
  [v9 addObject:v14];

  id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:473299200.0];
  id v16 = [[HDCloudSyncShardPredicate alloc] initForShardType:1 startDate:0 endDate:v15];
  [v9 addObject:v16];

  id v17 = v15;
  BOOL v18 = [v17 dateByAddingTimeInterval:15552000.0];
  if (objc_msgSend(v18, "hk_isBeforeDate:", v8))
  {
    id v19 = v17;
    do
    {
      id v20 = [[HDCloudSyncShardPredicate alloc] initForShardType:1 startDate:v19 endDate:v18];
      [v9 addObject:v20];

      id v21 = v18;
      BOOL v18 = [v21 dateByAddingTimeInterval:15552000.0];

      id v19 = v21;
    }
    while ((objc_msgSend(v18, "hk_isBeforeDate:", v8) & 1) != 0);
  }
  else
  {
    id v21 = v17;
  }
  id v22 = [[HDCloudSyncShardPredicate alloc] initForShardType:1 startDate:v21 endDate:0];
  [v9 addObject:v22];

  return v9;
}

+ (id)createOrUpdateShardStoresForProfile:(id)a3 throughDate:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 containerIdentifier:(id)a7 syncIdentity:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [v15 daemon];
  id v22 = [v21 behavior];
  int v23 = [v22 supportsCloudSyncSharding];

  if (v23)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v25 = [v15 database];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke;
    v30[3] = &unk_1E63062B0;
    id v31 = v18;
    id v32 = v19;
    id v33 = v20;
    id v34 = v15;
    id v35 = v16;
    id v38 = a1;
    id v36 = v17;
    id v37 = v24;
    id v26 = v24;
    LODWORD(v24) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v25 error:a9 block:v30];

    if (v24) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    id v28 = v27;
  }
  else
  {
    id v28 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

uint64_t __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke_2;
  v71[3] = &unk_1E6306288;
  id v58 = v5;
  id v72 = v58;
  id v11 = v6;
  id v73 = v11;
  uint64_t v12 = v10;
  uint64_t v13 = a3;
  v62 = v4;
  if (!+[HDCloudSyncStoreEntity enumerateShardsForOwnerIdentifier:v7 containerIdentifier:v8 syncIdentity:v9 profile:v12 transaction:v4 error:a3 handler:v71])
  {
    uint64_t v51 = 0;
    id v31 = v58;
    goto LABEL_40;
  }
  v59 = (void **)a1;
  id v14 = *(id *)(a1 + 64);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v15 = v11;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (!v17) {
    goto LABEL_14;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v68;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v68 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      id v22 = [v21 startDate];
      int v23 = objc_msgSend(v22, "hk_isAfterDate:", v14);

      if (v23)
      {
        uint64_t v24 = [v21 startDate];
      }
      else
      {
        uint64_t v25 = [v21 endDate];
        int v26 = objc_msgSend(v25, "hk_isAfterDate:", v14);

        if (!v26) {
          continue;
        }
        uint64_t v24 = [v21 endDate];
      }
      uint64_t v27 = (void *)v24;

      id v14 = v27;
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v67 objects:v75 count:16];
  }
  while (v18);
LABEL_14:

  id v28 = v59;
  uint64_t v29 = [v59[11] shardPredicatesForProfile:v59[7] syncCircleName:v59[9] currentDate:v14 error:a3];
  id v30 = v29;
  if (v29)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v29;
    id v31 = v58;
    uint64_t v61 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v61)
    {
      uint64_t v60 = *(void *)v64;
      id v53 = v30;
      id v54 = v15;
      while (2)
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v64 != v60) {
            objc_enumerationMutation(obj);
          }
          id v33 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          uint64_t v34 = [v16 indexOfObject:v33];
          if (v34 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_24;
          }
          id v35 = [HDCloudSyncShardPredicate alloc];
          uint64_t v36 = [v33 type];
          id v37 = [v33 startDate];
          id v38 = [(HDCloudSyncShardPredicate *)v35 initForShardType:v36 startDate:v37 endDate:0];
          uint64_t v34 = [v16 indexOfObject:v38];

          if (v34 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = [HDCloudSyncStore alloc];
            v40 = v28[7];
            id v41 = [MEMORY[0x1E4F29128] UUID];
            id v42 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)&v39->super.isa, v40, v41, v28[9], v28[4], v28[6], v28[5], v33, v13);

            if (!v42) {
              goto LABEL_37;
            }
            [v28[10] addObject:v42];
          }
          else
          {
LABEL_24:
            id v42 = [v31 objectAtIndexedSubscript:v34];
            id v43 = [v42 storeUUIDInTransaction:v62 error:v13];
            if (!v43) {
              goto LABEL_36;
            }
            id v44 = [v16 objectAtIndexedSubscript:v34];
            if (([v44 isEqual:v33] & 1) == 0)
            {
              id v45 = [v33 startDate];
              [v33 endDate];
              v56 = v44;
              v47 = uint64_t v46 = v13;
              int v48 = objc_msgSend(v42, "updateShardStartDate:endDate:type:transaction:error:", v45, v47, (int)objc_msgSend(v33, "type"), v62, v46);

              uint64_t v13 = v46;
              id v44 = v56;

              id v31 = v58;
              if (!v48) {
                goto LABEL_35;
              }
            }
            id v28 = v59;
            id v49 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)[HDCloudSyncStore alloc], v59[7], v43, v59[9], v59[4], v59[6], v59[5], v33, v13);
            if (!v49)
            {
LABEL_35:

LABEL_36:
LABEL_37:
              id v15 = v54;

              uint64_t v51 = 0;
              id v30 = v53;
              goto LABEL_38;
            }
            id v50 = v49;
            [v59[10] addObject:v49];
          }
        }
        uint64_t v51 = 1;
        id v30 = v53;
        id v15 = v54;
        uint64_t v61 = [obj countByEnumeratingWithState:&v63 objects:v74 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v51 = 1;
    }
LABEL_38:
  }
  else
  {
    uint64_t v51 = 0;
    id v31 = v58;
  }

  id v11 = v15;
LABEL_40:

  return v51;
}

uint64_t __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a4;
  id v11 = a3;
  [v9 addObject:a2];
  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = [[HDCloudSyncShardPredicate alloc] initForShardType:a5 startDate:v11 endDate:v10];

  [v12 addObject:v13];
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HDCloudSyncStore);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_storeWeak((id *)&v4->_profile, WeakRetained);

  uint64_t v6 = [(NSString *)self->_ownerIdentifier copy];
  ownerIdentifier = v4->_ownerIdentifier;
  v4->_ownerIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_containerIdentifier copy];
  containerIdentifier = v4->_containerIdentifier;
  v4->_containerIdentifier = (NSString *)v8;

  objc_storeStrong((id *)&v4->_syncIdentity, self->_syncIdentity);
  uint64_t v10 = [(NSString *)self->_sharingIdentifier copy];
  sharingIdentifier = v4->_sharingIdentifier;
  v4->_sharingIdentifier = (NSString *)v10;

  objc_storeStrong((id *)&v4->_sharingPredicate, self->_sharingPredicate);
  uint64_t v12 = [(NSUUID *)self->_storeIdentifier copy];
  storeIdentifier = v4->_storeIdentifier;
  v4->_storeIdentifier = (NSUUID *)v12;

  v4->_syncProvenance = self->_syncProvenance;
  v4->_syncEpoch = self->_syncEpoch;
  v4->_syncProtocolVersion = self->_syncProtocolVersion;
  v4->_syncTombstonesOnly = self->_syncTombstonesOnly;
  uint64_t v14 = [(HDCloudSyncShardPredicate *)self->_shardPredicate copy];
  shardPredicate = v4->_shardPredicate;
  v4->_shardPredicate = (HDCloudSyncShardPredicate *)v14;

  return v4;
}

- (id)syncStoreForEpoch:(int64_t)a3
{
  id v4 = (void *)[(HDCloudSyncStore *)self copy];
  v4[2] = a3;

  return v4;
}

- (id)syncStoreForProtocolVersion:(int)a3
{
  if (self->_syncProtocolVersion < a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncStore.m", 390, @"Invalid parameter not satisfying: %@", @"syncProtocolVersion <= _syncProtocolVersion" object file lineNumber description];
  }
  id v5 = (_DWORD *)[(HDCloudSyncStore *)self copy];
  v5[6] = a3;

  return v5;
}

- (id)syncStoreForTombstoneSyncOnly:(BOOL)a3
{
  id v4 = (unsigned char *)[(HDCloudSyncStore *)self copy];
  v4[29] = a3;

  return v4;
}

- (int)protocolVersion
{
  return self->_syncProtocolVersion;
}

- (int64_t)syncStoreType
{
  return 2;
}

- (BOOL)supportsRebase
{
  return [(HDCloudSyncShardPredicate *)self->_shardPredicate type] != 2;
}

- (id)receivedSyncAnchorMapWithError:(id *)a3
{
  id v5 = objc_alloc_init(HDSyncAnchorMap);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LODWORD(a3) = +[HDSyncAnchorEntity getSyncAnchorsOfType:3 anchorMap:v5 store:self profile:WeakRetained error:a3];

  if (a3) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)resetReceivedSyncAnchorMapWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = +[HDSyncAnchorEntity resetSyncAnchorsOfType:3 store:self profile:WeakRetained error:a3];

  return (char)a3;
}

- (BOOL)replacePersistedAnchorMap:(id)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:v7 store:self resetNext:1 resetInvalid:1 profile:WeakRetained error:a4];

  return (char)a4;
}

- (BOOL)clearAllSyncAnchorsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = +[HDSyncAnchorEntity resetSyncStore:self profile:WeakRetained error:a3];

  return (char)a3;
}

- (id)getPersistedAnchorMapWithError:(id *)a3
{
  id v5 = objc_alloc_init(HDSyncAnchorMap);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LODWORD(a3) = +[HDSyncAnchorEntity getSyncAnchorsOfType:0 anchorMap:v5 store:self profile:WeakRetained error:a3];

  if (a3) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_syncAnchorMapByStrippingBlockedEntities:(id)a3
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(HDSyncAnchorMap);
  id v5 = +[HDSyncEntityIdentifier identifierWithSchema:0 entity:107];
  v21[0] = v5;
  uint64_t v6 = +[HDSyncEntityIdentifier identifierWithSchema:0 entity:15];
  v21[1] = v6;
  id v7 = +[HDSyncEntityIdentifier identifierWithSchema:0 entity:20];
  v21[2] = v7;
  uint64_t v8 = +[HDSyncEntityIdentifier identifierWithSchema:0 entity:21];
  v21[3] = v8;
  uint64_t v9 = +[HDSyncEntityIdentifier identifierWithSchema:0 entity:57];
  v21[4] = v9;
  uint64_t v10 = +[HDSyncEntityIdentifier identifierWithSchema:@"ACHAchievementsPlugin" entity:1];
  void v21[5] = v10;
  id v11 = +[HDSyncEntityIdentifier identifierWithSchema:@"ACHAchievementsPlugin" entity:2];
  v21[6] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__HDCloudSyncStore__syncAnchorMapByStrippingBlockedEntities___block_invoke;
  v18[3] = &unk_1E63062D8;
  id v19 = v12;
  id v13 = v4;
  id v20 = v13;
  id v14 = v12;
  [v3 enumerateAnchorsAndEntityIdentifiersWithBlock:v18];

  id v15 = v20;
  id v16 = v13;

  return v16;
}

void __61__HDCloudSyncStore__syncAnchorMapByStrippingBlockedEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) setAnchor:a3 forSyncEntityIdentifier:v5];
  }
}

- (BOOL)persistState:(id)a3 error:(id *)a4
{
  storeIdentifier = self->_storeIdentifier;
  p_profile = &self->_profile;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v9 = [WeakRetained database];
  LOBYTE(a4) = +[HDCloudSyncStoreEntity persistState:v7 storeUUID:storeIdentifier shouldReplace:1 healthDatabase:v9 error:a4];

  return (char)a4;
}

- (id)persistedStateWithError:(id *)a3
{
  storeIdentifier = self->_storeIdentifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = +[HDCloudSyncStoreEntity persistedStateForStoreUUID:storeIdentifier profile:WeakRetained error:a3];

  return v6;
}

- (BOOL)replaceFrozenAnchorMap:(id)a3 updateDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HDCloudSyncStore_replaceFrozenAnchorMap_updateDate_error___block_invoke;
  v15[3] = &unk_1E62F5A88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

BOOL __60__HDCloudSyncStore_replaceFrozenAnchorMap_updateDate_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 64));
  BOOL v7 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:2 store:v5 profile:WeakRetained error:a3];

  if (!v7) {
    return 0;
  }
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v10 = a1[4];
  id v11 = objc_loadWeakRetained((id *)(v10 + 64));
  BOOL v12 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:v9 type:2 updateDate:v8 store:v10 updatePolicy:2 resetInvalid:1 profile:v11 error:a3];

  return v12;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (int64_t)syncEpoch
{
  return self->_syncEpoch;
}

- (id)syncStoreIdentifier
{
  return self->_storeIdentifier;
}

- (id)databaseIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = 0;
  id v4 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:WeakRetained error:&v9];
  id v5 = v9;

  if (v4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v4);
  }
  else
  {
    _HKInitializeLogging();
    BOOL v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get database identifier: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)syncStoreDefaultSourceBundleIdentifier
{
  return @"com.apple.Health";
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  id v3 = [(objc_class *)a3 syncEntityDependenciesForSyncProtocolVersion:16];
  if ([v3 containsObject:objc_opt_class()])
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    objc_msgSend(v3, "hk_minus:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  id v4 = [(HDCloudSyncStore *)self orderedSyncEntities];
  LOBYTE(a3) = [v4 containsObject:a3];

  return (char)a3;
}

- (id)_syncEntityDependencyIdentifiersForEntity:(void *)a1
{
  v2 = a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = objc_msgSend(a2, "syncEntityDependenciesForSyncProtocolVersion:", objc_msgSend(a1, "protocolVersion"));
    if ([v3 count])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            id v11 = objc_msgSend(v10, "syncEntityIdentifier", (void)v14);
            [v4 addObject:v11];

            __int16 v12 = -[HDCloudSyncStore _syncEntityDependencyIdentifiersForEntity:](v2, v10);
            [v4 addObjectsFromArray:v12];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      v2 = [v4 allObjects];
    }
    else
    {
      v2 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v2;
}

- (id)_supportedSyncEntities
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    id v3 = [WeakRetained syncEngine];
    id v4 = [v3 allOrderedSyncEntities];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__HDCloudSyncStore__supportedSyncEntities__block_invoke;
    v6[3] = &unk_1E63034B8;
    v6[4] = v1;
    objc_msgSend(v4, "hk_filter:", v6);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

uint64_t __42__HDCloudSyncStore__supportedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 supportsSyncStore:v4];
}

- (void)_requiredSyncEntitiesForSupportedSyncEntities:(void *)a1
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*((unsigned char *)a1 + 29))
    {
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      v8[2] = objc_opt_class();
      v8[3] = objc_opt_class();
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
    }
    else if (a1[9])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __66__HDCloudSyncStore__requiredSyncEntitiesForSupportedSyncEntities___block_invoke;
      v7[3] = &unk_1E63034B8;
      v7[4] = a1;
      id v5 = objc_msgSend(v3, "hk_filter:", v7);
    }
    else
    {
      id v5 = v3;
    }
    a1 = v5;
  }

  return a1;
}

uint64_t __66__HDCloudSyncStore__requiredSyncEntitiesForSupportedSyncEntities___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = [a2 supportsDateBasedSharding];
  }
  else {
    uint64_t v4 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [a2 supportsSyncToInitialShard];
  }
  else {
    uint64_t v5 = v4 ^ 1;
  }
  int v6 = [*(id *)(*(void *)(a1 + 32) + 72) type];
  if (v6 == 1) {
    return v4;
  }
  if (v6) {
    return 1;
  }
  return v5;
}

- (id)primaryOrderedSyncEntities
{
  id v3 = -[HDCloudSyncStore _supportedSyncEntities]((id *)&self->super.isa);
  uint64_t v4 = -[HDCloudSyncStore _requiredSyncEntitiesForSupportedSyncEntities:](self, v3);

  return v4;
}

- (id)orderedSyncEntities
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = -[HDCloudSyncStore _supportedSyncEntities]((id *)&self->super.isa);
  uint64_t v4 = -[HDCloudSyncStore _requiredSyncEntitiesForSupportedSyncEntities:](self, v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        __int16 v12 = [v11 syncEntityIdentifier];
        [v5 addObject:v12];

        id v13 = -[HDCloudSyncStore _syncEntityDependencyIdentifiersForEntity:](self, v11);
        [v5 addObjectsFromArray:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__HDCloudSyncStore_orderedSyncEntities__block_invoke;
  v17[3] = &unk_1E63034B8;
  id v18 = v5;
  id v14 = v5;
  long long v15 = objc_msgSend(v3, "hk_filter:", v17);

  return v15;
}

uint64_t __39__HDCloudSyncStore_orderedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 syncEntityIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  return 0;
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = 0;
  id v5 = [(HDCloudSyncStore *)self persistedStateWithError:&v16];
  id v6 = v16;
  if (v5)
  {
    uint64_t v7 = [v5 stateWithGapEncountered:1];

    id v15 = v6;
    BOOL v8 = [(HDCloudSyncStore *)self persistState:v7 error:&v15];
    id v9 = v15;

    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29FA8];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        id v18 = self;
        __int16 v19 = 2114;
        id v20 = v4;
        __int16 v12 = "%{public}@: Recorded anchor gap after validation failure: %{public}@";
LABEL_12:
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138543618;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v12 = "%{public}@: Failed to update persisted state when recording an encountered anchor gap: %{public}@";
      goto LABEL_12;
    }

    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v13 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve current persisted state when recording an encountered anchor gap: %{public}@", buf, 0x16u);
  }
  id v9 = v6;
LABEL_10:

  return 1;
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 0;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSUUID *)self->_storeIdentifier UUIDString];
  int64_t syncProvenance = self->_syncProvenance;
  int64_t syncEpoch = self->_syncEpoch;
  BOOL v8 = HKSyncProtocolVersionToString();
  id v9 = [v3 stringWithFormat:@"<%@:%p %@ (%ld) Epoch %lld, version %@, shard %@>", v4, self, v5, syncProvenance, syncEpoch, v8, self->_shardPredicate];

  return (NSString *)v9;
}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (BOOL)canPush
{
  return self->_canPush;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDCloudSyncShardPredicate)shardPredicate
{
  return self->_shardPredicate;
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (HDSharingPredicate)sharingPredicate
{
  return self->_sharingPredicate;
}

- (BOOL)syncTombstonesOnly
{
  return self->_syncTombstonesOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingPredicate, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
  objc_storeStrong((id *)&self->_shardPredicate, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);

  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end