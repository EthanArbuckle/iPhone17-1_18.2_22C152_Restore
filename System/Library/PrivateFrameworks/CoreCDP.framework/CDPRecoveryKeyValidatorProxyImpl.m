@interface CDPRecoveryKeyValidatorProxyImpl
- (BOOL)confirmRecoveryKey:(id)a3 error:(id *)a4;
- (CDPRecoveryKeyValidatorProxyImpl)initWithRemoteObject:(id)a3;
- (id)generateRecoveryKeyWithError:(id *)a3;
- (void)confirmRecoveryKey:(id)a3 completion:(id)a4;
- (void)generateRecoveryKey:(id)a3;
@end

@implementation CDPRecoveryKeyValidatorProxyImpl

- (CDPRecoveryKeyValidatorProxyImpl)initWithRemoteObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeyValidatorProxyImpl;
  v6 = [(CDPRecoveryKeyValidatorProxyImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validator, a3);
  }

  return v7;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  validator = self->_validator;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke;
  v9[3] = &unk_2643171D0;
  id v10 = v6;
  id v8 = v6;
  [(CDPRecoveryKeyValidator *)validator confirmRecoveryKey:a3 completion:v9];
}

void __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke_2;
  block[3] = &unk_2643176D8;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)generateRecoveryKey:(id)a3
{
  id v4 = a3;
  validator = self->_validator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke;
  v7[3] = &unk_2643177A0;
  id v8 = v4;
  id v6 = v4;
  [(CDPRecoveryKeyValidator *)validator generateRecoveryKey:v7];
}

void __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke_2;
  block[3] = &unk_264317380;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)generateRecoveryKeyWithError:(id *)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  validator = self->_validator;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKeyWithError___block_invoke;
  v10[3] = &unk_2643177C8;
  id v12 = &v20;
  id v13 = &v14;
  id v7 = v5;
  id v11 = v7;
  [(CDPRecoveryKeyValidator *)validator generateRecoveryKey:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __65__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)confirmRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  validator = self->_validator;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_error___block_invoke;
  v12[3] = &unk_2643177F0;
  uint64_t v14 = &v22;
  v15 = &v16;
  uint64_t v9 = v7;
  id v13 = v9;
  [(CDPRecoveryKeyValidator *)validator confirmRecoveryKey:v6 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v10 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __61__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end