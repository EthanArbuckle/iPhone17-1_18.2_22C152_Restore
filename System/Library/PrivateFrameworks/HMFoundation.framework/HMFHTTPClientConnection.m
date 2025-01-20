@interface HMFHTTPClientConnection
+ (id)logCategory;
- (HMFHTTPClientConnection)initWithConnection:(id)a3;
- (HMFHTTPClientConnectionDelegate)delegate;
- (HMFNetAddress)peerAddress;
- (NSMutableArray)pendingRespones;
- (OS_dispatch_queue)clientQueue;
- (_HMFCFHTTPServerConnection)internal;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)shortDescription;
- (void)close;
- (void)connection:(id)a3 didReceiveRequest:(id)a4;
- (void)dealloc;
- (void)openWithCompletionHandler:(id)a3;
- (void)sendResponse:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HMFHTTPClientConnection

- (HMFHTTPClientConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMFHTTPClientConnection;
  v6 = [(HMFHTTPClientConnection *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, 0);
    dispatch_queue_t v9 = dispatch_queue_create(v8, 0);
    clientQueue = v7->_clientQueue;
    v7->_clientQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    pendingRespones = v7->_pendingRespones;
    v7->_pendingRespones = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v7->_internal, a3);
    v13 = [(HMFHTTPClientConnection *)v7 internal];
    [v13 setDelegate:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(HMFHTTPClientConnection *)self internal];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HMFHTTPClientConnection;
  [(HMFHTTPClientConnection *)&v4 dealloc];
}

- (id)shortDescription
{
  v3 = NSString;
  objc_super v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMFHTTPClientConnection *)self peerAddress];
  v6 = [v5 addressString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [HMFAttributeDescription alloc];
  objc_super v4 = [(HMFHTTPClientConnection *)self peerAddress];
  id v5 = [(HMFAttributeDescription *)v3 initWithName:@"Address" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMFNetAddress)peerAddress
{
  v2 = [(HMFHTTPClientConnection *)self internal];
  v3 = [v2 address];

  return (HMFNetAddress *)v3;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFHTTPClientConnection *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMFHTTPClientConnection_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5957780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__HMFHTTPClientConnection_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v14 = 138543362;
    objc_super v15 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Opening", (uint8_t *)&v14, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) internal];
  char v7 = [v6 open];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    dispatch_queue_t v9 = (void *)MEMORY[0x19F3A87A0]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = HMFGetLogIdentifier(v10);
      int v14 = 138543362;
      objc_super v15 = v12;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open connection", (uint8_t *)&v14, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Failed to open connection."];
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);
  }
}

- (void)close
{
  id v3 = [(HMFHTTPClientConnection *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMFHTTPClientConnection_close__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v3, block);
}

void __32__HMFHTTPClientConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) internal];
  int v3 = [v2 isValid];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier(v5);
      int v13 = 138543362;
      int v14 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Closing", (uint8_t *)&v13, 0xCu);
    }
    id v8 = [*(id *)(a1 + 32) internal];
    [v8 close];

    dispatch_queue_t v9 = [*(id *)(a1 + 32) delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) delegate];
      v12 = v11;
      if (v11) {
        [v11 connection:*(void *)(a1 + 32) didCloseWithError:0];
      }
    }
  }
}

- (void)sendResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(HMFHTTPClientConnection *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMFHTTPClientConnection_sendResponse_completionHandler___block_invoke;
    block[3] = &unk_1E5958338;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __58__HMFHTTPClientConnection_sendResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    uint64_t v6 = *(void *)(a1 + 40);
    int v16 = 138543618;
    v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    [v9 setCompletionHandler:*(void *)(a1 + 48)];
    id v10 = [*(id *)(a1 + 32) internal];
    [v10 sendResponse:v9];
LABEL_12:

    goto LABEL_13;
  }
  id v11 = (void *)MEMORY[0x19F3A87A0]();
  id v12 = *(id *)(a1 + 32);
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v14 = HMFGetLogIdentifier(v12);
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_ERROR, "%{public}@The response is invalid: %@", (uint8_t *)&v16, 0x16u);
  }
  if (*(void *)(a1 + 48))
  {
    id v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)connection:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMFHTTPClientConnection *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMFHTTPClientConnection_connection_didReceiveRequest___block_invoke;
  block[3] = &unk_1E5957CF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __56__HMFHTTPClientConnection_connection_didReceiveRequest___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    id v6 = *(HMFHTTPRequest **)(a1 + 40);
    int v18 = 138543618;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received request: %@", (uint8_t *)&v18, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [[HMFHTTPRequest alloc] initWithInternalRequest:*(void *)(a1 + 40)];
    id v9 = (void *)MEMORY[0x19F3A87A0]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier(v10);
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", (uint8_t *)&v18, 0x16u);
    }
    [v7 connection:*(void *)(a1 + 32) didReceiveRequest:v8];
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A87A0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = HMFGetLogIdentifier(v14);
      v17 = *(HMFHTTPRequest **)(a1 + 40);
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Received unhandled request: %@", (uint8_t *)&v18, 0x16u);
    }
    id v8 = [[_HMFCFHTTPServerResponse alloc] initWithRequest:*(void *)(a1 + 40) statusCode:501];
    [*(id *)(a1 + 48) sendResponse:v8];
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_14 != -1) {
    dispatch_once(&_MergedGlobals_3_14, &__block_literal_global_36);
  }
  v2 = (void *)qword_1EB4EEB90;
  return v2;
}

uint64_t __38__HMFHTTPClientConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Networking.HTTP.Server.Connection", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEB90;
  qword_1EB4EEB90 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)logIdentifier
{
  v2 = [(HMFHTTPClientConnection *)self peerAddress];
  id v3 = [v2 addressString];

  return v3;
}

- (HMFHTTPClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFHTTPClientConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)pendingRespones
{
  return self->_pendingRespones;
}

- (_HMFCFHTTPServerConnection)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_pendingRespones, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end