@interface CXTransactionGroup
- (BOOL)isComplete;
- (BOOL)isServiceClientGroupComplete;
- (CXTransactionGroup)init;
- (NSArray)allActions;
- (NSArray)callSources;
- (NSArray)providerSources;
- (NSArray)serviceClientActions;
- (NSArray)serviceClientTransactions;
- (NSArray)serviceClients;
- (NSArray)transactions;
- (NSMutableArray)mutableCallSources;
- (NSMutableArray)mutableProviderSources;
- (NSMutableArray)mutableServiceClients;
- (NSMutableDictionary)callSourceIdentifierToTransaction;
- (NSMutableDictionary)providerSourceIdentifierToTransaction;
- (NSMutableDictionary)serviceClientIdentifierToTransaction;
- (id)description;
- (id)transactionForCallSource:(id)a3;
- (id)transactionForProviderSource:(id)a3;
- (id)transactionForServiceClient:(id)a3;
- (void)addAction:(id)a3 forCallSource:(id)a4;
- (void)addAction:(id)a3 forProviderSource:(id)a4;
- (void)addAction:(id)a3 forServiceClient:(id)a4;
@end

@implementation CXTransactionGroup

- (CXTransactionGroup)init
{
  v16.receiver = self;
  v16.super_class = (Class)CXTransactionGroup;
  v2 = [(CXTransactionGroup *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    callSourceIdentifierToTransaction = v2->_callSourceIdentifierToTransaction;
    v2->_callSourceIdentifierToTransaction = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    mutableCallSources = v2->_mutableCallSources;
    v2->_mutableCallSources = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    providerSourceIdentifierToTransaction = v2->_providerSourceIdentifierToTransaction;
    v2->_providerSourceIdentifierToTransaction = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    mutableProviderSources = v2->_mutableProviderSources;
    v2->_mutableProviderSources = (NSMutableArray *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serviceClientIdentifierToTransaction = v2->_serviceClientIdentifierToTransaction;
    v2->_serviceClientIdentifierToTransaction = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableServiceClients = v2->_mutableServiceClients;
    v2->_mutableServiceClients = v13;
  }
  return v2;
}

- (id)description
{
  v2 = [(CXTransactionGroup *)self callSourceIdentifierToTransaction];
  uint64_t v3 = [v2 description];

  return v3;
}

- (BOOL)isComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CXTransactionGroup *)self transactions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isComplete])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)callSources
{
  v2 = [(CXTransactionGroup *)self mutableCallSources];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)transactions
{
  uint64_t v3 = [(CXTransactionGroup *)self callSourceIdentifierToTransaction];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(CXTransactionGroup *)self callSourceIdentifierToTransaction];
  }
  else {
  v6 = [(CXTransactionGroup *)self providerSourceIdentifierToTransaction];
  }
  BOOL v7 = [v6 allValues];

  return (NSArray *)v7;
}

- (NSArray)allActions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [(CXTransactionGroup *)self transactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v10 = objc_msgSend(v9, "actions", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  v15 = (void *)[v3 copy];

  return (NSArray *)v15;
}

- (id)transactionForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXTransactionGroup *)self callSourceIdentifierToTransaction];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)addAction:(id)a3 forCallSource:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(CXTransactionGroup *)self transactionForCallSource:v6];
  if (!v7)
  {
    uint64_t v7 = objc_alloc_init(CXTransaction);
    v8 = [(CXTransactionGroup *)self callSourceIdentifierToTransaction];
    long long v9 = [v6 identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];

    long long v10 = [(CXTransactionGroup *)self mutableCallSources];
    [v10 addObject:v6];
  }
  [(CXTransaction *)v7 addAction:v11];
}

- (NSArray)providerSources
{
  v2 = [(CXTransactionGroup *)self mutableProviderSources];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addAction:(id)a3 forProviderSource:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(CXTransactionGroup *)self transactionForProviderSource:v6];
  if (!v7)
  {
    uint64_t v7 = objc_alloc_init(CXTransaction);
    v8 = [(CXTransactionGroup *)self providerSourceIdentifierToTransaction];
    long long v9 = [v6 identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];

    long long v10 = [(CXTransactionGroup *)self mutableProviderSources];
    [v10 addObject:v6];
  }
  [(CXTransaction *)v7 addAction:v11];
}

- (id)transactionForProviderSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXTransactionGroup *)self providerSourceIdentifierToTransaction];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (BOOL)isServiceClientGroupComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CXTransactionGroup *)self serviceClientTransactions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isComplete])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)serviceClientActions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [(CXTransactionGroup *)self serviceClientTransactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v10 = objc_msgSend(v9, "actions", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  v15 = (void *)[v3 copy];

  return (NSArray *)v15;
}

- (NSArray)serviceClientTransactions
{
  v2 = [(CXTransactionGroup *)self serviceClientIdentifierToTransaction];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)serviceClients
{
  v2 = [(CXTransactionGroup *)self mutableServiceClients];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addAction:(id)a3 forServiceClient:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(CXTransactionGroup *)self transactionForServiceClient:v6];
  if (!v7)
  {
    uint64_t v7 = objc_alloc_init(CXTransaction);
    v8 = [(CXTransactionGroup *)self serviceClientIdentifierToTransaction];
    long long v9 = [v6 identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];

    long long v10 = [(CXTransactionGroup *)self mutableServiceClients];
    [v10 addObject:v6];
  }
  [(CXTransaction *)v7 addAction:v11];
}

- (id)transactionForServiceClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXTransactionGroup *)self serviceClientIdentifierToTransaction];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (NSMutableDictionary)callSourceIdentifierToTransaction
{
  return self->_callSourceIdentifierToTransaction;
}

- (NSMutableArray)mutableCallSources
{
  return self->_mutableCallSources;
}

- (NSMutableDictionary)providerSourceIdentifierToTransaction
{
  return self->_providerSourceIdentifierToTransaction;
}

- (NSMutableArray)mutableProviderSources
{
  return self->_mutableProviderSources;
}

- (NSMutableArray)mutableServiceClients
{
  return self->_mutableServiceClients;
}

- (NSMutableDictionary)serviceClientIdentifierToTransaction
{
  return self->_serviceClientIdentifierToTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientIdentifierToTransaction, 0);
  objc_storeStrong((id *)&self->_mutableServiceClients, 0);
  objc_storeStrong((id *)&self->_mutableProviderSources, 0);
  objc_storeStrong((id *)&self->_providerSourceIdentifierToTransaction, 0);
  objc_storeStrong((id *)&self->_mutableCallSources, 0);

  objc_storeStrong((id *)&self->_callSourceIdentifierToTransaction, 0);
}

@end