@interface VCPCNNPetsDetector
+ (id)detector:(int)a3;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (id).cxx_construct;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6;
- (int)createModel:(int)a3 srcWidth:(int)a4;
- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5;
- (int)generatePetsRegions:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 faceBoxes:(id)a7 maxNumRegions:(int)a8;
- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6;
- (int)postProcBoxes:(id)a3 maxNumRegions:(int)a4;
- (void)nonMaxSuppression:(id)a3;
@end

@implementation VCPCNNPetsDetector

+ (id)detector:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[VCPCNNPetsDetector detector:]::once != -1) {
    dispatch_once(&+[VCPCNNPetsDetector detector:]::once, &__block_literal_global_12);
  }
  v4 = (void *)[objc_alloc((Class)+[VCPCNNPetsDetector detector:]::analyzerClass) initWithMaxNumRegions:v3];
  return v4;
}

uint64_t __31__VCPCNNPetsDetector_detector___block_invoke()
{
  uint64_t result = objc_opt_class();
  +[VCPCNNPetsDetector detector:]::analyzerClass = result;
  return result;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v23 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v23) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
    return -50;
  }
  int v10 = Height;
  CVReturn v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v41 = v11;
  if (!v11
    || (int v12 = v11, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v45 = a3,
        __int16 v46 = 1024,
        int v47 = v12,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v12 = v41) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (a5 == 3)
    {
      bzero(a4, 3 * 4 * Width * v10);
      if (v10 >= 1)
      {
        int v16 = 0;
        v17 = &a4[2 * v10 * Width];
        v18 = &a4[v10 * Width];
        uint64_t v19 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (uint64_t i = 0; i != Width; ++i)
            {
              LOBYTE(v15) = BaseAddress[(int)(i * 4) + 2];
              *(float *)&unsigned int v21 = (float)((float)((float)LODWORD(v15) / 255.0) + -0.485) / 0.229;
              a4[i] = *(float *)&v21;
              LOBYTE(v21) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&unsigned int v22 = (float)((float)((float)v21 / 255.0) + -0.456) / 0.224;
              v18[i] = *(float *)&v22;
              LOBYTE(v22) = BaseAddress[(int)(i * 4)];
              float v15 = (float)((float)((float)v22 / 255.0) + -0.406) / 0.225;
              v17[i] = v15;
            }
          }
          BaseAddress += BytesPerRow;
          ++v16;
          v17 = (float *)((char *)v17 + v19);
          v18 = (float *)((char *)v18 + v19);
          a4 = (float *)((char *)a4 + v19);
        }
        while (v16 != v10);
      }
    }
    else
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        int v33 = 0;
        v34 = &a4[2 * v10 * Width];
        v35 = &a4[3 * v10 * Width];
        v36 = &a4[v10 * Width];
        uint64_t v37 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (uint64_t j = 0; j != Width; ++j)
            {
              LOBYTE(v32) = BaseAddress[(int)(j * 4) + 2];
              *(float *)&unsigned int v39 = (float)LODWORD(v32) / 255.0;
              a4[j] = *(float *)&v39;
              LOBYTE(v39) = BaseAddress[(int)(j * 4) + 1];
              *(float *)&unsigned int v40 = (float)v39 / 255.0;
              v36[j] = *(float *)&v40;
              LOBYTE(v40) = BaseAddress[(int)(j * 4)];
              float v32 = (float)v40 / 255.0;
              v34[j] = v32;
              v35[j] = 0.0;
            }
          }
          BaseAddress += BytesPerRow;
          ++v33;
          v35 = (float *)((char *)v35 + v37);
          v34 = (float *)((char *)v34 + v37);
          v36 = (float *)((char *)v36 + v37);
          a4 = (float *)((char *)a4 + v37);
        }
        while (v33 != v10);
      }
    }
    int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v41);
    if (pixelBuffer
      && !v41
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
    }
  }
  return v12;
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
    int v9 = [(VCPCNNPetsDetector *)self copyImage:cf toData:a3 withChannels:3];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5
{
  return -4;
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
          v13 = [v19 objectAtIndexedSubscript:v12];
          [v13 flag];
          if (v14 == 1.0)
          {
            [v9 computeIntersectionOverUnion:v13];
            if (v15 > 0.4)
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

- (int)generatePetsRegions:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 faceBoxes:(id)a7 maxNumRegions:(int)a8
{
  id v63 = a6;
  id v62 = a7;
  if (a4 >= 1)
  {
    int v10 = 4 * a5 * a4;
    uint64_t v11 = a5 * a4;
    v56 = &a3[36 * a5 * a4];
    uint64_t v58 = a4;
    for (uint64_t i = 0; i != v58; ++i)
    {
      if (a5 >= 1)
      {
        uint64_t v12 = 0;
        float v64 = (float)(int)((32 * i) | 0x10);
        do
        {
          int v13 = 0;
          uint64_t v14 = 0;
          uint64_t v15 = (uint64_t)&v56[i * a5 + v12];
          float v16 = &a3[i * a5 + v12];
          uint64_t v61 = v12;
          float v65 = (float)(int)((32 * v12) | 0x10);
          do
          {
            uint64_t v17 = v13;
            float v18 = (float *)(v15 + 4 * v13);
            float v19 = fmaxf(*v18, v18[v11]);
            if (v19 > 0.2)
            {
              v20 = &v16[v13];
              float v22 = *(float *)((char *)&unk_1BC281014 + v14);
              float v21 = *(float *)((char *)&unk_1BC281014 + v14 + 4);
              float v23 = v20[v11];
              float v24 = *v20;
              float v25 = v20[2 * v11];
              float v26 = v20[3 * v11];
              uint64_t v27 = [VCPBoundingBox alloc];
              float v28 = expf(v26 * 0.2);
              float v29 = v22 * expf(v25 * 0.2);
              *(float *)&double v30 = 1.0 / (float)(expf(-v19) + 1.0);
              *(float *)&double v31 = v65 + (float)((float)(v24 * 0.1) * v22);
              *(float *)&double v32 = v64 + (float)((float)(v23 * 0.1) * v21);
              *(float *)&double v33 = v29;
              *(float *)&double v34 = v21 * v28;
              v35 = [(VCPBoundingBox *)v27 initWithCenterAndSize:v31 y:v32 width:v33 height:v34 confidence:v30];
              [v63 addObject:v35];
            }
            float v36 = fmaxf(v18[2 * v11], v18[3 * v11]);
            if (v36 > 0.2)
            {
              uint64_t v37 = &v16[v17];
              float v39 = *(float *)((char *)&unk_1BC281014 + v14);
              float v38 = *(float *)((char *)&unk_1BC281014 + v14 + 4);
              float v40 = v37[v11];
              float v41 = *v37;
              float v42 = v37[2 * v11];
              float v43 = v37[3 * v11];
              v44 = [VCPBoundingBox alloc];
              float v45 = expf(v43 * 0.2);
              float v46 = v39 * expf(v42 * 0.2);
              *(float *)&double v47 = 1.0 / (float)(expf(-v36) + 1.0);
              *(float *)&double v48 = v65 + (float)((float)(v41 * 0.1) * v39);
              *(float *)&double v49 = v64 + (float)((float)(v40 * 0.1) * v38);
              *(float *)&double v50 = v46;
              *(float *)&double v51 = v38 * v45;
              v52 = [(VCPBoundingBox *)v44 initWithCenterAndSize:v48 y:v49 width:v50 height:v51 confidence:v47];
              [v62 addObject:v52];
            }
            v14 += 8;
            int v13 = v17 + v10;
          }
          while (v14 != 72);
          uint64_t v12 = v61 + 1;
        }
        while (v61 + 1 != a5);
      }
    }
  }
  [(VCPCNNPetsDetector *)self postProcBoxes:v63 maxNumRegions:a8];
  [(VCPCNNPetsDetector *)self postProcBoxes:v62 maxNumRegions:a8];

  return 0;
}

- (int)postProcBoxes:(id)a3 maxNumRegions:(int)a4
{
  LODWORD(i) = a4;
  id v6 = a3;
  [(VCPCNNPetsDetector *)self nonMaxSuppression:v6];
  [v6 sortUsingComparator:&__block_literal_global_194];
  if ([v6 count] > (unint64_t)(int)i)
  {
    for (unint64_t i = (int)i; [v6 count] > i; ++i)
      [v6 removeLastObject];
  }
  uint64_t v7 = [v6 lastObject];
  if (v7)
  {
    do
    {
      [v7 flag];
      if (v8 != 0.0) {
        break;
      }
      [v6 removeLastObject];
      uint64_t v9 = [v6 lastObject];

      uint64_t v7 = (void *)v9;
    }
    while (v9);
  }
  return 0;
}

uint64_t __50__VCPCNNPetsDetector_postProcBoxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 flag];
  float v9 = v8;
  [v7 flag];
  if (v9 <= v10)
  {
    [v6 flag];
    float v13 = v12;
    [v7 flag];
    if (v13 >= v14)
    {
      [v6 confidence];
      float v16 = v15;
      [v7 confidence];
      if (v16 <= v17) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = -1;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = -1;
  }

  return v11;
}

- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v42 = a4;
  id v10 = a5;
  id v41 = a6;
  uint64_t v11 = (void *)MEMORY[0x1C186D320]();
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t v14 = Height;
  if ((int)Width <= (int)Height) {
    int v15 = Height;
  }
  else {
    int v15 = Width;
  }
  uint64_t v43 = 0;
  if (v15 >= 417)
  {
    size_t Width = (416 * (int)Width / v15) & 0xFFFFFFFE;
    size_t v14 = (416 * (int)Height / v15) & 0xFFFFFFFE;
  }
  if ((int)v14 >= (int)Width) {
    int v16 = Width;
  }
  else {
    int v16 = v14;
  }
  if (v16 < 224)
  {
    int v17 = 0;
LABEL_13:
    int v19 = 4;
    goto LABEL_14;
  }
  int v17 = [(VCPCNNPetsDetector *)self createModel:v14 srcWidth:Width];
  if (v17) {
    goto LABEL_13;
  }
  float v18 = [(VCPCNNPetsDetector *)self getInputBuffer:v14 srcWidth:Width cnnInputHeight:&v43 cnnInputWidth:(char *)&v43 + 4];
  int v17 = [(VCPCNNPetsDetector *)self createInput:v18 withBuffer:a3 cnnInputHeight:v43 cnnInputWidth:HIDWORD(v43)];
  if (v17) {
    goto LABEL_13;
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v39 = [(VCPCNNPetsDetector *)self generatePetsBoxes:v40 faceBoxes:v22 cancel:v41];
  if (v39)
  {
    int v19 = 1;
  }
  else
  {
    for (unint64_t i = 0; [v40 count] > i; ++i)
    {
      float v24 = [v40 objectAtIndexedSubscript:i];
      *(float *)&double v25 = (float)(HIDWORD(v43) - 1);
      *(float *)&double v26 = (float)(v43 - 1);
      [v24 getCGRectWithClipWidth:v25 height:v26];
      v46[0] = @"petsBounds";
      uint64_t v27 = NSStringFromRect(v48);
      v46[1] = @"petsConfidence";
      v47[0] = v27;
      float v28 = NSNumber;
      [v24 confidence];
      float v29 = objc_msgSend(v28, "numberWithFloat:");
      v47[1] = v29;
      double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      [v42 addObject:v30];
    }
    for (unint64_t j = 0; [v22 count] > j; ++j)
    {
      double v32 = [v22 objectAtIndexedSubscript:j];
      *(float *)&double v33 = (float)(HIDWORD(v43) - 1);
      *(float *)&double v34 = (float)(v43 - 1);
      [v32 getCGRectWithClipWidth:v33 height:v34];
      v44[0] = @"petsBounds";
      v35 = NSStringFromRect(v49);
      v44[1] = @"petsConfidence";
      v45[0] = v35;
      float v36 = NSNumber;
      [v32 confidence];
      uint64_t v37 = objc_msgSend(v36, "numberWithFloat:");
      v45[1] = v37;
      float v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
      [v10 addObject:v38];
    }
    int v19 = 0;
  }

  int v17 = 0;
LABEL_14:
  if ((v19 | 4) == 4) {
    int v20 = v17;
  }
  else {
    int v20 = v39;
  }

  return v20;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end