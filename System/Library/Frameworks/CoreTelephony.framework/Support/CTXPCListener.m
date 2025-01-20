@interface CTXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CTXPCListener)initWithListener:(id)a3 queue:(queue)a4 name:(const char *)a5 logContext:(OsLogContext)a6;
- (CTXPCListenerDelegate)delegate;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (const)name;
- (void)bootstrapWithDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setListener:(id)a3;
- (void)setName:(const char *)a3;
- (void)start;
- (void)stop;
@end

@implementation CTXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  [(CTXPCListener *)self getLogContext];
  v8 = *((void *)&buf + 1);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&buf);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received new connection: %@", (uint8_t *)&buf, 0xCu);
  }
  if (self->_listener == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v11 = WeakRetained == 0;

    if (!v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = [v12 clientProxyForConnection:v7];

      if (v13)
      {
        v14 = [v13 exportedInterface];
        v15 = [v14 protocol];
        unsigned __int8 v16 = [v13 conformsToProtocol:v15];

        if (v16)
        {
          v17 = [v13 exportedInterface];
          [v7 setExportedInterface:v17];

          if (objc_opt_respondsToSelector())
          {
            v18 = [v13 remoteInterface];
            [v7 setRemoteObjectInterface:v18];
          }
          [(CTXPCListener *)self getQueue];
          [v7 _setQueue:(void)buf];
          if ((void)buf) {
            dispatch_release((dispatch_object_t)buf);
          }
          [v7 setExportedObject:v13];
          id v19 = objc_loadWeakRetained((id *)&self->_delegate);
          char v20 = objc_opt_respondsToSelector();

          if (v20)
          {
            *(void *)&long long buf = 0;
            objc_initWeak((id *)&buf, self);
            id location = 0;
            objc_initWeak(&location, v7);
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_10001C5D4;
            v29[3] = &unk_101AB2000;
            objc_copyWeak(&v30, &location);
            v29[4] = self;
            objc_copyWeak(&v31, (id *)&buf);
            [v7 setInvalidationHandler:v29];
            objc_destroyWeak(&v31);
            objc_destroyWeak(&v30);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)&buf);
          }
          id v21 = objc_loadWeakRetained((id *)&self->_delegate);
          char v22 = objc_opt_respondsToSelector();

          if (v22)
          {
            *(void *)&long long buf = 0;
            objc_initWeak((id *)&buf, self);
            id location = 0;
            objc_initWeak(&location, v7);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_1013264B8;
            v26[3] = &unk_101AB2000;
            objc_copyWeak(&v27, &location);
            v26[4] = self;
            objc_copyWeak(&v28, (id *)&buf);
            [v7 setInterruptionHandler:v26];
            objc_destroyWeak(&v28);
            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)&buf);
          }
          [v7 resume];
          [(CTXPCListener *)self getLogContext];
          v23 = *((void *)&buf + 1);
          ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&buf);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Connection (%@) resumed", (uint8_t *)&buf, 0xCu);
          }
          BOOL v9 = 1;
          goto LABEL_22;
        }
        [(CTXPCListener *)self getLogContext];
        v24 = *((void *)&buf + 1);
        ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&buf);
        BOOL v9 = 0;
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
LABEL_22:

          goto LABEL_23;
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client proxy object (%@) does not conform to exported protocol!", (uint8_t *)&buf, 0xCu);
      }
      BOOL v9 = 0;
      goto LABEL_22;
    }
  }
  BOOL v9 = 0;
LABEL_23:

  return v9;
}

- (CTXPCListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CTXPCListenerDelegate *)WeakRetained;
}

- (CTXPCListener)initWithListener:(id)a3 queue:(queue)a4 name:(const char *)a5 logContext:(OsLogContext)a6
{
  var0 = a6.var0;
  id v11 = a3;
  dispatch_object_t object = *(dispatch_object_t *)a4.fObj.fObj;
  *(void *)a4.fObj.fObj = 0;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v17, (const ctu::OsLogContext *)var0);
  v16.receiver = self;
  v16.super_class = (Class)CTXPCListener;
  id v12 = [(CTXPCListener *)&v16 initWithQueue:&object logContext:v17];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v17);
  if (object) {
    dispatch_release(object);
  }
  if (v12)
  {
    v12->_name = a5;
    objc_storeStrong((id *)&v12->_listener, a3);
    [(NSXPCListener *)v12->_listener setDelegate:v12];
    listener = v12->_listener;
    [(CTXPCListener *)v12 getQueue];
    [(NSXPCListener *)listener _setQueue:v15];
    if (v15) {
      dispatch_release(v15);
    }
  }

  return v12;
}

- (void)bootstrapWithDelegate:(id)a3
{
  id v4 = a3;
  [(CTXPCListener *)self getLogContext];
  v5 = *(NSObject **)&v8[4];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v7 = 136315138;
    *(void *)v8 = name;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bootstrapping %s XPC service", (uint8_t *)&v7, 0xCu);
  }
  [(CTXPCListener *)self setDelegate:v4];
}

- (void)start
{
  [(CTXPCListener *)self getLogContext];
  v3 = *(NSObject **)&v8[4];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v7 = 136315138;
    *(void *)v8 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting %s XPC service", (uint8_t *)&v7, 0xCu);
  }
  [(NSXPCListener *)self->_listener resume];
  [(CTXPCListener *)self getLogContext];
  v5 = *(NSObject **)&v8[4];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_name;
    int v7 = 136315138;
    *(void *)v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s XPC service is ready", (uint8_t *)&v7, 0xCu);
  }
}

- (void)stop
{
  [(CTXPCListener *)self getLogContext];
  v3 = *(NSObject **)&v8[4];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v7 = 136315138;
    *(void *)v8 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping %s XPC service", (uint8_t *)&v7, 0xCu);
  }
  p_listener = &self->_listener;
  [(NSXPCListener *)*p_listener invalidate];
  v6 = *p_listener;
  *p_listener = 0;
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)setDelegate:(id)a3
{
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (const)name
{
  return self->_name;
}

- (void)setName:(const char *)a3
{
  self->_name = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end