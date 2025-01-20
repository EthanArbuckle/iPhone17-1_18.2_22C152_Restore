@interface HMMTRSyncClusterColorControl
+ (id)logCategory;
- (id)logIdentifier;
- (id)readAttributePluginColorTemperatureMiredsWithParams:(id)a3;
- (void)moveToPluginColorTemperatureWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completionHandler:(id)a6;
@end

@implementation HMMTRSyncClusterColorControl

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1) {
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_167);
  }
  v2 = (void *)logCategory__hmf_once_v7;
  return v2;
}

uint64_t __43__HMMTRSyncClusterColorControl_logCategory__block_invoke()
{
  logCategory__hmf_once_v7 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRSyncClusterColorControl *)self endpointID];
  v4 = [v2 stringWithFormat:@"endPoint/%@", v3];

  return v4;
}

- (id)readAttributePluginColorTemperatureMiredsWithParams:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v6 = [(MTRClusterColorControl *)self readAttributeColorModeWithParams:v5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x263F10C30];
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 unsignedIntegerValue];
    if (v12 == 2)
    {
      v13 = [(MTRClusterColorControl *)self readAttributeColorTemperatureMiredsWithParams:v5];
      v14 = v13;
      if (v13)
      {
        v15 = [v13 objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v17 = v16;

        uint64_t v18 = [v17 unsignedIntegerValue];
        v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v18, *MEMORY[0x263F10C18], v8, *MEMORY[0x263F10C28]);
        v38[1] = v19;
        v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:2];
      }
      else
      {
        v32 = (void *)MEMORY[0x2533B64D0]();
        v33 = self;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v42 = v35;
          _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read color temperature", buf, 0xCu);
        }
        v20 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x2533B64D0]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [NSNumber numberWithUnsignedInteger:v12];
        v30 = [(HMMTRSyncClusterColorControl *)v26 endpointID];
        *(_DWORD *)buf = 138544130;
        v42 = v28;
        __int16 v43 = 2112;
        v44 = &unk_2702B4EC0;
        __int16 v45 = 2112;
        v46 = v29;
        __int16 v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@Returning color temp: %@ because colorMode: %@ on accessory endPoint: %@ is not color temp", buf, 0x2Au);
      }
      uint64_t v31 = *MEMORY[0x263F10C28];
      v39[0] = *MEMORY[0x263F10C18];
      v39[1] = v8;
      v40[0] = v31;
      v40[1] = &unk_2702B4EC0;
      v20 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x2533B64D0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read colorMode", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)moveToPluginColorTemperatureWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  v9 = (objc_class *)MEMORY[0x263F10D68];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  uint64_t v12 = [v10 colorTemperature];
  [v11 setColorTemperature:v12];

  v13 = [v10 transitionTime];

  [v11 setTransitionTime:v13];
  [v11 setOptionsMask:&unk_2702B4EA8];
  [v11 setOptionsOverride:&unk_2702B4EA8];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __126__HMMTRSyncClusterColorControl_moveToPluginColorTemperatureWithParams_expectedValues_expectedValueInterval_completionHandler___block_invoke;
  v16[3] = &unk_265377368;
  v16[4] = self;
  id v17 = v11;
  id v18 = v8;
  id v14 = v8;
  id v15 = v11;
  [(MTRClusterColorControl *)self moveToColorTemperatureWithParams:v15 expectedValues:0 expectedValueInterval:0 completionHandler:v16];
}

void __126__HMMTRSyncClusterColorControl_moveToPluginColorTemperatureWithParams_expectedValues_expectedValueInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) colorTemperature];
    v9 = [*(id *)(a1 + 40) optionsMask];
    int v10 = 138544130;
    id v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToPluginColorTemperatureWithParams colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end