@interface VCPCNNGazeAnalysis
+ (id)sharedModel:(id)a3;
- (VCPCNNGazeAnalysis)init;
- (id).cxx_construct;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 faceBounds:(CGRect)a7;
- (int)detectEyeOpennessForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 eyeOpenness:(BOOL *)a5;
- (void)dealloc;
@end

@implementation VCPCNNGazeAnalysis

- (VCPCNNGazeAnalysis)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v4 = [v3 resourceURL];

  v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_blink.espresso.net" relativeToURL:v4];
  v24.receiver = self;
  v24.super_class = (Class)VCPCNNGazeAnalysis;
  v6 = [(VCPCNNGazeAnalysis *)&v24 init];
  if (!v6) {
    goto LABEL_7;
  }
  if (DeviceHasANE())
  {
    v7 = [(id)objc_opt_class() sharedModel:v5];
  }
  else
  {
    v7 = [[VCPCNNModelEspresso alloc] initWithParameters:v5 inputNames:0 outputNames:0 properties:0];
  }
  modelEspresso = v6->_modelEspresso;
  v6->_modelEspresso = v7;

  v9 = v6->_modelEspresso;
  if (!v9 || [(VCPCNNModelEspresso *)v9 prepareModelWithConfig:&stru_1F15A0D70]) {
    goto LABEL_7;
  }
  v13 = v6->_modelEspresso;
  if (v13 && ([(VCPCNNModelEspresso *)v13 inputBlob], (v14 = v6->_modelEspresso) != 0))
  {
    [(VCPCNNModelEspresso *)v14 inputBlob];
    v15 = v6->_modelEspresso;
    uint64_t v16 = v22 * v23;
    if (v15)
    {
      [(VCPCNNModelEspresso *)v15 inputBlob];
      uint64_t v17 = v21;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = 0;
LABEL_15:
  unint64_t v18 = v16 * v17;
  if (v18 >> 62) {
    size_t v19 = -1;
  }
  else {
    size_t v19 = 4 * v18;
  }
  v20 = (float *)operator new[](v19, MEMORY[0x1E4FBA2D0]);
  v6->_inputData = v20;
  v10 = v6;
  if (!v20) {
LABEL_7:
  }
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__VCPCNNGazeAnalysis_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 sharedInstanceWithIdentifier:@"VCPGazeEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__34__VCPCNNGazeAnalysis_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNGazeAnalysis;
  [(VCPCNNGazeAnalysis *)&v4 dealloc];
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return -50;
  }
  int v8 = Height;
  CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v30 = v9;
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
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      int v23 = 0;
      objc_super v24 = &a4[2 * v8 * Width];
      v25 = &a4[v8 * Width];
      uint64_t v26 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v22) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&unsigned int v28 = (float)((float)((float)LODWORD(v22) / 255.0) + -0.485) / 0.229;
            a4[i] = *(float *)&v28;
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&unsigned int v29 = (float)((float)((float)v28 / 255.0) + -0.456) / 0.224;
            v25[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4)];
            float v22 = (float)((float)((float)v29 / 255.0) + -0.406) / 0.225;
            v24[i] = v22;
          }
        }
        BaseAddress += BytesPerRow;
        ++v23;
        objc_super v24 = (float *)((char *)v24 + v26);
        v25 = (float *)((char *)v25 + v26);
        a4 = (float *)((char *)a4 + v26);
      }
      while (v23 != v8);
    }
    int v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v30);
    if (pixelBuffer
      && !v30
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
    }
  }
  return v10;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 faceBounds:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  CFTypeRef cf = 0;
  int v16 = CVPixelBufferGetWidth(a4);
  int v17 = CVPixelBufferGetHeight(a4);
  if (!a3) {
    return -108;
  }
  double v18 = (double)(v16 - 1);
  if (x <= v18) {
    double v19 = x;
  }
  else {
    double v19 = (double)(v16 - 1);
  }
  int v20 = v17 - 1;
  float v21 = fmax(v19, 0.0);
  if (y <= (double)(v17 - 1)) {
    double v22 = y;
  }
  else {
    double v22 = (double)v20;
  }
  float v23 = fmax(v22, 0.0);
  if (x + width <= v18) {
    double v18 = x + width;
  }
  float v24 = fmax(v18, 0.0);
  double v25 = y + height;
  if (y + height > (double)(v17 - 1)) {
    double v25 = (double)v20;
  }
  float v26 = fmax(v25, 0.0);
  v32.origin.double x = (float)(v21 / (float)v16);
  v32.origin.double y = (float)(v23 / (float)v17);
  v32.size.double width = (float)((float)(v24 - v21) / (float)v16);
  v32.size.double height = (float)((float)(v26 - v23) / (float)v17);
  int v27 = Scaler::ScaleCropped(&self->_scaler, v32, a4, (__CVBuffer **)&cf, v11, v12, 1111970369);
  CFTypeRef v28 = cf;
  if (v27)
  {
    int v29 = v27;
    if (!cf) {
      return v29;
    }
    goto LABEL_17;
  }
  int v29 = [(VCPCNNGazeAnalysis *)self copyImage:cf toData:a3];
  CFTypeRef v28 = cf;
  if (cf) {
LABEL_17:
  }
    CFRelease(v28);
  return v29;
}

- (int)detectEyeOpennessForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 eyeOpenness:(BOOL *)a5
{
  if (a3.size.width < 40.0 || a3.size.height < 40.0)
  {
    BOOL v7 = 1;
LABEL_7:
    int result = 0;
    *a5 = v7;
    return result;
  }
  int result = -[VCPCNNGazeAnalysis createInput:withBuffer:cnnInputHeight:cnnInputWidth:faceBounds:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:faceBounds:", self->_inputData, a4, 64, 64, a3.origin.x, a3.origin.y);
  if (!result)
  {
    int result = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
    if (!result)
    {
      int result = [(VCPCNNModelEspresso *)self->_modelEspresso softmax];
      if (!result)
      {
        [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
        BOOL v7 = *(float *)(v10 + 4) <= 0.6;
        goto LABEL_7;
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end