@interface VCPCNNBlurAnalyzer
+ (VCPCNNBlurAnalyzer)analyzerWithRevision:(unint64_t)a3;
+ (id)analyzer;
- (BOOL)sdof;
- (VCPCNNBlurAnalyzer)init;
- (VCPCNNBlurAnalyzer)initWithRevision:(unint64_t)a3;
- (float)calculateScoreFromNetworkOutput:(float *)a3 outChannel:(int)a4 outHeight:(int)a5 outWidth:(int)a6 textureness:(char *)a7 contrast:(float)a8 imgWidth:(int)a9;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (id).cxx_construct;
- (int)computeCNNBasedSharpness:(__CVBuffer *)a3 sharpnessScore:(float *)a4 textureScore:(float *)a5 contrast:(float)a6 cancel:(id)a7;
- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7;
- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4;
- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(float *)a5 withWidth:(int)a6 andHeight:(int)a7;
- (unint64_t)getRevision;
- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8;
- (void)setSdof:(BOOL)a3;
@end

@implementation VCPCNNBlurAnalyzer

+ (VCPCNNBlurAnalyzer)analyzerWithRevision:(unint64_t)a3
{
  v4 = &OBJC_METACLASS___VCPPhotoAnalyzer;
  {
    v4 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    if (v7)
    {
      +[VCPCNNBlurAnalyzer analyzerWithRevision:]::analyzerClass = objc_opt_class();
      v4 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    }
  }
  v5 = (void *)[objc_alloc((Class)v4[62].vtable) initWithRevision:a3];
  return (VCPCNNBlurAnalyzer *)v5;
}

+ (id)analyzer
{
  return (id)[a1 analyzerWithRevision:1];
}

- (VCPCNNBlurAnalyzer)initWithRevision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VCPCNNBlurAnalyzer;
  result = [(VCPCNNBlurAnalyzer *)&v5 init];
  if (result) {
    result->_revision = a3;
  }
  return result;
}

- (VCPCNNBlurAnalyzer)init
{
  return [(VCPCNNBlurAnalyzer *)self initWithRevision:1];
}

- (unint64_t)getRevision
{
  return self->_revision;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  return -4;
}

- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8
{
  if (a8 >= 1)
  {
    for (int i = 0; i != a8; ++i)
    {
      if (a7 >= 1)
      {
        for (uint64_t j = 0; j != a7; a5[j++] = v8)
        {
          LOBYTE(v8) = a3[j];
          float v8 = (float)LODWORD(v8) / 255.0;
        }
      }
      a3 += a4;
      a5 += a6;
    }
  }
}

- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(float *)a5 withWidth:(int)a6 andHeight:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  CFTypeRef cf = 0;
  int Width = CVPixelBufferGetWidth(a4);
  int Height = CVPixelBufferGetHeight(a4);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (Width == v8 && Height == v7)
  {
    BOOL v16 = (int)v8 == 299 && v8 == v7;
    if (v16 && PixelFormatType == 1278226488)
    {
      CFTypeRef cf = CFRetain(a4);
      v30 = 0;
      CF<opaqueCMSampleBuffer *>::~CF(&v30);
LABEL_15:
      CVPixelBufferRef pixelBuffer = (CVPixelBufferRef)cf;
      CVPixelBufferLockFlags unlockFlags = 1;
      if (cf)
      {
        int v19 = CVPixelBufferLockBaseAddress((CVPixelBufferRef)cf, 1uLL);
        LODWORD(v30) = v19;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
          }
        }
        else
        {
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane((CVPixelBufferRef)cf, 0);
          [(VCPCNNBlurAnalyzer *)self copyBufferFrom:CVPixelBufferGetBaseAddressOfPlane((CVPixelBufferRef)cf, 0) fromStride:BytesPerRowOfPlane toPtr:a5 toStride:(int)v8 toWidth:v8 toHeight:v7];
          int v19 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v30);
          if (pixelBuffer
            && !v30
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
          }
        }
      }
      else
      {
        BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v20) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v20, v21, v22, v23, v24, v25, v26, v27);
        }
        int v19 = -50;
      }
      goto LABEL_22;
    }
  }
  v18 = (CGRect *)MEMORY[0x1E4F1DB28];
  if (a3) {
    v18 = a3;
  }
  int v19 = Scaler::ScaleCropped(&self->_scaler, *v18, a4, (__CVBuffer **)&cf, v8, v7, 875704438);
  if (!v19) {
    goto LABEL_15;
  }
LABEL_22:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v19;
}

- (float)calculateScoreFromNetworkOutput:(float *)a3 outChannel:(int)a4 outHeight:(int)a5 outWidth:(int)a6 textureness:(char *)a7 contrast:(float)a8 imgWidth:(int)a9
{
  unint64_t v12 = 0;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v50[0] = 0.0;
  do
  {
    if (v12 <= 0x1D)
    {
      v13 = &v50[v12];
      v13[1] = (float)(char)(v12
                           - 5 * ((((103 * (char)v12) & 0x8000) != 0) + (((103 * (char)v12) >> 8) >> 1))
                           + 1);
      v13[2] = (float)(char)((v12 | 1)
                           - 5
                           * ((((103 * (char)(v12 | 1)) & 0x8000) != 0)
                            + (((103 * (char)(v12 | 1)) >> 8) >> 1))
                           + 1);
    }
    v12 += 2;
  }
  while (v12 != 30);
  long long v51 = xmmword_1BC2836E0;
  int v52 = 1077936128;
  memset(v49, 0, sizeof(v49));
  if (a5 < 1)
  {
    uint64_t v47 = 0;
    float v17 = 0.0;
    float v16 = 0.0;
  }
  else
  {
    int v14 = 0;
    uint64_t v47 = 0;
    uint64_t v43 = 4 * a9;
    uint64_t v15 = 4 * a6 * a5;
    float v16 = 0.0;
    float v17 = 0.0;
    do
    {
      int v46 = v14;
      if (a6 >= 1)
      {
        uint64_t v18 = 0;
        do
        {
          if (a4 >= 1)
          {
            float v19 = 0.0;
            BOOL v20 = v53;
            uint64_t v21 = a4;
            uint64_t v22 = a3;
            do
            {
              float v23 = expf(*v22);
              *v20++ = v23;
              float v19 = v19 + v23;
              uint64_t v22 = (float *)((char *)v22 + v15);
              --v21;
            }
            while (v21);
            unint64_t v24 = 0;
            int v25 = 0;
            char v26 = 0;
            float v27 = 0.0;
            float v28 = 0.0;
            do
            {
              float v29 = v53[v24] / v19;
              v53[v24] = v29;
              if (v29 > v28)
              {
                v26 |= v24 > 0x1E;
                float v28 = v29;
                int v25 = v24;
              }
              float v27 = v27 + (float)(v50[v24++] * v29);
            }
            while (a4 != v24);
            if (v28 > 0.85 && a7[4 * (int)v18] != 0)
            {
              float v17 = v17 + v27;
              ++HIDWORD(v47);
              ++*((_DWORD *)v49 + v25);
              if ((v26 & 1) == 0)
              {
                float v16 = v16 + v27;
                LODWORD(v47) = v47 + 1;
              }
            }
          }
          ++a3;
          ++v18;
        }
        while (v18 != a6);
      }
      a7 += v43;
      int v14 = v46 + 1;
    }
    while (v46 + 1 != a5);
  }
  float v31 = (float)(int)v47 / (float)SHIDWORD(v47);
  if (self->_sdof && v31 > 0.6)
  {
    int v32 = 0;
    int v33 = 0;
    for (uint64_t i = 4; i != 124; i += 4)
    {
      int v35 = *(_DWORD *)((char *)v49 + i);
      v32 += v35;
      if (v35 > v33) {
        int v33 = *(_DWORD *)((char *)v49 + i);
      }
    }
    if (v32)
    {
      float v36 = (float)((float)v33 / (float)v32) + 0.5;
      if (v36 > 1.0) {
        float v36 = 1.0;
      }
      float v16 = v16 * v36;
    }
  }
  if (v31 < 0.3) {
    int v37 = HIDWORD(v47);
  }
  else {
    int v37 = v47;
  }
  float v38 = 0.0;
  if (v37 >= 40)
  {
    float v39 = v17 + (float)((float)(v17 - v16) * 0.5);
    if (v31 >= 0.3) {
      float v39 = v16;
    }
    float v38 = fmax((float)((float)(1.2 - (float)(v39 / (float)v37)) / 1.2), 0.0);
  }
  BOOL v40 = self->_sdof && v31 < 0.3;
  float result = v38 + (float)((float)(1.0 - v38) * a8);
  if (!v40) {
    return v38;
  }
  return result;
}

- (int)computeCNNBasedSharpness:(__CVBuffer *)a3 sharpnessScore:(float *)a4 textureScore:(float *)a5 contrast:(float)a6 cancel:(id)a7
{
  id v12 = a7;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t v15 = Height;
  if ((int)Width <= (int)Height) {
    int v16 = Height;
  }
  else {
    int v16 = Width;
  }
  uint64_t v31 = 0;
  if (v16 >= 401)
  {
    size_t Width = (400 * (int)Width / v16) & 0xFFFFFFFE;
    size_t v15 = (400 * (int)Height / v16) & 0xFFFFFFFE;
  }
  if ((int)Width < 60 || (int)v15 <= 59)
  {
    int v17 = 0;
    *a4 = 0.5;
  }
  else
  {
    int v17 = [(VCPCNNBlurAnalyzer *)self prepareModelForSourceWidth:Width andSourceHeight:v15];
    if (!v17)
    {
      uint64_t v18 = [(VCPCNNBlurAnalyzer *)self getInputBuffer:v15 srcWidth:Width cnnInputHeight:(char *)&v31 + 4 cnnInputWidth:&v31];
      int v17 = [(VCPCNNBlurAnalyzer *)self scaleRegion:0 ofImage:a3 toData:v18 withWidth:v31 andHeight:HIDWORD(v31)];
      if (!v17)
      {
        uint64_t v20 = v31;
        uint64_t v19 = HIDWORD(v31);
        uint64_t v21 = (unsigned __int8 *)operator new[]((int)v31 * HIDWORD(v31), MEMORY[0x1E4FBA2D0]);
        if (v21)
        {
          uint64_t v22 = v21;
          [(VCPImageAnalyzer *)self calculateTextureness:v18 height:v19 width:v20 sdof:self->_sdof result:v21];
          if ((int)v31 * HIDWORD(v31) < 1)
          {
            double v23 = 0.0;
          }
          else
          {
            int v24 = 0;
            uint64_t v25 = (v31 * HIDWORD(v31));
            char v26 = v22;
            do
            {
              if (*v26++) {
                ++v24;
              }
              --v25;
            }
            while (v25);
            *(float *)&double v23 = (float)v24;
          }
          *a5 = *(float *)&v23 / (float)(v31 * HIDWORD(v31));
          *(float *)&double v23 = a6;
          int v17 = -[VCPCNNBlurAnalyzer computeSharpnessScore:textureness:contrast:imgWidth:cancel:](self, "computeSharpnessScore:textureness:contrast:imgWidth:cancel:", a4, v22, v23);
          MEMORY[0x1C186C790](v22, 0x1000C8077774924);
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              __int16 v30 = 0;
              _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)&v30, 2u);
            }
          }
          int v17 = -108;
        }
      }
    }
  }

  return v17;
}

- (BOOL)sdof
{
  return self->_sdof;
}

- (void)setSdof:(BOOL)a3
{
  self->_sdof = a3;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((_DWORD *)self + 16) = 0;
  return self;
}

@end