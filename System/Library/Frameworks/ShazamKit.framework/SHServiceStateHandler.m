@interface SHServiceStateHandler
+ (NSMapTable)globallyScopedWorkers;
+ (OS_dispatch_queue)globalQueue;
- (BOOL)hasRegisteredWorkers;
- (BOOL)service:(id)a3 registerWorker:(id)a4 watchdogTimeout:(double)a5 error:(id *)a6;
- (NSLock)lock;
- (NSMapTable)workers;
- (SHClientCredentials)clientCredentials;
- (SHServiceStateHandler)initWithClientCredentials:(id)a3;
- (id)allWorkersForService:(id)a3;
- (id)registeredWorkerForWorkerID:(id)a3;
- (void)service:(id)a3 unregisterWorker:(id)a4;
- (void)unregisterAllWorkersForService:(id)a3;
@end

@implementation SHServiceStateHandler

- (SHServiceStateHandler)initWithClientCredentials:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SHServiceStateHandler;
  v6 = [(SHServiceStateHandler *)&v18 init];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v6->_lock;
    v6->_lock = v7;

    objc_storeStrong((id *)&v6->_clientCredentials, a3);
    v9 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    workers = v6->_workers;
    v6->_workers = v9;

    v11 = [(SHClientCredentials *)v6->_clientCredentials attribution];
    v12 = [v11 bundleIdentifier];
    unsigned int v13 = +[SHAttribution requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:v12];

    if (v13)
    {
      +[SHServiceStateHandlerUtilities registerMusicRecognitionBundleAttribution];
    }
    else
    {
      v14 = [(SHClientCredentials *)v6->_clientCredentials attribution];
      v15 = v14;
      if (v14) {
        [v14 auditToken];
      }
      else {
        memset(v17, 0, sizeof(v17));
      }
      +[SHServiceStateHandlerUtilities registerBundleAttributionForAuditToken:v17];
    }
  }

  return v6;
}

+ (NSMapTable)globallyScopedWorkers
{
  if (qword_100090A08 != -1) {
    dispatch_once(&qword_100090A08, &stru_100074BC0);
  }
  v2 = (void *)qword_100090A00;

  return (NSMapTable *)v2;
}

+ (OS_dispatch_queue)globalQueue
{
  if (qword_100090A18 != -1) {
    dispatch_once(&qword_100090A18, &stru_100074BE0);
  }
  v2 = (void *)qword_100090A10;

  return (OS_dispatch_queue *)v2;
}

- (BOOL)service:(id)a3 registerWorker:(id)a4 watchdogTimeout:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [v11 workerID];
  unsigned int v13 = [(SHServiceStateHandler *)self registeredWorkerForWorkerID:v12];

  if (v13)
  {
    if (a6)
    {
      *a6 = +[SHCoreError errorWithCode:106 underlyingError:0];
    }
  }
  else
  {
    v14 = [(SHServiceStateHandler *)self lock];
    [v14 lock];

    v15 = objc_alloc_init(SHWatchdogTimer);
    v16 = [(SHServiceStateHandler *)self workers];
    [v16 setObject:v15 forKey:v11];

    if (a5 > 0.0)
    {
      objc_initWeak(&location, v11);
      v17 = sh_log_object();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v11;
        __int16 v28 = 2048;
        double v29 = a5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Worker %@ started watchdog timer for %f seconds", buf, 0x16u);
      }

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100003754;
      v23[3] = &unk_100074C08;
      objc_copyWeak(&v24, &location);
      [(SHWatchdogTimer *)v15 startWatchdogTimerForInterval:v23 firedCompletion:a5];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    if ([v11 executionScope] == (id)1)
    {
      objc_super v18 = +[SHServiceStateHandler globalQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003794;
      block[3] = &unk_100074C30;
      id v22 = v11;
      dispatch_sync(v18, block);
    }
    v19 = [(SHServiceStateHandler *)self lock];
    [v19 unlock];
  }
  return v13 == 0;
}

- (void)service:(id)a3 unregisterWorker:(id)a4
{
  id v5 = a4;
  v6 = [(SHServiceStateHandler *)self lock];
  [v6 lock];

  v7 = [(SHServiceStateHandler *)self workers];
  v8 = [v7 objectForKey:v5];

  [v8 stopWatchdogTimer];
  v9 = [(SHServiceStateHandler *)self workers];
  [v9 removeObjectForKey:v5];

  if ([v5 executionScope] == (id)1)
  {
    id v10 = +[SHServiceStateHandler globalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000394C;
    block[3] = &unk_100074C30;
    id v13 = v5;
    dispatch_sync(v10, block);
  }
  id v11 = [(SHServiceStateHandler *)self lock];
  [v11 unlock];
}

- (void)unregisterAllWorkersForService:(id)a3
{
  v4 = [(SHServiceStateHandler *)self lock];
  [v4 lock];

  id v5 = [(SHServiceStateHandler *)self workers];
  [v5 removeAllObjects];

  id v6 = [(SHServiceStateHandler *)self lock];
  [v6 unlock];
}

- (id)allWorkersForService:(id)a3
{
  v4 = [(SHServiceStateHandler *)self lock];
  [v4 lock];

  id v5 = [(SHServiceStateHandler *)self workers];
  id v6 = [v5 copy];

  v7 = [(SHServiceStateHandler *)self lock];
  [v7 unlock];

  return v6;
}

- (id)registeredWorkerForWorkerID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHServiceStateHandler *)self lock];
  [v5 lock];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(SHServiceStateHandler *)self workers];
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = [v10 workerID];
        unsigned __int8 v12 = [v11 isEqual:v4];

        if (v12)
        {
          v16 = [(SHServiceStateHandler *)self lock];
          [v16 unlock];

          id v15 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = [(SHServiceStateHandler *)self lock];
  [v13 unlock];

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100003D58;
  v25 = sub_100003D68;
  id v26 = 0;
  v14 = +[SHServiceStateHandler globalQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100003D70;
  v18[3] = &unk_100074C58;
  v20 = &v21;
  id v19 = v4;
  dispatch_sync(v14, v18);

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

LABEL_11:

  return v15;
}

- (BOOL)hasRegisteredWorkers
{
  v3 = [(SHServiceStateHandler *)self lock];
  [v3 lock];

  id v4 = [(SHServiceStateHandler *)self workers];
  BOOL v5 = [v4 count] != 0;

  id v6 = [(SHServiceStateHandler *)self lock];
  [v6 unlock];

  return v5;
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (NSMapTable)workers
{
  return self->_workers;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_workers, 0);

  objc_storeStrong((id *)&self->_clientCredentials, 0);
}

@end