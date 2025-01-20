@interface HMMTRSyncClusterFanControl
+ (id)logCategory;
- (id)readAttributePluginFanModeWithParams:(id)a3;
- (id)readAttributePluginRockSettingWithParams:(id)a3;
- (void)updatedValuePluginFanModeForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)updatedValuePluginRockSettingForAttributeReport:(id)a3 responseHandler:(id)a4;
- (void)writeAttributePluginFanModeWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributePluginRockSettingWithValue:(id)a3 expectedValueInterval:(id)a4;
@end

@implementation HMMTRSyncClusterFanControl

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1) {
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global_10139);
  }
  v2 = (void *)logCategory__hmf_once_v30;
  return v2;
}

uint64_t __41__HMMTRSyncClusterFanControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)updatedValuePluginFanModeForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10BB8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = (void *)MEMORY[0x2533B64D0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = id v76 = v13;
    [v10 endpoint];
    v18 = v73 = v7;
    [v10 cluster];
    v19 = v70 = v15;
    v20 = [v10 attribute];
    uint64_t v21 = *MEMORY[0x263F10B90];
    v22 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    *(_DWORD *)buf = 138544386;
    v80 = v17;
    __int16 v81 = 2112;
    v82 = v18;
    __int16 v83 = 2112;
    v84 = v19;
    __int16 v85 = 2112;
    v86 = v20;
    __int16 v87 = 2112;
    v88 = v22;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v15 = v70;
    v7 = v73;

    id v13 = v76;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x263F10B90];
  }

  v23 = [v6 objectForKeyedSubscript:v21];
  if (v23) {
    v24 = v6;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  v26 = [v10 cluster];
  char v27 = [v26 isEqualToNumber:&unk_2702B6018];

  if (v27)
  {
    v28 = [v10 attribute];
    int v29 = [v28 isEqualToNumber:&unk_2702B60A8];

    if (v29)
    {
      id v30 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v25];
      id v31 = v30;
      if (v30)
      {
        if (![v30 isEqualToNumber:&unk_2702B6048])
        {
          int v51 = [v31 unsignedIntValue];
          if ((v51 - 1) >= 3)
          {
            if (v51)
            {
              v66 = [MEMORY[0x263F087E8] hapErrorWithCode:12];
              v7[2](v7, 0, v66);

              goto LABEL_59;
            }
            v52 = (void (*)(id, void *, void *))v7[2];
            v53 = &unk_2702B5FE8;
          }
          else
          {
            v52 = (void (*)(id, void *, void *))v7[2];
            v53 = &unk_2702B6060;
          }
          v52(v7, v53, 0);
          goto LABEL_59;
        }
        v71 = v10;
        id v32 = objc_alloc_init(MEMORY[0x263F10FA0]);
        v33 = [(MTRClusterFanControl *)v15 readAttributePercentCurrentWithParams:v32];
        v34 = v33;
        if (!v33)
        {
          v74 = v7;
          id v78 = v13;
          v54 = (void *)MEMORY[0x2533B64D0]();
          v55 = v15;
          v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = v57 = v54;
            v59 = [v71 endpoint];
            *(_DWORD *)buf = 138543618;
            v80 = v58;
            __int16 v81 = 2112;
            v82 = v59;
            _os_log_impl(&dword_252495000, v56, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read PercentCurrent attribute on endpoint %@. Cannot update CurrentAirPurifierState.", buf, 0x16u);

            v54 = v57;
          }

          id v37 = [MEMORY[0x263F087E8] hapErrorWithCode:11];
          v7 = v74;
          v74[2](v74, 0, v37);
          id v13 = v78;
          goto LABEL_47;
        }
        v35 = [v33 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v36 = v35;
        }
        else {
          v36 = 0;
        }
        id v37 = v36;

        if (v37)
        {
          if ([v37 unsignedIntValue]) {
            v38 = &unk_2702B6060;
          }
          else {
            v38 = &unk_2702B5FD0;
          }
          ((void (**)(id, void *, void *))v7)[2](v7, v38, 0);
LABEL_47:

          id v10 = v71;
          goto LABEL_59;
        }
        _HMFPreconditionFailure();
LABEL_66:
        _HMFPreconditionFailure();
      }
LABEL_37:
      v7[2](v7, 0, v13);
LABEL_59:

      goto LABEL_60;
    }
    v39 = [v10 attribute];
    int v40 = [v39 isEqualToNumber:&unk_2702B60C0];

    if (v40)
    {
      id v31 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v25];
      if (!v31) {
        goto LABEL_37;
      }
      id v77 = v13;
      v72 = v10;
      id v41 = objc_alloc_init(MEMORY[0x263F10FA0]);
      v42 = [(MTRClusterFanControl *)v15 readAttributeFanModeWithParams:v41];
      v43 = v42;
      if (!v42)
      {
        v75 = v7;
        v60 = (void *)MEMORY[0x2533B64D0]();
        v61 = v15;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v63 = HMFGetLogIdentifier();
          [v72 endpoint];
          v65 = v64 = v60;
          *(_DWORD *)buf = 138543618;
          v80 = v63;
          __int16 v81 = 2112;
          v82 = v65;
          _os_log_impl(&dword_252495000, v62, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read FanMode attribute on endpoint %@. Cannot update CurrentAirPurifierState.", buf, 0x16u);

          v60 = v64;
        }

        id v46 = [MEMORY[0x263F087E8] hapErrorWithCode:11];
        v7 = v75;
        v75[2](v75, 0, v46);
        goto LABEL_58;
      }
      v44 = [v42 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v45 = v44;
      }
      else {
        v45 = 0;
      }
      id v46 = v45;

      if (!v46) {
        goto LABEL_66;
      }
      int v47 = [v31 isEqualToNumber:&unk_2702B6000];
      int v48 = [v46 isEqualToNumber:&unk_2702B6048];
      if (v47)
      {
        if (v48)
        {
          v49 = (void (*)(id, void *, void *))v7[2];
          v50 = &unk_2702B5FD0;
        }
        else
        {
          int v67 = [v46 isEqualToNumber:&unk_2702B6078];
          v49 = (void (*)(id, void *, void *))v7[2];
          if (!v67)
          {
            v68 = v7;
            v50 = 0;
            goto LABEL_57;
          }
          v50 = &unk_2702B5FE8;
        }
      }
      else
      {
        if (!v48)
        {
          if ([v46 isEqualToNumber:&unk_2702B6078])
          {
            v69 = [MEMORY[0x263F087E8] hapErrorWithCode:12];
            v7[2](v7, 0, v69);
          }
          else
          {
            ((void (**)(id, void *, void *))v7)[2](v7, &unk_2702B6060, 0);
          }
          goto LABEL_58;
        }
        v49 = (void (*)(id, void *, void *))v7[2];
        v50 = &unk_2702B6060;
      }
      v68 = v7;
LABEL_57:
      v49(v68, v50, 0);
LABEL_58:

      id v10 = v72;
      id v13 = v77;
      goto LABEL_59;
    }
  }
  v7[2](v7, 0, v13);
LABEL_60:
}

- (void)writeAttributePluginFanModeWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
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
  unsigned int v12 = [v11 unsignedIntValue];
  if (v12 > 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = qword_2653785C8[v12];
  }
  v14 = (void *)MEMORY[0x2533B64D0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    int v19 = 138543874;
    v20 = v17;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@writeAttributePluginFanModeWithValue currentAirPurifierState %@, fanModeValue %@", (uint8_t *)&v19, 0x20u);
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
  [v18 setValue:v13 forKey:v8];
  [(MTRClusterFanControl *)v15 writeAttributeFanModeWithValue:v18 expectedValueInterval:v7];
}

- (id)readAttributePluginFanModeWithParams:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v6 = [(MTRClusterFanControl *)self readAttributeFanModeWithParams:v5];
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v8 = *MEMORY[0x263F10C30];
    v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
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
      unsigned int v12 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v55 = v15;
        __int16 v56 = 2112;
        id v57 = v11;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@readAttributePluginFanModeWithParams fanModeValue %@", buf, 0x16u);
      }
      if (![v11 isEqualToNumber:&unk_2702B6048])
      {
        int v31 = [v11 unsignedIntValue];
        if ((v31 - 1) >= 3)
        {
          if (v31)
          {
            id v30 = 0;
            goto LABEL_31;
          }
          uint64_t v36 = *MEMORY[0x263F10C28];
          uint64_t v46 = *MEMORY[0x263F10C18];
          uint64_t v47 = v8;
          uint64_t v48 = v36;
          v49 = &unk_2702B5FE8;
          v33 = NSDictionary;
          v34 = &v48;
          v35 = &v46;
        }
        else
        {
          uint64_t v32 = *MEMORY[0x263F10C28];
          uint64_t v42 = *MEMORY[0x263F10C18];
          uint64_t v43 = v8;
          uint64_t v44 = v32;
          v45 = &unk_2702B6060;
          v33 = NSDictionary;
          v34 = &v44;
          v35 = &v42;
        }
        id v30 = objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 2, v42, v43, v44, v45, v46, v47, v48, v49);
LABEL_31:

        goto LABEL_32;
      }
      v16 = [(MTRClusterFanControl *)v13 readAttributePercentCurrentWithParams:v5];
      v17 = v16;
      if (!v16)
      {
        id v37 = (void *)MEMORY[0x2533B64D0]();
        v38 = v13;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          int v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v55 = v40;
          _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read PercentCurrent attribute", buf, 0xCu);
        }
        id v30 = 0;
        goto LABEL_30;
      }
      v18 = [v16 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v19 = v18;
      }
      else {
        int v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        int v21 = [v20 unsignedIntValue];
        uint64_t v22 = *MEMORY[0x263F10C28];
        if (v21)
        {
          v52[0] = *MEMORY[0x263F10C18];
          v52[1] = v8;
          v53[0] = v22;
          v53[1] = &unk_2702B6060;
          __int16 v23 = NSDictionary;
          uint64_t v24 = v53;
          uint64_t v25 = v52;
        }
        else
        {
          v50[0] = *MEMORY[0x263F10C18];
          v50[1] = v8;
          v51[0] = v22;
          v51[1] = &unk_2702B5FD0;
          __int16 v23 = NSDictionary;
          uint64_t v24 = v51;
          uint64_t v25 = v50;
        }
        id v30 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:2];

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v26 = (void *)MEMORY[0x2533B64D0]();
  char v27 = self;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    int v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v55 = v29;
    _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read FanMode attribute", buf, 0xCu);
  }
  id v30 = 0;
LABEL_32:

  return v30;
}

- (void)updatedValuePluginRockSettingForAttributeReport:(id)a3 responseHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  id v11 = [v6 objectForKeyedSubscript:*MEMORY[0x263F10BB8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  id v48 = v12;

  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = v16 = v6;
    [v10 endpoint];
    v18 = uint64_t v46 = v7;
    int v19 = [v10 cluster];
    [v10 attribute];
    id v20 = v45 = v13;
    uint64_t v21 = *MEMORY[0x263F10B90];
    uint64_t v22 = [v16 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    *(_DWORD *)buf = 138544386;
    v50 = v17;
    __int16 v51 = 2112;
    v52 = v18;
    __int16 v53 = 2112;
    v54 = v19;
    __int16 v55 = 2112;
    __int16 v56 = v20;
    __int16 v57 = 2112;
    uint64_t v58 = v22;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    uint64_t v13 = v45;
    id v7 = v46;

    id v6 = v16;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x263F10B90];
  }

  __int16 v23 = [v6 objectForKeyedSubscript:v21];
  if (v23) {
    uint64_t v24 = v6;
  }
  else {
    uint64_t v24 = 0;
  }
  id v25 = v24;

  v26 = [v10 cluster];
  if (([v26 isEqualToNumber:&unk_2702B6018] & 1) == 0)
  {

LABEL_19:
    int v31 = v48;
    v7[2](v7, 0, v48);
    goto LABEL_20;
  }
  char v27 = [v10 attribute];
  int v28 = [v27 isEqualToNumber:&unk_2702B6030];

  if (!v28) {
    goto LABEL_19;
  }
  id v29 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v25];
  if (!v29) {
    goto LABEL_19;
  }
  id v30 = v29;
  if ([v29 isEqualToNumber:&unk_2702B6000])
  {
    int v31 = v48;
    ((void (**)(id, void *, id))v7)[2](v7, &unk_2702B5FE8, v48);
  }
  else
  {
    id v32 = v6;
    id v33 = objc_alloc_init(MEMORY[0x263F10FA0]);
    v34 = [(MTRClusterFanControl *)v14 readAttributeRockSupportWithParams:v33];
    v35 = v34;
    if (v34)
    {
      uint64_t v36 = [v34 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }
      id v38 = v37;

      if (!v38) {
        _HMFPreconditionFailure();
      }
      int v39 = [v38 unsignedIntValue];
      if (([v30 unsignedIntValue] & v39) != 0) {
        int v40 = &unk_2702B5FD0;
      }
      else {
        int v40 = &unk_2702B5FE8;
      }
      int v31 = v48;
      ((void (**)(id, void *, id))v7)[2](v7, v40, v48);
    }
    else
    {
      uint64_t v47 = v7;
      id v41 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v42 = v14;
      uint64_t v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v44;
        _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute. Cannot write RockSetting attribute.", buf, 0xCu);
      }
      id v38 = [MEMORY[0x263F087E8] hapErrorWithCode:11];
      id v7 = v47;
      v47[2](v47, 0, v38);
      int v31 = v48;
    }

    id v6 = v32;
  }
LABEL_20:
}

- (void)writeAttributePluginRockSettingWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
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

  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if ([v11 isEqualToNumber:&unk_2702B5FE8])
  {
    unsigned int v12 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting 0", buf, 0xCu);
    }
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
    [v16 setValue:&unk_2702B6000 forKey:v8];
    [(MTRClusterFanControl *)v13 writeAttributeRockSettingWithValue:v16 expectedValueInterval:v7];

    goto LABEL_25;
  }
  if ([v11 isEqualToNumber:&unk_2702B5FD0])
  {
    id v17 = objc_alloc_init(MEMORY[0x263F10FA0]);
    v18 = [(MTRClusterFanControl *)self readAttributeRockSupportWithParams:v17];
    int v19 = v18;
    if (!v18)
    {
      int v31 = (void *)MEMORY[0x2533B64D0]();
      id v32 = self;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v38 = v34;
        _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute. Cannot write RockSetting attribute.", buf, 0xCu);
      }
      goto LABEL_24;
    }
    id v20 = [v18 objectForKeyedSubscript:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      __int16 v23 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
      context = (void *)MEMORY[0x2533B64D0]();
      uint64_t v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v26 = id v35 = v17;
        *(_DWORD *)buf = 138543618;
        id v38 = v26;
        __int16 v39 = 2112;
        id v40 = v22;
        _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting %@", buf, 0x16u);

        id v17 = v35;
      }

      [v23 setValue:v22 forKey:v8];
      [(MTRClusterFanControl *)v24 writeAttributeRockSettingWithValue:v23 expectedValueInterval:v7];

LABEL_24:
      goto LABEL_25;
    }
LABEL_27:
    _HMFPreconditionFailure();
  }
  char v27 = (void *)MEMORY[0x2533B64D0]();
  int v28 = self;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v38 = v30;
    __int16 v39 = 2112;
    id v40 = v11;
    _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot write RockSetting attribute. Unexpected swing value %@", buf, 0x16u);
  }
LABEL_25:
}

- (id)readAttributePluginRockSettingWithParams:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v6 = [(MTRClusterFanControl *)self readAttributeRockSupportWithParams:v5];
  id v7 = v6;
  if (v6)
  {
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

    if (v11)
    {
      unsigned int v12 = [(MTRClusterFanControl *)self readAttributeRockSettingWithParams:v5];
      uint64_t v13 = v12;
      if (!v12)
      {
        int v28 = (void *)MEMORY[0x2533B64D0]();
        id v29 = self;
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v42 = v31;
          _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSetting attribute", buf, 0xCu);
        }
        char v27 = 0;
        goto LABEL_21;
      }
      v14 = [v12 objectForKeyedSubscript:v8];
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
        uint64_t v17 = [v11 unsignedIntegerValue];
        uint64_t v18 = [v16 unsignedIntegerValue];
        uint64_t v19 = *MEMORY[0x263F10C28];
        if ((v18 & v17) != 0)
        {
          uint64_t v37 = *MEMORY[0x263F10C18];
          uint64_t v38 = v8;
          uint64_t v39 = v19;
          id v40 = &unk_2702B5FD0;
          id v20 = NSDictionary;
          uint64_t v21 = &v39;
          id v22 = &v37;
        }
        else
        {
          uint64_t v33 = *MEMORY[0x263F10C18];
          uint64_t v34 = v8;
          uint64_t v35 = v19;
          uint64_t v36 = &unk_2702B5FE8;
          id v20 = NSDictionary;
          uint64_t v21 = &v35;
          id v22 = &v33;
        }
        char v27 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2, v33, v34, v35, v36, v37, v38, v39, v40);

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  __int16 v23 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v24 = self;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v26;
    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute", buf, 0xCu);
  }
  char v27 = 0;
LABEL_22:

  return v27;
}

@end