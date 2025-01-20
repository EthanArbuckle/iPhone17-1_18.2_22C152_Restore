@interface CacheDeleteOperation
- (BOOL)clientSpecifiedTimeout;
- (BOOL)hasRootOnlyServices;
- (BOOL)measureElapsedTime;
- (BOOL)serviceIsRegistered:(id)a3;
- (BOOL)timeoutNotReached;
- (BOOL)validateDictionaryForXPC:(id)a3;
- (CDPurgeableResultCache)resultCache;
- (CacheDeleteAnalytics)analyticsReporter;
- (CacheDeleteOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (NSArray)servicesToTranslate;
- (NSArray)volumeNames;
- (NSArray)volumes;
- (NSDictionary)info;
- (NSDictionary)services;
- (NSMutableDictionary)result;
- (NSMutableDictionary)testFailures;
- (NSString)description;
- (OS_dispatch_queue)operation_queue;
- (OS_dispatch_queue)response_queue;
- (double)non_negative_time_remaining;
- (double)start_time;
- (double)timeout_seconds;
- (id)servicesForVolume:(id)a3;
- (int)urgency;
- (int)urgencyLimit;
- (void)_startOperation:(id)a3;
- (void)performBlockWithUrgency:(id)a3;
- (void)processTestFailures:(id)a3;
- (void)setAnalyticsReporter:(id)a3;
- (void)setInfo:(id)a3;
- (void)setMeasureElapsedTime:(BOOL)a3;
- (void)setOperation_queue:(id)a3;
- (void)setResponse_queue:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultCache:(id)a3;
- (void)setServices:(id)a3;
- (void)setStart_time:(double)a3;
- (void)setTestFailures:(id)a3;
- (void)setTimeout_seconds:(double)a3;
- (void)setVolumeNames:(id)a3;
- (void)setVolumes:(id)a3;
- (void)startOperation:(id)a3;
@end

@implementation CacheDeleteOperation

- (CacheDeleteAnalytics)analyticsReporter
{
  return self->_analyticsReporter;
}

- (NSDictionary)info
{
  return self->_info;
}

- (CDPurgeableResultCache)resultCache
{
  return self->_resultCache;
}

- (OS_dispatch_queue)response_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (NSDictionary)services
{
  return self->_services;
}

- (NSArray)volumeNames
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(CacheDeleteOperation *)self volumes];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(CacheDeleteOperation *)self volumes];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) mountPoint];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (NSArray)volumes
{
  return self->_volumes;
}

- (void)setServices:(id)a3
{
}

- (NSArray)servicesToTranslate
{
  return self->_servicesToTranslate;
}

- (CacheDeleteOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v129.receiver = self;
  v129.super_class = (Class)CacheDeleteOperation;
  v12 = [(CacheDeleteOperation *)&v129 init];
  if (!v12)
  {
LABEL_102:
    v22 = v12;
    goto LABEL_107;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_TIMEOUT"];
    long long v14 = evaluateNumberProperty();

    long long v15 = CDGetLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v137 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client specified timeout: %@", buf, 0xCu);
      }

      [v14 doubleValue];
      if (v17 > 600.0) {
        double v17 = 600.0;
      }
      char v18 = 1;
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v137) = 600;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client specified no timeout. Using : %d", buf, 8u);
      }

      char v18 = 0;
      double v17 = 600.0;
    }
    id v105 = a3;
    v106 = v14;
    v12->_timeout_seconds = v17;
    v12->_clientSpecifiedTimeout = v18;
    v12->_start_time = 0.0;
    servicesToTranslate = v12->_servicesToTranslate;
    v12->_servicesToTranslate = (NSArray *)&off_1000615A0;

    v24 = (NSMutableDictionary *)[v9 mutableCopy];
    v25 = v12->_result;
    v12->_result = v24;

    v26 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_MEASURE_ELAPSED_TIME"];
    v12->_measureElapsedTime = evaluateBoolProperty();

    id v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
    v107 = v12;
    if (v11 && [v11 count])
    {
      id v103 = v11;
      id v104 = v9;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v28 = v11;
      id v29 = [v28 countByEnumeratingWithState:&v125 objects:v135 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v126;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v126 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            if (([v33 validate] & 1) == 0)
            {
              v34 = CDGetLogHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                [v33 mountPoint];
                v36 = id v35 = v27;
                *(_DWORD *)buf = 138543362;
                id v137 = v36;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Volume became invalid: %{public}@", buf, 0xCu);

                id v27 = v35;
              }
            }
            if (([v27 containsObject:v33] & 1) == 0) {
              [v27 addObject:v33];
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v125 objects:v135 count:16];
        }
        while (v30);
      }

      if ([v27 count])
      {
        v37 = (NSArray *)v27;
        p_super = &v12->_volumes->super;
        v12->_volumes = v37;
LABEL_34:

        v41 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_MEASURE_ELAPSED_TIME"];
        v12->_measureElapsedTime = evaluateBoolProperty();

        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = +[NSString stringWithFormat:@"%s_%@_operation.%p", "com.apple.cache_delete", v43, v12];

        id v45 = v44;
        dispatch_queue_t v46 = dispatch_queue_create((const char *)[v45 UTF8String], 0);
        operation_queue = v12->_operation_queue;
        v12->_operation_queue = (OS_dispatch_queue *)v46;

        v48 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v48);
        v50 = +[NSString stringWithFormat:@"%s_%@_response.%p", "com.apple.cache_delete", v49, v12];

        id v101 = v50;
        dispatch_queue_t v51 = dispatch_queue_create((const char *)[v101 UTF8String], 0);
        response_queue = v12->_response_queue;
        v12->_response_queue = (OS_dispatch_queue *)v51;

        id v53 = [v10 mutableCopy];
        v108 = +[NSMutableSet set];
        long long v121 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        v54 = v12->_volumes;
        id v55 = [(NSArray *)v54 countByEnumeratingWithState:&v121 objects:v133 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v122;
          while (2)
          {
            for (j = 0; j != v56; j = (char *)j + 1)
            {
              if (*(void *)v122 != v57) {
                objc_enumerationMutation(v54);
              }
              if (![*(id *)(*((void *)&v121 + 1) + 8 * (void)j) isRoot])
              {

                long long v119 = 0u;
                long long v120 = 0u;
                long long v117 = 0u;
                long long v118 = 0u;
                v54 = (NSArray *)v53;
                id v59 = [(NSArray *)v54 countByEnumeratingWithState:&v117 objects:v132 count:16];
                if (v59)
                {
                  id v60 = v59;
                  uint64_t v61 = *(void *)v118;
                  while (2)
                  {
                    for (k = 0; k != v60; k = (char *)k + 1)
                    {
                      if (*(void *)v118 != v61) {
                        objc_enumerationMutation(v54);
                      }
                      uint64_t v63 = *(void *)(*((void *)&v117 + 1) + 8 * (void)k);
                      v64 = [v10 objectForKeyedSubscript:v63];
                      if ([v64 rootOnly])
                      {
                        if ((id)[(NSArray *)v12->_volumes count] != (id)1)
                        {
                          v12->_hasRootOnlyServices = 1;

                          goto LABEL_58;
                        }
                        [v108 addObject:v63];
                      }
                    }
                    id v60 = [(NSArray *)v54 countByEnumeratingWithState:&v117 objects:v132 count:16];
                    if (v60) {
                      continue;
                    }
                    break;
                  }
                }
                goto LABEL_58;
              }
            }
            id v56 = [(NSArray *)v54 countByEnumeratingWithState:&v121 objects:v133 count:16];
            if (v56) {
              continue;
            }
            break;
          }
        }
LABEL_58:

        v67 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_SERVICES"];
        if (v67)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v69 = CDGetLogHandle();
          v70 = v69;
          if (isKindOfClass)
          {
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v137 = v67;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "filtering for user specified services: %{public}@", buf, 0xCu);
            }

            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v70 = v53;
            id v71 = [v70 countByEnumeratingWithState:&v113 objects:v131 count:16];
            if (v71)
            {
              id v72 = v71;
              uint64_t v73 = *(void *)v114;
              do
              {
                for (m = 0; m != v72; m = (char *)m + 1)
                {
                  if (*(void *)v114 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  uint64_t v75 = *(void *)(*((void *)&v113 + 1) + 8 * (void)m);
                  if (([v67 containsObject:v75] & 1) == 0) {
                    [v108 addObject:v75];
                  }
                }
                id v72 = [v70 countByEnumeratingWithState:&v113 objects:v131 count:16];
              }
              while (v72);
            }
          }
          else if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v137 = v67;
            _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "unsupported type for CACHE_DELETE_SERVICES_KEY: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v76 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_QUOTA_EVENT"];
        v102 = v27;
        v99 = (void *)v76;
        if (v76 && (v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          unsigned int v78 = [v77 BOOLValue];
        }
        else {
          unsigned int v78 = 0;
        }
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id obj = v53;
        id v79 = v53;
        id v80 = [v79 countByEnumeratingWithState:&v109 objects:v130 count:16];
        if (v80)
        {
          id v81 = v80;
          uint64_t v82 = *(void *)v110;
          do
          {
            for (n = 0; n != v81; n = (char *)n + 1)
            {
              if (*(void *)v110 != v82) {
                objc_enumerationMutation(v79);
              }
              v84 = *(void **)(*((void *)&v109 + 1) + 8 * (void)n);
              v85 = [v10 objectForKeyedSubscript:v84];
              v86 = v85;
              if (v78 && [v85 noQuota])
              {
                id v87 = v10;
                v88 = CDGetLogHandle();
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v137 = v84;
                  _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "removing noQuota service %{public}@ for this quota event", buf, 0xCu);
                }

                [v108 addObject:v84];
                id v10 = v87;
              }
            }
            id v81 = [v79 countByEnumeratingWithState:&v109 objects:v130 count:16];
          }
          while (v81);
        }

        v89 = CDGetLogHandle();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v137 = v108;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "removing filtered services: %{public}@", buf, 0xCu);
        }

        v90 = [v108 allObjects];
        [v79 removeObjectsForKeys:v90];

        v12 = v107;
        objc_storeStrong((id *)&v107->_services, obj);
        objc_storeStrong((id *)&v107->_info, v105);
        v91 = [(NSDictionary *)v107->_info objectForKeyedSubscript:@"CACHE_DELETE_URGENCY"];
        objc_opt_class();
        id v11 = v103;
        id v9 = v104;
        if (objc_opt_isKindOfClass())
        {
          v92 = CDGetLogHandle();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v137 = v91;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "User specified CACHE_DELETE_URGENCY: %{public}@", buf, 0xCu);
          }
        }
        v93 = evaluateUrgency();
        v107->_urgency = [v93 intValue];

        v94 = [(NSDictionary *)v107->_info objectForKeyedSubscript:@"CACHE_DELETE_URGENCY_LIMIT"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v95 = CDGetLogHandle();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v137 = v94;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "User specified CACHE_DELETE_URGENCY_LIMIT: %{public}@", buf, 0xCu);
          }
        }
        v96 = evaluateUrgencyLimit();
        v107->_urgencyLimit = [v96 intValue];

        goto LABEL_102;
      }
      p_super = CDGetLogHandle();
      v66 = v106;
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v137 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Failing to create operation: no valid volumes! (%{public}@)", buf, 0xCu);
      }
      id v11 = v103;
      id v9 = v104;
    }
    else
    {
      v39 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
      p_super = +[CacheDeleteDaemonVolume volumeWithPath:v39];

      if ([p_super validate])
      {
        id v103 = v11;
        id v104 = v9;
        v134 = p_super;
        v40 = +[NSArray arrayWithObjects:&v134 count:1];
        [(CacheDeleteOperation *)v12 setVolumes:v40];

        goto LABEL_34;
      }
      v65 = CDGetLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v98 = [(NSMutableDictionary *)v12->_result objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
        *(_DWORD *)buf = 138543362;
        id v137 = v98;
        _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "CacheDeleteOperation unable to validate volume: %{public}@", buf, 0xCu);
      }
      v66 = v106;
    }

    v22 = 0;
    goto LABEL_107;
  }
  v19 = CDGetLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "info is not a dictionary!", buf, 2u);
  }

  uint64_t v20 = +[NSMutableDictionary dictionaryWithObject:@"Parameter error, info is not a dict" forKey:@"CACHE_DELETE_ERROR"];
  v21 = v12->_result;
  v12->_result = (NSMutableDictionary *)v20;

  v22 = 0;
LABEL_107:

  return v22;
}

- (void)startOperation:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__4;
  BOOL v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v5 = [(CacheDeleteOperation *)self operation_queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __39__CacheDeleteOperation_startOperation___block_invoke;
  v8[3] = &unk_10005D8F0;
  v8[4] = self;
  id v10 = v18;
  id v6 = v4;
  id v9 = v6;
  id v11 = &v12;
  dispatch_sync(v5, v8);

  id v7 = (void *)v13[5];
  if (v7) {
    objc_exception_throw(v7);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);
}

- (void)setResultCache:(id)a3
{
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (OS_dispatch_queue)operation_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

void __39__CacheDeleteOperation_startOperation___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __39__CacheDeleteOperation_startOperation___block_invoke_2;
  v8[3] = &unk_10005D8C8;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v9 = v6;
  [v3 _startOperation:v8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Finished operation without firing completion!", buf, 2u);
    }
  }
}

uint64_t __39__CacheDeleteOperation_startOperation___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_startOperation:(id)a3
{
}

- (BOOL)serviceIsRegistered:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteOperation *)self services];
  long long v6 = [v5 allKeys];
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (id)servicesForVolume:(id)a3
{
  if (([a3 isRoot] & 1) != 0
    || ![(CacheDeleteOperation *)self hasRootOnlyServices])
  {
    id v6 = [(CacheDeleteOperation *)self services];
  }
  else
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    id v5 = [(CacheDeleteOperation *)self services];
    id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned __int8 v7 = [(CacheDeleteOperation *)self services];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          long long v13 = [(CacheDeleteOperation *)self services];
          uint64_t v14 = [v13 objectForKeyedSubscript:v12];

          if (([v14 rootOnly] & 1) == 0) {
            [v6 setObject:v14 forKeyedSubscript:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (void)performBlockWithUrgency:(id)a3
{
  id v6 = (uint64_t (**)(id, void))a3;
  uint64_t v4 = [(CacheDeleteOperation *)self urgency];
  if ((int)v4 <= [(CacheDeleteOperation *)self urgencyLimit])
  {
    do
    {
      if ((v6[2](v6, v4) & 1) == 0) {
        break;
      }
      BOOL v5 = (int)v4 < [(CacheDeleteOperation *)self urgencyLimit];
      uint64_t v4 = (v4 + 1);
    }
    while (v5);
  }
}

- (void)processTestFailures:(id)a3
{
  id v4 = a3;
  if (qword_10006A870 != -1) {
    dispatch_once(&qword_10006A870, &__block_literal_global_5);
  }
  BOOL v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "processTestFailures: %@", buf, 0xCu);
  }

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = _MergedGlobals_13;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __44__CacheDeleteOperation_processTestFailures___block_invoke_56;
    v8[3] = &unk_10005CAE8;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(v6, v8);
    unsigned __int8 v7 = v9;
  }
  else
  {
    unsigned __int8 v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "processTestFailures parameter error, failures: %@", buf, 0xCu);
    }
  }
}

void __44__CacheDeleteOperation_processTestFailures___block_invoke(id a1)
{
  _MergedGlobals_13 = (uint64_t)dispatch_queue_create("com.apple.cache_deleteoperation_test_failures", 0);
  _objc_release_x1();
}

void __44__CacheDeleteOperation_processTestFailures___block_invoke_56(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v4 = 138412546;
    long long v17 = v4;
    do
    {
      unsigned __int8 v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v7);
        id v9 = CDGetLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          *(_DWORD *)buf = v17;
          uint64_t v23 = v8;
          __int16 v24 = 2112;
          v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "processTestFailures key: %@, val: %@", buf, 0x16u);
        }
        id v11 = [*(id *)(a1 + 40) testFailures];

        if (!v11)
        {
          id v12 = +[NSMutableDictionary dictionary];
          [*(id *)(a1 + 40) setTestFailures:v12];
        }
        long long v13 = objc_msgSend(*(id *)(a1 + 40), "testFailures", v17, (void)v18);
        uint64_t v14 = [v13 objectForKeyedSubscript:v8];

        if (!v14)
        {
          uint64_t v14 = +[NSMutableArray array];
          long long v15 = [*(id *)(a1 + 40) testFailures];
          [v15 setObject:v14 forKeyedSubscript:v8];
        }
        long long v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        [v14 addObject:v16];

        unsigned __int8 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }
}

- (BOOL)validateDictionaryForXPC:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  long long v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:&v11];
  id v5 = v11;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7;
  if (!v7)
  {
    id v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "validateDictionaryForXPC Invalid dictionary (%@): %@", buf, 0x16u);
    }
  }
  return v8;
}

- (double)non_negative_time_remaining
{
  uint64_t v3 = mach_absolute_time();
  double start_time = self->_start_time;
  double timeout_seconds = self->_timeout_seconds;
  if (start_time == 0.0) {
    return self->_timeout_seconds;
  }
  double v7 = ((double)v3 - start_time) * gTimebaseConversion / 1000000000.0;
  double result = 0.0;
  if (v7 < timeout_seconds) {
    return timeout_seconds - v7;
  }
  return result;
}

- (BOOL)timeoutNotReached
{
  [(CacheDeleteOperation *)self non_negative_time_remaining];
  return v2 > 0.0;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  long long v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:@"%@ <%p>: {\n", v4, self];

  [v5 appendString:@"\tVolumes: [\n"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [(CacheDeleteOperation *)self volumes];
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) mountPoint];
        id v12 = +[NSString stringWithFormat:@"\t\t%@\n", v11];
        [v5 appendString:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  [v5 appendString:@"\tServices: [\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = [(CacheDeleteOperation *)self services];
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = +[NSString stringWithFormat:@"\t\t%@\n", *(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
        [v5 appendString:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  [v5 appendString:@"\t]\n"];
  [v5 appendString:@"}\n"];
  return (NSString *)v5;
}

- (void)setInfo:(id)a3
{
}

- (NSMutableDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSMutableDictionary)testFailures
{
  return self->_testFailures;
}

- (void)setTestFailures:(id)a3
{
}

- (void)setVolumes:(id)a3
{
}

- (void)setVolumeNames:(id)a3
{
}

- (BOOL)hasRootOnlyServices
{
  return self->_hasRootOnlyServices;
}

- (int)urgencyLimit
{
  return self->_urgencyLimit;
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setOperation_queue:(id)a3
{
}

- (void)setResponse_queue:(id)a3
{
}

- (BOOL)measureElapsedTime
{
  return self->_measureElapsedTime;
}

- (void)setMeasureElapsedTime:(BOOL)a3
{
  self->_measureElapsedTime = a3;
}

- (double)start_time
{
  return self->_start_time;
}

- (void)setStart_time:(double)a3
{
  self->_double start_time = a3;
}

- (BOOL)clientSpecifiedTimeout
{
  return self->_clientSpecifiedTimeout;
}

- (double)timeout_seconds
{
  return self->_timeout_seconds;
}

- (void)setTimeout_seconds:(double)a3
{
  self->_double timeout_seconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_response_queue, 0);
  objc_storeStrong((id *)&self->_operation_queue, 0);
  objc_storeStrong((id *)&self->_servicesToTranslate, 0);
  objc_storeStrong((id *)&self->_volumeNames, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_testFailures, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_resultCache, 0);
}

@end