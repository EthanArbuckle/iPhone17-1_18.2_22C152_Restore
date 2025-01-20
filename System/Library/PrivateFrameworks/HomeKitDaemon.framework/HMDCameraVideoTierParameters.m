@interface HMDCameraVideoTierParameters
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)pickBestTier;
- (BOOL)pickHigherTier;
- (BOOL)pickLowerTier;
- (HMDCameraStreamSessionID)sessionID;
- (HMDCameraVideoTier)currentPickedTier;
- (HMDCameraVideoTierParameters)initWithCoder:(id)a3;
- (HMDCameraVideoTierParameters)initWithSessionID:(id)a3 streamingCapabilities:(id)a4 maximumQuality:(int64_t)a5;
- (NSArray)tierOrder;
- (NSDictionary)videoTierCombinations;
- (id)logIdentifier;
- (int64_t)maximumQuality;
- (void)_generateAllVideoTiers:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentPickedTier:(id)a3;
- (void)setMaximumQuality:(int64_t)a3;
- (void)setTierOrder:(id)a3;
- (void)updateFirstPickedTier:(id)a3;
- (void)updateTierOrder:(id)a3;
- (void)updateTierParameters:(id)a3 firstPickedParameter:(id)a4;
@end

@implementation HMDCameraVideoTierParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPickedTier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_tierOrder, 0);
  objc_storeStrong((id *)&self->_videoTierCombinations, 0);
}

- (void)setMaximumQuality:(int64_t)a3
{
  self->_maximumQuality = a3;
}

- (int64_t)maximumQuality
{
  return self->_maximumQuality;
}

- (void)setCurrentPickedTier:(id)a3
{
}

- (HMDCameraVideoTier)currentPickedTier
{
  return self->_currentPickedTier;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (void)setTierOrder:(id)a3
{
}

- (NSArray)tierOrder
{
  return self->_tierOrder;
}

- (NSDictionary)videoTierCombinations
{
  return self->_videoTierCombinations;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraVideoTierParameters *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraVideoTierParameters *)self tierOrder];
  [v4 encodeObject:v5 forKey:@"kVideoTierOrder"];
}

- (HMDCameraVideoTierParameters)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraVideoTierParameters;
  id v5 = [(HMDCameraVideoTierParameters *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoTierOrder"];
    tierOrder = v5->_tierOrder;
    v5->_tierOrder = (NSArray *)v9;
  }
  return v5;
}

- (BOOL)pickBestTier
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraVideoTierParameters *)self tierOrder];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44__HMDCameraVideoTierParameters_pickBestTier__block_invoke;
  v21[3] = &unk_264A29218;
  v21[4] = self;
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v21);

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = [(HMDCameraVideoTierParameters *)v6 maximumQuality];
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@No tier available at or below maximum quality: %lu, selecting the lowest available tier", buf, 0x16u);
    }
    v10 = [(HMDCameraVideoTierParameters *)v6 tierOrder];
    id v4 = [v10 lastObject];
  }
  v11 = [(HMDCameraVideoTierParameters *)self currentPickedTier];
  int v12 = [v11 isEqual:v4];

  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Selected tier is the same as the current tier", buf, 0xCu);
    }
  }
  else
  {
    if (v16)
    {
      v18 = HMFGetLogIdentifier();
      v19 = [(HMDCameraVideoTierParameters *)v14 currentPickedTier];
      *(_DWORD *)buf = 138543874;
      v23 = v18;
      __int16 v24 = 2114;
      uint64_t v25 = (uint64_t)v19;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating the current picked tier from %{public}@ to %{public}@", buf, 0x20u);
    }
    [(HMDCameraVideoTierParameters *)v14 setCurrentPickedTier:v4];
  }

  return v12 ^ 1;
}

BOOL __44__HMDCameraVideoTierParameters_pickBestTier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 quality];
  return v3 <= [*(id *)(a1 + 32) maximumQuality];
}

- (BOOL)pickHigherTier
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDCameraVideoTierParameters *)self currentPickedTier];
  id v4 = [(HMDCameraVideoTierParameters *)self tierOrder];
  id v5 = [v4 firstObject];
  int v6 = [v3 isEqual:v5];

  if (!v6)
  {
    int v12 = [(HMDCameraVideoTierParameters *)self tierOrder];
    v13 = [(HMDCameraVideoTierParameters *)self currentPickedTier];
    uint64_t v14 = [v12 indexOfObject:v13];

    v15 = [(HMDCameraVideoTierParameters *)self tierOrder];
    BOOL v16 = [v15 objectAtIndex:v14 - 1];

    uint64_t v17 = [v16 quality];
    BOOL v11 = v17 <= [(HMDCameraVideoTierParameters *)self maximumQuality];
    if (v11)
    {
      v21 = (void *)MEMORY[0x230FBD990]([(HMDCameraVideoTierParameters *)self setCurrentPickedTier:v16]);
      v18 = self;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        return v11;
      }
      v19 = HMFGetLogIdentifier();
      v20 = [(HMDCameraVideoTierParameters *)v18 currentPickedTier];
      int v26 = 138543618;
      v27 = v19;
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Setting a higher current picked tier to %{public}@", (uint8_t *)&v26, 0x16u);
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      v19 = HMFGetLogIdentifier();
      int v26 = 138543618;
      v27 = v19;
      __int16 v28 = 2048;
      uint64_t v29 = [(HMDCameraVideoTierParameters *)v22 maximumQuality];
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Already in the highest tier for maximum quality: %lu", (uint8_t *)&v26, 0x16u);
    }

    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the highest tier", (uint8_t *)&v26, 0xCu);
  }
  return 0;
}

- (BOOL)pickLowerTier
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDCameraVideoTierParameters *)self currentPickedTier];
  id v4 = [(HMDCameraVideoTierParameters *)self tierOrder];
  id v5 = [v4 lastObject];
  int v6 = [v3 isEqual:v5];

  if (v6)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the lowest tier", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    BOOL v11 = [(HMDCameraVideoTierParameters *)self tierOrder];
    int v12 = [(HMDCameraVideoTierParameters *)self currentPickedTier];
    uint64_t v13 = [v11 indexOfObject:v12];

    uint64_t v14 = [(HMDCameraVideoTierParameters *)self tierOrder];
    v15 = [v14 objectAtIndex:v13 + 1];
    [(HMDCameraVideoTierParameters *)self setCurrentPickedTier:v15];

    v7 = (void *)MEMORY[0x230FBD990]();
    BOOL v16 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      v18 = [(HMDCameraVideoTierParameters *)v16 currentPickedTier];
      int v20 = 138543618;
      v21 = v17;
      __int16 v22 = 2114;
      v23 = v18;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting a lower current picked tier to %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  return v6 ^ 1;
}

- (void)updateFirstPickedTier:(id)a3
{
  *(void *)&v30[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraVideoTierParameters *)self tierOrder];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __54__HMDCameraVideoTierParameters_updateFirstPickedTier___block_invoke;
  v25[3] = &unk_264A29218;
  id v6 = v4;
  id v26 = v6;
  v7 = objc_msgSend(v5, "na_filter:", v25);

  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v28 = v11;
    __int16 v29 = 2112;
    *(void *)uint64_t v30 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order to %@", buf, 0x16u);
  }
  [(HMDCameraVideoTierParameters *)v9 setTierOrder:v7];
  [(HMDCameraVideoTierParameters *)v9 setCurrentPickedTier:v6];
  uint64_t v12 = [v6 quality];
  uint64_t v13 = [(HMDCameraVideoTierParameters *)v9 maximumQuality];
  if (v12 > v13)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v9;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = [v6 quality];
      int v19 = [(HMDCameraVideoTierParameters *)v15 maximumQuality];
      *(_DWORD *)buf = 138543874;
      __int16 v28 = v17;
      __int16 v29 = 1024;
      *(_DWORD *)uint64_t v30 = v18;
      v30[2] = 1024;
      *(_DWORD *)&v30[3] = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Selected tier quality: %u is higher than the maximum quality: %u, selecting new tier", buf, 0x18u);
    }
    uint64_t v13 = [(HMDCameraVideoTierParameters *)v15 pickBestTier];
  }
  int v20 = (void *)MEMORY[0x230FBD990](v13);
  v21 = v9;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    uint64_t v24 = [(HMDCameraVideoTierParameters *)v21 currentPickedTier];
    *(_DWORD *)buf = 138543618;
    __int16 v28 = v23;
    __int16 v29 = 2112;
    *(void *)uint64_t v30 = v24;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updated the current picked tier to %@", buf, 0x16u);
  }
}

BOOL __54__HMDCameraVideoTierParameters_updateFirstPickedTier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 videoResolution];
  unint64_t v4 = +[HMDStreamingCapabilities aspectRatioOfResolution:v3];
  id v5 = [*(id *)(a1 + 32) videoResolution];
  BOOL v6 = v4 == +[HMDStreamingCapabilities aspectRatioOfResolution:v5];

  return v6;
}

- (void)updateTierParameters:(id)a3 firstPickedParameter:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 tierOrder];
    int v27 = 138543618;
    __int16 v28 = v11;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order from selected parameters to %@", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v13 = [v6 tierOrder];
  [(HMDCameraVideoTierParameters *)v9 setTierOrder:v13];

  [(HMDCameraVideoTierParameters *)v9 setCurrentPickedTier:v7];
  uint64_t v14 = [v7 quality];
  uint64_t v15 = [(HMDCameraVideoTierParameters *)v9 maximumQuality];
  if (v14 > v15)
  {
    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v9;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v7 quality];
      uint64_t v21 = [(HMDCameraVideoTierParameters *)v17 maximumQuality];
      int v27 = 138543874;
      __int16 v28 = v19;
      __int16 v29 = 2048;
      uint64_t v30 = v20;
      __int16 v31 = 2048;
      uint64_t v32 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Selected tier quality: %lu is higher than the maximum quality: %lu, selecting new tier", (uint8_t *)&v27, 0x20u);
    }
    uint64_t v15 = [(HMDCameraVideoTierParameters *)v17 pickBestTier];
  }
  __int16 v22 = (void *)MEMORY[0x230FBD990](v15);
  v23 = v9;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    id v26 = [(HMDCameraVideoTierParameters *)v23 currentPickedTier];
    int v27 = 138543618;
    __int16 v28 = v25;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v26;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Updated the current picked tier to %@", (uint8_t *)&v27, 0x16u);
  }
}

- (void)updateTierOrder:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v26 = a3;
  uint64_t v24 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  __int16 v22 = self;
  obuint64_t j = [(HMDCameraVideoTierParameters *)self tierOrder];
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v6 = v26;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v6);
              }
              BOOL v11 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              uint64_t v12 = [v11 videoResolution];
              uint64_t v13 = [v5 videoResolution];
              int v14 = [v12 isEqual:v13];

              if (v14)
              {
                uint64_t v15 = [v11 framerate];
                BOOL v16 = [v5 framerate];

                if (v15 < v16)
                {
                  uint64_t v17 = [v11 framerate];
                  [v5 setFramerate:v17];
                }
                [v24 addObject:v5];
                goto LABEL_18;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v27);
  }

  int v18 = (void *)MEMORY[0x230FBD990]();
  int v19 = v22;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v24;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order from video attributes to %@", buf, 0x16u);
  }
  [(HMDCameraVideoTierParameters *)v19 setTierOrder:v24];
}

- (void)_generateAllVideoTiers:(id)a3
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [MEMORY[0x263EFF980] array];
  v158 = self;
  id v159 = v4;
  switch([v4 streamingTierType])
  {
    case 0:
      uint64_t v7 = [[HMDVideoResolution alloc] initWithResolution:11];
      uint64_t v8 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v7 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v8 forKeyedSubscript:v7];
      [(NSArray *)v6 addObject:v8];
      uint64_t v9 = [[HMDVideoResolution alloc] initWithResolution:23];
      v10 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v9 framerate:&unk_26E473180 minBitRate:&unk_26E4731C8 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      v157 = v9;
      [v5 setObject:v10 forKeyedSubscript:v9];
      v156 = v10;
      [(NSArray *)v6 addObject:v10];
      BOOL v11 = [[HMDVideoResolution alloc] initWithResolution:7];
      uint64_t v12 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v11 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v12 forKeyedSubscript:v11];
      [(NSArray *)v6 addObject:v12];
      uint64_t v13 = [[HMDVideoResolution alloc] initWithResolution:1];
      int v14 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v13 framerate:&unk_26E473180 minBitRate:&unk_26E4731C8 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v14 forKeyedSubscript:v13];
      [(NSArray *)v6 addObject:v14];
      uint64_t v15 = [[HMDVideoResolution alloc] initWithResolution:27];
      BOOL v16 = v8;
      uint64_t v17 = v7;
      int v18 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v15 framerate:&unk_26E473180 minBitRate:&unk_26E4731F8 maxBitRate:&unk_26E473210 rtcpInterval:&unk_26E474728];
      [v5 setObject:v18 forKeyedSubscript:v15];
      [(NSArray *)v6 addObject:v18];
      goto LABEL_13;
    case 1:
      v152 = [[HMDVideoResolution alloc] initWithResolution:13];
      v148 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v152 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E473258 rtcpInterval:&unk_26E474728];
      [v5 setObject:v148 forKeyedSubscript:v152];
      [(NSArray *)v6 addObject:v148];
      int v19 = [[HMDVideoResolution alloc] initWithResolution:12];
      uint64_t v20 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v19 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      v157 = v19;
      [v5 setObject:v20 forKeyedSubscript:v19];
      v156 = v20;
      [(NSArray *)v6 addObject:v20];
      v145 = [[HMDVideoResolution alloc] initWithResolution:11];
      v141 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v145 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v141 forKeyedSubscript:v145];
      [(NSArray *)v6 addObject:v141];
      v137 = [[HMDVideoResolution alloc] initWithResolution:20];
      v133 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v137 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732A0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v133 forKeyedSubscript:v137];
      [(NSArray *)v6 addObject:v133];
      v129 = [[HMDVideoResolution alloc] initWithResolution:21];
      v125 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v129 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v125 forKeyedSubscript:v129];
      [(NSArray *)v6 addObject:v125];
      v123 = [[HMDVideoResolution alloc] initWithResolution:22];
      v121 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v123 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v121 forKeyedSubscript:v123];
      [(NSArray *)v6 addObject:v121];
      v119 = [[HMDVideoResolution alloc] initWithResolution:9];
      v117 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v119 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E473258 rtcpInterval:&unk_26E474728];
      [v5 setObject:v117 forKeyedSubscript:v119];
      [(NSArray *)v6 addObject:v117];
      v115 = [[HMDVideoResolution alloc] initWithResolution:8];
      v113 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v115 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      [v5 setObject:v113 forKeyedSubscript:v115];
      [(NSArray *)v6 addObject:v113];
      v111 = [[HMDVideoResolution alloc] initWithResolution:7];
      v109 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v111 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v109 forKeyedSubscript:v111];
      [(NSArray *)v6 addObject:v109];
      v107 = [[HMDVideoResolution alloc] initWithResolution:4];
      v105 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v107 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732A0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v105 forKeyedSubscript:v107];
      [(NSArray *)v6 addObject:v105];
      v103 = [[HMDVideoResolution alloc] initWithResolution:3];
      uint64_t v21 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v103 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v21 forKeyedSubscript:v103];
      [(NSArray *)v6 addObject:v21];
      __int16 v22 = [[HMDVideoResolution alloc] initWithResolution:2];
      v23 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v22 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v23 forKeyedSubscript:v22];
      [(NSArray *)v6 addObject:v23];
      uint64_t v24 = [[HMDVideoResolution alloc] initWithResolution:25];
      uint64_t v25 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v24 framerate:&unk_26E473228 minBitRate:&unk_26E4732D0 maxBitRate:&unk_26E4732E8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v25 forKeyedSubscript:v24];
      [(NSArray *)v6 addObject:v25];
      id v26 = [[HMDVideoResolution alloc] initWithResolution:26];
      uint64_t v27 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v26 framerate:&unk_26E473228 minBitRate:&unk_26E473300 maxBitRate:&unk_26E473318 rtcpInterval:&unk_26E474728];
      [v5 setObject:v27 forKeyedSubscript:v26];
      [(NSArray *)v6 addObject:v27];

      uint64_t v15 = v129;
      uint64_t v13 = v137;

      int v18 = v125;
      uint64_t v17 = v152;

      int v14 = v133;
      uint64_t v12 = v141;

      BOOL v16 = v148;
      goto LABEL_10;
    case 2:
      if (_os_feature_enabled_impl())
      {
        long long v28 = [[HMDVideoResolution alloc] initWithResolution:29];
        long long v29 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v28 framerate:&unk_26E473228 minBitRate:&unk_26E473330 maxBitRate:&unk_26E473348 rtcpInterval:&unk_26E474728];
        [v5 setObject:v29 forKeyedSubscript:v28];
        [(NSArray *)v6 addObject:v29];
      }
      long long v30 = [[HMDVideoResolution alloc] initWithResolution:14];
      long long v31 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v30 framerate:&unk_26E473228 minBitRate:&unk_26E473360 maxBitRate:&unk_26E473378 rtcpInterval:&unk_26E474728];
      v153 = v30;
      [v5 setObject:v31 forKeyedSubscript:v30];
      v149 = v31;
      [(NSArray *)v6 addObject:v31];
      long long v32 = [[HMDVideoResolution alloc] initWithResolution:13];
      long long v33 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v32 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732A0 rtcpInterval:&unk_26E474728];
      v157 = v32;
      [v5 setObject:v33 forKeyedSubscript:v32];
      v156 = v33;
      [(NSArray *)v6 addObject:v33];
      long long v34 = [[HMDVideoResolution alloc] initWithResolution:12];
      long long v35 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v34 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      v146 = v34;
      [v5 setObject:v35 forKeyedSubscript:v34];
      v142 = v35;
      [(NSArray *)v6 addObject:v35];
      v36 = [[HMDVideoResolution alloc] initWithResolution:11];
      v37 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v36 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      v138 = v36;
      [v5 setObject:v37 forKeyedSubscript:v36];
      v134 = v37;
      [(NSArray *)v6 addObject:v37];
      __int16 v38 = [[HMDVideoResolution alloc] initWithResolution:17];
      v39 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v38 framerate:&unk_26E473228 minBitRate:&unk_26E473378 maxBitRate:&unk_26E473390 rtcpInterval:&unk_26E474728];
      v130 = v38;
      [v5 setObject:v39 forKeyedSubscript:v38];
      v126 = v39;
      [(NSArray *)v6 addObject:v39];
      v40 = [[HMDVideoResolution alloc] initWithResolution:18];
      v41 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v40 framerate:&unk_26E473228 minBitRate:&unk_26E473258 maxBitRate:&unk_26E4733A8 rtcpInterval:&unk_26E474728];
      v124 = v40;
      [v5 setObject:v41 forKeyedSubscript:v40];
      v122 = v41;
      [(NSArray *)v6 addObject:v41];
      uint64_t v42 = [[HMDVideoResolution alloc] initWithResolution:19];
      v43 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v42 framerate:&unk_26E473228 minBitRate:&unk_26E4732B8 maxBitRate:&unk_26E4733C0 rtcpInterval:&unk_26E474728];
      v120 = v42;
      [v5 setObject:v43 forKeyedSubscript:v42];
      v118 = v43;
      [(NSArray *)v6 addObject:v43];
      v44 = [[HMDVideoResolution alloc] initWithResolution:20];
      v45 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v44 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E473360 rtcpInterval:&unk_26E474728];
      v116 = v44;
      [v5 setObject:v45 forKeyedSubscript:v44];
      v114 = v45;
      [(NSArray *)v6 addObject:v45];
      v46 = [[HMDVideoResolution alloc] initWithResolution:21];
      v47 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v46 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      v112 = v46;
      [v5 setObject:v47 forKeyedSubscript:v46];
      v110 = v47;
      [(NSArray *)v6 addObject:v47];
      v48 = [[HMDVideoResolution alloc] initWithResolution:22];
      v49 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v48 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      v108 = v48;
      [v5 setObject:v49 forKeyedSubscript:v48];
      v106 = v49;
      [(NSArray *)v6 addObject:v49];
      if (_os_feature_enabled_impl())
      {
        v50 = [[HMDVideoResolution alloc] initWithResolution:28];
        v51 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v50 framerate:&unk_26E473228 minBitRate:&unk_26E473330 maxBitRate:&unk_26E473348 rtcpInterval:&unk_26E474728];
        [v5 setObject:v51 forKeyedSubscript:v50];
        [(NSArray *)v6 addObject:v51];
      }
      v104 = [[HMDVideoResolution alloc] initWithResolution:10];
      v102 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v104 framerate:&unk_26E473228 minBitRate:&unk_26E473360 maxBitRate:&unk_26E473378 rtcpInterval:&unk_26E474728];
      [v5 setObject:v102 forKeyedSubscript:v104];
      [(NSArray *)v6 addObject:v102];
      v101 = [[HMDVideoResolution alloc] initWithResolution:9];
      v100 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v101 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732A0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v100 forKeyedSubscript:v101];
      [(NSArray *)v6 addObject:v100];
      v99 = [[HMDVideoResolution alloc] initWithResolution:8];
      v98 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v99 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      [v5 setObject:v98 forKeyedSubscript:v99];
      [(NSArray *)v6 addObject:v98];
      v97 = [[HMDVideoResolution alloc] initWithResolution:7];
      v96 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v97 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v96 forKeyedSubscript:v97];
      [(NSArray *)v6 addObject:v96];
      v95 = [[HMDVideoResolution alloc] initWithResolution:15];
      v94 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v95 framerate:&unk_26E473228 minBitRate:&unk_26E473378 maxBitRate:&unk_26E473390 rtcpInterval:&unk_26E474728];
      [v5 setObject:v94 forKeyedSubscript:v95];
      [(NSArray *)v6 addObject:v94];
      v93 = [[HMDVideoResolution alloc] initWithResolution:16];
      v92 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v93 framerate:&unk_26E473228 minBitRate:&unk_26E473258 maxBitRate:&unk_26E4733A8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v92 forKeyedSubscript:v93];
      [(NSArray *)v6 addObject:v92];
      v91 = [[HMDVideoResolution alloc] initWithResolution:5];
      v90 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v91 framerate:&unk_26E473228 minBitRate:&unk_26E4732B8 maxBitRate:&unk_26E4733C0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v90 forKeyedSubscript:v91];
      [(NSArray *)v6 addObject:v90];
      v89 = [[HMDVideoResolution alloc] initWithResolution:4];
      v88 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v89 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E473360 rtcpInterval:&unk_26E474728];
      [v5 setObject:v88 forKeyedSubscript:v89];
      [(NSArray *)v6 addObject:v88];
      v87 = [[HMDVideoResolution alloc] initWithResolution:3];
      v86 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v87 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v86 forKeyedSubscript:v87];
      [(NSArray *)v6 addObject:v86];
      v85 = [[HMDVideoResolution alloc] initWithResolution:2];
      v52 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v85 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v52 forKeyedSubscript:v85];
      [(NSArray *)v6 addObject:v52];
      v53 = [[HMDVideoResolution alloc] initWithResolution:24];
      v54 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v53 framerate:&unk_26E473228 minBitRate:&unk_26E4733D8 maxBitRate:&unk_26E4733F0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v54 forKeyedSubscript:v53];
      [(NSArray *)v6 addObject:v54];
      v55 = [[HMDVideoResolution alloc] initWithResolution:25];
      v56 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v55 framerate:&unk_26E473228 minBitRate:&unk_26E4732D0 maxBitRate:&unk_26E4732E8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v56 forKeyedSubscript:v55];
      [(NSArray *)v6 addObject:v56];
      v57 = [[HMDVideoResolution alloc] initWithResolution:26];
      v58 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v57 framerate:&unk_26E473228 minBitRate:&unk_26E473300 maxBitRate:&unk_26E473318 rtcpInterval:&unk_26E474728];
      [v5 setObject:v58 forKeyedSubscript:v57];
      [(NSArray *)v6 addObject:v58];

      BOOL v16 = v149;
      uint64_t v17 = v153;
      uint64_t v12 = v142;
      BOOL v11 = v146;
      int v14 = v134;
      uint64_t v13 = v138;
      int v18 = v126;
      uint64_t v15 = v130;
      goto LABEL_13;
    case 3:
      v154 = [[HMDVideoResolution alloc] initWithResolution:13];
      v150 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v154 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v150 forKeyedSubscript:v154];
      [(NSArray *)v6 addObject:v150];
      v59 = [[HMDVideoResolution alloc] initWithResolution:12];
      v60 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v59 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      v157 = v59;
      [v5 setObject:v60 forKeyedSubscript:v59];
      v156 = v60;
      [(NSArray *)v6 addObject:v60];
      v145 = [[HMDVideoResolution alloc] initWithResolution:11];
      v143 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v145 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v143 forKeyedSubscript:v145];
      [(NSArray *)v6 addObject:v143];
      v139 = [[HMDVideoResolution alloc] initWithResolution:20];
      v135 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v139 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v135 forKeyedSubscript:v139];
      [(NSArray *)v6 addObject:v135];
      v131 = [[HMDVideoResolution alloc] initWithResolution:21];
      v127 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v131 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      [v5 setObject:v127 forKeyedSubscript:v131];
      [(NSArray *)v6 addObject:v127];
      v123 = [[HMDVideoResolution alloc] initWithResolution:22];
      v121 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v123 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E473408 rtcpInterval:&unk_26E474728];
      [v5 setObject:v121 forKeyedSubscript:v123];
      [(NSArray *)v6 addObject:v121];
      v119 = [[HMDVideoResolution alloc] initWithResolution:9];
      v117 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v119 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v117 forKeyedSubscript:v119];
      [(NSArray *)v6 addObject:v117];
      v115 = [[HMDVideoResolution alloc] initWithResolution:8];
      v113 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v115 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      [v5 setObject:v113 forKeyedSubscript:v115];
      [(NSArray *)v6 addObject:v113];
      v111 = [[HMDVideoResolution alloc] initWithResolution:7];
      v109 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v111 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v109 forKeyedSubscript:v111];
      [(NSArray *)v6 addObject:v109];
      v107 = [[HMDVideoResolution alloc] initWithResolution:4];
      v105 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v107 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v105 forKeyedSubscript:v107];
      [(NSArray *)v6 addObject:v105];
      v103 = [[HMDVideoResolution alloc] initWithResolution:3];
      v61 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v103 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E473288 rtcpInterval:&unk_26E474728];
      [v5 setObject:v61 forKeyedSubscript:v103];
      [(NSArray *)v6 addObject:v61];
      v62 = [[HMDVideoResolution alloc] initWithResolution:2];
      v63 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v62 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E473408 rtcpInterval:&unk_26E474728];
      [v5 setObject:v63 forKeyedSubscript:v62];
      [(NSArray *)v6 addObject:v63];
      v64 = [[HMDVideoResolution alloc] initWithResolution:25];
      v65 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v64 framerate:&unk_26E473228 minBitRate:&unk_26E4732D0 maxBitRate:&unk_26E4732E8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v65 forKeyedSubscript:v64];
      [(NSArray *)v6 addObject:v65];
      v66 = [[HMDVideoResolution alloc] initWithResolution:26];
      v67 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v66 framerate:&unk_26E473228 minBitRate:&unk_26E473300 maxBitRate:&unk_26E473318 rtcpInterval:&unk_26E474728];
      [v5 setObject:v67 forKeyedSubscript:v66];
      [(NSArray *)v6 addObject:v67];

      BOOL v16 = v150;
      uint64_t v13 = v139;

      int v18 = v127;
      uint64_t v17 = v154;

      int v14 = v135;
      uint64_t v12 = v143;

      uint64_t v15 = v131;
LABEL_10:

      BOOL v11 = v145;
      goto LABEL_12;
    case 4:
      v155 = [[HMDVideoResolution alloc] initWithResolution:13];
      v151 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v155 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v151 forKeyedSubscript:v155];
      [(NSArray *)v6 addObject:v151];
      v68 = [[HMDVideoResolution alloc] initWithResolution:12];
      v69 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v68 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      v157 = v68;
      [v5 setObject:v69 forKeyedSubscript:v68];
      v156 = v69;
      [(NSArray *)v6 addObject:v69];
      v147 = [[HMDVideoResolution alloc] initWithResolution:11];
      v144 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v147 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v144 forKeyedSubscript:v147];
      [(NSArray *)v6 addObject:v144];
      v140 = [[HMDVideoResolution alloc] initWithResolution:20];
      v136 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v140 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v136 forKeyedSubscript:v140];
      [(NSArray *)v6 addObject:v136];
      v132 = [[HMDVideoResolution alloc] initWithResolution:21];
      v128 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v132 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v128 forKeyedSubscript:v132];
      [(NSArray *)v6 addObject:v128];
      v123 = [[HMDVideoResolution alloc] initWithResolution:22];
      v121 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v123 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E473408 rtcpInterval:&unk_26E474728];
      [v5 setObject:v121 forKeyedSubscript:v123];
      [(NSArray *)v6 addObject:v121];
      v119 = [[HMDVideoResolution alloc] initWithResolution:9];
      v117 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v119 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v117 forKeyedSubscript:v119];
      [(NSArray *)v6 addObject:v117];
      v115 = [[HMDVideoResolution alloc] initWithResolution:8];
      v113 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v115 framerate:&unk_26E473228 minBitRate:&unk_26E473270 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v113 forKeyedSubscript:v115];
      [(NSArray *)v6 addObject:v113];
      v111 = [[HMDVideoResolution alloc] initWithResolution:7];
      v109 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v111 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E4731B0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v109 forKeyedSubscript:v111];
      [(NSArray *)v6 addObject:v109];
      v70 = [[HMDVideoResolution alloc] initWithResolution:4];
      v71 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v70 framerate:&unk_26E473228 minBitRate:&unk_26E473240 maxBitRate:&unk_26E4732B8 rtcpInterval:&unk_26E474728];
      [v5 setObject:v71 forKeyedSubscript:v70];
      [(NSArray *)v6 addObject:v71];
      v72 = [[HMDVideoResolution alloc] initWithResolution:3];
      v73 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v72 framerate:&unk_26E473228 minBitRate:&unk_26E4731B0 maxBitRate:&unk_26E4731E0 rtcpInterval:&unk_26E474728];
      [v5 setObject:v73 forKeyedSubscript:v72];
      [(NSArray *)v6 addObject:v73];
      v74 = [[HMDVideoResolution alloc] initWithResolution:2];
      v75 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v74 framerate:&unk_26E473180 minBitRate:&unk_26E473198 maxBitRate:&unk_26E473408 rtcpInterval:&unk_26E474728];
      [v5 setObject:v75 forKeyedSubscript:v74];
      [(NSArray *)v6 addObject:v75];
      v76 = [[HMDVideoResolution alloc] initWithResolution:26];
      v77 = [[HMDCameraVideoTier alloc] initWithVideoResolution:v76 framerate:&unk_26E473228 minBitRate:&unk_26E473300 maxBitRate:&unk_26E473318 rtcpInterval:&unk_26E474728];
      [v5 setObject:v77 forKeyedSubscript:v76];
      [(NSArray *)v6 addObject:v77];

      BOOL v16 = v151;
      uint64_t v13 = v140;

      uint64_t v15 = v132;
      uint64_t v17 = v155;

      int v14 = v136;
      uint64_t v12 = v144;

      int v18 = v128;
      BOOL v11 = v147;
LABEL_12:

LABEL_13:
      self = v158;
      id v4 = v159;
      break;
    default:
      break;
  }
  v78 = (void *)MEMORY[0x230FBD990]();
  v79 = self;
  v80 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    v81 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v161 = v81;
    __int16 v162 = 2112;
    v163 = v6;
    _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding video tiers: %@", buf, 0x16u);
  }
  uint64_t v82 = [v5 copy];
  videoTierCombinations = v79->_videoTierCombinations;
  v79->_videoTierCombinations = (NSDictionary *)v82;

  tierOrder = v79->_tierOrder;
  v79->_tierOrder = v6;
}

- (HMDCameraVideoTierParameters)initWithSessionID:(id)a3 streamingCapabilities:(id)a4 maximumQuality:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraVideoTierParameters;
  BOOL v11 = [(HMDCameraVideoTierParameters *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionID, a3);
    v12->_maximumQuality = a5;
    [(HMDCameraVideoTierParameters *)v12 _generateAllVideoTiers:v10];
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_225461 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_225461, &__block_literal_global_225462);
  }
  v2 = (void *)logCategory__hmf_once_v17_225463;
  return v2;
}

void __43__HMDCameraVideoTierParameters_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_225463;
  logCategory__hmf_once_v17_225463 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end