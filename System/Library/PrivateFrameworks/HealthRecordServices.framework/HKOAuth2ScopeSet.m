@interface HKOAuth2ScopeSet
+ (id)scopeSetWithScopeString:(id)a3;
+ (id)scopeSetWithScopes:(id)a3;
+ (id)scopesFromScopeString:(id)a3;
+ (unint64_t)_nonWildcardReadCompare:(id)a3 to:(id)a4;
+ (unint64_t)_nonWildcardWriteCompare:(id)a3 to:(id)a4;
+ (unint64_t)_readCompare:(id)a3 to:(id)a4;
+ (unint64_t)_writeCompare:(id)a3 to:(id)a4;
+ (unint64_t)compare:(id)a3 to:(id)a4;
- (BOOL)canReadAllResourceTypes;
- (BOOL)canReadResourceType:(id)a3;
- (BOOL)canWriteAllResourceTypes;
- (BOOL)canWriteResourceType:(id)a3;
- (BOOL)hasAtLeastOneResourceTypeScope;
- (BOOL)hasClinicalSharingScopes;
- (BOOL)isMissingScopesFrom:(id)a3;
- (HKOAuth2ScopeSet)init;
- (HKOAuth2ScopeSet)initWithOriginalScopes:(id)a3 readableResourceTypes:(id)a4 writableResourceTypes:(id)a5 canReadAllResourceTypes:(BOOL)a6 canWriteAllResourceTypes:(BOOL)a7 hasAtLeastOneResourceTypeScope:(BOOL)a8;
- (NSSet)originalScopes;
- (NSSet)readableResourceTypes;
- (NSSet)writableResourceTypes;
- (id)description;
- (unint64_t)compareTo:(id)a3;
@end

@implementation HKOAuth2ScopeSet

- (HKOAuth2ScopeSet)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOAuth2ScopeSet)initWithOriginalScopes:(id)a3 readableResourceTypes:(id)a4 writableResourceTypes:(id)a5 canReadAllResourceTypes:(BOOL)a6 canWriteAllResourceTypes:(BOOL)a7 hasAtLeastOneResourceTypeScope:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKOAuth2ScopeSet;
  v17 = [(HKOAuth2ScopeSet *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    originalScopes = v17->_originalScopes;
    v17->_originalScopes = (NSSet *)v18;

    uint64_t v20 = [v15 copy];
    readableResourceTypes = v17->_readableResourceTypes;
    v17->_readableResourceTypes = (NSSet *)v20;

    uint64_t v22 = [v16 copy];
    writableResourceTypes = v17->_writableResourceTypes;
    v17->_writableResourceTypes = (NSSet *)v22;

    v17->_canReadAllResourceTypes = a6;
    v17->_canWriteAllResourceTypes = a7;
    v17->_hasAtLeastOneResourceTypeScope = a8;
  }

  return v17;
}

+ (id)scopeSetWithScopes:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v30 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v5)
  {
    unint64_t v32 = 0;
    char v28 = 0;
    goto LABEL_43;
  }
  uint64_t v6 = v5;
  unint64_t v32 = 0;
  char v28 = 0;
  uint64_t v7 = *(void *)v34;
  id v31 = v4;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v10 = objc_msgSend(v9, "componentsSeparatedByString:", @"/", v27);
      if ((unint64_t)[v10 count] >= 2)
      {
        v11 = [v10 objectAtIndexedSubscript:0];
        if (([v11 isEqualToString:@"patient"] & 1) == 0
          && ![v11 isEqualToString:@"user"])
        {
          goto LABEL_38;
        }
        v12 = [v10 objectAtIndexedSubscript:1];
        v13 = [v12 componentsSeparatedByString:@"."];

        if ((unint64_t)[v13 count] <= 1)
        {
          _HKInitializeLogging();
          id v14 = *MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v38 = a1;
            __int16 v39 = 2114;
            v40 = v9;
            _os_log_impl(&dword_221D38000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid scope detected: %{public}@", buf, 0x16u);
          }
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
        id v15 = [v13 objectAtIndexedSubscript:0];
        id v16 = [v13 objectAtIndexedSubscript:1];
        int v17 = [v15 isEqualToString:@"*"];
        if ([v16 isEqualToString:@"*"])
        {
          if (v17)
          {
            int v18 = 1;
            int v19 = 1;
            goto LABEL_18;
          }
          [v30 addObject:v15];
LABEL_34:
          uint64_t v20 = v27;
LABEL_35:
          [v20 addObject:v15];
          int v18 = 1;
          int v19 = HIDWORD(v32);
          goto LABEL_36;
        }
        if ([v16 isEqualToString:@"read"])
        {
          uint64_t v20 = v30;
          if ((v17 & 1) == 0) {
            goto LABEL_35;
          }
          int v18 = 1;
          int v19 = HIDWORD(v32);
LABEL_18:
          char v28 = 1;
LABEL_36:
          unint64_t v32 = __PAIR64__(v19, v18);

          id v4 = v31;
          goto LABEL_37;
        }
        if (![v16 isEqualToString:@"write"])
        {
          if ([v16 containsString:@"r"])
          {
            if (v17)
            {
              char v21 = [v16 containsString:@"c"];
              char v28 = 1;
              LODWORD(v32) = 1;
              int v18 = 1;
              int v19 = 1;
              if (v21) {
                goto LABEL_36;
              }
              goto LABEL_32;
            }
LABEL_27:
            [v30 addObject:v15];
            int v23 = 1;
          }
          else
          {
            int v22 = [v16 containsString:@"s"];
            if (((v22 ^ 1 | v17) & 1) == 0) {
              goto LABEL_27;
            }
            int v23 = v22 | v32;
            v28 |= v22;
          }
          if (([v16 containsString:@"c"] & 1) == 0)
          {
            LODWORD(v32) = v23;
LABEL_32:
            int v24 = [v16 containsString:@"w"];
            if (((v24 ^ 1 | v17) & 1) == 0) {
              goto LABEL_34;
            }
            int v18 = v24 | v32;
            int v19 = v24 | HIDWORD(v32);
            goto LABEL_36;
          }
        }
        if ((v17 & 1) == 0) {
          goto LABEL_34;
        }
        int v18 = 1;
        int v19 = 1;
        goto LABEL_36;
      }
LABEL_39:
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
  }
  while (v6);
LABEL_43:

  objc_super v25 = (void *)[objc_alloc((Class)a1) initWithOriginalScopes:v4 readableResourceTypes:v30 writableResourceTypes:v27 canReadAllResourceTypes:v28 & 1 canWriteAllResourceTypes:BYTE4(v32) & 1 hasAtLeastOneResourceTypeScope:v32 & 1];

  return v25;
}

+ (id)scopeSetWithScopeString:(id)a3
{
  id v4 = [a1 scopesFromScopeString:a3];
  uint64_t v5 = [a1 scopeSetWithScopes:v4];

  return v5;
}

- (BOOL)canReadResourceType:(id)a3
{
  return self->_canReadAllResourceTypes || [(NSSet *)self->_readableResourceTypes containsObject:a3];
}

- (BOOL)canWriteResourceType:(id)a3
{
  return self->_canWriteAllResourceTypes
      || [(NSSet *)self->_writableResourceTypes containsObject:a3];
}

- (BOOL)hasClinicalSharingScopes
{
  BOOL v3 = [(HKOAuth2ScopeSet *)self canReadResourceType:@"DocumentReference"];
  if (v3)
  {
    LOBYTE(v3) = [(HKOAuth2ScopeSet *)self canWriteResourceType:@"DocumentReference"];
  }
  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSSet *)self->_originalScopes allObjects];
  uint64_t v6 = [v5 componentsJoinedByString:@" "];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p; scopes: \"%@\">", v4, self, v6];

  return v7;
}

- (BOOL)isMissingScopesFrom:(id)a3
{
  uint64_t v4 = +[HKOAuth2ScopeSet scopeSetWithScopes:a3];
  unint64_t v5 = [(HKOAuth2ScopeSet *)self compareTo:v4];

  return v5 > 1;
}

- (unint64_t)compareTo:(id)a3
{
  return +[HKOAuth2ScopeSet compare:self to:a3];
}

+ (unint64_t)compare:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _readCompare:v7 to:v6];
  unint64_t v9 = [a1 _writeCompare:v7 to:v6];

  switch(v8)
  {
    case 3:
      return 3;
    case 2:
      if (v9 < 4)
      {
        v10 = &unk_221D87C28;
        return v10[v9];
      }
      return 3;
    case 1:
      if (v9 < 4)
      {
        v10 = &unk_221D87C08;
        return v10[v9];
      }
      return 3;
  }
  return v9;
}

+ (unint64_t)_readCompare:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 canReadAllResourceTypes];
  int v9 = [v7 canReadAllResourceTypes];
  int v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v10)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v10) == 1) {
        unint64_t v11 = [a1 _nonWildcardReadCompare:v6 to:v7];
      }
      else {
        unint64_t v11 = 2;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (unint64_t)_writeCompare:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 canWriteAllResourceTypes];
  int v9 = [v7 canWriteAllResourceTypes];
  int v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v10)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v10) == 1) {
        unint64_t v11 = [a1 _nonWildcardWriteCompare:v6 to:v7];
      }
      else {
        unint64_t v11 = 2;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (unint64_t)_nonWildcardReadCompare:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 readableResourceTypes];
  int v8 = [v6 readableResourceTypes];
  int v9 = objc_msgSend(v7, "hk_minus:", v8);
  uint64_t v10 = [v9 count];

  unint64_t v11 = [v6 readableResourceTypes];

  v12 = [v5 readableResourceTypes];

  v13 = objc_msgSend(v11, "hk_minus:", v12);
  uint64_t v14 = [v13 count];

  if (!(v10 | v14)) {
    return 0;
  }
  if (!v10 && v14) {
    return 1;
  }
  if (v14) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v10 == 0;
  }
  if (v16) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)_nonWildcardWriteCompare:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 writableResourceTypes];
  int v8 = [v6 writableResourceTypes];
  int v9 = objc_msgSend(v7, "hk_minus:", v8);
  uint64_t v10 = [v9 count];

  unint64_t v11 = [v6 writableResourceTypes];

  v12 = [v5 writableResourceTypes];

  v13 = objc_msgSend(v11, "hk_minus:", v12);
  uint64_t v14 = [v13 count];

  if (!(v10 | v14)) {
    return 0;
  }
  if (!v10 && v14) {
    return 1;
  }
  if (v14) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v10 == 0;
  }
  if (v16) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (id)scopesFromScopeString:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = objc_msgSend(v6, "hk_filter:", &__block_literal_global_12);
  int v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return v8;
}

BOOL __42__HKOAuth2ScopeSet_scopesFromScopeString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (NSSet)originalScopes
{
  return self->_originalScopes;
}

- (NSSet)readableResourceTypes
{
  return self->_readableResourceTypes;
}

- (NSSet)writableResourceTypes
{
  return self->_writableResourceTypes;
}

- (BOOL)canReadAllResourceTypes
{
  return self->_canReadAllResourceTypes;
}

- (BOOL)canWriteAllResourceTypes
{
  return self->_canWriteAllResourceTypes;
}

- (BOOL)hasAtLeastOneResourceTypeScope
{
  return self->_hasAtLeastOneResourceTypeScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writableResourceTypes, 0);
  objc_storeStrong((id *)&self->_readableResourceTypes, 0);

  objc_storeStrong((id *)&self->_originalScopes, 0);
}

@end