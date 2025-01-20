@interface CKDiscretionaryTask
- (BOOL)isSpringBoardApp;
- (BOOL)running;
- (CKDOperationCallbackProxy)callbackProxy;
- (CKDiscretionaryClientConnection)connection;
- (CKDiscretionaryOptions)options;
- (CKDiscretionarySchedulerTask)task;
- (CKDiscretionaryTask)initWithConnection:(id)a3 operationID:(id)a4 group:(id)a5 bundleID:(id)a6 isSpringBoardApp:(BOOL)a7 requiresPastBuddy:(BOOL)a8 options:(id)a9 schedulerClass:(Class)a10 startHandler:(id)a11 suspendHandler:(id)a12;
- (Class)schedulerClass;
- (NDApplication)application;
- (NSString)bundleID;
- (NSString)cloudDocsContainerID;
- (NSString)operationID;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)resourceTimer;
- (OS_os_transaction)transaction;
- (id)_schedulerTaskIdentifier;
- (id)startHandler;
- (id)suspendHandler;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)complete;
- (void)dealloc;
- (void)setApplication:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCallbackProxy:(id)a3;
- (void)setCloudDocsContainerID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setOperationID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResourceTimer:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSchedulerClass:(Class)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStartHandler:(id)a3;
- (void)setSuspendHandler:(id)a3;
- (void)setTask:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation CKDiscretionaryTask

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = [(CKDiscretionaryTask *)self operationID];
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "applicationEnteredForeground, updating priority of %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000039A0;
  block[3] = &unk_100010598;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (CKDiscretionarySchedulerTask)task
{
  return self->_task;
}

- (CKDiscretionaryOptions)options
{
  return self->_options;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (CKDiscretionaryTask)initWithConnection:(id)a3 operationID:(id)a4 group:(id)a5 bundleID:(id)a6 isSpringBoardApp:(BOOL)a7 requiresPastBuddy:(BOOL)a8 options:(id)a9 schedulerClass:(Class)a10 startHandler:(id)a11 suspendHandler:(id)a12
{
  BOOL v64 = a8;
  id v17 = a3;
  id v65 = a4;
  id v66 = a5;
  id v67 = a6;
  id v70 = a9;
  id v69 = a11;
  id v68 = a12;
  v79.receiver = self;
  v79.super_class = (Class)CKDiscretionaryTask;
  v18 = [(CKDiscretionaryTask *)&v79 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_33;
  }
  objc_storeWeak((id *)&v18->_connection, v17);
  uint64_t v20 = [v17 serialQueue];
  serialQueue = v19->_serialQueue;
  v19->_serialQueue = (OS_dispatch_queue *)v20;

  objc_storeStrong((id *)&v19->_operationID, a4);
  p_options = (id *)&v19->_options;
  objc_storeStrong((id *)&v19->_options, a9);
  objc_storeStrong((id *)&v19->_schedulerClass, a10);
  id v23 = [v69 copy];
  id startHandler = v19->_startHandler;
  v19->_id startHandler = v23;

  id v25 = [v68 copy];
  id suspendHandler = v19->_suspendHandler;
  v19->_id suspendHandler = v25;

  p_bundleID = &v19->_bundleID;
  objc_storeStrong((id *)&v19->_bundleID, a6);
  v19->_isSpringBoardApp = a7;
  uint64_t v28 = os_transaction_create();
  transaction = v19->_transaction;
  v19->_transaction = (OS_os_transaction *)v28;

  v30 = [v70 applicationBundleIdentifierOverride];
  v31 = v30;
  if (!v30) {
    v31 = *p_bundleID;
  }
  v32 = [v70 secondarySourceApplicationBundleId];
  uint64_t v33 = +[NDCloudContainer containerIDForPrimaryIdentifier:v31 secondaryIdentifier:v32];
  cloudDocsContainerID = v19->_cloudDocsContainerID;
  v19->_cloudDocsContainerID = (NSString *)v33;

  if (v17
    && v19->_serialQueue
    && v19->_operationID
    && *p_options
    && v19->_schedulerClass
    && v19->_startHandler
    && v19->_suspendHandler
    && *p_bundleID
    && v19->_transaction)
  {
    id v35 = [*p_options discretionaryNetworkBehavior];
    if (v35 == (id)2)
    {
      uint64_t v36 = 4;
    }
    else if (v35 == (id)1)
    {
      v49 = [(CKDiscretionaryTask *)v19 application];
      [v49 addObserver:v19];
      if ([v49 hasForegroundBackgroundStates]
        && ![v49 isForeground])
      {
        uint64_t v36 = 3;
      }
      else
      {
        uint64_t v36 = 2;
      }
    }
    else
    {
      uint64_t v36 = v35 == 0;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v50 = (void *)ck_log_facility_ckdd;
    if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
    {
      v51 = v50;
      v52 = [(CKDiscretionaryTask *)v19 operationID];
      v53 = sub_100006FE0(v36);
      *(_DWORD *)buf = 138543618;
      v81 = v52;
      __int16 v82 = 2114;
      id v83 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%{public}@ scheduling in state %{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v19);
    v54 = v19->_serialQueue;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100005CC4;
    v76[3] = &unk_100010548;
    objc_copyWeak(&v78, (id *)buf);
    v55 = v19;
    v77 = v55;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100005E74;
    v74[3] = &unk_100010570;
    objc_copyWeak(&v75, (id *)buf);
    uint64_t v56 = [(objc_class *)a10 scheduleOperationID:v65 group:v66 bundleID:v67 requiresPastBuddy:v64 options:v70 state:v36 queue:v54 startHandler:v76 suspendHandler:v74];
    v57 = v55[15];
    v55[15] = v56;

    dispatch_source_t v58 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v19->_serialQueue);
    [v55 setResourceTimer:v58];

    v59 = v55[13];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005F94;
    handler[3] = &unk_100010598;
    objc_copyWeak(&v73, (id *)buf);
    dispatch_source_set_event_handler(v59, handler);
    [v70 timeoutIntervalForResource];
    dispatch_time_t v61 = dispatch_time(0, (uint64_t)(v60 * 1000000000.0));
    dispatch_source_set_timer(v55[13], v61, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate(v55[13]);
    if (v55[15])
    {
      objc_destroyWeak(&v73);
      objc_destroyWeak(&v75);

      objc_destroyWeak(&v78);
      objc_destroyWeak((id *)buf);
LABEL_33:
      v38 = v19;
      goto LABEL_34;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v63 = ck_log_facility_ckdd;
    if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v71 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to initialize CKDiscretionarySchedulerTask for CKDiscretionaryTask", v71, 2u);
    }
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);

    objc_destroyWeak(&v78);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v37 = (void *)ck_log_facility_ckdd;
    if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_ERROR))
    {
      v40 = v19->_serialQueue;
      operationID = v19->_operationID;
      Class schedulerClass = v19->_schedulerClass;
      options = v19->_options;
      id v42 = v19->_startHandler;
      v44 = v37;
      id v45 = objc_retainBlock(v42);
      id v46 = objc_retainBlock(v19->_suspendHandler);
      v47 = v19->_transaction;
      bundleID = v19->_bundleID;
      *(_DWORD *)buf = 134220032;
      v81 = v40;
      __int16 v82 = 2048;
      id v83 = v17;
      __int16 v84 = 2048;
      v85 = operationID;
      __int16 v86 = 2048;
      v87 = options;
      __int16 v88 = 2048;
      Class v89 = schedulerClass;
      __int16 v90 = 2048;
      id v91 = v45;
      __int16 v92 = 2048;
      id v93 = v46;
      __int16 v94 = 2048;
      v95 = v47;
      __int16 v96 = 2048;
      v97 = bundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Missing critical attribute for initilization of CKDiscretionaryTask. serialQueue:%p, connection:%p, operationID:%p, options:%p, scheduler:%p, startHandler:%p, suspendHandler:%p, transaction:%p, bundleID:%p", buf, 0x5Cu);
    }
  }
  v38 = 0;
LABEL_34:

  return v38;
}

- (void)dealloc
{
  [(CKDiscretionaryTask *)self setTask:0];
  [(CKDiscretionaryTask *)self setResourceTimer:0];
  v3.receiver = self;
  v3.super_class = (Class)CKDiscretionaryTask;
  [(CKDiscretionaryTask *)&v3 dealloc];
}

- (void)setResourceTimer:(id)a3
{
  id v4 = (OS_dispatch_source *)a3;
  resourceTimer = self->_resourceTimer;
  if (resourceTimer != v4 && resourceTimer != 0)
  {
    dispatch_source_cancel(resourceTimer);
    resourceTimer = self->_resourceTimer;
  }
  self->_resourceTimer = v4;
}

- (void)setTask:(id)a3
{
  id v4 = (CKDiscretionarySchedulerTask *)a3;
  task = self->_task;
  if (task != v4 && task != 0)
  {
    if (self->_running) {
      [(CKDiscretionarySchedulerTask *)task finish];
    }
    else {
      [(CKDiscretionarySchedulerTask *)task cancel];
    }
  }
  v7 = self->_task;
  self->_task = v4;
}

- (NDApplication)application
{
  if (self->_application) {
    goto LABEL_16;
  }
  if (!self->_cloudDocsContainerID)
  {
    v9 = [(CKDiscretionaryOptions *)self->_options applicationBundleIdentifierOverride];
    bundleID = v9;
    if (!v9) {
      bundleID = self->_bundleID;
    }
    v6 = bundleID;

    if ([(NSString *)self->_bundleID isEqualToString:v6])
    {
      p_isa = self->_bundleID;
      if (self->_isSpringBoardApp)
      {
LABEL_11:
        v12 = +[NDApplication springboardApplicationWithBundleIdentifier:p_isa];
LABEL_14:
        application = self->_application;
        self->_application = v12;

        goto LABEL_15;
      }
    }
    else
    {
      unsigned __int8 v13 = +[NDApplication springBoardApplicationExistsWithIdentifier:v6];
      p_isa = (NSString *)&v6->isa;
      if (v13) {
        goto LABEL_11;
      }
    }
    v12 = +[NDApplication applicationWithIdentifier:p_isa];
    goto LABEL_14;
  }
  +[NDApplication cloudContainerWithIdentifier:](NDCloudContainer, "cloudContainerWithIdentifier:");
  objc_super v3 = (NDApplication *)objc_claimAutoreleasedReturnValue();
  id v4 = self->_application;
  self->_application = v3;

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = [(CKDiscretionaryTask *)self operationID];
    cloudDocsContainerID = self->_cloudDocsContainerID;
    int v17 = 138412546;
    v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = cloudDocsContainerID;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{public}%@ monitoring cloud docs container ID %{public}@", (uint8_t *)&v17, 0x16u);

LABEL_15:
  }
LABEL_16:
  v15 = self->_application;
  return v15;
}

- (id)_schedulerTaskIdentifier
{
  objc_super v3 = +[NSMutableString stringWithFormat:@"ckdiscretionaryd:%@", self->_operationID];
  if (self->_cloudDocsContainerID)
  {
    [v3 appendFormat:@":clouddocs-%@", self->_cloudDocsContainerID];
  }
  else
  {
    id v4 = [(CKDiscretionaryOptions *)self->_options applicationBundleIdentifierOverride];

    bundleID = self->_bundleID;
    if (v4)
    {
      v6 = [(CKDiscretionaryOptions *)self->_options applicationBundleIdentifierOverride];
      [v3 appendFormat:@":%@-%@", bundleID, v6];
    }
    else
    {
      [v3 appendFormat:@":%@", self->_bundleID];
    }
  }
  return v3;
}

- (void)applicationNoLongerInForeground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = [(CKDiscretionaryTask *)self operationID];
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "applicationNoLongerInForeground, updating priority of %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006738;
  block[3] = &unk_100010598;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)complete
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v3 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = [(CKDiscretionaryTask *)self operationID];
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ complete", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006998;
  block[3] = &unk_1000105C0;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (CKDOperationCallbackProxy)callbackProxy
{
  return self->_callbackProxy;
}

- (void)setCallbackProxy:(id)a3
{
}

- (CKDiscretionaryClientConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (CKDiscretionaryClientConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setOperationID:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (void)setSuspendHandler:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (NSString)cloudDocsContainerID
{
  return self->_cloudDocsContainerID;
}

- (void)setCloudDocsContainerID:(id)a3
{
}

- (void)setApplication:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)resourceTimer
{
  return self->_resourceTimer;
}

- (Class)schedulerClass
{
  return self->_schedulerClass;
}

- (void)setSchedulerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_schedulerClass, 0);
  objc_storeStrong((id *)&self->_resourceTimer, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_cloudDocsContainerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_suspendHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_callbackProxy, 0);
}

@end