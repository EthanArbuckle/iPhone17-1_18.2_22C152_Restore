@interface CPLTransaction
+ (id)newTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5;
+ (id)transactions;
+ (unint64_t)transactionCount;
+ (void)beginTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5;
+ (void)endTransactionWithIdentifier:(id)a3;
- (CPLTransaction)initWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5;
- (NSString)identifier;
- (void)dealloc;
- (void)endTransaction;
@end

@implementation CPLTransaction

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  if (self->_dirty) {
    +[CPLTransaction endTransactionWithIdentifier:self->_identifier];
  }
  v3.receiver = self;
  v3.super_class = (Class)CPLTransaction;
  [(CPLTransaction *)&v3 dealloc];
}

- (void)endTransaction
{
  if (self->_dirty)
  {
    +[CPLTransaction endTransactionWithIdentifier:self->_identifier];
    self->_dirty = 0;
  }
}

- (CPLTransaction)initWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLTransaction;
  v10 = [(CPLTransaction *)&v14 init];
  if (v10)
  {
    +[CPLTransaction beginTransactionWithIdentifier:v8 description:v9 keepPower:v5];
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_dirty = 1;
  }

  return v10;
}

+ (id)newTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CPLTransaction alloc] initWithIdentifier:v8 description:v7 keepPower:v5];

  return v9;
}

+ (unint64_t)transactionCount
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  objc_super v14 = __34__CPLTransaction_transactionCount__block_invoke;
  v15 = &unk_1E60A69C0;
  v16 = &v17;
  v2 = v13;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v4 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v8 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = (void *)_transactions;
    _transactions = (uint64_t)v9;
  }
  v14((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  unint64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __34__CPLTransaction_transactionCount__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)_transactionIdentifiers count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)transactions
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6709;
  v21 = __Block_byref_object_dispose__6710;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  objc_super v14 = __30__CPLTransaction_transactions__block_invoke;
  v15 = &unk_1E60A69C0;
  v16 = &v17;
  v2 = v13;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v4 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v8 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = (void *)_transactions;
    _transactions = (uint64_t)v9;
  }
  v14((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __30__CPLTransaction_transactions__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(id)_transactionIdentifiers count])
  {
    uint64_t v24 = a1;
    id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v3 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)_transactionIdentifiers, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)_transactionIdentifiers;
    uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          int v9 = [(id)_poweredIdentifiers containsObject:v8];
          v10 = NSString;
          id v11 = [(id)_transactionDescriptions objectForKeyedSubscript:v8];
          uint64_t v12 = [(id)_transactionIdentifiers countForObject:v8];
          if (v9) {
            v13 = @"%@ (%lu - power)";
          }
          else {
            v13 = @"%@ (%lu)";
          }
          objc_super v14 = objc_msgSend(v10, "stringWithFormat:", v13, v11, v12);
          [v3 addObject:v14];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }

    uint64_t v15 = [v3 componentsJoinedByString:@"\n"];
    a1 = v24;
    uint64_t v16 = *(void *)(*(void *)(v24 + 32) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = @"No transactions";
  }
  uint64_t v20 = +[CPLPowerAssertion powerAssertionStatus];
  if (v20)
  {
    uint64_t v21 = [[NSString alloc] initWithFormat:@"%@\n%@", v20, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
}

+ (void)endTransactionWithIdentifier:(id)a3
{
  id v5 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  uint64_t v17 = __47__CPLTransaction_endTransactionWithIdentifier___block_invoke;
  uint64_t v18 = &unk_1E60AAE80;
  id v6 = v5;
  id v19 = v6;
  SEL v20 = a2;
  id v21 = a1;
  id v7 = v16;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    int v9 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v13 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = (void *)_transactions;
    _transactions = (uint64_t)v14;
  }
  v17(v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

uint64_t __47__CPLTransaction_endTransactionWithIdentifier___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(id)_poweredIdentifiers containsObject:a1[4]])
  {
    [(id)_poweredIdentifiers removeObject:a1[4]];
    if (![(id)_poweredIdentifiers count]) {
      +[CPLPowerAssertion enableSleep];
    }
  }
  uint64_t v2 = [(id)_transactionIdentifiers countForObject:a1[4]];
  if (!v2)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = a1[4];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Transaction '%@' is invalid", buf, 0xCu);
      }
    }
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLTransaction.m"];
    [v9 handleFailureInMethod:v10, v11, v12, 88, @"Transaction '%@' is invalid", a1[4] object file lineNumber description];

    abort();
  }
  uint64_t v3 = v2;
  uint64_t result = [(id)_transactionIdentifiers removeObject:a1[4]];
  if (v3 == 1)
  {
    [(id)_transactions removeObjectForKey:a1[4]];
    id v5 = (void *)_transactionDescriptions;
    uint64_t v6 = a1[4];
    return [v5 removeObjectForKey:v6];
  }
  return result;
}

+ (void)beginTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  id v21 = __71__CPLTransaction_beginTransactionWithIdentifier_description_keepPower___block_invoke;
  uint64_t v22 = &unk_1E60AA350;
  id v9 = v7;
  id v23 = v9;
  id v10 = v8;
  id v24 = v10;
  BOOL v25 = a5;
  uint64_t v11 = v20;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v13 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v17 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v19 = (void *)_transactions;
    _transactions = (uint64_t)v18;
  }
  v21((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

uint64_t __71__CPLTransaction_beginTransactionWithIdentifier_description_keepPower___block_invoke(uint64_t a1)
{
  if (![(id)_transactionIdentifiers countForObject:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 32) UTF8String];
    uint64_t v2 = (void *)os_transaction_create();
    if (v2) {
      [(id)_transactions setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    [(id)_transactionDescriptions setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t result = [(id)_transactionIdentifiers addObject:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 48))
  {
    if (![(id)_poweredIdentifiers count]) {
      +[CPLPowerAssertion disableSleep];
    }
    uint64_t v4 = (void *)_poweredIdentifiers;
    uint64_t v5 = *(void *)(a1 + 32);
    return [v4 addObject:v5];
  }
  return result;
}

@end