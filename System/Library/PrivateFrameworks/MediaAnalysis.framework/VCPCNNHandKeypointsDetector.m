@interface VCPCNNHandKeypointsDetector
+ (id)detector:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7;
- (id).cxx_construct;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7;
- (int)cvtHeatmaps2Keypoints:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 inHeight:(int)a6 inWidth:(int)a7 outChannel:(int)a8 keypoints:(CGPoint *)a9 keypointConfidence:(float *)a10 offset:(float)a11;
- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6;
- (int)handKeypointsDetection:(__CVBuffer *)a3 box:(id)a4 keypoints:(CGPoint)a5[21] keypointConfidence:(float)a6[21] handHoldsObjectConfidence:(float *)a7;
@end

@implementation VCPCNNHandKeypointsDetector

+ (id)detector:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a5;
  id v12 = a7;
  id v13 = [[VCPCNNHandKeypointsDetectorEspresso alloc] init:v10 sharedModel:v9 modelName:v11 enableHandObject:v8 options:v12];

  return v13;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  BOOL v9 = VCPSignPostLog();
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "copyImageToBGRHandKeypointCallFromSPI", "", buf, 2u);
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
    int v13 = Height;
    CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    *(_DWORD *)buf = v14;
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
      bzero(a4, 3 * 4 * Width * v13);
      if (v13 >= 1)
      {
        int v27 = 0;
        v28 = &a4[2 * v13 * Width];
        v29 = &a4[v13 * Width];
        uint64_t v30 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (uint64_t i = 0; i != Width; ++i)
            {
              LOBYTE(v26) = BaseAddress[(int)(i * 4)];
              *(float *)&unsigned int v32 = (float)((float)LODWORD(v26) / self->_std) - self->_mean;
              a4[i] = *(float *)&v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&unsigned int v33 = (float)((float)v32 / self->_std) - self->_mean;
              v29[i] = *(float *)&v33;
              LOBYTE(v33) = BaseAddress[(int)(i * 4) + 2];
              float v26 = (float)((float)v33 / self->_std) - self->_mean;
              v28[i] = v26;
            }
          }
          BaseAddress += BytesPerRow;
          ++v27;
          v28 = (float *)((char *)v28 + v30);
          v29 = (float *)((char *)v29 + v30);
          a4 = (float *)((char *)a4 + v30);
        }
        while (v27 != v13);
      }
      int v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v15)
      {
        v34 = VCPSignPostLog();
        v35 = v34;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_WORD *)v37 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v8, "copyImageToBGRHandKeypointCallFromSPI", "", v37, 2u);
        }

        int v15 = 0;
      }
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    int v15 = -50;
    *(_DWORD *)buf = -50;
  }
  if (pixelBuffer
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
  }
  return v15;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  int v13 = v12;
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
    float v25 = v24;
    float v26 = VCPSignPostLog();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    v28 = VCPSignPostLog();
    v29 = v28;
    double v30 = v15;
    double v31 = v17;
    double v32 = (float)(v19 - v21);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "preProcessingHandKeypointCallFromSPI", "", buf, 2u);
    }

    v40.origin.x = v30;
    v40.origin.y = v31;
    v40.size.width = v32;
    v40.size.height = (float)(v23 - v25);
    int v33 = Scaler::ScaleCropped(&self->_scaler, v40, a4, (__CVBuffer **)&cf, v7, v8, 1111970369);
    if (!v33)
    {
      v34 = VCPSignPostLog();
      v35 = v34;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v37 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v27, "preProcessingHandKeypointCallFromSPI", "", v37, 2u);
      }

      int v33 = [(VCPCNNHandKeypointsDetector *)self copyImage:cf toData:a3];
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    int v33 = -108;
  }

  return v33;
}

- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7
{
  return 0;
}

- (int)cvtHeatmaps2Keypoints:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 inHeight:(int)a6 inWidth:(int)a7 outChannel:(int)a8 keypoints:(CGPoint *)a9 keypointConfidence:(float *)a10 offset:(float)a11
{
  float v18 = VCPSignPostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  float v20 = VCPSignPostLog();
  float v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "postProcessingHandKeypointCallFromSPI", "", buf, 2u);
  }

  int result = -50;
  if (a4 && a5)
  {
    if (a8 >= 1)
    {
      int v23 = 0;
      uint64_t v24 = 0;
      do
      {
        if (a4 < 1)
        {
          float v30 = 0.0;
          float v27 = 1.1755e-38;
          float v29 = 0.0;
          float v26 = 0.0;
        }
        else
        {
          int v25 = 0;
          float v26 = 0.0;
          float v27 = 1.1755e-38;
          int v28 = v23;
          float v29 = 0.0;
          float v30 = 0.0;
          do
          {
            if (a5 >= 1)
            {
              uint64_t v31 = 0;
              do
              {
                float v32 = a3[v28 + (int)v31];
                if (v32 > 0.1)
                {
                  if (v26 <= v32) {
                    float v26 = a3[v28 + (int)v31];
                  }
                  float v30 = v30 + (float)((float)(int)v31 * v32);
                  float v29 = v29 + (float)((float)v25 * v32);
                  float v27 = v27 + v32;
                }
                ++v31;
              }
              while (a5 != v31);
            }
            ++v25;
            v28 += a5;
          }
          while (v25 != a4);
        }
        int v33 = &a9[v24];
        v33->x = (float)((float)((float)(v30 / v27) + a11) * (float)(a6 / a4));
        v33->y = (float)((float)((float)(v29 / v27) + a11) * (float)(a7 / a5));
        a10[v24++] = v26;
        v23 += a5 * a4;
      }
      while (v24 != a8);
    }
    v34 = VCPSignPostLog();
    v35 = v34;
    if (v19 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
    {
      *(_WORD *)v36 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v19, "postProcessingHandKeypointCallFromSPI", "", v36, 2u);
    }

    return 0;
  }
  return result;
}

- (int)handKeypointsDetection:(__CVBuffer *)a3 box:(id)a4 keypoints:(CGPoint)a5[21] keypointConfidence:(float)a6[21] handHoldsObjectConfidence:(float *)a7
{
  id v12 = a4;
  int v13 = (void *)MEMORY[0x1C186D320]();
  *(void *)&self->_std = 1065353216;
  size_t Width = CVPixelBufferGetWidth(a3);
  uint64_t v22 = 0;
  int v21 = 0;
  float v15 = [(VCPCNNHandKeypointsDetector *)self getInputBuffer:CVPixelBufferGetHeight(a3) srcWidth:Width cnnInputHeight:&v22 cnnInputWidth:(char *)&v22 + 4 offset:&v21];
  int v16 = [(VCPCNNHandKeypointsDetector *)self createInput:v15 withBuffer:a3 cnnInputHeight:v22 cnnInputWidth:HIDWORD(v22) box:v12];
  if (v16)
  {
    int v18 = 4;
  }
  else
  {
    LODWORD(v17) = v21;
    LODWORD(a7) = [(VCPCNNHandKeypointsDetector *)self generateHandKeypoints:a5 keypointConfidence:a6 offset:a7 handHoldsObjectConfidence:v17];
    int v18 = a7 != 0;
  }
  if ((v18 | 4) == 4) {
    int v19 = v16;
  }
  else {
    int v19 = (int)a7;
  }

  return v19;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  return self;
}

@end