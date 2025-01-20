@interface ARCoachingGeoTrackingRenderer
- (ARCoachingGeoTrackingRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7;
- (ARCoachingGlyphState)state;
- (BOOL)loadOutlineModelWith:(id *)a3;
- (double)currentAnimationTime;
- (void)drawBuildingOutlineWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5;
- (void)drawDeviceWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5;
- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetAnimationTime:(double)a3;
- (void)resizeIfNeeded:(id)a3;
- (void)setOrientationAngle:(float)a3;
- (void)updateFrameStateWithTimeDelta:(double)a3;
@end

@implementation ARCoachingGeoTrackingRenderer

- (double)currentAnimationTime
{
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  return result;
}

- (ARCoachingGlyphState)state
{
  return self->_state;
}

- (ARCoachingGeoTrackingRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v41.receiver = self;
  v41.super_class = (Class)ARCoachingGeoTrackingRenderer;
  v15 = [(ARCoachingGeoTrackingRenderer *)&v41 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_device, a4);
    v16->_pixelFormat = a5;
    objc_storeStrong((id *)&v16->_layer, a3);
    v17 = objc_alloc_init(ARCoachingGlyphState);
    state = v16->_state;
    v16->_state = v17;

    v19 = objc_alloc_init(ARCoachingAnimTime);
    time = v16->_time;
    v16->_time = v19;

    v21 = [[ARCoachingDeviceController alloc] initWithDeviceMaskImage:v14 geoTrackingMode:1];
    deviceController = v16->_deviceController;
    v16->_deviceController = v21;

    [(ARCoachingDeviceController *)v16->_deviceController setLayerParent:v16->_layer];
    [(CAMetalLayer *)v16->_layer setAllowsGroupBlending:1];
    uint64_t v23 = ARCreateNonFixedPriorityDispatchQueue();
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v23;

    v25 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    cubeResolveSpring = v16->_cubeResolveSpring;
    v16->_cubeResolveSpring = v25;

    [(ARFLSpring *)v16->_cubeResolveSpring parameters];
    double v28 = v27;
    [(ARFLSpring *)v16->_cubeResolveSpring parameters];
    ARFLSpringParametersMake([(ARFLSpring *)v16->_cubeResolveSpring parameters], v28, v29, 0.699999988);
    -[ARFLSpring setParameters:](v16->_cubeResolveSpring, "setParameters:");
    [(ARFLSpring *)v16->_cubeResolveSpring setTarget:0.0];
    [(ARFLSpring *)v16->_cubeResolveSpring setValue:0.0];
    v30 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    verticalResolvingSpring = v16->_verticalResolvingSpring;
    v16->_verticalResolvingSpring = v30;

    [(ARFLSpring *)v16->_verticalResolvingSpring parameters];
    -[ARFLSpring setParameters:](v16->_verticalResolvingSpring, "setParameters:");
    [(ARFLSpring *)v16->_verticalResolvingSpring setTarget:0.0];
    [(ARFLSpring *)v16->_verticalResolvingSpring setValue:0.0];
    v32 = [ARCoachingBasicSpring alloc];
    LODWORD(v33) = 1128792064;
    LODWORD(v34) = 22.0;
    uint64_t v35 = [(ARCoachingBasicSpring *)v32 initWithTension:v33 friction:v34];
    orientationSpring = v16->_orientationSpring;
    v16->_orientationSpring = (ARCoachingBasicSpring *)v35;

    id v37 = objc_alloc_init(MEMORY[0x263F128A0]);
    [v37 setDepthCompareFunction:1];
    [v37 setDepthWriteEnabled:1];
    uint64_t v38 = [(MTLDevice *)v16->_device newDepthStencilStateWithDescriptor:v37];
    depthState = v16->_depthState;
    v16->_depthState = (MTLDepthStencilState *)v38;
  }
  return v16;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__ARCoachingGeoTrackingRenderer_prepareWithCompletionHandler___block_invoke;
  v7[3] = &unk_264000A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__ARCoachingGeoTrackingRenderer_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 loadOutlineModelWith:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(ARCoachingGeoTrackingRenderer *)self drawDeviceWithTimeDelta:v9 drawable:v8 commandBuffer:a3];
  [(ARCoachingGeoTrackingRenderer *)self drawBuildingOutlineWithTimeDelta:v9 drawable:v8 commandBuffer:a3];
}

- (void)drawDeviceWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  time = self->_time;
  [(ARCoachingAnimTime *)time absoluteTime];
  [(ARCoachingAnimTime *)time setAbsoluteTime:v8 + a3];
  long long v10 = kARCoachingDeviceRenderParamsHorizontalGeoTracking;
  uint64_t v11 = 3233808384;
  deviceController = self->_deviceController;
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  -[ARCoachingDeviceController update:visibility:layer:renderParams:](deviceController, "update:visibility:layer:renderParams:", self->_layer, &v10);
}

- (void)drawBuildingOutlineWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  id v35 = a4;
  id v8 = a5;
  [(ARCoachingGeoTrackingRenderer *)self updateFrameStateWithTimeDelta:a3];
  id v9 = [MEMORY[0x263F129A0] renderPassDescriptor];
  long long v10 = [v35 texture];
  uint64_t v11 = [v9 colorAttachments];
  id v12 = [v11 objectAtIndexedSubscript:0];
  [v12 setTexture:v10];

  id v13 = [v9 colorAttachments];
  id v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setStoreAction:1];

  v15 = [v9 colorAttachments];
  v16 = [v15 objectAtIndexedSubscript:0];
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v17 = [v9 colorAttachments];
  v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setLoadAction:2];

  v19 = [v9 colorAttachments];
  v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setStoreAction:1];

  depthTexture = self->_depthTexture;
  v22 = [v9 depthAttachment];
  [v22 setTexture:depthTexture];

  uint64_t v23 = [v9 depthAttachment];
  [v23 setLoadAction:2];

  v24 = [v9 depthAttachment];
  [v24 setClearDepth:1.0];

  v25 = [v9 depthAttachment];
  [v25 setDepthResolveFilter:0];

  v26 = [v8 renderCommandEncoderWithDescriptor:v9];
  [v26 setLabel:@"Drawable Render Encoder"];
  [v26 setRenderPipelineState:self->_inflatedHullPipeline];
  [v26 setDepthStencilState:self->_depthState];
  [v26 setVertexBuffer:self->_contentVertexPositions offset:0 atIndex:0];
  [v26 setVertexBuffer:self->_contentVertexGenerics offset:0 atIndex:1];
  [v26 setVertexBytes:self->_anon_d0 length:64 atIndex:2];
  [v26 setCullMode:1];
  if ([(NSMutableArray *)self->_contentIndexBuffers count])
  {
    unint64_t v27 = 0;
    do
    {
      double v28 = [(NSMutableArray *)self->_contentIndexBuffers objectAtIndexedSubscript:v27];
      unint64_t v29 = (unint64_t)[v28 length] >> 2;

      v30 = [(NSMutableArray *)self->_contentIndexBuffers objectAtIndexedSubscript:v27];
      [v26 drawIndexedPrimitives:3 indexCount:v29 indexType:1 indexBuffer:v30 indexBufferOffset:0];

      ++v27;
    }
    while (v27 < [(NSMutableArray *)self->_contentIndexBuffers count]);
  }
  [v26 setCullMode:2];
  [v26 setRenderPipelineState:self->_blockColorPipeline];
  if ([(NSMutableArray *)self->_contentIndexBuffers count])
  {
    unint64_t v31 = 0;
    do
    {
      v32 = [(NSMutableArray *)self->_contentIndexBuffers objectAtIndexedSubscript:v31];
      unint64_t v33 = (unint64_t)[v32 length] >> 2;

      double v34 = [(NSMutableArray *)self->_contentIndexBuffers objectAtIndexedSubscript:v31];
      [v26 drawIndexedPrimitives:3 indexCount:v33 indexType:1 indexBuffer:v34 indexBufferOffset:0];

      ++v31;
    }
    while (v31 < [(NSMutableArray *)self->_contentIndexBuffers count]);
  }
  [v26 endEncoding];
}

- (void)resizeIfNeeded:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_depthTexture)
  {
    id v6 = [v4 texture];
    uint64_t v7 = [v6 width];
    if (v7 == [(MTLTexture *)self->_depthTexture width])
    {
      id v8 = [v5 texture];
      uint64_t v9 = [v8 height];
      uint64_t v10 = [(MTLTexture *)self->_depthTexture height];

      if (v9 == v10) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [v5 texture];
  double v12 = (double)(unint64_t)[v11 width];
  id v13 = [v5 texture];
  double v14 = (double)(unint64_t)[v13 height];

  kdebug_trace();
  v15 = _ARLogCoaching_0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v23 = 138544130;
    v24 = v17;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2048;
    double v28 = v12;
    __int16 v29 = 2048;
    double v30 = v14;
    _os_log_impl(&dword_20B202000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new depth texture because the drawable size has changed to %.0fx%.0f", (uint8_t *)&v23, 0x2Au);
  }
  float v18 = v14;
  float v19 = v12 / v18;
  *(_OWORD *)self->_anon_90 = COERCE_UNSIGNED_INT(1.5697 / v19);
  *(_OWORD *)&self->_anon_90[16] = xmmword_20B231E20;
  *(_OWORD *)&self->_anon_90[32] = xmmword_20B231E30;
  *(_OWORD *)&self->_anon_90[48] = xmmword_20B231E40;
  v20 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:252 width:(unint64_t)v12 height:(unint64_t)v14 mipmapped:0];
  [v20 setStorageMode:2];
  [v20 setUsage:4];
  v21 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v20];
  depthTexture = self->_depthTexture;
  self->_depthTexture = v21;

  [(MTLTexture *)self->_depthTexture setLabel:@"Depth texture"];
LABEL_9:
}

- (void)setOrientationAngle:(float)a3
{
}

- (void)resetAnimationTime:(double)a3
{
  id v5 = objc_alloc_init(ARCoachingAnimTime);
  time = self->_time;
  self->_time = v5;

  uint64_t v7 = self->_time;

  [(ARCoachingAnimTime *)v7 setAbsoluteTime:a3];
}

- (BOOL)loadOutlineModelWith:(id *)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v5 = ARKitUIBundle();
  id v6 = [v5 URLForResource:@"OutlineModel" withExtension:@"obj"];
  uint64_t v7 = [[GTMeshData alloc] initWithURL:v6 error:a3];
  id v8 = v7;
  if (!*a3)
  {
    v92 = a3;
    v94 = v5;
    uint64_t v13 = 16 * [(GTMeshData *)v7 vertexCount];
    uint64_t v14 = 20 * [(GTMeshData *)v8 vertexCount];
    v15 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:v13 options:0];
    contentVertexPositions = self->_contentVertexPositions;
    self->_contentVertexPositions = v15;

    v17 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:v14 options:0];
    contentVertexGenerics = self->_contentVertexGenerics;
    self->_contentVertexGenerics = v17;

    uint64_t v19 = [(MTLBuffer *)self->_contentVertexPositions contents];
    uint64_t v20 = [(MTLBuffer *)self->_contentVertexGenerics contents];
    uint64_t v21 = [(GTMeshData *)v8 vertexData];
    if ([(GTMeshData *)v8 vertexCount])
    {
      unint64_t v22 = 0;
      int v23 = (int *)(v21 + 24);
      v24 = (_DWORD *)(v20 + 16);
      do
      {
        *(_OWORD *)(v19 + 16 * v22) = *(_OWORD *)(v23 - 6);
        *(v24 - 2) = *(v23 - 2);
        *(v24 - 1) = *(v23 - 1);
        int v25 = *v23;
        v23 += 12;
        _DWORD *v24 = v25;
        v24 += 5;
        ++v22;
      }
      while (v22 < [(GTMeshData *)v8 vertexCount]);
    }
    v93 = v6;
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    contentIndexBuffers = self->_contentIndexBuffers;
    self->_contentIndexBuffers = v26;

    double v28 = [(GTMeshData *)v8 submeshes];
    __int16 v29 = [v28 allValues];
    uint64_t v30 = [v29 count];

    if (v30)
    {
      unint64_t v31 = 0;
      do
      {
        v32 = [(GTMeshData *)v8 submeshes];
        unint64_t v33 = [v32 allValues];
        double v34 = [v33 objectAtIndexedSubscript:v31];

        id v35 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", [v34 indexData], 4 * objc_msgSend(v34, "indexCount"), 0);
        [(NSMutableArray *)self->_contentIndexBuffers setObject:v35 atIndexedSubscript:v31];

        ++v31;
        v36 = [(GTMeshData *)v8 submeshes];
        id v37 = [v36 allValues];
        unint64_t v38 = [v37 count];
      }
      while (v31 < v38);
    }
    uint64_t v9 = objc_alloc_init(MEMORY[0x263F12A80]);
    v39 = [v9 attributes];
    v40 = [v39 objectAtIndexedSubscript:0];
    [v40 setFormat:30];

    objc_super v41 = [v9 attributes];
    v42 = [v41 objectAtIndexedSubscript:0];
    [v42 setOffset:0];

    v43 = [v9 attributes];
    v44 = [v43 objectAtIndexedSubscript:0];
    [v44 setBufferIndex:0];

    v45 = [v9 attributes];
    v46 = [v45 objectAtIndexedSubscript:1];
    [v46 setFormat:30];

    v47 = [v9 attributes];
    v48 = [v47 objectAtIndexedSubscript:1];
    [v48 setOffset:8];

    v49 = [v9 attributes];
    v50 = [v49 objectAtIndexedSubscript:1];
    [v50 setBufferIndex:1];

    v51 = [v9 layouts];
    v52 = [v51 objectAtIndexedSubscript:0];
    [v52 setStride:16];

    v53 = [v9 layouts];
    v54 = [v53 objectAtIndexedSubscript:0];
    [v54 setStepRate:1];

    v55 = [v9 layouts];
    v56 = [v55 objectAtIndexedSubscript:0];
    [v56 setStepFunction:1];

    v57 = [v9 layouts];
    v58 = [v57 objectAtIndexedSubscript:1];
    [v58 setStride:20];

    v59 = [v9 layouts];
    v60 = [v59 objectAtIndexedSubscript:1];
    [v60 setStepRate:1];

    v61 = [v9 layouts];
    v62 = [v61 objectAtIndexedSubscript:1];
    [v62 setStepFunction:1];

    v63 = objc_opt_new();
    v64 = self->_device;
    v65 = ARKitUIBundle();
    v66 = [v65 URLForResource:@"default" withExtension:@"metallib"];
    if (v66)
    {
      id v95 = 0;
      v67 = (void *)[(MTLDevice *)v64 newLibraryWithURL:v66 error:&v95];
      v68 = v95;
      [v67 setLabel:@"com.apple.arkit.coachinganimation.library"];
      if (v68)
      {
        v69 = _ARLogCoaching_0();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          [v68 localizedDescription];
          v89 = v91 = v64;
          [v68 localizedFailureReason];
          v90 = v67;
          v70 = (ARCoachingGeoTrackingRenderer *)objc_claimAutoreleasedReturnValue();
          uint64_t v71 = [v68 localizedRecoverySuggestion];
          *(_DWORD *)buf = 138412802;
          v97 = v89;
          __int16 v98 = 2112;
          v99 = v70;
          __int16 v100 = 2112;
          uint64_t v101 = v71;
          v72 = (void *)v71;
          _os_log_impl(&dword_20B202000, v69, OS_LOG_TYPE_ERROR, "Error while loading metal library for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x20u);

          v67 = v90;
          v64 = v91;
        }
      }
    }
    else
    {
      v68 = _ARLogCoaching_0();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B202000, v68, OS_LOG_TYPE_ERROR, "Failed to find metal library for coaching animations", buf, 2u);
      }
      v67 = 0;
    }

    v73 = (void *)[v67 newFunctionWithName:@"inflatedInverseHullVertexShader"];
    v74 = (void *)[v67 newFunctionWithName:@"solidWhiteFragmentShader"];
    [v63 setVertexDescriptor:v9];
    [v63 setVertexFunction:v73];
    [v63 setFragmentFunction:v74];
    unint64_t pixelFormat = self->_pixelFormat;
    v76 = [v63 colorAttachments];
    v77 = [v76 objectAtIndexedSubscript:0];
    [v77 setPixelFormat:pixelFormat];

    [v63 setDepthAttachmentPixelFormat:252];
    [v63 setLabel:@"Inflated Hull Pipeline"];
    v78 = (MTLRenderPipelineState *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v63 error:v92];
    inflatedHullPipeline = self->_inflatedHullPipeline;
    self->_inflatedHullPipeline = v78;

    if (self->_inflatedHullPipeline)
    {
      [v63 setLabel:@"Block Color Pipeline"];
      v80 = (void *)[v67 newFunctionWithName:@"simplePositionVertexShader"];
      [v63 setVertexFunction:v80];

      v81 = (void *)[v67 newFunctionWithName:@"solidBlackFragmentShader"];
      [v63 setFragmentFunction:v81];

      v82 = (MTLRenderPipelineState *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v63 error:v92];
      blockColorPipeline = self->_blockColorPipeline;
      self->_blockColorPipeline = v82;

      id v5 = v94;
      if (self->_blockColorPipeline)
      {
        BOOL v12 = 1;
LABEL_27:

        id v6 = v93;
        goto LABEL_28;
      }
      v84 = _ARLogGeneral();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
    }
    else
    {
      v84 = _ARLogGeneral();
      id v5 = v94;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v85 = (objc_class *)objc_opt_class();
        v86 = NSStringFromClass(v85);
        id v87 = *v92;
        *(_DWORD *)buf = 138543874;
        v97 = v86;
        __int16 v98 = 2048;
        v99 = self;
        __int16 v100 = 2112;
        uint64_t v101 = (uint64_t)v87;
        _os_log_impl(&dword_20B202000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create content render pipeline state, error: %@.", buf, 0x20u);
      }
    }

    BOOL v12 = 0;
    goto LABEL_27;
  }
  uint64_t v9 = _ARLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543618;
    v97 = v11;
    __int16 v98 = 2048;
    v99 = self;
    _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Loading the outline model failed.", buf, 0x16u);
  }
  BOOL v12 = 0;
LABEL_28:

  return v12;
}

- (void)updateFrameStateWithTimeDelta:(double)a3
{
  float v4 = self->_ftime + a3;
  self->_ftime = v4;
  float v5 = (float)(v4 * 0.25) * 3.14159265 + (float)(v4 * 0.25) * 3.14159265;
  *(double *)v6.i64 = simd_matrix4x4((float32x4_t)_PromotedConst);
  float32x4_t v45 = v6;
  float32x4_t v46 = v7;
  float32x4_t v47 = v8;
  float32x4_t v43 = v9;
  ARMatrix4x4FromRotationAndTranslation();
  unint64_t v10 = 0;
  float32x4_t v48 = v11;
  float32x4_t v49 = v12;
  float32x4_t v50 = v13;
  float32x4_t v51 = v14;
  float32x4_t v52 = 0u;
  float32x4_t v53 = 0u;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v10) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v10))), v46, *(float32x2_t *)&v48.f32[v10 / 4], 1), v47, *(float32x4_t *)((char *)&v48 + v10), 2), v43, *(float32x4_t *)((char *)&v48 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  float v15 = sinf(v5);
  float32x4_t v42 = v53;
  float32x4_t v44 = v52;
  float32x4_t v40 = v55;
  float32x4_t v41 = v54;
  __float2 v16 = __sincosf_stret((float)((float)(v15 * -0.083333) + -2.15) * 0.5);
  float32x4_t v17 = vmulq_n_f32((float32x4_t)xmmword_20B231E60, v16.__sinval);
  v17.i32[3] = LODWORD(v16.__cosval);
  *(double *)v18.i64 = simd_matrix4x4(v17);
  float32x4_t v38 = v19;
  float32x4_t v39 = v18;
  float32x4_t v36 = v21;
  float32x4_t v37 = v20;
  ARMatrix4x4FromRotationAndTranslation();
  unint64_t v22 = 0;
  float32x4_t v48 = v23;
  float32x4_t v49 = v24;
  float32x4_t v50 = v25;
  float32x4_t v51 = v26;
  float32x4_t v52 = 0u;
  float32x4_t v53 = 0u;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v22))), v38, *(float32x2_t *)&v48.f32[v22 / 4], 1), v37, *(float32x4_t *)((char *)&v48 + v22), 2), v36, *(float32x4_t *)((char *)&v48 + v22), 3);
    v22 += 16;
  }
  while (v22 != 64);
  unint64_t v27 = 0;
  float32x4_t v48 = v52;
  float32x4_t v49 = v53;
  float32x4_t v50 = v54;
  float32x4_t v51 = v55;
  float32x4_t v52 = 0u;
  float32x4_t v53 = 0u;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v27) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v27))), v42, *(float32x2_t *)&v48.f32[v27 / 4], 1), v41, *(float32x4_t *)((char *)&v48 + v27), 2), v40, *(float32x4_t *)((char *)&v48 + v27), 3);
    v27 += 16;
  }
  while (v27 != 64);
  unint64_t v28 = 0;
  float32x4_t v29 = *(float32x4_t *)self->_anon_90;
  float32x4_t v30 = *(float32x4_t *)&self->_anon_90[16];
  float32x4_t v31 = *(float32x4_t *)&self->_anon_90[32];
  float32x4_t v32 = *(float32x4_t *)&self->_anon_90[48];
  float32x4_t v48 = v52;
  float32x4_t v49 = v53;
  float32x4_t v50 = v54;
  float32x4_t v51 = v55;
  float32x4_t v52 = 0u;
  float32x4_t v53 = 0u;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v28))), v30, *(float32x2_t *)&v48.f32[v28 / 4], 1), v31, *(float32x4_t *)((char *)&v48 + v28), 2), v32, *(float32x4_t *)((char *)&v48 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  float32x4_t v33 = v53;
  float32x4_t v34 = v54;
  float32x4_t v35 = v55;
  *(float32x4_t *)self->_anon_d0 = v52;
  *(float32x4_t *)&self->_anon_d0[16] = v33;
  *(float32x4_t *)&self->_anon_d0[32] = v34;
  *(float32x4_t *)&self->_anon_d0[48] = v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_contentIndexBuffers, 0);
  objc_storeStrong((id *)&self->_contentVertexGenerics, 0);
  objc_storeStrong((id *)&self->_contentVertexPositions, 0);
  objc_storeStrong((id *)&self->_blockColorPipeline, 0);
  objc_storeStrong((id *)&self->_inflatedHullPipeline, 0);
  objc_storeStrong((id *)&self->_depthState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_orientationSpring, 0);
  objc_storeStrong((id *)&self->_verticalResolvingSpring, 0);
  objc_storeStrong((id *)&self->_cubeResolveSpring, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end