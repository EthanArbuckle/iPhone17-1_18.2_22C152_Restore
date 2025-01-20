@interface VCPCNNPersonKeypointsDetector
- (VCPCNNPersonKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4;
- (id).cxx_construct;
- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5 padX:(int *)a6 padY:(int *)a7;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7;
- (int)parseKeypoints:(id)a3;
- (void)dealloc;
@end

@implementation VCPCNNPersonKeypointsDetector

- (VCPCNNPersonKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v38[2] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)VCPCNNPersonKeypointsDetector;
  v6 = [(VCPCNNPersonKeypointsDetector *)&v36 init];
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v8 = [v7 resourceURL];

    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_human_pose_single.espresso.net" relativeToURL:v8];
    v10 = [VCPCNNModelEspresso alloc];
    v37[0] = @"forceCPU";
    v11 = [NSNumber numberWithBool:v5];
    v38[0] = v11;
    v37[1] = @"sharedContext";
    v12 = [NSNumber numberWithBool:v4];
    v38[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    uint64_t v14 = [(VCPCNNModelEspresso *)v10 initWithParameters:v9 inputNames:0 outputNames:0 properties:v13];
    modelEspresso = v6->_modelEspresso;
    v6->_modelEspresso = (VCPCNNModelEspresso *)v14;

    v16 = v6->_modelEspresso;
    if (!v16 || [(VCPCNNModelEspresso *)v16 prepareModelWithConfig:&stru_1F15A0D70])
    {
      v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v18 = v6->_modelEspresso;
    if (v18 && ([(VCPCNNModelEspresso *)v18 inputBlob], (v19 = v6->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v19 inputBlob];
      v20 = v6->_modelEspresso;
      uint64_t v21 = v33 * v35;
      if (v20)
      {
        [(VCPCNNModelEspresso *)v20 inputBlob];
        uint64_t v22 = v32;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    uint64_t v22 = 0;
LABEL_12:
    unint64_t v23 = v21 * v22;
    if (v23 >> 62) {
      size_t v24 = -1;
    }
    else {
      size_t v24 = 4 * v23;
    }
    v6->_inputData = (float *)operator new[](v24, MEMORY[0x1E4FBA2D0]);
    v25 = v6->_modelEspresso;
    if (v25)
    {
      [(VCPCNNModelEspresso *)v25 inputBlob];
      v26 = v6->_modelEspresso;
      v6->_inputWidth = v34;
      if (v26)
      {
        [(VCPCNNModelEspresso *)v26 inputBlob];
        v27 = v6->_modelEspresso;
        v6->_inputHeight = v35;
        if (v27)
        {
          [(VCPCNNModelEspresso *)v27 outputBlob];
          v28 = v6->_modelEspresso;
          v6->_outputWidth = v34;
          if (v28)
          {
            [(VCPCNNModelEspresso *)v28 outputBlob];
            int v29 = v35;
          }
          else
          {
            int v29 = 0;
          }
          goto LABEL_23;
        }
LABEL_22:
        int v29 = 0;
        v6->_outputWidth = 0;
LABEL_23:
        v6->_outputHeight = v29;
        if (v6->_inputData) {
          v17 = v6;
        }
        else {
          v17 = 0;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v6->_inputWidth = 0;
    }
    v6->_inputHeight = 0;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_27:
  v30 = v17;

  return v30;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPersonKeypointsDetector;
  [(VCPCNNPersonKeypointsDetector *)&v4 dealloc];
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
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
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return -50;
  }
  int v13 = Height;
  CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v40 = v14;
  if (v14)
  {
    int v15 = v14;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 12 * a5 * (uint64_t)a6);
    int padY = self->_padY;
    if (padY + v13 >= 1)
    {
      int v29 = 0;
      v30 = &a4[2 * a6 * a5];
      v31 = &a4[a6 * a5];
      uint64_t v32 = 4 * a6;
      do
      {
        if (v29 >= padY)
        {
          if (Width >= 1)
          {
            uint64_t v33 = 0;
            uint64_t padX = self->_padX;
            uint64_t v35 = &v30[padX];
            objc_super v36 = &v31[padX];
            v37 = &a4[padX];
            do
            {
              LOBYTE(v27) = BaseAddress[(int)(v33 * 4)];
              double v38 = ((double)*(unint64_t *)&v27 / 255.0 + -0.405999988) / 0.224999994;
              *(float *)&double v38 = v38;
              v35[v33] = *(float *)&v38;
              LOBYTE(v38) = BaseAddress[(int)(v33 * 4) + 1];
              double v39 = ((double)*(unint64_t *)&v38 / 255.0 + -0.456) / 0.224000007;
              *(float *)&double v39 = v39;
              v36[v33] = *(float *)&v39;
              LOBYTE(v39) = BaseAddress[(int)(v33 * 4) + 2];
              double v27 = ((double)*(unint64_t *)&v39 / 255.0 + -0.485000014) / 0.229000002;
              *(float *)&double v27 = v27;
              v37[v33++] = *(float *)&v27;
            }
            while (Width != v33);
          }
          BaseAddress += BytesPerRow;
        }
        ++v29;
        v30 = (float *)((char *)v30 + v32);
        v31 = (float *)((char *)v31 + v32);
        a4 = (float *)((char *)a4 + v32);
      }
      while (v29 != padY + v13);
    }
    int v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v40);
    if (pixelBuffer
      && !v40
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
    }
  }
  return v15;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  if (a3)
  {
    int Width = CVPixelBufferGetWidth(a4);
    int Height = CVPixelBufferGetHeight(a4);
    CFTypeRef cf = 0;
    [v12 minX];
    float v43 = v15;
    [v12 minY];
    float v17 = v16;
    [v12 maxX];
    float v19 = v18;
    [v12 minX];
    float v21 = v20;
    [v12 maxY];
    float v23 = v22;
    [v12 minY];
    float v25 = v24;
    [v12 maxX];
    float v27 = v26;
    [v12 minX];
    float v29 = v28;
    [v12 maxY];
    float v31 = v30;
    [v12 minY];
    float v33 = (float)((float)((float)(v27 - v29) / (float)(v31 - v32)) * (float)Width) / (float)Height;
    if (v33 <= (float)((float)(int)v7 / (float)(int)v8))
    {
      int v36 = 0;
      uint64_t v37 = (int)(float)(v33 * (float)(int)v8);
      int v34 = (int)((double)(self->_inputWidth - (int)v37) * 0.5);
      uint64_t v35 = v8;
    }
    else
    {
      int v34 = 0;
      uint64_t v35 = (int)(float)((float)(int)v7 / v33);
      int v36 = (int)((double)(self->_inputHeight - (int)v35) * 0.5);
      uint64_t v37 = v7;
    }
    self->_int padX = v34;
    self->_int padY = v36;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        int padX = self->_padX;
        int padY = self->_padY;
        *(_DWORD *)buf = 67110144;
        int v46 = v37;
        __int16 v47 = 1024;
        int v48 = v35;
        __int16 v49 = 2048;
        double v50 = v33;
        __int16 v51 = 1024;
        int v52 = padX;
        __int16 v53 = 1024;
        int v54 = padY;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "VCPCNNPersonKeypointsDetector - cropint Width = %d, cropHeight = %d, boxWHRatio = %f, _paxX = %d, _padY = %d", buf, 0x24u);
      }
    }
    v56.origin.x = v43;
    v56.origin.y = v17;
    v56.size.width = (float)(v19 - v21);
    v56.size.height = (float)(v23 - v25);
    int v38 = Scaler::ScaleCropped(&self->_scaler, v56, a4, (__CVBuffer **)&cf, v37, v35, 1111970369);
    if (!v38) {
      int v38 = [(VCPCNNPersonKeypointsDetector *)self copyImage:cf toData:a3 cnnInputHeight:v8 cnnInputWidth:v7];
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    int v38 = -108;
  }

  return v38;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5 padX:(int *)a6 padY:(int *)a7
{
  id v12 = a4;
  id v13 = a5;
  CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  float v15 = (void *)MEMORY[0x1C186D320](Height);
  int v16 = [(VCPCNNPersonKeypointsDetector *)self createInput:self->_inputData withBuffer:a3 cnnInputHeight:self->_inputHeight cnnInputWidth:self->_inputWidth box:v12];
  if (!v16)
  {
    *a6 = self->_padX;
    *a7 = self->_padY;
    int v16 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
    if (!v16) {
      int v16 = [(VCPCNNPersonKeypointsDetector *)self parseKeypoints:v13];
    }
  }

  return v16;
}

- (int)parseKeypoints:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso)
  {
    int v31 = 0;
    goto LABEL_7;
  }
  [(VCPCNNModelEspresso *)modelEspresso outputBlob];
  BOOL v5 = self->_modelEspresso;
  int v31 = v36;
  if (!v5)
  {
LABEL_7:
    int v6 = 0;
    goto LABEL_8;
  }
  [(VCPCNNModelEspresso *)v5 outputBlob];
  int v6 = v35;
  uint64_t v7 = self->_modelEspresso;
  if (!v7)
  {
LABEL_8:
    uint64_t v10 = 0;
    int v9 = 0;
    goto LABEL_9;
  }
  [(VCPCNNModelEspresso *)v7 outputBlob];
  uint64_t v8 = self->_modelEspresso;
  int v9 = v34;
  if (v8)
  {
    [(VCPCNNModelEspresso *)v8 outputBlob];
    uint64_t v10 = v33;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_9:
  int v11 = -50;
  if (v6 && v9)
  {
    if (v31 >= 1)
    {
      int v12 = 0;
      int v13 = 0;
      float v14 = (float)(self->_inputWidth / v9);
      float v15 = (float)(self->_inputHeight / v6);
      do
      {
        if (v6 < 1)
        {
          double v21 = 0.0;
          float v18 = 1.1755e-38;
          float v20 = 0.0;
          float v17 = 0.0;
        }
        else
        {
          int v16 = 0;
          float v17 = 0.0;
          float v18 = 1.1755e-38;
          int v19 = v12;
          float v20 = 0.0;
          double v21 = 0.0;
          do
          {
            if (v9 >= 1)
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                float v23 = *(float *)(v10 + 4 * (v19 + (int)i));
                if (v23 > 0.1)
                {
                  if (v17 <= v23) {
                    float v17 = *(float *)(v10 + 4 * (v19 + (int)i));
                  }
                  *(float *)&double v21 = *(float *)&v21 + (float)((float)(int)i * v23);
                  float v20 = v20 + (float)((float)v16 * v23);
                  float v18 = v18 + v23;
                }
              }
            }
            ++v16;
            v19 += v9;
          }
          while (v16 != v6);
        }
        *(float *)&double v21 = (float)(*(float *)&v21 / v18) * v14;
        float v24 = [NSNumber numberWithFloat:v21];
        v37[0] = v24;
        *(float *)&double v25 = (float)(v20 / v18) * v15;
        float v26 = [NSNumber numberWithFloat:v25];
        v37[1] = v26;
        *(float *)&double v27 = v17;
        float v28 = [NSNumber numberWithFloat:v27];
        void v37[2] = v28;
        float v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
        [v32 addObject:v29];

        ++v13;
        v12 += v6 * v9;
      }
      while (v13 != v31);
    }
    int v11 = 0;
  }

  return v11;
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
  *((void *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end