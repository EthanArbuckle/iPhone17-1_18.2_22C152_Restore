@interface OSMBackgroundFeatureManager
+ (id)sharedBackgroundFeatureManager;
- (BOOL)hasOngoingEvent;
- (id)_init;
- (id)feedbackManager;
- (id)motionConfidence;
- (id)musicPlayingState;
- (unint64_t)mediaType;
- (unint64_t)motionActivity;
- (void)dealloc;
- (void)startMonitoringActivity;
- (void)stopMonitoringActivity;
@end

@implementation OSMBackgroundFeatureManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivityQueue, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_feedbackManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (id)feedbackManager
{
  return self->_feedbackManager;
}

- (unint64_t)mediaType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5 = dispatch_semaphore_create(0);
  AFGetNowPlayingInfoDictionary();
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v2);
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)musicPlayingState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10000960C;
  v10 = sub_10000961C;
  id v11 = objc_alloc_init((Class)SAMPQueueState);
  v5 = dispatch_semaphore_create(0);
  AFGetNowPlayingQueueState();
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v2);
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)motionConfidence
{
  motionActivity = self->_motionActivity;
  if (motionActivity && (unint64_t v3 = [(CMMotionActivity *)motionActivity confidence], v3 <= 2)) {
    return off_100010588[v3];
  }
  else {
    return @"None";
  }
}

- (unint64_t)motionActivity
{
  unint64_t result = (unint64_t)self->_motionActivity;
  if (result)
  {
    if ([(id)result stationary]
      && [(CMMotionActivity *)self->_motionActivity automotive])
    {
      return 6;
    }
    else if ([(CMMotionActivity *)self->_motionActivity stationary])
    {
      return 1;
    }
    else if ([(CMMotionActivity *)self->_motionActivity walking])
    {
      return 2;
    }
    else if ([(CMMotionActivity *)self->_motionActivity running])
    {
      return 3;
    }
    else if ([(CMMotionActivity *)self->_motionActivity cycling])
    {
      return 4;
    }
    else if ([(CMMotionActivity *)self->_motionActivity automotive])
    {
      return 5;
    }
    else if ([(CMMotionActivity *)self->_motionActivity unknown])
    {
      return 7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)stopMonitoringActivity
{
  motionActivityManager = self->_motionActivityManager;
  if (motionActivityManager)
  {
    v4 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[OSMBackgroundFeatureManager stopMonitoringActivity]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s OSM Stoping User Activity Monitoring.", (uint8_t *)&v5, 0xCu);
      motionActivityManager = self->_motionActivityManager;
    }
    [(CMMotionActivityManager *)motionActivityManager stopActivityUpdates];
  }
}

- (void)startMonitoringActivity
{
  unint64_t v3 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[OSMBackgroundFeatureManager startMonitoringActivity]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s OSM Starting User Activity Monitoring.", buf, 0xCu);
  }
  if (!self->_motionActivityManager)
  {
    v4 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = v4;
  }
  uint64_t v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  motionActivityQueue = self->_motionActivityQueue;
  self->_motionActivityQueue = v6;

  [(NSOperationQueue *)self->_motionActivityQueue setUnderlyingQueue:self->_queue];
  uint64_t v8 = self->_motionActivityManager;
  uint64_t v9 = self->_motionActivityQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009998;
  v10[3] = &unk_100010518;
  v10[4] = self;
  [(CMMotionActivityManager *)v8 startActivityUpdatesToQueue:v9 withHandler:v10];
}

- (BOOL)hasOngoingEvent
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A9C;
  block[3] = &unk_1000104F0;
  dispatch_semaphore_t v9 = v3;
  v10 = &v11;
  block[4] = self;
  int v5 = v3;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)dealloc
{
  [(OSMBackgroundFeatureManager *)self stopMonitoringActivity];
  v3.receiver = self;
  v3.super_class = (Class)OSMBackgroundFeatureManager;
  [(OSMBackgroundFeatureManager *)&v3 dealloc];
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)OSMBackgroundFeatureManager;
  dispatch_time_t v2 = [(OSMBackgroundFeatureManager *)&v12 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("OSMBackgroundFeatureManager", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_time_t v6 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
    eventStore = v2->_eventStore;
    v2->_eventStore = v6;

    uint64_t v8 = (AFOpportuneSpeakingModelFeedbackManager *)objc_alloc_init((Class)AFOpportuneSpeakingModelFeedbackManager);
    feedbackManager = v2->_feedbackManager;
    v2->_feedbackManager = v8;

    if (+[CMMotionActivityManager isActivityAvailable])
    {
      [(OSMBackgroundFeatureManager *)v2 startMonitoringActivity];
    }
    else
    {
      v10 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        char v14 = "-[OSMBackgroundFeatureManager _init]";
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s CMMotionActivity unavailable.", buf, 0xCu);
      }
    }
  }
  return v2;
}

+ (id)sharedBackgroundFeatureManager
{
  if (qword_100015830 != -1) {
    dispatch_once(&qword_100015830, &stru_1000104A0);
  }
  dispatch_time_t v2 = (void *)qword_100015838;
  return v2;
}

@end