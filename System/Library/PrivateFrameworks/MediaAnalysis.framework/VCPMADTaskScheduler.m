@interface VCPMADTaskScheduler
+ (id)qosArray;
+ (id)sharedInstance;
- (BOOL)validateTask:(id)a3;
- (VCPMADTaskScheduler)init;
- (unint64_t)addBackgroundTask:(id)a3 withQoS:(unsigned int)a4;
- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4;
- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4 completionHandler:(id)a5;
- (unint64_t)currentOutstandingTasks;
- (unsigned)validateQoS:(unsigned int)a3;
- (void)_checkBackgroundTasksForTask:(id)a3;
- (void)_runTask:(id)a3;
- (void)_schedule;
- (void)_tryFreeingResourcesForQOS:(id)a3 resourceRequirement:(float)a4;
- (void)cancelAllTasks;
- (void)cancelBackgroundTasks;
- (void)cancelTaskWithID:(unint64_t)a3;
- (void)dealloc;
@end

@implementation VCPMADTaskScheduler

+ (id)qosArray
{
  return &off_100230320;
}

- (VCPMADTaskScheduler)init
{
  v23.receiver = self;
  v23.super_class = (Class)VCPMADTaskScheduler;
  v2 = [(VCPMADTaskScheduler *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.VCPMADTaskScheduler.management", v3);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    runningGroup = v2->_runningGroup;
    v2->_runningGroup = (OS_dispatch_group *)v6;

    uint64_t v8 = +[NSMutableArray array];
    runningTasks = v2->_runningTasks;
    v2->_runningTasks = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    pendingTasks = v2->_pendingTasks;
    v2->_pendingTasks = (NSMutableDictionary *)v10;

    v2->_nextTaskID = 1;
    v2->_resourceBudget = 1.0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = objc_msgSend((id)objc_opt_class(), "qosArray", 0);
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v15);
          v17 = +[NSMutableArray array];
          [(NSMutableDictionary *)v2->_pendingTasks setObject:v17 forKeyedSubscript:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(VCPMADTaskScheduler *)self cancelAllTasks];
  v3.receiver = self;
  v3.super_class = (Class)VCPMADTaskScheduler;
  [(VCPMADTaskScheduler *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (qword_100252440 != -1) {
    dispatch_once(&qword_100252440, &stru_100219E68);
  }
  v2 = (void *)qword_100252438;
  return v2;
}

- (void)_tryFreeingResourcesForQOS:(id)a3 resourceRequirement:(float)a4
{
  id v75 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v5, v6))
    {
      unsigned int v7 = [v75 intValue];
      double resourceBudget = self->_resourceBudget;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v86 = v7;
      *(_WORD *)&v86[4] = 2048;
      *(double *)&v86[6] = a4;
      *(_WORD *)&v86[14] = 2048;
      *(double *)&v86[16] = resourceBudget;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[Scheduler] Attempting to terminate low-priority tasks to unblock high-priority request [QoS: %d Cost: %0.3f][Budget: %0.3f]", buf, 0x1Cu);
    }
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obj = self->_runningTasks;
  id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (!v9)
  {
    float v12 = 0.0;
    goto LABEL_22;
  }
  uint64_t v10 = *(void *)v81;
  uint64_t v11 = VCPLogToOSLogType[7];
  float v12 = 0.0;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v81 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v80 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, (os_log_type_t)v11))
        {
          uint64_t v16 = [v14 task];
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v72 = (void *)v16;
          uint64_t v18 = v10;
          uint64_t v19 = v11;
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          id v21 = [v14 taskID];
          LODWORD(v16) = [v14 qos];
          long long v22 = [v14 task];
          [v22 resourceRequirement];
          *(_DWORD *)buf = 138413058;
          *(void *)v86 = v20;
          *(_WORD *)&v86[8] = 2048;
          *(void *)&v86[10] = v21;
          *(_WORD *)&v86[18] = 1024;
          *(_DWORD *)&v86[20] = v16;
          __int16 v87 = 2048;
          double v88 = v23;
          uint64_t v11 = v19;
          _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v19, "[Scheduler] Evaluating candidate %@ (%lu) [QoS: %d Cost: %0.3f]", buf, 0x26u);

          uint64_t v10 = v18;
        }
      }
      v24 = [v14 task];
      if ([v24 autoCancellable])
      {
        unsigned int v25 = [v14 qos];
        BOOL v26 = v25 < [v75 intValue];

        if (!v26) {
          continue;
        }
        v24 = [v14 task];
        [v24 resourceRequirement];
        float v12 = v12 + v27;
      }
    }
    id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  }
  while (v9);
LABEL_22:

  if ((float)(v12 + self->_resourceBudget) >= a4)
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v28 = self->_runningTasks;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (!v29) {
      goto LABEL_48;
    }
    uint64_t v31 = *(void *)v77;
    os_log_type_t obja = VCPLogToOSLogType[7];
    *(void *)&long long v30 = 138413058;
    long long v69 = v30;
    v71 = v28;
    while (1)
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v77 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v76 + 1) + 8 * (void)j);
        v34 = objc_msgSend(v33, "task", v69);
        if ([v34 autoCancellable])
        {
          unsigned int v35 = [v33 qos];
          BOOL v36 = v35 < [v75 intValue];

          if (!v36) {
            continue;
          }
          v37 = [v33 task];
          char v38 = objc_opt_respondsToSelector();

          if (v38)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v39 = VCPLogInstance();
              if (os_log_type_enabled(v39, obja))
              {
                v40 = [v33 task];
                v41 = (objc_class *)objc_opt_class();
                NSStringFromClass(v41);
                id v42 = (id)objc_claimAutoreleasedReturnValue();
                id v43 = [v33 taskID];
                unsigned int v44 = [v33 qos];
                v45 = [v33 task];
                [v45 resourceRequirement];
                *(_DWORD *)buf = v69;
                *(void *)v86 = v42;
                *(_WORD *)&v86[8] = 2048;
                *(void *)&v86[10] = v43;
                *(_WORD *)&v86[18] = 1024;
                *(_DWORD *)&v86[20] = v44;
                __int16 v87 = 2048;
                double v88 = v46;
                _os_log_impl((void *)&_mh_execute_header, v39, obja, "[Scheduler] Interrupting %@ (%lu) [QoS: %d Cost: %0.3f]", buf, 0x26u);

                v28 = v71;
              }
            }
            v47 = [v33 task];
            [v47 interrupt];

            v48 = [v33 taskGroup];
            dispatch_group_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v49 = VCPLogInstance();
              if (os_log_type_enabled(v49, obja))
              {
                v50 = [v33 task];
                v51 = (objc_class *)objc_opt_class();
                NSStringFromClass(v51);
                id v52 = (id)objc_claimAutoreleasedReturnValue();
                id v53 = [v33 taskID];
                unsigned int v54 = [v33 qos];
                v55 = [v33 task];
                [v55 resourceRequirement];
                *(_DWORD *)buf = v69;
                *(void *)v86 = v52;
                *(_WORD *)&v86[8] = 2048;
                *(void *)&v86[10] = v53;
                *(_WORD *)&v86[18] = 1024;
                *(_DWORD *)&v86[20] = v54;
                __int16 v87 = 2048;
                double v88 = v56;
                _os_log_impl((void *)&_mh_execute_header, v49, obja, "[Scheduler] Reschedule interrupted task %@ (%lu) [QoS: %d Cost: %0.3f]", buf, 0x26u);

                v28 = v71;
              }
            }
            pendingTasks = self->_pendingTasks;
            v58 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v33 qos]);
            v59 = [(NSMutableDictionary *)pendingTasks objectForKeyedSubscript:v58];
            [v59 addObject:v33];

            v34 = [v33 task];
            [v34 resetInterruption];
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v60 = VCPLogInstance();
              if (os_log_type_enabled(v60, obja))
              {
                v61 = [v33 task];
                v62 = (objc_class *)objc_opt_class();
                NSStringFromClass(v62);
                id v63 = (id)objc_claimAutoreleasedReturnValue();
                id v64 = [v33 taskID];
                unsigned int v65 = [v33 qos];
                v66 = [v33 task];
                [v66 resourceRequirement];
                *(_DWORD *)buf = v69;
                *(void *)v86 = v63;
                *(_WORD *)&v86[8] = 2048;
                *(void *)&v86[10] = v64;
                *(_WORD *)&v86[18] = 1024;
                *(_DWORD *)&v86[20] = v65;
                __int16 v87 = 2048;
                double v88 = v67;
                _os_log_impl((void *)&_mh_execute_header, v60, obja, "[Scheduler] Cancelling %@ (%lu) [QoS: %d Cost: %0.3f]", buf, 0x26u);

                v28 = v71;
              }
            }
            v68 = [v33 task];
            [v68 cancel];

            v34 = [v33 taskGroup];
            dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
          }
        }
      }
      id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v76 objects:v84 count:16];
      if (!v29)
      {
LABEL_48:

        break;
      }
    }
  }
}

- (void)_schedule
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    objc_super v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[Scheduler] Evaluating scheduling", buf, 2u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "qosArray", 0);
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      while (2)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        while (1)
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_pendingTasks objectForKeyedSubscript:v9];
          BOOL v11 = [v10 count] == 0;

          if (v11) {
            break;
          }
          float v12 = [(NSMutableDictionary *)self->_pendingTasks objectForKeyedSubscript:v9];
          id v13 = [v12 objectAtIndexedSubscript:0];
          uint64_t v14 = [v13 task];
          [v14 resourceRequirement];
          BOOL v16 = v15 > self->_resourceBudget;

          if (v16)
          {
            if ([v9 intValue] >= 0x19)
            {
              uint64_t v19 = [(NSMutableDictionary *)self->_pendingTasks objectForKeyedSubscript:v9];
              id v20 = [v19 objectAtIndexedSubscript:0];
              id v21 = [v20 task];
              [v21 resourceRequirement];
              -[VCPMADTaskScheduler _tryFreeingResourcesForQOS:resourceRequirement:](self, "_tryFreeingResourcesForQOS:resourceRequirement:", v9);
            }
            goto LABEL_19;
          }
          v17 = [(NSMutableDictionary *)self->_pendingTasks objectForKeyedSubscript:v9];
          uint64_t v18 = [v17 objectAtIndexedSubscript:0];
          [(VCPMADTaskScheduler *)self _runTask:v18];
        }
        if ((id)++v8 != v6) {
          continue;
        }
        break;
      }
      id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
LABEL_19:
}

- (void)_runTask:(id)a3
{
  id v4 = a3;
  v5 = +[VCPWatchdog sharedWatchdog];
  id v6 = [v4 task];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = +[NSString stringWithFormat:@"Task: %@", v8];
  [v5 petWithMessage:v9];

  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      float v12 = [v4 task];
      *(_DWORD *)buf = 138412290;
      id v54 = (id)objc_opt_class();
      id v13 = v54;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Running task %@", buf, 0xCu);
    }
  }
  uint64_t v14 = +[MADStateHandler sharedStateHandler];
  float v15 = [v4 task];
  [v14 addBreadcrumb:@"Running task %@ with qos %u", objc_opt_class(), objc_msgSend(v4, "qos")];

  if (![(NSMutableArray *)self->_runningTasks count])
  {
    BOOL v16 = objc_alloc_init(MADScopedWatchdog);
    scopedWatchdog = self->_scopedWatchdog;
    self->_scopedWatchdog = v16;

    uint64_t v18 = +[VCPCPUMonitor sharedCPUMonitor];
    self->_cpuMonitorID = [v18 disableWithTimeoutSeconds:86400];
  }
  uint64_t v19 = [v4 task];
  if (objc_opt_respondsToSelector())
  {
    id v20 = [v4 task];
    unsigned __int8 v21 = [v20 cachesResources];

    if (v21) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v22 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v22, v23))
    {
      long long v24 = [v4 task];
      long long v25 = (objc_class *)objc_opt_class();
      BOOL v26 = NSStringFromClass(v25);
      id v27 = [v4 taskID];
      *(_DWORD *)buf = 138412546;
      id v54 = v26;
      __int16 v55 = 2048;
      id v56 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[Scheduler] %@ (%lu) does not use resource cache; purging if necessary",
        buf,
        0x16u);
    }
  }
  v28 = +[VCPMADResourceManager sharedManager];
  id v29 = [v4 task];
  [v29 resourceRequirement];
  [v28 reserveBudgetNormalized:v30];

LABEL_16:
  pendingTasks = self->_pendingTasks;
  v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 qos]);
  v33 = [(NSMutableDictionary *)pendingTasks objectForKeyedSubscript:v32];
  [v33 removeObject:v4];

  [(NSMutableArray *)self->_runningTasks addObject:v4];
  if (([v4 background] & 1) == 0)
  {
    v34 = [v4 task];
    [v34 resourceRequirement];
    self->_double resourceBudget = self->_resourceBudget - v35;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    BOOL v36 = VCPLogInstance();
    os_log_type_t v37 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v36, v37))
    {
      char v38 = [v4 task];
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = [v4 taskID];
      unsigned int v42 = [v4 qos];
      id v43 = [v4 task];
      [v43 resourceRequirement];
      double resourceBudget = self->_resourceBudget;
      *(_DWORD *)buf = 138413314;
      id v54 = v40;
      __int16 v55 = 2048;
      id v56 = v41;
      __int16 v57 = 1024;
      unsigned int v58 = v42;
      __int16 v59 = 2048;
      double v60 = v45;
      __int16 v61 = 2048;
      double v62 = resourceBudget;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "[Scheduler] Running %@ (%lu) [QoS: %d Cost: %0.3f]; remaining resource: %.2f",
        buf,
        0x30u);
    }
  }
  float v46 = [v4 taskGroup];
  dispatch_group_enter(v46);

  runningGroup = self->_runningGroup;
  v48 = dispatch_get_global_queue([v4 qos], 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016DEC;
  block[3] = &unk_100219D70;
  id v51 = v4;
  id v52 = self;
  id v49 = v4;
  dispatch_group_async(runningGroup, v48, block);
}

- (void)cancelBackgroundTasks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_runningTasks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "background", (void)v9))
        {
          uint64_t v7 = [v6 task];
          [v7 cancel];

          uint64_t v8 = [v6 taskGroup];
          dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)_checkBackgroundTasksForTask:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_runningTasks;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v26;
    *(void *)&long long v6 = 138412546;
    long long v23 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v9, "background", v23))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 interruptBackgroundTasks])
          {
            long long v12 = VCPLogInstance();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              uint64_t v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              id v19 = (id)objc_claimAutoreleasedReturnValue();
              id v20 = [v9 task];
              unsigned __int8 v21 = (objc_class *)objc_opt_class();
              long long v22 = NSStringFromClass(v21);
              *(_DWORD *)buf = v23;
              id v30 = v19;
              __int16 v31 = 2112;
              v32 = v22;
              _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[Scheduler] Foreground task (%@) running concurrently with DAS activity (%@)", buf, 0x16u);
            }
          }
          else
          {
            long long v10 = VCPLogInstance();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            {
              id v13 = (objc_class *)objc_opt_class();
              NSStringFromClass(v13);
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              float v15 = [v9 task];
              BOOL v16 = (objc_class *)objc_opt_class();
              v17 = NSStringFromClass(v16);
              *(_DWORD *)buf = v23;
              id v30 = v14;
              __int16 v31 = 2112;
              v32 = v17;
              _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "[Scheduler] Foreground task (%@) interrupting DAS activity (%@)", buf, 0x16u);
            }
            long long v11 = [v9 task];
            [v11 cancel];

            long long v12 = [v9 taskGroup];
            dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
          }
        }
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v5);
  }
}

- (BOOL)validateTask:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 resourceRequirement];
    if (v5 >= 0.0)
    {
      [v4 resourceRequirement];
      if (v6 <= 1.0)
      {
        BOOL v15 = 1;
        goto LABEL_13;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        [v4 resourceRequirement];
        int v17 = 134217984;
        double v18 = v9;
        long long v10 = "[Scheduler] Invalid resource requirement (%0.1f); dropping task request";
        long long v11 = v7;
        os_log_type_t v12 = v8;
        uint32_t v13 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v17, v13);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v7 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v7, v14))
    {
      LOWORD(v17) = 0;
      long long v10 = "[Scheduler] Invalid task (nil); dropping task request";
      long long v11 = v7;
      os_log_type_t v12 = v14;
      uint32_t v13 = 2;
      goto LABEL_10;
    }
LABEL_11:
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (unsigned)validateQoS:(unsigned int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "qosArray", 0);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue];
        unsigned int v9 = v8;
        if (v8 <= a3)
        {
          if (v8 < a3)
          {
            long long v10 = VCPLogInstance();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
              sub_10001936C();
            }
          }
          goto LABEL_16;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v4 = VCPLogInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_1000192F0();
  }
  unsigned int v9 = 9;
LABEL_16:

  return v9;
}

- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4
{
  return [(VCPMADTaskScheduler *)self addForegroundTask:a3 withQoS:*(void *)&a4 completionHandler:0];
}

- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ([(VCPMADTaskScheduler *)self validateTask:v8])
  {
    unsigned int v10 = [(VCPMADTaskScheduler *)self validateQoS:v6];
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    managementQueue = self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017A70;
    block[3] = &unk_100219E90;
    int v17 = &v19;
    void block[4] = self;
    id v15 = v8;
    unsigned int v18 = v10;
    id v16 = v9;
    dispatch_sync(managementQueue, block);
    unint64_t v12 = v20[3];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)addBackgroundTask:(id)a3 withQoS:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(VCPMADTaskScheduler *)self validateTask:v6])
  {
    unsigned int v7 = [(VCPMADTaskScheduler *)self validateQoS:v4];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    managementQueue = self->_managementQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017D98;
    v11[3] = &unk_100219EB8;
    v11[4] = self;
    id v12 = v6;
    long long v13 = &v15;
    unsigned int v14 = v7;
    dispatch_sync(managementQueue, v11);
    unint64_t v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)cancelTaskWithID:(unint64_t)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[Scheduler] Cancelling task %lu", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1000185E4;
  long long v23 = sub_1000185F4;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1000185E4;
  uint64_t v18 = sub_1000185F4;
  id v19 = 0;
  managementQueue = self->_managementQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000185FC;
  v13[3] = &unk_100219EE0;
  v13[4] = self;
  v13[5] = &buf;
  v13[6] = &v14;
  v13[7] = a3;
  dispatch_sync(managementQueue, v13);
  id v8 = *(void **)(*((void *)&buf + 1) + 40);
  if (v8)
  {
    uint64_t v9 = [v8 taskGroup];
    dispatch_group_wait((dispatch_group_t)v9, 0xFFFFFFFFFFFFFFFFLL);
LABEL_7:

    goto LABEL_8;
  }
  unsigned int v10 = (void *)v15[5];
  if (v10)
  {
    long long v11 = [v10 completionHandler];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      uint64_t v9 = [(id)v15[5] completionHandler];
      (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, [(id)v15[5] taskID], 4294967168);
      goto LABEL_7;
    }
  }
LABEL_8:
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)cancelAllTasks
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[Scheduler] Cancelling all tasks", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  uint64_t v21 = buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000185E4;
  id v24 = sub_1000185F4;
  id v25 = +[NSMutableArray array];
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018D5C;
  block[3] = &unk_100219F08;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(managementQueue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *((id *)v21 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = objc_msgSend(v10, "completionHandler", (void)v15);
        BOOL v13 = v12 == 0;

        if (!v13)
        {
          uint64_t v14 = [v10 completionHandler];
          ((void (**)(void, id, uint64_t))v14)[2](v14, [v10 taskID], 4294967168);
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v7);
  }

  dispatch_group_wait((dispatch_group_t)self->_runningGroup, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(buf, 8);
}

- (unint64_t)currentOutstandingTasks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  managementQueue = self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000190FC;
  v5[3] = &unk_100219F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = *((int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedWatchdog, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_runningGroup, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end