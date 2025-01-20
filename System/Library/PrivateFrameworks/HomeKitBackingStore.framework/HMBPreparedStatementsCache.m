@interface HMBPreparedStatementsCache
- (HMBPreparedStatementsCache)init;
- (id)evictAllStatements;
- (sqlite3_stmt)_extractStatementForString:(id)a3;
- (sqlite3_stmt)evictLeastRecentlyUsedStatement;
- (sqlite3_stmt)statementForString:(id)a3;
- (unint64_t)count;
- (void)setStatement:(sqlite3_stmt *)a3 forString:(id)a4;
@end

@implementation HMBPreparedStatementsCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lruQueue, 0);
  objc_storeStrong((id *)&self->_statementsByStatementString, 0);
}

- (id)evictAllStatements
{
  v3 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:1282];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    statementsByStatementString = self->_statementsByStatementString;
  }
  else {
    statementsByStatementString = 0;
  }
  v6 = statementsByStatementString;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__HMBPreparedStatementsCache_evictAllStatements__block_invoke;
  v13[3] = &unk_1E69EAA40;
  id v7 = v3;
  id v14 = v7;
  [(NSMutableDictionary *)v6 hmf_enumerateKeysAndObjectsWithAutoreleasePoolUsingBlock:v13];

  if (self) {
    v8 = self->_statementsByStatementString;
  }
  else {
    v8 = 0;
  }
  v9 = v8;
  [(NSMutableDictionary *)v9 removeAllObjects];

  if (self) {
    lruQueue = self->_lruQueue;
  }
  else {
    lruQueue = 0;
  }
  v11 = lruQueue;
  [(NSMutableArray *)v11 removeAllObjects];

  os_unfair_lock_unlock(&p_lock->lock);
  return v7;
}

uint64_t __48__HMBPreparedStatementsCache_evictAllStatements__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a3 statement];
  return [v3 addPointer:v4];
}

- (sqlite3_stmt)evictLeastRecentlyUsedStatement
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    lruQueue = self->_lruQueue;
  }
  else {
    lruQueue = 0;
  }
  v5 = lruQueue;
  v6 = [(NSMutableArray *)v5 firstObject];
  id v7 = [(HMBPreparedStatementsCache *)self _extractStatementForString:v6];

  os_unfair_lock_unlock(&p_lock->lock);
  return v7;
}

- (sqlite3_stmt)_extractStatementForString:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944CB30]();
  if (self) {
    statementsByStatementString = self->_statementsByStatementString;
  }
  else {
    statementsByStatementString = 0;
  }
  id v7 = [(NSMutableDictionary *)statementsByStatementString objectForKey:v4];
  if (v7)
  {
    if (self)
    {
      [(NSMutableDictionary *)self->_statementsByStatementString removeObjectForKey:v4];
      lruQueue = self->_lruQueue;
    }
    else
    {
      [0 removeObjectForKey:v4];
      lruQueue = 0;
    }
    [(NSMutableArray *)lruQueue removeObject:v4];
  }
  v9 = (sqlite3_stmt *)[v7 statement];

  return v9;
}

- (void)setStatement:(sqlite3_stmt *)a3 forString:(id)a4
{
  id v8 = a4;
  if (!a3)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v8)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  id v20 = v8;
  p_lock = &self->_lock;
  uint64_t v9 = os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1D944CB30](v9);
  if (self)
  {
    statementsByStatementString = self->_statementsByStatementString;
    goto LABEL_5;
  }
LABEL_18:
  statementsByStatementString = 0;
LABEL_5:
  v11 = statementsByStatementString;
  v12 = [(NSMutableDictionary *)v11 objectForKey:v20];

  if (v12)
  {
    if (self) {
      lruQueue = self->_lruQueue;
    }
    else {
      lruQueue = 0;
    }
    id v14 = lruQueue;
    [(NSMutableArray *)v14 removeObject:v20];
  }
  if (self) {
    v15 = self->_statementsByStatementString;
  }
  else {
    v15 = 0;
  }
  v16 = v15;
  v17 = [[HMBSQLCachedPreparedStatement alloc] initWithStatement:a3];
  [(NSMutableDictionary *)v16 setObject:v17 forKey:v20];

  if (self) {
    v18 = self->_lruQueue;
  }
  else {
    v18 = 0;
  }
  v19 = v18;
  [(NSMutableArray *)v19 addObject:v20];

  os_unfair_lock_unlock(&p_lock->lock);
}

- (sqlite3_stmt)statementForString:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  id v7 = (void *)MEMORY[0x1D944CB30](v6);
  if (self) {
    statementsByStatementString = self->_statementsByStatementString;
  }
  else {
    statementsByStatementString = 0;
  }
  uint64_t v9 = statementsByStatementString;
  v10 = [(NSMutableDictionary *)v9 objectForKey:v4];

  if (v10)
  {
    if (self) {
      lruQueue = self->_lruQueue;
    }
    else {
      lruQueue = 0;
    }
    v12 = lruQueue;
    [(NSMutableArray *)v12 removeObject:v4];

    if (self) {
      v13 = self->_lruQueue;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;
    [(NSMutableArray *)v14 addObject:v4];
  }
  v15 = (sqlite3_stmt *)[v10 statement];

  os_unfair_lock_unlock(&p_lock->lock);

  return v15;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    statementsByStatementString = self->_statementsByStatementString;
  }
  else {
    statementsByStatementString = 0;
  }
  v5 = statementsByStatementString;
  unint64_t v6 = [(NSMutableDictionary *)v5 count];

  os_unfair_lock_unlock(&p_lock->lock);
  return v6;
}

- (HMBPreparedStatementsCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMBPreparedStatementsCache;
  v2 = [(HMBPreparedStatementsCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statementsByStatementString = v2->_statementsByStatementString;
    v2->_statementsByStatementString = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lruQueue = v2->_lruQueue;
    v2->_lruQueue = v5;

    v2->_lock.lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end