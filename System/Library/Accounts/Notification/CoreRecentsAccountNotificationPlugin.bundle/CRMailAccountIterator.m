@interface CRMailAccountIterator
+ (id)receivedEmailAddressesFromAccount:(id)a3;
- (CRMailAccountIterator)init;
- (CRMailAccountIterator)initWithAccountStore:(id)a3;
- (id)emailAddressesForAccount:(id)a3;
- (id)mailAccounts;
- (void)enumerateEmailAddresses:(id)a3;
@end

@implementation CRMailAccountIterator

- (CRMailAccountIterator)init
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = [(CRMailAccountIterator *)self initWithAccountStore:v3];

  return v4;
}

- (CRMailAccountIterator)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRMailAccountIterator;
  v6 = [(CRMailAccountIterator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)enumerateEmailAddresses:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, uint64_t))a3;
  [(CRMailAccountIterator *)self mailAccounts];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *MEMORY[0x263F53668];
    uint64_t v19 = *(void *)v25;
    uint64_t v7 = *MEMORY[0x263F53660];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v10 = [v9 objectForKeyedSubscript:v18];
        uint64_t v11 = [v10 BOOLValue];

        v12 = [v9 objectForKeyedSubscript:v7];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              v4[2](v4, *(void *)(*((void *)&v20 + 1) + 8 * j), v11);
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

- (id)mailAccounts
{
  v11[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F33630]);
  v3 = [v2 future];
  [v3 addFailureBlock:&unk_26F4A85A0];

  v4 = (void *)MEMORY[0x263F53698];
  uint64_t v5 = *MEMORY[0x263F53668];
  v11[0] = *MEMORY[0x263F53660];
  v11[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  uint64_t v7 = [v2 completionHandlerAdapter];
  [v4 accountValuesForKeys:v6 completionBlock:v7];

  v8 = [v2 future];
  v9 = [v8 resultWithTimeout:0 error:10.0];

  return v9;
}

- (id)emailAddressesForAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v5 = [v3 accountProperties];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFADB0]];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F3B1C0] rawAddressFromFullAddress:v6];
    [v4 addObject:v7];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFB068]];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [MEMORY[0x263F3B1C0] rawAddressFromFullAddress:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v4 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v3 accountProperties];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"defaultAddress"];

  if (v15)
  {
    v16 = [MEMORY[0x263F3B1C0] rawAddressFromFullAddress:v15];
    [v4 addObject:v16];
  }
  v17 = [(id)objc_opt_class() receivedEmailAddressesFromAccount:v3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = [MEMORY[0x263F3B1C0] rawAddressFromFullAddress:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        [v4 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }
  long long v23 = [v4 allObjects];

  return v23;
}

+ (id)receivedEmailAddressesFromAccount:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"ReceiveEmailAliasAddresses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;

    id v7 = [v6 allKeys];
LABEL_11:
    uint64_t v9 = v7;

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v3;
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    id v7 = v8;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_13:
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
}

@end