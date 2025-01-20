@interface HMSettingGroup
+ (BOOL)supportsSecureCoding;
- (HMSettingGroup)initWithCoder:(id)a3;
- (HMSettingGroup)initWithIdentifier:(id)a3 name:(id)a4 groups:(id)a5 settings:(id)a6;
- (HMSettingGroup)settingGroupWithKeyPath:(id)a3;
- (NSArray)groups;
- (NSArray)settings;
- (NSString)keyPath;
- (NSString)localizedTitle;
- (NSString)name;
- (NSUUID)identifier;
- (id)description;
- (id)longDescription;
- (unint64_t)hash;
- (void)_longDescriptionWithCurrentGroup:(id)a3 currentSettings:(id)a4;
- (void)addGroup:(id)a3;
- (void)addSetting:(id)a3;
- (void)fixNestedKeyPaths;
- (void)setKeyPath:(id)a3;
@end

@implementation HMSettingGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMSettingGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HM.groups"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HM.settings"];

  v15 = [(HMSettingGroup *)self initWithIdentifier:v6 name:v5 groups:v10 settings:v14];
  return v15;
}

- (void)_longDescriptionWithCurrentGroup:(id)a3 currentSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 settings];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke;
  v14[3] = &unk_1E5940350;
  id v9 = v6;
  id v15 = v9;
  objc_msgSend(v8, "na_each:", v14);

  v10 = [v7 groups];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke_2;
  v12[3] = &unk_1E59403A0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  objc_msgSend(v10, "na_each:", v12);
}

void __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  v5 = [v3 value];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  id v7 = [v8 keyPath];
  [v4 setObject:v6 forKey:v7];

  if (!v5) {
}
  }

uint64_t __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _longDescriptionWithCurrentGroup:a2 currentSettings:*(void *)(a1 + 40)];
}

- (id)longDescription
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(HMSettingGroup *)self _longDescriptionWithCurrentGroup:self currentSettings:v3];
  id v4 = [NSString stringWithFormat:@"[%@ settings: %@]", objc_opt_class(), v3];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMSettingGroup *)self keyPath];
  id v6 = [v3 stringWithFormat:@"[%@ keyPath: %@]", v4, v5];

  return v6;
}

- (void)fixNestedKeyPaths
{
  id v3 = [(HMSettingGroup *)self groups];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HMSettingGroup_fixNestedKeyPaths__block_invoke;
  v6[3] = &unk_1E5940328;
  v6[4] = self;
  objc_msgSend(v3, "na_each:", v6);

  uint64_t v4 = [(HMSettingGroup *)self settings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__HMSettingGroup_fixNestedKeyPaths__block_invoke_2;
  v5[3] = &unk_1E5940350;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);
}

void __35__HMSettingGroup_fixNestedKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v4 = [v3 keyPath];
  v5 = [v7 name];
  id v6 = [v2 stringWithFormat:@"%@.%@", v4, v5];
  [v7 setKeyPath:v6];

  [v7 fixNestedKeyPaths];
}

void __35__HMSettingGroup_fixNestedKeyPaths__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 keyPath];
  v5 = [v4 name];
  id v6 = [v2 stringWithFormat:@"%@.%@", v7, v5];
  [v4 setKeyPath:v6];
}

- (void)setKeyPath:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  keyPath = self->_keyPath;
  self->_keyPath = v4;

  os_unfair_lock_unlock(&self->_lock);

  [(HMSettingGroup *)self fixNestedKeyPaths];
}

- (NSString)keyPath
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_keyPath;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMSettingGroup)settingGroupWithKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(HMSettingGroup *)self groups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__HMSettingGroup_settingGroupWithKeyPath___block_invoke;
  v9[3] = &unk_1E5940378;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return (HMSettingGroup *)v7;
}

uint64_t __42__HMSettingGroup_settingGroupWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 keyPath];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void)addSetting:(id)a3
{
  id v11 = a3;
  uint64_t v4 = NSString;
  v5 = [(HMSettingGroup *)self keyPath];
  id v6 = [v11 name];
  id v7 = [v4 stringWithFormat:@"%@.%@", v5, v6];
  [v11 setKeyPath:v7];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settings = self->_settings;
  id v10 = [v11 name];
  [(NSMutableDictionary *)settings setObject:v11 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (void)addGroup:(id)a3
{
  id v11 = a3;
  uint64_t v4 = NSString;
  v5 = [(HMSettingGroup *)self keyPath];
  id v6 = [v11 name];
  id v7 = [v4 stringWithFormat:@"%@.%@", v5, v6];
  [v11 setKeyPath:v7];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  groups = self->_groups;
  id v10 = [v11 name];
  [(NSMutableDictionary *)groups setObject:v11 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableDictionary *)self->_settings allValues];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSArray)groups
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableDictionary *)self->_groups allValues];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (unint64_t)hash
{
  v2 = [(HMSettingGroup *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)localizedTitle
{
  v2 = [(HMSettingGroup *)self keyPath];
  unint64_t v3 = +[HMAccessorySettings localizationKeyForKeyPath:v2];

  uint64_t v4 = +[HMLocalization sharedManager];
  v5 = [v4 getLocalizedString:v3];

  return (NSString *)v5;
}

- (HMSettingGroup)initWithIdentifier:(id)a3 name:(id)a4 groups:(id)a5 settings:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMSettingGroup;
  id v15 = [(HMSettingGroup *)&v28 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    settings = v16->_settings;
    v16->_settings = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groups = v16->_groups;
    v16->_groups = v19;

    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    keyPath = v16->_keyPath;
    v16->_keyPath = (NSString *)@"root";

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke;
    v26[3] = &unk_1E5940328;
    v22 = v16;
    v27 = v22;
    objc_msgSend(v13, "na_each:", v26);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke_3;
    v24[3] = &unk_1E5940350;
    v25 = v22;
    objc_msgSend(v14, "na_each:", v24);
  }
  return v16;
}

void __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v3 && (isKindOfClass & 1) != 0)
  {
    [*(id *)(a1 + 32) addGroup:v3];
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding group", (uint8_t *)&v9, 0xCu);
    }
  }
}

void __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v3 && (isKindOfClass & 1) != 0)
  {
    [*(id *)(a1 + 32) addSetting:v3];
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding setting", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end