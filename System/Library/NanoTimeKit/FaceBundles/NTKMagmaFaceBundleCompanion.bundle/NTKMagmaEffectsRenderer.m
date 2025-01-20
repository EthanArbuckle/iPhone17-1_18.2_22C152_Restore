@interface NTKMagmaEffectsRenderer
- (BOOL)prepareForTime:(double)a3;
- (BOOL)runPhysics;
- (NTKMagmaEffectsRenderer)initWithDevice:(id)a3 library:(id)a4 width:(int)a5 height:(int)a6 screenScale:(float)a7 colorPixelFormat:(unint64_t)a8;
- (NTKMagmaEffectsRendererDelegate)delegate;
- (__n128)backgroundBottomColor;
- (__n128)backgroundTopColor;
- (__n128)logoColor;
- (__n128)timeFillColor;
- (__n128)timeOutlineColor;
- (float)backgroundMultiplier;
- (float)backgroundTextureAlpha;
- (float)distortionMultiplier;
- (float)maskingFraction;
- (float)springDamping;
- (float)springStiffness;
- (float)tritiumFraction;
- (id)_binaryArchives;
- (id)_setupBackgroundRenderPipelineWithBinaryArchives:(id)a3;
- (id)_setupForegroundRenderPipelineWithBinaryArchives:(id)a3;
- (id)_setupPhysicsPipelineWithBinaryArchives:(id)a3;
- (id)dequeueAndPreparePhysicsInputBuffer;
- (id)meshForRect:(CGRect)a3 maxPitch:(double)a4;
- (unint64_t)springsHeight;
- (unint64_t)springsWidth;
- (void)_createBackgroundQuad;
- (void)_createMesh;
- (void)_createMeshBackgroundIndices;
- (void)_createMeshIndicesWithBounds:(id)a3 into:;
- (void)_createMeshVertices;
- (void)_createPhysicsBuffers;
- (void)_loadCollisionTexture;
- (void)_unsafe_updateSimInput;
- (void)applySpringImpulseWithBlock:(id)a3;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)resetSprings;
- (void)setBackgroundBottomColor:(NTKMagmaEffectsRenderer *)self;
- (void)setBackgroundMultiplier:(float)a3;
- (void)setBackgroundTextureAlpha:(float)a3;
- (void)setBackgroundTopColor:(NTKMagmaEffectsRenderer *)self;
- (void)setDelegate:(id)a3;
- (void)setDistortionMultiplier:(float)a3;
- (void)setLogoColor:(NTKMagmaEffectsRenderer *)self;
- (void)setMaskingFraction:(float)a3;
- (void)setRunPhysics:(BOOL)a3;
- (void)setScreenBoundRect:(CGRect)a3;
- (void)setSpringDamping:(float)a3;
- (void)setSpringStiffness:(float)a3;
- (void)setTimeFillColor:(NTKMagmaEffectsRenderer *)self;
- (void)setTimeOutlineColor:(NTKMagmaEffectsRenderer *)self;
- (void)setTritiumFraction:(float)a3;
- (void)updateBackgroundTextureWithImage:(id)a3;
- (void)updateLogoTextureWithImage:(id)a3 origin:(CGPoint)a4;
- (void)updateTimeTextureWithImage:(id)a3 tritiumImage:(id)a4 origin:(CGPoint)a5;
@end

@implementation NTKMagmaEffectsRenderer

- (NTKMagmaEffectsRenderer)initWithDevice:(id)a3 library:(id)a4 width:(int)a5 height:(int)a6 screenScale:(float)a7 colorPixelFormat:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NTKMagmaEffectsRenderer;
  v17 = [(NTKMagmaEffectsRenderer *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_device, a3);
    objc_storeStrong((id *)&v18->_library, a4);
    v18->_width = a5;
    v18->_height = a6;
    v18->_screenScale = a7;
    v18->_pixelFormat = a8;
    v19 = [(NTKMagmaEffectsRenderer *)v18 _binaryArchives];
    uint64_t v20 = [(NTKMagmaEffectsRenderer *)v18 _setupBackgroundRenderPipelineWithBinaryArchives:v19];
    backgroundRenderPipelineState = v18->_backgroundRenderPipelineState;
    v18->_backgroundRenderPipelineState = (MTLRenderPipelineState *)v20;

    uint64_t v22 = [(NTKMagmaEffectsRenderer *)v18 _setupForegroundRenderPipelineWithBinaryArchives:v19];
    foregroundRenderPipelineState = v18->_foregroundRenderPipelineState;
    v18->_foregroundRenderPipelineState = (MTLRenderPipelineState *)v22;

    uint64_t v24 = [(NTKMagmaEffectsRenderer *)v18 _setupPhysicsPipelineWithBinaryArchives:v19];
    computePipelineState = v18->_computePipelineState;
    v18->_computePipelineState = (MTLComputePipelineState *)v24;

    *(_OWORD *)&v18->_distortionMultiplier = xmmword_137C0;
    v18->_inputLock._os_unfair_lock_opaque = 0;
    *(_OWORD *)v18->_fixedBounds = xmmword_137D0;
    v18->_fixedBoundsDirty = 1;
    *(void *)&v18->_meshDim[7] = 0x6400000064;
    [(NTKMagmaEffectsRenderer *)v18 _createPhysicsBuffers];
    [(NTKMagmaEffectsRenderer *)v18 _createMesh];
    [(NTKMagmaEffectsRenderer *)v18 _createBackgroundQuad];
    [(NTKMagmaEffectsRenderer *)v18 _loadCollisionTexture];
  }
  return v18;
}

- (BOOL)prepareForTime:(double)a3
{
  int bufferIndex = self->_bufferIndex;
  BOOL v5 = __OFADD__(bufferIndex++, 1);
  char v6 = (bufferIndex < 0) ^ v5;
  int v7 = bufferIndex & 1;
  if (v6) {
    int v7 = -v7;
  }
  self->_int bufferIndex = v7;
  v8 = [(NTKMagmaEffectsRenderer *)self delegate];
  [v8 magmaRendererPrepareForFrameWithTime:a3];

  return 1;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v4 = a3;
  timeTextureBlock = (void (**)(id, id))self->_timeTextureBlock;
  if (timeTextureBlock)
  {
    timeTextureBlock[2](timeTextureBlock, v4);
    char v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    primaryTexture = self->_primaryTexture;
    self->_primaryTexture = v6;

    id v8 = self->_timeTextureBlock;
    self->_timeTextureBlock = 0;
  }
  tritiumTimeTextureBlock = (void (**)(id, id))self->_tritiumTimeTextureBlock;
  if (tritiumTimeTextureBlock)
  {
    tritiumTimeTextureBlock[2](tritiumTimeTextureBlock, v4);
    v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    tritiumTimeTexture = self->_tritiumTimeTexture;
    self->_tritiumTimeTexture = v10;

    id v12 = self->_tritiumTimeTextureBlock;
    self->_tritiumTimeTextureBlock = 0;
  }
  logoTextureBlock = (void (**)(id, id))self->_logoTextureBlock;
  if (logoTextureBlock)
  {
    logoTextureBlock[2](logoTextureBlock, v4);
    v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    swooshTexture = self->_swooshTexture;
    self->_swooshTexture = v14;

    id v16 = self->_logoTextureBlock;
    self->_logoTextureBlock = 0;
  }
  backgroundTextureBlock = (void (**)(id, id))self->_backgroundTextureBlock;
  if (backgroundTextureBlock)
  {
    backgroundTextureBlock[2](backgroundTextureBlock, v4);
    v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    backgroundTexture = self->_backgroundTexture;
    self->_backgroundTexture = v18;

    id v20 = self->_backgroundTextureBlock;
    self->_backgroundTextureBlock = 0;
  }
  v21 = [(CLKUIMetalResourcePool *)self->_springOffsetTexturePool dequeueReusableResourceForUseOnCommandBuffer:v4];
  springOffsetTexture = self->_springOffsetTexture;
  self->_springOffsetTexture = v21;

  v23 = [(CLKUIMetalResourcePool *)self->_meshOffsetTexturePool dequeueReusableResourceForUseOnCommandBuffer:v4];
  meshOffsetTexture = self->_meshOffsetTexture;
  self->_meshOffsetTexture = v23;

  if (LOBYTE(self->_springStiffness))
  {
    v25 = [v4 computeCommandEncoder];
    os_unfair_lock_lock(&self->_inputLock);
    uint64_t bufferIndex = self->_bufferIndex;
    if ((int)bufferIndex >= -1) {
      int v27 = (bufferIndex + 1) & 1;
    }
    else {
      int v27 = -((bufferIndex + 1) & 1);
    }
    [(NTKMagmaEffectsRenderer *)self _unsafe_updateSimInput];
    [v25 setComputePipelineState:self->_computePipelineState];
    [v25 setBuffer:self->_springBuffers[v27] offset:0 atIndex:0];
    [v25 setBuffer:self->_springBuffers[bufferIndex] offset:0 atIndex:1];
    [v25 setBuffer:self->_simUniforms offset:0 atIndex:3];
    [v25 setBuffer:self->_simInput offset:0 atIndex:2];
    [v25 setTexture:self->_correctionTexture atIndex:4];
    [v25 setTexture:self->_springOffsetTexture atIndex:5];
    unint64_t v28 = (unint64_t)[(MTLComputePipelineState *)self->_computePipelineState threadExecutionWidth];
    unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_computePipelineState maxTotalThreadsPerThreadgroup]/ v28* v28;
    if (v29 >= 0x140) {
      unint64_t v29 = 320;
    }
    id location = (id)(((int)v29 + 319) / v29);
    int64x2_t v43 = vdupq_n_s64(1uLL);
    unint64_t v40 = v29;
    int64x2_t v41 = v43;
    [v25 dispatchThreadgroups:&location threadsPerThreadgroup:&v40];
    v30 = self->_simInput;
    objc_initWeak(&location, self);
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_5D68;
    v37 = &unk_145B0;
    objc_copyWeak(&v39, &location);
    v31 = v30;
    v38 = v31;
    [v4 addCompletedHandler:&v34];
    v32 = [(NTKMagmaEffectsRenderer *)self dequeueAndPreparePhysicsInputBuffer];
    simInput = self->_simInput;
    self->_simInput = v32;

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

    os_unfair_lock_unlock(&self->_inputLock);
    [v25 endEncoding];
  }
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  [v4 setLabel:@"Magma Encoder"];
  long long v34 = 0uLL;
  uint64_t v5 = *(void *)&self->_width;
  v6.i64[0] = (int)v5;
  v6.i64[1] = SHIDWORD(v5);
  float64x2_t v35 = vcvtq_f64_s64(v6);
  long long v36 = xmmword_137E0;
  [v4 setViewport:&v34];
  [v4 setCullMode:0];
  if (LOBYTE(self->_springStiffness)) {
    NTKMagmaGetTuningWithDefault(@"MagmaBackgroundFactor", 0.7);
  }
  long long v36 = 0uLL;
  float64x2_t v7 = *(float64x2_t *)&self->_backgroundBottomColor[8];
  long long v34 = *(_OWORD *)&self->_backgroundTopColor[8];
  float64x2_t v35 = v7;
  *(float *)&long long v36 = self->_tritiumFraction;
  [v4 setRenderPipelineState:self->_backgroundRenderPipelineState];
  [v4 setFragmentBytes:&v34 length:48 atIndex:0];
  [v4 setFragmentTexture:self->_backgroundTexture atIndex:1];
  id v8 = [(NTKMagmaMesh *)self->_backgroundMesh vertices];
  v9 = [v8 vertices];
  [v4 setVertexBuffer:v9 offset:0 atIndex:0];

  v10 = [(NTKMagmaMesh *)self->_backgroundMesh indices];
  uint64_t v11 = (int)[v10 indexCt];
  id v12 = [(NTKMagmaMesh *)self->_backgroundMesh indices];
  v13 = [v12 indices];
  [v4 drawIndexedPrimitives:4 indexCount:v11 indexType:0 indexBuffer:v13 indexBufferOffset:0];

  if (self->_timeMesh)
  {
    if (LOBYTE(self->_springStiffness)) {
      float backgroundTextureAlpha = self->_backgroundTextureAlpha;
    }
    else {
      float backgroundTextureAlpha = 0.0;
    }
    float v15 = (float)self->_width / (float)self->_height;
    float v32 = backgroundTextureAlpha;
    float v33 = v15;
    *(void *)&long long v36 = 0;
    float64x2_t v16 = *(float64x2_t *)&self->_timeOutlineColor[8];
    long long v34 = *(_OWORD *)&self->_timeFillColor[8];
    float64x2_t v35 = v16;
    *((void *)&v36 + 1) = self->_springsWidth;
    [v4 setRenderPipelineState:self->_foregroundRenderPipelineState];
    [v4 setVertexBytes:&v32 length:8 atIndex:1];
    v17 = [(NTKMagmaMesh *)self->_timeMesh vertices];
    v18 = [v17 vertices];
    [v4 setVertexBuffer:v18 offset:0 atIndex:0];

    [v4 setVertexTexture:self->_springOffsetTexture atIndex:2];
    [v4 setFragmentTexture:self->_primaryTexture atIndex:0];
    [v4 setFragmentTexture:self->_tritiumTimeTexture atIndex:1];
    [v4 setFragmentTexture:self->_backgroundTexture atIndex:2];
    [v4 setFragmentBytes:&v34 length:48 atIndex:0];
    v19 = [(NTKMagmaMesh *)self->_timeMesh indices];
    uint64_t v20 = (int)[v19 indexCt];
    v21 = [(NTKMagmaMesh *)self->_timeMesh indices];
    uint64_t v22 = [v21 indices];
    [v4 drawIndexedPrimitives:3 indexCount:v20 indexType:0 indexBuffer:v22 indexBufferOffset:0];
  }
  if (self->_logoMesh)
  {
    if (LOBYTE(self->_springStiffness))
    {
      double v23 = self->_backgroundTextureAlpha;
      float v24 = NTKMagmaGetTuningWithDefault(@"MagmaBackgroundFactor", 0.35) * v23;
    }
    else
    {
      float v24 = 0.0;
    }
    float v25 = (float)self->_width / (float)self->_height;
    float v32 = v24;
    float v33 = v25;
    long long v36 = 0uLL;
    long long v34 = *(_OWORD *)&self->_logoColor[8];
    float64x2_t v35 = 0uLL;
    [v4 setRenderPipelineState:self->_foregroundRenderPipelineState];
    [v4 setVertexBytes:&v32 length:8 atIndex:1];
    v26 = [(NTKMagmaMesh *)self->_logoMesh vertices];
    int v27 = [v26 vertices];
    [v4 setVertexBuffer:v27 offset:0 atIndex:0];

    [v4 setVertexTexture:self->_springOffsetTexture atIndex:2];
    [v4 setFragmentTexture:self->_swooshTexture atIndex:0];
    [v4 setFragmentBytes:&v34 length:48 atIndex:0];
    [v4 setFragmentTexture:self->_backgroundTexture atIndex:2];
    unint64_t v28 = [(NTKMagmaMesh *)self->_logoMesh indices];
    uint64_t v29 = (int)[v28 indexCt];
    v30 = [(NTKMagmaMesh *)self->_logoMesh indices];
    v31 = [v30 indices];
    [v4 drawIndexedPrimitives:3 indexCount:v29 indexType:0 indexBuffer:v31 indexBufferOffset:0];
  }
}

- (id)_binaryArchives
{
  if (_os_feature_enabled_impl())
  {
    v3 = sub_6334();
    id v4 = [v3 URLForResource:@"magma" withExtension:@"metallib"];

    uint64_t v5 = objc_opt_new();
    [v5 setUrl:v4];
    device = self->_device;
    id v11 = 0;
    id v7 = [(MTLDevice *)device newBinaryArchiveWithDescriptor:v5 error:&v11];
    id v8 = v11;
    if (v7)
    {
      id v12 = v7;
      v9 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      v9 = &__NSArray0__struct;
    }
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_setupBackgroundRenderPipelineWithBinaryArchives:(id)a3
{
  library = self->_library;
  id v5 = a3;
  id v6 = [(MTLLibrary *)library newFunctionWithName:@"magmaBackgroundVertexShader"];
  id v7 = [(MTLLibrary *)self->_library newFunctionWithName:@"magmaBackgroundFragmentShader"];
  id v8 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v8 setLabel:@"Magma Background Pipeline"];
  [v8 setVertexFunction:v6];
  [v8 setFragmentFunction:v7];
  [v8 setBinaryArchives:v5];

  v9 = [v8 colorAttachments];
  v10 = [v9 objectAtIndexedSubscript:0];

  [v10 setPixelFormat:self->_pixelFormat];
  [v10 setBlendingEnabled:1];
  [v10 setRgbBlendOperation:0];
  [v10 setAlphaBlendOperation:0];
  [v10 setSourceRGBBlendFactor:1];
  [v10 setSourceAlphaBlendFactor:1];
  [v10 setDestinationRGBBlendFactor:5];
  [v10 setDestinationAlphaBlendFactor:5];
  device = self->_device;
  id v22 = 0;
  id v12 = [(MTLDevice *)device newRenderPipelineStateWithDescriptor:v8 options:4 reflection:0 error:&v22];
  id v13 = v22;
  v14 = v13;
  if (!v12 || v13)
  {
    if (_os_feature_enabled_impl())
    {
      v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_BFB0();
      }
    }
    v18 = self->_device;
    id v21 = v14;
    id v16 = [(MTLDevice *)v18 newRenderPipelineStateWithDescriptor:v8 error:&v21];
    id v15 = v21;

    if (!v16)
    {
      v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_BF3C();
      }

      id v16 = 0;
    }
  }
  else
  {
    id v15 = 0;
    id v16 = v12;
  }

  return v16;
}

- (id)_setupForegroundRenderPipelineWithBinaryArchives:(id)a3
{
  library = self->_library;
  id v5 = a3;
  id v6 = [(MTLLibrary *)library newFunctionWithName:@"magmaVertexShader"];
  id v7 = [(MTLLibrary *)self->_library newFunctionWithName:@"magmaForegroundFragmentShader"];
  id v8 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v8 setLabel:@"Magma Foreground Pipeline"];
  [v8 setVertexFunction:v6];
  [v8 setFragmentFunction:v7];
  [v8 setBinaryArchives:v5];

  v9 = [v8 colorAttachments];
  v10 = [v9 objectAtIndexedSubscript:0];

  [v10 setPixelFormat:self->_pixelFormat];
  [v10 setBlendingEnabled:1];
  [v10 setRgbBlendOperation:0];
  [v10 setAlphaBlendOperation:0];
  [v10 setSourceRGBBlendFactor:1];
  [v10 setSourceAlphaBlendFactor:1];
  [v10 setDestinationRGBBlendFactor:5];
  [v10 setDestinationAlphaBlendFactor:5];
  device = self->_device;
  id v22 = 0;
  id v12 = [(MTLDevice *)device newRenderPipelineStateWithDescriptor:v8 options:4 reflection:0 error:&v22];
  id v13 = v22;
  v14 = v13;
  if (!v12 || v13)
  {
    if (_os_feature_enabled_impl())
    {
      v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_BFB0();
      }
    }
    v18 = self->_device;
    id v21 = v14;
    id v16 = [(MTLDevice *)v18 newRenderPipelineStateWithDescriptor:v8 error:&v21];
    id v15 = v21;

    if (!v16)
    {
      v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_BF3C();
      }

      id v16 = 0;
    }
  }
  else
  {
    id v15 = 0;
    id v16 = v12;
  }

  return v16;
}

- (id)_setupPhysicsPipelineWithBinaryArchives:(id)a3
{
  library = self->_library;
  id v5 = a3;
  id v6 = [(MTLLibrary *)library newFunctionWithName:@"computeSpringPhysics"];
  id v7 = objc_opt_new();
  [v7 setComputeFunction:v6];
  [v7 setBinaryArchives:v5];

  device = self->_device;
  id v20 = 0;
  id v9 = [(MTLDevice *)device newComputePipelineStateWithDescriptor:v7 options:4 reflection:0 error:&v20];
  id v10 = v20;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v16 = 0;
    id v15 = v9;
  }
  else
  {
    id v12 = v10;
    if (_os_feature_enabled_impl())
    {
      id v13 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_BFB0();
      }
    }
    v14 = self->_device;
    id v19 = v12;
    id v15 = [(MTLDevice *)v14 newComputePipelineStateWithDescriptor:v7 options:0 reflection:0 error:&v19];
    id v16 = v19;

    if (!v15)
    {
      v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_C018();
      }

      id v15 = 0;
    }
  }

  return v15;
}

- (void)_createMeshVertices
{
  uint64_t v3 = *(void *)&self->_meshDim[7];
  uint64_t v4 = HIDWORD(v3);
  int v5 = v3;
  uint64_t v6 = (v3 * HIDWORD(v3));
  id v7 = (char *)malloc_type_malloc(24 * (int)v6, 0x10000402C707793uLL);
  id v8 = v7;
  uint64_t v9 = (v4 - 1);
  if ((int)v4 >= 1)
  {
    uint64_t v10 = 0;
    float v11 = (float)(int)v9;
    id v12 = v7;
    do
    {
      if (v5 >= 1)
      {
        uint64_t v13 = 0;
        int v14 = 0;
        do
        {
          *(float *)&uint64_t v16 = (float)v14 / (float)(v5 - 1);
          *(float *)&uint64_t v17 = *(float *)&v16 + -0.5 + *(float *)&v16 + -0.5;
          float v15 = ((float)((float)(int)v10 / v11) + -0.5) * -2.0;
          *((float *)&v17 + 1) = v15;
          v18 = &v12[v13];
          *((_WORD *)v18 + 9) = v10;
          *((_WORD *)v18 + 8) = v14;
          if (v10) {
            BOOL v19 = v13 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          BOOL v20 = v19 || 24 * (v5 - 1) == v13;
          *(void *)v18 = v17;
          *((float *)&v16 + 1) = (float)(int)v10 / v11;
          *((void *)v18 + 1) = v16;
          char v22 = v20 || v10 == v9;
          v18[20] = v22;
          ++v14;
          v13 += 24;
        }
        while (24 * v5 != v13);
      }
      ++v10;
      v12 += 24 * v5;
    }
    while (v10 != v4);
  }
  double v23 = (NTKMagmaMeshVertices *)objc_opt_new();
  meshVertices = self->_meshVertices;
  self->_meshVertices = v23;

  id v25 = [(MTLDevice *)self->_device newBufferWithBytes:v8 length:24 * (int)v6 options:1];
  [(NTKMagmaMeshVertices *)self->_meshVertices setVertices:v25];

  [(NTKMagmaMeshVertices *)self->_meshVertices setVertexCount:v6];

  free(v8);
}

- (void)_createMeshBackgroundIndices
{
  int v3 = (6 * *(void *)&self->_meshDim[7] - 6) * (HIDWORD(*(void *)&self->_meshDim[7]) - 1);
  uint64_t v4 = (NTKMagmaMeshIndices *)objc_opt_new();
  meshBackgroundIndices = self->_meshBackgroundIndices;
  self->_meshBackgroundIndices = v4;

  id v6 = [(MTLDevice *)self->_device newBufferWithLength:2 * v3 options:1];
  [(NTKMagmaMeshIndices *)self->_meshBackgroundIndices setIndices:v6];

  id v7 = self->_meshBackgroundIndices;

  [(NTKMagmaEffectsRenderer *)self _createMeshIndicesWithBounds:v7 into:0.0];
}

- (void)_createMesh
{
  [(NTKMagmaEffectsRenderer *)self _createMeshVertices];
  [(NTKMagmaEffectsRenderer *)self _createMeshBackgroundIndices];
  uint64_t v3 = 2 * ((6 * *(void *)&self->_meshDim[7] - 6) * (HIDWORD(*(void *)&self->_meshDim[7]) - 1));
  uint64_t v4 = +[CLKUIMetalResourcePool bufferPoolWithLength:v3 andOptions:1 expectedCountPerFrame:1];
  foregroundIndicesBufferPool = self->_foregroundIndicesBufferPool;
  self->_foregroundIndicesBufferPool = v4;

  id v6 = (NTKMagmaMeshIndices *)objc_opt_new();
  meshForegroundIndices = self->_meshForegroundIndices;
  self->_meshForegroundIndices = v6;

  id v8 = [(MTLDevice *)self->_device newBufferWithLength:v3 options:32];
  [(NTKMagmaMeshIndices *)self->_meshForegroundIndices setIndices:v8];

  [(NTKMagmaMeshIndices *)self->_meshForegroundIndices setIndexCt:0];
  id v11 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:65 width:*(void *)&self->_meshDim[7] height:HIDWORD(*(void *)&self->_meshDim[7]) mipmapped:0];
  [v11 setUsage:3];
  [v11 setStorageMode:2];
  uint64_t v9 = +[CLKUIMetalResourcePool texturePoolWithDescriptor:v11 expectedCountPerFrame:1];
  meshOffsetTexturePool = self->_meshOffsetTexturePool;
  self->_meshOffsetTexturePool = v9;
}

- (void)_createMeshIndicesWithBounds:(id)a3 into:
{
  int8x16_t v24 = v3;
  id v26 = a3;
  int v23 = *(void *)&self->_meshDim[7];
  float32x2_t v5 = vcvt_f32_s32(vadd_s32(*(int32x2_t *)&self->_meshDim[7], (int32x2_t)-1));
  float32x2_t v6 = vrndm_f32(vmul_f32(*(float32x2_t *)v24.i8, v5));
  int32x2_t v25 = (int32x2_t)vcvt_u32_f32((float32x2_t)vbic_s8((int8x8_t)v6, (int8x8_t)vcltz_f32(v6)));
  float32x2_t v7 = vrndp_f32(vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL), v5));
  int32x2_t v8 = (int32x2_t)vcvt_u32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v5, v7), (int8x8_t)v7, (int8x8_t)v5));
  int32x2_t v9 = vsub_s32(v8, v25);
  uint64_t v10 = v9.u32[0];
  __int32 v11 = v9.i32[1];
  uint64_t v12 = (6 * v9.i32[0] * v9.i32[1]);
  id v13 = [v26 indices];
  int v14 = [v13 contents];

  [v26 setIndexCt:v12];
  int32x2_t v15 = vceq_s32(v8, v25);
  if ((v15.i8[4] & 1) == 0)
  {
    int v16 = 0;
    int v17 = 0;
    __int16 v18 = v25.i16[0] + v25.i16[2] * v23;
    __int16 v19 = v25.i16[0] + v23 + v25.i16[2] * v23;
    do
    {
      if ((v15.i8[0] & 1) == 0)
      {
        uint64_t v20 = 0;
        int v21 = v16;
        do
        {
          v14[v21] = v18 + v20;
          __int16 v22 = v18 + v20 + 1;
          v14[v21 + 1] = v22;
          v14[v21 + 2] = v19 + v20;
          v14[v21 + 3] = v19 + v20;
          v14[v21 + 4] = v22;
          v14[v21 + 5] = v19 + v20++ + 1;
          v21 += 6;
        }
        while (v10 != v20);
      }
      ++v17;
      v16 += 6 * v10;
      v18 += v23;
      v19 += v23;
    }
    while (v17 != v11);
  }
}

- (void)_createBackgroundQuad
{
  v14[0] = xmmword_13830;
  v14[1] = unk_13840;
  uint64_t v13 = 0x3000200010000;
  int8x16_t v3 = (NTKMagmaMesh *)objc_opt_new();
  uint64_t v4 = objc_opt_new();
  [(NTKMagmaMesh *)v3 setVertices:v4];

  float32x2_t v5 = objc_opt_new();
  [(NTKMagmaMesh *)v3 setIndices:v5];

  id v6 = [(MTLDevice *)self->_device newBufferWithBytes:v14 length:32 options:1];
  float32x2_t v7 = [(NTKMagmaMesh *)v3 vertices];
  [v7 setVertices:v6];

  int32x2_t v8 = [(NTKMagmaMesh *)v3 vertices];
  [v8 setVertexCount:4];

  id v9 = [(MTLDevice *)self->_device newBufferWithBytes:&v13 length:8 options:1];
  uint64_t v10 = [(NTKMagmaMesh *)v3 indices];
  [v10 setIndices:v9];

  __int32 v11 = [(NTKMagmaMesh *)v3 indices];
  [v11 setIndexCt:4];

  backgroundMesh = self->_backgroundMesh;
  self->_backgroundMesh = v3;
}

- (void)_loadCollisionTexture
{
  int8x16_t v3 = +[NSString stringWithFormat:@"correctionMap-%ih", self->_height];
  uint64_t v4 = sub_6334();
  float32x2_t v5 = [v4 pathForResource:v3 ofType:@"blob"];

  id v33 = 0;
  id v6 = +[NSData dataWithContentsOfFile:v5 options:1 error:&v33];
  id v7 = v33;
  int32x2_t v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Loading Magma collision blob \"%@\"...", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_C150();
    }
  }
  else if (v6)
  {
    int width = self->_width;
    int height = self->_height;
    id v19 = v6;
    if ([v19 bytes])
    {
      id v20 = (id)(8 * height * (uint64_t)width);
      if ([v19 length] == v20)
      {
        uint64_t v10 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:110 width:self->_width height:self->_height mipmapped:0];
        int v21 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v10];
        correctionTexture = self->_correctionTexture;
        self->_correctionTexture = v21;

        int v23 = self->_correctionTexture;
        memset(v30, 0, sizeof(v30));
        uint64_t v24 = *(void *)&self->_width;
        *(void *)&long long v25 = (int)v24;
        *((void *)&v25 + 1) = SHIDWORD(v24);
        long long v31 = v25;
        uint64_t v32 = 1;
        int32x2_t v15 = [v19 bytes];
        uint64_t v16 = 8 * self->_width;
        int v14 = v30;
        uint64_t v13 = v23;
        goto LABEL_7;
      }
      id v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        unsigned int v26 = [v19 length];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v3;
        __int16 v35 = 1024;
        int v36 = (int)v20;
        __int16 v37 = 1024;
        unsigned int v38 = v26;
        _os_log_fault_impl(&dword_0, v9, OS_LOG_TYPE_FAULT, "Magma Collision Texture Inconsistency: Magma collision texture (%@) is not expected size (%i expected, %i actual)", buf, 0x18u);
      }
    }
    else
    {
      id v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_C0E8();
      }
    }
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_C080();
    }
  }

  uint64_t v10 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:110 width:1 height:1 mipmapped:0];
  __int32 v11 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v10];
  uint64_t v12 = self->_correctionTexture;
  self->_correctionTexture = v11;

  *(void *)buf = 0;
  uint64_t v13 = self->_correctionTexture;
  memset(v27, 0, sizeof(v27));
  int64x2_t v28 = vdupq_n_s64(1uLL);
  uint64_t v29 = 1;
  int v14 = v27;
  int32x2_t v15 = buf;
  uint64_t v16 = 8;
LABEL_7:
  [(MTLTexture *)v13 replaceRegion:v14 mipmapLevel:0 withBytes:v15 bytesPerRow:v16];
}

- (void)_createPhysicsBuffers
{
  uint64_t v3 = 0;
  springBuffers = self->_springBuffers;
  char v5 = 1;
  do
  {
    char v6 = v5;
    id v7 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:7680 options:1];
    int32x2_t v8 = springBuffers[v3];
    springBuffers[v3] = v7;

    id v9 = (float32x2_t *)[(MTLBuffer *)springBuffers[v3] contents];
    int32x2_t v10 = 0;
    __int32 v11 = v9 + 1;
    do
    {
      v12.i32[0] = vand_s8((int8x8_t)v10, (int8x8_t)0xF0000000FLL).u32[0];
      v12.i32[1] = vshr_n_u32((uint32x2_t)vdup_lane_s32(v10, 0), 4uLL).i32[1];
      float32x2_t v13 = vdiv_f32(vcvt_f32_s32(v12), (float32x2_t)0x4198000041700000);
      v11[-1] = v13;
      *__int32 v11 = v13;
      ++*(void *)&v10;
      v11 += 3;
    }
    while (*(void *)&v10 != 320);
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  int v14 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:65 width:16 height:20 mipmapped:0];
  [v14 setUsage:3];
  [v14 setStorageMode:32];
  int32x2_t v15 = +[CLKUIMetalResourcePool texturePoolWithDescriptor:v14 expectedCountPerFrame:1];
  springOffsetTexturePool = self->_springOffsetTexturePool;
  self->_springOffsetTexturePool = v15;

  v27[0] = 1015580809;
  *(float *)&v27[1] = (float)self->_height / (float)self->_width;
  int v17 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:v27 length:8 options:1];
  simUniforms = self->_simUniforms;
  self->_simUniforms = v17;

  uint64_t v19 = *(void *)&self->_meshDim[7];
  v26[1] = WORD2(v19);
  v26[0] = v19;
  id v20 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:v26 length:4 options:1];
  interpolationUniforms = self->_interpolationUniforms;
  self->_interpolationUniforms = v20;

  __int16 v22 = +[CLKUIMetalResourcePool bufferPoolWithLength:2608 andOptions:1 expectedCountPerFrame:2];
  inputBufferPool = self->_inputBufferPool;
  self->_inputBufferPool = v22;

  uint64_t v24 = [(NTKMagmaEffectsRenderer *)self dequeueAndPreparePhysicsInputBuffer];
  simInput = self->_simInput;
  self->_simInput = v24;
}

- (id)dequeueAndPreparePhysicsInputBuffer
{
  id v2 = [(CLKUIMetalResourcePool *)self->_inputBufferPool dequeueReusableResource];
  uint64_t v3 = [v2 contents];
  v3[2560] = 0;
  bzero(v3, 0xA00uLL);

  return v2;
}

- (void)updateTimeTextureWithImage:(id)a3 tritiumImage:(id)a4 origin:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_7748;
  v14[3] = &unk_145D8;
  v14[4] = self;
  id v11 = v9;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  CGFloat v17 = x;
  CGFloat v18 = y;
  float32x2_t v13 = objc_retainBlock(v14);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v13[2])(v13);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (void)updateLogoTextureWithImage:(id)a3 origin:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  int32x2_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_78DC;
  id v11 = &unk_14600;
  id v12 = self;
  id v6 = a3;
  id v13 = v6;
  CGFloat v14 = x;
  CGFloat v15 = y;
  id v7 = objc_retainBlock(&v8);
  if (+[NSThread isMainThread]) {
    ((void (*)(void ***))v7[2])(v7);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)updateBackgroundTextureWithImage:(id)a3
{
  char v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_7A3C;
  int32x2_t v8 = &unk_14628;
  uint64_t v9 = self;
  id v3 = a3;
  id v10 = v3;
  uint64_t v4 = objc_retainBlock(&v5);
  if (+[NSThread isMainThread]) {
    ((void (*)(void ***))v4[2])(v4);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (id)meshForRect:(CGRect)a3 maxPitch:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = (ceil(a3.size.width / a4) + 1.0);
  unsigned int v10 = (ceil(a3.size.height / a4) + 1.0);
  uint64_t v11 = v9 * v10;
  id v12 = (char *)malloc_type_malloc(24 * (int)v11, 0x10000402C707793uLL);
  id v13 = v12;
  if (v10)
  {
    int v14 = 0;
    int v15 = 0;
    unsigned int v16 = v9 - 1;
    int v17 = v10 - 1;
    __asm { FMOV            V3.2D, #-0.5 }
    do
    {
      if (v9)
      {
        uint64_t v23 = 0;
        float v24 = (float)v15 / (float)(v10 - 1);
        float v25 = y + v24 * height;
        float v26 = 1.0 - v24;
        do
        {
          v27.f32[0] = (float)(int)v23 / (float)(v9 - 1);
          v28.f32[0] = x + v27.f32[0] * width;
          v28.f32[1] = v25;
          v27.f32[1] = v26;
          uint64_t v29 = (float32x2_t *)&v12[24 * (v14 + v23)];
          *uint64_t v29 = vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(vdiv_f32(vmul_n_f32(v28, self->_screenScale), vcvt_f32_s32(*(int32x2_t *)&self->_width))), _Q3), (float64x2_t)xmmword_137F0));
          v29[1] = v27;
          v29[2].i8[4] = 0;
          ++v23;
        }
        while (v9 != v23);
      }
      ++v15;
      v14 += v9;
    }
    while (v15 != v10);
  }
  else
  {
    unsigned int v16 = v9 - 1;
    int v17 = -1;
  }
  uint64_t v30 = 6 * v16 * v17;
  long long v31 = malloc_type_malloc(2 * v30, 0x1000040BDFB0063uLL);
  uint64_t v32 = v31;
  if (v17)
  {
    int v33 = 0;
    do
    {
      if (v16)
      {
        uint64_t v34 = 0;
        int v35 = v33 * v9;
        int v36 = v33 + 1;
        int v37 = (v33 + 1) * v9;
        int v38 = 6 * v16 * v33;
        do
        {
          *((_WORD *)v31 + v38 + (int)v34) = v35++;
          *((_WORD *)v31 + v38 + (int)v34 + 1) = v35;
          *((_WORD *)v31 + v38 + (int)v34 + 2) = v37;
          *((_WORD *)v31 + v38 + (int)v34 + 3) = v37;
          *((_WORD *)v31 + v38 + (int)v34 + 4) = v35;
          *((_WORD *)v31 + v38 + (int)v34 + 5) = ++v37;
          v34 += 6;
        }
        while (6 * v16 != v34);
      }
      else
      {
        int v36 = v33 + 1;
      }
      int v33 = v36;
    }
    while (v36 != v17);
  }
  id v39 = objc_opt_new();
  unint64_t v40 = objc_opt_new();
  [v39 setVertices:v40];

  id v41 = [(MTLDevice *)self->_device newBufferWithBytes:v13 length:24 * (int)v11 options:1];
  v42 = [v39 vertices];
  [v42 setVertices:v41];

  int64x2_t v43 = [v39 vertices];
  [v43 setVertexCount:v11];

  v44 = objc_opt_new();
  [v39 setIndices:v44];

  id v45 = [(MTLDevice *)self->_device newBufferWithBytes:v32 length:2 * v30 options:1];
  v46 = [v39 indices];
  [v46 setIndices:v45];

  v47 = [v39 indices];
  [v47 setIndexCt:v30];

  free(v13);
  free(v32);

  return v39;
}

- (void)resetSprings
{
  p_inputLock = &self->_inputLock;
  os_unfair_lock_lock(&self->_inputLock);
  uint64_t v4 = [(MTLBuffer *)self->_simInput contents];
  v4[2560] = 1;
  bzero(v4, 0xA00uLL);

  os_unfair_lock_unlock(p_inputLock);
}

- (void)applySpringImpulseWithBlock:(id)a3
{
  unsigned int v10 = (double (**)(__n128, double, double))a3;
  os_unfair_lock_lock(&self->_inputLock);
  uint64_t v4 = (float32x2_t *)[(MTLBuffer *)self->_simInput contents];
  int32x2_t v6 = 0;
  do
  {
    v5.n128_u32[0] = vand_s8((int8x8_t)v6, (int8x8_t)0xF0000000FLL).u32[0];
    v5.n128_u32[1] = vshr_n_u32((uint32x2_t)vdup_lane_s32(v6, 0), 4uLL).u32[1];
    float32x2_t v7 = vdiv_f32(vcvt_f32_u32((uint32x2_t)v5.n128_u64[0]), (float32x2_t)0x4198000041700000);
    p_screenScale = &self->_screenScale;
    float32x2_t v9 = vld1_dup_f32(p_screenScale);
    v4[*(void *)&v6] = vadd_f32(COERCE_FLOAT32X2_T(v10[2](v5, *(double *)&v7, COERCE_DOUBLE(vdiv_f32(vmul_f32(v7, vcvt_f32_s32(*(int32x2_t *)&self->_width)), v9)))), v4[*(void *)&v6]);
    ++*(void *)&v6;
  }
  while (*(void *)&v6 != 320);
  os_unfair_lock_unlock(&self->_inputLock);
}

- (void)_unsafe_updateSimInput
{
  id v3 = (float *)[(MTLBuffer *)self->_simInput contents];
  float TuningWithDefault = NTKMagmaGetTuningWithDefault(@"MagmaStiffness", 50.0);
  v3[641] = TuningWithDefault;
  v3[642] = sqrtf(TuningWithDefault);
  float v5 = NTKMagmaGetTuningWithDefault(@"MagmaDamping", 0.283);
  v3[643] = v5;
  float v6 = NTKMagmaGetTuningWithDefault(@"MagmaRestorative", 10.0);
  v3[644] = v6;
  *((_OWORD *)v3 + 162) = *(_OWORD *)self->_fixedBounds;
}

- (void)setScreenBoundRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  p_inputLock = &self->_inputLock;
  os_unfair_lock_lock(&self->_inputLock);
  v7.f64[0] = x;
  v8.f64[0] = width + x;
  uint64_t v9 = *(void *)&self->_width;
  v10.i64[0] = (int)v9;
  v10.i64[1] = SHIDWORD(v9);
  float64x2_t v11 = vcvtq_f64_s64(v10);
  v8.f64[1] = height + y;
  v7.f64[1] = y;
  *(float32x4_t *)self->_fixedBounds = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vdivq_f64(v7, v11), self->_screenScale)), vmulq_n_f64(vdivq_f64(v8, v11), self->_screenScale));
  self->_fixedBoundsDirtdouble y = 1;

  os_unfair_lock_unlock(p_inputLock);
}

- (float)springDamping
{
  return self->_distortionMultiplier;
}

- (void)setSpringDamping:(float)a3
{
  self->_distortionMultiplier = a3;
}

- (float)springStiffness
{
  return self->_backgroundMultiplier;
}

- (void)setSpringStiffness:(float)a3
{
  self->_backgroundMultiplier = a3;
}

- (BOOL)runPhysics
{
  return LOBYTE(self->_springStiffness);
}

- (void)setRunPhysics:(BOOL)a3
{
  LOBYTE(self->_springStiffness) = a3;
}

- (float)distortionMultiplier
{
  return self->_backgroundTextureAlpha;
}

- (void)setDistortionMultiplier:(float)a3
{
  self->_float backgroundTextureAlpha = a3;
}

- (float)backgroundMultiplier
{
  return self->_maskingFraction;
}

- (void)setBackgroundMultiplier:(float)a3
{
  self->_maskingFraction = a3;
}

- (__n128)timeFillColor
{
  return a1[25];
}

- (void)setTimeFillColor:(NTKMagmaEffectsRenderer *)self
{
  *(_OWORD *)&self->_timeFillColor[8] = v2;
}

- (__n128)timeOutlineColor
{
  return a1[26];
}

- (void)setTimeOutlineColor:(NTKMagmaEffectsRenderer *)self
{
  *(_OWORD *)&self->_timeOutlineColor[8] = v2;
}

- (__n128)logoColor
{
  return a1[27];
}

- (void)setLogoColor:(NTKMagmaEffectsRenderer *)self
{
  *(_OWORD *)&self->_logoColor[8] = v2;
}

- (__n128)backgroundTopColor
{
  return a1[28];
}

- (void)setBackgroundTopColor:(NTKMagmaEffectsRenderer *)self
{
  *(_OWORD *)&self->_backgroundTopColor[8] = v2;
}

- (__n128)backgroundBottomColor
{
  return a1[29];
}

- (void)setBackgroundBottomColor:(NTKMagmaEffectsRenderer *)self
{
  *(_OWORD *)&self->_backgroundBottomColor[8] = v2;
}

- (float)backgroundTextureAlpha
{
  return self->_tritiumFraction;
}

- (void)setBackgroundTextureAlpha:(float)a3
{
  self->_tritiumFraction = a3;
}

- (float)maskingFraction
{
  return *(float *)&self->_springsWidth;
}

- (void)setMaskingFraction:(float)a3
{
  *(float *)&self->_springsWidth = a3;
}

- (float)tritiumFraction
{
  return *((float *)&self->_springsWidth + 1);
}

- (void)setTritiumFraction:(float)a3
{
  *((float *)&self->_springsWidth + 1) = a3;
}

- (unint64_t)springsWidth
{
  return self->_springsHeight;
}

- (unint64_t)springsHeight
{
  return (unint64_t)self->_delegate;
}

- (NTKMagmaEffectsRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_anon_188);

  return (NTKMagmaEffectsRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self->_anon_188);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_springBuffers[i + 1], 0);
  objc_storeStrong((id *)&self->_interpolationUniforms, 0);
  objc_storeStrong((id *)&self->_simUniforms, 0);
  objc_storeStrong((id *)&self->_simInput, 0);
  objc_storeStrong((id *)&self->_meshOffsetTexture, 0);
  objc_storeStrong((id *)&self->_springOffsetTexture, 0);
  objc_storeStrong((id *)&self->_meshOffsetTexturePool, 0);
  objc_storeStrong((id *)&self->_springOffsetTexturePool, 0);
  objc_storeStrong((id *)&self->_correctionTexture, 0);
  objc_storeStrong((id *)&self->_swooshTexture, 0);
  objc_storeStrong((id *)&self->_backgroundTexture, 0);
  objc_storeStrong((id *)&self->_tritiumTimeTexture, 0);
  objc_storeStrong((id *)&self->_primaryTexture, 0);
  objc_storeStrong((id *)&self->_backgroundMesh, 0);
  objc_storeStrong((id *)&self->_logoMesh, 0);
  objc_storeStrong((id *)&self->_timeMesh, 0);
  objc_storeStrong(&self->_backgroundTextureBlock, 0);
  objc_storeStrong(&self->_logoTextureBlock, 0);
  objc_storeStrong(&self->_tritiumTimeTextureBlock, 0);
  objc_storeStrong(&self->_timeTextureBlock, 0);
  objc_storeStrong((id *)&self->_secondarySnapshotTexturePool, 0);
  objc_storeStrong((id *)&self->_primarySnapshotTexturePool, 0);
  objc_storeStrong((id *)&self->_foregroundIndicesBufferPool, 0);
  objc_storeStrong((id *)&self->_inputBufferPool, 0);
  objc_storeStrong((id *)&self->_meshForegroundIndices, 0);
  objc_storeStrong((id *)&self->_meshBackgroundIndices, 0);
  objc_storeStrong((id *)&self->_meshVertices, 0);
  objc_storeStrong((id *)&self->_computePipelineState, 0);
  objc_storeStrong((id *)&self->_foregroundRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_backgroundRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end