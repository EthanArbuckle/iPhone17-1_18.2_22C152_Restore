@interface Forwarp
- (BOOL)createOcclusionMask;
- (BOOL)filterErrorMapByGaussian;
- (BOOL)isLiteSynthesis;
- (BOOL)limitBilinearInterpolation;
- (BOOL)linearSplatting;
- (BOOL)setupMetal;
- (Forwarp)initWithDevice:(id)a3 commmandQueue:(id)a4 mode:(unint64_t)a5;
- (float)errorTolerance;
- (id)createBestBufferWidth:(unint64_t)a3 height:(unint64_t)a4;
- (id)createOutputBufferWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5;
- (void)allocateBuffersWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5 bestBuffer:(id *)a6 outputBuffer:(id *)a7;
- (void)dealloc;
- (void)encodeBlendTexturesToCommandBuffer:(id)a3 firstWarpedTexture:(id)a4 secondWarpedTexture:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 synthesizedTexture:(id)a8 timeScale:(float)a9 synthesizedImageWeight:(float)a10 destination:(id)a11;
- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 forwarpConsistency:(id)a8 backwardConsistency:(id)a9 timeScale:(float)a10 destination:(id)a11;
- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 destination:(id)a7;
- (void)encodeErrorDownsampleToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeErrorMapDilationToCommandBuffer:(id)a3 forwardSource:(id)a4 backwardSource:(id)a5 forwardDestination:(id)a6 backwardDestination:(id)a7 minimumAdjacentHoleCount:(unsigned int)a8 maximumHoleValue:(float)a9;
- (void)encodeErrorMapFilteringToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeErrorMapFilteringWithGaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeInitialieBestToCommandBuffer:(id)a3 bestError:(id)a4;
- (void)encodeLinearSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 splatBuffer:(id)a7 outputTexture:(id)a8 timeScale:(float)a9;
- (void)encodeNormalizationToCommandBuffer:(id)a3 fromBuffer:(id)a4 toTexture:(id)a5 inputSize:(id *)a6;
- (void)encodeSplattingNormalizationToCommandBuffer:(id)a3 splattingBuffer:(id)a4 outputTexture:(id)a5;
- (void)encodeSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 outputBuffer:(id)a7 timeScale:(float)a8;
- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10 destination:(id)a11;
- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 outputBuffer:(id)a10;
- (void)encodeUpdateBestToCommandBuffer:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 bestError:(id)a7;
- (void)encodeUpdateOutputToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10;
- (void)encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 forwardErrorMap:(id)a8 backwardErrorMap:(id)a9 forwarpConsistency:(id)a10 backwardConsistency:(id)a11 timeScale:(float)a12 destination:(id)a13;
- (void)setCreateOcclusionMask:(BOOL)a3;
- (void)setErrorTolerance:(float)a3;
- (void)setIsLiteSynthesis:(BOOL)a3;
- (void)setLimitBilinearInterpolation:(BOOL)a3;
- (void)setLinearSplatting:(BOOL)a3;
- (void)updateBest:(id)a3 error:(id)a4 timeScale:(float)a5 best:(id)a6;
- (void)updateOutput:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 fullWarp:(BOOL)a7 bestError:(id)a8 output:(id)a9;
@end

@implementation Forwarp

- (Forwarp)initWithDevice:(id)a3 commmandQueue:(id)a4 mode:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)Forwarp;
  v6 = [(FRCMetalBase *)&v10 initWithDevice:a3 commmandQueue:a4];
  v7 = v6;
  if (v6)
  {
    v6->_synthesisMode = a5;
    v6->_isLiteSynthesis = a5 == 10;
    float v8 = 0.1;
    if (a5 == 10) {
      float v8 = 0.5;
    }
    v6->_errorTolerance = v8;
    v6->_filterErrorMapByGaussian = 1;
    [(Forwarp *)v6 setupMetal];
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)Forwarp;
  [(Forwarp *)&v2 dealloc];
}

- (BOOL)setupMetal
{
  v3 = objc_opt_new();
  v4 = [(FRCMetalBase *)self createKernel:@"updateBest"];
  updateBest = self->_updateBest;
  self->_updateBest = v4;

  __int16 v47 = 256;
  int v6 = [(MTLDevice *)self->super._device supportsFamily:1009];
  if (v6) {
    v7 = @"updateOutputFloat";
  }
  else {
    v7 = @"updateOutput";
  }
  if (v6) {
    float v8 = @"convertFloatBuffer2Texture";
  }
  else {
    float v8 = @"convertFixedPointBuffer2Texture";
  }
  [v3 setConstantValue:(char *)&v47 + 1 type:53 withName:@"fullWarpEnabled"];
  [v3 setConstantValue:&v47 type:53 withName:@"offsetPixelAlignedPositionWeight"];
  v9 = [(FRCMetalBase *)self createKernel:v7 constantValues:v3];
  updateOutputFullWarp = self->_updateOutputFullWarp;
  self->_updateOutputFullWarp = v9;

  LOBYTE(v47) = 1;
  [v3 setConstantValue:&v47 type:53 withName:@"offsetPixelAlignedPositionWeight"];
  v11 = [(FRCMetalBase *)self createKernel:v7 constantValues:v3];
  updateOutputFullWarpMinErrorOffset = self->_updateOutputFullWarpMinErrorOffset;
  self->_updateOutputFullWarpMinErrorOffset = v11;

  __int16 v47 = 0;
  [v3 setConstantValue:(char *)&v47 + 1 type:53 withName:@"fullWarpEnabled"];
  [v3 setConstantValue:&v47 type:53 withName:@"offsetPixelAlignedPositionWeight"];
  v13 = [(FRCMetalBase *)self createKernel:v7 constantValues:v3];
  updateOutputLiteWarp = self->_updateOutputLiteWarp;
  self->_updateOutputLiteWarp = v13;

  v15 = [(FRCMetalBase *)self createKernel:@"initializeBestBuffer"];
  initializeBest = self->_initializeBest;
  self->_initializeBest = v15;

  v17 = [(FRCMetalBase *)self createKernel:@"blendWarpedImagesWithErrorMap"];
  blendWarpedImages = self->_blendWarpedImages;
  self->_blendWarpedImages = v17;

  char v46 = 0;
  [v3 setConstantValue:&v46 type:53 withName:@"outputErrorMask"];
  v19 = [(FRCMetalBase *)self createKernel:v8 constantValues:v3];
  convert2Texture = self->_convert2Texture;
  self->_convert2Texture = v19;

  char v46 = 1;
  [v3 setConstantValue:&v46 type:53 withName:@"outputErrorMask"];
  v21 = [(FRCMetalBase *)self createKernel:v8 constantValues:v3];
  convert2TextureWithMask = self->_convert2TextureWithMask;
  self->_convert2TextureWithMask = v21;

  if ([(MTLDevice *)self->super._device supportsFamily:1008])
  {
    self->_supportsSIMDShuffle = 1;
LABEL_10:
    v23 = @"dualErrorMapDilationSIMD";
    goto LABEL_12;
  }
  if (self->_supportsSIMDShuffle) {
    goto LABEL_10;
  }
  v23 = @"dualErrorMapDilation";
LABEL_12:
  v24 = [(FRCMetalBase *)self createKernel:v23];
  errorMapDilation = self->_errorMapDilation;
  self->_errorMapDilation = v24;

  unint64_t synthesisMode = self->_synthesisMode;
  if (synthesisMode <= 1)
  {
    v27 = [(FRCMetalBase *)self createKernel:@"blendDCTexturesWithMask"];
    blendDCTexturesWithMasks = self->_blendDCTexturesWithMasks;
    self->_blendDCTexturesWithMasks = v27;

    unint64_t synthesisMode = self->_synthesisMode;
  }
  if (synthesisMode == 2)
  {
    v29 = [(FRCMetalBase *)self createKernel:@"blendWarpedImageWithErrorMapAndFlowConsistency"];
    blendWarpedImagesWithMaskAndFlowConsistency = self->_blendWarpedImagesWithMaskAndFlowConsistency;
    self->_blendWarpedImagesWithMaskAndFlowConsistency = v29;

    v31 = [(FRCMetalBase *)self createKernel:@"blendWarpedImagesWithErrorMapTextures"];
    blendWarpedImagesWithMaskTextures = self->_blendWarpedImagesWithMaskTextures;
    self->_blendWarpedImagesWithMaskTextures = v31;
  }
  if (self->_filterErrorMapByGaussian)
  {
    if (self->_supportsSIMDShuffle)
    {
      v33 = [(FRCMetalBase *)self createKernel:@"filter_error_map_SIMD"];
      uint64_t v34 = 144;
    }
    else
    {
      v33 = [(FRCMetalBase *)self createKernel:@"filter_error_map"];
      uint64_t v34 = 136;
    }
  }
  else
  {
    v33 = [(FRCMetalBase *)self createKernel:@"downsample_error_map"];
    uint64_t v34 = 176;
  }
  v35 = *(Class *)((char *)&self->super.super.isa + v34);
  *(Class *)((char *)&self->super.super.isa + v34) = v33;

  unint64_t v36 = self->_synthesisMode;
  if (v36 == 2)
  {
    [v3 setConstantValue:&self->_filterErrorMapByGaussian type:53 withName:@"filterErrorMapByGaussian"];
    v37 = [(FRCMetalBase *)self createKernel:@"spalatting" constantValues:v3];
    splattingKernel = self->_splattingKernel;
    self->_splattingKernel = v37;

    v39 = [(FRCMetalBase *)self createKernel:@"normalizeSplattedOutput"];
    splattingNormalizationKernel = self->_splattingNormalizationKernel;
    self->_splattingNormalizationKernel = v39;

    unint64_t v36 = self->_synthesisMode;
  }
  if (v36 == 3)
  {
    v41 = [(FRCMetalBase *)self createKernel:@"warpAndBlendWithErrorMap"];
    warpAndBlendTextures = self->_warpAndBlendTextures;
    self->_warpAndBlendTextures = v41;

    v43 = [(FRCMetalBase *)self createKernel:@"warpAndBlendImageWithErrorAndFlowConsistency"];
    warpAndBlendTexturesWithConsistency = self->_warpAndBlendTexturesWithConsistency;
    self->_warpAndBlendTexturesWithConsistency = v43;
  }
  return 1;
}

- (id)createBestBufferWidth:(unint64_t)a3 height:(unint64_t)a4
{
  v4 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:(4 * a3 * a4 + 4095) & 0xFFFFFFFFFFFFF000 options:0];
  return v4;
}

- (id)createOutputBufferWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5
{
  v5 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:(4 * (a3 * ((a4 + 15) & 0x3FFFFFFFFFFFFFF0) + a3 * ((a4 + 15) & 0x3FFFFFFFFFFFFFF0) * a5) + 4095) & 0xFFFFFFFFFFFFF000 options:0];
  return v5;
}

- (void)allocateBuffersWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5 bestBuffer:(id *)a6 outputBuffer:(id *)a7
{
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  *a7 = [(Forwarp *)self createOutputBufferWidth:a3 height:a4 channels:a5];
}

- (void)updateBest:(id)a3 error:(id)a4 timeScale:(float)a5 best:(id)a6
{
  commandQueue = self->super._commandQueue;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(MTLCommandQueue *)commandQueue commandBuffer];
  *(float *)&double v14 = a5;
  [(Forwarp *)self encodeUpdateBestToCommandBuffer:v15 flow:v13 error:v12 timeScale:v11 bestError:v14];

  [v15 commit];
  [v15 waitUntilCompleted];
}

- (void)encodeInitialieBestToCommandBuffer:(id)a3 bestError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 length];
  v9 = [v7 computeCommandEncoder];

  [v9 setComputePipelineState:self->_initializeBest];
  [v9 setBuffer:v6 offset:0 atIndex:0];

  int64x2_t v13 = vdupq_n_s64(1uLL);
  long long v10 = xmmword_1DC85A738;
  uint64_t v11 = 1;
  unint64_t v12 = v8 >> 13;
  [v9 dispatchThreadgroups:&v12 threadsPerThreadgroup:&v10];
  [v9 endEncoding];
}

- (void)encodeUpdateBestToCommandBuffer:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 bestError:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v12 && v13)
  {
    id v15 = a3;
    [(Forwarp *)self encodeInitialieBestToCommandBuffer:v15 bestError:v14];
    v16 = [v15 computeCommandEncoder];

    if (v16)
    {
      id v17 = (id) [(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
      uint64_t v18 = [v17 contents];
      *(float *)uint64_t v18 = a6;
      *(_DWORD *)(v18 + 4) = self->_isLiteSynthesis;
      [v16 setComputePipelineState:self->_updateBest];
      [v16 setTexture:v12 atIndex:0];
      [v16 setTexture:v13 atIndex:1];
      [v16 setBuffer:v17 offset:0 atIndex:0];
      [v16 setBuffer:v14 offset:0 atIndex:1];
      v21[0] = (unint64_t)([v13 width] + 15) >> 4;
      v21[1] = (unint64_t)([v13 height] + 15) >> 4;
      v21[2] = 1;
      int64x2_t v19 = vdupq_n_s64(0x10uLL);
      uint64_t v20 = 1;
      [v16 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
      [v16 endEncoding];
    }
  }
}

- (void)updateOutput:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 fullWarp:(BOOL)a7 bestError:(id)a8 output:(id)a9
{
  BOOL v10 = a7;
  commandQueue = self->super._commandQueue;
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v23 = [(MTLCommandQueue *)commandQueue commandBuffer];
  *(float *)&double v22 = a6;
  [(Forwarp *)self encodeUpdateOutputToCommandBuffer:v23 input:v21 flow:v20 error:v19 timeScale:v10 fullWarp:v18 bestError:v22 output:v17];

  [v23 commit];
  [v23 waitUntilCompleted];
}

- (void)encodeUpdateOutputToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10
{
  BOOL v11 = a8;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  if (v17 && v18 && v19)
  {
    id v22 = a3;
    id v23 = [v22 blitCommandEncoder];
    objc_msgSend(v23, "fillBuffer:range:value:", v21, 0, objc_msgSend(v21, "length"), 0);
    [v23 endEncoding];
    v24 = [v22 computeCommandEncoder];

    if (v24)
    {
      id v25 = (id) [(MTLDevice *)self->super._device newBufferWithLength:20 options:0];
      uint64_t v26 = [v25 contents];
      *(float *)uint64_t v26 = a7;
      *(_DWORD *)(v26 + 4) = v11;
      *(_DWORD *)(v26 + 8) = self->_isLiteSynthesis;
      *(float *)(v26 + 12) = self->_errorTolerance;
      BOOL v27 = !self->_limitBilinearInterpolation;
      float v28 = 0.0001;
      if (!self->_limitBilinearInterpolation) {
        float v28 = 0.0;
      }
      *(float *)(v26 + 16) = v28;
      v29 = &OBJC_IVAR___Forwarp__updateOutputFullWarpMinErrorOffset;
      if (v27) {
        v29 = &OBJC_IVAR___Forwarp__updateOutputFullWarp;
      }
      if (!v11) {
        v29 = &OBJC_IVAR___Forwarp__updateOutputLiteWarp;
      }
      [v24 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v29)];
      [v24 setTexture:v17 atIndex:0];
      [v24 setTexture:v18 atIndex:1];
      [v24 setTexture:v19 atIndex:2];
      [v24 setBuffer:v25 offset:0 atIndex:0];
      [v24 setBuffer:v20 offset:0 atIndex:1];
      [v24 setBuffer:v21 offset:0 atIndex:2];
      v32[0] = (unint64_t)([v19 width] + 15) >> 4;
      v32[1] = (unint64_t)([v19 height] + 15) >> 4;
      v32[2] = 1;
      int64x2_t v30 = vdupq_n_s64(0x10uLL);
      uint64_t v31 = 1;
      [v24 dispatchThreadgroups:v32 threadsPerThreadgroup:&v30];
      [v24 endEncoding];
    }
  }
}

- (void)encodeNormalizationToCommandBuffer:(id)a3 fromBuffer:(id)a4 toTexture:(id)a5 inputSize:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [a3 computeCommandEncoder];
  if (v12)
  {
    id v13 = (id) [(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
    id v14 = (_DWORD *)[v13 contents];
    int var0 = a6->var0;
    *id v14 = a6->var0;
    LODWORD(v16) = var0;
    HIDWORD(v16) = a6->var1;
    *(void *)id v14 = v16;
    if (self->_createOcclusionMask) {
      id v17 = &OBJC_IVAR___Forwarp__convert2TextureWithMask;
    }
    else {
      id v17 = &OBJC_IVAR___Forwarp__convert2Texture;
    }
    [v12 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v17)];
    [v12 setBuffer:v10 offset:0 atIndex:0];
    [v12 setTexture:v11 atIndex:0];
    [v12 setBuffer:v13 offset:0 atIndex:1];
    v20[0] = (unint64_t)([v11 width] + 15) >> 4;
    v20[1] = (unint64_t)([v11 height] + 15) >> 4;
    v20[2] = 1;
    int64x2_t v18 = vdupq_n_s64(0x10uLL);
    uint64_t v19 = 1;
    [v12 dispatchThreadgroups:v20 threadsPerThreadgroup:&v18];
    [v12 endEncoding];
  }
}

- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 outputBuffer:(id)a10
{
  BOOL v11 = a8;
  id v23 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  if (v11)
  {
    *(float *)&double v22 = a7;
    [(Forwarp *)self encodeUpdateBestToCommandBuffer:v23 flow:v18 error:v19 timeScale:v20 bestError:v22];
  }
  *(float *)&double v22 = a7;
  [(Forwarp *)self encodeUpdateOutputToCommandBuffer:v23 input:v17 flow:v18 error:v19 timeScale:v11 fullWarp:v20 bestError:v22 output:v21];
}

- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10 destination:(id)a11
{
  BOOL v12 = a8;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  uint64_t v26 = v24;
  if (v19 && v20 && v21 && v24)
  {
    if (self->_linearSplatting)
    {
      *(float *)&double v25 = a7;
      [(Forwarp *)self encodeLinearSplattingToCommandBuffer:v18 input:v19 flow:v20 error:v21 splatBuffer:v23 outputTexture:v24 timeScale:v25];
    }
    else
    {
      *(float *)&double v25 = a7;
      [(Forwarp *)self encodeToCommandBuffer:v18 input:v19 flow:v20 error:v21 timeScale:v12 fullWarp:v22 bestError:v25 outputBuffer:v23];
      if (!self->_isLiteSynthesis)
      {
        v27[0] = [v19 width];
        v27[1] = [v19 height];
        v27[2] = [v19 depth];
        [(Forwarp *)self encodeNormalizationToCommandBuffer:v18 fromBuffer:v23 toTexture:v26 inputSize:v27];
      }
    }
  }
  else
  {
    NSLog(&cfstr_ErrorInputOutp_0.isa);
  }
}

- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 destination:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  float v20 = a6;
  id v14 = a7;
  id v15 = [a3 computeCommandEncoder];
  uint64_t v16 = v15;
  if (v15)
  {
    [v15 setComputePipelineState:self->_blendWarpedImages];
    [v16 setTexture:v12 atIndex:0];
    [v16 setTexture:v13 atIndex:1];
    [v16 setTexture:v14 atIndex:2];
    [v16 setBytes:&v20 length:4 atIndex:0];
    v19[0] = (unint64_t)([v14 width] + 15) >> 4;
    v19[1] = (unint64_t)([v14 height] + 15) >> 4;
    v19[2] = 1;
    int64x2_t v17 = vdupq_n_s64(0x10uLL);
    uint64_t v18 = 1;
    [v16 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
    [v16 endEncoding];
  }
}

- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 forwarpConsistency:(id)a8 backwardConsistency:(id)a9 timeScale:(float)a10 destination:(id)a11
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  double v25 = [a3 computeCommandEncoder];
  if (v25)
  {
    *(float *)v33 = a10;
    float v26 = (float)(unint64_t)[v20 width];
    *(float *)&v33[2] = v26 / (float)(unint64_t)[v18 width];
    float v27 = (float)(unint64_t)[v18 width];
    *(float *)&v33[1] = v27 / (float)(unint64_t)[v20 width];
    [v25 setBytes:v33 length:12 atIndex:0];
    [v25 setTexture:v18 atIndex:0];
    [v25 setTexture:v19 atIndex:1];
    [v25 setTexture:v20 atIndex:2];
    [v25 setTexture:v21 atIndex:3];
    float v28 = &OBJC_IVAR___Forwarp__blendWarpedImagesWithMaskTextures;
    uint64_t v29 = 4;
    if (v22 && v23)
    {
      [v25 setTexture:v22 atIndex:4];
      [v25 setTexture:v23 atIndex:5];
      float v28 = &OBJC_IVAR___Forwarp__blendWarpedImagesWithMaskAndFlowConsistency;
      uint64_t v29 = 6;
    }
    [v25 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v28)];
    [v25 setTexture:v24 atIndex:v29];
    v32[0] = (unint64_t)([v24 width] + 15) >> 4;
    v32[1] = (unint64_t)([v24 height] + 15) >> 4;
    v32[2] = 1;
    int64x2_t v30 = vdupq_n_s64(0x10uLL);
    uint64_t v31 = 1;
    [v25 dispatchThreadgroups:v32 threadsPerThreadgroup:&v30];
    [v25 endEncoding];
  }
}

- (void)encodeErrorMapDilationToCommandBuffer:(id)a3 forwardSource:(id)a4 backwardSource:(id)a5 forwardDestination:(id)a6 backwardDestination:(id)a7 minimumAdjacentHoleCount:(unsigned int)a8 maximumHoleValue:(float)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = [a3 computeCommandEncoder];
  if (v20)
  {
    id v21 = (id) [(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
    uint64_t v22 = [v21 contents];
    *(float *)(v22 + 4) = a9;
    *(_DWORD *)uint64_t v22 = a8;
    [v20 setComputePipelineState:self->_errorMapDilation];
    [v20 setTexture:v16 atIndex:0];
    [v20 setTexture:v17 atIndex:1];
    [v20 setTexture:v18 atIndex:2];
    [v20 setTexture:v19 atIndex:3];
    [v20 setBuffer:v21 offset:0 atIndex:0];
    BOOL supportsSIMDShuffle = self->_supportsSIMDShuffle;
    uint64_t v24 = [v16 width];
    BOOL v25 = !supportsSIMDShuffle;
    if (supportsSIMDShuffle) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = 16;
    }
    if (v25) {
      uint64_t v27 = 16;
    }
    else {
      uint64_t v27 = 32;
    }
    if (v25) {
      char v28 = 4;
    }
    else {
      char v28 = 2;
    }
    if (v25) {
      char v29 = 4;
    }
    else {
      char v29 = 5;
    }
    v31[0] = (unint64_t)(v24 + v26 - 1) >> v28;
    v31[1] = (unint64_t)(v27 + [v16 height] - 1) >> v29;
    v31[2] = 1;
    v30[0] = v26;
    v30[1] = v27;
    v30[2] = 1;
    [v20 dispatchThreadgroups:v31 threadsPerThreadgroup:v30];
    [v20 endEncoding];
  }
}

- (void)encodeBlendTexturesToCommandBuffer:(id)a3 firstWarpedTexture:(id)a4 secondWarpedTexture:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 synthesizedTexture:(id)a8 timeScale:(float)a9 synthesizedImageWeight:(float)a10 destination:(id)a11
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a11;
  BOOL v25 = [a3 computeCommandEncoder];
  uint64_t v26 = v25;
  if (v25)
  {
    [v25 setComputePipelineState:self->_blendDCTexturesWithMasks];
    [v26 setTexture:v19 atIndex:0];
    [v26 setTexture:v20 atIndex:1];
    [v26 setTexture:v21 atIndex:2];
    [v26 setTexture:v22 atIndex:3];
    [v26 setTexture:v23 atIndex:4];
    [v26 setTexture:v24 atIndex:5];
    *(float *)int64x2_t v30 = a9;
    *(float *)&v30[1] = a10;
    [v26 setBytes:v30 length:8 atIndex:0];
    v29[0] = (unint64_t)([v24 width] + 15) >> 4;
    v29[1] = (unint64_t)([v24 height] + 15) >> 4;
    v29[2] = 1;
    int64x2_t v27 = vdupq_n_s64(0x10uLL);
    uint64_t v28 = 1;
    [v26 dispatchThreadgroups:v29 threadsPerThreadgroup:&v27];
    [v26 endEncoding];
  }
}

- (void)encodeErrorMapFilteringToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  if (self->_filterErrorMapByGaussian) {
    [(Forwarp *)self encodeErrorMapFilteringWithGaussianToCommandBuffer:a3 source:a4 destination:a5];
  }
  else {
    [(Forwarp *)self encodeErrorDownsampleToCommandBuffer:a3 source:a4 destination:a5];
  }
}

- (void)encodeErrorMapFilteringWithGaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_gaussian3x3CoefficientBuffer)
  {
    BOOL v11 = (MTLBuffer *)[(MTLDevice *)self->super._device newBufferWithLength:18 options:0];
    gaussian3x3CoefficientBuffer = self->_gaussian3x3CoefficientBuffer;
    self->_gaussian3x3CoefficientBuffer = v11;

    uint64_t v13 = [(MTLBuffer *)self->_gaussian3x3CoefficientBuffer contents];
    *(_WORD *)(v13 + 16) = 11087;
    *(_OWORD *)uint64_t v13 = Gaussian3x3FilterCoeffients_0;
  }
  id v14 = [v8 computeCommandEncoder];
  id v15 = v14;
  if (self->_supportsSIMDShuffle) {
    id v16 = &OBJC_IVAR___Forwarp__gaussian3x3FilterSIMDKernel;
  }
  else {
    id v16 = &OBJC_IVAR___Forwarp__gaussian3x3FilterKernel;
  }
  [v14 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v16)];
  [v15 setTexture:v9 atIndex:0];
  [v15 setTexture:v10 atIndex:1];
  [v15 setBuffer:self->_gaussian3x3CoefficientBuffer offset:0 atIndex:0];
  v19[0] = (unint64_t)([v10 width] + 3) >> 2;
  v19[1] = (unint64_t)([v10 height] + 31) >> 5;
  v19[2] = 1;
  long long v17 = xmmword_1DC85A370;
  uint64_t v18 = 1;
  [v15 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v15 endEncoding];
}

- (void)encodeErrorDownsampleToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_errorMapDownsampleKernel];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  unint64_t v11 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v12 = [v8 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)encodeLinearSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 splatBuffer:(id)a7 outputTexture:(id)a8 timeScale:(float)a9
{
  id v16 = a8;
  id v17 = a7;
  id v19 = a3;
  *(float *)&double v18 = a9;
  [(Forwarp *)self encodeSplattingToCommandBuffer:v19 input:a4 flow:a5 error:a6 outputBuffer:v17 timeScale:v18];
  [(Forwarp *)self encodeSplattingNormalizationToCommandBuffer:v19 splattingBuffer:v17 outputTexture:v16];
}

- (void)encodeSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 outputBuffer:(id)a7 timeScale:(float)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [v18 blitCommandEncoder];
  objc_msgSend(v19, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
  [v19 endEncoding];
  id v20 = [v18 computeCommandEncoder];

  id v21 = (id) [(MTLDevice *)self->super._device newBufferWithLength:20 options:0];
  id v22 = (float *)[v21 contents];
  *id v22 = a8;
  v22[3] = self->_errorTolerance;
  [v20 setComputePipelineState:self->_splattingKernel];
  [v20 setTexture:v17 atIndex:0];
  [v20 setTexture:v16 atIndex:1];

  [v20 setTexture:v15 atIndex:2];
  [v20 setBuffer:v21 offset:0 atIndex:0];
  [v20 setBuffer:v14 offset:0 atIndex:1];

  unint64_t v23 = (unint64_t)([v17 width] + 15) >> 4;
  uint64_t v24 = [v17 height];

  v27[0] = v23;
  v27[1] = (unint64_t)(v24 + 15) >> 4;
  v27[2] = 1;
  int64x2_t v25 = vdupq_n_s64(0x10uLL);
  uint64_t v26 = 1;
  [v20 dispatchThreadgroups:v27 threadsPerThreadgroup:&v25];
  [v20 endEncoding];
}

- (void)encodeSplattingNormalizationToCommandBuffer:(id)a3 splattingBuffer:(id)a4 outputTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_splattingNormalizationKernel];
  [v10 setBuffer:v9 offset:0 atIndex:0];

  [v10 setTexture:v8 atIndex:0];
  unint64_t v11 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v12 = [v8 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 forwardErrorMap:(id)a8 backwardErrorMap:(id)a9 forwarpConsistency:(id)a10 backwardConsistency:(id)a11 timeScale:(float)a12 destination:(id)a13
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  uint64_t v28 = [a3 computeCommandEncoder];
  if (v28)
  {
    *(float *)v38 = a12;
    float v29 = (float)(unint64_t)[v23 width];
    *(float *)&v38[2] = v29 / (float)(unint64_t)[v19 width];
    float v30 = (float)(unint64_t)[v19 width];
    *(float *)&v38[1] = v30 / (float)(unint64_t)[v23 width];
    [v28 setBytes:v38 length:12 atIndex:0];
    [v28 setTexture:v19 atIndex:0];
    id v33 = v20;
    [v28 setTexture:v20 atIndex:1];
    [v28 setTexture:v21 atIndex:2];
    [v28 setTexture:v22 atIndex:3];
    [v28 setTexture:v23 atIndex:4];
    [v28 setTexture:v24 atIndex:5];
    uint64_t v31 = &OBJC_IVAR___Forwarp__warpAndBlendTextures;
    uint64_t v32 = 6;
    if (v25 && v26)
    {
      [v28 setTexture:v25 atIndex:6];
      [v28 setTexture:v26 atIndex:7];
      uint64_t v31 = &OBJC_IVAR___Forwarp__warpAndBlendTexturesWithConsistency;
      uint64_t v32 = 8;
    }
    [v28 setTexture:v27 atIndex:v32];
    [v28 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v31)];
    v37[0] = (unint64_t)([v27 width] + 15) >> 4;
    v37[1] = (unint64_t)([v27 height] + 15) >> 4;
    v37[2] = 1;
    int64x2_t v35 = vdupq_n_s64(0x10uLL);
    uint64_t v36 = 1;
    [v28 dispatchThreadgroups:v37 threadsPerThreadgroup:&v35];
    [v28 endEncoding];
    id v20 = v33;
  }
}

- (BOOL)isLiteSynthesis
{
  return self->_isLiteSynthesis;
}

- (void)setIsLiteSynthesis:(BOOL)a3
{
  self->_isLiteSynthesis = a3;
}

- (float)errorTolerance
{
  return self->_errorTolerance;
}

- (void)setErrorTolerance:(float)a3
{
  self->_errorTolerance = a3;
}

- (BOOL)createOcclusionMask
{
  return self->_createOcclusionMask;
}

- (void)setCreateOcclusionMask:(BOOL)a3
{
  self->_createOcclusionMask = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)filterErrorMapByGaussian
{
  return self->_filterErrorMapByGaussian;
}

- (BOOL)limitBilinearInterpolation
{
  return self->_limitBilinearInterpolation;
}

- (void)setLimitBilinearInterpolation:(BOOL)a3
{
  self->_limitBilinearInterpolation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpAndBlendTexturesWithConsistency, 0);
  objc_storeStrong((id *)&self->_warpAndBlendTextures, 0);
  objc_storeStrong((id *)&self->_errorMapDownsampleKernel, 0);
  objc_storeStrong((id *)&self->_splattingNormalizationKernel, 0);
  objc_storeStrong((id *)&self->_splattingKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3CoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterSIMDKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterKernel, 0);
  objc_storeStrong((id *)&self->_blendWarpedImagesWithMaskAndFlowConsistency, 0);
  objc_storeStrong((id *)&self->_blendDCTexturesWithMasks, 0);
  objc_storeStrong((id *)&self->_errorMapDilation, 0);
  objc_storeStrong((id *)&self->_convert2TextureWithMask, 0);
  objc_storeStrong((id *)&self->_blendWarpedImagesWithMaskTextures, 0);
  objc_storeStrong((id *)&self->_blendWarpedImages, 0);
  objc_storeStrong((id *)&self->_initializeBest, 0);
  objc_storeStrong((id *)&self->_convert2Texture, 0);
  objc_storeStrong((id *)&self->_updateOutputLiteWarp, 0);
  objc_storeStrong((id *)&self->_updateOutputFullWarpMinErrorOffset, 0);
  objc_storeStrong((id *)&self->_updateOutputFullWarp, 0);
  objc_storeStrong((id *)&self->_updateBest, 0);
}

@end