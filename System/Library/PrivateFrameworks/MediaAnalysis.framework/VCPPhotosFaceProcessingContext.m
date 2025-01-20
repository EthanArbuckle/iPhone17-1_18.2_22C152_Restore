@interface VCPPhotosFaceProcessingContext
+ (BOOL)_includeTorsoOnlyFaces;
+ (VCPPhotosFaceProcessingContext)contextWithPhotoLibrary:(id)a3;
- (BOOL)clusterIncludeTorsoOnlyFaces;
- (BOOL)faceClusteringDisabled;
- (BOOL)personBuilderMergeCandidatesDisabled;
- (BOOL)personBuildingDisabled;
- (BOOL)quarantineTwinsOnAssetEnabled;
- (BOOL)suggestionsLogEnabled;
- (VCPPhotosFaceProcessingContext)initWithPhotoLibrary:(id)a3;
- (float)faceClusteringAgeThreshold;
- (float)faceClusteringJunkThreshold;
- (float)faceClusteringThreshold;
- (float)faceMergeFaceprintDistanceThreshold;
- (float)facePrimarySuggestionsThreshold;
- (int)processingVersion;
- (int)skipGallerySyncing;
- (unint64_t)advancedStatusMergeCandidateLimit;
- (unint64_t)advancedStatusVerifiedPersonLimit;
- (unint64_t)maxFaceCountForClustering;
- (unint64_t)minFaceCountToTriggerClustering;
- (unint64_t)minimumFaceGroupSizeForCreatingMergeCandidates;
- (unint64_t)minimumSuggestionSize;
- (void)setAdvancedStatusMergeCandidateLimit:(unint64_t)a3;
- (void)setAdvancedStatusVerifiedPersonLimit:(unint64_t)a3;
- (void)setClusterIncludeTorsoOnlyFaces:(BOOL)a3;
- (void)setFaceClusteringAgeThreshold:(float)a3;
- (void)setFaceClusteringDisabled:(BOOL)a3;
- (void)setFaceClusteringJunkThreshold:(float)a3;
- (void)setFaceClusteringThreshold:(float)a3;
- (void)setFaceMergeFaceprintDistanceThreshold:(float)a3;
- (void)setFacePrimarySuggestionsThreshold:(float)a3;
- (void)setMaxFaceCountForClustering:(unint64_t)a3;
- (void)setMinFaceCountToTriggerClustering:(unint64_t)a3;
- (void)setMinimumFaceGroupSizeForCreatingMergeCandidates:(unint64_t)a3;
- (void)setMinimumSuggestionSize:(unint64_t)a3;
- (void)setPersonBuilderMergeCandidatesDisabled:(BOOL)a3;
- (void)setPersonBuildingDisabled:(BOOL)a3;
- (void)setProcessingVersion:(int)a3;
- (void)setQuarantineTwinsOnAssetEnabled:(BOOL)a3;
- (void)setSkipGallerySyncing:(int)a3;
- (void)setSuggestionsLogEnabled:(BOOL)a3;
@end

@implementation VCPPhotosFaceProcessingContext

+ (BOOL)_includeTorsoOnlyFaces
{
  return 1;
}

- (VCPPhotosFaceProcessingContext)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)VCPPhotosFaceProcessingContext;
    v5 = [(VCPPhotosFaceProcessingContext *)&v10 init];
    v6 = v5;
    if (v5)
    {
      *(_OWORD *)&v5->_faceClusteringThreshold = xmmword_1BC281180;
      v5->_facePrimarySuggestionsThreshold = 0.78;
      *(_OWORD *)&v5->_minimumSuggestionSize = xmmword_1BC281190;
      v5->_maxFaceCountForClustering = 1000;
      v5->_minimumFaceGroupSizeForCreatingMergeCandidates = 15;
      *(_DWORD *)&v5->_quarantineTwinsOnAssetEnabled = 0;
      v5->_personBuilderMergeCandidatesDisabled = 0;
      *(_OWORD *)&v5->_advancedStatusMergeCandidateLimit = xmmword_1BC2811A0;
      v5->_clusterIncludeTorsoOnlyFaces = [(id)objc_opt_class() _includeTorsoOnlyFaces];
      v7 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:v4];
      v6->_processingVersion = [v7 currentProcessingVersion];

      v6->_skipGallerySyncing = 0;
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (VCPPhotosFaceProcessingContext)contextWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return (VCPPhotosFaceProcessingContext *)v4;
}

- (float)faceClusteringThreshold
{
  return self->_faceClusteringThreshold;
}

- (void)setFaceClusteringThreshold:(float)a3
{
  self->_faceClusteringThreshold = a3;
}

- (float)faceClusteringJunkThreshold
{
  return self->_faceClusteringJunkThreshold;
}

- (void)setFaceClusteringJunkThreshold:(float)a3
{
  self->_faceClusteringJunkThreshold = a3;
}

- (float)faceClusteringAgeThreshold
{
  return self->_faceClusteringAgeThreshold;
}

- (void)setFaceClusteringAgeThreshold:(float)a3
{
  self->_faceClusteringAgeThreshold = a3;
}

- (float)faceMergeFaceprintDistanceThreshold
{
  return self->_faceMergeFaceprintDistanceThreshold;
}

- (void)setFaceMergeFaceprintDistanceThreshold:(float)a3
{
  self->_faceMergeFaceprintDistanceThreshold = a3;
}

- (float)facePrimarySuggestionsThreshold
{
  return self->_facePrimarySuggestionsThreshold;
}

- (void)setFacePrimarySuggestionsThreshold:(float)a3
{
  self->_facePrimarySuggestionsThreshold = a3;
}

- (unint64_t)minimumSuggestionSize
{
  return self->_minimumSuggestionSize;
}

- (void)setMinimumSuggestionSize:(unint64_t)a3
{
  self->_minimumSuggestionSize = a3;
}

- (BOOL)quarantineTwinsOnAssetEnabled
{
  return self->_quarantineTwinsOnAssetEnabled;
}

- (void)setQuarantineTwinsOnAssetEnabled:(BOOL)a3
{
  self->_quarantineTwinsOnAssetEnabled = a3;
}

- (unint64_t)minFaceCountToTriggerClustering
{
  return self->_minFaceCountToTriggerClustering;
}

- (void)setMinFaceCountToTriggerClustering:(unint64_t)a3
{
  self->_minFaceCountToTriggerClustering = a3;
}

- (unint64_t)maxFaceCountForClustering
{
  return self->_maxFaceCountForClustering;
}

- (void)setMaxFaceCountForClustering:(unint64_t)a3
{
  self->_maxFaceCountForClustering = a3;
}

- (BOOL)suggestionsLogEnabled
{
  return self->_suggestionsLogEnabled;
}

- (void)setSuggestionsLogEnabled:(BOOL)a3
{
  self->_suggestionsLogEnabled = a3;
}

- (BOOL)faceClusteringDisabled
{
  return self->_faceClusteringDisabled;
}

- (void)setFaceClusteringDisabled:(BOOL)a3
{
  self->_faceClusteringDisabled = a3;
}

- (unint64_t)minimumFaceGroupSizeForCreatingMergeCandidates
{
  return self->_minimumFaceGroupSizeForCreatingMergeCandidates;
}

- (void)setMinimumFaceGroupSizeForCreatingMergeCandidates:(unint64_t)a3
{
  self->_minimumFaceGroupSizeForCreatingMergeCandidates = a3;
}

- (BOOL)personBuildingDisabled
{
  return self->_personBuildingDisabled;
}

- (void)setPersonBuildingDisabled:(BOOL)a3
{
  self->_personBuildingDisabled = a3;
}

- (BOOL)personBuilderMergeCandidatesDisabled
{
  return self->_personBuilderMergeCandidatesDisabled;
}

- (void)setPersonBuilderMergeCandidatesDisabled:(BOOL)a3
{
  self->_personBuilderMergeCandidatesDisabled = a3;
}

- (unint64_t)advancedStatusMergeCandidateLimit
{
  return self->_advancedStatusMergeCandidateLimit;
}

- (void)setAdvancedStatusMergeCandidateLimit:(unint64_t)a3
{
  self->_advancedStatusMergeCandidateLimit = a3;
}

- (unint64_t)advancedStatusVerifiedPersonLimit
{
  return self->_advancedStatusVerifiedPersonLimit;
}

- (void)setAdvancedStatusVerifiedPersonLimit:(unint64_t)a3
{
  self->_advancedStatusVerifiedPersonLimit = a3;
}

- (BOOL)clusterIncludeTorsoOnlyFaces
{
  return self->_clusterIncludeTorsoOnlyFaces;
}

- (void)setClusterIncludeTorsoOnlyFaces:(BOOL)a3
{
  self->_clusterIncludeTorsoOnlyFaces = a3;
}

- (int)processingVersion
{
  return self->_processingVersion;
}

- (void)setProcessingVersion:(int)a3
{
  self->_processingVersion = a3;
}

- (int)skipGallerySyncing
{
  return self->_skipGallerySyncing;
}

- (void)setSkipGallerySyncing:(int)a3
{
  self->_skipGallerySyncing = a3;
}

@end