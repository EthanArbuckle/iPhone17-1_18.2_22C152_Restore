@interface LPAppStoreStoryMetadataProviderSpecialization
+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
+ (unint64_t)specialization;
@end

@implementation LPAppStoreStoryMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 512;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 postRedirectURL];
  BOOL v10 = +[LPPresentationSpecializations isAppStoreStoryURL:v9];

  if (v10)
  {
    v11 = (void *)[v7 copy];
    v12 = objc_alloc_init(LPAppStoreStoryMetadata);
    [v11 setSpecialization:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __126__LPAppStoreStoryMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v15[3] = &unk_1E5B04F80;
    id v16 = v11;
    id v17 = v8;
    id v13 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
  return v10;
}

uint64_t __126__LPAppStoreStoryMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end