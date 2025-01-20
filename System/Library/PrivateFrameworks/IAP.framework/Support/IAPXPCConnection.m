@interface IAPXPCConnection
- (IAPXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4;
- (IAPXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4;
- (id)_initIAPXPCConnection:(id)a3;
- (id)copyReplyQueue;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation IAPXPCConnection

- (id)_initIAPXPCConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IAPXPCConnection;
  v4 = [(IAPXPCConnection *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->isValid = 257;
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[a3 UTF8String], 0);
  }
  return v5;
}

- (IAPXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  *(_WORD *)&self->isValid = 257;
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[a3 UTF8String], 0, 0);
  objc_super v7 = [(IAPXPCConnection *)self initWithXPCConnection:mach_service queueName:a4];
  xpc_release(mach_service);
  return v7;
}

- (IAPXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4
{
  v5 = [(IAPXPCConnection *)self _initIAPXPCConnection:a4];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->isValid = 257;
    v5->_connection = (OS_xpc_object *)xpc_retain(a3);
    [(IAPXPCConnection *)v6 _reloadEventHandler];
    xpc_connection_resume(v6->_connection);
  }
  return v6;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    xpc_release(connection);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  replyQueue = self->_replyQueue;
  if (replyQueue) {
    dispatch_release(replyQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)IAPXPCConnection;
  [(IAPXPCConnection *)&v6 dealloc];
}

- (id)disconnectBlock
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10001D898;
  v10 = sub_10001D8A8;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D8B4;
  v5[3] = &unk_10002D4C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)messageBlock
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10001D898;
  v10 = sub_10001D8A8;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D9DC;
  v5[3] = &unk_10002D4C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyReplyQueue
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10001DAE4;
  v10 = sub_10001DAF4;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DB00;
  v5[3] = &unk_10002D900;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sendMessage:(id)a3
{
  if (self->isValid) {
    xpc_connection_send_message(self->_connection, a3);
  }
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid) {
    xpc_connection_send_message_with_reply(self->_connection, a3, (dispatch_queue_t)self->_replyQueue, a4);
  }
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid)
  {
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
    if (a4) {
      (*((void (**)(id, xpc_object_t))a4 + 2))(a4, v5);
    }
    xpc_release(v5);
  }
}

- (void)setDisconnectBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DC4C;
  v4[3] = &unk_10002D928;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setMessageBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DD24;
  v4[3] = &unk_10002D928;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setReplyQueue:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DDFC;
  v4[3] = &unk_10002D848;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setTargetQueue:(id)a3
{
  dispatch_set_target_queue((dispatch_object_t)self->_dispatchQueue, (dispatch_queue_t)a3);
  replyQueue = self->_replyQueue;
  if (replyQueue)
  {
    dispatch_set_target_queue(replyQueue, (dispatch_queue_t)a3);
  }
}

- (void)_reloadEventHandler
{
  int v10 = 0;
  CFStringRef v3 = (const __CFString *)MGCopyAnswerWithError();
  CFStringRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID() && CFEqual(v4, @"NonUI")) {
      self->retryInvalidConnections = 0;
    }
    CFRelease(v4);
  }
  id disconnectBlock = self->_disconnectBlock;
  id messageBlock = self->_messageBlock;
  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DFBC;
  v9[3] = &unk_10002D978;
  v9[4] = self;
  v9[5] = disconnectBlock;
  v9[6] = messageBlock;
  xpc_connection_set_event_handler(connection, v9);
}

@end