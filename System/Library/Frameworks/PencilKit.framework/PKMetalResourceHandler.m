@interface PKMetalResourceHandler
+ (id)generatePipelineDescriptorsForDevice:(id)a3;
+ (id)sharedResourceHandlerWithDevice:(uint64_t)a1;
+ (uint64_t)inkBundle;
- (PKMetalResourceHandler)init;
- (char)_uberShaderForKey:(char *)a1;
- (double)paperTextureSize;
- (id).cxx_construct;
- (id)_createSDFPenEllipseLookupTexture;
- (id)_inkTextureNamed:(uint64_t)a3 image:;
- (id)_pipelineDescriptorForConfig:(uint64_t)a1;
- (id)_preloadUberShaders;
- (id)_signpostLog;
- (id)cachedQuadTexCoordBuffer;
- (id)cachedQuadVertexBuffer;
- (id)compositeEraseShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(char)a5 secondaryPaintEnabled:(uint64_t)a6 pipelineConfig:;
- (id)compositeMultiplyShaderWithMode:(char)a3 clipping:(char)a4 targetMultiple:(int)a5 colorAttachmentIndex:(char)a6 renderMask:(char)a7 edgeMask:(char)a8 secondaryPaintEnabled:(int)a9 pipelineConfig:(__int16)a10;
- (id)compositeOverShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:;
- (id)compositePaperShaderWithMode:(int)a3 colorAttachmentIndex:(char)a4 secondaryPaintEnabled:(uint64_t)a5 pipelineConfig:;
- (id)compositeSoftWhiteShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:;
- (id)indexBufferForNumVertices:(void *)a3 outIndexType:;
- (id)initWithDevice:(char)a3 generatePipelineDescriptors:;
- (id)initWithDevice:(id)a1;
- (id)inkTextureNamed:(uint64_t)a3 image:;
- (id)kernelPipelineStateForKey:(uint64_t)a1;
- (id)namedShaderForKey:(uint64_t)a1;
- (id)newBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:;
- (id)newGPUBufferWithLength:(uint64_t)a3 outOffset:(void *)a4 commandBuffer:;
- (id)newPurgeableBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:;
- (id)paintShaderKernelPipelineState;
- (id)paintShaderKernelPipelineStateWithLiveStrokeMode;
- (id)paintShaderKernelPipelineStateWithLiveStrokeParticles;
- (id)paperTexture;
- (id)particleShaderKernelPipelineStateWithVariableSpacing:(int)a3 particleMasks:;
- (id)randomNumberBuffer;
- (id)sdfPenEllipseLookupTexture;
- (id)sdfPenMaxHeightLookupTexture;
- (id)sdfPenShaderKernelPipelineState;
- (id)shaderLibrary;
- (id)sixChannelShaderWithMode:(char)a3 clipping:(char)a4 erase:(char)a5 bitmapEraserMask:(char)a6 snapshotImage:(char)a7 renderMask:(char)a8 secondaryPaintEnabled:(uint64_t)a9 colorAttachmentIndex:(int)a10 pipelineConfig:(__int16)a11;
- (id)strokeRenderCache;
- (id)uberShaderForKey:(uint64_t)a1;
- (id)uint16IndexBuffer;
- (uint64_t)_kernelPipelineStateForKey:(uint64_t)a1;
- (uint64_t)_namedShaderForKey:(uint64_t)a1;
- (uint64_t)isAppInBackground;
- (uint64_t)newPaintShaderKernelPipelineState;
- (uint64_t)randomNumberArray;
- (void)_paintShaderKernelPipelineStateWithLiveStrokeMode:(void *)a1 particles:(int)a2;
- (void)_setupPaperTextureIfNecessary;
- (void)deallocateReusableBuffers;
- (void)newComputePipelineDescriptor;
- (void)reloadParticleTexturesIfNecessaryCommandQueue:(uint64_t)a1;
- (void)replaceInkTexture:(uint64_t)a3 image:;
@end

@implementation PKMetalResourceHandler

+ (id)sharedResourceHandlerWithDevice:(uint64_t)a1
{
  id v2 = a2;
  id v3 = self;
  objc_sync_enter(v3);
  v4 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
  if (!+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler
    || *(id *)(+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler + 432) != v2)
  {
    id v5 = -[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:]([PKMetalResourceHandler alloc], v2, 0);
    v6 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
    +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler = (uint64_t)v5;

    v4 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
  }
  id v7 = v4;
  objc_sync_exit(v3);

  return v7;
}

- (id)initWithDevice:(char)a3 generatePipelineDescriptors:
{
  id v6 = a2;
  if (!a1) {
    goto LABEL_11;
  }
  v31.receiver = a1;
  v31.super_class = (Class)PKMetalResourceHandler;
  id v7 = (char *)objc_msgSendSuper2(&v31, sel_init);
  a1 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = +[PKAppBackgroundStateTracker sharedInstance]();
  v7[426] = [v6 supportsFamily:1001];
  v7[427] = [v6 supportsFamily:2002];
  v7[428] = +[PKMetalUtility deviceSupportsFramebufferFetch:v6];
  v7[424] = a3;
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.PencilKit.MetalResourceHandlerAccessQueue", v9);
  v11 = (void *)*((void *)v7 + 47);
  *((void *)v7 + 47) = v10;

  objc_storeStrong((id *)v7 + 54, a2);
  *(int64x2_t *)(v7 + 440) = vdupq_n_s64(0x50uLL);
  v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  LODWORD(v9) = [v12 _supportsDeepColor];

  if (v9)
  {
    uint64_t v13 = PKWideGamutPixelFormatForCurrentDevice();
    *((void *)v7 + 55) = v13;
    *((void *)v7 + 56) = v13;
LABEL_7:
    BOOL v14 = 1;
    goto LABEL_8;
  }
  if (*((void *)v7 + 56) != 80) {
    goto LABEL_7;
  }
  BOOL v14 = *((void *)v7 + 55) != 80;
LABEL_8:
  v7[429] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = (void *)*((void *)v7 + 12);
  *((void *)v7 + 12) = v15;

  v17 = objc_alloc_init(PKLRUCache);
  v18 = (void *)*((void *)v7 + 42);
  *((void *)v7 + 42) = v17;

  uint64_t v19 = *((void *)v7 + 42);
  if (v19) {
    *(void *)(v19 + 64) = 0x8000000;
  }
  v20 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, 0, v6, 0);
  v21 = (void *)*((void *)v7 + 50);
  *((void *)v7 + 50) = v20;

  v22 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, 0, v6, 1);
  v23 = (void *)*((void *)v7 + 49);
  *((void *)v7 + 49) = v22;

  v24 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, (void *)0x20, v6, 0);
  v25 = (void *)*((void *)v7 + 51);
  *((void *)v7 + 51) = v24;

  v26 = -[PKMetalResourceHandler _signpostLog](v7);
  *((void *)v7 + 48) = os_signpost_id_make_with_pointer(v26, v7 + 376);

  v27 = *((void *)v7 + 47);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKMetalResourceHandler_initWithDevice_generatePipelineDescriptors___block_invoke;
  block[3] = &unk_1E64C5368;
  a1 = a1;
  id v30 = a1;
  dispatch_async(v27, block);

LABEL_11:
  return a1;
}

- (uint64_t)newPaintShaderKernelPipelineState
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F35228]);
    id v3 = -[PKMetalResourceHandler newComputePipelineDescriptor](v1);
    [v3 setLabel:@"Paint kernel"];
    v4 = (void *)[*(id *)(v1 + 304) newFunctionWithName:@"paint_kernel" constantValues:v2 error:0];
    [v3 setComputeFunction:v4];

    uint64_t v1 = [*(id *)(v1 + 432) newComputePipelineStateWithDescriptor:v3 options:0 reflection:0 error:0];
  }
  return v1;
}

void __69__PKMetalResourceHandler_initWithDevice_generatePipelineDescriptors___block_invoke(uint64_t a1)
{
  id v2 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 384);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PreloadResources", (const char *)&unk_1C48540E6, buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (!*(void *)(v5 + 80))
    {
      uint64_t v6 = [*(id *)(v5 + 432) newBufferWithBytes:&-[PKMetalResourceHandler _setupCachedQuad]::vertices length:32 options:0];
      id v7 = *(void **)(v5 + 80);
      *(void *)(v5 + 80) = v6;
    }
    if (!*(void *)(v5 + 88))
    {
      uint64_t v8 = [*(id *)(v5 + 432) newBufferWithBytes:&-[PKMetalResourceHandler _setupCachedQuad]::texCoords length:32 options:0];
      v9 = *(void **)(v5 + 88);
      *(void *)(v5 + 88) = v8;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10 && !*(void *)(v10 + 304))
    {
      v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v12 = [v11 pathForResource:@"PencilKit_iOS" ofType:@"pipelinelib"];
      if (v12 && !*(unsigned char *)(v10 + 424))
      {
        BOOL v14 = -[PKMetalResourceHandler _signpostLog]((id)v10);
        uint64_t v15 = v14;
        os_signpost_id_t v16 = *(void *)(v10 + 384);
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C44F8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "LoadPipelineLibrary", (const char *)&unk_1C48540E6, v112, 2u);
        }

        v17 = *(void **)(v10 + 432);
        id v111 = 0;
        uint64_t v18 = [v17 newPipelineLibraryWithFilePath:v12 error:&v111];
        id v13 = v111;
        uint64_t v19 = *(void **)(v10 + 416);
        *(void *)(v10 + 416) = v18;

        v20 = -[PKMetalResourceHandler _signpostLog]((id)v10);
        v21 = v20;
        os_signpost_id_t v22 = *(void *)(v10 + 384);
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C44F8000, v21, OS_SIGNPOST_INTERVAL_END, v22, "LoadPipelineLibrary", (const char *)&unk_1C48540E6, v112, 2u);
        }
      }
      else
      {
        id v13 = 0;
      }
      v23 = -[PKMetalResourceHandler _signpostLog]((id)v10);
      v24 = v23;
      os_signpost_id_t v25 = *(void *)(v10 + 384);
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C44F8000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PreloadShaders", (const char *)&unk_1C48540E6, v112, 2u);
      }

      v26 = *(void **)(v10 + 432);
      id v110 = v13;
      v27 = (void *)[v26 newDefaultLibraryWithBundle:v11 error:&v110];
      id v28 = v110;

      objc_storeStrong((id *)(v10 + 304), v27);
      if (!*(void *)(v10 + 24))
      {
        uint64_t v29 = -[PKMetalResourceHandler newPaintShaderKernelPipelineState](v10);
        id v30 = *(void **)(v10 + 24);
        *(void *)(v10 + 24) = v29;
      }
      if (!*(void *)(v10 + 64))
      {
        uint64_t v31 = -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:]((void *)v10, 1);
        v32 = *(void **)(v10 + 64);
        *(void *)(v10 + 64) = v31;
      }
      if (!*(void *)(v10 + 56))
      {
        uint64_t v33 = -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:]((void *)v10, 0);
        v34 = *(void **)(v10 + 56);
        *(void *)(v10 + 56) = v33;
      }
      id v35 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0);
      id v36 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 1u);
      id v37 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0x101u);
      id v38 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0x100u);
      if (*(unsigned char *)(v10 + 424))
      {
        *(void *)buf = 3;
        uint64_t v107 = 0;
        uint64_t v106 = 0;
        uint64_t v108 = 0x201010200000000;
        int v105 = 1;
        int v109 = 0;
        id v39 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)buf);
        uint64_t v98 = 3;
        uint64_t v101 = 0;
        uint64_t v100 = 0;
        int v99 = 1;
        int v102 = 0;
        uint64_t v103 = 33620226;
        id v40 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v98);
        uint64_t v91 = 4;
        uint64_t v94 = 0;
        uint64_t v93 = 0;
        int v92 = 1;
        int v95 = 0;
        int v97 = 0;
        int v96 = 33620226;
        id v41 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v91);
        uint64_t v84 = 5;
        uint64_t v87 = 0;
        uint64_t v86 = 0;
        int v85 = 1;
        int v88 = 0;
        int v89 = 33620226;
        int v90 = 0;
        id v42 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v84);
        uint64_t v77 = 7;
        uint64_t v80 = 0;
        uint64_t v79 = 0;
        int v78 = 1;
        int v81 = 0;
        int v82 = 33620226;
        int v83 = 0;
        id v43 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v77);
        uint64_t v70 = 11;
        uint64_t v73 = 0;
        uint64_t v72 = 0;
        int v71 = 1;
        int v74 = 0;
        int v75 = 33620226;
        int v76 = 0;
        id v44 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v70);
        v67[0] = 11;
        memset(&v67[1], 0, 24);
        int v68 = 33620226;
        int v69 = 0;
        id v45 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)v67);
        uint64_t v61 = 2;
        int v62 = 1;
        uint64_t v64 = 0;
        uint64_t v63 = 0;
        uint64_t v65 = 0x101010100000000;
        int v66 = 0;
        id v46 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v61);
        uint64_t v54 = 11;
        int v55 = 1;
        uint64_t v57 = 0;
        uint64_t v56 = 0;
        int v59 = 16843009;
        int v60 = 0;
        int v58 = 0;
        id v47 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v54);
        *(unsigned char *)(v10 + 425) = 0;
        -[PKMetalResourceHandler _preloadUberShaders]((char *)v10);
        *(unsigned char *)(v10 + 425) = 1;
        -[PKMetalResourceHandler _preloadUberShaders]((char *)v10);
      }
      v48 = -[PKMetalResourceHandler _signpostLog]((id)v10);
      v49 = v48;
      os_signpost_id_t v50 = *(void *)(v10 + 384);
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C44F8000, v49, OS_SIGNPOST_INTERVAL_END, v50, "PreloadShaders", (const char *)&unk_1C48540E6, v112, 2u);
      }

      uint64_t v10 = *(void *)(a1 + 32);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v51 = -[PKMetalResourceHandler _signpostLog]((id)v10);
  v52 = v51;
  os_signpost_id_t v53 = *(void *)(*(void *)(a1 + 32) + 384);
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v52, OS_SIGNPOST_INTERVAL_END, v53, "PreloadResources", (const char *)&unk_1C48540E6, buf, 2u);
  }
}

- (id)_signpostLog
{
  if (a1)
  {
    if (qword_1EB3C61C0 != -1) {
      dispatch_once(&qword_1EB3C61C0, &__block_literal_global_159);
    }
    a1 = (id)qword_1EB3C61B8;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_paintShaderKernelPipelineStateWithLiveStrokeMode:(void *)a1 particles:(int)a2
{
  id v2 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F35228]);
    uint64_t v5 = -[PKMetalResourceHandler newComputePipelineDescriptor]((uint64_t)v2);
    [v5 setLabel:@"Paint kernel"];
    char v14 = 1;
    [v4 setConstantValue:&v14 type:53 atIndex:2];
    if (a2) {
      [v4 setConstantValue:&v14 type:53 atIndex:3];
    }
    uint64_t v6 = (void *)v2[38];
    id v13 = 0;
    id v7 = (void *)[v6 newFunctionWithName:@"paint_kernel" constantValues:v4 error:&v13];
    id v8 = v13;
    [v5 setComputeFunction:v7];

    v9 = (void *)v2[54];
    id v12 = v8;
    id v2 = (void *)[v9 newComputePipelineStateWithDescriptor:v5 options:0 reflection:0 error:&v12];
    id v10 = v12;
  }

  return v2;
}

- (uint64_t)_kernelPipelineStateForKey:(uint64_t)a1
{
  unsigned __int16 v48 = a2;
  if (!a1)
  {
    id v46 = 0;
    goto LABEL_94;
  }
  unint64_t v5 = PKHashBytes((uint64_t)&v48, 2);
  unint64_t v6 = v5;
  int8x8_t v7 = *(int8x8_t *)(a1 + 272);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = v5;
      if (v5 >= *(void *)&v7) {
        unint64_t v9 = v5 % *(void *)&v7;
      }
    }
    else
    {
      unint64_t v9 = (*(void *)&v7 - 1) & v5;
    }
    id v10 = *(uint64_t ****)(*(void *)(a1 + 264) + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = (uint64_t **)*i)
      {
        unint64_t v12 = (unint64_t)i[1];
        if (v12 == v5)
        {
          if (*((unsigned __int16 *)i + 8) == v48)
          {
            id v46 = i[3];
            goto LABEL_94;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= *(void *)&v7) {
              v12 %= *(void *)&v7;
            }
          }
          else
          {
            v12 &= *(void *)&v7 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  id v13 = -[PKMetalResourceHandler newComputePipelineDescriptor](a1);
  [v13 setLabel:@"Particle kernel with Variable Particle Spacing"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F35228]);
  uint64_t v15 = v14;
  LOBYTE(v49[0]) = 1;
  if ((_BYTE)a2) {
    [v14 setConstantValue:v49 type:53 atIndex:3];
  }
  if ((a2 & 0xFF00) != 0) {
    [v15 setConstantValue:v49 type:53 atIndex:4];
  }
  os_signpost_id_t v16 = (void *)[*(id *)(a1 + 304) newFunctionWithName:@"particle_kernel" constantValues:v15 error:0];
  [v13 setComputeFunction:v16];

  v17 = (uint64_t *)[*(id *)(a1 + 432) newComputePipelineStateWithDescriptor:v13 options:0 reflection:0 error:0];
  unint64_t v18 = *(void *)(a1 + 272);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      unint64_t v2 = v6;
      if (v6 >= v18) {
        unint64_t v2 = v6 % v18;
      }
    }
    else
    {
      unint64_t v2 = (v18 - 1) & v6;
    }
    v20 = *(uint64_t ****)(*(void *)(a1 + 264) + 8 * v2);
    if (v20)
    {
      for (j = *v20; j; j = (uint64_t **)*j)
      {
        unint64_t v22 = (unint64_t)j[1];
        if (v22 == v6)
        {
          if (*((unsigned __int16 *)j + 8) == v48)
          {
            id v46 = v17;
            goto LABEL_94;
          }
        }
        else
        {
          if (v19.u32[0] > 1uLL)
          {
            if (v22 >= v18) {
              v22 %= v18;
            }
          }
          else
          {
            v22 &= v18 - 1;
          }
          if (v22 != v2) {
            break;
          }
        }
      }
    }
  }
  v23 = operator new(0x20uLL);
  v24 = (void *)(a1 + 280);
  v49[0] = v23;
  v49[1] = a1 + 280;
  void *v23 = 0;
  v23[1] = v6;
  *((_WORD *)v23 + 8) = a2;
  id v46 = v17;
  v23[3] = v46;
  char v50 = 1;
  float v25 = (float)(unint64_t)(*(void *)(a1 + 288) + 1);
  float v26 = *(float *)(a1 + 296);
  if (!v18 || (float)(v26 * (float)v18) < v25)
  {
    BOOL v27 = (v18 & (v18 - 1)) == 0;
    if (v18 < 3) {
      BOOL v27 = 0;
    }
    unint64_t v28 = (2 * v18) | !v27;
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v18 = *(void *)(a1 + 272);
    if (*(void *)&prime > v18) {
      goto LABEL_51;
    }
    if (*(void *)&prime < v18)
    {
      unint64_t v37 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 288) / *(float *)(a1 + 296));
      if (v18 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }
      else
      {
        uint64_t v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }
      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v18)
      {
        unint64_t v18 = *(void *)(a1 + 272);
      }
      else
      {
        if (prime)
        {
LABEL_51:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v31 = operator new(8 * *(void *)&prime);
          v32 = *(void **)(a1 + 264);
          *(void *)(a1 + 264) = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0;
          *(int8x8_t *)(a1 + 272) = prime;
          do
            *(void *)(*(void *)(a1 + 264) + 8 * v33++) = 0;
          while (*(void *)&prime != v33);
          v34 = (void *)*v24;
          if (*v24)
          {
            unint64_t v35 = v34[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }
            else
            {
              v35 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(a1 + 264) + 8 * v35) = v24;
            id v40 = (void *)*v34;
            if (*v34)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }
                else
                {
                  v41 &= *(void *)&prime - 1;
                }
                if (v41 != v35)
                {
                  uint64_t v42 = *(void *)(a1 + 264);
                  if (!*(void *)(v42 + 8 * v41))
                  {
                    *(void *)(v42 + 8 * v41) = v34;
                    goto LABEL_76;
                  }
                  void *v34 = *v40;
                  *id v40 = **(void **)(*(void *)(a1 + 264) + 8 * v41);
                  **(void **)(*(void *)(a1 + 264) + 8 * v41) = v40;
                  id v40 = v34;
                }
                unint64_t v41 = v35;
LABEL_76:
                v34 = v40;
                id v40 = (void *)*v40;
                unint64_t v35 = v41;
              }
              while (v40);
            }
          }
          unint64_t v18 = (unint64_t)prime;
          goto LABEL_80;
        }
        id v47 = *(void **)(a1 + 264);
        *(void *)(a1 + 264) = 0;
        if (v47) {
          operator delete(v47);
        }
        unint64_t v18 = 0;
        *(void *)(a1 + 272) = 0;
      }
    }
LABEL_80:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v6 >= v18) {
        unint64_t v2 = v6 % v18;
      }
      else {
        unint64_t v2 = v6;
      }
    }
    else
    {
      unint64_t v2 = (v18 - 1) & v6;
    }
  }
  id v43 = *(void **)(*(void *)(a1 + 264) + 8 * v2);
  if (v43)
  {
    *(void *)v49[0] = *v43;
    *id v43 = v49[0];
  }
  else
  {
    *(void *)v49[0] = *(void *)(a1 + 280);
    *(void *)(a1 + 280) = v49[0];
    *(void *)(*(void *)(a1 + 264) + 8 * v2) = v24;
    if (*(void *)v49[0])
    {
      unint64_t v44 = *(void *)(*(void *)v49[0] + 8);
      if ((v18 & (v18 - 1)) != 0)
      {
        if (v44 >= v18) {
          v44 %= v18;
        }
      }
      else
      {
        v44 &= v18 - 1;
      }
      *(void *)(*(void *)(a1 + 264) + 8 * v44) = v49[0];
    }
  }
  v49[0] = 0;
  ++*(void *)(a1 + 288);
LABEL_94:

  return v46;
}

- (void)newComputePipelineDescriptor
{
  unint64_t v2 = objc_opt_new();
  [v2 setPipelineLibrary:*(void *)(a1 + 416)];
  return v2;
}

+ (uint64_t)inkBundle
{
  self;
  v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();

  return [v0 bundleForClass:v1];
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_DWORD *)self + 74) = 1065353216;
  return self;
}

void __38__PKMetalResourceHandler__signpostLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.pencilkit", "metalResourceHandler");
  uint64_t v1 = (void *)qword_1EB3C61B8;
  qword_1EB3C61B8 = (uint64_t)v0;
}

- (PKMetalResourceHandler)init
{
}

+ (id)generatePipelineDescriptorsForDevice:(id)a3
{
  id v3 = a3;
  [v3 startCollectingPipelineDescriptors];
  id v4 = (dispatch_queue_t *)-[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:]([PKMetalResourceHandler alloc], v3, 1);
  dispatch_sync(v4[47], &__block_literal_global_74);
  unint64_t v5 = [v3 endCollectingPipelineDescriptors];

  return v5;
}

- (id)initWithDevice:(id)a1
{
  id v3 = a2;
  if (a1) {
    a1 = -[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:](a1, v3, 0);
  }

  return a1;
}

- (id)shaderLibrary
{
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint8x8_t v8 = __Block_byref_object_copy__26;
    unint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    uint64_t v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__PKMetalResourceHandler_shaderLibrary__block_invoke;
    v4[3] = &unk_1E64C5848;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __39__PKMetalResourceHandler_shaderLibrary__block_invoke(uint64_t a1)
{
}

- (uint64_t)isAppInBackground
{
  +[PKAppBackgroundStateTracker sharedInstance]();
  os_log_t v0 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    unsigned __int8 v1 = atomic_load(v0 + 8);
    uint64_t v2 = v1 & 1;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)strokeRenderCache
{
  if (a1)
  {
    a1 = (id *)a1[42];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_pipelineDescriptorForConfig:(uint64_t)a1
{
  int v49 = a2;
  unsigned __int16 v50 = WORD2(a2);
  unint64_t v4 = PKHashBytes((uint64_t)&v49, 6);
  unint64_t v5 = v4;
  int8x8_t v6 = *(int8x8_t *)(a1 + 232);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v4;
      if (v4 >= *(void *)&v6) {
        unint64_t v8 = v4 % *(void *)&v6;
      }
    }
    else
    {
      unint64_t v8 = (*(void *)&v6 - 1) & v4;
    }
    unint64_t v9 = *(uint64_t ***)(*(void *)(a1 + 224) + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v4)
        {
          if (*((_DWORD *)i + 4) == v49 && *((unsigned __int16 *)i + 10) == v50)
          {
            id v47 = (id)i[3];
            goto LABEL_106;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(void *)&v6) {
              v11 %= *(void *)&v6;
            }
          }
          else
          {
            v11 &= *(void *)&v6 - 1;
          }
          if (v11 != v8) {
            break;
          }
        }
      }
    }
  }
  id v47 = (id)objc_opt_new();
  [v47 setPipelineLibrary:*(void *)(a1 + 416)];
  uint64_t v13 = 0;
  while (2)
  {
    switch(*((unsigned char *)&v49 + v13))
    {
      case 0:
        goto LABEL_29;
      case 1:
        uint64_t v2 = 10;
        goto LABEL_28;
      case 2:
        uint64_t v2 = 80;
        goto LABEL_28;
      case 3:
        uint64_t v2 = PKWideGamutPixelFormatForCurrentDevice();
        goto LABEL_28;
      case 4:
        uint64_t v2 = 554;
        goto LABEL_28;
      default:
        uint64_t v2 = 0;
LABEL_28:
        id v14 = [v47 colorAttachments];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v13];
        [v15 setPixelFormat:v2];

        if (++v13 != 6) {
          continue;
        }
LABEL_29:
        [v47 setStencilAttachmentPixelFormat:0];
        [v47 setPipelineLibrary:*(void *)(a1 + 416)];
        unint64_t v16 = *(void *)(a1 + 232);
        if (!v16) {
          goto LABEL_50;
        }
        uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
        v17.i16[0] = vaddlv_u8(v17);
        if (v17.u32[0] > 1uLL)
        {
          uint64_t v2 = v5;
          if (v5 >= v16) {
            uint64_t v2 = v5 % v16;
          }
        }
        else
        {
          uint64_t v2 = (v16 - 1) & v5;
        }
        unint64_t v18 = *(uint64_t ***)(*(void *)(a1 + 224) + 8 * v2);
        if (!v18) {
          goto LABEL_50;
        }
        uint8x8_t v19 = *v18;
        if (!v19) {
          goto LABEL_50;
        }
        break;
    }
    break;
  }
  while (1)
  {
    unint64_t v20 = v19[1];
    if (v20 != v5) {
      break;
    }
    if (*((_DWORD *)v19 + 4) == v49 && *((unsigned __int16 *)v19 + 10) == v50) {
      goto LABEL_106;
    }
LABEL_49:
    uint8x8_t v19 = (uint64_t *)*v19;
    if (!v19) {
      goto LABEL_50;
    }
  }
  if (v17.u32[0] > 1uLL)
  {
    if (v20 >= v16) {
      v20 %= v16;
    }
  }
  else
  {
    v20 &= v16 - 1;
  }
  if (v20 == v2) {
    goto LABEL_49;
  }
LABEL_50:
  unint64_t v22 = operator new(0x20uLL);
  v23 = (void *)(a1 + 240);
  void *v22 = 0;
  v22[1] = v5;
  *((_DWORD *)v22 + 4) = v49;
  *((_WORD *)v22 + 10) = v50;
  id v24 = v47;
  v22[3] = v24;
  float v25 = (float)(unint64_t)(*(void *)(a1 + 248) + 1);
  float v26 = *(float *)(a1 + 256);
  if (!v16 || (float)(v26 * (float)v16) < v25)
  {
    BOOL v27 = (v16 & (v16 - 1)) == 0;
    if (v16 < 3) {
      BOOL v27 = 0;
    }
    unint64_t v28 = (2 * v16) | !v27;
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v16 = *(void *)(a1 + 232);
    if (*(void *)&prime <= v16)
    {
      if (*(void *)&prime < v16)
      {
        unint64_t v37 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 248) / *(float *)(a1 + 256));
        if (v16 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
        {
          unint64_t v37 = std::__next_prime(v37);
        }
        else
        {
          uint64_t v39 = 1 << -(char)__clz(v37 - 1);
          if (v37 >= 2) {
            unint64_t v37 = v39;
          }
        }
        if (*(void *)&prime <= v37) {
          int8x8_t prime = (int8x8_t)v37;
        }
        if (*(void *)&prime >= v16)
        {
          unint64_t v16 = *(void *)(a1 + 232);
        }
        else
        {
          if (prime) {
            goto LABEL_62;
          }
          unsigned __int16 v48 = *(void **)(a1 + 224);
          *(void *)(a1 + 224) = 0;
          if (v48) {
            operator delete(v48);
          }
          unint64_t v16 = 0;
          *(void *)(a1 + 232) = 0;
        }
      }
    }
    else
    {
LABEL_62:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v31 = operator new(8 * *(void *)&prime);
      v32 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v31;
      if (v32) {
        operator delete(v32);
      }
      uint64_t v33 = 0;
      *(int8x8_t *)(a1 + 232) = prime;
      do
        *(void *)(*(void *)(a1 + 224) + 8 * v33++) = 0;
      while (*(void *)&prime != v33);
      v34 = (void *)*v23;
      if (*v23)
      {
        unint64_t v35 = v34[1];
        uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
        v36.i16[0] = vaddlv_u8(v36);
        if (v36.u32[0] > 1uLL)
        {
          if (v35 >= *(void *)&prime) {
            v35 %= *(void *)&prime;
          }
        }
        else
        {
          v35 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)(a1 + 224) + 8 * v35) = v23;
        id v40 = (void *)*v34;
        if (*v34)
        {
          do
          {
            unint64_t v41 = v40[1];
            if (v36.u32[0] > 1uLL)
            {
              if (v41 >= *(void *)&prime) {
                v41 %= *(void *)&prime;
              }
            }
            else
            {
              v41 &= *(void *)&prime - 1;
            }
            if (v41 != v35)
            {
              uint64_t v42 = *(void *)(a1 + 224);
              if (!*(void *)(v42 + 8 * v41))
              {
                *(void *)(v42 + 8 * v41) = v34;
                goto LABEL_87;
              }
              void *v34 = *v40;
              *id v40 = **(void **)(*(void *)(a1 + 224) + 8 * v41);
              **(void **)(*(void *)(a1 + 224) + 8 * v41) = v40;
              id v40 = v34;
            }
            unint64_t v41 = v35;
LABEL_87:
            v34 = v40;
            id v40 = (void *)*v40;
            unint64_t v35 = v41;
          }
          while (v40);
        }
      }
      unint64_t v16 = (unint64_t)prime;
    }
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v5 >= v16) {
        uint64_t v2 = v5 % v16;
      }
      else {
        uint64_t v2 = v5;
      }
    }
    else
    {
      uint64_t v2 = (v16 - 1) & v5;
    }
  }
  uint64_t v43 = *(void *)(a1 + 224);
  unint64_t v44 = *(void **)(v43 + 8 * v2);
  if (v44)
  {
    void *v22 = *v44;
LABEL_104:
    *unint64_t v44 = v22;
    goto LABEL_105;
  }
  void *v22 = *v23;
  void *v23 = v22;
  *(void *)(v43 + 8 * v2) = v23;
  if (*v22)
  {
    unint64_t v45 = *(void *)(*v22 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v45 >= v16) {
        v45 %= v16;
      }
    }
    else
    {
      v45 &= v16 - 1;
    }
    unint64_t v44 = (void *)(*(void *)(a1 + 224) + 8 * v45);
    goto LABEL_104;
  }
LABEL_105:
  ++*(void *)(a1 + 248);
  id v47 = v24;
LABEL_106:

  return v47;
}

- (id)sixChannelShaderWithMode:(char)a3 clipping:(char)a4 erase:(char)a5 bitmapEraserMask:(char)a6 snapshotImage:(char)a7 renderMask:(char)a8 secondaryPaintEnabled:(uint64_t)a9 colorAttachmentIndex:(int)a10 pipelineConfig:(__int16)a11
{
  if (a1)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    float v26 = __Block_byref_object_copy__26;
    BOOL v27 = __Block_byref_object_dispose__26;
    id v28 = 0;
    unint64_t v11 = *(NSObject **)(a1 + 376);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __166__PKMetalResourceHandler_sixChannelShaderWithMode_clipping_erase_bitmapEraserMask_snapshotImage_renderMask_secondaryPaintEnabled_colorAttachmentIndex_pipelineConfig___block_invoke;
    v14[3] = &unk_1E64CA350;
    char v15 = a3;
    char v16 = a7;
    v14[6] = a9;
    v14[7] = a2;
    char v17 = a4;
    char v18 = a5;
    char v19 = a6;
    char v20 = a8;
    int v21 = a10;
    __int16 v22 = a11;
    v14[4] = a1;
    v14[5] = &v23;
    dispatch_sync(v11, v14);
    id v12 = (id)v24[5];
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __166__PKMetalResourceHandler_sixChannelShaderWithMode_clipping_erase_bitmapEraserMask_snapshotImage_renderMask_secondaryPaintEnabled_colorAttachmentIndex_pipelineConfig___block_invoke(uint64_t a1)
{
  HIWORD(v75) = 0;
  *(_DWORD *)((char *)&v75 + 10) = 0;
  uint64_t v2 = (int *)(a1 + 70);
  unsigned int v1 = *(_DWORD *)(a1 + 70);
  int v3 = *(unsigned __int8 *)(a1 + 64);
  unsigned int v4 = *(_DWORD *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a1 + 65);
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(unsigned __int8 *)(a1 + 66);
  int v8 = *(unsigned __int8 *)(a1 + 67);
  int v9 = *(unsigned __int8 *)(a1 + 68);
  int v10 = *(unsigned __int8 *)(a1 + 69);
  WORD4(v75) = *(_WORD *)(a1 + 74);
  uint64_t v11 = *(void *)(a1 + 32);
  LOBYTE(v74) = v3;
  BYTE1(v74) = v5;
  BYTE2(v74) = v9;
  BYTE3(v74) = v7;
  BYTE4(v74) = v8;
  BYTE5(v74) = v10;
  WORD3(v74) = 0;
  uint64_t v71 = v6;
  *((void *)&v74 + 1) = v6;
  *(void *)&long long v75 = __PAIR64__(v1, v4);
  if (v11)
  {
    unint64_t v12 = PKHashBytes((uint64_t)&v74, 32);
    unint64_t v13 = v12;
    int8x8_t v14 = *(int8x8_t *)(v11 + 152);
    if (v14)
    {
      uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
      v15.i16[0] = vaddlv_u8(v15);
      if (v15.u32[0] > 1uLL)
      {
        unint64_t v16 = v12;
        if (v12 >= *(void *)&v14) {
          unint64_t v16 = v12 % *(void *)&v14;
        }
      }
      else
      {
        unint64_t v16 = (*(void *)&v14 - 1) & v12;
      }
      char v17 = *(uint64_t ****)(*(void *)(v11 + 144) + 8 * v16);
      if (v17)
      {
        for (i = *v17; i; i = (uint64_t **)*i)
        {
          unint64_t v19 = (unint64_t)i[1];
          if (v19 == v12)
          {
            if (i[2] == (uint64_t *)v74
              && i[3] == *((uint64_t **)&v74 + 1)
              && i[4] == (uint64_t *)v75
              && i[5] == *((uint64_t **)&v75 + 1))
            {
              int v68 = i[6];
              goto LABEL_132;
            }
          }
          else
          {
            if (v15.u32[0] > 1uLL)
            {
              if (v19 >= *(void *)&v14) {
                v19 %= *(void *)&v14;
              }
            }
            else
            {
              v19 &= *(void *)&v14 - 1;
            }
            if (v19 != v16) {
              break;
            }
          }
        }
      }
    }
    unsigned int v70 = v4;
    unsigned int v76 = *v2;
    unsigned __int16 v77 = *((_WORD *)v2 + 2);
    id v73 = objc_alloc_init(MEMORY[0x1E4F35228]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F35228]);
    char v84 = 1;
    if (v3)
    {
      [v73 setConstantValue:&v84 type:53 atIndex:1];
      [v23 setConstantValue:&v84 type:53 atIndex:1];
    }
    if (v9) {
      [v23 setConstantValue:&v84 type:53 atIndex:3];
    }
    if (v5) {
      [v23 setConstantValue:&v84 type:53 atIndex:2];
    }
    if (*(unsigned char *)(v11 + 428)) {
      [v23 setConstantValue:&v84 type:53 atIndex:7];
    }
    if (v7) {
      [v23 setConstantValue:&v84 type:53 atIndex:0];
    }
    if (v10) {
      [v23 setConstantValue:&v84 type:53 atIndex:8];
    }
    if (v8) {
      [v23 setConstantValue:&v84 type:53 atIndex:9];
    }
    if ((unint64_t)(v71 - 1) <= 2) {
      [v23 setConstantValue:&v84 type:53 atIndex:qword_1C482B648[v71 - 1]];
    }
    unsigned int v83 = v70;
    [v23 setConstantValue:&v83 type:33 atIndex:6];
    id v24 = *(void **)(v11 + 304);
    v78[0] = 0;
    unint64_t v25 = (unint64_t)v73;
    float v26 = (void *)[v24 newFunctionWithName:@"sixChannelBlend_vertex" constantValues:v73 error:v78];
    id v27 = v78[0];
    id v28 = *(void **)(v11 + 304);
    id v82 = 0;
    unint64_t v29 = (void *)[v28 newFunctionWithName:@"sixChannelBlend_fragment" constantValues:v23 error:&v82];
    id v30 = v82;
    if (!v26 || !v29) {
      objc_exception_throw(@"Failed to compile shader");
    }
    unsigned __int16 v81 = v77;
    unsigned int v80 = v76;
    uint64_t v31 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](v11, v76 | ((unint64_t)v77 << 32));
    v32 = [PKMetalShader alloc];
    for (uint64_t j = 0; j != 6; ++j)
    {
      if (!*((unsigned char *)&v80 + j)) {
        break;
      }
    }
    int v68 = (uint64_t *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v32, v26, v29, 0, v83, v31, j);

    unint64_t v34 = *(void *)(v11 + 152);
    if (v34)
    {
      uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v34);
      v35.i16[0] = vaddlv_u8(v35);
      if (v35.u32[0] > 1uLL)
      {
        unint64_t v25 = v13;
        if (v13 >= v34) {
          unint64_t v25 = v13 % v34;
        }
      }
      else
      {
        unint64_t v25 = (v34 - 1) & v13;
      }
      uint8x8_t v36 = *(void **)(*(void *)(v11 + 144) + 8 * v25);
      if (v36)
      {
        for (k = (void *)*v36; k; k = (void *)*k)
        {
          unint64_t v38 = k[1];
          if (v38 == v13)
          {
            if (k[2] == (void)v74
              && k[3] == *((void *)&v74 + 1)
              && k[4] == (void)v75
              && k[5] == *((void *)&v75 + 1))
            {
              goto LABEL_132;
            }
          }
          else
          {
            if (v35.u32[0] > 1uLL)
            {
              if (v38 >= v34) {
                v38 %= v34;
              }
            }
            else
            {
              v38 &= v34 - 1;
            }
            if (v38 != v25) {
              break;
            }
          }
        }
      }
    }
    uint64_t v42 = operator new(0x38uLL);
    uint64_t v43 = (void *)(v11 + 160);
    v78[0] = v42;
    v78[1] = (id)(v11 + 160);
    *uint64_t v42 = 0;
    v42[1] = v13;
    long long v44 = v75;
    *((_OWORD *)v42 + 1) = v74;
    *((_OWORD *)v42 + 2) = v44;
    int v68 = v68;
    v42[6] = v68;
    char v79 = 1;
    float v45 = (float)(unint64_t)(*(void *)(v11 + 168) + 1);
    float v46 = *(float *)(v11 + 176);
    if (v34 && (float)(v46 * (float)v34) >= v45) {
      goto LABEL_122;
    }
    BOOL v47 = (v34 & (v34 - 1)) == 0;
    if (v34 < 3) {
      BOOL v47 = 0;
    }
    unint64_t v48 = (2 * v34) | !v47;
    unint64_t v49 = vcvtps_u32_f32(v45 / v46);
    if (v48 <= v49) {
      int8x8_t prime = (int8x8_t)v49;
    }
    else {
      int8x8_t prime = (int8x8_t)v48;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v34 = *(void *)(v11 + 152);
    if (*(void *)&prime > v34) {
      goto LABEL_88;
    }
    if (*(void *)&prime < v34)
    {
      unint64_t v57 = vcvtps_u32_f32((float)*(unint64_t *)(v11 + 168) / *(float *)(v11 + 176));
      if (v34 < 3 || (uint8x8_t v58 = (uint8x8_t)vcnt_s8((int8x8_t)v34), v58.i16[0] = vaddlv_u8(v58), v58.u32[0] > 1uLL))
      {
        unint64_t v57 = std::__next_prime(v57);
      }
      else
      {
        uint64_t v59 = 1 << -(char)__clz(v57 - 1);
        if (v57 >= 2) {
          unint64_t v57 = v59;
        }
      }
      if (*(void *)&prime <= v57) {
        int8x8_t prime = (int8x8_t)v57;
      }
      if (*(void *)&prime >= v34)
      {
        unint64_t v34 = *(void *)(v11 + 152);
      }
      else
      {
        if (prime)
        {
LABEL_88:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v51 = operator new(8 * *(void *)&prime);
          v52 = *(void **)(v11 + 144);
          *(void *)(v11 + 144) = v51;
          if (v52) {
            operator delete(v52);
          }
          uint64_t v53 = 0;
          *(int8x8_t *)(v11 + 152) = prime;
          do
            *(void *)(*(void *)(v11 + 144) + 8 * v53++) = 0;
          while (*(void *)&prime != v53);
          uint64_t v54 = (void *)*v43;
          if (*v43)
          {
            unint64_t v55 = v54[1];
            uint8x8_t v56 = (uint8x8_t)vcnt_s8(prime);
            v56.i16[0] = vaddlv_u8(v56);
            if (v56.u32[0] > 1uLL)
            {
              if (v55 >= *(void *)&prime) {
                v55 %= *(void *)&prime;
              }
            }
            else
            {
              v55 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v11 + 144) + 8 * v55) = v43;
            int v60 = (void *)*v54;
            if (*v54)
            {
              do
              {
                unint64_t v61 = v60[1];
                if (v56.u32[0] > 1uLL)
                {
                  if (v61 >= *(void *)&prime) {
                    v61 %= *(void *)&prime;
                  }
                }
                else
                {
                  v61 &= *(void *)&prime - 1;
                }
                if (v61 != v55)
                {
                  uint64_t v62 = *(void *)(v11 + 144);
                  if (!*(void *)(v62 + 8 * v61))
                  {
                    *(void *)(v62 + 8 * v61) = v54;
                    goto LABEL_113;
                  }
                  *uint64_t v54 = *v60;
                  *int v60 = **(void **)(*(void *)(v11 + 144) + 8 * v61);
                  **(void **)(*(void *)(v11 + 144) + 8 * v61) = v60;
                  int v60 = v54;
                }
                unint64_t v61 = v55;
LABEL_113:
                uint64_t v54 = v60;
                int v60 = (void *)*v60;
                unint64_t v55 = v61;
              }
              while (v60);
            }
          }
          unint64_t v34 = (unint64_t)prime;
          goto LABEL_117;
        }
        int v69 = *(void **)(v11 + 144);
        *(void *)(v11 + 144) = 0;
        if (v69) {
          operator delete(v69);
        }
        unint64_t v34 = 0;
        *(void *)(v11 + 152) = 0;
      }
    }
LABEL_117:
    if ((v34 & (v34 - 1)) != 0)
    {
      if (v13 >= v34) {
        unint64_t v25 = v13 % v34;
      }
      else {
        unint64_t v25 = v13;
      }
    }
    else
    {
      unint64_t v25 = (v34 - 1) & v13;
    }
LABEL_122:
    uint64_t v63 = *(void **)(*(void *)(v11 + 144) + 8 * v25);
    if (v63)
    {
      *(void *)v78[0] = *v63;
      *uint64_t v63 = v78[0];
      uint64_t v64 = a1;
    }
    else
    {
      *(void *)v78[0] = *(void *)(v11 + 160);
      *(id *)(v11 + 160) = v78[0];
      *(void *)(*(void *)(v11 + 144) + 8 * v25) = v43;
      uint64_t v64 = a1;
      if (*(void *)v78[0])
      {
        unint64_t v65 = *(void *)(*(void *)v78[0] + 8);
        if ((v34 & (v34 - 1)) != 0)
        {
          if (v65 >= v34) {
            v65 %= v34;
          }
        }
        else
        {
          v65 &= v34 - 1;
        }
        *(id *)(*(void *)(v11 + 144) + 8 * v65) = v78[0];
      }
    }
    v78[0] = 0;
    ++*(void *)(v11 + 168);
    goto LABEL_131;
  }
  int v68 = 0;
LABEL_132:
  uint64_t v64 = a1;
LABEL_131:
  uint64_t v66 = *(void *)(*(void *)(v64 + 40) + 8);
  v67 = *(void **)(v66 + 40);
  *(void *)(v66 + 40) = v68;
}

void __61__PKMetalResourceHandler__createSDFPenMaxHeightLookupTexture__block_invoke(uint64_t a1)
{
  std::vector<float>::resize(qword_1EB3C61D0, 0x200uLL);
  uint64_t v2 = 0;
  uint64_t v3 = qword_1EB3C61D0[0];
  do
  {
    memset(&v18, 0, sizeof(v18));
    double v16 = (double)v2 * 3.14159265 / 511.0;
    CGAffineTransformMakeRotation(&v18, v16);
    uint64_t v4 = 0;
    double v5 = *(float *)(a1 + 32);
    double b = v18.b;
    double d = v18.d;
    double v8 = 0.0;
    double ty = v18.ty;
    double v17 = 0.0;
    do
    {
      __double2 v10 = __sincos_stret((double)v4 * 3.14159265 / 511.0);
      double v11 = v10.__sinval * v5;
      double v12 = ty + d * (v10.__sinval * v5) + b * v10.__cosval;
      if (v12 >= 0.0) {
        double v13 = ty + d * v11 + b * v10.__cosval;
      }
      else {
        double v13 = -v12;
      }
      if (v13 > v8)
      {
        double v17 = atan2(v11, v10.__cosval);
        double v8 = v13;
      }
      ++v4;
    }
    while (v4 != 512);
    double v14 = v16 + v17;
    if (v16 + v17 > 3.14159265) {
      double v14 = v16 + v17 + -3.14159265;
    }
    float v15 = v14;
    *(float *)(v3 + 4 * v2++) = v15;
  }
  while (v2 != 512);
}

- (id)_createSDFPenEllipseLookupTexture
{
  unsigned int v1 = a1;
  if (a1)
  {
    uint64_t v2 = [PKInk alloc];
    uint64_t v3 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v4 = [(PKInk *)v2 initWithInkType:@"com.apple.ink.fountainpen" color:v3];

    double v5 = [(PKInk *)v4 behavior];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 inkTransform];
      float v7 = *((double *)&v16 + 1);
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      float v7 = 0.0;
    }

    double v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:512 height:1 mipmapped:0];
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3C6198, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EB3C6198))
    {
      __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], &qword_1EB3C61E8, &dword_1C44F8000);
      __cxa_guard_release(&qword_1EB3C6198);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PKMetalResourceHandler__createSDFPenEllipseLookupTexture__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    float v14 = v7;
    if (qword_1EB3C61A0 != -1) {
      dispatch_once(&qword_1EB3C61A0, block);
    }
    unsigned int v1 = (id *)[v1[54] newTextureWithDescriptor:v8];
    memset(v10, 0, sizeof(v10));
    long long v11 = xmmword_1C482B5A0;
    uint64_t v12 = 1;
    [v1 replaceRegion:v10 mipmapLevel:0 withBytes:qword_1EB3C61E8 bytesPerRow:2048];
  }

  return v1;
}

void __59__PKMetalResourceHandler__createSDFPenEllipseLookupTexture__block_invoke(uint64_t a1)
{
  std::vector<float>::resize(&qword_1EB3C61E8, 0x200uLL);
  uint64_t v2 = 0;
  __asm { FMOV            V1.2S, #1.0 }
  _D1.i32[1] = *(_DWORD *)(a1 + 32);
  float32x2_t v22 = _D1;
  float32x2_t v8 = vdiv_f32(0, _D1);
  float v9 = vaddv_f32(vmul_f32(v8, v8)) + -1.0;
  uint64_t v10 = qword_1EB3C61E8;
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    __double2 v13 = __sincos_stret((double)v2 * 3.14159265 / 511.0);
    v12.f64[0] = v13.__cosval;
    v12.f64[1] = v13.__sinval;
    float32x2_t v14 = vcvt_f32_f64(v12);
    *(float32x2_t *)&v12.f64[0] = vdiv_f32(v14, v22);
    float v15 = vaddv_f32(vmul_f32(*(float32x2_t *)&v12.f64[0], *(float32x2_t *)&v12.f64[0]));
    float v16 = vaddv_f32(vmul_f32(v8, *(float32x2_t *)&v12.f64[0]));
    float v17 = (float)(v16 * v16) - (float)(v15 * v9);
    float32x2_t v18 = 0;
    if (v17 >= 0.0)
    {
      float v19 = sqrtf(v17);
      float v20 = fmaxf((float)((float)-v16 - v19) / v15, (float)(v19 - v16) / v15);
      if (v20 >= 0.0) {
        float32x2_t v18 = vmla_n_f32(0, v14, v20);
      }
    }
    float32x2_t v21 = vsub_f32(v14, v18);
    *(float *)(v10 + 4 * v2++) = 1.0 - sqrtf(vaddv_f32(vmul_f32(v21, v21)));
  }
  while (v2 != 512);
}

- (id)sdfPenMaxHeightLookupTexture
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    float32x2_t v8 = __Block_byref_object_copy__26;
    float v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__PKMetalResourceHandler_sdfPenMaxHeightLookupTexture__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __54__PKMetalResourceHandler_sdfPenMaxHeightLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    id v4 = -[PKMetalResourceHandler _createSDFPenEllipseLookupTexture]((id *)v2);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [PKInk alloc];
    uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
    float32x2_t v8 = [(PKInk *)v6 initWithInkType:@"com.apple.ink.fountainpen" color:v7];

    float v9 = [(PKInk *)v8 behavior];
    id v10 = v9;
    if (v9)
    {
      [v9 inkTransform];
      float v11 = *((double *)&v18[1] + 1);
    }
    else
    {
      memset(v18, 0, sizeof(v18));
      float v11 = 0.0;
    }

    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3C6188, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EB3C6188))
    {
      __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], qword_1EB3C61D0, &dword_1C44F8000);
      __cxa_guard_release(&qword_1EB3C6188);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKMetalResourceHandler__createSDFPenMaxHeightLookupTexture__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    float v17 = v11;
    if (qword_1EB3C6190 != -1) {
      dispatch_once(&qword_1EB3C6190, block);
    }
    float64x2_t v12 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:512 height:1 mipmapped:0];
    __double2 v13 = (void *)[*(id *)(v5 + 432) newTextureWithDescriptor:v12];
    memset(v18, 0, 24);
    *(_OWORD *)((char *)&v18[1] + 8) = xmmword_1C482B5A0;
    *((void *)&v18[2] + 1) = 1;
    [v13 replaceRegion:v18 mipmapLevel:0 withBytes:qword_1EB3C61D0[0] bytesPerRow:2048];

    uint64_t v14 = *(void *)(a1 + 32);
    float v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (id)sdfPenEllipseLookupTexture
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    float32x2_t v8 = __Block_byref_object_copy__26;
    float v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__PKMetalResourceHandler_sdfPenEllipseLookupTexture__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __52__PKMetalResourceHandler_sdfPenEllipseLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  if (!v3)
  {
    uint64_t v4 = -[PKMetalResourceHandler _createSDFPenEllipseLookupTexture]((id *)v2);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (id)kernelPipelineStateForKey:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v7 = 0;
    float32x2_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__26;
    float v11 = __Block_byref_object_dispose__26;
    id v12 = 0;
    uint64_t v2 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PKMetalResourceHandler_kernelPipelineStateForKey___block_invoke;
    block[3] = &unk_1E64CA398;
    void block[4] = a1;
    block[5] = &v7;
    __int16 v6 = a2;
    dispatch_sync(v2, block);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __52__PKMetalResourceHandler_kernelPipelineStateForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](*(void *)(a1 + 32), *(_WORD *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)particleShaderKernelPipelineStateWithVariableSpacing:(int)a3 particleMasks:
{
  if (a1)
  {
    __int16 v4 = 256;
    if (!a3) {
      __int16 v4 = 0;
    }
    a1 = -[PKMetalResourceHandler kernelPipelineStateForKey:]((uint64_t)a1, v4 | a2);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)paintShaderKernelPipelineState
{
  if (a1)
  {
    uint64_t v5 = 0;
    __int16 v6 = &v5;
    uint64_t v7 = 0x3032000000;
    float32x2_t v8 = __Block_byref_object_copy__26;
    uint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__PKMetalResourceHandler_paintShaderKernelPipelineState__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __56__PKMetalResourceHandler_paintShaderKernelPipelineState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    uint64_t v4 = -[PKMetalResourceHandler newPaintShaderKernelPipelineState](v2);
    uint64_t v5 = *(void *)(a1 + 32);
    __int16 v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (id)sdfPenShaderKernelPipelineState
{
  if (a1)
  {
    uint64_t v5 = 0;
    __int16 v6 = &v5;
    uint64_t v7 = 0x3032000000;
    float32x2_t v8 = __Block_byref_object_copy__26;
    uint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__PKMetalResourceHandler_sdfPenShaderKernelPipelineState__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __57__PKMetalResourceHandler_sdfPenShaderKernelPipelineState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F35228]);
    uint64_t v5 = -[PKMetalResourceHandler newComputePipelineDescriptor](v2);
    [v5 setLabel:@"Fountain Pen kernel"];
    __int16 v6 = (void *)[*(id *)(v2 + 304) newFunctionWithName:@"sdfPen_kernel" constantValues:v4 error:0];
    [v5 setComputeFunction:v6];

    uint64_t v7 = [*(id *)(v2 + 432) newComputePipelineStateWithDescriptor:v5 options:0 reflection:0 error:0];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v10, v3);
}

- (id)paintShaderKernelPipelineStateWithLiveStrokeParticles
{
  if (a1)
  {
    uint64_t v5 = 0;
    __int16 v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__26;
    uint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __79__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeParticles__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __79__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeParticles__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[8];
  if (!v3)
  {
    uint64_t v4 = -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:](v2, 1);
    uint64_t v5 = *(void *)(a1 + 32);
    __int16 v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (id)paintShaderKernelPipelineStateWithLiveStrokeMode
{
  if (a1)
  {
    uint64_t v5 = 0;
    __int16 v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__26;
    uint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __74__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeMode__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __74__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeMode__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[7];
  if (!v3)
  {
    uint64_t v4 = -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:](v2, 0);
    uint64_t v5 = *(void *)(a1 + 32);
    __int16 v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (id)namedShaderForKey:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v10 = 0;
    float v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __double2 v13 = __Block_byref_object_copy__26;
    uint64_t v14 = __Block_byref_object_dispose__26;
    id v15 = 0;
    id v2 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PKMetalResourceHandler_namedShaderForKey___block_invoke;
    block[3] = &unk_1E64CA3C0;
    void block[4] = a1;
    block[5] = &v10;
    long long v3 = a2[1];
    long long v7 = *a2;
    long long v8 = v3;
    uint64_t v9 = *((void *)a2 + 4);
    dispatch_sync(v2, block);
    id v4 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __44__PKMetalResourceHandler_namedShaderForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v4 = -[PKMetalResourceHandler _namedShaderForKey:](v2, (uint64_t)v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (uint64_t)_namedShaderForKey:(uint64_t)a1
{
  if (!a1)
  {
LABEL_21:
    float v17 = 0;
    goto LABEL_194;
  }
  unint64_t v5 = PKHashBytes(a2, 40);
  int8x8_t v6 = *(int8x8_t *)(a1 + 192);
  if (v6)
  {
    unint64_t v7 = v5;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    unint64_t v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v10 = v5;
      if (v5 >= *(void *)&v6) {
        unint64_t v10 = v5 % *(void *)&v6;
      }
    }
    else
    {
      unint64_t v10 = (*(void *)&v6 - 1) & v5;
    }
    float v11 = *(uint64_t ****)(*(void *)(a1 + 184) + 8 * v10);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        uint64_t v2 = *(void *)&v6 - 1;
        do
        {
          unint64_t v13 = (unint64_t)v12[1];
          if (v13 == v7)
          {
            if (PKNamedShaderKey::operator==((uint64_t)(v12 + 2), a2))
            {
              float v17 = v12[7];
              goto LABEL_194;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(void *)&v6) {
                v13 %= *(void *)&v6;
              }
            }
            else
            {
              v13 &= v2;
            }
            if (v13 != v10) {
              break;
            }
          }
          uint64_t v12 = (uint64_t **)*v12;
        }
        while (v12);
      }
    }
  }
  int v14 = 0;
  int v15 = 1;
  uint64_t v16 = 1;
  switch(*(void *)a2)
  {
    case 1:
      LOBYTE(v15) = 0;
      uint64_t v16 = -1;
      goto LABEL_52;
    case 2:
      uint64_t v16 = 0;
      LOBYTE(v15) = 1;
      goto LABEL_52;
    case 3:
      int v14 = 0;
      int v15 = 0;
      goto LABEL_71;
    case 4:
      goto LABEL_71;
    case 5:
      int v15 = 0;
      int v14 = 1;
LABEL_71:
      unsigned int v80 = *(_DWORD *)(a2 + 8);
      uint64_t v81 = *(void *)(a2 + 24);
      uint64_t v82 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v83 = *(unsigned int *)(a2 + 32);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v80;
      int v158 = v83;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v21 setConstantValue:&v157 type:33 atIndex:1];
      LOBYTE(v156) = 1;
      if (v14) {
        [v21 setConstantValue:&v156 type:53 atIndex:2];
      }
      if (v15) {
        [v21 setConstantValue:&v156 type:53 atIndex:4];
      }
      char v84 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v84 newFunctionWithName:@"particle_vertex" constantValues:v21 error:&v154];
      id v85 = v154;
      uint64_t v86 = *(void **)(a1 + 304);
      id v153 = v85;
      float v26 = (void *)[v86 newFunctionWithName:@"particle_fragment" constantValues:v21 error:&v153];
      id v27 = v153;

      if (!v23 || !v26) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v83 | (v82 << 32));
      uint64_t v87 = [PKMetalShader alloc];
      uint64_t v88 = 0;
      if (v81 == 1) {
        uint64_t v89 = 1;
      }
      else {
        uint64_t v89 = 2;
      }
      do
      {
        if (!*((unsigned char *)&v158 + v88)) {
          break;
        }
        ++v88;
      }
      while (v88 != 6);
      uint64_t v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v87, v23, v26, v89, v157, (void *)v2, v88);
      goto LABEL_109;
    case 6:
      uint64_t v101 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v102 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v102;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      LOBYTE(v158) = 1;
      [v21 setConstantValue:&v158 type:53 atIndex:4];
      [v21 setConstantValue:&v158 type:53 atIndex:2];
      uint64_t v103 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v103 newFunctionWithName:@"uber_vertex" constantValues:v21 error:&v154];
      id v27 = v154;
      uint64_t v104 = [*(id *)(a1 + 304) newFunctionWithName:@"paper_fragment"];
      float v26 = (void *)v104;
      if (!v23 || !v104) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v102 | (v101 << 32));
      int v105 = [PKMetalShader alloc];
      for (uint64_t i = 0; i != 6; ++i)
      {
        if (!*((unsigned char *)&v153 + i)) {
          break;
        }
      }
      if (v105)
      {
        uint64_t v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v105, v23, v26, 0, 0x7FFFFFFFFFFFFFFFLL, (void *)v2, i);
LABEL_109:
        float v17 = (uint64_t *)v31;
      }
      else
      {
        float v17 = 0;
      }

LABEL_111:
      if (!v17) {
        goto LABEL_194;
      }
LABEL_112:
      unint64_t v113 = PKHashBytes(a2, 40);
      unint64_t v114 = v113;
      unint64_t v115 = *(void *)(a1 + 192);
      if (!v115) {
        goto LABEL_129;
      }
      uint8x8_t v116 = (uint8x8_t)vcnt_s8((int8x8_t)v115);
      v116.i16[0] = vaddlv_u8(v116);
      unint64_t v117 = v116.u32[0];
      if (v116.u32[0] > 1uLL)
      {
        uint64_t v2 = v113;
        if (v113 >= v115) {
          uint64_t v2 = v113 % v115;
        }
      }
      else
      {
        uint64_t v2 = (v115 - 1) & v113;
      }
      v118 = *(void **)(*(void *)(a1 + 184) + 8 * v2);
      if (!v118) {
        goto LABEL_129;
      }
      v119 = (void *)*v118;
      if (!*v118) {
        goto LABEL_129;
      }
      break;
    case 7:
      unsigned int v70 = *(_DWORD *)(a2 + 8);
      uint64_t v71 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v72 = *(unsigned int *)(a2 + 32);
      int v73 = *(unsigned __int8 *)(a2 + 17);
      int v74 = *(unsigned __int8 *)(a2 + 18);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v70;
      int v158 = v72;
      id v47 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v47 setConstantValue:&v157 type:33 atIndex:1];
      id v48 = objc_alloc_init(MEMORY[0x1E4F35228]);
      LOBYTE(v156) = 1;
      [v48 setConstantValue:&v156 type:53 atIndex:4];
      if (v73) {
        [v47 setConstantValue:&v156 type:53 atIndex:2];
      }
      if (v74) {
        [v47 setConstantValue:&v156 type:53 atIndex:3];
      }
      long long v75 = *(void **)(a1 + 304);
      id v154 = 0;
      unsigned __int16 v50 = (void *)[v75 newFunctionWithName:@"uber_vertex" constantValues:v48 error:&v154];
      id v76 = v154;
      unsigned __int16 v77 = *(void **)(a1 + 304);
      id v153 = v76;
      uint64_t v2 = [v77 newFunctionWithName:@"blit_fragment" constantValues:v47 error:&v153];
      id v53 = v153;

      if (!v50 || !v2) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v54 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v72 | (v71 << 32));
      for (uint64_t j = 0; j != 6; ++j)
      {
        if (!*((unsigned char *)&v158 + j)) {
          break;
        }
      }
      char v79 = [PKMetalShader alloc];
      uint64_t v57 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v79, v50, (void *)v2, 0, v157, v54, j);
      goto LABEL_93;
    case 8:
      uint64_t v139 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v140 = *(unsigned int *)(a2 + 32);
      WORD2(v154) = *(_WORD *)(a2 + 36);
      LODWORD(v154) = v140;
      id v21 = (id)[*(id *)(a1 + 304) newFunctionWithName:@"lines_vertex"];
      uint64_t v141 = [*(id *)(a1 + 304) newFunctionWithName:@"lines_fragment"];
      id v35 = (id)v141;
      if (!v21 || !v141) {
        objc_exception_throw(@"Failed to compile shader");
      }
      v142 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v140 | (v139 << 32));
      for (uint64_t k = 0; k != 6; ++k)
      {
        if (!*((unsigned char *)&v154 + k)) {
          break;
        }
      }
      v144 = [PKMetalShader alloc];
      if (v144) {
        float v17 = (uint64_t *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v144, v21, v35, 0, 0x7FFFFFFFFFFFFFFFLL, v142, k);
      }
      else {
        float v17 = 0;
      }

      goto LABEL_163;
    case 9:
      uint64_t v58 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v59 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v59;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      LOBYTE(v158) = 1;
      [v21 setConstantValue:&v158 type:53 atIndex:4];
      int v60 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v60 newFunctionWithName:@"uber_vertex" constantValues:v21 error:&v154];
      id v27 = v154;
      uint64_t v61 = [*(id *)(a1 + 304) newFunctionWithName:@"paint_circle_fragment"];
      float v26 = (void *)v61;
      if (!v23 || !v61) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v59 | (v58 << 32));
      uint64_t v62 = [PKMetalShader alloc];
      for (uint64_t m = 0; m != 6; ++m)
      {
        if (!*((unsigned char *)&v153 + m)) {
          break;
        }
      }
      uint64_t v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v62, v23, v26, 2, 3, (void *)v2, m);
      goto LABEL_109;
    case 0xALL:
      uint64_t v107 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v108 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v108;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      LOBYTE(v158) = 1;
      [v21 setConstantValue:&v158 type:53 atIndex:4];
      int v109 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v109 newFunctionWithName:@"paint_vertex" constantValues:v21 error:&v154];
      id v27 = v154;
      uint64_t v110 = [*(id *)(a1 + 304) newFunctionWithName:@"fill_white"];
      float v26 = (void *)v110;
      if (!v23 || !v110) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v108 | (v107 << 32));
      id v111 = [PKMetalShader alloc];
      for (uint64_t n = 0; n != 6; ++n)
      {
        if (!*((unsigned char *)&v153 + n)) {
          break;
        }
      }
      uint64_t v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v111, v23, v26, 5, 0, (void *)v2, n);
      goto LABEL_109;
    case 0xBLL:
      unsigned int v32 = *(_DWORD *)(a2 + 8);
      uint64_t v33 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v34 = *(unsigned int *)(a2 + 32);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v32;
      int v158 = v34;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      id v35 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v35 setConstantValue:&v157 type:33 atIndex:1];
      LOBYTE(v156) = 1;
      [v21 setConstantValue:&v156 type:53 atIndex:4];
      uint8x8_t v36 = *(void **)(a1 + 304);
      id v154 = 0;
      unint64_t v37 = (void *)[v36 newFunctionWithName:@"uber_vertex" constantValues:v21 error:&v154];
      id v38 = v154;
      uint64_t v39 = *(void **)(a1 + 304);
      id v153 = v38;
      uint64_t v2 = [v39 newFunctionWithName:@"erase_fragment" constantValues:v35 error:&v153];
      id v40 = v153;

      if (!v37 || !v2) {
        objc_exception_throw(@"Failed to compile shader");
      }
      unint64_t v41 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v34 | (v33 << 32));
      uint64_t v42 = [PKMetalShader alloc];
      for (uint64_t ii = 0; ii != 6; ++ii)
      {
        if (!*((unsigned char *)&v158 + ii)) {
          break;
        }
      }
      if (v42) {
        float v17 = (uint64_t *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v42, v37, (void *)v2, 0, 0x7FFFFFFFFFFFFFFFLL, v41, ii);
      }
      else {
        float v17 = 0;
      }

LABEL_163:
      goto LABEL_111;
    case 0xCLL:
      unsigned int v44 = *(_DWORD *)(a2 + 8);
      uint64_t v45 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v46 = *(unsigned int *)(a2 + 32);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v44;
      int v158 = v46;
      LOBYTE(v156) = 1;
      id v47 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v47 setConstantValue:&v156 type:53 atIndex:4];
      [v47 setConstantValue:&v156 type:53 atIndex:2];
      id v48 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v48 setConstantValue:&v157 type:33 atIndex:1];
      unint64_t v49 = *(void **)(a1 + 304);
      id v154 = 0;
      unsigned __int16 v50 = (void *)[v49 newFunctionWithName:@"uber_vertex" constantValues:v47 error:&v154];
      id v51 = v154;
      v52 = *(void **)(a1 + 304);
      id v153 = v51;
      uint64_t v2 = [v52 newFunctionWithName:@"fill_color" constantValues:v48 error:&v153];
      id v53 = v153;

      if (!v50 || !v2) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v54 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v46 | (v45 << 32));
      for (juint64_t j = 0; jj != 6; ++jj)
      {
        if (!*((unsigned char *)&v158 + jj)) {
          break;
        }
      }
      uint8x8_t v56 = [PKMetalShader alloc];
      if (v56)
      {
        uint64_t v57 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v56, v50, (void *)v2, 0, 0x7FFFFFFFFFFFFFFFLL, v54, jj);
LABEL_93:
        float v17 = (uint64_t *)v57;
      }
      else
      {
        float v17 = 0;
      }

      if (!v17) {
        goto LABEL_194;
      }
      goto LABEL_112;
    case 0xDLL:
      unsigned int v91 = *(_DWORD *)(a2 + 8);
      unsigned int v90 = *(_DWORD *)(a2 + 12);
      uint64_t v92 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v93 = *(unsigned int *)(a2 + 32);
      int v94 = *(unsigned __int8 *)(a2 + 17);
      int v95 = *(unsigned __int8 *)(a2 + 18);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v90;
      int v158 = v93;
      unsigned int v156 = v91;
      id v47 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v47 setConstantValue:&v157 type:33 atIndex:1];
      [v47 setConstantValue:&v156 type:33 atIndex:2];
      id v48 = objc_alloc_init(MEMORY[0x1E4F35228]);
      char v155 = 1;
      [v48 setConstantValue:&v155 type:53 atIndex:4];
      if (v94) {
        [v47 setConstantValue:&v155 type:53 atIndex:3];
      }
      if (v95) {
        [v47 setConstantValue:&v155 type:53 atIndex:4];
      }
      int v96 = *(void **)(a1 + 304);
      id v154 = 0;
      unsigned __int16 v50 = (void *)[v96 newFunctionWithName:@"uber_vertex" constantValues:v48 error:&v154];
      id v97 = v154;
      uint64_t v98 = *(void **)(a1 + 304);
      id v153 = v97;
      uint64_t v2 = [v98 newFunctionWithName:@"copy_framebuffer_fragment" constantValues:v47 error:&v153];
      id v53 = v153;

      if (!v50 || !v2) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v54 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v93 | (v92 << 32));
      for (uint64_t kk = 0; kk != 6; ++kk)
      {
        if (!*((unsigned char *)&v158 + kk)) {
          break;
        }
      }
      uint64_t v100 = [PKMetalShader alloc];
      uint64_t v57 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v100, v50, (void *)v2, 0, v156, v54, kk);
      goto LABEL_93;
    case 0xELL:
      unsigned int v18 = *(_DWORD *)(a2 + 8);
      uint64_t v19 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v20 = *(unsigned int *)(a2 + 32);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v18;
      int v158 = v20;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v21 setConstantValue:&v157 type:33 atIndex:1];
      float32x2_t v22 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v22 newFunctionWithName:@"sdfPen_vertex" constantValues:v21 error:&v154];
      id v24 = v154;
      unint64_t v25 = *(void **)(a1 + 304);
      id v153 = v24;
      float v26 = (void *)[v25 newFunctionWithName:@"sdfPen_fragment" constantValues:v21 error:&v153];
      id v27 = v153;

      if (!v23 || !v26) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v20 | (v19 << 32));
      id v28 = [PKMetalShader alloc];
      uint64_t v29 = 0;
      uint64_t v30 = v157;
      do
      {
        if (!*((unsigned char *)&v158 + v29)) {
          break;
        }
        ++v29;
      }
      while (v29 != 6);
      goto LABEL_27;
    case 0xFLL:
      goto LABEL_52;
    case 0x10:
      LOBYTE(v15) = 1;
      uint64_t v16 = 2;
LABEL_52:
      unsigned int v64 = *(_DWORD *)(a2 + 8);
      uint64_t v65 = *(unsigned __int16 *)(a2 + 36);
      uint64_t v66 = *(unsigned int *)(a2 + 32);
      __int16 v159 = *(_WORD *)(a2 + 36);
      unsigned int v157 = v64;
      int v158 = v66;
      id v21 = objc_alloc_init(MEMORY[0x1E4F35228]);
      [v21 setConstantValue:&v157 type:33 atIndex:1];
      LOBYTE(v156) = 1;
      if (v15) {
        [v21 setConstantValue:&v156 type:53 atIndex:qword_1C482B660[v16]];
      }
      v67 = *(void **)(a1 + 304);
      id v154 = 0;
      id v23 = (void *)[v67 newFunctionWithName:@"paint_vertex" constantValues:v21 error:&v154];
      id v68 = v154;
      int v69 = *(void **)(a1 + 304);
      id v153 = v68;
      float v26 = (void *)[v69 newFunctionWithName:@"paint_fragment" constantValues:v21 error:&v153];
      id v27 = v153;

      if (!v23 || !v26) {
        objc_exception_throw(@"Failed to compile shader");
      }
      uint64_t v2 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v66 | (v65 << 32));
      id v28 = [PKMetalShader alloc];
      uint64_t v29 = 0;
      uint64_t v30 = v157;
      do
      {
        if (!*((unsigned char *)&v158 + v29)) {
          break;
        }
        ++v29;
      }
      while (v29 != 6);
LABEL_27:
      uint64_t v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v28, v23, v26, 1, v30, (void *)v2, v29);
      goto LABEL_109;
    default:
      goto LABEL_21;
  }
  do
  {
    unint64_t v120 = v119[1];
    if (v120 == v114)
    {
      if (PKNamedShaderKey::operator==((uint64_t)(v119 + 2), a2)) {
        goto LABEL_194;
      }
      goto LABEL_128;
    }
    if (v117 > 1)
    {
      if (v120 >= v115) {
        v120 %= v115;
      }
    }
    else
    {
      v120 &= v115 - 1;
    }
    if (v120 != v2) {
      break;
    }
LABEL_128:
    v119 = (void *)*v119;
  }
  while (v119);
LABEL_129:
  v121 = operator new(0x40uLL);
  v122 = (void *)(a1 + 200);
  void *v121 = 0;
  v121[1] = v114;
  long long v123 = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v121 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v121 + 2) = v123;
  v121[6] = *(void *)(a2 + 32);
  float v17 = v17;
  v121[7] = v17;
  float v124 = (float)(unint64_t)(*(void *)(a1 + 208) + 1);
  float v125 = *(float *)(a1 + 216);
  if (!v115 || (float)(v125 * (float)v115) < v124)
  {
    BOOL v126 = (v115 & (v115 - 1)) == 0;
    if (v115 < 3) {
      BOOL v126 = 0;
    }
    unint64_t v127 = (2 * v115) | !v126;
    unint64_t v128 = vcvtps_u32_f32(v124 / v125);
    if (v127 <= v128) {
      int8x8_t prime = (int8x8_t)v128;
    }
    else {
      int8x8_t prime = (int8x8_t)v127;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v115 = *(void *)(a1 + 192);
    if (*(void *)&prime <= v115)
    {
      if (*(void *)&prime < v115)
      {
        unint64_t v136 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 208) / *(float *)(a1 + 216));
        if (v115 < 3 || (uint8x8_t v137 = (uint8x8_t)vcnt_s8((int8x8_t)v115), v137.i16[0] = vaddlv_u8(v137), v137.u32[0] > 1uLL))
        {
          unint64_t v136 = std::__next_prime(v136);
        }
        else
        {
          uint64_t v138 = 1 << -(char)__clz(v136 - 1);
          if (v136 >= 2) {
            unint64_t v136 = v138;
          }
        }
        if (*(void *)&prime <= v136) {
          int8x8_t prime = (int8x8_t)v136;
        }
        if (*(void *)&prime >= v115)
        {
          unint64_t v115 = *(void *)(a1 + 192);
        }
        else
        {
          if (prime) {
            goto LABEL_141;
          }
          v152 = *(void **)(a1 + 184);
          *(void *)(a1 + 184) = 0;
          if (v152) {
            operator delete(v152);
          }
          unint64_t v115 = 0;
          *(void *)(a1 + 192) = 0;
        }
      }
    }
    else
    {
LABEL_141:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v130 = operator new(8 * *(void *)&prime);
      v131 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v130;
      if (v131) {
        operator delete(v131);
      }
      uint64_t v132 = 0;
      *(int8x8_t *)(a1 + 192) = prime;
      do
        *(void *)(*(void *)(a1 + 184) + 8 * v132++) = 0;
      while (*(void *)&prime != v132);
      v133 = (void *)*v122;
      if (*v122)
      {
        unint64_t v134 = v133[1];
        uint8x8_t v135 = (uint8x8_t)vcnt_s8(prime);
        v135.i16[0] = vaddlv_u8(v135);
        if (v135.u32[0] > 1uLL)
        {
          if (v134 >= *(void *)&prime) {
            v134 %= *(void *)&prime;
          }
        }
        else
        {
          v134 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)(a1 + 184) + 8 * v134) = v122;
        v145 = (void *)*v133;
        if (*v133)
        {
          do
          {
            unint64_t v146 = v145[1];
            if (v135.u32[0] > 1uLL)
            {
              if (v146 >= *(void *)&prime) {
                v146 %= *(void *)&prime;
              }
            }
            else
            {
              v146 &= *(void *)&prime - 1;
            }
            if (v146 != v134)
            {
              uint64_t v147 = *(void *)(a1 + 184);
              if (!*(void *)(v147 + 8 * v146))
              {
                *(void *)(v147 + 8 * v146) = v133;
                goto LABEL_175;
              }
              void *v133 = *v145;
              void *v145 = **(void **)(*(void *)(a1 + 184) + 8 * v146);
              **(void **)(*(void *)(a1 + 184) + 8 * v146) = v145;
              v145 = v133;
            }
            unint64_t v146 = v134;
LABEL_175:
            v133 = v145;
            v145 = (void *)*v145;
            unint64_t v134 = v146;
          }
          while (v145);
        }
      }
      unint64_t v115 = (unint64_t)prime;
    }
    if ((v115 & (v115 - 1)) != 0)
    {
      if (v114 >= v115) {
        uint64_t v2 = v114 % v115;
      }
      else {
        uint64_t v2 = v114;
      }
    }
    else
    {
      uint64_t v2 = (v115 - 1) & v114;
    }
  }
  uint64_t v148 = *(void *)(a1 + 184);
  v149 = *(void **)(v148 + 8 * v2);
  if (v149)
  {
    void *v121 = *v149;
LABEL_192:
    void *v149 = v121;
    goto LABEL_193;
  }
  void *v121 = *v122;
  void *v122 = v121;
  *(void *)(v148 + 8 * v2) = v122;
  if (*v121)
  {
    unint64_t v150 = *(void *)(*v121 + 8);
    if ((v115 & (v115 - 1)) != 0)
    {
      if (v150 >= v115) {
        v150 %= v115;
      }
    }
    else
    {
      v150 &= v115 - 1;
    }
    v149 = (void *)(*(void *)(a1 + 184) + 8 * v150);
    goto LABEL_192;
  }
LABEL_193:
  ++*(void *)(a1 + 208);
LABEL_194:

  return v17;
}

- (id)_preloadUberShaders
{
  int v2 = a1[425];
  uint64_t v39 = 3;
  __int16 v40 = 0;
  if (v2) {
    int v3 = 16843009;
  }
  else {
    int v3 = 33620226;
  }
  char v41 = 0;
  char v42 = v2;
  uint64_t v44 = 0;
  uint64_t v43 = 0;
  __int16 v46 = 0;
  int v45 = v3;
  int v47 = 0;
  __int16 v48 = 0;
  id v4 = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v39);
  char v5 = a1[425];
  if (v5) {
    int v6 = 16843009;
  }
  else {
    int v6 = 33620226;
  }
  uint64_t v28 = 3;
  __int16 v29 = 0;
  char v30 = 1;
  char v31 = v5;
  int v32 = 0;
  uint64_t v33 = 1;
  __int16 v36 = 0;
  int v34 = 0;
  int v35 = v6;
  int v37 = 0;
  __int16 v38 = 0;
  id v7 = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v28);
  char v8 = a1[425];
  if (v8)
  {
    long long v21 = xmmword_1C482B5B0;
    uint64_t v22 = 4;
    __int16 v25 = 0;
    int v23 = 3;
    int v24 = 16843009;
    int v26 = 0;
    __int16 v27 = 0;
    id v9 = -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v21);
    __int16 v66 = 0;
    int v65 = 0;
    long long v60 = xmmword_1C482B5C0;
    uint64_t v61 = 0;
    __int16 v64 = 0;
    int v62 = 3;
    int v63 = 16843009;
    return -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v60);
  }
  else
  {
    char v11 = 1;
    do
    {
      uint64_t v12 = 0;
      char v20 = v11;
      char v13 = v8 & 1;
      char v14 = 1;
      do
      {
        uint64_t v15 = 0;
        char v16 = v14;
        uint64_t v17 = *((void *)&xmmword_1C482B5B0 + v12);
        do
        {
          uint64_t v18 = qword_1C482B5F0[v15];
          *(void *)&long long v60 = v17;
          BYTE8(v60) = v13;
          *(_DWORD *)((char *)&v60 + 9) = 0;
          HIDWORD(v60) = 0;
          uint64_t v61 = v18;
          __int16 v64 = 0;
          int v62 = 3;
          int v63 = 33620226;
          int v65 = 0;
          __int16 v66 = 0;
          id v19 = -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v60);
          ++v15;
        }
        while (v15 != 3);
        uint64_t v49 = v17;
        char v50 = v13;
        __int16 v51 = 256;
        int v52 = 0;
        char v53 = 0;
        uint64_t v54 = 1;
        __int16 v57 = 0;
        int v55 = 3;
        int v56 = 33620226;
        int v58 = 0;
        __int16 v59 = 0;
        id result = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v49);
        char v14 = 0;
        uint64_t v12 = 1;
      }
      while ((v16 & 1) != 0);
      char v11 = 0;
      char v8 = 1;
    }
    while ((v20 & 1) != 0);
  }
  return result;
}

- (id)_inkTextureNamed:(uint64_t)a3 image:
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1)
  {
    char v5 = 0;
    goto LABEL_40;
  }
  char v5 = [*(id *)(a1 + 96) objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_40;
  }
  int v6 = -[PKMetalResourceHandler _signpostLog]((id)a1);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 384);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LoadInkTexture", (const char *)&unk_1C48540E6, buf, 2u);
  }

  id v9 = v4;
  unint64_t v10 = [v9 stringByAppendingString:@"_texture"];
  id v38 = v9;

  id v40 = v10;
  self;
  char v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [MEMORY[0x1E4FB1818] imageNamed:v40 inBundle:v11];
  char v5 = (void *)[v12 CGImage];
  if (v5)
  {
    uint64_t v13 = *MEMORY[0x1E4F35388];
    v55[0] = *MEMORY[0x1E4F35390];
    v55[1] = v13;
    *(void *)buf = &unk_1F200E790;
    *(void *)&uint8_t buf[8] = &unk_1F200E7A8;
    v55[2] = *MEMORY[0x1E4F35380];
    *(void *)&buf[16] = MEMORY[0x1E4F1CC28];
    char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:3];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:*(void *)(a1 + 432)];
    id v42 = 0;
    char v5 = (void *)[v15 newTextureWithCGImage:v5 options:v14 error:&v42];
    id v16 = v42;
    if (v16)
    {
      uint64_t v17 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v53 = 138412290;
        id v54 = v40;
        _os_log_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEFAULT, "Error loading texture: %@", v53, 0xCu);
      }
    }
  }

  if (!v5)
  {
    self;
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v19 = *MEMORY[0x1E4F35388];
    v51[0] = *MEMORY[0x1E4F35390];
    v51[1] = v19;
    v52[0] = &unk_1F200E790;
    v52[1] = &unk_1F200E7A8;
    v51[2] = *MEMORY[0x1E4F35380];
    v52[2] = MEMORY[0x1E4F1CC28];
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
    long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:*(void *)(a1 + 432)];
    id v41 = 0;
    char v5 = (void *)[v21 newTextureWithName:v40 scaleFactor:v18 bundle:v20 options:&v41 error:1.0];
    id v22 = v41;
    if (v22 || ![v5 width])
    {
      if (!a3) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v25 = [v5 height];
      if (!a3 || v25)
      {
LABEL_17:
        if (objc_msgSend(v5, "width", v38))
        {
          id v22 = 0;
          if ([v5 height])
          {
LABEL_28:

            goto LABEL_29;
          }
        }
        else
        {
          id v22 = 0;
        }
LABEL_25:
        int v26 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          _os_log_fault_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_FAULT, "Failed to load texture: %@, error: %@", buf, 0x16u);
        }

        goto LABEL_28;
      }
    }
    uint64_t v23 = objc_msgSend(v21, "newTextureWithCGImage:options:error:", v38);
    id v24 = v22;

    id v22 = v24;
    char v5 = (void *)v23;
LABEL_16:
    if (v22) {
      goto LABEL_25;
    }
    goto LABEL_17;
  }
LABEL_29:
  int v27 = -[PKMetalResourceHandler isAppInBackground]();
  uint64_t v28 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [v5 width];
    uint64_t v30 = [v5 height];
    uint64_t v31 = [v5 depth];
    uint64_t v32 = [v5 pixelFormat];
    *(_DWORD *)buf = 138413570;
    *(void *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v44 = v30;
    __int16 v45 = 2048;
    uint64_t v46 = v31;
    __int16 v47 = 2048;
    uint64_t v48 = v32;
    __int16 v49 = 1024;
    int v50 = v27;
    _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "Loaded ink texture: %@, size: %lu, %lu, %lu, pixelFormat: %lu, inBackground: %d", buf, 0x3Au);
  }

  if (v27)
  {
    uint64_t v33 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_ERROR, "App was in the background when loading a texture.", buf, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 96) setObject:v5 forKeyedSubscript:v38];
  }
  int v34 = -[PKMetalResourceHandler _signpostLog]((id)a1);
  int v35 = v34;
  os_signpost_id_t v36 = *(void *)(a1 + 384);
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v35, OS_SIGNPOST_INTERVAL_END, v36, "LoadInkTexture", (const char *)&unk_1C48540E6, buf, 2u);
  }

LABEL_40:

  return v5;
}

- (id)compositePaperShaderWithMode:(int)a3 colorAttachmentIndex:(char)a4 secondaryPaintEnabled:(uint64_t)a5 pipelineConfig:
{
  if (a1)
  {
    HIBYTE(v7) = 0;
    *(_WORD *)((char *)&v7 + 13) = 0;
    int v12 = 0;
    __int16 v13 = 0;
    *(void *)&long long v7 = a2;
    DWORD2(v7) = 0;
    BYTE12(v7) = a4;
    uint64_t v8 = 4;
    int v9 = a3;
    int v10 = a5;
    __int16 v11 = WORD2(a5);
    a1 = -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v7);
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)uberShaderForKey:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v10 = 0;
    __int16 v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = __Block_byref_object_copy__26;
    char v14 = __Block_byref_object_dispose__26;
    id v15 = 0;
    int v2 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKMetalResourceHandler_uberShaderForKey___block_invoke;
    block[3] = &unk_1E64CA3C0;
    void block[4] = a1;
    block[5] = &v10;
    long long v3 = a2[1];
    long long v7 = *a2;
    long long v8 = v3;
    uint64_t v9 = *((void *)a2 + 4);
    dispatch_sync(v2, block);
    id v4 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)compositeOverShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:
{
  if (a1)
  {
    HIBYTE(v10) = 0;
    *(_WORD *)((char *)&v10 + 13) = 0;
    int v15 = 0;
    __int16 v16 = 0;
    *(void *)&long long v10 = a2;
    BYTE8(v10) = a3;
    *(_WORD *)((char *)&v10 + 9) = a5;
    BYTE11(v10) = a6;
    BYTE12(v10) = a7;
    uint64_t v11 = 0;
    int v12 = a4;
    int v13 = a8;
    __int16 v14 = WORD2(a8);
    a1 = -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v10);
    uint64_t v8 = vars8;
  }
  return a1;
}

- (id)compositeMultiplyShaderWithMode:(char)a3 clipping:(char)a4 targetMultiple:(int)a5 colorAttachmentIndex:(char)a6 renderMask:(char)a7 edgeMask:(char)a8 secondaryPaintEnabled:(int)a9 pipelineConfig:(__int16)a10
{
  if (a1)
  {
    HIBYTE(v12) = 0;
    *(_WORD *)((char *)&v12 + 13) = 0;
    int v17 = 0;
    __int16 v18 = 0;
    *(void *)&long long v12 = a2;
    BYTE8(v12) = a3;
    BYTE9(v12) = a6;
    BYTE10(v12) = a4;
    BYTE11(v12) = a7;
    BYTE12(v12) = a8;
    uint64_t v13 = 1;
    int v14 = a5;
    int v15 = a9;
    __int16 v16 = a10;
    a1 = -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v12);
    uint64_t v10 = vars8;
  }
  return a1;
}

- (id)compositeSoftWhiteShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:
{
  if (a1)
  {
    HIBYTE(v10) = 0;
    *(_WORD *)((char *)&v10 + 13) = 0;
    int v15 = 0;
    __int16 v16 = 0;
    *(void *)&long long v10 = a2;
    BYTE8(v10) = a3;
    *(_WORD *)((char *)&v10 + 9) = a5;
    BYTE11(v10) = a6;
    BYTE12(v10) = a7;
    uint64_t v11 = 3;
    int v12 = a4;
    int v13 = a8;
    __int16 v14 = WORD2(a8);
    a1 = -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v10);
    uint64_t v8 = vars8;
  }
  return a1;
}

- (id)compositeEraseShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(char)a5 secondaryPaintEnabled:(uint64_t)a6 pipelineConfig:
{
  if (a1)
  {
    HIBYTE(v8) = 0;
    *(_WORD *)((char *)&v8 + 13) = 0;
    int v13 = 0;
    __int16 v14 = 0;
    *(void *)&long long v8 = a2;
    BYTE8(v8) = a3;
    *(_WORD *)((char *)&v8 + 9) = 0;
    BYTE11(v8) = 0;
    BYTE12(v8) = a5;
    uint64_t v9 = 2;
    int v10 = a4;
    int v11 = a6;
    __int16 v12 = WORD2(a6);
    a1 = -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v8);
    uint64_t v6 = vars8;
  }
  return a1;
}

- (char)_uberShaderForKey:(char *)a1
{
  int v2 = a1;
  if (!a1) {
    goto LABEL_124;
  }
  unint64_t v4 = PKHashBytes((uint64_t)a2, 40);
  int8x8_t v5 = *(int8x8_t *)(v2 + 112);
  if (v5)
  {
    unint64_t v6 = v4;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
    v7.i16[0] = vaddlv_u8(v7);
    unint64_t v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v9 = v4;
      if (v4 >= *(void *)&v5) {
        unint64_t v9 = v4 % *(void *)&v5;
      }
    }
    else
    {
      unint64_t v9 = (*(void *)&v5 - 1) & v4;
    }
    int v10 = *(uint64_t ***)(*((void *)v2 + 13) + 8 * v9);
    if (v10)
    {
      int v11 = (uint64_t **)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = (unint64_t)v11[1];
          if (v12 == v6)
          {
            if (!memcmp(v11 + 2, a2, 0x28uLL))
            {
              int v2 = v11[7];
              goto LABEL_124;
            }
          }
          else
          {
            if (v8 > 1)
            {
              if (v12 >= *(void *)&v5) {
                v12 %= *(void *)&v5;
              }
            }
            else
            {
              v12 &= *(void *)&v5 - 1;
            }
            if (v12 != v9) {
              break;
            }
          }
          int v11 = (uint64_t **)*v11;
        }
        while (v11);
      }
    }
  }
  int v13 = -[PKMetalResourceHandler _signpostLog](v2);
  __int16 v14 = v13;
  os_signpost_id_t v15 = *((void *)v2 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CompileShader", (const char *)&unk_1C48540E6, buf, 2u);
  }

  char v76 = 1;
  uint64_t v16 = *a2;
  int v17 = *((unsigned __int8 *)a2 + 8);
  int v18 = *((unsigned __int8 *)a2 + 9);
  int v19 = *((unsigned __int8 *)a2 + 11);
  *(_DWORD *)buf = *((_DWORD *)a2 + 6);
  id v20 = objc_alloc_init(MEMORY[0x1E4F35228]);
  long long v21 = v20;
  char v80 = 1;
  if (v16 == 1)
  {
    uint64_t v22 = 5;
  }
  else
  {
    if (v16) {
      goto LABEL_26;
    }
    uint64_t v22 = 1;
  }
  [v20 setConstantValue:&v80 type:53 atIndex:v22];
LABEL_26:
  if (v17) {
    [v21 setConstantValue:&v80 type:53 atIndex:3];
  }
  if (v18) {
    [v21 setConstantValue:&v80 type:53 atIndex:14];
  }
  if (v19) {
    [v21 setConstantValue:&v80 type:53 atIndex:15];
  }
  [v21 setConstantValue:buf type:33 atIndex:13];
  if (v2[428]) {
    [v21 setConstantValue:&v80 type:53 atIndex:7];
  }
  [v21 setConstantValue:&v76 type:53 atIndex:4];
  if (*((unsigned char *)a2 + 10)) {
    [v21 setConstantValue:&v76 type:53 atIndex:6];
  }
  if (*((unsigned char *)a2 + 12)) {
    [v21 setConstantValue:&v76 type:53 atIndex:17];
  }
  unint64_t v23 = a2[2];
  if (v23 <= 4) {
    [v21 setConstantValue:&v76 type:53 atIndex:qword_1C482B678[v23]];
  }
  id v24 = (void *)*((void *)v2 + 38);
  id v75 = 0;
  uint64_t v25 = (void *)[v24 newFunctionWithName:@"uber_vertex" constantValues:v21 error:&v75];
  id v26 = v75;
  int v27 = (void *)*((void *)v2 + 38);
  id v74 = 0;
  uint64_t v72 = v25;
  uint64_t v28 = (void *)[v27 newFunctionWithName:@"uber_fragment" constantValues:v21 error:&v74];
  id v71 = v74;
  if (!v25 || !v28) {
    objc_exception_throw(@"Failed to compile shader");
  }
  BOOL v29 = *a2 == 2;
  if (*a2 == 2) {
    uint64_t v30 = 3;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = -[PKMetalResourceHandler _pipelineDescriptorForConfig:]((uint64_t)v2, *((unsigned int *)a2 + 7) | ((unint64_t)*((unsigned __int16 *)a2 + 16) << 32));
  unsigned int v70 = (void *)v31;
  uint64_t v32 = [PKMetalShader alloc];
  for (uint64_t i = 0; i != 6; ++i)
  {
    if (!*((unsigned char *)a2 + i + 28)) {
      break;
    }
  }
  int v73 = (void *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v32, v25, v28, 2 * v29, v30, (void *)v31, i);
  unint64_t v34 = PKHashBytes((uint64_t)a2, 40);
  unint64_t v35 = v34;
  unint64_t v36 = *((void *)v2 + 14);
  if (v36)
  {
    uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
    v37.i16[0] = vaddlv_u8(v37);
    unint64_t v38 = v37.u32[0];
    if (v37.u32[0] > 1uLL)
    {
      uint64_t v31 = v34;
      if (v34 >= v36) {
        uint64_t v31 = v34 % v36;
      }
    }
    else
    {
      uint64_t v31 = (v36 - 1) & v34;
    }
    uint64_t v39 = *(void **)(*((void *)v2 + 13) + 8 * v31);
    if (v39)
    {
      id v40 = (void *)*v39;
      if (*v39)
      {
        do
        {
          unint64_t v41 = v40[1];
          if (v41 == v35)
          {
            if (!memcmp(v40 + 2, a2, 0x28uLL)) {
              goto LABEL_120;
            }
          }
          else
          {
            if (v38 > 1)
            {
              if (v41 >= v36) {
                v41 %= v36;
              }
            }
            else
            {
              v41 &= v36 - 1;
            }
            if (v41 != v31) {
              break;
            }
          }
          id v40 = (void *)*v40;
        }
        while (v40);
      }
    }
  }
  id v42 = operator new(0x40uLL);
  uint64_t v43 = v2 + 120;
  *(void *)buf = v42;
  int v78 = v2 + 120;
  *id v42 = 0;
  v42[1] = v35;
  long long v44 = *((_OWORD *)a2 + 1);
  *((_OWORD *)v42 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v42 + 2) = v44;
  v42[6] = a2[4];
  v42[7] = v73;
  char v79 = 1;
  float v45 = (float)(unint64_t)(*((void *)v2 + 16) + 1);
  float v46 = *((float *)v2 + 34);
  if (v36 && (float)(v46 * (float)v36) >= v45) {
    goto LABEL_111;
  }
  BOOL v47 = (v36 & (v36 - 1)) == 0;
  if (v36 < 3) {
    BOOL v47 = 0;
  }
  unint64_t v48 = (2 * v36) | !v47;
  unint64_t v49 = vcvtps_u32_f32(v45 / v46);
  if (v48 <= v49) {
    int8x8_t prime = (int8x8_t)v49;
  }
  else {
    int8x8_t prime = (int8x8_t)v48;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
  }
  unint64_t v36 = *((void *)v2 + 14);
  if (*(void *)&prime > v36) {
    goto LABEL_77;
  }
  if (*(void *)&prime < v36)
  {
    unint64_t v57 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 16) / *((float *)v2 + 34));
    if (v36 < 3 || (uint8x8_t v58 = (uint8x8_t)vcnt_s8((int8x8_t)v36), v58.i16[0] = vaddlv_u8(v58), v58.u32[0] > 1uLL))
    {
      unint64_t v57 = std::__next_prime(v57);
    }
    else
    {
      uint64_t v59 = 1 << -(char)__clz(v57 - 1);
      if (v57 >= 2) {
        unint64_t v57 = v59;
      }
    }
    if (*(void *)&prime <= v57) {
      int8x8_t prime = (int8x8_t)v57;
    }
    if (*(void *)&prime >= v36)
    {
      unint64_t v36 = *((void *)v2 + 14);
    }
    else
    {
      if (prime)
      {
LABEL_77:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        __int16 v51 = operator new(8 * *(void *)&prime);
        int v52 = (void *)*((void *)v2 + 13);
        *((void *)v2 + 13) = v51;
        if (v52) {
          operator delete(v52);
        }
        uint64_t v53 = 0;
        *((int8x8_t *)v2 + 14) = prime;
        do
          *(void *)(*((void *)v2 + 13) + 8 * v53++) = 0;
        while (*(void *)&prime != v53);
        id v54 = (void *)*v43;
        if (*v43)
        {
          unint64_t v55 = v54[1];
          uint8x8_t v56 = (uint8x8_t)vcnt_s8(prime);
          v56.i16[0] = vaddlv_u8(v56);
          if (v56.u32[0] > 1uLL)
          {
            if (v55 >= *(void *)&prime) {
              v55 %= *(void *)&prime;
            }
          }
          else
          {
            v55 &= *(void *)&prime - 1;
          }
          *(void *)(*((void *)v2 + 13) + 8 * v55) = v43;
          long long v60 = (void *)*v54;
          if (*v54)
          {
            do
            {
              unint64_t v61 = v60[1];
              if (v56.u32[0] > 1uLL)
              {
                if (v61 >= *(void *)&prime) {
                  v61 %= *(void *)&prime;
                }
              }
              else
              {
                v61 &= *(void *)&prime - 1;
              }
              if (v61 != v55)
              {
                uint64_t v62 = *((void *)v2 + 13);
                if (!*(void *)(v62 + 8 * v61))
                {
                  *(void *)(v62 + 8 * v61) = v54;
                  goto LABEL_102;
                }
                *id v54 = *v60;
                *long long v60 = **(void **)(*((void *)v2 + 13) + 8 * v61);
                **(void **)(*((void *)v2 + 13) + 8 * v61) = v60;
                long long v60 = v54;
              }
              unint64_t v61 = v55;
LABEL_102:
              id v54 = v60;
              long long v60 = (void *)*v60;
              unint64_t v55 = v61;
            }
            while (v60);
          }
        }
        unint64_t v36 = (unint64_t)prime;
        goto LABEL_106;
      }
      int v69 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = 0;
      if (v69) {
        operator delete(v69);
      }
      unint64_t v36 = 0;
      *((void *)v2 + 14) = 0;
    }
  }
LABEL_106:
  if ((v36 & (v36 - 1)) != 0)
  {
    if (v35 >= v36) {
      uint64_t v31 = v35 % v36;
    }
    else {
      uint64_t v31 = v35;
    }
  }
  else
  {
    uint64_t v31 = (v36 - 1) & v35;
  }
LABEL_111:
  int v63 = *(void **)(*((void *)v2 + 13) + 8 * v31);
  if (v63)
  {
    **(void **)buf = *v63;
    *int v63 = *(void *)buf;
  }
  else
  {
    **(void **)buf = *((void *)v2 + 15);
    *((void *)v2 + 15) = *(void *)buf;
    *(void *)(*((void *)v2 + 13) + 8 * v31) = v43;
    if (**(void **)buf)
    {
      unint64_t v64 = *(void *)(**(void **)buf + 8);
      if ((v36 & (v36 - 1)) != 0)
      {
        if (v64 >= v36) {
          v64 %= v36;
        }
      }
      else
      {
        v64 &= v36 - 1;
      }
      *(void *)(*((void *)v2 + 13) + 8 * v64) = *(void *)buf;
    }
  }
  *(void *)buf = 0;
  ++*((void *)v2 + 16);
LABEL_120:
  int v65 = -[PKMetalResourceHandler _signpostLog](v2);
  __int16 v66 = v65;
  os_signpost_id_t v67 = *((void *)v2 + 48);
  if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v66, OS_SIGNPOST_INTERVAL_END, v67, "CompileShader", (const char *)&unk_1C48540E6, buf, 2u);
  }

  int v2 = v73;
LABEL_124:

  return v2;
}

void __43__PKMetalResourceHandler_uberShaderForKey___block_invoke(uint64_t a1)
{
  int v2 = *(char **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v4 = -[PKMetalResourceHandler _uberShaderForKey:](v2, (uint64_t *)v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)cachedQuadVertexBuffer
{
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__26;
    unint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__PKMetalResourceHandler_cachedQuadVertexBuffer__block_invoke;
    v4[3] = &unk_1E64C5848;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __48__PKMetalResourceHandler_cachedQuadVertexBuffer__block_invoke(uint64_t a1)
{
}

- (id)cachedQuadTexCoordBuffer
{
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__26;
    unint64_t v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__PKMetalResourceHandler_cachedQuadTexCoordBuffer__block_invoke;
    v4[3] = &unk_1E64C5848;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __50__PKMetalResourceHandler_cachedQuadTexCoordBuffer__block_invoke(uint64_t a1)
{
}

- (void)replaceInkTexture:(uint64_t)a3 image:
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PKMetalResourceHandler_replaceInkTexture_image___block_invoke;
    block[3] = &unk_1E64CA3E8;
    void block[4] = a1;
    uint64_t v10 = a3;
    id v9 = v5;
    dispatch_sync(v7, block);
  }
}

void __50__PKMetalResourceHandler_replaceInkTexture_image___block_invoke(void *a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:*(void *)(a1[4] + 432)];
  uint64_t v3 = *MEMORY[0x1E4F35388];
  v15[0] = *MEMORY[0x1E4F35390];
  v15[1] = v3;
  v16[0] = &unk_1F200E790;
  v16[1] = &unk_1F200E7A8;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v5 = a1[6];
  id v10 = 0;
  unint64_t v6 = (void *)[v2 newTextureWithCGImage:v5 options:v4 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Failed to replace with CGImage texture: %@, error: %@", buf, 0x16u);
    }
  }
  if (v6) {
    [*(id *)(a1[4] + 96) setObject:v6 forKeyedSubscript:a1[5]];
  }
}

- (id)inkTextureNamed:(uint64_t)a3 image:
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (a1)
  {
    uint64_t v14 = 0;
    os_signpost_id_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    int v17 = __Block_byref_object_copy__26;
    int v18 = __Block_byref_object_dispose__26;
    id v19 = 0;
    id v7 = *(NSObject **)(a1 + 376);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PKMetalResourceHandler_inkTextureNamed_image___block_invoke;
    void v10[3] = &unk_1E64CA410;
    uint64_t v12 = &v14;
    v10[4] = a1;
    id v11 = v5;
    uint64_t v13 = a3;
    dispatch_sync(v7, v10);
    id v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __48__PKMetalResourceHandler_inkTextureNamed_image___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKMetalResourceHandler _inkTextureNamed:image:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setupPaperTextureIfNecessary
{
  if (a1 && !a1[39])
  {
    uint64_t v2 = -[PKMetalResourceHandler _signpostLog](a1);
    uint64_t v3 = v2;
    os_signpost_id_t v4 = a1[48];
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SetupPaperTexture", (const char *)&unk_1C48540E6, buf, 2u);
    }

    id v5 = (void *)MEMORY[0x1E4FB1818];
    unint64_t v6 = (void *)MEMORY[0x1E4FB1E20];
    id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    double v9 = v8;

    id v10 = objc_msgSend(v6, "traitCollectionWithDisplayScale:", fmin(v9, 2.0));
    id v11 = [v5 _kitImageNamed:@"UITexturedPaperTile" withTrait:v10];

    [v11 size];
    a1[40] = v12;
    a1[41] = v13;
    id v14 = v11;
    if (CGImageGetWidth((CGImageRef)[v14 CGImage]))
    {
      v32.width = 128.0;
      v32.height = 128.0;
      UIGraphicsBeginImageContextWithOptions(v32, 0, 1.0);
      objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 128.0, 128.0);
      uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();

      id v14 = (id)v15;
      UIGraphicsEndImageContext();
    }
    uint64_t v16 = (UIImage *)v14;
    uint64_t v17 = [(UIImage *)v16 CGImage];
    if (v17)
    {
      os_log_t v18 = (os_log_t)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:a1[54]];
      id v30 = 0;
      uint64_t v19 = [v18 newTextureWithCGImage:v17 options:0 error:&v30];
      id v20 = v30;
      long long v21 = (void *)a1[39];
      a1[39] = v19;

      if (!a1[39])
      {
        uint64_t v22 = UIImagePNGRepresentation(v16);
        id v29 = v20;
        uint64_t v23 = [v18 newTextureWithData:v22 options:0 error:&v29];
        id v24 = v29;

        uint64_t v25 = (void *)a1[39];
        a1[39] = v23;

        id v20 = v24;
      }
    }
    else
    {
      os_log_t v18 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Unable to load paper texture", buf, 2u);
      }
    }

    id v26 = -[PKMetalResourceHandler _signpostLog](a1);
    int v27 = v26;
    os_signpost_id_t v28 = a1[48];
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v27, OS_SIGNPOST_INTERVAL_END, v28, "SetupPaperTexture", (const char *)&unk_1C48540E6, buf, 2u);
    }
  }
}

- (id)paperTexture
{
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    double v8 = __Block_byref_object_copy__26;
    double v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__PKMetalResourceHandler_paperTexture__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __38__PKMetalResourceHandler_paperTexture__block_invoke(uint64_t a1)
{
  -[PKMetalResourceHandler _setupPaperTextureIfNecessary](*(void **)(a1 + 32));
  id v2 = *(void **)(*(void *)(a1 + 32) + 312);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (double)paperTextureSize
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x4012000000;
  double v8 = __Block_byref_object_copy__153;
  double v9 = __Block_byref_object_dispose__154;
  id v10 = "";
  unsigned int v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PKMetalResourceHandler_paperTextureSize__block_invoke;
  v4[3] = &unk_1E64C7628;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  double v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

__n128 __42__PKMetalResourceHandler_paperTextureSize__block_invoke(uint64_t a1)
{
  -[PKMetalResourceHandler _setupPaperTextureIfNecessary](*(void **)(a1 + 32));
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 320);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (id)randomNumberBuffer
{
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    double v8 = __Block_byref_object_copy__26;
    double v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__PKMetalResourceHandler_randomNumberBuffer__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __44__PKMetalResourceHandler_randomNumberBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 368))
  {
    uint64_t v3 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
    os_signpost_id_t v4 = v3;
    os_signpost_id_t v5 = *(void *)(v2 + 384);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SetupRandomNumberBuffer", (const char *)&unk_1C48540E6, buf, 2u);
    }

    uint64_t v6 = [*(id *)(v2 + 432) newBufferWithBytes:-[PKMetalResourceHandler randomNumberArray](v2) length:0x4000 options:0];
    uint64_t v7 = *(void **)(v2 + 368);
    *(void *)(v2 + 368) = v6;

    double v8 = -[PKMetalResourceHandler _signpostLog]((id)v2);
    double v9 = v8;
    os_signpost_id_t v10 = *(void *)(v2 + 384);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SetupRandomNumberBuffer", (const char *)&unk_1C48540E6, v11, 2u);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v2 + 368));
}

- (id)uint16IndexBuffer
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    double v8 = __Block_byref_object_copy__26;
    double v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    unsigned int v1 = *(NSObject **)(a1 + 376);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__PKMetalResourceHandler_uint16IndexBuffer__block_invoke;
    v4[3] = &unk_1E64C7628;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __43__PKMetalResourceHandler_uint16IndexBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 344))
  {
    uint64_t v3 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
    os_signpost_id_t v4 = v3;
    os_signpost_id_t v5 = *(void *)(v2 + 384);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SetupUInt16IndexBuffer", (const char *)&unk_1C48540E6, buf, 2u);
    }

    uint64_t v6 = (char *)operator new(0x30000uLL);
    bzero(v6, 0x30000uLL);
    unint64_t v7 = -4;
    double v8 = v6;
    do
    {
      v7 += 4;
      *(_WORD *)double v8 = v7;
      int16x4_t v9 = vuzp1_s16((int16x4_t)vorr_s8((int8x8_t)vdup_n_s32(v7), (int8x8_t)0x200000001), (int16x4_t)0x200000001);
      *(int16x4_t *)(v8 + 2) = vzip1_s16(v9, vrev32_s16(v9));
      *((_WORD *)v8 + 5) = v7 | 3;
      v8 += 12;
    }
    while (v7 < 0xFFFC);
    uint64_t v10 = objc_msgSend(*(id *)(v2 + 432), "newBufferWithBytes:length:options:", v6, 196608, 0, COERCE_DOUBLE(0x200000001));
    id v11 = *(void **)(v2 + 344);
    *(void *)(v2 + 344) = v10;

    uint64_t v12 = -[PKMetalResourceHandler _signpostLog]((id)v2);
    uint64_t v13 = v12;
    os_signpost_id_t v14 = *(void *)(v2 + 384);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v15[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SetupUInt16IndexBuffer", (const char *)&unk_1C48540E6, (uint8_t *)v15, 2u);
    }

    operator delete(v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v2 + 344));
}

- (uint64_t)randomNumberArray
{
  if (result)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3C61B0, memory_order_acquire) & 1) == 0)
    {
      uint64_t v1 = result;
      int v2 = __cxa_guard_acquire(&qword_1EB3C61B0);
      __n128 result = v1;
      if (v2)
      {
        __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], qword_1EB3C6200, &dword_1C44F8000);
        __cxa_guard_release(&qword_1EB3C61B0);
        __n128 result = v1;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKMetalResourceHandler_randomNumberArray__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = result;
    if (qword_1EB3C61A8 != -1) {
      dispatch_once(&qword_1EB3C61A8, block);
    }
    return qword_1EB3C6200[0];
  }
  return result;
}

void __43__PKMetalResourceHandler_randomNumberArray__block_invoke(uint64_t a1)
{
  int v2 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 384);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CreateRandomNumberArray", (const char *)&unk_1C48540E6, buf, 2u);
  }

  std::vector<float>::resize(qword_1EB3C6200, 0x1000uLL);
  uint64_t v5 = 0;
  uint64_t v6 = qword_1EB3C6200[0];
  unsigned int v7 = 43981;
  do
  {
    unsigned int v7 = 1664525 * v7 + 1013904223;
    *(float *)(v6 + v5) = (float)vcvtd_n_u64_f64((double)v7 / 4294967300.0, 0x10uLL) * 0.000015259;
    v5 += 4;
  }
  while (v5 != 0x4000);
  double v8 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  int16x4_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 384);
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateRandomNumberArray", (const char *)&unk_1C48540E6, v11, 2u);
  }
}

- (id)indexBufferForNumVertices:(void *)a3 outIndexType:
{
  if (a1)
  {
    if (a2 > 0x10000)
    {
      uint64_t v8 = 0;
      int16x4_t v9 = &v8;
      uint64_t v10 = 0x3032000000;
      id v11 = __Block_byref_object_copy__26;
      uint64_t v12 = __Block_byref_object_dispose__26;
      id v13 = 0;
      uint64_t v5 = *(NSObject **)(a1 + 376);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PKMetalResourceHandler_indexBufferForNumVertices_outIndexType___block_invoke;
      block[3] = &unk_1E64CA438;
      void block[5] = &v8;
      void block[6] = a2;
      void block[4] = a1;
      dispatch_sync(v5, block);
      *a3 = 1;
      id v4 = (id)v9[5];
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      *a3 = 0;
      -[PKMetalResourceHandler uint16IndexBuffer](a1);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __65__PKMetalResourceHandler_indexBufferForNumVertices_outIndexType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_28;
  }
  unint64_t v3 = *(void *)(a1 + 48);
  unint64_t v4 = *(void *)(v2 + 360);
  if (*(void *)(v2 + 352) && v4 >= v3) {
    goto LABEL_28;
  }
  if (v4 <= 0x20000) {
    uint64_t v6 = 0x20000;
  }
  else {
    uint64_t v6 = *(void *)(v2 + 360);
  }
  if (v4 > v3) {
    unint64_t v3 = *(void *)(v2 + 360);
  }
  if (v3 <= 0x20000) {
    unint64_t v3 = 0x20000;
  }
  unint64_t v7 = ((v3 - v6 + 0xFFFF) & 0xFFFFFFFFFFFF0000) + v6;
  uint64_t v8 = -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  int16x4_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(v2 + 384);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SetupUInt32IndexBuffer", (const char *)&unk_1C48540E6, buf, 2u);
  }

  unint64_t v12 = v7 >> 2;
  unint64_t v13 = 6 * (v7 >> 2);
  if (v13)
  {
    if (v13 >> 62) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    os_signpost_id_t v14 = (char *)operator new(24 * v12);
    bzero(v14, 24 * v12);
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  os_signpost_id_t v14 = 0;
  if (v7)
  {
LABEL_21:
    unsigned int v15 = 4;
    uint64_t v16 = v14;
    do
    {
      *(_DWORD *)uint64_t v16 = v15 - 4;
      *(int8x8_t *)v11.i8 = vorr_s8((int8x8_t)vdup_n_s32(v15 - 4), (int8x8_t)0x200000001);
      int32x4_t v11 = vzip1q_s32(v11, vrev64q_s32(v11));
      *(int32x4_t *)(v16 + 4) = v11;
      *((_DWORD *)v16 + 5) = v15 - 1;
      BOOL v17 = v7 > v15;
      v15 += 4;
      v16 += 24;
    }
    while (v17);
  }
LABEL_23:
  *(void *)(v2 + 360) = v7;
  uint64_t v18 = [*(id *)(v2 + 432) newBufferWithBytes:v14 length:24 * v12 options:0];
  uint64_t v19 = *(void **)(v2 + 352);
  *(void *)(v2 + 352) = v18;

  id v20 = -[PKMetalResourceHandler _signpostLog]((id)v2);
  long long v21 = v20;
  os_signpost_id_t v22 = *(void *)(v2 + 384);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v23[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v21, OS_SIGNPOST_INTERVAL_END, v22, "SetupUInt32IndexBuffer", (const char *)&unk_1C48540E6, (uint8_t *)v23, 2u);
  }

  if (v14) {
    operator delete(v14);
  }
LABEL_28:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 352));
}

- (void)deallocateReusableBuffers
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PKMetalResourceHandler_deallocateReusableBuffers__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __51__PKMetalResourceHandler_deallocateReusableBuffers__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 408);
  if (v1) {
    return [*(id *)(v1 + 56) removeAllObjects];
  }
  return result;
}

- (void)reloadParticleTexturesIfNecessaryCommandQueue:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[PKMetalResourceHandler isAppInBackground]())
    {
      unint64_t v4 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "App was in the background when attempting to reload particle textures.", buf, 2u);
      }
    }
    else
    {
      uint64_t v5 = *(NSObject **)(a1 + 376);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __72__PKMetalResourceHandler_reloadParticleTexturesIfNecessaryCommandQueue___block_invoke;
      v6[3] = &unk_1E64C5870;
      v6[4] = a1;
      id v7 = v3;
      dispatch_async(v5, v6);
    }
  }
}

void __72__PKMetalResourceHandler_reloadParticleTexturesIfNecessaryCommandQueue___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  CGSize v32 = [MEMORY[0x1E4FB1618] blackColor];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v54[0] = @"com.apple.ink.marker";
  v54[1] = @"com.apple.ink.pencil";
  v54[2] = @"com.apple.ink.watercolor";
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        uint8x8_t v37 = +[PKInk inkWithIdentifier:*(void *)(*((void *)&v48 + 1) + 8 * i) color:v32 weight:-1.0];
        unint64_t v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
        uint64_t v1 = [v37 behavior];
        -[PKInkBehavior particleTextureName](v1);
        id v2 = (id)objc_claimAutoreleasedReturnValue();

        if (v2) {
          [v34 addObject:v2];
        }
        id v3 = [v37 behavior];
        unint64_t v4 = [v3 secondaryParticleDescriptor];
        unint64_t v35 = [v4 textureName];

        if (v35) {
          objc_msgSend(v34, "addObject:");
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v38 = v34;
        uint64_t v5 = [v38 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v5)
        {
          uint64_t v39 = *(void *)v45;
          do
          {
            uint64_t v40 = v5;
            uint64_t v6 = 0;
            id v7 = v2;
            do
            {
              if (*(void *)v45 != v39) {
                objc_enumerationMutation(v38);
              }
              id v2 = *(id *)(*((void *)&v44 + 1) + 8 * v6);

              uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v2];
              int16x4_t v9 = v8;
              if (v8)
              {
                if ([v8 pixelFormat] == 81 || objc_msgSend(v9, "pixelFormat") == 80)
                {
                  unint64_t v11 = *(void *)(a1 + 32);
                  os_signpost_id_t v10 = *(void **)(a1 + 40);
                  id v12 = v9;
                  id v41 = v10;
                  id v42 = v12;
                  if (v11)
                  {
                    if ([v12 pixelFormat] == 81 || objc_msgSend(v12, "pixelFormat") == 80)
                    {
                      unint64_t v13 = [v41 commandBuffer];
                      os_signpost_id_t v14 = [v13 blitCommandEncoder];
                      uint64_t v15 = [v42 width];
                      uint64_t v16 = [v42 height];
                      BOOL v17 = (void *)[*(id *)(v11 + 432) newBufferWithLength:v16 * 4 * v15 options:0];
                      memset(buf, 0, sizeof(buf));
                      v52[0] = v15;
                      v52[1] = v16;
                      v52[2] = 1;
                      [v14 copyFromTexture:v42 sourceSlice:0 sourceLevel:0 sourceOrigin:buf sourceSize:v52 toBuffer:v17 destinationOffset:0 destinationBytesPerRow:4 * v15 destinationBytesPerImage:v16 * 4 * v15];
                      [v14 endEncoding];
                      [v13 commit];
                      [v13 waitUntilCompleted];
                      id v18 = v17;
                      uint64_t v19 = [v18 contents];
                      if (!v16) {
                        goto LABEL_28;
                      }
                      uint64_t v20 = 0;
                      unint64_t v21 = 0;
                      do
                      {
                        os_signpost_id_t v22 = (unsigned __int8 *)v19;
                        for (uint64_t j = v15; j; --j)
                        {
                          unsigned int v24 = *v22;
                          v22 += 4;
                          v21 += v24;
                        }
                        v19 += 4 * v15;
                        ++v20;
                      }
                      while (v20 != v16);
                      if (v16 * v15) {
                        unint64_t v11 = v21 / (v16 * v15);
                      }
                      else {
LABEL_28:
                      }
                        unint64_t v11 = 0;
                    }
                    else
                    {
                      unint64_t v11 = 0;
                    }
                  }

                  id v26 = os_log_create("com.apple.pencilkit", "");
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&uint8_t buf[4] = v11;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v2;
                    _os_log_debug_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_DEBUG, "Calculated average pixel alpha value: %ld, texture: %@", buf, 0x16u);
                  }

                  if (v11 - 201 <= 0xFFFFFFFFFFFFFF46)
                  {
                    int v27 = os_log_create("com.apple.pencilkit", "");
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v2;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v11;
                      _os_log_fault_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_FAULT, "Detected a texture that was corrupt: %@, %lu", buf, 0x16u);
                    }

                    [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:v2];
                    id v28 = -[PKMetalResourceHandler _inkTextureNamed:image:](*(void *)(a1 + 32), v2, 0);
                  }
                }
                else
                {
                  uint64_t v25 = os_log_create("com.apple.pencilkit", "");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    int v29 = [v9 pixelFormat];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v2;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v29;
                    _os_log_error_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_ERROR, "Unexpected pixel format in particle texture: %@, %d", buf, 0x12u);
                  }
                }
              }

              ++v6;
              id v7 = v2;
            }
            while (v6 != v40);
            uint64_t v5 = [v38 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v5);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v33);
  }
}

- (id)newPurgeableBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:
{
  if (result)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    os_signpost_id_t v10 = __Block_byref_object_copy__26;
    unint64_t v11 = __Block_byref_object_dispose__26;
    id v12 = 0;
    unint64_t v4 = *((void *)result + 47);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKMetalResourceHandler_newPurgeableBufferWithLength_bytes_outOffset___block_invoke;
    block[3] = &unk_1E64CA460;
    void block[4] = result;
    void block[5] = &v7;
    void block[6] = a2;
    void block[7] = a3;
    block[8] = a4;
    dispatch_sync(v4, block);
    id v5 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    return v5;
  }
  return result;
}

void __71__PKMetalResourceHandler_newPurgeableBufferWithLength_bytes_outOffset___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 392);
  if (v2) {
    id v2 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:]((uint64_t)v2, *(void *)(a1 + 48), *(const void **)(a1 + 56), *(unint64_t **)(a1 + 64), 0);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)newBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:
{
  if (result)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    os_signpost_id_t v10 = __Block_byref_object_copy__26;
    unint64_t v11 = __Block_byref_object_dispose__26;
    id v12 = 0;
    unint64_t v4 = *((void *)result + 47);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PKMetalResourceHandler_newBufferWithLength_bytes_outOffset___block_invoke;
    block[3] = &unk_1E64CA460;
    void block[4] = result;
    void block[5] = &v7;
    void block[6] = a2;
    void block[7] = a3;
    block[8] = a4;
    dispatch_sync(v4, block);
    id v5 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    return v5;
  }
  return result;
}

void __62__PKMetalResourceHandler_newBufferWithLength_bytes_outOffset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 400);
  if (v2
    && (uint64_t v3 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:](v2, *(void *)(a1 + 48), *(const void **)(a1 + 56), *(unint64_t **)(a1 + 64), 0)) != 0)
  {
    id v5 = v3;
    unint64_t v4 = (void *)v3[3];
  }
  else
  {
    id v5 = 0;
    unint64_t v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
}

- (id)newGPUBufferWithLength:(uint64_t)a3 outOffset:(void *)a4 commandBuffer:
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a1)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__26;
    unint64_t v21 = __Block_byref_object_dispose__26;
    id v22 = 0;
    uint64_t v9 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke;
    block[3] = &unk_1E64CA4B0;
    os_signpost_id_t v14 = &v17;
    uint64_t v15 = a2;
    void block[4] = a1;
    uint64_t v16 = a3;
    id v13 = v7;
    dispatch_sync(v9, block);
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 408);
  unint64_t v3 = *(void *)(a1 + 56);
  unint64_t v4 = *(unint64_t **)(a1 + 64);
  id v13 = 0;
  id v5 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:](v2, v3, 0, v4, &v13);
  id v6 = v13;
  if (v5) {
    id v7 = (void *)v5[3];
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);

  if (v6 && *(void *)(a1 + 40))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_2;
    v9[3] = &unk_1E64CA488;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [v8 addCompletedHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_2(uint64_t a1)
{
  WeakRetainedouble d = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained[47];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_3;
    v5[3] = &unk_1E64C5870;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_3(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_gpuResourceBuffer, 0);
  objc_storeStrong((id *)&self->_resourceBuffer, 0);
  objc_storeStrong((id *)&self->_purgeableResourceBuffer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_randomNumberBuffer, 0);
  objc_storeStrong((id *)&self->_uint32IndexBuffer, 0);
  objc_storeStrong((id *)&self->_uint16IndexBuffer, 0);
  objc_storeStrong((id *)&self->_strokeRenderCache, 0);
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  next = (id *)self->_kernelPipelines.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_kernelPipelines.__table_.__bucket_list_.__ptr_.__value_;
  self->_kernelPipelines.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  id v6 = (id *)self->_pipelineDescriptors.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      id v7 = (id *)*v6;

      operator delete(v6);
      id v6 = v7;
    }
    while (v7);
  }
  uint64_t v8 = self->_pipelineDescriptors.__table_.__bucket_list_.__ptr_.__value_;
  self->_pipelineDescriptors.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8) {
    operator delete(v8);
  }
  uint64_t v9 = (id *)self->_namedShaders.__table_.__p1_.__value_.__next_;
  if (v9)
  {
    do
    {
      id v10 = (id *)*v9;

      operator delete(v9);
      uint64_t v9 = v10;
    }
    while (v10);
  }
  id v11 = self->_namedShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_namedShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v11) {
    operator delete(v11);
  }
  id v12 = (id *)self->_sixChannelShaders.__table_.__p1_.__value_.__next_;
  if (v12)
  {
    do
    {
      id v13 = (id *)*v12;

      operator delete(v12);
      id v12 = v13;
    }
    while (v13);
  }
  os_signpost_id_t v14 = self->_sixChannelShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_sixChannelShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v14) {
    operator delete(v14);
  }
  uint64_t v15 = (id *)self->_uberShaders.__table_.__p1_.__value_.__next_;
  if (v15)
  {
    do
    {
      uint64_t v16 = (id *)*v15;

      operator delete(v15);
      uint64_t v15 = v16;
    }
    while (v16);
  }
  uint64_t v17 = self->_uberShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_uberShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v17) {
    operator delete(v17);
  }
  objc_storeStrong((id *)&self->_inkTextures, 0);
  objc_storeStrong((id *)&self->_cachedQuadTexCoordBuffer, 0);
  objc_storeStrong((id *)&self->_cachedQuadVertexBuffer, 0);
  objc_storeStrong((id *)&self->_sixChannelCopyToCanvasPipelineState, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineStateWithLiveStrokeParticles, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineStateWithLiveStrokeMode, 0);
  objc_storeStrong((id *)&self->_sdfPenEllipseLookupTexture, 0);
  objc_storeStrong((id *)&self->_sdfPenMaxHeightLookupTexture, 0);
  objc_storeStrong((id *)&self->_sdfPenShaderKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_particleShaderKernelPipelineStateWithVariableSpacing, 0);

  objc_storeStrong((id *)&self->_particleShaderKernelPipelineState, 0);
}

@end