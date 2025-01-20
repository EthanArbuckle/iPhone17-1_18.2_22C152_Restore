@interface IDSDaemonControllerForwarder
- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5;
- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5 completion:(id)a6;
- (NSProtocolChecker)protocol;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_queue)remoteMessageQueue;
- (id)completion;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)priority;
- (void)forwardInvocation:(id)a3;
- (void)setPriority:(int)a3;
@end

@implementation IDSDaemonControllerForwarder

- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_protocol, a3);
    id v14 = a6;
    objc_storeStrong((id *)&self->_ivarQueue, a4);
    objc_storeStrong((id *)&self->_remoteMessageQueue, a5);
    v15 = (void *)[v14 copy];

    id completion = self->_completion;
    self->_id completion = v15;
  }
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  int priority = self->_priority;
  self->_int priority = 0;
  v6 = (void *)MEMORY[0x192FE03B0](self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  v8 = +[IDSDaemonController sharedInstance];
  char v9 = [v8 consumeQueryContext:@"QueryWithReplySync"];
  char v10 = [v8 consumeQueryContext:@"QueryWithReply"];
  char v11 = [v8 consumeQueryContext:@"QueryWithBoost"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_191910038;
  v16[3] = &unk_1E57292A8;
  v16[4] = self;
  id v12 = v8;
  int v20 = priority;
  id v17 = v12;
  id v18 = v4;
  char v21 = v9;
  char v22 = v10;
  char v23 = v11;
  id v19 = v6;
  id v13 = v6;
  id v14 = v4;
  v15 = (void (**)(void))MEMORY[0x192FE03B0](v16);
  if (_os_feature_enabled_impl()) {
    v15[2](v15);
  }
  else {
    [v12 _performBlock:v15 wait:1];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(NSProtocolChecker *)self->_protocol _imMethodSignatureForSelector:a3];
}

- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5
{
  return [(IDSDaemonControllerForwarder *)self initWithProtocol:a3 ivarQueue:a4 remoteMessageQueue:a5 completion:0];
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (OS_dispatch_queue)remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_int priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

@end