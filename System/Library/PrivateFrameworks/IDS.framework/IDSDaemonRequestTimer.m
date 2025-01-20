@interface IDSDaemonRequestTimer
- (IDSDaemonRequestTimer)init;
- (id)_criticalFindRequestContextWithResponseHandler:(id)a3;
- (id)_criticalInvalidateTimeoutAndReturnHandlerForRequestID:(id)a3;
- (id)invalidateTimeoutAndReturnHandlerForRequestID:(id)a3;
- (id)invalidateTimeoutsAndReturnHandlersForAllRequests;
- (id)scheduleTimeoutWithResponseHandler:(id)a3 timeoutInterval:(double)a4 timeoutBlock:(id)a5;
- (int64_t)inFlightRequestCount;
- (void)_accessRequestContextMapInCriticalSectionWithBlock:(id)a3;
- (void)_criticalInvokeTimeoutBlockForRequestID:(id)a3;
- (void)_handleSystemTimerFired:(id)a3;
- (void)dealloc;
@end

@implementation IDSDaemonRequestTimer

- (void)_accessRequestContextMapInCriticalSectionWithBlock:(id)a3
{
  p_requestContextMapLock = &self->_requestContextMapLock;
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(p_requestContextMapLock);
  v4[2](v4);

  pthread_mutex_unlock(p_requestContextMapLock);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_requestContextMapLock);
  v3.receiver = self;
  v3.super_class = (Class)IDSDaemonRequestTimer;
  [(IDSDaemonRequestTimer *)&v3 dealloc];
}

- (IDSDaemonRequestTimer)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSDaemonRequestTimer;
  v2 = [(IDSDaemonRequestTimer *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestContextMap = v2->_requestContextMap;
    v2->_requestContextMap = v3;

    pthread_mutex_init(&v2->_requestContextMapLock, 0);
  }
  return v2;
}

- (int64_t)inFlightRequestCount
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1919B6294;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonRequestTimer *)self _accessRequestContextMapInCriticalSectionWithBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)scheduleTimeoutWithResponseHandler:(id)a3 timeoutInterval:(double)a4 timeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  id v11 = 0;
  if (v8)
  {
    if (a4 > 0.0 && v9 != 0)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = sub_191918750;
      v23 = sub_1919185C8;
      id v24 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1919B6440;
      v14[3] = &unk_1E572C198;
      v14[4] = self;
      id v15 = v8;
      v17 = &v19;
      double v18 = a4;
      id v16 = v10;
      [(IDSDaemonRequestTimer *)self _accessRequestContextMapInCriticalSectionWithBlock:v14];
      id v11 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }

  return v11;
}

- (id)_criticalFindRequestContextWithResponseHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableDictionary *)self->_requestContextMap allValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "responseHandler", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_handleSystemTimerFired:(id)a3
{
  id v4 = [a3 userInfo];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B6760;
  v6[3] = &unk_1E57291B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IDSDaemonRequestTimer *)self _accessRequestContextMapInCriticalSectionWithBlock:v6];
}

- (void)_criticalInvokeTimeoutBlockForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_requestContextMap objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 responseHandler];
    id v8 = [v7 queue];

    id v9 = [v6 timeoutBlock];
    id v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919B687C;
      block[3] = &unk_1E5728FD8;
      id v13 = v9;
      dispatch_async(v8, block);
    }
    [(NSMutableDictionary *)self->_requestContextMap removeObjectForKey:v4];
  }
}

- (id)invalidateTimeoutAndReturnHandlerForRequestID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_191918750;
  long long v15 = sub_1919185C8;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919B69B4;
  v8[3] = &unk_1E5729190;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(IDSDaemonRequestTimer *)self _accessRequestContextMapInCriticalSectionWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_criticalInvalidateTimeoutAndReturnHandlerForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_requestContextMap objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 killSystemTimer];
    id v7 = [v6 responseHandler];
    [(NSMutableDictionary *)self->_requestContextMap removeObjectForKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)invalidateTimeoutsAndReturnHandlersForAllRequests
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919B6B50;
  v9[3] = &unk_1E5728F38;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  SEL v11 = a2;
  [(IDSDaemonRequestTimer *)self _accessRequestContextMapInCriticalSectionWithBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
}

@end