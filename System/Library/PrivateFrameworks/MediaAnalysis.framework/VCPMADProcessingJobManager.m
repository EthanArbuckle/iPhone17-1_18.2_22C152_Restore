@interface VCPMADProcessingJobManager
+ (id)sharedManager;
- (OS_dispatch_semaphore)inProcessAssetBudget;
- (VCPMADProcessingJobManager)init;
- (id)getJobScheduler;
- (void)registerQueueGroupWithName:(id)a3 andNumberOfQueues:(unint64_t)a4;
- (void)setInProcessAssetBudget:(id)a3;
@end

@implementation VCPMADProcessingJobManager

- (VCPMADProcessingJobManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPMADProcessingJobManager;
  v2 = [(VCPMADProcessingJobManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    queueNameToQueueGroup = v2->_queueNameToQueueGroup;
    v2->_queueNameToQueueGroup = (NSMutableDictionary *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(8);
    inProcessAssetBudget = v2->_inProcessAssetBudget;
    v2->_inProcessAssetBudget = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_100252738 != -1) {
    dispatch_once(&qword_100252738, &stru_10021E138);
  }
  v2 = (void *)qword_100252740;
  return v2;
}

- (void)registerQueueGroupWithName:(id)a3 andNumberOfQueues:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 5 > 0xFFFFFFFFFFFFFFFBLL)
  {
    unint64_t v8 = a4;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = a4;
    }
    if (v7 >= 4) {
      unint64_t v8 = 4;
    }
    else {
      unint64_t v8 = v7;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v29 = a4;
        __int16 v30 = 2112;
        unint64_t v31 = (unint64_t)v6;
        __int16 v32 = 2048;
        unint64_t v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Invalid number of queues %lu for QueueGroup %@, clipping to %lu", buf, 0x20u);
      }
    }
  }
  v11 = [(NSMutableDictionary *)self->_queueNameToQueueGroup objectForKeyedSubscript:v6];

  if (!v11)
  {
    v27 = self;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v29 = (unint64_t)v6;
        __int16 v30 = 2048;
        unint64_t v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Registering QueueGroup %@ with %lu queues", buf, 0x16u);
      }
    }
    v26 = objc_alloc_init(QueueGroup);
    v19 = +[NSMutableArray array];
    uint64_t v20 = 0;
    do
    {
      id v22 = +[NSString stringWithFormat:@"com.apple.mediaanalysis.%@_%lu", v6, v20];
      v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
      qos_class_t v24 = qos_class_self();
      v25 = dispatch_get_global_queue(v24, 0);
      dispatch_set_target_queue(v23, v25);

      [v19 addObject:v23];
      ++v20;
    }
    while (v8 != v20);
    p_super = &v26->super;
    [(QueueGroup *)v26 setQueues:v19];
    [(NSMutableDictionary *)v27->_queueNameToQueueGroup setObject:v26 forKeyedSubscript:v6];

    goto LABEL_25;
  }
  v12 = [(NSMutableDictionary *)self->_queueNameToQueueGroup objectForKeyedSubscript:v6];
  v13 = [v12 queues];
  id v14 = [v13 count];

  if ((id)v8 != v14 && (int)MediaAnalysisLogLevel() >= 4)
  {
    p_super = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(p_super, v16))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v29 = (unint64_t)v6;
      __int16 v30 = 2048;
      unint64_t v31 = (unint64_t)v14;
      __int16 v32 = 2048;
      unint64_t v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, p_super, v16, "QueueGroup %@ has been registered with %lu queues, not allowed to change to %lu queues as requested", buf, 0x20u);
    }
LABEL_25:
  }
}

- (id)getJobScheduler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FEC40;
  v4[3] = &unk_10021E160;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (OS_dispatch_semaphore)inProcessAssetBudget
{
  return self->_inProcessAssetBudget;
}

- (void)setInProcessAssetBudget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProcessAssetBudget, 0);
  objc_storeStrong((id *)&self->_queueNameToQueueGroup, 0);
}

@end