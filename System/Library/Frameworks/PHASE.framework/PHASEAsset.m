@interface PHASEAsset
+ (PHASEAsset)new;
- (NSString)identifier;
- (NSString)owningDataBundleIdentifier;
- (NSString)uid;
- (PHASEAsset)init;
- (PHASEAsset)initWithUID:(id)a3 assetRegistry:(id)a4;
- (PHASEAssetRegistry)assetRegistry;
- (unint64_t)sizeInBytes;
- (void)setAssetRegistry:(id)a3;
- (void)setOwningDataBundleIdentifier:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation PHASEAsset

- (PHASEAsset)init
{
  return 0;
}

+ (PHASEAsset)new
{
  return 0;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
}

- (PHASEAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHASEAsset;
  v9 = [(PHASEAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_assetRegistry, v8);
  }

  return v10;
}

- (unint64_t)sizeInBytes
{
  return 0;
}

- (void)setOwningDataBundleIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PHASEAssetRegistry)assetRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetRegistry);

  return (PHASEAssetRegistry *)WeakRetained;
}

- (void)setAssetRegistry:(id)a3
{
}

- (NSString)owningDataBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningDataBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_assetRegistry);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end