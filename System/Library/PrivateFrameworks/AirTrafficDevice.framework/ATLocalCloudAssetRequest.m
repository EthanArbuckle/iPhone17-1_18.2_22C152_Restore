@interface ATLocalCloudAssetRequest
- (ATAsset)asset;
- (NSFileHandle)fileHandle;
- (double)startTime;
- (void)setAsset:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation ATLocalCloudAssetRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setFileHandle:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setAsset:(id)a3
{
}

- (ATAsset)asset
{
  return self->_asset;
}

@end