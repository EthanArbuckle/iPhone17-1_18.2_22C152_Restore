@interface _CAFCarDataClientProxy
- (BOOL)invalidated;
- (CAFCarConfiguration)currentCarConfig;
- (CAFCarDataService)remoteProxy;
- (CAFCarManager)carManager;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)workQueue;
- (_CAFCarDataClientProxy)initWithCarManager:(id)a3;
- (os_unfair_lock_s)invalidatedLock;
- (void)activate;
- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5;
- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)didUpdateConfig:(id)a3;
- (void)didUpdateCurrentCarConfig:(id)a3;
- (void)didUpdatePluginID:(id)a3 values:(id)a4;
- (void)invalidate;
- (void)setCarManager:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentCarConfig:(id)a3;
- (void)setInvalidatedLock:(os_unfair_lock_s)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _CAFCarDataClientProxy

- (_CAFCarDataClientProxy)initWithCarManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CAFCarDataClientProxy;
  v5 = [(_CAFCarDataClientProxy *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_invalidatedLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_carManager, v4);
    v7 = (const char *)[@"com.apple.caraccessoryframework.cardata" UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (void)activate
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "Connecting to cafd car data service.", v2, v3, v4, v5, v6);
}

- (CAFCarDataService)remoteProxy
{
  if ([(_CAFCarDataClientProxy *)self invalidated])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(_CAFCarDataClientProxy *)self connection];
    id v5 = [v4 remoteObjectProxy];
    if ([v5 conformsToProtocol:&unk_26FDB27B8]) {
      id v3 = v5;
    }
    else {
      id v3 = 0;
    }
  }
  return (CAFCarDataService *)v3;
}

- (void)didUpdateCurrentCarConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(_CAFCarDataClientProxy *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke;
  v7[3] = &unk_265263280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didUpdateConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(_CAFCarDataClientProxy *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke;
  v7[3] = &unk_265263280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_CAFCarDataClientProxy *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke;
  block[3] = &unk_265263398;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(_CAFCarDataClientProxy *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke;
  v15[3] = &unk_2652640C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_CAFCarDataClientProxy *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_2652642C0;
  id v22 = v12;
  id v23 = v13;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (void)invalidate
{
  p_invalidatedLock = &self->_invalidatedLock;
  os_unfair_lock_lock(&self->_invalidatedLock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id v4 = [(_CAFCarDataClientProxy *)self connection];
    [v4 invalidate];
  }
  os_unfair_lock_unlock(p_invalidatedLock);
}

- (BOOL)invalidated
{
  uint64_t v2 = self;
  p_invalidatedLock = &self->_invalidatedLock;
  os_unfair_lock_lock(&self->_invalidatedLock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_invalidatedLock);
  return (char)v2;
}

- (os_unfair_lock_s)invalidatedLock
{
  return self->_invalidatedLock;
}

- (void)setInvalidatedLock:(os_unfair_lock_s)a3
{
  self->_invalidatedLock = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CAFCarManager)carManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carManager);
  return (CAFCarManager *)WeakRetained;
}

- (void)setCarManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (CAFCarConfiguration)currentCarConfig
{
  return self->_currentCarConfig;
}

- (void)setCurrentCarConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCarConfig, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_carManager);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end