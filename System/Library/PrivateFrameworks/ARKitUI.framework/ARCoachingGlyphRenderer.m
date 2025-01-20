@interface ARCoachingGlyphRenderer
- (ARCoachingDotsRenderer)dotsRenderer;
- (ARCoachingGlyphRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7;
- (ARCoachingGlyphState)state;
- (MTLComputePipelineState)computePipelineState;
- (MTLRenderPipelineState)postTessellationPipelineState;
- (double)currentAnimationTime;
- (float)a_vel;
- (float)rotationAngleY;
- (void)bottomPlaneTranslationTargetChanged;
- (void)computeRotation:(double)a3;
- (void)computeTesselationFactorsForCommandBuffer:(id)a3;
- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5;
- (void)generateTexturesWithSize:(CGSize)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)quaternionTargetChanged;
- (void)renderPostTessellationInDrawable:(id)a3 withCommandBuffer:(id)a4;
- (void)resetAnimationTime:(double)a3;
- (void)resetData;
- (void)resetSprings;
- (void)resizeIfNeeded:(id)a3;
- (void)restartAnimation;
- (void)scaleTargetChanged;
- (void)setA_vel:(float)a3;
- (void)setComputePipelineState:(id)a3;
- (void)setDotsRenderer:(id)a3;
- (void)setOrientationAngle:(float)a3;
- (void)setPostTessellationPipelineState:(id)a3;
- (void)setRotationAngleY:(float)a3;
- (void)snapStateChanged;
- (void)stepSprings:(double)a3;
- (void)topPlaneTranslationTargetChanged;
- (void)updateAngularVelocity;
@end

@implementation ARCoachingGlyphRenderer

- (double)currentAnimationTime
{
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  return result;
}

- (ARCoachingGlyphState)state
{
  return self->_state;
}

- (ARCoachingGlyphRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v124.receiver = self;
  v124.super_class = (Class)ARCoachingGlyphRenderer;
  v16 = [(ARCoachingGlyphRenderer *)&v124 init];
  v17 = v16;
  if (v16)
  {
    id v106 = v13;
    objc_storeStrong((id *)&v16->_device, a4);
    v17->_pixelFormat = a5;
    v17->_sampleCount = a6;
    objc_storeStrong((id *)&v17->_layer, a3);
    v17->_strokeWeight = 0.035;
    __asm { FMOV            V0.2S, #16.0 }
    *(void *)&v17->_edgeFactor = _D0;
    v17->_dirty_tesselation_factors = 1;
    v17->_angularVelocity.angle = 0.0;
    *(void *)&v17->_anon_c8[8] = 0;
    *(void *)&v17->_anon_c8[16] = 0;
    *(_OWORD *)&v17->_anon_c8[24] = 0u;
    [(ARCoachingGlyphRenderer *)v17 setA_vel:0.0];
    [(ARCoachingGlyphRenderer *)v17 setRotationAngleY:0.0];
    v23 = objc_alloc_init(ARCoachingGlyphState);
    state = v17->_state;
    v17->_state = v23;

    v25 = objc_alloc_init(ARCoachingAnimTime);
    time = v17->_time;
    v17->_time = v25;

    v17->_lastDrawableSize.width = -1.0;
    v17->_lastDrawableSize.height = -1.0;
    v27 = [[ARCoachingDeviceController alloc] initWithDeviceMaskImage:v15 geoTrackingMode:0];
    deviceController = v17->_deviceController;
    v17->_deviceController = v27;

    v29 = [ARCoachingDeviceController alloc];
    v30 = [MEMORY[0x263F1C550] whiteColor];
    id v105 = v15;
    uint64_t v31 = [(ARCoachingDeviceController *)v29 initWithDeviceMaskImage:v15 solidColor:v30 geoTrackingMode:0];
    parallaxDeviceController = v17->_parallaxDeviceController;
    v17->_parallaxDeviceController = (ARCoachingDeviceController *)v31;

    [(ARCoachingDeviceController *)v17->_parallaxDeviceController setLayerParent:v17->_layer];
    [(ARCoachingDeviceController *)v17->_deviceController setLayerParent:v17->_layer];
    [(CAMetalLayer *)v17->_layer setAllowsGroupBlending:1];
    uint64_t v33 = ARCreateNonFixedPriorityDispatchQueue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v33;

    id v35 = v14;
    v36 = [[ARCoachingMetalSplineData alloc] init:v14];
    splineData = v17->_splineData;
    v17->_splineData = v36;

    v38 = v17->_splineData;
    v39 = [(ARCoachingMetalSplineData *)v38 shapes];
    v40 = [v39 controlPoints];
    v41 = [v40 objectAtIndexedSubscript:2];
    uint64_t v42 = [v41 controlPoints];
    v43 = [(ARCoachingMetalSplineData *)v17->_splineData shapes];
    v44 = [v43 controlPoints];
    v45 = [v44 objectAtIndexedSubscript:2];
    -[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:](v38, "computeShapeBlendWithEnd:endCount:", v42, [v45 numControlPoints]);

    v46 = objc_alloc_init(ARCoachingQuaternionSpring);
    rotationSpring = v17->_rotationSpring;
    v17->_rotationSpring = v46;

    v48 = v17->_state;
    if (v48)
    {
      [(ARCoachingGlyphState *)v48 computeQuaternionTarget];
    }
    else
    {
      long long v122 = 0u;
      long long v123 = 0u;
    }
    v49 = v17->_rotationSpring;
    v121[0] = v122;
    v121[1] = v123;
    [(ARCoachingQuaternionSpring *)v49 setTarget:v121];
    v50 = v17->_rotationSpring;
    id v14 = v35;
    if (v50)
    {
      [(ARCoachingQuaternionSpring *)v50 target];
    }
    else
    {
      long long v119 = 0u;
      long long v120 = 0u;
    }
    id v15 = v105;
    long long v51 = v120;
    *(_OWORD *)v17->_anon_a0 = v119;
    *(_OWORD *)&v17->_anon_a0[16] = v51;
    v52 = objc_alloc_init(ARCoachingSpringDouble3);
    scaleSpring = v17->_scaleSpring;
    v17->_scaleSpring = v52;

    [(ARCoachingSpringDouble3 *)v17->_scaleSpring setResponse:0.699999988];
    v55 = v17->_state;
    if (v55)
    {
      [(ARCoachingGlyphState *)v55 computeScaleTarget];
      int8x16_t v56 = (int8x16_t)v117[2];
      unint64_t v57 = vextq_s8(v56, v56, 8uLL).u64[0];
      *(void *)&long long v54 = v118;
    }
    else
    {
      v56.i64[0] = 0;
      unint64_t v57 = 0;
      *(void *)&long long v54 = 0;
    }
    v58 = v17->_scaleSpring;
    v56.i64[1] = v57;
    v117[0] = v56;
    v117[1] = v54;
    [(ARCoachingSpringDouble3 *)v58 setTarget:v117];
    v60 = v17->_scaleSpring;
    if (v60)
    {
      [(ARCoachingSpringDouble3 *)v60 target];
      int8x16_t v61 = (int8x16_t)v115[2];
      unint64_t v62 = vextq_s8(v61, v61, 8uLL).u64[0];
      *(void *)&long long v59 = v116;
      v60 = v17->_scaleSpring;
    }
    else
    {
      v61.i64[0] = 0;
      unint64_t v62 = 0;
      *(void *)&long long v59 = 0;
    }
    v61.i64[1] = v62;
    v115[0] = v61;
    v115[1] = v59;
    [(ARCoachingSpringDouble3 *)v60 setValue:v115];
    v63 = objc_alloc_init(ARCoachingSpringDouble3);
    topPlaneTranslationSpring = v17->_topPlaneTranslationSpring;
    v17->_topPlaneTranslationSpring = v63;

    [(ARCoachingSpringDouble3 *)v17->_topPlaneTranslationSpring setResponse:0.699999988];
    v66 = v17->_state;
    if (v66)
    {
      [(ARCoachingGlyphState *)v66 computeTopPlaneTranslationTarget];
      int8x16_t v67 = (int8x16_t)v113[2];
      unint64_t v68 = vextq_s8(v67, v67, 8uLL).u64[0];
      *(void *)&long long v65 = v114;
    }
    else
    {
      v67.i64[0] = 0;
      unint64_t v68 = 0;
      *(void *)&long long v65 = 0;
    }
    v69 = v17->_topPlaneTranslationSpring;
    v67.i64[1] = v68;
    v113[0] = v67;
    v113[1] = v65;
    [(ARCoachingSpringDouble3 *)v69 setTarget:v113];
    v71 = v17->_topPlaneTranslationSpring;
    if (v71)
    {
      [(ARCoachingSpringDouble3 *)v71 target];
      int8x16_t v72 = (int8x16_t)v111[2];
      unint64_t v73 = vextq_s8(v72, v72, 8uLL).u64[0];
      *(void *)&long long v70 = v112;
      v71 = v17->_topPlaneTranslationSpring;
    }
    else
    {
      v72.i64[0] = 0;
      unint64_t v73 = 0;
      *(void *)&long long v70 = 0;
    }
    v72.i64[1] = v73;
    v111[0] = v72;
    v111[1] = v70;
    [(ARCoachingSpringDouble3 *)v71 setValue:v111];
    v74 = objc_alloc_init(ARCoachingSpringDouble3);
    bottomPlaneTranslationSpring = v17->_bottomPlaneTranslationSpring;
    v17->_bottomPlaneTranslationSpring = v74;

    [(ARCoachingSpringDouble3 *)v17->_bottomPlaneTranslationSpring setResponse:0.699999988];
    v77 = v17->_state;
    if (v77)
    {
      [(ARCoachingGlyphState *)v77 computeBottomPlaneTranslationTarget];
      int8x16_t v78 = (int8x16_t)v109[2];
      unint64_t v79 = vextq_s8(v78, v78, 8uLL).u64[0];
      *(void *)&long long v76 = v110;
    }
    else
    {
      v78.i64[0] = 0;
      unint64_t v79 = 0;
      *(void *)&long long v76 = 0;
    }
    v80 = v17->_bottomPlaneTranslationSpring;
    v78.i64[1] = v79;
    v109[0] = v78;
    v109[1] = v76;
    [(ARCoachingSpringDouble3 *)v80 setTarget:v109];
    v82 = v17->_bottomPlaneTranslationSpring;
    if (v82)
    {
      [(ARCoachingSpringDouble3 *)v82 target];
      int8x16_t v83 = (int8x16_t)v107[2];
      unint64_t v84 = vextq_s8(v83, v83, 8uLL).u64[0];
      *(void *)&long long v81 = v108;
      v82 = v17->_bottomPlaneTranslationSpring;
    }
    else
    {
      v83.i64[0] = 0;
      unint64_t v84 = 0;
      *(void *)&long long v81 = 0;
    }
    v83.i64[1] = v84;
    v107[0] = v83;
    v107[1] = v81;
    [(ARCoachingSpringDouble3 *)v82 setValue:v107];
    v85 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    cubeResolveSpring = v17->_cubeResolveSpring;
    v17->_cubeResolveSpring = v85;

    [(ARFLSpring *)v17->_cubeResolveSpring parameters];
    double v88 = v87;
    [(ARFLSpring *)v17->_cubeResolveSpring parameters];
    [(ARFLSpring *)v17->_cubeResolveSpring setParameters:ARFLSpringParametersMake([(ARFLSpring *)v17->_cubeResolveSpring parameters], v88, v89, 0.699999988)];
    [(ARFLSpring *)v17->_cubeResolveSpring setTarget:0.0];
    [(ARFLSpring *)v17->_cubeResolveSpring setValue:0.0];
    v90 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    planeResolveSpring = v17->_planeResolveSpring;
    v17->_planeResolveSpring = v90;

    [(ARFLSpring *)v17->_planeResolveSpring parameters];
    double v93 = v92;
    [(ARFLSpring *)v17->_planeResolveSpring parameters];
    [(ARFLSpring *)v17->_planeResolveSpring setParameters:ARFLSpringParametersMake([(ARFLSpring *)v17->_planeResolveSpring parameters], v93, v94, 0.699999988)];
    [(ARFLSpring *)v17->_planeResolveSpring setTarget:0.0];
    [(ARFLSpring *)v17->_planeResolveSpring setValue:0.0];
    v95 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    verticalResolvingSpring = v17->_verticalResolvingSpring;
    v17->_verticalResolvingSpring = v95;

    [(ARFLSpring *)v17->_verticalResolvingSpring parameters];
    -[ARFLSpring setParameters:](v17->_verticalResolvingSpring, "setParameters:");
    [(ARFLSpring *)v17->_verticalResolvingSpring setTarget:0.0];
    [(ARFLSpring *)v17->_verticalResolvingSpring setValue:0.0];
    v97 = [[ARCoachingStateSpring alloc] initWithValue:0.0];
    alphaSpring = v17->_alphaSpring;
    v17->_alphaSpring = v97;

    [(ARFLSpring *)v17->_alphaSpring setTarget:0.0];
    [(ARFLSpring *)v17->_alphaSpring setValue:0.0];
    v99 = [ARCoachingBasicSpring alloc];
    LODWORD(v100) = 1128792064;
    LODWORD(v101) = 22.0;
    uint64_t v102 = [(ARCoachingBasicSpring *)v99 initWithTension:v100 friction:v101];
    orientationSpring = v17->_orientationSpring;
    v17->_orientationSpring = (ARCoachingBasicSpring *)v102;

    [(ARCoachingGlyphState *)v17->_state setDelegate:v17];
    id v13 = v106;
  }

  return v17;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_device;
  pixelFormat = (void *)self->_pixelFormat;
  int sampleCount = self->_sampleCount;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__ARCoachingGlyphRenderer_prepareWithCompletionHandler___block_invoke;
  v11[3] = &unk_264000E38;
  v12 = v5;
  v9 = v5;
  objc_copyWeak(v14, &location);
  int v15 = sampleCount;
  v14[1] = pixelFormat;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __56__ARCoachingGlyphRenderer_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  v3 = ARKitUIBundle();
  id v4 = [v3 URLForResource:@"default" withExtension:@"metallib"];
  if (v4)
  {
    id v71 = 0;
    v5 = (void *)[v2 newLibraryWithURL:v4 error:&v71];
    v6 = v71;
    [v5 setLabel:@"com.apple.arkit.coachinganimation.library"];
    if (v6)
    {
      v7 = _ARLogCoaching_6();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [v6 localizedDescription];
        v9 = [v6 localizedFailureReason];
        id v10 = [v6 localizedRecoverySuggestion];
        *(_DWORD *)buf = 138412802;
        id v73 = v8;
        __int16 v74 = 2112;
        v75 = v9;
        __int16 v76 = 2112;
        v77 = v10;
        _os_log_impl(&dword_20B202000, v7, OS_LOG_TYPE_ERROR, "Error while loading metal library for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v6 = _ARLogCoaching_6();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B202000, v6, OS_LOG_TYPE_ERROR, "Failed to find metal library for coaching animations", buf, 2u);
    }
    v5 = 0;
  }

  id v11 = [[ARCoachingDotsRenderer alloc] init:*(void *)(a1 + 32) pixelFormat:*(void *)(a1 + 56) metalLibrary:v5 sampleCount:*(unsigned int *)(a1 + 64)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setDotsRenderer:v11];

  uint64_t v13 = [v5 newFunctionWithName:@"tessellation_kernel_quad"];
  uint64_t v14 = [v5 newFunctionWithName:@"tessellation_vertex_quad"];
  uint64_t v15 = [v5 newFunctionWithName:@"tessellation_fragment"];
  v16 = [MEMORY[0x263F12A80] vertexDescriptor];
  v17 = [v16 attributes];
  v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setFormat:30];

  v19 = [v16 attributes];
  v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setOffset:0];

  v21 = [v16 attributes];
  v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setBufferIndex:0];

  v23 = [v16 attributes];
  v24 = [v23 objectAtIndexedSubscript:1];
  [v24 setFormat:28];

  v25 = [v16 attributes];
  v26 = [v25 objectAtIndexedSubscript:1];
  [v26 setOffset:16];

  v27 = [v16 attributes];
  v28 = [v27 objectAtIndexedSubscript:1];
  [v28 setBufferIndex:0];

  v29 = [v16 layouts];
  v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setStepFunction:4];

  uint64_t v31 = [v16 layouts];
  v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setStepRate:1];

  uint64_t v33 = [v16 layouts];
  v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setStride:32];

  id v35 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v35 setVertexDescriptor:v16];
  [v35 setTessellationFactorScaleEnabled:0];
  [v35 setTessellationFactorFormat:0];
  [v35 setTessellationControlPointIndexType:1];
  [v35 setTessellationFactorStepFunction:1];
  [v35 setTessellationOutputWindingOrder:0];
  [v35 setTessellationPartitionMode:3];
  [v35 setMaxTessellationFactor:16];
  unint64_t v68 = (void *)v14;
  [v35 setVertexFunction:v14];
  int8x16_t v67 = (void *)v15;
  [v35 setFragmentFunction:v15];
  v36 = [v35 colorAttachments];
  v37 = [v36 objectAtIndexedSubscript:0];
  [v37 setBlendingEnabled:1];

  v38 = [v35 colorAttachments];
  v39 = [v38 objectAtIndexedSubscript:0];
  [v39 setRgbBlendOperation:4];

  v40 = [v35 colorAttachments];
  v41 = [v40 objectAtIndexedSubscript:0];
  [v41 setAlphaBlendOperation:4];

  uint64_t v42 = [v35 colorAttachments];
  v43 = [v42 objectAtIndexedSubscript:0];
  [v43 setSourceRGBBlendFactor:1];

  v44 = [v35 colorAttachments];
  v45 = [v44 objectAtIndexedSubscript:0];
  [v45 setSourceAlphaBlendFactor:1];

  v46 = [v35 colorAttachments];
  v47 = [v46 objectAtIndexedSubscript:0];
  [v47 setDestinationRGBBlendFactor:5];

  v48 = [v35 colorAttachments];
  v49 = [v48 objectAtIndexedSubscript:0];
  [v49 setDestinationAlphaBlendFactor:5];

  uint64_t v50 = *(void *)(a1 + 56);
  long long v51 = [v35 colorAttachments];
  v52 = [v51 objectAtIndexedSubscript:0];
  [v52 setPixelFormat:v50];

  [v35 setRasterSampleCount:*(int *)(a1 + 64)];
  v53 = *(void **)(a1 + 32);
  id v70 = 0;
  long long v54 = (void *)[v53 newRenderPipelineStateWithDescriptor:v35 error:&v70];
  id v55 = v70;
  if (v54)
  {
    id v56 = objc_loadWeakRetained((id *)(a1 + 48));
    [v56 setPostTessellationPipelineState:v54];

    unint64_t v57 = *(void **)(a1 + 32);
    id v69 = 0;
    v58 = (void *)v13;
    long long v59 = (void *)[v57 newComputePipelineStateWithFunction:v13 error:&v69];
    id v55 = v69;
    if (v59)
    {
      id v60 = objc_loadWeakRetained((id *)(a1 + 48));
      [v60 setComputePipelineState:v59];

      uint64_t v61 = *(void *)(a1 + 40);
      if (!v61)
      {
LABEL_22:

        goto LABEL_23;
      }
      unint64_t v62 = *(void (**)(void))(v61 + 16);
    }
    else
    {
      long long v65 = _ARLogCoaching_6();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v55;
        _os_log_impl(&dword_20B202000, v65, OS_LOG_TYPE_ERROR, "Failed to create compute pipeline state object. error %@", buf, 0xCu);
      }

      uint64_t v66 = *(void *)(a1 + 40);
      if (!v66) {
        goto LABEL_22;
      }
      unint64_t v62 = *(void (**)(void))(v66 + 16);
    }
    v62();
    goto LABEL_22;
  }
  v58 = (void *)v13;
  v63 = _ARLogCoaching_6();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v55;
    _os_log_impl(&dword_20B202000, v63, OS_LOG_TYPE_ERROR, "Failed to create post tessellation render pipeline state object. error %@", buf, 0xCu);
  }

  uint64_t v64 = *(void *)(a1 + 40);
  if (v64) {
    (*(void (**)(uint64_t, id))(v64 + 16))(v64, v55);
  }
LABEL_23:
}

- (void)snapStateChanged
{
  [(ARCoachingMetalSplineData *)self->_splineData recordState];
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  -[ARCoachingAnimTime setStartTime:](self->_time, "setStartTime:");
  double v3 = 1.0;
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [(ARFLSpring *)self->_planeResolveSpring setTarget:v4];
  BOOL v5 = [(ARCoachingGlyphState *)self->_state isVertical];
  double v6 = 1.0;
  if (!v5)
  {
    unint64_t v7 = [(ARCoachingGlyphState *)self->_state snapState];
    double v6 = 1.0;
    if (v7 != 3) {
      double v6 = 0.0;
    }
  }
  [(ARFLSpring *)self->_verticalResolvingSpring setTarget:v6];
  if ([(ARCoachingGlyphState *)self->_state snapState])
  {
    if ([(ARCoachingGlyphState *)self->_state snapState] == 4) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  [(ARFLSpring *)self->_cubeResolveSpring setTarget:v3];
  unint64_t v8 = [(ARCoachingGlyphState *)self->_state snapState];
  double v9 = 1.0;
  if (!v8) {
    double v9 = 0.0;
  }
  [(ARFLSpring *)self->_alphaSpring setTarget:v9];
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1)
  {
    [(ARFLSpring *)self->_planeResolveSpring target];
    -[ARFLSpring setValue:](self->_planeResolveSpring, "setValue:");
    [(ARFLSpring *)self->_verticalResolvingSpring target];
    -[ARFLSpring setValue:](self->_verticalResolvingSpring, "setValue:");
    [(ARFLSpring *)self->_cubeResolveSpring target];
    -[ARFLSpring setValue:](self->_cubeResolveSpring, "setValue:");
    [(ARFLSpring *)self->_alphaSpring target];
    -[ARFLSpring setValue:](self->_alphaSpring, "setValue:");
    time = self->_time;
    [(ARCoachingAnimTime *)time setAbsoluteTime:0.0];
  }
}

- (void)quaternionTargetChanged
{
  state = self->_state;
  if (state)
  {
    [(ARCoachingGlyphState *)state quaternionTarget];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  rotationSpring = self->_rotationSpring;
  v12[0] = v13;
  v12[1] = v14;
  [(ARCoachingQuaternionSpring *)rotationSpring setTarget:v12];
  long long v5 = *(_OWORD *)&self->_anon_a0[16];
  double v6 = self->_rotationSpring;
  v11[0] = *(_OWORD *)self->_anon_a0;
  v11[1] = v5;
  [(ARCoachingQuaternionSpring *)v6 setValue:v11];
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1)
  {
    unint64_t v7 = self->_rotationSpring;
    if (v7)
    {
      [(ARCoachingQuaternionSpring *)v7 target];
      unint64_t v7 = self->_rotationSpring;
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    v8[0] = v9;
    v8[1] = v10;
    [(ARCoachingQuaternionSpring *)v7 setValue:v8];
  }
}

- (void)scaleTargetChanged
{
  state = self->_state;
  if (state)
  {
    [(ARCoachingGlyphState *)state scaleTarget];
    int8x16_t v5 = (int8x16_t)v14[2];
    unint64_t v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(void *)&long long v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    unint64_t v6 = 0;
    *(void *)&long long v2 = 0;
  }
  scaleSpring = self->_scaleSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  [(ARCoachingSpringDouble3 *)scaleSpring setTarget:v14];
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1)
  {
    long long v9 = self->_scaleSpring;
    if (v9)
    {
      [(ARCoachingSpringDouble3 *)v9 target];
      int8x16_t v10 = (int8x16_t)v12[2];
      unint64_t v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(void *)&long long v8 = v13;
      long long v9 = self->_scaleSpring;
    }
    else
    {
      v10.i64[0] = 0;
      unint64_t v11 = 0;
      *(void *)&long long v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    [(ARCoachingSpringDouble3 *)v9 setValue:v12];
  }
}

- (void)topPlaneTranslationTargetChanged
{
  state = self->_state;
  if (state)
  {
    [(ARCoachingGlyphState *)state topPlaneTranslationTarget];
    int8x16_t v5 = (int8x16_t)v14[2];
    unint64_t v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(void *)&long long v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    unint64_t v6 = 0;
    *(void *)&long long v2 = 0;
  }
  topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  [(ARCoachingSpringDouble3 *)topPlaneTranslationSpring setTarget:v14];
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1)
  {
    long long v9 = self->_topPlaneTranslationSpring;
    if (v9)
    {
      [(ARCoachingSpringDouble3 *)v9 target];
      int8x16_t v10 = (int8x16_t)v12[2];
      unint64_t v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(void *)&long long v8 = v13;
      long long v9 = self->_topPlaneTranslationSpring;
    }
    else
    {
      v10.i64[0] = 0;
      unint64_t v11 = 0;
      *(void *)&long long v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    [(ARCoachingSpringDouble3 *)v9 setValue:v12];
  }
}

- (void)bottomPlaneTranslationTargetChanged
{
  state = self->_state;
  if (state)
  {
    [(ARCoachingGlyphState *)state bottomPlaneTranslationTarget];
    int8x16_t v5 = (int8x16_t)v14[2];
    unint64_t v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(void *)&long long v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    unint64_t v6 = 0;
    *(void *)&long long v2 = 0;
  }
  bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  [(ARCoachingSpringDouble3 *)bottomPlaneTranslationSpring setTarget:v14];
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1)
  {
    long long v9 = self->_bottomPlaneTranslationSpring;
    if (v9)
    {
      [(ARCoachingSpringDouble3 *)v9 target];
      int8x16_t v10 = (int8x16_t)v12[2];
      unint64_t v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(void *)&long long v8 = v13;
      long long v9 = self->_bottomPlaneTranslationSpring;
    }
    else
    {
      v10.i64[0] = 0;
      unint64_t v11 = 0;
      *(void *)&long long v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    [(ARCoachingSpringDouble3 *)v9 setValue:v12];
  }
}

- (void)generateTexturesWithSize:(CGSize)a3
{
  if (a3.width != *MEMORY[0x263F001B0] || a3.height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if (self->_sampleCount == 1)
    {
      msaaTex = self->_msaaTex;
      self->_msaaTex = 0;
    }
    else
    {
      id v8 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:self->_pixelFormat width:(int)a3.width height:(int)a3.height mipmapped:0];
      [v8 setUsage:4];
      [v8 setTextureType:4];
      [v8 setSampleCount:self->_sampleCount];
      [v8 setStorageMode:3];
      unint64_t v6 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v8];
      unint64_t v7 = self->_msaaTex;
      self->_msaaTex = v6;

      msaaTex = (MTLTexture *)v8;
    }
  }
}

- (void)computeTesselationFactorsForCommandBuffer:(id)a3
{
  double v4 = [a3 computeCommandEncoder];
  [v4 setLabel:@"Compute Command Encoder"];
  [v4 pushDebugGroup:@"Compute Tessellation Factors"];
  [v4 setComputePipelineState:self->_computePipelineState];
  [v4 setBytes:&self->_edgeFactor length:4 atIndex:0];
  [v4 setBytes:&self->_insideFactor length:4 atIndex:1];
  int8x16_t v5 = [(ARCoachingMetalSplineData *)self->_splineData tessellationFactorsBuffer];
  [v4 setBuffer:v5 offset:0 atIndex:2];

  unint64_t v6 = [(ARCoachingMetalSplineData *)self->_splineData patchUserDataBuffer];
  [v4 setBuffer:v6 offset:0 atIndex:3];

  int64x2_t v9 = vdupq_n_s64(1uLL);
  uint64_t v10 = 1;
  uint64_t v7 = [(ARCoachingMetalSplineData *)self->_splineData patchCount];
  int64x2_t v8 = v9;
  [v4 dispatchThreadgroups:&v9 threadsPerThreadgroup:&v7];
  [v4 popDebugGroup];
  [v4 endEncoding];
}

- (void)renderPostTessellationInDrawable:(id)a3 withCommandBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ARFLSpring *)self->_planeResolveSpring value];
  float64_t v120 = v8;
  [(ARFLSpring *)self->_cubeResolveSpring value];
  _Q1.f64[0] = v120;
  _Q1.f64[1] = v10;
  float32x2_t v11 = vmaxnm_f32(vcvt_f32_f64(_Q1), 0);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v121 = vminnm_f32(v11, *(float32x2_t *)&_Q1.f64[0]);
  float32x2_t v131 = v121;
  [(ARFLSpring *)self->_alphaSpring value];
  *(float *)&double v16 = fmin(fmax(v16, 0.0), 1.0);
  int v130 = LODWORD(v16);
  float32x4_t v17 = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[16], vsubq_f32(*(float32x4_t *)&self->_anon_170[16], *(float32x4_t *)&self->_anon_1b0[16]), v121, 1);
  *(float32x4_t *)self->_anon_130 = vmlaq_lane_f32(*(float32x4_t *)self->_anon_1b0, vsubq_f32(*(float32x4_t *)self->_anon_170, *(float32x4_t *)self->_anon_1b0), v121, 1);
  *(float32x4_t *)&self->_anon_130[16] = v17;
  float32x4_t v18 = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[48], vsubq_f32(*(float32x4_t *)&self->_anon_170[48], *(float32x4_t *)&self->_anon_1b0[48]), v121, 1);
  *(float32x4_t *)&self->_anon_130[32] = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[32], vsubq_f32(*(float32x4_t *)&self->_anon_170[32], *(float32x4_t *)&self->_anon_1b0[32]), v121, 1);
  *(float32x4_t *)&self->_anon_130[48] = v18;
  v19 = [MEMORY[0x263F129A0] renderPassDescriptor];
  int sampleCount = self->_sampleCount;
  if (sampleCount >= 2)
  {
    msaaTex = self->_msaaTex;
  }
  else
  {
    msaaTex = [v6 texture];
  }
  v22 = [v19 colorAttachments];
  v23 = [v22 objectAtIndexedSubscript:0];
  [v23 setTexture:msaaTex];

  if (sampleCount <= 1) {
  int v24 = self->_sampleCount;
  }
  if (v24 < 2)
  {
    v25 = 0;
  }
  else
  {
    v25 = [v6 texture];
  }
  float v26 = v121.f32[1];
  v27 = [v19 colorAttachments];
  v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setResolveTexture:v25];

  if (v24 >= 2) {
  v29 = [v19 colorAttachments];
  }
  v30 = [v29 objectAtIndexedSubscript:0];
  objc_msgSend(v30, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  if (self->_sampleCount <= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = 2;
  }
  v32 = [v19 colorAttachments];
  uint64_t v33 = [v32 objectAtIndexedSubscript:0];
  [v33 setStoreAction:v31];

  v34 = [v19 colorAttachments];
  id v35 = [v34 objectAtIndexedSubscript:0];
  [v35 setLoadAction:2];

  v36 = [v7 renderCommandEncoderWithDescriptor:v19];
  [v36 setLabel:@"Render Command Encoder"];
  [v36 pushDebugGroup:@"Dots"];
  [(ARFLSpring *)self->_verticalResolvingSpring value];
  double v109 = v37;
  [(ARFLSpring *)self->_verticalResolvingSpring value];
  double v38 = 1.0 - v121.f32[1];
  double v40 = v39 * v38;
  *(float *)&unsigned int v41 = 0.5 * (v39 * v38);
  +[ARCoachingTransformations translate:COERCE_DOUBLE((unint64_t)v41)];
  float32x4_t v114 = v43;
  long long v117 = v42;
  float32x4_t v110 = v45;
  float32x4_t v111 = v44;
  v46 = [(ARCoachingMetalSplineData *)self->_splineData instanceTransforms];
  v47 = [v46 firstObject];
  [v47 transform];
  uint64_t v48 = 0;
  float32x4_t v49 = *(float32x4_t *)self->_anon_f0;
  float32x4_t v50 = *(float32x4_t *)&self->_anon_f0[16];
  float32x4_t v51 = *(float32x4_t *)&self->_anon_f0[32];
  float32x4_t v52 = *(float32x4_t *)&self->_anon_f0[48];
  long long v132 = v53;
  float32x4_t v133 = v54;
  float32x4_t v134 = v55;
  float32x4_t v135 = v56;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v48) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(long long *)((char *)&v132 + v48))), v50, *(float32x2_t *)((char *)&v132 + v48), 1), v51, *(float32x4_t *)((char *)&v132 + v48), 2), v52, *(float32x4_t *)((char *)&v132 + v48), 3);
    v48 += 16;
  }
  while (v48 != 64);
  float32x4_t v104 = v137;
  float32x4_t v106 = (float32x4_t)v136;
  float32x4_t v100 = v139;
  float32x4_t v102 = v138;

  uint64_t v57 = 0;
  long long v132 = v117;
  float32x4_t v133 = v114;
  float32x4_t v134 = v111;
  float32x4_t v135 = v110;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v57) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v106, COERCE_FLOAT(*(long long *)((char *)&v132 + v57))), v104, *(float32x2_t *)((char *)&v132 + v57), 1), v102, *(float32x4_t *)((char *)&v132 + v57), 2), v100, *(float32x4_t *)((char *)&v132 + v57), 3);
    v57 += 16;
  }
  while (v57 != 64);
  uint64_t v58 = 0;
  float32x4_t v59 = *(float32x4_t *)self->_anon_130;
  float32x4_t v60 = *(float32x4_t *)&self->_anon_130[16];
  float32x4_t v61 = *(float32x4_t *)&self->_anon_130[32];
  float32x4_t v62 = *(float32x4_t *)&self->_anon_130[48];
  long long v132 = v136;
  float32x4_t v133 = v137;
  float32x4_t v134 = v138;
  float32x4_t v135 = v139;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v58) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(long long *)((char *)&v132 + v58))), v60, *(float32x2_t *)((char *)&v132 + v58), 1), v61, *(float32x4_t *)((char *)&v132 + v58), 2), v62, *(float32x4_t *)((char *)&v132 + v58), 3);
    v58 += 16;
  }
  while (v58 != 64);
  double v105 = *(double *)v138.i64;
  double v107 = *(double *)v139.i64;
  double v101 = *(double *)&v136;
  double v103 = *(double *)v137.i64;
  long long v128 = 0uLL;
  uint64_t v129 = 0;
  long long v136 = kARCoachingDotsRenderParamsHorizontal;
  v137.i64[0] = 1077936128;
  long long v132 = kARCoachingDotsRenderParamsVertical;
  v133.i64[0] = 0x3E20D97C40200000;
  *(float *)&double v63 = ARCoachingDotsRenderParamsLerp((uint64_t)&v136, (uint64_t)&v132, (uint64_t)&v128, v40);
  dotsRenderer = self->_dotsRenderer;
  device = self->_device;
  [(ARFLSpring *)self->_cubeResolveSpring value];
  double v67 = 1.0 - v66;
  [(ARFLSpring *)self->_planeResolveSpring value];
  *(float *)&double v67 = v67 * v68;
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  long long v136 = v128;
  v137.i64[0] = v129;
  LODWORD(v69) = LODWORD(v67);
  -[ARCoachingDotsRenderer encode:renderCommandEncoder:mvp:visibility:renderParams:time:](dotsRenderer, "encode:renderCommandEncoder:mvp:visibility:renderParams:time:", device, v36, &v136, v101, v103, v105, v107, v69, v70);
  [v36 popDebugGroup];
  if ([(ARCoachingGlyphState *)self->_state isVertical]
    && [(ARCoachingGlyphState *)self->_state snapState] == 4)
  {
    long long v71 = xmmword_20B2321F0;
  }
  else
  {
    long long v71 = xmmword_20B231E60;
  }
  float32x4_t v108 = (float32x4_t)v71;
  [(ARCoachingBasicSpring *)self->_orientationSpring output];
  __float2 v73 = __sincosf_stret(v72 * 0.5);
  uint64_t v74 = 0;
  float32x4_t v75 = vmulq_n_f32(v108, v73.__sinval);
  v75.i32[3] = LODWORD(v73.__cosval);
  v76.f64[0] = v109;
  v76.f64[1] = 1.0 - v109;
  float32x4_t v77 = (float32x4_t)vmulq_f64(v76, (float64x2_t)xmmword_20B232620);
  float32x4_t v126 = 0u;
  float32x4_t v127 = 0u;
  *(float32x2_t *)v77.f32 = vcvt_f32_f64((float64x2_t)v77);
  long long v124 = 0u;
  float32x4_t v125 = 0u;
  float32x4_t v78 = vaddq_f32(v110, vmulq_lane_f32(v77, v121, 1));
  float32x4_t v79 = *(float32x4_t *)self->_anon_f0;
  float32x4_t v80 = *(float32x4_t *)&self->_anon_f0[16];
  float32x4_t v81 = *(float32x4_t *)&self->_anon_f0[32];
  float32x4_t v82 = *(float32x4_t *)&self->_anon_f0[48];
  long long v132 = v117;
  float32x4_t v133 = v114;
  float32x4_t v134 = v111;
  float32x4_t v135 = v78;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v74) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(long long *)((char *)&v132 + v74))), v80, *(float32x2_t *)((char *)&v132 + v74), 1), v81, *(float32x4_t *)((char *)&v132 + v74), 2), v82, *(float32x4_t *)((char *)&v132 + v74), 3);
    v74 += 16;
  }
  while (v74 != 64);
  float32x4_t v118 = v137;
  float32x4_t v122 = (float32x4_t)v136;
  float32x4_t v112 = v139;
  float32x4_t v115 = v138;
  *(double *)&long long v83 = simd_matrix4x4(v75);
  uint64_t v84 = 0;
  long long v132 = v83;
  float32x4_t v133 = v85;
  float32x4_t v134 = v86;
  float32x4_t v135 = v87;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v84) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, COERCE_FLOAT(*(long long *)((char *)&v132 + v84))), v118, *(float32x2_t *)((char *)&v132 + v84), 1), v115, *(float32x4_t *)((char *)&v132 + v84), 2), v112, *(float32x4_t *)((char *)&v132 + v84), 3);
    v84 += 16;
  }
  while (v84 != 64);
  float32x4_t v119 = v137;
  float32x4_t v123 = (float32x4_t)v136;
  float32x4_t v113 = v139;
  float32x4_t v116 = v138;
  double v88 = v38 + (float)(v26 * 0.85);
  *(float *)&double v88 = v88;
  +[ARCoachingTransformations scale:*(double *)vdupq_lane_s32(*(int32x2_t *)&v88, 0).i64];
  uint64_t v89 = 0;
  long long v132 = v90;
  float32x4_t v133 = v91;
  float32x4_t v134 = v92;
  float32x4_t v135 = v93;
  long long v136 = 0u;
  float32x4_t v137 = 0u;
  float32x4_t v138 = 0u;
  float32x4_t v139 = 0u;
  do
  {
    *(long long *)((char *)&v136 + v89) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v123, COERCE_FLOAT(*(long long *)((char *)&v132 + v89))), v119, *(float32x2_t *)((char *)&v132 + v89), 1), v116, *(float32x4_t *)((char *)&v132 + v89), 2), v113, *(float32x4_t *)((char *)&v132 + v89), 3);
    v89 += 16;
  }
  while (v89 != 64);
  long long v124 = v136;
  float32x4_t v125 = v137;
  float32x4_t v126 = v138;
  float32x4_t v127 = v139;
  [v36 pushDebugGroup:@"Post Tessellation and Render"];
  [v36 setRenderPipelineState:self->_postTessellationPipelineState];
  double v94 = [(ARCoachingMetalSplineData *)self->_splineData controlPointsBuffer];
  [v36 setVertexBuffer:v94 offset:0 atIndex:0];

  v95 = [(ARCoachingMetalSplineData *)self->_splineData instanceBuffer];
  [v36 setVertexBuffer:v95 offset:0 atIndex:1];

  [v36 setVertexBytes:&v124 length:64 atIndex:2];
  [v36 setVertexBytes:self->_anon_130 length:64 atIndex:3];
  [v36 setVertexBytes:&self->_strokeWeight length:4 atIndex:4];
  [v36 setVertexBytes:&v131 length:8 atIndex:5];
  [v36 setVertexBytes:&v130 length:4 atIndex:6];
  v96 = [(ARCoachingMetalSplineData *)self->_splineData tessellationFactorsBuffer];
  [v36 setTessellationFactorBuffer:v96 offset:0 instanceStride:0];

  uint64_t v97 = [(ARCoachingMetalSplineData *)self->_splineData patchCount];
  v98 = [(ARCoachingMetalSplineData *)self->_splineData controlPointIndicesBuffer];
  v99 = [(ARCoachingMetalSplineData *)self->_splineData instanceTransforms];
  objc_msgSend(v36, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", 4, 0, v97, 0, 0, v98, 0, objc_msgSend(v99, "count"), 0);

  [v36 popDebugGroup];
  [v36 endEncoding];
}

- (void)updateAngularVelocity
{
  [(ARCoachingGlyphRenderer *)self a_vel];
  *(float *)&double v4 = v3 * 0.97;
  [(ARCoachingGlyphRenderer *)self setA_vel:v4];
  [(ARCoachingGlyphRenderer *)self a_vel];
  self->_angularVelocity.angle = self->_angularVelocity.angle + v5 + (self->_angularVelocity.angle + v5) * -0.01;
  if ([(ARCoachingGlyphState *)self->_state isVertical]
    && [(ARCoachingGlyphState *)self->_state snapState] == 4)
  {
    double v7 = 0.0;
    *(void *)&long long v8 = 1.0;
  }
  else
  {
    *(void *)&long long v8 = 0;
    double v7 = 1.0;
  }
  *(void *)&long long v6 = 0;
  *((double *)&v8 + 1) = v7;
  *(_OWORD *)&self->_anon_c8[8] = v8;
  *(_OWORD *)&self->_anon_c8[24] = v6;
}

- (void)stepSprings:(double)a3
{
  -[ARCoachingQuaternionSpring stepWithDeltaTime:](self->_rotationSpring, "stepWithDeltaTime:");
  [(ARCoachingSpringDouble3 *)self->_scaleSpring stepWithDeltaTime:a3];
  [(ARCoachingSpringDouble3 *)self->_topPlaneTranslationSpring stepWithDeltaTime:a3];
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring stepWithDeltaTime:a3];
  [(ARFLSpring *)self->_cubeResolveSpring step:a3];
  [(ARFLSpring *)self->_planeResolveSpring step:a3];
  [(ARFLSpring *)self->_verticalResolvingSpring step:a3];
  [(ARFLSpring *)self->_alphaSpring step:a3];
  [(ARCoachingBasicSpring *)self->_orientationSpring stepWithDeltaTime:a3];
  rotationSpring = self->_rotationSpring;
  if (rotationSpring)
  {
    [(ARCoachingQuaternionSpring *)rotationSpring value];
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v6;
  *(_OWORD *)&self->_anon_a0[16] = v7;
}

- (void)resetSprings
{
  rotationSpring = self->_rotationSpring;
  if (rotationSpring)
  {
    [(ARCoachingQuaternionSpring *)rotationSpring target];
    rotationSpring = self->_rotationSpring;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  v25[0] = v26;
  v25[1] = v27;
  [(ARCoachingQuaternionSpring *)rotationSpring setValue:v25];
  scaleSpring = self->_scaleSpring;
  if (scaleSpring)
  {
    [(ARCoachingSpringDouble3 *)scaleSpring target];
    int8x16_t v6 = (int8x16_t)v23[2];
    unint64_t v7 = vextq_s8(v6, v6, 8uLL).u64[0];
    *(void *)&long long v4 = v24;
    scaleSpring = self->_scaleSpring;
  }
  else
  {
    v6.i64[0] = 0;
    unint64_t v7 = 0;
    *(void *)&long long v4 = 0;
  }
  v6.i64[1] = v7;
  v23[0] = v6;
  v23[1] = v4;
  [(ARCoachingSpringDouble3 *)scaleSpring setValue:v23];
  topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  if (topPlaneTranslationSpring)
  {
    [(ARCoachingSpringDouble3 *)topPlaneTranslationSpring target];
    int8x16_t v10 = (int8x16_t)v21[2];
    unint64_t v11 = vextq_s8(v10, v10, 8uLL).u64[0];
    *(void *)&long long v8 = v22;
    topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  }
  else
  {
    v10.i64[0] = 0;
    unint64_t v11 = 0;
    *(void *)&long long v8 = 0;
  }
  v10.i64[1] = v11;
  v21[0] = v10;
  v21[1] = v8;
  [(ARCoachingSpringDouble3 *)topPlaneTranslationSpring setValue:v21];
  bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  if (bottomPlaneTranslationSpring)
  {
    [(ARCoachingSpringDouble3 *)bottomPlaneTranslationSpring target];
    int8x16_t v14 = (int8x16_t)v19[2];
    unint64_t v15 = vextq_s8(v14, v14, 8uLL).u64[0];
    *(void *)&long long v12 = v20;
    bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  }
  else
  {
    v14.i64[0] = 0;
    unint64_t v15 = 0;
    *(void *)&long long v12 = 0;
  }
  v14.i64[1] = v15;
  v19[0] = v14;
  v19[1] = v12;
  [(ARCoachingSpringDouble3 *)bottomPlaneTranslationSpring setValue:v19];
  [(ARFLSpring *)self->_cubeResolveSpring target];
  -[ARFLSpring setValue:](self->_cubeResolveSpring, "setValue:");
  [(ARFLSpring *)self->_planeResolveSpring target];
  -[ARFLSpring setValue:](self->_planeResolveSpring, "setValue:");
  [(ARFLSpring *)self->_verticalResolvingSpring target];
  -[ARFLSpring setValue:](self->_verticalResolvingSpring, "setValue:");
  [(ARFLSpring *)self->_alphaSpring target];
  -[ARFLSpring setValue:](self->_alphaSpring, "setValue:");
  double v16 = self->_rotationSpring;
  if (v16)
  {
    [(ARCoachingQuaternionSpring *)v16 value];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v17;
  *(_OWORD *)&self->_anon_a0[16] = v18;
}

- (void)computeRotation:(double)a3
{
  float64x2_t v5 = *(float64x2_t *)self->_anon_a0;
  float64x2_t v6 = *(float64x2_t *)&self->_anon_a0[16];
  anon_a0 = self->_anon_a0;
  if (vaddvq_f64(vaddq_f64(vmulq_f64(v5, v5), vmulq_f64(v6, v6))) >= 0.0)
  {
    float64x2_t v25 = *(float64x2_t *)self->_anon_a0;
    float64x2_t v26 = v6;
    float64x2_t v23 = v5;
    float64x2_t v24 = v6;
    unint64_t v7 = &v25;
    long long v8 = &v23;
  }
  else
  {
    float64x2_t v25 = vnegq_f64(v5);
    float64x2_t v26 = vnegq_f64(v6);
    float64x2_t v23 = v5;
    float64x2_t v24 = v6;
    unint64_t v7 = &v23;
    long long v8 = &v25;
  }
  _simd_slerp_internal(v7, v8, v22);
  float64x2_t v9 = v22[1];
  *(float64x2_t *)anon_a0 = v22[0];
  *((float64x2_t *)anon_a0 + 1) = v9;
  float64x2_t v20 = *(float64x2_t *)&self->_anon_c8[8];
  float64x2_t v21 = *(float64x2_t *)&self->_anon_c8[24];
  __double2 v11 = __sincos_stret(self->_angularVelocity.angle * 0.5);
  v10.f64[0] = v11.__sinval;
  float64x2_t v12 = vmulq_n_f64(v20, v11.__sinval);
  *(void *)&v10.f64[0] = *(_OWORD *)&vmulq_f64(v21, v10);
  v10.f64[1] = v11.__cosval;
  float64x2_t v13 = *(float64x2_t *)self->_anon_a0;
  float64x2_t v14 = vnegq_f64(v12);
  float64x2_t v15 = (float64x2_t)vextq_s8((int8x16_t)v10, (int8x16_t)vnegq_f64(v10), 8uLL);
  *(double *)&long long v16 = simd_matrix4x4(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v12, *(float64x2_t *)&self->_anon_a0[16], 1), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v12, 8uLL), *(double *)&self->_anon_a0[16]), vmlaq_n_f64(vmulq_laneq_f64(v10, v13, 1), v15, v13.f64[0]))), vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v10, *(float64x2_t *)&self->_anon_a0[16], 1), v15, *(double *)&self->_anon_a0[16]), vmlaq_n_f64(vmulq_laneq_f64(v14, v13, 1), (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)v14, 8uLL), v13.f64[0]))));
  *(_OWORD *)self->_anon_f0 = v16;
  *(_OWORD *)&self->_anon_f0[16] = v17;
  *(_OWORD *)&self->_anon_f0[32] = v18;
  *(_OWORD *)&self->_anon_f0[48] = v19;
}

- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  id v71 = a4;
  id v70 = a5;
  [(ARCoachingGlyphRenderer *)self stepSprings:a3];
  time = self->_time;
  if ([(ARCoachingGlyphState *)self->_state snapState] == 1) {
    double v9 = 0.0;
  }
  else {
    double v9 = a3;
  }
  [(ARCoachingAnimTime *)time absoluteTime];
  [(ARCoachingAnimTime *)time setAbsoluteTime:v10 + v9];
  [(ARFLSpring *)self->_cubeResolveSpring value];
  double v12 = fmin(fmax(v11, 0.0), 1.0);
  [(ARCoachingAnimTime *)self->_time oscillatingTime];
  *(double *)&int32x2_t v14 = v12 * v13 * 0.05;
  *(float *)v14.i32 = *(double *)v14.i32;
  int32x2_t v67 = v14;
  splineData = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_scaleSpring floatValue];
  [(ARCoachingMetalSplineData *)splineData computeInstanceTransformScale:*(double *)vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(v67, 0)).i64];
  long long v17 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v17, "computeInstanceTransformTranslate:index:", 0);
  long long v18 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_topPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v18, "computeInstanceTransformTranslate:index:", 1);
  long long v19 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v19, "computeInstanceTransformTranslate:index:", 2);
  float64x2_t v20 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v20, "computeInstanceTransformTranslate:index:", 3);
  float64x2_t v21 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v21, "computeInstanceTransformTranslate:index:", 4);
  uint64_t v22 = self->_splineData;
  [(ARCoachingSpringDouble3 *)self->_bottomPlaneTranslationSpring floatValue];
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v22, "computeInstanceTransformTranslate:index:", 5);
  float64x2_t v23 = self->_splineData;
  double v68 = [(ARCoachingMetalSplineData *)v23 shapes];
  long long v65 = [v68 controlPoints];
  double v63 = [v65 objectAtIndexedSubscript:1];
  uint64_t v59 = [v63 controlPoints];
  float32x4_t v62 = [(ARCoachingMetalSplineData *)self->_splineData shapes];
  float32x4_t v61 = [v62 controlPoints];
  float32x4_t v60 = [v61 objectAtIndexedSubscript:1];
  unsigned int v58 = [v60 numControlPoints];
  float64x2_t v24 = [(ARCoachingMetalSplineData *)self->_splineData shapes];
  float64x2_t v25 = [v24 controlPoints];
  float64x2_t v26 = [v25 objectAtIndexedSubscript:0];
  uint64_t v27 = [v26 controlPoints];
  v28 = [(ARCoachingMetalSplineData *)self->_splineData shapes];
  v29 = [v28 controlPoints];
  v30 = [v29 objectAtIndexedSubscript:0];
  uint64_t v31 = [v30 numControlPoints];
  [(ARCoachingAnimTime *)self->_time oscillatingTime];
  *(float *)&double v32 = v32;
  uint64_t v33 = [(ARCoachingMetalSplineData *)v23 shapeBlendWithStart:v59 startCount:v58 end:v27 endCount:v31 t:v32];

  v34 = self->_splineData;
  double v66 = [(ARCoachingMetalSplineData *)v34 shapes];
  uint64_t v64 = [v66 controlPoints];
  id v35 = [v64 objectAtIndexedSubscript:2];
  uint64_t v36 = [v35 controlPoints];
  double v37 = [(ARCoachingMetalSplineData *)self->_splineData shapes];
  double v38 = [v37 controlPoints];
  double v39 = [v38 objectAtIndexedSubscript:2];
  uint64_t v40 = [v39 numControlPoints];
  uint64_t v41 = [v33 controlPoints];
  double v69 = v33;
  uint64_t v42 = [v33 numControlPoints];
  [(ARFLSpring *)self->_cubeResolveSpring value];
  *(float *)&double v43 = v43;
  [(ARCoachingMetalSplineData *)v34 computeShapeBlendWithStart:v36 startCount:v40 end:v41 endCount:v42 t:v43];

  [(ARCoachingGlyphRenderer *)self updateAngularVelocity];
  [(ARCoachingGlyphRenderer *)self computeRotation:a3];
  if (self->_dirty_tesselation_factors)
  {
    [(ARCoachingGlyphRenderer *)self computeTesselationFactorsForCommandBuffer:v70];
    self->_dirty_tesselation_factors = 0;
  }
  [(ARCoachingGlyphRenderer *)self renderPostTessellationInDrawable:v71 withCommandBuffer:v70];
  [(ARFLSpring *)self->_cubeResolveSpring value];
  double v45 = v44;
  [(ARFLSpring *)self->_verticalResolvingSpring value];
  double v46 = 1.0 - v45;
  double v48 = (1.0 - v45) * v47;
  long long v76 = 0uLL;
  uint64_t v77 = 0;
  long long v74 = kARCoachingDeviceRenderParamsHorizontal;
  uint64_t v75 = 3233808384;
  long long v72 = kARCoachingDeviceRenderParamsVertical;
  uint64_t v73 = 3262119936;
  ARCoachingDeviceRenderParamsLerp((uint64_t)&v74, (uint64_t)&v72, (uint64_t)&v76, v48);
  [(ARCoachingAnimTime *)self->_time absoluteTime];
  double v50 = v48 * -0.2 + 0.2 + v49;
  [(ARFLSpring *)self->_planeResolveSpring value];
  double v52 = v46 * v51;
  deviceController = self->_deviceController;
  layer = self->_layer;
  long long v74 = v76;
  uint64_t v75 = v77;
  [(ARCoachingDeviceController *)deviceController update:layer visibility:&v74 layer:v50 renderParams:v52];
  *(void *)&long long v74 = v76;
  DWORD2(v74) = DWORD2(v76);
  float v55 = (v48 * -0.0199 + 0.9999) * *((float *)&v76 + 3);
  parallaxDeviceController = self->_parallaxDeviceController;
  uint64_t v57 = self->_layer;
  *((float *)&v74 + 3) = v55;
  uint64_t v75 = v77;
  [(ARCoachingDeviceController *)parallaxDeviceController update:v57 visibility:&v74 layer:v50 renderParams:v52];
}

- (void)resizeIfNeeded:(id)a3
{
  id v49 = a3;
  long long v4 = [v49 texture];
  double v5 = (double)(unint64_t)[v4 width];
  float64x2_t v6 = [v49 texture];
  double v7 = (double)(unint64_t)[v6 height];

  if (self->_lastDrawableSize.width != v5 || self->_lastDrawableSize.height != v7)
  {
    self->_lastDrawableSize.width = v5;
    self->_lastDrawableSize.height = v7;
    kdebug_trace();
    -[ARCoachingGlyphRenderer generateTexturesWithSize:](self, "generateTexturesWithSize:", v5, v7);
    double v9 = v5 / v7;
    float v10 = v5 / v7;
    *(float *)&double v9 = v10 * -1.5;
    *(float *)&double v11 = v10 * 1.5;
    LODWORD(v12) = -1.5;
    LODWORD(v13) = 1.5;
    LODWORD(v14) = 4.0;
    +[ARCoachingTransformations ortho2d:v9 right:v11 bottom:v12 top:v13 near:0.0 far:v14];
    float32x4_t v45 = v16;
    float32x4_t v47 = v15;
    float32x4_t v41 = v18;
    float32x4_t v43 = v17;
    +[ARCoachingTransformations lookAt:center:up:](ARCoachingTransformations, "lookAt:center:up:", 0.0, 0.0);
    uint64_t v19 = 0;
    long long v50 = v20;
    long long v51 = v21;
    long long v52 = v22;
    long long v53 = v23;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    do
    {
      *(long long *)((char *)&v54 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(long long *)((char *)&v50 + v19))), v45, *(float32x2_t *)((char *)&v50 + v19), 1), v43, *(float32x4_t *)((char *)&v50 + v19), 2), v41, *(float32x4_t *)((char *)&v50 + v19), 3);
      v19 += 16;
    }
    while (v19 != 64);
    HIDWORD(v24) = DWORD1(v54);
    long long v25 = v55;
    long long v26 = v56;
    long long v27 = v57;
    *(_OWORD *)self->_anon_170 = v54;
    *(_OWORD *)&self->_anon_170[16] = v25;
    *(_OWORD *)&self->_anon_170[32] = v26;
    *(_OWORD *)&self->_anon_170[48] = v27;
    LODWORD(v24) = 1118437376;
    LODWORD(v26) = 981668463;
    LODWORD(v27) = 5.0;
    *(float *)&long long v25 = v10;
    +[ARCoachingTransformations perspective_fov:v24 aspect:*(double *)&v25 near:*(double *)&v26 far:*(double *)&v27];
    float32x4_t v46 = v29;
    float32x4_t v48 = v28;
    float32x4_t v42 = v31;
    float32x4_t v44 = v30;
    double v32 = ARCoachingGlyphPerspectiveEye();
    +[ARCoachingTransformations lookAt:v32 center:ARCoachingGlyphPerspectiveCenter() up:0.0078125];
    uint64_t v33 = 0;
    long long v50 = v34;
    long long v51 = v35;
    long long v52 = v36;
    long long v53 = v37;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    do
    {
      *(long long *)((char *)&v54 + v33) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v48, COERCE_FLOAT(*(long long *)((char *)&v50 + v33))), v46, *(float32x2_t *)((char *)&v50 + v33), 1), v44, *(float32x4_t *)((char *)&v50 + v33), 2), v42, *(float32x4_t *)((char *)&v50 + v33), 3);
      v33 += 16;
    }
    while (v33 != 64);
    long long v38 = v55;
    long long v39 = v56;
    long long v40 = v57;
    *(_OWORD *)self->_anon_1b0 = v54;
    *(_OWORD *)&self->_anon_1b0[16] = v38;
    *(_OWORD *)&self->_anon_1b0[32] = v39;
    *(_OWORD *)&self->_anon_1b0[48] = v40;
    self->_dirty_tesselation_factors = 1;
  }
}

- (void)setOrientationAngle:(float)a3
{
}

- (void)resetData
{
  float v3 = [ARCoachingBasicSpring alloc];
  LODWORD(v4) = 1128792064;
  LODWORD(v5) = 22.0;
  float64x2_t v6 = [(ARCoachingBasicSpring *)v3 initWithTension:v4 friction:v5];
  orientationSpring = self->_orientationSpring;
  self->_orientationSpring = v6;

  long long v8 = objc_alloc_init(ARCoachingQuaternionSpring);
  rotationSpring = self->_rotationSpring;
  self->_rotationSpring = v8;

  state = self->_state;
  if (state)
  {
    [(ARCoachingGlyphState *)state computeQuaternionTarget];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  double v11 = self->_rotationSpring;
  v15[0] = v16;
  v15[1] = v17;
  [(ARCoachingQuaternionSpring *)v11 setTarget:v15];
  double v12 = self->_rotationSpring;
  if (v12)
  {
    [(ARCoachingQuaternionSpring *)v12 target];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v13;
  *(_OWORD *)&self->_anon_a0[16] = v14;
}

- (void)restartAnimation
{
  [(ARCoachingGlyphRenderer *)self resetData];
  [(ARCoachingGlyphRenderer *)self resetSprings];

  [(ARCoachingGlyphRenderer *)self resetAnimationTime:0.0];
}

- (void)resetAnimationTime:(double)a3
{
  double v5 = objc_alloc_init(ARCoachingAnimTime);
  time = self->_time;
  self->_time = v5;

  double v7 = self->_time;

  [(ARCoachingAnimTime *)v7 setAbsoluteTime:a3];
}

- (float)rotationAngleY
{
  return self->_rotationAngleY;
}

- (void)setRotationAngleY:(float)a3
{
  self->_rotationAngleY = a3;
}

- (float)a_vel
{
  return self->_a_vel;
}

- (void)setA_vel:(float)a3
{
  self->_a_vel = a3;
}

- (ARCoachingDotsRenderer)dotsRenderer
{
  return self->_dotsRenderer;
}

- (void)setDotsRenderer:(id)a3
{
}

- (MTLComputePipelineState)computePipelineState
{
  return self->_computePipelineState;
}

- (void)setComputePipelineState:(id)a3
{
}

- (MTLRenderPipelineState)postTessellationPipelineState
{
  return self->_postTessellationPipelineState;
}

- (void)setPostTessellationPipelineState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postTessellationPipelineState, 0);
  objc_storeStrong((id *)&self->_computePipelineState, 0);
  objc_storeStrong((id *)&self->_dotsRenderer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_parallaxDeviceController, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_splineData, 0);
  objc_storeStrong((id *)&self->_orientationSpring, 0);
  objc_storeStrong((id *)&self->_alphaSpring, 0);
  objc_storeStrong((id *)&self->_verticalResolvingSpring, 0);
  objc_storeStrong((id *)&self->_planeResolveSpring, 0);
  objc_storeStrong((id *)&self->_cubeResolveSpring, 0);
  objc_storeStrong((id *)&self->_bottomPlaneTranslationSpring, 0);
  objc_storeStrong((id *)&self->_topPlaneTranslationSpring, 0);
  objc_storeStrong((id *)&self->_scaleSpring, 0);
  objc_storeStrong((id *)&self->_rotationSpring, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_msaaTex, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end