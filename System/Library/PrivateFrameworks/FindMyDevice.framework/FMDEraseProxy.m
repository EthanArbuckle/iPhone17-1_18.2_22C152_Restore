@interface FMDEraseProxy
- (void)eraseDeviceWithOptions:(id)a3 completion:(id)a4;
@end

@implementation FMDEraseProxy

- (void)eraseDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[FMNSXPCConnectionCache sharedCache];
  v8 = +[FMNSXPCConnectionConfiguration eraseDeviceServiceConfiguration];
  v9 = [v7 resumeConnectionWithConfiguration:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke;
  v17[3] = &unk_1E689BE48;
  id v10 = v5;
  id v18 = v10;
  [v9 addFailureBlock:v17];
  v11 = [v9 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3;
  v14[3] = &unk_1E689C088;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  [v11 eraseDeviceWithOptions:v6 completion:v14];
}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_cold_1(a2, v4);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "eraseMacDeviceWithCompletion completed", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "XPC error for eraseDeviceWithCompletion: %li", (uint8_t *)&v2, 0xCu);
}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "eraseMacDeviceWithCompletion encountered an error : %@", (uint8_t *)&v2, 0xCu);
}

@end