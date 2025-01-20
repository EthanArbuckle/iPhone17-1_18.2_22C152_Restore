@interface HMDHomeNFCReaderKeyModel
+ (id)defaultModelForHome:(id)a3;
+ (id)modelIDForHome:(id)a3;
+ (id)properties;
- (HMDHomeNFCReaderKey)nfcReaderKey;
- (void)setNfcReaderKey:(id)a3;
@end

@implementation HMDHomeNFCReaderKeyModel

- (HMDHomeNFCReaderKey)nfcReaderKey
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDHomeNFCReaderKeyModel *)self encodedNfcReaderKey];
  if (v2)
  {
    id v11 = 0;
    v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v11];
    id v4 = v11;
    v5 = v4;
    if (v3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v13 = v9;
        __int16 v14 = 2112;
        v15 = v2;
        __int16 v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode nfc reader key set on model %@:%@", buf, 0x20u);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (HMDHomeNFCReaderKey *)v3;
}

- (void)setNfcReaderKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDHomeNFCReaderKeyModel *)self setEncodedNfcReaderKey:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded nfc reader key on model %@:%@", buf, 0x20u);
    }
  }
}

+ (id)defaultModelForHome:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeNFCReaderKeyModel alloc];
  id v6 = [a1 modelIDForHome:v4];
  v7 = [v4 uuid];

  v8 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v7];
  return v8;
}

+ (id)modelIDForHome:(id)a3
{
  id v3 = a3;
  id v4 = [@"HMDHomeNFCReaderKeyModel" dataUsingEncoding:4];
  v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = [v3 uuid];

  v7 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v4);

  return v7;
}

+ (id)properties
{
  if (properties_onceToken_336 != -1) {
    dispatch_once(&properties_onceToken_336, &__block_literal_global_339_80271);
  }
  v2 = (void *)properties__properties_337;
  return v2;
}

void __38__HMDHomeNFCReaderKeyModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v3 = @"encodedNfcReaderKey";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_337;
  properties__properties_337 = v1;
}

@end