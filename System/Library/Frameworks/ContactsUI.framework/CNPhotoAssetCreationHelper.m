@interface CNPhotoAssetCreationHelper
+ (id)log;
+ (void)createAssetFromImage:(id)a3 completionHandler:(id)a4;
@end

@implementation CNPhotoAssetCreationHelper

+ (void)createAssetFromImage:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__37956;
  v17[4] = __Block_byref_object_dispose__37957;
  id v18 = 0;
  id v16 = 0;
  v7 = +[CNPhotoLibraryProvider photoLibraryWithError:&v16];
  id v8 = v16;
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke;
    v13[3] = &unk_1E549A2F0;
    v14 = v5;
    v15 = v17;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5499570;
    id v11 = v6;
    v12 = v17;
    [v7 performChanges:v13 completionHandler:v10];

    v9 = v14;
  }
  else
  {
    v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Unable to create asset for photo library %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(v17, 8);
}

void __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke(uint64_t a1)
{
  id v6 = [(Class)getPHAssetChangeRequestClass[0]() creationRequestForAssetFromImage:*(void *)(a1 + 32)];
  v2 = [v6 placeholderForCreatedAsset];
  uint64_t v3 = [v2 uuid];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (id)log
{
  if (log_cn_once_token_20_37966 != -1) {
    dispatch_once(&log_cn_once_token_20_37966, &__block_literal_global_37967);
  }
  v2 = (void *)log_cn_once_object_20_37968;

  return v2;
}

void __33__CNPhotoAssetCreationHelper_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoAssetCreationHelper");
  v1 = (void *)log_cn_once_object_20_37968;
  log_cn_once_object_20_37968 = (uint64_t)v0;
}

@end