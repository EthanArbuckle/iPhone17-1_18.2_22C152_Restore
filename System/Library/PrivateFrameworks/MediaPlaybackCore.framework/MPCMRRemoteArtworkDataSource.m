@interface MPCMRRemoteArtworkDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (MPCMRRemoteArtworkDataSource)initWithController:(id)a3;
- (MPCMediaRemoteController)controller;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPCMRRemoteArtworkDataSource

- (void).cxx_destruct
{
}

- (MPCMediaRemoteController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (MPCMediaRemoteController *)WeakRetained;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 token];
  v9 = [v8 storeArtworkCatalog];
  if (v9)
  {
    v10 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    [v10 loadRepresentationForArtworkCatalog:v9 completionHandler:v7];
  }
  else
  {
    [v6 scaledFittingSize];
    double v12 = v11;
    double v14 = v13;
    v15 = [(MPCMRRemoteArtworkDataSource *)self controller];
    v16 = [v8 identifier];
    v17 = [v8 artworkIdentifier];
    v18 = objc_msgSend(v15, "contentItemRemoteArtworkForContentItemIdentifier:artworkIdentifier:size:artworkFormat:", v16, v17, *MEMORY[0x263F11B80], v12, v14);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __86__MPCMRRemoteArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
    v20[3] = &unk_2643C6700;
    id v23 = v7;
    id v21 = v6;
    id v22 = v8;
    id v19 = (id)[v18 onCompletion:v20];
  }
}

void __86__MPCMRRemoteArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    uint64_t v7 = *MEMORY[0x263F11B80];
    uint64_t v24 = *MEMORY[0x263F11B80];
    v25[0] = v5;
    id v8 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    if (![v8 count])
    {
      v20 = 0;
      goto LABEL_15;
    }
    v9 = [v8 objectForKeyedSubscript:v7];
    v10 = v9;
    if (v9)
    {
      double v11 = [v9 artworkURLTemplateData];

      if (v11)
      {
        double v12 = (void *)MEMORY[0x263F08900];
        double v13 = [v10 artworkURLTemplateData];
        double v14 = [v12 JSONObjectWithData:v13 options:0 error:0];

        if (v14)
        {
          v15 = (void *)[objc_alloc(MEMORY[0x263F89310]) initWithArtworkResponseDictionary:v14];

          if (v15) {
            goto LABEL_11;
          }
        }
      }
      v16 = [v10 artworkURLString];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        v18 = NSURL;
        id v19 = [v10 artworkURLString];
        v20 = [v18 URLWithString:v19];

        if (!v20)
        {
LABEL_13:

LABEL_15:
          [*(id *)(a1 + 32) fittingSize];
          objc_msgSend(v20, "setFittingSize:");
          [*(id *)(a1 + 32) destinationScale];
          objc_msgSend(v20, "setDestinationScale:");
          [*(id *)(a1 + 40) setStoreArtworkCatalog:v20];
          id v23 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
          [v23 loadRepresentationForArtworkCatalog:v20 completionHandler:*(void *)(a1 + 48)];

          goto LABEL_16;
        }
        v15 = (void *)[objc_alloc(MEMORY[0x263F89310]) initWithArtworkURL:v20];

        if (v15)
        {
LABEL_11:
          id v21 = [MEMORY[0x263F12258] tokenWithImageArtworkInfo:v15];
          id v22 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
          v20 = (void *)[objc_alloc(MEMORY[0x263F11D30]) initWithToken:v21 dataSource:v22];

          goto LABEL_13;
        }
      }
    }
    v20 = 0;
    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 storeArtworkCatalog];
  if (v4)
  {
    id v5 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    id v6 = [v5 visualIdenticalityIdentifierForCatalog:v4];
  }
  else
  {
    id v6 = [v3 identifier];
  }

  return v6;
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v5 = [a3 token];
  v3 = [v5 storeArtworkCatalog];
  if (v3)
  {
    v4 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    [v4 cancelLoadingRepresentationForArtworkCatalog:v3];
  }
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 storeArtworkCatalog];
  if (v4)
  {
    id v5 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    id v6 = [v5 existingRepresentationForArtworkCatalog:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5 = a3;
  id v6 = [a4 token];
  uint64_t v7 = [v6 storeArtworkCatalog];
  if (v7)
  {
    id v8 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    char v9 = [v8 isRepresentation:v5 bestRepresentationForArtworkCatalog:v7];
  }
  else
  {
    char v9 = v5 != 0;
  }

  return v9;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 storeArtworkCatalog];
  if (v4)
  {
    id v5 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    char v6 = [v5 areRepresentationsAvailableForCatalog:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (MPCMRRemoteArtworkDataSource)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCMRRemoteArtworkDataSource;
  id v5 = [(MPCMRRemoteArtworkDataSource *)&v8 init];
  char v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

@end