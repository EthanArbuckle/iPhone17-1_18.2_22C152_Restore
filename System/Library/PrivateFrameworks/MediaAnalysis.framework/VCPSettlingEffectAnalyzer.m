@interface VCPSettlingEffectAnalyzer
+ ($D854FC4CDD8DDEA9B2859E823A7C8A75)getSettlingEffectTimeRange:(SEL)a3 withOptions:(id)a4;
+ (BOOL)disableBurstFrameDropGating;
+ (BOOL)disableMetadataIntegrityCheck;
+ (BOOL)disableStillTransitionGating;
+ (BOOL)disableVideoQualityGating;
+ (id)getFramePTSList:(id)a3 before:(id *)a4 withOptions:(id)a5;
+ (id)getRetimingCurve;
+ (int64_t)getFRCQualityMode;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)adjustedTimeRange;
- (BOOL)cancelled;
- (BOOL)processAborted;
- (CGSize)getCleanApertureFrameSize:(id)a3;
- (CGSize)getFrameSize:(id)a3;
- (VCPSettlingEffectAnalyzer)initWithTimestamps:(id)a3 andTrack:(id)a4 andRecipe:(id)a5 withOptions:(id)a6;
- (__CVBuffer)resamplePixelBuffer:(__CVBuffer *)a3 cleanApertureRect:(CGRect)a4 cropRect:(CGRect)a5 homographyArray:(id)a6;
- (__CVBuffer)scaleStillImage:(__CVBuffer *)a3;
- (id)findLivePhotoInfoOutput:(id)a3;
- (id)getPixelBasedHomographies:(id)a3 withCleanApertureSize:(CGSize)a4;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)createLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 isInterpolated:(BOOL)a5 updatedSample:(opaqueCMSampleBuffer *)a6;
- (int)finishAnalysisPass:(id *)a3 withStillImageBuffer:(__CVBuffer *)a4;
- (int)setupLivePhotoInfoOutput:(id)a3;
- (void)dealloc;
- (void)setCancelled:(BOOL)a3;
@end

@implementation VCPSettlingEffectAnalyzer

+ (BOOL)disableVideoQualityGating
{
  return 0;
}

+ (BOOL)disableMetadataIntegrityCheck
{
  return 1;
}

+ (BOOL)disableStillTransitionGating
{
  return 0;
}

+ (BOOL)disableBurstFrameDropGating
{
  return 1;
}

+ (int64_t)getFRCQualityMode
{
  return 0;
}

- (VCPSettlingEffectAnalyzer)initWithTimestamps:(id)a3 andTrack:(id)a4 andRecipe:(id)a5 withOptions:(id)a6
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  id v10 = a4;
  id v114 = a5;
  id v115 = a6;
  v134.receiver = self;
  v134.super_class = (Class)VCPSettlingEffectAnalyzer;
  v11 = [(VCPSettlingEffectAnalyzer *)&v134 init];
  if (v11)
  {
    v112 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v112 fileExistsAtPath:@"/tmp/com.apple.mediaanalysisd/"])
    {
      id v111 = 0;
    }
    else
    {
      id v133 = 0;
      char v13 = [v112 createDirectoryAtPath:@"/tmp/com.apple.mediaanalysisd/" withIntermediateDirectories:1 attributes:0 error:&v133];
      id v111 = v133;
      if ((v13 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          v12 = 0;
LABEL_46:

          goto LABEL_47;
        }
        v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = [v111 description];
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v40;
          _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);
        }
        v12 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v109 = [v113 objectForKeyedSubscript:@"MetaAdjusterResults"];
    [v11 getFrameSize:v10];
    double v15 = v14;
    double v17 = v16;
    [v11 getCleanApertureFrameSize:v10];
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [MEMORY[0x1E4F61710] getUsageFromSizeWidth:(unint64_t)v15 height:(unint64_t)v17];
    if (!v114) {
      goto LABEL_43;
    }
    uint64_t v23 = v22;
    if (v22 == -1)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.start.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "Video resolution not supported", (uint8_t *)&buf, 2u);
        }
      }
      goto LABEL_43;
    }
    v11[360] = 0;
    v24 = [v115 objectForKeyedSubscript:@"UserInitiatedMode"];
    v11[320] = [v24 BOOLValue];

    v11[321] = 0;
    v11[322] = 0;
    v11[323] = 0;
    v11[324] = 0;
    *((_DWORD *)v11 + 82) = 0;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionary];
    v26 = (void *)*((void *)v11 + 42);
    *((void *)v11 + 42) = v25;

    [v10 nominalFrameRate];
    if (v27 >= 20.0) {
      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "Asset has low frame rate", (uint8_t *)&buf, 2u);
      }
    }
    v11[321] = 1;
    if (+[VCPSettlingEffectAnalyzer disableVideoQualityGating]|| v11[320])
    {
LABEL_15:
      v11[361] = 0;
      objc_storeStrong((id *)v11 + 21, a4);
      v29 = (void *)*((void *)v11 + 2);
      *((void *)v11 + 2) = 0;

      v30 = NSString;
      v31 = [MEMORY[0x1E4F29128] UUID];
      v32 = [v31 UUIDString];
      uint64_t v33 = [v30 stringWithFormat:@"%@frc-tmp-%@.MOV", @"/tmp/com.apple.mediaanalysisd/", v32];
      v34 = (void *)*((void *)v11 + 18);
      *((void *)v11 + 18) = v33;

      v35 = [v115 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        v42 = [v10 asset];
        v43 = v42;
        if (v42) {
          objc_msgSend(v42, "vcp_livePhotoStillDisplayTime");
        }
        else {
          memset(&buf, 0, 24);
        }
        CMTimeEpoch epoch = buf.start.epoch;
        *((_OWORD *)v11 + 6) = *(_OWORD *)&buf.start.value;
        *((void *)v11 + 14) = epoch;
      }
      else
      {
        CFDictionaryRef v37 = [v115 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
        CMTimeMakeFromDictionary(&buf.start, v37);
        CMTimeEpoch v38 = buf.start.epoch;
        *((_OWORD *)v11 + 6) = *(_OWORD *)&buf.start.value;
        *((void *)v11 + 14) = v38;
      }
      uint64_t v45 = *((void *)v11 + 14);
      long long v131 = *((_OWORD *)v11 + 6);
      uint64_t v132 = v45;
      uint64_t v46 = +[VCPSettlingEffectAnalyzer getFramePTSList:v10 before:&v131 withOptions:v115];
      v47 = (void *)*((void *)v11 + 23);
      *((void *)v11 + 23) = v46;

      if (![*((id *)v11 + 23) count]) {
        goto LABEL_43;
      }
      v48 = [v115 objectForKeyedSubscript:@"CustomRetimingCurve"];
      if (v48) {
        [v115 objectForKeyedSubscript:@"CustomRetimingCurve"];
      }
      else {
      v49 = +[VCPSettlingEffectAnalyzer getRetimingCurve];
      }
      objc_storeStrong((id *)v11 + 24, v49);

      unint64_t v50 = [*((id *)v11 + 23) count];
      if (v50 > [*((id *)v11 + 24) count])
      {
        *((void *)v11 + 5) = 0;
        objc_msgSend(*((id *)v11 + 23), "objectAtIndexedSubscript:", objc_msgSend(*((id *)v11 + 23), "count") - objc_msgSend(*((id *)v11 + 24), "count"));
        CFDictionaryRef v51 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&buf.start, v51);
        v52 = (long long *)(v11 + 48);
        CMTimeEpoch v53 = buf.start.epoch;
        *((_OWORD *)v11 + 3) = *(_OWORD *)&buf.start.value;
        *((void *)v11 + 8) = v53;

        CMTimeMakeWithSeconds(&buf.start, 0.0333333333, [v10 naturalTimeScale]);
        CMTimeEpoch v54 = buf.start.epoch;
        *(_OWORD *)(v11 + 120) = *(_OWORD *)&buf.start.value;
        *((void *)v11 + 17) = v54;
        id v55 = objc_alloc_init(MEMORY[0x1E4F61710]);
        v56 = (void *)*((void *)v11 + 1);
        *((void *)v11 + 1) = v55;

        if (*((void *)v11 + 1))
        {
          objc_msgSend(*((id *)v11 + 1), "setQualityMode:", +[VCPSettlingEffectAnalyzer getFRCQualityMode](VCPSettlingEffectAnalyzer, "getFRCQualityMode"));
          if (v10)
          {
            [v10 preferredTransform];
          }
          else
          {
            long long v129 = 0u;
            long long v130 = 0u;
            long long v128 = 0u;
          }
          v57 = (void *)*((void *)v11 + 1);
          v127[0] = v128;
          v127[1] = v129;
          v127[2] = v130;
          [v57 setPreferredTransform:v127];
          [*((id *)v11 + 1) setUseCase:1];
          [*((id *)v11 + 1) setGatingLevel:2 * v11[320]];
          if ([*((id *)v11 + 1) startSessionWithUsage:v23] == -22000)
          {
            long long v58 = *v52;
            start.CMTimeEpoch epoch = *((void *)v11 + 8);
            *(_OWORD *)&start.value = v58;
            long long v59 = *((_OWORD *)v11 + 6);
            lhs.CMTimeEpoch epoch = *((void *)v11 + 14);
            *(_OWORD *)&lhs.value = v59;
            long long v60 = *v52;
            rhs.CMTimeEpoch epoch = *((void *)v11 + 8);
            *(_OWORD *)&rhs.value = v60;
            CMTimeSubtract(&duration, &lhs, &rhs);
            CMTimeRangeMake(&buf, &start, &duration);
            long long v62 = *(_OWORD *)&buf.start.epoch;
            long long v61 = *(_OWORD *)&buf.duration.timescale;
            *(_OWORD *)(v11 + 364) = *(_OWORD *)&buf.start.value;
            *(_OWORD *)(v11 + 380) = v62;
            *(_OWORD *)(v11 + 396) = v61;
            id v63 = objc_alloc(MEMORY[0x1E4F16378]);
            v64 = [v10 asset];
            uint64_t v65 = [v63 initWithAsset:v64 error:0];
            v66 = (void *)*((void *)v11 + 19);
            *((void *)v11 + 19) = v65;

            v67 = (void *)*((void *)v11 + 19);
            long long v68 = *(_OWORD *)(v11 + 364);
            long long v69 = *(_OWORD *)(v11 + 396);
            v124[1] = *(_OWORD *)(v11 + 380);
            v124[2] = v69;
            v124[0] = v68;
            [v67 setTimeRange:v124];
            v70 = [v10 asset];
            LODWORD(v64) = [v11 setupLivePhotoInfoOutput:v70];

            if (!v64)
            {
              *((void *)v11 + 22) = 0;
              uint64_t v73 = objc_msgSend(v11, "getPixelBasedHomographies:withCleanApertureSize:", v114, v19, v21);
              v74 = (void *)*((void *)v11 + 25);
              *((void *)v11 + 25) = v73;

              CFDictionaryRef v75 = [*((id *)v11 + 25) objectForKeyedSubscript:*MEMORY[0x1E4F6F328]];
              CGRectMakeWithDictionaryRepresentation(v75, (CGRect *)v11 + 7);

              int32x2_t v76 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(*((float64x2_t *)v11 + 15))));
              v77.i64[0] = (int)(v76.i32[0] & 0xFFFFFFFE);
              v77.i64[1] = (int)(v76.i32[1] & 0xFFFFFFFE);
              *((float64x2_t *)v11 + 15) = vcvtq_f64_s64(v77);
              *((_OWORD *)v11 + 16) = *((_OWORD *)v11 + 15);
              v78 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*((void *)v11 + 18)];
              [v10 estimatedDataRate];
              uint64_t v80 = +[VCPMovieAssetWriter assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:](VCPMovieAssetWriter, "assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:", v78, v10, (uint64_t)v79, 0, *((double *)v11 + 32), *((double *)v11 + 33));
              v81 = (void *)*((void *)v11 + 3);
              *((void *)v11 + 3) = v80;

              v82 = (void *)*((void *)v11 + 3);
              if (v82)
              {
                if (![v82 dispatchEncoding])
                {
                  v83 = (void *)MEMORY[0x1E4F1E018];
                  v138[0] = *MEMORY[0x1E4F1E240];
                  v84 = [MEMORY[0x1E4F1CA98] null];
                  v138[1] = *MEMORY[0x1E4F1E1F0];
                  v139[0] = v84;
                  v139[1] = MEMORY[0x1E4F1CC38];
                  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:2];
                  uint64_t v86 = [v83 contextWithOptions:v85];
                  v87 = (void *)*((void *)v11 + 26);
                  *((void *)v11 + 26) = v86;

                  *((void *)v11 + 27) = 0;
                  BOOL v88 = +[VCPSettlingEffectAnalyzer disableBurstFrameDropGating];
                  v71 = v11;
                  if (!v88)
                  {
                    long long v122 = 0u;
                    long long v123 = 0u;
                    long long v121 = 0u;
                    long long v120 = 0u;
                    obunint64_t j = v109;
                    uint64_t v89 = [obj countByEnumeratingWithState:&v120 objects:v137 count:16];
                    if (v89)
                    {
                      uint64_t v90 = *(void *)v121;
                      do
                      {
                        for (uint64_t i = 0; i != v89; ++i)
                        {
                          if (*(void *)v121 != v90) {
                            objc_enumerationMutation(obj);
                          }
                          v92 = [*(id *)(*((void *)&v120 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
                          id v93 = objc_alloc_init(MEMORY[0x1E4F61720]);
                          CFDictionaryRef v94 = [v92 objectForKeyedSubscript:@"MetaItemPTSResultsKey"];
                          CMTimeMakeFromDictionary(&v119, v94);
                          CMTime v118 = v119;
                          [v93 setPresentationTimeStamp:&v118];

                          [v110 addObject:v93];
                        }
                        uint64_t v89 = [obj countByEnumeratingWithState:&v120 objects:v137 count:16];
                      }
                      while (v89);
                    }

                    id v95 = objc_alloc_init(MEMORY[0x1E4F61708]);
                    v96 = (void *)*((void *)v11 + 43);
                    *((void *)v11 + 43) = v95;

                    uint64_t v97 = [*((id *)v11 + 43) detectFrameDropsFromFrameTimingList:v110];
                    v98 = (void *)*((void *)v11 + 44);
                    *((void *)v11 + 44) = v97;

                    for (unint64_t j = 0; j < [*((id *)v11 + 44) count]; ++j)
                    {
                      long long v100 = *(_OWORD *)(v11 + 364);
                      long long v101 = *(_OWORD *)(v11 + 396);
                      *(_OWORD *)&range.start.CMTimeEpoch epoch = *(_OWORD *)(v11 + 380);
                      *(_OWORD *)&range.duration.timescale = v101;
                      *(_OWORD *)&range.start.value = v100;
                      v102 = [*((id *)v11 + 44) objectAtIndexedSubscript:j];
                      v103 = v102;
                      if (v102) {
                        [v102 presentationTimeStamp];
                      }
                      else {
                        memset(&time, 0, sizeof(time));
                      }
                      BOOL v104 = CMTimeRangeContainsTime(&range, &time) == 0;

                      if (!v104)
                      {
                        v105 = [*((id *)v11 + 44) objectAtIndexedSubscript:j];
                        BOOL v106 = [v105 frameIsAtBigGap] > 3;

                        if (v106)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 5)
                          {
                            v107 = VCPLogInstance();
                            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                            {
                              LOWORD(buf.start.value) = 0;
                              _os_log_impl(&dword_1BBEDA000, v107, OS_LOG_TYPE_DEFAULT, "Asset has burst frame drops", (uint8_t *)&buf, 2u);
                            }
                          }
                          v11[321] = 1;
                          if (!v11[320]) {
                            goto LABEL_71;
                          }
                        }
                      }
                    }
                    goto LABEL_72;
                  }
LABEL_44:
                  v12 = v71;

                  v39 = v110;
                  goto LABEL_45;
                }
              }
            }
          }
        }
LABEL_43:
        v71 = 0;
        v11[360] = 1;
        goto LABEL_44;
      }
      v11[325] = 1;
      v11[360] = 1;
    }
    else
    {
LABEL_71:
      v11[360] = 1;
      *((void *)v11 + 39) = 4;
    }
LABEL_72:
    v71 = v11;
    goto LABEL_44;
  }
  v12 = 0;
LABEL_47:

  return v12;
}

- (id)findLivePhotoInfoOutput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E4F15BE0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = *MEMORY[0x1E4F52790];
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "formatDescriptions", (void)v13);
        id v10 = [v9 firstObject];

        if (v10)
        {
          v11 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v10);
          if ([v11 containsObject:v6])
          {
            id v4 = v8;

            goto LABEL_13;
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (int)setupLivePhotoInfoOutput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VCPSettlingEffectAnalyzer *)self findLivePhotoInfoOutput:v4];
  uint64_t v6 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v5 outputSettings:0];
  livePhotoInfoOutput = self->_livePhotoInfoOutput;
  self->_livePhotoInfoOutput = v6;

  if ([(AVAssetReader *)self->_assetReader canAddOutput:self->_livePhotoInfoOutput])
  {
    [(AVAssetReader *)self->_assetReader addOutput:self->_livePhotoInfoOutput];
    if ([(AVAssetReader *)self->_assetReader startReading]) {
      int v8 = 0;
    }
    else {
      int v8 = -19;
    }
  }
  else
  {
    int v8 = -18;
  }

  return v8;
}

- (void)dealloc
{
  if ([(VCPMovieAssetWriter *)self->_assetWriter status] == 1) {
    [(VCPMovieAssetWriter *)self->_assetWriter cancel];
  }
  previousMetadata = self->_previousMetadata;
  if (previousMetadata)
  {
    CFRelease(previousMetadata);
    self->_previousMetadata = 0;
  }
  [(AVAssetReader *)self->_assetReader cancelReading];
  if (self->_processAborted)
  {
    frameInterpolator = self->_frameInterpolator;
    if (frameInterpolator)
    {
      if ([(FRCFrameInterpolator *)frameInterpolator state] == 2) {
        [(FRCFrameInterpolator *)self->_frameInterpolator endSession];
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPSettlingEffectAnalyzer;
  [(VCPSettlingEffectAnalyzer *)&v5 dealloc];
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C186D320](self, a2, a3, a4, a5, a6);
  if (self->_processAborted)
  {
LABEL_2:
    int v9 = 0;
    goto LABEL_3;
  }
  location = (id *)&self->_previousFrame;
  if (self->_previousFrame)
  {
    uint64_t v11 = [(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
    if (v11)
    {
      v12 = (void *)v11;
      while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v12))
      {
        CFRelease(v12);
        v12 = (void *)[(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
        if (!v12) {
          goto LABEL_9;
        }
      }
      v34 = (void *)MEMORY[0x1E4F6F340];
      v35 = [(NSDictionary *)self->_pixelBasedHomogrphies objectForKeyedSubscript:*MEMORY[0x1E4F6F340]];
      BOOL v36 = [v35 objectAtIndexedSubscript:self->_frameIdx];

      memset(&v139, 0, sizeof(v139));
      long long v123 = v36;
      CFDictionaryRef v37 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]];
      CMTimeMakeFromDictionary(&v139, v37);

      $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
      CMTime time2 = v139;
      if (CMTimeCompare((CMTime *)&buf, &time2))
      {
        self->_metadataIntegrityFailure = 1;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          CMTimeEpoch v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            int64_t var0 = a4->var0;
            LODWORD(buf.value) = 134218240;
            *(int64_t *)((char *)&buf.value + 4) = var0;
            LOWORD(buf.flags) = 2048;
            *(void *)((char *)&buf.flags + 2) = v139.value;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: %lld vs. %lld", (uint8_t *)&buf, 0x16u);
          }
        }
        $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        CMTime time2 = v139;
        if (CMTimeCompare((CMTime *)&buf, &time2) >= 1)
        {
          $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
          CMTime time2 = v139;
          CMTimeSubtract(&rhs, (CMTime *)&buf, &time2);
          CMTimeMake(&v138, 2, 600);
          $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
          CMTime time2 = v138;
          if (CMTimeCompare((CMTime *)&buf, &time2) > 0) {
            goto LABEL_67;
          }
        }
        $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        CMTime time2 = v139;
        if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
        {
          $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)v139;
          CMTime time2 = (CMTime)*a4;
          CMTimeSubtract(&v137, (CMTime *)&buf, &time2);
          CMTimeMake(&v136, 2, 600);
          $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)v137;
          CMTime time2 = v136;
          if (CMTimeCompare((CMTime *)&buf, &time2) > 0) {
            goto LABEL_67;
          }
        }
        if (!+[VCPSettlingEffectAnalyzer disableMetadataIntegrityCheck])
        {
LABEL_67:
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v65 = VCPLogInstance();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_INFO, "Live photo info and video frame timestamp difference exceeds threshold", (uint8_t *)&buf, 2u);
            }
          }
          self->_processAborted = 1;
          [(FRCFrameInterpolator *)self->_frameInterpolator endSession];
          [(VCPMovieAssetWriter *)self->_assetWriter cancel];

          goto LABEL_2;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: Relaxing threshold", (uint8_t *)&buf, 2u);
          }
        }
      }
      $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
      CMTime time2 = (CMTime)self->_settlingStartPTS;
      if (CMTimeCompare((CMTime *)&buf, &time2) <= 0)
      {
        buf.value = 0;
        double x = self->_cleanApertureRect.origin.x;
        double y = self->_cleanApertureRect.origin.y;
        double width = self->_cleanApertureRect.size.width;
        double height = self->_cleanApertureRect.size.height;
        double v55 = self->_cropRect.origin.x;
        double v56 = self->_cropRect.origin.y;
        double v58 = self->_cropRect.size.width;
        double v57 = self->_cropRect.size.height;
        long long v59 = [(NSDictionary *)self->_pixelBasedHomogrphies objectForKeyedSubscript:*v34];
        long long v60 = [v59 objectAtIndexedSubscript:self->_frameIdx];
        long long v61 = [v60 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]];
        value = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v61, x, y, width, height, v55, v56, v58, v57);
        time2.value = (CMTimeValue)value;
        if (buf.value)
        {
          CFRelease((CFTypeRef)buf.value);
          value = (__CVBuffer *)time2.value;
        }
        buf.value = (int64_t)value;
        time2.value = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&time2);

        ++self->_frameIdx;
        if (!buf.value)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v81 = VCPLogInstance();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              LOWORD(time2.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_ERROR, "Error creating stabilized video frame", (uint8_t *)&time2, 2u);
            }
          }
          p_$95D729B680665BEAEFA1D6FCA8238556 buf = (const void **)&buf;
          goto LABEL_85;
        }
        time2.value = 0;
        assetWriter = self->_assetWriter;
        uint64_t v64 = [*location buffer];
        if (*location) {
          [*location presentationTimeStamp];
        }
        else {
          memset(v135, 0, sizeof(v135));
        }
        int v9 = [(VCPMovieAssetWriter *)assetWriter addPixelBuffer:v64 withTime:v135 withAttachment:0];
        if (!v9)
        {
          previousMetadata = self->_previousMetadata;
          if (*location) {
            [*location presentationTimeStamp];
          }
          else {
            memset(v134, 0, sizeof(v134));
          }
          int v9 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:previousMetadata withTimestamp:v134 isInterpolated:0 updatedSample:&time2];
          if (!v9)
          {
            int v9 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:time2.value];
            if (!v9)
            {
              id v102 = objc_alloc(MEMORY[0x1E4F61700]);
              long long v132 = *(_OWORD *)&a4->var0;
              int64_t var3 = a4->var3;
              uint64_t v103 = [v102 initWithBuffer:buf.value presentationTimeStamp:&v132];
              id v104 = *location;
              id *location = (id)v103;

              int64_t v105 = a4->var3;
              *(_OWORD *)&self->_anchorPTS.value = *(_OWORD *)&a4->var0;
              self->_anchorPTS.int64_t epoch = v105;
              ++self->_anchorIndex;
              CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
              goto LABEL_35;
            }
          }
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        v44 = 0;
        id v43 = 0;
      }
      else
      {
        CFDictionaryRef v41 = [(NSArray *)self->_framePTSList objectAtIndexedSubscript:[(NSArray *)self->_framePTSList count] - 1];
        CMTimeMakeFromDictionary(&v138, v41);
        CMTimeMake(&v137, 2, 600);
        $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)v138;
        CMTime time2 = v137;
        CMTimeAdd(&rhs, (CMTime *)&buf, &time2);
        $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        CMTime time2 = rhs;
        BOOL v42 = CMTimeCompare((CMTime *)&buf, &time2) < 1;

        if (!v42)
        {
LABEL_35:
          id v43 = 0;
          v44 = 0;
LABEL_36:
          int v9 = 0;
LABEL_111:

          goto LABEL_3;
        }
        v136.value = 0;
        double v66 = self->_cleanApertureRect.origin.x;
        double v67 = self->_cleanApertureRect.origin.y;
        double v68 = self->_cleanApertureRect.size.width;
        double v69 = self->_cleanApertureRect.size.height;
        double v70 = self->_cropRect.origin.x;
        double v71 = self->_cropRect.origin.y;
        double v73 = self->_cropRect.size.width;
        double v72 = self->_cropRect.size.height;
        v74 = [(NSDictionary *)self->_pixelBasedHomogrphies objectForKeyedSubscript:*v34];
        CFDictionaryRef v75 = [v74 objectAtIndexedSubscript:self->_frameIdx];
        int32x2_t v76 = [v75 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]];
        int64x2_t v77 = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v76, v66, v67, v68, v69, v70, v71, v73, v72);
        buf.value = (int64_t)v77;
        if (v136.value)
        {
          CFRelease((CFTypeRef)v136.value);
          int64x2_t v77 = (__CVBuffer *)buf.value;
        }
        v136.value = (CMTimeValue)v77;
        buf.value = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);

        ++self->_frameIdx;
        CFTypeRef cf = 0;
        timingCurveIddouble x = self->_timingCurveIdx;
        if (timingCurveIdx > [(NSArray *)self->_timingCurveList count] - 1)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float v79 = VCPLogInstance();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v79, OS_LOG_TYPE_ERROR, "Inconsistency in frame timestamp list and decoded video frames", (uint8_t *)&buf, 2u);
            }
          }
          p_$95D729B680665BEAEFA1D6FCA8238556 buf = (const void **)&v136;
LABEL_85:
          CF<opaqueCMSampleBuffer *>::~CF(p_buf);
          v44 = 0;
          id v43 = 0;
          int v9 = -18;
          goto LABEL_110;
        }
        memset(&v138, 0, sizeof(v138));
        v82 = [(NSArray *)self->_timingCurveList objectAtIndexedSubscript:self->_timingCurveIdx];
        int v83 = [v82 count];
        $95D729B680665BEAEFA1D6FCA8238556 buf = self->_outputFrameDuration;
        p_outputFrameDuration = &self->_outputFrameDuration;
        CMTimeMultiply(&v138, (CMTime *)&buf, v83 + 1);

        id v84 = objc_alloc(MEMORY[0x1E4F61700]);
        CMTimeValue v85 = v136.value;
        $95D729B680665BEAEFA1D6FCA8238556 buf = self->_anchorPTS;
        p_anchorPTS = &self->_anchorPTS;
        CMTime time2 = v138;
        CMTimeAdd(&v131, (CMTime *)&buf, &time2);
        obunint64_t j = (id)[v84 initWithBuffer:v85 presentationTimeStamp:&v131];
        frameInterpolator = self->_frameInterpolator;
        id v87 = *location;
        BOOL v88 = [(NSArray *)self->_timingCurveList objectAtIndexedSubscript:self->_timingCurveIdx];
        id v130 = 0;
        v44 = [(FRCFrameInterpolator *)frameInterpolator interpolateBetweenFirstFrame:v87 secondFrame:obj timeScales:v88 withError:&v130];
        id v43 = v130;

        if ([v43 code] == -22006
          || (uint64_t v89 = [v44 count],
              -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx), uint64_t v90 = objc_claimAutoreleasedReturnValue(), v91 = v89 == [v90 count], v90, !v91))
        {
          self->_processAborted = 1;
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v97 = VCPLogInstance();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              v98 = [v43 localizedDescription];
              LODWORD(buf.value) = 138412290;
              *(int64_t *)((char *)&buf.value + 4) = (int64_t)v98;
              _os_log_impl(&dword_1BBEDA000, v97, OS_LOG_TYPE_INFO, "FRC gating not passed: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          [(FRCFrameInterpolator *)self->_frameInterpolator endSession];
          self->_FRCRecommendation = [(FRCFrameInterpolator *)self->_frameInterpolator recommendation];
          [(FRCFrameInterpolator *)self->_frameInterpolator sessionConfidence];
          self->_FRCConfidence = v99;
          long long v100 = [(FRCFrameInterpolator *)self->_frameInterpolator sessionStatistics];
          FRCStatistics = self->_FRCStatistics;
          self->_FRCStatistics = v100;

          self->_FRCGatingFailure = 1;
          [(VCPMovieAssetWriter *)self->_assetWriter cancel];

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&v136);
          goto LABEL_36;
        }
        uint64_t v92 = [v44 count];
        id v93 = self->_assetWriter;
        uint64_t v94 = [*location buffer];
        if (*location) {
          [*location presentationTimeStamp];
        }
        else {
          memset(v129, 0, sizeof(v129));
        }
        int v9 = [(VCPMovieAssetWriter *)v93 addPixelBuffer:v94 withTime:v129 withAttachment:0];
        if (v9) {
          goto LABEL_120;
        }
        BOOL v106 = self->_previousMetadata;
        if (*location) {
          [*location presentationTimeStamp];
        }
        else {
          memset(v128, 0, sizeof(v128));
        }
        int v9 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:v106 withTimestamp:v128 isInterpolated:0 updatedSample:&cf];
        if (v9
          || (int v9 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:cf]) != 0)
        {
LABEL_120:

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&v136);
          goto LABEL_110;
        }
        uint64_t v119 = v92;
        if (v92)
        {
          uint64_t v107 = 0;
          uint64_t v118 = *MEMORY[0x1E4F1F2B0];
          while (1)
          {
            uint64_t v145 = v118;
            uint64_t v146 = MEMORY[0x1E4F1CC38];
            v108 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1, v118);
            v109 = self->_assetWriter;
            v110 = [v44 objectAtIndexedSubscript:v107];
            uint64_t v111 = [v110 buffer];
            *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
            buf.int64_t epoch = self->_outputFrameDuration.epoch;
            uint64_t v112 = v107 + 1;
            CMTimeMultiply(&rhs, (CMTime *)&buf, v107 + 1);
            *(_OWORD *)&buf.value = *(_OWORD *)&p_anchorPTS->value;
            buf.int64_t epoch = self->_anchorPTS.epoch;
            CMTime time2 = rhs;
            CMTimeAdd(&v127, (CMTime *)&buf, &time2);
            int v9 = [(VCPMovieAssetWriter *)v109 addPixelBuffer:v111 withTime:&v127 withAttachment:v108];

            if (v9) {
              break;
            }
            id v113 = self->_previousMetadata;
            *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
            buf.int64_t epoch = self->_outputFrameDuration.epoch;
            CMTimeMultiply(&rhs, (CMTime *)&buf, v107 + 1);
            *(_OWORD *)&buf.value = *(_OWORD *)&p_anchorPTS->value;
            buf.int64_t epoch = self->_anchorPTS.epoch;
            CMTime time2 = rhs;
            CMTimeAdd(&v126, (CMTime *)&buf, &time2);
            int v9 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:v113 withTimestamp:&v126 isInterpolated:1 updatedSample:&cf];
            if (v9) {
              break;
            }
            int v9 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:cf];

            if (v9) {
              goto LABEL_120;
            }
            ++v107;
            if (v119 == v112) {
              goto LABEL_127;
            }
          }

          goto LABEL_120;
        }
LABEL_127:
        memset(&v137, 0, sizeof(v137));
        *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
        buf.int64_t epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v137, (CMTime *)&buf, v119 + 1);
        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
        time2.int64_t epoch = self->_anchorPTS.epoch;
        CMTime rhs = v137;
        CMTimeAdd((CMTime *)&buf, &time2, &rhs);
        *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&buf.value;
        self->_anchorPTS.int64_t epoch = buf.epoch;
        id v114 = [v44 objectAtIndexedSubscript:v119 - 1];
        id v115 = v114;
        if (v114) {
          [v114 presentationTimeStamp];
        }
        else {
          memset(&rhs, 0, sizeof(rhs));
        }
        $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
        time2.int64_t epoch = self->_anchorPTS.epoch;
        int32_t v116 = CMTimeCompare((CMTime *)&buf, &time2);

        if (v116 < 0)
        {
          objc_storeStrong(location, obj);
          v117 = self->_previousMetadata;
          if (v117)
          {
            CFRelease(v117);
            self->_previousMetadata = 0;
          }
          int v9 = 0;
          self->_previousMetadata = (opaqueCMSampleBuffer *)v12;
          ++self->_anchorIndex;
          ++self->_timingCurveIdx;
        }
        else
        {
          int v9 = -18;
        }

        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v136);
        if (v116 < 0) {
          goto LABEL_36;
        }
      }
LABEL_110:
      self->_processAborted = 1;
      CFRelease(v12);
      [(VCPMovieAssetWriter *)self->_assetWriter cancel];
      goto LABEL_111;
    }
LABEL_9:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Inconsistent number of metadata and video frames", (uint8_t *)&buf, 2u);
      }
    }
    int v9 = -18;
  }
  else
  {
    CMTimeMake((CMTime *)&buf, 0, 600);
    self->_anchorPTS = buf;
    CGRect CleanRect = CVImageBufferGetCleanRect(a3);
    double v14 = CleanRect.origin.x;
    double v15 = CleanRect.origin.y;
    double v16 = CleanRect.size.width;
    double v17 = CleanRect.size.height;
    self->_cleanApertureRect = CleanRect;
    CFTypeRef cf = 0;
    double v18 = self->_cropRect.origin.x;
    double v19 = self->_cropRect.origin.y;
    double v21 = self->_cropRect.size.width;
    double v20 = self->_cropRect.size.height;
    uint64_t v22 = (void *)MEMORY[0x1E4F6F340];
    uint64_t v23 = [(NSDictionary *)self->_pixelBasedHomogrphies objectForKeyedSubscript:*MEMORY[0x1E4F6F340]];
    v24 = [v23 objectAtIndexedSubscript:self->_frameIdx];
    uint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]];
    CFTypeRef cf = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v25, v14, v15, v16, v17, v18, v19, v21, v20);
    buf.value = 0;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);

    v26 = [(NSDictionary *)self->_pixelBasedHomogrphies objectForKeyedSubscript:*v22];
    float v27 = [v26 objectAtIndexedSubscript:self->_frameIdx];

    ++self->_frameIdx;
    if (cf)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F61700]);
      long long v140 = *(_OWORD *)&self->_anchorPTS.value;
      int64_t epoch = self->_anchorPTS.epoch;
      uint64_t v29 = [v28 initWithBuffer:cf presentationTimeStamp:&v140];
      id v30 = *location;
      id *location = (id)v29;

      self->_anchorIndedouble x = 0;
      while (1)
      {
        v31 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
        self->_previousMetadata = v31;
        if (!v31) {
          break;
        }
        CMItemCount NumSamples = CMSampleBufferGetNumSamples(v31);
        uint64_t v33 = self->_previousMetadata;
        if (NumSamples)
        {
          if (v33)
          {
            memset(&rhs, 0, sizeof(rhs));
            CFDictionaryRef v46 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]];
            CMTimeMakeFromDictionary(&rhs, v46);

            $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
            CMTime time2 = rhs;
            if (CMTimeCompare((CMTime *)&buf, &time2))
            {
              self->_metadataIntegrityFailure = 1;
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v47 = VCPLogInstance();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  int64_t v48 = a4->var0;
                  LODWORD(buf.value) = 134218240;
                  *(int64_t *)((char *)&buf.value + 4) = v48;
                  LOWORD(buf.flags) = 2048;
                  *(void *)((char *)&buf.flags + 2) = rhs.value;
                  _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: %lld vs. %lld", (uint8_t *)&buf, 0x16u);
                }
              }
              $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
              CMTime time2 = rhs;
              if (CMTimeCompare((CMTime *)&buf, &time2) >= 1)
              {
                $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
                CMTime time2 = rhs;
                CMTimeSubtract(&v139, (CMTime *)&buf, &time2);
                CMTimeMake(&v138, 2, 600);
                $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)v139;
                CMTime time2 = v138;
                if (CMTimeCompare((CMTime *)&buf, &time2) > 0) {
                  goto LABEL_91;
                }
              }
              $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
              CMTime time2 = rhs;
              if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
              {
                $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
                CMTime time2 = (CMTime)*a4;
                CMTimeSubtract(&v137, (CMTime *)&buf, &time2);
                CMTimeMake(&v136, 2, 600);
                $95D729B680665BEAEFA1D6FCA8238556 buf = ($95D729B680665BEAEFA1D6FCA8238556)v137;
                CMTime time2 = v136;
                if (CMTimeCompare((CMTime *)&buf, &time2) > 0) {
                  goto LABEL_91;
                }
              }
              if (!+[VCPSettlingEffectAnalyzer disableMetadataIntegrityCheck])
              {
LABEL_91:
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  id v95 = VCPLogInstance();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                  {
                    LOWORD(buf.value) = 0;
                    _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_INFO, "Live photo info and video frame timestamp difference exceeds threshold", (uint8_t *)&buf, 2u);
                  }
                }
                self->_processAborted = 1;
                [(FRCFrameInterpolator *)self->_frameInterpolator endSession];
                [(VCPMovieAssetWriter *)self->_assetWriter cancel];
              }
              else if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v49 = VCPLogInstance();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                {
                  LOWORD(buf.value) = 0;
                  _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: Relaxing threshold", (uint8_t *)&buf, 2u);
                }
              }
            }
            int v9 = 0;
            goto LABEL_60;
          }
          break;
        }
        if (v33)
        {
          CFRelease(v33);
          self->_previousMetadata = 0;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unint64_t v50 = VCPLogInstance();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "Inconsistent number of metadata and video frames", (uint8_t *)&buf, 2u);
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v45 = VCPLogInstance();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "Error creating stabilized video frame", (uint8_t *)&buf, 2u);
      }
    }
    int v9 = -18;
LABEL_60:

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
LABEL_3:
  return v9;
}

- (int)createLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 isInterpolated:(BOOL)a5 updatedSample:(opaqueCMSampleBuffer *)a6
{
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  size_t totalLengthOut = 0;
  size_t lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
  if (!dataPointerOut) {
    return -18;
  }
  size_t v12 = 0;
  uint64_t v34 = 0;
  uint64_t v13 = *MEMORY[0x1E4F52790];
  while (v12 < totalLengthOut)
  {
    size_t v14 = v12;
    unsigned int v15 = *(_DWORD *)&dataPointerOut[v12];
    double v16 = FigMetadataFormatDescriptionGetIdentifierForLocalID();
    char v17 = [v16 isEqualToString:v13];
    size_t v12 = v14 + bswap32(v15);

    if (v17) {
      goto LABEL_8;
    }
  }
  size_t v14 = 0;
LABEL_8:
  FigLivePhotoMetadataComputeSerializationSizeV3();
  size_t v19 = v34 + 8;
  double v20 = malloc_type_malloc(v34 + 8, 0xB8D3EC62uLL);
  bzero(v20, v34 + 8);
  *double v20 = bswap32(v34 + 8);
  int v21 = *(_DWORD *)&dataPointerOut[v14 + 4];
  *((_WORD *)v20 + 25) = 128;
  v20[1] = v21;
  v20[2] = 3;
  *((_WORD *)v20 + 36) = 32;
  *((unsigned char *)v20 + 130) = a5;
  CMBlockBufferRef theBuffer = 0;
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  OSStatus v18 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20, v19, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, v19, 0, &theBuffer);
  CMBlockBufferRef v23 = theBuffer;
  if (v18) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = theBuffer == 0;
  }
  if (!v24)
  {
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v25;
    CMTimeEpoch v26 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.int64_t epoch = v27;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)&a4->var0;
    CMTimeEpoch var3 = a4->var3;
    sampleTimingArray.decodeTimeStamp.int64_t epoch = v26;
    sampleTimingArray.presentationTimeStamp.int64_t epoch = var3;
    sampleSizeArradouble y = CMBlockBufferGetDataLength(theBuffer);
    OSStatus v18 = CMSampleBufferCreate(v22, theBuffer, 1u, 0, 0, FormatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, a6);
    CMBlockBufferRef v23 = theBuffer;
  }
  if (v18) {
    BOOL v29 = v23 == 0;
  }
  else {
    BOOL v29 = 0;
  }
  if (v29)
  {
    free(v20);
  }
  else if (v23)
  {
    CFRelease(v23);
  }
  return v18;
}

- (int)finishAnalysisPass:(id *)a3 withStillImageBuffer:(__CVBuffer *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  long long v62 = 0;
  uint64_t v63 = 0;
  long long v61 = 0;
  if (self->_processAborted)
  {
    CFDictionaryRef v50 = 0;
    id v5 = 0;
    uint64_t v6 = 0;
    v7 = 0;
    int v8 = 0;
LABEL_3:
    previousMetadata = self->_previousMetadata;
    if (previousMetadata)
    {
      CFRelease(previousMetadata);
      self->_previousMetadata = 0;
    }
    if (v8)
    {
      self->_processAborted = 1;
      if ([(VCPMovieAssetWriter *)self->_assetWriter status] == 1) {
        [(VCPMovieAssetWriter *)self->_assetWriter cancel];
      }
    }
    goto LABEL_23;
  }
  timingCurveIddouble x = self->_timingCurveIdx;
  if (timingCurveIdx != [(NSArray *)self->_timingCurveList count] - 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time.value) = 0;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "Inconsistency in frame timestamp list and decoded video frames", (uint8_t *)&time, 2u);
      }
      CFDictionaryRef v50 = 0;
      id v5 = 0;
      uint64_t v6 = 0;
      v7 = 0;
      int v8 = -18;
      goto LABEL_17;
    }
    CFDictionaryRef v50 = 0;
    id v5 = 0;
    uint64_t v6 = 0;
    v7 = 0;
LABEL_25:
    int v8 = -18;
    goto LABEL_3;
  }
  long long v61 = [(VCPSettlingEffectAnalyzer *)self scaleStillImage:a4];
  time.value = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&time);
  long long v62 = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", v61, &unk_1F15EDD40, self->_cleanApertureRect.origin.x, self->_cleanApertureRect.origin.y, self->_cleanApertureRect.size.width, self->_cleanApertureRect.size.height, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  time.value = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&time);
  uint64_t v12 = *MEMORY[0x1E4F24AC0];
  uint64_t v13 = *MEMORY[0x1E4F24BC8];
  v67[0] = *MEMORY[0x1E4F24A90];
  v67[1] = v13;
  uint64_t v14 = *MEMORY[0x1E4F24BE0];
  v68[0] = v12;
  v68[1] = v14;
  v67[2] = *MEMORY[0x1E4F24C18];
  v68[2] = *MEMORY[0x1E4F24C40];
  CFDictionaryRef v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  CMSetAttachments(v62, v50, 1u);
  unsigned int v15 = [(NSArray *)self->_timingCurveList objectAtIndexedSubscript:self->_timingCurveIdx];
  int v16 = [v15 count];
  CMTime time = (CMTime)self->_outputFrameDuration;
  p_outputFrameDuration = &self->_outputFrameDuration;
  CMTimeMultiply(&rhs, &time, v16 + 1);
  CMTime v60 = rhs;

  id v17 = objc_alloc(MEMORY[0x1E4F61700]);
  OSStatus v18 = v62;
  CMTime time = (CMTime)self->_anchorPTS;
  p_anchorPTS = &self->_anchorPTS;
  CMTime rhs = v60;
  CMTimeAdd(&v59, &time, &rhs);
  uint64_t v6 = (void *)[v17 initWithBuffer:v18 presentationTimeStamp:&v59];
  frameInterpolator = self->_frameInterpolator;
  previousFrame = self->_previousFrame;
  int v21 = [(NSArray *)self->_timingCurveList objectAtIndexedSubscript:self->_timingCurveIdx];
  id v58 = 0;
  v7 = [(FRCFrameInterpolator *)frameInterpolator interpolateBetweenFirstFrame:previousFrame secondFrame:v6 timeScales:v21 withError:&v58];
  id v5 = v58;

  if ([v5 code] != -22006)
  {
    uint64_t v22 = [v7 count];
    CMBlockBufferRef v23 = [(NSArray *)self->_timingCurveList objectAtIndexedSubscript:self->_timingCurveIdx];
    BOOL v24 = v22 == [v23 count];

    if (v24)
    {
      assetWriter = self->_assetWriter;
      uint64_t v26 = [(FRCFrame *)self->_previousFrame buffer];
      long long v27 = self->_previousFrame;
      if (v27) {
        [(FRCFrame *)v27 presentationTimeStamp];
      }
      else {
        memset(v57, 0, sizeof(v57));
      }
      int v8 = [(VCPMovieAssetWriter *)assetWriter addPixelBuffer:v26 withTime:v57 withAttachment:0];
      if (v8) {
        goto LABEL_3;
      }
      v35 = self->_previousMetadata;
      BOOL v36 = self->_previousFrame;
      if (v36) {
        [(FRCFrame *)v36 presentationTimeStamp];
      }
      else {
        memset(v56, 0, sizeof(v56));
      }
      int v8 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:v35 withTimestamp:v56 isInterpolated:0 updatedSample:&v63];
      if (v8) {
        goto LABEL_3;
      }
      int v8 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v63];
      if (v8) {
        goto LABEL_3;
      }
      unint64_t v47 = 0;
      uint64_t v46 = *MEMORY[0x1E4F1F2B0];
      while (v47 < [v7 count])
      {
        uint64_t v65 = v46;
        uint64_t v66 = MEMORY[0x1E4F1CC38];
        p_super = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        CFDictionaryRef v37 = self->_assetWriter;
        CMTimeEpoch v38 = [v7 objectAtIndexedSubscript:v47];
        uint64_t v39 = [v38 buffer];
        *(_OWORD *)&time.value = *(_OWORD *)&p_outputFrameDuration->value;
        time.int64_t epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v54, &time, v47 + 1);
        *(_OWORD *)&time.value = *(_OWORD *)&p_anchorPTS->value;
        time.int64_t epoch = self->_anchorPTS.epoch;
        CMTime rhs = v54;
        CMTimeAdd(&v55, &time, &rhs);
        int v8 = [(VCPMovieAssetWriter *)v37 addPixelBuffer:v39 withTime:&v55 withAttachment:p_super];

        if (v8) {
          goto LABEL_17;
        }
        v40 = self->_previousMetadata;
        *(_OWORD *)&time.value = *(_OWORD *)&p_outputFrameDuration->value;
        time.int64_t epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v54, &time, v47 + 1);
        *(_OWORD *)&time.value = *(_OWORD *)&p_anchorPTS->value;
        time.int64_t epoch = self->_anchorPTS.epoch;
        CMTime rhs = v54;
        CMTimeAdd(&v53, &time, &rhs);
        int v8 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:v40 withTimestamp:&v53 isInterpolated:1 updatedSample:&v63];
        if (v8) {
          goto LABEL_17;
        }
        int v8 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v63];
        if (v8) {
          goto LABEL_17;
        }

        ++v47;
      }
      CFDictionaryRef v41 = self->_assetWriter;
      uint64_t v42 = [v6 buffer];
      if (v6) {
        [v6 presentationTimeStamp];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      int v8 = [(VCPMovieAssetWriter *)v41 addPixelBuffer:v42 withTime:v52 withAttachment:0];
      if (v8) {
        goto LABEL_3;
      }
      id v43 = self->_previousMetadata;
      if (v6) {
        [v6 presentationTimeStamp];
      }
      else {
        memset(v51, 0, sizeof(v51));
      }
      int v8 = [(VCPSettlingEffectAnalyzer *)self createLivePhotoInfoSample:v43 withTimestamp:v51 isInterpolated:0 updatedSample:&v63];
      if (v8) {
        goto LABEL_3;
      }
      int v8 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v63];
      if (v8) {
        goto LABEL_3;
      }
      if (![(VCPMovieAssetWriter *)self->_assetWriter finish]
        && [(FRCFrameInterpolator *)self->_frameInterpolator endSession] == -22000)
      {
        self->_FRCRecommendation = [(FRCFrameInterpolator *)self->_frameInterpolator recommendation];
        self->_FRCGatingFailure = [(FRCFrameInterpolator *)self->_frameInterpolator gated];
        [(FRCFrameInterpolator *)self->_frameInterpolator sessionConfidence];
        self->_FRCConfidence = v44;
        uint64_t v45 = [(FRCFrameInterpolator *)self->_frameInterpolator sessionStatistics];
        int v8 = 0;
        p_super = &self->_FRCStatistics->super;
        self->_FRCStatistics = v45;
LABEL_17:

        goto LABEL_3;
      }
      goto LABEL_25;
    }
  }
  self->_processAborted = 1;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v29 = VCPLogInstance();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v5 localizedDescription];
      LODWORD(time.value) = 138412290;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
      _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "FRC gating not passed: %@", (uint8_t *)&time, 0xCu);
    }
  }
  [(FRCFrameInterpolator *)self->_frameInterpolator endSession];
  self->_FRCRecommendation = [(FRCFrameInterpolator *)self->_frameInterpolator recommendation];
  [(FRCFrameInterpolator *)self->_frameInterpolator sessionConfidence];
  self->_FRCConfidence = v31;
  v32 = [(FRCFrameInterpolator *)self->_frameInterpolator sessionStatistics];
  FRCStatistics = self->_FRCStatistics;
  self->_FRCStatistics = v32;

  self->_FRCGatingFailure = 1;
  [(VCPMovieAssetWriter *)self->_assetWriter cancel];
  int v8 = 0;
LABEL_23:

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v61);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v62);

  return v8;
}

- (id)results
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v24[0] = @"settlingEffectVideoQualityGatingFailure";
  id v3 = [NSNumber numberWithBool:self->_videoQualityGatingFailure];
  v25[0] = v3;
  v24[1] = @"settlingEffectMetadataIntegrityFailure";
  id v4 = [NSNumber numberWithBool:self->_metadataIntegrityFailure];
  v25[1] = v4;
  v24[2] = @"settlingEffectFRCGatingFailure";
  id v5 = [NSNumber numberWithBool:self->_FRCGatingFailure];
  v25[2] = v5;
  v24[3] = @"settlingEffectStillTransitionGatingFailure";
  uint64_t v6 = [NSNumber numberWithBool:self->_stillTransitionGatingFailure];
  v25[3] = v6;
  v24[4] = @"settlingEffectMinSettlingDurationThresholdFailure";
  v7 = [NSNumber numberWithBool:self->_minSettlingDurationThresholdFailure];
  v25[4] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

  int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = v9;
  if (!self->_processAborted) {
    [v9 setObject:self->_filePath forKeyedSubscript:@"settlingEffectURL"];
  }
  uint64_t v11 = [NSNumber numberWithInteger:self->_FRCRecommendation];
  [v10 setObject:v11 forKeyedSubscript:@"FRCRecommendation"];

  *(float *)&double v12 = self->_FRCConfidence;
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  [v10 setObject:v13 forKeyedSubscript:@"FRCConfidence"];

  uint64_t v14 = [NSNumber numberWithBool:self->_userInitiatedMode];
  [v10 setObject:v14 forKeyedSubscript:@"FRCUserInitiatedMode"];

  if ([(NSDictionary *)self->_FRCStatistics count]) {
    [v10 setObject:self->_FRCStatistics forKeyedSubscript:@"FRCStatistics"];
  }
  [v10 setObject:v8 forKeyedSubscript:@"settlingEffectStatus"];
  uint64_t v22 = @"SettlingEffectResults";
  size_t v19 = @"attributes";
  double v20 = v10;
  unsigned int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  int v21 = v15;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  CMBlockBufferRef v23 = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  return v17;
}

- (id)getPixelBasedHomographies:(id)a3 withCleanApertureSize:(CGSize)a4
{
  id v4 = a3;
  id v5 = [[VCPProtoMovieStabilizationRecipe alloc] initWithData:v4];
  uint64_t v6 = [(VCPProtoMovieStabilizationRecipe *)v5 exportToLegacyDictionary];
  v7 = ICCreateCorrectionHomographiesWithNewImageCoordinates();

  return v7;
}

+ (id)getFramePTSList:(id)a3 before:(id *)a4 withOptions:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v25 = [MEMORY[0x1E4F1CA48] array];
  id v9 = objc_alloc(MEMORY[0x1E4F16378]);
  id v10 = [v7 asset];
  uint64_t v11 = (void *)[v9 initWithAsset:v10 error:0];

  double v12 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v7];
  if (([v11 canAddOutput:v12] & 1) == 0
    || ([v11 addOutput:v12], !objc_msgSend(v11, "startReading")))
  {
    size_t v19 = 0;
LABEL_13:
    double v20 = 0;
    goto LABEL_14;
  }
  char v13 = 0;
  while (1)
  {
    uint64_t v14 = (opaqueCMSampleBuffer *)objc_msgSend(v12, "copyNextSampleBuffer", v25);
    unsigned int v15 = v14;
    if (!v14) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v14))
    {
      memset(&v28, 0, sizeof(v28));
      CMSampleBufferGetPresentationTimeStamp(&v28, v15);
      CMTime time1 = v28;
      CMTime time2 = (CMTime)*a4;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        CMTimeMake(&v26, 2, 600);
        CMTime time1 = v28;
        CMTime time2 = v26;
        CMTimeAdd(&v27, &time1, &time2);
        CMTime time1 = v27;
        CMTime time2 = (CMTime)*a4;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          CMTime time1 = v28;
          CFDictionaryRef v16 = CMTimeCopyAsDictionary(&time1, 0);
          [v25 addObject:v16];
        }
      }
      id v17 = [v8 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
      if (v17)
      {
        CMTime time1 = v28;
        CMTime time2 = (CMTime)*a4;
        BOOL v18 = CMTimeCompare(&time1, &time2) == 0;

        v13 |= v18;
      }
    }
    CFRelease(v15);
  }
  size_t v19 = [v25 sortedArrayUsingComparator:&__block_literal_global_1];
  if (![v19 count]) {
    goto LABEL_13;
  }
  CMBlockBufferRef v23 = [v8 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
  char v24 = (v23 == 0) | v13;

  if (v24)
  {
    double v20 = v19;
  }
  else
  {
    double v20 = objc_msgSend(v19, "subarrayWithRange:", 0, objc_msgSend(v19, "count") - 1);

    size_t v19 = v20;
  }
LABEL_14:
  id v21 = v20;

  return v21;
}

uint64_t __64__VCPSettlingEffectAnalyzer_getFramePTSList_before_withOptions___block_invoke(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  CFDictionaryRef v4 = a3;
  CMTimeMakeFromDictionary(&v8, a2);
  CMTimeMakeFromDictionary(&v7, v4);
  CMTime time1 = v8;
  CMTime time2 = v7;
  if (CMTimeCompare(&time1, &time2) > 0) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = -1;
  }

  return v5;
}

- (CGSize)getFrameSize:(id)a3
{
  id v3 = [a3 formatDescriptions];
  if ([v3 count])
  {
    CFDictionaryRef v4 = [v3 objectAtIndexedSubscript:0];

    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v4, 0, 0);
    CGFloat width = PresentationDimensions.width;
    CGFloat height = PresentationDimensions.height;
  }
  else
  {
    CGFloat width = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)getCleanApertureFrameSize:(id)a3
{
  id v3 = [a3 formatDescriptions];
  if ([v3 count])
  {
    CFDictionaryRef v4 = [v3 objectAtIndexedSubscript:0];

    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v4, 0, 1u);
    CGFloat width = PresentationDimensions.width;
    CGFloat height = PresentationDimensions.height;
  }
  else
  {
    CGFloat width = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (__CVBuffer)resamplePixelBuffer:(__CVBuffer *)a3 cleanApertureRect:(CGRect)a4 cropRect:(CGRect)a5 homographyArray:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat x = a5.origin.x;
  CGFloat y = a5.origin.y;
  double v6 = a4.size.height;
  double v7 = a4.size.width;
  double v8 = a4.origin.y;
  double v9 = a4.origin.x;
  v110[4] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  [v11 floatValue];
  v98.i64[0] = v12;
  char v13 = [v10 objectAtIndexedSubscript:1];
  [v13 floatValue];
  v95.i64[0] = v14;
  unsigned int v15 = [v10 objectAtIndexedSubscript:2];
  [v15 floatValue];
  v92.i64[0] = v16;
  id v17 = [v10 objectAtIndexedSubscript:3];
  [v17 floatValue];
  __int32 v85 = v18;
  size_t v19 = [v10 objectAtIndexedSubscript:4];
  [v19 floatValue];
  __int32 v84 = v20;
  id v21 = [v10 objectAtIndexedSubscript:5];
  [v21 floatValue];
  __int32 v83 = v22;
  CMBlockBufferRef v23 = [v10 objectAtIndexedSubscript:6];
  [v23 floatValue];
  __int32 v82 = v24;
  long long v25 = [v10 objectAtIndexedSubscript:7];
  [v25 floatValue];
  __int32 v81 = v26;
  CMTime v27 = [v10 objectAtIndexedSubscript:8];
  [v27 floatValue];
  float32x4_t v28 = v98;
  v28.i32[1] = v85;
  v28.i32[2] = v82;
  float32x4_t v99 = v28;
  float32x4_t v29 = v95;
  v29.i32[1] = v84;
  v29.i32[2] = v81;
  float32x4_t v96 = v29;
  float32x4_t v30 = v92;
  v30.i32[1] = v83;
  v30.i32[2] = v31;
  float32x4_t v93 = v30;

  uint64_t v32 = 0;
  *(float *)v33.i32 = v6;
  v34.i32[0] = 0;
  v34.i32[1] = v33.i32[0];
  v34.i32[2] = 1.0;
  int32x4_t v35 = vzip1q_s32((int32x4_t)xmmword_1BC280E10, v33);
  v35.i32[3] = 0;
  long long v103 = xmmword_1BC280E20;
  long long v104 = xmmword_1BC280E30;
  int32x4_t v105 = v35;
  do
  {
    *(float32x4_t *)&destinationBuffer[v32] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(long long *)((char *)&v103 + v32 * 8))), v96, *(float32x2_t *)((char *)&v103 + v32 * 8), 1), v93, *(float32x4_t *)((char *)&v103 + v32 * 8), 2);
    v32 += 2;
  }
  while (v32 != 6);
  uint64_t v36 = 0;
  long long v103 = *(_OWORD *)destinationBuffer;
  long long v104 = v107;
  int32x4_t v105 = (int32x4_t)v108;
  do
  {
    *(float32x4_t *)&destinationBuffer[v36] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1BC280E20, COERCE_FLOAT(*(long long *)((char *)&v103 + v36 * 8))), (float32x4_t)xmmword_1BC280E30, *(float32x2_t *)((char *)&v103 + v36 * 8), 1), v34, *(float32x4_t *)((char *)&v103 + v36 * 8), 2);
    v36 += 2;
  }
  while (v36 != 6);
  float32x4_t v100 = (float32x4_t)v107;
  float32x4_t v94 = *(float32x4_t *)destinationBuffer;
  float32x4_t v97 = v108;
  CFDictionaryRef v37 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a3];
  CMTimeEpoch v38 = objc_msgSend(v37, "imageByCroppingToRect:", v9, v8, v7, v6);
  CGAffineTransformMakeTranslation(&v102, -v9, -v8);
  uint64_t v39 = [v38 imageByApplyingTransform:&v102];

  [v39 extent];
  double MinX = CGRectGetMinX(v111);
  [v39 extent];
  double MaxY = CGRectGetMaxY(v112);
  [v39 extent];
  double MaxX = CGRectGetMaxX(v113);
  [v39 extent];
  double v43 = CGRectGetMaxY(v114);
  [v39 extent];
  double v44 = CGRectGetMinX(v115);
  [v39 extent];
  double MinY = CGRectGetMinY(v116);
  [v39 extent];
  double v46 = CGRectGetMaxX(v117);
  [v39 extent];
  double v47 = CGRectGetMinY(v118);
  float v48 = MinX;
  float v49 = MaxY;
  int32x4_t v50 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v48), v100, v49));
  float32x2_t v51 = vdiv_f32(*(float32x2_t *)v50.i8, (float32x2_t)vdup_laneq_s32(v50, 2));
  v109[0] = @"inputTopLeft";
  v52 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v51.f32[0], v51.f32[1]);
  float v53 = v43;
  float v54 = MaxX;
  int32x4_t v55 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v54), v100, v53));
  *(float32x2_t *)v55.i8 = vdiv_f32(*(float32x2_t *)v55.i8, (float32x2_t)vdup_laneq_s32(v55, 2));
  v110[0] = v52;
  v109[1] = @"inputTopRight";
  double v56 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", *(float *)v55.i32, *(float *)&v55.i32[1]);
  float v57 = v44;
  float v58 = MinY;
  int32x4_t v59 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v57), v100, v58));
  float32x2_t v60 = vdiv_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_laneq_s32(v59, 2));
  v110[1] = v56;
  v109[2] = @"inputBottomLeft";
  long long v61 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v60.f32[0], v60.f32[1]);
  float v62 = v46;
  float v63 = v47;
  int32x4_t v64 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v62), v100, v63));
  float32x2_t v65 = vdiv_f32(*(float32x2_t *)v64.i8, (float32x2_t)vdup_laneq_s32(v64, 2));
  v110[2] = v61;
  v109[3] = @"inputBottomRight";
  uint64_t v66 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGPoint:", v65.f32[0], v65.f32[1]);
  v110[3] = v66;
  double v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:4];
  double v68 = [v39 imageByApplyingFilter:@"CIPerspectiveTransform" withInputParameters:v67];

  v119.origin.CGFloat x = x;
  v119.origin.CGFloat y = y;
  v119.size.double height = height;
  v119.size.double width = width;
  double v69 = CGRectGetMinX(v119);
  [v39 extent];
  double v70 = CGRectGetMinX(v120);
  [v39 extent];
  double v71 = CGRectGetMaxY(v121);
  v122.origin.CGFloat x = x;
  v122.origin.CGFloat y = y;
  v122.size.double height = height;
  v122.size.double width = width;
  double v72 = v69 - v70;
  double v73 = v71 - CGRectGetMaxY(v122);
  v74 = objc_msgSend(v68, "imageByCroppingToRect:", v72, v73, width, height);
  CGAffineTransformMakeTranslation(&v101, -v72, -v73);
  CFDictionaryRef v75 = [v74 imageByApplyingTransform:&v101];

  bufferCreator = self->_bufferCreator;
  if (!bufferCreator)
  {
    int64x2_t v77 = [[VCPPoolBasedPixelBufferCreator alloc] initWithBufferWidth:(uint64_t)width bufferHeight:(uint64_t)height andPixelFormat:CVPixelBufferGetPixelFormatType(a3)];
    v78 = self->_bufferCreator;
    self->_bufferCreator = v77;

    bufferCreator = self->_bufferCreator;
  }
  destinationBuffer[0] = 0;
  if (![(VCPPoolBasedPixelBufferCreator *)bufferCreator createPixelBuffer:destinationBuffer])
  {
    [(CIContext *)self->_context render:v75 toCVPixelBuffer:destinationBuffer[0]];
    CVBufferPropagateAttachments(a3, destinationBuffer[0]);
    CVBufferRemoveAttachment(destinationBuffer[0], (CFStringRef)*MEMORY[0x1E4F24A78]);
  }
  float v79 = destinationBuffer[0];

  return v79;
}

- (__CVBuffer)scaleStillImage:(__CVBuffer *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
  [(VCPSettlingEffectAnalyzer *)self getFrameSize:self->_originalTrack];
  double v7 = v6;
  double v9 = v8;
  [v5 extent];
  double Width = CGRectGetWidth(v21);
  [v5 extent];
  CGFloat Height = CGRectGetHeight(v22);
  CGAffineTransformMakeScale(&v18, v7 / Width, v9 / Height);
  uint64_t v12 = [v5 imageByApplyingTransform:&v18];
  CVBufferRef destinationBuffer = 0;
  uint64_t v19 = *MEMORY[0x1E4F24D20];
  v20[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v13 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v7, (unint64_t)v9, PixelFormatType, v13, &destinationBuffer);
  [(CIContext *)self->_context render:v12 toCVPixelBuffer:destinationBuffer];
  CVBufferPropagateAttachments(a3, destinationBuffer);
  CVBufferRemoveAttachment(destinationBuffer, (CFStringRef)*MEMORY[0x1E4F24A78]);
  unsigned int v15 = destinationBuffer;

  return v15;
}

+ (id)getRetimingCurve
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 addObject:&unk_1F15EDD58];
  [v2 addObject:&unk_1F15EDD70];
  [v2 addObject:&unk_1F15EDD88];
  [v2 addObject:&unk_1F15EDDA0];
  [v2 addObject:&unk_1F15EDDB8];
  [v2 addObject:&unk_1F15EDDD0];
  [v2 addObject:&unk_1F15EDDE8];
  [v2 addObject:&unk_1F15EDE00];
  [v2 addObject:&unk_1F15EDE18];
  [v2 addObject:&unk_1F15EDE30];
  [v2 addObject:&unk_1F15EDE48];
  [v2 addObject:&unk_1F15EDE60];
  [v2 addObject:&unk_1F15EDE78];
  return v2;
}

+ ($D854FC4CDD8DDEA9B2859E823A7C8A75)getSettlingEffectTimeRange:(SEL)a3 withOptions:(id)a4
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [v8 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];

  if (v9)
  {
    CFDictionaryRef v10 = [v8 objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
    CMTimeMakeFromDictionary(&lhs, v10);
  }
  else
  {
    CFDictionaryRef v11 = [v7 asset];
    CFDictionaryRef v10 = v11;
    if (v11) {
      [(__CFDictionary *)v11 vcp_livePhotoStillDisplayTime];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
  }
  CMTime v23 = lhs;

  CMTime v22 = v23;
  uint64_t v12 = +[VCPSettlingEffectAnalyzer getFramePTSList:v7 before:&v22 withOptions:v8];
  CFDictionaryRef v13 = [v8 objectForKeyedSubscript:@"CustomRetimingCurve"];
  if (v13) {
    [v8 objectForKeyedSubscript:@"CustomRetimingCurve"];
  }
  else {
  uint64_t v14 = +[VCPSettlingEffectAnalyzer getRetimingCurve];
  }

  if ([v12 count])
  {
    unint64_t v15 = [v12 count];
    if (v15 <= [v14 count]) {
      [v12 objectAtIndexedSubscript:0];
    }
    else {
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - objc_msgSend(v14, "count"));
    }
    CFDictionaryRef v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&lhs, v16);
    CMTime v24 = lhs;

    CMTime start = v24;
    CMTime lhs = v23;
    CMTime rhs = v24;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake((CMTimeRange *)retstr, &start, &duration);
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F1FA20];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.int64_t var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = v18;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v17 + 32);
  }

  return result;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)adjustedTimeRange
{
  objc_copyStruct(retstr, &self->_cancelled + 3, 48, 1, 0);
  return result;
}

- (BOOL)processAborted
{
  return self->_processAborted;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burstDropsList, 0);
  objc_storeStrong((id *)&self->_frameDropDetector, 0);
  objc_storeStrong((id *)&self->_FRCStatistics, 0);
  objc_storeStrong((id *)&self->_bufferCreator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pixelBasedHomogrphies, 0);
  objc_storeStrong((id *)&self->_timingCurveList, 0);
  objc_storeStrong((id *)&self->_framePTSList, 0);
  objc_storeStrong((id *)&self->_originalTrack, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_frameInterpolator, 0);
}

@end