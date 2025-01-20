@interface AVTARMaskRenderer
- (AVTARMaskRenderer)init;
- (AVTARMaskRenderer)initWithOwner:(id)a3 presentationConfiguration:(id)a4 techniqueDidChangeHandler:(id)a5;
- (AVTPresentationConfiguration)presentationConfiguration;
- (BOOL)flipDepth;
- (MTLTexture)capturedDepth;
- (SCNTechnique)technique;
- (float)depthSmoothingFactor;
- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4;
- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4 shouldClear:(BOOL)a5 clearColor:(id)a6;
- (void)_updateMaskParametersWithRootJointPivotPosition:(AVTARMaskRenderer *)self;
- (void)allocateTexturesIfNeededWithDestinationPixelFormat:(unint64_t)a3 size:(CGSize)a4;
- (void)dealloc;
- (void)encodeIntermediatePassesWithCommandBuffer:(id)a3 sceneColorTexture:(id)a4 sceneOnTopTexture:(id)a5 generatedMasksTexture:(id)a6 camDepthDebug:(id)a7;
- (void)initPipelineKindSpecificResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3;
- (void)initSharedResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3;
- (void)reloadTechnique;
- (void)setCapturedDepth:(id)a3;
- (void)setClearWithCamera:(BOOL)a3 antialiasingMode:(unint64_t)a4;
- (void)setDepthSmoothingFactor:(float)a3;
- (void)setFlipDepth:(BOOL)a3;
- (void)setPresentationConfiguration:(id)a3;
- (void)updateMaskParametersAtTime:(double)a3;
- (void)updateMaskParametersWithRootJointNode:(id)a3;
- (void)updateMaskParametersWithRootJointNodes:(id)a3;
- (void)updateWithARFrame:(id)a3 fallBackDepthData:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 mirroredDepthData:(BOOL)a7;
- (void)updateWithDepthTexture:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 mirroredDepthData:(BOOL)a6;
@end

@implementation AVTARMaskRenderer

- (AVTARMaskRenderer)initWithOwner:(id)a3 presentationConfiguration:(id)a4 techniqueDidChangeHandler:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTARMaskRenderer;
  v11 = [(AVTARMaskRenderer *)&v21 init];
  if (v11)
  {
    if (([v9 usesAR] & 1) == 0)
    {
      v12 = avt_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:]();
      }
    }
    objc_storeStrong((id *)&v11->_presentationConfiguration, a4);
    v11->_pipelineKind = 0;
    objc_storeWeak((id *)&v11->_owner, v8);
    objc_opt_class();
    v11->_ownerIsView = objc_opt_isKindOfClass() & 1;
    uint64_t v13 = [v10 copy];
    id techniqueDidChangeHandler = v11->_techniqueDidChangeHandler;
    v11->_id techniqueDidChangeHandler = (id)v13;

    if (AVTDebugARMask_onceToken != -1) {
      dispatch_once(&AVTDebugARMask_onceToken, &__block_literal_global_10);
    }
    v11->_debugMode = AVTDebugARMask_debugMode;
    *(_WORD *)&v11->_writeID = 256;
    v11->_depthSmoothingFactor = 0.5;
    v11->_depthDataIsMirrored = 0;
    v11->_interfaceOrientation = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_owner);
    v16 = [WeakRetained device];

    if (!v16)
    {
      v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:](v17);
      }
    }
    uint64_t v22 = *MEMORY[0x263F04070];
    v23[0] = &unk_26C00C490;
    CVMetalTextureCacheCreate(0, 0, v16, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1], &v11->_textureCache);
    uint64_t v18 = +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v16);
    metalHelper = v11->_metalHelper;
    v11->_metalHelper = (AVTMetalHelper *)v18;
  }
  return v11;
}

- (AVTARMaskRenderer)init
{
  return 0;
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (AVTPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  v5 = (AVTPresentationConfiguration *)a3;
  v6 = v5;
  if (self->_presentationConfiguration != v5)
  {
    if (![(AVTPresentationConfiguration *)v5 usesAR])
    {
      v7 = avt_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:]();
      }
    }
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    [(AVTARMaskRenderer *)self reloadTechnique];
  }
}

- (void)dealloc
{
  technique = self->_technique;
  self->_technique = 0;

  (*((void (**)(void))self->_techniqueDidChangeHandler + 2))();
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVTARMaskRenderer;
  [(AVTARMaskRenderer *)&v5 dealloc];
}

- (void)updateMaskParametersAtTime:(double)a3
{
  if (self->_pipelineKind == 1
    && [(AVTPresentationConfiguration *)self->_presentationConfiguration internalStyle] == 3)
  {
    v6 = self->_presentationConfiguration;
    [(AVTPresentationConfiguration *)v6 shadableKeyColorComponents];
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_108[8], v4))) & 0x80000000) != 0)
    {
      *(float32x4_t *)&self->_anon_108[8] = v4;
      objc_super v5 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
      [(SCNTechnique *)self->_technique setObject:v5 forKeyedSubscript:@"chromaKeyColor_symbol"];
    }
  }
}

- (void)updateMaskParametersWithRootJointNode:(id)a3
{
  [a3 simdWorldPosition];
  -[AVTARMaskRenderer _updateMaskParametersWithRootJointPivotPosition:](self, "_updateMaskParametersWithRootJointPivotPosition:");
}

- (void)updateMaskParametersWithRootJointNodes:(id)a3
{
  float32x4_t v4 = [a3 firstObject];
  [v4 simdWorldPosition];
  double v6 = v5;

  [(AVTARMaskRenderer *)self _updateMaskParametersWithRootJointPivotPosition:v6];
}

- (void)_updateMaskParametersWithRootJointPivotPosition:(AVTARMaskRenderer *)self
{
  if (self->_uniforms.headZ != (float)(*((float *)&v2 + 2) / -100.0))
  {
    self->_uniforms.headZ = *((float *)&v2 + 2) / -100.0;
    p_owner = &self->_owner;
    *(_OWORD *)v32 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(WeakRetained, "avt_simdProjectPoint:", *(double *)v32);
    float32x4_t v31 = v6;

    id v7 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v7, "avt_simdProjectPoint:", *(double *)vaddq_f32(*(float32x4_t *)v32, (float32x4_t)xmmword_20B890010).i64);
    int8x8_t v30 = v8;

    id v9 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v9, "avt_simdProjectPoint:", *(double *)vaddq_f32(*(float32x4_t *)v32, (float32x4_t)xmmword_20B890020).i64);
    *(_OWORD *)v33 = v10;

    *(float32x2_t *)&self->_uniforms.shadowUVOffset = vsub_f32((float32x2_t)vext_s8(v30, (int8x8_t)v33[0], 4uLL), (float32x2_t)vrev64_s32(*(int32x2_t *)v31.f32));
    LODWORD(self->_uniforms.shadowMaskSizeV) = vsubq_f32(*(float32x4_t *)v33, v31).i32[1];
    *(void *)&self->_uniforms.neckU = v31.i64[0];
    LODWORD(v9) = self->_ownerIsView;
    id v11 = objc_loadWeakRetained((id *)p_owner);
    v12 = v11;
    if (v9)
    {
      objc_msgSend(v11, "avt_simdViewport");
      v14.i64[1] = v13.i64[1];
      v14.i64[0] = v13.i64[1];
      *(float32x4_t *)&self->_uniforms.shadowUVOffset = vdivq_f32(*(float32x4_t *)&self->_uniforms.shadowUVOffset, (float32x4_t)vextq_s8(v13, v14, 0xCuLL));
      float v15 = self->_uniforms.neckV / *(float *)&v13.i32[3];
    }
    else
    {
      [v11 _backingSize];
      float64_t v17 = self->_uniforms.neckV / v16.f64[0];
      v16.f64[1] = v18;
      *(float32x4_t *)&self->_uniforms.shadowUVOffset = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_uniforms.shadowUVOffset), v16)), vdivq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->_uniforms.shadowUVOffset), v16));
      float v15 = v17;
    }
    self->_uniforms.neckV = v15;

    *(float *)&double v19 = self->_uniforms.headZ;
    v20 = [NSNumber numberWithFloat:v19];
    [(SCNTechnique *)self->_technique setObject:v20 forKeyedSubscript:@"headZ_symbol"];

    *(float *)&double v21 = self->_uniforms.neckU;
    uint64_t v22 = [NSNumber numberWithFloat:v21];
    [(SCNTechnique *)self->_technique setObject:v22 forKeyedSubscript:@"neckU_symbol"];

    *(float *)&double v23 = self->_uniforms.neckV;
    v24 = [NSNumber numberWithFloat:v23];
    [(SCNTechnique *)self->_technique setObject:v24 forKeyedSubscript:@"neckV_symbol"];

    *(float *)&double v25 = self->_uniforms.shadowMaskSizeU;
    v26 = [NSNumber numberWithFloat:v25];
    [(SCNTechnique *)self->_technique setObject:v26 forKeyedSubscript:@"shadowMaskSizeU_symbol"];

    *(float *)&double v27 = self->_uniforms.shadowMaskSizeV;
    v28 = [NSNumber numberWithFloat:v27];
    [(SCNTechnique *)self->_technique setObject:v28 forKeyedSubscript:@"shadowMaskSizeV_symbol"];

    *(float *)&double v29 = self->_uniforms.shadowUVOffset;
    v34 = [NSNumber numberWithFloat:v29];
    [(SCNTechnique *)self->_technique setObject:v34 forKeyedSubscript:@"shadowUVOffset_symbol"];
  }
}

- (void)updateWithARFrame:(id)a3 fallBackDepthData:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 mirroredDepthData:(BOOL)a7
{
  BOOL v7 = a7;
  double v25 = (ARFrame *)a3;
  id v12 = a4;
  if (self->_arFrame == v25) {
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_arFrame, a3);
  matteTexture = self->_matteTexture;
  self->_matteTexture = 0;

  if (self->_depthDataIsMirrored != v7 || self->_interfaceOrientation != a6)
  {
    self->_depthDataIsMirrored = v7;
    self->_interfaceOrientation = a6;
    self->_isFirstFrame = 1;
  }
  int8x16_t v14 = [(ARFrame *)v25 capturedImage];
  uint64_t v15 = [(ARFrame *)v25 capturedDepthData];
  float64x2_t v16 = (void *)v15;
  if (v15) {
    float64_t v17 = (void *)v15;
  }
  else {
    float64_t v17 = v12;
  }
  id v18 = v17;

  double v19 = AVTGetCapturedDepthTexture(v18, self->_textureCache);

  p_lastCapturedDepth = &self->_lastCapturedDepth;
  if (v19)
  {
    objc_storeStrong((id *)p_lastCapturedDepth, v19);
    unint64_t v21 = [v19 width];
    size_t Height = [v19 height];
    if (self->_capturedDataWidth == v21 && self->_capturedDataHeight == Height) {
      goto LABEL_18;
    }
    self->_capturedDatasize_t Width = v21;
  }
  else
  {
    if (*p_lastCapturedDepth) {
      goto LABEL_18;
    }
    if (!v14) {
      goto LABEL_18;
    }
    size_t Width = CVPixelBufferGetWidth(v14);
    size_t Height = CVPixelBufferGetHeight(v14);
    if (self->_capturedDataWidth == Width && self->_capturedDataHeight == Height) {
      goto LABEL_18;
    }
    self->_capturedDatasize_t Width = Width;
  }
  self->_capturedDatasize_t Height = Height;
  self->_isFirstFrame = 1;
LABEL_18:
  unint64_t v24 = [(ARFrame *)v25 segmentationBuffer] != 0;
  if (self->_pipelineKind != v24)
  {
    self->_pipelineKind = v24;
    [(AVTARMaskRenderer *)self reloadTechnique];
  }

LABEL_21:
}

- (void)updateWithDepthTexture:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 mirroredDepthData:(BOOL)a6
{
  BOOL v6 = a6;
  long long v10 = (MTLTexture *)a3;
  id v11 = v10;
  if (v10 && self->_lastCapturedDepth != v10)
  {
    uint64_t v15 = v10;
    arFrame = self->_arFrame;
    self->_arFrame = 0;

    matteTexture = self->_matteTexture;
    self->_matteTexture = 0;

    if (self->_pipelineKind)
    {
      self->_pipelineKind = 0;
      [(AVTARMaskRenderer *)self reloadTechnique];
    }
    if (self->_depthDataIsMirrored != v6 || self->_interfaceOrientation != a5)
    {
      self->_depthDataIsMirrored = v6;
      self->_interfaceOrientation = a5;
      self->_isFirstFrame = 1;
    }
    objc_storeStrong((id *)&self->_lastCapturedDepth, a3);
    unint64_t v14 = [(MTLTexture *)v15 width];
    long long v10 = (MTLTexture *)[(MTLTexture *)v15 height];
    id v11 = v15;
    if (self->_capturedDataWidth != v14 || (MTLTexture *)self->_capturedDataHeight != v10)
    {
      self->_capturedDatasize_t Width = v14;
      self->_capturedDatasize_t Height = (unint64_t)v10;
      self->_isFirstFrame = 1;
    }
  }
  MEMORY[0x270F9A758](v10, v11);
}

- (MTLTexture)capturedDepth
{
  return self->_lastCapturedDepth;
}

- (void)setCapturedDepth:(id)a3
{
  double v5 = (MTLTexture *)a3;
  p_lastCapturedDepth = &self->_lastCapturedDepth;
  if (self->_lastCapturedDepth != v5)
  {
    int8x8_t v8 = v5;
    objc_storeStrong((id *)p_lastCapturedDepth, a3);
    unint64_t v7 = [(MTLTexture *)v8 width];
    p_lastCapturedDepth = (MTLTexture **)[(MTLTexture *)v8 height];
    double v5 = v8;
    if (self->_capturedDataWidth != v7 || (MTLTexture **)self->_capturedDataHeight != p_lastCapturedDepth)
    {
      self->_capturedDatasize_t Width = v7;
      self->_capturedDatasize_t Height = (unint64_t)p_lastCapturedDepth;
      self->_isFirstFrame = 1;
    }
  }
  MEMORY[0x270F9A758](p_lastCapturedDepth, v5);
}

- (void)setFlipDepth:(BOOL)a3
{
  if (self->_depthDataIsMirrored != a3)
  {
    self->_depthDataIsMirrored = a3;
    self->_isFirstFrame = 1;
  }
}

- (void)initSharedResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3
{
  if (!self->_currentRenderPassDescriptor)
  {
    float32x4_t v4 = (MTLRenderPassDescriptor *)objc_alloc_init(MEMORY[0x263F12998]);
    currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
    self->_currentRenderPassDescriptor = v4;

    metalHelper = self->_metalHelper;
    long long v39 = unk_20B890490;
    long long v40 = unk_20B8904A0;
    long long v41 = unk_20B8904B0;
    long long v42 = unk_20B8904C0;
    uint64_t v38 = 115;
    v43 = @"AVT_fullscreen_quad_vertex";
    v44 = @"AVT_blurMaskX_high_fragment";
    uint64_t v45 = 1;
    if (metalHelper)
    {
      metalHelper = -[AVTMetalHelper renderPipelineStateWithDescriptor:](metalHelper, (uint64_t)&v38);
    }
    horizontalBlurPipelineState = self->_horizontalBlurPipelineState;
    self->_horizontalBlurPipelineState = (MTLRenderPipelineState *)metalHelper;

    int8x8_t v8 = self->_metalHelper;
    long long v31 = unk_20B890490;
    long long v32 = unk_20B8904A0;
    long long v33 = unk_20B8904B0;
    long long v34 = unk_20B8904C0;
    uint64_t v30 = 115;
    v35 = @"AVT_fullscreen_quad_vertex";
    v36 = @"AVT_blurMaskY_high_fragment";
    uint64_t v37 = 1;
    if (v8)
    {
      int8x8_t v8 = -[AVTMetalHelper renderPipelineStateWithDescriptor:](v8, (uint64_t)&v30);
    }
    verticalBlurPipelineState = self->_verticalBlurPipelineState;
    self->_verticalBlurPipelineState = (MTLRenderPipelineState *)v8;

    long long v10 = self->_metalHelper;
    uint64_t v22 = 115;
    long long v23 = unk_20B890490;
    long long v24 = unk_20B8904A0;
    long long v25 = unk_20B8904B0;
    long long v26 = unk_20B8904C0;
    double v27 = @"AVT_fullscreen_quad_orientation_vertex";
    v28 = @"AVT_mask_fragment";
    uint64_t v29 = 1;
    if (v10)
    {
      long long v10 = -[AVTMetalHelper renderPipelineStateWithDescriptor:](v10, (uint64_t)&v22);
    }
    generateMasksPipelineState = self->_generateMasksPipelineState;
    self->_generateMasksPipelineState = (MTLRenderPipelineState *)v10;

    if (self->_debugMode)
    {
      id v12 = self->_metalHelper;
      uint64_t v14 = 25;
      long long v15 = unk_20B890490;
      long long v16 = unk_20B8904A0;
      long long v17 = unk_20B8904B0;
      long long v18 = unk_20B8904C0;
      double v19 = @"AVT_fullscreen_quad_orientation_vertex";
      v20 = @"AVT_dbg_camDepth";
      uint64_t v21 = 1;
      if (v12)
      {
        id v12 = -[AVTMetalHelper renderPipelineStateWithDescriptor:](v12, (uint64_t)&v14);
      }
      debugCamDepthPipelineState = self->_debugCamDepthPipelineState;
      self->_debugCamDepthPipelineState = (MTLRenderPipelineState *)v12;
    }
  }
}

- (void)initPipelineKindSpecificResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3
{
  if (self->_pipelineKind == 1 && !self->_matteGenerator)
  {
    -[AVTMetalHelper device]((id *)&self->_metalHelper->super.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    float32x4_t v4 = (ARMatteGenerator *)[objc_alloc(MEMORY[0x263EF8F88]) initWithDevice:v6 matteResolution:1 useSmoothing:1];
    matteGenerator = self->_matteGenerator;
    self->_matteGenerator = v4;
  }
}

- (void)allocateTexturesIfNeededWithDestinationPixelFormat:(unint64_t)a3 size:(CGSize)a4
{
  if (a4.width != self->_renderSize.width || a4.height != self->_renderSize.height)
  {
    self->_renderSize = a4;
    self->_isFirstFrame = 1;
    float v6 = (a4.width + 3.0) * 0.25;
    float v7 = (a4.height + 3.0) * 0.25;
    -[AVTMetalHelper device]((id *)&self->_metalHelper->super.isa);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    int8x8_t v8 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:115 width:(unint64_t)v6 height:(unint64_t)v7 mipmapped:0];
    [v8 setUsage:5];
    [v8 setResourceOptions:32];
    id v9 = (MTLTexture *)[v15 newTextureWithDescriptor:v8];
    long long v10 = self->_rawMaskTexture[0];
    self->_rawMaskTexture[0] = v9;

    id v11 = (MTLTexture *)[v15 newTextureWithDescriptor:v8];
    id v12 = self->_rawMaskTexture[1];
    self->_rawMaskTexture[1] = v11;

    int8x16_t v13 = (MTLTexture *)[v15 newTextureWithDescriptor:v8];
    tmpMaskBlurTexture = self->_tmpMaskBlurTexture;
    self->_tmpMaskBlurTexture = v13;
  }
}

- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4
{
  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(MTLRenderPassDescriptor *)currentRenderPassDescriptor colorAttachments];
  long long v10 = [v9 objectAtIndexedSubscript:0];

  [v10 setLoadAction:0];
  [v10 setTexture:v7];

  id v11 = [v8 renderCommandEncoderWithDescriptor:self->_currentRenderPassDescriptor];

  return v11;
}

- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4 shouldClear:(BOOL)a5 clearColor:(id)a6
{
  double var3 = a6.var3;
  double var2 = a6.var2;
  double var1 = a6.var1;
  double var0 = a6.var0;
  BOOL v10 = a5;
  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  id v14 = a4;
  id v15 = a3;
  long long v16 = [(MTLRenderPassDescriptor *)currentRenderPassDescriptor colorAttachments];
  long long v17 = [v16 objectAtIndexedSubscript:0];

  if (v10) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  [v17 setLoadAction:v18];
  objc_msgSend(v17, "setClearColor:", var0, var1, var2, var3);
  [v17 setTexture:v14];

  double v19 = [v15 renderCommandEncoderWithDescriptor:self->_currentRenderPassDescriptor];

  return v19;
}

- (void)encodeIntermediatePassesWithCommandBuffer:(id)a3 sceneColorTexture:(id)a4 sceneOnTopTexture:(id)a5 generatedMasksTexture:(id)a6 camDepthDebug:(id)a7
{
  id v12 = a3;
  id v32 = a7;
  capturedDatasize_t Width = self->_capturedDataWidth;
  capturedDatasize_t Height = self->_capturedDataHeight;
  unint64_t interfaceOrientation = self->_interfaceOrientation;
  id v16 = a6;
  id v17 = a5;
  unint64_t v18 = AVTSceneKitTextureCoordinatesForCaptureDeviceTexture(a4, capturedDataWidth, capturedDataHeight, interfaceOrientation).n128_u64[0];
  *(void *)&self->_anon_108[24] = v18;
  *(void *)&self->_anon_108[32] = v19;
  *(void *)&self->_anon_108[40] = v20;
  *(void *)&self->_anon_108[48] = v21;
  if (self->_depthDataIsMirrored)
  {
    *((float *)&v18 + 1) = 1.0 - *((float *)&v18 + 1);
    *((float *)&v19 + 1) = 1.0 - *((float *)&v19 + 1);
    *(void *)&self->_anon_108[24] = v18;
    *(void *)&self->_anon_108[32] = v19;
    *((float *)&v20 + 1) = 1.0 - *((float *)&v20 + 1);
    *((float *)&v21 + 1) = 1.0 - *((float *)&v21 + 1);
    *(void *)&self->_anon_108[40] = v20;
    *(void *)&self->_anon_108[48] = v21;
  }
  if (self->_pipelineKind == 1 && self->_arFrame)
  {
    [v12 pushDebugGroup:@"[AvatarKit] Matte generation"];
    uint64_t v22 = [(ARMatteGenerator *)self->_matteGenerator generateMatteFromFrame:self->_arFrame commandBuffer:v12];
    matteTexture = self->_matteTexture;
    self->_matteTexture = v22;

    arFrame = self->_arFrame;
    self->_arFrame = 0;

    [v12 popDebugGroup];
  }
  long long v25 = [(MTLRenderPassDescriptor *)self->_currentRenderPassDescriptor colorAttachments];
  long long v26 = [v25 objectAtIndexedSubscript:0];

  [v26 setLoadAction:0];
  [v26 setStoreAction:1];
  [v12 pushDebugGroup:@"[AvatarKit] Generate masks"];
  double v27 = [(AVTARMaskRenderer *)self _renderCommandEncoderWithCommandBuffer:v12 renderTarget:self->_rawMaskTexture[self->_writeID]];
  [v27 setRenderPipelineState:self->_generateMasksPipelineState];
  [v27 setVertexBytes:&self->_anon_108[24] length:32 atIndex:0];
  [v27 setFragmentTexture:self->_lastCapturedDepth atIndex:0];
  [v27 setFragmentTexture:self->_rawMaskTexture[!self->_writeID] atIndex:1];
  [v27 setFragmentTexture:v17 atIndex:2];

  if (self->_pipelineKind == 1) {
    [v27 setFragmentTexture:self->_matteTexture atIndex:3];
  }
  float depthSmoothingFactor = 0.0;
  if (!self->_isFirstFrame) {
    float depthSmoothingFactor = self->_depthSmoothingFactor;
  }
  float v34 = depthSmoothingFactor;
  [v27 setFragmentBytes:&self->_uniforms length:4 atIndex:0];
  [v27 setFragmentBytes:&v34 length:4 atIndex:1];
  [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v27 endEncoding];

  [v12 popDebugGroup];
  [v12 pushDebugGroup:@"[AvatarKit] Blur masks"];
  uint64_t v29 = [(AVTARMaskRenderer *)self _renderCommandEncoderWithCommandBuffer:v12 renderTarget:self->_tmpMaskBlurTexture];
  [v29 setRenderPipelineState:self->_horizontalBlurPipelineState];
  [v29 setFragmentTexture:self->_rawMaskTexture[self->_writeID] atIndex:0];
  [v29 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v29 endEncoding];
  uint64_t v30 = [(AVTARMaskRenderer *)self _renderCommandEncoderWithCommandBuffer:v12 renderTarget:v16];

  [v30 setRenderPipelineState:self->_verticalBlurPipelineState];
  [v30 setFragmentTexture:self->_tmpMaskBlurTexture atIndex:0];
  [v30 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v30 endEncoding];

  [v12 popDebugGroup];
  if (self->_debugMode)
  {
    [v12 pushDebugGroup:@"[AvatarKit] Generate depth texture"];
    long long v31 = [(AVTARMaskRenderer *)self _renderCommandEncoderWithCommandBuffer:v12 renderTarget:v33];
    [v31 setRenderPipelineState:self->_debugCamDepthPipelineState];
    [v31 setVertexBytes:&self->_anon_108[24] length:32 atIndex:0];
    [v31 setFragmentTexture:self->_lastCapturedDepth atIndex:0];
    [v31 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v31 endEncoding];

    [v12 popDebugGroup];
  }
  self->_writeID ^= 1u;
  self->_isFirstFrame = 0;
}

- (void)setClearWithCamera:(BOOL)a3 antialiasingMode:(unint64_t)a4
{
  self->_clearWithCamera = a3;
  self->_antialiasingMode = a4;
  [(AVTARMaskRenderer *)self reloadTechnique];
}

- (void)reloadTechnique
{
  +[AVTResourceLocator sharedResourceLocator]();
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v3, @"SimplePassTechnique.json", 0);

  +[AVTResourceLocator sharedResourceLocator]();
  double v5 = (id *)objc_claimAutoreleasedReturnValue();
  float v6 = v5;
  if (self->_debugMode) {
    id v7 = @"ARMaskTechniqueDbg.json";
  }
  else {
    id v7 = @"ARMaskTechnique.json";
  }
  uint64_t v8 = -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v5, (uint64_t)v7, 0);

  id v9 = (void *)MEMORY[0x263F08900];
  v61 = (void *)v4;
  BOOL v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  id v66 = 0;
  id v11 = [v9 JSONObjectWithData:v10 options:1 error:&v66];
  id v12 = v66;

  int8x16_t v13 = (void *)MEMORY[0x263F08900];
  v60 = (void *)v8;
  id v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
  id v65 = v12;
  id v15 = [v13 JSONObjectWithData:v14 options:1 error:&v65];
  id v59 = v65;

  id v16 = [v11 objectForKeyedSubscript:@"passes"];
  id v17 = [v15 objectForKeyedSubscript:@"passes"];
  unint64_t antialiasingMode = self->_antialiasingMode;
  if (antialiasingMode == 1) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  if (antialiasingMode == 2) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = v19;
  }
  uint64_t v21 = [NSNumber numberWithInteger:v20];
  uint64_t v22 = [v16 objectForKeyedSubscript:@"ScenePass"];
  [v22 setObject:v21 forKeyedSubscript:@"samples"];

  if (self->_pipelineKind == 1)
  {
    long long v23 = [v17 objectForKeyedSubscript:@"CompositePass"];
    if ([(AVTPresentationConfiguration *)self->_presentationConfiguration internalStyle] == 3)
    {
      long long v24 = [v15 objectForKeyedSubscript:@"symbols"];
      [v24 setObject:&unk_26C014250 forKeyedSubscript:@"chromaKeyColor_symbol"];

      long long v25 = [v23 objectForKeyedSubscript:@"inputs"];
      [v25 setObject:@"chromaKeyColor_symbol" forKeyedSubscript:@"chromaKeyColor"];

      long long v26 = @"AVT_composite_fragment_matte_chroma_key";
    }
    else
    {
      long long v26 = @"AVT_composite_fragment_matte";
    }
    [v23 setObject:v26 forKeyedSubscript:@"metalFragmentShader"];
  }
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v28 = (void *)[v16 mutableCopy];
  uint64_t v29 = v28;
  if (v28) {
    id v30 = v28;
  }
  else {
    id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  long long v31 = v30;

  v57 = v17;
  [v31 addEntriesFromDictionary:v17];
  [v27 setObject:v31 forKeyedSubscript:@"passes"];
  id v32 = [v11 objectForKeyedSubscript:@"sequence"];
  long long v33 = (void *)[v32 mutableCopy];
  float v34 = v33;
  if (v33) {
    id v35 = v33;
  }
  else {
    id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  v36 = v35;

  uint64_t v37 = [v15 objectForKeyedSubscript:@"sequence"];
  [v36 addObjectsFromArray:v37];

  [v27 setObject:v36 forKeyedSubscript:@"sequence"];
  uint64_t v38 = [v11 objectForKeyedSubscript:@"targets"];
  long long v39 = (void *)[v38 mutableCopy];
  long long v40 = v39;
  v58 = v16;
  if (v39) {
    id v41 = v39;
  }
  else {
    id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  long long v42 = v41;

  v43 = [v15 objectForKeyedSubscript:@"targets"];
  [v42 addEntriesFromDictionary:v43];

  [v27 setObject:v42 forKeyedSubscript:@"targets"];
  v44 = [v11 objectForKeyedSubscript:@"symbols"];
  uint64_t v45 = (void *)[v44 mutableCopy];
  v46 = v45;
  if (v45) {
    id v47 = v45;
  }
  else {
    id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v48 = v47;

  v49 = [v15 objectForKeyedSubscript:@"symbols"];
  [v48 addEntriesFromDictionary:v49];

  [v27 setObject:v48 forKeyedSubscript:@"symbols"];
  if (!self->_clearWithCamera && !self->_debugMode)
  {
    v50 = [v31 objectForKeyedSubscript:@"CompositePass"];
    [v50 removeObjectForKey:@"colorStates"];
  }
  v51 = [MEMORY[0x263F16B00] techniqueWithDictionary:v27];
  technique = self->_technique;
  self->_technique = v51;

  v53 = -[AVTMetalHelper library]((os_unfair_lock_s *)self->_metalHelper);
  [(SCNTechnique *)self->_technique setLibrary:v53];

  v54 = [v27 objectForKeyedSubscript:@"sequence"];
  uint64_t v55 = [v54 indexOfObject:@"CustomPass"];

  v56 = [(SCNTechnique *)self->_technique passAtIndex:v55];
  objc_initWeak(&location, self);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __36__AVTARMaskRenderer_reloadTechnique__block_invoke;
  v62[3] = &unk_2640202F8;
  objc_copyWeak(&v63, &location);
  v62[4] = self;
  [v56 setExecutionHandler:v62];
  self->_isFirstFrame = 1;
  (*((void (**)(void))self->_techniqueDidChangeHandler + 2))();
  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
}

void __36__AVTARMaskRenderer_reloadTechnique__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [v9 inputTextureWithName:@"sceneColorTexture_target"];
  double v5 = [v9 inputTextureWithName:@"sceneOnTopTexture_target"];
  if ([v4 width] && objc_msgSend(v4, "height"))
  {
    [*(id *)(a1 + 32) initSharedResourcesIfNeededWithDestinationPixelFormat:0];
    [*(id *)(a1 + 32) initPipelineKindSpecificResourcesIfNeededWithDestinationPixelFormat:0];
    objc_msgSend(*(id *)(a1 + 32), "allocateTexturesIfNeededWithDestinationPixelFormat:size:", 0, (double)(unint64_t)objc_msgSend(v4, "width"), (double)(unint64_t)objc_msgSend(v4, "height"));
    float v6 = [v9 commandBuffer];
    id v7 = [v9 outputTextureWithName:@"mask_target"];
    if (WeakRetained[42])
    {
      uint64_t v8 = [v9 outputTextureWithName:@"camDepth_target"];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [WeakRetained encodeIntermediatePassesWithCommandBuffer:v6 sceneColorTexture:v4 sceneOnTopTexture:v5 generatedMasksTexture:v7 camDepthDebug:v8];
  }
}

- (float)depthSmoothingFactor
{
  return self->_depthSmoothingFactor;
}

- (void)setDepthSmoothingFactor:(float)a3
{
  self->_float depthSmoothingFactor = a3;
}

- (BOOL)flipDepth
{
  return self->_flipDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_techniqueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_debugCamDepthPipelineState, 0);
  objc_storeStrong((id *)&self->_debugVisualizationPipelineState, 0);
  objc_storeStrong((id *)&self->_verticalBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_horizontalBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_generateMasksPipelineState, 0);
  objc_storeStrong((id *)&self->_currentRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_metalHelper, 0);
  objc_storeStrong((id *)&self->_tmpMaskBlurTexture, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_rawMaskTexture[i + 1], 0);
  objc_storeStrong((id *)&self->_lastCapturedDepth, 0);
  objc_storeStrong((id *)&self->_matteTexture, 0);
  objc_storeStrong((id *)&self->_matteGenerator, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)initWithOwner:(os_log_t)log presentationConfiguration:techniqueDidChangeHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  long long v2 = "device";
}

- (void)initWithOwner:presentationConfiguration:techniqueDidChangeHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_20B819000, v0, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Invalid presentation configuration %@", (uint8_t *)v1, 0x16u);
}

@end