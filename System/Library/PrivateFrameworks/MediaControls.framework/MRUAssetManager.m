@interface MRUAssetManager
+ (MRUAssetManager)sharedManager;
- (BOOL)shouldLoadPhotorealisticAssetForRoute:(id)a3;
- (MRUAssetManager)init;
- (id)symbolImageForEndpointRoute:(id)a3;
- (void)imageForEndpointRoute:(id)a3 completion:(id)a4;
- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 completion:(id)a6;
- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 timeout:(double)a6 completion:(id)a7;
- (void)imageForModelIdentifier:(id)a3 color:(id)a4 completion:(id)a5;
- (void)imageForModelIdentifier:(id)a3 color:(id)a4 name:(id)a5 allowFallback:(BOOL)a6 timeout:(double)a7 completion:(id)a8;
- (void)imageForOutputDevice:(id)a3 completion:(id)a4;
@end

@implementation MRUAssetManager

+ (MRUAssetManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedManager_shared;

  return (MRUAssetManager *)v2;
}

void __32__MRUAssetManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MRUAssetManager);
  v1 = (void *)sharedManager_shared;
  sharedManager_shared = (uint64_t)v0;
}

- (MRUAssetManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUAssetManager;
  v2 = [(MRUAssetManager *)&v6 init];
  if (v2)
  {
    v3 = (SFDeviceAssetManager *)objc_alloc_init(MEMORY[0x1E4F9F6D0]);
    assetManager = v2->_assetManager;
    v2->_assetManager = v3;

    [(SFDeviceAssetManager *)v2->_assetManager activate];
  }
  return v2;
}

- (void)imageForEndpointRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRUAssetManager *)self symbolImageForEndpointRoute:v6];
  if ([(MRUAssetManager *)self shouldLoadPhotorealisticAssetForRoute:v6])
  {
    v9 = [v6 endpointObject];
    v10 = [v9 outputDevices];
    v11 = [v10 firstObject];

    v12 = [v11 modelID];
    v13 = [v11 deviceEnclosureColor];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__MRUAssetManager_imageForEndpointRoute_completion___block_invoke;
    v14[3] = &unk_1E5F0E860;
    id v16 = v7;
    id v15 = v8;
    [(MRUAssetManager *)self imageForModelIdentifier:v12 color:v13 allowFallback:0 completion:v14];
  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }
}

uint64_t __52__MRUAssetManager_imageForEndpointRoute_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)imageForOutputDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 modelID];
  v8 = [v7 deviceEnclosureColor];

  [(MRUAssetManager *)self imageForModelIdentifier:v9 color:v8 completion:v6];
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 completion:(id)a6
{
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 completion:(id)a5
{
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 timeout:(double)a6 completion:(id)a7
{
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 name:(id)a5 allowFallback:(BOOL)a6 timeout:(double)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [MEMORY[0x1E4F29128] UUID];
  v19 = [v18 UUIDString];

  v20 = MCLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v39 = v19;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 1024;
    BOOL v45 = v10;
    __int16 v46 = 2048;
    double v47 = a7;
    _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEBUG, "[AssetManager] Request<%@> Bundle for model: %@, color: %@, allow fallback? %{BOOL}u, timeout: %f", buf, 0x30u);
  }

  if (v15)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F9F6E0]);
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __87__MRUAssetManager_imageForModelIdentifier_color_name_allowFallback_timeout_completion___block_invoke;
    v31 = &unk_1E5F0E888;
    id v32 = v19;
    id v34 = v17;
    BOOL v35 = v10;
    id v33 = v16;
    v22 = (void *)[v21 initWithQueryResultHandler:&v28];
    objc_msgSend(v22, "setTimeout:", a7, v28, v29, v30, v31);
    id v23 = objc_alloc(MEMORY[0x1E4F9F6D8]);
    uint64_t v36 = *MEMORY[0x1E4F9F720];
    id v37 = v15;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v25 = (void *)[v23 initWithProductType:v14 additionalQueryParameters:v24];

    [(SFDeviceAssetManager *)self->_assetManager getAssetBundleForDeviceQuery:v25 withRequestConfiguration:v22];
    v26 = v32;
  }
  else
  {
    v27 = MCLogCategoryDefault();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_1AE7DF000, v27, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> No color provided, not requesting bundle", buf, 0xCu);
    }

    v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MRUAssetManagerErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v26);
  }
}

void __87__MRUAssetManager_imageForModelIdentifier_color_name_allowFallback_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v12 = MCLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v24 = 138413314;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 1024;
    int v31 = a4;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEBUG, "[AssetManager] Update<%@> Got bundle: %@, type: %@, fallback: %{BOOL}u, error: %@", (uint8_t *)&v24, 0x30u);
  }

  if (!v9)
  {
    v18 = MCLogCategoryDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v24 = 138412290;
      uint64_t v25 = v19;
      _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Failed to obtain bundle", (uint8_t *)&v24, 0xCu);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = 1;
    goto LABEL_15;
  }
  if (a4 && !*(unsigned char *)(a1 + 56))
  {
    v22 = MCLogCategoryDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v24 = 138412290;
      uint64_t v25 = v23;
      _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Fallback bundle not allowed", (uint8_t *)&v24, 0xCu);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = 2;
LABEL_15:
    id v16 = (void *)[v20 initWithDomain:@"MRUAssetManagerErrorDomain" code:v21 userInfo:0];
    id v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  id v14 = MCLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v24 = 138412290;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Bundle found", (uint8_t *)&v24, 0xCu);
  }

  id v16 = [MEMORY[0x1E4FB1818] imageNamed:*(void *)(a1 + 40) inBundle:v9 withConfiguration:0];
  id v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
  v17();
}

- (id)symbolImageForEndpointRoute:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F76FD0];
  v4 = [a3 endpointObject];
  v5 = [v4 outputDevices];
  id v6 = [v3 symbolNameForOutputDevices:v5];

  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];

  return v7;
}

- (BOOL)shouldLoadPhotorealisticAssetForRoute:(id)a3
{
  uint64_t v3 = [a3 endpointObject];
  v4 = [v3 outputDevices];

  v5 = [v4 firstObject];
  uint64_t v6 = [v4 count];
  int v7 = [v5 deviceSubtype];
  BOOL v9 = v6 == 1 && v7 == 12;

  return v9;
}

- (void).cxx_destruct
{
}

@end