@interface SGModelAsset
+ (id)_assetWithName:(id)a3 andLoadBlock:(id)a4;
+ (id)asset;
+ (id)dictionaryWithPlistFilename:(id)a3;
+ (id)dpRecorderRules;
+ (id)mappings;
+ (id)metricsConfig;
+ (id)nameDetectorRules;
+ (id)quickResponses;
+ (id)quickResponsesVocab;
+ (id)rules;
+ (id)signatureRules;
+ (id)vocabWithTrieFilename:(id)a3;
+ (void)_invokeOnUpdateBlock;
+ (void)_reset;
+ (void)registerOnUpdateBlock:(id)a3;
@end

@implementation SGModelAsset

+ (id)asset
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_assetInstance;
  return v2;
}

+ (id)vocabWithTrieFilename:(id)a3
{
  id v3 = a3;
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SGModelAsset_vocabWithTrieFilename___block_invoke;
  v7[3] = &unk_2647EA150;
  id v8 = v3;
  id v4 = v3;
  v5 = +[SGModelAsset _assetWithName:v4 andLoadBlock:v7];

  return v5;
}

id __38__SGModelAsset_vocabWithTrieFilename___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = +[SGModelAsset asset];
  id v3 = [v2 filesystemPathForAssetDataRelativePath:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = +[SGDefaultAssets vocabWithTrieAssetPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error finding model trie path for %@", (uint8_t *)&v7, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)dictionaryWithPlistFilename:(id)a3
{
  id v3 = a3;
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SGModelAsset_dictionaryWithPlistFilename___block_invoke;
  v7[3] = &unk_2647EA150;
  id v8 = v3;
  id v4 = v3;
  v5 = +[SGModelAsset _assetWithName:v4 andLoadBlock:v7];

  return v5;
}

id __44__SGModelAsset_dictionaryWithPlistFilename___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = +[SGModelAsset asset];
  id v3 = [v2 filesystemPathForAssetDataRelativePath:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = +[SGDefaultAssets dictionaryWithPlistAssetPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error finding model plist path for %@", (uint8_t *)&v7, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)nameDetectorRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"NameDetectorRules.plist"];
}

+ (id)dpRecorderRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"DPRecorderRules.plist"];
}

+ (id)signatureRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"SignatureDetectorRules.plist"];
}

+ (id)metricsConfig
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"MetricsConfig.plist"];
}

+ (id)quickResponsesVocab
{
  return +[SGModelAsset vocabWithTrieFilename:@"MLQuickResponsesTraining.trie"];
}

+ (id)quickResponses
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"MLQuickResponsesTraining.plist"];
}

+ (id)mappings
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"MLModelMappings.plist"];
}

+ (id)rules
{
  return +[SGModelAsset dictionaryWithPlistFilename:@"MLModelRules.plist"];
}

+ (id)_assetWithName:(id)a3 andLoadBlock:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  [(id)_lock lock];
  int v7 = [(id)_cache objectForKey:v5];
  if (!v7)
  {
    uint64_t v8 = v6[2](v6);
    uint64_t v9 = (void *)_cache;
    if (v8)
    {
      int v7 = (void *)v8;
      [(id)_cache setObject:v8 forKey:v5];
    }
    else
    {
      v10 = [MEMORY[0x263EFF9D0] null];
      [v9 setObject:v10 forKey:v5];

      int v7 = 0;
    }
  }
  [(id)_lock unlock];
  v11 = [MEMORY[0x263EFF9D0] null];
  if (v7 == v11) {
    v12 = 0;
  }
  else {
    v12 = v7;
  }
  id v13 = v12;

  return v13;
}

+ (void)_reset
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  [(id)_lock lock];
  [(id)_cache removeAllObjects];
  v2 = (void *)_lock;
  [v2 unlock];
}

+ (void)_invokeOnUpdateBlock
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  [(id)_lock lock];
  v2 = (void *)[(id)_updateBlocks copy];
  [(id)_lock unlock];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)registerOnUpdateBlock:(id)a3
{
  uint64_t v3 = setup_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_11);
  }
  [(id)_lock lock];
  uint64_t v5 = (void *)_updateBlocks;
  uint64_t v6 = (void *)MEMORY[0x22A66BFD0](v4);

  [v5 addObject:v6];
  int v7 = (void *)_lock;
  [v7 unlock];
}

@end