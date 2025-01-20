@interface CSBenchmarkService
+ (BOOL)disableBenchmarkService;
+ (BOOL)enableBenchmarkService;
+ (id)createBenchamrkXPCConnection;
+ (void)benchmarkOnDeviceCompilationCleanup:(id)a3;
+ (void)pingpong:(id)a3 completion:(id)a4;
+ (void)runAudioInjectionOnly:(id)a3 completion:(id)a4;
+ (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6;
+ (void)runNCModelWithConfig:(id)a3 completion:(id)a4;
+ (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6;
+ (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6;
+ (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5;
+ (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6;
@end

@implementation CSBenchmarkService

+ (BOOL)disableBenchmarkService
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 enableBenchmarkService:0];

  v4 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v5 = [v4 enableProgrammableAudioInjection:0];

  return v3 & v5;
}

+ (BOOL)enableBenchmarkService
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 enableBenchmarkService:1];

  v4 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v5 = [v4 enableProgrammableAudioInjection:1];

  return v3 & v5;
}

+ (void)benchmarkOnDeviceCompilationCleanup:(id)a3
{
  id v3 = a3;
  v4 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke;
  v13[3] = &unk_1E658D1C0;
  id v5 = v3;
  id v14 = v5;
  [v4 setInterruptionHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_72;
  v11[3] = &unk_1E658D1C0;
  id v6 = v5;
  id v12 = v6;
  [v4 setInvalidationHandler:v11];
  [v4 resume];
  v7 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_75];
  if (v7)
  {
    v8 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_78];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_79;
    v9[3] = &unk_1E658C960;
    id v10 = v6;
    [v8 benchmarkOnDeviceCompilationCleanup:v9];
  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_72(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runNCModelWithConfig:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke;
  v16[3] = &unk_1E658D1C0;
  id v8 = v6;
  id v17 = v8;
  [v7 setInterruptionHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_64;
  v14[3] = &unk_1E658D1C0;
  id v9 = v8;
  id v15 = v9;
  [v7 setInvalidationHandler:v14];
  [v7 resume];
  uint64_t v10 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_67];
  if (v10)
  {
    v11 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_70];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_71;
    v12[3] = &unk_1E658C960;
    id v13 = v9;
    [v11 runNCModelWithConfig:v5 completion:v12];
  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_64(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runAudioInjectionOnly:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke;
  v16[3] = &unk_1E658D1C0;
  id v8 = v6;
  id v17 = v8;
  [v7 setInterruptionHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_56;
  v14[3] = &unk_1E658D1C0;
  id v9 = v8;
  id v15 = v9;
  [v7 setInvalidationHandler:v14];
  [v7 resume];
  uint64_t v10 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_59];
  if (v10)
  {
    v11 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_62];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_63;
    v12[3] = &unk_1E6589810;
    id v13 = v9;
    [v11 runAudioInjectionOnly:v5 completion:v12];
  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_56(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_63(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);
  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke;
  v22[3] = &unk_1E658D1C0;
  id v14 = v12;
  id v23 = v14;
  [v13 setInterruptionHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_48;
  v20[3] = &unk_1E658D1C0;
  id v15 = v14;
  id v21 = v15;
  [v13 setInvalidationHandler:v20];
  [v13 resume];
  v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_51];
  if (v16)
  {
    id v17 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_54];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_55;
    v18[3] = &unk_1E6589810;
    id v19 = v15;
    [v17 runNovDetectorWithConfig:v9 configRoot:v10 withUrl:v11 completion:v18];
  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_48(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_55(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  __int16 v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);
  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke;
  v22[3] = &unk_1E658D1C0;
  id v14 = v12;
  id v23 = v14;
  [v13 setInterruptionHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_40;
  v20[3] = &unk_1E658D1C0;
  id v15 = v14;
  id v21 = v15;
  [v13 setInvalidationHandler:v20];
  [v13 resume];
  v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_43];
  if (v16)
  {
    id v17 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_46];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_47;
    v18[3] = &unk_1E658C960;
    id v19 = v15;
    [v17 runODLDModelWithConfig:v9 locale:v10 inputText:v11 completion:v18];
  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_40(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke;
  v19[3] = &unk_1E658D1C0;
  id v11 = v9;
  id v20 = v11;
  [v10 setInterruptionHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_32;
  v17[3] = &unk_1E658D1C0;
  id v12 = v11;
  id v18 = v12;
  [v10 setInvalidationHandler:v17];
  [v10 resume];
  id v13 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_35];
  if (v13)
  {
    id v14 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_39;
    v15[3] = &unk_1E6589810;
    id v16 = v12;
    [v14 runOSDAnalyzerWithConfig:v7 withUrl:v8 completion:v15];
  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_32(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_39(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);
  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke;
  v22[3] = &unk_1E658D1C0;
  id v14 = v12;
  id v23 = v14;
  [v13 setInterruptionHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_24;
  v20[3] = &unk_1E658D1C0;
  id v15 = v14;
  id v21 = v15;
  [v13 setInvalidationHandler:v20];
  [v13 resume];
  id v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  if (v16)
  {
    id v17 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_31;
    v18[3] = &unk_1E6589810;
    id v19 = v15;
    [v17 runVTSecondPassModelWithConfig:v9 locale:v10 withUrl:v11 completion:v18];
  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  __int16 v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);
  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke;
  v22[3] = &unk_1E658D1C0;
  id v14 = v12;
  id v23 = v14;
  [v13 setInterruptionHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_16;
  v20[3] = &unk_1E658D1C0;
  id v15 = v14;
  id v21 = v15;
  [v13 setInvalidationHandler:v20];
  [v13 resume];
  id v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2262];
  if (v16)
  {
    id v17 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_22;
    v18[3] = &unk_1E6589810;
    id v19 = v15;
    [v17 runLstmPhsModelWithConfig:v9 withUrl:v10 withConfigRoot:v11 completion:v18];
  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2003 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2004 userInfo:0];
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);
  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_22(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  __int16 v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);
  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"Error in making synchronous call of CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    int v5 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"First attempt with Error in connecting with CSBenchmarkService: ";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }
}

+ (void)pingpong:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = +[CSBenchmarkService createBenchamrkXPCConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke;
  v15[3] = &unk_1E658D1C0;
  id v6 = v4;
  id v16 = v6;
  [v5 setInterruptionHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke_9;
  v13[3] = &unk_1E658D1C0;
  id v7 = v6;
  id v14 = v7;
  [v5 setInvalidationHandler:v13];
  [v5 resume];
  __int16 v8 = [v5 remoteObjectProxy];
  if (!v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "+[CSBenchmarkService pingpong:completion:]";
      _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    goto LABEL_6;
  }
  id v9 = [v5 remoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke_13;
  v11[3] = &unk_1E658D1E8;
  id v12 = v7;
  [v9 pingpong:@"TEST" completion:v11];

LABEL_6:
}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[CSBenchmarkService pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[CSBenchmarkService pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)createBenchamrkXPCConnection
{
  CSLogInitIfNeeded();
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.benchmark.xpc" options:0];
  uint64_t v3 = BenchmarkXPCGetInterface();
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end