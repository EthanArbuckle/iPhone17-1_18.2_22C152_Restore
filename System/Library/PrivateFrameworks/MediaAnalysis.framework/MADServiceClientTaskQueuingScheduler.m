@interface MADServiceClientTaskQueuingScheduler
+ (unint64_t)scheduledRequestLimit;
- (BOOL)scheduleTask:(id)a3;
- (MADServiceClientTaskQueuingScheduler)initWithClientBundleID:(id)a3;
- (unint64_t)cancelAllTasks;
- (unint64_t)currentOutstandingTasks;
- (unint64_t)currentPendingTasks;
- (void)cancelTaskWithRequestID:(unint64_t)a3;
- (void)completeTaskWithInfo:(id)a3 madTaskID:(unint64_t)a4;
- (void)submitClientTask:(id)a3 withRequestID:(unint64_t)a4 schedulingErrorHandler:(id)a5;
@end

@implementation MADServiceClientTaskQueuingScheduler

- (MADServiceClientTaskQueuingScheduler)initWithClientBundleID:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADServiceClientTaskQueuingScheduler;
  v6 = [(MADServiceClientTaskQueuingScheduler *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientBundleID, a3);
    uint64_t v8 = +[NSMutableArray array];
    pendingTaskList = v7->_pendingTaskList;
    v7->_pendingTaskList = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    requestIDToScheduledTask = v7->_requestIDToScheduledTask;
    v7->_requestIDToScheduledTask = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MADServiceClientTaskQueuingScheduler.management", v12);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

+ (unint64_t)scheduledRequestLimit
{
  return 5;
}

- (void)completeTaskWithInfo:(id)a3 madTaskID:(unint64_t)a4
{
  id v6 = a3;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A90E4;
  block[3] = &unk_10021C1A0;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(managementQueue, block);
}

- (BOOL)scheduleTask:(id)a3
{
  id v4 = a3;
  requestIDToScheduledTask = self->_requestIDToScheduledTask;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 requestID]);
  v7 = [(NSMutableDictionary *)requestIDToScheduledTask objectForKeyedSubscript:v6];

  if (!v7)
  {
    objc_initWeak(&location, self);
    v54 = _NSConcreteStackBlock;
    uint64_t v55 = 3221225472;
    v56 = sub_1000A9A60;
    v57 = &unk_10021C698;
    v53 = &v59;
    objc_copyWeak(&v59, &location);
    id v23 = v4;
    id v58 = v23;
    v24 = objc_retainBlock(&v54);
    v25 = +[VCPMADTaskScheduler sharedInstance];
    v26 = [v23 task];
    id v27 = [v25 addForegroundTask:v26 withQoS:qos_class_self() completionHandler:v24];

    BOOL v22 = v27 != 0;
    if (v27)
    {
      v28 = +[NSNumber numberWithUnsignedInteger:v27];
      [v23 setScheduledTaskID:v28];

      v29 = self->_requestIDToScheduledTask;
      v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 requestID]);
      [(NSMutableDictionary *)v29 setObject:v23 forKeyedSubscript:v30];

      if ((int)MediaAnalysisLogLevel() < 5)
      {
LABEL_20:

        objc_destroyWeak(v53);
        objc_destroyWeak(&location);
        goto LABEL_21;
      }
      uint64_t v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[5];
      if (os_log_type_enabled((os_log_t)v31, v32))
      {
        v33 = [v23 task];
        v34 = (NSString *)(id)objc_opt_class();
        id v35 = [v23 requestID];
        v36 = [v23 scheduledTaskID];
        clientBundleID = self->_clientBundleID;
        *(_DWORD *)buf = 138413058;
        v62 = v34;
        __int16 v63 = 2048;
        id v64 = v35;
        __int16 v65 = 2112;
        id v66 = v36;
        __int16 v67 = 2112;
        v68 = clientBundleID;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v31, v32, "[QueuingScheduler] Scheduled foreground task %@ (MADRequestID %lu, VCPMADTaskID %@) for client %@", buf, 0x2Au);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v38 = VCPLogInstance();
        os_log_type_t v39 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v38, v39))
        {
          v40 = [v23 task];
          v41 = (NSString *)(id)objc_opt_class();
          id v42 = [v23 requestID];
          v43 = self->_clientBundleID;
          *(_DWORD *)buf = 138412802;
          v62 = v41;
          __int16 v63 = 2048;
          id v64 = v42;
          __int16 v65 = 2112;
          id v66 = v43;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "[QueuingScheduler] Failed to schedule foreground task %@ (MADRequestID %lu) for client %@", buf, 0x20u);
        }
      }
      v44 = [v23 schedulingErrorHandler];
      BOOL v45 = v44 == 0;

      if (v45) {
        goto LABEL_20;
      }
      uint64_t v31 = [v23 schedulingErrorHandler];
      NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
      v46 = [v23 task];
      uint64_t v47 = objc_opt_class();
      id v48 = [v23 requestID];
      v49 = +[NSString stringWithFormat:@"Failed to schedule foreground task %@ (MADRequestID %lu)", v47, v48, &v59, v54, v55, v56, v57];
      v70 = v49;
      v50 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v51 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v50];
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v51);
    }
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = self->_clientBundleID;
      id v11 = [v4 requestID];
      v12 = [v4 task];
      *(_DWORD *)buf = 138412802;
      v62 = v10;
      __int16 v63 = 2048;
      id v64 = v11;
      __int16 v65 = 2112;
      id v66 = (id)objc_opt_class();
      id v13 = v66;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[QueuingScheduler] Client %@ MADRequestID %lu already registered; abandon task %@",
        buf,
        0x20u);
    }
  }
  v14 = [v4 schedulingErrorHandler];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    objc_super v16 = [v4 schedulingErrorHandler];
    NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
    id v17 = [v4 requestID];
    v18 = [v4 task];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Client MADRequestID %lu already registered; abandon task %@",
      v17,
    v19 = objc_opt_class());
    v72 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v20];
    ((void (**)(void, void *))v16)[2](v16, v21);
  }
  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (void)submitClientTask:(id)a3 withRequestID:(unint64_t)a4 schedulingErrorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    managementQueue = self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A9D34;
    block[3] = &unk_10021C6C0;
    id v18 = v8;
    unint64_t v21 = a4;
    v19 = self;
    id v20 = v9;
    dispatch_sync(managementQueue, block);

    id v11 = v18;
LABEL_9:

    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v12, v13))
    {
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 134218242;
      unint64_t v25 = a4;
      __int16 v26 = 2112;
      id v27 = clientBundleID;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[QueuingScheduler] MADRequestID %lu registered an invalid task for client %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v11 = +[NSString stringWithFormat:@"MADRequestID %lu registered an invalid task", a4];
    id v23 = v11;
    BOOL v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_super v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v15];
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)cancelTaskWithRequestID:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000AA0EC;
  id v10 = sub_1000AA0FC;
  id v11 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AA104;
  block[3] = &unk_10021C6E8;
  void block[5] = &v6;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
  if (v7[5])
  {
    id v4 = +[VCPMADTaskScheduler sharedInstance];
    objc_msgSend(v4, "cancelTaskWithID:", objc_msgSend((id)v7[5], "unsignedIntegerValue"));
  }
  _Block_object_dispose(&v6, 8);
}

- (unint64_t)cancelAllTasks
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000AA0EC;
  unint64_t v21 = sub_1000AA0FC;
  id v22 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AA6F8;
  block[3] = &unk_10021C710;
  void block[4] = self;
  void block[5] = &v17;
  block[6] = &v23;
  dispatch_sync(managementQueue, block);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)v18[5];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v6);
        uint64_t v8 = +[VCPMADTaskScheduler sharedInstance];
        id v9 = [v7 scheduledTaskID];
        objc_msgSend(v8, "cancelTaskWithID:", objc_msgSend(v9, "unsignedIntegerValue"));

        ++v24[3];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v27 count:16];
    }
    while (v4);
  }

  unint64_t v10 = v24[3];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (unint64_t)currentPendingTasks
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  managementQueue = self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AA8C0;
  v5[3] = &unk_100219F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)currentOutstandingTasks
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  managementQueue = self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AA9A4;
  v5[3] = &unk_100219F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_requestIDToScheduledTask, 0);
  objc_storeStrong((id *)&self->_pendingTaskList, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end