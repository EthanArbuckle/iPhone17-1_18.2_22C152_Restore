@interface MSASAssetInfoToReauthForDownload
- (MSASAlbum)album;
- (MSAsset)asset;
- (void)setAlbum:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation MSASAssetInfoToReauthForDownload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setAlbum:(id)a3
{
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setAsset:(id)a3
{
}

- (MSAsset)asset
{
  return self->_asset;
}

@end