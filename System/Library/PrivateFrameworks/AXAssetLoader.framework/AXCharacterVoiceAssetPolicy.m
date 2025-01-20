@interface AXCharacterVoiceAssetPolicy
+ (id)characterVoiceAssetPolicyWithLanguage:(id)a3;
- (AXCharacterVoiceAssetPolicy)init;
- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4;
- (NSString)language;
- (id)assetType;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4;
- (void)setLanguage:(id)a3;
@end

@implementation AXCharacterVoiceAssetPolicy

+ (id)characterVoiceAssetPolicyWithLanguage:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXCharacterVoiceAssetPolicy);
  [(AXCharacterVoiceAssetPolicy *)v4 setLanguage:v3];

  return v4;
}

- (id)assetType
{
  return @"com.apple.MobileAsset.CharacterVoices";
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  id v5 = a3;
  if ([v5 formatVersion] == 1)
  {
    uint64_t v6 = [(AXCharacterVoiceAssetPolicy *)self language];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [v5 characterVoiceLanguage];
      v9 = [(AXCharacterVoiceAssetPolicy *)self language];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34 = [(AXCharacterVoiceAssetPolicy *)self language];
  id v5 = AXLogCharacterVoices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v34;
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_DEFAULT, "Purging mickey assets: language: %@", buf, 0xCu);
  }

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v36 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v12 = [v11 characterVoiceLanguage];
        int v13 = [v12 isEqualToString:v34];

        if (v13)
        {
          v14 = [v11 characterVoiceName];
          v15 = [v36 objectForKeyedSubscript:v14];

          if (!v15)
          {
            v16 = [MEMORY[0x1E4F1CA48] array];
            v17 = [v11 characterVoiceName];
            [v36 setObject:v16 forKeyedSubscript:v17];
          }
          v18 = [v11 characterVoiceName];
          v19 = [v36 objectForKeyedSubscript:v18];
          [v19 addObject:v11];
        }
        else
        {
          [v6 addObject:v11];
          v18 = AXLogCharacterVoices();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v11;
            _os_log_impl(&dword_1DC53F000, v18, OS_LOG_TYPE_DEFAULT, "Asset doesn't match language, purging: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v8);
  }

  v33 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = v36;
  id v30 = [v36 allKeys];
  uint64_t v35 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v35)
  {
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v30);
        }
        v22 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * j)];
        v23 = [v22 firstObject];
        if ((unint64_t)[v22 count] >= 2)
        {
          unint64_t v24 = 1;
          do
          {
            v25 = [v22 objectAtIndexedSubscript:v24];
            unint64_t v26 = [v25 contentVersion];
            if (v26 > [v23 contentVersion])
            {
              v27 = AXLogCharacterVoices();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v25;
                __int16 v47 = 2112;
                v48 = v23;
                _os_log_impl(&dword_1DC53F000, v27, OS_LOG_TYPE_DEFAULT, "Asset is newer than current asset, purging: %@ > %@", buf, 0x16u);
              }

              [v6 addObject:v23];
              id v28 = v25;

              v23 = v28;
            }

            ++v24;
          }
          while (v24 < [v22 count]);
        }
        v20 = v36;
        [v33 setObject:v23 forKeyedSubscript:v36];
      }
      uint64_t v35 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v35);
  }

  return v6;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)AXCharacterVoiceAssetPolicy;
  id v5 = -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v8, sel_downloadOptionsForOperation_userInitiated_, a3);
  uint64_t v6 = v5;
  if (v4) {
    [v5 setAllowsCellularAccess:1];
  }
  return v6;
}

- (AXCharacterVoiceAssetPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXCharacterVoiceAssetPolicy;
  return [(AXAssetPolicy *)&v3 init];
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end