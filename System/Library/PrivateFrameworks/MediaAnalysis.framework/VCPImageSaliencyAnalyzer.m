@interface VCPImageSaliencyAnalyzer
+ (VCPImageSaliencyAnalyzer)analyzerWith:(int)a3 prune:(BOOL)a4;
- (VCPImageSaliencyAnalyzer)initWithMaxNumRegions:(int)a3 prune:(BOOL)a4;
- (float)computeScore:(float *)a3 width:(int)a4 height:(int)a5 posX:(int)a6 posY:(int)a7;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (float)outputScaling;
- (id).cxx_construct;
- (id)pruneRegions:(id)a3;
- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChunk:(int)a5;
- (int)generateSalientRegion:(float *)a3 outHeight:(int)a4 outWidth:(int)a5;
- (int)getSalientRegions:(id)a3;
- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4;
- (int)saliencyDetection:(__CVBuffer *)a3 salientRegions:(id)a4 cancel:(id)a5;
- (int)scaleImage:(__CVBuffer *)a3 toData:(float *)a4 withWidth:(int)a5 andHeight:(int)a6;
@end

@implementation VCPImageSaliencyAnalyzer

+ (VCPImageSaliencyAnalyzer)analyzerWith:(int)a3 prune:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  {
    +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = objc_opt_class();
  }
  if (+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::once != -1) {
    dispatch_once(&+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::once, &__block_literal_global_26);
  }
  v6 = (void *)[objc_alloc((Class)+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass) initWithMaxNumRegions:v5 prune:v4];
  return (VCPImageSaliencyAnalyzer *)v6;
}

uint64_t __47__VCPImageSaliencyAnalyzer_analyzerWith_prune___block_invoke()
{
  uint64_t result = +[VCPCNNMetalContext supportGPU];
  if (result)
  {
    +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = objc_opt_class();
    uint64_t result = DeviceHasANE();
    if (result)
    {
      uint64_t result = objc_opt_class();
      +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = result;
    }
  }
  return result;
}

- (VCPImageSaliencyAnalyzer)initWithMaxNumRegions:(int)a3 prune:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VCPImageSaliencyAnalyzer;
  v6 = [(VCPImageSaliencyAnalyzer *)&v12 init];
  if (v6)
  {
    BOOL v7 = +[VCPCNNMetalContext supportGPU];
    if (+[VCPCNNMetalContext supportVectorForward]) {
      int v8 = 4;
    }
    else {
      int v8 = 1;
    }
    if (v7) {
      int v8 = 1;
    }
    v6->_chunk = v8;
    if (a3 >= 5) {
      int v9 = 5;
    }
    else {
      int v9 = a3;
    }
    if (v9 <= 1) {
      int v9 = 1;
    }
    v6->_maxNumRegions = v9;
    v6->_prune = a4;
    v10 = v6;
  }

  return v6;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChunk:(int)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v24) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return -50;
  }
  int v10 = Height;
  CVReturn v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v43 = v11;
  if (!v11
    || (int v12 = v11, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v47 = a3,
        __int16 v48 = 1024,
        int v49 = v12,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v12 = v43) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (a5 == 4)
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        int v16 = 0;
        v17 = a4 + 3;
        v18 = a4 + 2;
        v19 = a4 + 1;
        do
        {
          if (Width >= 1)
          {
            uint64_t v20 = 0;
            do
            {
              LOBYTE(v15) = BaseAddress[(int)v20 + 2];
              *(float *)&unsigned int v21 = (float)LODWORD(v15) / 255.0;
              unint64_t v22 = v20;
              a4[v22] = *(float *)&v21;
              LOBYTE(v21) = BaseAddress[(int)v20 + 1];
              *(float *)&unsigned int v23 = (float)v21 / 255.0;
              v19[v22] = *(float *)&v23;
              LOBYTE(v23) = BaseAddress[(int)v20];
              float v15 = (float)v23 / 255.0;
              v18[v22] = v15;
              v17[v22] = 0.0;
              v20 += 4;
            }
            while (4 * Width != v20);
          }
          a4 += 4 * Width;
          v19 += 4 * Width;
          v18 += 4 * Width;
          BaseAddress += BytesPerRow;
          ++v16;
          v17 += 4 * Width;
        }
        while (v16 != v10);
      }
    }
    else
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        int v34 = 0;
        uint64_t v35 = v10 * (uint64_t)Width;
        v36 = &a4[2 * v35];
        v37 = &a4[3 * v35];
        v38 = &a4[v35];
        uint64_t v39 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (uint64_t i = 0; i != Width; ++i)
            {
              LOBYTE(v33) = BaseAddress[(int)(i * 4) + 2];
              *(float *)&unsigned int v41 = (float)LODWORD(v33) / 255.0;
              a4[i] = *(float *)&v41;
              LOBYTE(v41) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&unsigned int v42 = (float)v41 / 255.0;
              v38[i] = *(float *)&v42;
              LOBYTE(v42) = BaseAddress[(int)(i * 4)];
              float v33 = (float)v42 / 255.0;
              v36[i] = v33;
              v37[i] = 0.0;
            }
          }
          BaseAddress += BytesPerRow;
          ++v34;
          v37 = (float *)((char *)v37 + v39);
          v36 = (float *)((char *)v36 + v39);
          v38 = (float *)((char *)v38 + v39);
          a4 = (float *)((char *)a4 + v39);
        }
        while (v34 != v10);
      }
    }
    int v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
    if (pixelBuffer
      && !v43
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
    }
  }
  return v12;
}

- (int)scaleImage:(__CVBuffer *)a3 toData:(float *)a4 withWidth:(int)a5 andHeight:(int)a6
{
  if (!a4) {
    return -50;
  }
  CFTypeRef cf = 0;
  Scaler::Scale(&self->_scaler, a3, (__CVBuffer **)&cf, *(uint64_t *)&a5, *(uint64_t *)&a6, 1111970369);
  int v9 = v8;
  if (!v8) {
    int v9 = [(VCPImageSaliencyAnalyzer *)self copyImage:cf toData:a4 withChunk:self->_chunk];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (float)computeScore:(float *)a3 width:(int)a4 height:(int)a5 posX:(int)a6 posY:(int)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  memset(v48, 0, sizeof(v48));
  int v44 = a5 - 1;
  if (a5 < 1)
  {
    float v13 = 0.0;
    float v11 = 0.0;
  }
  else
  {
    uint64_t v8 = 0;
    float v9 = (float)(a4 * a4 + a5 * a5);
    uint64_t v10 = a5;
    uint64_t v46 = a4;
    int v45 = -a6;
    float v11 = 0.0;
    int v12 = a3;
    float v13 = 0.0;
    do
    {
      if (a4 >= 1)
      {
        if ((int)v8 - a7 >= 0) {
          unsigned int v14 = v8 - a7;
        }
        else {
          unsigned int v14 = a7 - v8;
        }
        uint64_t v15 = v46;
        int v16 = v12;
        int v17 = v45;
        do
        {
          float v18 = *v16;
          if (v17 >= 0) {
            unsigned int v19 = v17;
          }
          else {
            unsigned int v19 = -v17;
          }
          if (v14 > 2 || v19 >= 3)
          {
            float v20 = sqrtf((float)((v8 - a7) * (v8 - a7) + v17 * v17));
            float v11 = v11
                + (float)((float)((float)(1.0
                                        - expf((float)((float)((float)(v20 + -2.0) * (float)(v20 + -2.0)) * -5.0) / v9))
                                * v18)
                        * v18);
          }
          else
          {
            float v13 = v13 + (float)(v18 * v18);
          }
          ++v17;
          ++v16;
          --v15;
        }
        while (v15);
      }
      ++v8;
      v12 += a4;
    }
    while (v8 != v10);
  }
  if (a7 <= 2) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = a7;
  }
  int v22 = a7 + 2;
  if (v44 < a7 + 2) {
    int v22 = v44;
  }
  if ((int)v21 - 2 <= v22)
  {
    if (a6 <= 2) {
      unsigned int v23 = 2;
    }
    else {
      unsigned int v23 = a6;
    }
    int v24 = v23 - 2;
    int v25 = a6 + 2;
    if (a4 - 1 < a6 + 2) {
      int v25 = a4 - 1;
    }
    uint64_t v26 = v21 - 2;
    int v27 = v22 + 1;
    uint64_t v28 = &a3[v26 * a4 - 2 + v23];
    int v29 = v25 - v23 + 3;
    do
    {
      int v30 = v29;
      uint64_t v31 = v28;
      if (v24 <= v25)
      {
        do
        {
          float v32 = *v31++;
          int v33 = (int)(float)(v32 * 255.0);
          if (v33 >= 255) {
            int v33 = 255;
          }
          ++*((unsigned char *)v48 + (v33 & ~(v33 >> 31)));
          --v30;
        }
        while (v30);
      }
      ++v26;
      v28 += a4;
    }
    while (v27 != v26);
  }
  int v34 = 0;
  float v35 = 0.0;
  unsigned int v36 = 255;
  do
  {
    int v37 = 12 - v34;
    if (12 - v34 >= *((unsigned __int8 *)v48 + v36)) {
      int v37 = *((unsigned __int8 *)v48 + v36);
    }
    float v35 = v35 + (float)(int)(v36 * v36 * v37);
    v34 += v37;
    if (!v36) {
      break;
    }
    --v36;
  }
  while (v34 < 12);
  if (v34 >= 1) {
    float v35 = sqrtf(v35 / (float)v34) / 255.0;
  }
  float v38 = (float)((float)(v13 / (float)((float)(v13 + v11) + 0.001)) + 0.2) * (float)(v35 * 2.5);
  float v39 = 1.0;
  if (v38 < 1.0) {
    float v39 = v38;
  }
  BOOL v40 = v38 > 0.0;
  float result = 0.0;
  if (v40) {
    return v39;
  }
  return result;
}

- (float)outputScaling
{
  return 1.0;
}

- (int)generateSalientRegion:(float *)a3 outHeight:(int)a4 outWidth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  [(VCPImageSaliencyAnalyzer *)self outputScaling];
  if (!a3) {
    return -18;
  }
  float v10 = v9;
  size_t v11 = 4 * (int)v5 * a4;
  if ((int)v5 * a4 < 0) {
    size_t v12 = -1;
  }
  else {
    size_t v12 = 4 * (int)v5 * a4;
  }
  float v13 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  unsigned int v14 = operator new[](v12, MEMORY[0x1E4FBA2D0]);
  uint64_t v15 = (char *)operator new[](v12, v13);
  int v16 = v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    v77 = self;
    uint64_t v79 = v5;
    float v19 = (float)(a4 * a4 + v5 * v5);
    bzero(v14, v11);
    uint64_t v20 = 0;
    uint64_t v21 = v88;
    uint64x2_t v82 = (uint64x2_t)vdupq_n_s64(3uLL);
    int64x2_t v80 = vdupq_n_s64(2uLL);
    do
    {
      uint64_t v22 = 0;
      int v23 = v20 * v20;
      uint64x2_t v24 = (uint64x2_t)xmmword_1BC281320;
      do
      {
        unsigned __int8 v85 = vmovn_s64((int64x2_t)vcgtq_u64(v82, v24)).u8[0];
        int64x2_t v87 = (int64x2_t)v24;
        float v83 = expf((float)((float)(v23 + (v22 + 1) * (v22 + 1)) * -2.0) * 0.25);
        float v25 = expf((float)((float)(v23 + v22 * v22) * -2.0) * 0.25);
        if (v85) {
          *(float *)&v21[v22] = v25;
        }
        if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(3uLL), *(uint64x2_t *)&v87)).i32[1]) {
          *(float *)&v21[v22 + 1] = v83;
        }
        v22 += 2;
        uint64x2_t v24 = (uint64x2_t)vaddq_s64(v87, v80);
      }
      while (v22 != 4);
      ++v20;
      v21 += 3;
    }
    while (v20 != 3);
    if (a4 >= 1)
    {
      uint64_t v26 = 0;
      int v27 = 0;
      uint64_t v28 = (float *)v14;
      do
      {
        if ((int)v79 >= 1)
        {
          uint64_t chunk = self->_chunk;
          int v30 = &a3[(int)chunk * (uint64_t)v27];
          uint64_t v31 = 4 * chunk;
          v27 += v79;
          uint64_t v32 = v79;
          int v33 = v28;
          do
          {
            *v33++ = *v30 / v10;
            int v30 = (float *)((char *)v30 + v31);
            --v32;
          }
          while (v32);
        }
        ++v26;
        v28 += (int)v79;
      }
      while (v26 != a4);
    }
    memcpy(v16, v14, v11);
    if (self->_maxNumRegions >= 1)
    {
      uint64_t v34 = 0;
      int v35 = v79;
      if ((int)v79 >= 0) {
        int v36 = v79;
      }
      else {
        int v36 = v79 + 1;
      }
      int v86 = -(v36 >> 1);
      if (a4 >= 0) {
        int v37 = a4;
      }
      else {
        int v37 = a4 + 1;
      }
      int v81 = -(v37 >> 1);
      float v73 = 5.0 / (float)a4;
      float v74 = 5.0 / (float)(int)v79;
      uint64_t v38 = 4 * (int)v79;
      v75 = v16;
      v76 = v14;
      while (a4 >= 5)
      {
        uint64_t v78 = v34;
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        float v41 = 0.0;
        uint64_t v42 = 2;
        do
        {
          v84 = v16;
          if (v35 >= 5)
          {
            uint64_t v43 = 2;
            do
            {
              float v44 = 0.0;
              uint64_t v45 = -2;
              uint64_t v46 = v16;
              do
              {
                uint64_t v47 = 0;
                if ((int)v45 >= 0) {
                  int v48 = v45;
                }
                else {
                  int v48 = -(int)v45;
                }
                do
                {
                  int v49 = v47 - 2;
                  if ((int)v47 - 2 < 0) {
                    int v49 = 2 - v47;
                  }
                  float v44 = v44
                      + (float)((float)(*(float *)&v46[4 * v47] * *(float *)&v88[3 * v48 + v49])
                              * *(float *)&v46[4 * v47]);
                  ++v47;
                }
                while (v47 != 5);
                ++v45;
                v46 += v38;
              }
              while (v45 != 3);
              float v50 = expf((float)((float)((v81 + v42) * (v81 + v42) + (v86 + v43) * (v86 + v43)) * -2.0) / v19) * v44;
              BOOL v51 = v41 < v50;
              if (v41 >= v50)
              {
                uint64_t v40 = v40;
              }
              else
              {
                float v41 = v50;
                uint64_t v40 = v43;
              }
              if (v51) {
                uint64_t v39 = v42;
              }
              else {
                uint64_t v39 = v39;
              }
              ++v43;
              v16 += 4;
            }
            while (v43 != v79 - 2);
          }
          ++v42;
          int v16 = &v84[v38];
          int v35 = v79;
        }
        while (v42 != a4 - 2);
        if (v41 == 0.0)
        {
          int v18 = 0;
          int v16 = v75;
          unsigned int v14 = v76;
          if (v76) {
            goto LABEL_85;
          }
          goto LABEL_86;
        }
        unsigned int v14 = v76;
        [(VCPImageSaliencyAnalyzer *)v77 computeScore:v76 width:v79 height:a4 posX:v40 posY:v39];
        v77->_score[v78] = v52;
        if (v52 == 0.0)
        {
          int v55 = v39 - 2;
          int v53 = v40 - 2;
        }
        else
        {
          int v53 = v40 - 2;
          float v54 = (float)(v40 - 2) / (float)(int)v79;
          int v55 = v39 - 2;
          float v56 = (float)(v39 - 2) / (float)a4;
          double v57 = v54;
          double v58 = v56;
          if (v54 < 1.0) {
            double v59 = v54;
          }
          else {
            double v59 = 1.0;
          }
          if (v54 <= 0.0) {
            double v60 = 0.0;
          }
          else {
            double v60 = v59;
          }
          if (v58 < 1.0) {
            double v61 = v56;
          }
          else {
            double v61 = 1.0;
          }
          if (v56 <= 0.0) {
            double v62 = 0.0;
          }
          else {
            double v62 = v61;
          }
          double v63 = 1.0 - v57;
          if (v63 > v74) {
            double v63 = v74;
          }
          if (v74 <= 0.0) {
            double v63 = 0.0;
          }
          double v64 = 1.0 - v58;
          if (v64 > v73) {
            double v64 = v73;
          }
          p_x = &v77->_region[v78].origin.x;
          double *p_x = v60;
          p_x[1] = v62;
          if (v73 <= 0.0) {
            double v66 = 0.0;
          }
          else {
            double v66 = v64;
          }
          p_x[2] = v63;
          p_x[3] = v66;
        }
        int v16 = v75;
        int v67 = v39 + 2;
        int v68 = v40 + 2;
        if (v53 > (int)v40 + 2) {
          int v68 = v53;
        }
        size_t v69 = 4 * (v68 - v40 + 2) + 4;
        int v70 = v53 + v55 * v79;
        int v71 = v55 - 1;
        do
        {
          bzero(&v75[4 * v70], v69);
          int v35 = v79;
          v70 += v79;
          ++v71;
        }
        while (v71 < v67);
        uint64_t v34 = v78 + 1;
        if (v78 + 1 >= v77->_maxNumRegions) {
          break;
        }
      }
    }
    int v18 = 0;
    if (!v14) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
  int v18 = -108;
  if (v14) {
LABEL_85:
  }
    MEMORY[0x1C186C790](v14, 0x1000C8052888210);
LABEL_86:
  if (v16) {
    MEMORY[0x1C186C790](v16, 0x1000C8052888210);
  }
  return v18;
}

- (int)getSalientRegions:(id)a3
{
  return -4;
}

- (int)saliencyDetection:(__CVBuffer *)a3 salientRegions:(id)a4 cancel:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 0;
  score = self->_score;
  size_t v12 = (CGPoint *)MEMORY[0x1E4F1DB28];
  do
  {
    float v13 = &self->_region[v10];
    CGSize v14 = (CGSize)v12[1];
    v13->origin = *v12;
    v13->size = v14;
    score[v10++] = 0.0;
  }
  while (v10 != 5);
  uint64_t v15 = (void *)MEMORY[0x1C186D320]();
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t v18 = Height;
  if ((int)Width <= (int)Height) {
    int v19 = Height;
  }
  else {
    int v19 = Width;
  }
  uint64_t v30 = 0;
  if (v19 >= 225)
  {
    size_t Width = (224 * (int)Width / v19) & 0xFFFFFFFE;
    size_t v18 = (224 * (int)Height / v19) & 0xFFFFFFFE;
  }
  if ((int)v18 >= (int)Width) {
    int v20 = Width;
  }
  else {
    int v20 = v18;
  }
  if (v20 < 112) {
    goto LABEL_12;
  }
  int v21 = [(VCPImageSaliencyAnalyzer *)self prepareModelForSourceWidth:Width andSourceHeight:v18];
  if (!v21)
  {
    uint64_t v22 = [(VCPImageSaliencyAnalyzer *)self getInputBuffer:v18 srcWidth:Width cnnInputHeight:&v30 cnnInputWidth:(char *)&v30 + 4];
    int v21 = [(VCPImageSaliencyAnalyzer *)self scaleImage:a3 toData:v22 withWidth:HIDWORD(v30) andHeight:v30];
    if (!v21)
    {
      int v21 = [(VCPImageSaliencyAnalyzer *)self getSalientRegions:v9];
      if (!v21)
      {
        if (self->_maxNumRegions < 1)
        {
LABEL_12:
          int v21 = 0;
          goto LABEL_21;
        }
        uint64_t v23 = 0;
        p_size = &self->_region[0].size;
        do
        {
          if (!CGRectIsEmpty(*(CGRect *)&p_size[-1].width))
          {
            v31[0] = @"salientRegion";
            float v25 = NSStringFromRect(*(NSRect *)&p_size[-1].width);
            v31[1] = @"salientScore";
            v32[0] = v25;
            *(float *)&double v26 = score[v23];
            int v27 = [NSNumber numberWithFloat:v26];
            v32[1] = v27;
            uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
            [v8 addObject:v28];
          }
          int v21 = 0;
          ++v23;
          p_size += 2;
        }
        while (v23 < self->_maxNumRegions);
      }
    }
  }
LABEL_21:

  return v21;
}

- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7
{
  BOOL v8 = a6;
  double height = a5.height;
  double width = a5.width;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v39 = a7;
  if (v8)
  {
    double v16 = v12 / width;
    double v17 = x / width;
  }
  else
  {
    double v16 = v11 / height;
    double v17 = y / height;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v19)
  {
    float v20 = v16;
    float v21 = v17;
    uint64_t v22 = *(void *)v41;
    double v23 = v20;
    double v24 = v21;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v18);
        }
        double v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v27 = [v26 objectForKeyedSubscript:@"salientRegion"];
        if (v27)
        {
          uint64_t v28 = [v26 objectForKeyedSubscript:@"salientScore"];
          BOOL v29 = v28 == 0;

          if (!v29)
          {
            uint64_t v30 = [v26 objectForKeyedSubscript:@"salientRegion"];
            NSRect v48 = NSRectFromString(v30);
            double v31 = v48.origin.x;
            double v32 = v48.origin.y;
            double v33 = v48.size.width;
            double v34 = v48.size.height;

            if (v8)
            {
              double v31 = v24 + v31 * v23;
              double v33 = v33 * v23;
            }
            else
            {
              double v32 = v24 + v32 * v23;
              double v34 = v34 * v23;
            }
            v44[0] = @"salientRegion";
            v49.origin.double x = v31;
            v49.origin.double y = v32;
            v49.size.double width = v33;
            v49.size.double height = v34;
            int v35 = NSStringFromRect(v49);
            v44[1] = @"salientScore";
            v45[0] = v35;
            int v36 = [v26 objectForKeyedSubscript:@"salientScore"];
            v45[1] = v36;
            int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
            [v39 addObject:v37];
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v19);
  }

  return 0;
}

- (id)pruneRegions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v28 = [MEMORY[0x1E4F1CA48] arrayWithArray:v25];
  if (self->_maxNumRegions >= 1)
  {
    uint64_t v29 = 0;
    do
    {
      if (![v28 count]) {
        break;
      }
      float v31 = minConfidences[v29];
      CGFloat v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      rect[0] = *MEMORY[0x1E4F1DB28];
      CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v6 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      memset(&rect[1], 0, 32);
      id v7 = v28;
      uint64_t v8 = [v7 countByEnumeratingWithState:&rect[1] objects:v37 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)rect[3];
        float v30 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)rect[3] != v9) {
              objc_enumerationMutation(v7);
            }
            double v11 = *(void **)(rect[2] + 8 * i);
            double v12 = [v11 objectForKeyedSubscript:@"salientRegion"];
            NSRect v40 = NSRectFromString(v12);
            CGFloat x = v40.origin.x;
            CGFloat y = v40.origin.y;
            CGFloat width = v40.size.width;
            CGFloat height = v40.size.height;

            double v17 = [v11 objectForKeyedSubscript:@"salientScore"];
            [v17 floatValue];
            float v19 = v18;

            *(void *)&v41.origin.CGFloat x = rect[0];
            v41.origin.CGFloat y = v3;
            v41.size.CGFloat width = v4;
            v41.size.CGFloat height = v5;
            if (CGRectIsEmpty(v41))
            {
              if (v19 > v31)
              {
                [v6 addObject:v11];
                float v30 = v19;
                *(CGFloat *)rect = x;
                CGFloat v3 = y;
                CGFloat v4 = width;
                CGFloat v5 = height;
              }
            }
            else if (v19 > 0.3)
            {
              *(void *)&v42.origin.CGFloat x = rect[0];
              v42.origin.CGFloat y = v3;
              v42.size.CGFloat width = v4;
              v42.size.CGFloat height = v5;
              v47.origin.CGFloat x = x;
              v47.origin.CGFloat y = y;
              v47.size.CGFloat width = width;
              v47.size.CGFloat height = height;
              if (CGRectIntersectsRect(v42, v47))
              {
                *(void *)&v43.origin.CGFloat x = rect[0];
                v43.origin.CGFloat y = v3;
                v43.size.CGFloat width = v4;
                v43.size.CGFloat height = v5;
                v48.origin.CGFloat x = x;
                v48.origin.CGFloat y = y;
                v48.size.CGFloat width = width;
                v48.size.CGFloat height = height;
                CGRect v44 = CGRectUnion(v43, v48);
                rect[0] = *(void *)&v44.origin.x;
                CGFloat v3 = v44.origin.y;
                CGFloat v4 = v44.size.width;
                CGFloat v5 = v44.size.height;
                [v6 addObject:v11];
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&rect[1] objects:v37 count:16];
        }
        while (v8);
      }
      else
      {
        float v30 = 0.0;
      }

      *(void *)&v45.origin.CGFloat x = rect[0];
      v45.origin.CGFloat y = v3;
      v45.size.CGFloat width = v4;
      v45.size.CGFloat height = v5;
      if (!CGRectIsEmpty(v45))
      {
        v35[0] = @"salientScore";
        *(float *)&double v20 = v30;
        float v21 = [NSNumber numberWithFloat:v20];
        v35[1] = @"salientRegion";
        v36[0] = v21;
        *(void *)&v46.origin.CGFloat x = rect[0];
        v46.origin.CGFloat y = v3;
        v46.size.CGFloat width = v4;
        v46.size.CGFloat height = v5;
        uint64_t v22 = NSStringFromRect(v46);
        v36[1] = v22;
        double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
        [v26 addObject:v23];
      }
      [v7 removeObjectsInArray:v6];

      ++v29;
    }
    while (v29 < self->_maxNumRegions);
  }

  return v26;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v33 = a6;
  uint64_t v8 = 0;
  *a5 = 0;
  uint64_t v9 = (CGPoint *)MEMORY[0x1E4F1DB28];
  do
  {
    uint64_t v10 = &self->_region[v8];
    CGSize v11 = (CGSize)v9[1];
    v10->origin = *v9;
    v10->size = v11;
    self->_score[v8++] = 0.0;
  }
  while (v8 != 5);
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  long long v34 = [MEMORY[0x1E4F1CA48] array];
  if (Height >= Width) {
    int v14 = Width;
  }
  else {
    int v14 = Height;
  }
  if (Width <= Height) {
    int v15 = Height;
  }
  else {
    int v15 = Width;
  }
  if ((float)((float)v15 / (float)v14) <= 2.0) {
    int v16 = [(VCPImageSaliencyAnalyzer *)self saliencyDetection:a3 salientRegions:v34 cancel:v33];
  }
  else {
    int v16 = [(VCPImageAnalyzer *)self analyzePixelBufferInTiles:a3 results:v34 cancel:v33];
  }
  int v17 = v16;
  if (!v16)
  {
    [v34 sortUsingComparator:&__block_literal_global_205];
    id v18 = v34;
    float v19 = v18;
    if (self->_prune)
    {
      uint64_t v20 = [(VCPImageSaliencyAnalyzer *)self pruneRegions:v18];

      id obj = (id)v20;
    }
    else
    {
      id obj = v18;
    }
    uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obja = obj;
    uint64_t v21 = [obja countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v21)
    {
      int v31 = 0;
      uint64_t v37 = *(void *)v41;
LABEL_18:
      uint64_t v22 = 0;
      int v23 = v31;
      v31 += v21;
      while (1)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obja);
        }
        if (v23 + (int)v22 >= self->_maxNumRegions) {
          break;
        }
        double v24 = *(void **)(*((void *)&v40 + 1) + 8 * v22);
        id v25 = [v24 objectForKeyedSubscript:@"salientRegion"];
        NSRect v52 = NSRectFromString(v25);
        v39.a = 1.0;
        v39.b = 0.0;
        v39.c = 0.0;
        *(_OWORD *)&v39.d = xmmword_1BC280F00;
        v39.tCGFloat y = 1.0;
        CGRect v53 = CGRectApplyAffineTransform(v52, &v39);
        CGRect v48 = @"attributes";
        v46[0] = @"saliencyBounds";
        id v26 = NSStringFromRect(v53);
        v46[1] = @"saliencyConfidence";
        v47[0] = v26;
        int v27 = [v24 objectForKeyedSubscript:@"salientScore"];
        v47[1] = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
        NSRect v49 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [v38 addObject:v29];

        if (v21 == ++v22)
        {
          uint64_t v21 = [obja countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v21) {
            goto LABEL_18;
          }
          break;
        }
      }
    }

    if ([v38 count])
    {
      CGRect v44 = @"SaliencyResults";
      CGRect v45 = v38;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    }

    int v17 = 0;
  }

  return v17;
}

uint64_t __68__VCPImageSaliencyAnalyzer_analyzePixelBuffer_flags_results_cancel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  CGFloat v5 = [a2 objectForKeyedSubscript:@"salientScore"];
  [v5 floatValue];
  float v7 = v6;

  uint64_t v8 = [v4 objectForKeyedSubscript:@"salientScore"];
  [v8 floatValue];
  float v10 = v9;

  if (v7 > v10) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v7 < v10;
  }

  return v11;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 31) = 0;
  *((_DWORD *)self + 64) = 0;
  return self;
}

@end