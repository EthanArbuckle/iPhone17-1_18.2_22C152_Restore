@interface CSSpeechUaapXPCListener
- (CSSpeechUaapXPCListener)init;
- (NSMutableArray)clients;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleError:(id)a3;
- (void)_handleNewConnection:(id)a3;
- (void)listen;
- (void)setClients:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSSpeechUaapXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setClients:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)listen
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSSpeechUaapXPCListener listen]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSSpeechUaapXPCListener starting listening", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000754A4;
  handler[3] = &unk_100252DA8;
  objc_copyWeak(&v6, (id *)buf);
  xpc_connection_set_event_handler(connection, handler);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_handleNewConnection:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSpeechUaapXPCListener _handleNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSSpeechUaaPXPCListener recieved a new client connection", buf, 0xCu);
  }
  if (+[CSUtils machXPCConnection:v4 hasEntitlement:@"corespeech.uaap.xpc"])
  {
    id v6 = [[CSSpeechUaapXPCConnection alloc] initWithConnection:v4];
    if (v6)
    {
      objc_initWeak((id *)buf, self);
      v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      v11 = sub_100075790;
      v12 = &unk_100253798;
      objc_copyWeak(&v14, (id *)buf);
      v7 = v6;
      v13 = v7;
      v8 = objc_retainBlock(&v9);
      -[CSSpeechUaapXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v8, v9, v10, v11, v12);
      [(CSSpeechUaapXPCConnection *)v7 setInvalidationHandler:v8];
      [(CSSpeechUaapXPCConnection *)v7 activate];
      [(NSMutableArray *)self->_clients addObject:v7];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_handleError:(id)a3
{
  id v4 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    int v6 = 136315394;
    v7 = "-[CSSpeechUaapXPCListener _handleError:]";
    __int16 v8 = 2080;
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s CSSpeechUaaPXPCListener recieved error event: %s", (uint8_t *)&v6, 0x16u);
  }
}

- (CSSpeechUaapXPCListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSSpeechUaapXPCListener;
  id v2 = [(CSSpeechUaapXPCListener *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSpeechUaaPXPCListener", 0);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.uaapservice", *((dispatch_queue_t *)v2 + 1), 1uLL);
    int v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = mach_service;

    uint64_t v7 = +[NSMutableArray array];
    __int16 v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;
  }
  return (CSSpeechUaapXPCListener *)v2;
}

@end