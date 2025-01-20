@interface _ATXDuetHelper
+ (_ATXDuetHelper)sharedInstance;
- (_ATXDuetHelper)init;
- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7;
- (id)_queryDuetStreamUnbatched:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9;
- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9;
- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5;
- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6;
- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)getAppLaunchesFromUsageBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5;
- (id)getFirstAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5;
- (id)getLastAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5;
- (id)getMicroLocationsFromLastMonth;
- (id)getMostRecentMicroLocation;
- (id)getScreenTransitionsBetweenStartDate:(id)a3 endDate:(id)a4;
- (unint64_t)_countDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7;
- (unint64_t)getDocFreqFor:(id)a3 contentKey:(id)a4;
- (unint64_t)registerDeletionHandler:(id)a3 queue:(id)a4;
- (void)_computeRootOfAppDataWithLockWitness:(id)a3;
- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9;
- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10;
- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9;
- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10;
- (void)_handleTombstoneCreationWithNotification:(id)a3;
- (void)dealloc;
- (void)deregisterDeletionHandlerWithToken:(unint64_t)a3;
- (void)enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6;
- (void)enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6;
- (void)enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5 block:(id)a6;
@end

@implementation _ATXDuetHelper

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  v17 = (void (**)(id, void *))a10;
  if (!a7)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 590, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_batchSize_ascending_block__duetLock);
  v18 = __atxlog_handle_default();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  v20 = __atxlog_handle_default();
  v21 = v20;
  unint64_t v34 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    id v22 = [v38 name];
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = [v22 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  os_signpost_id_t spid = v19;

  uint64_t v23 = 0;
  do
  {
    if ((uint64_t)a7 < 1) {
      break;
    }
    v24 = (void *)MEMORY[0x1D25F6CC0]();
    if (a7 >= a8) {
      unint64_t v25 = a8;
    }
    else {
      unint64_t v25 = a7;
    }
    v26 = [(_ATXDuetHelper *)self _queryDuetStreamUnbatched:v38 startDate:v37 endDate:v36 ascending:a9 otherPredicates:v35 limit:v25 offset:v23];
    if (v26)
    {
      v17[2](v17, v26);
      a7 -= [v26 count];
      v23 += [v26 count];
    }
    uint64_t v27 = [v26 count];
  }
  while (v27);
  v28 = __atxlog_handle_default();
  v29 = v28;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    id v30 = [v38 name];
    uint64_t v31 = [v30 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = v31;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v29, OS_SIGNPOST_INTERVAL_END, spid, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_batchSize_ascending_block__duetLock);
}

- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  if (!a8)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 634, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  v20 = 0;
  v33 = self;
  if (v17 && v18)
  {
    v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@ AND startDate < %@) OR (endDate > %@ AND endDate < %@)", v17, v18, v17, v18];
  }
  SEL v21 = a2;
  if ([v19 count])
  {
    id v22 = (void *)MEMORY[0x1E4F28BA0];
    if (v20)
    {
      uint64_t v23 = [v19 arrayByAddingObject:v20];
    }
    else
    {
      uint64_t v23 = v19;
    }
    v24 = [v22 andPredicateWithSubpredicates:v23];

    if (v20) {
  }
    }
  else
  {
    v24 = v20;
  }
  if (!v24)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:v21, v33, @"_ATXDuetHelper.m", 642, @"Invalid parameter not satisfying: %@", @"searchPredicate" object file lineNumber description];
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__66;
  v45 = __Block_byref_object_dispose__66;
  id v46 = 0;
  unint64_t v25 = (void *)MEMORY[0x1D25F6CC0]();
  v26 = +[ATXDuetKnowledgeStoreManager sharedInstance];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke;
  v34[3] = &unk_1E68B2EC8;
  BOOL v40 = a6;
  id v27 = v24;
  id v35 = v27;
  id v28 = v16;
  unint64_t v38 = a9;
  unint64_t v39 = a8;
  id v36 = v28;
  id v37 = &v41;
  [v26 runBlock:v34];

  id v29 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v29;
}

+ (_ATXDuetHelper)sharedInstance
{
  if (sharedInstance__pasOnceToken8[0] != -1) {
    dispatch_once(sharedInstance__pasOnceToken8, &__block_literal_global_139);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_32;
  return (_ATXDuetHelper *)v2;
}

- (_ATXDuetHelper)init
{
  v18.receiver = self;
  v18.super_class = (Class)_ATXDuetHelper;
  v2 = [(_ATXDuetHelper *)&v18 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v3[1] = 1;
    uint64_t v4 = objc_opt_new();
    v5 = (void *)v3[2];
    v3[2] = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    deletionHandlerLock = v2->_deletionHandlerLock;
    v2->_deletionHandlerLock = (_PASLock *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
    v9 = objc_opt_new();
    uint64_t v10 = [v8 initWithGuardedData:v9];
    rootOfAppDataLock = v2->_rootOfAppDataLock;
    v2->_rootOfAppDataLock = (_PASLock *)v10;

    v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F5B638];
    [v12 addObserver:v2 selector:sel__handleTombstoneCreationWithNotification_ name:*MEMORY[0x1E4F5B638] object:*MEMORY[0x1E4F5B650] suspensionBehavior:2];

    v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    v15 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
    id v16 = [v15 name];
    [v14 addObserver:v2 selector:sel__handleTombstoneCreationWithNotification_ name:v13 object:v16 suspensionBehavior:2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F5B638];
  v5 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  uint64_t v6 = [v5 name];
  [v3 removeObserver:self name:v4 object:v6];

  v7 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v7 removeObserver:self name:v4 object:*MEMORY[0x1E4F5B650]];

  v8.receiver = self;
  v8.super_class = (Class)_ATXDuetHelper;
  [(_ATXDuetHelper *)&v8 dealloc];
}

- (void)enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5 block:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v13 = [MEMORY[0x1E4F5B5F8] appRelevantShortcutsStream];
  id v29 = v11;
  id v30 = v10;
  v14 = [(_ATXDuetHelper *)self _queryDuetStream:v13 startDate:v10 endDate:v11 otherPredicates:0 limit:a5];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
        SEL v21 = (void *)MEMORY[0x1D25F6CC0]();
        id v22 = objc_msgSend(v20, "atx_efficientRelevantShortcut");
        uint64_t v23 = [v20 value];
        v24 = [v23 stringValue];

        if (v24)
        {
          if (v22)
          {
            v12[2](v12, v22, v24);
          }
          else
          {
            v26 = __atxlog_handle_default();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v36 = "-[_ATXDuetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:]";
              __int16 v37 = 2112;
              unint64_t v38 = v24;
              _os_log_error_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_ERROR, "%s: nil relevant shortcut for appRelevantShortcutsStream _DKEvent with bundleId %@", buf, 0x16u);
            }
          }
        }
        else
        {
          unint64_t v25 = __atxlog_handle_default();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v27 = [v20 description];
            *(_DWORD *)buf = 136315394;
            id v36 = "-[_ATXDuetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:]";
            __int16 v37 = 2112;
            unint64_t v38 = v27;
            _os_log_error_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_ERROR, "%s: Found nil bundleId for appRelevantShortcutsStream _DKEvent %@", buf, 0x16u);
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }
}

- (void)_computeRootOfAppDataWithLockWitness:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unint64_t v38 = a3;
  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v4 = +[_ATXDataStore sharedInstance];
  uint64_t v37 = [v4 blobOfType:2];

  v5 = (void *)v37;
  if (v37)
  {
    unint64_t v39 = [[ATXRootOfAppDataWithHashes alloc] initWithSerialized:v37];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v49 = 0;
    v50 = (id *)&v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__66;
    v53 = __Block_byref_object_dispose__66;
    id v54 = 0;
    v7 = objc_opt_new();
    objc_super v8 = [MEMORY[0x1E4F5B5F8] appActivityStream];
    v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v10 = objc_opt_new();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __55___ATXDuetHelper__computeRootOfAppDataWithLockWitness___block_invoke;
    v45[3] = &unk_1E68B2D58;
    v48 = &v49;
    unint64_t v39 = v6;
    id v46 = v39;
    id v40 = v7;
    id v47 = v40;
    [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v8 startDate:v9 endDate:v10 otherPredicates:0 limit:1000000 ascending:1 block:v45];

    id v34 = objc_alloc_init(MEMORY[0x1E4F4B100]);
    id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    v12 = objc_opt_new();
    id v35 = [v34 getIntentEventsBetweenStartDate:v11 endDate:v12 forSource:2 bundleIdFilter:0 allowMissingTitles:0 limit:1000000 INIntentFilter:0 linkActionFilter:0];

    [v40 removeAllObjects];
    if (v35)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = v35;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v18 = (void *)MEMORY[0x1D25F6CC0]();
            uint64_t v19 = [v17 action];
            v20 = [v19 intent];
            SEL v21 = objc_msgSend(v20, "atx_hashApproximately");

            id v22 = +[_ATXActionUtils sha256hex:v21];
            uint64_t v23 = [v17 bundleId];
            v24 = v23;
            if (v22) {
              BOOL v25 = v23 == 0;
            }
            else {
              BOOL v25 = 1;
            }
            if (!v25)
            {
              if (!v50[5] || (objc_msgSend(v23, "isEqualToString:") & 1) == 0)
              {
                v26 = __atxlog_handle_default();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v56 = v24;
                  __int16 v57 = 2112;
                  v58 = v22;
                  _os_log_debug_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEBUG, "CharlesLog, recordSessionWithBundleId,hash:%@,%@", buf, 0x16u);
                }

                [(ATXRootOfAppDataWithHashes *)v39 recordSessionWithBundleId:v24 firstAction:v22];
                objc_storeStrong(v50 + 5, v24);
              }
              if (([v40 containsObject:v22] & 1) == 0)
              {
                [v40 addObject:v22];
                [(ATXRootOfAppData *)v39 recordDocFreqWithBundleId:v24 hasAction:v22];
              }
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
        }
        while (v14);
      }
    }
    id v27 = +[_ATXDataStore sharedInstance];
    id v28 = [(ATXRootOfAppDataWithHashes *)v39 serialize];
    id v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
    [v27 writeBlob:v28 type:2 expirationDate:v29];

    _Block_object_dispose(&v49, 8);
    v5 = 0;
  }

  id v30 = (void *)v38[1];
  v38[1] = v39;
  long long v31 = v39;

  uint64_t v32 = objc_opt_new();
  long long v33 = (void *)v38[2];
  v38[2] = v32;
}

- (unint64_t)getDocFreqFor:(id)a3 contentKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  rootOfAppDataLock = self->_rootOfAppDataLock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43___ATXDuetHelper_getDocFreqFor_contentKey___block_invoke;
  v13[3] = &unk_1E68B2D80;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  id v15 = v10;
  [(_PASLock *)rootOfAppDataLock runWithLockAcquired:v13];
  unint64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4
{
  return [(_ATXDuetHelper *)self getAppLaunchesBetweenStartDate:a3 endDate:a4 bundleIdFilter:0 limit:1000000 batchSize:200];
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5
{
  return [(_ATXDuetHelper *)self getAppLaunchesBetweenStartDate:a3 endDate:a4 bundleIdFilter:0 limit:1000000 batchSize:a5];
}

- (id)getFirstAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  v5 = [(_ATXDuetHelper *)self getAppLaunchesBetweenStartDate:a3 endDate:a4 bundleIdFilter:a5 limit:1];
  id v6 = [v5 firstObject];

  return v6;
}

- (id)getLastAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
  v12 = [MEMORY[0x1E4F5B5F8] appUsageStream];
  id v13 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:v10];
  v23[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v15 = [(_ATXDuetHelper *)self _queryDuetStreamUnbatched:v12 startDate:v8 endDate:v9 ascending:0 otherPredicates:v14 limit:1 offset:0];

  if ([v15 count])
  {
    uint64_t v16 = [v15 firstObject];
    uint64_t v17 = [_ATXAppLaunch alloc];
    uint64_t v18 = [v16 startDate];
    uint64_t v19 = [v16 endDate];
    uint64_t v20 = [v16 timeZone];
    uint64_t v21 = [(_ATXAppLaunch *)v17 initWithBundleId:v10 startDate:v18 endDate:v19 timeZone:v20 reason:0];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)getAppLaunchesFromUsageBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = 1000000;
  }
  unint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
  v12 = (void *)MEMORY[0x1E4F28BA0];
  id v13 = (void *)MEMORY[0x1E4F5B5D0];
  id v14 = [MEMORY[0x1E4F5B4B0] extensionHostIdentifier];
  id v15 = [v13 predicateForObjectsWithMetadataKey:v14];
  uint64_t v16 = [v12 notPredicateWithSubpredicate:v15];

  uint64_t v17 = objc_opt_new();
  uint64_t v18 = [MEMORY[0x1E4F5B5F8] appUsageStream];
  v25[0] = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72___ATXDuetHelper_getAppLaunchesFromUsageBetweenStartDate_endDate_limit___block_invoke;
  v22[3] = &unk_1E68B2DA8;
  id v20 = v17;
  id v23 = v20;
  unint64_t v24 = v10;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v18 startDate:v8 endDate:v9 otherPredicates:v19 limit:1000000 ascending:1 block:v22];

  return v20;
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6
{
  return [(_ATXDuetHelper *)self getAppLaunchesBetweenStartDate:a3 endDate:a4 bundleIdFilter:a5 limit:a6 batchSize:200];
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6) {
    a6 = 1000000;
  }
  context = (void *)MEMORY[0x1D25F6CC0]();
  id v13 = (void *)MEMORY[0x1E4F28BA0];
  id v14 = (void *)MEMORY[0x1E4F5B5D0];
  id v15 = [MEMORY[0x1E4F5B4B0] extensionHostIdentifier];
  uint64_t v16 = [v14 predicateForObjectsWithMetadataKey:v15];
  uint64_t v17 = [v13 notPredicateWithSubpredicate:v16];

  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F5B5F8] appInFocusStream];
  v34[0] = v17;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88___ATXDuetHelper_getAppLaunchesBetweenStartDate_endDate_bundleIdFilter_limit_batchSize___block_invoke;
  v30[3] = &unk_1E68B2DD0;
  id v21 = v12;
  id v31 = v21;
  id v22 = v18;
  id v32 = v22;
  unint64_t v33 = a6;
  LOBYTE(v26) = 1;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v19 startDate:v10 endDate:v11 otherPredicates:v20 limit:1000000 batchSize:a7 ascending:v26 block:v30];

  id v23 = v32;
  id v24 = v22;

  return v24;
}

- (id)getScreenTransitionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithIntegerValue:1];
  id v9 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = objc_opt_new();
  id v11 = [MEMORY[0x1E4F5B5F8] displayIsBacklit];
  v17[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63___ATXDuetHelper_getScreenTransitionsBetweenStartDate_endDate___block_invoke;
  v15[3] = &unk_1E68B1AD8;
  id v13 = v10;
  id v16 = v13;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v11 startDate:v6 endDate:v7 otherPredicates:v12 limit:1000000 ascending:1 block:v15];

  return v13;
}

- (void)enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  context = (void *)MEMORY[0x1D25F6CC0]();
  id v12 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  id v13 = [v12 name];

  id v14 = (void *)MEMORY[0x1E4F5B518];
  id v15 = [MEMORY[0x1E4F5B608] eventStreamName];
  id v16 = [v14 predicateForObjectsWithMetadataKey:v15 andStringValue:v13];

  uint64_t v17 = [MEMORY[0x1E4F5B5F8] tombstoneStream];
  v25[0] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke;
  v23[3] = &unk_1E68B0AA0;
  id v19 = v11;
  id v24 = v19;
  LOBYTE(v20) = 1;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v17 startDate:v9 endDate:v10 otherPredicates:v18 limit:1000000 batchSize:a5 ascending:v20 block:v23];
}

- (void)enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  context = (void *)MEMORY[0x1D25F6CC0]();
  id v11 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  id v12 = [v11 name];

  id v13 = (void *)MEMORY[0x1E4F5B518];
  id v14 = [MEMORY[0x1E4F5B608] eventStreamName];
  id v15 = [v13 predicateForObjectsWithMetadataKey:v14 andStringValue:v12];

  id v16 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v17 = [MEMORY[0x1E4F5B4A8] isEligibleForPrediction];
  uint64_t v18 = [v16 predicateForObjectsWithMetadataKey:v17 andIntegerValue:1];

  id v19 = (void *)MEMORY[0x1E4F28BA0];
  v32[0] = v15;
  v32[1] = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v21 = [v19 andPredicateWithSubpredicates:v20];

  id v22 = [MEMORY[0x1E4F5B5F8] tombstoneStream];
  id v31 = v21;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke;
  v29[3] = &unk_1E68B0AA0;
  id v24 = v10;
  id v30 = v24;
  LOBYTE(v25) = 1;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v22 startDate:v8 endDate:v9 otherPredicates:v23 limit:1000000 batchSize:a5 ascending:v25 block:v29];
}

- (void)_handleTombstoneCreationWithNotification:(id)a3
{
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ATXDuetHelper _handleTombstoneCreationWithNotification:](v4);
  }

  [(_PASLock *)self->_deletionHandlerLock runWithLockAcquired:&__block_literal_global_73];
}

- (unint64_t)registerDeletionHandler:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 479, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 480, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  deletionHandlerLock = self->_deletionHandlerLock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __48___ATXDuetHelper_registerDeletionHandler_queue___block_invoke;
  v17[3] = &unk_1E68B2E58;
  uint64_t v20 = &v21;
  id v11 = v9;
  id v18 = v11;
  id v12 = v7;
  id v19 = v12;
  [(_PASLock *)deletionHandlerLock runWithLockAcquired:v17];
  unint64_t v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)deregisterDeletionHandlerWithToken:(unint64_t)a3
{
  deletionHandlerLock = self->_deletionHandlerLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53___ATXDuetHelper_deregisterDeletionHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_40_e36_v16__0__ATXDuetCallbackGuardedData_8l;
  v4[4] = a3;
  [(_PASLock *)deletionHandlerLock runWithLockAcquired:v4];
}

- (id)getMicroLocationsFromLastMonth
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v3 dateByAddingTimeInterval:-2419200.0];
  v5 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  id v6 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDuetHelper_getMicroLocationsFromLastMonth__block_invoke;
  v9[3] = &unk_1E68B1AD8;
  id v7 = v6;
  id v10 = v7;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v5 startDate:v4 endDate:v3 otherPredicates:0 limit:1000000 ascending:1 block:v9];

  return v7;
}

- (id)getMostRecentMicroLocation
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v4 dateByAddingTimeInterval:-600.0];
  id v6 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  id v7 = [(_ATXDuetHelper *)self _queryDuetStreamUnbatched:v6 startDate:v5 endDate:v4 ascending:0 otherPredicates:0 limit:1 offset:0];
  id v8 = [v7 firstObject];
  id v9 = microLocationEventFromDK(v8);

  return v9;
}

- (unint64_t)_countDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75___ATXDuetHelper__countDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v18[3] = &unk_1E68B2EA0;
  v18[4] = &v19;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v12 startDate:v13 endDate:v14 otherPredicates:v15 limit:a7 ascending:1 block:v18];
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75___ATXDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v19[3] = &unk_1E68B1AD8;
  id v17 = v16;
  id v20 = v17;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:v15 startDate:v14 endDate:v13 otherPredicates:v12 limit:a7 ascending:1 block:v19];

  return v17;
}

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9
{
  LOBYTE(v9) = a8;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:a3 startDate:a4 endDate:a5 otherPredicates:a6 limit:a7 batchSize:200 ascending:v9 block:a9];
}

- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9
{
  LOBYTE(v9) = a8;
  [(_ATXDuetHelper *)self _enumerateBatchesInDuetStream:a3 creationDateStart:a4 creationDateEnd:a5 otherPredicates:a6 limit:a7 batchSize:200 ascending:v9 block:a9];
}

- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v17 = (void (**)(id, void *))a10;
  if (!a7)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 700, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  pthread_mutex_lock(&_enumerateBatchesInDuetStream_creationDateStart_creationDateEnd_otherPredicates_limit_batchSize_ascending_block__duetLock);
  id v18 = __atxlog_handle_default();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  id v20 = __atxlog_handle_default();
  uint64_t v21 = v20;
  unint64_t v34 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    id v22 = [v38 name];
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = [v22 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  os_signpost_id_t spid = v19;

  uint64_t v23 = 0;
  do
  {
    if ((uint64_t)a7 < 1) {
      break;
    }
    uint64_t v24 = (void *)MEMORY[0x1D25F6CC0]();
    if (a7 >= a8) {
      unint64_t v25 = a8;
    }
    else {
      unint64_t v25 = a7;
    }
    uint64_t v26 = [(_ATXDuetHelper *)self _queryDuetStreamUnbatched:v38 creationDateStart:v37 creationDateEnd:v36 ascending:a9 otherPredicates:v35 limit:v25 offset:v23];
    if (v26)
    {
      v17[2](v17, v26);
      a7 -= [v26 count];
      v23 += [v26 count];
    }
    uint64_t v27 = [v26 count];
  }
  while (v27);
  id v28 = __atxlog_handle_default();
  id v29 = v28;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    id v30 = [v38 name];
    uint64_t v31 = [v30 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = v31;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v29, OS_SIGNPOST_INTERVAL_END, spid, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_creationDateStart_creationDateEnd_otherPredicates_limit_batchSize_ascending_block__duetLock);
}

- (id)_queryDuetStreamUnbatched:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (!a8)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 745, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  os_signpost_id_t v19 = 0;
  if (v16 && v17)
  {
    os_signpost_id_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate > %@ AND creationDate < %@", v16, v17];
  }
  if ([v18 count])
  {
    id v20 = (void *)MEMORY[0x1E4F28BA0];
    if (v19)
    {
      uint64_t v21 = [v18 arrayByAddingObject:v19];
    }
    else
    {
      uint64_t v21 = v18;
    }
    id v22 = [v20 andPredicateWithSubpredicates:v21];

    if (v19) {
  }
    }
  else
  {
    id v22 = v19;
  }
  if (!v22)
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_ATXDuetHelper.m", 753, @"Invalid parameter not satisfying: %@", @"searchPredicate" object file lineNumber description];
  }
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__66;
  long long v43 = __Block_byref_object_dispose__66;
  id v44 = 0;
  uint64_t v23 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v24 = +[ATXDuetKnowledgeStoreManager sharedInstance];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __117___ATXDuetHelper__queryDuetStreamUnbatched_creationDateStart_creationDateEnd_ascending_otherPredicates_limit_offset___block_invoke;
  void v32[3] = &unk_1E68B2EC8;
  BOOL v38 = a6;
  id v25 = v22;
  id v33 = v25;
  id v26 = v15;
  unint64_t v36 = a9;
  unint64_t v37 = a8;
  id v34 = v26;
  id v35 = &v39;
  [v24 runBlock:v32];

  id v27 = (id)v40[5];
  _Block_object_dispose(&v39, 8);

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootOfAppDataLock, 0);
  objc_storeStrong((id *)&self->_deletionHandlerLock, 0);
}

- (void)_handleTombstoneCreationWithNotification:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F5B638];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Processing distributed notification %@.", (uint8_t *)&v2, 0xCu);
}

@end