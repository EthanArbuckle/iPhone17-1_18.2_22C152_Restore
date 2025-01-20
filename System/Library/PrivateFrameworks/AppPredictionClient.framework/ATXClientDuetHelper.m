@interface ATXClientDuetHelper
+ (id)sharedInstance;
- (id)_getIntentEventForSource:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 bundleIdFilter:(id)a7 limit:(unint64_t)a8;
- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7;
- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7;
- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 forSource:(int64_t)a6;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5;
- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 block:(id)a8;
@end

@implementation ATXClientDuetHelper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_3, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_4;

  return v2;
}

void __37__ATXClientDuetHelper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4;
  sharedInstance__pasExprOnceResult_4 = v1;
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1AD0D3C30]();
  v8 = [(ATXClientDuetHelper *)self getIntentEventsBetweenStartDate:v6 endDate:v7 forSource:1];
  v9 = [(ATXClientDuetHelper *)self getActivityEventsBetweenStartDate:v6 endDate:v7];
  v10 = objc_opt_new();
  if ([v8 count]) {
    [v10 addObjectsFromArray:v8];
  }
  if ([v9 count]) {
    [v10 addObjectsFromArray:v9];
  }
  [v10 sortUsingComparator:&__block_literal_global_8];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) first];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v11;
}

uint64_t __63__ATXClientDuetHelper_getIntentEventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 second];
  id v6 = [v4 second];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5
{
  return [(ATXClientDuetHelper *)self getIntentEventsBetweenStartDate:a3 endDate:a4 bundleIdFilter:0 forSource:a5];
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 forSource:(int64_t)a6
{
  return [(ATXClientDuetHelper *)self _getIntentEventForSource:a6 startDate:a3 endDate:a4 otherPredicates:0 bundleIdFilter:a5 limit:100];
}

- (id)_getIntentEventForSource:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 bundleIdFilter:(id)a7 limit:(unint64_t)a8
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v66 = a7;
  context = (void *)MEMORY[0x1AD0D3C30]();
  v16 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  v57 = v14;
  v58 = v13;
  v56 = v15;
  v17 = [(ATXClientDuetHelper *)self _queryDuetStream:v16 startDate:v13 endDate:v14 otherPredicates:v15 limit:a8];

  id v59 = (id)objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v73 = *(void *)v78;
    unint64_t v21 = 0x1E4F5B000uLL;
    id v68 = v18;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v78 != v73) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v77 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1AD0D3C30]();
        uint64_t v25 = [v23 UUID];

        if (v25)
        {
          v26 = [v23 metadata];
          v27 = [*(id *)(v21 + 1360) intentClass];
          v28 = [v26 objectForKeyedSubscript:v27];

          if (!v28 || ([v28 isEqualToString:@"unknown"] & 1) != 0) {
            goto LABEL_41;
          }
          v29 = [v23 metadata];
          v30 = [*(id *)(v21 + 1360) serializedInteraction];
          v31 = [v29 objectForKeyedSubscript:v30];

          if (!v31) {
            goto LABEL_40;
          }
          v32 = (void *)MEMORY[0x1AD0D3C30]();
          v33 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v34 = objc_opt_class();
          id v76 = 0;
          v35 = [v33 unarchivedObjectOfClass:v34 fromData:v31 error:&v76];
          id v72 = v76;
          if (!v35)
          {
            v40 = v72;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[ATXClientDuetHelper _getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:](&v87, (uint64_t)v72, &v88);
            }
            goto LABEL_39;
          }
          v36 = [v35 intent];
          uint64_t v37 = objc_msgSend(v36, "atx_titleLengthWithoutLocalizing");

          if (!v37)
          {
            id v18 = v68;
            v40 = v72;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[ATXClientDuetHelper _getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:](&v74, v75);
            }
            goto LABEL_39;
          }
          v38 = [v35 intent];
          v39 = [v38 _className];

          id v18 = v68;
          if ([v39 isEqualToString:@"INIntent"]) {
            goto LABEL_38;
          }
          v67 = v39;
          if ((unint64_t)(a3 - 1) > 1)
          {
            v41 = 0;
          }
          else
          {
            if ([v35 _donatedBySiri])
            {
              v69 = 0;
            }
            else
            {
              v42 = [v23 source];
              v69 = [v42 bundleID];
            }
            v43 = v66;
            if (![v35 _donatedBySiri] || objc_msgSend(v35, "intentHandlingStatus"))
            {
              v41 = v69;
              if (!v69) {
                goto LABEL_25;
              }
LABEL_27:
              v71 = v41;
              if ([v41 length])
              {
                if ([MEMORY[0x1E4F93B08] isInternalBuild]
                  && [v71 hasPrefix:@"appshack."])
                {
                  uint64_t v62 = [v71 substringFromIndex:objc_msgSend(@"appshack.", "length")];

                  v71 = (void *)v62;
                  v43 = v66;
                }
                if (!v43 || [v43 isEqualToString:v71])
                {
                  v63 = [ATXAction alloc];
                  v60 = [v35 intent];
                  v45 = [v23 UUID];
                  LOBYTE(v53) = 0;
                  v64 = [(ATXAction *)v63 initWithIntent:v60 actionUUID:v45 bundleId:v71 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v53 title:0 subtitle:0];

                  id v18 = v68;
                  v61 = (void *)MEMORY[0x1E4F93BB8];
                  v46 = [v23 startDate];
                  v47 = [v61 tupleWithFirst:v64 second:v46];
                  [v59 addObject:v47];

                  v48 = v71;
                  v39 = v67;
                  goto LABEL_37;
                }
LABEL_35:
                v39 = v67;
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                v50 = [v35 intent];
                *(_DWORD *)buf = 138412802;
                v82 = v50;
                __int16 v83 = 2112;
                v39 = v67;
                v84 = v67;
                __int16 v85 = 2048;
                int64_t v86 = a3;
                _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No bundleId for intent: %@, intentType: %@, intentSource: %lld", buf, 0x20u);
              }
              v48 = v71;
LABEL_37:

LABEL_38:
              v40 = v72;
LABEL_39:

LABEL_40:
              unint64_t v21 = 0x1E4F5B000;
LABEL_41:

              goto LABEL_42;
            }
            v49 = [v23 source];
            uint64_t v65 = [v49 bundleID];

            v43 = v66;
            v41 = (void *)v65;
            if (v65) {
              goto LABEL_27;
            }
LABEL_25:
            v44 = [v23 metadata];
            uint64_t v70 = [v44 objectForKeyedSubscript:@"source-bundleId"];

            v41 = (void *)v70;
          }
          v43 = v66;
          goto LABEL_27;
        }
LABEL_42:
        ++v22;
      }
      while (v20 != v22);
      uint64_t v51 = [v18 countByEnumeratingWithState:&v77 objects:v89 count:16];
      uint64_t v20 = v51;
    }
    while (v51);
  }

  return v59;
}

- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  return [(ATXClientDuetHelper *)self getActivityEventsBetweenStartDate:a3 endDate:a4 bundleIdFilter:0];
}

- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x1AD0D3C30]();
  v11 = (void *)MEMORY[0x1E4F5B5D0];
  id v12 = [MEMORY[0x1E4F5B4A8] isEligibleForPrediction];
  id v13 = [v11 predicateForObjectsWithMetadataKey:v12 andIntegerValue:1];
  v84[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];

  id v15 = v10;
  v16 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  id v59 = v9;
  v60 = v8;
  v57 = (void *)v14;
  v17 = [(ATXClientDuetHelper *)self _queryDuetStream:v16 startDate:v8 endDate:v9 otherPredicates:v14 limit:100];

  id v63 = (id)objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v72;
    uint64_t v61 = *MEMORY[0x1E4F44370];
    uint64_t v62 = v15;
    id v64 = v18;
    do
    {
      uint64_t v22 = 0;
      uint64_t v69 = v20;
      do
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v71 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1AD0D3C30]();
        uint64_t v25 = [v23 UUID];

        if (v25)
        {
          v26 = [v23 value];
          v27 = [v26 stringValue];

          if ([v27 length])
          {
            if (!v15 || [v15 isEqualToString:v27])
            {
              uint64_t v28 = v21;
              v29 = v15;
              v30 = [v23 metadata];
              v31 = [MEMORY[0x1E4F5B4A8] userActivityRequiredString];
              v32 = [v30 objectForKeyedSubscript:v31];

              if (v32)
              {
                v33 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v32 secondaryString:0 optionalData:0];
                uint64_t v70 = [v33 activityType];
                if (v70)
                {
                  v67 = v33;
                  uint64_t v34 = [v23 metadata];
                  v35 = [MEMORY[0x1E4F5B4A8] itemIdentifier];
                  uint64_t v36 = [v34 objectForKeyedSubscript:v35];

                  id v68 = (void *)v36;
                  if (v36)
                  {
                    uint64_t v37 = [v23 metadata];
                    v38 = [MEMORY[0x1E4F5B4A8] itemRelatedContentURL];
                    id v66 = [v37 objectForKeyedSubscript:v38];

                    v39 = [v23 metadata];
                    v40 = [MEMORY[0x1E4F5B4A8] itemRelatedUniqueIdentifier];
                    uint64_t v41 = [v39 objectForKeyedSubscript:v40];

                    v42 = [v23 metadata];
                    v43 = [MEMORY[0x1E4F5B4A8] contentDescription];
                    uint64_t v44 = [v42 objectForKeyedSubscript:v43];

                    v45 = (void *)v44;
                    uint64_t v65 = (void *)v41;
                    if (v66 || v41)
                    {
                      v46 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithContentType:v61];
                      [v46 setRelatedUniqueIdentifier:v41];
                      [v46 setContentURL:v66];
                      [v46 setContentDescription:v44];
                    }
                    else
                    {
                      v46 = 0;
                    }
                    uint64_t v21 = v28;
                    v49 = v45;
                    v50 = [ATXAction alloc];
                    uint64_t v51 = [v23 UUID];
                    LOBYTE(v56) = 0;
                    v48 = [(ATXAction *)v50 initWithNSUserActivityString:v32 actionUUID:v51 bundleId:v27 itemIdentifier:v68 contentAttributeSet:v46 heuristic:0 heuristicMetadata:0 isFutureMedia:v56 title:0 subtitle:0];

                    v52 = (void *)MEMORY[0x1E4F93BB8];
                    uint64_t v53 = [v23 startDate];
                    v54 = [v52 tupleWithFirst:v48 second:v53];
                    [v63 addObject:v54];

                    id v15 = v62;
                  }
                  else
                  {
                    v48 = 0;
                    id v15 = v29;
                    uint64_t v21 = v28;
                  }
                  uint64_t v20 = v69;
                  id v18 = v64;
                  v47 = (void *)v70;
                  if (![(ATXAction *)v48 hasActionTitle]
                    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                  {
                    -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:].cold.4(&v77, v70, &v78);
                  }

                  v33 = v67;
                }
                else
                {
                  id v15 = v29;
                  uint64_t v21 = v28;
                  uint64_t v20 = v69;
                  v47 = 0;
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                    -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:](&v79, (uint64_t)v33, &v80);
                  }
                }
              }
              else
              {
                id v15 = v29;
                uint64_t v21 = v28;
                uint64_t v20 = v69;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:](&v81, (uint64_t)v27, &v82);
                }
              }
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:](v75, v23, &v76);
          }
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v20);
  }

  return v63;
}

- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__ATXClientDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v19[3] = &unk_1E5D06B48;
  id v17 = v16;
  id v20 = v17;
  [(ATXClientDuetHelper *)self _enumerateBatchesInDuetStream:v15 startDate:v14 endDate:v13 otherPredicates:v12 limit:a7 block:v19];

  return v17;
}

void __80__ATXClientDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1AD0D3C30]();
  [*(id *)(a1 + 32) addObjectsFromArray:v4];
}

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 block:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v14 = a4;
  id v37 = a5;
  id v36 = a6;
  id v15 = (void (**)(id, void *))a8;
  if (a7)
  {
    uint64_t v16 = pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);
    if ((uint64_t)a7 >= 1)
    {
      id v17 = v14;
      while (1)
      {
        id v18 = (void *)MEMORY[0x1AD0D3C30](v16);
        if ((uint64_t)a7 >= 200) {
          unint64_t v19 = 200;
        }
        else {
          unint64_t v19 = a7;
        }
        id v20 = [(ATXClientDuetHelper *)self _queryDuetStreamUnbatched:v38 startDate:v17 endDate:v37 otherPredicates:v36 limit:v19];
        if (v20)
        {
          v15[2](v15, v20);
          a7 -= [v20 count];
        }
        if (![v20 count]) {
          break;
        }
        [v17 timeIntervalSinceReferenceDate];
        double v22 = v21;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v23 = v20;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v40 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v29 = [v28 startDate];
              [v29 timeIntervalSinceReferenceDate];
              double v31 = v30;

              if (v31 <= v22) {
                double v31 = v22;
              }
              v32 = [v28 endDate];
              [v32 timeIntervalSinceReferenceDate];
              double v22 = v33;

              if (v22 <= v31) {
                double v22 = v31;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v25);
        }

        id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v22];
        id v17 = v14;
        if ((uint64_t)a7 <= 0) {
          goto LABEL_24;
        }
      }

      id v14 = v17;
    }
  }
  else
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"ATXClientDuetHelper.m", 252, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];

    pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);
  }
LABEL_24:
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);
}

- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a7)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"ATXClientDuetHelper.m", 293, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];
  }
  id v17 = 0;
  if (v14 && v15)
  {
    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@ AND startDate < %@) OR (endDate > %@ AND endDate < %@)", v14, v15, v14, v15];
  }
  id v38 = v16;
  if ([v16 count])
  {
    id v18 = (void *)MEMORY[0x1E4F28BA0];
    if (v17)
    {
      id v16 = [v16 arrayByAddingObject:v17];
    }
    unint64_t v19 = [v18 andPredicateWithSubpredicates:v16];

    if (v17) {
  }
    }
  else
  {
    unint64_t v19 = v17;
  }
  if (!v19)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"ATXClientDuetHelper.m", 301, @"Invalid parameter not satisfying: %@", @"searchPredicate" object file lineNumber description];
  }
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v20 = [MEMORY[0x1E4F5B560] knowledgeStore];
  double v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  double v22 = (void *)MEMORY[0x1E4F5B518];
  long long v39 = v13;
  v48[0] = v13;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  v47 = v21;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  uint64_t v25 = [v22 eventQueryWithPredicate:v19 eventStreams:v23 offset:0 limit:a7 sortDescriptors:v24];

  uint64_t v26 = __atxlog_handle_default();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v25 eventStreams];
    uint64_t v28 = [v27 firstObject];
    v29 = [v28 name];
    *(_DWORD *)buf = 138543874;
    long long v42 = v29;
    __int16 v43 = 2080;
    uint64_t v44 = "-[ATXClientDuetHelper _queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:]";
    __int16 v45 = 2112;
    v46 = v25;
    _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  id v40 = 0;
  double v30 = [v20 executeQuery:v25 error:&v40];
  id v31 = v40;
  if (!v30 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[ATXClientDuetHelper _queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:]((uint64_t)v31, v32, v33);
  }

  return v30;
}

- (void)_getIntentEventForSource:(void *)a3 startDate:endDate:otherPredicates:bundleIdFilter:limit:.cold.1(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, MEMORY[0x1E4F14500], v3, "Error unarchiving intent: %@", v4);
}

- (void)_getIntentEventForSource:(uint8_t *)buf startDate:(unsigned char *)a2 endDate:otherPredicates:bundleIdFilter:limit:.cold.2(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Nil or empty title attached to intent event -- filtering out", buf, 2u);
}

- (void)getActivityEventsBetweenStartDate:(uint8_t *)a1 endDate:(void *)a2 bundleIdFilter:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3)
{
  v5 = [a2 UUID];
  id v6 = [v5 UUIDString];
  *(_DWORD *)a1 = 138412290;
  *a3 = v6;
  _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No bundleId found for eventUUID: %@", a1, 0xCu);
}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(void *)a3 .cold.2(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, MEMORY[0x1E4F14500], v3, "Nil requiredString for bundleId: %@", v4);
}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(void *)a3 .cold.3(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, MEMORY[0x1E4F14500], v3, "Nil activityType for NSUserActivity: %@", v4);
}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(void *)a3 .cold.4(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, MEMORY[0x1E4F14500], v3, "Nil or empty title attached to event of activityType: %@ -- filtering out", v4);
}

- (void)_queryDuetStreamUnbatched:(uint64_t)a3 startDate:endDate:otherPredicates:limit:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, MEMORY[0x1E4F14500], a3, "Error querying Duet: %@", (uint8_t *)&v3);
}

@end