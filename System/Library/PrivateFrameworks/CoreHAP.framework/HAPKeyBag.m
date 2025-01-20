@interface HAPKeyBag
+ (id)logCategory;
- (BOOL)isEmpty;
- (BOOL)isValidIndex:(int64_t)a3;
- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4;
- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5;
- (HAPKeyStore)keyStore;
- (NSArray)availableKeysToTry;
- (NSString)accessoryIdentifier;
- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4;
- (id)currentIdentity;
- (id)logIdentifier;
- (id)nextIdentity;
- (int64_t)currentIndexInBag;
- (int64_t)getCurrentIndexInBag;
- (unint64_t)totalIdentities;
- (void)refreshKeys;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAvailableKeysToTry:(id)a3;
- (void)setCurrentIndexInBag:(int64_t)a3;
@end

@implementation HAPKeyBag

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_availableKeysToTry, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

- (int64_t)currentIndexInBag
{
  return self->_currentIndexInBag;
}

- (HAPKeyStore)keyStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);

  return (HAPKeyStore *)WeakRetained;
}

- (void)setAvailableKeysToTry:(id)a3
{
}

- (NSArray)availableKeysToTry
{
  return self->_availableKeysToTry;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (id)logIdentifier
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HAPKeyBag *)self accessoryIdentifier];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HAPKeyBag getCurrentIndexInBag](self, "getCurrentIndexInBag"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPKeyBag totalIdentities](self, "totalIdentities"));
  v8 = [v3 stringWithFormat:@"%@ %@ (%@/%@)", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)totalIdentities
{
  v2 = [(HAPKeyBag *)self availableKeysToTry];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(HAPKeyBag *)self availableKeysToTry];
  char v3 = objc_msgSend(v2, "hmf_isEmpty");

  return v3;
}

- (id)currentIdentity
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HAPKeyBag *)self currentIndexInBag] == -1) {
    [(HAPKeyBag *)self setCurrentIndexInBag:[(HAPKeyBag *)self currentIndexInBag] + 1];
  }
  if ([(HAPKeyBag *)self isValidIndex:[(HAPKeyBag *)self currentIndexInBag]])
  {
    char v3 = [(HAPKeyBag *)self availableKeysToTry];
    uint64_t v4 = objc_msgSend(v3, "objectAtIndex:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag"));

    v5 = (void *)MEMORY[0x1D944E080]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Current Identity [%@]", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)nextIdentity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(HAPKeyBag *)self isEmpty])
  {
    char v3 = 0;
  }
  else
  {
    [(HAPKeyBag *)self setCurrentIndexInBag:[(HAPKeyBag *)self currentIndexInBag] + 1];
    char v3 = [(HAPKeyBag *)self currentIdentity];
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HAPKeyBag currentIndexInBag](v5, "currentIndexInBag"));
      v9 = NSNumber;
      int v10 = [(HAPKeyBag *)v5 availableKeysToTry];
      v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      int v13 = 138544130;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      v16 = v3;
      __int16 v17 = 2112;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching Identity [%@] at index : %@, total keys: [%@]", (uint8_t *)&v13, 0x2Au);
    }
  }

  return v3;
}

- (BOOL)isValidIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  uint64_t v4 = [(HAPKeyBag *)self availableKeysToTry];
  BOOL v5 = [v4 count] > (unint64_t)a3;

  return v5;
}

- (void)setCurrentIndexInBag:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentIndexInBag = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)getCurrentIndexInBag
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t currentIndexInBag = self->_currentIndexInBag;
  os_unfair_lock_unlock(p_lock);
  return currentIndexInBag;
}

- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D944E080]();
  v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v10 = [v7 allAccessoryPairingKeys];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  int v13 = [v9 arrayWithArray:v12];

  uint64_t v14 = [v7 getAssociatedControllerKeyForAccessory:v6];
  if (v14
    || ([v7 readControllerPairingKeyForAccessory:v6 error:0],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v13 removeObject:v14];
    [v13 insertObject:v14 atIndex:0];
  }
  if (objc_msgSend(v13, "hmf_isEmpty"))
  {
    __int16 v15 = (void *)MEMORY[0x1D944E080]();
    v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@This is strange. We do not have any controller keys in the key chain.", (uint8_t *)&v21, 0xCu);
    }
  }
  __int16 v19 = (void *)[v13 copy];

  return v19;
}

- (void)refreshKeys
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [(HAPKeyBag *)self accessoryIdentifier];

  if (!v3)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  uint64_t v4 = [(HAPKeyBag *)self keyStore];

  if (!v4) {
    goto LABEL_10;
  }
  BOOL v5 = [(HAPKeyBag *)self accessoryIdentifier];
  id v6 = [(HAPKeyBag *)self keyStore];
  id v7 = [(HAPKeyBag *)self _populateBagWithPairingIdentitiesForAccessory:v5 fromStore:v6];

  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    self->_int64_t currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v8 = (NSArray *)[v7 copy];
    availableKeysToTry = self->_availableKeysToTry;
    self->_availableKeysToTry = v8;

    self->_int64_t currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [(HAPKeyBag *)v11 accessoryIdentifier];
      int v15 = 138543874;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Refreshed key bag for accessory [%@] with identities: [%@]", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    _HMFPreconditionFailure();
  }
  uint64_t v12 = v11;
  v26.receiver = self;
  v26.super_class = (Class)HAPKeyBag;
  int v13 = [(HAPKeyBag *)&v26 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
    objc_storeWeak((id *)&v14->_keyStore, v10);
    v14->_int64_t currentIndexInBag = -1;
    uint64_t v15 = [v12 copy];
    availableKeysToTry = v14->_availableKeysToTry;
    v14->_availableKeysToTry = (NSArray *)v15;

    __int16 v17 = (void *)MEMORY[0x1D944E080]();
    v18 = v14;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v25 = v17;
      accessoryIdentifier = v14->_accessoryIdentifier;
      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v14->_availableKeysToTry, "count"));
      uint64_t v23 = [(NSArray *)v14->_availableKeysToTry firstObject];
      *(_DWORD *)buf = 138544130;
      v28 = v20;
      __int16 v29 = 2112;
      v30 = accessoryIdentifier;
      __int16 v17 = v25;
      __int16 v31 = 2112;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Initialized key bag for accessory [%@] with %@ keys and primary identity: [%@]", buf, 0x2Au);
    }
  }

  return v14;
}

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    id v9 = [(HAPKeyBag *)self _populateBagWithPairingIdentitiesForAccessory:v6 fromStore:v7];
    id v10 = [(HAPKeyBag *)self initWithAccessoryIdentifier:v6 keyStore:v8 controllerKeyList:v9];

    return v10;
  }
  else
  {
    uint64_t v12 = (void *)_HMFPreconditionFailure();
    return (HAPKeyBag *)+[HAPKeyBag logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global);
  }
  v2 = (void *)logCategory__hmf_once_v9;

  return v2;
}

uint64_t __24__HAPKeyBag_logCategory__block_invoke()
{
  logCategory__hmf_once_id v9 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end