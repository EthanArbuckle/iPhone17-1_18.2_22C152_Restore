@interface _HMAccessorySettingGroup
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
+ (id)supportedGroupsClasses;
+ (id)supportedSettingsClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeGroups:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)mergeSettings:(id)a3;
- (HMAccessorySettings)accessorySettings;
- (NSArray)groups;
- (NSArray)settings;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (_HMAccessorySettingGroup)init;
- (_HMAccessorySettingGroup)initWithCoder:(id)a3;
- (_HMAccessorySettingGroup)initWithName:(id)a3;
- (_HMAccessorySettingGroupDelegate)delegate;
- (_HMContext)context;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)logIdentifier;
- (id)messageDestination;
- (id)shortDescription;
- (unint64_t)hash;
- (void)_unconfigure;
- (void)_unconfigureContext;
- (void)addGroup:(id)a3;
- (void)addSetting:(id)a3;
- (void)configureWithAccessorySettings:(id)a3 context:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDelegateOfAddedGroup:(id)a3;
- (void)notifyDelegateOfAddedSetting:(id)a3;
- (void)notifyDelegateOfRemovedGroup:(id)a3;
- (void)notifyDelegateOfRemovedSetting:(id)a3;
- (void)removeGroup:(id)a3;
- (void)removeSetting:(id)a3;
- (void)resetGroups;
- (void)resetSettings;
- (void)setAccessorySettings:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _HMAccessorySettingGroup

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessorySettings);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setAccessorySettings:(id)a3
{
}

- (HMAccessorySettings)accessorySettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessorySettings);

  return (HMAccessorySettings *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (_HMAccessorySettingGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMAccessorySettingGroupDelegate *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HMAccessorySettingGroup *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  v6 = [(_HMAccessorySettingGroup *)self name];
  [v4 encodeObject:v6 forKey:@"HM.name"];

  v7 = [(_HMAccessorySettingGroup *)self settings];
  [v4 encodeObject:v7 forKey:@"HM.settings"];

  id v8 = [(_HMAccessorySettingGroup *)self groups];
  [v4 encodeObject:v8 forKey:@"HM.groups"];
}

- (_HMAccessorySettingGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  v6 = [(_HMAccessorySettingGroup *)self initWithName:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = +[_HMAccessorySettingGroup supportedSettingsClasses];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HM.settings"];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
      settings = v6->_settings;
      v6->_settings = (NSMutableSet *)v11;
    }
    v13 = +[_HMAccessorySettingGroup supportedGroupsClasses];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HM.groups"];

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA80] setWithArray:v14];
      groups = v6->_groups;
      v6->_groups = (NSMutableSet *)v15;
    }
  }

  return v6;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMAccessorySettingGroup *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (BOOL)mergeGroups:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(_HMAccessorySettingGroup *)self groups];
  uint64_t v7 = [v5 setWithArray:v6];

  v39 = v4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v40 = v7;
  v9 = (void *)[v7 mutableCopy];
  [v9 minusSet:v8];
  if ([v9 count])
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      __int16 v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing groups: %@", buf, 0x16u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
    int v16 = v15 != 0;
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v14);
          }
          [(_HMAccessorySettingGroup *)v11 removeGroup:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v17);
    }
  }
  else
  {
    int v16 = 0;
  }
  v20 = (void *)[v8 mutableCopy];
  [v20 minusSet:v40];
  if ([v20 count])
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v24;
      __int16 v58 = 2112;
      v59 = v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding groups: %@", buf, 0x16u);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v25 = v20;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          [(_HMAccessorySettingGroup *)v22 addGroup:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v27);
      int v16 = 1;
    }
  }
  v30 = (void *)[v40 mutableCopy];
  [v30 minusSet:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        v37 = [v8 member:v36];
        if (v37) {
          v16 |= [v36 mergeObject:v37];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }

  return v16 & 1;
}

- (BOOL)mergeSettings:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(_HMAccessorySettingGroup *)self settings];
  uint64_t v7 = [v5 setWithArray:v6];

  v39 = v4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v40 = v7;
  v9 = (void *)[v7 mutableCopy];
  [v9 minusSet:v8];
  if ([v9 count])
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      __int16 v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing settings: %@", buf, 0x16u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
    int v16 = v15 != 0;
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v14);
          }
          [(_HMAccessorySettingGroup *)v11 removeSetting:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v17);
    }
  }
  else
  {
    int v16 = 0;
  }
  v20 = (void *)[v8 mutableCopy];
  [v20 minusSet:v40];
  if ([v20 count])
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v24;
      __int16 v58 = 2112;
      v59 = v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding settings: %@", buf, 0x16u);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v25 = v20;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          [(_HMAccessorySettingGroup *)v22 addSetting:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v27);
      int v16 = 1;
    }
  }
  v30 = (void *)[v40 mutableCopy];
  [v30 minusSet:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        v37 = [v8 member:v36];
        if (v37) {
          v16 |= [v36 mergeObject:v37];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }

  return v16 & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 settings];
    BOOL v9 = [(_HMAccessorySettingGroup *)self mergeSettings:v8];

    v10 = [v7 groups];
    BOOL v11 = [(_HMAccessorySettingGroup *)self mergeGroups:v10];

    BOOL v12 = v11 || v9;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)logIdentifier
{
  v2 = [(_HMAccessorySettingGroup *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)notifyDelegateOfRemovedGroup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removed group: %@", (uint8_t *)&v10, 0x16u);
  }
  BOOL v9 = [(_HMAccessorySettingGroup *)v6 delegate];
  [v9 _settingGroup:v6 didRemoveSettingGroup:v4];
}

- (void)removeGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_groups containsObject:v5])
    {
      [(NSMutableSet *)self->_groups removeObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySettingGroup *)self notifyDelegateOfRemovedGroup:v5];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notifyDelegateOfAddedGroup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Added group: %@", (uint8_t *)&v10, 0x16u);
  }
  BOOL v9 = [(_HMAccessorySettingGroup *)v6 delegate];
  [v9 _settingGroup:v6 didAddSettingGroup:v4];
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_groups containsObject:v8])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableSet *)self->_groups addObject:v8];
      id v5 = [(_HMAccessorySettingGroup *)self context];
      if (v5)
      {
        id v6 = [(_HMAccessorySettingGroup *)self accessorySettings];
        uint64_t v7 = [(_HMAccessorySettingGroup *)self context];
        [v8 configureWithAccessorySettings:v6 context:v7];
      }
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySettingGroup *)self notifyDelegateOfAddedGroup:v8];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)resetGroups
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_groups removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)groups
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_groups allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)notifyDelegateOfRemovedSetting:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removed setting: %@", (uint8_t *)&v10, 0x16u);
  }
  BOOL v9 = [(_HMAccessorySettingGroup *)v6 delegate];
  [v9 _settingGroup:v6 didRemoveSetting:v4];
}

- (void)removeSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_settings containsObject:v5])
    {
      [(NSMutableSet *)self->_settings removeObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySettingGroup *)self notifyDelegateOfRemovedSetting:v5];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notifyDelegateOfAddedSetting:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Added setting: %@", (uint8_t *)&v10, 0x16u);
  }
  BOOL v9 = [(_HMAccessorySettingGroup *)v6 delegate];
  [v9 _settingGroup:v6 didAddSetting:v4];
}

- (void)addSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v7 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_settings containsObject:v7])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableSet *)self->_settings addObject:v7];
      id v5 = [(_HMAccessorySettingGroup *)self context];
      if (v5)
      {
        id v6 = [(_HMAccessorySettingGroup *)self accessorySettings];
        [v7 configureWithAccessorySettings:v6 context:v5];
      }
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySettingGroup *)self notifyDelegateOfAddedSetting:v7];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)resetSettings
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_settings removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)settings
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_settings allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)_unconfigure
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring accessorySettingGroup", buf, 0xCu);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v9 = [(_HMAccessorySettingGroup *)v5 settings];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v13++) unconfigure];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    [(_HMAccessorySettingGroup *)v5 resetSettings];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [(_HMAccessorySettingGroup *)v5 groups];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v18++) _unconfigure];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    [(_HMAccessorySettingGroup *)v5 resetGroups];
    [(_HMAccessorySettingGroup *)v5 _unconfigureContext];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v19;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);
    }
  }
}

- (void)_unconfigureContext
{
  id v3 = [(_HMAccessorySettingGroup *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  context = self->_context;
  self->_context = 0;
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v11;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", buf, 0x16u);
  }
  [(_HMAccessorySettingGroup *)v9 setAccessorySettings:v6];
  [(_HMAccessorySettingGroup *)v9 setContext:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [(_HMAccessorySettingGroup *)v9 settings];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v16++) configureWithAccessorySettings:v6 context:v7];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = [(_HMAccessorySettingGroup *)v9 groups];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v21++) configureWithAccessorySettings:v6 context:v7];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (NSString)description
{
  return (NSString *)[(_HMAccessorySettingGroup *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(_HMAccessorySettingGroup *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &stru_1EEE9DD88;
  }
  id v8 = [(_HMAccessorySettingGroup *)self identifier];
  BOOL v9 = [v8 UUIDString];
  uint64_t v10 = [(_HMAccessorySettingGroup *)self name];
  uint64_t v11 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Name = %@>", v6, v7, v9, v10];

  if (v3) {

  }
  return v11;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(_HMAccessorySettingGroup *)self name];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMAccessorySettingGroup *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(_HMAccessorySettingGroup *)self identifier];
      id v8 = [(_HMAccessorySettingGroup *)v6 identifier];
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
  v2 = [(_HMAccessorySettingGroup *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMAccessorySettingGroup)initWithName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)_HMAccessorySettingGroup;
    id v6 = [(_HMAccessorySettingGroup *)&v15 init];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v7;

      objc_storeStrong((id *)&v6->_name, a3);
      uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
      settings = v6->_settings;
      v6->_settings = (NSMutableSet *)v9;

      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      groups = v6->_groups;
      v6->_groups = (NSMutableSet *)v11;
    }
    self = v6;
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (_HMAccessorySettingGroup)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)supportedGroupsClasses
{
  if (supportedGroupsClasses_onceToken != -1) {
    dispatch_once(&supportedGroupsClasses_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)supportedGroupsClasses_supportedGroupsClasses;

  return v2;
}

+ (id)supportedSettingsClasses
{
  if (supportedSettingsClasses_onceToken != -1) {
    dispatch_once(&supportedSettingsClasses_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)supportedSettingsClasses_supportedSettingsClasses;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_35769 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_35769, &__block_literal_global_35770);
  }
  v2 = (void *)logCategory__hmf_once_v17_35771;

  return v2;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end