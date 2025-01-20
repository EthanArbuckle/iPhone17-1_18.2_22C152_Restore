@interface DDSAssetDownloadAnalytic
- (DDSAsset)asset;
- (DDSAssetDownloadAnalytic)init;
- (DDSAssetDownloadAnalytic)initWithAsset:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation DDSAssetDownloadAnalytic

- (DDSAssetDownloadAnalytic)initWithAsset:(id)a3
{
  id v5 = a3;
  v6 = [v5 uniqueIdentifier];
  v9.receiver = self;
  v9.super_class = (Class)DDSAssetDownloadAnalytic;
  v7 = [(DDSTimedAnalytic *)&v9 initWithIdentifier:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_asset, a3);
  }

  return v7;
}

- (DDSAssetDownloadAnalytic)init
{
  return 0;
}

- (DDSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end