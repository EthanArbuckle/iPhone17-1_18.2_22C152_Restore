@interface HMMTRSyncClusterWindowCovering
- (void)writeAttributePluginTargetPositionTiltWithSetValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributePluginTargetPositionWithSetValue:(id)a3 expectedValueInterval:(id)a4;
@end

@implementation HMMTRSyncClusterWindowCovering

- (void)writeAttributePluginTargetPositionTiltWithSetValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v9 = [(MTRClusterWindowCovering *)self readAttributeFeatureMapWithParams:v8];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F10C30];
    v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    uint64_t v15 = [v14 unsignedIntegerValue];
    v16 = [v6 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = id v22 = v7;
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      __int16 v40 = 2048;
      uint64_t v41 = v15;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

      id v7 = v22;
    }

    if ((~v15 & 0x12) != 0)
    {
      if ([v18 unsignedIntValue] < 0x1389)
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_8;
        v35[3] = &unk_265376E00;
        v35[4] = v20;
        [(MTRClusterWindowCovering *)v20 upOrOpenWithExpectedValues:MEMORY[0x263EFFA68] expectedValueInterval:v7 completionHandler:v35];
      }
      else
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_7;
        v36[3] = &unk_265376E00;
        v36[4] = v20;
        [(MTRClusterWindowCovering *)v20 downOrCloseWithExpectedValues:MEMORY[0x263EFFA68] expectedValueInterval:v7 completionHandler:v36];
      }
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263F11000]);
      v25 = (void *)MEMORY[0x2533B64D0]([v24 setTiltPercent100thsValue:v18]);
      v26 = v20;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = id v34 = v7;
        v29 = [v24 tiltPercent100thsValue];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v29;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_DEBUG, "%{public}@tiltPercent100thsValue %@", buf, 0x16u);

        id v7 = v34;
      }

      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke;
      v37[3] = &unk_265376E00;
      v37[4] = v26;
      [(MTRClusterWindowCovering *)v26 goToTiltPercentageWithParams:v24 expectedValues:0 expectedValueInterval:0 completionHandler:v37];
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x2533B64D0]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map", buf, 0xCu);
    }
  }
}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to GoToTiltPercentage. Result: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to DownOrClose: %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = 0;
    v9 = "%{public}@Wrote to DownOrClose. Result: %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to UpOrOpen: %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = 0;
    v9 = "%{public}@Wrote to UpOrOpen. Result: %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

- (void)writeAttributePluginTargetPositionWithSetValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v9 = [(MTRClusterWindowCovering *)self readAttributeFeatureMapWithParams:v8];
  __int16 v10 = v9;
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F10C30];
    int v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    uint64_t v15 = [v14 unsignedIntegerValue];
    uint64_t v16 = [v6 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = id v22 = v7;
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      __int16 v40 = 2048;
      uint64_t v41 = v15;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

      id v7 = v22;
    }

    if ((~v15 & 5) != 0)
    {
      if ([v18 unsignedIntValue] < 0x1389)
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_5;
        v35[3] = &unk_265376E00;
        v35[4] = v20;
        [(MTRClusterWindowCovering *)v20 upOrOpenWithExpectedValues:MEMORY[0x263EFFA68] expectedValueInterval:v7 completionHandler:v35];
      }
      else
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_4;
        v36[3] = &unk_265376E00;
        v36[4] = v20;
        [(MTRClusterWindowCovering *)v20 downOrCloseWithExpectedValues:MEMORY[0x263EFFA68] expectedValueInterval:v7 completionHandler:v36];
      }
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263F10FF8]);
      v25 = (void *)MEMORY[0x2533B64D0]([v24 setLiftPercent100thsValue:v18]);
      v26 = v20;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = id v34 = v7;
        v29 = [v24 liftPercent100thsValue];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v29;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_DEBUG, "%{public}@liftPercent100thsValue %@", buf, 0x16u);

        id v7 = v34;
      }

      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke;
      v37[3] = &unk_265376E00;
      v37[4] = v26;
      [(MTRClusterWindowCovering *)v26 goToLiftPercentageWithParams:v24 expectedValues:0 expectedValueInterval:0 completionHandler:v37];
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x2533B64D0]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map", buf, 0xCu);
    }
  }
}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to GoToLiftPercentage. Result: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to DownOrClose: %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = 0;
    v9 = "%{public}@Wrote to DownOrClose. Result: %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to UpOrOpen: %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = 0;
    v9 = "%{public}@Wrote to UpOrOpen. Result: %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

@end