@interface PHAsset(MediaAnalysisVisualSearchProcessing)
+ (uint64_t)enableStickerScore;
- (BOOL)vcp_needsStickerGatingProcessing;
- (uint64_t)vcp_needsPECProcessing;
- (uint64_t)vcp_needsVisualSearchProcessing;
@end

@implementation PHAsset(MediaAnalysisVisualSearchProcessing)

+ (uint64_t)enableStickerScore
{
  return 1;
}

- (uint64_t)vcp_needsVisualSearchProcessing
{
  v2 = [a1 visualSearchProperties];
  uint64_t v3 = [v2 algorithmVersion];
  if (v3 >= (int)VCPPhotosVisualSearchAlgorithmVersion())
  {
    v5 = [v2 adjustmentVersion];
    if (v5)
    {
      v6 = [v2 adjustmentVersion];
      v7 = [a1 adjustmentVersion];
      uint64_t v4 = [v6 isEqualToDate:v7] ^ 1;
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)vcp_needsStickerGatingProcessing
{
  if (![MEMORY[0x1E4F38EC0] enableStickerScore]) {
    return 0;
  }
  v2 = [a1 visualSearchProperties];
  BOOL v3 = [v2 stickerAlgorithmVersion] < 1;

  return v3;
}

- (uint64_t)vcp_needsPECProcessing
{
  v2 = [a1 sceneAnalysisProperties];
  if ([v2 privateEncryptedComputeAnalysisVersion] == 5)
  {
    BOOL v3 = [v2 privateEncryptedComputeAnalysisTimestamp];
    uint64_t v4 = [a1 adjustmentVersion];
    int v5 = [v3 isEqualToDate:v4];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

@end