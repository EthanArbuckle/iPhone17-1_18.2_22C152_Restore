@interface CSVoiceTriggerAlwaysOnProcessor
- (CSVoiceTriggerAlwaysOnProcessor)init;
- (void)_setBuiltInRTModelDictionary:(id)a3;
- (void)disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:(id)a3;
- (void)enableVoiceTriggerOnAlwaysOnProcessorWithAsset:(id)a3 completion:(id)a4;
@end

@implementation CSVoiceTriggerAlwaysOnProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aopSwitchGroup, 0);
}

- (void)_setBuiltInRTModelDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = CSLogCategoryVT;
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[CSVoiceTriggerAlwaysOnProcessor _setBuiltInRTModelDictionary:]";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s setting rtModel dictionary : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [MEMORY[0x1E4FB4FF0] setCurrentBuiltInRTModelDictionary:v3];
}

- (void)disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke;
  v7[3] = &unk_1E62012B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[CSUserSessionActiveMonitor sharedInstance];
  char v3 = [v2 isUserActive];

  if (v3)
  {
    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
    id v4 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling VoiceTrigger in AOP", buf, 0xCu);
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
    int v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke_21;
    v10[3] = &unk_1E61FFA60;
    id v6 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    [v5 enableVoiceTriggerListening:0 completionBlock:v10];
  }
  else
  {
    __int16 v7 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Current user doesn't have owner ship of AOP, it cannot disable AOP VoiceTrigger", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:507 userInfo:0];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      __int16 v7 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to disable AOP VoiceTrigger", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _setBuiltInRTModelDictionary:0];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)enableVoiceTriggerOnAlwaysOnProcessorWithAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke;
  block[3] = &unk_1E61FFFB8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke(id *a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = +[CSUserSessionActiveMonitor sharedInstance];
  char v3 = [v2 isUserActive];

  id v4 = CSLogCategoryVT;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:c"
                                      "ompletion:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating VoiceTrigger Configuration", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v5 = [a1[4] RTModelWithFallbackLanguage:@"xx-XX"];
    id v6 = [v5 builtInRTModelDictionary];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__5756;
    v55 = __Block_byref_object_dispose__5757;
    id v56 = 0;
    id v7 = [MEMORY[0x1E4FB4FF0] requestCurrentBuiltInRTModelDictionary];
    int v8 = [v7 isEqualToDictionary:v6];
    id v9 = CSLogCategoryVT;
    BOOL v10 = os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)v46 = 136315650;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        __int16 v48 = 2114;
        v49 = v6;
        __int16 v50 = 2114;
        v51 = v7;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s RT model %{public}@ already set (current RT model : %{public}@, skip updating", v46, 0x20u);
      }
LABEL_33:
      v32 = (void (**)(id, void))a1[6];
      if (v32) {
        v32[2](v32, *(void *)(*((void *)&buf + 1) + 40));
      }
      goto LABEL_41;
    }
    if (v10)
    {
      *(_DWORD *)v46 = 136315650;
      v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      __int16 v48 = 2114;
      v49 = v7;
      __int16 v50 = 2114;
      v51 = v6;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Going to replace current RT model %{public}@ with : %{public}@", v46, 0x20u);
    }
    id v12 = [v5 modelData];

    if (v12)
    {
      v13 = [CSKeywordAnalyzerNDEAPI alloc];
      id v14 = [v5 modelData];
      v15 = [(CSKeywordAnalyzerNDEAPI *)v13 initWithBlob:v14];

      v16 = CSLogCategoryVT;
      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v46 = 136315138;
          v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
          _os_log_fault_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_FAULT, "%s Unable to send model to AOP since it failed to initialize NDEAPI", v46, 0xCu);
        }
        v33 = (void (**)(id, CSOSTransaction *))a1[6];
        if (!v33) {
          goto LABEL_41;
        }
        v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:508 userInfo:0];
        v33[2](v33, v22);
        goto LABEL_40;
      }
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Successfully validate model with NDEAPI", v46, 0xCu);
      }
    }
    dispatch_group_wait(*((dispatch_group_t *)a1[5] + 1), 0xFFFFFFFFFFFFFFFFLL);
    if (!v6)
    {
      [a1[5] _setBuiltInRTModelDictionary:0];
      uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:503 userInfo:0];
      v30 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v29;

      v31 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_error_impl(&dword_1BA1A5000, v31, OS_LOG_TYPE_ERROR, "%s RTModel doesn't exist, fail to enable VoiceTrigger in AOP", v46, 0xCu);
      }
      goto LABEL_33;
    }
    if (v7
      || (+[CSFPreferences sharedPreferences],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 checkAOPConfigurationWatchDog],
          v17,
          !v18))
    {
      v23 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger in AOP", v46, 0xCu);
      }
      dispatch_group_enter(*((dispatch_group_t *)a1[5] + 1));
      v24 = [[CSOSTransaction alloc] initWithDescription:@"AOP Configuration Transaction"];
      v25 = +[CSFPreferences sharedPreferences];
      [v25 setAOPConfigurationWatchDog];

      if (+[CSUtils isExclaveHardware])
      {
        v26 = CSLogCategoryVT;
        if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136315138;
          v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
          _os_log_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Directly enable AOP without configuring model", v46, 0xCu);
        }
        v27 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_19;
        v36[3] = &unk_1E61FFA38;
        id v28 = a1[5];
        p_long long buf = &buf;
        v36[4] = v28;
        v22 = v24;
        v37 = v22;
        id v38 = a1[6];
        [v27 enableVoiceTriggerListening:1 completionBlock:v36];
      }
      else
      {
        v34 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
        objc_initWeak((id *)v46, v34);

        v35 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_17;
        v40[3] = &unk_1E61FFA10;
        objc_copyWeak(&v45, (id *)v46);
        v40[4] = a1[5];
        v44 = &buf;
        id v41 = v6;
        v22 = v24;
        v42 = v22;
        id v43 = a1[6];
        [v35 updateVoiceTriggerConfiguration:v41 completionBlock:v40];

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)v46);
      }
    }
    else
    {
      v19 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_fault_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_FAULT, "%s Unable to enable AOP, due to AOP Enable WatchDog", v46, 0xCu);
      }
      v20 = +[CSFPreferences sharedPreferences];
      [v20 clearAOPConfigurationWatchDog];

      v21 = (void (**)(id, CSOSTransaction *))a1[6];
      if (!v21) {
        goto LABEL_41;
      }
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:510 userInfo:0];
      v21[2](v21, v22);
    }
LABEL_40:

LABEL_41:
    _Block_object_dispose(&buf, 8);

    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:com"
                                    "pletion:]_block_invoke";
    _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Current user doesn't have owner ship of AOP, it cannot enable AOP VoiceTrigger", (uint8_t *)&buf, 0xCu);
  }
  id v11 = (void (**)(id, void *))a1[6];
  if (v11)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:507 userInfo:0];
    v11[2](v11, v5);
LABEL_42:
  }
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    [*(id *)(a1 + 32) _setBuiltInRTModelDictionary:0];
    uint64_t v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      v17 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to update AOP VoiceTrigger configuration", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
    id v6 = +[CSFPreferences sharedPreferences];
    [v6 clearAOPConfigurationWatchDog];

    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_2;
    v10[3] = &unk_1E61FF9E8;
    uint64_t v15 = *(void *)(a1 + 64);
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = 0;
    id v12 = v9;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [WeakRetained enableVoiceTriggerListening:1 completionBlock:v10];
  }
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_19(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to enable AOP VoiceTrigger", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 8));
  id v6 = +[CSFPreferences sharedPreferences];
  [v6 clearAOPConfigurationWatchDog];

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(a1[7] + 8) + 40));
  }
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 _setBuiltInRTModelDictionary:0];
    uint64_t v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke_2";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to enable AOP VoiceTrigger", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
  }
  else
  {
    [v4 _setBuiltInRTModelDictionary:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  id v6 = +[CSFPreferences sharedPreferences];
  [v6 clearAOPConfigurationWatchDog];

  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
}

- (CSVoiceTriggerAlwaysOnProcessor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CSVoiceTriggerAlwaysOnProcessor;
    id v4 = [(CSVoiceTriggerAlwaysOnProcessor *)&v11 init];
    if (v4)
    {
      id v5 = [(id)objc_opt_class() description];
      dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v6;

      dispatch_group_t v8 = dispatch_group_create();
      aopSwitchGroup = v4->_aopSwitchGroup;
      v4->_aopSwitchGroup = (OS_dispatch_group *)v8;
    }
    self = v4;
    id v3 = self;
  }

  return v3;
}

@end