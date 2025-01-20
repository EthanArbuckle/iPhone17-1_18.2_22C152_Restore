@interface HMDBackingStoreTransactionActions
+ (id)logCategory;
- (BOOL)addPostApplyActionIfNotPresent:(id)a3 usingBlock:(id)a4;
- (BOOL)changed;
- (BOOL)local;
- (BOOL)saveToAssistant;
- (BOOL)saveToSharedUserAccount;
- (HMDBackingStore)backingStore;
- (HMDBackingStoreTransactionActions)initWithBackingStore:(id)a3 options:(id)a4;
- (NSMutableDictionary)userInfo;
- (id)description;
- (id)logIdentifier;
- (void)addPostApplyActionUsingBlock:(id)a3;
- (void)invokePostApplyActions;
- (void)markChanged;
- (void)markLocalChanged;
- (void)markSaveToAssistant;
- (void)markSaveToSharedUserAccount;
- (void)setBackingStore:(id)a3;
@end

@implementation HMDBackingStoreTransactionActions

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_postApplyActionNames, 0);
  objc_storeStrong((id *)&self->_postApplyActions, 0);
}

- (void)setBackingStore:(id)a3
{
}

- (HMDBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);
  return (HMDBackingStore *)WeakRetained;
}

- (BOOL)saveToSharedUserAccount
{
  return self->_saveToSharedUserAccount;
}

- (BOOL)saveToAssistant
{
  return self->_saveToAssistant;
}

- (BOOL)changed
{
  return self->_changed;
}

- (BOOL)local
{
  return self->_local;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(HMDBackingStoreTransactionOptions *)self _description];
  v5 = (void *)v4;
  v6 = "y";
  if (self->_local) {
    v7 = "y";
  }
  else {
    v7 = "n";
  }
  if (self->_changed) {
    v8 = "y";
  }
  else {
    v8 = "n";
  }
  if (self->_saveToAssistant) {
    v9 = "y";
  }
  else {
    v9 = "n";
  }
  if (!self->_saveToSharedUserAccount) {
    v6 = "n";
  }
  v10 = [v3 stringWithFormat:@"<actions: %@ local=%s change=%s assistant=%s account=%s>", v4, v7, v8, v9, v6];

  return v10;
}

- (id)logIdentifier
{
  return @"BackingStore";
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)invokePostApplyActions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_postApplyActionsInvoked)
  {
    self->_postApplyActionsInvoked = 1;
    v3 = self->_postApplyActions;
    if (v3)
    {
      postApplyActions = self->_postApplyActions;
      self->_postApplyActions = 0;

      postApplyActionNames = self->_postApplyActionNames;
      self->_postApplyActionNames = 0;

      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v6 = v3;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (BOOL)addPostApplyActionIfNotPresent:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_postApplyActionsInvoked) {
    goto LABEL_2;
  }
  postApplyActionNames = self->_postApplyActionNames;
  if (!postApplyActionNames)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:v6];
    long long v11 = self->_postApplyActionNames;
    self->_postApplyActionNames = v10;

    goto LABEL_7;
  }
  if (([(NSMutableSet *)postApplyActionNames containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)self->_postApplyActionNames addObject:v6];
LABEL_7:
    [(HMDBackingStoreTransactionActions *)self addPostApplyActionUsingBlock:v7];
    BOOL v8 = 1;
    goto LABEL_8;
  }
LABEL_2:
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (void)addPostApplyActionUsingBlock:(id)a3
{
  id v4 = a3;
  if (!self->_postApplyActionsInvoked)
  {
    postApplyActions = self->_postApplyActions;
    id v10 = v4;
    if (postApplyActions)
    {
      id v6 = _Block_copy(v4);
      [(NSMutableArray *)postApplyActions addObject:v6];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CA48];
      id v6 = _Block_copy(v4);
      BOOL v8 = [v7 arrayWithObject:v6];
      uint64_t v9 = self->_postApplyActions;
      self->_postApplyActions = v8;
    }
    id v4 = v10;
  }
}

- (void)markSaveToSharedUserAccount
{
  self->_saveToSharedUserAccount = 1;
}

- (void)markSaveToAssistant
{
  self->_saveToAssistant = 1;
}

- (void)markChanged
{
  self->_changed = 1;
}

- (void)markLocalChanged
{
  self->_local = 1;
}

- (HMDBackingStoreTransactionActions)initWithBackingStore:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 source];
  uint64_t v9 = [v7 destination];
  id v10 = [v7 label];
  uint64_t v11 = [v7 mustReplay];
  uint64_t v12 = [v7 mustPush];

  v16.receiver = self;
  v16.super_class = (Class)HMDBackingStoreTransactionActions;
  long long v13 = [(HMDBackingStoreTransactionOptions *)&v16 initWithSource:v8 destination:v9 label:v10 mustReplay:v11 mustPush:v12];

  if (v13)
  {
    objc_storeWeak((id *)&v13->_backingStore, v6);
    long long v14 = v13;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_45787 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_45787, &__block_literal_global_204);
  }
  v2 = (void *)logCategory__hmf_once_v4_45788;
  return v2;
}

uint64_t __48__HMDBackingStoreTransactionActions_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_45788;
  logCategory__hmf_once_v4_45788 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end