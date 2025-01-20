@interface _HMContext
- (HMDelegateCaller)delegateCaller;
- (HMFMessageDispatcher)messageDispatcher;
- (HMPendingRequests)pendingRequests;
- (HMXPCClient)xpcClient;
- (OS_dispatch_queue)queue;
- (_HMContext)initWithName:(id)a3;
- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4;
- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4 messageDispatcher:(id)a5 pendingRequests:(id)a6;
- (_HMContext)initWithXPCClientConfiguration:(id)a3;
- (void)sendMessage:(void *)a3 target:(void *)a4 payload:(void *)a5 responseHandler:;
@end

@implementation _HMContext

- (HMPendingRequests)pendingRequests
{
  return self->_pendingRequests;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (HMDelegateCaller)delegateCaller
{
  return self->_delegateCaller;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (_HMContext)initWithXPCClientConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[HMXPCClient alloc] initWithConfiguration:v4];

  v6 = [[HMDelegateCaller alloc] initWithQueue:0];
  v7 = [(_HMContext *)self initWithXPCClient:v5 delegateCaller:v6];

  return v7;
}

- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(HMPendingRequests);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F65490]) initWithTransport:v7];
  v10 = [(_HMContext *)self initWithXPCClient:v7 delegateCaller:v6 messageDispatcher:v9 pendingRequests:v8];

  return v10;
}

- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4 messageDispatcher:(id)a5 pendingRequests:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v22 = (HMXPCClient *)_HMFPreconditionFailure();
    return (_HMContext *)[(HMXPCClient *)v22 connection];
  }
  v24.receiver = self;
  v24.super_class = (Class)_HMContext;
  v16 = [(_HMContext *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_xpcClient, a3);
    objc_storeStrong((id *)&v17->_delegateCaller, a4);
    objc_storeStrong((id *)&v17->_messageDispatcher, a5);
    objc_storeStrong((id *)&v17->_pendingRequests, a6);
    v18 = [v11 configuration];
    uint64_t v19 = [v18 queue];
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v19;
  }
  return v17;
}

- (_HMContext)initWithName:(id)a3
{
  id v4 = a3;
  v5 = [(HMXPCMessageTransportConfiguration *)[HMMutableXPCMessageTransportConfiguration alloc] initWithMachServiceName:@"com.apple.homed.xpc"];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
  [(HMXPCMessageTransportConfiguration *)v5 setQueue:v9];

  v10 = [(_HMContext *)self initWithXPCClientConfiguration:v5];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_delegateCaller, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendMessage:(void *)a3 target:(void *)a4 payload:(void *)a5 responseHandler:
{
  id v9 = a5;
  if (a1)
  {
    v10 = (void *)MEMORY[0x1E4F654B0];
    id v11 = (objc_class *)MEMORY[0x1E4F65488];
    id v12 = a4;
    id v13 = a3;
    id v14 = a2;
    v15 = (void *)[[v11 alloc] initWithTarget:v13];

    v16 = [v10 messageWithName:v14 destination:v15 payload:v12];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke;
    v21[3] = &unk_1E5944EF0;
    v21[4] = a1;
    id v17 = v9;
    id v22 = v17;
    [v16 setResponseHandler:v21];
    v18 = [a1 messageDispatcher];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_3;
    v19[3] = &unk_1E59449C8;
    v19[4] = a1;
    id v20 = v17;
    [v18 sendMessage:v16 completionHandler:v19];
  }
}

@end