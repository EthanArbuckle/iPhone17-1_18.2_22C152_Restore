@interface VCPVideoCNNAnalyzer
+ (BOOL)forcePersonDetection;
+ (BOOL)isAdaptiveSegmentEnabled;
+ (BOOL)isMLHighlightEnabled;
+ (BOOL)isMLSettlingEffectPregatingEnabled;
+ (BOOL)isMUBackboneEnabled;
+ (BOOL)isVideoSegmentCaptionEnabled;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)isAnalysisResultNeeded:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStart;
- (BOOL)highlightEnabled;
- (BOOL)postInference;
- (VCPVideoCNNAnalyzer)initWithTimeOfInteret:(id)a3 frameRate:(float)a4 isLivePhoto:(BOOL)a5 phFaces:(id)a6 timeRange:(id *)a7 withEmbeddings:(id)a8 requestedAnalyses:(unint64_t)a9 photoOffset:(float)a10;
- (float)minProcessingInterval;
- (id)privateResults;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)configForAspectRatio:(float)a3;
- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5;
- (int)copyMUBBImage:(__CVBuffer *)a3 withChannels:(int)a4;
- (int)finishAnalysisPass:(id *)a3;
- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4;
- (int)loadAnalysisResultsFrom:(id)a3 actionAnalyzer:(id)a4 atTime:(id *)a5;
- (int)loadFullAnalysisResults:(id)a3 actionAnalysisResults:(id)a4 predictedTimeRange:(id *)a5 timestamp:(id *)a6;
- (int)runTasks:(id *)a3 duration:(id *)a4 persons:(id)a5 regionCrop:(CGRect)a6;
- (void)copyFrames;
- (void)dealloc;
@end

@implementation VCPVideoCNNAnalyzer

+ (BOOL)forcePersonDetection
{
  return 0;
}

+ (BOOL)isMLHighlightEnabled
{
  return 1;
}

+ (BOOL)isMLSettlingEffectPregatingEnabled
{
  return 1;
}

+ (BOOL)isMUBackboneEnabled
{
  {
    +[VCPVideoCNNAnalyzer isMUBackboneEnabled]::enable = MGGetBoolAnswer();
  }
  return +[VCPVideoCNNAnalyzer isMUBackboneEnabled]::enable;
}

+ (BOOL)isAdaptiveSegmentEnabled
{
  return 0;
}

+ (BOOL)isVideoSegmentCaptionEnabled
{
  if (+[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled]::once != -1) {
    dispatch_once(&+[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled]::once, &__block_literal_global_3);
  }
  return +[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled]::enable;
}

void __51__VCPVideoCNNAnalyzer_isVideoSegmentCaptionEnabled__block_invoke()
{
  if (+[VCPVideoCaptionAnalyzer mode] == 1)
  {
    +[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled]::enable = 1;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v0 = VCPLogInstance();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v1 = 0;
        _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_INFO, "[MediaAnalysis] enable VideoSegmentCaption", v1, 2u);
      }
    }
  }
}

- (VCPVideoCNNAnalyzer)initWithTimeOfInteret:(id)a3 frameRate:(float)a4 isLivePhoto:(BOOL)a5 phFaces:(id)a6 timeRange:(id *)a7 withEmbeddings:(id)a8 requestedAnalyses:(unint64_t)a9 photoOffset:(float)a10
{
  BOOL v98 = a5;
  id v102 = a3;
  id v101 = a6;
  id v100 = a8;
  v110.receiver = self;
  v110.super_class = (Class)VCPVideoCNNAnalyzer;
  v16 = [(VCPVideoCNNAnalyzer *)&v110 init];
  v17 = v16;
  v18 = (unsigned int *)v16;
  if (!v16) {
    goto LABEL_64;
  }
  v19 = (long long *)MEMORY[0x1E4F1FA08];
  uint64_t v20 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  *(_OWORD *)(v16 + 156) = *MEMORY[0x1E4F1FA08];
  *(void *)(v16 + 172) = v20;
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)(v16 + 180) = *MEMORY[0x1E4F1F9F8];
  *(void *)(v16 + 196) = v21;
  v22 = (void *)*((void *)v16 + 31);
  *((void *)v16 + 31) = &stru_1F15A0D70;

  v18[34] = 224;
  v18[35] = 224;
  if ((unint64_t)(+[VCPVideoTransformerBackbone revision]
                        - 3) >= 3)
  {
    v18[36] = 224;
    v18[37] = 224;
    v18[38] = 2;
    v24 = (void *)*((void *)v18 + 4);
    *((void *)v18 + 4) = 0;
  }
  else
  {
    v18[36] = 352;
    v18[37] = 352;
    v18[38] = 1;
    id v23 = [[VCPTransforms alloc] initImageTransform:128 transformedImageWidth:v18[36] transformedImageHeight:v18[37]];
    v24 = (void *)*((void *)v18 + 4);
    *((void *)v18 + 4) = v23;
  }

  *((void *)v18 + 13) = 0;
  *((void *)v18 + 14) = 0;
  v25 = (void *)*((void *)v18 + 15);
  *((void *)v18 + 15) = 0;

  v26 = (void *)*((void *)v18 + 16);
  *((void *)v18 + 16) = 0;

  v27 = v17 + 204;
  long long v28 = *v19;
  *(void *)(v17 + 220) = *((void *)v19 + 2);
  *(_OWORD *)(v17 + 204) = v28;
  long long v29 = *v19;
  *((void *)v17 + 42) = *((void *)v19 + 2);
  *((_OWORD *)v17 + 20) = v29;
  *((unsigned char *)v18 + 236) = 0;
  *((unsigned char *)v18 + 237) = 0;
  *((unsigned char *)v18 + 238) = 0;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *((_OWORD *)v17 + 18) = *MEMORY[0x1E4F1DB28];
  *((_OWORD *)v17 + 19) = v30;
  *((unsigned char *)v18 + 344) = v102 != 0;
  id v31 = [[VCPTransforms alloc] initImageTransform:128 transformedImageWidth:v18[34] transformedImageHeight:v18[35]];
  v32 = (void *)*((void *)v18 + 3);
  *((void *)v18 + 3) = v31;

  objc_storeStrong((id *)v17 + 8, a8);
  v33 = (void *)*((void *)v18 + 9);
  *((void *)v18 + 9) = 0;

  *((float *)v18 + 88) = a10;
  uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
  v35 = (void *)*((void *)v18 + 5);
  *((void *)v18 + 5) = v34;

  uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
  v37 = (id *)(v17 + 48);
  v38 = (void *)*((void *)v17 + 6);
  *((void *)v17 + 6) = v36;

  uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
  v40 = (id *)(v17 + 56);
  v41 = (void *)*((void *)v17 + 7);
  *((void *)v17 + 7) = v39;

  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    v42 = objc_alloc_init(VCPEmbeddingSummarizationAnalyzer);
    v43 = (void *)*((void *)v18 + 11);
    *((void *)v18 + 11) = v42;
  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]
    && +[VCPVideoCNNAnalyzer isAdaptiveSegmentEnabled])
  {
    v44 = [VCPVideoEmbeddings alloc];
    v45 = [NSNumber numberWithInt:0];
    uint64_t v46 = [(VCPVideoEmbeddings *)v44 initWithEmbeddingType:1 version:v45];
    v47 = (void *)*((void *)v18 + 9);
    *((void *)v18 + 9) = v46;

    v48 = objc_alloc_init(VCPAdaptiveSegmentAnalyzer);
    v49 = (void *)*((void *)v18 + 10);
    *((void *)v18 + 10) = v48;
  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    BOOL v50 = +[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled];
    if ((a9 & 0x200000000000) != 0 && v50 && !v98)
    {
      v51 = objc_alloc_init(VCPVideoCaptionAnalyzer);
      v52 = (void *)*((void *)v18 + 12);
      *((void *)v18 + 12) = v51;
    }
  }
  if (v102)
  {
    if (![v101 count] && (int)MediaAnalysisLogLevel() >= 7)
    {
      v53 = VCPLogInstance();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_DEBUG, "Human action - no PHFaces found", (uint8_t *)&buf, 2u);
      }
    }
    [v102 floatValue];
    CMTimeMake(&buf, (uint64_t)(float)((float)((float)(v54 + -1.0) + (float)(-3.0 / a4)) * 1000.0), 1000);
    long long v55 = *(_OWORD *)&buf.value;
    *((void *)v27 + 2) = buf.epoch;
    *(_OWORD *)v27 = v55;
  }
  long long v56 = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a7->var0.var0;
  *(_OWORD *)&range.start.epoch = v56;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a7->var1.var1;
  CMTimeRangeGetEnd(&v108, &range);
  CMTime buf = v108;
  CMTimeEpoch v57 = *((void *)v27 + 2);
  *(_OWORD *)&rhs.value = *(_OWORD *)v27;
  rhs.epoch = v57;
  CMTimeSubtract(&time, &buf, &rhs);
  int v58 = vcvtmd_s64_f64(CMTimeGetSeconds(&time) * 8.0);
  v59 = (CMTime *)MEMORY[0x1E4F1FA48];
  if (v58 <= 16)
  {
    memset(&v108, 0, sizeof(v108));
    CMTimeMakeWithSeconds(&v108, (float)((float)((float)(16 - v58) + 3.0) * 0.125), 1000);
    long long v60 = *(_OWORD *)v27;
    buf.epoch = *((void *)v27 + 2);
    *(_OWORD *)&buf.value = v60;
    CMTime rhs = v108;
    if (CMTimeCompare(&buf, &rhs) < 1)
    {
      CMTime v106 = *v59;
    }
    else
    {
      long long v61 = *(_OWORD *)v27;
      buf.epoch = *((void *)v27 + 2);
      *(_OWORD *)&buf.value = v61;
      CMTime rhs = v108;
      CMTimeSubtract(&v106, &buf, &rhs);
    }
    long long v62 = *(_OWORD *)&v106.value;
    *((void *)v27 + 2) = v106.epoch;
    *(_OWORD *)v27 = v62;
  }
  long long v63 = *(_OWORD *)v27;
  buf.epoch = *((void *)v27 + 2);
  *(_OWORD *)&buf.value = v63;
  CMTime rhs = *v59;
  if (CMTimeCompare(&buf, &rhs) < 0)
  {
    long long v64 = *(_OWORD *)&v59->value;
    *((void *)v27 + 2) = v59->epoch;
    *(_OWORD *)v27 = v64;
  }
  v18[87] = 1040187392;
  long long v65 = *(_OWORD *)&a7->var1.var1;
  long long v66 = *(_OWORD *)&a7->var0.var0;
  *(_OWORD *)&v104.start.epoch = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)&v104.duration.timescale = v65;
  *(_OWORD *)&v104.start.value = v66;
  CMTimeRangeGetEnd(&v108, &v104);
  CMTime buf = v108;
  CMTimeEpoch v67 = *((void *)v27 + 2);
  *(_OWORD *)&rhs.value = *(_OWORD *)v27;
  rhs.epoch = v67;
  CMTimeSubtract(&v105, &buf, &rhs);
  if ((int)vcvtmd_s64_f64(CMTimeGetSeconds(&v105) * 8.0) > 15)
  {
    if ((a9 & 0x40000000) != 0)
    {
      v72 = [[VCPVideoCNNActionClassifier alloc] initWithPHFaces:v101];
      if (!v72
        || (([*((id *)v18 + 5) addObject:v72], !*((unsigned char *)v18 + 344))
         || [(id)objc_opt_class() forcePersonDetection])
        && (v73 = objc_alloc_init(VCPVideoPersonDetector),
            v74 = (void *)*((void *)v18 + 30),
            *((void *)v18 + 30) = v73,
            v74,
            !*((void *)v18 + 30)))
      {

        goto LABEL_66;
      }
    }
  }
  else
  {
    CMTime var1 = (CMTime)a7->var1;
    float v68 = CMTimeGetSeconds(&var1) * a4;
    float v69 = floorf(v68 * 0.0625);
    *((float *)v18 + 87) = (float)(v69 + -1.0) / a4;
    float v70 = (float)((float)(floorf(v68 + (float)(v69 * -16.0)) * 0.5) + -3.0) / a4;
    if (v70 < 0.0) {
      float v70 = 0.0;
    }
    CMTimeMakeWithSeconds(&buf, v70, 600);
    long long v71 = *(_OWORD *)&buf.value;
    *((void *)v27 + 2) = buf.epoch;
    *(_OWORD *)v27 = v71;
  }
  if ((a9 & 0x200000000) != 0 && !v98)
  {
    v75 = objc_alloc_init(VCPVideoCNNQuality);
    v76 = (void *)*((void *)v18 + 34);
    *((void *)v18 + 34) = v75;

    if (!*((void *)v18 + 34)) {
      goto LABEL_66;
    }
    objc_msgSend(*((id *)v18 + 5), "addObject:");
    v77 = objc_alloc_init(VCPVideoCNNCameraMotion);
    v78 = (void *)*((void *)v18 + 33);
    *((void *)v18 + 33) = v77;

    if (!*((void *)v18 + 33)) {
      goto LABEL_66;
    }
    objc_msgSend(*((id *)v18 + 5), "addObject:");
  }
  if ((a9 & 0x40000) != 0)
  {
    if (v98)
    {
      v79 = objc_alloc_init(VCPVideoCNNAutoplay);
      v80 = (void *)*((void *)v18 + 32);
      *((void *)v18 + 32) = v79;

      if (!*((void *)v18 + 32)) {
        goto LABEL_66;
      }
      v40 = v37;
      goto LABEL_48;
    }
    if (+[VCPVideoCNNAnalyzer isMLHighlightEnabled])
    {
      v81 = objc_alloc_init(VCPVideoCNNHighlight);
      v82 = (void *)*((void *)v18 + 35);
      *((void *)v18 + 35) = v81;

      if (!*((void *)v18 + 35)) {
        goto LABEL_66;
      }
      objc_msgSend(*v40, "addObject:");
      if (!*((void *)v18 + 34))
      {
        v96 = objc_alloc_init(VCPVideoCNNQuality);
        v97 = (void *)*((void *)v18 + 34);
        *((void *)v18 + 34) = v96;

        if (!*((void *)v18 + 34)) {
          goto LABEL_66;
        }
LABEL_48:
        objc_msgSend(*v40, "addObject:");
      }
    }
  }
  int v83 = !+[VCPVideoCNNAnalyzer isMUBackboneEnabled];
  if ((a9 & 0x80000000000) == 0) {
    LOBYTE(v83) = 1;
  }
  if (v83)
  {
LABEL_63:
    v18[57] = 0;
    LODWORD(v84) = 1.0;
    if (![v18 configForAspectRatio:v84])
    {
LABEL_64:
      v91 = v18;
      goto LABEL_67;
    }
LABEL_66:
    v91 = 0;
    goto LABEL_67;
  }
  v85 = VCPSignPostLog();
  os_signpost_id_t v86 = os_signpost_id_generate(v85);

  v87 = VCPSignPostLog();
  v88 = v87;
  if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v88, OS_SIGNPOST_INTERVAL_BEGIN, v86, "VCPMovieAnalyzer_Video_VCPVideoBackboneInit", "", (uint8_t *)&buf, 2u);
  }

  v89 = [[VCPVideoTransformerBackbone alloc] initWithConfig:*((void *)v18 + 31)];
  v90 = (void *)*((void *)v18 + 2);
  *((void *)v18 + 2) = v89;

  v91 = (void *)*((void *)v18 + 2);
  if (v91)
  {
    v92 = VCPSignPostLog();
    v93 = v92;
    if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v93, OS_SIGNPOST_INTERVAL_END, v86, "VCPMovieAnalyzer_Video_VCPVideoBackboneInit", "", (uint8_t *)&buf, 2u);
    }

    goto LABEL_63;
  }
LABEL_67:
  v94 = v91;

  return v94;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  inputDataSettling = self->_inputDataSettling;
  if (inputDataSettling) {
    MEMORY[0x1C186C790](inputDataSettling, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoCNNAnalyzer;
  [(VCPVideoCNNAnalyzer *)&v5 dealloc];
}

- (int)configForAspectRatio:(float)a3
{
  personDetector = self->_personDetector;
  self->_personDetector = (VCPVideoPersonDetector *)&stru_1F15A0D70;

  self->_inputWidth = 224;
  self->_inputHeight = 224;
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  inputDataSettling = self->_inputDataSettling;
  if (inputDataSettling)
  {
    MEMORY[0x1C186C790](inputDataSettling, 0x1000C8052888210);
    self->_inputDataSettling = 0;
  }
  int v7 = self->_inputHeight * self->_inputWidth;
  int v8 = 16 * v7;
  uint64_t v9 = 192 * v7;
  if (v8 < 0) {
    size_t v10 = -1;
  }
  else {
    size_t v10 = v9;
  }
  v11 = (float *)operator new[](v10, MEMORY[0x1E4FBA2D0]);
  self->_inputData = v11;
  if (!v11) {
    return -108;
  }
  if (+[VCPVideoCNNAnalyzer isMLSettlingEffectPregatingEnabled])
  {
    int v12 = self->_inputHeight * self->_inputWidth;
    int v13 = 16 * v12;
    uint64_t v14 = 192 * v12;
    size_t v15 = v13 < 0 ? -1 : v14;
    v16 = (float *)operator new[](v15, MEMORY[0x1E4FBA2D0]);
    self->_inputDataSettling = v16;
    if (!v16) {
      return -108;
    }
  }
  videoTransformerBackbone = self->_videoTransformerBackbone;
  if (!videoTransformerBackbone) {
    return 0;
  }
  if ([(VCPVideoTransformerBackbone *)videoTransformerBackbone inputTensorSize] != 48 * self->_inputHeightMUBB * self->_inputWidthMUBB / self->_mubbSampleScale) {
    return 0;
  }
  v18 = [[VCPEspressoV2Data alloc] initWithTensorType:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorType] size:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorSize]];
  inputDataForTransformer = self->_inputDataForTransformer;
  self->_inputDataForTransformer = v18;

  if (!self->_inputDataForTransformer) {
    return -108;
  }
  uint64_t v20 = [[VCPEspressoV2Data alloc] initWithTensorType:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorType] size:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorSize]];
  inputDataBackup = self->_inputDataBackup;
  self->_inputDataBackup = v20;

  if (self->_inputDataBackup) {
    return 0;
  }
  else {
    return -108;
  }
}

- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5
{
  if (a4 != 3) {
    return -50;
  }
  BOOL v5 = a5;
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v13) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return -50;
  }
  int v10 = Height;
  CVReturn v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v45 = v11;
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (v10 > 0)
    {
      int v27 = 0;
      long long v28 = &OBJC_IVAR___VCPVideoCNNAnalyzer__inputData;
      if (v5) {
        long long v28 = &OBJC_IVAR___VCPVideoCNNAnalyzer__inputDataSettling;
      }
      uint64_t v29 = *v28;
      int v30 = self->_inputHeight * self->_inputWidth;
      id v31 = &OBJC_IVAR___VCPVideoCNNAnalyzer__validFrames;
      if (v5) {
        id v31 = &OBJC_IVAR___VCPVideoCNNAnalyzer__validFramesSettling;
      }
      int v32 = *(_DWORD *)((char *)&self->super.super.isa + *v31);
      int v33 = v32 & 0xF;
      int v35 = -v32;
      BOOL v34 = v35 < 0;
      int v36 = v35 & 0xF;
      if (v34) {
        int v37 = v33;
      }
      else {
        int v37 = -v36;
      }
      int v38 = v30 * v37;
      uint64_t v39 = *(uint64_t *)((char *)&self->super.super.isa + v29);
      uint64_t v40 = v39 + 4 * (v38 + 32 * v30);
      uint64_t v41 = v39 + 4 * (v38 + 16 * v30);
      uint64_t v42 = v39 + 4 * v38;
      uint64_t v43 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          uint64_t v44 = 0;
          do
          {
            LOBYTE(v24) = BaseAddress[(int)v44 + 2];
            LOBYTE(v25) = BaseAddress[(int)v44 + 1];
            float v25 = (float)LODWORD(v25) / 255.0;
            LOBYTE(v26) = BaseAddress[(int)v44];
            float v26 = (float)LODWORD(v26);
            *(float *)(v42 + v44) = (float)((float)((float)LODWORD(v24) / 255.0) + -0.45) / 0.225;
            *(float *)(v41 + v44) = (float)(v25 + -0.45) / 0.225;
            float v24 = (float)((float)(v26 / 255.0) + -0.45) / 0.225;
            *(float *)(v40 + v44) = v24;
            v44 += 4;
          }
          while (4 * Width != v44);
        }
        BaseAddress += BytesPerRow;
        ++v27;
        v40 += v43;
        v41 += v43;
        v42 += v43;
      }
      while (v27 != v10);
    }
    int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v45);
    if (pixelBuffer
      && !v45
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  return v12;
}

- (int)copyMUBBImage:(__CVBuffer *)a3 withChannels:(int)a4
{
  if (+[VCPVideoTransformerBackbone revision] == 3
    || +[VCPVideoTransformerBackbone revision] == 4
    || +[VCPVideoTransformerBackbone revision] == 5)
  {
    unsigned int v39 = 32;
    int v8 = 11;
  }
  else
  {
    unsigned int v39 = 16;
    int v8 = 14;
  }
  if (a4 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v40 = v9;
    if (v9)
    {
      int v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      int v10 = 0;
      int v23 = HIDWORD(self->_timeStart.epoch) & 0xF;
      if (SHIDWORD(self->_timeStart.epoch) <= 0) {
        int v23 = -(-BYTE4(self->_timeStart.epoch) & 0xF);
      }
      int mubbSampleScale = self->_mubbSampleScale;
      if (!(v23 % mubbSampleScale))
      {
        if (Height >= 1)
        {
          unsigned int v35 = 0;
          int v25 = 3 * Height * Width * (v23 / mubbSampleScale);
          int v37 = v25 + Height * Width;
          int v38 = v25;
          int v36 = v25 + 2 * Height * Width;
          uint64_t v32 = BytesPerRow;
          do
          {
            if (Width >= 1)
            {
              uint64_t v26 = 0;
              int v27 = 1;
              do
              {
                LOBYTE(v22) = BaseAddress[v27 + 1];
                unsigned int v28 = BaseAddress[v27];
                LOBYTE(v4) = BaseAddress[v27 - 1];
                int v29 = v26 / v39 + (v35 / v39 + (((v39 - 1) & v26) + (v35 & (v39 - 1)) * v39) * v8) * v8;
                *(float *)&double v22 = (float)((float)((float)LODWORD(v22) / 255.0) + -0.48145) / 0.26863;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataForTransformer, "setValueFP:atIndex:", v29 + v38, v22, v32);
                *(float *)&double v30 = (float)((float)((float)v28 / 255.0) + -0.45783) / 0.2613;
                [(VCPEspressoV2Data *)self->_inputDataForTransformer setValueFP:v37 + v29 atIndex:v30];
                *(float *)&double v31 = (float)((float)((float)v4 / 255.0) + -0.40821) / 0.27578;
                [(VCPEspressoV2Data *)self->_inputDataForTransformer setValueFP:v36 + v29 atIndex:v31];
                ++v26;
                v27 += 4;
              }
              while (Width != v26);
            }
            BaseAddress += v32;
            ++v35;
          }
          while (v35 != Height);
        }
        int v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v40);
      }
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    int v10 = -50;
    int v40 = -50;
  }
  if (pixelBuffer
    && !v40
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
  }
  return v10;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CMTime lhs = *(CMTime *)a4;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->_mubbSampleScale + 1);
  rhs.epoch = *(void *)&self->_timeLastProcess.flags;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= *((float *)&self->_timeEnd.epoch + 1))
  {
    CMTime lhs = (CMTime)*a4;
    CMTime rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
    BOOL v17 = CMTimeCompare(&lhs, &rhs) >= 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  CMTime v64 = (CMTime)*a4;
  double Seconds = CMTimeGetSeconds(&v64);
  long long v55 = a5;
  if (v17)
  {
    if (LOBYTE(self->_validFramesSettling)) {
      BOOL v19 = LOBYTE(self->_timeEnd.epoch) == 0;
    }
    else {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
  BOOL v20 = Seconds > (float)(*(float *)&self->_postInference + -0.5)
     && !BYTE1(self->_validFramesSettling)
     && LOBYTE(self->_timeEnd.epoch)
     && self->_inputDataSettling != 0;
  if (!v19 && !v20) {
    return 0;
  }
  if ((self->_timeLastDetection.timescale & 1) == 0)
  {
    long long v21 = *(_OWORD *)&a4->var0;
    *(void *)&self->_timeLastDetection.flags = a4->var3;
    *(_OWORD *)((char *)&self->_timeLastProcess.epoch + 4) = v21;
  }
  float v22 = (float)Width;
  float v23 = (float)Height;
  v53 = (long long *)((char *)&self->_timeLastProcess.epoch + 4);
  if ((float)((float)Height * 1.2) >= (float)Width)
  {
    if ((float)(v22 * 1.2) < v23)
    {
      double v14 = (float)((float)(Height - Width) / (float)(v23 + v23));
      double v16 = (float)(v22 / v23);
      double v15 = 1.0;
      double v13 = 0.0;
    }
  }
  else
  {
    double v13 = (float)((float)(Width - Height) / (float)(v22 + v22));
    double v15 = (float)(v23 / v22);
    double v16 = 1.0;
    double v14 = 0.0;
  }
  int v25 = VCPSignPostLog();
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  int v27 = VCPSignPostLog();
  unsigned int v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", "", (uint8_t *)&lhs, 2u);
  }

  int v29 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v13, v14, v15, v16);
  if (!v29) {
    return -18;
  }
  double v30 = v29;
  transformImageMUBB = self->_transformImageMUBB;
  if (transformImageMUBB)
  {
    uint64_t v32 = -[VCPTransforms cropAndScale:regionCrop:](transformImageMUBB, "cropAndScale:regionCrop:", a3, v13, v14, v15, v16);
    if (!v32)
    {
      int v24 = -18;
      uint64_t v32 = v30;
LABEL_58:
      CFRelease(v32);
      return v24;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }
  BOOL v52 = v20;
  int v33 = VCPSignPostLog();
  BOOL v34 = v33;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v26, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", "", (uint8_t *)&lhs, 2u);
  }

  if (v19)
  {
    int v24 = [(VCPVideoCNNAnalyzer *)self copyImage:v30 withChannels:3 settling:0];
    if (v24) {
      goto LABEL_57;
    }
    unsigned int v35 = VCPSignPostLog();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    int v37 = VCPSignPostLog();
    int v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", "", (uint8_t *)&lhs, 2u);
    }

    unsigned int v39 = self->_transformImageMUBB ? v32 : v30;
    int v24 = [(VCPVideoCNNAnalyzer *)self copyMUBBImage:v39 withChannels:3];
    if (v24) {
      goto LABEL_57;
    }
    int v40 = VCPSignPostLog();
    uint64_t v41 = v40;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, v36, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", "", (uint8_t *)&lhs, 2u);
    }

    uint64_t v42 = *(void **)&self->_enoughFrames;
    if (v42)
    {
      if (HIDWORD(self->_timeStart.epoch) == 8)
      {
        long long v62 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        long long v60 = *(_OWORD *)&v55->var0;
        int64_t v61 = v55->var3;
        int v24 = [v42 analyzeFrame:v30 withTimestamp:&v62 andDuration:&v60 flags:a6];
        if (v24) {
          goto LABEL_57;
        }
      }
    }
    int epoch_high = HIDWORD(self->_timeStart.epoch);
    HIDWORD(self->_timeStart.epoch) = epoch_high + 1;
    if (epoch_high >= 15)
    {
      LOBYTE(self->_validFramesSettling) = 1;
      BYTE2(self->_validFramesSettling) = 1;
      long long v44 = *(_OWORD *)&a4->var0;
      *(void *)&self->_timeEnd.timescale = a4->var3;
      *(_OWORD *)&self->_regionCrop.size.height = v44;
      *(double *)&self->_highlight = v13;
      self->_regionCrop.origin.x = v14;
      self->_regionCrop.origin.y = v15;
      self->_regionCrop.size.width = v16;
      if (!LOBYTE(self->_timeEnd.epoch))
      {
        v48 = *(void **)&self->_enoughFrames;
        if (v48)
        {
          long long v56 = [v48 persons];
        }
        else
        {
          long long v56 = 0;
        }
        long long v58 = *v53;
        uint64_t v59 = *(void *)&self->_timeLastDetection.flags;
        CMTime lhs = (CMTime)*a4;
        *(_OWORD *)&rhs.value = *v53;
        rhs.epoch = *(void *)&self->_timeLastDetection.flags;
        CMTimeSubtract(&v57, &lhs, &rhs);
        int v24 = -[VCPVideoCNNAnalyzer runTasks:duration:persons:regionCrop:](self, "runTasks:duration:persons:regionCrop:", &v58, &v57, v56, v13, v14, v15, v16);
        if (v24)
        {

          goto LABEL_57;
        }
        HIDWORD(self->_timeStart.epoch) = 0;
        long long v49 = *(_OWORD *)&a4->var0;
        *(void *)&self->_timeLastDetection.flags = a4->var3;
        long long *v53 = v49;
        BOOL v50 = self->_inputDataBackup;
        objc_storeStrong((id *)&self->_inputDataBackup, self->_inputDataForTransformer);
        inputDataForTransformer = self->_inputDataForTransformer;
        self->_inputDataForTransformer = v50;
        v51 = v50;

        LOBYTE(self->_validFramesSettling) = 0;
        BYTE2(self->_validFramesSettling) = 0;
      }
    }
    long long v45 = *(_OWORD *)&a4->var0;
    *(void *)&self->_timeLastProcess.flags = a4->var3;
    *(_OWORD *)(&self->_mubbSampleScale + 1) = v45;
  }
  if (!v52) {
    goto LABEL_56;
  }
  int v24 = [(VCPVideoCNNAnalyzer *)self copyImage:v30 withChannels:3 settling:1];
  if (v24) {
    goto LABEL_57;
  }
  int validFrames = self->_validFrames;
  self->_int validFrames = validFrames + 1;
  if (validFrames >= 15)
  {
    int v24 = 0;
    BYTE1(self->_validFramesSettling) = 1;
  }
  else
  {
LABEL_56:
    int v24 = 0;
  }
LABEL_57:
  CFRelease(v30);
  if (v32) {
    goto LABEL_58;
  }
  return v24;
}

- (int)loadAnalysisResultsFrom:(id)a3 actionAnalyzer:(id)a4 atTime:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_quality
    && SHIDWORD(self->_timeStart.epoch) >= 15
    && (*(_OWORD *)&lhs.start.value = *(_OWORD *)&a5->var0,
        lhs.start.epoch = a5->var3,
        CMTime rhs = *(CMTime *)(&self->_mubbSampleScale + 1),
        CMTimeSubtract(&time, &lhs.start, &rhs),
        CMTimeGetSeconds(&time) >= 0.125)
    && (self->_timeLastDetection.timescale & 1) != 0)
  {
    memset(&lhs, 0, sizeof(lhs));
    CMTime start = *(CMTime *)((char *)&self->_timeLastProcess.epoch + 4);
    CMTime end = (CMTime)*a5;
    CMTimeRangeFromTimeToTime(&lhs, &start, &end);
    BOOL v12 = [MEMORY[0x1E4F1CA60] dictionary];
    CMTimeRange v16 = lhs;
    double v13 = [v8 clipResults:&v16];
    [v12 addEntriesFromDictionary:v13];

    CMTimeRange v15 = lhs;
    double v14 = [v9 clipResults:&v15];
    [v12 addEntriesFromDictionary:v14];

    int v10 = [(VCPVideoCNNQuality *)self->_quality loadAnalysisResults:v12];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (int)loadFullAnalysisResults:(id)a3 actionAnalysisResults:(id)a4 predictedTimeRange:(id *)a5 timestamp:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (self->_quality)
  {
    if (SHIDWORD(self->_timeStart.epoch) >= 15)
    {
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&a6->var0;
      lhs.start.epoch = a6->var3;
      CMTime rhs = *(CMTime *)(&self->_mubbSampleScale + 1);
      CMTimeSubtract(&time, &lhs.start, &rhs);
      if (CMTimeGetSeconds(&time) >= 0.125 && (self->_timeLastDetection.timescale & 1) != 0)
      {
        memset(&lhs, 0, sizeof(lhs));
        CMTime start = *(CMTime *)((char *)&self->_timeLastProcess.epoch + 4);
        CMTime end = (CMTime)*a6;
        CMTimeRangeFromTimeToTime(&lhs, &start, &end);
        CMTimeRange v26 = lhs;
        long long v19 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&range2.start.value = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&range2.start.epoch = v19;
        *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a5->var1.var1;
        if (CMTimeRangeEqual(&v26, &range2))
        {
          BOOL v20 = [MEMORY[0x1E4F1CA60] dictionary];
          [v20 addEntriesFromDictionary:v10];
          [v20 addEntriesFromDictionary:v11];
          int v14 = [(VCPVideoCNNQuality *)self->_quality loadAnalysisResults:v20];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
LABEL_11:
            int v14 = -18;
            goto LABEL_12;
          }
          BOOL v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            long long v21 = objc_opt_class();
            LODWORD(rhs.value) = 138412290;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v21;
            id v22 = v21;
            _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "[%@] Error: predictedTimeRange mismatches timeRange", (uint8_t *)&rhs, 0xCu);
          }
          int v14 = -18;
        }

        goto LABEL_12;
      }
    }
  }
  long long v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v23.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v23.start.epoch = v13;
  *(_OWORD *)&v23.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if (!CMTimeRangeEqual(&range1, &v23))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      CMTimeRange v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        CMTimeRange v16 = objc_opt_class();
        LODWORD(lhs.start.value) = 138412290;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v16;
        id v17 = v16;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[%@] Error: predictedTimeRange should be invalid...", (uint8_t *)&lhs, 0xCu);
      }
    }
    goto LABEL_11;
  }
  int v14 = 0;
LABEL_12:

  return v14;
}

- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  resConfig = self->_resConfig;
  if (resConfig) {
    int v9 = [(NSString *)resConfig loadAnalysisResults:v6 audioResults:v7];
  }
  else {
    int v9 = 0;
  }

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)isAnalysisResultNeeded:(SEL)a3
{
  if (self[11].var3
    && (BOOL v5 = self, (int)self[9].var2 >= 15)
    && (CMTime lhs = *(CMTime *)a4,
        *(_OWORD *)&rhs.value = *(_OWORD *)&self[6].var2,
        rhs.epoch = *(int64_t *)((char *)&self[7].var0 + 4),
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) >= 0.125))
  {
    p_var2 = &v5[7].var2;
  }
  else
  {
    p_var2 = (unsigned int *)MEMORY[0x1E4F1F9F8];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var2;
  retstr->int64_t var3 = *((void *)p_var2 + 2);
  return self;
}

- (int)runTasks:(id *)a3 duration:(id *)a4 persons:(id)a5 regionCrop:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  if (!self->_backbone)
  {
    int v14 = [[VCPVideoCNNBackbone alloc] initWithConfig:self->_personDetector];
    backbone = self->_backbone;
    self->_backbone = v14;

    if (!self->_backbone)
    {
      int v20 = -108;
      goto LABEL_42;
    }
  }
  if (BYTE2(self->_validFramesSettling) && self->_videoTransformerBackbone)
  {
    CMTimeRange v16 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = VCPSignPostLog();
    long long v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMovieAnalyzer_Video_VCPVideoBackboneInference", "", buf, 2u);
    }

    int v20 = [(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inference:self->_inputDataForTransformer];
    if (v20) {
      goto LABEL_42;
    }
    long long v21 = VCPSignPostLog();
    id v22 = v21;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v17, "VCPMovieAnalyzer_Video_VCPVideoBackboneInference", "", buf, 2u);
    }

    videoEmbeddings = self->_videoEmbeddings;
    if (videoEmbeddings)
    {
      int v24 = [(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone embedding];
      long long v67 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      long long v65 = *(_OWORD *)&a4->var0;
      int64_t v66 = a4->var3;
      [(VCPVideoEmbeddings *)videoEmbeddings addEmbeddings:v24 startTime:&v67 duration:&v65];
    }
    videoCaptionAnalyzer = self->_videoCaptionAnalyzer;
    if (videoCaptionAnalyzer)
    {
      CMTimeRange v26 = [(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone spatialEmbedding];
      long long v63 = *(_OWORD *)&a3->var0;
      int64_t v64 = a3->var3;
      long long v61 = *(_OWORD *)&a4->var0;
      int64_t v62 = a4->var3;
      [(VCPVideoCaptionAnalyzer *)videoCaptionAnalyzer generateCaptionWithEmbedding:v26 startTime:&v63 duration:&v61];
    }
  }
  if (LOBYTE(self->_validFramesSettling))
  {
    int v20 = [(VCPVideoCNNBackbone *)self->_backbone inference:self->_inputData settling:0];
    if (v20) {
      goto LABEL_42;
    }
    videoEmbeddingsX3D = self->_videoEmbeddingsX3D;
    if (videoEmbeddingsX3D)
    {
      unsigned int v28 = [(VCPVideoCNNBackbone *)self->_backbone tensorBeforeTemporalPooling];
      long long v59 = *(_OWORD *)&a3->var0;
      int64_t v60 = a3->var3;
      long long v57 = *(_OWORD *)&a4->var0;
      int64_t v58 = a4->var3;
      [(VCPVideoEmbeddings *)videoEmbeddingsX3D addEmbeddings:v28 startTime:&v59 duration:&v57];
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v29 = self->_tasks;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v53 objects:v71 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v54;
LABEL_22:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v29);
        }
        int v33 = *(void **)(*((void *)&v53 + 1) + 8 * v32);
        BOOL v34 = self->_backbone;
        long long v51 = *(_OWORD *)&a3->var0;
        int64_t v52 = a3->var3;
        long long v49 = *(_OWORD *)&a4->var0;
        int64_t v50 = a4->var3;
        int v20 = objc_msgSend(v33, "run:withPersons:andRegionCrop:atTime:andDuration:", v34, v13, &v51, &v49, x, y, width, height);
        if (v20) {
          goto LABEL_40;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v53 objects:v71 count:16];
          if (v30) {
            goto LABEL_22;
          }
          break;
        }
      }
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    int v29 = self->_privateTasks;
    uint64_t v35 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v45 objects:v70 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v46;
LABEL_30:
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v29);
        }
        int v38 = *(void **)(*((void *)&v45 + 1) + 8 * v37);
        unsigned int v39 = self->_backbone;
        long long v43 = *(_OWORD *)&a3->var0;
        int64_t v44 = a3->var3;
        long long v41 = *(_OWORD *)&a4->var0;
        int64_t v42 = a4->var3;
        int v20 = objc_msgSend(v38, "run:withPersons:andRegionCrop:atTime:andDuration:", v39, v13, &v43, &v41, x, y, width, height);
        if (v20) {
          break;
        }
        if (v35 == ++v37)
        {
          uint64_t v35 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v45 objects:v70 count:16];
          if (v35) {
            goto LABEL_30;
          }
          goto LABEL_36;
        }
      }
LABEL_40:

      goto LABEL_42;
    }
LABEL_36:
  }
  if (BYTE1(self->_validFramesSettling)) {
    int v20 = [(VCPVideoCNNBackbone *)self->_backbone inference:self->_inputDataSettling settling:1];
  }
  else {
    int v20 = 0;
  }
LABEL_42:

  return v20;
}

- (void)copyFrames
{
  int mubbSampleScale = self->_mubbSampleScale;
  uint64_t v4 = 228;
  int epoch_high = HIDWORD(self->_timeStart.epoch);
  unint64_t v6 = 0x1E9F91000uLL;
  if (epoch_high / mubbSampleScale >= 1)
  {
    unsigned int v7 = epoch_high / mubbSampleScale + 1;
    int v8 = 16 / mubbSampleScale - 1;
    do
    {
      inputDataForTransformer = self->_inputDataForTransformer;
      uint64_t v10 = [(VCPEspressoV2Data *)inputDataForTransformer getData:[(VCPEspressoV2Data *)inputDataForTransformer tensorType]];
      int v11 = 3 * self->_inputHeight * self->_inputWidth;
      [(VCPEspressoV2Data *)inputDataForTransformer copyDataFrom:v10 srcStart:(int)(v11 * (v7 - 2)) dstStart:v11 * v8 length:v11];
      --v7;
      --v8;
    }
    while (v7 > 1);
    int mubbSampleScale = self->_mubbSampleScale;
    uint64_t v4 = 228;
    int epoch_high = HIDWORD(self->_timeStart.epoch);
    unint64_t v6 = 0x1E9F91000;
  }
  if (16 / mubbSampleScale > epoch_high)
  {
    unint64_t v12 = 0x1E9F91000uLL;
    int v13 = 0;
    int v14 = 0;
    uint64_t v24 = 128;
    uint64_t v25 = *(int *)(v6 + 1884);
    int v15 = 3 * (epoch_high / mubbSampleScale);
    do
    {
      CMTimeRange v16 = *(Class *)((char *)&self->super.super.isa + v25);
      unint64_t v17 = v12;
      uint64_t v18 = *(Class *)((char *)&self->super.super.isa + v24);
      uint64_t v19 = v4;
      uint64_t v20 = objc_msgSend(v16, "tensorType", v24, v25);
      long long v21 = v18;
      unint64_t v12 = v17;
      uint64_t v22 = [v21 getData:v20];
      int v23 = *(_DWORD *)((char *)&self->super.super.isa + *(int *)(v17 + 1856)) * self->_inputWidth;
      [v16 copyDataFrom:v22 srcStart:v23 * (v15 + v13) dstStart:v23 * v13 length:3 * v23];
      uint64_t v4 = v19;
      ++v14;
      v13 += 3;
    }
    while (v14 < 16 / self->_mubbSampleScale - *(_DWORD *)((char *)&self->super.super.isa + v19));
  }
  BYTE2(self->_validFramesSettling) = 1;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((HIDWORD(self->_timeStart.epoch) - 1) <= 0xE && !LOBYTE(self->_timeEnd.epoch)) {
    [(VCPVideoCNNAnalyzer *)self copyFrames];
  }
  if (LOBYTE(self->_validFramesSettling) || BYTE1(self->_validFramesSettling) || BYTE2(self->_validFramesSettling))
  {
    if (!LOBYTE(self->_timeEnd.epoch))
    {
      long long v5 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.epoch = v5;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&lhs, &range);
      *(CMTime *)&self->_regionCrop.size.double height = lhs;
      CMTimeMake(&v20, 60, 30);
      CMTime lhs = *(CMTime *)&self->_regionCrop.size.height;
      CMTime rhs = v20;
      CMTimeSubtract(&v21, &lhs, &rhs);
      *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4) = v21;
    }
    long long v18 = *(_OWORD *)((char *)&self->_timeLastDetection.epoch + 4);
    uint64_t v19 = *(void *)&self->_timeStart.flags;
    CMTime lhs = *(CMTime *)&self->_regionCrop.size.height;
    CMTime rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
    CMTimeSubtract(&v17, &lhs, &rhs);
    int v6 = -[VCPVideoCNNAnalyzer runTasks:duration:persons:regionCrop:](self, "runTasks:duration:persons:regionCrop:", &v18, &v17, 0, *(double *)&self->_highlight, self->_regionCrop.origin.x, self->_regionCrop.origin.y, self->_regionCrop.size.width);
    if (v6) {
      return v6;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unsigned int v7 = self->_postTasks;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          int v6 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "run:", self->_backbone, (void)v13);
          if (v6)
          {

            return v6;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  if (!self->_videoEmbeddings) {
    return 0;
  }
  int v6 = -[VCPEmbeddingSummarizationAnalyzer findSummarizedEmbeddings:](self->_embeddingSummarizationAnalyzer, "findSummarizedEmbeddings:");
  if (!v6)
  {
    if (self->_videoEmbeddings)
    {
      if (self->_videoEmbeddingsX3D)
      {
        adaptiveSegmentAnalyzer = self->_adaptiveSegmentAnalyzer;
        if (adaptiveSegmentAnalyzer) {
          -[VCPAdaptiveSegmentAnalyzer calculateAdaptiveSegments:videoEmbeddingsX3D:](adaptiveSegmentAnalyzer, "calculateAdaptiveSegments:videoEmbeddingsX3D:");
        }
      }
    }
    return 0;
  }
  return v6;
}

- (id)privateResults
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = self->_privateTasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v9 = [v8 results];
        BOOL v10 = [v9 count] == 0;

        if (!v10)
        {
          int v11 = [v8 results];
          [v3 addEntriesFromDictionary:v11];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v12 = self->_tasks;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        CMTime v17 = objc_msgSend(v16, "results", (void)v21);
        BOOL v18 = [v17 count] == 0;

        if (!v18)
        {
          uint64_t v19 = [v16 results];
          [v3 addEntriesFromDictionary:v19];
        }
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  return v3;
}

- (id)results
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v4 = self->_tasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v9 = [v8 results];
        BOOL v10 = [v9 count] == 0;

        if (!v10)
        {
          int v11 = [v8 results];
          [v3 addEntriesFromDictionary:v11];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v5);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v12 = self->_postTasks;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        CMTime v17 = objc_msgSend(v16, "results", (void)v30);
        BOOL v18 = [v17 count] == 0;

        if (!v18)
        {
          uint64_t v19 = [v16 results];
          [v3 addEntriesFromDictionary:v19];
        }
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v13);
  }

  videoEmbeddings = self->_videoEmbeddings;
  if (videoEmbeddings)
  {
    long long v21 = [(VCPVideoEmbeddings *)videoEmbeddings videoEmbeddingsFp16];
    [v3 setObject:v21 forKeyedSubscript:@"VideoEmbeddingResults"];

    long long v22 = [(VCPEmbeddingSummarizationAnalyzer *)self->_embeddingSummarizationAnalyzer summarizedEmbeddings];
    [v3 setObject:v22 forKeyedSubscript:@"SummarizedEmbeddingResults"];
  }
  adaptiveSegmentAnalyzer = self->_adaptiveSegmentAnalyzer;
  if (adaptiveSegmentAnalyzer)
  {
    long long v24 = [(VCPAdaptiveSegmentAnalyzer *)adaptiveSegmentAnalyzer adaptiveEmbeddings];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      long long v26 = [(VCPAdaptiveSegmentAnalyzer *)self->_adaptiveSegmentAnalyzer adaptiveEmbeddings];
      [v3 setObject:v26 forKeyedSubscript:@"AdaptiveSegmentResults"];
    }
  }
  videoCaptionAnalyzer = self->_videoCaptionAnalyzer;
  if (videoCaptionAnalyzer)
  {
    long long v28 = [(VCPVideoCaptionAnalyzer *)videoCaptionAnalyzer segmentCaptionResults];
    [v3 addEntriesFromDictionary:v28];
  }
  return v3;
}

- (BOOL)highlightEnabled
{
  return self->_quality != 0;
}

- (BOOL)postInference
{
  return self->_timeEnd.epoch;
}

- (float)minProcessingInterval
{
  return *((float *)&self->_timeEnd.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStart
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[8].var2;
  retstr->int64_t var3 = *(int64_t *)((char *)&self[9].var0 + 4);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_cameraMotion, 0);
  objc_storeStrong((id *)&self->_autoplay, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_personDetector, 0);
  objc_storeStrong((id *)&self->_enoughFrames, 0);
  objc_storeStrong((id *)&self->_inputDataBackup, 0);
  objc_storeStrong((id *)&self->_inputDataForTransformer, 0);
  objc_storeStrong((id *)&self->_videoCaptionAnalyzer, 0);
  objc_storeStrong((id *)&self->_embeddingSummarizationAnalyzer, 0);
  objc_storeStrong((id *)&self->_adaptiveSegmentAnalyzer, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingsX3D, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
  objc_storeStrong((id *)&self->_privateTasks, 0);
  objc_storeStrong((id *)&self->_postTasks, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_transformImageMUBB, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
  objc_storeStrong((id *)&self->_videoTransformerBackbone, 0);
  objc_storeStrong((id *)&self->_backbone, 0);
}

- (void)copyImage:(uint64_t)a3 withChannels:(uint64_t)a4 settling:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyImage:withChannels:settling:.cold.2()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
}

- (void)copyImage:withChannels:settling:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to lock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
}

@end