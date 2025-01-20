@interface PHRelatedFetchOptions
- (BOOL)enableDiversity;
- (BOOL)isDebugInfoEnabled;
- (NSArray)excludedAssetCollections;
- (PHAsset)referenceAsset;
- (PHPhotoLibrary)photoLibrary;
- (unint64_t)fetchLimit;
- (void)setDebugInfoEnabled:(BOOL)a3;
- (void)setEnableDiversity:(BOOL)a3;
- (void)setExcludedAssetCollections:(id)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setReferenceAsset:(id)a3;
@end

@implementation PHRelatedFetchOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);

  objc_storeStrong((id *)&self->_excludedAssetCollections, 0);
}

- (void)setDebugInfoEnabled:(BOOL)a3
{
  self->_debugInfoEnabled = a3;
}

- (BOOL)isDebugInfoEnabled
{
  return self->_debugInfoEnabled;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setEnableDiversity:(BOOL)a3
{
  self->_enableDiversity = a3;
}

- (BOOL)enableDiversity
{
  return self->_enableDiversity;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setReferenceAsset:(id)a3
{
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (void)setExcludedAssetCollections:(id)a3
{
}

- (NSArray)excludedAssetCollections
{
  return self->_excludedAssetCollections;
}

@end