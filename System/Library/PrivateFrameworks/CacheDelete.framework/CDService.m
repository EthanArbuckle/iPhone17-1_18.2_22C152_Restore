@interface CDService
+ (CDService)serviceWithInfo:(id)a3;
+ (CDService)serviceWithInfo:(id)a3 endpoint:(id)a4;
+ (CDService)serviceWithInfo:(id)a3 extension:(id)a4;
- (BOOL)_inFlight;
- (BOOL)doNotQuery;
- (BOOL)doesPeriodic;
- (BOOL)doesPurge;
- (BOOL)inFlight;
- (BOOL)noQuota;
- (BOOL)rootOnly;
- (CDService)initWithInfo:(id)a3;
- (NSArray)volUUIDs;
- (NSDictionary)notificationOptions;
- (NSMutableArray)purgeQueue;
- (NSSet)desiredNotifications;
- (NSString)ID;
- (NSString)description;
- (OS_dispatch_queue)requestQueue;
- (OS_dispatch_queue)serviceQueue;
- (id)serviceInterruptionHandler;
- (id)serviceInvalidationHandler;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePing:(id)a3;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)drainPurgeQueue;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)setDoNotQuery:(BOOL)a3;
- (void)setDoesPeriodic:(BOOL)a3;
- (void)setDoesPurge:(BOOL)a3;
- (void)setID:(id)a3;
- (void)setNoQuota:(BOOL)a3;
- (void)setNotificationOptions:(id)a3;
- (void)setPurgeQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setRootOnly:(BOOL)a3;
- (void)setServiceInterruptionHandler:(id)a3;
- (void)setServiceInvalidationHandler:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)set_inFlight:(BOOL)a3;
@end

@implementation CDService

- (BOOL)doNotQuery
{
  return self->_doNotQuery;
}

id __46__CDService_servicePurgeable_info_replyBlock___block_invoke_65(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

id __21__CDService_inFlight__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _inFlight];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void __46__CDService_servicePurgeable_info_replyBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) ID];
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ servicePurgeable returned", buf, 0xCu);
  }
  v4 = [*(id *)(a1 + 32) serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_65;
  block[3] = &unk_10005CD00;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

- (void)drainPurgeQueue
{
  v3 = [(CDService *)self serviceQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CDService *)self purgeQueue];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = [(CDService *)self purgeQueue];
    v7 = [v6 objectAtIndex:0];

    v8 = [v7 info];
    v9 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_QOS"];
    v10 = evaluateNumberProperty();

    v11 = [(CDService *)self purgeQueue];
    [v11 removeObjectAtIndex:0];

    if (v10) {
      dispatch_qos_class_t v12 = [v10 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v12 = QOS_CLASS_UTILITY;
    }
    v14 = CDGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(CDService *)self ID];
      *(_DWORD *)buf = 138412546;
      id v25 = v15;
      __int16 v26 = 1024;
      LODWORD(v27) = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "drainPurgeQueue %@ QOS: %u", buf, 0x12u);
    }
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = __28__CDService_drainPurgeQueue__block_invoke;
    v21 = &unk_10005CAE8;
    v22 = self;
    id v23 = v7;
    id v13 = v7;
    dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v12, 0, &v18);
    v17 = [(CDService *)self requestQueue];
    dispatch_async(v17, v16);

    goto LABEL_10;
  }
  v10 = CDGetLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CDService *)self ID];
    *(_DWORD *)buf = 138412546;
    id v25 = v13;
    __int16 v26 = 2048;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dequeuePurge %@ [%p] no purges queued", buf, 0x16u);
LABEL_10:
  }
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSMutableArray)purgeQueue
{
  return self->_purgeQueue;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)set_inFlight:(BOOL)a3
{
  self->__inFlight = a3;
}

- (BOOL)_inFlight
{
  return self->__inFlight;
}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(CDService *)self serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke;
  block[3] = &unk_10005CD00;
  block[4] = self;
  dispatch_sync(v10, block);

  v11 = [(CDService *)self requestQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_2;
  v14[3] = &unk_10005DCD0;
  int v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (BOOL)inFlight
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CDService *)self serviceQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __21__CDService_inFlight__block_invoke;
  v5[3] = &unk_10005CD78;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)doesPurge
{
  return self->_doesPurge;
}

id __46__CDService_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

- (BOOL)rootOnly
{
  return self->_rootOnly;
}

void __46__CDService_servicePurgeable_info_replyBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_3;
  v6[3] = &unk_10005DCA8;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 _servicePurgeable:v2 info:v4 replyBlock:v6];
}

- (CDService)initWithInfo:(id)a3
{
  uint64_t v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CDService;
  id v5 = [(CDService *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_ID"];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = (NSObject **)(v5 + 24);
      objc_storeStrong((id *)v5 + 3, v6);
      char v9 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_SERVICES"];
      v10 = CDGetLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *v8;
        *(_DWORD *)buf = 138412546;
        v42 = v11;
        __int16 v43 = 2112;
        v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ servicesProvided: %@", buf, 0x16u);
      }

      if (!v9)
      {
        *((_WORD *)v5 + 4) = 257;
        goto LABEL_11;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5[8] = [v9 containsObject:@"PERIODIC"];
        v5[9] = [v9 containsObject:@"PURGE"];
LABEL_11:
        id v12 = CDGetLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = *((void *)v5 + 3);
          v14 = "YES";
          if (!v5[9]) {
            v14 = "NO";
          }
          *(_DWORD *)buf = 138412546;
          v42 = v13;
          __int16 v43 = 2080;
          v44 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ doesPurge: %s", buf, 0x16u);
        }

        uint64_t v15 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUMES"];
        id v16 = (void *)*((void *)v5 + 2);
        *((void *)v5 + 2) = v15;

        int v17 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_OPT_OUT_QUOTA_EVENTS"];
        v5[12] = evaluateBoolProperty();

        if (v5[12])
        {
          v18 = CDGetLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *v8;
            *(_DWORD *)buf = 138412290;
            v42 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ is OPT_OUT_QUOTA_EVENTS service", buf, 0xCu);
          }
        }
        v20 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_DO_NOT_QUERY"];
        BOOL v21 = (evaluateBoolProperty() & 1) != 0 || v5[9] == 0;
        v5[10] = v21;

        if (v5[10])
        {
          v22 = CDGetLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = *v8;
            *(_DWORD *)buf = 138412290;
            v42 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ is DO_NOT_QUERY service", buf, 0xCu);
          }
        }
        v24 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_NOTIFICATIONS"];
        if (v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = +[NSMutableSet setWithArray:v24];
            __int16 v26 = (void *)*((void *)v5 + 6);
            *((void *)v5 + 6) = v25;

            v27 = CDGetLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = (const char *)*((void *)v5 + 6);
              *(_DWORD *)buf = 138412546;
              v42 = v7;
              __int16 v43 = 2112;
              v44 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ desiredNotifications: %@", buf, 0x16u);
            }
          }
        }
        dispatch_queue_t v29 = dispatch_queue_create((const char *)[*((id *)v5 + 3) UTF8String], 0);
        v30 = (void *)*((void *)v5 + 4);
        *((void *)v5 + 4) = v29;

        id v31 = [*((id *)v5 + 3) stringByAppendingString:@".request"];
        dispatch_queue_t v32 = dispatch_queue_create_with_target_V2((const char *)[v31 UTF8String], 0, *((dispatch_queue_t *)v5 + 4));
        v33 = (void *)*((void *)v5 + 5);
        *((void *)v5 + 5) = v32;

        uint64_t v34 = +[NSMutableArray array];
        v35 = (void *)*((void *)v5 + 10);
        *((void *)v5 + 10) = v34;

        goto LABEL_32;
      }
      v37 = CDGetLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v39 = *v8;
        *(_DWORD *)buf = 138412546;
        v42 = v39;
        __int16 v43 = 2112;
        v44 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@ : CACHE_DELETE_SERVICES value is not an array: %@", buf, 0x16u);
      }
    }
    else
    {
      id v7 = CDGetLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No Service ID! info dictionary: %@", buf, 0xCu);
      }
    }

    v36 = 0;
    goto LABEL_37;
  }
LABEL_32:
  v36 = v5;
LABEL_37:

  return v36;
}

void __28__CDService_drainPurgeQueue__block_invoke(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) ID];
    unsigned int v4 = [*(id *)(a1 + 40) urgency];
    id v5 = [*(id *)(a1 + 40) info];
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v3;
    __int16 v16 = 1024;
    unsigned int v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "dequeuePurge executing deferred purge for service %@ at urgency %d : %@", buf, 0x1Cu);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) urgency];
  uint64_t v8 = [*(id *)(a1 + 40) info];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __28__CDService_drainPurgeQueue__block_invoke_62;
  v11[3] = &unk_10005CA10;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  [v6 _servicePurge:v7 info:v8 replyBlock:v11];
}

id __28__CDService_drainPurgeQueue__block_invoke_62(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 reply];
  ((void (**)(void, id))v5)[2](v5, v4);

  uint64_t v6 = *(void **)(a1 + 40);
  return [v6 drainPurgeQueue];
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    v11 = [(CDService *)self serviceQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __42__CDService_servicePurge_info_replyBlock___block_invoke;
    v14[3] = &unk_10005DCD0;
    v14[4] = self;
    int v17 = a3;
    id v15 = v8;
    id v16 = v10;
    dispatch_sync(v11, v14);
  }
  else
  {
    id v12 = CDGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Parameter error: info: %@, reply: %@", buf, 0x16u);
    }
  }
}

void __42__CDService_servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) ID];
    int v4 = *(_DWORD *)(a1 + 56);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v63 = v3;
    __int16 v64 = 2048;
    v65 = v5;
    __int16 v66 = 1024;
    *(_DWORD *)v67 = v4;
    *(_WORD *)&v67[4] = 2112;
    *(void *)&v67[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ [%p] queuing purge at urgency %d, info: %@", buf, 0x26u);
  }
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v52 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v8 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = [*(id *)(a1 + 32) purgeQueue];
  id v57 = [v9 countByEnumeratingWithState:&v58 objects:v70 count:16];
  signed int v10 = 0;
  if (v57)
  {
    uint64_t v56 = *(void *)v59;
    char v54 = 1;
    v53 = v9;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v59 != v56) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v13 = [v12 info];
        v14 = [v13 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

        id v15 = [v12 info];
        id v16 = [v15 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

        if (v14) {
          BOOL v17 = v7 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && [v7 isEqualToString:v14])
        {
          signed int v18 = [v12 urgency];
          signed int v10 = v18;
          signed int v19 = *(_DWORD *)(a1 + 56);
          if (v19 > v18
            || v19 == v18
            && (id v20 = [v52 unsignedLongLongValue], v20 > objc_msgSend(v16, "unsignedLongLongValue")))
          {
            id v21 = CDGetLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = [*(id *)(a1 + 32) ID];
              signed int v55 = v10;
              id v23 = v8;
              v24 = v7;
              uint64_t v25 = *(void **)(a1 + 32);
              id v26 = [v16 unsignedLongLongValue];
              *(_DWORD *)buf = 138413058;
              v63 = v22;
              __int16 v64 = 2048;
              v65 = v25;
              id v7 = v24;
              id v8 = v23;
              signed int v10 = v55;
              __int16 v66 = 1024;
              *(_DWORD *)v67 = v55;
              *(_WORD *)&v67[4] = 2048;
              *(void *)&v67[6] = v26;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ [%p] dropping purge of urgency %d, amount %llu", buf, 0x26u);

              id v9 = v53;
            }

            [v8 addObject:v12];
            v27 = [v12 reply];
            ((void (**)(void, void *))v27)[2](v27, &__NSDictionary0__struct);
          }
          else
          {
            char v54 = 0;
          }
        }
      }
      id v57 = [v9 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v57);
  }
  else
  {
    char v54 = 1;
  }

  v28 = [*(id *)(a1 + 32) purgeQueue];
  [v28 removeObjectsInArray:v8];

  if (v54)
  {
    dispatch_queue_t v29 = v8;
    v30 = [*(id *)(a1 + 32) purgeQueue];
    id v31 = (char *)[v30 count];

    if (v31)
    {
      id v31 = 0;
      do
      {
        dispatch_queue_t v32 = [*(id *)(a1 + 32) purgeQueue];
        v33 = [v32 objectAtIndexedSubscript:v31];
        signed int v34 = [v33 urgency];
        signed int v35 = *(_DWORD *)(a1 + 56);

        if (v34 >= v35) {
          break;
        }
        ++v31;
        v36 = [*(id *)(a1 + 32) purgeQueue];
        v37 = (char *)[v36 count];
      }
      while (v31 < v37);
    }
    v38 = CDGetLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [*(id *)(a1 + 32) ID];
      objc_super v40 = *(void **)(a1 + 32);
      int v41 = *(_DWORD *)(a1 + 56);
      id v42 = [v52 unsignedLongLongValue];
      *(_DWORD *)buf = 138413314;
      v63 = v39;
      __int16 v64 = 2048;
      v65 = v40;
      __int16 v66 = 1024;
      *(_DWORD *)v67 = v41;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v42;
      __int16 v68 = 2048;
      v69 = v31;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ [%p] is enqueueing a purge of urgency %d amount %llu at index %lu", buf, 0x30u);
    }
    __int16 v43 = [*(id *)(a1 + 32) purgeQueue];
    v44 = +[purgeOP purgeOpAtUrgency:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
    [v43 insertObject:v44 atIndex:v31];

    id v8 = v29;
    if (([*(id *)(a1 + 32) _inFlight] & 1) == 0)
    {
      v45 = CDGetLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [*(id *)(a1 + 32) ID];
        v47 = *(void **)(a1 + 32);
        v48 = [v47 purgeQueue];
        *(_DWORD *)buf = 138412802;
        v63 = v46;
        __int16 v64 = 2048;
        v65 = v47;
        __int16 v66 = 2112;
        *(void *)v67 = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%@ [%p] is NOT inFlight, draining the purge queue: %@", buf, 0x20u);
      }
      [*(id *)(a1 + 32) drainPurgeQueue];
    }
  }
  else
  {
    v49 = CDGetLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [*(id *)(a1 + 32) ID];
      v51 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v63 = v50;
      __int16 v64 = 2048;
      v65 = v51;
      __int16 v66 = 1024;
      *(_DWORD *)v67 = v10;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%@ [%p] not purging, it has a pending purge (urgency=%d) enqueued already, skipping", buf, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  signed int v10 = [(CDService *)self requestQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke;
  v13[3] = &unk_10005DCD0;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __45__CDService_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke_2;
  v6[3] = &unk_10005DCA8;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 _servicePeriodic:v2 info:v4 replyBlock:v6];
}

void __45__CDService_servicePeriodic_info_replyBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke_3;
  block[3] = &unk_10005CD00;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id __45__CDService_servicePeriodic_info_replyBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

- (void)serviceCancelPurge:(id)a3
{
  id v4 = a3;
  id v5 = [(CDService *)self requestQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __32__CDService_serviceCancelPurge___block_invoke;
  v7[3] = &unk_10005D1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __32__CDService_serviceCancelPurge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceCancelPurge:*(void *)(a1 + 40)];
}

- (void)servicePing:(id)a3
{
  id v4 = a3;
  id v5 = [(CDService *)self requestQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __25__CDService_servicePing___block_invoke;
  v7[3] = &unk_10005D1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __25__CDService_servicePing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _servicePing:*(void *)(a1 + 40)];
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDService *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__CDService_serviceNotify_replyBlock___block_invoke;
  block[3] = &unk_10005D148;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __38__CDService_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceNotify:*(void *)(a1 + 40) replyBlock:*(void *)(a1 + 48)];
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDService *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__CDService_serviceCallback_replyBlock___block_invoke;
  block[3] = &unk_10005D148;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __40__CDService_serviceCallback_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceCallback:*(void *)(a1 + 40) replyBlock:*(void *)(a1 + 48)];
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_serviceCancelPurge:(id)a3
{
}

- (void)_servicePing:(id)a3
{
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(CDService *)self ID];
  if ([(CDService *)self inFlight]) {
    id v7 = "YES";
  }
  else {
    id v7 = "NO";
  }
  id v8 = [(CDService *)self purgeQueue];
  id v9 = [v3 initWithFormat:@"<%@: %p (%@) = { inFlight=%s, purgeQueueLength=%d }>", v5, self, v6, v7, objc_msgSend(v8, "count")];

  return (NSString *)v9;
}

+ (CDService)serviceWithInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_SERVICE_IS_LOCAL"];
  int v5 = evaluateBoolProperty();

  id v6 = &off_10005C758;
  if (!v5) {
    id v6 = &off_10005C740;
  }
  id v7 = [objc_alloc(*v6) initWithInfo:v3];

  return (CDService *)v7;
}

+ (CDService)serviceWithInfo:(id)a3 endpoint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  id v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_ID"];

  if (!v7)
  {
    id v8 = +[NSString stringWithFormat:@"ANONYMOUS_%p", v5];
    [v6 setObject:v8 forKeyedSubscript:@"CACHE_DELETE_ID"];
  }
  id v9 = [[CDAnonymousXPCService alloc] initWithInfo:v6 endpoint:v5];

  return (CDService *)v9;
}

+ (CDService)serviceWithInfo:(id)a3 extension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CDAppExtensionService alloc] initWithInfo:v6 extension:v5];

  return (CDService *)v7;
}

- (NSArray)volUUIDs
{
  return self->_volUUIDs;
}

- (void)setID:(id)a3
{
}

- (BOOL)doesPeriodic
{
  return self->_doesPeriodic;
}

- (void)setDoesPeriodic:(BOOL)a3
{
  self->_doesPeriodic = a3;
}

- (void)setDoesPurge:(BOOL)a3
{
  self->_doesPurge = a3;
}

- (void)setDoNotQuery:(BOOL)a3
{
  self->_doNotQuery = a3;
}

- (void)setRootOnly:(BOOL)a3
{
  self->_rootOnly = a3;
}

- (void)setServiceQueue:(id)a3
{
}

- (void)setRequestQueue:(id)a3
{
}

- (NSSet)desiredNotifications
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)notificationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationOptions:(id)a3
{
}

- (BOOL)noQuota
{
  return self->_noQuota;
}

- (void)setNoQuota:(BOOL)a3
{
  self->_noQuota = a3;
}

- (id)serviceInvalidationHandler
{
  return self->_serviceInvalidationHandler;
}

- (void)setServiceInvalidationHandler:(id)a3
{
}

- (id)serviceInterruptionHandler
{
  return self->_serviceInterruptionHandler;
}

- (void)setServiceInterruptionHandler:(id)a3
{
}

- (void)setPurgeQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeQueue, 0);
  objc_storeStrong(&self->_serviceInterruptionHandler, 0);
  objc_storeStrong(&self->_serviceInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_notificationOptions, 0);
  objc_storeStrong((id *)&self->_desiredNotifications, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_volUUIDs, 0);
}

@end