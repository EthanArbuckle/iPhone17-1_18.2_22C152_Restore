@interface ARUIRenderer
- (ARUIRenderer)init;
- (ARUIRenderer)initWithCommandQueue:(id)a3;
- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3;
- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3 commandQueue:(id)a4;
- (id)_snapshotRings:(id)a3 spriteSheet:(id)a4 withContext:(id)a5;
- (id)renderPipelineFactoryWithDevice:(id)a3 library:(id)a4;
- (id)renderPipelineFactoryWithDeviceSPI:(id)a3 librarySPI:(id)a4;
- (id)ringsRenderPipelineConfigurationForRings:(id)a3 context:(id)a4;
- (id)snapshotRingGroupControllers:(id)a3 withSize:;
- (id)snapshotRings:(id)a3 withContext:(id)a4;
- (unint64_t)renderStyle;
- (void)_renderRings:(id)a3 commandEncoder:(id)a4 passDescriptor:(id)a5 commandBuffer:(id)a6 withContext:(id)a7;
- (void)_renderRings:(id)a3 passDescriptor:(id)a4 commandBuffer:(id)a5 withContext:(id)a6;
- (void)_renderRings:(id)a3 spriteSheet:(id)a4 intoTexture:(id)a5 presentingDrawable:(id)a6 withContext:(id)a7 waitUntilCompleted:(BOOL)a8 completion:(id)a9;
- (void)clearCaches;
- (void)renderRingGroupControllers:(id)a3 withSize:(id)a4 intoTexture:(id)a5 withDrawable:(BOOL)a6 waitUntilCompleted:(id)a7 completionHandler:;
- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5;
- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5 completion:(id)a6;
- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6;
- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6 completion:(id)a7;
@end

@implementation ARUIRenderer

- (void)_renderRings:(id)a3 commandEncoder:(id)a4 passDescriptor:(id)a5 commandBuffer:(id)a6 withContext:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  [(ARUIRingsRenderer *)self->_ringsRenderer beginRenderingWithCommandEncoder:v11];
  v13 = [(ARUIRenderer *)self ringsRenderPipelineConfigurationForRings:v10 context:v12];
  v14 = [(ARUIRingsRenderPipelineFactory *)self->_ringsRenderPipelineFactory pipelineForConfiguration:v13];
  if ([v14 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ARUIRingsRenderer renderRings:intoContext:withCommandEncoder:forState:](self->_ringsRenderer, "renderRings:intoContext:withCommandEncoder:forState:", v10, v12, v11, *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (id)ringsRenderPipelineConfigurationForRings:(id)a3 context:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) percentage];
        if (v12 == *(float *)&ARUIRingPercentageValueNoRing)
        {
          uint64_t v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v53;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * j) percentage];
        if (v18 != *(float *)&ARUIRingPercentageValueNoRing)
        {
          uint64_t v15 = 1;
          goto LABEL_21;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  char v19 = [v6 opaque];
  uint64_t v20 = [v14 count];
  unint64_t v21 = v20;
  if (v20)
  {
    unsigned int v51 = v13;
    if (v19)
    {
      uint64_t v22 = 0;
      while (1)
      {
        long long v23 = [v14 objectAtIndex:v22];
        [v23 opacity];
        float v25 = v24;

        if (v25 > 0.0) {
          break;
        }
        if (v21 == ++v22)
        {
          int v26 = 0;
          int v27 = 0;
          goto LABEL_38;
        }
      }
      int v26 = 0;
      int v27 = 1;
    }
    else
    {
      id v50 = v6;
      int v30 = 0;
      int v26 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = v20 - 1;
      do
      {
        v33 = objc_msgSend(v14, "objectAtIndex:", v31, v50);
        [v33 opacity];
        if (v34 > 0.0) {
          int v30 = 1;
        }
        [v33 opacity];
        if (v35 < 1.0) {
          int v26 = 1;
        }
        int v27 = v30;

        if ((v30 & 1 & v26) != 0) {
          break;
        }
      }
      while (v32 != v31++);
      id v6 = v50;
    }
LABEL_38:
    if (v21 <= 1) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = v21;
    }
    v38 = [v14 objectAtIndex:0];
    [v38 percentage];
    double v40 = v39;
    double v41 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold;

    if (v41 < v40)
    {
      unint64_t v21 = 1;
    }
    else
    {
      uint64_t v42 = 1;
      do
      {
        unint64_t v43 = v42;
        if (v37 == v42) {
          break;
        }
        v44 = [v14 objectAtIndex:v42];
        [v44 percentage];
        double v46 = v45;
        double v47 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold;

        uint64_t v42 = v43 + 1;
      }
      while (v47 >= v46);
      unint64_t v21 = v43 < v21;
    }
    BOOL v28 = v26 != 0;
    BOOL v29 = v27 != 0;
    uint64_t v13 = v51;
  }
  else
  {
    BOOL v28 = 0;
    BOOL v29 = 0;
  }
  v48 = objc_alloc_init(ARUIRingsRenderPipelineConfiguration);
  [(ARUIRingsRenderPipelineConfiguration *)v48 setHasVisibleRings:v29];
  [(ARUIRingsRenderPipelineConfiguration *)v48 setHasEmptyRing:v13];
  [(ARUIRingsRenderPipelineConfiguration *)v48 setHasFilledRing:v15];
  [(ARUIRingsRenderPipelineConfiguration *)v48 setNeedsAlphaReductionPass:v28];
  [(ARUIRingsRenderPipelineConfiguration *)v48 setHasOverlappingRing:v21];

  return v48;
}

uint64_t __114__ARUIRenderer__renderRings_spriteSheet_intoTexture_presentingDrawable_withContext_waitUntilCompleted_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v14 texture];
  [(ARUIRenderer *)self _renderRings:v16 spriteSheet:v15 intoTexture:v17 presentingDrawable:v14 withContext:v13 waitUntilCompleted:0 completion:v12];
}

- (void)_renderRings:(id)a3 spriteSheet:(id)a4 intoTexture:(id)a5 presentingDrawable:(id)a6 withContext:(id)a7 waitUntilCompleted:(BOOL)a8 completion:(id)a9
{
  BOOL v31 = a8;
  id v14 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  char v19 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  uint64_t v20 = [MEMORY[0x263F129A0] renderPassDescriptor];
  unint64_t v21 = [v20 colorAttachments];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setTexture:v15];

  long long v23 = [v20 colorAttachments];
  float v24 = [v23 objectAtIndexedSubscript:0];
  objc_msgSend(v24, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  float v25 = [v20 colorAttachments];
  int v26 = [v25 objectAtIndexedSubscript:0];
  [v26 setStoreAction:1];

  int v27 = [v20 colorAttachments];
  BOOL v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setLoadAction:2];

  BOOL v29 = [v19 renderCommandEncoderWithDescriptor:v20];
  [(ARUIRenderer *)self _renderRings:v14 commandEncoder:v29 passDescriptor:v20 commandBuffer:v19 withContext:v17];
  if (v30) {
    [(ARUISpritesRenderer *)self->_spritesRenderer renderSpriteSheet:v30 intoContext:v17 withCommandEncoder:v29];
  }
  [v29 endEncoding];
  [(ARUICelebrationsRenderer *)self->_celebrationsRenderer renderCelebrationsForRings:v14 withCommandBuffer:v19 intoTexture:v15 withContext:v17];
  if (v18)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __114__ARUIRenderer__renderRings_spriteSheet_intoTexture_presentingDrawable_withContext_waitUntilCompleted_completion___block_invoke;
    v32[3] = &unk_264498A80;
    id v33 = v18;
    [v19 addCompletedHandler:v32];
  }
  if ([v17 presentsWithTransaction])
  {
    [v19 commit];
    if (v16)
    {
      [v19 waitUntilScheduled];
      [v16 present];
    }
  }
  else
  {
    if (v16) {
      [v19 presentDrawable:v16];
    }
    [v19 commit];
  }
  if (v31) {
    [v19 waitUntilCompleted];
  }
}

- (ARUIRenderer)init
{
  return [(ARUIRenderer *)self initWithRenderStyle:0 commandQueue:0];
}

- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3 commandQueue:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ARUIRenderer;
  id v7 = [(ARUIRenderer *)&v27 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_renderStyle = a3;
    uint64_t v9 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
    device = v8->_device;
    v8->_device = v9;

    id v11 = v8->_device;
    if (v11)
    {
      if (v6) {
        id v12 = (MTLCommandQueue *)v6;
      }
      else {
        id v12 = (MTLCommandQueue *)[(MTLDeviceSPI *)v11 newCommandQueue];
      }
      commandQueue = v8->_commandQueue;
      v8->_commandQueue = v12;

      id v14 = [[ARUIRingsRenderer alloc] initWithDevice:v8->_device];
      ringsRenderer = v8->_ringsRenderer;
      v8->_ringsRenderer = v14;

      id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = [v16 bundlePath];
      id v18 = [v17 stringByAppendingPathComponent:@"ARUIPrecompiledPipeline.pipelinelib"];

      char v19 = (void *)[(MTLDeviceSPI *)v8->_device newPipelineLibraryWithFilePath:v18 error:0];
      uint64_t v20 = [(ARUIRenderer *)v8 renderPipelineFactoryWithDeviceSPI:v8->_device librarySPI:v19];
      ringsRenderPipelineFactory = v8->_ringsRenderPipelineFactory;
      v8->_ringsRenderPipelineFactory = (ARUIRingsRenderPipelineFactory *)v20;

      uint64_t v22 = [[ARUISpritesRenderer alloc] initWithDeviceSPI:v8->_device librarySPI:v19];
      spritesRenderer = v8->_spritesRenderer;
      v8->_spritesRenderer = v22;

      float v24 = [[ARUICelebrationsRenderer alloc] initWithDevice:v8->_device commandQueue:v8->_commandQueue];
      celebrationsRenderer = v8->_celebrationsRenderer;
      v8->_celebrationsRenderer = v24;
    }
  }

  return v8;
}

- (id)renderPipelineFactoryWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t renderStyle = self->_renderStyle;
  if (renderStyle)
  {
    if (renderStyle != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = off_264498840;
  }
  else
  {
    uint64_t v9 = off_264498860;
  }
  self = (ARUIRenderer *)[objc_alloc(*v9) initWithDeviceSPI:v6 librarySPI:v7];
LABEL_6:

  return self;
}

- (ARUIRenderer)initWithCommandQueue:(id)a3
{
  return [(ARUIRenderer *)self initWithRenderStyle:0 commandQueue:a3];
}

- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3
{
  return [(ARUIRenderer *)self initWithRenderStyle:a3 commandQueue:0];
}

- (id)renderPipelineFactoryWithDevice:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t renderStyle = self->_renderStyle;
  if (renderStyle)
  {
    if (renderStyle != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = off_264498840;
  }
  else
  {
    uint64_t v9 = off_264498860;
  }
  self = (ARUIRenderer *)[objc_alloc(*v9) initWithDevice:v6 library:v7];
LABEL_6:

  return self;
}

- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 texture];
  [(ARUIRenderer *)self _renderRings:v10 spriteSheet:0 intoTexture:v11 presentingDrawable:v9 withContext:v8 waitUntilCompleted:0 completion:0];
}

- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 texture];
  [(ARUIRenderer *)self _renderRings:v13 spriteSheet:0 intoTexture:v14 presentingDrawable:v12 withContext:v11 waitUntilCompleted:0 completion:v10];
}

- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 texture];
  [(ARUIRenderer *)self _renderRings:v13 spriteSheet:v12 intoTexture:v14 presentingDrawable:v11 withContext:v10 waitUntilCompleted:0 completion:0];
}

- (void)_renderRings:(id)a3 passDescriptor:(id)a4 commandBuffer:(id)a5 withContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 renderCommandEncoderWithDescriptor:v12];
  [(ARUIRenderer *)self _renderRings:v13 commandEncoder:v14 passDescriptor:v12 commandBuffer:v11 withContext:v10];

  [v14 endEncoding];
}

- (id)snapshotRings:(id)a3 withContext:(id)a4
{
  return [(ARUIRenderer *)self _snapshotRings:a3 spriteSheet:0 withContext:a4];
}

- (id)_snapshotRings:(id)a3 spriteSheet:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 drawableSize];
  float v29 = v11;
  double v12 = ceilf(v11);
  [v8 drawableSize];
  double v14 = ceilf(v13);
  size_t v15 = vcvtps_u32_f32(v29);
  size_t v16 = vcvtps_u32_f32(v13);
  id v17 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:80 width:v15 height:v16 mipmapped:0];
  [v17 setUsage:4];
  [v17 setResourceOptions:0];
  id v18 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v17];
  [(ARUIRenderer *)self _renderRings:v10 spriteSheet:v9 intoTexture:v18 presentingDrawable:0 withContext:v8 waitUntilCompleted:1 completion:0];

  char v19 = malloc_type_malloc((unint64_t)(v12 * 4.0 * v14), 0xC7C708CuLL);
  size_t v20 = vcvtd_n_u64_f64(v12, 2uLL);
  memset(v30, 0, 24);
  v30[3] = v15;
  v30[4] = v16;
  v30[5] = 1;
  [v18 getBytes:v19 bytesPerRow:v20 fromRegion:v30 mipmapLevel:0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v22 = CGDataProviderCreateWithData(0, v19, (unint64_t)(v12 * 4.0 * v14), (CGDataProviderReleaseDataCallback)freeData);
  CGImageRef v23 = CGImageCreate(v15, v16, 8uLL, 0x20uLL, v20, DeviceRGB, 0x2002u, v22, 0, 0, kCGRenderingIntentDefault);
  if (v23)
  {
    float v24 = v23;
    float v25 = (void *)MEMORY[0x263F827E8];
    [v8 screenScale];
    objc_super v27 = [v25 imageWithCGImage:v24 scale:0 orientation:v26];
    CGImageRelease(v24);
  }
  else
  {
    objc_super v27 = 0;
  }
  CGDataProviderRelease(v22);
  CGColorSpaceRelease(DeviceRGB);

  return v27;
}

- (void)clearCaches
{
}

- (void)renderRingGroupControllers:(id)a3 withSize:(id)a4 intoTexture:(id)a5 withDrawable:(BOOL)a6 waitUntilCompleted:(id)a7 completionHandler:
{
  BOOL v32 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v29 = a7;
  double v12 = [ARUIRenderContext alloc];
  float v27 = (float)(unint64_t)[v11 width];
  unint64_t v13 = [v11 height];
  *(float *)&double v14 = v27;
  *((float *)&v14 + 1) = (float)v13;
  BOOL v28 = [(ARUIRenderContext *)v12 initWithDrawableSize:v14];
  size_t v15 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    char v19 = 0;
    uint64_t v20 = *(void *)v34;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = v19;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v16);
        }
        CGImageRef v23 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
        float v24 = [v23 ringGroup];
        float v25 = [v24 rings];
        [v15 addObjectsFromArray:v25];

        float v26 = [v23 ringGroup];
        char v19 = [v26 spriteSheet];

        ++v21;
        uint64_t v22 = v19;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }
  else
  {
    char v19 = 0;
  }

  [(ARUIRenderer *)self _renderRings:v15 spriteSheet:v19 intoTexture:v11 presentingDrawable:v31 withContext:v28 waitUntilCompleted:v32 completion:v29];
}

- (id)snapshotRingGroupControllers:(id)a3 withSize:
{
  double v4 = v3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [[ARUIRenderContext alloc] initWithDrawableSize:v4];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      double v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        size_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        id v16 = [v15 ringGroup];
        uint64_t v17 = [v16 rings];
        [v7 addObjectsFromArray:v17];

        uint64_t v18 = [v15 ringGroup];
        id v11 = [v18 spriteSheet];

        ++v13;
        double v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  char v19 = [(ARUIRenderer *)self snapshotRings:v7 spriteSheet:v11 withContext:v6];

  return v19;
}

- (unint64_t)renderStyle
{
  return self->_renderStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_celebrationsRenderer, 0);
  objc_storeStrong((id *)&self->_spritesRenderer, 0);
  objc_storeStrong((id *)&self->_ringsRenderer, 0);
  objc_storeStrong((id *)&self->_ringsRenderPipelineFactory, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end