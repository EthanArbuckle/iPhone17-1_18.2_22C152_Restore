@interface MCAddressCorrector
- (MCAddressCorrector)init;
- (void)_finishProcessing;
- (void)_sendUpdateRequest:(id)a3;
- (void)_startAddressCorrectionWithToken:(id)a3 personId:(id)a4;
- (void)startProcessingWithCompletionQueue:(id)a3 completionBlock:(id)a4;
@end

@implementation MCAddressCorrector

- (MCAddressCorrector)init
{
  v9.receiver = self;
  v9.super_class = (Class)MCAddressCorrector;
  v2 = [(MCAddressCorrector *)&v9 init];
  if (v2)
  {
    GEOConfigGetDouble();
    v2->_lastRunTime = v3;
    v2->_daysToNextRun = GEOConfigGetInteger();
    v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    processingLock = v2->_processingLock;
    v2->_processingLock = v4;

    uint64_t v6 = geo_dispatch_queue_create_with_qos();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)startProcessingWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  v7 = a3;
  processingLock = self->_processingLock;
  id v9 = a4;
  if ([(NSLock *)processingLock tryLock])
  {
    objc_storeStrong((id *)&self->_completionQueue, a3);
    id v10 = [v9 copy];

    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v10;

    id v9 = +[MCPolarisUtils sharedUtils];
    if ([v9 hasSufficientLocationAuth])
    {
      if ([v9 isMultiUserMode])
      {
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v13 = "startProcessing - failed. Not available in multi-user mode.";
          goto LABEL_20;
        }
      }
      else if ([v9 isManagedAppleAccount])
      {
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v13 = "startProcessing - failed. Not available for managed Apple Accounts.";
          goto LABEL_20;
        }
      }
      else if ([v9 isUserOptedIn])
      {
        if (![v9 isAddressCorrectionAdministrativelyDisabled])
        {
          double Current = CFAbsoluteTimeGetCurrent();
          double lastRunTime = self->_lastRunTime;
          if (lastRunTime > 0.0)
          {
            double v19 = lastRunTime + (double)self->_daysToNextRun * 86400.0;
            if (Current < v19)
            {
              v12 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_22;
              }
              double v20 = self->_lastRunTime;
              *(_DWORD *)buf = 134218496;
              double v29 = v20;
              __int16 v30 = 2048;
              double v31 = Current;
              __int16 v32 = 2048;
              double v33 = v19;
              v13 = "startProcessing - failed. Too early. LastRunTime %f CurrentTime %f shouldRunAfter %f";
              v15 = v12;
              uint32_t v16 = 32;
              goto LABEL_21;
            }
          }
          if ([v9 hasPrimaryAppleAccount])
          {
            v21 = [v9 appleAccountMapsToken];

            if (v21)
            {
              v22 = objc_alloc_init(MCRoutineHelper);
              routineHelper = self->_routineHelper;
              self->_routineHelper = v22;

              v24 = self->_routineHelper;
              workQueue = self->_workQueue;
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = sub_10000484C;
              v26[3] = &unk_10001C7A8;
              v26[4] = self;
              id v9 = v9;
              id v27 = v9;
              [(MCRoutineHelper *)v24 findSignificantLocationWithCompletionQueue:workQueue completionHandler:v26];

              goto LABEL_23;
            }
            v12 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_22;
            }
            *(_WORD *)buf = 0;
            v13 = "startProcessing - failed. Do not have an auth token";
          }
          else
          {
            v12 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_22;
            }
            *(_WORD *)buf = 0;
            v13 = "startProcessing - failed. There is no primary account on the device";
          }
LABEL_20:
          v15 = v12;
          uint32_t v16 = 2;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v13, buf, v16);
          goto LABEL_22;
        }
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v13 = "startProcessing - failed. Address correction not supported in current country";
          goto LABEL_20;
        }
      }
      else
      {
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v13 = "startProcessing - failed. Not authorized";
          goto LABEL_20;
        }
      }
    }
    else
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v13 = "startProcessing - failed. No location auth.";
        goto LABEL_20;
      }
    }
LABEL_22:

    [(MCAddressCorrector *)self _finishProcessing];
    goto LABEL_23;
  }
  v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "startProcessing called but already processing", buf, 2u);
  }

  dispatch_async(v7, v9);
LABEL_23:
}

- (void)_finishProcessing
{
  routineHelper = self->_routineHelper;
  self->_routineHelper = 0;

  id completionBlock = self->_completionBlock;
  v5 = self->_completionQueue;
  id block = objc_retainBlock(completionBlock);
  completionQueue = self->_completionQueue;
  self->_completionQueue = 0;

  id v7 = self->_completionBlock;
  self->_id completionBlock = 0;

  dispatch_async((dispatch_queue_t)v5, block);
  [(NSLock *)self->_processingLock unlock];
}

- (void)_startAddressCorrectionWithToken:(id)a3 personId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)GEOAddressCorrectionInitRequest);
  [v8 setPersonID:v6];

  [v8 setToken:v7];
  [v8 setSupportsMultipleAddresses:1];
  [v8 setSupportsCollectionByRegion:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004BE8;
  v14[3] = &unk_10001C7F8;
  v14[4] = self;
  id v9 = objc_retainBlock(v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005220;
  v13[3] = &unk_10001C820;
  v13[4] = self;
  id v10 = objc_retainBlock(v13);
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_startAddressCorrection Request : %{private}@", buf, 0xCu);
  }

  v12 = +[GEOAddressCorrectionRequester sharedRequester];
  [v12 startAddressCorrectionInitRequest:v8 finished:v9 error:v10];
}

- (void)_sendUpdateRequest:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005498;
  v10[3] = &unk_10001C848;
  v10[4] = self;
  v5 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005638;
  v9[3] = &unk_10001C820;
  v9[4] = self;
  id v6 = objc_retainBlock(v9);
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_sendUpdateResponse updateRequest : %{private}@", buf, 0xCu);
  }

  id v8 = +[GEOAddressCorrectionRequester sharedRequester];
  [v8 startAddressCorrectionUpdateRequest:v4 finished:v5 error:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_routineHelper, 0);

  objc_storeStrong((id *)&self->_processingLock, 0);
}

@end