@interface HMDHTTPMessageTransport
+ (BOOL)protocolVersionSupportsExtendedMessages:(id)a3;
+ (BOOL)shouldHostMessageServer;
+ (HMFVersion)protocolVersion;
+ (id)logCategory;
+ (id)shortDescription;
+ (unint64_t)restriction;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)isDeviceConnected:(id)a3;
- (BOOL)isServerEnabled;
- (HMDHTTPDevice)currentDevice;
- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3 clientBrowser:(id)a4;
- (HMDHTTPServerMessageTransport)serverTransport;
- (HMFNetServiceBrowser)clientBrowser;
- (NSArray)clientTransports;
- (NSDictionary)TXTRecord;
- (NSString)debugDescription;
- (NSString)description;
- (id)_serviceForDevice:(id)a3;
- (id)clientTransportForDevice:(id)a3;
- (id)clientTransportForService:(id)a3;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)deviceForHTTPDevice:(id)a3;
- (id)dumpState;
- (id)logIdentifier;
- (id)shortDescription;
- (int)transportType;
- (int64_t)qualityOfService;
- (void)_connectToDevice:(id)a3 completionHandler:(id)a4;
- (void)_handleReceivedRequestMessage:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)_sendMessage:(id)a3 destination:(id)a4 timeout:(double)a5 responseHandler:(id)a6;
- (void)_startServerWithDevice:(id)a3;
- (void)_stopServer;
- (void)addClientTransport:(id)a3;
- (void)client:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)client:(id)a3 didStopWithError:(id)a4;
- (void)configureWithDevice:(id)a3;
- (void)handleServerEnabled:(BOOL)a3;
- (void)netServiceBrowser:(id)a3 didAddService:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4;
- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4;
- (void)removeAllClientTransports;
- (void)removeClientTransport:(id)a3;
- (void)removeTXTRecordValueForKey:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)server:(id)a3 didAddDevice:(id)a4;
- (void)server:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6;
- (void)server:(id)a3 didRemoveDevice:(id)a4;
- (void)server:(id)a3 didStopWithError:(id)a4;
- (void)setCurrentDevice:(id)a3;
- (void)setServerEnabled:(BOOL)a3;
- (void)setServerTransport:(id)a3;
- (void)setTXTRecordValue:(id)a3 forKey:(id)a4;
- (void)startObservingIsPublishingForService:(id)a3;
@end

@implementation HMDHTTPMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBrowser, 0);
  objc_storeStrong((id *)&self->_serverTransport, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_clientTransports, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_transientDevices, 0);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMFNetServiceBrowser)clientBrowser
{
  return self->_clientBrowser;
}

- (id)dumpState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDHTTPMessageTransport *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F64E00]];

  v5 = [(HMDHTTPMessageTransport *)self clientTransports];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dumpState", (void)v17);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKeyedSubscript:@"clientTransports"];
  v13 = [(HMDHTTPMessageTransport *)self serverTransport];
  if (v13)
  {
    v14 = [(HMDHTTPMessageTransport *)self serverTransport];
    v15 = [v14 dumpState];
    [v3 setObject:v15 forKeyedSubscript:@"serverTransport"];
  }
  else
  {
    [v3 setObject:@"No server transport" forKeyedSubscript:@"serverTransport"];
  }

  return v3;
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HMDHTTPMessageTransport_netServiceBrowser_didRemoveService___block_invoke;
  block[3] = &unk_1E6A19668;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__HMDHTTPMessageTransport_netServiceBrowser_didRemoveService___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) clientBrowser];

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Client is no longer advertising: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHTTPMessageTransport *)self clientBrowser];

  if (v8 == v6)
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Discovered new client: %@", buf, 0x16u);
    }
    uint64_t v13 = [(HMDHTTPMessageTransport *)v10 clientTransportForService:v7];
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      v15 = v10;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v17;
        __int16 v23 = 2112;
        id v24 = v7;
        __int16 v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Added service, %@, for existing client: %@", buf, 0x20u);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__HMDHTTPMessageTransport_netServiceBrowser_didAddService___block_invoke;
      v18[3] = &unk_1E6A18BA0;
      v18[4] = v15;
      id v19 = v7;
      id v20 = v13;
      [v19 confirmWithTimeout:v18 completionHandler:0.0];
    }
    [(HMDHTTPMessageTransport *)v10 startObservingIsPublishingForService:v7];
  }
}

void __59__HMDHTTPMessageTransport_netServiceBrowser_didAddService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(void **)(a1 + 48);
    int v18 = 138543874;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Resolved service, %@, for existing client: %@", (uint8_t *)&v18, 0x20u);
  }
  id v10 = *(void **)(a1 + 40);
  __int16 v11 = [*(id *)(a1 + 48) netService];
  LOBYTE(v10) = [v10 isEqual:v11];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      long long v17 = [*(id *)(a1 + 48) netService];
      int v18 = 138543874;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      __int16 v23 = v17;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing client, added service, %@, does not match existing client service: %@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 48) stop];
    [*(id *)(a1 + 32) removeClientTransport:*(void *)(a1 + 48)];
  }
}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Client browser stopped with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)server:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HMDHTTPMessageTransport_server_didReceiveMessage_fromDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E6A18398;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(queue, v16);
}

uint64_t __81__HMDHTTPMessageTransport_server_didReceiveMessage_fromDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received message for device, %@, : %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _handleReceivedRequestMessage:*(void *)(a1 + 48) fromDevice:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
}

- (void)server:(id)a3 didRemoveDevice:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Server removed device: %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) _serviceForDevice:*(void *)(a1 + 40)];
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting client confirmation for device: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke_103;
    v13[3] = &unk_1E6A17758;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = *(id *)(a1 + 40);
    [v7 confirmWithTimeout:v13 completionHandler:0.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed client confirmation for device, %@, with error: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)server:(id)a3 didAddDevice:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@New device added: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)server:(id)a3 didStopWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Server stopped with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)client:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HMDHTTPMessageTransport_client_didReceiveMessage_completionHandler___block_invoke;
  v15[3] = &unk_1E6A18398;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __70__HMDHTTPMessageTransport_client_didReceiveMessage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) remoteDevice];
    uint64_t v7 = *(void *)(a1 + 48);
    int v11 = 138543874;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received message for device, %@, : %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) remoteDevice];
  [v9 _handleReceivedRequestMessage:v8 fromDevice:v10 completionHandler:*(void *)(a1 + 56)];
}

- (void)client:(id)a3 didStopWithError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Client, %@, did stop with error: %@", buf, 0x20u);
  }
  id v12 = [(HMDHTTPMessageTransport *)v9 serverTransport];
  __int16 v13 = [v12 devices];
  id v14 = [v6 remoteDevice];
  int v15 = [v13 containsObject:v14];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = v9;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v6 remoteDevice];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting server confirmation for device: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v17);
    objc_initWeak(&location, v6);
    uint64_t v21 = [(HMDHTTPMessageTransport *)v17 serverTransport];
    __int16 v22 = [v6 remoteDevice];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__HMDHTTPMessageTransport_client_didStopWithError___block_invoke;
    v23[3] = &unk_1E6A07B20;
    objc_copyWeak(&v24, (id *)buf);
    objc_copyWeak(&v25, &location);
    [v21 confirmDevice:v22 completionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __51__HMDHTTPMessageTransport_client_didStopWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = WeakRetained;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 remoteDevice];
    int v11 = 138543874;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Completed server confirmation for device, %@, with error: %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)startObservingIsPublishingForService:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __httpDeviceForNetService(v4, self);
  if (v5)
  {
    id v6 = [(HMDHTTPMessageTransport *)self deviceForHTTPDevice:v5];
    id v7 = v6;
    if (v6)
    {
      queue = self->_queue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__HMDHTTPMessageTransport_startObservingIsPublishingForService___block_invoke;
      v19[3] = &unk_1E6A197C8;
      id v20 = v6;
      id v21 = v4;
      dispatch_async(queue, v19);
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      __int16 v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        id v18 = [v4 name];
        *(_DWORD *)buf = 138543874;
        __int16 v23 = v17;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to find device with UUID %@, from net service name %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      __int16 v13 = [v4 name];
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to create http device from net service name %@, ignoring", buf, 0x16u);
    }
  }
}

uint64_t __64__HMDHTTPMessageTransport_startObservingIsPublishingForService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObservingIsPublishingForService:*(void *)(a1 + 40)];
}

- (void)_connectToDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [(HMDHTTPMessageTransport *)self clientTransportForDevice:v6];
  id v9 = v8;
  if (v8)
  {
    if ([v8 isRunning])
    {
      if (v7) {
        v7[2](v7, v9, 0);
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke;
      v26[3] = &unk_1E6A18500;
      objc_copyWeak(&v29, (id *)buf);
      uint64_t v28 = v7;
      id v27 = v9;
      [v27 startWithCompletionHandler:v26];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v10 = [(HMDHTTPMessageTransport *)self _serviceForDevice:v6];
    if (!v10) {
      goto LABEL_11;
    }
    int v11 = [HMDHTTPClientMessageTransport alloc];
    id v12 = [(HMDHTTPMessageTransport *)self currentDevice];
    __int16 v13 = [v12 identifier];
    id v14 = [(HMDHTTPClientMessageTransport *)v11 initWithIdentifier:v13 netService:v10];

    uint64_t v15 = [(HMDHTTPClientMessageTransport *)v14 setDelegate:self];
    if (v14)
    {
      id v16 = (void *)MEMORY[0x1D9452090](v15);
      uint64_t v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v19;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Created a new messaging client for %@", buf, 0x16u);
      }
      [(HMDHTTPMessageTransport *)v17 addClientTransport:v14];
      objc_initWeak((id *)buf, v17);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_101;
      v22[3] = &unk_1E6A18500;
      objc_copyWeak(&v25, (id *)buf);
      __int16 v24 = v7;
      id v20 = v14;
      __int16 v23 = v20;
      [(HMDHTTPClientMessageTransport *)v20 startWithCompletionHandler:v22];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
LABEL_11:
      if (v7)
      {
        id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not found." reason:@"Unable to find device." suggestion:0];
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v21);
      }
    }
  }
}

void __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start messaging client with error: %@", buf, 0x16u);
    }
  }
  if (WeakRetained)
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = WeakRetained[10];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_99;
      block[3] = &unk_1E6A193D0;
      id v14 = v9;
      id v12 = v3;
      id v13 = *(id *)(a1 + 32);
      dispatch_async(v10, block);
    }
  }
}

void __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start messaging client with error: %@", buf, 0x16u);
    }
  }
  if (WeakRetained)
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = WeakRetained[10];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_102;
      block[3] = &unk_1E6A193D0;
      id v14 = v9;
      id v12 = v3;
      id v13 = *(id *)(a1 + 32);
      dispatch_async(v10, block);
    }
  }
}

uint64_t __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_102(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_99(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)_stopServer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDHTTPMessageTransport *)self serverTransport];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping server", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v8 = [(HMDHTTPMessageTransport *)v5 serverTransport];
    [v8 stop];

    [(HMDHTTPMessageTransport *)v5 setServerTransport:0];
  }
}

- (void)_startServerWithDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting server", buf, 0xCu);
  }
  int v9 = [HMDHTTPServerMessageTransport alloc];
  id v10 = [v4 identifier];
  uint64_t v11 = [(HMDHTTPServerMessageTransport *)v9 initWithServerIdentifier:v10];
  [(HMDHTTPMessageTransport *)v6 setServerTransport:v11];

  id v12 = [(HMDHTTPMessageTransport *)v6 serverTransport];
  [v12 setDelegate:v6];

  id v13 = [(HMDHTTPMessageTransport *)v6 serverTransport];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke;
  v14[3] = &unk_1E6A197F0;
  v14[4] = v6;
  [v13 startWithCompletionHandler:v14];
}

void __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start message server with error: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) TXTRecord];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke_96;
    v9[3] = &unk_1E6A07AF8;
    v9[4] = *(void *)(a1 + 32);
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@injecting TXT record %@: %@", (uint8_t *)&v14, 0x20u);
  }
  if (v8)
  {
    id v13 = [*(id *)(a1 + 32) serverTransport];
    [v13 setTXTRecordValue:v8 forKey:v5];
  }
}

- (void)configureWithDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentDevice];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring with device: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setCurrentDevice:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _stopServer];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v9 = [*(id *)(a1 + 32) clientTransports];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v13++) stop];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [*(id *)(a1 + 32) removeAllClientTransports];
    if (*(void *)(a1 + 40))
    {
      if ([*(id *)(a1 + 32) isServerEnabled]) {
        [*(id *)(a1 + 32) _startServerWithDevice:*(void *)(a1 + 40)];
      }
      int v14 = [*(id *)(a1 + 32) clientBrowser];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke_94;
      v15[3] = &unk_1E6A197F0;
      v15[4] = *(void *)(a1 + 32);
      [v14 startBrowsingWithCompletionHandler:v15];
    }
  }
}

void __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start browseing for clients with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)_serviceForDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(HMDHTTPMessageTransport *)self clientBrowser];
  id v6 = [v5 cachedNetServices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        __int16 v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v12 = [v10 name];
        uint64_t v13 = (void *)[v11 initWithUUIDString:v12];

        int v14 = [v4 identifier];
        char v15 = [v13 isEqual:v14];

        if (v15)
        {
          id v7 = v10;

          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)removeAllClientTransports
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_clientTransports removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)removeClientTransport:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_clientTransports removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)addClientTransport:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_clientTransports addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (id)clientTransportForService:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __httpDeviceForNetService(v4, self);
  if (v5)
  {
    id v6 = [(HMDHTTPMessageTransport *)self clientTransportForDevice:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      id v11 = [v4 name];
      int v13 = 138543618;
      int v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Unable to create device from net service name %@, so ignoring", (uint8_t *)&v13, 0x16u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)clientTransportForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_clientTransports;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "remoteDevice", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSArray)clientTransports
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_clientTransports copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)deviceForHTTPDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [(HMDRemoteMessageTransport *)self accountRegistry];
  id v6 = [v5 accounts];

  uint64_t v22 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v7 = *(void *)v29;
    __int16 v23 = v6;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v6);
        }
        int v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        __int16 v10 = [v9 devices];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              long long v16 = [v15 identifier];
              long long v17 = [v4 identifier];
              char v18 = [v16 isEqual:v17];

              if (v18)
              {
                id v19 = v15;

                id v6 = v23;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v6 = v23;
        uint64_t v7 = v21;
      }
      id v19 = 0;
      uint64_t v22 = [v23 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
  else
  {
    id v19 = 0;
  }
LABEL_19:

  return v19;
}

- (void)setServerTransport:(id)a3
{
  id v4 = (HMDHTTPServerMessageTransport *)a3;
  os_unfair_lock_lock_with_options();
  serverTransport = self->_serverTransport;
  self->_serverTransport = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDHTTPServerMessageTransport)serverTransport
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_serverTransport;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentDevice:(id)a3
{
  id v4 = (HMDHTTPDevice *)a3;
  os_unfair_lock_lock_with_options();
  currentDevice = self->_currentDevice;
  self->_currentDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDHTTPDevice)currentDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeTXTRecordValueForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_txtRecord removeObjectForKey:v4];
  [(HMDHTTPServerMessageTransport *)self->_serverTransport removeTXTRecordValueForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_txtRecord setValue:v7 forKey:v6];
  [(HMDHTTPServerMessageTransport *)self->_serverTransport setTXTRecordValue:v7 forKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)TXTRecord
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_txtRecord copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)handleServerEnabled:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HMDHTTPMessageTransport_handleServerEnabled___block_invoke;
  v4[3] = &unk_1E6A19B58;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __47__HMDHTTPMessageTransport_handleServerEnabled___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  BOOL v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Server was enabled", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v8 = [*(id *)(a1 + 32) currentDevice];

    if (v8)
    {
      int v9 = *(void **)(a1 + 32);
      __int16 v10 = [v9 currentDevice];
      [v9 _startServerWithDevice:v10];
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Server was disabled", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) _stopServer];
  }
}

- (void)setServerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v3
    && !+[HMDHTTPMessageTransport shouldHostMessageServer])
  {
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling server is not supported on this device", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (self->_serverEnabled != v3)
  {
    self->_serverEnabled = v3;
    [(HMDHTTPMessageTransport *)self handleServerEnabled:v3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isServerEnabled
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_serverEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleReceivedRequestMessage:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    long long v15 = [v8 shortDescription];
    *(_DWORD *)buf = 138543874;
    v65 = v14;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    id v69 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received incoming message, %@, from: %@", buf, 0x20u);
  }
  id v63 = 0;
  long long v16 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v8 error:&v63];
  id v50 = v63;
  if (v16)
  {
    objc_msgSend(v16, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
    v51 = [(HMDHTTPMessageTransport *)v12 deviceForHTTPDevice:v9];
    if (v51)
    {
      long long v17 = [HMDRemoteDeviceMessageDestination alloc];
      char v18 = [v16 destination];
      id v19 = [v18 target];
      long long v20 = [(HMDRemoteDeviceMessageDestination *)v17 initWithTarget:v19 device:v51];

      [v16 setDestination:v20];
      uint64_t v21 = [v16 messagePayload];
      uint64_t v22 = (void *)[v21 mutableCopy];

      __int16 v23 = [(HMDRemoteDeviceMessageDestination *)v20 device];
      long long v24 = [v23 remoteDestinationString];
      [v22 setObject:v24 forKeyedSubscript:@"kIDSMessageSourceIDKey"];

      [v16 setMessagePayload:v22];
      objc_initWeak((id *)buf, v12);
      if ([v16 type])
      {
        long long v25 = [v16 name];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_3;
        v54[3] = &unk_1E6A17DF0;
        v54[4] = v12;
        id v26 = v25;
        id v55 = v26;
        [v16 setResponseHandler:v54];
        if (v10)
        {
          queue = v12->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_89;
          block[3] = &unk_1E6A186E0;
          id v53 = v10;
          dispatch_async(queue, block);
        }
      }
      else
      {
        v37 = [v16 name];
        v38 = [v16 destination];
        char v39 = [v16 isSecure];
        v40 = [v16 transactionIdentifier];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke;
        v56[3] = &unk_1E6A07AD0;
        objc_copyWeak(&v61, (id *)buf);
        id v60 = v10;
        id v26 = v37;
        id v57 = v26;
        id v41 = v38;
        id v58 = v41;
        char v62 = v39;
        id v42 = v40;
        id v59 = v42;
        [v16 setInternalResponseHandler:v56];

        objc_destroyWeak(&v61);
      }

      if (([v16 isSecure] & 1) != 0
        || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:v16])
      {
        v43 = +[HMDMetricsManager sharedLogEventSubmitter];
        v44 = +[HMDRemoteMessageLogEvent receivedRemoteMessage:v16 transportType:[(HMDHTTPMessageTransport *)v12 transportType]];
        [v43 submitLogEvent:v44];
      }
      v45 = objc_msgSend(v16, "userInfo", v50);
      v46 = (void *)[v45 mutableCopy];

      v47 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDHTTPMessageTransport transportType](v12, "transportType"));
      [v46 setObject:v47 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

      v48 = [v16 internal];
      [v48 setUserInfo:v46];

      v49 = [(HMFMessageTransport *)v12 delegate];
      [v49 messageTransport:v12 didReceiveMessage:v16];

      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = v12;
      uint64_t v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v65 = v35;
        __int16 v66 = 2112;
        id v67 = v8;
        __int16 v68 = 2112;
        id v69 = v9;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Received message, %@, from unknown device: %@", buf, 0x20u);
      }
      if (v10)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F28C58], "hmd_HTTPMessageTransportErrorWithCode:", 100);
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v36);
      }
    }
  }
  else
  {
    long long v28 = (void *)MEMORY[0x1D9452090]();
    long long v29 = v12;
    long long v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      long long v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v65 = v31;
      __int16 v66 = 2112;
      id v67 = v8;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HTTP message payload, dropping it: %@", buf, 0x16u);
    }
    if (v10) {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v50);
    }
  }
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 56))
  {
    id v9 = WeakRetained[10];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_2;
    block[3] = &unk_1E6A164B0;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v6;
    char v17 = *(unsigned char *)(a1 + 72);
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    dispatch_async(v9, block);
  }
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Command %@ completed with error: %@", (uint8_t *)&v12, 0x20u);
  }
}

uint64_t __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [[HMDRemoteMessage alloc] initWithName:*(void *)(a1 + 32) destination:*(void *)(a1 + 40) payload:*(void *)(a1 + 48) type:1 timeout:*(unsigned __int8 *)(a1 + 80) secure:0.0];
  [(HMDRemoteMessage *)v2 setTransactionIdentifier:*(void *)(a1 + 56)];
  id v8 = 0;
  BOOL v3 = +[HMDRemoteMessageSerialization dictionaryForMessage:v2 error:&v8];
  id v4 = v8;
  id v5 = (void *)[v3 mutableCopy];

  uint64_t v6 = *(void *)(a1 + 64);
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [v5 setObject:v7 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_sendMessage:(id)a3 destination:(id)a4 timeout:(double)a5 responseHandler:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    id v17 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    v56 = v16;
    __int16 v57 = 2112;
    id v58 = v17;
    __int16 v59 = 2112;
    id v60 = v11;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message, %@, to %@", buf, 0x20u);
  }
  uint64_t v18 = [(HMDHTTPMessageTransport *)v14 _serviceForDevice:v11];
  id v19 = [(HMDHTTPMessageTransport *)v14 clientTransportForDevice:v11];
  if (v19) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v18 == 0;
  }
  int v21 = !v20;
  if (!v20)
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    __int16 v23 = v14;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = v19;
      id v25 = v11;
      id v26 = v18;
      id v27 = v10;
      long long v29 = v28 = v12;
      *(_DWORD *)buf = 138543362;
      v56 = v29;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Not currently tracking client, starting to track client", buf, 0xCu);

      id v12 = v28;
      id v10 = v27;
      uint64_t v18 = v26;
      id v11 = v25;
      id v19 = v47;
    }
  }
  if (objc_msgSend(v19, "isRunning", v47))
  {
    [v19 sendMessage:v10 timeout:v12 completionHandler:a5];
    goto LABEL_28;
  }
  if ((v21 | [v19 isReachable]) == 1)
  {
    long long v30 = (void *)MEMORY[0x1D9452090]();
    long long v31 = v14;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v33;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Not currently connected to device, %@, so attempting to connect and send message.", buf, 0x16u);
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke;
    v48[3] = &unk_1E6A07AA8;
    v48[4] = v31;
    id v49 = v11;
    id v50 = v18;
    id v52 = v12;
    id v51 = v10;
    double v53 = a5;
    [(HMDHTTPMessageTransport *)v31 _connectToDevice:v49 completionHandler:v48];

    goto LABEL_28;
  }
  uint64_t v34 = [(HMDHTTPMessageTransport *)v14 serverTransport];
  v35 = [v34 devices];
  int v36 = [v35 containsObject:v11];

  v37 = (void *)MEMORY[0x1D9452090]();
  v38 = v14;
  char v39 = HMFGetOSLogHandle();
  v40 = v39;
  if (v36)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v56 = v41;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Unable to send via client, falling back to sending message via the server", buf, 0xCu);
    }
    id v42 = [(HMDHTTPMessageTransport *)v38 serverTransport];
    v43 = (void *)MEMORY[0x1E4F1CAD0];
    id v54 = v11;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    v45 = [v43 setWithArray:v44];
    [v42 sendMessage:v10 toDevices:v45 timeout:v12 completionHandler:a5];

    goto LABEL_27;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v56 = v46;
    __int16 v57 = 2112;
    id v58 = v11;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to send message to destination: %@", buf, 0x16u);
  }
  if (v12)
  {
    id v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication error." reason:@"No valid connection for destination" suggestion:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v42);
LABEL_27:
  }
LABEL_28:
}

void __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to send message to destination: %@", buf, 0x16u);
    }
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke_76;
    uint64_t v18 = &unk_1E6A196E0;
    id v12 = *(void **)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v12;
    [v13 confirmWithTimeout:&v15 completionHandler:0.0];
    if (*(void *)(a1 + 64))
    {
      __int16 v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hmErrorWithCode:description:reason:suggestion:", 54, @"Communication error.", @"No valid connection for destination", 0, v15, v16, v17, v18, v19);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    [v5 sendMessage:*(void *)(a1 + 56) timeout:*(void *)(a1 + 64) completionHandler:*(double *)(a1 + 72)];
  }
}

void __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed confirmation for device, %@, with error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v2 = [a1[4] destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (!v4)
  {
    __int16 v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = a1[5];
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = [a1[4] identifier];
      id v28 = [v27 UUIDString];
      long long v29 = [a1[4] destination];
      *(_DWORD *)buf = 138543874;
      id v50 = v26;
      __int16 v51 = 2112;
      id v52 = v28;
      __int16 v53 = 2112;
      id v54 = v29;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, invalid destination: %@", buf, 0x20u);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter." reason:@"Invalid destination." suggestion:0];
    long long v30 = (void (**)(id, id))a1[6];
    if (v30) {
      v30[2](v30, v7);
    }
    long long v31 = [a1[4] responseHandler];

    if (v31)
    {
      __int16 v32 = [a1[4] responseHandler];
      ((void (**)(void, id, void))v32)[2](v32, v7, 0);
    }
    goto LABEL_31;
  }
  id v5 = [a1[5] currentDevice];

  if (v5)
  {
    id v6 = [a1[5] remoteMessageFromMessage:a1[4]];
    id v48 = 0;
    id v41 = +[HMDRemoteMessageSerialization dictionaryForMessage:v6 error:&v48];
    id v7 = v48;
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1[5];
    id v10 = HMFGetOSLogHandle();
    __int16 v11 = v10;
    if (v41)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        __int16 v13 = [a1[4] identifier];
        id v14 = [v13 UUIDString];
        *(_DWORD *)buf = 138543618;
        id v50 = v12;
        __int16 v51 = 2112;
        id v52 = v14;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending request message with identifier: %@", buf, 0x16u);
      }
      double v15 = 6.0;
      if (![v6 type])
      {
        [v6 timeout];
        if (v16 > 0.0)
        {
          [v6 timeout];
          double v15 = v17;
        }
      }
      uint64_t v18 = [HMDHTTPDevice alloc];
      uint64_t v19 = [v4 device];
      id v20 = [v19 identifier];
      int v21 = [(HMDHTTPDevice *)v18 initWithIdentifier:v20];

      objc_initWeak((id *)buf, a1[5]);
      id v22 = a1[5];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_63;
      v42[3] = &unk_1E6A07A80;
      id v46 = a1[6];
      objc_copyWeak(&v47, (id *)buf);
      id v43 = a1[4];
      id v44 = v6;
      id v45 = v4;
      [v22 _sendMessage:v41 destination:v21 timeout:v42 responseHandler:v15];

      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        id v38 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v50 = v37;
        __int16 v51 = 2112;
        id v52 = v38;
        __int16 v53 = 2112;
        id v54 = v7;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message, %@, with error: %@", buf, 0x20u);
      }
      char v39 = (void (**)(id, id))a1[6];
      if (v39) {
        v39[2](v39, v7);
      }
      v40 = [a1[4] responseHandler];

      if (!v40) {
        goto LABEL_30;
      }
      int v21 = [a1[4] responseHandler];
      ((void (*)(HMDHTTPDevice *, id, void))v21[1].super.super.isa)(v21, v7, 0);
    }

LABEL_30:
    goto LABEL_31;
  }
  id v33 = (void *)MEMORY[0x1D9452090]();
  id v34 = a1[5];
  v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    int v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v50 = v36;
    _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@No device for HTTP Client (currentDevice==nil). ", buf, 0xCu);
  }
  if (a1[6])
  {
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not found." reason:@"Unable to find device." suggestion:0];
    (*((void (**)(void))a1[6] + 2))();
LABEL_31:
  }
}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = WeakRetained;
    __int16 v11 = HMFGetOSLogHandle();
    id v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        id v14 = [*(id *)(a1 + 32) identifier];
        double v15 = [v14 UUIDString];
        *(_DWORD *)buf = 138543874;
        id v58 = v13;
        __int16 v59 = 2112;
        id v60 = v15;
        __int16 v61 = 2112;
        id v62 = v6;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, with error: %@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        double v16 = HMFGetLogIdentifier();
        double v17 = [*(id *)(a1 + 32) identifier];
        uint64_t v18 = [v17 UUIDString];
        *(_DWORD *)buf = 138543618;
        id v58 = v16;
        __int16 v59 = 2112;
        id v60 = v18;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message with identifier: %@", buf, 0x16u);
      }
      uint64_t v19 = +[HMDMetricsManager sharedLogEventSubmitter];
      id v20 = +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", *(void *)(a1 + 40), [v10 transportType]);
      [v19 submitLogEvent:v20];
    }
    uint64_t v21 = [*(id *)(a1 + 40) type];
    id v22 = 0;
    if (!v6 && !v21)
    {
      id v56 = 0;
      __int16 v23 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v5 error:&v56];
      id v24 = v56;
      uint64_t v25 = v24;
      if (v23)
      {
        id v50 = v24;
        id v26 = [v23 messagePayload];
        id v22 = (void *)[v26 mutableCopy];

        id v27 = [HMDRemoteDeviceMessageDestination alloc];
        id v28 = [v23 destination];
        long long v29 = [v28 target];
        long long v30 = [*(id *)(a1 + 48) device];
        long long v31 = [(HMDRemoteDeviceMessageDestination *)v27 initWithTarget:v29 device:v30];

        [v23 setDestination:v31];
        id v49 = v31;
        __int16 v32 = [(HMDRemoteDeviceMessageDestination *)v31 device];
        id v33 = [v32 remoteDestinationString];
        [v22 setObject:v33 forKeyedSubscript:@"kIDSMessageSourceIDKey"];

        id v34 = objc_msgSend(v5, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
        if (v34)
        {
          v35 = (void *)MEMORY[0x1E4F28DC0];
          int v36 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
          id v55 = 0;
          id v6 = [v35 _strictlyUnarchivedObjectOfClasses:v36 fromData:v34 error:&v55];
          id v37 = v55;

          if (!v6)
          {
            id v38 = (void *)MEMORY[0x1D9452090]();
            id v48 = v10;
            char v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = id v47 = v38;
              *(_DWORD *)buf = 138543618;
              id v58 = v40;
              __int16 v59 = 2112;
              id v60 = v37;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);

              id v38 = v47;
            }

            id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 description:@"Generic error." reason:@"Failed to deserialize remote error." suggestion:0 underlyingError:v37];
          }
          [v22 setObject:v6 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
        }
        else
        {
          id v6 = 0;
        }

        uint64_t v25 = v50;
      }
      else
      {
        id v41 = (void *)MEMORY[0x1D9452090]();
        id v42 = v10;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v58 = v44;
          __int16 v59 = 2112;
          id v60 = v5;
          __int16 v61 = 2112;
          id v62 = v25;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize response, %@, with error: %@", buf, 0x20u);
        }
        id v6 = v25;
        id v22 = 0;
      }
    }
    id v45 = [*(id *)(a1 + 32) responseHandler];

    if (v45)
    {
      id v46 = v10[10];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_74;
      block[3] = &unk_1E6A19668;
      id v52 = *(id *)(a1 + 32);
      id v53 = v6;
      id v54 = v22;
      dispatch_async(v46, block);
    }
  }
}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responseHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (BOOL)canSendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v4 restriction] & 2) != 0
    && ([(HMDHTTPMessageTransport *)self currentDevice],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = [v4 destination];
    id v9 = [v8 device];

    id v10 = [HMDHTTPDevice alloc];
    __int16 v11 = [v9 identifier];
    id v12 = [(HMDHTTPDevice *)v10 initWithIdentifier:v11];

    BOOL v13 = [(HMDHTTPMessageTransport *)self isDeviceConnected:v12];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isDeviceConnected:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHTTPMessageTransport *)self clientTransportForDevice:v4];
  if ([v5 isReachable])
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v9;
      id v10 = "%{public}@Can send, client is reachable";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    __int16 v11 = [(HMDHTTPMessageTransport *)self _serviceForDevice:v4];

    if (v11)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v9;
        id v10 = "%{public}@Can send, device is advertising";
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v13 = [(HMDHTTPMessageTransport *)self serverTransport];
      id v14 = [v13 devices];
      int v15 = [v14 containsObject:v4];

      if (!v15)
      {
        BOOL v17 = 0;
        goto LABEL_12;
      }
      id v6 = (void *)MEMORY[0x1D9452090]();
      double v16 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v9;
        id v10 = "%{public}@Can send, device is connected";
        goto LABEL_10;
      }
    }
  }

  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (id)logIdentifier
{
  id v2 = [(HMDHTTPMessageTransport *)self currentDevice];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 identifier];
    id v5 = [v4 UUIDString];
  }
  else
  {
    id v5 = @"Unknown";
  }

  return v5;
}

- (int)transportType
{
  return 3;
}

- (NSString)description
{
  return (NSString *)[(HMDHTTPMessageTransport *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDHTTPMessageTransport *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  id v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  uint64_t v7 = [(HMDHTTPMessageTransport *)self currentDevice];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v8 UUIDString];
  id v10 = (void *)v9;
  if (a3)
  {
    __int16 v11 = objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v12 = [v5 stringWithFormat:@"<%@ %@, Identifier = %@>", v6, v10, v11];
  }
  else
  {
    id v12 = [v5 stringWithFormat:@"<%@ %@, Identifier = %@>", v6, v9, &stru_1F2C9F1A8];
  }

  return v12;
}

- (id)shortDescription
{
  id v2 = [(HMDHTTPMessageTransport *)self logIdentifier];
  if (v2)
  {
    id v3 = NSString;
    id v4 = [(id)objc_opt_class() shortDescription];
    id v5 = [v3 stringWithFormat:@"%@ %@", v4, v2];
  }
  else
  {
    id v5 = [(id)objc_opt_class() shortDescription];
  }

  return v5;
}

- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3 clientBrowser:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDHTTPMessageTransport;
  uint64_t v8 = [(HMDRemoteMessageTransport *)&v19 initWithAccountRegistry:a3];
  if (v8)
  {
    HMDispatchQueueNameString();
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    __int16 v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    clientTransports = v8->_clientTransports;
    v8->_clientTransports = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    txtRecord = v8->_txtRecord;
    v8->_txtRecord = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v8->_clientBrowser, a4);
    [(HMFNetServiceBrowser *)v8->_clientBrowser setDelegate:v8];
    [(HMFNetServiceBrowser *)v8->_clientBrowser setShouldCache:1];
  }

  return v8;
}

- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F654D8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithDomain:@"local." serviceType:@"_homekit._tcp."];
  id v7 = [(HMDHTTPMessageTransport *)self initWithAccountRegistry:v5 clientBrowser:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_14628 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_14628, &__block_literal_global_40_14629);
  }
  id v2 = (void *)logCategory__hmf_once_v1_14630;
  return v2;
}

uint64_t __38__HMDHTTPMessageTransport_logCategory__block_invoke()
{
  logCategory__hmf_once_v1_14630 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)protocolVersionSupportsExtendedMessages:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (protocolVersionSupportsExtendedMessages__onceToken != -1) {
      dispatch_once(&protocolVersionSupportsExtendedMessages__onceToken, &__block_literal_global_22);
    }
    char v4 = [v3 isAtLeastVersion:protocolVersionSupportsExtendedMessages__extendedMessageProtocolVersion];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

uint64_t __67__HMDHTTPMessageTransport_protocolVersionSupportsExtendedMessages___block_invoke()
{
  protocolVersionSupportsExtendedMessages__extendedMessageProtocolVersion = [objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:1 minorVersion:1 updateVersion:0];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldHostMessageServer
{
  id v2 = +[HMDDeviceCapabilities deviceCapabilities];
  if ([v2 isResidentCapable])
  {
    char v3 = 1;
  }
  else
  {
    char v4 = +[HMDDeviceCapabilities deviceCapabilities];
    char v3 = [v4 supportsKeyTransferServer];
  }
  return v3;
}

+ (HMFVersion)protocolVersion
{
  if (protocolVersion_onceToken != -1) {
    dispatch_once(&protocolVersion_onceToken, &__block_literal_global_14637);
  }
  id v2 = (void *)protocolVersion_protocolVersion;
  return (HMFVersion *)v2;
}

uint64_t __42__HMDHTTPMessageTransport_protocolVersion__block_invoke()
{
  protocolVersion_protocolVersion = [objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:1 minorVersion:1 updateVersion:0];
  return MEMORY[0x1F41817F8]();
}

+ (unint64_t)restriction
{
  return 2;
}

@end