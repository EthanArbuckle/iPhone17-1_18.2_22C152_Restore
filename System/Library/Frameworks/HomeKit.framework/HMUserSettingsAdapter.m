@interface HMUserSettingsAdapter
+ (id)logCategory;
+ (id)privateSettingsSchema;
+ (id)sharedSettingsSchema;
- (BOOL)didEverSentOutSettingsDidUpdate;
- (BOOL)mergeUsingPreOrder:(id)a3 withDictionary:(id)a4;
- (HMSettingGroup)rootGroup;
- (HMSettings)settings;
- (HMSettingsDelegate)delegate;
- (HMUser)user;
- (HMUserSettingsAdapter)initWithUser:(id)a3 settingsType:(int64_t)a4;
- (_HMContext)context;
- (id)appendKeyPath:(id)a3 withNextKey:(id)a4;
- (id)createKeyPathArrayWithKeyPath:(id)a3;
- (id)findOrAddUserSettingGroupWithKeyPath:(id)a3;
- (id)groupKeyArrayFromKeyPath:(id)a3;
- (id)settingKeyFromKeyPath:(id)a3;
- (int64_t)type;
- (void)_notifyDelegateDidUpdateKeyPath:(id)a3;
- (void)_notifyDelegateSettingsDidUpdate;
- (void)configureWithContext:(id)a3;
- (void)createRootSettingGroup;
- (void)mergeWithDictionary:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEverSentOutSettingsDidUpdate:(BOOL)a3;
- (void)setRootGroup:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUser:(id)a3;
- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation HMUserSettingsAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);

  objc_destroyWeak((id *)&self->delegate);
}

- (void)setDidEverSentOutSettingsDidUpdate:(BOOL)a3
{
  self->_didEverSentOutSettingsDidUpdate = a3;
}

- (BOOL)didEverSentOutSettingsDidUpdate
{
  return self->_didEverSentOutSettingsDidUpdate;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setUser:(id)a3
{
}

- (HMUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);

  return (HMUser *)WeakRetained;
}

- (HMSettings)settings
{
  return (HMSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRootGroup:(id)a3
{
}

- (HMSettingGroup)rootGroup
{
  return (HMSettingGroup *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HMSettingsDelegate *)WeakRetained;
}

- (void)_notifyDelegateSettingsDidUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMUserSettingsAdapter *)self context];
  v4 = [v3 queue];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not notifying for updated settings due to nil queue", buf, 0xCu);
    }
  }
}

void __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];

  if (v3)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke_2;
    v8[3] = &unk_1E59455B8;
    objc_copyWeak(&v9, location);
    [v3 invokeBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", (uint8_t *)location, 0xCu);
    }
  }
}

void __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [v4 settings];
    int v9 = 138543874;
    v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    v14 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update settings: %@ delegate: %@", (uint8_t *)&v9, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = [v4 settings];
    [v2 settingsDidUpdate:v8];
  }
}

- (void)_notifyDelegateDidUpdateKeyPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUserSettingsAdapter *)self context];
  v6 = [v5 queue];

  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke;
    v11[3] = &unk_1E5945628;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v6, v11);
  }
  else
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not notifying updated setting keypath: %@ due to nil queue", buf, 0x16u);
    }
  }
}

void __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];

  if (v3)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke_2;
    v9[3] = &unk_1E59449A0;
    objc_copyWeak(&v11, (id *)location);
    id v10 = *(id *)(a1 + 40);
    [v3 invokeBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)location = 138543618;
      *(void *)&id location[4] = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated setting keypath: %@", location, 0x16u);
    }
  }
}

void __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = [WeakRetained user];
    v6 = [v5 uuid];
    v7 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v6);

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v9 settings];
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138544386;
      id v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@ delegate: %@", (uint8_t *)&v15, 0x34u);
    }
    uint64_t v14 = [v9 settings];
    [v3 settings:v14 didUpdateForIdentifier:v7 keyPath:*(void *)(a1 + 32)];
  }
}

- (BOOL)mergeUsingPreOrder:(id)a3 withDictionary:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v37 = self;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v33 = v6;
    uint64_t v8 = [v6 settings];
    uint64_t v38 = [v8 countByEnumeratingWithState:&v43 objects:v52 count:16];
    int v9 = 0;
    if (v38)
    {
      uint64_t v10 = *(void *)v44;
      v34 = v8;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v13 = [v12 keyPath];
          uint64_t v14 = [v7 objectForKeyedSubscript:v13];
          if (v14)
          {
            int v15 = [v12 value];
            char v16 = HMFEqualObjects();

            if ((v16 & 1) == 0)
            {
              id v17 = v12;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v18 = v17;
              }
              else {
                v18 = 0;
              }
              id v19 = v18;

              if (v19)
              {
                v20 = (void *)MEMORY[0x19F3A64A0]([v19 setValue:v14]);
                __int16 v21 = v37;
                uint64_t v22 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  __int16 v23 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v49 = v23;
                  __int16 v50 = 2112;
                  id v51 = v19;
                  _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Merged setting: %@", buf, 0x16u);

                  uint64_t v8 = v34;
                }

                [(HMUserSettingsAdapter *)v21 _notifyDelegateDidUpdateKeyPath:v13];
                int v9 = 1;
              }
              else
              {
                context = (void *)MEMORY[0x19F3A64A0]();
                v24 = v37;
                uint64_t v25 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v26 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v49 = v26;
                  __int16 v50 = 2112;
                  id v51 = v17;
                  _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Looks like we have non number setting. Need to handle that. %@", buf, 0x16u);

                  uint64_t v8 = v34;
                }
              }

              uint64_t v10 = v36;
            }
          }
        }
        uint64_t v38 = [v8 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v38);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = v33;
    v27 = [v33 groups];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v9 |= [(HMUserSettingsAdapter *)v37 mergeUsingPreOrder:*(void *)(*((void *)&v39 + 1) + 8 * j) withDictionary:v7];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v29);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (void)mergeWithDictionary:(id)a3
{
  id v4 = a3;
  if ([(HMUserSettingsAdapter *)self didEverSentOutSettingsDidUpdate])
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
    [(HMUserSettingsAdapter *)self setDidEverSentOutSettingsDidUpdate:1];
  }
  id v6 = [(HMUserSettingsAdapter *)self rootGroup];
  BOOL v7 = [(HMUserSettingsAdapter *)self mergeUsingPreOrder:v6 withDictionary:v4];

  if (v5 | v7)
  {
    [(HMUserSettingsAdapter *)self _notifyDelegateSettingsDidUpdate];
  }
}

- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (char *)a3;
  int v9 = (char *)a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v68 = v14;
    __int16 v69 = 2112;
    v70 = v8;
    __int16 v71 = 2112;
    v72 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Ask to update value for [%@] to [%@]", buf, 0x20u);
  }
  uint64_t v15 = [(HMUserSettingsAdapter *)v12 context];
  if (!v10)
  {
    uint64_t v47 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUserSettingsAdapter updateValueForSetting:value:completionHandler:]", @"completionHandler"];
    v48 = (void *)MEMORY[0x19F3A64A0]();
    v49 = v12;
    __int16 v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v68 = v51;
      __int16 v69 = 2112;
      v70 = (const char *)v47;
      _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v52 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v47 userInfo:0];
    objc_exception_throw(v52);
  }
  char v16 = (void *)v15;
  if (v15)
  {
    id v17 = [(HMUserSettingsAdapter *)v12 user];
    if (v17)
    {
      if (([v8 properties] & 2) == 0)
      {
        id v18 = [v16 delegateCaller];
        id v19 = (void *)MEMORY[0x1E4F28C58];
        v20 = @"User Setting is not writable";
        __int16 v21 = @"UserSetting is not writable";
        uint64_t v22 = 48;
LABEL_19:
        uint64_t v30 = [v19 hmErrorWithCode:v22 description:v20 reason:v21 suggestion:0];
        [v18 callCompletion:v10 error:v30];
        goto LABEL_20;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v9 && (isKindOfClass & 1) != 0)
      {
        if ([v8 doesValueConformToConstraints:v9])
        {
          uint64_t v28 = [v8 value];
          int v29 = HMFEqualObjects();

          if (v29)
          {
            id v18 = [v16 delegateCaller];
            [v18 callCompletion:v10 error:0];
          }
          else
          {
            id v18 = [[HMSettingValue alloc] initNumberSettingWithValue:v9];
            id v64 = 0;
            uint64_t v35 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v64];
            v56 = (void *)v35;
            id v57 = v64;
            if (v35)
            {
              v66[0] = v35;
              v65[0] = @"value";
              v65[1] = @"keyPath";
              v54 = [v8 keyPath];
              v66[1] = v54;
              v65[2] = @"SettingTargetType";
              uint64_t v53 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMUserSettingsAdapter type](v12, "type"));
              v66[2] = v53;
              v65[3] = @"kUserUUIDKey";
              uint64_t v36 = [v17 uuid];
              v37 = [v36 UUIDString];
              v66[3] = v37;
              uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];

              long long v39 = [v17 home];
              long long v40 = [v39 uuid];
              v58[0] = MEMORY[0x1E4F143A8];
              v58[1] = 3221225472;
              v58[2] = __71__HMUserSettingsAdapter_updateValueForSetting_value_completionHandler___block_invoke;
              v58[3] = &unk_1E593EA88;
              v58[4] = v12;
              id v59 = v17;
              v60 = v8;
              v61 = v9;
              id v62 = v16;
              id v63 = v10;
              -[_HMContext sendMessage:target:payload:responseHandler:](v62, @"HMS.uv", v40, v38, v58);

              long long v41 = v56;
            }
            else
            {
              long long v42 = (void *)MEMORY[0x19F3A64A0]();
              long long v43 = v12;
              long long v44 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                long long v45 = v55 = v42;
                *(_DWORD *)buf = 138544130;
                v68 = v45;
                __int16 v69 = 2112;
                v70 = v9;
                __int16 v71 = 2112;
                v72 = v8;
                __int16 v73 = 2112;
                id v74 = v57;
                _os_log_impl(&dword_19D1A8000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain encoded setting value %@ for setting %@. Error : %@", buf, 0x2Au);

                long long v42 = v55;
              }

              uint64_t v38 = [v16 delegateCaller];
              long long v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Could not encode value" reason:@"Could not encode value" suggestion:0];
              [v38 callCompletion:v10 error:v46];

              long long v41 = 0;
            }
          }
          goto LABEL_21;
        }
        v31 = NSString;
        v32 = [v8 minimumValue];
        v33 = [v8 maximumValue];
        id v18 = [v31 stringWithFormat:@"Value should be between %@ & %@", v32, v33];

        uint64_t v30 = [v16 delegateCaller];
        v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:43 description:v18 reason:v18 suggestion:0];
        [v30 callCompletion:v10 error:v34];

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
      id v18 = [v16 delegateCaller];
      id v19 = (void *)MEMORY[0x1E4F28C58];
      v20 = @"Either value is nil or not of type NSNumber";
      uint64_t v22 = 43;
    }
    else
    {
      id v18 = [v16 delegateCaller];
      id v19 = (void *)MEMORY[0x1E4F28C58];
      v20 = @"User object is nil";
      uint64_t v22 = 20;
    }
    __int16 v21 = v20;
    goto LABEL_19;
  }
  __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
  v24 = v12;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v26;
    __int16 v69 = 2080;
    v70 = "-[HMUserSettingsAdapter updateValueForSetting:value:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v10 + 2))(v10, v17);
LABEL_22:
}

void __71__HMUserSettingsAdapter_updateValueForSetting_value_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = *(void **)(a1 + 40);
    int v25 = 138544130;
    v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating of setting for user [%@] finished with : %@, error %@", (uint8_t *)&v25, 0x2Au);
  }
  if (!v5)
  {
    id v12 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x19F3A64A0]([v14 setValue:*(void *)(a1 + 56)]);
      id v16 = *(id *)(a1 + 32);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v18;
        __int16 v27 = 2112;
        id v28 = v14;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Updated setting: %@", (uint8_t *)&v25, 0x16u);
      }
      id v5 = 0;
    }
    else
    {
      id v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = *(id *)(a1 + 32);
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        __int16 v23 = *(void **)(a1 + 48);
        int v25 = 138543618;
        v26 = v22;
        __int16 v27 = 2112;
        id v28 = v23;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Looks like we have non number setting. Need to handle that. %@", (uint8_t *)&v25, 0x16u);
      }
      id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    }
  }
  v24 = [*(id *)(a1 + 64) delegateCaller];
  [v24 callCompletion:*(void *)(a1 + 72) error:v5];
}

- (id)settingKeyFromKeyPath:(id)a3
{
  v3 = [(HMUserSettingsAdapter *)self createKeyPathArrayWithKeyPath:a3];
  if (objc_msgSend(v3, "hmf_isEmpty"))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 lastObject];
  }

  return v4;
}

- (id)createKeyPathArrayWithKeyPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] > 1)
  {
    id v11 = v5;
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@The keypath %@ needs at least 2 keys, but only has %lu component.", buf, 0x20u);
    }
    id v10 = [v5 firstObject];
    uint64_t v13 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  }

  return v11;
}

- (id)appendKeyPath:(id)a3 withNextKey:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@", a3, a4];
}

- (id)findOrAddUserSettingGroupWithKeyPath:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUserSettingsAdapter *)self rootGroup];

  if (!v5)
  {
    id v6 = [HMSettingGroup alloc];
    BOOL v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v4 firstObject];
    int v9 = [(HMSettingGroup *)v6 initWithIdentifier:v7 name:v8 groups:MEMORY[0x1E4F1CBF0] settings:MEMORY[0x1E4F1CBF0]];
    [(HMUserSettingsAdapter *)self setRootGroup:v9];

    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      id v14 = v4;
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMUserSettingsAdapter type](v11, "type"));
      *(_DWORD *)buf = 138543618;
      id v51 = v13;
      __int16 v52 = 2112;
      uint64_t v53 = v15;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@User settings group created for : %@", buf, 0x16u);

      id v4 = v14;
    }
  }
  __int16 v16 = [(HMUserSettingsAdapter *)self rootGroup];

  if (v16)
  {
    id v17 = [(HMUserSettingsAdapter *)self rootGroup];
    __int16 v18 = [v17 keyPath];
    if (objc_msgSend(v4, "hmf_isEmpty"))
    {
      uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = id v22 = v4;
        *(_DWORD *)buf = 138543362;
        id v51 = v23;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Group key array cannot be empty.", buf, 0xCu);

        id v4 = v22;
      }
    }
    else
    {
      __int16 v29 = [v4 objectAtIndexedSubscript:0];
      int v30 = [v18 isEqual:v29];

      if (v30)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v43 = v4;
        obuint64_t j = v4;
        uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v46;
          char v34 = 1;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v46 != v33) {
                objc_enumerationMutation(obj);
              }
              if ((v34 & 1) == 0)
              {
                uint64_t v36 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                v37 = self;
                uint64_t v38 = [(HMUserSettingsAdapter *)self appendKeyPath:v18 withNextKey:v36];

                uint64_t v39 = [v17 settingGroupWithKeyPath:v38];
                if (!v39)
                {
                  long long v40 = [HMSettingGroup alloc];
                  long long v41 = [MEMORY[0x1E4F29128] UUID];
                  uint64_t v39 = [(HMSettingGroup *)v40 initWithIdentifier:v41 name:v36 groups:MEMORY[0x1E4F1CBF0] settings:MEMORY[0x1E4F1CBF0]];

                  [v17 addGroup:v39];
                }

                __int16 v18 = (void *)v38;
                id v17 = (id)v39;
                self = v37;
              }
              char v34 = 0;
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
            char v34 = 0;
          }
          while (v32);
        }

        id v17 = v17;
        id v28 = v17;
        id v4 = v43;
        goto LABEL_27;
      }
    }
    id v28 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v24 = (void *)MEMORY[0x19F3A64A0]();
  int v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v51 = v27;
    _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Root group for user settings object is nil", buf, 0xCu);
  }
  id v28 = 0;
LABEL_28:

  return v28;
}

- (id)groupKeyArrayFromKeyPath:(id)a3
{
  v3 = [(HMUserSettingsAdapter *)self createKeyPathArrayWithKeyPath:a3];
  id v4 = (void *)[v3 mutableCopy];
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v4 removeLastObject];
    id v5 = v4;
  }

  return v5;
}

- (void)createRootSettingGroup
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = [(HMUserSettingsAdapter *)self rootGroup];

  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Warning: Settings adapter root group has already been constructed.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v9 = HMFGetLogIdentifier();
      id v10 = [(HMUserSettingsAdapter *)v5 user];
      *(_DWORD *)buf = 138543618;
      id v51 = v9;
      __int16 v52 = 2112;
      uint64_t v53 = v10;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating settings for user %@", buf, 0x16u);
    }
    id v11 = [(HMUserSettingsAdapter *)v5 user];
    int v12 = [v11 isCurrentUser];

    uint64_t v13 = [(HMUserSettingsAdapter *)v5 type];
    if (v13 == 2)
    {
      id v14 = [(id)objc_opt_class() sharedSettingsSchema];
    }
    else if (v13 == 1 && v12)
    {
      id v14 = [(id)objc_opt_class() privateSettingsSchema];
    }
    else
    {
      id v14 = 0;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v14;
    uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v43)
    {
      uint64_t v42 = *(void *)v46;
      uint64_t v15 = 3;
      if (!v12) {
        uint64_t v15 = 1;
      }
      uint64_t v37 = v15;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v46 != v42) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          __int16 v18 = [v17 keyPath];
          uint64_t v19 = [(HMUserSettingsAdapter *)v5 groupKeyArrayFromKeyPath:v18];
          uint64_t v20 = [(HMUserSettingsAdapter *)v5 findOrAddUserSettingGroupWithKeyPath:v19];
          __int16 v21 = [v17 constraints];
          if ([v21 count] == 5)
          {
            long long v44 = [(HMUserSettingsAdapter *)v5 settingKeyFromKeyPath:v18];
            id v22 = [v21 objectAtIndexedSubscript:0];
            [v21 objectAtIndexedSubscript:1];
            __int16 v23 = v39 = (void *)v20;
            v24 = [v21 objectAtIndexedSubscript:2];
            [v21 objectAtIndexedSubscript:3];
            int v25 = v41 = v19;
            long long v40 = v18;
            v26 = [HMUserNumberSetting alloc];
            [MEMORY[0x1E4F29128] UUID];
            id v28 = v27 = v5;
            __int16 v29 = [(HMNumberSetting *)v26 initWithIdentifier:v28 name:v44 type:2 value:v25 properties:v37 minimumValue:v22 maximumValue:v23 stepValue:v24];

            id v5 = v27;
            [(HMSetting *)v29 setSettingManager:v27];
            int v30 = v39;
            [v39 addSetting:v29];

            __int16 v18 = v40;
            uint64_t v19 = v41;
          }
          else
          {
            uint64_t v31 = (void *)MEMORY[0x19F3A64A0]();
            uint64_t v32 = v5;
            uint64_t v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              char v34 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v51 = v34;
              _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Only number settings are supported and the value array size must be 5", buf, 0xCu);
            }
            int v30 = (void *)v20;
          }
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v43);
    }

    uint64_t v35 = [[HMSettings alloc] initWithSettingsOwner:v5];
    settings = v5->_settings;
    v5->_settings = v35;
  }
}

- (void)configureWithContext:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x19F3A64A0]([(HMUserSettingsAdapter *)self setContext:v5]);
  [(HMUserSettingsAdapter *)self createRootSettingGroup];
}

- (HMUserSettingsAdapter)initWithUser:(id)a3 settingsType:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMUserSettingsAdapter;
  BOOL v7 = [(HMUserSettingsAdapter *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_user, v6);
    v8->_type = a4;
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24 != -1) {
    dispatch_once(&logCategory__hmf_once_t24, &__block_literal_global_7577);
  }
  v2 = (void *)logCategory__hmf_once_v25;

  return v2;
}

uint64_t __36__HMUserSettingsAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25;
  logCategory__hmf_once_int v25 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedSettingsSchema
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.allowExplicitContent" constraintArray:&unk_1EEF08C18];
  v3 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.allowiTunesAccount", &unk_1EEF08C30, v2 constraintArray];
  v11[1] = v3;
  id v4 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.playbackInfluencesForYou" constraintArray:&unk_1EEF08C48];
  v11[2] = v4;
  id v5 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.soundCheck" constraintArray:&unk_1EEF08C60];
  v11[3] = v5;
  id v6 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.lossless" constraintArray:&unk_1EEF08C78];
  v11[4] = v6;
  BOOL v7 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.music.dolbyAtmos" constraintArray:&unk_1EEF08C90];
  void v11[5] = v7;
  id v8 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.siri.identifyVoice" constraintArray:&unk_1EEF08CA8];
  v11[6] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)privateSettingsSchema
{
  v24[20] = *MEMORY[0x1E4F143B8];
  __int16 v23 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.addSceneButtonPresentedCount" constraintArray:&unk_1EEF08A38];
  v24[0] = v23;
  id v22 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.completedSwitchingHomesOnboardingUI" constraintArray:&unk_1EEF08A50];
  v24[1] = v22;
  __int16 v21 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissed2024EnergyOnboarding" constraintArray:&unk_1EEF08A68];
  v24[2] = v21;
  uint64_t v20 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedAccessCodeOnboarding" constraintArray:&unk_1EEF08A80];
  v24[3] = v20;
  uint64_t v19 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedAccessoryAnalyticsOnboarding" constraintArray:&unk_1EEF08A98];
  v24[4] = v19;
  __int16 v18 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedAccessoryFirmwareUpdateOnboarding" constraintArray:&unk_1EEF08AB0];
  v24[5] = v18;
  id v17 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedAnnounceOnboarding" constraintArray:&unk_1EEF08AC8];
  v24[6] = v17;
  __int16 v16 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedCameraRecordingOnboarding" constraintArray:&unk_1EEF08AE0];
  v24[7] = v16;
  uint64_t v15 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedCameraRecordingSetupBanner" constraintArray:&unk_1EEF08AF8];
  v24[8] = v15;
  id v14 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedCameraUpgradeOfferBanner" constraintArray:&unk_1EEF08B10];
  v24[9] = v14;
  uint64_t v13 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedHomeTheaterOnboarding" constraintArray:&unk_1EEF08B28];
  v24[10] = v13;
  v2 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedIdentifyVoiceOnboarding" constraintArray:&unk_1EEF08B40];
  v24[11] = v2;
  v3 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedIdentifyVoiceSetupBanner" constraintArray:&unk_1EEF08B58];
  v24[12] = v3;
  id v4 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedLocationServicesOnboarding" constraintArray:&unk_1EEF08B70];
  v24[13] = v4;
  id v5 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedNaturalLightingOnboarding" constraintArray:&unk_1EEF08B88];
  v24[14] = v5;
  id v6 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedTVViewingProfileOnboarding" constraintArray:&unk_1EEF08BA0];
  v24[15] = v6;
  BOOL v7 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedTVViewingProfileSetupBanner" constraintArray:&unk_1EEF08BB8];
  v24[16] = v7;
  id v8 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedUserSplitMediaAccountWarning" constraintArray:&unk_1EEF08BD0];
  v24[17] = v8;
  int v9 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedWalletKeyExpressModeOnboarding" constraintArray:&unk_1EEF08BE8];
  v24[18] = v9;
  objc_super v10 = [[_HMUserSettingEntry alloc] initWithKeyPath:@"root.home.dismissedWelcomeUI" constraintArray:&unk_1EEF08C00];
  v24[19] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:20];

  return v11;
}

@end