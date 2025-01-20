@interface PHFeatureAvailabilityConfig
- (BOOL)needsPhotosKnowledgeGraph;
- (PHFeatureAvailabilityConfig)init;
- (PHFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3;
- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
- (double)fractionOfCuratedAssetsWithCaptionsThreshold;
- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
- (double)fractionOfHighlightsEnrichedThreshold;
- (unint64_t)minimumNumberOfCuratedAssets;
@end

@implementation PHFeatureAvailabilityConfig

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

- (BOOL)needsPhotosKnowledgeGraph
{
  return self->_needsPhotosKnowledgeGraph;
}

- (double)fractionOfHighlightsEnrichedThreshold
{
  return self->_fractionOfHighlightsEnrichedThreshold;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
}

- (double)fractionOfCuratedAssetsWithCaptionsThreshold
{
  return self->_fractionOfCuratedAssetsWithCaptionsThreshold;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
}

- (PHFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3
{
  v4 = [(PHFeatureAvailabilityConfig *)self init];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F8A808]) initWithFeature:a3];
    [v5 fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold];
    v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = v6;
    [v5 fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold];
    v4->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = v7;
    [v5 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
    v4->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = v8;
    [v5 fractionOfCuratedAssetsWithCaptionsThreshold];
    v4->_fractionOfCuratedAssetsWithCaptionsThreshold = v9;
    [v5 fractionOfHighlightsEnrichedThreshold];
    v4->_fractionOfHighlightsEnrichedThreshold = v10;
    v4->_minimumNumberOfCuratedAssets = [v5 minimumNumberOfCuratedAssets];
    v4->_needsPhotosKnowledgeGraph = [v5 needsPhotosKnowledgeGraph];
    v11 = v4;
  }
  return v4;
}

- (PHFeatureAvailabilityConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHFeatureAvailabilityConfig;
  v2 = [(PHFeatureAvailabilityConfig *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

@end