@interface HMDCameraRecordingSessionNotificationTrigger
+ (id)logCategory;
- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4;
- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4 availabilityListener:(id)a5 notificationCenter:(id)a6;
- (HMDCameraRecordingSessionNotificationTriggerDelegate)delegate;
- (HMDCharacteristicsAvailabilityListener)availabilityListener;
- (HMDHAPAccessory)cameraAccessory;
- (NSNotificationCenter)notificationCenter;
- (NSSet)availableCharacteristics;
- (NSString)clientIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (void)_handleObservedCharacteristicsValueUpdate:(id)a3;
- (void)dealloc;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleCharacteristicsValueUpdated:(id)a3;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)setAvailableCharacteristics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation HMDCameraRecordingSessionNotificationTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_availabilityListener, 0);
  objc_destroyWeak((id *)&self->_cameraAccessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
}

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCharacteristicsAvailabilityListener)availabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHAPAccessory)cameraAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingSessionNotificationTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingSessionNotificationTriggerDelegate *)WeakRetained;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraRecordingSessionNotificationTrigger *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for characteristics: %@", (uint8_t *)&v17, 0x16u);
  }
  [(HMDCameraRecordingSessionNotificationTrigger *)v10 setAvailableCharacteristics:v7];
  v13 = [(HMDCameraRecordingSessionNotificationTrigger *)v10 cameraAccessory];
  v14 = [(HMDCameraRecordingSessionNotificationTrigger *)v10 availableCharacteristics];
  v15 = [v14 allObjects];
  v16 = [(HMDCameraRecordingSessionNotificationTrigger *)v10 clientIdentifier];
  [v13 enableNotification:1 forCharacteristics:v15 message:0 clientIdentifier:v16];

  if ([v13 isReachable]) {
    [(HMDCameraRecordingSessionNotificationTrigger *)v10 _handleObservedCharacteristicsValueUpdate:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)handleCharacteristicsValueUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingSessionNotificationTrigger *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__HMDCameraRecordingSessionNotificationTrigger_handleCharacteristicsValueUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __82__HMDCameraRecordingSessionNotificationTrigger_handleCharacteristicsValueUpdated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) _handleObservedCharacteristicsValueUpdate:v6];
    v5 = v6;
  }
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = [(HMDCameraRecordingSessionNotificationTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraRecordingSessionNotificationTrigger_handleAccessoryConfigured___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __74__HMDCameraRecordingSessionNotificationTrigger_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleObservedCharacteristicsValueUpdate:MEMORY[0x1E4F1CBF0]];
}

- (void)_handleObservedCharacteristicsValueUpdate:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSessionNotificationTrigger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v72 = [(HMDCameraRecordingSessionNotificationTrigger *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v66 = v4;
    if ([v4 count])
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      obuint64_t j = v4;
      uint64_t v6 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (!v6) {
        goto LABEL_31;
      }
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v76;
      uint64_t v68 = *MEMORY[0x1E4F2CF38];
      uint64_t v67 = *MEMORY[0x1E4F2CF08];
      uint64_t v70 = *(void *)v76;
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v76 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          v11 = [(HMDCameraRecordingSessionNotificationTrigger *)self availabilityListener];
          v12 = [v11 availableCharacteristics];
          int v13 = [v12 containsObject:v10];

          if (v13)
          {
            v14 = [v10 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v15 = v14;
            }
            else {
              v15 = 0;
            }
            id v16 = v15;

            if (v16)
            {
              int v17 = [v10 type];
              int v18 = [v17 isEqualToString:v68];

              if (v18)
              {
                uint64_t v19 = [v16 BOOLValue];
                id v20 = (void *)MEMORY[0x1D9452090]();
                uint64_t v21 = self;
                v22 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  v23 = HMFGetLogIdentifier();
                  v24 = HMFBooleanToString();
                  *(_DWORD *)buf = 138543618;
                  v85 = v23;
                  __int16 v86 = 2112;
                  id v87 = v24;
                  _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Motion characteristic isActive changed to %@", buf, 0x16u);
                }
                uint64_t v25 = 0;
LABEL_27:
                uint64_t v8 = v70;

                [v72 notificationTrigger:self didObserveTriggerType:v25 changeToActive:v19];
              }
              else
              {
                v33 = [v10 type];
                int v34 = [v33 isEqualToString:v67];

                id v20 = (void *)MEMORY[0x1D9452090]();
                v35 = self;
                v36 = HMFGetOSLogHandle();
                v22 = v36;
                if (v34)
                {
                  uint64_t v19 = 1;
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                  {
                    v37 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v85 = v37;
                    uint64_t v25 = 1;
                    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Doorbell event detected", buf, 0xCu);

                    uint64_t v19 = 1;
                  }
                  else
                  {
                    uint64_t v25 = 1;
                  }
                  goto LABEL_27;
                }
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v38 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v85 = v38;
                  __int16 v86 = 2112;
                  id v87 = v10;
                  _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unsupported characteristics type: %@", buf, 0x16u);
                }
                uint64_t v8 = v70;
              }
            }
            else
            {
              v26 = (void *)MEMORY[0x1D9452090]();
              v27 = self;
              v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v29 = HMFGetLogIdentifier();
                v30 = [v10 value];
                v31 = (objc_class *)objc_opt_class();
                v32 = NSStringFromClass(v31);
                *(_DWORD *)buf = 138543618;
                v85 = v29;
                __int16 v86 = 2112;
                id v87 = v32;
                _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Expected a number for characteristic value, was %@", buf, 0x16u);

                uint64_t v8 = v70;
              }
            }

            continue;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (!v7)
        {
LABEL_31:

          goto LABEL_55;
        }
      }
    }
    v43 = (void *)MEMORY[0x1D9452090]();
    v44 = self;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v85 = v46;
      _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@No changed characteristics provided, only evaluating motion detected for triggers", buf, 0xCu);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v47 = [(HMDCameraRecordingSessionNotificationTrigger *)v44 availabilityListener];
    v48 = [v47 availableCharacteristics];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v79 objects:v92 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v80;
      uint64_t v52 = *MEMORY[0x1E4F2CF38];
      v69 = v44;
      v71 = v48;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v80 != v51) {
            objc_enumerationMutation(v48);
          }
          v54 = *(void **)(*((void *)&v79 + 1) + 8 * j);
          v55 = [v54 type];
          int v56 = [v55 isEqualToString:v52];

          if (v56)
          {
            uint64_t v57 = v51;
            id v58 = [v54 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v59 = v58;
            }
            else {
              v59 = 0;
            }
            id v60 = v59;

            if (v60)
            {
              objc_msgSend(v72, "notificationTrigger:didObserveTriggerType:changeToActive:", v44, 0, objc_msgSend(v60, "BOOLValue"));
            }
            else
            {
              id obja = (id)MEMORY[0x1D9452090]();
              v61 = v44;
              v62 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                v63 = HMFGetLogIdentifier();
                v64 = objc_opt_class();
                *(_DWORD *)buf = 138544130;
                v85 = v63;
                __int16 v86 = 2112;
                id v87 = v58;
                __int16 v88 = 2112;
                v89 = v64;
                __int16 v90 = 2112;
                v91 = v54;
                id v65 = v64;
                _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Received unhandled value %@ of type %@ for characteristic: %@", buf, 0x2Au);

                v44 = v69;
              }

              v48 = v71;
            }

            uint64_t v51 = v57;
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v79 objects:v92 count:16];
      }
      while (v50);
    }

LABEL_55:
    id v4 = v66;
  }
  else
  {
    v39 = (void *)MEMORY[0x1D9452090]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v85 = v42;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@No delegate to notify", buf, 0xCu);
    }
  }
}

- (void)start
{
  v3 = [(HMDCameraRecordingSessionNotificationTrigger *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v8 = [(HMDCameraRecordingSessionNotificationTrigger *)self cameraAccessory];
  id v4 = [(HMDCameraRecordingSessionNotificationTrigger *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v8];

  v5 = [(HMDCameraRecordingSessionNotificationTrigger *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleCharacteristicsValueUpdated_ name:@"HMDNotificationCharacteristicValueUpdated" object:v8];

  uint64_t v6 = [(HMDCameraRecordingSessionNotificationTrigger *)self availabilityListener];
  [v6 setDelegate:self];

  uint64_t v7 = [(HMDCameraRecordingSessionNotificationTrigger *)self availabilityListener];
  [v7 start];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    clientIdentifier = v4->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = clientIdentifier;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording session notification trigger: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_cameraAccessory);
  v9 = [(NSSet *)v4->_availableCharacteristics allObjects];
  [WeakRetained enableNotification:0 forCharacteristics:v9 message:0 clientIdentifier:v4->_clientIdentifier];

  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraRecordingSessionNotificationTrigger;
  [(HMDCameraRecordingSessionNotificationTrigger *)&v10 dealloc];
}

- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4 availabilityListener:(id)a5 notificationCenter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraRecordingSessionNotificationTrigger;
  v14 = [(HMDCameraRecordingSessionNotificationTrigger *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [v10 hapAccessory];
    objc_storeWeak((id *)&v14->_cameraAccessory, v15);

    objc_storeStrong((id *)&v14->_workQueue, a4);
    objc_storeStrong((id *)&v14->_availabilityListener, a5);
    objc_storeStrong((id *)&v14->_notificationCenter, a6);
    id v16 = [v10 logIdentifier];
    uint64_t v17 = [v16 copy];
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CAD0] set];
    availableCharacteristics = v14->_availableCharacteristics;
    v14->_availableCharacteristics = (NSSet *)v19;

    uint64_t v21 = NSString;
    v22 = [MEMORY[0x1E4F29128] UUID];
    v23 = [v22 UUIDString];
    uint64_t v24 = [v21 stringWithFormat:@"%@.HMDCameraRecordingSessionNotificationTrigger.%@", @"com.apple.HomeKitDaemon.Local", v23];
    clientIdentifier = v14->_clientIdentifier;
    v14->_clientIdentifier = (NSString *)v24;
  }
  return v14;
}

- (HMDCameraRecordingSessionNotificationTrigger)initWithCamera:(id)a3 workQueue:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F2DE98];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = *MEMORY[0x1E4F2CF38];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v6 setWithObject:v7];
  v20[0] = v10;
  v19[1] = *MEMORY[0x1E4F2DE20];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF08]];
  v20[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  id v13 = [HMDCharacteristicsAvailabilityListener alloc];
  v14 = [v9 hapAccessory];
  uint64_t v15 = [(HMDCharacteristicsAvailabilityListener *)v13 initWithAccessory:v14 workQueue:v8 interestedCharacteristicTypesByServiceType:v12];

  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v17 = [(HMDCameraRecordingSessionNotificationTrigger *)self initWithCamera:v9 workQueue:v8 availabilityListener:v15 notificationCenter:v16];

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_166111 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_166111, &__block_literal_global_166112);
  }
  v2 = (void *)logCategory__hmf_once_v12_166113;
  return v2;
}

uint64_t __59__HMDCameraRecordingSessionNotificationTrigger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12_166113;
  logCategory__hmf_once_v12_166113 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end