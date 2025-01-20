@interface ADMotionManager
- (ADMotionManager)init;
- (BOOL)isDriving;
- (CMMotionActivity)_motionActivity;
- (id)motionActivity;
- (id)motionConfidence;
- (int64_t)deviceMotion;
- (void)_setMotionActivity:(id)a3;
- (void)startUpdatingMotionActivityForReason:(id)a3 completion:(id)a4;
- (void)stopUpdatingMotionActivityForReason:(id)a3 completion:(id)a4;
@end

@implementation ADMotionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
}

- (void)_setMotionActivity:(id)a3
{
}

- (CMMotionActivity)_motionActivity
{
  return self->_motionActivity;
}

- (int64_t)deviceMotion
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  externalQueue = self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031240C;
  v7[3] = &unk_10050D5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[3];
    *(_DWORD *)buf = 136315394;
    v13 = "-[ADMotionManager deviceMotion]";
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #modes deviceMotion = %ld", buf, 0x16u);
  }
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)isDriving
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  externalQueue = self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100312604;
  v7[3] = &unk_10050D5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    if (*((unsigned char *)v9 + 24)) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    v13 = "-[ADMotionManager isDriving]";
    __int16 v14 = 2112;
    CFStringRef v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s isDriving = %@", buf, 0x16u);
  }
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)motionConfidence
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_1003127E4;
  v12 = sub_1003127F4;
  id v13 = 0;
  externalQueue = self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003127FC;
  v7[3] = &unk_10050D5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    CFStringRef v15 = "-[ADMotionManager motionConfidence]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s motionConfidence = %@", buf, 0x16u);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)motionActivity
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_1003127E4;
  v12 = sub_1003127F4;
  id v13 = 0;
  externalQueue = self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100312A30;
  v7[3] = &unk_10050D5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    CFStringRef v15 = "-[ADMotionManager motionActivity]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s motionActivity = %@", buf, 0x16u);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)stopUpdatingMotionActivityForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[ADMotionManager stopUpdatingMotionActivityForReason:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s reason = %@", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100312C9C;
  v11[3] = &unk_10050E188;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(internalQueue, v11);
}

- (void)startUpdatingMotionActivityForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[ADMotionManager startUpdatingMotionActivityForReason:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s reason = %@", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100312EB4;
  v11[3] = &unk_10050E188;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(internalQueue, v11);
}

- (ADMotionManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)ADMotionManager;
  v2 = [(ADMotionManager *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADMotionManagerInternalQueue", v3);

    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    opQueue = v2->_opQueue;
    v2->_opQueue = v6;

    [(NSOperationQueue *)v2->_opQueue setUnderlyingQueue:v2->_internalQueue];
    [(NSOperationQueue *)v2->_opQueue setMaxConcurrentOperationCount:1];
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("ADMotionManagerExternalQueue", v8);

    externalQueue = v2->_externalQueue;
    v2->_externalQueue = (OS_dispatch_queue *)v9;

    char v11 = v2->_internalQueue;
    id v12 = +[ADQueueMonitor sharedMonitor];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003133C8;
    v15[3] = &unk_10050C458;
    id v16 = v11;
    id v13 = v11;
    [v12 addQueue:v13 heartBeatInterval:v15 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v2;
}

@end