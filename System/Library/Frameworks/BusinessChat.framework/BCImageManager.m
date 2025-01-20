@interface BCImageManager
- (BCImageManager)init;
- (void)_fetchBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6;
- (void)_fetchNavBarBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6;
@end

@implementation BCImageManager

- (BCImageManager)init
{
  v3 = objc_alloc_init(BCNetworkProvider);
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)BCImageManager;
    v5 = [(BCImageManager *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_networkProvider, v3);
    }
  }

  return self;
}

- (void)_fetchBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  v13 = LogCategory_Daemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[BCImageManager _fetchBrandIconDataForMapItem:desiredSize:allowSmaller:completion:]";
    _os_log_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    v14 = objc_msgSend(v11, "_bestBrandIconURLForSize:allowSmaller:", v7, width, height);
    v15 = (void *)[objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v14];
    if (self) {
      self = (BCImageManager *)self->_networkProvider;
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84__BCImageManager__fetchBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke;
    v16[3] = &unk_264852038;
    id v17 = v12;
    [(BCImageManager *)self performDataTaskWithRequest:v15 completionHandler:v16];
  }
}

void __84__BCImageManager__fetchBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  v8 = LogCategory_Daemon();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v11 = 138412290;
      uint64_t v12 = (uint64_t)v7;
      v10 = "Failed to fetch brand icon data: %@";
LABEL_6:
      _os_log_impl(&dword_228C26000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v9)
  {
    int v11 = 134217984;
    uint64_t v12 = [v6 length];
    v10 = "Fetched brand icon data with length: %ld";
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

- (void)_fetchNavBarBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = LogCategory_Daemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[BCImageManager _fetchNavBarBrandIconDataForMapItem:desiredSize:allowSmaller:completion:]";
    _os_log_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    v14 = objc_msgSend(v11, "_bestNavbarBrandIconURLForSize:allowSmaller:", v7, width, height);
    v15 = (void *)[objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v14];
    if (self) {
      self = (BCImageManager *)self->_networkProvider;
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __90__BCImageManager__fetchNavBarBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke;
    v16[3] = &unk_264852038;
    id v17 = v12;
    [(BCImageManager *)self performDataTaskWithRequest:v15 completionHandler:v16];
  }
}

void __90__BCImageManager__fetchNavBarBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  v8 = LogCategory_Daemon();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v11 = 138412290;
      uint64_t v12 = (uint64_t)v7;
      v10 = "Failed to fetch navbar brand icon data: %@";
LABEL_6:
      _os_log_impl(&dword_228C26000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v9)
  {
    int v11 = 134217984;
    uint64_t v12 = [v6 length];
    v10 = "Fetched navbar brand icon data with length: %ld";
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

- (void).cxx_destruct
{
}

@end