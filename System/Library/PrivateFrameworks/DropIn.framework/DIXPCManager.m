@interface DIXPCManager
- (DIClientContext)clientContext;
- (DIXPCManager)init;
- (DIXPCManager)initWithClientContext:(id)a3 dispatcher:(id)a4 clientQueue:(id)a5;
- (DIXPCManagerDelegate)delegate;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)clientQueue;
- (void)addCheckInObserver:(id)a3;
- (void)dealloc;
- (void)setClientQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DIXPCManager

- (DIClientContext)clientContext
{
  id v2 = XPCManager.clientContext.getter();
  return (DIClientContext *)v2;
}

- (OS_dispatch_queue)clientQueue
{
  id v2 = (void *)sub_24D026FEC();
  return (OS_dispatch_queue *)v2;
}

- (void)setClientQueue:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24D027054(a3);
}

- (DIXPCManagerDelegate)delegate
{
  id v2 = (void *)sub_24D0270FC();
  return (DIXPCManagerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D0271B0();
}

- (DIXPCManager)initWithClientContext:(id)a3 dispatcher:(id)a4 clientQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (DIXPCManager *)XPCManager.init(clientContext:dispatcher:clientQueue:)(v7, v8, a5);
}

- (void)dealloc
{
  id v2 = self;
  XPCManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_24D02A190((uint64_t)self + OBJC_IVAR___DIXPCManager_delegate);
  swift_unknownObjectWeakDestroy();

  sub_24D044298();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_0();
  v3();
  swift_bridgeObjectRelease();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DIXPCManager_lock);
}

- (void)addCheckInObserver:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_24D0278DC((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (NSXPCConnection)connection
{
  id v2 = self;
  id v3 = sub_24D027BC8();

  return (NSXPCConnection *)v3;
}

- (DIXPCManager)init
{
}

@end