@interface AXSimpleAssetTaskManager
+ (id)sharedInstance;
- (AXSimpleAssetTaskManager)init;
- (NSMutableDictionary)taskQueues;
- (NSMutableSet)inflightTasks;
- (NSMutableSet)registeredTasks;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)taskCompletionWaitingQueue;
- (OS_dispatch_queue)taskDispatcherQueue;
- (id)_anonymousTaskForId:(id)a3 withArguments:(id)a4;
- (id)_getBootTime;
- (id)_taskQueueForTask:(Class)a3;
- (id)_tasksForNotification:(id)a3;
- (id)_tasksForTriggerType:(unint64_t)a3;
- (void)_dispatchTask:(id)a3 completion:(id)a4;
- (void)_handleNotification:(id)a3;
- (void)_handleXPCActivity:(id)a3 taskClass:(Class)a4;
- (void)handleFirstBoot:(BOOL)a3;
- (void)handleFirstUnlock;
- (void)invokeTaskById:(id)a3 arguments:(id)a4;
- (void)registerTask:(Class)a3;
- (void)setInflightTasks:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setRegisteredTasks:(id)a3;
- (void)setTaskCompletionWaitingQueue:(id)a3;
- (void)setTaskDispatcherQueue:(id)a3;
- (void)setTaskQueues:(id)a3;
- (void)start;
@end

@implementation AXSimpleAssetTaskManager

+ (id)sharedInstance
{
  if (qword_100027A70 != -1) {
    dispatch_once(&qword_100027A70, &stru_100020A18);
  }
  v2 = (void *)qword_100027A68;
  return v2;
}

- (AXSimpleAssetTaskManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)AXSimpleAssetTaskManager;
  v2 = [(AXSimpleAssetTaskManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    taskQueues = v2->_taskQueues;
    v2->_taskQueues = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableSet set];
    registeredTasks = v2->_registeredTasks;
    v2->_registeredTasks = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableSet set];
    inflightTasks = v2->_inflightTasks;
    v2->_inflightTasks = (NSMutableSet *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("simpleTaskDispatcher", v9);
    taskDispatcherQueue = v2->_taskDispatcherQueue;
    v2->_taskDispatcherQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("simpleTaskDispatcher_note", v12);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("simpleTaskDispatcher_completion", v15);
    taskCompletionWaitingQueue = v2->_taskCompletionWaitingQueue;
    v2->_taskCompletionWaitingQueue = (OS_dispatch_queue *)v16;
  }
  return v2;
}

- (void)start
{
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_10000966C;
  uint64_t v7 = &unk_100020A40;
  objc_copyWeak(&v8, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", notificationQueue, &v4);
  -[AXSimpleAssetTaskManager handleFirstBoot:](self, "handleFirstBoot:", 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)registerTask:(Class)a3
{
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(AXSimpleAssetTaskManager *)v4 registeredTasks];
  [v5 addObject:a3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  Class v15 = a3;
  v6 = [(objc_class *)a3 triggers];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    v14 = v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v10, "type", v14))
        {
          objc_initWeak(&location, v4);
          xpc_object_t v11 = XPC_ACTIVITY_CHECK_IN;
          id v12 = [v10 launchActivityId];
          dispatch_queue_t v13 = (const char *)[v12 UTF8String];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          v17[0] = sub_1000099F4;
          v17[1] = &unk_100020A68;
          objc_copyWeak(v18, &location);
          v17[2] = v4;
          v17[3] = v10;
          v18[1] = v15;
          xpc_activity_register(v13, v11, handler);

          objc_destroyWeak(v18);
          objc_destroyWeak(&location);
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);
}

- (void)handleFirstBoot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[AXAssetMetadataStore store];
  uint64_t v6 = kAXTTSResourceAssetType;
  id v7 = [v5 valueForKey:@"SystemBootTime" forAssetType:kAXTTSResourceAssetType];

  uint64_t v8 = [(AXSimpleAssetTaskManager *)self _getBootTime];
  if ([v8 isEqualToDate:v7]) {
    BOOL v9 = !v3;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    long long v20 = v8;
    dispatch_queue_t v10 = AXLogAssetDaemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing first boot tasks", buf, 2u);
    }

    xpc_object_t v11 = dispatch_group_create();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = [(AXSimpleAssetTaskManager *)self _tasksForTriggerType:2];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          dispatch_group_enter(v11);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100009E84;
          v21[3] = &unk_100020A90;
          long long v22 = v11;
          [(AXSimpleAssetTaskManager *)self _dispatchTask:v17 completion:v21];
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v18 = AXLogAssetDaemon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Finished first boot tasks", buf, 2u);
    }

    objc_super v19 = +[AXAssetMetadataStore store];
    uint64_t v8 = v20;
    [v19 setValue:v20 forKey:@"SystemBootTime" forAssetType:v6];
  }
}

- (void)handleFirstUnlock
{
  BOOL v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing first unlock tasks", buf, 2u);
  }

  v4 = dispatch_group_create();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(AXSimpleAssetTaskManager *)self _tasksForTriggerType:3];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        dispatch_group_enter(v4);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000A0A4;
        v12[3] = &unk_100020A90;
        id v13 = v4;
        [(AXSimpleAssetTaskManager *)self _dispatchTask:v10 completion:v12];

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  xpc_object_t v11 = AXLogAssetDaemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished first unlock tasks", buf, 2u);
  }
}

- (void)invokeTaskById:(id)a3 arguments:(id)a4
{
  uint64_t v5 = [(AXSimpleAssetTaskManager *)self _anonymousTaskForId:a3 withArguments:a4];
  if (v5) {
    [(AXSimpleAssetTaskManager *)self _dispatchTask:v5 completion:&stru_100020AB0];
  }
  _objc_release_x1();
}

- (void)_handleNotification:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = -[AXSimpleAssetTaskManager _tasksForNotification:](self, "_tasksForNotification:", a3, 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AXSimpleAssetTaskManager *)self _dispatchTask:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) completion:&stru_100020AD0];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_tasksForNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v23 = v5;
  id v25 = +[NSMutableSet set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = [(AXSimpleAssetTaskManager *)v5 registeredTasks];
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v7)
  {
    uint64_t v26 = *(void *)v35;
    id obj = v6;
    do
    {
      id v27 = v7;
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v10 = [v9 triggers];
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v31;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v10);
              }
              long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
              if ([v14 type] == (id)1)
              {
                long long v15 = [v14 notificationName];
                unsigned int v16 = [v4 isEqualToString:v15];

                if (v16)
                {
                  id v17 = [v14 copy];
                  int out_token = 0;
                  id v18 = [v14 notificationName];
                  notify_register_check((const char *)objc_msgSend(v18, "cStringUsingEncoding:", +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding")), &out_token);

                  uint64_t state64 = 0;
                  notify_get_state(out_token, &state64);
                  notify_cancel(out_token);
                  CFStringRef v38 = @"notifyArg";
                  objc_super v19 = +[NSNumber numberWithUnsignedLongLong:state64];
                  v39 = v19;
                  long long v20 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
                  [v17 setArguments:v20];

                  id v21 = [objc_alloc((Class)v9) initWithTrigger:v17];
                  [v25 addObject:v21];

                  goto LABEL_17;
                }
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      id v6 = obj;
      id v7 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v23);
  return v25;
}

- (id)_anonymousTaskForId:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v9 = [(AXSimpleAssetTaskManager *)v8 registeredTasks];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [v13 taskIdentifier];
        unsigned int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          unsigned int v16 = +[AXSimpleAssetTaskTrigger withAnonymousInvokation:v7];
          id v10 = [objc_alloc((Class)v13) initWithTrigger:v16];

          goto LABEL_11;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v8);
  return v10;
}

- (id)_tasksForTriggerType:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  long long v19 = v4;
  id v21 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(AXSimpleAssetTaskManager *)v4 registeredTasks];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    id obj = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = [v9 triggers];
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
              if ([v14 type] == (id)a3)
              {
                id v15 = objc_alloc((Class)v9);
                id v16 = [v14 copy];
                id v17 = [v15 initWithTrigger:v16];

                [v21 addObject:v17];
                goto LABEL_16;
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v5 = obj;
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v19);
  return v21;
}

- (void)_dispatchTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AXAssetsDaemon sharedInstance];
  long long v9 = [v8 activityTransactionManager];
  id v10 = [v6 description];
  [v9 simpleTaskStarted:v10];

  id v11 = [(AXSimpleAssetTaskManager *)self taskDispatcherQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAC8;
  block[3] = &unk_100020B20;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v11, block);
}

- (void)_handleXPCActivity:(id)a3 taskClass:(Class)a4
{
  id v6 = a3;
  id v7 = [[a4 alloc] initWithTrigger:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B38C;
  v9[3] = &unk_100020A90;
  id v10 = v7;
  id v8 = v7;
  [(AXSimpleAssetTaskManager *)self _dispatchTask:v8 completion:v9];
}

- (id)_taskQueueForTask:(Class)a3
{
  id v5 = [(objc_class *)a3 taskIdentifier];
  id v6 = [(objc_class *)a3 taskGroupIdentifier];

  if (v6)
  {
    uint64_t v7 = [(objc_class *)a3 taskGroupIdentifier];

    id v5 = (void *)v7;
  }
  id v8 = [(AXSimpleAssetTaskManager *)self taskQueues];
  long long v9 = [v8 objectForKey:v5];

  if (!v9)
  {
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v11 = v5;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 cStringUsingEncoding:4], v10);
    id v13 = [(AXSimpleAssetTaskManager *)self taskQueues];
    [v13 setObject:v12 forKeyedSubscript:v11];
  }
  long long v14 = [(AXSimpleAssetTaskManager *)self taskQueues];
  id v15 = [v14 objectForKeyedSubscript:v5];

  return v15;
}

- (id)_getBootTime
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  *(void *)uint64_t v7 = 0x1500000001;
  size_t v6 = 16;
  if (sysctl(v7, 2u, &v4, &v6, 0, 0) == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSDate dateWithTimeIntervalSince1970:(double)(int)v5 / 1000000.0 + (double)v4];
  }
  return v2;
}

- (NSMutableDictionary)taskQueues
{
  return self->_taskQueues;
}

- (void)setTaskQueues:(id)a3
{
}

- (NSMutableSet)registeredTasks
{
  return self->_registeredTasks;
}

- (void)setRegisteredTasks:(id)a3
{
}

- (NSMutableSet)inflightTasks
{
  return self->_inflightTasks;
}

- (void)setInflightTasks:(id)a3
{
}

- (OS_dispatch_queue)taskDispatcherQueue
{
  return self->_taskDispatcherQueue;
}

- (void)setTaskDispatcherQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)taskCompletionWaitingQueue
{
  return self->_taskCompletionWaitingQueue;
}

- (void)setTaskCompletionWaitingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCompletionWaitingQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_taskDispatcherQueue, 0);
  objc_storeStrong((id *)&self->_inflightTasks, 0);
  objc_storeStrong((id *)&self->_registeredTasks, 0);
  objc_storeStrong((id *)&self->_taskQueues, 0);
}

@end