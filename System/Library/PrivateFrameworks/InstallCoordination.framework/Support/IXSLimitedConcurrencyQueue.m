@interface IXSLimitedConcurrencyQueue
+ (id)launchServicesQueue;
+ (id)uninstallConcurrencyQueue;
- (IXSLimitedConcurrencyQueue)initWithWidth:(unint64_t)a3;
- (NSMutableArray)identityQueue;
- (NSMutableDictionary)waitingOperations;
- (NSMutableSet)activeIdentities;
- (OS_dispatch_queue)internalQueue;
- (unint64_t)width;
- (void)_onQueue_deQueueIfNeeded;
- (void)_onQueue_runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5;
- (void)runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5;
@end

@implementation IXSLimitedConcurrencyQueue

+ (id)launchServicesQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000126B4;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109DE8 != -1) {
    dispatch_once(&qword_100109DE8, block);
  }
  v2 = (void *)qword_100109DE0;

  return v2;
}

+ (id)uninstallConcurrencyQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012798;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109DF8 != -1) {
    dispatch_once(&qword_100109DF8, block);
  }
  v2 = (void *)qword_100109DF0;

  return v2;
}

- (IXSLimitedConcurrencyQueue)initWithWidth:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)IXSLimitedConcurrencyQueue;
  v4 = [(IXSLimitedConcurrencyQueue *)&v16 init];
  v5 = v4;
  if (v4)
  {
    v4->_width = a3;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.installcoordinationd.LimitedConcurrencyQueue", v6);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
    waitingOperations = v5->_waitingOperations;
    v5->_waitingOperations = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableSet setWithCapacity:0];
    activeIdentities = v5->_activeIdentities;
    v5->_activeIdentities = (NSMutableSet *)v11;

    uint64_t v13 = +[NSMutableArray arrayWithCapacity:0];
    identityQueue = v5->_identityQueue;
    v5->_identityQueue = (NSMutableArray *)v13;
  }
  return v5;
}

- (void)runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IXSLimitedConcurrencyQueue *)self internalQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000129C4;
  v15[3] = &unk_1000E8FD0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_100066F24(v11, v15);
}

- (void)_onQueue_deQueueIfNeeded
{
  v3 = [(IXSLimitedConcurrencyQueue *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSLimitedConcurrencyQueue *)self waitingOperations];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = [(IXSLimitedConcurrencyQueue *)self activeIdentities];
    id v7 = [v6 count];
    unint64_t v8 = [(IXSLimitedConcurrencyQueue *)self width];

    if ((unint64_t)v7 >= v8)
    {
      v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10008C700(self);
      }
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v9 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
      id v10 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v10)
      {
        id v12 = v10;
        uint64_t v13 = *(void *)v40;
        *(void *)&long long v11 = 136315394;
        long long v34 = v11;
LABEL_5:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          id v16 = [(IXSLimitedConcurrencyQueue *)self activeIdentities];
          unsigned int v17 = [v16 containsObject:v15];

          if (!v17) {
            break;
          }
          id v18 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            v44 = "-[IXSLimitedConcurrencyQueue _onQueue_deQueueIfNeeded]";
            __int16 v45 = 2112;
            v46 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s: Skipping dequeue for %@; work item already active for that identity",
              buf,
              0x16u);
          }

          if (v12 == (id)++v14)
          {
            id v12 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_13;
          }
        }
        v19 = v15;

        if (!v19) {
          goto LABEL_26;
        }
        v20 = [(IXSLimitedConcurrencyQueue *)self waitingOperations];
        v21 = [v20 objectForKeyedSubscript:v19];

        if (!v21)
        {
          v28 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10008C44C();
          }
          goto LABEL_39;
        }
        if (![v21 count])
        {
          v28 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10008C4CC();
          }
          goto LABEL_39;
        }
        v22 = [v21 objectAtIndex:0];
        [v21 removeObjectAtIndex:0];
        if ([v21 count])
        {
          v23 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
          id v24 = [v23 count];

          if (v24 == (id)1)
          {
LABEL_36:
            v31 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              sub_10008C54C((uint64_t)v19, v22);
            }

            v32 = [(IXSLimitedConcurrencyQueue *)self activeIdentities];
            [v32 addObject:v19];

            v33 = sub_10006703C();
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100012F14;
            v35[3] = &unk_1000E9140;
            id v36 = v22;
            v37 = self;
            v38 = v19;
            v28 = v22;
            sub_100066F24(v33, v35);

LABEL_39:
            goto LABEL_40;
          }
          v25 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_10008C680();
          }

          v26 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
          [v26 removeObject:v19];

          v27 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
          [v27 addObject:v19];
        }
        else
        {
          v29 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_10008C600();
          }

          v30 = [(IXSLimitedConcurrencyQueue *)self waitingOperations];
          [v30 removeObjectForKey:v19];

          v27 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
          [v27 removeObject:v19];
        }

        goto LABEL_36;
      }
LABEL_13:

LABEL_26:
      v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10008C3C8(v19);
      }
    }
  }
  else
  {
    v19 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10008C344(v19);
    }
  }
LABEL_40:
}

- (void)_onQueue_runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(IXSLimitedConcurrencyQueue *)self internalQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10008C870();
  }

  uint64_t v13 = [(IXSLimitedConcurrencyQueue *)self waitingOperations];
  uint64_t v14 = [v13 objectForKeyedSubscript:v8];

  if (!v14)
  {
    uint64_t v14 = +[NSMutableArray arrayWithCapacity:1];
    v15 = [(IXSLimitedConcurrencyQueue *)self waitingOperations];
    [v15 setObject:v14 forKeyedSubscript:v8];
  }
  id v16 = [[IXSLimitedConcurrencyOperation alloc] initWithBlock:v10 description:v9];

  [v14 addObject:v16];
  unsigned int v17 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
  unsigned __int8 v18 = [v17 containsObject:v8];

  if ((v18 & 1) == 0)
  {
    v19 = [(IXSLimitedConcurrencyQueue *)self identityQueue];
    [v19 addObject:v8];
  }
  [(IXSLimitedConcurrencyQueue *)self _onQueue_deQueueIfNeeded];
}

- (unint64_t)width
{
  return self->_width;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)waitingOperations
{
  return self->_waitingOperations;
}

- (NSMutableSet)activeIdentities
{
  return self->_activeIdentities;
}

- (NSMutableArray)identityQueue
{
  return self->_identityQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityQueue, 0);
  objc_storeStrong((id *)&self->_activeIdentities, 0);
  objc_storeStrong((id *)&self->_waitingOperations, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end