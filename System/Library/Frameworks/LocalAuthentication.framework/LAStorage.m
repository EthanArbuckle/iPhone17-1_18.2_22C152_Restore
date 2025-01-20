@interface LAStorage
+ (id)objectDescription:(id)a3;
+ (id)secureDomainStorage;
+ (unsigned)newInstanceId;
- (BOOL)BOOLForKey:(int64_t)a3;
- (BOOL)BOOLForKey:(int64_t)a3 error:(id *)a4;
- (BOOL)setBool:(BOOL)a3 forKey:(int64_t)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
- (LAContext)authenticationContext;
- (LASecureStorageService)remoteObjectProxy;
- (LAStorage)initWithDomain:(int64_t)a3 authenticationContext:(id)a4;
- (NSXPCConnection)connection;
- (__SecAccessControl)accessControl;
- (__SecAccessControl)accessControlForKey:(int64_t)a3 error:(id *)a4;
- (id)dataForKey:(int64_t)a3;
- (id)dataForKey:(int64_t)a3 error:(id *)a4;
- (id)description;
- (id)exchangeData:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
- (id)numberForKey:(int64_t)a3;
- (id)numberForKey:(int64_t)a3 error:(id *)a4;
- (int64_t)domain;
- (unsigned)instanceId;
- (void)BOOLForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)_bootstrapServiceWithAuthenticationPolicy:(int64_t)a3 proxyBlock:(id)a4 completionHandler:(id)a5;
- (void)_callProxyBlock:(id)a3 authenticationPolicy:(int64_t)a4 completionHandler:(id)a5;
- (void)_class:(Class)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)_connectToEndpoint:(id)a3;
- (void)_resetConnection;
- (void)dataForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)exchangeData:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)numberForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)objectForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)removeObjectForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)setAccessControl:(__SecAccessControl *)a3;
- (void)setBool:(BOOL)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)setObject:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation LAStorage

+ (id)secureDomainStorage
{
  v2 = [[LAStorage alloc] initWithDomain:0 authenticationContext:0];

  return v2;
}

- (LAStorage)initWithDomain:(int64_t)a3 authenticationContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAStorage;
  v8 = [(LAStorage *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_domain = a3;
    objc_storeStrong((id *)&v8->_authenticationContext, a4);
    v9->_instanceId = +[LAStorage newInstanceId];
    v10 = LA_LOG_3();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1BED06000, v10, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(LAStorage *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)LAStorage;
  [(LAStorage *)&v4 dealloc];
}

- (id)description
{
  v3 = [(LAStorage *)self authenticationContext];

  objc_super v4 = NSString;
  uint64_t v5 = [(LAStorage *)self instanceId];
  uint64_t v6 = v5;
  if (v3)
  {
    id v7 = [(LAStorage *)self authenticationContext];
    v8 = [v4 stringWithFormat:@"LAStorage[%u] bound with %@", v6, v7];
  }
  else
  {
    v8 = objc_msgSend(v4, "stringWithFormat:", @"LAStorage[%u]", v5);
  }

  return v8;
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter;
}

+ (id)objectDescription:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 description];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(NSString, "stringWithFormat:", @"data[%d]", objc_msgSend(v3, "length"));
      }
      else {
      uint64_t v4 = [NSString stringWithFormat:@"unsupported object: %@", v3];
      }
    }
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = +[LAStorage objectDescription:v8];
  v11 = [(LAStorage *)self description];
  objc_super v12 = LA_LOG_3();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v36 = a4;
    __int16 v37 = 2114;
    v38 = v10;
    __int16 v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "Setting key %d with %{public}@ on %{public}@", buf, 0x1Cu);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke;
  v30[3] = &unk_1E63C4EE0;
  int64_t v34 = a4;
  id v13 = v10;
  id v31 = v13;
  id v14 = v11;
  id v32 = v14;
  id v15 = v9;
  id v33 = v15;
  v16 = (void (**)(void, void, void))MEMORY[0x1C189BE50](v30);
  v17 = (objc_class *)[MEMORY[0x1E4F72FA8] classForKey:a4];
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v21 = [MEMORY[0x1E4F30B90] storageErrorWithCode:1 message:@"Expected NSData or NSNumber."];
        ((void (**)(void, void, id))v16)[2](v16, 0, v21);
        goto LABEL_11;
      }
      buf[0] = [v8 BOOLValue];
      id v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:1];
    }
    v24 = v18;
    uint64_t v25 = [MEMORY[0x1E4F72FA8] policyForKey:a4 operation:2 value:v8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke_24;
    v26[3] = &unk_1E63C4F08;
    id v27 = v24;
    v28 = self;
    int64_t v29 = a4;
    id v21 = v24;
    [(LAStorage *)self _bootstrapServiceWithAuthenticationPolicy:v25 proxyBlock:v26 completionHandler:v16];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F30B90];
    v20 = NSString;
    NSStringFromClass(v17);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v20 stringWithFormat:@"%@ value expected", v21];
    v23 = [v19 storageErrorWithCode:1 message:v22];
    ((void (**)(void, void, void *))v16)[2](v16, 0, v23);
  }
LABEL_11:
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = LA_LOG_3();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[7];
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      v11[0] = 67109634;
      v11[1] = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_DEFAULT, "Key %d set successfully with %{public}@ on %{public}@", (uint8_t *)v11, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 accessControl];
  if (v9)
  {
    [*(id *)(a1 + 40) accessControl];
    id v13 = (id)SecAccessControlCopyData();
  }
  else
  {
    id v13 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = [*(id *)(a1 + 40) authenticationContext];
  __int16 v12 = [v11 uuid];
  [v8 setObject:v5 acl:v13 forKey:v10 contextUUID:v12 completionHandler:v7];

  if (v9)
  {
  }
}

- (void)objectForKey:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(LAStorage *)self description];
  id v8 = LA_LOG_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "Querying key %d on %{public}@", buf, 0x12u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke;
  v14[3] = &unk_1E63C4F30;
  id v16 = v6;
  int64_t v17 = a3;
  id v15 = v7;
  id v9 = v6;
  id v10 = v7;
  v11 = (void *)MEMORY[0x1C189BE50](v14);
  uint64_t v12 = [MEMORY[0x1E4F72FA8] policyForKey:a3 operation:1 value:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke_26;
  v13[3] = &unk_1E63C4F58;
  v13[4] = self;
  v13[5] = a3;
  [(LAStorage *)self _bootstrapServiceWithAuthenticationPolicy:v12 proxyBlock:v13 completionHandler:v11];
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = LA_LOG_3();
  id v8 = v7;
  if (v5 || !a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      id v10 = +[LAStorage objectDescription:v5];
      uint64_t v11 = a1[4];
      v12[0] = 67109634;
      v12[1] = v9;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "Query of key %d returned %{public}@ on %{public}@", (uint8_t *)v12, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 authenticationContext];
  id v8 = [v9 uuid];
  [v7 objectForKey:v4 contextUUID:v8 completionHandler:v6];
}

- (void)removeObjectForKey:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(LAStorage *)self description];
  id v8 = LA_LOG_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "Removing key %d on %{public}@", buf, 0x12u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke;
  v14[3] = &unk_1E63C4F30;
  id v16 = v6;
  int64_t v17 = a3;
  id v15 = v7;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = (void *)MEMORY[0x1C189BE50](v14);
  uint64_t v12 = [MEMORY[0x1E4F72FA8] policyForKey:a3 operation:3 value:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_27;
  v13[3] = &unk_1E63C4F58;
  v13[4] = self;
  v13[5] = a3;
  [(LAStorage *)self _bootstrapServiceWithAuthenticationPolicy:v12 proxyBlock:v13 completionHandler:v11];
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LA_LOG_3();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[4];
      v10[0] = 67109378;
      v10[1] = v8;
      __int16 v11 = 2114;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_DEFAULT, "Removed key %d on %{public}@", (uint8_t *)v10, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 authenticationContext];
  uint64_t v8 = [v9 uuid];
  [v7 removeObjectForKey:v4 contextUUID:v8 completionHandler:v6];
}

- (void)exchangeData:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[LAStorage objectDescription:v8];
  __int16 v11 = [(LAStorage *)self description];
  uint64_t v12 = LA_LOG_3();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = a4;
    __int16 v28 = 2114;
    int64_t v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "Exchanging data with key %d with %{public}@ on %{public}@", (uint8_t *)&buf, 0x1Cu);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke;
  v22[3] = &unk_1E63C4EE0;
  int64_t v26 = a4;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = v9;
  id v25 = v15;
  id v16 = (void (**)(void, void, void))MEMORY[0x1C189BE50](v22);
  if ([MEMORY[0x1E4F72FA8] isKeyAvailableForDataExchange:a4])
  {
    uint64_t v17 = [MEMORY[0x1E4F72FA8] policyForKey:a4 operation:4 value:v8];
    objc_initWeak(&buf, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_31;
    v19[3] = &unk_1E63C4F80;
    objc_copyWeak(v21, &buf);
    id v20 = v8;
    v21[1] = (id)a4;
    [(LAStorage *)self _bootstrapServiceWithAuthenticationPolicy:v17 proxyBlock:v19 completionHandler:v16];

    objc_destroyWeak(v21);
    objc_destroyWeak(&buf);
  }
  else
  {
    id v18 = [MEMORY[0x1E4F30B90] storageErrorWithCode:4 message:@"key does not support data exchange"];
    ((void (**)(void, void, void *))v16)[2](v16, 0, v18);
  }
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LA_LOG_3();
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[7];
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      v12[0] = 67109634;
      v12[1] = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "Key %d data exchanged successfully with %{public}@ on %{public}@", (uint8_t *)v12, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained accessControl];
    if (v9)
    {
      [v7 accessControl];
      uint64_t v10 = (void *)SecAccessControlCopyData();
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = [v7 authenticationContext];
    __int16 v13 = [v12 uuid];
    [v14 setObject:v8 acl:v10 forKey:v11 contextUUID:v13 completionHandler:v5];

    if (v9) {
  }
    }
}

- (__SecAccessControl)accessControlForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy__3;
  id v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__3;
  id v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__LAStorage_accessControlForKey_error___block_invoke;
  v9[3] = &unk_1E63C4F58;
  v9[4] = self;
  v9[5] = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__LAStorage_accessControlForKey_error___block_invoke_2;
  v8[3] = &unk_1E63C4D40;
  v8[4] = &v16;
  v8[5] = &v10;
  [(LAStorage *)self _bootstrapServiceWithAuthenticationPolicy:0 proxyBlock:v9 completionHandler:v8];
  if (!v17[5])
  {
    id v5 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = (__SecAccessControl *)SecAccessControlCreateFromData();
  if (v5)
  {
    id v6 = (void *)v11[5];
    v11[5] = 0;
  }
  if (a4) {
LABEL_5:
  }
    *a4 = (id) v11[5];
LABEL_6:
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __39__LAStorage_accessControlForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 authenticationContext];
  uint64_t v8 = [v9 uuid];
  [v7 aclForKey:v4 contextUUID:v8 completionHandler:v6];
}

void __39__LAStorage_accessControlForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)setBool:(BOOL)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = [v8 numberWithBool:v6];
  [(LAStorage *)self setObject:v10 forKey:a4 completionHandler:v9];
}

- (void)BOOLForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__LAStorage_BOOLForKey_completionHandler___block_invoke;
  v9[3] = &unk_1E63C4FA8;
  id v10 = v6;
  id v8 = v6;
  [(LAStorage *)self _class:v7 forKey:a3 completionHandler:v9];
}

void __42__LAStorage_BOOLForKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (void)dataForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(LAStorage *)self _class:objc_opt_class() forKey:a3 completionHandler:v6];
}

- (void)_class:(Class)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __45__LAStorage__class_forKey_completionHandler___block_invoke;
  v10[3] = &unk_1E63C4FD0;
  id v11 = v8;
  Class v12 = a3;
  id v9 = v8;
  [(LAStorage *)self objectForKey:a4 completionHandler:v10];
}

void __45__LAStorage__class_forKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v7 = *(void *)(a1 + 32);
    if (isKindOfClass)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F30B90] storageErrorWithCode:2 message:@"Internal error - unexpected data type" suberror:0];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)setBool:(BOOL)a3 forKey:(int64_t)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  Class v12 = __Block_byref_object_copy__3;
  __int16 v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__LAStorage_setBool_forKey_error___block_invoke;
  v8[3] = &unk_1E63C4FF8;
  v8[4] = &v9;
  [(LAStorage *)self setBool:a3 forKey:a4 completionHandler:v8];
  if (a5) {
    *a5 = (id) v10[5];
  }
  BOOL v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __34__LAStorage_setBool_forKey_error___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)setData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _DWORD v11[2] = __34__LAStorage_setData_forKey_error___block_invoke;
  v11[3] = &unk_1E63C4FF8;
  v11[4] = &v12;
  [(LAStorage *)self setData:v8 forKey:a4 completionHandler:v11];
  if (a5) {
    *a5 = (id) v13[5];
  }
  BOOL v9 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __34__LAStorage_setData_forKey_error___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)BOOLForKey:(int64_t)a3
{
  return [(LAStorage *)self BOOLForKey:a3 error:0];
}

- (BOOL)BOOLForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__LAStorage_BOOLForKey_error___block_invoke;
  v7[3] = &unk_1E63C4D68;
  v7[4] = &v14;
  v7[5] = &v8;
  [(LAStorage *)self BOOLForKey:a3 completionHandler:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __30__LAStorage_BOOLForKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)dataForKey:(int64_t)a3
{
  return [(LAStorage *)self dataForKey:a3 error:0];
}

- (id)dataForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__LAStorage_dataForKey_error___block_invoke;
  v7[3] = &unk_1E63C4D90;
  v7[4] = &v14;
  v7[5] = &v8;
  [(LAStorage *)self dataForKey:a3 completionHandler:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __30__LAStorage_dataForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)numberForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(LAStorage *)self _class:objc_opt_class() forKey:a3 completionHandler:v6];
}

- (id)numberForKey:(int64_t)a3
{
  return [(LAStorage *)self numberForKey:a3 error:0];
}

- (id)numberForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__LAStorage_numberForKey_error___block_invoke;
  v7[3] = &unk_1E63C5020;
  v7[4] = &v14;
  v7[5] = &v8;
  [(LAStorage *)self numberForKey:a3 completionHandler:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __32__LAStorage_numberForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)exchangeData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _DWORD v11[2] = __39__LAStorage_exchangeData_forKey_error___block_invoke;
  v11[3] = &unk_1E63C4D90;
  v11[4] = &v18;
  void v11[5] = &v12;
  [(LAStorage *)self exchangeData:v8 forKey:a4 completionHandler:v11];
  if (a5) {
    *a5 = (id) v13[5];
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

void __39__LAStorage_exchangeData_forKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)_bootstrapServiceWithAuthenticationPolicy:(int64_t)a3 proxyBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(LAStorage *)self remoteObjectProxy];

  if (v10)
  {
    [(LAStorage *)self _callProxyBlock:v8 authenticationPolicy:a3 completionHandler:v9];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _DWORD v11[2] = __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke;
    v11[3] = &unk_1E63C5048;
    v11[4] = self;
    id v12 = v8;
    int64_t v14 = a3;
    id v13 = v9;
    [(LAStorage *)self _bootstrapServiceType:@"kLAServiceTypeSecureStorage" completionHandler:v11];
  }
}

uint64_t __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _connectToEndpoint:a2];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _callProxyBlock:v4 authenticationPolicy:v5 completionHandler:v6];
  }
  else
  {
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

- (void)_connectToEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
  connection = self->_connection;
  self->_connection = v5;

  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19F62F8];
  id v8 = [(LAStorage *)self connection];
  [v8 setRemoteObjectInterface:v7];

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__LAStorage__connectToEndpoint___block_invoke;
  v19[3] = &unk_1E63C4890;
  objc_copyWeak(&v20, &location);
  id v9 = [(LAStorage *)self connection];
  [v9 setInterruptionHandler:v19];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __32__LAStorage__connectToEndpoint___block_invoke_2;
  v17[3] = &unk_1E63C4890;
  objc_copyWeak(&v18, &location);
  uint64_t v10 = [(LAStorage *)self connection];
  [v10 setInvalidationHandler:v17];

  id v11 = [(LAStorage *)self connection];
  [v11 resume];

  id v12 = [(LAStorage *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__LAStorage__connectToEndpoint___block_invoke_3;
  v15[3] = &unk_1E63C5070;
  objc_copyWeak(&v16, &location);
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __32__LAStorage__connectToEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

void __32__LAStorage__connectToEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

void __32__LAStorage__connectToEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LA_LOG_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

- (void)_resetConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = 0;
}

- (void)_bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LAStorage *)self authenticationContext];
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = objc_opt_new();
  }

  uint64_t v10 = [(LAStorage *)self authenticationContext];
  id v11 = (void *)v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke;
  v15[3] = &unk_1E63C5098;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v9;
  }
  id v16 = v9;
  id v17 = v6;
  id v13 = v9;
  id v14 = v6;
  [v12 bootstrapServiceType:v7 completionHandler:v15];
}

uint64_t __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)_callProxyBlock:(id)a3 authenticationPolicy:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(LAStorage *)self remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke;
  v14[3] = &unk_1E63C50E8;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  int64_t v17 = a4;
  id v11 = (void (*)(void *, void *, void *))v8[2];
  id v12 = v8;
  id v13 = v9;
  v11(v12, v10, v14);
}

void __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5
    && [MEMORY[0x1E4F30B90] storageError:v6 hasCode:0]
    && ([*(id *)(a1 + 32) authenticationContext],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v8 = *(void *)(a1 + 56), v7, v8))
  {
    id v9 = [*(id *)(a1 + 32) authenticationContext];
    uint64_t v10 = [v9 uiDelegate];

    if (v10)
    {
      if (LA_LOG_INTERACTIVE_once != -1) {
        dispatch_once(&LA_LOG_INTERACTIVE_once, &__block_literal_global_205);
      }
      id v11 = LA_LOG_INTERACTIVE_log;
      if (os_log_type_enabled((os_log_t)LA_LOG_INTERACTIVE_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 56);
        *(_DWORD *)id buf = 138543618;
        uint64_t v22 = v12;
        __int16 v23 = 1024;
        int v24 = v13;
        _os_log_impl(&dword_1BED06000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will invoke authentication using policy %d", buf, 0x12u);
      }
      id v14 = [*(id *)(a1 + 32) authenticationContext];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_110;
      v18[3] = &unk_1E63C50C0;
      v18[4] = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 56);
      id v19 = *(id *)(a1 + 48);
      id v20 = *(id *)(a1 + 40);
      [v14 evaluatePolicy:v15 options:0 reply:v18];
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 40);
      int64_t v17 = [MEMORY[0x1E4F30B90] storageErrorWithCode:0 message:@"Policy can't be satisfied without UI delegate."];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_110(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _callProxyBlock:*(void *)(a1 + 40) authenticationPolicy:0 completionHandler:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (int64_t)domain
{
  return self->_domain;
}

- (__SecAccessControl)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(__SecAccessControl *)a3
{
  self->_accessControl = a3;
}

- (LAContext)authenticationContext
{
  return self->_authenticationContext;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (LASecureStorageService)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1BED06000, v0, v1, "Failed to set key %d with %{public}@ on %{public}@: %{public}@");
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1BED06000, v0, OS_LOG_TYPE_ERROR, "Failed to query key %d on %{public}@", v1, 0x12u);
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1BED06000, v0, OS_LOG_TYPE_ERROR, "Failed to remove key %d on %{public}@", v1, 0x12u);
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1BED06000, v0, v1, "Failed to exchange data for key %d with %{public}@ on %{public}@: %{public}@");
}

void __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = 138543618;
  id v7 = WeakRetained;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BED06000, a3, OS_LOG_TYPE_ERROR, "%{public}@ has encountered XPC error on remote proxy: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end