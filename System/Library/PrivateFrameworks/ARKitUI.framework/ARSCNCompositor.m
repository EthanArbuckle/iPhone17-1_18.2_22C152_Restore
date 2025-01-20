@interface ARSCNCompositor
+ (id)mattingTechniqueDual;
+ (id)mattingWithDepthAndDualTechnique;
+ (id)techniqueDictionaryWithName:(id)a3;
- (ARFrame)currentFrame;
- (ARSCNCompositor)initWithView:(id)a3 mode:(int64_t)a4 algorithm:(int64_t)a5;
- (BOOL)showOcclusionGeometry;
- (CGSize)currentSize;
- (MTLTexture)alphaTexture;
- (double)depthScale;
- (double)filterEpsilon;
- (double)filterOffset;
- (double)filterScale;
- (float32x2_t)orientedVerticesWithResolution:(double)a3;
- (int64_t)compositorAlgorithm;
- (int64_t)currentOrientation;
- (int64_t)mode;
- (unint64_t)dilationRadius;
- (unint64_t)erosionRadius;
- (unint64_t)foregroundBitMask;
- (unint64_t)uncertaintyRadius;
- (void)dealloc;
- (void)encodeAlphaResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6;
- (void)encodeDepthResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6;
- (void)executeOcclusionDepthStencilCallback:(id)a3;
- (void)executeOverlayMatteCallbackDual:(id)a3;
- (void)setCompositorAlgorithm:(int64_t)a3;
- (void)setCurrentFrame:(id)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setCurrentSize:(CGSize)a3;
- (void)setDepthScale:(double)a3;
- (void)setDilationRadius:(unint64_t)a3;
- (void)setErosionRadius:(unint64_t)a3;
- (void)setFilterEpsilon:(double)a3;
- (void)setFilterOffset:(double)a3;
- (void)setFilterScale:(double)a3;
- (void)setForegroundBitMask:(unint64_t)a3;
- (void)setShowOcclusionGeometry:(BOOL)a3;
- (void)setUncertaintyRadius:(unint64_t)a3;
@end

@implementation ARSCNCompositor

- (ARSCNCompositor)initWithView:(id)a3 mode:(int64_t)a4 algorithm:(int64_t)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ARSCNCompositor;
  v9 = [(ARSCNCompositor *)&v66 init];
  [(ARSCNCompositor *)v9 setCompositorAlgorithm:a5];
  if (!v9) {
    goto LABEL_19;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke;
  block[3] = &unk_264000B30;
  v10 = v9;
  v64 = v10;
  id v11 = v8;
  id v65 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v10->_int64_t mode = a4;
  v57 = [v11 session];
  v58 = [v57 configuration];
  int64_t compositorAlgorithm = v10->_compositorAlgorithm;
  id v13 = objc_alloc(MEMORY[0x263F20EE8]);
  v14 = [v11 device];
  uint64_t v15 = [v13 initWithDevice:v14 matteResolution:0 useSmoothing:compositorAlgorithm == 1];
  matteGenerator = v10->_matteGenerator;
  v10->_matteGenerator = (ARMatteGenerator *)v15;

  int64_t mode = v10->_mode;
  if (mode)
  {
    if (mode != 1) {
      goto LABEL_8;
    }
    uint64_t v18 = +[ARSCNCompositor mattingTechniqueDual];
  }
  else
  {
    uint64_t v18 = +[ARSCNCompositor mattingWithDepthAndDualTechnique];
  }
  technique = v10->_technique;
  v10->_technique = (SCNTechnique *)v18;

  if (!v10->_mode)
  {
    v10->_disableReverseZ = [v11 usesReverseZ] ^ 1;
    v20 = v10->_technique;
    v21 = objc_msgSend(NSNumber, "numberWithBool:");
    [(SCNTechnique *)v20 setObject:v21 forKeyedSubscript:@"disableReverseZ_sym"];
  }
LABEL_8:
  v22 = [v58 videoFormat];
  v23 = v22;
  if (v22)
  {
    [v22 imageResolution];
  }
  else
  {
    double v25 = 1440.0;
    double v24 = 1920.0;
  }
  v10->_workingResolution.width = v24 * 0.25;
  v10->_workingResolution.height = v25 * 0.25;
  [v11 currentViewport];
  -[ARSCNCompositor setCurrentSize:](v10, "setCurrentSize:", v26, v27);
  float workingScaleFactor = v10->_workingScaleFactor;
  if (workingScaleFactor == 0.0)
  {
    v50 = _ARLogGeneral();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)location = 138544130;
      *(void *)&location[4] = v52;
      __int16 v68 = 2048;
      v69 = v10;
      __int16 v70 = 2048;
      int64_t v71 = a4;
      __int16 v72 = 2048;
      int64_t v73 = a5;
      _os_log_impl(&dword_20B202000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARSCNCompositor (%li, %li) initialization failed. Matting is not set up properly.", location, 0x2Au);
    }
  }
  else
  {
    objc_initWeak((id *)location, v10);
    v56 = [(SCNTechnique *)v10->_technique passForName:@"ComputeCoefficientsPassDual"];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_40;
    v61[3] = &unk_264000B58;
    v55 = &v62;
    objc_copyWeak(&v62, (id *)location);
    [v56 setExecutionHandler:v61];
    if (!v10->_mode)
    {
      v29 = [(SCNTechnique *)v10->_technique passForName:@"ComputeDepthStencilPass", &v62];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_2;
      v59[3] = &unk_264000B58;
      objc_copyWeak(&v60, (id *)location);
      [v29 setExecutionHandler:v59];
      objc_destroyWeak(&v60);
    }
    id v30 = objc_storeWeak((id *)&v10->_view, v11);
    uint64_t v31 = [v11 device];
    device = v10->_device;
    v10->_device = (MTLDevice *)v31;

    v33 = ARKitUIBundle();
    v34 = [v33 URLForResource:@"default" withExtension:@"metallib"];

    uint64_t v35 = [(MTLDevice *)v10->_device newLibraryWithURL:v34 error:0];
    mattingLibrary = v10->_mattingLibrary;
    v10->_mattingLibrary = (MTLLibrary *)v35;

    [(SCNTechnique *)v10->_technique setLibrary:v10->_mattingLibrary];
    v37 = v10->_technique;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_view);
    [WeakRetained setTechnique:v37];

    v39 = (void *)[(MTLLibrary *)v10->_mattingLibrary newFunctionWithName:@"resample_v"];
    v40 = (void *)[(MTLLibrary *)v10->_mattingLibrary newFunctionWithName:@"resample_f"];
    id v41 = objc_alloc_init(MEMORY[0x263F129C0]);
    [v41 setVertexFunction:v39];
    [v41 setFragmentFunction:v40];
    v42 = [v41 colorAttachments];
    v43 = [v42 objectAtIndexedSubscript:0];
    [v43 setPixelFormat:10];

    uint64_t v44 = [(MTLDevice *)v10->_device newRenderPipelineStateWithDescriptor:v41 error:0];
    resampleML = v10->_resampleML;
    v10->_resampleML = (MTLRenderPipelineState *)v44;

    v46 = [v41 colorAttachments];
    v47 = [v46 objectAtIndexedSubscript:0];
    [v47 setPixelFormat:25];

    [v41 setFragmentFunction:v40];
    uint64_t v48 = [(MTLDevice *)v10->_device newRenderPipelineStateWithDescriptor:v41 error:0];
    resampleDepthML = v10->_resampleDepthML;
    v10->_resampleDepthML = (MTLRenderPipelineState *)v48;

    objc_destroyWeak(v55);
    objc_destroyWeak((id *)location);
  }

  if (workingScaleFactor == 0.0)
  {
    v53 = 0;
    goto LABEL_21;
  }
LABEL_19:
  v53 = v9;
LABEL_21:

  return v53;
}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) window];
  v2 = [v3 windowScene];
  *(void *)(*(void *)(a1 + 32) + 144) = [v2 interfaceOrientation];
}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_40(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained executeOverlayMatteCallbackDual:v3];
}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained executeOcclusionDepthStencilCallback:v3];
}

- (void)dealloc
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = [WeakRetained technique];
  technique = self->_technique;

  if (v5 == technique)
  {
    id v7 = objc_loadWeakRetained((id *)p_view);
    [v7 setTechnique:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)ARSCNCompositor;
  [(ARSCNCompositor *)&v8 dealloc];
}

- (void)setForegroundBitMask:(unint64_t)a3
{
  self->_foregroundBitMask = a3;
}

- (void)setUncertaintyRadius:(unint64_t)a3
{
  if (a3 <= 1) {
    a3 = 1;
  }
  self->_uncertaintyRadius = a3;
  matteGenerator = self->_matteGenerator;
  if (matteGenerator) {
    -[ARMatteGenerator setUncertaintyRadius:](matteGenerator, "setUncertaintyRadius:");
  }
}

- (void)setErosionRadius:(unint64_t)a3
{
  self->_erodeRadius = a3;
  matteGenerator = self->_matteGenerator;
  if (matteGenerator) {
    -[ARMatteGenerator setErosionRadius:](matteGenerator, "setErosionRadius:");
  }
}

- (void)setFilterEpsilon:(double)a3
{
  self->_filterEpsilon = a3;
}

- (void)setFilterScale:(double)a3
{
  self->_filterScale = a3;
  technique = self->_technique;
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setObject:forKeyedSubscript:](technique, "setObject:forKeyedSubscript:");
}

- (void)setFilterOffset:(double)a3
{
  self->_filterOffset = a3;
  technique = self->_technique;
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setObject:forKeyedSubscript:](technique, "setObject:forKeyedSubscript:");
}

- (void)setCurrentSize:(CGSize)a3
{
  if (a3.width * a3.height > 0.0)
  {
    if (a3.width <= a3.height) {
      double width = a3.width;
    }
    else {
      double width = a3.height;
    }
    if (a3.width <= a3.height) {
      a3.double width = a3.height;
    }
    self->_currentSize.double width = width;
    self->_currentSize.double height = a3.width;
    float v5 = a3.width;
    double height = self->_workingResolution.width;
    if (height <= self->_workingResolution.height) {
      double height = self->_workingResolution.height;
    }
    float v7 = height / v5;
    self->_float workingScaleFactor = v7;
    objc_super v8 = objc_msgSend(NSNumber, "numberWithFloat:");
    if (!self->_mode)
    {
      id v10 = v8;
      v9 = [(SCNTechnique *)self->_technique passForName:@"ComputeDepthStencilPass"];
      [v9 setValue:v10 forPassPropertyKey:1];

      objc_super v8 = v10;
    }
  }
}

- (void)encodeAlphaResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  -[ARSCNCompositor orientedVerticesWithResolution:](self, "orientedVerticesWithResolution:", width, height);
  uint64_t v32 = v14;
  __asm { FMOV            V0.2S, #1.0 }
  v23 = objc_msgSend(MEMORY[0x263F129A0], "renderPassDescriptor", 1065353216, 0, _D0, 0x3F80000000000000, v32, v20, v21, v22);
  double v24 = [v23 colorAttachments];
  double v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setTexture:v13];

  double v26 = [v23 colorAttachments];
  double v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setLoadAction:2];

  v28 = [v23 colorAttachments];
  v29 = [v28 objectAtIndexedSubscript:0];
  [v29 setStoreAction:1];

  id v30 = [v11 renderCommandEncoderWithDescriptor:v23];
  [v30 setLabel:@"ML stencil resample"];
  [v30 setRenderPipelineState:self->_resampleML];
  [v30 setVertexBytes:&v32 length:32 atIndex:0];
  [v30 setVertexBytes:&v31 length:32 atIndex:1];
  [v30 setFragmentTexture:v12 atIndex:0];
  [v30 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v30 endEncoding];
}

- (void)encodeDepthResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  -[ARSCNCompositor orientedVerticesWithResolution:](self, "orientedVerticesWithResolution:", width, height);
  uint64_t v32 = v14;
  __asm { FMOV            V0.2S, #1.0 }
  v23 = objc_msgSend(MEMORY[0x263F129A0], "renderPassDescriptor", 1065353216, 0, _D0, 0x3F80000000000000, v32, v20, v21, v22);
  double v24 = [v23 colorAttachments];
  double v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setTexture:v13];

  double v26 = [v23 colorAttachments];
  double v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setLoadAction:2];

  v28 = [v23 colorAttachments];
  v29 = [v28 objectAtIndexedSubscript:0];
  [v29 setStoreAction:1];

  id v30 = [v11 renderCommandEncoderWithDescriptor:v23];
  [v30 setLabel:@"ML estimated depth resample"];
  [v30 setRenderPipelineState:self->_resampleDepthML];
  [v30 setVertexBytes:&v32 length:32 atIndex:0];
  [v30 setVertexBytes:&v31 length:32 atIndex:1];
  [v30 setFragmentTexture:v12 atIndex:0];
  [v30 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v30 endEncoding];
}

- (float32x2_t)orientedVerticesWithResolution:(double)a3
{
  v24[5] = *MEMORY[0x263EF8340];
  double v3 = a1[25];
  double v4 = a1[26];
  uint64_t v5 = *((void *)a1 + 18);
  if (v5 == 3)
  {
    uint64_t v5 = 4;
  }
  else
  {
    if (v5 != 4)
    {
      double v6 = v3;
      double v3 = v4;
      goto LABEL_7;
    }
    uint64_t v5 = 3;
  }
  double v6 = v4;
LABEL_7:
  memset(&v22, 0, sizeof(v22));
  ARCameraImageToViewTransform(v5, 0, &v22, a2, a3, v6, v3);
  uint64_t v7 = 0;
  v23[0] = 0uLL;
  v24[0] = 0;
  v23[1] = (float64x2_t)0x3FF0000000000000uLL;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v24[1] = _Q0;
  v24[3] = 0x3FF0000000000000;
  long long v13 = *(_OWORD *)&v22.c;
  float64x2_t v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.a, 0);
  float64x2_t v15 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.tx, 0);
  __asm { FMOV            V4.2D, #2.0 }
  float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.b, 0);
  __asm { FMOV            V6.2D, #-1.0 }
  float64x2_t v19 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.ty, 0);
  do
  {
    uint64_t v20 = &v23[v7];
    float64x2x2_t v25 = vld2q_f64(v20->f64);
    v26.val[0] = vmlaq_f64(_Q6, _Q4, vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v25.val[1], *(double *)&v13), v25.val[0], v14)));
    v26.val[1] = vmlaq_f64(_Q6, _Q4, vaddq_f64(v19, vmlaq_f64(vmulq_n_f64(v25.val[1], *((double *)&v13 + 1)), v25.val[0], v17)));
    vst2q_f64(v20->f64, v26);
    v7 += 2;
  }
  while (v7 != 4);
  return vcvt_f32_f64(v23[0]);
}

- (void)executeOverlayMatteCallbackDual:(id)a3
{
  id v9 = a3;
  kdebug_trace();
  double v4 = [v9 commandBuffer];
  uint64_t v5 = [v9 outputTextureWithName:@"alpha_target"];
  currentFrame = self->_currentFrame;
  if (currentFrame)
  {
    uint64_t v7 = [(ARMatteGenerator *)self->_matteGenerator generateMatteFromFrame:currentFrame commandBuffer:v4];
    alphaTexture = self->_alphaTexture;
    self->_alphaTexture = v7;

    -[ARSCNCompositor encodeAlphaResampleToCommandBuffer:resolution:input:output:](self, "encodeAlphaResampleToCommandBuffer:resolution:input:output:", v4, self->_alphaTexture, v5, (double)(unint64_t)[(MTLTexture *)self->_alphaTexture width], (double)(unint64_t)[(MTLTexture *)self->_alphaTexture height]);
    kdebug_trace();
  }
}

- (void)executeOcclusionDepthStencilCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 commandBuffer];
  double v6 = [v4 outputTextureWithName:@"occluderDepthStencilDilated_target"];
  uint64_t v7 = [(ARMatteGenerator *)self->_matteGenerator generateDilatedDepthFromFrame:self->_currentFrame commandBuffer:v5];
  -[ARSCNCompositor encodeDepthResampleToCommandBuffer:resolution:input:output:](self, "encodeDepthResampleToCommandBuffer:resolution:input:output:", v5, v7, v6, (double)(unint64_t)[v7 width], (double)(unint64_t)objc_msgSend(v7, "height"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v9 = [WeakRetained pointOfView];
  id v10 = [v9 camera];
  id v12 = v10;
  if (v10)
  {
    [v10 projectionTransform];
    int8x16_t v13 = v33;
    LODWORD(v14) = v34.i32[0];
    __int32 v15 = v33.i32[3];
    __int32 v16 = v34.i32[1];
    __int32 v18 = v35.i32[0];
    int8x16_t v17 = v36;
    int8x16_t v19 = vextq_s8(v36, (int8x16_t)vtrn2q_s32(v35, (int32x4_t)v36), 4uLL);
    int8x16_t v20 = (int8x16_t)vzip2q_s64((int64x2_t)v35, v34);
    int8x16_t v11 = vextq_s8(v13, v13, 8uLL);
    *(int8x8_t *)v11.i8 = vext_s8(*(int8x8_t *)v33.i8, *(int8x8_t *)v11.i8, 4uLL);
  }
  else
  {
    int8x16_t v17 = 0uLL;
    v11.i64[0] = 0;
    __int32 v16 = 0;
    int32x4_t v35 = 0u;
    int8x16_t v36 = 0u;
    int8x16_t v33 = 0u;
    int64x2_t v34 = 0u;
    __int32 v18 = 0;
    LODWORD(v14) = 0;
    __int32 v15 = 0;
    int8x16_t v13 = 0uLL;
    int8x16_t v19 = 0uLL;
    int8x16_t v20 = 0uLL;
  }
  int8x16_t v21 = vextq_s8(vextq_s8(v13, v13, 4uLL), v11, 0xCuLL);
  v21.i32[3] = v15;
  DWORD1(v14) = v16;
  *((void *)&v14 + 1) = v20.i64[1];
  int8x16_t v22 = vextq_s8(v19, v20, 8uLL);
  v22.i32[0] = v18;
  int8x16_t v30 = v22;
  int8x16_t v31 = v21;
  long long v28 = v14;
  int8x16_t v29 = vextq_s8(vextq_s8(v17, v17, 4uLL), v19, 0xCuLL);

  if (self->_disableReverseZ)
  {
    long long v23 = v28;
    int8x16_t v24 = v29;
    int8x16_t v26 = v30;
    int8x16_t v25 = v31;
  }
  else
  {
    ARMatrixPerspectiveFlipZ();
  }
  v32[0] = v25;
  v32[1] = v23;
  v32[2] = v26;
  v32[3] = v24;
  double v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNMatrix4:", v32, v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31);
  [(SCNTechnique *)self->_technique setValue:v27 forKey:@"projection_sym"];
}

+ (id)techniqueDictionaryWithName:(id)a3
{
  id v3 = a3;
  id v4 = ARKitCoreBundle();
  uint64_t v5 = [v4 URLForResource:v3 withExtension:@"json" subdirectory:@"Matting"];

  double v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
  uint64_t v9 = 0;
  uint64_t v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v9];

  return v7;
}

+ (id)mattingWithDepthAndDualTechnique
{
  v2 = +[ARSCNCompositor techniqueDictionaryWithName:@"mattingWithDepthAndDualTechnique"];
  id v3 = [MEMORY[0x263F16B00] techniqueWithDictionary:v2];

  return v3;
}

+ (id)mattingTechniqueDual
{
  v2 = +[ARSCNCompositor techniqueDictionaryWithName:@"mattingTechniqueDual"];
  id v3 = [MEMORY[0x263F16B00] techniqueWithDictionary:v2];

  return v3;
}

- (unint64_t)uncertaintyRadius
{
  return self->_uncertaintyRadius;
}

- (unint64_t)erosionRadius
{
  return self->_erodeRadius;
}

- (int64_t)compositorAlgorithm
{
  return self->_compositorAlgorithm;
}

- (void)setCompositorAlgorithm:(int64_t)a3
{
  self->_int64_t compositorAlgorithm = a3;
}

- (ARFrame)currentFrame
{
  return self->_currentFrame;
}

- (void)setCurrentFrame:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (unint64_t)foregroundBitMask
{
  return self->_foregroundBitMask;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (CGSize)currentSize
{
  double width = self->_currentSize.width;
  double height = self->_currentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)showOcclusionGeometry
{
  return self->_showOcclusionGeometry;
}

- (void)setShowOcclusionGeometry:(BOOL)a3
{
  self->_showOcclusionGeometry = a3;
}

- (double)depthScale
{
  return self->_depthScale;
}

- (void)setDepthScale:(double)a3
{
  self->_depthScale = a3;
}

- (unint64_t)dilationRadius
{
  return self->_dilationRadius;
}

- (void)setDilationRadius:(unint64_t)a3
{
  self->_dilationRadius = a3;
}

- (double)filterEpsilon
{
  return self->_filterEpsilon;
}

- (double)filterScale
{
  return self->_filterScale;
}

- (double)filterOffset
{
  return self->_filterOffset;
}

- (MTLTexture)alphaTexture
{
  return self->_alphaTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_currentFrame, 0);
  objc_storeStrong((id *)&self->_resampleDepthML, 0);
  objc_storeStrong((id *)&self->_resampleML, 0);
  objc_storeStrong((id *)&self->_mattingLibrary, 0);
  objc_storeStrong((id *)&self->_matteGenerator, 0);
  objc_storeStrong((id *)&self->_technique, 0);
  objc_destroyWeak((id *)&self->_view);

  objc_storeStrong((id *)&self->_device, 0);
}

@end