@interface CacheDeletePurgeableOperation
- (BOOL)cancel;
- (CDPurgeableOperationResult)purgeableResult;
- (CacheDeletePurgeableOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (NSCountedSet)inflight;
- (OS_dispatch_queue)inflight_q;
- (id)copyInFlights;
- (int)purgeableUrgency;
- (void)_startOperation:(id)a3;
- (void)addInFlight:(id)a3;
- (void)cancelOperation;
- (void)performBlockWithUrgency:(id)a3;
- (void)removeInFlight:(id)a3;
- (void)setCancel:(BOOL)a3;
- (void)setInflight:(id)a3;
- (void)setInflight_q:(id)a3;
- (void)setPurgeableResult:(id)a3;
- (void)setPurgeableUrgency:(int)a3;
@end

@implementation CacheDeletePurgeableOperation

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_33(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v2 = +[NSMutableDictionary dictionary];
  [*(id *)(v1 + 32) finish];
  v3 = *(void **)(v1 + 40);
  if (v3)
  {
    v4 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    if (!v4
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ((unint64_t)[v4 longLongValue] & 0x8000000000000000) != 0)
    {
      v5 = CDGetLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(v1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v54 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returned an invalid CACHE_DELETE_AMOUNT, using zero", buf, 0xCu);
      }

      v4 = &off_1000616D8;
    }
    objc_msgSend(*(id *)(v1 + 32), "setReportedPurgeableBytes:", objc_msgSend(v4, "unsignedLongLongValue"));
    v51[0] = @"CACHE_DELETE_AMOUNT";
    v51[1] = @"CACHE_DELETE_VOLUME";
    v52[0] = v4;
    v7 = [*(id *)(v1 + 56) mountPoint];
    v52[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    [v2 addEntriesFromDictionary:v8];

    v9 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    v10 = evaluateStringProperty();

    v11 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
    v12 = evaluateStringProperty();

    if (v10) {
      [v2 setObject:v10 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    }
    if (v12) {
      [v2 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
    }
    v13 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];

    if (v13)
    {
      v14 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
      [v2 setObject:v14 forKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
    }
    v15 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];

    if (v15)
    {
      v16 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
      [v2 setObject:v16 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
    }
    v17 = [*(id *)(v1 + 64) analyticsReporter];
    [v17 reportPurgeableTimingInfo:*(void *)(v1 + 32)];
  }
  else
  {
    v18 = CDGetLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(v1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ returned null result", buf, 0xCu);
    }

    v49[0] = @"CACHE_DELETE_AMOUNT";
    v49[1] = @"CACHE_DELETE_VOLUME";
    v50[0] = &off_1000616D8;
    v4 = [*(id *)(v1 + 56) mountPoint];
    v50[1] = v4;
    v10 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    [v2 addEntriesFromDictionary:v10];
  }

  v20 = +[NSNumber numberWithInt:*(unsigned int *)(v1 + 96)];
  [v2 setObject:v20 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  v39 = v2;
  [*(id *)(v1 + 72) updateRecentInfoForServiceID:*(void *)(v1 + 48) volume:*(void *)(v1 + 56) info:v2];
  v21 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_PURGEABLE"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    uint64_t v41 = *(void *)v45;
    v42 = v21;
    do
    {
      v25 = 0;
      id v43 = v23;
      do
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v25);
        if (([v26 isEqualToString:@"CACHE_DELETE_TOTAL_FSPURGEABLE"] & 1) == 0)
        {
          v27 = objc_opt_new();
          v28 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
          v29 = evaluateStringProperty();

          v30 = [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
          v31 = evaluateStringProperty();

          if (v29) {
            [v27 setObject:v29 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
          }
          uint64_t v32 = v1;
          if (v31) {
            [v27 setObject:v31 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
          }
          v33 = [v21 objectForKeyedSubscript:v26];
          v34 = evaluateNumberProperty();
          if (((unint64_t)[v34 longLongValue] & 0x8000000000000000) != 0)
          {
            v35 = &off_1000616D8;
          }
          else
          {
            v35 = [v21 objectForKeyedSubscript:v26];
          }

          uint64_t v1 = v32;
          v36 = +[NSNumber numberWithInt:*(unsigned int *)(v32 + 96)];
          [v27 setObject:v36 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

          [v27 setObject:v35 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
          v37 = [*(id *)(v32 + 56) mountPoint];
          [v27 setObject:v37 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

          [*(id *)(v32 + 72) updateRecentInfoForServiceID:v26 volume:*(void *)(v32 + 56) info:v27];
          v21 = v42;
          id v23 = v43;
          uint64_t v24 = v41;
        }
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v23);
  }
  if (([*(id *)(v1 + 80) timedOut] & 1) == 0)
  {
    v38 = [WeakRetained purgeableResult];
    [v38 addResult:*(void *)(v1 + 32)];

    [WeakRetained removeInFlight:*(void *)(v1 + 48)];
  }
}

- (void)removeInFlight:(id)a3
{
  id v4 = a3;
  v5 = [(CacheDeletePurgeableOperation *)self inflight_q];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__CacheDeletePurgeableOperation_removeInFlight___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)inflight_q
{
  return self->_inflight_q;
}

- (CDPurgeableOperationResult)purgeableResult
{
  return self->_purgeableResult;
}

void __45__CacheDeletePurgeableOperation_addInFlight___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inflight];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __48__CacheDeletePurgeableOperation_removeInFlight___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inflight];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (NSCountedSet)inflight
{
  return self->_inflight;
}

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  unint64_t v5 = *(void *)(a1 + 128);
  double v6 = gTimebaseConversion;
  v7 = CDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = v6 * ((double)v4 - (double)v5) / 1000000000.0;
    v9 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40)) {
      CFStringRef v10 = *(const __CFString **)(a1 + 40);
    }
    else {
      CFStringRef v10 = @"unknown";
    }
    v11 = [*(id *)(a1 + 48) mountPoint];
    v12 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    *(_DWORD *)buf = 138544386;
    v48 = v9;
    __int16 v49 = 2048;
    double v50 = v8;
    __int16 v51 = 2114;
    CFStringRef v52 = v10;
    __int16 v53 = 2114;
    uint64_t v54 = v11;
    __int16 v55 = 2114;
    v56 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ took %f seconds for Calling process: %{public}@, on volume: %{public}@, returned: %{public}@", buf, 0x34u);
  }
  uint64_t v31 = a1;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v3;
  id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v19 = CDGetLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v13 objectForKeyedSubscript:v18];
          *(_DWORD *)buf = 138543618;
          v48 = v18;
          __int16 v49 = 2114;
          double v50 = *(double *)&v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "\t%{public}@ : %{public}@", buf, 0x16u);
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v15);
  }

  uint64_t v21 = *(void *)(*(void *)(v31 + 112) + 8);
  if (*(unsigned char *)(v21 + 24))
  {
    id v22 = CDGetLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v29 = [*(id *)(v31 + 56) ID];
      *(_DWORD *)buf = 138543362;
      v48 = v29;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Purgeable callback firing more than once for service %{public}@", buf, 0xCu);
    }
    v30 = [*(id *)(v31 + 56) ID];
    _CacheDeleteAbortWithMessage();
  }
  else
  {
    *(unsigned char *)(v21 + 24) = 1;
    id v23 = *(NSObject **)(v31 + 64);
    uint64_t v24 = *(NSObject **)(v31 + 72);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_33;
    block[3] = &unk_10005DC08;
    objc_copyWeak(&v40, (id *)(v31 + 120));
    id v33 = *(id *)(v31 + 80);
    id v25 = v13;
    uint64_t v26 = *(void *)(v31 + 32);
    id v34 = v25;
    uint64_t v35 = v26;
    uint64_t v27 = *(void *)(v31 + 88);
    v28 = *(void **)(v31 + 96);
    uint64_t v36 = *(void *)(v31 + 48);
    uint64_t v37 = v27;
    int v41 = *(_DWORD *)(v31 + 136);
    id v38 = v28;
    id v39 = *(id *)(v31 + 104);
    dispatch_group_async(v23, v24, block);
    dispatch_group_leave(*(dispatch_group_t *)(v31 + 64));

    objc_destroyWeak(&v40);
  }
}

- (void)_startOperation:(id)a3
{
  v121 = (void (**)(id, id))a3;
  v136 = self;
  uint64_t v4 = [(CacheDeleteOperation *)self info];
  id v5 = [v4 mutableCopy];

  v137 = v5;
  double v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"];
  int v129 = evaluateBoolProperty();

  v7 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"];
  int v124 = evaluateBoolProperty();

  uint64_t v120 = mach_absolute_time();
  double v8 = [CDPurgeableOperationResult alloc];
  v9 = [(CacheDeleteOperation *)v136 volumeNames];
  CFStringRef v10 = [(CDPurgeableOperationResult *)v8 initWithVolumes:v9];
  [(CacheDeletePurgeableOperation *)v136 setPurgeableResult:v10];

  v139 = [(CacheDeleteOperation *)v136 resultCache];
  v11 = [(CacheDeleteOperation *)v136 info];
  v12 = [v11 objectForKeyedSubscript:@"CACHE_DELETE_CALLING_PROCESS"];
  evaluateStringProperty();
  v128 = (__CFString *)objc_claimAutoreleasedReturnValue();

  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id obj = [(CacheDeleteOperation *)v136 volumes];
  id v132 = [obj countByEnumeratingWithState:&v170 objects:v191 count:16];
  if (v132)
  {
    uint64_t v131 = *(void *)v171;
    CFStringRef v13 = @"unknown";
    if (v128) {
      CFStringRef v13 = v128;
    }
    CFStringRef v125 = v13;
    if (v129) {
      id v14 = "TRUE";
    }
    else {
      id v14 = "FALSE";
    }
    v127 = v14;
    if (v129) {
      int v15 = 30;
    }
    else {
      int v15 = 5;
    }
    int v123 = v15;
    uint64_t v16 = "NOT ";
    if (v129) {
      uint64_t v16 = "";
    }
    v122 = v16;
    uint64_t v17 = 5000000000;
    if (v129) {
      uint64_t v17 = 30000000000;
    }
    int64_t delta = v17;
LABEL_15:
    uint64_t v135 = 0;
    while (1)
    {
      if (*(void *)v171 != v131) {
        objc_enumerationMutation(obj);
      }
      v138 = *(void **)(*((void *)&v170 + 1) + 8 * v135);
      objc_msgSend(v137, "setObject:forKeyedSubscript:", 0, @"CACHE_DELETE_AMOUNT", v120);
      v18 = [v138 mountPoint];
      [v137 setObject:v18 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

      *(void *)v188 = 0;
      *(void *)&v188[8] = v188;
      *(void *)&v188[16] = 0x3032000000;
      v189 = __Block_byref_object_copy__6;
      *(void *)&long long v190 = __Block_byref_object_dispose__6;
      *((void *)&v190 + 1) = 0;
      dispatch_group_t v134 = dispatch_group_create();
      uint64_t v19 = CDGetLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v137 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_PATH"];
        evaluateStringProperty();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = [v138 mountPoint];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v182 = 116;
        *(_WORD *)&v182[4] = 2114;
        *(void *)&v182[6] = v21;
        *(_WORD *)&v182[14] = 2112;
        *(void *)&v182[16] = v22;
        __int16 v183 = 2114;
        v184 = v137;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%d PurgeableOperation _startOperation query path: %{public}@ for volume: %@, info: %{public}@", buf, 0x26u);
      }
      if (v138)
      {
        if (v129)
        {
          id v23 = [(CacheDeleteOperation *)v136 services];
          uint64_t v24 = [v23 allKeys];
          id v25 = +[NSSet setWithArray:v24];
          id v26 = [v25 mutableCopy];
          uint64_t v27 = *(void **)(*(void *)&v188[8] + 40);
          *(void *)(*(void *)&v188[8] + 40) = v26;

          v28 = *(void **)(*(void *)&v188[8] + 40);
          id v29 = [v139 copyPushingServices];
          [v28 minusSet:v29];

          log = CDGetLogHandle();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = *(void *)(*(void *)&v188[8] + 40);
            *(_DWORD *)buf = 138543362;
            *(void *)v182 = v30;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "NOT using cached purgeable values for %{public}@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v32 = +[NSNumber numberWithInt:[(CacheDeletePurgeableOperation *)v136 purgeableUrgency]];
          id v33 = [v139 copyInvalidServicesForVolume:v138 atUrgency:v32];
          id v34 = [v33 mutableCopy];
          uint64_t v35 = *(void **)(*(void *)&v188[8] + 40);
          *(void *)(*(void *)&v188[8] + 40) = v34;

          if (!*(void *)(*(void *)&v188[8] + 40))
          {
            uint64_t v36 = +[NSMutableSet set];
            uint64_t v37 = *(void **)(*(void *)&v188[8] + 40);
            *(void *)(*(void *)&v188[8] + 40) = v36;
          }
          id v38 = [(CacheDeleteOperation *)v136 services];
          id v39 = [v38 allKeys];
          log = +[NSMutableSet setWithArray:v39];

          [*(id *)(*(void *)&v188[8] + 40) intersectSet:log];
          id v40 = [(CacheDeleteOperation *)v136 resultCache];
          int v41 = objc_msgSend(v40, "recentInfoForVolume:atUrgency:", v138, -[CacheDeletePurgeableOperation purgeableUrgency](v136, "purgeableUrgency"));

          long long v168 = 0u;
          long long v169 = 0u;
          long long v166 = 0u;
          long long v167 = 0u;
          long long v42 = [(CacheDeleteOperation *)v136 services];
          id v43 = [v42 countByEnumeratingWithState:&v166 objects:v187 count:16];
          if (v43)
          {
            uint64_t v44 = *(void *)v167;
            do
            {
              for (i = 0; i != v43; i = (char *)i + 1)
              {
                if (*(void *)v167 != v44) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v46 = *(void *)(*((void *)&v166 + 1) + 8 * i);
                long long v47 = [v41 objectForKeyedSubscript:v46];
                if (v47)
                {
                }
                else
                {
                  id v48 = [v139 copyPushingServices];
                  unsigned __int8 v49 = [v48 containsObject:v46];

                  if ((v49 & 1) == 0) {
                    [*(id *)(*(void *)&v188[8] + 40) addObject:v46];
                  }
                }
              }
              id v43 = [v42 countByEnumeratingWithState:&v166 objects:v187 count:16];
            }
            while (v43);
          }
        }
        double v50 = CDGetLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v51 = [v138 mountPoint];
          id v52 = [*(id *)(*(void *)&v188[8] + 40) count];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v182 = 146;
          *(_WORD *)&v182[4] = 2114;
          *(void *)&v182[6] = v125;
          *(_WORD *)&v182[14] = 2082;
          *(void *)&v182[16] = v127;
          __int16 v183 = 2114;
          v184 = v51;
          __int16 v185 = 2048;
          id v186 = v52;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%d PurgeableOperation Calling process: %{public}@, refreshAll is %{public}s for volume: %{public}@, %lu servicesToQuery:", buf, 0x30u);
        }
        long long v164 = 0u;
        long long v165 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        id v53 = *(id *)(*(void *)&v188[8] + 40);
        id v54 = [v53 countByEnumeratingWithState:&v162 objects:v180 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v163;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(void *)v163 != v55) {
                objc_enumerationMutation(v53);
              }
              uint64_t v57 = *(void *)(*((void *)&v162 + 1) + 8 * (void)j);
              v58 = CDGetLogHandle();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v182 = 148;
                *(_WORD *)&v182[4] = 2114;
                *(void *)&v182[6] = v57;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%d PurgeableOperation will query: %{public}@", buf, 0x12u);
              }
            }
            id v54 = [v53 countByEnumeratingWithState:&v162 objects:v180 count:16];
          }
          while (v54);
        }

        if ([*(id *)(*(void *)&v188[8] + 40) count])
        {
          v59 = [CacheDeleteAsyncTimeoutFlag alloc];
          v60 = [(CacheDeleteOperation *)v136 response_queue];
          v61 = [(CacheDeleteAsyncTimeoutFlag *)v59 initWithQueue:v60];

          v155[0] = _NSConcreteStackBlock;
          v155[1] = 3221225472;
          v155[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke;
          v155[3] = &unk_10005DC58;
          v155[4] = v136;
          v161 = v188;
          v62 = v134;
          v156 = v62;
          id v63 = v137;
          id v157 = v63;
          v158 = v128;
          v159 = v138;
          uint64_t v31 = v61;
          v160 = v31;
          [(CacheDeletePurgeableOperation *)v136 performBlockWithUrgency:v155];
          dispatch_time_t v64 = dispatch_time(0, delta);
          intptr_t v65 = dispatch_group_wait(v62, v64);
          [v31 setTimedOut:1];
          if (v65)
          {
            id v66 = [(CacheDeletePurgeableOperation *)v136 copyInFlights];
            v67 = CDGetLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              v68 = self;
              v69 = [v68 volumeNames];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v182 = v123;
              *(_WORD *)&v182[4] = 2080;
              *(void *)&v182[6] = v122;
              *(_WORD *)&v182[14] = 2114;
              *(void *)&v182[16] = v69;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "dispatch_group_wait timed out after %d seconds, %srefreshing all services. Volumes: %{public}@, services in flight:", buf, 0x1Cu);
            }
            long long v153 = 0u;
            long long v154 = 0u;
            long long v151 = 0u;
            long long v152 = 0u;
            id v70 = v66;
            id v71 = [v70 countByEnumeratingWithState:&v151 objects:v179 count:16];
            if (v71)
            {
              uint64_t v72 = *(void *)v152;
              do
              {
                for (k = 0; k != v71; k = (char *)k + 1)
                {
                  if (*(void *)v152 != v72) {
                    objc_enumerationMutation(v70);
                  }
                  uint64_t v74 = *(void *)(*((void *)&v151 + 1) + 8 * (void)k);
                  v75 = CDGetLogHandle();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v182 = v74;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "dispatch_group_wait_timeout_leave, service inFlight: %{public}@", buf, 0xCu);
                  }
                }
                id v71 = [v70 countByEnumeratingWithState:&v151 objects:v179 count:16];
              }
              while (v71);
            }

            if (v70) {
              int v76 = v124;
            }
            else {
              int v76 = 0;
            }
            if (v76 == 1) {
              [v63 setObject:v70 forKeyedSubscript:@"CACHE_DELETE_SERVICES_INFLIGHT"];
            }
          }
        }
        else
        {
          uint64_t v31 = CDGetLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v77 = [(CacheDeleteOperation *)v136 volumeNames];
            *(_DWORD *)buf = 138543618;
            *(void *)v182 = v77;
            *(_WORD *)&v182[8] = 2080;
            *(void *)&v182[10] = v127;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] no servicesToQuery. refreshAll: %s", buf, 0x16u);
          }
        }
      }
      else
      {
        uint64_t v31 = CDGetLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v182 = v137;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid volume parameter, info: %{public}@", buf, 0xCu);
        }
      }

      _Block_object_dispose(v188, 8);
      if (!v138) {
        break;
      }
      if ((id)++v135 == v132)
      {
        id v132 = [obj countByEnumeratingWithState:&v170 objects:v191 count:16];
        if (v132) {
          goto LABEL_15;
        }
        goto LABEL_76;
      }
    }
  }
  else
  {
LABEL_76:

    v78 = [(CacheDeletePurgeableOperation *)v136 purgeableResult];
    [v78 finish];

    v79 = [(CacheDeleteOperation *)v136 analyticsReporter];
    v80 = [(CacheDeletePurgeableOperation *)v136 purgeableResult];
    [v79 reportPurgeable:v80];

    if (v124)
    {
      v81 = +[NSMutableDictionary dictionary];
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v140 = [(CacheDeletePurgeableOperation *)v136 copyInFlights];
      id v82 = [v140 countByEnumeratingWithState:&v147 objects:v178 count:16];
      if (v82)
      {
        uint64_t v83 = *(void *)v148;
        do
        {
          for (m = 0; m != v82; m = (char *)m + 1)
          {
            if (*(void *)v148 != v83) {
              objc_enumerationMutation(v140);
            }
            uint64_t v85 = *(void *)(*((void *)&v147 + 1) + 8 * (void)m);
            v177[0] = &off_1000616D8;
            v176[0] = @"Reported";
            v176[1] = @"Duration";
            v86 = +[NSNumber numberWithDouble:nan("")];
            v176[2] = @"inFlight";
            v177[1] = v86;
            v177[2] = &__kCFBooleanTrue;
            v87 = +[NSDictionary dictionaryWithObjects:v177 forKeys:v176 count:3];

            v175 = v87;
            v88 = +[NSArray arrayWithObjects:&v175 count:1];
            [v81 setObject:v88 forKeyedSubscript:v85];
          }
          id v82 = [v140 countByEnumeratingWithState:&v147 objects:v178 count:16];
        }
        while (v82);
      }

      v89 = [(CacheDeletePurgeableOperation *)v136 purgeableResult];
      v90 = [v89 results];
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_74;
      v145[3] = &unk_10005DC80;
      id v146 = v81;
      id v91 = v81;
      [v90 enumerateObjectsUsingBlock:v145];

      id v92 = [v91 copy];
      [v137 setObject:v92 forKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"];
    }
    double v93 = (double)v120;
    v94 = +[NSNumber numberWithDouble:gTimebaseConversion * ((double)mach_absolute_time() - (double)v120) / 1000000000.0];
    [v137 setObject:v94 forKeyedSubscript:@"CACHE_DELETE_ELAPSED_TIME"];

    if ([(CacheDeletePurgeableOperation *)v136 cancel]) {
      [v137 setObject:@"Operation Cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
    }
    v95 = [(CacheDeleteOperation *)v136 volumes];
    id v96 = (id)[(CacheDeleteOperation *)v136 urgency];
    v97 = [(CacheDeleteOperation *)v136 info];
    v98 = [v97 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    v99 = evaluateStringProperty();
    v100 = [v139 recentInfoForVolumes:v95 atUrgency:v96 validateResults:0 targetVolume:v99];
    [v137 addEntriesFromDictionary:v100];

    v101 = CDGetLogHandle();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      if (v128) {
        CFStringRef v102 = v128;
      }
      else {
        CFStringRef v102 = @"unknown caller";
      }
      v103 = [v137 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_PATH"];
      v104 = evaluateStringProperty();
      v105 = +[NSNumber numberWithInt:[(CacheDeleteOperation *)v136 urgency]];
      uint64_t v106 = mach_absolute_time();
      *(_DWORD *)v188 = 138544130;
      *(void *)&v188[4] = v102;
      *(_WORD *)&v188[12] = 2112;
      *(void *)&v188[14] = v104;
      *(_WORD *)&v188[22] = 2112;
      v189 = v105;
      LOWORD(v190) = 2048;
      *(double *)((char *)&v190 + 2) = gTimebaseConversion * ((double)v106 - v93) / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "<<<PurgeableOperation Result (%{public}@, query path: %@, u: %@, ET: %f):", v188, 0x2Au);
    }
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v107 = v137;
    id v108 = [v107 countByEnumeratingWithState:&v141 objects:v174 count:16];
    if (v108)
    {
      uint64_t v109 = *(void *)v142;
      do
      {
        for (n = 0; n != v108; n = (char *)n + 1)
        {
          if (*(void *)v142 != v109) {
            objc_enumerationMutation(v107);
          }
          uint64_t v111 = *(void *)(*((void *)&v141 + 1) + 8 * (void)n);
          v112 = CDGetLogHandle();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            v113 = [v107 objectForKeyedSubscript:v111];
            *(_DWORD *)v188 = 138543618;
            *(void *)&v188[4] = v111;
            *(_WORD *)&v188[12] = 2114;
            *(void *)&v188[14] = v113;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", v188, 0x16u);
          }
        }
        id v108 = [v107 countByEnumeratingWithState:&v141 objects:v174 count:16];
      }
      while (v108);
    }

    v114 = CDGetLogHandle();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      v115 = [v107 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
      v116 = [(CacheDeleteOperation *)v136 info];
      uint64_t v117 = [v116 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
      v118 = (void *)v117;
      CFStringRef v119 = @"unknown";
      *(_DWORD *)v188 = 138543874;
      if (v128) {
        CFStringRef v119 = v128;
      }
      *(void *)&v188[4] = v115;
      *(_WORD *)&v188[12] = 2114;
      *(void *)&v188[14] = v117;
      *(_WORD *)&v188[22] = 2114;
      v189 = (uint64_t (*)(uint64_t, uint64_t))v119;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "PurgeableOperation Result>>> %{public}@ bytes on: \"%{public}@\". Calling process: %{public}@", v188, 0x20u);
    }
    id obj = [v107 copy];
    v121[2](v121, obj);
  }
}

uint64_t __49__CacheDeletePurgeableOperation__startOperation___block_invoke(uint64_t a1, unsigned int a2)
{
  unsigned int v27 = [*(id *)(a1 + 32) cancel];
  if ((v27 & 1) == 0)
  {
    id v3 = CDGetLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v25 = [*(id *)(a1 + 32) urgency];
      unsigned int v26 = [*(id *)(a1 + 32) urgencyLimit];
      *(void *)&long long buf = 0xA004000300;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v25;
      HIWORD(buf) = 1024;
      LODWORD(v51) = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%d self.urgency: %d, self.urgencyLimit: %d", (uint8_t *)&buf, 0x14u);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v31 = [v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v4);
          }
          uint64_t v6 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          v7 = fsPurgeableTypeForService();

          if (!v7)
          {
            if ([*(id *)(a1 + 32) cancel]) {
              goto LABEL_18;
            }
            double v8 = [*(id *)(a1 + 32) services];
            v9 = [v8 objectForKeyedSubscript:v6];

            if ([v9 inFlight])
            {
              CFStringRef v10 = CDGetLogHandle();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v6;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Service %{public}@ is still in-flight!", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
              [*(id *)(a1 + 32) addInFlight:v6];
              v28 = [*(id *)(a1 + 32) resultCache];
              objc_initWeak(&location, *(id *)(a1 + 32));
              v11 = objc_msgSend(*(id *)(a1 + 32), "response_queue");
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v51 = 0x2020000000;
              char v52 = 0;
              v12 = objc_alloc_init(CDPurgeableServiceRequestResult);
              [(CDServiceRequestResult *)v12 setUrgency:a2];
              [(CDServiceRequestResult *)v12 setServiceName:v6];
              CFStringRef v13 = [*(id *)(a1 + 32) servicesToTranslate];
              [v13 containsObject:v6];

              id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
              int v15 = mapVolume();
              [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

              uint64_t v16 = (void *)mach_absolute_time();
              id v17 = [*(id *)(a1 + 48) mutableCopy];
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472;
              v32[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_31;
              v32[3] = &unk_10005DC30;
              v43[1] = v16;
              v32[4] = v6;
              id v18 = *(id *)(a1 + 56);
              uint64_t v19 = *(void *)(a1 + 64);
              id v33 = v18;
              uint64_t v34 = v19;
              p_long long buf = &buf;
              id v20 = v9;
              id v35 = v20;
              id v36 = *(id *)(a1 + 40);
              id v21 = v11;
              id v37 = v21;
              objc_copyWeak(v43, &location);
              id v22 = v12;
              uint64_t v23 = *(void *)(a1 + 32);
              id v38 = v22;
              uint64_t v39 = v23;
              unsigned int v44 = a2;
              CFStringRef v10 = v28;
              id v40 = v10;
              id v41 = *(id *)(a1 + 72);
              [v20 servicePurgeable:a2 info:v17 replyBlock:v32];

              objc_destroyWeak(v43);
              _Block_object_dispose(&buf, 8);

              objc_destroyWeak(&location);
            }
          }
        }
        id v31 = [v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v31);
    }
LABEL_18:
  }
  return v27 ^ 1;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)addInFlight:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeletePurgeableOperation *)self inflight_q];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__CacheDeletePurgeableOperation_addInFlight___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setPurgeableResult:(id)a3
{
}

- (void)performBlockWithUrgency:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, void))a3 + 2))(v5, [(CacheDeletePurgeableOperation *)self purgeableUrgency]);
}

- (int)purgeableUrgency
{
  return self->_purgeableUrgency;
}

- (CacheDeletePurgeableOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CacheDeletePurgeableOperation;
  v9 = [(CacheDeleteOperation *)&v27 initWithInfo:v8 services:a4 volumes:a5];
  if (v9)
  {
    CFStringRef v10 = +[NSMutableDictionary dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = [(CacheDeleteOperation *)v9 services];
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        int v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v15);
          id v17 = [(CacheDeleteOperation *)v9 services];
          id v18 = [v17 objectForKeyedSubscript:v16];

          if ([v18 doesPurge] && (objc_msgSend(v18, "doNotQuery") & 1) == 0) {
            [v10 setObject:v18 forKeyedSubscript:v16];
          }

          int v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.cahce_delete.purgeable_inflight", 0);
    [(CacheDeletePurgeableOperation *)v9 setInflight_q:v19];

    id v20 = objc_opt_new();
    [(CacheDeletePurgeableOperation *)v9 setInflight:v20];

    [(CacheDeleteOperation *)v9 setServices:v10];
    id v21 = evaluatePurgeableUrgency();
    -[CacheDeletePurgeableOperation setPurgeableUrgency:](v9, "setPurgeableUrgency:", [v21 intValue]);
  }
  return v9;
}

- (void)setPurgeableUrgency:(int)a3
{
  self->_purgeableUrgency = a3;
}

- (void)setInflight_q:(id)a3
{
}

- (void)setInflight:(id)a3
{
}

- (void)cancelOperation
{
}

- (id)copyInFlights
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CFStringRef v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v3 = [(CacheDeletePurgeableOperation *)self inflight_q];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __46__CacheDeletePurgeableOperation_copyInFlights__block_invoke;
  v6[3] = &unk_10005CD78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__CacheDeletePurgeableOperation_copyInFlights__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inflight];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 serviceName];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 serviceName];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  v17[0] = @"Urgency";
  CFStringRef v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 urgency]);
  v18[0] = v10;
  v17[1] = @"Reported";
  v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 reportedPurgeableBytes]);
  v18[1] = v11;
  v17[2] = @"Duration";
  [v3 duration];
  id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v18[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  uint64_t v14 = *(void **)(a1 + 32);
  int v15 = [v3 serviceName];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];
  [v16 addObject:v13];
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflight, 0);
  objc_storeStrong((id *)&self->_inflight_q, 0);
  objc_storeStrong((id *)&self->_purgeableResult, 0);
}

@end