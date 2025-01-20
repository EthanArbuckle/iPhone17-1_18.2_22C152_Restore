@interface HMAccessorySettingsFetchResponseMessagePayload
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySettingsFetchResponseMessagePayload)initWithPayload:(id)a3;
- (HMAccessorySettingsFetchResponseMessagePayload)initWithSettings:(id)a3 failureInformation:(id)a4;
- (HMAccessorySettingsPartialFetchFailureInformation)failureInformation;
- (NSArray)attributeDescriptions;
- (NSArray)fetchResults;
- (NSArray)settings;
- (NSString)description;
- (NSString)shortDescription;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMAccessorySettingsFetchResponseMessagePayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInformation, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (HMAccessorySettingsPartialFetchFailureInformation)failureInformation
{
  return (HMAccessorySettingsPartialFetchFailureInformation *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)settings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAccessorySettingsFetchResponseMessagePayload *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessorySettingsFetchResponseMessagePayload *)self settings];
      uint64_t v8 = [v7 count];
      v9 = [(HMAccessorySettingsFetchResponseMessagePayload *)v6 settings];
      if (v8 == [v9 count])
      {
        v10 = [(HMAccessorySettingsFetchResponseMessagePayload *)self settings];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__HMAccessorySettingsFetchResponseMessagePayload_isEqual___block_invoke;
        v16[3] = &unk_1E593E630;
        v11 = v6;
        v17 = v11;
        if (objc_msgSend(v10, "na_allObjectsPassTest:", v16))
        {
          v12 = [(HMAccessorySettingsFetchResponseMessagePayload *)self failureInformation];
          v13 = [(HMAccessorySettingsFetchResponseMessagePayload *)v11 failureInformation];
          char v14 = [v12 isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

uint64_t __58__HMAccessorySettingsFetchResponseMessagePayload_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 settings];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySettingsFetchResponseMessagePayload *)self settings];
  uint64_t v5 = (void *)[v3 initWithName:@"settings" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySettingsFetchResponseMessagePayload *)self failureInformation];
  uint64_t v8 = (void *)[v6 initWithName:@"failureInformation" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)payloadCopy
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessorySettingsFetchResponseMessagePayload *)self settings];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_11);

  v9[0] = @"HMImmutableSettingsPayloadKey";
  v9[1] = HMAccessorySettingsPartialFetchFailureInformationPayloadKey;
  v10[0] = v4;
  uint64_t v5 = [(HMAccessorySettingsFetchResponseMessagePayload *)self failureInformation];
  id v6 = [v5 payloadCopy];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

uint64_t __61__HMAccessorySettingsFetchResponseMessagePayload_payloadCopy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 payloadCopy];
}

- (HMAccessorySettingsFetchResponseMessagePayload)initWithPayload:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_arrayForKey:", @"HMImmutableSettingsPayloadKey");
  if (v5)
  {
    v32 = v4;
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v13 = [[HMImmutableSetting alloc] initWithPayload:v12];
          if (!v13)
          {
            v19 = (void *)MEMORY[0x19F3A64A0]();
            v17 = self;
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v39 = v21;
              __int16 v40 = 2112;
              id v41 = v12;
              _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to setting payload: %@", buf, 0x16u);
            }
            v18 = 0;
            id v4 = v32;
            goto LABEL_26;
          }
          char v14 = v13;
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v4 = v32;
    objc_msgSend(v32, "hmf_dictionaryForKey:", HMAccessorySettingsPartialFetchFailureInformationPayloadKey);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15 = [[HMAccessorySettingsPartialFetchFailureInformation alloc] initWithPayload:v7];
      if (v15)
      {
        v16 = (void *)[v6 copy];
        v17 = [(HMAccessorySettingsFetchResponseMessagePayload *)self initWithSettings:v16 failureInformation:v15];

        v18 = v17;
      }
      else
      {
        v28 = (void *)MEMORY[0x19F3A64A0]();
        v17 = self;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v39 = v30;
          __int16 v40 = 2112;
          id v41 = v7;
          _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to invalid failure information payload: %@", buf, 0x16u);
        }
        v18 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x19F3A64A0]();
      v17 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v39 = v27;
        __int16 v40 = 2112;
        id v41 = v32;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to no failure information in payload: %@", buf, 0x16u);
      }
      v18 = 0;
    }
LABEL_26:
  }
  else
  {
    v22 = (void *)MEMORY[0x19F3A64A0]();
    v17 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      __int16 v40 = 2112;
      id v41 = v4;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to no settings in payload: %@", buf, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

- (NSArray)fetchResults
{
  id v3 = [(HMAccessorySettingsFetchResponseMessagePayload *)self settings];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_1372);

  uint64_t v5 = [(HMAccessorySettingsFetchResponseMessagePayload *)self failureInformation];
  id v6 = [v5 failedKeyPaths];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke_2;
  void v11[3] = &unk_1E593E5E8;
  id v12 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "na_map:", v11);

  uint64_t v9 = [v4 arrayByAddingObjectsFromArray:v8];

  return (NSArray *)v9;
}

HMAccessorySettingFetchResult *__62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = -[HMAccessorySettingFetchResult initWithKeyPath:failureType:]([HMAccessorySettingFetchResult alloc], "initWithKeyPath:failureType:", v3, [v2 fetchFailureTypeForKeyPath:v3]);

  return v4;
}

HMAccessorySettingFetchResult *__62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMAccessorySettingFetchResult alloc] initWithSetting:v2];

  return v3;
}

- (HMAccessorySettingsFetchResponseMessagePayload)initWithSettings:(id)a3 failureInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  uint64_t v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingsFetchResponseMessagePayload *)+[HMAccessorySettingsFetchResponseMessagePayload logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySettingsFetchResponseMessagePayload;
  uint64_t v9 = [(HMAccessorySettingsFetchResponseMessagePayload *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    settings = v9->_settings;
    v9->_settings = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_failureInformation, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_1383 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_1383, &__block_literal_global_17);
  }
  id v2 = (void *)logCategory__hmf_once_v5_1384;

  return v2;
}

uint64_t __61__HMAccessorySettingsFetchResponseMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_1384;
  logCategory__hmf_once_v5_1384 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end