@interface DDRWorker
- (DDRProgress)progress;
- (DDRScheduler)resetScheduler;
- (DDRWorker)initWithQueue:(id)a3;
- (DDRWorkerDelegate)delegate;
- (OS_dispatch_queue)workerQueue;
- (id)completionBlock;
- (void)didCompleteAllTasks;
- (void)progressDidUpdateWithPercentage:(double)a3;
- (void)resetDataWithRequest:(id)a3 completion:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResetScheduler:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation DDRWorker

- (DDRWorker)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDRWorker;
  v5 = [(DDRWorker *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DDRWorker *)v5 setWorkerQueue:v4];
  }

  return v6;
}

- (void)resetDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(DDRWorker *)self setCompletionBlock:a4];
  v7 = DDRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "entering data reset scheduler phase", buf, 2u);
  }

  id v42 = [v6 mode];
  switch((unint64_t)v42)
  {
    case 1uLL:
      v11 = DDRLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "data reset mode scene understanding data reset", buf, 2u);
      }

      v12 = DDRSchedulerResetSceneUnderstandingData;
      goto LABEL_17;
    case 2uLL:
      v13 = DDRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "data reset mode networksettings reset", buf, 2u);
      }

      v12 = DDRSchedulerResetNetworkSettings;
      goto LABEL_17;
    case 3uLL:
      v14 = DDRLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "data reset mode allsettings reset", buf, 2u);
      }

      v12 = DDRSchedulerResetAllSettings;
LABEL_17:
      v9 = (DDRSchedulerPreObliterate *)objc_alloc_init(v12);
      goto LABEL_18;
    case 4uLL:
    case 5uLL:
      objc_super v8 = DDRLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "data reset mode data partition reset", buf, 2u);
      }

      v9 = [[DDRSchedulerPreObliterate alloc] initWithRequest:v6];
LABEL_18:
      v10 = v9;
      -[DDRWorker setResetScheduler:](self, "setResetScheduler:", v9, v42);
      [(DDRSchedulerPreObliterate *)v10 configureTasks];
      break;
    default:
      v10 = 0;
      break;
  }
  v15 = DDRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "calling data reset in XPCService worker", buf, 2u);
  }
  v44 = self;

  v43 = v10;
  v16 = [(DDRSchedulerPreObliterate *)v10 scheduledTasks];
  v17 = dispatch_queue_create("com.apple.devicedatareset.taskqueue", 0);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v51;
    double v22 = 0.0;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v25 = DDRLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v24 identifier];
          *(_DWORD *)buf = 138412290;
          id v56 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Prereset with task: %@", buf, 0xCu);
        }
        [v24 configure];
        [v24 estimatedTimeOfCompletion];
        double v28 = v27;
        v29 = DDRLogForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [v24 identifier];
          *(_DWORD *)buf = 138412546;
          id v56 = v30;
          __int16 v57 = 2048;
          double v58 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Estimate completion time for reset task: %@ is %lf", buf, 0x16u);
        }
        double v22 = v22 + v28;
      }
      id v20 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v20);
  }
  else
  {
    double v22 = 0.0;
  }

  v31 = -[DDRProgress initWithTotalDuration:totalTaskCount:progressTickInterval:]([DDRProgress alloc], "initWithTotalDuration:totalTaskCount:progressTickInterval:", [v18 count], v22, 0.05);
  [(DDRWorker *)v44 setProgress:v31];

  v32 = [(DDRWorker *)v44 progress];
  [v32 setDelegate:v44];

  v33 = [(DDRWorker *)v44 delegate];
  v34 = [(DDRWorker *)v44 resetScheduler];
  objc_msgSend(v33, "resetWithModeDidBegin:", objc_msgSend(v34, "mode"));

  v35 = DDRLogForCategory(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v56 = v42;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Starting reset for mode: %ld", buf, 0xCu);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v36 = v18;
  id v37 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v47;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008318;
        block[3] = &unk_100010628;
        block[4] = v41;
        block[5] = v44;
        dispatch_async(v17, block);
      }
      id v38 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v38);
  }
}

- (void)progressDidUpdateWithPercentage:(double)a3
{
  v5 = [(DDRWorker *)self workerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008534;
  v6[3] = &unk_100010788;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)didCompleteAllTasks
{
  v3 = [(DDRWorker *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000086AC;
  block[3] = &unk_1000107B0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (DDRWorkerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDRWorkerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DDRScheduler)resetScheduler
{
  return self->_resetScheduler;
}

- (void)setResetScheduler:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (DDRProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_resetScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end