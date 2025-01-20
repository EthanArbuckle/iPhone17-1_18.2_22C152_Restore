@interface HMAccessCodeManager
+ (BOOL)doesAccessCode:(id)a3 conflictWithExistingAccessCodes:(id)a4;
+ (BOOL)isWeakAccessCode:(id)a3;
+ (HMAccessCodeConstraints)accessCodeConstraints;
+ (id)_createAccessCodeWithLength:(int64_t)a3;
+ (id)accessCodeManagerUUIDFromHomeUUID:(id)a3;
+ (id)convertPotentialUniqueIdentifier:(id)a3 toUUIDForUserInHome:(id)a4;
+ (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5;
+ (id)generateAccessCodeValueFromConstraints:(id)a3 existingAccessCodes:(id)a4;
+ (id)logCategory;
+ (id)valueObjectsForAccessCodeModificationRequests:(id)a3 home:(id)a4;
+ (int64_t)_accessCodeLengthFromLowerBound:(int64_t)a3 upperBound:(int64_t)a4;
+ (int64_t)greatestLowerBoundForAccessCodeLengthFromConstraints:(id)a3;
+ (int64_t)leastUpperBoundForAccessCodeLengthFromConstraints:(id)a3;
- (HMAccessCodeManager)initWithHome:(id)a3;
- (HMAccessCodeManager)initWithHome:(id)a3 context:(id)a4 UUID:(id)a5 notificationCenter:(id)a6;
- (HMHome)home;
- (NSArray)accessoriesSupportingAccessCodes;
- (NSHashTable)observers;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)UUID;
- (_HMContext)context;
- (id)logIdentifier;
- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5;
- (void)_subscribe;
- (void)_unsubscribe;
- (void)addObserver:(id)a3;
- (void)configure;
- (void)fetchAccessCodeConstraintsFromAccessories:(id)a3 completion:(id)a4;
- (void)fetchAccessCodesFromAccessories:(id)a3 completion:(id)a4;
- (void)fetchCachedAccessoryAccessCodesWithCompletion:(id)a3;
- (void)fetchHomeAccessCodesWithCompletion:(id)a3;
- (void)generateAccessCodeForUser:(id)a3 completion:(id)a4;
- (void)handleDaemonReconnectedNotification:(id)a3;
- (void)handleDidAddAccessoryAccessCodesMessage:(id)a3;
- (void)handleDidAddHomeAccessCodesMessage:(id)a3;
- (void)handleDidRemoveAccessoryAccessCodesMessage:(id)a3;
- (void)handleDidRemoveHomeAccessCodesMessage:(id)a3;
- (void)handleDidUpdateAccessoryAccessCodesMessage:(id)a3;
- (void)handleDidUpdateHomeAccessCodesMessage:(id)a3;
- (void)removeHomeAccessCodeWithValue:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeSimpleLabelAccessCode:(id)a3 completion:(id)a4;
- (void)resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:(id)a3 completion:(id)a4;
- (void)setAccessCode:(id)a3 forUser:(id)a4 completion:(id)a5;
- (void)setAccessCode:(id)a3 forUserWithUUID:(id)a4 completion:(id)a5;
- (void)setHome:(id)a3;
- (void)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 completion:(id)a5;
- (void)submitAccessCodeModificationRequests:(id)a3 completion:(id)a4;
- (void)unconfigure;
@end

@implementation HMAccessCodeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_home);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMAccessCodeManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_unsubscribe
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing", (uint8_t *)&v7, 0xCu);
  }
  [(HMAccessCodeManager *)v4 _sendMessageWithName:@"HMAccessCodeManagerUnsubscribeMessage" payload:0 responseHandler:0];
}

- (void)_subscribe
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing", (uint8_t *)&v7, 0xCu);
  }
  [(HMAccessCodeManager *)v4 _sendMessageWithName:@"HMAccessCodeManagerSubscribeMessage" payload:0 responseHandler:0];
}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F65488];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [(HMAccessCodeManager *)self messageTargetUUID];
  id v17 = (id)[v12 initWithTarget:v13];

  v14 = [MEMORY[0x1E4F654B0] messageWithName:v11 destination:v17 payload:v10];

  [v14 setResponseHandler:v9];
  v15 = [(HMAccessCodeManager *)self context];
  v16 = [v15 messageDispatcher];
  [v16 sendMessage:v14];
}

- (void)handleDidRemoveHomeAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyHomeAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didRemoveHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F828;
  v25[4] = v8;
  id v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  id v12 = [(HMAccessCodeManager *)v8 observers];
  v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  v14 = [(HMAccessCodeManager *)v8 context];
  v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke_2;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  v5 = +[HMHomeAccessCode homeAccessCodeWithValue:v3 home:v4];

  return v5;
}

void __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didRemoveHomeAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didRemoveHomeAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDidUpdateHomeAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyHomeAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didUpdateHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F828;
  v25[4] = v8;
  uint64_t v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(HMAccessCodeManager *)v8 observers];
  id v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  v14 = [(HMAccessCodeManager *)v8 context];
  uint64_t v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke_2;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  uint64_t v5 = +[HMHomeAccessCode homeAccessCodeWithValue:v3 home:v4];

  return v5;
}

void __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didUpdateHomeAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didUpdateHomeAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDidAddHomeAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyHomeAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didAddHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F828;
  v25[4] = v8;
  uint64_t v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(HMAccessCodeManager *)v8 observers];
  id v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  v14 = [(HMAccessCodeManager *)v8 context];
  uint64_t v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke_2;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  uint64_t v5 = +[HMHomeAccessCode homeAccessCodeWithValue:v3 home:v4];

  return v5;
}

void __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didAddHomeAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didAddHomeAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDidRemoveAccessoryAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didRemoveAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F878;
  v25[4] = v8;
  uint64_t v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(HMAccessCodeManager *)v8 observers];
  id v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  v14 = [(HMAccessCodeManager *)v8 context];
  uint64_t v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke_192;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  uint64_t v5 = [v3 accessoryUUID];
  v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    int v7 = +[HMAccessoryAccessCode accessoryAccessCodeWithValue:v3 accessory:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

void __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke_192(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didRemoveAccessoryAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didRemoveAccessoryAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDidUpdateAccessoryAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didUpdateAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F878;
  v25[4] = v8;
  uint64_t v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(HMAccessCodeManager *)v8 observers];
  id v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  int v14 = [(HMAccessCodeManager *)v8 context];
  uint64_t v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke_189;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  uint64_t v5 = [v3 accessoryUUID];
  v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    int v7 = +[HMAccessoryAccessCode accessoryAccessCodeWithValue:v3 accessory:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

void __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke_189(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didUpdateAccessoryAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didUpdateAccessoryAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDidAddAccessoryAccessCodesMessage:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues" ofClasses:v5];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didAddAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke;
  v25[3] = &unk_1E593F878;
  v25[4] = v8;
  uint64_t v11 = objc_msgSend(v6, "na_map:", v25);
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(HMAccessCodeManager *)v8 observers];
  id v13 = [v12 allObjects];

  os_unfair_lock_unlock(&v8->_lock.lock);
  int v14 = [(HMAccessCodeManager *)v8 context];
  uint64_t v15 = [v14 delegateCaller];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke_186;
  v21 = &unk_1E5945650;
  id v22 = v13;
  v23 = v8;
  id v24 = v11;
  id v16 = v11;
  id v17 = v13;
  [v15 invokeBlock:&v18];

  objc_msgSend(v4, "respondWithSuccess", v18, v19, v20, v21);
}

id __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  uint64_t v5 = [v3 accessoryUUID];
  v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    int v7 = +[HMAccessoryAccessCode accessoryAccessCodeWithValue:v3 accessory:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

void __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke_186(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = (void *)MEMORY[0x19F3A64A0]();
          id v9 = *(id *)(a1 + 40);
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v14 = id v13 = v2;
            uint64_t v15 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            __int16 v22 = 2112;
            v23 = v7;
            __int16 v24 = 2112;
            uint64_t v25 = v15;
            _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didAddAccessoryAccessCodes:%@", buf, 0x20u);

            id v2 = v13;
            uint64_t v5 = v12;
            uint64_t v4 = v11;
          }

          [v7 accessCodeManager:*(void *)(a1 + 40) didAddAccessoryAccessCodes:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v11, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  id v9 = [(HMAccessCodeManager *)v6 observers];
  BOOL v10 = [v9 count] == 0;

  os_unfair_lock_unlock(&v6->_lock.lock);
  if (!v10) {
    [(HMAccessCodeManager *)v6 _subscribe];
  }
}

- (void)fetchCachedAccessoryAccessCodesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager fetchCachedAccessoryAccessCodesWithCompletion:]", @"completion"];
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    long long v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v5 = (void (**)(void, void, void))v4;
  v6 = [(HMAccessCodeManager *)self context];

  int v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cached accessory access codes", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke;
    v20[3] = &unk_1E5944EF0;
    v20[4] = v8;
    v21 = v5;
    [(HMAccessCodeManager *)v8 _sendMessageWithName:@"HMAccessCodeManagerFetchCachedAccessCodesMessage" payload:0 responseHandler:v20];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      __int16 v24 = 2080;
      uint64_t v25 = "-[HMAccessCodeManager fetchCachedAccessoryAccessCodesWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v13);
  }
}

void __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessoryAccessCodeFetchResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_2;
      v29[3] = &unk_1E593F7D8;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      BOOL v10 = [*(id *)(a1 + 32) context];
      int v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_182;
      v26[3] = &unk_1E5945138;
      uint64_t v12 = *(void **)(a1 + 40);
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = v12;
      id v13 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory access codes. Could not find fetch response object in message.", buf, 0xCu);
      }
      __int16 v24 = [*(id *)(a1 + 32) context];
      uint64_t v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_181;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 40);
      [v25 invokeBlock:v30];

      v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      __int16 v38 = 2112;
      id v39 = v5;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory access codes with error:%@", buf, 0x16u);
    }
    long long v18 = [*(id *)(a1 + 32) context];
    id v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_180;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 40);
    id v33 = v5;
    [v19 invokeBlock:v32];

    v8 = v34;
  }
}

uint64_t __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_181(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    int v7 = +[HMAccessoryAccessCodeFetchResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      long long v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCodeFetchResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

uint64_t __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_182(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses for cached accessory access codes: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:completion:]", @"completion"];
    v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  int v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Resetting accessory access codes with value matching home access code: %@", buf, 0x16u);
    }
    id v15 = [v6 createHomeAccessCodeValue];
    id v28 = @"HMAccessCodeManagerMessageKeyHomeAccessCodeValue";
    __int16 v16 = encodeRootObject(v15);
    v29 = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke;
    v25[3] = &unk_1E5945510;
    v25[4] = v11;
    uint64_t v26 = v6;
    id v27 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerResetAccessoryAccessCodesMessage" payload:v17 responseHandler:v25];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2080;
      id v33 = "-[HMAccessCodeManager resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v15);
  }
}

void __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_2;
      v29[3] = &unk_1E593F850;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      __int16 v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_179;
      v26[3] = &unk_1E5945138;
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = *(id *)(a1 + 48);
      id v12 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset accessory access code. Could not find modification response objects in message.", buf, 0xCu);
      }
      id v24 = [*(id *)(a1 + 32) context];
      uint64_t v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_178;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 48);
      [v25 invokeBlock:v30];

      int v8 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset accessory access codes with value matching home access code: %@, with error:%@", buf, 0x20u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_177;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 48);
    id v33 = v5;
    [v19 invokeBlock:v32];

    int v8 = v34;
  }
}

uint64_t __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_177(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_178(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessCodeModificationResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_179(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setAccessCode:(id)a3 forUserWithUUID:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager setAccessCode:forUserWithUUID:completion:]", @"completion"];
    v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v32;
      __int16 v41 = 2112;
      uint64_t v42 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v11 = (void (**)(void, void, void))v10;
  uint64_t v12 = [(HMAccessCodeManager *)self context];

  if (v12)
  {
    id v13 = [(HMAccessCodeManager *)self home];
    int v14 = +[HMAccessCodeManager convertPotentialUniqueIdentifier:v9 toUUIDForUserInHome:v13];

    id v15 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v40 = v18;
      __int16 v41 = 2112;
      uint64_t v42 = v8;
      __int16 v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Setting access code: %@ for user: %@", buf, 0x20u);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA60];
    v37 = @"HMAccessCodeManagerMessageKeyUserUUIDString";
    v20 = [v14 UUIDString];
    __int16 v38 = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    __int16 v22 = [v19 dictionaryWithDictionary:v21];

    [v22 setObject:v8 forKeyedSubscript:@"HMAccessCodeManagerMessageKeyAccessCodeString"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke;
    v34[3] = &unk_1E5945510;
    v34[4] = v16;
    id v35 = v14;
    v36 = v11;
    id v23 = v14;
    [(HMAccessCodeManager *)v16 _sendMessageWithName:@"HMAccessCodeManagerSetAccessCodeForUserMessage" payload:v22 responseHandler:v34];
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v27;
      __int16 v41 = 2080;
      uint64_t v42 = "-[HMAccessCodeManager setAccessCode:forUserWithUUID:completion:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v22);
  }
}

void __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues", v7);

    if (v8)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_2;
      void v30[3] = &unk_1E593F850;
      void v30[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v30);
      id v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_176;
      v27[3] = &unk_1E5945138;
      v27[4] = *(void *)(a1 + 32);
      id v28 = v9;
      id v29 = *(id *)(a1 + 48);
      id v12 = v9;
      [v11 invokeBlock:v27];
    }
    else
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        uint64_t v24 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        __int16 v38 = v23;
        __int16 v39 = 2112;
        uint64_t v40 = v24;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set access code for user: %@. Could not find modification response objects in message response.", buf, 0x16u);
      }
      uint64_t v25 = [*(id *)(a1 + 32) context];
      uint64_t v26 = [v25 delegateCaller];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_175;
      v31[3] = &unk_1E59454C0;
      id v32 = *(id *)(a1 + 48);
      [v26 invokeBlock:v31];

      int v8 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v38 = v16;
      __int16 v39 = 2112;
      uint64_t v40 = v17;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to set access code for user with UUID: %@, with error:%@", buf, 0x20u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 delegateCaller];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_174;
    v33[3] = &unk_1E59454E8;
    id v35 = *(id *)(a1 + 48);
    id v34 = v5;
    [v19 invokeBlock:v33];

    int v8 = v35;
  }
}

uint64_t __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_174(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_175(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessCodeModificationResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_176(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setAccessCode:(id)a3 forUser:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 uuid];
  [(HMAccessCodeManager *)self setAccessCode:v9 forUserWithUUID:v10 completion:v8];
}

- (void)generateAccessCodeForUser:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager generateAccessCodeForUser:completion:]", @"completion"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  id v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Generating new access code for user: %@", buf, 0x16u);
    }
    id v29 = @"HMAccessCodeManagerMessageKeyUserUUIDString";
    id v15 = [v6 uuid];
    __int16 v16 = [v15 UUIDString];
    v30 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke;
    v26[3] = &unk_1E5945510;
    v26[4] = v11;
    id v27 = v6;
    id v28 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerGenerateNewUserAccessCodeMessage" payload:v17 responseHandler:v26];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v18;
      __int16 v33 = 2080;
      id v34 = "-[HMAccessCodeManager generateAccessCodeForUser:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v19);
  }
}

void __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_2;
      v29[3] = &unk_1E593F850;
      v29[4] = a1[4];
      id v9 = objc_msgSend(v8, "na_map:", v29);
      id v10 = [a1[4] context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_172;
      v26[3] = &unk_1E5945138;
      v26[4] = a1[4];
      id v27 = v9;
      id v28 = a1[6];
      id v12 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = a1[4];
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code. Could not find modification response objects in message.", buf, 0xCu);
      }
      uint64_t v24 = [a1[4] context];
      id v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_171;
      void v30[3] = &unk_1E59454C0;
      id v31 = a1[6];
      [v25 invokeBlock:v30];

      id v8 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[4];
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = [a1[5] uuid];
      *(_DWORD *)buf = 138543874;
      v37 = v16;
      __int16 v38 = 2112;
      __int16 v39 = v17;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code for user with UUID: %@, with error:%@", buf, 0x20u);
    }
    uint64_t v18 = [a1[4] context];
    uint64_t v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_170;
    v32[3] = &unk_1E59454E8;
    id v34 = a1[6];
    id v33 = v5;
    [v19 invokeBlock:v32];

    id v8 = v34;
  }
}

uint64_t __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_170(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_171(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessCodeModificationResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_172(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)submitAccessCodeModificationRequests:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager submitAccessCodeModificationRequests:completion:]", @"completion"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  int v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting access code modification requests: %@", buf, 0x16u);
    }
    id v15 = [(HMAccessCodeManager *)v11 home];
    __int16 v16 = +[HMAccessCodeManager valueObjectsForAccessCodeModificationRequests:v6 home:v15];

    id v29 = @"HMAccessCodeManagerMessageKeyAccessCodeModificationRequests";
    uint64_t v17 = encodeRootObject(v16);
    v30 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke;
    v26[3] = &unk_1E5945510;
    v26[4] = v11;
    id v27 = v6;
    id v28 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerSubmitAccessCodeModificationRequestsMessage" payload:v18 responseHandler:v26];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v19;
      __int16 v33 = 2080;
      id v34 = "-[HMAccessCodeManager submitAccessCodeModificationRequests:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v16);
  }
}

void __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_2;
      v29[3] = &unk_1E593F850;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      __int16 v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_169;
      v26[3] = &unk_1E5945138;
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = *(id *)(a1 + 48);
      id v12 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit modification requests. Could not find modification response objects in message.", buf, 0xCu);
      }
      uint64_t v24 = [*(id *)(a1 + 32) context];
      id v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_168;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 48);
      [v25 invokeBlock:v30];

      int v8 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit access code modification requests: %@, with error:%@", buf, 0x20u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_167;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 48);
    id v33 = v5;
    [v19 invokeBlock:v32];

    int v8 = v34;
  }
}

uint64_t __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_167(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_168(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessCodeModificationResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_169(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeSimpleLabelAccessCode:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager removeSimpleLabelAccessCode:completion:]", @"completion"];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  int v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing simple label access code", buf, 0xCu);
    }
    uint64_t v26 = @"HMAccessCodeManagerMessageKeyAccessCodeString";
    id v27 = v6;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke;
    v24[3] = &unk_1E5944EF0;
    v24[4] = v11;
    id v25 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerRemoveSimpleLabelAccessCodeMessage" payload:v15 responseHandler:v24];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v16;
      __int16 v30 = 2080;
      id v31 = "-[HMAccessCodeManager removeSimpleLabelAccessCode:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v17);
  }
}

void __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_2;
      v29[3] = &unk_1E593F850;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      __int16 v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_165;
      v26[3] = &unk_1E5945138;
      uint64_t v12 = *(void **)(a1 + 40);
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = v12;
      id v13 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove simple label access code. Could not find modification response objects in message response.", buf, 0xCu);
      }
      uint64_t v24 = [*(id *)(a1 + 32) context];
      id v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_162;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 40);
      [v25 invokeBlock:v30];

      int v8 = 0;
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      __int16 v38 = 2112;
      id v39 = v5;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove simple label access code with error:%@", buf, 0x16u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_160;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 40);
    id v33 = v5;
    [v19 invokeBlock:v32];

    int v8 = v34;
  }
}

uint64_t __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_162(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessCodeModificationResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_165(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses for removed simple label access code: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeHomeAccessCodeWithValue:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager removeHomeAccessCodeWithValue:completion:]", @"completion"];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  int v8 = (void (**)(void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing home access code - This method has been deprecated.", buf, 0xCu);
    }
    id v15 = [v6 stringValue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__HMAccessCodeManager_removeHomeAccessCodeWithValue_completion___block_invoke;
    v24[3] = &unk_1E5944EC8;
    id v25 = v8;
    [(HMAccessCodeManager *)v11 removeSimpleLabelAccessCode:v15 completion:v24];

    __int16 v16 = v25;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v17;
      __int16 v28 = 2080;
      id v29 = "-[HMAccessCodeManager removeHomeAccessCodeWithValue:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v8)[2](v8, v16);
  }
}

uint64_t __64__HMAccessCodeManager_removeHomeAccessCodeWithValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager setUserInformation:forHomeAccessCodeWithValue:completion:]", @"completion"];
    id v31 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v32 = self;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v34;
      __int16 v43 = 2112;
      v44 = (const char *)v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  uint64_t v11 = (void (**)(void, void))v10;
  uint64_t v12 = [(HMAccessCodeManager *)self context];

  id v13 = (void *)MEMORY[0x19F3A64A0]();
  int v14 = self;
  id v15 = HMFGetOSLogHandle();
  __int16 v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v17;
      __int16 v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting user information: %@, for home access code", buf, 0x16u);
    }
    uint64_t v18 = [v8 removedUserInfo];

    if (!v18)
    {
      uint64_t v26 = [v8 createAccessCodeUserInformationValue];
      v39[0] = @"HMAccessCodeManagerMessageKeyUserInformationValue";
      id v27 = encodeRootObject(v26);
      v39[1] = @"HMAccessCodeManagerMessageKeyAccessCodeValue";
      v40[0] = v27;
      __int16 v28 = encodeRootObject(v9);
      v40[1] = v28;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      void v36[2] = __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke;
      v36[3] = &unk_1E5945510;
      v36[4] = v14;
      v37 = v8;
      __int16 v38 = v11;
      [(HMAccessCodeManager *)v14 _sendMessageWithName:@"HMAccessCodeManagerSetUserInformationMessage" payload:v29 responseHandler:v36];

      goto LABEL_14;
    }
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = v14;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v22;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Caller passed userInformation with a removedUserInfo, which is not allowed. Returning an error.", buf, 0xCu);
    }
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 3;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v25;
      __int16 v43 = 2080;
      v44 = "-[HMAccessCodeManager setUserInformation:forHomeAccessCodeWithValue:completion:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 12;
  }
  uint64_t v26 = [v23 hmErrorWithCode:v24];
  ((void (**)(void, void *))v11)[2](v11, v26);
LABEL_14:
}

void __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set user information: %@, for home access code with error:%@", buf, 0x20u);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) context];
  id v13 = [v12 delegateCaller];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke_158;
  v16[3] = &unk_1E59454E8;
  id v14 = *(id *)(a1 + 48);
  id v17 = v5;
  id v18 = v14;
  id v15 = v5;
  [v13 invokeBlock:v16];
}

uint64_t __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchHomeAccessCodesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager fetchHomeAccessCodesWithCompletion:]", @"completion"];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v5 = (void (**)(void, void, void))v4;
  id v6 = [(HMAccessCodeManager *)self context];

  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching home access codes", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke;
    v20[3] = &unk_1E5944EF0;
    v20[4] = v8;
    __int16 v21 = v5;
    [(HMAccessCodeManager *)v8 _sendMessageWithName:@"HMAccessCodeManagerFetchHomeAccessCodesMessage" payload:0 responseHandler:v20];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v12;
      __int16 v24 = 2080;
      uint64_t v25 = "-[HMAccessCodeManager fetchHomeAccessCodesWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v13);
  }
}

void __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyHomeAccessCodeValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_2;
      v29[3] = &unk_1E593F828;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      id v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_3;
      v26[3] = &unk_1E5945138;
      uint64_t v12 = *(void **)(a1 + 40);
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = v12;
      id v13 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home access codes. Could not find access codes in message.", buf, 0xCu);
      }
      __int16 v24 = [*(id *)(a1 + 32) context];
      uint64_t v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_155;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 40);
      [v25 invokeBlock:v30];

      id v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      __int16 v38 = 2112;
      id v39 = v5;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home access codes with error:%@", buf, 0x16u);
    }
    id v18 = [*(id *)(a1 + 32) context];
    id v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_153;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 40);
    id v33 = v5;
    [v19 invokeBlock:v32];

    id v8 = v34;
  }
}

uint64_t __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_155(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  id v5 = +[HMHomeAccessCode homeAccessCodeWithValue:v3 home:v4];

  return v5;
}

uint64_t __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with home access codes: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAccessCodeConstraintsFromAccessories:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager fetchAccessCodeConstraintsFromAccessories:completion:]", @"completion"];
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  int v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching access code constraints from accessories: %@", buf, 0x16u);
    }
    id v15 = objc_msgSend(v6, "na_map:", &__block_literal_global_146);
    id v28 = @"HMAccessCodeManagerMessageKeyAccessoryUUIDs";
    __int16 v16 = encodeRootObject(v15);
    id v29 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2;
    v25[3] = &unk_1E5945510;
    v25[4] = v11;
    uint64_t v26 = v6;
    id v27 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerFetchAccessCodeConstraintsMessage" payload:v17 responseHandler:v25];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2080;
      id v33 = "-[HMAccessCodeManager fetchAccessCodeConstraintsFromAccessories:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v15);
  }
}

void __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessoryAccessCodeConstraintsFetchResponseValues", v7);

    if (v8)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2_150;
      v29[3] = &unk_1E593F800;
      v29[4] = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v8, "na_map:", v29);
      __int16 v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_3;
      v26[3] = &unk_1E5945138;
      v26[4] = *(void *)(a1 + 32);
      id v27 = v9;
      id v28 = *(id *)(a1 + 48);
      id v12 = v9;
      [v11 invokeBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access code constraints. Could not find fetch response object in message.", buf, 0xCu);
      }
      id v24 = [*(id *)(a1 + 32) context];
      uint64_t v25 = [v24 delegateCaller];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_149;
      void v30[3] = &unk_1E59454C0;
      id v31 = *(id *)(a1 + 48);
      [v25 invokeBlock:v30];

      int v8 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access code constraints from accessories: %@, with error:%@", buf, 0x20u);
    }
    id v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_147;
    v32[3] = &unk_1E59454E8;
    id v34 = *(id *)(a1 + 48);
    id v33 = v5;
    [v19 invokeBlock:v32];

    int v8 = v34;
  }
}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_149(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2_150(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  id v5 = +[HMAccessoryAccessCodeConstraintsFetchResponse responseWithValue:v3 home:v4];

  return v5;
}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)fetchAccessCodesFromAccessories:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessCodeManager fetchAccessCodesFromAccessories:completion:]", @"completion"];
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  int v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessCodeManager *)self context];

  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching access codes from accessories: %@", buf, 0x16u);
    }
    id v15 = objc_msgSend(v6, "na_map:", &__block_literal_global_133);
    id v28 = @"HMAccessCodeManagerMessageKeyAccessoryUUIDs";
    __int16 v16 = encodeRootObject(v15);
    id v29 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_2;
    v25[3] = &unk_1E5945510;
    v25[4] = v11;
    uint64_t v26 = v6;
    id v27 = v8;
    [(HMAccessCodeManager *)v11 _sendMessageWithName:@"HMAccessCodeManagerFetchAccessCodesMessage" payload:v17 responseHandler:v25];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2080;
      id v33 = "-[HMAccessCodeManager fetchAccessCodesFromAccessories:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v15);
  }
}

void __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMAccessCodeManagerMessageKeyAccessoryAccessCodeFetchResponseValues", v7);

    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    uint64_t v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v13;
        __int16 v40 = 2112;
        id v41 = v8;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Received accessory access code fetch response values: %@", buf, 0x16u);
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_140;
      v31[3] = &unk_1E593F7D8;
      void v31[4] = *(void *)(a1 + 32);
      id v14 = objc_msgSend(v8, "na_map:", v31);
      id v15 = [*(id *)(a1 + 32) context];
      __int16 v16 = [v15 delegateCaller];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_143;
      v28[3] = &unk_1E5945138;
      v28[4] = *(void *)(a1 + 32);
      id v29 = v14;
      id v30 = *(id *)(a1 + 48);
      id v17 = v14;
      [v16 invokeBlock:v28];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v25;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access codes. Could not find fetch response object in message.", buf, 0xCu);
      }
      uint64_t v26 = [*(id *)(a1 + 32) context];
      id v27 = [v26 delegateCaller];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_139;
      v32[3] = &unk_1E59454C0;
      id v33 = *(id *)(a1 + 48);
      [v27 invokeBlock:v32];

      int v8 = 0;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = *(id *)(a1 + 32);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      uint64_t v22 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v21;
      __int16 v40 = 2112;
      id v41 = v22;
      __int16 v42 = 2112;
      id v43 = v5;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access codes from accessories: %@, with error:%@", buf, 0x20u);
    }
    __int16 v23 = [*(id *)(a1 + 32) context];
    id v24 = [v23 delegateCaller];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_135;
    v34[3] = &unk_1E59454E8;
    id v36 = *(id *)(a1 + 48);
    id v35 = v5;
    [v24 invokeBlock:v34];

    int v8 = v36;
  }
}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_139(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  if (v6)
  {
    id v7 = +[HMAccessoryAccessCodeFetchResponse responseWithValue:v3 accessory:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [0 uuid];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCodeFetchResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_143(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses for accessory access codes: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (NSArray)accessoriesSupportingAccessCodes
{
  id v2 = [(HMAccessCodeManager *)self home];
  id v3 = [v2 accessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_121);

  return (NSArray *)v4;
}

uint64_t __55__HMAccessCodeManager_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing observer: %@", (uint8_t *)&v15, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  id v9 = [(HMAccessCodeManager *)v6 observers];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [(HMAccessCodeManager *)v6 observers];
  [v11 removeObject:v4];

  uint64_t v12 = [(HMAccessCodeManager *)v6 observers];
  if ([v12 count]) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v10 == 1;
  }
  char v14 = v13;

  os_unfair_lock_unlock(&v6->_lock.lock);
  if (v14) {
    [(HMAccessCodeManager *)v6 _unsubscribe];
  }
}

- (void)addObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    BOOL v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding observer: %@", (uint8_t *)&v12, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  id v9 = [(HMAccessCodeManager *)v6 observers];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [(HMAccessCodeManager *)v6 observers];
  [v11 addObject:v4];

  os_unfair_lock_unlock(&v6->_lock.lock);
  if (!v10) {
    [(HMAccessCodeManager *)v6 _subscribe];
  }
}

- (void)unconfigure
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring access code manager", (uint8_t *)&v14, 0xCu);
    }
    [(HMAccessCodeManager *)v5 setHome:0];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];

    uint64_t v10 = [(HMAccessCodeManager *)v5 context];
    uint64_t v11 = [v10 messageDispatcher];
    [v11 deregisterReceiver:v5];

    int v12 = self->_context;
    self->_context = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)configure
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v20 = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Configuring access code manager", (uint8_t *)&v20, 0xCu);
  }
  id v7 = [(HMAccessCodeManager *)v4 context];
  int v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"HMAccessCodeManagerDidAddAccessoryAccessCodesMessage" receiver:v4 selector:sel_handleDidAddAccessoryAccessCodesMessage_];

  id v9 = [(HMAccessCodeManager *)v4 context];
  uint64_t v10 = [v9 messageDispatcher];
  [v10 registerForMessage:@"HMAccessCodeManagerDidUpdateAccessoryAccessCodesMessage" receiver:v4 selector:sel_handleDidUpdateAccessoryAccessCodesMessage_];

  uint64_t v11 = [(HMAccessCodeManager *)v4 context];
  int v12 = [v11 messageDispatcher];
  [v12 registerForMessage:@"HMAccessCodeManagerDidRemoveAccessoryAccessCodesMessage" receiver:v4 selector:sel_handleDidRemoveAccessoryAccessCodesMessage_];

  BOOL v13 = [(HMAccessCodeManager *)v4 context];
  int v14 = [v13 messageDispatcher];
  [v14 registerForMessage:@"HMAccessCodeManagerDidAddHomeAccessCodesMessage" receiver:v4 selector:sel_handleDidAddHomeAccessCodesMessage_];

  id v15 = [(HMAccessCodeManager *)v4 context];
  uint64_t v16 = [v15 messageDispatcher];
  [v16 registerForMessage:@"HMAccessCodeManagerDidUpdateHomeAccessCodesMessage" receiver:v4 selector:sel_handleDidUpdateHomeAccessCodesMessage_];

  __int16 v17 = [(HMAccessCodeManager *)v4 context];
  id v18 = [v17 messageDispatcher];
  [v18 registerForMessage:@"HMAccessCodeManagerDidRemoveHomeAccessCodesMessage" receiver:v4 selector:sel_handleDidRemoveHomeAccessCodesMessage_];

  uint64_t v19 = [(HMAccessCodeManager *)v4 notificationCenter];
  [v19 addObserver:v4 selector:sel_handleDaemonReconnectedNotification_ name:@"HMDaemonReconnectedNotification" object:0];
}

- (HMAccessCodeManager)initWithHome:(id)a3 context:(id)a4 UUID:(id)a5 notificationCenter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessCodeManager;
  int v14 = [(HMAccessCodeManager *)&v19 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_storeStrong((id *)&v15->_context, a4);
    objc_storeStrong((id *)&v15->_UUID, a5);
    objc_storeStrong((id *)&v15->_notificationCenter, a6);
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;
  }
  return v15;
}

- (HMAccessCodeManager)initWithHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [v4 uuid];
  id v7 = [v5 accessCodeManagerUUIDFromHomeUUID:v6];

  int v8 = [v4 context];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = [(HMAccessCodeManager *)self initWithHome:v4 context:v8 UUID:v7 notificationCenter:v9];

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107 != -1) {
    dispatch_once(&logCategory__hmf_once_t107, &__block_literal_global_216);
  }
  id v2 = (void *)logCategory__hmf_once_v108;

  return v2;
}

uint64_t __34__HMAccessCodeManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v108;
  logCategory__hmf_once_v108 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)convertPotentialUniqueIdentifier:(id)a3 toUUIDForUserInHome:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 users];
  id v9 = [v7 currentUser];
  id v10 = [v8 arrayByAddingObject:v9];

  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = uint64_t v25 = v10;
    id v15 = [v7 currentUser];
    uint64_t v16 = [v15 uuid];
    __int16 v17 = [v7 currentUser];
    id v18 = [v17 uniqueIdentifier];
    *(_DWORD *)buf = 138544130;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2112;
    id v35 = v18;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@convertPotentialUniqueIdentifier: %@ where current user has uuid %@ and uniqueIdentifier %@", buf, 0x2Au);

    id v10 = v25;
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__HMAccessCodeManager_convertPotentialUniqueIdentifier_toUUIDForUserInHome___block_invoke;
  v26[3] = &unk_1E5941860;
  id v27 = v6;
  id v19 = v6;
  int v20 = objc_msgSend(v10, "na_firstObjectPassingTest:", v26);
  id v21 = [v20 uuid];

  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = v19;
  }
  id v23 = v22;

  return v23;
}

uint64_t __76__HMAccessCodeManager_convertPotentialUniqueIdentifier_toUUIDForUserInHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uniqueIdentifier];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

+ (id)valueObjectsForAccessCodeModificationRequests:(id)a3 home:(id)a4
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_208, a4);
}

id __74__HMAccessCodeManager_valueObjectsForAccessCodeModificationRequests_home___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  id v5 = v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v4)
  {
    uint64_t v11 = [v4 createAccessCodeAddRequestValue];
LABEL_16:
    id v12 = (void *)v11;
    goto LABEL_17;
  }
  if (v7)
  {
    uint64_t v11 = [v7 createAccessCodeUpdateRequestValue];
    goto LABEL_16;
  }
  if (v10)
  {
    uint64_t v11 = [v10 createAccessCodeRemoveRequestValue];
    goto LABEL_16;
  }
  id v12 = 0;
LABEL_17:

  return v12;
}

+ (id)accessCodeManagerUUIDFromHomeUUID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"5B1683C8-EAFC-436F-9DBD-1A08AD6E62D3"];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

+ (HMAccessCodeConstraints)accessCodeConstraints
{
  id v2 = [[HMAccessCodeConstraints alloc] initWithAllowedCharacterSets:1 minimumLength:4 maximumLength:8 maximumAllowedAccessCodes:1000];

  return v2;
}

+ (id)_createAccessCodeWithLength:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v5 = HMGenerateDecimalDigitPasswordWithLength(a3, &v12);
  id v6 = v12;
  if (!v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v14 = v10;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate access code with length: %ld, error: %@", buf, 0x20u);
    }
  }

  return v5;
}

+ (int64_t)_accessCodeLengthFromLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  if (a3 > a4) {
    return -1;
  }
  if (a3 <= 6 && a4 > 5) {
    return 6;
  }
  if (a3 <= 4 && a4 > 3) {
    return 4;
  }
  if (a3 <= 3) {
    return -1;
  }
  return a3;
}

+ (int64_t)greatestLowerBoundForAccessCodeLengthFromConstraints:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_101);
  id v4 = [v3 valueForKeyPath:@"@max.self"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

uint64_t __76__HMAccessCodeManager_greatestLowerBoundForAccessCodeLengthFromConstraints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 minimumLength];

  return [v2 numberWithInteger:v3];
}

+ (int64_t)leastUpperBoundForAccessCodeLengthFromConstraints:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_14897);
  id v4 = [v3 valueForKeyPath:@"@min.self"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

uint64_t __73__HMAccessCodeManager_leastUpperBoundForAccessCodeLengthFromConstraints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 maximumLength];

  return [v2 numberWithInteger:v3];
}

+ (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA80] setWithArray:a4];
  uint64_t v11 = v10;
  if (v9) {
    [v10 addObjectsFromArray:v9];
  }
  uint64_t v12 = objc_msgSend(a1, "_accessCodeLengthFromLowerBound:upperBound:", objc_msgSend(a1, "greatestLowerBoundForAccessCodeLengthFromConstraints:", v8), objc_msgSend(a1, "leastUpperBoundForAccessCodeLengthFromConstraints:", v8));
  if (v12 == -1)
  {
    __int16 v17 = 0;
  }
  else
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = 10;
    while (1)
    {
      int64_t v16 = v14;
      int v14 = [a1 _createAccessCodeWithLength:v13];

      if (v14)
      {
        if (![v11 containsObject:v14]) {
          break;
        }
      }
      if (!--v15)
      {
        __int16 v17 = 0;
        goto LABEL_11;
      }
    }
    __int16 v17 = [[HMAccessCodeValue alloc] initWithStringValue:v14];
LABEL_11:
  }

  return v17;
}

+ (id)generateAccessCodeValueFromConstraints:(id)a3 existingAccessCodes:(id)a4
{
  return (id)[a1 generateAccessCodeValueFromConstraints:a3 accessoryAccessCodes:a4 homeAccessCodes:0];
}

+ (BOOL)isWeakAccessCode:(id)a3
{
  return MEMORY[0x1F40F6FB8](0, a3);
}

+ (BOOL)doesAccessCode:(id)a3 conflictWithExistingAccessCodes:(id)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HMAccessCodeManager_doesAccessCode_conflictWithExistingAccessCodes___block_invoke;
  v8[3] = &unk_1E593FE78;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "na_any:", v8);

  return (char)a4;
}

uint64_t __70__HMAccessCodeManager_doesAccessCode_conflictWithExistingAccessCodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = HMFEqualObjects();
  int v5 = [v3 hasPrefix:*(void *)(a1 + 32)];
  LODWORD(a1) = [*(id *)(a1 + 32) hasPrefix:v3];

  return v4 | v5 | a1;
}

@end