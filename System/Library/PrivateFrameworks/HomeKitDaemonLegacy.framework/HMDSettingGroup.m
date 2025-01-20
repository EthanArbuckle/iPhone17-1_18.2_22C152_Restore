@interface HMDSettingGroup
+ (BOOL)supportsSecureCoding;
- (HMDSettingGroup)initWithCoder:(id)a3;
- (HMDSettingGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 groups:(id)a6 settings:(id)a7;
- (HMDSettingGroup)initWithModel:(id)a3;
- (NSArray)groups;
- (NSArray)settings;
- (NSMutableSet)groupsInternal;
- (NSMutableSet)settingsInternal;
- (NSString)keyPath;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (void)addGroup:(id)a3;
- (void)addSetting:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupsInternal:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setSettingsInternal:(id)a3;
@end

@implementation HMDSettingGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsInternal, 0);
  objc_storeStrong((id *)&self->_settingsInternal, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setGroupsInternal:(id)a3
{
}

- (NSMutableSet)groupsInternal
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettingsInternal:(id)a3
{
}

- (NSMutableSet)settingsInternal
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v5 = [(HMDSettingGroup *)self parentIdentifier];
    [v4 encodeObject:v5 forKey:@"HM.S.ParentID"];

    v6 = [(HMDSettingGroup *)self identifier];
    [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2C5B0]];

    v7 = [(HMDSettingGroup *)self name];
    [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2C5B8]];

    v8 = [(HMDSettingGroup *)self groups];
    [v4 encodeObject:v8 forKey:*MEMORY[0x1E4F2C5A8]];

    v9 = [(HMDSettingGroup *)self settings];
    [v4 encodeObject:v9 forKey:*MEMORY[0x1E4F2C5C0]];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not encode group as transport is not XPC.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (HMDSettingGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)addGroup:(id)a3
{
  id v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDSettingGroup *)self groupsInternal];
  [v5 addObject:v9];

  uint64_t v6 = [(HMDSettingGroup *)self keyPath];
  v7 = [v9 name];
  v8 = [v6 stringByAppendingFormat:@".%@", v7];
  [v9 setKeyPath:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)addSetting:(id)a3
{
  id v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDSettingGroup *)self settingsInternal];
  [v5 addObject:v9];

  uint64_t v6 = [(HMDSettingGroup *)self keyPath];
  v7 = [v9 name];
  v8 = [v6 stringByAppendingFormat:@".%@", v7];
  [v9 setKeyPath:v8];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)groups
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDSettingGroup *)self groupsInternal];
  v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDSettingGroup *)self settingsInternal];
  v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (HMDSettingGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 groups:(id)a6 settings:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HMDSettingGroup;
  v17 = [(HMDSettingGroup *)&v32 init];
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [v14 copy];
    name = v18->_name;
    v18->_name = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    keyPath = v18->_keyPath;
    v18->_keyPath = (NSString *)v21;

    uint64_t v23 = [v12 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v23;

    uint64_t v25 = [v13 copy];
    parentIdentifier = v18->_parentIdentifier;
    v18->_parentIdentifier = (NSUUID *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA80] setWithArray:v15];
    groupsInternal = v18->_groupsInternal;
    v18->_groupsInternal = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA80] setWithArray:v16];
    settingsInternal = v18->_settingsInternal;
    v18->_settingsInternal = (NSMutableSet *)v29;
  }
  return v18;
}

- (HMDSettingGroup)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v4 hmbModelID];

  if (v6)
  {
    uint64_t v7 = [v4 hmbModelID];

    v5 = (void *)v7;
  }
  v8 = [v4 hmbParentModelID];
  id v9 = [v4 name];
  id v10 = [(HMDSettingGroup *)self initWithIdentifier:v5 parentIdentifier:v8 name:v9 groups:MEMORY[0x1E4F1CBF0] settings:MEMORY[0x1E4F1CBF0]];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end