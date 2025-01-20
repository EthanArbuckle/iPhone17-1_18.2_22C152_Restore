@interface _DKPerformSyncUpHistoryAdditionsOperation
+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:;
+ (void)_updateEventStatsWithTotal:(void *)a3 streamNameCounts:(uint64_t)a4 transportType:;
- (BOOL)isAsynchronous;
- (id)history;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:;
- (uint64_t)performSyncUpHistoryAdditions;
- (void)endOperation;
- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a3 eventsCount:(void *)a4 error:;
- (void)main;
- (void)performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:(void *)a3 orError:;
- (void)performSyncUpHistoryAdditionsWithPreviousHighWaterMark:(uint64_t)a1;
@end

@implementation _DKPerformSyncUpHistoryAdditionsOperation

+ (void)_updateEventStatsWithTotal:(void *)a3 streamNameCounts:(uint64_t)a4 transportType:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self;
  if (_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCounterInitialized, &__block_literal_global_38_0);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter, a2);
  if (a4 == 1) {
    v7 = @"Rapport";
  }
  else {
    v7 = @"Cloud";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter, a2, v7);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [(id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName objectForKeyedSubscript:v13];
        if (!v14)
        {
          v15 = NSString;
          v16 = +[_DKEventStatsUtilities safeStringWithString:v13];
          v17 = [v15 stringWithFormat:@"sync_up_history_additions_stream%@", v16];

          v14 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", v17);
          [(id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName setObject:v14 forKeyedSubscript:v13];
        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v14, [v8 countForObject:v13]);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a3 eventsCount:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v9);

    if (v8)
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:](a1, v8, v10);
      }

      uint64_t v11 = [(id)a1 errors];
      [v11 addObject:v8];

LABEL_22:
      [(id)a1 endOperation];
      goto LABEL_23;
    }
    v12 = +[_CDLogging syncChannel];
    uint64_t v13 = v12;
    if (a3)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v27 = [(id)objc_opt_class() description];
        v26 = [NSNumber numberWithUnsignedInteger:a3];
        v25 = [v7 debugDescription];
        uint64_t v14 = [*(id *)(a1 + 304) transportType];
        v15 = "down from";
        if (v14 == 8) {
          v15 = "up to";
        }
        v24 = v15;
        v16 = &stru_1EDDE58B8;
        if ([*(id *)(a1 + 312) me]) {
          v17 = @"pseudo ";
        }
        else {
          v17 = &stru_1EDDE58B8;
        }
        long long v18 = [*(id *)(a1 + 312) identifier];
        long long v19 = [*(id *)(a1 + 312) model];
        if (v19)
        {
          long long v20 = NSString;
          uint64_t v23 = [*(id *)(a1 + 312) model];
          v16 = [v20 stringWithFormat:@" (%@)", v23];
        }
        long long v21 = [*(id *)(a1 + 304) name];
        *(_DWORD *)buf = 138545154;
        v31 = v27;
        __int16 v32 = 2112;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v25;
        __int16 v36 = 2082;
        v37 = v24;
        __int16 v38 = 2114;
        v39 = v17;
        __int16 v40 = 2114;
        v41 = v18;
        __int16 v42 = 2114;
        v43 = v16;
        __int16 v44 = 2114;
        v45 = v21;
        _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "%{public}@: Synced up %@ events and high water mark window in window %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

        if (v19)
        {
        }
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:](a1, v7, v13);
    }

    unint64_t v22 = *(void *)(a1 + 352);
    if (v22 >= [*(id *)(a1 + 320) maxBatchesPerSync]) {
      goto LABEL_22;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100___DKPerformSyncUpHistoryAdditionsOperation_handleUpdateStorageWithFetchedWindow_eventsCount_error___block_invoke;
    v28[3] = &unk_1E560D848;
    v28[4] = a1;
    id v29 = v7;
    +[_DKSyncSerializer performAsyncBlock:v28];
  }
LABEL_23:
}

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14 = a3;
  id v23 = a4;
  id v15 = a5;
  id v22 = a6;
  id v16 = a7;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_DKPerformSyncUpHistoryAdditionsOperation;
    v17 = (id *)objc_msgSendSuper2(&v24, sel_initWithParent_, a2);
    long long v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      id v20 = v18[43];
      v18[43] = (id)v19;
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))
  {
    [(_DKPerformSyncUpHistoryAdditionsOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditions]((uint64_t)self);
  }
}

- (uint64_t)performSyncUpHistoryAdditions
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = objc_msgSend(*(id *)(v1 + 320), "streamNamesToSyncWithSyncType:transportType:", *(void *)(v1 + 328), objc_msgSend(*(id *)(v1 + 304), "transportType"));
    v4 = *(void **)(v1 + 336);
    *(void *)(v1 + 336) = v3;

    if ([*(id *)(v1 + 336) count])
    {
      v5 = *(void **)(v1 + 296);
      uint64_t v6 = *(void *)(v1 + 312);
      id v7 = [*(id *)(v1 + 304) name];
      uint64_t v8 = [v5 additionsSyncHistoryForPeer:v6 transportName:v7 error:0];
      uint64_t v9 = *(void **)(v1 + 360);
      *(void *)(v1 + 360) = v8;

      uint64_t v10 = objc_opt_class();
      if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, *(void **)(v1 + 328), *(void **)(v1 + 360), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)))
      {
        uint64_t v11 = *(void **)(v1 + 320);
        uint64_t v12 = *(void *)(v1 + 328);
        uint64_t v13 = [*(id *)(v1 + 360) lastSyncDate];
        uint64_t v14 = [v11 highPriorityForSyncUpWithSyncType:v12 lastSyncDate:v13];

        id v15 = *(void **)(v1 + 304);
        uint64_t v16 = *(void *)(v1 + 312);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __74___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditions__block_invoke;
        v18[3] = &unk_1E560FB68;
        v18[4] = v1;
        return [v15 fetchAdditionsHighWaterMarkWithPeer:v16 highPriority:v14 completion:v18];
      }
    }
    else
    {
      v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(_DKPerformSyncUpHistoryAdditionsOperation *)v1 performSyncUpHistoryAdditions];
      }
    }
    return [(id)v1 endOperation];
  }
  return result;
}

- (void)performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:(void *)a3 orError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5)
    {
      -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:]((uint64_t)a1, v5);
    }
    else
    {
      id v7 = +[_CDLogging syncChannel];
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:orError:]((uint64_t)a1, v6, v7);
        }

        id v7 = [a1 errors];
        [v7 addObject:v6];
      }
      else if (v8)
      {
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:orError:](a1, v7);
      }

      [a1 endOperation];
    }
  }
}

- (void)performSyncUpHistoryAdditionsWithPreviousHighWaterMark:(uint64_t)a1
{
  v192[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:].cold.4(a1, (int)v3, (int)v5, v6, v7, v8, v9, v10, v118, v119, (uint64_t)v120, v122, SWORD2(v122), (uint64_t)v124, (__int16)v126, v128, v132, v137, (__int16)v142,
    }
        v144,
        v147,
        v150,
        v153,
        v155,
        v156,
        v157,
        v158,
        (uint64_t)v159,
        v160,
        (uint64_t)v161,
        v162,
        v163,
        v164,
        v165,
        *((uint64_t *)&v165 + 1),
        v166,
        *((uint64_t *)&v166 + 1));

    uint64_t v11 = [*(id *)(a1 + 320) queryStartDateWithSyncType:*(void *)(a1 + 328) previousHighWaterMark:v3];
    id v12 = *(id *)(a1 + 344);
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v11 timeIntervalSinceReferenceDate];
    if (v14 - v15 <= (double)(unint64_t)[*(id *)(a1 + 320) minSyncWindowInSeconds])
    {
      v35 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:](a1, v35);
      }

      id v32 = 0;
      v31 = 0;
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 352);
      if (!v16)
      {
        v17 = [*(id *)(a1 + 360) lastSyncDate];
        +[_DKPerformSyncUpHistoryAdditionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncUpHistoryAdditionsOperation, v17, [*(id *)(a1 + 304) transportType]);

        uint64_t v16 = *(void *)(a1 + 352);
      }
      *(void *)(a1 + 352) = v16 + 1;
      long long v18 = objc_opt_new();
      -[_DKSyncWindow setStartDate:]((uint64_t)v18, v11);
      uint64_t v154 = (uint64_t)v12;
      -[_DKSyncWindow setEndDate:]((uint64_t)v18, v12);
      uint64_t v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:](a1, (int)v18, (int)v19, v20, v21, v22, v23, v24, v118, v119, (uint64_t)v120, v122, (uint64_t)v124, (uint64_t)v126, v128, v132, v137, (uint64_t)v142, v144,
      }
          v147,
          v150,
          (uint64_t)v12,
          v155,
          v156,
          v157,
          v158,
          (uint64_t)v159,
          v160,
          (uint64_t)v161,
          v162,
          v163,
          v164);

      unint64_t v25 = [*(id *)(a1 + 320) syncBatchSizeInEvents];
      unint64_t v26 = v25;
      if (v25 <= 1) {
        unint64_t v27 = v25;
      }
      else {
        unint64_t v27 = v25 + 1;
      }
      v28 = *(void **)(a1 + 296);
      v192[0] = v18;
      id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:1];
      uint64_t v30 = *(void *)(a1 + 336);
      id v169 = 0;
      v31 = [v28 sortedEventsFromSyncWindows:v29 streamNames:v30 limit:v27 fetchOrder:1 error:&v169];
      id v32 = v169;

      if (v32)
      {
        v33 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v146 = (uint64_t)v3;
          v149 = [(id)objc_opt_class() description];
          uint64_t v152 = (uint64_t)v18;
          v139 = [v18 debugDescription];
          uint64_t v83 = [*(id *)(a1 + 304) transportType];
          v84 = "down from";
          if (v83 == 8) {
            v84 = "up to";
          }
          uint64_t v130 = (uint64_t)v84;
          v85 = &stru_1EDDE58B8;
          if ([*(id *)(a1 + 312) me]) {
            v86 = @"pseudo ";
          }
          else {
            v86 = &stru_1EDDE58B8;
          }
          v87 = [*(id *)(a1 + 312) identifier];
          v134 = [*(id *)(a1 + 312) model];
          if (v134)
          {
            v88 = NSString;
            v126 = [*(id *)(a1 + 312) model];
            v85 = [v88 stringWithFormat:@" (%@)", v126];
          }
          v89 = [*(id *)(a1 + 304) name];
          v90 = [v32 domain];
          uint64_t v91 = [v32 code];
          *(_DWORD *)buf = 138545666;
          v171 = v149;
          __int16 v172 = 2114;
          v173 = v139;
          __int16 v174 = 2082;
          uint64_t v175 = v130;
          __int16 v176 = 2114;
          v177 = v86;
          __int16 v178 = 2114;
          uint64_t v179 = (uint64_t)v87;
          __int16 v180 = 2114;
          v181 = v85;
          __int16 v182 = 2114;
          v183 = v89;
          __int16 v184 = 2114;
          v185 = v90;
          __int16 v186 = 2048;
          uint64_t v187 = v91;
          __int16 v188 = 2112;
          id v189 = v32;
          _os_log_error_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed while querying for events in window %{public}@ doing additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x66u);

          if (v134)
          {
          }
          id v3 = (id)v146;
          long long v18 = (void *)v152;
        }

        LOBYTE(v34) = 1;
      }
      else
      {
        v151 = v18;
        if (v26 >= 2 && [v31 count] == v26 + 1)
        {
          __int16 v36 = v11;
          if ((unint64_t)[v31 count] < 2)
          {
            char v38 = 1;
          }
          else
          {
            uint64_t v37 = objc_msgSend(v31, "subarrayWithRange:", 0, objc_msgSend(v31, "count") - 1);

            char v38 = 1;
            v31 = (void *)v37;
          }
        }
        else
        {
          __int16 v36 = v11;
          char v38 = 0;
        }
        uint64_t v129 = [v31 count];
        v39 = objc_opt_new();
        uint64_t v145 = (uint64_t)v3;
        v148 = v39;
        if (v38)
        {
          __int16 v40 = [v31 lastObject];
          v41 = -[_DKSyncWindow startDate]((uint64_t)v151);
          -[_DKSyncWindow setStartDate:]((uint64_t)v39, v41);

          __int16 v42 = [v40 creationDate];
          -[_DKSyncWindow setEndDate:]((uint64_t)v39, v42);

          v43 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v135 = [(id)objc_opt_class() description];
            v142 = [NSNumber numberWithUnsignedInteger:v129];
            v140 = [v151 debugDescription];
            uint64_t v97 = [*(id *)(a1 + 304) transportType];
            v98 = "down from";
            if (v97 == 8) {
              v98 = "up to";
            }
            v124 = (__CFString *)v98;
            int v99 = [*(id *)(a1 + 312) me];
            v100 = &stru_1EDDE58B8;
            v101 = @"pseudo ";
            if (!v99) {
              v101 = &stru_1EDDE58B8;
            }
            uint64_t v122 = (uint64_t)v101;
            v102 = [*(id *)(a1 + 312) identifier];
            v126 = [*(id *)(a1 + 312) model];
            if (v126)
            {
              v113 = NSString;
              v120 = [*(id *)(a1 + 312) model];
              uint64_t v118 = (uint64_t)v120;
              v100 = [v113 stringWithFormat:@" (%@)"];
            }
            v114 = [*(id *)(a1 + 304) name];
            v115 = [v39 debugDescription];
            *(_DWORD *)buf = 138545410;
            v171 = v135;
            __int16 v172 = 2112;
            v173 = v142;
            __int16 v174 = 2114;
            uint64_t v175 = (uint64_t)v140;
            __int16 v176 = 2082;
            v177 = v124;
            __int16 v178 = 2114;
            uint64_t v179 = v122;
            __int16 v180 = 2114;
            v181 = v102;
            __int16 v182 = 2114;
            v183 = v100;
            __int16 v184 = 2114;
            v185 = v114;
            __int16 v186 = 2114;
            uint64_t v187 = (uint64_t)v115;
            _os_log_debug_impl(&dword_18ECEB000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in window %{public}@ for additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ but hit limit, fetch limited to window %{public}@", buf, 0x5Cu);

            if (v126)
            {
            }
            v39 = v148;
          }
        }
        else
        {
          __int16 v44 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            v136 = [(id)objc_opt_class() description];
            v142 = [NSNumber numberWithUnsignedInteger:v129];
            v141 = [v151 debugDescription];
            uint64_t v103 = [*(id *)(a1 + 304) transportType];
            v104 = "down from";
            if (v103 == 8) {
              v104 = "up to";
            }
            v126 = (__CFString *)v104;
            v105 = &stru_1EDDE58B8;
            if ([*(id *)(a1 + 312) me]) {
              v106 = @"pseudo ";
            }
            else {
              v106 = &stru_1EDDE58B8;
            }
            v107 = [*(id *)(a1 + 312) identifier];
            v108 = [*(id *)(a1 + 312) model];
            if (v108)
            {
              v116 = NSString;
              v124 = [*(id *)(a1 + 312) model];
              uint64_t v118 = (uint64_t)v124;
              v105 = [v116 stringWithFormat:@" (%@)"];
            }
            v117 = [*(id *)(a1 + 304) name];
            *(_DWORD *)buf = 138545154;
            v171 = v136;
            __int16 v172 = 2112;
            v173 = v142;
            __int16 v174 = 2114;
            uint64_t v175 = (uint64_t)v141;
            __int16 v176 = 2082;
            v177 = v126;
            __int16 v178 = 2114;
            uint64_t v179 = (uint64_t)v106;
            __int16 v180 = 2114;
            v181 = v107;
            __int16 v182 = 2114;
            v183 = v105;
            __int16 v184 = 2114;
            v185 = v117;
            _os_log_debug_impl(&dword_18ECEB000, v44, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in window %{public}@ for additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

            if (v108)
            {
            }
            v39 = v148;
          }

          v45 = -[_DKSyncWindow startDate]((uint64_t)v151);
          -[_DKSyncWindow setStartDate:]((uint64_t)v39, v45);

          __int16 v40 = -[_DKSyncType urgency]((uint64_t)v151);
          -[_DKSyncWindow setEndDate:]((uint64_t)v39, v40);
        }
        uint64_t v11 = v36;

        uint64_t v46 = [*(id *)(a1 + 312) sourceDeviceID];
        v47 = +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v46);

        v48 = [*(id *)(a1 + 304) name];
        v138 = v47;
        v49 = +[_DKSyncMetadataStorage eventFromFetchedWindow:windowStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, v39, v47, v48);

        v50 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
        if (v31) {
          v51 = (void *)[v31 mutableCopy];
        }
        else {
          v51 = objc_opt_new();
        }
        v52 = v51;
        unint64_t v53 = 0x1E4F1C000;
        [v51 addObject:v49];
        v133 = v52;
        if ([v31 count]
          || [*(id *)(a1 + 304) transportType] != 8
          || -[_DKSyncType forceSync](*(void *)(a1 + 328)))
        {
          v142 = v11;
          v54 = objc_opt_new();
          long long v165 = 0u;
          long long v166 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          id v55 = v52;
          uint64_t v56 = [v55 countByEnumeratingWithState:&v165 objects:v191 count:16];
          if (v56)
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v166;
            do
            {
              for (uint64_t i = 0; i != v57; ++i)
              {
                if (*(void *)v166 != v58) {
                  objc_enumerationMutation(v55);
                }
                v60 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                if (v60 != v49)
                {
                  v61 = [v60 stream];
                  v62 = [v61 name];

                  if (v62) {
                    [v54 addObject:v62];
                  }
                }
              }
              uint64_t v57 = [v55 countByEnumeratingWithState:&v165 objects:v191 count:16];
            }
            while (v57);
          }

          v63 = *(void **)(a1 + 320);
          uint64_t v64 = *(void *)(a1 + 328);
          v65 = [*(id *)(a1 + 360) lastSyncDate];
          uint64_t v66 = [v63 highPriorityForSyncUpWithSyncType:v64 lastSyncDate:v65];

          v67 = *(void **)(a1 + 304);
          uint64_t v156 = MEMORY[0x1E4F143A8];
          uint64_t v157 = 3221225472;
          uint64_t v158 = (uint64_t)__100___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditionsWithPreviousHighWaterMark___block_invoke;
          v159 = &unk_1E560FB90;
          uint64_t v160 = v31;
          id v161 = v54;
          uint64_t v162 = a1;
          uint64_t v163 = v148;
          uint64_t v164 = v129;
          id v68 = v54;
          id v69 = v55;
          v39 = v148;
          [v67 updateStorageWithAddedEvents:v69 deletedEventIDs:0 highPriority:v66 completion:&v156];

          int v34 = 0;
          uint64_t v11 = v142;
          v50 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
          unint64_t v53 = 0x1E4F1C000uLL;
        }
        else
        {
          int v34 = 1;
        }
        v70 = *(void **)(a1 + v50[121]);
        v190 = v39;
        v71 = [*(id *)(v53 + 2424) arrayWithObjects:&v190 count:1];
        uint64_t v72 = *(void *)(a1 + 312);
        v73 = [*(id *)(a1 + 304) name];
        uint64_t v155 = 0;
        [v70 saveSyncedDownWindows:v71 peer:v72 transportName:v73 error:&v155];
        id v32 = (id)v155;

        v74 = +[_CDLogging syncChannel];
        v75 = v74;
        if (v32)
        {
          v76 = v151;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v143 = [(id)objc_opt_class() description];
            v131 = [v148 debugDescription];
            uint64_t v92 = [*(id *)(a1 + 304) transportType];
            v93 = "down from";
            if (v92 == 8) {
              v93 = "up to";
            }
            v123 = v93;
            int v94 = [*(id *)(a1 + 312) me];
            v95 = @"pseudo ";
            if (!v94) {
              v95 = &stru_1EDDE58B8;
            }
            v121 = v95;
            v96 = [*(id *)(a1 + 312) identifier];
            v125 = [*(id *)(a1 + 312) model];
            if (v125)
            {
              v109 = NSString;
              v119 = [*(id *)(a1 + 312) model];
              v127 = [v109 stringWithFormat:@" (%@)", v119];
            }
            else
            {
              v127 = &stru_1EDDE58B8;
            }
            v110 = [*(id *)(a1 + 304) name];
            v111 = [v32 domain];
            uint64_t v112 = [v32 code];
            *(_DWORD *)buf = 138545666;
            v171 = v143;
            __int16 v172 = 2114;
            v173 = v131;
            __int16 v174 = 2082;
            uint64_t v175 = (uint64_t)v123;
            __int16 v176 = 2114;
            v177 = v121;
            __int16 v178 = 2114;
            uint64_t v179 = (uint64_t)v96;
            __int16 v180 = 2114;
            v181 = v127;
            __int16 v182 = 2114;
            v183 = v110;
            __int16 v184 = 2114;
            v185 = v111;
            __int16 v186 = 2048;
            uint64_t v187 = v112;
            __int16 v188 = 2112;
            id v189 = v32;
            _os_log_error_impl(&dword_18ECEB000, v75, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving additions window %{public}@ doing additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x66u);

            if (v125)
            {
            }
            v76 = v151;
          }

          v75 = [(id)a1 errors];
          [v75 addObject:v32];
        }
        else
        {
          v76 = v151;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
            -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:](a1, (int)v148, (int)v75, v77, v78, v79, v80, v81, v118, v119, (uint64_t)v120, v122, (uint64_t)v124, (uint64_t)v126, v129, (uint64_t)v133, (uint64_t)v138, (uint64_t)v142, v145,
          }
              (uint64_t)v148,
              (uint64_t)v151,
              v154,
              v155,
              v156,
              v157,
              v158,
              (uint64_t)v159,
              v160,
              (uint64_t)v161,
              v162,
              v163,
              v164);
        }

        if (!v32)
        {
          id v3 = (id)v145;
          id v12 = (id)v154;
          if (!v34) {
            goto LABEL_55;
          }
          goto LABEL_54;
        }
        id v3 = (id)v145;
      }
      id v12 = (id)v154;
      v82 = [(id)a1 errors];
      [v82 addObject:v32];

      if ((v34 & 1) == 0)
      {
LABEL_55:

        goto LABEL_56;
      }
    }
LABEL_54:
    [(id)a1 endOperation];
    goto LABEL_55;
  }
LABEL_56:
}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  id v11 = a2;
  self;
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_0 != -1) {
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_0, &__block_literal_global_51);
  }
  if (v11)
  {
    v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v5 = [v11 isEqualToDate:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0;
      int v7 = [MEMORY[0x1E4F1C9C8] date];
      if (a3 == 1) {
        int v8 = @"Rapport";
      }
      else {
        int v8 = @"Cloud";
      }
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);
    }
  }
  uint64_t v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0;
  int v10 = [MEMORY[0x1E4F1C9C8] date];
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpHistoryAdditionsOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (id)history
{
  if (result) {
    return objc_getProperty(result, a2, 360, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:(NSObject *)a3 orError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v5 = [(id)objc_opt_class() description];
  if ([*(id *)(a1 + 304) transportType] == 8) {
    uint64_t v6 = "up to";
  }
  else {
    uint64_t v6 = "down from";
  }
  int v7 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_15_0() me]) {
    int v8 = @"pseudo ";
  }
  else {
    int v8 = &stru_1EDDE58B8;
  }
  uint64_t v9 = [(id)OUTLINED_FUNCTION_15_0() identifier];
  int v10 = [(id)OUTLINED_FUNCTION_15_0() model];
  if (v10)
  {
    id v11 = NSString;
    [(id)OUTLINED_FUNCTION_15_0() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    int v7 = [v11 stringWithFormat:@" (%@)"];
  }
  id v12 = [*(id *)(a1 + 304) name];
  double v13 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_16_1();
  v17 = v6;
  __int16 v18 = 2114;
  uint64_t v19 = v8;
  __int16 v20 = 2114;
  int v21 = v9;
  __int16 v22 = 2114;
  int v23 = v7;
  __int16 v24 = 2114;
  unint64_t v25 = v12;
  __int16 v26 = 2114;
  unint64_t v27 = v13;
  __int16 v28 = 2048;
  uint64_t v29 = v14;
  __int16 v30 = 2112;
  v31 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Skipping additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x5Cu);

  if (v10)
  {
  }
}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a1 eventsCount:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  log = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v5 = [(id)objc_opt_class() description];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:0];
  int v7 = [a2 debugDescription];
  if ([*(id *)(a1 + 304) transportType] == 8) {
    int v8 = "up to";
  }
  else {
    int v8 = "down from";
  }
  uint64_t v9 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
  int v10 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_12_2() me]) {
    id v11 = @"pseudo ";
  }
  else {
    id v11 = &stru_1EDDE58B8;
  }
  id v12 = [(id)OUTLINED_FUNCTION_12_2() identifier];
  double v13 = [(id)OUTLINED_FUNCTION_12_2() model];
  if (v13)
  {
    uint64_t v14 = NSString;
    uint64_t v9 = [(id)OUTLINED_FUNCTION_12_2() model];
    int v10 = [v14 stringWithFormat:@" (%@)", v9, log];
  }
  double v15 = [*(id *)(a1 + 304) name];
  *(_DWORD *)buf = 138545154;
  __int16 v18 = v5;
  __int16 v19 = 2112;
  __int16 v20 = v6;
  __int16 v21 = 2114;
  __int16 v22 = v7;
  __int16 v23 = 2082;
  __int16 v24 = v8;
  __int16 v25 = 2114;
  __int16 v26 = v11;
  __int16 v27 = 2114;
  __int16 v28 = v12;
  __int16 v29 = 2114;
  __int16 v30 = v10;
  __int16 v31 = 2114;
  uint64_t v32 = v15;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Synced up %@ events and high water mark window in window %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

  if (v13)
  {
  }
}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a1 eventsCount:(void *)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v5 = [(id)objc_opt_class() description];
  uint64_t v6 = [a2 domain];
  int v7 = 138544130;
  int v8 = v5;
  __int16 v9 = 2114;
  int v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while updating storage: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
}

@end