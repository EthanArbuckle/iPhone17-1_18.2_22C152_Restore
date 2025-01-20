@interface CKVLocalization
+ (BOOL)supportsSecureCoding;
+ (id)defaultLocalization;
+ (id)supportedLanguageCodeFromLocale:(id)a3;
+ (id)supportedNSLocaleFromLanguageCode:(id)a3;
+ (int64_t)supportedLocaleFromLanguageCode:(id)a3;
- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocalization:(id)a3;
- (CKVLocalization)init;
- (CKVLocalization)initWithCoder:(id)a3;
- (CKVLocalization)initWithSiriLanguageCode:(id)a3;
- (id)allLanguageCodes;
- (id)dictationLanguageCodes;
- (id)siriLanguageCode;
- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)refresh;
@end

@implementation CKVLocalization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedAssetPath, 0);
  objc_storeStrong((id *)&self->_dictationLanguageCodes, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
}

- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![MEMORY[0x1E4F78F48] isLocaleEmbedded:v7])
  {
    id v49 = 0;
    id v10 = [MEMORY[0x1E4F78F48] getAssetPathForLocale:v7 withError:&v49];
    id v11 = v49;
    v12 = v11;
    if (v10)
    {
      v13 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        v38 = v13;
        v39 = [v7 localeIdentifier];
        *(_DWORD *)buf = 136315650;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v54 = 2112;
        v55 = v39;
        __int16 v56 = 2112;
        id v57 = v10;
        _os_log_debug_impl(&dword_1A77B3000, v38, OS_LOG_TYPE_DEBUG, "%s Resolved asset path for locale (%@) %@", buf, 0x20u);

        if (!a4) {
          goto LABEL_13;
        }
      }
      else if (!a4)
      {
LABEL_13:
        BOOL v9 = 1;
LABEL_14:
        id v15 = v12;
LABEL_15:

        goto LABEL_16;
      }
      id v10 = v10;
      *a4 = v10;
      goto LABEL_13;
    }
    if ([v11 code] == 1)
    {
      v14 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        v40 = v14;
        v41 = [v7 localeIdentifier];
        *(_DWORD *)buf = 136315394;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v54 = 2112;
        v55 = v41;
        _os_log_debug_impl(&dword_1A77B3000, v40, OS_LOG_TYPE_DEBUG, "%s Locale: %@ is unsupported by MorphunAssets - proceeding without asset path", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_13;
    }
    int assetRequestCount = self->_assetRequestCount;
    self->_int assetRequestCount = assetRequestCount + 1;
    if (assetRequestCount)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v19 = NSString;
      v20 = [v7 localeIdentifier];
      v21 = [v19 stringWithFormat:@"Previous attempt to request Morphun asset failed for locale: %@ attempts: %u", v20, self->_assetRequestCount];
      v51 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v23 = [v18 errorWithDomain:@"com.apple.siri.vocabulary.localization" code:2 userInfo:v22];
      KVSetAndReportError();

      LODWORD(v20) = self->_assetRequestCount;
      v24 = (void *)CKLogContextVocabulary;
      BOOL v25 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
      if (v20 == 2)
      {
        if (v25)
        {
          v26 = v24;
          v27 = [v7 localeIdentifier];
          *(_DWORD *)buf = 136315394;
          v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          __int16 v54 = 2112;
          v55 = v27;
          _os_log_impl(&dword_1A77B3000, v26, OS_LOG_TYPE_INFO, "%s Issuing a non-blocking MorphunAssets download request for locale: %@", buf, 0x16u);
        }
        v28 = (void *)MEMORY[0x1E4F78F48];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __67__CKVLocalization__locateMorphunAssetForLocale_outAssetPath_error___block_invoke;
        v46[3] = &unk_1E5CF97F8;
        id v47 = v7;
        [v28 onDemandDownloadForLocale:v47 withProgress:0 withCompletion:v46];
      }
      else if (v25)
      {
        v36 = v24;
        v37 = [v7 localeIdentifier];
        *(_DWORD *)buf = 136315394;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v54 = 2112;
        v55 = v37;
        _os_log_impl(&dword_1A77B3000, v36, OS_LOG_TYPE_INFO, "%s MorphunAssets download attempts exhausted for locale: %@", buf, 0x16u);
      }
      id v10 = 0;
      BOOL v9 = 0;
      goto LABEL_14;
    }
    dispatch_time_t v29 = dispatch_time(0, 60000000000);
    v30 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      v32 = [v7 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      __int16 v54 = 2112;
      v55 = v32;
      __int16 v56 = 1024;
      LODWORD(v57) = 60;
      _os_log_impl(&dword_1A77B3000, v31, OS_LOG_TYPE_INFO, "%s Issuing a blocking MorphunAssets download request for locale: %@ with timeout of %d s", buf, 0x1Cu);
    }
    id v15 = [MEMORY[0x1E4F78F48] blockingOnDemandDownloadForLocale:v7 withTimeout:v29 withProgress:0];

    if (v15)
    {
      v33 = (void *)CKLogContextVocabulary;
      if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        KVSetAndReportError();
        id v10 = 0;
        BOOL v9 = 0;
        goto LABEL_15;
      }
      v43 = v33;
      v44 = [v7 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      __int16 v54 = 2112;
      v55 = v44;
      __int16 v56 = 2112;
      id v57 = v15;
      v45 = "%s MorphunAssets download request failed for locale: %@ error: %@";
    }
    else
    {
      id v48 = 0;
      id v10 = [MEMORY[0x1E4F78F48] getAssetPathForLocale:v7 withError:&v48];
      id v15 = v48;
      if (v10)
      {
        if (a4)
        {
          id v10 = v10;
          *a4 = v10;
        }
        BOOL v9 = 1;
        goto LABEL_15;
      }
      v42 = (void *)CKLogContextVocabulary;
      if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v43 = v42;
      v44 = [v7 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      __int16 v54 = 2112;
      v55 = v44;
      __int16 v56 = 2112;
      id v57 = v15;
      v45 = "%s Failed to get asset path for locale: %@ after download. error: %@";
    }
    _os_log_error_impl(&dword_1A77B3000, v43, OS_LOG_TYPE_ERROR, v45, buf, 0x20u);

    goto LABEL_26;
  }
  v8 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    v34 = v8;
    v35 = [v7 localeIdentifier];
    *(_DWORD *)buf = 136315394;
    v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
    __int16 v54 = 2112;
    v55 = v35;
    _os_log_debug_impl(&dword_1A77B3000, v34, OS_LOG_TYPE_DEBUG, "%s Locale %@ is embedded.", buf, 0x16u);
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

void __67__CKVLocalization__locateMorphunAssetForLocale_outAssetPath_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    id v7 = *(void **)(a1 + 32);
    v8 = v6;
    BOOL v9 = [v7 localeIdentifier];
    int v10 = 136315906;
    id v11 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s MorphunAssets download completion invoked for locale: %@ result: %d error: %@", (uint8_t *)&v10, 0x26u);
  }
  if (v5) {
    KVSetAndReportError();
  }
}

- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__526;
  v13 = __Block_byref_object_dispose__527;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CKVLocalization_locateMorphunAssetForSiriLanguage_error___block_invoke;
  v8[3] = &unk_1E5CF97D0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = a4;
  dispatch_sync(queue, v8);
  int64_t v6 = v16[3];
  if (a3 && v6)
  {
    *a3 = (id) v10[5];
    int64_t v6 = v16[3];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __59__CKVLocalization_locateMorphunAssetForSiriLanguage_error___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 36))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(v2 + 24));
LABEL_3:
    *(void *)(*(void *)(a1[6] + 8) + 24) = [(id)objc_opt_class() supportedLocaleFromLanguageCode:*(void *)(a1[4] + 8)];
    return;
  }
  v3 = [(id)objc_opt_class() supportedNSLocaleFromLanguageCode:*(void *)(a1[4] + 8)];
  if (v3)
  {
    v4 = (void *)a1[4];
    uint64_t v5 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v5 + 40);
    char v6 = [v4 _locateMorphunAssetForLocale:v3 outAssetPath:&obj error:a1[7]];
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      *(unsigned char *)(a1[4] + 36) = 1;
      objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(void *)(a1[5] + 8) + 40));

      goto LABEL_3;
    }
  }
  else
  {
    id v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1[4] + 8);
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[CKVLocalization locateMorphunAssetForSiriLanguage:error:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Unsupported Siri Language: %@", buf, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    int v10 = [NSString stringWithFormat:@"Unsupported Siri Language: \"%@\"", *(void *)(a1[4] + 8)];
    uint64_t v15 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    __int16 v12 = [v9 errorWithDomain:@"com.apple.siri.vocabulary.localization" code:1 userInfo:v11];
    KVSetError();
  }
}

- (id)allLanguageCodes
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(CKVLocalization *)self dictationLanguageCodes];
  uint64_t v5 = [v3 setWithSet:v4];

  char v6 = [(CKVLocalization *)self siriLanguageCode];
  if (v6) {
    [v5 addObject:v6];
  }

  return v5;
}

- (void)refresh
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CKVLocalization_refresh__block_invoke;
  block[3] = &unk_1E5CF9B68;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __26__CKVLocalization_refresh__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[CKVAssistantSettingsBridge currentSiriLanguageCode];
  v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = 136315650;
    uint64_t v11 = "-[CKVLocalization refresh]_block_invoke";
    __int16 v12 = 2112;
    v13 = v2;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Siri language is %@, previously %@", (uint8_t *)&v10, 0x20u);
  }
  if (([v2 isEqual:*(void *)(*(void *)(a1 + 32) + 8)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v2);
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 36) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;
  }
  id v7 = +[CKVAssistantSettingsBridge currentDictationLanguageCodes];
  uint64_t v8 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    int v10 = 136315650;
    uint64_t v11 = "-[CKVLocalization refresh]_block_invoke";
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s Dictation languages are %@, previously %@", (uint8_t *)&v10, 0x20u);
  }
  if (([v7 isEqual:*(void *)(*(void *)(a1 + 32) + 16)] & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v7);
  }
}

- (id)dictationLanguageCodes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__526;
  int v10 = __Block_byref_object_dispose__527;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CKVLocalization_dictationLanguageCodes__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__CKVLocalization_dictationLanguageCodes__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = +[CKVAssistantSettingsBridge currentDictationLanguageCodes];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (id)siriLanguageCode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__526;
  int v10 = __Block_byref_object_dispose__527;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CKVLocalization_siriLanguageCode__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__CKVLocalization_siriLanguageCode__block_invoke(uint64_t a1)
{
}

- (BOOL)isEqualToLocalization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKVLocalization *)self siriLanguageCode];
  uint64_t v6 = [v4 siriLanguageCode];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVLocalization *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVLocalization *)self isEqualToLocalization:v5];

  return v6;
}

- (CKVLocalization)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l"];

  if (v5)
  {
    self = [(CKVLocalization *)self initWithSiriLanguageCode:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CKVLocalization)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVLocalization)initWithSiriLanguageCode:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVLocalization;
  uint64_t v5 = [(CKVLocalization *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    siriLanguageCode = v5->_siriLanguageCode;
    v5->_siriLanguageCode = (NSString *)v6;

    dictationLanguageCodes = v5->_dictationLanguageCodes;
    v5->_dictationLanguageCodes = 0;

    v5->_int assetRequestCount = 0;
    v5->_assetResolved = 0;
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("CKVLocalization", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

+ (id)supportedLanguageCodeFromLocale:(id)a3
{
  if (KVLocaleTypeFromNSLocale())
  {
    id v3 = KVLocaleTypeName();
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (int64_t)supportedLocaleFromLanguageCode:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  int64_t v5 = KVLocaleTypeFromName();

  if (!v5)
  {
    uint64_t v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "+[CKVLocalization supportedLocaleFromLanguageCode:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported language code (%@)", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

+ (id)supportedNSLocaleFromLanguageCode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() supportedLocaleFromLanguageCode:v3];

  return (id)MEMORY[0x1F412A0D0](v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultLocalization
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v3 = +[CKVAssistantSettingsBridge currentSiriLanguageCode];
  uint64_t v4 = (void *)[v2 initWithSiriLanguageCode:v3];

  return v4;
}

@end