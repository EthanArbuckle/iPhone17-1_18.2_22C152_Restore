@interface VCPImageBlurAnalyzer
- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4;
- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4 revision:(unint64_t)a5;
- (float)estimateDistance:(id)a3 prevHomography:(id)a4;
- (float)getFaceScoreFromOutput:(id)a3 ratio:(float)a4;
- (float)sharpness;
- (float)textureScore;
- (id).cxx_construct;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 withPreAnalysisScore:(float)a5 results:(id *)a6 cancel:(id)a7;
- (int)computeCNNFaceSharpness:(__CVBuffer *)a3 result:(float *)a4 cancel:(id)a5;
- (int)computeGyroSharpness:(float *)a3;
- (int)computeLocalSharpness:(__CVBuffer *)a3;
- (int)computeSharpnessScore:(float *)a3 forFacesInImage:(__CVBuffer *)a4;
- (int)prepareFaceBlurModel:(BOOL)a3;
- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(id)a5 withWidth:(int)a6 andHeight:(int)a7;
- (void)setFaceResults:(id)a3;
- (void)setGyroSharpnessParam:(id)a3 homographyResults:(id)a4 livePhotoStillDisplayTime:(float)a5 imageExposureTime:(float)a6;
- (void)spatialPooling;
@end

@implementation VCPImageBlurAnalyzer

- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4 revision:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VCPImageBlurAnalyzer;
  v9 = [(VCPImageBlurAnalyzer *)&v20 init];
  if (!v9) {
    goto LABEL_6;
  }
  if (v8)
  {
    uint64_t v10 = [v8 objectForKey:@"FaceResults"];
    faces = v9->_faces;
    v9->_faces = (NSArray *)v10;
  }
  v9->_sdof = v6;
  v9->_contrast = 0.0;
  v9->_useGPU = +[VCPCNNMetalContext supportGPU];
  uint64_t v12 = +[VCPCNNBlurAnalyzer analyzerWithRevision:a5];
  blurAnalyzer = v9->_blurAnalyzer;
  v9->_blurAnalyzer = (VCPCNNBlurAnalyzer *)v12;

  v14 = v9->_blurAnalyzer;
  if (v14)
  {
    [(VCPCNNBlurAnalyzer *)v14 setSdof:v6];
    v9->_livePhotoStillDisplayTime = -1.0;
    v9->_imageExposureTime = -1.0;
    framePTSResults = v9->_framePTSResults;
    v9->_framePTSResults = 0;

    homographyResults = v9->_homographyResults;
    v9->_homographyResults = 0;

    v17 = v9;
  }
  else
  {
LABEL_6:
    v17 = 0;
  }
  v18 = v17;

  return v18;
}

- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4
{
  return [(VCPImageBlurAnalyzer *)self initWithFaceResults:a3 sdof:a4 revision:1];
}

- (void)setGyroSharpnessParam:(id)a3 homographyResults:(id)a4 livePhotoStillDisplayTime:(float)a5 imageExposureTime:(float)a6
{
  uint64_t v10 = (NSArray *)a3;
  v11 = (NSArray *)a4;
  self->_livePhotoStillDisplayTime = a5;
  self->_imageExposureTime = a6;
  framePTSResults = self->_framePTSResults;
  self->_framePTSResults = v10;
  v14 = v10;

  homographyResults = self->_homographyResults;
  self->_homographyResults = v11;
}

- (void)setFaceResults:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 count];
  if (v4) {
    v4 = (NSArray *)v6;
  }
  faces = self->_faces;
  self->_faces = v4;
}

- (float)getFaceScoreFromOutput:(id)a3 ratio:(float)a4
{
  id v5 = a3;
  uint64_t v6 = 0;
  float v7 = -1.0;
  int v8 = -1;
  while (1)
  {
    v9 = [v5 size];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];
    int v11 = [v10 intValue];

    if (v6 >= v11) {
      break;
    }
    if (*(float *)([v5 data] + 4 * v6) > v7)
    {
      float v7 = *(float *)([v5 data] + 4 * v6);
      int v8 = v6;
    }
    ++v6;
  }
  if (v8) {
    float v12 = a4 * 0.3;
  }
  else {
    float v12 = *(float *)[v5 data];
  }

  return v12;
}

- (int)computeCNNFaceSharpness:(__CVBuffer *)a3 result:(float *)a4 cancel:(id)a5
{
  v61 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v74 = (uint64_t (**)(void))a5;
  float v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  uint64_t v8 = [v7 resourceURL];

  v62 = (void *)v8;
  v64 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_faceblur.dat" relativeToURL:v8];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  faceInput = self->_faceInput;
  self->_faceInput = 0;

  faceModel = self->_faceModel;
  self->_faceModel = 0;

  CVReturn v80 = 0;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    v68 = a3;
    CVReturn v80 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v63 = v80;
    if (v80)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = pixelBuffer;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
        int v63 = v80;
      }
    }
    else
    {
      char v67 = 0;
      uint64_t v73 = 0;
      int v63 = 0;
      double v12 = (double)Width;
      double v13 = (double)Height;
      float v14 = (float)Width;
      float v15 = (float)Height;
      float v16 = 0.0;
      char v17 = 1;
      float v18 = 0.0;
      while (1)
      {
        char v65 = v17;
        context = (void *)MEMORY[0x1C186D320]();
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v19 = self->_faces;
        uint64_t v71 = [(NSArray *)v19 countByEnumeratingWithState:&v76 objects:v85 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v77;
          obj = (VCPCNNModel *)v19;
LABEL_8:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v77 != v72) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v76 + 1) + 8 * v20);
            if (v74)
            {
              if (v74[2]()) {
                break;
              }
            }
            v22 = objc_msgSend(v21, "objectForKey:", @"attributes", v61);
            v23 = [v22 objectForKey:@"faceBounds"];
            NSRect v87 = NSRectFromString(v23);
            v75.b = 0.0;
            v75.c = 0.0;
            v75.a = 1.0;
            *(_OWORD *)&v75.d = xmmword_1BC280F00;
            v75.ty = 1.0;
            CGRect v88 = CGRectApplyAffineTransform(v87, &v75);
            int v24 = (int)(v88.origin.x * v12);
            if (v24 >= Width) {
              int v25 = Width;
            }
            else {
              int v25 = (int)(v88.origin.x * v12);
            }
            if (v24 <= 0) {
              int v26 = 0;
            }
            else {
              int v26 = v25;
            }
            int v27 = (int)(v88.origin.y * v13);
            if (v27 >= Height) {
              int v28 = Height;
            }
            else {
              int v28 = (int)(v88.origin.y * v13);
            }
            if (v27 <= 0) {
              int v29 = 0;
            }
            else {
              int v29 = v28;
            }
            if (Width - v26 >= (int)(v88.size.width * v12)) {
              int v30 = (int)(v88.size.width * v12);
            }
            else {
              int v30 = Width - v26;
            }
            if (Height - v29 >= (int)(v88.size.height * v13)) {
              int v31 = (int)(v88.size.height * v13);
            }
            else {
              int v31 = Height - v29;
            }
            if (v30 >= 60) {
              unsigned int v32 = 60;
            }
            else {
              unsigned int v32 = 0;
            }
            if (v30 >= 172) {
              uint64_t v33 = 172;
            }
            else {
              uint64_t v33 = v32;
            }
            *(double *)buf = (float)((float)v26 / v14);
            *(double *)&buf[8] = (float)((float)v29 / v15);
            *(double *)&buf[16] = (float)((float)v30 / v14);
            double v84 = (float)((float)v31 / v15);
            if (v33 == -[VCPImageBlurAnalyzer computeCNNFaceSharpness:result:cancel:]::kNetworkInputRes[v73])
            {
              if (!self->_faceModel)
              {
                int v34 = [(VCPImageBlurAnalyzer *)self prepareFaceBlurModel:v67 & 1];
                if (v34) {
                  goto LABEL_54;
                }
              }
              v35 = self->_faceInput;
              if (!v35)
              {
                v36 = [(VCPCNNModel *)self->_faceModel getGPUContext];
                v37 = +[VCPCNNData cnnDataWithPlane:1 height:v33 width:v33 context:v36];
                v38 = self->_faceInput;
                self->_faceInput = v37;

                v39 = self->_faceInput;
                if (!v39)
                {
                  int v34 = -50;
LABEL_54:

                  char v50 = 0;
                  int v63 = v34;
LABEL_55:
                  v49 = obj;
                  goto LABEL_56;
                }
                int v34 = [(VCPCNNData *)v39 allocBuffers:1];
                if (v34) {
                  goto LABEL_54;
                }
                v40 = self->_faceModel;
                v41 = [(VCPCNNData *)self->_faceInput size];
                int v34 = [(VCPCNNModel *)v40 prepareNetworkFromURL:v64 withInputSize:v41];

                if (v34) {
                  goto LABEL_54;
                }
                v35 = self->_faceInput;
              }
              int v34 = [(VCPImageBlurAnalyzer *)self scaleRegion:buf ofImage:v68 toData:v35 withWidth:v33 andHeight:v33];
              if (v34) {
                goto LABEL_54;
              }
              int v34 = [(VCPCNNModel *)self->_faceModel forward:self->_faceInput];
              if (v34) {
                goto LABEL_54;
              }
              v42 = [(VCPCNNModel *)self->_faceModel output];
              int v34 = [v42 softmax];

              if (v34) {
                goto LABEL_54;
              }
              v43 = [(VCPCNNModel *)self->_faceModel output];
              *(float *)&double v44 = (float)(int)v33 / (float)v30;
              [(VCPImageBlurAnalyzer *)self getFaceScoreFromOutput:v43 ratio:v44];
              float v46 = v45;

              float v47 = (float)(v30 * v31);
              float v16 = v16 + (float)(v46 * v47);
              float v18 = v18 + v47;
            }

            if (v71 == ++v20)
            {
              v19 = (NSArray *)obj;
              uint64_t v71 = [(VCPCNNModel *)obj countByEnumeratingWithState:&v76 objects:v85 count:16];
              if (v71) {
                goto LABEL_8;
              }
              goto LABEL_51;
            }
          }
          char v50 = 0;
          int v63 = -128;
          goto LABEL_55;
        }
LABEL_51:

        v48 = self->_faceInput;
        self->_faceInput = 0;

        v49 = self->_faceModel;
        self->_faceModel = 0;
        char v50 = 1;
LABEL_56:

        if ((v50 & 1) == 0) {
          break;
        }
        char v17 = 0;
        char v67 = 1;
        uint64_t v73 = 1;
        if ((v65 & 1) == 0)
        {
          int v63 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v80);
          if (!v63)
          {
            int v63 = 0;
            float v51 = v16 / v18;
            if (v18 == 0.0) {
              float v51 = 0.5;
            }
            float *v61 = v51;
          }
          break;
        }
      }
    }
  }
  else
  {
    BOOL v52 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v52) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v52, v53, v54, v55, v56, v57, v58, v59);
    }
    int v63 = -50;
    CVReturn v80 = -50;
  }
  if (pixelBuffer
    && !v80
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
  }

  return v63;
}

- (int)computeSharpnessScore:(float *)a3 forFacesInImage:(__CVBuffer *)a4
{
  float v14 = a3;
  float v15 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_faces;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v9), "objectForKey:", @"attributes", v14, v15, (void)v16);
        int v11 = [v10 objectForKey:@"faceBounds"];
        [v5 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  int v12 = [(VCPBlurAnalyzer *)self computeSharpnessScore:v14 forObjects:v5 inImage:v15];
  return v12;
}

- (void)spatialPooling
{
  int v2 = 0;
  v38[2] = *MEMORY[0x1E4F143B8];
  v38[0] = 0;
  v38[1] = 0;
  float v3 = 0.0;
  float v4 = 0.0;
  float v5 = 0.0;
  do
  {
    uint64_t v6 = 0;
    int v7 = 0;
    int v8 = 0;
    float v9 = 1.0;
    float v10 = 0.0;
    do
    {
      int v11 = *((unsigned __int8 *)v38 + v6);
      if ((!v2 || v11 == 1) && self->_sharpnessBlocks[v6] >= v10)
      {
        int v8 = v6;
        float v10 = self->_sharpnessBlocks[v6];
      }
      if (v11 != 3 && self->_sharpnessBlocks[v6] <= v9)
      {
        int v7 = v6;
        float v9 = self->_sharpnessBlocks[v6];
      }
      ++v6;
    }
    while (v6 != 16);
    *((unsigned char *)v38 + v8) = 2;
    *((unsigned char *)v38 + v7) = 3;
    if (v4 < v10) {
      float v4 = v10;
    }
    int v12 = v8 / 4;
    if (v8 / 4 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v12 >= 2) {
      int v14 = 2;
    }
    else {
      int v14 = v8 / 4;
    }
    if ((int)v13 - 1 <= v14 + 1)
    {
      int v15 = v8 % 4;
      if (v8 % 4 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v15;
      }
      if (v15 >= 2) {
        int v17 = 2;
      }
      else {
        int v17 = v15;
      }
      uint64_t v18 = v13 - 1;
      int v19 = 4 * v13 - 4;
      do
      {
        if ((int)v16 - 1 <= v17 + 1)
        {
          uint64_t v20 = &v37 + v19;
          uint64_t v21 = v16;
          do
          {
            unsigned int v22 = v20[v21];
            if (v22 <= 1) {
              LOBYTE(v22) = 1;
            }
            v20[v21] = v22;
            uint64_t v23 = v21++ - 1;
          }
          while (v23 <= v17);
        }
        v19 += 4;
        BOOL v24 = v18++ <= v14;
      }
      while (v24);
    }
    float v3 = v3 + v10;
    float v5 = v5 + v9;
    ++v2;
  }
  while (v2 != 4);
  float v25 = v5 * 0.25;
  if ((float)(v5 * 0.25) < 0.05)
  {
    if (self->_sdof)
    {
      float v26 = (float)(v4 - v25) + -0.4;
      float v27 = 0.2;
    }
    else
    {
      float v26 = (float)((float)(v3 * 0.25) - v25) + -0.4;
      float v27 = 0.1;
    }
    if (v26 < v27) {
      float v27 = v26;
    }
    BOOL v24 = v26 > 0.0;
    float v28 = 0.0;
    if (v24) {
      float v28 = v27;
    }
    self->_contrast = v28;
  }
  uint64_t v29 = 0;
  float sharpness = self->_sharpness;
  float v31 = 0.0;
  do
  {
    if (*((unsigned char *)v38 + v29) == 2) {
      float v32 = 1.0;
    }
    else {
      float v32 = 0.05;
    }
    float sharpness = sharpness + (float)(v32 * self->_sharpnessBlocks[v29]);
    self->_float sharpness = sharpness;
    float v31 = v31 + v32;
    ++v29;
  }
  while (v29 != 16);
  float v33 = sharpness / v31;
  self->_float sharpness = v33;
  float v34 = v33 + self->_contrast;
  float v35 = v34 * 100.0;
  if (v34 >= 1.0) {
    float v35 = 100.0;
  }
  BOOL v24 = v34 > 0.0;
  float v36 = 0.0;
  if (v24) {
    float v36 = v35;
  }
  self->_float sharpness = roundf(v36) / 100.0;
}

- (int)computeLocalSharpness:(__CVBuffer *)a3
{
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v5 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVReturn v24 = v5;
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPImageBlurAnalyzer computeLocalSharpness:]();
      }
    }
    else
    {
      int Width = CVPixelBufferGetWidth(a3);
      int Height = CVPixelBufferGetHeight(a3);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      uint64_t v20 = 0;
      *(_OWORD *)self->_sharpnessBlocks = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[4] = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[8] = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[12] = 0u;
      uint64_t v21 = (Width / 4);
      uint64_t v22 = (Height / 4);
      do
      {
        [(VCPBlurAnalyzer *)self computeRegionSharpness:&BaseAddressOfPlane[BytesPerRowOfPlane * (int)((v20 >> 2) * v22) + (int)((v20 & 3) * v21)] width:v21 height:v22 stride:BytesPerRowOfPlane];
        self->_sharpnessBlocks[v20++] = v23;
      }
      while (v20 != 16);
      int v6 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v24);
      if (pixelBuffer
        && !v24
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return -50;
  }
  return v6;
}

- (int)prepareFaceBlurModel:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 2;
  }
  if (!self->_useGPU) {
    return -50;
  }
  CVReturn v5 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:self->_useGPU];
  faceModel = self->_faceModel;
  self->_faceModel = v5;

  if (!self->_faceModel) {
    return -108;
  }
  BOOL v7 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:20 chunk:1 reLU:1 padding:0];
  int v8 = [(VCPCNNModel *)self->_faceModel add:v7];
  if (!v8)
  {
    uint64_t v9 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:1];
    int v8 = [(VCPCNNModel *)self->_faceModel add:v9];
    if (!v8)
    {
      uint64_t v10 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:32 chunk:1 reLU:1 padding:0];
      int v8 = [(VCPCNNModel *)self->_faceModel add:v10];
      if (!v8)
      {
        uint64_t v18 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:v3 poolY:v3 chunk:1];
        int v8 = [(VCPCNNModel *)self->_faceModel add:v18];
        if (!v8)
        {
          uint64_t v11 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:64 chunk:1 reLU:1 padding:0];
          int v8 = [(VCPCNNModel *)self->_faceModel add:v11];
          if (!v8)
          {
            uint64_t v12 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:v3 poolY:v3 chunk:1];
            int v8 = [(VCPCNNModel *)self->_faceModel add:v12];
            if (!v8)
            {
              if (self->_useGPU
                || (v16 = [[VCPCNNFlattenBlock alloc] initWithParameters:1], int v8 = [(VCPCNNModel *)self->_faceModel add:v16], v16, !v8))
              {
                uint64_t v13 = v11;
                uint64_t v14 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:256 NeuronType:1];
                int v8 = [(VCPCNNModel *)self->_faceModel add:v14];
                if (!v8)
                {
                  int v15 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:26 NeuronType:0];
                  int v8 = [(VCPCNNModel *)self->_faceModel add:v15];
                }
                uint64_t v11 = v13;
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(id)a5 withWidth:(int)a6 andHeight:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a5;
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v13 = (CGRect *)MEMORY[0x1E4F1DB28];
  if (a3) {
    uint64_t v13 = a3;
  }
  int v14 = Scaler::ScaleCropped(&self->_scaler, *v13, a4, &pixelBuffer, v8, v7, 875704438);
  if (!v14)
  {
    CVPixelBufferRef v33 = pixelBuffer;
    CVPixelBufferLockFlags unlockFlags = 1;
    if (pixelBuffer)
    {
      int v14 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      int v32 = v14;
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[VCPImageBlurAnalyzer computeLocalSharpness:]();
        }
      }
      else
      {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
        int Width = CVPixelBufferGetWidth(pixelBuffer);
        int Height = CVPixelBufferGetHeight(pixelBuffer);
        uint64_t v28 = [v12 data];
        if (Height >= 1)
        {
          for (int i = 0; i != Height; ++i)
          {
            if (Width >= 1)
            {
              for (uint64_t j = 0; j != Width; *(float *)(v28 + 4 * j++) = v29)
              {
                LOBYTE(v29) = BaseAddressOfPlane[j];
                float v29 = (float)LODWORD(v29) / 255.0;
              }
            }
            BaseAddressOfPlane += BytesPerRowOfPlane;
            v28 += 4 * Width;
          }
        }
        int v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v32);
        if (v33
          && !v32
          && CVPixelBufferUnlockBaseAddress(v33, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
        }
      }
    }
    else
    {
      BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v16) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
      int v14 = -50;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v14;
}

- (int)computeGyroSharpness:(float *)a3
{
  memset(&v46, 0, sizeof(v46));
  CFDictionaryRef v5 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:0];
  CMTimeMakeFromDictionary(&v46, v5);

  uint64_t v6 = -1;
  if ([(NSArray *)self->_framePTSResults count] >= 2)
  {
    unint64_t v7 = 1;
    float v8 = 10000.0;
    do
    {
      memset(&v45, 0, sizeof(v45));
      CFDictionaryRef v9 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:v7];
      CMTimeMakeFromDictionary(&v45, v9);

      CMTime lhs = v45;
      CMTime rhs = v46;
      CMTimeSubtract(&time, &lhs, &rhs);
      float v10 = CMTimeGetSeconds(&time) - self->_livePhotoStillDisplayTime;
      float v11 = fabsf(v10);
      if (v8 > v11)
      {
        float v8 = v11;
        uint64_t v6 = v7;
      }
      ++v7;
    }
    while (v7 < [(NSArray *)self->_framePTSResults count]);
  }
  CFDictionaryRef v12 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:v6];
  CMTimeMakeFromDictionary(&v45, v12);
  CMTime lhs = v45;
  CMTime rhs = v46;
  CMTimeSubtract(&v43, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&v43);

  float imageExposureTime = self->_imageExposureTime;
  CFDictionaryRef v15 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:1];
  CMTimeMakeFromDictionary(&v45, v15);
  CMTime lhs = v45;
  CMTime rhs = v46;
  CMTimeSubtract(&v42, &lhs, &rhs);
  float v16 = Seconds;
  float v17 = imageExposureTime / CMTimeGetSeconds(&v42);

  float v18 = v17;
  if (v6 >= 2)
  {
    CFDictionaryRef v19 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:v6 - 1];
    CMTimeMakeFromDictionary(&v45, v19);
    CMTime lhs = v45;
    CMTime rhs = v46;
    CMTimeSubtract(&v41, &lhs, &rhs);
    float v20 = CMTimeGetSeconds(&v41);

    float v18 = self->_imageExposureTime / (float)(v16 - v20);
  }
  if (v6 + 1 < [(NSArray *)self->_framePTSResults count])
  {
    CFDictionaryRef v21 = [(NSArray *)self->_framePTSResults objectAtIndexedSubscript:v6 + 1];
    CMTimeMakeFromDictionary(&v45, v21);
    CMTime lhs = v45;
    CMTime rhs = v46;
    CMTimeSubtract(&v40, &lhs, &rhs);
    float v22 = CMTimeGetSeconds(&v40);

    float v17 = self->_imageExposureTime / (float)(v22 - v16);
  }
  uint64_t v23 = -[NSArray objectAtIndexedSubscript:](self->_homographyResults, "objectAtIndexedSubscript:", v6, v6 + 1, a3);
  CVReturn v24 = [v23 objectForKeyedSubscript:@"attributes"];
  v39 = [v24 objectForKeyedSubscript:@"MetaHomographyResults"];

  float v25 = [(NSArray *)self->_homographyResults objectAtIndexedSubscript:v6 - 1];
  float v26 = [v25 objectForKeyedSubscript:@"attributes"];
  float v27 = [v26 objectForKeyedSubscript:@"MetaHomographyResults"];

  if ((float)(v16 - self->_livePhotoStillDisplayTime) > (float)(self->_imageExposureTime * 0.5)
    || v37 == [(NSArray *)self->_framePTSResults count])
  {
    [(VCPImageBlurAnalyzer *)self estimateDistance:v39 prevHomography:v27];
    float v29 = v18 * v28;
  }
  else
  {
    int v30 = [(NSArray *)self->_homographyResults objectAtIndexedSubscript:v37];
    float v31 = [v30 objectForKeyedSubscript:@"attributes"];
    int v32 = [v31 objectForKeyedSubscript:@"MetaHomographyResults"];

    [(VCPImageBlurAnalyzer *)self estimateDistance:v39 prevHomography:v27];
    float v34 = v33;
    [(VCPImageBlurAnalyzer *)self estimateDistance:v32 prevHomography:v39];
    float v29 = (float)((float)(v17 * v35) + (float)(v18 * v34)) * 0.5;
  }
  float *v38 = v29;

  return 0;
}

- (float)estimateDistance:(id)a3 prevHomography:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  for (uint64_t i = 0; i != 9; ++i)
  {
    float v8 = [v5 objectAtIndexedSubscript:i];
    [v8 floatValue];
    __B[i] = v9;

    float v10 = [v6 objectAtIndexedSubscript:i];
    [v10 floatValue];
    v13[i] = v11;
  }
  vcp_matrix_invert(__B, 3);
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  LODWORD(v6) = -1.0;
  return [(VCPImageBlurAnalyzer *)self analyzePixelBuffer:a3 flags:a4 withPreAnalysisScore:a5 results:a6 cancel:v6];
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 withPreAnalysisScore:(float)a5 results:(id *)a6 cancel:(id)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  CFDictionaryRef v12 = [MEMORY[0x1E4F1CA60] dictionary];
  p_float sharpness = &self->_sharpness;
  self->_float sharpness = 0.0;
  self->_textureScore = 1.0;
  int v14 = (void *)MEMORY[0x1C186D320]();
  if (self->_sdof)
  {
    int v16 = [(VCPImageBlurAnalyzer *)self computeLocalSharpness:a3];
    if (v16) {
      goto LABEL_14;
    }
    [(VCPImageBlurAnalyzer *)self spatialPooling];
  }
  if (a5 == -1.0)
  {
    *(float *)&double v15 = self->_contrast;
    int v16 = [(VCPCNNBlurAnalyzer *)self->_blurAnalyzer computeCNNBasedSharpness:a3 sharpnessScore:&self->_sharpness textureScore:&self->_textureScore contrast:v11 cancel:v15];
    if (v16) {
      goto LABEL_14;
    }
    a5 = *p_sharpness;
  }
  else
  {
    *p_float sharpness = a5;
  }
  *(float *)&double v15 = a5;
  float v17 = [NSNumber numberWithFloat:v15];
  [v12 setObject:v17 forKey:@"sharpness"];

  faces = self->_faces;
  if (faces && [(NSArray *)faces count])
  {
    int v29 = 0;
    if (self->_useGPU) {
      int v19 = [(VCPImageBlurAnalyzer *)self computeCNNFaceSharpness:a3 result:&v29 cancel:v11];
    }
    else {
      int v19 = [(VCPImageBlurAnalyzer *)self computeSharpnessScore:&v29 forFacesInImage:a3];
    }
    int v16 = v19;
    if (v19) {
      goto LABEL_14;
    }
    LODWORD(v20) = v29;
    float v22 = [NSNumber numberWithFloat:v20];
    [v12 setObject:v22 forKey:@"sharpnessFaces"];
  }
  framePTSResults = self->_framePTSResults;
  if (framePTSResults)
  {
    if ([(NSArray *)framePTSResults count])
    {
      homographyResults = self->_homographyResults;
      if (homographyResults)
      {
        uint64_t v25 = [(NSArray *)homographyResults count];
        if (v25 == [(NSArray *)self->_framePTSResults count]
          && self->_livePhotoStillDisplayTime != -1.0
          && self->_imageExposureTime != -1.0)
        {
          int v29 = 0;
          int v16 = [(VCPImageBlurAnalyzer *)self computeGyroSharpness:&v29];
          if (v16)
          {
LABEL_14:
            int v21 = 0;
            goto LABEL_24;
          }
        }
      }
    }
  }
  int v16 = 0;
  int v21 = 1;
LABEL_24:
  if (v21)
  {
    float v33 = @"BlurResults";
    int v30 = @"attributes";
    float v31 = v12;
    float v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    int v32 = v26;
    float v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v34[0] = v27;
    *a6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];

    int v16 = 0;
  }

  return v16;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
  objc_storeStrong((id *)&self->_faceInput, 0);
  objc_storeStrong((id *)&self->_faceModel, 0);
  objc_storeStrong((id *)&self->_homographyResults, 0);
  objc_storeStrong((id *)&self->_framePTSResults, 0);
  objc_storeStrong((id *)&self->_faces, 0);
}

- (id).cxx_construct
{
  *((void *)self + 22) = 0;
  *((_DWORD *)self + 46) = 0;
  return self;
}

- (void)computeLocalSharpness:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to lock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
}

@end