@interface MADPhotosAssetProcessingTask
- (BOOL)hasAdequateAssets:(unint64_t)a3;
- (NSSet)assetLocalIdentifiers;
- (int)status;
- (unint64_t)count;
- (unint64_t)p1AssetCount;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
@end

@implementation MADPhotosAssetProcessingTask

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  if (a4 == 1) {
    ++self->_p1AssetCount;
  }
}

- (BOOL)hasAdequateAssets:(unint64_t)a3
{
  return [(MADPhotosAssetProcessingTask *)self count] >= a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSSet)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)p1AssetCount
{
  return self->_p1AssetCount;
}

- (void).cxx_destruct
{
}

@end