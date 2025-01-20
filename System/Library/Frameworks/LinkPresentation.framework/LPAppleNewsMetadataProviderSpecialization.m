@interface LPAppleNewsMetadataProviderSpecialization
+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
+ (unint64_t)specialization;
@end

@implementation LPAppleNewsMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 64;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 postRedirectURL];
  if (+[LPPresentationSpecializations isAppleNewsURL:v10])
  {
  }
  else
  {
    v11 = [v8 postRedirectURL];
    BOOL v12 = +[LPPresentationSpecializations isStocksNewsURL:v11];

    if (!v12)
    {
      BOOL v16 = 0;
      goto LABEL_6;
    }
  }
  v13 = (void *)[v7 copy];
  v14 = objc_alloc_init(LPAppleNewsMetadata);
  [v13 setSpecialization:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __122__LPAppleNewsMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
  v18[3] = &unk_1E5B04F80;
  id v19 = v13;
  id v20 = v9;
  id v15 = v13;
  dispatch_async(MEMORY[0x1E4F14428], v18);

  BOOL v16 = 1;
LABEL_6:

  return v16;
}

uint64_t __122__LPAppleNewsMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end