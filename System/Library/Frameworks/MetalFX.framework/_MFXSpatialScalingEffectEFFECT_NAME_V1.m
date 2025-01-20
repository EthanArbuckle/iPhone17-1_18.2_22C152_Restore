@interface _MFXSpatialScalingEffectEFFECT_NAME_V1
- (MTLFence)fence;
- (MTLTexture)colorTexture;
- (MTLTexture)debugTexture;
- (MTLTexture)outputTexture;
- (_MFXSpatialScalingEffectEFFECT_NAME_V1)initWithDevice:(id)a3 descriptor:(id)a4;
- (int64_t)colorProcessingMode;
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)inputContentHeight;
- (unint64_t)inputContentWidth;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)outputHeight;
- (unint64_t)outputTextureFormat;
- (unint64_t)outputTextureUsage;
- (unint64_t)outputWidth;
- (void)encodeToCommandBuffer:(id)a3;
- (void)encodeToCommandQueue:(id)a3;
- (void)setColorTexture:(id)a3;
- (void)setDebugTexture:(id)a3;
- (void)setFence:(id)a3;
- (void)setInputContentHeight:(unint64_t)a3;
- (void)setInputContentWidth:(unint64_t)a3;
- (void)setOutputTexture:(id)a3;
@end

@implementation _MFXSpatialScalingEffectEFFECT_NAME_V1

- (_MFXSpatialScalingEffectEFFECT_NAME_V1)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v88 = a3;
  id v7 = a4;
  v95.receiver = self;
  v95.super_class = (Class)_MFXSpatialScalingEffectEFFECT_NAME_V1;
  v8 = [(_MTLFXEffect *)&v95 init];
  p_device = (id *)&v8->_device;
  objc_storeStrong((id *)&v8->_device, a3);
  v86 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v85 = [v86 pathForResource:@"default" ofType:@"metallib"];
  v10 = [NSURL URLWithString:v85];
  id v94 = 0;
  v87 = (void *)[v88 newLibraryWithURL:v10 error:&v94];
  id v11 = v94;

  v8->_inputLinear = 0;
  v8->_inputOutputNormalized = 1;
  v8->_colorTextureFormat = [v7 colorTextureFormat];
  v8->_outputTextureFormat = [v7 outputTextureFormat];
  v8->_inputWidth = [v7 inputWidth];
  v8->_inputHeight = [v7 inputHeight];
  v8->_outputWidth = [v7 outputWidth];
  v8->_outputHeight = [v7 outputHeight];
  uint64_t v12 = [v7 colorProcessingMode];
  v8->_colorProcessingMode = v12;
  if (v12 >= 3) {
    goto LABEL_16;
  }
  uint64_t v13 = [MEMORY[0x263F129A0] renderPassDescriptor];
  mfxPassDescriptor = v8->_mfxPassDescriptor;
  v8->_mfxPassDescriptor = (MTLRenderPassDescriptor *)v13;

  v15 = [(MTLRenderPassDescriptor *)v8->_mfxPassDescriptor colorAttachments];
  v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setLoadAction:0];

  v17 = [(MTLRenderPassDescriptor *)v8->_mfxPassDescriptor colorAttachments];
  v18 = [v17 objectAtIndexedSubscript:0];
  objc_msgSend(v18, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v19 = [(MTLRenderPassDescriptor *)v8->_mfxPassDescriptor colorAttachments];
  v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setStoreAction:1];

  [v7 colorTextureFormat];
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v96 = 0u;
  MTLPixelFormatGetInfoForDevice();
  v8->_inputSRGB = (WORD4(v96) & 0x800) != 0;
  [v7 outputTextureFormat];
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v96 = 0u;
  MTLPixelFormatGetInfoForDevice();
  int outputSRGB = (DWORD2(v96) >> 11) & 1;
  v8->_int outputSRGB = (WORD4(v96) & 0x800) != 0;
  if (v8->_inputSRGB)
  {
    uint64_t v22 = [v7 colorTextureFormat];
    if (((unint64_t)(v22 - 31) > 0x32 || ((1 << (v22 - 31)) & 0x4010000000001) == 0)
      && v22 != 11)
    {
      goto LABEL_16;
    }
    int outputSRGB = v8->_outputSRGB;
  }
  if (outputSRGB)
  {
    uint64_t v23 = [v7 outputTextureFormat];
    if (((unint64_t)(v23 - 31) > 0x32 || ((1 << (v23 - 31)) & 0x4010000000001) == 0)
      && v23 != 11)
    {
      goto LABEL_16;
    }
  }
  if (v8->_inputSRGB != v8->_outputSRGB)
  {
    NSLog(&cfstr_SMixedSrgbInpu.isa, "-[_MFXSpatialScalingEffectEFFECT_NAME_V1 initWithDevice:descriptor:]");
LABEL_17:
    v24 = 0;
    id v25 = v11;
    goto LABEL_18;
  }
  if (v8->_inputSRGB && v8->_colorProcessingMode >= 1)
  {
LABEL_16:
    MTLReportFailure();
    goto LABEL_17;
  }
  v8->_inputContentWidth = [v7 inputWidth];
  v8->_inputContentHeight = [v7 inputHeight];
  v8->_BOOL use3DPipeline = 1;
  if ([*p_device supportsFamily:1001])
  {
    v76 = @"MFX_SHARPEN_SHADER_V1_FRAG";
    v77 = @"MFX_SCALE_SHADER_V1_FRAG";
    v74 = @"MFX_Sharpen";
    v75 = @"MFX_Scale";
  }
  else
  {
    v27 = [*p_device name];
    if ([v27 containsString:@"Intel"])
    {
      v76 = @"MFX_SHARPEN_SHADER_V1_FRAG";
      v77 = @"MFX_SCALE_SHADER_V1_FRAG";
      v74 = @"MFX_Sharpen";
      v75 = @"MFX_Scale";
    }
    else
    {
      v81 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\s\\d{3}\\D+" options:0 error:0];
      v28 = objc_msgSend(v81, "matchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length"));
      uint64_t v29 = [v28 count];

      if (v29 == 1)
      {
        v8->_BOOL use3DPipeline = 0;
        v75 = @"MFX_SCALE_SHADER_V1_FP32";
        v76 = @"MFX_SHARPEN_SHADER_V1_FRAG_FP32";
        v77 = @"MFX_SCALE_SHADER_V1_FRAG_FP32";
        v30 = @"MFX_SHARPEN_SHADER_V1_FP32";
      }
      else
      {
        v75 = @"MFX_Scale";
        v76 = @"MFX_SHARPEN_SHADER_V1_FRAG";
        v77 = @"MFX_SCALE_SHADER_V1_FRAG";
        v30 = @"MFX_Sharpen";
      }
      v74 = v30;
    }
  }
  BOOL use3DPipeline = v8->_use3DPipeline;
  v8->_colorTextureUsage = 1;
  BOOL v32 = !use3DPipeline;
  uint64_t v33 = 5;
  if (v32) {
    uint64_t v33 = 7;
  }
  v8->_outputTextureUsage = v33;
  v8->_inputFormat = [v7 colorTextureFormat];
  v8->_outputFormat = [v7 outputTextureFormat];
  if (!v8->_outputSRGB)
  {
    uint64_t v35 = [v7 outputTextureFormat];
    goto LABEL_42;
  }
  uint64_t v34 = [v7 outputTextureFormat];
  if (v34 > 70)
  {
    if (v34 == 71)
    {
      uint64_t v35 = 70;
      goto LABEL_42;
    }
    if (v34 == 81)
    {
      uint64_t v35 = 80;
      goto LABEL_42;
    }
LABEL_39:
    uint64_t v35 = 0;
    goto LABEL_42;
  }
  if (v34 == 11)
  {
    uint64_t v35 = 10;
    goto LABEL_42;
  }
  if (v34 != 31) {
    goto LABEL_39;
  }
  uint64_t v35 = 30;
LABEL_42:
  v8->_unint64_t intermediatePixelFormat = v35;
  uint64_t v36 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v35, objc_msgSend(v7, "outputWidth"), objc_msgSend(v7, "outputHeight"), 0);
  texDesc = v8->_texDesc;
  v8->_texDesc = (MTLTextureDescriptor *)v36;

  [(MTLTextureDescriptor *)v8->_texDesc setStorageMode:2];
  if (v8->_use3DPipeline) {
    uint64_t v38 = 5;
  }
  else {
    uint64_t v38 = 7;
  }
  [(MTLTextureDescriptor *)v8->_texDesc setUsage:v38];
  uint64_t v39 = [*p_device newTextureWithDescriptor:v8->_texDesc];
  mfxUpscaledTex = v8->_mfxUpscaledTex;
  v8->_mfxUpscaledTex = (MTLTexture *)v39;

  [(MTLTexture *)v8->_mfxUpscaledTex setLabel:@"MetalFX_Upscaled"];
  v80 = (void *)[v87 newFunctionWithName:@"FSQuadVertexShader"];
  v78 = (void *)[v87 newFunctionWithName:@"MFX_NORMALIZE_SHADER_V1_FRAG"];
  id v41 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v41 setLabel:@"MFX_NPRenderPipelineState"];
  [v41 setRasterSampleCount:1];
  [v41 setVertexFunction:v80];
  [v41 setFragmentFunction:v78];
  unint64_t intermediatePixelFormat = v8->_intermediatePixelFormat;
  v43 = [v41 colorAttachments];
  v44 = [v43 objectAtIndexedSubscript:0];
  [v44 setPixelFormat:intermediatePixelFormat];

  id v45 = *p_device;
  id v93 = v11;
  uint64_t v46 = [v45 newRenderPipelineStateWithDescriptor:v41 error:&v93];
  id v47 = v93;

  mfxNormPerceptPSO = v8->_mfxNormPerceptPSO;
  v8->_mfxNormPerceptPSO = (MTLRenderPipelineState *)v46;

  v79 = (void *)[v87 newFunctionWithName:v77];
  id v49 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v49 setLabel:@"MFX_ScaleRenderPipelineStateV1"];
  [v49 setRasterSampleCount:1];
  [v49 setVertexFunction:v80];
  [v49 setFragmentFunction:v79];
  unint64_t v50 = v8->_intermediatePixelFormat;
  v51 = [v49 colorAttachments];
  v52 = [v51 objectAtIndexedSubscript:0];
  [v52 setPixelFormat:v50];

  id v53 = *p_device;
  id v92 = v47;
  uint64_t v54 = [v53 newRenderPipelineStateWithDescriptor:v49 error:&v92];
  id v83 = v92;

  mfxUpscalePSO = v8->_mfxUpscalePSO;
  v8->_mfxUpscalePSO = (MTLRenderPipelineState *)v54;

  v82 = (void *)[v87 newFunctionWithName:v76];
  id v56 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v56 setLabel:@"MFX_SharpenRenderPipelineStateV1"];
  [v56 setRasterSampleCount:1];
  [v56 setVertexFunction:v80];
  [v56 setFragmentFunction:v82];
  unint64_t v57 = v8->_intermediatePixelFormat;
  v58 = [v56 colorAttachments];
  v59 = [v58 objectAtIndexedSubscript:0];
  [v59 setPixelFormat:v57];

  id v60 = *p_device;
  id v91 = v83;
  uint64_t v61 = [v60 newRenderPipelineStateWithDescriptor:v56 error:&v91];
  id v62 = v91;

  mfxSharpenPSO = v8->_mfxSharpenPSO;
  v8->_mfxSharpenPSO = (MTLRenderPipelineState *)v61;

  v64 = (void *)[v87 newFunctionWithName:v75];
  id v65 = objc_alloc_init(MEMORY[0x263F12850]);
  [v65 setLabel:@"MFX_ScaleComputePipelineState"];
  [v65 setComputeFunction:v64];
  [v65 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
  id v66 = *p_device;
  id v90 = v62;
  uint64_t v67 = [v66 newComputePipelineStateWithDescriptor:v65 error:&v90];
  id v84 = v90;

  mfxUpscaleKernel = v8->_mfxUpscaleKernel;
  v8->_mfxUpscaleKernel = (MTLComputePipelineState *)v67;

  v69 = (void *)[v87 newFunctionWithName:v74];
  id v70 = objc_alloc_init(MEMORY[0x263F12850]);
  [v70 setLabel:@"MFX_SharpenComputePipelineState"];
  [v70 setComputeFunction:v69];
  [v70 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
  id v71 = *p_device;
  id v89 = v84;
  uint64_t v72 = [v71 newComputePipelineStateWithDescriptor:v70 error:&v89];
  id v25 = v89;

  mfxSharpenKernel = v8->_mfxSharpenKernel;
  v8->_mfxSharpenKernel = (MTLComputePipelineState *)v72;

  if (!v25
    && v8->_mfxPassDescriptor
    && v8->_mfxUpscaledTex
    && v8->_mfxUpscalePSO
    && v8->_mfxSharpenPSO
    && v8->_mfxNormPerceptPSO
    && v8->_mfxUpscaleKernel
    && v8->_mfxSharpenKernel
    && v80
    && v78
    && v79
    && v82)
  {
    [(_MTLFXSpatialScaler *)v8 _emitTelemetry:v7 forDevice:*p_device];
    v24 = v8;
  }
  else
  {
    MTLReportFailure();
    v24 = 0;
  }

LABEL_18:
  return v24;
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  -[_MFXSpatialScalingEffectEFFECT_NAME_V1 encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  [v4 commit];
}

- (void)encodeToCommandBuffer:(id)a3
{
  id v41 = a3;
  [(_MTLFXEffect *)self _beginEncode];
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_inputTexture, 0, 0, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    if ([(MTLTexture *)self->_outputTexture storageMode] != 2) {
      MTLReportFailure();
    }
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v54, 0, (uint64_t)self, 4, 0, 0);
  if (MTLTraceEnabled())
  {
    [v41 globalTraceObjectID];
    kdebug_trace();
  }
  int64_t colorProcessingMode = self->_colorProcessingMode;
  if (colorProcessingMode)
  {
    if (colorProcessingMode < 1)
    {
      int64_t v38 = self->_colorProcessingMode;
      int v5 = 0;
      goto LABEL_16;
    }
  }
  else if (self->_inputOutputNormalized)
  {
    if (!self->_inputLinear)
    {
      int v5 = 0;
      int64_t v38 = 0;
      goto LABEL_16;
    }
    int64_t colorProcessingMode = 1;
  }
  else
  {
    int64_t colorProcessingMode = 2;
  }
  int64_t v38 = colorProcessingMode;
  if (!self->_mfxNormPerceptTex)
  {
    [(MTLTextureDescriptor *)self->_texDesc setWidth:[(MTLTexture *)self->_inputTexture width]];
    [(MTLTextureDescriptor *)self->_texDesc setHeight:[(MTLTexture *)self->_inputTexture height]];
    v6 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:self->_texDesc];
    mfxNormPerceptTex = self->_mfxNormPerceptTex;
    self->_mfxNormPerceptTex = v6;

    [(MTLTexture *)self->_mfxNormPerceptTex setLabel:@"MetalFX_NormalizePerceptual"];
  }
  int v5 = 1;
LABEL_16:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  memset(v49, 0, sizeof(v49));
  unint64_t inputContentWidth = self->_inputContentWidth;
  unint64_t inputContentHeight = self->_inputContentHeight;
  unint64_t v10 = [(MTLTexture *)self->_inputTexture width];
  unint64_t v11 = [(MTLTexture *)self->_inputTexture height];
  unint64_t v12 = [(MTLTexture *)self->_outputTexture width];
  unint64_t v13 = [(MTLTexture *)self->_outputTexture height];
  float v14 = 1.0 / (float)v12;
  float v15 = 1.0 / (float)v13;
  *(float *)&long long v50 = v14 * (float)inputContentWidth;
  *((float *)&v50 + 1) = v15 * (float)inputContentHeight;
  *((float *)&v50 + 2) = (float)((float)((float)inputContentWidth * 0.5) * v14) + -0.5;
  *((float *)&v50 + 3) = (float)((float)((float)inputContentHeight * 0.5) * v15) + -0.5;
  *(float *)&long long v51 = 1.0 / (float)v10;
  *((float *)&v51 + 1) = 1.0 / (float)v11;
  DWORD2(v51) = v51;
  *((float *)&v51 + 3) = -*((float *)&v51 + 1);
  *(float *)&long long v52 = -*(float *)&v51;
  *((float *)&v52 + 1) = *((float *)&v51 + 1) + *((float *)&v51 + 1);
  *((float *)&v52 + 2) = *(float *)&v51;
  *((float *)&v52 + 3) = *((float *)&v51 + 1) + *((float *)&v51 + 1);
  *(float *)&long long v53 = *(float *)&v51 * 0.0;
  *((float *)&v53 + 1) = *((float *)&v51 + 1) * 4.0;
  *((void *)&v53 + 1) = 0;
  v49[0] = xmmword_245162A10;
  int v48 = 0;
  inputTexture = self->_inputTexture;
  if (!self->_inputSRGB)
  {
    v40 = inputTexture;
    goto LABEL_29;
  }
  uint64_t v17 = [(MTLTexture *)self->_inputTexture pixelFormat];
  if (v17 > 70)
  {
    if (v17 == 71)
    {
      uint64_t v18 = 70;
      goto LABEL_28;
    }
    if (v17 == 81)
    {
      uint64_t v18 = 80;
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v18 = 0;
    goto LABEL_28;
  }
  if (v17 == 11)
  {
    uint64_t v18 = 10;
    goto LABEL_28;
  }
  if (v17 != 31) {
    goto LABEL_27;
  }
  uint64_t v18 = 30;
LABEL_28:
  v40 = (MTLTexture *)[(MTLTexture *)inputTexture newTextureViewWithPixelFormat:v18];
LABEL_29:
  outputTexture = self->_outputTexture;
  if (self->_outputSRGB) {
    uint64_t v39 = (MTLTexture *)[(MTLTexture *)outputTexture newTextureViewWithPixelFormat:self->_intermediatePixelFormat];
  }
  else {
    uint64_t v39 = outputTexture;
  }
  if (v5)
  {
    v20 = self->_mfxNormPerceptTex;
    v21 = [(MTLRenderPassDescriptor *)self->_mfxPassDescriptor colorAttachments];
    uint64_t v22 = [v21 objectAtIndexedSubscript:0];
    [v22 setTexture:v20];

    uint64_t v23 = [v41 renderCommandEncoderWithDescriptor:self->_mfxPassDescriptor];
    [(_MTLFXEffect *)self _didCreateRenderCommandEncoder:v23 forEncode:self->super.super._encodeID];
    fence = self->_fence;
    if (fence) {
      [v23 waitForFence:fence beforeStages:2];
    }
    [v23 setLabel:@"MetalFX_Normalize"];
    LOBYTE(v48) = v38 == 2;
    *(_WORD *)((char *)&v48 + 1) = 1;
    HIBYTE(v48) = 0;
    [v23 setFragmentBytes:&v48 length:4 atIndex:0];
    [v23 setRenderPipelineState:self->_mfxNormPerceptPSO];
    [v23 setFragmentTexture:v40 atIndex:0];
    [v23 drawPrimitives:3 vertexStart:0 vertexCount:3];
    [v23 endEncoding];
  }
  if (self->_use3DPipeline)
  {
    mfxUpscaledTex = self->_mfxUpscaledTex;
    v26 = [(MTLRenderPassDescriptor *)self->_mfxPassDescriptor colorAttachments];
    v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setTexture:mfxUpscaledTex];

    v28 = [v41 renderCommandEncoderWithDescriptor:self->_mfxPassDescriptor];
    [v28 setLabel:@"MetalFX_Scale"];
    [(_MTLFXEffect *)self _didCreateRenderCommandEncoder:v28 forEncode:self->super.super._encodeID];
    uint64_t v29 = self->_fence;
    if (v29) {
      [v28 waitForFence:v29 beforeStages:2];
    }
    [v28 setFragmentBytes:&v50 length:64 atIndex:0];
    int v48 = 0;
    [v28 setFragmentBytes:&v48 length:4 atIndex:1];
    [v28 setRenderPipelineState:self->_mfxUpscalePSO];
    v30 = v40;
    if (v5) {
      v30 = self->_mfxNormPerceptTex;
    }
    [v28 setFragmentTexture:v30 atIndex:0];
    [v28 drawPrimitives:3 vertexStart:0 vertexCount:3];
    [v28 endEncoding];
    v31 = [(MTLRenderPassDescriptor *)self->_mfxPassDescriptor colorAttachments];
    BOOL v32 = [v31 objectAtIndexedSubscript:0];
    [v32 setTexture:v39];

    uint64_t v33 = [v41 renderCommandEncoderWithDescriptor:self->_mfxPassDescriptor];

    [v33 setLabel:@"MetalFX_Sharpen"];
    [(_MTLFXEffect *)self _didCreateRenderCommandEncoder:v33 forEncode:self->super.super._encodeID];
    [v33 setFragmentBytes:v49 length:64 atIndex:0];
    LOWORD(v48) = 0;
    BYTE2(v48) = v5;
    HIBYTE(v48) = v38 == 2;
    [v33 setFragmentBytes:&v48 length:4 atIndex:1];
    [v33 setRenderPipelineState:self->_mfxSharpenPSO];
    [v33 setFragmentTexture:self->_mfxUpscaledTex atIndex:0];
    [v33 drawPrimitives:3 vertexStart:0 vertexCount:3];
    uint64_t v34 = self->_fence;
    if (v34) {
      [v33 updateFence:v34 afterStages:2];
    }
    [v33 endEncoding];
  }
  else
  {
    uint64_t v33 = [v41 computeCommandEncoder];
    [(_MTLFXEffect *)self _didCreateComputeCommandEncoder:v33 forEncode:self->super.super._encodeID];
    [v33 setLabel:@"MetalFX_SpatialScaleSharpen"];
    if (self->_fence) {
      objc_msgSend(v33, "waitForFence:");
    }
    [v33 setComputePipelineState:self->_mfxUpscaleKernel];
    [v33 setBytes:&v50 length:64 atIndex:0];
    int v48 = 0;
    [v33 setBytes:&v48 length:4 atIndex:1];
    uint64_t v35 = v40;
    if (v5) {
      uint64_t v35 = self->_mfxNormPerceptTex;
    }
    [v33 setTexture:v35 atIndex:0];
    [v33 setTexture:self->_mfxUpscaledTex atIndex:1];
    uint64_t v36 = [(MTLTexture *)self->_outputTexture width];
    unint64_t v37 = (unint64_t)([(MTLTexture *)self->_outputTexture height] + 15) >> 4;
    v47[0] = (unint64_t)(v36 + 15) >> 4;
    v47[1] = v37;
    v47[2] = 1;
    long long v45 = xmmword_245162A20;
    uint64_t v46 = 1;
    [v33 dispatchThreadgroups:v47 threadsPerThreadgroup:&v45];
    [v33 setBytes:v49 length:64 atIndex:0];
    LOWORD(v48) = 0;
    BYTE2(v48) = v5;
    HIBYTE(v48) = v38 == 2;
    [v33 setBytes:&v48 length:4 atIndex:1];
    [v33 setTexture:self->_mfxUpscaledTex atIndex:0];
    [v33 setTexture:v39 atIndex:1];
    [v33 setComputePipelineState:self->_mfxSharpenKernel];
    v44[0] = (unint64_t)(v36 + 15) >> 4;
    v44[1] = v37;
    v44[2] = 1;
    long long v42 = xmmword_245162A20;
    uint64_t v43 = 1;
    [v33 dispatchThreadgroups:v44 threadsPerThreadgroup:&v42];
    if (self->_fence) {
      objc_msgSend(v33, "updateFence:");
    }
    [v33 endEncoding];
  }

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v54);
}

- (MTLTexture)colorTexture
{
  return self->_inputTexture;
}

- (void)setColorTexture:(id)a3
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

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
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

- (int64_t)colorProcessingMode
{
  return self->_colorProcessingMode;
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
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_texDesc, 0);
  objc_storeStrong((id *)&self->_mfxUpscaledTex, 0);
  objc_storeStrong((id *)&self->_mfxNormPerceptTex, 0);
  objc_storeStrong((id *)&self->_mfxPassDescriptor, 0);
  objc_storeStrong((id *)&self->_mfxSharpenKernel, 0);
  objc_storeStrong((id *)&self->_mfxUpscaleKernel, 0);
  objc_storeStrong((id *)&self->_mfxSharpenPSO, 0);
  objc_storeStrong((id *)&self->_mfxUpscalePSO, 0);
  objc_storeStrong((id *)&self->_mfxNormPerceptPSO, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end