@interface SKGTaskAgent
+ (id)sharedAgent;
+ (void)initialize;
- (BOOL)start;
- (id)knowledgedQueue;
- (void)_runKnowledgeUpdatingWithJobContext:(id)a3 group:(id)a4 queue:(id)a5 deferBlock:(id)a6 progressBlock:(id)a7 checkpointBlock:(id)a8 completeBlock:(id)a9 cancelBlock:(id)a10;
- (void)_runKnowledgeUpdatingWithJobContext:(id)a3 group:(id)a4 queue:(id)a5 delegate:(id)a6;
- (void)_setup;
- (void)beginDebugActivity:(id)a3 event:(int64_t)a4 name:(const char *)a5 knowledgedQueue:(id)a6;
- (void)beginIndexingTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8;
- (void)beginInferenceTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8;
- (void)beginJournalingTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8;
- (void)beginReportTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 progressBlock:(id)a6 checkpointBlock:(id)a7 completeBlock:(id)a8 cancelBlock:(id)a9 deferBlock:(id)a10;
- (void)beginTaskWithName:(id)a3 knowledgeEvent:(int64_t)a4 logMessage:(id)a5 deviceUnlocked:(BOOL)a6 knowledgedQueue:(id)a7 progressBlock:(id)a8 checkpointBlock:(id)a9 completeBlock:(id)a10 cancelBlock:(id)a11 deferBlock:(id)a12;
- (void)beginUpdatesTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
- (void)setKnowledgedQueue:(id)a3;
@end

@implementation SKGTaskAgent

+ (id)sharedAgent
{
  return (id)qword_1000F90E0;
}

+ (void)initialize
{
  id v2 = [[SKGTaskAgent alloc] initMachServiceListenerWithName:@"com.apple.spotlightknowledged" enableConnectionLogging:0];
  v3 = (void *)qword_1000F90E0;
  qword_1000F90E0 = (uint64_t)v2;

  v4 = (void *)qword_1000F90E0;

  [v4 _setup];
}

- (BOOL)start
{
  [(SKGTaskAgent *)self startListener];
  v3 = [(SKGTaskAgent *)self knowledgedQueue];
  dispatch_activate(v3);

  return 1;
}

- (void)beginTaskWithName:(id)a3 knowledgeEvent:(int64_t)a4 logMessage:(id)a5 deviceUnlocked:(BOOL)a6 knowledgedQueue:(id)a7 progressBlock:(id)a8 checkpointBlock:(id)a9 completeBlock:(id)a10 cancelBlock:(id)a11 deferBlock:(id)a12
{
  BOOL v29 = a6;
  id v16 = a3;
  id v17 = a5;
  v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = (void (**)(void))a10;
  v22 = (uint64_t (**)(void))a11;
  v23 = (void (**)(void))a12;
  if ((v22[2](v22) & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      v28 = self;
      if (atomic_fetch_add(dword_1000F90E8, 1u))
      {
        v23[2](v23);
        atomic_fetch_add(dword_1000F90E8, 0xFFFFFFFF);
      }
      else
      {
        v25 = sub_10000FA24();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Performing task:%@", buf, 0xCu);
        }

        v27 = dispatch_group_create();
        if (a4 == 4)
        {
          v26 = +[SKGJobContext reindexJobContextWithDeviceUnlocked:v29];
          if ((_os_feature_enabled_impl() & 1) == 0) {
            [v26 setMaxItemCountPerJob:0x7FFFFFFFLL];
          }
        }
        else
        {
          v26 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:v29];
        }
        [v26 logEvent:a4 message:v17];
        [v26 setTaskName:v16];
        [(SKGTaskAgent *)v28 _runKnowledgeUpdatingWithJobContext:v26 group:v27 queue:v18 deferBlock:v23 progressBlock:v19 checkpointBlock:v20 completeBlock:v21 cancelBlock:v22];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10005CB30;
        block[3] = &unk_1000DA128;
        id v32 = v16;
        dispatch_group_notify(v27, v18, block);
      }
    }
    else
    {
      v21[2](v21);
    }
  }
}

- (void)beginJournalingTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8
{
}

- (void)beginUpdatesTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8
{
}

- (void)beginIndexingTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8
{
}

- (void)beginInferenceTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 completeBlock:(id)a6 cancelBlock:(id)a7 deferBlock:(id)a8
{
}

- (void)beginReportTaskWithName:(id)a3 deviceUnlocked:(BOOL)a4 knowledgedQueue:(id)a5 progressBlock:(id)a6 checkpointBlock:(id)a7 completeBlock:(id)a8 cancelBlock:(id)a9 deferBlock:(id)a10
{
}

- (void)beginDebugActivity:(id)a3 event:(int64_t)a4 name:(const char *)a5 knowledgedQueue:(id)a6
{
  v10 = (_xpc_activity_s *)a3;
  v11 = a6;
  if (xpc_activity_get_state(v10) == 2)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v13 = v10;
      xpc_activity_state_t v14 = 5;
      goto LABEL_6;
    }
    if (atomic_fetch_add(dword_1000F90E8, 1u))
    {
      atomic_fetch_add(dword_1000F90E8, 0xFFFFFFFF);
      v13 = v10;
      xpc_activity_state_t v14 = 3;
LABEL_6:
      xpc_activity_set_state(v13, v14);
      goto LABEL_7;
    }
    v15 = sub_10000FA24();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
    }

    xpc_activity_set_state(v10, 4);
    id v16 = dispatch_group_create();
    id v17 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:0];
    v18 = v17;
    switch(a4)
    {
      case 1:
        CFStringRef v19 = @"debug inferring people";
        uint64_t v20 = 1;
        break;
      case 6:
        CFStringRef v19 = @"debug reset";
        uint64_t v20 = 6;
        break;
      case 2:
        CFStringRef v19 = @"debug indexing people";
        uint64_t v20 = 2;
        break;
      default:
LABEL_17:
        [v18 logEvent:5 message:@"reporting"];
        [(SKGTaskAgent *)self _runKnowledgeUpdatingWithJobContext:v18 group:v16 queue:v11 delegate:0];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10005CF98;
        block[3] = &unk_1000DA128;
        v22 = v10;
        dispatch_group_notify(v16, v11, block);

        goto LABEL_7;
    }
    [v17 logEvent:v20 message:v19];
    goto LABEL_17;
  }
LABEL_7:
}

- (void)setKnowledgedQueue:(id)a3
{
}

- (id)knowledgedQueue
{
  return self->_knowledgedQueue;
}

- (void)_setup
{
  +[SDSignalHandler setDelegate:self memoryStatusFlags:55];
  +[SDSignalHandler setupHandlers];
  v3 = dispatch_queue_attr_make_initially_inactive(0);
  v4 = dispatch_queue_attr_make_with_overcommit();
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v7 = dispatch_queue_create("knowledge queue", v6);
  [(SKGTaskAgent *)self setKnowledgedQueue:v7];

  v8 = [(SKGTaskAgent *)self knowledgedQueue];
  v9 = sub_10000FA24();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = (const char *)[@"com.apple.corespotlight.knowledge.AB" UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  v10 = +[BGSystemTaskScheduler sharedScheduler];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10005DA80;
  v66[3] = &unk_1000DB590;
  v66[4] = self;
  id v11 = v8;
  id v67 = v11;
  [v10 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.AB" usingQueue:0 launchHandler:v66];

  v12 = sub_10000FA24();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (const char *)[@"com.apple.corespotlight.knowledge.journals.AB" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  xpc_activity_state_t v14 = +[BGSystemTaskScheduler sharedScheduler];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10005DF34;
  v64[3] = &unk_1000DB590;
  v64[4] = self;
  id v15 = v11;
  id v65 = v15;
  [v14 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.journals.AB" usingQueue:0 launchHandler:v64];

  id v16 = sub_10000FA24();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (const char *)[@"com.apple.corespotlight.knowledge.updates.AB" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  v18 = +[BGSystemTaskScheduler sharedScheduler];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10005E200;
  v62[3] = &unk_1000DB590;
  v62[4] = self;
  id v19 = v15;
  id v63 = v19;
  [v18 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.updates.AB" usingQueue:0 launchHandler:v62];

  uint64_t v20 = sub_10000FA24();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (const char *)[@"com.apple.corespotlight.knowledge.report" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Registering background task: %s", buf, 0xCu);
  }

  v22 = +[BGSystemTaskScheduler sharedScheduler];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10005E4CC;
  v60[3] = &unk_1000DB590;
  v60[4] = self;
  id v23 = v19;
  id v61 = v23;
  [v22 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.report" usingQueue:0 launchHandler:v60];

  v24 = sub_10000FA24();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (const char *)[@"com.apple.corespotlight.knowledge" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  v26 = +[BGSystemTaskScheduler sharedScheduler];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10005E9B0;
  v58[3] = &unk_1000DB590;
  v58[4] = self;
  id v27 = v23;
  id v59 = v27;
  [v26 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge" usingQueue:0 launchHandler:v58];

  v28 = sub_10000FA24();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v29 = (const char *)[@"com.apple.corespotlight.knowledge.journals" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  v30 = +[BGSystemTaskScheduler sharedScheduler];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10005EC7C;
  v56[3] = &unk_1000DB590;
  v56[4] = self;
  id v31 = v27;
  id v57 = v31;
  [v30 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.journals" usingQueue:0 launchHandler:v56];

  id v32 = sub_10000FA24();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (const char *)[@"com.apple.corespotlight.knowledge.updates" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  id v34 = +[BGSystemTaskScheduler sharedScheduler];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10005EF48;
  v54[3] = &unk_1000DB590;
  v54[4] = self;
  id v35 = v31;
  id v55 = v35;
  [v34 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.updates" usingQueue:0 launchHandler:v54];

  v36 = sub_10000FA24();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = (const char *)[@"com.apple.corespotlight.knowledge.inference" UTF8String];
    *(_DWORD *)buf = 136315138;
    v69 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Registering XPC task: %s", buf, 0xCu);
  }

  v38 = +[BGSystemTaskScheduler sharedScheduler];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10005F214;
  v52[3] = &unk_1000DB590;
  v52[4] = self;
  id v39 = v35;
  id v53 = v39;
  [v38 registerForTaskWithIdentifier:@"com.apple.corespotlight.knowledge.inference" usingQueue:0 launchHandler:v52];

  v40 = sub_10000FA24();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "com.apple.corespotlight.knowledge.debug.people";
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Registering Debug Update XPC activity:%s", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005F4E0;
  handler[3] = &unk_1000DB6B8;
  handler[4] = self;
  id v41 = v39;
  id v51 = v41;
  xpc_activity_register("com.apple.corespotlight.knowledge.debug.people", XPC_ACTIVITY_CHECK_IN, handler);
  v42 = sub_10000FA24();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "com.apple.corespotlight.knowledge.debug.inference";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Registering Debug Inference XPC activity:%s", buf, 0xCu);
  }

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10005F4FC;
  v48[3] = &unk_1000DB6B8;
  v48[4] = self;
  id v43 = v41;
  id v49 = v43;
  xpc_activity_register("com.apple.corespotlight.knowledge.debug.inference", XPC_ACTIVITY_CHECK_IN, v48);
  v44 = sub_10000FA24();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "com.apple.corespotlight.knowledge.debug.reset";
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Registering Debug Reset XPC activity:%s", buf, 0xCu);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10005F518;
  v46[3] = &unk_1000DB6B8;
  v46[4] = self;
  id v47 = v43;
  id v45 = v43;
  xpc_activity_register("com.apple.corespotlight.knowledge.debug.reset", XPC_ACTIVITY_CHECK_IN, v46);
}

- (void)didReceiveSignal:(unint64_t)a3
{
  v4 = sub_10000FA24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveSignal %ld", (uint8_t *)&v5, 0xCu);
  }

  if (a3 == 15) {
    exit(0);
  }
}

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  v4 = sub_10000FA24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveMemoryPressureNotification %llx", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_runKnowledgeUpdatingWithJobContext:(id)a3 group:(id)a4 queue:(id)a5 deferBlock:(id)a6 progressBlock:(id)a7 checkpointBlock:(id)a8 completeBlock:(id)a9 cancelBlock:(id)a10
{
}

- (void)_runKnowledgeUpdatingWithJobContext:(id)a3 group:(id)a4 queue:(id)a5 delegate:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F79C;
  block[3] = &unk_1000DB6E0;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v9 = v15;
  v10 = v14;
  id v11 = v13;
  dispatch_group_async(v10, (dispatch_queue_t)a5, block);
}

- (void).cxx_destruct
{
}

@end