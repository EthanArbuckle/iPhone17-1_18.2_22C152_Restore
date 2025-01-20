@interface PHAssetChangeRequest
+ (BOOL)performBatchExpungeAndWaitWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (PHAssetChangeRequest)changeRequestForAsset:(PHAsset *)asset;
+ (PHAssetChangeRequest)creationRequestForAssetFromImage:(UIImage *)image;
+ (PHAssetChangeRequest)creationRequestForAssetFromImageAtFileURL:(NSURL *)fileURL;
+ (PHAssetChangeRequest)creationRequestForAssetFromVideoAtFileURL:(NSURL *)fileURL;
+ (id)_allAssetEditOperations;
+ (id)changeRequestForAssetFromVideoFileURL:(id)a3 imageAsset:(id)a4 displayTime:(double)a5;
+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3;
+ (void)_deleteAssets:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5 deleteOptions:(id)a6;
+ (void)deleteAssets:(id)assets;
+ (void)expungeAssets:(id)a3;
+ (void)expungeAssets:(id)a3 deleteOptions:(id)a4;
+ (void)internalExpungeAssets:(id)a3 deleteOptions:(id)a4;
+ (void)performBatchExpungeWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (void)recoverAssets:(id)a3;
+ (void)undeleteAssets:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- ($AC64C642040120CEEAD84DEEACA9A5CE)animatedStickerTimeRange;
- ($AC64C642040120CEEAD84DEEACA9A5CE)bestVideoTimeRange;
- (BOOL)_validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:(id)a3 error:(id *)a4;
- (BOOL)_validateAsyncContentEditingOutputPreviewRenderURLs:(id)a3 error:(id *)a4;
- (BOOL)_validateImageURLForAssetMutation:(id)a3 error:(id *)a4;
- (BOOL)addAssetResourceWithType:(int64_t)a3 fromFileAtURL:(id)a4;
- (BOOL)applyMutationsToAssetRelationshipWithKey:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)deleteAssetResourceWithType:(int64_t)a3;
- (BOOL)didChangeAdjustments;
- (BOOL)duplicateAllowsPrivateMetadata;
- (BOOL)isFavorite;
- (BOOL)isHidden;
- (BOOL)isHiding;
- (BOOL)isRevertingContentToOriginal;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (BOOL)reverseLocationDataIsValid;
- (BOOL)validateAccessibilityDescription:(id)a3 error:(id *)a4;
- (BOOL)validateAdjustmentDataForAssetMutation:(id)a3 error:(id *)a4;
- (BOOL)validateAssetDescription:(id)a3 error:(id *)a4;
- (BOOL)validateContentEditingOutput:(id)a3 error:(id *)a4;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (BOOL)validateReadAccessForContentURL:(id)a3 assetResource:(id)a4 error:(id *)a5;
- (BOOL)validateVideoURLForAssetMutation:(id)a3 error:(id *)a4;
- (BOOL)validateWriteAccessForContentURL:(id)a3 error:(id *)a4;
- (CLLocation)location;
- (CLLocation)shiftedLocation;
- (NSArray)objectSaliencyRects;
- (NSData)colorNormalizationData;
- (NSData)computeSyncMediaAnalysisPayload;
- (NSData)reverseLocationData;
- (NSData)sceneprintData;
- (NSData)wallpaperPropertiesData;
- (NSDate)addedDate;
- (NSDate)alternateImportImageDate;
- (NSDate)creationDate;
- (NSDate)mediaAnalysisTimeStamp;
- (NSDate)modificationDate;
- (NSDate)wallpaperPropertiesTimestamp;
- (NSIndexSet)supportedEditOperations;
- (NSSet)keywordTitles;
- (NSString)accessibilityDescription;
- (NSString)assetDescription;
- (NSString)editorBundleID;
- (NSString)managedEntityName;
- (NSString)pairingIdentifier;
- (NSString)title;
- (NSURL)videoURLForUpdate;
- (PHAssetChangeRequest)init;
- (PHAssetChangeRequest)initWithCoder:(id)a3;
- (PHAssetChangeRequest)initWithHelper:(id)a3;
- (PHAssetChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHAssetChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHContentEditingOutput)contentEditingOutput;
- (PHObjectPlaceholder)placeholderForCreatedAsset;
- (PHRelationshipChangeRequestHelper)facesHelper;
- (PHRelationshipChangeRequestHelper)temporalFacesHelper;
- (double)curationScore;
- (double)gpsHorizontalAccuracy;
- (double)highlightPromotionScore;
- (double)highlightVisibilityScore;
- (double)iconicScore;
- (float)activityScore;
- (float)audioScore;
- (float)autoplaySuggestionScore;
- (float)behavioralScore;
- (float)blurrinessScore;
- (float)exposureScore;
- (float)failureScore;
- (float)harmoniousColorScore;
- (float)immersivenessScore;
- (float)interactionScore;
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
- (float)settlingEffectScore;
- (float)sharplyFocusedSubjectScore;
- (float)tastefullyBlurredScore;
- (float)testScore;
- (float)videoScore;
- (float)videoStickerSuggestionScore;
- (float)wallpaperScore;
- (float)wellChosenSubjectScore;
- (float)wellFramedSubjectScore;
- (float)wellTimedShotScore;
- (id)_existentCommentObjectIDs;
- (id)_existentKeywordObjectIDs;
- (id)_existentLikeObjectIDs;
- (id)_mutableCommentObjectIDsAndUUIDs;
- (id)_mutableFaceObjectIDsAndUUIDs;
- (id)_mutableKeywordObjectIDsAndUUIDs;
- (id)_mutableLikeObjectIDsAndUUIDs;
- (id)faceAdjustmentVersion;
- (id)getMediaAnalysisAttributesForAsset:(id)a3;
- (id)getPhotoAnalysisAttributesForAsset:(id)a3;
- (int64_t)ptpTrashedState;
- (signed)assetAnalysisStage;
- (signed)audioClassification;
- (signed)faceAnalysisVersion;
- (signed)generativeMemoryCreationEligibilityState;
- (signed)localAnalysisStage;
- (signed)mediaAnalysisImageVersion;
- (signed)probableRotationDirection;
- (signed)screenTimeDeviceImageSensitivity;
- (signed)viewPresentation;
- (unint64_t)faceCount;
- (unint64_t)mediaAnalysisVersion;
- (unint64_t)originalResourceChoice;
- (unint64_t)syndicationProcessingVersion;
- (unint64_t)wallpaperPropertiesVersion;
- (unsigned)photoIrisVisibilityState;
- (unsigned)syndicationProcessingValue;
- (void)_addVersion:(signed __int16)a3 withKey:(id)a4 andType:(int64_t)a5 toDictionary:(id)a6;
- (void)_prepareExistingIDsForTemporalFacesIfNeeded;
- (void)_prepareFaceIDsIfNeeded;
- (void)_prepareFacesHelperWithFetchResult:(id)a3;
- (void)_setOriginalAsset:(id)a3;
- (void)_setSavedAssetType:(signed __int16)a3;
- (void)_setSceneClassifications:(id)a3 ofType:(int64_t)a4 timestamp:(id)a5;
- (void)_setSyndicationIdentifier:(id)a3;
- (void)_validateObjectSaliencyRects:(id)a3;
- (void)addComments:(id)a3;
- (void)addFaces:(id)a3;
- (void)addKeywords:(id)a3;
- (void)addLike:(id)a3;
- (void)clearLastSharedDate;
- (void)clearLastViewedDate;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)expungeAllSpatialOverCaptureResources;
- (void)expungeTrashedSpatialOverCaptureResources;
- (void)incrementPlayCount;
- (void)incrementShareCount;
- (void)incrementViewCount;
- (void)markDidChangeAdjustments;
- (void)promoteToGuestAsset;
- (void)removeComments:(id)a3;
- (void)removeFaces:(id)a3;
- (void)removeKeywords:(id)a3;
- (void)removeLike:(id)a3;
- (void)resetCharacterRecognitionAttributes;
- (void)resetGeneratedAssetDescriptions;
- (void)resetGuestAssetPromotion;
- (void)resetVisualSearchAttributes;
- (void)resetWallpaperProperties;
- (void)retryUpload;
- (void)revertAssetContentToOriginal;
- (void)revertLocationToOriginal;
- (void)setAcceptableCropRectWithNormalizedRect:(CGRect)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setActivityScore:(float)a3;
- (void)setAddedDate:(id)a3;
- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10;
- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10 optionalOriginalResourceChoice:(id)a11;
- (void)setAlternateImportImageDate:(id)a3;
- (void)setAnimatedStickerTimeRange:(id *)a3;
- (void)setAssetDescription:(id)a3;
- (void)setAudioClassification:(signed __int16)a3;
- (void)setAudioScore:(float)a3;
- (void)setAutoplaySuggestionScore:(float)a3;
- (void)setBehavioralScore:(float)a3;
- (void)setBestKeyFrame:(CGImage *)a3 time:(id *)a4;
- (void)setBestPlaybackRectWithNormalizedRect:(CGRect)a3;
- (void)setBestVideoTimeRange:(id *)a3;
- (void)setBlurrinessScore:(float)a3;
- (void)setCharacterRecognitionData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5;
- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6;
- (void)setColorNormalizationData:(id)a3;
- (void)setComputeSyncMediaAnalysisPayload:(id)a3;
- (void)setContentEditingOutput:(PHContentEditingOutput *)contentEditingOutput;
- (void)setCreationDate:(NSDate *)creationDate;
- (void)setCurationScore:(double)a3;
- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4;
- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5;
- (void)setExposureScore:(float)a3;
- (void)setFaceAdjustmentVersion:(id)a3;
- (void)setFaceAnalysisVersion:(signed __int16)a3;
- (void)setFaceCount:(unint64_t)a3;
- (void)setFailureScore:(float)a3;
- (void)setFavorite:(BOOL)favorite;
- (void)setGeneratedAssetDescription:(id)a3 analysisVersion:(int64_t)a4 sourceType:(int64_t)a5;
- (void)setGenerativeMemoryCreationEligibilityState:(signed __int16)a3;
- (void)setGpsHorizontalAccuracy:(double)a3;
- (void)setHarmoniousColorScore:(float)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setHighlightPromotionScore:(double)a3;
- (void)setHighlightVisibilityScore:(double)a3;
- (void)setIconicScore:(double)a3;
- (void)setImageDisplayTime:(id *)a3;
- (void)setImageEmbeddingVersion:(signed __int16)a3;
- (void)setImmersivenessScore:(float)a3;
- (void)setInteractionScore:(float)a3;
- (void)setInterestingSubjectScore:(float)a3;
- (void)setIntrusiveObjectPresenceScore:(float)a3;
- (void)setKeywordTitles:(id)a3;
- (void)setLibraryScopeContributors:(id)a3;
- (void)setLivelyColorScore:(float)a3;
- (void)setLocalAnalysisStage:(signed __int16)a3;
- (void)setLocation:(CLLocation *)location;
- (void)setLocationBasedSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6;
- (void)setLowLight:(float)a3;
- (void)setMediaAnalysisImageVersion:(signed __int16)a3;
- (void)setMediaAnalysisTimeStamp:(id)a3;
- (void)setMediaAnalysisVersion:(unint64_t)a3;
- (void)setModificationDate:(id)a3;
- (void)setNoiseScore:(float)a3;
- (void)setObjectSaliencyRects:(id)a3;
- (void)setOriginalResourceChoice:(unint64_t)a3;
- (void)setOverallAestheticScore:(float)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setPhotoIrisVisibilityState:(unsigned __int16)a3;
- (void)setPleasantCameraTiltScore:(float)a3;
- (void)setPleasantCompositionScore:(float)a3;
- (void)setPleasantLightingScore:(float)a3;
- (void)setPleasantPatternScore:(float)a3;
- (void)setPleasantPerspectiveScore:(float)a3;
- (void)setPleasantPostProcessingScore:(float)a3;
- (void)setPleasantReflectionsScore:(float)a3;
- (void)setPleasantSymmetryScore:(float)a3;
- (void)setPreferredCropRectWithNormalizedRect:(CGRect)a3;
- (void)setProbableRotationDirection:(signed __int16)a3;
- (void)setProbableRotationDirectionConfidence:(float)a3;
- (void)setPtpTrashedState:(int64_t)a3;
- (void)setRectWithNormalizedRect:(CGRect)a3 forPackedRect:(int64_t *)a4 forSetFlag:(BOOL *)a5;
- (void)setReverseLocationData:(id)a3;
- (void)setReverseLocationDataIsValid:(BOOL)a3;
- (void)setSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6;
- (void)setSceneprintData:(id)a3;
- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3;
- (void)setSettlingEffectScore:(float)a3;
- (void)setSharplyFocusedSubjectScore:(float)a3;
- (void)setShiftedLocation:(id)a3;
- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(int64_t)a4;
- (void)setSupportedEditOperations:(id)a3;
- (void)setSyndicationIdentifierOnMomentSharedAsset:(id)a3;
- (void)setSyndicationProcessingValue:(unsigned __int16)a3;
- (void)setSyndicationProcessingVersion:(unint64_t)a3;
- (void)setTastefullyBlurredScore:(float)a3;
- (void)setTemporalFaces:(id)a3;
- (void)setTestScore:(float)a3;
- (void)setTimeZone:(id)a3 withDate:(id)a4;
- (void)setTitle:(id)a3;
- (void)setVariationSuggestionStates:(unint64_t)a3 forVariationType:(unint64_t)a4;
- (void)setVideoDuration:(id *)a3;
- (void)setVideoEmbeddingVersion:(signed __int16)a3;
- (void)setVideoScore:(float)a3;
- (void)setVideoStickerSuggestionScore:(float)a3;
- (void)setVideoURLForUpdate:(id)a3;
- (void)setViewPresentation:(signed __int16)a3;
- (void)setVisualSearchData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5;
- (void)setVisualSearchData:(id)a3 stickerConfidenceScore:(float)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6;
- (void)setWallpaperPropertiesData:(id)a3;
- (void)setWallpaperPropertiesTimestamp:(id)a3;
- (void)setWallpaperPropertiesVersion:(unint64_t)a3;
- (void)setWallpaperScore:(float)a3;
- (void)setWellChosenSubjectScore:(float)a3;
- (void)setWellFramedSubjectScore:(float)a3;
- (void)setWellTimedShotScore:(float)a3;
- (void)trashAllSpatialOverCaptureResources;
- (void)untrashAllSpatialOverCaptureResources;
- (void)updateExtendedAttributesUsingOriginalMediaMetadata;
@end

@implementation PHAssetChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_shiftedLocation, 0);
  objc_storeStrong((id *)&self->_reverseLocationData, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisTimeStamp, 0);
  objc_storeStrong((id *)&self->_wallpaperPropertiesData, 0);
  objc_storeStrong((id *)&self->_wallpaperPropertiesTimestamp, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_alternateImportImageDate, 0);
  objc_storeStrong((id *)&self->_temporalFacesHelper, 0);
  objc_storeStrong((id *)&self->_facesHelper, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_videoURLForUpdate, 0);
  objc_storeStrong((id *)&self->_supportedEditOperations, 0);
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescriptionDictionaries, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescriptionTimestamp, 0);
  objc_storeStrong((id *)&self->_generatedAssetDescription, 0);
  objc_storeStrong((id *)&self->_libraryScopeOriginatorUUIDs, 0);
  objc_storeStrong((id *)&self->_likesHelper, 0);
  objc_storeStrong((id *)&self->_commentsHelper, 0);
  objc_storeStrong((id *)&self->_assetResourceTypesToDelete, 0);
  objc_storeStrong((id *)&self->_pathsToNewAssetResourcesByAssetResourceType, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_keywordsHelper, 0);
  objc_storeStrong((id *)&self->_keywordTitles, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRectsData, 0);
  objc_storeStrong((id *)&self->_computedAttributeMutations, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_visualSearchAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_visualSearchData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
  objc_storeStrong((id *)&self->_sceneClassificationDictionariesByType, 0);
  objc_storeStrong((id *)&self->_computeSyncMediaAnalysisPayload, 0);
  objc_storeStrong((id *)&self->_bestKeyFrameJPEGData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_assetDescription, 0);
  objc_storeStrong((id *)&self->_updatedLocation, 0);
  objc_storeStrong((id *)&self->_editorBundleURL, 0);

  objc_storeStrong((id *)&self->_originalAsset, 0);
}

- (unint64_t)syndicationProcessingVersion
{
  return self->_syndicationProcessingVersion;
}

- (unsigned)syndicationProcessingValue
{
  return self->_syndicationProcessingValue;
}

- (NSData)sceneprintData
{
  return self->_sceneprintData;
}

- (NSSet)keywordTitles
{
  return self->_keywordTitles;
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (NSData)computeSyncMediaAnalysisPayload
{
  return self->_computeSyncMediaAnalysisPayload;
}

- (signed)localAnalysisStage
{
  return self->_localAnalysisStage;
}

- (signed)screenTimeDeviceImageSensitivity
{
  return self->_screenTimeDeviceImageSensitivity;
}

- (CLLocation)shiftedLocation
{
  return self->_shiftedLocation;
}

- (BOOL)reverseLocationDataIsValid
{
  return self->_reverseLocationDataIsValid;
}

- (NSData)reverseLocationData
{
  return self->_reverseLocationData;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (signed)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (float)settlingEffectScore
{
  return self->_settlingEffectScore;
}

- (float)audioScore
{
  return self->_audioScore;
}

- (float)activityScore
{
  return self->_activityScore;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (float)videoStickerSuggestionScore
{
  return self->_videoStickerSuggestionScore;
}

- (float)autoplaySuggestionScore
{
  return self->_autoplaySuggestionScore;
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- ($AC64C642040120CEEAD84DEEACA9A5CE)animatedStickerTimeRange
{
  long long v3 = *(_OWORD *)&self[19].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[18].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[19].var1.var0;
  return self;
}

- ($AC64C642040120CEEAD84DEEACA9A5CE)bestVideoTimeRange
{
  long long v3 = *(_OWORD *)&self[18].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[17].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[18].var1.var0;
  return self;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (NSDate)mediaAnalysisTimeStamp
{
  return self->_mediaAnalysisTimeStamp;
}

- (NSData)wallpaperPropertiesData
{
  return self->_wallpaperPropertiesData;
}

- (NSDate)wallpaperPropertiesTimestamp
{
  return self->_wallpaperPropertiesTimestamp;
}

- (unint64_t)wallpaperPropertiesVersion
{
  return self->_wallpaperPropertiesVersion;
}

- (NSArray)objectSaliencyRects
{
  return self->_objectSaliencyRects;
}

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

- (void)setTestScore:(float)a3
{
  self->_testScore = a3;
}

- (float)testScore
{
  return self->_testScore;
}

- (void)setImageDisplayTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_imageDisplayTime.value = *(_OWORD *)&a3->var0;
  self->_imageDisplayTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 832);
  return self;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (NSDate)alternateImportImageDate
{
  return self->_alternateImportImageDate;
}

- (BOOL)duplicateAllowsPrivateMetadata
{
  return self->_duplicateAllowsPrivateMetadata;
}

- (PHRelationshipChangeRequestHelper)temporalFacesHelper
{
  return self->_temporalFacesHelper;
}

- (PHRelationshipChangeRequestHelper)facesHelper
{
  return self->_facesHelper;
}

- (void)setVideoDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_videoDuration.value = *(_OWORD *)&a3->var0;
  self->_videoDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 808);
  return self;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setVideoURLForUpdate:(id)a3
{
}

- (NSURL)videoURLForUpdate
{
  return self->_videoURLForUpdate;
}

- (void)setSupportedEditOperations:(id)a3
{
}

- (NSIndexSet)supportedEditOperations
{
  return self->_supportedEditOperations;
}

- (NSString)editorBundleID
{
  return self->_editorBundleID;
}

- (BOOL)didChangeAdjustments
{
  return self->_didChangeAdjustments;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (unint64_t)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (unsigned)photoIrisVisibilityState
{
  return self->_photoIrisVisibilityState;
}

- (BOOL)applyMutationsToAssetRelationshipWithKey:(id)a3 asset:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"cloudComments"])
  {
    v10 = &OBJC_IVAR___PHAssetChangeRequest__commentsHelper;
  }
  else
  {
    if (![v8 isEqualToString:@"likeComments"])
    {
      v12 = 0;
LABEL_23:
      BOOL v33 = 0;
      v34 = 0;
      if (!a5) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    v10 = &OBJC_IVAR___PHAssetChangeRequest__likesHelper;
  }
  id v11 = *(id *)((char *)&self->super.super.isa + *v10);
  v12 = v11;
  if (!v11) {
    goto LABEL_23;
  }
  [v11 setAllowsInsert:1];
  [v12 setAllowsRemove:1];
  v13 = [MEMORY[0x1E4F8A730] entityName];
  [v12 setDestinationEntityName:v13];

  [v12 setDestinationUUIDKeyPath:@"cloudGUID"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  id v40 = v8;
  [v9 mutableSetValueForKey:v8];
  id v50 = v15;
  id v51 = v14;
  id v49 = 0;
  v37 = v39 = v12;
  char v16 = objc_msgSend(v12, "applyMutationsToManagedObject:unorderedMutableChildren:inserts:deletes:error:", v9);
  id v17 = v51;

  id v18 = v50;
  id v36 = v49;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        objc_msgSend(v9, "addComment:", v24, v36);
        [MEMORY[0x1E4F8AAB0] publishCloudSharedCommentToServer:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v21);
  }
  BOOL v38 = v16;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v18;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v31 = (void *)MEMORY[0x1E4F8AAB0];
        v32 = objc_msgSend(v30, "cloudGUID", v36);
        [v31 deleteCommentWithGUIDFromServer:v32];

        [v9 deleteAssetComment:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v27);
  }

  id v8 = v40;
  v12 = v39;
  BOOL v33 = v38;
  v34 = v36;
  if (a5)
  {
LABEL_24:
    if (!v33) {
      *a5 = v34;
    }
  }
LABEL_26:

  return v33;
}

- (void)markDidChangeAdjustments
{
  self->_didChangeAdjustments = 1;
}

- (BOOL)isRevertingContentToOriginal
{
  if (![(PHAssetChangeRequest *)self didChangeAdjustments]) {
    return 0;
  }
  long long v3 = [(PHAssetChangeRequest *)self contentEditingOutput];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isHiding
{
  v2 = [(PHChangeRequest *)self helper];
  long long v3 = [v2 mutations];
  BOOL v4 = [v3 objectForKey:@"hidden"];

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v528 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v442 = a4;
  id v9 = [(PHChangeRequest *)self helper];
  id v507 = 0;
  int v10 = [v9 applyMutationsToManagedObject:v8 error:&v507];
  id v433 = v507;

  if (!v10)
  {
    BOOL v28 = 0;
    goto LABEL_484;
  }
  v421 = a5;
  id v11 = [(PHChangeRequest *)self helper];
  v12 = [v11 mutations];
  v13 = [v12 objectForKey:@"dateCreated"];

  if (v13) {
    [v8 didSetCustomDateCreated];
  }
  if ([v8 isAvalancheStackPhoto])
  {
    id v14 = [(PHChangeRequest *)self helper];
    id v15 = [v14 mutations];
    char v16 = [v15 objectForKey:@"hidden"];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F8A6B8]);
      id v18 = [v8 avalancheUUID];
      id v19 = (void *)[v17 initWithUUID:v18 photoLibrary:v442];

      uint64_t v20 = [(PHChangeRequest *)self helper];
      uint64_t v21 = [v20 mutations];
      uint64_t v22 = [v21 objectForKey:@"hidden"];
      objc_msgSend(v19, "setHidden:", objc_msgSend(v22, "BOOLValue"));
    }
  }
  v23 = self->_updatedLocation;
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = [MEMORY[0x1E4F1CA98] null];
    int v26 = [(CLLocation *)v24 isEqual:v25];

    if (v26)
    {

      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = v24;
    }
    v418 = v27;
    objc_msgSend(v8, "setLocation:");
    [v8 didSetCustomLocation];
  }
  else
  {
    v418 = 0;
  }
  if (self->_didSetGpsHorizontalAccuracy)
  {
    v29 = [v8 additionalAttributes];
    [v29 setGpsHorizontalAccuracy:self->_gpsHorizontalAccuracy];
  }
  v30 = self->_assetDescription;
  if (v30)
  {
    v31 = v30;
    if ([(NSString *)v30 isEqualToString:&stru_1EEAC1950])
    {

      v32 = 0;
    }
    else
    {
      v32 = v31;
    }
    v417 = v32;
    objc_msgSend(v8, "setLongDescription:");
  }
  else
  {
    v417 = 0;
  }
  BOOL v33 = self->_accessibilityDescription;
  if (v33)
  {
    v34 = v33;
    if ([(NSString *)v33 isEqualToString:&stru_1EEAC1950])
    {

      v35 = 0;
    }
    else
    {
      v35 = v34;
    }
    v416 = v35;
    objc_msgSend(v8, "setAccessibilityDescription:");
  }
  else
  {
    v416 = 0;
  }
  if (self->_didSetTitle)
  {
    id v36 = [v8 additionalAttributes];
    [v36 setTitle:self->_title];
  }
  uint64_t v37 = [(PHAssetChangeRequest *)self videoURLForUpdate];
  uint64_t v38 = [(PHAssetChangeRequest *)self pairingIdentifier];
  int v39 = 1;
  v419 = (void *)v38;
  v420 = (void *)v37;
  if (v37 && v38)
  {
    memset(buf, 0, 24);
    [(PHAssetChangeRequest *)self videoDuration];
    long long v505 = 0uLL;
    uint64_t v506 = 0;
    [(PHAssetChangeRequest *)self imageDisplayTime];
    long long v503 = *(_OWORD *)buf;
    uint64_t v504 = *(void *)&buf[16];
    long long v501 = v505;
    uint64_t v502 = v506;
    int v39 = [v8 becomePhotoIrisWithMediaGroupUUID:v419 mainFileMetadata:0 videoURL:v37 videoDuration:&v503 stillDisplayTime:&v501 options:0];
  }
  int v415 = v39;
  if (self->_didSetVisibilityState && [v8 isPhotoIris])
  {
    [v8 setVideoCpVisibilityState:self->_photoIrisVisibilityState];
    objc_msgSend(v8, "updatePlaybackStyleWithLivePhotoPlayability:", objc_msgSend(v8, "canPlayPhotoIris"));
  }
  BOOL didSetSceneClassifications = self->_didSetSceneClassifications;
  v443 = v8;
  v438 = self;
  if (self->_didSetSceneClassifications)
  {
    long long v499 = 0u;
    long long v500 = 0u;
    long long v497 = 0u;
    long long v498 = 0u;
    obuint64_t j = self->_sceneClassificationDictionariesByType;
    uint64_t v429 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v497 objects:v527 count:16];
    if (!v429) {
      goto LABEL_73;
    }
    uint64_t v425 = *(void *)v498;
    while (1)
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v498 != v425) {
          objc_enumerationMutation(obj);
        }
        uint64_t v431 = v41;
        long long v42 = *(void **)(*((void *)&v497 + 1) + 8 * v41);
        long long v43 = [(NSMutableDictionary *)self->_sceneClassificationDictionariesByType objectForKeyedSubscript:v42];
        long long v44 = [NSString stringWithUTF8String:"sceneAnalysisVersion"];
        v434 = [v43 objectForKeyedSubscript:v44];

        long long v45 = [(NSMutableDictionary *)self->_sceneClassificationDictionariesByType objectForKeyedSubscript:v42];
        long long v46 = [NSString stringWithUTF8String:"sceneAnalysisTimestamp"];
        v439 = [v45 objectForKeyedSubscript:v46];

        long long v47 = PLAssetAnalysisGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          id v48 = [(PHChangeRequest *)self uuid];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v439;
          _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_DEBUG, "Applying scene classifications to managed object - uuid: %@, adjustment timestamp: %@", buf, 0x16u);
        }
        id v49 = [(NSMutableDictionary *)self->_sceneClassificationDictionariesByType objectForKeyedSubscript:v42];
        id v50 = [NSString stringWithUTF8String:"sceneClassifications"];
        id v51 = [v49 objectForKeyedSubscript:v50];

        v52 = [MEMORY[0x1E4F1CA80] set];
        long long v493 = 0u;
        long long v494 = 0u;
        long long v495 = 0u;
        long long v496 = 0u;
        id v53 = v51;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v493 objects:v526 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v494;
          do
          {
            for (uint64_t i = 0; i != v55; ++i)
            {
              if (*(void *)v494 != v56) {
                objc_enumerationMutation(v53);
              }
              v58 = [[PHSceneClassification alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v493 + 1) + 8 * i)];
              [v52 addObject:v58];
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v493 objects:v526 count:16];
          }
          while (v55);
        }

        uint64_t v59 = [v42 integerValue];
        if ((unint64_t)(v59 - 4) < 4)
        {
          [v443 removeSceneClassificationsOfType:v59];
          v60 = [(NSMutableDictionary *)self->_sceneClassificationDictionariesByType objectForKeyedSubscript:v42];
          v61 = [NSString stringWithUTF8String:"sceneAnalysisLocationVersion"];
          v62 = [v60 objectForKeyedSubscript:v61];

          v63 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
          if (v434)
          {
            objc_msgSend(v63, "setVaAnalysisVersion:", (__int16)objc_msgSend(v434, "integerValue"));
            goto LABEL_61;
          }
          if (v62)
          {
            objc_msgSend(v63, "setVaLocationAnalysisVersion:", (__int16)objc_msgSend(v62, "integerValue"));
LABEL_61:
            [v63 setVaAnalysisTimestamp:v439];
          }

          goto LABEL_63;
        }
        if ((unint64_t)(v59 - 2) >= 2)
        {
          if (v59) {
            goto LABEL_64;
          }
          objc_msgSend(v443, "removeSceneClassificationsOfType:");
          v64 = [v443 additionalAttributes];
          uint64_t v65 = [v434 shortValue];
        }
        else
        {
          [v443 removeTemporalSceneClassificationsOfType:v59];
          v64 = [v443 additionalAttributes];
          uint64_t v65 = (__int16)[v434 integerValue];
        }
        [v64 setSceneAnalysisVersion:v65];

        v62 = [v443 additionalAttributes];
        [v62 setSceneAnalysisTimestamp:v439];
LABEL_63:

LABEL_64:
        long long v491 = 0u;
        long long v492 = 0u;
        long long v489 = 0u;
        long long v490 = 0u;
        id v66 = v52;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v489 objects:v525 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v490;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v490 != v69) {
                objc_enumerationMutation(v66);
              }
              v71 = *(void **)(*((void *)&v489 + 1) + 8 * j);
              v72 = (void *)MEMORY[0x1E4F8AB80];
              uint64_t v73 = [v71 extendedSceneIdentifier];
              [v71 confidence];
              double v75 = v74;
              uint64_t v76 = [v71 packedBoundingBoxRect];
              [v71 startTime];
              double v78 = v77;
              [v71 duration];
              id v80 = (id)objc_msgSend(v72, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v442, v443, v73, v76, objc_msgSend(v71, "classificationType"), v75, v78, v79);
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v489 objects:v525 count:16];
          }
          while (v68);
        }

        uint64_t v41 = v431 + 1;
        id v8 = v443;
        self = v438;
      }
      while (v431 + 1 != v429);
      uint64_t v429 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v497 objects:v527 count:16];
      if (!v429)
      {
LABEL_73:

        *(void *)buf = 0;
        *(void *)&long long v505 = 0;
        v81 = [v8 uuid];
        PLStringUUIDComponents();

        kdebug_trace();
        BOOL didSetSceneClassifications = 1;
        break;
      }
    }
  }
  if (self->_didSetImageEmbeddingVersion)
  {
    v82 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v8];
    [v82 setImageEmbeddingVersion:self->_imageEmbeddingVersion];
  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    v83 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v8];
    [v83 setVideoEmbeddingVersion:self->_videoEmbeddingVersion];
  }
  if (self->_incrementPlayCount)
  {
    v84 = [v8 additionalAttributes];
    uint64_t v85 = [v84 pendingPlayCount];

    v86 = [v8 additionalAttributes];
    [v86 setPendingPlayCount:v85 + 1];
  }
  if (self->_incrementShareCount)
  {
    v87 = [v8 additionalAttributes];
    uint64_t v88 = [v87 pendingShareCount];

    v89 = [v8 additionalAttributes];
    [v89 setPendingShareCount:v88 + 1];
  }
  if (self->_lastSharedDate) {
    objc_msgSend(v8, "setLastSharedDate:");
  }
  if (self->_incrementViewCount)
  {
    v90 = [v8 additionalAttributes];
    uint64_t v91 = [v90 pendingViewCount];

    v92 = [v8 additionalAttributes];
    v93 = [MEMORY[0x1E4F1C9C8] date];
    [v92 setLastViewedDate:v93];

    v94 = [v8 additionalAttributes];
    [v94 setPendingViewCount:v91 + 1];
  }
  if (self->_clearLastSharedDate) {
    [v8 setLastSharedDate:0];
  }
  if (self->_clearLastViewedDate)
  {
    v95 = [v8 additionalAttributes];
    [v95 setLastViewedDate:0];
  }
  if (self->_didSetVariationSuggestionStates)
  {
    v96 = [v8 additionalAttributes];
    uint64_t v97 = [v96 variationSuggestionStates];

    unint64_t v98 = self->_variationSuggestionStates | v97 & ~self->_variationSuggestionStatesMask;
    v99 = [v8 additionalAttributes];
    [v99 setVariationSuggestionStates:v98];
  }
  if (self->_didSetTimeZone)
  {
    v100 = [v8 additionalAttributes];
    [v100 setTimeZoneName:self->_timeZoneName];

    v101 = [v8 additionalAttributes];
    v102 = [NSNumber numberWithInt:self->_timeZoneOffsetValue];
    [v101 setTimeZoneOffset:v102];
  }
  id v103 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v104 = [(PHAssetChangeRequest *)self facesHelper];
  v105 = [v104 mutableObjectIDsAndUUIDs];

  v430 = v104;
  if (v105)
  {
    [v104 setAllowsInsert:1];
    [v104 setAllowsMove:0];
    [v104 setAllowsRemove:1];
    [v104 setDestinationEntityName:@"DetectedFace"];
    v106 = [v8 mutableDetectedFaces];
    id v488 = v433;
    int v107 = [v104 applyMutationsToManagedObject:v8 unorderedMutableChildren:v106 error:&v488];
    id v108 = v488;

    int v415 = v107;
    if (v107)
    {
      v109 = [v106 allObjects];
      [v103 addObjectsFromArray:v109];
    }
    id v433 = v108;
  }
  v110 = [(PHAssetChangeRequest *)self temporalFacesHelper];
  v111 = [v110 mutableObjectIDsAndUUIDs];

  v432 = v103;
  v428 = v110;
  if (v111)
  {
    [v110 setAllowsInsert:1];
    [v110 setAllowsMove:0];
    [v110 setAllowsRemove:1];
    v112 = [MEMORY[0x1E4F8A7B0] entityName];
    [v110 setDestinationEntityName:v112];

    v113 = [v8 mutableTemporalDetectedFaces];
    id v487 = v433;
    int v114 = [v110 applyMutationsToManagedObject:v8 unorderedMutableChildren:v113 error:&v487];
    id v115 = v487;

    char v435 = 0;
    if (!v114)
    {
LABEL_114:

      id v433 = v115;
      goto LABEL_117;
    }
    v116 = [v113 allObjects];
    [v103 addObjectsFromArray:v116];
  }
  else
  {
    if (!v415)
    {
      char v435 = 0;
      goto LABEL_117;
    }
    id v115 = v433;
  }
  if ([v103 count])
  {
    long long v485 = 0u;
    long long v486 = 0u;
    long long v483 = 0u;
    long long v484 = 0u;
    id v117 = v103;
    uint64_t v118 = [v117 countByEnumeratingWithState:&v483 objects:v524 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v484;
      do
      {
        for (uint64_t k = 0; k != v119; ++k)
        {
          if (*(void *)v484 != v120) {
            objc_enumerationMutation(v117);
          }
          [*(id *)(*((void *)&v483 + 1) + 8 * k) fixAssetRelationshipsForFaceTorsoOrTemporal];
        }
        uint64_t v119 = [v117 countByEnumeratingWithState:&v483 objects:v524 count:16];
      }
      while (v119);
    }
  }
  v122 = [(PHRelationshipChangeRequestHelper *)self->_keywordsHelper mutableObjectIDsAndUUIDs];

  if (v122)
  {
    [(PHRelationshipChangeRequestHelper *)self->_keywordsHelper setAllowsInsert:1];
    [(PHRelationshipChangeRequestHelper *)self->_keywordsHelper setAllowsMove:0];
    keywordsHelper = self->_keywordsHelper;
    v124 = [MEMORY[0x1E4F8A970] entityName];
    [(PHRelationshipChangeRequestHelper *)keywordsHelper setDestinationEntityName:v124];

    v113 = [v443 additionalAttributes];
    v125 = [v113 mutableSetValueForKey:@"keywords"];
    v126 = self->_keywordsHelper;
    id v8 = v443;
    id v482 = v115;
    char v435 = [(PHRelationshipChangeRequestHelper *)v126 applyMutationsToManagedObject:v113 unorderedMutableChildren:v125 error:&v482];
    id v127 = v482;

    id v115 = v127;
    goto LABEL_114;
  }
  char v435 = 1;
  id v433 = v115;
  id v8 = v443;
LABEL_117:
  if (![(PHAssetChangeRequest *)self didChangeAdjustments]) {
    goto LABEL_152;
  }
  v128 = [(PHAssetChangeRequest *)self contentEditingOutput];
  v129 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    v130 = [v128 debugDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v130;
    _os_log_impl(&dword_19B043000, v129, OS_LOG_TYPE_DEFAULT, "Asset change request applying content editing output:\n%@", buf, 0xCu);
  }
  if ([v128 isOnlyChangingOriginalChoice])
  {
    if ([v8 hasAdjustments])
    {
      v131 = [MEMORY[0x1E4F8A678] assetAdjustmentOptionsForRevertingToOriginal];
      [v8 setAdjustments:0 options:v131];
    }
    goto LABEL_151;
  }
  uint64_t v132 = [v8 cameraProcessingAdjustmentState];
  if ([v8 cameraProcessingAdjustmentState] != v132) {
    [v8 setCameraProcessingAdjustmentState:v132];
  }
  if (![v128 isAsyncAdjustment])
  {
    v141 = (void *)MEMORY[0x1E4F8CDF8];
    v142 = [v8 originalUniformTypeIdentifier];
    v133 = [v141 typeWithIdentifier:v142];

    if ([v133 conformsToType:*MEMORY[0x1E4F44498]])
    {
      if ([(PHAssetChangeRequest *)self isRevertingContentToOriginal])
      {
        v143 = [v8 additionalAttributes];
        v144 = [v143 originalResourceChoice];
        BOOL v145 = didSetSceneClassifications;
        uint64_t v146 = [v144 integerValue];

        BOOL v147 = v146 == 3;
        BOOL didSetSceneClassifications = v145;
        if (v147)
        {
          v148 = [v8 additionalAttributes];
          [v148 setOriginalResourceChoice:&unk_1EEB254D0];
        }
      }
    }
    if (self->_didSetVisibilityState || ![v8 isPhotoIris]) {
      goto LABEL_145;
    }
    if ([(PHAssetChangeRequest *)self isRevertingContentToOriginal])
    {
      uint64_t v149 = 0;
    }
    else
    {
      v150 = [MEMORY[0x1E4F8B908] fileManager];
      v151 = [v128 renderedVideoComplementContentURL];
      [v151 path];
      v153 = BOOL v152 = didSetSceneClassifications;
      char v154 = [v150 fileExistsAtPath:v153];

      BOOL didSetSceneClassifications = v152;
      if (v154)
      {
LABEL_145:
        BOOL v155 = didSetSceneClassifications;
        v140 = [v128 assetAdjustmentsWithEditorBundleID:self->_editorBundleID];
        if ([(PHAssetChangeRequest *)self isRevertingContentToOriginal]) {
          [MEMORY[0x1E4F8A678] assetAdjustmentOptionsForRevertingToOriginal];
        }
        else {
        v156 = [v128 setAdjustmentsOptions];
        }
        [v8 setAdjustments:v140 options:v156];

        BOOL didSetSceneClassifications = v155;
        goto LABEL_149;
      }
      uint64_t v149 = [v8 videoCpVisibilityState] & 0xFFF4 | 1;
    }
    [v8 setVideoCpVisibilityState:v149];
    goto LABEL_145;
  }
  v133 = [v128 assetAdjustmentsWithEditorBundleID:self->_editorBundleID];
  v134 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
  {
    v135 = [v133 debugDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v135;
    _os_log_impl(&dword_19B043000, v134, OS_LOG_TYPE_DEBUG, "Asset change request applying async adjustments:\n%@", buf, 0xCu);
  }
  v136 = [v128 setAdjustmentsOptions];
  [v8 setAdjustments:v133 options:v136];

  v137 = [v128 playbackVariation];

  if (v137)
  {
    v138 = [v128 playbackVariation];
    objc_msgSend(v8, "setPlaybackVariation:", (unsigned __int16)objc_msgSend(v138, "integerValue"));
  }
  v139 = [v128 videoDuration];

  if (!v139 || ![v8 isVideo]) {
    goto LABEL_150;
  }
  v140 = [v128 videoDuration];
  [v140 doubleValue];
  objc_msgSend(v8, "setDuration:");
LABEL_149:

LABEL_150:
  *(void *)buf = 0;
  *(void *)&long long v505 = 0;
  v157 = [v8 uuid];
  PLStringUUIDComponents();

  kdebug_trace();
LABEL_151:

LABEL_152:
  v158 = [(PHAssetChangeRequest *)self contentEditingOutput];
  int v159 = [v158 isOnlyChangingOriginalChoice];

  v160 = [(PHAssetChangeRequest *)self contentEditingOutput];
  v161 = [v160 originalResourceChoice];
  v162 = v161;
  if (!v159)
  {

    if (v162)
    {
      v171 = [(PHAssetChangeRequest *)self contentEditingOutput];
      v172 = [v171 originalResourceChoice];
      unint64_t v173 = [v172 integerValue];

      v174 = [v8 additionalAttributes];
      v175 = [v174 originalResourceChoice];
      uint64_t v176 = [v175 integerValue];

      if (v173 == v176) {
        goto LABEL_213;
      }
      v177 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
      {
        if (v173 > 3) {
          v178 = 0;
        }
        else {
          v178 = off_1E5845480[v173];
        }
        v212 = v178;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v212;
        _os_log_impl(&dword_19B043000, v177, OS_LOG_TYPE_DEBUG, "Applying content editing output also changing original resource choice to %@", buf, 0xCu);
      }
      v213 = NSNumber;
      unint64_t v214 = v173;
    }
    else
    {
      if (!self->_didSetOriginalResourceChoice) {
        goto LABEL_213;
      }
      unint64_t originalResourceChoice = self->_originalResourceChoice;
      v180 = [v443 additionalAttributes];
      v181 = [v180 originalResourceChoice];
      uint64_t v182 = [v181 integerValue];

      BOOL v147 = originalResourceChoice == v182;
      id v8 = v443;
      if (v147) {
        goto LABEL_213;
      }
      v183 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v184 = self->_originalResourceChoice;
        if (v184 > 3) {
          v185 = 0;
        }
        else {
          v185 = off_1E5845480[v184];
        }
        v215 = v185;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v215;
        _os_log_impl(&dword_19B043000, v183, OS_LOG_TYPE_DEBUG, "Setting original resource choice to %@", buf, 0xCu);
      }
      v213 = NSNumber;
      unint64_t v214 = self->_originalResourceChoice;
    }
    v210 = [v213 numberWithUnsignedInteger:v214];
    v193 = [v8 additionalAttributes];
    [v193 setOriginalResourceChoice:v210];
LABEL_212:

    goto LABEL_213;
  }
  unint64_t v163 = [v161 integerValue];

  v164 = [v8 additionalAttributes];
  v165 = [v164 originalResourceChoice];
  uint64_t v166 = [v165 integerValue];

  if (v163 != v166)
  {
    v167 = [(PHAssetChangeRequest *)self contentEditingOutput];
    uint64_t v168 = [v167 renderedPreviewContentURL];

    v169 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
    {
      if (v163 > 3) {
        v170 = 0;
      }
      else {
        v170 = off_1E5845480[v163];
      }
      v186 = v170;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v186;
      _os_log_impl(&dword_19B043000, v169, OS_LOG_TYPE_DEBUG, "Setting original choice to %@ and mark asset for deferred rendering", buf, 0xCu);
    }
    v426 = (void *)v168;
    BOOL v422 = didSetSceneClassifications;

    v187 = [NSNumber numberWithUnsignedInteger:v163];
    v188 = [v8 additionalAttributes];
    [v188 setOriginalResourceChoice:v187];

    [v8 setDeferredProcessingNeeded:4];
    v189 = [v8 photoLibrary];
    v190 = [v189 libraryServicesManager];
    v191 = [v190 backgroundJobService];
    v192 = [v8 photoLibrary];
    [v191 signalBackgroundProcessingNeededOnLibrary:v192];

    v193 = [MEMORY[0x1E4F8B908] fileManager];
    [v8 unadjustedDerivativeImageURLs];
    long long v478 = 0u;
    long long v479 = 0u;
    long long v480 = 0u;
    long long v481 = 0u;
    id v194 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v195 = [v194 countByEnumeratingWithState:&v478 objects:v523 count:16];
    if (v195)
    {
      uint64_t v196 = v195;
      uint64_t v197 = *(void *)v479;
      do
      {
        for (uint64_t m = 0; m != v196; ++m)
        {
          if (*(void *)v479 != v197) {
            objc_enumerationMutation(v194);
          }
          v199 = *(void **)(*((void *)&v478 + 1) + 8 * m);
          id v477 = 0;
          int v200 = [v193 removeItemAtURL:v199 error:&v477];
          id v201 = v477;
          if (v200)
          {
            v202 = PLPhotoEditGetLog();
            if (os_log_type_enabled(v202, OS_LOG_TYPE_DEBUG))
            {
              v203 = [v199 path];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v203;
              _os_log_impl(&dword_19B043000, v202, OS_LOG_TYPE_DEBUG, "Changing original choice, removed unadjusted derivative file at path: %@", buf, 0xCu);
            }
            self = v438;
          }
          else
          {
            self = v438;
            if (PLIsErrorFileNotFound()) {
              goto LABEL_182;
            }
            v202 = PLPhotoEditGetLog();
            if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v201;
              _os_log_impl(&dword_19B043000, v202, OS_LOG_TYPE_ERROR, "Error removing unadjusted derivative due to changing R+J original choice: %@", buf, 0xCu);
            }
          }

LABEL_182:
        }
        uint64_t v196 = [v194 countByEnumeratingWithState:&v478 objects:v523 count:16];
      }
      while (v196);
    }

    [v8 setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
    long long v475 = 0u;
    long long v476 = 0u;
    long long v473 = 0u;
    long long v474 = 0u;
    v204 = [v8 modernResources];
    uint64_t v205 = [v204 countByEnumeratingWithState:&v473 objects:v522 count:16];
    if (v205)
    {
      uint64_t v206 = v205;
      uint64_t v207 = *(void *)v474;
      do
      {
        for (uint64_t n = 0; n != v206; ++n)
        {
          if (*(void *)v474 != v207) {
            objc_enumerationMutation(v204);
          }
          v209 = *(void **)(*((void *)&v473 + 1) + 8 * n);
          if (([v209 cplType] == 5
             || [v209 cplType] == 4
             || [v209 cplType] == 3
             || [v209 cplType] == 2)
            && ![v209 version]
            || [v209 recipeID] == 65747)
          {
            [v209 markAsNotLocallyAvailable];
            if ([v209 cplType] == 2 || objc_msgSend(v209, "recipeID") == 65747) {
              [v209 setLocalAvailabilityTarget:1];
            }
          }
        }
        uint64_t v206 = [v204 countByEnumeratingWithState:&v473 objects:v522 count:16];
      }
      while (v206);
    }

    v210 = v426;
    if (v426)
    {
      v211 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v426];
      if (v211) {
        [v8 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:v211 forceSRGBConversion:0];
      }
    }
    BOOL didSetSceneClassifications = v422;
    goto LABEL_212;
  }
LABEL_213:
  if (self->_didRevertLocationToOriginal && PLPlatformExtendedAttributesSupported())
  {
    v216 = [v8 extendedAttributes];
    v217 = v216;
    if (v216)
    {
      uint64_t v218 = [v216 latitude];
      if (v218)
      {
        v219 = (void *)v218;
        v220 = [v217 longitude];

        if (v220)
        {
          id v221 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          v222 = [v217 latitude];
          [v222 doubleValue];
          double v224 = v223;
          v225 = [v217 longitude];
          [v225 doubleValue];
          v227 = (void *)[v221 initWithLatitude:v224 longitude:v226];

          [v8 setLocation:v227];
          [v8 didSetCustomLocation];
        }
      }
    }
  }
  if (self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata
    && PLPlatformExtendedAttributesSupported())
  {
    id v472 = v433;
    char v435 = [v8 updateExtendedAttributesWithError:&v472];
    id v228 = v472;

    id v433 = v228;
  }
  if (self->_didTrashAllSpatialOverCaptureResources) {
    [v8 setTrashedStateOnSpatialOverCaptureResources:1];
  }
  if (self->_didUntrashAllSpatialOverCaptureResources) {
    [v8 setTrashedStateOnSpatialOverCaptureResources:0];
  }
  if (self->_didExpungeAllSpatialOverCaptureResources) {
    [v8 setTrashedStateOnSpatialOverCaptureResources:2];
  }
  if (self->_didExpungeTrashedSpatialOverCaptureResources) {
    [v8 expungeTrashedSpatialOverCaptureResources];
  }
  if (self->_didPromoteToGuestAsset)
  {
    id v471 = v433;
    char v435 = [v8 promoteToGuestAsset:&v471];
    id v229 = v471;
  }
  else
  {
    id v229 = v433;
  }
  if (self->_didResetGuestAssetPromotion)
  {
    id v470 = v229;
    v230 = v229;
    char v435 = [v8 resetGuestAssetPromotion:&v470];
    id v229 = v470;
  }
  id v433 = v229;
  if (self->_toRetryUpload)
  {
    v231 = [v8 photoLibrary];
    int v232 = [v231 isCloudPhotoLibraryEnabled];

    if (v232)
    {
      v233 = [v8 master];
      v234 = v233;
      if (v233)
      {
        BOOL v235 = didSetSceneClassifications;
        long long v468 = 0u;
        long long v469 = 0u;
        long long v466 = 0u;
        long long v467 = 0u;
        v236 = [v233 assets];
        uint64_t v237 = [v236 countByEnumeratingWithState:&v466 objects:v521 count:16];
        if (v237)
        {
          uint64_t v238 = v237;
          uint64_t v239 = *(void *)v467;
          do
          {
            for (iuint64_t i = 0; ii != v238; ++ii)
            {
              if (*(void *)v467 != v239) {
                objc_enumerationMutation(v236);
              }
              v241 = *(void **)(*((void *)&v466 + 1) + 8 * ii);
              if ([v241 cloudLocalState]) {
                [v241 setCloudLocalState:0];
              }
            }
            uint64_t v238 = [v236 countByEnumeratingWithState:&v466 objects:v521 count:16];
          }
          while (v238);
        }

        id v8 = v443;
        BOOL didSetSceneClassifications = v235;
        if (![v234 cloudLocalState]) {
          goto LABEL_253;
        }
        v242 = v234;
      }
      else
      {
        if (![v8 cloudLocalState])
        {
LABEL_253:

          goto LABEL_254;
        }
        v242 = v8;
      }
      [v242 setCloudLocalState:0];
      goto LABEL_253;
    }
  }
LABEL_254:
  uint64_t v243 = [(PHAssetChangeRequest *)self modificationDate];
  if (v243) {
    [v8 setModificationDate:v243];
  }
  v427 = (void *)v243;
  if (self->_didModifyComputedAttributes)
  {
    v244 = [v8 computedAttributes];

    if (!v244)
    {
      v245 = [v8 managedObjectContext];
      v246 = [MEMORY[0x1E4F8A758] entityName];
      uint64_t v465 = 0;
      v247 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
      id v248 = 0;

      if (!v247)
      {
        a5 = v421;
        if (v421) {
          id *v421 = v248;
        }

        int v410 = 0;
        goto LABEL_480;
      }
      [v8 setComputedAttributes:v247];
    }
    long long v463 = 0u;
    long long v464 = 0u;
    long long v461 = 0u;
    long long v462 = 0u;
    v249 = self->_computedAttributeMutations;
    uint64_t v250 = [(NSMutableDictionary *)v249 countByEnumeratingWithState:&v461 objects:v520 count:16];
    if (v250)
    {
      uint64_t v251 = v250;
      uint64_t v252 = *(void *)v462;
      do
      {
        for (juint64_t j = 0; jj != v251; ++jj)
        {
          if (*(void *)v462 != v252) {
            objc_enumerationMutation(v249);
          }
          uint64_t v254 = *(void *)(*((void *)&v461 + 1) + 8 * jj);
          v255 = [v443 computedAttributes];
          v256 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKeyedSubscript:v254];
          [v255 setValue:v256 forKey:v254];
        }
        uint64_t v251 = [(NSMutableDictionary *)v249 countByEnumeratingWithState:&v461 objects:v520 count:16];
      }
      while (v251);
    }

    BOOL didSetSceneClassifications = 1;
  }
  if (self->_mediaAnalysisTimeStamp)
  {
    v257 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v257 setMediaAnalysisTimeStamp:self->_mediaAnalysisTimeStamp];

    BOOL didSetSceneClassifications = 1;
  }
  didSetMediaAnalysisVersiouint64_t n = self->_didSetMediaAnalysisVersion;
  if (self->_didSetMediaAnalysisVersion)
  {
    v259 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v259 setMediaAnalysisVersion:self->_mediaAnalysisVersion];

    BOOL didSetSceneClassifications = 1;
  }
  if (self->_didSetMediaAnalysisImageVersion)
  {
    v260 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v260 setMediaAnalysisImageVersion:self->_mediaAnalysisImageVersion];

    didSetMediaAnalysisVersiouint64_t n = 1;
    BOOL didSetSceneClassifications = 1;
  }
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v261 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    long long v262 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)buf = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&buf[16] = v262;
    long long v519 = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    [v261 setBestVideoTimeRange:buf];
  }
  BOOL v423 = didSetSceneClassifications;
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    v263 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    long long v264 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)buf = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&buf[16] = v264;
    long long v519 = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    [v263 setAnimatedStickerTimeRange:buf];
  }
  p_bestKeyFrameTime = &self->_bestKeyFrameTime;
  if (self->_bestKeyFrameTime.flags)
  {
    v266 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)buf = *(_OWORD *)&p_bestKeyFrameTime->value;
      *(void *)&buf[16] = self->_bestKeyFrameTime.epoch;
      v267 = (id)CMTimeCopyDescription(0, (CMTime *)buf);
      NSUInteger v268 = [(NSData *)self->_bestKeyFrameJPEGData length];
      v269 = [v443 uuid];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v267;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v268;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v269;
      _os_log_impl(&dword_19B043000, v266, OS_LOG_TYPE_DEBUG, "Setting best key frame time: %@ key frame image length: %lu for asset: %@", buf, 0x20u);
    }
    *(_OWORD *)buf = *(_OWORD *)&p_bestKeyFrameTime->value;
    *(void *)&buf[16] = self->_bestKeyFrameTime.epoch;
    [v443 setVideoKeyFrameTime:buf];
  }
  if (self->_didUnsetBestKeyFrameTime)
  {
    *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v443 setVideoKeyFrameTime:buf];
  }
  int v270 = v423;
  if (self->_bestKeyFrameJPEGData)
  {
    if ([v443 isLocalVideoKeyFrameValid])
    {
      CGImageSourceRef v271 = CGImageSourceCreateWithData((CFDataRef)self->_bestKeyFrameJPEGData, 0);
      if (!v271) {
        goto LABEL_300;
      }
      CGImageSourceRef v272 = v271;
      v273 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v273, OS_LOG_TYPE_DEBUG))
      {
        v274 = [v443 uuid];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v274;
        _os_log_impl(&dword_19B043000, v273, OS_LOG_TYPE_DEBUG, "Regenerating thumbs for new best key frame for asset: %@", buf, 0xCu);
      }
      id v459 = 0;
      id v460 = 0;
      [MEMORY[0x1E4F8A950] createThumbnailImage:&v460 previewImage:&v459 withToBeReleasedImageSource:v272];
      v275 = v460;
      id v276 = v459;
      [v443 generateAndUpdateThumbnailsWithPreviewImage:v276 thumbnailImage:v275 fromImageSource:0 imageData:0 forceSRGBConversion:0];
    }
    else
    {
      v275 = PLThumbnailsGetLog();
      if (!os_log_type_enabled(v275, OS_LOG_TYPE_DEBUG))
      {
LABEL_299:

        goto LABEL_300;
      }
      id v276 = [v443 uuid];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v276;
      _os_log_impl(&dword_19B043000, v275, OS_LOG_TYPE_DEBUG, "Video key frame incompatible with asset: %{public}@, skipping thumbnail update", buf, 0xCu);
    }

    goto LABEL_299;
  }
LABEL_300:
  if (self->_computeSyncMediaAnalysisPayload)
  {
    v277 = (void *)MEMORY[0x1E4F1CB10];
    v278 = [v443 pathForComputeSyncMediaAnalysisPayloadFile];
    v279 = [v277 fileURLWithPath:v278];

    v280 = [MEMORY[0x1E4F28CB8] defaultManager];
    v281 = [v279 URLByDeletingLastPathComponent];
    id v458 = 0;
    char v282 = [v280 createDirectoryAtURL:v281 withIntermediateDirectories:1 attributes:0 error:&v458];
    id v283 = v458;

    if ((v282 & 1) == 0)
    {
      v284 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
      {
        v285 = [v443 uuid];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v285;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v283;
        _os_log_impl(&dword_19B043000, v284, OS_LOG_TYPE_ERROR, "Failed to create pathForMediaAnalysisComputeSyncSidecarPayload for asset %@ error: %@", buf, 0x16u);
      }
    }
    [(NSData *)self->_computeSyncMediaAnalysisPayload writeToURL:v279 atomically:1];

    int v270 = v423;
  }
  if (self->_didSetPackedPreferredCropRect) {
    [v443 setPackedPreferredCropRect:self->_packedPreferredCropRect];
  }
  if (self->_didSetPackedAcceptableCropRect) {
    [v443 setPackedAcceptableCropRect:self->_packedAcceptableCropRect];
  }
  if (self->_didSetPackedBestPlaybackRect)
  {
    v286 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v286 setPackedBestPlaybackRect:self->_packedBestPlaybackRect];
  }
  if (self->_didSetWallpaperPropertiesVersion)
  {
    v287 = [(PHAssetChangeRequest *)self getPhotoAnalysisAttributesForAsset:v443];
    [v287 setWallpaperPropertiesVersion:self->_wallpaperPropertiesVersion];

    int v270 = 1;
  }
  if (self->_didSetWallpaperPropertiesTimestamp)
  {
    v288 = [(PHAssetChangeRequest *)self getPhotoAnalysisAttributesForAsset:v443];
    [v288 setWallpaperPropertiesTimestamp:self->_wallpaperPropertiesTimestamp];
  }
  if (self->_didSetWallpaperPropertiesData)
  {
    v289 = [(PHAssetChangeRequest *)self getPhotoAnalysisAttributesForAsset:v443];
    [v289 setWallpaperPropertiesData:self->_wallpaperPropertiesData];
  }
  if (self->_didSetBlurrinessScore)
  {
    v290 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v291 = self->_blurrinessScore;
    [v290 setBlurrinessScore:v291];
  }
  if (self->_didSetExposureScore)
  {
    v292 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v293 = self->_exposureScore;
    [v292 setExposureScore:v293];
  }
  if (self->_didSetWallpaperScore)
  {
    v294 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v295 = self->_wallpaperScore;
    [v294 setWallpaperScore:v295];
  }
  if (self->_didSetAutoplaySuggestionScore)
  {
    v296 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v297 = self->_autoplaySuggestionScore;
    [v296 setAutoplaySuggestionScore:v297];
  }
  if (self->_didSetVideoStickerSuggestionScore)
  {
    v298 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v299 = self->_videoStickerSuggestionScore;
    [v298 setVideoStickerSuggestionScore:v299];
  }
  if (self->_didSetVideoScore)
  {
    v300 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v301 = self->_videoScore;
    [v300 setVideoScore:v301];
  }
  if (self->_didSetActivityScore)
  {
    v302 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v303 = self->_activityScore;
    [v302 setActivityScore:v303];
  }
  if (self->_didSetAudioScore)
  {
    v304 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v305 = self->_audioScore;
    [v304 setAudioScore:v305];
  }
  if (self->_didSetSettlingEffectScore)
  {
    v306 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v307 = self->_settlingEffectScore;
    [v306 setSettlingEffectScore:v307];
  }
  if (self->_didSetFaceCount)
  {
    v308 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v308 setFaceCount:self->_faceCount];
  }
  if (self->_didSetAudioClassification)
  {
    v309 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v309 setAudioClassification:self->_audioClassification];

    int v270 = 1;
  }
  if (self->_didSetProbableRotationDirection)
  {
    v310 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v310 setProbableRotationDirection:self->_probableRotationDirection];
  }
  if (self->_didSetProbableRotationDirectionConfidence)
  {
    v311 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    *(float *)&double v312 = self->_probableRotationDirectionConfidence;
    [v311 setProbableRotationDirectionConfidence:v312];
  }
  if (self->_colorNormalizationData)
  {
    v313 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v313 setColorNormalizationData:self->_colorNormalizationData];
  }
  if (self->_resetCharacterRecognitionProperties)
  {
    v314 = v443;
    v315 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v315 resetCharacterRecognitionAttributes];
  }
  else
  {
    v314 = v443;
    if (!self->_didSetCharacterRecognitionData) {
      goto LABEL_351;
    }
    v315 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    [v315 setCharacterRecognitionData:self->_characterRecognitionData machineReadableCodeData:self->_machineReadableCodeData algorithmVersion:SLOWORD(self->_characterRecognitionAlgorithmVersion) adjustmentVersion:self->_characterRecognitionAdjustmentVersion];
    int v270 = 1;
  }

LABEL_351:
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    [MEMORY[0x1E4F8A840] resetGeneratedAssetDescriptionsForAsset:v314];
  }
  else if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    [MEMORY[0x1E4F8A840] setGeneratedAssetDescriptionForAsset:v314 fromDictionaries:self->_generatedAssetDescriptionDictionaries];
    int v270 = 1;
  }
  if (self->_resetVisualSearchProperties)
  {
    PLResetMediaProcessingStateOnAsset();
  }
  else if (self->_didSetVisualSearchProperties)
  {
    v316 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v314];
    v318 = v316;
    if (self->_didSetStickerConfidenceScore)
    {
      *(float *)&double v317 = self->_stickerConfidenceScore;
      [v316 setStickerConfidenceScore:SLOWORD(self->_stickerConfidenceScoreAlgorithmVersion) stickerAlgorithmVersion:v317];
    }
    if (self->_didSetVisualSearchData) {
      [v318 setVisualSearchData:self->_visualSearchData algorithmVersion:SLOWORD(self->_visualSearchAlgorithmVersion) adjustmentVersion:self->_visualSearchAdjustmentVersion];
    }

    int v270 = 1;
  }
  v319 = v314;
  BOOL resetWallpaperProperties = self->_resetWallpaperProperties;
  v321 = [(PHAssetChangeRequest *)self getPhotoAnalysisAttributesForAsset:v319];
  v322 = v321;
  if (resetWallpaperProperties)
  {
    [v321 setWallpaperPropertiesTimestamp:0];
    [v322 setWallpaperPropertiesData:0];
    wallpaperPropertiesVersiouint64_t n = 0;
    v324 = v443;
    a5 = v421;
LABEL_371:
    [v322 setWallpaperPropertiesVersion:wallpaperPropertiesVersion];
    goto LABEL_372;
  }
  if (self->_didSetWallpaperPropertiesTimestamp) {
    [v321 setWallpaperPropertiesTimestamp:self->_wallpaperPropertiesTimestamp];
  }
  v324 = v443;
  if (self->_didSetWallpaperPropertiesData) {
    [v322 setWallpaperPropertiesData:self->_wallpaperPropertiesData];
  }
  a5 = v421;
  if (self->_didSetWallpaperPropertiesVersion)
  {
    wallpaperPropertiesVersiouint64_t n = self->_wallpaperPropertiesVersion;
    int v270 = 1;
    goto LABEL_371;
  }
LABEL_372:

  if (self->_didSetSyndicationProcessingValue)
  {
    v325 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v324];
    [v325 setSyndicationProcessingValue:self->_syndicationProcessingValue];
  }
  if (self->_didSetSyndicationProcessingVersion)
  {
    v326 = [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v324];
    [v326 setSyndicationProcessingVersion:self->_syndicationProcessingVersion];
  }
  if (self->_didSetSyndicationIdentifier)
  {
    syndicationIdentifier = self->_syndicationIdentifier;
    v328 = [v324 additionalAttributes];
    [v328 setSyndicationIdentifier:syndicationIdentifier];
  }
  if (self->_didSetFaceAnalysisVersion)
  {
    faceAnalysisVersiouint64_t n = self->_faceAnalysisVersion;
    v330 = [v324 additionalAttributes];
    [v330 setFaceAnalysisVersion:faceAnalysisVersion];

    int v270 = 1;
  }
  if (self->_didSetLocalAnalysisStage)
  {
    int localAnalysisStage = self->_localAnalysisStage;
    v332 = [v443 computeSyncAttributes];
    int v333 = [v332 localAnalysisStage];

    if (localAnalysisStage <= v333)
    {
      int v334 = self->_localAnalysisStage;
      v335 = [v443 computeSyncAttributes];
      int v336 = [v335 localAnalysisStage];

      if (v334 < v336)
      {
        v337 = PLBackendGetLog();
        if (os_log_type_enabled(v337, OS_LOG_TYPE_INFO))
        {
          v338 = [v443 computeSyncAttributes];
          int v339 = [v338 localAnalysisStage];
          int v340 = self->_localAnalysisStage;
          v341 = [(PHChangeRequest *)self clientBundleID];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v339;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v340;
          *(_WORD *)&buf[14] = 2114;
          *(void *)&buf[16] = v341;
          _os_log_impl(&dword_19B043000, v337, OS_LOG_TYPE_INFO, "[CCSS] Quietly dropping attempt to downgrade analysis stage from %d to %d by client: %{public}@", buf, 0x18u);

          a5 = v421;
        }
      }
    }
    else
    {
      [MEMORY[0x1E4F8A750] updateLocalComputeSyncStageAfterProcessingForAsset:v443 stage:self->_localAnalysisStage];
    }
  }
  if (self->_didSetViewPresentation)
  {
    viewPresentatiouint64_t n = self->_viewPresentation;
    v343 = [v443 additionalAttributes];
    [v343 setViewPresentation:viewPresentation];
  }
  if (self->_didSetSceneprintData)
  {
    v344 = [v443 additionalAttributes];
    [v344 setSceneprintWithData:self->_sceneprintData];
  }
  if (self->_didSetDuplicateMatchingData)
  {
    v345 = [v443 additionalAttributes];
    [v345 setDuplicateMatchingData:self->_duplicateMatchingData duplicateMatchingAlternateData:self->_duplicateMatchingAlternateData processingSucceeded:self->_duplicateProcessingSucceeded];

    int v270 = 1;
  }
  if (self->_didSetReverseLocationData)
  {
    v346 = [v443 additionalAttributes];
    [v346 setReverseLocationData:self->_reverseLocationData];
  }
  if (self->_didSetReverseLocationDataIsValid)
  {
    v347 = [v443 additionalAttributes];
    v348 = [NSNumber numberWithBool:self->_reverseLocationDataIsValid];
    [v347 setReverseLocationDataIsValid:v348];
  }
  if (self->_didSetShiftedLocation)
  {
    v349 = [v443 additionalAttributes];
    [v349 setShiftedLocation:self->_shiftedLocation];

    v350 = [v443 additionalAttributes];
    [v350 setShiftedLocationIsValid:1];
  }
  if (self->_didSetObjectSaliencyRectsData)
  {
    v351 = [v443 additionalAttributes];
    [v351 setObjectSaliencyRectsData:self->_objectSaliencyRectsData];
  }
  if (self->_alternateImportImageDate)
  {
    v352 = [v443 additionalAttributes];
    [v352 setAlternateImportImageDate:self->_alternateImportImageDate];
  }
  if (self->_didSetSavedAssetType) {
    [v443 setSavedAssetType:self->_savedAssetType];
  }
  if (v270)
  {
    v353 = [MEMORY[0x1E4F1C9C8] date];
    [v443 setAnalysisStateModificationDate:v353];
  }
  if (didSetMediaAnalysisVersion)
  {
    v354 = [v443 photoLibrary];
    [v354 signalBackgroundProcessingNeeded];
  }
  char v355 = v435;
  if (self->_didSetKeywordTitles)
  {
    v356 = [v442 keywordManager];
    char v357 = [v356 setKeywords:self->_keywordTitles forAsset:v443];
    if ((v357 & 1) == 0)
    {
      v358 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v516 = *MEMORY[0x1E4F28568];
      v517 = @"Setting keywords failed";
      v359 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v517 forKeys:&v516 count:1];
      uint64_t v360 = objc_msgSend(v358, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v359);

      id v433 = (id)v360;
    }

    char v355 = v357;
  }
  if (self->_didSetScreenTimeDeviceImageSensitivity)
  {
    [(PHAssetChangeRequest *)self getMediaAnalysisAttributesForAsset:v443];
    v362 = char v361 = v355;
    [v362 setScreenTimeDeviceImageSensitivity:self->_screenTimeDeviceImageSensitivity];

    char v355 = v361;
  }
  pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
  if (pathsToNewAssetResourcesByAssetResourceType)
  {
    long long v456 = 0u;
    long long v457 = 0u;
    long long v455 = 0u;
    long long v454 = 0u;
    v440 = [(NSDictionary *)pathsToNewAssetResourcesByAssetResourceType allKeys];
    uint64_t v364 = [v440 countByEnumeratingWithState:&v454 objects:v515 count:16];
    if (!v364) {
      goto LABEL_438;
    }
    uint64_t v365 = v364;
    uint64_t v366 = *(void *)v455;
    uint64_t v436 = *MEMORY[0x1E4F28228];
    while (1)
    {
      for (kuint64_t k = 0; kk != v365; ++kk)
      {
        if (*(void *)v455 != v366) {
          objc_enumerationMutation(v440);
        }
        v368 = *(void **)(*((void *)&v454 + 1) + 8 * kk);
        uint64_t v369 = [v368 integerValue];
        if (v369 == 20 || v369 == 114 || v369 == 109)
        {
          v370 = [(NSDictionary *)self->_pathsToNewAssetResourcesByAssetResourceType objectForKeyedSubscript:v368];
          uint64_t v371 = [v368 integerValue];
          switch(v371)
          {
            case 20:
              v452 = 0;
              char v372 = [v443 installExistingAlchemistImageAtPath:v370 error:&v452];
              v373 = v452;
              break;
            case 114:
              v451 = 0;
              char v372 = [v443 installExistingGenerativePlaygroundFaceResourcesFileAtPath:v370 error:&v451];
              v373 = v451;
              break;
            case 109:
              v453 = 0;
              char v372 = [v443 installExistingWallpaperComputeResourcesFileAtPath:v370 error:&v453];
              v373 = v453;
              break;
            default:
              v375 = [NSString stringWithFormat:@"adding asset resource type %@ is allowed but not currently suppported", v368];
              v380 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v513 = v436;
              v514 = v375;
              v379 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v514 forKeys:&v513 count:1];
              uint64_t v378 = objc_msgSend(v380, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v379);

              goto LABEL_435;
          }
          id v377 = v373;
          v375 = v377;
          if (v372) {
            goto LABEL_436;
          }
          id v376 = v377;
          v375 = v376;
        }
        else
        {
          v370 = [NSString stringWithFormat:@"adding asset resource of type %@ is not allowed", v368];
          v374 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v511 = v436;
          v512 = v370;
          v375 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v512 forKeys:&v511 count:1];
          objc_msgSend(v374, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v375);
          id v376 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v378 = (uint64_t)v376;
        v379 = v433;
LABEL_435:

        char v355 = 0;
        id v433 = (id)v378;
LABEL_436:

        self = v438;
      }
      uint64_t v365 = [v440 countByEnumeratingWithState:&v454 objects:v515 count:16];
      if (!v365)
      {
LABEL_438:

        a5 = v421;
        break;
      }
    }
  }
  assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
  if (assetResourceTypesToDelete)
  {
    long long v449 = 0u;
    long long v450 = 0u;
    long long v447 = 0u;
    long long v448 = 0u;
    v441 = assetResourceTypesToDelete;
    uint64_t v382 = [(NSSet *)v441 countByEnumeratingWithState:&v447 objects:v510 count:16];
    if (v382)
    {
      uint64_t v383 = v382;
      uint64_t v384 = *(void *)v448;
      uint64_t v437 = *MEMORY[0x1E4F28228];
      do
      {
        for (muint64_t m = 0; mm != v383; ++mm)
        {
          if (*(void *)v448 != v384) {
            objc_enumerationMutation(v441);
          }
          v386 = *(void **)(*((void *)&v447 + 1) + 8 * mm);
          uint64_t v387 = [v386 integerValue];
          uint64_t v388 = v387;
          if (v387 == 20 || v387 == 114 || v387 == 109)
          {
            v389 = [MEMORY[0x1E4F28CB8] defaultManager];
            v390 = PathForDeletableAssetResourceType(v443, v388);
            id v446 = 0;
            char v391 = [v389 removeItemAtPath:v390 error:&v446];
            id v392 = v446;

            if (v391 & 1) != 0 || (PLIsErrorFileNotFound())
            {
              self = v438;
              if (v355)
              {
                switch(v388)
                {
                  case 20:
                    uint64_t v393 = 66137;
                    break;
                  case 114:
                    uint64_t v393 = 327693;
                    break;
                  case 109:
                    uint64_t v393 = 327687;
                    break;
                  default:
                    uint64_t v393 = 0;
                    break;
                }
                [v443 deleteResourcesWithRecipeID:v393 andVersion:3];
              }
            }
            else
            {
              id v392 = v392;

              char v355 = 0;
              id v433 = v392;
              self = v438;
            }
          }
          else
          {
            id v392 = [NSString stringWithFormat:@"deleting asset resource of type %@ is not allowed", v386];
            v394 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v508 = v437;
            id v509 = v392;
            v395 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v509 forKeys:&v508 count:1];
            uint64_t v396 = objc_msgSend(v394, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v395);

            char v355 = 0;
            id v433 = (id)v396;
          }
        }
        uint64_t v383 = [(NSSet *)v441 countByEnumeratingWithState:&v447 objects:v510 count:16];
      }
      while (v383);
    }

    v397 = v433;
    a5 = v421;
    if ((v355 & 1) == 0) {
      goto LABEL_464;
    }
LABEL_466:
    v399 = [(PHRelationshipChangeRequestHelper *)self->_commentsHelper mutableObjectIDsAndUUIDs];

    if (v399)
    {
      id v445 = v397;
      BOOL v400 = [(PHAssetChangeRequest *)self applyMutationsToAssetRelationshipWithKey:@"cloudComments" asset:v443 error:&v445];
      id v433 = v445;

      if (!v400)
      {
        char v398 = 0;
        goto LABEL_474;
      }
      char v355 = 1;
    }
    else
    {
      id v433 = v397;
    }
    v401 = [(PHRelationshipChangeRequestHelper *)self->_likesHelper mutableObjectIDsAndUUIDs];

    if (v401)
    {
      id v444 = v433;
      BOOL v402 = [(PHAssetChangeRequest *)self applyMutationsToAssetRelationshipWithKey:@"likeComments" asset:v443 error:&v444];
      id v403 = v444;

      id v433 = v403;
      char v398 = v402;
    }
    else
    {
      char v398 = v355;
    }
    goto LABEL_474;
  }
  v397 = v433;
  if (v355) {
    goto LABEL_466;
  }
LABEL_464:
  char v398 = v355;
  id v433 = v397;
LABEL_474:
  if (self->_libraryScopeOriginatorUUIDs)
  {
    char v404 = v398;
    v405 = [v443 libraryScope];
    if (v405)
    {
      v406 = (void *)MEMORY[0x1E4F8ABD8];
      v407 = [(NSSet *)self->_libraryScopeOriginatorUUIDs allObjects];
      v408 = [v406 participantsWithUUIDs:v407 inPhotoLibrary:v442];

      v409 = [MEMORY[0x1E4F1CAD0] setWithArray:v408];
      [v443 setLibraryScope:v405 withContributors:v409];
    }
    char v398 = v404;
  }
  if (!self->_didSetPtpTrashedState)
  {
    int v410 = 1;
    v412 = v428;
    v411 = v430;
    goto LABEL_482;
  }
  char v435 = v398;
  v245 = [v443 additionalAttributes];
  [v245 setPtpTrashedState:self->_ptpTrashedState];
  int v410 = 1;
LABEL_480:
  v412 = v428;
  v411 = v430;

  char v398 = v435;
LABEL_482:

  if (!v410)
  {
    BOOL v28 = 0;
    id v8 = v443;
    id v413 = v433;
    goto LABEL_488;
  }
  BOOL v28 = v398 & 1;
  id v8 = v443;
LABEL_484:
  id v413 = v433;
  if (a5 && !v28)
  {
    id v413 = v433;
    BOOL v28 = 0;
    *a5 = v413;
  }
LABEL_488:

  return v28;
}

- (BOOL)validateReadAccessForContentURL:(id)a3 assetResource:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isFileURL])
  {
    if (!PLIsAssetsd()
      || [(PHChangeRequest *)self isClientEntitled]
      || ([v9 duplicateAllowsReadAccess] & 1) != 0)
    {
      goto LABEL_7;
    }
    int v10 = [v8 path];
    if ([MEMORY[0x1E4F8B9C8] processWithID:self->_clientProcessIdentifier canReadSandboxForPath:v10])
    {

LABEL_7:
      id v11 = 0;
      BOOL v12 = 1;
      goto LABEL_12;
    }
    char v16 = (void *)MEMORY[0x1E4F28C58];
    id v14 = [NSString stringWithFormat:@"Invalid URL %@", v8, *MEMORY[0x1E4F28568]];
    id v19 = v14;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    int v10 = [NSString stringWithFormat:@"Invalid URL %@", v8];
    v21[0] = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a5 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)getPhotoAnalysisAttributesForAsset:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 photoAnalysisAttributes];

  if (v4)
  {
    v5 = [v3 photoAnalysisAttributes];
  }
  else
  {
    v6 = [v3 managedObjectContext];
    v7 = [MEMORY[0x1E4F8AA18] entityName];
    v5 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();

    if (v5) {
      [v3 setPhotoAnalysisAttributes:v5];
    }
  }

  return v5;
}

- (id)getMediaAnalysisAttributesForAsset:(id)a3
{
  return (id)[a3 mediaAnalysisAttributesInsertingIfNecessary];
}

- (BOOL)validateWriteAccessForContentURL:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isFileURL])
  {
    if (!PLIsAssetsd() || [(PHChangeRequest *)self isClientEntitled]) {
      goto LABEL_6;
    }
    v7 = [v6 path];
    if ([MEMORY[0x1E4F8B9C8] processWithID:self->_clientProcessIdentifier canWriteSandboxForPath:v7])
    {

LABEL_6:
      id v8 = 0;
      BOOL v9 = 1;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [NSString stringWithFormat:@"Invalid URL %@", v6, *MEMORY[0x1E4F28568]];
    char v16 = v11;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v14);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v7 = [NSString stringWithFormat:@"Invalid URL %@", v6];
    v18[0] = v7;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a4)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_11:

  return v9;
}

- (BOOL)validateContentEditingOutput:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 adjustmentData];
  if (v7)
  {
    id v42 = 0;
    BOOL v8 = [(PHAssetChangeRequest *)self validateAdjustmentDataForAssetMutation:v7 error:&v42];
    id v9 = v42;
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = @"Missing adjustment data";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v8 = 0;
  }
  uint64_t v12 = [v6 renderedContentURL];
  v13 = (void *)v12;
  if (v8 && v12)
  {
    id v41 = v9;
    BOOL v14 = [(PHAssetChangeRequest *)self validateWriteAccessForContentURL:v12 error:&v41];
    id v15 = v41;

    if (!v14) {
      goto LABEL_30;
    }
    id v9 = v15;
  }
  else if (!v8)
  {
    BOOL v16 = 0;
    id v15 = v9;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  if ([v6 isAsyncAdjustment])
  {
    id v40 = v9;
    BOOL v16 = [(PHAssetChangeRequest *)self _validateAsyncContentEditingOutputPreviewRenderURLs:v6 error:&v40];
    uint64_t v17 = v40;
LABEL_11:
    id v15 = v17;
    goto LABEL_12;
  }
  if (([v6 isAsyncAdjustment] & 1) == 0)
  {
    uint64_t v18 = [v6 mediaType];
    if (v18 == 2)
    {
      if (v13)
      {
        id v37 = v9;
        BOOL v19 = [(PHAssetChangeRequest *)self validateVideoURLForAssetMutation:v13 error:&v37];
        uint64_t v20 = v37;
        goto LABEL_24;
      }
      id v28 = objc_alloc(MEMORY[0x1E4F8CE18]);
      v29 = [v7 formatIdentifier];
      v30 = [v7 formatVersion];
      v31 = [v7 data];
      v32 = (void *)[v28 initWithFormatIdentifier:v29 formatVersion:v30 data:v31 baseVersion:0 editorBundleID:0 renderTypes:0];

      if ([v32 isRecognizedFormat])
      {

LABEL_26:
        if ([v6 isLoopingLivePhoto])
        {
          id v36 = v9;
          BOOL v16 = [(PHAssetChangeRequest *)self _validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:v6 error:&v36];
          uint64_t v17 = v36;
          goto LABEL_11;
        }
        goto LABEL_17;
      }
      BOOL v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      long long v46 = @"Missing rendered video content";
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      objc_msgSend(v33, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v34);
      v35 = v32;
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v16 = 0;
      id v9 = v35;
    }
    else
    {
      if (v18 == 1)
      {
        if (![v6 isLoopingLivePhoto])
        {
          id v38 = v9;
          BOOL v26 = [(PHAssetChangeRequest *)self _validateImageURLForAssetMutation:v13 error:&v38];
          id v15 = v38;

          if (v26) {
            goto LABEL_25;
          }
          goto LABEL_30;
        }
        id v39 = v9;
        BOOL v19 = [(PHAssetChangeRequest *)self validateVideoURLForAssetMutation:v13 error:&v39];
        uint64_t v20 = v39;
LABEL_24:
        id v15 = v20;

        if (v19)
        {
LABEL_25:
          id v9 = v15;
          goto LABEL_26;
        }
LABEL_30:
        BOOL v16 = 0;
        if (!a4) {
          goto LABEL_33;
        }
        goto LABEL_31;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      uint64_t v22 = NSString;
      uint64_t v23 = [NSNumber numberWithInteger:v18];
      uint64_t v24 = [v22 stringWithFormat:@"Cannot modify content type %@", v23];
      long long v44 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      objc_msgSend(v21, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v25);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v16 = 0;
      id v9 = (id)v23;
    }
LABEL_12:

    if (!a4) {
      goto LABEL_33;
    }
LABEL_31:
    if (!v16)
    {
      id v9 = v15;
      BOOL v16 = 0;
      *a4 = v9;
      goto LABEL_34;
    }
LABEL_33:
    id v9 = v15;
    goto LABEL_34;
  }
LABEL_17:
  BOOL v16 = 1;
LABEL_34:

  return v16;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PHChangeRequest *)self helper];
  id v77 = 0;
  int v8 = [v7 validateMutationsToManagedObject:v6 error:&v77];
  id v9 = v77;

  if (!v8) {
    goto LABEL_8;
  }
  int v10 = [(PHAssetChangeRequest *)self assetDescription];
  id v76 = v9;
  BOOL v11 = [(PHAssetChangeRequest *)self validateAssetDescription:v10 error:&v76];
  id v12 = v76;

  if (!v11)
  {
    id v9 = v12;
LABEL_8:
    BOOL v16 = [(PHAssetChangeRequest *)self contentEditingOutput];
    goto LABEL_9;
  }
  v13 = [(PHAssetChangeRequest *)self accessibilityDescription];
  id v75 = v12;
  BOOL v14 = [(PHAssetChangeRequest *)self validateAccessibilityDescription:v13 error:&v75];
  id v9 = v75;

  id v15 = [(PHAssetChangeRequest *)self contentEditingOutput];
  BOOL v16 = v15;
  if (!v14) {
    goto LABEL_9;
  }
  if ([v15 isOnlyChangingOriginalChoice])
  {
    uint64_t v17 = [v16 originalResourceChoice];
    unint64_t v18 = [v17 integerValue];

    if (v18 >= 2)
    {
      BOOL v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v88 = *MEMORY[0x1E4F28568];
      v89[0] = @"Invalid original choice, only valid values are Original or OriginalAlt";
      uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v21 = (__CFString **)v89;
      uint64_t v22 = &v88;
LABEL_34:
      id v37 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
      uint64_t v54 = objc_msgSend(v19, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v37);

      goto LABEL_35;
    }
    if (([v6 isRAWPlusJPEG] & 1) == 0)
    {
      BOOL v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v87 = @"Can only swap original choice of R+J asset";
      uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v21 = &v87;
      uint64_t v22 = &v86;
      goto LABEL_34;
    }
  }
  if (![(PHAssetChangeRequest *)self didChangeAdjustments]) {
    goto LABEL_24;
  }
  if (v16 && ([v16 isOnlyChangingOriginalChoice] & 1) == 0)
  {
    id v74 = v9;
    BOOL v55 = [(PHAssetChangeRequest *)self validateContentEditingOutput:v16 error:&v74];
    id v56 = v74;

    v57 = [v16 originalResourceChoice];

    if (!v57)
    {
      if (v55)
      {
        id v9 = v56;
        goto LABEL_24;
      }
      goto LABEL_45;
    }
    v58 = [v16 originalResourceChoice];
    uint64_t v59 = [v58 integerValue];

    id v60 = v6;
    v61 = [v60 pathForOriginalFile];
    v62 = [v61 pathExtension];

    v63 = objc_msgSend(MEMORY[0x1E4F8A950], "uniformTypeIdentifierFromPathExtension:assetType:", v62, objc_msgSend(v60, "kind"));
    uint64_t v73 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v63];
    if ([v73 conformsToType:*MEMORY[0x1E4F44498]] && (unint64_t)(v59 - 1) < 2
      || [v60 isRAWPlusJPEG] && (v59 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v71 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid original resource choice: %ld", v59);
      v72 = v63;
      uint64_t v65 = v64 = v56;
      uint64_t v85 = v65;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      id v66 = v60;
      v68 = uint64_t v67 = v62;
      objc_msgSend(v71, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v68);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      v63 = v72;
      v62 = v67;
      id v60 = v66;

      BOOL v55 = 0;
    }
    else
    {
      id v9 = v56;
    }

    if (v55) {
      goto LABEL_24;
    }
LABEL_9:
    char v23 = 0;
    goto LABEL_10;
  }
  id v25 = [(PHChangeRequest *)self photoLibrary];
  if (![v25 isCloudPhotoLibraryEnabled]) {
    goto LABEL_23;
  }
  BOOL v26 = [v6 entity];
  uint64_t v27 = (void *)MEMORY[0x1E4F8A950];
  id v28 = [v6 managedObjectContext];
  v29 = [v27 entityInManagedObjectContext:v28];
  int v30 = [v26 isKindOfEntity:v29];

  if (v30)
  {
    id v25 = v6;
    uint64_t v31 = [v25 master];
    if (v31)
    {
      v32 = (void *)v31;
      BOOL v33 = [v25 additionalAttributes];
      v34 = [v33 originalResourceChoice];
      BOOL v35 = [v34 integerValue] == 1;

      id v36 = [v25 uuid];
      LODWORD(v34) = [v32 allOriginalsAreLocallyAvailableForAssetUuid:v36 useOriginalAltInsteadOfOriginal:v35];

      if (v34)
      {

        goto LABEL_23;
      }
      uint64_t v69 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      v83 = @"Missing original resources";
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      objc_msgSend(v69, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v70);
      id v56 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
      char v23 = 0;
      id v9 = v56;
      goto LABEL_10;
    }
LABEL_23:
  }
LABEL_24:
  if (self->_didPromoteToGuestAsset)
  {
    id v37 = v6;
    [MEMORY[0x1E4F8BA10] maskForAllowedToPromoteToGuestAsset];
    [v37 savedAssetType];
    if (!PLValidatedSavedAssetTypeApplies())
    {
      uint64_t v47 = NSString;
      id v48 = [v37 uuid];
      int v49 = [v37 savedAssetType];
      [v37 savedAssetType];
      id v50 = PLValidatedSavedAssetTypeDescription();
      id v51 = [v47 stringWithFormat:@"Not allowed to promote asset %@ savedAssetType %hd(%@) to Guest", v48, v49, v50];

      v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v80 = *MEMORY[0x1E4F28228];
      v81 = v51;
      id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      uint64_t v54 = objc_msgSend(v52, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v53);

LABEL_35:
      char v23 = 0;
      id v9 = (id)v54;
      goto LABEL_10;
    }
  }
  if (!self->_didResetGuestAssetPromotion)
  {
    char v23 = 1;
    goto LABEL_13;
  }
  id v38 = v6;
  [MEMORY[0x1E4F8BA10] maskForAllowedToPromoteToGuestAsset];
  [v38 savedAssetType];
  char v23 = PLValidatedSavedAssetTypeApplies();
  if ((v23 & 1) == 0)
  {
    id v39 = NSString;
    id v40 = [v38 uuid];
    int v41 = [v38 savedAssetType];
    [v38 savedAssetType];
    id v42 = PLValidatedSavedAssetTypeDescription();
    uint64_t v43 = [v39 stringWithFormat:@"Not allowed to reset promote asset %@ savedAssetType %hd(%@) to Guest", v40, v41, v42];

    long long v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v78 = *MEMORY[0x1E4F28228];
    double v79 = v43;
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    uint64_t v46 = objc_msgSend(v44, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v45);

    id v9 = (id)v46;
  }

LABEL_10:
  if (a4 && (v23 & 1) == 0)
  {
    id v9 = v9;
    char v23 = 0;
    *a4 = v9;
  }
LABEL_13:

  return v23;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Asset";
}

- (BOOL)_validateAsyncContentEditingOutputPreviewRenderURLs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 mediaType] == 2)
  {
    v7 = [v6 renderedVideoPosterURL];
    id v15 = 0;
    BOOL v8 = [(PHAssetChangeRequest *)self _validateImageURLForAssetMutation:v7 error:&v15];
    id v9 = v15;

    if (v8)
    {
      BOOL v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = 0;
  }
  BOOL v11 = v9;
  id v12 = [v6 renderedPreviewContentURL];
  id v14 = v9;
  BOOL v10 = [(PHAssetChangeRequest *)self _validateImageURLForAssetMutation:v12 error:&v14];
  id v9 = v14;

  if (a4 && !v10)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }
LABEL_8:

  return v10;
}

- (BOOL)validateAccessibilityDescription:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6
    || [(PHChangeRequest *)self isClientEntitled]
    || [(PHAssetChangeRequest *)self duplicateAllowsPrivateMetadata])
  {
    id v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Updating accessibility description is not allowed";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 5101, v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v7 = v7;
      BOOL v8 = 0;
      *a4 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)validateAssetDescription:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6
    || [(PHChangeRequest *)self isClientEntitled]
    || [(PHAssetChangeRequest *)self duplicateAllowsPrivateMetadata])
  {
    id v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Updating asset description is not allowed";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 5101, v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v7 = v7;
      BOOL v8 = 0;
      *a4 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)validateAdjustmentDataForAssetMutation:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 formatIdentifier];
  BOOL v8 = [v7 lowercaseString];
  int v9 = [v8 hasPrefix:@"com.apple."];

  if (!v9
    || self->_clientEntitled
    || ([(NSString *)self->_editorBundleID lowercaseString],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 hasPrefix:@"com.apple."],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = [v6 data];
    if (![v12 length])
    {
      unint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v28 = @"Adjustment data is missing";
      BOOL v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v20 = v18;
      uint64_t v21 = 3303;
      goto LABEL_11;
    }
    unint64_t v13 = [v12 length];
    if (v13 <= +[PHContentEditingOutput maximumAdjustmentDataLength])
    {

      id v22 = 0;
      BOOL v23 = 1;
      goto LABEL_14;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    BOOL v26 = @"Adjustment data too large";
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v16 = &v26;
    uint64_t v17 = &v25;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v12 = [NSString stringWithFormat:@"Invalid format identifier %@", v7];
    v30[0] = v12;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v16 = (__CFString **)v30;
    uint64_t v17 = &v29;
  }
  BOOL v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  uint64_t v20 = v14;
  uint64_t v21 = 3302;
LABEL_11:
  objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", v21, v19);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v22 = v22;
    BOOL v23 = 0;
    *a4 = v22;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_14:

  return v23;
}

- (BOOL)validateVideoURLForAssetMutation:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(PHValidator);
    LOBYTE(a4) = [(PHValidator *)v6 validateURL:v5 withOptions:32 error:a4];
  }
  else if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"failed to validate with nil url";
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)_validateImageURLForAssetMutation:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v6 = (const __CFURL *)a3;
  id v7 = CGImageSourceCreateWithURL(v6, 0);
  if (!v7)
  {
    BOOL v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28228];
    v61[0] = @"Cannot create image source from given URL";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v22 = objc_msgSend(v23, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v24);

    char v11 = 0;
LABEL_15:
    id v31 = v22;
    goto LABEL_16;
  }
  BOOL v8 = v7;
  int v9 = CGImageSourceGetType(v7);
  id v10 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v9];
  char v11 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  if (([v10 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
    || [v11 conformsToType:*MEMORY[0x1E4F443E0]])
  {

    goto LABEL_6;
  }
  char v25 = [v11 conformsToType:*MEMORY[0x1E4F443E8]];

  if ((v25 & 1) == 0)
  {
LABEL_12:
    BOOL v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28228];
    uint64_t v59 = @"Image is not JPEG or HEIF";
    uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
    id v28 = &v59;
    uint64_t v29 = &v58;
LABEL_13:
    int v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    id v22 = objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v30);

    goto LABEL_14;
  }
LABEL_6:

  uint64_t v12 = [(PHChangeRequest *)self helper];
  unint64_t v13 = [v12 clientLinkedAgainst];
  int v14 = [v13 clientLinkedOnOrAfterFall2023OSVersions];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F442D8];
    BOOL v16 = [(__CFURL *)v6 pathExtension];
    int v9 = [v15 typeWithFilenameExtension:v16];

    if (!v9
      || ([v9 isDynamic] & 1) != 0
      || ([v11 isEqual:v9] & 1) == 0
      && (![v11 isEqual:*MEMORY[0x1E4F443E8]]
       || (uint64_t v49 = *MEMORY[0x1E4F44568], ![v11 conformsToType:*MEMORY[0x1E4F44568]])
       || ![v9 conformsToType:v49]))
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28228];
      unint64_t v18 = NSString;
      BOOL v19 = [(__CFURL *)v6 path];
      uint64_t v20 = [v18 stringWithFormat:@"Invalid image type (%@) for specified path: (%@)", v11, v19];
      v57 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v22 = objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v21);

LABEL_14:
      CFRelease(v8);
      goto LABEL_15;
    }
  }
  int v9 = CGImageSourceCopyProperties(v8, 0);
  uint64_t v34 = *MEMORY[0x1E4F2FCA0];
  BOOL v35 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  if (v35)
  {
    id v36 = v35;
    int v37 = [v35 intValue];

    if (v37 != 1)
    {
      BOOL v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28228];
      BOOL v55 = @"Image is not in up (1) orientation";
      uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
      id v28 = &v55;
      uint64_t v29 = &v54;
      goto LABEL_13;
    }
  }

  if (!CGImageSourceGetCount(v8))
  {
    uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    id v53 = @"Empty image source";
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    id v22 = objc_msgSend(v45, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v9);
    goto LABEL_14;
  }
  CFDictionaryRef v38 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
  id v39 = [(__CFDictionary *)v38 objectForKeyedSubscript:v34];
  id v40 = v39;
  if (v39 && [v39 intValue] != 1)
  {

    goto LABEL_33;
  }
  int v41 = [(__CFDictionary *)v38 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  id v42 = [v41 objectForKeyedSubscript:v34];
  uint64_t v43 = v42;
  if (!v42)
  {

    goto LABEL_39;
  }
  int v44 = [v42 intValue];

  if (v44 != 1)
  {
LABEL_33:
    uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28228];
    id v51 = @"Image is not in up (1) orientation";
    uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v43 = objc_msgSend(v46, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v47);

    char v48 = 0;
    goto LABEL_40;
  }
  uint64_t v43 = 0;
LABEL_39:
  char v48 = 1;
LABEL_40:

  CFRelease(v8);
  id v31 = v43;
  if (v48)
  {
    BOOL v32 = 1;
    goto LABEL_19;
  }
LABEL_16:
  if (a4)
  {
    id v31 = v31;
    BOOL v32 = 0;
    *a4 = v31;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_19:

  return v32;
}

- (BOOL)_validateAndGenerateStillImageForLoopingLivePhotoWithContentEditingOutput:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 renderedContentURL];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v7 options:0];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v8 timeZoneLookup:0];
  if ([v9 isLoopingVideo])
  {
    uint64_t v10 = [v6 shouldPreferHEICForRenderedImages];
    char v11 = objc_opt_class();
    uint64_t v12 = [(PHChangeRequest *)self photoLibrary];
    unint64_t v13 = [v12 photoLibraryURL];
    int v14 = [v11 imageRenderURLUsingHEICFormat:v10 appropriateForURL:v13];

    [v6 setRenderedContentURL:v14];
    [v6 setRenderedVideoComplementContentURL:v7];
    BOOL v33 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v8];
    id v15 = (CGImage *)objc_msgSend(MEMORY[0x1E4F8CC38], "copyCGImageFromImageGenerator:atTime:actualTime:error:");
    id v32 = 0;
    if (v15)
    {
      CFURLRef v16 = [v6 renderedContentURL];
      uint64_t v17 = [(id)*MEMORY[0x1E4F44410] identifier];
      unint64_t v18 = CGImageDestinationCreateWithURL(v16, v17, 1uLL, 0);

      if (v18)
      {
        CGImageDestinationAddImage(v18, v15, MEMORY[0x1E4F1CC08]);
        BOOL v19 = CGImageDestinationFinalize(v18);
        if (!v19)
        {
          id v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          id v39 = @"Failed to write still image";
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          objc_msgSend(v31, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v20);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          if (a4) {
            *a4 = v21;
          }
        }
        CFRelease(v18);
      }
      else
      {
        uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        int v37 = @"Failed to create still image";
        id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v28);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        if (a4) {
          *a4 = v29;
        }

        BOOL v19 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      BOOL v35 = @"Failed to generate still image from rendered content";
      char v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      objc_msgSend(v24, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (a4) {
        *a4 = v26;
      }

      BOOL v19 = 0;
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Looping video files must have loop metadata preserved on plugin save";
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    objc_msgSend(v22, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v14);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v19 = 0;
    if (a4) {
      *a4 = v23;
    }
  }

  return v19;
}

- (void)setViewPresentation:(signed __int16)a3
{
  self->_viewPresentatiouint64_t n = a3;
  self->_didSetViewPresentatiouint64_t n = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)setLocalAnalysisStage:(signed __int16)a3
{
  if (a3 == 900) {
    signed __int16 v3 = 950;
  }
  else {
    signed __int16 v3 = a3;
  }
  self->_int localAnalysisStage = v3;
  self->_didSetLocalAnalysisStage = 1;
  [(PHChangeRequest *)self didMutate];
}

- (signed)assetAnalysisStage
{
  return self->_localAnalysisStage;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersiouint64_t n = a3;
  self->_didSetFaceAnalysisVersiouint64_t n = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)_setSyndicationIdentifier:(id)a3
{
  self->_didSetSyndicationIdentifier = 1;
  objc_storeStrong((id *)&self->_syndicationIdentifier, a3);

  [(PHChangeRequest *)self didMutate];
}

- (void)setSyndicationIdentifierOnMomentSharedAsset:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PHAsset *)self->_originalAsset sourceType] == 8)
  {
    [(PHAssetChangeRequest *)self _setSyndicationIdentifier:v4];
  }
  else
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = [(PHObject *)self->_originalAsset uuid];
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_FAULT, "syndicationIdentifier can only be set on PHAssetSourceTypeMomentShared assets: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setSyndicationProcessingVersion:(unint64_t)a3
{
  self->_didSetSyndicationProcessingVersiouint64_t n = 1;
  self->_syndicationProcessingVersiouint64_t n = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setSyndicationProcessingValue:(unsigned __int16)a3
{
  self->_didSetSyndicationProcessingValue = 1;
  self->_syndicationProcessingValue = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3
{
  self->_didSetScreenTimeDeviceImageSensitivity = 1;
  self->_screenTimeDeviceImageSensitivity = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setLibraryScopeContributors:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [a3 valueForKey:@"uuid"];
  id v6 = [v4 setWithArray:v5];
  libraryScopeOriginatorUUIDs = self->_libraryScopeOriginatorUUIDs;
  self->_libraryScopeOriginatorUUIDs = v6;

  [(PHChangeRequest *)self didMutate];
}

- (void)setTimeZone:(id)a3 withDate:(id)a4
{
  self->_didSetTimeZone = 1;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 name];
  timeZoneName = self->_timeZoneName;
  self->_timeZoneName = v8;

  int v10 = [v7 secondsFromGMTForDate:v6];
  self->_timeZoneOffsetValue = v10;

  [(PHChangeRequest *)self didMutate];
}

- (void)resetWallpaperProperties
{
  self->_BOOL resetWallpaperProperties = 1;
  if (self->_didSetWallpaperPropertiesData)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3190 description:@"A change request should not have wallpaper proeprties data set if it is being reset."];
  }

  [(PHChangeRequest *)self didMutate];
}

- (void)resetVisualSearchAttributes
{
  self->_resetVisualSearchProperties = 1;
  if (self->_didSetVisualSearchProperties)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3184 description:@"A change request should not have VisualSearch data set if it is being reset."];
  }

  [(PHChangeRequest *)self didMutate];
}

- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(int64_t)a4
{
  self->_didSetVisualSearchProperties = 1;
  self->_didSetStickerConfidenceScore = 1;
  self->_stickerConfidenceScore = a3;
  self->_stickerConfidenceScoreAlgorithmVersiouint64_t n = a4;
  [(PHChangeRequest *)self didMutate];
}

- (void)setVisualSearchData:(id)a3 stickerConfidenceScore:(float)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6
{
  char v11 = (NSData *)a3;
  uint64_t v12 = (NSDate *)a6;
  self->_didSetVisualSearchProperties = 1;
  self->_didSetStickerConfidenceScore = 1;
  self->_didSetVisualSearchData = 1;
  if (self->_resetVisualSearchProperties)
  {
    CFURLRef v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3162 description:@"A change request should be resetting VisualSearch data set if it is setting new data."];
  }
  if (a5 <= 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3164 description:@"Cannot set a zero algorithm version"];

    if (v12) {
      goto LABEL_5;
    }
  }
  else if (v12)
  {
    goto LABEL_5;
  }
  unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 3165, @"Invalid parameter not satisfying: %@", @"adjustmentVersion" object file lineNumber description];

LABEL_5:
  visualSearchData = self->_visualSearchData;
  self->_visualSearchData = v11;
  int v14 = v11;

  self->_stickerConfidenceScore = a4;
  self->_stickerConfidenceScoreAlgorithmVersiouint64_t n = a5;
  self->_visualSearchAlgorithmVersiouint64_t n = a5;
  visualSearchAdjustmentVersiouint64_t n = self->_visualSearchAdjustmentVersion;
  self->_visualSearchAdjustmentVersiouint64_t n = v12;

  [(PHChangeRequest *)self didMutate];
}

- (void)setVisualSearchData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5
{
  uint64_t v9 = (NSData *)a3;
  int v10 = (NSDate *)a5;
  self->_didSetVisualSearchProperties = 1;
  self->_didSetVisualSearchData = 1;
  if (self->_resetVisualSearchProperties)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3148 description:@"A change request should be resetting VisualSearch data set if it is setting new data."];
  }
  if (a4 <= 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3150 description:@"Cannot set a zero algorithm version"];

    if (v10) {
      goto LABEL_5;
    }
  }
  else if (v10)
  {
    goto LABEL_5;
  }
  CFURLRef v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 3151, @"Invalid parameter not satisfying: %@", @"adjustmentVersion" object file lineNumber description];

LABEL_5:
  visualSearchData = self->_visualSearchData;
  self->_visualSearchData = v9;
  uint64_t v12 = v9;

  self->_visualSearchAlgorithmVersiouint64_t n = a4;
  visualSearchAdjustmentVersiouint64_t n = self->_visualSearchAdjustmentVersion;
  self->_visualSearchAdjustmentVersiouint64_t n = v10;

  [(PHChangeRequest *)self didMutate];
}

- (void)resetCharacterRecognitionAttributes
{
  self->_resetCharacterRecognitionProperties = 1;
  if (self->_didSetCharacterRecognitionData)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3141 description:@"A change request should not have OCR data set if it is being reset."];
  }

  [(PHChangeRequest *)self didMutate];
}

- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(int64_t)a5 adjustmentVersion:(id)a6
{
  char v11 = (NSData *)a3;
  uint64_t v12 = (NSData *)a4;
  unint64_t v13 = (NSDate *)a6;
  self->_didSetCharacterRecognitionData = 1;
  if (self->_resetCharacterRecognitionProperties)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3128 description:@"A change request should not be resetting OCR data set if it is setting new data."];
  }
  if (a5 <= 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:3130 description:@"Cannot set a zero algorithm version"];

    if (v13) {
      goto LABEL_5;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 3131, @"Invalid parameter not satisfying: %@", @"adjustmentVersion" object file lineNumber description];

LABEL_5:
  characterRecognitionData = self->_characterRecognitionData;
  self->_characterRecognitionData = v11;
  id v15 = v11;

  machineReadableCodeData = self->_machineReadableCodeData;
  self->_machineReadableCodeData = v12;
  uint64_t v17 = v12;

  self->_characterRecognitionAlgorithmVersiouint64_t n = a5;
  characterRecognitionAdjustmentVersiouint64_t n = self->_characterRecognitionAdjustmentVersion;
  self->_characterRecognitionAdjustmentVersiouint64_t n = v13;

  [(PHChangeRequest *)self didMutate];
}

- (void)setCharacterRecognitionData:(id)a3 algorithmVersion:(int64_t)a4 adjustmentVersion:(id)a5
{
}

- (void)setColorNormalizationData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  colorNormalizationData = self->_colorNormalizationData;
  self->_colorNormalizationData = v4;

  [(PHChangeRequest *)self didMutate];
}

- (void)setProbableRotationDirectionConfidence:(float)a3
{
  self->_didSetProbableRotationDirectionConfidence = 1;
  self->_probableRotationDirectionConfidence = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setProbableRotationDirection:(signed __int16)a3
{
  self->_didSetProbableRotationDirectiouint64_t n = 1;
  self->_probableRotationDirectiouint64_t n = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_didSetAudioClassificatiouint64_t n = 1;
  self->_audioClassificatiouint64_t n = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_didSetFaceCount = 1;
  self->_faceCount = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setSettlingEffectScore:(float)a3
{
  self->_didSetSettlingEffectScore = 1;
  self->_settlingEffectScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setAudioScore:(float)a3
{
  self->_didSetAudioScore = 1;
  self->_audioScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setActivityScore:(float)a3
{
  self->_didSetActivityScore = 1;
  self->_activityScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setVideoScore:(float)a3
{
  self->_didSetVideoScore = 1;
  self->_videoScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setVideoStickerSuggestionScore:(float)a3
{
  self->_didSetVideoStickerSuggestionScore = 1;
  self->_videoStickerSuggestionScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setAutoplaySuggestionScore:(float)a3
{
  self->_didSetAutoplaySuggestionScore = 1;
  self->_autoplaySuggestionScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setWallpaperScore:(float)a3
{
  self->_didSetWallpaperScore = 1;
  self->_wallpaperScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setExposureScore:(float)a3
{
  self->_didSetExposureScore = 1;
  self->_exposureScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setBlurrinessScore:(float)a3
{
  self->_didSetBlurrinessScore = 1;
  self->_blurrinessScore = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setMediaAnalysisTimeStamp:(id)a3
{
  self->_didSetMediaAnalysisTimeStamp = 1;
  objc_storeStrong((id *)&self->_mediaAnalysisTimeStamp, a3);

  [(PHChangeRequest *)self didMutate];
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_didSetMediaAnalysisImageVersiouint64_t n = 1;
  self->_mediaAnalysisImageVersiouint64_t n = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_didSetMediaAnalysisVersiouint64_t n = 1;
  self->_mediaAnalysisVersiouint64_t n = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setComputeSyncMediaAnalysisPayload:(id)a3
{
  objc_storeStrong((id *)&self->_computeSyncMediaAnalysisPayload, a3);

  [(PHChangeRequest *)self didMutate];
}

- (void)setBestPlaybackRectWithNormalizedRect:(CGRect)a3
{
  int64_t v5 = 0;
  BOOL v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_packedBestPlaybackRect = v5;
  self->_didSetPackedBestPlaybackRect = v4;
}

- (void)setBestKeyFrame:(CGImage *)a3 time:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PHAsset *)self->_originalAsset isVideo];
  if (a3 && v7)
  {
    BOOL v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    uint64_t v9 = [(id)*MEMORY[0x1E4F44410] identifier];
    int v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      CGImageDestinationAddImage(v10, a3, 0);
      CGImageDestinationFinalize(v10);
      CFRelease(v10);
    }
    bestKeyFrameJPEGData = self->_bestKeyFrameJPEGData;
    self->_bestKeyFrameJPEGData = (NSData *)v8;
  }
  if (a4->var2)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&self->_bestKeyFrameTime.value = *(_OWORD *)&a4->var0;
    self->_bestKeyFrameTime.epoch = var3;
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      $95D729B680665BEAEFA1D6FCA8238556 bestKeyFrameTime = self->_bestKeyFrameTime;
      unint64_t v13 = (void *)CMTimeCopyDescription(0, (CMTime *)&bestKeyFrameTime);
      NSUInteger v15 = [(NSData *)self->_bestKeyFrameJPEGData length];
      CFURLRef v16 = [(PHChangeRequest *)self uuid];
      LODWORD(bestKeyFrameTime.value) = 138412802;
      *(int64_t *)((char *)&bestKeyFrameTime.value + 4) = (int64_t)v13;
      LOWORD(bestKeyFrameTime.flags) = 2048;
      *(void *)((char *)&bestKeyFrameTime.flags + 2) = v15;
      HIWORD(bestKeyFrameTime.epoch) = 2112;
      unint64_t v18 = v16;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "Client setting best key frame time: %@ key frame image length: %lu for asset: %@", (uint8_t *)&bestKeyFrameTime, 0x20u);

      goto LABEL_11;
    }
  }
  else
  {
    self->_didUnsetBestKeyFrameTime = 1;
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v13 = [(PHChangeRequest *)self uuid];
      LODWORD(bestKeyFrameTime.value) = 138412290;
      *(int64_t *)((char *)&bestKeyFrameTime.value + 4) = (int64_t)v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "Client unsetting best key frame time for asset: %@", (uint8_t *)&bestKeyFrameTime, 0xCu);
LABEL_11:
    }
  }

  [(PHChangeRequest *)self didMutate];
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale = v3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setBestVideoTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestVideoTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_bestVideoTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale = v3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setWallpaperPropertiesData:(id)a3
{
  int64_t v5 = (NSData *)a3;
  if (self->_resetWallpaperProperties)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:2965 description:@"A change request should be resetting wallpaper properties data set if it is setting new data."];
  }
  self->_didSetWallpaperPropertiesData = 1;
  wallpaperPropertiesData = self->_wallpaperPropertiesData;
  self->_wallpaperPropertiesData = v5;

  [(PHChangeRequest *)self didMutate];
}

- (void)setWallpaperPropertiesVersion:(unint64_t)a3
{
  if (self->_resetWallpaperProperties)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:2958 description:@"A change request should be resetting wallpaper properties version set if it is setting new version."];
  }
  self->_didSetWallpaperPropertiesVersiouint64_t n = 1;
  self->_wallpaperPropertiesVersiouint64_t n = a3;

  [(PHChangeRequest *)self didMutate];
}

- (void)setWallpaperPropertiesTimestamp:(id)a3
{
  int64_t v5 = (NSDate *)a3;
  if (self->_resetWallpaperProperties)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:2951 description:@"A change request should be resetting wallpaper properties timestamp set if it is setting new timestamp."];
  }
  self->_didSetWallpaperPropertiesTimestamp = 1;
  wallpaperPropertiesTimestamp = self->_wallpaperPropertiesTimestamp;
  self->_wallpaperPropertiesTimestamp = v5;

  [(PHChangeRequest *)self didMutate];
}

- (PHAssetChangeRequest)initWithCoder:(id)a3
{
  v314[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"helper"];
  [v5 setChangeRequest:self];
  [v5 setMutated:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F8A6A8]);
  BOOL v7 = [(PHAssetChangeRequest *)self initWithHelper:v5];

  if (v7)
  {
    double v312 = v5;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detectedFaces"];
    facesHelper = v7->_facesHelper;
    v7->_facesHelper = (PHRelationshipChangeRequestHelper *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"temporalDetectedFaces"];
    temporalFacesHelper = v7->_temporalFacesHelper;
    v7->_temporalFacesHelper = (PHRelationshipChangeRequestHelper *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keywords"];
    keywordsHelper = v7->_keywordsHelper;
    v7->_keywordsHelper = (PHRelationshipChangeRequestHelper *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudComments"];
    commentsHelper = v7->_commentsHelper;
    v7->_commentsHelper = (PHRelationshipChangeRequestHelper *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"likeComments"];
    likesHelper = v7->_likesHelper;
    v7->_likesHelper = (PHRelationshipChangeRequestHelper *)v16;

    v7->_clientProcessIdentifier = [v6 clientProcessIdentifier];
    int v18 = [v6 photoKitEntitled];
    uint64_t v19 = [NSString stringWithUTF8String:"didChangeAdjustments"];
    int v20 = [v4 decodeBoolForKey:v19];

    if (v20)
    {
      [(PHAssetChangeRequest *)v7 markDidChangeAdjustments];
      uint64_t v21 = objc_opt_class();
      id v22 = [NSString stringWithUTF8String:"contentEditingOutput"];
      id v23 = [v4 decodeObjectOfClass:v21 forKey:v22];

      [(PHAssetChangeRequest *)v7 setContentEditingOutput:v23];
      if (v18)
      {
        uint64_t v24 = objc_opt_class();
        char v25 = [NSString stringWithUTF8String:"editorBundleURL"];
        uint64_t v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
        editorBundleURL = v7->_editorBundleURL;
        v7->_editorBundleURL = (NSURL *)v26;

        if (v7->_editorBundleURL)
        {
          id v28 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:");
          uint64_t v29 = [v28 bundleIdentifier];
          editorBundleID = v7->_editorBundleID;
          v7->_editorBundleID = (NSString *)v29;
        }
        if (!v7->_editorBundleID)
        {
          uint64_t v31 = objc_opt_class();
          id v32 = [NSString stringWithUTF8String:"editorBundleID"];
          uint64_t v33 = [v4 decodeObjectOfClass:v31 forKey:v32];
          uint64_t v34 = v7->_editorBundleID;
          v7->_editorBundleID = (NSString *)v33;
        }
      }
    }
    BOOL v35 = [NSString stringWithUTF8String:"originalResourceChoice"];
    v7->_unint64_t originalResourceChoice = [v4 decodeIntegerForKey:v35];

    uint64_t v36 = [NSString stringWithUTF8String:"didSetOriginalResourceChoice"];
    v7->_didSetOriginalResourceChoice = [v4 decodeBoolForKey:v36];

    int v37 = [NSString stringWithUTF8String:"didRevertLocationToOriginal"];
    v7->_didRevertLocationToOriginal = [v4 decodeBoolForKey:v37];

    uint64_t v38 = [NSString stringWithUTF8String:"didUpdateExtendedAttributesUsingOriginalMediaMetadata"];
    v7->_didUpdateExtendedAttributesUsingOriginalMediaMetadata = [v4 decodeBoolForKey:v38];

    id v39 = [NSString stringWithUTF8String:"didExpungeAllSpatialOverCaptureResources"];
    v7->_didExpungeAllSpatialOverCaptureResources = [v4 decodeBoolForKey:v39];

    uint64_t v40 = [NSString stringWithUTF8String:"didTrashAllSpatialOverCaptureResources"];
    v7->_didTrashAllSpatialOverCaptureResources = [v4 decodeBoolForKey:v40];

    int v41 = [NSString stringWithUTF8String:"didUntrashAllSpatialOverCaptureResources"];
    v7->_didUntrashAllSpatialOverCaptureResources = [v4 decodeBoolForKey:v41];

    id v42 = [NSString stringWithUTF8String:"didExpungeTrashedSpatialOverCaptureResources"];
    v7->_didExpungeTrashedSpatialOverCaptureResources = [v4 decodeBoolForKey:v42];

    uint64_t v43 = [NSString stringWithUTF8String:"didPromoteToGuestAsset"];
    v7->_didPromoteToGuestAsset = [v4 decodeBoolForKey:v43];

    int v44 = [NSString stringWithUTF8String:"didResetGuestAssetPromotion"];
    v7->_didResetGuestAssetPromotiouint64_t n = [v4 decodeBoolForKey:v44];

    uint64_t v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    char v48 = [NSString stringWithUTF8String:"updatedLocation"];
    uint64_t v49 = [v4 decodeObjectOfClasses:v47 forKey:v48];
    updatedLocatiouint64_t n = v7->_updatedLocation;
    v7->_updatedLocatiouint64_t n = (CLLocation *)v49;

    uint64_t v51 = objc_opt_class();
    uint64_t v52 = [NSString stringWithUTF8String:"assetDescription"];
    uint64_t v53 = [v4 decodeObjectOfClass:v51 forKey:v52];
    assetDescriptiouint64_t n = v7->_assetDescription;
    v7->_assetDescriptiouint64_t n = (NSString *)v53;

    uint64_t v55 = objc_opt_class();
    uint64_t v56 = [NSString stringWithUTF8String:"accessibilityDescription"];
    uint64_t v57 = [v4 decodeObjectOfClass:v55 forKey:v56];
    accessibilityDescriptiouint64_t n = v7->_accessibilityDescription;
    v7->_accessibilityDescriptiouint64_t n = (NSString *)v57;

    uint64_t v59 = [NSString stringWithUTF8String:"didSetTitle"];
    v7->_didSetTitle = [v4 decodeBoolForKey:v59];

    if (v7->_didSetTitle)
    {
      uint64_t v60 = objc_opt_class();
      v61 = [NSString stringWithUTF8String:"title"];
      uint64_t v62 = [v4 decodeObjectOfClass:v60 forKey:v61];
      title = v7->_title;
      v7->_title = (NSString *)v62;
    }
    v64 = [NSString stringWithUTF8String:"didSetKeywordTitles"];
    v7->_didSetKeywordTitles = [v4 decodeBoolForKey:v64];

    if (v7->_didSetKeywordTitles)
    {
      uint64_t v65 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v66 = objc_opt_class();
      uint64_t v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
      uint64_t v68 = [NSString stringWithUTF8String:"keywordTitles"];
      uint64_t v69 = [v4 decodeObjectOfClasses:v67 forKey:v68];
      keywordTitles = v7->_keywordTitles;
      v7->_keywordTitles = (NSSet *)v69;
    }
    uint64_t v71 = objc_opt_class();
    v72 = [NSString stringWithUTF8String:"videoURLForUpdate"];
    uint64_t v73 = [v4 decodeObjectOfClass:v71 forKey:v72];
    videoURLForUpdate = v7->_videoURLForUpdate;
    v7->_videoURLForUpdate = (NSURL *)v73;

    uint64_t v75 = objc_opt_class();
    id v76 = [NSString stringWithUTF8String:"pairingIdentifier"];
    uint64_t v77 = [v4 decodeObjectOfClass:v75 forKey:v76];
    pairingIdentifier = v7->_pairingIdentifier;
    v7->_pairingIdentifier = (NSString *)v77;

    uint64_t v79 = objc_opt_class();
    uint64_t v80 = [NSString stringWithUTF8String:"videoDuration"];
    CFDictionaryRef v81 = [v4 decodeObjectOfClass:v79 forKey:v80];

    p_videoDuratiouint64_t n = &v7->_videoDuration;
    CFDictionaryRef v311 = v81;
    if (v81)
    {
      CMTimeMakeFromDictionary(&v313.start, v81);
      long long v83 = *(_OWORD *)&v313.start.value;
      v7->_videoDuration.epoch = v313.start.epoch;
      *(_OWORD *)&p_videoDuration->value = v83;
    }
    else
    {
      uint64_t v84 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&p_videoDuration->value = *MEMORY[0x1E4F1F9F8];
      v7->_videoDuration.epoch = *(void *)(v84 + 16);
    }
    uint64_t v85 = objc_opt_class();
    uint64_t v86 = [NSString stringWithUTF8String:"imageDisplayTime"];
    CFDictionaryRef v87 = [v4 decodeObjectOfClass:v85 forKey:v86];

    p_imageDisplayTime = &v7->_imageDisplayTime;
    CFDictionaryRef v310 = v87;
    if (v87)
    {
      CMTimeMakeFromDictionary(&v313.start, v87);
      long long v89 = *(_OWORD *)&v313.start.value;
      v7->_imageDisplayTime.epoch = v313.start.epoch;
      *(_OWORD *)&p_imageDisplayTime->value = v89;
    }
    else
    {
      uint64_t v90 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&p_imageDisplayTime->value = *MEMORY[0x1E4F1F9F8];
      v7->_imageDisplayTime.epoch = *(void *)(v90 + 16);
    }
    uint64_t v91 = [NSString stringWithUTF8String:"photoIrisVisibilityState"];
    v7->_photoIrisVisibilityState = [v4 decodeIntegerForKey:v91];

    v92 = [NSString stringWithUTF8String:"didSetVisibilityState"];
    v7->_didSetVisibilityState = [v4 decodeBoolForKey:v92];

    v93 = (void *)MEMORY[0x1E4F1CAD0];
    v314[0] = objc_opt_class();
    v314[1] = objc_opt_class();
    v314[2] = objc_opt_class();
    v314[3] = objc_opt_class();
    v314[4] = objc_opt_class();
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v314 count:5];
    v95 = [v93 setWithArray:v94];
    v96 = [NSString stringWithUTF8String:"sceneClassificationsByType"];
    uint64_t v97 = [v4 decodeObjectOfClasses:v95 forKey:v96];

    if (v97)
    {
      uint64_t v98 = [v97 mutableCopy];
      sceneClassificationDictionariesByType = v7->_sceneClassificationDictionariesByType;
      v7->_sceneClassificationDictionariesByType = (NSMutableDictionary *)v98;

      v7->_BOOL didSetSceneClassifications = 1;
    }
    v100 = [NSString stringWithUTF8String:"didSetImageEmbeddingVersionKey"];
    v7->_didSetImageEmbeddingVersiouint64_t n = [v4 decodeBoolForKey:v100];

    if (v7->_didSetImageEmbeddingVersion)
    {
      v101 = [NSString stringWithUTF8String:"imageEmbeddingVersion"];
      v7->_imageEmbeddingVersiouint64_t n = [v4 decodeIntegerForKey:v101];
    }
    v102 = [NSString stringWithUTF8String:"didSetVideoEmbeddingVersionKey"];
    v7->_didSetVideoEmbeddingVersiouint64_t n = [v4 decodeBoolForKey:v102];

    if (v7->_didSetVideoEmbeddingVersion)
    {
      id v103 = [NSString stringWithUTF8String:"videoEmbeddingVersion"];
      v7->_videoEmbeddingVersiouint64_t n = [v4 decodeIntegerForKey:v103];
    }
    v309 = v97;
    v104 = [NSString stringWithUTF8String:"incrementPlayCount"];
    v7->_incrementPlayCount = [v4 decodeBoolForKey:v104];

    v105 = [NSString stringWithUTF8String:"incrementShareCount"];
    v7->_incrementShareCount = [v4 decodeBoolForKey:v105];

    uint64_t v106 = objc_opt_class();
    int v107 = [NSString stringWithUTF8String:"lastSharedDate"];
    uint64_t v108 = [v4 decodeObjectOfClass:v106 forKey:v107];
    lastSharedDate = v7->_lastSharedDate;
    v7->_lastSharedDate = (NSDate *)v108;

    v110 = [NSString stringWithUTF8String:"incrementViewCount"];
    v7->_incrementViewCount = [v4 decodeBoolForKey:v110];

    v111 = [NSString stringWithUTF8String:"variationSuggestionStates"];
    v7->_variationSuggestionStates = [v4 decodeInt64ForKey:v111];

    if (v7->_variationSuggestionStates)
    {
      v7->_didSetVariationSuggestionStates = 1;
      v112 = [NSString stringWithUTF8String:"variationSuggestionStatesMask"];
      v7->_variationSuggestionStatesMasuint64_t k = [v4 decodeInt64ForKey:v112];
    }
    v113 = [NSString stringWithUTF8String:"toRetryUpload"];
    v7->_toRetryUpload = [v4 decodeBoolForKey:v113];

    int v114 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v115 = objc_opt_class();
    uint64_t v116 = objc_opt_class();
    id v117 = objc_msgSend(v114, "setWithObjects:", v115, v116, objc_opt_class(), 0);
    uint64_t v118 = [NSString stringWithUTF8String:"pathsToNewAssetResourcesByAssetResourceType"];
    uint64_t v119 = [v4 decodeObjectOfClasses:v117 forKey:v118];
    pathsToNewAssetResourcesByAssetResourceType = v7->_pathsToNewAssetResourcesByAssetResourceType;
    v7->_pathsToNewAssetResourcesByAssetResourceType = (NSDictionary *)v119;

    v121 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v122 = objc_opt_class();
    v123 = objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
    v124 = [NSString stringWithUTF8String:"assetResourceTypesToDelete"];
    uint64_t v125 = [v4 decodeObjectOfClasses:v123 forKey:v124];
    assetResourceTypesToDelete = v7->_assetResourceTypesToDelete;
    v7->_assetResourceTypesToDelete = (NSSet *)v125;

    id v127 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v128 = objc_opt_class();
    v129 = objc_msgSend(v127, "setWithObjects:", v128, objc_opt_class(), 0);
    v130 = [NSString stringWithUTF8String:"libraryScopeOriginatorUUIDs"];
    v131 = [v4 decodeObjectOfClasses:v129 forKey:v130];
    uint64_t v132 = [v127 setWithArray:v131];
    libraryScopeOriginatorUUIDs = v7->_libraryScopeOriginatorUUIDs;
    v7->_libraryScopeOriginatorUUIDs = (NSSet *)v132;

    v134 = [NSString stringWithUTF8String:"packedPreferredCropRect"];
    v7->_packedPreferredCropRect = [v4 decodeIntegerForKey:v134];

    if (v7->_packedPreferredCropRect) {
      v7->_didSetPackedPreferredCropRect = 1;
    }
    v135 = [NSString stringWithUTF8String:"packedAcceptableCropRect"];
    v7->_packedAcceptableCropRect = [v4 decodeIntegerForKey:v135];

    if (v7->_packedAcceptableCropRect) {
      v7->_didSetPackedAcceptableCropRect = 1;
    }
    v136 = [NSString stringWithUTF8String:"packedBestPlaybackRect"];
    v7->_packedBestPlaybackRect = [v4 decodeIntegerForKey:v136];

    if (v7->_packedBestPlaybackRect) {
      v7->_didSetPackedBestPlaybackRect = 1;
    }
    uint64_t v137 = objc_opt_class();
    v138 = [NSString stringWithUTF8String:"computedAttributeMutations"];
    uint64_t v139 = [v4 decodeObjectOfClass:v137 forKey:v138];
    computedAttributeMutations = v7->_computedAttributeMutations;
    v7->_computedAttributeMutations = (NSMutableDictionary *)v139;

    if (v7->_computedAttributeMutations) {
      v7->_didModifyComputedAttributes = 1;
    }
    v141 = [NSString stringWithUTF8String:"resetWallpaperProperties"];
    int v142 = [v4 decodeBoolForKey:v141];

    if (v142)
    {
      v7->_didSetWallpaperPropertiesTimestamp = 1;
      wallpaperPropertiesTimestamp = v7->_wallpaperPropertiesTimestamp;
      v7->_wallpaperPropertiesTimestamp = 0;

      v7->_didSetWallpaperPropertiesVersiouint64_t n = 1;
      v7->_wallpaperPropertiesVersiouint64_t n = 0;
      v7->_didSetWallpaperPropertiesData = 1;
      wallpaperPropertiesData = v7->_wallpaperPropertiesData;
      v7->_wallpaperPropertiesData = 0;
    }
    else
    {
      uint64_t v145 = objc_opt_class();
      uint64_t v146 = [NSString stringWithUTF8String:"photoAnalysisWallpaperPropertiesTimeStamp"];
      uint64_t v147 = [v4 decodeObjectOfClass:v145 forKey:v146];
      v148 = v7->_wallpaperPropertiesTimestamp;
      v7->_wallpaperPropertiesTimestamp = (NSDate *)v147;

      if (v7->_wallpaperPropertiesTimestamp) {
        v7->_didSetWallpaperPropertiesTimestamp = 1;
      }
      uint64_t v149 = [NSString stringWithUTF8String:"photoAnalysisWallpaperPropertiesVersion"];
      v7->_wallpaperPropertiesVersiouint64_t n = [v4 decodeIntegerForKey:v149];

      if (v7->_wallpaperPropertiesVersion) {
        v7->_didSetWallpaperPropertiesVersiouint64_t n = 1;
      }
      uint64_t v150 = objc_opt_class();
      v151 = [NSString stringWithUTF8String:"photoAnalysisWallpaperProperties"];
      uint64_t v152 = [v4 decodeObjectOfClass:v150 forKey:v151];
      v153 = v7->_wallpaperPropertiesData;
      v7->_wallpaperPropertiesData = (NSData *)v152;

      if (v7->_wallpaperPropertiesData) {
        v7->_didSetWallpaperPropertiesData = 1;
      }
    }
    uint64_t v154 = objc_opt_class();
    BOOL v155 = [NSString stringWithUTF8String:"mediaAnalysisTimeStamp"];
    uint64_t v156 = [v4 decodeObjectOfClass:v154 forKey:v155];
    mediaAnalysisTimeStamp = v7->_mediaAnalysisTimeStamp;
    v7->_mediaAnalysisTimeStamp = (NSDate *)v156;

    if (v7->_mediaAnalysisTimeStamp) {
      v7->_didSetMediaAnalysisTimeStamp = 1;
    }
    v158 = [NSString stringWithUTF8String:"mediaAnalysisVersion"];
    v7->_mediaAnalysisVersiouint64_t n = [v4 decodeIntegerForKey:v158];

    if (v7->_mediaAnalysisVersion) {
      v7->_didSetMediaAnalysisVersiouint64_t n = 1;
    }
    int v159 = [NSString stringWithUTF8String:"mediaAnalysisImageVersion"];
    v7->_mediaAnalysisImageVersiouint64_t n = [v4 decodeIntegerForKey:v159];

    if (v7->_mediaAnalysisImageVersion) {
      v7->_didSetMediaAnalysisImageVersiouint64_t n = 1;
    }
    uint64_t v160 = objc_opt_class();
    v161 = [NSString stringWithUTF8String:"bestKeyFrameTime"];
    CFDictionaryRef v162 = [v4 decodeObjectOfClass:v160 forKey:v161];

    if (v162)
    {
      CMTimeMakeFromDictionary(&v313.start, v162);
      long long v163 = *(_OWORD *)&v313.start.value;
      v7->_bestKeyFrameTime.epoch = v313.start.epoch;
      *(_OWORD *)&v7->_bestKeyFrameTime.value = v163;
    }
    v164 = [NSString stringWithUTF8String:"unsetBestKeyFrameTime"];
    v7->_didUnsetBestKeyFrameTime = [v4 decodeBoolForKey:v164];

    uint64_t v165 = objc_opt_class();
    uint64_t v166 = [NSString stringWithUTF8String:"bestKeyFrameJPEGData"];
    uint64_t v167 = [v4 decodeObjectOfClass:v165 forKey:v166];
    bestKeyFrameJPEGData = v7->_bestKeyFrameJPEGData;
    v7->_bestKeyFrameJPEGData = (NSData *)v167;

    uint64_t v169 = objc_opt_class();
    v170 = [NSString stringWithUTF8String:"computeSyncMediaAnalysisPayload"];
    uint64_t v171 = [v4 decodeObjectOfClass:v169 forKey:v170];
    computeSyncMediaAnalysisPayload = v7->_computeSyncMediaAnalysisPayload;
    v7->_computeSyncMediaAnalysisPayload = (NSData *)v171;

    uint64_t v173 = objc_opt_class();
    v174 = [NSString stringWithUTF8String:"bestVideoTimeRange"];
    CFDictionaryRef v175 = [v4 decodeObjectOfClass:v173 forKey:v174];

    if (v175)
    {
      CMTimeRangeMakeFromDictionary(&v313, v175);
      long long v176 = *(_OWORD *)&v313.start.value;
      long long v177 = *(_OWORD *)&v313.duration.timescale;
      *(_OWORD *)&v7->_bestVideoTimeRange.start.epoch = *(_OWORD *)&v313.start.epoch;
      *(_OWORD *)&v7->_bestVideoTimeRange.duration.timescale = v177;
      *(_OWORD *)&v7->_bestVideoTimeRange.start.value = v176;
    }
    uint64_t v178 = objc_opt_class();
    v179 = [NSString stringWithUTF8String:"animatedStickerTimeRange"];
    CFDictionaryRef v180 = [v4 decodeObjectOfClass:v178 forKey:v179];

    if (v180)
    {
      CMTimeRangeMakeFromDictionary(&v313, v180);
      long long v181 = *(_OWORD *)&v313.start.value;
      long long v182 = *(_OWORD *)&v313.duration.timescale;
      *(_OWORD *)&v7->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&v313.start.epoch;
      *(_OWORD *)&v7->_animatedStickerTimeRange.duration.timescale = v182;
      *(_OWORD *)&v7->_animatedStickerTimeRange.start.value = v181;
    }
    v183 = [NSString stringWithUTF8String:"blurrinessScore"];
    [v4 decodeFloatForKey:v183];
    v7->_blurrinessScore = v184;

    if (v7->_blurrinessScore != 0.0) {
      v7->_didSetBlurrinessScore = 1;
    }
    v185 = [NSString stringWithUTF8String:"exposureScore"];
    [v4 decodeFloatForKey:v185];
    v7->_exposureScore = v186;

    if (v7->_exposureScore != 0.0) {
      v7->_didSetExposureScore = 1;
    }
    v187 = [NSString stringWithUTF8String:"audioScore"];
    [v4 decodeFloatForKey:v187];
    v7->_audioScore = v188;

    if (v7->_audioScore != 0.0) {
      v7->_didSetAudioScore = 1;
    }
    v189 = [NSString stringWithUTF8String:"settlingEffectScore"];
    [v4 decodeFloatForKey:v189];
    v7->_settlingEffectScore = v190;

    if (v7->_settlingEffectScore != 0.0) {
      v7->_didSetSettlingEffectScore = 1;
    }
    v191 = [NSString stringWithUTF8String:"wallpaperScore"];
    [v4 decodeFloatForKey:v191];
    v7->_wallpaperScore = v192;

    if (v7->_wallpaperScore != 0.0) {
      v7->_didSetWallpaperScore = 1;
    }
    v193 = [NSString stringWithUTF8String:"autoplaySuggestionScore"];
    [v4 decodeFloatForKey:v193];
    v7->_autoplaySuggestionScore = v194;

    if (v7->_autoplaySuggestionScore != 0.0) {
      v7->_didSetAutoplaySuggestionScore = 1;
    }
    uint64_t v195 = [NSString stringWithUTF8String:"videoStickerSuggestionScore"];
    [v4 decodeFloatForKey:v195];
    v7->_videoStickerSuggestionScore = v196;

    if (v7->_videoStickerSuggestionScore != 0.0) {
      v7->_didSetVideoStickerSuggestionScore = 1;
    }
    uint64_t v197 = [NSString stringWithUTF8String:"videoScore"];
    [v4 decodeFloatForKey:v197];
    v7->_videoScore = v198;

    if (v7->_videoScore != 0.0) {
      v7->_didSetVideoScore = 1;
    }
    v199 = [NSString stringWithUTF8String:"activityScore"];
    [v4 decodeFloatForKey:v199];
    v7->_activityScore = v200;

    if (v7->_activityScore != 0.0) {
      v7->_didSetActivityScore = 1;
    }
    id v201 = [NSString stringWithUTF8String:"faceCount"];
    v7->_faceCount = [v4 decodeInt64ForKey:v201];

    if (v7->_faceCount) {
      v7->_didSetFaceCount = 1;
    }
    v202 = [NSString stringWithUTF8String:"audioClassification"];
    v7->_audioClassificatiouint64_t n = [v4 decodeIntegerForKey:v202];

    if (v7->_audioClassification) {
      v7->_didSetAudioClassificatiouint64_t n = 1;
    }
    v203 = [NSString stringWithUTF8String:"probableRotationDirection"];
    v7->_probableRotationDirectiouint64_t n = [v4 decodeIntegerForKey:v203];

    if (v7->_probableRotationDirection) {
      v7->_didSetProbableRotationDirectiouint64_t n = 1;
    }
    v204 = [NSString stringWithUTF8String:"probableRotationDirectionConfidence"];
    [v4 decodeFloatForKey:v204];
    v7->_probableRotationDirectionConfidence = v205;

    if (v7->_probableRotationDirectionConfidence != 0.0) {
      v7->_didSetProbableRotationDirectionConfidence = 1;
    }
    uint64_t v206 = objc_opt_class();
    uint64_t v207 = [NSString stringWithUTF8String:"colorNormalizationData"];
    uint64_t v208 = [v4 decodeObjectOfClass:v206 forKey:v207];
    colorNormalizationData = v7->_colorNormalizationData;
    v7->_colorNormalizationData = (NSData *)v208;

    v210 = [NSString stringWithUTF8String:"resetCharacterRecognitionProperties"];
    v7->_resetCharacterRecognitionProperties = [v4 decodeBoolForKey:v210];

    if (!v7->_resetCharacterRecognitionProperties)
    {
      v211 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v212 = objc_opt_class();
      v213 = objc_msgSend(v211, "setWithObjects:", v212, objc_opt_class(), 0);
      unint64_t v214 = [NSString stringWithUTF8String:"characterRecognitionProperties"];
      v215 = [v4 decodeObjectOfClasses:v213 forKey:v214];

      if (v215)
      {
        v7->_didSetCharacterRecognitionData = 1;
        v216 = [NSString stringWithUTF8String:"characterRecognitionData"];
        uint64_t v217 = [v215 objectForKeyedSubscript:v216];
        characterRecognitionData = v7->_characterRecognitionData;
        v7->_characterRecognitionData = (NSData *)v217;

        v219 = [NSString stringWithUTF8String:"machineReadableCodeData"];
        uint64_t v220 = [v215 objectForKeyedSubscript:v219];
        machineReadableCodeData = v7->_machineReadableCodeData;
        v7->_machineReadableCodeData = (NSData *)v220;

        v222 = [NSString stringWithUTF8String:"characterRecognitionAlgorithmVersion"];
        double v223 = [v215 objectForKeyedSubscript:v222];
        v7->_characterRecognitionAlgorithmVersiouint64_t n = [v223 integerValue];

        double v224 = [NSString stringWithUTF8String:"characterRecognitionAdjustmentVersion"];
        uint64_t v225 = [v215 objectForKeyedSubscript:v224];
        characterRecognitionAdjustmentVersiouint64_t n = v7->_characterRecognitionAdjustmentVersion;
        v7->_characterRecognitionAdjustmentVersiouint64_t n = (NSDate *)v225;
      }
    }
    v227 = [NSString stringWithUTF8String:"resetVisualSearchProperties"];
    v7->_resetVisualSearchProperties = [v4 decodeBoolForKey:v227];

    if (!v7->_resetVisualSearchProperties)
    {
      id v228 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v229 = objc_opt_class();
      v230 = objc_msgSend(v228, "setWithObjects:", v229, objc_opt_class(), 0);
      v231 = [NSString stringWithUTF8String:"visualSearchProperties"];
      int v232 = [v4 decodeObjectOfClasses:v230 forKey:v231];

      if (v232)
      {
        v7->_didSetVisualSearchProperties = 1;
        v233 = [NSString stringWithUTF8String:"visualSearchData"];
        uint64_t v234 = [v232 objectForKeyedSubscript:v233];
        visualSearchData = v7->_visualSearchData;
        v7->_visualSearchData = (NSData *)v234;

        v236 = [NSString stringWithUTF8String:"didSetStickerConfidenceScore"];
        uint64_t v237 = [v232 objectForKeyedSubscript:v236];
        v7->_didSetStickerConfidenceScore = [v237 BOOLValue];

        uint64_t v238 = [NSString stringWithUTF8String:"didSetVisualSearchData"];
        uint64_t v239 = [v232 objectForKeyedSubscript:v238];
        v7->_didSetVisualSearchData = [v239 BOOLValue];

        v240 = [NSString stringWithUTF8String:"stickerConfidenceScore"];
        v241 = [v232 objectForKeyedSubscript:v240];
        [v241 floatValue];
        v7->_stickerConfidenceScore = v242;

        uint64_t v243 = [NSString stringWithUTF8String:"stickerConfidenceScoreAlgorithmVersion"];
        v244 = [v232 objectForKeyedSubscript:v243];
        v7->_stickerConfidenceScoreAlgorithmVersiouint64_t n = [v244 integerValue];

        v245 = [NSString stringWithUTF8String:"visualSearchAlgorithmVersion"];
        v246 = [v232 objectForKeyedSubscript:v245];
        v7->_visualSearchAlgorithmVersiouint64_t n = [v246 integerValue];

        v247 = [NSString stringWithUTF8String:"visualSearchAdjustmentVersion"];
        uint64_t v248 = [v232 objectForKeyedSubscript:v247];
        visualSearchAdjustmentVersiouint64_t n = v7->_visualSearchAdjustmentVersion;
        v7->_visualSearchAdjustmentVersiouint64_t n = (NSDate *)v248;
      }
    }
    uint64_t v250 = objc_opt_class();
    uint64_t v251 = [NSString stringWithUTF8String:"sceneprintData"];
    uint64_t v252 = [v4 decodeObjectOfClass:v250 forKey:v251];
    sceneprintData = v7->_sceneprintData;
    v7->_sceneprintData = (NSData *)v252;

    if (v7->_sceneprintData) {
      v7->_didSetSceneprintData = 1;
    }
    uint64_t v254 = objc_opt_class();
    v255 = [NSString stringWithUTF8String:"duplicateMatchingData"];
    uint64_t v256 = [v4 decodeObjectOfClass:v254 forKey:v255];
    duplicateMatchingData = v7->_duplicateMatchingData;
    v7->_duplicateMatchingData = (NSData *)v256;

    if (v7->_duplicateMatchingData)
    {
      v7->_didSetDuplicateMatchingData = 1;
      uint64_t v258 = objc_opt_class();
      v259 = [NSString stringWithUTF8String:"duplicateMatchingAlternateData"];
      uint64_t v260 = [v4 decodeObjectOfClass:v258 forKey:v259];
      duplicateMatchingAlternateData = v7->_duplicateMatchingAlternateData;
      v7->_duplicateMatchingAlternateData = (NSData *)v260;

      if (![(NSData *)v7->_duplicateMatchingData length])
      {
        long long v262 = v7->_duplicateMatchingData;
        v7->_duplicateMatchingData = 0;
      }
      if (![(NSData *)v7->_duplicateMatchingAlternateData length])
      {
        v263 = v7->_duplicateMatchingAlternateData;
        v7->_duplicateMatchingAlternateData = 0;
      }
      long long v264 = [NSString stringWithUTF8String:"duplicateProcessingSucceeded"];
      v7->_duplicateProcessingSucceeded = [v4 decodeBoolForKey:v264];
    }
    uint64_t v265 = objc_opt_class();
    v266 = [NSString stringWithUTF8String:"reverseLocationData"];
    uint64_t v267 = [v4 decodeObjectOfClass:v265 forKey:v266];
    reverseLocationData = v7->_reverseLocationData;
    v7->_reverseLocationData = (NSData *)v267;

    if (v7->_reverseLocationData) {
      v7->_didSetReverseLocationData = 1;
    }
    v269 = [NSString stringWithUTF8String:"reverseLocationDataIsValid"];
    v7->_reverseLocationDataIsValid = [v4 decodeBoolForKey:v269];

    if (v7->_reverseLocationDataIsValid) {
      v7->_didSetReverseLocationDataIsValid = 1;
    }
    uint64_t v270 = objc_opt_class();
    CGImageSourceRef v271 = [NSString stringWithUTF8String:"objectSaliencyRectsData"];
    uint64_t v272 = [v4 decodeObjectOfClass:v270 forKey:v271];
    objectSaliencyRectsData = v7->_objectSaliencyRectsData;
    v7->_objectSaliencyRectsData = (NSData *)v272;

    if (v7->_objectSaliencyRectsData) {
      v7->_didSetObjectSaliencyRectsData = 1;
    }
    v274 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v275 = objc_opt_class();
    id v276 = objc_msgSend(v274, "setWithObjects:", v275, objc_opt_class(), 0);
    v277 = [NSString stringWithUTF8String:"shiftedLocation"];
    uint64_t v278 = [v4 decodeObjectOfClasses:v276 forKey:v277];
    shiftedLocatiouint64_t n = v7->_shiftedLocation;
    v7->_shiftedLocatiouint64_t n = (CLLocation *)v278;

    v280 = v7->_shiftedLocation;
    v7->_didSetShiftedLocatiouint64_t n = 1;
    if (!v280)
    {
      v281 = v7->_shiftedLocation;
      v7->_shiftedLocatiouint64_t n = 0;
    }
    uint64_t v282 = objc_opt_class();
    id v283 = [NSString stringWithUTF8String:"timeZoneName"];
    uint64_t v284 = [v4 decodeObjectOfClass:v282 forKey:v283];
    timeZoneName = v7->_timeZoneName;
    v7->_timeZoneName = (NSString *)v284;

    if (v7->_timeZoneName)
    {
      v7->_didSetTimeZone = 1;
      v286 = [NSString stringWithUTF8String:"timeZoneOffsetValue"];
      v7->_timeZoneOffsetValue = [v4 decodeInt32ForKey:v286];
    }
    v287 = [NSString stringWithUTF8String:"gpsHorizontalAccuracy"];
    [v4 decodeDoubleForKey:v287];
    v7->_gpsHorizontalAccuracy = v288;

    if (v7->_gpsHorizontalAccuracy != 0.0) {
      v7->_didSetGpsHorizontalAccuracy = 1;
    }
    v289 = [NSString stringWithUTF8String:"screenTimeDeviceImageSensitivity"];
    v7->_screenTimeDeviceImageSensitivity = [v4 decodeIntegerForKey:v289];

    if (v7->_screenTimeDeviceImageSensitivity) {
      v7->_didSetScreenTimeDeviceImageSensitivity = 1;
    }
    v290 = [NSString stringWithUTF8String:"syndicationProcessingValue"];
    v7->_syndicationProcessingValue = [v4 decodeIntegerForKey:v290];

    if (v7->_syndicationProcessingValue) {
      v7->_didSetSyndicationProcessingValue = 1;
    }
    double v291 = [NSString stringWithUTF8String:"syndicationProcessingVersion"];
    v7->_syndicationProcessingVersiouint64_t n = [v4 decodeInt64ForKey:v291];

    if (v7->_syndicationProcessingVersion) {
      v7->_didSetSyndicationProcessingVersiouint64_t n = 1;
    }
    uint64_t v292 = objc_opt_class();
    double v293 = [NSString stringWithUTF8String:"syndicationIdentifier"];
    uint64_t v294 = [v4 decodeObjectOfClass:v292 forKey:v293];
    syndicationIdentifier = v7->_syndicationIdentifier;
    v7->_syndicationIdentifier = (NSString *)v294;

    if (v7->_syndicationIdentifier) {
      v7->_didSetSyndicationIdentifier = 1;
    }
    v296 = [NSString stringWithUTF8String:"faceAnalysisVersion"];
    v7->_faceAnalysisVersiouint64_t n = [v4 decodeIntegerForKey:v296];

    if (v7->_faceAnalysisVersion) {
      v7->_didSetFaceAnalysisVersiouint64_t n = 1;
    }
    double v297 = [NSString stringWithUTF8String:"localAnalysisStage"];
    v7->_int localAnalysisStage = [v4 decodeIntegerForKey:v297];

    if (v7->_localAnalysisStage) {
      v7->_didSetLocalAnalysisStage = 1;
    }
    v298 = [NSString stringWithUTF8String:"viewPresentation"];
    v7->_viewPresentatiouint64_t n = [v4 decodeIntegerForKey:v298];

    if (v7->_viewPresentation) {
      v7->_didSetViewPresentatiouint64_t n = 1;
    }
    double v299 = [NSString stringWithUTF8String:"ResetGeneratedAssetDescriptionKey"];
    v7->_resetGeneratedAssetDescriptionProperties = [v4 decodeBoolForKey:v299];

    if (!v7->_resetGeneratedAssetDescriptionProperties)
    {
      v300 = [NSString stringWithUTF8String:"DidSetGeneratedAssetDescriptionKey"];
      v7->_didSetGeneratedAssetDescriptionProperties = [v4 decodeBoolForKey:v300];

      if (v7->_didSetGeneratedAssetDescriptionProperties)
      {
        double v301 = [NSString stringWithUTF8String:"GeneratedAssetDescriptionPropertiesKey"];
        uint64_t v302 = [v4 decodeObjectForKey:v301];
        generatedAssetDescriptionDictionaries = v7->_generatedAssetDescriptionDictionaries;
        v7->_generatedAssetDescriptionDictionaries = (NSMutableDictionary *)v302;
      }
    }
    v304 = [NSString stringWithUTF8String:"PtpTrashedStateKey"];
    double v305 = [v4 decodeObjectForKey:v304];

    if (v305)
    {
      v7->_ptpTrashedState = [v305 integerValue];
      v7->_didSetPtpTrashedState = 1;
    }
    v306 = [NSString stringWithUTF8String:"savedAssetType"];
    v7->_savedAssetType = [v4 decodeIntegerForKey:v306];

    if (v7->_savedAssetType) {
      v7->_didSetSavedAssetType = 1;
    }

    int64_t v5 = v312;
  }
  double v307 = v7;

  return v307;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->super._helper forKey:@"helper"];
  facesHelper = self->_facesHelper;
  id v6 = [(PHRelationshipChangeRequestHelper *)facesHelper relationshipName];
  [v4 encodeObject:facesHelper forKey:v6];

  temporalFacesHelper = self->_temporalFacesHelper;
  uint64_t v8 = [(PHRelationshipChangeRequestHelper *)temporalFacesHelper relationshipName];
  [v4 encodeObject:temporalFacesHelper forKey:v8];

  keywordsHelper = self->_keywordsHelper;
  uint64_t v10 = [(PHRelationshipChangeRequestHelper *)keywordsHelper relationshipName];
  [v4 encodeObject:keywordsHelper forKey:v10];

  commentsHelper = self->_commentsHelper;
  uint64_t v12 = [(PHRelationshipChangeRequestHelper *)commentsHelper relationshipName];
  [v4 encodeObject:commentsHelper forKey:v12];

  likesHelper = self->_likesHelper;
  uint64_t v14 = [(PHRelationshipChangeRequestHelper *)likesHelper relationshipName];
  [v4 encodeObject:likesHelper forKey:v14];

  if (self->_didChangeAdjustments)
  {
    NSUInteger v15 = [(PHAssetChangeRequest *)self contentEditingOutput];
    if (v15)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"didChangeAdjustments"];
      [v4 encodeBool:1 forKey:v16];

      uint64_t v17 = [NSString stringWithUTF8String:"contentEditingOutput"];
      [v4 encodeObject:v15 forKey:v17];

      editorBundleID = self->_editorBundleID;
      uint64_t v19 = [NSString stringWithUTF8String:"editorBundleID"];
      [v4 encodeObject:editorBundleID forKey:v19];

      editorBundleURL = self->_editorBundleURL;
      uint64_t v21 = [NSString stringWithUTF8String:"editorBundleURL"];
      [v4 encodeObject:editorBundleURL forKey:v21];
    }
  }
  BOOL didSetOriginalResourceChoice = self->_didSetOriginalResourceChoice;
  id v23 = [NSString stringWithUTF8String:"didSetOriginalResourceChoice"];
  [v4 encodeBool:didSetOriginalResourceChoice forKey:v23];

  BOOL didRevertLocationToOriginal = self->_didRevertLocationToOriginal;
  char v25 = [NSString stringWithUTF8String:"didRevertLocationToOriginal"];
  [v4 encodeBool:didRevertLocationToOriginal forKey:v25];

  unint64_t originalResourceChoice = self->_originalResourceChoice;
  uint64_t v27 = [NSString stringWithUTF8String:"originalResourceChoice"];
  [v4 encodeInteger:originalResourceChoice forKey:v27];

  BOOL didUpdateExtendedAttributesUsingOriginalMediaMetadata = self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata;
  uint64_t v29 = [NSString stringWithUTF8String:"didUpdateExtendedAttributesUsingOriginalMediaMetadata"];
  [v4 encodeBool:didUpdateExtendedAttributesUsingOriginalMediaMetadata forKey:v29];

  BOOL didExpungeAllSpatialOverCaptureResources = self->_didExpungeAllSpatialOverCaptureResources;
  uint64_t v31 = [NSString stringWithUTF8String:"didExpungeAllSpatialOverCaptureResources"];
  [v4 encodeBool:didExpungeAllSpatialOverCaptureResources forKey:v31];

  BOOL didTrashAllSpatialOverCaptureResources = self->_didTrashAllSpatialOverCaptureResources;
  uint64_t v33 = [NSString stringWithUTF8String:"didTrashAllSpatialOverCaptureResources"];
  [v4 encodeBool:didTrashAllSpatialOverCaptureResources forKey:v33];

  BOOL didUntrashAllSpatialOverCaptureResources = self->_didUntrashAllSpatialOverCaptureResources;
  BOOL v35 = [NSString stringWithUTF8String:"didUntrashAllSpatialOverCaptureResources"];
  [v4 encodeBool:didUntrashAllSpatialOverCaptureResources forKey:v35];

  BOOL didExpungeTrashedSpatialOverCaptureResources = self->_didExpungeTrashedSpatialOverCaptureResources;
  int v37 = [NSString stringWithUTF8String:"didExpungeTrashedSpatialOverCaptureResources"];
  [v4 encodeBool:didExpungeTrashedSpatialOverCaptureResources forKey:v37];

  BOOL didPromoteToGuestAsset = self->_didPromoteToGuestAsset;
  id v39 = [NSString stringWithUTF8String:"didPromoteToGuestAsset"];
  [v4 encodeBool:didPromoteToGuestAsset forKey:v39];

  didResetGuestAssetPromotiouint64_t n = self->_didResetGuestAssetPromotion;
  int v41 = [NSString stringWithUTF8String:"didResetGuestAssetPromotion"];
  [v4 encodeBool:didResetGuestAssetPromotion forKey:v41];

  updatedLocatiouint64_t n = self->_updatedLocation;
  uint64_t v43 = [NSString stringWithUTF8String:"updatedLocation"];
  [v4 encodeObject:updatedLocation forKey:v43];

  assetDescriptiouint64_t n = self->_assetDescription;
  uint64_t v45 = [NSString stringWithUTF8String:"assetDescription"];
  [v4 encodeObject:assetDescription forKey:v45];

  accessibilityDescriptiouint64_t n = self->_accessibilityDescription;
  uint64_t v47 = [NSString stringWithUTF8String:"accessibilityDescription"];
  [v4 encodeObject:accessibilityDescription forKey:v47];

  BOOL didSetTitle = self->_didSetTitle;
  uint64_t v49 = [NSString stringWithUTF8String:"didSetTitle"];
  [v4 encodeBool:didSetTitle forKey:v49];

  title = self->_title;
  uint64_t v51 = [NSString stringWithUTF8String:"title"];
  [v4 encodeObject:title forKey:v51];

  BOOL didSetKeywordTitles = self->_didSetKeywordTitles;
  uint64_t v53 = [NSString stringWithUTF8String:"didSetKeywordTitles"];
  [v4 encodeBool:didSetKeywordTitles forKey:v53];

  keywordTitles = self->_keywordTitles;
  uint64_t v55 = [NSString stringWithUTF8String:"keywordTitles"];
  [v4 encodeObject:keywordTitles forKey:v55];

  videoURLForUpdate = self->_videoURLForUpdate;
  uint64_t v57 = [NSString stringWithUTF8String:"videoURLForUpdate"];
  [v4 encodeObject:videoURLForUpdate forKey:v57];

  pairingIdentifier = self->_pairingIdentifier;
  uint64_t v59 = [NSString stringWithUTF8String:"pairingIdentifier"];
  [v4 encodeObject:pairingIdentifier forKey:v59];

  if (self->_videoDuration.flags)
  {
    *(_OWORD *)&v258.start.value = *(_OWORD *)&self->_videoDuration.value;
    v258.start.epoch = self->_videoDuration.epoch;
    CFDictionaryRef v60 = CMTimeCopyAsDictionary(&v258.start, 0);
    if (v60)
    {
      CFDictionaryRef v61 = v60;
      uint64_t v62 = [NSString stringWithUTF8String:"videoDuration"];
      [v4 encodeObject:v61 forKey:v62];

      CFRelease(v61);
    }
  }
  if (self->_imageDisplayTime.flags)
  {
    *(_OWORD *)&v258.start.value = *(_OWORD *)&self->_imageDisplayTime.value;
    v258.start.epoch = self->_imageDisplayTime.epoch;
    CFDictionaryRef v63 = CMTimeCopyAsDictionary(&v258.start, 0);
    if (v63)
    {
      CFDictionaryRef v64 = v63;
      uint64_t v65 = [NSString stringWithUTF8String:"imageDisplayTime"];
      [v4 encodeObject:v64 forKey:v65];

      CFRelease(v64);
    }
  }
  BOOL didSetVisibilityState = self->_didSetVisibilityState;
  uint64_t v67 = [NSString stringWithUTF8String:"didSetVisibilityState"];
  [v4 encodeBool:didSetVisibilityState forKey:v67];

  uint64_t photoIrisVisibilityState = self->_photoIrisVisibilityState;
  uint64_t v69 = [NSString stringWithUTF8String:"photoIrisVisibilityState"];
  [v4 encodeInteger:photoIrisVisibilityState forKey:v69];

  if (self->_didSetSceneClassifications)
  {
    sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
    uint64_t v71 = [NSString stringWithUTF8String:"sceneClassificationsByType"];
    [v4 encodeObject:sceneClassificationDictionariesByType forKey:v71];
  }
  if (self->_didSetImageEmbeddingVersion)
  {
    imageEmbeddingVersiouint64_t n = self->_imageEmbeddingVersion;
    uint64_t v73 = [NSString stringWithUTF8String:"imageEmbeddingVersion"];
    [v4 encodeInteger:imageEmbeddingVersion forKey:v73];

    id v74 = [NSString stringWithUTF8String:"didSetImageEmbeddingVersionKey"];
    [v4 encodeBool:1 forKey:v74];
  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    videoEmbeddingVersiouint64_t n = self->_videoEmbeddingVersion;
    id v76 = [NSString stringWithUTF8String:"videoEmbeddingVersion"];
    [v4 encodeInteger:videoEmbeddingVersion forKey:v76];

    uint64_t v77 = [NSString stringWithUTF8String:"didSetVideoEmbeddingVersionKey"];
    [v4 encodeBool:1 forKey:v77];
  }
  BOOL incrementPlayCount = self->_incrementPlayCount;
  uint64_t v79 = [NSString stringWithUTF8String:"incrementPlayCount"];
  [v4 encodeBool:incrementPlayCount forKey:v79];

  BOOL incrementShareCount = self->_incrementShareCount;
  CFDictionaryRef v81 = [NSString stringWithUTF8String:"incrementShareCount"];
  [v4 encodeBool:incrementShareCount forKey:v81];

  lastSharedDate = self->_lastSharedDate;
  long long v83 = [NSString stringWithUTF8String:"lastSharedDate"];
  [v4 encodeObject:lastSharedDate forKey:v83];

  BOOL incrementViewCount = self->_incrementViewCount;
  uint64_t v85 = [NSString stringWithUTF8String:"incrementViewCount"];
  [v4 encodeBool:incrementViewCount forKey:v85];

  BOOL clearLastViewedDate = self->_clearLastViewedDate;
  CFDictionaryRef v87 = [NSString stringWithUTF8String:"clearLastViewedDate"];
  [v4 encodeBool:clearLastViewedDate forKey:v87];

  BOOL clearLastSharedDate = self->_clearLastSharedDate;
  long long v89 = [NSString stringWithUTF8String:"clearLastSharedDate"];
  [v4 encodeBool:clearLastSharedDate forKey:v89];

  if (self->_didSetVariationSuggestionStates)
  {
    unint64_t variationSuggestionStates = self->_variationSuggestionStates;
    uint64_t v91 = [NSString stringWithUTF8String:"variationSuggestionStates"];
    [v4 encodeInt64:variationSuggestionStates forKey:v91];

    variationSuggestionStatesMasuint64_t k = self->_variationSuggestionStatesMask;
    v93 = [NSString stringWithUTF8String:"variationSuggestionStatesMask"];
    [v4 encodeInt64:variationSuggestionStatesMask forKey:v93];
  }
  BOOL toRetryUpload = self->_toRetryUpload;
  v95 = [NSString stringWithUTF8String:"toRetryUpload"];
  [v4 encodeBool:toRetryUpload forKey:v95];

  if (self->_didSetPackedPreferredCropRect)
  {
    int64_t packedPreferredCropRect = self->_packedPreferredCropRect;
    uint64_t v97 = [NSString stringWithUTF8String:"packedPreferredCropRect"];
    [v4 encodeInt64:packedPreferredCropRect forKey:v97];
  }
  if (self->_didSetPackedAcceptableCropRect)
  {
    int64_t packedAcceptableCropRect = self->_packedAcceptableCropRect;
    v99 = [NSString stringWithUTF8String:"packedAcceptableCropRect"];
    [v4 encodeInt64:packedAcceptableCropRect forKey:v99];
  }
  if (self->_didSetPackedBestPlaybackRect)
  {
    int64_t packedBestPlaybackRect = self->_packedBestPlaybackRect;
    v101 = [NSString stringWithUTF8String:"packedBestPlaybackRect"];
    [v4 encodeInt64:packedBestPlaybackRect forKey:v101];
  }
  if (self->_didModifyComputedAttributes)
  {
    computedAttributeMutations = self->_computedAttributeMutations;
    id v103 = computedAttributeMutations;
    if (!computedAttributeMutations)
    {
      id v103 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    v104 = [NSString stringWithUTF8String:"computedAttributeMutations"];
    [v4 encodeObject:v103 forKey:v104];

    if (!computedAttributeMutations) {
  }
    }
  if ([(NSDictionary *)self->_pathsToNewAssetResourcesByAssetResourceType count])
  {
    pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
    uint64_t v106 = [NSString stringWithUTF8String:"pathsToNewAssetResourcesByAssetResourceType"];
    [v4 encodeObject:pathsToNewAssetResourcesByAssetResourceType forKey:v106];
  }
  if ([(NSSet *)self->_assetResourceTypesToDelete count])
  {
    assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
    uint64_t v108 = [NSString stringWithUTF8String:"assetResourceTypesToDelete"];
    [v4 encodeObject:assetResourceTypesToDelete forKey:v108];
  }
  if ([(NSSet *)self->_libraryScopeOriginatorUUIDs count])
  {
    v109 = [(NSSet *)self->_libraryScopeOriginatorUUIDs allObjects];
    v110 = [NSString stringWithUTF8String:"libraryScopeOriginatorUUIDs"];
    [v4 encodeObject:v109 forKey:v110];
  }
  if (self->_resetWallpaperProperties)
  {
    v111 = [NSString stringWithUTF8String:"resetWallpaperProperties"];
    [v4 encodeBool:1 forKey:v111];
LABEL_44:

    goto LABEL_45;
  }
  if (self->_didSetWallpaperPropertiesTimestamp)
  {
    wallpaperPropertiesTimestamp = self->_wallpaperPropertiesTimestamp;
    v113 = [NSString stringWithUTF8String:"photoAnalysisWallpaperPropertiesTimeStamp"];
    [v4 encodeObject:wallpaperPropertiesTimestamp forKey:v113];
  }
  if (self->_didSetWallpaperPropertiesVersion)
  {
    wallpaperPropertiesVersiouint64_t n = self->_wallpaperPropertiesVersion;
    uint64_t v115 = [NSString stringWithUTF8String:"photoAnalysisWallpaperPropertiesVersion"];
    [v4 encodeInt64:wallpaperPropertiesVersion forKey:v115];
  }
  if (self->_didSetWallpaperPropertiesData)
  {
    wallpaperPropertiesData = self->_wallpaperPropertiesData;
    v111 = [NSString stringWithUTF8String:"photoAnalysisWallpaperProperties"];
    [v4 encodeObject:wallpaperPropertiesData forKey:v111];
    goto LABEL_44;
  }
LABEL_45:
  mediaAnalysisTimeStamp = self->_mediaAnalysisTimeStamp;
  uint64_t v118 = [NSString stringWithUTF8String:"mediaAnalysisTimeStamp"];
  [v4 encodeObject:mediaAnalysisTimeStamp forKey:v118];

  if (self->_didSetMediaAnalysisVersion)
  {
    mediaAnalysisVersiouint64_t n = self->_mediaAnalysisVersion;
    uint64_t v120 = [NSString stringWithUTF8String:"mediaAnalysisVersion"];
    [v4 encodeInt64:mediaAnalysisVersion forKey:v120];
  }
  if (self->_didSetMediaAnalysisImageVersion)
  {
    mediaAnalysisImageVersiouint64_t n = self->_mediaAnalysisImageVersion;
    uint64_t v122 = [NSString stringWithUTF8String:"mediaAnalysisImageVersion"];
    [v4 encodeInt64:mediaAnalysisImageVersion forKey:v122];
  }
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    long long v123 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)&v258.start.value = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&v258.start.epoch = v123;
    *(_OWORD *)&v258.duration.timescale = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    CFDictionaryRef v124 = CMTimeRangeCopyAsDictionary(&v258, 0);
    if (v124)
    {
      CFDictionaryRef v125 = v124;
      v126 = [NSString stringWithUTF8String:"bestVideoTimeRange"];
      [v4 encodeObject:v125 forKey:v126];

      CFRelease(v125);
    }
  }
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    long long v127 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)&v258.start.value = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&v258.start.epoch = v127;
    *(_OWORD *)&v258.duration.timescale = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    CFDictionaryRef v128 = CMTimeRangeCopyAsDictionary(&v258, 0);
    if (v128)
    {
      CFDictionaryRef v129 = v128;
      v130 = [NSString stringWithUTF8String:"animatedStickerTimeRange"];
      [v4 encodeObject:v129 forKey:v130];

      CFRelease(v129);
    }
  }
  if (self->_bestKeyFrameTime.flags)
  {
    *(_OWORD *)&v258.start.value = *(_OWORD *)&self->_bestKeyFrameTime.value;
    v258.start.epoch = self->_bestKeyFrameTime.epoch;
    CFDictionaryRef v131 = CMTimeCopyAsDictionary(&v258.start, 0);
    if (v131)
    {
      CFDictionaryRef v132 = v131;
      v133 = [NSString stringWithUTF8String:"bestKeyFrameTime"];
      [v4 encodeObject:v132 forKey:v133];

      CFRelease(v132);
    }
  }
  BOOL didUnsetBestKeyFrameTime = self->_didUnsetBestKeyFrameTime;
  v135 = [NSString stringWithUTF8String:"unsetBestKeyFrameTime"];
  [v4 encodeBool:didUnsetBestKeyFrameTime forKey:v135];

  bestKeyFrameJPEGData = self->_bestKeyFrameJPEGData;
  uint64_t v137 = [NSString stringWithUTF8String:"bestKeyFrameJPEGData"];
  [v4 encodeObject:bestKeyFrameJPEGData forKey:v137];

  computeSyncMediaAnalysisPayload = self->_computeSyncMediaAnalysisPayload;
  uint64_t v139 = [NSString stringWithUTF8String:"computeSyncMediaAnalysisPayload"];
  [v4 encodeObject:computeSyncMediaAnalysisPayload forKey:v139];

  if (self->_didSetBlurrinessScore)
  {
    float blurrinessScore = self->_blurrinessScore;
    v141 = [NSString stringWithUTF8String:"blurrinessScore"];
    *(float *)&double v142 = blurrinessScore;
    [v4 encodeFloat:v141 forKey:v142];
  }
  if (self->_didSetExposureScore)
  {
    float exposureScore = self->_exposureScore;
    v144 = [NSString stringWithUTF8String:"exposureScore"];
    *(float *)&double v145 = exposureScore;
    [v4 encodeFloat:v144 forKey:v145];
  }
  if (self->_didSetAudioScore)
  {
    float audioScore = self->_audioScore;
    uint64_t v147 = [NSString stringWithUTF8String:"audioScore"];
    *(float *)&double v148 = audioScore;
    [v4 encodeFloat:v147 forKey:v148];
  }
  if (self->_didSetSettlingEffectScore)
  {
    float settlingEffectScore = self->_settlingEffectScore;
    uint64_t v150 = [NSString stringWithUTF8String:"settlingEffectScore"];
    *(float *)&double v151 = settlingEffectScore;
    [v4 encodeFloat:v150 forKey:v151];
  }
  if (self->_didSetWallpaperScore)
  {
    float wallpaperScore = self->_wallpaperScore;
    v153 = [NSString stringWithUTF8String:"wallpaperScore"];
    *(float *)&double v154 = wallpaperScore;
    [v4 encodeFloat:v153 forKey:v154];
  }
  if (self->_didSetAutoplaySuggestionScore)
  {
    float autoplaySuggestionScore = self->_autoplaySuggestionScore;
    uint64_t v156 = [NSString stringWithUTF8String:"autoplaySuggestionScore"];
    *(float *)&double v157 = autoplaySuggestionScore;
    [v4 encodeFloat:v156 forKey:v157];
  }
  if (self->_didSetVideoStickerSuggestionScore)
  {
    float videoStickerSuggestionScore = self->_videoStickerSuggestionScore;
    int v159 = [NSString stringWithUTF8String:"videoStickerSuggestionScore"];
    *(float *)&double v160 = videoStickerSuggestionScore;
    [v4 encodeFloat:v159 forKey:v160];
  }
  if (self->_didSetVideoScore)
  {
    float videoScore = self->_videoScore;
    CFDictionaryRef v162 = [NSString stringWithUTF8String:"videoScore"];
    *(float *)&double v163 = videoScore;
    [v4 encodeFloat:v162 forKey:v163];
  }
  if (self->_didSetActivityScore)
  {
    float activityScore = self->_activityScore;
    uint64_t v165 = [NSString stringWithUTF8String:"activityScore"];
    *(float *)&double v166 = activityScore;
    [v4 encodeFloat:v165 forKey:v166];
  }
  if (self->_didSetFaceCount)
  {
    unint64_t faceCount = self->_faceCount;
    uint64_t v168 = [NSString stringWithUTF8String:"faceCount"];
    [v4 encodeInt64:faceCount forKey:v168];
  }
  if (self->_didSetAudioClassification)
  {
    audioClassificatiouint64_t n = self->_audioClassification;
    v170 = [NSString stringWithUTF8String:"audioClassification"];
    [v4 encodeInteger:audioClassification forKey:v170];
  }
  if (self->_didSetProbableRotationDirection)
  {
    probableRotationDirectiouint64_t n = self->_probableRotationDirection;
    v172 = [NSString stringWithUTF8String:"probableRotationDirection"];
    [v4 encodeInteger:probableRotationDirection forKey:v172];
  }
  if (self->_didSetProbableRotationDirectionConfidence)
  {
    float probableRotationDirectionConfidence = self->_probableRotationDirectionConfidence;
    v174 = [NSString stringWithUTF8String:"probableRotationDirectionConfidence"];
    *(float *)&double v175 = probableRotationDirectionConfidence;
    [v4 encodeFloat:v174 forKey:v175];
  }
  colorNormalizationData = self->_colorNormalizationData;
  long long v177 = [NSString stringWithUTF8String:"colorNormalizationData"];
  [v4 encodeObject:colorNormalizationData forKey:v177];

  BOOL resetCharacterRecognitionProperties = self->_resetCharacterRecognitionProperties;
  v179 = [NSString stringWithUTF8String:"resetCharacterRecognitionProperties"];
  [v4 encodeBool:resetCharacterRecognitionProperties forKey:v179];

  if (self->_didSetCharacterRecognitionData)
  {
    CFDictionaryRef v180 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
    long long v181 = [NSNumber numberWithInteger:self->_characterRecognitionAlgorithmVersion];
    long long v182 = [NSString stringWithUTF8String:"characterRecognitionAlgorithmVersion"];
    [v180 setObject:v181 forKeyedSubscript:v182];

    characterRecognitionAdjustmentVersiouint64_t n = self->_characterRecognitionAdjustmentVersion;
    float v184 = [NSString stringWithUTF8String:"characterRecognitionAdjustmentVersion"];
    [v180 setObject:characterRecognitionAdjustmentVersion forKeyedSubscript:v184];

    characterRecognitionData = self->_characterRecognitionData;
    if (characterRecognitionData)
    {
      float v186 = [NSString stringWithUTF8String:"characterRecognitionData"];
      [v180 setObject:characterRecognitionData forKeyedSubscript:v186];
    }
    machineReadableCodeData = self->_machineReadableCodeData;
    if (machineReadableCodeData)
    {
      float v188 = [NSString stringWithUTF8String:"machineReadableCodeData"];
      [v180 setObject:machineReadableCodeData forKeyedSubscript:v188];
    }
    v189 = [NSString stringWithUTF8String:"characterRecognitionProperties"];
    [v4 encodeObject:v180 forKey:v189];
  }
  BOOL resetVisualSearchProperties = self->_resetVisualSearchProperties;
  v191 = [NSString stringWithUTF8String:"resetVisualSearchProperties"];
  [v4 encodeBool:resetVisualSearchProperties forKey:v191];

  if (self->_didSetVisualSearchProperties)
  {
    id v192 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v193 = [NSNumber numberWithInteger:self->_visualSearchAlgorithmVersion];
    float v194 = [NSString stringWithUTF8String:"visualSearchAlgorithmVersion"];
    [v192 setObject:v193 forKeyedSubscript:v194];

    visualSearchAdjustmentVersiouint64_t n = self->_visualSearchAdjustmentVersion;
    float v196 = [NSString stringWithUTF8String:"visualSearchAdjustmentVersion"];
    [v192 setObject:visualSearchAdjustmentVersion forKeyedSubscript:v196];

    uint64_t v197 = [NSNumber numberWithBool:self->_didSetStickerConfidenceScore];
    float v198 = [NSString stringWithUTF8String:"didSetStickerConfidenceScore"];
    [v192 setObject:v197 forKeyedSubscript:v198];

    *(float *)&double v199 = self->_stickerConfidenceScore;
    float v200 = [NSNumber numberWithFloat:v199];
    id v201 = [NSString stringWithUTF8String:"stickerConfidenceScore"];
    [v192 setObject:v200 forKeyedSubscript:v201];

    v202 = [NSNumber numberWithInteger:self->_stickerConfidenceScoreAlgorithmVersion];
    v203 = [NSString stringWithUTF8String:"stickerConfidenceScoreAlgorithmVersion"];
    [v192 setObject:v202 forKeyedSubscript:v203];

    visualSearchData = self->_visualSearchData;
    if (visualSearchData)
    {
      float v205 = [NSString stringWithUTF8String:"visualSearchData"];
      [v192 setObject:visualSearchData forKeyedSubscript:v205];
    }
    uint64_t v206 = [NSNumber numberWithBool:self->_didSetVisualSearchData];
    uint64_t v207 = [NSString stringWithUTF8String:"didSetVisualSearchData"];
    [v192 setObject:v206 forKeyedSubscript:v207];

    uint64_t v208 = [NSString stringWithUTF8String:"visualSearchProperties"];
    [v4 encodeObject:v192 forKey:v208];
  }
  if (self->_didSetSceneprintData)
  {
    sceneprintData = self->_sceneprintData;
    v210 = sceneprintData;
    if (!sceneprintData)
    {
      v210 = [MEMORY[0x1E4F1C9B8] data];
    }
    v211 = [NSString stringWithUTF8String:"sceneprintData"];
    [v4 encodeObject:v210 forKey:v211];

    if (!sceneprintData) {
  }
    }
  if (self->_didSetDuplicateMatchingData)
  {
    duplicateMatchingData = self->_duplicateMatchingData;
    v213 = duplicateMatchingData;
    if (!duplicateMatchingData)
    {
      v213 = [MEMORY[0x1E4F1C9B8] data];
    }
    unint64_t v214 = [NSString stringWithUTF8String:"duplicateMatchingData"];
    [v4 encodeObject:v213 forKey:v214];

    if (!duplicateMatchingData) {
    duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
    }
    v216 = duplicateMatchingAlternateData;
    if (!duplicateMatchingAlternateData)
    {
      v216 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t v217 = [NSString stringWithUTF8String:"duplicateMatchingAlternateData"];
    [v4 encodeObject:v216 forKey:v217];

    if (!duplicateMatchingAlternateData) {
    BOOL duplicateProcessingSucceeded = self->_duplicateProcessingSucceeded;
    }
    v219 = [NSString stringWithUTF8String:"duplicateProcessingSucceeded"];
    [v4 encodeBool:duplicateProcessingSucceeded forKey:v219];
  }
  if (self->_didSetReverseLocationData)
  {
    reverseLocationData = self->_reverseLocationData;
    id v221 = reverseLocationData;
    if (!reverseLocationData)
    {
      id v221 = [MEMORY[0x1E4F1C9B8] data];
    }
    v222 = [NSString stringWithUTF8String:"reverseLocationData"];
    [v4 encodeObject:v221 forKey:v222];

    if (!reverseLocationData) {
  }
    }
  if (self->_didSetReverseLocationDataIsValid)
  {
    BOOL reverseLocationDataIsValid = self->_reverseLocationDataIsValid;
    double v224 = [NSString stringWithUTF8String:"reverseLocationDataIsValid"];
    [v4 encodeBool:reverseLocationDataIsValid forKey:v224];
  }
  if (self->_didSetShiftedLocation)
  {
    shiftedLocatiouint64_t n = self->_shiftedLocation;
    double v226 = shiftedLocation;
    if (!shiftedLocation)
    {
      double v226 = [MEMORY[0x1E4F1C9B8] data];
    }
    v227 = [NSString stringWithUTF8String:"shiftedLocation"];
    [v4 encodeObject:v226 forKey:v227];

    if (!shiftedLocation) {
  }
    }
  if (self->_didSetObjectSaliencyRectsData)
  {
    objectSaliencyRectsData = self->_objectSaliencyRectsData;
    uint64_t v229 = objectSaliencyRectsData;
    if (!objectSaliencyRectsData)
    {
      uint64_t v229 = [MEMORY[0x1E4F1C9B8] data];
    }
    v230 = [NSString stringWithUTF8String:"objectSaliencyRectsData"];
    [v4 encodeObject:v229 forKey:v230];

    if (!objectSaliencyRectsData) {
  }
    }
  if (self->_didSetTimeZone)
  {
    timeZoneName = self->_timeZoneName;
    int v232 = [NSString stringWithUTF8String:"timeZoneName"];
    [v4 encodeObject:timeZoneName forKey:v232];

    uint64_t timeZoneOffsetValue = self->_timeZoneOffsetValue;
    uint64_t v234 = [NSString stringWithUTF8String:"timeZoneOffsetValue"];
    [v4 encodeInt32:timeZoneOffsetValue forKey:v234];
  }
  if (self->_didSetGpsHorizontalAccuracy)
  {
    double gpsHorizontalAccuracy = self->_gpsHorizontalAccuracy;
    v236 = [NSString stringWithUTF8String:"gpsHorizontalAccuracy"];
    [v4 encodeDouble:v236 forKey:gpsHorizontalAccuracy];
  }
  if (self->_didSetScreenTimeDeviceImageSensitivity)
  {
    uint64_t screenTimeDeviceImageSensitivity = self->_screenTimeDeviceImageSensitivity;
    uint64_t v238 = [NSString stringWithUTF8String:"screenTimeDeviceImageSensitivity"];
    [v4 encodeInteger:screenTimeDeviceImageSensitivity forKey:v238];
  }
  if (self->_didSetSyndicationProcessingValue)
  {
    uint64_t syndicationProcessingValue = self->_syndicationProcessingValue;
    v240 = [NSString stringWithUTF8String:"syndicationProcessingValue"];
    [v4 encodeInteger:syndicationProcessingValue forKey:v240];
  }
  if (self->_didSetSyndicationProcessingVersion)
  {
    syndicationProcessingVersiouint64_t n = self->_syndicationProcessingVersion;
    float v242 = [NSString stringWithUTF8String:"syndicationProcessingVersion"];
    [v4 encodeInt64:syndicationProcessingVersion forKey:v242];
  }
  if (self->_didSetSyndicationIdentifier)
  {
    syndicationIdentifier = self->_syndicationIdentifier;
    v244 = [NSString stringWithUTF8String:"syndicationIdentifier"];
    [v4 encodeObject:syndicationIdentifier forKey:v244];
  }
  if (self->_didSetFaceAnalysisVersion)
  {
    faceAnalysisVersiouint64_t n = self->_faceAnalysisVersion;
    v246 = [NSString stringWithUTF8String:"faceAnalysisVersion"];
    [v4 encodeInteger:faceAnalysisVersion forKey:v246];
  }
  if (self->_didSetLocalAnalysisStage)
  {
    uint64_t localAnalysisStage = self->_localAnalysisStage;
    uint64_t v248 = [NSString stringWithUTF8String:"localAnalysisStage"];
    [v4 encodeInteger:localAnalysisStage forKey:v248];
  }
  if (self->_didSetViewPresentation)
  {
    viewPresentatiouint64_t n = self->_viewPresentation;
    uint64_t v250 = [NSString stringWithUTF8String:"viewPresentation"];
    [v4 encodeInteger:viewPresentation forKey:v250];
  }
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    uint64_t v251 = [NSString stringWithUTF8String:"ResetGeneratedAssetDescriptionKey"];
    [v4 encodeBool:1 forKey:v251];
  }
  else
  {
    if (!self->_didSetGeneratedAssetDescriptionProperties) {
      goto LABEL_155;
    }
    uint64_t v252 = [NSString stringWithUTF8String:"DidSetGeneratedAssetDescriptionKey"];
    [v4 encodeBool:1 forKey:v252];

    generatedAssetDescriptionDictionaries = self->_generatedAssetDescriptionDictionaries;
    uint64_t v251 = [NSString stringWithUTF8String:"GeneratedAssetDescriptionPropertiesKey"];
    [v4 encodeObject:generatedAssetDescriptionDictionaries forKey:v251];
  }

LABEL_155:
  if (self->_didSetPtpTrashedState)
  {
    int64_t ptpTrashedState = self->_ptpTrashedState;
    v255 = [NSString stringWithUTF8String:"PtpTrashedStateKey"];
    [v4 encodeInt64:ptpTrashedState forKey:v255];
  }
  if (self->_didSetSavedAssetType)
  {
    uint64_t savedAssetType = self->_savedAssetType;
    v257 = [NSString stringWithUTF8String:"savedAssetType"];
    [v4 encodeInteger:savedAssetType forKey:v257];
  }
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  id v6 = [(PHAssetChangeRequest *)self facesHelper];
  [v6 encodeToXPCDict:v4];

  BOOL v7 = [(PHAssetChangeRequest *)self temporalFacesHelper];
  [v7 encodeToXPCDict:v4];

  [(PHRelationshipChangeRequestHelper *)self->_keywordsHelper encodeToXPCDict:v4];
  [(PHRelationshipChangeRequestHelper *)self->_commentsHelper encodeToXPCDict:v4];
  [(PHRelationshipChangeRequestHelper *)self->_likesHelper encodeToXPCDict:v4];
  if ([(PHAssetChangeRequest *)self didChangeAdjustments])
  {
    uint64_t v8 = [(PHAssetChangeRequest *)self contentEditingOutput];
    if (v8)
    {
      id v71 = 0;
      uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v71];
      id v10 = v71;
      if (!v9)
      {
        char v11 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v10;
          _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "Failed to archive contentEditingOutput, error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    xpc_dictionary_set_BOOL(v4, "didChangeAdjustments", 1);
    PLXPCDictionarySetData();
    PLXPCDictionarySetString();
    PLXPCDictionarySetURL();
  }
  xpc_dictionary_set_BOOL(v4, "didSetOriginalResourceChoice", self->_didSetOriginalResourceChoice);
  xpc_dictionary_set_BOOL(v4, "didRevertLocationToOriginal", self->_didRevertLocationToOriginal);
  xpc_dictionary_set_uint64(v4, "originalResourceChoice", self->_originalResourceChoice);
  xpc_dictionary_set_BOOL(v4, "didUpdateExtendedAttributesUsingOriginalMediaMetadata", self->_didUpdateExtendedAttributesUsingOriginalMediaMetadata);
  xpc_dictionary_set_BOOL(v4, "didExpungeAllSpatialOverCaptureResources", self->_didExpungeAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didTrashAllSpatialOverCaptureResources", self->_didTrashAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didUntrashAllSpatialOverCaptureResources", self->_didUntrashAllSpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(v4, "didExpungeTrashedSpatialOverCaptureResources", self->_didExpungeTrashedSpatialOverCaptureResources);
  if (self->_didPromoteToGuestAsset) {
    xpc_dictionary_set_BOOL(v4, "didPromoteToGuestAsset", 1);
  }
  if (self->_didResetGuestAssetPromotion) {
    xpc_dictionary_set_BOOL(v4, "didResetGuestAssetPromotion", 1);
  }
  updatedLocatiouint64_t n = self->_updatedLocation;
  if (updatedLocation)
  {
    id v70 = 0;
    unint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:updatedLocation requiringSecureCoding:1 error:&v70];
    id v14 = v70;
    if (v13)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      NSUInteger v15 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v14;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "Failed to archive updatedLocation, error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if (self->_assetDescription) {
    PLXPCDictionarySetString();
  }
  if (self->_accessibilityDescription) {
    PLXPCDictionarySetString();
  }
  if (self->_didSetTitle)
  {
    xpc_dictionary_set_BOOL(v4, "didSetTitle", 1);
    if (self->_title) {
      PLXPCDictionarySetString();
    }
  }
  if (self->_didSetKeywordTitles)
  {
    xpc_dictionary_set_BOOL(v4, "didSetKeywordTitles", 1);
    keywordTitles = self->_keywordTitles;
    if (keywordTitles)
    {
      uint64_t v17 = [(NSSet *)keywordTitles allObjects];
      PLXPCDictionarySetArray();
    }
  }
  if (self->_videoURLForUpdate) {
    PLXPCDictionarySetURL();
  }
  if (self->_pairingIdentifier) {
    PLXPCDictionarySetString();
  }
  if (self->_videoDuration.flags)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_videoDuration.value;
    buf.start.epoch = self->_videoDuration.epoch;
    CFDictionaryRef v18 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v18)
    {
      CFDictionaryRef v19 = v18;
      PLXPCDictionarySetDictionary();
      CFRelease(v19);
    }
  }
  if (self->_imageDisplayTime.flags)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_imageDisplayTime.value;
    buf.start.epoch = self->_imageDisplayTime.epoch;
    CFDictionaryRef v20 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v20)
    {
      CFDictionaryRef v21 = v20;
      PLXPCDictionarySetDictionary();
      CFRelease(v21);
    }
  }
  xpc_dictionary_set_BOOL(v4, "didSetVisibilityState", self->_didSetVisibilityState);
  xpc_dictionary_set_uint64(v4, "photoIrisVisibilityState", self->_photoIrisVisibilityState);
  if (self->_didSetSceneClassifications) {
    PLXPCDictionarySetDictionary();
  }
  if (self->_didSetImageEmbeddingVersion)
  {
    xpc_dictionary_set_BOOL(v4, "didSetImageEmbeddingVersionKey", 1);
    xpc_dictionary_set_int64(v4, "imageEmbeddingVersion", self->_imageEmbeddingVersion);
  }
  if (self->_didSetVideoEmbeddingVersion)
  {
    xpc_dictionary_set_BOOL(v4, "didSetVideoEmbeddingVersionKey", 1);
    xpc_dictionary_set_int64(v4, "videoEmbeddingVersion", self->_videoEmbeddingVersion);
  }
  if (self->_incrementPlayCount) {
    xpc_dictionary_set_BOOL(v4, "incrementPlayCount", 1);
  }
  if (self->_incrementShareCount) {
    xpc_dictionary_set_BOOL(v4, "incrementShareCount", 1);
  }
  lastSharedDate = self->_lastSharedDate;
  if (lastSharedDate)
  {
    [(NSDate *)lastSharedDate timeIntervalSinceReferenceDate];
    xpc_dictionary_set_date(v4, "lastSharedDate", (uint64_t)v23);
  }
  if (self->_incrementViewCount) {
    xpc_dictionary_set_BOOL(v4, "incrementViewCount", 1);
  }
  if (self->_clearLastSharedDate) {
    xpc_dictionary_set_BOOL(v4, "clearLastSharedDate", 1);
  }
  if (self->_clearLastViewedDate) {
    xpc_dictionary_set_BOOL(v4, "clearLastViewedDate", 1);
  }
  if (self->_didSetVariationSuggestionStates)
  {
    xpc_dictionary_set_uint64(v4, "variationSuggestionStates", self->_variationSuggestionStates);
    xpc_dictionary_set_uint64(v4, "variationSuggestionStatesMask", self->_variationSuggestionStatesMask);
  }
  if (self->_toRetryUpload) {
    xpc_dictionary_set_BOOL(v4, "toRetryUpload", 1);
  }
  if (self->_didSetPackedPreferredCropRect) {
    xpc_dictionary_set_int64(v4, "packedPreferredCropRect", self->_packedPreferredCropRect);
  }
  if (self->_didSetPackedAcceptableCropRect) {
    xpc_dictionary_set_int64(v4, "packedAcceptableCropRect", self->_packedAcceptableCropRect);
  }
  if (self->_didSetPackedBestPlaybackRect) {
    xpc_dictionary_set_int64(v4, "packedBestPlaybackRect", self->_packedBestPlaybackRect);
  }
  if (self->_didModifyComputedAttributes)
  {
    if (self->_computedAttributeMutations)
    {
      PLXPCDictionarySetDictionary();
    }
    else
    {
      xpc_object_t v24 = xpc_null_create();
      xpc_dictionary_set_value(v4, "computedAttributeMutations", v24);
    }
  }
  if ([(NSDictionary *)self->_pathsToNewAssetResourcesByAssetResourceType count]) {
    PLXPCDictionarySetDictionary();
  }
  if ([(NSSet *)self->_assetResourceTypesToDelete count])
  {
    char v25 = [(NSSet *)self->_assetResourceTypesToDelete allObjects];
    PLXPCDictionarySetArray();
  }
  if ([(NSSet *)self->_libraryScopeOriginatorUUIDs count])
  {
    uint64_t v26 = [(NSSet *)self->_libraryScopeOriginatorUUIDs allObjects];
    PLXPCDictionarySetArray();
  }
  if (self->_resetWallpaperProperties)
  {
    xpc_dictionary_set_BOOL(v4, "resetWallpaperProperties", 1);
  }
  else
  {
    if (self->_didSetWallpaperPropertiesTimestamp) {
      PLXPCDictionarySetDate();
    }
    if (self->_didSetWallpaperPropertiesVersion) {
      xpc_dictionary_set_uint64(v4, "photoAnalysisWallpaperPropertiesVersion", self->_wallpaperPropertiesVersion);
    }
    if (self->_didSetWallpaperPropertiesData) {
      PLXPCDictionarySetData();
    }
  }
  if (self->_didSetMediaAnalysisTimeStamp) {
    PLXPCDictionarySetDate();
  }
  if (self->_didSetMediaAnalysisVersion) {
    xpc_dictionary_set_uint64(v4, "mediaAnalysisVersion", self->_mediaAnalysisVersion);
  }
  if (self->_didSetMediaAnalysisImageVersion) {
    xpc_dictionary_set_int64(v4, "mediaAnalysisImageVersion", self->_mediaAnalysisImageVersion);
  }
  if ((self->_bestVideoTimeRange.start.flags & 1) != 0
    && (self->_bestVideoTimeRange.duration.flags & 1) != 0
    && !self->_bestVideoTimeRange.duration.epoch
    && (self->_bestVideoTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    long long v63 = *(_OWORD *)&self->_bestVideoTimeRange.start.epoch;
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_bestVideoTimeRange.start.value;
    *(_OWORD *)&buf.start.epoch = v63;
    *(_OWORD *)&buf.duration.timescale = *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale;
    CFDictionaryRef v64 = CMTimeRangeCopyAsDictionary(&buf, 0);
    if (v64)
    {
      CFDictionaryRef v65 = v64;
      PLXPCDictionarySetDictionary();
      CFRelease(v65);
    }
  }
  if ((self->_animatedStickerTimeRange.start.flags & 1) != 0
    && (self->_animatedStickerTimeRange.duration.flags & 1) != 0
    && !self->_animatedStickerTimeRange.duration.epoch
    && (self->_animatedStickerTimeRange.duration.value & 0x8000000000000000) == 0)
  {
    long long v66 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    *(_OWORD *)&buf.start.epoch = v66;
    *(_OWORD *)&buf.duration.timescale = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    CFDictionaryRef v67 = CMTimeRangeCopyAsDictionary(&buf, 0);
    if (v67)
    {
      CFDictionaryRef v68 = v67;
      PLXPCDictionarySetDictionary();
      CFRelease(v68);
    }
  }
  if (self->_bestKeyFrameTime.flags)
  {
    *(_OWORD *)&buf.start.value = *(_OWORD *)&self->_bestKeyFrameTime.value;
    buf.start.epoch = self->_bestKeyFrameTime.epoch;
    CFDictionaryRef v27 = CMTimeCopyAsDictionary(&buf.start, 0);
    if (v27)
    {
      CFDictionaryRef v28 = v27;
      PLXPCDictionarySetDictionary();
      CFRelease(v28);
    }
  }
  xpc_dictionary_set_BOOL(v4, "unsetBestKeyFrameTime", self->_didUnsetBestKeyFrameTime);
  if (self->_bestKeyFrameJPEGData) {
    PLXPCDictionarySetData();
  }
  if (self->_computeSyncMediaAnalysisPayload) {
    PLXPCDictionarySetData();
  }
  if (self->_didSetBlurrinessScore) {
    xpc_dictionary_set_double(v4, "blurrinessScore", self->_blurrinessScore);
  }
  if (self->_didSetExposureScore) {
    xpc_dictionary_set_double(v4, "exposureScore", self->_exposureScore);
  }
  if (self->_didSetAudioScore) {
    xpc_dictionary_set_double(v4, "audioScore", self->_audioScore);
  }
  if (self->_didSetSettlingEffectScore) {
    xpc_dictionary_set_double(v4, "settlingEffectScore", self->_settlingEffectScore);
  }
  if (self->_didSetWallpaperScore) {
    xpc_dictionary_set_double(v4, "wallpaperScore", self->_wallpaperScore);
  }
  if (self->_didSetAutoplaySuggestionScore) {
    xpc_dictionary_set_double(v4, "autoplaySuggestionScore", self->_autoplaySuggestionScore);
  }
  if (self->_didSetVideoStickerSuggestionScore) {
    xpc_dictionary_set_double(v4, "videoStickerSuggestionScore", self->_videoStickerSuggestionScore);
  }
  if (self->_didSetVideoScore) {
    xpc_dictionary_set_double(v4, "videoScore", self->_videoScore);
  }
  if (self->_didSetActivityScore) {
    xpc_dictionary_set_double(v4, "activityScore", self->_activityScore);
  }
  if (self->_didSetFaceCount) {
    xpc_dictionary_set_uint64(v4, "faceCount", self->_faceCount);
  }
  if (self->_didSetAudioClassification) {
    xpc_dictionary_set_int64(v4, "audioClassification", self->_audioClassification);
  }
  if (self->_didSetProbableRotationDirection) {
    xpc_dictionary_set_int64(v4, "probableRotationDirection", self->_probableRotationDirection);
  }
  if (self->_didSetProbableRotationDirectionConfidence) {
    xpc_dictionary_set_double(v4, "probableRotationDirectionConfidence", self->_probableRotationDirectionConfidence);
  }
  if (self->_colorNormalizationData) {
    PLXPCDictionarySetData();
  }
  if (self->_resetCharacterRecognitionProperties) {
    xpc_dictionary_set_BOOL(v4, "resetCharacterRecognitionProperties", 1);
  }
  if (self->_didSetCharacterRecognitionData)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
    int v30 = [NSNumber numberWithInteger:self->_characterRecognitionAlgorithmVersion];
    uint64_t v31 = [NSString stringWithUTF8String:"characterRecognitionAlgorithmVersion"];
    [v29 setObject:v30 forKeyedSubscript:v31];

    characterRecognitionAdjustmentVersiouint64_t n = self->_characterRecognitionAdjustmentVersion;
    uint64_t v33 = [NSString stringWithUTF8String:"characterRecognitionAdjustmentVersion"];
    [v29 setObject:characterRecognitionAdjustmentVersion forKeyedSubscript:v33];

    characterRecognitionData = self->_characterRecognitionData;
    if (characterRecognitionData)
    {
      BOOL v35 = [NSString stringWithUTF8String:"characterRecognitionData"];
      [v29 setObject:characterRecognitionData forKeyedSubscript:v35];
    }
    machineReadableCodeData = self->_machineReadableCodeData;
    if (machineReadableCodeData)
    {
      int v37 = [NSString stringWithUTF8String:"machineReadableCodeData"];
      [v29 setObject:machineReadableCodeData forKeyedSubscript:v37];
    }
    PLXPCDictionarySetDictionary();
  }
  if (self->_resetVisualSearchProperties) {
    xpc_dictionary_set_BOOL(v4, "resetVisualSearchProperties", 1);
  }
  if (self->_didSetVisualSearchProperties)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    id v39 = [NSNumber numberWithInteger:self->_visualSearchAlgorithmVersion];
    uint64_t v40 = [NSString stringWithUTF8String:"visualSearchAlgorithmVersion"];
    [v38 setObject:v39 forKeyedSubscript:v40];

    visualSearchAdjustmentVersiouint64_t n = self->_visualSearchAdjustmentVersion;
    id v42 = [NSString stringWithUTF8String:"visualSearchAdjustmentVersion"];
    [v38 setObject:visualSearchAdjustmentVersion forKeyedSubscript:v42];

    uint64_t v43 = [NSNumber numberWithBool:self->_didSetStickerConfidenceScore];
    int v44 = [NSString stringWithUTF8String:"didSetStickerConfidenceScore"];
    [v38 setObject:v43 forKeyedSubscript:v44];

    *(float *)&double v45 = self->_stickerConfidenceScore;
    uint64_t v46 = [NSNumber numberWithFloat:v45];
    uint64_t v47 = [NSString stringWithUTF8String:"stickerConfidenceScore"];
    [v38 setObject:v46 forKeyedSubscript:v47];

    char v48 = [NSNumber numberWithInteger:self->_stickerConfidenceScoreAlgorithmVersion];
    uint64_t v49 = [NSString stringWithUTF8String:"stickerConfidenceScoreAlgorithmVersion"];
    [v38 setObject:v48 forKeyedSubscript:v49];

    visualSearchData = self->_visualSearchData;
    if (visualSearchData)
    {
      uint64_t v51 = [NSString stringWithUTF8String:"visualSearchData"];
      [v38 setObject:visualSearchData forKeyedSubscript:v51];
    }
    uint64_t v52 = [NSNumber numberWithBool:self->_didSetVisualSearchData];
    uint64_t v53 = [NSString stringWithUTF8String:"didSetVisualSearchData"];
    [v38 setObject:v52 forKeyedSubscript:v53];

    PLXPCDictionarySetDictionary();
  }
  if (self->_didSetSceneprintData)
  {
    if (self->_sceneprintData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      xpc_object_t v54 = xpc_null_create();
      xpc_dictionary_set_value(v4, "sceneprintData", v54);
    }
  }
  if (self->_didSetDuplicateMatchingData)
  {
    if (self->_duplicateMatchingData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      xpc_object_t v55 = xpc_null_create();
      xpc_dictionary_set_value(v4, "duplicateMatchingData", v55);
    }
    if (self->_duplicateMatchingAlternateData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      xpc_object_t v56 = xpc_null_create();
      xpc_dictionary_set_value(v4, "duplicateMatchingAlternateData", v56);
    }
    xpc_dictionary_set_BOOL(v4, "duplicateProcessingSucceeded", self->_duplicateProcessingSucceeded);
  }
  if (self->_didSetReverseLocationData)
  {
    if (self->_reverseLocationData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      xpc_object_t v57 = xpc_null_create();
      xpc_dictionary_set_value(v4, "reverseLocationData", v57);
    }
  }
  if (self->_didSetReverseLocationDataIsValid) {
    xpc_dictionary_set_BOOL(v4, "reverseLocationDataIsValid", self->_reverseLocationDataIsValid);
  }
  if (self->_didSetShiftedLocation)
  {
    shiftedLocatiouint64_t n = self->_shiftedLocation;
    if (shiftedLocation)
    {
      id v69 = 0;
      uint64_t v59 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:shiftedLocation requiringSecureCoding:1 error:&v69];
      xpc_object_t v60 = v69;
      if (v59)
      {
        PLXPCDictionarySetData();
      }
      else
      {
        CFDictionaryRef v61 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v60;
          _os_log_impl(&dword_19B043000, v61, OS_LOG_TYPE_DEFAULT, "Failed to archive shiftedLocation, error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      xpc_object_t v60 = xpc_null_create();
      xpc_dictionary_set_value(v4, "shiftedLocation", v60);
    }
  }
  if (self->_didSetObjectSaliencyRectsData)
  {
    if (self->_objectSaliencyRectsData)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      xpc_object_t v62 = xpc_null_create();
      xpc_dictionary_set_value(v4, "objectSaliencyRectsData", v62);
    }
  }
  if (self->_didSetTimeZone)
  {
    PLXPCDictionarySetString();
    xpc_dictionary_set_int64(v4, "timeZoneOffsetValue", self->_timeZoneOffsetValue);
  }
  if (self->_didSetGpsHorizontalAccuracy) {
    xpc_dictionary_set_double(v4, "gpsHorizontalAccuracy", self->_gpsHorizontalAccuracy);
  }
  if (self->_didSetScreenTimeDeviceImageSensitivity) {
    xpc_dictionary_set_int64(v4, "screenTimeDeviceImageSensitivity", self->_screenTimeDeviceImageSensitivity);
  }
  if (self->_didSetSyndicationProcessingValue) {
    xpc_dictionary_set_uint64(v4, "syndicationProcessingValue", self->_syndicationProcessingValue);
  }
  if (self->_didSetSyndicationProcessingVersion) {
    xpc_dictionary_set_uint64(v4, "syndicationProcessingVersion", self->_syndicationProcessingVersion);
  }
  if (self->_didSetSyndicationIdentifier) {
    PLXPCDictionarySetString();
  }
  if (self->_didSetFaceAnalysisVersion) {
    xpc_dictionary_set_int64(v4, "faceAnalysisVersion", self->_faceAnalysisVersion);
  }
  if (self->_didSetLocalAnalysisStage) {
    xpc_dictionary_set_int64(v4, "localAnalysisStage", self->_localAnalysisStage);
  }
  if (self->_didSetViewPresentation) {
    xpc_dictionary_set_int64(v4, "viewPresentation", self->_viewPresentation);
  }
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    xpc_dictionary_set_BOOL(v4, "ResetGeneratedAssetDescriptionKey", 1);
  }
  else if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    xpc_dictionary_set_BOOL(v4, "DidSetGeneratedAssetDescriptionKey", 1);
    PLXPCDictionarySetDictionary();
  }
  if (self->_didSetPtpTrashedState) {
    xpc_dictionary_set_int64(v4, "PtpTrashedStateKey", self->_ptpTrashedState);
  }
  if (self->_didSetSavedAssetType) {
    xpc_dictionary_set_int64(v4, "savedAssetType", self->_savedAssetType);
  }
}

- (void)revertAssetContentToOriginal
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v3 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHChangeRequest *)self uuid];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "Reverting content to original for asset %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(PHAssetChangeRequest *)self setContentEditingOutput:0];
}

- (void)retryUpload
{
  self->_BOOL toRetryUpload = 1;
}

- (void)expungeTrashedSpatialOverCaptureResources
{
  self->_BOOL didExpungeTrashedSpatialOverCaptureResources = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)expungeAllSpatialOverCaptureResources
{
  self->_BOOL didExpungeAllSpatialOverCaptureResources = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)untrashAllSpatialOverCaptureResources
{
  self->_BOOL didUntrashAllSpatialOverCaptureResources = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)trashAllSpatialOverCaptureResources
{
  self->_BOOL didTrashAllSpatialOverCaptureResources = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)resetGuestAssetPromotion
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v3 = PLSyndicationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(PHObject *)self->_originalAsset uuid];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_INFO, "reset guest asset promotion on %{public}@", (uint8_t *)&v5, 0xCu);
  }
  self->_BOOL didPromoteToGuestAsset = 0;
  self->_didResetGuestAssetPromotiouint64_t n = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)promoteToGuestAsset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v3 = PLSyndicationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(PHObject *)self->_originalAsset uuid];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_INFO, "promote to guest asset: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  self->_didResetGuestAssetPromotiouint64_t n = 0;
  self->_BOOL didPromoteToGuestAsset = 1;
  [(PHChangeRequest *)self didMutate];
}

- (id)_existentLikeObjectIDs
{
  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    long long v3 = [(PHChangeRequest *)self photoLibrary];
    id v4 = [v3 librarySpecificFetchOptions];
    originalAsset = +[PHQuery queryForLikesForAsset:originalAsset options:v4];
  }
  int v5 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:originalAsset];

  return v5;
}

- (id)_mutableLikeObjectIDsAndUUIDs
{
  likesHelper = self->_likesHelper;
  id v4 = [(PHAssetChangeRequest *)self _existentLikeObjectIDs];
  [(PHRelationshipChangeRequestHelper *)likesHelper prepareIfNeededWithExistentObjectIDs:v4];

  int v5 = self->_likesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (void)removeLike:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  uint64_t v7 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v6, v9, v10);

  if (v7)
  {
    uint64_t v8 = [(PHAssetChangeRequest *)self _mutableLikeObjectIDsAndUUIDs];
    [v8 removeObjectsInArray:v7];

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)addLike:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  uint64_t v7 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v6, v9, v10);

  if (v7)
  {
    uint64_t v8 = [(PHAssetChangeRequest *)self _mutableLikeObjectIDsAndUUIDs];
    [v8 addObjectsFromArray:v7];

    [(PHChangeRequest *)self didMutate];
  }
  [(PHChangeRequest *)self didMutate];
}

- (id)_existentCommentObjectIDs
{
  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    long long v3 = [(PHChangeRequest *)self photoLibrary];
    id v4 = [v3 librarySpecificFetchOptions];
    originalAsset = +[PHQuery queryForCommentsForAsset:originalAsset options:v4];
  }
  id v5 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:originalAsset];

  return v5;
}

- (id)_mutableCommentObjectIDsAndUUIDs
{
  commentsHelper = self->_commentsHelper;
  id v4 = [(PHAssetChangeRequest *)self _existentCommentObjectIDs];
  [(PHRelationshipChangeRequestHelper *)commentsHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_commentsHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (void)removeComments:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    id v4 = [(PHAssetChangeRequest *)self _mutableCommentObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)addComments:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    id v4 = [(PHAssetChangeRequest *)self _mutableCommentObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];

    [(PHChangeRequest *)self didMutate];
  }
  [(PHChangeRequest *)self didMutate];
}

- (BOOL)deleteAssetResourceWithType:(int64_t)a3
{
  if (a3 != 20 && a3 != 114 && a3 != 109) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(NSSet *)self->_assetResourceTypesToDelete count]) {
    [v5 unionSet:self->_assetResourceTypesToDelete];
  }
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 addObject:v6];

  objc_storeStrong((id *)&self->_assetResourceTypesToDelete, v5);
  [(PHChangeRequest *)self didMutate];
  pathsToNewAssetResourcesByAssetResourceType = self->_pathsToNewAssetResourcesByAssetResourceType;
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  id v9 = [(NSDictionary *)pathsToNewAssetResourcesByAssetResourceType objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = (NSDictionary *)[(NSDictionary *)self->_pathsToNewAssetResourcesByAssetResourceType mutableCopy];
    char v11 = [NSNumber numberWithInteger:a3];
    [(NSDictionary *)v10 setObject:0 forKeyedSubscript:v11];

    uint64_t v12 = self->_pathsToNewAssetResourcesByAssetResourceType;
    self->_pathsToNewAssetResourcesByAssetResourceType = v10;
  }
  return 1;
}

- (BOOL)addAssetResourceWithType:(int64_t)a3 fromFileAtURL:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 20 || a3 == 114 || a3 == 109)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];

    id v9 = [(PHChangeRequest *)self photoLibrary];
    uint64_t v10 = [v9 pathManager];
    id v33 = 0;
    char v11 = [v10 externalDirectoryWithSubType:3 createIfNeeded:1 error:&v33];
    id v12 = v33;

    if (v11)
    {
      unint64_t v13 = NSString;
      id v14 = [NSNumber numberWithInteger:a3];
      NSUInteger v15 = [v13 stringWithFormat:@"ResourceType-%@-%@", v14, v8];
      uint64_t v16 = [v11 stringByAppendingPathComponent:v15];

      uint64_t v17 = (void *)MEMORY[0x1E4F8B908];
      CFDictionaryRef v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
      id v32 = 0;
      int v19 = [v17 copyItemAtURL:v6 toURL:v18 error:&v32];
      id v20 = v32;

      if (v19)
      {
        id v30 = v20;
        uint64_t v31 = v8;
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v22 = v21;
        if (self->_pathsToNewAssetResourcesByAssetResourceType) {
          objc_msgSend(v21, "addEntriesFromDictionary:");
        }
        double v23 = [NSNumber numberWithInteger:a3];
        [v22 setObject:v16 forKeyedSubscript:v23];

        objc_storeStrong((id *)&self->_pathsToNewAssetResourcesByAssetResourceType, v22);
        [(PHChangeRequest *)self didMutate];
        assetResourceTypesToDelete = self->_assetResourceTypesToDelete;
        char v25 = [NSNumber numberWithInteger:a3];
        LODWORD(assetResourceTypesToDelete) = [(NSSet *)assetResourceTypesToDelete containsObject:v25];

        if (assetResourceTypesToDelete)
        {
          uint64_t v26 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_assetResourceTypesToDelete];
          CFDictionaryRef v27 = [NSNumber numberWithInteger:a3];
          [(NSSet *)v26 removeObject:v27];

          CFDictionaryRef v28 = self->_assetResourceTypesToDelete;
          self->_assetResourceTypesToDelete = v26;
        }
        uint64_t v8 = v31;
        id v20 = v30;
      }
    }
    else
    {
      char v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTimeRange buf = 138412290;
        id v35 = v12;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Unable to get external add resources directory; %@",
          buf,
          0xCu);
      }
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (void)updateExtendedAttributesUsingOriginalMediaMetadata
{
  if (PLPlatformExtendedAttributesSupported())
  {
    self->_BOOL didUpdateExtendedAttributesUsingOriginalMediaMetadata = 1;
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)revertLocationToOriginal
{
  if (PLPlatformExtendedAttributesSupported())
  {
    self->_BOOL didRevertLocationToOriginal = 1;
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)setOriginalResourceChoice:(unint64_t)a3
{
  self->_unint64_t originalResourceChoice = a3;
  self->_BOOL didSetOriginalResourceChoice = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)setContentEditingOutput:(PHContentEditingOutput *)contentEditingOutput
{
  uint64_t v16 = contentEditingOutput;
  id v6 = [(PHAssetChangeRequest *)self supportedEditOperations];
  char v7 = [v6 containsIndex:2];

  if (v7)
  {
    [(PHChangeRequest *)self didMutate];
    [(PHAssetChangeRequest *)self markDidChangeAdjustments];
    objc_storeStrong((id *)&self->_contentEditingOutput, contentEditingOutput);
    uint64_t v8 = [(PHContentEditingOutput *)v16 editorBundleURL];
    editorBundleURL = self->_editorBundleURL;
    self->_editorBundleURL = v8;
  }
  else if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = NSString;
    unint64_t v13 = NSStringFromSelector(a2);
    id v14 = [v12 stringWithFormat:@"%@ cannot be used on a non-editable asset", v13];
    id v15 = [v10 exceptionWithName:v11 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
}

- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10 optionalOriginalResourceChoice:(id)a11
{
  double height = a8.height;
  double width = a8.width;
  BOOL v37 = a7;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v39 = a9;
  id v38 = a10;
  id v22 = a11;
  originalAsset = self->_originalAsset;
  id v24 = v21;
  id v25 = v19;
  if (originalAsset) {
    uint64_t v26 = [(PHAsset *)originalAsset mediaType];
  }
  else {
    uint64_t v26 = 1;
  }
  CFDictionaryRef v27 = [PHContentEditingOutput alloc];
  CFDictionaryRef v28 = [(PHChangeRequest *)self photoLibrary];
  uint64_t v29 = [v28 photoLibraryURL];
  id v30 = [(PHContentEditingOutput *)v27 initWithAdjustmentBaseVersion:0 mediaType:v26 appropriateForURL:v29];

  -[PHContentEditingOutput setBaseVersion:](v30, "setBaseVersion:", [v18 baseVersion]);
  [(PHContentEditingOutput *)v30 setAdjustmentData:v18];
  uint64_t v31 = v20;
  if (v20)
  {
    [(PHContentEditingOutput *)v30 setRenderedContentURL:v20];
    id v32 = v25;
    id v33 = v24;
LABEL_8:
    uint64_t v34 = v38;
    id v35 = v39;
    goto LABEL_9;
  }
  id v32 = v25;
  id v33 = v24;
  if (v25)
  {
    [(PHContentEditingOutput *)v30 setRenderedJPEGData:v25];
    goto LABEL_8;
  }
  uint64_t v36 = PLPhotoKitGetLog();
  uint64_t v34 = v38;
  id v35 = v39;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CMTimeRange buf = 138412290;
    id v41 = v18;
    _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "No rendered content provided for %@", buf, 0xCu);
  }

LABEL_9:
  [(PHContentEditingOutput *)v30 setPenultimateRenderedJPEGData:v33];
  [(PHContentEditingOutput *)v30 setIsSubstandardRender:v37];
  [(PHContentEditingOutput *)v30 setFullSizeRenderWidth:(uint64_t)width];
  [(PHContentEditingOutput *)v30 setFullSizeRenderHeight:(uint64_t)height];
  [(PHContentEditingOutput *)v30 setRenderedVideoComplementContentURL:v35];
  [(PHContentEditingOutput *)v30 setPenultimateRenderedVideoComplementContentURL:v34];
  if (v22) {
    [(PHContentEditingOutput *)v30 setOriginalResourceChoice:v22];
  }
  [(PHAssetChangeRequest *)self setContentEditingOutput:v30];
}

- (void)setAdjustmentData:(id)a3 withRenderedJPEGData:(id)a4 orRenderedContentURL:(id)a5 penultimateRenderedJPEGData:(id)a6 isSubstandardRender:(BOOL)a7 fullSizeRenderSize:(CGSize)a8 renderedVideoComplementURL:(id)a9 penultimateRenderedVideoComplementURL:(id)a10
{
}

- (void)_prepareExistingIDsForTemporalFacesIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  long long v3 = [(PHRelationshipChangeRequestHelper *)self->_temporalFacesHelper originalObjectIDs];

  if (!v3)
  {
    if (self->_originalAsset)
    {
      id v4 = [(PHChangeRequest *)self photoLibrary];
      id v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v4 orObject:0];

      [v5 setIncludeMediaAnalysisProcessingRangeTypes:2];
      id v6 = +[PHQuery queryForFacesInAsset:self->_originalAsset options:v5];
      char v7 = [v6 executeQuery];
      temporalFacesHelper = self->_temporalFacesHelper;
      id v9 = [v7 fetchedObjectIDs];
      [(PHRelationshipChangeRequestHelper *)temporalFacesHelper setOriginalObjectIDs:v9];
    }
    uint64_t v10 = [(PHRelationshipChangeRequestHelper *)self->_temporalFacesHelper originalObjectIDs];

    if (!v10)
    {
      uint64_t v11 = self->_temporalFacesHelper;
      uint64_t v12 = MEMORY[0x1E4F1CBF0];
      [(PHRelationshipChangeRequestHelper *)v11 setOriginalObjectIDs:v12];
    }
  }
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  [(PHAssetChangeRequest *)self _prepareFaceIDsIfNeeded];
  facesHelper = self->_facesHelper;

  return [(PHRelationshipChangeRequestHelper *)facesHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareFaceIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  long long v3 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

  if (!v3)
  {
    originalAsset = self->_originalAsset;
    if (originalAsset)
    {
      id v5 = +[PHQuery queryForFacesInAsset:originalAsset options:0];
      id v6 = [v5 executeQuery];
      [(PHAssetChangeRequest *)self _prepareFacesHelperWithFetchResult:v6];
    }
    char v7 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

    if (!v7) {
      [(PHRelationshipChangeRequestHelper *)self->_facesHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
  }
  uint64_t v8 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper mutableObjectIDsAndUUIDs];

  if (!v8)
  {
    facesHelper = self->_facesHelper;
    id v11 = [(PHRelationshipChangeRequestHelper *)facesHelper originalObjectIDs];
    uint64_t v10 = (void *)[v11 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)facesHelper setMutableObjectIDsAndUUIDs:v10];
  }
}

- (void)_prepareFacesHelperWithFetchResult:(id)a3
{
  id v7 = a3;
  +[PHPhotoLibrary assertTransaction];
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

  if (!v4)
  {
    facesHelper = self->_facesHelper;
    id v6 = [v7 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)facesHelper setOriginalObjectIDs:v6];
  }
}

- (id)_existentKeywordObjectIDs
{
  originalAsset = self->_originalAsset;
  if (originalAsset)
  {
    long long v3 = [(PHChangeRequest *)self photoLibrary];
    id v4 = [v3 librarySpecificFetchOptions];
    originalAsset = +[PHQuery queryForKeywordsForAsset:originalAsset options:v4];
  }
  id v5 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:originalAsset];

  return v5;
}

- (id)_mutableKeywordObjectIDsAndUUIDs
{
  keywordsHelper = self->_keywordsHelper;
  id v4 = [(PHAssetChangeRequest *)self _existentKeywordObjectIDs];
  [(PHRelationshipChangeRequestHelper *)keywordsHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_keywordsHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (void)removeKeywords:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHAssetChangeRequest *)self _mutableKeywordObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)addKeywords:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHAssetChangeRequest *)self _mutableKeywordObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)_setOriginalAsset:(id)a3
{
}

- (void)setKeywordTitles:(id)a3
{
  id v4 = a3;
  [(PHChangeRequest *)self didMutate];
  self->_BOOL didSetKeywordTitles = 1;
  id v5 = (NSSet *)[v4 copy];

  keywordTitles = self->_keywordTitles;
  self->_keywordTitles = v5;
}

- (void)setVariationSuggestionStates:(unint64_t)a3 forVariationType:(unint64_t)a4
{
  char v5 = a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetVariationSuggestionStates = 1;
  char v7 = 6 * a4 - 6;
  unint64_t v8 = (unint64_t)(v5 & 0x3F) << v7;
  if (!a4) {
    unint64_t v8 = 0;
  }
  uint64_t v9 = 63 << v7;
  if (!a4) {
    uint64_t v9 = 0;
  }
  self->_variationSuggestionStates |= v8;
  self->_variationSuggestionStatesMask |= v9;
}

- (void)clearLastViewedDate
{
  self->_BOOL clearLastViewedDate = 1;
}

- (void)clearLastSharedDate
{
  self->_BOOL clearLastSharedDate = 1;
}

- (void)incrementViewCount
{
  self->_BOOL incrementViewCount = 1;
}

- (void)incrementShareCount
{
  [(PHChangeRequest *)self didMutate];
  long long v3 = [MEMORY[0x1E4F1C9C8] date];
  lastSharedDate = self->_lastSharedDate;
  self->_lastSharedDate = v3;

  self->_BOOL incrementShareCount = 1;
}

- (void)incrementPlayCount
{
  self->_BOOL incrementPlayCount = 1;
}

- (void)setFaceAdjustmentVersion:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  char v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  char v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"faceAdjustmentVersion"];

    unint64_t v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"faceAdjustmentVersion"];
  }
  else
  {
    [v6 removeObjectForKey:@"faceAdjustmentVersion"];

    unint64_t v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"faceAdjustmentVersion"];
  }
}

- (id)faceAdjustmentVersion
{
  +[PHPhotoLibrary assertTransaction];
  long long v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  char v5 = [v4 objectForKey:@"faceAdjustmentVersion"];

  return v5;
}

- (void)setTemporalFaces:(id)a3
{
  id v4 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  uint64_t v5 = [v4 mutableCopy];

  if (v5) {
    id v6 = (void *)v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v6;
  [(PHChangeRequest *)self didMutate];
  [(PHAssetChangeRequest *)self _prepareExistingIDsForTemporalFacesIfNeeded];
  temporalFacesHelper = self->_temporalFacesHelper;
  unint64_t v8 = (void *)[v9 mutableCopy];
  [(PHRelationshipChangeRequestHelper *)temporalFacesHelper setMutableObjectIDsAndUUIDs:v8];
}

- (void)removeFaces:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHAssetChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)addFaces:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHAssetChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)_setSavedAssetType:(signed __int16)a3
{
  self->_didSetSavedAssetType = 1;
  self->_uint64_t savedAssetType = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)resetGeneratedAssetDescriptions
{
  [(PHChangeRequest *)self didMutate];
  if (self->_didSetGeneratedAssetDescriptionProperties)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:1412 description:@"Attempting to set and reset generated asset description in same change request."];
  }
  self->_resetGeneratedAssetDescriptionProperties = 1;
}

- (void)setGeneratedAssetDescription:(id)a3 analysisVersion:(int64_t)a4 sourceType:(int64_t)a5
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 1396, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];
  }
  if (a4 <= 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 1397, @"Invalid parameter not satisfying: %@", @"version > 0" object file lineNumber description];
  }
  if ((unint64_t)a5 >= 3)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 1398, @"Invalid parameter not satisfying: %@", @"sourceType >= 0 && sourceType <= PHGeneratedAssetDescriptionSourceTypeMovie" object file lineNumber description];
  }
  if (self->_resetGeneratedAssetDescriptionProperties)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:1399 description:@"Attempting to set and reset generated asset description in same change request."];
  }
  [(PHChangeRequest *)self didMutate];
  if (!self->_generatedAssetDescriptionDictionaries)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    generatedAssetDescriptionDictionaries = self->_generatedAssetDescriptionDictionaries;
    self->_generatedAssetDescriptionDictionaries = v10;
  }
  v20[0] = @"descriptionText";
  v20[1] = @"analysisVersion";
  v21[0] = v9;
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  v21[1] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v14 = self->_generatedAssetDescriptionDictionaries;
  id v15 = [NSNumber numberWithInteger:a5];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  self->_didSetGeneratedAssetDescriptionProperties = 1;
}

- (void)setAlternateImportImageDate:(id)a3
{
  id v4 = (NSDate *)a3;
  [(PHChangeRequest *)self didMutate];
  alternateImportImageDate = self->_alternateImportImageDate;
  self->_alternateImportImageDate = v4;
}

- (void)_validateObjectSaliencyRects:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        MEMORY[0x19F388450](*(void *)(*((void *)&v15 + 1) + 8 * i));
        if ((PLCGRectIsNormalized() & 1) == 0)
        {
          id v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3C8];
          id v11 = NSString;
          uint64_t v12 = NSStringFromSelector(a2);
          unint64_t v13 = [v11 stringWithFormat:@"Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull", v12];
          id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

          objc_exception_throw(v14);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)setObjectSaliencyRects:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetObjectSaliencyRectsData = 1;
  if ((unint64_t)[v6 count] <= 3 && objc_msgSend(v6, "count"))
  {
    [(PHAssetChangeRequest *)self _validateObjectSaliencyRects:v6];
    objc_storeStrong((id *)&self->_objectSaliencyRects, a3);
    id v17 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
    id v8 = v17;
    objectSaliencyRectsData = self->_objectSaliencyRectsData;
    self->_objectSaliencyRectsData = v7;

    if (!self->_objectSaliencyRectsData)
    {
      uint64_t v10 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTimeRange buf = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Failed to archive objectSaliencyRects, error: %@", buf, 0xCu);
      }
    }
  }
  else if ((unint64_t)[v6 count] >= 4)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    unint64_t v13 = NSString;
    id v14 = NSStringFromSelector(a2);
    long long v15 = [v13 stringWithFormat:@"Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull", v14];
    id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
}

- (void)setShiftedLocation:(id)a3
{
  id v4 = (CLLocation *)a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetShiftedLocatiouint64_t n = 1;
  shiftedLocatiouint64_t n = self->_shiftedLocation;
  self->_shiftedLocatiouint64_t n = v4;
}

- (void)setReverseLocationDataIsValid:(BOOL)a3
{
  self->_didSetReverseLocationDataIsValid = 1;
  self->_BOOL reverseLocationDataIsValid = a3;
}

- (void)setReverseLocationData:(id)a3
{
  id v4 = (NSData *)a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetReverseLocationData = 1;
  reverseLocationData = self->_reverseLocationData;
  self->_reverseLocationData = v4;
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5
{
  id v8 = (NSData *)a3;
  id v9 = (NSData *)a4;
  [(PHChangeRequest *)self didMutate];
  self->_didSetDuplicateMatchingData = 1;
  duplicateMatchingData = self->_duplicateMatchingData;
  self->_duplicateMatchingData = v8;
  id v11 = v8;

  duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
  self->_duplicateMatchingAlternateData = v9;

  self->_BOOL duplicateProcessingSucceeded = a5;
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4
{
}

- (void)setSceneprintData:(id)a3
{
  id v4 = (NSData *)a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetSceneprintData = 1;
  sceneprintData = self->_sceneprintData;
  self->_sceneprintData = v4;
}

- (void)setRectWithNormalizedRect:(CGRect)a3 forPackedRect:(int64_t *)a4 forSetFlag:(BOOL *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (!PLCGRectIsNormalized())
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    long long v15 = NSString;
    id v16 = NSStringFromSelector(a2);
    id v17 = [v15 stringWithFormat:@"Invalid CGRect passed to %@, rect must be non-zero normalized or CGRectNull", v16];
    id v18 = [v13 exceptionWithName:v14 reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
  *a4 = MEMORY[0x19F388EB0](x, y, width, height);
  *a5 = 1;

  [(PHChangeRequest *)self didMutate];
}

- (void)setAcceptableCropRectWithNormalizedRect:(CGRect)a3
{
  int64_t v5 = 0;
  BOOL v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_int64_t packedAcceptableCropRect = v5;
  self->_didSetPackedAcceptableCropRect = v4;
}

- (void)setPreferredCropRectWithNormalizedRect:(CGRect)a3
{
  int64_t v5 = 0;
  BOOL v4 = 0;
  -[PHAssetChangeRequest setRectWithNormalizedRect:forPackedRect:forSetFlag:](self, "setRectWithNormalizedRect:forPackedRect:forSetFlag:", &v5, &v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_int64_t packedPreferredCropRect = v5;
  self->_didSetPackedPreferredCropRect = v4;
}

- (void)setPhotoIrisVisibilityState:(unsigned __int16)a3
{
  self->_uint64_t photoIrisVisibilityState = a3;
  self->_BOOL didSetVisibilityState = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_videoEmbeddingVersiouint64_t n = a3;
  self->_didSetVideoEmbeddingVersiouint64_t n = 1;
  [(PHChangeRequest *)self didMutate];
  int64_t v5 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(PHChangeRequest *)self uuid];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Set video embedding version - uuid: %@, version: %d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_imageEmbeddingVersiouint64_t n = a3;
  self->_didSetImageEmbeddingVersiouint64_t n = 1;
  [(PHChangeRequest *)self didMutate];
  int64_t v5 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(PHChangeRequest *)self uuid];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Set image embedding version - uuid: %@, version: %d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)setSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6
{
  unsigned int v21 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  unint64_t v13 = [(NSMutableDictionary *)sceneClassificationDictionariesByType objectForKeyedSubscript:v12];
  uint64_t v14 = [NSString stringWithUTF8String:"sceneAnalysisLocationVersion"];
  long long v15 = [v13 objectForKeyedSubscript:v14];

  if (v15)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:1264 description:@"Attempting to set normal and location analysis scene classifications in same change request."];
  }
  -[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:](self, "_setSceneClassifications:ofType:timestamp:", v9, a4, v10, a2);
  id v16 = [NSString stringWithUTF8String:"sceneAnalysisVersion"];
  [(PHAssetChangeRequest *)self _addVersion:v21 withKey:v16 andType:a4 toDictionary:self->_sceneClassificationDictionariesByType];

  [(PHChangeRequest *)self didMutate];
  self->_BOOL didSetSceneClassifications = 1;
  id v17 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [(PHChangeRequest *)self uuid];
    *(_DWORD *)CMTimeRange buf = 138412546;
    double v23 = v18;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);
  }
}

- (void)setLocationBasedSceneClassifications:(id)a3 ofType:(int64_t)a4 version:(signed __int16)a5 timestamp:(id)a6
{
  unsigned int v21 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  unint64_t v13 = [(NSMutableDictionary *)sceneClassificationDictionariesByType objectForKeyedSubscript:v12];
  uint64_t v14 = [NSString stringWithUTF8String:"sceneAnalysisVersion"];
  long long v15 = [v13 objectForKeyedSubscript:v14];

  if (v15)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PHAssetChangeRequest.m" lineNumber:1255 description:@"Attempting to set normal and location analysis scene classifications in same change request."];
  }
  -[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:](self, "_setSceneClassifications:ofType:timestamp:", v9, a4, v10, a2);
  id v16 = [NSString stringWithUTF8String:"sceneAnalysisLocationVersion"];
  [(PHAssetChangeRequest *)self _addVersion:v21 withKey:v16 andType:a4 toDictionary:self->_sceneClassificationDictionariesByType];

  [(PHChangeRequest *)self didMutate];
  self->_BOOL didSetSceneClassifications = 1;
  id v17 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [(PHChangeRequest *)self uuid];
    *(_DWORD *)CMTimeRange buf = 138412546;
    double v23 = v18;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);
  }
}

- (void)_addVersion:(signed __int16)a3 withKey:(id)a4 andType:(int64_t)a5 toDictionary:(id)a6
{
  uint64_t v8 = a3;
  id v9 = NSNumber;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [v9 numberWithInteger:a5];
  unint64_t v13 = [v10 objectForKeyedSubscript:v12];
  id v16 = (id)[v13 mutableCopy];

  uint64_t v14 = [NSNumber numberWithShort:v8];
  [v16 setObject:v14 forKeyedSubscript:v11];

  long long v15 = [NSNumber numberWithInteger:a5];
  [v10 setObject:v16 forKeyedSubscript:v15];
}

- (void)_setSceneClassifications:(id)a3 ofType:(int64_t)a4 timestamp:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"adjustmentVersion must be a valid NSDate on iOS" userInfo:0];
      objc_exception_throw(v32);
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v15 classificationType] != a4)
        {
          CFDictionaryRef v28 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v29 = *MEMORY[0x1E4F1C3B8];
          id v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Classification type (%ld) does not match expected type (%ld). PHSceneClassification.type should equal expected type in 'ofType' parameter.", "-[PHAssetChangeRequest _setSceneClassifications:ofType:timestamp:]", objc_msgSend(v15, "classificationType"), a4);
          id v31 = [v28 exceptionWithName:v29 reason:v30 userInfo:0];

          objc_exception_throw(v31);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  if (!self->_sceneClassificationDictionariesByType)
  {
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneClassificationDictionariesByType = self->_sceneClassificationDictionariesByType;
    self->_sceneClassificationDictionariesByType = v16;
  }
  id v33 = [NSString stringWithUTF8String:"sceneClassifications"];
  v42[0] = v33;
  uint64_t v18 = [v10 count];
  id v19 = self;
  if (v18)
  {
    uint64_t v20 = [v10 valueForKey:@"dictionaryRepresentation"];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v43[0] = v20;
  unsigned int v21 = [NSString stringWithUTF8String:"sceneAnalysisTimestamp"];
  v42[1] = v21;
  id v22 = v9;
  if (!v9)
  {
    id v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[1] = v22;
  double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  __int16 v24 = v19->_sceneClassificationDictionariesByType;
  id v25 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v25];

  if (!v9) {
  if (v18)
  }

  v19->_BOOL didSetSceneClassifications = 1;
  uint64_t v26 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    CFDictionaryRef v27 = [(PHChangeRequest *)v19 uuid];
    *(_DWORD *)CMTimeRange buf = 138412546;
    id v39 = v27;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "Set scene classifications - uuid: %@, adjustment timestamp: %@", buf, 0x16u);
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(PHChangeRequest *)self didMutate];
  self->_BOOL didSetTitle = 1;
  int64_t v5 = (NSString *)[v4 copy];

  title = self->_title;
  self->_title = v5;
}

- (void)setAccessibilityDescription:(id)a3
{
  id v4 = (__CFString *)a3;
  [(PHChangeRequest *)self didMutate];
  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = &stru_1EEAC1950;
  }
  id v6 = (NSString *)[(__CFString *)v5 copy];

  accessibilityDescriptiouint64_t n = self->_accessibilityDescription;
  self->_accessibilityDescriptiouint64_t n = v6;
}

- (void)setAssetDescription:(id)a3
{
  id v4 = (__CFString *)a3;
  [(PHChangeRequest *)self didMutate];
  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = &stru_1EEAC1950;
  }
  id v6 = (NSString *)[(__CFString *)v5 copy];

  assetDescriptiouint64_t n = self->_assetDescription;
  self->_assetDescriptiouint64_t n = v6;
}

- (void)setInteractionScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"interactionScore"];
}

- (float)interactionScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"interactionScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setBehavioralScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"behavioralScore"];
}

- (float)behavioralScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"behavioralScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setLowLight:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"lowLight"];
}

- (float)lowLight
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"lowLight"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantCameraTiltScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantCameraTiltScore"];
}

- (float)pleasantCameraTiltScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantCameraTiltScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setIntrusiveObjectPresenceScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"intrusiveObjectPresenceScore"];
}

- (float)intrusiveObjectPresenceScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"intrusiveObjectPresenceScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setInterestingSubjectScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"interestingSubjectScore"];
}

- (float)interestingSubjectScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"interestingSubjectScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantCompositionScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantCompositionScore"];
}

- (float)pleasantCompositionScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantCompositionScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setFailureScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"failureScore"];
}

- (float)failureScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"failureScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setNoiseScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"noiseScore"];
}

- (float)noiseScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"noiseScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantPostProcessingScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantPostProcessingScore"];
}

- (float)pleasantPostProcessingScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantPostProcessingScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantPerspectiveScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantPerspectiveScore"];
}

- (float)pleasantPerspectiveScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantPerspectiveScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setImmersivenessScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"immersivenessScore"];
}

- (float)immersivenessScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"immersivenessScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantPatternScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantPatternScore"];
}

- (float)pleasantPatternScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantPatternScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantSymmetryScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantSymmetryScore"];
}

- (float)pleasantSymmetryScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantSymmetryScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setLivelyColorScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"livelyColorScore"];
}

- (float)livelyColorScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"livelyColorScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setHarmoniousColorScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"harmoniousColorScore"];
}

- (float)harmoniousColorScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"harmoniousColorScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantReflectionsScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantReflectionsScore"];
}

- (float)pleasantReflectionsScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantReflectionsScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPleasantLightingScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"pleasantLightingScore"];
}

- (float)pleasantLightingScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"pleasantLightingScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setWellTimedShotScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"wellTimedShotScore"];
}

- (float)wellTimedShotScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"wellTimedShotScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setSharplyFocusedSubjectScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"sharplyFocusedSubjectScore"];
}

- (float)sharplyFocusedSubjectScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"sharplyFocusedSubjectScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setTastefullyBlurredScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"tastefullyBlurredScore"];
}

- (float)tastefullyBlurredScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"tastefullyBlurredScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setWellChosenSubjectScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"wellChosenSubjectScore"];
}

- (float)wellChosenSubjectScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"wellChosenSubjectScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setWellFramedSubjectScore:(float)a3
{
  [(PHChangeRequest *)self didMutate];
  self->_didModifyComputedAttributes = 1;
  if (!self->_computedAttributeMutations)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    computedAttributeMutations = self->_computedAttributeMutations;
    self->_computedAttributeMutations = v6;
  }
  *(float *)&double v5 = a3;
  id v8 = [NSNumber numberWithFloat:v5];
  [(NSMutableDictionary *)self->_computedAttributeMutations setObject:v8 forKeyedSubscript:@"wellFramedSubjectScore"];
}

- (float)wellFramedSubjectScore
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = [(NSMutableDictionary *)self->_computedAttributeMutations objectForKey:@"wellFramedSubjectScore"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)setPtpTrashedState:(int64_t)a3
{
  self->_int64_t ptpTrashedState = a3;
  self->_didSetPtpTrashedState = 1;
}

- (int64_t)ptpTrashedState
{
  return self->_ptpTrashedState;
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  title = self->_title;

  return title;
}

- (NSString)accessibilityDescription
{
  +[PHPhotoLibrary assertTransaction];
  accessibilityDescriptiouint64_t n = self->_accessibilityDescription;

  return accessibilityDescription;
}

- (NSString)assetDescription
{
  +[PHPhotoLibrary assertTransaction];
  assetDescriptiouint64_t n = self->_assetDescription;

  return assetDescription;
}

- (void)setGpsHorizontalAccuracy:(double)a3
{
  self->_double gpsHorizontalAccuracy = a3;
  self->_didSetGpsHorizontalAccuracdouble y = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)setLocation:(CLLocation *)location
{
  obuint64_t j = location;
  [(PHChangeRequest *)self didMutate];
  float v4 = obj;
  if (!obj)
  {
    float v4 = [MEMORY[0x1E4F1CA98] null];
  }
  objc_storeStrong((id *)&self->_updatedLocation, v4);
  float v5 = obj;
  if (!obj)
  {

    float v5 = 0;
  }
}

- (CLLocation)location
{
  +[PHPhotoLibrary assertTransaction];
  int v3 = self->_updatedLocation;
  float v4 = [MEMORY[0x1E4F1CA98] null];
  int v5 = [(CLLocation *)v3 isEqual:v4];

  if (v5)
  {

    int v3 = 0;
  }

  return v3;
}

- (void)setGenerativeMemoryCreationEligibilityState:(signed __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  id v6 = [(PHChangeRequest *)self helper];
  int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"generativeMemoryCreationEligibilityState"];
}

- (signed)generativeMemoryCreationEligibilityState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"generativeMemoryCreationEligibilityState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setIconicScore:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  id v6 = [(PHChangeRequest *)self helper];
  int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"iconicScore"];
}

- (double)iconicScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"iconicScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setOverallAestheticScore:(float)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  *(float *)&double v6 = a3;
  id v9 = [NSNumber numberWithFloat:v6];
  double v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];
  [v8 setObject:v9 forKeyedSubscript:@"overallAestheticScore"];
}

- (float)overallAestheticScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"overallAestheticScore"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (void)setHighlightPromotionScore:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  float v6 = [(PHChangeRequest *)self helper];
  float v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"highlightPromotionScore"];
}

- (double)highlightPromotionScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"highlightPromotionScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setHighlightVisibilityScore:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"highlightVisibilityScore"];
}

- (double)highlightVisibilityScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"highlightVisibilityScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setCurationScore:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"curationScore"];
}

- (double)curationScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"curationScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setHidden:(BOOL)hidden
{
  BOOL v3 = hidden;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hidden"];
}

- (BOOL)isHidden
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hidden"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setFavorite:(BOOL)favorite
{
  BOOL v3 = favorite;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"favorite"];
}

- (BOOL)isFavorite
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"favorite"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setAddedDate:(id)a3
{
  id v10 = a3;
  float v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  int v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"addedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"addedDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"addedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"addedDate"];
  }
}

- (NSDate)addedDate
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"addedDate"];

  return (NSDate *)v5;
}

- (void)setModificationDate:(id)a3
{
  id v10 = a3;
  float v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  int v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"modificationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"modificationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"modificationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"modificationDate"];
  }
}

- (NSDate)modificationDate
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"modificationDate"];

  return (NSDate *)v5;
}

- (void)setCreationDate:(NSDate *)creationDate
{
  id v10 = creationDate;
  float v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  int v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"dateCreated"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"dateCreated"];
  }
  else
  {
    [v6 removeObjectForKey:@"dateCreated"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"dateCreated"];
  }
}

- (NSDate)creationDate
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  float v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"dateCreated"];

  return (NSDate *)v5;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 type] && objc_msgSend(v5, "type") != 1)
  {
    if (a4)
    {
      double v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"Change must be performed within the sharedPhotoLibrary or sharedMomentSharePhotoLibrary";
      double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (PHObjectPlaceholder)placeholderForCreatedAsset
{
  return 0;
}

- (PHAssetChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v259 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:self request:v9 clientAuthorization:v10];
  if (!v11
    || (self = [(PHAssetChangeRequest *)self initWithHelper:v11],
        self,
        !self))
  {

    id v22 = 0;
    goto LABEL_216;
  }
  v249 = v11;
  uint64_t v12 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"detectedFaces" xpcDict:v8 changeRequestHelper:self->super._helper];
  facesHelper = self->_facesHelper;
  self->_facesHelper = v12;

  uint64_t v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"temporalDetectedFaces" xpcDict:v8 changeRequestHelper:self->super._helper];
  temporalFacesHelper = self->_temporalFacesHelper;
  self->_temporalFacesHelper = v14;

  id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keywords" xpcDict:v8 changeRequestHelper:self->super._helper];
  keywordsHelper = self->_keywordsHelper;
  self->_keywordsHelper = v16;

  uint64_t v18 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"cloudComments" xpcDict:v8 changeRequestHelper:self->super._helper];
  commentsHelper = self->_commentsHelper;
  self->_commentsHelper = v18;

  uint64_t v20 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"likeComments" xpcDict:v8 changeRequestHelper:self->super._helper];
  likesHelper = self->_likesHelper;
  self->_likesHelper = v20;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PHAssetChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
  aBlock[3] = &unk_1E5848DF0;
  id v22 = self;
  uint64_t v256 = v22;
  id v250 = v9;
  id v257 = v9;
  double v23 = (void (**)(void))_Block_copy(aBlock);
  v22->_clientProcessIdentifier = [v10 clientProcessIdentifier];
  char v251 = [v10 photoKitEntitled];
  if (xpc_dictionary_get_BOOL(v8, "didChangeAdjustments"))
  {
    [(PHAssetChangeRequest *)v22 markDidChangeAdjustments];
    __int16 v24 = PLDataFromXPCDictionary();
    if (v24)
    {
      id v254 = 0;
      id v25 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:&v254];
      id v26 = v254;
      if (!v25)
      {
        CFDictionaryRef v27 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v26;
          _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEFAULT, "Failed to unarchive contentEditingOutputData, error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      id v25 = 0;
    }
    [(PHAssetChangeRequest *)v22 setContentEditingOutput:v25];
    if (v251)
    {
      uint64_t v28 = PLURLFromXPCDictionary();
      editorBundleURL = v22->_editorBundleURL;
      v22->_editorBundleURL = (NSURL *)v28;

      if (v22->_editorBundleURL)
      {
        id v30 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:");
        uint64_t v31 = [v30 bundleIdentifier];
        editorBundleID = v22->_editorBundleID;
        v22->_editorBundleID = (NSString *)v31;
      }
      if (!v22->_editorBundleID)
      {
        uint64_t v33 = PLStringFromXPCDictionary();
        long long v34 = v22->_editorBundleID;
        v22->_editorBundleID = (NSString *)v33;
      }
    }
    if (!v22->_editorBundleID)
    {
      uint64_t v35 = [v10 trustedCallerBundleID];
      long long v36 = v22->_editorBundleID;
      v22->_editorBundleID = (NSString *)v35;
    }
  }
  if ([(PHAssetChangeRequest *)v22 didChangeAdjustments]) {
    v23[2](v23);
  }
  v22->_unint64_t originalResourceChoice = xpc_dictionary_get_uint64(v8, "originalResourceChoice");
  BOOL v37 = xpc_dictionary_get_BOOL(v8, "didSetOriginalResourceChoice");
  v22->_BOOL didSetOriginalResourceChoice = v37;
  if (v37) {
    v23[2](v23);
  }
  BOOL v38 = xpc_dictionary_get_BOOL(v8, "didRevertLocationToOriginal");
  v22->_BOOL didRevertLocationToOriginal = v38;
  if (v38) {
    v23[2](v23);
  }
  BOOL v39 = xpc_dictionary_get_BOOL(v8, "didUpdateExtendedAttributesUsingOriginalMediaMetadata");
  v22->_BOOL didUpdateExtendedAttributesUsingOriginalMediaMetadata = v39;
  if (v39) {
    v23[2](v23);
  }
  BOOL v40 = xpc_dictionary_get_BOOL(v8, "didExpungeAllSpatialOverCaptureResources");
  v22->_BOOL didExpungeAllSpatialOverCaptureResources = v40;
  if (v40) {
    v23[2](v23);
  }
  BOOL v41 = xpc_dictionary_get_BOOL(v8, "didTrashAllSpatialOverCaptureResources");
  v22->_BOOL didTrashAllSpatialOverCaptureResources = v41;
  if (v41) {
    v23[2](v23);
  }
  BOOL v42 = xpc_dictionary_get_BOOL(v8, "didUntrashAllSpatialOverCaptureResources");
  v22->_BOOL didUntrashAllSpatialOverCaptureResources = v42;
  if (v42) {
    v23[2](v23);
  }
  BOOL v43 = xpc_dictionary_get_BOOL(v8, "didExpungeTrashedSpatialOverCaptureResources");
  v22->_BOOL didExpungeTrashedSpatialOverCaptureResources = v43;
  if (v43) {
    v23[2](v23);
  }
  BOOL v44 = xpc_dictionary_get_BOOL(v8, "didPromoteToGuestAsset");
  v22->_BOOL didPromoteToGuestAsset = v44;
  if (v44) {
    v23[2](v23);
  }
  BOOL v45 = xpc_dictionary_get_BOOL(v8, "didResetGuestAssetPromotion");
  v22->_didResetGuestAssetPromotiouint64_t n = v45;
  if (v45) {
    v23[2](v23);
  }
  uint64_t v46 = PLDataFromXPCDictionary();
  if (v46)
  {
    uint64_t v47 = (void *)MEMORY[0x1E4F28DC0];
    char v48 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    id v253 = 0;
    uint64_t v51 = [v47 unarchivedObjectOfClasses:v50 fromData:v46 error:&v253];
    id v52 = v253;
    updatedLocatiouint64_t n = v22->_updatedLocation;
    v22->_updatedLocatiouint64_t n = (CLLocation *)v51;

    if (v22->_updatedLocation)
    {
      v23[2](v23);
    }
    else
    {
      xpc_object_t v54 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v52;
        _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_DEFAULT, "Failed to unarchive locationData, error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  uint64_t v55 = PLStringFromXPCDictionary();
  assetDescriptiouint64_t n = v22->_assetDescription;
  v22->_assetDescriptiouint64_t n = (NSString *)v55;

  if (v22->_assetDescription) {
    v23[2](v23);
  }
  uint64_t v57 = PLStringFromXPCDictionary();
  accessibilityDescriptiouint64_t n = v22->_accessibilityDescription;
  v22->_accessibilityDescriptiouint64_t n = (NSString *)v57;

  if (v22->_accessibilityDescription) {
    v23[2](v23);
  }
  BOOL v59 = xpc_dictionary_get_BOOL(v8, "didSetTitle");
  v22->_BOOL didSetTitle = v59;
  if (v59)
  {
    uint64_t v60 = PLStringFromXPCDictionary();
    title = v22->_title;
    v22->_title = (NSString *)v60;

    v23[2](v23);
  }
  BOOL v62 = xpc_dictionary_get_BOOL(v8, "didSetKeywordTitles");
  v22->_BOOL didSetKeywordTitles = v62;
  if (v62)
  {
    long long v63 = PLArrayFromXPCDictionary();
    uint64_t v64 = [MEMORY[0x1E4F1CAD0] setWithArray:v63];
    keywordTitles = v22->_keywordTitles;
    v22->_keywordTitles = (NSSet *)v64;

    v23[2](v23);
  }
  uint64_t v66 = PLURLFromXPCDictionary();
  videoURLForUpint64_t date = v22->_videoURLForUpdate;
  v22->_videoURLForUpint64_t date = (NSURL *)v66;

  uint64_t v68 = PLStringFromXPCDictionary();
  pairingIdentifier = v22->_pairingIdentifier;
  v22->_pairingIdentifier = (NSString *)v68;

  CFDictionaryRef v70 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  p_videoDuratiouint64_t n = &v22->_videoDuration;
  if (v70)
  {
    CMTimeMakeFromDictionary(&buf.start, v70);
    long long v72 = *(_OWORD *)&buf.start.value;
    v22->_videoDuration.epoch = buf.start.epoch;
    *(_OWORD *)&p_videoDuration->float value = v72;
  }
  else
  {
    uint64_t v73 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&p_videoDuration->float value = *MEMORY[0x1E4F1F9F8];
    v22->_videoDuration.epoch = *(void *)(v73 + 16);
  }
  CFDictionaryRef v74 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  p_imageDisplayTime = &v22->_imageDisplayTime;
  if (v74)
  {
    CMTimeMakeFromDictionary(&buf.start, v74);
    long long v76 = *(_OWORD *)&buf.start.value;
    v22->_imageDisplayTime.epoch = buf.start.epoch;
    *(_OWORD *)&p_imageDisplayTime->float value = v76;
  }
  else
  {
    uint64_t v77 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&p_imageDisplayTime->float value = *MEMORY[0x1E4F1F9F8];
    v22->_imageDisplayTime.epoch = *(void *)(v77 + 16);
  }
  if (v22->_videoURLForUpdate && v22->_pairingIdentifier) {
    v23[2](v23);
  }
  v22->_uint64_t photoIrisVisibilityState = xpc_dictionary_get_uint64(v8, "photoIrisVisibilityState");
  BOOL v78 = xpc_dictionary_get_BOOL(v8, "didSetVisibilityState");
  v22->_BOOL didSetVisibilityState = v78;
  if (v78) {
    v23[2](v23);
  }
  uint64_t v79 = PLDictionaryFromXPCDictionary();
  uint64_t v80 = v79;
  if (v79)
  {
    uint64_t v81 = [v79 mutableCopy];
    sceneClassificationDictionariesByType = v22->_sceneClassificationDictionariesByType;
    v22->_sceneClassificationDictionariesByType = (NSMutableDictionary *)v81;

    v22->_BOOL didSetSceneClassifications = 1;
    v23[2](v23);
  }
  BOOL v83 = xpc_dictionary_get_BOOL(v8, "didSetImageEmbeddingVersionKey");
  v22->_didSetImageEmbeddingVersiouint64_t n = v83;
  if (v83)
  {
    v22->_imageEmbeddingVersiouint64_t n = xpc_dictionary_get_int64(v8, "imageEmbeddingVersion");
    v23[2](v23);
  }
  v247 = v80;
  BOOL v84 = xpc_dictionary_get_BOOL(v8, "didSetVideoEmbeddingVersionKey");
  v22->_didSetVideoEmbeddingVersiouint64_t n = v84;
  if (v84)
  {
    v22->_videoEmbeddingVersiouint64_t n = xpc_dictionary_get_int64(v8, "videoEmbeddingVersion");
    v23[2](v23);
  }
  v22->_BOOL incrementPlayCount = xpc_dictionary_get_BOOL(v8, "incrementPlayCount");
  v22->_BOOL incrementShareCount = xpc_dictionary_get_BOOL(v8, "incrementShareCount");
  int64_t date = xpc_dictionary_get_date(v8, "lastSharedDate");
  if (date)
  {
    uint64_t v86 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)date];
    lastSharedDate = v22->_lastSharedDate;
    v22->_lastSharedDate = (NSDate *)v86;
  }
  BOOL v88 = xpc_dictionary_get_BOOL(v8, "incrementViewCount");
  v22->_BOOL incrementViewCount = v88;
  if (v22->_incrementPlayCount || (v22->_incrementShareCount ? (int v89 = 1) : (int v89 = v88), v89 == 1)) {
    v23[2](v23);
  }
  v22->_BOOL clearLastViewedDate = xpc_dictionary_get_BOOL(v8, "clearLastViewedDate");
  BOOL v90 = xpc_dictionary_get_BOOL(v8, "clearLastSharedDate");
  v22->_BOOL clearLastSharedDate = v90;
  if (v22->_clearLastViewedDate || v90) {
    v23[2](v23);
  }
  uint64_t v91 = xpc_dictionary_get_value(v8, "variationSuggestionStates");
  v92 = v91;
  if (v91)
  {
    v22->_didSetVariationSuggestionStates = 1;
    v22->_unint64_t variationSuggestionStates = xpc_uint64_get_value(v91);
    v22->_variationSuggestionStatesMasuint64_t k = xpc_dictionary_get_uint64(v8, "variationSuggestionStatesMask");
    v23[2](v23);
  }
  BOOL v93 = xpc_dictionary_get_BOOL(v8, "toRetryUpload");
  v22->_BOOL toRetryUpload = v93;
  if (v93) {
    v23[2](v23);
  }
  v94 = xpc_dictionary_get_value(v8, "pathsToNewAssetResourcesByAssetResourceType");

  if (v94)
  {
    uint64_t v95 = PLDictionaryFromXPCObject();
    pathsToNewAssetResourcesByAssetResourceType = v22->_pathsToNewAssetResourcesByAssetResourceType;
    v22->_pathsToNewAssetResourcesByAssetResourceType = (NSDictionary *)v95;

    v23[2](v23);
  }
  uint64_t v97 = xpc_dictionary_get_value(v8, "assetResourceTypesToDelete");

  if (v97)
  {
    uint64_t v98 = (void *)MEMORY[0x1E4F1CAD0];
    v99 = PLArrayFromXPCObject();
    uint64_t v100 = [v98 setWithArray:v99];
    assetResourceTypesToDelete = v22->_assetResourceTypesToDelete;
    v22->_assetResourceTypesToDelete = (NSSet *)v100;

    v23[2](v23);
  }
  v102 = xpc_dictionary_get_value(v8, "libraryScopeOriginatorUUIDs");

  if (v102)
  {
    id v103 = (void *)MEMORY[0x1E4F1CAD0];
    v104 = PLArrayFromXPCObject();
    uint64_t v105 = [v103 setWithArray:v104];
    libraryScopeOriginatorUUIDs = v22->_libraryScopeOriginatorUUIDs;
    v22->_libraryScopeOriginatorUUIDs = (NSSet *)v105;

    v23[2](v23);
  }
  int v107 = xpc_dictionary_get_value(v8, "packedPreferredCropRect");

  if (v107)
  {
    v22->_didSetPackedPreferredCropRect = 1;
    v22->_int64_t packedPreferredCropRect = xpc_int64_get_value(v107);
    v23[2](v23);
  }
  uint64_t v108 = xpc_dictionary_get_value(v8, "packedAcceptableCropRect");

  if (v108)
  {
    v22->_didSetPackedAcceptableCropRect = 1;
    v22->_int64_t packedAcceptableCropRect = xpc_int64_get_value(v108);
    v23[2](v23);
  }
  v109 = xpc_dictionary_get_value(v8, "packedBestPlaybackRect");

  if (v109)
  {
    v22->_didSetPackedBestPlaybackRect = 1;
    v22->_int64_t packedBestPlaybackRect = xpc_int64_get_value(v109);
    v23[2](v23);
  }
  v110 = xpc_dictionary_get_value(v8, "computedAttributeMutations");

  if (v110)
  {
    v22->_didModifyComputedAttributes = 1;
    v111 = PLDictionaryFromXPCObject();
    uint64_t v112 = [v111 mutableCopy];
    computedAttributeMutations = v22->_computedAttributeMutations;
    v22->_computedAttributeMutations = (NSMutableDictionary *)v112;

    v23[2](v23);
  }
  BOOL v114 = xpc_dictionary_get_BOOL(v8, "resetWallpaperProperties");
  v22->_BOOL resetWallpaperProperties = v114;
  if (v114)
  {
    v22->_didSetWallpaperPropertiesTimestamp = 1;
    wallpaperPropertiesTimestamp = v22->_wallpaperPropertiesTimestamp;
    v22->_wallpaperPropertiesTimestamp = 0;

    v22->_didSetWallpaperPropertiesVersiouint64_t n = 1;
    v22->_wallpaperPropertiesVersiouint64_t n = 0;
    v22->_didSetWallpaperPropertiesData = 1;
    wallpaperPropertiesData = v22->_wallpaperPropertiesData;
    v22->_wallpaperPropertiesData = 0;
LABEL_110:

    v23[2](v23);
    goto LABEL_111;
  }
  id v117 = xpc_dictionary_get_value(v8, "photoAnalysisWallpaperPropertiesTimeStamp");

  if (v117)
  {
    v22->_didSetWallpaperPropertiesTimestamp = 1;
    uint64_t v118 = PLDateFromXPCObject();
    uint64_t v119 = v22->_wallpaperPropertiesTimestamp;
    v22->_wallpaperPropertiesTimestamp = (NSDate *)v118;

    v23[2](v23);
  }
  uint64_t v120 = xpc_dictionary_get_value(v8, "photoAnalysisWallpaperPropertiesVersion");

  if (v120)
  {
    v22->_didSetWallpaperPropertiesVersiouint64_t n = 1;
    v22->_wallpaperPropertiesVersiouint64_t n = xpc_uint64_get_value(v120);
    v23[2](v23);
  }
  v110 = xpc_dictionary_get_value(v8, "photoAnalysisWallpaperProperties");

  if (v110)
  {
    v22->_didSetWallpaperPropertiesData = 1;
    buf.start.float value = 0;
    data = xpc_dictionary_get_data(v8, "photoAnalysisWallpaperProperties", (size_t *)&buf);
    uint64_t v122 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:buf.start.value];
    wallpaperPropertiesData = v22->_wallpaperPropertiesData;
    v22->_wallpaperPropertiesData = (NSData *)v122;
    goto LABEL_110;
  }
LABEL_111:
  long long v123 = xpc_dictionary_get_value(v8, "mediaAnalysisTimeStamp");
  if (v123)
  {
    v22->_didSetMediaAnalysisTimeStamp = 1;
    uint64_t v124 = PLDateFromXPCObject();
    mediaAnalysisTimeStamp = v22->_mediaAnalysisTimeStamp;
    v22->_mediaAnalysisTimeStamp = (NSDate *)v124;

    v23[2](v23);
  }
  v126 = xpc_dictionary_get_value(v8, "mediaAnalysisVersion");

  if (v126)
  {
    v22->_didSetMediaAnalysisVersiouint64_t n = 1;
    v22->_mediaAnalysisVersiouint64_t n = xpc_uint64_get_value(v126);
    v23[2](v23);
  }
  long long v127 = xpc_dictionary_get_value(v8, "mediaAnalysisImageVersion");

  if (v127)
  {
    v22->_didSetMediaAnalysisImageVersiouint64_t n = 1;
    v22->_mediaAnalysisImageVersiouint64_t n = xpc_int64_get_value(v127);
    v23[2](v23);
  }
  CFDictionaryRef v128 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v128)
  {
    CMTimeMakeFromDictionary(&buf.start, v128);
    long long v129 = *(_OWORD *)&buf.start.value;
    v22->_bestKeyFrameTime.epoch = buf.start.epoch;
    *(_OWORD *)&v22->_bestKeyFrameTime.float value = v129;
    v23[2](v23);
  }
  BOOL v130 = xpc_dictionary_get_BOOL(v8, "unsetBestKeyFrameTime");
  v22->_BOOL didUnsetBestKeyFrameTime = v130;
  if (v130) {
    v23[2](v23);
  }
  CFDictionaryRef v131 = PLDataFromXPCDictionary();
  if (v131)
  {
    objc_storeStrong((id *)&v22->_bestKeyFrameJPEGData, v131);
    v23[2](v23);
  }
  CFDictionaryRef v132 = PLDataFromXPCDictionary();
  if (v132)
  {
    objc_storeStrong((id *)&v22->_computeSyncMediaAnalysisPayload, v132);
    v23[2](v23);
  }
  CFDictionaryRef v133 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v133)
  {
    CMTimeRangeMakeFromDictionary(&buf, v133);
    long long v134 = *(_OWORD *)&buf.start.value;
    long long v135 = *(_OWORD *)&buf.duration.timescale;
    *(_OWORD *)&v22->_bestVideoTimeRange.start.epoch = *(_OWORD *)&buf.start.epoch;
    *(_OWORD *)&v22->_bestVideoTimeRange.duration.timescale = v135;
    *(_OWORD *)&v22->_bestVideoTimeRange.start.float value = v134;
    v23[2](v23);
  }
  v245 = v132;
  v246 = v131;
  CFDictionaryRef v136 = (const __CFDictionary *)PLDictionaryFromXPCDictionary();
  if (v136)
  {
    CMTimeRangeMakeFromDictionary(&buf, v136);
    long long v137 = *(_OWORD *)&buf.start.value;
    long long v138 = *(_OWORD *)&buf.duration.timescale;
    *(_OWORD *)&v22->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&buf.start.epoch;
    *(_OWORD *)&v22->_animatedStickerTimeRange.duration.timescale = v138;
    *(_OWORD *)&v22->_animatedStickerTimeRange.start.float value = v137;
    v23[2](v23);
  }
  uint64_t v139 = xpc_dictionary_get_value(v8, "blurrinessScore");

  if (v139)
  {
    v22->_didSetBlurrinessScore = 1;
    float value = xpc_double_get_value(v139);
    v22->_float blurrinessScore = value;
    v23[2](v23);
  }
  v141 = xpc_dictionary_get_value(v8, "exposureScore");

  if (v141)
  {
    v22->_didSetExposureScore = 1;
    float v142 = xpc_double_get_value(v141);
    v22->_float exposureScore = v142;
    v23[2](v23);
  }
  v143 = xpc_dictionary_get_value(v8, "audioScore");

  if (v143)
  {
    v22->_didSetAudioScore = 1;
    float v144 = xpc_double_get_value(v143);
    v22->_float audioScore = v144;
    v23[2](v23);
  }
  double v145 = xpc_dictionary_get_value(v8, "settlingEffectScore");

  if (v145)
  {
    v22->_didSetSettlingEffectScore = 1;
    float v146 = xpc_double_get_value(v145);
    v22->_float settlingEffectScore = v146;
    v23[2](v23);
  }
  uint64_t v147 = xpc_dictionary_get_value(v8, "wallpaperScore");

  if (v147)
  {
    v22->_didSetWallpaperScore = 1;
    float v148 = xpc_double_get_value(v147);
    v22->_float wallpaperScore = v148;
    v23[2](v23);
  }
  uint64_t v149 = xpc_dictionary_get_value(v8, "autoplaySuggestionScore");

  if (v149)
  {
    v22->_didSetAutoplaySuggestionScore = 1;
    float v150 = xpc_double_get_value(v149);
    v22->_float autoplaySuggestionScore = v150;
    v23[2](v23);
  }
  double v151 = xpc_dictionary_get_value(v8, "videoStickerSuggestionScore");

  if (v151)
  {
    v22->_didSetVideoStickerSuggestionScore = 1;
    float v152 = xpc_double_get_value(v151);
    v22->_float videoStickerSuggestionScore = v152;
    v23[2](v23);
  }
  v153 = xpc_dictionary_get_value(v8, "videoScore");

  if (v153)
  {
    v22->_didSetVideoScore = 1;
    float v154 = xpc_double_get_value(v153);
    v22->_float videoScore = v154;
    v23[2](v23);
  }
  uint64_t v248 = (void *)v46;
  BOOL v155 = xpc_dictionary_get_value(v8, "activityScore");

  if (v155)
  {
    v22->_didSetActivityScore = 1;
    float v156 = xpc_double_get_value(v155);
    v22->_float activityScore = v156;
    v23[2](v23);
  }
  double v157 = xpc_dictionary_get_value(v8, "faceCount");

  if (v157)
  {
    v22->_didSetFaceCount = 1;
    v22->_unint64_t faceCount = xpc_uint64_get_value(v157);
    v23[2](v23);
  }
  v158 = xpc_dictionary_get_value(v8, "audioClassification");

  if (v158)
  {
    v22->_didSetAudioClassificatiouint64_t n = 1;
    v22->_audioClassificatiouint64_t n = xpc_int64_get_value(v158);
    v23[2](v23);
  }
  int v159 = xpc_dictionary_get_value(v8, "probableRotationDirection");

  if (v159)
  {
    v22->_probableRotationDirectiouint64_t n = xpc_int64_get_value(v159);
    v22->_didSetProbableRotationDirectiouint64_t n = 1;
  }
  double v160 = xpc_dictionary_get_value(v8, "probableRotationDirectionConfidence");

  if (v160)
  {
    float v161 = xpc_double_get_value(v160);
    v22->_float probableRotationDirectionConfidence = v161;
    v22->_didSetProbableRotationDirectionConfidence = 1;
  }
  CFDictionaryRef v162 = xpc_dictionary_get_value(v8, "colorNormalizationData");

  if (v162)
  {
    uint64_t v163 = PLDataFromXPCDataObject();
    colorNormalizationData = v22->_colorNormalizationData;
    v22->_colorNormalizationData = (NSData *)v163;
  }
  if (xpc_dictionary_get_BOOL(v8, "resetCharacterRecognitionProperties"))
  {
    v22->_BOOL resetCharacterRecognitionProperties = 1;
    v23[2](v23);
  }
  else
  {
    uint64_t v165 = xpc_dictionary_get_value(v8, "characterRecognitionProperties");

    if (v165)
    {
      v22->_didSetCharacterRecognitionData = 1;
      double v166 = PLDictionaryFromXPCObject();
      uint64_t v167 = [NSString stringWithUTF8String:"characterRecognitionData"];
      uint64_t v168 = [v166 objectForKeyedSubscript:v167];
      characterRecognitionData = v22->_characterRecognitionData;
      v22->_characterRecognitionData = (NSData *)v168;

      v170 = [NSString stringWithUTF8String:"machineReadableCodeData"];
      uint64_t v171 = [v166 objectForKeyedSubscript:v170];
      machineReadableCodeData = v22->_machineReadableCodeData;
      v22->_machineReadableCodeData = (NSData *)v171;

      uint64_t v173 = [NSString stringWithUTF8String:"characterRecognitionAlgorithmVersion"];
      v174 = [v166 objectForKeyedSubscript:v173];
      v22->_characterRecognitionAlgorithmVersiouint64_t n = [v174 integerValue];

      double v175 = [NSString stringWithUTF8String:"characterRecognitionAdjustmentVersion"];
      uint64_t v176 = [v166 objectForKeyedSubscript:v175];
      characterRecognitionAdjustmentVersiouint64_t n = v22->_characterRecognitionAdjustmentVersion;
      v22->_characterRecognitionAdjustmentVersiouint64_t n = (NSDate *)v176;

      v23[2](v23);
      CFDictionaryRef v162 = (void *)v165;
    }
    else
    {
      CFDictionaryRef v162 = 0;
    }
  }
  if (xpc_dictionary_get_BOOL(v8, "resetVisualSearchProperties"))
  {
    v22->_BOOL resetVisualSearchProperties = 1;
    v23[2](v23);
  }
  else
  {
    uint64_t v178 = xpc_dictionary_get_value(v8, "visualSearchProperties");

    if (!v178) {
      goto LABEL_167;
    }
    v22->_didSetVisualSearchProperties = 1;
    v179 = PLDictionaryFromXPCObject();
    CFDictionaryRef v180 = [NSString stringWithUTF8String:"visualSearchData"];
    uint64_t v181 = [v179 objectForKeyedSubscript:v180];
    visualSearchData = v22->_visualSearchData;
    v22->_visualSearchData = (NSData *)v181;

    v183 = [NSString stringWithUTF8String:"didSetVisualSearchData"];
    float v184 = [v179 objectForKeyedSubscript:v183];
    v22->_didSetVisualSearchData = [v184 BOOLValue];

    v185 = [NSString stringWithUTF8String:"didSetStickerConfidenceScore"];
    float v186 = [v179 objectForKeyedSubscript:v185];
    v22->_didSetStickerConfidenceScore = [v186 BOOLValue];

    v187 = [NSString stringWithUTF8String:"stickerConfidenceScore"];
    float v188 = [v179 objectForKeyedSubscript:v187];
    [v188 floatValue];
    v22->_stickerConfidenceScore = v189;

    float v190 = [NSString stringWithUTF8String:"visualSearchAlgorithmVersion"];
    v191 = [v179 objectForKeyedSubscript:v190];
    v22->_visualSearchAlgorithmVersiouint64_t n = [v191 integerValue];

    id v192 = [NSString stringWithUTF8String:"stickerConfidenceScoreAlgorithmVersion"];
    v193 = [v179 objectForKeyedSubscript:v192];
    v22->_stickerConfidenceScoreAlgorithmVersiouint64_t n = [v193 integerValue];

    float v194 = [NSString stringWithUTF8String:"visualSearchAdjustmentVersion"];
    uint64_t v195 = [v179 objectForKeyedSubscript:v194];
    visualSearchAdjustmentVersiouint64_t n = v22->_visualSearchAdjustmentVersion;
    v22->_visualSearchAdjustmentVersiouint64_t n = (NSDate *)v195;

    v23[2](v23);
    CFDictionaryRef v162 = (void *)v178;
  }

LABEL_167:
  uint64_t v197 = xpc_dictionary_get_value(v8, "sceneprintData");
  if (v197)
  {
    v22->_didSetSceneprintData = 1;
    uint64_t v198 = PLDataFromXPCDataObject();
    sceneprintData = v22->_sceneprintData;
    v22->_sceneprintData = (NSData *)v198;

    v23[2](v23);
  }
  float v200 = xpc_dictionary_get_value(v8, "duplicateMatchingData");

  if (v200)
  {
    v22->_didSetDuplicateMatchingData = 1;
    uint64_t v201 = PLDataFromXPCDictionary();
    duplicateMatchingData = v22->_duplicateMatchingData;
    v22->_duplicateMatchingData = (NSData *)v201;

    if (![(NSData *)v22->_duplicateMatchingData length])
    {
      v203 = v22->_duplicateMatchingData;
      v22->_duplicateMatchingData = 0;
    }
    uint64_t v204 = PLDataFromXPCDictionary();
    duplicateMatchingAlternateData = v22->_duplicateMatchingAlternateData;
    v22->_duplicateMatchingAlternateData = (NSData *)v204;

    if (![(NSData *)v22->_duplicateMatchingAlternateData length])
    {
      uint64_t v206 = v22->_duplicateMatchingAlternateData;
      v22->_duplicateMatchingAlternateData = 0;
    }
    v22->_BOOL duplicateProcessingSucceeded = xpc_dictionary_get_BOOL(v8, "duplicateProcessingSucceeded");
    v23[2](v23);
  }
  uint64_t v207 = xpc_dictionary_get_value(v8, "reverseLocationData");

  if (v207)
  {
    v22->_didSetReverseLocationData = 1;
    uint64_t v208 = PLDataFromXPCDataObject();
    reverseLocationData = v22->_reverseLocationData;
    v22->_reverseLocationData = (NSData *)v208;

    v23[2](v23);
  }
  v210 = xpc_dictionary_get_value(v8, "objectSaliencyRectsData");

  if (v210)
  {
    v22->_didSetObjectSaliencyRectsData = 1;
    uint64_t v211 = PLDataFromXPCDataObject();
    objectSaliencyRectsData = v22->_objectSaliencyRectsData;
    v22->_objectSaliencyRectsData = (NSData *)v211;

    v23[2](v23);
  }
  v213 = xpc_dictionary_get_value(v8, "reverseLocationDataIsValid");

  if (v213)
  {
    v22->_didSetReverseLocationDataIsValid = 1;
    v22->_BOOL reverseLocationDataIsValid = xpc_BOOL_get_value(v213);
    v23[2](v23);
  }
  unint64_t v214 = xpc_dictionary_get_value(v8, "shiftedLocation");

  if (v214)
  {
    v215 = PLDataFromXPCDataObject();
    if (v215)
    {
      v216 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v217 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v218 = objc_opt_class();
      v219 = objc_msgSend(v217, "setWithObjects:", v218, objc_opt_class(), 0, v245, v131, v247);
      id v252 = 0;
      uint64_t v220 = [v216 unarchivedObjectOfClasses:v219 fromData:v215 error:&v252];
      id v221 = v252;
      shiftedLocatiouint64_t n = v22->_shiftedLocation;
      v22->_shiftedLocatiouint64_t n = (CLLocation *)v220;

      if (v22->_shiftedLocation)
      {
        v22->_didSetShiftedLocatiouint64_t n = 1;
        v23[2](v23);
      }
      else
      {
        double v224 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v221;
          _os_log_impl(&dword_19B043000, v224, OS_LOG_TYPE_DEFAULT, "Failed to unarchive locationData, error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      v22->_didSetShiftedLocatiouint64_t n = 1;
      double v223 = v22->_shiftedLocation;
      v22->_shiftedLocatiouint64_t n = 0;

      v23[2](v23);
    }
  }
  uint64_t v225 = xpc_dictionary_get_value(v8, "timeZoneName");

  if (v225)
  {
    v22->_didSetTimeZone = 1;
    uint64_t v226 = PLStringFromXPCDictionary();
    timeZoneName = v22->_timeZoneName;
    v22->_timeZoneName = (NSString *)v226;

    v22->_uint64_t timeZoneOffsetValue = xpc_dictionary_get_int64(v8, "timeZoneOffsetValue");
    v23[2](v23);
  }
  v22->_clientEntitled = v251;
  v22->_double gpsHorizontalAccuracy = xpc_dictionary_get_double(v8, "gpsHorizontalAccuracy");
  v22->_didSetGpsHorizontalAccuracdouble y = 1;
  v23[2](v23);
  id v228 = xpc_dictionary_get_value(v8, "screenTimeDeviceImageSensitivity");

  if (v228)
  {
    v22->_didSetScreenTimeDeviceImageSensitivitdouble y = 1;
    v22->_uint64_t screenTimeDeviceImageSensitivity = xpc_int64_get_value(v228);
    v23[2](v23);
  }
  uint64_t v229 = xpc_dictionary_get_value(v8, "syndicationProcessingValue");

  if (v229)
  {
    v22->_uint64_t syndicationProcessingValue = xpc_uint64_get_value(v229);
    v22->_didSetSyndicationProcessingValue = 1;
    v23[2](v23);
  }
  v230 = xpc_dictionary_get_value(v8, "syndicationProcessingVersion");

  if (v230)
  {
    v22->_syndicationProcessingVersiouint64_t n = xpc_uint64_get_value(v230);
    v22->_didSetSyndicationProcessingVersiouint64_t n = 1;
    v23[2](v23);
  }
  v231 = xpc_dictionary_get_value(v8, "syndicationIdentifier");

  if (v231)
  {
    uint64_t v232 = PLStringFromXPCDictionary();
    syndicationIdentifier = v22->_syndicationIdentifier;
    v22->_syndicationIdentifier = (NSString *)v232;

    v22->_didSetSyndicationIdentifier = 1;
    v23[2](v23);
  }
  uint64_t v234 = xpc_dictionary_get_value(v8, "faceAnalysisVersion");

  if (v234)
  {
    v22->_didSetFaceAnalysisVersiouint64_t n = 1;
    v22->_faceAnalysisVersiouint64_t n = xpc_int64_get_value(v234);
    v23[2](v23);
  }
  BOOL v235 = xpc_dictionary_get_value(v8, "localAnalysisStage");

  if (v235)
  {
    v22->_didSetLocalAnalysisStage = 1;
    v22->_uint64_t localAnalysisStage = xpc_int64_get_value(v235);
    v23[2](v23);
  }
  v236 = xpc_dictionary_get_value(v8, "viewPresentation");

  if (v236)
  {
    v22->_didSetViewPresentatiouint64_t n = 1;
    v22->_viewPresentatiouint64_t n = xpc_int64_get_value(v236);
    v23[2](v23);
  }
  v22->_resetGeneratedAssetDescriptionProperties = xpc_dictionary_get_BOOL(v8, "ResetGeneratedAssetDescriptionKey");
  BOOL v237 = xpc_dictionary_get_BOOL(v8, "DidSetGeneratedAssetDescriptionKey");
  v22->_didSetGeneratedAssetDescriptionProperties = v237;
  if (v22->_resetGeneratedAssetDescriptionProperties) {
    goto LABEL_210;
  }
  if (v237)
  {
    uint64_t v238 = PLDictionaryFromXPCDictionary();
    uint64_t v239 = [v238 mutableCopy];
    generatedAssetDescriptionDictionaries = v22->_generatedAssetDescriptionDictionaries;
    v22->_generatedAssetDescriptionDictionaries = (NSMutableDictionary *)v239;

LABEL_210:
    v23[2](v23);
  }
  v241 = xpc_dictionary_get_value(v8, "PtpTrashedStateKey");

  if (v241)
  {
    v22->_int64_t ptpTrashedState = xpc_int64_get_value(v241);
    v22->_didSetPtpTrashedState = 1;
    v23[2](v23);
  }
  float v242 = xpc_dictionary_get_value(v8, "savedAssetType");

  if (v242)
  {
    v22->_didSetSavedAssetType = 1;
    v22->_uint64_t savedAssetType = xpc_int64_get_value(v242);
    v23[2](v23);
  }

  uint64_t v11 = v249;
  id v9 = v250;
LABEL_216:
  uint64_t v243 = v22;

  return v243;
}

uint64_t __68__PHAssetChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (PHAssetChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PHChangeRequestHelper alloc] initWithUUID:v7 objectID:v6 changeRequest:self];

  id v9 = [(PHAssetChangeRequest *)self initWithHelper:v8];
  if (v9)
  {
    id v10 = [(id)objc_opt_class() _allAssetEditOperations];
    [(PHAssetChangeRequest *)v9 setSupportedEditOperations:v10];
  }
  return v9;
}

- (PHAssetChangeRequest)initWithHelper:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    unsigned int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHAssetChangeRequest.m", 447, @"Invalid parameter not satisfying: %@", @"helper" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PHAssetChangeRequest;
  id v7 = [(PHChangeRequest *)&v22 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->super._helper, a3);
    id v9 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"detectedFaces" changeRequestHelper:v8->super._helper];
    facesHelper = v8->_facesHelper;
    v8->_facesHelper = v9;

    uint64_t v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"temporalDetectedFaces" changeRequestHelper:v8->super._helper];
    temporalFacesHelper = v8->_temporalFacesHelper;
    v8->_temporalFacesHelper = v11;

    uint64_t v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keywords" changeRequestHelper:v8->super._helper];
    keywordsHelper = v8->_keywordsHelper;
    v8->_keywordsHelper = v13;

    long long v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"cloudComments" changeRequestHelper:v8->super._helper];
    commentsHelper = v8->_commentsHelper;
    v8->_commentsHelper = v15;

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"likeComments" changeRequestHelper:v8->super._helper];
    likesHelper = v8->_likesHelper;
    v8->_likesHelper = v17;

    id v19 = [(id)objc_opt_class() _allAssetEditOperations];
    [(PHAssetChangeRequest *)v8 setSupportedEditOperations:v19];
  }
  return v8;
}

- (PHAssetChangeRequest)init
{
  [(PHAssetChangeRequest *)self doesNotRecognizeSelector:a2];

  return [(PHAssetChangeRequest *)self initWithHelper:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)recoverAssets:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PHObject assertAllObjects:v4 forSelector:a2 areOfType:objc_opt_class()];
  +[PHPhotoLibrary assertTransaction];
  if (recoverAssets__s_onceToken != -1) {
    dispatch_once(&recoverAssets__s_onceToken, &__block_literal_global_345);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [MEMORY[0x1E4F8BA10] defaultSavedAssetTypeForUnknownFilesystemImportAssets];
        uint64_t v12 = [v10 photoLibrary];
        uint64_t v13 = [v12 pathManager];
        int v14 = [v13 isDCIM];

        if (v14)
        {
          long long v15 = [v10 pathForOriginalFile];
          if ([v15 length])
          {
            id v16 = (void *)MEMORY[0x1E4F1CB10];
            id v17 = [v15 stringByDeletingLastPathComponent];
            uint64_t v18 = [v16 fileURLWithPath:v17 isDirectory:1];

            unsigned int v23 = 0;
            if (v18
              && [MEMORY[0x1E4F8A9B0] shouldImportAssetsFromDCIMSubDirectoryAtURL:v18 assetsKind:&v23]&& v23 <= 7)
            {
              if (((1 << v23) & 0x8D) != 0)
              {
                id v19 = [v10 directory];
                int v20 = [v19 hasPrefix:recoverAssets__s_cplAssetDirectoryPrefix];

                if (v20) {
                  uint64_t v21 = [MEMORY[0x1E4F8BA10] savedAssetTypeForAssetsInCPLAssetsDirectory];
                }
                else {
                  uint64_t v21 = [MEMORY[0x1E4F8BA10] defaultSavedAssetTypeForUnknownFilesystemImportAssets];
                }
LABEL_22:
                uint64_t v11 = v21;
              }
              else
              {
                if (v23 == 1)
                {
                  uint64_t v21 = [MEMORY[0x1E4F8BA10] savedAssetTypeForImportedByCameraConnectionKit];
                  goto LABEL_22;
                }
                if (v23 == 4)
                {
                  uint64_t v21 = [MEMORY[0x1E4F8BA10] savedAssetTypeForFinderSyncedAsset];
                  goto LABEL_22;
                }
              }
            }
          }
          else
          {
            uint64_t v18 = 0;
          }
        }
        objc_super v22 = +[PHAssetChangeRequest changeRequestForAsset:v10];
        [v22 _setSavedAssetType:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

void __38__PHAssetChangeRequest_recoverAssets___block_invoke()
{
  uint64_t v0 = [NSString stringWithFormat:@"%@/%@", @"PhotoData", @"CPLAssets"];
  v1 = (void *)recoverAssets__s_cplAssetDirectoryPrefix;
  recoverAssets__s_cplAssetDirectoryPrefidouble x = v0;
}

+ (BOOL)performBatchExpungeAndWaitWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  uint64_t v7 = +[PHBatchAssetExpunger batchAssetExpungerWithAssets:a3 deleteOptions:a4 library:a5 topLevelSelector:a2];
  LOBYTE(a6) = [v7 performChangesAndWait:a6];

  return (char)a6;
}

+ (void)performBatchExpungeWithAssets:(id)a3 deleteOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = +[PHBatchAssetExpunger batchAssetExpungerWithAssets:a3 deleteOptions:a4 library:a5 topLevelSelector:a2];
  [v11 performChangesWithCompletionHandler:v10];
}

+ (void)_deleteAssets:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5 deleteOptions:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  +[PHObject assertAllObjects:v9 forSelector:a5 areOfType:objc_opt_class()];
  +[PHPhotoLibrary assertTransaction];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHAssetDeleteRequest, "deleteRequestForObject:operation:", *(void *)(*((void *)&v17 + 1) + 8 * v15), a4, (void)v17);
        [v16 setDeleteOptions:v10];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

+ (void)undeleteAssets:(id)a3
{
}

+ (void)internalExpungeAssets:(id)a3 deleteOptions:(id)a4
{
}

+ (void)expungeAssets:(id)a3 deleteOptions:(id)a4
{
}

+ (void)expungeAssets:(id)a3
{
}

+ (void)deleteAssets:(id)assets
{
}

+ (PHAssetChangeRequest)changeRequestForAsset:(PHAsset *)asset
{
  if (asset)
  {
    uint64_t v3 = asset;
    id v4 = +[PHChangeRequestHelper changeRequestForObject:v3];
    [v4 _setOriginalAsset:v3];

    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v6 = [(id)objc_opt_class() _allAssetEditOperations];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __46__PHAssetChangeRequest_changeRequestForAsset___block_invoke;
    v10[3] = &unk_1E5847D40;
    id v11 = v5;
    id v7 = v5;
    [v6 enumerateIndexesUsingBlock:v10];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v7];
    [v4 setSupportedEditOperations:v8];
  }
  else
  {
    id v4 = 0;
  }

  return (PHAssetChangeRequest *)v4;
}

uint64_t __46__PHAssetChangeRequest_changeRequestForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3
{
  return +[PHAssetCreationRequest creationRequestForAssetFromVideoComplementBundle:a3];
}

+ (id)changeRequestForAssetFromVideoFileURL:(id)a3 imageAsset:(id)a4 displayTime:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHAssetChangeRequest.m", 412, @"Invalid parameter not satisfying: %@", @"videoFileURL" object file lineNumber description];
  }
  if (([v10 isPhoto] & 1) == 0)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"PHAssetChangeRequest.m" lineNumber:413 description:@"require photo when updating to iris"];
  }
  id v11 = [a1 changeRequestForAsset:v10];
  uint64_t v12 = [v9 path];
  uint64_t v13 = PFVideoComplementMetadataForVideoAtPath();

  uint64_t v14 = [v13 pairingIdentifier];
  memset(&v22, 0, sizeof(v22));
  if ([v13 hasValidImageDisplayTime])
  {
    if (v13) {
      [v13 imageDisplayTime];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
  }
  else
  {
    CMTimeMakeWithSeconds(&v22, a5, 60000);
  }
  memset(&v21, 0, sizeof(v21));
  if (![v13 hasValidVideoDuration])
  {
    CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v13)
  {
    [v13 videoDuration];
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  memset(&v21, 0, sizeof(v21));
  if (!v14)
  {
LABEL_15:
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v15 UUIDString];
  }
LABEL_16:
  [v11 setVideoURLForUpdate:v9];
  CMTime v20 = v21;
  [v11 setVideoDuration:&v20];
  CMTime v20 = v22;
  [v11 setImageDisplayTime:&v20];
  [v11 setPairingIdentifier:v14];
  id v16 = [(id)objc_opt_class() _allAssetEditOperations];
  [v11 setSupportedEditOperations:v16];

  [v11 didMutate];

  return v11;
}

+ (PHAssetChangeRequest)creationRequestForAssetFromVideoAtFileURL:(NSURL *)fileURL
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromVideoAtFileURL:fileURL];
}

+ (PHAssetChangeRequest)creationRequestForAssetFromImageAtFileURL:(NSURL *)fileURL
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromImageAtFileURL:fileURL];
}

+ (PHAssetChangeRequest)creationRequestForAssetFromImage:(UIImage *)image
{
  return (PHAssetChangeRequest *)+[PHAssetCreationRequest creationRequestForAssetFromImage:image];
}

+ (id)_allAssetEditOperations
{
  return (id)objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, 3);
}

@end