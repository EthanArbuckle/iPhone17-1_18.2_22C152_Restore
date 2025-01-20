@interface CRCertificationOverridesClient
+ (void)_servicePerformBlock:(id)a3 errorHandler:(id)a4;
+ (void)fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:(id)a3;
+ (void)setNextSessionOverrideAirPlayFeatureStrings:(id)a3 completion:(id)a4;
@end

@implementation CRCertificationOverridesClient

+ (void)setNextSessionOverrideAirPlayFeatureStrings:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "setNextSessionOverrideAirPlayFeatureStrings: %{public}@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke;
  v11[3] = &unk_1E5E3BC18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [a1 _servicePerformBlock:v11 errorHandler:&__block_literal_global_25];
}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2;
  v8[3] = &unk_1E5E3B640;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 setNextSessionOverrideAirPlayFeatureStrings:v6 completion:v8];
}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = CarCertificationOverrideLogging();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "setNextSessionOverrideAirPlayFeatureStrings succeeded", v16, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (void)fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke;
  v6[3] = &unk_1E5E3BC68;
  id v7 = v4;
  id v5 = v4;
  [a1 _servicePerformBlock:v6 errorHandler:&__block_literal_global_26];
}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5E3BC40;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:v7];
}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "fetchNextSessionOverrideAirPlayFeatureStrings: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_24_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (void)_servicePerformBlock:(id)a3 errorHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void *))a3;
  id v6 = a4;
  uint64_t v7 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "connecting to CRCertificationOverridesService", buf, 2u);
  }

  uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327660];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.certificationOverrides.service" options:4096];
  [v9 setRemoteObjectInterface:v8];
  [v9 resume];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke;
  v14[3] = &unk_1E5E3A910;
  id v10 = v6;
  id v15 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v14];
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke_2;
    v12[3] = &unk_1E5E3A938;
    id v13 = v9;
    v5[2](v5, v11, v12);
  }
}

uint64_t __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_24_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end