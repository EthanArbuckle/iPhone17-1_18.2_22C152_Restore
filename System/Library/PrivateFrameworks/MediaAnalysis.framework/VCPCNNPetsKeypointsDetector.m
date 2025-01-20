@interface VCPCNNPetsKeypointsDetector
- (VCPCNNPetsKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4;
- (id).cxx_construct;
- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7;
- (int)parseHeatmap2Keypoints:(id)a3;
- (void)dealloc;
@end

@implementation VCPCNNPetsKeypointsDetector

- (VCPCNNPetsKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v36[2] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)VCPCNNPetsKeypointsDetector;
  v6 = [(VCPCNNPetsKeypointsDetector *)&v34 init];
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v8 = [v7 resourceURL];

    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_pet_pose.espresso.net" relativeToURL:v8];
    v10 = [VCPCNNModelEspresso alloc];
    v35[0] = @"forceCPU";
    v11 = [NSNumber numberWithBool:v5];
    v36[0] = v11;
    v35[1] = @"sharedContext";
    v12 = [NSNumber numberWithBool:v4];
    v36[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    uint64_t v14 = [(VCPCNNModelEspresso *)v10 initWithParameters:v9 inputNames:0 outputNames:0 properties:v13];
    modelEspresso = v6->_modelEspresso;
    v6->_modelEspresso = (VCPCNNModelEspresso *)v14;

    v16 = v6->_modelEspresso;
    if (!v16 || [(VCPCNNModelEspresso *)v16 prepareModelWithConfig:&stru_1F15A0D70])
    {
      v17 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v18 = v6->_modelEspresso;
    if (v18 && ([(VCPCNNModelEspresso *)v18 inputBlob], (v19 = v6->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v19 inputBlob];
      v20 = v6->_modelEspresso;
      uint64_t v21 = v31 * v33;
      if (v20)
      {
        [(VCPCNNModelEspresso *)v20 inputBlob];
        uint64_t v22 = v30;
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
          v6->_inputWidth = v32;
          if (v26)
          {
            [(VCPCNNModelEspresso *)v26 inputBlob];
            int v27 = v33;
          }
          else
          {
            int v27 = 0;
          }
        }
        else
        {
          int v27 = 0;
          v6->_inputWidth = 0;
        }
        v6->_inputHeight = v27;
        if (v6->_inputData) {
          v17 = v6;
        }
        else {
          v17 = 0;
        }
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  v17 = 0;
LABEL_24:
  v28 = v17;

  return v28;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsKeypointsDetector;
  [(VCPCNNPetsKeypointsDetector *)&v4 dealloc];
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
      size_t v24 = &a4[2 * v8 * Width];
      v25 = &a4[v8 * Width];
      uint64_t v26 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v22) = BaseAddress[(int)(i * 4)];
            double v28 = ((double)*(unint64_t *)&v22 / 255.0 + -0.485000014) / 0.229000002;
            *(float *)&double v28 = v28;
            v24[i] = *(float *)&v28;
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 1];
            double v29 = ((double)*(unint64_t *)&v28 / 255.0 + -0.456) / 0.224000007;
            *(float *)&double v29 = v29;
            v25[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 2];
            double v22 = ((double)*(unint64_t *)&v29 / 255.0 + -0.405999988) / 0.224999994;
            *(float *)&double v22 = v22;
            a4[i] = *(float *)&v22;
          }
        }
        BaseAddress += BytesPerRow;
        ++v23;
        a4 = (float *)((char *)a4 + v26);
        v25 = (float *)((char *)v25 + v26);
        size_t v24 = (float *)((char *)v24 + v26);
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

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  uint64_t v13 = v12;
  if (a3)
  {
    CFTypeRef cf = 0;
    [v12 minX];
    float v15 = v14;
    [v13 minY];
    float v17 = v16;
    [v13 maxX];
    float v19 = v18;
    [v13 minX];
    float v21 = v20;
    [v13 maxY];
    float v23 = v22;
    [v13 minY];
    v28.origin.y = v17;
    v28.size.width = (float)(v19 - v21);
    v28.size.height = (float)(v23 - v24);
    v28.origin.x = v15;
    int v25 = Scaler::ScaleCropped(&self->_scaler, v28, a4, (__CVBuffer **)&cf, v7, v8, 1111970369);
    if (!v25) {
      int v25 = [(VCPCNNPetsKeypointsDetector *)self copyImage:cf toData:a3];
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    int v25 = -108;
  }

  return v25;
}

- (int)parseHeatmap2Keypoints:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso)
  {
    int v33 = 0;
    goto LABEL_8;
  }
  [(VCPCNNModelEspresso *)modelEspresso outputBlob];
  BOOL v5 = self->_modelEspresso;
  int v33 = v38;
  if (!v5)
  {
LABEL_8:
    int v6 = 0;
LABEL_9:
    uint64_t v10 = 0;
    int v9 = 0;
    if (!v6) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  [(VCPCNNModelEspresso *)v5 outputBlob];
  int v6 = v37;
  uint64_t v7 = self->_modelEspresso;
  if (!v7) {
    goto LABEL_9;
  }
  [(VCPCNNModelEspresso *)v7 outputBlob];
  uint64_t v8 = self->_modelEspresso;
  int v9 = v36;
  if (v8)
  {
    [(VCPCNNModelEspresso *)v8 outputBlob];
    uint64_t v10 = *(void *)buf;
    if (!v37)
    {
LABEL_31:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v31 = "Wrong outHeight in parseHeatmap2Keypoints";
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (!v37) {
      goto LABEL_31;
    }
  }
LABEL_10:
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      CVReturn v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v31 = "Wrong outWidth in parseHeatmap2Keypoints";
LABEL_34:
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
      }
LABEL_35:
    }
LABEL_36:
    int v29 = -50;
    goto LABEL_37;
  }
  if (v33 >= 1)
  {
    int v11 = 0;
    int v12 = 0;
    float v13 = (float)(self->_inputWidth / v9);
    float v14 = (float)(self->_inputHeight / v6);
    do
    {
      if (v6 < 1)
      {
        double v20 = 0.0;
        float v17 = 1.1755e-38;
        float v19 = 0.0;
        float v16 = 0.0;
      }
      else
      {
        int v15 = 0;
        float v16 = 0.0;
        float v17 = 1.1755e-38;
        int v18 = v11;
        float v19 = 0.0;
        double v20 = 0.0;
        do
        {
          if (v9 >= 1)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              float v22 = *(float *)(v10 + 4 * (v18 + (int)i));
              if (v22 > 0.1)
              {
                if (v16 <= v22) {
                  float v16 = *(float *)(v10 + 4 * (v18 + (int)i));
                }
                *(float *)&double v20 = *(float *)&v20 + (float)((float)(int)i * v22);
                float v19 = v19 + (float)((float)v15 * v22);
                float v17 = v17 + v22;
              }
            }
          }
          ++v15;
          v18 += v9;
        }
        while (v15 != v6);
      }
      *(float *)&double v20 = (float)(*(float *)&v20 / v17) * v13;
      float v23 = [NSNumber numberWithFloat:v20];
      v39[0] = v23;
      *(float *)&double v24 = (float)(v19 / v17) * v14;
      int v25 = [NSNumber numberWithFloat:v24];
      v39[1] = v25;
      *(float *)&double v26 = v16;
      int v27 = [NSNumber numberWithFloat:v26];
      v39[2] = v27;
      CGRect v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
      [v34 addObject:v28];

      ++v12;
      v11 += v6 * v9;
    }
    while (v12 != v33);
  }
  int v29 = 0;
LABEL_37:

  return v29;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1C186D320]();
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width) {
    int v13 = Width;
  }
  else {
    int v13 = Height;
  }
  if (v13 >= 64)
  {
    int v14 = [(VCPCNNPetsKeypointsDetector *)self createInput:self->_inputData withBuffer:a3 cnnInputHeight:self->_inputHeight cnnInputWidth:self->_inputWidth box:v8];
    if (!v14)
    {
      int v14 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
      if (!v14) {
        int v14 = [(VCPCNNPetsKeypointsDetector *)self parseHeatmap2Keypoints:v9];
      }
    }
  }
  else
  {
    int v14 = 0;
  }

  return v14;
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
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  return self;
}

@end