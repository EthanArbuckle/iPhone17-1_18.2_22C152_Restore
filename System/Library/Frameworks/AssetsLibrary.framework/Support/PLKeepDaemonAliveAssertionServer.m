@interface PLKeepDaemonAliveAssertionServer
+ (void)start;
- (PLKeepDaemonAliveAssertionServer)init;
- (void)_deactivateCameraSession;
- (void)_registerNewConnection:(id)a3;
- (void)_startServer;
- (void)dealloc;
@end

@implementation PLKeepDaemonAliveAssertionServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskConstraintCoordinator, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)_registerNewConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  v5 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PLKeepDaemonAliveAssertionServer: activating camera session task constraints", v6, 2u);
  }

  [(PLCameraCaptureTaskConstraintCoordinator *)self->_taskConstraintCoordinator activateCameraSessionTaskConstraints];
  xpc_connection_set_event_handler(v4, &stru_10002D108);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_connectionQueue);
  xpc_connection_set_context(v4, (void *)qword_100034E78);
  xpc_connection_set_finalizer_f(v4, (xpc_finalizer_t)sub_10001383C);
  xpc_connection_resume(v4);
}

- (void)_deactivateCameraSession
{
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PLKeepDaemonAliveAssertionServer: deactivating camera session task constraints", v4, 2u);
  }

  [(PLCameraCaptureTaskConstraintCoordinator *)self->_taskConstraintCoordinator deactivateCameraSessionTaskConstraints];
}

- (void)_startServer
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(PLKeepDaemonAliveServiceName, (dispatch_queue_t)self->_connectionQueue, 1uLL);
  CFRetain(mach_service);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013AB4;
  handler[3] = &unk_10002D0C8;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
}

- (void)dealloc
{
  [(PLCameraCaptureTaskConstraintCoordinator *)self->_taskConstraintCoordinator invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLKeepDaemonAliveAssertionServer;
  [(PLKeepDaemonAliveAssertionServer *)&v3 dealloc];
}

- (PLKeepDaemonAliveAssertionServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLKeepDaemonAliveAssertionServer;
  v2 = [(PLKeepDaemonAliveAssertionServer *)&v9 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = pl_dispatch_queue_create_with_fallback_qos();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    v6 = (PLCameraCaptureTaskConstraintCoordinator *)[objc_alloc((Class)PLCameraCaptureTaskConstraintCoordinator) initWithTaskContstraintRole:1 name:@"PLKeepDaemonAliveAssertionServer"];
    taskConstraintCoordinator = v2->_taskConstraintCoordinator;
    v2->_taskConstraintCoordinator = v6;

    [(PLKeepDaemonAliveAssertionServer *)v2 _startServer];
  }
  return v2;
}

+ (void)start
{
}

@end