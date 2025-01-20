@interface ADDeviceRouter
- (ADDeviceRouter)initWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3 deviceProximityManager:(id)a4;
- (void)_fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:(id)a3;
- (void)_updateContext:(id)a3;
- (void)getPreferredDeviceToHandleCommand:(id)a3 logNearbyDeviceMetrics:(BOOL)a4 executionContext:(id)a5 sharedUserID:(id)a6 completion:(id)a7;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)updateContext:(id)a3;
@end

@implementation ADDeviceRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProximityManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentDeviceContextTuples, 0);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007908C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
}

- (void)getPreferredDeviceToHandleCommand:(id)a3 logNearbyDeviceMetrics:(BOOL)a4 executionContext:(id)a5 sharedUserID:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (AFSupportsHALDeviceRouting())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (objc_msgSend(v11, "ad_requiresDeviceContext"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100079524;
      v17[3] = &unk_100501B08;
      v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v13;
      id v21 = v14;
      [(ADDeviceRouter *)self _fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:v17];
    }
    else
    {
      v16 = objc_msgSend(v11, "ad_executionDeviceForDeviceContextTuples:executionContext:proximityMap:sharedUserID:localDeviceIsFollower:", self->_currentDeviceContextTuples, v12, 0, v13, self->_isLocalDeviceFollowerInStereoPair == 2);
      (*((void (**)(id, void *, void))v14 + 2))(v14, v16, 0);
    }
  }
  else
  {
    v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADDeviceRouter getPreferredDeviceToHandleCommand:logNearbyDeviceMetrics:executionContext:sharedUserID:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s #hal Not supported on this platform", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }
}

- (void)_fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_currentDeviceContextTuples)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else
    {
      v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v13 = "-[ADDeviceRouter _fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #hal context not updated, fetching now", buf, 0xCu);
      }
      uint64_t v7 = mach_absolute_time();
      v8 = +[ADCommandCenter sharedCommandCenter];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100079A90;
      v9[3] = &unk_1004FFD00;
      v9[4] = self;
      uint64_t v11 = v7;
      id v10 = v5;
      [v8 getCurrentContextSnapshotWithCompletion:v9];
    }
  }
}

- (void)_updateContext:(id)a3
{
  id v5 = a3;
  p_currentDeviceContextTuples = &self->_currentDeviceContextTuples;
  objc_storeStrong((id *)p_currentDeviceContextTuples, a3);
  int v7 = AFIsInternalInstall();
  v8 = AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      int v15 = 136315138;
      v16 = "-[ADDeviceRouter _updateContext:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal updating...", (uint8_t *)&v15, 0xCu);
    }
    [(NSArray *)*p_currentDeviceContextTuples enumerateObjectsUsingBlock:&stru_1004FFCD8];
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      v16 = "-[ADDeviceRouter _updateContext:]";
      uint64_t v11 = "%s #hal updated";
      id v12 = v10;
      uint32_t v13 = 12;
LABEL_9:
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v15, v13);
    }
  }
  else if (v9)
  {
    id v14 = *p_currentDeviceContextTuples;
    int v15 = 136315394;
    v16 = "-[ADDeviceRouter _updateContext:]";
    __int16 v17 = 2112;
    id v18 = v14;
    uint64_t v11 = "%s #hal %@";
    id v12 = v8;
    uint32_t v13 = 22;
    goto LABEL_9;
  }
}

- (void)updateContext:(id)a3
{
  id v4 = a3;
  if (AFSupportsHALDeviceRouting())
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007A00C;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
  else
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[ADDeviceRouter updateContext:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #hal Not supported on this platform", buf, 0xCu);
    }
  }
}

- (id)_initWithQueue:(id)a3 deviceProximityManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ADDeviceRouter;
  BOOL v9 = [(ADDeviceRouter *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 4, a4);
    uint64_t v11 = +[ADRequestLifecycleObserver sharedObserver];
    [v11 addListener:p_isa];
  }
  return p_isa;
}

- (ADDeviceRouter)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = +[ADDeviceProximityManager sharedManager];
  v6 = [(ADDeviceRouter *)self _initWithQueue:v4 deviceProximityManager:v5];

  return v6;
}

@end