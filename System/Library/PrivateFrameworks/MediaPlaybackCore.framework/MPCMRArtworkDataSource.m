@interface MPCMRArtworkDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (MPCMRArtworkDataSource)initWithController:(id)a3;
- (MPCMediaRemoteController)controller;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPCMRArtworkDataSource

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
  [v6 scaledFittingSize];
  double v10 = v9;
  double v12 = v11;
  v13 = [(MPCMRArtworkDataSource *)self controller];
  v14 = [v8 identifier];
  v15 = [v8 artworkIdentifier];
  v16 = objc_msgSend(v13, "contentItemArtworkForContentItemIdentifier:artworkIdentifier:size:", v14, v15, v10, v12);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__MPCMRArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v20[3] = &unk_2643C6728;
  id v21 = v6;
  id v22 = v7;
  double v23 = v10;
  double v24 = v12;
  id v17 = v6;
  id v18 = v7;
  id v19 = (id)[v16 onCompletion:v20];
}

void __80__MPCMRArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x263F11D40];
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a3;
  id v9 = a2;
  id v11 = [v7 visualIdenticalityIdentifier];
  double v10 = objc_msgSend(v5, "representationForVisualIdentity:withSize:image:", v11, v9, *(double *)(a1 + 48), *(double *)(a1 + 56));

  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v8);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)[a3 token];
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = [v4 token];
  [v4 scaledFittingSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(MPCMRArtworkDataSource *)self controller];
  id v11 = [v5 artworkIdentifier];
  uint64_t v12 = objc_msgSend(v10, "contentItemArtworkCacheStateForArtworkIdentifier:size:", v11, v7, v9);

  if (v12)
  {
    v13 = [v5 identifier];
    v14 = [v5 artworkIdentifier];
    v15 = objc_msgSend(v10, "contentItemArtworkForContentItemIdentifier:artworkIdentifier:size:", v13, v14, v7, v9);

    v16 = (void *)MEMORY[0x263F11D40];
    id v17 = [v4 visualIdenticalityIdentifier];
    id v18 = [v15 result];
    id v19 = objc_msgSend(v16, "representationForVisualIdentity:withSize:image:", v17, v18, v7, v9);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (MPCMRArtworkDataSource)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCMRArtworkDataSource;
  v5 = [(MPCMRArtworkDataSource *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

@end