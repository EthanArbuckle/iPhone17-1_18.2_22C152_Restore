@interface AFEnablementFlowConfigurationProvider
+ (BOOL)_shouldAllowRandomVoiceSelectionForEnablementFlow:(int64_t)a3;
+ (id)_createConfigurationForParameters:(id)a3;
+ (void)_emitEnablementFlowLoggingForConfigurationParameters:(id)a3 didEnable:(BOOL)a4;
- (AFEnablementFlowConfigurationProvider)init;
- (AFSettingsConnection)settingsConnection;
- (id)_storedRecognitionLanguageCode;
- (id)_storedVoiceInfo;
- (void)_resolveIfNewUserWithParameters:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5;
- (void)_resolveVoiceSelection:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5;
- (void)configurationForEnablementFlow:(int64_t)a3 recognitionLanguageCodes:(id)a4 completion:(id)a5;
- (void)setSettingsConnection:(id)a3;
@end

@implementation AFEnablementFlowConfigurationProvider

- (void).cxx_destruct
{
}

- (void)setSettingsConnection:(id)a3
{
}

- (AFSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (id)_storedVoiceInfo
{
  v2 = +[AFPreferences sharedPreferences];
  v3 = [v2 _outputVoiceWithFallback:0];

  return v3;
}

- (id)_storedRecognitionLanguageCode
{
  v2 = +[AFPreferences sharedPreferences];
  v3 = [v2 _languageCodeWithFallback:0];

  return v3;
}

- (void)_resolveVoiceSelection:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32 = (void (**)(id, void *))a5;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__35034;
  v49 = __Block_byref_object_dispose__35035;
  id v30 = v7;
  id v50 = v30;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[AFEnablementFlowConfigurationProvider _resolveVoiceSelection:forRecognitionLanguages:completion:]";
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v30);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v14 = AFOutputVoiceLanguageForRecognitionLanguage(v13);
        v15 = (void *)MEMORY[0x1E4F1C978];
        v16 = +[AFVoiceInfo allVoicesForSiriSessionLanguage:v14];
        v17 = [v15 arrayWithArray:v16];

        v18 = (void *)MEMORY[0x1E4F28F60];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke;
        v39[3] = &unk_1E592A2A0;
        id v19 = v14;
        id v40 = v19;
        v20 = [v18 predicateWithBlock:v39];
        v21 = [v17 filteredArrayUsingPredicate:v20];

        v22 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v52 = "-[AFEnablementFlowConfigurationProvider _resolveVoiceSelection:forRecognitionLanguages:completion:]";
          __int16 v53 = 2112;
          v54 = v21;
          __int16 v55 = 2112;
          id v56 = v19;
          __int16 v57 = 2112;
          v58 = v13;
          _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s Output voices %@ for default output language %@ for recognition language %@", buf, 0x2Au);
        }
        if (v21) {
          [v34 addObjectsFromArray:v21];
        }
        if ((unint64_t)[v21 count] >= 2)
        {
          uint64_t v23 = [(id)v46[5] mutatedCopyWithMutator:&__block_literal_global_82];
          v24 = (void *)v46[5];
          v46[5] = v23;
        }
        v25 = (void *)v46[5];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_2;
        v35[3] = &unk_1E592A2C8;
        v38 = &v45;
        id v26 = v21;
        id v36 = v26;
        v37 = v13;
        uint64_t v27 = [v25 mutatedCopyWithMutator:v35];
        v28 = (void *)v46[5];
        v46[5] = v27;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v10);
  }

  v29 = +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:v46[5]];
  v32[2](v32, v29);

  _Block_object_dispose(&v45, 8);
}

uint64_t __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 languageCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v5 = a2;
  v6 = [v4 outputVoiceCountForRecognitionLanguage];
  id v8 = [v3 dictionaryWithDictionary:v6];

  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v8 setObject:v7 forKey:*(void *)(a1 + 40)];

  [v5 setOutputVoiceCountForRecognitionLanguage:v8];
}

uint64_t __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_80(uint64_t a1, void *a2)
{
  return [a2 setRecognitionLanguageWithMultipleOutputVoicesExists:1];
}

- (void)_resolveIfNewUserWithParameters:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__35034;
  v35 = __Block_byref_object_dispose__35035;
  id v11 = v8;
  id v36 = v11;
  uint64_t v12 = [v11 mutatedCopyWithMutator:&__block_literal_global_35047];
  v13 = (void *)v32[5];
  v32[5] = v12;

  if ([(id)v32[5] enablementFlow] == 9)
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
      _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s Tinker Enablement flow, treat as new user", buf, 0xCu);
    }
    uint64_t v15 = [(id)v32[5] mutatedCopyWithMutator:&__block_literal_global_60_35049];
    v16 = (void *)v32[5];
    v32[5] = v15;

    [(AFEnablementFlowConfigurationProvider *)self _resolveVoiceSelection:v32[5] forRecognitionLanguages:v9 completion:v10];
  }
  else
  {
    uint64_t v17 = [(AFEnablementFlowConfigurationProvider *)self _storedRecognitionLanguageCode];
    uint64_t v18 = [(AFEnablementFlowConfigurationProvider *)self _storedVoiceInfo];
    if (v17 | v18)
    {
      id v19 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
        __int16 v39 = 2112;
        uint64_t v40 = v17;
        __int16 v41 = 2112;
        uint64_t v42 = v18;
        _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_INFO, "%s Not a new user. Language Stored: %@, outputVoice stored: %@", buf, 0x20u);
      }
      uint64_t v20 = [(id)v32[5] mutatedCopyWithMutator:&__block_literal_global_63_35051];
      v21 = (void *)v32[5];
      v32[5] = v20;

      v22 = +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:v32[5]];
      v10[2](v10, v22);
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
        _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
      }
      settingsConnection = self->_settingsConnection;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_65;
      v25[3] = &unk_1E592A278;
      objc_copyWeak(&v29, &location);
      v28 = &v31;
      uint64_t v27 = v10;
      id v26 = v9;
      [(AFSettingsConnection *)settingsConnection hasEverSetLanguageCodeWithCompletion:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  _Block_object_dispose(&v31, 8);
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_65(uint64_t a1, int a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]_block_invoke";
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s hasEverSetLanguageCode: %d, error:%@", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutatedCopyWithMutator:&__block_literal_global_68_35055];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!WeakRetained)
  {
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutatedCopyWithMutator:&__block_literal_global_70];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

LABEL_8:
    uint64_t v20 = *(void *)(a1 + 40);
    v21 = +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    goto LABEL_9;
  }
  if (!v5)
  {
    if (!a2)
    {
      uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutatedCopyWithMutator:&__block_literal_global_73_35056];
      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      [WeakRetained _resolveVoiceSelection:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forRecognitionLanguages:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_3;
  v25[3] = &unk_1E592A250;
  id v26 = v5;
  uint64_t v12 = [v11 mutatedCopyWithMutator:v25];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(a1 + 40);
  v16 = +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

LABEL_9:
}

uint64_t __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setUserStatusFetchError:*(void *)(a1 + 32)];
}

uint64_t __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setNewUser:1];
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AFError errorWithCode:41];
  [v2 setUserStatusFetchError:v3];
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_66(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 now];
  [v3 setDateEndedResolvingUserStatus:v4];
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_61(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 now];
  [v3 setDateEndedResolvingUserStatus:v4];
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_58(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v3 = [v2 now];
  [v4 setDateEndedResolvingUserStatus:v3];

  [v4 setNewUser:1];
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 now];
  [v3 setDateStartedResolvingUserStatus:v4];
}

- (void)configurationForEnablementFlow:(int64_t)a3 recognitionLanguageCodes:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [AFEnablementConfigurationProviderParameters alloc];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionary];
  LOBYTE(v12) = 0;
  uint64_t v13 = [(AFEnablementConfigurationProviderParameters *)v10 initWithEnablementFlow:a3 newUser:0 userStatusFetchError:0 dateStartedResolvingUserStatus:0 dateEndedResolvingUserStatus:0 experiment:0 experimentFetchError:0 dateStartedResolvingExperiment:0 dateEndedResolvingExperiment:0 outputVoiceCountForRecognitionLanguage:v11 recognitionLanguageWithMultipleOutputVoicesExists:v12];

  [(AFEnablementFlowConfigurationProvider *)self _resolveIfNewUserWithParameters:v13 forRecognitionLanguages:v9 completion:v8];
}

- (AFEnablementFlowConfigurationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFEnablementFlowConfigurationProvider;
  id v2 = [(AFEnablementFlowConfigurationProvider *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(AFSettingsConnection);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;
  }
  return v2;
}

+ (BOOL)_shouldAllowRandomVoiceSelectionForEnablementFlow:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

+ (void)_emitEnablementFlowLoggingForConfigurationParameters:(id)a3 didEnable:(BOOL)a4
{
  id v4 = a3;
  id v5 = [v4 userStatusFetchError];
  [v4 enablementFlow];
  id v8 = v4;
  id v6 = v5;
  id v7 = v4;
  AnalyticsSendEventLazy();
}

id __104__AFEnablementFlowConfigurationProvider__emitEnablementFlowLoggingForConfigurationParameters_didEnable___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 > 9) {
    id v4 = @"(unknown)";
  }
  else {
    id v4 = off_1E5929458[v3];
  }
  id v5 = v4;
  [v2 setObject:v5 forKey:@"flow"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "newUser"));
  [v2 setObject:v6 forKey:@"newUser"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v2 setObject:v7 forKey:@"didEnable"];

  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v8, "code"));
    [v2 setObject:v9 forKey:@"errorCode"];
  }
  return v2;
}

+ (id)_createConfigurationForParameters:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "+[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:]";
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v5 = [v3 userStatusFetchError];
  if (v5)
  {

LABEL_9:
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  id v6 = [v3 experimentFetchError];

  if (v6 || ![v3 recognitionLanguageWithMultipleOutputVoicesExists]) {
    goto LABEL_9;
  }
  if ([v3 newUser])
  {
    uint64_t v7 = +[AFEnablementFlowConfigurationProvider _shouldAllowRandomVoiceSelectionForEnablementFlow:](AFEnablementFlowConfigurationProvider, "_shouldAllowRandomVoiceSelectionForEnablementFlow:", [v3 enablementFlow]);
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v15 = +[AFPreferences sharedPreferences];
    int v16 = [v15 shouldSkipIntelligenceVoiceSelectionUpsell];

    uint64_t v7 = v16 ^ 1u;
    uint64_t v8 = v7;
  }
LABEL_10:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__AFEnablementFlowConfigurationProvider__createConfigurationForParameters___block_invoke;
  v17[3] = &unk_1E592A720;
  id v18 = v3;
  id v9 = v3;
  uint64_t v10 = (void *)MEMORY[0x19F3A50D0](v17);
  id v11 = [AFEnablementConfiguration alloc];
  uint64_t v12 = [v9 outputVoiceCountForRecognitionLanguage];
  uint64_t v13 = [(AFEnablementConfiguration *)v11 initWithRequiresVoiceSelection:v8 voiceSelectionAllowsChooseForMe:v7 voiceCountForRecognitionLanguage:v12 completionLoggingBlock:v10];

  return v13;
}

uint64_t __75__AFEnablementFlowConfigurationProvider__createConfigurationForParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AFEnablementFlowConfigurationProvider _emitEnablementFlowLoggingForConfigurationParameters:*(void *)(a1 + 32) didEnable:a2];
}

@end