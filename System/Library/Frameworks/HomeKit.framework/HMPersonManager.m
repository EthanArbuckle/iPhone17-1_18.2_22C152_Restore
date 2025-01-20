@interface HMPersonManager
- (HMPersonManager)initWithContext:(id)a3 UUID:(id)a4 zoneName:(id)a5 notificationCenter:(id)a6;
- (NSHashTable)observers;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (NSString)zoneName;
- (NSUUID)UUID;
- (_HMContext)context;
- (id)fetchClientFactory;
- (void)addObserver:(id)a3;
- (void)addOrUpdateFaceCrops:(id)a3 completion:(id)a4;
- (void)addOrUpdateFaceprints:(id)a3 completion:(id)a4;
- (void)addOrUpdatePersons:(id)a3 completion:(id)a4;
- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 completion:(id)a5;
- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6;
- (void)configure;
- (void)dealloc;
- (void)disassociateFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)handleDaemonReconnectedNotification:(id)a3;
- (void)handleDidChangePersonDataMessage:(id)a3;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)setFetchClientFactory:(id)a3;
- (void)subscribe;
- (void)unsubscribe;
@end

@implementation HMPersonManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchClientFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 56, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFetchClientFactory:(id)a3
{
}

- (id)fetchClientFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v10, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(NSHashTable *)v6->_observers count];
  os_unfair_lock_unlock(&v6->_lock);
  if (v9) {
    [(HMPersonManager *)v6 subscribe];
  }
}

- (void)handleDidChangePersonDataMessage:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did change person data message", buf, 0xCu);
  }
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v31 = [v4 unarchivedObjectForKey:@"HMPM.mk.up" ofClasses:v9];

  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v30 = [v4 unarchivedObjectForKey:@"HMPM.mk.uufc" ofClasses:v10];

  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v29 = [v4 unarchivedObjectForKey:@"HMPM.mk.upfc" ofClasses:v11];

  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v27 = [v4 unarchivedObjectForKey:@"HMPM.mk.uf" ofClasses:v12];

  v25 = [v4 setForKey:@"HMPM.mk.rpu"];
  v23 = [v4 setForKey:@"HMPM.mk.rfcu"];
  v13 = [v4 setForKey:@"HMPM.mk.rfu"];
  os_unfair_lock_lock_with_options();
  v14 = [(NSHashTable *)v6->_observers allObjects];
  os_unfair_lock_unlock(&v6->_lock);
  v15 = [(HMPersonManager *)v6 context];
  uint64_t v16 = [v15 delegateCaller];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__HMPersonManager_handleDidChangePersonDataMessage___block_invoke;
  v32[3] = &unk_1E593E568;
  id v33 = v31;
  v34 = v6;
  id v35 = v14;
  id v36 = v30;
  id v37 = v29;
  id v38 = v27;
  v17 = (void *)v16;
  id v39 = v25;
  id v40 = v23;
  id v41 = v13;
  id v18 = v13;
  id v24 = v23;
  id v26 = v25;
  id v28 = v27;
  id v19 = v29;
  id v20 = v30;
  id v21 = v14;
  id v22 = v31;
  [v17 invokeBlock:v32];

  [v4 respondWithPayload:0];
}

void __52__HMPersonManager_handleDidChangePersonDataMessage___block_invoke(id *a1)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = a1[5];
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      uint64_t v6 = [a1[4] count];
      *(_DWORD *)buf = 138543618;
      v115 = v5;
      __int16 v116 = 2048;
      uint64_t v117 = v6;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated persons", buf, 0x16u);
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v7 = a1[6];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v103 objects:v113 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v104;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v104 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v103 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 personManager:a1[5] didUpdatePersons:a1[4]];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v103 objects:v113 count:16];
      }
      while (v9);
    }
  }
  if ([a1[7] count])
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[5];
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [a1[7] count];
      *(_DWORD *)buf = 138543618;
      v115 = v16;
      __int16 v116 = 2048;
      uint64_t v117 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated unassociated face crops", buf, 0x16u);
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v18 = a1[6];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v99 objects:v112 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v100;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v100 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v99 + 1) + 8 * v22);
          if (objc_opt_respondsToSelector()) {
            [v23 personManager:a1[5] didUpdateUnassociatedFaceCrops:a1[7]];
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v99 objects:v112 count:16];
      }
      while (v20);
    }
  }
  if ([a1[8] count])
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = a1[5];
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      uint64_t v28 = [a1[8] count];
      *(_DWORD *)buf = 138543618;
      v115 = v27;
      __int16 v116 = 2048;
      uint64_t v117 = v28;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated person face crops", buf, 0x16u);
    }
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v29 = a1[6];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v96;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v96 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v95 + 1) + 8 * v33);
          if (objc_opt_respondsToSelector()) {
            [v34 personManager:a1[5] didUpdatePersonFaceCrops:a1[8]];
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v95 objects:v111 count:16];
      }
      while (v31);
    }
  }
  if ([a1[9] count])
  {
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    id v36 = a1[5];
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = HMFGetLogIdentifier();
      uint64_t v39 = [a1[9] count];
      *(_DWORD *)buf = 138543618;
      v115 = v38;
      __int16 v116 = 2048;
      uint64_t v117 = v39;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated faceprints", buf, 0x16u);
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v40 = a1[6];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v91 objects:v110 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v92;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v92 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v91 + 1) + 8 * v44);
          if (objc_opt_respondsToSelector()) {
            [v45 personManager:a1[5] didUpdateFaceprints:a1[9]];
          }
          ++v44;
        }
        while (v42 != v44);
        uint64_t v42 = [v40 countByEnumeratingWithState:&v91 objects:v110 count:16];
      }
      while (v42);
    }
  }
  if ([a1[10] count])
  {
    v46 = (void *)MEMORY[0x19F3A64A0]();
    id v47 = a1[5];
    uint64_t v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = HMFGetLogIdentifier();
      uint64_t v50 = [a1[10] count];
      *(_DWORD *)buf = 138543618;
      v115 = v49;
      __int16 v116 = 2048;
      uint64_t v117 = v50;
      _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed person UUIDs", buf, 0x16u);
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v51 = a1[6];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v87 objects:v109 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v88;
      do
      {
        uint64_t v55 = 0;
        do
        {
          if (*(void *)v88 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v87 + 1) + 8 * v55);
          if (objc_opt_respondsToSelector()) {
            [v56 personManager:a1[5] didRemovePersonsWithUUIDs:a1[10]];
          }
          ++v55;
        }
        while (v53 != v55);
        uint64_t v53 = [v51 countByEnumeratingWithState:&v87 objects:v109 count:16];
      }
      while (v53);
    }
  }
  if ([a1[11] count])
  {
    v57 = (void *)MEMORY[0x19F3A64A0]();
    id v58 = a1[5];
    v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v60 = HMFGetLogIdentifier();
      uint64_t v61 = [a1[11] count];
      *(_DWORD *)buf = 138543618;
      v115 = v60;
      __int16 v116 = 2048;
      uint64_t v117 = v61;
      _os_log_impl(&dword_19D1A8000, v59, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed face crop UUIDs", buf, 0x16u);
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v62 = a1[6];
    uint64_t v63 = [v62 countByEnumeratingWithState:&v83 objects:v108 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v84;
      do
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v84 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v83 + 1) + 8 * v66);
          if (objc_opt_respondsToSelector()) {
            [v67 personManager:a1[5] didRemoveFaceCropsWithUUIDs:a1[11]];
          }
          ++v66;
        }
        while (v64 != v66);
        uint64_t v64 = [v62 countByEnumeratingWithState:&v83 objects:v108 count:16];
      }
      while (v64);
    }
  }
  if ([a1[12] count])
  {
    v68 = (void *)MEMORY[0x19F3A64A0]();
    id v69 = a1[5];
    v70 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      v71 = HMFGetLogIdentifier();
      uint64_t v72 = [a1[12] count];
      *(_DWORD *)buf = 138543618;
      v115 = v71;
      __int16 v116 = 2048;
      uint64_t v117 = v72;
      _os_log_impl(&dword_19D1A8000, v70, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed faceprint UUIDs", buf, 0x16u);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v73 = a1[6];
    uint64_t v74 = [v73 countByEnumeratingWithState:&v79 objects:v107 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v80;
      do
      {
        uint64_t v77 = 0;
        do
        {
          if (*(void *)v80 != v76) {
            objc_enumerationMutation(v73);
          }
          v78 = *(void **)(*((void *)&v79 + 1) + 8 * v77);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v78, "personManager:didRemoveFaceprintsWithUUIDs:", a1[5], a1[12], (void)v79);
          }
          ++v77;
        }
        while (v75 != v77);
        uint64_t v75 = [v73 countByEnumeratingWithState:&v79 objects:v107 count:16];
      }
      while (v75);
    }
  }
}

- (void)unsubscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from person changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v8 = [(HMPersonManager *)v4 UUID];
  uint64_t v9 = (void *)[v7 initWithTarget:v8];

  uint64_t v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.u" destination:v9 payload:0];
  uint64_t v11 = [(HMPersonManager *)v4 context];
  uint64_t v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10];
}

- (void)subscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to person changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v8 = [(HMPersonManager *)v4 UUID];
  uint64_t v9 = (void *)[v7 initWithTarget:v8];

  uint64_t v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.s" destination:v9 payload:0];
  uint64_t v11 = [(HMPersonManager *)v4 context];
  uint64_t v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10];
}

- (void)configure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Configuring person manager", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(HMPersonManager *)v4 context];
  uint64_t v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"HMPM.m.dcpd" receiver:v4 selector:sel_handleDidChangePersonDataMessage_];

  uint64_t v9 = [(HMPersonManager *)v4 notificationCenter];
  [v9 addObserver:v4 selector:sel_handleDaemonReconnectedNotification_ name:@"HMDaemonReconnectedNotification" object:0];
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  uint64_t v8 = v7;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Remove faceprints"];
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing faceprints with UUIDs from persons data set: %@", buf, 0x20u);
  }
  v34 = @"HMPM.mk.fu";
  id v35 = v6;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(HMPersonManager *)v11 UUID];
  uint64_t v19 = (void *)[v17 initWithTarget:v18];

  uint64_t v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.rf" destination:v19 payload:v16];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __56__HMPersonManager_removeFaceprintsWithUUIDs_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  uint64_t v30 = v11;
  id v31 = v9;
  id v32 = v6;
  id v33 = v8;
  id v21 = v8;
  id v22 = v6;
  id v23 = v9;
  [v20 setResponseHandler:&v26];
  id v24 = [(HMPersonManager *)v11 context];
  id v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20];
}

void __56__HMPersonManager_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to remove faceprints: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully removed %lu faceprints";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Remove face crops"];
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing faceCrops with UUIDs from persons data set: %@", buf, 0x20u);
  }
  v34 = @"HMPM.mk.fcu";
  id v35 = v6;
  os_log_type_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(HMPersonManager *)v11 UUID];
  uint64_t v19 = (void *)[v17 initWithTarget:v18];

  int v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.rfc" destination:v19 payload:v16];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __55__HMPersonManager_removeFaceCropsWithUUIDs_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  uint64_t v30 = v11;
  id v31 = v9;
  id v32 = v6;
  id v33 = v8;
  id v21 = v8;
  id v22 = v6;
  id v23 = v9;
  [v20 setResponseHandler:&v26];
  __int16 v24 = [(HMPersonManager *)v11 context];
  uint64_t v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20];
}

void __55__HMPersonManager_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to remove face crops: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully removed %lu face crops";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Remove persons"];
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing persons with UUIDs from persons data set: %@", buf, 0x20u);
  }
  v34 = @"HMPM.mk.pu";
  id v35 = v6;
  os_log_type_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(HMPersonManager *)v11 UUID];
  uint64_t v19 = (void *)[v17 initWithTarget:v18];

  int v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.rp" destination:v19 payload:v16];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __53__HMPersonManager_removePersonsWithUUIDs_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  uint64_t v30 = v11;
  id v31 = v9;
  id v32 = v6;
  id v33 = v8;
  id v21 = v8;
  id v22 = v6;
  id v23 = v9;
  [v20 setResponseHandler:&v26];
  __int16 v24 = [(HMPersonManager *)v11 context];
  uint64_t v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20];
}

void __53__HMPersonManager_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to remove persons: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully removed %lu persons";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)disassociateFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Disassociate face crops"];
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Disassociating unassociated face crops with UUIDs %@", buf, 0x20u);
  }
  v34 = @"HMPM.mk.fcu";
  id v35 = v6;
  os_log_type_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(HMPersonManager *)v11 UUID];
  uint64_t v19 = (void *)[v17 initWithTarget:v18];

  int v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.dfc" destination:v19 payload:v16];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __61__HMPersonManager_disassociateFaceCropsWithUUIDs_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  uint64_t v30 = v11;
  id v31 = v9;
  id v32 = v6;
  id v33 = v8;
  id v21 = v8;
  id v22 = v6;
  id v23 = v9;
  [v20 setResponseHandler:&v26];
  __int16 v24 = [(HMPersonManager *)v11 context];
  uint64_t v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20];
}

void __61__HMPersonManager_disassociateFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to disassociate face crops: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully disassociated %lu face crops";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    os_log_type_t v16 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v17 = [v16 processName];
    int v28 = 138544130;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Associating face crops with UUIDs %@ to person with UUID %@ (processName: %@)", (uint8_t *)&v28, 0x2Au);
  }
  id v18 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v19 = [v18 processName];
  int v20 = [v19 isEqualToString:@"Home"];

  id v21 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v22 = v13;
  id v23 = HMFGetOSLogHandle();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v28 = 138543362;
      id v29 = v25;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Associating face crops using User source because client is Home app", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v26 = 2;
  }
  else
  {
    if (v24)
    {
      uint64_t v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      id v29 = v27;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Associating face crops using Unknown source", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v26 = 0;
  }

  [(HMPersonManager *)v22 associateFaceCropsWithUUIDs:v8 toPersonWithUUID:v9 forSource:v26 completion:v11];
}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v11) {
    goto LABEL_7;
  }
  int v13 = v12;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Associate face crops"];
  uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
  os_log_type_t v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v18 = v36 = v13;
    uint64_t v19 = [v14 identifier];
    int v20 = [v19 shortDescription];
    HMStringFromPersonFaceCropSource(a5);
    id v35 = v14;
    v22 = int64_t v21 = a5;
    *(_DWORD *)buf = 138544386;
    uint64_t v44 = v18;
    __int16 v45 = 2114;
    v46 = v20;
    __int16 v47 = 2112;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    __int16 v51 = 2112;
    uint64_t v52 = v22;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Associating face crops with UUIDs %@ to person with UUID %@ for source: %@", buf, 0x34u);

    a5 = v21;
    id v14 = v35;

    int v13 = v36;
  }

  v42[0] = v10;
  v41[0] = @"HMPM.mk.fcu";
  v41[1] = @"HMPM.mk.pu";
  id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  v42[1] = v23;
  v41[2] = @"HMPM.mk.s";
  BOOL v24 = [NSNumber numberWithInteger:a5];
  void v42[2] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

  id v26 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v27 = [(HMPersonManager *)v16 UUID];
  int v28 = (void *)[v26 initWithTarget:v27];

  id v29 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.afc" destination:v28 payload:v25];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __85__HMPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  v37[3] = &unk_1E59441B0;
  v37[4] = v16;
  id v38 = v14;
  id v39 = v10;
  id v40 = v13;
  id v30 = v13;
  id v31 = v10;
  id v32 = v14;
  [v29 setResponseHandler:v37];
  id v33 = [(HMPersonManager *)v16 context];
  __int16 v34 = [v33 messageDispatcher];
  [v34 sendMessage:v29];
}

void __85__HMPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      int64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to associate face crops: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    int64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully associated %lu face crops";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)addOrUpdateFaceprints:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Add faceprints"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v40 = v13;
    __int16 v41 = 2114;
    uint64_t v42 = v15;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating faceprints to persons data set: %@", buf, 0x20u);
  }
  id v36 = 0;
  os_log_type_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v36];
  id v17 = v36;
  if (v16)
  {
    id v37 = @"HMPM.mk.f";
    id v38 = v16;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v19 = objc_alloc(MEMORY[0x1E4F65488]);
    int v20 = [(HMPersonManager *)v11 UUID];
    int64_t v21 = (void *)[v19 initWithTarget:v20];

    __int16 v22 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.aouf" destination:v21 payload:v18];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __52__HMPersonManager_addOrUpdateFaceprints_completion___block_invoke;
    v32[3] = &unk_1E59441B0;
    void v32[4] = v11;
    id v33 = v9;
    id v34 = v6;
    id v35 = v8;
    [v22 setResponseHandler:v32];
    id v23 = [(HMPersonManager *)v11 context];
    __int16 v24 = [v23 messageDispatcher];
    [v24 sendMessage:v22];
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v26 = v11;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = HMFGetLogIdentifier();
      [v9 identifier];
      id v29 = v31 = v8;
      id v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v40 = v28;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize faceprints: %@", buf, 0x20u);

      id v8 = v31;
    }

    id v18 = [(HMPersonManager *)v26 context];
    int64_t v21 = [v18 delegateCaller];
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v21 callCompletion:v8 error:v22];
  }
}

void __52__HMPersonManager_addOrUpdateFaceprints_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      int64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to add/update faceprints: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    int64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully added/updated %lu faceprints";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  id v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)addOrUpdateFaceCrops:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Add face crops"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v40 = v13;
    __int16 v41 = 2114;
    uint64_t v42 = v15;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating face crops to persons data set: %@", buf, 0x20u);
  }
  id v36 = 0;
  os_log_type_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v36];
  id v17 = v36;
  if (v16)
  {
    id v37 = @"HMPM.mk.fc";
    id v38 = v16;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v19 = objc_alloc(MEMORY[0x1E4F65488]);
    int v20 = [(HMPersonManager *)v11 UUID];
    int64_t v21 = (void *)[v19 initWithTarget:v20];

    __int16 v22 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.aoufc" destination:v21 payload:v18];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __51__HMPersonManager_addOrUpdateFaceCrops_completion___block_invoke;
    v32[3] = &unk_1E59441B0;
    void v32[4] = v11;
    id v33 = v9;
    id v34 = v6;
    id v35 = v8;
    [v22 setResponseHandler:v32];
    id v23 = [(HMPersonManager *)v11 context];
    __int16 v24 = [v23 messageDispatcher];
    [v24 sendMessage:v22];
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v26 = v11;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = HMFGetLogIdentifier();
      [v9 identifier];
      id v29 = v31 = v8;
      id v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v40 = v28;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize face crops: %@", buf, 0x20u);

      id v8 = v31;
    }

    id v18 = [(HMPersonManager *)v26 context];
    int64_t v21 = [v18 delegateCaller];
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v21 callCompletion:v8 error:v22];
  }
}

void __51__HMPersonManager_addOrUpdateFaceCrops_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      int64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to add/update face crops: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    int64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully added/updated %lu face crops";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  id v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)addOrUpdatePersons:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Add persons"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v40 = v13;
    __int16 v41 = 2114;
    uint64_t v42 = v15;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons to persons data set: %@", buf, 0x20u);
  }
  id v36 = 0;
  os_log_type_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v36];
  id v17 = v36;
  if (v16)
  {
    id v37 = @"HMPM.mk.p";
    id v38 = v16;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v19 = objc_alloc(MEMORY[0x1E4F65488]);
    int v20 = [(HMPersonManager *)v11 UUID];
    int64_t v21 = (void *)[v19 initWithTarget:v20];

    __int16 v22 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.aoup" destination:v21 payload:v18];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__HMPersonManager_addOrUpdatePersons_completion___block_invoke;
    v32[3] = &unk_1E59441B0;
    void v32[4] = v11;
    id v33 = v9;
    id v34 = v6;
    id v35 = v8;
    [v22 setResponseHandler:v32];
    id v23 = [(HMPersonManager *)v11 context];
    __int16 v24 = [v23 messageDispatcher];
    [v24 sendMessage:v22];
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v26 = v11;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = HMFGetLogIdentifier();
      [v9 identifier];
      id v29 = v31 = v8;
      id v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v40 = v28;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);

      id v8 = v31;
    }

    id v18 = [(HMPersonManager *)v26 context];
    int64_t v21 = [v18 delegateCaller];
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v21 callCompletion:v8 error:v22];
  }
}

void __49__HMPersonManager_addOrUpdatePersons_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      int64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      id v14 = "%{public}@[%{public}@] Failed to add/update persons: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    int64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    id v14 = "%{public}@[%{public}@] Successfully added/updated %lu persons";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  id v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch all faceprints"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all faceprints", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMPersonManager *)v7 UUID];
  id v14 = (void *)[v12 initWithTarget:v13];

  uint64_t v15 = [(HMPersonManager *)v7 fetchClientFactory];
  os_log_type_t v16 = [v5 identifier];
  uint64_t v17 = [(HMPersonManager *)v7 context];
  id v18 = ((void (**)(void, void *, void *, __CFString *, void *))v15)[2](v15, v16, v17, @"HMPM.m.ff", v14);

  [v18 setClassForUnarchiving:objc_opt_class()];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__HMPersonManager_fetchAllFaceprintsWithCompletion___block_invoke;
  v21[3] = &unk_1E59437B0;
  v21[4] = v7;
  id v22 = v5;
  id v23 = v4;
  id v19 = v4;
  id v20 = v5;
  [v18 fetchWithCompletion:v21];
}

void __52__HMPersonManager_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu faceprints", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 40) identifier];
      id v18 = [v17 shortDescription];
      int v19 = 138543874;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all faceprints: %@", (uint8_t *)&v19, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch faceprints"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching faceprints for face crops with UUIDs: %@", buf, 0x20u);
  }
  uint64_t v27 = @"HMPM.mk.fcu";
  id v28 = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMPersonManager *)v10 UUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  int v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.ff" destination:v18 payload:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMPersonManager *)v10 context];
  __int16 v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19];
}

void __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v10;
      __int16 v42 = 2114;
      id v43 = v12;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch faceprints: %@", buf, 0x20u);
    }
    int v13 = [a1[4] context];
    uint64_t v14 = [v13 delegateCaller];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_154;
    v36[3] = &unk_1E59454E8;
    id v38 = a1[6];
    id v37 = v5;
    [v14 invokeBlock:v36];

    uint64_t v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v15 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMPM.mk.f", v16);

    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1[4];
    int v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [a1[5] identifier];
        __int16 v23 = [v22 shortDescription];
        uint64_t v24 = [v15 count];
        *(_DWORD *)buf = 138543874;
        __int16 v41 = v21;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu faceprints", buf, 0x20u);
      }
      id v25 = [a1[4] context];
      id v26 = [v25 delegateCaller];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_157;
      v31[3] = &unk_1E59454E8;
      uint64_t v27 = &v33;
      id v33 = a1[6];
      id v32 = v15;
      [v26 invokeBlock:v31];

      id v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v29;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized faceprints in response payload: %@", buf, 0x16u);
      }
      id v28 = [a1[4] context];
      id v30 = [v28 delegateCaller];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_156;
      v34[3] = &unk_1E59454C0;
      uint64_t v27 = &v35;
      id v35 = a1[6];
      [v30 invokeBlock:v34];
    }
  }
}

uint64_t __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_154(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_156(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch all face crops"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all unassociated face crops", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMPersonManager *)v7 UUID];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  uint64_t v15 = [(HMPersonManager *)v7 fetchClientFactory];
  id v16 = [v5 identifier];
  uint64_t v17 = [(HMPersonManager *)v7 context];
  id v18 = ((void (**)(void, void *, void *, __CFString *, void *))v15)[2](v15, v16, v17, @"HMPM.m.fufc", v14);

  [v18 setClassForUnarchiving:objc_opt_class()];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__HMPersonManager_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v21[3] = &unk_1E59437B0;
  v21[4] = v7;
  id v22 = v5;
  id v23 = v4;
  id v19 = v4;
  id v20 = v5;
  [v18 fetchWithCompletion:v21];
}

void __63__HMPersonManager_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu unassociated face crops", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 40) identifier];
      id v18 = [v17 shortDescription];
      int v19 = 138543874;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all unassociated face crops: %@", (uint8_t *)&v19, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch all person face crops"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all person face crops", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMPersonManager *)v7 UUID];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  uint64_t v15 = [(HMPersonManager *)v7 fetchClientFactory];
  id v16 = [v5 identifier];
  uint64_t v17 = [(HMPersonManager *)v7 context];
  id v18 = ((void (**)(void, void *, void *, __CFString *, void *))v15)[2](v15, v16, v17, @"HMPM.m.fpfc", v14);

  [v18 setClassForUnarchiving:objc_opt_class()];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__HMPersonManager_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v21[3] = &unk_1E59437B0;
  v21[4] = v7;
  id v22 = v5;
  id v23 = v4;
  id v19 = v4;
  id v20 = v5;
  [v18 fetchWithCompletion:v21];
}

void __57__HMPersonManager_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu person face crops", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 40) identifier];
      id v18 = [v17 shortDescription];
      int v19 = 138543874;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all person face crops: %@", (uint8_t *)&v19, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch face crops for persons"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crops for persons with UUIDs: %@", buf, 0x20u);
  }
  uint64_t v27 = @"HMPM.mk.pu";
  id v28 = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMPersonManager *)v10 UUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  int v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.fpfc" destination:v18 payload:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMPersonManager *)v10 context];
  __int16 v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19];
}

void __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v10;
      __int16 v42 = 2114;
      id v43 = v12;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crops: %@", buf, 0x20u);
    }
    int v13 = [a1[4] context];
    uint64_t v14 = [v13 delegateCaller];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_141;
    v36[3] = &unk_1E59454E8;
    id v38 = a1[6];
    id v37 = v5;
    [v14 invokeBlock:v36];

    uint64_t v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v15 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMPM.mk.fc", v16);

    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1[4];
    int v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [a1[5] identifier];
        __int16 v23 = [v22 shortDescription];
        uint64_t v24 = [v15 count];
        *(_DWORD *)buf = 138543874;
        __int16 v41 = v21;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu face crops", buf, 0x20u);
      }
      id v25 = [a1[4] context];
      id v26 = [v25 delegateCaller];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_144;
      v31[3] = &unk_1E59454E8;
      uint64_t v27 = &v33;
      id v33 = a1[6];
      id v32 = v15;
      [v26 invokeBlock:v31];

      id v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v29;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized person face crops in response payload: %@", buf, 0x16u);
      }
      id v28 = [a1[4] context];
      id v30 = [v28 delegateCaller];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_143;
      v34[3] = &unk_1E59454C0;
      uint64_t v27 = &v35;
      id v35 = a1[6];
      [v30 invokeBlock:v34];
    }
  }
}

uint64_t __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_143(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch face crops"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crops with UUIDs: %@", buf, 0x20u);
  }
  uint64_t v27 = @"HMPM.mk.fcu";
  id v28 = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMPersonManager *)v10 UUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  int v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.ffc" destination:v18 payload:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMPersonManager *)v10 context];
  __int16 v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19];
}

void __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v10;
      __int16 v42 = 2114;
      id v43 = v12;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crops: %@", buf, 0x20u);
    }
    int v13 = [a1[4] context];
    uint64_t v14 = [v13 delegateCaller];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_134;
    v36[3] = &unk_1E59454E8;
    id v38 = a1[6];
    id v37 = v5;
    [v14 invokeBlock:v36];

    uint64_t v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v15 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMPM.mk.fc", v16);

    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1[4];
    int v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [a1[5] identifier];
        __int16 v23 = [v22 shortDescription];
        uint64_t v24 = [v15 count];
        *(_DWORD *)buf = 138543874;
        __int16 v41 = v21;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu face crops", buf, 0x20u);
      }
      id v25 = [a1[4] context];
      id v26 = [v25 delegateCaller];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_137;
      v31[3] = &unk_1E59454E8;
      uint64_t v27 = &v33;
      id v33 = a1[6];
      id v32 = v15;
      [v26 invokeBlock:v31];

      id v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v29;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized face crops in response payload: %@", buf, 0x16u);
      }
      id v28 = [a1[4] context];
      id v30 = [v28 delegateCaller];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_136;
      v34[3] = &unk_1E59454C0;
      uint64_t v27 = &v35;
      id v35 = a1[6];
      [v30 invokeBlock:v34];
    }
  }
}

uint64_t __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_136(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch all persons"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all persons", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMPersonManager *)v7 UUID];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  uint64_t v15 = [(HMPersonManager *)v7 fetchClientFactory];
  id v16 = [v5 identifier];
  uint64_t v17 = [(HMPersonManager *)v7 context];
  id v18 = ((void (**)(void, void *, void *, __CFString *, void *))v15)[2](v15, v16, v17, @"HMPM.m.fp", v14);

  [v18 setClassForUnarchiving:objc_opt_class()];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__HMPersonManager_fetchAllPersonsWithCompletion___block_invoke;
  v21[3] = &unk_1E59437B0;
  v21[4] = v7;
  id v22 = v5;
  id v23 = v4;
  id v19 = v4;
  id v20 = v5;
  [v18 fetchWithCompletion:v21];
}

void __49__HMPersonManager_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v61 = v6;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v62 = v5;
    id v9 = v5;
    id v10 = (void *)v8;
    id obj = v9;
    uint64_t v63 = (void *)v8;
    uint64_t v64 = a1;
    uint64_t v67 = [v9 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (!v67) {
      goto LABEL_21;
    }
    uint64_t v66 = *(void *)v69;
    while (1)
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v69 != v66) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        int v13 = [v12 externalPersonUUID];
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F29128] UUID];
        }
        id v16 = v15;

        uint64_t v17 = [v10 objectForKeyedSubscript:v16];
        id v18 = v17;
        if (!v17) {
          goto LABEL_18;
        }
        id v19 = [v17 UUID];
        id v20 = [v12 UUID];
        uint64_t v21 = [v19 compare:v20];

        id v22 = (void *)MEMORY[0x19F3A64A0]();
        id v23 = *(id *)(a1 + 32);
        uint64_t v24 = HMFGetOSLogHandle();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
        if (v21 != 1)
        {
          if (v25)
          {
            id v29 = HMFGetLogIdentifier();
            id v30 = [*(id *)(a1 + 40) identifier];
            __int16 v31 = [v30 shortDescription];
            *(_DWORD *)buf = 138543874;
            id v73 = v29;
            __int16 v74 = 2114;
            uint64_t v75 = v31;
            __int16 v76 = 2112;
            uint64_t v77 = (uint64_t)v18;
            _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Ignoring person with duplicate external person UUID: %@", buf, 0x20u);

            a1 = v64;
            id v10 = v63;
          }

LABEL_18:
          [v10 setObject:v12 forKeyedSubscript:v16];
          goto LABEL_19;
        }
        if (v25)
        {
          __int16 v26 = HMFGetLogIdentifier();
          uint64_t v27 = [*(id *)(a1 + 40) identifier];
          uint64_t v28 = [v27 shortDescription];
          *(_DWORD *)buf = 138543874;
          id v73 = v26;
          __int16 v74 = 2114;
          uint64_t v75 = v28;
          __int16 v76 = 2112;
          uint64_t v77 = (uint64_t)v12;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Ignoring person with duplicate external person UUID: %@", buf, 0x20u);

          a1 = v64;
          id v10 = v63;
        }
LABEL_19:
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (!v67)
      {
LABEL_21:

        id v32 = [v10 allValues];
        uint64_t v33 = [v32 count];
        uint64_t v34 = a1;
        uint64_t v35 = [obj count];
        id v36 = (void *)MEMORY[0x19F3A64A0]();
        id v37 = *(id *)(v34 + 32);
        id v38 = HMFGetOSLogHandle();
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
        if (v33 == v35)
        {
          if (v39)
          {
            id v40 = HMFGetLogIdentifier();
            __int16 v41 = [*(id *)(v64 + 40) identifier];
            __int16 v42 = [v41 shortDescription];
            uint64_t v43 = [v32 count];
            *(_DWORD *)buf = 138543874;
            id v73 = v40;
            __int16 v74 = 2114;
            uint64_t v75 = v42;
            __int16 v76 = 2048;
            uint64_t v77 = v43;
            _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu persons", buf, 0x20u);
          }
        }
        else if (v39)
        {
          uint64_t v52 = HMFGetLogIdentifier();
          uint64_t v53 = [*(id *)(v64 + 40) identifier];
          uint64_t v54 = [v53 shortDescription];
          uint64_t v55 = [v32 count];
          uint64_t v56 = [obj count];
          *(_DWORD *)buf = 138544130;
          id v73 = v52;
          __int16 v74 = 2114;
          uint64_t v75 = v54;
          __int16 v76 = 2048;
          uint64_t v77 = v55;
          __int16 v78 = 2048;
          uint64_t v79 = v56;
          _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu (filtered from %lu) persons", buf, 0x2Au);
        }
        uint64_t v57 = *(void *)(v64 + 48);
        id v58 = (void *)MEMORY[0x1E4F1CAD0];
        v59 = [v63 allValues];
        v60 = [v58 setWithArray:v59];
        (*(void (**)(uint64_t, void *, void))(v57 + 16))(v57, v60, 0);

        id v7 = v61;
        id v5 = v62;
        goto LABEL_30;
      }
    }
  }
  __int16 v44 = (void *)MEMORY[0x19F3A64A0]();
  id v45 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  __int16 v47 = v46 = a1;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    id v48 = HMFGetLogIdentifier();
    [*(id *)(v46 + 40) identifier];
    id v50 = v49 = v7;
    __int16 v51 = [v50 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v73 = v48;
    __int16 v74 = 2114;
    uint64_t v75 = v51;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v49;
    _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all persons: %@", buf, 0x20u);

    id v7 = v49;
  }

  (*(void (**)(void))(*(void *)(v46 + 48) + 16))();
LABEL_30:
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch persons"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching persons with UUIDs: %@", buf, 0x20u);
  }
  uint64_t v27 = @"HMPM.mk.pu";
  id v28 = v6;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMPersonManager *)v10 UUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  id v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.fp" destination:v18 payload:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMPersonManager *)v10 context];
  id v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19];
}

void __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v10;
      __int16 v42 = 2114;
      id v43 = v12;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch persons: %@", buf, 0x20u);
    }
    int v13 = [a1[4] context];
    uint64_t v14 = [v13 delegateCaller];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_117;
    v36[3] = &unk_1E59454E8;
    id v38 = a1[6];
    id v37 = v5;
    [v14 invokeBlock:v36];

    id v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    id v15 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMPM.mk.p", v16);

    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1[4];
    id v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [a1[5] identifier];
        id v23 = [v22 shortDescription];
        uint64_t v24 = [v15 count];
        *(_DWORD *)buf = 138543874;
        __int16 v41 = v21;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu persons", buf, 0x20u);
      }
      id v25 = [a1[4] context];
      id v26 = [v25 delegateCaller];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_124;
      v31[3] = &unk_1E59454E8;
      uint64_t v27 = &v33;
      id v33 = a1[6];
      id v32 = v15;
      [v26 invokeBlock:v31];

      id v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v29;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized persons in response payload: %@", buf, 0x16u);
      }
      id v28 = [a1[4] context];
      id v30 = [v28 delegateCaller];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_122;
      v34[3] = &unk_1E59454C0;
      uint64_t v27 = &v35;
      id v35 = a1[6];
      [v30 invokeBlock:v34];
    }
  }
}

uint64_t __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_122(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Perform cloud pull"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    id v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing cloud pull", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMPersonManager *)v7 UUID];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMPM.m.pcp" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__HMPersonManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E5945510;
  v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  id v18 = [(HMPersonManager *)v7 context];
  id v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15];
}

void __50__HMPersonManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      uint64_t v14 = "%{public}@[%{public}@] Failed to perform cloud pull: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    uint64_t v14 = "%{public}@[%{public}@] Successfully performed cloud pull";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  id v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  NSUInteger v4 = [(NSHashTable *)self->_observers count];
  [(NSHashTable *)self->_observers removeObject:v6];
  NSUInteger v5 = [(NSHashTable *)self->_observers count];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5 && v4) {
    [(HMPersonManager *)self unsubscribe];
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  NSUInteger v4 = [(NSHashTable *)self->_observers count];
  [(NSHashTable *)self->_observers addObject:v5];
  os_unfair_lock_unlock(&self->_lock);
  if (!v4) {
    [(HMPersonManager *)self subscribe];
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  NSUInteger v4 = [(HMPersonManager *)self UUID];
  [v3 appendFormat:@" UUID: %@", v4];

  [v3 appendString:@">"];
  id v5 = (void *)[v3 copy];

  return (NSString *)v5;
}

- (void)dealloc
{
  id v3 = [(NSHashTable *)self->_observers anyObject];

  if (v3) {
    [(HMPersonManager *)self unsubscribe];
  }
  NSUInteger v4 = [(HMPersonManager *)self context];
  id v5 = [v4 messageDispatcher];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMPersonManager;
  [(HMPersonManager *)&v6 dealloc];
}

- (HMPersonManager)initWithContext:(id)a3 UUID:(id)a4 zoneName:(id)a5 notificationCenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMPersonManager;
  id v15 = [(HMPersonManager *)&v23 init];
  os_log_type_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v12);
    UUID = v16->_UUID;
    v16->_UUID = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_zoneName, a5);
    objc_storeStrong((id *)&v16->_notificationCenter, a6);
    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v19;

    id fetchClientFactory = v16->_fetchClientFactory;
    v16->_id fetchClientFactory = &__block_literal_global;
  }
  return v16;
}

HMCameraObjectFetchClient *__68__HMPersonManager_initWithContext_UUID_zoneName_notificationCenter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = [[HMCameraObjectFetchClient alloc] initWithUUID:v11 context:v10 messageName:v9 destination:v8];

  return v12;
}

@end