@interface VCPMADSceneAssetEntryResults
- (CGRect)acceptableCropRect;
- (CGRect)preferredCropRect;
- (NSArray)objectSaliencyRects;
- (NSData)colorNormalizationData;
- (NSData)duplicateMatchingAlternateFeature;
- (NSData)duplicateMatchingFeature;
- (NSData)sceneprintData;
- (NSDictionary)embeddingResults;
- (NSSet)sceneClassifications;
- (float)blurrinessScore;
- (float)exposureScore;
- (float)failureScore;
- (float)harmoniousColorScore;
- (float)iconicScore;
- (float)immersivenessScore;
- (float)interestingSubjectScore;
- (float)intrusiveObjectPresenceScore;
- (float)livelyColorScore;
- (float)lowLight;
- (float)noiseScore;
- (float)overallAestheticScore;
- (float)pleasantCameraTiltScore;
- (float)pleasantCompositionScore;
- (float)pleasantLightingScore;
- (float)pleasantPatternScore;
- (float)pleasantPerspectiveScore;
- (float)pleasantPostProcessingScore;
- (float)pleasantReflectionsScore;
- (float)pleasantSymmetryScore;
- (float)probableRotationDirectionConfidence;
- (float)sharplyFocusedSubjectScore;
- (float)tastefullyBlurredScore;
- (float)wallpaperScore;
- (float)wellChosenSubjectScore;
- (float)wellFramedSubjectScore;
- (float)wellTimedShotScore;
- (signed)probableRotationDirection;
- (void)setAcceptableCropRect:(CGRect)a3;
- (void)setBlurrinessScore:(float)a3;
- (void)setColorNormalizationData:(id)a3;
- (void)setDuplicateMatchingAlternateFeature:(id)a3;
- (void)setDuplicateMatchingFeature:(id)a3;
- (void)setEmbeddingResults:(id)a3;
- (void)setExposureScore:(float)a3;
- (void)setFailureScore:(float)a3;
- (void)setHarmoniousColorScore:(float)a3;
- (void)setIconicScore:(float)a3;
- (void)setImmersivenessScore:(float)a3;
- (void)setInterestingSubjectScore:(float)a3;
- (void)setIntrusiveObjectPresenceScore:(float)a3;
- (void)setLivelyColorScore:(float)a3;
- (void)setLowLight:(float)a3;
- (void)setNoiseScore:(float)a3;
- (void)setObjectSaliencyRects:(id)a3;
- (void)setOverallAestheticScore:(float)a3;
- (void)setPleasantCameraTiltScore:(float)a3;
- (void)setPleasantCompositionScore:(float)a3;
- (void)setPleasantLightingScore:(float)a3;
- (void)setPleasantPatternScore:(float)a3;
- (void)setPleasantPerspectiveScore:(float)a3;
- (void)setPleasantPostProcessingScore:(float)a3;
- (void)setPleasantReflectionsScore:(float)a3;
- (void)setPleasantSymmetryScore:(float)a3;
- (void)setPreferredCropRect:(CGRect)a3;
- (void)setProbableRotationDirection:(signed __int16)a3;
- (void)setProbableRotationDirectionConfidence:(float)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setSceneprintData:(id)a3;
- (void)setSharplyFocusedSubjectScore:(float)a3;
- (void)setTastefullyBlurredScore:(float)a3;
- (void)setWallpaperScore:(float)a3;
- (void)setWellChosenSubjectScore:(float)a3;
- (void)setWellFramedSubjectScore:(float)a3;
- (void)setWellTimedShotScore:(float)a3;
@end

@implementation VCPMADSceneAssetEntryResults

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (float)overallAestheticScore
{
  return self->_overallAestheticScore;
}

- (void)setOverallAestheticScore:(float)a3
{
  self->_overallAestheticScore = a3;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (void)setWellFramedSubjectScore:(float)a3
{
  self->_wellFramedSubjectScore = a3;
}

- (float)wellChosenSubjectScore
{
  return self->_wellChosenSubjectScore;
}

- (void)setWellChosenSubjectScore:(float)a3
{
  self->_wellChosenSubjectScore = a3;
}

- (float)tastefullyBlurredScore
{
  return self->_tastefullyBlurredScore;
}

- (void)setTastefullyBlurredScore:(float)a3
{
  self->_tastefullyBlurredScore = a3;
}

- (float)sharplyFocusedSubjectScore
{
  return self->_sharplyFocusedSubjectScore;
}

- (void)setSharplyFocusedSubjectScore:(float)a3
{
  self->_sharplyFocusedSubjectScore = a3;
}

- (float)wellTimedShotScore
{
  return self->_wellTimedShotScore;
}

- (void)setWellTimedShotScore:(float)a3
{
  self->_wellTimedShotScore = a3;
}

- (float)pleasantLightingScore
{
  return self->_pleasantLightingScore;
}

- (void)setPleasantLightingScore:(float)a3
{
  self->_pleasantLightingScore = a3;
}

- (float)pleasantReflectionsScore
{
  return self->_pleasantReflectionsScore;
}

- (void)setPleasantReflectionsScore:(float)a3
{
  self->_pleasantReflectionsScore = a3;
}

- (float)harmoniousColorScore
{
  return self->_harmoniousColorScore;
}

- (void)setHarmoniousColorScore:(float)a3
{
  self->_harmoniousColorScore = a3;
}

- (float)livelyColorScore
{
  return self->_livelyColorScore;
}

- (void)setLivelyColorScore:(float)a3
{
  self->_livelyColorScore = a3;
}

- (float)pleasantSymmetryScore
{
  return self->_pleasantSymmetryScore;
}

- (void)setPleasantSymmetryScore:(float)a3
{
  self->_pleasantSymmetryScore = a3;
}

- (float)pleasantPatternScore
{
  return self->_pleasantPatternScore;
}

- (void)setPleasantPatternScore:(float)a3
{
  self->_pleasantPatternScore = a3;
}

- (float)immersivenessScore
{
  return self->_immersivenessScore;
}

- (void)setImmersivenessScore:(float)a3
{
  self->_immersivenessScore = a3;
}

- (float)pleasantPerspectiveScore
{
  return self->_pleasantPerspectiveScore;
}

- (void)setPleasantPerspectiveScore:(float)a3
{
  self->_pleasantPerspectiveScore = a3;
}

- (float)pleasantPostProcessingScore
{
  return self->_pleasantPostProcessingScore;
}

- (void)setPleasantPostProcessingScore:(float)a3
{
  self->_pleasantPostProcessingScore = a3;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (void)setNoiseScore:(float)a3
{
  self->_noiseScore = a3;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (void)setFailureScore:(float)a3
{
  self->_failureScore = a3;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (void)setPleasantCompositionScore:(float)a3
{
  self->_pleasantCompositionScore = a3;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (void)setInterestingSubjectScore:(float)a3
{
  self->_interestingSubjectScore = a3;
}

- (float)intrusiveObjectPresenceScore
{
  return self->_intrusiveObjectPresenceScore;
}

- (void)setIntrusiveObjectPresenceScore:(float)a3
{
  self->_intrusiveObjectPresenceScore = a3;
}

- (float)pleasantCameraTiltScore
{
  return self->_pleasantCameraTiltScore;
}

- (void)setPleasantCameraTiltScore:(float)a3
{
  self->_pleasantCameraTiltScore = a3;
}

- (float)lowLight
{
  return self->_lowLight;
}

- (void)setLowLight:(float)a3
{
  self->_lowLight = a3;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (NSArray)objectSaliencyRects
{
  return self->_objectSaliencyRects;
}

- (void)setObjectSaliencyRects:(id)a3
{
}

- (NSData)sceneprintData
{
  return self->_sceneprintData;
}

- (void)setSceneprintData:(id)a3
{
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (void)setWallpaperScore:(float)a3
{
  self->_wallpaperScore = a3;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (void)setColorNormalizationData:(id)a3
{
}

- (NSData)duplicateMatchingFeature
{
  return self->_duplicateMatchingFeature;
}

- (void)setDuplicateMatchingFeature:(id)a3
{
}

- (NSData)duplicateMatchingAlternateFeature
{
  return self->_duplicateMatchingAlternateFeature;
}

- (void)setDuplicateMatchingAlternateFeature:(id)a3
{
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- (void)setBlurrinessScore:(float)a3
{
  self->_blurrinessScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_exposureScore = a3;
}

- (signed)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (void)setProbableRotationDirection:(signed __int16)a3
{
  self->_probableRotationDirection = a3;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (void)setProbableRotationDirectionConfidence:(float)a3
{
  self->_probableRotationDirectionConfidence = a3;
}

- (float)iconicScore
{
  return self->_iconicScore;
}

- (void)setIconicScore:(float)a3
{
  self->_iconicScore = a3;
}

- (NSDictionary)embeddingResults
{
  return self->_embeddingResults;
}

- (void)setEmbeddingResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingResults, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateFeature, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingFeature, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
}

@end