@interface VCPMotionFlowRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPMotionFlowRequest)init;
- (VCPMotionFlowRequest)initWithOptions:(id)a3;
- (VCPMotionFlowRequest)initWithOptions:(id)a3 cancel:(id)a4;
- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 error:(id *)a5;
- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 withUpsample:(BOOL)a5 withGuidedImage:(__CVBuffer *)a6 error:(id *)a7;
- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withPixelFormat:(int)a5;
- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6;
- (unsigned)preferredPixelFormat;
- (void)dealloc;
@end

@implementation VCPMotionFlowRequest

- (VCPMotionFlowRequest)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v5, 2u);
    }
  }
  return 0;
}

- (VCPMotionFlowRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPMotionFlowRequest;
  v5 = [(VCPRequest *)&v16 initWithOptions:v4];
  v7 = v5;
  if (v5)
  {
    v5->_transferSession = 0;
    int width = v5->super._width;
    if (width < 1 || (int height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&double v6 = (float)width / (float)height;
      v10 = [NSNumber numberWithFloat:v6];
    }
    uint64_t v11 = +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:0 aspectRatio:v10 computationAccuracy:v7->super._motionFlowComputationAccuracy forceCPU:v7->super._useCPUOnly sharedModel:0 flushModel:0 cancel:&__block_literal_global_27];
    motionFlowAnalyzer = v7->_motionFlowAnalyzer;
    v7->_motionFlowAnalyzer = (VCPImageMotionFlowAnalyzer *)v11;
  }
  if (v7->_motionFlowAnalyzer) {
    v13 = v7;
  }
  else {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

uint64_t __40__VCPMotionFlowRequest_initWithOptions___block_invoke()
{
  return 0;
}

- (VCPMotionFlowRequest)initWithOptions:(id)a3 cancel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VCPMotionFlowRequest;
  v8 = [(VCPRequest *)&v19 initWithOptions:v6];
  v10 = v8;
  if (v8)
  {
    v8->_transferSession = 0;
    int width = v8->super._width;
    if (width < 1 || (int height = v8->super._height, height < 1))
    {
      v13 = 0;
    }
    else
    {
      *(float *)&double v9 = (float)width / (float)height;
      v13 = [NSNumber numberWithFloat:v9];
    }
    uint64_t v14 = +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:0 aspectRatio:v13 computationAccuracy:v10->super._motionFlowComputationAccuracy forceCPU:v10->super._useCPUOnly sharedModel:0 flushModel:0 cancel:v7];
    motionFlowAnalyzer = v10->_motionFlowAnalyzer;
    v10->_motionFlowAnalyzer = (VCPImageMotionFlowAnalyzer *)v14;
  }
  if (v10->_motionFlowAnalyzer) {
    objc_super v16 = v10;
  }
  else {
    objc_super v16 = 0;
  }
  v17 = v16;

  return v17;
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
    int result = [(VCPMotionFlowRequest *)self createPixelBufferWithWidth:Width height:CVPixelBufferGetHeight(a3) pixelFormat:v5 pixelBuffer:a4];
    if (!result)
    {
      v12 = *p_transferSession;
      uint64_t v13 = *a4;
      return VTPixelTransferSessionTransferImage(v12, a3, v13);
    }
  }
  return result;
}

- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVReturn v11 = objc_alloc_init(VCPMotionFlowObservation);
  v12 = v11;
  if (v11)
  {
    [(VCPMotionFlowObservation *)v11 setRevision:1];
    if (self->super._width >= 1 && self->super._height > 0)
    {
      int Height = self->super._height;
      int Width = self->super._width;
    }
    int v13 = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer analyzeImages:a3 secondImage:a4 cancel:&__block_literal_global_30];
    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Fail in generating motion flow", v22, 2u);
        }
      }
    }
    else
    {
      if (self->super._useCPUOnly)
      {
        int Height = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer cnnOutputHeight];
        int Width = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer cnnOutputWidth];
      }
      [(VCPMotionFlowObservation *)v12 setPixelBuffer:VCPFlowCreatePixelBuffer(Width, Height, 0x32433068u, 32)];
      if ([(VCPMotionFlowObservation *)v12 pixelBuffer])
      {
        BOOL useCPUOnly = self->super._useCPUOnly;
        motionFlowAnalyzer = self->_motionFlowAnalyzer;
        if (useCPUOnly) {
          int v21 = [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer getFlowToBuffer:[(VCPMotionFlowObservation *)v12 pixelBuffer]];
        }
        else {
          int v21 = [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer scaleFlowTo:[(VCPMotionFlowObservation *)v12 pixelBuffer]];
        }
        int v13 = v21;
        if (!v21)
        {
          a5 = v12;
          goto LABEL_13;
        }
      }
      else
      {
        int v13 = -108;
      }
    }
  }
  else
  {
    int v13 = -50;
  }
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    objc_super v16 = [NSString stringWithFormat:@"Error: failed to analyze motion flow"];
    v24[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:v17];

    a5 = 0;
  }
LABEL_13:

  return a5;
}

uint64_t __77__VCPMotionFlowRequest_estimateMotionBetweenFirstImage_andSecondImage_error___block_invoke()
{
  return 0;
}

- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 withUpsample:(BOOL)a5 withGuidedImage:(__CVBuffer *)a6 error:(id *)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  CFTypeRef cf = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  v15 = objc_alloc_init(VCPMotionFlowObservation);
  objc_super v16 = v15;
  if (!v15)
  {
    int v17 = -50;
    goto LABEL_11;
  }
  [(VCPMotionFlowObservation *)v15 setRevision:1];
  if (self->super._width >= 1 && self->super._height > 0)
  {
    int Width = self->super._width;
    int Height = self->super._height;
  }
  int v17 = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer analyzeImages:a3 secondImage:a4 cancel:&__block_literal_global_37];
  if (v17)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "Fail in generating motion flow", buf, 2u);
      }
    }
    goto LABEL_11;
  }
  if (self->super._useCPUOnly || !a5)
  {
    int Height = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer cnnOutputHeight];
    int Width = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer cnnOutputWidth];
  }
  [(VCPMotionFlowObservation *)v16 setPixelBuffer:VCPFlowCreatePixelBuffer(Width, Height, 0x32433068u, 32)];
  if (![(VCPMotionFlowObservation *)v16 pixelBuffer])
  {
    int v17 = -108;
    goto LABEL_11;
  }
  if (self->super._useCPUOnly || !a5)
  {
    int v23 = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer getFlowToBuffer:[(VCPMotionFlowObservation *)v16 pixelBuffer]];
  }
  else
  {
    if (a6)
    {
      if (PixelFormatType == 1111970369) {
        CFTypeRef cf = a6;
      }
      else {
        [(VCPMotionFlowRequest *)self convertPixelBuffer:a6 toPixelBuffer:&cf withPixelFormat:1111970369];
      }
      motionFlowAnalyzer = self->_motionFlowAnalyzer;
      uint64_t v25 = [(VCPMotionFlowObservation *)v16 pixelBuffer];
      int v17 = [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer guidedUpsampling:v25 inBGRA:cf];
      if (!v17)
      {
        if (cf) {
          CFRelease(cf);
        }
        goto LABEL_34;
      }
      goto LABEL_11;
    }
    int v23 = [(VCPImageMotionFlowAnalyzer *)self->_motionFlowAnalyzer scaleFlowTo:[(VCPMotionFlowObservation *)v16 pixelBuffer]];
  }
  int v17 = v23;
  if (!v23)
  {
LABEL_34:
    a7 = v16;
    goto LABEL_13;
  }
LABEL_11:
  if (a7)
  {
    objc_super v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v20 = [NSString stringWithFormat:@"Error: failed to analyze motion flow"];
    v30[0] = v20;
    int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    *a7 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:v21];

    a7 = 0;
  }
LABEL_13:

  return a7;
}

uint64_t __106__VCPMotionFlowRequest_estimateMotionBetweenFirstImage_andSecondImage_withUpsample_withGuidedImage_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  int width = self->super._width;
  int height = self->super._height;
  unsigned int motionFlowComputationAccuracy = self->super._motionFlowComputationAccuracy;
  v15.receiver = self;
  v15.super_class = (Class)VCPMotionFlowRequest;
  [(VCPRequest *)&v15 updateWithOptions:a3 error:a4];
  int v9 = self->super._width;
  if (__PAIR64__(height, width) == *(void *)&self->super._width)
  {
    if (width < 1 || motionFlowComputationAccuracy == self->super._motionFlowComputationAccuracy) {
      return 1;
    }
  }
  else
  {
    if (v9 < 1) {
      return 1;
    }
    int height = self->super._height;
  }
  if (height >= 1)
  {
    motionFlowAnalyzer = self->_motionFlowAnalyzer;
    *(float *)&double v8 = (float)v9 / (float)height;
    v12 = [NSNumber numberWithFloat:v8];
    int v13 = [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer updateModelForAspectRatio:v12 computationAccuracy:self->super._motionFlowComputationAccuracy];

    return v13 == 0;
  }
  return 1;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  if (motionFlowAnalyzer) {
    [(VCPImageMotionFlowAnalyzer *)motionFlowAnalyzer preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
  }
  preferredint Width = (double)self->_preferredWidth;
  preferredint Height = (double)self->_preferredHeight;
  result.int height = preferredHeight;
  result.int width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  self->_motionFlowAnalyzer = 0;

  return 1;
}

- (void)dealloc
{
  transferSession = self->_transferSession;
  if (transferSession) {
    CFRelease(transferSession);
  }
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  self->_motionFlowAnalyzer = 0;

  v5.receiver = self;
  v5.super_class = (Class)VCPMotionFlowRequest;
  [(VCPMotionFlowRequest *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

@end