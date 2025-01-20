@interface MPCMRLegacyRemoteArtworkDataSource
+ (MPCMRLegacyRemoteArtworkDataSource)sharedDataSource;
+ (id)bestArtworkSizes;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (id)_urlForCatalog:(id)a3 size:(CGSize)a4;
- (id)requestForCatalog:(id)a3 size:(CGSize)a4;
- (id)supportedSizesForCatalog:(id)a3;
- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPCMRLegacyRemoteArtworkDataSource

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, void *, void))a4;
  id v7 = [a3 token];
  v6 = [v7 artworkProperties];
  v5[2](v5, v6, 0);
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  v4 = -[MPCMRLegacyRemoteArtworkDataSource _urlForCatalog:size:](self, "_urlForCatalog:size:", a3, a4.width, a4.height);
  v5 = [MEMORY[0x263F08BD8] requestWithURL:v4 cachePolicy:0 timeoutInterval:60.0];

  return v5;
}

- (id)_urlForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  MSVGetMaximumScreenSize();
  if (height >= width) {
    double v9 = height;
  }
  else {
    double v9 = width;
  }
  if (v8 >= v7) {
    double v7 = v8;
  }
  if (v9 > v7
    || (width == *MEMORY[0x263F001B0] ? (BOOL v10 = height == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v10 = 0), v10))
  {
    MSVGetMaximumScreenSize();
    double width = v11;
    double height = v12;
  }
  v13 = [v6 token];
  v14 = [v13 artworkProperties];
  v15 = [v14 artworkInfo];

  v16 = objc_msgSend(v15, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", *MEMORY[0x263F88FB0], *MEMORY[0x263F88FC8], MSVDeviceSupportsExtendedColorDisplay(), width, height);

  return v16;
}

- (id)supportedSizesForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 artworkProperties];
  v5 = [v4 artworkInfo];
  id v6 = [v5 sizeInfo];

  uint64_t v7 = [v6 type];
  if (v7 == 2)
  {
    v18 = [v6 supportedSizes];
    if ([v18 count])
    {
      int v19 = [v6 hasMaxSupportedSize];

      if (v19)
      {
        v20 = [v6 supportedSizes];
        [v6 maxSupportedSize];
        v13 = _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(v20, v21, v22);

        if ([v13 count])
        {
          id v23 = v13;
        }
        else
        {
          id v23 = +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes];
        }
        v24 = v23;
        goto LABEL_16;
      }
    }
    else
    {
    }
LABEL_11:
    v24 = +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes];
    goto LABEL_17;
  }
  if (v7 != 1 || ![v6 hasMaxSupportedSize]) {
    goto LABEL_11;
  }
  double v8 = [MEMORY[0x263F11D38] systemConfiguration];
  double v9 = [v3 artworkProperties];
  uint64_t v10 = [v9 mediaType];
  double v11 = [v3 artworkProperties];
  double v12 = objc_msgSend(v8, "supportedSizesForMediaType:artworkType:", v10, objc_msgSend(v11, "mediaLibraryArtworkType"));
  v13 = [v12 allObjects];

  [v6 maxSupportedSize];
  v16 = _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(v13, v14, v15);
  if ([v16 count])
  {
    id v17 = v16;
  }
  else
  {
    id v17 = +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes];
  }
  v24 = v17;

LABEL_16:
LABEL_17:

  return v24;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 artworkProperties];
  char v5 = [v4 isValid];

  return v5;
}

+ (id)bestArtworkSizes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1.79769313e308, 1.79769313e308);
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (MPCMRLegacyRemoteArtworkDataSource)sharedDataSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MPCMRLegacyRemoteArtworkDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken != -1) {
    dispatch_once(&sharedDataSource_onceToken, block);
  }
  v2 = (void *)sharedDataSource___sharedDataSource;

  return (MPCMRLegacyRemoteArtworkDataSource *)v2;
}

void __54__MPCMRLegacyRemoteArtworkDataSource_sharedDataSource__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDataSource___sharedDataSource;
  sharedDataSource___sharedDataSource = (uint64_t)v1;
}

@end