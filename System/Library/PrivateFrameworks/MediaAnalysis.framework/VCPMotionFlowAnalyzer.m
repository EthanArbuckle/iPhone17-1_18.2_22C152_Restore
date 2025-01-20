@interface VCPMotionFlowAnalyzer
- (VCPMotionFlowAnalyzer)init;
- (id).cxx_construct;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 cancel:(id)a7;
- (int)convertFlow:(__CVBuffer *)a3;
- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withPixelFormat:(int)a5;
- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6;
- (int)generateMotionFlow;
- (int)preProcessing:(__CVBuffer *)a3;
- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4;
- (void)dealloc;
@end

@implementation VCPMotionFlowAnalyzer

- (VCPMotionFlowAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPMotionFlowAnalyzer;
  v2 = [(VCPMotionFlowAnalyzer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_frameArray.__end_ = v2->_frameArray.__begin_;
    v2->_flow = 0;
    v2->_transferSession = 0;
    v2->_scale = 0;
    moflowRequest = v2->_moflowRequest;
    v2->_moflowRequest = 0;

    v3->_frameWidth = 0;
    v3->_frameHeight = 0;
    v3->_downScaleWidth = 0;
    v3->_downScaleHeight = 0;
    v3->_flowWidth = 0;
    v3->_flowHeight = 0;
    v3->_frameNum = 0;
    v3->_initialized = 0;
  }
  return v3;
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
      v7 = begin[v6];
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
  flow = self->_flow;
  if (flow) {
    MEMORY[0x1C186C790](flow, 0x1000C8052888210);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPMotionFlowAnalyzer;
  [(VCPMotionFlowAnalyzer *)&v10 dealloc];
}

- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  self->_frameint Width = Width;
  self->_frameint Height = Height;
  if (Width <= Height) {
    int v9 = Height;
  }
  else {
    int v9 = Width;
  }
  if (v9 != 580)
  {
    self->_scale = 1;
    if (Width <= Height) {
      unsigned int v10 = (vcvtps_s32_f32((float)((float)Width * 580.0) / (float)Height) + 1) & 0xFFFFFFFE;
    }
    else {
      unsigned int v10 = 580;
    }
    self->_downScaleint Width = v10;
    if (Width >= Height) {
      unsigned int v11 = (vcvtps_s32_f32((float)((float)Height * 580.0) / (float)Width) + 1) & 0xFFFFFFFE;
    }
    else {
      unsigned int v11 = 580;
    }
    self->_downScaleint Height = v11;
    int Height = self->_frameHeight;
  }
  if (((self->_frameWidth * Height) & 0x40000000) != 0) {
    size_t v12 = -1;
  }
  else {
    size_t v12 = 8 * self->_frameWidth * Height;
  }
  v13 = (float *)operator new[](v12, MEMORY[0x1E4FBA2D0]);
  self->_flow = v13;
  if (v13)
  {
    v21[0] = @"frameWidth";
    v14 = [NSNumber numberWithInt:self->_downScaleWidth];
    v22[0] = v14;
    v21[1] = @"frameHeight";
    v15 = [NSNumber numberWithInt:self->_downScaleHeight];
    v21[2] = @"motionFlowComputationAccuracy";
    v22[1] = v15;
    v22[2] = &unk_1F15EDD10;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

    v17 = [[VCPMotionFlowRequest alloc] initWithOptions:v16 cancel:v6];
    moflowRequest = self->_moflowRequest;
    self->_moflowRequest = v17;

    self->_initialized = 1;
    int v19 = 0;
  }
  else
  {
    int v19 = -108;
  }

  return v19;
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
              _H0 = *(_WORD *)v26;
              __asm { FCVT            S0, H0 }
              *(_DWORD *)flow++ = _S0;
              LOWORD(_S0) = *((_WORD *)v26 + 1);
              __asm { FCVT            S0, H0 }
              *(_DWORD *)v24++ = _S0;
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
    int result = [(VCPMotionFlowAnalyzer *)self createPixelBufferWithWidth:Width height:CVPixelBufferGetHeight(a3) pixelFormat:v5 pixelBuffer:a4];
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
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&p_frameArray->__end_cap_, v29);
          }
          else {
            v30 = 0;
          }
          uint64_t v17 = (__CVBuffer **)&v30[8 * v26];
          uint64_t v19 = (__CVBuffer **)&v30[8 * v29];
          VCPMotionFlowRequest *v17 = v33;
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
          VCPMotionFlowRequest *v17 = v33;
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
    int result = [(VCPMotionFlowAnalyzer *)self convertPixelBuffer:a3 toPixelBuffer:&v33 withPixelFormat:875704438];
    if (!result) {
      goto LABEL_8;
    }
  }
  return result;
}

- (int)generateMotionFlow
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  begin = self->_frameArray.__begin_;
  unint64_t v4 = (unint64_t)((char *)self->_frameArray.__end_ - (char *)begin) >> 3;
  if ((int)v4 <= 1) {
    LODWORD(v4) = 1;
  }
  uint64_t v5 = begin[(v4 - 1)];
  id v6 = *begin;
  moflowRequest = self->_moflowRequest;
  id v16 = 0;
  v8 = [(VCPMotionFlowRequest *)moflowRequest estimateMotionBetweenFirstImage:v5 andSecondImage:v6 withUpsample:1 withGuidedImage:0 error:&v16];
  id v9 = v16;
  self->_flowunsigned int Width = self->_frameWidth;
  self->_flowint Height = self->_frameHeight;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      CVReturn v11 = "[MotionFlowAnalyzer] Failed to request flow from VCPMotionFlowRequest: %@";
      uint64_t v12 = v10;
      uint32_t v13 = 12;
LABEL_7:
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_8;
    }
  }
  else
  {
    if ([v8 pixelBuffer])
    {
      -[VCPMotionFlowAnalyzer convertFlow:](self, "convertFlow:", [v8 pixelBuffer]);
      int v14 = 0;
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      CVReturn v11 = "Motion flow is null";
      uint64_t v12 = v10;
      uint32_t v13 = 2;
      goto LABEL_7;
    }
  }
LABEL_9:
  int v14 = -18;
LABEL_12:

  return v14;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 cancel:(id)a7
{
  id v10 = a7;
  if (self->_initialized
    || (int v11 = [(VCPMotionFlowAnalyzer *)self prepareAnalyzerWithCVPixelBuffer:a3 cancel:v10]) == 0)
  {
    int v11 = [(VCPMotionFlowAnalyzer *)self preProcessing:a3];
    if (!v11)
    {
      int v11 = [(VCPMotionFlowAnalyzer *)self generateMotionFlow];
      if (!v11)
      {
        *((void *)a4 + 42) = self->_flow;
        ++self->_frameNum;
      }
    }
  }

  return v11;
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
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end