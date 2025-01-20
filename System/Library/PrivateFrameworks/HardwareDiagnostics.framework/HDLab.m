@interface HDLab
+ (HDLab)defaultLab;
- (HDLab)init;
- (NSDictionary)availableAnalyses;
- (NSDictionary)availableDiagnostics;
- (NSDictionary)availableExperiments;
- (id)analysisWithName:(id)a3;
- (id)diagnosticWithName:(id)a3;
- (id)experimentWithName:(id)a3;
- (void)addAnalysisWithName:(id)a3 block:(id)a4;
- (void)addDiagnosticWithName:(id)a3 block:(id)a4;
- (void)addDiagnosticWithName:(id)a3 experimentName:(id)a4 analysisName:(id)a5 block:(id)a6;
- (void)addDiagnosticWithName:(id)a3 summary:(id)a4 experimentName:(id)a5 analysisName:(id)a6;
- (void)addExperimentWithName:(id)a3 block:(id)a4;
@end

@implementation HDLab

+ (HDLab)defaultLab
{
  if (defaultLab_onceToken != -1) {
    dispatch_once(&defaultLab_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultLab_lab;
  return (HDLab *)v2;
}

uint64_t __19__HDLab_defaultLab__block_invoke()
{
  defaultLab_lab = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (HDLab)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDLab;
  v2 = [(HDLab *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    experiments = v2->_experiments;
    v2->_experiments = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    analyses = v2->_analyses;
    v2->_analyses = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    diagnostics = v2->_diagnostics;
    v2->_diagnostics = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)addExperimentWithName:(id)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)v8->_experiments objectForKeyedSubscript:v6];

  if (v9)
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Will replace already existing experiment for name %@";
LABEL_6:
      _os_log_impl(&dword_237D4F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Adding experiment with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x237E2EA00](v7);
  [(NSMutableDictionary *)v8->_experiments setObject:v12 forKeyedSubscript:v6];

  objc_sync_exit(v8);
}

- (void)addAnalysisWithName:(id)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)v8->_analyses objectForKeyedSubscript:v6];

  if (v9)
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Will replace already existing analysis for name %@";
LABEL_6:
      _os_log_impl(&dword_237D4F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Adding analysis with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x237E2EA00](v7);
  [(NSMutableDictionary *)v8->_analyses setObject:v12 forKeyedSubscript:v6];

  objc_sync_exit(v8);
}

- (void)addDiagnosticWithName:(id)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)v8->_diagnostics objectForKeyedSubscript:v6];

  if (v9)
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Will replace already existing diagnostic for name %@";
LABEL_6:
      _os_log_impl(&dword_237D4F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    objc_super v10 = HDDefaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      v11 = "Adding diagnostic with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x237E2EA00](v7);
  [(NSMutableDictionary *)v8->_diagnostics setObject:v12 forKeyedSubscript:v6];

  objc_sync_exit(v8);
}

- (void)addDiagnosticWithName:(id)a3 summary:(id)a4 experimentName:(id)a5 analysisName:(id)a6
{
  id v10 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__HDLab_addDiagnosticWithName_summary_experimentName_analysisName___block_invoke;
  v16[3] = &unk_264D00030;
  id v17 = v10;
  id v11 = v10;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = (void *)MEMORY[0x237E2EA00](v16);
  [(HDLab *)self addDiagnosticWithName:v14 experimentName:v13 analysisName:v12 block:v15];
}

HDSimpleDiagnostic *__67__HDLab_addDiagnosticWithName_summary_experimentName_analysisName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[HDSimpleDiagnostic alloc] initWithExperiment:v6 analysis:v5];

  [(HDSimpleDiagnostic *)v7 setSummary:*(void *)(a1 + 32)];
  return v7;
}

- (void)addDiagnosticWithName:(id)a3 experimentName:(id)a4 analysisName:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke;
  v22 = &unk_264D00058;
  objc_copyWeak(&v27, &location);
  id v14 = v11;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  v18 = (void *)MEMORY[0x237E2EA00](&v19);
  -[HDLab addDiagnosticWithName:block:](self, "addDiagnosticWithName:block:", v15, v18, v19, v20, v21, v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

id __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained experimentWithName:*(void *)(a1 + 32)];
  if (v3)
  {
    v4 = [WeakRetained analysisWithName:*(void *)(a1 + 48)];
    if (v4)
    {
      id v5 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_10;
    }
    id v6 = HDDefaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_2();
    }
  }
  else
  {
    v4 = HDDefaultLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_1();
    }
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)experimentWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_experiments objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    id v7 = v6[2](v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)analysisWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_analyses objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    id v7 = v6[2](v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)diagnosticWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_diagnostics objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    id v7 = v6[2](v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSDictionary)availableExperiments
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2->_experiments copy];
  objc_sync_exit(v2);

  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HDLab_availableExperiments__block_invoke;
  v7[3] = &unk_264D00080;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __29__HDLab_availableExperiments__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t))(a3 + 16);
  id v6 = a2;
  v5(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (NSDictionary)availableAnalyses
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2->_analyses copy];
  objc_sync_exit(v2);

  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__HDLab_availableAnalyses__block_invoke;
  v7[3] = &unk_264D000A8;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __26__HDLab_availableAnalyses__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t))(a3 + 16);
  id v6 = a2;
  v5(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (NSDictionary)availableDiagnostics
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2->_diagnostics copy];
  objc_sync_exit(v2);

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HDLab_availableDiagnostics__block_invoke;
  v7[3] = &unk_264D000D0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __29__HDLab_availableDiagnostics__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = (*(void (**)(uint64_t))(a3 + 16))(a3);
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_analyses, 0);
  objc_storeStrong((id *)&self->_experiments, 0);
}

void __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237D4F000, v0, v1, "Cannot find experiment %@ for creating diagnostic %@");
}

void __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237D4F000, v0, v1, "Cannot find analysis %@ for creating diagnostic %@");
}

@end