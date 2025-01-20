@interface MADMovieBlastDoorAnalyzer
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange;
- (MADMovieBlastDoorAnalyzer)initWithMovieURL:(id)a3 analysisTypes:(unint64_t)a4 cancelBlock:(id)a5;
- (id)analyzeAsset:(id *)a3;
- (int)configureAnalyzers;
- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3;
- (int)finalizeAnalyzers:(id)a3 timeRange:(id *)a4;
- (int)processFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5;
- (int)processVideo:(id)a3;
- (int)queryVideoProperties:(id)a3;
@end

@implementation MADMovieBlastDoorAnalyzer

- (MADMovieBlastDoorAnalyzer)initWithMovieURL:(id)a3 analysisTypes:(unint64_t)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADMovieBlastDoorAnalyzer;
  v11 = [(MADMovieBlastDoorAnalyzer *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_movieURL, a3);
    v12->_analysisTypes = a4;
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(&v12->_orientation + 1) = *MEMORY[0x1E4F1F9F8];
    *(void *)&v12->_timeRange.start.flags = *(void *)(v13 + 16);
    v14 = _Block_copy(v10);
    id cancelBlock = v12->_cancelBlock;
    v12->_id cancelBlock = v14;
  }
  return v12;
}

- (int)configureAnalyzers
{
  if ((self->_analysisTypes & 0xFFFFF3FFBFFFBFFFLL) != 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return -50;
    }
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "Unsupported analysis type requested", buf, 2u);
    }
    int v3 = -50;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    privateResults = self->_privateResults;
    self->_privateResults = v5;

    v2 = [(NSMutableDictionary *)self->_privateResults objectForKey:@"OrientationResults"];
    unint64_t analysisTypes = self->_analysisTypes;
    if ((analysisTypes & 0x4000) != 0)
    {
      v8 = objc_alloc_init(VCPVideoSceneClassifier);
      sceneClassifier = self->_sceneClassifier;
      self->_sceneClassifier = v8;

      unint64_t analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x40000000000) != 0)
    {
      id v10 = objc_alloc_init(MADVideoSafetyClassifier);
      safetyClassifier = self->_safetyClassifier;
      self->_safetyClassifier = v10;

      v12 = self->_safetyClassifier;
      long long v34 = *(_OWORD *)((char *)&self->_timeRange.start.epoch + 4);
      uint64_t v35 = *(void *)&self->_timeRange.duration.flags;
      [(MADVideoSafetyClassifier *)v12 configureProcessTimeIntervalFrom:&v34];
      unint64_t analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x80040000000) != 0)
    {
      uint64_t v13 = [VCPVideoEmbeddings alloc];
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion"));
      v15 = [(VCPVideoEmbeddings *)v13 initWithEmbeddingType:2 version:v14];
      videoEmbeddings = self->_videoEmbeddings;
      self->_videoEmbeddings = v15;

      objc_super v17 = [VCPFullVideoAnalyzer alloc];
      uint64_t orientation = self->_orientation;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v33[0] = *MEMORY[0x1E4F1DAB8];
      v33[1] = v19;
      v33[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      LOWORD(v31) = 0;
      LODWORD(v20) = 1.0;
      v21 = -[VCPFullVideoAnalyzer initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:](v17, "initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:", orientation, v33, v2, self->_privateResults, self->_videoEmbeddings, 0, 0.0, 0.0, v20, v31);
      videoAnalysis = self->_videoAnalysis;
      self->_videoAnalysis = v21;

      v23 = [[VCPVideoHumanActionAnalyzer alloc] initWithTimeOfInterest:0 phFaces:0];
      humanActionAnalyzer = self->_humanActionAnalyzer;
      self->_humanActionAnalyzer = v23;

      v25 = [VCPVideoCNNAnalyzer alloc];
      double frameRate = self->_frameRate;
      *(float *)&double frameRate = frameRate;
      long long v27 = *(_OWORD *)&self->_timeRange.start.flags;
      v32[0] = *(_OWORD *)(&self->_orientation + 1);
      v32[1] = v27;
      v32[2] = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
      v28 = [(VCPVideoCNNAnalyzer *)v25 initWithTimeOfInteret:0 frameRate:0 isLivePhoto:0 phFaces:v32 timeRange:self->_videoEmbeddings withEmbeddings:self->_analysisTypes requestedAnalyses:frameRate photoOffset:0.0];
      videoCNNAnalyzer = self->_videoCNNAnalyzer;
      self->_videoCNNAnalyzer = v28;
    }
    int v3 = 0;
  }

  return v3;
}

- (int)queryVideoProperties:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __50__MADMovieBlastDoorAnalyzer_queryVideoProperties___block_invoke;
  v32 = &unk_1E62970D0;
  long long v34 = &v35;
  v6 = v5;
  v33 = v6;
  v7 = _Block_copy(&v29);
  objc_msgSend(v4, "generateMetadataforAttachmentWithfileURL:resultHandler:", self->_movieURL, v7, v29, v30, v31, v32);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (void *)v36[5];
  if (v8)
  {
    if (objc_msgSend(v8, "has_rawPixelWidth")
      && objc_msgSend((id)v36[5], "has_rawPixelHeight")
      && (objc_msgSend((id)v36[5], "has_rawOrientation") & 1) != 0)
    {
      if (objc_msgSend((id)v36[5], "has_videoDurationValue")
        && (objc_msgSend((id)v36[5], "has_videoDurationTimescale") & 1) != 0)
      {
        if (objc_msgSend((id)v36[5], "has_avFPS"))
        {
          uint64_t v9 = [(id)v36[5] rawOrientation];
          id v10 = (void *)v36[5];
          if (v9 > 4)
          {
            self->_unint64_t height = [v10 rawPixelWidth];
            unint64_t width = [(id)v36[5] rawPixelHeight];
            self->_unint64_t width = width;
            unint64_t height = self->_height;
          }
          else
          {
            self->_unint64_t width = [v10 rawPixelWidth];
            unint64_t height = [(id)v36[5] rawPixelHeight];
            self->_unint64_t height = height;
            unint64_t width = self->_width;
          }
          if (width < height) {
            int v17 = 1;
          }
          else {
            int v17 = 3;
          }
          self->_int orientation = v17;
          [(id)v36[5] videoDurationValue];
          double v19 = v18;
          [(id)v36[5] videoDurationTimescale];
          CMTimeMake((CMTime *)buf, (uint64_t)v19, (int)v20);
          *(_OWORD *)((char *)&self->_timeRange.start.epoch + 4) = *(_OWORD *)buf;
          *(void *)&self->_timeRange.duration.flags = *(void *)v42;
          [(id)v36[5] avFPS];
          self->_double frameRate = v21;
          if ((int)MediaAnalysisLogLevel() < 6)
          {
            int v15 = 0;
            goto LABEL_26;
          }
          uint64_t v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v22 = [(id)v36[5] rawPixelWidth];
            int v23 = [(id)v36[5] rawPixelHeight];
            int orientation = self->_orientation;
            [(id)v36[5] videoDurationValue];
            double v26 = v25;
            [(id)v36[5] videoDurationTimescale];
            *(_DWORD *)buf = 67110144;
            double frameRate = self->_frameRate;
            *(_DWORD *)&buf[4] = v22;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v23;
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)v42 = orientation;
            *(_WORD *)&v42[4] = 2048;
            *(double *)&v42[6] = v26 / v28;
            __int16 v43 = 2048;
            double v44 = frameRate;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "Source Dimensions: %dx%d  Orientation: %d  Duration: %0.3fs, Frame Rate: %f", buf, 0x28u);
          }
          int v15 = 0;
          goto LABEL_18;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v13 = VCPLogInstance();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_WORD *)buf = 0;
          v14 = "Movie metadata missing frame rate";
          goto LABEL_16;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v13 = VCPLogInstance();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        v14 = "Movie metadata missing duration";
        goto LABEL_16;
      }
LABEL_25:
      int v15 = -18;
      goto LABEL_26;
    }
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_25;
    }
    uint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Movie metadata missing dimensions";
LABEL_16:
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_25;
    }
    uint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Failed to query movie metadata";
      goto LABEL_16;
    }
  }
LABEL_17:
  int v15 = -18;
LABEL_18:

LABEL_26:
  _Block_object_dispose(&v35, 8);

  return v15;
}

void __50__MADMovieBlastDoorAnalyzer_queryVideoProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v6 description];
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)processFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id cancelBlock = (uint64_t (**)(id, SEL))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2](cancelBlock, a2) & 1) != 0) {
    return -128;
  }
  if ((a4->var2 & 0x1D) != 1 || (a5->var2 & 0x1D) != 1)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return -18;
    }
    VCPLogInstance();
    double v19 = (VCPFrameAnalysisStats *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.duration.value) = 0;
      _os_log_impl(&dword_1BBEDA000, &v19->super, OS_LOG_TYPE_ERROR, "Frame timing invalid", (uint8_t *)&buf, 2u);
    }
    int v10 = -18;
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int var1 = a4->var1;
      CMTime time = (CMTime)*a4;
      CMTimeValue value = time.value;
      Float64 Seconds = CMTimeGetSeconds(&time);
      int v16 = a5->var1;
      CMTime v62 = (CMTime)*a5;
      CMTimeValue v15 = v62.value;
      Float64 v17 = CMTimeGetSeconds(&v62);
      LODWORD(buf.duration.value) = 134219264;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = value;
      LOWORD(buf.duration.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = var1;
      WORD1(buf.duration.epoch) = 2048;
      *(Float64 *)((char *)&buf.duration.epoch + 4) = Seconds;
      WORD2(buf.presentationTimeStamp.value) = 2048;
      *(CMTimeValue *)((char *)&buf.presentationTimeStamp.value + 6) = v15;
      HIWORD(buf.presentationTimeStamp.flags) = 1024;
      LODWORD(buf.presentationTimeStamp.epoch) = v16;
      WORD2(buf.presentationTimeStamp.epoch) = 2048;
      *(Float64 *)((char *)&buf.presentationTimeStamp.epoch + 6) = v17;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "  Processing Frame - PTS: %lld/%d (%0.3fs) Duration: %lld/%d (%0.3fs)", (uint8_t *)&buf, 0x36u);
    }
  }
  if ((self->_timeRange.start.timescale & 1) != 0
    || (long long v18 = *(_OWORD *)&a4->var0,
        *(void *)&self->_timeRange.start.flags = a4->var3,
        *(_OWORD *)(&self->_orientation + 1) = v18,
        (int v10 = [(MADMovieBlastDoorAnalyzer *)self configureAnalyzers]) == 0))
  {
    double v19 = objc_alloc_init(VCPFrameAnalysisStats);
    uint64_t v61 = 0;
    sceneClassifier = self->_sceneClassifier;
    if (!sceneClassifier
      || (long long v59 = *(_OWORD *)&a4->var0,
          int64_t v60 = a4->var3,
          long long v57 = *(_OWORD *)&a5->var0,
          int64_t v58 = a5->var3,
          (int v10 = [(VCPVideoSceneClassifier *)sceneClassifier analyzeFrame:a3 withTimestamp:&v59 andDuration:&v57 flags:&v61]) == 0))
    {
      if (!self->_safetyClassifier) {
        goto LABEL_37;
      }
      CMTime v55 = (CMTime)*a4;
      CMSampleBufferRef sampleBufferOut = 0;
      CMVideoFormatDescriptionRef formatDescriptionOut = 0;
      if (CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          double v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.duration.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create format description", (uint8_t *)&buf, 2u);
          }
        }
LABEL_32:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          double v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.duration.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "Failed to convert CVPixelBuffer to CMSampleBuffer", (uint8_t *)&buf, 2u);
          }
        }
        goto LABEL_36;
      }
      *(_OWORD *)&buf.duration.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
      CMTimeEpoch v23 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      buf.presentationTimeStamp = v55;
      buf.duration.epoch = v23;
      *(_OWORD *)&buf.decodeTimeStamp.CMTimeValue value = *(_OWORD *)&buf.duration.value;
      buf.decodeTimeStamp.epoch = v23;
      if (CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, formatDescriptionOut, &buf, &sampleBufferOut))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v64 = 0;
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer", v64, 2u);
          }
        }
        goto LABEL_32;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
      safetyClassifier = self->_safetyClassifier;
      long long v53 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      long long v51 = *(_OWORD *)&a5->var0;
      int64_t v52 = a5->var3;
      int v10 = [(MADVideoSafetyClassifier *)safetyClassifier analyzeFrameWithSampleBuffer:sampleBufferOut timestamp:&v53 duration:&v51 andFlags:&v61];
      if (!v10)
      {
LABEL_36:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
LABEL_37:
        humanActionAnalyzer = self->_humanActionAnalyzer;
        if (!humanActionAnalyzer
          || (long long v49 = *(_OWORD *)&a4->var0,
              int64_t v50 = a4->var3,
              long long v47 = *(_OWORD *)&a5->var0,
              int64_t v48 = a5->var3,
              (int v10 = [(VCPVideoHumanActionAnalyzer *)humanActionAnalyzer analyzeFrame:a3 timestamp:&v49 duration:&v47 frameStats:v19 flags:&v61]) == 0))
        {
          if (!self->_videoAnalysis) {
            goto LABEL_44;
          }
          if ((int)SocType() >= 247)
          {
            long long v27 = self->_sceneClassifier;
            if (v27)
            {
              videoAnalysis = self->_videoAnalysis;
              uint64_t v29 = [(VCPVideoSceneClassifier *)v27 frameScenes];
              [(VCPFullVideoAnalyzer *)videoAnalysis prepareVideoAnalysisByScenes:v29];
            }
          }
          uint64_t v30 = +[VCPSaliencyRegion salientRegionsFromPixelBuffer:a3];
          +[VCPSaliencyRegion attachSalientRegions:v30 toPixelBuffer:a3];

          uint64_t v31 = self->_videoAnalysis;
          long long v45 = *(_OWORD *)&a4->var0;
          int64_t v46 = a4->var3;
          long long v43 = *(_OWORD *)&a5->var0;
          int64_t v44 = a5->var3;
          int v10 = [(VCPFullVideoAnalyzer *)v31 analyzeFrame:a3 timestamp:&v45 duration:&v43 frameStats:v19 flags:&v61 cancel:self->_cancelBlock];
          if (!v10)
          {
LABEL_44:
            videoCNNAnalyzer = self->_videoCNNAnalyzer;
            if (!videoCNNAnalyzer) {
              goto LABEL_47;
            }
            v33 = self->_videoAnalysis;
            long long v34 = self->_humanActionAnalyzer;
            long long v41 = *(_OWORD *)&a4->var0;
            int64_t v42 = a4->var3;
            int v10 = [(VCPVideoCNNAnalyzer *)videoCNNAnalyzer loadAnalysisResultsFrom:v33 actionAnalyzer:v34 atTime:&v41];
            if (!v10)
            {
              uint64_t v35 = self->_videoCNNAnalyzer;
              long long v39 = *(_OWORD *)&a4->var0;
              int64_t v40 = a4->var3;
              long long v37 = *(_OWORD *)&a5->var0;
              int64_t v38 = a5->var3;
              int v10 = [(VCPVideoCNNAnalyzer *)v35 analyzeFrame:a3 withTimestamp:&v39 andDuration:&v37 flags:&v61];
              if (!v10) {
LABEL_47:
              }
                int v10 = 0;
            }
          }
        }
        goto LABEL_24;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
    }
LABEL_24:
  }
  return v10;
}

- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F24D70];
  v12[0] = &unk_1F15EB370;
  uint64_t v6 = *MEMORY[0x1E4F24E10];
  v11[0] = v5;
  v11[1] = v6;
  v7 = [NSNumber numberWithUnsignedInteger:self->_width];
  v12[1] = v7;
  v11[2] = *MEMORY[0x1E4F24D08];
  v8 = [NSNumber numberWithUnsignedInteger:self->_height];
  v11[3] = *MEMORY[0x1E4F24D20];
  v12[2] = v8;
  v12[3] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  LODWORD(a3) = CVPixelBufferPoolCreate(0, 0, v9, a3);
  return (int)a3;
}

- (int)processVideo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  if (width >= height) {
    unint64_t v7 = self->_height;
  }
  else {
    unint64_t v7 = self->_width;
  }
  if (v7 >= 0x169)
  {
    unint64_t width = (360 * width / v7 + 1) & 0xFFFFFFFFFFFFFFFELL;
    unint64_t height = (360 * height / v7 + 1) & 0xFFFFFFFFFFFFFFFELL;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CMSampleTimingInfo buf = 67109376;
      *(_DWORD *)&buf[4] = width;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = height;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "Target Dimensions: %dx%d", buf, 0xEu);
    }
  }
  int64_t v40 = 0;
  OSStatus v9 = [(MADMovieBlastDoorAnalyzer *)self createPixelBufferPool:&v40];
  if (!v9)
  {
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    OSStatus v9 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (!v9)
    {
      *(void *)CMSampleTimingInfo buf = 0;
      int64_t v42 = buf;
      uint64_t v43 = 0x4812000000;
      int64_t v44 = __Block_byref_object_copy__239;
      long long v45 = __Block_byref_object_dispose__240;
      int64_t v46 = &unk_1BC33760A;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3812000000;
      uint64_t v35 = __Block_byref_object_copy__241;
      v36 = __Block_byref_object_dispose__242;
      long long v37 = &unk_1BC33760A;
      int64_t v38 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      int v31 = 0;
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3321888768;
      double v19 = __42__MADMovieBlastDoorAnalyzer_processVideo___block_invoke;
      double v20 = &unk_1F159DE70;
      CMTimeEpoch v23 = &v28;
      id v11 = v10;
      double v21 = v11;
      double v26 = v40;
      if (v40) {
        CFRetain(v40);
      }
      VTPixelTransferSessionRef v27 = pixelTransferSessionOut;
      if (pixelTransferSessionOut) {
        CFRetain(pixelTransferSessionOut);
      }
      int v22 = self;
      v24 = &v32;
      double v25 = buf;
      int v12 = _Block_copy(&aBlock);
      LOBYTE(v16) = 1;
      objc_msgSend(v4, "generateMovieFramesForAttachmentWithFileURL:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:", self->_movieURL, width, height, -1, 0, 0, v16, v12, aBlock, v18, v19, v20);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v13 = v33;
      uint64_t v14 = (const void *)v33[6];
      if (v14)
      {
        CFRelease(v14);
        v13[6] = 0;
      }
      OSStatus v9 = *((_DWORD *)v29 + 6);

      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v27);
      CF<opaqueCMSampleBuffer *>::~CF(&v26);

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);
      CF<opaqueCMSampleBuffer *>::~CF(&v38);
      _Block_object_dispose(buf, 8);
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelTransferSessionOut);
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v40);

  return v9;
}

void __42__MADMovieBlastDoorAnalyzer_processVideo___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (a4) {
LABEL_3:
    }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v7)
  {
    id v9 = v7;
    dispatch_semaphore_t v10 = [v9 image];
    id v11 = (__CVBuffer *)[v10 pixelBuffer];

    if (v11)
    {
      CVPixelBufferRef pixelBufferOut = 0;
      if (CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(a1 + 72), &pixelBufferOut)
        || VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 80), v11, pixelBufferOut))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int v12 = VCPLogInstance();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Failed to convert pixel buffer to 420v", (uint8_t *)&buf, 2u);
          }
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -18;
        int v13 = 1;
      }
      else
      {
        memset(&v34, 0, sizeof(v34));
        [v9 timestamp];
        CMTimeMakeWithSeconds(&v34, v22, *(_DWORD *)(*(void *)(a1 + 40) + 84));
        uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
        if (v23)
        {
          v24 = *(void **)(a1 + 40);
          double v25 = *(CMTime **)(*(void *)(a1 + 64) + 8);
          long long v32 = *(_OWORD *)&v25[2].value;
          CMTimeEpoch epoch = v25[2].epoch;
          CMTime buf = v34;
          CMTime rhs = v25[2];
          CMTimeSubtract(&v31, &buf, &rhs);
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v24 processFrame:v23 timestamp:&v32 duration:&v31];
        }
        double v26 = pixelBufferOut;
        if (pixelBufferOut) {
          double v26 = (void *)CFRetain(pixelBufferOut);
        }
        buf.CMTimeValue value = (CMTimeValue)v26;
        CF<__CVBuffer *>::operator=((const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 48), (const void **)&buf);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        int v13 = 0;
        *(CMTime *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = v34;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);

      if (((v13 | a4 ^ 1) & 1) == 0)
      {
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
          if (v14)
          {
            uint64_t v15 = *(void *)(a1 + 40);
            uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
            long long v29 = *(_OWORD *)(v16 + 48);
            uint64_t v30 = *(void *)(v16 + 64);
            long long v17 = *(_OWORD *)(v15 + 68);
            *(_OWORD *)&v27.start.CMTimeValue value = *(_OWORD *)(v15 + 52);
            *(_OWORD *)&v27.start.CMTimeEpoch epoch = v17;
            *(_OWORD *)&v27.duration.timescale = *(_OWORD *)(v15 + 84);
            CMTimeRangeGetEnd(&v34, &v27);
            uint64_t v18 = *(CMTime **)(*(void *)(a1 + 64) + 8);
            CMTime buf = v34;
            CMTime rhs = v18[2];
            CMTimeSubtract(&v28, &buf, &rhs);
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(id)v15 processFrame:v14 timestamp:&v29 duration:&v28];
          }
        }
        goto LABEL_3;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "CVPixelBuffer is missing from Blastdoor result", (uint8_t *)&buf, 2u);
        }
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -18;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v8;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -18;
    if (a4) {
      goto LABEL_3;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor but decoding not finished yet", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (int)finalizeAnalyzers:(id)a3 timeRange:(id *)a4
{
  id v6 = a3;
  sceneClassifier = self->_sceneClassifier;
  if (sceneClassifier)
  {
    long long v8 = *(_OWORD *)&a4->var0.var3;
    v28[0] = *(_OWORD *)&a4->var0.var0;
    v28[1] = v8;
    v28[2] = *(_OWORD *)&a4->var1.var1;
    int v9 = [(VCPVideoSceneClassifier *)sceneClassifier finishAnalysisPass:v28];
    if (v9) {
      goto LABEL_17;
    }
    dispatch_semaphore_t v10 = [(VCPVideoSceneClassifier *)self->_sceneClassifier results];
    [v6 addEntriesFromDictionary:v10];
  }
  safetyClassifier = self->_safetyClassifier;
  if (safetyClassifier)
  {
    long long v12 = *(_OWORD *)&a4->var0.var3;
    v27[0] = *(_OWORD *)&a4->var0.var0;
    v27[1] = v12;
    v27[2] = *(_OWORD *)&a4->var1.var1;
    int v9 = [(MADVideoSafetyClassifier *)safetyClassifier finishAnalysisPass:v27];
    if (v9) {
      goto LABEL_17;
    }
    int v13 = [(MADVideoSafetyClassifier *)self->_safetyClassifier results];
    [v6 addEntriesFromDictionary:v13];
  }
  humanActionAnalyzer = self->_humanActionAnalyzer;
  if (humanActionAnalyzer)
  {
    long long v15 = *(_OWORD *)&a4->var0.var3;
    v26[0] = *(_OWORD *)&a4->var0.var0;
    v26[1] = v15;
    v26[2] = *(_OWORD *)&a4->var1.var1;
    int v9 = [(VCPVideoHumanActionAnalyzer *)humanActionAnalyzer finishAnalysisPass:v26];
    if (v9) {
      goto LABEL_17;
    }
    uint64_t v16 = [(VCPVideoHumanActionAnalyzer *)self->_humanActionAnalyzer results];
    [v6 addEntriesFromDictionary:v16];
  }
  videoAnalysis = self->_videoAnalysis;
  if (videoAnalysis)
  {
    long long v18 = *(_OWORD *)&a4->var0.var3;
    v25[0] = *(_OWORD *)&a4->var0.var0;
    v25[1] = v18;
    v25[2] = *(_OWORD *)&a4->var1.var1;
    int v9 = [(VCPFullVideoAnalyzer *)videoAnalysis finishAnalysisPass:v25];
    if (v9) {
      goto LABEL_17;
    }
    double v19 = [(VCPFullVideoAnalyzer *)self->_videoAnalysis results];
    [v6 addEntriesFromDictionary:v19];
  }
  videoCNNAnalyzer = self->_videoCNNAnalyzer;
  if (!videoCNNAnalyzer)
  {
LABEL_16:
    int v9 = 0;
    goto LABEL_17;
  }
  long long v21 = *(_OWORD *)&a4->var0.var3;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v21;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  int v9 = [(VCPVideoCNNAnalyzer *)videoCNNAnalyzer finishAnalysisPass:v24];
  if (!v9)
  {
    Float64 v22 = [(VCPVideoCNNAnalyzer *)self->_videoCNNAnalyzer results];
    [v6 addEntriesFromDictionary:v22];

    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (id)analyzeAsset:(id *)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1C186D320](self, a2);
  uint64_t v27 = 0;
  CMTime v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v6 = (void *)getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass;
  uint64_t v30 = getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass;
  if (!getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = ___ZL41getIMMediaAnalysisBlastDoorInterfaceClassv_block_invoke;
    _OWORD v26[3] = &unk_1E62970F8;
    v26[4] = &v27;
    ___ZL41getIMMediaAnalysisBlastDoorInterfaceClassv_block_invoke((uint64_t)v26);
    id v6 = (void *)v28[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v27, 8);
  id v8 = objc_alloc_init(v7);
  if ([(MADMovieBlastDoorAnalyzer *)self queryVideoProperties:v8])
  {
    if (!a3) {
      goto LABEL_8;
    }
    int v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"Failed to query movie properties"];
    v38[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    *a3 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v11];

    goto LABEL_6;
  }
  int v13 = [(MADMovieBlastDoorAnalyzer *)self processVideo:v8];
  int v14 = v13;
  if (!v13)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v19 = *(_OWORD *)&self->_timeRange.start.flags;
    v25[0] = *(_OWORD *)(&self->_orientation + 1);
    v25[1] = v19;
    v25[2] = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
    if (![(MADMovieBlastDoorAnalyzer *)self finalizeAnalyzers:v10 timeRange:v25])
    {
      id v10 = v10;
      a3 = (id *)v10;
      goto LABEL_7;
    }
    if (!a3)
    {
LABEL_7:

      goto LABEL_8;
    }
    double v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    long long v21 = [NSString stringWithFormat:@"Failed to finalize video processing"];
    long long v32 = v21;
    Float64 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    *a3 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v22];

LABEL_6:
    a3 = 0;
    goto LABEL_7;
  }
  if (a3)
  {
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28760];
    if (v13 == -128)
    {
      uint64_t v35 = *MEMORY[0x1E4F28568];
      id v10 = [NSString stringWithFormat:@"Video processing canceled"];
      id v36 = v10;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v18 = [v15 errorWithDomain:v16 code:-128 userInfo:v17];
      *a3 = v18;
    }
    else
    {
      uint64_t v33 = *MEMORY[0x1E4F28568];
      id v10 = [NSString stringWithFormat:@"Video processing failed"];
      id v34 = v10;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v24 = [v15 errorWithDomain:v16 code:v14 userInfo:v23];
      *a3 = v24;
    }
    goto LABEL_6;
  }
LABEL_8:

  return a3;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange
{
  long long v3 = *(_OWORD *)((char *)&self[1].var0.var3 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)((char *)&self[1].var0.var0 + 4);
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.int var1 = *(_OWORD *)&self[1].var1.var2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateResults, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
  objc_storeStrong((id *)&self->_videoCNNAnalyzer, 0);
  objc_storeStrong((id *)&self->_humanActionAnalyzer, 0);
  objc_storeStrong((id *)&self->_safetyClassifier, 0);
  objc_storeStrong((id *)&self->_sceneClassifier, 0);
  objc_storeStrong((id *)&self->_videoAnalysis, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
}

@end