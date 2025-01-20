@interface _FETreeLock
- (BOOL)isEnvironmentLocked:(id)a3;
- (BOOL)unlockEnvironmentTree:(id)a3;
- (NSMapTable)lockedEnvironments;
- (NSTimer)validationTimer;
- (_FETreeLock)init;
- (id)description;
- (void)_validateLockedEnvironments;
- (void)lockEnvironmentTree:(id)a3;
@end

@implementation _FETreeLock

- (_FETreeLock)init
{
  v15.receiver = self;
  v15.super_class = (Class)_FETreeLock;
  v2 = [(_FETreeLock *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:10];
    lockedEnvironments = v2->_lockedEnvironments;
    v2->_lockedEnvironments = (NSMapTable *)v3;

    if (os_variant_has_internal_diagnostics())
    {
      objc_initWeak(&location, v2);
      v6 = (void *)MEMORY[0x263EFFA20];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      v11 = __19___FETreeLock_init__block_invoke;
      v12 = &unk_265328038;
      objc_copyWeak(&v13, &location);
      uint64_t v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:&v9 block:5.0];
      validationTimer = v2->_validationTimer;
      v2->_validationTimer = (NSTimer *)v7;

      -[NSTimer setTolerance:](v2->_validationTimer, "setTolerance:", 1.0, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)lockEnvironmentTree:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_FETreeLock.m", 140, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = [(NSMapTable *)self->_lockedEnvironments objectForKey:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    [(_FETreeLockItem *)v6 lock];
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [_FETreeLockItem alloc];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35___FETreeLock_lockEnvironmentTree___block_invoke;
    v10[3] = &unk_2653287E0;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [(_FETreeLockItem *)v8 initWithEnvironment:v5 finalUnlockHandler:v10];
    [(NSMapTable *)self->_lockedEnvironments setObject:v7 forKey:v5];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)unlockEnvironmentTree:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_FETreeLock.m", 159, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = [(NSMapTable *)self->_lockedEnvironments objectForKey:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 unlock];
  }
  else
  {
    uint64_t v9 = logger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v11 = v5;
      if (v5)
      {
        id v13 = NSString;
        v14 = (objc_class *)objc_opt_class();
        objc_super v15 = NSStringFromClass(v14);
        v12 = [v13 stringWithFormat:@"<%@: %p>", v15, v11];
      }
      else
      {
        v12 = @"(nil)";
      }

      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_fault_impl(&dword_24F3F0000, v9, OS_LOG_TYPE_FAULT, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);
    }
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isEnvironmentLocked:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSMapTable *)self->_lockedEnvironments objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "environment", v15);
        if (!v11)
        {
          v12 = logger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_fault_impl(&dword_24F3F0000, v12, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
          }
        }
        BOOL HaveCommonHierarchy = _FEFocusEnvironmentsHaveCommonHierarchy(v4, v11);

        if (HaveCommonHierarchy)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

- (void)_validateLockedEnvironments
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_diagnostics())
  {
    CFAbsoluteTimeGetCurrent();
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [(NSMapTable *)self->_lockedEnvironments objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) validate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_lockedEnvironments withName:@"lockedEnvironments"];
  uint64_t v5 = [v3 build];

  return v5;
}

- (NSMapTable)lockedEnvironments
{
  return self->_lockedEnvironments;
}

- (NSTimer)validationTimer
{
  return self->_validationTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_lockedEnvironments, 0);
}

@end