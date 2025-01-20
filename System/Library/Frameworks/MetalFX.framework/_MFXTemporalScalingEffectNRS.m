@interface _MFXTemporalScalingEffectNRS
- (BOOL)isDepthReversed;
- (BOOL)reset;
- (BOOL)reversedDepth;
- (CGPoint)jitterOffset;
- (CGPoint)motionVectorScale;
- (CGPoint)previousJitterOffset;
- (MTLFence)fence;
- (MTLTexture)colorTexture;
- (MTLTexture)debugTexture;
- (MTLTexture)depthTexture;
- (MTLTexture)exposureTexture;
- (MTLTexture)motionTexture;
- (MTLTexture)outputTexture;
- (MTLTexture)reactiveMaskTexture;
- (_MFXTemporalScalingEffectNRS)initWithDevice:(id)a3 descriptor:(id)a4;
- (__n128)currentViewToClipMatrix;
- (__n128)currentWorldToViewMatrix;
- (__n128)previousViewToClipMatrix;
- (__n128)previousWorldToViewMatrix;
- (__n128)setCurrentViewToClipMatrix:(__n128)a3;
- (__n128)setCurrentWorldToViewMatrix:(__n128)a3;
- (__n128)setPreviousViewToClipMatrix:(__n128)a3;
- (__n128)setPreviousWorldToViewMatrix:(__n128)a3;
- (float)inputContentMaxScale;
- (float)inputContentMinScale;
- (float)jitterOffsetX;
- (float)jitterOffsetY;
- (float)motionVectorScaleX;
- (float)motionVectorScaleY;
- (float)preExposure;
- (id).cxx_construct;
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)depthTextureFormat;
- (unint64_t)depthTextureUsage;
- (unint64_t)executionMode;
- (unint64_t)inputContentHeight;
- (unint64_t)inputContentWidth;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)motionTextureFormat;
- (unint64_t)motionTextureUsage;
- (unint64_t)outputHeight;
- (unint64_t)outputTextureFormat;
- (unint64_t)outputTextureUsage;
- (unint64_t)outputWidth;
- (unint64_t)reactiveTextureUsage;
- (void)encodeToCommandBuffer:(id)a3;
- (void)encodeToCommandQueue:(id)a3;
- (void)initExposureWithDevice:(void *)a3 library:(int)a4 autoexposureEnabled:;
- (void)initOutputResolutionPassesWithDevice:(void *)a3 library:;
- (void)initRenderResolutionPassesWithDevice:(void *)a3 library:;
- (void)setColorTexture:(id)a3;
- (void)setDebugTexture:(id)a3;
- (void)setDepthReversed:(BOOL)a3;
- (void)setDepthTexture:(id)a3;
- (void)setExposureTexture:(id)a3;
- (void)setFence:(id)a3;
- (void)setInputContentHeight:(unint64_t)a3;
- (void)setInputContentWidth:(unint64_t)a3;
- (void)setJitterOffset:(CGPoint)a3;
- (void)setJitterOffsetX:(float)a3;
- (void)setJitterOffsetY:(float)a3;
- (void)setMotionTexture:(id)a3;
- (void)setMotionVectorScale:(CGPoint)a3;
- (void)setMotionVectorScaleX:(float)a3;
- (void)setMotionVectorScaleY:(float)a3;
- (void)setOutputTexture:(id)a3;
- (void)setPreExposure:(float)a3;
- (void)setPreviousJitterOffset:(CGPoint)a3;
- (void)setReactiveMaskTexture:(id)a3;
- (void)setReset:(BOOL)a3;
- (void)setReversedDepth:(BOOL)a3;
@end

@implementation _MFXTemporalScalingEffectNRS

- (_MFXTemporalScalingEffectNRS)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)_MFXTemporalScalingEffectNRS;
  v8 = [(_MTLFXEffect *)&v32 init];
  v8->_executionMode = 1;
  v8->_colorTextureUsage = 1;
  v8->_depthTextureUsage = 1;
  v8->_motionTextureUsage = 1;
  v8->_reactiveTextureUsage = 1;
  v8->_colorTextureFormat = [v7 colorTextureFormat];
  v8->_depthTextureFormat = [v7 depthTextureFormat];
  v8->_motionTextureFormat = [v7 motionTextureFormat];
  uint64_t v9 = [v7 outputTextureFormat];
  uint64_t v10 = 115;
  if (v9) {
    uint64_t v10 = v9;
  }
  v8->_outputTextureFormat = v10;
  uint64_t v11 = [v7 inputWidth];
  v8->_unint64_t inputWidth = v11;
  v8->_inputContentWidth = v11;
  uint64_t v12 = [v7 inputHeight];
  v8->_unint64_t inputHeight = v12;
  v8->_inputContentHeight = v12;
  v8->_unint64_t outputWidth = [v7 outputWidth];
  unint64_t v13 = [v7 outputHeight];
  v8->_outputHeight = v13;
  unint64_t outputWidth = v8->_outputWidth;
  unint64_t inputWidth = v8->_inputWidth;
  unint64_t inputHeight = v8->_inputHeight;
  if ([v7 isInputContentPropertiesEnabled])
  {
    [v7 inputContentMinScale];
    v8->_inputContentMinScale = v17;
    [v7 inputContentMaxScale];
  }
  else
  {
    float v19 = (float)outputWidth / (float)inputWidth;
    float v20 = (float)v13 / (float)inputHeight;
    float v21 = fminf(v19, v20);
    float v18 = fmaxf(v19, v20);
    v8->_inputContentMinScale = v21;
  }
  v8->_inputContentMaxScale = v18;
  if (v8->_inputContentMinScale >= 1.0 && v18 <= 2.0)
  {
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = [v23 pathForResource:@"default" ofType:@"metallib"];
    v25 = [NSURL URLWithString:v24];
    id v31 = 0;
    v26 = (void *)[v6 newLibraryWithURL:v25 error:&v31];
    id v27 = v31;

    uint64_t v28 = [v6 newBufferWithLength:1 options:32];
    internal_is_history_invalid = v8->_internal_is_history_invalid;
    v8->_internal_is_history_invalid = (MTLBuffer *)v28;

    -[_MFXTemporalScalingEffectNRS initExposureWithDevice:library:autoexposureEnabled:]((uint64_t)v8, v6, v26, [v7 isAutoExposureEnabled]);
    -[_MFXTemporalScalingEffectNRS initRenderResolutionPassesWithDevice:library:]((uint64_t)v8, v6, v26);
    -[_MFXTemporalScalingEffectNRS initOutputResolutionPassesWithDevice:library:]((uint64_t)v8, v6, v26);
    v8->_reset = 1;
    v22 = v8;
  }
  else
  {
    MTLReportFailure();
    v22 = 0;
  }

  return v22;
}

- (void)initExposureWithDevice:(void *)a3 library:(int)a4 autoexposureEnabled:
{
  id v20 = a2;
  id v7 = a3;
  if (a1)
  {
    *(_DWORD *)(a1 + 252) = 1065353216;
    *(_DWORD *)(a1 + 56) = 1040187392;
    uint64_t v8 = [v20 newBufferWithLength:2 options:0];
    uint64_t v9 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v8;

    uint64_t v10 = [v20 newBufferWithLength:2 options:0];
    uint64_t v11 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v10;

    *(_WORD *)[*(id *)(a1 + 64) contents] = COERCE_UNSIGNED_INT(1.0);
    *(_WORD *)[*(id *)(a1 + 72) contents] = COERCE_UNSIGNED_INT(1.0);
    if (a4)
    {
      uint64_t v12 = computeKernel(v7, v20, @"luma_log_sum_nrs", 0, 0, 0, 1);
      unint64_t v13 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v12;

      uint64_t v14 = [v20 newBufferWithLength:0x2000 options:0];
      v15 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v14;

      v16 = objc_opt_new();
      [v16 setConstantValue:a1 + 56 type:3 atIndex:9];
      uint64_t v17 = computeKernel(v7, v20, @"luma_log_sum_to_exposure", 0, v16, 0x400uLL, 1);
      float v18 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v17;
    }
    else
    {
      uint64_t v19 = computeKernel(v7, v20, @"exposure_texture_to_buffer", 0, 0, 0, 0);
      v16 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v19;
    }
  }
}

- (void)initRenderResolutionPassesWithDevice:(void *)a3 library:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [v5 supportsFamily:1004];
    char v36 = v7;
    if (v7) {
      int v8 = 0;
    }
    else {
      int v8 = [v5 supportsFamily:1004];
    }
    char v35 = v8;
    char v34 = [v5 supportsFamily:1001];
    uint64_t v9 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*(void *)(a1 + 376) height:*(void *)(a1 + 384) mipmapped:0];
    uint64_t v10 = v9;
    if (v8 | v7) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 3;
    }
    [v9 setUsage:v11];
    [v10 setStorageMode:2];
    [v10 setCompressionMode:1];
    uint64_t v12 = [v5 newTextureWithDescriptor:v10];
    unint64_t v13 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v12;

    [v10 setPixelFormat:65];
    uint64_t v14 = [v5 newTextureWithDescriptor:v10];
    v15 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v14;

    [v10 setPixelFormat:115];
    uint64_t v16 = [v5 newTextureWithDescriptor:v10];
    uint64_t v17 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v16;

    [v10 setPixelFormat:115];
    uint64_t v18 = [v5 newTextureWithDescriptor:v10];
    uint64_t v19 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = v18;

    uint64_t v20 = [v5 newTextureWithDescriptor:v10];
    float v21 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v20;

    uint64_t v22 = [v5 newTextureWithDescriptor:v10];
    v23 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v22;

    v24 = objc_opt_new();
    [v24 setConstantValue:&v35 type:53 atIndex:0];
    [v24 setConstantValue:&v36 type:53 atIndex:1];
    [v24 setConstantValue:&v34 type:53 atIndex:2];
    if (v36)
    {
      id v33 = 0;
      uint64_t v27 = tileKernel(v6, v5, @"unified_low_resolution_tile", &v33, v24, 512, v25, v26, 115, 65);
      id v28 = v33;
      v29 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v27;
    }
    else
    {
      id v32 = 0;
      uint64_t v30 = computeKernel(v6, v5, @"unified_low_resolution_tile", &v32, v24, 0x200uLL, 1);
      id v28 = v32;
      id v31 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v30;

      *(unsigned char *)(a1 + 176) = v35;
    }
  }
}

- (void)initOutputResolutionPassesWithDevice:(void *)a3 library:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [v5 supportsFamily:1004];
    char v32 = v7;
    if (v7) {
      int v8 = 0;
    }
    else {
      int v8 = [v5 supportsFamily:1004];
    }
    char v31 = v8;
    char v30 = [v5 supportsFamily:1001];
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    MTLPixelFormatGetInfoForDevice();
    char v29 = 0;
    uint64_t v9 = 2;
    if (v8 | v7) {
      uint64_t v9 = 4;
    }
    *(void *)(a1 + 288) = v9;
    uint64_t v10 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*(void *)(a1 + 392) height:*(void *)(a1 + 400) mipmapped:0];
    [v10 setUsage:*(void *)(a1 + 288) | 1];
    [v10 setStorageMode:2];
    [v10 setCompressionMode:1];
    uint64_t v11 = [v5 newTextureWithDescriptor:v10];
    uint64_t v12 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v11;

    uint64_t v13 = [v5 newTextureWithDescriptor:v10];
    uint64_t v14 = *(void **)(a1 + 192);
    *(void *)(a1 + 192) = v13;

    uint64_t v15 = [v5 newTextureWithDescriptor:v10];
    uint64_t v16 = *(void **)(a1 + 200);
    *(void *)(a1 + 200) = v15;

    uint64_t v17 = [v5 newTextureWithDescriptor:v10];
    uint64_t v18 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = v17;

    *(unsigned char *)(a1 + 233) = 0;
    uint64_t v19 = objc_opt_new();
    [v19 setConstantValue:&v31 type:53 atIndex:0];
    [v19 setConstantValue:&v32 type:53 atIndex:1];
    [v19 setConstantValue:&v30 type:53 atIndex:2];
    [v19 setConstantValue:&v29 type:53 atIndex:3];
    [v19 setConstantValue:a1 + 56 type:3 atIndex:4];
    if (v32)
    {
      id v28 = 0;
      uint64_t v22 = tileKernel(v6, v5, @"unified_pass_tile", &v28, v19, 512, v20, v21, 115, 115);
      id v23 = v28;
      v24 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v22;
    }
    else
    {
      id v27 = 0;
      uint64_t v25 = computeKernel(v6, v5, @"unified_pass_tile", &v27, v19, 0x200uLL, 1);
      id v23 = v27;
      uint64_t v26 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v25;

      *(unsigned char *)(a1 + 232) = v31;
    }
  }
}

- (void)setJitterOffsetX:(float)a3
{
  *(float *)self->_jitterOffset = a3;
}

- (float)jitterOffsetX
{
  uint64_t v2 = *(void *)self->_jitterOffset;
  LODWORD(result) = v2;
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  *(float *)&self->_jitterOffset[4] = a3;
}

- (float)jitterOffsetY
{
  return *(float *)&self->_jitterOffset[4];
}

- (void)setMotionVectorScaleX:(float)a3
{
  *(float *)self->_motionVectorScale = a3;
}

- (float)motionVectorScaleX
{
  uint64_t v2 = *(void *)self->_motionVectorScale;
  LODWORD(result) = v2;
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  *(float *)&self->_motionVectorScale[4] = a3;
}

- (float)motionVectorScaleY
{
  return *(float *)&self->_motionVectorScale[4];
}

- (void)setReversedDepth:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (BOOL)reversedDepth
{
  return self->_reversedDepth;
}

- (void)setJitterOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  *(float32x2_t *)self->_jitterOffset = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)jitterOffset
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)self->_jitterOffset);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (void)setMotionVectorScale:(CGPoint)a3
{
  CGFloat y = a3.y;
  *(float32x2_t *)self->_motionVectorScale = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)motionVectorScale
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)self->_motionVectorScale);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (void)encodeToCommandBuffer:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v71 = a3;
  [(_MTLFXEffect *)self _beginEncode];
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_colorTexture, self->_depthTexture, self->_motionTexture, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    unint64_t inputContentWidth = self->_inputContentWidth;
    unint64_t inputContentHeight = self->_inputContentHeight;
    float inputContentMinScale = self->_inputContentMinScale;
    float inputContentMaxScale = self->_inputContentMaxScale;
    float outputWidth = (float)self->_outputWidth;
    float outputHeight = (float)self->_outputHeight;
    float v10 = fminf(outputWidth / (float)inputContentWidth, outputHeight / (float)inputContentHeight);
    if (v10 < inputContentMinScale)
    {
      double v68 = v10;
      double v69 = inputContentMinScale;
      MTLReportFailure();
    }
    float v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > inputContentMaxScale)
    {
      double v68 = v11;
      double v69 = inputContentMaxScale;
      MTLReportFailure();
    }
    if ([(MTLTexture *)self->_outputTexture storageMode] != 2) {
      MTLReportFailure();
    }
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v99, 0, (uint64_t)self, 0, 0, 0);
  if (MTLTraceEnabled())
  {
    [v71 globalTraceObjectID];
    kdebug_trace();
  }
  uint64_t v12 = [v71 computeCommandEncoder];
  [(_MTLFXEffect *)self _didCreateComputeCommandEncoder:v12 forEncode:self->super.super._encodeID];
  if (self->_fence) {
    objc_msgSend(v12, "waitForFence:");
  }
  if (self->_internalExposure.lumaLogSums)
  {
    int v13 = self->_inputContentWidth;
    int v14 = self->_inputContentHeight;
    WORD1(v100) = v14;
    LOWORD(v100) = v13;
    LODWORD(v85[0]) = v14 * v13;
    [v12 setComputePipelineState:self->_internalExposure.lumaLogSumKernel];
    [v12 setTexture:self->_colorTexture atIndex:0];
    [v12 setBytes:&v100 length:4 atIndex:1];
    [v12 setBuffer:self->_internalExposure.lumaLogSums offset:0 atIndex:0];
    long long v97 = xmmword_245162850;
    uint64_t v98 = 1;
    uint64_t v95 = [(MTLComputePipelineState *)self->_internalExposure.lumaLogSumKernel threadExecutionWidth];
    int64x2_t v96 = vdupq_n_s64(1uLL);
    [v12 dispatchThreadgroups:&v97 threadsPerThreadgroup:&v95];
    [v12 setComputePipelineState:self->_internalExposure.lumaLogSumToExposureKernel];
    [v12 setBuffer:self->_internalExposure.lumaLogSums offset:0 atIndex:0];
    [v12 setBytes:v85 length:4 atIndex:1];
    [v12 setBuffer:self->_internalExposure.currExposure offset:0 atIndex:2];
    [v12 setBuffer:self->_internalExposure.prevExposure offset:0 atIndex:3];
    [v12 setBuffer:self->_internal_is_history_invalid offset:0 atIndex:4];
    [v12 setBytes:&self->_reset length:1 atIndex:5];
    int64x2_t v93 = vdupq_n_s64(1uLL);
    uint64_t v94 = 1;
    long long v91 = xmmword_245162860;
    uint64_t v92 = 1;
    [v12 dispatchThreadgroups:&v93 threadsPerThreadgroup:&v91];
  }
  else
  {
    [v12 setComputePipelineState:self->_internalExposure.exposureToBufferKernel];
    [v12 setTexture:self->_exposureTexture atIndex:0];
    [v12 setBuffer:self->_internalExposure.currExposure offset:0 atIndex:0];
    [v12 setBuffer:self->_internalExposure.prevExposure offset:0 atIndex:1];
    [v12 setBuffer:self->_internal_is_history_invalid offset:0 atIndex:2];
    [v12 setBytes:&self->_reset length:1 atIndex:3];
    int64x2_t v89 = vdupq_n_s64(1uLL);
    uint64_t v90 = 1;
    int64x2_t v87 = v89;
    uint64_t v88 = 1;
    [v12 dispatchThreads:&v89 threadsPerThreadgroup:&v87];
  }
  unint64_t v15 = self->_inputContentWidth;
  unint64_t v16 = self->_inputContentHeight;
  v86[1] = v16;
  v86[0] = v15;
  v17.f32[0] = (float)v15;
  v17.f32[1] = (float)v16;
  float32x2_t v18 = vrecpe_f32(v17);
  float32x2_t v19 = vmul_f32(v18, vrecps_f32(v17, v18));
  float32x2_t v20 = vmul_f32(v19, vrecps_f32(v17, v19));
  uint64_t v21 = *(void *)self->_jitterOffset;
  v85[0] = vmul_f32(*(float32x2_t *)self->_motionVectorScale, v20);
  v85[1] = v21;
  float v22 = 1.0;
  if (!self->_reversedDepth) {
    float v22 = -1.0;
  }
  float v84 = v22;
  v70 = self->_outputTexture;
  p_internalOutputResolution = &self->_internalOutputResolution;
  if (self->_internalOutputResolution.emulateSRGB)
  {
    int64_t outputTextureFormat = self->_outputTextureFormat;
    if (outputTextureFormat > 70)
    {
      if (outputTextureFormat == 71)
      {
        uint64_t v25 = 70;
        goto LABEL_28;
      }
      if (outputTextureFormat == 81)
      {
        uint64_t v25 = 80;
        goto LABEL_28;
      }
    }
    else
    {
      if (outputTextureFormat == 11)
      {
        uint64_t v25 = 10;
        goto LABEL_28;
      }
      if (outputTextureFormat == 31)
      {
        uint64_t v25 = 30;
LABEL_28:
        uint64_t v26 = (void *)[(MTLTexture *)v70 newTextureViewWithPixelFormat:v25];

        v82[0] = MEMORY[0x263EF8330];
        v82[1] = 3221225472;
        v82[2] = __54___MFXTemporalScalingEffectNRS_encodeToCommandBuffer___block_invoke;
        v82[3] = &unk_2651C6B10;
        v70 = v26;
        v83 = v70;
        [v71 addCompletedHandler:v82];

        goto LABEL_29;
      }
    }
    uint64_t v25 = 0;
    goto LABEL_28;
  }
LABEL_29:
  p_internalRenderResolution = &self->_internalRenderResolution;
  if (self->_internalRenderResolution.tileKernel)
  {
    if (v12)
    {
      [v12 endEncoding];
    }
    v100 = p_internalRenderResolution->colorRangeReduced;
    v101 = self->_internalRenderResolution.dilatedFlow;
    v102 = self->_internalRenderResolution.pixelData;
    v103 = self->_internalRenderResolution.variance0;
    v104 = self->_internalRenderResolution.variance1;
    v105 = self->_internalRenderResolution.variance2;
    id v28 = [MEMORY[0x263F129A0] renderPassDescriptor];
    [v28 setTileWidth:32];
    [v28 setTileHeight:16];
    [v28 setThreadgroupMemoryLength:10080];
    for (uint64_t i = 0; i != 6; ++i)
    {
      char v30 = *(&v100 + i);
      char v31 = [v28 colorAttachments];
      char v32 = [v31 objectAtIndexedSubscript:i];
      [v32 setLoadAction:0];

      long long v33 = [v28 colorAttachments];
      long long v34 = [v33 objectAtIndexedSubscript:i];
      objc_msgSend(v34, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

      long long v35 = [v28 colorAttachments];
      uint64_t v36 = [v35 objectAtIndexedSubscript:i];
      [v36 setStoreAction:1];

      v37 = [v28 colorAttachments];
      v38 = [v37 objectAtIndexedSubscript:i];
      [v38 setTexture:v30];
    }
    v39 = [v71 renderCommandEncoderWithDescriptor:v28];
    [(_MTLFXEffect *)self _didCreateRenderCommandEncoder:v39 forEncode:self->super.super._encodeID];
    [v39 setTileTexture:self->_colorTexture atIndex:0];
    [v39 setTileTexture:self->_depthTexture atIndex:1];
    [v39 setTileTexture:self->_motionTexture atIndex:2];
    [v39 setTileBytes:&v84 length:4 atIndex:0];
    [v39 setTileBytes:v85 length:16 atIndex:1];
    [v39 setTileBytes:v86 length:4 atIndex:2];
    [v39 setTileBytes:&self->_preExposure length:4 atIndex:3];
    [v39 setTileBuffer:self->_internalExposure.currExposure offset:0 atIndex:4];
    [v39 setTileBuffer:self->_internal_is_history_invalid offset:0 atIndex:6];
    [v39 setThreadgroupMemoryLength:5760 offset:0 atIndex:0];
    [v39 setThreadgroupMemoryLength:1440 offset:5760 atIndex:1];
    [v39 setThreadgroupMemoryLength:2880 offset:7200 atIndex:2];
    [v39 setRenderPipelineState:self->_internalRenderResolution.tileKernel];
    long long v80 = xmmword_245162870;
    uint64_t v81 = 1;
    [v39 dispatchThreadsPerTile:&v80];
    [v39 endEncoding];

    for (uint64_t j = 40; j != -8; j -= 8)
    p_tileKernel = &self->_internalOutputResolution.tileKernel;
    if (!self->_internalOutputResolution.tileKernel)
    {
LABEL_37:
      uint64_t v12 = [v71 computeCommandEncoder];
      [(_MTLFXEffect *)self _didCreateComputeCommandEncoder:v12 forEncode:self->super.super._encodeID];
LABEL_51:
      unint64_t v58 = self->_outputWidth;
      unint64_t v59 = self->_outputHeight;
      [v12 setTexture:p_internalRenderResolution->colorRangeReduced atIndex:0];
      [v12 setTexture:self->_internalRenderResolution.pixelData atIndex:1];
      [v12 setTexture:self->_internalRenderResolution.dilatedFlow atIndex:2];
      [v12 setTexture:p_internalOutputResolution->prevHistory0 atIndex:4];
      [v12 setTexture:self->_internalOutputResolution.prevHistory1 atIndex:5];
      [v12 setTexture:self->_internalOutputResolution.currHistory0 atIndex:6];
      [v12 setTexture:self->_internalOutputResolution.currHistory1 atIndex:7];
      [v12 setTexture:v70 atIndex:8];
      [v12 setTexture:self->_internalRenderResolution.variance0 atIndex:12];
      [v12 setTexture:self->_internalRenderResolution.variance1 atIndex:13];
      [v12 setTexture:self->_internalRenderResolution.variance2 atIndex:14];
      [v12 setBytes:v85 length:16 atIndex:1];
      [v12 setBytes:v86 length:4 atIndex:2];
      [v12 setBytes:&self->_preExposure length:4 atIndex:3];
      [v12 setBuffer:self->_internalExposure.currExposure offset:0 atIndex:4];
      [v12 setBuffer:self->_internalExposure.prevExposure offset:0 atIndex:5];
      [v12 setBuffer:self->_internal_is_history_invalid offset:0 atIndex:6];
      [v12 setThreadgroupMemoryLength:3840 atIndex:0];
      [v12 setThreadgroupMemoryLength:7680 atIndex:1];
      [v12 setThreadgroupMemoryLength:7680 atIndex:2];
      if (self->_internalOutputResolution.kernelUsesImageblock) {
        [v12 setImageblockWidth:32 height:16];
      }
      [v12 setComputePipelineState:self->_internalOutputResolution.kernel];
      v74[0] = (v58 + 31) >> 5;
      v74[1] = (v59 + 15) >> 4;
      v74[2] = 1;
      long long v72 = xmmword_245162870;
      uint64_t v73 = 1;
      [v12 dispatchThreadgroups:v74 threadsPerThreadgroup:&v72];
      if (self->_fence) {
        objc_msgSend(v12, "updateFence:");
      }
      if (v12)
      {
        [v12 endEncoding];
      }
      goto LABEL_57;
    }
  }
  else
  {
    unint64_t inputWidth = self->_inputWidth;
    unint64_t inputHeight = self->_inputHeight;
    [v12 setTexture:self->_colorTexture atIndex:0];
    [v12 setTexture:self->_depthTexture atIndex:1];
    [v12 setTexture:self->_motionTexture atIndex:2];
    [v12 setTexture:p_internalRenderResolution->colorRangeReduced atIndex:3];
    [v12 setTexture:self->_internalRenderResolution.dilatedFlow atIndex:4];
    [v12 setTexture:self->_internalRenderResolution.pixelData atIndex:5];
    [v12 setTexture:self->_internalRenderResolution.variance0 atIndex:6];
    [v12 setTexture:self->_internalRenderResolution.variance1 atIndex:7];
    [v12 setTexture:self->_internalRenderResolution.variance2 atIndex:8];
    [v12 setBytes:&v84 length:4 atIndex:0];
    [v12 setBytes:v85 length:16 atIndex:1];
    [v12 setBytes:v86 length:4 atIndex:2];
    [v12 setBytes:&self->_preExposure length:4 atIndex:3];
    [v12 setBuffer:self->_internalExposure.currExposure offset:0 atIndex:4];
    [v12 setBuffer:self->_internal_is_history_invalid offset:0 atIndex:6];
    [v12 setThreadgroupMemoryLength:5760 atIndex:0];
    [v12 setThreadgroupMemoryLength:1440 atIndex:1];
    [v12 setThreadgroupMemoryLength:2880 atIndex:2];
    if (self->_internalRenderResolution.kernelUsesImageblock) {
      [v12 setImageblockWidth:32 height:16];
    }
    [v12 setComputePipelineState:self->_internalRenderResolution.kernel];
    v79[0] = (inputWidth + 31) >> 5;
    v79[1] = (inputHeight + 15) >> 4;
    v79[2] = 1;
    long long v77 = xmmword_245162870;
    uint64_t v78 = 1;
    [v12 dispatchThreadgroups:v79 threadsPerThreadgroup:&v77];
    p_tileKernel = &self->_internalOutputResolution.tileKernel;
    if (!self->_internalOutputResolution.tileKernel)
    {
      if (v12) {
        goto LABEL_51;
      }
      goto LABEL_37;
    }
    if (v12)
    {
      [v12 endEncoding];
    }
  }
  v100 = self->_internalOutputResolution.currHistory0;
  v101 = self->_internalOutputResolution.currHistory1;
  v102 = v70;
  v44 = [MEMORY[0x263F129A0] renderPassDescriptor];
  [v44 setTileWidth:32];
  [v44 setTileHeight:16];
  [v44 setThreadgroupMemoryLength:19200];
  for (uint64_t k = 0; k != 3; ++k)
  {
    v46 = *(&v100 + k);
    v47 = [v44 colorAttachments];
    v48 = [v47 objectAtIndexedSubscript:k];
    [v48 setLoadAction:0];

    v49 = [v44 colorAttachments];
    v50 = [v49 objectAtIndexedSubscript:k];
    objc_msgSend(v50, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    v51 = [v44 colorAttachments];
    v52 = [v51 objectAtIndexedSubscript:k];
    [v52 setStoreAction:1];

    v53 = [v44 colorAttachments];
    v54 = [v53 objectAtIndexedSubscript:k];
    [v54 setTexture:v46];
  }
  v55 = [v71 renderCommandEncoderWithDescriptor:v44];
  [(_MTLFXEffect *)self _didCreateRenderCommandEncoder:v55 forEncode:self->super.super._encodeID];
  [v55 setTileTexture:p_internalRenderResolution->colorRangeReduced atIndex:0];
  [v55 setTileTexture:self->_internalRenderResolution.pixelData atIndex:1];
  [v55 setTileTexture:self->_internalRenderResolution.dilatedFlow atIndex:2];
  [v55 setTileTexture:p_internalOutputResolution->prevHistory0 atIndex:4];
  [v55 setTileTexture:self->_internalOutputResolution.prevHistory1 atIndex:5];
  [v55 setTileTexture:self->_internalRenderResolution.variance0 atIndex:12];
  [v55 setTileTexture:self->_internalRenderResolution.variance1 atIndex:13];
  [v55 setTileTexture:self->_internalRenderResolution.variance2 atIndex:14];
  [v55 setTileBytes:v85 length:16 atIndex:1];
  [v55 setTileBytes:v86 length:4 atIndex:2];
  [v55 setTileBytes:&self->_preExposure length:4 atIndex:3];
  [v55 setTileBuffer:self->_internalExposure.currExposure offset:0 atIndex:4];
  [v55 setTileBuffer:self->_internalExposure.prevExposure offset:0 atIndex:5];
  [v55 setTileBuffer:self->_internal_is_history_invalid offset:0 atIndex:6];
  [v55 setThreadgroupMemoryLength:3840 offset:0 atIndex:0];
  [v55 setThreadgroupMemoryLength:7680 offset:3840 atIndex:1];
  [v55 setThreadgroupMemoryLength:7680 offset:11520 atIndex:2];
  [v55 setRenderPipelineState:*p_tileKernel];
  long long v75 = xmmword_245162870;
  uint64_t v76 = 1;
  [v55 dispatchThreadsPerTile:&v75];
  fence = self->_fence;
  if (fence) {
    [v55 updateFence:fence afterStages:2];
  }
  [v55 endEncoding];

  for (uint64_t m = 16; m != -8; m -= 8)
LABEL_57:
  v60 = p_internalOutputResolution->prevHistory0;
  objc_storeStrong((id *)&self->_internalOutputResolution.prevHistory0, self->_internalOutputResolution.currHistory0);
  currHistory0 = self->_internalOutputResolution.currHistory0;
  self->_internalOutputResolution.currHistory0 = v60;
  v62 = v60;

  v63 = self->_internalOutputResolution.prevHistory1;
  objc_storeStrong((id *)&self->_internalOutputResolution.prevHistory1, self->_internalOutputResolution.currHistory1);
  currHistory1 = self->_internalOutputResolution.currHistory1;
  self->_internalOutputResolution.currHistory1 = v63;
  v65 = v63;

  v66 = self->_internalExposure.prevExposure;
  objc_storeStrong((id *)&self->_internalExposure.prevExposure, self->_internalExposure.currExposure);
  currExposure = self->_internalExposure.currExposure;
  self->_internalExposure.currExposure = v66;

  self->_reset = 0;
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v99);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  -[_MFXTemporalScalingEffectNRS encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  [v4 commit];
}

- (unint64_t)colorTextureUsage
{
  return self->_colorTextureUsage;
}

- (unint64_t)depthTextureUsage
{
  return self->_depthTextureUsage;
}

- (unint64_t)motionTextureUsage
{
  return self->_motionTextureUsage;
}

- (unint64_t)reactiveTextureUsage
{
  return self->_reactiveTextureUsage;
}

- (unint64_t)outputTextureUsage
{
  return self->_outputTextureUsage;
}

- (unint64_t)inputContentWidth
{
  return self->_inputContentWidth;
}

- (void)setInputContentWidth:(unint64_t)a3
{
  self->_unint64_t inputContentWidth = a3;
}

- (unint64_t)inputContentHeight
{
  return self->_inputContentHeight;
}

- (void)setInputContentHeight:(unint64_t)a3
{
  self->_unint64_t inputContentHeight = a3;
}

- (MTLTexture)colorTexture
{
  return self->_colorTexture;
}

- (void)setColorTexture:(id)a3
{
}

- (MTLTexture)depthTexture
{
  return self->_depthTexture;
}

- (void)setDepthTexture:(id)a3
{
}

- (MTLTexture)motionTexture
{
  return self->_motionTexture;
}

- (void)setMotionTexture:(id)a3
{
}

- (MTLTexture)outputTexture
{
  return self->_outputTexture;
}

- (void)setOutputTexture:(id)a3
{
}

- (BOOL)reset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (BOOL)isDepthReversed
{
  return self->_reversedDepth;
}

- (void)setDepthReversed:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
}

- (unint64_t)depthTextureFormat
{
  return self->_depthTextureFormat;
}

- (unint64_t)motionTextureFormat
{
  return self->_motionTextureFormat;
}

- (unint64_t)outputTextureFormat
{
  return self->_outputTextureFormat;
}

- (unint64_t)inputWidth
{
  return self->_inputWidth;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (float)inputContentMinScale
{
  return self->_inputContentMinScale;
}

- (float)inputContentMaxScale
{
  return self->_inputContentMaxScale;
}

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
}

- (CGPoint)previousJitterOffset
{
  double x = self->_previousJitterOffset.x;
  double y = self->_previousJitterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousJitterOffset:(CGPoint)a3
{
  self->_previousJitterOffset = a3;
}

- (MTLTexture)exposureTexture
{
  return self->_exposureTexture;
}

- (void)setExposureTexture:(id)a3
{
}

- (float)preExposure
{
  return self->_preExposure;
}

- (void)setPreExposure:(float)a3
{
  self->_preExposure = a3;
}

- (__n128)currentWorldToViewMatrix
{
  return a1[29];
}

- (__n128)setCurrentWorldToViewMatrix:(__n128)a3
{
  result[29] = a2;
  result[30] = a3;
  result[31] = a4;
  result[32] = a5;
  return result;
}

- (__n128)currentViewToClipMatrix
{
  return a1[33];
}

- (__n128)setCurrentViewToClipMatrix:(__n128)a3
{
  result[33] = a2;
  result[34] = a3;
  result[35] = a4;
  result[36] = a5;
  return result;
}

- (__n128)previousWorldToViewMatrix
{
  return a1[37];
}

- (__n128)setPreviousWorldToViewMatrix:(__n128)a3
{
  result[37] = a2;
  result[38] = a3;
  result[39] = a4;
  result[40] = a5;
  return result;
}

- (__n128)previousViewToClipMatrix
{
  return a1[41];
}

- (__n128)setPreviousViewToClipMatrix:(__n128)a3
{
  result[41] = a2;
  result[42] = a3;
  result[43] = a4;
  result[44] = a5;
  return result;
}

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
}

- (MTLTexture)reactiveMaskTexture
{
  return self->_reactiveMaskTexture;
}

- (void)setReactiveMaskTexture:(id)a3
{
}

- (unint64_t)executionMode
{
  return self->_executionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_exposureTexture, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_motionTexture, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);

  objc_storeStrong((id *)&self->_internal_is_history_invalid, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  return self;
}

@end