@interface HMAccessorySettingGroup
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReflectedEqual:(id)a3;
- (HMAccessorySettingGroup)accessorySettingGroupWithKeyPath:(id)a3;
- (HMAccessorySettingGroup)group;
- (HMAccessorySettingGroup)init;
- (HMAccessorySettingGroup)initWithInternal:(id)a3;
- (HMAccessorySettingGroup)initWithKeyPath:(id)a3;
- (NSArray)groups;
- (NSArray)settings;
- (NSString)localizedTitle;
- (_HMAccessorySettingGroup)internal;
- (id)accessorySettingWithKeyPath:(id)a3;
- (id)keyPath;
- (unint64_t)hash;
- (void)_notifyClientOfAddedGroup:(id)a3;
- (void)_notifyClientOfAddedSetting:(id)a3;
- (void)_notifyClientOfRemovedGroup:(id)a3;
- (void)_notifyClientOfRemovedSetting:(id)a3;
- (void)_settingGroup:(id)a3 didAddSetting:(id)a4;
- (void)_settingGroup:(id)a3 didAddSettingGroup:(id)a4;
- (void)_settingGroup:(id)a3 didRemoveSetting:(id)a4;
- (void)_settingGroup:(id)a3 didRemoveSettingGroup:(id)a4;
- (void)addGroup:(id)a3;
- (void)addSetting:(id)a3;
- (void)mergeReflected:(id)a3;
- (void)removeGroup:(id)a3;
- (void)removeSetting:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation HMAccessorySettingGroup

void __50___HMAccessorySettingGroup_supportedGroupsClasses__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)supportedGroupsClasses_supportedGroupsClasses;
  supportedGroupsClasses_supportedGroupsClasses = v2;
}

void __52___HMAccessorySettingGroup_supportedSettingsClasses__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)supportedSettingsClasses_supportedSettingsClasses;
  supportedSettingsClasses_supportedSettingsClasses = v2;
}

uint64_t __39___HMAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_35771;
  logCategory__hmf_once_v17_35771 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setGroup:(id)a3
{
}

- (HMAccessorySettingGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (HMAccessorySettingGroup *)WeakRetained;
}

- (_HMAccessorySettingGroup)internal
{
  return (_HMAccessorySettingGroup *)objc_getProperty(self, a2, 80, 1);
}

- (id)accessorySettingWithKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySettingGroup *)self settings];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup_accessorySettingWithKeyPath___block_invoke;
  v9[3] = &unk_1E5942AC8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __55__HMAccessorySettingGroup_accessorySettingWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [a2 keyPath];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (HMAccessorySettingGroup)accessorySettingGroupWithKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySettingGroup *)self groups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HMAccessorySettingGroup_accessorySettingGroupWithKeyPath___block_invoke;
  v9[3] = &unk_1E5942AA0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return (HMAccessorySettingGroup *)v7;
}

uint64_t __60__HMAccessorySettingGroup_accessorySettingGroupWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [a2 keyPath];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void)_settingGroup:(id)a3 didRemoveSettingGroup:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(HMAccessorySettingGroup *)self groups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 internal];
        int v13 = [v12 isEqual:v5];

        if (v13)
        {
          [(HMAccessorySettingGroup *)self removeGroup:v11];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_settingGroup:(id)a3 didAddSettingGroup:(id)a4
{
  id v5 = a4;
  id v6 = [[HMAccessorySettingGroup alloc] initWithInternal:v5];

  [(HMAccessorySettingGroup *)self addGroup:v6];
}

- (void)_settingGroup:(id)a3 didRemoveSetting:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(HMAccessorySettingGroup *)self settings];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 internal];
        int v13 = [v12 isEqual:v5];

        if (v13)
        {
          [(HMAccessorySettingGroup *)self removeSetting:v11];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_settingGroup:(id)a3 didAddSetting:(id)a4
{
  uint64_t v5 = +[HMAccessorySetting settingForInternal:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(HMAccessorySettingGroup *)self addSetting:v5];
    uint64_t v6 = v7;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_notifyClientOfRemovedGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMAccessorySettingGroup *)self internal];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 delegateCaller];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup__notifyClientOfRemovedGroup___block_invoke;
  v9[3] = &unk_1E5945628;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 invokeBlock:v9];
}

void __55__HMAccessorySettingGroup__notifyClientOfRemovedGroup___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    long long v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed group: %@", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11 = @"group";
  uint64_t v12 = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 postNotificationName:@"HMAccessorySettingGroupRemovedNotification" object:v9 userInfo:v10];
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
      [v5 setGroup:0];
      os_unfair_lock_unlock(&self->_lock);
      [(HMAccessorySettingGroup *)self _notifyClientOfRemovedGroup:v5];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    id v4 = v5;
  }
}

- (void)_notifyClientOfAddedGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySettingGroup *)self internal];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 delegateCaller];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HMAccessorySettingGroup__notifyClientOfAddedGroup___block_invoke;
  v9[3] = &unk_1E5945628;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 invokeBlock:v9];
}

void __53__HMAccessorySettingGroup__notifyClientOfAddedGroup___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    long long v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added group: %@", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11 = @"group";
  uint64_t v12 = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 postNotificationName:@"HMAccessorySettingGroupAddedNotification" object:v9 userInfo:v10];
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_groups containsObject:v5])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableSet *)self->_groups addObject:v5];
      [v5 setGroup:self];
      os_unfair_lock_unlock(&self->_lock);
      [(HMAccessorySettingGroup *)self _notifyClientOfAddedGroup:v5];
    }
    id v4 = v5;
  }
}

- (NSArray)groups
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_groups allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)_notifyClientOfRemovedSetting:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySettingGroup *)self internal];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 delegateCaller];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HMAccessorySettingGroup__notifyClientOfRemovedSetting___block_invoke;
  v9[3] = &unk_1E5945628;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 invokeBlock:v9];
}

void __57__HMAccessorySettingGroup__notifyClientOfRemovedSetting___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    long long v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed setting: %@", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11 = @"setting";
  uint64_t v12 = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 postNotificationName:@"HMAccessorySettingRemovedNotification" object:v9 userInfo:v10];
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
      [v5 setGroup:0];
      os_unfair_lock_unlock(&self->_lock);
      [(HMAccessorySettingGroup *)self _notifyClientOfRemovedSetting:v5];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    id v4 = v5;
  }
}

- (void)_notifyClientOfAddedSetting:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySettingGroup *)self internal];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 delegateCaller];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup__notifyClientOfAddedSetting___block_invoke;
  v9[3] = &unk_1E5945628;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 invokeBlock:v9];
}

void __55__HMAccessorySettingGroup__notifyClientOfAddedSetting___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    long long v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added setting: %@", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11 = @"setting";
  uint64_t v12 = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 postNotificationName:@"HMAccessorySettingAddedNotification" object:v9 userInfo:v10];
}

- (void)addSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_settings containsObject:v5])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableSet *)self->_settings addObject:v5];
      [v5 setGroup:self];
      os_unfair_lock_unlock(&self->_lock);
      [(HMAccessorySettingGroup *)self _notifyClientOfAddedSetting:v5];
    }
    id v4 = v5;
  }
}

- (NSArray)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_settings allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)keyPath
{
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = [(HMAccessorySettingGroup *)self group];
  id v5 = [v4 keyPath];

  uint64_t v6 = [(HMAccessorySettingGroup *)self internal];
  uint64_t v7 = [v6 name];
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = [v5 stringByAppendingFormat:@".%@", v7];
  }
  else
  {
    uint64_t v9 = [v7 copy];
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)mergeReflected:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v4 = [v23 groups];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [(HMAccessorySettingGroup *)self groups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v10 keyPath];
        uint64_t v12 = objc_msgSend(v4, "hmf_firstObjectWithValue:forKeyPath:", v11, @"keyPath");

        if (v12) {
          [v10 mergeReflected:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  int v13 = [v23 settings];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v14 = [(HMAccessorySettingGroup *)self settings];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        v20 = [v19 keyPath];
        v21 = objc_msgSend(v13, "hmf_firstObjectWithValue:forKeyPath:", v20, @"keyPath");

        if (v21)
        {
          int v22 = [v19 isReflected];
          if (v22 != [v21 isReflected]) {
            objc_msgSend(v19, "updateReflected:", objc_msgSend(v21, "isReflected"));
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
}

- (BOOL)isReflectedEqual:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x19F3A64A0]();
  long long v25 = v4;
  id v5 = [v4 groups];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [(HMAccessorySettingGroup *)self groups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [v11 keyPath];
        int v13 = objc_msgSend(v5, "hmf_firstObjectWithValue:forKeyPath:", v12, @"keyPath");

        if (v13 && ![v11 isReflectedEqual:v13])
        {
LABEL_21:
          BOOL v22 = 0;
          goto LABEL_22;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = [v25 settings];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v13 = [(HMAccessorySettingGroup *)self settings];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v19 = [v18 keyPath];
        v20 = objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v19, @"keyPath");

        if (v20)
        {
          int v21 = [v18 isReflected];
          if (v21 != [v20 isReflected])
          {

            goto LABEL_21;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      BOOL v22 = 1;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v22 = 1;
  }
LABEL_22:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessorySettingGroup *)a3;
  if (self == v4)
  {
    char v15 = 1;
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
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v7 = [(HMAccessorySettingGroup *)self keyPath];
    uint64_t v8 = [(HMAccessorySettingGroup *)v6 keyPath];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      goto LABEL_9;
    }
    id v10 = [(HMAccessorySettingGroup *)self groups];
    v11 = [(HMAccessorySettingGroup *)v6 groups];
    int v12 = [v10 isEqualToArray:v11];

    if (v12)
    {
      int v13 = [(HMAccessorySettingGroup *)self settings];
      uint64_t v14 = [(HMAccessorySettingGroup *)v6 settings];
      char v15 = [v13 isEqualToArray:v14];
    }
    else
    {
LABEL_9:
      char v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMAccessorySettingGroup *)self internal];
  id v3 = [v2 name];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (NSString)localizedTitle
{
  uint64_t v2 = [(HMAccessorySettingGroup *)self keyPath];
  id v3 = +[HMAccessorySettings localizationKeyForKeyPath:v2];

  unint64_t v4 = +[HMLocalization sharedManager];
  id v5 = [v4 getLocalizedString:v3];

  return (NSString *)v5;
}

- (HMAccessorySettingGroup)initWithInternal:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v39.receiver = self;
    v39.super_class = (Class)HMAccessorySettingGroup;
    uint64_t v6 = [(HMAccessorySettingGroup *)&v39 init];
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_internal, a3);
      [v5 setDelegate:p_isa];
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      id v9 = p_isa[8];
      p_isa[8] = (id)v8;

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v10 = [v5 settings];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v10);
            }
            char v15 = +[HMAccessorySetting settingForInternal:*(void *)(*((void *)&v35 + 1) + 8 * i)];
            uint64_t v16 = v15;
            if (v15)
            {
              [v15 setGroup:p_isa];
              [p_isa[8] addObject:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v12);
      }

      uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
      id v18 = p_isa[9];
      p_isa[9] = (id)v17;

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v19 = objc_msgSend(v5, "groups", 0);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = [[HMAccessorySettingGroup alloc] initWithInternal:*(void *)(*((void *)&v31 + 1) + 8 * j)];
            long long v25 = v24;
            if (v24)
            {
              [(HMAccessorySettingGroup *)v24 setGroup:p_isa];
              [p_isa[9] addObject:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v21);
      }
    }
    self = p_isa;
    long long v26 = self;
  }
  else
  {
    long long v27 = (void *)MEMORY[0x19F3A64A0]();
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to create setting group controller without internal object", buf, 0xCu);
    }
    long long v26 = 0;
  }

  return v26;
}

- (HMAccessorySettingGroup)initWithKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [[_HMAccessorySettingGroup alloc] initWithName:v4];

  uint64_t v6 = [(HMAccessorySettingGroup *)self initWithInternal:v5];
  return v6;
}

- (HMAccessorySettingGroup)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35 != -1) {
    dispatch_once(&logCategory__hmf_once_t35, &__block_literal_global_211);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v36;

  return v2;
}

uint64_t __38__HMAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v36;
  logCategory__hmf_once_long long v36 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end