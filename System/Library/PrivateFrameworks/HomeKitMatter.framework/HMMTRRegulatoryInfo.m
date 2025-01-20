@interface HMMTRRegulatoryInfo
+ (id)logCategory;
- (id)countryCode;
- (id)iso3166_1FromISO3166_2CountryCode:(id)a3;
@end

@implementation HMMTRRegulatoryInfo

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_1148 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_1148, &__block_literal_global_1149);
  }
  v2 = (void *)logCategory__hmf_once_v4_1150;
  return v2;
}

uint64_t __34__HMMTRRegulatoryInfo_logCategory__block_invoke()
{
  logCategory__hmf_once_v4_1150 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

- (id)iso3166_1FromISO3166_2CountryCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    if ([v4 length] == 2)
    {
      id v5 = v4;
LABEL_6:
      v6 = v5;
      goto LABEL_11;
    }
    if ([v4 characterAtIndex:2] == 45)
    {
      id v5 = [v4 substringToIndex:2];
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x2533B64D0]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Malformatted ISO-3166-2 country code: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (id)countryCode
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F62D20] currentEstimates];
  if (![v3 count])
  {
    uint64_t v4 = [MEMORY[0x263F62D20] lastKnownEstimates];

    v3 = (void *)v4;
  }
  uint64_t v5 = [v3 count];
  v6 = (void *)MEMORY[0x2533B64D0]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v3 objectAtIndexedSubscript:0];
      int v12 = [v11 countryCode];
      int v18 = 138543618;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Estimated country code: %@", (uint8_t *)&v18, 0x16u);
    }
    v13 = [v3 objectAtIndexedSubscript:0];
    __int16 v14 = [v13 countryCode];
    id v15 = [(HMMTRRegulatoryInfo *)v7 iso3166_1FromISO3166_2CountryCode:v14];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@No RDEstimate available", (uint8_t *)&v18, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

@end