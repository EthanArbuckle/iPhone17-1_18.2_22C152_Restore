@interface HMDSecureRemoteMessageTransport
+ (BOOL)isDeviceValidDestination:(id)a3 error:(id *)a4;
+ (HMDSecureRemoteMessageTransport)defaultTransport;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_handleReceivedMessage:(id)a3 transport:(id)a4;
- (HMDAccountRegistry)accountRegistry;
- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter;
- (HMDModernTransportDeviceReachabilityObserver)modernReachabilityObserver;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDRemoteHomeMessagingManager)homeMessagingManager;
- (HMDSecureRemoteMessageTransport)initWithDataSource:(id)a3;
- (HMDSecureRemoteMessageTransportDataSource)dataSource;
- (HMDUserDeviceCapabilitiesRequestManager)userDeviceCapabilitiesRequestManager;
- (HMFFuture)startFuture;
- (HMFPromise)startPromise;
- (NSArray)transports;
- (NSString)debugDescription;
- (NSString)description;
- (id)_openSecureSessionToDevice:(id)a3 completionHandler:(id)a4;
- (id)_preferredTransportForMessage:(id)a3;
- (id)_secureRemoteSessionForDevice:(id)a3;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)shortDescription;
- (id)start;
- (void)_handleElectDeviceForUserResponse:(id)a3 error:(id)a4 responseQueue:(id)a5 completion:(id)a6;
- (void)_handlePingMessage:(id)a3;
- (void)_handleSecureMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5;
- (void)_pingDevice:(id)a3 completionHandler:(id)a4;
- (void)_reset;
- (void)_sendPingToDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5 responseHandler:(id)a6;
- (void)_sendSecureMessage:(id)a3 completionHandler:(id)a4;
- (void)_updateDeviceInformationFromMessage:(id)a3;
- (void)configureWithCloudDataSyncStateFilter:(id)a3 homeMembershipVerifier:(id)a4;
- (void)configureWithUserDeviceCapabilitiesRequestManager:(id)a3 deviceResidencyProvider:(id)a4 remoteMessageListener:(id)a5;
- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)openSecureSessionToDevice:(id)a3 completionHandler:(id)a4;
- (void)pingDevice:(id)a3 completionHandler:(id)a4;
- (void)registerHomeMessageDestinationHandler:(id)a3;
- (void)reset;
- (void)secureRemoteSession:(id)a3 didCloseWithError:(id)a4;
- (void)secureRemoteSession:(id)a3 receivedRequestToSendMessage:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setCloudDataSyncStateFilter:(id)a3;
- (void)setUserDeviceCapabilitiesRequestManager:(id)a3;
@end

@implementation HMDSecureRemoteMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMessagingManager, 0);
  objc_storeStrong((id *)&self->_userDeviceCapabilitiesRequestManager, 0);
  objc_storeStrong((id *)&self->_cloudDataSyncStateFilter, 0);
  objc_storeStrong((id *)&self->_startPromise, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_modernReachabilityObserver, 0);
  objc_storeStrong((id *)&self->_startFuture, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_secureRemoteSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMDRemoteHomeMessagingManager)homeMessagingManager
{
  return self->_homeMessagingManager;
}

- (void)setUserDeviceCapabilitiesRequestManager:(id)a3
{
}

- (HMDUserDeviceCapabilitiesRequestManager)userDeviceCapabilitiesRequestManager
{
  return (HMDUserDeviceCapabilitiesRequestManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCloudDataSyncStateFilter:(id)a3
{
}

- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter
{
  return (HMDCloudDataSyncStateFilter *)objc_getProperty(self, a2, 96, 1);
}

- (HMFPromise)startPromise
{
  return self->_startPromise;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMDSecureRemoteMessageTransportDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDModernTransportDeviceReachabilityObserver)modernReachabilityObserver
{
  return (HMDModernTransportDeviceReachabilityObserver *)objc_getProperty(self, a2, 64, 1);
}

- (HMFFuture)startFuture
{
  return self->_startFuture;
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)transports
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F424F0] currentActivity];
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HMDSecureRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke;
  v13[3] = &unk_264A2E610;
  id v14 = v8;
  v15 = self;
  id v16 = v7;
  id v17 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __70__HMDSecureRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) _updateDeviceInformationFromMessage:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 40) _handleReceivedMessage:*(void *)(a1 + 48) transport:*(void *)(a1 + 56)] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 40) delegate];
    [v2 messageTransport:*(void *)(a1 + 40) didReceiveMessage:*(void *)(a1 + 48)];
  }
}

- (id)dumpState
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = +[HMDIdentityRegistry sharedRegistry];
  v5 = [v4 dumpState];
  [v3 setObject:v5 forKeyedSubscript:@"identityRegistry"];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__178429;
  id v17 = __Block_byref_object_dispose__178430;
  id v18 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke;
  v12[3] = &unk_264A2F0A0;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(queue, v12);
  id v7 = objc_msgSend((id)v14[5], "na_map:", &__block_literal_global_178431);
  [v3 setObject:v7 forKeyedSubscript:@"secureSessions"];

  _Block_object_dispose(&v13, 8);
  v8 = [(HMDSecureRemoteMessageTransport *)self transports];
  v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_198);
  [v3 setObject:v9 forKeyedSubscript:@"remoteMessageTransports"];

  id v10 = (void *)[v3 copy];
  return v10;
}

void __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dumpState];
}

uint64_t __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dumpState];
}

- (void)secureRemoteSession:(id)a3 receivedRequestToSendMessage:(id)a4
{
}

- (void)secureRemoteSession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDSecureRemoteMessageTransport_secureRemoteSession_didCloseWithError___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __73__HMDSecureRemoteMessageTransport_secureRemoteSession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) device];
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Session to device, %@, closed with error: %@", buf, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    id v12 = @"HMDSecureRemoteSessionErrorKey";
    uint64_t v13 = v8;
    id v9 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  id v11 = [*(id *)(a1 + 40) device];
  [v10 postNotificationName:@"HMDSecureRemoteSessionErrorNotification" object:v11 userInfo:v9];
}

- (void)_handleSecureMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [(HMDSecureRemoteMessageTransport *)self _secureRemoteSessionForDevice:v9];
  if (v13) {
    goto LABEL_8;
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  uint64_t v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    int v24 = 138543618;
    v25 = v17;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Opening secure session to handle incoming message: %@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v13 = [(HMDSecureRemoteMessageTransport *)v15 _openSecureSessionToDevice:v9 completionHandler:0];
  if (v13)
  {
LABEL_8:
    [v8 name];

    [v8 identifier];
    __int16 v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    [v13 receivedSecureMessage:v8 fromDevice:v9 fromTransport:v12];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v15;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v23;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to handle message: %@", (uint8_t *)&v24, 0x16u);
    }
    [v8 name];

    [v8 identifier];
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v8 respondWithError:v13];
  }
}

- (id)_openSecureSessionToDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(HMDSecureRemoteMessageTransport *)self _secureRemoteSessionForDevice:v6];
  if (v8)
  {
    id v9 = _Block_copy(v7);
    id v10 = v9;
    if (v9) {
      (*((void (**)(void *, void *, void))v9 + 2))(v9, v8, 0);
    }

    id v11 = v8;
  }
  else
  {
    id v12 = [(HMDSecureRemoteMessageTransport *)self dataSource];
    id v11 = [v12 secureSessionWithDevice:v6];

    [v11 setDelegate:self];
    [(NSMutableSet *)self->_secureRemoteSessions addObject:v11];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    objc_initWeak(&v19, v6);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke;
    v14[3] = &unk_264A23CC8;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &v19);
    id v15 = v7;
    [v11 openWithCompletionHandler:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke_2;
    block[3] = &unk_264A23CA0;
    objc_copyWeak(&v11, a1 + 6);
    id v8 = v3;
    id v9 = v5;
    objc_copyWeak(&v12, a1 + 7);
    id v10 = a1[4];
    dispatch_async(v6, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
  }
}

void __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32)
    && [*(id *)(*(void *)(a1 + 40) + 32) containsObject:WeakRetained])
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 64));
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open secure session to device: %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 32) removeObject:WeakRetained];
  }
  id v8 = _Block_copy(*(const void **)(a1 + 48));
  id v9 = v8;
  if (v8)
  {
    if (*(void *)(a1 + 32)) {
      id v10 = 0;
    }
    else {
      id v10 = WeakRetained;
    }
    (*((void (**)(void *, id))v8 + 2))(v8, v10);
  }
}

- (void)openSecureSessionToDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_2;
  v6[3] = &unk_264A23C78;
  id v4 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = (id)[v2 _openSecureSessionToDevice:v3 completionHandler:v6];
}

void __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_3;
    v7[3] = &unk_264A2F870;
    id v9 = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendSecureMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [v6 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = [v11 device];
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v30 = v16;
        __int16 v31 = 2112;
        id v32 = v6;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Received request to send secure message, %@, to device %@", buf, 0x20u);
      }
      id v17 = [(HMDSecureRemoteMessageTransport *)v14 _secureRemoteSessionForDevice:v12];
      id v18 = v17;
      if (v17)
      {
        [v17 sendMessage:v6 completionHandler:v8];
      }
      else
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __72__HMDSecureRemoteMessageTransport__sendSecureMessage_completionHandler___block_invoke;
        v26[3] = &unk_264A23C50;
        v26[4] = v14;
        id v27 = v6;
        id v28 = v8;
        id v25 = [(HMDSecureRemoteMessageTransport *)v14 _openSecureSessionToDevice:v12 completionHandler:v26];
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v22;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@The secure message, %@, did not contain a device destination", buf, 0x16u);
      }
      id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v23 = _Block_copy(v8);
      int v24 = v23;
      if (v23) {
        (*((void (**)(void *, void *))v23 + 2))(v23, v12);
      }

      [v6 respondWithError:v12];
    }
    goto LABEL_19;
  }
  id v11 = _Block_copy(v7);
  if (v11)
  {
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*((void (**)(id, void *))v11 + 2))(v11, v12);
LABEL_19:
  }
}

void __72__HMDSecureRemoteMessageTransport__sendSecureMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 sendMessage:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message, %@, failed to open secure session with error: %@", (uint8_t *)&v14, 0x20u);
    }
    id v12 = _Block_copy(*(const void **)(a1 + 48));
    id v13 = v12;
    if (v12) {
      (*((void (**)(void *, id))v12 + 2))(v12, v6);
    }

    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

- (id)_secureRemoteSessionForDevice:(id)a3
{
  id v4 = a3;
  secureRemoteSessions = self->_secureRemoteSessions;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HMDSecureRemoteMessageTransport__secureRemoteSessionForDevice___block_invoke;
  v9[3] = &unk_264A23C28;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableSet *)secureRemoteSessions na_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __65__HMDSecureRemoteMessageTransport__secureRemoteSessionForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 device];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_sendPingToDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = +[HMDRemoteDeviceMonitor pingMessageForDevice:v10 timeout:a5 restriction:a4];
  if (v11)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke;
    v13[3] = &unk_264A2EAE0;
    objc_copyWeak(&v15, &location);
    id v14 = v11;
    [v12 setResponseHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  [(HMDSecureRemoteMessageTransport *)self sendMessage:v12 completionHandler:0];
}

void __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke_2;
    block[3] = &unk_264A2EE80;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_pingDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke;
    v8[3] = &unk_264A2B560;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v7;
    [(HMDSecureRemoteMessageTransport *)self _sendPingToDevice:v9 timeout:2 restriction:v8 responseHandler:10.0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained deviceMonitor];
  id v9 = v8;
  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_2;
    v19[3] = &unk_264A2C348;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    id v20 = *(id *)(a1 + 40);
    [v9 confirmDevice:v10 forClient:WeakRetained timeout:v19 completionHandler:65.0];

    objc_destroyWeak(&v21);
  }
  else
  {
    id v11 = [v8 unreachableDevices];
    int v12 = [v11 containsObject:*(void *)(a1 + 32)];

    if (v12)
    {
      id v13 = [WeakRetained deviceMonitor];
      [v13 confirmDevice:*(void *)(a1 + 32) forClient:WeakRetained timeout:0 completionHandler:0.0];
    }
    if (WeakRetained)
    {
      id v14 = *(void **)(a1 + 40);
      if (v14)
      {
        id v15 = WeakRetained[2];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_4;
        v16[3] = &unk_264A2F870;
        id v17 = 0;
        id v18 = v14;
        dispatch_async(v15, v16);
      }
    }
  }
}

void __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = WeakRetained[2];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_3;
      v8[3] = &unk_264A2F870;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)pingDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMDSecureRemoteMessageTransport_pingDevice_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__HMDSecureRemoteMessageTransport_pingDevice_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pingDevice:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_handlePingMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v7 device];
      int v15 = 138543618;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received ping from %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v13 = [v4 responseHandler];

  if (v13)
  {
    id v14 = [v4 responseHandler];
    v14[2](v14, 0, 0);
  }
}

- (void)_updateDeviceInformationFromMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    if ([v6 isSecure])
    {
      id v7 = [v6 sourceVersion];

      if (v7)
      {
        id v8 = [v4 destination];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;

        if (v10)
        {
          char v25 = 0;
          id v11 = [(HMDSecureRemoteMessageTransport *)self accountRegistry];
          id v12 = [v10 device];
          id v13 = [v12 handles];
          id v14 = [v13 firstObject];
          int v15 = [v11 deviceForHandle:v14 exists:&v25];

          if (v25)
          {
            __int16 v16 = [v15 version];
            __int16 v17 = [v6 sourceVersion];
            char v18 = [v16 isEqualToVersion:v17];

            if ((v18 & 1) == 0)
            {
              uint64_t v19 = (void *)MEMORY[0x230FBD990]();
              id v20 = self;
              id v21 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                v22 = HMFGetLogIdentifier();
                v23 = [v6 sourceVersion];
                *(_DWORD *)buf = 138543874;
                id v27 = v22;
                __int16 v28 = 2112;
                v29 = v15;
                __int16 v30 = 2112;
                __int16 v31 = v23;
                _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with version from message: %@", buf, 0x20u);
              }
              int v24 = [v6 sourceVersion];
              [v15 updateVersion:v24];
            }
          }
        }
      }
    }
  }
}

- (void)_handleElectDeviceForUserResponse:(id)a3 error:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  v59[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
  int v15 = (void *)v14;
  __int16 v16 = 0;
  if (!v10 || v11)
  {
    char v18 = (void *)v14;
  }
  else
  {
    v46 = v12;
    __int16 v17 = objc_msgSend(v10, "hmf_stringForKey:", @"kIDSMessageSourceIDKey");
    __int16 v16 = +[HMDDeviceHandle deviceHandleForDestination:v17];
    char v18 = (void *)[v10 mutableCopy];

    v59[0] = @"kIDSMessageSourceIDKey";
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
    [v18 removeObjectsForKeys:v19];

    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v54 = v23;
      __int16 v55 = 2112;
      v56 = v16;
      __int16 v57 = 2112;
      v58 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Elected device %@ for IDS session with peerInfo %@", buf, 0x20u);
    }
    int v24 = objc_msgSend(v10, "hmf_numberForKey:", @"kHomedVersionKey");
    if (v24)
    {
      v45 = v17;
      char v25 = [HMDHomeKitVersion alloc];
      __int16 v26 = [v24 stringValue];
      id v27 = [(HMDHomeKitVersion *)v25 initWithVersionString:v26];

      char v52 = 0;
      __int16 v28 = [(HMDSecureRemoteMessageTransport *)v21 accountRegistry];
      v29 = [v28 deviceForHandle:v16 exists:&v52];

      __int16 v30 = v29;
      if (v52)
      {
        [v29 version];
        id v31 = v13;
        v33 = uint64_t v32 = v29;
        char v34 = [v33 isEqualToVersion:v27];

        __int16 v30 = v32;
        id v13 = v31;
        id v11 = 0;
        if ((v34 & 1) == 0)
        {
          v44 = v27;
          uint64_t v35 = (void *)MEMORY[0x230FBD990]();
          v36 = v21;
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = v43 = v35;
            *(_DWORD *)buf = 138543618;
            v54 = v38;
            __int16 v55 = 2112;
            v56 = v30;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with the election parameters", buf, 0x16u);

            uint64_t v35 = v43;
          }

          id v27 = v44;
          [v30 updateVersion:v44];
        }
      }

      __int16 v17 = v45;
    }

    id v12 = v46;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__HMDSecureRemoteMessageTransport__handleElectDeviceForUserResponse_error_responseQueue_completion___block_invoke;
  block[3] = &unk_264A2EE30;
  id v48 = v11;
  id v49 = v16;
  id v50 = v18;
  id v51 = v13;
  id v39 = v18;
  id v40 = v16;
  id v41 = v11;
  id v42 = v13;
  dispatch_async(v12, block);
}

uint64_t __100__HMDSecureRemoteMessageTransport__handleElectDeviceForUserResponse_error_responseQueue_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  __int16 v17 = a7;
  id v18 = a8;
  if (v15)
  {
    uint64_t v19 = v16;
  }
  else
  {
    if (v16)
    {
      id v20 = (void *)[v16 mutableCopy];
    }
    else
    {
      id v20 = [MEMORY[0x263EFF9A0] dictionary];
    }
    uint64_t v19 = v20;
    id v21 = objc_msgSend(v20, "hmf_dictionaryForKey:", @"kRequestedCapabilitiesKey");
    v22 = (void *)[v21 mutableCopy];

    if (!v22)
    {
      v22 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v22 setObject:&unk_26E472568 forKeyedSubscript:@"kHomedVersionKey"];
    [v19 setObject:v22 forKeyedSubscript:@"kRequestedCapabilitiesKey"];
  }
  v23 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  int v24 = [(HMDSecureRemoteMessageTransport *)self accountRegistry];
  char v25 = +[HMDMessageDispatcher destinationWithTarget:v23 userID:v14 destination:v15 multicast:1 accountRegistry:v24];

  if (v25)
  {
    __int16 v26 = [[HMDRemoteMessage alloc] initWithName:@"kElectDeviceForIDSSessionKey" destination:v25 payload:v19 type:0 timeout:0 secure:17 restriction:a6];
    objc_initWeak((id *)location, self);
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    __int16 v33 = __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke_2;
    char v34 = &unk_264A2B560;
    objc_copyWeak(&v37, (id *)location);
    uint64_t v35 = v17;
    id v36 = v18;
    [(HMDRemoteMessage *)v26 setResponseHandler:&v31];
    -[HMDSecureRemoteMessageTransport sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v26, 0, v31, v32, v33, v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    __int16 v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v30;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot elect device for HH1 user: could not create message destination for userID: %@, destination: %@", location, 0x20u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v39 = (HMDRemoteMessage *)v18;
    dispatch_async(v17, block);
    __int16 v26 = v39;
  }
}

void __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, v2, 0, MEMORY[0x263EFFA78]);
}

void __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleElectDeviceForUserResponse:v5 error:v8 responseQueue:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (BOOL)_handleReceivedMessage:(id)a3 transport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    id v14 = [v11 name];
    int v15 = [v14 isEqualToString:@"kPingInternalRequestKey"];

    if (v15)
    {
      [(HMDSecureRemoteMessageTransport *)self _handlePingMessage:v13];
    }
    else
    {
      if (!v13
        || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:v13])
      {
        BOOL v16 = 0;
        goto LABEL_16;
      }
      __int16 v17 = [v10 device];
      [(HMDSecureRemoteMessageTransport *)self _handleSecureMessage:v13 fromDevice:v17 transport:v7];
    }
    BOOL v16 = 1;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (id)_preferredTransportForMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [(HMDSecureRemoteMessageTransport *)self transports];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(HMDSecureRemoteMessageTransport *)self transports];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v13 canSendMessage:v4]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  if ((unint64_t)[v7 count] >= 2)
  {
    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: There should not be 2 or more available transport", buf, 0xCu);
    }
    id v20 = [[HMDAssertionLogEvent alloc] initWithReason:@"There should not be 2 or more available transport"];
    id v21 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v21 submitLogEvent:v20];
  }
  id v14 = [v7 lastObject];

  return v14;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F424F0] currentActivity];
  [v6 destination];
  id v48 = 0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 device];
      char v14 = +[HMDSecureRemoteMessageTransport isDeviceValidDestination:v13 error:&v48];
    }
    else
    {
      id v31 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = 0;
      }
      id v13 = v32;

      if (v13)
      {
        __int16 v33 = [v13 handle];

        if (v33)
        {
          char v14 = 1;
        }
        else
        {
          [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"Missing parameter." reason:@"Missing account from destination." suggestion:0];
          char v14 = 0;
          id v48 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        id v34 = v31;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v35 = v34;
        }
        else {
          uint64_t v35 = 0;
        }
        id v36 = v35;

        if (v36)
        {
          id v37 = [v36 homeUUID];

          if (v37)
          {
            char v14 = 1;
          }
          else
          {
            [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"Missing parameter." reason:@"Missing home from destination." suggestion:0];
            char v14 = 0;
            id v48 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          id v38 = v34;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v39 = v38;
          }
          else {
            id v39 = 0;
          }
          id v40 = v39;

          id v42 = v40;
          if (v40)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            id v51 = __Block_byref_object_copy__178429;
            char v52 = __Block_byref_object_dispose__178430;
            id v53 = 0;
            __int16 v41 = [v40 devices];
            v49[0] = MEMORY[0x263EF8330];
            v49[1] = 3221225472;
            v49[2] = __68__HMDSecureRemoteMessageTransport__isMessageDestinationValid_error___block_invoke;
            v49[3] = &unk_264A23B60;
            v49[4] = buf;
            char v14 = objc_msgSend(v41, "na_all:", v49);

            if ((v14 & 1) == 0) {
              id v48 = *(id *)(*(void *)&buf[8] + 40);
            }
            _Block_object_dispose(buf, 8);
          }
          else
          {
            [MEMORY[0x263F087E8] hmErrorWithCode:22 description:@"Invalid class." reason:@"Invalid destination class type." suggestion:0];
            char v14 = 0;
            id v48 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  int v15 = (uint64_t (*)(uint64_t, uint64_t))v48;
  if (v14)
  {
    BOOL v16 = [(HMDSecureRemoteMessageTransport *)self homeMessagingManager];
    char v17 = [v16 sendMessage:v6 completionHandler:v7];

    if ((v17 & 1) == 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__HMDSecureRemoteMessageTransport_sendMessage_completionHandler___block_invoke;
      block[3] = &unk_264A2EE30;
      id v44 = v6;
      uint64_t v45 = self;
      id v46 = v8;
      id v47 = v7;
      dispatch_async(queue, block);
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v51 = v15;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Invalid remote message destination for message %@: %@", buf, 0x20u);
    }
    long long v23 = (void *)MEMORY[0x230FBD990]();
    long long v24 = v20;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid remote message destination: %@", buf, 0x16u);
    }
    id v27 = [[HMDAssertionLogEvent alloc] initWithReason:@"Invalid remote message destination: %@", v15];
    __int16 v28 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v28 submitLogEvent:v27];

    uint64_t v29 = _Block_copy(v7);
    __int16 v30 = v29;
    if (v29) {
      (*((void (**)(void *, uint64_t (*)(uint64_t, uint64_t)))v29 + 2))(v29, v15);
    }

    [v6 respondWithError:v15];
  }
}

void __65__HMDSecureRemoteMessageTransport_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  v145[10] = *(id *)MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) accountRegistry];
  v104 = +[HMDRemoteMessageTransport remoteMessageFromMessage:v3 secure:0 accountRegistry:v4];

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *v2;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v104 shortDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@", buf, 0x16u);
  }
  v103 = [*(id *)(a1 + 40) _preferredTransportForMessage:v104];
  if (!v103)
  {
    long long v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 40);
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v104;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, there is no available transport", buf, 0x16u);
    }
    [v104 name];

    id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    __int16 v28 = _Block_copy(*(const void **)(a1 + 56));
    uint64_t v29 = v28;
    if (v28) {
      (*((void (**)(void *, void *))v28 + 2))(v28, v27);
    }

    [*(id *)(a1 + 32) respondWithError:v27];
LABEL_23:

    goto LABEL_49;
  }
  id v11 = *(void **)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  id v12 = *(void **)(a1 + 56);
  id v13 = v104;
  id v14 = v103;
  id v15 = v10;
  id v16 = v12;
  v100 = v11;
  if (!v11)
  {
LABEL_19:

    __int16 v30 = *(void **)(a1 + 40);
    id v31 = *(void **)(a1 + 48);
    uint64_t v32 = *(void **)(a1 + 56);
    id v33 = v13;
    id v34 = v14;
    id v35 = v31;
    id v36 = v32;
    if (v30 && [v33 isSecure] && (objc_msgSend(v34, "isSecure") & 1) == 0)
    {
      __int16 v41 = (void *)[v33 mutableCopy];
      id v42 = [v33 identifier];
      [v41 setIdentifier:v42];

      objc_initWeak((id *)location, v30);
      __int16 v43 = [v33 responseHandler];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke;
      v141 = &unk_264A23C00;
      objc_copyWeak(v145, (id *)location);
      id v44 = v41;
      id v142 = v44;
      id v45 = v43;
      id v143 = v45;
      id v46 = v36;
      id v144 = v46;
      [v33 setResponseHandler:buf];
      id v47 = v35;
      [v33 name];

      [v33 identifier];
      id v48 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v48);

      [v30 _sendSecureMessage:v33 completionHandler:v46];
      objc_destroyWeak(v145);

      objc_destroyWeak((id *)location);
      goto LABEL_49;
    }

    id v27 = _Block_copy(*(const void **)(a1 + 56));
    id v37 = *(id *)(a1 + 48);
    [v33 name];

    id v38 = [v33 identifier];

    id v39 = (objc_class *)objc_opt_class();
    id v40 = NSStringFromClass(v39);
    [v34 sendMessage:v33 completionHandler:v27];
    goto LABEL_23;
  }
  char v17 = [v13 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {

    goto LABEL_19;
  }
  id v107 = v13;
  id v20 = v19;
  id v102 = v14;
  id v98 = v15;
  id aBlock = v16;
  v106 = v20;
  int v99 = [v20 isMulticast];
  if (v99)
  {
    if ([v107 isSecure] && !objc_msgSend(v102, "isSecure"))
    {
      id v50 = (void *)MEMORY[0x230FBD990]();
      val = v100;
      id v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        char v52 = HMFGetLogIdentifier();
        id v53 = [v107 identifier];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Sending account destination message %{public}@ securely to each device in the account.", buf, 0x16u);
      }
      v105 = [v107 responseHandler];
      v128[0] = 0;
      v128[1] = v128;
      v128[2] = 0x2020000000;
      BOOL v129 = v105 != 0;
      v126[0] = 0;
      v126[1] = v126;
      v126[2] = 0x3032000000;
      v126[3] = __Block_byref_object_copy__178429;
      v126[4] = __Block_byref_object_dispose__178430;
      id v127 = 0;
      uint64_t v54 = dispatch_group_create();
      __int16 v55 = +[HMDAccountRegistry sharedRegistry];
      v56 = [v106 handle];
      v97 = [v55 accountForHandle:v56];

      __int16 v57 = (void *)MEMORY[0x263EFFA08];
      v58 = [v97 devices];
      v59 = [v57 setWithArray:v58];

      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v60 = v59;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v122 objects:buf count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v123;
        do
        {
          for (uint64_t i = 0; i != v61; ++i)
          {
            if (*(void *)v123 != v62) {
              objc_enumerationMutation(v60);
            }
            v64 = *(void **)(*((void *)&v122 + 1) + 8 * i);
            if ((objc_msgSend(v64, "isCurrentDevice", v97, v98) & 1) == 0)
            {
              v65 = (void *)[v107 mutableCopy];
              v66 = [HMDRemoteDeviceMessageDestination alloc];
              v67 = [v106 target];
              v68 = [(HMDRemoteDeviceMessageDestination *)v66 initWithTarget:v67 device:v64];
              [v65 setDestination:v68];

              dispatch_group_enter(v54);
              v117[0] = MEMORY[0x263EF8330];
              v117[1] = 3221225472;
              v117[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke;
              v117[3] = &unk_264A23B88;
              v117[4] = val;
              v120 = v126;
              v121 = v128;
              id v119 = v105;
              v118 = v54;
              [v65 setResponseHandler:v117];
              [val sendMessage:v65 completionHandler:0];
            }
          }
          uint64_t v61 = [v60 countByEnumeratingWithState:&v122 objects:buf count:16];
        }
        while (v61);
      }

      v69 = [HMDDeviceDiscoveryOperation alloc];
      [v107 timeout];
      v70 = -[HMDDeviceDiscoveryOperation initWithAccount:timeout:](v69, "initWithAccount:timeout:", v97);
      -[HMDDeviceDiscoveryOperation setQualityOfService:](v70, "setQualityOfService:", [v107 qualityOfService]);
      objc_initWeak(&from, val);
      *(void *)id location = MEMORY[0x263EF8330];
      *(void *)&location[8] = 3221225472;
      *(void *)&location[16] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_2;
      v131 = &unk_264A23BB0;
      objc_copyWeak(&v139, &from);
      id v71 = v60;
      id v132 = v71;
      id v133 = v107;
      id v134 = v106;
      v72 = v54;
      v135 = v72;
      v137 = v126;
      v138 = v128;
      id v73 = v105;
      id v136 = v73;
      [(HMDDeviceDiscoveryOperation *)v70 setDiscoveryBlock:location];
      dispatch_group_enter(v72);
      v114[0] = MEMORY[0x263EF8330];
      v114[1] = 3221225472;
      v114[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_4;
      v114[3] = &unk_264A2F7F8;
      v74 = v72;
      v115 = v74;
      [(HMDDeviceDiscoveryOperation *)v70 setCompletionBlock:v114];
      v75 = [MEMORY[0x263F42628] defaultScheduler];
      id v76 = (id)[v75 performOperation:v70];

      v77 = val[2];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_5;
      block[3] = &unk_264A2A4E0;
      v112 = v128;
      id v78 = v73;
      id v111 = v78;
      v113 = v126;
      dispatch_group_notify(v74, v77, block);
      v79 = _Block_copy(aBlock);
      v80 = v79;
      if (v79) {
        (*((void (**)(void *, void))v79 + 2))(v79, 0);
      }

      objc_destroyWeak(&v139);
      objc_destroyWeak(&from);

      _Block_object_dispose(v126, 8);
      _Block_object_dispose(v128, 8);
    }
    else
    {
      [v107 name];

      [v107 identifier];
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      [v102 sendMessage:v107 completionHandler:aBlock];
    }
  }

  if ((v99 & 1) == 0)
  {
    id v81 = v106;
    id v82 = v107;
    id v83 = aBlock;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __103__HMDSecureRemoteMessageTransport__electDeviceForAccountDestination_thenSendMessage_completionHandler___block_invoke;
    v141 = &unk_264A23BD8;
    id v142 = v100;
    id v84 = v82;
    id v143 = v84;
    id v85 = v83;
    v145[0] = v85;
    id v86 = v81;
    id v144 = v86;
    v87 = _Block_copy(buf);
    v88 = [v86 remoteDestinationString];
    v89 = [v100 userDeviceCapabilitiesRequestManager];
    if (v89)
    {
      v90 = [v86 deviceCapabilities];
      [v89 electDeviceForUserID:v88 destination:0 deviceCapabilities:v90 responseTimeout:v100[2] responseQueue:v87 completionHandler:0.0];
    }
    else
    {
      id vala = (id)MEMORY[0x230FBD990]();
      v91 = v100;
      v92 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v93 = HMFGetLogIdentifier();
        v94 = [v84 shortDescription];
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v93;
        *(_WORD *)&unsigned char location[12] = 2114;
        *(void *)&location[14] = v94;
        _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_ERROR, "%{public}@Asked to send message %{public}@ before device capabilities request manager has been configured", location, 0x16u);
      }
      v90 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      v95 = _Block_copy(v85);
      v96 = v95;
      if (v95) {
        (*((void (**)(void *, void *))v95 + 2))(v95, v90);
      }

      [v84 respondWithError:v90];
    }
  }
LABEL_49:
}

void __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543874;
      id v24 = v11;
      __int16 v25 = 2114;
      __int16 v26 = v12;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send secure message %{public}@: %@", buf, 0x20u);
    }
  }
  if (WeakRetained)
  {
    id v13 = [v5 domain];
    if ([v13 isEqualToString:*MEMORY[0x263F08410]]
      && ([v5 code] == -6722 || objc_msgSend(v5, "code") == -6752))
    {
      id v14 = [WeakRetained transports];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        id v16 = WeakRetained[2];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke_162;
        block[3] = &unk_264A2EE80;
        id v20 = *(id *)(a1 + 32);
        id v21 = WeakRetained;
        id v22 = *(id *)(a1 + 48);
        dispatch_async(v16, block);

        char v17 = v20;
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  id v18 = _Block_copy(*(const void **)(a1 + 40));
  char v17 = v18;
  if (v18) {
    (*((void (**)(void *, id, id))v18 + 2))(v18, v5, v6);
  }
LABEL_14:
}

void __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke_162(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = +[HMDRemoteMessageTransport remoteMessageFromMessage:*(void *)(a1 + 32) secure:1 accountRegistry:0];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = v2;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying sending message: %@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) _sendSecureMessage:v2 completionHandler:*(void *)(a1 + 48)];
}

void __103__HMDSecureRemoteMessageTransport__electDeviceForAccountDestination_thenSendMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 || !v8)
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    char v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = *(void **)(a1 + 40);
      int v30 = 138543874;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to elect device for message: %@, error: %@", (uint8_t *)&v30, 0x20u);
    }
    id v20 = _Block_copy(*(const void **)(a1 + 56));
    id v21 = v20;
    if (v20) {
      (*((void (**)(void *, id))v20 + 2))(v20, v7);
    }

    [*(id *)(a1 + 40) respondWithError:v7];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) accountRegistry];
    uint64_t v11 = [v10 deviceForHandle:v8];

    if (v11)
    {
      id v12 = [HMDRemoteDeviceMessageDestination alloc];
      id v13 = [*(id *)(a1 + 48) target];
      id v14 = [(HMDRemoteDeviceMessageDestination *)v12 initWithTarget:v13 device:v11];
      [*(id *)(a1 + 40) setDestination:v14];

      [*(id *)(a1 + 32) sendMessage:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      id v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        __int16 v26 = *(void **)(a1 + 40);
        int v30 = 138543874;
        id v31 = v25;
        __int16 v32 = 2112;
        id v33 = v8;
        __int16 v34 = 2112;
        id v35 = v26;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unknown device for handle: %@. Failed to send for message: %@", (uint8_t *)&v30, 0x20u);
      }
      __int16 v27 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      id v28 = _Block_copy(*(const void **)(a1 + 56));
      uint64_t v29 = v28;
      if (v28) {
        (*((void (**)(void *, void *))v28 + 2))(v28, v27);
      }

      [*(id *)(a1 + 40) respondWithError:v27];
    }
  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (v9 || (uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8), !*(unsigned char *)(v8 + 24)))
  {
    os_unfair_lock_unlock(v7);
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 0;
    os_unfair_lock_unlock(v7);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v6 = [HMDRemoteDeviceMessageDestination alloc];
    id v7 = [*(id *)(a1 + 48) target];
    uint64_t v8 = [(HMDRemoteDeviceMessageDestination *)v6 initWithTarget:v7 device:v3];
    [v5 setDestination:v8];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_3;
    v12[3] = &unk_264A23B88;
    uint64_t v9 = *(void *)(a1 + 80);
    v12[4] = WeakRetained;
    uint64_t v15 = v9;
    long long v11 = *(_OWORD *)(a1 + 64);
    id v10 = (id)v11;
    long long v14 = v11;
    id v13 = *(id *)(a1 + 56);
    [v5 setResponseHandler:v12];
    [WeakRetained sendMessage:v5 completionHandler:0];
  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_4(uint64_t a1)
{
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_5(void *a1)
{
  uint64_t v1 = *(void *)(a1[5] + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 0;
    uint64_t v2 = a1[4];
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v3 = *(void (**)(uint64_t))(v2 + 16);
      uint64_t v4 = a1[4];
      v3(v4);
    }
    else
    {
      id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
      (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
    }
  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (v9 || (uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8), !*(unsigned char *)(v8 + 24)))
  {
    os_unfair_lock_unlock(v7);
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 0;
    os_unfair_lock_unlock(v7);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

BOOL __68__HMDSecureRemoteMessageTransport__isMessageDestinationValid_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  BOOL v3 = +[HMDSecureRemoteMessageTransport isDeviceValidDestination:a2 error:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

- (void)registerHomeMessageDestinationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSecureRemoteMessageTransport *)self homeMessagingManager];
  [v5 registerHandler:v4];
}

- (void)_reset
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = self->_secureRemoteSessions;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = self;
        long long v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v18 = v12;
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing secure session: %@", buf, 0x16u);
        }
        [v8 close];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_secureRemoteSessions removeAllObjects];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDSecureRemoteMessageTransport_reset__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __40__HMDSecureRemoteMessageTransport_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (id)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDSecureRemoteMessageTransport_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_sync(queue, block);
  uint64_t v4 = [(HMDSecureRemoteMessageTransport *)self startFuture];
  return v4;
}

void __40__HMDSecureRemoteMessageTransport_start__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v25 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);
  }
  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  id v7 = [*(id *)(a1 + 32) transports];
  uint64_t v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = objc_msgSend(*(id *)(a1 + 32), "transports", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v19 + 1) + 8 * v13) start];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  long long v15 = [*(id *)(a1 + 32) deviceMonitor];
  [v15 start];

  long long v16 = [*(id *)(a1 + 32) startPromise];
  char v17 = [MEMORY[0x263F42538] allSettled:v8];
  id v18 = [v17 ignoreOutcome];
  [v16 resolveWithFuture:v18];
}

- (void)configureWithUserDeviceCapabilitiesRequestManager:(id)a3 deviceResidencyProvider:(id)a4 remoteMessageListener:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  [(HMDSecureRemoteMessageTransport *)self setUserDeviceCapabilitiesRequestManager:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(HMDSecureRemoteMessageTransport *)self transports];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v18 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v16 = v15;
        }
        else {
          long long v16 = 0;
        }
        id v17 = v16;

        if (v17)
        {
          [v17 setResidencyProvider:v8];
          [v17 configureWithRemoteMessageListener:v9];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)configureWithCloudDataSyncStateFilter:(id)a3 homeMembershipVerifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(HMDSecureRemoteMessageTransport *)self setCloudDataSyncStateFilter:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(HMDSecureRemoteMessageTransport *)self transports];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) configureWithHomeMembershipVerifier:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSString)description
{
  return (NSString *)[(HMDSecureRemoteMessageTransport *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDSecureRemoteMessageTransport *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = [(id)objc_opt_class() shortDescription];
  id v7 = (void *)v6;
  if (a3)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    uint64_t v9 = [v5 stringWithFormat:@"<%@%@>", v7, v8];
  }
  else
  {
    uint64_t v9 = [v5 stringWithFormat:@"<%@%@>", v6, &stru_26E2EB898];
  }

  return v9;
}

- (id)shortDescription
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (HMDSecureRemoteMessageTransport)initWithDataSource:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HMDSecureRemoteMessageTransport;
  uint64_t v6 = [(HMDSecureRemoteMessageTransport *)&v43 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    uint64_t v8 = [v5 accountRegistry];
    accountRegistry = v7->_accountRegistry;
    v7->_accountRegistry = (HMDAccountRegistry *)v8;

    HMDispatchQueueNameString();
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)[v10 UTF8String];
    long long v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    secureRemoteSessions = v7->_secureRemoteSessions;
    v7->_secureRemoteSessions = (NSMutableSet *)v15;

    id obj = 0;
    uint64_t v17 = [MEMORY[0x263F42538] futureWithPromise:&obj];
    startFuture = v7->_startFuture;
    v7->_startFuture = (HMFFuture *)v17;

    objc_storeStrong((id *)&v7->_startPromise, obj);
    v7->_responseHandlerLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [v5 transports];
    transports = v7->_transports;
    v7->_transports = (NSArray *)v19;

    uint64_t v21 = [v5 deviceMonitor];
    deviceMonitor = v7->_deviceMonitor;
    v7->_deviceMonitor = (HMDRemoteDeviceMonitor *)v21;

    uint64_t v23 = [v5 reachabilityObserver];
    modernReachabilityObserver = v7->_modernReachabilityObserver;
    v7->_modernReachabilityObserver = (HMDModernTransportDeviceReachabilityObserver *)v23;

    uint64_t v25 = [v5 homeMessagingManager];
    homeMessagingManager = v7->_homeMessagingManager;
    v7->_homeMessagingManager = (HMDRemoteHomeMessagingManager *)v25;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    __int16 v27 = [(HMDSecureRemoteMessageTransport *)v7 transports];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v27);
          }
          __int16 v32 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v32 setDelegate:v7];
          id v33 = v32;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v34 = v33;
          }
          else {
            __int16 v34 = 0;
          }
          id v35 = v34;

          if (v35)
          {
            uint64_t v36 = [v5 reachabilityObserver];
            [v35 setReachabilityDelegate:v36];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v29);
    }
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t62 != -1) {
    dispatch_once(&logCategory__hmf_once_t62, &__block_literal_global_203_178543);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v63;
  return v2;
}

void __46__HMDSecureRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v63;
  logCategory__hmf_once_v63 = v0;
}

+ (BOOL)isDeviceValidDestination:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = @"Missing parameter.";
      uint64_t v9 = @"Missing device from destination.";
      uint64_t v10 = 20;
      goto LABEL_7;
    }
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  if (![v5 isCurrentDevice])
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_9;
  }
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = @"Invalid parameter.";
  uint64_t v9 = @"Invalid destination, cannot send message to ourselves.";
  uint64_t v10 = 3;
LABEL_7:
  [v7 hmErrorWithCode:v10 description:v8 reason:v9 suggestion:0];
  BOOL v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

+ (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (HMDSecureRemoteMessageTransport)defaultTransport
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDSecureRemoteMessageTransport_defaultTransport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (defaultTransport_onceToken_178557 != -1) {
    dispatch_once(&defaultTransport_onceToken_178557, block);
  }
  uint64_t v2 = (void *)defaultTransport_defaultTransport_178558;
  return (HMDSecureRemoteMessageTransport *)v2;
}

void __51__HMDSecureRemoteMessageTransport_defaultTransport__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_alloc_init(HMDSecureRemoteMessageTransportDefaultDataSource);
  id v3 = [[HMDSecureRemoteMessageTransport alloc] initWithDataSource:v2];
  uint64_t v4 = (void *)defaultTransport_defaultTransport_178558;
  defaultTransport_defaultTransport_178558 = (uint64_t)v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating a default secure remote transport", (uint8_t *)&v9, 0xCu);
  }
}

@end