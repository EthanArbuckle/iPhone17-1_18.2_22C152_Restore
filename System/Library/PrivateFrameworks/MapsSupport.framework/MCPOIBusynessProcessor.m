@interface MCPOIBusynessProcessor
+ (MCPOIBusynessProcessor)sharedProcessor;
- (MCPOIBusynessProcessor)init;
- (void)didUpdateLocation:(id)a3;
- (void)didUpdateVisit:(id)a3;
- (void)finished;
- (void)leechLocation;
- (void)noLocationAuth;
@end

@implementation MCPOIBusynessProcessor

+ (MCPOIBusynessProcessor)sharedProcessor
{
  if (qword_1000239B8 != -1) {
    dispatch_once(&qword_1000239B8, &stru_10001C600);
  }
  v2 = (void *)qword_1000239C0;

  return (MCPOIBusynessProcessor *)v2;
}

- (MCPOIBusynessProcessor)init
{
  v10.receiver = self;
  v10.super_class = (Class)MCPOIBusynessProcessor;
  v2 = [(MCPOIBusynessProcessor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    waitGroup = v2->_waitGroup;
    v2->_waitGroup = (OS_dispatch_group *)v5;

    uint64_t v7 = +[MCPOIBusynessLocationManager sharedLocationManager];
    v8 = (void *)qword_1000239B0;
    qword_1000239B0 = v7;

    [(id)qword_1000239B0 setLocationDelegate:v2];
  }
  return v2;
}

- (void)leechLocation
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MCPOIBusynessProcessor: requestingLocation", buf, 2u);
  }

  *(void *)buf = 0;
  objc_super v10 = buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003674;
  block[3] = &unk_10001C628;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  if (!v10[24])
  {
    dispatch_group_enter((dispatch_group_t)self->_waitGroup);
    [(id)qword_1000239B0 requestLocation];
    if (GEOConfigGetBOOL())
    {
      dispatch_group_enter((dispatch_group_t)self->_waitGroup);
      [(id)qword_1000239B0 requestVisit];
    }
    waitGroup = self->_waitGroup;
    v6 = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000036E0;
    v7[3] = &unk_10001C650;
    v7[4] = self;
    dispatch_group_notify(waitGroup, v6, v7);
  }
  _Block_object_dispose(buf, 8);
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MCPOIBusynessProcessor didUpdateLocation : %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003808;
  v8[3] = &unk_10001C678;
  id v9 = v4;
  objc_super v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)didUpdateVisit:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MCPOIBusynessProcessor didUpdateVisit : %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000039B0;
  v8[3] = &unk_10001C678;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)noLocationAuth
{
  uint64_t v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MCPOIBusynessProcessor noLocationAuth", v4, 2u);
  }

  dispatch_group_leave((dispatch_group_t)self->_waitGroup);
}

- (void)finished
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_location)
  {
    uint64_t v3 = +[MCPOIBusynessUploadConditionsChecker sharedConditionsCheckerInstance];
    unsigned int v4 = [v3 shouldUseVisit:self->_visit forLocation:self->_location];

    if (v4)
    {
      id v5 = objc_alloc((Class)CLLocation);
      [(CLVisit *)self->_visit coordinate];
      double v7 = v6;
      double v9 = v8;
      [(CLVisit *)self->_visit horizontalAccuracy];
      double v11 = v10;
      id v12 = [(CLVisit *)self->_visit arrivalDate];
      id v13 = objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v7, v9, NAN, v11, NAN);
    }
    v14 = [[MCPOIBusynessData alloc] initWithLocation:self->_location visit:self->_visit];
    +[MCPOIBusynessEventCollector startProcessingPayload:v14];
  }
  self->_isWaiting = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visit, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_waitGroup, 0);
}

@end