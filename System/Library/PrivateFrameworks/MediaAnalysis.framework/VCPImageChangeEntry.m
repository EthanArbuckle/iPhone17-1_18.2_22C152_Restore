@interface VCPImageChangeEntry
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime;
- ($9FD032E033150E04C1ADDF5B9E7893F9)animatedStickerTimeRange;
- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange;
- (BOOL)canPublishLivePhotoVariationSuggestion;
- (BOOL)imageOnly;
- (CGRect)bestPlaybackRect;
- (NSData)computeSyncPayload;
- (NSDictionary)humanActions;
- (NSSet)audioClassifications;
- (NSString)imageCaption;
- (NSString)videoCaption;
- (PHAsset)asset;
- (float)animatedStickerScore;
- (float)audioScore;
- (float)autoplayScore;
- (float)settlingEffectRankingScore;
- (float)settlingEffectScore;
- (int)imageEmbeddingVersion;
- (int)videoEmbeddingVersion;
- (signed)analysisStage;
- (signed)audioClassification;
- (signed)screenTimeDeviceImageSensitivity;
- (unint64_t)faceCount;
- (unint64_t)longExposureSuggestionState;
- (unint64_t)loopSuggestionState;
- (void)publish;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAnimatedStickerScore:(float)a3;
- (void)setAnimatedStickerTimeRange:(id *)a3;
- (void)setAsset:(id)a3;
- (void)setAudioClassification:(signed __int16)a3;
- (void)setAudioClassifications:(id)a3;
- (void)setAudioScore:(float)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setFaceCount:(unint64_t)a3;
- (void)setHumanActions:(id)a3;
- (void)setImageCaption:(id)a3;
- (void)setImageEmbeddingVersion:(int)a3;
- (void)setImageOnly:(BOOL)a3;
- (void)setKeyFrameTime:(id *)a3;
- (void)setLongExposureSuggestionState:(unint64_t)a3;
- (void)setLoopSuggestionState:(unint64_t)a3;
- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3;
- (void)setSettlingEffectRankingScore:(float)a3;
- (void)setSettlingEffectScore:(float)a3;
- (void)setSummaryTimeRange:(id *)a3;
- (void)setVideoCaption:(id)a3;
- (void)setVideoEmbeddingVersion:(int)a3;
@end

@implementation VCPImageChangeEntry

- (void)publish
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      v5 = [(PHAsset *)self->_asset localIdentifier];
      if ([(PHAsset *)self->_asset vcp_isLivePhoto]) {
        CFStringRef v6 = @"Live ";
      }
      else {
        CFStringRef v6 = &stru_10021F768;
      }
      unsigned int v7 = [(PHAsset *)self->_asset vcp_isLivePhoto];
      CFStringRef v8 = &stru_10021F768;
      if (v7 && self->_imageOnly) {
        CFStringRef v8 = @"(still image analysis)";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)v73 = v5;
      *(_WORD *)&v73[8] = 2112;
      *(void *)&v73[10] = v6;
      *(_WORD *)&v73[18] = 2112;
      CFStringRef v74 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Publishing %@Photo asset %@", buf, 0x20u);
    }
  }
  v61 = +[PHAssetChangeRequest changeRequestForAsset:self->_asset];
  v9 = +[MADStateHandler sharedStateHandler];
  v10 = [(PHAsset *)self->_asset localIdentifier];
  if ([(PHAsset *)self->_asset vcp_isLivePhoto]) {
    CFStringRef v11 = @"Live ";
  }
  else {
    CFStringRef v11 = &stru_10021F768;
  }
  unsigned int v12 = [(PHAsset *)self->_asset vcp_isLivePhoto];
  CFStringRef v13 = &stru_10021F768;
  if (v12 && self->_imageOnly) {
    CFStringRef v13 = @"(still image analysis)";
  }
  [v9 addBreadcrumb:@"[%@] Persisting 1 %@Photo asset %@", v10, v11, v13];

  v14 = v61;
  if (self->_imageCaption && +[VCPVideoCaptionAnalyzer mode] == (id)1)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        imageCaption = self->_imageCaption;
        v18 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)v73 = imageCaption;
        *(_WORD *)&v73[8] = 2112;
        *(void *)&v73[10] = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "publish image caption [%@] to photo asset %@", buf, 0x16u);
      }
      v14 = v61;
    }
    [v14 setGeneratedAssetDescription:self->_imageCaption analysisVersion:70 sourceType:1];
  }
  if (self->_videoCaption && +[VCPVideoCaptionAnalyzer mode] == (id)1)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v19, v20))
      {
        videoCaption = self->_videoCaption;
        v22 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)v73 = videoCaption;
        *(_WORD *)&v73[8] = 2112;
        *(void *)&v73[10] = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "publish video caption [%@] to photo asset %@", buf, 0x16u);
      }
      v14 = v61;
    }
    [v14 setGeneratedAssetDescription:self->_videoCaption analysisVersion:70 sourceType:2];
  }
  v23 = [(PHAsset *)self->_asset vcp_modificationDate];
  [v14 setMediaAnalysisTimeStamp:v23];

  v24 = v61;
  [v61 setMediaAnalysisImageVersion:70];
  if (([(PHAsset *)self->_asset vcp_isLivePhoto] & 1) == 0) {
    [v61 setMediaAnalysisVersion:70];
  }
  [v61 setFaceCount:self->_faceCount];
  int imageEmbeddingVersion = self->_imageEmbeddingVersion;
  if (imageEmbeddingVersion) {
    [v61 setImageEmbeddingVersion:(__int16)imageEmbeddingVersion];
  }
  int videoEmbeddingVersion = self->_videoEmbeddingVersion;
  if (videoEmbeddingVersion) {
    [v61 setVideoEmbeddingVersion:(__int16)videoEmbeddingVersion];
  }
  if ([(PHAsset *)self->_asset vcp_isLivePhoto] && !self->_imageOnly)
  {
    [v61 setMediaAnalysisVersion:70];
    long long v27 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
    v70[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
    v70[1] = v27;
    v70[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
    [v61 setBestVideoTimeRange:v70];
    *(float *)&double v28 = self->_autoplayScore;
    [v61 setAutoplaySuggestionScore:v28];
    long long v29 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
    v69[0] = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
    v69[1] = v29;
    v69[2] = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
    [v61 setAnimatedStickerTimeRange:v69];
    *(float *)&double v30 = self->_animatedStickerScore;
    [v61 setVideoStickerSuggestionScore:v30];
    [v61 setAudioClassification:self->_audioClassification];
    *(float *)&double v31 = self->_audioScore;
    [v61 setAudioScore:v31];
    *(float *)&double v32 = self->_settlingEffectScore;
    [v61 setSettlingEffectScore:v32];
    *(float *)&double v33 = self->_settlingEffectRankingScore;
    [v61 setActivityScore:v33];
    [v61 setScreenTimeDeviceImageSensitivity:self->_screenTimeDeviceImageSensitivity];
    objc_msgSend(v61, "setBestPlaybackRectWithNormalizedRect:", self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height);
    if ([(VCPImageChangeEntry *)self canPublishLivePhotoVariationSuggestion])
    {
      [v61 setVariationSuggestionStates:self->_loopSuggestionState forVariationType:1];
      [v61 setVariationSuggestionStates:self->_longExposureSuggestionState forVariationType:3];
    }
    if (self->_audioClassifications)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v34 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v34, v35))
        {
          unsigned int v36 = [(NSSet *)self->_audioClassifications count];
          v37 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v73 = v36;
          *(_WORD *)&v73[4] = 2112;
          *(void *)&v73[6] = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "publish %d audio classifications to livephoto %@", buf, 0x12u);
        }
        v24 = v61;
      }
      audioClassifications = self->_audioClassifications;
      __int16 v39 = VCPPhotosSceneProcessingVersionInternal();
      v40 = [(PHAsset *)self->_asset adjustmentVersion];
      [v24 setSceneClassifications:audioClassifications ofType:3 version:v39 timestamp:v40];
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obj = self->_humanActions;
  id v41 = [(NSDictionary *)obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v66;
    os_log_type_t v62 = VCPLogToOSLogType[7];
    os_log_type_t type = VCPLogToOSLogType[6];
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obj);
        }
        v44 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v45 = +[PHFaceChangeRequest changeRequestForFace:v44];
        v46 = [(NSDictionary *)self->_humanActions objectForKeyedSubscript:v44];
        BOOL v47 = [v46 count] == 0;

        if (v47)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v52 = VCPLogInstance();
            if (os_log_type_enabled(v52, v62))
            {
              v53 = [(PHAsset *)self->_asset localIdentifier];
              v54 = [v44 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)v73 = v53;
              *(_WORD *)&v73[8] = 2112;
              *(void *)&v73[10] = v54;
              _os_log_impl((void *)&_mh_execute_header, v52, v62, "   [%@] reset action traits for PHFace %@", buf, 0x16u);
            }
          }
          [v45 setDetectionTraits:0];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, type))
            {
              v49 = [(PHAsset *)self->_asset localIdentifier];
              v50 = [v44 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)v73 = v49;
              *(_WORD *)&v73[8] = 2112;
              *(void *)&v73[10] = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, type, "   [%@] publish action traits for PHFace %@", buf, 0x16u);
            }
          }
          v51 = [(NSDictionary *)self->_humanActions objectForKeyedSubscript:v44];
          [v45 setDetectionTraits:v51];
        }
      }
      id v41 = [(NSDictionary *)obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v41);
  }

  v55 = v61;
  if (!self->_imageOnly || ([(PHAsset *)self->_asset vcp_isLivePhoto] & 1) == 0)
  {
    if ([(PHAsset *)self->_asset mad_isEligibleForComputeSync])
    {
      objc_msgSend(v61, "setLocalAnalysisStage:", -[PHAsset mad_analysisStageAfterCompletingAnalysis:](self->_asset, "mad_analysisStageAfterCompletingAnalysis:", 1));
      [v61 setComputeSyncMediaAnalysisPayload:self->_computeSyncPayload];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v56 = VCPLogInstance();
        os_log_type_t v57 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v56, v57))
        {
          v58 = [(PHAsset *)self->_asset localIdentifier];
          int analysisStage = self->_analysisStage;
          unsigned int v60 = [(NSData *)self->_computeSyncPayload length];
          *(_DWORD *)buf = 138412802;
          *(void *)v73 = v58;
          *(_WORD *)&v73[8] = 1024;
          *(_DWORD *)&v73[10] = analysisStage;
          *(_WORD *)&v73[14] = 1024;
          *(_DWORD *)&v73[16] = v60;
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "[%@] publish analysis stage (%d) and compute sync payload (%d bytes)", buf, 0x18u);
        }
        v55 = v61;
      }
    }
  }
}

- (BOOL)canPublishLivePhotoVariationSuggestion
{
  id v3 = [(PHAsset *)self->_asset variationSuggestionStatesForVariationType:1];
  id v4 = [(PHAsset *)self->_asset variationSuggestionStatesForVariationType:3];
  unint64_t loopSuggestionState = self->_loopSuggestionState;
  BOOL result = 0;
  if (v3 != (id)loopSuggestionState || v4 != self->_longExposureSuggestionState)
  {
    BOOL v6 = !v3 || v4 == 0;
    if (v6 || loopSuggestionState && self->_longExposureSuggestionState) {
      return 1;
    }
  }
  return result;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_faceCount = a3;
}

- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange
{
  long long v3 = *(_OWORD *)&self[4].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var3;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- ($9FD032E033150E04C1ADDF5B9E7893F9)animatedStickerTimeRange
{
  long long v3 = *(_OWORD *)&self[5].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var3;
  return self;
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.value = v3;
}

- (float)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(float)a3
{
  self->_animatedStickerScore = a3;
}

- (unint64_t)loopSuggestionState
{
  return self->_loopSuggestionState;
}

- (void)setLoopSuggestionState:(unint64_t)a3
{
  self->_unint64_t loopSuggestionState = a3;
}

- (unint64_t)longExposureSuggestionState
{
  return self->_longExposureSuggestionState;
}

- (void)setLongExposureSuggestionState:(unint64_t)a3
{
  self->_longExposureSuggestionState = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setKeyFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_keyFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_keyFrameTime.value = v3;
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_audioClassification = a3;
}

- (NSSet)audioClassifications
{
  return self->_audioClassifications;
}

- (void)setAudioClassifications:(id)a3
{
}

- (float)audioScore
{
  return self->_audioScore;
}

- (void)setAudioScore:(float)a3
{
  self->_audioScore = a3;
}

- (float)settlingEffectScore
{
  return self->_settlingEffectScore;
}

- (void)setSettlingEffectScore:(float)a3
{
  self->_settlingEffectScore = a3;
}

- (float)settlingEffectRankingScore
{
  return self->_settlingEffectRankingScore;
}

- (void)setSettlingEffectRankingScore:(float)a3
{
  self->_settlingEffectRankingScore = a3;
}

- (CGRect)bestPlaybackRect
{
  double x = self->_bestPlaybackRect.origin.x;
  double y = self->_bestPlaybackRect.origin.y;
  double width = self->_bestPlaybackRect.size.width;
  double height = self->_bestPlaybackRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (NSDictionary)humanActions
{
  return self->_humanActions;
}

- (void)setHumanActions:(id)a3
{
}

- (signed)screenTimeDeviceImageSensitivity
{
  return self->_screenTimeDeviceImageSensitivity;
}

- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3
{
  self->_screenTimeDeviceImageSensitivitdouble y = a3;
}

- (NSString)imageCaption
{
  return self->_imageCaption;
}

- (void)setImageCaption:(id)a3
{
}

- (NSString)videoCaption
{
  return self->_videoCaption;
}

- (void)setVideoCaption:(id)a3
{
}

- (int)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(int)a3
{
  self->_int imageEmbeddingVersion = a3;
}

- (int)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setVideoEmbeddingVersion:(int)a3
{
  self->_int videoEmbeddingVersion = a3;
}

- (signed)analysisStage
{
  return self->_analysisStage;
}

- (void)setAnalysisStage:(signed __int16)a3
{
  self->_int analysisStage = a3;
}

- (NSData)computeSyncPayload
{
  return self->_computeSyncPayload;
}

- (void)setComputeSyncPayload:(id)a3
{
}

- (BOOL)imageOnly
{
  return self->_imageOnly;
}

- (void)setImageOnly:(BOOL)a3
{
  self->_imageOnldouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSyncPayload, 0);
  objc_storeStrong((id *)&self->_videoCaption, 0);
  objc_storeStrong((id *)&self->_imageCaption, 0);
  objc_storeStrong((id *)&self->_humanActions, 0);
  objc_storeStrong((id *)&self->_audioClassifications, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end