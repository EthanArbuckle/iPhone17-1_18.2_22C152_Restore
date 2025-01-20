@interface HMDDeviceSetupConfiguringController
+ (id)logCategory;
- (BOOL)_shouldRegisterRequest;
- (HMDAppleMediaAccessoryDiagnosticInfoController)diagnosticInfoController;
- (HMDDeviceSetupConfiguringController)init;
- (HMDDeviceSetupConfiguringController)initWithDiagnosticInfoControllerInternal:(id)a3;
- (HMDDeviceSetupConfiguringController)initWithQueue:(id)a3 rpCompanionLinkClientFactory:(id)a4 diagnosticInfoController:(id)a5;
- (OS_dispatch_queue)workQueue;
- (RPCompanionLinkClient)client;
- (id)_activeDevicesWithMediaRouteIdentifier:(id)a3;
- (id)rpCompanionLinkClientFactory;
- (unint64_t)requestIDRegistrationDelay;
- (unint64_t)restartRPClientDelay;
- (void)_queryWithRequestID:(id)a3 mediaRouteIdentifier:(id)a4 rpDevice:(id)a5 additionalKeys:(id)a6 withCompletion:(id)a7;
- (void)_registerRequest:(id)a3;
- (void)_registerRequest:(id)a3 after:(int64_t)a4;
- (void)_setupCompanionLinkClient;
- (void)_setupRPClientAfter:(int64_t)a3;
- (void)_tearDownCompanionLinkClient;
- (void)queryConfiguringState:(id)a3 additionalKeys:(id)a4 withCompletion:(id)a5;
- (void)registerRequestID;
- (void)setClient:(id)a3;
- (void)setDiagnosticInfoController:(id)a3;
- (void)setRequestIDRegistrationDelay:(unint64_t)a3;
- (void)setRestartRPClientDelay:(unint64_t)a3;
- (void)setRpCompanionLinkClientFactory:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setupRPClient;
@end

@implementation HMDDeviceSetupConfiguringController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoController, 0);
  objc_storeStrong(&self->_rpCompanionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setRestartRPClientDelay:(unint64_t)a3
{
  self->_restartRPClientDelay = a3;
}

- (unint64_t)restartRPClientDelay
{
  return self->_restartRPClientDelay;
}

- (void)setRequestIDRegistrationDelay:(unint64_t)a3
{
  self->_requestIDRegistrationDelay = a3;
}

- (unint64_t)requestIDRegistrationDelay
{
  return self->_requestIDRegistrationDelay;
}

- (void)setClient:(id)a3
{
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setDiagnosticInfoController:(id)a3
{
}

- (HMDAppleMediaAccessoryDiagnosticInfoController)diagnosticInfoController
{
  return self->_diagnosticInfoController;
}

- (void)setRpCompanionLinkClientFactory:(id)a3
{
}

- (id)rpCompanionLinkClientFactory
{
  return self->_rpCompanionLinkClientFactory;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_setupRPClientAfter:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [NSNumber numberWithLongLong:a3];
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Will setup the RPCompanionLinkClient after %@s", buf, 0x16u);
  }
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * a3);
  v11 = [(HMDDeviceSetupConfiguringController *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDDeviceSetupConfiguringController__setupRPClientAfter___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_after(v10, v11, block);
}

uint64_t __59__HMDDeviceSetupConfiguringController__setupRPClientAfter___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Tearing down RP client and setting up again", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _tearDownCompanionLinkClient];
  [*(id *)(a1 + 32) _setupCompanionLinkClient];
  uint64_t result = [*(id *)(a1 + 32) _shouldRegisterRequest];
  if (result) {
    return [*(id *)(a1 + 32) registerRequestID];
  }
  return result;
}

- (void)_setupCompanionLinkClient
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDDeviceSetupConfiguringController *)self rpCompanionLinkClientFactory];
  v5 = v4[2]();
  [(HMDDeviceSetupConfiguringController *)self setClient:v5];

  v6 = [(HMDDeviceSetupConfiguringController *)self client];

  if (v6)
  {
    int v7 = [(HMDDeviceSetupConfiguringController *)self workQueue];
    v8 = [(HMDDeviceSetupConfiguringController *)self client];
    [v8 setDispatchQueue:v7];

    uint64_t v9 = [(HMDDeviceSetupConfiguringController *)self client];
    [v9 setControlFlags:14];

    dispatch_time_t v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = NSNumber;
      __int16 v15 = [(HMDDeviceSetupConfiguringController *)v11 client];
      v16 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "controlFlags"));
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      __int16 v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Set up the companion link client, controlFlags = %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v11);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke;
    v36[3] = &unk_264A2C170;
    objc_copyWeak(&v37, (id *)buf);
    uint64_t v17 = [(HMDDeviceSetupConfiguringController *)v11 client];
    [v17 setInvalidationHandler:v36];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_19;
    v34[3] = &unk_264A2C170;
    objc_copyWeak(&v35, (id *)buf);
    v18 = [(HMDDeviceSetupConfiguringController *)v11 client];
    [v18 setInterruptionHandler:v34];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_20;
    v32[3] = &unk_264A22930;
    objc_copyWeak(&v33, (id *)buf);
    v19 = [(HMDDeviceSetupConfiguringController *)v11 client];
    [v19 setDeviceFoundHandler:v32];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_22;
    v30[3] = &unk_264A22930;
    objc_copyWeak(&v31, (id *)buf);
    v20 = [(HMDDeviceSetupConfiguringController *)v11 client];
    [v20 setDeviceLostHandler:v30];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_23;
    v28[3] = &unk_264A22958;
    objc_copyWeak(&v29, (id *)buf);
    v21 = [(HMDDeviceSetupConfiguringController *)v11 client];
    [v21 setDeviceChangedHandler:v28];

    v22 = [(HMDDeviceSetupConfiguringController *)v11 client];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_25;
    v27[3] = &unk_264A2F3E8;
    v27[4] = v11;
    [v22 activateWithCompletion:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot create companion link client", buf, 0xCu);
    }
    [(HMDDeviceSetupConfiguringController *)v24 _setupRPClientAfter:120];
  }
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = WeakRetained;
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Queue setup after invalidation.", (uint8_t *)&v6, 0xCu);
  }
  [v3 _setupRPClientAfter:120];
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_19(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = WeakRetained;
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@RPClient was interrupted", (uint8_t *)&v6, 0xCu);
  }
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    dispatch_time_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Device Found from RPClient: %@", (uint8_t *)&v9, 0x16u);
  }
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    dispatch_time_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Device lost from RPClient: %@", (uint8_t *)&v9, 0x16u);
  }
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    dispatch_time_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@device changed from RPClient: %@", (uint8_t *)&v9, 0x16u);
  }
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error activating RPClient: '%@'", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) _setupRPClientAfter:120];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@RPClient activated successfully", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_shouldRegisterRequest
{
  v2 = [(HMDDeviceSetupConfiguringController *)self diagnosticInfoController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_registerRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDDeviceSetupConfiguringController *)self client];

  if (!v6)
  {
    uint64_t v16 = MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@RPClient is nil", buf, 0xCu);
    }
    v20 = (void *)v16;
    goto LABEL_12;
  }
  int v7 = [(HMDDeviceSetupConfiguringController *)self diagnosticInfoController];

  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  int v10 = HMFGetOSLogHandle();
  __int16 v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@DiagnosticInfoController is nil", buf, 0xCu);
    }
    v20 = v8;
LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = [(HMDDeviceSetupConfiguringController *)v9 client];
    uint64_t v14 = [v13 activeDevices];
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering request %@ with handler for active devices %@", buf, 0x20u);
  }
  __int16 v15 = [(HMDDeviceSetupConfiguringController *)v9 client];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__HMDDeviceSetupConfiguringController__registerRequest___block_invoke;
  v22[3] = &unk_264A22750;
  v22[4] = v9;
  [v15 registerRequestID:v4 options:0 handler:v22];

LABEL_13:
}

void __56__HMDDeviceSetupConfiguringController__registerRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v37[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x263F0CA08];
  __int16 v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v12 = objc_msgSend(v7, "hmf_arrayForKey:ofClasses:", v10, v11);
  id v13 = (void *)v12;
  uint64_t v14 = (void *)MEMORY[0x263EFFA68];
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  id v15 = v14;

  uint64_t v16 = [*(id *)(a1 + 32) diagnosticInfoController];
  uint64_t v17 = [v16 diagnosticInfoDataWithAdditionalKeys:v15];

  if (v17)
  {
    v36[0] = @"HMDDeviceSetupConfiguringControllerTimeStampKey";
    v18 = NSNumber;
    v19 = [MEMORY[0x263EFF910] date];
    [v19 timeIntervalSince1970];
    v20 = objc_msgSend(v18, "numberWithDouble:");
    v36[1] = *MEMORY[0x263F0C660];
    v37[0] = v20;
    v37[1] = v17;
    v21 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = @"com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID";
      __int16 v34 = 2112;
      id v35 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending response for %@ = %@", buf, 0x20u);
    }
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v21, 0, 0);
  }
  else
  {
    id v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = *(id *)(a1 + 32);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Diagnostic info data is nil", buf, 0xCu);
    }
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
  }
}

- (id)_activeDevicesWithMediaRouteIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDDeviceSetupConfiguringController *)self client];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Discovering RPCompanionLinkDevice matching identifier %@", buf, 0x16u);
    }
    uint64_t v12 = [(HMDDeviceSetupConfiguringController *)v8 client];
    id v13 = [v12 activeDevices];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke;
    v27[3] = &unk_264A22728;
    id v14 = v4;
    id v28 = v14;
    id v15 = objc_msgSend(v13, "na_filter:", v27);

    uint64_t v16 = [(HMDDeviceSetupConfiguringController *)v8 client];
    uint64_t v17 = [v16 activeDevices];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke_2;
    __int16 v25 = &unk_264A22728;
    id v26 = v14;
    v18 = objc_msgSend(v17, "na_filter:", &v22);
    v19 = objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v18, v22, v23, v24, v25);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@RPClient is nil", buf, 0xCu);
    }
    v19 = 0;
  }

  return v19;
}

unint64_t __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mediaRouteIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    if (([v3 statusFlags] & 2) != 0) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = ((unint64_t)[v3 statusFlags] >> 1) & 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

unint64_t __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mediaRouteIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    unint64_t v5 = ((unint64_t)[v3 statusFlags] >> 2) & 1;
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_tearDownCompanionLinkClient
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  unint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Tearing down the companion link client", (uint8_t *)&v8, 0xCu);
  }
  [(HMDDeviceSetupConfiguringController *)v5 setClient:0];
}

- (void)_queryWithRequestID:(id)a3 mediaRouteIdentifier:(id)a4 rpDevice:(id)a5 additionalKeys:(id)a6 withCompletion:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  dispatch_assert_queue_V2(v17);

  if (v14)
  {
    v18 = [(HMDDeviceSetupConfiguringController *)self rpCompanionLinkClientFactory];
    v19 = v18[2]();

    if (v19)
    {
      id v35 = v13;
      v20 = [(HMDDeviceSetupConfiguringController *)self workQueue];
      [v19 setDispatchQueue:v20];

      [v19 setDestinationDevice:v14];
      v21 = [MEMORY[0x263F08C38] UUID];
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v42 = v25;
        __int16 v43 = 2112;
        v44 = v21;
        __int16 v45 = 2112;
        id v46 = v12;
        __int16 v47 = 2112;
        id v48 = v14;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Send (messageRequestID %@) handlerID: %@ message to (device '%@')", buf, 0x2Au);
      }
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      void v36[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke;
      v36[3] = &unk_264A2B938;
      void v36[4] = v23;
      id v40 = v16;
      id v37 = v19;
      id v38 = v15;
      id v39 = v21;
      id v26 = v21;
      [v37 activateWithCompletion:v36];

      id v13 = v35;
    }
    else
    {
      __int16 v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = self;
      uint64_t v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v42 = v34;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot create a RPCompanionLinkClient", buf, 0xCu);
      }
      id v26 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
      (*((void (**)(id, void, id))v16 + 2))(v16, 0, v26);
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Device is nil", buf, 0xCu);
    }
    v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v19);
  }
}

void __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@There was an error activating: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 40) invalidate];
  }
  else
  {
    v18[0] = @"HMDDeviceSetupConfiguringControllerTimeStampKey";
    int v8 = NSNumber;
    id v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSince1970];
    uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
    v18[1] = *MEMORY[0x263F0CA08];
    v19[0] = v10;
    v19[1] = *(void *)(a1 + 48);
    __int16 v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v12 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_12;
    v13[3] = &unk_264A2DF50;
    id v14 = v12;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 56);
    [v14 sendRequestID:@"com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID" request:v11 options:0 responseHandler:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_12(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [a1[4] invalidate];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  __int16 v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained workQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_2;
    v15[3] = &unk_264A2DF78;
    id v16 = v9;
    id v17 = v11;
    id v18 = a1[5];
    id v21 = a1[6];
    id v19 = v7;
    id v20 = v8;
    dispatch_async(v12, v15);
  }
  else
  {
    id v13 = (void (**)(id, void, void *))a1[6];
    id v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v13[2](v13, 0, v14);
  }
}

uint64_t __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543874;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@(Request %@) failed with error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    int v15 = 138544130;
    id v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@(Request %@) sent; response: %@ / options: %@",
      (uint8_t *)&v15,
      0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_registerRequest:(id)a3 after:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [NSNumber numberWithLongLong:a4];
    *(_DWORD *)buf = 138543874;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Register requestID: %@ after %@ seconds", buf, 0x20u);
  }
  dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
  uint64_t v13 = [(HMDDeviceSetupConfiguringController *)v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDDeviceSetupConfiguringController__registerRequest_after___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v8;
  dispatch_after(v12, v13, block);
}

uint64_t __62__HMDDeviceSetupConfiguringController__registerRequest_after___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerRequest:@"com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID"];
}

- (void)registerRequestID
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(HMDDeviceSetupConfiguringController *)self _shouldRegisterRequest])
  {
    unint64_t v3 = [(HMDDeviceSetupConfiguringController *)self requestIDRegistrationDelay];
    [(HMDDeviceSetupConfiguringController *)self _registerRequest:@"com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID" after:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@No need to register request", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)queryConfiguringState:(id)a3 additionalKeys:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HMDDeviceSetupConfiguringController_queryConfiguringState_additionalKeys_withCompletion___block_invoke;
  v15[3] = &unk_264A2EE30;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __91__HMDDeviceSetupConfiguringController_queryConfiguringState_additionalKeys_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _activeDevicesWithMediaRouteIdentifier:*(void *)(a1 + 40)];
  unint64_t v3 = v2;
  if (v2 && !objc_msgSend(v2, "hmf_isEmpty"))
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v3;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Active destination devices: %@", (uint8_t *)&v17, 0x16u);
    }
    int v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v10 = [v3 firstObject];
    [v15 _queryWithRequestID:@"com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID" mediaRouteIdentifier:v16 rpDevice:v10 additionalKeys:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = *(void **)(a1 + 40);
      int v17 = 138543618;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@RPClient did not discover peer device for identifier: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

- (void)setupRPClient
{
  unint64_t v3 = [(HMDDeviceSetupConfiguringController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDDeviceSetupConfiguringController_setupRPClient__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__HMDDeviceSetupConfiguringController_setupRPClient__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupCompanionLinkClient];
}

- (HMDDeviceSetupConfiguringController)initWithQueue:(id)a3 rpCompanionLinkClientFactory:(id)a4 diagnosticInfoController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDDeviceSetupConfiguringController;
  id v12 = [(HMDDeviceSetupConfiguringController *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_diagnosticInfoController, a5);
    id v14 = _Block_copy(v10);
    id rpCompanionLinkClientFactory = v13->_rpCompanionLinkClientFactory;
    v13->_id rpCompanionLinkClientFactory = v14;

    v13->_requestIDRegistrationDelay = 3;
    v13->_restartRPClientDelay = 120;
  }

  return v13;
}

- (HMDDeviceSetupConfiguringController)initWithDiagnosticInfoControllerInternal:(id)a3
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("HMDDeviceSetupConfiguringController_Queue", v5);
  id v8 = [(HMDDeviceSetupConfiguringController *)self initWithQueue:v7 rpCompanionLinkClientFactory:&__block_literal_global_159009 diagnosticInfoController:v6];

  return v8;
}

id __80__HMDDeviceSetupConfiguringController_initWithDiagnosticInfoControllerInternal___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F62B70]);
  return v0;
}

- (HMDDeviceSetupConfiguringController)init
{
  return [(HMDDeviceSetupConfiguringController *)self initWithDiagnosticInfoControllerInternal:0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_159016 != -1) {
    dispatch_once(&logCategory__hmf_once_t29_159016, &__block_literal_global_27_159017);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v30_159018;
  return v2;
}

void __50__HMDDeviceSetupConfiguringController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v30_159018;
  logCategory__hmf_once_v30_159018 = v0;
}

@end