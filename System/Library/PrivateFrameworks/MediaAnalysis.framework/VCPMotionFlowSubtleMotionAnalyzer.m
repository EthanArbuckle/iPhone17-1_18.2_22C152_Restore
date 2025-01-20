@interface VCPMotionFlowSubtleMotionAnalyzer
+ (BOOL)enableR2D2;
- (VCPMotionFlowSubtleMotionAnalyzer)init;
- (float)subtleMotionScore;
- (id).cxx_construct;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 hasSubtleScene:(int)a7 cancel:(id)a8;
- (int)convertFlow:(__CVBuffer *)a3;
- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withPixelFormat:(int)a5;
- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6;
- (int)generateMotionFlow;
- (int)generateSubleMotionScore:(void *)a3;
- (int)preProcessing:(__CVBuffer *)a3;
- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4;
- (void)dealloc;
@end

@implementation VCPMotionFlowSubtleMotionAnalyzer

- (VCPMotionFlowSubtleMotionAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCPMotionFlowSubtleMotionAnalyzer;
  v2 = [(VCPMotionFlowSubtleMotionAnalyzer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_frameArray.__end_ = v2->_frameArray.__begin_;
    v2->_flow = 0;
    v2->_block = 0;
    v2->_transferSession = 0;
    v2->_scale = 0;
    motionFlowAnalyzer = v2->_motionFlowAnalyzer;
    v2->_motionFlowAnalyzer = 0;

    moflowRequest = v3->_moflowRequest;
    v3->_moflowRequest = 0;

    v3->_subtleMotionScore = 0.0;
    v3->_frameWidth = 0;
    v3->_frameHeight = 0;
    v3->_downScaleWidth = 0;
    v3->_downScaleHeight = 0;
    v3->_blockSize = 0;
    v3->_flowWidth = 0;
    v3->_flowHeight = 0;
    v3->_frameNum = 0;
    v3->_sceneType = 0;
    v3->_initialized = 0;
    v3->_useR2D2 = [(id)objc_opt_class() enableR2D2];
  }
  return v3;
}

+ (BOOL)enableR2D2
{
  if ((DeviceHasANE() & 1) == 0) {
    return +[VCPMotionFlowSubtleMotionAnalyzer enableR2D2]::enable;
  }
  BOOL result = 1;
  +[VCPMotionFlowSubtleMotionAnalyzer enableR2D2]::enable = 1;
  return result;
}

- (void)dealloc
{
  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  end = self->_frameArray.__end_;
  if (end != begin)
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = begin[v6];
      if (v7)
      {
        CFRelease(v7);
        begin[v6] = 0;
        begin = p_frameArray->__begin_;
        end = p_frameArray->__end_;
      }
      ++v6;
    }
    while (v6 < end - begin);
  }
  transferSession = self->_transferSession;
  if (transferSession) {
    CFRelease(transferSession);
  }
  block = self->_block;
  if (block) {
    MEMORY[0x1C186C790](block, 0x1000C8052888210);
  }
  if (self->_useR2D2)
  {
    flow = self->_flow;
    if (flow) {
      MEMORY[0x1C186C790](flow, 0x1000C8052888210);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VCPMotionFlowSubtleMotionAnalyzer;
  [(VCPMotionFlowSubtleMotionAnalyzer *)&v11 dealloc];
}

- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  self->_frameint Width = Width;
  self->_frameint Height = Height;
  if (Width <= Height) {
    int v10 = Height;
  }
  else {
    int v10 = Width;
  }
  if (v10 != 580)
  {
    self->_scale = 1;
    unsigned int v11 = (vcvtps_s32_f32((float)((float)Width * 580.0) / (float)Height) + 1) & 0xFFFFFFFE;
    if (Width <= Height) {
      int v12 = v11;
    }
    else {
      int v12 = 580;
    }
    self->_downScaleint Width = v12;
    unsigned int v13 = (vcvtps_s32_f32((float)((float)Height * 580.0) / (float)Width) + 1) & 0xFFFFFFFE;
    if (Width >= Height) {
      int v14 = v13;
    }
    else {
      int v14 = 580;
    }
    self->_downScaleint Height = v14;
  }
  if (self->_useR2D2)
  {
    frameint Width = self->_frameWidth;
    if (((frameWidth * self->_frameHeight) & 0x40000000) != 0) {
      size_t v16 = -1;
    }
    else {
      size_t v16 = 8 * (int)frameWidth * self->_frameHeight;
    }
    v17 = (float *)operator new[](v16, MEMORY[0x1E4FBA2D0]);
    self->_flow = v17;
    if (!v17) {
      goto LABEL_24;
    }
    v32[0] = @"frameWidth";
    v18 = [NSNumber numberWithInt:frameWidth];
    v33[0] = v18;
    v32[1] = @"frameHeight";
    v19 = [NSNumber numberWithInt:self->_frameHeight];
    v32[2] = @"motionFlowComputationAccuracy";
    v33[1] = v19;
    v33[2] = &unk_1F15ED5C0;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];

    v21 = [[VCPMotionFlowRequest alloc] initWithOptions:v20 cancel:v6];
    moflowRequest = self->_moflowRequest;
    self->_moflowRequest = v21;

    self->_int blockSize = 40;
    int blockSize = self->_blockSize;
  }
  else
  {
    *(float *)&double v9 = (float)self->_frameWidth / (float)self->_frameHeight;
    v24 = [NSNumber numberWithFloat:v9];
    v25 = +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:0 aspectRatio:v24 computationAccuracy:1 forceCPU:0 sharedModel:1 flushModel:1 cancel:v6];
    motionFlowAnalyzer = self->_motionFlowAnalyzer;
    self->_motionFlowAnalyzer = v25;

    int blockSize = 8;
    self->_int blockSize = 8;
  }
  int v27 = 2 * blockSize * blockSize;
  if (v27 < 0) {
    size_t v28 = -1;
  }
  else {
    size_t v28 = 4 * v27;
  }
  v29 = (float *)operator new[](v28, MEMORY[0x1E4FBA2D0]);
  self->_block = v29;
  if (!v29)
  {
LABEL_24:
    int v30 = -108;
    goto LABEL_25;
  }
  int v30 = 0;
  self->_initialized = 1;
LABEL_25:

  return v30;
}

- (int)convertFlow:(__CVBuffer *)a3
{
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  flow = self->_flow;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    int v9 = BytesPerRow;
    CVReturn v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVReturn v34 = v10;
    if (v10)
    {
      int v11 = v10;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      if (Height >= 1)
      {
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        v24 = &flow[Width * Height];
        do
        {
          if (Width >= 1)
          {
            uint64_t v25 = 0;
            do
            {
              v26 = &BaseAddress[2 * v25 + (v22 & 0xFFFFFFFFFFFFFFFELL)];
              _H1 = *(_WORD *)v26;
              __asm { FCVT            S1, H1 }
              *flow++ = _S1 / 1.3;
              LOWORD(_S1) = *((_WORD *)v26 + 1);
              __asm { FCVT            S1, H1 }
              *v24++ = _S1 / 1.3;
              v25 += 2;
            }
            while (v25 < 2 * Width);
          }
          ++v23;
          v22 += v9;
        }
        while (v23 != Height);
      }
      int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v34);
      if (pixelBuffer
        && !v34
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
      }
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return -50;
  }
  return v11;
}

- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F24D20];
  v14[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CVReturn v11 = CVPixelBufferCreate(0, a3, a4, a5, v10, a6);
  if (v11 && *a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return v11;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withPixelFormat:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  p_transferSession = &self->_transferSession;
  if (self->_transferSession || (int result = VTPixelTransferSessionCreate(0, p_transferSession)) == 0)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    int result = [(VCPMotionFlowSubtleMotionAnalyzer *)self createPixelBufferWithWidth:Width height:CVPixelBufferGetHeight(a3) pixelFormat:v5 pixelBuffer:a4];
    if (!result)
    {
      BOOL v12 = *p_transferSession;
      uint64_t v13 = *a4;
      return VTPixelTransferSessionTransferImage(v12, a3, v13);
    }
  }
  return result;
}

- (int)preProcessing:(__CVBuffer *)a3
{
  v33 = 0;
  unsigned int Width = CVPixelBufferGetWidth(a3);
  if (*(void *)&self->_frameWidth != __PAIR64__(CVPixelBufferGetHeight(a3), Width)) {
    return -50;
  }
  if (self->_scale)
  {
    Scaler::Scale(&self->_scaler, a3, &v33, self->_downScaleWidth, self->_downScaleHeight, 875704438);
    if (!result)
    {
LABEL_8:
      p_frameArray = &self->_frameArray;
      begin = (CFTypeRef *)p_frameArray->__begin_;
      end = (char *)p_frameArray->__end_;
      uint64_t v10 = end - (char *)p_frameArray->__begin_;
      if ((unint64_t)v10 > 0xF)
      {
        if (*begin)
        {
          CFRelease(*begin);
          CFTypeRef *begin = 0;
          begin = (CFTypeRef *)p_frameArray->__begin_;
          end = (char *)p_frameArray->__end_;
        }
        int64_t v24 = end - (char *)(begin + 1);
        if (end != (char *)(begin + 1)) {
          memmove(begin, begin + 1, end - (char *)(begin + 1));
        }
        end -= 8;
        value = p_frameArray->__end_cap_.__value_;
        p_frameArray->__end_ = (__CVBuffer **)((char *)begin + v24);
        if ((char *)begin + v24 >= (char *)value)
        {
          uint64_t v26 = (end - (char *)p_frameArray->__begin_) >> 3;
          if ((unint64_t)(v26 + 1) >> 61) {
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v27 = (char *)value - (char *)p_frameArray->__begin_;
          uint64_t v28 = v27 >> 2;
          if (v27 >> 2 <= (unint64_t)(v26 + 1)) {
            uint64_t v28 = v26 + 1;
          }
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29) {
            int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&p_frameArray->__end_cap_, v29);
          }
          else {
            int v30 = 0;
          }
          uint64_t v17 = (__CVBuffer **)&v30[8 * v26];
          uint64_t v19 = (__CVBuffer **)&v30[8 * v29];
          float *v17 = v33;
          v20 = v17 + 1;
          v31 = p_frameArray->__begin_;
          v21 = p_frameArray->__end_;
          if (v21 == p_frameArray->__begin_) {
            goto LABEL_37;
          }
          do
          {
            v32 = *--v21;
            *--uint64_t v17 = v32;
          }
          while (v21 != v31);
          goto LABEL_36;
        }
      }
      else
      {
        CVReturn v11 = p_frameArray->__end_cap_.__value_;
        if (end >= (char *)v11)
        {
          uint64_t v12 = v10 >> 3;
          uint64_t v13 = (char *)v11 - (char *)begin;
          if (v13 >> 2 <= (unint64_t)((v10 >> 3) + 1)) {
            uint64_t v14 = v12 + 1;
          }
          else {
            uint64_t v14 = v13 >> 2;
          }
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&p_frameArray->__end_cap_, v15);
          uint64_t v17 = (__CVBuffer **)&v16[8 * v12];
          uint64_t v19 = (__CVBuffer **)&v16[8 * v18];
          float *v17 = v33;
          v20 = v17 + 1;
          uint64_t v22 = p_frameArray->__begin_;
          v21 = p_frameArray->__end_;
          if (v21 == p_frameArray->__begin_) {
            goto LABEL_37;
          }
          do
          {
            uint64_t v23 = *--v21;
            *--uint64_t v17 = v23;
          }
          while (v21 != v22);
LABEL_36:
          v21 = p_frameArray->__begin_;
LABEL_37:
          p_frameArray->__begin_ = v17;
          p_frameArray->__end_ = v20;
          p_frameArray->__end_cap_.__value_ = v19;
          if (v21) {
            operator delete(v21);
          }
          goto LABEL_39;
        }
      }
      *(void *)end = v33;
      v20 = (__CVBuffer **)(end + 8);
LABEL_39:
      int result = 0;
      p_frameArray->__end_ = v20;
    }
  }
  else
  {
    int result = [(VCPMotionFlowSubtleMotionAnalyzer *)self convertPixelBuffer:a3 toPixelBuffer:&v33 withPixelFormat:875704438];
    if (!result) {
      goto LABEL_8;
    }
  }
  return result;
}

- (int)generateMotionFlow
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  begin = self->_frameArray.__begin_;
  unint64_t v4 = (unint64_t)((char *)self->_frameArray.__end_ - (char *)begin) >> 3;
  if ((int)v4 <= 1) {
    LODWORD(v4) = 1;
  }
  uint64_t v5 = begin[(v4 - 1)];
  id v6 = *begin;
  if (self->_useR2D2)
  {
    moflowRequest = self->_moflowRequest;
    id v20 = 0;
    v8 = [(VCPMotionFlowRequest *)moflowRequest estimateMotionBetweenFirstImage:v6 andSecondImage:v5 withUpsample:1 withGuidedImage:0 error:&v20];
    int v9 = v20;
    self->_flowunsigned int Width = self->_frameWidth;
    self->_flowint Height = self->_frameHeight;
    if (v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v10 = VCPLogInstance();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
LABEL_9:

          goto LABEL_10;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v9;
        CVReturn v11 = "[MotionFlowSubtleMotionAnalyzer] Failed to request flow from VCPMotionFlowRequest: %@";
        uint64_t v12 = v10;
        uint32_t v13 = 12;
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
        goto LABEL_9;
      }
    }
    else
    {
      if ([v8 pixelBuffer])
      {
        [(VCPMotionFlowSubtleMotionAnalyzer *)self convertFlow:[v8 pixelBuffer]];
        int v14 = 0;
        goto LABEL_23;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v10 = VCPLogInstance();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        *(_WORD *)buf = 0;
        CVReturn v11 = "Motion flow is null";
        uint64_t v12 = v10;
        uint32_t v13 = 2;
        goto LABEL_8;
      }
    }
LABEL_10:

    int v14 = -18;
    v8 = v9;
LABEL_23:

    return v14;
  }
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  if (!motionFlowAnalyzer)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v8 = VCPLogInstance();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        int v14 = -18;
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "Fail to initialize motionFlowAnalyzer";
LABEL_21:
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, v17, buf, 2u);
      goto LABEL_22;
    }
    return -18;
  }
  int v16 = [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer analyzeImages:v5 secondImage:v6 cancel:&__block_literal_global_62];
  if (!v16)
  {
    uint64_t v19 = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer getFlowWithHeight:&self->_flowHeight andWidth:&self->_flowWidth];
    self->_flow = v19;
    if (v19) {
      return 0;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v8 = VCPLogInstance();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "Motion flow is null";
      goto LABEL_21;
    }
    return -18;
  }
  int v14 = v16;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Fail in generating motion flow", buf, 2u);
    }
    goto LABEL_23;
  }
  return v14;
}

uint64_t __55__VCPMotionFlowSubtleMotionAnalyzer_generateMotionFlow__block_invoke()
{
  return 0;
}

- (int)generateSubleMotionScore:(void *)a3
{
  v3 = a3;
  __p = 0;
  v60 = 0;
  v61 = 0;
  flowint Height = self->_flowHeight;
  if (flowHeight < 1)
  {
    id v6 = 0;
    v33 = 0;
  }
  else
  {
    id v6 = 0;
    int v7 = 0;
    flow = self->_flow;
    flowunsigned int Width = self->_flowWidth;
    uint64_t v10 = &flow[flowHeight * flowWidth];
    int blockSize = self->_blockSize;
    do
    {
      if (blockSize >= flowHeight - v7) {
        int v12 = flowHeight - v7;
      }
      else {
        int v12 = blockSize;
      }
      if (flowWidth >= 1)
      {
        int v13 = 0;
        v51 = v10;
        v52 = flow;
        v56 = v10;
        int v53 = v12;
        int v54 = v7;
        do
        {
          block = self->_block;
          uint64_t __Mean = 0;
          uint64_t __StandardDeviation = 0;
          int v15 = flowWidth - v13;
          if (blockSize < v15) {
            int v15 = blockSize;
          }
          int v55 = v15;
          if (v12 >= 1)
          {
            size_t v16 = 4 * v15;
            int v17 = v12;
            uint64_t v18 = v56;
            uint64_t v19 = flow;
            do
            {
              memcpy(block, v19, v16);
              memcpy(&block[self->_blockSize * self->_blockSize], v18, v16);
              uint64_t v20 = self->_flowWidth;
              v19 += v20;
              v18 += v20;
              block = (float *)((char *)block + v16);
              --v17;
            }
            while (v17);
            block = self->_block;
            int v12 = v53;
            int v7 = v54;
            int v15 = v55;
          }
          vDSP_Length v21 = v15 * v12;
          vDSP_normalize(block, 1, 0, 1, (float *)&__StandardDeviation, (float *)&__StandardDeviation + 1, v21);
          vDSP_normalize(&self->_block[self->_blockSize * self->_blockSize], 1, 0, 1, (float *)&__Mean, (float *)&__Mean + 1, v21);
          int v22 = self->_blockSize;
          float v23 = 0.0;
          if (v7 >= v22 && v13 >= v22 && v7 < self->_flowHeight - v22 && v13 < self->_flowWidth - v22) {
            float v23 = sqrtf((float)(*((float *)&__Mean + 1) * *((float *)&__Mean + 1))+ (float)(*((float *)&__StandardDeviation + 1) * *((float *)&__StandardDeviation + 1)));
          }
          int64_t v24 = v60;
          if (v60 >= v61)
          {
            uint64_t v25 = (float *)__p;
            uint64_t v26 = ((char *)v60 - (unsigned char *)__p) >> 2;
            unint64_t v27 = v26 + 1;
            if ((unint64_t)(v26 + 1) >> 62) {
              std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v28 = (char *)v61 - (unsigned char *)__p;
            if (((char *)v61 - (unsigned char *)__p) >> 1 > v27) {
              unint64_t v27 = v28 >> 1;
            }
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v29 = v27;
            }
            if (v29)
            {
              int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v61, v29);
              uint64_t v25 = (float *)__p;
              int64_t v24 = v60;
            }
            else
            {
              int v30 = 0;
            }
            v31 = (float *)&v30[4 * v26];
            float *v31 = v23;
            id v6 = v31 + 1;
            while (v24 != v25)
            {
              int v32 = *((_DWORD *)v24-- - 1);
              *((_DWORD *)v31-- - 1) = v32;
            }
            __p = v31;
            v60 = v6;
            v61 = (float *)&v30[4 * v29];
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            float *v60 = v23;
            id v6 = v24 + 1;
          }
          v60 = v6;
          flow += v55;
          v56 += v55;
          int blockSize = self->_blockSize;
          v13 += blockSize;
          flowunsigned int Width = self->_flowWidth;
        }
        while (v13 < flowWidth);
        flowint Height = self->_flowHeight;
        uint64_t v10 = v51;
        flow = v52;
      }
      flow += flowWidth * v12;
      v10 += flowWidth * v12;
      v7 += blockSize;
    }
    while (v7 < flowHeight);
    v33 = (float *)__p;
    v3 = a3;
  }
  unint64_t v34 = 126 - 2 * __clz(v6 - v33);
  if (v6 == v33) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = v34;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::greater<float> &,float *,false>(v33, v6, (uint64_t)&__StandardDeviation + 4, v35, 1);
  v36 = (float *)__p;
  if ((self->_sceneType & 0xFFFFFFFE) == 2)
  {
    uint64_t v37 = 0;
    float v38 = 0.0;
    do
    {
      float v39 = *(float *)((char *)__p + v37);
      if (v39 <= 0.1) {
        float v39 = -0.0;
      }
      float v38 = v38 + v39;
      v37 += 4;
    }
    while (v37 != 12);
    float v40 = 3.0;
  }
  else
  {
    uint64_t v41 = 0;
    float v38 = 0.0;
    float32x4_t v42 = (float32x4_t)vdupq_n_s32(0x3DCCCCCDu);
    v43.i64[0] = 0x8000000080000000;
    v43.i64[1] = 0x8000000080000000;
    do
    {
      int8x16_t v44 = vbslq_s8((int8x16_t)vcgtq_f32(*(float32x4_t *)((char *)__p + v41), v42), *(int8x16_t *)((char *)__p + v41), v43);
      float v38 = (float)((float)((float)(v38 + *(float *)v44.i32) + *(float *)&v44.i32[1]) + *(float *)&v44.i32[2])
          + *(float *)&v44.i32[3];
      v41 += 16;
    }
    while (v41 != 48);
    float v40 = 12.0;
  }
  float v45 = v38 / v40;
  if (v3[196])
  {
    float v46 = (float)((float)(v45 + -0.042) / 0.291) * 10.0;
    if (v45 >= 0.333) {
      float v46 = 10.0;
    }
    BOOL v47 = v45 > 0.042;
    float v48 = 0.0;
    if (v47) {
      float v48 = v46;
    }
    self->_subtleMotionScore = v48;
  }
  v60 = v36;
  operator delete(v36);
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 hasSubtleScene:(int)a7 cancel:(id)a8
{
  id v12 = a8;
  self->_sceneType = a7;
  if (!a7) {
    goto LABEL_10;
  }
  if (!*((unsigned char *)a4 + 196)) {
    goto LABEL_6;
  }
  if (*((float *)a4 + 44) > 5.0)
  {
    float subtleMotionScore = self->_subtleMotionScore;
    if (*((float *)a4 + 48) < subtleMotionScore) {
      *((float *)a4 + 48) = subtleMotionScore;
    }
LABEL_6:
    a7 = 0;
    int frameNum = self->_frameNum;
    if ((frameNum % 6) <= 1) {
      int v15 = -(frameNum % 6);
    }
    else {
      int v15 = 1;
    }
    self->_int frameNum = v15 + frameNum;
    goto LABEL_10;
  }
  if (!self->_initialized)
  {
    a7 = [(VCPMotionFlowSubtleMotionAnalyzer *)self prepareAnalyzerWithCVPixelBuffer:a3 cancel:v12];
    if (a7) {
      goto LABEL_10;
    }
  }
  int v17 = self->_frameNum % 6;
  if (!v17)
  {
    int v18 = [(VCPMotionFlowSubtleMotionAnalyzer *)self preProcessing:a3];
LABEL_20:
    a7 = v18;
    if (v18) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
  if (v17 == 1)
  {
    a7 = [(VCPMotionFlowSubtleMotionAnalyzer *)self preProcessing:a3];
    if (a7) {
      goto LABEL_10;
    }
    a7 = [(VCPMotionFlowSubtleMotionAnalyzer *)self generateMotionFlow];
    if (a7) {
      goto LABEL_10;
    }
    int v18 = [(VCPMotionFlowSubtleMotionAnalyzer *)self generateSubleMotionScore:a4];
    goto LABEL_20;
  }
LABEL_21:
  float v19 = self->_subtleMotionScore;
  if (*((float *)a4 + 48) < v19 && *((unsigned char *)a4 + 196)) {
    *((float *)a4 + 48) = v19;
  }
  a7 = 0;
  ++self->_frameNum;
LABEL_10:

  return a7;
}

- (float)subtleMotionScore
{
  return self->_subtleMotionScore;
}

- (void).cxx_destruct
{
  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  if (begin)
  {
    p_frameArray->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_moflowRequest, 0);
  objc_storeStrong((id *)&self->_motionFlowAnalyzer, 0);
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end