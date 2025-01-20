@interface JTAssetMediaItem
- (BOOL)isEqual:(id)a3;
- (JTAssetMediaItem)init;
- (JTAssetMediaItem)initWithAssetIdentifier:(id)a3;
- (JTAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4;
- (NSString)adjustedFingerprint;
- (NSString)assetIdentifier;
- (NSString)masterFingerprint;
- (NSURL)assetLocalURL;
- (PHAsset)asset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)info;
- (unint64_t)hash;
- (void)checkIfAssetIsMissing;
- (void)dealloc;
- (void)fetchAssetForce:(BOOL)a3;
- (void)reloadAsset;
- (void)setAdjustedFingerprint:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setAssetLocalURL:(id)a3;
- (void)setMasterFingerprint:(id)a3;
@end

@implementation JTAssetMediaItem

- (JTAssetMediaItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)JTAssetMediaItem;
  v2 = [(JFXMediaItem *)&v7 init];
  v3 = v2;
  if (v2)
  {
    assetLocalURL = v2->_assetLocalURL;
    v2->_assetLocalURL = 0;

    assetIdentifier = v3->_assetIdentifier;
    v3->_assetIdentifier = 0;
  }
  return v3;
}

- (JTAssetMediaItem)initWithAssetIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JTAssetMediaItem;
  v5 = [(JFXMediaItem *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(JTAssetMediaItem *)v5 setAssetIdentifier:v4];
    [(JTAssetMediaItem *)v6 setAssetLocalURL:0];
    [(JTAssetMediaItem *)v6 fetchAssetForce:0];
  }

  return v6;
}

- (void)fetchAssetForce:(BOOL)a3
{
  BOOL v3 = a3;
  v35[1] = *MEMORY[0x263EF8340];
  v5 = [(JTAssetMediaItem *)self asset];

  if (!v5 || v3)
  {
    v6 = (void *)MEMORY[0x263F14D18];
    objc_super v7 = [(JTAssetMediaItem *)self assetIdentifier];
    v35[0] = v7;
    objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    v9 = [v6 fetchAssetsWithLocalIdentifiers:v8 options:0];

    if (v9 && [v9 count])
    {
      v10 = [v9 objectAtIndex:0];
      [(JTAssetMediaItem *)self setAsset:v10];

      v11 = (void *)MEMORY[0x263F14D18];
      v12 = [(JTAssetMediaItem *)self asset];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __36__JTAssetMediaItem_fetchAssetForce___block_invoke;
      v34[3] = &unk_264C0CD70;
      v34[4] = self;
      [v11 _computeFingerPrintsOfAsset:v12 completionHandler:v34];

LABEL_22:
      return;
    }
    v13 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
    v14 = (void *)MEMORY[0x263F14D18];
    v15 = [(JTAssetMediaItem *)self adjustedFingerprint];
    v16 = [v14 fetchAssetsMatchingAdjustedFingerPrint:v15 photoLibrary:v13];

    v17 = [(JTAssetMediaItem *)self adjustedFingerprint];
    v18 = v17;
    if (v17 && v16)
    {
      uint64_t v19 = [v16 count];

      if (v19)
      {
        v20 = [v16 objectAtIndex:0];
        [(JTAssetMediaItem *)self setAsset:v20];
LABEL_21:

        v9 = v16;
        goto LABEL_22;
      }
    }
    else
    {
    }
    v21 = (void *)MEMORY[0x263F14D18];
    v22 = [(JTAssetMediaItem *)self masterFingerprint];
    v23 = [v21 fetchAssetsMatchingMasterFingerPrint:v22 photoLibrary:v13];

    v24 = [(JTAssetMediaItem *)self masterFingerprint];
    v25 = v24;
    if (v24 && v23)
    {
      uint64_t v26 = [v23 count];

      if (v26)
      {
        v20 = [v23 objectAtIndex:0];
        [(JTAssetMediaItem *)self setAsset:v20];
LABEL_20:
        v16 = v23;
        goto LABEL_21;
      }
    }
    else
    {
    }
    v20 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:1000000201 options:0];
    if ([v20 count])
    {
      v27 = [v20 firstObject];
      id v28 = objc_alloc_init(MEMORY[0x263F14E18]);
      [v28 setWantsIncrementalChangeDetails:0];
      [v28 setIncludeHiddenAssets:1];
      v29 = (void *)MEMORY[0x263F08A98];
      v30 = [(JTAssetMediaItem *)self assetIdentifier];
      v31 = [v29 predicateWithFormat:@"localIdentifier = %@", v30];
      [v28 setPredicate:v31];

      v16 = [MEMORY[0x263F14D18] fetchAssetsInAssetCollection:v27 options:v28];

      v32 = [v16 firstObject];
      [(JTAssetMediaItem *)self setAsset:v32];

      v33 = [(JTAssetMediaItem *)self asset];

      if (v33) {
        [(JFXMediaItem *)self setMediaState:3];
      }

      goto LABEL_21;
    }
    goto LABEL_20;
  }
}

void __36__JTAssetMediaItem_fetchAssetForce___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setMasterFingerprint:a2];
  [*(id *)(a1 + 32) setAdjustedFingerprint:v6];
}

- (void)checkIfAssetIsMissing
{
  uint64_t v3 = [(JTAssetMediaItem *)self assetIdentifier];
  if (v3 && (id v4 = (void *)v3, v5 = [(JFXMediaItem *)self mediaState], v4, v5 != 3))
  {
    v10 = [(JTAssetMediaItem *)self asset];

    if (!v10)
    {
      [(JFXMediaItem *)self setMediaState:2];
    }
  }
  else
  {
    id v6 = [(JTLocalAssetMediaItem *)self localFileURL];

    if (v6)
    {
      id v11 = objc_alloc_init(MEMORY[0x263F08850]);
      objc_super v7 = [(JTLocalAssetMediaItem *)self localFileURL];
      objc_super v8 = [v7 path];
      char v9 = [v11 fileExistsAtPath:v8];

      if ((v9 & 1) == 0) {
        [(JFXMediaItem *)self setMediaState:2];
      }
    }
  }
}

- (void)reloadAsset
{
  uint64_t v3 = [(JTAssetMediaItem *)self assetIdentifier];

  if (v3)
  {
    [(JFXMediaItem *)self setMediaState:1];
    [(JTAssetMediaItem *)self fetchAssetForce:1];
    [(JTAssetMediaItem *)self checkIfAssetIsMissing];
    id v4 = [(JTAssetMediaItem *)self asset];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__JTAssetMediaItem_reloadAsset__block_invoke;
    v5[3] = &unk_264C0CD98;
    v5[4] = self;
    [v4 isAssetLocalWithCompletion:v5 requiresDerivative:0];
  }
}

void __31__JTAssetMediaItem_reloadAsset__block_invoke(uint64_t a1, int a2)
{
  if (a2 && [*(id *)(a1 + 32) mediaState] != 3)
  {
    int64_t v5 = *(void **)(a1 + 32);
    [v5 setMediaState:0];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 setMediaItemRequiresDownload:*(void *)(a1 + 32)];
    }
  }
}

- (void)dealloc
{
  assetLocalURL = self->_assetLocalURL;
  self->_assetLocalURL = 0;

  asset = self->_asset;
  self->_asset = 0;

  v5.receiver = self;
  v5.super_class = (Class)JTAssetMediaItem;
  [(JTLocalAssetMediaItem *)&v5 dealloc];
}

- (id)description
{
  if (self->_assetLocalURL)
  {
    v8.receiver = self;
    v8.super_class = (Class)JTAssetMediaItem;
    uint64_t v3 = [(JTLocalAssetMediaItem *)&v8 description];
    [NSString stringWithFormat:@"\r\turl: %@", self->_assetLocalURL];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)JTAssetMediaItem;
    uint64_t v3 = [(JTLocalAssetMediaItem *)&v7 description];
    [NSString stringWithFormat:@"\r\tasset: %@", self->_asset];
  char v4 = };
  objc_super v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)JTAssetMediaItem;
  objc_super v5 = -[JTLocalAssetMediaItem copyWithZone:](&v22, sel_copyWithZone_);
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier)
  {
    uint64_t v7 = [(NSString *)assetIdentifier copyWithZone:a3];
    objc_super v8 = (void *)v5[10];
    v5[10] = v7;
  }
  else
  {
    objc_super v8 = (void *)v5[10];
    v5[10] = 0;
  }

  adjustedFingerprint = self->_adjustedFingerprint;
  if (adjustedFingerprint)
  {
    uint64_t v10 = [(NSString *)adjustedFingerprint copyWithZone:a3];
    id v11 = (void *)v5[12];
    v5[12] = v10;
  }
  else
  {
    id v11 = (void *)v5[12];
    v5[12] = 0;
  }

  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint)
  {
    uint64_t v13 = [(NSString *)masterFingerprint copyWithZone:a3];
    v14 = (void *)v5[11];
    v5[11] = v13;
  }
  else
  {
    v14 = (void *)v5[11];
    v5[11] = 0;
  }

  asset = self->_asset;
  if (asset)
  {
    uint64_t v16 = [(PHAsset *)asset copyWithZone:a3];
    v17 = (void *)v5[9];
    v5[9] = v16;
  }
  else
  {
    v17 = (void *)v5[9];
    v5[9] = 0;
  }

  assetLocalURL = self->_assetLocalURL;
  if (assetLocalURL)
  {
    uint64_t v19 = [(NSURL *)assetLocalURL copyWithZone:a3];
    v20 = (void *)v5[13];
    v5[13] = v19;
  }
  else
  {
    v20 = (void *)v5[13];
    v5[13] = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (JTAssetMediaItem *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      id v6 = [(JTAssetMediaItem *)self asset];

      if (v6)
      {
        uint64_t v7 = [(JTAssetMediaItem *)self asset];
        objc_super v8 = [(JTAssetMediaItem *)v5 asset];
        unsigned __int8 v9 = [v7 isEqual:v8];
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)JTAssetMediaItem;
        unsigned __int8 v9 = [(JTLocalAssetMediaItem *)&v11 isEqual:v5];
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(JTAssetMediaItem *)self assetIdentifier];
  if (v3) {
    [(JTAssetMediaItem *)self assetIdentifier];
  }
  else {
  char v4 = [(JTAssetMediaItem *)self assetLocalURL];
  }
  unint64_t v5 = [v4 hash];

  return v5;
}

- (JTAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)JTAssetMediaItem;
  id v5 = a3;
  id v6 = [(JTLocalAssetMediaItem *)&v14 initWithInfo:v5 delegate:a4];
  uint64_t v7 = objc_msgSend(v5, "objectForKey:", kAssetIdentiferKey, v14.receiver, v14.super_class);
  assetIdentifier = v6->_assetIdentifier;
  v6->_assetIdentifier = (NSString *)v7;

  uint64_t v9 = [v5 objectForKey:kAssetMasterFingerprintKey];
  masterFingerprint = v6->_masterFingerprint;
  v6->_masterFingerprint = (NSString *)v9;

  uint64_t v11 = [v5 objectForKey:kAssetAdjustedFingerprintKey];

  adjustedFingerprint = v6->_adjustedFingerprint;
  v6->_adjustedFingerprint = (NSString *)v11;

  return v6;
}

- (id)info
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = self;
  v10.super_class = (Class)JTAssetMediaItem;
  char v4 = [(JTLocalAssetMediaItem *)&v10 info];
  id v5 = [v3 dictionaryWithDictionary:v4];

  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier) {
    [v5 setObject:assetIdentifier forKey:kAssetIdentiferKey];
  }
  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint) {
    [v5 setObject:masterFingerprint forKey:kAssetMasterFingerprintKey];
  }
  adjustedFingerprint = self->_adjustedFingerprint;
  if (adjustedFingerprint) {
    [v5 setObject:adjustedFingerprint forKey:kAssetAdjustedFingerprintKey];
  }
  return v5;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)masterFingerprint
{
  return self->_masterFingerprint;
}

- (void)setMasterFingerprint:(id)a3
{
}

- (NSString)adjustedFingerprint
{
  return self->_adjustedFingerprint;
}

- (void)setAdjustedFingerprint:(id)a3
{
}

- (NSURL)assetLocalURL
{
  return self->_assetLocalURL;
}

- (void)setAssetLocalURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalURL, 0);
  objc_storeStrong((id *)&self->_adjustedFingerprint, 0);
  objc_storeStrong((id *)&self->_masterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end