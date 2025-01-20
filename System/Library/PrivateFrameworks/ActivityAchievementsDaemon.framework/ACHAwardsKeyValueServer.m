@interface ACHAwardsKeyValueServer
+ (id)taskIdentifier;
- (ACHAwardsKeyValueServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDKeyValueDomain)legacyDomain;
- (NSMutableDictionary)domainsByName;
- (id)_domainForName:(id)a3;
- (id)_transactionContextForWritingProtectedDataWithIdentifier:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_protectedDataAvailableWithCompletion:(id)a3;
- (void)remote_removeValuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)remote_removeValuesForKeysInDomains:(id)a3 completion:(id)a4;
- (void)remote_setLegacyValuesWithDictionary:(id)a3 completion:(id)a4;
- (void)remote_setValue:(id)a3 forKey:(id)a4 domain:(id)a5 completion:(id)a6;
- (void)remote_setValuesWithDictionary:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)remote_setValuesWithDomainDictionary:(id)a3 completion:(id)a4;
- (void)remote_valueForKey:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)remote_valuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)setDomainsByName:(id)a3;
- (void)setLegacyDomain:(id)a3;
@end

@implementation ACHAwardsKeyValueServer

- (ACHAwardsKeyValueServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACHAwardsKeyValueServer;
  v11 = [(HDStandardTaskServer *)&v20 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    domainsByName = v11->_domainsByName;
    v11->_domainsByName = v12;

    v11->_domainLock._os_unfair_lock_opaque = 0;
    id v14 = objc_alloc(MEMORY[0x263F43218]);
    uint64_t v15 = *MEMORY[0x263F43030];
    v16 = [v10 profile];
    uint64_t v17 = [v14 initWithCategory:106 domainName:v15 profile:v16];
    legacyDomain = v11->_legacyDomain;
    v11->_legacyDomain = (HDKeyValueDomain *)v17;
  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F23498];
}

- (id)_transactionContextForWritingProtectedDataWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HDStandardTaskServer *)self client];
  v6 = [v5 profile];
  v7 = [v6 database];
  id v13 = 0;
  v8 = +[ACHDatabaseAssertion assertionWithDatabase:v7 identifier:v4 error:&v13];

  id v9 = v13;
  if (v9)
  {
    id v10 = ACHLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHAwardsServer _transactionContextForWritingProtectedDataWithIdentifier:]((uint64_t)v9, v10);
    }
  }
  v11 = ACHDatabaseContextWithAccessibilityAssertion(v8);
  [v11 setRequiresWrite:1];
  [v11 setRequiresProtectedData:1];

  return v11;
}

- (id)_domainForName:(id)a3
{
  id v4 = a3;
  p_domainLock = &self->_domainLock;
  os_unfair_lock_lock(&self->_domainLock);
  v6 = [(ACHAwardsKeyValueServer *)self domainsByName];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F43218]);
    id v9 = [(HDStandardTaskServer *)self profile];
    v7 = (void *)[v8 initWithCategory:107 domainName:v4 profile:v9];

    id v10 = [(ACHAwardsKeyValueServer *)self domainsByName];
    [v10 setObject:v7 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(p_domainLock);

  return v7;
}

- (void)remote_protectedDataAvailableWithCompletion:(id)a3
{
  id v5 = a3;
  id v7 = [(HDStandardTaskServer *)self profile];
  v6 = [v7 database];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 isProtectedDataAvailable]);
}

- (void)remote_removeValuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = a3;
  id v10 = [(ACHAwardsKeyValueServer *)self _domainForName:a4];
  v11 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v9];

  id v14 = 0;
  uint64_t v12 = [v10 removeValuesForKeys:v11 error:&v14];
  id v13 = v14;

  v8[2](v8, v12, v13);
}

- (void)remote_removeValuesForKeysInDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = [(ACHAwardsKeyValueServer *)self _transactionContextForWritingProtectedDataWithIdentifier:@"RemoveValues"];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [v9 database];
  v16 = self;
  id v17 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__ACHAwardsKeyValueServer_remote_removeValuesForKeysInDomains_completion___block_invoke;
  v14[3] = &unk_2645176B8;
  id v15 = v6;
  id v11 = v6;
  uint64_t v12 = [v10 performTransactionWithContext:v8 error:&v17 block:v14 inaccessibilityHandler:0];
  id v13 = v17;

  v7[2](v7, v12, v13);
}

uint64_t __74__ACHAwardsKeyValueServer_remote_removeValuesForKeysInDomains_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    LOBYTE(v9) = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
        id v13 = [*(id *)(a1 + 40) _domainForName:v11];
        if (v9)
        {
          id v14 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v12];
          uint64_t v9 = [v13 removeValuesForKeys:v14 error:a3];
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)remote_setLegacyValuesWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, id))a4;
  uint64_t v8 = [(ACHAwardsKeyValueServer *)self _transactionContextForWritingProtectedDataWithIdentifier:@"SetLegacyValues"];
  uint64_t v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [v9 database];
  id v15 = v6;
  id v16 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__ACHAwardsKeyValueServer_remote_setLegacyValuesWithDictionary_completion___block_invoke;
  v14[3] = &unk_2645176B8;
  void v14[4] = self;
  id v11 = v6;
  uint64_t v12 = [v10 performTransactionWithContext:v8 error:&v16 block:v14 inaccessibilityHandler:0];
  id v13 = v16;

  v7[2](v7, v12, v13);
}

uint64_t __75__ACHAwardsKeyValueServer_remote_setLegacyValuesWithDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) legacyDomain];
  uint64_t v6 = [v5 setValuesWithDictionary:*(void *)(a1 + 40) error:a3];

  return v6;
}

- (void)remote_setValue:(id)a3 forKey:(id)a4 domain:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, uint64_t, id))a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ACHAwardsKeyValueServer *)self _domainForName:a5];
  id v16 = 0;
  uint64_t v14 = [v13 setNumber:v12 forKey:v11 error:&v16];

  id v15 = v16;
  v10[2](v10, v14, v15);
}

- (void)remote_setValuesWithDictionary:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = a4;
  id v11 = [(ACHAwardsKeyValueServer *)self _transactionContextForWritingProtectedDataWithIdentifier:@"SetValues"];
  id v12 = [(ACHAwardsKeyValueServer *)self _domainForName:v10];

  id v13 = [(HDStandardTaskServer *)self profile];
  uint64_t v14 = [v13 database];
  id v21 = v8;
  id v22 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__ACHAwardsKeyValueServer_remote_setValuesWithDictionary_domain_completion___block_invoke;
  v19[3] = &unk_2645176B8;
  id v20 = v12;
  id v15 = v8;
  id v16 = v12;
  uint64_t v17 = [v14 performTransactionWithContext:v11 error:&v22 block:v19 inaccessibilityHandler:0];
  id v18 = v22;

  v9[2](v9, v17, v18);
}

uint64_t __76__ACHAwardsKeyValueServer_remote_setValuesWithDictionary_domain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValuesWithDictionary:*(void *)(a1 + 40) error:a3];
}

- (void)remote_setValuesWithDomainDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = [(ACHAwardsKeyValueServer *)self _transactionContextForWritingProtectedDataWithIdentifier:@"SetValuesWithDomainDict"];
  uint64_t v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [v9 database];
  id v16 = self;
  id v17 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__ACHAwardsKeyValueServer_remote_setValuesWithDomainDictionary_completion___block_invoke;
  v14[3] = &unk_2645176B8;
  id v15 = v6;
  id v11 = v6;
  uint64_t v12 = [v10 performTransactionWithContext:v8 error:&v17 block:v14 inaccessibilityHandler:0];
  id v13 = v17;

  v7[2](v7, v12, v13);
}

uint64_t __75__ACHAwardsKeyValueServer_remote_setValuesWithDomainDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    LOBYTE(v9) = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
        id v13 = [*(id *)(a1 + 40) _domainForName:v11];
        uint64_t v14 = v13;
        if (v9) {
          uint64_t v9 = [v13 setValuesWithDictionary:v12 error:a3];
        }
        else {
          uint64_t v9 = 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)remote_valueForKey:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__25;
  v26 = __Block_byref_object_dispose__25;
  id v27 = 0;
  uint64_t v11 = [(ACHAwardsKeyValueServer *)self _domainForName:v9];
  uint64_t v12 = [(HDStandardTaskServer *)self profile];
  id v13 = [v12 database];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__ACHAwardsKeyValueServer_remote_valueForKey_domain_completion___block_invoke;
  v17[3] = &unk_264517AC0;
  id v20 = &v22;
  id v21 = 0;
  id v14 = v11;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  [v13 performHighPriorityTransactionsWithError:&v21 block:v17];
  id v16 = v21;

  v10[2](v10, v23[5], v16);
  _Block_object_dispose(&v22, 8);
}

BOOL __64__ACHAwardsKeyValueServer_remote_valueForKey_domain_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) numberForKey:*(void *)(a1 + 40) error:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (void)remote_valuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  uint64_t v11 = [(ACHAwardsKeyValueServer *)self _transactionContextForWritingProtectedDataWithIdentifier:@"FetchValuesForKeys"];
  [v11 setHighPriority:1];
  [v11 setRequiresWrite:0];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__25;
  id v27 = __Block_byref_object_dispose__25;
  id v28 = 0;
  uint64_t v12 = [(ACHAwardsKeyValueServer *)self _domainForName:v9];
  id v13 = [(HDStandardTaskServer *)self profile];
  id v14 = [v13 database];
  id v22 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__ACHAwardsKeyValueServer_remote_valuesForKeys_domain_completion___block_invoke;
  v18[3] = &unk_264516CA0;
  id v15 = v8;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v21 = &v23;
  [v14 performTransactionWithContext:v11 error:&v22 block:v18 inaccessibilityHandler:0];
  id v17 = v22;

  v10[2](v10, v24[5], v17);
  _Block_object_dispose(&v23, 8);
}

uint64_t __66__ACHAwardsKeyValueServer_remote_valuesForKeys_domain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "numberForKey:error:", v11, a3, (void)v17);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [objc_alloc(NSDictionary) initWithDictionary:v5];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  return 1;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12AF18];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133DC0];
}

- (NSMutableDictionary)domainsByName
{
  return self->_domainsByName;
}

- (void)setDomainsByName:(id)a3
{
}

- (HDKeyValueDomain)legacyDomain
{
  return self->_legacyDomain;
}

- (void)setLegacyDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDomain, 0);
  objc_storeStrong((id *)&self->_domainsByName, 0);
}

@end