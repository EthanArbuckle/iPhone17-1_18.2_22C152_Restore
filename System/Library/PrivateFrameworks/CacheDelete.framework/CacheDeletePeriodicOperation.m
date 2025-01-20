@interface CacheDeletePeriodicOperation
- (CDPeriodicOperationResult)periodicResult;
- (CacheDeletePeriodicOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (void)_startOperation:(id)a3;
- (void)setPeriodicResult:(id)a3;
@end

@implementation CacheDeletePeriodicOperation

- (CacheDeletePeriodicOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v10 count])
  {
    v11 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

    if (!v11)
    {
      v12 = +[CacheDeleteDaemonVolume rootVolume];
      v33 = v12;
      uint64_t v13 = +[NSArray arrayWithObjects:&v33 count:1];

      id v10 = (id)v13;
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)CacheDeletePeriodicOperation;
  v14 = [(CacheDeleteOperation *)&v31 initWithInfo:v8 services:v9 volumes:v10];
  if (v14)
  {
    id v25 = v9;
    id v26 = v8;
    v15 = +[NSMutableDictionary dictionary];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v16 = [(CacheDeleteOperation *)v14 services];
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v20);
          v22 = [(CacheDeleteOperation *)v14 services];
          v23 = [v22 objectForKeyedSubscript:v21];

          if ([v23 doesPeriodic]) {
            [v15 setObject:v23 forKeyedSubscript:v21];
          }

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    [(CacheDeleteOperation *)v14 setServices:v15];
    id v9 = v25;
    id v8 = v26;
  }

  return v14;
}

- (void)_startOperation:(id)a3
{
  id v38 = a3;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  group = dispatch_group_create();
  v4 = [CDPeriodicOperationResult alloc];
  v5 = [(CacheDeleteOperation *)self volumeNames];
  v6 = [(CDPeriodicOperationResult *)v4 initWithVolumes:v5];
  [(CacheDeletePeriodicOperation *)self setPeriodicResult:v6];

  v7 = [(CacheDeleteOperation *)self info];
  v40 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];

  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__2;
  v75[4] = __Block_byref_object_dispose__2;
  id v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2;
  v73 = __Block_byref_object_dispose__2;
  id v74 = 0;
  if (v40)
  {
    id v8 = [v40 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_TIMEOUT"];
    id v9 = evaluateNumberProperty();
    id v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = 120;
    if (v10) {
      uint64_t v11 = (uint64_t)v10;
    }
  }
  else
  {
    uint64_t v11 = 30;
  }
  uint64_t v41 = v11;
  queue = dispatch_queue_create("com.apple.cache_delete_periodic_results", 0);
  v12 = [(CacheDeleteOperation *)self info];
  unsigned int v13 = [(CacheDeleteOperation *)self validateDictionaryForXPC:v12];

  if (v13)
  {
    v14 = [(CacheDeleteOperation *)self info];
    id v49 = [v14 mutableCopy];
  }
  else
  {
    id v49 = (id)objc_opt_new();
  }
  v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1, v38);
  [v49 setObject:v15 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  v16 = CDGetLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(CacheDeleteOperation *)self volumes];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Periodic Operation: Info %@ ", (uint8_t *)&buf, 0xCu);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = [(CacheDeleteOperation *)self volumes];
  id v44 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v66;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v66 != v43) {
          objc_enumerationMutation(obj);
        }
        v48 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v18 = CDGetLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v48;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Periodic Operation: volume %{public}@ ", (uint8_t *)&buf, 0xCu);
        }

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v19 = [(CacheDeleteOperation *)self services];
        id v20 = [v19 countByEnumeratingWithState:&v61 objects:v81 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v62;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v62 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
              v24 = [(CacheDeleteOperation *)self services];
              id v25 = [v24 objectForKeyedSubscript:v23];

              if ([v25 inFlight])
              {
                id v26 = CDGetLogHandle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v23;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Periodic Operation: Service %{public}@ is in flight, skipping", (uint8_t *)&buf, 0xCu);
                }
              }
              else
              {
                long long v27 = objc_alloc_init(CDPeriodicServiceRequestResult);
                [(CDServiceRequestResult *)v27 setServiceName:v23];
                [(CDServiceRequestResult *)v27 setUrgency:1];
                long long v28 = CDGetLogHandle();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v23;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Periodic Operation: Service %{public}@ ", (uint8_t *)&buf, 0xCu);
                }

                long long v29 = [(CacheDeleteOperation *)self servicesToTranslate];
                long long v30 = [v25 ID];
                [v29 containsObject:v30];

                objc_super v31 = [v48 mountPoint];
                v32 = mapVolume();
                [v49 setObject:v32 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

                dispatch_group_enter(group);
                *(void *)&long long buf = 0;
                *((void *)&buf + 1) = &buf;
                uint64_t v79 = 0x2020000000;
                char v80 = 0;
                id v33 = [v49 mutableCopy];
                v52[0] = _NSConcreteStackBlock;
                v52[1] = 3221225472;
                v52[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke;
                v52[3] = &unk_10005D810;
                p_long long buf = &buf;
                id v34 = v25;
                id v53 = v34;
                v54 = self;
                id v26 = v27;
                v55 = v26;
                v59 = v77;
                v56 = queue;
                v60 = v75;
                v57 = group;
                [v34 servicePeriodic:1 info:v33 replyBlock:v52];

                _Block_object_dispose(&buf, 8);
              }
            }
            id v20 = [v19 countByEnumeratingWithState:&v61 objects:v81 count:16];
          }
          while (v20);
        }

        dispatch_time_t v35 = dispatch_time(0, 1000000000 * v41);
        if (dispatch_group_wait(group, v35))
        {
          v36 = CDGetLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v41;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "timed out (%llu seconds) waiting for:", (uint8_t *)&buf, 0xCu);
          }

          v37 = [(CacheDeleteOperation *)self services];
          [v37 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_36;
          block[3] = &unk_10005CD00;
          block[4] = self;
          dispatch_sync(queue, block);
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
    }
    while (v44);
  }

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2_37;
  v50[3] = &unk_10005D878;
  v50[4] = self;
  v50[5] = v75;
  v50[6] = &v69;
  v50[7] = v77;
  dispatch_sync(queue, v50);
  if (v39) {
    v39[2](v39, v70[5]);
  }

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      unsigned int v13 = [*(id *)(a1 + 32) ID];
      *(_DWORD *)long long buf = 138543362;
      v24 = v13;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Periodic callback firing more than once for service %{public}@", buf, 0xCu);
    }
    v6 = [*(id *)(a1 + 32) ID];
    _CacheDeleteAbortWithMessage();
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    v7 = objc_msgSend(*(id *)(a1 + 40), "response_queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_18;
    block[3] = &unk_10005D7E8;
    id v16 = *(id *)(a1 + 48);
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 80);
    id v17 = v8;
    uint64_t v21 = v9;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 88);
    id v18 = v10;
    uint64_t v22 = v11;
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v14.i64[0];
    int8x16_t v19 = vextq_s8(v14, v14, 8uLL);
    id v20 = *(id *)(a1 + 64);
    dispatch_async(v7, block);

    v6 = v16;
  }
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_18(uint64_t a1)
{
  [*(id *)(a1 + 32) finish];
  v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(a1 + 32), "setReportedPurgedBytes:", objc_msgSend(v2, "unsignedLongLongValue"));
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v2 unsignedLongLongValue];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2;
  block[3] = &unk_10005CAE8;
  id v3 = *(NSObject **)(a1 + 48);
  void block[4] = *(void *)(a1 + 56);
  id v15 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
  v6 = *(NSObject **)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_3;
  v9[3] = &unk_10005D7C0;
  id v10 = v4;
  id v11 = v5;
  uint64_t v13 = *(void *)(a1 + 88);
  id v12 = *(id *)(a1 + 64);
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) periodicResult];
  [v2 addResult:*(void *)(a1 + 40)];
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 || *(void *)(a1 + 40))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v3 = +[NSMutableArray array];
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    v6 = &APFSContainerGetSpaceInfo_ptr;
    if (v2)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v8 = [*(id *)(a1 + 48) ID];
      uint64_t v9 = *(void *)(a1 + 32);
      v31[0] = v8;
      v31[1] = v9;
      id v10 = +[NSArray arrayWithObjects:v31 count:2];
      id v11 = [v10 componentsJoinedByString:@" : "];
      [v7 addObject:v11];
    }
    id v12 = *(void **)(a1 + 40);
    if (v12)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v12;
      id v13 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
            id v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            int8x16_t v19 = [*(id *)(a1 + 48) ID];
            v29[0] = v19;
            v29[1] = v17;
            id v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];
            v29[2] = v20;
            [v6[241] arrayWithObjects:v29 count:3];
            v22 = uint64_t v21 = v6;
            uint64_t v23 = [v22 componentsJoinedByString:@" : "];
            [v18 addObject:v23];

            v6 = v21;
            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v14);
      }
    }
  }
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_34(id a1, NSString *a2, CDService *a3, BOOL *a4)
{
  v5 = a2;
  if ([(CDService *)a3 inFlight])
  {
    v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\t%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_36(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) periodicResult];
  [v1 setTimedOut:1];
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2_37(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) periodicResult];
  [v2 finish];

  uint64_t v3 = [*(id *)(a1 + 32) analyticsReporter];
  uint64_t v4 = [*(id *)(a1 + 32) periodicResult];
  [v3 reportPeriodic:v4];

  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = 172;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%d, CacheDeletePeriodicOperation _startOperation service errors:", buf, 8u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v20;
      *(void *)&long long v8 = 138412290;
      long long v18 = v8;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
          id v13 = CDGetLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v18;
            uint64_t v26 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Service:Error - %@", buf, 0xCu);
          }

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }
  }
  CFStringRef v23 = @"CACHE_DELETE_AMOUNT";
  id v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v18, (void)v19);
  v24 = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (CDPeriodicOperationResult)periodicResult
{
  return self->_periodicResult;
}

- (void)setPeriodicResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end