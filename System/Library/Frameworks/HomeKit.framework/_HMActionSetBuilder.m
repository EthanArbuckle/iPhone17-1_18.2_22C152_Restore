@interface _HMActionSetBuilder
+ (void)initialize;
- (BOOL)_removeAction:(uint64_t)a1;
- (BOOL)isEmpty;
- (BOOL)isExecuting;
- (Class)class;
- (HMApplicationData)applicationData;
- (NSSet)actions;
- (NSString)actionSetType;
- (NSString)name;
- (_HMActionSetBuilder)initWithActionSet:(id)a3;
- (_HMActionSetBuilder)initWithType:(id)a3 context:(id)a4 home:(id)a5;
- (id)copyAsBuilder;
- (id)lastExecutionDate;
- (uint64_t)_addAction:(id *)a1;
- (void)addAction:(id)a3;
- (void)addAction:(id)a3 completionHandler:(id)a4;
- (void)removeAction:(id)a3;
- (void)removeAction:(id)a3 completionHandler:(id)a4;
- (void)setActions:(id)a3;
- (void)setName:(id)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateName:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMActionSetBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  if (self->_applicationData != a3)
  {
    v6 = [a3 dictionary];
    [(HMApplicationData *)self->_applicationData setDictionary:v6];
  }
  v7 = self->super._context;
  v8 = [(_HMContext *)v7 delegateCaller];
  [v8 callCompletion:v9 error:0];
}

- (HMApplicationData)applicationData
{
  return self->_applicationData;
}

- (void)setActions:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder setActions:]", @"actions"];
    v23 = (void *)MEMORY[0x19F3A64A0]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v26;
      __int16 v42 = 2112;
      uint64_t v43 = v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  v5 = v4;
  os_unfair_lock_t lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v6 = (void *)[(NSMutableArray *)self->_actions mutableCopy];
  [(NSMutableArray *)self->_actions removeAllObjects];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {
          _HMFPreconditionFailure();
          __break(1u);
        }
        v12 = (void *)[v10 copy];
        uint64_t v13 = [v6 indexOfObject:v12];
        actions = self->_actions;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (([(NSMutableArray *)self->_actions containsObject:v12] & 1) == 0)
          {
            v15 = self->super._context;
            v16 = self;
            objc_msgSend(v12, "__configureWithContext:actionSet:", v15, v16);

            [(NSMutableArray *)self->_actions addObject:v12];
          }
        }
        else
        {
          v17 = [v6 objectAtIndex:v13];
          [(NSMutableArray *)actions addObject:v17];

          [v6 removeObjectAtIndex:v13];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * j) _unconfigure];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }

  os_unfair_lock_unlock(lock);
}

- (void)removeAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder removeAction:completionHandler:]", @"completion"];
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      __int16 v26 = 2112;
      uint64_t v27 = v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v7 = v6;
  if (v23)
  {
    BOOL v8 = -[_HMActionSetBuilder _removeAction:]((uint64_t)self, v23);
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    v10 = context;
    uint64_t v11 = [(_HMContext *)v10 delegateCaller];
    v12 = v11;
    if (v8)
    {
      [v11 callCompletion:v7 error:0];
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 2;
  }
  else
  {
    if (self) {
      uint64_t v13 = self->super._context;
    }
    else {
      uint64_t v13 = 0;
    }
    v10 = v13;
    v12 = [(_HMContext *)v10 delegateCaller];
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 20;
  }
  v16 = [v14 hmErrorWithCode:v15];
  [v12 callCompletion:v7 error:v16];

LABEL_12:
}

- (BOOL)_removeAction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = [*(id *)(a1 + 56) indexOfObject:v3];
    BOOL v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [*(id *)(a1 + 56) objectAtIndex:v4];
      [v6 _unconfigure];

      [*(id *)(a1 + 56) removeObjectAtIndex:v4];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)removeAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder removeAction:]", @"action"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v7 = self;
    BOOL v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  -[_HMActionSetBuilder _removeAction:]((uint64_t)self, v4);
}

- (void)addAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder addAction:completionHandler:]", @"completion"];
    v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = self;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v31 = v27;
      __int16 v32 = 2112;
      uint64_t v33 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  BOOL v8 = v7;
  if (!v6)
  {
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    id v10 = context;
    uint64_t v13 = [(_HMContext *)v10 delegateCaller];
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    __int16 v14 = v13;
    uint64_t v16 = v8;
    uint64_t v17 = v15;
    goto LABEL_15;
  }
  id v29 = 0;
  char v9 = [v6 isValidWithError:&v29];
  id v10 = (_HMContext *)v29;
  if ((v9 & 1) == 0)
  {
    if (self) {
      uint64_t v19 = self->super._context;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v13 = v19;
    __int16 v14 = [(_HMContext *)v13 delegateCaller];
    uint64_t v15 = v14;
    if (v10)
    {
      uint64_t v16 = v8;
      uint64_t v17 = v10;
      goto LABEL_15;
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 3;
LABEL_18:
    id v22 = [v20 hmErrorWithCode:v21];
    [(_HMContext *)v15 callCompletion:v8 error:v22];

    goto LABEL_19;
  }
  char v11 = -[_HMActionSetBuilder _addAction:]((id *)&self->super.super.isa, v6);
  if (self) {
    v12 = self->super._context;
  }
  else {
    v12 = 0;
  }
  uint64_t v13 = v12;
  __int16 v14 = [(_HMContext *)v13 delegateCaller];
  uint64_t v15 = v14;
  if ((v11 & 1) == 0)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 1;
    goto LABEL_18;
  }
  uint64_t v16 = v8;
  uint64_t v17 = 0;
LABEL_15:
  [(_HMContext *)v14 callCompletion:v16 error:v17];
LABEL_19:
}

- (uint64_t)_addAction:(id *)a1
{
  id v3 = a2;
  if (!a1)
  {
LABEL_6:

    return (uint64_t)a1;
  }
  id v4 = (os_unfair_lock_s *)(a1 + 1);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    id v6 = (void *)[v3 copy];
    int v7 = [a1[7] containsObject:v6];
    if ((v7 & 1) == 0)
    {
      id v8 = a1[4];
      char v9 = a1;
      objc_msgSend(v6, "__configureWithContext:actionSet:", v8, v9);

      [v9[7] addObject:v6];
    }
    a1 = (id *)(v7 ^ 1u);

    os_unfair_lock_unlock(v4);
    goto LABEL_6;
  }
  uint64_t result = _HMFPreconditionFailure();
  __break(1u);
  return result;
}

- (void)addAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder addAction:]", @"action"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  -[_HMActionSetBuilder _addAction:]((id *)&self->super.super.isa, v4);
}

- (NSSet)actions
{
  p_os_unfair_lock_t lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_actions];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (void)updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMActionSetBuilder updateName:completionHandler:]", @"completion"];
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      __int16 v26 = 2112;
      uint64_t v27 = v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v8 = v7;
  if (!v23)
  {
    if (self) {
      context = self->super._context;
    }
    else {
      context = 0;
    }
    id v11 = context;
    v12 = [(_HMContext *)v11 delegateCaller];
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 20;
    goto LABEL_12;
  }
  unint64_t v9 = [v23 length];
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  if (v9 > HMMaxLengthForNaming__hmf_once_v8)
  {
    if (self) {
      id v10 = self->super._context;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    v12 = [(_HMContext *)v11 delegateCaller];
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 46;
LABEL_12:
    uint64_t v16 = [v13 hmErrorWithCode:v14];
    [v12 callCompletion:v8 error:v16];

    goto LABEL_14;
  }
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_name, a3);
  os_unfair_lock_unlock(&self->super._lock);
  id v11 = self->super._context;
  v12 = [(_HMContext *)v11 delegateCaller];
  [v12 callCompletion:v8 error:0];
LABEL_14:
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)name
{
  p_os_unfair_lock_t lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_1EEE9DD88;
  }
  uint64_t v5 = name;
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v5;
}

- (id)copyAsBuilder
{
  id v3 = [HMActionSetBuilder alloc];
  id v4 = self;
  uint64_t v5 = [(HMActionSetBuilder *)v3 initWithActionSet:v4];

  return v5;
}

- (BOOL)isEmpty
{
  p_os_unfair_lock_t lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_actions count]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(HMApplicationData *)self->_applicationData isEmpty];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)actionSetType
{
  return self->_type;
}

- (_HMActionSetBuilder)initWithActionSet:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 home];
  id v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  id v7 = [v5 context];
  if (!v7) {
    goto LABEL_15;
  }
  int v8 = [v6 areAutomationBuildersSupported];

  if (!v8)
  {
LABEL_14:
    id v7 = 0;
    goto LABEL_15;
  }
  unint64_t v9 = [v6 context];
  v32.receiver = self;
  v32.super_class = (Class)_HMActionSetBuilder;
  id v10 = [(_HMAutomationBuilder *)&v32 initWithContext:v9 home:v6];

  if (v10)
  {
    uint64_t v11 = [v4 actionSetType];
    type = v10->_type;
    v10->_type = (NSString *)v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v10->_actions;
    v10->_actions = v13;

    uint64_t v15 = [v4 name];
    name = v10->_name;
    v10->_name = (NSString *)v15;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v17 = objc_msgSend(v4, "actions", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v21) copy];
          id v23 = [v6 context];
          objc_msgSend(v22, "__configureWithContext:actionSet:", v23, v4);

          [(NSMutableArray *)v10->_actions addObject:v22];
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v19);
    }

    v24 = [v4 applicationData];
    uint64_t v25 = [v24 copy];
    applicationData = v10->_applicationData;
    v10->_applicationData = (HMApplicationData *)v25;
  }
  self = v10;
  id v7 = self;
LABEL_15:

  return v7;
}

- (_HMActionSetBuilder)initWithType:(id)a3 context:(id)a4 home:(id)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HMActionSetBuilder;
  id v10 = [(_HMAutomationBuilder *)&v17 initWithContext:a4 home:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_type, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v11->_actions;
    v11->_actions = v12;

    uint64_t v14 = objc_alloc_init(HMApplicationData);
    applicationData = v11->_applicationData;
    v11->_applicationData = v14;
  }
  return v11;
}

- (Class)class
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (id)lastExecutionDate
{
  return (id)[MEMORY[0x1E4F1C9C8] distantPast];
}

- (BOOL)isExecuting
{
  return 0;
}

@end