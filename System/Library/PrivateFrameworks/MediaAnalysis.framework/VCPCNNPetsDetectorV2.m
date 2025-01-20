@interface VCPCNNPetsDetectorV2
+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6;
- (VCPCNNPetsDetectorV2)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (id).cxx_construct;
- (int)configForAspectRatio:(id)a3;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6;
- (int)createModel:(int)a3 srcWidth:(int)a4;
- (int)generatePetsBoxes:(id)a3;
- (int)generatePetsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5;
- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6;
- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2];
- (int64_t)getClosestAspectRatio:(id)a3;
- (void)dealloc;
- (void)nonMaxSuppression:(id)a3;
@end

@implementation VCPCNNPetsDetectorV2

+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  if (+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::once != -1) {
    dispatch_once(&+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::once, &__block_literal_global_75);
  }
  v10 = (void *)[objc_alloc((Class)+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::analyzerClass) initWithMaxNumRegions:v9 forceCPU:v8 sharedModel:v7 revision:v6];
  return v10;
}

uint64_t __63__VCPCNNPetsDetectorV2_detector_forceCPU_sharedModel_revision___block_invoke()
{
  uint64_t result = objc_opt_class();
  +[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::analyzerClass = result;
  return result;
}

- (VCPCNNPetsDetectorV2)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  self->_maxNumRegions = a3;
  self->_numClass = 4;
  self->_revision = a6;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1F15EE6A0;

  v25.receiver = self;
  v25.super_class = (Class)VCPCNNPetsDetectorV2;
  v10 = [(VCPCNNPetsDetectorV2 *)&v25 init];
  if (!v10) {
    goto LABEL_7;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v12 = [v11 resourceURL];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = @"cnn_pets_detector_v2.espresso.net";
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: Loading model %@", buf, 0xCu);
    }
  }
  v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_pets_detector_v2.espresso.net" relativeToURL:v12];
  v15 = [VCPCNNModelEspresso alloc];
  v16 = v10->_outputNames;
  v26[0] = @"forceCPU";
  v17 = [NSNumber numberWithBool:v7];
  v27[0] = v17;
  v26[1] = @"sharedContext";
  v18 = [NSNumber numberWithBool:v6];
  v27[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v20 = [(VCPCNNModelEspresso *)v15 initWithParameters:v14 inputNames:0 outputNames:v16 properties:v19];
  modelEspresso = v10->_modelEspresso;
  v10->_modelEspresso = (VCPCNNModelEspresso *)v20;

  LOBYTE(v19) = v10->_modelEspresso == 0;
  if (v19) {
    v22 = 0;
  }
  else {
LABEL_7:
  }
    v22 = v10;
  v23 = v22;

  return v23;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  BOOL v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  BOOL v8 = VCPSignPostLog();
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "copyImageToRGBPetsDetectorV2CallFromSPI", "", buf, 2u);
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
              double v31 = (double)*(unint64_t *)&v25 / 255.0;
              *(float *)&double v31 = v31;
              a4[i] = *(float *)&v31;
              LOBYTE(v31) = BaseAddress[(int)(i * 4) + 1];
              double v32 = (double)*(unint64_t *)&v31 / 255.0;
              *(float *)&double v32 = v32;
              v28[i] = *(float *)&v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4)];
              double v25 = (double)*(unint64_t *)&v32 / 255.0;
              *(float *)&double v25 = v25;
              v27[i] = *(float *)&v25;
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
        v34 = v33;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)v36 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v7, "copyImageToRGBPetsDetectorV2CallFromSPI", "", v36, 2u);
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

- (int64_t)getClosestAspectRatio:(id)a3
{
  id v3 = a3;
  int64_t v4 = objc_msgSend(&unk_1F15EE6B8, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(&unk_1F15EE6B8, "count"), 1280, &__block_literal_global_220);
  uint64_t v5 = [&unk_1F15EE6B8 count];
  if (v4 >= (unint64_t)(v5 - 1)) {
    int64_t v4 = v5 - 1;
  }
  if (v4 >= 1)
  {
    BOOL v6 = [&unk_1F15EE6B8 objectAtIndexedSubscript:v4];
    [v6 floatValue];
    float v8 = v7;
    [v3 floatValue];
    float v10 = v9;
    [v3 floatValue];
    float v12 = v11;
    CVReturn v13 = [&unk_1F15EE6B8 objectAtIndexedSubscript:v4 - 1];
    [v13 floatValue];
    float v14 = v8 - v10;
    float v16 = v12 - v15;

    if (v14 > v16) {
      --v4;
    }
  }

  return v4;
}

uint64_t __46__VCPCNNPetsDetectorV2_getClosestAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)configForAspectRatio:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = NSNumber;
    [v4 floatValue];
    float v8 = v7;
    [v5 floatValue];
    *(float *)&double v9 = 1.0 / *(float *)&v9;
    if (v8 >= *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    float v10 = [v6 numberWithFloat:v9];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      float v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)int v26 = v5;
        *(_WORD *)&v26[8] = 2112;
        v27 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: aspectRatio = %@, queryAspectRatioVal = %@", buf, 0x16u);
      }
    }
    int v12 = [(VCPCNNPetsDetectorV2 *)self getClosestAspectRatio:v10];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      CVReturn v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v26 = v12;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: feasibleShapeIndex = %d", buf, 8u);
      }
    }
    [v5 floatValue];
    float v15 = (float *)((char *)&kFeasibleInputShape + 8 * v12);
    float v16 = *v15;
    float v17 = v15[1];
    if (*v15 >= v17) {
      float v18 = v15[1];
    }
    else {
      float v18 = *v15;
    }
    if (*v15 < v17) {
      float v16 = v15[1];
    }
    if (v14 <= 1.0) {
      float v19 = v18;
    }
    else {
      float v19 = v16;
    }
    if (v14 <= 1.0) {
      float v20 = v16;
    }
    else {
      float v20 = v18;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v26 = (int)v20;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = (int)v19;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: detectorHeight = %d, detectorint Width = %d", buf, 0xEu);
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"res_%dx%d", (int)v19, (int)v20);
    uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    resConfig = self->_resConfig;
    self->_resConfig = v22;
  }
  return 0;
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_srcWidth == a4 && self->_srcHeight == a3) {
    return 0;
  }
  *(float *)&double v4 = (float)a4 / (float)a3;
  double v9 = [NSNumber numberWithFloat:v4];
  int v8 = [(VCPCNNPetsDetectorV2 *)self configForAspectRatio:v9];

  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      float v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        resConfig = self->_resConfig;
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = resConfig;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: _resConfig = %@", buf, 0xCu);
      }
    }
    int v8 = [(VCPCNNModelEspresso *)self->_modelEspresso prepareModelWithConfig:self->_resConfig];
    if (!v8)
    {
      modelEspresso = self->_modelEspresso;
      if (modelEspresso)
      {
        [(VCPCNNModelEspresso *)modelEspresso inputBlob];
        CVReturn v13 = self->_modelEspresso;
        self->_cnnInputint Height = v31;
        if (v13)
        {
          [(VCPCNNModelEspresso *)v13 inputBlob];
          int v14 = v30;
        }
        else
        {
          int v14 = 0;
        }
      }
      else
      {
        int v14 = 0;
        self->_cnnInputint Height = 0;
      }
      self->_cnnInputint Width = v14;
      self->_srcint Width = 0;
      self->_srcint Height = 0;
      inputData = self->_inputData;
      if (inputData) {
        MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
      }
      float v16 = self->_modelEspresso;
      if (v16 && ([(VCPCNNModelEspresso *)v16 inputBlob], (float v17 = self->_modelEspresso) != 0))
      {
        uint64_t v18 = v31;
        [(VCPCNNModelEspresso *)v17 inputBlob];
        float v19 = self->_modelEspresso;
        uint64_t v20 = v27 * v18;
        if (v19)
        {
          [(VCPCNNModelEspresso *)v19 inputBlob];
          uint64_t v21 = v26;
LABEL_23:
          unint64_t v22 = v20 * v21;
          if (v22 >> 62) {
            size_t v23 = -1;
          }
          else {
            size_t v23 = 4 * v22;
          }
          v24 = (float *)operator new[](v23, MEMORY[0x1E4FBA2D0]);
          self->_inputData = v24;
          if (!v24) {
            return -108;
          }
          int v8 = 0;
          self->_srcint Width = a4;
          self->_srcint Height = a3;
          return v8;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v21 = 0;
      goto LABEL_23;
    }
  }
  return v8;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsDetectorV2;
  [(VCPCNNPetsDetectorV2 *)&v4 dealloc];
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    [(VCPCNNModelEspresso *)modelEspresso inputBlob];
    int v10 = v15;
  }
  else
  {
    int v10 = 0;
  }
  *a5 = v10;
  float v11 = self->_modelEspresso;
  if (v11)
  {
    [(VCPCNNModelEspresso *)v11 inputBlob];
    int v12 = v14;
  }
  else
  {
    int v12 = 0;
  }
  *a6 = v12;
  return self->_inputData;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
{
  if (!a3) {
    return -108;
  }
  CFTypeRef cf = 0;
  Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, *(uint64_t *)&a6, *(uint64_t *)&a5, 1111970369);
  int v9 = v8;
  if (!v8) {
    int v9 = [(VCPCNNPetsDetectorV2 *)self copyImage:cf toData:a3];
  }
  if (cf) {
    CFRelease(cf);
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
      uint64_t v5 = [v19 objectAtIndexedSubscript:i];
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
            if (v15 > 0.45)
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
  id v60 = a6;
  {
    -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride = self->_numClass + 5;
  }
  if (a4 >= 1)
  {
    int v52 = 0;
    int v9 = a5 * a4;
    uint64_t v56 = a5 * a4;
    double v54 = (double)a4;
    double v55 = (double)a5;
    uint64_t v48 = a4;
    uint64_t v64 = a5;
    v50 = &a3[4 * a5 * a4];
    uint64_t v51 = 0;
    uint64_t v46 = a5;
    uint64_t v47 = 4 * a5;
    int v49 = a5;
    int v53 = a5 * a4;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v10 = 0;
        BOOL v11 = v50;
        int v61 = v51 * v46;
        int v12 = -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
        int v13 = v52;
        do
        {
          int v14 = 0;
          float v15 = 0.0;
          int v16 = -1;
          float v17 = v11;
          do
          {
            float v18 = 1.0 / (float)(expf(-*v17) + 1.0);
            if (v18 > v15)
            {
              float v15 = v18;
              int v16 = v14;
            }
            ++v14;
            v17 += v12 * v9;
          }
          while (v14 != 3);
          if (v15 > 0.45)
          {
            int v19 = v16 * v9 * v12;
            uint64_t v20 = &a3[(int)v10 + v61 + v19];
            float v21 = expf(-*v20);
            cnnInputint Width = self->_cnnInputWidth;
            size_t v23 = &v20[v56];
            float v24 = expf(-*v23);
            cnnInputint Height = self->_cnnInputHeight;
            double v25 = &v23[v56];
            float v26 = expf(-*v25);
            uint64_t v27 = &(*a7)[2 * v16];
            float v62 = *v27;
            float v28 = expf(-v25[v56]);
            float v29 = v27[1];
            int numClass = self->_numClass;
            if (numClass < 1)
            {
              uint64_t v32 = 0;
              float v34 = -1.0;
            }
            else
            {
              unsigned int v31 = 0;
              LODWORD(v32) = 0;
              v33 = &a3[4 * v56 + v13 + v19];
              float v34 = -1.0;
              do
              {
                float v35 = v15 * (float)(1.0 / (float)(expf(-*v33) + 1.0));
                if (v35 <= v34)
                {
                  uint64_t v32 = v32;
                }
                else
                {
                  float v34 = v35;
                  uint64_t v32 = v31;
                }
                ++v31;
                v33 += v56;
              }
              while (numClass != v31);
            }
            v36 = [VCPBoundingBox alloc];
            double v37 = ((double)(int)v10 + (float)(1.0 / (float)(v21 + 1.0)) * 2.0 + -0.5) * (double)cnnInputWidth / v55;
            *(float *)&double v37 = v37;
            double v38 = ((double)(int)v51 + (float)(1.0 / (float)(v24 + 1.0)) * 2.0 + -0.5) * (double)cnnInputHeight / v54;
            *(float *)&double v38 = v38;
            double v39 = (float)((float)(1.0 / (float)(v26 + 1.0)) + (float)(1.0 / (float)(v26 + 1.0)));
            double v40 = v39 * v39 * v62;
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
            *(float *)&double v42 = v15 * *(float *)&v42;
            v44 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v36, "initWithCenterAndSize:y:width:height:confidence:", v37, v38, v40, v43, v42, v46);
            [(VCPBoundingBox *)v44 setClassIndex:v32];
            [v60 addObject:v44];

            int v12 = -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
            int v9 = v53;
          }
          ++v10;
          ++v11;
          ++v13;
        }
        while (v10 != v64);
      }
      v50 = (float *)((char *)v50 + v47);
      ++v51;
      a5 = v49;
      v52 += v49;
    }
    while (v51 != v48);
  }

  return 0;
}

- (int)generatePetsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
{
  id v8 = a4;
  uint64_t v9 = *(void *)a3;
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    uint64_t v10 = (char *)&kAnchorBoxes;
    do
    {
      [(VCPCNNPetsDetectorV2 *)self retrieveBoxes:*(void *)v9 outHeight:*(unsigned int *)(v9 + 88) outWidth:*(unsigned int *)(v9 + 80) boxes:v8 anchorBox:v10];
      v10 += 24;
      v9 += 168;
    }
    while (v9 != *((void *)a3 + 1));
  }
  [v8 sortUsingComparator:&__block_literal_global_230];
  [(VCPCNNPetsDetectorV2 *)self nonMaxSuppression:v8];
  [v8 sortUsingComparator:&__block_literal_global_232];
  while ([v8 count] > (unint64_t)a5)
    [v8 removeLastObject];
  BOOL v11 = [v8 lastObject];
  if (v11)
  {
    do
    {
      [v11 flag];
      if (v12 != 0.0) {
        break;
      }
      [v8 removeLastObject];
      uint64_t v13 = [v8 lastObject];

      BOOL v11 = (void *)v13;
    }
    while (v13);
  }
  return 0;
}

uint64_t __64__VCPCNNPetsDetectorV2_generatePetsRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __64__VCPCNNPetsDetectorV2_generatePetsRegions_boxes_maxNumRegions___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (int)generatePetsBoxes:(id)a3
{
  id v4 = a3;
  int v5 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!v5)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlobs];
    }
    else
    {
      __p = 0;
      float v9 = 0;
      uint64_t v10 = 0;
    }
    int v5 = [(VCPCNNPetsDetectorV2 *)self generatePetsRegions:&__p boxes:v4 maxNumRegions:self->_maxNumRegions];
    if (__p)
    {
      float v9 = __p;
      operator delete(__p);
    }
  }

  return v5;
}

- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  id v11 = a5;
  id v12 = a6;
  float v13 = v12;
  if (v12 && ((*((uint64_t (**)(id))v12 + 2))(v12) & 1) != 0)
  {
    int v14 = -128;
LABEL_13:
    int v6 = v14;
    goto LABEL_14;
  }
  context = (void *)MEMORY[0x1C186D320]();
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t v17 = Height;
  uint64_t v51 = 0;
  if ((int)Height >= (int)Width) {
    int v18 = Width;
  }
  else {
    int v18 = Height;
  }
  if (v18 < 224)
  {
    int v14 = 0;
LABEL_11:
    int v20 = 4;
    goto LABEL_12;
  }
  int v14 = [(VCPCNNPetsDetectorV2 *)self createModel:Height srcWidth:Width];
  if (v14) {
    goto LABEL_11;
  }
  float v19 = [(VCPCNNPetsDetectorV2 *)self getInputBuffer:v17 srcWidth:Width cnnInputHeight:&v51 cnnInputWidth:(char *)&v51 + 4];
  int v14 = [(VCPCNNPetsDetectorV2 *)self createInput:v19 withBuffer:a3 cnnInputHeight:v51 cnnInputWidth:HIDWORD(v51)];
  if (v14) {
    goto LABEL_11;
  }
  float v22 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [(VCPCNNPetsDetectorV2 *)self generatePetsBoxes:v22];
  if (v6)
  {
    int v20 = 1;
  }
  else
  {
    uint64_t v48 = v22;
    unint64_t v24 = 0;
    *(void *)&long long v23 = 67109376;
    long long v47 = v23;
    while (objc_msgSend(v48, "count", v47) > v24)
    {
      float v25 = [v48 objectAtIndexedSubscript:v24];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          int v27 = [v25 classIndex];
          [v25 confidence];
          *(_DWORD *)buf = v47;
          int v57 = v27;
          __int16 v58 = 2048;
          double v59 = v28;
          _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: pet class index : %d, confidence = %f", buf, 0x12u);
        }
      }
      [v25 confidence];
      if (*(float *)&v29 >= 0.3)
      {
        *(float *)&double v29 = (float)(HIDWORD(v51) - 1);
        *(float *)&double v30 = (float)(v51 - 1);
        [v25 getCGRectWithClipWidth:v29 height:v30];
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        int numClass = [v25 classIndex];
        if (!numClass) {
          int numClass = self->_numClass;
        }
        uint64_t v40 = (numClass - 1);
        if (v40 > 1)
        {
          v52[0] = @"petsBounds";
          v62.origin.x = v32;
          v62.origin.y = v34;
          v62.size.width = v36;
          v62.size.height = v38;
          double v41 = NSStringFromRect(v62);
          v53[0] = v41;
          v52[1] = @"petsConfidence";
          uint64_t v46 = NSNumber;
          [v25 confidence];
          double v43 = objc_msgSend(v46, "numberWithFloat:");
          v53[1] = v43;
          v52[2] = @"petsType";
          v44 = [NSNumber numberWithInt:v40];
          v53[2] = v44;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
          [v11 addObject:v45];
        }
        else
        {
          v54[0] = @"petsBounds";
          v61.origin.x = v32;
          v61.origin.y = v34;
          v61.size.width = v36;
          v61.size.height = v38;
          double v41 = NSStringFromRect(v61);
          v55[0] = v41;
          v54[1] = @"petsConfidence";
          double v42 = NSNumber;
          [v25 confidence];
          double v43 = objc_msgSend(v42, "numberWithFloat:");
          v55[1] = v43;
          v54[2] = @"petsType";
          v44 = [NSNumber numberWithInt:v40];
          v55[2] = v44;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
          [v50 addObject:v45];
        }
      }
      ++v24;
    }
    int v20 = 0;
    float v22 = v48;
  }

  int v14 = 0;
LABEL_12:
  if ((v20 | 4) == 4) {
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

@end