@interface HDDatabaseTransaction
- (BOOL)isWriteTransaction;
- (BOOL)performWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6;
- (BOOL)performingMigration;
- (HDDatabase)database;
- (HDDatabaseTransaction)initWithDatabase:(id)a3 provider:(id)a4 rootContext:(id)a5;
- (HDDatabaseTransactionContext)rootContext;
- (HDHFDataStore)highFrequencyDataStore;
- (HDOntologyDatabase)ontologyDatabase;
- (HDSQLiteDatabase)protectedDatabase;
- (HDSQLiteDatabase)unprotectedDatabase;
- (NSDictionary)protectedResources;
- (id)databaseForEntity:(id)a3;
- (id)databaseForEntityClass:(Class)a3;
- (id)databaseForEntityProtectionClass:(int64_t)a3;
- (int64_t)cacheScope;
- (uint64_t)_resolveCacheScope:(uint64_t)result;
- (void)dealloc;
- (void)onCommit:(id)a3 orRollback:(id)a4;
- (void)requestTransactionInterruption;
- (void)requireRollback;
- (void)setPerformingMigration:(BOOL)a3;
- (void)transactionDidEndWithError:(id)a3;
@end

@implementation HDDatabaseTransaction

- (HDOntologyDatabase)ontologyDatabase
{
  v2 = [(HDDatabaseTransaction *)self protectedResources];
  v3 = [v2 objectForKeyedSubscript:@"OntologyDatabase"];

  return (HDOntologyDatabase *)v3;
}

- (void)dealloc
{
  if (self->_isActive)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"HDDatabaseTransaction.m" lineNumber:45 description:@"HDDatabaseTransaction dealloc'd while active."];
  }
  v5.receiver = self;
  v5.super_class = (Class)HDDatabaseTransaction;
  [(HDDatabaseTransaction *)&v5 dealloc];
}

- (HDDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);

  return (HDDatabase *)WeakRetained;
}

- (int64_t)cacheScope
{
  return [(HDDatabaseTransactionContext *)self->_rootContext cacheScope];
}

- (HDDatabaseTransaction)initWithDatabase:(id)a3 provider:(id)a4 rootContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDatabaseTransaction.m", 61, @"Invalid parameter not satisfying: %@", @"rootContext != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDDatabaseTransaction;
  v12 = [(HDDatabaseTransaction *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_database, v9);
    objc_storeWeak((id *)&v13->_databaseProvider, v10);
    uint64_t v14 = [v11 copy];
    rootContext = v13->_rootContext;
    v13->_rootContext = (HDDatabaseTransactionContext *)v14;
  }
  return v13;
}

- (BOOL)isWriteTransaction
{
  return [(HDDatabaseTransactionContext *)self->_rootContext requiresWrite];
}

- (id)databaseForEntityProtectionClass:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = 56;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    uint64_t v4 = 64;
  }
  a2 = (SEL)*(id *)((char *)&self->super.isa + v4);
LABEL_6:
  return (id)(id)a2;
}

- (id)databaseForEntity:(id)a3
{
  uint64_t v4 = [(id)objc_opt_class() protectionClass];

  return [(HDDatabaseTransaction *)self databaseForEntityProtectionClass:v4];
}

- (id)databaseForEntityClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 protectionClass];

  return [(HDDatabaseTransaction *)self databaseForEntityProtectionClass:v4];
}

- (uint64_t)_resolveCacheScope:(uint64_t)result
{
  if (result)
  {
    if (a2 == 2)
    {
      return 0;
    }
    else if (a2)
    {
      return 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(result + 8));
      uint64_t v3 = [WeakRetained configuration];
      uint64_t v4 = [v3 behavior];
      objc_super v5 = [v4 features];
      unsigned int v6 = [v5 databaseStateCacheTransactionScoped];

      return v6;
    }
  }
  return result;
}

- (BOOL)performWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v73 = a5;
  v12 = (NSDictionary *)a6;
  int v13 = [v11 requiresProtectedData];
  v72 = v11;
  unsigned int v14 = [v11 requiresWrite];
  if (!self->_performingMigration)
  {
    if (self->_isOutermostTransactionUnprotected) {
      int v15 = v13;
    }
    else {
      int v15 = 0;
    }
    if (v15 == 1)
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "Cannot promote an unprotected transaction to a protected transaction", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 107, @"Cannot promote an unprotected transaction to a protected transaction");
      goto LABEL_10;
    }
    unsigned int v19 = v14;
    double Current = 0.0;
    BOOL log = self->_isActive;
    if (!self->_isActive)
    {
      self->_isActive = 1;
      self->_isOutermostTransactionUnprotected = v13 ^ 1;
      double Current = CFAbsoluteTimeGetCurrent();
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke;
    aBlock[3] = &unk_1E62F8610;
    v83 = v12;
    v12 = (NSDictionary *)_Block_copy(aBlock);
    if (!v13 || self->_protectedDatabase)
    {
      int v68 = 0;
      goto LABEL_17;
    }
    if (self->_unprotectedDatabase)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:a2, self, @"HDDatabaseTransaction.m", 162, @"Invalid parameter not satisfying: %@", @"_unprotectedDatabase == nil" object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseProvider);
    id v81 = 0;
    v40 = [WeakRetained checkOutProtectedDatabase:self error:&v81];
    id v41 = v81;
    protectedDatabase = self->_protectedDatabase;
    self->_protectedDatabase = v40;

    if (self->_protectedDatabase)
    {
      id v43 = objc_loadWeakRetained((id *)&self->_databaseProvider);
      id v80 = v41;
      v44 = [v43 checkOutProtectedResources:self error:&v80];
      id v45 = v80;

      id v41 = v45;
      protectedResources = self->_protectedResources;
      self->_protectedResources = v44;

      if (self->_protectedResources)
      {
        -[HDSQLiteDatabase setCacheScope:](self->_protectedDatabase, "setCacheScope:", -[HDDatabaseTransaction _resolveCacheScope:]((uint64_t)self, [(HDDatabaseTransactionContext *)self->_rootContext cacheScope]));
        [(HDSQLiteDatabase *)self->_protectedDatabase setTransactionInterruptRequested:0];

        int v68 = 1;
LABEL_17:
        unprotectedDatabase = self->_unprotectedDatabase;
        if (!unprotectedDatabase)
        {
          id v22 = objc_loadWeakRetained((id *)&self->_databaseProvider);
          id v79 = 0;
          v23 = [v22 checkOutUnprotectedDatabase:self error:&v79];
          id v24 = v79;
          v25 = self->_unprotectedDatabase;
          self->_unprotectedDatabase = v23;

          if (!self->_unprotectedDatabase)
          {
            char v17 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v24, a4);

            double v30 = 0.0;
            goto LABEL_55;
          }
          -[HDSQLiteDatabase setCacheScope:](self->_unprotectedDatabase, "setCacheScope:", -[HDDatabaseTransaction _resolveCacheScope:]((uint64_t)self, [(HDDatabaseTransactionContext *)self->_rootContext cacheScope]));
          [(HDSQLiteDatabase *)self->_unprotectedDatabase setTransactionInterruptRequested:0];
        }
        if (log)
        {
          BOOL v26 = 0;
        }
        else
        {
          v27 = [(HDDatabaseTransactionContext *)self->_rootContext statistics];
          BOOL v26 = v27 != 0;
        }
        if (v13) {
          uint64_t v28 = 2;
        }
        else {
          uint64_t v28 = 1;
        }
        v29 = [(HDDatabaseTransaction *)self databaseForEntityProtectionClass:v28];
        double v30 = 0.0;
        double v31 = 0.0;
        if (v26) {
          double v31 = CFAbsoluteTimeGetCurrent();
        }
        if (!log) {
          double v30 = CFAbsoluteTimeGetCurrent();
        }
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_2;
        v74[3] = &unk_1E630E160;
        uint64_t v76 = v28;
        v74[4] = self;
        uint64_t v77 = v19;
        id v78 = 0;
        id v75 = v73;
        char v17 = [v29 performTransactionWithType:v19 error:&v78 usingBlock:v74];
        id v32 = v78;
        if (v26)
        {
          id v33 = [[HDDatabaseTransactionStatistics alloc] _initWithStartTime:v31 endTime:CFAbsoluteTimeGetCurrent()];
          v34 = [(HDDatabaseTransactionContext *)self->_rootContext statistics];
          [v34 _addTransactionStatistics:v33];
        }
        if (v32) {
          char v35 = 1;
        }
        else {
          char v35 = v17;
        }
        if ((v35 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Transaction failure.");
          id v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v32)
        {
          v36 = (void *)*MEMORY[0x1E4F29F18];
          id v37 = v32;
          id v38 = v36;
          if (a4) {
            *a4 = v37;
          }
          else {
            _HKLogDroppedErrorWithReason();
          }
        }
        if (unprotectedDatabase)
        {
          if (!v68)
          {
LABEL_58:
            if (log) {
              goto LABEL_11;
            }
            id v56 = v72;
            double v57 = CFAbsoluteTimeGetCurrent() - v30;
            if (v30 - Current <= 5.0)
            {
              if (v30 <= 0.0 || v57 <= 5.0)
              {
LABEL_66:

                *(_WORD *)&self->_isActive = 0;
                goto LABEL_11;
              }
              v58 = @"work";
            }
            else
            {
              v58 = @"start";
            }
            _HKInitializeLogging();
            v59 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
            {
              loga = v59;
              v60 = HKDiagnosticStringFromDuration();
              v69 = HKDiagnosticStringFromDuration();
              v67 = HKDiagnosticStringFromDuration();
              int v66 = [v56 requiresWrite];
              int v65 = [v56 requiresProtectedData];
              int v64 = [v56 highPriority];
              uint64_t v61 = [v56 cacheScope];
              uint64_t v62 = [v56 journalType];
              label = dispatch_queue_get_label(0);
              *(_DWORD *)buf = 138545666;
              v85 = v58;
              __int16 v86 = 2114;
              v87 = v60;
              __int16 v88 = 2114;
              v89 = v69;
              __int16 v90 = 2114;
              v91 = v67;
              __int16 v92 = 1024;
              int v93 = v66;
              __int16 v94 = 1024;
              int v95 = v65;
              __int16 v96 = 1024;
              int v97 = v64;
              __int16 v98 = 2048;
              uint64_t v99 = v61;
              __int16 v100 = 2048;
              uint64_t v101 = v62;
              __int16 v102 = 2080;
              v103 = label;
              _os_log_impl(&dword_1BCB7D000, loga, OS_LOG_TYPE_DEFAULT, "Long database transaction %{public}@ duration: duration=%{public}@, wait=%{public}@, work=%{public}@, write=%{BOOL}d, protected=%{BOOL}d, priority=%{BOOL}d, cache=%ld, journal=%ld, queue=%s", buf, 0x5Au);
            }
            goto LABEL_66;
          }
          goto LABEL_56;
        }
        id v52 = objc_loadWeakRetained((id *)&self->_databaseProvider);
        [v52 checkInDatabase:self->_unprotectedDatabase type:0 protectedResources:0];

        v53 = self->_unprotectedDatabase;
        self->_unprotectedDatabase = 0;

LABEL_55:
        if ((v68 & 1) == 0) {
          goto LABEL_58;
        }
LABEL_56:
        id v54 = objc_loadWeakRetained((id *)&self->_databaseProvider);
        [v54 checkInDatabase:self->_protectedDatabase type:1 protectedResources:self->_protectedResources];

        v55 = self->_protectedDatabase;
        self->_protectedDatabase = 0;

        v50 = self->_protectedResources;
        self->_protectedResources = 0;
        goto LABEL_57;
      }
      id v48 = objc_loadWeakRetained((id *)&self->_databaseProvider);
      [v48 checkInDatabase:self->_protectedDatabase type:1 protectedResources:0];

      v49 = self->_protectedDatabase;
      self->_protectedDatabase = 0;

      char v47 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v45, a4);
    }
    else
    {
      char v47 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v41, a4);
    }
    char v17 = v47;

    double v30 = 0.0;
    v50 = v83;
LABEL_57:

    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 107, @"Cannot peform a database transaction inside a database migration transaction");
LABEL_10:
  char v17 = 0;
LABEL_11:

  return v17 & 1;
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, id, void *))(v6 + 16))(v6, v5, a3);
  }
  else
  {
    id v8 = v5;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 48) == 2)
  {
    id v5 = [*(id *)(a1 + 32) unprotectedDatabase];
    uint64_t v6 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_3;
    v11[3] = &unk_1E63045D8;
    id v7 = *(id *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    uint64_t v8 = [v5 performTransactionWithType:v6 error:a3 usingBlock:v11];

    return v8;
  }
  else
  {
    id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v10();
  }
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  if (!self->_isActive)
  {
    objc_super v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"HDDatabaseTransaction.m" lineNumber:261 description:@"Must be in a transaction"];
  }
  if (v19)
  {
    onCommitBlocks = self->_onCommitBlocks;
    if (!onCommitBlocks)
    {
      id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = self->_onCommitBlocks;
      self->_onCommitBlocks = v9;

      onCommitBlocks = self->_onCommitBlocks;
    }
    id v11 = (void *)[v19 copy];
    id v12 = _Block_copy(v11);
    [(NSMutableArray *)onCommitBlocks addObject:v12];
  }
  if (v7)
  {
    onRollbackBlocks = self->_onRollbackBlocks;
    if (!onRollbackBlocks)
    {
      unsigned int v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v15 = self->_onRollbackBlocks;
      self->_onRollbackBlocks = v14;

      onRollbackBlocks = self->_onRollbackBlocks;
    }
    v16 = (void *)[v7 copy];
    char v17 = _Block_copy(v16);
    [(NSMutableArray *)onRollbackBlocks addObject:v17];
  }
}

- (void)transactionDidEndWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_isActive)
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDatabaseTransaction.m", 280, @"Invalid parameter not satisfying: %@", @"!_isActive" object file lineNumber description];
  }
  if (v5)
  {
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    uint64_t v6 = self->_onRollbackBlocks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * i) + 16))();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    uint64_t v6 = self->_onCommitBlocks;
    uint64_t v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * j) + 16))();
        }
        uint64_t v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }
  }

  onCommitBlocks = self->_onCommitBlocks;
  self->_onCommitBlocks = 0;

  onRollbackBlocks = self->_onRollbackBlocks;
  self->_onRollbackBlocks = 0;
}

- (void)requestTransactionInterruption
{
  [(HDSQLiteDatabase *)self->_protectedDatabase setTransactionInterruptRequested:1];
  unprotectedDatabase = self->_unprotectedDatabase;

  [(HDSQLiteDatabase *)unprotectedDatabase setTransactionInterruptRequested:1];
}

- (void)requireRollback
{
  [(HDSQLiteDatabase *)self->_protectedDatabase requireRollback];
  unprotectedDatabase = self->_unprotectedDatabase;

  [(HDSQLiteDatabase *)unprotectedDatabase requireRollback];
}

- (HDSQLiteDatabase)unprotectedDatabase
{
  return self->_unprotectedDatabase;
}

- (HDSQLiteDatabase)protectedDatabase
{
  return self->_protectedDatabase;
}

- (HDHFDataStore)highFrequencyDataStore
{
  return self->_highFrequencyDataStore;
}

- (HDDatabaseTransactionContext)rootContext
{
  return self->_rootContext;
}

- (BOOL)performingMigration
{
  return self->_performingMigration;
}

- (void)setPerformingMigration:(BOOL)a3
{
  self->_performingMigration = a3;
}

- (NSDictionary)protectedResources
{
  return self->_protectedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootContext, 0);
  objc_storeStrong((id *)&self->_highFrequencyDataStore, 0);
  objc_storeStrong((id *)&self->_protectedDatabase, 0);
  objc_storeStrong((id *)&self->_unprotectedDatabase, 0);
  objc_storeStrong((id *)&self->_protectedResources, 0);
  objc_storeStrong((id *)&self->_onRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_onCommitBlocks, 0);
  objc_destroyWeak((id *)&self->_databaseProvider);

  objc_destroyWeak((id *)&self->_database);
}

@end