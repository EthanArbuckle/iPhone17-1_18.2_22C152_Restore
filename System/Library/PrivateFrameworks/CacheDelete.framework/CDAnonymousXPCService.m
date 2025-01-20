@interface CDAnonymousXPCService
- (BOOL)createHeartbeatConnection;
- (BOOL)haveCreatedHeartbeat;
- (CDAnonymousXPCService)initWithInfo:(id)a3 endpoint:(id)a4;
- (NSXPCConnection)heartbeatConnection;
- (NSXPCListenerEndpoint)endpoint;
- (void)_servicePing:(id)a3;
- (void)obtainXPCConnection:(id)a3;
- (void)setHaveCreatedHeartbeat:(BOOL)a3;
- (void)setHeartbeatConnection:(id)a3;
@end

@implementation CDAnonymousXPCService

- (CDAnonymousXPCService)initWithInfo:(id)a3 endpoint:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CDAnonymousXPCService;
  v8 = [(CDXPCService *)&v11 initWithInfo:a3];
  v9 = v8;
  if (v8)
  {
    if (v7) {
      objc_storeStrong((id *)&v8->_endpoint, a4);
    }
    else {
      +[NSException raise:@"EndpointRequiredError" format:@"CDAnonymousService Required Endpoint!"];
    }
  }

  return v9;
}

- (void)_servicePing:(id)a3
{
  id v4 = a3;
  if ([(CDAnonymousXPCService *)self createHeartbeatConnection])
  {
    v5 = [(CDService *)self ID];
    v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pinging heartbeat connection for service %@", buf, 0xCu);
    }

    id v7 = [(CDAnonymousXPCService *)self heartbeatConnection];
    v8 = [v7 remoteObjectProxy];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __38__CDAnonymousXPCService__servicePing___block_invoke;
    v10[3] = &unk_10005D1C0;
    id v11 = v5;
    id v12 = v4;
    id v9 = v5;
    [v8 servicePing:v10];
  }
}

uint64_t __38__CDAnonymousXPCService__servicePing___block_invoke(uint64_t a1)
{
  v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat established for service %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)createHeartbeatConnection
{
  uint64_t v3 = [(CDAnonymousXPCService *)self heartbeatConnection];
  if (v3)
  {

LABEL_8:
    v20 = [(CDAnonymousXPCService *)self heartbeatConnection];
    BOOL v21 = v20 != 0;
    goto LABEL_9;
  }
  if ([(CDAnonymousXPCService *)self haveCreatedHeartbeat]) {
    goto LABEL_8;
  }
  id v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(CDService *)self ID];
    *(_DWORD *)buf = 138412290;
    v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Establishing heartbeat to service %@", buf, 0xCu);
  }
  [(CDAnonymousXPCService *)self setHaveCreatedHeartbeat:1];
  id v6 = objc_alloc((Class)NSXPCConnection);
  id v7 = [(CDAnonymousXPCService *)self endpoint];
  id v8 = [v6 initWithListenerEndpoint:v7];
  [(CDAnonymousXPCService *)self setHeartbeatConnection:v8];

  id v9 = [(CDAnonymousXPCService *)self heartbeatConnection];
  LODWORD(v7) = v9 == 0;

  if (!v7)
  {
    objc_initWeak((id *)buf, self);
    v10 = [(CDService *)self ID];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke;
    v30[3] = &unk_10005E000;
    objc_copyWeak(&v32, (id *)buf);
    id v11 = v10;
    id v31 = v11;
    id v12 = objc_retainBlock(v30);
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke_7;
    v27 = &unk_10005E000;
    objc_copyWeak(&v29, (id *)buf);
    id v13 = v11;
    id v28 = v13;
    v14 = objc_retainBlock(&v24);
    v15 = [(CDAnonymousXPCService *)self heartbeatConnection];
    [v15 setInvalidationHandler:v12];

    v16 = [(CDAnonymousXPCService *)self heartbeatConnection];
    [v16 setInterruptionHandler:v14];

    v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CacheDeleteServiceProtocol];
    v18 = [(CDAnonymousXPCService *)self heartbeatConnection];
    [v18 setRemoteObjectInterface:v17];

    v19 = [(CDAnonymousXPCService *)self heartbeatConnection];
    [v19 resume];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);

    objc_destroyWeak((id *)buf);
    goto LABEL_8;
  }
  v20 = CDGetLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v23 = [(CDService *)self ID];
    *(_DWORD *)buf = 138412290;
    v34 = v23;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to create a heartbeat connection for service %@", buf, 0xCu);
  }
  BOOL v21 = 0;
LABEL_9:

  return v21;
}

void __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Heartbeat lost for service %@", (uint8_t *)&v7, 0xCu);
  }

  [WeakRetained setHeartbeatConnection:0];
  int v5 = [WeakRetained serviceInvalidationHandler];

  if (v5)
  {
    id v6 = [WeakRetained serviceInvalidationHandler];
    v6[2]();
  }
}

void __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted for service %@, outstanding messages should be resent!", (uint8_t *)&v7, 0xCu);
  }

  int v5 = [WeakRetained serviceInterruptionHandler];

  if (v5)
  {
    id v6 = [WeakRetained serviceInterruptionHandler];
    v6[2]();
  }
}

- (void)obtainXPCConnection:(id)a3
{
  uint64_t v4 = (void (**)(id, id, void))a3;
  int v5 = [(CDXPCService *)self xpcConnection];

  if (!v5)
  {
    int v7 = [(CDAnonymousXPCService *)self heartbeatConnection];

    if (v7)
    {
      uint64_t v8 = [(CDAnonymousXPCService *)self endpoint];

      if (!v8)
      {
        id v6 = [(CDService *)self ID];
        +[NSException raise:@"com.apple.cache_delete.CDAnonymousXPCService.no_endpoint", @"Asked to build a connection to %@ but we have no endpoint!", v6 format];
        goto LABEL_3;
      }
      id v9 = objc_alloc((Class)NSXPCConnection);
      v10 = [(CDAnonymousXPCService *)self endpoint];
      id v11 = [v9 initWithListenerEndpoint:v10];

      if (v11)
      {
        [(CDXPCService *)self setXpcConnection:v11];
        id v12 = [(CDXPCService *)self xpcConnection];
        v4[2](v4, v12, 0);
      }
      else
      {
        uint64_t v14 = *__error();
        v15 = CDGetLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v20 = [(CDService *)self ID];
          *(_DWORD *)buf = 138412546;
          v24 = v20;
          __int16 v25 = 2080;
          v26 = strerror(v14);
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create an XPC Connection to anonymous endpoint %@: %s", buf, 0x16u);
        }
        id v12 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:v14 userInfo:0];
        id v16 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
        id v22 = v12;
        v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v18 = [v16 initWithDomain:@"CacheDeleteErrorDomain" code:6 userInfo:v17];

        ((void (**)(id, id, id))v4)[2](v4, 0, v18);
      }
    }
    else
    {
      id v13 = CDGetLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19 = [(CDService *)self ID];
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Heartbeat connection is dead for %@, unable to obtain XPC connection", buf, 0xCu);
      }
      id v11 = [objc_alloc((Class)NSError) initWithDomain:@"CacheDeleteErrorDomain" code:6 userInfo:0];
      ((void (**)(id, id, id))v4)[2](v4, 0, v11);
    }

    goto LABEL_17;
  }
  id v6 = [(CDService *)self ID];
  +[NSException raise:@"com.apple.cache_delete.CDAnonymousXPCService.duplicate_connection", @"Asked to build a connection to %@ but we already have a perfectly good one!", v6 format];
LABEL_3:

LABEL_17:
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCConnection)heartbeatConnection
{
  return self->_heartbeatConnection;
}

- (void)setHeartbeatConnection:(id)a3
{
}

- (BOOL)haveCreatedHeartbeat
{
  return self->_haveCreatedHeartbeat;
}

- (void)setHaveCreatedHeartbeat:(BOOL)a3
{
  self->_haveCreatedHeartbeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatConnection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end