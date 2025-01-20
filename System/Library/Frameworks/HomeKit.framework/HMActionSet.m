@interface HMActionSet
+ (BOOL)isBuiltinActionSetType:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HMActionSet)_shortcutsComponentActionSetWithHome:(void *)a3 actions:;
+ (id)actionSetFromProtoBuf:(id)a3 home:(id)a4;
+ (id)allowedActionClasses;
+ (id)shortcutsComponentActionSet;
+ (id)shortcutsComponentActionSetWithHome:(id)a3 actions:(id)a4;
- (BOOL)_doRemoveActionWithUUID:(id)a3 completionHandler:(id)a4;
- (BOOL)_handleActionRemovedFromPayload:(id)a3 completion:(id)a4;
- (BOOL)_handleActionSetRenameFromPayload:(id)a3 completion:(id)a4;
- (BOOL)_handleActionUpdatedFromResponse:(id)a3 completion:(id)a4;
- (BOOL)executionInProgress;
- (BOOL)isExecuting;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (HMActionSet)init;
- (HMActionSet)initWithCoder:(id)a3;
- (HMActionSet)initWithDictionary:(id)a3 home:(id)a4;
- (HMActionSet)initWithName:(id)a3 type:(id)a4 uuid:(id)a5;
- (HMActionSet)initWithShortcutsDictionaryRepresentation:(id)a3 home:(id)a4;
- (HMApplicationData)applicationData;
- (HMHome)home;
- (HMMutableArray)currentActions;
- (NSDate)lastExecutionDate;
- (NSDictionary)shortcutsDictionaryRepresentation;
- (NSSet)actions;
- (NSString)actionSetType;
- (NSString)assistantIdentifier;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)copyAsBuilder;
- (id)encodeAsProtoBuf;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_addAction:(id)a3 completionHandler:(id)a4;
- (void)_doAddAction:(id)a3 uuid:(id)a4;
- (void)_handleActionSetExecutedNotification:(id)a3;
- (void)_handleActionSetStartExecutionNotification:(id)a3;
- (void)_recomputeAssistantIdentifier;
- (void)_registerNotificationHandlers;
- (void)_removeAction:(id)a3 completionHandler:(id)a4;
- (void)_removeActionsForAccessory:(id)a3;
- (void)_unconfigure;
- (void)_unconfigureContext;
- (void)_updateAction:(id)a3 changes:(id)a4 completionHandler:(id)a5;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)addAction:(HMAction *)action completionHandler:(HMErrorBlock)completion;
- (void)recomputeAssistantIdentifier;
- (void)removeAction:(HMAction *)action completionHandler:(HMErrorBlock)completion;
- (void)resetNameWithCompletionHandler:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setExecutionInProgress:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setLastExecutionDate:(id)a3;
- (void)setName:(id)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(HMErrorBlock)completion;
- (void)updateWithBuilder:(id)a3 completionHandler:(id)a4;
@end

@implementation HMActionSet

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
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
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSString *)self->_name copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HMActionSet *)self setContext:v6];
  [(HMActionSet *)self setHome:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(HMActionSet *)self actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "__configureWithContext:actionSet:", v6, self);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = [(HMActionSet *)self actionSetType];
  char v14 = [v13 isEqualToString:@"HMActionSetTypeShortcutsComponent"];

  if ((v14 & 1) == 0) {
    [(HMActionSet *)self _registerNotificationHandlers];
  }
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContext:(id)a3
{
}

- (void)_registerNotificationHandlers
{
  v3 = [(HMActionSet *)self context];
  v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"kActionSetWillStartExecutionNotificationKey" receiver:self selector:sel__handleActionSetStartExecutionNotification_];

  id v6 = [(HMActionSet *)self context];
  id v5 = [v6 messageDispatcher];
  [v5 registerForMessage:@"kActionSetExecutedNotificationKey" receiver:self selector:sel__handleActionSetExecutedNotification_];
}

- (_HMContext)context
{
  return self->_context;
}

- (HMActionSet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionSetUUID"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionSetName"];
  v8 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"actionSetType");
  uint64_t v9 = [(HMActionSet *)self initWithName:v7 type:v8 uuid:v6];
  if (v9)
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v9->_home, v10);

    v9->_executionInProgress = [v4 decodeBoolForKey:@"HM.actionSetExecutionInProgress"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.actionSetLastExecutionDate"];
    lastExecutionDate = v9->_lastExecutionDate;
    v9->_lastExecutionDate = (NSDate *)v11;

    currentActions = v9->_currentActions;
    char v14 = +[HMActionSet allowedActionClasses];
    long long v15 = [v4 decodeObjectOfClasses:v14 forKey:@"actionSetActions"];
    [(HMMutableArray *)currentActions setArray:v15];

    long long v16 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
    applicationData = v9->_applicationData;
    v9->_applicationData = v16;
  }
  return v9;
}

- (HMActionSet)initWithName:(id)a3 type:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMActionSet;
  uint64_t v11 = [(HMActionSet *)&v24 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v8);
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v10);
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

    if (v9) {
      long long v16 = v9;
    }
    else {
      long long v16 = @"HMActionSetTypeUserDefined";
    }
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v16);
    actionSetType = v11->_actionSetType;
    v11->_actionSetType = (NSString *)v17;

    uint64_t v19 = +[HMMutableArray array];
    currentActions = v11->_currentActions;
    v11->_currentActions = (HMMutableArray *)v19;

    v21 = objc_alloc_init(HMApplicationData);
    applicationData = v11->_applicationData;
    v11->_applicationData = v21;
  }
  return v11;
}

+ (id)allowedActionClasses
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:7];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9, v10, v11);

  return v4;
}

- (NSSet)actions
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(HMActionSet *)self currentActions];
  id v5 = [v4 array];
  uint64_t v6 = (void *)[v3 initWithArray:v5];

  return (NSSet *)v6;
}

- (HMMutableArray)currentActions
{
  return self->_currentActions;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executionInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)lastExecutionDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDate *)self->_lastExecutionDate copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDate *)v4;
}

- (HMActionSet)initWithShortcutsDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v8, "hmf_stringForKey:", @"HMActionSetSerializedDictionaryProtocol");
  if (![v9 isEqualToString:@"ProtoBuf"]) {
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend(v8, "hmf_stringForKey:", @"HMActionSetSerializedDictionaryVersion");
  int v11 = [v10 isEqualToString:@"1.0"];

  if (v11)
  {
    uint64_t v9 = objc_msgSend(v8, "hmf_dataForKey:", @"HMActionSetSerializedData");
    if (v9)
    {
      uint64_t v12 = [[HMPBActionSet alloc] initWithData:v9];
      if (v12)
      {
        uint64_t v13 = +[HMActionSet actionSetFromProtoBuf:v12 home:v7];
      }
      else
      {
        uint64_t v13 = 0;
      }

      goto LABEL_10;
    }
LABEL_6:
    uint64_t v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (NSDictionary)shortcutsDictionaryRepresentation
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v2 = [(HMActionSet *)self encodeAsProtoBuf];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 data];
    v7[0] = @"HMActionSetSerializedDictionaryVersion";
    v7[1] = @"HMActionSetSerializedDictionaryProtocol";
    v8[0] = @"1.0";
    v8[1] = @"ProtoBuf";
    v7[2] = @"HMActionSetSerializedData";
    v8[2] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDictionary *)v5;
}

+ (id)shortcutsComponentActionSetWithHome:(id)a3 actions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    uint64_t v9 = +[HMActionSet _shortcutsComponentActionSetWithHome:actions:]((uint64_t)a1, v6, v7);

    return v9;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return +[HMActionSet _shortcutsComponentActionSetWithHome:actions:](v11, v12, v13);
  }
}

+ (HMActionSet)_shortcutsComponentActionSetWithHome:(void *)a3 actions:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v35 = self;
  id v6 = [HMActionSet alloc];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [(HMActionSet *)v6 initWithName:v8 type:@"HMActionSetTypeShortcutsComponent" uuid:v9];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
LABEL_3:
    id v15 = v4;
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v38 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
      id v36 = 0;
      char v18 = objc_msgSend(v17, "isValidWithError:", &v36, v35);
      id v19 = v36;
      if ((v18 & 1) == 0) {
        break;
      }
      uint64_t v20 = [v17 actionSet];

      if (v20)
      {
        v25 = (void *)MEMORY[0x19F3A64A0]();
        v26 = v35;
        id v33 = v35;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v29;
          __int16 v43 = 2112;
          v44 = v17;
          v30 = "%{public}@Action is in another action set: %@";
          v31 = v28;
          uint32_t v32 = 22;
LABEL_15:
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        }
        goto LABEL_16;
      }
      v21 = [MEMORY[0x1E4F29128] UUID];
      [v17 setUuid:v21];

      v22 = [(HMActionSet *)v10 currentActions];
      [v22 addObject:v17];

      if (v13 == ++v16)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
        id v4 = v15;
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = v35;
    id v27 = v35;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v42 = v29;
      __int16 v43 = 2112;
      v44 = v17;
      __int16 v45 = 2112;
      id v46 = v19;
      v30 = "%{public}@Invalid action %@: %@";
      v31 = v28;
      uint32_t v32 = 32;
      goto LABEL_15;
    }
LABEL_16:
    id v4 = v15;

    objc_super v24 = 0;
    goto LABEL_17;
  }
LABEL_10:

  v23 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.ShortcutsComponent"];
  [(HMActionSet *)v10 __configureWithContext:v23 home:v4];

  objc_super v24 = v10;
LABEL_17:

  return v24;
}

+ (id)shortcutsComponentActionSet
{
  return +[HMActionSet _shortcutsComponentActionSetWithHome:actions:]((uint64_t)a1, 0, 0);
}

- (void)updateWithBuilder:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMActionSet *)self context];
  uint64_t v9 = [(HMActionSet *)self home];
  uint64_t v10 = v9;
  if (v8)
  {
    id v30 = 0;
    char v11 = [v9 validateBuilder:v6 error:&v30];
    id v12 = v30;
    uint64_t v13 = v12;
    if (v11)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
      id v29 = v12;
      id v15 = [v10 encodeActionSetBuilder:v6 error:&v29];
      id v16 = v29;

      uint64_t v17 = [v14 dictionaryWithDictionary:v15];

      if (v17)
      {
        char v18 = [(HMActionSet *)self uuid];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __69__HMActionSet_ActionSetBuilder__updateWithBuilder_completionHandler___block_invoke;
        v24[3] = &unk_1E59441B0;
        id v25 = v8;
        id v28 = v7;
        id v26 = v10;
        id v27 = self;
        -[_HMContext sendMessage:target:payload:responseHandler:](v25, @"HMUpdateActionSetFromBuilderMessage", v18, v17, v24);

        id v19 = v25;
      }
      else
      {
        id v19 = [v8 delegateCaller];
        [v19 callCompletion:v7 error:v16];
      }
    }
    else
    {
      uint64_t v17 = [v8 delegateCaller];
      [v17 callCompletion:v7 error:v13];
      id v16 = v13;
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint32_t v32 = v23;
      __int16 v33 = 2080;
      v34 = "-[HMActionSet(ActionSetBuilder) updateWithBuilder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __69__HMActionSet_ActionSetBuilder__updateWithBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [(HMActionSet *)v6 callCompletion:*(void *)(a1 + 56) error:v10];
  }
  else
  {
    id v6 = [[HMActionSet alloc] initWithDictionary:v5 home:*(void *)(a1 + 40)];
    if (v6)
    {
      [*(id *)(a1 + 48) mergeFromNewObjectForBuilderUpdates:v6];
      id v7 = [*(id *)(a1 + 32) delegateCaller];
      [v7 callCompletion:*(void *)(a1 + 56) error:0];
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) delegateCaller];
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v7 callCompletion:v8 error:v9];
    }
  }
}

- (id)copyAsBuilder
{
  id v3 = [HMActionSetBuilder alloc];

  return [(HMActionSetBuilder *)v3 initWithActionSet:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_lastExecutionDate, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (BOOL)executionInProgress
{
  return self->_executionInProgress;
}

- (id)encodeAsProtoBuf
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMActionSet *)self home];
  if (v3)
  {
    id v4 = objc_alloc_init(HMPBActionSet);
    id v5 = [v3 uuid];
    id v6 = objc_msgSend(v5, "hm_convertToData");
    [(HMPBActionSet *)v4 setHomeUUID:v6];

    id v7 = [(HMActionSet *)self uuid];
    uint64_t v8 = objc_msgSend(v7, "hm_convertToData");
    [(HMPBActionSet *)v4 setUuid:v8];

    uint64_t v9 = [(HMActionSet *)self uuid];
    id v10 = [v3 actionSetWithUUID:v9];

    if (!v10)
    {
      char v11 = [(HMActionSet *)self name];
      [(HMPBActionSet *)v4 setName:v11];

      id v12 = [(HMActionSet *)self actionSetType];
      [(HMPBActionSet *)v4 setActionSetType:v12];

      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(HMPBActionSet *)v4 setActions:v13];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v14 = [(HMActionSet *)self actions];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v26 + 1) + 8 * i) encodeAsProtoBuf];
            if (v19)
            {
              uint64_t v20 = [(HMPBActionSet *)v4 actions];
              [v20 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v16);
      }
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_super v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint32_t v32 = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@home is nil while encoding ActionSet", buf, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  id v6 = [(HMActionSet *)self currentActions];
  id v7 = [v6 array];
  uint64_t v8 = [v4 currentActions];
  uint64_t v9 = [v8 array];
  id v10 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v9];

  char v11 = [(HMObjectMergeCollection *)v10 removedObjects];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v23[3] = &unk_1E5944200;
  v23[4] = self;
  [v11 enumerateObjectsUsingBlock:v23];

  id v12 = [(HMObjectMergeCollection *)v10 addedObjects];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke_73;
  v22[3] = &unk_1E5944200;
  v22[4] = self;
  [v12 enumerateObjectsUsingBlock:v22];

  [(HMObjectMergeCollection *)v10 mergeCommonObjects];
  LODWORD(v12) = [(HMObjectMergeCollection *)v10 isModified];
  if (v12)
  {
    id v13 = [(HMObjectMergeCollection *)v10 finalObjects];
    uint64_t v14 = [(HMActionSet *)self currentActions];
    [v14 setArray:v13];
  }
  uint64_t v15 = [(HMActionSet *)self name];
  uint64_t v16 = [v4 name];
  char v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    id v12 = [v4 name];
    [(HMActionSet *)self setName:v12];

    LOBYTE(v12) = 1;
  }
  char v18 = [(HMActionSet *)self applicationData];
  id v19 = [v4 applicationData];
  char v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    id v12 = [v4 applicationData];
    [(HMActionSet *)self setApplicationData:v12];

    LOBYTE(v12) = 1;
  }

  return (char)v12;
}

void __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:actionSet:", v8, *(void *)(a1 + 32));
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  id v6 = [(HMActionSet *)self currentActions];
  uint64_t v13 = [v6 array];
  id v7 = [v4 currentActions];
  int v8 = [v7 array];
  int v9 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v13 newObjects:v8];

  __int16 v10 = [(HMObjectMergeCollection *)v9 removedObjects];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __34__HMActionSet_mergeFromNewObject___block_invoke;
  v47[3] = &unk_1E5944200;
  v47[4] = self;
  [v10 enumerateObjectsUsingBlock:v47];

  __int16 v11 = [(HMObjectMergeCollection *)v9 addedObjects];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_71;
  v46[3] = &unk_1E5944200;
  v46[4] = self;
  [v11 enumerateObjectsUsingBlock:v46];

  [(HMObjectMergeCollection *)v9 mergeCommonObjects];
  id v12 = [(HMActionSet *)self home];
  LODWORD(v13) = [(HMObjectMergeCollection *)v9 isModified];
  if (v13)
  {
    uint64_t v14 = [(HMObjectMergeCollection *)v9 finalObjects];
    uint64_t v15 = [(HMActionSet *)self currentActions];
    [v15 setArray:v14];

    uint64_t v16 = [v12 delegate];
    if (objc_opt_respondsToSelector())
    {
      char v17 = [(HMActionSet *)self context];
      char v18 = [v17 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_72;
      block[3] = &unk_1E5945650;
      block[4] = self;
      id v44 = v16;
      id v45 = v12;
      dispatch_async(v18, block);
    }
  }
  id v19 = [(HMActionSet *)self name];
  char v20 = [v4 name];
  char v21 = [v19 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    v22 = [v4 name];
    [(HMActionSet *)self setName:v22];

    uint64_t v13 = [v12 delegate];
    if (objc_opt_respondsToSelector())
    {
      v23 = [(HMActionSet *)self context];
      objc_super v24 = [v23 queue];
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      long long v38 = __34__HMActionSet_mergeFromNewObject___block_invoke_3;
      long long v39 = &unk_1E5945650;
      long long v40 = self;
      id v41 = v13;
      id v42 = v12;
      dispatch_async(v24, &v36);
    }
    LOBYTE(v13) = 1;
  }
  id v25 = [(HMActionSet *)self applicationData];
  long long v26 = [v4 applicationData];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
  {
    uint64_t v13 = [v4 applicationData];
    [(HMActionSet *)self setApplicationData:v13];

    [v12 notifyDelegateOfAppDataUpdateForActionSet:self];
    LOBYTE(v13) = 1;
  }
  int v28 = [(HMActionSet *)self executionInProgress];
  if (v28 != [v4 executionInProgress])
  {
    -[HMActionSet setExecutionInProgress:](self, "setExecutionInProgress:", [v4 executionInProgress]);
    LOBYTE(v13) = 1;
  }
  long long v29 = [(HMActionSet *)self lastExecutionDate];
  id v30 = [v4 lastExecutionDate];
  char v31 = HMFEqualObjects();

  if ((v31 & 1) == 0)
  {
    uint32_t v32 = [v4 lastExecutionDate];
    [(HMActionSet *)self setLastExecutionDate:v32];

    uint64_t v33 = [v4 lastExecutionDate];

    if (v33)
    {
      v34 = [v4 lastExecutionDate];
      [v12 notifyDelegatesOfExecutionForActionSet:self atDate:v34];
    }
    LOBYTE(v13) = 1;
  }

  return (char)v13;
}

void __34__HMActionSet_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __34__HMActionSet_mergeFromNewObject___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:actionSet:", v8, *(void *)(a1 + 32));
}

void __34__HMActionSet_mergeFromNewObject___block_invoke_72(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMActionSet_mergeFromNewObject___block_invoke_3(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_4;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __34__HMActionSet_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateNameForActionSet:*(void *)(a1 + 48)];
}

uint64_t __34__HMActionSet_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateActionsForActionSet:*(void *)(a1 + 48)];
}

- (void)_handleActionSetExecutedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 dateForKey:@"kActionSetLastexecutionDate"];
  if (v5)
  {
    [(HMActionSet *)self setLastExecutionDate:v5];
    [(HMActionSet *)self setExecutionInProgress:0];
    id v6 = [(HMActionSet *)self home];
    [v6 notifyDelegatesOfExecutionForActionSet:self atDate:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      __int16 v11 = [v4 shortDescription];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received action set executed message without a last execution date: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_handleActionSetStartExecutionNotification:(id)a3
{
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v13);
  }
  id v7 = v6;
  id v8 = [(HMActionSet *)self home];
  id v9 = v8;
  if (v8)
  {
    [v8 updateApplicationData:v14 forActionSet:self completionHandler:v7];
  }
  else
  {
    __int16 v10 = [(HMActionSet *)self context];
    __int16 v11 = [v10 delegateCaller];
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v11 callCompletion:v7 error:v12];
  }
}

- (BOOL)_handleActionSetRenameFromPayload:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", @"kActionSetName");
  if (v8)
  {
    [(HMActionSet *)self setName:v8];
    if (v7)
    {
      id v9 = [(HMActionSet *)self context];
      __int16 v10 = [v9 delegateCaller];
      [v10 callCompletion:v7 error:0];

      char v11 = 0;
    }
    else
    {
      uint64_t v16 = [(HMActionSet *)self home];
      char v17 = [v16 delegate];
      char v18 = objc_opt_respondsToSelector();
      if (v18)
      {
        id v19 = [(HMActionSet *)self context];
        char v20 = [v19 delegateCaller];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __60__HMActionSet__handleActionSetRenameFromPayload_completion___block_invoke;
        v22[3] = &unk_1E5945650;
        id v23 = v17;
        id v24 = v16;
        id v25 = self;
        [v20 invokeBlock:v22];
      }
      char v11 = v18 ^ 1;
    }
  }
  else
  {
    int v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Received a new action set without a new name %@", buf, 0x16u);
    }
    char v11 = 1;
  }

  return v11 & 1;
}

uint64_t __60__HMActionSet__handleActionSetRenameFromPayload_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateNameForActionSet:*(void *)(a1 + 48)];
}

- (BOOL)_handleActionUpdatedFromResponse:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
  uint64_t v9 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kActionInfo");
  __int16 v10 = (void *)v9;
  if (v8 && v9)
  {
    char v11 = [(HMActionSet *)self currentActions];
    int v12 = [v11 firstItemWithUUID:v8];

    if (v12)
    {
      if ([v12 _handleUpdates:v10])
      {
        if (v7)
        {
          id v13 = [(HMActionSet *)self context];
          id v14 = [v13 delegateCaller];
          [v14 callCompletion:v7 error:0];

          char v15 = 0;
        }
        else
        {
          __int16 v28 = [(HMActionSet *)self home];
          uint64_t v29 = [v28 delegate];
          char v30 = objc_opt_respondsToSelector();
          if (v30)
          {
            uint32_t v32 = [(HMActionSet *)self context];
            char v31 = [v32 delegateCaller];
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __59__HMActionSet__handleActionUpdatedFromResponse_completion___block_invoke;
            v33[3] = &unk_1E5945650;
            id v34 = v29;
            id v35 = v28;
            uint64_t v36 = self;
            [v31 invokeBlock:v33];
          }
          char v15 = v30 ^ 1;
        }
        goto LABEL_16;
      }
      char v20 = (void *)MEMORY[0x19F3A64A0]();
      char v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v38 = v23;
        __int16 v39 = 2112;
        long long v40 = v12;
        __int16 v41 = 2112;
        id v42 = v10;
        id v24 = "%{public}@Could not update action (%@) with info (%@)";
        id v25 = v22;
        uint32_t v26 = 32;
        goto LABEL_14;
      }
    }
    else
    {
      char v20 = (void *)MEMORY[0x19F3A64A0]();
      char v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v38 = v23;
        id v24 = "%{public}@Unable to update action.";
        id v25 = v22;
        uint32_t v26 = 12;
LABEL_14:
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
      }
    }

    char v15 = 1;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
  char v17 = self;
  char v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v38 = v19;
    __int16 v39 = 2112;
    long long v40 = v8;
    __int16 v41 = 2112;
    id v42 = v10;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to update action. Either UUID (%@) or info (%@) is invalid", buf, 0x20u);
  }
  char v15 = 1;
LABEL_17:

  return v15 & 1;
}

uint64_t __59__HMActionSet__handleActionUpdatedFromResponse_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateActionsForActionSet:*(void *)(a1 + 48)];
}

- (BOOL)_handleActionRemovedFromPayload:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
  if (v8)
  {
    BOOL v9 = [(HMActionSet *)self _doRemoveActionWithUUID:v8 completionHandler:v7];
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid action UUID : %@", (uint8_t *)&v15, 0x16u);
    }
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_doRemoveActionWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMActionSet *)self currentActions];
  BOOL v9 = [v8 firstItemWithUUID:v6];

  if (v9)
  {
    __int16 v10 = [(HMActionSet *)self currentActions];
    [v10 removeObject:v9];

    [v9 _unconfigure];
    if (v7)
    {
      char v11 = [(HMActionSet *)self context];
      int v12 = [v11 delegateCaller];
      [v12 callCompletion:v7 error:0];

      char v13 = 0;
    }
    else
    {
      id v18 = [(HMActionSet *)self home];
      uint64_t v19 = [v18 delegate];
      char v20 = objc_opt_respondsToSelector();
      if (v20)
      {
        char v21 = [(HMActionSet *)self context];
        v22 = [v21 delegateCaller];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __57__HMActionSet__doRemoveActionWithUUID_completionHandler___block_invoke;
        v24[3] = &unk_1E5945650;
        id v25 = v19;
        id v26 = v18;
        char v27 = self;
        [v22 invokeBlock:v24];
      }
      char v13 = v20 ^ 1;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    int v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@The action does not belong to actionset", buf, 0xCu);
    }
    char v13 = 1;
  }

  return v13 & 1;
}

uint64_t __57__HMActionSet__doRemoveActionWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateActionsForActionSet:*(void *)(a1 + 48)];
}

- (void)_removeActionsForAccessory:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  char v21 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(HMActionSet *)self actions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v9 = v8;
        }
        else {
          BOOL v9 = 0;
        }
        id v10 = v9;

        if (v10)
        {
          char v11 = [v10 characteristic];
          int v12 = [v11 service];

          if (v12)
          {
            char v13 = [v12 accessoryUUID];
            id v14 = [v22 uuid];
            int v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

            if (v15) {
              [v21 addObject:v8];
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v16 = [(HMActionSet *)self currentActions];
  [v16 removeObjectsInArray:v21];

  __int16 v17 = [(HMActionSet *)self home];
  id v18 = [v17 delegate];

  if ([v21 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v19 = [(HMActionSet *)self context];
    char v20 = [v19 delegateCaller];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__HMActionSet__removeActionsForAccessory___block_invoke;
    v24[3] = &unk_1E5945628;
    id v25 = v18;
    id v26 = self;
    [v20 invokeBlock:v24];
  }
}

void __42__HMActionSet__removeActionsForAccessory___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) home];
  [v2 home:v3 didUpdateActionsForActionSet:*(void *)(a1 + 40)];
}

- (void)_doAddAction:(id)a3 uuid:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  id v8 = [(HMActionSet *)self currentActions];
  BOOL v9 = [v8 firstItemWithUUID:v7];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = HMFGetLogIdentifier();
      id v14 = [v6 uniqueIdentifier];
      int v17 = 138544130;
      id v18 = v13;
      __int16 v19 = 2112;
      char v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Action %@ being added has already appeared, making %@ a proxy for existing configured instance %@", (uint8_t *)&v17, 0x2Au);
    }
    HMProxify(v6);
  }
  else
  {
    [v6 setUuid:v7];
    int v15 = [(HMActionSet *)self context];
    objc_msgSend(v6, "__configureWithContext:actionSet:", v15, self);

    uint64_t v16 = [(HMActionSet *)self currentActions];
    [v16 addObject:v6];
  }
}

- (void)_updateAction:(id)a3 changes:(id)a4 completionHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HMActionSet *)self context];
  if (!v10)
  {
    uint64_t v34 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet _updateAction:changes:completionHandler:]", @"completion"];
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      long long v38 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v38;
      __int16 v47 = 2112;
      uint64_t v48 = (const char *)v34;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v34 userInfo:0];
    objc_exception_throw(v39);
  }
  int v12 = v11;
  if (v11)
  {
    if (v8 && v9)
    {
      char v13 = [(HMActionSet *)self home];
      if (v13)
      {
        id v14 = [(HMActionSet *)self currentActions];
        char v15 = [v14 containsObject:v8];

        if (v15)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F65488]);
          int v17 = [(HMActionSet *)self uuid];
          long long v40 = (void *)[v16 initWithTarget:v17];

          id v18 = (void *)MEMORY[0x1E4F654B0];
          v44[0] = @"kActionUUID";
          __int16 v19 = [v8 uuid];
          char v20 = [v19 UUIDString];
          v44[1] = @"kActionInfo";
          v45[0] = v20;
          v45[1] = v9;
          __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
          id v22 = [v18 messageWithName:@"kReplaceActionValueKey" destination:v40 payload:v21];

          objc_initWeak((id *)location, self);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __55__HMActionSet__updateAction_changes_completionHandler___block_invoke;
          v41[3] = &unk_1E5944188;
          objc_copyWeak(&v43, (id *)location);
          id v42 = v10;
          [v22 setResponseHandler:v41];
          __int16 v23 = [v12 messageDispatcher];
          [v23 sendMessage:v22 completionHandler:0];

          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)location);

LABEL_15:
          goto LABEL_16;
        }
        char v31 = [v12 delegateCaller];
        uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      }
      else
      {
        char v31 = [v12 delegateCaller];
        uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      }
      uint64_t v33 = (void *)v32;
      [v31 callCompletion:v10 error:v32];

      goto LABEL_15;
    }
    long long v29 = [v11 delegateCaller];
    long long v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v29 callCompletion:v10 error:v30];
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      long long v27 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v27;
      __int16 v47 = 2080;
      uint64_t v48 = "-[HMActionSet _updateAction:changes:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
    }
    long long v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v28);
  }
LABEL_16:
}

void __55__HMActionSet__updateAction_changes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    int v12 = _Block_copy(*(const void **)(a1 + 32));
    int v15 = 138544130;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    char v20 = v12;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Replace action value response : %@, completionHandler: %@ error %@", (uint8_t *)&v15, 0x2Au);
  }
  if (v5
    || !v6
    || [v9 _handleActionUpdatedFromResponse:v6 completion:*(void *)(a1 + 32)])
  {
    char v13 = [v9 context];
    id v14 = [v13 delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

- (void)_removeAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(HMActionSet *)self context];
  if (!v7)
  {
    uint64_t v34 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet _removeAction:completionHandler:]", @"completion"];
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      long long v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v38;
      __int16 v49 = 2112;
      v50 = (const char *)v34;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v34 userInfo:0];
    objc_exception_throw(v39);
  }
  id v9 = v8;
  if (!v8)
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v18;
      __int16 v49 = 2080;
      v50 = "-[HMActionSet _removeAction:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v19);

    goto LABEL_14;
  }
  if (!v6)
  {
    id v14 = [v8 delegateCaller];
    uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
LABEL_12:
    __int16 v21 = (void *)v20;
    [v14 callCompletion:v7 error:v20];

    goto LABEL_13;
  }
  id v10 = [(HMActionSet *)self currentActions];
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    id v14 = [v9 delegateCaller];
    uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    goto LABEL_12;
  }
  int v12 = [(HMActionSet *)self actionSetType];
  int v13 = [v12 isEqualToString:@"HMActionSetTypeShortcutsComponent"];

  if (v13)
  {
    id v14 = [v6 uuid];
    [(HMActionSet *)self _doRemoveActionWithUUID:v14 completionHandler:v7];
LABEL_13:

    goto LABEL_14;
  }
  long long v40 = [(HMActionSet *)self home];
  if (v40)
  {
    id v22 = (void *)MEMORY[0x1E4F654B0];
    id v23 = objc_alloc(MEMORY[0x1E4F65488]);
    id v24 = [(HMActionSet *)self uuid];
    uint64_t v25 = (void *)[v23 initWithTarget:v24];
    id v45 = @"kActionUUID";
    id v26 = [v6 uuid];
    long long v27 = [v26 UUIDString];
    id v46 = v27;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    long long v29 = [v22 messageWithName:@"kRemoveActionRequestKey" destination:v25 payload:v28];

    objc_initWeak((id *)buf, self);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __47__HMActionSet__removeAction_completionHandler___block_invoke;
    v41[3] = &unk_1E59441D8;
    objc_copyWeak(&v44, (id *)buf);
    id v43 = v7;
    id v30 = v9;
    id v42 = v30;
    [v29 setResponseHandler:v41];
    char v31 = [v30 messageDispatcher];
    [v31 sendMessage:v29 completionHandler:0];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v32 = [v9 delegateCaller];
    uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v32 callCompletion:v7 error:v33];
  }
LABEL_14:
}

void __47__HMActionSet__removeAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    int v12 = _Block_copy(*(const void **)(a1 + 40));
    int v14 = 138544130;
    int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove action response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);
  }
  if (v5
    || !v6
    || [v9 _handleActionRemovedFromPayload:v6 completion:*(void *)(a1 + 40)])
  {
    int v13 = [*(id *)(a1 + 32) delegateCaller];
    [v13 callCompletion:*(void *)(a1 + 40) error:v5];
  }
}

- (void)removeAction:(HMAction *)action completionHandler:(HMErrorBlock)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = action;
  HMErrorBlock v7 = completion;
  id v8 = [(HMActionSet *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet removeAction:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      long long v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMActionSet_removeAction_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      long long v28 = "-[HMActionSet removeAction:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __46__HMActionSet_removeAction_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMActionSet *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      id v40 = 0;
      char v10 = [v6 isValidWithError:&v40];
      id v11 = v40;
      if (v10)
      {
        int v12 = [(HMActionSet *)self actions];
        int v13 = [v12 containsObject:v6];

        if (v13)
        {
          int v14 = [v9 delegateCaller];
          int v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v16 = 1;
LABEL_17:
          uint64_t v25 = [v15 hmErrorWithCode:v16];
          [v14 callCompletion:v7 error:v25];

          goto LABEL_18;
        }
        id v24 = [v6 actionSet];

        if (v24)
        {
          int v14 = [v9 delegateCaller];
          int v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v16 = 30;
          goto LABEL_17;
        }
        id v26 = [(HMActionSet *)self actionSetType];
        int v27 = [v26 isEqualToString:@"HMActionSetTypeShortcutsComponent"];

        if (!v27)
        {
          int v14 = [(HMActionSet *)self home];
          if (v14)
          {
            uint64_t v29 = [v6 _serializeForAdd];
            if (v29)
            {
              id v30 = (void *)v29;
              char v31 = [(HMActionSet *)self uuid];
              __int16 v41 = @"kActionInfo";
              id v42 = v30;
              uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = __44__HMActionSet__addAction_completionHandler___block_invoke;
              v36[3] = &unk_1E59441B0;
              v36[4] = self;
              id v37 = v9;
              id v39 = v7;
              id v38 = v6;
              -[_HMContext sendMessage:target:payload:responseHandler:](v37, @"kAddActionRequestKey", v31, v32, v36);
            }
            else
            {
              uint64_t v34 = [v9 delegateCaller];
              id v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
              [v34 callCompletion:v7 error:v35];

              id v30 = 0;
            }
          }
          else
          {
            id v30 = [v9 delegateCaller];
            uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
            [v30 callCompletion:v7 error:v33];
          }
          goto LABEL_18;
        }
        long long v28 = [MEMORY[0x1E4F29128] UUID];
        [(HMActionSet *)self _doAddAction:v6 uuid:v28];

        id v21 = [v9 delegateCaller];
        int v14 = v21;
        id v22 = v7;
        id v23 = 0;
      }
      else
      {
        id v21 = [v9 delegateCaller];
        int v14 = v21;
        if (!v11)
        {
          int v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v16 = 3;
          goto LABEL_17;
        }
        id v22 = v7;
        id v23 = v11;
      }
    }
    else
    {
      id v11 = [v8 delegateCaller];
      int v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      id v21 = v11;
      id v22 = v7;
      id v23 = v14;
    }
    [v21 callCompletion:v22 error:v23];
LABEL_18:

    goto LABEL_19;
  }
  id v17 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v44 = v20;
    __int16 v45 = 2080;
    id v46 = "-[HMActionSet _addAction:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_19:
  }
}

void __44__HMActionSet__addAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Add action error: %@", (uint8_t *)&v15, 0x16u);
    }
    int v12 = [*(id *)(a1 + 40) delegateCaller];
    [v12 callCompletion:*(void *)(a1 + 56) error:v5];
  }
  else
  {
    if (v10)
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Add action response: %@", (uint8_t *)&v15, 0x16u);
    }
    int v12 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
    [*(id *)(a1 + 32) _doAddAction:*(void *)(a1 + 48) uuid:v12];
    int v14 = [*(id *)(a1 + 40) delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)addAction:(HMAction *)action completionHandler:(HMErrorBlock)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = action;
  HMErrorBlock v7 = completion;
  id v8 = [(HMActionSet *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet addAction:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      long long v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    BOOL v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__HMActionSet_addAction_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      long long v28 = "-[HMActionSet addAction:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __43__HMActionSet_addAction_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMActionSet *)self context];
  if (!v7)
  {
    uint64_t v35 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet _updateName:completionHandler:]", @"completion"];
    uint64_t v36 = (void *)MEMORY[0x19F3A64A0]();
    id v37 = self;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v39;
      __int16 v48 = 2112;
      __int16 v49 = (const char *)v35;
      _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0];
    objc_exception_throw(v40);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    unint64_t v10 = [v6 length];
    if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
    }
    if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
    {
      int v15 = [(HMActionSet *)self home];
      if (v15)
      {
        id v21 = [(HMActionSet *)self name];
        int v22 = [v21 isEqualToString:v6];

        if (v22)
        {
          id v23 = [(HMActionSet *)self context];
          id v24 = [v23 delegateCaller];
          [v24 callCompletion:v7 error:0];
        }
        else
        {
          if (v6)
          {
            id v44 = @"kActionSetName";
            id v45 = v6;
            long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          }
          else
          {
            long long v28 = (void *)MEMORY[0x1E4F1CC08];
          }
          uint64_t v29 = (void *)MEMORY[0x1E4F654B0];
          id v30 = objc_alloc(MEMORY[0x1E4F65488]);
          char v31 = [(HMActionSet *)self uuid];
          uint64_t v32 = (void *)[v30 initWithTarget:v31];
          uint64_t v33 = [v29 messageWithName:@"kRenameActionSetRequestKey" destination:v32 payload:v28];

          objc_initWeak((id *)buf, self);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __45__HMActionSet__updateName_completionHandler___block_invoke;
          v41[3] = &unk_1E5944188;
          objc_copyWeak(&v43, (id *)buf);
          id v42 = v7;
          [v33 setResponseHandler:v41];
          uint64_t v34 = [v9 messageDispatcher];
          [v34 sendMessage:v33 completionHandler:0];

          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        uint64_t v25 = [(HMActionSet *)self context];
        id v26 = [v25 delegateCaller];
        __int16 v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
        [v26 callCompletion:v7 error:v27];

        int v15 = 0;
      }
    }
    else
    {
      id v11 = (void *)MEMORY[0x19F3A64A0]();
      int v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      int v15 = [v9 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
      [v15 callCompletion:v7 error:v16];
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v20;
      __int16 v48 = 2080;
      __int16 v49 = "-[HMActionSet _updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

void __45__HMActionSet__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = _Block_copy(*(const void **)(a1 + 32));
    int v15 = 138544130;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Rename actionSet response : %@, completionHandler: %@ error %@", (uint8_t *)&v15, 0x2Au);
  }
  if (v5
    || !v6
    || [v9 _handleActionSetRenameFromPayload:v6 completion:*(void *)(a1 + 32)])
  {
    int v13 = [v9 context];
    int v14 = [v13 delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

- (void)updateName:(NSString *)name completionHandler:(HMErrorBlock)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  HMErrorBlock v7 = completion;
  uint64_t v8 = [(HMActionSet *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet updateName:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      long long v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HMActionSet_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v24 = v7;
    uint64_t v23 = v6;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      long long v28 = "-[HMActionSet updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);
  }
}

void __44__HMActionSet_updateName_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionSetType];
  if ([v2 isEqualToString:@"HMActionSetTypeTriggerOwned"])
  {

LABEL_4:
    id v10 = [*(id *)(a1 + 32) context];
    id v5 = [v10 delegateCaller];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_5:
    uint64_t v8 = (void *)v7;
    [v5 callCompletion:v6 error:v7];

    return;
  }
  id v3 = [*(id *)(a1 + 32) actionSetType];
  int v4 = [v3 isEqualToString:@"HMActionSetTypeShortcutsComponent"];

  if (v4) {
    goto LABEL_4;
  }
  id v9 = *(void **)(a1 + 32);
  if (!*(void *)(a1 + 40))
  {
    id v10 = [v9 context];
    id v5 = [v10 delegateCaller];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    goto LABEL_5;
  }

  objc_msgSend(v9, "_updateName:completionHandler:");
}

- (void)resetNameWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMActionSet *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMActionSet resetNameWithCompletionHandler:]", @"completion"];
    int v14 = (void *)MEMORY[0x19F3A64A0]();
    int v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMActionSet_resetNameWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2080;
      id v24 = "-[HMActionSet resetNameWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

void __46__HMActionSet_resetNameWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionSetType];
  BOOL v3 = +[HMActionSet isBuiltinActionSetType:v2];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _updateName:0 completionHandler:v5];
  }
  else
  {
    id v9 = [v4 context];
    uint64_t v6 = [v9 delegateCaller];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v6 callCompletion:v7 error:v8];
  }
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMActionSet *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMActionSet *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  uint64_t v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"AS", (uint64_t)self->_uuid, 0);
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setExecutionInProgress:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_executionInProgress = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)requiresDeviceUnlock
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(HMActionSet *)self actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__HMActionSet_requiresDeviceUnlock__block_invoke;
  v4[3] = &unk_1E5944158;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __35__HMActionSet_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 requiresDeviceUnlock];
  if (result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)setLastExecutionDate:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  lastExecutionDate = self->_lastExecutionDate;
  self->_lastExecutionDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_unconfigure
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      char v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring actionSet and actions", buf, 0xCu);
    }
    id v9 = [(HMActionSet *)v5 actions];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v13++) _unconfigure];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    int v14 = [(HMActionSet *)v5 currentActions];
    [v14 setArray:0];

    [(HMActionSet *)v5 setHome:0];
    int v15 = [(HMActionSet *)v5 context];
    uint64_t v16 = [v15 messageDispatcher];
    [v16 deregisterReceiver:v5];

    [(HMActionSet *)v5 setContext:0];
    __int16 v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v18;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);
    }
  }
}

- (void)_unconfigureContext
{
  BOOL v3 = [(_HMContext *)self->_context messageDispatcher];
  [v3 deregisterReceiver:self];

  context = self->_context;
  self->_context = 0;
}

- (HMActionSet)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)HMActionSet;
  char v8 = [(HMActionSet *)&v51 init];
  if (!v8)
  {
LABEL_15:
    uint64_t v35 = v8;
    goto LABEL_24;
  }
  id v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionSetUUID");
  if (!v9)
  {
    uint64_t v36 = (void *)MEMORY[0x19F3A64A0]();
    id v37 = v8;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    id v39 = HMFGetLogIdentifier();
    uint64_t v40 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v54 = v39;
    __int16 v55 = 2112;
    uint64_t v56 = v40;
    __int16 v41 = "%{public}@Unable to decode %@, missing uuid";
    goto LABEL_21;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v9);
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v10;

  uint64_t v12 = objc_msgSend(v6, "hmf_stringForKey:", @"kActionSetName");
  name = v8->_name;
  v8->_name = (NSString *)v12;

  if (v8->_name)
  {
    id v46 = v9;
    uint64_t v14 = objc_msgSend(v6, "hmf_stringForKey:", @"kActionSetType");
    int v15 = (void *)v14;
    uint64_t v16 = @"HMActionSetTypeUserDefined";
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    __int16 v17 = v16;

    id v45 = v17;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v17);
    actionSetType = v8->_actionSetType;
    v8->_actionSetType = (NSString *)v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    long long v22 = objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", @"kActionSetActions", v21);

    uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = [[HMAction alloc] initWithDictionary:*(void *)(*((void *)&v47 + 1) + 8 * i) home:v7];
          if (!v27)
          {

            goto LABEL_23;
          }
          long long v28 = v27;
          [v20 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    uint64_t v29 = +[HMMutableArray arrayWithArray:v20];
    currentActions = v8->_currentActions;
    v8->_currentActions = (HMMutableArray *)v29;

    char v31 = [HMApplicationData alloc];
    uint64_t v32 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kAppDataInformationKey");
    uint64_t v33 = [(HMApplicationData *)v31 initWithContentsOfDictionary:v32];
    applicationData = v8->_applicationData;
    v8->_applicationData = (HMApplicationData *)v33;

    goto LABEL_15;
  }
  uint64_t v36 = (void *)MEMORY[0x19F3A64A0]();
  id v42 = v8;
  id v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = HMFGetLogIdentifier();
    uint64_t v43 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v54 = v39;
    __int16 v55 = 2112;
    uint64_t v56 = v43;
    __int16 v41 = "%{public}@Unable to decode %@, missing name";
LABEL_21:
    _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
  }
LABEL_22:

LABEL_23:
  uint64_t v35 = 0;
LABEL_24:

  return v35;
}

- (HMActionSet)init
{
  return 0;
}

+ (BOOL)isBuiltinActionSetType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HMActionSetTypeWakeUp"] & 1) != 0
    || ([v3 isEqualToString:@"HMActionSetTypeHomeDeparture"] & 1) != 0
    || ([v3 isEqualToString:@"HMActionSetTypeHomeArrival"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"HMActionSetTypeSleep"];
  }

  return v4;
}

+ (id)actionSetFromProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = [v6 uuid];
  uint64_t v10 = objc_msgSend(v8, "hmf_UUIDWithBytesAsData:", v9);

  if (!v10)
  {
    uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = a1;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v69 = v29;
      id v30 = "%{public}@Couldn't decode ActionSet UUID";
LABEL_15:
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
    }
LABEL_16:

    uint64_t v25 = 0;
    goto LABEL_44;
  }
  if (([v6 hasHomeUUID] & 1) == 0)
  {
    uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = a1;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v69 = v29;
      id v30 = "%{public}@homeUUID not set while decoding ActionSet";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F29128];
  uint64_t v12 = [v6 homeUUID];
  uint64_t v13 = objc_msgSend(v11, "hmf_UUIDWithBytesAsData:", v12);

  if (v13)
  {
    uint64_t v14 = [v7 uuid];
    char v15 = [v14 isEqual:v13];

    if (v15)
    {
      uint64_t v16 = [v7 actionSetWithUUID:v10];
      if (v16)
      {
        __int16 v17 = (void *)v16;
        uint64_t v18 = [v6 actions];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          id v20 = (void *)MEMORY[0x19F3A64A0]();
          id v21 = a1;
          long long v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = HMFGetLogIdentifier();
            uint64_t v24 = [v6 formattedText];
            *(_DWORD *)buf = 138543874;
            v69 = v23;
            __int16 v70 = 2112;
            v71 = v10;
            __int16 v72 = 2112;
            v73 = v24;
            _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@actionSetFromProtoBuf found actionSet (%@) in home and actions in proto - ignoring proto: %@", buf, 0x20u);
          }
        }
        uint64_t v25 = v17;
      }
      else
      {
        v60 = v13;
        id v39 = [HMActionSet alloc];
        uint64_t v40 = [v6 name];
        __int16 v41 = [v6 actionSetType];
        v61 = v10;
        id v42 = [(HMActionSet *)v39 initWithName:v40 type:v41 uuid:v10];

        v59 = v42;
        [(HMActionSet *)v42 setHome:v7];
        id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v62 = v6;
        id v44 = [v6 actions];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v63 objects:v67 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v64 != v47) {
                objc_enumerationMutation(v44);
              }
              long long v49 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              switch([v49 type])
              {
                case 1u:
                  long long v50 = HMCharacteristicWriteAction;
                  uint64_t v51 = [v49 characteristicWriteAction];
                  goto LABEL_34;
                case 2u:
                  long long v50 = HMMediaPlaybackAction;
                  uint64_t v51 = [v49 mediaPlaybackAction];
                  goto LABEL_34;
                case 3u:
                  long long v50 = HMLightProfileNaturalLightingAction;
                  uint64_t v51 = [v49 naturalLightingAction];
                  goto LABEL_34;
                case 4u:
                  long long v50 = HMMatterCommandAction;
                  uint64_t v51 = [v49 matterCommandAction];
LABEL_34:
                  v52 = (void *)v51;
                  v53 = [(__objc2_class *)v50 actionWithProtoBuf:v51 home:v7];

                  if (!v53) {
                    goto LABEL_36;
                  }
                  [v43 addObject:v53];

                  break;
                default:
LABEL_36:
                  v54 = (void *)MEMORY[0x19F3A64A0]();
                  __int16 v55 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v56 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v69 = v56;
                    __int16 v70 = 2112;
                    v71 = v49;
                    _os_log_impl(&dword_19D1A8000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action with proto buf: %@", buf, 0x16u);
                  }
                  break;
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v63 objects:v67 count:16];
          }
          while (v46);
        }

        uint64_t v57 = [(HMActionSet *)v59 currentActions];
        [v57 addObjectsFromArray:v43];

        uint64_t v25 = v59;
        uint64_t v10 = v61;
        id v6 = v62;
        uint64_t v13 = v60;
      }

      goto LABEL_43;
    }
    char v31 = (void *)MEMORY[0x19F3A64A0]();
    id v35 = a1;
    uint64_t v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      id v38 = [v7 uuid];
      *(_DWORD *)buf = 138543874;
      v69 = v37;
      __int16 v70 = 2112;
      v71 = v13;
      __int16 v72 = 2112;
      v73 = v38;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Trying to deserialize HMActionSet with a different home %@ %@", buf, 0x20u);
    }
  }
  else
  {
    char v31 = (void *)MEMORY[0x19F3A64A0]();
    id v32 = a1;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v69 = v34;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UUID", buf, 0xCu);
    }
  }
  uint64_t v25 = 0;
LABEL_43:

LABEL_44:

  return v25;
}

@end