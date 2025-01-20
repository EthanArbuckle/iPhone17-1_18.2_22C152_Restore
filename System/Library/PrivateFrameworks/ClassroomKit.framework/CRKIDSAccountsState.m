@interface CRKIDSAccountsState
+ (id)stateForAccounts:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CRKIDSAccountsState)init;
- (CRKIDSAccountsState)initWithActiveLoginIDs:(id)a3 inactiveLoginIDs:(id)a4;
- (NSDictionary)debugInfo;
- (NSSet)activeLoginIDs;
- (NSSet)inactiveLoginIDs;
- (id)description;
- (unint64_t)summary;
@end

@implementation CRKIDSAccountsState

+ (id)stateForAccounts:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "isActive", (void)v21);
        v14 = [v12 loginID];
        if (v13) {
          v15 = v5;
        }
        else {
          v15 = v6;
        }
        [v15 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc((Class)a1);
  v17 = (void *)[v5 copy];
  v18 = (void *)[v6 copy];
  v19 = (void *)[v16 initWithActiveLoginIDs:v17 inactiveLoginIDs:v18];

  return v19;
}

- (CRKIDSAccountsState)init
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  v5 = [(CRKIDSAccountsState *)self initWithActiveLoginIDs:v3 inactiveLoginIDs:v4];

  return v5;
}

- (CRKIDSAccountsState)initWithActiveLoginIDs:(id)a3 inactiveLoginIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKIDSAccountsState;
  uint64_t v8 = [(CRKIDSAccountsState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    activeLoginIDs = v8->_activeLoginIDs;
    v8->_activeLoginIDs = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    inactiveLoginIDs = v8->_inactiveLoginIDs;
    v8->_inactiveLoginIDs = (NSSet *)v11;
  }
  return v8;
}

- (unint64_t)summary
{
  v3 = [(CRKIDSAccountsState *)self activeLoginIDs];
  if ([v3 count])
  {
  }
  else
  {
    id v4 = [(CRKIDSAccountsState *)self inactiveLoginIDs];
    uint64_t v5 = [v4 count];

    if (!v5) {
      return 0;
    }
  }
  id v6 = [(CRKIDSAccountsState *)self activeLoginIDs];
  uint64_t v7 = [v6 count];

  if (v7) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSDictionary)debugInfo
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"summary";
  unint64_t v3 = [(CRKIDSAccountsState *)self summary];
  if (v3 > 2) {
    id v4 = @"UNKNOWN-ThisIsABug";
  }
  else {
    id v4 = off_2646F5488[v3];
  }
  v10[0] = v4;
  v9[1] = @"activeLoginIDs";
  uint64_t v5 = [(CRKIDSAccountsState *)self activeLoginIDs];
  v10[1] = v5;
  v9[2] = @"inactiveLoginIDs";
  id v6 = [(CRKIDSAccountsState *)self inactiveLoginIDs];
  v10[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(@"activeLoginIDs, inactiveLoginIDs", "componentsSeparatedByString:", @",");
  id v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_17;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  uint64_t v9 = (CRKIDSAccountsState *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKIDSAccountsState *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKIDSAccountsState *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKIDSAccountsState *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(CRKIDSAccountsState *)self summary];
  if (v5 > 2) {
    id v6 = @"UNKNOWN-ThisIsABug";
  }
  else {
    id v6 = off_2646F5488[v5];
  }
  id v7 = [(CRKIDSAccountsState *)self activeLoginIDs];
  uint64_t v8 = objc_msgSend(v7, "crk_stableDescription");
  uint64_t v9 = [(CRKIDSAccountsState *)self inactiveLoginIDs];
  id v10 = objc_msgSend(v9, "crk_stableDescription");
  id v11 = [v3 stringWithFormat:@"<%@: %p { summary = %@, activeLoginIDs = %@, inactiveLoginIDs = %@ }>", v4, self, v6, v8, v10];

  return v11;
}

- (NSSet)activeLoginIDs
{
  return self->_activeLoginIDs;
}

- (NSSet)inactiveLoginIDs
{
  return self->_inactiveLoginIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveLoginIDs, 0);

  objc_storeStrong((id *)&self->_activeLoginIDs, 0);
}

@end