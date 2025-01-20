@interface MTRDeviceControllerXPCConnection
+ (id)connectionWithWorkQueue:(id)a3 connectBlock:(id)a4;
- (MTRDeviceControllerXPCConnection)initWithWorkQueue:(id)a3 connectBlock:(id)a4;
- (MTRDeviceControllerXPCProxyHandle)proxyHandle;
- (MTRDeviceControllerXPCProxyHandle)proxyRetainerForReports;
- (NSMutableDictionary)reportRegistry;
- (NSXPCInterface)remoteDeviceClientProtocol;
- (NSXPCInterface)remoteDeviceServerProtocol;
- (OS_dispatch_queue)workQueue;
- (id)connectBlock;
- (void)callSubscriptionEstablishedHandler:(id)a3;
- (void)deregisterReportHandlersWithController:(id)a3 nodeID:(id)a4 completion:(id)a5;
- (void)getProxyHandleWithCompletion:(id)a3;
- (void)handleReportWithController:(id)a3 nodeId:(unint64_t)a4 values:(id)a5 error:(id)a6;
- (void)registerReportHandlerWithController:(id)a3 nodeID:(id)a4 handler:(id)a5;
- (void)setProxyHandle:(id)a3;
- (void)setProxyRetainerForReports:(id)a3;
@end

@implementation MTRDeviceControllerXPCConnection

- (MTRDeviceControllerXPCConnection)initWithWorkQueue:(id)a3 connectBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceControllerXPCConnection;
  v11 = [(MTRDeviceControllerXPCConnection *)&v23 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_xpcInterfaceForServerProtocol(MTRDeviceController, v9, v10);
    remoteDeviceServerProtocol = v11->_remoteDeviceServerProtocol;
    v11->_remoteDeviceServerProtocol = (NSXPCInterface *)v12;

    uint64_t v16 = objc_msgSend_xpcInterfaceForClientProtocol(MTRDeviceController, v14, v15);
    remoteDeviceClientProtocol = v11->_remoteDeviceClientProtocol;
    v11->_remoteDeviceClientProtocol = (NSXPCInterface *)v16;

    uint64_t v18 = MEMORY[0x2456969D0](v8);
    id connectBlock = v11->_connectBlock;
    v11->_id connectBlock = (id)v18;

    objc_storeStrong((id *)&v11->_workQueue, a3);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    reportRegistry = v11->_reportRegistry;
    v11->_reportRegistry = v20;
  }
  return v11;
}

+ (id)connectionWithWorkQueue:(id)a3 connectBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MTRDeviceControllerXPCConnection alloc];
  v9 = objc_msgSend_initWithWorkQueue_connectBlock_(v7, v8, (uint64_t)v5, v6);

  return v9;
}

- (void)getProxyHandleWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B2E350;
  v7[3] = &unk_265195038;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)registerReportHandlerWithController:(id)a3 nodeID:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_244B2E8F8;
  v15[3] = &unk_265199720;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)deregisterReportHandlersWithController:(id)a3 nodeID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_244B2EB88;
  v15[3] = &unk_265199748;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)handleReportWithController:(id)a3 nodeId:(unint64_t)a4 values:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B2F148;
  block[3] = &unk_2651997C0;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workQueue, block);
}

- (void)callSubscriptionEstablishedHandler:(id)a3
{
}

- (NSXPCInterface)remoteDeviceServerProtocol
{
  return self->_remoteDeviceServerProtocol;
}

- (NSXPCInterface)remoteDeviceClientProtocol
{
  return self->_remoteDeviceClientProtocol;
}

- (id)connectBlock
{
  return self->_connectBlock;
}

- (MTRDeviceControllerXPCProxyHandle)proxyHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyHandle);

  return (MTRDeviceControllerXPCProxyHandle *)WeakRetained;
}

- (void)setProxyHandle:(id)a3
{
}

- (MTRDeviceControllerXPCProxyHandle)proxyRetainerForReports
{
  return self->_proxyRetainerForReports;
}

- (void)setProxyRetainerForReports:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)reportRegistry
{
  return self->_reportRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportRegistry, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_proxyRetainerForReports, 0);
  objc_destroyWeak((id *)&self->_proxyHandle);
  objc_storeStrong(&self->_connectBlock, 0);
  objc_storeStrong((id *)&self->_remoteDeviceClientProtocol, 0);

  objc_storeStrong((id *)&self->_remoteDeviceServerProtocol, 0);
}

@end