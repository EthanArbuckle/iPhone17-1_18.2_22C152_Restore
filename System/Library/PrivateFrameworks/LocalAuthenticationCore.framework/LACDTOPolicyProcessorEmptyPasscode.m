@interface LACDTOPolicyProcessorEmptyPasscode
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOPolicyProcessorEmptyPasscode)initWithCredentialStore:(id)a3 device:(id)a4;
- (void)_processAndEvaluateRequest:(id)a3 completion:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOPolicyProcessorEmptyPasscode

- (LACDTOPolicyProcessorEmptyPasscode)initWithCredentialStore:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOPolicyProcessorEmptyPasscode;
  v9 = [(LACDTOPolicyProcessorEmptyPasscode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (BOOL)canProcessRequest:(id)a3
{
  v3 = [a3 options];
  v4 = [NSNumber numberWithInteger:1081];
  v5 = [v3 objectForKey:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = LACLogDTOProcessor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_2653B5F10;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v10;
  id v14 = v12;
  [(LACDTOPolicyProcessorEmptyPasscode *)self _processAndEvaluateRequest:v8 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogDTOProcessor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processAndEvaluateRequest:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (![(LACDTOPolicyProcessorEmptyPasscode *)self canProcessRequest:v6])
  {
LABEL_6:
    id v14 = +[LACEvaluationResult resultWithNext:v6];
    v7[2](v7, v14);

    goto LABEL_7;
  }
  if (!-[LACDTODeviceInfoProvider hasPasscodeSetForUser:](self->_device, "hasPasscodeSetForUser:", [v6 evaluationUserId]))
  {
    id v15 = [v6 options];
    v16 = [NSNumber numberWithInteger:1000];
    v17 = [v15 objectForKey:v16];
    int v18 = [v17 BOOLValue];

    if (!v18)
    {
      objc_initWeak((id *)buf, self);
      store = self->_store;
      v20 = +[LACSecureData secureDataWithData:0];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke;
      v27[3] = &unk_2653B5F38;
      id v21 = v6;
      id v28 = v21;
      v22 = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke((uint64_t)v27);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2;
      v23[3] = &unk_2653B5F60;
      objc_copyWeak(&v26, (id *)buf);
      v25 = v7;
      id v24 = v21;
      [(LACCredentialStore *)store setValue:v20 forCredential:v22 completion:v23];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v9 = [v6 options];
  id v10 = (void *)[v8 initWithDictionary:v9];

  v11 = LACLogDTOProcessor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = self;
    __int16 v31 = 1024;
    int v32 = 1081;
    __int16 v33 = 1024;
    int v34 = [v6 evaluationUserId];
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %d option because user %d has passcode", buf, 0x18u);
  }

  id v12 = [NSNumber numberWithInteger:1081];
  [v10 setObject:0 forKeyedSubscript:v12];

  [v6 updateOptions:v10];
  v13 = +[LACEvaluationResult resultWithNext:v6];
  v7[2](v7, v13);

LABEL_7:
}

LACMutableCredentialRequest *__76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LACMutableCredentialRequest);
  [(LACMutableCredentialRequest *)v2 setCredential:-1];
  id v3 = [*(id *)(a1 + 32) externalizedContext];
  [(LACMutableCredentialRequest *)v2 setExternalizedContext:v3];

  -[LACMutableCredentialRequest setUserID:](v2, "setUserID:", [*(id *)(a1 + 32) evaluationUserId]);
  return v2;
}

void __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = LACLogDTOProcessor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      int v9 = 138543618;
      id v10 = WeakRetained;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v6 = +[LACEvaluationResult resultWithFailure:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = +[LACEvaluationResult resultWithNext:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end