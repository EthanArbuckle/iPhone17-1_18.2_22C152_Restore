@interface MTSDeviceSetupExtensionMessenger
+ (id)logCategory;
- (BOOL)startWithError:(id *)a3;
- (MTSDeviceSetupExtensionMessenger)initWithContainingAppBundleURL:(id)a3;
- (MTSDeviceSetupExtensionProcess)extensionProcess;
- (MTSXPCConnection)xpcConnection;
- (NSURL)containingAppBundleURL;
- (id)executeExtensionQueryHandler;
- (id)extensionProcessFactory;
- (void)configureDeviceWithName:(id)a3 room:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)fetchRoomsInHome:(id)a3 completionHandler:(id)a4;
- (void)pairDeviceInHome:(id)a3 onboardingPayload:(id)a4 uuid:(id)a5 completionHandler:(id)a6;
- (void)selectThreadNetworkFromScanResults:(id)a3 completionHandler:(id)a4;
- (void)selectWiFiNetworkFromScanResults:(id)a3 completionHandler:(id)a4;
- (void)setExecuteExtensionQueryHandler:(id)a3;
- (void)setExtensionProcess:(id)a3;
- (void)setExtensionProcessFactory:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)validateDeviceCredential:(id)a3 completionHandler:(id)a4;
@end

@implementation MTSDeviceSetupExtensionMessenger

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionProcessFactory, 0);
  objc_storeStrong(&self->_executeExtensionQueryHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);

  objc_storeStrong((id *)&self->_containingAppBundleURL, 0);
}

- (void)setExtensionProcessFactory:(id)a3
{
}

- (id)extensionProcessFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setExecuteExtensionQueryHandler:(id)a3
{
}

- (id)executeExtensionQueryHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (MTSXPCConnection)xpcConnection
{
  return (MTSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExtensionProcess:(id)a3
{
}

- (MTSDeviceSetupExtensionProcess)extensionProcess
{
  return (MTSDeviceSetupExtensionProcess *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)containingAppBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)configureDeviceWithName:(id)a3 room:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x245697870]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v25 = v14;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_2450FD000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending configure device request with name: %@, room: %@", buf, 0x20u);
  }
  v15 = [(MTSDeviceSetupExtensionMessenger *)v12 xpcConnection];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __83__MTSDeviceSetupExtensionMessenger_configureDeviceWithName_room_completionHandler___block_invoke;
  v21 = &unk_2651C5D78;
  v22 = v12;
  id v23 = v10;
  id v16 = v10;
  v17 = [v15 remoteObjectProxyWithErrorHandler:&v18];

  objc_msgSend(v17, "configureDeviceWithName:room:completionHandler:", v8, v9, v16, v18, v19, v20, v21, v22);
}

void __83__MTSDeviceSetupExtensionMessenger_configureDeviceWithName_room_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to configure device: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchRoomsInHome:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x245697870]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending fetch rooms request with home: %@", buf, 0x16u);
  }
  uint64_t v12 = [(MTSDeviceSetupExtensionMessenger *)v9 xpcConnection];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __71__MTSDeviceSetupExtensionMessenger_fetchRoomsInHome_completionHandler___block_invoke;
  uint64_t v18 = &unk_2651C5D78;
  uint64_t v19 = v9;
  id v20 = v7;
  id v13 = v7;
  v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  objc_msgSend(v14, "fetchRoomsInHome:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

void __71__MTSDeviceSetupExtensionMessenger_fetchRoomsInHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to fetch rooms: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pairDeviceInHome:(id)a3 onboardingPayload:(id)a4 uuid:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x245697870]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    __int16 v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl(&dword_2450FD000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending pair device request with home: %@, onboardingPayload: %@, uuid: %@", buf, 0x2Au);
  }
  uint64_t v18 = [(MTSDeviceSetupExtensionMessenger *)v15 xpcConnection];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  __int16 v23 = __94__MTSDeviceSetupExtensionMessenger_pairDeviceInHome_onboardingPayload_uuid_completionHandler___block_invoke;
  id v24 = &unk_2651C5D78;
  uint64_t v25 = v15;
  id v26 = v13;
  id v19 = v13;
  id v20 = [v18 remoteObjectProxyWithErrorHandler:&v21];

  objc_msgSend(v20, "pairDeviceInHome:onboardingPayload:uuid:completionHandler:", v10, v11, v12, v19, v21, v22, v23, v24, v25);
}

void __94__MTSDeviceSetupExtensionMessenger_pairDeviceInHome_onboardingPayload_uuid_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to pair device: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)validateDeviceCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x245697870]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending validate device credential request with deviceCredential: %@", buf, 0x16u);
  }
  uint64_t v12 = [(MTSDeviceSetupExtensionMessenger *)v9 xpcConnection];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __79__MTSDeviceSetupExtensionMessenger_validateDeviceCredential_completionHandler___block_invoke;
  uint64_t v18 = &unk_2651C5D78;
  id v19 = v9;
  id v20 = v7;
  id v13 = v7;
  v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  objc_msgSend(v14, "validateDeviceCredential:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

void __79__MTSDeviceSetupExtensionMessenger_validateDeviceCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to validate device: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)selectThreadNetworkFromScanResults:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x245697870]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending select thread network request with threadScanResults: %@", buf, 0x16u);
  }
  uint64_t v12 = [(MTSDeviceSetupExtensionMessenger *)v9 xpcConnection];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __89__MTSDeviceSetupExtensionMessenger_selectThreadNetworkFromScanResults_completionHandler___block_invoke;
  uint64_t v18 = &unk_2651C5D78;
  id v19 = v9;
  id v20 = v7;
  id v13 = v7;
  v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  objc_msgSend(v14, "selectThreadNetworkFromScanResults:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

void __89__MTSDeviceSetupExtensionMessenger_selectThreadNetworkFromScanResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to select thread network: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)selectWiFiNetworkFromScanResults:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x245697870]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending select WiFi network request with wifiScanResults: %@", buf, 0x16u);
  }
  uint64_t v12 = [(MTSDeviceSetupExtensionMessenger *)v9 xpcConnection];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __87__MTSDeviceSetupExtensionMessenger_selectWiFiNetworkFromScanResults_completionHandler___block_invoke;
  uint64_t v18 = &unk_2651C5D78;
  id v19 = v9;
  id v20 = v7;
  id v13 = v7;
  v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  objc_msgSend(v14, "selectWiFiNetworkFromScanResults:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

void __87__MTSDeviceSetupExtensionMessenger_selectWiFiNetworkFromScanResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to select wifi network: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x245697870](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v8;
    _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting device setup extension messenger", buf, 0xCu);
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:@"com.apple.matter.support.extension.device-setup"];
  __int16 v10 = [(MTSDeviceSetupExtensionMessenger *)v6 executeExtensionQueryHandler];
  id v11 = ((void (**)(void, void *))v10)[2](v10, v9);

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke;
  v45[3] = &unk_2651C5C98;
  v45[4] = v6;
  uint64_t v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", v45);
  if (v12)
  {
    id v13 = (__CFString *)[objc_alloc(MEMORY[0x263F04DD8]) initWithExtensionIdentity:v12];
    v14 = [(MTSDeviceSetupExtensionMessenger *)v6 extensionProcessFactory];
    id v44 = 0;
    uint64_t v15 = ((void (**)(void, __CFString *, id *))v14)[2](v14, v13, &v44);
    id v40 = v44;
    [(MTSDeviceSetupExtensionMessenger *)v6 setExtensionProcess:v15];

    uint64_t v16 = [(MTSDeviceSetupExtensionMessenger *)v6 extensionProcess];
    LODWORD(v15) = v16 == 0;

    if (v15)
    {
      __int16 v29 = (void *)MEMORY[0x245697870]();
      id v30 = v6;
      __int16 v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v47 = v32;
        __int16 v48 = 2112;
        v49 = v13;
        __int16 v50 = 2112;
        id v51 = v40;
        _os_log_impl(&dword_2450FD000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create extension process from configuration %@: %@", buf, 0x20u);
      }
      BOOL v20 = 0;
      if (a3) {
        *a3 = v40;
      }
    }
    else
    {
      v17 = [(MTSDeviceSetupExtensionMessenger *)v6 extensionProcess];
      id v43 = 0;
      uint64_t v18 = [v17 makeMTSXPCConnectionWithError:&v43];
      id v39 = v43;
      [(MTSDeviceSetupExtensionMessenger *)v6 setXpcConnection:v18];

      id v19 = [(MTSDeviceSetupExtensionMessenger *)v6 xpcConnection];
      BOOL v20 = v19 != 0;

      if (v20)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x263F08D80], "mts_deviceSetupExtensionInterface");
        uint64_t v22 = [(MTSDeviceSetupExtensionMessenger *)v6 xpcConnection];
        [v22 setRemoteObjectInterface:v21];

        objc_initWeak((id *)buf, v6);
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke_68;
        v41[3] = &unk_2651C5D50;
        objc_copyWeak(&v42, (id *)buf);
        __int16 v23 = [(MTSDeviceSetupExtensionMessenger *)v6 xpcConnection];
        [v23 setInterruptionHandler:v41];

        id v24 = [(MTSDeviceSetupExtensionMessenger *)v6 xpcConnection];
        [v24 activate];

        objc_destroyWeak(&v42);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        context = (void *)MEMORY[0x245697870]();
        __int16 v33 = v6;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = HMFGetLogIdentifier();
          v36 = [(MTSDeviceSetupExtensionMessenger *)v33 extensionProcess];
          *(_DWORD *)buf = 138543874;
          v47 = v35;
          __int16 v48 = 2112;
          v49 = v36;
          __int16 v50 = 2112;
          id v51 = v39;
          _os_log_impl(&dword_2450FD000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to make XPC connection with extension process %@: %@", buf, 0x20u);
        }
        if (a3) {
          *a3 = v39;
        }
      }
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x245697870]();
    id v26 = v6;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v28;
      __int16 v48 = 2112;
      v49 = @"com.apple.matter.support.extension.device-setup";
      _os_log_impl(&dword_2450FD000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to find identity for extension identifier: %@", buf, 0x16u);
    }
    if (a3)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:2];
      BOOL v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

uint64_t __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containingAppBundleURL];
  v4 = [*(id *)(a1 + 32) containingAppBundleURL];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke_68(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x245697870]();
  id v3 = WeakRetained;
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_2450FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Device setup XPC connection was interrupted", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dealloc
{
  [(MTSXPCConnection *)self->_xpcConnection invalidate];
  [(MTSDeviceSetupExtensionProcess *)self->_extensionProcess invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTSDeviceSetupExtensionMessenger;
  [(MTSDeviceSetupExtensionMessenger *)&v3 dealloc];
}

- (MTSDeviceSetupExtensionMessenger)initWithContainingAppBundleURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)MTSDeviceSetupExtensionMessenger;
    int v6 = [(MTSDeviceSetupExtensionMessenger *)&v13 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      containingAppBundleURL = v6->_containingAppBundleURL;
      v6->_containingAppBundleURL = (NSURL *)v7;

      id executeExtensionQueryHandler = v6->_executeExtensionQueryHandler;
      v6->_id executeExtensionQueryHandler = &__block_literal_global_1744;

      id extensionProcessFactory = v6->_extensionProcessFactory;
      v6->_id extensionProcessFactory = &__block_literal_global_59;
    }
    return v6;
  }
  else
  {
    uint64_t v12 = _HMFPreconditionFailure();
    return (MTSDeviceSetupExtensionMessenger *)__67__MTSDeviceSetupExtensionMessenger_initWithContainingAppBundleURL___block_invoke_2(v12);
  }
}

uint64_t __67__MTSDeviceSetupExtensionMessenger_initWithContainingAppBundleURL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F04DD0] extensionProcessWithConfiguration:a2 error:a3];
}

uint64_t __67__MTSDeviceSetupExtensionMessenger_initWithContainingAppBundleURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F04DF0] executeQuery:a2];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_71);
  }
  v2 = (void *)logCategory__hmf_once_v9;

  return v2;
}

uint64_t __47__MTSDeviceSetupExtensionMessenger_logCategory__block_invoke()
{
  logCategory__hmf_once_id v9 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end