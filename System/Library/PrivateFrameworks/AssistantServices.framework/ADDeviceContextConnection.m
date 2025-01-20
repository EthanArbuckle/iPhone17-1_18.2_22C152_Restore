@interface ADDeviceContextConnection
- (ADDeviceContextConnection)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5;
- (id)_remoteServiceDelegateWithErrorHandler:(id)a3;
- (void)_beginUpdateLocalDeviceContextWithReply:(id)a3;
- (void)_clearXPCConnection;
- (void)_endUpdateLocalDeviceContext;
- (void)_handleXPCConnectionInterruption;
- (void)_handleXPCConnectionInvalidation;
- (void)_invalidate;
- (void)beginUpdateLocalDeviceContextWithReply:(id)a3;
- (void)dealloc;
- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7;
- (void)getLocalDeviceContextWithReply:(id)a3;
- (void)invalidate;
- (void)updateLocalDeviceContext:(id)a3;
@end

@implementation ADDeviceContextConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateLocalDeviceContextReply, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_endUpdateLocalDeviceContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isUpdatingLocalDeviceContext = 0;
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    v7 = "-[ADDeviceContextConnection _endUpdateLocalDeviceContext]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 1024;
    int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p isUpdatingLocalDeviceContext = %d", (uint8_t *)&v6, 0x1Cu);
  }
  updateLocalDeviceContextReply = (void (**)(id))self->_updateLocalDeviceContextReply;
  if (updateLocalDeviceContextReply)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      v7 = "-[ADDeviceContextConnection _endUpdateLocalDeviceContext]";
      __int16 v8 = 2048;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p sending reply...", (uint8_t *)&v6, 0x16u);
      updateLocalDeviceContextReply = (void (**)(id))self->_updateLocalDeviceContextReply;
    }
    updateLocalDeviceContextReply[2](updateLocalDeviceContextReply);
  }
}

- (void)_beginUpdateLocalDeviceContextWithReply:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  self->_isUpdatingLocalDeviceContext = 1;
  int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "-[ADDeviceContextConnection _beginUpdateLocalDeviceContextWithReply:]";
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 1024;
    int v14 = 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p isUpdatingLocalDeviceContext = %d", (uint8_t *)&v9, 0x1Cu);
  }
  id v7 = objc_retainBlock(v5);

  id updateLocalDeviceContextReply = self->_updateLocalDeviceContextReply;
  self->_id updateLocalDeviceContextReply = v7;
}

- (id)_remoteServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalid)
  {
    xpcConnection = self->_xpcConnection;
    if (xpcConnection)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100111E48;
      v10[3] = &unk_10050D440;
      id v11 = v4;
      id v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
      int v6 = v11;
      goto LABEL_7;
    }
  }
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADDeviceContextConnection _remoteServiceDelegateWithErrorHandler:]";
    __int16 v14 = 2048;
    v15 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
    if (v4) {
      goto LABEL_4;
    }
  }
  else if (v4)
  {
LABEL_4:
    int v6 = +[AFError errorWithCode:23];
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
    id v7 = 0;
LABEL_7:

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ADDeviceContextConnection *)self _endUpdateLocalDeviceContext];
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      int v6 = "-[ADDeviceContextConnection _invalidate]";
      __int16 v7 = 2048;
      __int16 v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceContextConnectionDidInvalidate:self];

    objc_storeWeak((id *)&self->_delegate, 0);
  }
  [(ADDeviceContextConnection *)self _clearXPCConnection];
}

- (void)_clearXPCConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      __int16 v7 = "-[ADDeviceContextConnection _clearXPCConnection]";
      __int16 v8 = 2048;
      int v9 = self;
      __int16 v10 = 2112;
      id v11 = xpcConnection;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v6, 0x20u);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection invalidate];
    int v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)_handleXPCConnectionInterruption
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    int v6 = "-[ADDeviceContextConnection _handleXPCConnectionInterruption]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  [(ADDeviceContextConnection *)self _invalidate];
}

- (void)_handleXPCConnectionInvalidation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    int v6 = "-[ADDeviceContextConnection _handleXPCConnectionInvalidation]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }
  [(ADDeviceContextConnection *)self _invalidate];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112288;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = WeakRetained;
  if (self->_isInvalid || !WeakRetained)
  {
    v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[ADDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:]";
      __int16 v21 = 2048;
      v22 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", (uint8_t *)&v19, 0x16u);
      if (!v15) {
        goto LABEL_7;
      }
    }
    else if (!v15)
    {
      goto LABEL_7;
    }
    v15[2](v15);
    goto LABEL_7;
  }
  [WeakRetained deviceContextConnection:self donateSerializedContextMapByPrivacyClass:v12 withMetadataMap:v13 forType:v14 pushToRemote:v8 completion:v15];
LABEL_7:
}

- (void)beginUpdateLocalDeviceContextWithReply:(id)a3
{
}

- (void)getLocalDeviceContextWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = WeakRetained;
  __int16 v7 = AFSiriLogContextDaemon;
  if (self->_isInvalid || WeakRetained == 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADDeviceContextConnection getLocalDeviceContextWithReply:]";
      __int16 v15 = 2048;
      v16 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s %p Ignored because the connection is invalidated.", buf, 0x16u);
      if (!v4) {
        goto LABEL_12;
      }
    }
    else if (!v4)
    {
      goto LABEL_12;
    }
    v4[2](v4, 0);
    goto LABEL_12;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADDeviceContextConnection getLocalDeviceContextWithReply:]";
    __int16 v15 = 2048;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100112630;
  v10[3] = &unk_100502778;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v4;
  [v6 deviceContextConnection:self getLocalDeviceContextWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (void)updateLocalDeviceContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001127F4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADDeviceContextConnection)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ADDeviceContextConnection;
  id v11 = [(ADDeviceContextConnection *)&v31 init];
  if (v11)
  {
    if (v8)
    {
      id v12 = (OS_dispatch_queue *)v8;
      queue = v11->_queue;
      v11->_queue = v12;
    }
    else
    {
      id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      __int16 v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);

      dispatch_queue_t v16 = dispatch_queue_create("com.apple.assistant.device-context.client-connection", v15);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v16;
    }

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_xpcConnection, a4);
    [(NSXPCConnection *)v11->_xpcConnection _setQueue:v11->_queue];
    xpcConnection = v11->_xpcConnection;
    v18 = AFDeviceContextServiceDelegateGetXPCInterface();
    [(NSXPCConnection *)xpcConnection setRemoteObjectInterface:v18];

    int v19 = v11->_xpcConnection;
    v20 = AFDeviceContextServiceGetXPCInterface();
    [(NSXPCConnection *)v19 setExportedInterface:v20];

    [(NSXPCConnection *)v11->_xpcConnection setExportedObject:v11];
    objc_initWeak(&location, v11);
    __int16 v21 = v11->_xpcConnection;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100112DE0;
    v28[3] = &unk_10050B790;
    objc_copyWeak(&v29, &location);
    [(NSXPCConnection *)v21 setInvalidationHandler:v28];
    v22 = v11->_xpcConnection;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100112E20;
    v26[3] = &unk_10050B790;
    objc_copyWeak(&v27, &location);
    [(NSXPCConnection *)v22 setInterruptionHandler:v26];
    [(NSXPCConnection *)v11->_xpcConnection resume];
    v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v24 = v11->_xpcConnection;
      *(_DWORD *)buf = 136315650;
      v33 = "-[ADDeviceContextConnection initWithQueue:xpcConnection:delegate:]";
      __int16 v34 = 2048;
      v35 = v11;
      __int16 v36 = 2112;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", buf, 0x20u);
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[ADDeviceContextConnection dealloc]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADDeviceContextConnection;
  [(ADDeviceContextConnection *)&v4 dealloc];
}

@end