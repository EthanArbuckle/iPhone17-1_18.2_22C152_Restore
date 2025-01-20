@interface LPAppleTVMetadataProviderSpecialization
+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
+ (unint64_t)specialization;
@end

@implementation LPAppleTVMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 32;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 postRedirectURL];
  BOOL v10 = +[LPPresentationSpecializations isAppleTVURL:v9];

  if (v10)
  {
    v11 = (void *)[v7 copy];
    v12 = objc_alloc_init(LPAppleTVMetadata);
    v13 = [v7 title];
    [(LPAppleTVMetadata *)v12 setTitle:v13];

    v14 = [v7 appleSummary];
    [(LPAppleTVMetadata *)v12 setSubtitle:v14];

    v15 = [v7 image];
    [(LPAppleTVMetadata *)v12 setArtwork:v15];

    [v11 setSpecialization:v12];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __120__LPAppleTVMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v18[3] = &unk_1E5B04F80;
    id v19 = v11;
    id v20 = v8;
    id v16 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
  return v10;
}

uint64_t __120__LPAppleTVMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end