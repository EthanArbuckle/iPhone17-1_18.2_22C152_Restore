@interface HMMTRSyncClusterThermostat
+ (id)logCategory;
- (id)readAttributeOccupiedHeatingOrCoolingSetpointWithParams:(id)a3;
- (id)readAttributePluginActiveWithParams:(id)a3;
- (id)readAttributePluginCurrentHeaterCoolerStateWithParams:(id)a3;
- (id)readAttributePluginCurrentHeatingCoolingStateWithParams:(id)a3;
- (id)readAttributePluginTargetHeaterCoolerStateWithParams:(id)a3;
- (void)updatedValueForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)updatedValuePluginActiveForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)updatedValuePluginCurrentHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)updatedValuePluginCurrentHeatingCoolingStateForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)updatedValuePluginTargetHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)writeAttributeOccupiedHeatingOrCoolingSetpointWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributePluginActiveWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributePluginTargetHeaterCoolerStateWithValue:(id)a3 expectedValueInterval:(id)a4;
@end

@implementation HMMTRSyncClusterThermostat

+ (id)logCategory
{
  if (logCategory__hmf_once_t90 != -1) {
    dispatch_once(&logCategory__hmf_once_t90, &__block_literal_global_5583);
  }
  v2 = (void *)logCategory__hmf_once_v91;
  return v2;
}

uint64_t __41__HMMTRSyncClusterThermostat_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v91;
  logCategory__hmf_once_v91 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)updatedValuePluginTargetHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = (void *)MEMORY[0x2533B64D0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = v24 = v6;
    v15 = [v10 endpoint];
    v16 = [v10 cluster];
    v17 = [v10 attribute];
    [v24 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    id v18 = v10;
    v20 = v19 = v11;
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to target heater cooler state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    id v10 = v18;

    id v6 = v24;
  }

  id v21 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v22 = [(HMMTRSyncClusterThermostat *)v12 readAttributePluginTargetHeaterCoolerStateWithParams:v21];

  if (v22)
  {
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    v7[2](v7, v23, 0);
  }
  else
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:15 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }
}

- (void)writeAttributePluginTargetHeaterCoolerStateWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F10C30];
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11) {
    _HMFPreconditionFailure();
  }
  if (!v7) {
    id v7 = &unk_2702B54F0;
  }
  uint64_t v12 = [v11 integerValue];
  if (v12 == 1) {
    v13 = &unk_2702B55E0;
  }
  else {
    v13 = &unk_2702B55C8;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
  [v14 setValue:v13 forKey:v8];
  v15 = (void *)MEMORY[0x2533B64D0]([(MTRClusterThermostat *)self writeAttributeSystemModeWithValue:v14 expectedValueInterval:v7]);
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    v19 = @"Cool";
    int v20 = 138543874;
    id v21 = v18;
    __int16 v22 = 2112;
    if (v12 == 1) {
      v19 = @"Heat";
    }
    v23 = v13;
    __int16 v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Write due to target heater cooler state (sync): Wrote to system mode attribute, value:%@ (%@)", (uint8_t *)&v20, 0x20u);
  }
}

- (id)readAttributePluginTargetHeaterCoolerStateWithParams:(id)a3
{
  v64[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v4];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = *MEMORY[0x263F10C30];
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      uint64_t v12 = *MEMORY[0x263F10C28];
      v63[0] = *MEMORY[0x263F10C18];
      v63[1] = v7;
      v64[0] = v12;
      v64[1] = &unk_2702B5598;
      v13 = NSDictionary;
      v14 = v64;
      v15 = v63;
LABEL_17:
      int v20 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:2];
      goto LABEL_18;
    }
    if (v11 == 6 || v11 == 3)
    {
      uint64_t v22 = *MEMORY[0x263F10C28];
      v61[0] = *MEMORY[0x263F10C18];
      v61[1] = v7;
      v62[0] = v22;
      v62[1] = &unk_2702B55F8;
      v13 = NSDictionary;
      v14 = v62;
      v15 = v61;
      goto LABEL_17;
    }
    __int16 v24 = [(MTRClusterThermostat *)self readAttributeControlSequenceOfOperationWithParams:v4];
    v25 = v24;
    if (!v24 || ![v24 count])
    {
      v34 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v35 = self;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v37;
        _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): An error occurred while trying to read the control sequence of operation", buf, 0xCu);
      }
      int v20 = 0;
      goto LABEL_40;
    }
    uint64_t v26 = [v25 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v27 = v26;
    }
    else {
      __int16 v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      unint64_t v29 = [v28 integerValue];
      if (v29 <= 5)
      {
        uint64_t v30 = *MEMORY[0x263F10C28];
        if (((1 << v29) & 0x33) != 0)
        {
          uint64_t v53 = *MEMORY[0x263F10C18];
          uint64_t v54 = v7;
          uint64_t v55 = v30;
          v56 = &unk_2702B55F8;
          __int16 v31 = NSDictionary;
          v32 = &v55;
          __int16 v33 = &v53;
        }
        else
        {
          uint64_t v49 = *MEMORY[0x263F10C18];
          uint64_t v50 = v7;
          uint64_t v51 = v30;
          v52 = &unk_2702B5598;
          __int16 v31 = NSDictionary;
          v32 = &v51;
          __int16 v33 = &v49;
        }
        int v20 = objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 2, v49, v50, v51, v52, v53, v54, v55, v56);
        goto LABEL_39;
      }
      uint64_t v45 = MEMORY[0x2533B64D0]();
      v46 = self;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v48;
        __int16 v59 = 2112;
        id v60 = v28;
        _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): Unsupported control sequence of operation value: %@", buf, 0x16u);
      }
      v44 = (void *)v45;
    }
    else
    {
      uint64_t v38 = MEMORY[0x2533B64D0]();
      v39 = self;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        v42 = [v25 objectForKeyedSubscript:v7];
        *(_DWORD *)buf = 138543618;
        v58 = v41;
        __int16 v59 = 2112;
        id v60 = (id)objc_opt_class();
        id v43 = v60;
        _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): Control sequence of operation was read with unexpected class type %@", buf, 0x16u);
      }
      v44 = (void *)v38;
    }
    int v20 = 0;
LABEL_39:

LABEL_40:
    goto LABEL_18;
  }
  v16 = (void *)MEMORY[0x2533B64D0]();
  v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v19;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): An error occurred while trying to read the system mode", buf, 0xCu);
  }
  int v20 = 0;
LABEL_18:

  return v20;
}

- (void)updatedValuePluginCurrentHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = __int16 v24 = v6;
    v15 = [v10 endpoint];
    v16 = [v10 cluster];
    v17 = [v10 attribute];
    [v24 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    id v18 = v10;
    int v20 = v19 = v11;
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    uint64_t v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heater cooler state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    uint64_t v11 = v19;
    id v10 = v18;

    id v6 = v24;
  }

  id v21 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v22 = [(HMMTRSyncClusterThermostat *)v12 readAttributePluginCurrentHeaterCoolerStateWithParams:v21];

  if (v22)
  {
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    v7[2](v7, v23, 0);
  }
  else
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:15 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }
}

- (id)readAttributePluginCurrentHeaterCoolerStateWithParams:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F10C30];
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v90 = v15;
      __int16 v91 = 2048;
      uint64_t v92 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got systemModeValue value: %ld", buf, 0x16u);
    }
    if (!v11)
    {
      uint64_t v46 = *MEMORY[0x263F10C28];
      v87[0] = *MEMORY[0x263F10C18];
      v87[1] = v7;
      v88[0] = v46;
      v88[1] = &unk_2702B5550;
      uint64_t v45 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
      goto LABEL_53;
    }
    v16 = [(MTRClusterThermostat *)v13 readAttributeLocalTemperatureWithParams:v4];
    v17 = v16;
    if (!v16)
    {
      v47 = (void *)MEMORY[0x2533B64D0]();
      v48 = v13;
      uint64_t v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v90 = v50;
        _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the local temperature", buf, 0xCu);
      }
      uint64_t v45 = 0;
      goto LABEL_52;
    }
    v76 = v16;
    id v18 = [v16 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    uint64_t v21 = [v20 integerValue];
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    v23 = v13;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v90 = v25;
      __int16 v91 = 2048;
      uint64_t v92 = v21;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got temperatureValue value: %ld", buf, 0x16u);
    }
    if (v11 == 4)
    {
      uint64_t v51 = [(MTRClusterThermostat *)v23 readAttributeOccupiedHeatingSetpointWithParams:v4];
      __int16 v27 = v51;
      if (!v51)
      {
        v71 = (void *)MEMORY[0x2533B64D0]();
        v72 = v23;
        v73 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v90 = v74;
          _os_log_impl(&dword_252495000, v73, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the occupied heating point", buf, 0xCu);
        }
        uint64_t v45 = 0;
        v17 = v76;
        goto LABEL_51;
      }
      v52 = [v51 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v53 = v52;
      }
      else {
        uint64_t v53 = 0;
      }
      id v54 = v53;

      uint64_t v55 = [v54 integerValue];
      v56 = (void *)MEMORY[0x2533B64D0]();
      v57 = v23;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v60 = __int16 v59 = v27;
        *(_DWORD *)buf = 138543618;
        v90 = v60;
        __int16 v91 = 2048;
        uint64_t v92 = v55;
        _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got heatPointValue value: %ld", buf, 0x16u);

        __int16 v27 = v59;
      }

      v17 = v76;
      uint64_t v61 = *MEMORY[0x263F10C28];
      if (v21 >= v55)
      {
        v79[0] = *MEMORY[0x263F10C18];
        v79[1] = v7;
        v80[0] = v61;
        v80[1] = &unk_2702B5550;
        uint64_t v38 = NSDictionary;
        v39 = v80;
        v40 = v79;
      }
      else
      {
        v81[0] = *MEMORY[0x263F10C18];
        v81[1] = v7;
        v82[0] = v61;
        v82[1] = &unk_2702B55F8;
        uint64_t v38 = NSDictionary;
        v39 = v82;
        v40 = v81;
      }
    }
    else
    {
      if (v11 != 3)
      {
        v62 = (void *)MEMORY[0x2533B64D0]();
        v63 = v23;
        v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v90 = v65;
          __int16 v91 = 2048;
          uint64_t v92 = v11;
          _os_log_impl(&dword_252495000, v64, OS_LOG_TYPE_INFO, "%{public}@Read current heater cooler state (sync): Unsupported system mode: %ld", buf, 0x16u);
        }
        uint64_t v66 = *MEMORY[0x263F10C28];
        v77[0] = *MEMORY[0x263F10C18];
        v77[1] = v7;
        v78[0] = v66;
        v78[1] = &unk_2702B5550;
        uint64_t v45 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
        v17 = v76;
        goto LABEL_52;
      }
      uint64_t v26 = [(MTRClusterThermostat *)v23 readAttributeOccupiedCoolingSetpointWithParams:v4];
      __int16 v27 = v26;
      if (!v26)
      {
        v67 = (void *)MEMORY[0x2533B64D0]();
        v68 = v23;
        v69 = HMFGetOSLogHandle();
        v17 = v76;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v70 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v90 = v70;
          _os_log_impl(&dword_252495000, v69, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the occupied cooling point", buf, 0xCu);
        }
        uint64_t v45 = 0;
        goto LABEL_51;
      }
      id v28 = [v26 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v29 = v28;
      }
      else {
        __int16 v29 = 0;
      }
      id v30 = v29;

      uint64_t v31 = [v30 integerValue];
      v32 = (void *)MEMORY[0x2533B64D0]();
      __int16 v33 = v23;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v36 = uint64_t v35 = v27;
        *(_DWORD *)buf = 138543618;
        v90 = v36;
        __int16 v91 = 2048;
        uint64_t v92 = v31;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got coolPointValue value: %ld", buf, 0x16u);

        __int16 v27 = v35;
      }

      v17 = v76;
      uint64_t v37 = *MEMORY[0x263F10C28];
      if (v21 <= v31)
      {
        v83[0] = *MEMORY[0x263F10C18];
        v83[1] = v7;
        v84[0] = v37;
        v84[1] = &unk_2702B5550;
        uint64_t v38 = NSDictionary;
        v39 = v84;
        v40 = v83;
      }
      else
      {
        v85[0] = *MEMORY[0x263F10C18];
        v85[1] = v7;
        v86[0] = v37;
        v86[1] = &unk_2702B5580;
        uint64_t v38 = NSDictionary;
        v39 = v86;
        v40 = v85;
      }
    }
    uint64_t v45 = [v38 dictionaryWithObjects:v39 forKeys:v40 count:2];
LABEL_51:

LABEL_52:
    goto LABEL_53;
  }
  v41 = (void *)MEMORY[0x2533B64D0]();
  v42 = self;
  id v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v90 = v44;
    _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the system mode", buf, 0xCu);
  }
  uint64_t v45 = 0;
LABEL_53:

  return v45;
}

- (void)updatedValuePluginActiveForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = __int16 v24 = v6;
    v15 = [v10 endpoint];
    v16 = [v10 cluster];
    v17 = [v10 attribute];
    [v24 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    id v18 = v10;
    id v20 = v19 = v11;
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to Active Char (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    uint64_t v11 = v19;
    id v10 = v18;

    id v6 = v24;
  }

  id v21 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v22 = [(HMMTRSyncClusterThermostat *)v12 readAttributePluginActiveWithParams:v21];

  if (v22)
  {
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    v7[2](v7, v23, 0);
  }
  else
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:15 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }
}

- (void)writeAttributePluginActiveWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v9 = [(MTRClusterThermostat *)self readAttributeControlSequenceOfOperationWithParams:v8];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F10C30];
    uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      id v41 = v8;
      unint64_t v15 = [v14 integerValue];
      id v16 = v6;
      v17 = [v6 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;

      if (v19)
      {
        if (!v7) {
          id v7 = &unk_2702B54F0;
        }
        if ([v19 integerValue])
        {
          id v6 = v16;
          if (v15 > 5)
          {
            id v20 = (void *)MEMORY[0x2533B64D0]();
            id v21 = self;
            uint64_t v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v43 = v23;
              __int16 v44 = 2112;
              id v45 = v14;
              __int16 v24 = "%{public}@Unsupported control sequence of operation value: %@";
              goto LABEL_32;
            }
LABEL_33:

            goto LABEL_34;
          }
          if (((1 << v15) & 0x32) != 0)
          {
            id v20 = (void *)MEMORY[0x2533B64D0]();
            id v21 = self;
            uint64_t v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v43 = v23;
              __int16 v44 = 2112;
              id v45 = v14;
              __int16 v24 = "%{public}@Setting active mode On not supported for control sequence of operation value: %@";
LABEL_32:
              _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

              goto LABEL_33;
            }
            goto LABEL_33;
          }
          if (((1 << v15) & 0xC) != 0) {
            uint64_t v35 = &unk_2702B55E0;
          }
          else {
            uint64_t v35 = &unk_2702B55C8;
          }
          __int16 v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v16];
          [v29 setValue:v35 forKey:v11];
          uint64_t v36 = MEMORY[0x2533B64D0]([(MTRClusterThermostat *)self writeAttributeSystemModeWithValue:v29 expectedValueInterval:v7]);
          uint64_t v37 = self;
          uint64_t v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v39 = uint64_t v40 = v36;
            *(_DWORD *)buf = 138543874;
            id v43 = v39;
            __int16 v44 = 2112;
            id v45 = v19;
            __int16 v46 = 2112;
            v47 = v35;
            _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (On), system mode:%@", buf, 0x20u);

            uint64_t v36 = v40;
          }

          v34 = (void *)v36;
        }
        else
        {
          __int16 v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v16];
          [v29 setValue:&unk_2702B55B0 forKey:v11];
          uint64_t v30 = MEMORY[0x2533B64D0]([(MTRClusterThermostat *)self writeAttributeSystemModeWithValue:v29 expectedValueInterval:v7]);
          __int16 v31 = self;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            __int16 v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v43 = v33;
            __int16 v44 = 2112;
            id v45 = v19;
            __int16 v46 = 2112;
            v47 = &unk_2702B55B0;
            _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (Off), error:%@", buf, 0x20u);
          }
          v34 = (void *)v30;
        }

        id v6 = v16;
LABEL_34:
        id v8 = v41;

        goto LABEL_35;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v25 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v26 = self;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    id v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v43 = v28;
    _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the control sequence of operation", buf, 0xCu);
  }
LABEL_35:
}

- (id)readAttributePluginActiveWithParams:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F10C30];
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    uint64_t v12 = *MEMORY[0x263F10C28];
    if (v11)
    {
      uint64_t v22 = *MEMORY[0x263F10C18];
      uint64_t v23 = v7;
      uint64_t v24 = v12;
      v25 = &unk_2702B5598;
      v13 = NSDictionary;
      id v14 = &v24;
      unint64_t v15 = &v22;
    }
    else
    {
      uint64_t v26 = *MEMORY[0x263F10C18];
      uint64_t v27 = v7;
      uint64_t v28 = v12;
      __int16 v29 = &unk_2702B5550;
      v13 = NSDictionary;
      id v14 = &v28;
      unint64_t v15 = &v26;
    }
    id v20 = objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2, v22, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v19;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Read Active Char (sync): An error occurred while trying to read the system mode", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)readAttributePluginCurrentHeatingCoolingStateWithParams:(id)a3
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F10C30];
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v148 = v15;
      __int16 v149 = 2048;
      uint64_t v150 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got systemModeValue value: %ld", buf, 0x16u);
    }
    if (!v11)
    {
      uint64_t v44 = *MEMORY[0x263F10C28];
      v145[0] = *MEMORY[0x263F10C18];
      v145[1] = v7;
      v146[0] = v44;
      v146[1] = &unk_2702B5550;
      v39 = [NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:2];
      goto LABEL_97;
    }
    id v16 = [(MTRClusterThermostat *)v13 readAttributeLocalTemperatureWithParams:v4];
    v17 = v16;
    if (!v16)
    {
      id v45 = (void *)MEMORY[0x2533B64D0]();
      __int16 v46 = v13;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v148 = v48;
        _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the local temperature", buf, 0xCu);
      }
      v39 = 0;
      goto LABEL_96;
    }
    id v18 = [v16 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    uint64_t v21 = [v20 integerValue];
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v23 = v13;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v148 = v25;
      __int16 v149 = 2048;
      uint64_t v150 = v21;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got temperatureValue value: %ld", buf, 0x16u);
    }
    switch(v11)
    {
      case 4:
        uint64_t v49 = [(MTRClusterThermostat *)v23 readAttributeOccupiedHeatingSetpointWithParams:v4];
        uint64_t v27 = v49;
        if (v49)
        {
          uint64_t v122 = v21;
          uint64_t v50 = [v49 objectForKeyedSubscript:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v51 = v50;
          }
          else {
            uint64_t v51 = 0;
          }
          id v52 = v51;

          uint64_t v53 = [v52 integerValue];
          id v54 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v55 = v23;
          v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v148 = v57;
            __int16 v149 = 2048;
            uint64_t v150 = v53;
            _os_log_impl(&dword_252495000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got heatPointValue value: %ld", buf, 0x16u);
          }
          uint64_t v58 = *MEMORY[0x263F10C28];
          if (v122 >= v53)
          {
            v127[0] = *MEMORY[0x263F10C18];
            v127[1] = v7;
            v128[0] = v58;
            v128[1] = &unk_2702B5550;
            __int16 v59 = NSDictionary;
            id v60 = v128;
            uint64_t v61 = v127;
          }
          else
          {
            v129[0] = *MEMORY[0x263F10C18];
            v129[1] = v7;
            v130[0] = v58;
            v130[1] = &unk_2702B5568;
            __int16 v59 = NSDictionary;
            id v60 = v130;
            uint64_t v61 = v129;
          }
          goto LABEL_80;
        }
        v77 = (void *)MEMORY[0x2533B64D0]();
        v78 = v23;
        v79 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v148 = v80;
          v81 = "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied heating point";
LABEL_54:
          _os_log_impl(&dword_252495000, v79, OS_LOG_TYPE_ERROR, v81, buf, 0xCu);
        }
        break;
      case 3:
        v62 = [(MTRClusterThermostat *)v23 readAttributeOccupiedCoolingSetpointWithParams:v4];
        uint64_t v27 = v62;
        if (v62)
        {
          v63 = [v62 objectForKeyedSubscript:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v64 = v63;
          }
          else {
            v64 = 0;
          }
          id v65 = v64;

          uint64_t v66 = [v65 integerValue];
          v67 = (void *)MEMORY[0x2533B64D0]();
          v68 = v23;
          v69 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v70 = uint64_t v123 = v21;
            *(_DWORD *)buf = 138543618;
            v148 = v70;
            __int16 v149 = 2048;
            uint64_t v150 = v66;
            _os_log_impl(&dword_252495000, v69, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got coolPointValue value: %ld", buf, 0x16u);

            uint64_t v21 = v123;
          }

          uint64_t v71 = *MEMORY[0x263F10C28];
          if (v21 <= v66)
          {
            v131[0] = *MEMORY[0x263F10C18];
            v131[1] = v7;
            v132[0] = v71;
            v132[1] = &unk_2702B5550;
            __int16 v59 = NSDictionary;
            id v60 = v132;
            uint64_t v61 = v131;
          }
          else
          {
            v133[0] = *MEMORY[0x263F10C18];
            v133[1] = v7;
            v134[0] = v71;
            v134[1] = &unk_2702B5580;
            __int16 v59 = NSDictionary;
            id v60 = v134;
            uint64_t v61 = v133;
          }
LABEL_80:
          v39 = [v59 dictionaryWithObjects:v60 forKeys:v61 count:2];
          goto LABEL_95;
        }
        v77 = (void *)MEMORY[0x2533B64D0]();
        v78 = v23;
        v79 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v148 = v80;
          v81 = "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied cooling point";
          goto LABEL_54;
        }
        break;
      case 1:
        uint64_t v26 = [(MTRClusterThermostat *)v23 readAttributeThermostatRunningModeWithParams:v4];
        uint64_t v27 = v26;
        if (v26)
        {
          uint64_t v28 = [v26 objectForKeyedSubscript:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v29 = v28;
          }
          else {
            __int16 v29 = 0;
          }
          id v30 = v29;

          uint64_t v31 = [v30 integerValue];
          uint64_t v32 = (void *)MEMORY[0x2533B64D0]();
          __int16 v33 = v23;
          v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v148 = v35;
            __int16 v149 = 2048;
            uint64_t v150 = v31;
            _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got runningModeValue value: %ld", buf, 0x16u);
          }
          uint64_t v36 = *MEMORY[0x263F10C18];
          uint64_t v37 = *MEMORY[0x263F10C28];
          v143[1] = v7;
          v144[0] = v37;
          v143[0] = v36;
          uint64_t v38 = [NSNumber numberWithInteger:v31];
          v144[1] = v38;
          v39 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:2];
        }
        else
        {
          v82 = (void *)MEMORY[0x2533B64D0]();
          v83 = v23;
          v84 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v85 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v148 = v85;
            _os_log_impl(&dword_252495000, v84, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state (sync): Couldn't get thermostat running mode from device. Ignoring error", buf, 0xCu);
          }
          v86 = [(MTRClusterThermostat *)v83 readAttributeOccupiedHeatingSetpointWithParams:v4];
          if (v86)
          {
            uint64_t v38 = v86;
            v87 = [v86 objectForKeyedSubscript:v7];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v88 = v87;
            }
            else {
              v88 = 0;
            }
            id v89 = v88;

            uint64_t v124 = [v89 integerValue];
            v90 = (void *)MEMORY[0x2533B64D0]();
            __int16 v91 = v83;
            uint64_t v92 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v93 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v148 = v93;
              __int16 v149 = 2048;
              uint64_t v150 = v124;
              _os_log_impl(&dword_252495000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got heatPointValue value: %ld", buf, 0x16u);

              uint64_t v27 = 0;
            }

            v94 = [(MTRClusterThermostat *)v91 readAttributeOccupiedCoolingSetpointWithParams:v4];
            v95 = v94;
            if (v94)
            {
              v121 = v94;
              v96 = [v94 objectForKeyedSubscript:v7];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v97 = v96;
              }
              else {
                v97 = 0;
              }
              id v98 = v97;

              uint64_t v99 = [v98 integerValue];
              v100 = (void *)MEMORY[0x2533B64D0]();
              v101 = v91;
              v102 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v103 = v120 = v100;
                *(_DWORD *)buf = 138543618;
                v148 = v103;
                __int16 v149 = 2048;
                uint64_t v150 = v99;
                _os_log_impl(&dword_252495000, v102, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got coolPointValue value: %ld", buf, 0x16u);

                v100 = v120;
              }

              uint64_t v104 = v124;
              if (v124 >= v99) {
                uint64_t v105 = v99;
              }
              else {
                uint64_t v105 = v124;
              }
              if (v124 <= v99) {
                uint64_t v104 = v99;
              }
              if (v21 <= v105 || v21 >= v104)
              {
                uint64_t v27 = 0;
                v95 = v121;
                uint64_t v115 = *MEMORY[0x263F10C28];
                if (v21 >= v124)
                {
                  if (v21 <= v99)
                  {
                    v135[0] = *MEMORY[0x263F10C18];
                    v135[1] = v7;
                    v136[0] = v115;
                    v136[1] = &unk_2702B5550;
                    v116 = NSDictionary;
                    v117 = v136;
                    v118 = v135;
                  }
                  else
                  {
                    v137[0] = *MEMORY[0x263F10C18];
                    v137[1] = v7;
                    v138[0] = v115;
                    v138[1] = &unk_2702B5580;
                    v116 = NSDictionary;
                    v117 = v138;
                    v118 = v137;
                  }
                }
                else
                {
                  v139[0] = *MEMORY[0x263F10C18];
                  v139[1] = v7;
                  v140[0] = v115;
                  v140[1] = &unk_2702B5568;
                  v116 = NSDictionary;
                  v117 = v140;
                  v118 = v139;
                }
                v39 = objc_msgSend(v116, "dictionaryWithObjects:forKeys:count:", v117, v118, 2, v120);
              }
              else
              {
                uint64_t v106 = *MEMORY[0x263F10C28];
                v141[0] = *MEMORY[0x263F10C18];
                v141[1] = v7;
                v142[0] = v106;
                v142[1] = &unk_2702B5550;
                v39 = [NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];
                v95 = v121;
                uint64_t v27 = 0;
              }
            }
            else
            {
              v111 = (void *)MEMORY[0x2533B64D0]();
              v112 = v91;
              v113 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v114 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v148 = v114;
                _os_log_impl(&dword_252495000, v113, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied cooling point", buf, 0xCu);

                uint64_t v27 = 0;
              }

              v39 = 0;
            }
          }
          else
          {
            v107 = (void *)MEMORY[0x2533B64D0]();
            v108 = v83;
            v109 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            {
              v110 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v148 = v110;
              _os_log_impl(&dword_252495000, v109, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied heating point", buf, 0xCu);
            }
            uint64_t v38 = 0;
            v39 = 0;
          }
        }

LABEL_95:
LABEL_96:

        goto LABEL_97;
      default:
        v72 = (void *)MEMORY[0x2533B64D0]();
        v73 = v23;
        v74 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v75 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v148 = v75;
          __int16 v149 = 2048;
          uint64_t v150 = v11;
          _os_log_impl(&dword_252495000, v74, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state (sync): Unsupported system mode: %ld", buf, 0x16u);
        }
        uint64_t v76 = *MEMORY[0x263F10C28];
        v125[0] = *MEMORY[0x263F10C18];
        v125[1] = v7;
        v126[0] = v76;
        v126[1] = &unk_2702B5550;
        v39 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];
        goto LABEL_96;
    }

    v39 = 0;
    goto LABEL_95;
  }
  uint64_t v40 = (void *)MEMORY[0x2533B64D0]();
  id v41 = self;
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    id v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v148 = v43;
    _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the system mode", buf, 0xCu);
  }
  v39 = 0;
LABEL_97:

  return v39;
}

- (void)updatedValuePluginCurrentHeatingCoolingStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = uint64_t v24 = v6;
    unint64_t v15 = [v10 endpoint];
    id v16 = [v10 cluster];
    v17 = [v10 attribute];
    [v24 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    id v18 = v10;
    id v20 = v19 = v11;
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heating/cooling state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    uint64_t v11 = v19;
    id v10 = v18;

    id v6 = v24;
  }

  id v21 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v22 = [(HMMTRSyncClusterThermostat *)v12 readAttributePluginCurrentHeatingCoolingStateWithParams:v21];

  if (v22)
  {
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    v7[2](v7, v23, 0);
  }
  else
  {
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:15 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }
}

- (void)updatedValueForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v50 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10BB8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v49 = v11;

  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  v13 = self;
  id v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  id v16 = (void *)MEMORY[0x263F10B90];
  if (v15)
  {
    v17 = HMFGetLogIdentifier();
    id v18 = [v9 endpoint];
    id v19 = [v9 cluster];
    id v20 = [v9 attribute];
    id v21 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    *(_DWORD *)buf = 138544386;
    id v52 = v17;
    __int16 v53 = 2112;
    id v54 = v18;
    __int16 v55 = 2112;
    v56 = v19;
    __int16 v57 = 2112;
    uint64_t v58 = v20;
    __int16 v59 = 2112;
    id v60 = v21;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@UpdateValueForAttributeReport (sync): Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    id v16 = (void *)MEMORY[0x263F10B90];
  }

  id v22 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v23 = [(MTRClusterThermostat *)v13 readAttributeSystemModeWithParams:v22];
  uint64_t v24 = v23;
  if (v23)
  {
    v25 = [v23 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    id v27 = v26;

    if (!v27) {
      _HMFPreconditionFailure();
    }
    uint64_t v28 = [v27 integerValue];
    __int16 v29 = [v6 objectForKeyedSubscript:*v16];
    if (v29) {
      id v30 = v6;
    }
    else {
      id v30 = 0;
    }
    id v31 = v30;

    if (v28 == 3)
    {
      uint64_t v32 = [v9 cluster];
      if ([v32 isEqualToNumber:&unk_2702B5508])
      {
        __int16 v46 = [v9 attribute];
        int v47 = [v46 isEqualToNumber:&unk_2702B5538];

        if (v47)
        {
          uint64_t v35 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v36 = v13;
          uint64_t v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v52 = v38;
            __int16 v53 = 2112;
            id v54 = v6;
            v39 = "%{public}@UpdateValueForAttributeReport (sync): Report OccupiedCoolingSetpoint %@";
            goto LABEL_30;
          }
LABEL_31:

          uint64_t v48 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v31];
          id v45 = v49;
          id v43 = v50;
          (*((void (**)(id, void *, id))v50 + 2))(v50, v48, v49);

LABEL_34:
          goto LABEL_35;
        }
LABEL_33:
        id v45 = v49;
        id v43 = v50;
        (*((void (**)(id, void, id))v50 + 2))(v50, 0, v49);
        goto LABEL_34;
      }
    }
    else
    {
      if (v28 != 4) {
        goto LABEL_33;
      }
      uint64_t v32 = [v9 cluster];
      if ([v32 isEqualToNumber:&unk_2702B5508])
      {
        __int16 v33 = [v9 attribute];
        int v34 = [v33 isEqualToNumber:&unk_2702B5520];

        if (v34)
        {
          uint64_t v35 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v36 = v13;
          uint64_t v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v52 = v38;
            __int16 v53 = 2112;
            id v54 = v6;
            v39 = "%{public}@UpdateValueForAttributeReport (sync): Report OccupiedHeatingSetpoint %@";
LABEL_30:
            _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_DEBUG, v39, buf, 0x16u);

            goto LABEL_31;
          }
          goto LABEL_31;
        }
        goto LABEL_33;
      }
    }

    goto LABEL_33;
  }
  uint64_t v40 = (void *)MEMORY[0x2533B64D0]();
  id v41 = v13;
  v42 = HMFGetOSLogHandle();
  id v43 = v50;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    uint64_t v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v52 = v44;
    _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@UpdateValueForAttributeReport (sync): An error occurred while trying to read the current System Mode", buf, 0xCu);
  }
  id v45 = v49;
LABEL_35:
}

- (id)readAttributeOccupiedHeatingOrCoolingSetpointWithParams:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (!v9) {
      _HMFPreconditionFailure();
    }
    uint64_t v10 = [v9 integerValue];
    if (v10 == 3)
    {
      uint64_t v12 = [(MTRClusterThermostat *)self readAttributeOccupiedCoolingSetpointWithParams:v4];
      v13 = (void *)MEMORY[0x2533B64D0]();
      id v22 = self;
      BOOL v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = HMFGetLogIdentifier();
        int v29 = 138543618;
        id v30 = v16;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): OccupiedCoolingSetpoint is %@";
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v11 = v10;
      if (v10 != 4)
      {
        uint64_t v23 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v24 = self;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          int v29 = 138543618;
          id v30 = v26;
          __int16 v31 = 2048;
          uint64_t v32 = v11;
          _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint should not be read in unexpected system mode: %ld", (uint8_t *)&v29, 0x16u);
        }
        uint64_t v12 = [(MTRClusterThermostat *)v24 readAttributeLocalTemperatureWithParams:v4];
        v13 = (void *)MEMORY[0x2533B64D0]();
        id v27 = v24;
        BOOL v15 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        id v16 = HMFGetLogIdentifier();
        int v29 = 138543618;
        id v30 = v16;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): Read local temperature %@";
        goto LABEL_19;
      }
      uint64_t v12 = [(MTRClusterThermostat *)self readAttributeOccupiedHeatingSetpointWithParams:v4];
      v13 = (void *)MEMORY[0x2533B64D0]();
      id v14 = self;
      BOOL v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = HMFGetLogIdentifier();
        int v29 = 138543618;
        id v30 = v16;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): OccupiedHeatingSetpoint is %@";
LABEL_19:
        _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v29, 0x16u);
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  id v18 = (void *)MEMORY[0x2533B64D0]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    int v29 = 138543362;
    id v30 = v21;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Read Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the current System Mode", (uint8_t *)&v29, 0xCu);
  }
  uint64_t v12 = 0;
LABEL_21:

  return v12;
}

- (void)writeAttributeOccupiedHeatingOrCoolingSetpointWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v9 = [(MTRClusterThermostat *)self readAttributeSystemModeWithParams:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F10C30];
    uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    v90 = v14;
    if (v14)
    {
      uint64_t v15 = [v14 integerValue];
      id v16 = [v6 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      id v89 = v18;
      if (v18)
      {
        if (!v7) {
          id v7 = &unk_2702B54F0;
        }
        if (v15)
        {
          if (v15 == 3)
          {
            __int16 v46 = [(MTRClusterThermostat *)self readAttributeAbsMinCoolSetpointLimitWithParams:v8];
            uint64_t v47 = [(MTRClusterThermostat *)self readAttributeAbsMaxCoolSetpointLimitWithParams:v8];
            id v21 = (void *)v47;
            v88 = v46;
            if (v46 && v47)
            {
              uint64_t v48 = [v46 objectForKeyedSubscript:v11];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v49 = v48;
              }
              else {
                id v49 = 0;
              }
              id v50 = v49;

              uint64_t v51 = v11;
              uint64_t v26 = v50;
              id v52 = [v21 objectForKeyedSubscript:v51];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                __int16 v53 = v52;
              }
              else {
                __int16 v53 = 0;
              }
              id v29 = v53;

              if (v26)
              {
                id v30 = v89;
                if (v29)
                {
                  uint64_t v54 = [v89 integerValue];
                  id v83 = v29;
                  if (v54 >= [v26 integerValue])
                  {
                    id v85 = v6;
                    uint64_t v33 = v88;
                  }
                  else
                  {
                    __int16 v55 = v26;
                    uint64_t v33 = v88;
                    id v85 = v88;

                    context = (void *)MEMORY[0x2533B64D0]();
                    v56 = self;
                    __int16 v57 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v58 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      uint64_t v92 = v58;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v85;
                      _os_log_impl(&dword_252495000, v57, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target cool temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

                      uint64_t v33 = v88;
                    }

                    uint64_t v26 = v55;
                    id v29 = v83;
                  }
                  uint64_t v74 = objc_msgSend(v89, "integerValue", context);
                  if (v74 <= [v29 integerValue])
                  {
                    id v6 = v85;
                  }
                  else
                  {
                    v75 = v26;
                    contextb = v21;
                    id v6 = v21;

                    v87 = (void *)MEMORY[0x2533B64D0]();
                    uint64_t v76 = self;
                    v77 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                    {
                      v78 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      uint64_t v92 = v78;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v6;
                      _os_log_impl(&dword_252495000, v77, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target cool temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

                      uint64_t v33 = v88;
                    }

                    uint64_t v26 = v75;
                    id v21 = contextb;
                    id v29 = v83;
                  }
                  -[MTRClusterThermostat writeAttributeOccupiedCoolingSetpointWithValue:expectedValueInterval:](self, "writeAttributeOccupiedCoolingSetpointWithValue:expectedValueInterval:", v6, v7, contextb);
                  goto LABEL_73;
                }
LABEL_82:
                _HMFPreconditionFailure();
              }
LABEL_81:
              _HMFPreconditionFailure();
              goto LABEL_82;
            }
            v63 = (void *)v47;
            v64 = (void *)MEMORY[0x2533B64D0]();
            id v65 = self;
            uint64_t v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              v67 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v92 = v67;
              v68 = "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the"
                    " min/max cool setpoints";
              goto LABEL_57;
            }
LABEL_58:

            uint64_t v33 = v88;
            id v30 = v89;
            id v21 = v63;
LABEL_74:

            goto LABEL_75;
          }
          if (v15 == 4)
          {
            id v19 = [(MTRClusterThermostat *)self readAttributeAbsMinHeatSetpointLimitWithParams:v8];
            uint64_t v20 = [(MTRClusterThermostat *)self readAttributeAbsMaxHeatSetpointLimitWithParams:v8];
            id v21 = (void *)v20;
            v88 = v19;
            if (v19 && v20)
            {
              id v22 = [v19 objectForKeyedSubscript:v11];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v23 = v22;
              }
              else {
                uint64_t v23 = 0;
              }
              id v24 = v23;

              uint64_t v25 = v11;
              uint64_t v26 = v24;
              id v27 = [v21 objectForKeyedSubscript:v25];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v28 = v27;
              }
              else {
                uint64_t v28 = 0;
              }
              id v29 = v28;

              if (v26)
              {
                id v30 = v89;
                if (v29)
                {
                  uint64_t v31 = [v89 integerValue];
                  id v82 = v29;
                  if (v31 >= [v26 integerValue])
                  {
                    id v84 = v6;
                    uint64_t v33 = v88;
                  }
                  else
                  {
                    uint64_t v32 = v26;
                    uint64_t v33 = v88;
                    id v84 = v88;

                    context = (void *)MEMORY[0x2533B64D0]();
                    int v34 = self;
                    uint64_t v35 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v36 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      uint64_t v92 = v36;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v84;
                      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target heat temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

                      uint64_t v33 = v88;
                    }

                    uint64_t v26 = v32;
                    id v29 = v82;
                  }
                  uint64_t v69 = objc_msgSend(v89, "integerValue", context);
                  if (v69 <= [v29 integerValue])
                  {
                    id v6 = v84;
                  }
                  else
                  {
                    v70 = v26;
                    contexta = v21;
                    id v6 = v21;

                    v86 = (void *)MEMORY[0x2533B64D0]();
                    uint64_t v71 = self;
                    v72 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                    {
                      v73 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      uint64_t v92 = v73;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v6;
                      _os_log_impl(&dword_252495000, v72, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target heat temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

                      uint64_t v33 = v88;
                    }

                    uint64_t v26 = v70;
                    id v21 = contexta;
                    id v29 = v82;
                  }
                  -[MTRClusterThermostat writeAttributeOccupiedHeatingSetpointWithValue:expectedValueInterval:](self, "writeAttributeOccupiedHeatingSetpointWithValue:expectedValueInterval:", v6, v7, contexta);
LABEL_73:

                  goto LABEL_74;
                }
                goto LABEL_80;
              }
LABEL_79:
              _HMFPreconditionFailure();
LABEL_80:
              _HMFPreconditionFailure();
              goto LABEL_81;
            }
            v63 = (void *)v20;
            v64 = (void *)MEMORY[0x2533B64D0]();
            id v65 = self;
            uint64_t v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              v67 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v92 = v67;
              v68 = "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the"
                    " min/max heat setpoints";
LABEL_57:
              _os_log_impl(&dword_252495000, v66, OS_LOG_TYPE_ERROR, v68, buf, 0xCu);

              goto LABEL_58;
            }
            goto LABEL_58;
          }
          uint64_t v59 = MEMORY[0x2533B64D0]();
          id v60 = self;
          uint64_t v61 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v92 = v62;
            __int16 v93 = 2048;
            uint64_t v94 = v15;
            _os_log_impl(&dword_252495000, v61, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint cannot be set in unexpected system mode: %ld", buf, 0x16u);
          }
          id v45 = (void *)v59;
        }
        else
        {
          uint64_t v41 = MEMORY[0x2533B64D0]();
          v42 = self;
          id v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v92 = v44;
            _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint cannot be set when system is off", buf, 0xCu);
          }
          id v45 = (void *)v41;
        }
        id v30 = v89;
LABEL_75:

        goto LABEL_76;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_79;
  }
  uint64_t v37 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v38 = self;
  v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v92 = v40;
    _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the current System Mode", buf, 0xCu);
  }
LABEL_76:
}

@end