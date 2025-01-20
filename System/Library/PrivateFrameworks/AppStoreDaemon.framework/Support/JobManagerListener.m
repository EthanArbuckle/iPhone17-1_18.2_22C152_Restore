@interface JobManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (JobManagerListener)init;
- (void)_handleLegacyNotifications:(id)a3;
- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)finishJobsWithIDs:(id)a3 replyBlock:(id)a4;
- (void)getJobsUsingReplyBlock:(id)a3;
- (void)getJobsWithIDs:(id)a3 usingReplyBlock:(id)a4;
- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)registerJobManagerWithOptions:(id)a3 replyBlock:(id)a4;
- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4;
@end

@implementation JobManagerListener

- (JobManagerListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)JobManagerListener;
  v2 = [(JobManagerListener *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.JobManagerListener", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMapTable weakToStrongObjectsMapTable];
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    progress = v2->_progress;
    v2->_progress = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_handleLegacyNotifications:" name:@"LegacyNotifications" object:0];
  }
  return v2;
}

- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033EF3C;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)finishJobsWithIDs:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033F298;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)getJobsUsingReplyBlock:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033F4D8;
  block[3] = &unk_1005221F0;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)getJobsWithIDs:(id)a3 usingReplyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033F724;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033FA3C;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)registerJobManagerWithOptions:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033FCB8;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033FFCC;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)_handleLegacyNotifications:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [a3 object];
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"identifier"];
        id v10 = [v8 objectForKeyedSubscript:@"kind"];
        if ([v10 isEqualToString:@"import"])
        {
          v40 = v9;
          id v11 = +[NSArray arrayWithObjects:&v40 count:1];
          id v12 = v11;
          if (self)
          {
            dispatchQueue = self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100341F34;
            v30 = &unk_1005218C0;
            v31 = self;
            id v32 = v11;
            dispatch_async(dispatchQueue, &block);
          }
        }
        else if ([v10 isEqualToString:@"state"])
        {
          id v12 = [v8 objectForKeyedSubscript:@"phase"];
          v38 = v9;
          id v39 = v12;
          id v14 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          id v15 = v14;
          if (self)
          {
            id v16 = self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100342570;
            v30 = &unk_1005218C0;
            v31 = self;
            id v32 = v14;
            dispatch_async(v16, &block);
          }
        }
        else if ([v10 isEqualToString:@"finish"])
        {
          v17 = [v8 objectForKeyedSubscript:@"phase"];
          v36 = v9;
          v37 = &off_10054C9A8;
          v18 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          sub_10034056C((uint64_t)self, v18);

          id v19 = v9;
          id v12 = v17;
          if (self)
          {
            v20 = self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100342034;
            v30 = &unk_1005212D8;
            v31 = self;
            id v32 = v19;
            id v33 = v12;
            dispatch_async(v20, &block);
          }
        }
        else
        {
          if (![v10 isEqualToString:@"progress"]) {
            goto LABEL_21;
          }
          id v12 = [v8 objectForKeyedSubscript:@"fraction"];
          v34 = v9;
          id v35 = v12;
          v21 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          sub_10034056C((uint64_t)self, v21);
        }
LABEL_21:
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v41 count:16];
    }
    while (v5);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.appstored.jobmanager")) {
    goto LABEL_5;
  }
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    id v8 = *(id *)&buf[4];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%@]: Treating %i as legacy client", buf, 0x12u);
  }
  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_5:
    id v9 = v5;
    id v10 = v9;
    if (self)
    {
      unsigned int v11 = [v9 processIdentifier];
      id v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v11;
        id v14 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@]: Got connection from pid: %i", buf, 0x12u);
      }
      id v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDJobManager];
      [v10 setExportedInterface:v15];
      [v10 setExportedObject:self];
      id v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDJobManagerClient];
      [v10 setRemoteObjectInterface:v16];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v10);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100341CD8;
      v25[3] = &unk_100521BA8;
      objc_copyWeak(&v26, &location);
      unsigned int v27 = v11;
      [v10 setInterruptionHandler:v25];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100341DC0;
      v31 = &unk_100521BD0;
      objc_copyWeak(&v32, &location);
      objc_copyWeak(&v33, &from);
      unsigned int v34 = v11;
      [v10 setInvalidationHandler:buf];
      [v10 resume];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    dispatchQueue = self->_dispatchQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100340E6C;
    v22[3] = &unk_1005218C0;
    id v23 = v10;
    long long v24 = self;
    dispatch_async(dispatchQueue, v22);

    BOOL v18 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      id v21 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: Connection denied for pid: %i for non entitled client", buf, 0x12u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end