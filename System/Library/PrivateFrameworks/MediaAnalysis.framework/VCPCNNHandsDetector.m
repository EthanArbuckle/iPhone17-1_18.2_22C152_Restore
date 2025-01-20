@interface VCPCNNHandsDetector
+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7;
- (VCPCNNHandsDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7;
- (id).cxx_construct;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4;
- (int)createModelWithResConfig:(id)a3;
- (int)drawLine:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 point0:(CGPoint)a7 point1:(CGPoint)a8 drawPoint:(int)a9;
- (int)drawRectangle:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 keypoints:(CGPoint *)a7;
- (int)generateHandsBoxes:(id)a3;
- (int)generateHandsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5;
- (int)handsDetection:(__CVBuffer *)a3 handsRegions:(id)a4 cancel:(id)a5;
- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2];
- (int)updateMaxNumRegions:(int)a3;
- (int)updateModelWithResConfig:(id)a3;
- (void)dealloc;
- (void)nonMaxSuppression:(id)a3;
@end

@implementation VCPCNNHandsDetector

+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a6;
  if (+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::once != -1) {
    dispatch_once(&+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::once, &__block_literal_global_69);
  }
  v12 = (void *)[objc_alloc((Class)+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::analyzerClass) initWithMaxNumRegions:v10 forceCPU:v9 sharedModel:v8 inputConfig:v11 revision:v7];

  return v12;
}

uint64_t __74__VCPCNNHandsDetector_detector_forceCPU_sharedModel_inputConfig_revision___block_invoke()
{
  uint64_t result = objc_opt_class();
  +[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::analyzerClass = result;
  return result;
}

- (VCPCNNHandsDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v50[2] = *MEMORY[0x1E4F143B8];
  v12 = (__CFString *)a6;
  self->_maxNumRegions = a3;
  self->_numClass = 2;
  self->_revision = a7;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1F15EE598;

  v44.receiver = self;
  v44.super_class = (Class)VCPCNNHandsDetector;
  v14 = [(VCPCNNHandsDetector *)&v44 init];
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v17 = [v16 resourceURL];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = @"cnn_hand_detector_v2.espresso.net";
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "CNNHandsDetector: Loading model %@", buf, 0xCu);
      }
    }
    v19 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_hand_detector_v2.espresso.net" relativeToURL:v17];
    v20 = [VCPCNNModelEspresso alloc];
    v21 = v14->_outputNames;
    v49[0] = @"forceCPU";
    v22 = [NSNumber numberWithBool:v9];
    v50[0] = v22;
    v49[1] = @"sharedContext";
    v23 = [NSNumber numberWithBool:v8];
    v50[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
    uint64_t v25 = [(VCPCNNModelEspresso *)v20 initWithParameters:v19 inputNames:0 outputNames:v21 properties:v24];
    modelEspresso = v14->_modelEspresso;
    v14->_modelEspresso = (VCPCNNModelEspresso *)v25;

    if (!v14->_modelEspresso) {
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v12;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "CNNHandsDetector: adopting model config: %@", buf, 0xCu);
      }
    }
    if ([(VCPCNNModelEspresso *)v14->_modelEspresso prepareModelWithConfig:v12])
    {
LABEL_12:

LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
    v30 = v14->_modelEspresso;
    if (v30 && ([(VCPCNNModelEspresso *)v30 inputBlob], (v31 = v14->_modelEspresso) != 0))
    {
      uint64_t v32 = v48;
      [(VCPCNNModelEspresso *)v31 inputBlob];
      v33 = v14->_modelEspresso;
      uint64_t v34 = v43 * v32;
      if (v33)
      {
        [(VCPCNNModelEspresso *)v33 inputBlob];
        uint64_t v35 = v42;
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
    uint64_t v35 = 0;
LABEL_21:
    unint64_t v36 = v34 * v35;
    if (v36 >> 62) {
      size_t v37 = -1;
    }
    else {
      size_t v37 = 4 * v36;
    }
    v14->_inputData = (float *)operator new[](v37, MEMORY[0x1E4FBA2D0]);
    v38 = v14->_modelEspresso;
    if (v38)
    {
      [(VCPCNNModelEspresso *)v38 inputBlob];
      v39 = v14->_modelEspresso;
      v14->_cnnInputHeight = v48;
      if (v39)
      {
        [(VCPCNNModelEspresso *)v39 inputBlob];
        int v40 = v47;
      }
      else
      {
        int v40 = 0;
      }
    }
    else
    {
      int v40 = 0;
      v14->_cnnInputHeight = 0;
    }
    v14->_cnnInputWidth = v40;
    BOOL v41 = v14->_inputData == 0;

    if (!v41)
    {
      v15 = v14;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_14:
  v28 = v15;

  return v28;
}

- (int)updateModelWithResConfig:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_modelEspresso)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "CNNHandsDetectorEspresso: updating model config to %@", (uint8_t *)&v8, 0xCu);
      }
    }
    int v6 = [(VCPCNNHandsDetector *)self createModelWithResConfig:v4];
  }
  else
  {
    int v6 = -108;
  }

  return v6;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  self->_inputData = 0;
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNHandsDetector;
  [(VCPCNNHandsDetector *)&v4 dealloc];
}

- (int)createModelWithResConfig:(id)a3
{
  id v4 = a3;
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  int v6 = [(VCPCNNModelEspresso *)self->_modelEspresso prepareModelWithConfig:v4];
  if (!v6)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && ([(VCPCNNModelEspresso *)modelEspresso inputBlob], (int v8 = self->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v8 inputBlob];
      id v9 = self->_modelEspresso;
      uint64_t v10 = v19 * v21;
      if (v9)
      {
        [(VCPCNNModelEspresso *)v9 inputBlob];
        uint64_t v11 = v18;
LABEL_10:
        unint64_t v12 = v10 * v11;
        if (v12 >> 62) {
          size_t v13 = -1;
        }
        else {
          size_t v13 = 4 * v12;
        }
        self->_inputData = (float *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
        v14 = self->_modelEspresso;
        if (v14)
        {
          [(VCPCNNModelEspresso *)v14 inputBlob];
          v15 = self->_modelEspresso;
          self->_cnnInputWidth = v20;
          if (v15)
          {
            [(VCPCNNModelEspresso *)v15 inputBlob];
            int v16 = v21;
          }
          else
          {
            int v16 = 0;
          }
        }
        else
        {
          int v16 = 0;
          self->_cnnInputWidth = 0;
        }
        self->_cnnInputHeight = v16;
        if (self->_inputData) {
          int v6 = 0;
        }
        else {
          int v6 = -108;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = 0;
    goto LABEL_10;
  }
LABEL_21:

  return v6;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  int v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  int v8 = VCPSignPostLog();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "copyImageToBGRHandDetectorCallFromSPI", "", buf, 2u);
  }

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    int v12 = Height;
    CVReturn v13 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    *(_DWORD *)buf = v13;
    if (v13)
    {
      int v14 = v13;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      bzero(a4, 3 * 4 * Width * v12);
      if (v12 >= 1)
      {
        int v26 = 0;
        v27 = &a4[2 * v12 * Width];
        v28 = &a4[v12 * Width];
        uint64_t v29 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (uint64_t i = 0; i != Width; ++i)
            {
              LOBYTE(v25) = BaseAddress[(int)(i * 4) + 2];
              float v31 = (float)LODWORD(v25);
              a4[i] = v31;
              LOBYTE(v31) = BaseAddress[(int)(i * 4) + 1];
              float v32 = (float)LODWORD(v31);
              v28[i] = v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4)];
              float v25 = (float)LODWORD(v32);
              v27[i] = v25;
            }
          }
          BaseAddress += BytesPerRow;
          ++v26;
          v27 = (float *)((char *)v27 + v29);
          v28 = (float *)((char *)v28 + v29);
          a4 = (float *)((char *)a4 + v29);
        }
        while (v26 != v12);
      }
      int v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v14)
      {
        v33 = VCPSignPostLog();
        uint64_t v34 = v33;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)unint64_t v36 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v7, "copyImageToBGRHandDetectorCallFromSPI", "", v36, 2u);
        }

        int v14 = 0;
      }
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v15) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    int v14 = -50;
    *(_DWORD *)buf = -50;
  }
  if (pixelBuffer
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
  }
  return v14;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4
{
  if (!a3) {
    return -108;
  }
  CFTypeRef cf = 0;
  os_signpost_id_t v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = VCPSignPostLog();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "scalerHandDetectorCallFromSPI", "", buf, 2u);
  }

  Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, self->_cnnInputWidth, self->_cnnInputHeight, 1111970369);
  int v12 = v11;
  if (!v11)
  {
    CVReturn v13 = VCPSignPostLog();
    int v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v8, "scalerHandDetectorCallFromSPI", "", v16, 2u);
    }

    int v12 = [(VCPCNNHandsDetector *)self copyImage:cf toData:a3];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

- (int)updateMaxNumRegions:(int)a3
{
  self->_maxNumRegions = a3;
  return 0;
}

- (int)generateHandsBoxes:(id)a3
{
  id v4 = a3;
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = VCPSignPostLog();
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(__p) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "inferenceHandDetectorCallFromSPI", "", (uint8_t *)&__p, 2u);
  }

  int v9 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!v9)
  {
    uint64_t v10 = VCPSignPostLog();
    int v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(__p) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_END, v6, "inferenceHandDetectorCallFromSPI", "", (uint8_t *)&__p, 2u);
    }

    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlobs];
    }
    else
    {
      __p = 0;
      BOOL v15 = 0;
      uint64_t v16 = 0;
    }
    int v9 = [(VCPCNNHandsDetector *)self generateHandsRegions:&__p boxes:v4 maxNumRegions:self->_maxNumRegions];
    if (__p)
    {
      BOOL v15 = __p;
      operator delete(__p);
    }
  }

  return v9;
}

- (void)nonMaxSuppression:(id)a3
{
  id v19 = a3;
  unint64_t v3 = [v19 count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = [v19 objectAtIndexedSubscript:i];
      LODWORD(v6) = 1.0;
      [v5 setFlag:v6];
    }
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    do
    {
      int v9 = [v19 objectAtIndexedSubscript:v7];
      [v9 flag];
      BOOL v11 = v10 == 1.0 && v3 > ++v7;
      unint64_t v12 = v8;
      if (v11)
      {
        do
        {
          CVReturn v13 = [v19 objectAtIndexedSubscript:v12];
          [v13 flag];
          if (v14 == 1.0)
          {
            [v9 computeIntersectionOverUnion:v13];
            if (v15 > 0.6)
            {
              [v9 confidence];
              float v17 = v16;
              [v13 confidence];
              if (v17 <= v18)
              {
                [v9 setFlag:0.0];

                break;
              }
              [v13 setFlag:0.0];
            }
          }

          ++v12;
        }
        while (v3 > v12);
      }

      ++v8;
    }
    while (v7 != v3);
  }
}

- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2]
{
  id v62 = a6;
  {
    -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride = self->_numClass + 5;
  }
  if (a4 >= 1)
  {
    int v55 = 0;
    int v9 = a5 * a4;
    uint64_t v59 = a5 * a4;
    double v57 = (double)a4;
    double v58 = (double)a5;
    uint64_t v51 = a4;
    int v52 = a5;
    uint64_t v66 = a5;
    v53 = &a3[4 * a5 * a4];
    uint64_t v54 = 0;
    int v49 = a5;
    uint64_t v50 = 4 * a5;
    float v10 = 0.5;
    int v56 = a5 * a4;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v11 = 0;
        unint64_t v12 = v53;
        int v13 = -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
        int v14 = v55;
        do
        {
          int v15 = 0;
          float v16 = 0.0;
          int v17 = -1;
          float v18 = v12;
          do
          {
            float v19 = 1.0 / (float)(expf(-*v18) + 1.0);
            if (v19 > v16)
            {
              float v16 = v19;
              int v17 = v15;
            }
            ++v15;
            v18 += v13 * v9;
          }
          while (v15 != 3);
          if (v16 > v10)
          {
            int v20 = v17 * v9 * v13;
            uint64_t v21 = &a3[(int)v11 + (int)v54 * v49 + v20];
            float v22 = expf(-*v21);
            cnnInputint Width = self->_cnnInputWidth;
            v23 = &v21[v59];
            float v24 = expf(-*v23);
            cnnInputint Height = self->_cnnInputHeight;
            float v25 = &v23[v59];
            float v26 = expf(-*v25);
            v27 = &(*a7)[2 * v17];
            float v63 = *v27;
            float v28 = expf(-v25[v59]);
            float v29 = v27[1];
            int numClass = self->_numClass;
            if (numClass < 1)
            {
              int v32 = 0;
              float v34 = -1.0;
            }
            else
            {
              int v31 = 0;
              int v32 = 0;
              v33 = &a3[4 * v59 + v14 + v20];
              float v34 = -1.0;
              do
              {
                float v35 = v16 * (float)(1.0 / (float)(expf(-*v33) + 1.0));
                if (v35 > v34)
                {
                  float v34 = v35;
                  int v32 = v31;
                }
                ++v31;
                v33 += v59;
              }
              while (numClass != v31);
            }
            unint64_t v36 = [VCPBoundingBox alloc];
            double v37 = ((double)(int)v11 + (float)(1.0 / (float)(v22 + 1.0)) * 2.0 + -0.5) * (double)cnnInputWidth / v58;
            *(float *)&double v37 = v37;
            double v38 = ((double)(int)v54 + (float)(1.0 / (float)(v24 + 1.0)) * 2.0 + -0.5) * (double)cnnInputHeight / v57;
            *(float *)&double v38 = v38;
            double v39 = (float)((float)(1.0 / (float)(v26 + 1.0)) + (float)(1.0 / (float)(v26 + 1.0)));
            double v40 = v39 * v39 * v63;
            *(float *)&double v40 = v40;
            double v41 = (float)((float)(1.0 / (float)(v28 + 1.0)) + (float)(1.0 / (float)(v28 + 1.0)));
            double v42 = v29;
            double v43 = v41 * v41 * v29;
            *(float *)&double v43 = v43;
            if (numClass >= 2) {
              *(float *)&double v42 = v34;
            }
            else {
              *(float *)&double v42 = 1.0;
            }
            *(float *)&double v42 = v16 * *(float *)&v42;
            objc_super v44 = [(VCPBoundingBox *)v36 initWithCenterAndSize:v37 y:v38 width:v40 height:v43 confidence:v42];
            v45 = v44;
            if (v32) {
              unsigned int v46 = -1;
            }
            else {
              unsigned int v46 = 1;
            }
            if (self->_numClass >= 2) {
              uint64_t v47 = v46;
            }
            else {
              uint64_t v47 = 0;
            }
            [(VCPBoundingBox *)v44 setClassIndex:v47];
            [v62 addObject:v45];

            int v13 = -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
            int v9 = v56;
            float v10 = 0.5;
          }
          ++v11;
          ++v12;
          ++v14;
        }
        while (v11 != v66);
      }
      v53 = (float *)((char *)v53 + v50);
      ++v54;
      a5 = v52;
      v55 += v52;
    }
    while (v54 != v51);
  }

  return 0;
}

- (int)generateHandsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
{
  id v8 = a4;
  int v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = VCPSignPostLog();
  unint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "postProcessingHandDetectorCallFromSPI", "", buf, 2u);
  }

  uint64_t v13 = *(void *)a3;
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    int v14 = (char *)&kAnchorBoxes;
    do
    {
      [(VCPCNNHandsDetector *)self retrieveBoxes:*(void *)v13 outHeight:*(unsigned int *)(v13 + 88) outWidth:*(unsigned int *)(v13 + 80) boxes:v8 anchorBox:v14];
      v14 += 24;
      v13 += 168;
    }
    while (v13 != *((void *)a3 + 1));
  }
  [v8 sortUsingComparator:&__block_literal_global_24];
  [(VCPCNNHandsDetector *)self nonMaxSuppression:v8];
  [v8 sortUsingComparator:&__block_literal_global_26];
  while ([v8 count] > (unint64_t)a5)
    [v8 removeLastObject];
  int v15 = [v8 lastObject];
  if (v15)
  {
    do
    {
      [v15 flag];
      if (v16 != 0.0) {
        break;
      }
      [v8 removeLastObject];
      uint64_t v17 = [v8 lastObject];

      int v15 = (void *)v17;
    }
    while (v17);
  }
  float v18 = VCPSignPostLog();
  float v19 = v18;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v21[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_END, v10, "postProcessingHandDetectorCallFromSPI", "", (uint8_t *)v21, 2u);
  }

  return 0;
}

uint64_t __64__VCPCNNHandsDetector_generateHandsRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 confidence];
  float v9 = v8;
  [v7 confidence];
  if (v9 <= v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = -1;
  }

  return v11;
}

uint64_t __64__VCPCNNHandsDetector_generateHandsRegions_boxes_maxNumRegions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 maxX];
  float v32 = v8;
  [v6 minX];
  float v10 = v9;
  [v6 maxY];
  float v12 = v11;
  [v6 minY];
  float v14 = v13;
  [v7 maxX];
  float v16 = v15;
  [v7 minX];
  float v18 = v17;
  [v7 maxY];
  float v20 = v19;
  [v7 minY];
  float v22 = v21;
  [v6 flag];
  float v24 = v23;
  [v7 flag];
  if (v24 <= v25)
  {
    [v6 flag];
    float v28 = v27;
    [v7 flag];
    uint64_t v30 = -1;
    if ((float)((float)(v32 - v10) * (float)(v12 - v14)) <= (float)((float)(v16 - v18) * (float)(v20 - v22))) {
      uint64_t v30 = 1;
    }
    if (v28 >= v29) {
      uint64_t v26 = v30;
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v26 = -1;
  }

  return v26;
}

- (int)drawLine:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 point0:(CGPoint)a7 point1:(CGPoint)a8 drawPoint:(int)a9
{
  int x = (int)a7.x;
  int v10 = (int)a8.x;
  int y = (int)a7.y;
  int v12 = (int)a8.y;
  int v13 = (int)a8.x - (int)a7.x;
  int v14 = (int)a8.y - (int)a7.y;
  if (v13 >= 0) {
    int v15 = (int)a8.x - (int)a7.x;
  }
  else {
    int v15 = (int)a7.x - (int)a8.x;
  }
  if (v14 >= 0) {
    unsigned int v16 = (int)a8.y - (int)a7.y;
  }
  else {
    unsigned int v16 = (int)a7.y - (int)a8.y;
  }
  if (v15 <= v16) {
    int v15 = v16;
  }
  if (a9)
  {
    if (y <= 5) {
      int v17 = 5;
    }
    else {
      int v17 = (int)a7.y;
    }
    int v18 = v17 - 5;
    int v19 = y + 5;
    if (y + 5 >= a5 - 1) {
      int v19 = a5 - 1;
    }
    if (v18 < v19)
    {
      if (x <= 5) {
        uint64_t v20 = 5;
      }
      else {
        uint64_t v20 = x;
      }
      int v21 = v20 - 5;
      int v22 = a4 - 1;
      if (x + 5 < a4 - 1) {
        int v22 = x + 5;
      }
      int v23 = a6 * v18 + 4 * v20 - 19;
      uint64_t v24 = v22 - v20 + 5;
      do
      {
        uint64_t v25 = v24;
        int v26 = v23;
        if (v21 < v22)
        {
          do
          {
            a3[v26] = -1;
            a3[v26 + 1] = -1;
            v26 += 4;
            --v25;
          }
          while (v25);
        }
        ++v18;
        v23 += a6;
      }
      while (v18 != v19);
    }
    if (v12 <= 5) {
      int v27 = 5;
    }
    else {
      int v27 = (int)a8.y;
    }
    int v28 = v27 - 5;
    int v29 = v12 + 5;
    if (v29 >= a5 - 1) {
      int v29 = a5 - 1;
    }
    if (v28 < v29)
    {
      if (v10 <= 5) {
        uint64_t v30 = 5;
      }
      else {
        uint64_t v30 = v10;
      }
      int v31 = v30 - 5;
      int v32 = v10 + 5;
      if (v32 >= a4 - 1) {
        int v32 = a4 - 1;
      }
      int v33 = a6 * v28 + 4 * v30 - 19;
      uint64_t v34 = v32 - v30 + 5;
      do
      {
        uint64_t v35 = v34;
        int v36 = v33;
        if (v31 < v32)
        {
          do
          {
            a3[v36] = -1;
            a3[v36 + 1] = -1;
            v36 += 4;
            --v35;
          }
          while (v35);
        }
        ++v28;
        v33 += a6;
      }
      while (v28 != v29);
    }
  }
  if (v15)
  {
    int v37 = 0;
    float v38 = (float)x;
    float v39 = (float)v15;
    float v40 = (float)y;
    float v41 = (float)v14;
    do
    {
      int v42 = (int)(float)((float)((float)((float)v13 * (float)v37) / v39) + v38);
      int v43 = (int)(float)((float)((float)(v41 * (float)v37) / v39) + v40);
      if (v42 >= a4 - 1) {
        int v44 = a4 - 1;
      }
      else {
        int v44 = (int)(float)((float)((float)((float)v13 * (float)v37) / v39) + v38);
      }
      if (v43 >= a5 - 1) {
        int v45 = a5 - 1;
      }
      else {
        int v45 = (int)(float)((float)((float)(v41 * (float)v37) / v39) + v40);
      }
      if (v43 <= 0) {
        int v46 = 0;
      }
      else {
        int v46 = v45;
      }
      int v47 = 4 * v44;
      int v48 = v46 * a6;
      if (v42 <= 0) {
        int v49 = 0;
      }
      else {
        int v49 = v47;
      }
      uint64_t v50 = v48 + (uint64_t)v49;
      uint64_t v51 = &a3[(int)v50];
      v51[2] = -1;
      a3[v50] = 0;
      v51[1] = 0;
      ++v37;
    }
    while (v15 != v37);
  }
  return 0;
}

- (int)drawRectangle:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 keypoints:(CGPoint *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  for (uint64_t i = 0; i != 3; ++i)
    -[VCPCNNHandsDetector drawLine:width:height:stride:point0:point1:drawPoint:](self, "drawLine:width:height:stride:point0:point1:drawPoint:", a3, v10, v9, v8, 0, a7[i].x, a7[i].y, a7[i + 1].x, a7[i + 1].y);
  -[VCPCNNHandsDetector drawLine:width:height:stride:point0:point1:drawPoint:](self, "drawLine:width:height:stride:point0:point1:drawPoint:", a3, v10, v9, v8, 0, a7[3].x, a7[3].y, a7->x, a7->y);
  return 0;
}

- (int)handsDetection:(__CVBuffer *)a3 handsRegions:(id)a4 cancel:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  float v11 = v10;
  if (v10 && ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) != 0)
  {
    int v12 = -128;
LABEL_20:
    int v5 = v12;
    goto LABEL_21;
  }
  int v13 = (void *)MEMORY[0x1C186D320]();
  CVPixelBufferGetBaseAddress(a3);
  CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferGetWidthOfPlane(a3, 0);
  CVPixelBufferGetHeightOfPlane(a3, 0);
  int v12 = [(VCPCNNHandsDetector *)self createInput:self->_inputData withBuffer:a3];
  if (v12)
  {
    int v14 = 4;
  }
  else
  {
    int v15 = [MEMORY[0x1E4F1CA48] array];
    int v5 = [(VCPCNNHandsDetector *)self generateHandsBoxes:v15];
    if (v5)
    {
      int v12 = 0;
      int v14 = 1;
    }
    else
    {
      unint64_t v17 = 0;
      *(void *)&long long v16 = 67109120;
      long long v25 = v16;
      while (1)
      {
        if (objc_msgSend(v15, "count", v25) <= v17)
        {
          int v14 = 0;
          int v12 = 0;
          goto LABEL_18;
        }
        int v18 = [v15 objectAtIndexedSubscript:v17];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          int v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            int v23 = [v18 classIndex];
            *(_DWORD *)buf = v25;
            int v27 = v23;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "CNNHandsDetector: hand class index: %d", buf, 8u);
          }
        }
        *(float *)&double v20 = (float)self->_cnnInputWidth;
        *(float *)&double v21 = (float)self->_cnnInputHeight;
        LODWORD(v19) = 1028443341;
        int v12 = [v18 extendBoxBy:v19 scaleX:v20 scaleY:v21];
        if (v12) {
          break;
        }
        [v9 addObject:v18];

        ++v17;
      }

      int v14 = 4;
    }
LABEL_18:
  }
  if ((v14 | 4) == 4) {
    goto LABEL_20;
  }
LABEL_21:

  return v5;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end