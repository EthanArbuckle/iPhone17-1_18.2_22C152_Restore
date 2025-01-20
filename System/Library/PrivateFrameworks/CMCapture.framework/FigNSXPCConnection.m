@interface FigNSXPCConnection
- (BOOL)explicitlyInvalidated;
- (void)blockUntilInvalidateHandlerHasBeenCalled;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation FigNSXPCConnection

- (void)setInvalidationHandler:(id)a3
{
  if (a3) {
    -[FigNSXPCConnection setInvalidationHandler:](&v4, sel_setInvalidationHandler_, v5, v3.receiver, v3.super_class, self, FigNSXPCConnection, MEMORY[0x1E4F143A8], 3221225472, __45__FigNSXPCConnection_setInvalidationHandler___block_invoke, &unk_1E5C25238, self, a3);
  }
  else {
    -[FigNSXPCConnection setInvalidationHandler:](&v3, sel_setInvalidationHandler_, 0, self, FigNSXPCConnection, v4.receiver, v4.super_class, v5[0], v5[1], v5[2], v5[3], v5[4], v5[5]);
  }
}

- (void)resume
{
  if (!self->_connectionRunningGroup)
  {
    objc_super v3 = (OS_dispatch_group *)dispatch_group_create();
    self->_connectionRunningGroup = v3;
    dispatch_group_enter((dispatch_group_t)v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigNSXPCConnection;
  [(FigNSXPCConnection *)&v4 resume];
}

void __45__FigNSXPCConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  dispatch_group_leave(v2);
}

- (void)blockUntilInvalidateHandlerHasBeenCalled
{
  connectionRunningGroup = self->_connectionRunningGroup;
  if (connectionRunningGroup) {
    dispatch_group_wait(connectionRunningGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)FigNSXPCConnection;
  [(FigNSXPCConnection *)&v3 invalidate];
  self->_explicitlyInvalidated = 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigNSXPCConnection;
  [(FigNSXPCConnection *)&v3 dealloc];
}

- (BOOL)explicitlyInvalidated
{
  return self->_explicitlyInvalidated;
}

@end