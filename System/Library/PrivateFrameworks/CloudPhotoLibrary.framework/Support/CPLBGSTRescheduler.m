@interface CPLBGSTRescheduler
- (BGNonRepeatingSystemTaskRequest)request;
- (BOOL)shouldConsiderRequestingMoreTime;
- (BOOL)shouldDefer;
- (CPLBGSTRescheduler)initWithRequest:(id)a3 reschedulerManager:(id)a4;
- (CPLBGSTReschedulerManager)reschedulerManager;
- (CPLBackgroundActivity)currentActivity;
- (Class)requestClass;
- (NSError)acquireError;
- (NSString)description;
- (NSString)goodConditionsDescription;
- (NSString)taskIdentifier;
- (OS_dispatch_queue)queue;
- (double)estimatedRemainingTime;
- (double)estimatedRunningTime;
- (id)acquireBackgroundActivityWithCompletionHandler:(id)a3;
- (int64_t)activityState;
- (void)_dropTaskRequest;
- (void)_registerFromPersistentSyncSessionWithLaunchBlock:(id)a3;
- (void)_scheduleBlockedTimeout;
- (void)_sessionIsDoneOrWontHappen;
- (void)_sessionTimerFired;
- (void)_setCurrentActivity:(id)a3;
- (void)_submitTaskRequest;
- (void)_unscheduleBlockedTimeout;
- (void)_updateAcquireError:(id)a3;
- (void)_updateRequestIfNecessary;
- (void)_updateTaskIdentifierWithRequest:(id)a3;
- (void)acquiredTask:(id)a3;
- (void)activityHasExpired:(id)a3;
- (void)deferWithBlock:(id)a3;
- (void)dropBackgroundActivityRequest:(id)a3;
- (void)engineIsClosing;
- (void)failedToAcquireTaskWithError:(id)a3;
- (void)getStartDate:(id *)a3 acquireDate:(id *)a4 expireDate:(id *)a5;
- (void)sessionIsDone;
- (void)sessionWontHappen;
- (void)updateSyncSessionPrediction:(id)a3;
@end

@implementation CPLBGSTRescheduler

- (CPLBGSTRescheduler)initWithRequest:(id)a3 reschedulerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLBGSTRescheduler;
  v9 = [(CPLBGSTRescheduler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_reschedulerManager, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [v8 queue];
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    [(CPLBGSTRescheduler *)v10 _updateTaskIdentifierWithRequest:v10->_request];
  }

  return v10;
}

- (NSString)taskIdentifier
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = sub_100029C58;
  v15 = sub_100029C68;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100029C70;
  id v8 = &unk_100275F88;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v4;
}

- (double)estimatedRunningTime
{
  uint64_t v11 = 0;
  v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100029D90;
  id v8 = &unk_100275F88;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  double v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)_updateTaskIdentifierWithRequest:(id)a3
{
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100029E8C;
  id v8 = &unk_100276018;
  v9 = self;
  id v4 = a3;
  id v10 = v4;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (NSError)acquireError
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100029C58;
  v15 = sub_100029C68;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_10002A078;
  id v8 = &unk_100275F88;
  v9 = self;
  id v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSError *)v4;
}

- (void)_updateAcquireError:(id)a3
{
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_10002A174;
  id v8 = &unk_100276018;
  v9 = self;
  id v4 = a3;
  id v10 = v4;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLBGSTRescheduler *)self taskIdentifier];
  id v6 = [v3 initWithFormat:@"[%@ %p for %@]", v4, self, v5];

  return (NSString *)v6;
}

- (Class)requestClass
{
  return [(CPLBGSTReschedulerManager *)self->_reschedulerManager requestClass];
}

- (void)getStartDate:(id *)a3 acquireDate:(id *)a4 expireDate:(id *)a5
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100029C58;
  v33 = sub_100029C68;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100029C58;
  v27 = sub_100029C68;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100029C58;
  v21 = sub_100029C68;
  id v22 = 0;
  p_lock = &self->_lock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  uint64_t v11 = sub_10002A438;
  v12 = &unk_100277188;
  uint64_t v13 = self;
  uint64_t v14 = &v29;
  v15 = &v23;
  id v16 = &v17;
  v9 = v10;
  os_unfair_lock_lock(p_lock);
  v11(v9);
  os_unfair_lock_unlock(p_lock);

  *a3 = (id) v30[5];
  *a4 = (id) v24[5];
  *a5 = (id) v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)_submitTaskRequest
{
  if (!self->_submitted)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10002A598();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        id v7 = self;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Acquiring Task for %@", (uint8_t *)&v6, 0xCu);
      }
    }
    uint64_t v4 = [(CPLBGSTReschedulerManager *)self->_reschedulerManager now];
    startDate = self->_startDate;
    self->_startDate = v4;

    [(CPLBGSTRescheduler *)self _scheduleBlockedTimeout];
    self->_submitted = 1;
    [(CPLBGSTReschedulerManager *)self->_reschedulerManager submitTaskRequestForRescheduler:self];
  }
}

- (void)_dropTaskRequest
{
  if (self->_submitted)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = sub_10002A598();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        id v7 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering %@", (uint8_t *)&v6, 0xCu);
      }
    }
    if ([(NSMutableDictionary *)self->_requests count])
    {
      sub_1001C5ACC(self, a2);
    }
    else
    {
      v5 = [(CPLBGSTRescheduler *)self currentActivity];

      if (!v5)
      {
        [(CPLBGSTReschedulerManager *)self->_reschedulerManager dropTaskRequest:self->_request forRescheduler:self];
        self->_submitted = 0;
        [(CPLBGSTRescheduler *)self _unscheduleBlockedTimeout];
        return;
      }
    }
    sub_1001C59B0(self, a2);
  }
}

- (void)_setCurrentActivity:(id)a3
{
  p_lock = &self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v8 = sub_10002A7F4;
  v9 = &unk_100276018;
  id v5 = a3;
  id v10 = v5;
  uint64_t v11 = self;
  int v6 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);
}

- (void)acquiredTask:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CPLBGSTRescheduler *)self _unscheduleBlockedTimeout];
  int v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v29 = CPLSyncSessionBlockedStateIsBlockedKey;
  v30 = &__kCFBooleanFalse;
  id v8 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [v6 postNotificationName:v7 object:self userInfo:v8];

  startDate = self->_startDate;
  id v10 = [(CPLBGSTReschedulerManager *)self->_reschedulerManager now];
  [(NSDate *)startDate timeIntervalSinceDate:v10];
  double v12 = -v11;

  if (!self->_sessionIsDone)
  {
    uint64_t v14 = [(CPLBGSTRescheduler *)self currentActivity];

    if (v14) {
      sub_1001C5C50((uint64_t)self);
    }
    v15 = [[CPLBGSTActivity alloc] initWithTask:v5 request:self->_request rescheduler:self];
    [(CPLBGSTRescheduler *)self _setCurrentActivity:v15];
    if ([(NSMutableDictionary *)self->_requests count])
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_10002A598();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = (CPLBGSTRescheduler *)[(NSMutableDictionary *)self->_requests count];
          int v21 = 138413058;
          id v22 = v5;
          __int16 v23 = 2112;
          v24 = self;
          __int16 v25 = 2048;
          v26 = v17;
          __int16 v27 = 2048;
          double v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Acquired %@ for %@ - %lu interested clients (took %.3fs)", (uint8_t *)&v21, 0x2Au);
        }
      }
      [(NSMutableDictionary *)self->_requests enumerateKeysAndObjectsUsingBlock:&stru_1002771C8];
      p_super = &self->_requests->super.super;
      self->_requests = 0;
    }
    else
    {
      deferBlock = (void (**)(void))self->_deferBlock;
      if (!deferBlock) {
        sub_1001C5BC8((uint64_t)a2, (uint64_t)self, (uint64_t)v5);
      }
      if (self->_isClosing)
      {
        if (_CPLSilentLogging) {
          goto LABEL_15;
        }
        p_super = sub_10002A598();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412802;
          id v22 = v5;
          __int16 v23 = 2112;
          v24 = self;
          __int16 v25 = 2048;
          v26 = *(CPLBGSTRescheduler **)&v12;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Acquired Background %@ for %@ but we are closing (took %.3fs)", (uint8_t *)&v21, 0x20u);
        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v20 = sub_10002A598();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 138412802;
            id v22 = v5;
            __int16 v23 = 2112;
            v24 = self;
            __int16 v25 = 2048;
            v26 = *(CPLBGSTRescheduler **)&v12;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Re-acquired Background %@ for %@ - resuming deferred activity (took %.3fs)", (uint8_t *)&v21, 0x20u);
          }

          deferBlock = (void (**)(void))self->_deferBlock;
        }
        deferBlock[2]();
        p_super = self->_deferBlock;
        self->_deferBlock = 0;
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v13 = sub_10002A598();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412802;
      id v22 = v5;
      __int16 v23 = 2048;
      v24 = *(CPLBGSTRescheduler **)&v12;
      __int16 v25 = 2112;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Acquired %@ (took %.3fs) for %@ but we are already done", (uint8_t *)&v21, 0x20u);
    }
  }
  [v5 setTaskCompleted];
  [(CPLBGSTRescheduler *)self _dropTaskRequest];
LABEL_16:
}

- (void)failedToAcquireTaskWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CPLBGSTRescheduler *)self _updateAcquireError:v4];
  [(CPLBGSTRescheduler *)self _unscheduleBlockedTimeout];
  startDate = self->_startDate;
  int v6 = [(CPLBGSTReschedulerManager *)self->_reschedulerManager now];
  [(NSDate *)startDate timeIntervalSinceDate:v6];
  double v8 = -v7;

  if ([(NSMutableDictionary *)self->_requests count])
  {
    if (!_CPLSilentLogging)
    {
      v9 = sub_10002A598();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(NSMutableDictionary *)self->_requests count];
        *(_DWORD *)buf = 138412802;
        id v22 = self;
        __int16 v23 = 2048;
        double v24 = *(double *)&v10;
        __int16 v25 = 2048;
        double v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to acquire Background task for %@ - %lu interested clients (took %.3fs)", buf, 0x20u);
      }
    }
    requests = self->_requests;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002AF84;
    v19[3] = &unk_1002771F0;
    v20 = v4;
    [(NSMutableDictionary *)requests enumerateKeysAndObjectsUsingBlock:v19];
    double v12 = self->_requests;
    self->_requests = 0;

    uint64_t v13 = v20;
    goto LABEL_7;
  }
  deferBlock = (void (**)(void))self->_deferBlock;
  if (!deferBlock)
  {
    if (_CPLSilentLogging) {
      goto LABEL_8;
    }
    uint64_t v13 = sub_10002A598();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    id v22 = self;
    __int16 v23 = 2112;
    double v24 = *(double *)&v4;
    v15 = "Failed to acquire task for %@ while we are not interested: %@";
    id v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_17;
  }
  if (!self->_isClosing)
  {
    if (!_CPLSilentLogging)
    {
      v18 = sub_10002A598();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v22 = self;
        __int16 v23 = 2048;
        double v24 = v8;
        __int16 v25 = 2112;
        double v26 = *(double *)&v4;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to re-acquire Background task for %@ - resuming deferred activity (took %.3fs): %@", buf, 0x20u);
      }

      deferBlock = (void (**)(void))self->_deferBlock;
    }
    deferBlock[2]();
    uint64_t v13 = self->_deferBlock;
    self->_deferBlock = 0;
    goto LABEL_7;
  }
  if (_CPLSilentLogging) {
    goto LABEL_8;
  }
  uint64_t v13 = sub_10002A598();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = self;
    __int16 v23 = 2048;
    double v24 = v8;
    __int16 v25 = 2112;
    double v26 = *(double *)&v4;
    v15 = "Failed to acquire Background task for %@ but we are closing (took %.3fs): %@";
    id v16 = v13;
    uint32_t v17 = 32;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_7:

LABEL_8:
}

- (void)activityHasExpired:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002B0B8;
  v11[3] = &unk_100277218;
  id v12 = v5;
  uint64_t v13 = self;
  SEL v14 = a2;
  double v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v16 = v7;
  double v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_updateRequestIfNecessary
{
  if (self->_submitted)
  {
    id v3 = [(CPLBGSTRescheduler *)self acquireError];
    if (!v3)
    {
      id v3 = [(CPLBGSTRescheduler *)self currentActivity];
      if (!v3)
      {
        if (!self->_updatedPrediction) {
          return;
        }
        -[CPLBGSTReschedulerManager updateTaskRequest:updatedPrediction:](self->_reschedulerManager, "updateTaskRequest:updatedPrediction:", self->_request);
        obj = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue();
        updatedPrediction = self->_updatedPrediction;
        self->_updatedPrediction = 0;

        id v3 = obj;
        if (obj != self->_request)
        {
          objc_storeStrong((id *)&self->_request, obj);
          [(CPLBGSTRescheduler *)self _updateTaskIdentifierWithRequest:self->_request];
          id v3 = obj;
        }
      }
    }
  }
}

- (void)_registerFromPersistentSyncSessionWithLaunchBlock:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v6 = objc_retainBlock(v5);

  id deferBlock = self->_deferBlock;
  self->_id deferBlock = v6;

  double v8 = [(CPLBGSTReschedulerManager *)self->_reschedulerManager now];
  startDate = self->_startDate;
  self->_startDate = v8;

  self->_submitted = 1;
  [(CPLBGSTRescheduler *)self _scheduleBlockedTimeout];
}

- (BOOL)shouldDefer
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_10002B538;
  double v7 = &unk_100275F88;
  double v8 = self;
  id v9 = &v10;
  id v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (int64_t)activityState
{
  v2 = [(CPLBGSTRescheduler *)self currentActivity];
  if (v2) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (BOOL)shouldConsiderRequestingMoreTime
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = (void (*)(void *))sub_10002B6B0;
  double v7 = &unk_1002768A8;
  double v8 = self;
  id v9 = &v10;
  int64_t v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6(v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (double)estimatedRemainingTime
{
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x40AC200000000000;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  double v7 = sub_10002B81C;
  double v8 = &unk_1002768A8;
  id v9 = self;
  uint64_t v10 = &v11;
  int64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  double v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)deferWithBlock:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002B9C4;
  v11[3] = &unk_100276970;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  double v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v15 = v7;
  double v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_sessionIsDoneOrWontHappen
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sessionIsDone)
  {
    self->_sessionIsDone = 1;
    id deferBlock = self->_deferBlock;
    self->_id deferBlock = 0;

    id v5 = [(CPLBGSTRescheduler *)self currentActivity];
    if (v5)
    {
      double v4 = [v5 task];
      [v4 setTaskCompleted];

      [(CPLBGSTRescheduler *)self _setCurrentActivity:0];
    }
    [(CPLBGSTRescheduler *)self _dropTaskRequest];
  }
}

- (void)sessionIsDone
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002C10C;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)sessionWontHappen
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002C204;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)engineIsClosing
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002C2FC;
  v6[3] = &unk_100275EC8;
  v6[4] = self;
  void v6[5] = a2;
  int64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  double v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (NSString)goodConditionsDescription
{
  id v3 = objc_alloc((Class)NSString);
  double v4 = [(CPLBGSTRescheduler *)self taskIdentifier];
  id v5 = [v3 initWithFormat:@"Acquiring a Background System Task %@", v4];

  return (NSString *)v5;
}

- (void)updateSyncSessionPrediction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10002C688;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  double v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (CPLBackgroundActivity)currentActivity
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100029C58;
  id v15 = sub_100029C68;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  double v7 = sub_10002C918;
  id v8 = &unk_100275F88;
  dispatch_block_t v9 = self;
  dispatch_block_t v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLBackgroundActivity *)v4;
}

- (id)acquireBackgroundActivityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002CA80;
  v15[3] = &unk_100276AC8;
  v15[4] = self;
  id v17 = v4;
  id v7 = v5;
  id v16 = v7;
  id v8 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v19 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v4;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

  id v12 = v16;
  id v13 = v7;

  return v13;
}

- (void)dropBackgroundActivityRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10002CC80;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030468;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_scheduleBlockedTimeout
{
  id v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v15 = CPLSyncSessionBlockedStateSyncRequestedKey;
  id v16 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v3 postNotificationName:v4 object:self userInfo:v5];

  [(CPLBGSTRescheduler *)self _unscheduleBlockedTimeout];
  id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  syncTimer = self->_syncTimer;
  self->_syncTimer = v6;

  id v8 = self->_syncTimer;
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x3B9ACA00uLL);
  id v10 = self->_syncTimer;
  id v11 = self->_syncTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002CEA0;
  handler[3] = &unk_100276018;
  handler[4] = self;
  uint64_t v14 = v10;
  id v12 = v10;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_syncTimer);
}

- (void)_unscheduleBlockedTimeout
{
  syncTimer = self->_syncTimer;
  if (syncTimer)
  {
    dispatch_source_cancel(syncTimer);
    uint64_t v4 = self->_syncTimer;
    self->_syncTimer = 0;
  }
}

- (void)_sessionTimerFired
{
  id v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = CPLSyncSessionBlockedStateDidChangeNotification;
  uint64_t v6 = CPLSyncSessionBlockedStateIsBlockedKey;
  id v7 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:v4 object:self userInfo:v5];

  [(CPLBGSTRescheduler *)self _unscheduleBlockedTimeout];
}

- (BGNonRepeatingSystemTaskRequest)request
{
  return self->_request;
}

- (CPLBGSTReschedulerManager)reschedulerManager
{
  return self->_reschedulerManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reschedulerManager, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_acquireError, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_updatedPrediction, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_acquiredDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_deferBlock, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end