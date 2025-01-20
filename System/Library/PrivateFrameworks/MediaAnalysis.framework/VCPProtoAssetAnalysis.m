@interface VCPProtoAssetAnalysis
+ (Class)animatedStickerResultsType;
+ (Class)audioFusedVideoEmbeddingResultsType;
+ (Class)filesystemMovieApplauseResultsType;
+ (Class)filesystemMovieBabbleResultsType;
+ (Class)filesystemMovieCheeringResultsType;
+ (Class)filesystemMovieClassificationResultsType;
+ (Class)filesystemMovieHumanActionClassificationResultsType;
+ (Class)filesystemMovieLaughterResultsType;
+ (Class)filesystemMovieMusicResultsType;
+ (Class)filesystemMovieVoiceResultsType;
+ (Class)imageBlurResultsType;
+ (Class)imageCaptionResultsType;
+ (Class)imageCompositionResultsType;
+ (Class)imageEmbeddingResultsType;
+ (Class)imageExposureResultsType;
+ (Class)imageFaceResultsType;
+ (Class)imageFeatureResultsType;
+ (Class)imageHumanPoseResultsType;
+ (Class)imageJunkResultsType;
+ (Class)imagePetsFaceResultsType;
+ (Class)imagePetsResultsType;
+ (Class)imageSaliencyResultsType;
+ (Class)imageSceneprintResultsType;
+ (Class)imageShotTypeResultsType;
+ (Class)livePhotoEffectsResultsType;
+ (Class)livePhotoHumanActionClassificationResultsType;
+ (Class)livePhotoKeyFrameResultsType;
+ (Class)livePhotoKeyFrameStillResultsType;
+ (Class)livePhotoRecommendationResultsType;
+ (Class)livePhotoSettlingEffectGatingResultsType;
+ (Class)livePhotoSharpnessResultsType;
+ (Class)movieActivityLevelResultsType;
+ (Class)movieApplauseResultsType;
+ (Class)movieAudioQualityResultsType;
+ (Class)movieBabbleResultsType;
+ (Class)movieCameraMotionResultsType;
+ (Class)movieCheeringResultsType;
+ (Class)movieClassificationResultsType;
+ (Class)movieFaceResultsType;
+ (Class)movieFaceprintResultsType;
+ (Class)movieFeatureResultsType;
+ (Class)movieFineSubjectMotionResultsType;
+ (Class)movieHighlightResultsType;
+ (Class)movieHighlightScoreResultsType;
+ (Class)movieHumanActionClassificationResultsType;
+ (Class)movieHumanActionResultsType;
+ (Class)movieHumanPoseResultsType;
+ (Class)movieInterestingnessResultsType;
+ (Class)movieLaughterResultsType;
+ (Class)movieLoudnessResultsType;
+ (Class)movieMovingObjectResultsType;
+ (Class)movieMusicResultsType;
+ (Class)movieObstructionResultsType;
+ (Class)movieOrientationResultsType;
+ (Class)moviePetsFaceResultsType;
+ (Class)moviePetsResultsType;
+ (Class)moviePreEncodeResultsType;
+ (Class)movieQualityResultsType;
+ (Class)movieSafetyResultsType;
+ (Class)movieSaliencyResultsType;
+ (Class)movieSceneResultsType;
+ (Class)movieSceneprintResultsType;
+ (Class)movieStabilizationResultsType;
+ (Class)movieSubjectMotionResultsType;
+ (Class)movieSubtleMotionResultsType;
+ (Class)movieSummaryResultsType;
+ (Class)movieTorsoResultsType;
+ (Class)movieUtteranceResultsType;
+ (Class)movieVoiceResultsType;
+ (Class)summarizedEmbeddingResultsType;
+ (Class)videoCaptionPreferenceResultsType;
+ (Class)videoCaptionResultsType;
+ (Class)videoEmbeddingResultsType;
+ (Class)videoSegmentCaptionResultsType;
+ (id)faceResultKeys;
+ (id)filesystemMovieAnalysisFromLegacyDictionary:(id)a3;
+ (id)imageAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3;
+ (id)imageAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4;
+ (id)movieAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3;
+ (id)movieAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4;
- (BOOL)exportResultsWithPropertyKey:(id)a3 toLegacyDictionary:(id)a4 withKey:(id)a5;
- (BOOL)hasAssetAdjustedFingerprint;
- (BOOL)hasAssetCloudIdentifier;
- (BOOL)hasAssetMasterFingerprint;
- (BOOL)hasQuality;
- (BOOL)hasStatsFlags;
- (BOOL)hasTypesWide;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)setAttributesFromLegacyDictionary:(id)a3;
- (BOOL)setImageAnalysisFromLegacyDictionary:(id)a3;
- (BOOL)setMovieAnalysisFromLegacyDictionary:(id)a3;
- (BOOL)setResults:(id)a3 withClass:(Class)a4 forPropertyKey:(id)a5;
- (NSMutableArray)animatedStickerResults;
- (NSMutableArray)audioFusedVideoEmbeddingResults;
- (NSMutableArray)filesystemMovieApplauseResults;
- (NSMutableArray)filesystemMovieBabbleResults;
- (NSMutableArray)filesystemMovieCheeringResults;
- (NSMutableArray)filesystemMovieClassificationResults;
- (NSMutableArray)filesystemMovieHumanActionClassificationResults;
- (NSMutableArray)filesystemMovieLaughterResults;
- (NSMutableArray)filesystemMovieMusicResults;
- (NSMutableArray)filesystemMovieVoiceResults;
- (NSMutableArray)imageBlurResults;
- (NSMutableArray)imageCaptionResults;
- (NSMutableArray)imageCompositionResults;
- (NSMutableArray)imageEmbeddingResults;
- (NSMutableArray)imageExposureResults;
- (NSMutableArray)imageFaceResults;
- (NSMutableArray)imageFeatureResults;
- (NSMutableArray)imageHumanPoseResults;
- (NSMutableArray)imageJunkResults;
- (NSMutableArray)imagePetsFaceResults;
- (NSMutableArray)imagePetsResults;
- (NSMutableArray)imageSaliencyResults;
- (NSMutableArray)imageSceneprintResults;
- (NSMutableArray)imageShotTypeResults;
- (NSMutableArray)livePhotoEffectsResults;
- (NSMutableArray)livePhotoHumanActionClassificationResults;
- (NSMutableArray)livePhotoKeyFrameResults;
- (NSMutableArray)livePhotoKeyFrameStillResults;
- (NSMutableArray)livePhotoRecommendationResults;
- (NSMutableArray)livePhotoSettlingEffectGatingResults;
- (NSMutableArray)livePhotoSharpnessResults;
- (NSMutableArray)movieActivityLevelResults;
- (NSMutableArray)movieApplauseResults;
- (NSMutableArray)movieAudioQualityResults;
- (NSMutableArray)movieBabbleResults;
- (NSMutableArray)movieCameraMotionResults;
- (NSMutableArray)movieCheeringResults;
- (NSMutableArray)movieClassificationResults;
- (NSMutableArray)movieFaceResults;
- (NSMutableArray)movieFaceprintResults;
- (NSMutableArray)movieFeatureResults;
- (NSMutableArray)movieFineSubjectMotionResults;
- (NSMutableArray)movieHighlightResults;
- (NSMutableArray)movieHighlightScoreResults;
- (NSMutableArray)movieHumanActionClassificationResults;
- (NSMutableArray)movieHumanActionResults;
- (NSMutableArray)movieHumanPoseResults;
- (NSMutableArray)movieInterestingnessResults;
- (NSMutableArray)movieLaughterResults;
- (NSMutableArray)movieLoudnessResults;
- (NSMutableArray)movieMovingObjectResults;
- (NSMutableArray)movieMusicResults;
- (NSMutableArray)movieObstructionResults;
- (NSMutableArray)movieOrientationResults;
- (NSMutableArray)moviePetsFaceResults;
- (NSMutableArray)moviePetsResults;
- (NSMutableArray)moviePreEncodeResults;
- (NSMutableArray)movieQualityResults;
- (NSMutableArray)movieSafetyResults;
- (NSMutableArray)movieSaliencyResults;
- (NSMutableArray)movieSceneResults;
- (NSMutableArray)movieSceneprintResults;
- (NSMutableArray)movieStabilizationResults;
- (NSMutableArray)movieSubjectMotionResults;
- (NSMutableArray)movieSubtleMotionResults;
- (NSMutableArray)movieSummaryResults;
- (NSMutableArray)movieTorsoResults;
- (NSMutableArray)movieUtteranceResults;
- (NSMutableArray)movieVoiceResults;
- (NSMutableArray)summarizedEmbeddingResults;
- (NSMutableArray)videoCaptionPreferenceResults;
- (NSMutableArray)videoCaptionResults;
- (NSMutableArray)videoEmbeddingResults;
- (NSMutableArray)videoSegmentCaptionResults;
- (NSString)assetAdjustedFingerprint;
- (NSString)assetCloudIdentifier;
- (NSString)assetIdentifier;
- (NSString)assetMasterFingerprint;
- (double)assetModificationDate;
- (double)date;
- (double)quality;
- (id)animatedStickerResultsAtIndex:(unint64_t)a3;
- (id)audioFusedVideoEmbeddingResultsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportFilesystemAnalysisToLegacyDictionary;
- (id)exportToLegacyDictionary;
- (id)filesystemMovieApplauseResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieBabbleResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieCheeringResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieClassificationResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieHumanActionClassificationResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieLaughterResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieMusicResultsAtIndex:(unint64_t)a3;
- (id)filesystemMovieVoiceResultsAtIndex:(unint64_t)a3;
- (id)imageBlurResultsAtIndex:(unint64_t)a3;
- (id)imageCaptionResultsAtIndex:(unint64_t)a3;
- (id)imageCompositionResultsAtIndex:(unint64_t)a3;
- (id)imageEmbeddingResultsAtIndex:(unint64_t)a3;
- (id)imageExposureResultsAtIndex:(unint64_t)a3;
- (id)imageFaceResultsAtIndex:(unint64_t)a3;
- (id)imageFeatureResultsAtIndex:(unint64_t)a3;
- (id)imageHumanPoseResultsAtIndex:(unint64_t)a3;
- (id)imageJunkResultsAtIndex:(unint64_t)a3;
- (id)imagePetsFaceResultsAtIndex:(unint64_t)a3;
- (id)imagePetsResultsAtIndex:(unint64_t)a3;
- (id)imageSaliencyResultsAtIndex:(unint64_t)a3;
- (id)imageSceneprintResultsAtIndex:(unint64_t)a3;
- (id)imageShotTypeResultsAtIndex:(unint64_t)a3;
- (id)livePhotoEffectsResultsAtIndex:(unint64_t)a3;
- (id)livePhotoHumanActionClassificationResultsAtIndex:(unint64_t)a3;
- (id)livePhotoKeyFrameResultsAtIndex:(unint64_t)a3;
- (id)livePhotoKeyFrameStillResultsAtIndex:(unint64_t)a3;
- (id)livePhotoRecommendationResultsAtIndex:(unint64_t)a3;
- (id)livePhotoSettlingEffectGatingResultsAtIndex:(unint64_t)a3;
- (id)livePhotoSharpnessResultsAtIndex:(unint64_t)a3;
- (id)movieActivityLevelResultsAtIndex:(unint64_t)a3;
- (id)movieApplauseResultsAtIndex:(unint64_t)a3;
- (id)movieAudioQualityResultsAtIndex:(unint64_t)a3;
- (id)movieBabbleResultsAtIndex:(unint64_t)a3;
- (id)movieCameraMotionResultsAtIndex:(unint64_t)a3;
- (id)movieCheeringResultsAtIndex:(unint64_t)a3;
- (id)movieClassificationResultsAtIndex:(unint64_t)a3;
- (id)movieFaceResultsAtIndex:(unint64_t)a3;
- (id)movieFaceprintResultsAtIndex:(unint64_t)a3;
- (id)movieFeatureResultsAtIndex:(unint64_t)a3;
- (id)movieFineSubjectMotionResultsAtIndex:(unint64_t)a3;
- (id)movieHighlightResultsAtIndex:(unint64_t)a3;
- (id)movieHighlightScoreResultsAtIndex:(unint64_t)a3;
- (id)movieHumanActionClassificationResultsAtIndex:(unint64_t)a3;
- (id)movieHumanActionResultsAtIndex:(unint64_t)a3;
- (id)movieHumanPoseResultsAtIndex:(unint64_t)a3;
- (id)movieInterestingnessResultsAtIndex:(unint64_t)a3;
- (id)movieLaughterResultsAtIndex:(unint64_t)a3;
- (id)movieLoudnessResultsAtIndex:(unint64_t)a3;
- (id)movieMovingObjectResultsAtIndex:(unint64_t)a3;
- (id)movieMusicResultsAtIndex:(unint64_t)a3;
- (id)movieObstructionResultsAtIndex:(unint64_t)a3;
- (id)movieOrientationResultsAtIndex:(unint64_t)a3;
- (id)moviePetsFaceResultsAtIndex:(unint64_t)a3;
- (id)moviePetsResultsAtIndex:(unint64_t)a3;
- (id)moviePreEncodeResultsAtIndex:(unint64_t)a3;
- (id)movieQualityResultsAtIndex:(unint64_t)a3;
- (id)movieSafetyResultsAtIndex:(unint64_t)a3;
- (id)movieSaliencyResultsAtIndex:(unint64_t)a3;
- (id)movieSceneResultsAtIndex:(unint64_t)a3;
- (id)movieSceneprintResultsAtIndex:(unint64_t)a3;
- (id)movieStabilizationResultsAtIndex:(unint64_t)a3;
- (id)movieSubjectMotionResultsAtIndex:(unint64_t)a3;
- (id)movieSubtleMotionResultsAtIndex:(unint64_t)a3;
- (id)movieSummaryResultsAtIndex:(unint64_t)a3;
- (id)movieTorsoResultsAtIndex:(unint64_t)a3;
- (id)movieUtteranceResultsAtIndex:(unint64_t)a3;
- (id)movieVoiceResultsAtIndex:(unint64_t)a3;
- (id)summarizedEmbeddingResultsAtIndex:(unint64_t)a3;
- (id)videoCaptionPreferenceResultsAtIndex:(unint64_t)a3;
- (id)videoCaptionResultsAtIndex:(unint64_t)a3;
- (id)videoEmbeddingResultsAtIndex:(unint64_t)a3;
- (id)videoSegmentCaptionResultsAtIndex:(unint64_t)a3;
- (unint64_t)animatedStickerResultsCount;
- (unint64_t)audioFusedVideoEmbeddingResultsCount;
- (unint64_t)filesystemMovieApplauseResultsCount;
- (unint64_t)filesystemMovieBabbleResultsCount;
- (unint64_t)filesystemMovieCheeringResultsCount;
- (unint64_t)filesystemMovieClassificationResultsCount;
- (unint64_t)filesystemMovieHumanActionClassificationResultsCount;
- (unint64_t)filesystemMovieLaughterResultsCount;
- (unint64_t)filesystemMovieMusicResultsCount;
- (unint64_t)filesystemMovieVoiceResultsCount;
- (unint64_t)hash;
- (unint64_t)imageBlurResultsCount;
- (unint64_t)imageCaptionResultsCount;
- (unint64_t)imageCompositionResultsCount;
- (unint64_t)imageEmbeddingResultsCount;
- (unint64_t)imageExposureResultsCount;
- (unint64_t)imageFaceResultsCount;
- (unint64_t)imageFeatureResultsCount;
- (unint64_t)imageHumanPoseResultsCount;
- (unint64_t)imageJunkResultsCount;
- (unint64_t)imagePetsFaceResultsCount;
- (unint64_t)imagePetsResultsCount;
- (unint64_t)imageSaliencyResultsCount;
- (unint64_t)imageSceneprintResultsCount;
- (unint64_t)imageShotTypeResultsCount;
- (unint64_t)livePhotoEffectsResultsCount;
- (unint64_t)livePhotoHumanActionClassificationResultsCount;
- (unint64_t)livePhotoKeyFrameResultsCount;
- (unint64_t)livePhotoKeyFrameStillResultsCount;
- (unint64_t)livePhotoRecommendationResultsCount;
- (unint64_t)livePhotoSettlingEffectGatingResultsCount;
- (unint64_t)livePhotoSharpnessResultsCount;
- (unint64_t)movieActivityLevelResultsCount;
- (unint64_t)movieApplauseResultsCount;
- (unint64_t)movieAudioQualityResultsCount;
- (unint64_t)movieBabbleResultsCount;
- (unint64_t)movieCameraMotionResultsCount;
- (unint64_t)movieCheeringResultsCount;
- (unint64_t)movieClassificationResultsCount;
- (unint64_t)movieFaceResultsCount;
- (unint64_t)movieFaceprintResultsCount;
- (unint64_t)movieFeatureResultsCount;
- (unint64_t)movieFineSubjectMotionResultsCount;
- (unint64_t)movieHighlightResultsCount;
- (unint64_t)movieHighlightScoreResultsCount;
- (unint64_t)movieHumanActionClassificationResultsCount;
- (unint64_t)movieHumanActionResultsCount;
- (unint64_t)movieHumanPoseResultsCount;
- (unint64_t)movieInterestingnessResultsCount;
- (unint64_t)movieLaughterResultsCount;
- (unint64_t)movieLoudnessResultsCount;
- (unint64_t)movieMovingObjectResultsCount;
- (unint64_t)movieMusicResultsCount;
- (unint64_t)movieObstructionResultsCount;
- (unint64_t)movieOrientationResultsCount;
- (unint64_t)moviePetsFaceResultsCount;
- (unint64_t)moviePetsResultsCount;
- (unint64_t)moviePreEncodeResultsCount;
- (unint64_t)movieQualityResultsCount;
- (unint64_t)movieSafetyResultsCount;
- (unint64_t)movieSaliencyResultsCount;
- (unint64_t)movieSceneResultsCount;
- (unint64_t)movieSceneprintResultsCount;
- (unint64_t)movieStabilizationResultsCount;
- (unint64_t)movieSubjectMotionResultsCount;
- (unint64_t)movieSubtleMotionResultsCount;
- (unint64_t)movieSummaryResultsCount;
- (unint64_t)movieTorsoResultsCount;
- (unint64_t)movieUtteranceResultsCount;
- (unint64_t)movieVoiceResultsCount;
- (unint64_t)statsFlags;
- (unint64_t)summarizedEmbeddingResultsCount;
- (unint64_t)typesWide;
- (unint64_t)videoCaptionPreferenceResultsCount;
- (unint64_t)videoCaptionResultsCount;
- (unint64_t)videoEmbeddingResultsCount;
- (unint64_t)videoSegmentCaptionResultsCount;
- (unsigned)flags;
- (unsigned)types;
- (unsigned)version;
- (void)addAnimatedStickerResults:(id)a3;
- (void)addAudioFusedVideoEmbeddingResults:(id)a3;
- (void)addFilesystemMovieApplauseResults:(id)a3;
- (void)addFilesystemMovieBabbleResults:(id)a3;
- (void)addFilesystemMovieCheeringResults:(id)a3;
- (void)addFilesystemMovieClassificationResults:(id)a3;
- (void)addFilesystemMovieHumanActionClassificationResults:(id)a3;
- (void)addFilesystemMovieLaughterResults:(id)a3;
- (void)addFilesystemMovieMusicResults:(id)a3;
- (void)addFilesystemMovieVoiceResults:(id)a3;
- (void)addImageBlurResults:(id)a3;
- (void)addImageCaptionResults:(id)a3;
- (void)addImageCompositionResults:(id)a3;
- (void)addImageEmbeddingResults:(id)a3;
- (void)addImageExposureResults:(id)a3;
- (void)addImageFaceResults:(id)a3;
- (void)addImageFeatureResults:(id)a3;
- (void)addImageHumanPoseResults:(id)a3;
- (void)addImageJunkResults:(id)a3;
- (void)addImagePetsFaceResults:(id)a3;
- (void)addImagePetsResults:(id)a3;
- (void)addImageSaliencyResults:(id)a3;
- (void)addImageSceneprintResults:(id)a3;
- (void)addImageShotTypeResults:(id)a3;
- (void)addLivePhotoEffectsResults:(id)a3;
- (void)addLivePhotoHumanActionClassificationResults:(id)a3;
- (void)addLivePhotoKeyFrameResults:(id)a3;
- (void)addLivePhotoKeyFrameStillResults:(id)a3;
- (void)addLivePhotoRecommendationResults:(id)a3;
- (void)addLivePhotoSettlingEffectGatingResults:(id)a3;
- (void)addLivePhotoSharpnessResults:(id)a3;
- (void)addMovieActivityLevelResults:(id)a3;
- (void)addMovieApplauseResults:(id)a3;
- (void)addMovieAudioQualityResults:(id)a3;
- (void)addMovieBabbleResults:(id)a3;
- (void)addMovieCameraMotionResults:(id)a3;
- (void)addMovieCheeringResults:(id)a3;
- (void)addMovieClassificationResults:(id)a3;
- (void)addMovieFaceResults:(id)a3;
- (void)addMovieFaceprintResults:(id)a3;
- (void)addMovieFeatureResults:(id)a3;
- (void)addMovieFineSubjectMotionResults:(id)a3;
- (void)addMovieHighlightResults:(id)a3;
- (void)addMovieHighlightScoreResults:(id)a3;
- (void)addMovieHumanActionClassificationResults:(id)a3;
- (void)addMovieHumanActionResults:(id)a3;
- (void)addMovieHumanPoseResults:(id)a3;
- (void)addMovieInterestingnessResults:(id)a3;
- (void)addMovieLaughterResults:(id)a3;
- (void)addMovieLoudnessResults:(id)a3;
- (void)addMovieMovingObjectResults:(id)a3;
- (void)addMovieMusicResults:(id)a3;
- (void)addMovieObstructionResults:(id)a3;
- (void)addMovieOrientationResults:(id)a3;
- (void)addMoviePetsFaceResults:(id)a3;
- (void)addMoviePetsResults:(id)a3;
- (void)addMoviePreEncodeResults:(id)a3;
- (void)addMovieQualityResults:(id)a3;
- (void)addMovieSafetyResults:(id)a3;
- (void)addMovieSaliencyResults:(id)a3;
- (void)addMovieSceneResults:(id)a3;
- (void)addMovieSceneprintResults:(id)a3;
- (void)addMovieStabilizationResults:(id)a3;
- (void)addMovieSubjectMotionResults:(id)a3;
- (void)addMovieSubtleMotionResults:(id)a3;
- (void)addMovieSummaryResults:(id)a3;
- (void)addMovieTorsoResults:(id)a3;
- (void)addMovieUtteranceResults:(id)a3;
- (void)addMovieVoiceResults:(id)a3;
- (void)addSummarizedEmbeddingResults:(id)a3;
- (void)addVideoCaptionPreferenceResults:(id)a3;
- (void)addVideoCaptionResults:(id)a3;
- (void)addVideoEmbeddingResults:(id)a3;
- (void)addVideoSegmentCaptionResults:(id)a3;
- (void)clearAnimatedStickerResults;
- (void)clearAudioFusedVideoEmbeddingResults;
- (void)clearFilesystemMovieApplauseResults;
- (void)clearFilesystemMovieBabbleResults;
- (void)clearFilesystemMovieCheeringResults;
- (void)clearFilesystemMovieClassificationResults;
- (void)clearFilesystemMovieHumanActionClassificationResults;
- (void)clearFilesystemMovieLaughterResults;
- (void)clearFilesystemMovieMusicResults;
- (void)clearFilesystemMovieVoiceResults;
- (void)clearImageBlurResults;
- (void)clearImageCaptionResults;
- (void)clearImageCompositionResults;
- (void)clearImageEmbeddingResults;
- (void)clearImageExposureResults;
- (void)clearImageFaceResults;
- (void)clearImageFeatureResults;
- (void)clearImageHumanPoseResults;
- (void)clearImageJunkResults;
- (void)clearImagePetsFaceResults;
- (void)clearImagePetsResults;
- (void)clearImageSaliencyResults;
- (void)clearImageSceneprintResults;
- (void)clearImageShotTypeResults;
- (void)clearLivePhotoEffectsResults;
- (void)clearLivePhotoHumanActionClassificationResults;
- (void)clearLivePhotoKeyFrameResults;
- (void)clearLivePhotoKeyFrameStillResults;
- (void)clearLivePhotoRecommendationResults;
- (void)clearLivePhotoSettlingEffectGatingResults;
- (void)clearLivePhotoSharpnessResults;
- (void)clearMovieActivityLevelResults;
- (void)clearMovieApplauseResults;
- (void)clearMovieAudioQualityResults;
- (void)clearMovieBabbleResults;
- (void)clearMovieCameraMotionResults;
- (void)clearMovieCheeringResults;
- (void)clearMovieClassificationResults;
- (void)clearMovieFaceResults;
- (void)clearMovieFaceprintResults;
- (void)clearMovieFeatureResults;
- (void)clearMovieFineSubjectMotionResults;
- (void)clearMovieHighlightResults;
- (void)clearMovieHighlightScoreResults;
- (void)clearMovieHumanActionClassificationResults;
- (void)clearMovieHumanActionResults;
- (void)clearMovieHumanPoseResults;
- (void)clearMovieInterestingnessResults;
- (void)clearMovieLaughterResults;
- (void)clearMovieLoudnessResults;
- (void)clearMovieMovingObjectResults;
- (void)clearMovieMusicResults;
- (void)clearMovieObstructionResults;
- (void)clearMovieOrientationResults;
- (void)clearMoviePetsFaceResults;
- (void)clearMoviePetsResults;
- (void)clearMoviePreEncodeResults;
- (void)clearMovieQualityResults;
- (void)clearMovieSafetyResults;
- (void)clearMovieSaliencyResults;
- (void)clearMovieSceneResults;
- (void)clearMovieSceneprintResults;
- (void)clearMovieStabilizationResults;
- (void)clearMovieSubjectMotionResults;
- (void)clearMovieSubtleMotionResults;
- (void)clearMovieSummaryResults;
- (void)clearMovieTorsoResults;
- (void)clearMovieUtteranceResults;
- (void)clearMovieVoiceResults;
- (void)clearSummarizedEmbeddingResults;
- (void)clearVideoCaptionPreferenceResults;
- (void)clearVideoCaptionResults;
- (void)clearVideoEmbeddingResults;
- (void)clearVideoSegmentCaptionResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnimatedStickerResults:(id)a3;
- (void)setAssetAdjustedFingerprint:(id)a3;
- (void)setAssetCloudIdentifier:(id)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setAssetMasterFingerprint:(id)a3;
- (void)setAssetModificationDate:(double)a3;
- (void)setAudioFusedVideoEmbeddingResults:(id)a3;
- (void)setDate:(double)a3;
- (void)setFilesystemMovieApplauseResults:(id)a3;
- (void)setFilesystemMovieBabbleResults:(id)a3;
- (void)setFilesystemMovieCheeringResults:(id)a3;
- (void)setFilesystemMovieClassificationResults:(id)a3;
- (void)setFilesystemMovieHumanActionClassificationResults:(id)a3;
- (void)setFilesystemMovieLaughterResults:(id)a3;
- (void)setFilesystemMovieMusicResults:(id)a3;
- (void)setFilesystemMovieVoiceResults:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasStatsFlags:(BOOL)a3;
- (void)setHasTypesWide:(BOOL)a3;
- (void)setImageBlurResults:(id)a3;
- (void)setImageCaptionResults:(id)a3;
- (void)setImageCompositionResults:(id)a3;
- (void)setImageEmbeddingResults:(id)a3;
- (void)setImageExposureResults:(id)a3;
- (void)setImageFaceResults:(id)a3;
- (void)setImageFeatureResults:(id)a3;
- (void)setImageHumanPoseResults:(id)a3;
- (void)setImageJunkResults:(id)a3;
- (void)setImagePetsFaceResults:(id)a3;
- (void)setImagePetsResults:(id)a3;
- (void)setImageSaliencyResults:(id)a3;
- (void)setImageSceneprintResults:(id)a3;
- (void)setImageShotTypeResults:(id)a3;
- (void)setLivePhotoEffectsResults:(id)a3;
- (void)setLivePhotoHumanActionClassificationResults:(id)a3;
- (void)setLivePhotoKeyFrameResults:(id)a3;
- (void)setLivePhotoKeyFrameStillResults:(id)a3;
- (void)setLivePhotoRecommendationResults:(id)a3;
- (void)setLivePhotoSettlingEffectGatingResults:(id)a3;
- (void)setLivePhotoSharpnessResults:(id)a3;
- (void)setMovieActivityLevelResults:(id)a3;
- (void)setMovieApplauseResults:(id)a3;
- (void)setMovieAudioQualityResults:(id)a3;
- (void)setMovieBabbleResults:(id)a3;
- (void)setMovieCameraMotionResults:(id)a3;
- (void)setMovieCheeringResults:(id)a3;
- (void)setMovieClassificationResults:(id)a3;
- (void)setMovieFaceResults:(id)a3;
- (void)setMovieFaceprintResults:(id)a3;
- (void)setMovieFeatureResults:(id)a3;
- (void)setMovieFineSubjectMotionResults:(id)a3;
- (void)setMovieHighlightResults:(id)a3;
- (void)setMovieHighlightScoreResults:(id)a3;
- (void)setMovieHumanActionClassificationResults:(id)a3;
- (void)setMovieHumanActionResults:(id)a3;
- (void)setMovieHumanPoseResults:(id)a3;
- (void)setMovieInterestingnessResults:(id)a3;
- (void)setMovieLaughterResults:(id)a3;
- (void)setMovieLoudnessResults:(id)a3;
- (void)setMovieMovingObjectResults:(id)a3;
- (void)setMovieMusicResults:(id)a3;
- (void)setMovieObstructionResults:(id)a3;
- (void)setMovieOrientationResults:(id)a3;
- (void)setMoviePetsFaceResults:(id)a3;
- (void)setMoviePetsResults:(id)a3;
- (void)setMoviePreEncodeResults:(id)a3;
- (void)setMovieQualityResults:(id)a3;
- (void)setMovieSafetyResults:(id)a3;
- (void)setMovieSaliencyResults:(id)a3;
- (void)setMovieSceneResults:(id)a3;
- (void)setMovieSceneprintResults:(id)a3;
- (void)setMovieStabilizationResults:(id)a3;
- (void)setMovieSubjectMotionResults:(id)a3;
- (void)setMovieSubtleMotionResults:(id)a3;
- (void)setMovieSummaryResults:(id)a3;
- (void)setMovieTorsoResults:(id)a3;
- (void)setMovieUtteranceResults:(id)a3;
- (void)setMovieVoiceResults:(id)a3;
- (void)setQuality:(double)a3;
- (void)setStatsFlags:(unint64_t)a3;
- (void)setSummarizedEmbeddingResults:(id)a3;
- (void)setTypes:(unsigned int)a3;
- (void)setTypesWide:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVideoCaptionPreferenceResults:(id)a3;
- (void)setVideoCaptionResults:(id)a3;
- (void)setVideoEmbeddingResults:(id)a3;
- (void)setVideoSegmentCaptionResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoAssetAnalysis

- (void)setQuality:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQuality
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatsFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_statsFlags = a3;
}

- (void)setHasStatsFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatsFlags
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTypesWide:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_typesWide = a3;
}

- (void)setHasTypesWide:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTypesWide
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAssetMasterFingerprint
{
  return self->_assetMasterFingerprint != 0;
}

- (BOOL)hasAssetAdjustedFingerprint
{
  return self->_assetAdjustedFingerprint != 0;
}

- (BOOL)hasAssetCloudIdentifier
{
  return self->_assetCloudIdentifier != 0;
}

- (void)clearImageBlurResults
{
}

- (void)addImageBlurResults:(id)a3
{
  id v4 = a3;
  imageBlurResults = self->_imageBlurResults;
  id v8 = v4;
  if (!imageBlurResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageBlurResults;
    self->_imageBlurResults = v6;

    id v4 = v8;
    imageBlurResults = self->_imageBlurResults;
  }
  [(NSMutableArray *)imageBlurResults addObject:v4];
}

- (unint64_t)imageBlurResultsCount
{
  return [(NSMutableArray *)self->_imageBlurResults count];
}

- (id)imageBlurResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageBlurResults objectAtIndex:a3];
}

+ (Class)imageBlurResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageCompositionResults
{
}

- (void)addImageCompositionResults:(id)a3
{
  id v4 = a3;
  imageCompositionResults = self->_imageCompositionResults;
  id v8 = v4;
  if (!imageCompositionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageCompositionResults;
    self->_imageCompositionResults = v6;

    id v4 = v8;
    imageCompositionResults = self->_imageCompositionResults;
  }
  [(NSMutableArray *)imageCompositionResults addObject:v4];
}

- (unint64_t)imageCompositionResultsCount
{
  return [(NSMutableArray *)self->_imageCompositionResults count];
}

- (id)imageCompositionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageCompositionResults objectAtIndex:a3];
}

+ (Class)imageCompositionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageFaceResults
{
}

- (void)addImageFaceResults:(id)a3
{
  id v4 = a3;
  imageFaceResults = self->_imageFaceResults;
  id v8 = v4;
  if (!imageFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageFaceResults;
    self->_imageFaceResults = v6;

    id v4 = v8;
    imageFaceResults = self->_imageFaceResults;
  }
  [(NSMutableArray *)imageFaceResults addObject:v4];
}

- (unint64_t)imageFaceResultsCount
{
  return [(NSMutableArray *)self->_imageFaceResults count];
}

- (id)imageFaceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageFaceResults objectAtIndex:a3];
}

+ (Class)imageFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageFeatureResults
{
}

- (void)addImageFeatureResults:(id)a3
{
  id v4 = a3;
  imageFeatureResults = self->_imageFeatureResults;
  id v8 = v4;
  if (!imageFeatureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageFeatureResults;
    self->_imageFeatureResults = v6;

    id v4 = v8;
    imageFeatureResults = self->_imageFeatureResults;
  }
  [(NSMutableArray *)imageFeatureResults addObject:v4];
}

- (unint64_t)imageFeatureResultsCount
{
  return [(NSMutableArray *)self->_imageFeatureResults count];
}

- (id)imageFeatureResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageFeatureResults objectAtIndex:a3];
}

+ (Class)imageFeatureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageJunkResults
{
}

- (void)addImageJunkResults:(id)a3
{
  id v4 = a3;
  imageJunkResults = self->_imageJunkResults;
  id v8 = v4;
  if (!imageJunkResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageJunkResults;
    self->_imageJunkResults = v6;

    id v4 = v8;
    imageJunkResults = self->_imageJunkResults;
  }
  [(NSMutableArray *)imageJunkResults addObject:v4];
}

- (unint64_t)imageJunkResultsCount
{
  return [(NSMutableArray *)self->_imageJunkResults count];
}

- (id)imageJunkResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageJunkResults objectAtIndex:a3];
}

+ (Class)imageJunkResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageSaliencyResults
{
}

- (void)addImageSaliencyResults:(id)a3
{
  id v4 = a3;
  imageSaliencyResults = self->_imageSaliencyResults;
  id v8 = v4;
  if (!imageSaliencyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageSaliencyResults;
    self->_imageSaliencyResults = v6;

    id v4 = v8;
    imageSaliencyResults = self->_imageSaliencyResults;
  }
  [(NSMutableArray *)imageSaliencyResults addObject:v4];
}

- (unint64_t)imageSaliencyResultsCount
{
  return [(NSMutableArray *)self->_imageSaliencyResults count];
}

- (id)imageSaliencyResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageSaliencyResults objectAtIndex:a3];
}

+ (Class)imageSaliencyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageShotTypeResults
{
}

- (void)addImageShotTypeResults:(id)a3
{
  id v4 = a3;
  imageShotTypeResults = self->_imageShotTypeResults;
  id v8 = v4;
  if (!imageShotTypeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageShotTypeResults;
    self->_imageShotTypeResults = v6;

    id v4 = v8;
    imageShotTypeResults = self->_imageShotTypeResults;
  }
  [(NSMutableArray *)imageShotTypeResults addObject:v4];
}

- (unint64_t)imageShotTypeResultsCount
{
  return [(NSMutableArray *)self->_imageShotTypeResults count];
}

- (id)imageShotTypeResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageShotTypeResults objectAtIndex:a3];
}

+ (Class)imageShotTypeResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImagePetsResults
{
}

- (void)addImagePetsResults:(id)a3
{
  id v4 = a3;
  imagePetsResults = self->_imagePetsResults;
  id v8 = v4;
  if (!imagePetsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imagePetsResults;
    self->_imagePetsResults = v6;

    id v4 = v8;
    imagePetsResults = self->_imagePetsResults;
  }
  [(NSMutableArray *)imagePetsResults addObject:v4];
}

- (unint64_t)imagePetsResultsCount
{
  return [(NSMutableArray *)self->_imagePetsResults count];
}

- (id)imagePetsResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imagePetsResults objectAtIndex:a3];
}

+ (Class)imagePetsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImagePetsFaceResults
{
}

- (void)addImagePetsFaceResults:(id)a3
{
  id v4 = a3;
  imagePetsFaceResults = self->_imagePetsFaceResults;
  id v8 = v4;
  if (!imagePetsFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imagePetsFaceResults;
    self->_imagePetsFaceResults = v6;

    id v4 = v8;
    imagePetsFaceResults = self->_imagePetsFaceResults;
  }
  [(NSMutableArray *)imagePetsFaceResults addObject:v4];
}

- (unint64_t)imagePetsFaceResultsCount
{
  return [(NSMutableArray *)self->_imagePetsFaceResults count];
}

- (id)imagePetsFaceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imagePetsFaceResults objectAtIndex:a3];
}

+ (Class)imagePetsFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageSceneprintResults
{
}

- (void)addImageSceneprintResults:(id)a3
{
  id v4 = a3;
  imageSceneprintResults = self->_imageSceneprintResults;
  id v8 = v4;
  if (!imageSceneprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageSceneprintResults;
    self->_imageSceneprintResults = v6;

    id v4 = v8;
    imageSceneprintResults = self->_imageSceneprintResults;
  }
  [(NSMutableArray *)imageSceneprintResults addObject:v4];
}

- (unint64_t)imageSceneprintResultsCount
{
  return [(NSMutableArray *)self->_imageSceneprintResults count];
}

- (id)imageSceneprintResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageSceneprintResults objectAtIndex:a3];
}

+ (Class)imageSceneprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoEffectsResults
{
}

- (void)addLivePhotoEffectsResults:(id)a3
{
  id v4 = a3;
  livePhotoEffectsResults = self->_livePhotoEffectsResults;
  id v8 = v4;
  if (!livePhotoEffectsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoEffectsResults;
    self->_livePhotoEffectsResults = v6;

    id v4 = v8;
    livePhotoEffectsResults = self->_livePhotoEffectsResults;
  }
  [(NSMutableArray *)livePhotoEffectsResults addObject:v4];
}

- (unint64_t)livePhotoEffectsResultsCount
{
  return [(NSMutableArray *)self->_livePhotoEffectsResults count];
}

- (id)livePhotoEffectsResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoEffectsResults objectAtIndex:a3];
}

+ (Class)livePhotoEffectsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoRecommendationResults
{
}

- (void)addLivePhotoRecommendationResults:(id)a3
{
  id v4 = a3;
  livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  id v8 = v4;
  if (!livePhotoRecommendationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoRecommendationResults;
    self->_livePhotoRecommendationResults = v6;

    id v4 = v8;
    livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  }
  [(NSMutableArray *)livePhotoRecommendationResults addObject:v4];
}

- (unint64_t)livePhotoRecommendationResultsCount
{
  return [(NSMutableArray *)self->_livePhotoRecommendationResults count];
}

- (id)livePhotoRecommendationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoRecommendationResults objectAtIndex:a3];
}

+ (Class)livePhotoRecommendationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoSharpnessResults
{
}

- (void)addLivePhotoSharpnessResults:(id)a3
{
  id v4 = a3;
  livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  id v8 = v4;
  if (!livePhotoSharpnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoSharpnessResults;
    self->_livePhotoSharpnessResults = v6;

    id v4 = v8;
    livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  }
  [(NSMutableArray *)livePhotoSharpnessResults addObject:v4];
}

- (unint64_t)livePhotoSharpnessResultsCount
{
  return [(NSMutableArray *)self->_livePhotoSharpnessResults count];
}

- (id)livePhotoSharpnessResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoSharpnessResults objectAtIndex:a3];
}

+ (Class)livePhotoSharpnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoKeyFrameResults
{
}

- (void)addLivePhotoKeyFrameResults:(id)a3
{
  id v4 = a3;
  livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  id v8 = v4;
  if (!livePhotoKeyFrameResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoKeyFrameResults;
    self->_livePhotoKeyFrameResults = v6;

    id v4 = v8;
    livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  }
  [(NSMutableArray *)livePhotoKeyFrameResults addObject:v4];
}

- (unint64_t)livePhotoKeyFrameResultsCount
{
  return [(NSMutableArray *)self->_livePhotoKeyFrameResults count];
}

- (id)livePhotoKeyFrameResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoKeyFrameResults objectAtIndex:a3];
}

+ (Class)livePhotoKeyFrameResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoKeyFrameStillResults
{
}

- (void)addLivePhotoKeyFrameStillResults:(id)a3
{
  id v4 = a3;
  livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  id v8 = v4;
  if (!livePhotoKeyFrameStillResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoKeyFrameStillResults;
    self->_livePhotoKeyFrameStillResults = v6;

    id v4 = v8;
    livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  }
  [(NSMutableArray *)livePhotoKeyFrameStillResults addObject:v4];
}

- (unint64_t)livePhotoKeyFrameStillResultsCount
{
  return [(NSMutableArray *)self->_livePhotoKeyFrameStillResults count];
}

- (id)livePhotoKeyFrameStillResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoKeyFrameStillResults objectAtIndex:a3];
}

+ (Class)livePhotoKeyFrameStillResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoSettlingEffectGatingResults
{
}

- (void)addLivePhotoSettlingEffectGatingResults:(id)a3
{
  id v4 = a3;
  livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  id v8 = v4;
  if (!livePhotoSettlingEffectGatingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoSettlingEffectGatingResults;
    self->_livePhotoSettlingEffectGatingResults = v6;

    id v4 = v8;
    livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  }
  [(NSMutableArray *)livePhotoSettlingEffectGatingResults addObject:v4];
}

- (unint64_t)livePhotoSettlingEffectGatingResultsCount
{
  return [(NSMutableArray *)self->_livePhotoSettlingEffectGatingResults count];
}

- (id)livePhotoSettlingEffectGatingResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoSettlingEffectGatingResults objectAtIndex:a3];
}

+ (Class)livePhotoSettlingEffectGatingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieActivityLevelResults
{
}

- (void)addMovieActivityLevelResults:(id)a3
{
  id v4 = a3;
  movieActivityLevelResults = self->_movieActivityLevelResults;
  id v8 = v4;
  if (!movieActivityLevelResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieActivityLevelResults;
    self->_movieActivityLevelResults = v6;

    id v4 = v8;
    movieActivityLevelResults = self->_movieActivityLevelResults;
  }
  [(NSMutableArray *)movieActivityLevelResults addObject:v4];
}

- (unint64_t)movieActivityLevelResultsCount
{
  return [(NSMutableArray *)self->_movieActivityLevelResults count];
}

- (id)movieActivityLevelResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieActivityLevelResults objectAtIndex:a3];
}

+ (Class)movieActivityLevelResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieCameraMotionResults
{
}

- (void)addMovieCameraMotionResults:(id)a3
{
  id v4 = a3;
  movieCameraMotionResults = self->_movieCameraMotionResults;
  id v8 = v4;
  if (!movieCameraMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieCameraMotionResults;
    self->_movieCameraMotionResults = v6;

    id v4 = v8;
    movieCameraMotionResults = self->_movieCameraMotionResults;
  }
  [(NSMutableArray *)movieCameraMotionResults addObject:v4];
}

- (unint64_t)movieCameraMotionResultsCount
{
  return [(NSMutableArray *)self->_movieCameraMotionResults count];
}

- (id)movieCameraMotionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieCameraMotionResults objectAtIndex:a3];
}

+ (Class)movieCameraMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieClassificationResults
{
}

- (void)addMovieClassificationResults:(id)a3
{
  id v4 = a3;
  movieClassificationResults = self->_movieClassificationResults;
  id v8 = v4;
  if (!movieClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieClassificationResults;
    self->_movieClassificationResults = v6;

    id v4 = v8;
    movieClassificationResults = self->_movieClassificationResults;
  }
  [(NSMutableArray *)movieClassificationResults addObject:v4];
}

- (unint64_t)movieClassificationResultsCount
{
  return [(NSMutableArray *)self->_movieClassificationResults count];
}

- (id)movieClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieClassificationResults objectAtIndex:a3];
}

+ (Class)movieClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFaceResults
{
}

- (void)addMovieFaceResults:(id)a3
{
  id v4 = a3;
  movieFaceResults = self->_movieFaceResults;
  id v8 = v4;
  if (!movieFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieFaceResults;
    self->_movieFaceResults = v6;

    id v4 = v8;
    movieFaceResults = self->_movieFaceResults;
  }
  [(NSMutableArray *)movieFaceResults addObject:v4];
}

- (unint64_t)movieFaceResultsCount
{
  return [(NSMutableArray *)self->_movieFaceResults count];
}

- (id)movieFaceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieFaceResults objectAtIndex:a3];
}

+ (Class)movieFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFaceprintResults
{
}

- (void)addMovieFaceprintResults:(id)a3
{
  id v4 = a3;
  movieFaceprintResults = self->_movieFaceprintResults;
  id v8 = v4;
  if (!movieFaceprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieFaceprintResults;
    self->_movieFaceprintResults = v6;

    id v4 = v8;
    movieFaceprintResults = self->_movieFaceprintResults;
  }
  [(NSMutableArray *)movieFaceprintResults addObject:v4];
}

- (unint64_t)movieFaceprintResultsCount
{
  return [(NSMutableArray *)self->_movieFaceprintResults count];
}

- (id)movieFaceprintResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieFaceprintResults objectAtIndex:a3];
}

+ (Class)movieFaceprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFeatureResults
{
}

- (void)addMovieFeatureResults:(id)a3
{
  id v4 = a3;
  movieFeatureResults = self->_movieFeatureResults;
  id v8 = v4;
  if (!movieFeatureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieFeatureResults;
    self->_movieFeatureResults = v6;

    id v4 = v8;
    movieFeatureResults = self->_movieFeatureResults;
  }
  [(NSMutableArray *)movieFeatureResults addObject:v4];
}

- (unint64_t)movieFeatureResultsCount
{
  return [(NSMutableArray *)self->_movieFeatureResults count];
}

- (id)movieFeatureResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieFeatureResults objectAtIndex:a3];
}

+ (Class)movieFeatureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFineSubjectMotionResults
{
}

- (void)addMovieFineSubjectMotionResults:(id)a3
{
  id v4 = a3;
  movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  id v8 = v4;
  if (!movieFineSubjectMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieFineSubjectMotionResults;
    self->_movieFineSubjectMotionResults = v6;

    id v4 = v8;
    movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  }
  [(NSMutableArray *)movieFineSubjectMotionResults addObject:v4];
}

- (unint64_t)movieFineSubjectMotionResultsCount
{
  return [(NSMutableArray *)self->_movieFineSubjectMotionResults count];
}

- (id)movieFineSubjectMotionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieFineSubjectMotionResults objectAtIndex:a3];
}

+ (Class)movieFineSubjectMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieInterestingnessResults
{
}

- (void)addMovieInterestingnessResults:(id)a3
{
  id v4 = a3;
  movieInterestingnessResults = self->_movieInterestingnessResults;
  id v8 = v4;
  if (!movieInterestingnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieInterestingnessResults;
    self->_movieInterestingnessResults = v6;

    id v4 = v8;
    movieInterestingnessResults = self->_movieInterestingnessResults;
  }
  [(NSMutableArray *)movieInterestingnessResults addObject:v4];
}

- (unint64_t)movieInterestingnessResultsCount
{
  return [(NSMutableArray *)self->_movieInterestingnessResults count];
}

- (id)movieInterestingnessResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieInterestingnessResults objectAtIndex:a3];
}

+ (Class)movieInterestingnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieMovingObjectResults
{
}

- (void)addMovieMovingObjectResults:(id)a3
{
  id v4 = a3;
  movieMovingObjectResults = self->_movieMovingObjectResults;
  id v8 = v4;
  if (!movieMovingObjectResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieMovingObjectResults;
    self->_movieMovingObjectResults = v6;

    id v4 = v8;
    movieMovingObjectResults = self->_movieMovingObjectResults;
  }
  [(NSMutableArray *)movieMovingObjectResults addObject:v4];
}

- (unint64_t)movieMovingObjectResultsCount
{
  return [(NSMutableArray *)self->_movieMovingObjectResults count];
}

- (id)movieMovingObjectResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieMovingObjectResults objectAtIndex:a3];
}

+ (Class)movieMovingObjectResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieMusicResults
{
}

- (void)addMovieMusicResults:(id)a3
{
  id v4 = a3;
  movieMusicResults = self->_movieMusicResults;
  id v8 = v4;
  if (!movieMusicResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieMusicResults;
    self->_movieMusicResults = v6;

    id v4 = v8;
    movieMusicResults = self->_movieMusicResults;
  }
  [(NSMutableArray *)movieMusicResults addObject:v4];
}

- (unint64_t)movieMusicResultsCount
{
  return [(NSMutableArray *)self->_movieMusicResults count];
}

- (id)movieMusicResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieMusicResults objectAtIndex:a3];
}

+ (Class)movieMusicResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieObstructionResults
{
}

- (void)addMovieObstructionResults:(id)a3
{
  id v4 = a3;
  movieObstructionResults = self->_movieObstructionResults;
  id v8 = v4;
  if (!movieObstructionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieObstructionResults;
    self->_movieObstructionResults = v6;

    id v4 = v8;
    movieObstructionResults = self->_movieObstructionResults;
  }
  [(NSMutableArray *)movieObstructionResults addObject:v4];
}

- (unint64_t)movieObstructionResultsCount
{
  return [(NSMutableArray *)self->_movieObstructionResults count];
}

- (id)movieObstructionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieObstructionResults objectAtIndex:a3];
}

+ (Class)movieObstructionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieOrientationResults
{
}

- (void)addMovieOrientationResults:(id)a3
{
  id v4 = a3;
  movieOrientationResults = self->_movieOrientationResults;
  id v8 = v4;
  if (!movieOrientationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieOrientationResults;
    self->_movieOrientationResults = v6;

    id v4 = v8;
    movieOrientationResults = self->_movieOrientationResults;
  }
  [(NSMutableArray *)movieOrientationResults addObject:v4];
}

- (unint64_t)movieOrientationResultsCount
{
  return [(NSMutableArray *)self->_movieOrientationResults count];
}

- (id)movieOrientationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieOrientationResults objectAtIndex:a3];
}

+ (Class)movieOrientationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePreEncodeResults
{
}

- (void)addMoviePreEncodeResults:(id)a3
{
  id v4 = a3;
  moviePreEncodeResults = self->_moviePreEncodeResults;
  id v8 = v4;
  if (!moviePreEncodeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_moviePreEncodeResults;
    self->_moviePreEncodeResults = v6;

    id v4 = v8;
    moviePreEncodeResults = self->_moviePreEncodeResults;
  }
  [(NSMutableArray *)moviePreEncodeResults addObject:v4];
}

- (unint64_t)moviePreEncodeResultsCount
{
  return [(NSMutableArray *)self->_moviePreEncodeResults count];
}

- (id)moviePreEncodeResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_moviePreEncodeResults objectAtIndex:a3];
}

+ (Class)moviePreEncodeResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieQualityResults
{
}

- (void)addMovieQualityResults:(id)a3
{
  id v4 = a3;
  movieQualityResults = self->_movieQualityResults;
  id v8 = v4;
  if (!movieQualityResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieQualityResults;
    self->_movieQualityResults = v6;

    id v4 = v8;
    movieQualityResults = self->_movieQualityResults;
  }
  [(NSMutableArray *)movieQualityResults addObject:v4];
}

- (unint64_t)movieQualityResultsCount
{
  return [(NSMutableArray *)self->_movieQualityResults count];
}

- (id)movieQualityResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieQualityResults objectAtIndex:a3];
}

+ (Class)movieQualityResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSaliencyResults
{
}

- (void)addMovieSaliencyResults:(id)a3
{
  id v4 = a3;
  movieSaliencyResults = self->_movieSaliencyResults;
  id v8 = v4;
  if (!movieSaliencyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSaliencyResults;
    self->_movieSaliencyResults = v6;

    id v4 = v8;
    movieSaliencyResults = self->_movieSaliencyResults;
  }
  [(NSMutableArray *)movieSaliencyResults addObject:v4];
}

- (unint64_t)movieSaliencyResultsCount
{
  return [(NSMutableArray *)self->_movieSaliencyResults count];
}

- (id)movieSaliencyResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSaliencyResults objectAtIndex:a3];
}

+ (Class)movieSaliencyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSceneResults
{
}

- (void)addMovieSceneResults:(id)a3
{
  id v4 = a3;
  movieSceneResults = self->_movieSceneResults;
  id v8 = v4;
  if (!movieSceneResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSceneResults;
    self->_movieSceneResults = v6;

    id v4 = v8;
    movieSceneResults = self->_movieSceneResults;
  }
  [(NSMutableArray *)movieSceneResults addObject:v4];
}

- (unint64_t)movieSceneResultsCount
{
  return [(NSMutableArray *)self->_movieSceneResults count];
}

- (id)movieSceneResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSceneResults objectAtIndex:a3];
}

+ (Class)movieSceneResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSceneprintResults
{
}

- (void)addMovieSceneprintResults:(id)a3
{
  id v4 = a3;
  movieSceneprintResults = self->_movieSceneprintResults;
  id v8 = v4;
  if (!movieSceneprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSceneprintResults;
    self->_movieSceneprintResults = v6;

    id v4 = v8;
    movieSceneprintResults = self->_movieSceneprintResults;
  }
  [(NSMutableArray *)movieSceneprintResults addObject:v4];
}

- (unint64_t)movieSceneprintResultsCount
{
  return [(NSMutableArray *)self->_movieSceneprintResults count];
}

- (id)movieSceneprintResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSceneprintResults objectAtIndex:a3];
}

+ (Class)movieSceneprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSubjectMotionResults
{
}

- (void)addMovieSubjectMotionResults:(id)a3
{
  id v4 = a3;
  movieSubjectMotionResults = self->_movieSubjectMotionResults;
  id v8 = v4;
  if (!movieSubjectMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSubjectMotionResults;
    self->_movieSubjectMotionResults = v6;

    id v4 = v8;
    movieSubjectMotionResults = self->_movieSubjectMotionResults;
  }
  [(NSMutableArray *)movieSubjectMotionResults addObject:v4];
}

- (unint64_t)movieSubjectMotionResultsCount
{
  return [(NSMutableArray *)self->_movieSubjectMotionResults count];
}

- (id)movieSubjectMotionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSubjectMotionResults objectAtIndex:a3];
}

+ (Class)movieSubjectMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSubtleMotionResults
{
}

- (void)addMovieSubtleMotionResults:(id)a3
{
  id v4 = a3;
  movieSubtleMotionResults = self->_movieSubtleMotionResults;
  id v8 = v4;
  if (!movieSubtleMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSubtleMotionResults;
    self->_movieSubtleMotionResults = v6;

    id v4 = v8;
    movieSubtleMotionResults = self->_movieSubtleMotionResults;
  }
  [(NSMutableArray *)movieSubtleMotionResults addObject:v4];
}

- (unint64_t)movieSubtleMotionResultsCount
{
  return [(NSMutableArray *)self->_movieSubtleMotionResults count];
}

- (id)movieSubtleMotionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSubtleMotionResults objectAtIndex:a3];
}

+ (Class)movieSubtleMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieUtteranceResults
{
}

- (void)addMovieUtteranceResults:(id)a3
{
  id v4 = a3;
  movieUtteranceResults = self->_movieUtteranceResults;
  id v8 = v4;
  if (!movieUtteranceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieUtteranceResults;
    self->_movieUtteranceResults = v6;

    id v4 = v8;
    movieUtteranceResults = self->_movieUtteranceResults;
  }
  [(NSMutableArray *)movieUtteranceResults addObject:v4];
}

- (unint64_t)movieUtteranceResultsCount
{
  return [(NSMutableArray *)self->_movieUtteranceResults count];
}

- (id)movieUtteranceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieUtteranceResults objectAtIndex:a3];
}

+ (Class)movieUtteranceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieVoiceResults
{
}

- (void)addMovieVoiceResults:(id)a3
{
  id v4 = a3;
  movieVoiceResults = self->_movieVoiceResults;
  id v8 = v4;
  if (!movieVoiceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieVoiceResults;
    self->_movieVoiceResults = v6;

    id v4 = v8;
    movieVoiceResults = self->_movieVoiceResults;
  }
  [(NSMutableArray *)movieVoiceResults addObject:v4];
}

- (unint64_t)movieVoiceResultsCount
{
  return [(NSMutableArray *)self->_movieVoiceResults count];
}

- (id)movieVoiceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieVoiceResults objectAtIndex:a3];
}

+ (Class)movieVoiceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSummaryResults
{
}

- (void)addMovieSummaryResults:(id)a3
{
  id v4 = a3;
  movieSummaryResults = self->_movieSummaryResults;
  id v8 = v4;
  if (!movieSummaryResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSummaryResults;
    self->_movieSummaryResults = v6;

    id v4 = v8;
    movieSummaryResults = self->_movieSummaryResults;
  }
  [(NSMutableArray *)movieSummaryResults addObject:v4];
}

- (unint64_t)movieSummaryResultsCount
{
  return [(NSMutableArray *)self->_movieSummaryResults count];
}

- (id)movieSummaryResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSummaryResults objectAtIndex:a3];
}

+ (Class)movieSummaryResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHighlightResults
{
}

- (void)addMovieHighlightResults:(id)a3
{
  id v4 = a3;
  movieHighlightResults = self->_movieHighlightResults;
  id v8 = v4;
  if (!movieHighlightResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieHighlightResults;
    self->_movieHighlightResults = v6;

    id v4 = v8;
    movieHighlightResults = self->_movieHighlightResults;
  }
  [(NSMutableArray *)movieHighlightResults addObject:v4];
}

- (unint64_t)movieHighlightResultsCount
{
  return [(NSMutableArray *)self->_movieHighlightResults count];
}

- (id)movieHighlightResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieHighlightResults objectAtIndex:a3];
}

+ (Class)movieHighlightResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageExposureResults
{
}

- (void)addImageExposureResults:(id)a3
{
  id v4 = a3;
  imageExposureResults = self->_imageExposureResults;
  id v8 = v4;
  if (!imageExposureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageExposureResults;
    self->_imageExposureResults = v6;

    id v4 = v8;
    imageExposureResults = self->_imageExposureResults;
  }
  [(NSMutableArray *)imageExposureResults addObject:v4];
}

- (unint64_t)imageExposureResultsCount
{
  return [(NSMutableArray *)self->_imageExposureResults count];
}

- (id)imageExposureResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageExposureResults objectAtIndex:a3];
}

+ (Class)imageExposureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageHumanPoseResults
{
}

- (void)addImageHumanPoseResults:(id)a3
{
  id v4 = a3;
  imageHumanPoseResults = self->_imageHumanPoseResults;
  id v8 = v4;
  if (!imageHumanPoseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageHumanPoseResults;
    self->_imageHumanPoseResults = v6;

    id v4 = v8;
    imageHumanPoseResults = self->_imageHumanPoseResults;
  }
  [(NSMutableArray *)imageHumanPoseResults addObject:v4];
}

- (unint64_t)imageHumanPoseResultsCount
{
  return [(NSMutableArray *)self->_imageHumanPoseResults count];
}

- (id)imageHumanPoseResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageHumanPoseResults objectAtIndex:a3];
}

+ (Class)imageHumanPoseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanPoseResults
{
}

- (void)addMovieHumanPoseResults:(id)a3
{
  id v4 = a3;
  movieHumanPoseResults = self->_movieHumanPoseResults;
  id v8 = v4;
  if (!movieHumanPoseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieHumanPoseResults;
    self->_movieHumanPoseResults = v6;

    id v4 = v8;
    movieHumanPoseResults = self->_movieHumanPoseResults;
  }
  [(NSMutableArray *)movieHumanPoseResults addObject:v4];
}

- (unint64_t)movieHumanPoseResultsCount
{
  return [(NSMutableArray *)self->_movieHumanPoseResults count];
}

- (id)movieHumanPoseResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieHumanPoseResults objectAtIndex:a3];
}

+ (Class)movieHumanPoseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieApplauseResults
{
}

- (void)addMovieApplauseResults:(id)a3
{
  id v4 = a3;
  movieApplauseResults = self->_movieApplauseResults;
  id v8 = v4;
  if (!movieApplauseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieApplauseResults;
    self->_movieApplauseResults = v6;

    id v4 = v8;
    movieApplauseResults = self->_movieApplauseResults;
  }
  [(NSMutableArray *)movieApplauseResults addObject:v4];
}

- (unint64_t)movieApplauseResultsCount
{
  return [(NSMutableArray *)self->_movieApplauseResults count];
}

- (id)movieApplauseResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieApplauseResults objectAtIndex:a3];
}

+ (Class)movieApplauseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieBabbleResults
{
}

- (void)addMovieBabbleResults:(id)a3
{
  id v4 = a3;
  movieBabbleResults = self->_movieBabbleResults;
  id v8 = v4;
  if (!movieBabbleResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieBabbleResults;
    self->_movieBabbleResults = v6;

    id v4 = v8;
    movieBabbleResults = self->_movieBabbleResults;
  }
  [(NSMutableArray *)movieBabbleResults addObject:v4];
}

- (unint64_t)movieBabbleResultsCount
{
  return [(NSMutableArray *)self->_movieBabbleResults count];
}

- (id)movieBabbleResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieBabbleResults objectAtIndex:a3];
}

+ (Class)movieBabbleResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieCheeringResults
{
}

- (void)addMovieCheeringResults:(id)a3
{
  id v4 = a3;
  movieCheeringResults = self->_movieCheeringResults;
  id v8 = v4;
  if (!movieCheeringResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieCheeringResults;
    self->_movieCheeringResults = v6;

    id v4 = v8;
    movieCheeringResults = self->_movieCheeringResults;
  }
  [(NSMutableArray *)movieCheeringResults addObject:v4];
}

- (unint64_t)movieCheeringResultsCount
{
  return [(NSMutableArray *)self->_movieCheeringResults count];
}

- (id)movieCheeringResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieCheeringResults objectAtIndex:a3];
}

+ (Class)movieCheeringResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieLaughterResults
{
}

- (void)addMovieLaughterResults:(id)a3
{
  id v4 = a3;
  movieLaughterResults = self->_movieLaughterResults;
  id v8 = v4;
  if (!movieLaughterResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieLaughterResults;
    self->_movieLaughterResults = v6;

    id v4 = v8;
    movieLaughterResults = self->_movieLaughterResults;
  }
  [(NSMutableArray *)movieLaughterResults addObject:v4];
}

- (unint64_t)movieLaughterResultsCount
{
  return [(NSMutableArray *)self->_movieLaughterResults count];
}

- (id)movieLaughterResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieLaughterResults objectAtIndex:a3];
}

+ (Class)movieLaughterResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanActionResults
{
}

- (void)addMovieHumanActionResults:(id)a3
{
  id v4 = a3;
  movieHumanActionResults = self->_movieHumanActionResults;
  id v8 = v4;
  if (!movieHumanActionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieHumanActionResults;
    self->_movieHumanActionResults = v6;

    id v4 = v8;
    movieHumanActionResults = self->_movieHumanActionResults;
  }
  [(NSMutableArray *)movieHumanActionResults addObject:v4];
}

- (unint64_t)movieHumanActionResultsCount
{
  return [(NSMutableArray *)self->_movieHumanActionResults count];
}

- (id)movieHumanActionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieHumanActionResults objectAtIndex:a3];
}

+ (Class)movieHumanActionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieLoudnessResults
{
}

- (void)addMovieLoudnessResults:(id)a3
{
  id v4 = a3;
  movieLoudnessResults = self->_movieLoudnessResults;
  id v8 = v4;
  if (!movieLoudnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieLoudnessResults;
    self->_movieLoudnessResults = v6;

    id v4 = v8;
    movieLoudnessResults = self->_movieLoudnessResults;
  }
  [(NSMutableArray *)movieLoudnessResults addObject:v4];
}

- (unint64_t)movieLoudnessResultsCount
{
  return [(NSMutableArray *)self->_movieLoudnessResults count];
}

- (id)movieLoudnessResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieLoudnessResults objectAtIndex:a3];
}

+ (Class)movieLoudnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePetsResults
{
}

- (void)addMoviePetsResults:(id)a3
{
  id v4 = a3;
  moviePetsResults = self->_moviePetsResults;
  id v8 = v4;
  if (!moviePetsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_moviePetsResults;
    self->_moviePetsResults = v6;

    id v4 = v8;
    moviePetsResults = self->_moviePetsResults;
  }
  [(NSMutableArray *)moviePetsResults addObject:v4];
}

- (unint64_t)moviePetsResultsCount
{
  return [(NSMutableArray *)self->_moviePetsResults count];
}

- (id)moviePetsResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_moviePetsResults objectAtIndex:a3];
}

+ (Class)moviePetsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePetsFaceResults
{
}

- (void)addMoviePetsFaceResults:(id)a3
{
  id v4 = a3;
  moviePetsFaceResults = self->_moviePetsFaceResults;
  id v8 = v4;
  if (!moviePetsFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_moviePetsFaceResults;
    self->_moviePetsFaceResults = v6;

    id v4 = v8;
    moviePetsFaceResults = self->_moviePetsFaceResults;
  }
  [(NSMutableArray *)moviePetsFaceResults addObject:v4];
}

- (unint64_t)moviePetsFaceResultsCount
{
  return [(NSMutableArray *)self->_moviePetsFaceResults count];
}

- (id)moviePetsFaceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_moviePetsFaceResults objectAtIndex:a3];
}

+ (Class)moviePetsFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieStabilizationResults
{
}

- (void)addMovieStabilizationResults:(id)a3
{
  id v4 = a3;
  movieStabilizationResults = self->_movieStabilizationResults;
  id v8 = v4;
  if (!movieStabilizationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieStabilizationResults;
    self->_movieStabilizationResults = v6;

    id v4 = v8;
    movieStabilizationResults = self->_movieStabilizationResults;
  }
  [(NSMutableArray *)movieStabilizationResults addObject:v4];
}

- (unint64_t)movieStabilizationResultsCount
{
  return [(NSMutableArray *)self->_movieStabilizationResults count];
}

- (id)movieStabilizationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieStabilizationResults objectAtIndex:a3];
}

+ (Class)movieStabilizationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHighlightScoreResults
{
}

- (void)addMovieHighlightScoreResults:(id)a3
{
  id v4 = a3;
  movieHighlightScoreResults = self->_movieHighlightScoreResults;
  id v8 = v4;
  if (!movieHighlightScoreResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieHighlightScoreResults;
    self->_movieHighlightScoreResults = v6;

    id v4 = v8;
    movieHighlightScoreResults = self->_movieHighlightScoreResults;
  }
  [(NSMutableArray *)movieHighlightScoreResults addObject:v4];
}

- (unint64_t)movieHighlightScoreResultsCount
{
  return [(NSMutableArray *)self->_movieHighlightScoreResults count];
}

- (id)movieHighlightScoreResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieHighlightScoreResults objectAtIndex:a3];
}

+ (Class)movieHighlightScoreResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoHumanActionClassificationResults
{
}

- (void)addLivePhotoHumanActionClassificationResults:(id)a3
{
  id v4 = a3;
  livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  id v8 = v4;
  if (!livePhotoHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_livePhotoHumanActionClassificationResults;
    self->_livePhotoHumanActionClassificationResults = v6;

    id v4 = v8;
    livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  }
  [(NSMutableArray *)livePhotoHumanActionClassificationResults addObject:v4];
}

- (unint64_t)livePhotoHumanActionClassificationResultsCount
{
  return [(NSMutableArray *)self->_livePhotoHumanActionClassificationResults count];
}

- (id)livePhotoHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_livePhotoHumanActionClassificationResults objectAtIndex:a3];
}

+ (Class)livePhotoHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieAudioQualityResults
{
}

- (void)addMovieAudioQualityResults:(id)a3
{
  id v4 = a3;
  movieAudioQualityResults = self->_movieAudioQualityResults;
  id v8 = v4;
  if (!movieAudioQualityResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieAudioQualityResults;
    self->_movieAudioQualityResults = v6;

    id v4 = v8;
    movieAudioQualityResults = self->_movieAudioQualityResults;
  }
  [(NSMutableArray *)movieAudioQualityResults addObject:v4];
}

- (unint64_t)movieAudioQualityResultsCount
{
  return [(NSMutableArray *)self->_movieAudioQualityResults count];
}

- (id)movieAudioQualityResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieAudioQualityResults objectAtIndex:a3];
}

+ (Class)movieAudioQualityResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSafetyResults
{
}

- (void)addMovieSafetyResults:(id)a3
{
  id v4 = a3;
  movieSafetyResults = self->_movieSafetyResults;
  id v8 = v4;
  if (!movieSafetyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieSafetyResults;
    self->_movieSafetyResults = v6;

    id v4 = v8;
    movieSafetyResults = self->_movieSafetyResults;
  }
  [(NSMutableArray *)movieSafetyResults addObject:v4];
}

- (unint64_t)movieSafetyResultsCount
{
  return [(NSMutableArray *)self->_movieSafetyResults count];
}

- (id)movieSafetyResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieSafetyResults objectAtIndex:a3];
}

+ (Class)movieSafetyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieClassificationResults
{
}

- (void)addFilesystemMovieClassificationResults:(id)a3
{
  id v4 = a3;
  filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  id v8 = v4;
  if (!filesystemMovieClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieClassificationResults;
    self->_filesystemMovieClassificationResults = v6;

    id v4 = v8;
    filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  }
  [(NSMutableArray *)filesystemMovieClassificationResults addObject:v4];
}

- (unint64_t)filesystemMovieClassificationResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieClassificationResults count];
}

- (id)filesystemMovieClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieClassificationResults objectAtIndex:a3];
}

+ (Class)filesystemMovieClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieHumanActionClassificationResults
{
}

- (void)addFilesystemMovieHumanActionClassificationResults:(id)a3
{
  id v4 = a3;
  filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  id v8 = v4;
  if (!filesystemMovieHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieHumanActionClassificationResults;
    self->_filesystemMovieHumanActionClassificationResults = v6;

    id v4 = v8;
    filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  }
  [(NSMutableArray *)filesystemMovieHumanActionClassificationResults addObject:v4];
}

- (unint64_t)filesystemMovieHumanActionClassificationResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieHumanActionClassificationResults count];
}

- (id)filesystemMovieHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieHumanActionClassificationResults objectAtIndex:a3];
}

+ (Class)filesystemMovieHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieApplauseResults
{
}

- (void)addFilesystemMovieApplauseResults:(id)a3
{
  id v4 = a3;
  filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  id v8 = v4;
  if (!filesystemMovieApplauseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieApplauseResults;
    self->_filesystemMovieApplauseResults = v6;

    id v4 = v8;
    filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  }
  [(NSMutableArray *)filesystemMovieApplauseResults addObject:v4];
}

- (unint64_t)filesystemMovieApplauseResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieApplauseResults count];
}

- (id)filesystemMovieApplauseResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieApplauseResults objectAtIndex:a3];
}

+ (Class)filesystemMovieApplauseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieBabbleResults
{
}

- (void)addFilesystemMovieBabbleResults:(id)a3
{
  id v4 = a3;
  filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  id v8 = v4;
  if (!filesystemMovieBabbleResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieBabbleResults;
    self->_filesystemMovieBabbleResults = v6;

    id v4 = v8;
    filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  }
  [(NSMutableArray *)filesystemMovieBabbleResults addObject:v4];
}

- (unint64_t)filesystemMovieBabbleResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieBabbleResults count];
}

- (id)filesystemMovieBabbleResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieBabbleResults objectAtIndex:a3];
}

+ (Class)filesystemMovieBabbleResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieCheeringResults
{
}

- (void)addFilesystemMovieCheeringResults:(id)a3
{
  id v4 = a3;
  filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  id v8 = v4;
  if (!filesystemMovieCheeringResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieCheeringResults;
    self->_filesystemMovieCheeringResults = v6;

    id v4 = v8;
    filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  }
  [(NSMutableArray *)filesystemMovieCheeringResults addObject:v4];
}

- (unint64_t)filesystemMovieCheeringResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieCheeringResults count];
}

- (id)filesystemMovieCheeringResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieCheeringResults objectAtIndex:a3];
}

+ (Class)filesystemMovieCheeringResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieLaughterResults
{
}

- (void)addFilesystemMovieLaughterResults:(id)a3
{
  id v4 = a3;
  filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  id v8 = v4;
  if (!filesystemMovieLaughterResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieLaughterResults;
    self->_filesystemMovieLaughterResults = v6;

    id v4 = v8;
    filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  }
  [(NSMutableArray *)filesystemMovieLaughterResults addObject:v4];
}

- (unint64_t)filesystemMovieLaughterResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieLaughterResults count];
}

- (id)filesystemMovieLaughterResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieLaughterResults objectAtIndex:a3];
}

+ (Class)filesystemMovieLaughterResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieMusicResults
{
}

- (void)addFilesystemMovieMusicResults:(id)a3
{
  id v4 = a3;
  filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  id v8 = v4;
  if (!filesystemMovieMusicResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieMusicResults;
    self->_filesystemMovieMusicResults = v6;

    id v4 = v8;
    filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  }
  [(NSMutableArray *)filesystemMovieMusicResults addObject:v4];
}

- (unint64_t)filesystemMovieMusicResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieMusicResults count];
}

- (id)filesystemMovieMusicResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieMusicResults objectAtIndex:a3];
}

+ (Class)filesystemMovieMusicResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieVoiceResults
{
}

- (void)addFilesystemMovieVoiceResults:(id)a3
{
  id v4 = a3;
  filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  id v8 = v4;
  if (!filesystemMovieVoiceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filesystemMovieVoiceResults;
    self->_filesystemMovieVoiceResults = v6;

    id v4 = v8;
    filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  }
  [(NSMutableArray *)filesystemMovieVoiceResults addObject:v4];
}

- (unint64_t)filesystemMovieVoiceResultsCount
{
  return [(NSMutableArray *)self->_filesystemMovieVoiceResults count];
}

- (id)filesystemMovieVoiceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filesystemMovieVoiceResults objectAtIndex:a3];
}

+ (Class)filesystemMovieVoiceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearAnimatedStickerResults
{
}

- (void)addAnimatedStickerResults:(id)a3
{
  id v4 = a3;
  animatedStickerResults = self->_animatedStickerResults;
  id v8 = v4;
  if (!animatedStickerResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_animatedStickerResults;
    self->_animatedStickerResults = v6;

    id v4 = v8;
    animatedStickerResults = self->_animatedStickerResults;
  }
  [(NSMutableArray *)animatedStickerResults addObject:v4];
}

- (unint64_t)animatedStickerResultsCount
{
  return [(NSMutableArray *)self->_animatedStickerResults count];
}

- (id)animatedStickerResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_animatedStickerResults objectAtIndex:a3];
}

+ (Class)animatedStickerResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieTorsoResults
{
}

- (void)addMovieTorsoResults:(id)a3
{
  id v4 = a3;
  movieTorsoResults = self->_movieTorsoResults;
  id v8 = v4;
  if (!movieTorsoResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieTorsoResults;
    self->_movieTorsoResults = v6;

    id v4 = v8;
    movieTorsoResults = self->_movieTorsoResults;
  }
  [(NSMutableArray *)movieTorsoResults addObject:v4];
}

- (unint64_t)movieTorsoResultsCount
{
  return [(NSMutableArray *)self->_movieTorsoResults count];
}

- (id)movieTorsoResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieTorsoResults objectAtIndex:a3];
}

+ (Class)movieTorsoResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanActionClassificationResults
{
}

- (void)addMovieHumanActionClassificationResults:(id)a3
{
  id v4 = a3;
  movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  id v8 = v4;
  if (!movieHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_movieHumanActionClassificationResults;
    self->_movieHumanActionClassificationResults = v6;

    id v4 = v8;
    movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  }
  [(NSMutableArray *)movieHumanActionClassificationResults addObject:v4];
}

- (unint64_t)movieHumanActionClassificationResultsCount
{
  return [(NSMutableArray *)self->_movieHumanActionClassificationResults count];
}

- (id)movieHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_movieHumanActionClassificationResults objectAtIndex:a3];
}

+ (Class)movieHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoEmbeddingResults
{
}

- (void)addVideoEmbeddingResults:(id)a3
{
  id v4 = a3;
  videoEmbeddingResults = self->_videoEmbeddingResults;
  id v8 = v4;
  if (!videoEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_videoEmbeddingResults;
    self->_videoEmbeddingResults = v6;

    id v4 = v8;
    videoEmbeddingResults = self->_videoEmbeddingResults;
  }
  [(NSMutableArray *)videoEmbeddingResults addObject:v4];
}

- (unint64_t)videoEmbeddingResultsCount
{
  return [(NSMutableArray *)self->_videoEmbeddingResults count];
}

- (id)videoEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoEmbeddingResults objectAtIndex:a3];
}

+ (Class)videoEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearSummarizedEmbeddingResults
{
}

- (void)addSummarizedEmbeddingResults:(id)a3
{
  id v4 = a3;
  summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  id v8 = v4;
  if (!summarizedEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_summarizedEmbeddingResults;
    self->_summarizedEmbeddingResults = v6;

    id v4 = v8;
    summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  }
  [(NSMutableArray *)summarizedEmbeddingResults addObject:v4];
}

- (unint64_t)summarizedEmbeddingResultsCount
{
  return [(NSMutableArray *)self->_summarizedEmbeddingResults count];
}

- (id)summarizedEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_summarizedEmbeddingResults objectAtIndex:a3];
}

+ (Class)summarizedEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearAudioFusedVideoEmbeddingResults
{
}

- (void)addAudioFusedVideoEmbeddingResults:(id)a3
{
  id v4 = a3;
  audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  id v8 = v4;
  if (!audioFusedVideoEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_audioFusedVideoEmbeddingResults;
    self->_audioFusedVideoEmbeddingResults = v6;

    id v4 = v8;
    audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  }
  [(NSMutableArray *)audioFusedVideoEmbeddingResults addObject:v4];
}

- (unint64_t)audioFusedVideoEmbeddingResultsCount
{
  return [(NSMutableArray *)self->_audioFusedVideoEmbeddingResults count];
}

- (id)audioFusedVideoEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_audioFusedVideoEmbeddingResults objectAtIndex:a3];
}

+ (Class)audioFusedVideoEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageEmbeddingResults
{
}

- (void)addImageEmbeddingResults:(id)a3
{
  id v4 = a3;
  imageEmbeddingResults = self->_imageEmbeddingResults;
  id v8 = v4;
  if (!imageEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageEmbeddingResults;
    self->_imageEmbeddingResults = v6;

    id v4 = v8;
    imageEmbeddingResults = self->_imageEmbeddingResults;
  }
  [(NSMutableArray *)imageEmbeddingResults addObject:v4];
}

- (unint64_t)imageEmbeddingResultsCount
{
  return [(NSMutableArray *)self->_imageEmbeddingResults count];
}

- (id)imageEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageEmbeddingResults objectAtIndex:a3];
}

+ (Class)imageEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageCaptionResults
{
}

- (void)addImageCaptionResults:(id)a3
{
  id v4 = a3;
  imageCaptionResults = self->_imageCaptionResults;
  id v8 = v4;
  if (!imageCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageCaptionResults;
    self->_imageCaptionResults = v6;

    id v4 = v8;
    imageCaptionResults = self->_imageCaptionResults;
  }
  [(NSMutableArray *)imageCaptionResults addObject:v4];
}

- (unint64_t)imageCaptionResultsCount
{
  return [(NSMutableArray *)self->_imageCaptionResults count];
}

- (id)imageCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageCaptionResults objectAtIndex:a3];
}

+ (Class)imageCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoCaptionResults
{
}

- (void)addVideoCaptionResults:(id)a3
{
  id v4 = a3;
  videoCaptionResults = self->_videoCaptionResults;
  id v8 = v4;
  if (!videoCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_videoCaptionResults;
    self->_videoCaptionResults = v6;

    id v4 = v8;
    videoCaptionResults = self->_videoCaptionResults;
  }
  [(NSMutableArray *)videoCaptionResults addObject:v4];
}

- (unint64_t)videoCaptionResultsCount
{
  return [(NSMutableArray *)self->_videoCaptionResults count];
}

- (id)videoCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoCaptionResults objectAtIndex:a3];
}

+ (Class)videoCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoCaptionPreferenceResults
{
}

- (void)addVideoCaptionPreferenceResults:(id)a3
{
  id v4 = a3;
  videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  id v8 = v4;
  if (!videoCaptionPreferenceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_videoCaptionPreferenceResults;
    self->_videoCaptionPreferenceResults = v6;

    id v4 = v8;
    videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  }
  [(NSMutableArray *)videoCaptionPreferenceResults addObject:v4];
}

- (unint64_t)videoCaptionPreferenceResultsCount
{
  return [(NSMutableArray *)self->_videoCaptionPreferenceResults count];
}

- (id)videoCaptionPreferenceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoCaptionPreferenceResults objectAtIndex:a3];
}

+ (Class)videoCaptionPreferenceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoSegmentCaptionResults
{
}

- (void)addVideoSegmentCaptionResults:(id)a3
{
  id v4 = a3;
  videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  id v8 = v4;
  if (!videoSegmentCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_videoSegmentCaptionResults;
    self->_videoSegmentCaptionResults = v6;

    id v4 = v8;
    videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  }
  [(NSMutableArray *)videoSegmentCaptionResults addObject:v4];
}

- (unint64_t)videoSegmentCaptionResultsCount
{
  return [(NSMutableArray *)self->_videoSegmentCaptionResults count];
}

- (id)videoSegmentCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoSegmentCaptionResults objectAtIndex:a3];
}

+ (Class)videoSegmentCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoAssetAnalysis;
  id v4 = [(VCPProtoAssetAnalysis *)&v8 description];
  v5 = [(VCPProtoAssetAnalysis *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v907 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  v5 = [NSNumber numberWithUnsignedInt:self->_types];
  [v3 setObject:v5 forKey:@"types"];

  v6 = [NSNumber numberWithUnsignedInt:self->_flags];
  [v3 setObject:v6 forKey:@"flags"];

  v7 = [NSNumber numberWithDouble:self->_date];
  [v3 setObject:v7 forKey:@"date"];

  char has = (char)self->_has;
  if (has)
  {
    v535 = [NSNumber numberWithDouble:self->_quality];
    [v3 setObject:v535 forKey:@"quality"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v536 = [NSNumber numberWithUnsignedLongLong:self->_statsFlags];
  [v3 setObject:v536 forKey:@"statsFlags"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v9 = [NSNumber numberWithUnsignedLongLong:self->_typesWide];
    [v3 setObject:v9 forKey:@"typesWide"];
  }
LABEL_5:
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier) {
    [v3 setObject:assetIdentifier forKey:@"assetIdentifier"];
  }
  v11 = [NSNumber numberWithDouble:self->_assetModificationDate];
  [v3 setObject:v11 forKey:@"assetModificationDate"];

  assetMasterFingerprint = self->_assetMasterFingerprint;
  if (assetMasterFingerprint) {
    [v3 setObject:assetMasterFingerprint forKey:@"assetMasterFingerprint"];
  }
  assetAdjustedFingerprint = self->_assetAdjustedFingerprint;
  if (assetAdjustedFingerprint) {
    [v3 setObject:assetAdjustedFingerprint forKey:@"assetAdjustedFingerprint"];
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier) {
    [v3 setObject:assetCloudIdentifier forKey:@"assetCloudIdentifier"];
  }
  if ([(NSMutableArray *)self->_imageBlurResults count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageBlurResults, "count"));
    long long v829 = 0u;
    long long v830 = 0u;
    long long v831 = 0u;
    long long v832 = 0u;
    v16 = self->_imageBlurResults;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v829 objects:v906 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v830;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v830 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v829 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v829 objects:v906 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"imageBlurResults"];
  }
  if ([(NSMutableArray *)self->_imageCompositionResults count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageCompositionResults, "count"));
    long long v825 = 0u;
    long long v826 = 0u;
    long long v827 = 0u;
    long long v828 = 0u;
    v23 = self->_imageCompositionResults;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v825 objects:v905 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v826;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v826 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v825 + 1) + 8 * j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v825 objects:v905 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"imageCompositionResults"];
  }
  if ([(NSMutableArray *)self->_imageFaceResults count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageFaceResults, "count"));
    long long v821 = 0u;
    long long v822 = 0u;
    long long v823 = 0u;
    long long v824 = 0u;
    v30 = self->_imageFaceResults;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v821 objects:v904 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v822;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v822 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v821 + 1) + 8 * k) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v821 objects:v904 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"imageFaceResults"];
  }
  if ([(NSMutableArray *)self->_imageFeatureResults count])
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageFeatureResults, "count"));
    long long v817 = 0u;
    long long v818 = 0u;
    long long v819 = 0u;
    long long v820 = 0u;
    v37 = self->_imageFeatureResults;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v817 objects:v903 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v818;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v818 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v817 + 1) + 8 * m) dictionaryRepresentation];
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v817 objects:v903 count:16];
      }
      while (v39);
    }

    [v3 setObject:v36 forKey:@"imageFeatureResults"];
  }
  if ([(NSMutableArray *)self->_imageJunkResults count])
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageJunkResults, "count"));
    long long v813 = 0u;
    long long v814 = 0u;
    long long v815 = 0u;
    long long v816 = 0u;
    v44 = self->_imageJunkResults;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v813 objects:v902 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v814;
      do
      {
        for (uint64_t n = 0; n != v46; ++n)
        {
          if (*(void *)v814 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = [*(id *)(*((void *)&v813 + 1) + 8 * n) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v813 objects:v902 count:16];
      }
      while (v46);
    }

    [v3 setObject:v43 forKey:@"imageJunkResults"];
  }
  if ([(NSMutableArray *)self->_imageSaliencyResults count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageSaliencyResults, "count"));
    long long v809 = 0u;
    long long v810 = 0u;
    long long v811 = 0u;
    long long v812 = 0u;
    v51 = self->_imageSaliencyResults;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v809 objects:v901 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v810;
      do
      {
        for (iuint64_t i = 0; ii != v53; ++ii)
        {
          if (*(void *)v810 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v809 + 1) + 8 * ii) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v809 objects:v901 count:16];
      }
      while (v53);
    }

    [v3 setObject:v50 forKey:@"imageSaliencyResults"];
  }
  if ([(NSMutableArray *)self->_imageShotTypeResults count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageShotTypeResults, "count"));
    long long v805 = 0u;
    long long v806 = 0u;
    long long v807 = 0u;
    long long v808 = 0u;
    v58 = self->_imageShotTypeResults;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v805 objects:v900 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v806;
      do
      {
        for (juint64_t j = 0; jj != v60; ++jj)
        {
          if (*(void *)v806 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [*(id *)(*((void *)&v805 + 1) + 8 * jj) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v805 objects:v900 count:16];
      }
      while (v60);
    }

    [v3 setObject:v57 forKey:@"imageShotTypeResults"];
  }
  if ([(NSMutableArray *)self->_imagePetsResults count])
  {
    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imagePetsResults, "count"));
    long long v801 = 0u;
    long long v802 = 0u;
    long long v803 = 0u;
    long long v804 = 0u;
    v65 = self->_imagePetsResults;
    uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v801 objects:v899 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v802;
      do
      {
        for (kuint64_t k = 0; kk != v67; ++kk)
        {
          if (*(void *)v802 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = [*(id *)(*((void *)&v801 + 1) + 8 * kk) dictionaryRepresentation];
          [v64 addObject:v70];
        }
        uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v801 objects:v899 count:16];
      }
      while (v67);
    }

    [v3 setObject:v64 forKey:@"imagePetsResults"];
  }
  if ([(NSMutableArray *)self->_imagePetsFaceResults count])
  {
    v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imagePetsFaceResults, "count"));
    long long v797 = 0u;
    long long v798 = 0u;
    long long v799 = 0u;
    long long v800 = 0u;
    v72 = self->_imagePetsFaceResults;
    uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v797 objects:v898 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v798;
      do
      {
        for (muint64_t m = 0; mm != v74; ++mm)
        {
          if (*(void *)v798 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = [*(id *)(*((void *)&v797 + 1) + 8 * mm) dictionaryRepresentation];
          [v71 addObject:v77];
        }
        uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v797 objects:v898 count:16];
      }
      while (v74);
    }

    [v3 setObject:v71 forKey:@"imagePetsFaceResults"];
  }
  if ([(NSMutableArray *)self->_imageSceneprintResults count])
  {
    v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageSceneprintResults, "count"));
    long long v793 = 0u;
    long long v794 = 0u;
    long long v795 = 0u;
    long long v796 = 0u;
    v79 = self->_imageSceneprintResults;
    uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v793 objects:v897 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v794;
      do
      {
        for (nuint64_t n = 0; nn != v81; ++nn)
        {
          if (*(void *)v794 != v82) {
            objc_enumerationMutation(v79);
          }
          v84 = [*(id *)(*((void *)&v793 + 1) + 8 * nn) dictionaryRepresentation];
          [v78 addObject:v84];
        }
        uint64_t v81 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v793 objects:v897 count:16];
      }
      while (v81);
    }

    [v3 setObject:v78 forKey:@"imageSceneprintResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoEffectsResults count])
  {
    v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoEffectsResults, "count"));
    long long v789 = 0u;
    long long v790 = 0u;
    long long v791 = 0u;
    long long v792 = 0u;
    v86 = self->_livePhotoEffectsResults;
    uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v789 objects:v896 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v790;
      do
      {
        for (uint64_t i1 = 0; i1 != v88; ++i1)
        {
          if (*(void *)v790 != v89) {
            objc_enumerationMutation(v86);
          }
          v91 = [*(id *)(*((void *)&v789 + 1) + 8 * i1) dictionaryRepresentation];
          [v85 addObject:v91];
        }
        uint64_t v88 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v789 objects:v896 count:16];
      }
      while (v88);
    }

    [v3 setObject:v85 forKey:@"livePhotoEffectsResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoRecommendationResults count])
  {
    v92 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoRecommendationResults, "count"));
    long long v785 = 0u;
    long long v786 = 0u;
    long long v787 = 0u;
    long long v788 = 0u;
    v93 = self->_livePhotoRecommendationResults;
    uint64_t v94 = [(NSMutableArray *)v93 countByEnumeratingWithState:&v785 objects:v895 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v786;
      do
      {
        for (uint64_t i2 = 0; i2 != v95; ++i2)
        {
          if (*(void *)v786 != v96) {
            objc_enumerationMutation(v93);
          }
          v98 = [*(id *)(*((void *)&v785 + 1) + 8 * i2) dictionaryRepresentation];
          [v92 addObject:v98];
        }
        uint64_t v95 = [(NSMutableArray *)v93 countByEnumeratingWithState:&v785 objects:v895 count:16];
      }
      while (v95);
    }

    [v3 setObject:v92 forKey:@"livePhotoRecommendationResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoSharpnessResults count])
  {
    v99 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoSharpnessResults, "count"));
    long long v781 = 0u;
    long long v782 = 0u;
    long long v783 = 0u;
    long long v784 = 0u;
    v100 = self->_livePhotoSharpnessResults;
    uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v781 objects:v894 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v782;
      do
      {
        for (uint64_t i3 = 0; i3 != v102; ++i3)
        {
          if (*(void *)v782 != v103) {
            objc_enumerationMutation(v100);
          }
          v105 = [*(id *)(*((void *)&v781 + 1) + 8 * i3) dictionaryRepresentation];
          [v99 addObject:v105];
        }
        uint64_t v102 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v781 objects:v894 count:16];
      }
      while (v102);
    }

    [v3 setObject:v99 forKey:@"livePhotoSharpnessResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoKeyFrameResults count])
  {
    v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoKeyFrameResults, "count"));
    long long v777 = 0u;
    long long v778 = 0u;
    long long v779 = 0u;
    long long v780 = 0u;
    v107 = self->_livePhotoKeyFrameResults;
    uint64_t v108 = [(NSMutableArray *)v107 countByEnumeratingWithState:&v777 objects:v893 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v778;
      do
      {
        for (uint64_t i4 = 0; i4 != v109; ++i4)
        {
          if (*(void *)v778 != v110) {
            objc_enumerationMutation(v107);
          }
          v112 = [*(id *)(*((void *)&v777 + 1) + 8 * i4) dictionaryRepresentation];
          [v106 addObject:v112];
        }
        uint64_t v109 = [(NSMutableArray *)v107 countByEnumeratingWithState:&v777 objects:v893 count:16];
      }
      while (v109);
    }

    [v3 setObject:v106 forKey:@"livePhotoKeyFrameResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoKeyFrameStillResults count])
  {
    v113 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoKeyFrameStillResults, "count"));
    long long v773 = 0u;
    long long v774 = 0u;
    long long v775 = 0u;
    long long v776 = 0u;
    v114 = self->_livePhotoKeyFrameStillResults;
    uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v773 objects:v892 count:16];
    if (v115)
    {
      uint64_t v116 = v115;
      uint64_t v117 = *(void *)v774;
      do
      {
        for (uint64_t i5 = 0; i5 != v116; ++i5)
        {
          if (*(void *)v774 != v117) {
            objc_enumerationMutation(v114);
          }
          v119 = [*(id *)(*((void *)&v773 + 1) + 8 * i5) dictionaryRepresentation];
          [v113 addObject:v119];
        }
        uint64_t v116 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v773 objects:v892 count:16];
      }
      while (v116);
    }

    [v3 setObject:v113 forKey:@"livePhotoKeyFrameStillResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoSettlingEffectGatingResults count])
  {
    v120 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoSettlingEffectGatingResults, "count"));
    long long v769 = 0u;
    long long v770 = 0u;
    long long v771 = 0u;
    long long v772 = 0u;
    v121 = self->_livePhotoSettlingEffectGatingResults;
    uint64_t v122 = [(NSMutableArray *)v121 countByEnumeratingWithState:&v769 objects:v891 count:16];
    if (v122)
    {
      uint64_t v123 = v122;
      uint64_t v124 = *(void *)v770;
      do
      {
        for (uint64_t i6 = 0; i6 != v123; ++i6)
        {
          if (*(void *)v770 != v124) {
            objc_enumerationMutation(v121);
          }
          v126 = [*(id *)(*((void *)&v769 + 1) + 8 * i6) dictionaryRepresentation];
          [v120 addObject:v126];
        }
        uint64_t v123 = [(NSMutableArray *)v121 countByEnumeratingWithState:&v769 objects:v891 count:16];
      }
      while (v123);
    }

    [v3 setObject:v120 forKey:@"livePhotoSettlingEffectGatingResults"];
  }
  if ([(NSMutableArray *)self->_movieActivityLevelResults count])
  {
    v127 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieActivityLevelResults, "count"));
    long long v765 = 0u;
    long long v766 = 0u;
    long long v767 = 0u;
    long long v768 = 0u;
    v128 = self->_movieActivityLevelResults;
    uint64_t v129 = [(NSMutableArray *)v128 countByEnumeratingWithState:&v765 objects:v890 count:16];
    if (v129)
    {
      uint64_t v130 = v129;
      uint64_t v131 = *(void *)v766;
      do
      {
        for (uint64_t i7 = 0; i7 != v130; ++i7)
        {
          if (*(void *)v766 != v131) {
            objc_enumerationMutation(v128);
          }
          v133 = [*(id *)(*((void *)&v765 + 1) + 8 * i7) dictionaryRepresentation];
          [v127 addObject:v133];
        }
        uint64_t v130 = [(NSMutableArray *)v128 countByEnumeratingWithState:&v765 objects:v890 count:16];
      }
      while (v130);
    }

    [v3 setObject:v127 forKey:@"movieActivityLevelResults"];
  }
  if ([(NSMutableArray *)self->_movieCameraMotionResults count])
  {
    v134 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieCameraMotionResults, "count"));
    long long v761 = 0u;
    long long v762 = 0u;
    long long v763 = 0u;
    long long v764 = 0u;
    v135 = self->_movieCameraMotionResults;
    uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v761 objects:v889 count:16];
    if (v136)
    {
      uint64_t v137 = v136;
      uint64_t v138 = *(void *)v762;
      do
      {
        for (uint64_t i8 = 0; i8 != v137; ++i8)
        {
          if (*(void *)v762 != v138) {
            objc_enumerationMutation(v135);
          }
          v140 = [*(id *)(*((void *)&v761 + 1) + 8 * i8) dictionaryRepresentation];
          [v134 addObject:v140];
        }
        uint64_t v137 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v761 objects:v889 count:16];
      }
      while (v137);
    }

    [v3 setObject:v134 forKey:@"movieCameraMotionResults"];
  }
  if ([(NSMutableArray *)self->_movieClassificationResults count])
  {
    v141 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieClassificationResults, "count"));
    long long v757 = 0u;
    long long v758 = 0u;
    long long v759 = 0u;
    long long v760 = 0u;
    v142 = self->_movieClassificationResults;
    uint64_t v143 = [(NSMutableArray *)v142 countByEnumeratingWithState:&v757 objects:v888 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v758;
      do
      {
        for (uint64_t i9 = 0; i9 != v144; ++i9)
        {
          if (*(void *)v758 != v145) {
            objc_enumerationMutation(v142);
          }
          v147 = [*(id *)(*((void *)&v757 + 1) + 8 * i9) dictionaryRepresentation];
          [v141 addObject:v147];
        }
        uint64_t v144 = [(NSMutableArray *)v142 countByEnumeratingWithState:&v757 objects:v888 count:16];
      }
      while (v144);
    }

    [v3 setObject:v141 forKey:@"movieClassificationResults"];
  }
  if ([(NSMutableArray *)self->_movieFaceResults count])
  {
    v148 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieFaceResults, "count"));
    long long v753 = 0u;
    long long v754 = 0u;
    long long v755 = 0u;
    long long v756 = 0u;
    v149 = self->_movieFaceResults;
    uint64_t v150 = [(NSMutableArray *)v149 countByEnumeratingWithState:&v753 objects:v887 count:16];
    if (v150)
    {
      uint64_t v151 = v150;
      uint64_t v152 = *(void *)v754;
      do
      {
        for (uint64_t i10 = 0; i10 != v151; ++i10)
        {
          if (*(void *)v754 != v152) {
            objc_enumerationMutation(v149);
          }
          v154 = [*(id *)(*((void *)&v753 + 1) + 8 * i10) dictionaryRepresentation];
          [v148 addObject:v154];
        }
        uint64_t v151 = [(NSMutableArray *)v149 countByEnumeratingWithState:&v753 objects:v887 count:16];
      }
      while (v151);
    }

    [v3 setObject:v148 forKey:@"movieFaceResults"];
  }
  if ([(NSMutableArray *)self->_movieFaceprintResults count])
  {
    v155 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieFaceprintResults, "count"));
    long long v749 = 0u;
    long long v750 = 0u;
    long long v751 = 0u;
    long long v752 = 0u;
    v156 = self->_movieFaceprintResults;
    uint64_t v157 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v749 objects:v886 count:16];
    if (v157)
    {
      uint64_t v158 = v157;
      uint64_t v159 = *(void *)v750;
      do
      {
        for (uint64_t i11 = 0; i11 != v158; ++i11)
        {
          if (*(void *)v750 != v159) {
            objc_enumerationMutation(v156);
          }
          v161 = [*(id *)(*((void *)&v749 + 1) + 8 * i11) dictionaryRepresentation];
          [v155 addObject:v161];
        }
        uint64_t v158 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v749 objects:v886 count:16];
      }
      while (v158);
    }

    [v3 setObject:v155 forKey:@"movieFaceprintResults"];
  }
  if ([(NSMutableArray *)self->_movieFeatureResults count])
  {
    v162 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieFeatureResults, "count"));
    long long v745 = 0u;
    long long v746 = 0u;
    long long v747 = 0u;
    long long v748 = 0u;
    v163 = self->_movieFeatureResults;
    uint64_t v164 = [(NSMutableArray *)v163 countByEnumeratingWithState:&v745 objects:v885 count:16];
    if (v164)
    {
      uint64_t v165 = v164;
      uint64_t v166 = *(void *)v746;
      do
      {
        for (uint64_t i12 = 0; i12 != v165; ++i12)
        {
          if (*(void *)v746 != v166) {
            objc_enumerationMutation(v163);
          }
          v168 = [*(id *)(*((void *)&v745 + 1) + 8 * i12) dictionaryRepresentation];
          [v162 addObject:v168];
        }
        uint64_t v165 = [(NSMutableArray *)v163 countByEnumeratingWithState:&v745 objects:v885 count:16];
      }
      while (v165);
    }

    [v3 setObject:v162 forKey:@"movieFeatureResults"];
  }
  if ([(NSMutableArray *)self->_movieFineSubjectMotionResults count])
  {
    v169 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieFineSubjectMotionResults, "count"));
    long long v741 = 0u;
    long long v742 = 0u;
    long long v743 = 0u;
    long long v744 = 0u;
    v170 = self->_movieFineSubjectMotionResults;
    uint64_t v171 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v741 objects:v884 count:16];
    if (v171)
    {
      uint64_t v172 = v171;
      uint64_t v173 = *(void *)v742;
      do
      {
        for (uint64_t i13 = 0; i13 != v172; ++i13)
        {
          if (*(void *)v742 != v173) {
            objc_enumerationMutation(v170);
          }
          v175 = [*(id *)(*((void *)&v741 + 1) + 8 * i13) dictionaryRepresentation];
          [v169 addObject:v175];
        }
        uint64_t v172 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v741 objects:v884 count:16];
      }
      while (v172);
    }

    [v3 setObject:v169 forKey:@"movieFineSubjectMotionResults"];
  }
  if ([(NSMutableArray *)self->_movieInterestingnessResults count])
  {
    v176 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieInterestingnessResults, "count"));
    long long v737 = 0u;
    long long v738 = 0u;
    long long v739 = 0u;
    long long v740 = 0u;
    v177 = self->_movieInterestingnessResults;
    uint64_t v178 = [(NSMutableArray *)v177 countByEnumeratingWithState:&v737 objects:v883 count:16];
    if (v178)
    {
      uint64_t v179 = v178;
      uint64_t v180 = *(void *)v738;
      do
      {
        for (uint64_t i14 = 0; i14 != v179; ++i14)
        {
          if (*(void *)v738 != v180) {
            objc_enumerationMutation(v177);
          }
          v182 = [*(id *)(*((void *)&v737 + 1) + 8 * i14) dictionaryRepresentation];
          [v176 addObject:v182];
        }
        uint64_t v179 = [(NSMutableArray *)v177 countByEnumeratingWithState:&v737 objects:v883 count:16];
      }
      while (v179);
    }

    [v3 setObject:v176 forKey:@"movieInterestingnessResults"];
  }
  if ([(NSMutableArray *)self->_movieMovingObjectResults count])
  {
    v183 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieMovingObjectResults, "count"));
    long long v733 = 0u;
    long long v734 = 0u;
    long long v735 = 0u;
    long long v736 = 0u;
    v184 = self->_movieMovingObjectResults;
    uint64_t v185 = [(NSMutableArray *)v184 countByEnumeratingWithState:&v733 objects:v882 count:16];
    if (v185)
    {
      uint64_t v186 = v185;
      uint64_t v187 = *(void *)v734;
      do
      {
        for (uint64_t i15 = 0; i15 != v186; ++i15)
        {
          if (*(void *)v734 != v187) {
            objc_enumerationMutation(v184);
          }
          v189 = [*(id *)(*((void *)&v733 + 1) + 8 * i15) dictionaryRepresentation];
          [v183 addObject:v189];
        }
        uint64_t v186 = [(NSMutableArray *)v184 countByEnumeratingWithState:&v733 objects:v882 count:16];
      }
      while (v186);
    }

    [v3 setObject:v183 forKey:@"movieMovingObjectResults"];
  }
  if ([(NSMutableArray *)self->_movieMusicResults count])
  {
    v190 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieMusicResults, "count"));
    long long v729 = 0u;
    long long v730 = 0u;
    long long v731 = 0u;
    long long v732 = 0u;
    v191 = self->_movieMusicResults;
    uint64_t v192 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v729 objects:v881 count:16];
    if (v192)
    {
      uint64_t v193 = v192;
      uint64_t v194 = *(void *)v730;
      do
      {
        for (uint64_t i16 = 0; i16 != v193; ++i16)
        {
          if (*(void *)v730 != v194) {
            objc_enumerationMutation(v191);
          }
          v196 = [*(id *)(*((void *)&v729 + 1) + 8 * i16) dictionaryRepresentation];
          [v190 addObject:v196];
        }
        uint64_t v193 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v729 objects:v881 count:16];
      }
      while (v193);
    }

    [v3 setObject:v190 forKey:@"movieMusicResults"];
  }
  if ([(NSMutableArray *)self->_movieObstructionResults count])
  {
    v197 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieObstructionResults, "count"));
    long long v725 = 0u;
    long long v726 = 0u;
    long long v727 = 0u;
    long long v728 = 0u;
    v198 = self->_movieObstructionResults;
    uint64_t v199 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v725 objects:v880 count:16];
    if (v199)
    {
      uint64_t v200 = v199;
      uint64_t v201 = *(void *)v726;
      do
      {
        for (uint64_t i17 = 0; i17 != v200; ++i17)
        {
          if (*(void *)v726 != v201) {
            objc_enumerationMutation(v198);
          }
          v203 = [*(id *)(*((void *)&v725 + 1) + 8 * i17) dictionaryRepresentation];
          [v197 addObject:v203];
        }
        uint64_t v200 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v725 objects:v880 count:16];
      }
      while (v200);
    }

    [v3 setObject:v197 forKey:@"movieObstructionResults"];
  }
  if ([(NSMutableArray *)self->_movieOrientationResults count])
  {
    v204 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieOrientationResults, "count"));
    long long v721 = 0u;
    long long v722 = 0u;
    long long v723 = 0u;
    long long v724 = 0u;
    v205 = self->_movieOrientationResults;
    uint64_t v206 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v721 objects:v879 count:16];
    if (v206)
    {
      uint64_t v207 = v206;
      uint64_t v208 = *(void *)v722;
      do
      {
        for (uint64_t i18 = 0; i18 != v207; ++i18)
        {
          if (*(void *)v722 != v208) {
            objc_enumerationMutation(v205);
          }
          v210 = [*(id *)(*((void *)&v721 + 1) + 8 * i18) dictionaryRepresentation];
          [v204 addObject:v210];
        }
        uint64_t v207 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v721 objects:v879 count:16];
      }
      while (v207);
    }

    [v3 setObject:v204 forKey:@"movieOrientationResults"];
  }
  if ([(NSMutableArray *)self->_moviePreEncodeResults count])
  {
    v211 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_moviePreEncodeResults, "count"));
    long long v717 = 0u;
    long long v718 = 0u;
    long long v719 = 0u;
    long long v720 = 0u;
    v212 = self->_moviePreEncodeResults;
    uint64_t v213 = [(NSMutableArray *)v212 countByEnumeratingWithState:&v717 objects:v878 count:16];
    if (v213)
    {
      uint64_t v214 = v213;
      uint64_t v215 = *(void *)v718;
      do
      {
        for (uint64_t i19 = 0; i19 != v214; ++i19)
        {
          if (*(void *)v718 != v215) {
            objc_enumerationMutation(v212);
          }
          v217 = [*(id *)(*((void *)&v717 + 1) + 8 * i19) dictionaryRepresentation];
          [v211 addObject:v217];
        }
        uint64_t v214 = [(NSMutableArray *)v212 countByEnumeratingWithState:&v717 objects:v878 count:16];
      }
      while (v214);
    }

    [v3 setObject:v211 forKey:@"moviePreEncodeResults"];
  }
  if ([(NSMutableArray *)self->_movieQualityResults count])
  {
    v218 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieQualityResults, "count"));
    long long v713 = 0u;
    long long v714 = 0u;
    long long v715 = 0u;
    long long v716 = 0u;
    v219 = self->_movieQualityResults;
    uint64_t v220 = [(NSMutableArray *)v219 countByEnumeratingWithState:&v713 objects:v877 count:16];
    if (v220)
    {
      uint64_t v221 = v220;
      uint64_t v222 = *(void *)v714;
      do
      {
        for (uint64_t i20 = 0; i20 != v221; ++i20)
        {
          if (*(void *)v714 != v222) {
            objc_enumerationMutation(v219);
          }
          v224 = [*(id *)(*((void *)&v713 + 1) + 8 * i20) dictionaryRepresentation];
          [v218 addObject:v224];
        }
        uint64_t v221 = [(NSMutableArray *)v219 countByEnumeratingWithState:&v713 objects:v877 count:16];
      }
      while (v221);
    }

    [v3 setObject:v218 forKey:@"movieQualityResults"];
  }
  if ([(NSMutableArray *)self->_movieSaliencyResults count])
  {
    v225 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSaliencyResults, "count"));
    long long v709 = 0u;
    long long v710 = 0u;
    long long v711 = 0u;
    long long v712 = 0u;
    v226 = self->_movieSaliencyResults;
    uint64_t v227 = [(NSMutableArray *)v226 countByEnumeratingWithState:&v709 objects:v876 count:16];
    if (v227)
    {
      uint64_t v228 = v227;
      uint64_t v229 = *(void *)v710;
      do
      {
        for (uint64_t i21 = 0; i21 != v228; ++i21)
        {
          if (*(void *)v710 != v229) {
            objc_enumerationMutation(v226);
          }
          v231 = [*(id *)(*((void *)&v709 + 1) + 8 * i21) dictionaryRepresentation];
          [v225 addObject:v231];
        }
        uint64_t v228 = [(NSMutableArray *)v226 countByEnumeratingWithState:&v709 objects:v876 count:16];
      }
      while (v228);
    }

    [v3 setObject:v225 forKey:@"movieSaliencyResults"];
  }
  if ([(NSMutableArray *)self->_movieSceneResults count])
  {
    v232 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSceneResults, "count"));
    long long v705 = 0u;
    long long v706 = 0u;
    long long v707 = 0u;
    long long v708 = 0u;
    v233 = self->_movieSceneResults;
    uint64_t v234 = [(NSMutableArray *)v233 countByEnumeratingWithState:&v705 objects:v875 count:16];
    if (v234)
    {
      uint64_t v235 = v234;
      uint64_t v236 = *(void *)v706;
      do
      {
        for (uint64_t i22 = 0; i22 != v235; ++i22)
        {
          if (*(void *)v706 != v236) {
            objc_enumerationMutation(v233);
          }
          v238 = [*(id *)(*((void *)&v705 + 1) + 8 * i22) dictionaryRepresentation];
          [v232 addObject:v238];
        }
        uint64_t v235 = [(NSMutableArray *)v233 countByEnumeratingWithState:&v705 objects:v875 count:16];
      }
      while (v235);
    }

    [v3 setObject:v232 forKey:@"movieSceneResults"];
  }
  if ([(NSMutableArray *)self->_movieSceneprintResults count])
  {
    v239 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSceneprintResults, "count"));
    long long v701 = 0u;
    long long v702 = 0u;
    long long v703 = 0u;
    long long v704 = 0u;
    v240 = self->_movieSceneprintResults;
    uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v701 objects:v874 count:16];
    if (v241)
    {
      uint64_t v242 = v241;
      uint64_t v243 = *(void *)v702;
      do
      {
        for (uint64_t i23 = 0; i23 != v242; ++i23)
        {
          if (*(void *)v702 != v243) {
            objc_enumerationMutation(v240);
          }
          v245 = [*(id *)(*((void *)&v701 + 1) + 8 * i23) dictionaryRepresentation];
          [v239 addObject:v245];
        }
        uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v701 objects:v874 count:16];
      }
      while (v242);
    }

    [v3 setObject:v239 forKey:@"movieSceneprintResults"];
  }
  if ([(NSMutableArray *)self->_movieSubjectMotionResults count])
  {
    v246 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSubjectMotionResults, "count"));
    long long v697 = 0u;
    long long v698 = 0u;
    long long v699 = 0u;
    long long v700 = 0u;
    v247 = self->_movieSubjectMotionResults;
    uint64_t v248 = [(NSMutableArray *)v247 countByEnumeratingWithState:&v697 objects:v873 count:16];
    if (v248)
    {
      uint64_t v249 = v248;
      uint64_t v250 = *(void *)v698;
      do
      {
        for (uint64_t i24 = 0; i24 != v249; ++i24)
        {
          if (*(void *)v698 != v250) {
            objc_enumerationMutation(v247);
          }
          v252 = [*(id *)(*((void *)&v697 + 1) + 8 * i24) dictionaryRepresentation];
          [v246 addObject:v252];
        }
        uint64_t v249 = [(NSMutableArray *)v247 countByEnumeratingWithState:&v697 objects:v873 count:16];
      }
      while (v249);
    }

    [v3 setObject:v246 forKey:@"movieSubjectMotionResults"];
  }
  if ([(NSMutableArray *)self->_movieSubtleMotionResults count])
  {
    v253 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSubtleMotionResults, "count"));
    long long v693 = 0u;
    long long v694 = 0u;
    long long v695 = 0u;
    long long v696 = 0u;
    v254 = self->_movieSubtleMotionResults;
    uint64_t v255 = [(NSMutableArray *)v254 countByEnumeratingWithState:&v693 objects:v872 count:16];
    if (v255)
    {
      uint64_t v256 = v255;
      uint64_t v257 = *(void *)v694;
      do
      {
        for (uint64_t i25 = 0; i25 != v256; ++i25)
        {
          if (*(void *)v694 != v257) {
            objc_enumerationMutation(v254);
          }
          v259 = [*(id *)(*((void *)&v693 + 1) + 8 * i25) dictionaryRepresentation];
          [v253 addObject:v259];
        }
        uint64_t v256 = [(NSMutableArray *)v254 countByEnumeratingWithState:&v693 objects:v872 count:16];
      }
      while (v256);
    }

    [v3 setObject:v253 forKey:@"movieSubtleMotionResults"];
  }
  if ([(NSMutableArray *)self->_movieUtteranceResults count])
  {
    v260 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieUtteranceResults, "count"));
    long long v689 = 0u;
    long long v690 = 0u;
    long long v691 = 0u;
    long long v692 = 0u;
    v261 = self->_movieUtteranceResults;
    uint64_t v262 = [(NSMutableArray *)v261 countByEnumeratingWithState:&v689 objects:v871 count:16];
    if (v262)
    {
      uint64_t v263 = v262;
      uint64_t v264 = *(void *)v690;
      do
      {
        for (uint64_t i26 = 0; i26 != v263; ++i26)
        {
          if (*(void *)v690 != v264) {
            objc_enumerationMutation(v261);
          }
          v266 = [*(id *)(*((void *)&v689 + 1) + 8 * i26) dictionaryRepresentation];
          [v260 addObject:v266];
        }
        uint64_t v263 = [(NSMutableArray *)v261 countByEnumeratingWithState:&v689 objects:v871 count:16];
      }
      while (v263);
    }

    [v3 setObject:v260 forKey:@"movieUtteranceResults"];
  }
  if ([(NSMutableArray *)self->_movieVoiceResults count])
  {
    v267 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieVoiceResults, "count"));
    long long v685 = 0u;
    long long v686 = 0u;
    long long v687 = 0u;
    long long v688 = 0u;
    v268 = self->_movieVoiceResults;
    uint64_t v269 = [(NSMutableArray *)v268 countByEnumeratingWithState:&v685 objects:v870 count:16];
    if (v269)
    {
      uint64_t v270 = v269;
      uint64_t v271 = *(void *)v686;
      do
      {
        for (uint64_t i27 = 0; i27 != v270; ++i27)
        {
          if (*(void *)v686 != v271) {
            objc_enumerationMutation(v268);
          }
          v273 = [*(id *)(*((void *)&v685 + 1) + 8 * i27) dictionaryRepresentation];
          [v267 addObject:v273];
        }
        uint64_t v270 = [(NSMutableArray *)v268 countByEnumeratingWithState:&v685 objects:v870 count:16];
      }
      while (v270);
    }

    [v3 setObject:v267 forKey:@"movieVoiceResults"];
  }
  if ([(NSMutableArray *)self->_movieSummaryResults count])
  {
    v274 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSummaryResults, "count"));
    long long v681 = 0u;
    long long v682 = 0u;
    long long v683 = 0u;
    long long v684 = 0u;
    v275 = self->_movieSummaryResults;
    uint64_t v276 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v681 objects:v869 count:16];
    if (v276)
    {
      uint64_t v277 = v276;
      uint64_t v278 = *(void *)v682;
      do
      {
        for (uint64_t i28 = 0; i28 != v277; ++i28)
        {
          if (*(void *)v682 != v278) {
            objc_enumerationMutation(v275);
          }
          v280 = [*(id *)(*((void *)&v681 + 1) + 8 * i28) dictionaryRepresentation];
          [v274 addObject:v280];
        }
        uint64_t v277 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v681 objects:v869 count:16];
      }
      while (v277);
    }

    [v3 setObject:v274 forKey:@"movieSummaryResults"];
  }
  if ([(NSMutableArray *)self->_movieHighlightResults count])
  {
    v281 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieHighlightResults, "count"));
    long long v677 = 0u;
    long long v678 = 0u;
    long long v679 = 0u;
    long long v680 = 0u;
    v282 = self->_movieHighlightResults;
    uint64_t v283 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v677 objects:v868 count:16];
    if (v283)
    {
      uint64_t v284 = v283;
      uint64_t v285 = *(void *)v678;
      do
      {
        for (uint64_t i29 = 0; i29 != v284; ++i29)
        {
          if (*(void *)v678 != v285) {
            objc_enumerationMutation(v282);
          }
          v287 = [*(id *)(*((void *)&v677 + 1) + 8 * i29) dictionaryRepresentation];
          [v281 addObject:v287];
        }
        uint64_t v284 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v677 objects:v868 count:16];
      }
      while (v284);
    }

    [v3 setObject:v281 forKey:@"movieHighlightResults"];
  }
  if ([(NSMutableArray *)self->_imageExposureResults count])
  {
    v288 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageExposureResults, "count"));
    long long v673 = 0u;
    long long v674 = 0u;
    long long v675 = 0u;
    long long v676 = 0u;
    v289 = self->_imageExposureResults;
    uint64_t v290 = [(NSMutableArray *)v289 countByEnumeratingWithState:&v673 objects:v867 count:16];
    if (v290)
    {
      uint64_t v291 = v290;
      uint64_t v292 = *(void *)v674;
      do
      {
        for (uint64_t i30 = 0; i30 != v291; ++i30)
        {
          if (*(void *)v674 != v292) {
            objc_enumerationMutation(v289);
          }
          v294 = [*(id *)(*((void *)&v673 + 1) + 8 * i30) dictionaryRepresentation];
          [v288 addObject:v294];
        }
        uint64_t v291 = [(NSMutableArray *)v289 countByEnumeratingWithState:&v673 objects:v867 count:16];
      }
      while (v291);
    }

    [v3 setObject:v288 forKey:@"imageExposureResults"];
  }
  if ([(NSMutableArray *)self->_imageHumanPoseResults count])
  {
    v295 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageHumanPoseResults, "count"));
    long long v669 = 0u;
    long long v670 = 0u;
    long long v671 = 0u;
    long long v672 = 0u;
    v296 = self->_imageHumanPoseResults;
    uint64_t v297 = [(NSMutableArray *)v296 countByEnumeratingWithState:&v669 objects:v866 count:16];
    if (v297)
    {
      uint64_t v298 = v297;
      uint64_t v299 = *(void *)v670;
      do
      {
        for (uint64_t i31 = 0; i31 != v298; ++i31)
        {
          if (*(void *)v670 != v299) {
            objc_enumerationMutation(v296);
          }
          v301 = [*(id *)(*((void *)&v669 + 1) + 8 * i31) dictionaryRepresentation];
          [v295 addObject:v301];
        }
        uint64_t v298 = [(NSMutableArray *)v296 countByEnumeratingWithState:&v669 objects:v866 count:16];
      }
      while (v298);
    }

    [v3 setObject:v295 forKey:@"imageHumanPoseResults"];
  }
  if ([(NSMutableArray *)self->_movieHumanPoseResults count])
  {
    v302 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanPoseResults, "count"));
    long long v665 = 0u;
    long long v666 = 0u;
    long long v667 = 0u;
    long long v668 = 0u;
    v303 = self->_movieHumanPoseResults;
    uint64_t v304 = [(NSMutableArray *)v303 countByEnumeratingWithState:&v665 objects:v865 count:16];
    if (v304)
    {
      uint64_t v305 = v304;
      uint64_t v306 = *(void *)v666;
      do
      {
        for (uint64_t i32 = 0; i32 != v305; ++i32)
        {
          if (*(void *)v666 != v306) {
            objc_enumerationMutation(v303);
          }
          v308 = [*(id *)(*((void *)&v665 + 1) + 8 * i32) dictionaryRepresentation];
          [v302 addObject:v308];
        }
        uint64_t v305 = [(NSMutableArray *)v303 countByEnumeratingWithState:&v665 objects:v865 count:16];
      }
      while (v305);
    }

    [v3 setObject:v302 forKey:@"movieHumanPoseResults"];
  }
  if ([(NSMutableArray *)self->_movieApplauseResults count])
  {
    v309 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieApplauseResults, "count"));
    long long v661 = 0u;
    long long v662 = 0u;
    long long v663 = 0u;
    long long v664 = 0u;
    v310 = self->_movieApplauseResults;
    uint64_t v311 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v661 objects:v864 count:16];
    if (v311)
    {
      uint64_t v312 = v311;
      uint64_t v313 = *(void *)v662;
      do
      {
        for (uint64_t i33 = 0; i33 != v312; ++i33)
        {
          if (*(void *)v662 != v313) {
            objc_enumerationMutation(v310);
          }
          v315 = [*(id *)(*((void *)&v661 + 1) + 8 * i33) dictionaryRepresentation];
          [v309 addObject:v315];
        }
        uint64_t v312 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v661 objects:v864 count:16];
      }
      while (v312);
    }

    [v3 setObject:v309 forKey:@"movieApplauseResults"];
  }
  if ([(NSMutableArray *)self->_movieBabbleResults count])
  {
    v316 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieBabbleResults, "count"));
    long long v657 = 0u;
    long long v658 = 0u;
    long long v659 = 0u;
    long long v660 = 0u;
    v317 = self->_movieBabbleResults;
    uint64_t v318 = [(NSMutableArray *)v317 countByEnumeratingWithState:&v657 objects:v863 count:16];
    if (v318)
    {
      uint64_t v319 = v318;
      uint64_t v320 = *(void *)v658;
      do
      {
        for (uint64_t i34 = 0; i34 != v319; ++i34)
        {
          if (*(void *)v658 != v320) {
            objc_enumerationMutation(v317);
          }
          v322 = [*(id *)(*((void *)&v657 + 1) + 8 * i34) dictionaryRepresentation];
          [v316 addObject:v322];
        }
        uint64_t v319 = [(NSMutableArray *)v317 countByEnumeratingWithState:&v657 objects:v863 count:16];
      }
      while (v319);
    }

    [v3 setObject:v316 forKey:@"movieBabbleResults"];
  }
  if ([(NSMutableArray *)self->_movieCheeringResults count])
  {
    v323 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieCheeringResults, "count"));
    long long v653 = 0u;
    long long v654 = 0u;
    long long v655 = 0u;
    long long v656 = 0u;
    v324 = self->_movieCheeringResults;
    uint64_t v325 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v653 objects:v862 count:16];
    if (v325)
    {
      uint64_t v326 = v325;
      uint64_t v327 = *(void *)v654;
      do
      {
        for (uint64_t i35 = 0; i35 != v326; ++i35)
        {
          if (*(void *)v654 != v327) {
            objc_enumerationMutation(v324);
          }
          v329 = [*(id *)(*((void *)&v653 + 1) + 8 * i35) dictionaryRepresentation];
          [v323 addObject:v329];
        }
        uint64_t v326 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v653 objects:v862 count:16];
      }
      while (v326);
    }

    [v3 setObject:v323 forKey:@"movieCheeringResults"];
  }
  if ([(NSMutableArray *)self->_movieLaughterResults count])
  {
    v330 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieLaughterResults, "count"));
    long long v649 = 0u;
    long long v650 = 0u;
    long long v651 = 0u;
    long long v652 = 0u;
    v331 = self->_movieLaughterResults;
    uint64_t v332 = [(NSMutableArray *)v331 countByEnumeratingWithState:&v649 objects:v861 count:16];
    if (v332)
    {
      uint64_t v333 = v332;
      uint64_t v334 = *(void *)v650;
      do
      {
        for (uint64_t i36 = 0; i36 != v333; ++i36)
        {
          if (*(void *)v650 != v334) {
            objc_enumerationMutation(v331);
          }
          v336 = [*(id *)(*((void *)&v649 + 1) + 8 * i36) dictionaryRepresentation];
          [v330 addObject:v336];
        }
        uint64_t v333 = [(NSMutableArray *)v331 countByEnumeratingWithState:&v649 objects:v861 count:16];
      }
      while (v333);
    }

    [v3 setObject:v330 forKey:@"movieLaughterResults"];
  }
  if ([(NSMutableArray *)self->_movieHumanActionResults count])
  {
    v337 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanActionResults, "count"));
    long long v645 = 0u;
    long long v646 = 0u;
    long long v647 = 0u;
    long long v648 = 0u;
    v338 = self->_movieHumanActionResults;
    uint64_t v339 = [(NSMutableArray *)v338 countByEnumeratingWithState:&v645 objects:v860 count:16];
    if (v339)
    {
      uint64_t v340 = v339;
      uint64_t v341 = *(void *)v646;
      do
      {
        for (uint64_t i37 = 0; i37 != v340; ++i37)
        {
          if (*(void *)v646 != v341) {
            objc_enumerationMutation(v338);
          }
          v343 = [*(id *)(*((void *)&v645 + 1) + 8 * i37) dictionaryRepresentation];
          [v337 addObject:v343];
        }
        uint64_t v340 = [(NSMutableArray *)v338 countByEnumeratingWithState:&v645 objects:v860 count:16];
      }
      while (v340);
    }

    [v3 setObject:v337 forKey:@"movieHumanActionResults"];
  }
  if ([(NSMutableArray *)self->_movieLoudnessResults count])
  {
    v344 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieLoudnessResults, "count"));
    long long v641 = 0u;
    long long v642 = 0u;
    long long v643 = 0u;
    long long v644 = 0u;
    v345 = self->_movieLoudnessResults;
    uint64_t v346 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v641 objects:v859 count:16];
    if (v346)
    {
      uint64_t v347 = v346;
      uint64_t v348 = *(void *)v642;
      do
      {
        for (uint64_t i38 = 0; i38 != v347; ++i38)
        {
          if (*(void *)v642 != v348) {
            objc_enumerationMutation(v345);
          }
          v350 = [*(id *)(*((void *)&v641 + 1) + 8 * i38) dictionaryRepresentation];
          [v344 addObject:v350];
        }
        uint64_t v347 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v641 objects:v859 count:16];
      }
      while (v347);
    }

    [v3 setObject:v344 forKey:@"movieLoudnessResults"];
  }
  if ([(NSMutableArray *)self->_moviePetsResults count])
  {
    v351 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_moviePetsResults, "count"));
    long long v637 = 0u;
    long long v638 = 0u;
    long long v639 = 0u;
    long long v640 = 0u;
    v352 = self->_moviePetsResults;
    uint64_t v353 = [(NSMutableArray *)v352 countByEnumeratingWithState:&v637 objects:v858 count:16];
    if (v353)
    {
      uint64_t v354 = v353;
      uint64_t v355 = *(void *)v638;
      do
      {
        for (uint64_t i39 = 0; i39 != v354; ++i39)
        {
          if (*(void *)v638 != v355) {
            objc_enumerationMutation(v352);
          }
          v357 = [*(id *)(*((void *)&v637 + 1) + 8 * i39) dictionaryRepresentation];
          [v351 addObject:v357];
        }
        uint64_t v354 = [(NSMutableArray *)v352 countByEnumeratingWithState:&v637 objects:v858 count:16];
      }
      while (v354);
    }

    [v3 setObject:v351 forKey:@"moviePetsResults"];
  }
  if ([(NSMutableArray *)self->_moviePetsFaceResults count])
  {
    v358 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_moviePetsFaceResults, "count"));
    long long v633 = 0u;
    long long v634 = 0u;
    long long v635 = 0u;
    long long v636 = 0u;
    v359 = self->_moviePetsFaceResults;
    uint64_t v360 = [(NSMutableArray *)v359 countByEnumeratingWithState:&v633 objects:v857 count:16];
    if (v360)
    {
      uint64_t v361 = v360;
      uint64_t v362 = *(void *)v634;
      do
      {
        for (uint64_t i40 = 0; i40 != v361; ++i40)
        {
          if (*(void *)v634 != v362) {
            objc_enumerationMutation(v359);
          }
          v364 = [*(id *)(*((void *)&v633 + 1) + 8 * i40) dictionaryRepresentation];
          [v358 addObject:v364];
        }
        uint64_t v361 = [(NSMutableArray *)v359 countByEnumeratingWithState:&v633 objects:v857 count:16];
      }
      while (v361);
    }

    [v3 setObject:v358 forKey:@"moviePetsFaceResults"];
  }
  if ([(NSMutableArray *)self->_movieStabilizationResults count])
  {
    v365 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieStabilizationResults, "count"));
    long long v629 = 0u;
    long long v630 = 0u;
    long long v631 = 0u;
    long long v632 = 0u;
    v366 = self->_movieStabilizationResults;
    uint64_t v367 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v629 objects:v856 count:16];
    if (v367)
    {
      uint64_t v368 = v367;
      uint64_t v369 = *(void *)v630;
      do
      {
        for (uint64_t i41 = 0; i41 != v368; ++i41)
        {
          if (*(void *)v630 != v369) {
            objc_enumerationMutation(v366);
          }
          v371 = [*(id *)(*((void *)&v629 + 1) + 8 * i41) dictionaryRepresentation];
          [v365 addObject:v371];
        }
        uint64_t v368 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v629 objects:v856 count:16];
      }
      while (v368);
    }

    [v3 setObject:v365 forKey:@"movieStabilizationResults"];
  }
  if ([(NSMutableArray *)self->_movieHighlightScoreResults count])
  {
    v372 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieHighlightScoreResults, "count"));
    long long v625 = 0u;
    long long v626 = 0u;
    long long v627 = 0u;
    long long v628 = 0u;
    v373 = self->_movieHighlightScoreResults;
    uint64_t v374 = [(NSMutableArray *)v373 countByEnumeratingWithState:&v625 objects:v855 count:16];
    if (v374)
    {
      uint64_t v375 = v374;
      uint64_t v376 = *(void *)v626;
      do
      {
        for (uint64_t i42 = 0; i42 != v375; ++i42)
        {
          if (*(void *)v626 != v376) {
            objc_enumerationMutation(v373);
          }
          v378 = [*(id *)(*((void *)&v625 + 1) + 8 * i42) dictionaryRepresentation];
          [v372 addObject:v378];
        }
        uint64_t v375 = [(NSMutableArray *)v373 countByEnumeratingWithState:&v625 objects:v855 count:16];
      }
      while (v375);
    }

    [v3 setObject:v372 forKey:@"movieHighlightScoreResults"];
  }
  if ([(NSMutableArray *)self->_livePhotoHumanActionClassificationResults count])
  {
    v379 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoHumanActionClassificationResults, "count"));
    long long v621 = 0u;
    long long v622 = 0u;
    long long v623 = 0u;
    long long v624 = 0u;
    v380 = self->_livePhotoHumanActionClassificationResults;
    uint64_t v381 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v621 objects:v854 count:16];
    if (v381)
    {
      uint64_t v382 = v381;
      uint64_t v383 = *(void *)v622;
      do
      {
        for (uint64_t i43 = 0; i43 != v382; ++i43)
        {
          if (*(void *)v622 != v383) {
            objc_enumerationMutation(v380);
          }
          v385 = [*(id *)(*((void *)&v621 + 1) + 8 * i43) dictionaryRepresentation];
          [v379 addObject:v385];
        }
        uint64_t v382 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v621 objects:v854 count:16];
      }
      while (v382);
    }

    [v3 setObject:v379 forKey:@"livePhotoHumanActionClassificationResults"];
  }
  if ([(NSMutableArray *)self->_movieAudioQualityResults count])
  {
    v386 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieAudioQualityResults, "count"));
    long long v617 = 0u;
    long long v618 = 0u;
    long long v619 = 0u;
    long long v620 = 0u;
    v387 = self->_movieAudioQualityResults;
    uint64_t v388 = [(NSMutableArray *)v387 countByEnumeratingWithState:&v617 objects:v853 count:16];
    if (v388)
    {
      uint64_t v389 = v388;
      uint64_t v390 = *(void *)v618;
      do
      {
        for (uint64_t i44 = 0; i44 != v389; ++i44)
        {
          if (*(void *)v618 != v390) {
            objc_enumerationMutation(v387);
          }
          v392 = [*(id *)(*((void *)&v617 + 1) + 8 * i44) dictionaryRepresentation];
          [v386 addObject:v392];
        }
        uint64_t v389 = [(NSMutableArray *)v387 countByEnumeratingWithState:&v617 objects:v853 count:16];
      }
      while (v389);
    }

    [v3 setObject:v386 forKey:@"movieAudioQualityResults"];
  }
  if ([(NSMutableArray *)self->_movieSafetyResults count])
  {
    v393 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieSafetyResults, "count"));
    long long v613 = 0u;
    long long v614 = 0u;
    long long v615 = 0u;
    long long v616 = 0u;
    v394 = self->_movieSafetyResults;
    uint64_t v395 = [(NSMutableArray *)v394 countByEnumeratingWithState:&v613 objects:v852 count:16];
    if (v395)
    {
      uint64_t v396 = v395;
      uint64_t v397 = *(void *)v614;
      do
      {
        for (uint64_t i45 = 0; i45 != v396; ++i45)
        {
          if (*(void *)v614 != v397) {
            objc_enumerationMutation(v394);
          }
          v399 = [*(id *)(*((void *)&v613 + 1) + 8 * i45) dictionaryRepresentation];
          [v393 addObject:v399];
        }
        uint64_t v396 = [(NSMutableArray *)v394 countByEnumeratingWithState:&v613 objects:v852 count:16];
      }
      while (v396);
    }

    [v3 setObject:v393 forKey:@"movieSafetyResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieClassificationResults count])
  {
    v400 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieClassificationResults, "count"));
    long long v609 = 0u;
    long long v610 = 0u;
    long long v611 = 0u;
    long long v612 = 0u;
    v401 = self->_filesystemMovieClassificationResults;
    uint64_t v402 = [(NSMutableArray *)v401 countByEnumeratingWithState:&v609 objects:v851 count:16];
    if (v402)
    {
      uint64_t v403 = v402;
      uint64_t v404 = *(void *)v610;
      do
      {
        for (uint64_t i46 = 0; i46 != v403; ++i46)
        {
          if (*(void *)v610 != v404) {
            objc_enumerationMutation(v401);
          }
          v406 = [*(id *)(*((void *)&v609 + 1) + 8 * i46) dictionaryRepresentation];
          [v400 addObject:v406];
        }
        uint64_t v403 = [(NSMutableArray *)v401 countByEnumeratingWithState:&v609 objects:v851 count:16];
      }
      while (v403);
    }

    [v3 setObject:v400 forKey:@"filesystemMovieClassificationResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieHumanActionClassificationResults count])
  {
    v407 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieHumanActionClassificationResults, "count"));
    long long v605 = 0u;
    long long v606 = 0u;
    long long v607 = 0u;
    long long v608 = 0u;
    v408 = self->_filesystemMovieHumanActionClassificationResults;
    uint64_t v409 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v605 objects:v850 count:16];
    if (v409)
    {
      uint64_t v410 = v409;
      uint64_t v411 = *(void *)v606;
      do
      {
        for (uint64_t i47 = 0; i47 != v410; ++i47)
        {
          if (*(void *)v606 != v411) {
            objc_enumerationMutation(v408);
          }
          v413 = [*(id *)(*((void *)&v605 + 1) + 8 * i47) dictionaryRepresentation];
          [v407 addObject:v413];
        }
        uint64_t v410 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v605 objects:v850 count:16];
      }
      while (v410);
    }

    [v3 setObject:v407 forKey:@"filesystemMovieHumanActionClassificationResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieApplauseResults count])
  {
    v414 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieApplauseResults, "count"));
    long long v601 = 0u;
    long long v602 = 0u;
    long long v603 = 0u;
    long long v604 = 0u;
    v415 = self->_filesystemMovieApplauseResults;
    uint64_t v416 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v601 objects:v849 count:16];
    if (v416)
    {
      uint64_t v417 = v416;
      uint64_t v418 = *(void *)v602;
      do
      {
        for (uint64_t i48 = 0; i48 != v417; ++i48)
        {
          if (*(void *)v602 != v418) {
            objc_enumerationMutation(v415);
          }
          v420 = [*(id *)(*((void *)&v601 + 1) + 8 * i48) dictionaryRepresentation];
          [v414 addObject:v420];
        }
        uint64_t v417 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v601 objects:v849 count:16];
      }
      while (v417);
    }

    [v3 setObject:v414 forKey:@"filesystemMovieApplauseResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieBabbleResults count])
  {
    v421 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieBabbleResults, "count"));
    long long v597 = 0u;
    long long v598 = 0u;
    long long v599 = 0u;
    long long v600 = 0u;
    v422 = self->_filesystemMovieBabbleResults;
    uint64_t v423 = [(NSMutableArray *)v422 countByEnumeratingWithState:&v597 objects:v848 count:16];
    if (v423)
    {
      uint64_t v424 = v423;
      uint64_t v425 = *(void *)v598;
      do
      {
        for (uint64_t i49 = 0; i49 != v424; ++i49)
        {
          if (*(void *)v598 != v425) {
            objc_enumerationMutation(v422);
          }
          v427 = [*(id *)(*((void *)&v597 + 1) + 8 * i49) dictionaryRepresentation];
          [v421 addObject:v427];
        }
        uint64_t v424 = [(NSMutableArray *)v422 countByEnumeratingWithState:&v597 objects:v848 count:16];
      }
      while (v424);
    }

    [v3 setObject:v421 forKey:@"filesystemMovieBabbleResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieCheeringResults count])
  {
    v428 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieCheeringResults, "count"));
    long long v593 = 0u;
    long long v594 = 0u;
    long long v595 = 0u;
    long long v596 = 0u;
    v429 = self->_filesystemMovieCheeringResults;
    uint64_t v430 = [(NSMutableArray *)v429 countByEnumeratingWithState:&v593 objects:v847 count:16];
    if (v430)
    {
      uint64_t v431 = v430;
      uint64_t v432 = *(void *)v594;
      do
      {
        for (uint64_t i50 = 0; i50 != v431; ++i50)
        {
          if (*(void *)v594 != v432) {
            objc_enumerationMutation(v429);
          }
          v434 = [*(id *)(*((void *)&v593 + 1) + 8 * i50) dictionaryRepresentation];
          [v428 addObject:v434];
        }
        uint64_t v431 = [(NSMutableArray *)v429 countByEnumeratingWithState:&v593 objects:v847 count:16];
      }
      while (v431);
    }

    [v3 setObject:v428 forKey:@"filesystemMovieCheeringResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieLaughterResults count])
  {
    v435 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieLaughterResults, "count"));
    long long v589 = 0u;
    long long v590 = 0u;
    long long v591 = 0u;
    long long v592 = 0u;
    v436 = self->_filesystemMovieLaughterResults;
    uint64_t v437 = [(NSMutableArray *)v436 countByEnumeratingWithState:&v589 objects:v846 count:16];
    if (v437)
    {
      uint64_t v438 = v437;
      uint64_t v439 = *(void *)v590;
      do
      {
        for (uint64_t i51 = 0; i51 != v438; ++i51)
        {
          if (*(void *)v590 != v439) {
            objc_enumerationMutation(v436);
          }
          v441 = [*(id *)(*((void *)&v589 + 1) + 8 * i51) dictionaryRepresentation];
          [v435 addObject:v441];
        }
        uint64_t v438 = [(NSMutableArray *)v436 countByEnumeratingWithState:&v589 objects:v846 count:16];
      }
      while (v438);
    }

    [v3 setObject:v435 forKey:@"filesystemMovieLaughterResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieMusicResults count])
  {
    v442 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieMusicResults, "count"));
    long long v585 = 0u;
    long long v586 = 0u;
    long long v587 = 0u;
    long long v588 = 0u;
    v443 = self->_filesystemMovieMusicResults;
    uint64_t v444 = [(NSMutableArray *)v443 countByEnumeratingWithState:&v585 objects:v845 count:16];
    if (v444)
    {
      uint64_t v445 = v444;
      uint64_t v446 = *(void *)v586;
      do
      {
        for (uint64_t i52 = 0; i52 != v445; ++i52)
        {
          if (*(void *)v586 != v446) {
            objc_enumerationMutation(v443);
          }
          v448 = [*(id *)(*((void *)&v585 + 1) + 8 * i52) dictionaryRepresentation];
          [v442 addObject:v448];
        }
        uint64_t v445 = [(NSMutableArray *)v443 countByEnumeratingWithState:&v585 objects:v845 count:16];
      }
      while (v445);
    }

    [v3 setObject:v442 forKey:@"filesystemMovieMusicResults"];
  }
  if ([(NSMutableArray *)self->_filesystemMovieVoiceResults count])
  {
    v449 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieVoiceResults, "count"));
    long long v581 = 0u;
    long long v582 = 0u;
    long long v583 = 0u;
    long long v584 = 0u;
    v450 = self->_filesystemMovieVoiceResults;
    uint64_t v451 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v581 objects:v844 count:16];
    if (v451)
    {
      uint64_t v452 = v451;
      uint64_t v453 = *(void *)v582;
      do
      {
        for (uint64_t i53 = 0; i53 != v452; ++i53)
        {
          if (*(void *)v582 != v453) {
            objc_enumerationMutation(v450);
          }
          v455 = [*(id *)(*((void *)&v581 + 1) + 8 * i53) dictionaryRepresentation];
          [v449 addObject:v455];
        }
        uint64_t v452 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v581 objects:v844 count:16];
      }
      while (v452);
    }

    [v3 setObject:v449 forKey:@"filesystemMovieVoiceResults"];
  }
  if ([(NSMutableArray *)self->_animatedStickerResults count])
  {
    v456 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_animatedStickerResults, "count"));
    long long v577 = 0u;
    long long v578 = 0u;
    long long v579 = 0u;
    long long v580 = 0u;
    v457 = self->_animatedStickerResults;
    uint64_t v458 = [(NSMutableArray *)v457 countByEnumeratingWithState:&v577 objects:v843 count:16];
    if (v458)
    {
      uint64_t v459 = v458;
      uint64_t v460 = *(void *)v578;
      do
      {
        for (uint64_t i54 = 0; i54 != v459; ++i54)
        {
          if (*(void *)v578 != v460) {
            objc_enumerationMutation(v457);
          }
          v462 = [*(id *)(*((void *)&v577 + 1) + 8 * i54) dictionaryRepresentation];
          [v456 addObject:v462];
        }
        uint64_t v459 = [(NSMutableArray *)v457 countByEnumeratingWithState:&v577 objects:v843 count:16];
      }
      while (v459);
    }

    [v3 setObject:v456 forKey:@"animatedStickerResults"];
  }
  if ([(NSMutableArray *)self->_movieTorsoResults count])
  {
    v463 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieTorsoResults, "count"));
    long long v573 = 0u;
    long long v574 = 0u;
    long long v575 = 0u;
    long long v576 = 0u;
    v464 = self->_movieTorsoResults;
    uint64_t v465 = [(NSMutableArray *)v464 countByEnumeratingWithState:&v573 objects:v842 count:16];
    if (v465)
    {
      uint64_t v466 = v465;
      uint64_t v467 = *(void *)v574;
      do
      {
        for (uint64_t i55 = 0; i55 != v466; ++i55)
        {
          if (*(void *)v574 != v467) {
            objc_enumerationMutation(v464);
          }
          v469 = [*(id *)(*((void *)&v573 + 1) + 8 * i55) dictionaryRepresentation];
          [v463 addObject:v469];
        }
        uint64_t v466 = [(NSMutableArray *)v464 countByEnumeratingWithState:&v573 objects:v842 count:16];
      }
      while (v466);
    }

    [v3 setObject:v463 forKey:@"movieTorsoResults"];
  }
  if ([(NSMutableArray *)self->_movieHumanActionClassificationResults count])
  {
    v470 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanActionClassificationResults, "count"));
    long long v569 = 0u;
    long long v570 = 0u;
    long long v571 = 0u;
    long long v572 = 0u;
    v471 = self->_movieHumanActionClassificationResults;
    uint64_t v472 = [(NSMutableArray *)v471 countByEnumeratingWithState:&v569 objects:v841 count:16];
    if (v472)
    {
      uint64_t v473 = v472;
      uint64_t v474 = *(void *)v570;
      do
      {
        for (uint64_t i56 = 0; i56 != v473; ++i56)
        {
          if (*(void *)v570 != v474) {
            objc_enumerationMutation(v471);
          }
          v476 = [*(id *)(*((void *)&v569 + 1) + 8 * i56) dictionaryRepresentation];
          [v470 addObject:v476];
        }
        uint64_t v473 = [(NSMutableArray *)v471 countByEnumeratingWithState:&v569 objects:v841 count:16];
      }
      while (v473);
    }

    [v3 setObject:v470 forKey:@"movieHumanActionClassificationResults"];
  }
  if ([(NSMutableArray *)self->_videoEmbeddingResults count])
  {
    v477 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoEmbeddingResults, "count"));
    long long v565 = 0u;
    long long v566 = 0u;
    long long v567 = 0u;
    long long v568 = 0u;
    v478 = self->_videoEmbeddingResults;
    uint64_t v479 = [(NSMutableArray *)v478 countByEnumeratingWithState:&v565 objects:v840 count:16];
    if (v479)
    {
      uint64_t v480 = v479;
      uint64_t v481 = *(void *)v566;
      do
      {
        for (uint64_t i57 = 0; i57 != v480; ++i57)
        {
          if (*(void *)v566 != v481) {
            objc_enumerationMutation(v478);
          }
          v483 = [*(id *)(*((void *)&v565 + 1) + 8 * i57) dictionaryRepresentation];
          [v477 addObject:v483];
        }
        uint64_t v480 = [(NSMutableArray *)v478 countByEnumeratingWithState:&v565 objects:v840 count:16];
      }
      while (v480);
    }

    [v3 setObject:v477 forKey:@"videoEmbeddingResults"];
  }
  if ([(NSMutableArray *)self->_summarizedEmbeddingResults count])
  {
    v484 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_summarizedEmbeddingResults, "count"));
    long long v561 = 0u;
    long long v562 = 0u;
    long long v563 = 0u;
    long long v564 = 0u;
    v485 = self->_summarizedEmbeddingResults;
    uint64_t v486 = [(NSMutableArray *)v485 countByEnumeratingWithState:&v561 objects:v839 count:16];
    if (v486)
    {
      uint64_t v487 = v486;
      uint64_t v488 = *(void *)v562;
      do
      {
        for (uint64_t i58 = 0; i58 != v487; ++i58)
        {
          if (*(void *)v562 != v488) {
            objc_enumerationMutation(v485);
          }
          v490 = [*(id *)(*((void *)&v561 + 1) + 8 * i58) dictionaryRepresentation];
          [v484 addObject:v490];
        }
        uint64_t v487 = [(NSMutableArray *)v485 countByEnumeratingWithState:&v561 objects:v839 count:16];
      }
      while (v487);
    }

    [v3 setObject:v484 forKey:@"summarizedEmbeddingResults"];
  }
  if ([(NSMutableArray *)self->_audioFusedVideoEmbeddingResults count])
  {
    v491 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_audioFusedVideoEmbeddingResults, "count"));
    long long v557 = 0u;
    long long v558 = 0u;
    long long v559 = 0u;
    long long v560 = 0u;
    v492 = self->_audioFusedVideoEmbeddingResults;
    uint64_t v493 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v557 objects:v838 count:16];
    if (v493)
    {
      uint64_t v494 = v493;
      uint64_t v495 = *(void *)v558;
      do
      {
        for (uint64_t i59 = 0; i59 != v494; ++i59)
        {
          if (*(void *)v558 != v495) {
            objc_enumerationMutation(v492);
          }
          v497 = [*(id *)(*((void *)&v557 + 1) + 8 * i59) dictionaryRepresentation];
          [v491 addObject:v497];
        }
        uint64_t v494 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v557 objects:v838 count:16];
      }
      while (v494);
    }

    [v3 setObject:v491 forKey:@"audioFusedVideoEmbeddingResults"];
  }
  if ([(NSMutableArray *)self->_imageEmbeddingResults count])
  {
    v498 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageEmbeddingResults, "count"));
    long long v553 = 0u;
    long long v554 = 0u;
    long long v555 = 0u;
    long long v556 = 0u;
    v499 = self->_imageEmbeddingResults;
    uint64_t v500 = [(NSMutableArray *)v499 countByEnumeratingWithState:&v553 objects:v837 count:16];
    if (v500)
    {
      uint64_t v501 = v500;
      uint64_t v502 = *(void *)v554;
      do
      {
        for (uint64_t i60 = 0; i60 != v501; ++i60)
        {
          if (*(void *)v554 != v502) {
            objc_enumerationMutation(v499);
          }
          v504 = [*(id *)(*((void *)&v553 + 1) + 8 * i60) dictionaryRepresentation];
          [v498 addObject:v504];
        }
        uint64_t v501 = [(NSMutableArray *)v499 countByEnumeratingWithState:&v553 objects:v837 count:16];
      }
      while (v501);
    }

    [v3 setObject:v498 forKey:@"imageEmbeddingResults"];
  }
  if ([(NSMutableArray *)self->_imageCaptionResults count])
  {
    v505 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_imageCaptionResults, "count"));
    long long v549 = 0u;
    long long v550 = 0u;
    long long v551 = 0u;
    long long v552 = 0u;
    v506 = self->_imageCaptionResults;
    uint64_t v507 = [(NSMutableArray *)v506 countByEnumeratingWithState:&v549 objects:v836 count:16];
    if (v507)
    {
      uint64_t v508 = v507;
      uint64_t v509 = *(void *)v550;
      do
      {
        for (uint64_t i61 = 0; i61 != v508; ++i61)
        {
          if (*(void *)v550 != v509) {
            objc_enumerationMutation(v506);
          }
          v511 = [*(id *)(*((void *)&v549 + 1) + 8 * i61) dictionaryRepresentation];
          [v505 addObject:v511];
        }
        uint64_t v508 = [(NSMutableArray *)v506 countByEnumeratingWithState:&v549 objects:v836 count:16];
      }
      while (v508);
    }

    [v3 setObject:v505 forKey:@"imageCaptionResults"];
  }
  if ([(NSMutableArray *)self->_videoCaptionResults count])
  {
    v512 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoCaptionResults, "count"));
    long long v545 = 0u;
    long long v546 = 0u;
    long long v547 = 0u;
    long long v548 = 0u;
    v513 = self->_videoCaptionResults;
    uint64_t v514 = [(NSMutableArray *)v513 countByEnumeratingWithState:&v545 objects:v835 count:16];
    if (v514)
    {
      uint64_t v515 = v514;
      uint64_t v516 = *(void *)v546;
      do
      {
        for (uint64_t i62 = 0; i62 != v515; ++i62)
        {
          if (*(void *)v546 != v516) {
            objc_enumerationMutation(v513);
          }
          v518 = [*(id *)(*((void *)&v545 + 1) + 8 * i62) dictionaryRepresentation];
          [v512 addObject:v518];
        }
        uint64_t v515 = [(NSMutableArray *)v513 countByEnumeratingWithState:&v545 objects:v835 count:16];
      }
      while (v515);
    }

    [v3 setObject:v512 forKey:@"videoCaptionResults"];
  }
  if ([(NSMutableArray *)self->_videoCaptionPreferenceResults count])
  {
    v519 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoCaptionPreferenceResults, "count"));
    long long v541 = 0u;
    long long v542 = 0u;
    long long v543 = 0u;
    long long v544 = 0u;
    v520 = self->_videoCaptionPreferenceResults;
    uint64_t v521 = [(NSMutableArray *)v520 countByEnumeratingWithState:&v541 objects:v834 count:16];
    if (v521)
    {
      uint64_t v522 = v521;
      uint64_t v523 = *(void *)v542;
      do
      {
        for (uint64_t i63 = 0; i63 != v522; ++i63)
        {
          if (*(void *)v542 != v523) {
            objc_enumerationMutation(v520);
          }
          v525 = [*(id *)(*((void *)&v541 + 1) + 8 * i63) dictionaryRepresentation];
          [v519 addObject:v525];
        }
        uint64_t v522 = [(NSMutableArray *)v520 countByEnumeratingWithState:&v541 objects:v834 count:16];
      }
      while (v522);
    }

    [v3 setObject:v519 forKey:@"videoCaptionPreferenceResults"];
  }
  if ([(NSMutableArray *)self->_videoSegmentCaptionResults count])
  {
    v526 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoSegmentCaptionResults, "count"));
    long long v537 = 0u;
    long long v538 = 0u;
    long long v539 = 0u;
    long long v540 = 0u;
    v527 = self->_videoSegmentCaptionResults;
    uint64_t v528 = [(NSMutableArray *)v527 countByEnumeratingWithState:&v537 objects:v833 count:16];
    if (v528)
    {
      uint64_t v529 = v528;
      uint64_t v530 = *(void *)v538;
      do
      {
        for (uint64_t i64 = 0; i64 != v529; ++i64)
        {
          if (*(void *)v538 != v530) {
            objc_enumerationMutation(v527);
          }
          v532 = objc_msgSend(*(id *)(*((void *)&v537 + 1) + 8 * i64), "dictionaryRepresentation", (void)v537);
          [v526 addObject:v532];
        }
        uint64_t v529 = [(NSMutableArray *)v527 countByEnumeratingWithState:&v537 objects:v833 count:16];
      }
      while (v529);
    }

    [v3 setObject:v526 forKey:@"videoSegmentCaptionResults"];
  }
  id v533 = v3;

  return v533;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoAssetAnalysisReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v745 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  if (self->_assetMasterFingerprint) {
    PBDataWriterWriteStringField();
  }
  if (self->_assetAdjustedFingerprint) {
    PBDataWriterWriteStringField();
  }
  long long v670 = 0u;
  long long v669 = 0u;
  long long v668 = 0u;
  long long v667 = 0u;
  v5 = self->_imageBlurResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v667 objects:v744 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v668;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v668 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v667 objects:v744 count:16];
    }
    while (v7);
  }

  long long v666 = 0u;
  long long v665 = 0u;
  long long v664 = 0u;
  long long v663 = 0u;
  v10 = self->_imageCompositionResults;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v663 objects:v743 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v664;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v664 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v663 objects:v743 count:16];
    }
    while (v12);
  }

  long long v662 = 0u;
  long long v661 = 0u;
  long long v660 = 0u;
  long long v659 = 0u;
  v15 = self->_imageFaceResults;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v659 objects:v742 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v660;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v660 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v659 objects:v742 count:16];
    }
    while (v17);
  }

  long long v658 = 0u;
  long long v657 = 0u;
  long long v656 = 0u;
  long long v655 = 0u;
  v20 = self->_imageFeatureResults;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v655 objects:v741 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v656;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v656 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v655 objects:v741 count:16];
    }
    while (v22);
  }

  long long v654 = 0u;
  long long v653 = 0u;
  long long v652 = 0u;
  long long v651 = 0u;
  uint64_t v25 = self->_imageJunkResults;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v651 objects:v740 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v652;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v652 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v651 objects:v740 count:16];
    }
    while (v27);
  }

  long long v650 = 0u;
  long long v649 = 0u;
  long long v648 = 0u;
  long long v647 = 0u;
  v30 = self->_imageSaliencyResults;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v647 objects:v739 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v648;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v648 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v647 objects:v739 count:16];
    }
    while (v32);
  }

  long long v646 = 0u;
  long long v645 = 0u;
  long long v644 = 0u;
  long long v643 = 0u;
  v35 = self->_imageShotTypeResults;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v643 objects:v738 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v644;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v644 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v643 objects:v738 count:16];
    }
    while (v37);
  }

  long long v642 = 0u;
  long long v641 = 0u;
  long long v640 = 0u;
  long long v639 = 0u;
  uint64_t v40 = self->_livePhotoRecommendationResults;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v639 objects:v737 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v640;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v640 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v639 objects:v737 count:16];
    }
    while (v42);
  }

  long long v638 = 0u;
  long long v637 = 0u;
  long long v636 = 0u;
  long long v635 = 0u;
  uint64_t v45 = self->_livePhotoSharpnessResults;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v635 objects:v736 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v636;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v636 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v635 objects:v736 count:16];
    }
    while (v47);
  }

  long long v634 = 0u;
  long long v633 = 0u;
  long long v632 = 0u;
  long long v631 = 0u;
  v50 = self->_movieActivityLevelResults;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v631 objects:v735 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v632;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v632 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v631 objects:v735 count:16];
    }
    while (v52);
  }

  long long v630 = 0u;
  long long v629 = 0u;
  long long v628 = 0u;
  long long v627 = 0u;
  v55 = self->_movieCameraMotionResults;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v627 objects:v734 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v628;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v628 != v58) {
          objc_enumerationMutation(v55);
        }
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v627 objects:v734 count:16];
    }
    while (v57);
  }

  long long v626 = 0u;
  long long v625 = 0u;
  long long v624 = 0u;
  long long v623 = 0u;
  uint64_t v60 = self->_movieClassificationResults;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v623 objects:v733 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v624;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v624 != v63) {
          objc_enumerationMutation(v60);
        }
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v623 objects:v733 count:16];
    }
    while (v62);
  }

  long long v622 = 0u;
  long long v621 = 0u;
  long long v620 = 0u;
  long long v619 = 0u;
  v65 = self->_movieFaceResults;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v619 objects:v732 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v620;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v620 != v68) {
          objc_enumerationMutation(v65);
        }
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v619 objects:v732 count:16];
    }
    while (v67);
  }

  long long v618 = 0u;
  long long v617 = 0u;
  long long v616 = 0u;
  long long v615 = 0u;
  v70 = self->_movieFaceprintResults;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v615 objects:v731 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v616;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v616 != v73) {
          objc_enumerationMutation(v70);
        }
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v615 objects:v731 count:16];
    }
    while (v72);
  }

  long long v614 = 0u;
  long long v613 = 0u;
  long long v612 = 0u;
  long long v611 = 0u;
  uint64_t v75 = self->_movieFeatureResults;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v611 objects:v730 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v612;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v612 != v78) {
          objc_enumerationMutation(v75);
        }
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v611 objects:v730 count:16];
    }
    while (v77);
  }

  long long v610 = 0u;
  long long v609 = 0u;
  long long v608 = 0u;
  long long v607 = 0u;
  uint64_t v80 = self->_movieFineSubjectMotionResults;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v607 objects:v729 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v608;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v608 != v83) {
          objc_enumerationMutation(v80);
        }
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v607 objects:v729 count:16];
    }
    while (v82);
  }

  long long v606 = 0u;
  long long v605 = 0u;
  long long v604 = 0u;
  long long v603 = 0u;
  v85 = self->_movieInterestingnessResults;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v603 objects:v728 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v604;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v604 != v88) {
          objc_enumerationMutation(v85);
        }
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v603 objects:v728 count:16];
    }
    while (v87);
  }

  long long v602 = 0u;
  long long v601 = 0u;
  long long v600 = 0u;
  long long v599 = 0u;
  v90 = self->_movieMovingObjectResults;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v599 objects:v727 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v600;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v600 != v93) {
          objc_enumerationMutation(v90);
        }
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v599 objects:v727 count:16];
    }
    while (v92);
  }

  long long v598 = 0u;
  long long v597 = 0u;
  long long v596 = 0u;
  long long v595 = 0u;
  uint64_t v95 = self->_movieMusicResults;
  uint64_t v96 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v595 objects:v726 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v596;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v596 != v98) {
          objc_enumerationMutation(v95);
        }
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      uint64_t v97 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v595 objects:v726 count:16];
    }
    while (v97);
  }

  long long v594 = 0u;
  long long v593 = 0u;
  long long v592 = 0u;
  long long v591 = 0u;
  v100 = self->_movieObstructionResults;
  uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v591 objects:v725 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v592;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v592 != v103) {
          objc_enumerationMutation(v100);
        }
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      uint64_t v102 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v591 objects:v725 count:16];
    }
    while (v102);
  }

  long long v590 = 0u;
  long long v589 = 0u;
  long long v588 = 0u;
  long long v587 = 0u;
  v105 = self->_movieOrientationResults;
  uint64_t v106 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v587 objects:v724 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v588;
    do
    {
      uint64_t v109 = 0;
      do
      {
        if (*(void *)v588 != v108) {
          objc_enumerationMutation(v105);
        }
        PBDataWriterWriteSubmessage();
        ++v109;
      }
      while (v107 != v109);
      uint64_t v107 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v587 objects:v724 count:16];
    }
    while (v107);
  }

  long long v586 = 0u;
  long long v585 = 0u;
  long long v584 = 0u;
  long long v583 = 0u;
  uint64_t v110 = self->_moviePreEncodeResults;
  uint64_t v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v583 objects:v723 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v584;
    do
    {
      uint64_t v114 = 0;
      do
      {
        if (*(void *)v584 != v113) {
          objc_enumerationMutation(v110);
        }
        PBDataWriterWriteSubmessage();
        ++v114;
      }
      while (v112 != v114);
      uint64_t v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v583 objects:v723 count:16];
    }
    while (v112);
  }

  long long v582 = 0u;
  long long v581 = 0u;
  long long v580 = 0u;
  long long v579 = 0u;
  uint64_t v115 = self->_movieQualityResults;
  uint64_t v116 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v579 objects:v722 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v580;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v580 != v118) {
          objc_enumerationMutation(v115);
        }
        PBDataWriterWriteSubmessage();
        ++v119;
      }
      while (v117 != v119);
      uint64_t v117 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v579 objects:v722 count:16];
    }
    while (v117);
  }

  long long v578 = 0u;
  long long v577 = 0u;
  long long v576 = 0u;
  long long v575 = 0u;
  v120 = self->_movieSaliencyResults;
  uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v575 objects:v721 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v576;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v576 != v123) {
          objc_enumerationMutation(v120);
        }
        PBDataWriterWriteSubmessage();
        ++v124;
      }
      while (v122 != v124);
      uint64_t v122 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v575 objects:v721 count:16];
    }
    while (v122);
  }

  long long v574 = 0u;
  long long v573 = 0u;
  long long v572 = 0u;
  long long v571 = 0u;
  v125 = self->_movieSceneResults;
  uint64_t v126 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v571 objects:v720 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v572;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v572 != v128) {
          objc_enumerationMutation(v125);
        }
        PBDataWriterWriteSubmessage();
        ++v129;
      }
      while (v127 != v129);
      uint64_t v127 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v571 objects:v720 count:16];
    }
    while (v127);
  }

  long long v570 = 0u;
  long long v569 = 0u;
  long long v568 = 0u;
  long long v567 = 0u;
  uint64_t v130 = self->_movieSubjectMotionResults;
  uint64_t v131 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v567 objects:v719 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v568;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v568 != v133) {
          objc_enumerationMutation(v130);
        }
        PBDataWriterWriteSubmessage();
        ++v134;
      }
      while (v132 != v134);
      uint64_t v132 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v567 objects:v719 count:16];
    }
    while (v132);
  }

  long long v566 = 0u;
  long long v565 = 0u;
  long long v564 = 0u;
  long long v563 = 0u;
  v135 = self->_movieUtteranceResults;
  uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v563 objects:v718 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v564;
    do
    {
      uint64_t v139 = 0;
      do
      {
        if (*(void *)v564 != v138) {
          objc_enumerationMutation(v135);
        }
        PBDataWriterWriteSubmessage();
        ++v139;
      }
      while (v137 != v139);
      uint64_t v137 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v563 objects:v718 count:16];
    }
    while (v137);
  }

  long long v562 = 0u;
  long long v561 = 0u;
  long long v560 = 0u;
  long long v559 = 0u;
  v140 = self->_movieVoiceResults;
  uint64_t v141 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v559 objects:v717 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v560;
    do
    {
      uint64_t v144 = 0;
      do
      {
        if (*(void *)v560 != v143) {
          objc_enumerationMutation(v140);
        }
        PBDataWriterWriteSubmessage();
        ++v144;
      }
      while (v142 != v144);
      uint64_t v142 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v559 objects:v717 count:16];
    }
    while (v142);
  }

  long long v558 = 0u;
  long long v557 = 0u;
  long long v556 = 0u;
  long long v555 = 0u;
  uint64_t v145 = self->_imagePetsResults;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v555 objects:v716 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v556;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v556 != v148) {
          objc_enumerationMutation(v145);
        }
        PBDataWriterWriteSubmessage();
        ++v149;
      }
      while (v147 != v149);
      uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v555 objects:v716 count:16];
    }
    while (v147);
  }

  long long v554 = 0u;
  long long v553 = 0u;
  long long v552 = 0u;
  long long v551 = 0u;
  uint64_t v150 = self->_movieSummaryResults;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v551 objects:v715 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v552;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v552 != v153) {
          objc_enumerationMutation(v150);
        }
        PBDataWriterWriteSubmessage();
        ++v154;
      }
      while (v152 != v154);
      uint64_t v152 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v551 objects:v715 count:16];
    }
    while (v152);
  }

  long long v550 = 0u;
  long long v549 = 0u;
  long long v548 = 0u;
  long long v547 = 0u;
  v155 = self->_movieHighlightResults;
  uint64_t v156 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v547 objects:v714 count:16];
  if (v156)
  {
    uint64_t v157 = v156;
    uint64_t v158 = *(void *)v548;
    do
    {
      uint64_t v159 = 0;
      do
      {
        if (*(void *)v548 != v158) {
          objc_enumerationMutation(v155);
        }
        PBDataWriterWriteSubmessage();
        ++v159;
      }
      while (v157 != v159);
      uint64_t v157 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v547 objects:v714 count:16];
    }
    while (v157);
  }

  long long v546 = 0u;
  long long v545 = 0u;
  long long v544 = 0u;
  long long v543 = 0u;
  v160 = self->_imageExposureResults;
  uint64_t v161 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v543 objects:v713 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v544;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v544 != v163) {
          objc_enumerationMutation(v160);
        }
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      uint64_t v162 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v543 objects:v713 count:16];
    }
    while (v162);
  }

  long long v542 = 0u;
  long long v541 = 0u;
  long long v540 = 0u;
  long long v539 = 0u;
  uint64_t v165 = self->_livePhotoEffectsResults;
  uint64_t v166 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v539 objects:v712 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v540;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v540 != v168) {
          objc_enumerationMutation(v165);
        }
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      uint64_t v167 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v539 objects:v712 count:16];
    }
    while (v167);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v538 = 0u;
  long long v537 = 0u;
  long long v536 = 0u;
  long long v535 = 0u;
  v170 = self->_imagePetsFaceResults;
  uint64_t v171 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v535 objects:v711 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v536;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v536 != v173) {
          objc_enumerationMutation(v170);
        }
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      uint64_t v172 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v535 objects:v711 count:16];
    }
    while (v172);
  }

  long long v534 = 0u;
  long long v533 = 0u;
  long long v532 = 0u;
  long long v531 = 0u;
  v175 = self->_imageSceneprintResults;
  uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v531 objects:v710 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v532;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v532 != v178) {
          objc_enumerationMutation(v175);
        }
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v531 objects:v710 count:16];
    }
    while (v177);
  }

  long long v530 = 0u;
  long long v529 = 0u;
  long long v528 = 0u;
  long long v527 = 0u;
  uint64_t v180 = self->_movieSceneprintResults;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v527 objects:v709 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v528;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v528 != v183) {
          objc_enumerationMutation(v180);
        }
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v527 objects:v709 count:16];
    }
    while (v182);
  }

  long long v526 = 0u;
  long long v525 = 0u;
  long long v524 = 0u;
  long long v523 = 0u;
  uint64_t v185 = self->_imageHumanPoseResults;
  uint64_t v186 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v523 objects:v708 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v524;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v524 != v188) {
          objc_enumerationMutation(v185);
        }
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      uint64_t v187 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v523 objects:v708 count:16];
    }
    while (v187);
  }

  long long v522 = 0u;
  long long v521 = 0u;
  long long v520 = 0u;
  long long v519 = 0u;
  v190 = self->_movieHumanPoseResults;
  uint64_t v191 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v519 objects:v707 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v520;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v520 != v193) {
          objc_enumerationMutation(v190);
        }
        PBDataWriterWriteSubmessage();
        ++v194;
      }
      while (v192 != v194);
      uint64_t v192 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v519 objects:v707 count:16];
    }
    while (v192);
  }

  long long v518 = 0u;
  long long v517 = 0u;
  long long v516 = 0u;
  long long v515 = 0u;
  v195 = self->_movieApplauseResults;
  uint64_t v196 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v515 objects:v706 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v516;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v516 != v198) {
          objc_enumerationMutation(v195);
        }
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      uint64_t v197 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v515 objects:v706 count:16];
    }
    while (v197);
  }

  long long v514 = 0u;
  long long v513 = 0u;
  long long v512 = 0u;
  long long v511 = 0u;
  uint64_t v200 = self->_movieBabbleResults;
  uint64_t v201 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v511 objects:v705 count:16];
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v512;
    do
    {
      uint64_t v204 = 0;
      do
      {
        if (*(void *)v512 != v203) {
          objc_enumerationMutation(v200);
        }
        PBDataWriterWriteSubmessage();
        ++v204;
      }
      while (v202 != v204);
      uint64_t v202 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v511 objects:v705 count:16];
    }
    while (v202);
  }

  long long v510 = 0u;
  long long v509 = 0u;
  long long v508 = 0u;
  long long v507 = 0u;
  v205 = self->_movieCheeringResults;
  uint64_t v206 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v507 objects:v704 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v508;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v508 != v208) {
          objc_enumerationMutation(v205);
        }
        PBDataWriterWriteSubmessage();
        ++v209;
      }
      while (v207 != v209);
      uint64_t v207 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v507 objects:v704 count:16];
    }
    while (v207);
  }

  long long v506 = 0u;
  long long v505 = 0u;
  long long v504 = 0u;
  long long v503 = 0u;
  v210 = self->_movieLaughterResults;
  uint64_t v211 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v503 objects:v703 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v504;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v504 != v213) {
          objc_enumerationMutation(v210);
        }
        PBDataWriterWriteSubmessage();
        ++v214;
      }
      while (v212 != v214);
      uint64_t v212 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v503 objects:v703 count:16];
    }
    while (v212);
  }

  long long v502 = 0u;
  long long v501 = 0u;
  long long v500 = 0u;
  long long v499 = 0u;
  uint64_t v215 = self->_livePhotoKeyFrameResults;
  uint64_t v216 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v499 objects:v702 count:16];
  if (v216)
  {
    uint64_t v217 = v216;
    uint64_t v218 = *(void *)v500;
    do
    {
      uint64_t v219 = 0;
      do
      {
        if (*(void *)v500 != v218) {
          objc_enumerationMutation(v215);
        }
        PBDataWriterWriteSubmessage();
        ++v219;
      }
      while (v217 != v219);
      uint64_t v217 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v499 objects:v702 count:16];
    }
    while (v217);
  }

  long long v498 = 0u;
  long long v497 = 0u;
  long long v496 = 0u;
  long long v495 = 0u;
  uint64_t v220 = self->_livePhotoKeyFrameStillResults;
  uint64_t v221 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v495 objects:v701 count:16];
  if (v221)
  {
    uint64_t v222 = v221;
    uint64_t v223 = *(void *)v496;
    do
    {
      uint64_t v224 = 0;
      do
      {
        if (*(void *)v496 != v223) {
          objc_enumerationMutation(v220);
        }
        PBDataWriterWriteSubmessage();
        ++v224;
      }
      while (v222 != v224);
      uint64_t v222 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v495 objects:v701 count:16];
    }
    while (v222);
  }

  long long v494 = 0u;
  long long v493 = 0u;
  long long v492 = 0u;
  long long v491 = 0u;
  v225 = self->_movieHumanActionResults;
  uint64_t v226 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v491 objects:v700 count:16];
  if (v226)
  {
    uint64_t v227 = v226;
    uint64_t v228 = *(void *)v492;
    do
    {
      uint64_t v229 = 0;
      do
      {
        if (*(void *)v492 != v228) {
          objc_enumerationMutation(v225);
        }
        PBDataWriterWriteSubmessage();
        ++v229;
      }
      while (v227 != v229);
      uint64_t v227 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v491 objects:v700 count:16];
    }
    while (v227);
  }

  long long v490 = 0u;
  long long v489 = 0u;
  long long v488 = 0u;
  long long v487 = 0u;
  v230 = self->_movieSubtleMotionResults;
  uint64_t v231 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v487 objects:v699 count:16];
  if (v231)
  {
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v488;
    do
    {
      uint64_t v234 = 0;
      do
      {
        if (*(void *)v488 != v233) {
          objc_enumerationMutation(v230);
        }
        PBDataWriterWriteSubmessage();
        ++v234;
      }
      while (v232 != v234);
      uint64_t v232 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v487 objects:v699 count:16];
    }
    while (v232);
  }

  long long v486 = 0u;
  long long v485 = 0u;
  long long v484 = 0u;
  long long v483 = 0u;
  uint64_t v235 = self->_movieLoudnessResults;
  uint64_t v236 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v483 objects:v698 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v484;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v484 != v238) {
          objc_enumerationMutation(v235);
        }
        PBDataWriterWriteSubmessage();
        ++v239;
      }
      while (v237 != v239);
      uint64_t v237 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v483 objects:v698 count:16];
    }
    while (v237);
  }

  long long v482 = 0u;
  long long v481 = 0u;
  long long v480 = 0u;
  long long v479 = 0u;
  v240 = self->_moviePetsResults;
  uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v479 objects:v697 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v480;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v480 != v243) {
          objc_enumerationMutation(v240);
        }
        PBDataWriterWriteSubmessage();
        ++v244;
      }
      while (v242 != v244);
      uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v479 objects:v697 count:16];
    }
    while (v242);
  }

  long long v478 = 0u;
  long long v477 = 0u;
  long long v476 = 0u;
  long long v475 = 0u;
  v245 = self->_moviePetsFaceResults;
  uint64_t v246 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v475 objects:v696 count:16];
  if (v246)
  {
    uint64_t v247 = v246;
    uint64_t v248 = *(void *)v476;
    do
    {
      uint64_t v249 = 0;
      do
      {
        if (*(void *)v476 != v248) {
          objc_enumerationMutation(v245);
        }
        PBDataWriterWriteSubmessage();
        ++v249;
      }
      while (v247 != v249);
      uint64_t v247 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v475 objects:v696 count:16];
    }
    while (v247);
  }

  long long v474 = 0u;
  long long v473 = 0u;
  long long v472 = 0u;
  long long v471 = 0u;
  uint64_t v250 = self->_movieStabilizationResults;
  uint64_t v251 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v471 objects:v695 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v472;
    do
    {
      uint64_t v254 = 0;
      do
      {
        if (*(void *)v472 != v253) {
          objc_enumerationMutation(v250);
        }
        PBDataWriterWriteSubmessage();
        ++v254;
      }
      while (v252 != v254);
      uint64_t v252 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v471 objects:v695 count:16];
    }
    while (v252);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v470 = 0u;
  long long v469 = 0u;
  long long v468 = 0u;
  long long v467 = 0u;
  uint64_t v255 = self->_movieHighlightScoreResults;
  uint64_t v256 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v467 objects:v694 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v468;
    do
    {
      uint64_t v259 = 0;
      do
      {
        if (*(void *)v468 != v258) {
          objc_enumerationMutation(v255);
        }
        PBDataWriterWriteSubmessage();
        ++v259;
      }
      while (v257 != v259);
      uint64_t v257 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v467 objects:v694 count:16];
    }
    while (v257);
  }

  long long v466 = 0u;
  long long v465 = 0u;
  long long v464 = 0u;
  long long v463 = 0u;
  v260 = self->_livePhotoHumanActionClassificationResults;
  uint64_t v261 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v463 objects:v693 count:16];
  if (v261)
  {
    uint64_t v262 = v261;
    uint64_t v263 = *(void *)v464;
    do
    {
      uint64_t v264 = 0;
      do
      {
        if (*(void *)v464 != v263) {
          objc_enumerationMutation(v260);
        }
        PBDataWriterWriteSubmessage();
        ++v264;
      }
      while (v262 != v264);
      uint64_t v262 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v463 objects:v693 count:16];
    }
    while (v262);
  }

  long long v462 = 0u;
  long long v461 = 0u;
  long long v460 = 0u;
  long long v459 = 0u;
  v265 = self->_movieAudioQualityResults;
  uint64_t v266 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v459 objects:v692 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v460;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v460 != v268) {
          objc_enumerationMutation(v265);
        }
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v459 objects:v692 count:16];
    }
    while (v267);
  }

  long long v458 = 0u;
  long long v457 = 0u;
  long long v456 = 0u;
  long long v455 = 0u;
  uint64_t v270 = self->_movieSafetyResults;
  uint64_t v271 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v455 objects:v691 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v456;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v456 != v273) {
          objc_enumerationMutation(v270);
        }
        PBDataWriterWriteSubmessage();
        ++v274;
      }
      while (v272 != v274);
      uint64_t v272 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v455 objects:v691 count:16];
    }
    while (v272);
  }

  long long v454 = 0u;
  long long v453 = 0u;
  long long v452 = 0u;
  long long v451 = 0u;
  v275 = self->_filesystemMovieClassificationResults;
  uint64_t v276 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v451 objects:v690 count:16];
  if (v276)
  {
    uint64_t v277 = v276;
    uint64_t v278 = *(void *)v452;
    do
    {
      uint64_t v279 = 0;
      do
      {
        if (*(void *)v452 != v278) {
          objc_enumerationMutation(v275);
        }
        PBDataWriterWriteSubmessage();
        ++v279;
      }
      while (v277 != v279);
      uint64_t v277 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v451 objects:v690 count:16];
    }
    while (v277);
  }

  long long v450 = 0u;
  long long v449 = 0u;
  long long v448 = 0u;
  long long v447 = 0u;
  v280 = self->_filesystemMovieHumanActionClassificationResults;
  uint64_t v281 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v447 objects:v689 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v448;
    do
    {
      uint64_t v284 = 0;
      do
      {
        if (*(void *)v448 != v283) {
          objc_enumerationMutation(v280);
        }
        PBDataWriterWriteSubmessage();
        ++v284;
      }
      while (v282 != v284);
      uint64_t v282 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v447 objects:v689 count:16];
    }
    while (v282);
  }

  long long v446 = 0u;
  long long v445 = 0u;
  long long v444 = 0u;
  long long v443 = 0u;
  uint64_t v285 = self->_filesystemMovieApplauseResults;
  uint64_t v286 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v443 objects:v688 count:16];
  if (v286)
  {
    uint64_t v287 = v286;
    uint64_t v288 = *(void *)v444;
    do
    {
      uint64_t v289 = 0;
      do
      {
        if (*(void *)v444 != v288) {
          objc_enumerationMutation(v285);
        }
        PBDataWriterWriteSubmessage();
        ++v289;
      }
      while (v287 != v289);
      uint64_t v287 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v443 objects:v688 count:16];
    }
    while (v287);
  }

  long long v442 = 0u;
  long long v441 = 0u;
  long long v440 = 0u;
  long long v439 = 0u;
  uint64_t v290 = self->_filesystemMovieBabbleResults;
  uint64_t v291 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v439 objects:v687 count:16];
  if (v291)
  {
    uint64_t v292 = v291;
    uint64_t v293 = *(void *)v440;
    do
    {
      uint64_t v294 = 0;
      do
      {
        if (*(void *)v440 != v293) {
          objc_enumerationMutation(v290);
        }
        PBDataWriterWriteSubmessage();
        ++v294;
      }
      while (v292 != v294);
      uint64_t v292 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v439 objects:v687 count:16];
    }
    while (v292);
  }

  long long v437 = 0u;
  long long v438 = 0u;
  long long v435 = 0u;
  long long v436 = 0u;
  v295 = self->_filesystemMovieCheeringResults;
  uint64_t v296 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v435 objects:v686 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v436;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v436 != v298) {
          objc_enumerationMutation(v295);
        }
        PBDataWriterWriteSubmessage();
        ++v299;
      }
      while (v297 != v299);
      uint64_t v297 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v435 objects:v686 count:16];
    }
    while (v297);
  }

  long long v433 = 0u;
  long long v434 = 0u;
  long long v431 = 0u;
  long long v432 = 0u;
  v300 = self->_filesystemMovieLaughterResults;
  uint64_t v301 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v431 objects:v685 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v432;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v432 != v303) {
          objc_enumerationMutation(v300);
        }
        PBDataWriterWriteSubmessage();
        ++v304;
      }
      while (v302 != v304);
      uint64_t v302 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v431 objects:v685 count:16];
    }
    while (v302);
  }

  long long v429 = 0u;
  long long v430 = 0u;
  long long v427 = 0u;
  long long v428 = 0u;
  uint64_t v305 = self->_filesystemMovieMusicResults;
  uint64_t v306 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v427 objects:v684 count:16];
  if (v306)
  {
    uint64_t v307 = v306;
    uint64_t v308 = *(void *)v428;
    do
    {
      uint64_t v309 = 0;
      do
      {
        if (*(void *)v428 != v308) {
          objc_enumerationMutation(v305);
        }
        PBDataWriterWriteSubmessage();
        ++v309;
      }
      while (v307 != v309);
      uint64_t v307 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v427 objects:v684 count:16];
    }
    while (v307);
  }

  long long v425 = 0u;
  long long v426 = 0u;
  long long v423 = 0u;
  long long v424 = 0u;
  v310 = self->_filesystemMovieVoiceResults;
  uint64_t v311 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v423 objects:v683 count:16];
  if (v311)
  {
    uint64_t v312 = v311;
    uint64_t v313 = *(void *)v424;
    do
    {
      uint64_t v314 = 0;
      do
      {
        if (*(void *)v424 != v313) {
          objc_enumerationMutation(v310);
        }
        PBDataWriterWriteSubmessage();
        ++v314;
      }
      while (v312 != v314);
      uint64_t v312 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v423 objects:v683 count:16];
    }
    while (v312);
  }

  long long v421 = 0u;
  long long v422 = 0u;
  long long v419 = 0u;
  long long v420 = 0u;
  v315 = self->_animatedStickerResults;
  uint64_t v316 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v419 objects:v682 count:16];
  if (v316)
  {
    uint64_t v317 = v316;
    uint64_t v318 = *(void *)v420;
    do
    {
      uint64_t v319 = 0;
      do
      {
        if (*(void *)v420 != v318) {
          objc_enumerationMutation(v315);
        }
        PBDataWriterWriteSubmessage();
        ++v319;
      }
      while (v317 != v319);
      uint64_t v317 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v419 objects:v682 count:16];
    }
    while (v317);
  }

  long long v417 = 0u;
  long long v418 = 0u;
  long long v415 = 0u;
  long long v416 = 0u;
  uint64_t v320 = self->_livePhotoSettlingEffectGatingResults;
  uint64_t v321 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v415 objects:v681 count:16];
  if (v321)
  {
    uint64_t v322 = v321;
    uint64_t v323 = *(void *)v416;
    do
    {
      uint64_t v324 = 0;
      do
      {
        if (*(void *)v416 != v323) {
          objc_enumerationMutation(v320);
        }
        PBDataWriterWriteSubmessage();
        ++v324;
      }
      while (v322 != v324);
      uint64_t v322 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v415 objects:v681 count:16];
    }
    while (v322);
  }

  if (self->_assetCloudIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v413 = 0u;
  long long v414 = 0u;
  long long v411 = 0u;
  long long v412 = 0u;
  uint64_t v325 = self->_movieTorsoResults;
  uint64_t v326 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v411 objects:v680 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v412;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v412 != v328) {
          objc_enumerationMutation(v325);
        }
        PBDataWriterWriteSubmessage();
        ++v329;
      }
      while (v327 != v329);
      uint64_t v327 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v411 objects:v680 count:16];
    }
    while (v327);
  }

  long long v409 = 0u;
  long long v410 = 0u;
  long long v407 = 0u;
  long long v408 = 0u;
  v330 = self->_movieHumanActionClassificationResults;
  uint64_t v331 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v407 objects:v679 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v408;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v408 != v333) {
          objc_enumerationMutation(v330);
        }
        PBDataWriterWriteSubmessage();
        ++v334;
      }
      while (v332 != v334);
      uint64_t v332 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v407 objects:v679 count:16];
    }
    while (v332);
  }

  long long v405 = 0u;
  long long v406 = 0u;
  long long v403 = 0u;
  long long v404 = 0u;
  v335 = self->_videoEmbeddingResults;
  uint64_t v336 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v403 objects:v678 count:16];
  if (v336)
  {
    uint64_t v337 = v336;
    uint64_t v338 = *(void *)v404;
    do
    {
      uint64_t v339 = 0;
      do
      {
        if (*(void *)v404 != v338) {
          objc_enumerationMutation(v335);
        }
        PBDataWriterWriteSubmessage();
        ++v339;
      }
      while (v337 != v339);
      uint64_t v337 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v403 objects:v678 count:16];
    }
    while (v337);
  }

  long long v401 = 0u;
  long long v402 = 0u;
  long long v399 = 0u;
  long long v400 = 0u;
  uint64_t v340 = self->_summarizedEmbeddingResults;
  uint64_t v341 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v399 objects:v677 count:16];
  if (v341)
  {
    uint64_t v342 = v341;
    uint64_t v343 = *(void *)v400;
    do
    {
      uint64_t v344 = 0;
      do
      {
        if (*(void *)v400 != v343) {
          objc_enumerationMutation(v340);
        }
        PBDataWriterWriteSubmessage();
        ++v344;
      }
      while (v342 != v344);
      uint64_t v342 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v399 objects:v677 count:16];
    }
    while (v342);
  }

  long long v397 = 0u;
  long long v398 = 0u;
  long long v395 = 0u;
  long long v396 = 0u;
  v345 = self->_audioFusedVideoEmbeddingResults;
  uint64_t v346 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v395 objects:v676 count:16];
  if (v346)
  {
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v396;
    do
    {
      uint64_t v349 = 0;
      do
      {
        if (*(void *)v396 != v348) {
          objc_enumerationMutation(v345);
        }
        PBDataWriterWriteSubmessage();
        ++v349;
      }
      while (v347 != v349);
      uint64_t v347 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v395 objects:v676 count:16];
    }
    while (v347);
  }

  long long v393 = 0u;
  long long v394 = 0u;
  long long v391 = 0u;
  long long v392 = 0u;
  v350 = self->_imageEmbeddingResults;
  uint64_t v351 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v391 objects:v675 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v392;
    do
    {
      uint64_t v354 = 0;
      do
      {
        if (*(void *)v392 != v353) {
          objc_enumerationMutation(v350);
        }
        PBDataWriterWriteSubmessage();
        ++v354;
      }
      while (v352 != v354);
      uint64_t v352 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v391 objects:v675 count:16];
    }
    while (v352);
  }

  long long v389 = 0u;
  long long v390 = 0u;
  long long v387 = 0u;
  long long v388 = 0u;
  uint64_t v355 = self->_imageCaptionResults;
  uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v387 objects:v674 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v388;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v388 != v358) {
          objc_enumerationMutation(v355);
        }
        PBDataWriterWriteSubmessage();
        ++v359;
      }
      while (v357 != v359);
      uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v387 objects:v674 count:16];
    }
    while (v357);
  }

  long long v385 = 0u;
  long long v386 = 0u;
  long long v383 = 0u;
  long long v384 = 0u;
  uint64_t v360 = self->_videoCaptionResults;
  uint64_t v361 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v383 objects:v673 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v384;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v384 != v363) {
          objc_enumerationMutation(v360);
        }
        PBDataWriterWriteSubmessage();
        ++v364;
      }
      while (v362 != v364);
      uint64_t v362 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v383 objects:v673 count:16];
    }
    while (v362);
  }

  long long v381 = 0u;
  long long v382 = 0u;
  long long v379 = 0u;
  long long v380 = 0u;
  v365 = self->_videoCaptionPreferenceResults;
  uint64_t v366 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v379 objects:v672 count:16];
  if (v366)
  {
    uint64_t v367 = v366;
    uint64_t v368 = *(void *)v380;
    do
    {
      uint64_t v369 = 0;
      do
      {
        if (*(void *)v380 != v368) {
          objc_enumerationMutation(v365);
        }
        PBDataWriterWriteSubmessage();
        ++v369;
      }
      while (v367 != v369);
      uint64_t v367 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v379 objects:v672 count:16];
    }
    while (v367);
  }

  long long v377 = 0u;
  long long v378 = 0u;
  long long v375 = 0u;
  long long v376 = 0u;
  v370 = self->_videoSegmentCaptionResults;
  uint64_t v371 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v375 objects:v671 count:16];
  if (v371)
  {
    uint64_t v372 = v371;
    uint64_t v373 = *(void *)v376;
    do
    {
      uint64_t v374 = 0;
      do
      {
        if (*(void *)v376 != v373) {
          objc_enumerationMutation(v370);
        }
        PBDataWriterWriteSubmessage();
        ++v374;
      }
      while (v372 != v374);
      uint64_t v372 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v375 objects:v671 count:16];
    }
    while (v372);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[163] = self->_version;
  v4[162] = self->_types;
  v4[40] = self->_flags;
  *((void *)v4 + 2) = *(void *)&self->_date;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 3) = *(void *)&self->_quality;
    *((unsigned char *)v4 + 688) |= 1u;
  }
  uint64_t v301 = v4;
  [v4 setAssetIdentifier:self->_assetIdentifier];
  v301[1] = *(void *)&self->_assetModificationDate;
  if (self->_assetMasterFingerprint) {
    objc_msgSend(v301, "setAssetMasterFingerprint:");
  }
  if (self->_assetAdjustedFingerprint) {
    objc_msgSend(v301, "setAssetAdjustedFingerprint:");
  }
  if ([(VCPProtoAssetAnalysis *)self imageBlurResultsCount])
  {
    [v301 clearImageBlurResults];
    unint64_t v5 = [(VCPProtoAssetAnalysis *)self imageBlurResultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(VCPProtoAssetAnalysis *)self imageBlurResultsAtIndex:i];
        [v301 addImageBlurResults:v8];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageCompositionResultsCount])
  {
    [v301 clearImageCompositionResults];
    unint64_t v9 = [(VCPProtoAssetAnalysis *)self imageCompositionResultsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(VCPProtoAssetAnalysis *)self imageCompositionResultsAtIndex:j];
        [v301 addImageCompositionResults:v12];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageFaceResultsCount])
  {
    [v301 clearImageFaceResults];
    unint64_t v13 = [(VCPProtoAssetAnalysis *)self imageFaceResultsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(VCPProtoAssetAnalysis *)self imageFaceResultsAtIndex:k];
        [v301 addImageFaceResults:v16];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageFeatureResultsCount])
  {
    [v301 clearImageFeatureResults];
    unint64_t v17 = [(VCPProtoAssetAnalysis *)self imageFeatureResultsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(VCPProtoAssetAnalysis *)self imageFeatureResultsAtIndex:m];
        [v301 addImageFeatureResults:v20];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageJunkResultsCount])
  {
    [v301 clearImageJunkResults];
    unint64_t v21 = [(VCPProtoAssetAnalysis *)self imageJunkResultsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(VCPProtoAssetAnalysis *)self imageJunkResultsAtIndex:n];
        [v301 addImageJunkResults:v24];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageSaliencyResultsCount])
  {
    [v301 clearImageSaliencyResults];
    unint64_t v25 = [(VCPProtoAssetAnalysis *)self imageSaliencyResultsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(VCPProtoAssetAnalysis *)self imageSaliencyResultsAtIndex:ii];
        [v301 addImageSaliencyResults:v28];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageShotTypeResultsCount])
  {
    [v301 clearImageShotTypeResults];
    unint64_t v29 = [(VCPProtoAssetAnalysis *)self imageShotTypeResultsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(VCPProtoAssetAnalysis *)self imageShotTypeResultsAtIndex:jj];
        [v301 addImageShotTypeResults:v32];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoRecommendationResultsCount])
  {
    [v301 clearLivePhotoRecommendationResults];
    unint64_t v33 = [(VCPProtoAssetAnalysis *)self livePhotoRecommendationResultsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(VCPProtoAssetAnalysis *)self livePhotoRecommendationResultsAtIndex:kk];
        [v301 addLivePhotoRecommendationResults:v36];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoSharpnessResultsCount])
  {
    [v301 clearLivePhotoSharpnessResults];
    unint64_t v37 = [(VCPProtoAssetAnalysis *)self livePhotoSharpnessResultsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        uint64_t v40 = [(VCPProtoAssetAnalysis *)self livePhotoSharpnessResultsAtIndex:mm];
        [v301 addLivePhotoSharpnessResults:v40];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieActivityLevelResultsCount])
  {
    [v301 clearMovieActivityLevelResults];
    unint64_t v41 = [(VCPProtoAssetAnalysis *)self movieActivityLevelResultsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(VCPProtoAssetAnalysis *)self movieActivityLevelResultsAtIndex:nn];
        [v301 addMovieActivityLevelResults:v44];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieCameraMotionResultsCount])
  {
    [v301 clearMovieCameraMotionResults];
    unint64_t v45 = [(VCPProtoAssetAnalysis *)self movieCameraMotionResultsCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i1 = 0; i1 != v46; ++i1)
      {
        uint64_t v48 = [(VCPProtoAssetAnalysis *)self movieCameraMotionResultsAtIndex:i1];
        [v301 addMovieCameraMotionResults:v48];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieClassificationResultsCount])
  {
    [v301 clearMovieClassificationResults];
    unint64_t v49 = [(VCPProtoAssetAnalysis *)self movieClassificationResultsCount];
    if (v49)
    {
      unint64_t v50 = v49;
      for (uint64_t i2 = 0; i2 != v50; ++i2)
      {
        uint64_t v52 = [(VCPProtoAssetAnalysis *)self movieClassificationResultsAtIndex:i2];
        [v301 addMovieClassificationResults:v52];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieFaceResultsCount])
  {
    [v301 clearMovieFaceResults];
    unint64_t v53 = [(VCPProtoAssetAnalysis *)self movieFaceResultsCount];
    if (v53)
    {
      unint64_t v54 = v53;
      for (uint64_t i3 = 0; i3 != v54; ++i3)
      {
        uint64_t v56 = [(VCPProtoAssetAnalysis *)self movieFaceResultsAtIndex:i3];
        [v301 addMovieFaceResults:v56];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieFaceprintResultsCount])
  {
    [v301 clearMovieFaceprintResults];
    unint64_t v57 = [(VCPProtoAssetAnalysis *)self movieFaceprintResultsCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i4 = 0; i4 != v58; ++i4)
      {
        uint64_t v60 = [(VCPProtoAssetAnalysis *)self movieFaceprintResultsAtIndex:i4];
        [v301 addMovieFaceprintResults:v60];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieFeatureResultsCount])
  {
    [v301 clearMovieFeatureResults];
    unint64_t v61 = [(VCPProtoAssetAnalysis *)self movieFeatureResultsCount];
    if (v61)
    {
      unint64_t v62 = v61;
      for (uint64_t i5 = 0; i5 != v62; ++i5)
      {
        uint64_t v64 = [(VCPProtoAssetAnalysis *)self movieFeatureResultsAtIndex:i5];
        [v301 addMovieFeatureResults:v64];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieFineSubjectMotionResultsCount])
  {
    [v301 clearMovieFineSubjectMotionResults];
    unint64_t v65 = [(VCPProtoAssetAnalysis *)self movieFineSubjectMotionResultsCount];
    if (v65)
    {
      unint64_t v66 = v65;
      for (uint64_t i6 = 0; i6 != v66; ++i6)
      {
        uint64_t v68 = [(VCPProtoAssetAnalysis *)self movieFineSubjectMotionResultsAtIndex:i6];
        [v301 addMovieFineSubjectMotionResults:v68];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieInterestingnessResultsCount])
  {
    [v301 clearMovieInterestingnessResults];
    unint64_t v69 = [(VCPProtoAssetAnalysis *)self movieInterestingnessResultsCount];
    if (v69)
    {
      unint64_t v70 = v69;
      for (uint64_t i7 = 0; i7 != v70; ++i7)
      {
        uint64_t v72 = [(VCPProtoAssetAnalysis *)self movieInterestingnessResultsAtIndex:i7];
        [v301 addMovieInterestingnessResults:v72];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieMovingObjectResultsCount])
  {
    [v301 clearMovieMovingObjectResults];
    unint64_t v73 = [(VCPProtoAssetAnalysis *)self movieMovingObjectResultsCount];
    if (v73)
    {
      unint64_t v74 = v73;
      for (uint64_t i8 = 0; i8 != v74; ++i8)
      {
        uint64_t v76 = [(VCPProtoAssetAnalysis *)self movieMovingObjectResultsAtIndex:i8];
        [v301 addMovieMovingObjectResults:v76];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieMusicResultsCount])
  {
    [v301 clearMovieMusicResults];
    unint64_t v77 = [(VCPProtoAssetAnalysis *)self movieMusicResultsCount];
    if (v77)
    {
      unint64_t v78 = v77;
      for (uint64_t i9 = 0; i9 != v78; ++i9)
      {
        uint64_t v80 = [(VCPProtoAssetAnalysis *)self movieMusicResultsAtIndex:i9];
        [v301 addMovieMusicResults:v80];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieObstructionResultsCount])
  {
    [v301 clearMovieObstructionResults];
    unint64_t v81 = [(VCPProtoAssetAnalysis *)self movieObstructionResultsCount];
    if (v81)
    {
      unint64_t v82 = v81;
      for (uint64_t i10 = 0; i10 != v82; ++i10)
      {
        uint64_t v84 = [(VCPProtoAssetAnalysis *)self movieObstructionResultsAtIndex:i10];
        [v301 addMovieObstructionResults:v84];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieOrientationResultsCount])
  {
    [v301 clearMovieOrientationResults];
    unint64_t v85 = [(VCPProtoAssetAnalysis *)self movieOrientationResultsCount];
    if (v85)
    {
      unint64_t v86 = v85;
      for (uint64_t i11 = 0; i11 != v86; ++i11)
      {
        uint64_t v88 = [(VCPProtoAssetAnalysis *)self movieOrientationResultsAtIndex:i11];
        [v301 addMovieOrientationResults:v88];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self moviePreEncodeResultsCount])
  {
    [v301 clearMoviePreEncodeResults];
    unint64_t v89 = [(VCPProtoAssetAnalysis *)self moviePreEncodeResultsCount];
    if (v89)
    {
      unint64_t v90 = v89;
      for (uint64_t i12 = 0; i12 != v90; ++i12)
      {
        uint64_t v92 = [(VCPProtoAssetAnalysis *)self moviePreEncodeResultsAtIndex:i12];
        [v301 addMoviePreEncodeResults:v92];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieQualityResultsCount])
  {
    [v301 clearMovieQualityResults];
    unint64_t v93 = [(VCPProtoAssetAnalysis *)self movieQualityResultsCount];
    if (v93)
    {
      unint64_t v94 = v93;
      for (uint64_t i13 = 0; i13 != v94; ++i13)
      {
        uint64_t v96 = [(VCPProtoAssetAnalysis *)self movieQualityResultsAtIndex:i13];
        [v301 addMovieQualityResults:v96];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSaliencyResultsCount])
  {
    [v301 clearMovieSaliencyResults];
    unint64_t v97 = [(VCPProtoAssetAnalysis *)self movieSaliencyResultsCount];
    if (v97)
    {
      unint64_t v98 = v97;
      for (uint64_t i14 = 0; i14 != v98; ++i14)
      {
        v100 = [(VCPProtoAssetAnalysis *)self movieSaliencyResultsAtIndex:i14];
        [v301 addMovieSaliencyResults:v100];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSceneResultsCount])
  {
    [v301 clearMovieSceneResults];
    unint64_t v101 = [(VCPProtoAssetAnalysis *)self movieSceneResultsCount];
    if (v101)
    {
      unint64_t v102 = v101;
      for (uint64_t i15 = 0; i15 != v102; ++i15)
      {
        uint64_t v104 = [(VCPProtoAssetAnalysis *)self movieSceneResultsAtIndex:i15];
        [v301 addMovieSceneResults:v104];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSubjectMotionResultsCount])
  {
    [v301 clearMovieSubjectMotionResults];
    unint64_t v105 = [(VCPProtoAssetAnalysis *)self movieSubjectMotionResultsCount];
    if (v105)
    {
      unint64_t v106 = v105;
      for (uint64_t i16 = 0; i16 != v106; ++i16)
      {
        uint64_t v108 = [(VCPProtoAssetAnalysis *)self movieSubjectMotionResultsAtIndex:i16];
        [v301 addMovieSubjectMotionResults:v108];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieUtteranceResultsCount])
  {
    [v301 clearMovieUtteranceResults];
    unint64_t v109 = [(VCPProtoAssetAnalysis *)self movieUtteranceResultsCount];
    if (v109)
    {
      unint64_t v110 = v109;
      for (uint64_t i17 = 0; i17 != v110; ++i17)
      {
        uint64_t v112 = [(VCPProtoAssetAnalysis *)self movieUtteranceResultsAtIndex:i17];
        [v301 addMovieUtteranceResults:v112];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieVoiceResultsCount])
  {
    [v301 clearMovieVoiceResults];
    unint64_t v113 = [(VCPProtoAssetAnalysis *)self movieVoiceResultsCount];
    if (v113)
    {
      unint64_t v114 = v113;
      for (uint64_t i18 = 0; i18 != v114; ++i18)
      {
        uint64_t v116 = [(VCPProtoAssetAnalysis *)self movieVoiceResultsAtIndex:i18];
        [v301 addMovieVoiceResults:v116];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imagePetsResultsCount])
  {
    [v301 clearImagePetsResults];
    unint64_t v117 = [(VCPProtoAssetAnalysis *)self imagePetsResultsCount];
    if (v117)
    {
      unint64_t v118 = v117;
      for (uint64_t i19 = 0; i19 != v118; ++i19)
      {
        v120 = [(VCPProtoAssetAnalysis *)self imagePetsResultsAtIndex:i19];
        [v301 addImagePetsResults:v120];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSummaryResultsCount])
  {
    [v301 clearMovieSummaryResults];
    unint64_t v121 = [(VCPProtoAssetAnalysis *)self movieSummaryResultsCount];
    if (v121)
    {
      unint64_t v122 = v121;
      for (uint64_t i20 = 0; i20 != v122; ++i20)
      {
        uint64_t v124 = [(VCPProtoAssetAnalysis *)self movieSummaryResultsAtIndex:i20];
        [v301 addMovieSummaryResults:v124];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieHighlightResultsCount])
  {
    [v301 clearMovieHighlightResults];
    unint64_t v125 = [(VCPProtoAssetAnalysis *)self movieHighlightResultsCount];
    if (v125)
    {
      unint64_t v126 = v125;
      for (uint64_t i21 = 0; i21 != v126; ++i21)
      {
        uint64_t v128 = [(VCPProtoAssetAnalysis *)self movieHighlightResultsAtIndex:i21];
        [v301 addMovieHighlightResults:v128];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageExposureResultsCount])
  {
    [v301 clearImageExposureResults];
    unint64_t v129 = [(VCPProtoAssetAnalysis *)self imageExposureResultsCount];
    if (v129)
    {
      unint64_t v130 = v129;
      for (uint64_t i22 = 0; i22 != v130; ++i22)
      {
        uint64_t v132 = [(VCPProtoAssetAnalysis *)self imageExposureResultsAtIndex:i22];
        [v301 addImageExposureResults:v132];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoEffectsResultsCount])
  {
    [v301 clearLivePhotoEffectsResults];
    unint64_t v133 = [(VCPProtoAssetAnalysis *)self livePhotoEffectsResultsCount];
    if (v133)
    {
      unint64_t v134 = v133;
      for (uint64_t i23 = 0; i23 != v134; ++i23)
      {
        uint64_t v136 = [(VCPProtoAssetAnalysis *)self livePhotoEffectsResultsAtIndex:i23];
        [v301 addLivePhotoEffectsResults:v136];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v301[4] = self->_statsFlags;
    *((unsigned char *)v301 + 688) |= 2u;
  }
  if ([(VCPProtoAssetAnalysis *)self imagePetsFaceResultsCount])
  {
    [v301 clearImagePetsFaceResults];
    unint64_t v137 = [(VCPProtoAssetAnalysis *)self imagePetsFaceResultsCount];
    if (v137)
    {
      unint64_t v138 = v137;
      for (uint64_t i24 = 0; i24 != v138; ++i24)
      {
        v140 = [(VCPProtoAssetAnalysis *)self imagePetsFaceResultsAtIndex:i24];
        [v301 addImagePetsFaceResults:v140];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageSceneprintResultsCount])
  {
    [v301 clearImageSceneprintResults];
    unint64_t v141 = [(VCPProtoAssetAnalysis *)self imageSceneprintResultsCount];
    if (v141)
    {
      unint64_t v142 = v141;
      for (uint64_t i25 = 0; i25 != v142; ++i25)
      {
        uint64_t v144 = [(VCPProtoAssetAnalysis *)self imageSceneprintResultsAtIndex:i25];
        [v301 addImageSceneprintResults:v144];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSceneprintResultsCount])
  {
    [v301 clearMovieSceneprintResults];
    unint64_t v145 = [(VCPProtoAssetAnalysis *)self movieSceneprintResultsCount];
    if (v145)
    {
      unint64_t v146 = v145;
      for (uint64_t i26 = 0; i26 != v146; ++i26)
      {
        uint64_t v148 = [(VCPProtoAssetAnalysis *)self movieSceneprintResultsAtIndex:i26];
        [v301 addMovieSceneprintResults:v148];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageHumanPoseResultsCount])
  {
    [v301 clearImageHumanPoseResults];
    unint64_t v149 = [(VCPProtoAssetAnalysis *)self imageHumanPoseResultsCount];
    if (v149)
    {
      unint64_t v150 = v149;
      for (uint64_t i27 = 0; i27 != v150; ++i27)
      {
        uint64_t v152 = [(VCPProtoAssetAnalysis *)self imageHumanPoseResultsAtIndex:i27];
        [v301 addImageHumanPoseResults:v152];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieHumanPoseResultsCount])
  {
    [v301 clearMovieHumanPoseResults];
    unint64_t v153 = [(VCPProtoAssetAnalysis *)self movieHumanPoseResultsCount];
    if (v153)
    {
      unint64_t v154 = v153;
      for (uint64_t i28 = 0; i28 != v154; ++i28)
      {
        uint64_t v156 = [(VCPProtoAssetAnalysis *)self movieHumanPoseResultsAtIndex:i28];
        [v301 addMovieHumanPoseResults:v156];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieApplauseResultsCount])
  {
    [v301 clearMovieApplauseResults];
    unint64_t v157 = [(VCPProtoAssetAnalysis *)self movieApplauseResultsCount];
    if (v157)
    {
      unint64_t v158 = v157;
      for (uint64_t i29 = 0; i29 != v158; ++i29)
      {
        v160 = [(VCPProtoAssetAnalysis *)self movieApplauseResultsAtIndex:i29];
        [v301 addMovieApplauseResults:v160];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieBabbleResultsCount])
  {
    [v301 clearMovieBabbleResults];
    unint64_t v161 = [(VCPProtoAssetAnalysis *)self movieBabbleResultsCount];
    if (v161)
    {
      unint64_t v162 = v161;
      for (uint64_t i30 = 0; i30 != v162; ++i30)
      {
        uint64_t v164 = [(VCPProtoAssetAnalysis *)self movieBabbleResultsAtIndex:i30];
        [v301 addMovieBabbleResults:v164];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieCheeringResultsCount])
  {
    [v301 clearMovieCheeringResults];
    unint64_t v165 = [(VCPProtoAssetAnalysis *)self movieCheeringResultsCount];
    if (v165)
    {
      unint64_t v166 = v165;
      for (uint64_t i31 = 0; i31 != v166; ++i31)
      {
        uint64_t v168 = [(VCPProtoAssetAnalysis *)self movieCheeringResultsAtIndex:i31];
        [v301 addMovieCheeringResults:v168];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieLaughterResultsCount])
  {
    [v301 clearMovieLaughterResults];
    unint64_t v169 = [(VCPProtoAssetAnalysis *)self movieLaughterResultsCount];
    if (v169)
    {
      unint64_t v170 = v169;
      for (uint64_t i32 = 0; i32 != v170; ++i32)
      {
        uint64_t v172 = [(VCPProtoAssetAnalysis *)self movieLaughterResultsAtIndex:i32];
        [v301 addMovieLaughterResults:v172];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoKeyFrameResultsCount])
  {
    [v301 clearLivePhotoKeyFrameResults];
    unint64_t v173 = [(VCPProtoAssetAnalysis *)self livePhotoKeyFrameResultsCount];
    if (v173)
    {
      unint64_t v174 = v173;
      for (uint64_t i33 = 0; i33 != v174; ++i33)
      {
        uint64_t v176 = [(VCPProtoAssetAnalysis *)self livePhotoKeyFrameResultsAtIndex:i33];
        [v301 addLivePhotoKeyFrameResults:v176];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoKeyFrameStillResultsCount])
  {
    [v301 clearLivePhotoKeyFrameStillResults];
    unint64_t v177 = [(VCPProtoAssetAnalysis *)self livePhotoKeyFrameStillResultsCount];
    if (v177)
    {
      unint64_t v178 = v177;
      for (uint64_t i34 = 0; i34 != v178; ++i34)
      {
        uint64_t v180 = [(VCPProtoAssetAnalysis *)self livePhotoKeyFrameStillResultsAtIndex:i34];
        [v301 addLivePhotoKeyFrameStillResults:v180];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieHumanActionResultsCount])
  {
    [v301 clearMovieHumanActionResults];
    unint64_t v181 = [(VCPProtoAssetAnalysis *)self movieHumanActionResultsCount];
    if (v181)
    {
      unint64_t v182 = v181;
      for (uint64_t i35 = 0; i35 != v182; ++i35)
      {
        uint64_t v184 = [(VCPProtoAssetAnalysis *)self movieHumanActionResultsAtIndex:i35];
        [v301 addMovieHumanActionResults:v184];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSubtleMotionResultsCount])
  {
    [v301 clearMovieSubtleMotionResults];
    unint64_t v185 = [(VCPProtoAssetAnalysis *)self movieSubtleMotionResultsCount];
    if (v185)
    {
      unint64_t v186 = v185;
      for (uint64_t i36 = 0; i36 != v186; ++i36)
      {
        uint64_t v188 = [(VCPProtoAssetAnalysis *)self movieSubtleMotionResultsAtIndex:i36];
        [v301 addMovieSubtleMotionResults:v188];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieLoudnessResultsCount])
  {
    [v301 clearMovieLoudnessResults];
    unint64_t v189 = [(VCPProtoAssetAnalysis *)self movieLoudnessResultsCount];
    if (v189)
    {
      unint64_t v190 = v189;
      for (uint64_t i37 = 0; i37 != v190; ++i37)
      {
        uint64_t v192 = [(VCPProtoAssetAnalysis *)self movieLoudnessResultsAtIndex:i37];
        [v301 addMovieLoudnessResults:v192];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self moviePetsResultsCount])
  {
    [v301 clearMoviePetsResults];
    unint64_t v193 = [(VCPProtoAssetAnalysis *)self moviePetsResultsCount];
    if (v193)
    {
      unint64_t v194 = v193;
      for (uint64_t i38 = 0; i38 != v194; ++i38)
      {
        uint64_t v196 = [(VCPProtoAssetAnalysis *)self moviePetsResultsAtIndex:i38];
        [v301 addMoviePetsResults:v196];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self moviePetsFaceResultsCount])
  {
    [v301 clearMoviePetsFaceResults];
    unint64_t v197 = [(VCPProtoAssetAnalysis *)self moviePetsFaceResultsCount];
    if (v197)
    {
      unint64_t v198 = v197;
      for (uint64_t i39 = 0; i39 != v198; ++i39)
      {
        uint64_t v200 = [(VCPProtoAssetAnalysis *)self moviePetsFaceResultsAtIndex:i39];
        [v301 addMoviePetsFaceResults:v200];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieStabilizationResultsCount])
  {
    [v301 clearMovieStabilizationResults];
    unint64_t v201 = [(VCPProtoAssetAnalysis *)self movieStabilizationResultsCount];
    if (v201)
    {
      unint64_t v202 = v201;
      for (uint64_t i40 = 0; i40 != v202; ++i40)
      {
        uint64_t v204 = [(VCPProtoAssetAnalysis *)self movieStabilizationResultsAtIndex:i40];
        [v301 addMovieStabilizationResults:v204];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v301[5] = self->_typesWide;
    *((unsigned char *)v301 + 688) |= 4u;
  }
  if ([(VCPProtoAssetAnalysis *)self movieHighlightScoreResultsCount])
  {
    [v301 clearMovieHighlightScoreResults];
    unint64_t v205 = [(VCPProtoAssetAnalysis *)self movieHighlightScoreResultsCount];
    if (v205)
    {
      unint64_t v206 = v205;
      for (uint64_t i41 = 0; i41 != v206; ++i41)
      {
        uint64_t v208 = [(VCPProtoAssetAnalysis *)self movieHighlightScoreResultsAtIndex:i41];
        [v301 addMovieHighlightScoreResults:v208];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoHumanActionClassificationResultsCount])
  {
    [v301 clearLivePhotoHumanActionClassificationResults];
    unint64_t v209 = [(VCPProtoAssetAnalysis *)self livePhotoHumanActionClassificationResultsCount];
    if (v209)
    {
      unint64_t v210 = v209;
      for (uint64_t i42 = 0; i42 != v210; ++i42)
      {
        uint64_t v212 = [(VCPProtoAssetAnalysis *)self livePhotoHumanActionClassificationResultsAtIndex:i42];
        [v301 addLivePhotoHumanActionClassificationResults:v212];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieAudioQualityResultsCount])
  {
    [v301 clearMovieAudioQualityResults];
    unint64_t v213 = [(VCPProtoAssetAnalysis *)self movieAudioQualityResultsCount];
    if (v213)
    {
      unint64_t v214 = v213;
      for (uint64_t i43 = 0; i43 != v214; ++i43)
      {
        uint64_t v216 = [(VCPProtoAssetAnalysis *)self movieAudioQualityResultsAtIndex:i43];
        [v301 addMovieAudioQualityResults:v216];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieSafetyResultsCount])
  {
    [v301 clearMovieSafetyResults];
    unint64_t v217 = [(VCPProtoAssetAnalysis *)self movieSafetyResultsCount];
    if (v217)
    {
      unint64_t v218 = v217;
      for (uint64_t i44 = 0; i44 != v218; ++i44)
      {
        uint64_t v220 = [(VCPProtoAssetAnalysis *)self movieSafetyResultsAtIndex:i44];
        [v301 addMovieSafetyResults:v220];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieClassificationResultsCount])
  {
    [v301 clearFilesystemMovieClassificationResults];
    unint64_t v221 = [(VCPProtoAssetAnalysis *)self filesystemMovieClassificationResultsCount];
    if (v221)
    {
      unint64_t v222 = v221;
      for (uint64_t i45 = 0; i45 != v222; ++i45)
      {
        uint64_t v224 = [(VCPProtoAssetAnalysis *)self filesystemMovieClassificationResultsAtIndex:i45];
        [v301 addFilesystemMovieClassificationResults:v224];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieHumanActionClassificationResultsCount])
  {
    [v301 clearFilesystemMovieHumanActionClassificationResults];
    unint64_t v225 = [(VCPProtoAssetAnalysis *)self filesystemMovieHumanActionClassificationResultsCount];
    if (v225)
    {
      unint64_t v226 = v225;
      for (uint64_t i46 = 0; i46 != v226; ++i46)
      {
        uint64_t v228 = [(VCPProtoAssetAnalysis *)self filesystemMovieHumanActionClassificationResultsAtIndex:i46];
        [v301 addFilesystemMovieHumanActionClassificationResults:v228];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieApplauseResultsCount])
  {
    [v301 clearFilesystemMovieApplauseResults];
    unint64_t v229 = [(VCPProtoAssetAnalysis *)self filesystemMovieApplauseResultsCount];
    if (v229)
    {
      unint64_t v230 = v229;
      for (uint64_t i47 = 0; i47 != v230; ++i47)
      {
        uint64_t v232 = [(VCPProtoAssetAnalysis *)self filesystemMovieApplauseResultsAtIndex:i47];
        [v301 addFilesystemMovieApplauseResults:v232];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieBabbleResultsCount])
  {
    [v301 clearFilesystemMovieBabbleResults];
    unint64_t v233 = [(VCPProtoAssetAnalysis *)self filesystemMovieBabbleResultsCount];
    if (v233)
    {
      unint64_t v234 = v233;
      for (uint64_t i48 = 0; i48 != v234; ++i48)
      {
        uint64_t v236 = [(VCPProtoAssetAnalysis *)self filesystemMovieBabbleResultsAtIndex:i48];
        [v301 addFilesystemMovieBabbleResults:v236];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieCheeringResultsCount])
  {
    [v301 clearFilesystemMovieCheeringResults];
    unint64_t v237 = [(VCPProtoAssetAnalysis *)self filesystemMovieCheeringResultsCount];
    if (v237)
    {
      unint64_t v238 = v237;
      for (uint64_t i49 = 0; i49 != v238; ++i49)
      {
        v240 = [(VCPProtoAssetAnalysis *)self filesystemMovieCheeringResultsAtIndex:i49];
        [v301 addFilesystemMovieCheeringResults:v240];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieLaughterResultsCount])
  {
    [v301 clearFilesystemMovieLaughterResults];
    unint64_t v241 = [(VCPProtoAssetAnalysis *)self filesystemMovieLaughterResultsCount];
    if (v241)
    {
      unint64_t v242 = v241;
      for (uint64_t i50 = 0; i50 != v242; ++i50)
      {
        uint64_t v244 = [(VCPProtoAssetAnalysis *)self filesystemMovieLaughterResultsAtIndex:i50];
        [v301 addFilesystemMovieLaughterResults:v244];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieMusicResultsCount])
  {
    [v301 clearFilesystemMovieMusicResults];
    unint64_t v245 = [(VCPProtoAssetAnalysis *)self filesystemMovieMusicResultsCount];
    if (v245)
    {
      unint64_t v246 = v245;
      for (uint64_t i51 = 0; i51 != v246; ++i51)
      {
        uint64_t v248 = [(VCPProtoAssetAnalysis *)self filesystemMovieMusicResultsAtIndex:i51];
        [v301 addFilesystemMovieMusicResults:v248];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self filesystemMovieVoiceResultsCount])
  {
    [v301 clearFilesystemMovieVoiceResults];
    unint64_t v249 = [(VCPProtoAssetAnalysis *)self filesystemMovieVoiceResultsCount];
    if (v249)
    {
      unint64_t v250 = v249;
      for (uint64_t i52 = 0; i52 != v250; ++i52)
      {
        uint64_t v252 = [(VCPProtoAssetAnalysis *)self filesystemMovieVoiceResultsAtIndex:i52];
        [v301 addFilesystemMovieVoiceResults:v252];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self animatedStickerResultsCount])
  {
    [v301 clearAnimatedStickerResults];
    unint64_t v253 = [(VCPProtoAssetAnalysis *)self animatedStickerResultsCount];
    if (v253)
    {
      unint64_t v254 = v253;
      for (uint64_t i53 = 0; i53 != v254; ++i53)
      {
        uint64_t v256 = [(VCPProtoAssetAnalysis *)self animatedStickerResultsAtIndex:i53];
        [v301 addAnimatedStickerResults:v256];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self livePhotoSettlingEffectGatingResultsCount])
  {
    [v301 clearLivePhotoSettlingEffectGatingResults];
    unint64_t v257 = [(VCPProtoAssetAnalysis *)self livePhotoSettlingEffectGatingResultsCount];
    if (v257)
    {
      unint64_t v258 = v257;
      for (uint64_t i54 = 0; i54 != v258; ++i54)
      {
        v260 = [(VCPProtoAssetAnalysis *)self livePhotoSettlingEffectGatingResultsAtIndex:i54];
        [v301 addLivePhotoSettlingEffectGatingResults:v260];
      }
    }
  }
  if (self->_assetCloudIdentifier) {
    objc_msgSend(v301, "setAssetCloudIdentifier:");
  }
  if ([(VCPProtoAssetAnalysis *)self movieTorsoResultsCount])
  {
    [v301 clearMovieTorsoResults];
    unint64_t v261 = [(VCPProtoAssetAnalysis *)self movieTorsoResultsCount];
    if (v261)
    {
      unint64_t v262 = v261;
      for (uint64_t i55 = 0; i55 != v262; ++i55)
      {
        uint64_t v264 = [(VCPProtoAssetAnalysis *)self movieTorsoResultsAtIndex:i55];
        [v301 addMovieTorsoResults:v264];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self movieHumanActionClassificationResultsCount])
  {
    [v301 clearMovieHumanActionClassificationResults];
    unint64_t v265 = [(VCPProtoAssetAnalysis *)self movieHumanActionClassificationResultsCount];
    if (v265)
    {
      unint64_t v266 = v265;
      for (uint64_t i56 = 0; i56 != v266; ++i56)
      {
        uint64_t v268 = [(VCPProtoAssetAnalysis *)self movieHumanActionClassificationResultsAtIndex:i56];
        [v301 addMovieHumanActionClassificationResults:v268];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self videoEmbeddingResultsCount])
  {
    [v301 clearVideoEmbeddingResults];
    unint64_t v269 = [(VCPProtoAssetAnalysis *)self videoEmbeddingResultsCount];
    if (v269)
    {
      unint64_t v270 = v269;
      for (uint64_t i57 = 0; i57 != v270; ++i57)
      {
        uint64_t v272 = [(VCPProtoAssetAnalysis *)self videoEmbeddingResultsAtIndex:i57];
        [v301 addVideoEmbeddingResults:v272];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self summarizedEmbeddingResultsCount])
  {
    [v301 clearSummarizedEmbeddingResults];
    unint64_t v273 = [(VCPProtoAssetAnalysis *)self summarizedEmbeddingResultsCount];
    if (v273)
    {
      unint64_t v274 = v273;
      for (uint64_t i58 = 0; i58 != v274; ++i58)
      {
        uint64_t v276 = [(VCPProtoAssetAnalysis *)self summarizedEmbeddingResultsAtIndex:i58];
        [v301 addSummarizedEmbeddingResults:v276];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self audioFusedVideoEmbeddingResultsCount])
  {
    [v301 clearAudioFusedVideoEmbeddingResults];
    unint64_t v277 = [(VCPProtoAssetAnalysis *)self audioFusedVideoEmbeddingResultsCount];
    if (v277)
    {
      unint64_t v278 = v277;
      for (uint64_t i59 = 0; i59 != v278; ++i59)
      {
        v280 = [(VCPProtoAssetAnalysis *)self audioFusedVideoEmbeddingResultsAtIndex:i59];
        [v301 addAudioFusedVideoEmbeddingResults:v280];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageEmbeddingResultsCount])
  {
    [v301 clearImageEmbeddingResults];
    unint64_t v281 = [(VCPProtoAssetAnalysis *)self imageEmbeddingResultsCount];
    if (v281)
    {
      unint64_t v282 = v281;
      for (uint64_t i60 = 0; i60 != v282; ++i60)
      {
        uint64_t v284 = [(VCPProtoAssetAnalysis *)self imageEmbeddingResultsAtIndex:i60];
        [v301 addImageEmbeddingResults:v284];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self imageCaptionResultsCount])
  {
    [v301 clearImageCaptionResults];
    unint64_t v285 = [(VCPProtoAssetAnalysis *)self imageCaptionResultsCount];
    if (v285)
    {
      unint64_t v286 = v285;
      for (uint64_t i61 = 0; i61 != v286; ++i61)
      {
        uint64_t v288 = [(VCPProtoAssetAnalysis *)self imageCaptionResultsAtIndex:i61];
        [v301 addImageCaptionResults:v288];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self videoCaptionResultsCount])
  {
    [v301 clearVideoCaptionResults];
    unint64_t v289 = [(VCPProtoAssetAnalysis *)self videoCaptionResultsCount];
    if (v289)
    {
      unint64_t v290 = v289;
      for (uint64_t i62 = 0; i62 != v290; ++i62)
      {
        uint64_t v292 = [(VCPProtoAssetAnalysis *)self videoCaptionResultsAtIndex:i62];
        [v301 addVideoCaptionResults:v292];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self videoCaptionPreferenceResultsCount])
  {
    [v301 clearVideoCaptionPreferenceResults];
    unint64_t v293 = [(VCPProtoAssetAnalysis *)self videoCaptionPreferenceResultsCount];
    if (v293)
    {
      unint64_t v294 = v293;
      for (uint64_t i63 = 0; i63 != v294; ++i63)
      {
        uint64_t v296 = [(VCPProtoAssetAnalysis *)self videoCaptionPreferenceResultsAtIndex:i63];
        [v301 addVideoCaptionPreferenceResults:v296];
      }
    }
  }
  if ([(VCPProtoAssetAnalysis *)self videoSegmentCaptionResultsCount])
  {
    [v301 clearVideoSegmentCaptionResults];
    unint64_t v297 = [(VCPProtoAssetAnalysis *)self videoSegmentCaptionResultsCount];
    if (v297)
    {
      unint64_t v298 = v297;
      for (uint64_t i64 = 0; i64 != v298; ++i64)
      {
        v300 = [(VCPProtoAssetAnalysis *)self videoSegmentCaptionResultsAtIndex:i64];
        [v301 addVideoSegmentCaptionResults:v300];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v831 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 652) = self->_version;
  *(_DWORD *)(v5 + 648) = self->_types;
  *(_DWORD *)(v5 + 160) = self->_flags;
  *(double *)(v5 + 16) = self->_date;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 24) = self->_quality;
    *(unsigned char *)(v5 + 688) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_assetIdentifier copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v7;

  *(double *)(v6 + 8) = self->_assetModificationDate;
  uint64_t v9 = [(NSString *)self->_assetMasterFingerprint copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_assetAdjustedFingerprint copyWithZone:a3];
  uint64_t v12 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v11;

  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  long long v753 = 0u;
  unint64_t v13 = self->_imageBlurResults;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v753 objects:v830 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v754;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v754 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v753 + 1) + 8 * v17) copyWithZone:a3];
        [(id)v6 addImageBlurResults:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v753 objects:v830 count:16];
    }
    while (v15);
  }

  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  long long v749 = 0u;
  uint64_t v19 = self->_imageCompositionResults;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v749 objects:v829 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v750;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v750 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v749 + 1) + 8 * v23) copyWithZone:a3];
        [(id)v6 addImageCompositionResults:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v749 objects:v829 count:16];
    }
    while (v21);
  }

  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  long long v745 = 0u;
  unint64_t v25 = self->_imageFaceResults;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v745 objects:v828 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v746;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v746 != v28) {
          objc_enumerationMutation(v25);
        }
        unint64_t v30 = (void *)[*(id *)(*((void *)&v745 + 1) + 8 * v29) copyWithZone:a3];
        [(id)v6 addImageFaceResults:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v745 objects:v828 count:16];
    }
    while (v27);
  }

  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  long long v741 = 0u;
  uint64_t v31 = self->_imageFeatureResults;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v741 objects:v827 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v742;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v742 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = (void *)[*(id *)(*((void *)&v741 + 1) + 8 * v35) copyWithZone:a3];
        [(id)v6 addImageFeatureResults:v36];

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v741 objects:v827 count:16];
    }
    while (v33);
  }

  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  long long v737 = 0u;
  unint64_t v37 = self->_imageJunkResults;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v737 objects:v826 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v738;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v738 != v40) {
          objc_enumerationMutation(v37);
        }
        unint64_t v42 = (void *)[*(id *)(*((void *)&v737 + 1) + 8 * v41) copyWithZone:a3];
        [(id)v6 addImageJunkResults:v42];

        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v737 objects:v826 count:16];
    }
    while (v39);
  }

  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  long long v733 = 0u;
  uint64_t v43 = self->_imageSaliencyResults;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v733 objects:v825 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v734;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v734 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = (void *)[*(id *)(*((void *)&v733 + 1) + 8 * v47) copyWithZone:a3];
        [(id)v6 addImageSaliencyResults:v48];

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v733 objects:v825 count:16];
    }
    while (v45);
  }

  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  long long v729 = 0u;
  unint64_t v49 = self->_imageShotTypeResults;
  uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v729 objects:v824 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v730;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v730 != v52) {
          objc_enumerationMutation(v49);
        }
        unint64_t v54 = (void *)[*(id *)(*((void *)&v729 + 1) + 8 * v53) copyWithZone:a3];
        [(id)v6 addImageShotTypeResults:v54];

        ++v53;
      }
      while (v51 != v53);
      uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v729 objects:v824 count:16];
    }
    while (v51);
  }

  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  long long v725 = 0u;
  v55 = self->_livePhotoRecommendationResults;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v725 objects:v823 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v726;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v726 != v58) {
          objc_enumerationMutation(v55);
        }
        uint64_t v60 = (void *)[*(id *)(*((void *)&v725 + 1) + 8 * v59) copyWithZone:a3];
        [(id)v6 addLivePhotoRecommendationResults:v60];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v725 objects:v823 count:16];
    }
    while (v57);
  }

  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  long long v721 = 0u;
  unint64_t v61 = self->_livePhotoSharpnessResults;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v721 objects:v822 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v722;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v722 != v64) {
          objc_enumerationMutation(v61);
        }
        unint64_t v66 = (void *)[*(id *)(*((void *)&v721 + 1) + 8 * v65) copyWithZone:a3];
        [(id)v6 addLivePhotoSharpnessResults:v66];

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v721 objects:v822 count:16];
    }
    while (v63);
  }

  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  long long v717 = 0u;
  uint64_t v67 = self->_movieActivityLevelResults;
  uint64_t v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v717 objects:v821 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v718;
    do
    {
      uint64_t v71 = 0;
      do
      {
        if (*(void *)v718 != v70) {
          objc_enumerationMutation(v67);
        }
        uint64_t v72 = (void *)[*(id *)(*((void *)&v717 + 1) + 8 * v71) copyWithZone:a3];
        [(id)v6 addMovieActivityLevelResults:v72];

        ++v71;
      }
      while (v69 != v71);
      uint64_t v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v717 objects:v821 count:16];
    }
    while (v69);
  }

  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  long long v713 = 0u;
  unint64_t v73 = self->_movieCameraMotionResults;
  uint64_t v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v713 objects:v820 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v714;
    do
    {
      uint64_t v77 = 0;
      do
      {
        if (*(void *)v714 != v76) {
          objc_enumerationMutation(v73);
        }
        unint64_t v78 = (void *)[*(id *)(*((void *)&v713 + 1) + 8 * v77) copyWithZone:a3];
        [(id)v6 addMovieCameraMotionResults:v78];

        ++v77;
      }
      while (v75 != v77);
      uint64_t v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v713 objects:v820 count:16];
    }
    while (v75);
  }

  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  long long v709 = 0u;
  uint64_t v79 = self->_movieClassificationResults;
  uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v709 objects:v819 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v710;
    do
    {
      uint64_t v83 = 0;
      do
      {
        if (*(void *)v710 != v82) {
          objc_enumerationMutation(v79);
        }
        uint64_t v84 = (void *)[*(id *)(*((void *)&v709 + 1) + 8 * v83) copyWithZone:a3];
        [(id)v6 addMovieClassificationResults:v84];

        ++v83;
      }
      while (v81 != v83);
      uint64_t v81 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v709 objects:v819 count:16];
    }
    while (v81);
  }

  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  long long v705 = 0u;
  unint64_t v85 = self->_movieFaceResults;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v705 objects:v818 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v706;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v706 != v88) {
          objc_enumerationMutation(v85);
        }
        unint64_t v90 = (void *)[*(id *)(*((void *)&v705 + 1) + 8 * v89) copyWithZone:a3];
        [(id)v6 addMovieFaceResults:v90];

        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v705 objects:v818 count:16];
    }
    while (v87);
  }

  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  long long v701 = 0u;
  uint64_t v91 = self->_movieFaceprintResults;
  uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v701 objects:v817 count:16];
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v702;
    do
    {
      uint64_t v95 = 0;
      do
      {
        if (*(void *)v702 != v94) {
          objc_enumerationMutation(v91);
        }
        uint64_t v96 = (void *)[*(id *)(*((void *)&v701 + 1) + 8 * v95) copyWithZone:a3];
        [(id)v6 addMovieFaceprintResults:v96];

        ++v95;
      }
      while (v93 != v95);
      uint64_t v93 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v701 objects:v817 count:16];
    }
    while (v93);
  }

  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  long long v697 = 0u;
  unint64_t v97 = self->_movieFeatureResults;
  uint64_t v98 = [(NSMutableArray *)v97 countByEnumeratingWithState:&v697 objects:v816 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v698;
    do
    {
      uint64_t v101 = 0;
      do
      {
        if (*(void *)v698 != v100) {
          objc_enumerationMutation(v97);
        }
        unint64_t v102 = (void *)[*(id *)(*((void *)&v697 + 1) + 8 * v101) copyWithZone:a3];
        [(id)v6 addMovieFeatureResults:v102];

        ++v101;
      }
      while (v99 != v101);
      uint64_t v99 = [(NSMutableArray *)v97 countByEnumeratingWithState:&v697 objects:v816 count:16];
    }
    while (v99);
  }

  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  long long v693 = 0u;
  uint64_t v103 = self->_movieFineSubjectMotionResults;
  uint64_t v104 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v693 objects:v815 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v694;
    do
    {
      uint64_t v107 = 0;
      do
      {
        if (*(void *)v694 != v106) {
          objc_enumerationMutation(v103);
        }
        uint64_t v108 = (void *)[*(id *)(*((void *)&v693 + 1) + 8 * v107) copyWithZone:a3];
        [(id)v6 addMovieFineSubjectMotionResults:v108];

        ++v107;
      }
      while (v105 != v107);
      uint64_t v105 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v693 objects:v815 count:16];
    }
    while (v105);
  }

  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  long long v689 = 0u;
  unint64_t v109 = self->_movieInterestingnessResults;
  uint64_t v110 = [(NSMutableArray *)v109 countByEnumeratingWithState:&v689 objects:v814 count:16];
  if (v110)
  {
    uint64_t v111 = v110;
    uint64_t v112 = *(void *)v690;
    do
    {
      uint64_t v113 = 0;
      do
      {
        if (*(void *)v690 != v112) {
          objc_enumerationMutation(v109);
        }
        unint64_t v114 = (void *)[*(id *)(*((void *)&v689 + 1) + 8 * v113) copyWithZone:a3];
        [(id)v6 addMovieInterestingnessResults:v114];

        ++v113;
      }
      while (v111 != v113);
      uint64_t v111 = [(NSMutableArray *)v109 countByEnumeratingWithState:&v689 objects:v814 count:16];
    }
    while (v111);
  }

  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  long long v685 = 0u;
  uint64_t v115 = self->_movieMovingObjectResults;
  uint64_t v116 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v685 objects:v813 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v686;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v686 != v118) {
          objc_enumerationMutation(v115);
        }
        v120 = (void *)[*(id *)(*((void *)&v685 + 1) + 8 * v119) copyWithZone:a3];
        [(id)v6 addMovieMovingObjectResults:v120];

        ++v119;
      }
      while (v117 != v119);
      uint64_t v117 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v685 objects:v813 count:16];
    }
    while (v117);
  }

  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  long long v681 = 0u;
  unint64_t v121 = self->_movieMusicResults;
  uint64_t v122 = [(NSMutableArray *)v121 countByEnumeratingWithState:&v681 objects:v812 count:16];
  if (v122)
  {
    uint64_t v123 = v122;
    uint64_t v124 = *(void *)v682;
    do
    {
      uint64_t v125 = 0;
      do
      {
        if (*(void *)v682 != v124) {
          objc_enumerationMutation(v121);
        }
        unint64_t v126 = (void *)[*(id *)(*((void *)&v681 + 1) + 8 * v125) copyWithZone:a3];
        [(id)v6 addMovieMusicResults:v126];

        ++v125;
      }
      while (v123 != v125);
      uint64_t v123 = [(NSMutableArray *)v121 countByEnumeratingWithState:&v681 objects:v812 count:16];
    }
    while (v123);
  }

  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  long long v677 = 0u;
  uint64_t v127 = self->_movieObstructionResults;
  uint64_t v128 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v677 objects:v811 count:16];
  if (v128)
  {
    uint64_t v129 = v128;
    uint64_t v130 = *(void *)v678;
    do
    {
      uint64_t v131 = 0;
      do
      {
        if (*(void *)v678 != v130) {
          objc_enumerationMutation(v127);
        }
        uint64_t v132 = (void *)[*(id *)(*((void *)&v677 + 1) + 8 * v131) copyWithZone:a3];
        [(id)v6 addMovieObstructionResults:v132];

        ++v131;
      }
      while (v129 != v131);
      uint64_t v129 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v677 objects:v811 count:16];
    }
    while (v129);
  }

  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  long long v673 = 0u;
  unint64_t v133 = self->_movieOrientationResults;
  uint64_t v134 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v673 objects:v810 count:16];
  if (v134)
  {
    uint64_t v135 = v134;
    uint64_t v136 = *(void *)v674;
    do
    {
      uint64_t v137 = 0;
      do
      {
        if (*(void *)v674 != v136) {
          objc_enumerationMutation(v133);
        }
        unint64_t v138 = (void *)[*(id *)(*((void *)&v673 + 1) + 8 * v137) copyWithZone:a3];
        [(id)v6 addMovieOrientationResults:v138];

        ++v137;
      }
      while (v135 != v137);
      uint64_t v135 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v673 objects:v810 count:16];
    }
    while (v135);
  }

  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  long long v669 = 0u;
  uint64_t v139 = self->_moviePreEncodeResults;
  uint64_t v140 = [(NSMutableArray *)v139 countByEnumeratingWithState:&v669 objects:v809 count:16];
  if (v140)
  {
    uint64_t v141 = v140;
    uint64_t v142 = *(void *)v670;
    do
    {
      uint64_t v143 = 0;
      do
      {
        if (*(void *)v670 != v142) {
          objc_enumerationMutation(v139);
        }
        uint64_t v144 = (void *)[*(id *)(*((void *)&v669 + 1) + 8 * v143) copyWithZone:a3];
        [(id)v6 addMoviePreEncodeResults:v144];

        ++v143;
      }
      while (v141 != v143);
      uint64_t v141 = [(NSMutableArray *)v139 countByEnumeratingWithState:&v669 objects:v809 count:16];
    }
    while (v141);
  }

  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  long long v665 = 0u;
  unint64_t v145 = self->_movieQualityResults;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v665 objects:v808 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v666;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v666 != v148) {
          objc_enumerationMutation(v145);
        }
        unint64_t v150 = (void *)[*(id *)(*((void *)&v665 + 1) + 8 * v149) copyWithZone:a3];
        [(id)v6 addMovieQualityResults:v150];

        ++v149;
      }
      while (v147 != v149);
      uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v665 objects:v808 count:16];
    }
    while (v147);
  }

  long long v664 = 0u;
  long long v663 = 0u;
  long long v662 = 0u;
  long long v661 = 0u;
  uint64_t v151 = self->_movieSaliencyResults;
  uint64_t v152 = [(NSMutableArray *)v151 countByEnumeratingWithState:&v661 objects:v807 count:16];
  if (v152)
  {
    uint64_t v153 = v152;
    uint64_t v154 = *(void *)v662;
    do
    {
      uint64_t v155 = 0;
      do
      {
        if (*(void *)v662 != v154) {
          objc_enumerationMutation(v151);
        }
        uint64_t v156 = (void *)[*(id *)(*((void *)&v661 + 1) + 8 * v155) copyWithZone:a3];
        [(id)v6 addMovieSaliencyResults:v156];

        ++v155;
      }
      while (v153 != v155);
      uint64_t v153 = [(NSMutableArray *)v151 countByEnumeratingWithState:&v661 objects:v807 count:16];
    }
    while (v153);
  }

  long long v660 = 0u;
  long long v659 = 0u;
  long long v658 = 0u;
  long long v657 = 0u;
  unint64_t v157 = self->_movieSceneResults;
  uint64_t v158 = [(NSMutableArray *)v157 countByEnumeratingWithState:&v657 objects:v806 count:16];
  if (v158)
  {
    uint64_t v159 = v158;
    uint64_t v160 = *(void *)v658;
    do
    {
      uint64_t v161 = 0;
      do
      {
        if (*(void *)v658 != v160) {
          objc_enumerationMutation(v157);
        }
        unint64_t v162 = (void *)[*(id *)(*((void *)&v657 + 1) + 8 * v161) copyWithZone:a3];
        [(id)v6 addMovieSceneResults:v162];

        ++v161;
      }
      while (v159 != v161);
      uint64_t v159 = [(NSMutableArray *)v157 countByEnumeratingWithState:&v657 objects:v806 count:16];
    }
    while (v159);
  }

  long long v656 = 0u;
  long long v655 = 0u;
  long long v654 = 0u;
  long long v653 = 0u;
  uint64_t v163 = self->_movieSubjectMotionResults;
  uint64_t v164 = [(NSMutableArray *)v163 countByEnumeratingWithState:&v653 objects:v805 count:16];
  if (v164)
  {
    uint64_t v165 = v164;
    uint64_t v166 = *(void *)v654;
    do
    {
      uint64_t v167 = 0;
      do
      {
        if (*(void *)v654 != v166) {
          objc_enumerationMutation(v163);
        }
        uint64_t v168 = (void *)[*(id *)(*((void *)&v653 + 1) + 8 * v167) copyWithZone:a3];
        [(id)v6 addMovieSubjectMotionResults:v168];

        ++v167;
      }
      while (v165 != v167);
      uint64_t v165 = [(NSMutableArray *)v163 countByEnumeratingWithState:&v653 objects:v805 count:16];
    }
    while (v165);
  }

  long long v652 = 0u;
  long long v651 = 0u;
  long long v650 = 0u;
  long long v649 = 0u;
  unint64_t v169 = self->_movieUtteranceResults;
  uint64_t v170 = [(NSMutableArray *)v169 countByEnumeratingWithState:&v649 objects:v804 count:16];
  if (v170)
  {
    uint64_t v171 = v170;
    uint64_t v172 = *(void *)v650;
    do
    {
      uint64_t v173 = 0;
      do
      {
        if (*(void *)v650 != v172) {
          objc_enumerationMutation(v169);
        }
        unint64_t v174 = (void *)[*(id *)(*((void *)&v649 + 1) + 8 * v173) copyWithZone:a3];
        [(id)v6 addMovieUtteranceResults:v174];

        ++v173;
      }
      while (v171 != v173);
      uint64_t v171 = [(NSMutableArray *)v169 countByEnumeratingWithState:&v649 objects:v804 count:16];
    }
    while (v171);
  }

  long long v648 = 0u;
  long long v647 = 0u;
  long long v646 = 0u;
  long long v645 = 0u;
  v175 = self->_movieVoiceResults;
  uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v645 objects:v803 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v646;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v646 != v178) {
          objc_enumerationMutation(v175);
        }
        uint64_t v180 = (void *)[*(id *)(*((void *)&v645 + 1) + 8 * v179) copyWithZone:a3];
        [(id)v6 addMovieVoiceResults:v180];

        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v645 objects:v803 count:16];
    }
    while (v177);
  }

  long long v644 = 0u;
  long long v643 = 0u;
  long long v642 = 0u;
  long long v641 = 0u;
  unint64_t v181 = self->_imagePetsResults;
  uint64_t v182 = [(NSMutableArray *)v181 countByEnumeratingWithState:&v641 objects:v802 count:16];
  if (v182)
  {
    uint64_t v183 = v182;
    uint64_t v184 = *(void *)v642;
    do
    {
      uint64_t v185 = 0;
      do
      {
        if (*(void *)v642 != v184) {
          objc_enumerationMutation(v181);
        }
        unint64_t v186 = (void *)[*(id *)(*((void *)&v641 + 1) + 8 * v185) copyWithZone:a3];
        [(id)v6 addImagePetsResults:v186];

        ++v185;
      }
      while (v183 != v185);
      uint64_t v183 = [(NSMutableArray *)v181 countByEnumeratingWithState:&v641 objects:v802 count:16];
    }
    while (v183);
  }

  long long v640 = 0u;
  long long v639 = 0u;
  long long v638 = 0u;
  long long v637 = 0u;
  uint64_t v187 = self->_movieSummaryResults;
  uint64_t v188 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v637 objects:v801 count:16];
  if (v188)
  {
    uint64_t v189 = v188;
    uint64_t v190 = *(void *)v638;
    do
    {
      uint64_t v191 = 0;
      do
      {
        if (*(void *)v638 != v190) {
          objc_enumerationMutation(v187);
        }
        uint64_t v192 = (void *)[*(id *)(*((void *)&v637 + 1) + 8 * v191) copyWithZone:a3];
        [(id)v6 addMovieSummaryResults:v192];

        ++v191;
      }
      while (v189 != v191);
      uint64_t v189 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v637 objects:v801 count:16];
    }
    while (v189);
  }

  long long v636 = 0u;
  long long v635 = 0u;
  long long v634 = 0u;
  long long v633 = 0u;
  unint64_t v193 = self->_movieHighlightResults;
  uint64_t v194 = [(NSMutableArray *)v193 countByEnumeratingWithState:&v633 objects:v800 count:16];
  if (v194)
  {
    uint64_t v195 = v194;
    uint64_t v196 = *(void *)v634;
    do
    {
      uint64_t v197 = 0;
      do
      {
        if (*(void *)v634 != v196) {
          objc_enumerationMutation(v193);
        }
        unint64_t v198 = (void *)[*(id *)(*((void *)&v633 + 1) + 8 * v197) copyWithZone:a3];
        [(id)v6 addMovieHighlightResults:v198];

        ++v197;
      }
      while (v195 != v197);
      uint64_t v195 = [(NSMutableArray *)v193 countByEnumeratingWithState:&v633 objects:v800 count:16];
    }
    while (v195);
  }

  long long v632 = 0u;
  long long v631 = 0u;
  long long v630 = 0u;
  long long v629 = 0u;
  uint64_t v199 = self->_imageExposureResults;
  uint64_t v200 = [(NSMutableArray *)v199 countByEnumeratingWithState:&v629 objects:v799 count:16];
  if (v200)
  {
    uint64_t v201 = v200;
    uint64_t v202 = *(void *)v630;
    do
    {
      uint64_t v203 = 0;
      do
      {
        if (*(void *)v630 != v202) {
          objc_enumerationMutation(v199);
        }
        uint64_t v204 = (void *)[*(id *)(*((void *)&v629 + 1) + 8 * v203) copyWithZone:a3];
        [(id)v6 addImageExposureResults:v204];

        ++v203;
      }
      while (v201 != v203);
      uint64_t v201 = [(NSMutableArray *)v199 countByEnumeratingWithState:&v629 objects:v799 count:16];
    }
    while (v201);
  }

  long long v628 = 0u;
  long long v627 = 0u;
  long long v626 = 0u;
  long long v625 = 0u;
  unint64_t v205 = self->_livePhotoEffectsResults;
  uint64_t v206 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v625 objects:v798 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v626;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v626 != v208) {
          objc_enumerationMutation(v205);
        }
        unint64_t v210 = (void *)[*(id *)(*((void *)&v625 + 1) + 8 * v209) copyWithZone:a3];
        [(id)v6 addLivePhotoEffectsResults:v210];

        ++v209;
      }
      while (v207 != v209);
      uint64_t v207 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v625 objects:v798 count:16];
    }
    while (v207);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 32) = self->_statsFlags;
    *(unsigned char *)(v6 + 688) |= 2u;
  }
  long long v624 = 0u;
  long long v623 = 0u;
  long long v622 = 0u;
  long long v621 = 0u;
  uint64_t v211 = self->_imagePetsFaceResults;
  uint64_t v212 = [(NSMutableArray *)v211 countByEnumeratingWithState:&v621 objects:v797 count:16];
  if (v212)
  {
    uint64_t v213 = v212;
    uint64_t v214 = *(void *)v622;
    do
    {
      uint64_t v215 = 0;
      do
      {
        if (*(void *)v622 != v214) {
          objc_enumerationMutation(v211);
        }
        uint64_t v216 = (void *)[*(id *)(*((void *)&v621 + 1) + 8 * v215) copyWithZone:a3];
        [(id)v6 addImagePetsFaceResults:v216];

        ++v215;
      }
      while (v213 != v215);
      uint64_t v213 = [(NSMutableArray *)v211 countByEnumeratingWithState:&v621 objects:v797 count:16];
    }
    while (v213);
  }

  long long v620 = 0u;
  long long v619 = 0u;
  long long v618 = 0u;
  long long v617 = 0u;
  unint64_t v217 = self->_imageSceneprintResults;
  uint64_t v218 = [(NSMutableArray *)v217 countByEnumeratingWithState:&v617 objects:v796 count:16];
  if (v218)
  {
    uint64_t v219 = v218;
    uint64_t v220 = *(void *)v618;
    do
    {
      uint64_t v221 = 0;
      do
      {
        if (*(void *)v618 != v220) {
          objc_enumerationMutation(v217);
        }
        unint64_t v222 = (void *)[*(id *)(*((void *)&v617 + 1) + 8 * v221) copyWithZone:a3];
        [(id)v6 addImageSceneprintResults:v222];

        ++v221;
      }
      while (v219 != v221);
      uint64_t v219 = [(NSMutableArray *)v217 countByEnumeratingWithState:&v617 objects:v796 count:16];
    }
    while (v219);
  }

  long long v616 = 0u;
  long long v615 = 0u;
  long long v614 = 0u;
  long long v613 = 0u;
  uint64_t v223 = self->_movieSceneprintResults;
  uint64_t v224 = [(NSMutableArray *)v223 countByEnumeratingWithState:&v613 objects:v795 count:16];
  if (v224)
  {
    uint64_t v225 = v224;
    uint64_t v226 = *(void *)v614;
    do
    {
      uint64_t v227 = 0;
      do
      {
        if (*(void *)v614 != v226) {
          objc_enumerationMutation(v223);
        }
        uint64_t v228 = (void *)[*(id *)(*((void *)&v613 + 1) + 8 * v227) copyWithZone:a3];
        [(id)v6 addMovieSceneprintResults:v228];

        ++v227;
      }
      while (v225 != v227);
      uint64_t v225 = [(NSMutableArray *)v223 countByEnumeratingWithState:&v613 objects:v795 count:16];
    }
    while (v225);
  }

  long long v612 = 0u;
  long long v611 = 0u;
  long long v610 = 0u;
  long long v609 = 0u;
  unint64_t v229 = self->_imageHumanPoseResults;
  uint64_t v230 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v609 objects:v794 count:16];
  if (v230)
  {
    uint64_t v231 = v230;
    uint64_t v232 = *(void *)v610;
    do
    {
      uint64_t v233 = 0;
      do
      {
        if (*(void *)v610 != v232) {
          objc_enumerationMutation(v229);
        }
        unint64_t v234 = (void *)[*(id *)(*((void *)&v609 + 1) + 8 * v233) copyWithZone:a3];
        [(id)v6 addImageHumanPoseResults:v234];

        ++v233;
      }
      while (v231 != v233);
      uint64_t v231 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v609 objects:v794 count:16];
    }
    while (v231);
  }

  long long v608 = 0u;
  long long v607 = 0u;
  long long v606 = 0u;
  long long v605 = 0u;
  uint64_t v235 = self->_movieHumanPoseResults;
  uint64_t v236 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v605 objects:v793 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v606;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v606 != v238) {
          objc_enumerationMutation(v235);
        }
        v240 = (void *)[*(id *)(*((void *)&v605 + 1) + 8 * v239) copyWithZone:a3];
        [(id)v6 addMovieHumanPoseResults:v240];

        ++v239;
      }
      while (v237 != v239);
      uint64_t v237 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v605 objects:v793 count:16];
    }
    while (v237);
  }

  long long v604 = 0u;
  long long v603 = 0u;
  long long v602 = 0u;
  long long v601 = 0u;
  unint64_t v241 = self->_movieApplauseResults;
  uint64_t v242 = [(NSMutableArray *)v241 countByEnumeratingWithState:&v601 objects:v792 count:16];
  if (v242)
  {
    uint64_t v243 = v242;
    uint64_t v244 = *(void *)v602;
    do
    {
      uint64_t v245 = 0;
      do
      {
        if (*(void *)v602 != v244) {
          objc_enumerationMutation(v241);
        }
        unint64_t v246 = (void *)[*(id *)(*((void *)&v601 + 1) + 8 * v245) copyWithZone:a3];
        [(id)v6 addMovieApplauseResults:v246];

        ++v245;
      }
      while (v243 != v245);
      uint64_t v243 = [(NSMutableArray *)v241 countByEnumeratingWithState:&v601 objects:v792 count:16];
    }
    while (v243);
  }

  long long v600 = 0u;
  long long v599 = 0u;
  long long v598 = 0u;
  long long v597 = 0u;
  uint64_t v247 = self->_movieBabbleResults;
  uint64_t v248 = [(NSMutableArray *)v247 countByEnumeratingWithState:&v597 objects:v791 count:16];
  if (v248)
  {
    uint64_t v249 = v248;
    uint64_t v250 = *(void *)v598;
    do
    {
      uint64_t v251 = 0;
      do
      {
        if (*(void *)v598 != v250) {
          objc_enumerationMutation(v247);
        }
        uint64_t v252 = (void *)[*(id *)(*((void *)&v597 + 1) + 8 * v251) copyWithZone:a3];
        [(id)v6 addMovieBabbleResults:v252];

        ++v251;
      }
      while (v249 != v251);
      uint64_t v249 = [(NSMutableArray *)v247 countByEnumeratingWithState:&v597 objects:v791 count:16];
    }
    while (v249);
  }

  long long v596 = 0u;
  long long v595 = 0u;
  long long v594 = 0u;
  long long v593 = 0u;
  unint64_t v253 = self->_movieCheeringResults;
  uint64_t v254 = [(NSMutableArray *)v253 countByEnumeratingWithState:&v593 objects:v790 count:16];
  if (v254)
  {
    uint64_t v255 = v254;
    uint64_t v256 = *(void *)v594;
    do
    {
      uint64_t v257 = 0;
      do
      {
        if (*(void *)v594 != v256) {
          objc_enumerationMutation(v253);
        }
        unint64_t v258 = (void *)[*(id *)(*((void *)&v593 + 1) + 8 * v257) copyWithZone:a3];
        [(id)v6 addMovieCheeringResults:v258];

        ++v257;
      }
      while (v255 != v257);
      uint64_t v255 = [(NSMutableArray *)v253 countByEnumeratingWithState:&v593 objects:v790 count:16];
    }
    while (v255);
  }

  long long v592 = 0u;
  long long v591 = 0u;
  long long v590 = 0u;
  long long v589 = 0u;
  uint64_t v259 = self->_movieLaughterResults;
  uint64_t v260 = [(NSMutableArray *)v259 countByEnumeratingWithState:&v589 objects:v789 count:16];
  if (v260)
  {
    uint64_t v261 = v260;
    uint64_t v262 = *(void *)v590;
    do
    {
      uint64_t v263 = 0;
      do
      {
        if (*(void *)v590 != v262) {
          objc_enumerationMutation(v259);
        }
        uint64_t v264 = (void *)[*(id *)(*((void *)&v589 + 1) + 8 * v263) copyWithZone:a3];
        [(id)v6 addMovieLaughterResults:v264];

        ++v263;
      }
      while (v261 != v263);
      uint64_t v261 = [(NSMutableArray *)v259 countByEnumeratingWithState:&v589 objects:v789 count:16];
    }
    while (v261);
  }

  long long v588 = 0u;
  long long v587 = 0u;
  long long v586 = 0u;
  long long v585 = 0u;
  unint64_t v265 = self->_livePhotoKeyFrameResults;
  uint64_t v266 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v585 objects:v788 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v586;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v586 != v268) {
          objc_enumerationMutation(v265);
        }
        unint64_t v270 = (void *)[*(id *)(*((void *)&v585 + 1) + 8 * v269) copyWithZone:a3];
        [(id)v6 addLivePhotoKeyFrameResults:v270];

        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v585 objects:v788 count:16];
    }
    while (v267);
  }

  long long v584 = 0u;
  long long v583 = 0u;
  long long v582 = 0u;
  long long v581 = 0u;
  uint64_t v271 = self->_livePhotoKeyFrameStillResults;
  uint64_t v272 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v581 objects:v787 count:16];
  if (v272)
  {
    uint64_t v273 = v272;
    uint64_t v274 = *(void *)v582;
    do
    {
      uint64_t v275 = 0;
      do
      {
        if (*(void *)v582 != v274) {
          objc_enumerationMutation(v271);
        }
        uint64_t v276 = (void *)[*(id *)(*((void *)&v581 + 1) + 8 * v275) copyWithZone:a3];
        [(id)v6 addLivePhotoKeyFrameStillResults:v276];

        ++v275;
      }
      while (v273 != v275);
      uint64_t v273 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v581 objects:v787 count:16];
    }
    while (v273);
  }

  long long v580 = 0u;
  long long v579 = 0u;
  long long v578 = 0u;
  long long v577 = 0u;
  unint64_t v277 = self->_movieHumanActionResults;
  uint64_t v278 = [(NSMutableArray *)v277 countByEnumeratingWithState:&v577 objects:v786 count:16];
  if (v278)
  {
    uint64_t v279 = v278;
    uint64_t v280 = *(void *)v578;
    do
    {
      uint64_t v281 = 0;
      do
      {
        if (*(void *)v578 != v280) {
          objc_enumerationMutation(v277);
        }
        unint64_t v282 = (void *)[*(id *)(*((void *)&v577 + 1) + 8 * v281) copyWithZone:a3];
        [(id)v6 addMovieHumanActionResults:v282];

        ++v281;
      }
      while (v279 != v281);
      uint64_t v279 = [(NSMutableArray *)v277 countByEnumeratingWithState:&v577 objects:v786 count:16];
    }
    while (v279);
  }

  long long v576 = 0u;
  long long v575 = 0u;
  long long v574 = 0u;
  long long v573 = 0u;
  uint64_t v283 = self->_movieSubtleMotionResults;
  uint64_t v284 = [(NSMutableArray *)v283 countByEnumeratingWithState:&v573 objects:v785 count:16];
  if (v284)
  {
    uint64_t v285 = v284;
    uint64_t v286 = *(void *)v574;
    do
    {
      uint64_t v287 = 0;
      do
      {
        if (*(void *)v574 != v286) {
          objc_enumerationMutation(v283);
        }
        uint64_t v288 = (void *)[*(id *)(*((void *)&v573 + 1) + 8 * v287) copyWithZone:a3];
        [(id)v6 addMovieSubtleMotionResults:v288];

        ++v287;
      }
      while (v285 != v287);
      uint64_t v285 = [(NSMutableArray *)v283 countByEnumeratingWithState:&v573 objects:v785 count:16];
    }
    while (v285);
  }

  long long v572 = 0u;
  long long v571 = 0u;
  long long v570 = 0u;
  long long v569 = 0u;
  unint64_t v289 = self->_movieLoudnessResults;
  uint64_t v290 = [(NSMutableArray *)v289 countByEnumeratingWithState:&v569 objects:v784 count:16];
  if (v290)
  {
    uint64_t v291 = v290;
    uint64_t v292 = *(void *)v570;
    do
    {
      uint64_t v293 = 0;
      do
      {
        if (*(void *)v570 != v292) {
          objc_enumerationMutation(v289);
        }
        unint64_t v294 = (void *)[*(id *)(*((void *)&v569 + 1) + 8 * v293) copyWithZone:a3];
        [(id)v6 addMovieLoudnessResults:v294];

        ++v293;
      }
      while (v291 != v293);
      uint64_t v291 = [(NSMutableArray *)v289 countByEnumeratingWithState:&v569 objects:v784 count:16];
    }
    while (v291);
  }

  long long v568 = 0u;
  long long v567 = 0u;
  long long v566 = 0u;
  long long v565 = 0u;
  v295 = self->_moviePetsResults;
  uint64_t v296 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v565 objects:v783 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v566;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v566 != v298) {
          objc_enumerationMutation(v295);
        }
        v300 = (void *)[*(id *)(*((void *)&v565 + 1) + 8 * v299) copyWithZone:a3];
        [(id)v6 addMoviePetsResults:v300];

        ++v299;
      }
      while (v297 != v299);
      uint64_t v297 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v565 objects:v783 count:16];
    }
    while (v297);
  }

  long long v564 = 0u;
  long long v563 = 0u;
  long long v562 = 0u;
  long long v561 = 0u;
  uint64_t v301 = self->_moviePetsFaceResults;
  uint64_t v302 = [(NSMutableArray *)v301 countByEnumeratingWithState:&v561 objects:v782 count:16];
  if (v302)
  {
    uint64_t v303 = v302;
    uint64_t v304 = *(void *)v562;
    do
    {
      uint64_t v305 = 0;
      do
      {
        if (*(void *)v562 != v304) {
          objc_enumerationMutation(v301);
        }
        uint64_t v306 = (void *)[*(id *)(*((void *)&v561 + 1) + 8 * v305) copyWithZone:a3];
        [(id)v6 addMoviePetsFaceResults:v306];

        ++v305;
      }
      while (v303 != v305);
      uint64_t v303 = [(NSMutableArray *)v301 countByEnumeratingWithState:&v561 objects:v782 count:16];
    }
    while (v303);
  }

  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  uint64_t v307 = self->_movieStabilizationResults;
  uint64_t v308 = [(NSMutableArray *)v307 countByEnumeratingWithState:&v557 objects:v781 count:16];
  if (v308)
  {
    uint64_t v309 = v308;
    uint64_t v310 = *(void *)v558;
    do
    {
      uint64_t v311 = 0;
      do
      {
        if (*(void *)v558 != v310) {
          objc_enumerationMutation(v307);
        }
        uint64_t v312 = (void *)[*(id *)(*((void *)&v557 + 1) + 8 * v311) copyWithZone:a3];
        [(id)v6 addMovieStabilizationResults:v312];

        ++v311;
      }
      while (v309 != v311);
      uint64_t v309 = [(NSMutableArray *)v307 countByEnumeratingWithState:&v557 objects:v781 count:16];
    }
    while (v309);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v6 + 40) = self->_typesWide;
    *(unsigned char *)(v6 + 688) |= 4u;
  }
  long long v556 = 0u;
  long long v555 = 0u;
  long long v554 = 0u;
  long long v553 = 0u;
  uint64_t v313 = self->_movieHighlightScoreResults;
  uint64_t v314 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v553 objects:v780 count:16];
  if (v314)
  {
    uint64_t v315 = v314;
    uint64_t v316 = *(void *)v554;
    do
    {
      uint64_t v317 = 0;
      do
      {
        if (*(void *)v554 != v316) {
          objc_enumerationMutation(v313);
        }
        uint64_t v318 = (void *)[*(id *)(*((void *)&v553 + 1) + 8 * v317) copyWithZone:a3];
        [(id)v6 addMovieHighlightScoreResults:v318];

        ++v317;
      }
      while (v315 != v317);
      uint64_t v315 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v553 objects:v780 count:16];
    }
    while (v315);
  }

  long long v552 = 0u;
  long long v551 = 0u;
  long long v550 = 0u;
  long long v549 = 0u;
  uint64_t v319 = self->_livePhotoHumanActionClassificationResults;
  uint64_t v320 = [(NSMutableArray *)v319 countByEnumeratingWithState:&v549 objects:v779 count:16];
  if (v320)
  {
    uint64_t v321 = v320;
    uint64_t v322 = *(void *)v550;
    do
    {
      uint64_t v323 = 0;
      do
      {
        if (*(void *)v550 != v322) {
          objc_enumerationMutation(v319);
        }
        uint64_t v324 = (void *)[*(id *)(*((void *)&v549 + 1) + 8 * v323) copyWithZone:a3];
        [(id)v6 addLivePhotoHumanActionClassificationResults:v324];

        ++v323;
      }
      while (v321 != v323);
      uint64_t v321 = [(NSMutableArray *)v319 countByEnumeratingWithState:&v549 objects:v779 count:16];
    }
    while (v321);
  }

  long long v548 = 0u;
  long long v547 = 0u;
  long long v546 = 0u;
  long long v545 = 0u;
  uint64_t v325 = self->_movieAudioQualityResults;
  uint64_t v326 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v545 objects:v778 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v546;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v546 != v328) {
          objc_enumerationMutation(v325);
        }
        v330 = (void *)[*(id *)(*((void *)&v545 + 1) + 8 * v329) copyWithZone:a3];
        [(id)v6 addMovieAudioQualityResults:v330];

        ++v329;
      }
      while (v327 != v329);
      uint64_t v327 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v545 objects:v778 count:16];
    }
    while (v327);
  }

  long long v544 = 0u;
  long long v543 = 0u;
  long long v542 = 0u;
  long long v541 = 0u;
  uint64_t v331 = self->_movieSafetyResults;
  uint64_t v332 = [(NSMutableArray *)v331 countByEnumeratingWithState:&v541 objects:v777 count:16];
  if (v332)
  {
    uint64_t v333 = v332;
    uint64_t v334 = *(void *)v542;
    do
    {
      uint64_t v335 = 0;
      do
      {
        if (*(void *)v542 != v334) {
          objc_enumerationMutation(v331);
        }
        uint64_t v336 = (void *)[*(id *)(*((void *)&v541 + 1) + 8 * v335) copyWithZone:a3];
        [(id)v6 addMovieSafetyResults:v336];

        ++v335;
      }
      while (v333 != v335);
      uint64_t v333 = [(NSMutableArray *)v331 countByEnumeratingWithState:&v541 objects:v777 count:16];
    }
    while (v333);
  }

  long long v540 = 0u;
  long long v539 = 0u;
  long long v538 = 0u;
  long long v537 = 0u;
  uint64_t v337 = self->_filesystemMovieClassificationResults;
  uint64_t v338 = [(NSMutableArray *)v337 countByEnumeratingWithState:&v537 objects:v776 count:16];
  if (v338)
  {
    uint64_t v339 = v338;
    uint64_t v340 = *(void *)v538;
    do
    {
      uint64_t v341 = 0;
      do
      {
        if (*(void *)v538 != v340) {
          objc_enumerationMutation(v337);
        }
        uint64_t v342 = (void *)[*(id *)(*((void *)&v537 + 1) + 8 * v341) copyWithZone:a3];
        [(id)v6 addFilesystemMovieClassificationResults:v342];

        ++v341;
      }
      while (v339 != v341);
      uint64_t v339 = [(NSMutableArray *)v337 countByEnumeratingWithState:&v537 objects:v776 count:16];
    }
    while (v339);
  }

  long long v536 = 0u;
  long long v535 = 0u;
  long long v534 = 0u;
  long long v533 = 0u;
  uint64_t v343 = self->_filesystemMovieHumanActionClassificationResults;
  uint64_t v344 = [(NSMutableArray *)v343 countByEnumeratingWithState:&v533 objects:v775 count:16];
  if (v344)
  {
    uint64_t v345 = v344;
    uint64_t v346 = *(void *)v534;
    do
    {
      uint64_t v347 = 0;
      do
      {
        if (*(void *)v534 != v346) {
          objc_enumerationMutation(v343);
        }
        uint64_t v348 = (void *)[*(id *)(*((void *)&v533 + 1) + 8 * v347) copyWithZone:a3];
        [(id)v6 addFilesystemMovieHumanActionClassificationResults:v348];

        ++v347;
      }
      while (v345 != v347);
      uint64_t v345 = [(NSMutableArray *)v343 countByEnumeratingWithState:&v533 objects:v775 count:16];
    }
    while (v345);
  }

  long long v532 = 0u;
  long long v531 = 0u;
  long long v530 = 0u;
  long long v529 = 0u;
  uint64_t v349 = self->_filesystemMovieApplauseResults;
  uint64_t v350 = [(NSMutableArray *)v349 countByEnumeratingWithState:&v529 objects:v774 count:16];
  if (v350)
  {
    uint64_t v351 = v350;
    uint64_t v352 = *(void *)v530;
    do
    {
      uint64_t v353 = 0;
      do
      {
        if (*(void *)v530 != v352) {
          objc_enumerationMutation(v349);
        }
        uint64_t v354 = (void *)[*(id *)(*((void *)&v529 + 1) + 8 * v353) copyWithZone:a3];
        [(id)v6 addFilesystemMovieApplauseResults:v354];

        ++v353;
      }
      while (v351 != v353);
      uint64_t v351 = [(NSMutableArray *)v349 countByEnumeratingWithState:&v529 objects:v774 count:16];
    }
    while (v351);
  }

  long long v528 = 0u;
  long long v527 = 0u;
  long long v526 = 0u;
  long long v525 = 0u;
  uint64_t v355 = self->_filesystemMovieBabbleResults;
  uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v525 objects:v773 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v526;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v526 != v358) {
          objc_enumerationMutation(v355);
        }
        uint64_t v360 = (void *)[*(id *)(*((void *)&v525 + 1) + 8 * v359) copyWithZone:a3];
        [(id)v6 addFilesystemMovieBabbleResults:v360];

        ++v359;
      }
      while (v357 != v359);
      uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v525 objects:v773 count:16];
    }
    while (v357);
  }

  long long v523 = 0u;
  long long v524 = 0u;
  long long v521 = 0u;
  long long v522 = 0u;
  uint64_t v361 = self->_filesystemMovieCheeringResults;
  uint64_t v362 = [(NSMutableArray *)v361 countByEnumeratingWithState:&v521 objects:v772 count:16];
  if (v362)
  {
    uint64_t v363 = v362;
    uint64_t v364 = *(void *)v522;
    do
    {
      uint64_t v365 = 0;
      do
      {
        if (*(void *)v522 != v364) {
          objc_enumerationMutation(v361);
        }
        uint64_t v366 = (void *)[*(id *)(*((void *)&v521 + 1) + 8 * v365) copyWithZone:a3];
        [(id)v6 addFilesystemMovieCheeringResults:v366];

        ++v365;
      }
      while (v363 != v365);
      uint64_t v363 = [(NSMutableArray *)v361 countByEnumeratingWithState:&v521 objects:v772 count:16];
    }
    while (v363);
  }

  long long v519 = 0u;
  long long v520 = 0u;
  long long v517 = 0u;
  long long v518 = 0u;
  uint64_t v367 = self->_filesystemMovieLaughterResults;
  uint64_t v368 = [(NSMutableArray *)v367 countByEnumeratingWithState:&v517 objects:v771 count:16];
  if (v368)
  {
    uint64_t v369 = v368;
    uint64_t v370 = *(void *)v518;
    do
    {
      uint64_t v371 = 0;
      do
      {
        if (*(void *)v518 != v370) {
          objc_enumerationMutation(v367);
        }
        uint64_t v372 = (void *)[*(id *)(*((void *)&v517 + 1) + 8 * v371) copyWithZone:a3];
        [(id)v6 addFilesystemMovieLaughterResults:v372];

        ++v371;
      }
      while (v369 != v371);
      uint64_t v369 = [(NSMutableArray *)v367 countByEnumeratingWithState:&v517 objects:v771 count:16];
    }
    while (v369);
  }

  long long v515 = 0u;
  long long v516 = 0u;
  long long v513 = 0u;
  long long v514 = 0u;
  uint64_t v373 = self->_filesystemMovieMusicResults;
  uint64_t v374 = [(NSMutableArray *)v373 countByEnumeratingWithState:&v513 objects:v770 count:16];
  if (v374)
  {
    uint64_t v375 = v374;
    uint64_t v376 = *(void *)v514;
    do
    {
      uint64_t v377 = 0;
      do
      {
        if (*(void *)v514 != v376) {
          objc_enumerationMutation(v373);
        }
        long long v378 = (void *)[*(id *)(*((void *)&v513 + 1) + 8 * v377) copyWithZone:a3];
        [(id)v6 addFilesystemMovieMusicResults:v378];

        ++v377;
      }
      while (v375 != v377);
      uint64_t v375 = [(NSMutableArray *)v373 countByEnumeratingWithState:&v513 objects:v770 count:16];
    }
    while (v375);
  }

  long long v511 = 0u;
  long long v512 = 0u;
  long long v509 = 0u;
  long long v510 = 0u;
  long long v379 = self->_filesystemMovieVoiceResults;
  uint64_t v380 = [(NSMutableArray *)v379 countByEnumeratingWithState:&v509 objects:v769 count:16];
  if (v380)
  {
    uint64_t v381 = v380;
    uint64_t v382 = *(void *)v510;
    do
    {
      uint64_t v383 = 0;
      do
      {
        if (*(void *)v510 != v382) {
          objc_enumerationMutation(v379);
        }
        long long v384 = (void *)[*(id *)(*((void *)&v509 + 1) + 8 * v383) copyWithZone:a3];
        [(id)v6 addFilesystemMovieVoiceResults:v384];

        ++v383;
      }
      while (v381 != v383);
      uint64_t v381 = [(NSMutableArray *)v379 countByEnumeratingWithState:&v509 objects:v769 count:16];
    }
    while (v381);
  }

  long long v507 = 0u;
  long long v508 = 0u;
  long long v505 = 0u;
  long long v506 = 0u;
  long long v385 = self->_animatedStickerResults;
  uint64_t v386 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v505 objects:v768 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v506;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v506 != v388) {
          objc_enumerationMutation(v385);
        }
        long long v390 = (void *)[*(id *)(*((void *)&v505 + 1) + 8 * v389) copyWithZone:a3];
        [(id)v6 addAnimatedStickerResults:v390];

        ++v389;
      }
      while (v387 != v389);
      uint64_t v387 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v505 objects:v768 count:16];
    }
    while (v387);
  }

  long long v503 = 0u;
  long long v504 = 0u;
  long long v501 = 0u;
  long long v502 = 0u;
  long long v391 = self->_livePhotoSettlingEffectGatingResults;
  uint64_t v392 = [(NSMutableArray *)v391 countByEnumeratingWithState:&v501 objects:v767 count:16];
  if (v392)
  {
    uint64_t v393 = v392;
    uint64_t v394 = *(void *)v502;
    do
    {
      uint64_t v395 = 0;
      do
      {
        if (*(void *)v502 != v394) {
          objc_enumerationMutation(v391);
        }
        long long v396 = (void *)[*(id *)(*((void *)&v501 + 1) + 8 * v395) copyWithZone:a3];
        [(id)v6 addLivePhotoSettlingEffectGatingResults:v396];

        ++v395;
      }
      while (v393 != v395);
      uint64_t v393 = [(NSMutableArray *)v391 countByEnumeratingWithState:&v501 objects:v767 count:16];
    }
    while (v393);
  }

  uint64_t v397 = [(NSString *)self->_assetCloudIdentifier copyWithZone:a3];
  long long v398 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v397;

  long long v499 = 0u;
  long long v500 = 0u;
  long long v497 = 0u;
  long long v498 = 0u;
  long long v399 = self->_movieTorsoResults;
  uint64_t v400 = [(NSMutableArray *)v399 countByEnumeratingWithState:&v497 objects:v766 count:16];
  if (v400)
  {
    uint64_t v401 = v400;
    uint64_t v402 = *(void *)v498;
    do
    {
      uint64_t v403 = 0;
      do
      {
        if (*(void *)v498 != v402) {
          objc_enumerationMutation(v399);
        }
        long long v404 = (void *)[*(id *)(*((void *)&v497 + 1) + 8 * v403) copyWithZone:a3];
        [(id)v6 addMovieTorsoResults:v404];

        ++v403;
      }
      while (v401 != v403);
      uint64_t v401 = [(NSMutableArray *)v399 countByEnumeratingWithState:&v497 objects:v766 count:16];
    }
    while (v401);
  }

  long long v495 = 0u;
  long long v496 = 0u;
  long long v493 = 0u;
  long long v494 = 0u;
  long long v405 = self->_movieHumanActionClassificationResults;
  uint64_t v406 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v493 objects:v765 count:16];
  if (v406)
  {
    uint64_t v407 = v406;
    uint64_t v408 = *(void *)v494;
    do
    {
      uint64_t v409 = 0;
      do
      {
        if (*(void *)v494 != v408) {
          objc_enumerationMutation(v405);
        }
        long long v410 = (void *)[*(id *)(*((void *)&v493 + 1) + 8 * v409) copyWithZone:a3];
        [(id)v6 addMovieHumanActionClassificationResults:v410];

        ++v409;
      }
      while (v407 != v409);
      uint64_t v407 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v493 objects:v765 count:16];
    }
    while (v407);
  }

  long long v491 = 0u;
  long long v492 = 0u;
  long long v489 = 0u;
  long long v490 = 0u;
  long long v411 = self->_videoEmbeddingResults;
  uint64_t v412 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v489 objects:v764 count:16];
  if (v412)
  {
    uint64_t v413 = v412;
    uint64_t v414 = *(void *)v490;
    do
    {
      uint64_t v415 = 0;
      do
      {
        if (*(void *)v490 != v414) {
          objc_enumerationMutation(v411);
        }
        long long v416 = (void *)[*(id *)(*((void *)&v489 + 1) + 8 * v415) copyWithZone:a3];
        [(id)v6 addVideoEmbeddingResults:v416];

        ++v415;
      }
      while (v413 != v415);
      uint64_t v413 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v489 objects:v764 count:16];
    }
    while (v413);
  }

  long long v487 = 0u;
  long long v488 = 0u;
  long long v485 = 0u;
  long long v486 = 0u;
  long long v417 = self->_summarizedEmbeddingResults;
  uint64_t v418 = [(NSMutableArray *)v417 countByEnumeratingWithState:&v485 objects:v763 count:16];
  if (v418)
  {
    uint64_t v419 = v418;
    uint64_t v420 = *(void *)v486;
    do
    {
      uint64_t v421 = 0;
      do
      {
        if (*(void *)v486 != v420) {
          objc_enumerationMutation(v417);
        }
        long long v422 = (void *)[*(id *)(*((void *)&v485 + 1) + 8 * v421) copyWithZone:a3];
        [(id)v6 addSummarizedEmbeddingResults:v422];

        ++v421;
      }
      while (v419 != v421);
      uint64_t v419 = [(NSMutableArray *)v417 countByEnumeratingWithState:&v485 objects:v763 count:16];
    }
    while (v419);
  }

  long long v483 = 0u;
  long long v484 = 0u;
  long long v481 = 0u;
  long long v482 = 0u;
  long long v423 = self->_audioFusedVideoEmbeddingResults;
  uint64_t v424 = [(NSMutableArray *)v423 countByEnumeratingWithState:&v481 objects:v762 count:16];
  if (v424)
  {
    uint64_t v425 = v424;
    uint64_t v426 = *(void *)v482;
    do
    {
      uint64_t v427 = 0;
      do
      {
        if (*(void *)v482 != v426) {
          objc_enumerationMutation(v423);
        }
        long long v428 = (void *)[*(id *)(*((void *)&v481 + 1) + 8 * v427) copyWithZone:a3];
        [(id)v6 addAudioFusedVideoEmbeddingResults:v428];

        ++v427;
      }
      while (v425 != v427);
      uint64_t v425 = [(NSMutableArray *)v423 countByEnumeratingWithState:&v481 objects:v762 count:16];
    }
    while (v425);
  }

  long long v479 = 0u;
  long long v480 = 0u;
  long long v477 = 0u;
  long long v478 = 0u;
  long long v429 = self->_imageEmbeddingResults;
  uint64_t v430 = [(NSMutableArray *)v429 countByEnumeratingWithState:&v477 objects:v761 count:16];
  if (v430)
  {
    uint64_t v431 = v430;
    uint64_t v432 = *(void *)v478;
    do
    {
      uint64_t v433 = 0;
      do
      {
        if (*(void *)v478 != v432) {
          objc_enumerationMutation(v429);
        }
        long long v434 = (void *)[*(id *)(*((void *)&v477 + 1) + 8 * v433) copyWithZone:a3];
        [(id)v6 addImageEmbeddingResults:v434];

        ++v433;
      }
      while (v431 != v433);
      uint64_t v431 = [(NSMutableArray *)v429 countByEnumeratingWithState:&v477 objects:v761 count:16];
    }
    while (v431);
  }

  long long v475 = 0u;
  long long v476 = 0u;
  long long v473 = 0u;
  long long v474 = 0u;
  long long v435 = self->_imageCaptionResults;
  uint64_t v436 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v473 objects:v760 count:16];
  if (v436)
  {
    uint64_t v437 = v436;
    uint64_t v438 = *(void *)v474;
    do
    {
      uint64_t v439 = 0;
      do
      {
        if (*(void *)v474 != v438) {
          objc_enumerationMutation(v435);
        }
        long long v440 = (void *)[*(id *)(*((void *)&v473 + 1) + 8 * v439) copyWithZone:a3];
        [(id)v6 addImageCaptionResults:v440];

        ++v439;
      }
      while (v437 != v439);
      uint64_t v437 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v473 objects:v760 count:16];
    }
    while (v437);
  }

  long long v471 = 0u;
  long long v472 = 0u;
  long long v469 = 0u;
  long long v470 = 0u;
  long long v441 = self->_videoCaptionResults;
  uint64_t v442 = [(NSMutableArray *)v441 countByEnumeratingWithState:&v469 objects:v759 count:16];
  if (v442)
  {
    uint64_t v443 = v442;
    uint64_t v444 = *(void *)v470;
    do
    {
      uint64_t v445 = 0;
      do
      {
        if (*(void *)v470 != v444) {
          objc_enumerationMutation(v441);
        }
        long long v446 = (void *)[*(id *)(*((void *)&v469 + 1) + 8 * v445) copyWithZone:a3];
        [(id)v6 addVideoCaptionResults:v446];

        ++v445;
      }
      while (v443 != v445);
      uint64_t v443 = [(NSMutableArray *)v441 countByEnumeratingWithState:&v469 objects:v759 count:16];
    }
    while (v443);
  }

  long long v467 = 0u;
  long long v468 = 0u;
  long long v465 = 0u;
  long long v466 = 0u;
  long long v447 = self->_videoCaptionPreferenceResults;
  uint64_t v448 = [(NSMutableArray *)v447 countByEnumeratingWithState:&v465 objects:v758 count:16];
  if (v448)
  {
    uint64_t v449 = v448;
    uint64_t v450 = *(void *)v466;
    do
    {
      uint64_t v451 = 0;
      do
      {
        if (*(void *)v466 != v450) {
          objc_enumerationMutation(v447);
        }
        long long v452 = (void *)[*(id *)(*((void *)&v465 + 1) + 8 * v451) copyWithZone:a3];
        [(id)v6 addVideoCaptionPreferenceResults:v452];

        ++v451;
      }
      while (v449 != v451);
      uint64_t v449 = [(NSMutableArray *)v447 countByEnumeratingWithState:&v465 objects:v758 count:16];
    }
    while (v449);
  }

  long long v463 = 0u;
  long long v464 = 0u;
  long long v461 = 0u;
  long long v462 = 0u;
  long long v453 = self->_videoSegmentCaptionResults;
  uint64_t v454 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v461 objects:v757 count:16];
  if (v454)
  {
    uint64_t v455 = v454;
    uint64_t v456 = *(void *)v462;
    do
    {
      uint64_t v457 = 0;
      do
      {
        if (*(void *)v462 != v456) {
          objc_enumerationMutation(v453);
        }
        long long v458 = objc_msgSend(*(id *)(*((void *)&v461 + 1) + 8 * v457), "copyWithZone:", a3, (void)v461);
        [(id)v6 addVideoSegmentCaptionResults:v458];

        ++v457;
      }
      while (v455 != v457);
      uint64_t v455 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v461 objects:v757 count:16];
    }
    while (v455);
  }

  id v459 = (id)v6;
  return v459;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_version != *((_DWORD *)v4 + 163)
    || self->_types != *((_DWORD *)v4 + 162)
    || self->_flags != *((_DWORD *)v4 + 40)
    || self->_date != *((double *)v4 + 2))
  {
    goto LABEL_178;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 688) & 1) == 0 || self->_quality != *((double *)v4 + 3)) {
      goto LABEL_178;
    }
  }
  else if (*((unsigned char *)v4 + 688))
  {
LABEL_178:
    char v83 = 0;
    goto LABEL_179;
  }
  assetIdentifier = self->_assetIdentifier;
  if ((unint64_t)assetIdentifier | *((void *)v4 + 9)
    && !-[NSString isEqual:](assetIdentifier, "isEqual:"))
  {
    goto LABEL_178;
  }
  if (self->_assetModificationDate != *((double *)v4 + 1)) {
    goto LABEL_178;
  }
  assetMasterFingerprint = self->_assetMasterFingerprint;
  if ((unint64_t)assetMasterFingerprint | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](assetMasterFingerprint, "isEqual:")) {
      goto LABEL_178;
    }
  }
  assetAdjustedFingerprint = self->_assetAdjustedFingerprint;
  if ((unint64_t)assetAdjustedFingerprint | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](assetAdjustedFingerprint, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageBlurResults = self->_imageBlurResults;
  if ((unint64_t)imageBlurResults | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](imageBlurResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageCompositionResults = self->_imageCompositionResults;
  if ((unint64_t)imageCompositionResults | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](imageCompositionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageFaceResults = self->_imageFaceResults;
  if ((unint64_t)imageFaceResults | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](imageFaceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageFeatureResults = self->_imageFeatureResults;
  if ((unint64_t)imageFeatureResults | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](imageFeatureResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageJunkResults = self->_imageJunkResults;
  if ((unint64_t)imageJunkResults | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](imageJunkResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageSaliencyResults = self->_imageSaliencyResults;
  if ((unint64_t)imageSaliencyResults | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](imageSaliencyResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageShotTypeResults = self->_imageShotTypeResults;
  if ((unint64_t)imageShotTypeResults | *((void *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](imageShotTypeResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  if ((unint64_t)livePhotoRecommendationResults | *((void *)v4 + 39))
  {
    if (!-[NSMutableArray isEqual:](livePhotoRecommendationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  if ((unint64_t)livePhotoSharpnessResults | *((void *)v4 + 41))
  {
    if (!-[NSMutableArray isEqual:](livePhotoSharpnessResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieActivityLevelResults = self->_movieActivityLevelResults;
  if ((unint64_t)movieActivityLevelResults | *((void *)v4 + 42))
  {
    if (!-[NSMutableArray isEqual:](movieActivityLevelResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieCameraMotionResults = self->_movieCameraMotionResults;
  if ((unint64_t)movieCameraMotionResults | *((void *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](movieCameraMotionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieClassificationResults = self->_movieClassificationResults;
  if ((unint64_t)movieClassificationResults | *((void *)v4 + 48))
  {
    if (!-[NSMutableArray isEqual:](movieClassificationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieFaceResults = self->_movieFaceResults;
  if ((unint64_t)movieFaceResults | *((void *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](movieFaceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieFaceprintResults = self->_movieFaceprintResults;
  if ((unint64_t)movieFaceprintResults | *((void *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](movieFaceprintResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieFeatureResults = self->_movieFeatureResults;
  if ((unint64_t)movieFeatureResults | *((void *)v4 + 51))
  {
    if (!-[NSMutableArray isEqual:](movieFeatureResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  if ((unint64_t)movieFineSubjectMotionResults | *((void *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](movieFineSubjectMotionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieInterestingnessResults = self->_movieInterestingnessResults;
  if ((unint64_t)movieInterestingnessResults | *((void *)v4 + 58))
  {
    if (!-[NSMutableArray isEqual:](movieInterestingnessResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieMovingObjectResults = self->_movieMovingObjectResults;
  if ((unint64_t)movieMovingObjectResults | *((void *)v4 + 61))
  {
    if (!-[NSMutableArray isEqual:](movieMovingObjectResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieMusicResults = self->_movieMusicResults;
  if ((unint64_t)movieMusicResults | *((void *)v4 + 62))
  {
    if (!-[NSMutableArray isEqual:](movieMusicResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieObstructionResults = self->_movieObstructionResults;
  if ((unint64_t)movieObstructionResults | *((void *)v4 + 63))
  {
    if (!-[NSMutableArray isEqual:](movieObstructionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieOrientationResults = self->_movieOrientationResults;
  if ((unint64_t)movieOrientationResults | *((void *)v4 + 64))
  {
    if (!-[NSMutableArray isEqual:](movieOrientationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  moviePreEncodeResults = self->_moviePreEncodeResults;
  if ((unint64_t)moviePreEncodeResults | *((void *)v4 + 67))
  {
    if (!-[NSMutableArray isEqual:](moviePreEncodeResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieQualityResults = self->_movieQualityResults;
  if ((unint64_t)movieQualityResults | *((void *)v4 + 68))
  {
    if (!-[NSMutableArray isEqual:](movieQualityResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSaliencyResults = self->_movieSaliencyResults;
  if ((unint64_t)movieSaliencyResults | *((void *)v4 + 70))
  {
    if (!-[NSMutableArray isEqual:](movieSaliencyResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSceneResults = self->_movieSceneResults;
  if ((unint64_t)movieSceneResults | *((void *)v4 + 71))
  {
    if (!-[NSMutableArray isEqual:](movieSceneResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSubjectMotionResults = self->_movieSubjectMotionResults;
  if ((unint64_t)movieSubjectMotionResults | *((void *)v4 + 74))
  {
    if (!-[NSMutableArray isEqual:](movieSubjectMotionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieUtteranceResults = self->_movieUtteranceResults;
  if ((unint64_t)movieUtteranceResults | *((void *)v4 + 78))
  {
    if (!-[NSMutableArray isEqual:](movieUtteranceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieVoiceResults = self->_movieVoiceResults;
  if ((unint64_t)movieVoiceResults | *((void *)v4 + 79))
  {
    if (!-[NSMutableArray isEqual:](movieVoiceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imagePetsResults = self->_imagePetsResults;
  if ((unint64_t)imagePetsResults | *((void *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](imagePetsResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSummaryResults = self->_movieSummaryResults;
  if ((unint64_t)movieSummaryResults | *((void *)v4 + 76))
  {
    if (!-[NSMutableArray isEqual:](movieSummaryResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieHighlightResults = self->_movieHighlightResults;
  if ((unint64_t)movieHighlightResults | *((void *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](movieHighlightResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageExposureResults = self->_imageExposureResults;
  if ((unint64_t)imageExposureResults | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](imageExposureResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoEffectsResults = self->_livePhotoEffectsResults;
  if ((unint64_t)livePhotoEffectsResults | *((void *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](livePhotoEffectsResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 688) & 2) == 0 || self->_statsFlags != *((void *)v4 + 4)) {
      goto LABEL_178;
    }
  }
  else if ((*((unsigned char *)v4 + 688) & 2) != 0)
  {
    goto LABEL_178;
  }
  imagePetsFaceResults = self->_imagePetsFaceResults;
  if ((unint64_t)imagePetsFaceResults | *((void *)v4 + 30)
    && !-[NSMutableArray isEqual:](imagePetsFaceResults, "isEqual:"))
  {
    goto LABEL_178;
  }
  imageSceneprintResults = self->_imageSceneprintResults;
  if ((unint64_t)imageSceneprintResults | *((void *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](imageSceneprintResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSceneprintResults = self->_movieSceneprintResults;
  if ((unint64_t)movieSceneprintResults | *((void *)v4 + 72))
  {
    if (!-[NSMutableArray isEqual:](movieSceneprintResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageHumanPoseResults = self->_imageHumanPoseResults;
  if ((unint64_t)imageHumanPoseResults | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](imageHumanPoseResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieHumanPoseResults = self->_movieHumanPoseResults;
  if ((unint64_t)movieHumanPoseResults | *((void *)v4 + 57))
  {
    if (!-[NSMutableArray isEqual:](movieHumanPoseResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieApplauseResults = self->_movieApplauseResults;
  if ((unint64_t)movieApplauseResults | *((void *)v4 + 43))
  {
    if (!-[NSMutableArray isEqual:](movieApplauseResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieBabbleResults = self->_movieBabbleResults;
  if ((unint64_t)movieBabbleResults | *((void *)v4 + 45))
  {
    if (!-[NSMutableArray isEqual:](movieBabbleResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieCheeringResults = self->_movieCheeringResults;
  if ((unint64_t)movieCheeringResults | *((void *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](movieCheeringResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieLaughterResults = self->_movieLaughterResults;
  if ((unint64_t)movieLaughterResults | *((void *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](movieLaughterResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  if ((unint64_t)livePhotoKeyFrameResults | *((void *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](livePhotoKeyFrameResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  if ((unint64_t)livePhotoKeyFrameStillResults | *((void *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](livePhotoKeyFrameStillResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieHumanActionResults = self->_movieHumanActionResults;
  if ((unint64_t)movieHumanActionResults | *((void *)v4 + 56))
  {
    if (!-[NSMutableArray isEqual:](movieHumanActionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSubtleMotionResults = self->_movieSubtleMotionResults;
  if ((unint64_t)movieSubtleMotionResults | *((void *)v4 + 75))
  {
    if (!-[NSMutableArray isEqual:](movieSubtleMotionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieLoudnessResults = self->_movieLoudnessResults;
  if ((unint64_t)movieLoudnessResults | *((void *)v4 + 60))
  {
    if (!-[NSMutableArray isEqual:](movieLoudnessResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  moviePetsResults = self->_moviePetsResults;
  if ((unint64_t)moviePetsResults | *((void *)v4 + 66))
  {
    if (!-[NSMutableArray isEqual:](moviePetsResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  moviePetsFaceResults = self->_moviePetsFaceResults;
  if ((unint64_t)moviePetsFaceResults | *((void *)v4 + 65))
  {
    if (!-[NSMutableArray isEqual:](moviePetsFaceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieStabilizationResults = self->_movieStabilizationResults;
  if ((unint64_t)movieStabilizationResults | *((void *)v4 + 73))
  {
    if (!-[NSMutableArray isEqual:](movieStabilizationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 688) & 4) == 0 || self->_typesWide != *((void *)v4 + 5)) {
      goto LABEL_178;
    }
  }
  else if ((*((unsigned char *)v4 + 688) & 4) != 0)
  {
    goto LABEL_178;
  }
  movieHighlightScoreResults = self->_movieHighlightScoreResults;
  if ((unint64_t)movieHighlightScoreResults | *((void *)v4 + 54)
    && !-[NSMutableArray isEqual:](movieHighlightScoreResults, "isEqual:"))
  {
    goto LABEL_178;
  }
  livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  if ((unint64_t)livePhotoHumanActionClassificationResults | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](livePhotoHumanActionClassificationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieAudioQualityResults = self->_movieAudioQualityResults;
  if ((unint64_t)movieAudioQualityResults | *((void *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](movieAudioQualityResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieSafetyResults = self->_movieSafetyResults;
  if ((unint64_t)movieSafetyResults | *((void *)v4 + 69))
  {
    if (!-[NSMutableArray isEqual:](movieSafetyResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  if ((unint64_t)filesystemMovieClassificationResults | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieClassificationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  if ((unint64_t)filesystemMovieHumanActionClassificationResults | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieHumanActionClassificationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  if ((unint64_t)filesystemMovieApplauseResults | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieApplauseResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  if ((unint64_t)filesystemMovieBabbleResults | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieBabbleResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  if ((unint64_t)filesystemMovieCheeringResults | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieCheeringResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  if ((unint64_t)filesystemMovieLaughterResults | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieLaughterResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  if ((unint64_t)filesystemMovieMusicResults | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieMusicResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  if ((unint64_t)filesystemMovieVoiceResults | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieVoiceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  animatedStickerResults = self->_animatedStickerResults;
  if ((unint64_t)animatedStickerResults | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](animatedStickerResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  if ((unint64_t)livePhotoSettlingEffectGatingResults | *((void *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](livePhotoSettlingEffectGatingResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieTorsoResults = self->_movieTorsoResults;
  if ((unint64_t)movieTorsoResults | *((void *)v4 + 77))
  {
    if (!-[NSMutableArray isEqual:](movieTorsoResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  if ((unint64_t)movieHumanActionClassificationResults | *((void *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](movieHumanActionClassificationResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  videoEmbeddingResults = self->_videoEmbeddingResults;
  if ((unint64_t)videoEmbeddingResults | *((void *)v4 + 84))
  {
    if (!-[NSMutableArray isEqual:](videoEmbeddingResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  if ((unint64_t)summarizedEmbeddingResults | *((void *)v4 + 80))
  {
    if (!-[NSMutableArray isEqual:](summarizedEmbeddingResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  if ((unint64_t)audioFusedVideoEmbeddingResults | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](audioFusedVideoEmbeddingResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageEmbeddingResults = self->_imageEmbeddingResults;
  if ((unint64_t)imageEmbeddingResults | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](imageEmbeddingResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  imageCaptionResults = self->_imageCaptionResults;
  if ((unint64_t)imageCaptionResults | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](imageCaptionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  videoCaptionResults = self->_videoCaptionResults;
  if ((unint64_t)videoCaptionResults | *((void *)v4 + 83))
  {
    if (!-[NSMutableArray isEqual:](videoCaptionResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  if ((unint64_t)videoCaptionPreferenceResults | *((void *)v4 + 82))
  {
    if (!-[NSMutableArray isEqual:](videoCaptionPreferenceResults, "isEqual:")) {
      goto LABEL_178;
    }
  }
  videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  if ((unint64_t)videoSegmentCaptionResults | *((void *)v4 + 85)) {
    char v83 = -[NSMutableArray isEqual:](videoSegmentCaptionResults, "isEqual:");
  }
  else {
    char v83 = 1;
  }
LABEL_179:

  return v83;
}

- (unint64_t)hash
{
  versiouint64_t n = self->_version;
  unsigned int types = self->_types;
  unsigned int flags = self->_flags;
  double date = self->_date;
  double v4 = -date;
  if (date >= 0.0) {
    double v4 = self->_date;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  unint64_t v100 = v7;
  if (*(unsigned char *)&self->_has)
  {
    double quality = self->_quality;
    double v10 = -quality;
    if (quality >= 0.0) {
      double v10 = self->_quality;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t v99 = v8;
  NSUInteger v98 = [(NSString *)self->_assetIdentifier hash];
  double assetModificationDate = self->_assetModificationDate;
  double v14 = -assetModificationDate;
  if (assetModificationDate >= 0.0) {
    double v14 = self->_assetModificationDate;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  unint64_t v97 = v17;
  NSUInteger v96 = [(NSString *)self->_assetMasterFingerprint hash];
  NSUInteger v95 = [(NSString *)self->_assetAdjustedFingerprint hash];
  uint64_t v94 = [(NSMutableArray *)self->_imageBlurResults hash];
  uint64_t v93 = [(NSMutableArray *)self->_imageCompositionResults hash];
  uint64_t v92 = [(NSMutableArray *)self->_imageFaceResults hash];
  uint64_t v91 = [(NSMutableArray *)self->_imageFeatureResults hash];
  uint64_t v90 = [(NSMutableArray *)self->_imageJunkResults hash];
  uint64_t v89 = [(NSMutableArray *)self->_imageSaliencyResults hash];
  uint64_t v88 = [(NSMutableArray *)self->_imageShotTypeResults hash];
  uint64_t v87 = [(NSMutableArray *)self->_livePhotoRecommendationResults hash];
  uint64_t v86 = [(NSMutableArray *)self->_livePhotoSharpnessResults hash];
  uint64_t v85 = [(NSMutableArray *)self->_movieActivityLevelResults hash];
  uint64_t v84 = [(NSMutableArray *)self->_movieCameraMotionResults hash];
  uint64_t v83 = [(NSMutableArray *)self->_movieClassificationResults hash];
  uint64_t v82 = [(NSMutableArray *)self->_movieFaceResults hash];
  uint64_t v81 = [(NSMutableArray *)self->_movieFaceprintResults hash];
  uint64_t v80 = [(NSMutableArray *)self->_movieFeatureResults hash];
  uint64_t v79 = [(NSMutableArray *)self->_movieFineSubjectMotionResults hash];
  uint64_t v78 = [(NSMutableArray *)self->_movieInterestingnessResults hash];
  uint64_t v77 = [(NSMutableArray *)self->_movieMovingObjectResults hash];
  uint64_t v76 = [(NSMutableArray *)self->_movieMusicResults hash];
  uint64_t v75 = [(NSMutableArray *)self->_movieObstructionResults hash];
  uint64_t v74 = [(NSMutableArray *)self->_movieOrientationResults hash];
  uint64_t v73 = [(NSMutableArray *)self->_moviePreEncodeResults hash];
  uint64_t v72 = [(NSMutableArray *)self->_movieQualityResults hash];
  uint64_t v71 = [(NSMutableArray *)self->_movieSaliencyResults hash];
  uint64_t v70 = [(NSMutableArray *)self->_movieSceneResults hash];
  uint64_t v69 = [(NSMutableArray *)self->_movieSubjectMotionResults hash];
  uint64_t v68 = [(NSMutableArray *)self->_movieUtteranceResults hash];
  uint64_t v66 = [(NSMutableArray *)self->_movieVoiceResults hash];
  uint64_t v64 = [(NSMutableArray *)self->_imagePetsResults hash];
  uint64_t v62 = [(NSMutableArray *)self->_movieSummaryResults hash];
  uint64_t v61 = [(NSMutableArray *)self->_movieHighlightResults hash];
  uint64_t v67 = [(NSMutableArray *)self->_imageExposureResults hash];
  uint64_t v65 = [(NSMutableArray *)self->_livePhotoEffectsResults hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v63 = 2654435761u * self->_statsFlags;
  }
  else {
    unint64_t v63 = 0;
  }
  uint64_t v60 = [(NSMutableArray *)self->_imagePetsFaceResults hash];
  uint64_t v59 = [(NSMutableArray *)self->_imageSceneprintResults hash];
  uint64_t v58 = [(NSMutableArray *)self->_movieSceneprintResults hash];
  uint64_t v57 = [(NSMutableArray *)self->_imageHumanPoseResults hash];
  uint64_t v56 = [(NSMutableArray *)self->_movieHumanPoseResults hash];
  uint64_t v55 = [(NSMutableArray *)self->_movieApplauseResults hash];
  uint64_t v54 = [(NSMutableArray *)self->_movieBabbleResults hash];
  uint64_t v53 = [(NSMutableArray *)self->_movieCheeringResults hash];
  uint64_t v18 = [(NSMutableArray *)self->_movieLaughterResults hash];
  uint64_t v19 = [(NSMutableArray *)self->_livePhotoKeyFrameResults hash];
  uint64_t v20 = [(NSMutableArray *)self->_livePhotoKeyFrameStillResults hash];
  uint64_t v21 = [(NSMutableArray *)self->_movieHumanActionResults hash];
  uint64_t v22 = [(NSMutableArray *)self->_movieSubtleMotionResults hash];
  uint64_t v23 = [(NSMutableArray *)self->_movieLoudnessResults hash];
  uint64_t v24 = [(NSMutableArray *)self->_moviePetsResults hash];
  uint64_t v25 = [(NSMutableArray *)self->_moviePetsFaceResults hash];
  uint64_t v26 = [(NSMutableArray *)self->_movieStabilizationResults hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v27 = 2654435761u * self->_typesWide;
  }
  else {
    unint64_t v27 = 0;
  }
  uint64_t v28 = v68 ^ v66 ^ v64 ^ v62 ^ v61 ^ v67 ^ v65 ^ v63 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ [(NSMutableArray *)self->_movieHighlightScoreResults hash];
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_livePhotoHumanActionClassificationResults hash];
  uint64_t v30 = (2654435761 * types) ^ (2654435761 * version) ^ v99 ^ v98 ^ v97 ^ (2654435761 * flags) ^ v100 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v29 ^ [(NSMutableArray *)self->_movieAudioQualityResults hash];
  uint64_t v31 = [(NSMutableArray *)self->_movieSafetyResults hash];
  uint64_t v32 = v31 ^ [(NSMutableArray *)self->_filesystemMovieClassificationResults hash];
  uint64_t v33 = v32 ^ [(NSMutableArray *)self->_filesystemMovieHumanActionClassificationResults hash];
  uint64_t v34 = v33 ^ [(NSMutableArray *)self->_filesystemMovieApplauseResults hash];
  uint64_t v35 = v34 ^ [(NSMutableArray *)self->_filesystemMovieBabbleResults hash];
  uint64_t v36 = v35 ^ [(NSMutableArray *)self->_filesystemMovieCheeringResults hash];
  uint64_t v37 = v36 ^ [(NSMutableArray *)self->_filesystemMovieLaughterResults hash];
  uint64_t v38 = v37 ^ [(NSMutableArray *)self->_filesystemMovieMusicResults hash];
  uint64_t v39 = v38 ^ [(NSMutableArray *)self->_filesystemMovieVoiceResults hash];
  uint64_t v40 = v39 ^ [(NSMutableArray *)self->_animatedStickerResults hash];
  uint64_t v41 = v40 ^ [(NSMutableArray *)self->_livePhotoSettlingEffectGatingResults hash];
  NSUInteger v42 = v41 ^ [(NSString *)self->_assetCloudIdentifier hash];
  uint64_t v43 = v42 ^ [(NSMutableArray *)self->_movieTorsoResults hash];
  uint64_t v44 = v43 ^ [(NSMutableArray *)self->_movieHumanActionClassificationResults hash];
  uint64_t v45 = v44 ^ [(NSMutableArray *)self->_videoEmbeddingResults hash];
  uint64_t v46 = v45 ^ [(NSMutableArray *)self->_summarizedEmbeddingResults hash];
  uint64_t v47 = v46 ^ [(NSMutableArray *)self->_audioFusedVideoEmbeddingResults hash];
  uint64_t v48 = v47 ^ [(NSMutableArray *)self->_imageEmbeddingResults hash];
  uint64_t v49 = v48 ^ [(NSMutableArray *)self->_imageCaptionResults hash];
  uint64_t v50 = v49 ^ [(NSMutableArray *)self->_videoCaptionResults hash];
  uint64_t v51 = v50 ^ [(NSMutableArray *)self->_videoCaptionPreferenceResults hash];
  return v30 ^ v51 ^ [(NSMutableArray *)self->_videoSegmentCaptionResults hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v746 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  self->_versiouint64_t n = *((_DWORD *)v4 + 163);
  self->_unsigned int types = *((_DWORD *)v4 + 162);
  self->_unsigned int flags = *((_DWORD *)v4 + 40);
  self->_double date = *((double *)v4 + 2);
  if (*((unsigned char *)v4 + 688))
  {
    self->_double quality = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 9)) {
    -[VCPProtoAssetAnalysis setAssetIdentifier:](self, "setAssetIdentifier:");
  }
  self->_double assetModificationDate = *((double *)v5 + 1);
  if (*((void *)v5 + 10)) {
    -[VCPProtoAssetAnalysis setAssetMasterFingerprint:](self, "setAssetMasterFingerprint:");
  }
  if (*((void *)v5 + 7)) {
    -[VCPProtoAssetAnalysis setAssetAdjustedFingerprint:](self, "setAssetAdjustedFingerprint:");
  }
  long long v671 = 0u;
  long long v670 = 0u;
  long long v669 = 0u;
  long long v668 = 0u;
  id v6 = *((id *)v5 + 21);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v668 objects:v745 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v669;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v669 != v9) {
          objc_enumerationMutation(v6);
        }
        [(VCPProtoAssetAnalysis *)self addImageBlurResults:*(void *)(*((void *)&v668 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v668 objects:v745 count:16];
    }
    while (v8);
  }

  long long v667 = 0u;
  long long v666 = 0u;
  long long v665 = 0u;
  long long v664 = 0u;
  id v11 = *((id *)v5 + 23);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v664 objects:v744 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v665;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v665 != v14) {
          objc_enumerationMutation(v11);
        }
        [(VCPProtoAssetAnalysis *)self addImageCompositionResults:*(void *)(*((void *)&v664 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v664 objects:v744 count:16];
    }
    while (v13);
  }

  long long v663 = 0u;
  long long v662 = 0u;
  long long v661 = 0u;
  long long v660 = 0u;
  id v16 = *((id *)v5 + 26);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v660 objects:v743 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v661;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v661 != v19) {
          objc_enumerationMutation(v16);
        }
        [(VCPProtoAssetAnalysis *)self addImageFaceResults:*(void *)(*((void *)&v660 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v660 objects:v743 count:16];
    }
    while (v18);
  }

  long long v659 = 0u;
  long long v658 = 0u;
  long long v657 = 0u;
  long long v656 = 0u;
  id v21 = *((id *)v5 + 27);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v656 objects:v742 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v657;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v657 != v24) {
          objc_enumerationMutation(v21);
        }
        [(VCPProtoAssetAnalysis *)self addImageFeatureResults:*(void *)(*((void *)&v656 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v656 objects:v742 count:16];
    }
    while (v23);
  }

  long long v655 = 0u;
  long long v654 = 0u;
  long long v653 = 0u;
  long long v652 = 0u;
  id v26 = *((id *)v5 + 29);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v652 objects:v741 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v653;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v653 != v29) {
          objc_enumerationMutation(v26);
        }
        [(VCPProtoAssetAnalysis *)self addImageJunkResults:*(void *)(*((void *)&v652 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v652 objects:v741 count:16];
    }
    while (v28);
  }

  long long v651 = 0u;
  long long v650 = 0u;
  long long v649 = 0u;
  long long v648 = 0u;
  id v31 = *((id *)v5 + 32);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v648 objects:v740 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v649;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v649 != v34) {
          objc_enumerationMutation(v31);
        }
        [(VCPProtoAssetAnalysis *)self addImageSaliencyResults:*(void *)(*((void *)&v648 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v648 objects:v740 count:16];
    }
    while (v33);
  }

  long long v647 = 0u;
  long long v646 = 0u;
  long long v645 = 0u;
  long long v644 = 0u;
  id v36 = *((id *)v5 + 34);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v644 objects:v739 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v645;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v645 != v39) {
          objc_enumerationMutation(v36);
        }
        [(VCPProtoAssetAnalysis *)self addImageShotTypeResults:*(void *)(*((void *)&v644 + 1) + 8 * jj)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v644 objects:v739 count:16];
    }
    while (v38);
  }

  long long v643 = 0u;
  long long v642 = 0u;
  long long v641 = 0u;
  long long v640 = 0u;
  id v41 = *((id *)v5 + 39);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v640 objects:v738 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v641;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v641 != v44) {
          objc_enumerationMutation(v41);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoRecommendationResults:*(void *)(*((void *)&v640 + 1) + 8 * kk)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v640 objects:v738 count:16];
    }
    while (v43);
  }

  long long v639 = 0u;
  long long v638 = 0u;
  long long v637 = 0u;
  long long v636 = 0u;
  id v46 = *((id *)v5 + 41);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v636 objects:v737 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v637;
    do
    {
      for (muint64_t m = 0; mm != v48; ++mm)
      {
        if (*(void *)v637 != v49) {
          objc_enumerationMutation(v46);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoSharpnessResults:*(void *)(*((void *)&v636 + 1) + 8 * mm)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v636 objects:v737 count:16];
    }
    while (v48);
  }

  long long v635 = 0u;
  long long v634 = 0u;
  long long v633 = 0u;
  long long v632 = 0u;
  id v51 = *((id *)v5 + 42);
  uint64_t v52 = [v51 countByEnumeratingWithState:&v632 objects:v736 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v633;
    do
    {
      for (nuint64_t n = 0; nn != v53; ++nn)
      {
        if (*(void *)v633 != v54) {
          objc_enumerationMutation(v51);
        }
        [(VCPProtoAssetAnalysis *)self addMovieActivityLevelResults:*(void *)(*((void *)&v632 + 1) + 8 * nn)];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v632 objects:v736 count:16];
    }
    while (v53);
  }

  long long v631 = 0u;
  long long v630 = 0u;
  long long v629 = 0u;
  long long v628 = 0u;
  id v56 = *((id *)v5 + 46);
  uint64_t v57 = [v56 countByEnumeratingWithState:&v628 objects:v735 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v629;
    do
    {
      for (uint64_t i1 = 0; i1 != v58; ++i1)
      {
        if (*(void *)v629 != v59) {
          objc_enumerationMutation(v56);
        }
        [(VCPProtoAssetAnalysis *)self addMovieCameraMotionResults:*(void *)(*((void *)&v628 + 1) + 8 * i1)];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v628 objects:v735 count:16];
    }
    while (v58);
  }

  long long v627 = 0u;
  long long v626 = 0u;
  long long v625 = 0u;
  long long v624 = 0u;
  id v61 = *((id *)v5 + 48);
  uint64_t v62 = [v61 countByEnumeratingWithState:&v624 objects:v734 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v625;
    do
    {
      for (uint64_t i2 = 0; i2 != v63; ++i2)
      {
        if (*(void *)v625 != v64) {
          objc_enumerationMutation(v61);
        }
        [(VCPProtoAssetAnalysis *)self addMovieClassificationResults:*(void *)(*((void *)&v624 + 1) + 8 * i2)];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v624 objects:v734 count:16];
    }
    while (v63);
  }

  long long v623 = 0u;
  long long v622 = 0u;
  long long v621 = 0u;
  long long v620 = 0u;
  id v66 = *((id *)v5 + 49);
  uint64_t v67 = [v66 countByEnumeratingWithState:&v620 objects:v733 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v621;
    do
    {
      for (uint64_t i3 = 0; i3 != v68; ++i3)
      {
        if (*(void *)v621 != v69) {
          objc_enumerationMutation(v66);
        }
        [(VCPProtoAssetAnalysis *)self addMovieFaceResults:*(void *)(*((void *)&v620 + 1) + 8 * i3)];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v620 objects:v733 count:16];
    }
    while (v68);
  }

  long long v619 = 0u;
  long long v618 = 0u;
  long long v617 = 0u;
  long long v616 = 0u;
  id v71 = *((id *)v5 + 50);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v616 objects:v732 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v617;
    do
    {
      for (uint64_t i4 = 0; i4 != v73; ++i4)
      {
        if (*(void *)v617 != v74) {
          objc_enumerationMutation(v71);
        }
        [(VCPProtoAssetAnalysis *)self addMovieFaceprintResults:*(void *)(*((void *)&v616 + 1) + 8 * i4)];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v616 objects:v732 count:16];
    }
    while (v73);
  }

  long long v615 = 0u;
  long long v614 = 0u;
  long long v613 = 0u;
  long long v612 = 0u;
  id v76 = *((id *)v5 + 51);
  uint64_t v77 = [v76 countByEnumeratingWithState:&v612 objects:v731 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v613;
    do
    {
      for (uint64_t i5 = 0; i5 != v78; ++i5)
      {
        if (*(void *)v613 != v79) {
          objc_enumerationMutation(v76);
        }
        [(VCPProtoAssetAnalysis *)self addMovieFeatureResults:*(void *)(*((void *)&v612 + 1) + 8 * i5)];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v612 objects:v731 count:16];
    }
    while (v78);
  }

  long long v611 = 0u;
  long long v610 = 0u;
  long long v609 = 0u;
  long long v608 = 0u;
  id v81 = *((id *)v5 + 52);
  uint64_t v82 = [v81 countByEnumeratingWithState:&v608 objects:v730 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v609;
    do
    {
      for (uint64_t i6 = 0; i6 != v83; ++i6)
      {
        if (*(void *)v609 != v84) {
          objc_enumerationMutation(v81);
        }
        [(VCPProtoAssetAnalysis *)self addMovieFineSubjectMotionResults:*(void *)(*((void *)&v608 + 1) + 8 * i6)];
      }
      uint64_t v83 = [v81 countByEnumeratingWithState:&v608 objects:v730 count:16];
    }
    while (v83);
  }

  long long v607 = 0u;
  long long v606 = 0u;
  long long v605 = 0u;
  long long v604 = 0u;
  id v86 = *((id *)v5 + 58);
  uint64_t v87 = [v86 countByEnumeratingWithState:&v604 objects:v729 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v605;
    do
    {
      for (uint64_t i7 = 0; i7 != v88; ++i7)
      {
        if (*(void *)v605 != v89) {
          objc_enumerationMutation(v86);
        }
        [(VCPProtoAssetAnalysis *)self addMovieInterestingnessResults:*(void *)(*((void *)&v604 + 1) + 8 * i7)];
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v604 objects:v729 count:16];
    }
    while (v88);
  }

  long long v603 = 0u;
  long long v602 = 0u;
  long long v601 = 0u;
  long long v600 = 0u;
  id v91 = *((id *)v5 + 61);
  uint64_t v92 = [v91 countByEnumeratingWithState:&v600 objects:v728 count:16];
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v601;
    do
    {
      for (uint64_t i8 = 0; i8 != v93; ++i8)
      {
        if (*(void *)v601 != v94) {
          objc_enumerationMutation(v91);
        }
        [(VCPProtoAssetAnalysis *)self addMovieMovingObjectResults:*(void *)(*((void *)&v600 + 1) + 8 * i8)];
      }
      uint64_t v93 = [v91 countByEnumeratingWithState:&v600 objects:v728 count:16];
    }
    while (v93);
  }

  long long v599 = 0u;
  long long v598 = 0u;
  long long v597 = 0u;
  long long v596 = 0u;
  id v96 = *((id *)v5 + 62);
  uint64_t v97 = [v96 countByEnumeratingWithState:&v596 objects:v727 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v597;
    do
    {
      for (uint64_t i9 = 0; i9 != v98; ++i9)
      {
        if (*(void *)v597 != v99) {
          objc_enumerationMutation(v96);
        }
        [(VCPProtoAssetAnalysis *)self addMovieMusicResults:*(void *)(*((void *)&v596 + 1) + 8 * i9)];
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v596 objects:v727 count:16];
    }
    while (v98);
  }

  long long v595 = 0u;
  long long v594 = 0u;
  long long v593 = 0u;
  long long v592 = 0u;
  id v101 = *((id *)v5 + 63);
  uint64_t v102 = [v101 countByEnumeratingWithState:&v592 objects:v726 count:16];
  if (v102)
  {
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v593;
    do
    {
      for (uint64_t i10 = 0; i10 != v103; ++i10)
      {
        if (*(void *)v593 != v104) {
          objc_enumerationMutation(v101);
        }
        [(VCPProtoAssetAnalysis *)self addMovieObstructionResults:*(void *)(*((void *)&v592 + 1) + 8 * i10)];
      }
      uint64_t v103 = [v101 countByEnumeratingWithState:&v592 objects:v726 count:16];
    }
    while (v103);
  }

  long long v591 = 0u;
  long long v590 = 0u;
  long long v589 = 0u;
  long long v588 = 0u;
  id v106 = *((id *)v5 + 64);
  uint64_t v107 = [v106 countByEnumeratingWithState:&v588 objects:v725 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v109 = *(void *)v589;
    do
    {
      for (uint64_t i11 = 0; i11 != v108; ++i11)
      {
        if (*(void *)v589 != v109) {
          objc_enumerationMutation(v106);
        }
        [(VCPProtoAssetAnalysis *)self addMovieOrientationResults:*(void *)(*((void *)&v588 + 1) + 8 * i11)];
      }
      uint64_t v108 = [v106 countByEnumeratingWithState:&v588 objects:v725 count:16];
    }
    while (v108);
  }

  long long v587 = 0u;
  long long v586 = 0u;
  long long v585 = 0u;
  long long v584 = 0u;
  id v111 = *((id *)v5 + 67);
  uint64_t v112 = [v111 countByEnumeratingWithState:&v584 objects:v724 count:16];
  if (v112)
  {
    uint64_t v113 = v112;
    uint64_t v114 = *(void *)v585;
    do
    {
      for (uint64_t i12 = 0; i12 != v113; ++i12)
      {
        if (*(void *)v585 != v114) {
          objc_enumerationMutation(v111);
        }
        [(VCPProtoAssetAnalysis *)self addMoviePreEncodeResults:*(void *)(*((void *)&v584 + 1) + 8 * i12)];
      }
      uint64_t v113 = [v111 countByEnumeratingWithState:&v584 objects:v724 count:16];
    }
    while (v113);
  }

  long long v583 = 0u;
  long long v582 = 0u;
  long long v581 = 0u;
  long long v580 = 0u;
  id v116 = *((id *)v5 + 68);
  uint64_t v117 = [v116 countByEnumeratingWithState:&v580 objects:v723 count:16];
  if (v117)
  {
    uint64_t v118 = v117;
    uint64_t v119 = *(void *)v581;
    do
    {
      for (uint64_t i13 = 0; i13 != v118; ++i13)
      {
        if (*(void *)v581 != v119) {
          objc_enumerationMutation(v116);
        }
        [(VCPProtoAssetAnalysis *)self addMovieQualityResults:*(void *)(*((void *)&v580 + 1) + 8 * i13)];
      }
      uint64_t v118 = [v116 countByEnumeratingWithState:&v580 objects:v723 count:16];
    }
    while (v118);
  }

  long long v579 = 0u;
  long long v578 = 0u;
  long long v577 = 0u;
  long long v576 = 0u;
  id v121 = *((id *)v5 + 70);
  uint64_t v122 = [v121 countByEnumeratingWithState:&v576 objects:v722 count:16];
  if (v122)
  {
    uint64_t v123 = v122;
    uint64_t v124 = *(void *)v577;
    do
    {
      for (uint64_t i14 = 0; i14 != v123; ++i14)
      {
        if (*(void *)v577 != v124) {
          objc_enumerationMutation(v121);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSaliencyResults:*(void *)(*((void *)&v576 + 1) + 8 * i14)];
      }
      uint64_t v123 = [v121 countByEnumeratingWithState:&v576 objects:v722 count:16];
    }
    while (v123);
  }

  long long v575 = 0u;
  long long v574 = 0u;
  long long v573 = 0u;
  long long v572 = 0u;
  id v126 = *((id *)v5 + 71);
  uint64_t v127 = [v126 countByEnumeratingWithState:&v572 objects:v721 count:16];
  if (v127)
  {
    uint64_t v128 = v127;
    uint64_t v129 = *(void *)v573;
    do
    {
      for (uint64_t i15 = 0; i15 != v128; ++i15)
      {
        if (*(void *)v573 != v129) {
          objc_enumerationMutation(v126);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSceneResults:*(void *)(*((void *)&v572 + 1) + 8 * i15)];
      }
      uint64_t v128 = [v126 countByEnumeratingWithState:&v572 objects:v721 count:16];
    }
    while (v128);
  }

  long long v571 = 0u;
  long long v570 = 0u;
  long long v569 = 0u;
  long long v568 = 0u;
  id v131 = *((id *)v5 + 74);
  uint64_t v132 = [v131 countByEnumeratingWithState:&v568 objects:v720 count:16];
  if (v132)
  {
    uint64_t v133 = v132;
    uint64_t v134 = *(void *)v569;
    do
    {
      for (uint64_t i16 = 0; i16 != v133; ++i16)
      {
        if (*(void *)v569 != v134) {
          objc_enumerationMutation(v131);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSubjectMotionResults:*(void *)(*((void *)&v568 + 1) + 8 * i16)];
      }
      uint64_t v133 = [v131 countByEnumeratingWithState:&v568 objects:v720 count:16];
    }
    while (v133);
  }

  long long v567 = 0u;
  long long v566 = 0u;
  long long v565 = 0u;
  long long v564 = 0u;
  id v136 = *((id *)v5 + 78);
  uint64_t v137 = [v136 countByEnumeratingWithState:&v564 objects:v719 count:16];
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v565;
    do
    {
      for (uint64_t i17 = 0; i17 != v138; ++i17)
      {
        if (*(void *)v565 != v139) {
          objc_enumerationMutation(v136);
        }
        [(VCPProtoAssetAnalysis *)self addMovieUtteranceResults:*(void *)(*((void *)&v564 + 1) + 8 * i17)];
      }
      uint64_t v138 = [v136 countByEnumeratingWithState:&v564 objects:v719 count:16];
    }
    while (v138);
  }

  long long v563 = 0u;
  long long v562 = 0u;
  long long v561 = 0u;
  long long v560 = 0u;
  id v141 = *((id *)v5 + 79);
  uint64_t v142 = [v141 countByEnumeratingWithState:&v560 objects:v718 count:16];
  if (v142)
  {
    uint64_t v143 = v142;
    uint64_t v144 = *(void *)v561;
    do
    {
      for (uint64_t i18 = 0; i18 != v143; ++i18)
      {
        if (*(void *)v561 != v144) {
          objc_enumerationMutation(v141);
        }
        [(VCPProtoAssetAnalysis *)self addMovieVoiceResults:*(void *)(*((void *)&v560 + 1) + 8 * i18)];
      }
      uint64_t v143 = [v141 countByEnumeratingWithState:&v560 objects:v718 count:16];
    }
    while (v143);
  }

  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  long long v556 = 0u;
  id v146 = *((id *)v5 + 31);
  uint64_t v147 = [v146 countByEnumeratingWithState:&v556 objects:v717 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v557;
    do
    {
      for (uint64_t i19 = 0; i19 != v148; ++i19)
      {
        if (*(void *)v557 != v149) {
          objc_enumerationMutation(v146);
        }
        [(VCPProtoAssetAnalysis *)self addImagePetsResults:*(void *)(*((void *)&v556 + 1) + 8 * i19)];
      }
      uint64_t v148 = [v146 countByEnumeratingWithState:&v556 objects:v717 count:16];
    }
    while (v148);
  }

  long long v555 = 0u;
  long long v554 = 0u;
  long long v553 = 0u;
  long long v552 = 0u;
  id v151 = *((id *)v5 + 76);
  uint64_t v152 = [v151 countByEnumeratingWithState:&v552 objects:v716 count:16];
  if (v152)
  {
    uint64_t v153 = v152;
    uint64_t v154 = *(void *)v553;
    do
    {
      for (uint64_t i20 = 0; i20 != v153; ++i20)
      {
        if (*(void *)v553 != v154) {
          objc_enumerationMutation(v151);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSummaryResults:*(void *)(*((void *)&v552 + 1) + 8 * i20)];
      }
      uint64_t v153 = [v151 countByEnumeratingWithState:&v552 objects:v716 count:16];
    }
    while (v153);
  }

  long long v551 = 0u;
  long long v550 = 0u;
  long long v549 = 0u;
  long long v548 = 0u;
  id v156 = *((id *)v5 + 53);
  uint64_t v157 = [v156 countByEnumeratingWithState:&v548 objects:v715 count:16];
  if (v157)
  {
    uint64_t v158 = v157;
    uint64_t v159 = *(void *)v549;
    do
    {
      for (uint64_t i21 = 0; i21 != v158; ++i21)
      {
        if (*(void *)v549 != v159) {
          objc_enumerationMutation(v156);
        }
        [(VCPProtoAssetAnalysis *)self addMovieHighlightResults:*(void *)(*((void *)&v548 + 1) + 8 * i21)];
      }
      uint64_t v158 = [v156 countByEnumeratingWithState:&v548 objects:v715 count:16];
    }
    while (v158);
  }

  long long v547 = 0u;
  long long v546 = 0u;
  long long v545 = 0u;
  long long v544 = 0u;
  id v161 = *((id *)v5 + 25);
  uint64_t v162 = [v161 countByEnumeratingWithState:&v544 objects:v714 count:16];
  if (v162)
  {
    uint64_t v163 = v162;
    uint64_t v164 = *(void *)v545;
    do
    {
      for (uint64_t i22 = 0; i22 != v163; ++i22)
      {
        if (*(void *)v545 != v164) {
          objc_enumerationMutation(v161);
        }
        [(VCPProtoAssetAnalysis *)self addImageExposureResults:*(void *)(*((void *)&v544 + 1) + 8 * i22)];
      }
      uint64_t v163 = [v161 countByEnumeratingWithState:&v544 objects:v714 count:16];
    }
    while (v163);
  }

  long long v543 = 0u;
  long long v542 = 0u;
  long long v541 = 0u;
  long long v540 = 0u;
  id v166 = *((id *)v5 + 35);
  uint64_t v167 = [v166 countByEnumeratingWithState:&v540 objects:v713 count:16];
  if (v167)
  {
    uint64_t v168 = v167;
    uint64_t v169 = *(void *)v541;
    do
    {
      for (uint64_t i23 = 0; i23 != v168; ++i23)
      {
        if (*(void *)v541 != v169) {
          objc_enumerationMutation(v166);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoEffectsResults:*(void *)(*((void *)&v540 + 1) + 8 * i23)];
      }
      uint64_t v168 = [v166 countByEnumeratingWithState:&v540 objects:v713 count:16];
    }
    while (v168);
  }

  if ((*((unsigned char *)v5 + 688) & 2) != 0)
  {
    self->_statsFlags = *((void *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v539 = 0u;
  long long v538 = 0u;
  long long v537 = 0u;
  long long v536 = 0u;
  id v171 = *((id *)v5 + 30);
  uint64_t v172 = [v171 countByEnumeratingWithState:&v536 objects:v712 count:16];
  if (v172)
  {
    uint64_t v173 = v172;
    uint64_t v174 = *(void *)v537;
    do
    {
      for (uint64_t i24 = 0; i24 != v173; ++i24)
      {
        if (*(void *)v537 != v174) {
          objc_enumerationMutation(v171);
        }
        [(VCPProtoAssetAnalysis *)self addImagePetsFaceResults:*(void *)(*((void *)&v536 + 1) + 8 * i24)];
      }
      uint64_t v173 = [v171 countByEnumeratingWithState:&v536 objects:v712 count:16];
    }
    while (v173);
  }

  long long v535 = 0u;
  long long v534 = 0u;
  long long v533 = 0u;
  long long v532 = 0u;
  id v176 = *((id *)v5 + 33);
  uint64_t v177 = [v176 countByEnumeratingWithState:&v532 objects:v711 count:16];
  if (v177)
  {
    uint64_t v178 = v177;
    uint64_t v179 = *(void *)v533;
    do
    {
      for (uint64_t i25 = 0; i25 != v178; ++i25)
      {
        if (*(void *)v533 != v179) {
          objc_enumerationMutation(v176);
        }
        [(VCPProtoAssetAnalysis *)self addImageSceneprintResults:*(void *)(*((void *)&v532 + 1) + 8 * i25)];
      }
      uint64_t v178 = [v176 countByEnumeratingWithState:&v532 objects:v711 count:16];
    }
    while (v178);
  }

  long long v531 = 0u;
  long long v530 = 0u;
  long long v529 = 0u;
  long long v528 = 0u;
  id v181 = *((id *)v5 + 72);
  uint64_t v182 = [v181 countByEnumeratingWithState:&v528 objects:v710 count:16];
  if (v182)
  {
    uint64_t v183 = v182;
    uint64_t v184 = *(void *)v529;
    do
    {
      for (uint64_t i26 = 0; i26 != v183; ++i26)
      {
        if (*(void *)v529 != v184) {
          objc_enumerationMutation(v181);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSceneprintResults:*(void *)(*((void *)&v528 + 1) + 8 * i26)];
      }
      uint64_t v183 = [v181 countByEnumeratingWithState:&v528 objects:v710 count:16];
    }
    while (v183);
  }

  long long v527 = 0u;
  long long v526 = 0u;
  long long v525 = 0u;
  long long v524 = 0u;
  id v186 = *((id *)v5 + 28);
  uint64_t v187 = [v186 countByEnumeratingWithState:&v524 objects:v709 count:16];
  if (v187)
  {
    uint64_t v188 = v187;
    uint64_t v189 = *(void *)v525;
    do
    {
      for (uint64_t i27 = 0; i27 != v188; ++i27)
      {
        if (*(void *)v525 != v189) {
          objc_enumerationMutation(v186);
        }
        [(VCPProtoAssetAnalysis *)self addImageHumanPoseResults:*(void *)(*((void *)&v524 + 1) + 8 * i27)];
      }
      uint64_t v188 = [v186 countByEnumeratingWithState:&v524 objects:v709 count:16];
    }
    while (v188);
  }

  long long v523 = 0u;
  long long v522 = 0u;
  long long v521 = 0u;
  long long v520 = 0u;
  id v191 = *((id *)v5 + 57);
  uint64_t v192 = [v191 countByEnumeratingWithState:&v520 objects:v708 count:16];
  if (v192)
  {
    uint64_t v193 = v192;
    uint64_t v194 = *(void *)v521;
    do
    {
      for (uint64_t i28 = 0; i28 != v193; ++i28)
      {
        if (*(void *)v521 != v194) {
          objc_enumerationMutation(v191);
        }
        [(VCPProtoAssetAnalysis *)self addMovieHumanPoseResults:*(void *)(*((void *)&v520 + 1) + 8 * i28)];
      }
      uint64_t v193 = [v191 countByEnumeratingWithState:&v520 objects:v708 count:16];
    }
    while (v193);
  }

  long long v519 = 0u;
  long long v518 = 0u;
  long long v517 = 0u;
  long long v516 = 0u;
  id v196 = *((id *)v5 + 43);
  uint64_t v197 = [v196 countByEnumeratingWithState:&v516 objects:v707 count:16];
  if (v197)
  {
    uint64_t v198 = v197;
    uint64_t v199 = *(void *)v517;
    do
    {
      for (uint64_t i29 = 0; i29 != v198; ++i29)
      {
        if (*(void *)v517 != v199) {
          objc_enumerationMutation(v196);
        }
        [(VCPProtoAssetAnalysis *)self addMovieApplauseResults:*(void *)(*((void *)&v516 + 1) + 8 * i29)];
      }
      uint64_t v198 = [v196 countByEnumeratingWithState:&v516 objects:v707 count:16];
    }
    while (v198);
  }

  long long v515 = 0u;
  long long v514 = 0u;
  long long v513 = 0u;
  long long v512 = 0u;
  id v201 = *((id *)v5 + 45);
  uint64_t v202 = [v201 countByEnumeratingWithState:&v512 objects:v706 count:16];
  if (v202)
  {
    uint64_t v203 = v202;
    uint64_t v204 = *(void *)v513;
    do
    {
      for (uint64_t i30 = 0; i30 != v203; ++i30)
      {
        if (*(void *)v513 != v204) {
          objc_enumerationMutation(v201);
        }
        [(VCPProtoAssetAnalysis *)self addMovieBabbleResults:*(void *)(*((void *)&v512 + 1) + 8 * i30)];
      }
      uint64_t v203 = [v201 countByEnumeratingWithState:&v512 objects:v706 count:16];
    }
    while (v203);
  }

  long long v511 = 0u;
  long long v510 = 0u;
  long long v509 = 0u;
  long long v508 = 0u;
  id v206 = *((id *)v5 + 47);
  uint64_t v207 = [v206 countByEnumeratingWithState:&v508 objects:v705 count:16];
  if (v207)
  {
    uint64_t v208 = v207;
    uint64_t v209 = *(void *)v509;
    do
    {
      for (uint64_t i31 = 0; i31 != v208; ++i31)
      {
        if (*(void *)v509 != v209) {
          objc_enumerationMutation(v206);
        }
        [(VCPProtoAssetAnalysis *)self addMovieCheeringResults:*(void *)(*((void *)&v508 + 1) + 8 * i31)];
      }
      uint64_t v208 = [v206 countByEnumeratingWithState:&v508 objects:v705 count:16];
    }
    while (v208);
  }

  long long v507 = 0u;
  long long v506 = 0u;
  long long v505 = 0u;
  long long v504 = 0u;
  id v211 = *((id *)v5 + 59);
  uint64_t v212 = [v211 countByEnumeratingWithState:&v504 objects:v704 count:16];
  if (v212)
  {
    uint64_t v213 = v212;
    uint64_t v214 = *(void *)v505;
    do
    {
      for (uint64_t i32 = 0; i32 != v213; ++i32)
      {
        if (*(void *)v505 != v214) {
          objc_enumerationMutation(v211);
        }
        [(VCPProtoAssetAnalysis *)self addMovieLaughterResults:*(void *)(*((void *)&v504 + 1) + 8 * i32)];
      }
      uint64_t v213 = [v211 countByEnumeratingWithState:&v504 objects:v704 count:16];
    }
    while (v213);
  }

  long long v503 = 0u;
  long long v502 = 0u;
  long long v501 = 0u;
  long long v500 = 0u;
  id v216 = *((id *)v5 + 37);
  uint64_t v217 = [v216 countByEnumeratingWithState:&v500 objects:v703 count:16];
  if (v217)
  {
    uint64_t v218 = v217;
    uint64_t v219 = *(void *)v501;
    do
    {
      for (uint64_t i33 = 0; i33 != v218; ++i33)
      {
        if (*(void *)v501 != v219) {
          objc_enumerationMutation(v216);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoKeyFrameResults:*(void *)(*((void *)&v500 + 1) + 8 * i33)];
      }
      uint64_t v218 = [v216 countByEnumeratingWithState:&v500 objects:v703 count:16];
    }
    while (v218);
  }

  long long v499 = 0u;
  long long v498 = 0u;
  long long v497 = 0u;
  long long v496 = 0u;
  id v221 = *((id *)v5 + 38);
  uint64_t v222 = [v221 countByEnumeratingWithState:&v496 objects:v702 count:16];
  if (v222)
  {
    uint64_t v223 = v222;
    uint64_t v224 = *(void *)v497;
    do
    {
      for (uint64_t i34 = 0; i34 != v223; ++i34)
      {
        if (*(void *)v497 != v224) {
          objc_enumerationMutation(v221);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoKeyFrameStillResults:*(void *)(*((void *)&v496 + 1) + 8 * i34)];
      }
      uint64_t v223 = [v221 countByEnumeratingWithState:&v496 objects:v702 count:16];
    }
    while (v223);
  }

  long long v495 = 0u;
  long long v494 = 0u;
  long long v493 = 0u;
  long long v492 = 0u;
  id v226 = *((id *)v5 + 56);
  uint64_t v227 = [v226 countByEnumeratingWithState:&v492 objects:v701 count:16];
  if (v227)
  {
    uint64_t v228 = v227;
    uint64_t v229 = *(void *)v493;
    do
    {
      for (uint64_t i35 = 0; i35 != v228; ++i35)
      {
        if (*(void *)v493 != v229) {
          objc_enumerationMutation(v226);
        }
        [(VCPProtoAssetAnalysis *)self addMovieHumanActionResults:*(void *)(*((void *)&v492 + 1) + 8 * i35)];
      }
      uint64_t v228 = [v226 countByEnumeratingWithState:&v492 objects:v701 count:16];
    }
    while (v228);
  }

  long long v491 = 0u;
  long long v490 = 0u;
  long long v489 = 0u;
  long long v488 = 0u;
  id v231 = *((id *)v5 + 75);
  uint64_t v232 = [v231 countByEnumeratingWithState:&v488 objects:v700 count:16];
  if (v232)
  {
    uint64_t v233 = v232;
    uint64_t v234 = *(void *)v489;
    do
    {
      for (uint64_t i36 = 0; i36 != v233; ++i36)
      {
        if (*(void *)v489 != v234) {
          objc_enumerationMutation(v231);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSubtleMotionResults:*(void *)(*((void *)&v488 + 1) + 8 * i36)];
      }
      uint64_t v233 = [v231 countByEnumeratingWithState:&v488 objects:v700 count:16];
    }
    while (v233);
  }

  long long v487 = 0u;
  long long v486 = 0u;
  long long v485 = 0u;
  long long v484 = 0u;
  id v236 = *((id *)v5 + 60);
  uint64_t v237 = [v236 countByEnumeratingWithState:&v484 objects:v699 count:16];
  if (v237)
  {
    uint64_t v238 = v237;
    uint64_t v239 = *(void *)v485;
    do
    {
      for (uint64_t i37 = 0; i37 != v238; ++i37)
      {
        if (*(void *)v485 != v239) {
          objc_enumerationMutation(v236);
        }
        [(VCPProtoAssetAnalysis *)self addMovieLoudnessResults:*(void *)(*((void *)&v484 + 1) + 8 * i37)];
      }
      uint64_t v238 = [v236 countByEnumeratingWithState:&v484 objects:v699 count:16];
    }
    while (v238);
  }

  long long v483 = 0u;
  long long v482 = 0u;
  long long v481 = 0u;
  long long v480 = 0u;
  id v241 = *((id *)v5 + 66);
  uint64_t v242 = [v241 countByEnumeratingWithState:&v480 objects:v698 count:16];
  if (v242)
  {
    uint64_t v243 = v242;
    uint64_t v244 = *(void *)v481;
    do
    {
      for (uint64_t i38 = 0; i38 != v243; ++i38)
      {
        if (*(void *)v481 != v244) {
          objc_enumerationMutation(v241);
        }
        [(VCPProtoAssetAnalysis *)self addMoviePetsResults:*(void *)(*((void *)&v480 + 1) + 8 * i38)];
      }
      uint64_t v243 = [v241 countByEnumeratingWithState:&v480 objects:v698 count:16];
    }
    while (v243);
  }

  long long v479 = 0u;
  long long v478 = 0u;
  long long v477 = 0u;
  long long v476 = 0u;
  id v246 = *((id *)v5 + 65);
  uint64_t v247 = [v246 countByEnumeratingWithState:&v476 objects:v697 count:16];
  if (v247)
  {
    uint64_t v248 = v247;
    uint64_t v249 = *(void *)v477;
    do
    {
      for (uint64_t i39 = 0; i39 != v248; ++i39)
      {
        if (*(void *)v477 != v249) {
          objc_enumerationMutation(v246);
        }
        [(VCPProtoAssetAnalysis *)self addMoviePetsFaceResults:*(void *)(*((void *)&v476 + 1) + 8 * i39)];
      }
      uint64_t v248 = [v246 countByEnumeratingWithState:&v476 objects:v697 count:16];
    }
    while (v248);
  }

  long long v475 = 0u;
  long long v474 = 0u;
  long long v473 = 0u;
  long long v472 = 0u;
  id v251 = *((id *)v5 + 73);
  uint64_t v252 = [v251 countByEnumeratingWithState:&v472 objects:v696 count:16];
  if (v252)
  {
    uint64_t v253 = v252;
    uint64_t v254 = *(void *)v473;
    do
    {
      for (uint64_t i40 = 0; i40 != v253; ++i40)
      {
        if (*(void *)v473 != v254) {
          objc_enumerationMutation(v251);
        }
        [(VCPProtoAssetAnalysis *)self addMovieStabilizationResults:*(void *)(*((void *)&v472 + 1) + 8 * i40)];
      }
      uint64_t v253 = [v251 countByEnumeratingWithState:&v472 objects:v696 count:16];
    }
    while (v253);
  }

  if ((*((unsigned char *)v5 + 688) & 4) != 0)
  {
    self->_typesWide = *((void *)v5 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v471 = 0u;
  long long v470 = 0u;
  long long v469 = 0u;
  long long v468 = 0u;
  id v256 = *((id *)v5 + 54);
  uint64_t v257 = [v256 countByEnumeratingWithState:&v468 objects:v695 count:16];
  if (v257)
  {
    uint64_t v258 = v257;
    uint64_t v259 = *(void *)v469;
    do
    {
      for (uint64_t i41 = 0; i41 != v258; ++i41)
      {
        if (*(void *)v469 != v259) {
          objc_enumerationMutation(v256);
        }
        [(VCPProtoAssetAnalysis *)self addMovieHighlightScoreResults:*(void *)(*((void *)&v468 + 1) + 8 * i41)];
      }
      uint64_t v258 = [v256 countByEnumeratingWithState:&v468 objects:v695 count:16];
    }
    while (v258);
  }

  long long v467 = 0u;
  long long v466 = 0u;
  long long v465 = 0u;
  long long v464 = 0u;
  id v261 = *((id *)v5 + 36);
  uint64_t v262 = [v261 countByEnumeratingWithState:&v464 objects:v694 count:16];
  if (v262)
  {
    uint64_t v263 = v262;
    uint64_t v264 = *(void *)v465;
    do
    {
      for (uint64_t i42 = 0; i42 != v263; ++i42)
      {
        if (*(void *)v465 != v264) {
          objc_enumerationMutation(v261);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoHumanActionClassificationResults:*(void *)(*((void *)&v464 + 1) + 8 * i42)];
      }
      uint64_t v263 = [v261 countByEnumeratingWithState:&v464 objects:v694 count:16];
    }
    while (v263);
  }

  long long v463 = 0u;
  long long v462 = 0u;
  long long v461 = 0u;
  long long v460 = 0u;
  id v266 = *((id *)v5 + 44);
  uint64_t v267 = [v266 countByEnumeratingWithState:&v460 objects:v693 count:16];
  if (v267)
  {
    uint64_t v268 = v267;
    uint64_t v269 = *(void *)v461;
    do
    {
      for (uint64_t i43 = 0; i43 != v268; ++i43)
      {
        if (*(void *)v461 != v269) {
          objc_enumerationMutation(v266);
        }
        [(VCPProtoAssetAnalysis *)self addMovieAudioQualityResults:*(void *)(*((void *)&v460 + 1) + 8 * i43)];
      }
      uint64_t v268 = [v266 countByEnumeratingWithState:&v460 objects:v693 count:16];
    }
    while (v268);
  }

  long long v459 = 0u;
  long long v458 = 0u;
  long long v457 = 0u;
  long long v456 = 0u;
  id v271 = *((id *)v5 + 69);
  uint64_t v272 = [v271 countByEnumeratingWithState:&v456 objects:v692 count:16];
  if (v272)
  {
    uint64_t v273 = v272;
    uint64_t v274 = *(void *)v457;
    do
    {
      for (uint64_t i44 = 0; i44 != v273; ++i44)
      {
        if (*(void *)v457 != v274) {
          objc_enumerationMutation(v271);
        }
        [(VCPProtoAssetAnalysis *)self addMovieSafetyResults:*(void *)(*((void *)&v456 + 1) + 8 * i44)];
      }
      uint64_t v273 = [v271 countByEnumeratingWithState:&v456 objects:v692 count:16];
    }
    while (v273);
  }

  long long v455 = 0u;
  long long v454 = 0u;
  long long v453 = 0u;
  long long v452 = 0u;
  id v276 = *((id *)v5 + 15);
  uint64_t v277 = [v276 countByEnumeratingWithState:&v452 objects:v691 count:16];
  if (v277)
  {
    uint64_t v278 = v277;
    uint64_t v279 = *(void *)v453;
    do
    {
      for (uint64_t i45 = 0; i45 != v278; ++i45)
      {
        if (*(void *)v453 != v279) {
          objc_enumerationMutation(v276);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieClassificationResults:*(void *)(*((void *)&v452 + 1) + 8 * i45)];
      }
      uint64_t v278 = [v276 countByEnumeratingWithState:&v452 objects:v691 count:16];
    }
    while (v278);
  }

  long long v451 = 0u;
  long long v450 = 0u;
  long long v449 = 0u;
  long long v448 = 0u;
  id v281 = *((id *)v5 + 16);
  uint64_t v282 = [v281 countByEnumeratingWithState:&v448 objects:v690 count:16];
  if (v282)
  {
    uint64_t v283 = v282;
    uint64_t v284 = *(void *)v449;
    do
    {
      for (uint64_t i46 = 0; i46 != v283; ++i46)
      {
        if (*(void *)v449 != v284) {
          objc_enumerationMutation(v281);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieHumanActionClassificationResults:*(void *)(*((void *)&v448 + 1) + 8 * i46)];
      }
      uint64_t v283 = [v281 countByEnumeratingWithState:&v448 objects:v690 count:16];
    }
    while (v283);
  }

  long long v447 = 0u;
  long long v446 = 0u;
  long long v445 = 0u;
  long long v444 = 0u;
  id v286 = *((id *)v5 + 12);
  uint64_t v287 = [v286 countByEnumeratingWithState:&v444 objects:v689 count:16];
  if (v287)
  {
    uint64_t v288 = v287;
    uint64_t v289 = *(void *)v445;
    do
    {
      for (uint64_t i47 = 0; i47 != v288; ++i47)
      {
        if (*(void *)v445 != v289) {
          objc_enumerationMutation(v286);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieApplauseResults:*(void *)(*((void *)&v444 + 1) + 8 * i47)];
      }
      uint64_t v288 = [v286 countByEnumeratingWithState:&v444 objects:v689 count:16];
    }
    while (v288);
  }

  long long v443 = 0u;
  long long v442 = 0u;
  long long v441 = 0u;
  long long v440 = 0u;
  id v291 = *((id *)v5 + 13);
  uint64_t v292 = [v291 countByEnumeratingWithState:&v440 objects:v688 count:16];
  if (v292)
  {
    uint64_t v293 = v292;
    uint64_t v294 = *(void *)v441;
    do
    {
      for (uint64_t i48 = 0; i48 != v293; ++i48)
      {
        if (*(void *)v441 != v294) {
          objc_enumerationMutation(v291);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieBabbleResults:*(void *)(*((void *)&v440 + 1) + 8 * i48)];
      }
      uint64_t v293 = [v291 countByEnumeratingWithState:&v440 objects:v688 count:16];
    }
    while (v293);
  }

  long long v438 = 0u;
  long long v439 = 0u;
  long long v436 = 0u;
  long long v437 = 0u;
  id v296 = *((id *)v5 + 14);
  uint64_t v297 = [v296 countByEnumeratingWithState:&v436 objects:v687 count:16];
  if (v297)
  {
    uint64_t v298 = v297;
    uint64_t v299 = *(void *)v437;
    do
    {
      for (uint64_t i49 = 0; i49 != v298; ++i49)
      {
        if (*(void *)v437 != v299) {
          objc_enumerationMutation(v296);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieCheeringResults:*(void *)(*((void *)&v436 + 1) + 8 * i49)];
      }
      uint64_t v298 = [v296 countByEnumeratingWithState:&v436 objects:v687 count:16];
    }
    while (v298);
  }

  long long v434 = 0u;
  long long v435 = 0u;
  long long v432 = 0u;
  long long v433 = 0u;
  id v301 = *((id *)v5 + 17);
  uint64_t v302 = [v301 countByEnumeratingWithState:&v432 objects:v686 count:16];
  if (v302)
  {
    uint64_t v303 = v302;
    uint64_t v304 = *(void *)v433;
    do
    {
      for (uint64_t i50 = 0; i50 != v303; ++i50)
      {
        if (*(void *)v433 != v304) {
          objc_enumerationMutation(v301);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieLaughterResults:*(void *)(*((void *)&v432 + 1) + 8 * i50)];
      }
      uint64_t v303 = [v301 countByEnumeratingWithState:&v432 objects:v686 count:16];
    }
    while (v303);
  }

  long long v430 = 0u;
  long long v431 = 0u;
  long long v428 = 0u;
  long long v429 = 0u;
  id v306 = *((id *)v5 + 18);
  uint64_t v307 = [v306 countByEnumeratingWithState:&v428 objects:v685 count:16];
  if (v307)
  {
    uint64_t v308 = v307;
    uint64_t v309 = *(void *)v429;
    do
    {
      for (uint64_t i51 = 0; i51 != v308; ++i51)
      {
        if (*(void *)v429 != v309) {
          objc_enumerationMutation(v306);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieMusicResults:*(void *)(*((void *)&v428 + 1) + 8 * i51)];
      }
      uint64_t v308 = [v306 countByEnumeratingWithState:&v428 objects:v685 count:16];
    }
    while (v308);
  }

  long long v426 = 0u;
  long long v427 = 0u;
  long long v424 = 0u;
  long long v425 = 0u;
  id v311 = *((id *)v5 + 19);
  uint64_t v312 = [v311 countByEnumeratingWithState:&v424 objects:v684 count:16];
  if (v312)
  {
    uint64_t v313 = v312;
    uint64_t v314 = *(void *)v425;
    do
    {
      for (uint64_t i52 = 0; i52 != v313; ++i52)
      {
        if (*(void *)v425 != v314) {
          objc_enumerationMutation(v311);
        }
        [(VCPProtoAssetAnalysis *)self addFilesystemMovieVoiceResults:*(void *)(*((void *)&v424 + 1) + 8 * i52)];
      }
      uint64_t v313 = [v311 countByEnumeratingWithState:&v424 objects:v684 count:16];
    }
    while (v313);
  }

  long long v422 = 0u;
  long long v423 = 0u;
  long long v420 = 0u;
  long long v421 = 0u;
  id v316 = *((id *)v5 + 6);
  uint64_t v317 = [v316 countByEnumeratingWithState:&v420 objects:v683 count:16];
  if (v317)
  {
    uint64_t v318 = v317;
    uint64_t v319 = *(void *)v421;
    do
    {
      for (uint64_t i53 = 0; i53 != v318; ++i53)
      {
        if (*(void *)v421 != v319) {
          objc_enumerationMutation(v316);
        }
        [(VCPProtoAssetAnalysis *)self addAnimatedStickerResults:*(void *)(*((void *)&v420 + 1) + 8 * i53)];
      }
      uint64_t v318 = [v316 countByEnumeratingWithState:&v420 objects:v683 count:16];
    }
    while (v318);
  }

  long long v418 = 0u;
  long long v419 = 0u;
  long long v416 = 0u;
  long long v417 = 0u;
  id v321 = *((id *)v5 + 40);
  uint64_t v322 = [v321 countByEnumeratingWithState:&v416 objects:v682 count:16];
  if (v322)
  {
    uint64_t v323 = v322;
    uint64_t v324 = *(void *)v417;
    do
    {
      for (uint64_t i54 = 0; i54 != v323; ++i54)
      {
        if (*(void *)v417 != v324) {
          objc_enumerationMutation(v321);
        }
        [(VCPProtoAssetAnalysis *)self addLivePhotoSettlingEffectGatingResults:*(void *)(*((void *)&v416 + 1) + 8 * i54)];
      }
      uint64_t v323 = [v321 countByEnumeratingWithState:&v416 objects:v682 count:16];
    }
    while (v323);
  }

  if (*((void *)v5 + 8)) {
    -[VCPProtoAssetAnalysis setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  }
  long long v414 = 0u;
  long long v415 = 0u;
  long long v412 = 0u;
  long long v413 = 0u;
  id v326 = *((id *)v5 + 77);
  uint64_t v327 = [v326 countByEnumeratingWithState:&v412 objects:v681 count:16];
  if (v327)
  {
    uint64_t v328 = v327;
    uint64_t v329 = *(void *)v413;
    do
    {
      for (uint64_t i55 = 0; i55 != v328; ++i55)
      {
        if (*(void *)v413 != v329) {
          objc_enumerationMutation(v326);
        }
        [(VCPProtoAssetAnalysis *)self addMovieTorsoResults:*(void *)(*((void *)&v412 + 1) + 8 * i55)];
      }
      uint64_t v328 = [v326 countByEnumeratingWithState:&v412 objects:v681 count:16];
    }
    while (v328);
  }

  long long v410 = 0u;
  long long v411 = 0u;
  long long v408 = 0u;
  long long v409 = 0u;
  id v331 = *((id *)v5 + 55);
  uint64_t v332 = [v331 countByEnumeratingWithState:&v408 objects:v680 count:16];
  if (v332)
  {
    uint64_t v333 = v332;
    uint64_t v334 = *(void *)v409;
    do
    {
      for (uint64_t i56 = 0; i56 != v333; ++i56)
      {
        if (*(void *)v409 != v334) {
          objc_enumerationMutation(v331);
        }
        [(VCPProtoAssetAnalysis *)self addMovieHumanActionClassificationResults:*(void *)(*((void *)&v408 + 1) + 8 * i56)];
      }
      uint64_t v333 = [v331 countByEnumeratingWithState:&v408 objects:v680 count:16];
    }
    while (v333);
  }

  long long v406 = 0u;
  long long v407 = 0u;
  long long v404 = 0u;
  long long v405 = 0u;
  id v336 = *((id *)v5 + 84);
  uint64_t v337 = [v336 countByEnumeratingWithState:&v404 objects:v679 count:16];
  if (v337)
  {
    uint64_t v338 = v337;
    uint64_t v339 = *(void *)v405;
    do
    {
      for (uint64_t i57 = 0; i57 != v338; ++i57)
      {
        if (*(void *)v405 != v339) {
          objc_enumerationMutation(v336);
        }
        [(VCPProtoAssetAnalysis *)self addVideoEmbeddingResults:*(void *)(*((void *)&v404 + 1) + 8 * i57)];
      }
      uint64_t v338 = [v336 countByEnumeratingWithState:&v404 objects:v679 count:16];
    }
    while (v338);
  }

  long long v402 = 0u;
  long long v403 = 0u;
  long long v400 = 0u;
  long long v401 = 0u;
  id v341 = *((id *)v5 + 80);
  uint64_t v342 = [v341 countByEnumeratingWithState:&v400 objects:v678 count:16];
  if (v342)
  {
    uint64_t v343 = v342;
    uint64_t v344 = *(void *)v401;
    do
    {
      for (uint64_t i58 = 0; i58 != v343; ++i58)
      {
        if (*(void *)v401 != v344) {
          objc_enumerationMutation(v341);
        }
        [(VCPProtoAssetAnalysis *)self addSummarizedEmbeddingResults:*(void *)(*((void *)&v400 + 1) + 8 * i58)];
      }
      uint64_t v343 = [v341 countByEnumeratingWithState:&v400 objects:v678 count:16];
    }
    while (v343);
  }

  long long v398 = 0u;
  long long v399 = 0u;
  long long v396 = 0u;
  long long v397 = 0u;
  id v346 = *((id *)v5 + 11);
  uint64_t v347 = [v346 countByEnumeratingWithState:&v396 objects:v677 count:16];
  if (v347)
  {
    uint64_t v348 = v347;
    uint64_t v349 = *(void *)v397;
    do
    {
      for (uint64_t i59 = 0; i59 != v348; ++i59)
      {
        if (*(void *)v397 != v349) {
          objc_enumerationMutation(v346);
        }
        [(VCPProtoAssetAnalysis *)self addAudioFusedVideoEmbeddingResults:*(void *)(*((void *)&v396 + 1) + 8 * i59)];
      }
      uint64_t v348 = [v346 countByEnumeratingWithState:&v396 objects:v677 count:16];
    }
    while (v348);
  }

  long long v394 = 0u;
  long long v395 = 0u;
  long long v392 = 0u;
  long long v393 = 0u;
  id v351 = *((id *)v5 + 24);
  uint64_t v352 = [v351 countByEnumeratingWithState:&v392 objects:v676 count:16];
  if (v352)
  {
    uint64_t v353 = v352;
    uint64_t v354 = *(void *)v393;
    do
    {
      for (uint64_t i60 = 0; i60 != v353; ++i60)
      {
        if (*(void *)v393 != v354) {
          objc_enumerationMutation(v351);
        }
        [(VCPProtoAssetAnalysis *)self addImageEmbeddingResults:*(void *)(*((void *)&v392 + 1) + 8 * i60)];
      }
      uint64_t v353 = [v351 countByEnumeratingWithState:&v392 objects:v676 count:16];
    }
    while (v353);
  }

  long long v390 = 0u;
  long long v391 = 0u;
  long long v388 = 0u;
  long long v389 = 0u;
  id v356 = *((id *)v5 + 22);
  uint64_t v357 = [v356 countByEnumeratingWithState:&v388 objects:v675 count:16];
  if (v357)
  {
    uint64_t v358 = v357;
    uint64_t v359 = *(void *)v389;
    do
    {
      for (uint64_t i61 = 0; i61 != v358; ++i61)
      {
        if (*(void *)v389 != v359) {
          objc_enumerationMutation(v356);
        }
        [(VCPProtoAssetAnalysis *)self addImageCaptionResults:*(void *)(*((void *)&v388 + 1) + 8 * i61)];
      }
      uint64_t v358 = [v356 countByEnumeratingWithState:&v388 objects:v675 count:16];
    }
    while (v358);
  }

  long long v386 = 0u;
  long long v387 = 0u;
  long long v384 = 0u;
  long long v385 = 0u;
  id v361 = *((id *)v5 + 83);
  uint64_t v362 = [v361 countByEnumeratingWithState:&v384 objects:v674 count:16];
  if (v362)
  {
    uint64_t v363 = v362;
    uint64_t v364 = *(void *)v385;
    do
    {
      for (uint64_t i62 = 0; i62 != v363; ++i62)
      {
        if (*(void *)v385 != v364) {
          objc_enumerationMutation(v361);
        }
        [(VCPProtoAssetAnalysis *)self addVideoCaptionResults:*(void *)(*((void *)&v384 + 1) + 8 * i62)];
      }
      uint64_t v363 = [v361 countByEnumeratingWithState:&v384 objects:v674 count:16];
    }
    while (v363);
  }

  long long v382 = 0u;
  long long v383 = 0u;
  long long v380 = 0u;
  long long v381 = 0u;
  id v366 = *((id *)v5 + 82);
  uint64_t v367 = [v366 countByEnumeratingWithState:&v380 objects:v673 count:16];
  if (v367)
  {
    uint64_t v368 = v367;
    uint64_t v369 = *(void *)v381;
    do
    {
      for (uint64_t i63 = 0; i63 != v368; ++i63)
      {
        if (*(void *)v381 != v369) {
          objc_enumerationMutation(v366);
        }
        [(VCPProtoAssetAnalysis *)self addVideoCaptionPreferenceResults:*(void *)(*((void *)&v380 + 1) + 8 * i63)];
      }
      uint64_t v368 = [v366 countByEnumeratingWithState:&v380 objects:v673 count:16];
    }
    while (v368);
  }

  long long v378 = 0u;
  long long v379 = 0u;
  long long v376 = 0u;
  long long v377 = 0u;
  id v371 = *((id *)v5 + 85);
  uint64_t v372 = [v371 countByEnumeratingWithState:&v376 objects:v672 count:16];
  if (v372)
  {
    uint64_t v373 = v372;
    uint64_t v374 = *(void *)v377;
    do
    {
      for (uint64_t i64 = 0; i64 != v373; ++i64)
      {
        if (*(void *)v377 != v374) {
          objc_enumerationMutation(v371);
        }
        -[VCPProtoAssetAnalysis addVideoSegmentCaptionResults:](self, "addVideoSegmentCaptionResults:", *(void *)(*((void *)&v376 + 1) + 8 * i64), (void)v376);
      }
      uint64_t v373 = [v371 countByEnumeratingWithState:&v376 objects:v672 count:16];
    }
    while (v373);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_versiouint64_t n = a3;
}

- (unsigned)types
{
  return self->_types;
}

- (void)setTypes:(unsigned int)a3
{
  self->_unsigned int types = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (double)date
{
  return self->_date;
}

- (void)setDate:(double)a3
{
  self->_double date = a3;
}

- (double)quality
{
  return self->_quality;
}

- (unint64_t)statsFlags
{
  return self->_statsFlags;
}

- (unint64_t)typesWide
{
  return self->_typesWide;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (double)assetModificationDate
{
  return self->_assetModificationDate;
}

- (void)setAssetModificationDate:(double)a3
{
  self->_double assetModificationDate = a3;
}

- (NSString)assetMasterFingerprint
{
  return self->_assetMasterFingerprint;
}

- (void)setAssetMasterFingerprint:(id)a3
{
}

- (NSString)assetAdjustedFingerprint
{
  return self->_assetAdjustedFingerprint;
}

- (void)setAssetAdjustedFingerprint:(id)a3
{
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
}

- (NSMutableArray)imageBlurResults
{
  return self->_imageBlurResults;
}

- (void)setImageBlurResults:(id)a3
{
}

- (NSMutableArray)imageCompositionResults
{
  return self->_imageCompositionResults;
}

- (void)setImageCompositionResults:(id)a3
{
}

- (NSMutableArray)imageFaceResults
{
  return self->_imageFaceResults;
}

- (void)setImageFaceResults:(id)a3
{
}

- (NSMutableArray)imageFeatureResults
{
  return self->_imageFeatureResults;
}

- (void)setImageFeatureResults:(id)a3
{
}

- (NSMutableArray)imageJunkResults
{
  return self->_imageJunkResults;
}

- (void)setImageJunkResults:(id)a3
{
}

- (NSMutableArray)imageSaliencyResults
{
  return self->_imageSaliencyResults;
}

- (void)setImageSaliencyResults:(id)a3
{
}

- (NSMutableArray)imageShotTypeResults
{
  return self->_imageShotTypeResults;
}

- (void)setImageShotTypeResults:(id)a3
{
}

- (NSMutableArray)imagePetsResults
{
  return self->_imagePetsResults;
}

- (void)setImagePetsResults:(id)a3
{
}

- (NSMutableArray)imagePetsFaceResults
{
  return self->_imagePetsFaceResults;
}

- (void)setImagePetsFaceResults:(id)a3
{
}

- (NSMutableArray)imageSceneprintResults
{
  return self->_imageSceneprintResults;
}

- (void)setImageSceneprintResults:(id)a3
{
}

- (NSMutableArray)livePhotoEffectsResults
{
  return self->_livePhotoEffectsResults;
}

- (void)setLivePhotoEffectsResults:(id)a3
{
}

- (NSMutableArray)livePhotoRecommendationResults
{
  return self->_livePhotoRecommendationResults;
}

- (void)setLivePhotoRecommendationResults:(id)a3
{
}

- (NSMutableArray)livePhotoSharpnessResults
{
  return self->_livePhotoSharpnessResults;
}

- (void)setLivePhotoSharpnessResults:(id)a3
{
}

- (NSMutableArray)livePhotoKeyFrameResults
{
  return self->_livePhotoKeyFrameResults;
}

- (void)setLivePhotoKeyFrameResults:(id)a3
{
}

- (NSMutableArray)livePhotoKeyFrameStillResults
{
  return self->_livePhotoKeyFrameStillResults;
}

- (void)setLivePhotoKeyFrameStillResults:(id)a3
{
}

- (NSMutableArray)livePhotoSettlingEffectGatingResults
{
  return self->_livePhotoSettlingEffectGatingResults;
}

- (void)setLivePhotoSettlingEffectGatingResults:(id)a3
{
}

- (NSMutableArray)movieActivityLevelResults
{
  return self->_movieActivityLevelResults;
}

- (void)setMovieActivityLevelResults:(id)a3
{
}

- (NSMutableArray)movieCameraMotionResults
{
  return self->_movieCameraMotionResults;
}

- (void)setMovieCameraMotionResults:(id)a3
{
}

- (NSMutableArray)movieClassificationResults
{
  return self->_movieClassificationResults;
}

- (void)setMovieClassificationResults:(id)a3
{
}

- (NSMutableArray)movieFaceResults
{
  return self->_movieFaceResults;
}

- (void)setMovieFaceResults:(id)a3
{
}

- (NSMutableArray)movieFaceprintResults
{
  return self->_movieFaceprintResults;
}

- (void)setMovieFaceprintResults:(id)a3
{
}

- (NSMutableArray)movieFeatureResults
{
  return self->_movieFeatureResults;
}

- (void)setMovieFeatureResults:(id)a3
{
}

- (NSMutableArray)movieFineSubjectMotionResults
{
  return self->_movieFineSubjectMotionResults;
}

- (void)setMovieFineSubjectMotionResults:(id)a3
{
}

- (NSMutableArray)movieInterestingnessResults
{
  return self->_movieInterestingnessResults;
}

- (void)setMovieInterestingnessResults:(id)a3
{
}

- (NSMutableArray)movieMovingObjectResults
{
  return self->_movieMovingObjectResults;
}

- (void)setMovieMovingObjectResults:(id)a3
{
}

- (NSMutableArray)movieMusicResults
{
  return self->_movieMusicResults;
}

- (void)setMovieMusicResults:(id)a3
{
}

- (NSMutableArray)movieObstructionResults
{
  return self->_movieObstructionResults;
}

- (void)setMovieObstructionResults:(id)a3
{
}

- (NSMutableArray)movieOrientationResults
{
  return self->_movieOrientationResults;
}

- (void)setMovieOrientationResults:(id)a3
{
}

- (NSMutableArray)moviePreEncodeResults
{
  return self->_moviePreEncodeResults;
}

- (void)setMoviePreEncodeResults:(id)a3
{
}

- (NSMutableArray)movieQualityResults
{
  return self->_movieQualityResults;
}

- (void)setMovieQualityResults:(id)a3
{
}

- (NSMutableArray)movieSaliencyResults
{
  return self->_movieSaliencyResults;
}

- (void)setMovieSaliencyResults:(id)a3
{
}

- (NSMutableArray)movieSceneResults
{
  return self->_movieSceneResults;
}

- (void)setMovieSceneResults:(id)a3
{
}

- (NSMutableArray)movieSceneprintResults
{
  return self->_movieSceneprintResults;
}

- (void)setMovieSceneprintResults:(id)a3
{
}

- (NSMutableArray)movieSubjectMotionResults
{
  return self->_movieSubjectMotionResults;
}

- (void)setMovieSubjectMotionResults:(id)a3
{
}

- (NSMutableArray)movieSubtleMotionResults
{
  return self->_movieSubtleMotionResults;
}

- (void)setMovieSubtleMotionResults:(id)a3
{
}

- (NSMutableArray)movieUtteranceResults
{
  return self->_movieUtteranceResults;
}

- (void)setMovieUtteranceResults:(id)a3
{
}

- (NSMutableArray)movieVoiceResults
{
  return self->_movieVoiceResults;
}

- (void)setMovieVoiceResults:(id)a3
{
}

- (NSMutableArray)movieSummaryResults
{
  return self->_movieSummaryResults;
}

- (void)setMovieSummaryResults:(id)a3
{
}

- (NSMutableArray)movieHighlightResults
{
  return self->_movieHighlightResults;
}

- (void)setMovieHighlightResults:(id)a3
{
}

- (NSMutableArray)imageExposureResults
{
  return self->_imageExposureResults;
}

- (void)setImageExposureResults:(id)a3
{
}

- (NSMutableArray)imageHumanPoseResults
{
  return self->_imageHumanPoseResults;
}

- (void)setImageHumanPoseResults:(id)a3
{
}

- (NSMutableArray)movieHumanPoseResults
{
  return self->_movieHumanPoseResults;
}

- (void)setMovieHumanPoseResults:(id)a3
{
}

- (NSMutableArray)movieApplauseResults
{
  return self->_movieApplauseResults;
}

- (void)setMovieApplauseResults:(id)a3
{
}

- (NSMutableArray)movieBabbleResults
{
  return self->_movieBabbleResults;
}

- (void)setMovieBabbleResults:(id)a3
{
}

- (NSMutableArray)movieCheeringResults
{
  return self->_movieCheeringResults;
}

- (void)setMovieCheeringResults:(id)a3
{
}

- (NSMutableArray)movieLaughterResults
{
  return self->_movieLaughterResults;
}

- (void)setMovieLaughterResults:(id)a3
{
}

- (NSMutableArray)movieHumanActionResults
{
  return self->_movieHumanActionResults;
}

- (void)setMovieHumanActionResults:(id)a3
{
}

- (NSMutableArray)movieLoudnessResults
{
  return self->_movieLoudnessResults;
}

- (void)setMovieLoudnessResults:(id)a3
{
}

- (NSMutableArray)moviePetsResults
{
  return self->_moviePetsResults;
}

- (void)setMoviePetsResults:(id)a3
{
}

- (NSMutableArray)moviePetsFaceResults
{
  return self->_moviePetsFaceResults;
}

- (void)setMoviePetsFaceResults:(id)a3
{
}

- (NSMutableArray)movieStabilizationResults
{
  return self->_movieStabilizationResults;
}

- (void)setMovieStabilizationResults:(id)a3
{
}

- (NSMutableArray)movieHighlightScoreResults
{
  return self->_movieHighlightScoreResults;
}

- (void)setMovieHighlightScoreResults:(id)a3
{
}

- (NSMutableArray)livePhotoHumanActionClassificationResults
{
  return self->_livePhotoHumanActionClassificationResults;
}

- (void)setLivePhotoHumanActionClassificationResults:(id)a3
{
}

- (NSMutableArray)movieAudioQualityResults
{
  return self->_movieAudioQualityResults;
}

- (void)setMovieAudioQualityResults:(id)a3
{
}

- (NSMutableArray)movieSafetyResults
{
  return self->_movieSafetyResults;
}

- (void)setMovieSafetyResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieClassificationResults
{
  return self->_filesystemMovieClassificationResults;
}

- (void)setFilesystemMovieClassificationResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieHumanActionClassificationResults
{
  return self->_filesystemMovieHumanActionClassificationResults;
}

- (void)setFilesystemMovieHumanActionClassificationResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieApplauseResults
{
  return self->_filesystemMovieApplauseResults;
}

- (void)setFilesystemMovieApplauseResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieBabbleResults
{
  return self->_filesystemMovieBabbleResults;
}

- (void)setFilesystemMovieBabbleResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieCheeringResults
{
  return self->_filesystemMovieCheeringResults;
}

- (void)setFilesystemMovieCheeringResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieLaughterResults
{
  return self->_filesystemMovieLaughterResults;
}

- (void)setFilesystemMovieLaughterResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieMusicResults
{
  return self->_filesystemMovieMusicResults;
}

- (void)setFilesystemMovieMusicResults:(id)a3
{
}

- (NSMutableArray)filesystemMovieVoiceResults
{
  return self->_filesystemMovieVoiceResults;
}

- (void)setFilesystemMovieVoiceResults:(id)a3
{
}

- (NSMutableArray)animatedStickerResults
{
  return self->_animatedStickerResults;
}

- (void)setAnimatedStickerResults:(id)a3
{
}

- (NSMutableArray)movieTorsoResults
{
  return self->_movieTorsoResults;
}

- (void)setMovieTorsoResults:(id)a3
{
}

- (NSMutableArray)movieHumanActionClassificationResults
{
  return self->_movieHumanActionClassificationResults;
}

- (void)setMovieHumanActionClassificationResults:(id)a3
{
}

- (NSMutableArray)videoEmbeddingResults
{
  return self->_videoEmbeddingResults;
}

- (void)setVideoEmbeddingResults:(id)a3
{
}

- (NSMutableArray)summarizedEmbeddingResults
{
  return self->_summarizedEmbeddingResults;
}

- (void)setSummarizedEmbeddingResults:(id)a3
{
}

- (NSMutableArray)audioFusedVideoEmbeddingResults
{
  return self->_audioFusedVideoEmbeddingResults;
}

- (void)setAudioFusedVideoEmbeddingResults:(id)a3
{
}

- (NSMutableArray)imageEmbeddingResults
{
  return self->_imageEmbeddingResults;
}

- (void)setImageEmbeddingResults:(id)a3
{
}

- (NSMutableArray)imageCaptionResults
{
  return self->_imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
}

- (NSMutableArray)videoCaptionResults
{
  return self->_videoCaptionResults;
}

- (void)setVideoCaptionResults:(id)a3
{
}

- (NSMutableArray)videoCaptionPreferenceResults
{
  return self->_videoCaptionPreferenceResults;
}

- (void)setVideoCaptionPreferenceResults:(id)a3
{
}

- (NSMutableArray)videoSegmentCaptionResults
{
  return self->_videoSegmentCaptionResults;
}

- (void)setVideoSegmentCaptionResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegmentCaptionResults, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_videoCaptionResults, 0);
  objc_storeStrong((id *)&self->_videoCaptionPreferenceResults, 0);
  objc_storeStrong((id *)&self->_summarizedEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_movieVoiceResults, 0);
  objc_storeStrong((id *)&self->_movieUtteranceResults, 0);
  objc_storeStrong((id *)&self->_movieTorsoResults, 0);
  objc_storeStrong((id *)&self->_movieSummaryResults, 0);
  objc_storeStrong((id *)&self->_movieSubtleMotionResults, 0);
  objc_storeStrong((id *)&self->_movieSubjectMotionResults, 0);
  objc_storeStrong((id *)&self->_movieStabilizationResults, 0);
  objc_storeStrong((id *)&self->_movieSceneprintResults, 0);
  objc_storeStrong((id *)&self->_movieSceneResults, 0);
  objc_storeStrong((id *)&self->_movieSaliencyResults, 0);
  objc_storeStrong((id *)&self->_movieSafetyResults, 0);
  objc_storeStrong((id *)&self->_movieQualityResults, 0);
  objc_storeStrong((id *)&self->_moviePreEncodeResults, 0);
  objc_storeStrong((id *)&self->_moviePetsResults, 0);
  objc_storeStrong((id *)&self->_moviePetsFaceResults, 0);
  objc_storeStrong((id *)&self->_movieOrientationResults, 0);
  objc_storeStrong((id *)&self->_movieObstructionResults, 0);
  objc_storeStrong((id *)&self->_movieMusicResults, 0);
  objc_storeStrong((id *)&self->_movieMovingObjectResults, 0);
  objc_storeStrong((id *)&self->_movieLoudnessResults, 0);
  objc_storeStrong((id *)&self->_movieLaughterResults, 0);
  objc_storeStrong((id *)&self->_movieInterestingnessResults, 0);
  objc_storeStrong((id *)&self->_movieHumanPoseResults, 0);
  objc_storeStrong((id *)&self->_movieHumanActionResults, 0);
  objc_storeStrong((id *)&self->_movieHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_movieHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_movieHighlightResults, 0);
  objc_storeStrong((id *)&self->_movieFineSubjectMotionResults, 0);
  objc_storeStrong((id *)&self->_movieFeatureResults, 0);
  objc_storeStrong((id *)&self->_movieFaceprintResults, 0);
  objc_storeStrong((id *)&self->_movieFaceResults, 0);
  objc_storeStrong((id *)&self->_movieClassificationResults, 0);
  objc_storeStrong((id *)&self->_movieCheeringResults, 0);
  objc_storeStrong((id *)&self->_movieCameraMotionResults, 0);
  objc_storeStrong((id *)&self->_movieBabbleResults, 0);
  objc_storeStrong((id *)&self->_movieAudioQualityResults, 0);
  objc_storeStrong((id *)&self->_movieApplauseResults, 0);
  objc_storeStrong((id *)&self->_movieActivityLevelResults, 0);
  objc_storeStrong((id *)&self->_livePhotoSharpnessResults, 0);
  objc_storeStrong((id *)&self->_livePhotoSettlingEffectGatingResults, 0);
  objc_storeStrong((id *)&self->_livePhotoRecommendationResults, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFrameStillResults, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFrameResults, 0);
  objc_storeStrong((id *)&self->_livePhotoHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_livePhotoEffectsResults, 0);
  objc_storeStrong((id *)&self->_imageShotTypeResults, 0);
  objc_storeStrong((id *)&self->_imageSceneprintResults, 0);
  objc_storeStrong((id *)&self->_imageSaliencyResults, 0);
  objc_storeStrong((id *)&self->_imagePetsResults, 0);
  objc_storeStrong((id *)&self->_imagePetsFaceResults, 0);
  objc_storeStrong((id *)&self->_imageJunkResults, 0);
  objc_storeStrong((id *)&self->_imageHumanPoseResults, 0);
  objc_storeStrong((id *)&self->_imageFeatureResults, 0);
  objc_storeStrong((id *)&self->_imageFaceResults, 0);
  objc_storeStrong((id *)&self->_imageExposureResults, 0);
  objc_storeStrong((id *)&self->_imageEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_imageCompositionResults, 0);
  objc_storeStrong((id *)&self->_imageCaptionResults, 0);
  objc_storeStrong((id *)&self->_imageBlurResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieVoiceResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieMusicResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieLaughterResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieClassificationResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieCheeringResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieBabbleResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieApplauseResults, 0);
  objc_storeStrong((id *)&self->_audioFusedVideoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_assetMasterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetAdjustedFingerprint, 0);
  objc_storeStrong((id *)&self->_animatedStickerResults, 0);
}

- (BOOL)setAttributesFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  id v21 = [v4 objectForKeyedSubscript:@"version"];
  id v5 = [v4 objectForKeyedSubscript:@"performedAnalysisTypes"];
  id v6 = [v4 objectForKeyedSubscript:@"flags"];
  uint64_t v20 = [v4 objectForKeyedSubscript:@"statsFlags"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"dateAnalyzed"];
  uint64_t v19 = [v4 objectForKeyedSubscript:@"quality"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"dateModified"];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"masterFingerprint"];
  double v10 = [v4 objectForKeyedSubscript:@"adjustedFingerprint"];
  if (v21) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v14 = v11 || v5 == 0 || v6 == 0 || v8 == 0;
  BOOL v15 = !v14;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Invalid attribute: no version/date/types/flags/modificationDate", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v16 = [v5 unsignedIntegerValue];
    if (_os_feature_enabled_impl()) {
      v16 &= 0xFFFFFFFFBFBFFFF3;
    }
    -[VCPProtoAssetAnalysis setVersion:](self, "setVersion:", [v21 unsignedIntValue]);
    [(VCPProtoAssetAnalysis *)self setTypesWide:v16];
    -[VCPProtoAssetAnalysis setFlags:](self, "setFlags:", [v6 unsignedIntValue]);
    [v7 timeIntervalSinceReferenceDate];
    -[VCPProtoAssetAnalysis setDate:](self, "setDate:");
    [v19 doubleValue];
    -[VCPProtoAssetAnalysis setQuality:](self, "setQuality:");
    -[VCPProtoAssetAnalysis setStatsFlags:](self, "setStatsFlags:", [v20 unsignedLongValue]);
    [v8 timeIntervalSinceReferenceDate];
    -[VCPProtoAssetAnalysis setAssetModificationDate:](self, "setAssetModificationDate:");
    [(VCPProtoAssetAnalysis *)self setAssetMasterFingerprint:v9];
    [(VCPProtoAssetAnalysis *)self setAssetAdjustedFingerprint:v10];
  }

  return v15;
}

+ (id)faceResultKeys
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"imageFaceResults";
  v4[1] = @"movieFaceResults";
  v4[2] = @"movieFaceprintResults";
  v4[3] = @"imageHumanPoseResults";
  v4[4] = @"movieHumanPoseResults";
  v4[5] = @"movieHumanActionResults";
  v4[6] = @"livePhotoHumanActionClassificationResults";
  v4[7] = @"movieTorsoResults";
  v4[8] = @"movieHumanActionResults";
  v4[9] = @"movieHumanActionClassificationResults";
  v4[10] = @"filesystemMovieHumanActionClassificationResults";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  return v2;
}

- (BOOL)setResults:(id)a3 withClass:(Class)a4 forPropertyKey:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a5;
  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = +[VCPProtoAssetAnalysis faceResultKeys];
    char v10 = [v9 containsObject:v26];

    if (v10) {
      goto LABEL_16;
    }
  }
  if (!v8 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([v8 count])
    {
      BOOL v11 = [MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v13) {
        goto LABEL_15;
      }
      uint64_t v14 = *(void *)v28;
LABEL_8:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          break;
        }
        uint64_t v17 = [(objc_class *)a4 resultFromLegacyDictionary:v16];
        if (!v17)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = NSStringFromClass(a4);
              *(_DWORD *)buf = 138412546;
              id v33 = v26;
              __int16 v34 = 2112;
              uint64_t v35 = v24;
              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to nil %@", buf, 0x16u);
            }
            goto LABEL_27;
          }
          goto LABEL_28;
        }
        [v11 addObject:v17];

        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v13) {
            goto LABEL_8;
          }
LABEL_15:

          [(VCPProtoAssetAnalysis *)self setValue:v11 forKey:v26];
          BOOL v18 = 1;
LABEL_30:

          goto LABEL_31;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = (objc_class *)objc_opt_class();
          uint64_t v23 = NSStringFromClass(v22);
          *(_DWORD *)buf = 138412546;
          id v33 = v26;
          __int16 v34 = 2112;
          uint64_t v35 = v23;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to invalid type for result entry (should be NSDictionary, is %@)", buf, 0x16u);
        }
LABEL_27:
      }
LABEL_28:

      goto LABEL_29;
    }
LABEL_16:
    BOOL v18 = 1;
    goto LABEL_31;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    BOOL v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412546;
      id v33 = v26;
      __int16 v34 = 2112;
      uint64_t v35 = v20;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to invalid type for results (should be NSArray, is %@)", buf, 0x16u);
    }
LABEL_29:
    BOOL v18 = 0;
    goto LABEL_30;
  }
  BOOL v18 = 0;
LABEL_31:

  return v18;
}

- (BOOL)setImageAnalysisFromLegacyDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"metadataRanges"];
  id v5 = [v4 objectForKeyedSubscript:@"BlurResults"];
  BOOL v6 = [(VCPProtoAssetAnalysis *)self setResults:v5 withClass:objc_opt_class() forPropertyKey:@"imageBlurResults"];

  if (!v6) {
    goto LABEL_53;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"CompositionResults"];
  BOOL v8 = [(VCPProtoAssetAnalysis *)self setResults:v7 withClass:objc_opt_class() forPropertyKey:@"imageCompositionResults"];

  if (!v8) {
    goto LABEL_53;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"ExposureResults"];
  BOOL v10 = [(VCPProtoAssetAnalysis *)self setResults:v9 withClass:objc_opt_class() forPropertyKey:@"imageExposureResults"];

  if (!v10) {
    goto LABEL_53;
  }
  BOOL v11 = [v4 objectForKeyedSubscript:@"FaceResults"];
  BOOL v12 = [(VCPProtoAssetAnalysis *)self setResults:v11 withClass:objc_opt_class() forPropertyKey:@"imageFaceResults"];

  if (!v12) {
    goto LABEL_53;
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"FeatureVectorResults"];
  BOOL v14 = [(VCPProtoAssetAnalysis *)self setResults:v13 withClass:objc_opt_class() forPropertyKey:@"imageFeatureResults"];

  if (!v14) {
    goto LABEL_53;
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"JunkResults"];
  BOOL v16 = [(VCPProtoAssetAnalysis *)self setResults:v15 withClass:objc_opt_class() forPropertyKey:@"imageJunkResults"];

  if (!v16) {
    goto LABEL_53;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"PetsResults"];
  BOOL v18 = [(VCPProtoAssetAnalysis *)self setResults:v17 withClass:objc_opt_class() forPropertyKey:@"imagePetsResults"];

  if (!v18) {
    goto LABEL_53;
  }
  uint64_t v19 = [v4 objectForKeyedSubscript:@"PetsFaceResults"];
  BOOL v20 = [(VCPProtoAssetAnalysis *)self setResults:v19 withClass:objc_opt_class() forPropertyKey:@"imagePetsFaceResults"];

  if (!v20) {
    goto LABEL_53;
  }
  id v21 = [v4 objectForKeyedSubscript:@"SaliencyResults"];
  BOOL v22 = [(VCPProtoAssetAnalysis *)self setResults:v21 withClass:objc_opt_class() forPropertyKey:@"imageSaliencyResults"];

  if (!v22) {
    goto LABEL_53;
  }
  uint64_t v23 = [v4 objectForKeyedSubscript:@"SceneprintResults"];
  BOOL v24 = [(VCPProtoAssetAnalysis *)self setResults:v23 withClass:objc_opt_class() forPropertyKey:@"imageSceneprintResults"];

  if (!v24) {
    goto LABEL_53;
  }
  uint64_t v25 = [v4 objectForKeyedSubscript:@"ShotTypeResults"];
  BOOL v26 = [(VCPProtoAssetAnalysis *)self setResults:v25 withClass:objc_opt_class() forPropertyKey:@"imageShotTypeResults"];

  if (!v26) {
    goto LABEL_53;
  }
  long long v27 = [v4 objectForKeyedSubscript:@"HumanPoseResults"];
  BOOL v28 = [(VCPProtoAssetAnalysis *)self setResults:v27 withClass:objc_opt_class() forPropertyKey:@"imageHumanPoseResults"];

  if (!v28) {
    goto LABEL_53;
  }
  long long v29 = [v4 objectForKeyedSubscript:@"ImageEmbeddingResults"];
  BOOL v30 = [(VCPProtoAssetAnalysis *)self setResults:v29 withClass:objc_opt_class() forPropertyKey:@"imageEmbeddingResults"];

  if (!v30) {
    goto LABEL_53;
  }
  id v31 = [v4 objectForKeyedSubscript:@"MiCaImageCaptionResults"];
  BOOL v32 = [(VCPProtoAssetAnalysis *)self setResults:v31 withClass:objc_opt_class() forPropertyKey:@"imageCaptionResults"];

  if (!v32) {
    goto LABEL_53;
  }
  id v33 = [v4 objectForKeyedSubscript:@"IrisRecommendResults"];
  BOOL v34 = [(VCPProtoAssetAnalysis *)self setResults:v33 withClass:objc_opt_class() forPropertyKey:@"livePhotoRecommendationResults"];

  if (!v34) {
    goto LABEL_53;
  }
  uint64_t v35 = [v4 objectForKeyedSubscript:@"IrisSharpnessResults"];
  BOOL v36 = [(VCPProtoAssetAnalysis *)self setResults:v35 withClass:objc_opt_class() forPropertyKey:@"livePhotoSharpnessResults"];

  if (!v36) {
    goto LABEL_53;
  }
  uint64_t v37 = [v4 objectForKeyedSubscript:@"HumanActionClassificationResults"];
  BOOL v38 = [(VCPProtoAssetAnalysis *)self setResults:v37 withClass:objc_opt_class() forPropertyKey:@"livePhotoHumanActionClassificationResults"];

  if (!v38) {
    goto LABEL_53;
  }
  uint64_t v39 = [v4 objectForKeyedSubscript:@"LivePhotoEffectsResults"];
  BOOL v40 = [(VCPProtoAssetAnalysis *)self setResults:v39 withClass:objc_opt_class() forPropertyKey:@"livePhotoEffectsResults"];

  if (!v40) {
    goto LABEL_53;
  }
  id v41 = [v4 objectForKeyedSubscript:@"KeyFrameResults"];
  BOOL v42 = [(VCPProtoAssetAnalysis *)self setResults:v41 withClass:objc_opt_class() forPropertyKey:@"livePhotoKeyFrameResults"];

  if (!v42) {
    goto LABEL_53;
  }
  uint64_t v43 = [v4 objectForKeyedSubscript:@"KeyFrameStillResults"];
  BOOL v44 = [(VCPProtoAssetAnalysis *)self setResults:v43 withClass:objc_opt_class() forPropertyKey:@"livePhotoKeyFrameStillResults"];

  if (!v44) {
    goto LABEL_53;
  }
  uint64_t v45 = [v4 objectForKeyedSubscript:@"SettlingEffectsGatingResults"];
  BOOL v46 = [(VCPProtoAssetAnalysis *)self setResults:v45 withClass:objc_opt_class() forPropertyKey:@"livePhotoSettlingEffectGatingResults"];

  if (!v46) {
    goto LABEL_53;
  }
  uint64_t v47 = [v4 objectForKeyedSubscript:@"CameraMotionResults"];
  BOOL v48 = [(VCPProtoAssetAnalysis *)self setResults:v47 withClass:objc_opt_class() forPropertyKey:@"movieCameraMotionResults"];

  if (!v48) {
    goto LABEL_53;
  }
  uint64_t v49 = [v4 objectForKeyedSubscript:@"FineSubjectMotionResults"];
  BOOL v50 = [(VCPProtoAssetAnalysis *)self setResults:v49 withClass:objc_opt_class() forPropertyKey:@"movieFineSubjectMotionResults"];

  if (!v50) {
    goto LABEL_53;
  }
  id v51 = [v4 objectForKeyedSubscript:@"InterestingnessResults"];
  BOOL v52 = [(VCPProtoAssetAnalysis *)self setResults:v51 withClass:objc_opt_class() forPropertyKey:@"movieInterestingnessResults"];

  if (!v52) {
    goto LABEL_53;
  }
  uint64_t v53 = [v4 objectForKeyedSubscript:@"MovingObjectsResults"];
  BOOL v54 = [(VCPProtoAssetAnalysis *)self setResults:v53 withClass:objc_opt_class() forPropertyKey:@"movieMovingObjectResults"];

  if (!v54) {
    goto LABEL_53;
  }
  uint64_t v55 = [v4 objectForKeyedSubscript:@"MusicResults"];
  BOOL v56 = [(VCPProtoAssetAnalysis *)self setResults:v55 withClass:objc_opt_class() forPropertyKey:@"movieMusicResults"];

  if (!v56) {
    goto LABEL_53;
  }
  uint64_t v57 = [v4 objectForKeyedSubscript:@"ObstructionResults"];
  BOOL v58 = [(VCPProtoAssetAnalysis *)self setResults:v57 withClass:objc_opt_class() forPropertyKey:@"movieObstructionResults"];

  if (!v58) {
    goto LABEL_53;
  }
  uint64_t v59 = [v4 objectForKeyedSubscript:@"OrientationResults"];
  BOOL v60 = [(VCPProtoAssetAnalysis *)self setResults:v59 withClass:objc_opt_class() forPropertyKey:@"movieOrientationResults"];

  if (!v60) {
    goto LABEL_53;
  }
  id v61 = [v4 objectForKeyedSubscript:@"QualityResults"];
  BOOL v62 = [(VCPProtoAssetAnalysis *)self setResults:v61 withClass:objc_opt_class() forPropertyKey:@"movieQualityResults"];

  if (!v62) {
    goto LABEL_53;
  }
  uint64_t v63 = [v4 objectForKeyedSubscript:@"SceneResults"];
  BOOL v64 = [(VCPProtoAssetAnalysis *)self setResults:v63 withClass:objc_opt_class() forPropertyKey:@"movieSceneResults"];

  if (!v64) {
    goto LABEL_53;
  }
  uint64_t v65 = [v4 objectForKeyedSubscript:@"SubjectMotionResults"];
  BOOL v66 = [(VCPProtoAssetAnalysis *)self setResults:v65 withClass:objc_opt_class() forPropertyKey:@"movieSubjectMotionResults"];

  if (!v66) {
    goto LABEL_53;
  }
  uint64_t v67 = [v4 objectForKeyedSubscript:@"SubtleMotionResults"];
  BOOL v68 = [(VCPProtoAssetAnalysis *)self setResults:v67 withClass:objc_opt_class() forPropertyKey:@"movieSubtleMotionResults"];

  if (!v68) {
    goto LABEL_53;
  }
  uint64_t v69 = [v4 objectForKeyedSubscript:@"UtteranceResults"];
  BOOL v70 = [(VCPProtoAssetAnalysis *)self setResults:v69 withClass:objc_opt_class() forPropertyKey:@"movieUtteranceResults"];

  if (!v70) {
    goto LABEL_53;
  }
  id v71 = [v4 objectForKeyedSubscript:@"VoiceResults"];
  BOOL v72 = [(VCPProtoAssetAnalysis *)self setResults:v71 withClass:objc_opt_class() forPropertyKey:@"movieVoiceResults"];

  if (!v72) {
    goto LABEL_53;
  }
  uint64_t v73 = [v4 objectForKeyedSubscript:@"MovieSummaryResults"];
  BOOL v74 = [(VCPProtoAssetAnalysis *)self setResults:v73 withClass:objc_opt_class() forPropertyKey:@"movieSummaryResults"];

  if (!v74) {
    goto LABEL_53;
  }
  uint64_t v75 = [v4 objectForKeyedSubscript:@"AnimatedStickerResults"];
  BOOL v76 = [(VCPProtoAssetAnalysis *)self setResults:v75 withClass:objc_opt_class() forPropertyKey:@"animatedStickerResults"];

  if (!v76) {
    goto LABEL_53;
  }
  uint64_t v77 = [v4 objectForKeyedSubscript:@"MovieHighlightScoreResults"];
  BOOL v78 = [(VCPProtoAssetAnalysis *)self setResults:v77 withClass:objc_opt_class() forPropertyKey:@"movieHighlightScoreResults"];

  if (!v78) {
    goto LABEL_53;
  }
  uint64_t v79 = [v4 objectForKeyedSubscript:@"MovieHighlightResults"];
  BOOL v80 = [(VCPProtoAssetAnalysis *)self setResults:v79 withClass:objc_opt_class() forPropertyKey:@"movieHighlightResults"];

  if (!v80) {
    goto LABEL_53;
  }
  id v81 = [v4 objectForKeyedSubscript:@"ApplauseResults"];
  BOOL v82 = [(VCPProtoAssetAnalysis *)self setResults:v81 withClass:objc_opt_class() forPropertyKey:@"movieApplauseResults"];

  if (!v82) {
    goto LABEL_53;
  }
  uint64_t v83 = [v4 objectForKeyedSubscript:@"AudioQualityResults"];
  BOOL v84 = [(VCPProtoAssetAnalysis *)self setResults:v83 withClass:objc_opt_class() forPropertyKey:@"movieAudioQualityResults"];

  if (!v84) {
    goto LABEL_53;
  }
  uint64_t v85 = [v4 objectForKeyedSubscript:@"BabbleResults"];
  BOOL v86 = [(VCPProtoAssetAnalysis *)self setResults:v85 withClass:objc_opt_class() forPropertyKey:@"movieBabbleResults"];

  if (!v86) {
    goto LABEL_53;
  }
  uint64_t v87 = [v4 objectForKeyedSubscript:@"CheeringResults"];
  BOOL v88 = [(VCPProtoAssetAnalysis *)self setResults:v87 withClass:objc_opt_class() forPropertyKey:@"movieCheeringResults"];

  if (!v88) {
    goto LABEL_53;
  }
  uint64_t v89 = [v4 objectForKeyedSubscript:@"LaughterResults"];
  BOOL v90 = [(VCPProtoAssetAnalysis *)self setResults:v89 withClass:objc_opt_class() forPropertyKey:@"movieLaughterResults"];

  if (!v90) {
    goto LABEL_53;
  }
  id v91 = [v4 objectForKeyedSubscript:@"HumanActionResults"];
  BOOL v92 = [(VCPProtoAssetAnalysis *)self setResults:v91 withClass:objc_opt_class() forPropertyKey:@"movieHumanActionResults"];

  if (!v92) {
    goto LABEL_53;
  }
  uint64_t v93 = [v4 objectForKeyedSubscript:@"LoudnessResults"];
  BOOL v94 = [(VCPProtoAssetAnalysis *)self setResults:v93 withClass:objc_opt_class() forPropertyKey:@"movieLoudnessResults"];

  if (!v94) {
    goto LABEL_53;
  }
  NSUInteger v95 = [v4 objectForKeyedSubscript:@"VideoStabilizationResults"];
  BOOL v96 = [(VCPProtoAssetAnalysis *)self setResults:v95 withClass:objc_opt_class() forPropertyKey:@"movieStabilizationResults"];

  if (!v96) {
    goto LABEL_53;
  }
  uint64_t v97 = [v4 objectForKeyedSubscript:@"SafetyResults"];
  BOOL v98 = [(VCPProtoAssetAnalysis *)self setResults:v97 withClass:objc_opt_class() forPropertyKey:@"movieSafetyResults"];

  if (!v98) {
    goto LABEL_53;
  }
  uint64_t v99 = [v4 objectForKeyedSubscript:@"SummarizedEmbeddingResults"];
  BOOL v100 = [(VCPProtoAssetAnalysis *)self setResults:v99 withClass:objc_opt_class() forPropertyKey:@"summarizedEmbeddingResults"];

  if (!v100) {
    goto LABEL_53;
  }
  id v101 = [v4 objectForKeyedSubscript:@"AudioFusedVideoEmbeddingResults"];
  BOOL v102 = [(VCPProtoAssetAnalysis *)self setResults:v101 withClass:objc_opt_class() forPropertyKey:@"audioFusedVideoEmbeddingResults"];

  if (!v102) {
    goto LABEL_53;
  }
  uint64_t v103 = [v4 objectForKeyedSubscript:@"VideoEmbeddingResults"];
  BOOL v104 = [(VCPProtoAssetAnalysis *)self setResults:v103 withClass:objc_opt_class() forPropertyKey:@"videoEmbeddingResults"];

  if (!v104) {
    goto LABEL_53;
  }
  uint64_t v105 = [v4 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];
  BOOL v106 = [(VCPProtoAssetAnalysis *)self setResults:v105 withClass:objc_opt_class() forPropertyKey:@"videoCaptionResults"];

  if (v106)
  {
    uint64_t v107 = [v4 objectForKeyedSubscript:@"VideoCaptionPreferenceResults"];
    BOOL v108 = [(VCPProtoAssetAnalysis *)self setResults:v107 withClass:objc_opt_class() forPropertyKey:@"videoCaptionPreferenceResults"];
  }
  else
  {
LABEL_53:
    BOOL v108 = 0;
  }

  return v108;
}

- (BOOL)setMovieAnalysisFromLegacyDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"metadataRanges"];
  id v5 = [v4 objectForKeyedSubscript:@"ActivityLevelResults"];
  BOOL v6 = [(VCPProtoAssetAnalysis *)self setResults:v5 withClass:objc_opt_class() forPropertyKey:@"movieActivityLevelResults"];

  if (!v6) {
    goto LABEL_46;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"AudioQualityResults"];
  BOOL v8 = [(VCPProtoAssetAnalysis *)self setResults:v7 withClass:objc_opt_class() forPropertyKey:@"movieAudioQualityResults"];

  if (!v8) {
    goto LABEL_46;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"CameraMotionResults"];
  BOOL v10 = [(VCPProtoAssetAnalysis *)self setResults:v9 withClass:objc_opt_class() forPropertyKey:@"movieCameraMotionResults"];

  if (!v10) {
    goto LABEL_46;
  }
  BOOL v11 = [v4 objectForKeyedSubscript:@"ClassificationResults"];
  BOOL v12 = [(VCPProtoAssetAnalysis *)self setResults:v11 withClass:objc_opt_class() forPropertyKey:@"movieClassificationResults"];

  if (!v12) {
    goto LABEL_46;
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"FaceResults"];
  BOOL v14 = [(VCPProtoAssetAnalysis *)self setResults:v13 withClass:objc_opt_class() forPropertyKey:@"movieFaceResults"];

  if (!v14) {
    goto LABEL_46;
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"FacePrintResults"];
  BOOL v16 = [(VCPProtoAssetAnalysis *)self setResults:v15 withClass:objc_opt_class() forPropertyKey:@"movieFaceprintResults"];

  if (!v16) {
    goto LABEL_46;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"FeatureVectorResults"];
  BOOL v18 = [(VCPProtoAssetAnalysis *)self setResults:v17 withClass:objc_opt_class() forPropertyKey:@"movieFeatureResults"];

  if (!v18) {
    goto LABEL_46;
  }
  uint64_t v19 = [v4 objectForKeyedSubscript:@"FineSubjectMotionResults"];
  BOOL v20 = [(VCPProtoAssetAnalysis *)self setResults:v19 withClass:objc_opt_class() forPropertyKey:@"movieFineSubjectMotionResults"];

  if (!v20) {
    goto LABEL_46;
  }
  id v21 = [v4 objectForKeyedSubscript:@"InterestingnessResults"];
  BOOL v22 = [(VCPProtoAssetAnalysis *)self setResults:v21 withClass:objc_opt_class() forPropertyKey:@"movieInterestingnessResults"];

  if (!v22) {
    goto LABEL_46;
  }
  uint64_t v23 = [v4 objectForKeyedSubscript:@"MovingObjectsResults"];
  BOOL v24 = [(VCPProtoAssetAnalysis *)self setResults:v23 withClass:objc_opt_class() forPropertyKey:@"movieMovingObjectResults"];

  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v25 = [v4 objectForKeyedSubscript:@"MusicResults"];
  BOOL v26 = [(VCPProtoAssetAnalysis *)self setResults:v25 withClass:objc_opt_class() forPropertyKey:@"movieMusicResults"];

  if (!v26) {
    goto LABEL_46;
  }
  long long v27 = [v4 objectForKeyedSubscript:@"ObstructionResults"];
  BOOL v28 = [(VCPProtoAssetAnalysis *)self setResults:v27 withClass:objc_opt_class() forPropertyKey:@"movieObstructionResults"];

  if (!v28) {
    goto LABEL_46;
  }
  long long v29 = [v4 objectForKeyedSubscript:@"OrientationResults"];
  BOOL v30 = [(VCPProtoAssetAnalysis *)self setResults:v29 withClass:objc_opt_class() forPropertyKey:@"movieOrientationResults"];

  if (!v30) {
    goto LABEL_46;
  }
  id v31 = [v4 objectForKeyedSubscript:@"PreEncodeResults"];
  BOOL v32 = [(VCPProtoAssetAnalysis *)self setResults:v31 withClass:objc_opt_class() forPropertyKey:@"moviePreEncodeResults"];

  if (!v32) {
    goto LABEL_46;
  }
  id v33 = [v4 objectForKeyedSubscript:@"QualityResults"];
  BOOL v34 = [(VCPProtoAssetAnalysis *)self setResults:v33 withClass:objc_opt_class() forPropertyKey:@"movieQualityResults"];

  if (!v34) {
    goto LABEL_46;
  }
  uint64_t v35 = [v4 objectForKeyedSubscript:@"SaliencyResults"];
  BOOL v36 = [(VCPProtoAssetAnalysis *)self setResults:v35 withClass:objc_opt_class() forPropertyKey:@"movieSaliencyResults"];

  if (!v36) {
    goto LABEL_46;
  }
  uint64_t v37 = [v4 objectForKeyedSubscript:@"SceneResults"];
  BOOL v38 = [(VCPProtoAssetAnalysis *)self setResults:v37 withClass:objc_opt_class() forPropertyKey:@"movieSceneResults"];

  if (!v38) {
    goto LABEL_46;
  }
  uint64_t v39 = [v4 objectForKeyedSubscript:@"SceneprintResults"];
  BOOL v40 = [(VCPProtoAssetAnalysis *)self setResults:v39 withClass:objc_opt_class() forPropertyKey:@"movieSceneprintResults"];

  if (!v40) {
    goto LABEL_46;
  }
  id v41 = [v4 objectForKeyedSubscript:@"SubjectMotionResults"];
  BOOL v42 = [(VCPProtoAssetAnalysis *)self setResults:v41 withClass:objc_opt_class() forPropertyKey:@"movieSubjectMotionResults"];

  if (!v42) {
    goto LABEL_46;
  }
  uint64_t v43 = [v4 objectForKeyedSubscript:@"SubtleMotionResults"];
  BOOL v44 = [(VCPProtoAssetAnalysis *)self setResults:v43 withClass:objc_opt_class() forPropertyKey:@"movieSubtleMotionResults"];

  if (!v44) {
    goto LABEL_46;
  }
  uint64_t v45 = [v4 objectForKeyedSubscript:@"UtteranceResults"];
  BOOL v46 = [(VCPProtoAssetAnalysis *)self setResults:v45 withClass:objc_opt_class() forPropertyKey:@"movieUtteranceResults"];

  if (!v46) {
    goto LABEL_46;
  }
  uint64_t v47 = [v4 objectForKeyedSubscript:@"VoiceResults"];
  BOOL v48 = [(VCPProtoAssetAnalysis *)self setResults:v47 withClass:objc_opt_class() forPropertyKey:@"movieVoiceResults"];

  if (!v48) {
    goto LABEL_46;
  }
  uint64_t v49 = [v4 objectForKeyedSubscript:@"MovieSummaryResults"];
  BOOL v50 = [(VCPProtoAssetAnalysis *)self setResults:v49 withClass:objc_opt_class() forPropertyKey:@"movieSummaryResults"];

  if (!v50) {
    goto LABEL_46;
  }
  id v51 = [v4 objectForKeyedSubscript:@"AnimatedStickerResults"];
  BOOL v52 = [(VCPProtoAssetAnalysis *)self setResults:v51 withClass:objc_opt_class() forPropertyKey:@"animatedStickerResults"];

  if (!v52) {
    goto LABEL_46;
  }
  uint64_t v53 = [v4 objectForKeyedSubscript:@"MovieHighlightScoreResults"];
  BOOL v54 = [(VCPProtoAssetAnalysis *)self setResults:v53 withClass:objc_opt_class() forPropertyKey:@"movieHighlightScoreResults"];

  if (!v54) {
    goto LABEL_46;
  }
  uint64_t v55 = [v4 objectForKeyedSubscript:@"MovieHighlightResults"];
  BOOL v56 = [(VCPProtoAssetAnalysis *)self setResults:v55 withClass:objc_opt_class() forPropertyKey:@"movieHighlightResults"];

  if (!v56) {
    goto LABEL_46;
  }
  uint64_t v57 = [v4 objectForKeyedSubscript:@"HumanPoseResults"];
  BOOL v58 = [(VCPProtoAssetAnalysis *)self setResults:v57 withClass:objc_opt_class() forPropertyKey:@"movieHumanPoseResults"];

  if (!v58) {
    goto LABEL_46;
  }
  uint64_t v59 = [v4 objectForKeyedSubscript:@"ApplauseResults"];
  BOOL v60 = [(VCPProtoAssetAnalysis *)self setResults:v59 withClass:objc_opt_class() forPropertyKey:@"movieApplauseResults"];

  if (!v60) {
    goto LABEL_46;
  }
  id v61 = [v4 objectForKeyedSubscript:@"BabbleResults"];
  BOOL v62 = [(VCPProtoAssetAnalysis *)self setResults:v61 withClass:objc_opt_class() forPropertyKey:@"movieBabbleResults"];

  if (!v62) {
    goto LABEL_46;
  }
  uint64_t v63 = [v4 objectForKeyedSubscript:@"CheeringResults"];
  BOOL v64 = [(VCPProtoAssetAnalysis *)self setResults:v63 withClass:objc_opt_class() forPropertyKey:@"movieCheeringResults"];

  if (!v64) {
    goto LABEL_46;
  }
  uint64_t v65 = [v4 objectForKeyedSubscript:@"LaughterResults"];
  BOOL v66 = [(VCPProtoAssetAnalysis *)self setResults:v65 withClass:objc_opt_class() forPropertyKey:@"movieLaughterResults"];

  if (!v66) {
    goto LABEL_46;
  }
  uint64_t v67 = [v4 objectForKeyedSubscript:@"HumanActionResults"];
  BOOL v68 = [(VCPProtoAssetAnalysis *)self setResults:v67 withClass:objc_opt_class() forPropertyKey:@"movieHumanActionResults"];

  if (!v68) {
    goto LABEL_46;
  }
  uint64_t v69 = [v4 objectForKeyedSubscript:@"LoudnessResults"];
  BOOL v70 = [(VCPProtoAssetAnalysis *)self setResults:v69 withClass:objc_opt_class() forPropertyKey:@"movieLoudnessResults"];

  if (!v70) {
    goto LABEL_46;
  }
  id v71 = [v4 objectForKeyedSubscript:@"PetsFaceResults"];
  BOOL v72 = [(VCPProtoAssetAnalysis *)self setResults:v71 withClass:objc_opt_class() forPropertyKey:@"moviePetsFaceResults"];

  if (!v72) {
    goto LABEL_46;
  }
  uint64_t v73 = [v4 objectForKeyedSubscript:@"PetsResults"];
  BOOL v74 = [(VCPProtoAssetAnalysis *)self setResults:v73 withClass:objc_opt_class() forPropertyKey:@"moviePetsResults"];

  if (!v74) {
    goto LABEL_46;
  }
  uint64_t v75 = [v4 objectForKeyedSubscript:@"SafetyResults"];
  BOOL v76 = [(VCPProtoAssetAnalysis *)self setResults:v75 withClass:objc_opt_class() forPropertyKey:@"movieSafetyResults"];

  if (!v76) {
    goto LABEL_46;
  }
  uint64_t v77 = [v4 objectForKeyedSubscript:@"TorsoResults"];
  BOOL v78 = [(VCPProtoAssetAnalysis *)self setResults:v77 withClass:objc_opt_class() forPropertyKey:@"movieTorsoResults"];

  if (!v78) {
    goto LABEL_46;
  }
  uint64_t v79 = [v4 objectForKeyedSubscript:@"HumanActionClassificationResults"];
  BOOL v80 = [(VCPProtoAssetAnalysis *)self setResults:v79 withClass:objc_opt_class() forPropertyKey:@"movieHumanActionClassificationResults"];

  if (!v80) {
    goto LABEL_46;
  }
  id v81 = [v4 objectForKeyedSubscript:@"ImageEmbeddingResults"];
  BOOL v82 = [(VCPProtoAssetAnalysis *)self setResults:v81 withClass:objc_opt_class() forPropertyKey:@"imageEmbeddingResults"];

  if (!v82) {
    goto LABEL_46;
  }
  uint64_t v83 = [v4 objectForKeyedSubscript:@"VideoEmbeddingResults"];
  BOOL v84 = [(VCPProtoAssetAnalysis *)self setResults:v83 withClass:objc_opt_class() forPropertyKey:@"videoEmbeddingResults"];

  if (!v84) {
    goto LABEL_46;
  }
  uint64_t v85 = [v4 objectForKeyedSubscript:@"SummarizedEmbeddingResults"];
  BOOL v86 = [(VCPProtoAssetAnalysis *)self setResults:v85 withClass:objc_opt_class() forPropertyKey:@"summarizedEmbeddingResults"];

  if (!v86) {
    goto LABEL_46;
  }
  uint64_t v87 = [v4 objectForKeyedSubscript:@"AudioFusedVideoEmbeddingResults"];
  BOOL v88 = [(VCPProtoAssetAnalysis *)self setResults:v87 withClass:objc_opt_class() forPropertyKey:@"audioFusedVideoEmbeddingResults"];

  if (!v88) {
    goto LABEL_46;
  }
  uint64_t v89 = [v4 objectForKeyedSubscript:@"MiCaImageCaptionResults"];
  BOOL v90 = [(VCPProtoAssetAnalysis *)self setResults:v89 withClass:objc_opt_class() forPropertyKey:@"imageCaptionResults"];

  if (!v90) {
    goto LABEL_46;
  }
  id v91 = [v4 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];
  BOOL v92 = [(VCPProtoAssetAnalysis *)self setResults:v91 withClass:objc_opt_class() forPropertyKey:@"videoCaptionResults"];

  if (v92)
  {
    uint64_t v93 = [v4 objectForKeyedSubscript:@"VideoSegmentCaptionResults"];
    BOOL v94 = [(VCPProtoAssetAnalysis *)self setResults:v93 withClass:objc_opt_class() forPropertyKey:@"videoSegmentCaptionResults"];
  }
  else
  {
LABEL_46:
    BOOL v94 = 0;
  }

  return v94;
}

+ (id)imageAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      BOOL v8 = 0;
      goto LABEL_19;
    }
    VCPLogInstance();
    uint64_t v7 = (VCPProtoAssetAnalysis *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, &v7->super.super, OS_LOG_TYPE_ERROR, "[LegacyDict->ImageProto] No cloud identifier; skipping",
        buf,
        2u);
    }
    goto LABEL_17;
  }
  uint64_t v7 = objc_alloc_init(VCPProtoAssetAnalysis);
  [(VCPProtoAssetAnalysis *)v7 setAssetCloudIdentifier:v6];
  if (![(VCPProtoAssetAnalysis *)v7 setAttributesFromLegacyDictionary:v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = 0;
        BOOL v10 = "[LegacyDict->ImageProto] Invalid attribute; skipping";
        BOOL v11 = (uint8_t *)&v14;
LABEL_15:
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      }
LABEL_16:
    }
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  if (![(VCPProtoAssetAnalysis *)v7 setImageAnalysisFromLegacyDictionary:v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = 0;
        BOOL v10 = "[LegacyDict->ImageProto] Invalid analysis; skipping";
        BOOL v11 = (uint8_t *)&v13;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v7;
  BOOL v8 = v7;
LABEL_18:

LABEL_19:
  return v8;
}

+ (id)movieAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      BOOL v8 = 0;
      goto LABEL_19;
    }
    VCPLogInstance();
    uint64_t v7 = (VCPProtoAssetAnalysis *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, &v7->super.super, OS_LOG_TYPE_ERROR, "[LegacyDict->MovieProto] No cloud identifier; skipping",
        buf,
        2u);
    }
    goto LABEL_17;
  }
  uint64_t v7 = objc_alloc_init(VCPProtoAssetAnalysis);
  [(VCPProtoAssetAnalysis *)v7 setAssetCloudIdentifier:v6];
  if (![(VCPProtoAssetAnalysis *)v7 setAttributesFromLegacyDictionary:v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = 0;
        BOOL v10 = "[LegacyDict->MovieProto] Invalid attribute; skipping";
        BOOL v11 = (uint8_t *)&v14;
LABEL_15:
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      }
LABEL_16:
    }
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  if (![(VCPProtoAssetAnalysis *)v7 setMovieAnalysisFromLegacyDictionary:v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = 0;
        BOOL v10 = "[LegacyDict->MovieProto] Invalid analysis; skipping";
        BOOL v11 = (uint8_t *)&v13;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v7;
  BOOL v8 = v7;
LABEL_18:

LABEL_19:
  return v8;
}

+ (id)imageAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  if ([(VCPProtoAssetAnalysis *)v4 setAttributesFromLegacyDictionary:v3])
  {
    if ([(VCPProtoAssetAnalysis *)v4 setImageAnalysisFromLegacyDictionary:v3])
    {
      id v5 = v4;
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = 0;
        uint64_t v7 = "[LegacyDict->ImageProto] Invalid analysis; skipping";
        BOOL v8 = (uint8_t *)&v10;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      uint64_t v7 = "[LegacyDict->ImageProto] Invalid attribute; skipping";
      BOOL v8 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    }
LABEL_11:
  }
  id v5 = 0;
LABEL_13:

  return v5;
}

+ (id)movieAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  if ([(VCPProtoAssetAnalysis *)v4 setAttributesFromLegacyDictionary:v3])
  {
    if ([(VCPProtoAssetAnalysis *)v4 setMovieAnalysisFromLegacyDictionary:v3])
    {
      id v5 = v4;
      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = 0;
        uint64_t v7 = "[LegacyDict->MovieProto] Invalid analysis; skipping";
        BOOL v8 = (uint8_t *)&v10;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      uint64_t v7 = "[LegacyDict->MovieProto] Invalid attribute; skipping";
      BOOL v8 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    }
LABEL_11:
  }
  id v5 = 0;
LABEL_13:

  return v5;
}

+ (id)filesystemMovieAnalysisFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  id v5 = [v3 objectForKeyedSubscript:@"metadataRanges"];
  id v6 = [v5 objectForKeyedSubscript:@"ClassificationResults"];
  BOOL v7 = [(VCPProtoAssetAnalysis *)v4 setResults:v6 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieClassificationResults"];

  if (!v7) {
    goto LABEL_10;
  }
  BOOL v8 = [v5 objectForKeyedSubscript:@"HumanActionClassificationResults"];
  BOOL v9 = [(VCPProtoAssetAnalysis *)v4 setResults:v8 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieHumanActionClassificationResults"];

  if (!v9) {
    goto LABEL_10;
  }
  __int16 v10 = [v5 objectForKeyedSubscript:@"ApplauseResults"];
  BOOL v11 = [(VCPProtoAssetAnalysis *)v4 setResults:v10 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieApplauseResults"];

  if (!v11) {
    goto LABEL_10;
  }
  BOOL v12 = [v5 objectForKeyedSubscript:@"BabbleResults"];
  BOOL v13 = [(VCPProtoAssetAnalysis *)v4 setResults:v12 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieBabbleResults"];

  if (!v13) {
    goto LABEL_10;
  }
  __int16 v14 = [v5 objectForKeyedSubscript:@"CheeringResults"];
  BOOL v15 = [(VCPProtoAssetAnalysis *)v4 setResults:v14 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieCheeringResults"];

  if (!v15) {
    goto LABEL_10;
  }
  BOOL v16 = [v5 objectForKeyedSubscript:@"LaughterResults"];
  BOOL v17 = [(VCPProtoAssetAnalysis *)v4 setResults:v16 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieLaughterResults"];

  if (!v17) {
    goto LABEL_10;
  }
  BOOL v18 = [v5 objectForKeyedSubscript:@"MusicResults"];
  BOOL v19 = [(VCPProtoAssetAnalysis *)v4 setResults:v18 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieMusicResults"];

  if (!v19) {
    goto LABEL_10;
  }
  BOOL v20 = [v5 objectForKeyedSubscript:@"VoiceResults"];
  BOOL v21 = [(VCPProtoAssetAnalysis *)v4 setResults:v20 withClass:objc_opt_class() forPropertyKey:@"filesystemMovieVoiceResults"];

  if (v21) {
    BOOL v22 = v4;
  }
  else {
LABEL_10:
  }
    BOOL v22 = 0;

  return v22;
}

- (BOOL)exportResultsWithPropertyKey:(id)a3 toLegacyDictionary:(id)a4 withKey:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl()
    && (+[VCPProtoAssetAnalysis faceResultKeys],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 containsObject:v8],
        v11,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    __int16 v14 = [(VCPProtoAssetAnalysis *)self valueForKey:v8];
    if ([v14 count])
    {
      BOOL v15 = [MEMORY[0x1E4F1CA48] array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v16);
            }
            BOOL v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "exportToLegacyDictionary", (void)v23);
            if (!v20)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                BOOL v21 = VCPLogInstance();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v28 = v8;
                  _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[Proto->LegacyDict] Failed to export entry from property %@", buf, 0xCu);
                }
              }
              BOOL v13 = 0;
              goto LABEL_19;
            }
            [v15 addObject:v20];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      [v9 setObject:v15 forKeyedSubscript:v10];
      BOOL v13 = 1;
LABEL_19:
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  return v13;
}

- (id)exportFilesystemAnalysisToLegacyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (-[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieClassificationResults", v3, @"ClassificationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieHumanActionClassificationResults", v3, @"HumanActionClassificationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieApplauseResults", v3, @"ApplauseResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"filesystemMovieBabbleResults",
         v3,
         @"BabbleResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieCheeringResults", v3, @"CheeringResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieLaughterResults", v3, @"LaughterResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"filesystemMovieMusicResults", v3, @"MusicResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"filesystemMovieVoiceResults",
         v3,
         @"VoiceResults"))
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis version](self, "version"));
    [v4 setObject:v5 forKeyedSubscript:@"version"];

    if ([(VCPProtoAssetAnalysis *)self hasTypesWide]) {
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis typesWide](self, "typesWide"));
    }
    else {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis types](self, "types"));
    }
    [v4 setObject:v6 forKeyedSubscript:@"performedAnalysisTypes"];

    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis flags](self, "flags"));
    [v4 setObject:v8 forKeyedSubscript:@"flags"];

    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(VCPProtoAssetAnalysis *)self date];
    id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    [v4 setObject:v10 forKeyedSubscript:@"dateAnalyzed"];

    BOOL v11 = (void *)MEMORY[0x1E4F1C9C8];
    [(VCPProtoAssetAnalysis *)self assetModificationDate];
    char v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    [v4 setObject:v12 forKeyedSubscript:@"dateModified"];

    if ([(VCPProtoAssetAnalysis *)self hasQuality])
    {
      BOOL v13 = NSNumber;
      [(VCPProtoAssetAnalysis *)self quality];
      __int16 v14 = objc_msgSend(v13, "numberWithDouble:");
      [v4 setObject:v14 forKeyedSubscript:@"quality"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasStatsFlags])
    {
      BOOL v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis statsFlags](self, "statsFlags"));
      [v4 setObject:v15 forKeyedSubscript:@"statsFlags"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasAssetMasterFingerprint])
    {
      id v16 = [(VCPProtoAssetAnalysis *)self assetMasterFingerprint];
      [v4 setObject:v16 forKeyedSubscript:@"masterFingerprint"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasAssetAdjustedFingerprint])
    {
      uint64_t v17 = [(VCPProtoAssetAnalysis *)self assetAdjustedFingerprint];
      [v4 setObject:v17 forKeyedSubscript:@"adjustedFingerprint"];
    }
    if ([v3 count]) {
      [v4 setObject:v3 forKeyedSubscript:@"metadataRanges"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (-[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageBlurResults", v3, @"BlurResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageCompositionResults", v3, @"CompositionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageExposureResults", v3, @"ExposureResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"imageFaceResults",
         v3,
         @"FaceResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageFeatureResults", v3, @"FeatureVectorResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageJunkResults", v3, @"JunkResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imagePetsResults", v3, @"PetsResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"imagePetsFaceResults",
         v3,
         @"PetsFaceResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageSaliencyResults", v3, @"SaliencyResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageSceneprintResults", v3, @"SceneprintResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageShotTypeResults", v3, @"ShotTypeResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"imageHumanPoseResults",
         v3,
         @"HumanPoseResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoRecommendationResults", v3, @"IrisRecommendResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoSharpnessResults", v3, @"IrisSharpnessResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoHumanActionClassificationResults", v3)&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"livePhotoEffectsResults",
         v3,
         @"LivePhotoEffectsResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoKeyFrameResults", v3, @"KeyFrameResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoKeyFrameStillResults", v3, @"KeyFrameStillResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"livePhotoSettlingEffectGatingResults", v3, @"SettlingEffectsGatingResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieActivityLevelResults",
         v3,
         @"ActivityLevelResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieCameraMotionResults", v3, @"CameraMotionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieClassificationResults", v3, @"ClassificationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieFaceResults", v3, @"FaceResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieFaceprintResults",
         v3,
         @"FacePrintResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieFeatureResults", v3, @"FeatureVectorResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieFineSubjectMotionResults", v3, @"FineSubjectMotionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieInterestingnessResults", v3, @"InterestingnessResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieMovingObjectResults",
         v3,
         @"MovingObjectsResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieMusicResults", v3, @"MusicResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieObstructionResults", v3, @"ObstructionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieOrientationResults", v3, @"OrientationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"moviePreEncodeResults",
         v3,
         @"PreEncodeResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieQualityResults", v3, @"QualityResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieSaliencyResults", v3, @"SaliencyResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieSceneResults", v3, @"SceneResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieSceneprintResults",
         v3,
         @"SceneprintResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieSubjectMotionResults", v3, @"SubjectMotionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieSubtleMotionResults", v3, @"SubtleMotionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieUtteranceResults", v3, @"UtteranceResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieVoiceResults",
         v3,
         @"VoiceResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"animatedStickerResults", v3, @"AnimatedStickerResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieSummaryResults", v3, @"MovieSummaryResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieHighlightScoreResults", v3, @"MovieHighlightScoreResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieHighlightResults",
         v3,
         @"MovieHighlightResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieHumanPoseResults", v3, @"HumanPoseResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieApplauseResults", v3, @"ApplauseResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieAudioQualityResults", v3, @"AudioQualityResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieBabbleResults",
         v3,
         @"BabbleResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieCheeringResults", v3, @"CheeringResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieLaughterResults", v3, @"LaughterResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieHumanActionResults", v3, @"HumanActionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieLoudnessResults",
         v3,
         @"LoudnessResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"moviePetsFaceResults", v3, @"PetsFaceResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"moviePetsResults", v3, @"PetsResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieStabilizationResults", v3, @"VideoStabilizationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"movieSafetyResults",
         v3,
         @"SafetyResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieTorsoResults", v3, @"TorsoResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"movieHumanActionClassificationResults", v3, @"HumanActionClassificationResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageEmbeddingResults", v3, @"ImageEmbeddingResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"videoEmbeddingResults",
         v3,
         @"VideoEmbeddingResults")
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"summarizedEmbeddingResults", v3, @"SummarizedEmbeddingResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"audioFusedVideoEmbeddingResults", v3, @"AudioFusedVideoEmbeddingResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", @"imageCaptionResults", v3, @"MiCaImageCaptionResults")&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         @"videoCaptionResults",
         v3,
         @"MiCaVideoCaptionResults")
    && [(VCPProtoAssetAnalysis *)self exportResultsWithPropertyKey:@"videoCaptionPreferenceResults" toLegacyDictionary:v3 withKey:@"VideoCaptionPreferenceResults"]&& [(VCPProtoAssetAnalysis *)self exportResultsWithPropertyKey:@"videoSegmentCaptionResults" toLegacyDictionary:v3 withKey:@"VideoSegmentCaptionResults"])
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis version](self, "version"));
    [v4 setObject:v5 forKeyedSubscript:@"version"];

    if ([(VCPProtoAssetAnalysis *)self hasTypesWide]) {
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis typesWide](self, "typesWide"));
    }
    else {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis types](self, "types"));
    }
    [v4 setObject:v6 forKeyedSubscript:@"performedAnalysisTypes"];

    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis flags](self, "flags"));
    [v4 setObject:v8 forKeyedSubscript:@"flags"];

    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(VCPProtoAssetAnalysis *)self date];
    id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    [v4 setObject:v10 forKeyedSubscript:@"dateAnalyzed"];

    BOOL v11 = (void *)MEMORY[0x1E4F1C9C8];
    [(VCPProtoAssetAnalysis *)self assetModificationDate];
    char v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    [v4 setObject:v12 forKeyedSubscript:@"dateModified"];

    if ([(VCPProtoAssetAnalysis *)self hasQuality])
    {
      BOOL v13 = NSNumber;
      [(VCPProtoAssetAnalysis *)self quality];
      __int16 v14 = objc_msgSend(v13, "numberWithDouble:");
      [v4 setObject:v14 forKeyedSubscript:@"quality"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasStatsFlags])
    {
      BOOL v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis statsFlags](self, "statsFlags"));
      [v4 setObject:v15 forKeyedSubscript:@"statsFlags"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasAssetMasterFingerprint])
    {
      id v16 = [(VCPProtoAssetAnalysis *)self assetMasterFingerprint];
      [v4 setObject:v16 forKeyedSubscript:@"masterFingerprint"];
    }
    if ([(VCPProtoAssetAnalysis *)self hasAssetAdjustedFingerprint])
    {
      uint64_t v17 = [(VCPProtoAssetAnalysis *)self assetAdjustedFingerprint];
      [v4 setObject:v17 forKeyedSubscript:@"adjustedFingerprint"];
    }
    if ([v3 count]) {
      [v4 setObject:v3 forKeyedSubscript:@"metadataRanges"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end