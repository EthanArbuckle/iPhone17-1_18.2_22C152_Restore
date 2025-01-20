@interface MSASCommentCheckOperation
- (NSString)albumGUID;
- (NSString)assetCollectionGUID;
- (void)setAlbumGUID:(id)a3;
- (void)setAssetCollectionGUID:(id)a3;
@end

@implementation MSASCommentCheckOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
}

- (void)setAssetCollectionGUID:(id)a3
{
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

@end