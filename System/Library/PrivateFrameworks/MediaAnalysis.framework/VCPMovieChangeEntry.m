@interface VCPMovieChangeEntry
+ (BOOL)persistFullRangeSignals;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime;
- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange;
- (BOOL)imageOnly;
- (CGImage)keyFrameResource;
- (CGRect)bestPlaybackRect;
- (NSArray)facesToAdd;
- (NSData)computeSyncPayload;
- (NSDictionary)humanActions;
- (NSDictionary)humanActionsForFacesToAdd;
- (NSSet)audioClassifications;
- (NSSet)sceneClassifications;
- (NSString)imageCaption;
- (NSString)videoCaption;
- (PHAsset)asset;
- (float)activityScore;
- (float)autoplayScore;
- (float)videoScore;
- (int)imageEmbeddingVersion;
- (int)videoEmbeddingVersion;
- (signed)analysisStage;
- (signed)audioClassification;
- (signed)screenTimeDeviceImageSensitivity;
- (unint64_t)faceCount;
- (void)dealloc;
- (void)publish;
- (void)setActivityScore:(float)a3;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAsset:(id)a3;
- (void)setAudioClassification:(signed __int16)a3;
- (void)setAudioClassifications:(id)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setFaceCount:(unint64_t)a3;
- (void)setFacesToAdd:(id)a3;
- (void)setHumanActions:(id)a3;
- (void)setHumanActionsForFacesToAdd:(id)a3;
- (void)setImageCaption:(id)a3;
- (void)setImageEmbeddingVersion:(int)a3;
- (void)setImageOnly:(BOOL)a3;
- (void)setKeyFrameResource:(CGImage *)a3;
- (void)setKeyFrameTime:(id *)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3;
- (void)setSummaryTimeRange:(id *)a3;
- (void)setVideoCaption:(id)a3;
- (void)setVideoEmbeddingVersion:(int)a3;
- (void)setVideoScore:(float)a3;
@end

@implementation VCPMovieChangeEntry

+ (BOOL)persistFullRangeSignals
{
  return 0;
}

- (void)dealloc
{
  keyFrameResource = self->_keyFrameResource;
  if (keyFrameResource) {
    CFRelease(keyFrameResource);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPMovieChangeEntry;
  [(VCPMovieChangeEntry *)&v4 dealloc];
}

- (void)publish
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = [(PHAsset *)self->_asset localIdentifier];
      v6 = (void *)v5;
      if (self->_imageOnly) {
        CFStringRef v7 = @"(thumbnail analysis results)";
      }
      else {
        CFStringRef v7 = &stru_10021F768;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)v107 = v5;
      *(_WORD *)&v107[8] = 2112;
      *(void *)&v107[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Publishing Movie asset %@", buf, 0x16u);
    }
  }
  v8 = +[MADStateHandler sharedStateHandler];
  uint64_t v9 = [(PHAsset *)self->_asset localIdentifier];
  v10 = (void *)v9;
  if (self->_imageOnly) {
    CFStringRef v11 = @"(thumbnail analysis results)";
  }
  else {
    CFStringRef v11 = &stru_10021F768;
  }
  [v8 addBreadcrumb:@"[%@] Publishing Movie asset %@", v9, v11];

  BOOL v12 = !self->_imageOnly;
  v85 = +[PHAssetChangeRequest changeRequestForAsset:self->_asset];
  if (!v12)
  {
    v13 = [(PHAsset *)self->_asset vcp_modificationDate];
    [v85 setMediaAnalysisTimeStamp:v13];

    [v85 setMediaAnalysisImageVersion:(__int16)MediaAnalysisVersion];
    if (self->_imageCaption && +[VCPVideoCaptionAnalyzer mode] == (id)1)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v14 = VCPLogInstance();
        os_log_type_t v15 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v14, v15))
        {
          v16 = [(PHAsset *)self->_asset localIdentifier];
          imageCaption = self->_imageCaption;
          *(_DWORD *)buf = 138412546;
          *(void *)v107 = v16;
          *(_WORD *)&v107[8] = 2112;
          *(void *)&v107[10] = imageCaption;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@] Publish image caption [%@]", buf, 0x16u);
        }
      }
      [v85 setGeneratedAssetDescription:self->_imageCaption analysisVersion:70 sourceType:1];
    }
    int imageEmbeddingVersion = self->_imageEmbeddingVersion;
    if (imageEmbeddingVersion) {
      [v85 setImageEmbeddingVersion:(__int16)imageEmbeddingVersion];
    }
    goto LABEL_90;
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
        *(void *)v107 = videoCaption;
        *(_WORD *)&v107[8] = 2112;
        *(void *)&v107[10] = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "publish video caption [%@] to movie %@", buf, 0x16u);
      }
    }
    [v85 setGeneratedAssetDescription:self->_videoCaption analysisVersion:70 sourceType:2];
  }
  int videoEmbeddingVersion = self->_videoEmbeddingVersion;
  if (videoEmbeddingVersion) {
    [v85 setVideoEmbeddingVersion:(__int16)videoEmbeddingVersion];
  }
  v24 = [(PHAsset *)self->_asset vcp_modificationDate];
  [v85 setMediaAnalysisTimeStamp:v24];

  [v85 setMediaAnalysisVersion:70];
  [v85 setMediaAnalysisImageVersion:70];
  long long v25 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
  v105[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
  v105[1] = v25;
  v105[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
  [v85 setBestVideoTimeRange:v105];
  *(float *)&double v26 = self->_autoplayScore;
  [v85 setAutoplaySuggestionScore:v26];
  *(float *)&double v27 = self->_videoScore;
  [v85 setVideoScore:v27];
  *(float *)&double v28 = self->_activityScore;
  [v85 setActivityScore:v28];
  [v85 setFaceCount:self->_faceCount];
  [v85 setAudioClassification:self->_audioClassification];
  [v85 setScreenTimeDeviceImageSensitivity:self->_screenTimeDeviceImageSensitivity];
  CMTime time = (CMTime)self->_keyFrameTime;
  if (CMTimeGetSeconds(&time) != 0.0)
  {
    keyFrameResource = self->_keyFrameResource;
    long long v102 = *(_OWORD *)&self->_keyFrameTime.value;
    int64_t epoch = self->_keyFrameTime.epoch;
    [v85 setBestKeyFrame:keyFrameResource time:&v102];
  }
  objc_msgSend(v85, "setBestPlaybackRectWithNormalizedRect:", self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  obj = self->_humanActions;
  id v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v98 objects:v110 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v99;
    os_log_type_t v32 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[7];
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v99 != v31) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        v35 = +[PHFaceChangeRequest changeRequestForFace:v34];
        v36 = [(NSDictionary *)self->_humanActions objectForKeyedSubscript:v34];
        BOOL v37 = [v36 count] == 0;

        if (v37)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, type))
            {
              v43 = [(PHAsset *)self->_asset localIdentifier];
              v44 = [v34 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)v107 = v43;
              *(_WORD *)&v107[8] = 2112;
              *(void *)&v107[10] = v44;
              _os_log_impl((void *)&_mh_execute_header, v42, type, "   [%@] reset action traits for PHFace %@", buf, 0x16u);
            }
          }
          [v35 setDetectionTraits:0];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v38 = VCPLogInstance();
            if (os_log_type_enabled(v38, v32))
            {
              v39 = [(PHAsset *)self->_asset localIdentifier];
              v40 = [v34 localIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)v107 = v39;
              *(_WORD *)&v107[8] = 2112;
              *(void *)&v107[10] = v40;
              _os_log_impl((void *)&_mh_execute_header, v38, v32, "   [%@] publish action traits for PHFace %@", buf, 0x16u);
            }
          }
          v41 = [(NSDictionary *)self->_humanActions objectForKeyedSubscript:v34];
          [v35 setDetectionTraits:v41];
        }
      }
      id v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v98 objects:v110 count:16];
    }
    while (v30);
  }

  sceneClassifications = self->_sceneClassifications;
  if (sceneClassifications)
  {
    __int16 v46 = VCPPhotosSceneProcessingVersionInternal();
    v47 = [(PHAsset *)self->_asset adjustmentVersion];
    [v85 setSceneClassifications:sceneClassifications ofType:2 version:v46 timestamp:v47];
  }
  if (self->_audioClassifications
    && ([(PHAsset *)self->_asset mediaSubtypes] & 0x20000) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v48 = VCPLogInstance();
      os_log_type_t v49 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v48, v49))
      {
        unsigned int v50 = [(NSSet *)self->_audioClassifications count];
        v51 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v107 = v50;
        *(_WORD *)&v107[4] = 2112;
        *(void *)&v107[6] = v51;
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "publish %d audio classifications to movie %@", buf, 0x12u);
      }
    }
    audioClassifications = self->_audioClassifications;
    __int16 v53 = VCPPhotosSceneProcessingVersionInternal();
    v54 = [(PHAsset *)self->_asset adjustmentVersion];
    [v85 setSceneClassifications:audioClassifications ofType:3 version:v53 timestamp:v54];
  }
  if (self->_facesToAdd)
  {
    v89 = +[NSMutableArray array];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v88 = self->_facesToAdd;
    id v55 = [(NSArray *)v88 countByEnumeratingWithState:&v94 objects:v109 count:16];
    if (!v55) {
      goto LABEL_80;
    }
    *(void *)typea = 0;
    id obja = *(id *)v95;
    os_log_type_t v86 = VCPLogToOSLogType[3];
    os_log_type_t v87 = VCPLogToOSLogType[7];
    while (1)
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(id *)v95 != obja) {
          objc_enumerationMutation(v88);
        }
        uint64_t v57 = *(void *)(*((void *)&v94 + 1) + 8 * (void)j);
        v58 = +[PHFaceChangeRequest creationRequestForFace];
        v59 = [v58 placeholderForCreatedFace];
        if (!v59)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_78;
          }
          v69 = VCPLogInstance();
          if (os_log_type_enabled(v69, v86))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, v86, " VCPMovieChangeEntry failed to create faceChangRequest", buf, 2u);
          }
          goto LABEL_77;
        }
        [v58 setGroupingIdentifier:kVideoFaceGroupIdentifier];
        [v58 setFaceprint:v57];
        [v58 setDetectionType:1];
        v60 = [(PHAsset *)self->_asset faceAdjustmentVersion];
        [v58 setAdjustmentVersion:v60];

        if (_os_feature_enabled_impl()) {
          uint64_t v61 = 15;
        }
        else {
          uint64_t v61 = 11;
        }
        [v58 setFaceAlgorithmVersion:v61];
        [v58 setCenterX:0.5];
        [v58 setCenterY:0.5];
        [v58 setSize:0.5];
        [v58 setStartTime:0.0];
        [(PHAsset *)self->_asset duration];
        objc_msgSend(v58, "setDuration:");
        v62 = (char *)j + *(void *)typea;
        humanActionsForFacesToAdd = self->_humanActionsForFacesToAdd;
        v64 = +[NSNumber numberWithInt:(char *)j + *(void *)typea];
        v65 = [(NSDictionary *)humanActionsForFacesToAdd objectForKeyedSubscript:v64];
        LOBYTE(humanActionsForFacesToAdd) = v65 == 0;

        if ((humanActionsForFacesToAdd & 1) == 0)
        {
          v66 = self->_humanActionsForFacesToAdd;
          v67 = +[NSNumber numberWithInt:v62];
          v68 = [(NSDictionary *)v66 objectForKeyedSubscript:v67];
          [v58 setDetectionTraits:v68];
        }
        [v89 addObject:v59];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v69 = VCPLogInstance();
          if (os_log_type_enabled(v69, v87))
          {
            v70 = [v59 localIdentifier];
            v71 = [(PHAsset *)self->_asset localIdentifier];
            v72 = self->_humanActionsForFacesToAdd;
            v73 = +[NSNumber numberWithInt:v62];
            v74 = [(NSDictionary *)v72 objectForKeyedSubscript:v73];
            unsigned int v75 = [v74 count];
            *(_DWORD *)buf = 138412802;
            *(void *)v107 = v70;
            *(_WORD *)&v107[8] = 2112;
            *(void *)&v107[10] = v71;
            *(_WORD *)&v107[18] = 1024;
            unsigned int v108 = v75;
            _os_log_impl((void *)&_mh_execute_header, v69, v87, "Created new video PHFace [%@] for asset [%@], with %d traits", buf, 0x1Cu);
          }
LABEL_77:
        }
LABEL_78:
      }
      id v55 = [(NSArray *)v88 countByEnumeratingWithState:&v94 objects:v109 count:16];
      *(void *)typea = (*(_DWORD *)typea + j);
      if (!v55)
      {
LABEL_80:

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v76 = VCPLogInstance();
          os_log_type_t v77 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v76, v77))
          {
            unsigned int v78 = [v89 count];
            v79 = [(PHAsset *)self->_asset localIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v107 = v78;
            *(_WORD *)&v107[4] = 2112;
            *(void *)&v107[6] = v79;
            _os_log_impl((void *)&_mh_execute_header, v76, v77, "setFacesFromEntireVideo %d faces for asset [%@]", buf, 0x12u);
          }
        }
        [v85 setTemporalFaces:v89];

        break;
      }
    }
  }
  if ([(PHAsset *)self->_asset mad_isEligibleForComputeSync])
  {
    [v85 setLocalAnalysisStage:self->_analysisStage];
    [v85 setComputeSyncMediaAnalysisPayload:self->_computeSyncPayload];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v80 = VCPLogInstance();
      os_log_type_t v81 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v80, v81))
      {
        v82 = [(PHAsset *)self->_asset localIdentifier];
        int analysisStage = self->_analysisStage;
        unsigned int v84 = [(NSData *)self->_computeSyncPayload length];
        *(_DWORD *)buf = 138412802;
        *(void *)v107 = v82;
        *(_WORD *)&v107[8] = 1024;
        *(_DWORD *)&v107[10] = analysisStage;
        *(_WORD *)&v107[14] = 1024;
        *(_DWORD *)&v107[16] = v84;
        _os_log_impl((void *)&_mh_execute_header, v80, v81, "[%@] publish analysis stage (%d) and compute sync payload (%d bytes)", buf, 0x18u);
      }
    }
  }
LABEL_90:
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange
{
  long long v3 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var0;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.int64_t epoch = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setKeyFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_keyFrameTime.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_keyFrameTime.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (void)setVideoScore:(float)a3
{
  self->_videoScore = a3;
}

- (float)activityScore
{
  return self->_activityScore;
}

- (void)setActivityScore:(float)a3
{
  self->_activityScore = a3;
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_faceCount = a3;
}

- (CGImage)keyFrameResource
{
  return self->_keyFrameResource;
}

- (void)setKeyFrameResource:(CGImage *)a3
{
  self->_keyFrameResource = a3;
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

- (NSArray)facesToAdd
{
  return self->_facesToAdd;
}

- (void)setFacesToAdd:(id)a3
{
}

- (NSDictionary)humanActionsForFacesToAdd
{
  return self->_humanActionsForFacesToAdd;
}

- (void)setHumanActionsForFacesToAdd:(id)a3
{
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_audioClassification = a3;
}

- (NSDictionary)humanActions
{
  return self->_humanActions;
}

- (void)setHumanActions:(id)a3
{
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (NSSet)audioClassifications
{
  return self->_audioClassifications;
}

- (void)setAudioClassifications:(id)a3
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
  objc_storeStrong((id *)&self->_audioClassifications, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_humanActions, 0);
  objc_storeStrong((id *)&self->_humanActionsForFacesToAdd, 0);
  objc_storeStrong((id *)&self->_facesToAdd, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end