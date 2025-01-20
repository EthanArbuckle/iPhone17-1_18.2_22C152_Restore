@interface LAPublicKey
- (BOOL)canEncryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm;
- (BOOL)canVerifyUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm;
- (LAPublicKey)initWithKey:(id)a3;
- (id)description;
- (id)identifier;
- (id)right;
- (void)dealloc;
- (void)encryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler;
- (void)exportBytesWithCompletion:(void *)handler;
- (void)setRight:(id)a3;
- (void)verifyData:(NSData *)signedData signature:(NSData *)signature secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler;
@end

@implementation LAPublicKey

- (LAPublicKey)initWithKey:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPublicKey;
  v6 = [(LAPublicKey *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    uint64_t v8 = [MEMORY[0x1E4F72F38] createDefaultSerialQueueWithIdentifier:@"LAPublicKey"];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x1E4F30B98] sharedInstance];
    v7->_instanceID = [v10 nextInstanceIDInDomain:@"LAPublicKey"];

    v11 = LA_LOG_4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(LARightStore *)(uint64_t)v7 init];
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = LA_LOG_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LARightStore *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)LAPublicKey;
  [(LAPublicKey *)&v4 dealloc];
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

- (void)exportBytesWithCompletion:(void *)handler
{
  objc_super v4 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke;
  v7[3] = &unk_1E63C40A0;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.exportBytes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke_2;
  block[3] = &unk_1E63C40A0;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ exportBytes started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke_8;
    v11[3] = &unk_1E63C47A0;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = *(id *)(a1 + 40);
    [v6 exportBytesWithCompletion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    v7 = LA_LOG_4();
    os_log_type_t v8 = LALogTypeForInternalError();
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v7, v8, "Operation interrupted", buf, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    v10 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = LA_LOG_4();
  os_log_type_t v8 = v7;
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
  uint64_t v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ exportBytes finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)encryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  os_log_type_t v8 = data;
  os_log_type_t v9 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke;
  v13[3] = &unk_1E63C5548;
  v13[4] = self;
  objc_copyWeak(v16, &location);
  __int16 v14 = v8;
  id v15 = v9;
  v16[1] = (id)algorithm;
  v11 = v8;
  id v12 = v9;
  dispatch_async(workQueue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.encrypt", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_2;
  block[3] = &unk_1E63C5548;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = *(void **)(a1 + 64);
  id v6 = v3;
  v8[1] = v4;
  os_activity_apply(v2, block);

  objc_destroyWeak(v8);
}

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ encrypt started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 2);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_18;
    v13[3] = &unk_1E63C47A0;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    id v14 = *(id *)(a1 + 48);
    [v6 encryptData:v7 secKeyAlgorithm:v8 completion:v13];

    objc_destroyWeak(&v15);
  }
  else
  {
    os_log_type_t v9 = LA_LOG_4();
    os_log_type_t v10 = LALogTypeForInternalError();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v9, v10, "Operation interrupted", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = LA_LOG_4();
  uint64_t v8 = v7;
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
  id v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ encrypt finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  uint64_t v8 = 0;
  os_log_type_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.canEncrypt", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LAPublicKey_canEncryptUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E63C5570;
  block[4] = self;
  void block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __46__LAPublicKey_canEncryptUsingSecKeyAlgorithm___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) canEncryptUsingSecKeyAlgorithm:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)verifyData:(NSData *)signedData signature:(NSData *)signature secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  uint64_t v10 = signedData;
  char v11 = signature;
  id v12 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke;
  block[3] = &unk_1E63C5598;
  block[4] = self;
  objc_copyWeak(v21, &location);
  uint64_t v18 = v10;
  v19 = v11;
  id v20 = v12;
  v21[1] = (id)algorithm;
  __int16 v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.verify", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_2;
  v5[3] = &unk_1E63C5598;
  v5[4] = *(void *)(a1 + 32);
  objc_copyWeak(v9, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  id v4 = *(void **)(a1 + 72);
  id v7 = v3;
  v9[1] = v4;
  os_activity_apply(v2, v5);

  objc_destroyWeak(v9);
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ verify started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 2);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 72);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_19;
    v14[3] = &unk_1E63C3E38;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    id v15 = *(id *)(a1 + 56);
    [v6 verifyData:v7 signature:v8 secKeyAlgorithm:v9 completion:v14];

    objc_destroyWeak(&v16);
  }
  else
  {
    uint64_t v10 = LA_LOG_4();
    os_log_type_t v11 = LALogTypeForInternalError();
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v10, v11, "Operation interrupted", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LA_LOG_4();
  id v5 = v4;
  if (v3)
  {
    os_log_type_t v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = [NSString stringWithFormat:@"(err:%@)", v3];
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    uint64_t v8 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v10 = WeakRetained;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_impl(&dword_1BED06000, v5, v6, "%{public}@ verify finished %{public}@", buf, 0x16u);
  if (v3) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.canVerify", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__LAPublicKey_canVerifyUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E63C5570;
  block[4] = self;
  void block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __45__LAPublicKey_canVerifyUsingSecKeyAlgorithm___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) canVerifyUsingSecKeyAlgorithm:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"LAPublicKey[%u]", self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_destroyWeak((id *)&self->_right);
}

@end