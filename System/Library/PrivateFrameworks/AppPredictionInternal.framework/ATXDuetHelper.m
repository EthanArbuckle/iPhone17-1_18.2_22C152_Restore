@interface ATXDuetHelper
@end

@implementation ATXDuetHelper

void __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke(uint64_t a1, void *a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F29008];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  id v5 = a2;
  v6 = [v3 sortDescriptorWithKey:@"startDate" ascending:v4];
  v7 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v8 = *(void *)(a1 + 32);
  v37[0] = *(void *)(a1 + 40);
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v36 = v6;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v13 = [v7 eventQueryWithPredicate:v8 eventStreams:v9 offset:v10 limit:v11 sortDescriptors:v12];

  v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v13 eventStreams];
    v16 = [v15 firstObject];
    v17 = [v16 name];
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    __int16 v32 = 2080;
    v33 = "-[_ATXDuetHelper _queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:]_block_invoke";
    __int16 v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  id v29 = 0;
  uint64_t v18 = [v5 executeQuery:v13 error:&v29];

  id v19 = v29;
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v18;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

void __32___ATXDuetHelper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_32;
  sharedInstance__pasExprOnceResult_32 = v1;
}

void __55___ATXDuetHelper__computeRootOfAppDataWithLockWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 metadata];
        uint64_t v10 = [MEMORY[0x1E4F5B4A8] userActivityRequiredString];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        v12 = [v8 value];
        v13 = [v12 stringValue];

        if (v11) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
            || (objc_msgSend(v13, "isEqualToString:") & 1) == 0)
          {
            [*(id *)(a1 + 32) recordSessionWithBundleId:v13 firstAction:v11];
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
            [*(id *)(a1 + 40) removeAllObjects];
          }
          if (([*(id *)(a1 + 40) containsObject:v11] & 1) == 0)
          {
            [*(id *)(a1 + 40) addObject:v11];
            [*(id *)(a1 + 32) recordDocFreqWithBundleId:v13 hasAction:v11];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

uint64_t __43___ATXDuetHelper_getDocFreqFor_contentKey___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = 1;
  return result;
}

void __72___ATXDuetHelper_getAppLaunchesFromUsageBetweenStartDate_endDate_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v23 = *(void *)v25;
    id v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
        v9 = [v7 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v7 value];
          uint64_t v11 = [v10 stringValue];
          char v12 = [v11 isEqualToString:@"unknown"];

          if (v12) {
            goto LABEL_16;
          }
          v13 = [v7 value];
          v9 = [v13 stringValue];

          if (v9)
          {
            BOOL v14 = *(void **)(a1 + 32);
            long long v15 = [_ATXAppLaunch alloc];
            long long v16 = [v7 startDate];
            [v7 endDate];
            long long v18 = v17 = a1;
            id v19 = [v7 timeZone];
            uint64_t v20 = [(_ATXAppLaunch *)v15 initWithBundleId:v9 startDate:v16 endDate:v18 timeZone:v19 reason:0];
            [v14 addObject:v20];

            a1 = v17;
            if ((unint64_t)[*(id *)(v17 + 32) count] > *(void *)(v17 + 40)) {
              [*(id *)(v17 + 32) removeObjectAtIndex:0];
            }
            id v3 = v22;
          }
          else
          {
            v21 = __atxlog_handle_default();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v29 = v7;
              _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "App launch with nil bundleId: %@", buf, 0xCu);
            }
          }
        }

LABEL_16:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }
}

void __88___ATXDuetHelper_getAppLaunchesBetweenStartDate_endDate_bundleIdFilter_limit_batchSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = a2;
  uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v4 = *(void *)v29;
    id v24 = v3;
    uint64_t v25 = a1;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v8 = [v6 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v6 value];
          uint64_t v10 = [v9 stringValue];
          char v11 = [v10 isEqualToString:@"unknown"];

          if (v11) {
            goto LABEL_18;
          }
          char v12 = [v6 value];
          uint64_t v8 = [v12 stringValue];

          if (v8)
          {
            v13 = *(void **)(a1 + 32);
            if (!v13 || [v13 isEqualToString:v8])
            {
              long long v26 = *(void **)(a1 + 40);
              BOOL v14 = [_ATXAppLaunch alloc];
              long long v15 = [v6 startDate];
              long long v16 = [v6 endDate];
              uint64_t v17 = [v6 timeZone];
              long long v18 = [v6 metadata];
              id v19 = [MEMORY[0x1E4F5B4B0] launchReason];
              uint64_t v20 = [v18 objectForKeyedSubscript:v19];
              v21 = [(_ATXAppLaunch *)v14 initWithBundleId:v8 startDate:v15 endDate:v16 timeZone:v17 reason:v20];
              [v26 addObject:v21];

              a1 = v25;
              if ((unint64_t)[*(id *)(v25 + 40) count] > *(void *)(v25 + 48)) {
                [*(id *)(v25 + 40) removeObjectAtIndex:0];
              }
              uint64_t v4 = v23;
              id v3 = v24;
            }
          }
          else
          {
            id v22 = __atxlog_handle_default();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v6;
              _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "App launch with nil bundleId: %@", buf, 0xCu);
            }
          }
        }

LABEL_18:
      }
      uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }
}

void __63___ATXDuetHelper_getScreenTransitionsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D25F6CC0](v4);
        uint64_t v10 = *(void **)(a1 + 32);
        char v11 = objc_msgSend(v8, "endDate", (void)v12);
        [v10 addObject:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

void __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v6 = [v3 stringValue];
  uint64_t v7 = (void *)[v5 initWithUUIDString:v6];
  uint64_t v8 = [v3 startDate];

  v9 = (void *)[v4 initWithFirst:v7 second:v8];
  return v9;
}

void __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_pas_mappedArrayWithTransform:", &__block_literal_global_70_1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v6 = [v3 stringValue];
  uint64_t v7 = (void *)[v5 initWithUUIDString:v6];
  uint64_t v8 = [v3 startDate];

  v9 = (void *)[v4 initWithFirst:v7 second:v8];
  return v9;
}

uint64_t __59___ATXDuetHelper__handleTombstoneCreationWithNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_76_1];
}

void __59___ATXDuetHelper__handleTombstoneCreationWithNotification___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  queue = [v3 first];
  id v4 = [v3 second];

  dispatch_async(queue, v4);
}

void __48___ATXDuetHelper_registerDeletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  a2[1] = v3 + 1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  id v4 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v5 = a2;
  id v6 = [v4 alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v8 = (void *)[v6 initWithFirst:v7 second:v11];
  v9 = (void *)v5[2];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v9 setObject:v8 forKeyedSubscript:v10];
}

void __53___ATXDuetHelper_deregisterDeletionHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 16);
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  [v2 setObject:0 forKeyedSubscript:v3];
}

void __48___ATXDuetHelper_getMicroLocationsFromLastMonth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = microLocationEventFromDK(*(void **)(*((void *)&v9 + 1) + 8 * v7));
        if (v8) {
          [*(id *)(a1 + 32) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __75___ATXDuetHelper__countDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __75___ATXDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __117___ATXDuetHelper__queryDuetStreamUnbatched_creationDateStart_creationDateEnd_ascending_otherPredicates_limit_offset___block_invoke(uint64_t a1, void *a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F29008];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  id v5 = a2;
  uint64_t v6 = [v3 sortDescriptorWithKey:@"creationDate" ascending:v4];
  uint64_t v7 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v8 = *(void *)(a1 + 32);
  v37[0] = *(void *)(a1 + 40);
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v36 = v6;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  long long v13 = [v7 eventQueryWithPredicate:v8 eventStreams:v9 offset:v10 limit:v11 sortDescriptors:v12];

  uint64_t v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v13 eventStreams];
    long long v16 = [v15 firstObject];
    uint64_t v17 = [v16 name];
    *(_DWORD *)buf = 138543874;
    long long v31 = v17;
    __int16 v32 = 2080;
    v33 = "-[_ATXDuetHelper _queryDuetStreamUnbatched:creationDateStart:creationDateEnd:ascending:otherPredicates:limit:o"
          "ffset:]_block_invoke";
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  id v29 = 0;
  uint64_t v18 = [v5 executeQuery:v13 error:&v29];

  id v19 = v29;
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v18;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

void __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end