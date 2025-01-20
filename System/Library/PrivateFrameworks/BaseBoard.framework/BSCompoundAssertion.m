@interface BSCompoundAssertion
+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3;
+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3 stateDidChangeHandler:(id)a4;
+ (BSCompoundAssertion)new;
- (BOOL)isActive;
- (BSCompoundAssertion)init;
- (NSOrderedSet)orderedContext;
- (NSOrderedSet)orderedReasons;
- (NSSet)context;
- (NSSet)reasons;
- (NSString)description;
- (OS_os_log)log;
- (_BSCompoundAssertionState)_dataLock_copyState;
- (id)_dataLock_context;
- (id)_identifier;
- (id)_initWithIdentifier:(id)a1;
- (id)acquireForReason:(id)a3;
- (id)acquireForReason:(id)a3 withContext:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setLog:(id)a3;
@end

@implementation BSCompoundAssertion

- (BOOL)isActive
{
  v2 = self;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  LOBYTE(v2) = [(NSMutableOrderedSet *)v2->_dataLock_acquisitionRecords count] != 0;
  os_unfair_lock_unlock(p_dataLock);
  return (char)v2;
}

- (NSSet)context
{
  v2 = [(BSCompoundAssertion *)self orderedContext];
  v3 = [v2 set];

  return (NSSet *)v3;
}

- (NSOrderedSet)orderedContext
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  v4 = -[BSCompoundAssertion _dataLock_context]((uint64_t)self);
  os_unfair_lock_unlock(p_dataLock);
  return (NSOrderedSet *)v4;
}

- (id)acquireForReason:(id)a3
{
  v3 = [(BSCompoundAssertion *)self acquireForReason:a3 withContext:0];
  return v3;
}

- (id)acquireForReason:(id)a3 withContext:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"BSCompoundAssertion.m", 299, @"Invalid parameter not satisfying: %@", @"reason != nil" object file lineNumber description];
  }
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(&self->_syncLock);
  if (self->_syncLock_invalid)
  {
    v9 = 0;
    goto LABEL_27;
  }
  id v10 = v7;
  id v11 = v8;
  os_unfair_lock_assert_owner(&self->_syncLock);
  os_unfair_lock_lock(&self->_dataLock);
  v33 = v10;
  v34 = v11;
  if (!self->_dataLock_acquisitionRecords)
  {
    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    dataLock_acquisitionRecords = self->_dataLock_acquisitionRecords;
    self->_dataLock_acquisitionRecords = v12;
  }
  v14 = objc_alloc_init(_BSCompoundAssertionAcquisitionRecord);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_assertion, self);
    objc_setProperty_nonatomic_copy(p_isa, v16, v10, 16);
  }
  -[_BSCompoundAssertionAcquisitionRecord setContext:]((uint64_t)p_isa, v11);
  v17 = objc_alloc_init(_BSCompoundAssertionAcquisitionReference);
  v9 = v17;
  if (v17) {
    objc_storeStrong((id *)&v17->_record, p_isa);
  }
  if (p_isa) {
    objc_storeWeak(p_isa + 3, v9);
  }
  v32 = -[BSCompoundAssertion _dataLock_context]((uint64_t)self);
  [(NSMutableOrderedSet *)self->_dataLock_acquisitionRecords addObject:p_isa];
  uint64_t v18 = [(NSMutableOrderedSet *)self->_dataLock_acquisitionRecords count];
  id syncLock_block = self->_syncLock_block;
  if (!syncLock_block) {
    goto LABEL_17;
  }
  if (v18 == 1)
  {
LABEL_19:
    v21 = (void (**)(void, void))MEMORY[0x18C125630](syncLock_block);
    -[BSCompoundAssertion _dataLock_copyState]((uint64_t)self);
    v22 = int v20 = 1;
    goto LABEL_20;
  }
  if (v11 && (objc_msgSend(v32, "containsObject:") & 1) == 0)
  {
    id syncLock_block = self->_syncLock_block;
    goto LABEL_19;
  }
LABEL_17:
  int v20 = 0;
  v21 = 0;
  v22 = 0;
LABEL_20:
  dataLock_log = self->_dataLock_log;
  if (dataLock_log)
  {
    v24 = dataLock_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v21;
      id v31 = v8;
      id v25 = (id)objc_opt_class();
      identifierPrefix = self->_identifierPrefix;
      int v27 = [(NSMutableOrderedSet *)self->_dataLock_acquisitionRecords count];
      *(_DWORD *)buf = 138544642;
      id v36 = v25;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      v40 = identifierPrefix;
      __int16 v41 = 2114;
      v42 = v33;
      __int16 v43 = 2048;
      v44 = v9;
      __int16 v45 = 1024;
      int v46 = v27;
      _os_log_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> (%{public}@) acquire for reason:%{public}@ acq:%p count:%d", buf, 0x3Au);

      v21 = v30;
      id v8 = v31;
    }
  }
  os_unfair_lock_unlock(&self->_dataLock);
  if (v20) {
    ((void (**)(void, void *))v21)[2](v21, v22);
  }

LABEL_27:
  os_unfair_lock_unlock(&self->_syncLock);

  return v9;
}

- (_BSCompoundAssertionState)_dataLock_copyState
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  v2 = objc_alloc_init(_BSCompoundAssertionState);
  uint64_t v3 = [*(id *)(a1 + 40) count];
  if (v2) {
    v2->_active = v3 != 0;
  }
  -[BSCompoundAssertion _dataLock_context](a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    uint64_t v6 = [v4 copy];
    context = v2->_context;
    v2->_context = (NSOrderedSet *)v6;
  }
  return v2;
}

- (id)_dataLock_context
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1 + 40);
    id v3 = 0;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
          if (v7)
          {
            id v8 = *(id *)(v7 + 32);
            if (v8)
            {
              if (!v3) {
                id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
              }
              objc_msgSend(v3, "addObject:", v8, (void)v11);
            }
          }
          else
          {
            id v8 = 0;
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v9 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v4 = v9;
      }
      while (v9);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3 stateDidChangeHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = -[BSCompoundAssertion _initWithIdentifier:]([BSCompoundAssertion alloc], v5);
  uint64_t v8 = [v6 copy];
  uint64_t v9 = (void *)v7[3];
  v7[3] = v8;

  return (BSCompoundAssertion *)v7;
}

- (id)_initWithIdentifier:(id)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BSCompoundAssertion;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v4 = objc_opt_class();
      if (v4 != objc_opt_class())
      {
        uint64_t v8 = [NSString stringWithFormat:@"BSCompoundAssertion is not safe to subclass"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          id v10 = (objc_class *)objc_opt_class();
          long long v11 = NSStringFromClass(v10);
          *(_DWORD *)buf = 138544642;
          id v14 = v9;
          __int16 v15 = 2114;
          uint64_t v16 = v11;
          __int16 v17 = 2048;
          id v18 = a1;
          __int16 v19 = 2114;
          int v20 = @"BSCompoundAssertion.m";
          __int16 v21 = 1024;
          int v22 = 187;
          __int16 v23 = 2114;
          v24 = v8;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v8 UTF8String];
        __break(0);
        JUMPOUT(0x18AAEBE98);
      }
      *((_DWORD *)a1 + 4) = 0;
      *((_DWORD *)a1 + 8) = 0;
      uint64_t v5 = [v3 copy];
      id v6 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v5;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock_log, 0);
  objc_storeStrong((id *)&self->_dataLock_acquisitionRecords, 0);
  objc_storeStrong(&self->_syncLock_block, 0);
  objc_storeStrong((id *)&self->_identifierPrefix, 0);
}

- (void)invalidate
{
  p_syncLock = &self->_syncLock;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(p_syncLock);
  if (!self->_syncLock_invalid)
  {
    self->_syncLock_invalid = 1;
    id syncLock_block = self->_syncLock_block;
    self->_id syncLock_block = 0;

    os_unfair_lock_lock(&self->_dataLock);
    dataLock_acquisitionRecords = self->_dataLock_acquisitionRecords;
    self->_dataLock_acquisitionRecords = 0;

    os_unfair_lock_unlock(&self->_dataLock);
  }
  os_unfair_lock_unlock(p_syncLock);
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_syncLock = &self->_syncLock;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(p_syncLock);
  if (!self->_syncLock_invalid)
  {
    uint64_t v5 = [NSString stringWithFormat:@"you must invoke -invalidate on BSCompoundAssertion (%@) before releasing", self->_identifierPrefix];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"BSCompoundAssertion.m";
      __int16 v18 = 1024;
      int v19 = 209;
      __int16 v20 = 2114;
      __int16 v21 = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEE848);
  }
  os_unfair_lock_unlock(p_syncLock);
  v9.receiver = self;
  v9.super_class = (Class)BSCompoundAssertion;
  [(BSCompoundAssertion *)&v9 dealloc];
}

- (void)setLog:(id)a3
{
  uint64_t v4 = (OS_os_log *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  dataLock_log = self->_dataLock_log;
  self->_dataLock_log = v4;

  os_unfair_lock_unlock(&self->_dataLock);
}

- (id)_identifier
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (BSCompoundAssertion)new
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"BSCompoundAssertion does not support +new"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    __int16 v16 = @"BSCompoundAssertion.m";
    __int16 v17 = 1024;
    int v18 = 175;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  result = (BSCompoundAssertion *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (BSCompoundAssertion)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"BSCompoundAssertion does not support -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BSCompoundAssertion.m";
    __int16 v17 = 1024;
    int v18 = 180;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  result = (BSCompoundAssertion *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[BSCompoundAssertion _initWithIdentifier:](objc_alloc((Class)a1), v4);

  return (BSCompoundAssertion *)v5;
}

- (NSString)description
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  identifierPrefix = self->_identifierPrefix;
  uint64_t v7 = [(NSMutableOrderedSet *)self->_dataLock_acquisitionRecords bs_map:&__block_literal_global_7];
  uint64_t v8 = [v4 stringWithFormat:@"<%@:%p %@> acquisitions:%@", v5, self, identifierPrefix, v7];

  os_unfair_lock_unlock(p_dataLock);
  return (NSString *)v8;
}

id __34__BSCompoundAssertion_description__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = *((id *)v2 + 4);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = [NSString stringWithFormat:@"%@ (context:%@)", v3[2], v4];

      goto LABEL_6;
    }
    uint64_t v7 = (void *)v3[2];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v6 = v7;
LABEL_6:

  return v6;
}

- (NSSet)reasons
{
  id v2 = [(BSCompoundAssertion *)self orderedReasons];
  id v3 = [v2 set];

  return (NSSet *)v3;
}

- (NSOrderedSet)orderedReasons
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  id v4 = [(NSMutableOrderedSet *)self->_dataLock_acquisitionRecords bs_map:&__block_literal_global_127];
  os_unfair_lock_unlock(p_dataLock);
  return (NSOrderedSet *)v4;
}

id __37__BSCompoundAssertion_orderedReasons__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 16);
  }
  else {
    return 0;
  }
}

- (OS_os_log)log
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  id v4 = self->_dataLock_log;
  os_unfair_lock_unlock(p_dataLock);
  return v4;
}

@end