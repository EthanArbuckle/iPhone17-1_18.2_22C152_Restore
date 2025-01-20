@interface HDSQLiteStatementCache
- (HDSQLiteStatementCache)init;
- (HDSQLiteStatementCache)initWithDatabase:(sqlite3 *)a3;
- (NSSet)allStatmentSQLStrings;
- (char)_statementStorage;
- (const)_cachedStatementForKey:(BOOL *)a3 active:;
- (const)_cachedStatementForSQL:(BOOL *)a3 active:;
- (int64_t)count;
- (int64_t)faultCount;
- (sqlite3_stmt)_prepareStatementForSQL:(void *)a3 error:;
- (sqlite3_stmt)checkOutCachedStatementForKey:(const char *)a3 SQLGenerator:(id)a4 error:(id *)a5;
- (sqlite3_stmt)checkOutStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5;
- (void)_activateStatement:(char)a3 cached:;
- (void)_assertNoActiveStatements;
- (void)_setCachedStatement:(const void *)a3 forKey:;
- (void)_setCachedStatement:(void *)a3 forSQL:;
- (void)beginTransaction;
- (void)checkInStatement:(sqlite3_stmt *)a3;
- (void)clearCachedStatements;
- (void)dealloc;
- (void)endTransaction;
@end

@implementation HDSQLiteStatementCache

- (void)checkInStatement:(sqlite3_stmt *)a3
{
  if (!CFSetContainsValue(self->_activeStatements, a3))
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDSQLiteStatementCache.m", 221, @"Invalid parameter not satisfying: %@", @"CFSetContainsValue(_activeStatements, stmt)" object file lineNumber description];
  }
  CFSetRemoveValue(self->_activeStatements, a3);
  if (CFSetContainsValue(self->_uncachedActiveStatements, a3))
  {
    CFSetRemoveValue(self->_uncachedActiveStatements, a3);
    sqlite3_finalize(a3);
  }
  else
  {
    sqlite3_clear_bindings(a3);
    sqlite3_reset(a3);
  }
}

- (sqlite3_stmt)checkOutStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v13 = 0;
  v9 = (sqlite3_stmt *)-[HDSQLiteStatementCache _cachedStatementForSQL:active:]((uint64_t)self, v8, &v13);
  if (v13) {
    BOOL v6 = 0;
  }
  if (!v9 || (v10 = v9, v13))
  {
    v10 = -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)self, v8, a5);
    if (v10) {
      BOOL v11 = v6;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      -[HDSQLiteStatementCache _setCachedStatement:forSQL:]((char *)self, v10, v8);
    }
  }
  -[HDSQLiteStatementCache _activateStatement:cached:]((uint64_t)self, v10, v6);

  return v10;
}

- (void)_activateStatement:(char)a3 cached:
{
  if (a1)
  {
    if (value)
    {
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), value);
      if ((a3 & 1) == 0)
      {
        BOOL v6 = *(__CFSet **)(a1 + 40);
        CFSetAddValue(v6, value);
      }
    }
  }
}

- (const)_cachedStatementForSQL:(BOOL *)a3 active:
{
  id v5 = a2;
  if (a1)
  {
    BOOL v6 = -[HDSQLiteStatementCache _statementStorage]((char *)a1);
    v7 = -[_HDSQLiteStatementCacheStorage statementForSQL:]((uint64_t)v6, v5);

    if (a3) {
      *a3 = CFSetContainsValue(*(CFSetRef *)(a1 + 32), v7) != 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (char)_statementStorage
{
  if (a1)
  {
    v2 = a1;
    if (a1[48])
    {
      v4 = (void **)(a1 + 24);
      v3 = (void *)*((void *)a1 + 3);
      if (v3)
      {
LABEL_7:
        a1 = v3;
        uint64_t v1 = vars8;
        goto LABEL_8;
      }
      id v5 = -[_HDSQLiteStatementCacheStorage initWithParentStorage:]([_HDSQLiteStatementCacheStorage alloc], *((void **)a1 + 2));
      BOOL v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v5;
    }
    else
    {
      v4 = (void **)(a1 + 16);
    }
    v3 = *v4;
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (void)beginTransaction
{
  if (self->_inTransaction)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HDSQLiteStatementCache.m", 100, @"Invalid parameter not satisfying: %@", @"_inTransaction == NO" object file lineNumber description];
  }
  self->_inTransaction = 1;
}

- (void)endTransaction
{
  if (!self->_inTransaction)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDSQLiteStatementCache.m", 105, @"Invalid parameter not satisfying: %@", @"_inTransaction" object file lineNumber description];
  }
  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  self->_inTransaction = 0;
  transactionStatementStorage = self->_transactionStatementStorage;
  self->_transactionStatementStorage = 0;
}

- (void)_assertNoActiveStatements
{
  if (a1)
  {
    CFSetApplyFunction(*(CFSetRef *)(a1 + 32), (CFSetApplierFunction)logActiveStatement, 0);
    if (CFSetGetCount(*(CFSetRef *)(a1 + 32)))
    {
      v2 = [MEMORY[0x263F08690] currentHandler];
      [v2 handleFailureInMethod:sel__assertNoActiveStatements, a1, @"HDSQLiteStatementCache.m", 286, @"Invalid parameter not satisfying: %@", @"CFSetGetCount(_activeStatements) == 0" object file lineNumber description];
    }
    if (CFSetGetCount(*(CFSetRef *)(a1 + 40)))
    {
      id v3 = [MEMORY[0x263F08690] currentHandler];
      [v3 handleFailureInMethod:sel__assertNoActiveStatements, a1, @"HDSQLiteStatementCache.m", 287, @"Invalid parameter not satisfying: %@", @"CFSetGetCount(_uncachedActiveStatements) == 0" object file lineNumber description];
    }
  }
}

- (sqlite3_stmt)_prepareStatementForSQL:(void *)a3 error:
{
  v39[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    ppStmt = 0;
    BOOL v6 = (void *)MEMORY[0x21D49F400]();
    unint64_t v7 = [v5 length];
    if (v7 >= 0x7FFFFFFF)
    {
      v30 = [MEMORY[0x263F08690] currentHandler];
      v31 = [NSString stringWithUTF8String:"-[HDSQLiteStatementCache _prepareStatementForSQL:error:]"];
      v32 = NSStringFromSelector(sel__prepareStatementForSQL_error_);
      [v30 handleFailureInFunction:v31, @"HDSQLiteStatementCache.m", 170, @"NSString passed to %@ (%lu bytes) is larger than maximum allowed SQLite statement string (%lu bytes)", v32, v7, 0x7FFFFFFFLL file lineNumber description];
    }
    while (1)
    {
      pzTail = 0;
      id v8 = *(sqlite3 **)(a1 + 8);
      id v9 = v5;
      int v10 = sqlite3_prepare_v2(v8, (const char *)[v9 UTF8String], v7, &ppStmt, (const char **)&pzTail);
      if (!v10) {
        break;
      }
      int v11 = v10;
      if ((v10 - 5) >= 2)
      {
        ++*(void *)(a1 + 56);
        v12 = sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
        BOOL v13 = [NSString stringWithFormat:@"%@: [%d, %s]", v9, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 8)), v12];
        v14 = HDSQLiteErrorFromDatabase(*(sqlite3 **)(a1 + 8), 0, v13);
        uint64_t v15 = HDSQLiteDatabaseErrorFromSQLiteError(v14);

        if (v11 == 1)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x263F098E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_FAULT)) {
            -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)v13, v17);
          }
        }
        else if (v11 == 9)
        {
          uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "hk_transactionInterruptedError");

          uint64_t v15 = v16;
        }
        else
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x263F098E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
            -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)v13, v18);
          }
        }
        ppStmt = 0;

        goto LABEL_18;
      }
    }
    if (pzTail && *pzTail)
    {
      v33 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__prepareStatementForSQL_error_, a1, @"HDSQLiteStatementCache.m", 180, @"SQL strings must contain only a single statement; remaining statements will not be executed: %s",
        pzTail);
    }
    uint64_t v15 = 0;
    ++*(void *)(a1 + 56);
LABEL_18:
    v19 = ppStmt;
    if (!((unint64_t)ppStmt | v15))
    {
      v20 = objc_msgSend(v9, "hk_trimWhitespaceAndNewlines");
      uint64_t v21 = [v20 length];

      if (v21)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x263F098E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_FAULT)) {
          -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)v9, v22);
        }
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F08320];
        v37 = @"Unknown error during sqlite3_prepare_v2";
        v24 = NSDictionary;
        v25 = &v37;
        v26 = &v36;
      }
      else
      {
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = *MEMORY[0x263F08320];
        v39[0] = @"SQL string is empty";
        v24 = NSDictionary;
        v25 = (__CFString **)v39;
        v26 = &v38;
      }
      v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
      uint64_t v15 = [v23 errorWithDomain:@"com.apple.healthd.SQLite" code:5 userInfo:v27];

      v19 = ppStmt;
    }
    if (!v19)
    {
      id v28 = (id)v15;
      if (v28)
      {
        if (a3) {
          *a3 = v28;
        }
        else {
          _HKLogDroppedError();
        }
      }

      v19 = ppStmt;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_setCachedStatement:(void *)a3 forSQL:
{
  id key = a3;
  if (a1)
  {
    uint64_t v5 = -[HDSQLiteStatementCache _statementStorage](a1);
    BOOL v6 = (void *)v5;
    if (v5) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 16), key, a2);
    }
  }
}

- (sqlite3_stmt)checkOutCachedStatementForKey:(const char *)a3 SQLGenerator:(id)a4 error:(id *)a5
{
  id v8 = (void (**)(void))a4;
  BOOL v14 = 0;
  id v9 = (sqlite3_stmt *)-[HDSQLiteStatementCache _cachedStatementForKey:active:]((uint64_t)self, a3, &v14);
  if (!v9 || (BOOL v10 = v14))
  {
    v12 = v8[2](v8);
    int v11 = -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)self, v12, a5);

    BOOL v10 = v14;
    if (v11)
    {
      if (v14)
      {
        BOOL v10 = 1;
      }
      else
      {
        -[HDSQLiteStatementCache _setCachedStatement:forKey:]((char *)self, v11, a3);
        BOOL v10 = v14;
      }
    }
  }
  else
  {
    int v11 = v9;
  }
  -[HDSQLiteStatementCache _activateStatement:cached:]((uint64_t)self, v11, !v10);

  return v11;
}

- (const)_cachedStatementForKey:(BOOL *)a3 active:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = -[HDSQLiteStatementCache _statementStorage]((char *)a1);
  unint64_t v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = v6;
    while (1)
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v8 + 24), a2);
      if (Value) {
        break;
      }
      uint64_t v8 = *(void *)(v8 + 8);
      if (!v8) {
        goto LABEL_6;
      }
    }
    BOOL v10 = Value;
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  if (a3) {
    *a3 = CFSetContainsValue(*(CFSetRef *)(a1 + 32), v10) != 0;
  }
  return v10;
}

- (void)_setCachedStatement:(const void *)a3 forKey:
{
  if (a1)
  {
    -[HDSQLiteStatementCache _statementStorage](a1);
    uint64_t v5 = (CFMutableDictionaryRef *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      uint64_t v6 = v5;
      CFDictionarySetValue(v5[3], a3, a2);
      uint64_t v5 = v6;
    }
  }
}

- (HDSQLiteStatementCache)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSQLiteStatementCache)initWithDatabase:(sqlite3 *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteStatementCache;
  uint64_t v4 = [(HDSQLiteStatementCache *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_db = a3;
    uint64_t v6 = objc_alloc_init(_HDSQLiteStatementCacheStorage);
    defaultStatementStorage = v5->_defaultStatementStorage;
    v5->_defaultStatementStorage = v6;

    v5->_activeStatements = CFSetCreateMutable(0, 0, 0);
    v5->_uncachedActiveStatements = CFSetCreateMutable(0, 0, 0);
  }
  return v5;
}

- (void)dealloc
{
  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  [(HDSQLiteStatementCache *)self clearCachedStatements];
  uncachedActiveStatements = self->_uncachedActiveStatements;
  if (uncachedActiveStatements)
  {
    CFRelease(uncachedActiveStatements);
    self->_uncachedActiveStatements = 0;
  }
  activeStatements = self->_activeStatements;
  if (activeStatements)
  {
    CFRelease(activeStatements);
    self->_activeStatements = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteStatementCache;
  [(HDSQLiteStatementCache *)&v5 dealloc];
}

- (int64_t)count
{
  defaultStatementStorage = self->_defaultStatementStorage;
  if (defaultStatementStorage)
  {
    uint64_t v4 = [(__CFDictionary *)defaultStatementStorage->_statementsBySQL count];
    uint64_t v5 = [(__CFDictionary *)defaultStatementStorage->_statementsByKey count] + v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  transactionStatementStorage = self->_transactionStatementStorage;
  if (transactionStatementStorage)
  {
    uint64_t v7 = [(__CFDictionary *)transactionStatementStorage->_statementsBySQL count];
    uint64_t v8 = [(__CFDictionary *)transactionStatementStorage->_statementsByKey count] + v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8 + v5;
}

- (NSSet)allStatmentSQLStrings
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v4 = -[_HDSQLiteStatementCacheStorage allStatementSQLStrings](&self->_defaultStatementStorage->super.isa);
  [v3 addObjectsFromArray:v4];

  transactionStatementStorage = self->_transactionStatementStorage;
  if (transactionStatementStorage)
  {
    uint64_t v6 = -[_HDSQLiteStatementCacheStorage allStatementSQLStrings](&transactionStatementStorage->super.isa);
    [v3 addObjectsFromArray:v6];
  }
  uint64_t v7 = (void *)[v3 copy];

  return (NSSet *)v7;
}

- (void)clearCachedStatements
{
  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  transactionStatementStorage = self->_transactionStatementStorage;
  self->_transactionStatementStorage = 0;

  defaultStatementStorage = self->_defaultStatementStorage;

  -[_HDSQLiteStatementCacheStorage clearStatements]((uint64_t)defaultStatementStorage);
}

- (int64_t)faultCount
{
  return self->_faultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStatementStorage, 0);

  objc_storeStrong((id *)&self->_defaultStatementStorage, 0);
}

- (void)_prepareStatementForSQL:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_FAULT, "Attempted to prepare SQL statement %{public}@, but could not and no error code was set", (uint8_t *)&v2, 0xCu);
}

- (void)_prepareStatementForSQL:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "Could not prepare statement: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_prepareStatementForSQL:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_FAULT, "Could not prepare statement: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end