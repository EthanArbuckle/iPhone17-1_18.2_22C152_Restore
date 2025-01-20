@interface _MFXTemporalScalingEffectDebug
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
- (_MFXTemporalScalingEffectDebug)initWithDevice:(id)a3 descriptor:(id)a4 mode:(unint64_t)a5 enableJitterViz:(BOOL)a6;
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
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)depthTextureFormat;
- (unint64_t)depthTextureUsage;
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

@implementation _MFXTemporalScalingEffectDebug

- (_MFXTemporalScalingEffectDebug)initWithDevice:(id)a3 descriptor:(id)a4 mode:(unint64_t)a5 enableJitterViz:(BOOL)a6
{
  a3;
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_MFXTemporalScalingEffectDebug;
  v11 = [(_MTLFXEffect *)&v13 init];
  v11->_mode = a5;
  v11->_jitterVizEnabled = a6;
  *((_DWORD *)&v11->_preExposure + 1) = 1065353216;
  int v14 = 0;
  findEnvVarNum<int>();
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
  BYTE1(self->_inputContentMinScale) = a3;
}

- (BOOL)reversedDepth
{
  return BYTE1(self->_inputContentMinScale);
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
  id v38 = a3;
  [(_MTLFXEffect *)self _beginEncode];
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_colorTexture, self->_depthTexture, self->_motionTexture, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    unint64_t inputContentWidth = self->_inputContentWidth;
    unint64_t inputContentHeight = self->_inputContentHeight;
    float inputContentMaxScale = self->_inputContentMaxScale;
    float preExposure = self->_preExposure;
    float outputWidth = (float)self->_outputWidth;
    float outputHeight = (float)self->_outputHeight;
    float v10 = fminf(outputWidth / (float)inputContentWidth, outputHeight / (float)inputContentHeight);
    if (v10 < inputContentMaxScale)
    {
      double v35 = v10;
      double v36 = inputContentMaxScale;
      MTLReportFailure();
    }
    float v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > preExposure)
    {
      double v35 = v11;
      double v36 = preExposure;
      MTLReportFailure();
    }
    if ([(MTLTexture *)self->_outputTexture storageMode] != 2) {
      MTLReportFailure();
    }
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v60, 0, (uint64_t)self, 0, 0, 0);
  if (MTLTraceEnabled())
  {
    [v38 globalTraceObjectID];
    kdebug_trace();
  }
  id v12 = objc_alloc_init(MEMORY[0x263F129A0]);
  objc_super v13 = [v12 colorAttachments];
  int v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setLoadAction:2];

  v15 = [v12 colorAttachments];
  v16 = [v15 objectAtIndexedSubscript:0];
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v17 = [v12 colorAttachments];
  v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setStoreAction:1];

  outputTexture = self->_outputTexture;
  v20 = [v12 colorAttachments];
  v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setTexture:outputTexture];

  v37 = [v38 renderCommandEncoderWithDescriptor:v12];
  [v37 endEncoding];
  v22 = [v38 computeCommandEncoder];
  [(_MTLFXEffect *)self _didCreateComputeCommandEncoder:v22 forEncode:self->super.super._encodeID];
  if (self->_fence) {
    objc_msgSend(v22, "waitForFence:");
  }
  unsigned __int16 inputWidth = self->_inputWidth;
  unsigned __int16 inputHeight = self->_inputHeight;
  unsigned __int16 v58 = inputWidth;
  float32x2_t v24 = vmul_f32(*(float32x2_t *)self->_motionVectorScale, vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_outputWidth)));
  uint64x2_t v25 = *(uint64x2_t *)&self->_inputContentWidth;
  uint64_t v56 = *(void *)self->_jitterOffset;
  float32x2_t v57 = vdiv_f32(v24, vcvt_f32_f64(vcvtq_f64_u64(v25)));
  float v26 = 1.0;
  if (!BYTE1(self->_inputContentMinScale)) {
    float v26 = -1.0;
  }
  float v55 = v26;
  [v22 setComputePipelineState:self->_dilateFlowPSO];
  [v22 setTexture:self->_depthTexture atIndex:0];
  [v22 setTexture:self->_motionTexture atIndex:1];
  [v22 setTexture:self->_dilatedFlow atIndex:2];
  [v22 setBytes:&v55 length:4 atIndex:0];
  [v22 setBytes:&v58 length:4 atIndex:1];
  v54[0] = v58 + 2;
  v54[1] = inputHeight + 2;
  v54[2] = 1;
  int64x2_t v52 = vdupq_n_s64(8uLL);
  uint64_t v53 = 1;
  [v22 dispatchThreads:v54 threadsPerThreadgroup:&v52];
  char inputContentMinScale_low = LOBYTE(self->_inputContentMinScale);
  if (self->_mode == 2)
  {
    [v22 setComputePipelineState:self->_copyHistoryToCurrent];
    [v22 setTexture:self->_outputTexture atIndex:0];
    [v22 setTexture:self->_history[0] atIndex:1];
    [v22 setBytes:&v56 length:8 atIndex:0];
    unint64_t v27 = self->_outputHeight;
    v50[0] = self->_outputWidth;
    v50[1] = v27;
    v50[2] = 1;
    int64x2_t v48 = vdupq_n_s64(8uLL);
    uint64_t v49 = 1;
    [v22 dispatchThreads:v50 threadsPerThreadgroup:&v48];
    unsigned __int16 v28 = self->_outputWidth;
    unsigned __int16 inputHeight = self->_outputHeight;
    unsigned __int16 v58 = v28;
    [v22 setComputePipelineState:self->_unjitterCurrent];
    [v22 setTexture:self->_colorTexture atIndex:0];
    [v22 setTexture:self->_outputTexture atIndex:1];
    [v22 setTexture:self->_history[0] atIndex:2];
    [v22 setBytes:&v56 length:8 atIndex:0];
    [v22 setBytes:&v58 length:4 atIndex:1];
    unint64_t v29 = self->_inputHeight;
    v47[0] = self->_inputWidth;
    v47[1] = v29;
    v47[2] = 1;
    int64x2_t v45 = vdupq_n_s64(8uLL);
    uint64_t v46 = 1;
    [v22 dispatchThreads:v47 threadsPerThreadgroup:&v45];
  }
  else
  {
    [v22 setComputePipelineState:self->_blendUnjitterCurrAndPrev];
    [v22 setTexture:self->_dilatedFlow atIndex:0];
    [v22 setTexture:self->_history[self->_currHistoryIdx == 0] atIndex:1];
    [v22 setTexture:self->_colorTexture atIndex:2];
    [v22 setTexture:self->_outputTexture atIndex:3];
    [v22 setTexture:self->_history[self->_currHistoryIdx] atIndex:4];
    [v22 setBytes:&v56 length:8 atIndex:0];
    [v22 setBytes:&v58 length:4 atIndex:1];
    [v22 setBytes:&v57 length:8 atIndex:2];
    [v22 setBytes:&inputContentMinScale_low length:1 atIndex:3];
    unint64_t v30 = self->_outputHeight;
    v44[0] = self->_outputWidth;
    v44[1] = v30;
    v44[2] = 1;
    int64x2_t v42 = vdupq_n_s64(8uLL);
    uint64_t v43 = 1;
    [v22 dispatchThreads:v44 threadsPerThreadgroup:&v42];
  }
  if (self->_jitterVizEnabled)
  {
    [v22 setComputePipelineState:self->_jitterViz];
    [v22 setTexture:self->_history[self->_currHistoryIdx == 0] atIndex:0];
    [v22 setTexture:self->_outputTexture atIndex:1];
    [v22 setTexture:self->_history[self->_currHistoryIdx] atIndex:2];
    [v22 setBytes:&v56 length:8 atIndex:0];
    [v22 setBytes:&self->_jitterVizOffset[3] length:4 atIndex:1];
    [v22 setBytes:&self->_preExposure + 1 length:4 atIndex:2];
    LOWORD(v31) = v58;
    *(double *)&unint64_t v32 = (double)v31 * 0.2;
    LODWORD(v33) = *(double *)&v32;
    LOWORD(v32) = inputHeight;
    unsigned int v34 = ((double)v32 * 0.2);
    if (v33 >= v34) {
      uint64_t v33 = v34;
    }
    else {
      uint64_t v33 = v33;
    }
    v41[0] = v33;
    v41[1] = v33;
    v41[2] = 1;
    int64x2_t v39 = vdupq_n_s64(8uLL);
    uint64_t v40 = 1;
    [v22 dispatchThreads:v41 threadsPerThreadgroup:&v39];
  }
  if (self->_fence) {
    objc_msgSend(v22, "updateFence:");
  }
  [v22 endEncoding];

  self->_currHistoryIdx = self->_currHistoryIdx == 0;
  LOBYTE(self->_inputContentMinScale) = 0;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v60);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  -[_MFXTemporalScalingEffectDebug encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
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
  return LOBYTE(self->_inputContentMinScale);
}

- (void)setReset:(BOOL)a3
{
  LOBYTE(self->_inputContentMinScale) = a3;
}

- (BOOL)isDepthReversed
{
  return BYTE1(self->_inputContentMinScale);
}

- (void)setDepthReversed:(BOOL)a3
{
  BYTE1(self->_inputContentMinScale) = a3;
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
  return self->_inputContentMaxScale;
}

- (float)inputContentMaxScale
{
  return self->_preExposure;
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
  return *(&self->_preExposure + 1);
}

- (void)setPreExposure:(float)a3
{
  *(&self->_preExposure + 1) = a3;
}

- (__n128)currentWorldToViewMatrix
{
  return a1[22];
}

- (__n128)setCurrentWorldToViewMatrix:(__n128)a3
{
  result[22] = a2;
  result[23] = a3;
  result[24] = a4;
  result[25] = a5;
  return result;
}

- (__n128)currentViewToClipMatrix
{
  return a1[26];
}

- (__n128)setCurrentViewToClipMatrix:(__n128)a3
{
  result[26] = a2;
  result[27] = a3;
  result[28] = a4;
  result[29] = a5;
  return result;
}

- (__n128)previousWorldToViewMatrix
{
  return a1[30];
}

- (__n128)setPreviousWorldToViewMatrix:(__n128)a3
{
  result[30] = a2;
  result[31] = a3;
  result[32] = a4;
  result[33] = a5;
  return result;
}

- (__n128)previousViewToClipMatrix
{
  return a1[34];
}

- (__n128)setPreviousViewToClipMatrix:(__n128)a3
{
  result[34] = a2;
  result[35] = a3;
  result[36] = a4;
  result[37] = a5;
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
  objc_storeStrong((id *)&self->_jitterViz, 0);
  objc_storeStrong((id *)&self->_copyHistoryToCurrent, 0);
  objc_storeStrong((id *)&self->_unjitterCurrent, 0);
  objc_storeStrong((id *)&self->_blendUnjitterCurrAndPrev, 0);
  objc_storeStrong((id *)&self->_dilateFlowPSO, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_history[i], 0);

  objc_storeStrong((id *)&self->_dilatedFlow, 0);
}

@end