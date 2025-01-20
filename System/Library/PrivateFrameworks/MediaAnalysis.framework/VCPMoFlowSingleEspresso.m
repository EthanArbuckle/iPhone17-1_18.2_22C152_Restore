@interface VCPMoFlowSingleEspresso
+ (id)sharedModel:(id)a3 inputNames:(id)a4;
- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4;
- (id).cxx_construct;
- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5;
- (int)configForAspectRatio:(id)a3;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6;
- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6;
- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5;
- (int)getFlowToBuffer:(__CVBuffer *)a3;
- (int)prepareModel;
- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7;
- (int)reInitModel;
- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4;
- (void)dealloc;
@end

@implementation VCPMoFlowSingleEspresso

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7
{
  BOOL v10 = a3;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  v12 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v13 = [v12 resourceURL];

  v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_moflow.espresso.net" relativeToURL:v13];
  netFileUrl = self->_netFileUrl;
  self->_netFileUrl = v14;

  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)@"landscape_1024x448";

  self->super._cnnInputWidth = 1024;
  self->super._cnnInputHeight = 448;
  if (v10)
  {
    v17 = self->_resConfig;
    self->_resConfig = (NSString *)@"square_320x320";

    self->super._cnnInputWidth = 320;
    self->super._cnnInputHeight = 320;
  }
  else if (v31)
  {
    int v18 = [(VCPMoFlowSingleEspresso *)self configForAspectRatio:v31];
    if (v18) {
      goto LABEL_11;
    }
  }
  inputNames = self->_inputNames;
  self->_inputNames = (NSArray *)&unk_1F15EDFF8;

  std::vector<void *>::resize((uint64_t)&self->_inputsData, [(NSArray *)self->_inputNames count]);
  self->_flow = 0;
  self->_forceCPU = a5;
  self->_sharedModel = a6;
  self->_flushModel = a7;
  if (DeviceHasANE() && !self->_forceCPU && self->_sharedModel)
  {
    v29 = [(id)objc_opt_class() sharedModel:self->_netFileUrl inputNames:self->_inputNames];
    modelEspresso = self->_modelEspresso;
    self->_modelEspresso = v29;
  }
  else
  {
    v20 = [VCPCNNModelEspresso alloc];
    v21 = self->_netFileUrl;
    v22 = self->_inputNames;
    v32[0] = @"forceCPU";
    v23 = [NSNumber numberWithBool:self->_forceCPU];
    v32[1] = @"sharedContext";
    v33[0] = v23;
    v24 = [NSNumber numberWithBool:self->_sharedModel];
    v33[1] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v26 = [(VCPCNNModelEspresso *)v20 initWithParameters:v21 inputNames:v22 outputNames:0 properties:v25];
    v27 = self->_modelEspresso;
    self->_modelEspresso = v26;
  }
  if (self->_modelEspresso) {
    int v18 = [(VCPMoFlowSingleEspresso *)self prepareModel];
  }
  else {
    int v18 = -108;
  }
LABEL_11:

  return v18;
}

- (int)prepareModel
{
  if ([(NSArray *)self->_inputNames count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = self->_inputsData.__begin_[v3];
      if (v4) {
        MEMORY[0x1C186C790](v4, 0x1000C8052888210);
      }
      ++v3;
    }
    while ([(NSArray *)self->_inputNames count] > v3);
  }
  flow = self->_flow;
  if (flow)
  {
    MEMORY[0x1C186C790](flow, 0x1000C8052888210);
    self->_flow = 0;
  }
  LODWORD(v6) = [(VCPCNNModelEspresso *)self->_modelEspresso prepareModelWithConfig:self->_resConfig];
  if (!v6)
  {
    NSUInteger v6 = [(NSArray *)self->_inputNames count];
    if (v6)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      v9 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
      while (1)
      {
        [(VCPCNNModelEspresso *)self->_modelEspresso inputBlobs];
        uint64_t v10 = *(void *)&v17[v7 + 88];
        [(VCPCNNModelEspresso *)self->_modelEspresso inputBlobs];
        uint64_t v11 = *(void *)&v16[v7 + 80];
        [(VCPCNNModelEspresso *)self->_modelEspresso inputBlobs];
        unint64_t v12 = v11 * v10 * *(void *)&__p[v7 + 96];
        if (v12 >> 62) {
          size_t v13 = -1;
        }
        else {
          size_t v13 = 4 * v12;
        }
        self->_inputsData.__begin_[v8] = (float *)operator new[](v13, v9);
        if (__p) {
          operator delete(__p);
        }
        if (v16) {
          operator delete(v16);
        }
        if (v17) {
          operator delete(v17);
        }
        if (!self->_inputsData.__begin_[v8]) {
          break;
        }
        ++v8;
        v7 += 168;
        if ([(NSArray *)self->_inputNames count] <= v8)
        {
          LODWORD(v6) = 0;
          return v6;
        }
      }
      LODWORD(v6) = -108;
    }
  }
  return v6;
}

- (int)reInitModel
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [VCPCNNModelEspresso alloc];
  netFileUrl = self->_netFileUrl;
  inputNames = self->_inputNames;
  v12[0] = @"forceCPU";
  NSUInteger v6 = [NSNumber numberWithBool:self->_forceCPU];
  v13[0] = v6;
  v12[1] = @"sharedContext";
  uint64_t v7 = [NSNumber numberWithBool:self->_sharedModel];
  v13[1] = v7;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v9 = [(VCPCNNModelEspresso *)v3 initWithParameters:netFileUrl inputNames:inputNames outputNames:0 properties:v8];
  modelEspresso = self->_modelEspresso;
  self->_modelEspresso = v9;

  if (self->_modelEspresso) {
    return [(VCPMoFlowSingleEspresso *)self prepareModel];
  }
  else {
    return -108;
  }
}

- (void)dealloc
{
  for (NSUInteger i = 0; ; ++i)
  {
    NSUInteger v4 = [(NSArray *)self->_inputNames count];
    begin = self->_inputsData.__begin_;
    if (v4 <= i) {
      break;
    }
    NSUInteger v6 = begin[i];
    if (v6) {
      MEMORY[0x1C186C790](v6, 0x1000C8052888210);
    }
  }
  self->_inputsData.__begin_ = 0;
  self->_inputsData.__end_ = 0;
  self->_inputsData.__end_cap_.__value_ = 0;
  if (begin) {
    operator delete(begin);
  }
  flow = self->_flow;
  if (flow) {
    MEMORY[0x1C186C790](flow, 0x1000C8052888210);
  }
  v8.receiver = self;
  v8.super_class = (Class)VCPMoFlowSingleEspresso;
  [(VCPMoFlowSingleEspresso *)&v8 dealloc];
}

- (int)configForAspectRatio:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    if (v6 > 1.16)
    {
      switch(self->super._computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_384x256";
          int v8 = 256;
          int v9 = 384;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_448x320";
          int v8 = 320;
          int v9 = 448;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_640x512";
          int v8 = 512;
          goto LABEL_18;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_896x640";
          int v8 = 640;
          int v9 = 896;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    [v5 floatValue];
    unsigned int computationAccuracy = self->super._computationAccuracy;
    if (v11 < 0.86206899)
    {
      switch(computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_256x384";
          int v8 = 384;
          int v9 = 256;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_320x448";
          int v8 = 448;
          int v9 = 320;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_512x640";
          int v8 = 640;
          int v9 = 512;
          goto LABEL_22;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_640x896";
          int v8 = 896;
LABEL_18:
          int v9 = 640;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    switch(computationAccuracy)
    {
      case 0u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_256x256";
        int v9 = 256;
        int v8 = 256;
        goto LABEL_22;
      case 1u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_320x320";
        int v9 = 320;
        int v8 = 320;
        goto LABEL_22;
      case 2u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_512x512";
        int v9 = 512;
        int v8 = 512;
        goto LABEL_22;
      case 3u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_640x640";
        int v9 = 640;
        int v8 = 640;
LABEL_22:

        int v10 = 0;
        self->super._cnnInputWidth = v9;
        self->super._cnnInputHeight = v8;
        break;
      default:
LABEL_11:
        int v10 = -50;
        break;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

+ (id)sharedModel:(id)a3 inputNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[VCPSharedInstanceManager sharedManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __50__VCPMoFlowSingleEspresso_sharedModel_inputNames___block_invoke;
  v12[3] = &unk_1E6298008;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  int v10 = [v7 sharedInstanceWithIdentifier:@"VCPMoflowEspresso" andCreationBlock:v12];

  return v10;
}

VCPCNNModelEspresso *__50__VCPMoFlowSingleEspresso_sharedModel_inputNames___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:*(void *)(a1 + 40) outputNames:0 properties:0];
  return v1;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return -50;
  }
  int v9 = Height;
  CVReturn v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v31 = v10;
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v9);
    if (v9 >= 1)
    {
      int v24 = 0;
      v25 = &a4[2 * v9 * Width];
      v26 = &a4[v9 * Width];
      uint64_t v27 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v23) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&unsigned int v29 = (float)LODWORD(v23) / 255.0;
            a4[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&unsigned int v30 = (float)v29 / 255.0;
            v26[i] = *(float *)&v30;
            LOBYTE(v30) = BaseAddress[(int)(i * 4)];
            float v23 = (float)v30 / 255.0;
            v25[i] = v23;
          }
        }
        BaseAddress += BytesPerRow;
        ++v24;
        v25 = (float *)((char *)v25 + v27);
        v26 = (float *)((char *)v26 + v27);
        a4 = (float *)((char *)a4 + v27);
      }
      while (v24 != v9);
    }
    int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v31);
    if (pixelBuffer
      && !v31
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
  }
  return v11;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a6;
    uint64_t v7 = *(void *)&a5;
    CFTypeRef cf = 0;
    int Width = CVPixelBufferGetWidth(a4);
    int Height = CVPixelBufferGetHeight(a4);
    if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 && Width == v6 && Height == v7)
    {
      uint64_t v16 = 0;
      CFTypeRef cf = CFRetain(a4);
      CF<opaqueCMSampleBuffer *>::~CF(&v16);
    }
    else
    {
      Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, v6, v7, 1111970369);
      int v13 = v14;
      if (v14)
      {
LABEL_9:
        CF<opaqueCMSampleBuffer *>::~CF(&cf);
        return v13;
      }
    }
    int v13 = [(VCPMoFlowSingleEspresso *)self copyImage:cf toData:a3 withChannels:3];
    goto LABEL_9;
  }
  return -108;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int v10 = CVPixelBufferGetWidth(a4);
  int v11 = CVPixelBufferGetHeight(a4);
  int v12 = -50;
  if (Width != v10 || Height != v11) {
    return v12;
  }
  int v13 = (void *)MEMORY[0x1C186D320]();
  uint64_t v39 = 162;
  if (self->_flushModel && !self->_modelEspresso)
  {
    int v19 = [(VCPMoFlowSingleEspresso *)self reInitModel];
    if (v19)
    {
      int v12 = v19;
LABEL_15:
      int v18 = 0;
      goto LABEL_16;
    }
  }
  [(VCPCNNModelEspresso *)self->_modelEspresso inputBlobs];
  int v14 = __p[106];
  operator delete(__p);
  [(VCPCNNModelEspresso *)self->_modelEspresso inputBlobs];
  int v15 = __p[104];
  operator delete(__p);
  p_inputsData = &self->_inputsData;
  int v17 = [(VCPMoFlowSingleEspresso *)self createInput:*self->_inputsData.__begin_ withBuffer:a3 cnnInputHeight:self->super._cnnInputHeight cnnInputWidth:self->super._cnnInputWidth];
  if (v17
    || (int v17 = [(VCPMoFlowSingleEspresso *)self createInput:*((void *)p_inputsData->__begin_ + 1) withBuffer:a4 cnnInputHeight:self->super._cnnInputHeight cnnInputWidth:self->super._cnnInputWidth]) != 0)
  {
    int v12 = v17;
    int v18 = 0;
    goto LABEL_16;
  }
  begin = (void **)p_inputsData->__begin_;
  if (2 * v14 * v15 >= 1) {
    bzero(begin[2], 4 * (2 * v14 * v15));
  }
  modelEspresso = self->_modelEspresso;
  v47 = 0;
  uint64_t v48 = 0;
  v46 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v46, begin, (uint64_t)self->_inputsData.__end_, ((char *)self->_inputsData.__end_ - (char *)begin) >> 3);
  int v12 = [(VCPCNNModelEspresso *)modelEspresso espressoForwardInputs:&v46];
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  if (v12) {
    goto LABEL_15;
  }
  v32 = self->_modelEspresso;
  if (v32)
  {
    [(VCPCNNModelEspresso *)v32 outputBlob];
    int v33 = v44;
  }
  else
  {
    int v33 = 0;
  }
  self->super._cnnOutputint Width = v33;
  v34 = self->_modelEspresso;
  if (v34)
  {
    [(VCPCNNModelEspresso *)v34 outputBlob];
    int v35 = v45;
  }
  else
  {
    int v35 = 0;
  }
  self->super._cnnOutputint Height = v35;
  if (self->_flow
    || ((int v36 = 2 * self->super._cnnOutputWidth * v35, v36 < 0) ? (v37 = -1) : (v37 = 4 * v36),
        v38 = (float *)operator new[](v37, MEMORY[0x1E4FBA2D0]),
        (self->_flow = v38) != 0))
  {
    int v12 = 0;
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
    int v12 = -108;
  }
LABEL_16:
  if (!v18) {
    return v12;
  }
  flow = self->_flow;
  float v23 = self->_modelEspresso;
  if (!v23)
  {
    v25 = 0;
LABEL_23:
    uint64_t v28 = 0;
    goto LABEL_24;
  }
  [(VCPCNNModelEspresso *)v23 outputBlob];
  int v24 = self->_modelEspresso;
  v25 = __p;
  if (!v24) {
    goto LABEL_23;
  }
  [(VCPCNNModelEspresso *)v24 outputBlob];
  v26 = self->_modelEspresso;
  if (!v26) {
    goto LABEL_23;
  }
  [(VCPCNNModelEspresso *)v26 outputBlob];
  uint64_t v27 = self->_modelEspresso;
  uint64_t v28 = v41 * 4 * v42;
  if (!v27)
  {
LABEL_24:
    uint64_t v29 = 0;
    goto LABEL_25;
  }
  [(VCPCNNModelEspresso *)v27 outputBlob];
  uint64_t v29 = v40;
LABEL_25:
  memcpy(flow, v25, v29 * v28);
  if (*((unsigned char *)&self->super.super.super.isa + v39))
  {
    unsigned int v30 = self->_modelEspresso;
    if (v30)
    {
      self->_modelEspresso = 0;
    }
  }
  return v12;
}

- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4
{
  *a3 = self->super._cnnOutputHeight;
  *a4 = self->super._cnnOutputWidth;
  vDSP_vsmul(self->_flow, 1, &kMotionFlowGlobalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  return self->_flow;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  vDSP_vsmul(self->_flow, 1, &kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputint Width = self->super._cnnOutputWidth;
  cnnOutputint Height = self->super._cnnOutputHeight;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 0;
  if (a3)
  {
    CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 0);
    CVReturn v35 = v9;
    if (v9)
    {
      int v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      int v21 = self->super._cnnOutputHeight;
      if (v21 >= 1)
      {
        int v22 = 0;
        uint64_t v23 = self->super._cnnOutputWidth;
        int v24 = &flow[cnnOutputHeight * cnnOutputWidth];
        uint64_t v25 = 4 * (int)v23;
        do
        {
          if ((int)v23 >= 1)
          {
            uint64_t v26 = 0;
            uint64_t v27 = 0;
            int v28 = 1;
            do
            {
              _S0 = flow[v26];
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[v27 >> 31] = LOWORD(_S0);
              _S0 = v24[v26];
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[2 * v28] = LOWORD(_S0);
              v28 += 2;
              v27 += 0x200000000;
              ++v26;
            }
            while (v23 != v26);
          }
          BaseAddress += 2 * ((uint64_t)BytesPerRow >> 1);
          ++v22;
          int v24 = (float *)((char *)v24 + v25);
          flow = (float *)((char *)flow + v25);
        }
        while (v22 != v21);
      }
      int v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v35);
      if (pixelBuffer
        && !v35
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return -50;
  }
  return v10;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  vDSP_vsmul(self->_flow, 1, &kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputint Width = self->super._cnnOutputWidth;
  cnnOutputint Height = self->super._cnnOutputHeight;
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 0;
  if (a3)
  {
    int v13 = BytesPerRow;
    CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 0);
    CVReturn v44 = v14;
    if (v14)
    {
      int v15 = v14;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      int v26 = self->super._cnnOutputHeight;
      if (v26 >= 1)
      {
        int v27 = 0;
        int v28 = &flow[cnnOutputHeight * cnnOutputWidth];
        uint64_t v29 = self->super._cnnOutputWidth;
        uint64_t v30 = 4 * (int)v29;
        do
        {
          if ((int)v29 >= 1)
          {
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            int v33 = 1;
            do
            {
              _S0 = flow[v31];
              __asm
              {
                FCVT            H0, S0
                FCVT            S0, H0
              }
              _S0 = _S0 * a4;
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[v32 >> 31] = LOWORD(_S0);
              _S0 = v28[v31];
              __asm
              {
                FCVT            H0, S0
                FCVT            S0, H0
              }
              _S0 = _S0 * a5;
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[2 * v33] = LOWORD(_S0);
              v33 += 2;
              v32 += 0x200000000;
              ++v31;
            }
            while (v29 != v31);
          }
          BaseAddress += 2 * ((uint64_t)v13 >> 1);
          ++v27;
          int v28 = (float *)((char *)v28 + v30);
          flow = (float *)((char *)flow + v30);
        }
        while (v27 != v26);
      }
      int v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v44);
      if (pixelBuffer
        && !v44
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return -50;
  }
  return v15;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  vDSP_vsmul(self->_flow, 1, &kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputint Width = self->super._cnnOutputWidth;
  cnnOutputint Height = self->super._cnnOutputHeight;
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  int v15 = CVPixelBufferGetBytesPerRow(a4);
  CVReturn v55 = 0;
  CVPixelBufferRef v56 = a3;
  CVPixelBufferLockFlags v57 = 0;
  if (a3)
  {
    int v16 = v15;
    int v54 = cnnOutputWidth;
    CVReturn v17 = CVPixelBufferLockBaseAddress(a3, 0);
    CVReturn v55 = v17;
    if (!v17
      || (CVReturn v18 = v17, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          pixelBuffer[0] = a3,
          LOWORD(pixelBuffer[1]) = 1024,
          *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v18,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v18 = v55) == 0))
    {
      *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a4;
      if (a4)
      {
        CVReturn v18 = CVPixelBufferLockBaseAddress(a4, 0);
        *(_DWORD *)buf = v18;
        if (!v18
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v60 = 134218240,
              uint64_t v61 = *(void *)((char *)pixelBuffer + 4),
              __int16 v62 = 1024,
              CVReturn v63 = v18,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v60, 0x12u), (CVReturn v18 = *(_DWORD *)buf) == 0))
        {
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
          uint64_t v20 = (char *)CVPixelBufferGetBaseAddress(a4);
          int v21 = self->super._cnnOutputHeight;
          if (v21 >= 1)
          {
            int v22 = 0;
            uint64_t v23 = &flow[cnnOutputHeight * v54];
            uint64_t v24 = self->super._cnnOutputWidth;
            uint64_t v25 = 4 * (int)v24;
            do
            {
              if ((int)v24 >= 1)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  _S0 = flow[i];
                  __asm
                  {
                    FCVT            H0, S0
                    FCVT            S0, H0
                  }
                  _S0 = _S0 * a5;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&BaseAddress[2 * i] = LOWORD(_S0);
                  _S0 = v23[i];
                  __asm
                  {
                    FCVT            H0, S0
                    FCVT            S0, H0
                  }
                  _S0 = _S0 * a6;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v20[2 * i] = LOWORD(_S0);
                }
              }
              ++v22;
              v20 += 2 * ((uint64_t)v16 >> 1);
              uint64_t v23 = (float *)((char *)v23 + v25);
              BaseAddress += 2 * ((uint64_t)BytesPerRow >> 1);
              flow = (float *)((char *)flow + v25);
            }
            while (v22 != v21);
          }
          CVReturn v18 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
          if (!v18) {
            CVReturn v18 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v55);
          }
        }
      }
      else
      {
        BOOL v46 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v46) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v46, v47, v48, v49, v50, v51, v52, v53);
        }
        CVReturn v18 = -50;
        *(_DWORD *)buf = -50;
      }
      if (*(void *)((char *)pixelBuffer + 4)
        && !*(_DWORD *)buf
        && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(void *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
      if (v56
        && !v55
        && CVPixelBufferUnlockBaseAddress(v56, v57)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v37) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v37, v38, v39, v40, v41, v42, v43, v44);
    }
    return -50;
  }
  return v18;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  uint64_t v7 = self->_resConfig;
  self->super._unsigned int computationAccuracy = a4;
  int v8 = [(VCPMoFlowSingleEspresso *)self configForAspectRatio:a3];
  if (!v8)
  {
    if (v7 == self->_resConfig) {
      goto LABEL_5;
    }
    if (!self->_modelEspresso)
    {
      int v8 = -108;
      goto LABEL_7;
    }
    int v8 = [(VCPMoFlowSingleEspresso *)self prepareModel];
    if (!v8) {
LABEL_5:
    }
      int v8 = 0;
  }
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_resConfig, 0);
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    self->_inputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 22) = 0;
  *((_DWORD *)self + 46) = 0;
  return self;
}

@end