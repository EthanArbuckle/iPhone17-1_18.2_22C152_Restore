@interface HMMTRAccessControl
+ (id)logCategory;
- (HMMTRAccessControl)init;
- (HMMTRFabric)fabric;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)privilegeGetter;
- (unint64_t)currentUserPrivilege;
- (void)setCurrentUserPrivilege:(unint64_t)a3;
- (void)setFabric:(id)a3;
- (void)setPrivilegeGetter:(id)a3;
@end

@implementation HMMTRAccessControl

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fabric);
  objc_storeStrong(&self->_privilegeGetter, 0);
}

- (void)setFabric:(id)a3
{
}

- (HMMTRFabric)fabric
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fabric);
  return (HMMTRFabric *)WeakRetained;
}

- (void)setPrivilegeGetter:(id)a3
{
}

- (id)privilegeGetter
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMMTRAccessControl *)self fabric];
  v5 = [v4 fabricID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F424F8]);
    v7 = [(HMMTRAccessControl *)self fabric];
    v8 = [v7 fabricID];
    v9 = (void *)[v6 initWithName:@"Fabric ID" value:v8];
    [v3 addObject:v9];
  }
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  unint64_t v11 = [(HMMTRAccessControl *)self currentUserPrivilege] - 1;
  if (v11 > 2) {
    v12 = @"None";
  }
  else {
    v12 = off_265375EB0[v11];
  }
  v13 = (void *)[v10 initWithName:@"Current User Privilege" value:v12];
  [v3 addObject:v13];

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRAccessControl *)self fabric];
  v4 = [v3 fabricID];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (unint64_t)currentUserPrivilege
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t currentUserPrivilege = self->_currentUserPrivilege;
  os_unfair_lock_unlock(p_lock);
  if (!currentUserPrivilege)
  {
    uint64_t v5 = [(HMMTRAccessControl *)self privilegeGetter];
    id v6 = (void *)v5;
    if (v5)
    {
      unint64_t currentUserPrivilege = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);
      os_unfair_lock_lock(p_lock);
      self->_unint64_t currentUserPrivilege = currentUserPrivilege;
      os_unfair_lock_unlock(p_lock);
      if (currentUserPrivilege)
      {
        v7 = (void *)MEMORY[0x2533B64D0]();
        v8 = self;
        v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          unint64_t v11 = (void *)v10;
          if (currentUserPrivilege > 3) {
            v12 = @"None";
          }
          else {
            v12 = off_265375EB0[currentUserPrivilege - 1];
          }
          int v14 = 138543618;
          uint64_t v15 = v10;
          __int16 v16 = 2112;
          v17 = v12;
          _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Set current user privilege to %@ by getter", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    else
    {
      unint64_t currentUserPrivilege = 0;
    }
  }
  return currentUserPrivilege;
}

- (void)setCurrentUserPrivilege:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t currentUserPrivilege = self->_currentUserPrivilege;
  self->_unint64_t currentUserPrivilege = a3;
  os_unfair_lock_unlock(p_lock);
  v7 = (void *)MEMORY[0x2533B64D0]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    unint64_t v11 = (void *)v10;
    if (currentUserPrivilege - 1 > 2) {
      v12 = @"None";
    }
    else {
      v12 = off_265375EB0[currentUserPrivilege - 1];
    }
    if (a3 - 1 > 2) {
      v13 = @"None";
    }
    else {
      v13 = off_265375EB0[a3 - 1];
    }
    int v14 = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Set current user privilege from %@ to %@", (uint8_t *)&v14, 0x20u);
  }
}

- (HMMTRAccessControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMMTRAccessControl;
  result = [(HMMTRAccessControl *)&v3 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_unint64_t currentUserPrivilege = 0;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_5570 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_5570, &__block_literal_global_5571);
  }
  v2 = (void *)logCategory__hmf_once_v3_5572;
  return v2;
}

uint64_t __33__HMMTRAccessControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_5572;
  logCategory__hmf_once_v3_5572 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end