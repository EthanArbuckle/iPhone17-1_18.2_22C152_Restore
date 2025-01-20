@interface VCPVideoCaptionAnalyzer
+ (id)sharedCVNLPCaptionDecoderWithOptions:(id)a3 identifier:(id)a4;
+ (id)sharedCaptionerWithConfig:(id)a3 identifier:(id)a4;
+ (int64_t)mode;
- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameNumber:(unint64_t)a4;
- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameRate:(float)a4 timeRange:(id *)a5;
- (id)results;
- (id)segmentCaptionResults;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)configInputBasedOnDevice;
- (int)configVideoCaptionModels;
- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4;
- (int)copyMUBBImage:(__CVBuffer *)a3 withChannels:(int)a4;
- (int)finishAnalysisPass:(id *)a3;
- (int)generateCaptionWithEmbedding:(id)a3 startTime:(id *)a4 duration:(id *)a5;
- (int)inference:(id *)a3 duration:(id *)a4;
- (void)dealloc;
@end

@implementation VCPVideoCaptionAnalyzer

+ (int64_t)mode
{
  if (+[VCPVideoCaptionAnalyzer mode]::once != -1) {
    dispatch_once(&+[VCPVideoCaptionAnalyzer mode]::once, &__block_literal_global_20);
  }
  return +[VCPVideoCaptionAnalyzer mode]::mode;
}

void __31__VCPVideoCaptionAnalyzer_mode__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer()) {
    +[VCPVideoCaptionAnalyzer mode]::mode = 1;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      int v1 = 134217984;
      uint64_t v2 = +[VCPVideoCaptionAnalyzer mode]::mode;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_INFO, "[VideoCaption] VideoCaptionMode set to %ld", (uint8_t *)&v1, 0xCu);
    }
  }
}

- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameRate:(float)a4 timeRange:(id *)a5
{
  if (a4 <= 0.0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "VideoCaptionAnalyzer: frameRate should be larger than 0";
LABEL_10:
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
      }
LABEL_11:
    }
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  long long v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&time, &range);
  if (CMTimeGetSeconds(&time) <= 0.0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "VideoCaptionAnalyzer: timeRange should be larger than 0";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v15.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v15.start.epoch = v10;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v16, &v15);
  self = [(VCPVideoCaptionAnalyzer *)self initWithModelType:a3 frameNumber:vcvtmd_u64_f64(CMTimeGetSeconds(&v16) * a4) + 1];
  v11 = self;
LABEL_13:

  return v11;
}

- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameNumber:(unint64_t)a4
{
  v43.receiver = self;
  v43.super_class = (Class)VCPVideoCaptionAnalyzer;
  v6 = [(VCPVideoCaptionAnalyzer *)&v43 init];
  v7 = v6;
  v8 = (unsigned int *)v6;
  long long v9 = v6;
  if (v6)
  {
    long long v10 = (long long *)MEMORY[0x1E4F1FA08];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v6 + 84) = *MEMORY[0x1E4F1FA08];
    *(void *)(v6 + 100) = v11;
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v6 + 108) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v6 + 124) = v12;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = (void *)*((void *)v8 + 24);
    *((void *)v8 + 24) = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CMTime v16 = (void *)*((void *)v8 + 22);
    *((void *)v8 + 22) = v15;

    v17 = (void *)*((void *)v8 + 21);
    *((void *)v8 + 21) = &stru_1F15A0D70;

    *((void *)v8 + 6) = 0;
    v18 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = 0;

    v8[39] = 0;
    v19 = v7 + 132;
    long long v20 = *v10;
    *(void *)(v7 + 148) = *((void *)v10 + 2);
    *(_OWORD *)(v7 + 132) = v20;
    long long v21 = *v10;
    *((void *)v7 + 27) = *((void *)v10 + 2);
    *(_OWORD *)(v7 + 200) = v21;
    *((unsigned char *)v8 + 164) = 0;
    v22 = (void *)*((void *)v8 + 29);
    *((void *)v8 + 29) = 0;

    v23 = (void *)*((void *)v8 + 30);
    *((void *)v8 + 30) = 0;

    v24 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = 0;

    *((void *)v8 + 4) = a3;
    v25 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = 0;

    if ([v8 configVideoCaptionModels]
      || [v8 configInputBasedOnDevice])
    {
      long long v9 = 0;
    }
    else
    {
      id v28 = [[VCPTransforms alloc] initImageTransform:128 transformedImageWidth:v8[16] transformedImageHeight:v8[17]];
      v29 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v28;

      unint64_t v30 = (int)v8[20];
      if (v30 >= a4)
      {
        if (a4)
        {
          uint64_t v37 = 0;
          do
          {
            v38 = (void *)*((void *)v8 + 24);
            v39 = [NSNumber numberWithInt:v37];
            [v38 addObject:v39];

            ++v37;
          }
          while (a4 != v37);
        }
      }
      else
      {
        int v31 = v8[18];
        if (v31 >= 1)
        {
          int v32 = 0;
          int v33 = 0;
          int v34 = ((int)a4 - (int)v30) / v31;
          do
          {
            v35 = (void *)*((void *)v8 + 24);
            v36 = [NSNumber numberWithInt:v32 + v8[20]];
            [v35 addObject:v36];

            ++v33;
            v32 += v34;
          }
          while (v33 < (int)v8[18]);
        }
      }
      long long v40 = *(_OWORD *)v19;
      time1.epoch = *((void *)v19 + 2);
      *(_OWORD *)&time1.value = v40;
      v41 = (long long *)MEMORY[0x1E4F1FA48];
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        long long v42 = *v41;
        *((void *)v19 + 2) = *((void *)v41 + 2);
        *(_OWORD *)v19 = v42;
      }
      v8[40] = 0;
      long long v9 = v8;
    }
  }
  v26 = v9;

  return v26;
}

- (int)configVideoCaptionModels
{
  v33[2] = *MEMORY[0x1E4F143B8];
  int64_t modelType = self->_modelType;
  if (modelType == 1)
  {
    v8 = +[VCPMobileAssetManager sharedManager];
    long long v9 = [v8 retrieveAssetOnce:3 petWatchDog:0 cancelBlock:0];

    if (!v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        long long v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "[VideoCaption] retrieve VCPMobileAsset_VideoCaptionDecoder_AX OTA model fail", v29, 2u);
        }
      }
      LODWORD(p_backbone) = -18;
      return (int)p_backbone;
    }
    uint64_t v10 = *MEMORY[0x1E4F56738];
    v32[0] = *MEMORY[0x1E4F56740];
    v32[1] = v10;
    v33[0] = v9;
    v33[1] = @"CPU";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    int64_t v12 = [(id)objc_opt_class() sharedCVNLPCaptionDecoderWithOptions:v11 identifier:@"CVNLPVideoCaptionDecoder_AX"];
    epoch = (void *)self->_timeEnd.epoch;
    self->_timeEnd.epoch = v12;

    if (self->_timeEnd.epoch)
    {
      v14 = +[VCPMobileAssetManager sharedManager];
      id v15 = [v14 retrieveAssetOnce:2 petWatchDog:0 cancelBlock:0];

      if (v15)
      {
        CMTime v16 = [[VCPVideoCaptionEncoder alloc] initWithModelPath:v15];
        p_backbone = &self->_backbone;
        v18 = *p_backbone;
        *p_backbone = v16;

        if (*p_backbone)
        {
          int v19 = 0;
LABEL_47:

LABEL_48:
          if (!v19) {
            goto LABEL_49;
          }
          return (int)p_backbone;
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          LODWORD(p_backbone) = -108;
          goto LABEL_46;
        }
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[VideoCaption] init VCPVideoCaptionEncoder fail", v29, 2u);
        }
        LODWORD(p_backbone) = -108;
        goto LABEL_44;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[VideoCaption] retrieve VCPMobileAsset_VideoCaptionEncoder_AX OTA model fail", v29, 2u);
        }
        LODWORD(p_backbone) = -18;
LABEL_44:

        goto LABEL_46;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        LODWORD(p_backbone) = -18;
        int v19 = 1;
        goto LABEL_48;
      }
      id v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[VideoCaption] init CVNLPVideoCaptioningModel fail", v29, 2u);
      }
    }
    LODWORD(p_backbone) = -18;
LABEL_46:
    int v19 = 1;
    goto LABEL_47;
  }
  if (modelType != 2)
  {
LABEL_49:
    LODWORD(p_backbone) = 0;
    return (int)p_backbone;
  }
  v4 = [[VCPVideoTransformerBackbone alloc] initWithConfig:*(void *)&self->_enoughFrames];
  videoTransformerBackbone = self->_videoTransformerBackbone;
  self->_videoTransformerBackbone = v4;

  if (self->_videoTransformerBackbone)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v31 = 0;
      v6 = (id *)&v31;
      uint64_t v7 = [MEMORY[0x1E4F5D0E8] CSUVideoCaptionerConfigurationForRevision:5 error:&v31];
    }
    else
    {
      uint64_t v30 = 0;
      v6 = (id *)&v30;
      uint64_t v7 = [MEMORY[0x1E4F5D0E8] CSUVideoCaptionerConfigurationForRevision:4 error:&v30];
    }
    long long v21 = (void *)v7;
    id v22 = *v6;
    if ([(id)objc_opt_class() greedySearchEnabled])
    {
      v23 = [v21 beamSearch];
      [v23 setBeamWidth:&unk_1F15EB7F0];
    }
    else
    {
      v23 = [v21 beamSearch];
      [v23 setBeamWidth:&unk_1F15EB808];
    }

    if (v21 && !v22)
    {
      v24 = [(id)objc_opt_class() sharedCaptionerWithConfig:v21 identifier:@"CSUVideoCaptioner_MiCa"];
      captioner = self->_captioner;
      self->_captioner = v24;
    }
    if (self->_captioner)
    {

      goto LABEL_49;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[VideoCaption] init CSUVideoCaptioner fail", v29, 2u);
      }
    }
  }
  LODWORD(p_backbone) = -108;
  return (int)p_backbone;
}

- (int)configInputBasedOnDevice
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)&self->_enoughFrames;
  *(void *)&self->_enoughFrames = &stru_1F15A0D70;

  if (DeviceGeqD5x() && self->_modelType == 2)
  {
    self->_inputNumFrames = 16;
    self->_inputWidth = 352;
    self->_inputHeight = 352;
    int v4 = 80;
    v5 = &OBJC_IVAR___VCPVideoCaptionAnalyzer__mubbSampleScale;
    int v6 = 1;
    int v7 = 1;
  }
  else
  {
    if (DeviceGeqD5x())
    {
      self->_inputNumFrames = 16;
      int v6 = 224;
      self->_inputWidth = 224;
      int v4 = 68;
      int v7 = 1;
    }
    else
    {
      self->_inputNumFrames = 10;
      int v6 = 196;
      self->_inputWidth = 196;
      int v4 = 68;
      int v7 = 15;
    }
    v5 = &OBJC_IVAR___VCPVideoCaptionAnalyzer__skipNumFramesBothEnds;
  }
  *(_DWORD *)((char *)&self->super.super.isa + v4) = v6;
  *(_DWORD *)((char *)&self->super.super.isa + *v5) = v7;
  int64_t modelType = self->_modelType;
  if (modelType == 1)
  {
    inputData = self->_inputData;
    if (inputData) {
      MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    }
    int v13 = self->_inputHeight * self->_inputNumFrames * self->_inputWidth;
    if (v13 < 0) {
      size_t v14 = -1;
    }
    else {
      size_t v14 = 12 * v13;
    }
    id v15 = (float *)operator new[](v14, MEMORY[0x1E4FBA2D0]);
    if (!v15)
    {
      self->_inputData = 0;
      return -108;
    }
    CMTime v16 = v15;
    bzero(v15, v14);
    self->_inputData = v16;
    return 0;
  }
  if (modelType == 2)
  {
    videoTransformerBackbone = self->_videoTransformerBackbone;
    if (videoTransformerBackbone)
    {
      if ([(VCPVideoTransformerBackbone *)videoTransformerBackbone inputTensorSize] == 3 * self->_inputNumFrames * self->_inputHeight * self->_inputWidth / self->_mubbSampleScale)
      {
        uint64_t v10 = [[VCPEspressoV2Data alloc] initWithTensorType:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorType] size:[(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inputTensorSize]];
        inputDataMUB = self->_inputDataMUB;
        self->_inputDataMUB = v10;
      }
    }
    if (!self->_inputDataMUB) {
      return -108;
    }
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int64_t v19 = self->_modelType;
      int v20 = 134217984;
      int64_t v21 = v19;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[VideoCaption] Unsupported MADVideoCaptionModelType: %lu", (uint8_t *)&v20, 0xCu);
    }
  }
  return -18;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoCaptionAnalyzer;
  [(VCPVideoCaptionAnalyzer *)&v4 dealloc];
}

+ (id)sharedCaptionerWithConfig:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5 && v6)
  {
    v8 = +[VCPSharedInstanceManager sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__VCPVideoCaptionAnalyzer_sharedCaptionerWithConfig_identifier___block_invoke;
    v11[3] = &unk_1E6298588;
    id v12 = v7;
    id v13 = v5;
    long long v9 = [v8 sharedInstanceWithIdentifier:v12 andCreationBlock:v11];

LABEL_8:
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[VideoCaption] Initiating captioner with nil config or identifier", buf, 2u);
    }
    long long v9 = 0;
    goto LABEL_8;
  }
  long long v9 = 0;
LABEL_10:

  return v9;
}

id __64__VCPVideoCaptionAnalyzer_sharedCaptionerWithConfig_identifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      size_t v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[VideoCaption] Initiating captioner:%@ with config:%@", buf, 0x16u);
    }
  }
  id v5 = objc_alloc(MEMORY[0x1E4F5D0E0]);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  int v7 = (void *)[v5 initWithConfiguration:v6 error:&v12];
  id v8 = v12;
  if ((v8 || !v7) && (int)MediaAnalysisLogLevel() >= 3)
  {
    long long v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v8 description];
      *(_DWORD *)buf = 138412290;
      size_t v14 = v10;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[VideoCaption] CSUVideoCaptioner init fail: %@", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)sharedCVNLPCaptionDecoderWithOptions:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5 && v6)
  {
    id v8 = +[VCPSharedInstanceManager sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__VCPVideoCaptionAnalyzer_sharedCVNLPCaptionDecoderWithOptions_identifier___block_invoke;
    v11[3] = &unk_1E62985B0;
    id v12 = v5;
    long long v9 = [v8 sharedInstanceWithIdentifier:v7 andCreationBlock:v11];

LABEL_8:
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[VideoCaption] Initiating CVNLPVideoCaptioningModel with nil options or identifier", buf, 2u);
    }
    long long v9 = 0;
    goto LABEL_8;
  }
  long long v9 = 0;
LABEL_10:

  return v9;
}

id __75__VCPVideoCaptionAnalyzer_sharedCVNLPCaptionDecoderWithOptions_identifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[VideoCaption] Initiating CVNLPVideoCaptioningModel", buf, 2u);
    }
  }
  id v3 = objc_alloc(MEMORY[0x1E4F567A8]);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  id v5 = (void *)[v3 initWithOptions:v4 error:&v10];
  id v6 = v10;
  if ((v6 || !v5) && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 description];
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[VideoCaption] CVNLPVideoCaptioningModel init fail: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4
{
  if (a4 != 3) {
    return -50;
  }
  int frameIndex = self->_frameIndex;
  int inputNumFrames = self->_inputNumFrames;
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
  CVReturn v38 = v11;
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
    if (v10 >= 1)
    {
      int v25 = 0;
      inputData = self->_inputData;
      inputint Width = self->_inputWidth;
      inputint Height = self->_inputHeight;
      int v29 = 3 * frameIndex % inputNumFrames * inputHeight * inputWidth;
      int v30 = inputWidth * inputHeight;
      uint64_t v31 = &inputData[2 * v30 + v29];
      int v32 = &inputData[v29 + v30];
      int v33 = &inputData[v29];
      uint64_t v34 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v24) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&unsigned int v36 = (float)((float)((float)LODWORD(v24) / 255.0) + -0.5)
                           + (float)((float)((float)LODWORD(v24) / 255.0) + -0.5);
            v33[i] = *(float *)&v36;
            LOBYTE(v36) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&unsigned int v37 = (float)((float)((float)v36 / 255.0) + -0.5) + (float)((float)((float)v36 / 255.0) + -0.5);
            v32[i] = *(float *)&v37;
            LOBYTE(v37) = BaseAddress[(int)(i * 4)];
            float v24 = (float)((float)((float)v37 / 255.0) + -0.5) + (float)((float)((float)v37 / 255.0) + -0.5);
            v31[i] = v24;
          }
        }
        BaseAddress += BytesPerRow;
        ++v25;
        uint64_t v31 = (float *)((char *)v31 + v34);
        int v32 = (float *)((char *)v32 + v34);
        int v33 = (float *)((char *)v33 + v34);
      }
      while (v25 != v10);
    }
    int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v38);
    if (pixelBuffer
      && !v38
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
  if (a4 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v7 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v37 = v7;
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      int v21 = self->_frameIndex % self->_inputNumFrames;
      int mubbSampleScale = self->_mubbSampleScale;
      if (v21 % mubbSampleScale)
      {
        int v8 = 0;
      }
      else
      {
        if (Height >= 1)
        {
          unsigned int v33 = 0;
          int v23 = 3 * Height * Width * (v21 / mubbSampleScale);
          uint64_t v36 = v23;
          uint64_t v34 = v23 + 2 * Height * Width;
          uint64_t v35 = v23 + Height * Width;
          uint64_t v30 = BytesPerRow;
          do
          {
            if (Width >= 1)
            {
              uint64_t v24 = 0;
              int v25 = 1;
              do
              {
                LOBYTE(v20) = BaseAddress[v25 + 1];
                unsigned int v26 = BaseAddress[v25];
                LOBYTE(v4) = BaseAddress[v25 - 1];
                uint64_t v27 = 11 * (v33 >> 5) + (v24 >> 5) + 121 * (v24 & 0x1F | (32 * (v33 & 0x1F)));
                *(float *)&double v20 = (float)((float)((float)LODWORD(v20) / 255.0) + -0.48145) / 0.26863;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataMUB, "setValueFP:atIndex:", v27 + v36, v20, v30);
                *(float *)&double v28 = (float)((float)((float)v26 / 255.0) + -0.45783) / 0.2613;
                [(VCPEspressoV2Data *)self->_inputDataMUB setValueFP:v27 + v35 atIndex:v28];
                *(float *)&double v29 = (float)((float)((float)v4 / 255.0) + -0.40821) / 0.27578;
                [(VCPEspressoV2Data *)self->_inputDataMUB setValueFP:v27 + v34 atIndex:v29];
                ++v24;
                v25 += 4;
              }
              while (Width != v24);
            }
            BaseAddress += v30;
            ++v33;
          }
          while (v33 != Height);
        }
        int v8 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v37);
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    int v8 = -50;
    int v37 = -50;
  }
  if (pixelBuffer
    && !v37
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
  }
  return v8;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  videoSegmentCaptionResult = self->_videoSegmentCaptionResult;
  uint64_t v16 = NSNumber;
  ++HIDWORD(self->_timeStart.epoch);
  uint64_t v17 = objc_msgSend(v16, "numberWithInt:");
  LOBYTE(videoSegmentCaptionResult) = [(NSMutableArray *)videoSegmentCaptionResult containsObject:v17];

  if ((videoSegmentCaptionResult & 1) != 0 && !LOBYTE(self->_validFrames))
  {
    if ((self->_timeLastDetection.timescale & 1) == 0)
    {
      long long v20 = *(_OWORD *)&a4->var0;
      *(void *)&self->_timeLastDetection.flags = a4->var3;
      *(_OWORD *)((char *)&self->_timeLastProcess.epoch + 4) = v20;
    }
    if (self->_modelType != 2 && DeviceGeqD5x())
    {
      double v13 = 0.875;
      double v11 = 0.0625;
      double v12 = 0.0625;
      double v14 = 0.875;
    }
    float v21 = (float)Width;
    float v22 = (float)Height;
    if ((float)((float)Height * 1.2) >= (float)Width)
    {
      if ((float)(v21 * 1.2) < v22)
      {
        double v12 = (float)((float)(Height - Width) / (float)(v22 + v22));
        double v14 = (float)(v21 / v22);
        double v13 = 1.0;
        double v11 = 0.0;
      }
    }
    else
    {
      double v11 = (float)((float)(Width - Height) / (float)(v21 + v21));
      double v13 = (float)(v22 / v21);
      double v14 = 1.0;
      double v12 = 0.0;
    }
    int v23 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v11, v12, v13, v14);
    if (!v23) {
      return -18;
    }
    uint64_t v24 = v23;
    int64_t modelType = self->_modelType;
    if (modelType == 2)
    {
      int v26 = [(VCPVideoCaptionAnalyzer *)self copyMUBBImage:v23 withChannels:3];
    }
    else
    {
      if (modelType != 1) {
        goto LABEL_21;
      }
      int v26 = [(VCPVideoCaptionAnalyzer *)self copyImage:v23 withChannels:3];
    }
    int v18 = v26;
    if (v26)
    {
LABEL_24:
      CFRelease(v24);
      return v18;
    }
LABEL_21:
    int v27 = self->_frameIndex + 1;
    self->_int frameIndex = v27;
    if (v27 >= self->_inputNumFrames)
    {
      LOBYTE(self->_validFrames) = 1;
      int64_t var3 = a4->var3;
      *(_OWORD *)&self->_activeFrameIndices = *(_OWORD *)&a4->var0;
      *(void *)&self->_timeEnd.timescale = var3;
    }
    int v18 = 0;
    int64_t v29 = a4->var3;
    *(_OWORD *)(&self->_skipNumFramesBothEnds + 1) = *(_OWORD *)&a4->var0;
    *(void *)&self->_timeLastProcess.flags = v29;
    goto LABEL_24;
  }
  return 0;
}

- (int)inference:(id *)a3 duration:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  int64_t modelType = self->_modelType;
  if (modelType == 1)
  {
    uint64_t v19 = VCPSignPostLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    float v21 = VCPSignPostLog();
    float v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPVideoCaptionAnalyzer_backBoneInference", "", buf, 2u);
    }

    int v10 = [(VCPVideoCaptionEncoder *)self->_backbone inference:self->_inputData];
    if (!v10)
    {
      int v25 = VCPSignPostLog();
      int v26 = v25;
      if (v20 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v20, "VCPVideoCaptionAnalyzer_backBoneInference", "", buf, 2u);
      }

      int v27 = [(VCPVideoCaptionEncoder *)self->_backbone embeddingHeight];
      int v28 = [(VCPVideoCaptionEncoder *)self->_backbone embeddingWidth];
      int v29 = [(VCPVideoCaptionEncoder *)self->_backbone embeddingChannels];
      int v30 = [(VCPVideoCaptionEncoder *)self->_backbone embeddingSequenceLength];
      double v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", -[VCPVideoCaptionEncoder videoEmbedding](self->_backbone, "videoEmbedding"), 4 * v28 * v27 * v29 * v30);
      uint64_t v31 = VCPSignPostLog();
      os_signpost_id_t v32 = os_signpost_id_generate(v31);

      unsigned int v33 = VCPSignPostLog();
      uint64_t v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VCPVideoCaptionAnalyzer_languageDecoderInference", "", buf, 2u);
      }

      epoch = (void *)self->_timeEnd.epoch;
      id v76 = 0;
      int v23 = [epoch generateCaption:v13 error:&v76];
      id v24 = v76;
      uint64_t v36 = VCPSignPostLog();
      int v37 = v36;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_END, v32, "VCPVideoCaptionAnalyzer_languageDecoderInference", "", buf, 2u);
      }

      if (v24)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          CVReturn v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v89 = v24;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_ERROR, "[VideoCaption] Error to generate video caption with CVNLPVideoCaptioningModel (%@)", buf, 0xCu);
          }
          goto LABEL_91;
        }
      }
      else
      {
        if (v23)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v39 = VCPLogInstance();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v89 = v23;
              _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "[VideoCaption] Computed AX video caption: (%@)", buf, 0xCu);
            }
          }
          resConfig = self->_resConfig;
          v81 = v23;
          v82 = @"attributes";
          v80 = @"videoCaptionText";
          CVReturn v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v83 = v38;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          [(NSString *)resConfig addObject:v41];

          goto LABEL_71;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          CVReturn v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_ERROR, "[VideoCaption] No AX caption text generated", buf, 2u);
          }
          int v23 = 0;
          id v24 = 0;
          goto LABEL_91;
        }
        int v23 = 0;
        id v24 = 0;
      }
LABEL_87:
      int v10 = -18;
      goto LABEL_93;
    }
  }
  else
  {
    if (modelType != 2)
    {
      int v23 = 0;
      id v24 = 0;
      double v13 = 0;
      int v10 = 0;
      goto LABEL_93;
    }
    id v6 = VCPSignPostLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    int v8 = VCPSignPostLog();
    long long v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPVideoCaptionAnalyzer_backBoneInference_MiCa", "", buf, 2u);
    }

    int v10 = [(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone inference:self->_inputDataMUB];
    if (!v10)
    {
      double v11 = VCPSignPostLog();
      double v12 = v11;
      if (v7 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_END, v7, "VCPVideoCaptionAnalyzer_backBoneInference_MiCa", "", buf, 2u);
      }

      double v13 = [(VCPVideoTransformerBackbone *)self->_videoTransformerBackbone spatialEmbedding];
      if (v13)
      {
        if (![(id)objc_opt_class() writeSpatialEmbeddingToFile])
        {
LABEL_55:
          v50 = VCPSignPostLog();
          os_signpost_id_t v51 = os_signpost_id_generate(v50);

          v52 = VCPSignPostLog();
          v53 = v52;
          if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "VCPVideoCaptionAnalyzer_languageDecoderInference_MiCa", "", buf, 2u);
          }

          captioner = self->_captioner;
          id v77 = 0;
          CVReturn v38 = [(CSUVideoCaptioner *)captioner computeCaptionForVideoEmbedding:v13 error:&v77];
          id v24 = v77;
          v55 = VCPSignPostLog();
          v56 = v55;
          if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_END, v51, "VCPVideoCaptionAnalyzer_languageDecoderInference_MiCa", "", buf, 2u);
          }

          if (v24 || !v38)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v89 = v24;
                v72 = "[VideoCaption] Error to compute caption with CSUVideoCaptioner: (%@)";
                v73 = v71;
                uint32_t v74 = 12;
LABEL_78:
                _os_log_impl(&dword_1BBEDA000, v73, OS_LOG_TYPE_ERROR, v72, buf, v74);
              }
LABEL_79:
              int v23 = 0;
              goto LABEL_80;
            }
          }
          else
          {
            v57 = [v38 results];
            BOOL v58 = [v57 count] == 0;

            if (!v58)
            {
              v59 = [v38 results];
              v60 = [v59 objectAtIndexedSubscript:0];
              int v23 = [v60 caption];

              v61 = [v38 results];
              v62 = [v61 objectAtIndexedSubscript:0];
              [v62 score];
              float v64 = v63;

              if (v23)
              {
                if (v64 != 0.0)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v66 = VCPLogInstance();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v89 = v23;
                      __int16 v90 = 2048;
                      double v91 = v64;
                      _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_DEBUG, "[VideoCaption] Computed CSU video caption: (%@), with score: %f", buf, 0x16u);
                    }
                  }
                  v67 = self->_resConfig;
                  v86 = @"attributes";
                  v84[0] = @"videoCaptionText";
                  v84[1] = @"videoCaptionConfidence";
                  v85[0] = v23;
                  *(float *)&double v65 = v64;
                  v68 = [NSNumber numberWithFloat:v65];
                  v85[1] = v68;
                  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
                  v87 = v69;
                  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                  [(NSString *)v67 addObject:v70];

LABEL_71:
                  id v24 = 0;
                  int v10 = 0;
LABEL_92:

                  goto LABEL_93;
                }
                if ((int)MediaAnalysisLogLevel() < 3)
                {
LABEL_91:
                  int v10 = -18;
                  goto LABEL_92;
                }
                v71 = VCPLogInstance();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "[VideoCaption] No caption confident score generated", buf, 2u);
                }
LABEL_80:

                goto LABEL_91;
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v72 = "[VideoCaption] No caption text generated";
                v73 = v71;
                uint32_t v74 = 2;
                goto LABEL_78;
              }
              goto LABEL_79;
            }
          }
          int v23 = 0;
          goto LABEL_91;
        }
        double v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/com.apple.mediaanalysisd/" isDirectory:1];
        uint64_t v16 = [v15 path];
        char v17 = [v14 fileExistsAtPath:v16];

        if (v17)
        {
          id v18 = 0;
        }
        else
        {
          long long v42 = [v15 path];
          id v79 = 0;
          char v43 = [v14 createDirectoryAtPath:v42 withIntermediateDirectories:1 attributes:0 error:&v79];
          id v18 = v79;

          if ((v43 & 1) == 0)
          {
            v44 = [v18 localizedDescription];
            NSLog(&cfstr_VideocaptionFa.isa, v15, v44);
          }
        }
        v45 = [v15 URLByAppendingPathComponent:@"videoSpatialEmbedding.dat" isDirectory:0];

        id v78 = v18;
        int v46 = [v13 writeToURL:v45 options:1 error:&v78];
        id v47 = v78;

        if (v46)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v89 = v45;
              _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_INFO, "[VideoCaption] Video spatial embedding successfully saved to %@", buf, 0xCu);
            }
LABEL_53:
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            double v49 = [v47 localizedDescription];
            *(_DWORD *)buf = 138412546;
            id v89 = v45;
            __int16 v90 = 2112;
            double v91 = v49;
            _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "[VideoCaption] Failed to save video spatial embedding to %@ with error: %@", buf, 0x16u);
          }
          goto LABEL_53;
        }

        goto LABEL_55;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v38 = VCPLogInstance();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_ERROR, "[VideoCaption] Video embedding for caption generation is nil", buf, 2u);
        }
        int v23 = 0;
        id v24 = 0;
        double v13 = 0;
        goto LABEL_91;
      }
      int v23 = 0;
      id v24 = 0;
      double v13 = 0;
      goto LABEL_87;
    }
  }
  int v23 = 0;
  id v24 = 0;
  double v13 = 0;
LABEL_93:

  return v10;
}

- (int)generateCaptionWithEmbedding:(id)a3 startTime:(id *)a4 duration:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    if (!self->_videoCaptionResult)
    {
      long long v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      videoCaptionResult = self->_videoCaptionResult;
      self->_videoCaptionResult = v9;
    }
    captioner = self->_captioner;
    if (captioner)
    {
LABEL_5:
      id v34 = 0;
      double v12 = [(CSUVideoCaptioner *)captioner computeCaptionForVideoEmbedding:v8 error:&v34];
      double v13 = v34;
      double v14 = v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        id v18 = [v12 results];
        BOOL v19 = [v18 count] == 0;

        if (v19)
        {
          int v17 = 0;
          goto LABEL_25;
        }
        os_signpost_id_t v20 = [v12 results];
        float v21 = [v20 objectAtIndexedSubscript:0];
        uint64_t v16 = [v21 caption];

        float v22 = [v12 results];
        int v23 = [v22 objectAtIndexedSubscript:0];
        [v23 score];
        int v25 = v24;

        int v26 = self->_videoCaptionResult;
        v37[0] = @"start";
        $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
        CFDictionaryRef v27 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v38[0] = v27;
        v37[1] = @"duration";
        $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
        CFDictionaryRef v28 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v38[1] = v28;
        v37[2] = @"attributes";
        v35[0] = @"videoCaptionText";
        v35[1] = @"videoCaptionConfidence";
        v36[0] = v16;
        LODWORD(v29) = v25;
        int v30 = [NSNumber numberWithFloat:v29];
        v36[1] = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
        v38[2] = v31;
        os_signpost_id_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
        [(NSMutableArray *)v26 addObject:v32];

        int v17 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v17 = -18;
          goto LABEL_25;
        }
        uint64_t v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.var0) = 138412290;
          *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[VideoCaption] Error to compute caption with CSUVideoCaptioner: (%@)", (uint8_t *)&buf, 0xCu);
        }
        int v17 = -18;
      }

LABEL_25:
LABEL_26:

      goto LABEL_27;
    }
    self->_int64_t modelType = 2;
    int v17 = [(VCPVideoCaptionAnalyzer *)self configVideoCaptionModels];
    if (!v17)
    {
      captioner = self->_captioner;
      goto LABEL_5;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.var0) = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[VideoCaption] Video embedding for caption generation is nil", (uint8_t *)&buf, 2u);
      }
      int v17 = -18;
      goto LABEL_26;
    }
    int v17 = -18;
  }
LABEL_27:

  return v17;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!LOBYTE(self->_validFrames) && (int)MediaAnalysisLogLevel() >= 4)
  {
    unsigned int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int frameIndex = self->_frameIndex;
      LODWORD(buf.value) = 67109120;
      HIDWORD(buf.value) = frameIndex;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[VideoCaption] Valid number of input frame: %d, zero padding remnant frames", (uint8_t *)&buf, 8u);
    }
  }
  long long v8 = *(_OWORD *)((char *)&self->_timeLastDetection.epoch + 4);
  uint64_t v9 = *(void *)&self->_timeStart.flags;
  CMTime buf = *(CMTime *)&self->_activeFrameIndices;
  CMTime rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
  CMTimeSubtract(&v7, &buf, &rhs);
  return [(VCPVideoCaptionAnalyzer *)self inference:&v8 duration:&v7];
}

- (id)results
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  resConfig = self->_resConfig;
  if (resConfig)
  {
    int64_t modelType = self->_modelType;
    if (modelType == 1)
    {
      long long v8 = @"VideoCaptionResults";
      uint64_t v9 = resConfig;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [v3 addEntriesFromDictionary:v6];
    }
    else
    {
      if (modelType != 2) {
        goto LABEL_7;
      }
      int v10 = @"MiCaVideoCaptionResults";
      v11[0] = resConfig;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v3 addEntriesFromDictionary:v6];
    }
  }
LABEL_7:
  return v3;
}

- (id)segmentCaptionResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  videoCaptionResult = self->_videoCaptionResult;
  if (videoCaptionResult)
  {
    videoCaptionResult = (void *)[videoCaptionResult count];
    if (videoCaptionResult)
    {
      unsigned int v4 = self->_videoCaptionResult;
      id v6 = @"VideoSegmentCaptionResults";
      v7[0] = v4;
      videoCaptionResult = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    }
  }
  return videoCaptionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCaptionEncoder, 0);
  objc_storeStrong((id *)&self->_videoCaptionDecoder, 0);
  objc_storeStrong((id *)&self->_timeEnd.epoch, 0);
  objc_storeStrong((id *)&self->_videoSegmentCaptionResult, 0);
  objc_storeStrong((id *)&self->_videoCaptionResult, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_enoughFrames, 0);
  objc_storeStrong((id *)&self->_inputDataMUB, 0);
  objc_storeStrong((id *)&self->_captioner, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
  objc_storeStrong((id *)&self->_videoTransformerBackbone, 0);
  objc_storeStrong((id *)&self->_backbone, 0);
}

@end