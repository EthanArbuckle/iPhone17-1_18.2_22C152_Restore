@interface CDMAssetFactorToFolders
- (CDMAssetFactorToFolders)initWithAssetFactorToFoldersMapping:(id)a3;
- (NSDictionary)assetFactorToFoldersMapping;
- (id)getAssetFactorToFoldersMapping;
@end

@implementation CDMAssetFactorToFolders

- (void).cxx_destruct
{
}

- (NSDictionary)assetFactorToFoldersMapping
{
  return self->_assetFactorToFoldersMapping;
}

- (id)getAssetFactorToFoldersMapping
{
  return self->_assetFactorToFoldersMapping;
}

- (CDMAssetFactorToFolders)initWithAssetFactorToFoldersMapping:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMAssetFactorToFolders;
  v6 = [(CDMAssetFactorToFolders *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetFactorToFoldersMapping, a3);
  }

  return v7;
}

@end