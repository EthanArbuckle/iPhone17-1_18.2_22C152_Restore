@interface _FETreeLockItem
- (BOOL)unlock;
- (NSArray)lockCallStackSymbols;
- (NSArray)unlockCallStackSymbols;
- (NSString)environmentDescription;
- (_FEFocusEnvironment)environment;
- (_FETreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4;
- (double)lockTime;
- (id)description;
- (unint64_t)lockCount;
- (void)_cleanup:(BOOL)a3;
- (void)dealloc;
- (void)lock;
- (void)validate;
@end

@implementation _FETreeLockItem

- (_FETreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_FETreeLockItem;
  v8 = [(_FETreeLockItem *)&v27 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x25335DA10](v7);
    id finalUnlockHandler = v8->_finalUnlockHandler;
    v8->_id finalUnlockHandler = (id)v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    v8->_unsafeEnvironment = (_FEFocusEnvironment *)v6;
    id v11 = v6;
    if (v11)
    {
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
    }
    else
    {
      v15 = @"(nil)";
    }

    environmentDescription = v8->_environmentDescription;
    v8->_environmentDescription = &v15->isa;

    v8->_lockCount = 0;
    v8->_lockTime = CFAbsoluteTimeGetCurrent();
    if (os_variant_has_internal_diagnostics() && _FEGetFocusTreeLockVerboseLogging())
    {
      uint64_t v21 = objc_opt_new();
      lockCallStackSymbols = v8->_lockCallStackSymbols;
      v8->_lockCallStackSymbols = (NSMutableArray *)v21;

      uint64_t v23 = objc_opt_new();
      unlockCallStackSymbols = v8->_unlockCallStackSymbols;
      v8->_unlockCallStackSymbols = (NSMutableArray *)v23;
    }
    v17 = [_FEWeakHelper alloc];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58___FETreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke;
    v25[3] = &unk_265328488;
    v18 = v8;
    v26 = v18;
    v19 = [(_FEWeakHelper *)v17 initWithDeallocationBlock:v25];
    objc_setAssociatedObject(v11, v18, v19, (void *)1);
    [(_FETreeLockItem *)v18 lock];
  }
  return v8;
}

- (void)dealloc
{
  [(_FETreeLockItem *)self _cleanup:1];
  v3.receiver = self;
  v3.super_class = (Class)_FETreeLockItem;
  [(_FETreeLockItem *)&v3 dealloc];
}

- (void)lock
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  ++self->_lockCount;
  lockCallStackSymbols = self->_lockCallStackSymbols;
  if (lockCallStackSymbols)
  {
    v4 = [MEMORY[0x263F08B88] callStackSymbols];
    [(NSMutableArray *)lockCallStackSymbols addObject:v4];
  }
  v5 = logger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    environmentDescription = self->_environmentDescription;
    unint64_t lockCount = self->_lockCount;
    int v8 = 138412546;
    uint64_t v9 = environmentDescription;
    __int16 v10 = 2048;
    unint64_t v11 = lockCount;
    _os_log_debug_impl(&dword_24F3F0000, v5, OS_LOG_TYPE_DEBUG, "Locking environment %@ — %lu locks total for this environment.", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)unlock
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t lockCount = self->_lockCount;
  if (!lockCount)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FETreeLock.m", 289, @"Overreleasing a lock. This is a UIKit bug. Additional info:\n%@", self object file lineNumber description];

    unint64_t lockCount = self->_lockCount;
  }
  unint64_t v4 = lockCount - 1;
  self->_unint64_t lockCount = lockCount - 1;
  unlockCallStackSymbols = self->_unlockCallStackSymbols;
  if (unlockCallStackSymbols)
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    [(NSMutableArray *)unlockCallStackSymbols addObject:v6];

    unint64_t v4 = self->_lockCount;
  }
  id v7 = logger();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
    {
      environmentDescription = self->_environmentDescription;
      unint64_t v11 = self->_lockCount;
      *(_DWORD *)buf = 138412546;
      v17 = environmentDescription;
      __int16 v18 = 2048;
      CFAbsoluteTime v19 = *(double *)&v11;
      _os_log_debug_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_DEBUG, "Unlocking environment %@ — %lu locks remaining for this environment.", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v12 = self->_environmentDescription;
      CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      __int16 v18 = 2048;
      CFAbsoluteTime v19 = v13;
      _os_log_debug_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_DEBUG, "Unlocking environment %@ after %.2fs — 0 locks remaining for this environment.", buf, 0x16u);
    }

    [(_FETreeLockItem *)self _cleanup:0];
  }
  return self->_lockCount == 0;
}

- (void)_cleanup:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_didCleanup || a3)
  {
    if (!self->_didCleanup && a3)
    {
      BOOL v8 = logger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        environmentDescription = self->_environmentDescription;
        unint64_t v11 = [MEMORY[0x263F08B88] callStackSymbols];
        int v12 = 138412802;
        CFAbsoluteTime v13 = environmentDescription;
        __int16 v14 = 2112;
        v15 = v11;
        __int16 v16 = 2112;
        v17 = self;
        _os_log_debug_impl(&dword_24F3F0000, v8, OS_LOG_TYPE_DEBUG, "Cleaning up environment lock for %@ from dealloc. Cleanup from dealloc might indicate an unbalanced lock call. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v12, 0x20u);
      }
    }
    self->_didCleanup = 1;
    (*((void (**)(void))self->_finalUnlockHandler + 2))();
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    unint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = objc_getAssociatedObject(WeakRetained, self);
      [v6 invalidate];
      objc_setAssociatedObject(v4, self, 0, (void *)1);
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v4 = logger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = self->_environmentDescription;
      id v6 = [MEMORY[0x263F08B88] callStackSymbols];
      int v12 = 138412802;
      CFAbsoluteTime v13 = v5;
      __int16 v14 = 2112;
      v15 = v6;
      __int16 v16 = 2112;
      v17 = self;
      _os_log_debug_impl(&dword_24F3F0000, v4, OS_LOG_TYPE_DEBUG, "Ignoring call to cleanup environment lock for %@. Cleanup has already happened. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v12, 0x20u);
LABEL_14:
    }
  }
}

- (void)validate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (!WeakRetained)
  {
    id v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      unint64_t v11 = self;
      _os_log_fault_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_16;
  }
  double v4 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
  if (!self->_didSoftAssert && v4 >= 20.0)
  {
    if ((_FEProcessIsBeingDebugged() & 1) == 0)
    {
      id v6 = logger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        environmentDescription = self->_environmentDescription;
        int v10 = 138412802;
        unint64_t v11 = (_FETreeLockItem *)environmentDescription;
        __int16 v12 = 2048;
        double v13 = v4;
        __int16 v14 = 2112;
        v15 = self;
        _os_log_fault_impl(&dword_24F3F0000, v6, OS_LOG_TYPE_FAULT, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v10, 0x20u);
      }
    }
    self->_didSoftAssert = 1;
  }
  if (v4 > 5.0)
  {
    id v7 = logger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = self->_environmentDescription;
      int v10 = 138412546;
      unint64_t v11 = (_FETreeLockItem *)v8;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_debug_impl(&dword_24F3F0000, v7, OS_LOG_TYPE_DEBUG, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck or take very long to be unlocked.", (uint8_t *)&v10, 0x16u);
    }
LABEL_16:
  }
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = objc_loadWeakRetained((id *)&self->_environment);
  if (v4)
  {
    v5 = NSString;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    BOOL v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];

    [v3 appendString:v8 withName:@"environment"];
  }
  else
  {
    [v3 appendString:@"(nil)" withName:@"environment"];

    id v9 = (id)[v3 appendObject:self->_environmentDescription withName:@"environmentDescription"];
  }
  id v10 = (id)[v3 appendUnsignedInteger:self->_lockCount withName:@"lockCount"];
  id v11 = (id)[v3 appendDouble:@"duration" withName:2 decimalPrecision:CFAbsoluteTimeGetCurrent() - self->_lockTime];
  [v3 appendArraySection:self->_lockCallStackSymbols withName:@"LOCK call stacks" skipIfEmpty:1];
  [v3 appendArraySection:self->_unlockCallStackSymbols withName:@"UNLOCK call stacks" skipIfEmpty:1];
  __int16 v12 = [v3 build];

  return v12;
}

- (_FEFocusEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (NSString)environmentDescription
{
  return self->_environmentDescription;
}

- (unint64_t)lockCount
{
  return self->_lockCount;
}

- (double)lockTime
{
  return self->_lockTime;
}

- (NSArray)lockCallStackSymbols
{
  return &self->_lockCallStackSymbols->super;
}

- (NSArray)unlockCallStackSymbols
{
  return &self->_unlockCallStackSymbols->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong(&self->_finalUnlockHandler, 0);
  objc_storeStrong((id *)&self->_unlockCallStackSymbols, 0);
  objc_storeStrong((id *)&self->_lockCallStackSymbols, 0);
}

@end