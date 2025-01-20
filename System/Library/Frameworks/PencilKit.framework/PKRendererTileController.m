@interface PKRendererTileController
+ (id)sharedController;
- (PKRendererTileController)init;
- (id)_framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 tileFramebuffersDictionary:(void *)a7 clearColor:(double)a8 clearFramebufferBlock:(double)a9;
- (id)framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:;
- (id)multiplyFramebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:;
- (void)didTeardownTile:(uint64_t)a1;
@end

@implementation PKRendererTileController

- (PKRendererTileController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKRendererTileController;
  v2 = [(PKRendererTileController *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.pencilkit.tiles", v4);
    tileQueue = v2->_tileQueue;
    v2->_tileQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    tileFramebuffers = v2->_tileFramebuffers;
    v2->_tileFramebuffers = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    tileMultiplyFramebuffers = v2->_tileMultiplyFramebuffers;
    v2->_tileMultiplyFramebuffers = (NSMutableDictionary *)v9;
  }
  return v2;
}

+ (id)sharedController
{
  self;
  if (_MergedGlobals_115 != -1) {
    dispatch_once(&_MergedGlobals_115, &__block_literal_global_4);
  }
  v0 = (void *)qword_1EB3C5E00;

  return v0;
}

void __44__PKRendererTileController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PKRendererTileController);
  v1 = (void *)qword_1EB3C5E00;
  qword_1EB3C5E00 = (uint64_t)v0;
}

- (id)_framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 tileFramebuffersDictionary:(void *)a7 clearColor:(double)a8 clearFramebufferBlock:(double)a9
{
  v21 = a2;
  id v22 = a4;
  id v23 = a6;
  v24 = a7;
  if (a1)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__2;
    v57 = __Block_byref_object_dispose__2;
    id v58 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    uint64_t v25 = a5;
    v26 = v22;
    if (v21)
    {
      float64x2_t v27 = *(float64x2_t *)(v21 + 200);
      double v28 = COERCE_DOUBLE(atomic_load((unint64_t *)v21 + 1));
      float64x2_t v35 = vrndaq_f64(vmulq_n_f64(v27, v28));
      v29 = (void *)*((void *)v21 + 15);
    }
    else
    {
      v29 = 0;
      float64x2_t v35 = 0u;
    }
    id v30 = v29;
    v31 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __142__PKRendererTileController__framebufferForTile_createIfNeeded_device_pixelFormat_tileFramebuffersDictionary_clearColor_clearFramebufferBlock___block_invoke;
    block[3] = &unk_1E64C5F10;
    v40 = &v53;
    id v37 = v23;
    id v32 = v30;
    id v38 = v32;
    char v48 = a3;
    float64x2_t v42 = v35;
    uint64_t v43 = v25;
    id v22 = v26;
    double v44 = a8;
    double v45 = a9;
    double v46 = a10;
    double v47 = a11;
    id v39 = v26;
    v41 = &v49;
    dispatch_sync(v31, block);
    if (*((unsigned char *)v50 + 24)) {
      v24[2](v24, v54[5]);
    }
    id v33 = (id)v54[5];

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

void __142__PKRendererTileController__framebufferForTile_createIfNeeded_device_pixelFormat_tileFramebuffersDictionary_clearColor_clearFramebufferBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && *(unsigned char *)(a1 + 128))
  {
    dispatch_queue_t v5 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(a1 + 48) pixelFormat:0 device:1 memoryless:(void *)1 backedByIOSurface:1 sampleCount:*(double *)(a1 + 72) purgeable:*(double *)(a1 + 80)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      long long v9 = *(_OWORD *)(a1 + 112);
      *(_OWORD *)(v8 + 88) = *(_OWORD *)(a1 + 96);
      *(_OWORD *)(v8 + 104) = v9;
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else
    {
      uint64_t v10 = 0;
    }
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (id)framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:
{
  v11 = a2;
  id v12 = a6;
  if (a1)
  {
    id v13 = a4;
    if (v11)
    {
      if (v11[82]) {
        double v14 = 1.0;
      }
      else {
        double v14 = 0.0;
      }
    }
    else
    {
      double v14 = 0.0;
    }
    v15 = *(void **)(a1 + 16);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __103__PKRendererTileController_framebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke;
    v18[3] = &unk_1E64C5F38;
    id v20 = v12;
    v19 = v11;
    v16 = -[PKRendererTileController _framebufferForTile:createIfNeeded:device:pixelFormat:tileFramebuffersDictionary:clearColor:clearFramebufferBlock:](a1, v19, a3, v13, a5, v15, v18, 0.0, 0.0, 0.0, v14);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __103__PKRendererTileController_framebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  -[PKRendererTile lockAndSetFramebufferThreadSafe:](*(void *)(a1 + 32), v5);
}

- (id)multiplyFramebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:
{
  id v11 = a2;
  id v12 = a6;
  id v13 = v12;
  if (a1)
  {
    double v14 = *(void **)(a1 + 24);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __111__PKRendererTileController_multiplyFramebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke;
    v17[3] = &unk_1E64C5F38;
    id v19 = v12;
    id v18 = v11;
    v15 = -[PKRendererTileController _framebufferForTile:createIfNeeded:device:pixelFormat:tileFramebuffersDictionary:clearColor:clearFramebufferBlock:](a1, v18, a3, a4, a5, v14, v17, 1.0, 1.0, 1.0, 1.0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __111__PKRendererTileController_multiplyFramebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  -[PKRendererTile lockAndSetMultiplyFramebufferThreadSafe:](*(void *)(a1 + 32), v5);
}

- (void)didTeardownTile:(uint64_t)a1
{
  if (a1)
  {
    if (a2 && (id v3 = *(id *)(a2 + 120)) != 0)
    {
      v4 = *(NSObject **)(a1 + 8);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __44__PKRendererTileController_didTeardownTile___block_invoke;
      v6[3] = &unk_1E64C5F60;
      v6[4] = a1;
      id v5 = v3;
      id v7 = v5;
      dispatch_sync(v4, v6);
    }
    else
    {
      id v5 = 0;
    }
  }
}

uint64_t __44__PKRendererTileController_didTeardownTile___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 removeObjectForKey:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileMultiplyFramebuffers, 0);
  objc_storeStrong((id *)&self->_tileFramebuffers, 0);

  objc_storeStrong((id *)&self->_tileQueue, 0);
}

@end