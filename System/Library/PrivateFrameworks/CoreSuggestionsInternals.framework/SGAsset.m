@interface SGAsset
+ (id)asset;
+ (id)localeAsset;
+ (id)localeAssetIdentifier;
+ (id)notificationQueue;
+ (id)regionAsset;
+ (id)regionAssetIdentifier;
+ (void)downloadMetadataWithCompletion:(id)a3;
@end

@implementation SGAsset

+ (id)asset
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)assetInstance;
  return v2;
}

+ (void)downloadMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = [a1 asset];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke;
  v24[3] = &unk_1E65C0338;
  v26 = v31;
  v7 = v5;
  v25 = v7;
  [v6 downloadMetadataWithCompletion:v24];

  dispatch_group_enter(v7);
  v8 = [a1 localeAsset];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_266;
  v21[3] = &unk_1E65C0338;
  v23 = v29;
  v9 = v7;
  v22 = v9;
  [v8 downloadMetadataWithCompletion:v21];

  if (+[SGMessageEventDissector mobileAssetsEnabled])
  {
    dispatch_group_enter(v9);
    v10 = [a1 regionAsset];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_267;
    v18[3] = &unk_1E65C0338;
    v20 = v27;
    v19 = v9;
    [v10 downloadMetadataWithCompletion:v18];
  }
  v11 = dispatch_get_global_queue(17, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_268;
  v13[3] = &unk_1E65C0360;
  id v14 = v4;
  v15 = v31;
  v16 = v29;
  v17 = v27;
  id v12 = v4;
  dispatch_group_notify(v9, v11, v13);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [common] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke_266(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [locale] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke_267(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [region] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __42__SGAsset_downloadMetadataWithCompletion___block_invoke_268(uint64_t a1)
{
  +[SGMessageEventDissector mobileAssetsEnabled];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

+ (id)regionAssetIdentifier
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)regionAssetIdentifier;
  return v2;
}

+ (id)regionAsset
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)regionAssetInstance;
  return v2;
}

+ (id)localeAssetIdentifier
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)localeAssetIdentifier;
  return v2;
}

+ (id)localeAsset
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)localeAssetInstance;
  return v2;
}

+ (id)notificationQueue
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_42134);
  }
  v2 = (void *)notificationQueue;
  return v2;
}

@end