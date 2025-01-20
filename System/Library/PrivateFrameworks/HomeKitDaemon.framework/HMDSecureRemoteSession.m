@interface HMDSecureRemoteSession
+ (BOOL)isSecureRemoteSessionMessage:(id)a3;
+ (id)logCategory;
- (HMDAccountRegistry)accountRegistry;
- (HMDDevice)device;
- (HMDSecureRemoteSession)init;
- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4;
- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4 dataSource:(id)a5;
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
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)openWithCompletionHandler:(id)a3;
- (void)receivedSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5;
- (void)secureRemoteStream:(id)a3 didCloseWithError:(id)a4;
- (void)secureRemoteStream:(id)a3 receivedRequestToSendMessage:(id)a4;
- (void)secureRemoteStreamIsIdle:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setMaximumRemoteStreams:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSecureRemoteSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serverStreams, 0);
  objc_storeStrong((id *)&self->_clientStreams, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
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
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDSecureRemoteSession *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  pendingMessages = self->_pendingMessages;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__HMDSecureRemoteSession_timerDidFire___block_invoke;
  v19[3] = &unk_264A1C108;
  id v7 = v4;
  id v20 = v7;
  v8 = [(NSMutableArray *)pendingMessages hmf_objectPassingTest:v19];
  if (v8)
  {
    [(NSMutableArray *)self->_pendingMessages removeObject:v8];

    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Queued message timed out: %@", buf, 0x16u);
    }
    v15 = [v8 message];
    v16 = [v15 responseHandler];

    if (v16)
    {
      v17 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
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
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(HMDSecureRemoteSession *)self clientQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __35__HMDSecureRemoteSession_dumpState__block_invoke;
  v11 = &unk_264A2F820;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

void __35__HMDSecureRemoteSession_dumpState__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", objc_msgSend(*(id *)(a1 + 40), "maximumRemoteStreams"));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"maximumStreams"];

  v3 = [*(id *)(a1 + 40) device];
  uint64_t v4 = [v3 shortDescription];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"device"];

  id v5 = [*(id *)(a1 + 40) pendingMessages];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
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
  v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
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
  __int16 v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFMessageTransport *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 messageTransport:self didReceiveMessage:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v16, 0x16u);
    }
    v13 = [v7 responseHandler];

    if (v13)
    {
      v14 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
      v15 = [v7 responseHandler];
      ((void (**)(void, void *, void))v15)[2](v15, v14, 0);
    }
  }
}

- (void)secureRemoteStream:(id)a3 receivedRequestToSendMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFMessageTransport *)self delegate];
  if ([v8 conformsToProtocol:&unk_26E567EE0]) {
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
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Cannot send message, no delegate: %@", (uint8_t *)&v18, 0x16u);
    }
    v15 = [v7 responseHandler];

    if (v15)
    {
      int v16 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDSecureRemoteSession_secureRemoteStream_didCloseWithError___block_invoke;
  block[3] = &unk_264A2F2F8;
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDSecureRemoteSession_secureRemoteStreamIsIdle___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stream is idle: %@", (uint8_t *)&v12, 0x16u);
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
  uint64_t v45 = *MEMORY[0x263EF8340];
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
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    __int16 v43 = 2112;
    id v44 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Server stream stopped due to error %@", buf, 0x16u);
  }
  int v12 = [(HMFMessageTransport *)v9 delegate];
  if ([v12 conformsToProtocol:&unk_26E567EE0]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v33 = v13;

  if (objc_opt_respondsToSelector())
  {
    __int16 v14 = [v7 domain];
    if (![v14 isEqualToString:*MEMORY[0x263F08410]])
    {
LABEL_18:

      goto LABEL_19;
    }
    BOOL v15 = [v7 code] == -6722;

    if (!v15)
    {
      __int16 v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v9, "maximumRemoteStreams"));
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
      __int16 v23 = [MEMORY[0x263F42570] allMessageDestinations];
      id v24 = [v23 target];
      uint64_t v25 = [v6 peerDevice];
      uint64_t v26 = [(HMDRemoteDeviceMessageDestination *)v22 initWithTarget:v24 device:v25];

      uint64_t v27 = (void *)MEMORY[0x263F42568];
      v38[0] = @"kIDSSecureSessionIDKey";
      uint64_t v28 = [v6 sessionID];
      v29 = [v28 UUIDString];
      v38[1] = @"streams";
      v39[0] = v29;
      v39[1] = v14;
      long long v30 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
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
    [v9 sortUsingComparator:&__block_literal_global_74090];
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
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_2;
  v17[3] = &unk_264A1C0B8;
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
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __76__HMDSecureRemoteSession__openServerStreamWithIdentifier_completionHandler___block_invoke_3;
    v7[3] = &unk_264A2D310;
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
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Failed to start server stream due to error: %@", (uint8_t *)&v11, 0x16u);
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
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_clientStreams containsObject:v6])
  {
    [(NSMutableArray *)self->_clientStreams removeObject:v6];
    id v8 = (void *)[(NSMutableArray *)self->_clientStreams copy];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Client stream stopped due to error %@", buf, 0x16u);
    }
    if (objc_msgSend(v8, "hmf_isEmpty"))
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = v10;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v29 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Last client stream closed, attempting to open a new client stream", buf, 0xCu);
      }
    }
    else
    {
      if ([v6 qualityOfService] != 9) {
        goto LABEL_20;
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v8;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        while (2)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            if ([*(id *)(*((void *)&v23 + 1) + 8 * v20) qualityOfService] == 9)
            {

              goto LABEL_21;
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = v10;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v29 = v21;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Last background client stream closed, attempting to open a new client stream", buf, 0xCu);
      }
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke;
    v22[3] = &unk_264A1C0E0;
    v22[4] = v10;
    [(HMDSecureRemoteSession *)v10 _openClientStreamWithCompletionHandler:v22];
LABEL_20:
    id v17 = v8;
    goto LABEL_21;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v17 = 0;
LABEL_21:
}

void __51__HMDSecureRemoteSession__closeClientStream_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open primary stream, closing session", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) _closeWithError:v6];
  }
}

- (void)_openClientStreamWithCompletionHandler:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSecureRemoteSession *)self clientStreams];
  unint64_t v6 = [v5 count];
  BOOL v7 = v6 < [(HMDSecureRemoteSession *)self maximumRemoteStreams];
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  int v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v38 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Opening client stream", buf, 0xCu);
    }
    uint64_t v13 = [(HMDSecureRemoteSession *)v9 dataSource];
    uint64_t v14 = [(HMDSecureRemoteSession *)v9 device];
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
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
            uint64_t v22 = (void *)MEMORY[0x230FBD990]();
            long long v23 = v9;
            long long v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              long long v25 = HMFGetLogIdentifier();
              long long v26 = HMFQualityOfServiceToString();
              *(_DWORD *)buf = 138543618;
              long long v38 = v25;
              __int16 v39 = 2112;
              long long v40 = v26;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting QoS to %@ for client stream", buf, 0x16u);
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
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke;
    v28[3] = &unk_264A1C0B8;
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
    long long v38 = v21;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Cannot open additional streams", buf, 0xCu);
  }
  if (v4)
  {
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:49];
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
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__HMDSecureRemoteSession__openClientStreamWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_264A2D310;
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    unint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      id v8 = *(void **)(a1 + 32);
      int v21 = 138543618;
      uint64_t v22 = v7;
      __int16 v23 = 2112;
      long long v24 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to start client stream due to error: %@", (uint8_t *)&v21, 0x16u);
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
  }
  else if (WeakRetained)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      long long v24 = v3;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Opened client stream: %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v14 = [*(id *)(a1 + 40) pendingMessages];
    uint64_t v15 = [v14 firstObject];
    id v16 = [v15 message];
    [v16 qualityOfService];
    [v3 qualityOfService];
    uint64_t v17 = HMFQualityOfServiceCompare();

    if (v17 != -1)
    {
      uint64_t v18 = [*(id *)(a1 + 40) _dequeMessage];
      if (v18) {
        [v3 sendMessage:v18 completionHandler:0];
      }
    }
  }
  uint64_t v19 = *(void *)(a1 + 48);
  if (v19)
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v3;
    }
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
}

- (id)_serverStreamWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
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
  uint64_t v16 = *MEMORY[0x263EF8340];
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
  uint64_t v18 = *MEMORY[0x263EF8340];
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

- (void)_handleStreamInvalidationMessage:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kIDSSecureSessionIDKey"];
  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v9;
    __int16 v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received invalidation message for stream %@", buf, 0x16u);
  }
  id v10 = [(HMDSecureRemoteSession *)v7 _clientStreamWithIdentiifer:v5];
  if (v10)
  {
    char v11 = (void *)MEMORY[0x230FBD990]();
    long long v12 = v7;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v14;
      __int16 v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Closing stream due to remote invalidation: %@", buf, 0x16u);
    }
    [v10 stop];
  }
  long long v15 = [v4 arrayForKey:@"streams"];
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
          int v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
          uint64_t v22 = [v21 sessionID];
          __int16 v23 = [v22 UUIDString];
          char v24 = [v15 containsObject:v23];

          if ((v24 & 1) == 0)
          {
            uint64_t v25 = (void *)MEMORY[0x230FBD990]();
            long long v26 = v7;
            uint64_t v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              uint64_t v28 = v19;
              id v29 = v15;
              id v30 = v16;
              v32 = id v31 = v7;
              *(_DWORD *)buf = 138543618;
              uint64_t v45 = v32;
              __int16 v46 = 2112;
              v47 = v21;
              _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Closing inactive stream due to remote invalidation: %@", buf, 0x16u);

              uint64_t v7 = v31;
              long long v16 = v30;
              long long v15 = v29;
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
  uint64_t v31 = *MEMORY[0x263EF8340];
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

  long long v15 = [(HMDSecureRemoteSession *)self _clientStreamWithIdentiifer:v11];
  if (v15 && v14)
  {
    long long v16 = [v8 messagePayload];
    [v15 handleSecureMessage:v16 fromDevice:v9 fromTransport:v14];

    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = id v26 = v9;
      uint64_t v22 = [(HMDSecureRemoteSession *)v19 clientStreams];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      id v30 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Stream not found: %@", buf, 0x16u);

      id v9 = v26;
    }

    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    __int16 v23 = [(HMDSecureRemoteSession *)v19 device];
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
  id v12 = objc_alloc(MEMORY[0x263F424F0]);
  long long v13 = NSString;
  id v14 = MEMORY[0x230FBBCF0](self, a2);
  long long v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Messaging/Remote/Secure/HMDSecureRemoteSession.m", 624];
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
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __74__HMDSecureRemoteSession__handleSecureClientMessage_fromDevice_transport___block_invoke;
    v24[3] = &unk_264A1C090;
    id v25 = v30;
    id v26 = v9;
    id v27 = v10;
    id v28 = v19;
    [(HMDSecureRemoteSession *)self _openServerStreamWithIdentifier:v16 completionHandler:v24];

    __int16 v23 = (void (**)(void, void, void))v25;
    goto LABEL_9;
  }
  [v30 begin];
  id v29 = v30;
  int v21 = [v9 messagePayload];
  [v20 handleSecureMessage:v21 fromDevice:v10 fromTransport:v19];

  __HMFActivityScopeLeave();
  uint64_t v22 = [v9 responseHandler];

  if (v22)
  {
    __int16 v23 = [v9 responseHandler];
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
  id v11 = [MEMORY[0x263F424F0] currentActivity];
  id v12 = [(HMDSecureRemoteSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDSecureRemoteSession_receivedSecureMessage_fromDevice_fromTransport___block_invoke;
  block[3] = &unk_264A2E908;
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
      id v3 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      id v4 = [*(id *)(a1 + 40) responseHandler];
      ((void (**)(void, void *, void))v4)[2](v4, v3, 0);
    }
  }
}

- (id)_dequeMessage
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableArray *)self->_pendingMessages popFirstObject];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = [v4 timer];
    [v5 suspend];

    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [v4 message];
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Dequeuing message: %@", (uint8_t *)&v13, 0x16u);
    }
    id v11 = [v4 message];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_queueMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing message: %@", buf, 0x16u);
  }
  id v9 = [[_HMDSecureRemoteQueuedMessage alloc] initWithMessage:v4];
  id v10 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  [v10 setDelegate:v6];

  id v11 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  id v12 = [(HMDSecureRemoteSession *)v6 clientQueue];
  [v11 setDelegateQueue:v12];

  int v13 = [(_HMDSecureRemoteQueuedMessage *)v9 timer];
  [v13 resume];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v41 = 0;
  os_unfair_lock_lock_with_options();
  pendingMessages = v6->_pendingMessages;
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __40__HMDSecureRemoteSession__queueMessage___block_invoke;
  uint64_t v31 = &unk_264A1C068;
  id v15 = v4;
  id v32 = v15;
  long long v33 = buf;
  [(NSMutableArray *)pendingMessages hmf_enumerateWithAutoreleasePoolUsingBlock:&v28];
  -[NSMutableArray insertObject:atIndex:](v6->_pendingMessages, "insertObject:atIndex:", v9, *(void *)(*(void *)&buf[8] + 24), v28, v29, v30, v31);

  os_unfair_lock_unlock(&v6->_lock);
  id v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = v6;
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
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Message, %@, queued at position %tu", v34, 0x20u);
  }
  __int16 v23 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Queued messages: %@", v34, 0x16u);
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
  id v8 = [MEMORY[0x263F424F0] currentActivity];
  id v9 = [(HMDSecureRemoteSession *)self clientQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HMDSecureRemoteSession_sendMessage_completionHandler___block_invoke;
  v13[3] = &unk_264A2EE30;
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 40) state])
  {
    id v19 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v19;
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
      id v19 = +[HMDRemoteMessage secureMessageWithName:v4 destination:v5 messagePayload:v6];

      id v7 = [*(id *)(a1 + 48) identifier];
      [v19 setIdentifier:v7];

      id v8 = [*(id *)(a1 + 48) responseHandler];
      [v19 setResponseHandler:v8];
    }
    id v9 = [*(id *)(a1 + 40) _clientStreamForMessage:v19];
    id v10 = v9;
    if (v9)
    {
      [v9 sendMessage:v19 completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      [*(id *)(a1 + 40) _queueMessage:v19];
      [*(id *)(a1 + 40) _openClientStreamWithCompletionHandler:0];
      uint64_t v18 = *(void *)(a1 + 56);
      if (v18) {
        (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 48) shortDescription];
      *(_DWORD *)buf = 138543618;
      id v21 = v14;
      __int16 v22 = 2112;
      __int16 v23 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot send message on closed session: %@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    }
    [*(id *)(a1 + 48) respondWithError:v16];
  }
}

- (void)_closeWithError:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v33 = v4;
  if (v4)
  {
    id v35 = v4;
  }
  else
  {
    id v35 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
  }
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v52 = v8;
    __int16 v53 = 2112;
    v54 = v33;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Closed with error: %@", buf, 0x16u);
  }
  [(HMDSecureRemoteSession *)v6 setState:0];
  id v9 = [(HMFMessageTransport *)v6 delegate];
  if ([v9 conformsToProtocol:&unk_26E567EE0]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v34 = v10;

  if (objc_opt_respondsToSelector()) {
    [v34 secureRemoteSession:v6 didCloseWithError:v33];
  }
  os_unfair_lock_lock_with_options();
  id v11 = (void *)[(NSMutableArray *)v6->_pendingMessages copy];
  [(NSMutableArray *)v6->_pendingMessages removeAllObjects];
  id v32 = (void *)[(NSMutableArray *)v6->_clientStreams copy];
  [(NSMutableArray *)v6->_clientStreams removeAllObjects];
  uint64_t v31 = (void *)[(NSMutableArray *)v6->_serverStreams copy];
  [(NSMutableArray *)v6->_serverStreams removeAllObjects];
  os_unfair_lock_unlock(&v6->_lock);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(*((void *)&v44 + 1) + 8 * i) message];
        uint64_t v17 = (void *)MEMORY[0x230FBD990]();
        uint64_t v18 = v6;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v52 = v20;
          __int16 v53 = 2114;
          v54 = v16;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Cancelling queued message: %{public}@", buf, 0x16u);
        }
        id v21 = [v16 responseHandler];

        if (v21)
        {
          __int16 v22 = [v16 responseHandler];
          ((void (**)(void, id, void))v22)[2](v22, v35, 0);
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v13);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = v32;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * j) stop];
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v24);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v27 = v31;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * k) stop];
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v28);
  }
}

- (void)close
{
  id v3 = [(HMDSecureRemoteSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMDSecureRemoteSession_close__block_invoke;
  block[3] = &unk_264A2F7F8;
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_264A2F870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Session already opened", buf, 0xCu);
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
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Opening", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:1];
    id v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_103;
    v11[3] = &unk_264A1C040;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 40);
    [v10 _openClientStreamWithCompletionHandler:v11];
  }
}

void __52__HMDSecureRemoteSession_openWithCompletionHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Opened", (uint8_t *)&v23, 0xCu);
    }
    [*(id *)(a1 + 32) setState:2];
    id v12 = [v5 maximumRemoteStreams];
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
        id v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          int v23 = 138543618;
          uint64_t v24 = v19;
          __int16 v25 = 2048;
          unint64_t v26 = v14;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Upgrading number of streams to '%tu'", (uint8_t *)&v23, 0x16u);
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
      id v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v21;
      __int16 v25 = 2112;
      unint64_t v26 = (unint64_t)v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to open initial client stream with error: %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v20 = v6;
    if (!v6)
    {
      uint64_t v20 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
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
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_state)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Secure Remote Session abandoned without being closed", buf, 0xCu);
    }
    [(HMFMessageTransport *)v4 setDelegate:0];
    [(HMDSecureRemoteSession *)v4 _closeWithError:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDSecureRemoteSession;
  [(HMDSecureRemoteSession *)&v7 dealloc];
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4 dataSource:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    unint64_t v26 = (void *)MEMORY[0x230FBD990]();
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v33 = v28;
      uint64_t v29 = "%{public}@Device is required for HMDSecureRemoteSession";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
    }
LABEL_11:

    __int16 v25 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    unint64_t v26 = (void *)MEMORY[0x230FBD990]();
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v33 = v28;
      uint64_t v29 = "%{public}@Account registry is required for HMDSecureRemoteSession";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDSecureRemoteSession;
  id v12 = [(HMDSecureRemoteSession *)&v31 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dataSource, a5);
    objc_storeStrong((id *)&v13->_device, a3);
    objc_storeStrong((id *)&v13->_accountRegistry, a4);
    HMDispatchQueueNameString();
    id v14 = objc_claimAutoreleasedReturnValue();
    unint64_t v15 = (const char *)[v14 UTF8String];
    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v17;

    v13->_maximumRemoteStreams = 1;
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    pendingMessages = v13->_pendingMessages;
    v13->_pendingMessages = (NSMutableArray *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v13, "maximumRemoteStreams"));
    clientStreams = v13->_clientStreams;
    v13->_clientStreams = (NSMutableArray *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[HMDSecureRemoteSession maximumRemoteStreams](v13, "maximumRemoteStreams"));
    serverStreams = v13->_serverStreams;
    v13->_serverStreams = (NSMutableArray *)v23;
  }
  self = v13;
  __int16 v25 = self;
LABEL_12:

  return v25;
}

- (HMDSecureRemoteSession)initWithDevice:(id)a3 accountRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDSecureRemoteSessionDefaultDataSource);
  id v9 = [(HMDSecureRemoteSession *)self initWithDevice:v7 accountRegistry:v6 dataSource:v8];

  return v9;
}

- (HMDSecureRemoteSession)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t56 != -1) {
    dispatch_once(&logCategory__hmf_once_t56, &__block_literal_global_153_74144);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v57;
  return v2;
}

void __37__HMDSecureRemoteSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v57;
  logCategory__hmf_once_v57 = v0;
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