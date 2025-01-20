@interface AKRequestDispatcher
+ (id)sharedDispatcher;
- (AKRequestDispatcher)init;
- (BOOL)_executeScheduledRequest:(id)a3;
- (BOOL)_unsafe_executeNextScheduledRequest;
- (id)_dispatchingAlgorithmForInfo:(id)a3;
- (id)_nextScheduledRequest;
- (id)_orderedDispatchingInfoKeys;
- (void)_insertScheduledRequest:(id)a3;
- (void)_invalidateScheduledRequest:(id)a3 withErrorCode:(int64_t)a4;
- (void)_scheduleNextRequest;
- (void)_setDispatchingAlgorithm:(id)a3 forInfo:(id)a4;
- (void)_unsafe_cancelScheduler;
- (void)_unsafe_scheduleNextRequest;
- (void)_unsafe_scheduleRequestWithDispatchInterval:(double)a3;
- (void)_unsafe_schedulerSourceDidFire;
- (void)_updateDispatchingAlgorithmForInfo:(id)a3 withResponse:(id)a4;
- (void)submitDispatchableRequest:(id)a3;
@end

@implementation AKRequestDispatcher

- (AKRequestDispatcher)init
{
  v11.receiver = self;
  v11.super_class = (Class)AKRequestDispatcher;
  v2 = [(AKRequestDispatcher *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.akd.request-dispatcher.scheduler", v3);
    schedulerQueue = v2->_schedulerQueue;
    v2->_schedulerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    dispatchingAlgorithmsByInfo = v2->_dispatchingAlgorithmsByInfo;
    v2->_dispatchingAlgorithmsByInfo = (NSMutableDictionary *)v6;

    v2->_dispatchingAlgorithmsByInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMutableArray array];
    scheduledRequests = v2->_scheduledRequests;
    v2->_scheduledRequests = (NSMutableArray *)v8;

    v2->_scheduledRequestsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFD70;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272598 != -1) {
    dispatch_once(&qword_100272598, block);
  }
  v2 = (void *)qword_100272590;

  return v2;
}

- (void)submitDispatchableRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 dispatchingInfo];
  uint64_t v6 = [(AKRequestDispatcher *)self _dispatchingAlgorithmForInfo:v5];
  v7 = [v6 nextCalculation];
  uint64_t v8 = +[_AKScheduledRequest scheduledRequestWithCalculation:v7 forRequest:v4 info:v5];
  v9 = [v8 calculation];

  if (v9)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Scheduling request (%@) with calculation (%@)", (uint8_t *)&v13, 0x20u);
    }

    [(AKRequestDispatcher *)self _insertScheduledRequest:v8];
    [(AKRequestDispatcher *)self _scheduleNextRequest];
  }
  else
  {
    objc_super v11 = _AKLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v12)
      {
        int v13 = 138412802;
        v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Unable to schedule request (%@) with algorithm (%@)", (uint8_t *)&v13, 0x20u);
      }

      [(AKRequestDispatcher *)self _invalidateScheduledRequest:v8 withErrorCode:-7109];
    }
    else
    {
      if (v12)
      {
        int v13 = 138412546;
        v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Immediately executing request (%@)", (uint8_t *)&v13, 0x16u);
      }

      [(AKRequestDispatcher *)self _executeScheduledRequest:v8];
    }
  }
}

- (void)_scheduleNextRequest
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  schedulerQueue = self->_schedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0060;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_sync(schedulerQueue, block);
}

- (void)_unsafe_scheduleNextRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  v3 = [(AKRequestDispatcher *)self _nextScheduledRequest];
  id v4 = [v3 calculation];
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412802;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    v10 = v3;
    __int16 v11 = 2112;
    BOOL v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: Scheduling next request (%@) with calculation (%@)", (uint8_t *)&v7, 0x20u);
  }

  if (v4)
  {
    uint64_t v6 = [v4 dispatchDate];
    [v6 timeIntervalSinceNow];
    -[AKRequestDispatcher _unsafe_scheduleRequestWithDispatchInterval:](self, "_unsafe_scheduleRequestWithDispatchInterval:");
  }
  else
  {
    uint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100190978((uint64_t)self, v6);
    }
  }
}

- (void)_unsafe_scheduleRequestWithDispatchInterval:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  [(AKRequestDispatcher *)self _unsafe_cancelScheduler];
  v5 = _AKLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 <= 0.0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412546;
      __int16 v17 = self;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Firing scheduler source immediately (dispatchInterval: %.2f)", buf, 0x16u);
    }

    [(AKRequestDispatcher *)self _unsafe_schedulerSourceDidFire];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412546;
      __int16 v17 = self;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Creating scheduler source (dispatchInterval: %.2f)", buf, 0x16u);
    }

    int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_schedulerQueue);
    if (v7)
    {
      dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000B04B4;
      handler[3] = &unk_10022AE50;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = *(id *)&a3;
      dispatch_source_set_registration_handler(v7, handler);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000B051C;
      v12[3] = &unk_10022AE50;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = *(id *)&a3;
      dispatch_source_set_cancel_handler(v7, v12);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000B0584;
      v10[3] = &unk_10022AE50;
      objc_copyWeak(v11, (id *)buf);
      v11[1] = *(id *)&a3;
      dispatch_source_set_event_handler(v7, v10);
      dispatch_resume(v7);
      objc_storeStrong((id *)&self->_schedulerSource, v7);
      objc_destroyWeak(v11);
      objc_destroyWeak(v13);
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1001909F0((uint64_t)self, v9, a3);
      }
    }
  }
}

- (void)_unsafe_cancelScheduler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  source = self->_schedulerSource;
  if (source) {
    dispatch_source_cancel((dispatch_source_t)source);
  }
  schedulerSource = self->_schedulerSource;
  self->_schedulerSource = 0;
}

- (void)_unsafe_schedulerSourceDidFire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100190B4C((uint64_t)self, v3);
  }

  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  while ([(AKRequestDispatcher *)self _unsafe_executeNextScheduledRequest])
    ;
  os_unfair_lock_unlock(&self->_scheduledRequestsLock);
  [(AKRequestDispatcher *)self _unsafe_scheduleNextRequest];
}

- (BOOL)_unsafe_executeNextScheduledRequest
{
  v3 = [(NSMutableArray *)self->_scheduledRequests firstObject];
  BOOL v4 = [(AKRequestDispatcher *)self _executeScheduledRequest:v3];
  if (v4 && [(NSMutableArray *)self->_scheduledRequests count]) {
    [(NSMutableArray *)self->_scheduledRequests removeObjectAtIndex:0];
  }

  return v4;
}

- (BOOL)_executeScheduledRequest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_3;
  }
  BOOL v6 = [v4 calculation];
  int v7 = [v6 dispatchDate];
  [v7 timeIntervalSinceNow];
  double v9 = v8;

  if (v9 <= 0.0)
  {
    BOOL v12 = [v5 calculation];
    v10 = [v12 headerValue];

    if (v10)
    {
      int v13 = [v5 request];
      uint64_t v29 = AKDispatchingAlgorithmStateHeader;
      v30 = v10;
      v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [v13 setAdditionalHeaders:v14];
    }
    __int16 v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v5 request];
      __int16 v17 = [v5 calculation];
      *(_DWORD *)buf = 138412802;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v16;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Executing request (%@) with calculation (%@)", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    __int16 v18 = [v5 request];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B0A68;
    v20[3] = &unk_10022AE78;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v5;
    [v18 executeWithResponseHandler:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
    BOOL v11 = 1;
  }
  else
  {
LABEL_3:
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100190BD4((uint64_t)self, v5, v10);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_invalidateScheduledRequest:(id)a3 withErrorCode:(int64_t)a4
{
  id v6 = [a3 request];
  v5 = +[NSError ak_errorWithCode:a4];
  [v6 invalidateWithError:v5];
}

- (id)_dispatchingAlgorithmForInfo:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_dispatchingAlgorithmsByInfoLock);
  v5 = [(NSMutableDictionary *)self->_dispatchingAlgorithmsByInfo objectForKeyedSubscript:v4];
  id v6 = [v4 mutableCopy];
  [(AKRequestDispatcher *)self _orderedDispatchingInfoKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      if (v5) {
        break;
      }
      objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
      dispatchingAlgorithmsByInfo = self->_dispatchingAlgorithmsByInfo;
      id v13 = [v6 copy];
      v5 = [(NSMutableDictionary *)dispatchingAlgorithmsByInfo objectForKeyedSubscript:v13];

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(&self->_dispatchingAlgorithmsByInfoLock);

  return v5;
}

- (void)_setDispatchingAlgorithm:(id)a3 forInfo:(id)a4
{
  p_dispatchingAlgorithmsByInfoLock = &self->_dispatchingAlgorithmsByInfoLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_dispatchingAlgorithmsByInfoLock);
  [(NSMutableDictionary *)self->_dispatchingAlgorithmsByInfo setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_dispatchingAlgorithmsByInfoLock);
}

- (void)_updateDispatchingAlgorithmForInfo:(id)a3 withResponse:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [(AKRequestDispatcher *)self _dispatchingAlgorithmForInfo:v24];

  if (!v7)
  {
    objc_opt_class();
    id v8 = [v6 objectForKeyedSubscript:@"ralg"];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    objc_opt_class();
    id v10 = [v6 objectForKeyedSubscript:@"maxqueue_size"];
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    id v12 = [v11 unsignedIntegerValue];
    if (v12) {
      uint64_t v13 = (uint64_t)v12;
    }
    else {
      uint64_t v13 = 10;
    }

    if ([v9 isEqualToString:@"E"])
    {
      objc_opt_class();
      id v14 = [v6 objectForKeyedSubscript:@"base"];
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }

      [v15 doubleValue];
      double v19 = v18;

      v20 = [[AKExponentialDispatchingAlgorithm alloc] initWithBase:v13 maxQueueSize:v19];
    }
    else
    {
      if (![v9 isEqualToString:@"D"])
      {
        id v21 = 0;
LABEL_23:
        [(AKRequestDispatcher *)self _setDispatchingAlgorithm:v21 forInfo:v24];

        goto LABEL_24;
      }
      objc_opt_class();
      id v16 = [v6 objectForKeyedSubscript:@"delay"];
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }

      [v17 doubleValue];
      double v23 = v22;

      v20 = [[AKConstantDispatchingAlgorithm alloc] initWithDelay:v13 maxQueueSize:v23];
    }
    id v21 = v20;
    goto LABEL_23;
  }
LABEL_24:
}

- (id)_nextScheduledRequest
{
  p_scheduledRequestsLock = &self->_scheduledRequestsLock;
  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  id v4 = [(NSMutableArray *)self->_scheduledRequests firstObject];
  os_unfair_lock_unlock(p_scheduledRequestsLock);

  return v4;
}

- (void)_insertScheduledRequest:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  if ([(NSMutableArray *)self->_scheduledRequests count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [(NSMutableArray *)self->_scheduledRequests objectAtIndexedSubscript:v4];
      id v6 = [v11 calculation];
      id v7 = [v6 dispatchDate];
      id v8 = [v5 calculation];
      id v9 = [v8 dispatchDate];
      id v10 = [v7 compare:v9];

      if (v10 == (id)1) {
        break;
      }
      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_scheduledRequests count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v4 = 0;
  }
  [(NSMutableArray *)self->_scheduledRequests insertObject:v11 atIndex:v4];
  os_unfair_lock_unlock(&self->_scheduledRequestsLock);
}

- (id)_orderedDispatchingInfoKeys
{
  if (qword_1002725A8 != -1) {
    dispatch_once(&qword_1002725A8, &stru_10022AE98);
  }
  v2 = (void *)qword_1002725A0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledRequests, 0);
  objc_storeStrong((id *)&self->_dispatchingAlgorithmsByInfo, 0);
  objc_storeStrong((id *)&self->_schedulerSource, 0);

  objc_storeStrong((id *)&self->_schedulerQueue, 0);
}

@end