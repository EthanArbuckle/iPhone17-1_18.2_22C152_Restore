@interface BSBasicServerClient
+ (id)wrapperWithConnection:(id)a3;
- (BSBasicServerClient)initWithConnection:(id)a3;
- (NSString)description;
- (OS_xpc_object)connection;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithPacker:(id)a3;
- (void)sendMessageWithPacker:(id)a3 replyHandler:(id)a4 onQueue:(id)a5;
- (void)suspend;
@end

@implementation BSBasicServerClient

- (OS_xpc_object)connection
{
  return self->_connection;
}

+ (id)wrapperWithConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithConnection:v4];

  return v5;
}

- (BSBasicServerClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = [(BSBasicServerClient *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(BSBasicServerClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BSBasicServerClient;
  [(BSBasicServerClient *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendInt:xpc_connection_get_pid(self->_connection) withName:@"pid"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (void)resume
{
  connection = [(BSBasicServerClient *)self connection];
  if (connection)
  {
    int v3 = 0;
    atomic_compare_exchange_strong_explicit(&self->_resumed, (unsigned int *)&v3, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v3)
    {
      self->_managingResumeState = 1;
      xpc_connection_resume(connection);
    }
  }
}

- (void)suspend
{
  connection = [(BSBasicServerClient *)self connection];
  if (connection)
  {
    int v3 = 1;
    atomic_compare_exchange_strong_explicit(&self->_resumed, (unsigned int *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
    if (v3 == 1) {
      xpc_connection_suspend(connection);
    }
  }
}

- (void)invalidate
{
  connection = [(BSBasicServerClient *)self connection];
  if (connection)
  {
    int v3 = 0;
    atomic_compare_exchange_strong_explicit(&self->_cancelled, (unsigned int *)&v3, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v3)
    {
      xpc_connection_cancel(connection);
      if (self->_managingResumeState) {
        [(BSBasicServerClient *)self resume];
      }
    }
  }
}

- (void)sendMessage:(id)a3
{
  id v5 = a3;
  id v4 = [(BSBasicServerClient *)self connection];
  [v5 sendToConnection:v4];
}

- (void)sendMessageWithPacker:(id)a3
{
}

- (void)sendMessageWithPacker:(id)a3 replyHandler:(id)a4 onQueue:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((v9 != 0) != (v10 != 0))
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BSBasicServerClient.m", 84, @"Invalid parameter not satisfying: %@", @"(replyHandler && queue) || (!replyHandler && !queue)" object file lineNumber description];
  }
  v11 = [(BSBasicServerClient *)self connection];
  +[BSXPCMessage sendMessageWithPacker:v13 toConnection:v11 replyHandler:v9 replyQueue:v10];
}

- (void).cxx_destruct
{
}

@end