@interface _NSXPCRemoteTransport
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (_NSXPCRemoteTransport)initWithConnection:(id)a3;
- (_NSXPCRemoteTransport)initWithRemoteService:(id)a3 name:(id)a4 queue:(id)a5 mode:(unint64_t)a6;
- (id)sendMessageWithReplySync:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)sendBarrierBlock:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)suspend;
@end

@implementation _NSXPCRemoteTransport

- (_NSXPCRemoteTransport)initWithConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_NSXPCRemoteTransport;
  v4 = [(_NSXPCRemoteTransport *)&v11 init];
  if (_MergedGlobals_112 != -1) {
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  }
  v5 = (OS_xpc_remote_connection *)xpc_retain(a3);
  v4->_connection = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___NSXPCRemoteTransport_initWithConnection___block_invoke;
  v10[3] = &unk_1E51F99C0;
  v10[4] = v4;
  _xpc_remote_connection_set_event_handler(v5, v10, v6, v7, v8);
  return v4;
}

- (_NSXPCRemoteTransport)initWithRemoteService:(id)a3 name:(id)a4 queue:(id)a5 mode:(unint64_t)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_NSXPCRemoteTransport;
  objc_super v11 = [(_NSXPCRemoteTransport *)&v19 init];
  if (_MergedGlobals_112 != -1) {
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  }
  uint64_t v12 = off_1EB1ED600(a3, a5, a6);
  v11->_connection = (OS_xpc_remote_connection *)v12;
  if (!v12)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v11, a2), a4), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63___NSXPCRemoteTransport_initWithRemoteService_name_queue_mode___block_invoke;
  v18[3] = &unk_1E51F99C0;
  v18[4] = v11;
  _xpc_remote_connection_set_event_handler(v12, v18, v13, v14, v15);
  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  xpc_release(self->_connection);
  _Block_release(self->_errorHandler);
  _Block_release(self->_messageHandler);
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCRemoteTransport;
  [(_NSXPCRemoteTransport *)&v3 dealloc];
}

- (void)setErrorHandler:(id)a3
{
  self->_errorHandler = _Block_copy(a3);
}

- (void)setMessageHandler:(id)a3
{
  self->_messageHandler = _Block_copy(a3);
}

- (void)sendMessage:(id)a3
{
}

- (id)sendMessageWithReplySync:(id)a3
{
  return (id)__NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REMOTE_REPLY__();
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
}

- (void)sendNotification:(id)a3
{
}

- (void)sendBarrierBlock:(id)a3
{
}

- (void)setTargetQueue:(id)a3
{
}

- (void)activate
{
}

- (void)suspend
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)resume
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)cancel
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a3)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (int)auditSessionIdentifier
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (int)processIdentifier
{
  return 0;
}

- (unsigned)effectiveUserIdentifier
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (unsigned)effectiveGroupIdentifier
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

@end