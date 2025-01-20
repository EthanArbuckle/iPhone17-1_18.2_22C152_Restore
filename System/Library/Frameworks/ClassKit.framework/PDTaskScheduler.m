@interface PDTaskScheduler
- (NSMutableDictionary)tasks;
- (OS_dispatch_queue)schedulerQueue;
- (PDTaskScheduler)init;
- (void)createTaskSchedulerRegistration:(id)a3;
- (void)setSchedulerQueue:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation PDTaskScheduler

- (PDTaskScheduler)init
{
  v12.receiver = self;
  v12.super_class = (Class)PDTaskScheduler;
  v2 = [(PDTaskScheduler *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)sub_1000FA248(v2, @"scheduler");
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_10023E528 != -1) {
      dispatch_once(&qword_10023E528, &stru_1001F3388);
    }
    v6 = (id)qword_10023E520;
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);
    schedulerQueue = v3->_schedulerQueue;
    v3->_schedulerQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    tasks = v3->_tasks;
    v3->_tasks = v9;
  }
  return v3;
}

- (void)createTaskSchedulerRegistration:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isRepeating])
  {
    v5 = +[BGSystemTaskScheduler sharedScheduler];
    v6 = [v4 identifier];
    dispatch_queue_t v7 = [(PDTaskScheduler *)self schedulerQueue];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100063F58;
    v24 = &unk_1001F3340;
    v8 = &v25;
    id v25 = v4;
    v9 = &v21;
  }
  else
  {
    v5 = +[BGSystemTaskScheduler sharedScheduler];
    v6 = [v4 identifier];
    dispatch_queue_t v7 = [(PDTaskScheduler *)self schedulerQueue];
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100063F64;
    v19 = &unk_1001F3368;
    v8 = &v20;
    id v20 = v4;
    v9 = &v16;
  }
  unsigned int v10 = objc_msgSend(v5, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v6, v7, v9, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  CLSInitLog();
  v11 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    objc_super v12 = v11;
    uint64_t v13 = [v4 identifier];
    v14 = (void *)v13;
    CFStringRef v15 = @"unsuccessful";
    if (v10) {
      CFStringRef v15 = @"successful";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    CFStringRef v29 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Setting up task registration for '%@' %@", buf, 0x16u);
  }
}

- (NSMutableDictionary)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
}

- (OS_dispatch_queue)schedulerQueue
{
  return self->_schedulerQueue;
}

- (void)setSchedulerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerQueue, 0);

  objc_storeStrong((id *)&self->_tasks, 0);
}

@end