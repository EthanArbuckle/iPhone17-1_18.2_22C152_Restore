@interface _MFXTemporalScalingEffectV3
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
- (_MFXTemporalScalingEffectV3)initWithDevice:(id)a3 descriptor:(id)a4 history:(id)a5;
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
- (void)dealloc;
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

@implementation _MFXTemporalScalingEffectV3

- (unint64_t)executionMode
{
  return !self->_net_wrapper._prewarmComplete || !self->_useANE;
}

- (void)setJitterOffsetX:(float)a3
{
  *(float *)&self->_jitterOffset[4] = a3;
}

- (float)jitterOffsetX
{
  uint64_t v2 = *(void *)&self->_jitterOffset[4];
  LODWORD(result) = v2;
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  *(float *)self->_motionVectorScale = a3;
}

- (float)jitterOffsetY
{
  return *(float *)self->_motionVectorScale;
}

- (void)setMotionVectorScaleX:(float)a3
{
  *(float *)&self->_motionVectorScale[4] = a3;
}

- (float)motionVectorScaleX
{
  uint64_t v2 = *(void *)&self->_motionVectorScale[4];
  LODWORD(result) = v2;
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  *(float *)&self->_motionVectorScale[8] = a3;
}

- (float)motionVectorScaleY
{
  return *(float *)&self->_motionVectorScale[8];
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
  *(float32x2_t *)&self->_jitterOffset[4] = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)jitterOffset
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_jitterOffset[4]);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (void)setMotionVectorScale:(CGPoint)a3
{
  CGFloat y = a3.y;
  *(float32x2_t *)&self->_motionVectorScale[4] = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)motionVectorScale
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_motionVectorScale[4]);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (_MFXTemporalScalingEffectV3)initWithDevice:(id)a3 descriptor:(id)a4 history:(id)a5
{
  id v91 = a3;
  id v9 = a4;
  id v90 = a5;
  v94.receiver = self;
  v94.super_class = (Class)_MFXTemporalScalingEffectV3;
  v10 = [(_MTLFXEffect *)&v94 init];
  v11 = (id *)(v10 + 32);
  objc_storeStrong((id *)v10 + 4, a3);
  *((void *)v10 + 9) = [v9 colorTextureFormat];
  *((void *)v10 + 10) = [v9 depthTextureFormat];
  *((void *)v10 + 11) = [v9 motionTextureFormat];
  *((void *)v10 + 102) = [v9 outputTextureFormat];
  *((void *)v10 + 12) = [v9 reactiveMaskTextureFormat];
  *((void *)v10 + 5) = [v9 inputWidth];
  *((void *)v10 + 6) = [v9 inputHeight];
  *((void *)v10 + 7) = [v9 outputWidth];
  *((void *)v10 + 8) = [v9 outputHeight];
  *((_DWORD *)v10 + 26) = 1065353216;
  v10[144] = 1;
  float v12 = (float)*((unint64_t *)v10 + 5);
  *(float *)&uint64_t v13 = -v12;
  *((_DWORD *)v10 + 30) = v13;
  float v14 = (float)*((unint64_t *)v10 + 6);
  *((float *)&v13 + 1) = -v14;
  *((void *)v10 + 15) = v13;
  v10[145] = 1;
  v10[147] = 1;
  v10[149] = [v9 isReactiveMaskTextureEnabled];
  v10[148] = 1;
  v10[150] = 1;
  if (isInternalBuild(void)::once != -1) {
    dispatch_once(&isInternalBuild(void)::once, &__block_literal_global);
  }
  if (isInternalBuild(void)::isInternal)
  {
    v15 = getenv("MTLFX_FORCE_GPU");
    if (!v15) {
      v15 = "0";
    }
    if (strtol(v15, 0, 0)) {
      v10[147] = 0;
    }
    v16 = getenv("MTLFX_PRE_BICUBIC");
    if (!v16) {
      v16 = "0";
    }
    if (strtol(v16, 0, 0)) {
      v10[148] = 0;
    }
  }
  SEL v17 = NSSelectorFromString(&cfstr_Instance.isa);
  Class v18 = NSClassFromString(&cfstr_Cadeveloperhud.isa);
  if (v18)
  {
    v19 = ((void (*)(Class, SEL))[(objc_class *)v18 methodForSelector:v17])(v18, v17);
  }
  else
  {
    v19 = 0;
  }
  v20 = getenv("MTLFX_HUD_ENABLED");
  if (!v20) {
    v20 = "0";
  }
  v21 = (id *)(v10 + 792);
  v87 = v19;
  if (strtol(v20, 0, 0))
  {
    objc_storeStrong((id *)v10 + 99, v19);
    if (*v21)
    {
      [*v21 addLabel:@"com.apple.hud-label.metalfx" after:@"com.apple.hud-graph.default"];
      [*v21 addLabel:@"com.apple.hud-label.metalfx.resolution" after:@"com.apple.hud-label.metalfx"];
      [*v21 addLabel:@"com.apple.hud-label.metalfx.timing" after:@"com.apple.hud-label.metalfx.resolution"];
      operator new();
    }
  }
  else
  {
    id v22 = *v21;
    id *v21 = 0;
  }
  v23 = getenv("MTLFX_DISABLE_LATE_LATCH");
  if (!v23) {
    v23 = "0";
  }
  if (strtol(v23, 0, 0)) {
    v10[150] = 0;
  }
  v24 = getenv("MTLFX_EXECUTION_MODE");
  if (!v24) {
    v24 = "0";
  }
  if (strtol(v24, 0, 0) == 1) {
    v10[147] = 0;
  }
  *((void *)v10 + 93) = 1;
  *((void *)v10 + 94) = 1;
  *((void *)v10 + 95) = 1;
  *((void *)v10 + 96) = 1;
  *((void *)v10 + 97) = 7;
  v89 = [MEMORY[0x263F13418] deviceWithMTLDevice:*v11];
  v85 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v84 = [v85 pathForResource:@"default" ofType:@"metallib"];
  v25 = [NSURL URLWithString:v84];
  id v93 = 0;
  v86 = (void *)[v91 newLibraryWithURL:v25 error:&v93];
  id v83 = v93;

  v88 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*((void *)v10 + 7) height:*((void *)v10 + 8) mipmapped:0];
  [v88 setUsage:3];
  [v88 setCompressionMode:1];
  v26 = v90;
  if (!v90) {
    v26 = (void *)[*v11 newTextureWithDescriptor:v88];
  }
  objc_storeStrong((id *)v10 + 25, v26);
  if (!v90) {

  }
  if (v10[149])
  {
    v27 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:*((void *)v10 + 12) width:*((void *)v10 + 5) height:*((void *)v10 + 6) mipmapped:0];
    [v27 setUsage:3];
    [v27 setCompressionMode:1];
    uint64_t v28 = [*v11 newTextureWithDescriptor:v27];
    v29 = (void *)*((void *)v10 + 26);
    *((void *)v10 + 26) = v28;
  }
  v30 = objc_opt_new();
  v31 = v30;
  if (v10[150])
  {
    [v30 setEnableLowLatencySignalSharedEvent:1];
    [v31 setEnableLowLatencyWaitSharedEvent:1];
    [v31 setDisableIOFencing:1];
  }
  id v32 = *v11;
  uint64_t v33 = [v32 newCommandQueueWithDescriptor:v31];
  v34 = (void *)*((void *)v10 + 47);
  *((void *)v10 + 47) = v33;

  uint64_t v35 = [*v11 newEvent];
  v36 = (void *)*((void *)v10 + 48);
  *((void *)v10 + 48) = v35;

  uint64_t v37 = [*v11 newEvent];
  v38 = (void *)*((void *)v10 + 49);
  *((void *)v10 + 49) = v37;

  uint64_t v39 = [*v11 newEvent];
  v40 = (void *)*((void *)v10 + 50);
  *((void *)v10 + 50) = v39;

  uint64_t v41 = [*v11 newEvent];
  v42 = (void *)*((void *)v10 + 51);
  *((void *)v10 + 51) = v41;

  if (v10[147])
  {
    uint64_t v43 = [*v11 newSharedEvent];
    v44 = (void *)*((void *)v10 + 52);
    *((void *)v10 + 52) = v43;

    uint64_t v45 = [*v11 newSharedEvent];
  }
  else
  {
    v46 = (void *)*((void *)v10 + 52);
    *((void *)v10 + 52) = 0;

    uint64_t v45 = [*v11 newEvent];
  }
  v47 = (void *)*((void *)v10 + 53);
  *((void *)v10 + 53) = v45;

  if (objc_opt_respondsToSelector()) {
    [*((id *)v10 + 49) setEnableBarrier:0];
  }
  v48 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v49 = dispatch_queue_attr_make_with_qos_class(v48, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v50 = dispatch_queue_create("MetalFX", v49);
  v51 = (void *)*((void *)v10 + 56);
  *((void *)v10 + 56) = v50;

  *((void *)v10 + 90) = *((void *)v10 + 5);
  *((void *)v10 + 91) = *((void *)v10 + 6);
  v10[146] = [v9 isAutoExposureEnabled];
  v52 = getenv("MTLFX_FORCE_AUTO_EXPOSURE");
  if (!v52) {
    v52 = "0";
  }
  if (strtol(v52, 0, 0)) {
    v10[146] = 1;
  }
  if ([v9 isInputContentPropertiesEnabled])
  {
    [v9 inputContentMinScale];
    *((_DWORD *)v10 + 184) = v53;
    [v9 inputContentMaxScale];
    *((float *)v10 + 185) = v54;
    float v55 = *((float *)v10 + 184);
    float v56 = v54;
  }
  else
  {
    float v57 = (float)*((unint64_t *)v10 + 7);
    unint64_t v58 = *((void *)v10 + 5);
    float v59 = v57 / (float)v58;
    float v60 = (float)*((unint64_t *)v10 + 8);
    unint64_t v61 = *((void *)v10 + 6);
    float v62 = v60 / (float)v61;
    float v55 = fminf(v59, v62);
    float v54 = fmaxf(v59, v62);
    *((float *)v10 + 184) = v55;
    *((float *)v10 + 185) = v54;
    float v56 = fmaxf(v57 / (float)(v58 + 1), v60 / (float)(v61 + 1));
  }
  if (v55 >= 1.0 && v56 <= 3.0)
  {
    if (v54 <= 2.0)
    {
      int v65 = *((_DWORD *)v10 + 14);
      int v67 = *((_DWORD *)v10 + 16);
    }
    else if ([v9 isInputContentPropertiesEnabled])
    {
      float v63 = *((float *)v10 + 185);
      float v64 = ceilf((float)*((unint64_t *)v10 + 7) / v63);
      int v65 = (int)(float)(v64 + v64);
      float v66 = ceilf((float)*((unint64_t *)v10 + 8) / v63);
      int v67 = (int)(float)(v66 + v66);
    }
    else
    {
      int v65 = 2 * *((_DWORD *)v10 + 10);
      int v67 = 2 * *((_DWORD *)v10 + 12);
    }
    unsigned int v68 = ((v65 + 63) >> 1) & 0x7FFFFFE0;
    unsigned int v69 = ((v67 + 63) >> 1) & 0x7FFFFFE0;
    *((_DWORD *)v10 + 64) = 0;
    *((_DWORD *)v10 + 65) = v65;
    *((_DWORD *)v10 + 66) = v67;
    *((_DWORD *)v10 + 67) = v68;
    *((_DWORD *)v10 + 68) = v69;
    *(void *)(v10 + 276) = 0x100000005;
    *((_DWORD *)v10 + 71) = v68;
    *((_DWORD *)v10 + 72) = v69;
    *(void *)(v10 + 292) = 0x200000005;
    *((_DWORD *)v10 + 75) = v68 >> 1;
    *((_DWORD *)v10 + 76) = v69 >> 1;
    *(_OWORD *)(v10 + 308) = xmmword_2451629F0;
    *(void *)(v10 + 324) = 0x8000000040;
    v70 = (MPSGraphCompilationDescriptor *)objc_opt_new();
    v71 = v70;
    if (v10[147])
    {
      [(MPSGraphCompilationDescriptor *)v70 setOptimizationLevel:1];
      [(MPSGraphCompilationDescriptor *)v71 setOptimizationProfile:1];
      if ([v91 supportsFamily:1008]) {
        uint64_t v72 = 3;
      }
      else {
        uint64_t v72 = 2;
      }
      [(MPSGraphCompilationDescriptor *)v71 setAneCompilerSpatialSplitting:v72];
      if (v10[150])
      {
        [(MPSGraphCompilationDescriptor *)v71 setEnableANELateLatch:1];
        [(MPSGraphCompilationDescriptor *)v71 setEnableANEFWToFWSignal:1];
      }
    }
    getEmitModelWeightsData(0, 1, 0);
    v73 = (NSData *)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = EmitBR_Net_V35_getMPSGraphExecutable(v73, (const BRNetDescriptor *)(v10 + 256), v71);
    v75 = (void *)*((void *)v10 + 28);
    *((void *)v10 + 28) = v74;

    [(MPSGraphCompilationDescriptor *)v71 setOptimizationProfile:0];
    uint64_t v76 = EmitBR_Net_V35_getMPSGraphExecutable(v73, (const BRNetDescriptor *)(v10 + 256), v71);
    v77 = (void *)*((void *)v10 + 29);
    *((void *)v10 + 29) = v76;

    *(void *)v92 = 0;
    uint64_t v78 = makeMPSTensorDataWithData(v89, *((unsigned int *)v10 + 71), *((unsigned int *)v10 + 72), *((unsigned int *)v10 + 73), 0, &v92[1], 0);
    v79 = (void *)*((void *)v10 + 45);
    *((void *)v10 + 45) = v78;

    uint64_t v80 = makeMPSTensorDataWithData(v89, *((unsigned int *)v10 + 75), *((unsigned int *)v10 + 76), *((unsigned int *)v10 + 77), 0, v92, 0);
    v81 = (void *)*((void *)v10 + 46);
    *((void *)v10 + 46) = v80;

    operator new();
  }
  MTLReportFailure();

  return 0;
}

- (void)dealloc
{
  filter = self->_filter;
  if (filter)
  {
    BRNet_v3_Filter::~BRNet_v3_Filter(filter);
    MEMORY[0x2456980B0]();
  }
  self->_filter = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MFXTemporalScalingEffectV3;
  [(_MFXTemporalScalingEffectV3 *)&v4 dealloc];
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  -[_MFXTemporalScalingEffectV3 encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  [v4 commit];
}

- (void)encodeToCommandBuffer:(id)a3
{
  id v43 = a3;
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
      double v35 = v10;
      double v36 = inputContentMinScale;
      MTLReportFailure();
    }
    float v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > inputContentMaxScale)
    {
      double v35 = v11;
      double v36 = inputContentMaxScale;
      MTLReportFailure();
    }
    if ([(MTLTexture *)self->_outputTexture storageMode] != 2) {
      MTLReportFailure();
    }
  }
  unint64_t encodeID = self->super.super._encodeID;
  ++self->_inputEventValue;
  unint64_t v44 = self->_outputEventValue + 1;
  self->_outputEventValue = v44;
  unint64_t inputEventValue = self->_inputEventValue;
  double v47 = *(double *)&self->_jitterOffset[4];
  BOOL reset = self->_reset;
  BOOL reversedDepth = self->_reversedDepth;
  float preExposure = self->_preExposure;
  float32x2_t v15 = *(float32x2_t *)&self->_motionVectorScale[4];
  uint64x2_t v38 = *(uint64x2_t *)&self->_inputContentWidth;
  v16 = self->_colorTexture;
  SEL v17 = self->_depthTexture;
  v42 = self->_motionTexture;
  uint64_t v41 = self->_outputTexture;
  v40 = self->_exposureTexture;
  uint64_t v39 = self->_reactiveMaskTexture;
  LOWORD(v18) = self->_inputContentWidth;
  WORD2(v18) = self->_inputContentHeight;
  uint64_t v45 = v18;
  [v43 encodeSignalEvent:self->_inputEvent value:self->_inputEventValue];
  [v43 encodeWaitForEvent:self->_midProcessingStartEvent value:2 * inputEventValue];
  v19 = [v43 computeCommandEncoder];
  [v19 setLabel:@"MetalFX_TemporalV3_MidProcessing"];
  [(_MTLFXEffect *)self _didCreateComputeCommandEncoder:v19 forEncode:encodeID];
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v25 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_u64(v38)));
  LODWORD(v26) = HIDWORD(v47);
  HIWORD(v48) = WORD2(v45);
  LOWORD(v48) = v45;
  BRNet_v3_Filter::encodeMid(&self->_filter->var0, v43, v19, self->_history, v17, reversedDepth, v48, v15, v25, *(float *)&v47, v26, v47);
  [v19 endEncoding];
  [v43 encodeSignalEvent:self->_midProcessingDoneEvent value:v44];

  [v43 encodeWaitForEvent:self->_outputEvent value:self->_outputEventValue];
  uint64_t v27 = (2 * inputEventValue) | 1;
  id v28 = v43;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke;
  v49[3] = &unk_2651C6BB0;
  v49[4] = self;
  id v50 = v28;
  unint64_t v59 = inputEventValue;
  uint64_t v60 = 2 * inputEventValue;
  unint64_t v61 = encodeID;
  v29 = v16;
  v51 = v29;
  v30 = v17;
  v52 = v30;
  v31 = v42;
  int v53 = v31;
  id v32 = v40;
  float32x2_t v62 = v15;
  float32x2_t v63 = v25;
  double v64 = v47;
  BOOL v70 = reset;
  BOOL v71 = reversedDepth;
  float v67 = preExposure;
  __int16 v69 = WORD2(v45);
  __int16 v68 = v45;
  float v54 = v32;
  float v57 = v73;
  uint64_t v65 = v27;
  unint64_t v66 = v44;
  uint64_t v33 = v41;
  float v55 = v33;
  v34 = v39;
  float v56 = v34;
  unint64_t v58 = v72;
  [v28 addSynchronizationNotification:v49];
  self->_BOOL reset = 0;

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);
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

- (float)inputContentMinScale
{
  return self->_inputContentMinScale;
}

- (float)inputContentMaxScale
{
  return self->_inputContentMaxScale;
}

- (float)preExposure
{
  return self->_preExposure;
}

- (void)setPreExposure:(float)a3
{
  self->_float preExposure = a3;
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

- (BOOL)reset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_BOOL reset = a3;
}

- (BOOL)isDepthReversed
{
  return self->_reversedDepth;
}

- (void)setDepthReversed:(BOOL)a3
{
  self->_BOOL reversedDepth = a3;
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

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
}

- (MTLTexture)exposureTexture
{
  return self->_exposureTexture;
}

- (void)setExposureTexture:(id)a3
{
}

- (MTLTexture)reactiveMaskTexture
{
  return self->_reactiveMaskTexture;
}

- (void)setReactiveMaskTexture:(id)a3
{
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

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_hudProperties, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_frameSharedEvent, 0);
  objc_storeStrong((id *)&self->_framePowerOnSharedEvent, 0);
  objc_storeStrong((id *)&self->_midProcessingDoneEvent, 0);
  objc_storeStrong((id *)&self->_midProcessingStartEvent, 0);
  objc_storeStrong((id *)&self->_outputEvent, 0);
  objc_storeStrong((id *)&self->_inputEvent, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_output_TensorData, 0);
  objc_storeStrong((id *)&self->_input_TensorData, 0);
  MPSGraphMPSGraphExecutableWrapper::~MPSGraphMPSGraphExecutableWrapper(&self->_net_wrapper);
  objc_storeStrong((id *)&self->_prevReactiveTexture, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_exposureTexture, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_reactiveTexture, 0);
  objc_storeStrong((id *)&self->_motionTexture, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((void *)self + 42) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((void *)self + 31) = 0;
  return self;
}

@end