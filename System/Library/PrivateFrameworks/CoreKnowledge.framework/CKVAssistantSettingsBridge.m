@interface CKVAssistantSettingsBridge
+ (BOOL)isASRSupported;
+ (BOOL)isAssistantEnabled;
+ (BOOL)isCustomerInstall;
+ (BOOL)isDictationEnabled;
+ (BOOL)isLinkVocabularyEnabled;
+ (BOOL)isOfflineDictationSupported;
+ (BOOL)isSiriMuxSupported;
+ (BOOL)isSiriUODSupported;
+ (BOOL)isSiriUODwithASROnServerSupported;
+ (BOOL)isSpeechProfileEnabled;
+ (id)buildVersion;
+ (id)currentDictationLanguageCodes;
+ (id)currentSiriLanguageCode;
+ (id)getConformingSharedUserIds;
- (CKVAssistantSettingsBridge)init;
@end

@implementation CKVAssistantSettingsBridge

+ (BOOL)isCustomerInstall
{
  return MEMORY[0x1F410AD40](a1, a2);
}

+ (BOOL)isDictationEnabled
{
  v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 dictationIsEnabled];

  return v3;
}

+ (BOOL)isAssistantEnabled
{
  v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

+ (id)getConformingSharedUserIds
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "+[CKVAssistantSettingsBridge getConformingSharedUserIds]";
    _os_log_error_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_ERROR, "%s Unexpected call to getConformingSharedUserIds from non-tvOS platform, returning empty results", (uint8_t *)&v5, 0xCu);
  }
  char v3 = [MEMORY[0x1E4F1CAD0] set];
  return v3;
}

+ (BOOL)isLinkVocabularyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSpeechProfileEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)currentDictationLanguageCodes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F3C268]);
  char v3 = [v2 installationStatusForLanguagesWithAssetType:3];

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__402;
  v11 = __Block_byref_object_dispose__403;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CKVAssistantSettingsBridge_currentDictationLanguageCodes__block_invoke;
  v6[3] = &unk_1E5CF97A0;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__CKVAssistantSettingsBridge_currentDictationLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (AFOfflineDictationStatusStringIsInstalled()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

+ (id)currentSiriLanguageCode
{
  id v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v3 = [v2 languageCode];

  if (![v3 length])
  {
    id v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
    uint64_t v5 = [v4 bestSupportedLanguageCodeForLanguageCode:0];

    id v3 = (void *)v5;
  }
  return v3;
}

+ (BOOL)isSiriUODwithASROnServerSupported
{
  return MEMORY[0x1F410AE50](a1, a2);
}

+ (BOOL)isSiriMuxSupported
{
  return MEMORY[0x1F410ACD0](a1, a2);
}

+ (BOOL)isOfflineDictationSupported
{
  return MEMORY[0x1F410ADC8](a1, a2);
}

+ (BOOL)isASRSupported
{
  uint64_t v2 = AFDeviceSupportsSiriUOD();
  if (v2) {
    return 1;
  }
  return MEMORY[0x1F410ADC8](v2, v3);
}

+ (BOOL)isSiriUODSupported
{
  uint64_t v2 = AFDeviceSupportsSiriUOD();
  if (v2) {
    return 1;
  }
  return MEMORY[0x1F410AE50](v2, v3);
}

+ (id)buildVersion
{
  return (id)MEMORY[0x1F410AC38](a1, a2);
}

- (CKVAssistantSettingsBridge)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

@end