@interface HMTrigger
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (uint64_t)_validateActionSet:(void *)a3 home:(int)a4 homeOwnedOnly:(void *)a5 error:;
+ (uint64_t)_validateName:(void *)a3 configuredName:(void *)a4 error:;
+ (uint64_t)_validatePolicy:(void *)a3 error:;
- (BOOL)_updateActionSetFromResponse:(id)a3 responsePayload:(id)a4;
- (BOOL)_updateTriggerNameFromResponse:(id)a3 responsePayload:(id)a4;
- (BOOL)compatibleWithApp;
- (BOOL)isEnabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3;
- (HMDevice)ownerDevice;
- (HMHome)home;
- (HMMutableArray)currentActionSets;
- (HMTrigger)initWithCoder:(id)a3;
- (HMTrigger)initWithDictionary:(id)a3 home:(id)a4;
- (HMTrigger)initWithName:(id)a3 configuredName:(id)a4;
- (HMTriggerPolicy)policy;
- (HMUser)owner;
- (NSArray)actionSets;
- (NSDate)lastFireDate;
- (NSString)assistantIdentifier;
- (NSString)configuredName;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_serializeForAdd;
- (id)copyAsBuilder;
- (id)logIdentifier;
- (id)triggerName;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_addActionSetOfType:(id)a3 completionHandler:(id)a4;
- (void)_enable:(BOOL)a3 completionHandler:(id)a4;
- (void)_handleTriggerFired:(id)a3;
- (void)_handleTriggerFiredNotification:(id)a3;
- (void)_recomputeAssistantIdentifier;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)_updateActionSet:(id)a3 add:(BOOL)a4 completionHandler:(id)a5;
- (void)_updateClientWithResults:(id)a3 withError:(id)a4;
- (void)addActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion;
- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4;
- (void)addActionSetWithCompletionHandler:(id)a3;
- (void)enable:(BOOL)enable completionHandler:(void *)completion;
- (void)recomputeAssistantIdentifier;
- (void)removeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion;
- (void)removePolicy:(id)a3 completionHandler:(id)a4;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentActionSets:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setLastFireDate:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setOwnerDevice:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setTriggerName:(uint64_t)a1;
- (void)setUuid:(id)a3;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5;
- (void)updatePolicy:(id)a3 completionHandler:(id)a4;
@end

@implementation HMTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActionSets, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_ownerDevice, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCurrentActionSets:(id)a3
{
}

- (HMMutableArray)currentActionSets
{
  return self->_currentActionSets;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    v3 = NSString;
    v4 = -[HMTrigger triggerName]((char *)self);
    v5 = [(HMTrigger *)self configuredName];
    v6 = [(HMTrigger *)self uuid];
    v7 = [v6 UUIDString];
    v8 = [v3 stringWithFormat:@"%@/%@/%@", v4, v5, v7];
  }
  else
  {
    v4 = [(HMTrigger *)self uuid];
    v8 = [v4 UUIDString];
  }

  return v8;
}

- (id)triggerName
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)_updateClientWithResults:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(HMTrigger *)self context];
    v8 = [v7 delegateCaller];
    [v8 callCompletion:v9 error:v6];
  }
  else
  {
    v7 = [(HMTrigger *)self home];
    [v7 _notifyDelegateOfTriggerUpdated:self];
  }
}

- (BOOL)compatibleWithApp
{
  return 1;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44 = self;
  v5 = [(HMTrigger *)self currentActionSets];
  id v6 = [v5 array];

  v45 = v4;
  v7 = [v4 currentActionSets];
  v8 = [v7 array];

  v46 = [[HMObjectMergeCollection alloc] initWithCurrentObjects:v6 newObjects:v8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  v48 = v6;
  if (v9)
  {
    uint64_t v10 = v9;
    int v47 = 0;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v14 = [v13 uniqueIdentifier];
        v15 = objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v14, @"uniqueIdentifier");

        v16 = [v13 actionSetType];
        if ([v16 isEqualToString:@"HMActionSetTypeTriggerOwned"])
        {
          v17 = [v15 actionSetType];
          int v18 = [v17 isEqualToString:@"HMActionSetTypeTriggerOwned"];

          if (v18) {
            v47 |= [v15 mergeFromNewObjectForBuilderUpdates:v13];
          }
          id v6 = v48;
        }
        else
        {
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v47) = 0;
  }

  v19 = [(HMObjectMergeCollection *)v46 removedObjects];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v51[3] = &unk_1E5941220;
  v51[4] = v44;
  [v19 enumerateObjectsUsingBlock:v51];

  v20 = [(HMObjectMergeCollection *)v46 addedObjects];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_68;
  v50[3] = &unk_1E5941220;
  v50[4] = v44;
  [v20 enumerateObjectsUsingBlock:v50];

  v21 = [(HMObjectMergeCollection *)v46 finalObjects];
  v22 = [(HMTrigger *)v44 currentActionSets];
  [v22 setArray:v21];

  BOOL v23 = [(HMObjectMergeCollection *)v46 isModified];
  LODWORD(v21) = [(HMTrigger *)v44 isEnabled];
  if (v21 == [v45 isEnabled])
  {
    char v24 = v23 | v47;
  }
  else
  {
    -[HMTrigger setEnabled:](v44, "setEnabled:", [v45 isEnabled]);
    char v24 = 1;
  }
  v25 = [(HMTrigger *)v44 configuredName];
  v26 = [v45 configuredName];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x19F3A64A0]();
    v29 = v44;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v32 = [(HMTrigger *)v29 configuredName];
      v33 = [v45 configuredName];
      *(_DWORD *)buf = 138543874;
      v57 = v31;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2112;
      v61 = v33;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating configured name from %@ to %@ via merge", buf, 0x20u);
    }
    v34 = [v45 configuredName];
    [(HMTrigger *)v29 setConfiguredName:v34];

    char v24 = 1;
  }
  v35 = -[HMTrigger triggerName]((char *)v44);
  v36 = [v45 name];
  char v37 = [v35 isEqualToString:v36];

  if ((v37 & 1) == 0)
  {
    v38 = [v45 name];
    -[HMTrigger setTriggerName:]((uint64_t)v44, v38);

    char v24 = 1;
  }
  v39 = [(HMTrigger *)v44 policy];
  v40 = [v45 policy];
  char v41 = HMFEqualObjects();

  if ((v41 & 1) == 0)
  {
    v42 = [v45 policy];
    [(HMTrigger *)v44 setPolicy:v42];

    char v24 = 1;
  }

  return v24 & 1;
}

void __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action set via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@added action set via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setTriggerName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(a1 + 16), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    LOBYTE(v52) = 0;
    goto LABEL_35;
  }
  v7 = [HMObjectMergeCollection alloc];
  int v8 = [(HMTrigger *)self currentActionSets];
  uint64_t v9 = [v8 array];
  __int16 v10 = [v6 currentActionSets];
  id v11 = [v10 array];
  uint64_t v12 = [(HMObjectMergeCollection *)v7 initWithCurrentObjects:v9 newObjects:v11];

  v13 = [(HMObjectMergeCollection *)v12 removedObjects];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __32__HMTrigger_mergeFromNewObject___block_invoke;
  v76[3] = &unk_1E5941220;
  v76[4] = self;
  [v13 enumerateObjectsUsingBlock:v76];

  v14 = [(HMTrigger *)self home];
  v15 = (void *)MEMORY[0x1E4F1CA48];
  v16 = [v14 actionSets];
  v17 = [v15 arrayWithArray:v16];

  v68 = v14;
  int v18 = [v14 triggerOwnedActionSets];
  [v17 addObjectsFromArray:v18];

  v67 = v17;
  [(HMObjectMergeCollection *)v12 replaceAddedObjectsWithObjects:v17];
  v19 = [(HMObjectMergeCollection *)v12 addedObjects];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_64;
  v75[3] = &unk_1E5941220;
  v75[4] = self;
  [v19 enumerateObjectsUsingBlock:v75];

  v20 = [(HMObjectMergeCollection *)v12 finalObjects];
  v21 = [(HMTrigger *)self currentActionSets];
  [v21 setArray:v20];

  int v22 = [(HMObjectMergeCollection *)v12 isModified];
  LODWORD(v21) = [(HMTrigger *)self isEnabled];
  if (v21 != [v6 isEnabled])
  {
    -[HMTrigger setEnabled:](self, "setEnabled:", [v6 isEnabled]);
    int v22 = 1;
  }
  BOOL v23 = [(HMTrigger *)self lastFireDate];
  char v24 = [v6 lastFireDate];
  char v25 = HMFEqualObjects();

  if ((v25 & 1) == 0)
  {
    v26 = [v6 lastFireDate];
    [(HMTrigger *)self setLastFireDate:v26];

    int v22 = 1;
  }
  char v27 = [(HMTrigger *)self configuredName];
  v28 = [v6 configuredName];
  char v29 = HMFEqualObjects();

  if ((v29 & 1) == 0)
  {
    v30 = (void *)MEMORY[0x19F3A64A0]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [(HMTrigger *)v31 configuredName];
      v35 = [v6 configuredName];
      *(_DWORD *)buf = 138543874;
      v78 = v33;
      __int16 v79 = 2112;
      v80 = v34;
      __int16 v81 = 2112;
      v82 = v35;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating configured name from %@ to %@ via merge", buf, 0x20u);
    }
    v36 = [v6 configuredName];
    [(HMTrigger *)v31 setConfiguredName:v36];

    int v22 = 1;
  }
  char v37 = -[HMTrigger triggerName]((char *)self);
  v38 = [v6 name];
  char v39 = [v37 isEqualToString:v38];

  if ((v39 & 1) == 0)
  {
    v40 = [v6 name];
    -[HMTrigger setTriggerName:]((uint64_t)self, v40);

    char v41 = [(HMTrigger *)self home];
    v42 = [v41 delegate];
    if (objc_opt_respondsToSelector())
    {
      v43 = [(HMTrigger *)self context];
      v44 = [v43 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_65;
      block[3] = &unk_1E5945650;
      block[4] = self;
      id v73 = v42;
      id v74 = v41;
      dispatch_async(v44, block);
    }
    int v22 = 1;
  }
  v45 = [(HMTrigger *)self ownerDevice];

  v46 = [v6 ownerDevice];
  int v47 = v46;
  if (v45)
  {

    if (v47)
    {
      v48 = [(HMTrigger *)self ownerDevice];
      v49 = [v6 ownerDevice];
      int v50 = [v48 mergeFromNewObject:v49];

      int v51 = v50 | v22;
      goto LABEL_24;
    }
    long long v53 = [v6 ownerDevice];
    [(HMTrigger *)self setOwnerDevice:v53];
  }
  else
  {
    [(HMTrigger *)self setOwnerDevice:v46];
  }
  int v51 = 1;
LABEL_24:
  long long v54 = [(HMTrigger *)self owner];
  uint64_t v55 = [v6 owner];
  v56 = (void *)v55;
  if (!v54)
  {
    v57 = self;
    __int16 v58 = v56;
LABEL_29:
    [(HMTrigger *)v57 setOwner:v58];
    LOBYTE(v52) = 1;
    goto LABEL_30;
  }
  if (!v55)
  {
    v57 = self;
    __int16 v58 = 0;
    goto LABEL_29;
  }
  LODWORD(v52) = [v54 mergeFromNewObject:v55] | v51;
LABEL_30:
  v59 = [(HMTrigger *)self policy];
  __int16 v60 = [v6 policy];
  char v61 = HMFEqualObjects();

  if ((v61 & 1) == 0)
  {
    v62 = [v6 policy];
    [(HMTrigger *)self setPolicy:v62];

    long long v52 = [(HMTrigger *)self home];
    uint64_t v63 = [v52 delegate];
    if (objc_opt_respondsToSelector())
    {
      v64 = [(HMTrigger *)self context];
      v65 = [v64 queue];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_3;
      v69[3] = &unk_1E5945650;
      v69[4] = self;
      id v70 = v63;
      id v71 = v52;
      dispatch_async(v65, v69);
    }
    LOBYTE(v52) = 1;
  }

LABEL_35:
  return (char)v52;
}

void __32__HMTrigger_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action set via trigger merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __32__HMTrigger_mergeFromNewObject___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action set via trigger merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __32__HMTrigger_mergeFromNewObject___block_invoke_65(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

void __32__HMTrigger_mergeFromNewObject___block_invoke_3(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_4;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __32__HMTrigger_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateTrigger:*(void *)(a1 + 48)];
}

uint64_t __32__HMTrigger_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateNameForTrigger:*(void *)(a1 + 48)];
}

- (HMTrigger)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMT.triggerConfiguredNameCodingKey"];
  id v7 = [(HMTrigger *)self initWithName:v5 configuredName:v6];
  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    [(HMTrigger *)v7 setHome:v8];

    uint64_t v9 = objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", @"triggerUUID");
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    currentActionSets = v7->_currentActionSets;
    v15 = [v4 decodeObjectOfClasses:v13 forKey:@"triggerActionSets"];
    [(HMMutableArray *)currentActionSets setArray:v15];

    -[HMTrigger setEnabled:](v7, "setEnabled:", [v4 decodeBoolForKey:@"triggerActive"]);
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerLastFireDate"];
    lastFireDate = v7->_lastFireDate;
    v7->_lastFireDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
    ownerDevice = v7->_ownerDevice;
    v7->_ownerDevice = (HMDevice *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
    objc_storeWeak((id *)&v7->_owner, v20);

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    BOOL v23 = [v21 setWithArray:v22];

    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"HMT.policyKey"];
    policy = v7->_policy;
    v7->_policy = (HMTriggerPolicy *)v24;
  }
  return v7;
}

- (void)_registerNotificationHandlers
{
  id v4 = [(HMTrigger *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"kTriggerFiredNotificationKey" receiver:self selector:sel__handleTriggerFiredNotification_];
}

- (BOOL)_updateActionSetFromResponse:(id)a3 responsePayload:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self home];
  uint64_t v9 = objc_msgSend(v7, "hmf_stringForKey:", @"kTriggerActionSetTypeKey");
  __int16 v10 = objc_msgSend(v7, "hmf_numberForKey:", @"kTriggerAddActionSetKey");
  uint64_t v11 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kTriggerActionSetUUIDKey");
  __int16 v81 = (void *)v8;
  v82 = (void *)v11;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v14 = v12 || v11 == 0 || v9 == 0;
  char v15 = !v14;
  char v80 = v15;
  if (!v14)
  {
    int v16 = [v9 isEqualToString:@"HMActionSetTypeTriggerOwned"];
    if (![v10 BOOLValue])
    {
      v26 = [(HMTrigger *)self currentActionSets];
      uint64_t v18 = [v26 firstItemWithUUID:v82];

      char v27 = _Block_copy(v6);
      v20 = v27;
      if (v18)
      {
        v28 = [(HMTrigger *)self currentActionSets];
        [v28 removeObject:v18];
        v19 = 0;
        int aBlock = 1;
      }
      else
      {
        if (!v27)
        {
          uint64_t v18 = 0;
          v19 = 0;
          int aBlock = 1;
          goto LABEL_31;
        }
        v28 = [(HMTrigger *)self context];
        v34 = [v28 delegateCaller];
        [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        v36 = v35 = v20;
        [v34 callCompletion:v35 error:v36];

        v20 = v35;
        uint64_t v18 = 0;
        int aBlock = 0;
        v19 = 0;
      }
LABEL_30:

LABEL_31:
      v77 = v10;
      char v37 = (void *)MEMORY[0x19F3A64A0]();
      v38 = self;
      char v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = v18;
        v40 = v19;
        v42 = char v41 = v20;
        HMFBooleanToString();
        id v43 = v7;
        v44 = v9;
        v46 = id v45 = v6;
        *(_DWORD *)buf = 138543618;
        v84 = v42;
        __int16 v85 = 2112;
        v86 = v46;
        _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_INFO, "%{public}@Should we call completion handler: %@", buf, 0x16u);

        id v6 = v45;
        uint64_t v9 = v44;
        id v7 = v43;

        v20 = v41;
        v19 = v40;
        uint64_t v18 = v75;
      }

      if (aBlock)
      {
        aBlocka = v19;
        int v47 = (void *)MEMORY[0x19F3A64A0]();
        v48 = v38;
        v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          int v50 = v76 = v6;
          int v51 = _Block_copy(v20);
          long long v52 = v20;
          long long v53 = _Block_copy(aBlocka);
          *(_DWORD *)buf = 138543874;
          v84 = v50;
          __int16 v85 = 2112;
          v86 = v51;
          __int16 v87 = 2112;
          v88 = v53;
          _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_INFO, "%{public}@Looks like we did not yet call the completion handler: [completion: %@], [triggerOwnedActionSetAddCompletion: %@]", buf, 0x20u);

          v20 = v52;
          id v6 = v76;
        }

        if (v20)
        {
          long long v54 = v18;
          uint64_t v55 = v20;
          id v56 = v6;
          v57 = (void *)MEMORY[0x19F3A64A0]();
          __int16 v58 = v48;
          v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            __int16 v60 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v84 = v60;
            _os_log_impl(&dword_19D1A8000, v59, OS_LOG_TYPE_INFO, "%{public}@Calling completion handler", buf, 0xCu);
          }
          char v61 = [(HMTrigger *)v58 context];
          v62 = [v61 delegateCaller];
          [v62 callCompletion:v55 error:0];

          id v6 = v56;
          v20 = v55;
          uint64_t v18 = v54;
          v19 = aBlocka;
        }
        else
        {
          uint64_t v63 = (void *)MEMORY[0x19F3A64A0]();
          v64 = v48;
          v65 = HMFGetOSLogHandle();
          BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
          v19 = aBlocka;
          if (aBlocka)
          {
            id v67 = v6;
            if (v66)
            {
              HMFGetLogIdentifier();
              v69 = v68 = v63;
              *(_DWORD *)buf = 138543362;
              v84 = v69;
              _os_log_impl(&dword_19D1A8000, v65, OS_LOG_TYPE_INFO, "%{public}@Calling trigger owned action set add completion handler", buf, 0xCu);

              uint64_t v63 = v68;
            }

            id v70 = [(HMTrigger *)v64 context];
            id v71 = [v70 delegateCaller];
            [v71 callCompletion:aBlocka actionSet:v18 error:0];

            id v6 = v67;
          }
          else
          {
            if (v66)
            {
              HMFGetLogIdentifier();
              id v73 = v72 = v63;
              *(_DWORD *)buf = 138543362;
              v84 = v73;
              _os_log_impl(&dword_19D1A8000, v65, OS_LOG_TYPE_INFO, "%{public}@Calling the trigger delegate", buf, 0xCu);

              uint64_t v63 = v72;
            }

            [v81 _notifyDelegateOfTriggerUpdated:v64];
          }
        }
      }

      __int16 v10 = v77;
      goto LABEL_49;
    }
    int aBlock = v16;
    if (v16)
    {
      v17 = objc_msgSend(v7, "hmf_stringForKey:", @"kActionSetName");
      uint64_t v18 = [v81 createAndAddActionSetWithName:v17 type:v9 uuid:v82];
      v19 = _Block_copy(v6);
      v20 = 0;
    }
    else
    {
      char v29 = [v81 actionSets];
      uint64_t v18 = objc_msgSend(v29, "hmf_firstObjectWithUUID:", v82);

      v30 = _Block_copy(v6);
      v20 = v30;
      v19 = 0;
      if (v18 || !v30)
      {
        int aBlock = 1;
        goto LABEL_29;
      }
      v17 = [(HMTrigger *)self context];
      v31 = [v17 delegateCaller];
      [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v33 = v32 = v20;
      [v31 callCompletion:v32 error:v33];

      v20 = v32;
      uint64_t v18 = 0;
      v19 = 0;
    }

LABEL_29:
    v28 = [(HMTrigger *)self currentActionSets];
    [v28 addObjectIfNotPresent:v18];
    goto LABEL_30;
  }
  v21 = (void *)MEMORY[0x19F3A64A0]();
  int v22 = self;
  BOOL v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = uint64_t v24 = v10;
    *(_DWORD *)buf = 138544386;
    v84 = v25;
    __int16 v85 = 2112;
    v86 = v81;
    __int16 v87 = 2112;
    v88 = v24;
    __int16 v89 = 2112;
    v90 = v82;
    __int16 v91 = 2112;
    v92 = v9;
    _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Required parameters not available. Not updating the action set from response. [Home: %@], [addActionSet : %@], [actionSetUUID: %@], [actionSetType: %@]", buf, 0x34u);

    __int16 v10 = v24;
  }

LABEL_49:

  return v80 ^ 1;
}

- (void)_handleTriggerFiredNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMTrigger *)self context];
  id v9 = [v5 pendingRequests];

  id v6 = [v4 identifier];
  id v7 = [v9 removeCompletionBlockForIdentifier:v6];

  uint64_t v8 = [v4 dictionaryForKey:@"kTriggerInfo"];

  [(HMTrigger *)self _handleTriggerFired:v8];
  [(HMTrigger *)self _updateClientWithResults:v7 withError:0];
}

- (void)_handleTriggerFired:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "hmf_dateForKey:", @"kTriggerLastFireDateKey");
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HMTrigger *)self setLastFireDate:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)_updateTriggerNameFromResponse:(id)a3 responsePayload:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "hmf_stringForKey:", @"kTriggerName");
  id v9 = objc_msgSend(v7, "hmf_stringForKey:", @"HMT.triggerConfiguredNameKey");
  __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  BOOL v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v26 = v13;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated Trigger Name from payload: %@ with name : [%@], configuredName: [%@]", buf, 0x2Au);
  }
  -[HMTrigger setTriggerName:]((uint64_t)v11, v8);
  [(HMTrigger *)v11 setConfiguredName:v9];
  if (v6)
  {
    BOOL v14 = [(HMTrigger *)v11 context];
    char v15 = [v14 delegateCaller];
    [v15 callCompletion:v6 error:0];
    char v16 = 0;
  }
  else
  {
    BOOL v14 = [(HMTrigger *)v11 home];
    char v15 = [v14 delegate];
    char v17 = objc_opt_respondsToSelector();
    if (v17)
    {
      uint64_t v18 = [(HMTrigger *)v11 context];
      v19 = [v18 delegateCaller];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__HMTrigger__updateTriggerNameFromResponse_responsePayload___block_invoke;
      v21[3] = &unk_1E5945650;
      id v22 = v15;
      id v23 = v14;
      uint64_t v24 = v11;
      [v19 invokeBlock:v21];
    }
    char v16 = v17 ^ 1;
  }

  return v16 & 1;
}

uint64_t __60__HMTrigger__updateTriggerNameFromResponse_responsePayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateNameForTrigger:*(void *)(a1 + 48)];
}

- (void)removePolicy:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v31 = 0;
    char v9 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v31);
    id v10 = v31;
    if (v9)
    {
      uint64_t v11 = [(HMTrigger *)self home];
      if (v11)
      {
        BOOL v12 = [(HMTrigger *)self policy];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          BOOL v14 = [(HMTrigger *)self context];
          char v15 = [v14 delegateCaller];
          [v15 callCompletion:v7 error:0];
        }
        v32 = @"HMT.policyKey";
        uint64_t v33 = MEMORY[0x1E4F1CC08];
        char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        char v17 = (void *)MEMORY[0x1E4F654B0];
        id v18 = objc_alloc(MEMORY[0x1E4F65488]);
        v19 = [(HMTrigger *)self uuid];
        v20 = (void *)[v18 initWithTarget:v19];
        v21 = [v17 messageWithName:@"HMTriggerRemovePolicyKey" destination:v20 payload:v16];

        objc_initWeak((id *)location, self);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __44__HMTrigger_removePolicy_completionHandler___block_invoke;
        v28[3] = &unk_1E5944188;
        objc_copyWeak(&v30, (id *)location);
        id v29 = v7;
        [v21 setResponseHandler:v28];
        id v22 = [v8 messageDispatcher];
        [v22 sendMessage:v21];

        objc_destroyWeak(&v30);
        objc_destroyWeak((id *)location);
      }
      else
      {
        char v16 = [(HMTrigger *)self context];
        v21 = [v16 delegateCaller];
        __int16 v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
        [v21 callCompletion:v7 error:v27];
      }
    }
    else
    {
      uint64_t v11 = [v8 delegateCaller];
      [v11 callCompletion:v7 error:v10];
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    char v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v26;
      __int16 v35 = 2080;
      v36 = "-[HMTrigger removePolicy:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

+ (uint64_t)_validatePolicy:(void *)a3 error:
{
  id v4 = a2;
  self;
  id v5 = v4;
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  uint64_t v6 = v4 & (v5 != 0);
  if (a3 && (v6 & 1) == 0)
  {
    *a3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }

  return v6;
}

void __44__HMTrigger_removePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    BOOL v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    BOOL v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger remove policy response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    [v9 setPolicy:0];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)updatePolicy:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v27 = 0;
    char v9 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v27);
    id v10 = v27;
    if (v9)
    {
      uint64_t v11 = [(HMTrigger *)self home];
      if (v11)
      {
        id v30 = @"HMT.deleteAfterExecutionPolicyKey";
        uint64_t v31 = MEMORY[0x1E4F1CC38];
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v28 = @"HMT.policyKey";
        id v29 = v23;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        int v13 = (void *)MEMORY[0x1E4F654B0];
        id v14 = objc_alloc(MEMORY[0x1E4F65488]);
        __int16 v15 = [(HMTrigger *)self uuid];
        id v16 = (void *)[v14 initWithTarget:v15];
        __int16 v17 = [v13 messageWithName:@"HMTriggerUpdatePolicyKey" destination:v16 payload:v12];

        objc_initWeak((id *)location, self);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __44__HMTrigger_updatePolicy_completionHandler___block_invoke;
        v24[3] = &unk_1E5944188;
        objc_copyWeak(&v26, (id *)location);
        id v25 = v7;
        [v17 setResponseHandler:v24];
        id v18 = [v8 messageDispatcher];
        [v18 sendMessage:v17];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)location);
      }
      else
      {
        id v23 = [(HMTrigger *)self context];
        BOOL v12 = [v23 delegateCaller];
        __int16 v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
        [v12 callCompletion:v7 error:v17];
      }
    }
    else
    {
      uint64_t v11 = [v8 delegateCaller];
      [v11 callCompletion:v7 error:v10];
    }
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v22;
      __int16 v33 = 2080;
      v34 = "-[HMTrigger updatePolicy:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __44__HMTrigger_updatePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    BOOL v12 = _Block_copy(*(const void **)(a1 + 32));
    int v24 = 138544130;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger update policy response : %@, completionHandler: %@ error %@", (uint8_t *)&v24, 0x2Au);
  }
  if (!v5 && v6)
  {
    uint64_t v13 = objc_msgSend(v6, "hmf_stringForKey:", @"HMT.triggerPolicyUUIDKey");
    if (!v13)
    {
      id v20 = [v9 context];
      uint64_t v21 = [v20 delegateCaller];
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
      [v21 callCompletion:v22 error:v23];

      goto LABEL_8;
    }
    id v14 = (void *)v13;
    __int16 v15 = [HMTriggerDeleteAfterExecutionPolicy alloc];
    id v16 = (objc_class *)MEMORY[0x1E4F29128];
    __int16 v17 = v15;
    id v18 = (void *)[[v16 alloc] initWithUUIDString:v14];
    __int16 v19 = [(HMTriggerDeleteAfterExecutionPolicy *)v17 initWithPayload:v18 payload:v6];

    [v9 setPolicy:v19];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
LABEL_8:
}

- (id)_serializeForAdd
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = -[HMTrigger triggerName]((char *)self);
  [v3 setObject:v4 forKeyedSubscript:@"kTriggerName"];

  id v5 = [(HMTrigger *)self configuredName];
  [v3 setObject:v5 forKeyedSubscript:@"HMT.triggerConfiguredNameKey"];

  id v6 = [(HMTrigger *)self uuid];
  [v3 setObject:v6 forKeyedSubscript:@"kNewObjectUUIDKey"];

  id v7 = (void *)[v3 copy];

  return v7;
}

- (void)_addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v9 = [(HMTrigger *)self home];
    if (v9)
    {
      if ([v6 isEqualToString:@"HMActionSetTypeTriggerOwned"])
      {
        v32[0] = @"kTriggerAddActionSetKey";
        v32[1] = @"kTriggerActionSetTypeKey";
        v33[0] = MEMORY[0x1E4F1CC38];
        v33[1] = @"HMActionSetTypeTriggerOwned";
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
        uint64_t v11 = (void *)MEMORY[0x1E4F654B0];
        id v12 = objc_alloc(MEMORY[0x1E4F65488]);
        uint64_t v13 = [(HMTrigger *)self uuid];
        id v14 = (void *)[v12 initWithTarget:v13];
        __int16 v15 = [v11 messageWithName:@"kUpdateActionSetTriggerRequestKey" destination:v14 payload:v10];

        objc_initWeak((id *)location, self);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __51__HMTrigger__addActionSetOfType_completionHandler___block_invoke;
        v28[3] = &unk_1E59441D8;
        objc_copyWeak(&v31, (id *)location);
        id v30 = v7;
        id v16 = v8;
        id v29 = v16;
        [v15 setResponseHandler:v28];
        __int16 v17 = [v16 messageDispatcher];
        [v17 sendMessage:v15 completionHandler:0];

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)location);
      }
      else
      {
        id v25 = [(HMTrigger *)self context];
        __int16 v26 = [v25 delegateCaller];
        id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v26 callCompletion:v7 actionSet:0 error:v27];
      }
    }
    else
    {
      uint64_t v22 = [(HMTrigger *)self context];
      id v23 = [v22 delegateCaller];
      int v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v23 callCompletion:v7 actionSet:0 error:v24];

      id v9 = 0;
    }
    goto LABEL_11;
  }
  id v18 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v21;
    __int16 v35 = 2080;
    v36 = "-[HMTrigger _addActionSetOfType:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
  }
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
LABEL_11:
  }
}

void __51__HMTrigger__addActionSetOfType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = _Block_copy(*(const void **)(a1 + 40));
    int v21 = 138544130;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@addActionSetOfType: response : %@, completionHandler: %@ error %@", (uint8_t *)&v21, 0x2Au);
  }
  int v13 = 1;
  if (!v5 && v6)
  {
    id v14 = _Block_copy(*(const void **)(a1 + 40));
    int v13 = [v9 _updateActionSetFromResponse:v14 responsePayload:v6];
  }
  __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
  id v16 = v9;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    __int16 v19 = HMFBooleanToString();
    int v21 = 138543618;
    uint64_t v22 = v18;
    __int16 v23 = 2112;
    id v24 = v19;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@addActionSetOfType: shouldCallClientHandler: %@", (uint8_t *)&v21, 0x16u);
  }
  if (v13)
  {
    id v20 = [*(id *)(a1 + 32) delegateCaller];
    [v20 callCompletion:*(void *)(a1 + 40) actionSet:0 error:v5];
  }
}

- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    id v18 = @"You must provide a completion handler";
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  if (([v6 isEqualToString:@"HMActionSetTypeTriggerOwned"] & 1) == 0)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    id v18 = @"type must be HMActionSetTypeTriggerOwned";
LABEL_11:
    id v19 = [v16 exceptionWithName:v17 reason:v18 userInfo:0];
    objc_exception_throw(v19);
  }
  id v9 = [(HMTrigger *)self context];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HMTrigger_addActionSetOfType_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v21 = v6;
    id v22 = v8;
    dispatch_async(v11, block);
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2080;
      __int16 v26 = "-[HMTrigger addActionSetOfType:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __50__HMTrigger_addActionSetOfType_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addActionSetOfType:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)addActionSetWithCompletionHandler:(id)a3
{
}

- (void)_enable:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMTrigger *)self context];
  if (v7)
  {
    if (v4
      && ([(HMTrigger *)self currentActionSets],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          !v9))
    {
      __int16 v23 = [v7 delegateCaller];
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:26];
    }
    else
    {
      id v10 = [(HMTrigger *)self home];

      if (v10)
      {
        uint64_t v32 = @"kTriggerActivate";
        uint64_t v11 = [NSNumber numberWithBool:v4];
        __int16 v33 = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

        int v13 = (void *)MEMORY[0x1E4F654B0];
        id v14 = objc_alloc(MEMORY[0x1E4F65488]);
        __int16 v15 = [(HMTrigger *)self uuid];
        id v16 = (void *)[v14 initWithTarget:v15];
        uint64_t v17 = [v13 messageWithName:@"kActivateTriggerRequestKey" destination:v16 payload:v12];

        objc_initWeak((id *)location, self);
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        id v28 = __39__HMTrigger__enable_completionHandler___block_invoke;
        uint64_t v29 = &unk_1E5944188;
        objc_copyWeak(&v31, (id *)location);
        id v30 = v6;
        [v17 setResponseHandler:&v26];
        id v18 = objc_msgSend(v7, "messageDispatcher", v26, v27, v28, v29);
        [v18 sendMessage:v17 completionHandler:0];

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)location);

        goto LABEL_12;
      }
      __int16 v23 = [v7 delegateCaller];
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    }
    __int16 v25 = (void *)v24;
    [v23 callCompletion:v6 error:v24];

    goto LABEL_12;
  }
  id v19 = (void *)MEMORY[0x19F3A64A0]();
  id v20 = self;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v22;
    __int16 v35 = 2080;
    v36 = "-[HMTrigger _enable:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
  }
LABEL_12:
}

void __39__HMTrigger__enable_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Activate trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    objc_msgSend(v9, "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", @"kTriggerActivate"));
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)enable:(BOOL)enable completionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = [(HMTrigger *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTrigger enable:completionHandler:]", @"completion"];
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HMTrigger_enable_completionHandler___block_invoke;
    block[3] = &unk_1E5941420;
    block[4] = self;
    BOOL v23 = enable;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v13;
      __int16 v26 = 2080;
      uint64_t v27 = "-[HMTrigger enable:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __38__HMTrigger_enable_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enable:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMTrigger *)self context];
  if (v11)
  {
    id v33 = 0;
    char v12 = +[HMTrigger _validateName:configuredName:error:]((uint64_t)HMTrigger, v8, v9, &v33);
    id v29 = v33;
    if ((v12 & 1) == 0)
    {
      int v13 = [v11 delegateCaller];
      [v13 callCompletion:v10 error:v29];
LABEL_17:

      goto LABEL_18;
    }
    int v13 = [(HMTrigger *)self home];
    if (v13)
    {
      id v14 = -[HMTrigger triggerName]((char *)self);
      if ([v14 isEqualToString:v8])
      {
        uint64_t v15 = [(HMTrigger *)self configuredName];
        int v16 = [v15 isEqualToString:v9];

        if (v16)
        {
          __int16 v17 = [(HMTrigger *)self context];
          id v18 = [v17 delegateCaller];
          [v18 callCompletion:v10 error:0];
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
      __int16 v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", 2, v29);
      [v17 setObject:v8 forKeyedSubscript:@"kTriggerName"];
      if (v9) {
        [v17 setObject:v9 forKeyedSubscript:@"HMT.triggerConfiguredNameKey"];
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F654B0];
      id v25 = objc_alloc(MEMORY[0x1E4F65488]);
      __int16 v26 = [(HMTrigger *)self uuid];
      uint64_t v27 = (void *)[v25 initWithTarget:v26];
      id v18 = [v24 messageWithName:@"kRenameTriggerRequestKey" destination:v27 payload:v17];

      objc_initWeak((id *)buf, self);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __57__HMTrigger_updateName_configuredName_completionHandler___block_invoke;
      v30[3] = &unk_1E5944188;
      objc_copyWeak(&v32, (id *)buf);
      id v31 = v10;
      [v18 setResponseHandler:v30];
      uint64_t v28 = [v11 messageDispatcher];
      [v28 sendMessage:v18 completionHandler:0];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    __int16 v17 = [(HMTrigger *)self context];
    id v18 = [v17 delegateCaller];
    BOOL v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v18 callCompletion:v10 error:v23];

    goto LABEL_16;
  }
  __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
  id v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v35 = v22;
    __int16 v36 = 2080;
    uint64_t v37 = "-[HMTrigger updateName:configuredName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_18:
}

+ (uint64_t)_validateName:(void *)a3 configuredName:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  if (!v6)
  {
    if (a4)
    {
      uint64_t v10 = 20;
      goto LABEL_12;
    }
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  unint64_t v8 = [v6 length];
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  if (v8 <= HMMaxLengthForNaming__hmf_once_v8)
  {
    unint64_t v9 = [v7 length];
    if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
    }
    if (v9 <= HMMaxLengthForNaming__hmf_once_v8)
    {
      uint64_t v11 = 1;
      goto LABEL_15;
    }
  }
  if (!a4) {
    goto LABEL_13;
  }
  uint64_t v10 = 46;
LABEL_12:
  [MEMORY[0x1E4F28C58] hmErrorWithCode:v10];
  uint64_t v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v11;
}

void __57__HMTrigger_updateName_configuredName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    char v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Rename trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (v5
    || !v6
    || [v9 _updateTriggerNameFromResponse:*(void *)(a1 + 32) responsePayload:v6])
  {
    [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
  }
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
}

- (void)removeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = actionSet;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTrigger removeActionSet:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMTrigger *)self home];
    id v28 = 0;
    char v11 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v10, 0, &v28);
    id v12 = v28;

    if (v11)
    {
      int v13 = [v9 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__HMTrigger_removeActionSet_completionHandler___block_invoke;
      block[3] = &unk_1E5945138;
      block[4] = self;
      __int16 v26 = v6;
      id v27 = v7;
      dispatch_async(v13, block);
    }
    else
    {
      id v18 = [v9 delegateCaller];
      [v18 callCompletion:v7 error:v12];

      id v12 = v18;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v17;
      __int16 v31 = 2080;
      id v32 = "-[HMTrigger removeActionSet:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }
}

+ (uint64_t)_validateActionSet:(void *)a3 home:(int)a4 homeOwnedOnly:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  self;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_14;
    }
    uint64_t v17 = 20;
LABEL_13:
    [MEMORY[0x1E4F28C58] hmErrorWithCode:v17];
    uint64_t v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v9)
  {
    uint64_t v10 = [v8 home];
    char v11 = [v10 uuid];
    id v12 = [v9 uuid];
    char v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      if (!a5) {
        goto LABEL_14;
      }
      uint64_t v17 = 11;
      goto LABEL_13;
    }
  }
  if (a4)
  {
    id v14 = [v8 actionSetType];
    BOOL IsHomeOwned = HMActionSetTypeIsHomeOwned(v14);

    if (!IsHomeOwned)
    {
      if (a5)
      {
        uint64_t v17 = 3;
        goto LABEL_13;
      }
LABEL_14:
      uint64_t v16 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v16 = 1;
LABEL_15:

  return v16;
}

uint64_t __47__HMTrigger_removeActionSet_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActionSet:*(void *)(a1 + 40) add:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)addActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = actionSet;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTrigger addActionSet:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMTrigger *)self home];
    id v28 = 0;
    char v11 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v10, 1, &v28);
    id v12 = v28;

    if (v11)
    {
      char v13 = [v9 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__HMTrigger_addActionSet_completionHandler___block_invoke;
      block[3] = &unk_1E5945138;
      block[4] = self;
      __int16 v26 = v6;
      id v27 = v7;
      dispatch_async(v13, block);
    }
    else
    {
      id v18 = [v9 delegateCaller];
      [v18 callCompletion:v7 error:v12];

      id v12 = v18;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v17;
      __int16 v31 = 2080;
      id v32 = "-[HMTrigger addActionSet:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }
}

uint64_t __44__HMTrigger_addActionSet_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActionSet:*(void *)(a1 + 40) add:1 completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateActionSet:(id)a3 add:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMTrigger *)self context];
  if (!v9)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTrigger _updateActionSet:add:completionHandler:]", @"clientCompletionHandler"];
    uint64_t v38 = (void *)MEMORY[0x19F3A64A0]();
    char v39 = self;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      char v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v41;
      __int16 v50 = 2112;
      int v51 = (const char *)v37;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v37 userInfo:0];
    objc_exception_throw(v42);
  }
  char v11 = (void *)v10;
  if (v10)
  {
    id v12 = [(HMTrigger *)self home];
    if (v12)
    {
      char v13 = [(HMTrigger *)self currentActionSets];
      int v14 = [v13 containsObject:v8];

      if (v6)
      {
        if (v14)
        {
          __int16 v15 = [(HMTrigger *)self context];
          uint64_t v16 = [v15 delegateCaller];
          uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
LABEL_14:
          __int16 v36 = (void *)v17;
          [v16 callCompletion:v9 error:v17];

          goto LABEL_15;
        }
      }
      else if ((v14 & 1) == 0)
      {
        __int16 v15 = [(HMTrigger *)self context];
        uint64_t v16 = [v15 delegateCaller];
        uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        goto LABEL_14;
      }
      v46[0] = @"kTriggerAddActionSetKey";
      id v25 = [NSNumber numberWithBool:v6];
      v47[0] = v25;
      v46[1] = @"kTriggerActionSetUUIDKey";
      __int16 v26 = [v8 uuid];
      id v27 = [v26 UUIDString];
      v47[1] = v27;
      v46[2] = @"kTriggerActionSetTypeKey";
      id v28 = [v8 actionSetType];
      v47[2] = v28;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];

      id v30 = (void *)MEMORY[0x1E4F654B0];
      id v31 = objc_alloc(MEMORY[0x1E4F65488]);
      id v32 = [(HMTrigger *)self uuid];
      uint64_t v33 = (void *)[v31 initWithTarget:v32];
      v34 = [v30 messageWithName:@"kUpdateActionSetTriggerRequestKey" destination:v33 payload:v29];

      objc_initWeak((id *)buf, self);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __52__HMTrigger__updateActionSet_add_completionHandler___block_invoke;
      v43[3] = &unk_1E5944188;
      objc_copyWeak(&v45, (id *)buf);
      id v44 = v9;
      [v34 setResponseHandler:v43];
      __int16 v35 = [v11 messageDispatcher];
      [v35 sendMessage:v34 completionHandler:0];

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v22 = [(HMTrigger *)self context];
      BOOL v23 = [v22 delegateCaller];
      id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v23 callCompletion:v9 error:v24];

      id v12 = 0;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v21;
      __int16 v50 = 2080;
      int v51 = "-[HMTrigger _updateActionSet:add:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
LABEL_15:
}

void __52__HMTrigger__updateActionSet_add_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    id v12 = _Block_copy(*(const void **)(a1 + 32));
    int v20 = 138544130;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@_updateActionSet: response : %@, completionHandler: %@ error %@", (uint8_t *)&v20, 0x2Au);
  }
  int v13 = 1;
  if (!v5 && v6)
  {
    int v14 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = [v9 _updateActionSetFromResponse:v14 responsePayload:v6];
  }
  __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
  id v16 = v9;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = HMFBooleanToString();
    int v20 = 138543618;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    id v23 = v19;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@_updateActionSet : shouldCallClientHandler: %@", (uint8_t *)&v20, 0x16u);
  }
  if (v13) {
    [v16 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
  }
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMTrigger *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (void)setPolicy:(id)a3
{
  BOOL v4 = (HMTriggerPolicy *)a3;
  os_unfair_lock_lock_with_options();
  policy = self->_policy;
  self->_policy = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMTriggerPolicy)policy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_policy;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMTrigger *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  id v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"TR", (uint64_t)self->_uuid, 0);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (void)setOwner:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_owner, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMUser)owner
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  os_unfair_lock_unlock(p_lock);

  return (HMUser *)WeakRetained;
}

- (void)setOwnerDevice:(id)a3
{
  BOOL v4 = (HMDevice *)a3;
  os_unfair_lock_lock_with_options();
  ownerDevice = self->_ownerDevice;
  self->_ownerDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDevice)ownerDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_ownerDevice;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (void)setUuid:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
  BOOL v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uuid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setLastFireDate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (NSDate *)[v6 copy];
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)lastFireDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_lastFireDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)actionSets
{
  v2 = [(HMTrigger *)self currentActionSets];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)configuredName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (void *)[(NSString *)self->_configuredName copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  if (configuredName) {
    uint64_t v5 = [(NSString *)configuredName copy];
  }
  else {
    uint64_t v5 = [(NSString *)self->_name copy];
  }
  id v6 = (void *)v5;
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v6;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    __int16 v34 = 2112;
    __int16 v35 = v9;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring trigger with context : %@, Home: %@, HMTrigger: %@", buf, 0x2Au);
  }
  __int16 v22 = v6;

  [(HMTrigger *)v9 setHome:v7];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [(HMTrigger *)v9 currentActionSets];
  int v13 = [v12 array];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "actionSetType", obj);
        int v20 = [v19 isEqualToString:@"HMActionSetTypeTriggerOwned"];

        if (v20) {
          [v7 adoptTriggerOwnedActionSet:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  if (v22)
  {
    objc_storeStrong((id *)&v9->_context, obj);
    [(HMTrigger *)v9 _registerNotificationHandlers];
  }
}

- (void)_unconfigure
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMTrigger *)self actionSets];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 actionSetType];

        if (v9 == @"HMActionSetTypeTriggerOwned") {
          [v8 _unconfigure];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  [(HMTrigger *)self setHome:0];
  [(HMTrigger *)self setLastFireDate:0];
  uint64_t v10 = [(HMTrigger *)self currentActionSets];
  [v10 setArray:0];

  char v11 = [(HMTrigger *)self context];
  id v12 = [v11 messageDispatcher];
  [v12 deregisterReceiver:self];

  [(HMTrigger *)self setContext:0];
  int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 removeObserver:self];
}

- (HMTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)HMTrigger;
  id v8 = [(HMTrigger *)&v73 init];
  if (!v8) {
    goto LABEL_32;
  }
  uint64_t v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kTriggerUUID");
  if (!v9)
  {
    long long v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = v8;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      uint64_t v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v29;
      __int16 v76 = 2112;
      uint64_t v77 = v30;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing uuid", buf, 0x16u);
    }
    goto LABEL_40;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v9);
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v11;

  uint64_t v13 = objc_msgSend(v6, "hmf_stringForKey:", @"kTriggerName");
  if (!v13)
  {
    id v31 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v32 = v8;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = HMFGetLogIdentifier();
      uint64_t v35 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v34;
      __int16 v76 = 2112;
      uint64_t v77 = v35;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing name", buf, 0x16u);
    }
    goto LABEL_39;
  }
  long long v14 = (void *)v13;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v13);
  name = v8->_name;
  v8->_name = (NSString *)v15;

  long long v17 = (void *)MEMORY[0x1E4F654E8];
  id v18 = objc_msgSend(v6, "hmf_stringForKey:", @"HMT.triggerConfiguredNameKey");
  uint64_t v19 = objc_msgSend(v17, "hmf_cachedInstanceForString:", v18);
  configuredName = v8->_configuredName;
  v8->_configuredName = (NSString *)v19;

  v8->_enabled = objc_msgSend(v6, "hmf_BOOLForKey:", @"kTriggerActivate");
  if (objc_msgSend(v6, "hmf_BOOLForKey:", @"HMT.deleteAfterExecutionPolicyKey"))
  {
    uint64_t v21 = +[HMTriggerDeleteAfterExecutionPolicy deleteAfterExecutionPolicy];
    policy = v8->_policy;
    v8->_policy = (HMTriggerPolicy *)v21;
  }
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kTriggerOwnedActionSetKey");
  if (!v23)
  {
    long long v25 = 0;
    goto LABEL_16;
  }
  long long v24 = [[HMActionSet alloc] initWithDictionary:v23 home:v7];
  if (!v24)
  {
LABEL_38:

LABEL_39:
LABEL_40:
    int v51 = 0;
    goto LABEL_41;
  }
  long long v25 = v24;
  [v68 addObject:v24];
LABEL_16:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  objc_msgSend(v6, "hmf_arrayForKey:", @"kTriggerActionSetUUIDKey");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (!v36) {
    goto LABEL_31;
  }
  uint64_t v37 = v36;
  uint64_t v38 = *(void *)v70;
  v65 = v10;
  BOOL v66 = v7;
  uint64_t v63 = v23;
  v64 = v14;
  while (2)
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v70 != v38) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(id *)(*((void *)&v69 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v41 = v40;
      }
      else {
        char v41 = 0;
      }
      id v42 = v41;

      if (!v42) {
        goto LABEL_34;
      }
      uint64_t v43 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v42];
      if (!v43)
      {
        id v42 = v40;
LABEL_34:
        uint64_t v52 = (void *)MEMORY[0x19F3A64A0]();
        long long v53 = v8;
        long long v54 = HMFGetOSLogHandle();
        id v7 = v66;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          uint64_t v55 = HMFGetLogIdentifier();
          uint64_t v56 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v75 = v55;
          __int16 v76 = 2112;
          uint64_t v77 = v56;
          __int16 v78 = 2112;
          id v79 = v40;
          _os_log_impl(&dword_19D1A8000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, invalid actionSet reference '%@'", buf, 0x20u);
        }
LABEL_37:

        long long v14 = v64;
        uint64_t v10 = v65;
        long long v23 = v63;
        goto LABEL_38;
      }
      id v44 = (void *)v43;
      id v45 = [(HMActionSet *)v25 uuid];
      char v46 = [v44 isEqual:v45];

      if (v46) {
        goto LABEL_29;
      }
      uint64_t v47 = [v66 actionSetWithUUID:v44];
      if (!v47)
      {
        __int16 v58 = (void *)MEMORY[0x19F3A64A0]();
        v59 = v8;
        __int16 v60 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          char v61 = HMFGetLogIdentifier();
          uint64_t v62 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v75 = v61;
          __int16 v76 = 2112;
          uint64_t v77 = v62;
          __int16 v78 = 2112;
          id v79 = v44;
          _os_log_impl(&dword_19D1A8000, v60, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve actionSet %@", buf, 0x20u);
        }

        id v7 = v66;
        goto LABEL_37;
      }
      v48 = (void *)v47;
      [v68 addObject:v47];

LABEL_29:
    }
    uint64_t v37 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    uint64_t v10 = v65;
    id v7 = v66;
    long long v23 = v63;
    long long v14 = v64;
    if (v37) {
      continue;
    }
    break;
  }
LABEL_31:

  uint64_t v49 = +[HMMutableArray arrayWithArray:v68];
  currentActionSets = v8->_currentActionSets;
  v8->_currentActionSets = (HMMutableArray *)v49;

LABEL_32:
  int v51 = v8;
LABEL_41:

  return v51;
}

- (HMTrigger)initWithName:(id)a3 configuredName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];

    objc_exception_throw(v22);
  }
  id v8 = v7;
  v23.receiver = self;
  v23.super_class = (Class)HMTrigger;
  uint64_t v9 = [(HMTrigger *)&v23 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v8);
    configuredName = v9->_configuredName;
    v9->_configuredName = (NSString *)v12;

    uint64_t v14 = +[HMMutableArray array];
    currentActionSets = v9->_currentActionSets;
    v9->_currentActionSets = (HMMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v16;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t72 != -1) {
    dispatch_once(&logCategory__hmf_once_t72, &__block_literal_global_9689);
  }
  v2 = (void *)logCategory__hmf_once_v73;

  return v2;
}

uint64_t __24__HMTrigger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v73;
  logCategory__hmf_once_objc_super v73 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyAsBuilder
{
  return 0;
}

@end