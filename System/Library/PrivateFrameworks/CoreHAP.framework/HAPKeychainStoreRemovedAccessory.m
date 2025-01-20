@interface HAPKeychainStoreRemovedAccessory
+ (id)logCategory;
- (HAPKeychainStoreRemovedAccessory)initWithName:(id)a3 creationDate:(id)a4;
- (NSDate)creationDate;
- (NSError)removeError;
- (NSString)accessoryName;
- (NSString)description;
- (void)setRemoveError:(id)a3;
@end

@implementation HAPKeychainStoreRemovedAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeError, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_accessoryName, 0);
}

- (void)setRemoveError:(id)a3
{
}

- (NSError)removeError
{
  return self->_removeError;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HAPKeychainStoreRemovedAccessory)initWithName:(id)a3 creationDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@The name is required";
LABEL_10:
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    }
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@The creation date is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HAPKeychainStoreRemovedAccessory;
  v10 = [(HAPKeychainStoreRemovedAccessory *)&v19 init];
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessoryName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  v12 = p_isa;
  v13 = v12;
LABEL_12:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPKeychainStoreRemovedAccessory *)self accessoryName];
  v5 = [(HAPKeychainStoreRemovedAccessory *)self creationDate];
  v6 = [(HAPKeychainStoreRemovedAccessory *)self removeError];
  id v7 = [v3 stringWithFormat:@"accessoryName: %@, creationDate: %@, error: %@", v4, v5, v6];

  return (NSString *)v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_5156);
  }
  v2 = (void *)logCategory__hmf_once_v4;

  return v2;
}

uint64_t __47__HAPKeychainStoreRemovedAccessory_logCategory__block_invoke()
{
  logCategory__hmf_once_v4 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end