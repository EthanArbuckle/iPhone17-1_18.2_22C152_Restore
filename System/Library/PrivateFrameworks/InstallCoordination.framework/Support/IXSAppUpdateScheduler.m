@interface IXSAppUpdateScheduler
+ (id)sharedInstance;
- (BOOL)_onQueue_scheduleUpdateRequestForTask:(id)a3 error:(id *)a4;
- (BOOL)scheduleUpdateInstallForCoordinatorUUID:(id)a3 error:(id *)a4;
- (BOOL)scheduledInstallIsRunning;
- (IXSAppUpdateScheduler)init;
- (NSArray)queuedInstalls;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)scheduleQueue;
- (id)_onQueue_dequeueInstallTask;
- (unint64_t)scheduledInstallCount;
- (void)_onQueue_enqueueInstallTask:(id)a3;
- (void)_onQueue_invokeInstallerForTask:(id)a3;
- (void)_onQueue_registerUpdateRequestForTask:(id)a3;
- (void)_onQueue_removeEnqueuedTask:(id)a3;
- (void)_scheduleNextTask;
- (void)removeUpdateRequestForCoordinatorUUID:(id)a3;
- (void)setQueuedInstalls:(id)a3;
- (void)setScheduledInstallCount:(unint64_t)a3;
- (void)setScheduledInstallIsRunning:(BOOL)a3;
@end

@implementation IXSAppUpdateScheduler

- (IXSAppUpdateScheduler)init
{
  v12.receiver = self;
  v12.super_class = (Class)IXSAppUpdateScheduler;
  v2 = [(IXSAppUpdateScheduler *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordination.appUpdateScheduler.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.installcoordination.appUpdateScheduler.schedule", v6);
    scheduleQueue = v2->_scheduleQueue;
    v2->_scheduleQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    queuedInstalls = v2->_queuedInstalls;
    v2->_queuedInstalls = (NSArray *)v9;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045150;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109F38 != -1) {
    dispatch_once(&qword_100109F38, block);
  }
  v2 = (void *)qword_100109F30;

  return v2;
}

- (BOOL)scheduledInstallIsRunning
{
  v3 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_scheduledInstallIsRunning;
}

- (void)setScheduledInstallIsRunning:(BOOL)a3
{
  v5 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_scheduledInstallIsRunning = a3;
}

- (void)_onQueue_enqueueInstallTask:(id)a3
{
  id v4 = a3;
  v5 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v8 = [(NSArray *)self->_queuedInstalls mutableCopy];
  [v8 addObject:v4];

  v6 = (NSArray *)[v8 copy];
  queuedInstalls = self->_queuedInstalls;
  self->_queuedInstalls = v6;
}

- (id)_onQueue_dequeueInstallTask
{
  v3 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ([(NSArray *)self->_queuedInstalls count])
  {
    id v4 = [(NSArray *)self->_queuedInstalls mutableCopy];
    v5 = [v4 lastObject];
    [v4 removeLastObject];
    v6 = (NSArray *)[v4 copy];
    queuedInstalls = self->_queuedInstalls;
    self->_queuedInstalls = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_onQueue_removeEnqueuedTask:(id)a3
{
  id v8 = a3;
  id v4 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  if ([(NSArray *)self->_queuedInstalls count])
  {
    id v5 = [(NSArray *)self->_queuedInstalls mutableCopy];
    [v5 removeObject:v8];
    v6 = (NSArray *)[v5 copy];
    queuedInstalls = self->_queuedInstalls;
    self->_queuedInstalls = v6;
  }
}

- (void)_onQueue_invokeInstallerForTask:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000455D8(v4);
  if (v6)
  {
    dispatch_queue_t v7 = +[IXSCoordinatorManager sharedInstance];
    id v8 = [v7 coordinatorForUUID:v6];

    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100045674;
      v10[3] = &unk_1000E8FA8;
      v10[4] = self;
      [v8 scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:v10];
    }
    else
    {
      uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        objc_super v12 = "-[IXSAppUpdateScheduler _onQueue_invokeInstallerForTask:]";
        __int16 v13 = 2112;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: No coordinator found for %@. Marking task as completed: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v12 = "-[IXSAppUpdateScheduler _onQueue_invokeInstallerForTask:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordinator uuid from app update task identifier: %@", buf, 0x16u);
    }
  }
}

- (void)_scheduleNextTask
{
  v3 = [(IXSAppUpdateScheduler *)self internalQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045704;
  v4[3] = &unk_1000E8FA8;
  v4[4] = self;
  sub_100066F24(v3, v4);
}

- (void)_onQueue_registerUpdateRequestForTask:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Registering opportunistic install for %@", buf, 0x16u);
  }

  dispatch_queue_t v7 = +[BGSystemTaskScheduler sharedScheduler];
  id v8 = [(IXSAppUpdateScheduler *)self scheduleQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000459BC;
  v10[3] = &unk_1000EA5F8;
  id v11 = v4;
  objc_super v12 = self;
  id v9 = v4;
  [v7 registerForTaskWithIdentifier:v9 usingQueue:v8 launchHandler:v10];
}

- (BOOL)_onQueue_scheduleUpdateRequestForTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(IXSAppUpdateScheduler *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[BGSystemTaskScheduler sharedScheduler];
  id v9 = [v8 taskRequestForIdentifier:v6];
  if (v9)
  {
    v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100092D00();
    }
    id v11 = 0;
    unsigned __int8 v12 = 1;
    goto LABEL_25;
  }
  v29 = a4;
  v10 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v6];
  [v10 setRequiresNetworkConnectivity:0];
  [v10 setRequiresExternalPower:0];
  [v10 setPriority:2];
  __int16 v13 = +[IXSCoordinatorManager sharedInstance];
  id v14 = sub_1000455D8(v6);
  __int16 v15 = [v13 coordinatorForUUID:v14];

  if (v15)
  {
    id v16 = [v15 identity];
    v17 = [v16 bundleID];
    id v31 = 0;
    BOOL v18 = sub_100038F14(v17, 15, &v31);
    id v19 = v31;

    if (v18)
    {
      v20 = [v19 objectForKeyedSubscript:@"TEST_MODE_BG_UPDATE_SCHEDULE_AFTER"];
      v21 = [v19 objectForKeyedSubscript:@"TEST_MODE_BG_UPDATE_SCHEDULE_BEFORE"];
      if (v20)
      {
        [v20 doubleValue];
        -[NSObject setScheduleAfter:](v10, "setScheduleAfter:");
      }
      if (v21)
      {
        [v21 doubleValue];
        -[NSObject setTrySchedulingBefore:](v10, "setTrySchedulingBefore:");
      }

      goto LABEL_14;
    }
  }
  else
  {
    id v19 = 0;
  }
  [v10 setRequiresUserInactivity:1];
LABEL_14:
  v22 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[IXSAppUpdateScheduler _onQueue_scheduleUpdateRequestForTask:error:]";
    __int16 v34 = 2112;
    v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Scheduling opportunistic install for %@", buf, 0x16u);
  }

  id v30 = 0;
  unsigned __int8 v12 = [v8 submitTaskRequest:v10 error:&v30];
  id v11 = v30;
  if (v12)
  {
    [(IXSAppUpdateScheduler *)self setScheduledInstallCount:(char *)[(IXSAppUpdateScheduler *)self scheduledInstallCount] + 1];
  }
  else
  {
    id v28 = v19;
    v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100092C50(v15, (uint64_t)v11, v23);
    }

    v24 = [v15 uniqueIdentifier];
    v26 = sub_10003DAE4((uint64_t)"-[IXSAppUpdateScheduler _onQueue_scheduleUpdateRequestForTask:error:]", 236, @"IXErrorDomain", 1uLL, v11, 0, @"Failed to submit background update request for %@", v25, (uint64_t)v24);

    if (v29)
    {
      id v11 = v26;
      id *v29 = v11;
    }
    else
    {
      id v11 = v26;
    }
    id v19 = v28;
  }

LABEL_25:
  return v12;
}

- (BOOL)scheduleUpdateInstallForCoordinatorUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100046220;
  v21 = sub_100046230;
  id v22 = 0;
  dispatch_queue_t v7 = [(IXSAppUpdateScheduler *)self internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100046238;
  v12[3] = &unk_1000EA620;
  id v8 = v6;
  id v13 = v8;
  id v14 = self;
  __int16 v15 = &v23;
  id v16 = &v17;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (void)removeUpdateRequestForCoordinatorUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppUpdateScheduler *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000464E8;
  v7[3] = &unk_1000E8E08;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)scheduleQueue
{
  return self->_scheduleQueue;
}

- (unint64_t)scheduledInstallCount
{
  return self->_scheduledInstallCount;
}

- (void)setScheduledInstallCount:(unint64_t)a3
{
  self->_scheduledInstallCount = a3;
}

- (NSArray)queuedInstalls
{
  return self->_queuedInstalls;
}

- (void)setQueuedInstalls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedInstalls, 0);
  objc_storeStrong((id *)&self->_scheduleQueue, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end