@interface AMSNetworkConstraints
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_networkConstraintsForMediaType:(id)a3 withArray:(id)a4;
+ (id)createBagForSubProfile;
+ (id)networkConstraintsForMediaType:(id)a3 withBag:(id)a4;
- (AMSNetworkConstraints)init;
- (BOOL)hasSizeLimitForNetworkType:(id)a3;
- (BOOL)isAnyNetworkTypeEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConstraints:(id)a3;
- (NSMutableDictionary)sizeLimits;
- (NSString)description;
- (id)_initWithStoreConstraintDictionary:(id)a3;
- (int64_t)_sizeLimitForNetworkType:(id)a3;
- (unint64_t)hash;
- (void)_disableAllNetworkTypes;
- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(id)a4;
- (void)setSizeLimits:(id)a3;
@end

@implementation AMSNetworkConstraints

- (void).cxx_destruct
{
}

void __64__AMSNetworkConstraints_networkConstraintsForMediaType_withBag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 finishWithError:a4];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 48) _networkConstraintsForMediaType:*(void *)(a1 + 40) withArray:a2];
    v7 = *(void **)(a1 + 32);
    id v9 = (id)v6;
    if (v6)
    {
      [v7 finishWithResult:v6];
    }
    else
    {
      v8 = AMSError(7, @"Media type not found", @"Could not find network constraints", 0);
      [v7 finishWithError:v8];
    }
  }
}

+ (id)_networkConstraintsForMediaType:(id)a3 withArray:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    id v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 objectForKey:@"kinds"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v13 count]
            && [v13 containsObject:v5])
          {
            v14 = v9;
            v15 = [v12 objectForKey:@"enabled"];
            if (!v15 || (objc_opt_respondsToSelector() & 1) != 0 && ([v15 BOOLValue] & 1) != 0)
            {
              v16 = objc_msgSend(v12, "objectForKey:", @"size-limits", v20);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v17 = [[AMSNetworkConstraints alloc] _initWithStoreConstraintDictionary:v16];
              }
              else {
                v17 = objc_alloc_init(AMSNetworkConstraints);
              }
              v18 = v17;
            }
            else
            {
              v18 = objc_alloc_init(AMSNetworkConstraints);

              [(AMSNetworkConstraints *)v18 _disableAllNetworkTypes];
            }

            id v9 = v18;
            id v5 = v20;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_initWithStoreConstraintDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSNetworkConstraints *)self init];
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v4;
    id v6 = v4;
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
          v12 = [v6 objectForKey:v11];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            uint64_t v13 = [v12 longLongValue];
            if (v13 == 1) {
              uint64_t v14 = -1;
            }
            else {
              uint64_t v14 = v13;
            }
            [(AMSNetworkConstraints *)v5 _setSizeLimit:v14 forNetworkType:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v4 = v16;
  }

  return v5;
}

- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(id)a4
{
  id v9 = a4;
  if (!self->_sizeLimits)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizeLimits = self->_sizeLimits;
    self->_sizeLimits = v6;
  }
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  [(NSMutableDictionary *)self->_sizeLimits setObject:v8 forKeyedSubscript:v9];
}

- (AMSNetworkConstraints)init
{
  v5.receiver = self;
  v5.super_class = (Class)AMSNetworkConstraints;
  v2 = [(AMSNetworkConstraints *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AMSNetworkConstraints *)v2 _setSizeLimit:-1 forNetworkType:@"None"];
  }
  return v3;
}

- (BOOL)hasSizeLimitForNetworkType:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sizeLimits objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)_sizeLimitForNetworkType:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sizeLimits objectForKeyedSubscript:a3];
  BOOL v4 = v3;
  if (v3) {
    int64_t v5 = [v3 longLongValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)networkConstraintsForMediaType:(id)a3 withBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(AMSMutablePromise);
  id v9 = [v7 arrayForKey:@"mobile-network-constraints"];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__AMSNetworkConstraints_networkConstraintsForMediaType_withBag___block_invoke;
  v15[3] = &unk_1E55A4D80;
  uint64_t v10 = v8;
  id v17 = v6;
  id v18 = a1;
  id v16 = v10;
  id v11 = v6;
  [v9 valueWithCompletion:v15];

  v12 = v17;
  uint64_t v13 = v10;

  return v13;
}

- (BOOL)isAnyNetworkTypeEnabled
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSNetworkConstraints *)self sizeLimits];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int64_t v5 = [(AMSNetworkConstraints *)self sizeLimits];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [(AMSNetworkConstraints *)self sizeLimits];
        v12 = [v11 objectForKeyedSubscript:v10];

        uint64_t v13 = [v12 longLongValue];
        if ((v13 & 0x8000000000000000) == 0)
        {
          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)isEqualToConstraints:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(AMSNetworkConstraints *)self sizeLimits];
  if (!v6)
  {
    v3 = [v5 sizeLimits];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v7 = [(AMSNetworkConstraints *)self sizeLimits];
  uint64_t v8 = [v5 sizeLimits];
  char v9 = [v7 isEqual:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_135 != -1) {
    dispatch_once(&_MergedGlobals_135, &__block_literal_global_99);
  }
  v2 = (void *)qword_1EB38DE78;
  return (NSString *)v2;
}

void __38__AMSNetworkConstraints_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38DE78;
  qword_1EB38DE78 = @"AMSNetworkConstraints";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DE80 != -1) {
    dispatch_once(&qword_1EB38DE80, &__block_literal_global_25_1);
  }
  v2 = (void *)qword_1EB38DE88;
  return (NSString *)v2;
}

void __45__AMSNetworkConstraints_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38DE88;
  qword_1EB38DE88 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (NSString)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = self->_sizeLimits;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = NSString;
        id v11 = [(NSMutableDictionary *)self->_sizeLimits objectForKeyedSubscript:v9];
        v12 = [v10 stringWithFormat:@"%@: %@", v9, v11];

        [v3 addObject:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v13 = [NSString alloc];
    v18.receiver = self;
    v18.super_class = (Class)AMSNetworkConstraints;
    BOOL v14 = [(AMSNetworkConstraints *)&v18 description];
    v15 = [v3 componentsJoinedByString:@", "];
    long long v16 = (void *)[v13 initWithFormat:@"%@: %@", v14, v15];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AMSNetworkConstraints;
    long long v16 = [(AMSNetworkConstraints *)&v19 description];
  }

  return (NSString *)v16;
}

- (unint64_t)hash
{
  v2 = [(AMSNetworkConstraints *)self sizeLimits];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AMSNetworkConstraints *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AMSNetworkConstraints *)self isEqualToConstraints:v4];
  }

  return v5;
}

- (void)_disableAllNetworkTypes
{
  v17[3] = *MEMORY[0x1E4F143B8];
  if (!self->_sizeLimits)
  {
    unint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizeLimits = self->_sizeLimits;
    self->_sizeLimits = v3;
  }
  v17[0] = @"None";
  v17[1] = @"2G";
  v17[2] = @"WiFi";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -1, (void)v12);
        [(NSMutableDictionary *)self->_sizeLimits setObject:v11 forKeyedSubscript:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (NSMutableDictionary)sizeLimits
{
  return self->_sizeLimits;
}

- (void)setSizeLimits:(id)a3
{
}

@end