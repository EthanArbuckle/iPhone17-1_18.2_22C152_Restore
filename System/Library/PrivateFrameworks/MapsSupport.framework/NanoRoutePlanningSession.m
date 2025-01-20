@interface NanoRoutePlanningSession
+ (id)_defaultClassesBySessionState;
+ (unint64_t)defaultOrigin;
+ (void)processRequest:(id)a3 withCompletion:(id)a4;
+ (void)setDefaultClass:(Class)a3 forSessionState:(int64_t)a4;
- (BOOL)_hasReceivedAllExpectedRoutes;
- (BOOL)hasReceivedAllExpectedRoutes;
- (BOOL)isInvalidated;
- (BOOL)isLoading;
- (BOOL)shouldBroadcast;
- (Class)_classForState:(int64_t)a3;
- (GEOCompanionRouteDetails)selectedCompanionRoute;
- (GEOComposedRoute)selectedRoute;
- (GEOObserverHashTable)observers;
- (NSMutableDictionary)userInfo;
- (NSString)description;
- (NanoRoutePlanningRequest)request;
- (NanoRoutePlanningResponse)response;
- (NanoRoutePlanningSession)init;
- (NanoRoutePlanningSession)initWithOrigin:(unint64_t)a3;
- (id)_description;
- (id)valueForUserInfoKey:(id)a3;
- (int64_t)state;
- (unint64_t)origin;
- (void)_anticipateRoutesWithRequest:(id)a3;
- (void)_broadcastIfNeeded;
- (void)_cancelRequestIfNeeded;
- (void)_endTransaction;
- (void)_notifyDidChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)_notifyDidInvalidate;
- (void)_notifySessionDidFail;
- (void)_notifySessionDidStartLoading;
- (void)_notifySessionDidUpdateResponse;
- (void)_prepareForRequest:(id)a3;
- (void)_processRequest:(id)a3;
- (void)_setResponse:(id)a3;
- (void)_setSelectedRouteWithRouteID:(id)a3;
- (void)_startTransaction;
- (void)_transitionToState:(int64_t)a3;
- (void)_transitionToState:(int64_t)a3 withClass:(Class)a4;
- (void)_updateWithRequest:(id)a3 response:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)processRequest:(id)a3;
- (void)registerObserver:(id)a3;
- (void)replaceWithStateOfClass:(Class)a3;
- (void)setNextClass:(Class)a3 forSessionState:(int64_t)a4;
- (void)setObservers:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSelectedCompanionRoute:(id)a3;
- (void)setSelectedRoute:(id)a3;
- (void)setSelectedRouteWithRouteID:(id)a3;
- (void)setShouldBroadcast:(BOOL)a3;
- (void)setUserInfoKey:(id)a3 andValue:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateWithBlock:(id)a3;
- (void)updateWithRequest:(id)a3 response:(id)a4;
@end

@implementation NanoRoutePlanningSession

- (void)dealloc
{
  [(NanoRoutePlanningState *)self->_stateObject leaveToState:0];
  v3 = sub_100033510();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    __int16 v7 = 2080;
    v8 = "-[NanoRoutePlanningSession dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%p] %s", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NanoRoutePlanningSession;
  [(NanoRoutePlanningSession *)&v4 dealloc];
}

- (NanoRoutePlanningSession)init
{
  id v3 = [(id)objc_opt_class() defaultOrigin];

  return [(NanoRoutePlanningSession *)self initWithOrigin:v3];
}

- (NanoRoutePlanningSession)initWithOrigin:(unint64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NanoRoutePlanningSession;
  id v4 = [(NanoRoutePlanningSession *)&v20 init];
  if (v4)
  {
    v5 = sub_100033510();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v22 = v4;
      __int16 v23 = 2080;
      v24 = "-[NanoRoutePlanningSession initWithOrigin:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%p] %s", buf, 0x16u);
    }

    uint64_t v6 = MapsAppBundleId;
    id v7 = +[NSString stringWithFormat:@"%@.%@.%p", MapsAppBundleId, objc_opt_class(), v4];
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    v11 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v10;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 2), &unk_1000644B0, &unk_1000644B0, 0);
    id v12 = +[NSString stringWithFormat:@"%@.%@.%p", v6, objc_opt_class(), v4];
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    v16 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v15;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 3), &off_100082270, &off_100082270, 0);
    *((void *)v4 + 4) = a3;
    uint64_t v17 = +[NSMutableDictionary dictionaryWithCapacity:1];
    v18 = (void *)*((void *)v4 + 11);
    *((void *)v4 + 11) = v17;
  }
  return (NanoRoutePlanningSession *)v4;
}

- (NSString)description
{
  if (dispatch_get_specific(&unk_1000644B0) == &unk_1000644B0)
  {
    id v4 = [(NanoRoutePlanningSession *)self _description];
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    dispatch_queue_t v10 = sub_100033900;
    v11 = sub_100033910;
    id v12 = 0;
    isolationQueue = self->_isolationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100033918;
    v6[3] = &unk_1000816F0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(isolationQueue, v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return (NSString *)v4;
}

- (id)_description
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v7.receiver = self;
  v7.super_class = (Class)NanoRoutePlanningSession;
  id v3 = [(NanoRoutePlanningSession *)&v7 description];
  id v4 = sub_100013EEC(self->_origin);
  v5 = +[NSString stringWithFormat:@"%@ (origin:%@)", v3, v4];

  return v5;
}

- (void)invalidate
{
  if (![(NanoRoutePlanningSession *)self isInvalidated])
  {
    self->_invalidated = 1;
    id v3 = sub_100033510();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      objc_super v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%p] is being invalidated", buf, 0xCu);
    }

    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033B18;
    block[3] = &unk_100080F10;
    block[4] = self;
    dispatch_async(isolationQueue, block);
  }
}

+ (unint64_t)defaultOrigin
{
  return 1;
}

- (void)processRequest:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033BF4;
  v7[3] = &unk_100081738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

- (void)_processRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(NanoRoutePlanningSession *)self _cancelRequestIfNeeded];
  [(NanoRoutePlanningSession *)self _prepareForRequest:v4];
  [(NanoRoutePlanningSession *)self _broadcastIfNeeded];
  v5 = sub_100033510();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    objc_super v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%p] Will process request: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NanoRoutePlanningSession *)self _transitionToState:[(objc_class *)[(NanoRoutePlanningSession *)self _classForState:3] requiredInitialStateForRequest:v4]];
}

- (void)_prepareForRequest:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateIsolationQueue);
  self->_state = 0;
  int v6 = (NanoRoutePlanningMutableRequest *)[v5 mutableCopy];

  request = self->_request;
  self->_request = v6;

  __int16 v8 = objc_alloc_init(NanoRoutePlanningMutableResponse);
  [(NanoRoutePlanningSession *)self _setResponse:v8];

  stateIsolationQueue = self->_stateIsolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033DE8;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async(stateIsolationQueue, block);
}

- (void)_cancelRequestIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);

  [(NanoRoutePlanningSession *)self _transitionToState:0];
}

- (unint64_t)origin
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033F24;
  v6[3] = &unk_1000816F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)state
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033FEC;
  v6[3] = &unk_1000816F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NanoRoutePlanningRequest)request
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100033900;
  v11 = sub_100033910;
  id v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000340F8;
  v6[3] = &unk_1000816F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NanoRoutePlanningRequest *)v4;
}

- (NanoRoutePlanningResponse)response
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100033900;
  v11 = sub_100033910;
  id v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003423C;
  v6[3] = &unk_1000816F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NanoRoutePlanningResponse *)v4;
}

- (BOOL)shouldBroadcast
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003433C;
  v5[3] = &unk_1000816F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setShouldBroadcast:(BOOL)a3
{
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000343C8;
  v4[3] = &unk_100080F60;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(isolationQueue, v4);
}

- (BOOL)isLoading
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034484;
  v5[3] = &unk_1000816F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setRequest:(id)a3
{
  id v4 = [a3 mutableCopy];
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034540;
  v7[3] = &unk_100081738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

- (void)setResponse:(id)a3
{
  id v4 = [a3 mutableCopy];
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000345E8;
  v7[3] = &unk_100081738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

- (void)_setResponse:(id)a3
{
  BOOL v5 = (NanoRoutePlanningMutableResponse *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  response = self->_response;
  p_response = (id *)&self->_response;
  if (response != v5)
  {
    id v8 = sub_100033510();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = *p_response;
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing response from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong(p_response, a3);
  }
}

- (id)valueForUserInfoKey:(id)a3
{
  id v4 = a3;
  specific = (_UNKNOWN **)dispatch_get_specific(&off_100082270);
  stateIsolationQueue = self->_stateIsolationQueue;
  if (specific == &off_100082270)
  {
    dispatch_assert_queue_V2(stateIsolationQueue);
    id v8 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:v4];
  }
  else
  {
    dispatch_assert_queue_not_V2(stateIsolationQueue);
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_100033900;
    uint64_t v17 = sub_100033910;
    id v18 = 0;
    uint64_t v7 = self->_stateIsolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003483C;
    block[3] = &unk_100082280;
    __int16 v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(v7, block);
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  return v8;
}

- (void)setUserInfoKey:(id)a3 andValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  specific = (_UNKNOWN **)dispatch_get_specific(&off_100082270);
  stateIsolationQueue = self->_stateIsolationQueue;
  if (specific == &off_100082270)
  {
    dispatch_assert_queue_V2(stateIsolationQueue);
    [(NSMutableDictionary *)self->_userInfo setObject:v7 forKeyedSubscript:v6];
  }
  else
  {
    dispatch_assert_queue_not_V2(stateIsolationQueue);
    int v10 = self->_stateIsolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003498C;
    block[3] = &unk_100081D98;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_sync(v10, block);
  }
}

- (void)_broadcastIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_shouldBroadcast)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034A2C;
    block[3] = &unk_100080F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_notifySessionDidStartLoading
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034BE4;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifySessionDidUpdateResponse
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034D8C;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifySessionDidFail
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034F34;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifyDidInvalidate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000350C8;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_defaultClassesBySessionState
{
  if (qword_10009B7F8 != -1) {
    dispatch_once(&qword_10009B7F8, &stru_1000822A0);
  }
  v2 = (void *)qword_10009B7F0;

  return v2;
}

+ (void)setDefaultClass:(Class)a3 forSessionState:(int64_t)a4
{
  id v7 = [a1 _defaultClassesBySessionState];
  id v6 = +[NSNumber numberWithInteger:a4];
  [v7 setObject:a3 forKeyedSubscript:v6];
}

- (void)setNextClass:(Class)a3 forSessionState:(int64_t)a4
{
  classesBySessionState = self->_classesBySessionState;
  id v6 = +[NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)classesBySessionState setObject:a3 forKeyedSubscript:v6];
}

- (Class)_classForState:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)self->_classesBySessionState objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = v5;
    [(NSMutableDictionary *)self->_classesBySessionState setObject:0 forKeyedSubscript:v4];
    id v7 = v6;
  }
  else
  {
    id v8 = [(id)objc_opt_class() _defaultClassesBySessionState];
    id v7 = [v8 objectForKeyedSubscript:v4];
  }

  return (Class)v7;
}

- (void)updateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100035590;
    v6[3] = &unk_1000822C8;
    objc_copyWeak(&v8, &location);
    v6[4] = self;
    id v7 = v4;
    dispatch_async(isolationQueue, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_transitionToState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_state != a3)
  {
    id v5 = [(NanoRoutePlanningSession *)self _classForState:a3];
    [(NanoRoutePlanningSession *)self _transitionToState:a3 withClass:v5];
  }
}

- (void)_transitionToState:(int64_t)a3 withClass:(Class)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a4)
  {
    int64_t state = self->_state;
    [(NanoRoutePlanningState *)self->_stateObject leaveToState:a3];
    if (a3 < 1) {
      [(NanoRoutePlanningSession *)self _endTransaction];
    }
    else {
      [(NanoRoutePlanningSession *)self _startTransaction];
    }
    self->_int64_t state = a3;
    int v10 = (NanoRoutePlanningState *)[[a4 alloc] initWithStateManager:self isolationQueue:self->_stateIsolationQueue];
    stateObject = self->_stateObject;
    self->_stateObject = v10;

    id v12 = sub_100033510();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = sub_100014038(a3);
      v14 = NSStringFromClass(a4);
      int v15 = 134218498;
      v16 = self;
      __int16 v17 = 2112;
      id v18 = v13;
      __int16 v19 = 2112;
      objc_super v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%p] Will transition to state %@ with class %@", (uint8_t *)&v15, 0x20u);
    }
    [(NanoRoutePlanningState *)self->_stateObject enterToState:a3 fromState:state];
    [(NanoRoutePlanningSession *)self _notifyDidChangeFromState:state toState:self->_state];
  }
  else
  {
    id v8 = sub_100033510();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = sub_100014038(a3);
      int v15 = 134218242;
      v16 = self;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%p] No class found for state %@", (uint8_t *)&v15, 0x16u);
    }
    [(NanoRoutePlanningSession *)self _notifySessionDidFail];
  }
}

- (void)replaceWithStateOfClass:(Class)a3
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100035C64;
  v6[3] = &unk_1000822F0;
  objc_copyWeak(v7, &location);
  v6[4] = self;
  v7[1] = a3;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_notifyDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v7 = sub_100033510();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = sub_100014038(a3);
    id v9 = sub_100014038(a4);
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%p] State changed from '%@' to '%@'", (uint8_t *)&v11, 0x20u);
  }
  if (!a3) {
    [(NanoRoutePlanningSession *)self _notifySessionDidStartLoading];
  }
  if (a4 == 4)
  {
    int v10 = [(NanoRoutePlanningResponse *)self->_response lastError];

    if (v10) {
      [(NanoRoutePlanningSession *)self _notifySessionDidFail];
    }
    else {
      [(NanoRoutePlanningSession *)self _notifySessionDidUpdateResponse];
    }
  }
}

- (GEOComposedRoute)selectedRoute
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100033900;
  int v10 = sub_100033910;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035EFC;
  v5[3] = &unk_1000816F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOComposedRoute *)v3;
}

- (GEOCompanionRouteDetails)selectedCompanionRoute
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100033900;
  int v10 = sub_100033910;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003603C;
  v5[3] = &unk_1000816F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOCompanionRouteDetails *)v3;
}

- (void)setSelectedRoute:(id)a3
{
  if (a3)
  {
    id v4 = [a3 uniqueRouteID];
    [(NanoRoutePlanningSession *)self setSelectedRouteWithRouteID:v4];
  }
}

- (void)setSelectedCompanionRoute:(id)a3
{
  if (a3)
  {
    id v4 = [a3 routeID];
    id v5 = +[NSUUID _maps_UUIDWithData:v4];

    [(NanoRoutePlanningSession *)self setSelectedRouteWithRouteID:v5];
  }
}

- (void)setSelectedRouteWithRouteID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    isolationQueue = self->_isolationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v7[2] = sub_10003621C;
    v7[3] = &unk_100081738;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(isolationQueue, v7);
  }
}

- (void)_setSelectedRouteWithRouteID:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v4 = [(NanoRoutePlanningResponse *)self->_response selectedRouteID];
  if ((+[MNComparison isValue:v4 equalTo:v5] & 1) == 0)
  {
    [(NanoRoutePlanningResponse *)self->_response setSelectedRouteID:v5];
    [(NanoRoutePlanningSession *)self _notifySessionDidUpdateResponse];
  }
}

- (BOOL)hasReceivedAllExpectedRoutes
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036398;
  block[3] = &unk_100082318;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(isolationQueue, block);
  LOBYTE(isolationQueue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)isolationQueue;
}

- (BOOL)_hasReceivedAllExpectedRoutes
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  response = self->_response;
  if (response)
  {
    id v4 = [(NanoRoutePlanningResponse *)response expectedNumberOfRoutes];
    id v5 = [(NanoRoutePlanningResponse *)self->_response routes];
    id v6 = [v5 count];

    if (v4) {
      BOOL v7 = v6 == v4;
    }
    else {
      BOOL v7 = 0;
    }
    LOBYTE(response) = v7;
  }
  return (char)response;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___NanoRoutePlanningSessionObserver queue:0];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  [(NanoRoutePlanningSession *)self _assertNotInvalidated];
  if (v4)
  {
    id v5 = sub_100033510();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134218242;
      uint64_t v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] Adding observer: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(NanoRoutePlanningSession *)self observers];
    [v6 registerObserver:v4];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100033510();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134218242;
      uint64_t v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] Removing observer: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(NanoRoutePlanningSession *)self observers];
    [v6 unregisterObserver:v4];
  }
}

- (void)_startTransaction
{
  if (!self->_transaction)
  {
    id v3 = sub_100033510();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%p] Starting transaction", buf, 0xCu);
    }

    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 bundleIdentifier];
    id v6 = +[NSString stringWithFormat:@"%@.%@.%p", v5, objc_opt_class(), self];
    [v6 UTF8String];
    int v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;
  }
}

- (void)_endTransaction
{
  if (self->_transaction)
  {
    id v3 = sub_100033510();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%p] Ending transaction", (uint8_t *)&v5, 0xCu);
    }

    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_staleTimer, 0);
  objc_storeStrong((id *)&self->_classesBySessionState, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_stateObject, 0);
  objc_storeStrong((id *)&self->_stateIsolationQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)_anticipateRoutesWithRequest:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [(NanoRoutePlanningSession *)self _prepareForRequest:v5];

  [(NanoRoutePlanningSession *)self _broadcastIfNeeded];
  id v6 = sub_100033510();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [(NanoRoutePlanningRequest *)self->_request companionRouteContext];
    uint64_t v8 = [v7 simpleDescription];
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%p] Anticipate request with context %@", (uint8_t *)&v9, 0x16u);
  }
  [(NanoRoutePlanningSession *)self _transitionToState:3];
}

- (void)updateWithRequest:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036B18;
  block[3] = &unk_100081D98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, block);
}

- (void)_updateWithRequest:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100036EA0;
  v29[3] = &unk_100081D98;
  v29[4] = self;
  id v8 = v6;
  id v30 = v8;
  id v9 = v7;
  id v31 = v9;
  id v10 = objc_retainBlock(v29);
  __int16 v11 = (void (**)(void))v10;
  int64_t state = self->_state;
  if (state != 3)
  {
    if (state == 4)
    {
      ((void (*)(void *))v10[2])(v10);
      id v13 = sub_100033510();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [(NanoRoutePlanningRequest *)self->_request companionRouteContext];
        __int16 v15 = [v14 simpleDescription];
        *(_DWORD *)buf = 134218242;
        v33 = self;
        __int16 v34 = 2112;
        v35 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%p] Updating completed session with context %@, notify observers", buf, 0x16u);
      }
      [(NanoRoutePlanningSession *)self _notifySessionDidUpdateResponse];
      goto LABEL_20;
    }
    v16 = sub_100033510();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = [(NanoRoutePlanningRequest *)self->_request companionRouteContext];
      id v18 = [v17 simpleDescription];
      *(_DWORD *)buf = 134218242;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%p] Force anticipate request before updating request/response with context %@", buf, 0x16u);
    }
    [(NanoRoutePlanningSession *)self _anticipateRoutesWithRequest:v8];
  }
  v11[2](v11);
  unsigned int v19 = [v9 hasReceivedAllExpectedRoutes];
  objc_super v20 = [v9 lastError];

  if (v20 || v19)
  {
    v21 = sub_100033510();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v28 = [(NanoRoutePlanningRequest *)self->_request companionRouteContext];
      id v22 = [v28 simpleDescription];
      if (v19) {
        __int16 v23 = @"YES";
      }
      else {
        __int16 v23 = @"NO";
      }
      v24 = v23;
      v25 = [v9 lastError];
      if (v25) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      v27 = v26;
      *(_DWORD *)buf = 134218754;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v22;
      __int16 v36 = 2112;
      v37 = v24;
      __int16 v38 = 2112;
      v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%p] Updating request with context %@ (hasReceivedAllRoutes: %@, error: %@)", buf, 0x2Au);
    }
    [(NanoRoutePlanningSession *)self _transitionToState:4];
  }
LABEL_20:
}

+ (void)processRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_100033900;
  v16 = sub_100033910;
  __int16 v17 = objc_alloc_init(_NanoRoutePlanningSingleRequester);
  id v7 = (void *)v13[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003724C;
  v9[3] = &unk_100082340;
  id v8 = v6;
  id v10 = v8;
  __int16 v11 = &v12;
  [v7 processRequest:v5 withCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

@end