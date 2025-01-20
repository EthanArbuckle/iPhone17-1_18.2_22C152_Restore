@interface HMDUnassociatedMediaAccessory
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHAPAirPlay2Accessory;
- (HMDAccessoryAdvertisement)advertisement;
- (HMDUnassociatedMediaAccessory)initWithAdvertisement:(id)a3 messageDispatcher:(id)a4;
- (HMDUnassociatedMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6;
- (id)addTransactionForHome:(id)a3;
- (id)dumpDescription;
- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (int64_t)associationOptions;
- (unint64_t)hash;
- (unint64_t)transportTypes;
- (void)setAdvertisement:(id)a3;
- (void)updateAdvertisementData:(id)a3;
@end

@implementation HMDUnassociatedMediaAccessory

- (void).cxx_destruct
{
}

- (void)setAdvertisement:(id)a3
{
}

- (HMDAccessoryAdvertisement)advertisement
{
  return (HMDAccessoryAdvertisement *)objc_getProperty(self, a2, 120, 1);
}

- (id)addTransactionForHome:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDUnassociatedAccessory *)self uuid];
  v6 = [v4 uuid];
  v7 = [(HMDUnassociatedMediaAccessory *)self modelForChangeType:1 uuid:v5 parentUUID:v6];

  v8 = [(HMDUnassociatedAccessory *)self identifier];
  [v7 setIdentifier:v8];

  v9 = [(HMDUnassociatedAccessory *)self name];
  [v7 setProvidedName:v9];

  v10 = (void *)MEMORY[0x1E4F2E520];
  v11 = [(HMDUnassociatedAccessory *)self category];
  v12 = [v10 categoryIdentifierForCategory:v11];
  [v7 setAccessoryCategory:v12];

  uint64_t v13 = [v7 providedName];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v7 configuredName];

    if (!v15)
    {
      v16 = [(HMDUnassociatedAccessory *)self category];
      v17 = [v16 localizedDescription];
      v18 = [v7 providedName];
      char v19 = [v17 isEqualToString:v18];

      if ((v19 & 1) == 0)
      {
        v20 = [(HMDUnassociatedAccessory *)self category];
        v21 = [v20 categoryType];
        char v22 = [v21 isEqualToString:*MEMORY[0x1E4F2C1D0]];

        if ((v22 & 1) == 0)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v23 = objc_msgSend(v4, "rooms", 0);
          v24 = (void *)[v23 copy];

          uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v43;
LABEL_7:
            uint64_t v28 = 0;
            while (1)
            {
              if (*(void *)v43 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = [*(id *)(*((void *)&v42 + 1) + 8 * v28) name];
              v30 = [v7 providedName];
              uint64_t v31 = [v29 caseInsensitiveCompare:v30];

              if (!v31) {
                break;
              }
              if (v26 == ++v28)
              {
                uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
                if (v26) {
                  goto LABEL_7;
                }
                goto LABEL_13;
              }
            }
          }
          else
          {
LABEL_13:

            v32 = [v4 roomForEntireHome];
            v33 = [v32 name];
            v34 = [v7 providedName];
            uint64_t v35 = [v33 caseInsensitiveCompare:v34];

            if (!v35) {
              goto LABEL_18;
            }
            v36 = (void *)MEMORY[0x1D9452090]();
            v37 = self;
            v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = HMFGetLogIdentifier();
              v40 = [v7 providedName];
              *(_DWORD *)buf = 138543618;
              v47 = v39;
              __int16 v48 = 2112;
              v49 = v40;
              _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Populating configuredName with providedName: %@", buf, 0x16u);
            }
            v24 = [v7 providedName];
            [v7 setConfiguredName:v24];
          }
        }
      }
    }
  }
LABEL_18:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDUnassociatedMediaAccessory *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
      v7 = [(HMDUnassociatedAccessory *)self identifier];
      v8 = [(HMDUnassociatedAccessory *)v6 identifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDUnassociatedAccessory *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)associationOptions
{
  unint64_t v3 = [(HMDUnassociatedMediaAccessory *)self advertisement];

  if (!v3) {
    return 0;
  }
  id v4 = [(HMDUnassociatedMediaAccessory *)self advertisement];
  int64_t v5 = [v4 associationOptions];

  return v5;
}

- (id)dumpDescription
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = NSString;
  int64_t v5 = [(HMDUnassociatedAccessory *)self name];
  v6 = [(HMDUnassociatedAccessory *)self uuid];
  v7 = [v6 UUIDString];
  v8 = [(HMDUnassociatedAccessory *)self category];
  char v9 = [(HMDUnassociatedAccessory *)self identifier];
  v10 = [v4 stringWithFormat:@"Media Accessory '%@': uuid %@  category %@ identifier %@", v5, v7, v8, v9];

  [v3 setObject:v10 forKey:*MEMORY[0x1E4F64EA0]];
  return v3;
}

- (unint64_t)transportTypes
{
  return 16;
}

- (BOOL)isHAPAirPlay2Accessory
{
  v2 = [(HMDUnassociatedMediaAccessory *)self advertisement];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    int64_t v5 = [v4 outputDevice];
    char v6 = MEMORY[0x1D9450C80]([v5 outputDevice]);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)updateAdvertisementData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)&self->_advertisement, a3);
    os_unfair_recursive_lock_unlock();
    id v5 = v6;
  }
}

- (HMDUnassociatedMediaAccessory)initWithAdvertisement:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 name];
  v10 = [v7 identifier];
  v11 = [v7 category];
  v12 = [(HMDUnassociatedMediaAccessory *)self initWithIdentifier:v10 name:v9 category:v11 messageDispatcher:v8];

  if (v12) {
    objc_storeStrong((id *)&v12->_advertisement, a3);
  }

  return v12;
}

- (HMDUnassociatedMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    v14 = (void *)MEMORY[0x1E4F2E520];
    id v15 = objc_alloc(MEMORY[0x1E4F29128]);
    v16 = (void *)[v15 initWithUUIDString:*MEMORY[0x1E4F2C218]];
    id v12 = [v14 categoryWithIdentifier:v16];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDUnassociatedMediaAccessory;
  v17 = [(HMDUnassociatedAccessory *)&v19 initWithIdentifier:v10 name:v11 category:v12 messageDispatcher:v13];

  return v17;
}

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  char v9 = [(HMDBackingStoreModelObject *)[HMDMediaAccessoryModel alloc] initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_47526 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_47526, &__block_literal_global_47527);
  }
  v2 = (void *)logCategory__hmf_once_v5_47528;
  return v2;
}

uint64_t __44__HMDUnassociatedMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_47528;
  logCategory__hmf_once_v5_47528 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end