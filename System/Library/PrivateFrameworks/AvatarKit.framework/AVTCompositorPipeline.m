@interface AVTCompositorPipeline
- (AVTCompositorPipeline)initWithFunction:(id)a3;
- (void)compositeTexture:(id)a3 forMemoji:(id)a4 considerSkin:(BOOL)a5 componentsToConsider:(unint64_t)a6 computeCommandHandler:(id)a7 blitCommandHandler:(id)a8 completionHandler:(id)a9 helper:(id)a10 helperTokens:(id)a11;
@end

@implementation AVTCompositorPipeline

- (AVTCompositorPipeline)initWithFunction:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)AVTCompositorPipeline;
  v57 = [(AVTCompositorPipeline *)&v74 init];
  if (v57)
  {
    if (!v4) {
      -[AVTCompositorPipeline initWithFunction:]();
    }
    v5 = [v4 device];
    id v6 = objc_alloc_init(MEMORY[0x263F12858]);
    [v6 setComputeFunction:v4];
    v7 = [v4 name];
    [v6 setLabel:v7];

    id v72 = 0;
    id v73 = 0;
    v54 = v6;
    v55 = v5;
    uint64_t v8 = [v5 newComputePipelineStateWithDescriptor:v6 options:1 reflection:&v73 error:&v72];
    id v9 = v73;
    id v10 = v72;
    pipelineState = v57->_pipelineState;
    v57->_pipelineState = (MTLComputePipelineState *)v8;

    if (!v57->_pipelineState)
    {
      v12 = avt_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(AVTCompositorPipeline *)v4 initWithFunction:v12];
      }
    }
    v52 = v10;
    id v56 = v4;
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v53 = v9;
    v14 = [v9 arguments];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
    v16 = v57;
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v69;
      v58 = v14;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v69 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v21 = [v20 name];
          int v22 = [v21 isEqualToString:@"dst"];

          if (!v22)
          {
            v23 = [v20 name];
            int v24 = [v23 isEqualToString:@"builtin_skinColor"];

            if (v24)
            {
              if ([v20 type]) {
                -[AVTCompositorPipeline initWithFunction:].cold.5();
              }
              if ([v20 bufferDataType] != 6) {
                -[AVTCompositorPipeline initWithFunction:].cold.4();
              }
              v16->_isAffectedBySkin = 1;
              v67[0] = MEMORY[0x263EF8330];
              v67[1] = 3221225472;
              v67[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke;
              v67[3] = &unk_26401F3F0;
              v67[4] = v20;
              v25 = v67;
LABEL_23:
              v28 = (void *)MEMORY[0x210539A20](v25);
              [v13 addObject:v28];

              continue;
            }
            v26 = [v20 name];
            int v27 = [v26 isEqualToString:@"builtin_mouthInside"];

            if (v27)
            {
              if ([v20 type] != 2) {
                -[AVTCompositorPipeline initWithFunction:].cold.6();
              }
              v66[0] = MEMORY[0x263EF8330];
              v66[1] = 3221225472;
              v66[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_2;
              v66[3] = &unk_26401F3F0;
              v66[4] = v20;
              v25 = v66;
              goto LABEL_23;
            }
            v29 = v13;
            v30 = [v20 name];
            v31 = [v30 componentsSeparatedByString:@"_"];

            uint64_t v32 = [v31 count];
            v33 = [v31 objectAtIndexedSubscript:0];
            uint64_t v34 = AVTComponentTypeFromString(v33);

            if (v34 == 42) {
              -[AVTCompositorPipeline initWithFunction:].cold.7();
            }
            v16->_affectingComponentsMask |= 1 << v34;
            switch(v32)
            {
              case 3:
                if ([v20 type] != 2) {
                  -[AVTCompositorPipeline initWithFunction:]8();
                }
                v36 = [v31 objectAtIndexedSubscript:1];
                if (([v36 isEqualToString:@"layer"] & 1) == 0) {
                  -[AVTCompositorPipeline initWithFunction:]7();
                }

                v37 = [v31 objectAtIndexedSubscript:2];
                v59[0] = MEMORY[0x263EF8330];
                v59[1] = 3221225472;
                v59[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_6;
                v59[3] = &unk_26401F468;
                v61 = v20;
                uint64_t v62 = v34;
                id v60 = v37;
                id v38 = v37;
                v39 = (void *)MEMORY[0x210539A20](v59);
                id v13 = v29;
                [v29 addObject:v39];

                break;
              case 2:
                v40 = [v31 objectAtIndexedSubscript:1];
                if ([v40 hasPrefix:@"color"])
                {
                  if ([v20 type]) {
                    -[AVTCompositorPipeline initWithFunction:]2();
                  }
                  if ([v20 bufferDataType] != 6) {
                    -[AVTCompositorPipeline initWithFunction:]1();
                  }
                  v41 = [v40 substringFromIndex:objc_msgSend(@"color", "length")];
                  uint64_t v42 = [v41 integerValue];

                  v43 = [v31 objectAtIndexedSubscript:0];
                  uint64_t v44 = AVTPresetCategoryFromString(v43);

                  if (v44 == 40) {
                    -[AVTCompositorPipeline initWithFunction:]0();
                  }
                  v45 = v64;
                  v64[0] = MEMORY[0x263EF8330];
                  v64[1] = 3221225472;
                  v64[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_4;
                  v64[3] = &unk_26401F440;
                  v64[5] = v44;
                  v64[6] = v42 - 1;
                }
                else
                {
                  if (![v40 isEqualToString:@"uvRemapping"]) {
                    -[AVTCompositorPipeline initWithFunction:]6();
                  }
                  if ([v20 type]) {
                    -[AVTCompositorPipeline initWithFunction:]5();
                  }
                  if ([v20 bufferDataType] != 1) {
                    -[AVTCompositorPipeline initWithFunction:]4();
                  }
                  v46 = [v31 objectAtIndexedSubscript:0];
                  uint64_t v47 = AVTPresetCategoryFromString(v46);

                  if (v47 == 40) {
                    -[AVTCompositorPipeline initWithFunction:]3();
                  }
                  v45 = v63;
                  v63[0] = MEMORY[0x263EF8330];
                  v63[1] = 3221225472;
                  v63[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_5;
                  v63[3] = &unk_26401F418;
                  v63[5] = v34;
                }
                v45[4] = v20;
                v48 = (void *)MEMORY[0x210539A20]();
                id v13 = v29;
                [v29 addObject:v48];

                break;
              case 1:
                if ([v20 type] != 2) {
                  -[AVTCompositorPipeline initWithFunction:].cold.9();
                }
                v65[0] = MEMORY[0x263EF8330];
                v65[1] = 3221225472;
                v65[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_3;
                v65[3] = &unk_26401F418;
                v65[4] = v20;
                v65[5] = v34;
                v35 = (void *)MEMORY[0x210539A20](v65);
                id v13 = v29;
                [v29 addObject:v35];

                goto LABEL_45;
              default:
                -[AVTCompositorPipeline initWithFunction:].cold.8();
            }
            v16 = v57;
LABEL_45:

            v14 = v58;
            continue;
          }
          if ([v20 type] != 2) {
            -[AVTCompositorPipeline initWithFunction:]();
          }
          if ([v20 index]) {
            -[AVTCompositorPipeline initWithFunction:]();
          }
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v17);
    }

    uint64_t v49 = [v13 copy];
    bindings = v16->_bindings;
    v16->_bindings = (NSArray *)v49;

    id v4 = v56;
  }

  return v57;
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  v7 = [a4 skinColor];
  *(double *)&long long v9 = AVTGetColorComponents(v7, v8);
  long long v10 = v9;

  long long v11 = v10;
  objc_msgSend(v6, "setBytes:length:atIndex:", &v11, 16, objc_msgSend(*(id *)(a1 + 32), "index"));
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  long long v11 = +[AVTResourceLocator sharedResourceLocator]();
  v12 = -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v11, @"mouthInside", @"heic", @"textures", 0);

  char v18 = 0;
  id v13 = [NSURL fileURLWithPath:v12 isDirectory:0];
  id v17 = 0;
  v14 = [v9 cachedTextureWithURL:v13 token:&v17 didFallbackToDefaultTexture:&v18];

  id v15 = v17;
  v16 = 0;
  if (!v18)
  {
    v16 = v14;
    if (v15)
    {
      [v8 addObject:v15];
      v16 = v14;
    }
  }
  objc_msgSend(v10, "setTexture:atIndex:", v16, objc_msgSend(*(id *)(a1 + 32), "index"));
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v12 = [a4 componentInstanceForType:*(void *)(a1 + 40)];
  id v13 = [v12 assetImage];
  if (v13)
  {
    char v19 = 0;
    v14 = [NSURL fileURLWithPath:v13 isDirectory:0];
    id v18 = 0;
    id v15 = [v10 cachedTextureWithURL:v14 token:&v18 didFallbackToDefaultTexture:&v19];
    id v16 = v18;

    id v17 = 0;
    if (!v19)
    {
      id v17 = v15;
      if (v16)
      {
        [v11 addObject:v16];
        id v17 = v15;
      }
    }
    objc_msgSend(v9, "setTexture:atIndex:", v17, objc_msgSend(*(id *)(a1 + 32), "index"));
  }
  else
  {
    objc_msgSend(v9, "setTexture:atIndex:", 0, objc_msgSend(*(id *)(a1 + 32), "index"));
  }
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = a2;
  id v9 = [a4 colorPresetForCategory:v6 colorIndex:v7];
  id v10 = [v9 baseColor];
  *(double *)&long long v12 = AVTGetColorComponents(v10, v11);
  long long v13 = v12;

  long long v14 = v13;
  objc_msgSend(v8, "setBytes:length:atIndex:", &v14, 16, objc_msgSend(*(id *)(a1 + 32), "index"));
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v8 = [a4 componentInstanceForType:v6];
  id v9 = v8;
  long long v10 = 0u;
  long long v11 = 0u;
  if (v8)
  {
    objc_msgSend(v8, "uvRemappingInfo", v10, v11);
  }
  else
  {
    *((void *)&v10 + 1) = 1065353216;
    long long v11 = 0x3F80000000000000uLL;
  }
  objc_msgSend(v7, "setBytes:length:atIndex:", &v10, 32, objc_msgSend(*(id *)(a1 + 32), "index", v10, v11));
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  long long v12 = [a4 componentInstanceForType:*(void *)(a1 + 48)];
  long long v13 = [v12 assetImageWithLayerNamed:*(void *)(a1 + 32)];
  if (v13)
  {
    char v19 = 0;
    long long v14 = [NSURL fileURLWithPath:v13 isDirectory:0];
    id v18 = 0;
    id v15 = [v10 cachedTextureWithURL:v14 token:&v18 didFallbackToDefaultTexture:&v19];
    id v16 = v18;

    id v17 = 0;
    if (!v19)
    {
      id v17 = v15;
      if (v16)
      {
        [v11 addObject:v16];
        id v17 = v15;
      }
    }
    objc_msgSend(v9, "setTexture:atIndex:", v17, objc_msgSend(*(id *)(a1 + 40), "index"));
  }
  else
  {
    objc_msgSend(v9, "setTexture:atIndex:", 0, objc_msgSend(*(id *)(a1 + 40), "index"));
  }
}

- (void)compositeTexture:(id)a3 forMemoji:(id)a4 considerSkin:(BOOL)a5 componentsToConsider:(unint64_t)a6 computeCommandHandler:(id)a7 blitCommandHandler:(id)a8 completionHandler:(id)a9 helper:(id)a10 helperTokens:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  char v19 = (void (**)(id, void *))a7;
  v20 = (void (**)(id, void *))a8;
  v21 = (void (**)(id, void *))a9;
  id v22 = a10;
  id v23 = a11;
  if (self->_isAffectedBySkin && a5
    || (self->_affectingComponentsMask & a6) != 0
    || self->_shouldCompositeAgainDueToGPUError)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke;
    v30[3] = &unk_26401F490;
    v30[4] = self;
    id v31 = v22;
    id v32 = v18;
    id v33 = v23;
    id v24 = v17;
    id v34 = v24;
    v19[2](v19, v30);
    if ((unint64_t)[v24 mipmapLevelCount] >= 2)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_2;
      v28[3] = &unk_26401F4B8;
      id v29 = v24;
      v20[2](v20, v28);
    }
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_3;
    v25[3] = &unk_26401F4E0;
    objc_copyWeak(&v26, &location);
    v21[2](v21, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) threadExecutionWidth];
  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) maxTotalThreadsPerThreadgroup];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  [v3 setComputePipelineState:*(void *)(*(void *)(a1 + 32) + 32)];
  [v3 setTexture:*(void *)(a1 + 64) atIndex:0];
  id v11 = [v3 device];
  int v13 = AVTMTLDeviceSupportsNonUniformThreadgroupSize(v11, v12);

  if (v13)
  {
    unint64_t v14 = v5 / v4;
    uint64_t v15 = [*(id *)(a1 + 64) width];
    uint64_t v16 = [*(id *)(a1 + 64) height];
    unint64_t v28 = v15;
    unint64_t v29 = v16;
    uint64_t v30 = 1;
    unint64_t v25 = v4;
    unint64_t v26 = v14;
    uint64_t v27 = 1;
    [v3 dispatchThreads:&v28 threadsPerThreadgroup:&v25];
  }
  else
  {
    unint64_t v17 = [*(id *)(a1 + 64) width];
    if (v4 >= v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = v4;
    }
    unint64_t v19 = [*(id *)(a1 + 64) height];
    if (v4 >= v19) {
      unint64_t v20 = v19;
    }
    else {
      unint64_t v20 = v4;
    }
    do
    {
      unint64_t v21 = v20;
      unint64_t v22 = v20 * v18;
      v20 >>= 1;
    }
    while (v22 > v5);
    unint64_t v23 = v18 + [*(id *)(a1 + 64) width] - 1;
    id v24 = *(void **)(a1 + 64);
    unint64_t v28 = v23 / v18;
    unint64_t v29 = (v21 + [v24 height] - 1) / v21;
    uint64_t v30 = 1;
    unint64_t v25 = v18;
    unint64_t v26 = v21;
    uint64_t v27 = 1;
    [v3 dispatchThreadgroups:&v28 threadsPerThreadgroup:&v25];
  }
}

uint64_t __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 generateMipmapsForTexture:*(void *)(a1 + 32)];
}

void __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_3(uint64_t a1, void *a2)
{
  if ([a2 status] != 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained) {
      WeakRetained[9] = 1;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
}

- (void)initWithFunction:.cold.1()
{
}

- (void)initWithFunction:.cold.2()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 77, "argument.index == 0");
}

- (void)initWithFunction:.cold.3()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 76, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.4()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 83, "argument.bufferDataType == MTLDataTypeFloat4");
}

- (void)initWithFunction:.cold.5()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 82, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.6()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 97, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.7()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 123, "componentType != AVTComponentTypeNone");
}

- (void)initWithFunction:.cold.8()
{
}

- (void)initWithFunction:.cold.9()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 127, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.10()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 165, "category != AVTPresetCategoryNone");
}

- (void)initWithFunction:.cold.11()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 160, "argument.bufferDataType == MTLDataTypeFloat4");
}

- (void)initWithFunction:.cold.12()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 159, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.13()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 184, "category != AVTPresetCategoryNone");
}

- (void)initWithFunction:.cold.14()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 181, "argument.bufferDataType == MTLDataTypeStruct");
}

- (void)initWithFunction:.cold.15()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 180, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.16()
{
}

- (void)initWithFunction:.cold.17()
{
}

- (void)initWithFunction:.cold.18()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 203, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:(NSObject *)a3 .cold.19(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a1 name];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: Error compiling '%@' kernel function: %@", (uint8_t *)&v6, 0x16u);
}

@end