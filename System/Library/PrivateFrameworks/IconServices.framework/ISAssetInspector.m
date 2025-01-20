@interface ISAssetInspector
- (IFBundle)bundle;
- (ISAssetCatalogResource)assetCatalogResource;
- (ISAssetInspector)initWithBundleURL:(id)a3;
- (unint64_t)catalogAssetAppearances;
- (void)assetCatalogResource;
- (void)setAssetCatalogResource:(id)a3;
@end

@implementation ISAssetInspector

- (ISAssetInspector)initWithBundleURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAssetInspector;
  v5 = [(ISAssetInspector *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v4];
    bundle = v5->_bundle;
    v5->_bundle = (IFBundle *)v6;
  }
  return v5;
}

- (ISAssetCatalogResource)assetCatalogResource
{
  assetCatalogResource = self->_assetCatalogResource;
  if (!assetCatalogResource)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6F208]);
    v5 = [(ISAssetInspector *)self bundle];
    uint64_t v6 = [v5 infoDictionary];
    v7 = (void *)[v4 initWithInfoDictionary:v6];

    v8 = [v7 catalogAssetName];
    objc_super v9 = [(ISAssetInspector *)self bundle];
    v10 = [v9 assetCatalogURL];
    v11 = [(ISAssetInspector *)self bundle];
    id v17 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v10, v8, [v11 platform], &v17);
    v12 = (ISAssetCatalogResource *)objc_claimAutoreleasedReturnValue();
    id v13 = v17;

    if (!v12)
    {
      v14 = _ISDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(ISAssetInspector *)(uint64_t)v8 assetCatalogResource];
      }
    }
    v15 = self->_assetCatalogResource;
    self->_assetCatalogResource = v12;

    assetCatalogResource = self->_assetCatalogResource;
  }
  return assetCatalogResource;
}

- (IFBundle)bundle
{
  return (IFBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetCatalogResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCatalogResource, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (unint64_t)catalogAssetAppearances
{
  v3 = [(ISAssetInspector *)self assetCatalogResource];
  int v4 = [v3 hasResourceWithAppearance:0xFFFFLL];

  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  uint64_t v6 = [(ISAssetInspector *)self assetCatalogResource];
  int v7 = [v6 hasResourceWithAppearance:0];

  if (v7) {
    v5 |= 4uLL;
  }
  v8 = [(ISAssetInspector *)self assetCatalogResource];
  int v9 = [v8 hasResourceWithAppearance:1];

  if (v9) {
    uint64_t v10 = v5 | 8;
  }
  else {
    uint64_t v10 = v5;
  }
  v11 = [(ISAssetInspector *)self assetCatalogResource];
  int v12 = [v11 hasResourceWithAppearance:2];

  uint64_t v13 = v10 | 0x10;
  if (!v12) {
    uint64_t v13 = v10;
  }
  if (v13 == 1) {
    return 1;
  }
  else {
    return v13 ^ 1;
  }
}

- (void)assetCatalogResource
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to find resource with name '%@'. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end