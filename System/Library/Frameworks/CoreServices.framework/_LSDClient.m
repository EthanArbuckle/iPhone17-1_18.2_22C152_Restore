@interface _LSDClient
- (NSXPCConnection)XPCConnection;
- (_LSDClient)initWithXPCConnection:(id)a3;
- (_LSDClient)initWithXPCConnection:(id)a3 queue:(id)a4;
- (void)handleXPCInvocation:(id)a3 isReply:(BOOL)a4;
- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDClient

- (void)handleXPCInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_queue)
  {
    [(_LSDClient *)self willHandleInvocation:a3 isReply:a4];
    MEMORY[0x185310450]([a3 retainArguments]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51___LSDClient_Private__handleXPCInvocation_isReply___block_invoke;
    v12[3] = &unk_1E522F3F8;
    v12[4] = self;
    v12[5] = a3;
    BOOL v13 = v4;
    v7 = _LSServer_MakeServiceFloorBlock(v12);
    if (!v7)
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        Name = class_getName(v9);
        v11 = sel_getName((SEL)[a3 selector]);
        [(_LSDClient(Private) *)(uint64_t)v11 handleXPCInvocation:(uint64_t)Name isReply:v8];
      }

      abort();
    }
    dispatch_async((dispatch_queue_t)self->_queue, v7);
  }
  else
  {
    [(_LSDClient *)self willHandleInvocation:a3 isReply:a4];
    [(_LSDClient *)self invokeServiceInvocation:a3 isReply:v4];
    [(_LSDClient *)self didHandleInvocation:a3 isReply:v4];
  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
}

- (NSXPCConnection)XPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (_LSDClient)initWithXPCConnection:(id)a3 queue:(id)a4
{
  v5 = [(_LSDClient *)self initWithXPCConnection:a3];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_queue, a4);
  }
  return v6;
}

- (_LSDClient)initWithXPCConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_LSDClient;
  BOOL v4 = [(_LSDClient *)&v6 init];
  _LSAssertRunningInServer((uint64_t)"-[_LSDClient initWithXPCConnection:]");
  if (v4) {
    objc_storeStrong((id *)&v4->_XPCConnection, a3);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

@end