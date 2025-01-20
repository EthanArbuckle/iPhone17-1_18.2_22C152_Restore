@interface BLSHLocalAssertionAttributeHandler
+ (Class)attributeBaseClass;
+ (Class)entryClass;
+ (id)attributeClasses;
+ (id)registerHandlerForService:(id)a3;
- (BLSHLocalAssertionService)service;
- (id)initForService:(id)a3;
- (id)withLock_entryFromEntries:(void *)a3 forAttribute:;
- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (void)setupService;
@end

@implementation BLSHLocalAssertionAttributeHandler

+ (id)registerHandlerForService:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForService:v4];

  [v5 setupService];

  return v5;
}

+ (id)attributeClasses
{
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 25;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)attributeBaseClass
{
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 30;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  Class result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)entryClass
{
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 35;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  Class result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)initForService:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHLocalAssertionAttributeHandler;
  v5 = [(BLSHLocalAssertionAttributeHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    entries = v6->_entries;
    v6->_entries = (NSMutableDictionary *)v7;

    objc_storeWeak((id *)&v6->_service, v4);
  }

  return v6;
}

- (void)setupService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v3 = [(id)objc_opt_class() attributeClasses];
  [WeakRetained registerAttributeHandler:self forAttributeClasses:v3];
}

- (id)withLock_entryFromEntries:(void *)a3 forAttribute:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 4);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "attribute", (void)v14);
          id v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v6)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  v33 = v9;
  objc_super v10 = [v9 identifier];
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    v34 = [(NSMutableDictionary *)self->_entries objectForKey:v10];
    if (!v34)
    {
      v34 = [MEMORY[0x263EFF980] array];
      -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:");
    }
    v29 = v10;
    v32 = [(id)objc_opt_class() entryClass];
    uint64_t v11 = [(id)objc_opt_class() attributeBaseClass];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(NSObject **)(*((void *)&v35 + 1) + 8 * v16);
          if (objc_opt_isKindOfClass())
          {
            v18 = -[BLSHLocalAssertionAttributeHandler withLock_entryFromEntries:forAttribute:]((const os_unfair_lock *)self, v34, v17);
            if (v18)
            {
              uint64_t v19 = v18;
              char v20 = [v18 reactivateIfPossible];
              __int16 v21 = bls_assertions_log();
              v22 = v21;
              if (v20)
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  v23 = NSStringFromBLSAssertingObject();
                  *(_DWORD *)buf = 134218754;
                  v40 = self;
                  __int16 v41 = 2114;
                  v42 = v19;
                  __int16 v43 = 2112;
                  uint64_t v44 = (uint64_t)v17;
                  __int16 v45 = 2112;
                  v46 = v23;
                  _os_log_debug_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_DEBUG, "%p did re-activate entry:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
                  goto LABEL_28;
                }
              }
              else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              {
                v23 = NSStringFromBLSAssertingObject();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                __int16 v41 = 2114;
                v42 = v19;
                __int16 v43 = 2112;
                uint64_t v44 = (uint64_t)v17;
                __int16 v45 = 2112;
                v46 = v23;
                _os_log_fault_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_FAULT, "%p (cannot re-activate) already have entry:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
LABEL_28:
              }
              goto LABEL_22;
            }
            uint64_t v19 = [v32 activateForAttribute:v17 fromAssertion:v33 forService:v31 attributeHandler:self];
            v24 = bls_assertions_log();
            v25 = v24;
            if (v19)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v27 = NSStringFromBLSAssertingObject();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                __int16 v41 = 2112;
                v42 = v19;
                __int16 v43 = 2112;
                uint64_t v44 = (uint64_t)v17;
                __int16 v45 = 2112;
                v46 = v27;
                _os_log_debug_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_DEBUG, "%p did activate entry:%{pubic}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
              }
              [v34 addObject:v19];
            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v26 = NSStringFromBLSAssertingObject();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                __int16 v41 = 2112;
                v42 = v32;
                __int16 v43 = 2114;
                uint64_t v44 = (uint64_t)v17;
                __int16 v45 = 2112;
                v46 = v26;
                _os_log_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_DEFAULT, "%p nil when activating attribute:%{pubic}@ entryClass:%{public}@ assertion:%{pubic}@", buf, 0x2Au);
              }
              uint64_t v19 = v25;
            }
          }
          else
          {
            uint64_t v19 = bls_assertions_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218498;
              v40 = self;
              __int16 v41 = 2112;
              v42 = v17;
              __int16 v43 = 2112;
              uint64_t v44 = v11;
              _os_log_fault_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_FAULT, "%p cannot activate invalid attribute:%@ not of class:%@", buf, 0x20u);
            }
          }
LABEL_22:

          ++v16;
        }
        while (v14 != v16);
        uint64_t v28 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
        uint64_t v14 = v28;
      }
      while (v28);
    }

    os_unfair_lock_unlock(&self->_lock);
    objc_super v10 = v29;
    id v8 = v30;
  }
  else
  {
    v34 = bls_assertions_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BLSHLocalAssertionAttributeHandler activateAttributes:fromAssertion:forService:]();
    }
  }
}

- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v27 = a4;
  id v8 = [v27 identifier];
  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    [(id)objc_opt_class() attributeBaseClass];
    objc_super v10 = [(NSMutableDictionary *)self->_entries objectForKey:v8];
    if (v10)
    {
      v25 = v8;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v26 = v7;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(NSObject **)(*((void *)&v28 + 1) + 8 * v15);
            if (objc_opt_isKindOfClass())
            {
              long long v17 = -[BLSHLocalAssertionAttributeHandler withLock_entryFromEntries:forAttribute:]((const os_unfair_lock *)self, v10, v16);
              v18 = bls_assertions_log();
              uint64_t v19 = v18;
              if (v17)
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v20 = NSStringFromBLSAssertingObject();
                  *(_DWORD *)buf = 134218754;
                  v33 = self;
                  __int16 v34 = 2112;
                  long long v35 = v17;
                  __int16 v36 = 2112;
                  uint64_t v37 = (uint64_t)v16;
                  __int16 v38 = 2112;
                  uint64_t v39 = v20;
                  __int16 v21 = (void *)v20;
                  _os_log_debug_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_DEBUG, "%p will deactive entry:%{pubic}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
                }
                [v17 invalidate];
                [v10 removeObject:v17];
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v22 = NSStringFromBLSAssertingObject();
                  *(_DWORD *)buf = 134218498;
                  v33 = self;
                  __int16 v34 = 2112;
                  long long v35 = v16;
                  __int16 v36 = 2112;
                  uint64_t v37 = v22;
                  v23 = (void *)v22;
                  _os_log_fault_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_FAULT, "%p (cannot deactivate) no entry for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x20u);
                }
              }
            }
            else
            {
              long long v17 = bls_assertions_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134218242;
                v33 = self;
                __int16 v34 = 2112;
                long long v35 = v16;
                _os_log_fault_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_FAULT, "%p cannot deactivate invalid attribute:%@", buf, 0x16u);
              }
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v13);
      }

      id v8 = v25;
      id v7 = v26;
      p_lock = &self->_lock;
      if (![v10 count]) {
        [(NSMutableDictionary *)self->_entries removeObjectForKey:v25];
      }
    }
    else
    {
      v24 = bls_assertions_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BLSHLocalAssertionAttributeHandler deactivateAttributes:fromAssertion:forService:]();
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    objc_super v10 = bls_assertions_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BLSHLocalAssertionAttributeHandler activateAttributes:fromAssertion:forService:]();
    }
  }
}

- (BLSHLocalAssertionService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (BLSHLocalAssertionService *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);

  objc_storeStrong((id *)&self->_entries, 0);
}

- (void)activateAttributes:fromAssertion:forService:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21FCFC000, v0, v1, "%p no identifier for assertion:%{pubic}@");
}

- (void)deactivateAttributes:fromAssertion:forService:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21FCFC000, v0, v1, "%p no entries for assertion:%{pubic}@");
}

@end