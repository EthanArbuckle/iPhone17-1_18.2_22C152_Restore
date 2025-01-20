@interface _HMDHTTPServerClientConnection
+ (id)shortDescription;
- (BOOL)isConnected;
- (HMDHTTPDevice)device;
- (HMFHTTPClientConnection)connection;
- (HMFTimer)lostConnectionTimer;
- (NSMutableArray)receiveMessageRequests;
- (NSOperationQueue)requestOperationQueue;
- (NSOperationQueue)transactionOperationQueue;
- (_HMDHTTPServerClientConnection)init;
- (_HMDHTTPServerClientConnection)initWithDevice:(id)a3;
- (id)debugDescription;
- (id)dequeueRequest;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)removeCompletionHandlerForTransactionIdentifier:(id)a3;
- (id)shortDescription;
- (void)_reallySendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)addCompletionHandler:(id)a3 forTransactionIdentifier:(id)a4;
- (void)invalidate;
- (void)queueRequest:(id)a3;
- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation _HMDHTTPServerClientConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostConnectionTimer, 0);
  objc_storeStrong((id *)&self->_transactionOperationQueue, 0);
  objc_storeStrong((id *)&self->_receiveMessageRequests, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pendingTransactionCompletionHandlers, 0);
}

- (HMFTimer)lostConnectionTimer
{
  return self->_lostConnectionTimer;
}

- (NSOperationQueue)transactionOperationQueue
{
  return self->_transactionOperationQueue;
}

- (NSMutableArray)receiveMessageRequests
{
  return self->_receiveMessageRequests;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (HMFHTTPClientConnection)connection
{
  return self->_connection;
}

- (HMDHTTPDevice)device
{
  return self->_device;
}

- (void)_reallySendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a5;
  v9 = [(_HMDHTTPServerClientConnection *)self dequeueRequest];
  if (v9)
  {
    id v41 = 0;
    v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v30 format:100 options:0 error:&v41];
    v11 = (uint64_t (*)(uint64_t, uint64_t))v41;
    if (v10)
    {
      uint64_t v12 = 200;
    }
    else
    {
      v18 = (void *)MEMORY[0x1D9452090]();
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        v21 = [(_HMDHTTPServerClientConnection *)self shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        v43 = v11;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to serialize response message with error: %@", buf, 0x20u);
      }
      uint64_t v12 = 400;
    }
    v22 = [v9 responseWithStatusCode:v12];
    v23 = (void *)[v22 mutableCopy];

    if (v10) {
      [v23 setBody:v10];
    }
    v24 = [MEMORY[0x1E4F29128] UUID];
    v25 = [v24 UUIDString];
    [v23 setHeaderValue:v25 forHeaderKey:@"Transaction-Identifier"];

    v26 = (void *)[objc_alloc(MEMORY[0x1E4F65400]) initWithTimeout:a4];
    objc_initWeak(&location, v26);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__102232;
    v44 = __Block_byref_object_dispose__102233;
    id v45 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke;
    v35[3] = &unk_1E6A0EF20;
    objc_copyWeak(&v39, &location);
    v35[4] = self;
    id v27 = v24;
    id v36 = v27;
    v38 = buf;
    id v28 = v23;
    id v37 = v28;
    [v26 addExecutionBlock:v35];
    if (v8)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_57;
      v31[3] = &unk_1E6A0EF48;
      objc_copyWeak(&v34, &location);
      id v32 = v8;
      v33 = buf;
      [v26 setCompletionBlock:v31];

      objc_destroyWeak(&v34);
    }
    v29 = [(_HMDHTTPServerClientConnection *)self transactionOperationQueue];
    [v29 addOperation:v26];

    objc_destroyWeak(&v39);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [(_HMDHTTPServerClientConnection *)self shortDescription];
    v17 = [(_HMDHTTPServerClientConnection *)self device];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v43 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to send message to device, %@, there is no queued request", buf, 0x20u);
  }
  if (v8)
  {
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication Failure." reason:@"There is no queued request to send the message." suggestion:0];
    (*((void (**)(id, void, uint64_t (*)(uint64_t, uint64_t)))v8 + 2))(v8, 0, v11);
LABEL_16:
  }
}

- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v11 = v10;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F65400]) initWithTimeout:a4];
  objc_initWeak(&location, v12);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke;
  v24[3] = &unk_1E6A0EEA8;
  objc_copyWeak(v27, &location);
  v27[1] = v11;
  v27[2] = *(id *)&a4;
  v24[4] = self;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  [v12 addExecutionBlock:v24];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke_2;
  v20 = &unk_1E6A10B58;
  objc_copyWeak(&v23, &location);
  v21 = self;
  id v15 = v14;
  id v22 = v15;
  [v12 setCompletionBlock:&v17];
  v16 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
  [v16 addOperation:v12];

  objc_destroyWeak(&v23);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

- (id)dequeueRequest
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(_HMDHTTPServerClientConnection *)self receiveMessageRequests];
  v4 = [v3 firstObject];

  v5 = [(_HMDHTTPServerClientConnection *)self receiveMessageRequests];
  [v5 removeObject:v4];

  v6 = [(_HMDHTTPServerClientConnection *)self receiveMessageRequests];
  if ([v6 count])
  {
  }
  else
  {
    v7 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
    char v8 = [v7 isSuspended];

    if ((v8 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = HMFGetLogIdentifier();
        uint64_t v12 = [(_HMDHTTPServerClientConnection *)self shortDescription];
        int v16 = 138543618;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Suspending the request queue as there are no more queued requests", (uint8_t *)&v16, 0x16u);
      }
      id v13 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
      [v13 setSuspended:1];

      id v14 = [(_HMDHTTPServerClientConnection *)self lostConnectionTimer];
      [v14 resume];
    }
  }
  return v4;
}

- (void)queueRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(_HMDHTTPServerClientConnection *)self receiveMessageRequests];
    [v5 addObject:v4];

    v6 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
    int v7 = [v6 isSuspended];

    if (v7)
    {
      char v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = HMFGetLogIdentifier();
        v11 = [(_HMDHTTPServerClientConnection *)self shortDescription];
        int v14 = 138543618;
        id v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Resuming the request queue as there are queued requests", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v12 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
      [v12 setSuspended:0];
    }
    id v13 = [(_HMDHTTPServerClientConnection *)self lostConnectionTimer];
    [v13 suspend];
  }
}

- (void)setConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_HMDHTTPServerClientConnection *)self connection];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    char v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(_HMDHTTPServerClientConnection *)self shortDescription];
      int v16 = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection, removing all queued requests and suspending the request queue", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(_HMDHTTPServerClientConnection *)self receiveMessageRequests];
    [v12 removeAllObjects];

    id v13 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
    [v13 setSuspended:1];

    int v14 = [(_HMDHTTPServerClientConnection *)self lostConnectionTimer];
    id v15 = v14;
    if (v5) {
      [v14 suspend];
    }
    else {
      [v14 resume];
    }
  }
}

- (id)removeCompletionHandlerForTransactionIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_pendingTransactionCompletionHandlers objectForKeyedSubscript:v4];
  if (v6) {
    [(NSMutableDictionary *)self->_pendingTransactionCompletionHandlers removeObjectForKey:v4];
  }
  char v7 = _Block_copy(v6);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addCompletionHandler:(id)a3 forTransactionIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  char v7 = (void *)[v9 copy];
  char v8 = _Block_copy(v7);
  [(NSMutableDictionary *)self->_pendingTransactionCompletionHandlers setObject:v8 forKeyedSubscript:v6];

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isConnected
{
  v2 = [(_HMDHTTPServerClientConnection *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  return [(_HMDHTTPServerClientConnection *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(_HMDHTTPServerClientConnection *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  id v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  char v7 = [(_HMDHTTPServerClientConnection *)self device];
  uint64_t v8 = [(_HMDHTTPServerClientConnection *)self connection];
  id v9 = (void *)v8;
  if (a3)
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v11 = [v5 stringWithFormat:@"<%@ %@, Device = %@, Connection = %@>", v6, v7, v9, v10];
  }
  else
  {
    v11 = [v5 stringWithFormat:@"<%@ %@, Device = %@, Connection = %@>", v6, v7, v8, &stru_1F2C9F1A8];
  }

  return v11;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(_HMDHTTPServerClientConnection *)self device];
  id v6 = [v5 identifier];
  char v7 = [v6 UUIDString];
  uint64_t v8 = [v3 stringWithFormat:@"%@ %@", v4, v7];

  return v8;
}

- (void)invalidate
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:@"Operation cancelled." reason:@"The client connection is no longer valid." suggestion:0];
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_pendingTransactionCompletionHandlers allValues];
  [(NSMutableDictionary *)self->_pendingTransactionCompletionHandlers removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    __int16 v18 = [(_HMDHTTPServerClientConnection *)self shortDescription];
    uint64_t v7 = [v4 count];
    uint64_t v8 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
    uint64_t v9 = [v8 operationCount];
    v10 = [(_HMDHTTPServerClientConnection *)self transactionOperationQueue];
    *(_DWORD *)buf = 138544386;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2048;
    uint64_t v32 = v9;
    __int16 v33 = 2048;
    uint64_t v34 = [v10 operationCount];
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Invalidating: outstanding pendingHandlers=%lu, requests=%lu, transactions=%lu", buf, 0x34u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v15 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
  [v15 cancelAllOperationsWithError:v3];

  int v16 = [(_HMDHTTPServerClientConnection *)self requestOperationQueue];
  [v16 setSuspended:0];

  uint64_t v17 = [(_HMDHTTPServerClientConnection *)self transactionOperationQueue];
  [v17 cancelAllOperationsWithError:v3];
}

- (_HMDHTTPServerClientConnection)initWithDevice:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HMDHTTPServerClientConnection;
  id v6 = [(_HMDHTTPServerClientConnection *)&v26 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    receiveMessageRequests = v7->_receiveMessageRequests;
    v7->_receiveMessageRequests = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingTransactionCompletionHandlers = v7->_pendingTransactionCompletionHandlers;
    v7->_pendingTransactionCompletionHandlers = (NSMutableDictionary *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:10.0];
    lostConnectionTimer = v7->_lostConnectionTimer;
    v7->_lostConnectionTimer = (HMFTimer *)v12;

    uint64_t v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v15 = NSString;
    HMDispatchQueueNameString();
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", @"%s", objc_msgSend(v16, "UTF8String"));
    [(NSOperationQueue *)v14 setName:v17];

    [(NSOperationQueue *)v14 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v14 setQualityOfService:25];
    [(NSOperationQueue *)v14 setSuspended:1];
    requestOperationQueue = v7->_requestOperationQueue;
    v7->_requestOperationQueue = v14;
    v19 = v14;

    long long v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    long long v21 = NSString;
    HMDispatchQueueNameString();
    id v22 = objc_claimAutoreleasedReturnValue();
    long long v23 = objc_msgSend(v21, "stringWithFormat:", @"%s", objc_msgSend(v22, "UTF8String"));
    [(NSOperationQueue *)v20 setName:v23];

    [(NSOperationQueue *)v20 setQualityOfService:25];
    transactionOperationQueue = v7->_transactionOperationQueue;
    v7->_transactionOperationQueue = v20;
  }
  return v7;
}

- (_HMDHTTPServerClientConnection)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end