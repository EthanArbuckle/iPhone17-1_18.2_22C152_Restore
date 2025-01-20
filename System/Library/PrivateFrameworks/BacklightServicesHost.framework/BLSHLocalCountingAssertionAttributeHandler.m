@interface BLSHLocalCountingAssertionAttributeHandler
+ (Class)attributeBaseClass;
+ (Class)entryClass;
+ (id)attributeClasses;
- (id)countingTargetForEntry:(id)a3;
- (id)entriesForCountingTarget:(id)a3;
- (id)initForService:(id)a3;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
- (void)decrementCountWithEntry:(uint64_t)a1;
- (void)incrementCountWithEntry:(uint64_t)a1;
@end

@implementation BLSHLocalCountingAssertionAttributeHandler

- (id)initForService:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BLSHLocalCountingAssertionAttributeHandler;
  v3 = [(BLSHLocalAssertionAttributeHandler *)&v7 initForService:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = (void *)v3[4];
    v3[4] = v4;

    *((_DWORD *)v3 + 10) = 0;
  }
  return v3;
}

+ (id)attributeClasses
{
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalCountingAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 41;
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
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalCountingAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 46;
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
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
  id v5 = a3;
  v6 = NSString;
  objc_super v7 = NSStringFromSelector(a2);
  v8 = [v6 stringWithFormat:@"%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@", self, v7];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    __int16 v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2114;
    __int16 v19 = @"BLSHLocalCountingAssertionAttributeHandler.m";
    __int16 v20 = 1024;
    int v21 = 55;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  id v5 = a3;
  v6 = NSString;
  objc_super v7 = NSStringFromSelector(a2);
  v8 = [v6 stringWithFormat:@"%@ must subclass BLSHLocalCountingAssertionAttributeHandler and override %@", self, v7];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    __int16 v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2114;
    __int16 v19 = @"BLSHLocalCountingAssertionAttributeHandler.m";
    __int16 v20 = 1024;
    int v21 = 59;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)countingTargetForEntry:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
}

- (id)entriesForCountingTarget:(id)a3
{
  p_countingDictionaryLock = &self->_countingDictionaryLock;
  id v5 = a3;
  os_unfair_lock_lock(p_countingDictionaryLock);
  v6 = [(NSMutableDictionary *)self->_lock_entryDictionary objectForKey:v5];

  objc_super v7 = [v6 allObjects];
  v8 = (void *)[v7 copy];

  os_unfair_lock_unlock(p_countingDictionaryLock);

  return v8;
}

- (void)incrementCountWithEntry:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)a1 countingTargetForEntry:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v5 = [*(id *)(a1 + 32) objectForKey:v4];
    if (!v5)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
      [*(id *)(a1 + 32) setObject:v5 forKey:v4];
    }
    uint64_t v6 = [v5 count];
    [v5 addObject:v3];
    uint64_t v7 = [v5 count];
    v8 = bls_assertions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134219266;
      uint64_t v11 = a1;
      __int16 v12 = 2114;
      uint64_t v13 = a1;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 2114;
      id v19 = v3;
      __int16 v20 = 2114;
      int v21 = v4;
      _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ increment count:%u->%u with entry:%{public}@ -> countingTarget:%{public}@", (uint8_t *)&v10, 0x36u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v6) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v7 == 1;
    }
    if (v9) {
      [(id)a1 activateWithFirstEntry:v3];
    }
  }
}

- (void)decrementCountWithEntry:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)a1 countingTargetForEntry:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v5 = [*(id *)(a1 + 32) objectForKey:v4];
    uint64_t v6 = [v5 count];
    [v5 removeObject:v3];
    uint64_t v7 = [v5 count];
    v8 = bls_assertions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134219266;
      uint64_t v11 = a1;
      __int16 v12 = 2114;
      uint64_t v13 = a1;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 2048;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v3;
      _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ decrement count:%u->%u for %p with entry:%{public}@", (uint8_t *)&v10, 0x36u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v6 == 1 && v7 == 0) {
      [(id)a1 deactivateWithFinalEntry:v3];
    }
  }
}

- (void).cxx_destruct
{
}

@end