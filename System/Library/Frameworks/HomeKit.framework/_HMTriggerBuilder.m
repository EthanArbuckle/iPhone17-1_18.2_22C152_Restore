@interface _HMTriggerBuilder
+ (void)initialize;
- (BOOL)_removeActionSet:(uint64_t)a1;
- (BOOL)isEnabled;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)nameIsConfigured;
- (Class)class;
- (HMActionSetBuilder)triggerOwnedActionSet;
- (HMTriggerPolicy)policy;
- (NSArray)actionSets;
- (NSString)configuredName;
- (NSString)name;
- (_HMTriggerBuilder)initWithContext:(id)a3 home:(id)a4;
- (id)__findTriggerOwnedActionSet;
- (id)creator;
- (id)creatorDevice;
- (id)lastFireDate;
- (uint64_t)__addActionSet:(uint64_t)a1;
- (uint64_t)__indexOfActionSet:(uint64_t)a1;
- (uint64_t)_addActionSet:(uint64_t)a1;
- (void)addActionSet:(id)a3;
- (void)addActionSet:(id)a3 completionHandler:(id)a4;
- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4;
- (void)addActionSetWithCompletionHandler:(id)a3;
- (void)enable:(BOOL)a3 completionHandler:(id)a4;
- (void)removeActionSet:(id)a3;
- (void)removeActionSet:(id)a3 completionHandler:(id)a4;
- (void)removePolicy:(id)a3 completionHandler:(id)a4;
- (void)setActionSets:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setName:(id)a3 isConfigured:(BOOL)a4;
- (void)setPolicy:(id)a3;
- (void)updateName:(id)a3 completionHandler:(id)a4;
- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5;
- (void)updatePolicy:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMTriggerBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSets, 0);
  objc_storeStrong((id *)&self->_policy, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)addActionSetWithCompletionHandler:(id)a3
{
}

- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  if (!v6)
  {
    [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTriggerBuilder addActionSetOfType:completionHandler:]", @"completion"];
    uint64_t v13 = v12 = self;
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = v12;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = (__CFString *)v13;
LABEL_12:
    id v21 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  v7 = v6;
  if (([v22 isEqualToString:@"HMActionSetTypeTriggerOwned"] & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = @"type must be HMActionSetTypeTriggerOwned";
    goto LABEL_12;
  }
  if (self) {
    context = self->super._context;
  }
  else {
    context = 0;
  }
  v9 = context;
  v10 = [(_HMContext *)v9 delegateCaller];
  v11 = [(_HMTriggerBuilder *)self triggerOwnedActionSet];
  [v10 callCompletion:v7 actionSet:v11 error:0];
}

- (HMActionSetBuilder)triggerOwnedActionSet
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  -[_HMTriggerBuilder __findTriggerOwnedActionSet]((uint64_t)self);
  v4 = (HMActionSetBuilder *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [HMActionSetBuilder alloc];
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    v7 = context;
    v8 = [(_HMAutomationBuilder *)self home];
    v4 = [(HMActionSetBuilder *)v5 initWithType:@"HMActionSetTypeTriggerOwned" context:v7 home:v8];

    [(NSMutableArray *)self->_actionSets insertObject:v4 atIndex:0];
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)__findTriggerOwnedActionSet
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 64) firstObject];
    v2 = v1;
    if (v1
      && ([v1 actionSetType],
          v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v3 isEqualToString:@"HMActionSetTypeTriggerOwned"],
          v3,
          v4))
    {
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeActionSet:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTriggerBuilder removeActionSet:completionHandler:]", @"completion"];
    v24 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      __int16 v32 = 2112;
      uint64_t v33 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  v8 = v7;
  v9 = [(_HMAutomationBuilder *)self home];
  id v29 = 0;
  char v10 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v9, 0, &v29);
  id v11 = v29;

  if ((v10 & 1) == 0)
  {
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    v14 = context;
    v15 = [(_HMContext *)v14 delegateCaller];
    v16 = v15;
    if (v11)
    {
      v17 = v8;
      id v18 = v11;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 3;
LABEL_14:
    id v22 = [v20 hmErrorWithCode:v21];
    [v16 callCompletion:v8 error:v22];

    goto LABEL_15;
  }
  BOOL v12 = -[_HMTriggerBuilder _removeActionSet:]((uint64_t)self, v6);
  if (self) {
    uint64_t v13 = self->super._context;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = v13;
  v15 = [(_HMContext *)v14 delegateCaller];
  v16 = v15;
  if (!v12)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 2;
    goto LABEL_14;
  }
  v17 = v8;
  id v18 = 0;
LABEL_11:
  [v15 callCompletion:v17 error:v18];
LABEL_15:
}

- (BOOL)_removeActionSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = -[_HMTriggerBuilder __indexOfActionSet:](a1, v3);
    BOOL v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(a1 + 64) removeObjectAtIndex:v4];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)__indexOfActionSet:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIdentifier];
  BOOL v5 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40___HMTriggerBuilder___indexOfActionSet___block_invoke;
  v10[3] = &unk_1E593E658;
  id v6 = v3;
  id v11 = v6;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [v5 indexOfObjectPassingTest:v10];

  return v8;
}

- (void)removeActionSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_HMAutomationBuilder *)self home];
  id v9 = 0;
  char v6 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v4, v5, 0, &v9);
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    HMExceptionForError(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[_HMTriggerBuilder _removeActionSet:]((uint64_t)self, v4);
}

- (void)addActionSet:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTriggerBuilder addActionSet:completionHandler:]", @"completion"];
    v24 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      __int16 v32 = 2112;
      uint64_t v33 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  id v8 = v7;
  id v9 = [(_HMAutomationBuilder *)self home];
  id v29 = 0;
  char v10 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v9, 1, &v29);
  id v11 = v29;

  if ((v10 & 1) == 0)
  {
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    v14 = context;
    v15 = [(_HMContext *)v14 delegateCaller];
    v16 = v15;
    if (v11)
    {
      v17 = v8;
      id v18 = v11;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 3;
LABEL_14:
    id v22 = [v20 hmErrorWithCode:v21];
    [v16 callCompletion:v8 error:v22];

    goto LABEL_15;
  }
  char v12 = -[_HMTriggerBuilder _addActionSet:]((uint64_t)self, v6);
  if (self) {
    uint64_t v13 = self->super._context;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = v13;
  v15 = [(_HMContext *)v14 delegateCaller];
  v16 = v15;
  if ((v12 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 1;
    goto LABEL_14;
  }
  v17 = v8;
  id v18 = 0;
LABEL_11:
  [v15 callCompletion:v17 error:v18];
LABEL_15:
}

- (uint64_t)_addActionSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    a1 = -[_HMTriggerBuilder __addActionSet:](a1, v3);
    os_unfair_lock_unlock(v4);
  }

  return a1;
}

- (uint64_t)__addActionSet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[_HMTriggerBuilder __indexOfActionSet:](a1, v3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 64) addObject:v3];
      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)addActionSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_HMAutomationBuilder *)self home];
  id v9 = 0;
  char v6 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v4, v5, 1, &v9);
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    HMExceptionForError(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[_HMTriggerBuilder _addActionSet:]((uint64_t)self, v4);
}

- (void)setActionSets:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BOOL v5 = -[_HMTriggerBuilder __findTriggerOwnedActionSet]((uint64_t)self);

  if (v5) {
    -[NSMutableArray removeObjectsInRange:](self->_actionSets, "removeObjectsInRange:", 1, [(NSMutableArray *)self->_actionSets count] - 1);
  }
  else {
    [(NSMutableArray *)self->_actionSets removeAllObjects];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(_HMAutomationBuilder *)self home];
        id v17 = 0;
        char v12 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v10, v11, 1, &v17);
        id v13 = v17;

        if ((v12 & 1) == 0)
        {
          HMExceptionForError(v13);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v14);
        }
        -[_HMTriggerBuilder __addActionSet:]((uint64_t)self, v10);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(locka);
}

- (NSArray)actionSets
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_actionSets copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)enable:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  if (!v15)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTriggerBuilder enable:completionHandler:]", @"completion"];
    char v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0];
    objc_exception_throw(v14);
  }
  [(_HMTriggerBuilder *)self setEnabled:v4];
  if (self) {
    context = self->super._context;
  }
  else {
    context = 0;
  }
  uint64_t v7 = context;
  uint64_t v8 = [(_HMContext *)v7 delegateCaller];
  [v8 callCompletion:v15 error:0];
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removePolicy:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v17 = 0;
  char v7 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, a3, &v17);
  id v8 = v17;
  if (v7)
  {
    [(_HMTriggerBuilder *)self setPolicy:0];
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    char v10 = context;
    id v11 = [(_HMContext *)v10 delegateCaller];
    char v12 = v11;
    id v13 = v6;
    id v14 = 0;
  }
  else
  {
    if (self) {
      id v15 = self->super._context;
    }
    else {
      id v15 = 0;
    }
    char v10 = v15;
    id v11 = [(_HMContext *)v10 delegateCaller];
    char v12 = v11;
    if (!v8)
    {
      v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v12 callCompletion:v6 error:v16];

      goto LABEL_10;
    }
    id v13 = v6;
    id v14 = v8;
  }
  [v11 callCompletion:v13 error:v14];
LABEL_10:
}

- (void)updatePolicy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  char v8 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v18);
  id v9 = v18;
  if (v8)
  {
    [(_HMTriggerBuilder *)self setPolicy:v6];
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    id v11 = context;
    char v12 = [(_HMContext *)v11 delegateCaller];
    id v13 = v12;
    id v14 = v7;
    id v15 = 0;
  }
  else
  {
    if (self) {
      v16 = self->super._context;
    }
    else {
      v16 = 0;
    }
    id v11 = v16;
    char v12 = [(_HMContext *)v11 delegateCaller];
    id v13 = v12;
    if (!v9)
    {
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v13 callCompletion:v7 error:v17];

      goto LABEL_10;
    }
    id v14 = v7;
    id v15 = v9;
  }
  [v12 callCompletion:v14 error:v15];
LABEL_10:
}

- (void)setPolicy:(id)a3
{
  BOOL v4 = (HMTriggerPolicy *)a3;
  os_unfair_lock_lock_with_options();
  policy = self->_policy;
  self->_policy = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMTriggerPolicy)policy
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_policy;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTriggerBuilder updateName:configuredName:completionHandler:]", @"completion"];
    uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
    v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v26;
      __int16 v31 = 2112;
      uint64_t v32 = v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v11 = v10;
  id v28 = 0;
  char v12 = +[HMTrigger _validateName:configuredName:error:]((uint64_t)HMTrigger, v8, v9, &v28);
  id v13 = v28;
  if (v12)
  {
    if (v9) {
      id v14 = v9;
    }
    else {
      id v14 = v8;
    }
    [(_HMTriggerBuilder *)self setName:v14 isConfigured:v9 != 0];
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    v16 = context;
    id v17 = [(_HMContext *)v16 delegateCaller];
    id v18 = v17;
    uint64_t v19 = v11;
    id v20 = 0;
  }
  else
  {
    if (self) {
      long long v21 = self->super._context;
    }
    else {
      long long v21 = 0;
    }
    v16 = v21;
    id v17 = [(_HMContext *)v16 delegateCaller];
    id v18 = v17;
    uint64_t v19 = v11;
    id v20 = v13;
  }
  [v17 callCompletion:v19 error:v20];
}

- (void)updateName:(id)a3 completionHandler:(id)a4
{
}

- (NSString)configuredName
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if (self->_nameIsConfigured) {
    name = self->_name;
  }
  else {
    name = 0;
  }
  BOOL v5 = name;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)setName:(id)a3 isConfigured:(BOOL)a4
{
  id v6 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  name = self->_name;
  self->_name = v6;

  if (v6) {
    BOOL v8 = a4;
  }
  else {
    BOOL v8 = 0;
  }
  self->_nameIsConfigured = v8;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setName:(id)a3
{
}

- (BOOL)nameIsConfigured
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_nameIsConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)name
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_1EEE9DD88;
  }
  BOOL v5 = name;
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v5;
}

- (_HMTriggerBuilder)initWithContext:(id)a3 home:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_HMTriggerBuilder;
  BOOL v4 = [(_HMAutomationBuilder *)&v8 initWithContext:a3 home:a4];
  if (v4)
  {
    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actionSets = v4->_actionSets;
    v4->_actionSets = v5;
  }
  return v4;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)_HMTriggerBuilder;
  return [(_HMTriggerBuilder *)&v6 isKindOfClass:a3];
}

- (Class)class
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  BOOL v5 = NSStringFromSelector(a2);
  objc_super v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (id)creatorDevice
{
  return 0;
}

- (id)creator
{
  return 0;
}

- (id)lastFireDate
{
  return 0;
}

@end