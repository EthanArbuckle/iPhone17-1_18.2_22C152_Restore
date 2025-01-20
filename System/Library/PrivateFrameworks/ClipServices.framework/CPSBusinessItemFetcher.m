@interface CPSBusinessItemFetcher
- (void)fetchBusinessMetadataForURL:(id)a3 availabilityHandler:(id)a4 completion:(id)a5;
- (void)fetchBusinessMetadataForURL:(id)a3 completion:(id)a4;
- (void)fetchBusinessMetadataForURLHash:(id)a3 completion:(id)a4;
@end

@implementation CPSBusinessItemFetcher

- (void)fetchBusinessMetadataForURL:(id)a3 completion:(id)a4
{
}

- (void)fetchBusinessMetadataForURL:(id)a3 availabilityHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_businessQueryService)
  {
    v11 = (BCSBusinessQueryService *)objc_alloc_init(MEMORY[0x263F2BD30]);
    businessQueryService = self->_businessQueryService;
    self->_businessQueryService = v11;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke;
  v21[3] = &unk_26424E4B8;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v24 = v14;
  id v15 = v10;
  id v25 = v15;
  v23 = self;
  v16 = (void *)MEMORY[0x2166BE5C0](v21);
  char v17 = objc_opt_respondsToSelector();
  v18 = self->_businessQueryService;
  if (v17)
  {
    [(BCSBusinessQueryService *)v18 isBusinessRegisteredForURL:v13 chopURL:1 completion:v16];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_8;
    v19[3] = &unk_26424E4E0;
    id v20 = v16;
    [(BCSBusinessQueryService *)v18 isBusinessRegisteredForURL:v13 completion:v19];
  }
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = @"NO";
    uint64_t v11 = *(void *)(a1 + 32);
    if (a2) {
      id v10 = @"YES";
    }
    *(_DWORD *)buf = 138740227;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "Remote Client: Has ABR entry for %{sensitive}@, %@", buf, 0x16u);
  }
  if (v8)
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_cold_1((uint64_t)v8, v12);
    }
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v7);
  }
  if (a2)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(*(void *)(a1 + 40) + 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_4;
    v16[3] = &unk_26424E490;
    id v18 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    [v15 fetchLinkItemWithURL:v14 completion:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_4_cold_1((uint64_t)v6, v7);
      if (v5) {
        goto LABEL_4;
      }
LABEL_10:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  if (!v5) {
    goto LABEL_10;
  }
LABEL_4:
  id v8 = [[CPSClipMetadata alloc] initWithBusinessItem:v5];
  id v9 = [(CPSClipMetadata *)v8 clipURL];

  if (!v9) {
    [(CPSClipMetadata *)v8 setClipURL:*(void *)(a1 + 32)];
  }
  id v10 = [(CPSClipMetadata *)v8 clipRequestURL];

  if (!v10) {
    [(CPSClipMetadata *)v8 setClipRequestURL:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_11:
}

uint64_t __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBusinessMetadataForURLHash:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  businessQueryService = self->_businessQueryService;
  if (!businessQueryService)
  {
    id v9 = (BCSBusinessQueryService *)objc_alloc_init(MEMORY[0x263F2BD30]);
    id v10 = self->_businessQueryService;
    self->_businessQueryService = v9;

    businessQueryService = self->_businessQueryService;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CPSBusinessItemFetcher_fetchBusinessMetadataForURLHash_completion___block_invoke;
  v12[3] = &unk_26424E508;
  id v13 = v7;
  id v11 = v7;
  [(BCSBusinessQueryService *)businessQueryService fetchLinkItemWithHash:v6 completion:v12];
}

void __69__CPSBusinessItemFetcher_fetchBusinessMetadataForURLHash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[CPSClipMetadata alloc] initWithBusinessItem:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "fetchBusinessMetadataForURL: Error calling -isBusinessRegisteredForURL: %@", (uint8_t *)&v2, 0xCu);
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "fetchBusinessMetadataForURL: Error calling -fetchLinkItemWithURL: %@", (uint8_t *)&v2, 0xCu);
}

@end