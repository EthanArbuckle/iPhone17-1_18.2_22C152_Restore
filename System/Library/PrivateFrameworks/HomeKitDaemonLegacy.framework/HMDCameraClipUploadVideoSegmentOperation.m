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
  if (logCategory__hmf_once_t0_22993 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_22993, &__block_literal_global_22994);
  }
  v2 = (void *)logCategory__hmf_once_v1_22995;
  return v2;
}

uint64_t __55__HMDCameraClipUploadVideoSegmentOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_22995;
  logCategory__hmf_once_v1_22995 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
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