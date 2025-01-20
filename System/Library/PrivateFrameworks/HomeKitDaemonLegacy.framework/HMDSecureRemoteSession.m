@interface HMDSecureRemoteSession
+ (BOOL)isSecureRemoteSessionMessage:(id)a3;
+ (id)logCategory;
- (BOOL)isReachable;
- (HMDAccountRegistry)accountRegistry;
- (HMDDevice)device;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDSecureRemoteSession)init;
- (HMDSecureRemoteSession)initWithDevice:(id)a3 deviceMonitor:(id)a4 accountRegistry:(id)a5;
- (HMDSecureRemoteSession)initWithDevice:(id)a3 deviceMonitor:(id)a4 accountRegistry:(id)a5 dataSource:(id)a6;
- (HMDSecureRemoteSessionDataSource)dataSource;
- (NSArray)clientStreams;
- (NSArray)pendingMessages;
- (NSArray)serverStreams;
- (OS_dispatch_queue)clientQueue;
- (id)_clientStreamForMessage:(id)a3;
- (id)_clientStreamWithIdentiifer:(id)a3;
- (id)_dequeMessage;
- (id)_serverStreamWithIdentifier:(id)a3;
- (id)dumpState;
- (id)logIdentifier;
- (int64_t)state;
- (unint64_t)maximumRemoteStreams;
- (void)_closeClientStream:(id)a3 error:(id)a4;
- (void)_closeServerStream:(id)a3 error:(id)a4;
- (void)_closeWithError:(id)a3;
- (void)_handleSecureClientMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5;
- (void)_handleSecureServerMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5;
- (void)_handleStreamInvalidationMessage:(id)a3;
- (void)_openClientStreamWithCompletionHandler:(id)a3;
- (void)_openServerStreamWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_queueMessage:(id)a3;
- (void)close;
- (void)dealloc;
- (void)handleDeviceIsNotReachable:(id)a3;
- (void)handleDeviceIsReachable:(id)a3;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)openWithCompletionHandler:(id)a3;
- (void)receivedSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5;
- (void)secureRemoteStream:(id)a3 didCloseWithError:(id)a4;
- (void)secureRemoteStream:(id)a3 receivedRequestToSendMessage:(id)a4;
- (void)secureRemoteStreamIsIdle:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setMaximumRemoteStreams:(unint64_t)a3;
- (void)setReachable:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSecureRemoteSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serverStreams, 0);
  objc_storeStrong((id *)&self->_clientStreams, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setMaximumRemoteStreams:(unint64_t)a3
{
  self->_maximumRemoteStreams = a3;
}

- (unint64_t)maximumRemoteStreams
{
  return self->_maximumRemoteStreams;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return self->_deviceMonitor;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDSecureRemoteSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDSecureRemoteSession *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  pendingMessages = self->_pendingMessages;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__HMDSecureRemoteSession_timerDidFire___block_invoke;
  v19[3] = &unk_1E6A0ABF0;
  id v7 = v4;
  id v20 = v7;
  v8 = [(NSMutableArray *)pendingMessages hmf_objectPassingTest:v19];
  if (v8)
  {
    [(NSMutableArray *)self->_pendingMessages removeObject:v8];

    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v8 message];
      v14 = [v13 shortDescription];
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Queued message timed out: %@", buf, 0x16u);
    }
    v15 = [v8 message];
    v16 = [v15 responseHandler];

    if (v16)
    {
      v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
      v18 = [v15 responseHandler];
      ((void (**)(void, void *, void))v18)[2](v18, v17, 0);
    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __39__HMDSecureRemoteSession_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 timer];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)logIdentifier
{
  v2 = [(HMDSecureRemoteSession *)self device];
  v3 = [v2 identifier];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (id)dumpState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(HMDSecureRemoteSession *)self clientQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __35__HMDSecureRemoteSession_dumpState__block_invoke;
  v11 = &unk_1E6A197C8;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

void __35__HMDSecureRemoteSession_dumpState__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", objc_msgSend(*(id *)(a1 + 40), "maximumRemoteStreams"));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"maximumStreams"];

  v3 = [*(id *)(a1 + 40) device];
  uint64_t v4 = [v3 shortDescription];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"device"];

  id v5 = [*(id *)(a1 + 40) pendingMessages];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v38 + 1) + 8 * v11) message];
        v13 = [v12 shortDescription];
        [v6 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"queuedMessages"];
  v14 = [*(id *)(a1 + 40) clientStreams];
  v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v34 + 1) + 8 * v20) description];
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v18);
  }

  [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:@"clientStreams"];
  v22 = [*(id *)(a1 + 40) serverStreams];
  __int16 v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v30 + 1) + 8 * v28) description];
        [v23 addObject:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v26);
  }

  [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:@"serverStreams"];
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFMessageTransport *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 messageTransport:self didReceiveMessage:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v16, 0x16u);
    }
    v13 = [v7 responseHandler];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      v15 = [v7 responseHandler];
      ((void (**)(void, void *, void))v15)[2](v15, v14, 0);
    }
  }
}

- (void)secureRemoteStream:(id)a3 receivedRequestToSendMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFMessageTransport *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2E7B7A8]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (objc_opt_respondsToSelector())
  {
    [v10 secureRemoteSession:self receivedRequestToSendMessage:v7];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v18, 0x16u);
    }
    v15 = [v7 responseHandler];

    if (v15)
    {
      int v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      uint64_t v17 = [v7 responseHandler];
      ((void (**)(void, void *, void))v17)[2](v17, v16, 0);
    }
  }
}

- (void)secureRemoteStream:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDSecureRemoteSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDSecureRemoteSession_secureRemoteStream_didCloseWithError___block_invoke;
  block[3] = &unk_1E6A19668;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__HMDSecureRemoteSession_secureRemoteStream_didCloseWithError___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] role] == 1)
  {
    uint64_t v3 = a1[4];
    v2 = (void *)a1[5];
    uint64_t v4 = a1[6];
    return [v2 _closeClientStream:v3 error:v4];
  }
  else
  {
    uint64_t result = [(id)a1[4] role];
    if (result == 2)
    {
      uint64_t v7 = a1[4];
      id v6 = (void *)a1[5];
      uint64_t v8 = a1[6];
      return [v6 _closeServerStream:v7 error:v8];
    }
  }
  return result;
}

- (void)secureRemoteStreamIsIdle:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSecureRemoteSession *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v12 = 138543618;
    v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Stream is idle: %@", (uint8_t *)&v12, 0x16u);
  }
  if ([*(id *)(a1 + 40) isOpen])
  {
    if ([*(id *)(a1 + 40) role] == 1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) pendingMessages];
      id v8 = [v7 firstObject];
      id v9 = [v8 message];
      [v9 qualityOfService];
      [*(id *)(a1 + 40) qualityOfService];
      uint64_t v10 = HMFQualityOfServiceCompare();

      if (v10 != -1)
      {
        uint64_t v11 = [*(id *)(a1 + 32) _dequeMessage];
        if (v11) {
          [*(id *)(a1 + 40) sendMessage:v11 completionHandler:0];
        }
      }
    }
  }
}

- (void)_closeServerStream:(id)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  if (![(NSMutableArray *)self->_serverStreams containsObject:v6])
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_21;
  }
  [(NSMutableArray *)self->_serverStreams removeObject:v6];
  long long v32 = (void *)[(NSMutableArray *)self->_serverStreams copy];
  os_unfair_lock_unlock(&self->_lock);
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    __int16 v43 = 2112;
    id v44 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Server stream stopped due to error %@", buf, 0x16u);
  }
  int v12 = [(HMFMessageTransport *)v9 delegate];
  if ([v12 conformsToProtocol:&unk_1F2E7B7A8]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v33 = v13;

  if (objc_opt_respondsToSelector())
  {
    __int16 v14 = [v7 domain];
    if (![v14 isEqualToString:*MEMORY[0x1E4F28760]])
    {
LABEL_18:

      goto LABEL_19;
    }
    BOOL v15 = [v7 code] == -6722;

    if (!v15)
    {
      __int16 v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v9, "maximumRemoteStreams"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v16 = v32;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v35;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v16);
            }
            __int16 v20 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v19), "sessionID", v32);
            id v21 = [v20 UUIDString];
            [v14 addObject:v21];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v17);
      }

      uint64_t v22 = [HMDRemoteDeviceMessageDestination alloc];
      __int16 v23 = [MEMORY[0x1E4F65488] allMessageDestinations];
      id v24 = [v23 target];
      uint64_t v25 = [v6 peerDevice];
      uint64_t v26 = [(HMDRemoteDeviceMessageDestination *)v22 initWithTarget:v24 device:v25];

      uint64_t v27 = (void *)MEMORY[0x1E4F65480];
      v38[0] = @"kIDSSecureSessionIDKey";
      uint64_t v28 = [v6 sessionID];
      v29 = [v28 UUIDString];
      v38[1] = @"streams";
      v39[0] = v29;
      v39[1] = v14;
      long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
      long long v31 = [v27 messageWithName:@"kSecureSessionInvalidatedNotificationKey" destination:v26 payload:v30];

      [v33 secureRemoteSession:v9 receivedRequestToSendMessage:v31];
      goto LABEL_18;
    }
  }
LABEL_19:

LABEL_21:
}

- (void)_openServerStreamWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSecureRemoteSession *)self serverStreams];
  id v9 = (void *)[v8 mutableCopy];

  unint64_t v10 = [v9 count];
  if (v10 >= [(HMDSecureRemoteSession *)self maximumRemoteStreams])
  {
    [v9 sortUsingComparator:&__block_literal_global_48294];
    uint64_t v11 = [v9 firstObject];
    [v11 stop];
  }
  int v12 = [(HMDSecureRemoteSession *)self dataSource];
  v13 = [(HMDSecureRemoteSession *)self device];
  __int16 v14 = [v12 createSecureStreamWithPeerDevice:v13 clientMode:0 sessionID:v6];

  [v14 setDelegate:self];
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_serverStreams addObject:v14];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v14);
  BOOL v15 = [(HMDSecureRemoteSession *)self clientQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_2;
  v17[3] = &unk_1E6A0ABA0;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  id v16 = v7;
  id v18 = v16;
  [v14 startAndInvokeOnQueue:v15 completionHandler:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_3;
    v7[3] = &unk_1E6A17B18;
    objc_copyWeak(&v11, a1 + 6);
    id v8 = v3;
    id v9 = v5;
    id v10 = a1[4];
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
  }
}

void __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 40);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138543618;
      int v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Failed to start server stream due to error: %@", (uint8_t *)&v11, 0x16u);
    }
    id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 16);
    os_unfair_lock_lock_with_options();
    if (WeakRetained
      && [*(id *)(*(void *)(a1 + 40) + 40) containsObject:WeakRetained])
    {
      [*(id *)(*(void *)(a1 + 40) + 40) removeObject:WeakRetained];
      os_unfair_lock_unlock(v8);
      [WeakRetained stop];
    }
    else
    {
      os_unfair_lock_unlock(v8);
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    if (*(void *)(a1 + 32)) {
      id v10 = 0;
    }
    else {
      id v10 = WeakRetained;
    }
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

uint64_t __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  int v11 = [v7 lastActivity];

  int v12 = [v10 lastActivity];

  uint64_t v13 = [v11 compare:v12];
  return v13;
}

- (void)_closeClientStream:(id)a3 error:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  if (![(NSMutableArray *)self->_clientStreams containsObject:v6])
  {
    os_unfair_lock_unlock(&self->_lock);
    id v8 = 0;
    goto LABEL_28;
  }
  [(NSMutableArray *)self->_clientStreams removeObject:v6];
  id v8 = (void *)[(NSMutableArray *)self->_clientStreams copy];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v37 = v12;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Client stream stopped due to error %@", buf, 0x16u);
  }
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = v10;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v37 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Last client stream closed, attempting to open a new client stream", buf, 0xCu);
    }
LABEL_7:

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke;
    v30[3] = &unk_1E6A0ABC8;
    v30[4] = v10;
    [(HMDSecureRemoteSession *)v10 _openClientStreamWithCompletionHandler:v30];
    goto LABEL_21;
  }
  if ([v6 qualityOfService] == 9)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v17);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * v20) qualityOfService] == 9)
          {

            goto LABEL_21;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = v10;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v37 = v21;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Last background client stream closed, attempting to open a new client stream", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_21:
  if (v7)
  {
    uint64_t v22 = [v7 domain];
    if ([v22 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      BOOL v23 = [v7 code] == -6722;

      if (v23)
      {
        id v24 = (void *)MEMORY[0x1D9452090]();
        uint64_t v25 = v10;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v37 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Confirming the remote device is reachable due to stream error", buf, 0xCu);
        }
        uint64_t v28 = [(HMDSecureRemoteSession *)v25 deviceMonitor];
        v29 = [(HMDSecureRemoteSession *)v25 device];
        [v28 confirmDevice:v29 forClient:v25 timeout:0 completionHandler:0.0];
      }
    }
    else
    {
    }
  }
LABEL_28:
}

void __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open primary stream, closing session", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) _closeWithError:v6];
  }
}

- (void)_openClientStreamWithCompletionHandler:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDSecureRemoteSession *)self clientStreams];
  unint64_t v6 = [v5 count];
  BOOL v7 = v6 < [(HMDSecureRemoteSession *)self maximumRemoteStreams];
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  int v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v38 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Opening client stream", buf, 0xCu);
    }
    uint64_t v13 = [(HMDSecureRemoteSession *)v9 dataSource];
    uint64_t v14 = [(HMDSecureRemoteSession *)v9 device];
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v13 createSecureStreamWithPeerDevice:v14 clientMode:1 sessionID:v15];

    [v16 setDelegate:v9];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v5;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v17);
          }
          if ([*(id *)(*((void *)&v33 + 1) + 8 * i) qualityOfService] == 9)
          {
            uint64_t v22 = (void *)MEMORY[0x1D9452090]();
            BOOL v23 = v9;
            id v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = HMFGetLogIdentifier();
              uint64_t v26 = HMFQualityOfServiceToString();
              *(_DWORD *)buf = 138543618;
              __int16 v38 = v25;
              __int16 v39 = 2112;
              uint64_t v40 = v26;
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting QoS to %@ for client stream", buf, 0x16u);
            }
            [v16 setQualityOfService:17];
            goto LABEL_20;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)v9->_clientStreams addObject:v16];
    os_unfair_lock_unlock(&v9->_lock);
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, v16);
    uint64_t v27 = [(HMDSecureRemoteSession *)v9 clientQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke;
    v28[3] = &unk_1E6A0ABA0;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    id v29 = v4;
    [v16 startAndInvokeOnQueue:v27 completionHandler:v28];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v38 = v21;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Cannot open additional streams", buf, 0xCu);
  }
  if (v4)
  {
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:49];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v16);
LABEL_21:
  }
}

void __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v6 = [WeakRetained clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E6A17B18;
    objc_copyWeak(&v11, a1 + 6);
    id v8 = v3;
    uint64_t v9 = v5;
    id v10 = a1[4];
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
  }
}

void __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 40);
    unint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      id v8 = *(void **)(a1 + 32);
      int v27 = 138543618;
      uint64_t v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to start client stream due to error: %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v9 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 16);
    os_unfair_lock_lock_with_options();
    if (v3 && [*(id *)(*(void *)(a1 + 40) + 32) containsObject:v3])
    {
      [*(id *)(*(void *)(a1 + 40) + 32) removeObject:v3];
      os_unfair_lock_unlock(v9);
      [v3 stop];
    }
    else
    {
      os_unfair_lock_unlock(v9);
    }
    id v10 = [*(id *)(a1 + 32) domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      BOOL v11 = [*(id *)(a1 + 32) code] == -6722;

      if (!v11) {
        goto LABEL_20;
      }
      int v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v27 = 138543362;
        uint64_t v28 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Confirming the remote device is reachable", (uint8_t *)&v27, 0xCu);
      }
      id v10 = [*(id *)(a1 + 40) deviceMonitor];
      id v16 = [*(id *)(a1 + 40) device];
      [v10 confirmDevice:v16 forClient:*(void *)(a1 + 40) timeout:0 completionHandler:0.0];
    }
    goto LABEL_19;
  }
  if (WeakRetained)
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v27 = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Opened client stream: %@", (uint8_t *)&v27, 0x16u);
    }
    id v21 = [*(id *)(a1 + 40) pendingMessages];
    uint64_t v22 = [v21 firstObject];
    BOOL v23 = [v22 message];
    [v23 qualityOfService];
    [v3 qualityOfService];
    uint64_t v24 = HMFQualityOfServiceCompare();

    if (v24 != -1)
    {
      id v10 = [*(id *)(a1 + 40) _dequeMessage];
      if (v10) {
        [v3 sendMessage:v10 completionHandler:0];
      }
LABEL_19:
    }
  }
LABEL_20:
  uint64_t v25 = *(void *)(a1 + 48);
  if (v25)
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = v3;
    }
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
}

- (id)_serverStreamWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDSecureRemoteSession *)self serverStreams];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 sessionID];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_clientStreamForMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HMDSecureRemoteSession *)self clientStreams];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v4 qualityOfService];
        [v9 qualityOfService];
        if (HMFQualityOfServiceCompare() != -1
          && [v9 isOpen]
          && ([v9 isIdle] & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_13;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (id)_clientStreamWithIdentiifer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDSecureRemoteSession *)self clientStreams];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 sessionID];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleDeviceIsNotReachable:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(HMDSecureRemoteSession *)self device];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [(HMDSecureRemoteSession *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMDSecureRemoteSession_handleDeviceIsNotReachable___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v7, block);
  }
}

uint64_t __53__HMDSecureRemoteSession_handleDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isReachable];
  if (result)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is no longer reachable", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 32) setReachable:0];
  }
  return result;
}

- (void)handleDeviceIsReachable:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(HMDSecureRemoteSession *)self device];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    int v7 = [(HMDSecureRemoteSession *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HMDSecureRemoteSession_handleDeviceIsReachable___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v7, block);
  }
}

void __50__HMDSecureRemoteSession_handleDeviceIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isReachable] & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is reachable", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setReachable:1];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v6 = objc_msgSend(*(id *)(a1 + 32), "clientStreams", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v11 isOpen])
          {
            long long v12 = [*(id *)(a1 + 32) pendingMessages];
            long long v13 = [v12 firstObject];
            long long v14 = [v13 message];
            [v14 qualityOfService];
            [v11 qualityOfService];
            uint64_t v15 = HMFQualityOfServiceCompare();

            if (v15 != -1)
            {
              long long v16 = [*(id *)(a1 + 32) _dequeMessage];
              if (v16) {
                [v11 sendMessage:v16 completionHandler:0];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v17 = [*(id *)(a1 + 32) pendingMessages];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      for (unint64_t j = 0; j != v18; ++j)
      {
        if (j >= [*(id *)(a1 + 32) maximumRemoteStreams]) {
          break;
        }
        [*(id *)(a1 + 32) _openClientStreamWithCompletionHandler:0];
      }
    }
  }
}

- (void)_handleStreamInvalidationMessage:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kIDSSecureSessionIDKey"];
  int v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v9;
    __int16 v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received invalidation message for stream %@", buf, 0x16u);
  }
  id v10 = [(HMDSecureRemoteSession *)v7 _clientStreamWithIdentiifer:v5];
  if (v10)
  {
    char v11 = (void *)MEMORY[0x1D9452090]();
    long long v12 = v7;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v14;
      __int16 v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Closing stream due to remote invalidation: %@", buf, 0x16u);
    }
    [v10 stop];
  }
  uint64_t v15 = [v4 arrayForKey:@"streams"];
  if (v15)
  {
    long long v35 = v10;
    long long v36 = v5;
    id v37 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v16 = [(HMDSecureRemoteSession *)v7 clientStreams];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        uint64_t v20 = 0;
        uint64_t v38 = v18;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
          long long v22 = [v21 sessionID];
          long long v23 = [v22 UUIDString];
          char v24 = [v15 containsObject:v23];

          if ((v24 & 1) == 0)
          {
            uint64_t v25 = (void *)MEMORY[0x1D9452090]();
            uint64_t v26 = v7;
            uint64_t v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              uint64_t v28 = v19;
              __int16 v29 = v15;
              id v30 = v16;
              v32 = uint64_t v31 = v7;
              *(_DWORD *)buf = 138543618;
              uint64_t v45 = v32;
              __int16 v46 = 2112;
              v47 = v21;
              _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Closing inactive stream due to remote invalidation: %@", buf, 0x16u);

              uint64_t v7 = v31;
              long long v16 = v30;
              uint64_t v15 = v29;
              uint64_t v19 = v28;
              uint64_t v18 = v38;
            }

            [v21 stop];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v18);
    }

    id v5 = v36;
    id v4 = v37;
    id v10 = v35;
  }
  long long v33 = [v4 responseHandler];

  if (v33)
  {
    long long v34 = [v4 responseHandler];
    v34[2](v34, 0, 0);
  }
}

- (void)_handleSecureServerMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 uuidForKey:@"kIDSSecureSessionIDKey"];
  id v12 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v13 = v12;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = [(HMDSecureRemoteSession *)self _clientStreamWithIdentiifer:v11];
  if (v15 && v14)
  {
    long long v16 = [v8 messagePayload];
    [v15 handleSecureMessage:v16 fromDevice:v9 fromTransport:v14];

    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = id v26 = v9;
      long long v22 = [(HMDSecureRemoteSession *)v19 clientStreams];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      id v30 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Stream not found: %@", buf, 0x16u);

      id v9 = v26;
    }

    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    long long v23 = [(HMDSecureRemoteSession *)v19 device];
    [v14 postDidReceiveRemoteMessageWithNoListenerFromDevice:v23];
  }
  char v24 = [v8 responseHandler];

  if (v24)
  {
    uint64_t v25 = [v8 responseHandler];
    ((void (**)(void, void *, void))v25)[2](v25, v17, 0);
  }
}

- (void)_handleSecureClientMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  long long v13 = NSString;
  id v14 = MEMORY[0x1D94505D0](self, a2);
  uint64_t v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Messaging/Remote/Secure/HMDSecureRemoteSession.m", 624];
  id v30 = (id)[v12 initWithName:v15];

  long long v16 = [v9 uuidForKey:@"kIDSSecureSessionIDKey"];
  id v17 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = [(HMDSecureRemoteSession *)self _serverStreamWithIdentifier:v16];
  if (!v20 || !v19)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__HMDSecureRemoteSession__handleSecureClientMessage_fromDevice_transport___block_invoke;
    v24[3] = &unk_1E6A0AB78;
    id v25 = v30;
    id v26 = v9;
    id v27 = v10;
    id v28 = v19;
    [(HMDSecureRemoteSession *)self _openServerStreamWithIdentifier:v16 completionHandler:v24];

    long long v23 = (void (**)(void, void, void))v25;
    goto LABEL_9;
  }
  [v30 begin];
  id v29 = v30;
  long long v21 = [v9 messagePayload];
  [v20 handleSecureMessage:v21 fromDevice:v10 fromTransport:v19];

  __HMFActivityScopeLeave();
  long long v22 = [v9 responseHandler];

  if (v22)
  {
    long long v23 = [v9 responseHandler];
    v23[2](v23, 0, 0);
LABEL_9:
  }
  __HMFActivityScopeLeave();
}

void __74__HMDSecureRemoteSession__handleSecureClientMessage_fromDevice_transport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    [*(id *)(a1 + 32) begin];
    id v10 = *(id *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) messagePayload];
    [v5 handleSecureMessage:v7 fromDevice:*(void *)(a1 + 48) fromTransport:*(void *)(a1 + 56)];

    __HMFActivityScopeLeave();
  }
  id v8 = [*(id *)(a1 + 40) responseHandler];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) responseHandler];
    ((void (**)(void, id, void))v9)[2](v9, v6, 0);
  }
}

- (void)receivedSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F653F0] currentActivity];
  id v12 = [(HMDSecureRemoteSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HMDSecureRemoteSession_receivedSecureMessage_fromDevice_fromTransport___block_invoke;
  block[3] = &unk_1E6A190C0;
  id v18 = v11;
  id v19 = v8;
  uint64_t v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  dispatch_async(v12, block);
}

void __73__HMDSecureRemoteSession_receivedSecureMessage_fromDevice_fromTransport___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) name];
  if ([v5 isEqualToString:@"kSecureClientIDSMessageRequestKey"])
  {
    [*(id *)(a1 + 48) _handleSecureClientMessage:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 56) transport:*(void *)(a1 + 64)];
  }
  else if ([v5 isEqualToString:@"kSecureServerIDSMessageRequestKey"])
  {
    [*(id *)(a1 + 48) _handleSecureServerMessage:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 56) transport:*(void *)(a1 + 64)];
  }
  else if ([v5 isEqualToString:@"kSecureSessionInvalidatedNotificationKey"])
  {
    [*(id *)(a1 + 48) _handleStreamInvalidationMessage:*(void *)(a1 + 40)];
  }
  else
  {
    v2 = [*(id *)(a1 + 40) responseHandler];

    if (v2)
    {
      id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      id v4 = [*(id *)(a1 + 40) responseHandler];
      ((void (**)(void, void *, void))v4)[2](v4, v3, 0);
    }
  }
}

- (id)_dequeMessage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HMDSecureRemoteSession *)self isReachable])
  {
    os_unfair_lock_lock_with_options();
    id v3 = [(NSMutableArray *)self->_pendingMessages popFirstObject];
    os_unfair_lock_unlock(&self->_lock);
    if (v3)
    {
      id v4 = [v3 timer];
      [v4 suspend];

      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        id v9 = [v3 message];
        int v12 = 138543618;
        id v13 = v8;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Dequeuing message: %@", (uint8_t *)&v12, 0x16u);
      }
      id v10 = [v3 message];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (void)_queueMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing message: %@", buf, 0x16u);
  }
  id v9 = [[_HMDSecureRemoteQueuedMessage alloc] initWithMessage:v4];
  id v10 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  [v10 setDelegate:v6];

  id v11 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  int v12 = [(HMDSecureRemoteSession *)v6 clientQueue];
  [v11 setDelegateQueue:v12];

  id v13 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  [v13 resume];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v41 = 0;
  os_unfair_lock_lock_with_options();
  pendingMessages = v6->_pendingMessages;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = __40__HMDSecureRemoteSession__queueMessage___block_invoke;
  uint64_t v31 = &unk_1E6A0AB50;
  id v15 = v4;
  id v32 = v15;
  long long v33 = buf;
  [(NSMutableArray *)pendingMessages hmf_enumerateWithAutoreleasePoolUsingBlock:&v28];
  -[NSMutableArray insertObject:atIndex:](v6->_pendingMessages, "insertObject:atIndex:", v9, *(void *)(*(void *)&buf[8] + 24), v28, v29, v30, v31);

  os_unfair_lock_unlock(&v6->_lock);
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = v6;
  HMFGetOSLogHandle();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v15 identifier];
    id v21 = [v20 UUIDString];
    uint64_t v22 = *(void *)(*(void *)&buf[8] + 24);
    *(_DWORD *)long long v34 = 138543874;
    id v35 = v19;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2048;
    uint64_t v39 = v22;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Message, %@, queued at position %tu", v34, 0x20u);
  }
  long long v23 = (void *)MEMORY[0x1D9452090]();
  char v24 = v17;
  HMFGetOSLogHandle();
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = [(HMDSecureRemoteSession *)v24 pendingMessages];
    *(_DWORD *)long long v34 = 138543618;
    id v35 = v26;
    __int16 v36 = 2112;
    id v37 = v27;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Queued messages: %@", v34, 0x16u);
  }
  _Block_object_dispose(buf, 8);
}

void __40__HMDSecureRemoteSession__queueMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 qualityOfService];
  id v9 = [v8 message];

  [v9 qualityOfService];
  uint64_t v10 = HMFQualityOfServiceCompare();

  if (v10 == 1)
  {
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + 1;
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F653F0] currentActivity];
  id v9 = [(HMDSecureRemoteSession *)self clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HMDSecureRemoteSession_sendMessage_completionHandler___block_invoke;
  v13[3] = &unk_1E6A18398;
  id v14 = v8;
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__HMDSecureRemoteSession_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 40) state])
  {
    id v18 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v18;
    }
    else {
      v2 = 0;
    }
    id v3 = v2;

    if (!v3)
    {
      id v4 = [*(id *)(a1 + 48) name];
      id v5 = [*(id *)(a1 + 48) destination];
      id v6 = [*(id *)(a1 + 48) messagePayload];
      id v18 = +[HMDRemoteMessage secureMessageWithName:v4 destination:v5 messagePayload:v6];

      id v7 = [*(id *)(a1 + 48) identifier];
      [v18 setIdentifier:v7];

      id v8 = [*(id *)(a1 + 48) responseHandler];
      [v18 setResponseHandler:v8];
    }
    id v9 = [*(id *)(a1 + 40) _clientStreamForMessage:v18];
    if (v9 && [*(id *)(a1 + 40) isReachable])
    {
      [v9 sendMessage:v18 completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      [*(id *)(a1 + 40) _queueMessage:v18];
      [*(id *)(a1 + 40) _openClientStreamWithCompletionHandler:0];
      uint64_t v10 = *(void *)(a1 + 56);
      if (v10) {
        (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 48) shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot send message on closed session: %@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    }
    [*(id *)(a1 + 48) respondWithError:v16];
  }
}

- (void)_closeWithError:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v34 = v4;
  if (v4)
  {
    id v37 = v4;
  }
  else
  {
    id v37 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v54 = v8;
    __int16 v55 = 2112;
    v56 = v34;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Closed with error: %@", buf, 0x16u);
  }
  [(HMDSecureRemoteSession *)v6 setState:0];
  id v9 = [(HMFMessageTransport *)v6 delegate];
  if ([v9 conformsToProtocol:&unk_1F2E7B7A8]) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v35 = v10;

  if (objc_opt_respondsToSelector()) {
    [v35 secureRemoteSession:v6 didCloseWithError:v34];
  }
  os_unfair_lock_lock_with_options();
  id v11 = (void *)[(NSMutableArray *)v6->_pendingMessages copy];
  [(NSMutableArray *)v6->_pendingMessages removeAllObjects];
  long long v33 = (void *)[(NSMutableArray *)v6->_clientStreams copy];
  [(NSMutableArray *)v6->_clientStreams removeAllObjects];
  id v32 = (void *)[(NSMutableArray *)v6->_serverStreams copy];
  [(NSMutableArray *)v6->_serverStreams removeAllObjects];
  os_unfair_lock_unlock(&v6->_lock);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = [*(id *)(*((void *)&v46 + 1) + 8 * i) message];
        id v16 = (void *)MEMORY[0x1D9452090]();
        uint64_t v17 = v6;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v19;
          __int16 v55 = 2114;
          v56 = v15;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Cancelling queued message: %{public}@", buf, 0x16u);
        }
        uint64_t v20 = [v15 responseHandler];

        if (v20)
        {
          __int16 v21 = [v15 responseHandler];
          ((void (**)(void, id, void))v21)[2](v21, v37, 0);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v12);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v33;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * j) stop];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v23);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v26 = v32;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * k) stop];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v27);
  }

  id v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 removeObserver:v6 name:@"HMDRemoteDeviceIsReachableNotification" object:0];

  uint64_t v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 removeObserver:v6 name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];
}

- (void)close
{
  id v3 = [(HMDSecureRemoteSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HMDSecureRemoteSession_close__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__HMDSecureRemoteSession_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSecureRemoteSession *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Session already opened", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
  else
  {
    if (v6)
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Opening", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:1];
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:*(void *)(a1 + 32) selector:sel_handleDeviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:*(void *)(a1 + 32) selector:sel_handleDeviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

    uint64_t v12 = [*(id *)(a1 + 32) deviceMonitor];
    uint64_t v13 = [v12 unreachableDevices];
    id v14 = [*(id *)(a1 + 32) device];
    int v15 = [v13 containsObject:v14];

    [*(id *)(a1 + 32) setReachable:v15 ^ 1u];
    id v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_108;
    v17[3] = &unk_1E6A0AB28;
    void v17[4] = v16;
    id v18 = *(id *)(a1 + 40);
    [v16 _openClientStreamWithCompletionHandler:v17];
  }
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Opened", (uint8_t *)&v23, 0xCu);
    }
    [*(id *)(a1 + 32) setState:2];
    uint64_t v12 = [v5 maximumRemoteStreams];
    uint64_t v13 = v12;
    if (v12)
    {
      unint64_t v14 = maximumSecureRemoteStreams;
      unint64_t v15 = [v12 unsignedIntegerValue];
      if (v14 >= v15) {
        unint64_t v14 = v15;
      }
      if (v14 != [*(id *)(a1 + 32) maximumRemoteStreams])
      {
        id v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = *(id *)(a1 + 32);
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          int v23 = 138543618;
          uint64_t v24 = v19;
          __int16 v25 = 2048;
          unint64_t v26 = v14;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Upgrading number of streams to '%tu'", (uint8_t *)&v23, 0x16u);
        }
        [*(id *)(a1 + 32) setMaximumRemoteStreams:v14];
      }
    }

    uint64_t v20 = v6;
  }
  else
  {
    if (v10)
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v21;
      __int16 v25 = 2112;
      unint64_t v26 = (unint64_t)v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open initial client stream with error: %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v20 = v6;
    if (!v6)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
    }
    [*(id *)(a1 + 32) _closeWithError:v6];
  }
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v20);
  }
}

- (NSArray)serverStreams
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_serverStreams copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)clientStreams
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_clientStreams copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)pendingMessages
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_pendingMessages copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Secure Remote Session abandoned without being closed", buf, 0xCu);
    }
    [(HMFMessageTransport *)v4 setDelegate:0];
    [(HMDSecureRemoteSession *)v4 _closeWithError:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDSecureRemoteSession;
  [(HMDSecureRemoteSession *)&v7 dealloc];
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 deviceMonitor:(id)a4 accountRegistry:(id)a5 dataSource:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v31;
    id v32 = "%{public}@Device is required for HMDSecureRemoteSession";
LABEL_13:
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);

    goto LABEL_14;
  }
  if (!v12)
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v31;
    id v32 = "%{public}@Device monitor is required for HMDSecureRemoteSession";
    goto LABEL_13;
  }
  if (!v13)
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v31;
      id v32 = "%{public}@Account registry is required for HMDSecureRemoteSession";
      goto LABEL_13;
    }
LABEL_14:

    uint64_t v28 = 0;
    goto LABEL_15;
  }
  v34.receiver = self;
  v34.super_class = (Class)HMDSecureRemoteSession;
  unint64_t v15 = [(HMDSecureRemoteSession *)&v34 init];
  id v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_dataSource, a6);
    objc_storeStrong((id *)&v16->_device, a3);
    objc_storeStrong((id *)&v16->_deviceMonitor, a4);
    objc_storeStrong((id *)&v16->_accountRegistry, a5);
    HMDispatchQueueNameString();
    id v17 = objc_claimAutoreleasedReturnValue();
    id v18 = (const char *)[v17 UTF8String];
    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v20;

    v16->_maximumRemoteStreams = 1;
    v16->_reachable = 1;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    pendingMessages = v16->_pendingMessages;
    v16->_pendingMessages = (NSMutableArray *)v22;

    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v16, "maximumRemoteStreams"));
    clientStreams = v16->_clientStreams;
    v16->_clientStreams = (NSMutableArray *)v24;

    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v16, "maximumRemoteStreams"));
    serverStreams = v16->_serverStreams;
    v16->_serverStreams = (NSMutableArray *)v26;
  }
  self = v16;
  uint64_t v28 = self;
LABEL_15:

  return v28;
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 deviceMonitor:(id)a4 accountRegistry:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDSecureRemoteSessionDefaultDataSource);
  id v12 = [(HMDSecureRemoteSession *)self initWithDevice:v10 deviceMonitor:v9 accountRegistry:v8 dataSource:v11];

  return v12;
}

- (HMDSecureRemoteSession)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t61 != -1) {
    dispatch_once(&logCategory__hmf_once_t61, &__block_literal_global_158_48356);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v62;
  return v2;
}

uint64_t __37__HMDSecureRemoteSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v62;
  logCategory__hmf_once_v62 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isSecureRemoteSessionMessage:(id)a3
{
  uint64_t v3 = [a3 name];
  if (([v3 isEqualToString:@"kSecureClientIDSMessageRequestKey"] & 1) != 0
    || ([v3 isEqualToString:@"kSecureServerIDSMessageRequestKey"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"kSecureSessionInvalidatedNotificationKey"];
  }

  return v4;
}

@end