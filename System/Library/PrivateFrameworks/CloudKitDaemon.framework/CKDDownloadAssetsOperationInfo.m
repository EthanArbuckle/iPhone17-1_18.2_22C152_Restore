@interface CKDDownloadAssetsOperationInfo
- (BOOL)fetchingAssetsForRereference;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldFetchAssetContentInMemory;
- (NSArray)assetURLInfosToFillOut;
- (NSArray)assetsToDownload;
- (NSArray)assetsToDownloadInMemory;
- (id)cloneContextReturnBlock;
- (void)setAssetURLInfosToFillOut:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setAssetsToDownloadInMemory:(id)a3;
- (void)setCloneContextReturnBlock:(id)a3;
- (void)setFetchingAssetsForRereference:(BOOL)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
@end

@implementation CKDDownloadAssetsOperationInfo

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (NSArray)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (BOOL)fetchingAssetsForRereference
{
  return self->_fetchingAssetsForRereference;
}

- (void)setFetchingAssetsForRereference:(BOOL)a3
{
  self->_fetchingAssetsForRereference = a3;
}

- (id)cloneContextReturnBlock
{
  return self->_cloneContextReturnBlock;
}

- (void)setCloneContextReturnBlock:(id)a3
{
}

- (NSArray)assetsToDownloadInMemory
{
  return self->_assetsToDownloadInMemory;
}

- (void)setAssetsToDownloadInMemory:(id)a3
{
}

- (NSArray)assetURLInfosToFillOut
{
  return self->_assetURLInfosToFillOut;
}

- (void)setAssetURLInfosToFillOut:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, 0);
  objc_storeStrong(&self->_cloneContextReturnBlock, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end