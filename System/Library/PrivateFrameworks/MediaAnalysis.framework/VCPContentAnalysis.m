@interface VCPContentAnalysis
+ (id)contentAnalysis;
- (VCPContentAnalysis)init;
- (int)blockContentDetection:(unint64_t *)a3;
- (int)detectPixelBuffer:(__CVBuffer *)a3 contentType:(unint64_t *)a4;
- (void)copyBlock:(char *)a3 withStride:(unint64_t)a4 toBlock:(float *)a5;
- (void)dealloc;
@end

@implementation VCPContentAnalysis

- (VCPContentAnalysis)init
{
  BOOL v3 = +[VCPCNNMetalContext supportGPU];
  if (v3 || !+[VCPCNNMetalContext supportVectorForward]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 4;
  }
  v30.receiver = self;
  v30.super_class = (Class)VCPContentAnalysis;
  v5 = [(VCPContentAnalysis *)&v30 init];
  if (!v5) {
    goto LABEL_21;
  }
  v6 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:v3];
  model = v5->_model;
  v5->_model = v6;

  v8 = v5->_model;
  if (!v8)
  {
LABEL_22:
    v9 = v8;
    goto LABEL_23;
  }
  v9 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:16 chunk:v4 reLU:1 padding:0];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v9];
  if (v10) {
    goto LABEL_18;
  }
  v11 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v4];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v11];
  if (v10)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v12 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:32 chunk:v4 reLU:1 padding:0];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v12];
  if (v10)
  {
LABEL_16:

    goto LABEL_17;
  }
  v13 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v4];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v13];
  if (v10)
  {
LABEL_15:

    goto LABEL_16;
  }
  v14 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:16 chunk:v4 reLU:1 padding:0];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v14];
  if (v10)
  {
LABEL_14:

    goto LABEL_15;
  }
  v15 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v4];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v15];
  if (v10
    || !v3
    && (v17 = [[VCPCNNFlattenBlock alloc] initWithParameters:v4], OSStatus v10 = [(VCPCNNModel *)v5->_model add:v17], v17, v10))
  {

    goto LABEL_14;
  }
  v18 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:64 NeuronType:1];
  OSStatus v10 = [(VCPCNNModel *)v5->_model add:v18];
  if (v10)
  {
    int v19 = 4;
  }
  else
  {
    v29 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:2 NeuronType:1];
    OSStatus v10 = [(VCPCNNModel *)v5->_model add:v29];
    if (v10)
    {
      int v19 = 4;
    }
    else
    {
      v20 = [(VCPCNNModel *)v5->_model getGPUContext];
      uint64_t v21 = +[VCPCNNData cnnDataWithPlane:4 height:64 width:64 context:v20];
      input = v5->_input;
      v5->_input = (VCPCNNData *)v21;

      [(VCPCNNData *)v5->_input allocBuffers:1];
      v23 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
      uint64_t v24 = [v23 resourceURL];

      v27 = (void *)v24;
      v28 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_content.dat" relativeToURL:v24];
      v25 = v5->_model;
      v26 = [(VCPCNNData *)v5->_input size];
      OSStatus v10 = [(VCPCNNModel *)v25 prepareNetworkFromURL:v28 withInputSize:v26];

      if (v10)
      {
        int v19 = 4;
      }
      else
      {
        v5->_previousContentType = 2;
        v5->_argbPixelBuffer = 0;
        OSStatus v10 = VTPixelTransferSessionCreate(0, &v5->_argbTransferSession);
        int v19 = 4 * (v10 != 0);
      }
    }
  }

  if ((v19 | 4) == 4)
  {
LABEL_19:
    if (v10)
    {
      v8 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v8 = v5;
    goto LABEL_22;
  }
LABEL_23:

  return v9;
}

+ (id)contentAnalysis
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)dealloc
{
  argbPixelBuffer = self->_argbPixelBuffer;
  if (argbPixelBuffer) {
    CFRelease(argbPixelBuffer);
  }
  argbTransferSession = self->_argbTransferSession;
  if (argbTransferSession) {
    CFRelease(argbTransferSession);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPContentAnalysis;
  [(VCPContentAnalysis *)&v5 dealloc];
}

- (void)copyBlock:(char *)a3 withStride:(unint64_t)a4 toBlock:(float *)a5
{
  for (int i = 0; i != 64; ++i)
  {
    for (uint64_t j = 0; j != 256; ++j)
    {
      LOBYTE(v5) = a3[j];
      double v5 = ((double)*(unint64_t *)&v5 / 255.0 + -0.444431007) / 0.339706987;
      *(float *)&double v5 = v5;
      a5[j] = *(float *)&v5;
    }
    a3 += a4;
    a5 += 256;
  }
}

- (int)blockContentDetection:(unint64_t *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(self->_argbPixelBuffer);
  size_t Height = CVPixelBufferGetHeight(self->_argbPixelBuffer);
  v48[0] = 0;
  v48[1] = ((2 * Width) & 0xFFFFFFFFFFFFFFFCLL) - 132;
  v48[2] = 4 * Width - 260;
  v47[0] = 0;
  v47[1] = (Height >> 1) - 33;
  v47[2] = Height - 65;
  CVPixelBufferLockFlags unlockFlags = 0;
  uint64_t v46 = 0;
  argbPixelBuffer = self->_argbPixelBuffer;
  int v43 = 0;
  CVPixelBufferRef pixelBuffer = argbPixelBuffer;
  if (argbPixelBuffer)
  {
    v42 = a3;
    CVReturn v8 = CVPixelBufferLockBaseAddress(argbPixelBuffer, 0);
    int v43 = v8;
    if (!v8
      || (int v9 = v8, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v50 = argbPixelBuffer,
          __int16 v51 = 1024,
          int v52 = v9,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v9 = v43) == 0))
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_argbPixelBuffer);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_argbPixelBuffer);
      uint64_t v12 = 0;
      int v13 = 0;
      float v14 = 0.0;
      float v15 = 0.0;
      v41 = BaseAddress;
LABEL_6:
      uint64_t v16 = 0;
      v17 = &BaseAddress[v47[v12] * BytesPerRow];
      while (1)
      {
        [(VCPContentAnalysis *)self copyBlock:&v17[v48[v16]] withStride:BytesPerRow toBlock:[(VCPCNNData *)self->_input data]];
        int v9 = [(VCPCNNModel *)self->_model forward:self->_input];
        if (v9) {
          break;
        }
        v18 = [(VCPCNNModel *)self->_model output];
        int v9 = [v18 softmax];

        if (v9) {
          break;
        }
        int v19 = [(VCPCNNModel *)self->_model output];
        float v20 = *(float *)[v19 data];
        uint64_t v21 = [(VCPCNNModel *)self->_model output];
        float v22 = *(float *)([v21 data] + 4);
        ++*(_DWORD *)((unint64_t)&v46 | (4 * (v20 <= v22)));

        v23 = [(VCPCNNModel *)self->_model output];
        float v24 = *(float *)[v23 data];

        v25 = [(VCPCNNModel *)self->_model output];
        float v26 = *(float *)([v25 data] + 4);

        v27 = [(VCPCNNModel *)self->_model output];
        [v27 data];

        v28 = [(VCPCNNModel *)self->_model output];
        if (*(float *)([v28 data] + 4) > 0.95) {
          ++v13;
        }

        ++v16;
        float v15 = v15 + v24;
        float v14 = v14 + v26;
        if (v16 == 3)
        {
          ++v12;
          BaseAddress = v41;
          if (v12 != 3) {
            goto LABEL_6;
          }
          int v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
          if (!v9)
          {
            if (vabds_f32(v15, v14) <= 2.0) {
              goto LABEL_33;
            }
            unsigned int v29 = v46 - HIDWORD(v46);
            if ((int)v46 - HIDWORD(v46) < 0) {
              unsigned int v29 = HIDWORD(v46) - v46;
            }
            if (v29 < 2)
            {
LABEL_33:
              unint64_t previousContentType = self->_previousContentType;
            }
            else
            {
              BOOL v30 = v13 >= 4 || v15 <= v14;
              unint64_t previousContentType = 1;
              if (v30) {
                unint64_t previousContentType = 2;
              }
            }
            int v9 = 0;
            unint64_t *v42 = previousContentType;
            self->_unint64_t previousContentType = previousContentType;
          }
          break;
        }
      }
    }
  }
  else
  {
    BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v32) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
    int v9 = -50;
    int v43 = -50;
  }
  if (pixelBuffer
    && !v43
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
  return v9;
}

- (int)detectPixelBuffer:(__CVBuffer *)a3 contentType:(unint64_t *)a4
{
  int result = -50;
  if (!a3 || !a4) {
    return result;
  }
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (Width >= Height) {
    unint64_t v10 = Height;
  }
  else {
    unint64_t v10 = Width;
  }
  if (v10 < 0xC0) {
    return -50;
  }
  float v11 = fminf((float)v10 / 192.0, 4.0);
  signed int v12 = (vcvtps_s32_f32((float)Width / v11) + 1) & 0xFFFFFFFE;
  signed int v13 = (vcvtps_s32_f32((float)Height / v11) + 1) & 0xFFFFFFFE;
  p_argbPixelBuffer = &self->_argbPixelBuffer;
  argbPixelBuffer = self->_argbPixelBuffer;
  size_t v16 = v12;
  if (!argbPixelBuffer) {
    goto LABEL_13;
  }
  if (CVPixelBufferGetWidth(argbPixelBuffer) != v12 || CVPixelBufferGetHeight(*p_argbPixelBuffer) != v13)
  {
    if (*p_argbPixelBuffer)
    {
      CFRelease(*p_argbPixelBuffer);
      *p_argbPixelBuffer = 0;
    }
LABEL_13:
    int result = CVPixelBufferCreate(0, v16, v13, 0x20u, 0, &self->_argbPixelBuffer);
    if (result) {
      return result;
    }
  }
  int result = VTPixelTransferSessionTransferImage(self->_argbTransferSession, a3, self->_argbPixelBuffer);
  if (!result)
  {
    return [(VCPContentAnalysis *)self blockContentDetection:a4];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end