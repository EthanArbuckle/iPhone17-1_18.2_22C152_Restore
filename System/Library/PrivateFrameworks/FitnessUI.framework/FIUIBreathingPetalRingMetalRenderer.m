@interface FIUIBreathingPetalRingMetalRenderer
- (CGPoint)ringCenter;
- (FIUIBreathingPetalRingMetalRenderer)initWithMetalKitView:(id)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6;
- (double)_maxPetalRingRadius;
- (float)ringRadius;
- (id)stateUpdateBlock;
- (int64_t)numberOfVisiblePetals;
- (void)_clearCirclesInRange:(_NSRange)a3;
- (void)_createBuffers;
- (void)_loadTextures;
- (void)_setCircleAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7;
- (void)_setupIndexes;
- (void)_setupProjectionMatrixForSize:(CGSize)a3;
- (void)_setupRenderPipeline;
- (void)_setupVertices;
- (void)_updateVertices;
- (void)circleProperties;
- (void)drawInMTKView:(id)a3;
- (void)importDataFromPetalRingMetalRenderer:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7;
- (void)setCircleProperties:(const void *)a3;
- (void)setGradientRotationAngle:(float)a3;
- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4;
- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6;
- (void)setRingCenter:(CGPoint)a3;
- (void)setRingRadius:(float)a3;
- (void)setStateUpdateBlock:(id)a3;
@end

@implementation FIUIBreathingPetalRingMetalRenderer

- (FIUIBreathingPetalRingMetalRenderer)initWithMetalKitView:(id)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6
{
  id v11 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FIUIBreathingPetalRingMetalRenderer;
  v12 = [(FIUIBreathingPetalRingMetalRenderer *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mtkView, a3);
    [(MTKView *)v13->_mtkView setColorPixelFormat:80];
    -[MTKView setClearColor:](v13->_mtkView, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v14 = [(MTKView *)v13->_mtkView device];
    device = v13->_device;
    v13->_device = (MTLDevice *)v14;

    uint64_t v16 = [(MTLDevice *)v13->_device newCommandQueue];
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v16;

    v13->_petalColor = a4;
    v13->_numberOfPetals = a5;
    v13->_showBlurTrails = a6;
    [(FIUIBreathingPetalRingMetalRenderer *)v13 _createBuffers];
    [(FIUIBreathingPetalRingMetalRenderer *)v13 _loadTextures];
    [(FIUIBreathingPetalRingMetalRenderer *)v13 _setupIndexes];
    [(FIUIBreathingPetalRingMetalRenderer *)v13 _setupVertices];
    [v11 bounds];
    -[FIUIBreathingPetalRingMetalRenderer _setupProjectionMatrixForSize:](v13, "_setupProjectionMatrixForSize:", v18, v19);
    [(FIUIBreathingPetalRingMetalRenderer *)v13 _setupRenderPipeline];
  }

  return v13;
}

- (void)_loadTextures
{
  v13[3] = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:self->_device];
  uint64_t v4 = *MEMORY[0x263F12D48];
  v12[0] = *MEMORY[0x263F12D40];
  v12[1] = v4;
  uint64_t v5 = *MEMORY[0x263F12D68];
  v13[0] = MEMORY[0x263EFFA88];
  v13[1] = v5;
  v12[2] = *MEMORY[0x263F12D50];
  v13[2] = MEMORY[0x263EFFA80];
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v7 = FIUIDeepBreathingGradientImageDataForPetalColor(self->_petalColor);
  id v11 = 0;
  v8 = (MTLTexture *)[v3 newTextureWithData:v7 options:v6 error:&v11];
  id v9 = v11;
  circleGradient = self->_circleGradient;
  self->_circleGradient = v8;
}

- (void)_createBuffers
{
  self->_indexBuffer = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:144 options:0];
  MEMORY[0x270F9A758]();
}

- (void)_setupIndexes
{
  uint64_t v2 = [(MTLBuffer *)self->_indexBuffer contents];
  uint64_t v3 = 0;
  int v4 = 1;
  do
  {
    uint64_t v5 = (_WORD *)(v2 + v3);
    *uint64_t v5 = 0;
    v5[1] = v4;
    if (v4 == 24) {
      int v4 = 1;
    }
    else {
      ++v4;
    }
    v5[2] = v4;
    v3 += 6;
  }
  while (v3 != 144);
}

- (void)_setupProjectionMatrixForSize:(CGSize)a3
{
  float v3 = a3.height / a3.width;
  LODWORD(v4) = 0;
  *((float *)&v4 + 1) = 2.0 / (float)((float)-v3 - v3);
  LODWORD(v5) = 0x80000000;
  *((float *)&v5 + 1) = (float)(v3 - v3) / (float)(v3 + v3);
  *((void *)&v5 + 1) = __PAIR64__(1.0, 0.5);
  *(_OWORD *)self->_anon_3b0 = xmmword_21E4D8EE0;
  *(_OWORD *)&self->_anon_3b0[16] = v4;
  *(_OWORD *)&self->_anon_3b0[32] = xmmword_21E4D8EF0;
  *(_OWORD *)&self->_anon_3b0[48] = v5;
}

- (void)_setupVertices
{
  [(FIUIBreathingPetalRingMetalRenderer *)self _maxPetalRingRadius];
  *(float *)&double v3 = v3;
  [(FIUIBreathingPetalRingMetalRenderer *)self setRingRadius:v3];
  uint64_t v4 = 0;
  *(void *)&self->_anon_220[8] = 0;
  long long v5 = (float32x2_t *)&self->_anon_220[24];
  do
  {
    __float2 v6 = __sincosf_stret((float)(int)v4 * 0.2618);
    *long long v5 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v6.__sinval), LODWORD(v6.__cosval)), (float32x2_t)0x3F0000003F000000);
    v5 += 2;
    ++v4;
  }
  while (v4 != 24);
}

- (void)_setupRenderPipeline
{
  id v3 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v3 setLabel:@"Petal Ring Pipeline"];
  v35 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.FitnessUI"];
  device = self->_device;
  id v37 = 0;
  long long v5 = (void *)[(MTLDevice *)device newDefaultLibraryWithBundle:v35 error:&v37];
  id v6 = v37;
  v7 = (void *)[v5 newFunctionWithName:@"petalRingVertexShader"];
  v8 = (void *)[v5 newFunctionWithName:@"petalRingFragmentShader"];
  id v9 = objc_alloc_init(MEMORY[0x263F12A80]);
  v10 = [v9 attributes];
  id v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setFormat:29];

  v12 = [v9 attributes];
  v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setOffset:0];

  uint64_t v14 = [v9 attributes];
  v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setBufferIndex:2];

  uint64_t v16 = [v9 attributes];
  v17 = [v16 objectAtIndexedSubscript:1];
  [v17 setFormat:29];

  double v18 = [v9 attributes];
  double v19 = [v18 objectAtIndexedSubscript:1];
  [v19 setOffset:8];

  v20 = [v9 attributes];
  objc_super v21 = [v20 objectAtIndexedSubscript:1];
  [v21 setBufferIndex:2];

  v22 = [v9 layouts];
  v23 = [v22 objectAtIndexedSubscript:2];
  [v23 setStride:16];

  v24 = [v9 layouts];
  v25 = [v24 objectAtIndexedSubscript:2];
  [v25 setStepRate:1];

  v26 = [v9 layouts];
  v27 = [v26 objectAtIndexedSubscript:2];
  [v27 setStepFunction:1];

  [v3 setVertexDescriptor:v9];
  [v3 setVertexFunction:v7];
  [v3 setFragmentFunction:v8];
  MTLPixelFormat v28 = [(MTKView *)self->_mtkView colorPixelFormat];
  v29 = [v3 colorAttachments];
  v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setPixelFormat:v28];

  v31 = self->_device;
  id v36 = v6;
  v32 = (MTLRenderPipelineState *)[(MTLDevice *)v31 newRenderPipelineStateWithDescriptor:v3 error:&v36];
  id v33 = v36;

  renderPipeline = self->_renderPipeline;
  self->_renderPipeline = v32;
}

- (void)importDataFromPetalRingMetalRenderer:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    self->_numberOfVisiblePetals = [v4 numberOfVisiblePetals];
    long long v21 = 0u;
    memset(v22, 0, sizeof(v22));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    [v5 circleProperties];
    *(void *)&self[1]._anon_28[440] = 0;
    [v5 ringCenter];
    -[FIUIBreathingPetalRingMetalRenderer setRingCenter:](self, "setRingCenter:");
    [v5 ringRadius];
    -[FIUIBreathingPetalRingMetalRenderer setRingRadius:](self, "setRingRadius:");
    uint64_t v6 = 0;
    long long v7 = v19;
    *(_OWORD *)&self[1]._anon_28[56] = v18;
    *(_OWORD *)&self[1]._anon_28[72] = v7;
    long long v8 = v21;
    *(_OWORD *)&self[1]._anon_28[88] = v20;
    *(_OWORD *)&self[1]._anon_28[104] = v8;
    long long v9 = v15;
    *(_OWORD *)&self[1]._uniforms.numberOfPetals = v14;
    *(_OWORD *)&self[1]._anon_28[8] = v9;
    long long v10 = v17;
    *(_OWORD *)&self[1]._anon_28[24] = v16;
    *(_OWORD *)&self[1]._anon_28[40] = v10;
    long long v11 = v13;
    *(_OWORD *)&self[1].super.isa = v12;
    *(_OWORD *)&self[1]._device = v11;
    do
    {
      *(_OWORD *)&self[1]._anon_28[v6 * 16 + 120] = v22[v6];
      ++v6;
    }
    while (v6 != 20);
  }
}

- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  int64_t v4 = a3;
  self->_numberOfVisiblePetals = a3;
  if (a4)
  {
    int64_t v6 = 10 - a3;
    -[FIUIBreathingPetalRingMetalRenderer _clearCirclesInRange:](self, "_clearCirclesInRange:", a3, 10 - a3);
    v4 += 10;
  }
  else
  {
    int64_t v6 = 20 - a3;
  }
  -[FIUIBreathingPetalRingMetalRenderer _clearCirclesInRange:](self, "_clearCirclesInRange:", v4, v6);
}

- (void)_clearCirclesInRange:(_NSRange)a3
{
  if (a3.location < a3.location + a3.length)
  {
    id v3 = &self[1]._anon_28[16 * a3.location + 128];
    do
    {
      *(_DWORD *)id v3 = 0;
      v3 += 16;
      --a3.length;
    }
    while (a3.length);
  }
}

- (void)setGradientRotationAngle:(float)a3
{
  __float2 v4 = __sincosf_stret(a3);
  *(void *)&self[1]._anon_28[440] = __PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval));
}

- (void)setRingRadius:(float)a3
{
  if (!FIUIIsEqual(self->_ringRadius, a3))
  {
    self->_ringRadius = a3;
    [(FIUIBreathingPetalRingMetalRenderer *)self _updateVertices];
  }
}

- (void)setRingCenter:(CGPoint)a3
{
  double y = a3.y;
  if (self->_ringCenter.x != a3.x || self->_ringCenter.y != a3.y)
  {
    float64_t x = a3.x;
    [(MTKView *)self->_mtkView bounds];
    v7.f64[0] = x;
    self->_ringCenter.float64_t x = x;
    self->_ringCenter.double y = v6 - y;
    v7.f64[1] = v6 - y;
    *(float32x2_t *)self->_ringCenterVector = vcvt_f32_f64(vaddq_f64(v7, v7));
    [(FIUIBreathingPetalRingMetalRenderer *)self _updateVertices];
  }
}

- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
}

- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6
{
}

- (void)_setCircleAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
  CGFloat y = a4.y;
  float64x2_t v8 = vmulq_f64((float64x2_t)a4, (float64x2_t)xmmword_21E4D8F00);
  *((float32x2_t *)&self[1].super.isa + a3) = vadd_f32(*(float32x2_t *)self->_ringCenterVector, vcvt_f32_f64(v8));
  *(float *)v8.f64 = (float)(a5 + a5) * (float)(a5 + a5);
  *((float *)v8.f64 + 1) = 1.0 / (float)(a5 * a6);
  *(float *)&v8.f64[1] = a7;
  *(float64x2_t *)&self[1]._anon_28[16 * a3 + 120] = v8;
}

- (double)_maxPetalRingRadius
{
  return 78.0;
}

- (void)_updateVertices
{
  if (_updateVertices_onceToken != -1) {
    dispatch_once(&_updateVertices_onceToken, &__block_literal_global_17);
  }
  double ringRadius = self->_ringRadius;
  [(FIUIBreathingPetalRingMetalRenderer *)self _maxPetalRingRadius];
  double v5 = ringRadius / v4 * 1.05;
  if (v5 <= 1.0) {
    double v6 = v5 * 0.8;
  }
  else {
    double v6 = 0.8;
  }
  *(float *)&double v6 = v6;
  [(MTKView *)self->_mtkView center];
  uint64_t v7 = 0;
  v9.f64[1] = v8;
  float32x2_t v10 = vcvt_f32_f64(vdivq_f64(vsubq_f64((float64x2_t)self->_ringCenter, v9), v9));
  *(float32x2_t *)self->_anon_220 = v10;
  long long v11 = (float32x2_t *)&self->_anon_220[16];
  do
  {
    __float2 v12 = __sincosf_stret((float)(int)v7 * 0.2618);
    *long long v11 = vadd_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval)), v13), v10);
    v11 += 2;
    ++v7;
  }
  while (v7 != 24);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  _HKInitializeLogging();
  float64_t v8 = (void *)*MEMORY[0x263F098F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT))
  {
    float64x2_t v9 = v8;
    v16.double width = width;
    v16.double height = height;
    float32x2_t v10 = NSStringFromCGSize(v16);
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v10;
    _os_log_impl(&dword_21E433000, v9, OS_LOG_TYPE_DEFAULT, "mktView:%@ drawableSizeWillChange: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  -[FIUIBreathingPetalRingMetalRenderer _setupProjectionMatrixForSize:](self, "_setupProjectionMatrixForSize:", width, height);
}

- (void)drawInMTKView:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(FIUIBreathingPetalRingMetalRenderer *)self stateUpdateBlock];
  double v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    BOOL showBlurTrails = self->_showBlurTrails;
    self->_uniforms.numberOfPetals = self->_numberOfPetals;
    self->_uniforms.BOOL showBlurTrails = showBlurTrails;
    *(_OWORD *)&self->_anon_28[96] = *(_OWORD *)&self[1]._anon_28[56];
    *(_OWORD *)&self->_anon_28[112] = *(_OWORD *)&self[1]._anon_28[72];
    *(_OWORD *)&self->_anon_28[128] = *(_OWORD *)&self[1]._anon_28[88];
    *(_OWORD *)&self->_anon_28[144] = *(_OWORD *)&self[1]._anon_28[104];
    *(_OWORD *)&self->_anon_28[32] = *(_OWORD *)&self[1]._uniforms.numberOfPetals;
    *(_OWORD *)&self->_anon_28[48] = *(_OWORD *)&self[1]._anon_28[8];
    *(_OWORD *)&self->_anon_28[64] = *(_OWORD *)&self[1]._anon_28[24];
    *(_OWORD *)&self->_anon_28[80] = *(_OWORD *)&self[1]._anon_28[40];
    *(_OWORD *)self->_anon_28 = *(_OWORD *)&self[1].super.isa;
    *(_OWORD *)&self->_anon_28[16] = *(_OWORD *)&self[1]._device;
    memcpy(&self->_anon_28[168], &self[1]._anon_28[120], 0x148uLL);
  }
  id v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v7 setLabel:@"Drawable Command Buffer"];
  float64_t v8 = [v11 currentRenderPassDescriptor];
  if (v8)
  {
    float64x2_t v9 = [v7 renderCommandEncoderWithDescriptor:v8];
    [v9 setLabel:@"Drawable Render Encoder"];
    [v9 setRenderPipelineState:self->_renderPipeline];
    [v9 setVertexBytes:self->_anon_220 length:400 atIndex:2];
    [v9 setVertexBytes:self->_anon_3b0 length:64 atIndex:0];
    [v9 setFragmentBytes:&self->_uniforms length:512 atIndex:1];
    [v9 setFragmentTexture:self->_circleGradient atIndex:0];
    [v9 drawIndexedPrimitives:3 indexCount:72 indexType:0 indexBuffer:self->_indexBuffer indexBufferOffset:0];
    [v9 endEncoding];
    float32x2_t v10 = [v11 currentDrawable];
    [v7 presentDrawable:v10];
  }
  [v7 commit];
  [v7 waitUntilCompleted];
}

- (float)ringRadius
{
  return self->_ringRadius;
}

- (CGPoint)ringCenter
{
  double x = self->_ringCenter.x;
  double y = self->_ringCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)numberOfVisiblePetals
{
  return self->_numberOfVisiblePetals;
}

- (void)circleProperties
{
  return memcpy(a2, (const void *)(a1 + 1104), 0x1F0uLL);
}

- (void)setCircleProperties:(const void *)a3
{
  return memcpy((void *)(a1 + 1104), a3, 0x1F0uLL);
}

- (id)stateUpdateBlock
{
  return self->_stateUpdateBlock;
}

- (void)setStateUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_circleGradient, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_mtkView, 0);
}

@end