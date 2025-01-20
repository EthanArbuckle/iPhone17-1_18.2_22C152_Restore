@interface PHAsset(MediaAnalysisSceneProcessing)
- (id)vcp_confidenceForExtendedSceneIdentifier:()MediaAnalysisSceneProcessing;
- (uint64_t)vcp_abnormalImageDimensionForSceneNet;
- (uint64_t)vcp_needSceneProcessing;
@end

@implementation PHAsset(MediaAnalysisSceneProcessing)

- (uint64_t)vcp_needSceneProcessing
{
  v2 = [a1 sceneAnalysisProperties];
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    int v3 = [v2 sceneAnalysisVersion];
    if (VCPPhotosSceneProcessingVersionInternal() == v3)
    {
      v4 = [a1 mediaAnalysisProperties];
      if ([v4 imageEmbeddingVersion] != 70)
      {
        int v7 = 0;
        goto LABEL_10;
      }
      v5 = [v2 sceneAnalysisTimestamp];
      v6 = [a1 adjustmentVersion];
      int v7 = [v5 isEqualToDate:v6];

LABEL_7:
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    int v8 = [v2 sceneAnalysisVersion];
    if (VCPPhotosSceneProcessingVersionInternal() == v8)
    {
      v4 = [v2 sceneAnalysisTimestamp];
      v5 = [a1 adjustmentVersion];
      int v7 = [v4 isEqualToDate:v5];
      goto LABEL_7;
    }
  }
  int v7 = 0;
LABEL_11:

  return v7 ^ 1u;
}

- (id)vcp_confidenceForExtendedSceneIdentifier:()MediaAnalysisSceneProcessing
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [a1 sceneAnalysisProperties];
  int v6 = [v5 sceneAnalysisVersion];
  if (VCPPhotosSceneProcessingVersionInternal() != v6)
  {
    __int16 v7 = [v5 sceneAnalysisVersion];
    if (*MEMORY[0x1E4F8D118] != v7) {
      goto LABEL_13;
    }
  }
  int v8 = [v5 sceneAnalysisTimestamp];
  v9 = [a1 adjustmentVersion];
  int v10 = [v8 isEqualToDate:v9];

  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(a1, "sceneClassifications", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      v14 = &unk_1F15ED428;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v16 extendedSceneIdentifier] == a3)
          {
            v17 = NSNumber;
            [v16 confidence];
            v14 = objc_msgSend(v17, "numberWithDouble:");
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      v14 = &unk_1F15ED428;
    }
LABEL_16:
  }
  else
  {
LABEL_13:
    v14 = 0;
  }

  return v14;
}

- (uint64_t)vcp_abnormalImageDimensionForSceneNet
{
  BOOL v2 = (unint64_t)[a1 pixelWidth] <= 0x12A
    && (unint64_t)[a1 pixelHeight] < 0x12B;
  if ([a1 pixelHeight])
  {
    double v3 = (double)(unint64_t)[a1 pixelWidth];
    double v4 = v3 / (double)(unint64_t)[a1 pixelHeight];
  }
  else
  {
    double v4 = 1.0;
  }
  if (v4 > 0.5 && v4 < 2.0) {
    return v2;
  }
  else {
    return v2 | 2;
  }
}

@end