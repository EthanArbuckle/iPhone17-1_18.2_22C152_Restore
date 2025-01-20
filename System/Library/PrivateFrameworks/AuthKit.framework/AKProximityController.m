@interface AKProximityController
- (AKProximityController)initWithEngine:(id)a3;
- (AKProximityEngine)engine;
- (BOOL)_isEngineActivated;
- (BOOL)isActivated;
- (double)timeout;
- (id)invalidationHandler;
- (void)_activateEngine;
- (void)_invalidateEngine;
- (void)_prepareEngine;
- (void)_unsafe_InvalidateEngine;
- (void)_unsafe_cancelEngineTimeoutSource;
- (void)_unsafe_resumeEngineTimeoutSource;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)proximityEngine:(id)a3 managerDidUpdateState:(id)a4;
- (void)proximityEngineDidActivate:(id)a3;
- (void)proximityEngineDidInvalidate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AKProximityController

- (AKProximityController)initWithEngine:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKProximityController;
  v6 = [(AKProximityController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engine, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.proximity-controller", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.proximity-controller-engine", v11);
    engineQueue = v7->_engineQueue;
    v7->_engineQueue = (OS_dispatch_queue *)v12;

    v7->_timeout = 300.0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001808EC(v3);
  }

  [(AKProximityController *)self _unsafe_InvalidateEngine];
  v4.receiver = self;
  v4.super_class = (Class)AKProximityController;
  [(AKProximityController *)&v4 dealloc];
}

- (void)activate
{
  [(AKProximityController *)self invalidate];

  [(AKProximityController *)self _prepareEngine];
}

- (void)invalidate
{
}

- (BOOL)isActivated
{
  return [(AKProximityController *)self _isEngineActivated];
}

- (void)_prepareEngine
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E430;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_activateEngine
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E528;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidateEngine
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E610;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_isEngineActivated
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = v2->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E6E4;
  v5[3] = &unk_100228178;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_unsafe_InvalidateEngine
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100180AA8(self);
  }

  [(AKProximityController *)self _unsafe_cancelEngineTimeoutSource];
  objc_super v4 = [(AKProximityController *)self engine];
  [v4 invalidate];
}

- (void)_unsafe_resumeEngineTimeoutSource
{
  p_engineTimeoutSource = &self->_engineTimeoutSource;
  engineTimeoutSource = self->_engineTimeoutSource;
  id v5 = _AKLogSystem();
  dispatch_source_t v6 = v5;
  if (engineTimeoutSource)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100180C38();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100180BAC(self);
    }

    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    if (v6)
    {
      [(AKProximityController *)self timeout];
      dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v7 * 1000000000.0));
      dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak(&location, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10003EA08;
      handler[3] = &unk_100227678;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_registration_handler(v6, handler);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003EA60;
      v12[3] = &unk_100227678;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_cancel_handler(v6, v12);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10003EAB8;
      v10[3] = &unk_100227678;
      objc_copyWeak(&v11, &location);
      dispatch_source_set_event_handler(v6, v10);
      dispatch_resume(v6);
      objc_storeStrong((id *)p_engineTimeoutSource, v6);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      char v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100180B38();
      }
    }
  }
}

- (void)_unsafe_cancelEngineTimeoutSource
{
  if (self->_engineTimeoutSource)
  {
    v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100180DE4();
    }

    dispatch_source_cancel((dispatch_source_t)self->_engineTimeoutSource);
    engineTimeoutSource = self->_engineTimeoutSource;
    self->_engineTimeoutSource = 0;
  }
}

- (void)proximityEngine:(id)a3 managerDidUpdateState:(id)a4
{
  id v5 = a4;
  switch((unint64_t)[v5 state])
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      dispatch_source_t v6 = _AKLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100180E4C((uint64_t)self, v5, v6);
      }

      break;
    case 2uLL:
      double v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100180F04();
      }
      goto LABEL_9;
    case 3uLL:
      double v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100180F7C();
      }
LABEL_9:

      [(AKProximityController *)self invalidate];
      break;
    case 5uLL:
      dispatch_time_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        v10 = self;
        __int16 v11 = 2112;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Manager (%@) reported powered-on state", (uint8_t *)&v9, 0x16u);
      }

      [(AKProximityController *)self _activateEngine];
      break;
    default:
      break;
  }
}

- (void)proximityEngineDidActivate:(id)a3
{
  id v3 = a3;
  objc_super v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100180FF4();
  }
}

- (void)proximityEngineDidInvalidate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EE8C;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_async(queue, block);
  dispatch_source_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10018105C();
  }

  double v7 = [(AKProximityController *)self invalidationHandler];

  if (v7)
  {
    dispatch_time_t v8 = [(AKProximityController *)self invalidationHandler];
    v8[2]();
  }
}

- (AKProximityEngine)engine
{
  return self->_engine;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_engineTimeoutSource, 0);
  objc_storeStrong((id *)&self->_engineQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end