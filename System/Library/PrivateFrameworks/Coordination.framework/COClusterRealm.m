@interface COClusterRealm
+ (BOOL)supportsSecureCoding;
+ (id)realmWithMediaGroup:(id)a3;
+ (id)realmWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClusterRealm:(id)a3;
- (BOOL)updateHandlerInvoked;
- (COClusterRealm)initWithCoder:(id)a3;
- (MGGroupQuery)query;
- (NSPredicate)predicate;
- (NSString)identifier;
- (id)_identifierForGroupResult:(id)a3;
- (id)_initWithPredicate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updateHandler;
- (unint64_t)hash;
- (void)_handleQueryResult:(id)a3 error:(id)a4;
- (void)_invokeUpdateHandler;
- (void)_setIdentifierLocked:(id)a3;
- (void)_setUpdateHandlerLocked:(id)a3;
- (void)_startQuery;
- (void)_withLock:(id)a3;
- (void)activate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COClusterRealm

- (id)_initWithPredicate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COClusterRealm;
  v5 = [(COClusterRealm *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    identifier = v5->_identifier;
    v5->_identifier = 0;

    uint64_t v8 = [v4 copy];
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v8;

    id updateHandler = v6->_updateHandler;
    v6->_id updateHandler = 0;

    v6->_updateHandlerInvoked = 0;
  }

  return v6;
}

+ (id)realmWithMediaGroup:(id)a3
{
  id v4 = [MEMORY[0x263F546D8] predicateForGroup:a3];
  v5 = (void *)[objc_alloc((Class)a1) _initWithPredicate:v4];

  return v5;
}

+ (id)realmWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithPredicate:v4];

  return v5;
}

- (COClusterRealm)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    [(COClusterRealm *)v5 allowEvaluation];
    if (v5)
    {
      v6 = [(COClusterRealm *)self _initWithPredicate:v5];
    }
    else
    {

      v6 = 0;
    }
    self = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  id v5 = [(COClusterRealm *)self predicate];
  [v4 encodeObject:v5 forKey:@"predicate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(COClusterRealm *)self predicate];
  v6 = (void *)[v4 _initWithPredicate:v5];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(COClusterRealm *)self identifier];
  v7 = [(COClusterRealm *)self predicate];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, id(%@), p(%@)>", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(COClusterRealm *)self predicate];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COClusterRealm *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(COClusterRealm *)self isEqualToClusterRealm:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToClusterRealm:(id)a3
{
  id v4 = a3;
  id v5 = [(COClusterRealm *)self predicate];
  BOOL v6 = [v4 predicate];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (void)_setIdentifierLocked:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (void)_setUpdateHandlerLocked:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  BOOL v6 = (void *)MEMORY[0x21D4BD7F0](v5);

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v6;

  self->_updateHandlerInvoked = 0;
}

- (void)activate:(id)a3
{
  id v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled])
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __27__COClusterRealm_activate___block_invoke;
    uint64_t v8 = &unk_264444338;
    v9 = self;
    id v10 = v4;
    [(COClusterRealm *)self _withLock:&v5];
    [(COClusterRealm *)self _startQuery];
  }
}

void __27__COClusterRealm_activate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = COLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 134218242;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_21D3E0000, v2, OS_LOG_TYPE_DEFAULT, "%p realm activating %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(unsigned char *)(*(void *)(a1 + 32) + 12) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;
}

- (void)_startQuery
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F546E8];
  uint64_t v4 = [(COClusterRealm *)self predicate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__COClusterRealm__startQuery__block_invoke;
  v7[3] = &unk_264444360;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = [v3 queryWithPredicate:v4 updateHandler:v7];
  query = self->_query;
  self->_query = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __29__COClusterRealm__startQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleQueryResult:v8 error:v5];
  }
}

- (void)_handleQueryResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __43__COClusterRealm__handleQueryResult_error___block_invoke;
  uint64_t v13 = &unk_264444388;
  v14 = self;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  v17 = &v18;
  [(COClusterRealm *)self _withLock:&v10];
  if (*((unsigned char *)v19 + 24)
    || ![(COClusterRealm *)self updateHandlerInvoked])
  {
    [(COClusterRealm *)self _invokeUpdateHandler];
  }

  _Block_object_dispose(&v18, 8);
}

void __43__COClusterRealm__handleQueryResult_error___block_invoke(uint64_t *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = a1 + 4;
  uint64_t v3 = [(id)a1[4] identifier];
  if (a1[5])
  {
    uint64_t v4 = COLogForCategory(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__COClusterRealm__handleQueryResult_error___block_invoke_cold_1(v2, a1 + 5, v4);
    }

    id v5 = 0;
    if (!v3)
    {
LABEL_8:
      if (!v5 || ([v5 isEqual:v3] & 1) != 0) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = [(id)a1[4] _identifierForGroupResult:a1[6]];
    if (!v3) {
      goto LABEL_8;
    }
  }
  if ([v3 isEqual:v5]) {
    goto LABEL_8;
  }
LABEL_10:
  id v6 = COLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *v2;
    int v11 = 134218498;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_21D3E0000, v6, OS_LOG_TYPE_DEFAULT, "%p realm identifier changing to %@ from %@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v8 = [v5 copy];
  uint64_t v9 = a1[4];
  uint64_t v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
LABEL_13:
}

- (id)_identifierForGroupResult:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t DigestSize = CryptoHashDescriptorGetDigestSize();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CryptoHashInit();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v25 = v4;
  id v6 = [v4 sortedArrayUsingComparator:&__block_literal_global];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v24 = self;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) identifier];
        __int16 v13 = [v12 data];
        if ([v13 length])
        {
          ++v9;
          id v14 = v13;
          [v14 bytes];
          [v14 length];
          CryptoHashUpdate();
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);

    self = v24;
    if (v9)
    {
      id v15 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:DigestSize];
      [v15 mutableBytes];
      CryptoHashFinal();
      id v16 = objc_alloc_init(NSString);
      uint64_t v17 = v15;
      uint64_t v18 = [v17 bytes];
      if (DigestSize)
      {
        v19 = (unsigned __int8 *)v18;
        do
        {
          unsigned int v20 = *v19++;
          char v21 = objc_msgSend(v16, "stringByAppendingFormat:", @"%hhX", v20);

          id v16 = v21;
          --DigestSize;
        }
        while (DigestSize);
      }
      else
      {
        char v21 = v16;
      }
      v22 = [NSString stringWithFormat:@"r-mg-%lX-%@", v9, v21];

      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v17 = COLogForCategory(7);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = self;
    _os_log_impl(&dword_21D3E0000, v17, OS_LOG_TYPE_DEFAULT, "%p received empty result, so no identifier", buf, 0xCu);
  }
  v22 = 0;
LABEL_21:

  return v22;
}

uint64_t __44__COClusterRealm__identifierForGroupResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_invokeUpdateHandler
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__28;
  uint64_t v8 = __Block_byref_object_dispose__29;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__COClusterRealm__invokeUpdateHandler__block_invoke;
  v3[3] = &unk_2644443D0;
  v3[4] = self;
  v3[5] = &v10;
  v3[6] = &v4;
  [(COClusterRealm *)self _withLock:v3];
  uint64_t v2 = v11[5];
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v5[5]);
  }
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

void __38__COClusterRealm__invokeUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updateHandler];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = 1;
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (MGGroupQuery)query
{
  return self->_query;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)updateHandlerInvoked
{
  return self->_updateHandlerInvoked;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __43__COClusterRealm__handleQueryResult_error___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21D3E0000, log, OS_LOG_TYPE_ERROR, "%p realm error querying groups %@", (uint8_t *)&v5, 0x16u);
}

@end