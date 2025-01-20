@interface HMDCameraClipUploadVideoSegmentOperation
+ (BOOL)shouldRetry;
+ (id)logCategory;
+ (id)metadataPropertyName;
+ (id)streamingAssetPropertyName;
+ (unint64_t)cameraClipOperationType;
@end

@implementation HMDCameraClipUploadVideoSegmentOperation

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_31575 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_31575, &__block_literal_global_31576);
  }
  v2 = (void *)logCategory__hmf_once_v1_31577;
  return v2;
}

void __55__HMDCameraClipUploadVideoSegmentOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_31577;
  logCategory__hmf_once_v1_31577 = v0;
}

+ (BOOL)shouldRetry
{
  return 1;
}

+ (id)metadataPropertyName
{
  return @"videoMetadataArray";
}

+ (id)streamingAssetPropertyName
{
  return @"videoStreamingAsset";
}

+ (unint64_t)cameraClipOperationType
{
  return 4;
}

@end