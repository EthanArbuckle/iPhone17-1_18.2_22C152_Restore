@interface HMDPowerLogObserver
+ (id)supportedEventClasses;
- (HMDPowerLogObserver)initWithContext:(id)a3;
- (HMDPowerLogObserver)initWithLogEventDispatcher:(id)a3;
- (HMDPowerLogObserverContext)context;
- (void)_reportCameraSettingsConfiguration:(id)a3;
- (void)_reportConfiguration:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)setContext:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDPowerLogObserver

- (void).cxx_destruct
{
}

- (void)setContext:(id)a3
{
}

- (HMDPowerLogObserverContext)context
{
  return self->_context;
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMDPowerLogObserver *)v4 context];
  v8 = [v7 logEventDispatcher];
  [v8 removeObserver:v4];
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(HMDPowerLogObserver *)v4 context];
  v8 = [v7 logEventDispatcher];
  int v9 = [(id)objc_opt_class() supportedEventClasses];
  [v8 addObserver:v4 forEventClasses:v9];
}

- (void)_reportCameraSettingsConfiguration:(id)a3
{
  v39 = self;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v40 = [MEMORY[0x1E4F1CA60] dictionary];
  v41 = v3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v3 homeSettingsConfigurations];
  uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (v44)
  {
    uint64_t v46 = 0;
    uint64_t v43 = *(void *)v52;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v9;
        int v10 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v11 = objc_msgSend(v10, "cameraSettings", v39);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v8 += [v16 isRecordingEnabled];
              v4 += [v16 smartBulletinBoardNotificationEnabled];
              v5 += [v16 reachabilityNotificationEnabled];
              v6 += [v16 recordingEventTriggers] & 1;
              if ((unint64_t)[v16 recordingEventTriggers] > 1) {
                ++v7;
              }
            }
            v46 += v13;
            uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v13);
        }

        uint64_t v9 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v44);
  }
  else
  {
    uint64_t v46 = 0;
  }

  [v40 setObject:@"HomeKit Camera Configuration" forKeyedSubscript:*MEMORY[0x1E4F64F18]];
  v17 = [(HMDPowerLogObserver *)v39 context];
  v18 = [v17 cameraConfigurationEventHistogram];
  v19 = [v18 intervalIndexForValue:v46];
  [v40 setObject:v19 forKeyedSubscript:@"numCameras"];

  v20 = [(HMDPowerLogObserver *)v39 context];
  v21 = [v20 cameraConfigurationEventHistogram];
  v22 = [v21 intervalIndexForValue:v8];
  [v40 setObject:v22 forKeyedSubscript:@"numCamerasRecordingEnabled"];

  v23 = [(HMDPowerLogObserver *)v39 context];
  v24 = [v23 cameraConfigurationEventHistogram];
  v25 = [v24 intervalIndexForValue:v4];
  [v40 setObject:v25 forKeyedSubscript:@"numCamerasSmartBulletinNotificationEnabled"];

  v26 = [(HMDPowerLogObserver *)v39 context];
  v27 = [v26 cameraConfigurationEventHistogram];
  v28 = [v27 intervalIndexForValue:v5];
  [v40 setObject:v28 forKeyedSubscript:@"numCamerasReachabilityNotificationEnabled"];

  v29 = [(HMDPowerLogObserver *)v39 context];
  v30 = [v29 cameraConfigurationEventHistogram];
  v31 = [v30 intervalIndexForValue:v6];
  [v40 setObject:v31 forKeyedSubscript:@"numCamerasAnyMotionEventEnabled"];

  v32 = [(HMDPowerLogObserver *)v39 context];
  v33 = [v32 cameraConfigurationEventHistogram];
  v34 = [v33 intervalIndexForValue:v7];
  [v40 setObject:v34 forKeyedSubscript:@"numCamerasHSVMotionEventEnabled"];

  v35 = [(HMDPowerLogObserver *)v39 context];
  v36 = [v35 powerLogger];
  uint64_t v37 = *MEMORY[0x1E4F64F20];
  v38 = (void *)[v40 copy];
  [v36 reportToPowerLogDestinationTable:v37 withEventDictionary:v38];
}

- (void)_reportConfiguration:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v29 = [v4 dictionary];
  [v29 setObject:@"HomeKit Home Configuration" forKeyedSubscript:*MEMORY[0x1E4F64F18]];
  uint64_t v6 = [(HMDPowerLogObserver *)self context];
  uint64_t v7 = [v6 homeConfigurationEventHistogram];
  uint64_t v8 = objc_msgSend(v7, "intervalIndexForValue:", objc_msgSend(v5, "totalHomes"));
  [v29 setObject:v8 forKeyedSubscript:@"numHomes"];

  uint64_t v9 = [(HMDPowerLogObserver *)self context];
  int v10 = [v9 homeConfigurationEventHistogram];
  uint64_t v11 = objc_msgSend(v10, "intervalIndexForValue:", objc_msgSend(v5, "totalNonEmptyHomes"));
  [v29 setObject:v11 forKeyedSubscript:@"numNonEmptyHomes"];

  uint64_t v12 = [(HMDPowerLogObserver *)self context];
  uint64_t v13 = [v12 homeConfigurationEventHistogram];
  uint64_t v14 = objc_msgSend(v13, "intervalIndexForValue:", objc_msgSend(v5, "totalUsers"));
  [v29 setObject:v14 forKeyedSubscript:@"numUsers"];

  v15 = [(HMDPowerLogObserver *)self context];
  v16 = [v15 homeConfigurationEventHistogram];
  v17 = objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v5, "totalHAPAccessories"));
  [v29 setObject:v17 forKeyedSubscript:@"numHAPAccessories"];

  v18 = [(HMDPowerLogObserver *)self context];
  v19 = [v18 homeConfigurationEventHistogram];
  v20 = objc_msgSend(v19, "intervalIndexForValue:", objc_msgSend(v5, "totalEnabledResidents"));
  [v29 setObject:v20 forKeyedSubscript:@"numEnabledResidents"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isResidentEnabled"));
  [v29 setObject:v21 forKeyedSubscript:@"isCurrentDeviceResidentEnabled"];

  v22 = NSNumber;
  uint64_t v23 = [v5 isPrimaryResidentForSomeHome];

  v24 = [v22 numberWithBool:v23];
  [v29 setObject:v24 forKeyedSubscript:@"isCurrentDevicePrimaryResident"];

  [v29 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isCurrentDeviceHH2Enabled"];
  v25 = [(HMDPowerLogObserver *)self context];
  v26 = [v25 powerLogger];
  uint64_t v27 = *MEMORY[0x1E4F64F28];
  v28 = (void *)[v29 copy];
  [v26 reportToPowerLogDestinationTable:v27 withEventDictionary:v28];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v9;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDPowerLogObserver *)self _reportConfiguration:v5];
  }
  else
  {
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (!v8) {
      goto LABEL_12;
    }
    [(HMDPowerLogObserver *)self _reportCameraSettingsConfiguration:v8];
  }

LABEL_12:
}

- (HMDPowerLogObserver)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPowerLogObserver;
  id v6 = [(HMDPowerLogObserver *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (HMDPowerLogObserver)initWithLogEventDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = [HMDPowerLogObserverContext alloc];
  id v6 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  uint64_t v7 = [(HMDPowerLogObserverContext *)v5 initWithLogEventDispatcher:v4 powerLogger:v6];

  id v8 = [(HMDPowerLogObserver *)self initWithContext:v7];
  return v8;
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken != -1) {
    dispatch_once(&supportedEventClasses_onceToken, &__block_literal_global_29419);
  }
  v2 = (void *)supportedEventClasses_supportedEventClasses;
  return v2;
}

void __44__HMDPowerLogObserver_supportedEventClasses__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)supportedEventClasses_supportedEventClasses;
  supportedEventClasses_supportedEventClasses = v0;
}

@end