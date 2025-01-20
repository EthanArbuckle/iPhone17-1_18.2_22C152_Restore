@interface ATXActionTimeEstimateAWDTracker
- (ATXActionTimeEstimateAWDTracker)init;
- (ATXActionTimeEstimateAWDTracker)initWithDuetHelper:(id)a3 intentStream:(id)a4 userActivityStream:(id)a5;
- (id)_createTimeEstimateContainers:(id)a3 withSessionLengths:(id)a4 withSessionIndices:(id)a5 withParameterSet:(id)a6 withLaunchReasons:(id)a7 withNoMatchCount:(id)a8 forActionType:(unint64_t)a9;
- (id)_defaultActionTimeEstimateTimestampPath;
- (id)_effectiveEndDateFor:(id)a3;
- (id)_effectiveStartDateFor:(id)a3;
- (id)_getActionKeyFor:(id)a3;
- (id)_queryStartTime;
- (id)_readTimestamp;
- (id)getTimeEstimatesFor:(id)a3 forAppLaunches:(id)a4 withActionType:(unint64_t)a5;
- (void)_readTimestamp;
- (void)_writeTimestamp:(id)a3;
- (void)logActionTimeEstimatesWithActivity:(id)a3;
- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4;
- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4 withActivity:(id)a5;
- (void)postTimeEstimates:(id)a3;
@end

@implementation ATXActionTimeEstimateAWDTracker

- (ATXActionTimeEstimateAWDTracker)init
{
  v3 = +[_ATXDuetHelper sharedInstance];
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [(ATXActionTimeEstimateAWDTracker *)self initWithDuetHelper:v3 intentStream:v4 userActivityStream:v5];

  return v6;
}

- (ATXActionTimeEstimateAWDTracker)initWithDuetHelper:(id)a3 intentStream:(id)a4 userActivityStream:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXActionTimeEstimateAWDTracker;
  v12 = [(ATXActionTimeEstimateAWDTracker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_duetHelper, a3);
    objc_storeStrong((id *)&v13->_intentStream, a4);
    objc_storeStrong((id *)&v13->_activityStream, a5);
  }

  return v13;
}

- (void)logActionTimeEstimatesWithActivity:(id)a3
{
  id v4 = a3;
  v5 = [(ATXActionTimeEstimateAWDTracker *)self _queryStartTime];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
  if ([v6 compare:v5] == -1)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithActivity:]();
    }

    id v8 = v5;
    v6 = v8;
  }
  id v9 = objc_opt_new();
  [(ATXActionTimeEstimateAWDTracker *)self logActionTimeEstimatesWithStartDate:v6 endDate:v9 withActivity:v4];
}

- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4 withActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_ATXDuetHelper *)self->_duetHelper getAppLaunchesBetweenStartDate:v8 endDate:v9 bundleIdFilter:0 limit:0];
  if (!v10 || ([v10 didDefer] & 1) == 0)
  {
    v12 = [(ATXIntentStream *)self->_intentStream getIntentEventsBetweenStartDate:v8 endDate:v9 forSource:2];
    v13 = [(ATXUserActivityStream *)self->_activityStream getActivityIntentEventsBetweenStartDate:v8 endDate:v9];
    if ([v11 count])
    {
      if ([v12 count] || objc_msgSend(v13, "count"))
      {
        if (!v10 || ([v10 didDefer] & 1) == 0)
        {
          v14 = [(ATXActionTimeEstimateAWDTracker *)self getTimeEstimatesFor:v12 forAppLaunches:v11 withActionType:0];
          objc_super v15 = (void *)[v14 mutableCopy];

          v16 = [(ATXActionTimeEstimateAWDTracker *)self getTimeEstimatesFor:v13 forAppLaunches:v11 withActionType:1];
          [v15 addObjectsFromArray:v16];
          [(ATXActionTimeEstimateAWDTracker *)self postTimeEstimates:v15];
          [(ATXActionTimeEstimateAWDTracker *)self _writeTimestamp:v9];
        }
        goto LABEL_12;
      }
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:]();
      }
    }
    else
    {
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:]();
      }
    }

LABEL_12:
  }
}

- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4
{
}

- (id)_getActionKeyFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  uint64_t v5 = [v4 actionKey];
  v6 = (void *)v5;
  v7 = @"Unknown";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  id v8 = v7;

  id v9 = [v3 intent];

  id v10 = [v9 parametersByName];
  uint64_t v11 = [v10 count];

  v12 = [NSString stringWithFormat:@"%@:%lu", v8, v11];

  return v12;
}

- (id)_effectiveStartDateFor:(id)a3
{
  id v3 = [a3 startDate];
  id v4 = [v3 dateByAddingTimeInterval:-5.0];

  return v4;
}

- (id)_effectiveEndDateFor:(id)a3
{
  id v3 = [a3 endDate];
  id v4 = [v3 dateByAddingTimeInterval:5.0];

  return v4;
}

- (id)getTimeEstimatesFor:(id)a3 forAppLaunches:(id)a4 withActionType:(unint64_t)a5
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v46 = v6;
  v56 = v7;
  if ([v6 count])
  {
    v54 = objc_opt_new();
    v50 = objc_opt_new();
    v53 = objc_opt_new();
    v52 = objc_opt_new();
    v51 = objc_opt_new();
    v57 = objc_opt_new();
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x3032000000;
    v91[3] = __Block_byref_object_copy__20;
    v91[4] = __Block_byref_object_dispose__20;
    id v8 = [v7 firstObject];
    id v92 = [v8 startDate];

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v48 = *(void *)v88;
      do
      {
        uint64_t v11 = 0;
        uint64_t v49 = v9;
        do
        {
          if (*(void *)v88 != v48) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v87 + 1) + 8 * v11);
          context = (void *)MEMORY[0x1D25F6CC0]();
          v13 = [(ATXActionTimeEstimateAWDTracker *)self _getActionKeyFor:v12];
          v14 = [v54 objectForKeyedSubscript:v13];
          objc_super v15 = v14;
          if (v14) {
            id v60 = v14;
          }
          else {
            id v60 = (id)objc_opt_new();
          }

          v16 = [v53 objectForKeyedSubscript:v13];
          v17 = v16;
          if (v16) {
            id v59 = v16;
          }
          else {
            id v59 = (id)objc_opt_new();
          }

          v18 = [v52 objectForKeyedSubscript:v13];
          v19 = v18;
          if (v18) {
            id v20 = v18;
          }
          else {
            id v20 = (id)objc_opt_new();
          }
          v21 = v20;

          v22 = [v51 objectForKeyedSubscript:v13];
          v23 = v22;
          if (v22) {
            id v24 = v22;
          }
          else {
            id v24 = (id)objc_opt_new();
          }
          v25 = v24;

          v26 = [v57 objectForKeyedSubscript:v13];
          BOOL v27 = v26 == 0;

          if (v27) {
            [v57 setObject:&unk_1F27F04B0 forKeyedSubscript:v13];
          }
          v28 = [v12 intent];
          v29 = [v28 parametersByName];
          v30 = [v29 allKeys];
          v31 = [v30 sortedArrayUsingSelector:sel_compare_];

          if ([v31 count])
          {
            v32 = [v50 objectForKeyedSubscript:v13];
            v33 = v32;
            if (v32) {
              id v34 = v32;
            }
            else {
              id v34 = (id)objc_opt_new();
            }
            v35 = v34;

            v36 = [v31 componentsJoinedByString:@":"];
            [v35 addObject:v36];

            [v50 setObject:v35 forKeyedSubscript:v13];
          }
          v37 = objc_msgSend(v56, "subarrayWithRange:", v10, objc_msgSend(v56, "count") - v10);
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke;
          v86[3] = &unk_1E68AD900;
          v86[4] = self;
          v86[5] = v12;
          uint64_t v38 = [v37 indexOfObjectPassingTest:v86];
          uint64_t v80 = 0;
          v81 = &v80;
          uint64_t v82 = 0x3032000000;
          v83 = __Block_byref_object_copy__20;
          v84 = __Block_byref_object_dispose__20;
          id v85 = &unk_1F27F04C8;
          uint64_t v74 = 0;
          v75 = &v74;
          uint64_t v76 = 0x3032000000;
          v77 = __Block_byref_object_copy__20;
          v78 = __Block_byref_object_dispose__20;
          id v79 = &unk_1F27F04C8;
          uint64_t v68 = 0;
          v69 = &v68;
          uint64_t v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__20;
          v72 = __Block_byref_object_dispose__20;
          id v73 = &unk_1F27F04C8;
          uint64_t v62 = 0;
          v63 = &v62;
          uint64_t v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__20;
          v66 = __Block_byref_object_dispose__20;
          v67 = &stru_1F2740B58;
          if (v38 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 += v38;
            v39 = objc_msgSend(v56, "subarrayWithRange:", v10, objc_msgSend(v56, "count") - v10);
            v61[0] = MEMORY[0x1E4F143A8];
            v61[1] = 3221225472;
            v61[2] = __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke_46;
            v61[3] = &unk_1E68AD928;
            v61[4] = v12;
            v61[5] = self;
            v61[6] = v91;
            v61[7] = &v74;
            v61[8] = &v80;
            v61[9] = &v68;
            v61[10] = &v62;
            v61[11] = v10;
            [v39 enumerateObjectsUsingBlock:v61];
          }
          if ([(id)v81[5] isEqualToNumber:&unk_1F27F04C8])
          {
            v40 = NSNumber;
            v41 = [v57 objectForKeyedSubscript:v13];
            v42 = objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
            [v57 setObject:v42 forKeyedSubscript:v13];
          }
          else
          {
            [v60 addObject:v81[5]];
            [v54 setObject:v60 forKeyedSubscript:v13];
            [v59 addObject:v69[5]];
            [v53 setObject:v59 forKeyedSubscript:v13];
            [v21 addObject:v75[5]];
            [v52 setObject:v21 forKeyedSubscript:v13];
            [v25 addObject:v63[5]];
            [v51 setObject:v25 forKeyedSubscript:v13];
          }
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v74, 8);

          _Block_object_dispose(&v80, 8);
          ++v11;
        }
        while (v49 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
      }
      while (v9);
    }

    v43 = [(ATXActionTimeEstimateAWDTracker *)self _createTimeEstimateContainers:v54 withSessionLengths:v52 withSessionIndices:v53 withParameterSet:v50 withLaunchReasons:v51 withNoMatchCount:v57 forActionType:a5];
    _Block_object_dispose(v91, 8);
  }
  else
  {
    v43 = objc_opt_new();
  }

  return v43;
}

BOOL __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _effectiveEndDateFor:a2];
  id v4 = [*(id *)(a1 + 40) dateInterval];
  uint64_t v5 = [v4 startDate];
  BOOL v6 = [v3 compare:v5] != -1;

  return v6;
}

void __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke_46(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v42 = a2;
  id v7 = [*(id *)(a1 + 32) dateInterval];
  id v8 = [v7 startDate];
  uint64_t v9 = [*(id *)(a1 + 40) _effectiveStartDateFor:v42];
  uint64_t v10 = [v8 compare:v9];

  if (v10 == -1)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v11 = [v42 bundleId];
    v12 = [*(id *)(a1 + 32) bundleId];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      objc_super v15 = [v42 startDate];
      if ([v14 compare:v15] == 1)
      {
        id v16 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      else
      {
        id v16 = [v42 startDate];
      }
      v17 = v16;

      v18 = NSNumber;
      v19 = [v42 endDate];
      id v20 = [v42 startDate];
      [v19 timeIntervalSinceDate:v20];
      uint64_t v21 = objc_msgSend(v18, "numberWithDouble:");
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      id v24 = NSNumber;
      v25 = [*(id *)(a1 + 32) startDate];
      [v25 timeIntervalSinceDate:v17];
      double v27 = v26;

      double v28 = fmax(v27, 0.0);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) doubleValue];
      if (v28 < v29) {
        double v29 = v28;
      }
      uint64_t v30 = [v24 numberWithDouble:v29];
      uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
      v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      uint64_t v33 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88) + a3];
      uint64_t v34 = *(void *)(*(void *)(a1 + 72) + 8);
      v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = v33;

      uint64_t v36 = [v42 reason];
      v37 = (void *)v36;
      if (v36) {
        uint64_t v38 = (__CFString *)v36;
      }
      else {
        uint64_t v38 = &stru_1F2740B58;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v38);

      uint64_t v39 = [*(id *)(a1 + 32) startDate];
      uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
      v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;

      *a4 = 1;
    }
  }
}

- (id)_createTimeEstimateContainers:(id)a3 withSessionLengths:(id)a4 withSessionIndices:(id)a5 withParameterSet:(id)a6 withLaunchReasons:(id)a7 withNoMatchCount:(id)a8 forActionType:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = objc_opt_new();
  uint64_t v21 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v22 = [v14 allKeys];
  v23 = [v21 setWithArray:v22];

  id v24 = [v19 allKeys];
  [v23 addObjectsFromArray:v24];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __169__ATXActionTimeEstimateAWDTracker__createTimeEstimateContainers_withSessionLengths_withSessionIndices_withParameterSet_withLaunchReasons_withNoMatchCount_forActionType___block_invoke;
  v35[3] = &unk_1E68AD950;
  unint64_t v43 = a9;
  id v36 = v14;
  id v37 = v15;
  id v38 = v16;
  id v39 = v18;
  id v40 = v19;
  id v41 = v17;
  id v25 = v20;
  id v42 = v25;
  id v26 = v17;
  id v27 = v19;
  id v28 = v18;
  id v29 = v16;
  id v30 = v15;
  id v31 = v14;
  [v23 enumerateObjectsUsingBlock:v35];
  v32 = v42;
  id v33 = v25;

  return v33;
}

void __169__ATXActionTimeEstimateAWDTracker__createTimeEstimateContainers_withSessionLengths_withSessionIndices_withParameterSet_withLaunchReasons_withNoMatchCount_forActionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(AWDProactiveAppPredictionActionTimeEstimateContainer);
  [(AWDProactiveAppPredictionActionTimeEstimateContainer *)v4 setActionKey:v3];
  [(AWDProactiveAppPredictionActionTimeEstimateContainer *)v4 setActionType:+[ATXAWDUtils awdActionTypeWithActionType:*(void *)(a1 + 88)]];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addTimeEstimate:](v4, "addTimeEstimate:", [*(id *)(*((void *)&v47 + 1) + 8 * v9++) intValue]);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionLength:](v4, "addSessionLength:", [*(id *)(*((void *)&v43 + 1) + 8 * v14++) intValue]);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v12);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionIndex:](v4, "addSessionIndex:", [*(id *)(*((void *)&v39 + 1) + 8 * v19++) intValue]);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v17);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDProactiveAppPredictionActionTimeEstimateContainer *)v4 addLaunchReason:+[ATXAWDUtils awdAppLaunchReasonWithString:*(void *)(*((void *)&v35 + 1) + 8 * v24++)]];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v22);
  }

  id v25 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
  -[AWDProactiveAppPredictionActionTimeEstimateContainer setNoMatchCount:](v4, "setNoMatchCount:", [v25 intValue]);

  id v26 = [*(id *)(a1 + 72) objectForKeyedSubscript:v3];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        [(AWDProactiveAppPredictionActionTimeEstimateContainer *)v4 addParameter:*(void *)(*((void *)&v31 + 1) + 8 * v30++)];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
  [*(id *)(a1 + 80) addObject:v4];
}

- (void)postTimeEstimates:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_opt_new();
  id v4 = (void *)[v3 mutableCopy];

  [v5 setActions:v4];
  AWDPostMetric();
}

- (id)_defaultActionTimeEstimateTimestampPath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXActionTimeEstimateAWDTrackerTimestamp"];
}

- (id)_queryStartTime
{
  v2 = [(ATXActionTimeEstimateAWDTracker *)self _readTimestamp];
  if (v2 && (v3 = objc_opt_new(), uint64_t v4 = [v2 compare:v3], v3, v4 != 1))
  {
    id v5 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_readTimestamp
{
  id v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v5 = [(ATXActionTimeEstimateAWDTracker *)self _defaultActionTimeEstimateTimestampPath];
  id v19 = 0;
  uint64_t v6 = (void *)[v4 initWithContentsOfFile:v5 options:0 error:&v19];
  id v7 = v19;

  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = (void *)MEMORY[0x1D25F6CC0]();
    id v18 = v7;
    uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v6 error:&v18];
    id v14 = v18;

    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"lastQueryEndTime"];
    }
    else
    {
      uint64_t v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[ATXActionTimeEstimateAWDTracker _readTimestamp]();
      }

      id v15 = 0;
    }
  }
  else
  {
    if ([v7 code] == 260)
    {
      id v15 = 0;
      goto LABEL_14;
    }
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXActionTimeEstimateAWDTracker _readTimestamp]();
    }
    id v15 = 0;
    id v14 = v7;
  }

  id v7 = v14;
LABEL_14:

  return v15;
}

- (void)_writeTimestamp:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v19 = @"lastQueryEndTime";
  v20[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v18 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v18];
  id v9 = v18;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXActionTimeEstimateAWDTracker.m", 349, @"Archiver error: %@", v9 object file lineNumber description];
  }
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
  uint64_t v12 = dispatch_queue_create("action-time-estimate-timestamp-write", v11);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke;
  block[3] = &unk_1E68AB870;
  id v16 = v8;
  uint64_t v17 = self;
  id v13 = v8;
  dispatch_async(v12, block);
}

void __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) _defaultActionTimeEstimateTimestampPath];
  id v6 = 0;
  char v3 = [v1 writeToFile:v2 options:1073741825 error:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke_cold_1();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

- (void)logActionTimeEstimatesWithActivity:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Collecting time estimates since the last query date:%@", v1, 0xCu);
}

- (void)logActionTimeEstimatesWithStartDate:endDate:withActivity:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "No app launches between %@ and %@");
}

- (void)logActionTimeEstimatesWithStartDate:endDate:withActivity:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "No intents or NSUAs donated between %@ and %@");
}

- (void)_readTimestamp
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Failed to load end timestamp for last query: %@", v2, v3, v4, v5, v6);
}

void __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Could not write timestamp: %@", v2, v3, v4, v5, v6);
}

@end