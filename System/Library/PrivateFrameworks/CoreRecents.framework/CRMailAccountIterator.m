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
  v3 = +[ACAccountStore defaultStore];
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
  v4 = (void (**)(id, void, id))a3;
  [(CRMailAccountIterator *)self mailAccounts];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = MSAccountResultsKeyRestrictedFromSyncingRecents;
    uint64_t v19 = *(void *)v25;
    uint64_t v7 = MSAccountResultsKeyFromEmailAddressesIncludingDisabled;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v10 = [v9 objectForKeyedSubscript:v18];
        id v11 = [v10 BOOLValue];

        v12 = [v9 objectForKeyedSubscript:v7];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              v4[2](v4, *(void *)(*((void *)&v20 + 1) + 8 * (void)j), v11);
            }
            id v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

- (id)mailAccounts
{
  id v2 = objc_alloc_init((Class)CNPromise);
  v3 = [v2 future];
  [v3 addFailureBlock:&stru_10002CA88];

  v9[0] = MSAccountResultsKeyFromEmailAddressesIncludingDisabled;
  v9[1] = MSAccountResultsKeyRestrictedFromSyncingRecents;
  v4 = +[NSArray arrayWithObjects:v9 count:2];
  id v5 = [v2 completionHandlerAdapter];
  +[MSAccounts accountValuesForKeys:v4 completionBlock:v5];

  id v6 = [v2 future];
  uint64_t v7 = [v6 resultWithTimeout:0 error:10.0];

  return v7;
}

- (id)emailAddressesForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = [v3 accountProperties];
  id v6 = [v5 objectForKeyedSubscript:ACAccountPropertyIdentityEmailAddress];

  if (v6)
  {
    uint64_t v7 = +[EAEmailAddressParser rawAddressFromFullAddress:v6];
    [v4 addObject:v7];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [v3 objectForKeyedSubscript:ACEmailAliasKeyEmailAddresses];
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[EAEmailAddressParser rawAddressFromFullAddress:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v4 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  id v14 = [v3 accountProperties];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"defaultAddress"];

  if (v15)
  {
    v16 = +[EAEmailAddressParser rawAddressFromFullAddress:v15];
    [v4 addObject:v16];
  }
  v17 = [(id)objc_opt_class() receivedEmailAddressesFromAccount:v3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = +[EAEmailAddressParser rawAddressFromFullAddress:*(void *)(*((void *)&v25 + 1) + 8 * (void)j)];
        [v4 addObject:v22];
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
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
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = [v6 allKeys];
LABEL_11:
    id v9 = v7;

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
  id v9 = 0;
LABEL_13:
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
}

@end