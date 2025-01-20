@interface AAUIMetalBadgeRenderer
+ (double)screenScaleMaximum;
+ (double)screenScaleMultiple;
- (AAUIBadgeModelConfiguration)configuration;
- (AAUIMetalBadgeRenderer)initWithCAMetalLayer:(id)a3 useEarnedShader:(BOOL)a4;
- (BOOL)isPaused;
- (UIImage)backTextureImage;
- (id)snapshot;
- (id)stateUpdateBlock;
- (void)_cleanupConfiguration;
- (void)_drawBadgeFrameCallback;
- (void)_drawBadgeModel:(id)a3 intoRenderEncoder:(id)a4 withBackTexture:(BOOL)a5;
- (void)_drawFrameWithDrawable:(id)a3;
- (void)_drawIntoRenderEncoder:(id)a3;
- (void)_loadBadgeModelWithConfiguration:(id)a3;
- (void)_setupAttributes;
- (void)_setupCommonBindingsForRenderEncoder:(id)a3 pipelineState:(id)a4 verticesBuffer:(id)a5;
- (void)_setupRenderPipeline;
- (void)_setupTextures;
- (void)_updateModelTransformForBadge:(id)a3;
- (void)cleanupAfterSnapshot;
- (void)dealloc;
- (void)resizeBadgeForCurrentViewSize;
- (void)setBackTextureImage:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStateUpdateBlock:(id)a3;
- (void)snapshot;
@end

@implementation AAUIMetalBadgeRenderer

- (void)setConfiguration:(id)a3
{
  v5 = (AAUIBadgeModelConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    [(AAUIMetalBadgeRenderer *)self _loadBadgeModelWithConfiguration:self->_configuration];
    v5 = v6;
  }
}

- (void)setPaused:(BOOL)a3
{
  displayLink = self->_displayLink;
  if (a3)
  {
    [(CADisplayLink *)displayLink setPaused:1];
    [(CADisplayLink *)self->_displayLink invalidate];
    v5 = self->_displayLink;
    self->_displayLink = 0;
  }
  else
  {
    if (displayLink) {
      return;
    }
    v10 = [[AAUIMetalBadgeRendererDisplayLinkTarget alloc] _initWithTarget:self];
    v6 = [MEMORY[0x263F15780] displayLinkWithTarget:v10 selector:sel__drawBadgeFrameCallback];
    v7 = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x263EFF588]];

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
    [(CADisplayLink *)self->_displayLink setPaused:0];
    v5 = v10;
  }
}

- (BOOL)isPaused
{
  return self->_displayLink == 0;
}

- (void)setStateUpdateBlock:(id)a3
{
}

- (AAUIMetalBadgeRenderer)initWithCAMetalLayer:(id)a3 useEarnedShader:(BOOL)a4
{
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAUIMetalBadgeRenderer;
  v8 = [(AAUIMetalBadgeRenderer *)&v25 init];
  v9 = v8;
  if (v8)
  {
    v8->_useEarnedShader = a4;
    uint64_t v10 = +[AAUICommandQueueTransaction sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v10;

    objc_storeStrong((id *)&v9->_metalLayer, a3);
    [(CAMetalLayer *)v9->_metalLayer setDevice:v9->_device];
    [(CAMetalLayer *)v9->_metalLayer setPixelFormat:80];
    [(CAMetalLayer *)v9->_metalLayer setFramebufferOnly:1];
    [(CAMetalLayer *)v9->_metalLayer setFenceEnabled:1];
    [(CAMetalLayer *)v9->_metalLayer setPresentsWithTransaction:0];
    [(CAMetalLayer *)v9->_metalLayer setDrawsAsynchronously:1];
    [(CAMetalLayer *)v9->_metalLayer setOpaque:0];
    [(id)objc_opt_class() screenScaleMultiple];
    double v13 = v12;
    [(id)objc_opt_class() screenScaleMaximum];
    double v15 = v14;
    v16 = [MEMORY[0x263F82B60] mainScreen];
    [v16 scale];
    double v18 = v13 * v17;

    if (v18 >= v15) {
      double v19 = v15;
    }
    else {
      double v19 = v18;
    }
    float v20 = v19;
    v9->_rasterScaleFactor = v20;
    v21 = objc_alloc_init(AAUICommandQueueTransaction);
    transaction = v9->_transaction;
    v9->_transaction = v21;

    [(AAUIMetalBadgeRenderer *)v9 resizeBadgeForCurrentViewSize];
    [(AAUIMetalBadgeRenderer *)v9 _setupAttributes];
    [(AAUIMetalBadgeRenderer *)v9 _setupTextures];
    [(AAUIMetalBadgeRenderer *)v9 _setupRenderPipeline];
    displayLink = v9->_displayLink;
    v9->_displayLink = 0;
  }
  return v9;
}

- (void)resizeBadgeForCurrentViewSize
{
  [(CAMetalLayer *)self->_metalLayer bounds];
  double rasterScaleFactor = self->_rasterScaleFactor;
  unsigned int v6 = vcvtpd_u64_f64(v3 * rasterScaleFactor);
  unsigned int v7 = vcvtpd_u64_f64(v4 * rasterScaleFactor);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    double v9 = v3;
    double v10 = v4;
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", (double)v6, (double)v7);
    if (*(void *)self->_attachmentRasterSize != v6
      || HIDWORD(*(void *)self->_attachmentRasterSize) != v7)
    {
      *(void *)self->_attachmentRasterSize = __PAIR64__(v7, v6);
      if (v10 == 0.0) {
        float v12 = 1.0;
      }
      else {
        float v12 = v9 / v10;
      }
      if (v9 == 0.0)
      {
        float v14 = -25.0;
      }
      else
      {
        float v13 = v10 / v9;
        float v14 = v13 * -25.0;
      }
      uint64_t v15 = 0;
      v16.i32[1] = 0;
      v16.i64[1] = 0;
      v16.f32[0] = 6.3138 / v12;
      *(void *)&long long v17 = 0;
      *((void *)&v17 + 1) = __PAIR64__(1.0, LODWORD(v14));
      v31[0] = xmmword_2292CEC60;
      v31[1] = xmmword_2292CEC70;
      v31[2] = xmmword_2292CECA0;
      v31[3] = v17;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      do
      {
        *(long long *)((char *)&v32 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(v31[v15])), (float32x4_t)xmmword_2292CECB0, *(float32x2_t *)&v31[v15], 1), (float32x4_t)xmmword_2292CECC0, (float32x4_t)v31[v15], 2), (float32x4_t)xmmword_2292CECD0, (float32x4_t)v31[v15], 3);
        ++v15;
      }
      while (v15 != 4);
      long long v18 = v33;
      long long v19 = v34;
      long long v20 = v35;
      *(_OWORD *)self->_anon_60 = v32;
      *(_OWORD *)&self->_anon_60[16] = v18;
      *(_OWORD *)&self->_anon_60[32] = v19;
      *(_OWORD *)&self->_anon_60[48] = v20;
      id v30 = objc_alloc_init(MEMORY[0x263F12A50]);
      [v30 setWidth:*(void *)self->_attachmentRasterSize];
      [v30 setHeight:*(unsigned int *)&self->_attachmentRasterSize[4]];
      [v30 setMipmapLevelCount:1];
      [v30 setUsage:4];
      [v30 setStorageMode:3];
      [v30 setTextureType:4];
      [v30 setSampleCount:4];
      [v30 setPixelFormat:252];
      v21 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v30];
      depthAttachmentMSAA = self->_depthAttachmentMSAA;
      self->_depthAttachmentMSAA = v21;

      objc_msgSend(v30, "setPixelFormat:", -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"));
      v23 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v30];
      colorAttachmentMSAA = self->_colorAttachmentMSAA;
      self->_colorAttachmentMSAA = v23;

      objc_super v25 = [MEMORY[0x263F129A0] renderPassDescriptor];
      renderPassDesc = self->_renderPassDesc;
      self->_renderPassDesc = v25;

      v27 = [(MTLRenderPassDescriptor *)self->_renderPassDesc colorAttachments];
      v28 = [v27 objectAtIndexedSubscript:0];

      [v28 setLoadAction:2];
      [v28 setStoreAction:2];
      objc_msgSend(v28, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      [v28 setTexture:self->_colorAttachmentMSAA];
      v29 = [(MTLRenderPassDescriptor *)self->_renderPassDesc depthAttachment];
      [v29 setLoadAction:2];
      [v29 setStoreAction:0];
      [v29 setTexture:self->_depthAttachmentMSAA];
      [v29 setResolveTexture:0];
    }
  }
}

- (void)_setupTextures
{
  v29[3] = *MEMORY[0x263EF8340];
  if (self->_useEarnedShader)
  {
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v22 URLForResource:@"cubes_combined" withExtension:@"png"];
    long long v20 = [v22 URLForResource:@"flecks" withExtension:@"png"];
    double v3 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:self->_device];
    uint64_t v5 = *MEMORY[0x263F12D48];
    v27[0] = *MEMORY[0x263F12D40];
    uint64_t v4 = v27[0];
    v27[1] = v5;
    uint64_t v6 = *MEMORY[0x263F12D68];
    v29[0] = MEMORY[0x263EFFA88];
    v29[1] = v6;
    uint64_t v28 = *MEMORY[0x263F12D50];
    uint64_t v7 = v28;
    uint64_t v8 = MEMORY[0x263EFFA80];
    v29[2] = MEMORY[0x263EFFA80];
    double v9 = [NSDictionary dictionaryWithObjects:v29 forKeys:v27 count:3];
    id v24 = 0;
    double v10 = (MTLTexture *)[v3 newTextureWithContentsOfURL:v20 options:v9 error:&v24];
    id v11 = v24;
    fleckNormalTexture = self->_fleckNormalTexture;
    self->_fleckNormalTexture = v10;

    uint64_t v13 = *MEMORY[0x263F12D30];
    v25[0] = *MEMORY[0x263F12D38];
    v25[1] = v4;
    v26[0] = v13;
    v26[1] = v8;
    v25[2] = v7;
    v25[3] = v5;
    v26[2] = v8;
    v26[3] = v6;
    float v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

    id v23 = v11;
    uint64_t v15 = (MTLTexture *)[v3 newTextureWithContentsOfURL:v21 options:v14 error:&v23];
    id v16 = v23;

    environmentTexture = self->_environmentTexture;
    self->_environmentTexture = v15;
  }
  else
  {
    long long v18 = self->_fleckNormalTexture;
    self->_fleckNormalTexture = 0;

    long long v19 = self->_environmentTexture;
    self->_environmentTexture = 0;
  }
}

- (void)_setupRenderPipeline
{
  double v3 = objc_opt_new();
  [v3 setDepthCompareFunction:1];
  [v3 setDepthWriteEnabled:1];
  v71 = v3;
  uint64_t v4 = (MTLDepthStencilState *)[(MTLDevice *)self->_device newDepthStencilStateWithDescriptor:v3];
  depthStencilState = self->_depthStencilState;
  self->_depthStencilState = v4;

  id v6 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v6 setLabel:@"Metal Badge Pipeline"];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  device = self->_device;
  v76[1] = 0;
  v70 = (void *)v7;
  double v9 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:");
  id v10 = 0;
  id v11 = objc_alloc_init(MEMORY[0x263F12A80]);
  float v12 = [v11 attributes];
  uint64_t v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setFormat:30];

  float v14 = [v11 attributes];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setOffset:0];

  id v16 = [v11 attributes];
  long long v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setBufferIndex:5];

  long long v18 = [v11 attributes];
  long long v19 = [v18 objectAtIndexedSubscript:2];
  [v19 setFormat:30];

  long long v20 = [v11 attributes];
  v21 = [v20 objectAtIndexedSubscript:2];
  [v21 setOffset:12];

  v22 = [v11 attributes];
  id v23 = [v22 objectAtIndexedSubscript:2];
  [v23 setBufferIndex:5];

  id v24 = [v11 attributes];
  objc_super v25 = [v24 objectAtIndexedSubscript:1];
  [v25 setFormat:29];

  v26 = [v11 attributes];
  v27 = [v26 objectAtIndexedSubscript:1];
  [v27 setOffset:24];

  uint64_t v28 = [v11 attributes];
  v29 = [v28 objectAtIndexedSubscript:1];
  [v29 setBufferIndex:5];

  id v30 = [v11 layouts];
  v31 = [v30 objectAtIndexedSubscript:5];
  [v31 setStride:32];

  long long v32 = [v11 layouts];
  long long v33 = [v32 objectAtIndexedSubscript:5];
  [v33 setStepRate:1];

  long long v34 = [v11 layouts];
  long long v35 = [v34 objectAtIndexedSubscript:5];
  [v35 setStepFunction:1];

  [v6 setVertexDescriptor:v11];
  MTLPixelFormat v36 = [(CAMetalLayer *)self->_metalLayer pixelFormat];
  v37 = [v6 colorAttachments];
  v38 = [v37 objectAtIndexedSubscript:0];
  [v38 setPixelFormat:v36];

  [v6 setDepthAttachmentPixelFormat:252];
  [v6 setRasterSampleCount:4];
  v69 = v9;
  if (self->_useEarnedShader)
  {
    uint64_t v39 = [v9 newFunctionWithName:@"earnedBadgeVertexShader"];
    uint64_t v40 = [v9 newFunctionWithName:@"earnedBadgeFragmentShader"];
    v41 = (void *)[v9 newFunctionWithName:@"earnedBadgeFaceFragmentShader"];
    v42 = (void *)[v9 newFunctionWithName:@"earnedBadgeFaceInlayFragmentShader"];
    v43 = (void *)[v9 newFunctionWithName:@"earnedBadgeFaceTriColorFragmentShader"];
    v44 = v9;
    uint64_t v45 = v40;
    v46 = (void *)[v44 newFunctionWithName:@"earnedBadgeFaceInlayTriColorFragmentShader"];
  }
  else
  {
    uint64_t v39 = [v9 newFunctionWithName:@"unearnedBadgeVertexShader"];
    uint64_t v45 = [v9 newFunctionWithName:@"unearnedBadgeFragmentShader"];
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v46 = 0;
  }
  v68 = (void *)v39;
  [v6 setVertexFunction:v39];
  v67 = (void *)v45;
  [v6 setFragmentFunction:v45];
  v47 = self->_device;
  v76[0] = v10;
  v48 = (MTLRenderPipelineState *)[(MTLDevice *)v47 newRenderPipelineStateWithDescriptor:v6 error:v76];
  id v49 = v76[0];

  shaderRenderPipeline = self->_shaderRenderPipeline;
  self->_shaderRenderPipeline = v48;

  if (v41)
  {
    [v6 setFragmentFunction:v41];
    v51 = self->_device;
    id v75 = v49;
    v52 = (MTLRenderPipelineState *)[(MTLDevice *)v51 newRenderPipelineStateWithDescriptor:v6 error:&v75];
    id v53 = v75;

    shaderFaceRenderPipeline = self->_shaderFaceRenderPipeline;
    self->_shaderFaceRenderPipeline = v52;

    id v49 = v53;
  }
  if (v42)
  {
    [v6 setFragmentFunction:v42];
    v55 = self->_device;
    id v74 = v49;
    v56 = (MTLRenderPipelineState *)[(MTLDevice *)v55 newRenderPipelineStateWithDescriptor:v6 error:&v74];
    id v57 = v74;

    shaderFaceInlayRenderPipeline = self->_shaderFaceInlayRenderPipeline;
    self->_shaderFaceInlayRenderPipeline = v56;

    id v49 = v57;
  }
  if (v43)
  {
    [v6 setFragmentFunction:v43];
    v59 = self->_device;
    id v73 = v49;
    v60 = (MTLRenderPipelineState *)[(MTLDevice *)v59 newRenderPipelineStateWithDescriptor:v6 error:&v73];
    id v61 = v73;

    shaderFaceTriColorRenderPipeline = self->_shaderFaceTriColorRenderPipeline;
    self->_shaderFaceTriColorRenderPipeline = v60;

    id v49 = v61;
  }
  if (v46)
  {
    [v6 setFragmentFunction:v46];
    v63 = self->_device;
    id v72 = v49;
    v64 = (MTLRenderPipelineState *)[(MTLDevice *)v63 newRenderPipelineStateWithDescriptor:v6 error:&v72];
    id v65 = v72;

    shaderFaceInlayTriColorsPipeline = self->_shaderFaceInlayTriColorsPipeline;
    self->_shaderFaceInlayTriColorsPipeline = v64;

    id v49 = v65;
  }
}

- (void)_setupAttributes
{
  if (self->_useEarnedShader)
  {
    *(double *)v3.i64 = _matrix4x4_rotation(-1.4137, (float32x4_t)xmmword_2292CEC60);
    float32x4_t v17 = v4;
    float32x4_t v18 = v3;
    float32x4_t v15 = v6;
    float32x4_t v16 = v5;
    *(double *)&long long v7 = _matrix4x4_rotation(-3.1416, (float32x4_t)xmmword_2292CEC70);
    uint64_t v8 = 0;
    v19[0] = v7;
    v19[1] = v9;
    v19[2] = v10;
    v19[3] = v11;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    do
    {
      *(long long *)((char *)&v20 + v8 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(v19[v8])), v17, *(float32x2_t *)&v19[v8], 1), v16, (float32x4_t)v19[v8], 2), v15, (float32x4_t)v19[v8], 3);
      ++v8;
    }
    while (v8 != 4);
    long long v12 = v21;
    long long v13 = v22;
    long long v14 = v23;
    *(_OWORD *)self->_anon_e0 = v20;
    *(_OWORD *)&self->_anon_e0[16] = v12;
    *(_OWORD *)&self->_anon_e0[32] = v13;
    *(_OWORD *)&self->_anon_e0[48] = v14;
    *(_OWORD *)self->_cameraPosition = xmmword_2292CEC80;
  }
}

+ (double)screenScaleMultiple
{
  return 2.0;
}

+ (double)screenScaleMaximum
{
  return 4.0;
}

- (id)snapshot
{
  uint64_t v2 = *(void *)self->_attachmentRasterSize;
  size_t v3 = v2;
  size_t v4 = HIDWORD(v2);
  if (v2) {
    BOOL v5 = HIDWORD(v2) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    float32x4_t v6 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F12A50]);
    [v8 setTextureType:2];
    [v8 setPixelFormat:80];
    [v8 setWidth:v3];
    [v8 setHeight:v4];
    [v8 setMipmapLevelCount:1];
    [v8 setUsage:4];
    [v8 setStorageMode:0];
    long long v9 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v8];
    long long v10 = [(MTLRenderPassDescriptor *)self->_renderPassDesc colorAttachments];
    long long v11 = [v10 objectAtIndexedSubscript:0];
    [v11 setResolveTexture:v9];

    [(AAUIMetalBadgeRenderer *)self _drawFrameWithDrawable:0];
    size_t v12 = 4 * v3;
    long long v13 = malloc_type_malloc(v12 * v4, 0x92439D30uLL);
    memset(v22, 0, 24);
    v22[3] = v3;
    v22[4] = v4;
    v22[5] = 1;
    [v9 getBytes:v13 bytesPerRow:v12 fromRegion:v22 mipmapLevel:0];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    float32x4_t v15 = CGDataProviderCreateWithData(0, v13, v12 * v4, (CGDataProviderReleaseDataCallback)freeData);
    CGImageRef v16 = CGImageCreate(v3, v4, 8uLL, 0x20uLL, v12, DeviceRGB, 0x2002u, v15, 0, 0, kCGRenderingIntentDefault);
    if (v16)
    {
      float32x4_t v17 = v16;
      float32x4_t v18 = (void *)MEMORY[0x263F827E8];
      long long v19 = [MEMORY[0x263F82B60] mainScreen];
      [v19 scale];
      float32x4_t v6 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, 0);

      CGImageRelease(v17);
    }
    else
    {
      long long v20 = ACHLogDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AAUIMetalBadgeRenderer snapshot](v20);
      }

      float32x4_t v6 = 0;
    }
    CGDataProviderRelease(v15);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v6;
}

- (void)cleanupAfterSnapshot
{
  [(AAUIMetalBadgeRenderer *)self _cleanupConfiguration];
  colorTexture = self->_colorTexture;
  self->_colorTexture = 0;

  id v5 = [(MTLRenderPassDescriptor *)self->_renderPassDesc colorAttachments];
  size_t v4 = [v5 objectAtIndexedSubscript:0];
  [v4 setResolveTexture:0];
}

- (void)_updateModelTransformForBadge:(id)a3
{
  id v37 = a3;
  uint64_t v4 = 0;
  long long v40 = xmmword_2292CECA0;
  long long v41 = xmmword_2292CECE0;
  float32x4_t v42 = 0u;
  float32x4_t v43 = 0u;
  float32x4_t v44 = 0u;
  float32x4_t v45 = 0u;
  long long v38 = xmmword_2292CEC60;
  long long v39 = xmmword_2292CEC70;
  do
  {
    *(float32x4_t *)((char *)&v42 + v4) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2292CECF0, COERCE_FLOAT(*(long long *)((char *)&v38 + v4))), (float32x4_t)xmmword_2292CED00, *(float32x2_t *)((char *)&v38 + v4), 1), (float32x4_t)xmmword_2292CED10, *(float32x4_t *)((char *)&v38 + v4), 2), (float32x4_t)xmmword_2292CEC90, *(float32x4_t *)((char *)&v38 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  float32x4_t v35 = v43;
  float32x4_t v36 = v42;
  float32x4_t v33 = v45;
  float32x4_t v34 = v44;
  [v37 rotationY];
  *(float *)&double v5 = v5;
  *(double *)&long long v6 = _matrix4x4_rotation(*(float *)&v5, (float32x4_t)xmmword_2292CEC70);
  long long v31 = v7;
  long long v32 = v6;
  long long v29 = v9;
  long long v30 = v8;
  [v37 rotationX];
  *(float *)&double v10 = v10;
  *(double *)&long long v11 = _matrix4x4_rotation(*(float *)&v10, (float32x4_t)xmmword_2292CEC60);
  uint64_t v15 = 0;
  long long v38 = v32;
  long long v39 = v31;
  long long v40 = v30;
  long long v41 = v29;
  float32x4_t v42 = 0u;
  float32x4_t v43 = 0u;
  float32x4_t v44 = 0u;
  float32x4_t v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v15) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(long long *)((char *)&v38 + v15))), v35, *(float32x2_t *)((char *)&v38 + v15), 1), v34, *(float32x4_t *)((char *)&v38 + v15), 2), v33, *(float32x4_t *)((char *)&v38 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  uint64_t v16 = 0;
  float32x4_t v17 = v42;
  float32x4_t v18 = v43;
  float32x4_t v19 = v44;
  float32x4_t v20 = v45;
  long long v38 = v11;
  long long v39 = v12;
  long long v40 = v13;
  long long v41 = v14;
  float32x4_t v42 = 0u;
  float32x4_t v43 = 0u;
  float32x4_t v44 = 0u;
  float32x4_t v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(long long *)((char *)&v38 + v16))), v18, *(float32x2_t *)((char *)&v38 + v16), 1), v19, *(float32x4_t *)((char *)&v38 + v16), 2), v20, *(float32x4_t *)((char *)&v38 + v16), 3);
    v16 += 16;
  }
  while (v16 != 64);
  uint64_t v21 = 0;
  float32x4_t v22 = v42;
  float32x4_t v23 = v43;
  float32x4_t v24 = v44;
  float32x4_t v25 = v45;
  long long v38 = xmmword_2292CEC60;
  long long v39 = xmmword_2292CEC70;
  long long v40 = xmmword_2292CECA0;
  long long v41 = xmmword_2292CED20;
  float32x4_t v42 = 0u;
  float32x4_t v43 = 0u;
  float32x4_t v44 = 0u;
  float32x4_t v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(long long *)((char *)&v38 + v21))), v23, *(float32x2_t *)((char *)&v38 + v21), 1), v24, *(float32x4_t *)((char *)&v38 + v21), 2), v25, *(float32x4_t *)((char *)&v38 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  float32x4_t v26 = v43;
  float32x4_t v27 = v44;
  float32x4_t v28 = v45;
  *(float32x4_t *)self->_anon_a0 = v42;
  *(float32x4_t *)&self->_anon_a0[16] = v26;
  *(float32x4_t *)&self->_anon_a0[32] = v27;
  *(float32x4_t *)&self->_anon_a0[48] = v28;
}

- (void)_loadBadgeModelWithConfiguration:(id)a3
{
  v91[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 badgeTexturePaths];

  if (!v5)
  {
    float32x4_t v23 = ACHLogDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:](v4);
    }
    goto LABEL_50;
  }
  long long v6 = [v4 badgeModelPaths];

  if (v6)
  {
    long long v7 = [v4 metalColor];
    *(__n128 *)self->_anon_130 = AAUIColorVectorFromColor(v7);

    unsigned __int8 v8 = [v4 useFullColorEnamel];
    self->_anon_130[90] = v8;
    if ((v8 & 1) == 0)
    {
      long long v9 = [v4 modelEnamelColor];
      *(__n128 *)&self->_anon_130[16] = AAUIColorVectorFromColor(v9);
    }
    double v10 = [v4 enamelTriColors];
    long long v11 = v10;
    if (v10)
    {
      long long v12 = [v10 objectAtIndexedSubscript:0];
      *(__n128 *)&self->_anon_130[32] = AAUIColorVectorFromColor(v12);

      long long v13 = [v11 objectAtIndexedSubscript:1];
      *(__n128 *)&self->_anon_130[48] = AAUIColorVectorFromColor(v13);

      long long v14 = [v11 objectAtIndexedSubscript:2];
      *(__n128 *)&self->_anon_130[64] = AAUIColorVectorFromColor(v14);
    }
    if (!self->_useEarnedShader)
    {
      self->_anon_130[88] = [v4 unearnedUsesTwoToneEnamel];
      self->_anon_130[89] = v8;
      *(_DWORD *)&self->_anon_130[80] = 0;
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:self->_device];
    uint64_t v16 = *MEMORY[0x263F12D50];
    v90[0] = *MEMORY[0x263F12D40];
    v90[1] = v16;
    v91[0] = MEMORY[0x263EFFA88];
    v91[1] = MEMORY[0x263EFFA80];
    v80 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
    float32x4_t v17 = [v4 badgeTexturePaths];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x263F827E8]);
      float32x4_t v20 = [v4 badgeTexturePaths];
      uint64_t v21 = [v20 objectAtIndexedSubscript:0];
      float32x4_t v22 = (void *)[v19 initWithContentsOfFile:v21];
    }
    else
    {
      float32x4_t v22 = 0;
    }
    float32x4_t v24 = [v4 badgeTexturePaths];
    unint64_t v25 = [v24 count];

    v77 = v11;
    if (v25 >= 2)
    {
      float32x4_t v26 = [v4 badgeTexturePaths];
      unint64_t v27 = [v26 count];

      if (v27 >= 2)
      {
        unint64_t v28 = 1;
        do
        {
          long long v29 = [v4 badgeTexturePaths];
          long long v30 = [v29 objectAtIndexedSubscript:v28];

          long long v31 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithContentsOfFile:v30];
          if (v31)
          {
            [v22 size];
            double width = v92.width;
            double height = v92.height;
            UIGraphicsBeginImageContext(v92);
            objc_msgSend(v22, "drawInRect:", 0.0, 0.0, width, height);
            objc_msgSend(v31, "drawInRect:blendMode:alpha:", 2, 0.0, 0.0, width, height, 1.0);
            uint64_t v34 = UIGraphicsGetImageFromCurrentImageContext();

            UIGraphicsEndImageContext();
            float32x4_t v22 = (void *)v34;
          }

          ++v28;
          float32x4_t v35 = [v4 badgeTexturePaths];
          unint64_t v36 = [v35 count];
        }
        while (v36 > v28);
      }
    }
    self->_anon_130[92] = [v4 faceHasMetalInlay];
    v79 = v22;
    if (v22)
    {
      id v37 = [v4 glyphTexturePath];

      if (v37)
      {
        self->_anon_130[91] = 1;
        long long v38 = NSURL;
        long long v39 = [v4 glyphTexturePath];
        [v38 fileURLWithPath:v39];
        v41 = long long v40 = v22;

        id v42 = objc_alloc(MEMORY[0x263F827E8]);
        float32x4_t v43 = [v41 path];
        float32x4_t v44 = (void *)[v42 initWithContentsOfFile:v43];

        [v40 size];
        double v47 = v45;
        double v48 = v46;
        if (v44)
        {
          UIGraphicsBeginImageContext(*(CGSize *)&v45);
          CurrentContext = UIGraphicsGetCurrentContext();
          id v50 = [MEMORY[0x263F825C8] blueColor];
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v50 CGColor]);

          v94.origin.x = 0.0;
          v94.origin.y = 0.0;
          v94.size.double width = v47;
          v94.size.double height = v48;
          CGContextFillRect(CurrentContext, v94);
          objc_msgSend(v44, "drawInRect:blendMode:alpha:", 1, 0.0, 0.0, v47, v48, 1.0);
          v51 = UIGraphicsGetImageFromCurrentImageContext();

          UIGraphicsEndImageContext();
        }
        else
        {
          v54 = ACHLogDefault();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:]((uint64_t)v41, v54);
          }

          v51 = 0;
        }
        v93.double width = v47;
        v93.double height = v48;
        UIGraphicsBeginImageContext(v93);
        objc_msgSend(v79, "drawInRect:", 0.0, 0.0, v47, v48);
        if (v51)
        {
          [v4 glyphPositionOffset];
          double v56 = v55;
          double v58 = v57;
          [v4 glyphTextureScale];
          objc_msgSend(v51, "drawInRect:blendMode:alpha:", 2, v56, v58, v47 * v59, v48 * v59, 1.0);
        }
        v60 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        id v61 = v60;
        id v86 = 0;
        v62 = (MTLTexture *)objc_msgSend(v15, "newTextureWithCGImage:options:error:", objc_msgSend(v61, "CGImage"), v80, &v86);
        id v52 = v86;
        colorTexture = self->_colorTexture;
        self->_colorTexture = v62;
      }
      else
      {
        self->_anon_130[91] = 0;
        id v85 = 0;
        id v53 = (MTLTexture *)objc_msgSend(v15, "newTextureWithCGImage:options:error:", objc_msgSend(v22, "CGImage"), v80, &v85);
        id v52 = v85;
        long long v41 = self->_colorTexture;
        self->_colorTexture = v53;
      }
    }
    else
    {
      id v52 = 0;
    }
    v76 = v15;
    if (!self->_colorTexture)
    {
      v64 = ACHLogDefault();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
        -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:](v4);
      }
    }
    v78 = self;
    [(AAUIMetalBadgeRenderer *)self _cleanupConfiguration];
    id v65 = [v4 badgeModelPaths];
    v66 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v67 = v65;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v81 objects:v89 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v82 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          id v73 = [[AAUIBadgeModel alloc] initWithPath:v72];
          if ([(AAUIBadgeModel *)v73 groupCount])
          {
            [(NSArray *)v66 addObject:v73];
          }
          else
          {
            id v74 = ACHLogUI();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v88 = v72;
              _os_log_impl(&dword_229290000, v74, OS_LOG_TYPE_DEFAULT, "Failed to load ‘%@’ from path", buf, 0xCu);
            }
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v81 objects:v89 count:16];
      }
      while (v69);
    }

    badgeModels = v78->_badgeModels;
    v78->_badgeModels = v66;

    float32x4_t v23 = v77;
LABEL_50:
  }
}

- (void)_cleanupConfiguration
{
  self->_badgeModels = 0;
  MEMORY[0x270F9A758]();
}

- (void)_drawFrameWithDrawable:(id)a3
{
  id v4 = a3;
  double v5 = [(AAUIMetalBadgeRenderer *)self stateUpdateBlock];
  long long v6 = v5[2]();
  [(AAUIMetalBadgeRenderer *)self _updateModelTransformForBadge:v6];
  long long v7 = [(AAUICommandQueueTransaction *)self->_transaction commandQueue];
  unsigned __int8 v8 = [v7 commandBuffer];

  [v8 setLabel:@"Activity Badge Command Buffer"];
  long long v9 = [v8 renderCommandEncoderWithDescriptor:self->_renderPassDesc];
  [v9 setLabel:@"Activity Badge Render Encoder"];
  [(AAUIMetalBadgeRenderer *)self _drawIntoRenderEncoder:v9];
  [v9 endEncoding];
  if (v4)
  {
    [v8 presentDrawable:v4];
    [v8 commit];
  }
  else
  {
    [v8 commit];
    [v8 waitUntilCompleted];
  }
  double v10 = [v8 error];

  if (v10)
  {
    long long v11 = ACHLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAUIMetalBadgeRenderer _drawFrameWithDrawable:](v8, v11);
    }
  }
}

- (id)stateUpdateBlock
{
  return self->_stateUpdateBlock;
}

- (void)_drawIntoRenderEncoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = self->_badgeModels;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AAUIMetalBadgeRenderer _drawBadgeModel:intoRenderEncoder:withBackTexture:](self, "_drawBadgeModel:intoRenderEncoder:withBackTexture:", *(void *)(*((void *)&v11 + 1) + 8 * v10), v4, v9 & 1, (void)v11);
        char v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      char v9 = 0;
    }
    while (v7);
  }
}

- (void)_drawBadgeModel:(id)a3 intoRenderEncoder:(id)a4 withBackTexture:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  size_t v10 = 32 * (int)[v8 vertexCount];
  id v11 = (id) [(MTLDevice *)self->_device newBufferWithLength:v10 options:0];
  memcpy((void *)[v11 contents], (const void *)objc_msgSend(v8, "vertices"), v10);
  size_t v12 = 4 * (int)[v8 indexCount];
  id v13 = (id) [(MTLDevice *)self->_device newBufferWithLength:v12 options:0];
  uint64_t v14 = [v13 contents];
  uint64_t v15 = (const void *)[v8 indices];
  uint64_t v16 = (void *)v14;
  float32x4_t v17 = v13;
  memcpy(v16, v15, v12);
  if ((int)[v8 groupCount] >= 1)
  {
    uint64_t v18 = 0;
    int v19 = 0;
    p_shaderFaceInlayTriColorsPipeline = &self->_shaderFaceInlayTriColorsPipeline;
    uint64_t v20 = 432;
    if (v5) {
      uint64_t v20 = 424;
    }
    double v46 = (Class *)((char *)&self->super.isa + v20);
    float32x4_t v44 = v17;
    id v45 = v11;
    do
    {
      long long v21 = *(_OWORD *)&self->_anon_130[48];
      v47[2] = *(_OWORD *)&self->_anon_130[32];
      v47[3] = v21;
      long long v22 = *(_OWORD *)&self->_anon_130[80];
      v47[4] = *(_OWORD *)&self->_anon_130[64];
      long long v48 = v22;
      long long v23 = *(_OWORD *)&self->_anon_130[16];
      v47[0] = *(_OWORD *)self->_anon_130;
      v47[1] = v23;
      float32x4_t v24 = self->_shaderRenderPipeline;
      int v25 = *(_DWORD *)([v8 materials] + 4 * v18);
      if (v25)
      {
        if (v25 == 1)
        {
          LODWORD(v26) = 0;
          p_colorTexture = &self->_colorTexture;
        }
        else
        {
          LODWORD(v26) = 1.0;
          p_colorTexture = v46;
          if (v25 != 2)
          {
            -[AAUIMetalBadgeRenderer _setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:](self, "_setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:", v9, v24, v11, v26);
LABEL_13:
            unint64_t v28 = 0;
            LODWORD(v48) = 0;
            goto LABEL_27;
          }
        }
        LODWORD(v48) = LODWORD(v26);
        DWORD1(v48) = LODWORD(v26);
        unint64_t v28 = *p_colorTexture;
      }
      else
      {
        *(void *)&long long v48 = 1065353216;
        long long v29 = self->_colorTexture;
        unint64_t v28 = v29;
        if (self->_useEarnedShader && v29)
        {
          long long v30 = [(AAUIMetalBadgeRenderer *)self configuration];
          if ([v30 faceHasMetalInlay])
          {
            id v42 = [(AAUIMetalBadgeRenderer *)self configuration];
            long long v31 = [v42 enamelTriColors];
            uint64_t v41 = [v31 count];

            p_shaderFaceInlayRenderPipeline = p_shaderFaceInlayTriColorsPipeline;
            if (!v41) {
              goto LABEL_20;
            }
          }
          else
          {

LABEL_20:
            float32x4_t v33 = [(AAUIMetalBadgeRenderer *)self configuration];
            char v34 = [v33 faceHasMetalInlay];

            p_shaderFaceInlayRenderPipeline = &self->_shaderFaceInlayRenderPipeline;
            if ((v34 & 1) == 0)
            {
              float32x4_t v35 = [(AAUIMetalBadgeRenderer *)self configuration];
              unint64_t v36 = [v35 enamelTriColors];
              uint64_t v43 = [v36 count];

              uint64_t v37 = 80;
              if (!v43) {
                uint64_t v37 = 56;
              }
              p_shaderFaceInlayRenderPipeline = (Class *)((char *)&self->super.isa + v37);
            }
          }
          long long v38 = *p_shaderFaceInlayRenderPipeline;

          long long v39 = self->_fleckNormalTexture;
          id v11 = v45;
          [(AAUIMetalBadgeRenderer *)self _setupCommonBindingsForRenderEncoder:v9 pipelineState:v38 verticesBuffer:v45];
          [v9 setFragmentTexture:v28 atIndex:1];
          if (v39)
          {
            [v9 setFragmentTexture:v39 atIndex:2];
          }
          float32x4_t v24 = v38;
          float32x4_t v17 = v44;
          goto LABEL_27;
        }
      }
      -[AAUIMetalBadgeRenderer _setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:](self, "_setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:", v9, v24, v11, p_shaderFaceInlayTriColorsPipeline);
      if (!v28) {
        goto LABEL_13;
      }
      [v9 setFragmentTexture:v28 atIndex:1];
LABEL_27:
      objc_msgSend(v9, "setFragmentBytes:length:atIndex:", v47, 96, 4, p_shaderFaceInlayTriColorsPipeline);
      objc_msgSend(v9, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 3 * *(int *)(objc_msgSend(v8, "groups") + 4 * v18), 1, v17, 4 * v19);
      v19 += 3 * *(_DWORD *)([v8 groups] + 4 * v18);

      ++v18;
    }
    while (v18 < (int)[v8 groupCount]);
  }
}

- (void)_setupCommonBindingsForRenderEncoder:(id)a3 pipelineState:(id)a4 verticesBuffer:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  [v9 setRenderPipelineState:a4];
  [v9 setDepthStencilState:self->_depthStencilState];
  [v9 setCullMode:1];
  [v9 setVertexBuffer:v8 offset:0 atIndex:5];

  [v9 setVertexBytes:self->_anon_60 length:64 atIndex:0];
  [v9 setVertexBytes:self->_anon_a0 length:64 atIndex:1];
  if (self->_useEarnedShader)
  {
    [v9 setVertexBytes:self->_anon_e0 length:64 atIndex:2];
    [v9 setVertexBytes:self->_cameraPosition length:16 atIndex:3];
    [v9 setFragmentTexture:self->_environmentTexture atIndex:0];
  }
}

- (void)dealloc
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    id v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  [(AAUIMetalBadgeRenderer *)self _cleanupConfiguration];
  transaction = self->_transaction;
  self->_transaction = 0;

  v6.receiver = self;
  v6.super_class = (Class)AAUIMetalBadgeRenderer;
  [(AAUIMetalBadgeRenderer *)&v6 dealloc];
}

- (void)setBackTextureImage:(id)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  BOOL v5 = (UIImage *)a3;
  if (self->_backTextureImage != v5)
  {
    objc_storeStrong((id *)&self->_backTextureImage, a3);
    if (self->_backTextureImage)
    {
      objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:self->_device];
      uint64_t v7 = *MEMORY[0x263F12D48];
      v25[0] = *MEMORY[0x263F12D40];
      v25[1] = v7;
      uint64_t v8 = *MEMORY[0x263F12D78];
      v26[0] = MEMORY[0x263EFFA88];
      v26[1] = v8;
      v25[2] = *MEMORY[0x263F12D50];
      v26[2] = MEMORY[0x263EFFA80];
      id v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      size_t v10 = [(UIImage *)self->_backTextureImage CGImage];
      id v24 = 0;
      id v11 = (MTLTexture *)[v6 newTextureWithCGImage:v10 options:v9 error:&v24];
      id v12 = v24;
      backTexture = self->_backTexture;
      self->_backTexture = v11;

      if ([(NSArray *)self->_badgeModels count] >= 2)
      {
        [(UIImage *)self->_backTextureImage size];
        UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        [(UIImage *)self->_backTextureImage size];
        CGFloat v16 = v15;
        [(UIImage *)self->_backTextureImage size];
        v28.size.double height = v17;
        v28.origin.x = 0.0;
        v28.origin.y = 0.0;
        v28.size.double width = v16;
        CGContextClearRect(CurrentContext, v28);
        UIGraphicsGetImageFromCurrentImageContext();
        id v18 = objc_claimAutoreleasedReturnValue();
        id v23 = v12;
        int v19 = (MTLTexture *)objc_msgSend(v6, "newTextureWithCGImage:options:error:", objc_msgSend(v18, "CGImage"), v9, &v23);
        id v20 = v23;

        emptyBackTexture = self->_emptyBackTexture;
        self->_emptyBackTexture = v19;

        UIGraphicsEndImageContext();
        id v12 = v20;
      }
    }
    else
    {
      long long v22 = self->_backTexture;
      self->_backTexture = 0;
    }
  }
}

- (void)_drawBadgeFrameCallback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "AAUIMetalBadgeRenderer: skipping render because no drawable available", v1, 2u);
}

- (AAUIBadgeModelConfiguration)configuration
{
  return self->_configuration;
}

- (UIImage)backTextureImage
{
  return self->_backTextureImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backTextureImage, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_depthAttachmentMSAA, 0);
  objc_storeStrong((id *)&self->_colorAttachmentMSAA, 0);
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);
  objc_storeStrong((id *)&self->_emptyBackTexture, 0);
  objc_storeStrong((id *)&self->_backTexture, 0);
  objc_storeStrong((id *)&self->_environmentTexture, 0);
  objc_storeStrong((id *)&self->_fleckNormalTexture, 0);
  objc_storeStrong((id *)&self->_badgeModels, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_shaderFaceTriColorRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceInlayRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceInlayTriColorsPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderRenderPipeline, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

- (void)_loadBadgeModelWithConfiguration:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 badgeModelPaths];
  id v9 = [a1 shapeName];
  OUTLINED_FUNCTION_0(&dword_229290000, v3, v4, "Failed to load badge texture path for configuration badgeModelPath:%{public}@ shapeName:%{public}@", v5, v6, v7, v8, 2u);
}

- (void)_loadBadgeModelWithConfiguration:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 badgeTexturePaths];
  OUTLINED_FUNCTION_0(&dword_229290000, v2, v3, "Failed to load color texture image from URL:%{public}@ error:%{public}@", v4, v5, v6, v7, 2u);
}

- (void)_loadBadgeModelWithConfiguration:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "Failed to load glyph texture image from URL:%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_drawFrameWithDrawable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 error];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "Failed to draw into command buffer. Error:%{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)snapshot
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "Failed to generate snapshot (imageRef: %@)", (uint8_t *)&v1, 0xCu);
}

@end