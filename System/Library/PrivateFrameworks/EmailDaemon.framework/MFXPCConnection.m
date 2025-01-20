@interface MFXPCConnection
- (BOOL)shouldCancel;
- (MFXPCConnection)initWithConnection:(id)a3;
- (MailXPCServices)serviceManager;
- (id)errorHandler;
- (void)dealloc;
- (void)handleError:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setServiceManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MFXPCConnection

- (MFXPCConnection)initWithConnection:(id)a3
{
  v6 = (_xpc_connection_s *)a3;
  v23.receiver = self;
  v23.super_class = (Class)MFXPCConnection;
  id v7 = [(MFXPCConnection *)&v23 init];
  if (v7)
  {
    id v8 = [objc_alloc((Class)MFLock) initWithName:@"XPC ErrorHandler" andDelegate:0];
    v9 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v8;

    id v10 = +[NSString stringWithFormat:@"com.apple.mobilemail.services.connection.%p", v7];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    v12 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v11;

    v13 = +[NSString stringWithFormat:@"com.apple.mobilemail.services.connection.message.%p", v7];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    v16 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v15;

    xpc_connection_set_target_queue(v6, *((dispatch_queue_t *)v7 + 2));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003AAE4;
    handler[3] = &unk_10013AF28;
    v17 = (id *)v7;
    v21 = v17;
    SEL v22 = a2;
    xpc_connection_set_event_handler(v6, handler);
    objc_storeStrong(v17 + 1, a3);
    v18 = v17;
  }
  else
  {
    xpc_connection_cancel(v6);
  }

  return (MFXPCConnection *)v7;
}

- (void)dealloc
{
  if (self->_connection) {
    [(MFXPCConnection *)self stop];
  }
  v3.receiver = self;
  v3.super_class = (Class)MFXPCConnection;
  [(MFXPCConnection *)&v3 dealloc];
}

- (BOOL)shouldCancel
{
  return (int)atomic_fetch_add(&self->_cancelFlag, 0) > 0;
}

- (void)setErrorHandler:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_errorHandlerLock lock];
  id v4 = objc_retainBlock(v6);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = v4;

  [(NSLock *)self->_errorHandlerLock unlock];
}

- (id)errorHandler
{
  [(NSLock *)self->_errorHandlerLock lock];
  id v3 = objc_retainBlock(self->_errorHandler);
  [(NSLock *)self->_errorHandlerLock unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)handleError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MFXPCConnection *)self errorHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)start
{
  id v3 = +[MailXPCServices log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    pid_t pid = xpc_connection_get_pid(self->_connection);
    connection = self->_connection;
    v6[0] = 67109376;
    v6[1] = pid;
    __int16 v7 = 2048;
    id v8 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "PID %d : starting peer connection <connection: %p>", (uint8_t *)v6, 0x12u);
  }

  xpc_connection_resume(self->_connection);
}

- (void)stop
{
  id v3 = +[MailXPCServices log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    pid_t pid = xpc_connection_get_pid(self->_connection);
    connection = self->_connection;
    v8[0] = 67109376;
    v8[1] = pid;
    __int16 v9 = 2048;
    id v10 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "PID %d : tearing down peer connection <connection: %p>", (uint8_t *)v8, 0x12u);
  }

  atomic_fetch_add(&self->_cancelFlag, 1u);
  [(MFXPCConnection *)self setServiceManager:0];
  [(MFXPCConnection *)self setErrorHandler:0];
  id v6 = self->_connection;
  xpc_connection_set_event_handler(v6, &stru_10013AF48);
  xpc_connection_cancel(v6);

  __int16 v7 = self->_connection;
  self->_connection = 0;
}

- (MailXPCServices)serviceManager
{
  return self->_serviceManager;
}

- (void)setServiceManager:(id)a3
{
  self->_serviceManager = (MailXPCServices *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_errorHandlerLock, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end