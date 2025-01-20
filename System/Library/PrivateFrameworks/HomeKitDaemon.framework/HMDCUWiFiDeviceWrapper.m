@interface HMDCUWiFiDeviceWrapper
+ (id)logCategory;
- (BOOL)isConfigured;
- (BOOL)supportsAirPlay2;
- (HMDCUWiFiDeviceWrapper)initWithCUWiFiDevice:(id)a3 dispatchQueue:(id)a4;
- (NSString)description;
- (NSString)deviceID;
- (NSString)name;
- (NSString)ssid;
- (NSUUID)identifier;
- (id)underlyingDevice;
- (void)cancelConfigurationWithCompletionHandler:(id)a3;
- (void)startConfigurationWithCompletionHandler:(id)a3;
@end

@implementation HMDCUWiFiDeviceWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deviceID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wacSession, 0);
  objc_storeStrong((id *)&self->_cuWiFiDevice, 0);
}

- (NSString)deviceID
{
  return self->deviceID;
}

- (NSString)description
{
  v3 = [(HMDCUWiFiDeviceWrapper *)self identifier];
  v4 = [(HMDCUWiFiDeviceWrapper *)self ssid];
  v5 = [(HMDCUWiFiDeviceWrapper *)self name];
  v9 = [(HMDCUWiFiDeviceWrapper *)self deviceID];
  NSAppendPrintF();
  id v6 = 0;

  [(CUWiFiDevice *)self->_cuWiFiDevice deviceIEFlags];
  NSAppendPrintF();
  id v7 = v6;

  return (NSString *)v7;
}

- (void)cancelConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDCUWiFiDeviceWrapper_cancelConfigurationWithCompletionHandler___block_invoke;
  block[3] = &unk_264A21B18;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__HMDCUWiFiDeviceWrapper_cancelConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained[2] invalidate];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_wacSession)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@WACSession already active for device", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    id v9 = (CUWACSession *)objc_alloc_init(MEMORY[0x263F385F8]);
    wacSession = self->_wacSession;
    self->_wacSession = v9;

    [(CUWACSession *)self->_wacSession setWacDevice:self->_cuWiFiDevice];
    v11 = [(HMDCUWiFiDeviceWrapper *)self name];
    [(CUWACSession *)self->_wacSession setLabel:v11];

    [(CUWACSession *)self->_wacSession setDispatchQueue:self->_dispatchQueue];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__133715;
    v23 = __Block_byref_object_dispose__133716;
    id v24 = 0;
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke;
    v15 = &unk_264A20BE8;
    objc_copyWeak(&v18, &location);
    p_long long buf = &buf;
    id v16 = v4;
    [(CUWACSession *)self->_wacSession setProgressHandler:&v12];
    [(CUWACSession *)self->_wacSession activate];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
}

void __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_67;
  }
  if (a2 != 20)
  {
    if (a2 == 200)
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = WeakRetained;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v35 = (uint64_t)v26;
        v27 = "%{public}@WAC setup successful";
        v28 = v25;
        uint32_t v29 = 12;
LABEL_65:
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else
    {
      if (a2 == 30)
      {
        uint64_t v8 = [v5 objectForKeyedSubscript:@"eo"];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        v11 = (void *)MEMORY[0x230FBD990]();
        uint64_t v12 = (id *)WeakRetained;
        uint64_t v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = HMFGetLogIdentifier();
          v15 = *(const char **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v35 = (uint64_t)v14;
          __int16 v36 = 2112;
          v37 = v15;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@WAC setup failed: %@", buf, 0x16u);
        }
        uint64_t v16 = *(void *)(a1 + 32);
        if (v16) {
          (*(void (**)(uint64_t, void))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        }
        [v12[2] invalidate];
        goto LABEL_67;
      }
      v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = WeakRetained;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        v26 = (void *)v30;
        if (a2 > 109)
        {
          if (a2 > 159)
          {
            if (a2 <= 179)
            {
              if (a2 == 160)
              {
                v31 = "PostConfigStart";
                goto LABEL_64;
              }
              if (a2 == 170)
              {
                v31 = "FoundPostConfig";
                goto LABEL_64;
              }
            }
            else
            {
              if (a2 == 180)
              {
                v31 = "CheckingPostConfig";
                goto LABEL_64;
              }
              if (a2 == 190)
              {
                v31 = "CheckedPostConfig";
                goto LABEL_64;
              }
            }
          }
          else if (a2 <= 129)
          {
            if (a2 == 110)
            {
              v31 = "ApplyingConfig";
              goto LABEL_64;
            }
            if (a2 == 120)
            {
              v31 = "AppliedConfig";
              goto LABEL_64;
            }
          }
          else
          {
            switch(a2)
            {
              case 130:
                v31 = "RestoringOriginalWiFi";
                goto LABEL_64;
              case 140:
                v31 = "RestoredOriginalWiFi";
                goto LABEL_64;
              case 150:
                v31 = "SearchingPostConfig";
                goto LABEL_64;
            }
          }
        }
        else if (a2 > 59)
        {
          if (a2 <= 79)
          {
            if (a2 == 60)
            {
              v31 = "PreConfigStart";
              goto LABEL_64;
            }
            if (a2 == 70)
            {
              v31 = "SearchingPreConfig";
              goto LABEL_64;
            }
          }
          else
          {
            switch(a2)
            {
              case 'P':
                v31 = "FoundPreConfig";
                goto LABEL_64;
              case 'Z':
                v31 = "Authenticating";
                goto LABEL_64;
              case 'd':
                v31 = "Authenticated";
                goto LABEL_64;
            }
          }
        }
        else if (a2 <= 29)
        {
          if (!a2)
          {
            v31 = "Invalid";
            goto LABEL_64;
          }
          if (a2 == 10)
          {
            v31 = "Start";
            goto LABEL_64;
          }
        }
        else
        {
          if (a2 == 40)
          {
            v31 = "JoiningSoftAP";
            goto LABEL_64;
          }
          if (a2 == 50)
          {
            v31 = "JoinedSoftAP";
LABEL_64:
            *(_DWORD *)long long buf = 138543874;
            uint64_t v35 = v30;
            __int16 v36 = 2080;
            v37 = v31;
            __int16 v38 = 2112;
            id v39 = v5;
            v27 = "%{public}@CUWACSession progress %s: %@";
            v28 = v25;
            uint32_t v29 = 32;
            goto LABEL_65;
          }
        }
        v31 = "?";
        goto LABEL_64;
      }
    }

    goto LABEL_67;
  }
  v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = WeakRetained;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v35 = (uint64_t)v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@WAC setup finalized, calling completion", buf, 0xCu);
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
  [*((id *)v18 + 2) invalidate];
  v22 = *((void *)v18 + 3);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke_90;
  block[3] = &unk_264A2C170;
  objc_copyWeak(&v33, v6);
  dispatch_async(v22, block);
  objc_destroyWeak(&v33);
LABEL_67:
}

void __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke_90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (id)underlyingDevice
{
  return self->_cuWiFiDevice;
}

- (BOOL)supportsAirPlay2
{
  return ([(CUWiFiDevice *)self->_cuWiFiDevice deviceIEFlags] >> 12) & 1;
}

- (BOOL)isConfigured
{
  return ([(CUWiFiDevice *)self->_cuWiFiDevice deviceIEFlags] & 0x40000000) == 0;
}

- (NSString)name
{
  v3 = [(CUWiFiDevice *)self->_cuWiFiDevice deviceIEName];
  cuWiFiDevice = self->_cuWiFiDevice;
  if (v3) {
    [(CUWiFiDevice *)cuWiFiDevice deviceIEName];
  }
  else {
  id v5 = [(CUWiFiDevice *)cuWiFiDevice ssid];
  }

  return (NSString *)v5;
}

- (NSString)ssid
{
  return (NSString *)[(CUWiFiDevice *)self->_cuWiFiDevice ssid];
}

- (NSUUID)identifier
{
  return (NSUUID *)[(CUWiFiDevice *)self->_cuWiFiDevice identifier];
}

- (HMDCUWiFiDeviceWrapper)initWithCUWiFiDevice:(id)a3 dispatchQueue:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCUWiFiDeviceWrapper;
  uint64_t v9 = [(HMDCUWiFiDeviceWrapper *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cuWiFiDevice, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
    id v11 = [v7 deviceIEDeviceID];
    [v11 bytes];
    [v11 length];
    HardwareAddressToCString();
    uint64_t v12 = [NSString stringWithCString:v16 encoding:4];
    deviceID = v10->deviceID;
    v10->deviceID = (NSString *)v12;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_133751 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_133751, &__block_literal_global_96);
  }
  v2 = (void *)logCategory__hmf_once_v19_133752;
  return v2;
}

void __37__HMDCUWiFiDeviceWrapper_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v19_133752;
  logCategory__hmf_once_v19_133752 = v0;
}

@end