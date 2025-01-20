@interface MPCModelGenericAVItemHomeSharingLoadOperation
- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties;
- (id)responseHandler;
- (void)execute;
- (void)setAssetLoadProperties:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPCModelGenericAVItemHomeSharingLoadOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setAssetLoadProperties:(id)a3
{
}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)execute
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MPCModelGenericAVItemHomeSharingLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_2643C54E0;
  aBlock[4] = self;
  v3 = (void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, void))_Block_copy(aBlock);
  v4 = [(MPCModelGenericAVItemHomeSharingLoadOperation *)self assetLoadProperties];
  v5 = [v4 homeSharingAsset];
  if ([v5 isAvailable])
  {
    v6 = [v5 URL];
    if (v6)
    {
      v7 = objc_alloc_init(MPCModelGenericAVItemAssetLoadResult);
      [(MPCModelGenericAVItemAssetLoadResult *)v7 setAssetURL:v6];
      v8 = [v6 pathExtension];
      [(MPCModelGenericAVItemAssetLoadResult *)v7 setAssetPathExtension:v8];

      [(MPCModelGenericAVItemAssetLoadResult *)v7 setAssetQualityType:2];
      v9 = [v5 protectedContentSupportStorageFileURL];
      [(MPCModelGenericAVItemAssetLoadResult *)v7 setProtectedContentSupportStorageFileURL:v9];

      [(MPCModelGenericAVItemAssetLoadResult *)v7 setIsHomeSharingAsset:1];
      [(MPCModelGenericAVItemAssetLoadResult *)v7 setSource:2];
      v3[2](v3, v7, 0);
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:23 userInfo:0];
      ((void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, MPCModelGenericAVItemAssetLoadResult *))v3)[2](v3, 0, v7);
    }
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:24 userInfo:0];
    ((void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, void *))v3)[2](v3, 0, v6);
  }
}

void __56__MPCModelGenericAVItemHomeSharingLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[35];
  id v10 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 280);
    *(void *)(v8 + 280) = 0;

    id v5 = v10;
    v6 = *(void **)(a1 + 32);
  }
  [v6 finishWithError:v5];
}

@end