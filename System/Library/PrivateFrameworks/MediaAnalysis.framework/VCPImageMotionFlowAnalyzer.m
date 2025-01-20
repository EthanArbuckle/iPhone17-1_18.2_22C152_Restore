@interface VCPImageMotionFlowAnalyzer
+ (id)analyzeWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9;
- (VCPImageMotionFlowAnalyzer)init;
- (VCPImageMotionFlowAnalyzer)initWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9;
- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4;
- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5;
- (int)cnnOutputHeight;
- (int)cnnOutputWidth;
- (int)combineBufferTo:(__CVBuffer *)a3 flowX:(__CVBuffer *)a4 flowY:(__CVBuffer *)a5;
- (int)configForAspectRatio:(id)a3;
- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6;
- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5;
- (int)getFlowToBuffer:(__CVBuffer *)a3;
- (int)guidedUpsampling:(__CVBuffer *)a3 inBGRA:(__CVBuffer *)a4;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7;
- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7;
- (int)reInitModel;
- (int)scaleFlowTo:(__CVBuffer *)a3;
- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4;
@end

@implementation VCPImageMotionFlowAnalyzer

- (VCPImageMotionFlowAnalyzer)init
{
  return 0;
}

+ (id)analyzeWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v12 = *(void *)&a5;
  BOOL v13 = a3;
  id v14 = a4;
  id v15 = a9;
  uint64_t v16 = objc_opt_class();
  if (v11 || (v17 = (objc_class *)v16, (DeviceHasANE() & 1) == 0)) {
    v17 = (objc_class *)objc_opt_class();
  }
  v18 = (void *)[[v17 alloc] initWithLightweightOption:v13 aspectRatio:v14 computationAccuracy:v12 forceCPU:v11 sharedModel:v10 flushModel:v9 cancel:v15];

  return v18;
}

- (VCPImageMotionFlowAnalyzer)initWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v13 = a3;
  id v15 = a4;
  id v16 = a9;
  v34.receiver = self;
  v34.super_class = (Class)VCPImageMotionFlowAnalyzer;
  v17 = [(VCPImageMotionFlowAnalyzer *)&v34 init];
  if (!v17) {
    goto LABEL_7;
  }
  v18 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = v17->_device;
  v17->_device = v18;

  uint64_t v20 = [(MTLDeviceSPI *)v17->_device newCommandQueue];
  commandQueue = v17->_commandQueue;
  v17->_commandQueue = (MTLCommandQueue *)v20;

  v17->_computationAccuracy = a5;
  if (v11 || (DeviceHasANE() & 1) == 0) {
    int v22 = [(VCPImageMotionFlowAnalyzer *)v17 prepareWithLightweightOption:v13 aspectRatio:v15 forceCPU:v11 sharedModel:v10 flushModel:v9];
  }
  else {
    int v22 = [(VCPImageMotionFlowAnalyzer *)v17 prepareWithLightweightOption:v13 aspectRatio:v15 numLevels:7 startLevel:2 cancel:v16];
  }
  if (v22) {
    goto LABEL_7;
  }
  uint64_t v26 = [objc_alloc(MEMORY[0x1E4F35548]) initWithDevice:v17->_device];
  bilinearScale = v17->_bilinearScale;
  v17->_bilinearScale = (MPSImageBilinearScale *)v26;

  if (!v17->_bilinearScale) {
    goto LABEL_7;
  }
  LOBYTE(v33) = 1;
  LODWORD(v28) = 953267991;
  v29 = [MEMORY[0x1E4F355D8] filterDescriptorWithWidth:v17->_cnnInputWidth height:(uint64_t)(v17->_cnnInputHeight + (v17->_cnnInputHeight < 0 ? 3 : 0)) >> 2 arrayLength:1 kernelSpatialDiameter:3 kernelTemporalDiameter:1 epsilon:2 sourceChannels:v28 guideChannels:3 preallocateIntermediates:v33];
  uint64_t v30 = [objc_alloc(MEMORY[0x1E4F355D0]) initWithDevice:v17->_device filterDescriptor:v29];
  guidedFilter = v17->_guidedFilter;
  v17->_guidedFilter = (MPSImageSpatioTemporalGuidedFilter *)v30;

  v32 = v17->_guidedFilter;
  v23 = v17;
  if (!v32) {
LABEL_7:
  }
    v23 = 0;
  v24 = v23;

  return v24;
}

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7
{
  return -4;
}

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7
{
  return -4;
}

- (int)reInitModel
{
  return -4;
}

- (int)configForAspectRatio:(id)a3
{
  return -4;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  return -4;
}

- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4
{
  return 0;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  return -4;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  return -4;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  return -4;
}

- (int)scaleFlowTo:(__CVBuffer *)a3
{
  int Width = CVPixelBufferGetWidth(a3);
  _S0 = (float)(int)CVPixelBufferGetHeight(a3);
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  size_t cnnOutputHeight = self->_cnnOutputHeight;
  _S0 = _S0 / (float)(int)cnnOutputHeight;
  __asm { FCVT            H8, S0 }
  _S0 = (float)Width;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  cnnOutputint Width = self->_cnnOutputWidth;
  _S0 = _S0 / (float)(int)cnnOutputWidth;
  __asm { FCVT            H9, S0 }
  PixelBuffer = VCPFlowCreatePixelBuffer(cnnOutputWidth, cnnOutputHeight, 0x32433068u, 32);
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  [(VCPImageMotionFlowAnalyzer *)self flowScalingTo:PixelBuffer scalerX:_D0 scalerY:_D1];
  int v22 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v23 = createTextureFromBuffer(PixelBuffer, self->_device, 1, 1uLL);
  uint64_t v24 = createTextureFromBuffer(a3, self->_device, 1, 1uLL);
  v25 = (void *)v24;
  int v26 = -108;
  if (v23 && v24)
  {
    [(MPSImageBilinearScale *)self->_bilinearScale encodeToCommandBuffer:v22 sourceTexture:v23 destinationTexture:v24];
    [v22 commit];
    [v22 waitUntilCompleted];
    if (needDeepCopy([v25 width], objc_msgSend(v25, "arrayLength"))) {
      int v26 = copyTextureToBuffer(v25, a3);
    }
    else {
      int v26 = 0;
    }
  }

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&PixelBuffer);
  return v26;
}

- (int)combineBufferTo:(__CVBuffer *)a3 flowX:(__CVBuffer *)a4 flowY:(__CVBuffer *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  int v11 = CVPixelBufferGetBytesPerRow(a4);
  int v12 = CVPixelBufferGetBytesPerRow(a5);
  CVReturn v47 = 0;
  CVPixelBufferRef pixelBuffer = a4;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a4)
  {
    int v13 = v12;
    CVReturn v14 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVReturn v47 = v14;
    if (!v14
      || (CVReturn v15 = v14, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          *(void *)v53 = a4,
          *(_WORD *)&v53[8] = 1024,
          *(_DWORD *)&v53[10] = v15,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v15 = v47) == 0))
    {
      *(_DWORD *)buf = 0;
      *(void *)&v53[4] = a5;
      *(void *)&v53[12] = 1;
      if (a5)
      {
        CVReturn v15 = CVPixelBufferLockBaseAddress(a5, 1uLL);
        *(_DWORD *)buf = v15;
        if (!v15
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v50 = 134218240,
              v51[0] = *(void *)&v53[4],
              LOWORD(v51[1]) = 1024,
              *(_DWORD *)((char *)&v51[1] + 2) = v15,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v50, 0x12u), (CVReturn v15 = *(_DWORD *)buf) == 0))
        {
          *(_DWORD *)v50 = 0;
          *(_OWORD *)((char *)v51 + 4) = (unint64_t)a3;
          if (a3)
          {
            CVReturn v15 = CVPixelBufferLockBaseAddress(a3, 0);
            *(_DWORD *)v50 = v15;
            if (!v15
              || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v54 = 134218240,
                  uint64_t v55 = *(void *)((char *)v51 + 4),
                  __int16 v56 = 1024,
                  CVReturn v57 = v15,
                  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v54, 0x12u), (CVReturn v15 = *(_DWORD *)v50) == 0))
            {
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
              v17 = (char *)CVPixelBufferGetBaseAddress(a5);
              v18 = (char *)CVPixelBufferGetBaseAddress(a3);
              if (Height >= 1)
              {
                for (int i = 0; i != Height; ++i)
                {
                  if (Width >= 1)
                  {
                    uint64_t v20 = 0;
                    uint64_t v21 = 0;
                    do
                    {
                      *(_WORD *)&v18[v20 >> 31] = *(_WORD *)&BaseAddress[v21];
                      *(_WORD *)&v18[2 * (int)v21 + 2] = *(_WORD *)&v17[v21];
                      v21 += 2;
                      v20 += 0x200000000;
                    }
                    while (2 * Width != v21);
                  }
                  v18 += 2 * ((uint64_t)BytesPerRow >> 1);
                  v17 += 2 * ((uint64_t)v13 >> 1);
                  BaseAddress += 2 * ((uint64_t)v11 >> 1);
                }
              }
              CVReturn v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v50);
              if (!v15)
              {
                CVReturn v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                if (!v15) {
                  CVReturn v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
                }
              }
            }
          }
          else
          {
            BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v39) {
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v39, v40, v41, v42, v43, v44, v45, v46);
            }
            CVReturn v15 = -50;
            *(_DWORD *)v50 = -50;
          }
          if (*(void *)((char *)v51 + 4)
            && !*(_DWORD *)v50
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v51 + 4), *(void *)((char *)&v51[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
          if (*(void *)&v53[4]
            && !*(_DWORD *)buf
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&v53[4], *(CVPixelBufferLockFlags *)&v53[12])
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
        }
      }
      else
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v31) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v31, v32, v33, v34, v35, v36, v37, v38);
        }
        CVReturn v15 = -50;
      }
      if (pixelBuffer
        && !v47
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v22) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    return -50;
  }
  return v15;
}

- (int)guidedUpsampling:(__CVBuffer *)a3 inBGRA:(__CVBuffer *)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int cnnOutputHeight = self->_cnnOutputHeight;
  cnnOutputint Width = self->_cnnOutputWidth;
  PixelBuffer = VCPFlowCreatePixelBuffer(cnnOutputWidth, cnnOutputHeight, 0x4C303068u, 32);
  uint64_t v37 = VCPFlowCreatePixelBuffer(self->_cnnOutputWidth, self->_cnnOutputHeight, 0x4C303068u, 32);
  uint64_t v36 = VCPFlowCreatePixelBuffer(Width, Height, 0x4C303068u, 32);
  CVPixelBufferRef v11 = VCPFlowCreatePixelBuffer(Width, Height, 0x4C303068u, 32);
  _S0 = (float)Height;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  _S0 = _S0 / (float)cnnOutputHeight;
  _S1 = (float)Width;
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S1
    FCVT            S1, H1
  }
  _S1 = _S1 / (float)cnnOutputWidth;
  __asm { FCVT            H1, S1 }
  uint64_t v35 = v11;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  [(VCPImageMotionFlowAnalyzer *)self flowScalingTo:PixelBuffer flowBufferY:v37 scalerX:_D0 scalerY:_D1];
  uint64_t v33 = createRGBA8TextureFromBuffer(a4, self->_device);
  uint64_t v24 = createTextureFromBuffer(PixelBuffer, self->_device, 0, 1uLL);
  uint64_t v25 = createTextureFromBuffer(v37, self->_device, 0, 1uLL);
  uint64_t v26 = createTextureFromBuffer(v36, self->_device, 0, 1uLL);
  uint64_t v27 = createTextureFromBuffer(v35, self->_device, 0, 1uLL);
  uint64_t v28 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  guidedFilter = self->_guidedFilter;
  v40[0] = v24;
  v40[1] = v25;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v39[0] = v26;
  v39[1] = v27;
  BOOL v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [(MPSImageSpatioTemporalGuidedFilter *)guidedFilter encodeToCommandBuffer:v28 sourceTextureArray:v30 guidanceTexture:v33 constraintsTextureArray:0 numberOfIterations:1 destinationTextureArray:v31];

  [v28 commit];
  [v28 waitUntilCompleted];
  if (needDeepCopy([v26 width], objc_msgSend(v26, "arrayLength")))
  {
    copyTextureToBuffer(v26, v36);
    copyTextureToBuffer(v27, v35);
  }
  -[VCPImageMotionFlowAnalyzer combineBufferTo:flowX:flowY:](self, "combineBufferTo:flowX:flowY:", a3, v36, v35, v33);

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v35);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v36);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v37);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&PixelBuffer);
  return 0;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  return -4;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      int result = 0;
      *a3 = self->_cnnInputWidth;
      *a4 = self->_cnnInputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)cnnOutputHeight
{
  return self->_cnnOutputHeight;
}

- (int)cnnOutputWidth
{
  return self->_cnnOutputWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end