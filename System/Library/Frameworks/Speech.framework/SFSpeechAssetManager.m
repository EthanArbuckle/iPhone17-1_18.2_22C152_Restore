@interface SFSpeechAssetManager
+ (BOOL)isLanguageDetectorInstalled;
+ (id)_serialQueueForClientIdentifier:(id)a3;
+ (id)_timeoutError:(double)a3;
+ (id)assetPathForConfig:(id)a3 clientIdentifier:(id)a4;
+ (id)assetPathForLanguage:(id)a3;
+ (id)assetPathForLanguage:(id)a3 clientIdentifier:(id)a4;
+ (id)configParametersForVoicemailWithLanguage:(id)a3;
+ (id)configParametersForVoicemailWithLanguage:(id)a3 clientIdentifier:(id)a4;
+ (id)installedLanguages;
+ (id)installedLanguagesForTaskHint:(int64_t)a3;
+ (id)languageCode:(id)a3;
+ (id)pathToAssetWithConfig:(id)a3 clientIdentifier:(id)a4;
+ (id)subscriptionsForClientIdentifier:(id)a3;
+ (id)systemClientId;
+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6;
+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6 timeout:(double)a7;
+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6;
+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6 timeout:(double)a7;
+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6;
+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6;
+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 detailedProgress:(id)a7 completion:(id)a8;
+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 progress:(id)a7 completion:(id)a8;
+ (void)fetchAssetsForLanguage:(id)a3 progress:(id)a4 completion:(id)a5;
+ (void)fetchAssetsForLanguage:(id)a3 taskHint:(int64_t)a4 clientIdentifier:(id)a5 progress:(id)a6 completion:(id)a7;
+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 detailedProgress:(id)a6 completion:(id)a7;
+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 progress:(id)a6 completion:(id)a7;
+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 progress:(id)a5 completion:(id)a6;
+ (void)fetchLanguageDetectorAssetsForClientIdentifier:(id)a3 progress:(id)a4 completion:(id)a5;
+ (void)installedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4;
+ (void)installedLanguagesWithCompletion:(id)a3;
+ (void)purgeAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
+ (void)purgeAssetsForLanguage:(id)a3 error:(id *)a4;
+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 completion:(id)a5;
+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 error:(id *)a5;
+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completion:(id)a5;
+ (void)supportedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4;
+ (void)unsubscribeFromAssetWithConfig:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
@end

@implementation SFSpeechAssetManager

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    uint64_t v15 = [v9 assetType];
    if ((unint64_t)(v15 - 1) > 6) {
      v16 = @"Unknown";
    }
    else {
      v16 = off_1E6154988[v15 - 1];
    }
    v17 = v16;
    v18 = [v9 language];
    *(_DWORD *)buf = 136315906;
    v26 = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = v17;
    __int16 v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1B709D000, v14, OS_LOG_TYPE_DEFAULT, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);
  }
  v19 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion___block_invoke;
  v22[3] = &unk_1E6155950;
  v23 = v19;
  id v24 = v12;
  v20 = v19;
  id v21 = v12;
  [(SFLocalSpeechRecognitionClient *)v20 downloadAssetsForConfig:v9 clientID:v10 detailedProgress:v11 completionHandler:v22];
}

+ (void)installedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = SFEntitledAssetTypeForTaskHint(a3);
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    if ((unint64_t)(v6 - 1) > 6) {
      id v9 = @"Unknown";
    }
    else {
      id v9 = off_1E6154988[v6 - 1];
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315394;
    v18 = "+[SFSpeechAssetManager installedLanguagesForTaskHint:completion:]";
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B709D000, v8, OS_LOG_TYPE_DEFAULT, "%s Fetching languages of installed %@ assets.", buf, 0x16u);
  }
  id v11 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SFSpeechAssetManager_installedLanguagesForTaskHint_completion___block_invoke;
  v14[3] = &unk_1E61558D8;
  uint64_t v15 = v11;
  id v16 = v5;
  id v12 = v11;
  id v13 = v5;
  [(SFLocalSpeechRecognitionClient *)v12 installedLanguagesForAssetType:v6 synchronous:0 completion:v14];
}

+ (void)supportedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = SFEntitledAssetTypeForTaskHint(a3);
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    if ((unint64_t)(v6 - 1) > 6) {
      id v9 = @"Unknown";
    }
    else {
      id v9 = off_1E6154988[v6 - 1];
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315394;
    v18 = "+[SFSpeechAssetManager supportedLanguagesForTaskHint:completion:]";
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B709D000, v8, OS_LOG_TYPE_DEFAULT, "%s Fetching languages of supported %@ assets.", buf, 0x16u);
  }
  id v11 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SFSpeechAssetManager_supportedLanguagesForTaskHint_completion___block_invoke;
  v14[3] = &unk_1E6155888;
  uint64_t v15 = v11;
  id v16 = v5;
  id v12 = v11;
  id v13 = v5;
  [(SFLocalSpeechRecognitionClient *)v12 supportedLanguagesForAssetType:v6 completion:v14];
}

uint64_t __65__SFSpeechAssetManager_supportedLanguagesForTaskHint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

uint64_t __65__SFSpeechAssetManager_installedLanguagesForTaskHint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

+ (id)_timeoutError:(double)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"Operation timed out after %.2f seconds.", *(void *)&a3];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v4 errorWithDomain:@"SFSpeechErrorDomain" code:10 userInfo:v5];

  return v6;
}

+ (id)_serialQueueForClientIdentifier:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [v3 stringWithFormat:@"%@.%@", v4, v6];

  id v8 = v7;
  id v9 = (const char *)[v8 UTF8String];

  dispatch_queue_t v10 = dispatch_queue_create(v9, 0);

  return v10;
}

+ (id)configParametersForVoicemailWithLanguage:(id)a3
{
  id v3 = a3;
  id v4 = +[SFUtilities defaultClientID];
  id v5 = +[SFSpeechAssetManager configParametersForVoicemailWithLanguage:v3 clientIdentifier:v4];

  return v5;
}

+ (void)purgeAssetsForLanguage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v9 = +[SFUtilities defaultClientID];
  uint64_t v6 = [SFEntitledAssetConfig alloc];
  v7 = +[SFSpeechAssetManager languageCode:v5];

  id v8 = [(SFEntitledAssetConfig *)v6 initWithLanguage:v7 taskHint:0];
  +[SFSpeechAssetManager unsubscribeFromAssetWithConfig:v8 clientIdentifier:v9 error:a4];
}

+ (void)purgeAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [SFEntitledAssetConfig alloc];
  dispatch_queue_t v10 = +[SFSpeechAssetManager languageCode:v8];

  id v11 = [(SFEntitledAssetConfig *)v9 initWithLanguage:v10 taskHint:0];
  +[SFSpeechAssetManager unsubscribeFromAssetWithConfig:v11 clientIdentifier:v7 error:a5];
}

+ (id)assetPathForLanguage:(id)a3
{
  id v3 = a3;
  id v4 = +[SFUtilities defaultClientID];
  id v5 = [SFEntitledAssetConfig alloc];
  uint64_t v6 = +[SFSpeechAssetManager languageCode:v3];

  id v7 = [(SFEntitledAssetConfig *)v5 initWithLanguage:v6 taskHint:0];
  id v8 = +[SFSpeechAssetManager pathToAssetWithConfig:v7 clientIdentifier:v4];

  return v8;
}

+ (id)assetPathForLanguage:(id)a3 clientIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SFEntitledAssetConfig alloc];
  id v8 = +[SFSpeechAssetManager languageCode:v6];

  id v9 = [(SFEntitledAssetConfig *)v7 initWithLanguage:v8 taskHint:0];
  dispatch_queue_t v10 = +[SFSpeechAssetManager pathToAssetWithConfig:v9 clientIdentifier:v5];

  return v10;
}

+ (id)assetPathForConfig:(id)a3 clientIdentifier:(id)a4
{
  return +[SFSpeechAssetManager pathToAssetWithConfig:a3 clientIdentifier:a4];
}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 detailedProgress:(id)a7 completion:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [SFEntitledAssetConfig alloc];
  id v16 = +[SFSpeechAssetManager languageCode:v14];

  v17 = [(SFEntitledAssetConfig *)v15 initWithLanguage:v16 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v17 clientIdentifier:v13 detailedProgress:v12 completion:v11];
}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [SFEntitledAssetConfig alloc];
  id v14 = +[SFSpeechAssetManager languageCode:v12];

  uint64_t v15 = [(SFEntitledAssetConfig *)v13 initWithLanguage:v14 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v15 clientIdentifier:v11 detailedProgress:v10 completion:v9];
}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 detailedProgress:(id)a6 completion:(id)a7
{
  id v9 = a7;
  id v10 = a6;
  id v11 = a3;
  id v15 = +[SFUtilities defaultClientID];
  id v12 = [SFEntitledAssetConfig alloc];
  id v13 = +[SFSpeechAssetManager languageCode:v11];

  id v14 = [(SFEntitledAssetConfig *)v12 initWithLanguage:v13 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v14 clientIdentifier:v15 detailedProgress:v10 completion:v9];
}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 progress:(id)a7 completion:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [SFEntitledAssetConfig alloc];
  id v16 = +[SFSpeechAssetManager languageCode:v14];

  v17 = [(SFEntitledAssetConfig *)v15 initWithLanguage:v16 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v17 clientIdentifier:v13 progress:v12 completion:v11];
}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a3;
  id v14 = +[SFUtilities defaultClientID];
  id v11 = [SFEntitledAssetConfig alloc];
  id v12 = +[SFSpeechAssetManager languageCode:v10];

  id v13 = [(SFEntitledAssetConfig *)v11 initWithLanguage:v12 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v13 clientIdentifier:v14 progress:v9 completion:v8];
}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  id v9 = a7;
  id v10 = a6;
  id v11 = a3;
  id v15 = +[SFUtilities defaultClientID];
  id v12 = [SFEntitledAssetConfig alloc];
  id v13 = +[SFSpeechAssetManager languageCode:v11];

  id v14 = [(SFEntitledAssetConfig *)v12 initWithLanguage:v13 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v14 clientIdentifier:v15 progress:v10 completion:v9];
}

+ (void)fetchAssetsForLanguage:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v13 = +[SFUtilities defaultClientID];
  id v10 = [SFEntitledAssetConfig alloc];
  id v11 = +[SFSpeechAssetManager languageCode:v9];

  id v12 = [(SFEntitledAssetConfig *)v10 initWithLanguage:v11 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v12 clientIdentifier:v13 progress:v8 completion:v7];
}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [SFEntitledAssetConfig alloc];
  id v14 = +[SFSpeechAssetManager languageCode:v12];

  id v15 = [(SFEntitledAssetConfig *)v13 initWithLanguage:v14 taskHint:0];
  +[SFSpeechAssetManager fetchAssetWithConfig:v15 clientIdentifier:v11 progress:v10 completion:v9];
}

+ (void)fetchAssetsForLanguage:(id)a3 taskHint:(int64_t)a4 clientIdentifier:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [SFEntitledAssetConfig alloc];
  id v16 = +[SFSpeechAssetManager languageCode:v14];

  v17 = [(SFEntitledAssetConfig *)v15 initWithLanguage:v16 assetType:SFEntitledAssetTypeForTaskHint(a4)];
  +[SFSpeechAssetManager fetchAssetWithConfig:v17 clientIdentifier:v13 progress:v12 completion:v11];
}

+ (void)fetchLanguageDetectorAssetsForClientIdentifier:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[SFEntitledAssetConfig alloc] initWithLanguage:@"none" assetType:6];
  +[SFSpeechAssetManager fetchAssetWithConfig:v10 clientIdentifier:v9 progress:v8 completion:v7];
}

+ (void)installedLanguagesWithCompletion:(id)a3
{
}

+ (id)installedLanguages
{
  return +[SFSpeechAssetManager installedLanguagesForTaskHint:0];
}

+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 error:(id *)a5
{
}

+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v20 = a5;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 1;
  id v8 = @"Assistant";
  id v9 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * v12);
        dispatch_group_enter(v9);
        id v14 = [[SFEntitledAssetConfig alloc] initWithAssetType:3 language:v13 regionId:0];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke;
        v27[3] = &unk_1E6155A40;
        __int16 v31 = v37;
        BOOL v32 = v6;
        id v15 = @"Assistant";
        id v28 = @"Assistant";
        id v16 = v14;
        __int16 v29 = v16;
        v30 = v9;
        +[SFSpeechAssetManager setPurgeabilityForAssetWithConfig:v16 purgeable:v6 completion:v27];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  v17 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke_39;
  block[3] = &unk_1E6155A70;
  BOOL v26 = v6;
  id v24 = v20;
  v25 = v37;
  v23 = @"Assistant";
  v18 = @"Assistant";
  id v19 = v20;
  dispatch_group_notify(v9, v17, block);

  _Block_object_dispose(v37, 8);
}

void __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v4 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 64)) {
        id v5 = @"enable";
      }
      else {
        id v5 = @"disable";
      }
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v6 = *(void **)(a1 + 40);
      id v8 = v4;
      id v9 = [v6 language];
      int v10 = 136316162;
      uint64_t v11 = "+[SFSpeechAssetManager setAssetsPurgeability:forLanguages:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_1B709D000, v8, OS_LOG_TYPE_ERROR, "%s Failed to %@ purgeability for %@ asset with language: %@, error: %@", (uint8_t *)&v10, 0x34u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke_39(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
    else
    {
      int v4 = *(unsigned __int8 *)(a1 + 56);
      id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v6 = v5;
      if (v4) {
        uint64_t v7 = @"Failed to enable purgeability for one or more %@ assets.";
      }
      else {
        uint64_t v7 = @"Failed to disable purgeability for one or more %@ assets.";
      }
      id v8 = [v5 localizedStringForKey:v7 value:&stru_1F10479F8 table:@"Localizable"];

      id v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, *(void *)(a1 + 32));
      int v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      __int16 v12 = [v10 errorWithDomain:@"SFSpeechErrorDomain" code:1 userInfo:v11];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = +[SFUtilities defaultClientID];
  int v10 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      uint64_t v11 = @"enabling";
    }
    else {
      uint64_t v11 = @"disabling";
    }
    __int16 v12 = v10;
    uint64_t v13 = [v7 assetType];
    if ((unint64_t)(v13 - 1) > 6) {
      __int16 v14 = @"Unknown";
    }
    else {
      __int16 v14 = off_1E6154988[v13 - 1];
    }
    uint64_t v15 = v14;
    __int16 v16 = [v7 language];
    *(_DWORD *)buf = 136316162;
    id v24 = "+[SFSpeechAssetManager setPurgeabilityForAssetWithConfig:purgeable:completion:]";
    __int16 v25 = 2112;
    BOOL v26 = v9;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    v30 = v15;
    __int16 v31 = 2112;
    BOOL v32 = v16;
    _os_log_impl(&dword_1B709D000, v12, OS_LOG_TYPE_DEFAULT, "%s Client (%@) %@ purgeability for the %@ asset for: %@", buf, 0x34u);
  }
  v17 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__SFSpeechAssetManager_setPurgeabilityForAssetWithConfig_purgeable_completion___block_invoke;
  v20[3] = &unk_1E6155A18;
  uint64_t v21 = v17;
  id v22 = v8;
  __int16 v18 = v17;
  id v19 = v8;
  [(SFLocalSpeechRecognitionClient *)v18 setPurgeabilityForAssetWithConfig:v7 purgeable:v6 clientID:v9 completion:v20];
}

uint64_t __79__SFSpeechAssetManager_setPurgeabilityForAssetWithConfig_purgeable_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

+ (id)subscriptionsForClientIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager subscriptionsForClientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_DEFAULT, "%s Client (%@) fetching all of their subscriptions.", buf, 0x16u);
  }
  id v5 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int v10 = __Block_byref_object_copy__2679;
  uint64_t v11 = __Block_byref_object_dispose__2680;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SFSpeechAssetManager_subscriptionsForClientIdentifier___block_invoke;
  v8[3] = &unk_1E61559F0;
  v8[4] = buf;
  [(SFLocalSpeechRecognitionClient *)v5 subscriptionsForClientId:v3 completion:v8];
  [(SFLocalSpeechRecognitionClient *)v5 invalidate];
  id v6 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v6;
}

void __57__SFSpeechAssetManager_subscriptionsForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

+ (void)unsubscribeFromAssetWithConfig:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    uint64_t v11 = [v7 assetType];
    if ((unint64_t)(v11 - 1) > 6) {
      id v12 = @"Unknown";
    }
    else {
      id v12 = off_1E6154988[v11 - 1];
    }
    uint64_t v13 = v12;
    __int16 v14 = [v7 language];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager unsubscribeFromAssetWithConfig:clientIdentifier:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    __int16 v18 = (uint64_t (*)(uint64_t, uint64_t))v13;
    LOWORD(v19) = 2112;
    *(void *)((char *)&v19 + 2) = v14;
    _os_log_impl(&dword_1B709D000, v10, OS_LOG_TYPE_DEFAULT, "%s Client (%@) unsubscribing from the %@ asset for: %@", buf, 0x2Au);
  }
  uint64_t v15 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__2679;
  *(void *)&long long v19 = __Block_byref_object_dispose__2680;
  *((void *)&v19 + 1) = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__SFSpeechAssetManager_unsubscribeFromAssetWithConfig_clientIdentifier_error___block_invoke;
  v16[3] = &unk_1E61559C8;
  v16[4] = buf;
  [(SFLocalSpeechRecognitionClient *)v15 unsubscribeFromAssetWithConfig:v7 clientID:v8 completion:v16];
  [(SFLocalSpeechRecognitionClient *)v15 invalidate];
  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
}

void __78__SFSpeechAssetManager_unsubscribeFromAssetWithConfig_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)configParametersForVoicemailWithLanguage:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = @"Assistant";
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager configParametersForVoicemailWithLanguage:clientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    __int16 v16 = (uint64_t (*)(uint64_t, uint64_t))@"Assistant";
    LOWORD(v17) = 2112;
    *(void *)((char *)&v17 + 2) = v5;
    _os_log_impl(&dword_1B709D000, v8, OS_LOG_TYPE_DEFAULT, "%s Client (%@) fetching the voicemail configuration for the %@ asset for: %@", buf, 0x2Au);
  }
  int v10 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__2679;
  *(void *)&long long v17 = __Block_byref_object_dispose__2680;
  *((void *)&v17 + 1) = 0;
  uint64_t v11 = +[SFSpeechAssetManager languageCode:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __82__SFSpeechAssetManager_configParametersForVoicemailWithLanguage_clientIdentifier___block_invoke;
  v14[3] = &unk_1E61559A0;
  void v14[4] = buf;
  [(SFLocalSpeechRecognitionClient *)v10 configParametersForVoicemailWithLanguage:v11 clientID:v6 completion:v14];

  [(SFLocalSpeechRecognitionClient *)v10 invalidate];
  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __82__SFSpeechAssetManager_configParametersForVoicemailWithLanguage_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)pathToAssetWithConfig:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [v5 assetType];
    if ((unint64_t)(v9 - 1) > 6) {
      int v10 = @"Unknown";
    }
    else {
      int v10 = off_1E6154988[v9 - 1];
    }
    uint64_t v11 = v10;
    id v12 = [v5 language];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))v11;
    LOWORD(v19) = 2112;
    *(void *)((char *)&v19 + 2) = v12;
    _os_log_impl(&dword_1B709D000, v8, OS_LOG_TYPE_DEFAULT, "%s Client (%@) fetching the path to the %@ asset for: %@", buf, 0x2Au);
  }
  uint64_t v13 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2679;
  *(void *)&long long v19 = __Block_byref_object_dispose__2680;
  *((void *)&v19 + 1) = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SFSpeechAssetManager_pathToAssetWithConfig_clientIdentifier___block_invoke;
  v16[3] = &unk_1E6155978;
  v16[4] = buf;
  [(SFLocalSpeechRecognitionClient *)v13 pathToAssetWithConfig:v5 clientID:v6 completion:v16];
  [(SFLocalSpeechRecognitionClient *)v13 invalidate];
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __63__SFSpeechAssetManager_pathToAssetWithConfig_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    uint64_t v15 = [v9 assetType];
    if ((unint64_t)(v15 - 1) > 6) {
      __int16 v16 = @"Unknown";
    }
    else {
      __int16 v16 = off_1E6154988[v15 - 1];
    }
    long long v17 = v16;
    uint64_t v18 = [v9 language];
    *(_DWORD *)buf = 136315906;
    BOOL v26 = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = v17;
    __int16 v31 = 2112;
    BOOL v32 = v18;
    _os_log_impl(&dword_1B709D000, v14, OS_LOG_TYPE_DEFAULT, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);
  }
  long long v19 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion___block_invoke;
  v22[3] = &unk_1E6155950;
  v23 = v19;
  id v24 = v12;
  uint64_t v20 = v19;
  id v21 = v12;
  [(SFLocalSpeechRecognitionClient *)v20 downloadAssetsForConfig:v9 clientID:v10 progress:v11 completionHandler:v22];
}

uint64_t __82__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6 timeout:(double)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a7 <= 0.0)
  {
    BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SFSpeechAssetManager.m", 123, @"Invalid timeout %f; must be value > 0.",
      *(void *)&a7);
  }
  long long v17 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = v17;
    uint64_t v19 = [v13 assetType];
    if ((unint64_t)(v19 - 1) > 6) {
      uint64_t v20 = @"Unknown";
    }
    else {
      uint64_t v20 = off_1E6154988[v19 - 1];
    }
    id v21 = v20;
    id v22 = [v13 language];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:timeout:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v45 = v21;
    __int16 v46 = 2112;
    v47 = v22;
    _os_log_impl(&dword_1B709D000, v18, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v45) = 0;
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
  __int16 v25 = [a1 _serialQueueForClientIdentifier:v14];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion_timeout___block_invoke;
  block[3] = &unk_1E6155900;
  id v26 = v23;
  id v39 = v26;
  v41 = buf;
  id v27 = v16;
  id v40 = v27;
  id v42 = a1;
  double v43 = a7;
  dispatch_after(v24, v25, block);

  id v28 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __98__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion_timeout___block_invoke_2;
  v33[3] = &unk_1E6155928;
  id v29 = v26;
  id v34 = v29;
  v37 = buf;
  id v30 = v27;
  id v36 = v30;
  __int16 v31 = v28;
  long long v35 = v31;
  [(SFLocalSpeechRecognitionClient *)v31 downloadAssetsForConfig:v13 clientID:v14 detailedProgress:v15 completionHandler:v33];

  _Block_object_dispose(buf, 8);
}

void __98__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion_timeout___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24) && *(void *)(a1 + 40))
  {
    *(unsigned char *)(v2 + 24) = 1;
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = [*(id *)(a1 + 56) _timeoutError:*(double *)(a1 + 64)];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  objc_sync_exit(obj);
}

void __98__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion_timeout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v7 + 24) && *(void *)(a1 + 48))
  {
    *(unsigned char *)(v7 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_sync_exit(v6);

  [*(id *)(a1 + 40) invalidate];
}

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6 timeout:(double)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a7 <= 0.0)
  {
    BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SFSpeechAssetManager.m", 88, @"Invalid timeout %f; must be value > 0.",
      *(void *)&a7);
  }
  long long v17 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = v17;
    uint64_t v19 = [v13 assetType];
    if ((unint64_t)(v19 - 1) > 6) {
      uint64_t v20 = @"Unknown";
    }
    else {
      uint64_t v20 = off_1E6154988[v19 - 1];
    }
    id v21 = v20;
    id v22 = [v13 language];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:timeout:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v45 = v21;
    __int16 v46 = 2112;
    v47 = v22;
    _os_log_impl(&dword_1B709D000, v18, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v45) = 0;
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
  __int16 v25 = [a1 _serialQueueForClientIdentifier:v14];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion_timeout___block_invoke;
  block[3] = &unk_1E6155900;
  id v26 = v23;
  id v39 = v26;
  v41 = buf;
  id v27 = v16;
  id v40 = v27;
  id v42 = a1;
  double v43 = a7;
  dispatch_after(v24, v25, block);

  id v28 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion_timeout___block_invoke_2;
  v33[3] = &unk_1E6155928;
  id v29 = v26;
  id v34 = v29;
  v37 = buf;
  id v30 = v27;
  id v36 = v30;
  __int16 v31 = v28;
  long long v35 = v31;
  [(SFLocalSpeechRecognitionClient *)v31 downloadAssetsForConfig:v13 clientID:v14 progress:v15 completionHandler:v33];

  _Block_object_dispose(buf, 8);
}

void __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion_timeout___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24) && *(void *)(a1 + 40))
  {
    *(unsigned char *)(v2 + 24) = 1;
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = [*(id *)(a1 + 56) _timeoutError:*(double *)(a1 + 64)];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  objc_sync_exit(obj);
}

void __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion_timeout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v7 + 24) && *(void *)(a1 + 48))
  {
    *(unsigned char *)(v7 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_sync_exit(v6);

  [*(id *)(a1 + 40) invalidate];
}

+ (id)installedLanguagesForTaskHint:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SFEntitledAssetTypeForTaskHint(a3);
  int v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    if ((unint64_t)(v3 - 1) > 6) {
      id v6 = @"Unknown";
    }
    else {
      id v6 = off_1E6154988[v3 - 1];
    }
    uint64_t v7 = v6;
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[SFSpeechAssetManager installedLanguagesForTaskHint:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1B709D000, v5, OS_LOG_TYPE_DEFAULT, "%s Fetching languages of installed %@ assets.", buf, 0x16u);
  }
  id v8 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v13 = __Block_byref_object_copy__2679;
  id v14 = __Block_byref_object_dispose__2680;
  id v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SFSpeechAssetManager_installedLanguagesForTaskHint___block_invoke;
  v11[3] = &unk_1E61558B0;
  v11[4] = buf;
  [(SFLocalSpeechRecognitionClient *)v8 installedLanguagesForAssetType:v3 synchronous:1 completion:v11];
  [(SFLocalSpeechRecognitionClient *)v8 invalidate];
  id v9 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

uint64_t __54__SFSpeechAssetManager_installedLanguagesForTaskHint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

+ (BOOL)isLanguageDetectorInstalled
{
  uint64_t v2 = [[SFEntitledAssetConfig alloc] initWithLanguage:@"none" assetType:6];
  uint64_t v3 = +[SFUtilities defaultClientID];
  uint64_t v4 = +[SFSpeechAssetManager pathToAssetWithConfig:v2 clientIdentifier:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)languageCode:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA20];
    id v4 = a3;
    BOOL v5 = (void *)[[v3 alloc] initWithLocaleIdentifier:v4];

    id v6 = NSString;
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F1C438]];
    id v8 = [v5 objectForKey:*MEMORY[0x1E4F1C400]];
    id v9 = [v6 stringWithFormat:@"%@-%@", v7, v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)systemClientId
{
  return @"com.apple.siri.embeddedspeech";
}

@end