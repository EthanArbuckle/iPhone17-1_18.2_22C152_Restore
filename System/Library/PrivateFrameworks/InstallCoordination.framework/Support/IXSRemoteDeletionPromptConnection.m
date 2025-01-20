@interface IXSRemoteDeletionPromptConnection
- (BOOL)lastDismissWasSwipeDown;
- (IXSRemoteDeletionPromptConnection)init;
- (OS_xpc_object)listenerConnection;
- (OS_xpc_object)serviceConnection;
- (void)dealloc;
- (void)dismissAlert;
- (void)setLastDismissWasSwipeDown:(BOOL)a3;
- (void)setListenerConnection:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)startConnectionWithConfig:(id)a3 alertDefinition:(id)a4 completion:(id)a5;
@end

@implementation IXSRemoteDeletionPromptConnection

- (IXSRemoteDeletionPromptConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)IXSRemoteDeletionPromptConnection;
  v2 = [(IXSRemoteDeletionPromptConnection *)&v7 init];
  v3 = v2;
  if (v2)
  {
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = 0;

    listenerConnection = v3->_listenerConnection;
    v3->_listenerConnection = 0;

    v3->_lastDismissWasSwipeDown = 0;
  }
  return v3;
}

- (void)startConnectionWithConfig:(id)a3 alertDefinition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100089BEC;
  v31[4] = sub_100089BFC;
  id v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100089BEC;
  v29 = sub_100089BFC;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  id v11 = &_dispatch_main_q;
  v12 = xpc_connection_create(0, (dispatch_queue_t)&_dispatch_main_q);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100089C04;
  handler[3] = &unk_1000EB5D0;
  handler[4] = self;
  id v13 = v10;
  id v19 = v13;
  v20 = &v25;
  v21 = v23;
  v22 = v31;
  xpc_connection_set_event_handler(v12, handler);
  xpc_connection_activate(v12);
  xpc_endpoint_t v14 = xpc_endpoint_create(v12);
  [(IXSRemoteDeletionPromptConnection *)self setListenerConnection:v12];
  [v8 setXpcEndpoint:v14];
  id v15 = +[SBSRemoteAlertHandle newHandleWithDefinition:v9 configurationContext:v8];
  v16 = (void *)v26[5];
  v26[5] = (uint64_t)v15;

  id v17 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [(id)v26[5] registerObserver:self];
  [(id)v26[5] activateWithContext:v17];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
}

- (void)dismissAlert
{
  v3 = [(IXSRemoteDeletionPromptConnection *)self serviceConnection];
  if (v3)
  {
    keys = "invalidate";
    xpc_object_t v6 = xpc_BOOL_create(![(IXSRemoteDeletionPromptConnection *)self lastDismissWasSwipeDown]);
    xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &v6, 1uLL);
    xpc_connection_send_message(v3, v4);
  }
  else
  {
    v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009ACBC(v5);
    }
  }
}

- (void)dealloc
{
  listenerConnection = self->_listenerConnection;
  if (listenerConnection) {
    xpc_connection_cancel(listenerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)IXSRemoteDeletionPromptConnection;
  [(IXSRemoteDeletionPromptConnection *)&v4 dealloc];
}

- (OS_xpc_object)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (OS_xpc_object)listenerConnection
{
  return self->_listenerConnection;
}

- (void)setListenerConnection:(id)a3
{
}

- (BOOL)lastDismissWasSwipeDown
{
  return self->_lastDismissWasSwipeDown;
}

- (void)setLastDismissWasSwipeDown:(BOOL)a3
{
  self->_lastDismissWasSwipeDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerConnection, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end