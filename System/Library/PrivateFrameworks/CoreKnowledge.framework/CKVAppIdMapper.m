@interface CKVAppIdMapper
+ (BOOL)isKnownAppId:(id)a3;
+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap;
+ (id)_getAllKnownAppIds;
+ (id)_getKnownAppIdMap;
+ (id)convertToUnversalAppId:(id)a3;
@end

@implementation CKVAppIdMapper

+ (id)_getAllKnownAppIds
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CKVAppIdMapper__getAllKnownAppIds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_getAllKnownAppIds_sharedSetToken != -1) {
    dispatch_once(&_getAllKnownAppIds_sharedSetToken, block);
  }
  v2 = (void *)_getAllKnownAppIds_allKnownAppIds;
  return v2;
}

void __36__CKVAppIdMapper__getAllKnownAppIds__block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F1CA80] set];
  v2 = [*(id *)(a1 + 32) _getKnownAppIdMap];
  v3 = [v2 allKeys];
  [v8 addObjectsFromArray:v3];

  v4 = [*(id *)(a1 + 32) _getKnownAppIdMap];
  v5 = [v4 allValues];
  [v8 addObjectsFromArray:v5];

  [v8 addObject:*MEMORY[0x1E4F71F68]];
  [v8 addObject:*MEMORY[0x1E4F71F50]];
  [v8 addObject:*MEMORY[0x1E4F71F80]];
  [v8 addObject:*MEMORY[0x1E4F71F90]];
  [v8 addObject:*MEMORY[0x1E4F71F88]];
  [v8 addObject:*MEMORY[0x1E4F71F70]];
  [v8 addObject:*MEMORY[0x1E4F71FB0]];
  [v8 addObject:*MEMORY[0x1E4F71F58]];
  [v8 addObject:*MEMORY[0x1E4F71F78]];
  [v8 addObject:*MEMORY[0x1E4F71FC0]];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithSet:v8];
  v7 = (void *)_getAllKnownAppIds_allKnownAppIds;
  _getAllKnownAppIds_allKnownAppIds = v6;
}

+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F71FB8];
  v7[0] = @"com.apple.siriVoiceShortcuts";
  v7[1] = @"com.apple.VoiceShortcuts";
  v8[0] = v2;
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F71F98];
  v7[2] = @"com.apple.MobileSMS";
  v7[3] = @"com.apple.iChat";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F71FA0];
  v7[4] = @"com.apple.mobileslideshow";
  v7[5] = @"com.apple.Photos";
  v8[4] = v4;
  v8[5] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  return v5;
}

+ (id)_getKnownAppIdMap
{
  if (_getKnownAppIdMap_sharedMapToken != -1) {
    dispatch_once(&_getKnownAppIdMap_sharedMapToken, &__block_literal_global_372);
  }
  uint64_t v2 = (void *)_getKnownAppIdMap_sharedMap;
  return v2;
}

void __35__CKVAppIdMapper__getKnownAppIdMap__block_invoke()
{
  uint64_t v0 = +[CKVAppIdMapper _buildKnownIdentifierToUniversalOriginAppIdMap];
  v1 = (void *)_getKnownAppIdMap_sharedMap;
  _getKnownAppIdMap_sharedMap = v0;
}

+ (BOOL)isKnownAppId:(id)a3
{
  id v4 = a3;
  v5 = [a1 _getAllKnownAppIds];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)convertToUnversalAppId:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CKVAppIdMapper _getKnownAppIdMap];
  v5 = [v4 valueForKey:v3];

  char v6 = v3;
  if (v5)
  {
    v7 = CKLogContextVocabulary;
    BOOL v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
    char v6 = v5;
    if (v8)
    {
      int v11 = 136315650;
      v12 = "+[CKVAppIdMapper convertToUnversalAppId:]";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Convert %@ to a universal appId: %@", (uint8_t *)&v11, 0x20u);
      char v6 = v5;
    }
  }
  id v9 = v6;

  return v9;
}

@end