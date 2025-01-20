@interface LPStocksMetadataProviderSpecialization
+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
+ (unint64_t)specialization;
@end

@implementation LPStocksMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 4096;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 postRedirectURL];
  BOOL v10 = +[LPPresentationSpecializations isStockSymbolURL:v9];

  if (v10)
  {
    v11 = (void *)[v7 copy];
    v12 = objc_alloc_init(LPStocksMetadata);
    v13 = [v7 title];
    [(LPStocksMetadata *)v12 setCombinedTitle:v13];

    v14 = [v7 title];
    uint64_t v16 = [v14 rangeOfString:@" · " options:4];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v16 + v15 == [v14 length])
    {
      v17 = 0;
    }
    else
    {
      uint64_t v18 = objc_msgSend(v14, "substringFromIndex:");
      uint64_t v19 = [v14 substringToIndex:v16];

      v14 = (void *)v19;
      v17 = (void *)v18;
    }
    [(LPStocksMetadata *)v12 setTitle:v14];
    [(LPStocksMetadata *)v12 setSubtitle:v17];
    v20 = [v7 icon];
    [(LPStocksMetadata *)v12 setIcon:v20];

    v21 = LPLocalizedString(@"Stocks");
    [(LPStocksMetadata *)v12 setFootnote:v21];

    [v11 setSpecialization:v12];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __119__LPStocksMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v24[3] = &unk_1E5B04F80;
    id v25 = v11;
    id v26 = v8;
    id v22 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v24);
  }
  return v10;
}

uint64_t __119__LPStocksMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end