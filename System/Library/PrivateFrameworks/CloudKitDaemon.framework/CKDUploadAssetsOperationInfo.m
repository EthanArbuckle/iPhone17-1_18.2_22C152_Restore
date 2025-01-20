@interface CKDUploadAssetsOperationInfo
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)temporary;
- (NSArray)assetsToUpload;
- (NSDictionary)assetUUIDToExpectedProperties;
- (NSDictionary)cloneContextsBySignature;
- (NSDictionary)packageUUIDToExpectedProperties;
- (void)setAssetUUIDToExpectedProperties:(id)a3;
- (void)setAssetsToUpload:(id)a3;
- (void)setCloneContextsBySignature:(id)a3;
- (void)setPackageUUIDToExpectedProperties:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setTemporary:(BOOL)a3;
@end

@implementation CKDUploadAssetsOperationInfo

- (NSArray)assetsToUpload
{
  return self->_assetsToUpload;
}

- (void)setAssetsToUpload:(id)a3
{
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
}

- (BOOL)temporary
{
  return self->_temporary;
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (NSDictionary)cloneContextsBySignature
{
  return self->_cloneContextsBySignature;
}

- (void)setCloneContextsBySignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneContextsBySignature, 0);
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetsToUpload, 0);
}

@end