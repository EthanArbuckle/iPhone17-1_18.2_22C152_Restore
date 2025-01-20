@interface TKTokenClientConnection
- (BOOL)isCaller:(id)a3 allowedForToken:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (TKHostTokenConnection)tokenConnection;
- (TKTokenClientConnection)initWithConnection:(id)a3 server:(id)a4;
- (TKTokenServer)server;
- (id)accessRegistry;
- (void)ensureSlotWatcherRunningWithReply:(id)a3;
- (void)getConfigurationEndpoint:(id)a3;
- (void)getEndpoint:(id)a3;
- (void)getSEPKeyEndpoint:(id)a3;
- (void)getTokenEndpointForTokenID:(id)a3 reply:(id)a4;
- (void)getWatcherEndpoint:(id)a3;
- (void)terminate;
@end

@implementation TKTokenClientConnection

- (TKTokenClientConnection)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TKTokenClientConnection;
  v8 = [(TKTokenClientConnection *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_server, a4);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F194;
    v12[3] = &unk_100020600;
    v13 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_connection);
    [WeakRetained setInvalidationHandler:v12];
  }
  return v9;
}

- (void)getEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  v4 = self->_server;
  objc_sync_enter(v4);
  v5 = [(TKTokenServer *)self->_server tokenServerListener];
  id v6 = [v5 endpoint];
  v7[2](v7, v6);

  objc_sync_exit(v4);
}

- (BOOL)isCaller:(id)a3 allowedForToken:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)TKTokenAccessRequest);
  v11 = [v8 tokenID];
  v12 = [v8 driver];
  v13 = [v12 extension];
  id v14 = [v10 initWithCaller:v9 tokenID:v11 extension:v13];

  v15 = [(TKTokenClientConnection *)self accessRegistry];
  unsigned __int8 v16 = [v15 evaluateRequest:v14 error:a5];

  v17 = sub_10000F450();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = [v14 clientBundleID];
    v20 = [v8 tokenID];
    v21 = [v20 stringRepresentation];
    if (v16)
    {
      v22 = @"granted";
    }
    else
    {
      v22 = +[NSString stringWithFormat:@"denied with error: %@", *a5];
    }
    *(_DWORD *)buf = 138412802;
    v24 = v19;
    __int16 v25 = 2112;
    v26 = v21;
    __int16 v27 = 2112;
    v28 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Request from: '%@' to access '%@' was %@", buf, 0x20u);
    if ((v16 & 1) == 0) {
  }
    }
  return v16;
}

- (id)accessRegistry
{
  accessRegistry = self->_accessRegistry;
  if (!accessRegistry)
  {
    v4 = (TKTokenAccessRegistry *)objc_alloc_init((Class)TKTokenAccessRegistry);
    v5 = self->_accessRegistry;
    self->_accessRegistry = v4;

    accessRegistry = self->_accessRegistry;
  }

  return accessRegistry;
}

- (void)getTokenEndpointForTokenID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TKTokenServer *)self->_server waitForRegistry])
  {
    id v8 = [objc_alloc((Class)TKTokenID) initWithTokenID:v6];
    if (v8)
    {
      id v9 = +[NSXPCConnection currentConnection];
      id v10 = [(TKTokenClientConnection *)self server];
      v11 = [v10 tokenRegistry];
      v12 = [v11 tokenWithTokenID:v8];

      if (v12)
      {
        v13 = [v12 queue];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10000F794;
        v17[3] = &unk_100020938;
        v17[4] = self;
        id v18 = v12;
        id v20 = v7;
        id v19 = v9;
        dispatch_async(v13, v17);
      }
      else
      {
        v15 = sub_10000F450();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100014DC0((uint64_t)v8, v15);
        }

        unsigned __int8 v16 = +[NSError errorWithDomain:TKErrorDomain code:-7 userInfo:0];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
      }
    }
    else
    {
      id v14 = sub_10000F450();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100014D48((uint64_t)v6, v14);
      }

      id v9 = +[NSError errorWithDomain:TKErrorDomain code:-7 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
  else
  {
    id v8 = +[NSError errorWithDomain:TKErrorDomain code:-2 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v8);
  }
}

- (void)getConfigurationEndpoint:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if ([(TKTokenServer *)self->_server waitForRegistry])
  {
    v4 = self->_server;
    objc_sync_enter(v4);
    v5 = [(TKTokenServer *)self->_server tokenRegistry];
    id v6 = [v5 listener];
    id v7 = [v6 endpoint];
    v8[2](v8, v7);

    objc_sync_exit(v4);
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)getWatcherEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  if ([(TKTokenServer *)self->_server waitForRegistry])
  {
    v4 = self->_server;
    objc_sync_enter(v4);
    v5 = [(TKTokenServer *)self->_server tokenWatcherListener];
    id v6 = [v5 endpoint];
    v7[2](v7, v6);

    objc_sync_exit(v4);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)getSEPKeyEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  v4 = self->_server;
  objc_sync_enter(v4);
  v5 = [(TKTokenServer *)self->_server SEPKeyListener];
  id v6 = [v5 endpoint];
  v7[2](v7, v6);

  objc_sync_exit(v4);
}

- (void)ensureSlotWatcherRunningWithReply:(id)a3
{
  id v6 = (void (**)(void))a3;
  v4 = [(TKTokenServer *)self->_server ensureSlotWatcherIsRunning];

  if (v4)
  {
    v5 = [(TKTokenServer *)self->_server ensureSlotWatcherIsRunning];
    v5[2]();
  }
  v6[2]();
}

- (void)terminate
{
  self->_tokenConnection = 0;
  _objc_release_x1();
}

- (TKHostTokenConnection)tokenConnection
{
  return (TKHostTokenConnection *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (TKTokenServer)server
{
  return (TKTokenServer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_tokenConnection, 0);

  objc_storeStrong((id *)&self->_accessRegistry, 0);
}

@end