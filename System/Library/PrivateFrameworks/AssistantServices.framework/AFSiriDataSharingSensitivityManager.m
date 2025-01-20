@interface AFSiriDataSharingSensitivityManager
+ (id)shared;
- (AFSiriDataSharingSensitivityManager)init;
- (BOOL)_isOptedOutOfMTEWithSupportsUOD:(BOOL)a3;
- (BOOL)_isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:(id)a3;
- (BOOL)_isRequestSensitiveForUnknownPolicy;
- (BOOL)_isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5;
- (BOOL)_isTrialConfigEnabledWithNamespaceId:(int)a3 factorName:(id)a4;
- (BOOL)_isTrialConfigForLogRedactionForMessagesEnabled;
- (BOOL)isOptedOutOfMTE;
- (BOOL)isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5;
- (void)_registerUpdateHandler;
@end

@implementation AFSiriDataSharingSensitivityManager

- (void).cxx_destruct
{
}

- (BOOL)_isOptedOutOfMTEWithSupportsUOD:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    if (v3) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    v7 = (void *)MEMORY[0x1E4F28ED0];
    v8 = v4;
    v9 = [v7 numberWithBool:v3];
    int v10 = 136315650;
    v11 = "-[AFSiriDataSharingSensitivityManager _isOptedOutOfMTEWithSupportsUOD:]";
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s #MTEOptOut Should drop MTE: %@ with supportsUOD: %@", (uint8_t *)&v10, 0x20u);
  }
  return v3;
}

- (BOOL)_isTrialConfigForLogRedactionForMessagesEnabled
{
  return [(AFSiriDataSharingSensitivityManager *)self _isTrialConfigEnabledWithNamespaceId:1570 factorName:@"messages_log_redaction_enablement_status"];
}

- (BOOL)_isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:(id)a3
{
  return 0;
}

- (BOOL)_isRequestSensitiveForUnknownPolicy
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[AFSiriDataSharingSensitivityManager _isRequestSensitiveForUnknownPolicy]";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s Unknown sensitivity policy used. This should not happen! Assuming non-sensitive.", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (BOOL)_isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5
{
  id v8 = a5;
  if (a4 != 1)
  {
    switch(a3)
    {
      case 0:
        BOOL v9 = [(AFSiriDataSharingSensitivityManager *)self _isRequestSensitiveForUnknownPolicy];
        goto LABEL_9;
      case 3:
        BOOL v9 = [(AFSiriDataSharingSensitivityManager *)self _isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:v8];
        goto LABEL_9;
      case 2:
        BOOL v9 = [(AFSiriDataSharingSensitivityManager *)self _isRequestSensitiveForSensitiveDomainPolicy];
LABEL_9:
        BOOL v10 = v9;
        goto LABEL_10;
    }
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_isTrialConfigEnabledWithNamespaceId:(int)a3 factorName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [getTRINamespaceClass() namespaceNameFromId:v4];
  id v8 = [(TRIClient *)self->_client levelForFactor:v6 withNamespaceName:v7];
  BOOL v9 = v8;
  if (v8)
  {
    BOOL v10 = (void *)[v8 BOOLeanValue];
    v11 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = (void *)MEMORY[0x1E4F28ED0];
      v13 = v11;
      __int16 v14 = [v12 numberWithBool:v10];
      int v17 = 136315650;
      v18 = "-[AFSiriDataSharingSensitivityManager _isTrialConfigEnabledWithNamespaceId:factorName:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s TRILevel %@: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    v15 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[AFSiriDataSharingSensitivityManager _isTrialConfigEnabledWithNamespaceId:factorName:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s TRILevel not found for factor: %@. Assuming feature disabled.", (uint8_t *)&v17, 0x16u);
    }
    v23 = @"Factor";
    v24[0] = v6;
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    AnalyticsSendEvent();

    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (void)_registerUpdateHandler
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFSiriDataSharingSensitivityManager _registerUpdateHandler]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Registering update handler", buf, 0xCu);
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __61__AFSiriDataSharingSensitivityManager__registerUpdateHandler__block_invoke;
  v11 = &unk_1E592A880;
  objc_copyWeak(&v12, &location);
  uint64_t v4 = (void *)MEMORY[0x19F3A50D0](&v8);
  client = self->_client;
  id v6 = objc_msgSend(getTRINamespaceClass(), "namespaceNameFromId:", 1571, v8, v9, v10, v11);
  id v7 = (id)[(TRIClient *)client addUpdateHandlerForNamespaceName:v6 usingBlock:v4];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__AFSiriDataSharingSensitivityManager__registerUpdateHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    id v6 = [v3 namespaceName];
    int v9 = 136315394;
    BOOL v10 = "-[AFSiriDataSharingSensitivityManager _registerUpdateHandler]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s New update for %@", (uint8_t *)&v9, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[1] refresh];
  }
}

- (BOOL)isOptedOutOfMTE
{
  uint64_t v3 = AFDeviceSupportsSiriUOD();
  return [(AFSiriDataSharingSensitivityManager *)self _isOptedOutOfMTEWithSupportsUOD:v3];
}

- (BOOL)isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (+[AFFeatureFlags isOptOutLogRedactionEnabled])
  {
    BOOL v9 = [(AFSiriDataSharingSensitivityManager *)self _isRequestSensitiveWithPolicy:a3 optInStatus:a4 siriLanguageCode:v8];
    BOOL v10 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      if (v9) {
        __int16 v11 = @"YES";
      }
      else {
        __int16 v11 = @"NO";
      }
      if ((unint64_t)(a3 - 1) > 2) {
        id v12 = @"AFSiriDataSharingSensitivityPolicyUnknown";
      }
      else {
        id v12 = off_1E592A8B8[a3 - 1];
      }
      __int16 v14 = v10;
      if ((unint64_t)a4 > 3) {
        v15 = @"(unknown)";
      }
      else {
        v15 = off_1E592B870[a4];
      }
      uint64_t v16 = v15;
      int v18 = 136316162;
      __int16 v19 = "-[AFSiriDataSharingSensitivityManager isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:]";
      __int16 v20 = 2112;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s Request is sensitive:%@ with policy:%@, optInStatus:%@, siriLanguage:%@", (uint8_t *)&v18, 0x34u);
    }
  }
  else
  {
    uint64_t v13 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      __int16 v19 = "-[AFSiriDataSharingSensitivityManager isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:]";
      _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureFlag opt_out_log_redaction disabled. Skipping.", (uint8_t *)&v18, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (AFSiriDataSharingSensitivityManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AFSiriDataSharingSensitivityManager;
  v2 = [(AFSiriDataSharingSensitivityManager *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    __int16 v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v3 = (void *)getTRIClientClass_softClass;
    uint64_t v13 = getTRIClientClass_softClass;
    if (!getTRIClientClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTRIClientClass_block_invoke;
      v9[3] = &unk_1E592C0B0;
      v9[4] = &v10;
      __getTRIClientClass_block_invoke((uint64_t)v9);
      uint64_t v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 clientWithIdentifier:317];
    client = v2->_client;
    v2->_client = (TRIClient *)v5;

    [(AFSiriDataSharingSensitivityManager *)v2 _registerUpdateHandler];
  }
  return v2;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_38287);
  }
  v2 = (void *)shared_shared;
  return v2;
}

void __45__AFSiriDataSharingSensitivityManager_shared__block_invoke()
{
  v0 = objc_alloc_init(AFSiriDataSharingSensitivityManager);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;
}

@end