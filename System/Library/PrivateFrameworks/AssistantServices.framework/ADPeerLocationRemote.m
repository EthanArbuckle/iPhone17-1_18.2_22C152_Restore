@interface ADPeerLocationRemote
- (ADPeerLocationRemote)init;
- (BOOL)_hasActiveBestLocationRequest;
- (id)_locationManager;
- (void)_cancelBestLocationTimer;
- (void)_executeBestLocationCompletionWithLocation:(id)a3;
- (void)_executeBestLocationCompletionWithLocation:(id)a3 error:(id)a4;
- (void)_executeBestLocationCompletionWithLocationErrorWithCode:(int64_t)a3;
- (void)_getBestLocationWithCompletion:(id)a3;
- (void)_startBestLocationTimer;
- (void)_startUpdatingLocation;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5;
@end

@implementation ADPeerLocationRemote

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationInUseAssertion, 0);
  objc_storeStrong(&self->_bestLocationCompletion, 0);
  objc_storeStrong((id *)&self->_bestLocationTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADPeerLocationRemote locationManagerDidResumeLocationUpdates:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADPeerLocationRemote locationManagerDidPauseLocationUpdates:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
    __int16 v13 = 1024;
    int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v11, 0x12u);
  }
  int IsAllowed = AFLocationStatusIsAllowed();
  if ([(ADPeerLocationRemote *)self _hasActiveBestLocationRequest])
  {
    v9 = AFSiriLogContextDaemon;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (IsAllowed)
    {
      if (v10)
      {
        int v11 = 136315138;
        v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s authorized with active request; starting location updates",
          (uint8_t *)&v11,
          0xCu);
      }
      [(ADPeerLocationRemote *)self _startUpdatingLocation];
    }
    else
    {
      if (v10)
      {
        int v11 = 136315138;
        v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s not authorized with active request; failing with error",
          (uint8_t *)&v11,
          0xCu);
      }
      [(ADPeerLocationRemote *)self _executeBestLocationCompletionWithLocationErrorWithCode:100];
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[ADPeerLocationRemote locationManager:didFailWithError:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(ADPeerLocationRemote *)self _executeBestLocationCompletionWithLocation:0 error:v5];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = objc_msgSend(a4, "lastObject", a3);
  id v6 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315395;
    v8 = "-[ADPeerLocationRemote locationManager:didUpdateLocations:]";
    __int16 v9 = 2113;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s updated location %{private}@", (uint8_t *)&v7, 0x16u);
  }
  [(ADPeerLocationRemote *)self _executeBestLocationCompletionWithLocation:v5];
}

- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int v11 = "-[ADPeerLocationRemote peerConnection:handlePBSubclass:completion:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(v7, "_ad_performWithPeerLocationManagerRemote:completion:", self, v8);
}

- (void)_executeBestLocationCompletionWithLocationErrorWithCode:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.siri.location.Error" code:a3 userInfo:&__NSDictionary0__struct];
  [(ADPeerLocationRemote *)self _executeBestLocationCompletionWithLocation:0 error:v4];
}

- (void)_executeBestLocationCompletionWithLocation:(id)a3
{
}

- (void)_executeBestLocationCompletionWithLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315651;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    __int16 v20 = 2113;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %{private}@ %@", (uint8_t *)&v18, 0x20u);
  }
  [(ADPeerLocationRemote *)self _cancelBestLocationTimer];
  __int16 v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s stopping location updates", (uint8_t *)&v18, 0xCu);
  }
  int v10 = [(ADPeerLocationRemote *)self _locationManager];
  [v10 stopUpdatingLocation];

  unsigned int v11 = [(ADPeerLocationRemote *)self _hasActiveBestLocationRequest];
  __int16 v12 = AFSiriLogContextDaemon;
  BOOL v13 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      int v18 = 136315138;
      v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s has active request; calling completion",
        (uint8_t *)&v18,
        0xCu);
    }
    if (v6)
    {
      int v14 = objc_alloc_init(_ADPBLocationSetPeerLocationRequest);
      [(_ADPBLocationSetPeerLocationRequest *)v14 ad_setLocation:v6];
    }
    else
    {
      int v14 = 0;
    }
    (*((void (**)(void))self->_bestLocationCompletion + 2))();
    id bestLocationCompletion = self->_bestLocationCompletion;
    self->_id bestLocationCompletion = 0;

    id locationInUseAssertion = self->_locationInUseAssertion;
    if (locationInUseAssertion)
    {
      v17 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ADPeerLocationRemote: location found for peer", (uint8_t *)&v18, 0xCu);
        id locationInUseAssertion = self->_locationInUseAssertion;
      }
      self->_id locationInUseAssertion = 0;
    }
  }
  else if (v13)
  {
    int v18 = 136315138;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s no active request", (uint8_t *)&v18, 0xCu);
  }
}

- (void)_getBestLocationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011391C;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_hasActiveBestLocationRequest
{
  return self->_bestLocationCompletion != 0;
}

- (void)_startUpdatingLocation
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADPeerLocationRemote _startUpdatingLocation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s starting location updates", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(ADPeerLocationRemote *)self _locationManager];
  [v4 startUpdatingLocation];
}

- (void)_cancelBestLocationTimer
{
  bestLocationTimer = self->_bestLocationTimer;
  if (bestLocationTimer)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADPeerLocationRemote _cancelBestLocationTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      bestLocationTimer = self->_bestLocationTimer;
    }
    dispatch_source_cancel(bestLocationTimer);
    int v5 = self->_bestLocationTimer;
    self->_bestLocationTimer = 0;
  }
}

- (void)_startBestLocationTimer
{
  [(ADPeerLocationRemote *)self _cancelBestLocationTimer];
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v11 = "-[ADPeerLocationRemote _startBestLocationTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  bestLocationTimer = self->_bestLocationTimer;
  self->_bestLocationTimer = v4;

  int v6 = self->_bestLocationTimer;
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v8 = self->_bestLocationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100113F24;
  handler[3] = &unk_10050E138;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume((dispatch_object_t)self->_bestLocationTimer);
}

- (id)_locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    id v4 = objc_alloc((Class)CLLocationManager);
    int v5 = AFEffectiveSiriBundleForLocation();
    int v6 = (CLLocationManager *)[v4 initWithEffectiveBundle:v5 delegate:self onQueue:self->_queue];
    dispatch_time_t v7 = self->_locationManager;
    self->_locationManager = v6;

    [(CLLocationManager *)self->_locationManager registerAsLocationClient];
    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)dealloc
{
  [(ADPeerLocationRemote *)self _cancelBestLocationTimer];
  v3.receiver = self;
  v3.super_class = (Class)ADPeerLocationRemote;
  [(ADPeerLocationRemote *)&v3 dealloc];
}

- (ADPeerLocationRemote)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADPeerLocationRemote;
  v2 = [(ADPeerLocationRemote *)&v9 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADPeerLocationRemote", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    int v6 = [[ADPeerConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.location" forRequests:j__objc_msgSend__ADPBLocationRequestType requireConnectedPeer:1];
    peerConnection = v2->_peerConnection;
    v2->_peerConnection = v6;

    [(ADPeerConnection *)v2->_peerConnection setDelegate:v2 forRequestTypes:sub_1002AE45C];
  }
  return v2;
}

@end