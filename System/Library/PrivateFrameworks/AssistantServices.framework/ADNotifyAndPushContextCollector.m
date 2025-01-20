@interface ADNotifyAndPushContextCollector
- (ADNotifyAndPushContextCollector)init;
- (BOOL)_hasCompletionForPID:(int)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_addCompletion:(id)a3 forPID:(int)a4;
- (void)_getContextForAppInfo:(id)a3 completion:(id)a4;
- (void)_invokeAllCompletionsWithError;
- (void)_invokeCompletionWithContext:(id)a3 forPID:(int)a4;
- (void)_setContext:(id)a3 forPID:(int)a4;
- (void)getContextForAppInfos:(id)a3 completion:(id)a4;
@end

@implementation ADNotifyAndPushContextCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionsByPID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_invokeAllCompletionsWithError
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_completionsByPID;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 136315394;
    long long v12 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = "-[ADNotifyAndPushContextCollector _invokeAllCompletionsWithError]";
          __int16 v19 = 2112;
          uint64_t v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Push context time out for pid %@", buf, 0x16u);
        }
        -[NSMutableDictionary objectForKey:](self->_completionsByPID, "objectForKey:", v9, v12, (void)v13);
        v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_completionsByPID removeAllObjects];
}

- (void)_invokeCompletionWithContext:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  completionsByPID = self->_completionsByPID;
  uint64_t v7 = +[NSNumber numberWithInt:v4];
  v8 = [(NSMutableDictionary *)completionsByPID objectForKey:v7];

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v11);
  }
  uint64_t v9 = self->_completionsByPID;
  v10 = +[NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)v9 removeObjectForKey:v10];
}

- (void)_addCompletion:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  completionsByPID = self->_completionsByPID;
  id v7 = objc_retainBlock(a3);
  id v6 = +[NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)completionsByPID setObject:v7 forKey:v6];
}

- (BOOL)_hasCompletionForPID:(int)a3
{
  completionsByPID = self->_completionsByPID;
  uint64_t v4 = +[NSNumber numberWithInt:*(void *)&a3];
  long long v5 = [(NSMutableDictionary *)completionsByPID objectForKey:v4];
  LOBYTE(completionsByPID) = v5 != 0;

  return (char)completionsByPID;
}

- (void)_getContextForAppInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = [v6 identifier];
  AFContextProviderNameForBundleId();
  id v9 = objc_claimAutoreleasedReturnValue();
  v10 = (const char *)[v9 UTF8String];

  int out_token = -1;
  if (v10 && !notify_register_check(v10, &out_token))
  {
    *(void *)buf = 0;
    uint32_t state = notify_get_state(out_token, (uint64_t *)buf);
    uint64_t v16 = *(void *)buf;
    notify_cancel(out_token);
    BOOL v11 = 0;
    if (!state && v16 == 1) {
      BOOL v11 = notify_post(v10) == 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  id v12 = [v6 pid];
  long long v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    long long v14 = "No";
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ADNotifyAndPushContextCollector _getContextForAppInfo:completion:]";
    if (v11) {
      long long v14 = "Getting";
    }
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    __int16 v21 = 2080;
    v22 = v10;
    __int16 v23 = 1024;
    int v24 = (int)v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %s push context for %s %d", buf, 0x26u);
  }
  if (v7)
  {
    if (v11) {
      [(ADNotifyAndPushContextCollector *)self _addCompletion:v7 forPID:v12];
    }
    else {
      v7[2](v7, 0);
    }
  }
}

- (void)_setContext:(id)a3 forPID:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F6558;
  block[3] = &unk_10050B7B8;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void)getContextForAppInfos:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F6634;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (ADNotifyAndPushContextCollector)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADNotifyAndPushContextCollector;
  v2 = [(ADNotifyAndPushContextCollector *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    completionsByPID = v2->_completionsByPID;
    v2->_completionsByPID = v6;
  }
  return v2;
}

@end