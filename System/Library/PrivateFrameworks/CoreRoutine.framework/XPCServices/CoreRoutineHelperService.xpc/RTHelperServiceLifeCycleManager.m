@interface RTHelperServiceLifeCycleManager
+ (id)createSourceForSignal:(int)a3 withBlock:(id)a4;
- (OS_dispatch_queue)queue;
- (RTHelperServiceLifeCycleManager)init;
- (RTHelperServiceLifeCycleManager)initWithEntitlementProvider:(id)a3 exitHandler:(id)a4 timerManager:(id)a5;
- (RTHelperServiceLifeCycleManager)initWithExitHandler:(id)a3;
- (void)_extendLifetime;
- (void)_handleLifeCycleTimerExpiration;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)serviceListener:(id)a3 didAcceptConnection:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation RTHelperServiceLifeCycleManager

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  [v10 retainArguments];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100007240;
  v27[4] = sub_100007238;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = NSStringFromSelector(a2);
  id v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];
  [v14 UTF8String];
  id v28 = (id)os_transaction_create();

  v15 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v30 = v20;
    __int16 v31 = 2112;
    v32 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004DD8;
  block[3] = &unk_100024AF8;
  BOOL v26 = a5;
  block[4] = self;
  id v23 = v10;
  id v24 = v9;
  v25 = v27;
  id v17 = v9;
  id v18 = v10;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v27, 8);
}

- (void)_extendLifetime
{
  v3 = sub_1000071D0(&qword_10002D388);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "extending the life time of the helper service.", v4, 2u);
  }

  xpc_transaction_interrupt_clean_exit();
  [(RTTimer *)self->_transactionTimer suspend];
  [(RTTimer *)self->_transactionTimer fireAfterDelay:120.0];
  [(RTTimer *)self->_transactionTimer resume];
}

+ (id)createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (RTHelperServiceLifeCycleManager)init
{
  uint64_t v2 = objc_opt_class();
  sub_10000BD50(v2, "initWithExitHandler:");
}

- (RTHelperServiceLifeCycleManager)initWithExitHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[RTEntitlementProvider helperServiceProtocolEntitlementProvider];
  v6 = objc_opt_new();
  v7 = [(RTHelperServiceLifeCycleManager *)self initWithEntitlementProvider:v5 exitHandler:v4 timerManager:v6];

  return v7;
}

- (RTHelperServiceLifeCycleManager)initWithEntitlementProvider:(id)a3 exitHandler:(id)a4 timerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    id v18 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: entitlementProvider";
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    id v18 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: exitHandler";
    goto LABEL_13;
  }
  if (!v11)
  {
    id v18 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_13;
    }
LABEL_14:

    id v20 = 0;
    goto LABEL_18;
  }
  v45.receiver = self;
  v45.super_class = (Class)RTHelperServiceLifeCycleManager;
  v13 = [(RTHelperServiceLifeCycleManager *)&v45 init];
  id v14 = v13;
  if (v13)
  {
    v15 = v13;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = (const char *)[(RTHelperServiceLifeCycleManager *)v15 UTF8String];
    }
    else
    {
      id v21 = +[NSString stringWithFormat:@"%@-%p", objc_opt_class(), v15];
      id v17 = (const char *)[v21 UTF8String];
    }
    dispatch_queue_t v22 = dispatch_queue_create(v17, v16);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v15->_entitlementProvider, a3);
    objc_storeStrong((id *)&v15->_timerManager, a5);
    id v24 = [v10 copy];
    id exitHandler = v15->_exitHandler;
    v15->_id exitHandler = v24;

    timerManager = v15->_timerManager;
    v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    v29 = v15->_queue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100014F48;
    v43[3] = &unk_1000245D8;
    id v30 = v15;
    v44 = v30;
    uint64_t v31 = [(RTTimerManager *)timerManager timerWithIdentifier:v28 queue:v29 handler:v43];
    id v32 = v30[4];
    v30[4] = (id)v31;

    [v30[4] fireAfterDelay:120.0];
    [v30[4] resume];
    uint64_t v33 = +[NSSet setWithObjects:@"routined", @"wedge", @"Routine", 0];
    id v34 = v30[3];
    v30[3] = (id)v33;

    uint64_t v35 = objc_opt_new();
    id v36 = v30[1];
    v30[1] = (id)v35;

    id v37 = v30[1];
    v38 = objc_opt_class();
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100014F50;
    v41[3] = &unk_1000245D8;
    v42 = v30;
    v39 = [v38 createSourceForSignal:15 withBlock:v41];
    [v37 addObject:v39];
  }
  self = v14;
  id v20 = self;
LABEL_18:

  return v20;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_signals;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v9 + 1) + 8 * (void)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(RTTimer *)self->_transactionTimer invalidate];
  v8.receiver = self;
  v8.super_class = (Class)RTHelperServiceLifeCycleManager;
  [(RTHelperServiceLifeCycleManager *)&v8 dealloc];
}

- (void)_handleLifeCycleTimerExpiration
{
  v3 = sub_1000071D0(&qword_10002D388);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "life cycle timer of the helper service expired.", v5, 2u);
  }

  id exitHandler = (void (**)(void))self->_exitHandler;
  if (exitHandler) {
    exitHandler[2]();
  }
}

- (void)serviceListener:(id)a3 didAcceptConnection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015214;
  v8[3] = &unk_100024600;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_exitHandler, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_transactionTimer, 0);
  objc_storeStrong((id *)&self->_allowedExecutables, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_signals, 0);
}

@end