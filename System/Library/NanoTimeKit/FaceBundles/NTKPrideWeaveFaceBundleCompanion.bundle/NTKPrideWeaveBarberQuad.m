@interface NTKPrideWeaveBarberQuad
- (BOOL)prepareForTime:(double)a3;
- (NTKPrideWeaveBarberQuad)init;
- (double)currentTime;
- (float)rotation;
- (float)thickness;
- (float)timeScale;
- (float)tritiumProgress;
- (float)viewMode;
- (float)winding;
- (id)prepareFrameCallback;
- (id)screenEdgeTextureForDevice:(id)a3 named:(id)a4;
- (int)generateCircleVerticesWithLevel:(int)a3 vertexBuffer:(id *)a4 indexBuffer:(id *)a5;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setPrepareFrameCallback:(id)a3;
- (void)setRotation:(float)a3;
- (void)setThickness:(float)a3;
- (void)setTimeScale:(float)a3;
- (void)setTritiumProgress:(float)a3;
- (void)setViewMode:(float)a3;
- (void)setWinding:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKPrideWeaveBarberQuad

- (NTKPrideWeaveBarberQuad)init
{
  v34.receiver = self;
  v34.super_class = (Class)NTKPrideWeaveBarberQuad;
  v2 = [(NTKPrideWeaveBarberQuad *)&v34 init];
  if (v2)
  {
    uint64_t v3 = +[CLKUIMetalResourceManager sharedDevice];
    device = v2->_device;
    v2->_device = (MTLDevice *)v3;

    v2->_supportsNonuniformThreadgroups = [(MTLDevice *)v2->_device supportsFamily:1004];
    v2->_timeScale = 1.0;
    v2->_thickness = 1.0;
    v5 = +[CLKDevice currentDevice];
    unint64_t v6 = (unint64_t)[v5 deviceCategory];

    if (v6 <= 5)
    {
      float v7 = flt_1DE28[v6];
      LODWORD(v2->_maxWidthRect) = dword_1DE10[v6];
      v2->_screenEdgeBuffer = v7;
    }
    v8 = +[CLKDevice currentDevice];
    [v8 screenBounds];
    double v10 = v9;
    [v8 screenScale];
    *(float *)&double v11 = v11 * v10;
    v2->_uniforms.screenHeight = *(float *)&v11;
    [v8 screenBounds];
    double v13 = v12;
    [v8 screenScale];
    *(float *)&double v14 = v14 * v13;
    v2->_uniforms.screenWidth = *(float *)&v14;
    v2->_uniforms.verticalSteps = 128;
    objc_initWeak(&location, v2);
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10364;
    v31 = &unk_249A0;
    objc_copyWeak(&v32, &location);
    uint64_t v15 = +[NTKPromise promiseNamed:@"PrideWeaveRectTexturePromise" withBlock:&v28];
    rectTextureLoaderPromise = v2->_rectTextureLoaderPromise;
    v2->_rectTextureLoaderPromise = (NTKPromise *)v15;

    objc_msgSend(v8, "screenBounds", v28, v29, v30, v31);
    double v18 = v17;
    [v8 screenScale];
    double v20 = v19;
    [v8 screenBounds];
    double v22 = v21;
    [v8 screenScale];
    v24 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:20 width:(int)(v18 * v20) height:(int)(v22 * v23) mipmapped:0];
    [v24 setStorageMode:2];
    [v24 setUsage:5];
    v25 = (MTLTexture *)[(MTLDevice *)v2->_device newTextureWithDescriptor:v24];
    combinedTexture = v2->_combinedTexture;
    v2->_combinedTexture = v25;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setViewMode:(float)a3
{
  self->_viewMode = 0.0;
}

- (id)screenEdgeTextureForDevice:(id)a3 named:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (char *)[a3 deviceCategory];
  if ((unint64_t)(v6 - 3) > 2) {
    CFStringRef v7 = &stru_24D98;
  }
  else {
    CFStringRef v7 = *(&off_249C0 + (void)(v6 - 3));
  }
  v8 = +[NSString stringWithFormat:@"%@%@.png", v5, v7];

  double v9 = +[NSBundle bundleForClass:objc_opt_class()];
  double v10 = +[UIImage imageNamed:v8 inBundle:v9 withConfiguration:0];
  double v11 = CLKUIConvertUIImageToMTLTexture();

  return v11;
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  id v5 = +[CLKUIMetalResourceManager sharedDevice];
  unint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v5 newDefaultLibraryWithBundle:v6 error:0];

  id v8 = [v7 newFunctionWithName:@"barber_vertex_shader"];
  id v9 = [v7 newFunctionWithName:@"barber_fragment_shader"];
  id v10 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v10 setLabel:@"WeaveBarberPipeline"];
  [v10 setVertexFunction:v8];
  [v10 setFragmentFunction:v9];
  v65 = v4;
  id v11 = [v4 colorPixelFormat];
  double v12 = [v10 colorAttachments];
  double v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setPixelFormat:v11];

  [v10 setDepthAttachmentPixelFormat:252];
  double v14 = [v10 colorAttachments];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setBlendingEnabled:0];

  [v10 setRasterSampleCount:4];
  id v71 = 0;
  v16 = (MTLRenderPipelineState *)[v5 newRenderPipelineStateWithDescriptor:v10 error:&v71];
  id v17 = v71;
  renderPipelineState = self->_renderPipelineState;
  self->_renderPipelineState = v16;

  if (v17)
  {
    double v19 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1846C(v17);
    }
  }
  double v20 = +[MTLRenderPassDescriptor renderPassDescriptor];
  double v21 = [(MTLRenderPassDescriptor *)v20 colorAttachments];
  double v22 = [v21 objectAtIndexedSubscript:0];

  [v22 setLoadAction:2];
  objc_msgSend(v22, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  [v22 setStoreAction:1];
  maskPassDescriptor = self->_maskPassDescriptor;
  self->_maskPassDescriptor = v20;

  id v24 = [v7 newFunctionWithName:@"barber_circle_vertex_shader"];
  id v25 = [v7 newFunctionWithName:@"barber_fragment_shader"];
  id v26 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v26 setLabel:@"WeaveBarberCirclesPipeline"];
  [v26 setVertexFunction:v24];
  [v26 setFragmentFunction:v25];
  id v27 = [v65 colorPixelFormat];
  v28 = [v26 colorAttachments];
  uint64_t v29 = [v28 objectAtIndexedSubscript:0];
  [v29 setPixelFormat:v27];

  [v26 setDepthAttachmentPixelFormat:252];
  v30 = [v26 colorAttachments];
  v31 = [v30 objectAtIndexedSubscript:0];
  [v31 setBlendingEnabled:0];

  [v26 setRasterSampleCount:4];
  id v70 = 0;
  id v32 = (MTLRenderPipelineState *)[v5 newRenderPipelineStateWithDescriptor:v26 error:&v70];
  id v33 = v70;
  circlesPipelineState = self->_circlesPipelineState;
  self->_circlesPipelineState = v32;

  if (v33)
  {
    v35 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_183E8(v33);
    }
  }
  v36 = objc_opt_new();
  [v36 setConstantValue:&self->_supportsNonuniformThreadgroups type:53 atIndex:0];
  id v37 = [v7 newFunctionWithName:@"computeBoundaryIntersections" constantValues:v36 error:0];
  id v69 = 0;
  v38 = (MTLComputePipelineState *)[v5 newComputePipelineStateWithFunction:v37 error:&v69];
  id v39 = v69;
  computeBoundaryIntersectionsPipelineState = self->_computeBoundaryIntersectionsPipelineState;
  self->_computeBoundaryIntersectionsPipelineState = v38;

  if (v39)
  {
    v41 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_18364(v39);
    }
  }
  id v42 = [v7 newFunctionWithName:@"sortBoundaryIntersections" constantValues:v36 error:0];
  id v68 = 0;
  v43 = (MTLComputePipelineState *)[v5 newComputePipelineStateWithFunction:v42 error:&v68];
  id v44 = v68;
  sortBoundaryIntersectionsPipelineState = self->_sortBoundaryIntersectionsPipelineState;
  self->_sortBoundaryIntersectionsPipelineState = v43;

  if (v44)
  {
    v46 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_182E0(v44);
    }
  }
  v64 = v36;

  for (uint64_t i = 0; i != 3; ++i)
  {
    v48 = (MTLBuffer *)[v5 newBufferWithLength:3872 options:0];
    v49 = self->_curvesBuffer[i];
    self->_curvesBuffer[i] = v48;

    v50 = (MTLBuffer *)[v5 newBufferWithLength:1408 options:32];
    v51 = self->_instanceMap[i];
    self->_instanceMap[i] = v50;

    v52 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:16 options:0];
    v53 = self->_indirectDrawBuffer[i];
    self->_indirectDrawBuffer[i] = v52;

    v54 = (MTLBuffer *)[v5 newBufferWithLength:1408 options:32];
    v55 = self->_circlesInstanceMap[i];
    self->_circlesInstanceMap[i] = v54;

    v56 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:20 options:0];
    v57 = self->_circlesIndirectDrawBuffer[i];
    self->_circlesIndirectDrawBuffer[i] = v56;
  }
  id v66 = 0;
  id v67 = 0;
  int v58 = [(NTKPrideWeaveBarberQuad *)self generateCircleVerticesWithLevel:3 vertexBuffer:&v67 indexBuffer:&v66];
  v59 = (MTLBuffer *)v67;
  v60 = (MTLBuffer *)v66;
  self->_circleNumVertices = v58;
  circleVertexBuffer = self->_circleVertexBuffer;
  self->_circleVertexBuffer = v59;
  v62 = v59;

  circleIndexBuffer = self->_circleIndexBuffer;
  self->_circleIndexBuffer = v60;
}

- (int)generateCircleVerticesWithLevel:(int)a3 vertexBuffer:(id *)a4 indexBuffer:(id *)a5
{
  long double v9 = ldexp(1.0, a3);
  uint64_t v10 = (int)(v9 * 3.0);
  int v11 = (int)(1.0 - (1.0 - v9) * 3.0);
  id v12 = [(MTLDevice *)self->_device newBufferWithLength:8 * (int)v10 options:0];
  id v13 = [(MTLDevice *)self->_device newBufferWithLength:6 * v11 options:0];
  id v14 = v12;
  uint64_t v15 = [v14 contents];
  id v16 = v13;
  id v17 = (char *)[v16 contents];
  if ((int)v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      float v19 = (double)(int)i * 6.28318531 / (double)(int)v10;
      __float2 v20 = __sincosf_stret(v19);
      v15[i] = __PAIR64__(LODWORD(v20.__sinval), LODWORD(v20.__cosval));
    }
  }
  if (a3 < 0)
  {
    int v22 = 0;
  }
  else
  {
    int v21 = 0;
    int v22 = 0;
    double v23 = v17 + 4;
    do
    {
      int v24 = (int)ldexp(1.0, v21);
      if ((int)v10 - 2 * v24 >= 0)
      {
        int v25 = 0;
        id v26 = &v23[2 * v22];
        do
        {
          *((_WORD *)v26 - 2) = v25;
          *((_WORD *)v26 - 1) = v24 + v25;
          v25 += 2 * v24;
          *(_WORD *)id v26 = v25 % (int)v10;
          v26 += 6;
          v22 += 3;
        }
        while (v25 <= (int)v10 - 2 * v24);
      }
    }
    while (v21++ != a3);
  }
  id v28 = v14;
  *a4 = v28;
  id v29 = v16;
  *a5 = v29;

  return v22;
}

- (BOOL)prepareForTime:(double)a3
{
  double v4 = (a3 - self->_previousTime) * self->_timeScale;
  BOOL v5 = v4 > 0.0833333333 || v4 < 0.0;
  self->_previousTime = a3;
  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v6 = v4;
  }
  self->_currentTime = self->_currentTime + v6;
  prepareFrameCallback = (void (**)(id, SEL))self->_prepareFrameCallback;
  if (prepareFrameCallback) {
    prepareFrameCallback[2](prepareFrameCallback, a2);
  }
  float thickness = self->_thickness;
  if (thickness != 0.0)
  {
    int v9 = (self->_currentIndex + 1) % 3;
    self->_currentIndex = v9;
    uint64_t v10 = (char *)[(MTLBuffer *)self->_curvesBuffer[v9] contents];
    CLKInterpolateBetweenFloatsUnclipped();
    float v12 = v11;
    float v13 = (float)((float)(self->_uniforms.screenWidth / self->_uniforms.screenHeight) - v12)
        - (float)(self->_screenEdgeBuffer / self->_uniforms.screenWidth);
    double v14 = v13 * 3.14159265 / (float)(v12 * 22.0);
    float v15 = sqrt(v14 * v14 + -1.0) / v13;
    float v16 = self->_winding * v15;
    float v17 = (float)((float)(v13 * 0.2856) / sqrtf((float)((float)((float)(v13 * v13) * v16) * v16) + 1.0)) * 0.5;
    if (v17 >= v12) {
      float v18 = v12;
    }
    else {
      float v18 = v17;
    }
    CLKInterpolateBetweenFloatsUnclipped();
    uint64_t v19 = 0;
    float v21 = v20;
    if (v18 >= v21) {
      float v22 = v21;
    }
    else {
      float v22 = v18;
    }
    double v23 = v10 + 16;
    do
    {
      *((_DWORD *)v23 + 1) = LODWORD(self->_tritiumProgress);
      float v24 = v22 * self->_thickness;
      *((float *)v23 - 1) = v18;
      *(float *)double v23 = v24;
      *((float *)v23 - 4) = v13;
      *((float *)v23 - 3) = v16;
      float v25 = self->_rotation + (float)((float)(int)v19 / 22.0) * 3.14159265 * 2.0;
      *((float *)v23 - 2) = v25;
      CLKUIConvertToRGBfFromSRGBf_fast();
      *((_OWORD *)v23 + 1) = v26;
      ++v19;
      v23 += 176;
    }
    while (v19 != 22);
  }
  return thickness != 0.0;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v4 = a3;
  rectEdgeTexture = self->_rectEdgeTexture;
  if (!rectEdgeTexture)
  {
    double v6 = [(NTKPromise *)self->_rectTextureLoaderPromise object];
    ((void (**)(void, id))v6)[2](v6, v4);
    id v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_rectEdgeTexture;
    self->_rectEdgeTexture = v7;

    rectTextureLoaderPromise = self->_rectTextureLoaderPromise;
    self->_rectTextureLoaderPromise = 0;

    rectEdgeTexture = self->_rectEdgeTexture;
  }
  uint64_t v10 = rectEdgeTexture;
  uint64_t currentIndex = self->_currentIndex;
  id v12 = [(MTLDevice *)self->_device newBufferWithLength:88 options:0];
  float v13 = [v4 computeCommandEncoder];
  [v13 setComputePipelineState:self->_computeBoundaryIntersectionsPipelineState];
  [v13 setBuffer:self->_curvesBuffer[currentIndex] offset:0 atIndex:0];
  [v13 setTexture:v10 atIndex:1];
  [v13 setBytes:&self->_uniforms length:12 atIndex:2];
  [v13 setBuffer:v12 offset:0 atIndex:3];
  unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_computeBoundaryIntersectionsPipelineState threadExecutionWidth];
  unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_computeBoundaryIntersectionsPipelineState maxTotalThreadsPerThreadgroup];
  float screenHeight = self->_uniforms.screenHeight;
  if (self->_supportsNonuniformThreadgroups)
  {
    *(void *)float v24 = 22;
    *(void *)&v24[8] = (int)screenHeight;
    *(void *)&v24[16] = 1;
    unint64_t v21 = v14;
    unint64_t v22 = v15 / v14;
    uint64_t v23 = 1;
    [v13 dispatchThreads:v24 threadsPerThreadgroup:&v21];
  }
  else
  {
    *(void *)float v24 = (v14 + 21) / v14;
    *(void *)&v24[8] = (v15 / v14 + (int)screenHeight - 1) / (v15 / v14);
    *(void *)&v24[16] = 1;
    unint64_t v21 = v14;
    unint64_t v22 = v15 / v14;
    uint64_t v23 = 1;
    [v13 dispatchThreadgroups:v24 threadsPerThreadgroup:&v21];
  }
  [v13 endEncoding];

  float v17 = [v4 computeCommandEncoder];
  [v17 setComputePipelineState:self->_sortBoundaryIntersectionsPipelineState];
  [v17 setBuffer:self->_curvesBuffer[currentIndex] offset:0 atIndex:0];
  [v17 setBytes:&self->_uniforms length:12 atIndex:2];
  [v17 setBuffer:v12 offset:0 atIndex:3];
  [v17 setTexture:v10 atIndex:1];
  *(_OWORD *)[(MTLBuffer *)self->_indirectDrawBuffer[currentIndex] contents] = xmmword_1DDF0;
  [v17 setBuffer:self->_indirectDrawBuffer[currentIndex] offset:4 atIndex:5];
  [v17 setBuffer:self->_instanceMap[currentIndex] offset:0 atIndex:4];
  float v18 = (char *)[(MTLBuffer *)self->_circlesIndirectDrawBuffer[currentIndex] contents];
  *(void *)(v18 + 12) = 0;
  *(void *)(v18 + 4) = 0;
  *(_DWORD *)float v18 = self->_circleNumVertices;
  [v17 setBuffer:self->_circlesIndirectDrawBuffer[currentIndex] offset:4 atIndex:7];
  [v17 setBuffer:self->_circlesInstanceMap[currentIndex] offset:0 atIndex:6];
  unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_sortBoundaryIntersectionsPipelineState threadExecutionWidth];
  unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_sortBoundaryIntersectionsPipelineState maxTotalThreadsPerThreadgroup];
  if (self->_supportsNonuniformThreadgroups)
  {
    *(_OWORD *)float v24 = xmmword_1DE00;
    *(void *)&v24[16] = 1;
    unint64_t v21 = v19;
    unint64_t v22 = v20 / v19;
    uint64_t v23 = 1;
    [v17 dispatchThreads:v24 threadsPerThreadgroup:&v21];
  }
  else
  {
    *(int64x2_t *)&v24[8] = vdupq_n_s64(1uLL);
    unint64_t v21 = v19;
    unint64_t v22 = v20 / v19;
    uint64_t v23 = 1;
    *(void *)float v24 = (v19 + 21) / v19;
    [v17 dispatchThreadgroups:v24 threadsPerThreadgroup:&v21];
  }
  [v17 endEncoding];
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  renderPipelineState = self->_renderPipelineState;
  id v5 = a3;
  [v5 setRenderPipelineState:renderPipelineState];
  [v5 setVertexBuffer:self->_curvesBuffer[self->_currentIndex] offset:0 atIndex:0];
  [v5 setVertexBytes:&self->_uniforms length:12 atIndex:1];
  [v5 setVertexBuffer:self->_instanceMap[self->_currentIndex] offset:0 atIndex:2];
  [v5 drawPrimitives:4 indirectBuffer:self->_indirectDrawBuffer[self->_currentIndex] indirectBufferOffset:0];
  [v5 setRenderPipelineState:self->_circlesPipelineState];
  [v5 setVertexBuffer:self->_curvesBuffer[self->_currentIndex] offset:0 atIndex:0];
  [v5 setVertexBytes:&self->_uniforms length:12 atIndex:1];
  [v5 setVertexBuffer:self->_circlesInstanceMap[self->_currentIndex] offset:0 atIndex:2];
  [v5 setVertexBuffer:self->_circleVertexBuffer offset:0 atIndex:3];
  [v5 drawIndexedPrimitives:3 indexType:0 indexBuffer:self->_circleIndexBuffer indexBufferOffset:0 indirectBuffer:self->_circlesIndirectDrawBuffer[self->_currentIndex] indirectBufferOffset:0];
}

- (float)winding
{
  return self->_winding;
}

- (void)setWinding:(float)a3
{
  self->_winding = a3;
}

- (float)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void)setTritiumProgress:(float)a3
{
  self->_tritiumProgress = a3;
}

- (float)viewMode
{
  return self->_viewMode;
}

- (float)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(float)a3
{
  self->_timeScale = a3;
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (float)thickness
{
  return self->_thickness;
}

- (void)setThickness:(float)a3
{
  self->_float thickness = a3;
}

- (id)prepareFrameCallback
{
  return self->_prepareFrameCallback;
}

- (void)setPrepareFrameCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prepareFrameCallback, 0);
  objc_storeStrong((id *)&self->_combinedTexture, 0);
  objc_storeStrong((id *)&self->_circleEdgeTexture, 0);
  objc_storeStrong((id *)&self->_rectEdgeTexture, 0);
  objc_storeStrong((id *)&self->_maskPassDescriptor, 0);
  objc_storeStrong((id *)&self->_circleTextureLoaderPromise, 0);
  objc_storeStrong((id *)&self->_rectTextureLoaderPromise, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_circleIndexBuffer, 0);
  objc_storeStrong((id *)&self->_circleVertexBuffer, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_circlesIndirectDrawBuffer[i], 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_circlesInstanceMap[j], 0);
  for (uint64_t k = 2; k != -1; --k)
    objc_storeStrong((id *)&self->_indirectDrawBuffer[k], 0);
  for (uint64_t m = 2; m != -1; --m)
    objc_storeStrong((id *)&self->_instanceMap[m], 0);
  for (uint64_t n = 2; n != -1; --n)
    objc_storeStrong((id *)&self->_curvesBuffer[n], 0);
  objc_storeStrong((id *)&self->_sortBoundaryIntersectionsPipelineState, 0);
  objc_storeStrong((id *)&self->_computeBoundaryIntersectionsPipelineState, 0);
  objc_storeStrong((id *)&self->_circlesPipelineState, 0);
  objc_storeStrong((id *)&self->_maskPipelineState, 0);

  objc_storeStrong((id *)&self->_renderPipelineState, 0);
}

@end