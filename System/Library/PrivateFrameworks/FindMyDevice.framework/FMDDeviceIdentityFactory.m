@interface FMDDeviceIdentityFactory
- (void)baaIdentityAttestationForSigningRequest:(id)a3 completion:(id)a4;
- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4;
@end

@implementation FMDDeviceIdentityFactory

- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: identityForPasscodeActivationUnlockWithContext:completion:", buf, 2u);
  }

  v8 = +[FMNSXPCConnectionCache sharedCache];
  v9 = +[FMNSXPCConnectionConfiguration identityConfiguration];
  v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_3;
  v15[3] = &unk_1E689BE70;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 identityForPasscodeActivationUnlockWithContext:v6 completion:v15];
}

void __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_cold_1(a2, v4);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
  }
}

uint64_t __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)baaIdentityAttestationForSigningRequest:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[FMDDeviceIdentityFactory baaIdentityAttestationForSigningRequest:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  v8 = +[FMNSXPCConnectionCache sharedCache];
  v9 = +[FMNSXPCConnectionConfiguration identityConfiguration];
  v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_5;
  v15[3] = &unk_1E689BE98;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 baaIdentityAttestationForSigningRequest:v6 completion:v15];
}

void __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_cold_1(a2, v4);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
  }
}

uint64_t __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "XPC error for identityForPasscodeActivationUnlockWithContext:completion: %li", (uint8_t *)&v2, 0xCu);
}

void __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[FMDDeviceIdentityFactory baaIdentityAttestationForSigningRequest:completion:]_block_invoke";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "XPC error for %s %li", (uint8_t *)&v2, 0x16u);
}

@end