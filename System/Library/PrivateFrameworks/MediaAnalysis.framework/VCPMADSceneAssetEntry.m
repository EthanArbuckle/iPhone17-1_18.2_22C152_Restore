@interface VCPMADSceneAssetEntry
+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (BOOL)blurExposureRotationCompleted;
- (BOOL)needsEmbeddingProcessing;
- (BOOL)needsSceneProcessing;
- (BOOL)scenenetCompleted;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (PHAsset)asset;
- (VCPMADSceneAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (VCPMADSceneAssetEntryResults)results;
- (int)status;
- (unint64_t)previousAttempts;
- (unint64_t)previousStatus;
- (void)setBlurExposureRotationCompleted:(BOOL)a3;
- (void)setNeedsEmbeddingProcessing:(BOOL)a3;
- (void)setNeedsSceneProcessing:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setScenenetCompleted:(BOOL)a3;
- (void)setStatus:(int)a3;
@end

@implementation VCPMADSceneAssetEntry

- (VCPMADSceneAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADSceneAssetEntry;
  v13 = [(VCPMADSceneAssetEntry *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    v14->_status = 0;
    v14->_previousStatus = a4;
    v14->_previousAttempts = a5;
    objc_storeStrong((id *)&v14->_lastAttemptDate, a6);
    uint64_t v15 = +[NSDate now];
    currentAttemptDate = v14->_currentAttemptDate;
    v14->_currentAttemptDate = (NSDate *)v15;

    v17 = objc_alloc_init(VCPMADSceneAssetEntryResults);
    results = v14->_results;
    v14->_results = v17;

    v19 = [(PHAsset *)v14->_asset sceneAnalysisProperties];
    int v20 = [v19 sceneAnalysisVersion];

    if ((int)VCPPhotosSceneProcessingVersionInternal() > v20
      || PFPhotosSceneProcessingFromCameraVersion == (unsigned __int16)v20)
    {
      v14->_needsSceneProcessing = 1;
    }
    v21 = [(PHAsset *)v14->_asset mediaAnalysisProperties];
    int v22 = [v21 imageEmbeddingVersion];

    if (v22 <= 69
      && +[VCPVideoCNNAnalyzer isMUBackboneEnabled])
    {
      v14->_needsEmbeddingProcessing = 1;
    }
  }

  return v14;
}

+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v9 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v10];

  return v11;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)previousStatus
{
  return self->_previousStatus;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)previousAttempts
{
  return self->_previousAttempts;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSDate)currentAttemptDate
{
  return self->_currentAttemptDate;
}

- (BOOL)needsSceneProcessing
{
  return self->_needsSceneProcessing;
}

- (void)setNeedsSceneProcessing:(BOOL)a3
{
  self->_needsSceneProcessing = a3;
}

- (BOOL)needsEmbeddingProcessing
{
  return self->_needsEmbeddingProcessing;
}

- (void)setNeedsEmbeddingProcessing:(BOOL)a3
{
  self->_needsEmbeddingProcessing = a3;
}

- (BOOL)scenenetCompleted
{
  return self->_scenenetCompleted;
}

- (void)setScenenetCompleted:(BOOL)a3
{
  self->_scenenetCompleted = a3;
}

- (BOOL)blurExposureRotationCompleted
{
  return self->_blurExposureRotationCompleted;
}

- (void)setBlurExposureRotationCompleted:(BOOL)a3
{
  self->_blurExposureRotationCompleted = a3;
}

- (VCPMADSceneAssetEntryResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end