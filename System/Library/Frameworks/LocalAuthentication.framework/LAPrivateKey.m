@interface LAPrivateKey
- (BOOL)canDecryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm;
- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm;
- (BOOL)canSignUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm;
- (LAPrivateKey)initWithKey:(id)a3;
- (LAPublicKey)publicKey;
- (id)context;
- (id)description;
- (id)identifier;
- (id)right;
- (void)dealloc;
- (void)decryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler;
- (void)exchangeKeysWithPublicKey:(NSData *)publicKey secKeyAlgorithm:(SecKeyAlgorithm)algorithm secKeyParameters:(NSDictionary *)parameters completion:(void *)handler;
- (void)setRight:(id)a3;
- (void)signData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler;
@end

@implementation LAPrivateKey

- (LAPrivateKey)initWithKey:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPrivateKey;
  v6 = [(LAPrivateKey *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    uint64_t v8 = [MEMORY[0x1E4F72F38] createDefaultSerialQueueWithIdentifier:@"LAPrivateKey"];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x1E4F30B98] sharedInstance];
    v7->_instanceID = [v10 nextInstanceIDInDomain:@"LAPrivateKey"];

    v11 = LA_LOG_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(LARightStore *)(uint64_t)v7 init];
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = LA_LOG_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LARightStore *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)LAPrivateKey;
  [(LAPrivateKey *)&v4 dealloc];
}

- (id)identifier
{
  return (id)[(LAKeyStoreKey *)self->_key identifier];
}

- (id)right
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_right);

  return WeakRetained;
}

- (void)setRight:(id)a3
{
}

- (LAPublicKey)publicKey
{
  v3 = [[LAPublicKey alloc] initWithKey:self->_key];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_right);
  [(LAPublicKey *)v3 setRight:WeakRetained];

  return v3;
}

- (void)signData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  uint64_t v8 = data;
  v9 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke;
  v13[3] = &unk_1E63C5548;
  v13[4] = self;
  objc_copyWeak(v16, &location);
  v14 = v8;
  id v15 = v9;
  v16[1] = (id)algorithm;
  v11 = v8;
  id v12 = v9;
  dispatch_async(workQueue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.sign", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_2;
  block[3] = &unk_1E63C5548;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  objc_super v4 = *(void **)(a1 + 64);
  id v6 = v3;
  v8[1] = v4;
  os_activity_apply(v2, block);

  objc_destroyWeak(v8);
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ sign started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    BOOL v7 = v6 == 0;

    if (v7)
    {
      v16 = LA_LOG_5();
      os_log_type_t v17 = LALogTypeForInternalError();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v16, v17, "The right associated with this key was deallocated", buf, 2u);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      v19 = +[LAAuthorizationError genericErrorWithMessage:@"The right associated with this key was deallocated"];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
    else
    {
      uint64_t v8 = (void *)v5[2];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 64);
      v11 = -[LAPrivateKey context]((uint64_t)v5);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_12;
      v20[3] = &unk_1E63C47A0;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      id v21 = *(id *)(a1 + 48);
      [v8 signData:v9 secKeyAlgorithm:v10 context:v11 completion:v20];

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    id v12 = LA_LOG_5();
    os_log_type_t v13 = LALogTypeForInternalError();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v12, v13, "Operation interrupted", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
}

- (id)context
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v2 = [WeakRetained context];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = LA_LOG_5();
  uint64_t v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = [NSString stringWithFormat:@"(err:%@)", v5];
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    v11 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  id v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ sign finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canSignUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  uint64_t v8 = 0;
  os_log_type_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.canSign", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__LAPrivateKey_canSignUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E63C5570;
  block[4] = self;
  void block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __44__LAPrivateKey_canSignUsingSecKeyAlgorithm___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) canSignUsingSecKeyAlgorithm:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)decryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  uint64_t v8 = data;
  os_log_type_t v9 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke;
  v13[3] = &unk_1E63C5548;
  v13[4] = self;
  objc_copyWeak(v16, &location);
  __int16 v14 = v8;
  id v15 = v9;
  v16[1] = (id)algorithm;
  char v11 = v8;
  id v12 = v9;
  dispatch_async(workQueue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.decrypt", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_2;
  block[3] = &unk_1E63C5548;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  objc_super v4 = *(void **)(a1 + 64);
  id v6 = v3;
  v8[1] = v4;
  os_activity_apply(v2, block);

  objc_destroyWeak(v8);
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ decrypt started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    BOOL v7 = v6 == 0;

    if (v7)
    {
      uint64_t v16 = LA_LOG_5();
      os_log_type_t v17 = LALogTypeForInternalError();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v16, v17, "The right associated with this key was deallocated", buf, 2u);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      v19 = +[LAAuthorizationError genericErrorWithMessage:@"The right associated with this key was deallocated"];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
    else
    {
      uint64_t v8 = (void *)v5[2];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 64);
      char v11 = -[LAPrivateKey context]((uint64_t)v5);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_22;
      v20[3] = &unk_1E63C47A0;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      id v21 = *(id *)(a1 + 48);
      [v8 decryptData:v9 secKeyAlgorithm:v10 context:v11 completion:v20];

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    id v12 = LA_LOG_5();
    os_log_type_t v13 = LALogTypeForInternalError();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v12, v13, "Operation interrupted", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = LA_LOG_5();
  uint64_t v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v11 = [NSString stringWithFormat:@"(err:%@)", v5];
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    char v11 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  id v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ decrypt finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  uint64_t v8 = 0;
  os_log_type_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.canDecrypt", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__LAPrivateKey_canDecryptUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E63C5570;
  block[4] = self;
  void block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __47__LAPrivateKey_canDecryptUsingSecKeyAlgorithm___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) canDecryptUsingSecKeyAlgorithm:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)exchangeKeysWithPublicKey:(NSData *)publicKey secKeyAlgorithm:(SecKeyAlgorithm)algorithm secKeyParameters:(NSDictionary *)parameters completion:(void *)handler
{
  uint64_t v10 = publicKey;
  char v11 = parameters;
  id v12 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke;
  block[3] = &unk_1E63C5598;
  block[4] = self;
  objc_copyWeak(v21, &location);
  v19 = v11;
  id v20 = v12;
  v21[1] = (id)algorithm;
  uint64_t v18 = v10;
  __int16 v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.exchangeKeys", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_2;
  v5[3] = &unk_1E63C5598;
  v5[4] = *(void *)(a1 + 32);
  objc_copyWeak(v9, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 40);
  objc_super v4 = *(void **)(a1 + 72);
  id v6 = v3;
  v9[1] = v4;
  id v7 = *(id *)(a1 + 48);
  os_activity_apply(v2, v5);

  objc_destroyWeak(v9);
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ exchangeKeys started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    BOOL v7 = v6 == 0;

    if (v7)
    {
      os_log_type_t v17 = LA_LOG_5();
      os_log_type_t v18 = LALogTypeForInternalError();
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v17, v18, "The right associated with this key was deallocated", buf, 2u);
      }

      uint64_t v19 = *(void *)(a1 + 56);
      id v20 = +[LAAuthorizationError genericErrorWithMessage:@"The right associated with this key was deallocated"];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
    }
    else
    {
      id v8 = (void *)v5[2];
      uint64_t v9 = *(void *)(a1 + 72);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      id v12 = -[LAPrivateKey context]((uint64_t)v5);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      id v21[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_23;
      v21[3] = &unk_1E63C47A0;
      objc_copyWeak(&v23, (id *)(a1 + 64));
      id v22 = *(id *)(a1 + 56);
      [v8 exchangeKeysWithPublicKey:v11 secKeyAlgorithm:v9 secKeyParameters:v10 context:v12 completion:v21];

      objc_destroyWeak(&v23);
    }
  }
  else
  {
    id v13 = LA_LOG_5();
    os_log_type_t v14 = LALogTypeForInternalError();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v13, v14, "Operation interrupted", buf, 2u);
    }

    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
  }
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = LA_LOG_5();
  id v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v11 = [NSString stringWithFormat:@"(err:%@)", v5];
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint64_t v11 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  uint64_t v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ exchangeKeys finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  uint64_t v8 = 0;
  os_log_type_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.canExchangeKeys", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__LAPrivateKey_canExchangeKeysUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E63C5570;
  block[4] = self;
  void block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __52__LAPrivateKey_canExchangeKeysUsingSecKeyAlgorithm___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) canExchangeKeysUsingSecKeyAlgorithm:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"LAPrivateKey[%u]", self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_destroyWeak((id *)&self->_right);
}

@end