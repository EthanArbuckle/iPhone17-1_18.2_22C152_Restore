@interface HDMCDiagnosticsServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDMCDiagnosticsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_triggerAnalysisForDiagnosticsWithCompletion:(id)a3;
@end

@implementation HDMCDiagnosticsServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F450C8]];

  if (v16)
  {
    v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUUID:v11 configuration:v12 client:v13 delegate:v14 profileExtension:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (HDMCDiagnosticsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDMCDiagnosticsServer;
  v15 = [(HDStandardTaskServer *)&v18 initWithUUID:a3 configuration:a4 client:v13 delegate:a6];
  if (v15)
  {
    v16 = [v13 profile];
    objc_storeWeak((id *)&v15->_profile, v16);

    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v15->_client, a5);
  }

  return v15;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F44F48];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F09A00];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)remote_triggerAnalysisForDiagnosticsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Trigger analysis for diagnostics", buf, 0xCu);
  }
  v8 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HDMCDiagnosticsServer_remote_triggerAnalysisForDiagnosticsWithCompletion___block_invoke;
  v10[3] = &unk_264750F70;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

void __76__HDMCDiagnosticsServer_remote_triggerAnalysisForDiagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) analysisManager];
  id v5 = 0;
  v3 = [v2 _analyzeWithForceIncludeCycles:1 forceAnalyzeCompleteHistory:1 error:&v5];
  id v4 = v5;

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 != 0, v4);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F35C28](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F35D40](self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end