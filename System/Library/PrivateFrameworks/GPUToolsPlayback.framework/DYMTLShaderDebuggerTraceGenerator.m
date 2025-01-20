@interface DYMTLShaderDebuggerTraceGenerator
- (BOOL)_createAndSetInstrumentedComputePipelineStateWithDescriptor:(id)a3 computeCommandEncoder:(id)a4;
- (BOOL)_createAndSetInstrumentedRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4 roiType:(int)a5;
- (BOOL)_createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4;
- (BOOL)_createTraceBufferWithGenerationOptions:(id)a3;
- (BOOL)_fragmentBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4;
- (BOOL)_kernelBindingNeedsPlaceholderResource:(id)a3 computeCommandEncoder:(id)a4;
- (BOOL)_prepareComputeCommandEncoder:(id)a3 generationOptions:(id)a4;
- (BOOL)_prepareRenderCommandEncoder:(id)a3 generationOptions:(id)a4;
- (BOOL)_prepareTraceBufferWithGenerationOptions:(id)a3;
- (BOOL)_tileBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4;
- (BOOL)_vertexBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4;
- (DYMTLShaderDebuggerTraceGenerator)initWithDebugFunctionPlayer:(id)a3;
- (id).cxx_construct;
- (id)_createInstrumentedFunctionWithInstrumentedLibrary:(id)a3 originalFunction:(id)a4;
- (id)_generateConstantSamplerReflectionWithUniqueIdentifiers:(id)a3 descriptors:(id)a4;
- (id)_generateResourceResolutionRemappingTables;
- (id)_instrumentLibrary:(id)a3 generationOptions:(id)a4;
- (id)_placeholderTextureWithType:(unint64_t)a3;
- (id)notifyReplayFinishedAndGenerateTraceContainer;
- (uint64_t)notifyReplayFinishedAndGenerateTraceContainer;
- (void)notifyReplayFinishedAndGenerateTraceContainer;
- (void)prepareCommandEncoderForInstrumentedCall:(unint64_t)a3 generationOptions:(id)a4;
@end

@implementation DYMTLShaderDebuggerTraceGenerator

- (DYMTLShaderDebuggerTraceGenerator)initWithDebugFunctionPlayer:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DYMTLShaderDebuggerTraceGenerator;
  v6 = [(DYMTLShaderDebuggerTraceGenerator *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    uint64_t v8 = [v5 indirectArgumentManager];
    indirectArgumentManager = v7->_indirectArgumentManager;
    v7->_indirectArgumentManager = (DYMTLIndirectArgumentBufferManager *)v8;

    v10 = [(DYMTLFunctionPlayer *)v7->_player device];
    constantSamplerReflection = v7->_constantSamplerReflection;
    v7->_constantSamplerReflection = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v12 = [v10 newBufferWithLength:2048 options:0];
    placeholderBuffer = v7->_placeholderBuffer;
    v7->_placeholderBuffer = (MTLBuffer *)v12;

    id v14 = objc_alloc_init(MEMORY[0x263F129F0]);
    [v14 setSupportArgumentBuffers:1];
    uint64_t v15 = [v10 newSamplerStateWithDescriptor:v14];
    placeholderSamplerState = v7->_placeholderSamplerState;
    v7->_placeholderSamplerState = (MTLSamplerState *)v15;

    v17 = [MEMORY[0x263F127C0] argumentDescriptor];
    [v17 setDataType:58];
    [v17 setIndex:0];
    v18 = [MEMORY[0x263F127C0] argumentDescriptor];
    [v18 setDataType:59];
    [v18 setIndex:1];
    v26[0] = v17;
    v26[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    uint64_t v20 = [v10 newArgumentEncoderWithArguments:v19];
    dummyArgumentEncoder = v7->_dummyArgumentEncoder;
    v7->_dummyArgumentEncoder = (MTLArgumentEncoder *)v20;

    uint64_t v22 = [v10 newBufferWithLength:4096 options:0];
    dummyArgumentBuffer = v7->_dummyArgumentBuffer;
    v7->_dummyArgumentBuffer = (MTLBuffer *)v22;

    [(MTLArgumentEncoder *)v7->_dummyArgumentEncoder setArgumentBuffer:v7->_dummyArgumentBuffer offset:0];
  }

  return v7;
}

- (id)_placeholderTextureWithType:(unint64_t)a3
{
  unint64_t v17 = a3;
  p_pair1 = &self->_placeholderTextures.__tree_.__pair1_;
  left = (char *)self->_placeholderTextures.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = &self->_placeholderTextures.__tree_.__pair1_;
    do
    {
      unint64_t v7 = *((void *)left + 4);
      BOOL v8 = v7 >= a3;
      if (v7 >= a3) {
        v9 = (char **)left;
      }
      else {
        v9 = (char **)(left + 8);
      }
      if (v8) {
        v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLTextureType, id<MTLTexture>>, void *>>> *)left;
      }
      left = *v9;
    }
    while (*v9);
    if (v6 != p_pair1 && v6[4].__value_.__left_ <= (void *)a3)
    {
      id v13 = v6[5].__value_.__left_;
      goto LABEL_23;
    }
  }
  v10 = [(DYMTLFunctionPlayer *)self->_player device];
  if (a3 < 2) {
    goto LABEL_15;
  }
  if (a3 == 4)
  {
    int v11 = 1;
LABEL_19:
    uint64_t v12 = 16;
    goto LABEL_20;
  }
  if (a3 != 9)
  {
    int v11 = 0;
    goto LABEL_19;
  }
LABEL_15:
  int v11 = 0;
  uint64_t v12 = 1;
LABEL_20:
  id v14 = objc_alloc_init(MEMORY[0x263F12A58]);
  [v14 setTextureType:a3];
  [v14 setPixelFormat:125];
  [v14 setWidth:16];
  [v14 setHeight:v12];
  [v14 setDepth:1];
  [v14 setMipmapLevelCount:1];
  if (v11)
  {
    [v14 setSampleCount:4];
    [v14 setResourceOptions:32];
  }
  DYMTLNewTexture(v10, v14);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v18 = &v17;
  uint64_t v15 = std::__tree<std::__value_type<unsigned long long,unsigned long long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&p_pair1[-1], &v17, (uint64_t)&std::piecewise_construct, (uint64_t **)&v18);
  objc_storeStrong((id *)v15 + 5, v13);

LABEL_23:
  return v13;
}

- (id)_instrumentLibrary:(id)a3 generationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = v6;
    v9 = [v8 code];
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = [v8 debugType];
    }
    else {
      uint64_t v10 = [v8 type];
    }
    uint64_t v11 = v10;
    uint64_t v12 = [v8 compileOptions];
  }
  else
  {
    DYMTLGetAssociatedObject(v6, 3u);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 type];
    v9 = [v8 code];
    uint64_t v12 = [v8 compileOptions];
  }
  id v13 = (void *)v12;

  if (v11 == 2)
  {
    id v14 = (void *)[v13 copy];
    uint64_t v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x263F12830]);
    }
    id v18 = v16;

    [v18 setTracingEnabled:1];
    if (objc_opt_respondsToSelector()) {
      [v18 setAdditionalCompilerArguments:@"-fno-tracepoint-instrument-line-markers"];
    }
    v23 = [v6 device];
    uint64_t v24 = [v23 argumentBuffersSupport];

    if (!v24) {
      [v18 setAdditionalCompilerArguments:@"-fno-tracepoint-instrument-argument-buffers"];
    }
    objc_storeStrong((id *)&self->_onlineSrc, v9);
    objc_super v25 = [v6 device];
    onlineSrc = self->_onlineSrc;
    id v38 = 0;
    v21 = (void *)[v25 newLibraryWithSource:onlineSrc options:v18 error:&v38];
    id v22 = v38;

    if (v21) {
      goto LABEL_19;
    }
    v29 = NSString;
    v19 = [v22 description];
    v30 = [v29 stringWithFormat:@"Error creating instrumented library: %@", v19];
    errorStr = self->_errorStr;
    self->_errorStr = v30;

LABEL_23:
    goto LABEL_24;
  }
  unint64_t v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F3FCA0]];
  if (v17)
  {
    id v18 = v17;
    v19 = dispatch_data_create((const void *)[v18 bytes], objc_msgSend(v18, "length"), 0, 0);
    uint64_t v20 = [v6 device];
    id v37 = 0;
    v21 = (void *)[v20 newLibraryWithData:v19 error:&v37];
    id v22 = v37;

    if (v21)
    {

LABEL_19:
      id v27 = v21;
      goto LABEL_25;
    }
    v32 = NSString;
    v33 = [v22 description];
    v34 = [v32 stringWithFormat:@"Error creating instrumented library: %@", v33];
    v35 = self->_errorStr;
    self->_errorStr = v34;

    goto LABEL_23;
  }
  v28 = self->_errorStr;
  self->_errorStr = (NSString *)@"kDYMTLShaderDebuggerInstrumentedMetallib is nil";

  id v22 = 0;
LABEL_24:
  id v27 = 0;
LABEL_25:

  return v27;
}

- (BOOL)_kernelBindingNeedsPlaceholderResource:(id)a3 computeCommandEncoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isActive] & 1) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v8 = [v5 type];
    if (v8)
    {
      if (v8 == 2)
      {
        v9 = v12;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_2;
        v12[3] = &unk_265339058;
        v12[4] = v5;
        v12[5] = &v14;
        [v6 enumerateTexturesUsingBlock:v12];
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          BOOL v7 = *((unsigned char *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        v9 = v11;
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_3;
        v11[3] = &unk_265339080;
        v11[4] = v5;
        v11[5] = &v14;
        [v6 enumerateSamplersUsingBlock:v11];
      }
    }
    else
    {
      v9 = v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke;
      v13[3] = &unk_265338FA0;
      v13[4] = v5;
      v13[5] = &v14;
      [v6 enumerateBuffersUsingBlock:v13];
    }

    goto LABEL_10;
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

void __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (*(void *)a2)
    {
      if (!v7)
      {
        id v8 = *(id *)a2;
        unint64_t v9 = [v8 length];
        if (v9 >= [*(id *)(a1 + 32) bufferDataSize]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }
    else if (v7)
    {
      unint64_t v10 = *(void *)(a2 + 16);
      if (v10 >= [*(id *)(a1 + 32) bufferDataSize]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
    *a4 = 1;
  }
}

void __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = [v8 textureType];
    if (v7 == [*(id *)(a1 + 32) textureType]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

uint64_t __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) index];
  if (result == a3)
  {
    if (*a2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
  return result;
}

- (BOOL)_vertexBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isActive] & 1) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v8 = [v5 type];
    if (v8)
    {
      if (v8 == 2)
      {
        unint64_t v9 = v12;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_265339058;
        v12[4] = v5;
        v12[5] = &v14;
        [v6 enumerateVertexTexturesUsingBlock:v12];
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          BOOL v7 = *((unsigned char *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        unint64_t v9 = v11;
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_265339080;
        v11[4] = v5;
        v11[5] = &v14;
        [v6 enumerateVertexSamplersUsingBlock:v11];
      }
    }
    else
    {
      unint64_t v9 = v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_265338FA0;
      v13[4] = v5;
      v13[5] = &v14;
      [v6 enumerateVertexBuffersUsingBlock:v13];
    }

    goto LABEL_10;
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

void __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (*(void *)a2)
    {
      if (!v7)
      {
        id v8 = *(id *)a2;
        unint64_t v9 = [v8 length];
        if (v9 >= [*(id *)(a1 + 32) bufferDataSize]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }
    else if (v7)
    {
      unint64_t v10 = *(void *)(a2 + 16);
      if (v10 >= [*(id *)(a1 + 32) bufferDataSize]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
    *a4 = 1;
  }
}

void __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = [v8 textureType];
    if (v7 == [*(id *)(a1 + 32) textureType]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

uint64_t __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) index];
  if (result == a3)
  {
    if (*a2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
  return result;
}

- (BOOL)_fragmentBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isActive] & 1) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v8 = [v5 type];
    if (v8)
    {
      if (v8 == 2)
      {
        unint64_t v9 = v12;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_265339058;
        v12[4] = v5;
        v12[5] = &v14;
        [v6 enumerateFragmentTexturesUsingBlock:v12];
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          BOOL v7 = *((unsigned char *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        unint64_t v9 = v11;
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_265339080;
        v11[4] = v5;
        v11[5] = &v14;
        [v6 enumerateFragmentSamplersUsingBlock:v11];
      }
    }
    else
    {
      unint64_t v9 = v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_265338FA0;
      v13[4] = v5;
      v13[5] = &v14;
      [v6 enumerateFragmentBuffersUsingBlock:v13];
    }

    goto LABEL_10;
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

void __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (*(void *)a2)
    {
      if (!v7)
      {
        id v8 = *(id *)a2;
        unint64_t v9 = [v8 length];
        if (v9 >= [*(id *)(a1 + 32) bufferDataSize]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }
    else if (v7)
    {
      unint64_t v10 = *(void *)(a2 + 16);
      if (v10 >= [*(id *)(a1 + 32) bufferDataSize]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
    *a4 = 1;
  }
}

void __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = [v8 textureType];
    if (v7 == [*(id *)(a1 + 32) textureType]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

uint64_t __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) index];
  if (result == a3)
  {
    if (*a2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
  return result;
}

- (BOOL)_tileBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isActive] & 1) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v8 = [v5 type];
    if (v8)
    {
      if (v8 == 2)
      {
        unint64_t v9 = v12;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_265339058;
        v12[4] = v5;
        v12[5] = &v14;
        [v6 enumerateTileTexturesUsingBlock:v12];
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          BOOL v7 = *((unsigned char *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        unint64_t v9 = v11;
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_265339080;
        v11[4] = v5;
        v11[5] = &v14;
        [v6 enumerateTileSamplersUsingBlock:v11];
      }
    }
    else
    {
      unint64_t v9 = v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_265338FA0;
      v13[4] = v5;
      v13[5] = &v14;
      [v6 enumerateTileBuffersUsingBlock:v13];
    }

    goto LABEL_10;
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

void __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (*(void *)a2)
    {
      if (!v7)
      {
        id v8 = *(id *)a2;
        unint64_t v9 = [v8 length];
        if (v9 >= [*(id *)(a1 + 32) bufferDataSize]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }
    else if (v7)
    {
      unint64_t v10 = *(void *)(a2 + 16);
      if (v10 >= [*(id *)(a1 + 32) bufferDataSize]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
    *a4 = 1;
  }
}

void __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) index] == a3)
  {
    uint64_t v7 = [v8 textureType];
    if (v7 == [*(id *)(a1 + 32) textureType]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

uint64_t __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) index];
  if (result == a3)
  {
    if (*a2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
  return result;
}

- (BOOL)_prepareRenderCommandEncoder:(id)a3 generationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForKey:*MEMORY[0x263F3FD40]];
  uint64_t v9 = [v8 unsignedIntValue];

  unint64_t v10 = [v7 valueForKey:*MEMORY[0x263F3FCA8]];
  uint64_t v11 = [v6 renderPipelineState];
  uint64_t v12 = DYMTLGetNullableAssociatedObject(v11, 0);
  id v13 = (void *)[v12 copy];

  uint64_t v14 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", [v10 unsignedLongLongValue]);
  if (v14)
  {
    v102 = [(DYMTLShaderDebuggerTraceGenerator *)self _instrumentLibrary:v14 generationOptions:v7];
    if (v102)
    {
      v101 = DYMTLGetAssociatedObject(v11, 2u);
      switch((int)v9)
      {
        case 0:
          v41 = DYMTLGetAssociatedObject(v11, 1u);
          id v38 = (void *)[v41 copy];

          objc_msgSend(v38, "setMaxTotalThreadsPerThreadgroup:", objc_msgSend(v11, "maxTotalThreadsPerThreadgroup"));
          v99 = [v38 tileFunction];
          v42 = [(DYMTLShaderDebuggerTraceGenerator *)self _createInstrumentedFunctionWithInstrumentedLibrary:v102 originalFunction:v99];
          if (!v42
            || (v84 = v42,
                objc_msgSend(v38, "setTileFunction:"),
                BOOL v43 = [(DYMTLShaderDebuggerTraceGenerator *)self _createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:v38 renderCommandEncoder:v6], v42 = v84, !v43))
          {

            goto LABEL_46;
          }
          v44 = objc_msgSend(v101, "tileBindings", v84);
          v87 = v14;
          v108[0] = MEMORY[0x263EF8330];
          v108[1] = 3221225472;
          v108[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_7;
          v108[3] = &unk_2653390A8;
          v108[4] = self;
          id v45 = v6;
          id v109 = v45;
          id v94 = v6;
          id v96 = v7;
          v90 = v11;
          v92 = v10;
          [v44 enumerateObjectsUsingBlock:v108];

          v107[0] = MEMORY[0x263EF8330];
          v107[1] = 3221225472;
          v107[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_8;
          v107[3] = &unk_2653390D0;
          v107[4] = self;
          [v45 enumerateTileTexturesUsingBlock:v107];
          uint64_t v122 = 0;
          v123 = &v122;
          uint64_t v124 = 0x4812000000;
          v125 = __Block_byref_object_copy__2;
          v126 = __Block_byref_object_dispose__2;
          v127 = "";
          uint64_t v130 = 0;
          v129 = 0;
          v128 = &v129;
          v106[0] = MEMORY[0x263EF8330];
          v106[1] = 3221225472;
          v106[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_9;
          v106[3] = &unk_2653390F8;
          v106[4] = &v122;
          [v45 enumerateTileSamplersUsingBlock:v106];
          v46 = (uint64_t *)v123[6];
          v47 = v123 + 7;
          if (v46 != v123 + 7)
          {
            do
            {
              uint64_t v48 = v46[4];
              v49 = (void *)v46[5];
              int v50 = *((_DWORD *)v46 + 12);
              int v51 = *((_DWORD *)v46 + 13);
              v52 = DYMTLGetAssociatedObject(v49, 0);
              v53 = (void *)[v52 copy];

              [v53 setSupportArgumentBuffers:1];
              v54 = [v49 device];
              id v120 = (id)[v54 newSamplerStateWithDescriptor:v53];

              [(MTLArgumentEncoder *)self->_dummyArgumentEncoder setSamplerState:v120 atIndex:1];
              LODWORD(v55) = v50;
              LODWORD(v56) = v51;
              [v45 setTileSamplerState:v120 lodMinClamp:v48 lodMaxClamp:v55 atIndex:v56];
              unint64_t v57 = [(DYMTLFunctionPlayer *)self->_player keyForOriginalObject:v49];
              v134[0] = &v120;
              std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v120, (uint64_t)&std::piecewise_construct, v134)[5] = v57;

              v58 = (uint64_t *)v46[1];
              if (v58)
              {
                do
                {
                  v59 = v58;
                  v58 = (uint64_t *)*v58;
                }
                while (v58);
              }
              else
              {
                do
                {
                  v59 = (uint64_t *)v46[2];
                  BOOL v34 = *v59 == (void)v46;
                  v46 = v59;
                }
                while (!v34);
              }
              v46 = v59;
            }
            while (v59 != v47);
          }
          v103[0] = MEMORY[0x263EF8330];
          v103[1] = 3221225472;
          v103[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_10;
          v103[3] = &unk_265339120;
          id v60 = v45;
          id v104 = v60;
          v105 = self;
          [v60 enumerateTileBuffersUsingBlock:v103];
          p_p1 = &self->_bytesBufferReplacements.__table_.__p1_;
          id v7 = v96;
          uint64_t v11 = v90;
          unint64_t v10 = v92;
          uint64_t v14 = v87;
          while (1)
          {
            p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)p_p1->__value_.__next_;
            if (!p_p1) {
              break;
            }
            [v60 setTileBuffer:p_p1[3].__value_.__next_ offset:0 atIndex:p_p1[2].__value_.__next_];
          }

          _Block_object_dispose(&v122, 8);
          std::__tree<BufferEntry>::destroy((uint64_t)&v128, v129);

          goto LABEL_52;
        case 1:
        case 3:
          uint64_t v15 = [v13 vertexFunction];
          uint64_t v16 = [(DYMTLShaderDebuggerTraceGenerator *)self _createInstrumentedFunctionWithInstrumentedLibrary:v102 originalFunction:v15];
          if (!v16
            || (v98 = v16,
                objc_msgSend(v13, "setVertexFunction:"),
                BOOL v17 = [(DYMTLShaderDebuggerTraceGenerator *)self _createAndSetInstrumentedRenderPipelineStateWithDescriptor:v13 renderCommandEncoder:v6 roiType:v9], v16 = v98, !v17))
          {

            goto LABEL_47;
          }
          id v18 = objc_msgSend(v101, "vertexBindings", v98);
          v83 = v15;
          v132[0] = MEMORY[0x263EF8330];
          v132[1] = 3221225472;
          v132[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke;
          v132[3] = &unk_2653390A8;
          v132[4] = self;
          id v19 = v6;
          id v133 = v19;
          id v94 = v6;
          id v95 = v7;
          v89 = v11;
          v91 = v10;
          v86 = v14;
          [v18 enumerateObjectsUsingBlock:v132];

          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2;
          v131[3] = &unk_2653390D0;
          v131[4] = self;
          [v19 enumerateVertexTexturesUsingBlock:v131];
          uint64_t v122 = 0;
          v123 = &v122;
          uint64_t v124 = 0x4812000000;
          v125 = __Block_byref_object_copy__2;
          v126 = __Block_byref_object_dispose__2;
          v127 = "";
          uint64_t v130 = 0;
          v129 = 0;
          v128 = &v129;
          v121[0] = MEMORY[0x263EF8330];
          v121[1] = 3221225472;
          v121[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_67;
          v121[3] = &unk_2653390F8;
          v121[4] = &v122;
          [v19 enumerateVertexSamplersUsingBlock:v121];
          uint64_t v20 = (uint64_t *)v123[6];
          v21 = v123 + 7;
          if (v20 != v123 + 7)
          {
            do
            {
              uint64_t v22 = v20[4];
              int v23 = *((_DWORD *)v20 + 12);
              int v24 = *((_DWORD *)v20 + 13);
              id v25 = (id)v20[5];
              v26 = DYMTLGetAssociatedObject(v25, 0);
              id v27 = (void *)[v26 copy];

              [v27 setSupportArgumentBuffers:1];
              v28 = [v25 device];
              id v120 = (id)[v28 newSamplerStateWithDescriptor:v27];

              [(MTLArgumentEncoder *)self->_dummyArgumentEncoder setSamplerState:v120 atIndex:1];
              LODWORD(v29) = v23;
              LODWORD(v30) = v24;
              [v19 setVertexSamplerState:v120 lodMinClamp:v22 lodMaxClamp:v29 atIndex:v30];
              unint64_t v31 = [(DYMTLFunctionPlayer *)self->_player keyForOriginalObject:v25];
              v134[0] = &v120;
              std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v120, (uint64_t)&std::piecewise_construct, v134)[5] = v31;

              v32 = (uint64_t *)v20[1];
              if (v32)
              {
                do
                {
                  v33 = v32;
                  v32 = (uint64_t *)*v32;
                }
                while (v32);
              }
              else
              {
                do
                {
                  v33 = (uint64_t *)v20[2];
                  BOOL v34 = *v33 == (void)v20;
                  uint64_t v20 = v33;
                }
                while (!v34);
              }
              uint64_t v20 = v33;
            }
            while (v33 != v21);
          }
          v117[0] = MEMORY[0x263EF8330];
          v117[1] = 3221225472;
          v117[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2_68;
          v117[3] = &unk_265339120;
          id v35 = v19;
          id v118 = v35;
          v119 = self;
          [v35 enumerateVertexBuffersUsingBlock:v117];
          next = &self->_bytesBufferReplacements.__table_.__p1_;
          id v7 = v95;
          id v37 = v98;
          uint64_t v11 = v89;
          unint64_t v10 = v91;
          uint64_t v14 = v86;
          id v38 = v83;
          while (1)
          {
            next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)next->__value_.__next_;
            if (!next) {
              break;
            }
            [v35 setVertexBuffer:next[3].__value_.__next_ offset:0 atIndex:next[2].__value_.__next_];
          }

          _Block_object_dispose(&v122, 8);
          std::__tree<BufferEntry>::destroy((uint64_t)&v128, v129);
          v81 = v133;
          goto LABEL_50;
        case 2:
          id v38 = [v13 fragmentFunction];
          v62 = [(DYMTLShaderDebuggerTraceGenerator *)self _createInstrumentedFunctionWithInstrumentedLibrary:v102 originalFunction:v38];
          if (v62
            && ([v13 setFragmentFunction:v62],
                [(DYMTLShaderDebuggerTraceGenerator *)self _createAndSetInstrumentedRenderPipelineStateWithDescriptor:v13 renderCommandEncoder:v6 roiType:2]))
          {
            v63 = [v101 fragmentBindings];
            v85 = v62;
            v115[0] = MEMORY[0x263EF8330];
            v115[1] = 3221225472;
            v115[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_3;
            v115[3] = &unk_2653390A8;
            v115[4] = self;
            id v64 = v6;
            id v116 = v64;
            id v94 = v6;
            id v97 = v7;
            v93 = v10;
            v88 = v14;
            v100 = v38;
            [v63 enumerateObjectsUsingBlock:v115];

            v114[0] = MEMORY[0x263EF8330];
            v114[1] = 3221225472;
            v114[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_4;
            v114[3] = &unk_2653390D0;
            v114[4] = self;
            [v64 enumerateFragmentTexturesUsingBlock:v114];
            uint64_t v122 = 0;
            v123 = &v122;
            uint64_t v124 = 0x4812000000;
            v125 = __Block_byref_object_copy__2;
            v126 = __Block_byref_object_dispose__2;
            v127 = "";
            uint64_t v130 = 0;
            v129 = 0;
            v128 = &v129;
            v113[0] = MEMORY[0x263EF8330];
            v113[1] = 3221225472;
            v113[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_5;
            v113[3] = &unk_2653390F8;
            v113[4] = &v122;
            [v64 enumerateFragmentSamplersUsingBlock:v113];
            v65 = (uint64_t *)v123[6];
            v66 = v123 + 7;
            if (v65 != v123 + 7)
            {
              do
              {
                uint64_t v67 = v65[4];
                int v68 = *((_DWORD *)v65 + 12);
                int v69 = *((_DWORD *)v65 + 13);
                id v70 = (id)v65[5];
                v71 = DYMTLGetAssociatedObject(v70, 0);
                v72 = (void *)[v71 copy];

                [v72 setSupportArgumentBuffers:1];
                v73 = [v70 device];
                id v120 = (id)[v73 newSamplerStateWithDescriptor:v72];

                [(MTLArgumentEncoder *)self->_dummyArgumentEncoder setSamplerState:v120 atIndex:1];
                LODWORD(v74) = v68;
                LODWORD(v75) = v69;
                [v64 setFragmentSamplerState:v120 lodMinClamp:v67 lodMaxClamp:v74 atIndex:v75];
                unint64_t v76 = [(DYMTLFunctionPlayer *)self->_player keyForOriginalObject:v70];
                v134[0] = &v120;
                std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v120, (uint64_t)&std::piecewise_construct, v134)[5] = v76;

                v77 = (uint64_t *)v65[1];
                if (v77)
                {
                  do
                  {
                    v78 = v77;
                    v77 = (uint64_t *)*v77;
                  }
                  while (v77);
                }
                else
                {
                  do
                  {
                    v78 = (uint64_t *)v65[2];
                    BOOL v34 = *v78 == (void)v65;
                    v65 = v78;
                  }
                  while (!v34);
                }
                v65 = v78;
              }
              while (v78 != v66);
            }
            v110[0] = MEMORY[0x263EF8330];
            v110[1] = 3221225472;
            v110[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_6;
            v110[3] = &unk_265339120;
            id v79 = v64;
            id v111 = v79;
            v112 = self;
            [v79 enumerateFragmentBuffersUsingBlock:v110];
            v80 = &self->_bytesBufferReplacements.__table_.__p1_;
            id v7 = v97;
            id v38 = v100;
            unint64_t v10 = v93;
            uint64_t v14 = v88;
            id v37 = v85;
            while (1)
            {
              v80 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)v80->__value_.__next_;
              if (!v80) {
                break;
              }
              [v79 setFragmentBuffer:v80[3].__value_.__next_ offset:0 atIndex:v80[2].__value_.__next_];
            }

            _Block_object_dispose(&v122, 8);
            std::__tree<BufferEntry>::destroy((uint64_t)&v128, v129);
            v81 = v116;
LABEL_50:

LABEL_52:
            BOOL v40 = 1;
            id v6 = v94;
          }
          else
          {

LABEL_46:
LABEL_47:
            BOOL v40 = 0;
          }
LABEL_53:

          break;
        default:
          BOOL v40 = 1;
          goto LABEL_53;
      }
    }
    else
    {
      BOOL v40 = 0;
    }
  }
  else
  {
    errorStr = self->_errorStr;
    self->_errorStr = (NSString *)@"kDYMTLShaderDebuggerLibraryId library not found in object map";

    BOOL v40 = 0;
  }

  return v40;
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_vertexBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    uint64_t v3 = [v5 type];
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        objc_msgSend(*(id *)(a1 + 40), "setVertexTexture:atIndex:", v4, objc_msgSend(v5, "index"));
      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setVertexSamplerState:atIndex:", *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setVertexBuffer:offset:atIndex:", *(void *)(*(void *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }
}

uint64_t __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setTexture:a2 atIndex:0];
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_67(uint64_t a1, void **a2, unint64_t a3)
{
  unint64_t v7 = a3;
  id v5 = DYMTLGetAssociatedObject(*a2, 0);
  if (([v5 supportArgumentBuffers] & 1) == 0)
  {
    id v6 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    id v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2_68(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v13 = a3;
  if (!*a2 && a2[1])
  {
    id v5 = [*(id *)(a1 + 32) device];
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a2[1];
    if (!*a2)
    {
      if (v8) {
        uint64_t v7 = a2[2];
      }
    }
    uint64_t v9 = [v5 newBufferWithBytes:v8 length:v7 options:0];

    uint64_t v10 = *(void *)(a1 + 40) + 136;
    uint64_t v14 = &v13;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    uint64_t v12 = (void *)v11[3];
    v11[3] = v9;
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_fragmentBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    uint64_t v3 = [v5 type];
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        objc_msgSend(*(id *)(a1 + 40), "setFragmentTexture:atIndex:", v4, objc_msgSend(v5, "index"));
      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setFragmentSamplerState:atIndex:", *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setFragmentBuffer:offset:atIndex:", *(void *)(*(void *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }
}

uint64_t __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setTexture:a2 atIndex:0];
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_5(uint64_t a1, void **a2, unint64_t a3)
{
  unint64_t v7 = a3;
  id v5 = DYMTLGetAssociatedObject(*a2, 0);
  if (([v5 supportArgumentBuffers] & 1) == 0)
  {
    id v6 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    uint64_t v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_6(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v13 = a3;
  if (!*a2 && a2[1])
  {
    id v5 = [*(id *)(a1 + 32) device];
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a2[1];
    if (!*a2)
    {
      if (v8) {
        uint64_t v7 = a2[2];
      }
    }
    uint64_t v9 = [v5 newBufferWithBytes:v8 length:v7 options:0];

    uint64_t v10 = *(void *)(a1 + 40) + 136;
    uint64_t v14 = &v13;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    uint64_t v12 = (void *)v11[3];
    v11[3] = v9;
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_tileBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    uint64_t v3 = [v5 type];
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        objc_msgSend(*(id *)(a1 + 40), "setTileTexture:atIndex:", v4, objc_msgSend(v5, "index"));
      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setTileSamplerState:atIndex:", *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setTileBuffer:offset:atIndex:", *(void *)(*(void *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_270105410]) {
    [*(id *)(*(void *)(a1 + 32) + 88) setTexture:v3 atIndex:0];
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_9(uint64_t a1, void **a2, unint64_t a3)
{
  unint64_t v7 = a3;
  if ([*a2 conformsToProtocol:&unk_27010BCB0])
  {
    id v5 = DYMTLGetAssociatedObject(*a2, 0);
    if (([v5 supportArgumentBuffers] & 1) == 0)
    {
      id v6 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
      uint64_t v8 = &v7;
      *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
    }
  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_10(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v13 = a3;
  if (!*a2 && a2[1])
  {
    id v5 = [*(id *)(a1 + 32) device];
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a2[1];
    if (!*a2)
    {
      if (v8) {
        uint64_t v7 = a2[2];
      }
    }
    uint64_t v9 = [v5 newBufferWithBytes:v8 length:v7 options:0];

    uint64_t v10 = *(void *)(a1 + 40) + 136;
    uint64_t v14 = &v13;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    uint64_t v12 = (void *)v11[3];
    v11[3] = v9;
  }
}

- (BOOL)_prepareComputeCommandEncoder:(id)a3 generationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForKey:*MEMORY[0x263F3FCA8]];
  uint64_t v9 = [v6 computePipelineState];
  uint64_t v10 = DYMTLGetAssociatedObject(v9, 0);
  uint64_t v11 = (void *)[v10 copy];

  objc_msgSend(v11, "setMaxTotalThreadsPerThreadgroup:", objc_msgSend(v9, "maxTotalThreadsPerThreadgroup"));
  uint64_t v12 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", [v8 unsignedLongLongValue]);
  if (v12)
  {
    unint64_t v13 = [(DYMTLShaderDebuggerTraceGenerator *)self _instrumentLibrary:v12 generationOptions:v7];
    if (v13)
    {
      v44 = [v11 computeFunction];
      uint64_t v14 = [(DYMTLShaderDebuggerTraceGenerator *)self _createInstrumentedFunctionWithInstrumentedLibrary:v13 originalFunction:v44];
      BOOL v43 = (void *)v14;
      if (v14
        && ([v11 setComputeFunction:v14],
            [(DYMTLShaderDebuggerTraceGenerator *)self _createAndSetInstrumentedComputePipelineStateWithDescriptor:v11 computeCommandEncoder:v6]))
      {
        id v41 = v6;
        v42 = v8;
        v39 = v11;
        BOOL v40 = v9;
        id v38 = v13;
        id v37 = DYMTLGetAssociatedObject(v9, 2u);
        uint64_t v15 = [v37 arguments];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke;
        v59[3] = &unk_2653390A8;
        v59[4] = self;
        id v16 = v6;
        id v60 = v16;
        [v15 enumerateObjectsUsingBlock:v59];

        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_2;
        v58[3] = &unk_2653390D0;
        v58[4] = self;
        [v16 enumerateTexturesUsingBlock:v58];
        uint64_t v50 = 0;
        int v51 = &v50;
        uint64_t v52 = 0x4812000000;
        v53 = __Block_byref_object_copy__2;
        v54 = __Block_byref_object_dispose__2;
        double v55 = "";
        v57[0] = 0;
        v57[1] = 0;
        double v56 = v57;
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_3;
        v49[3] = &unk_2653390F8;
        v49[4] = &v50;
        [v16 enumerateSamplersUsingBlock:v49];
        BOOL v17 = (uint64_t *)v51[6];
        id v18 = v51 + 7;
        if (v17 != v51 + 7)
        {
          do
          {
            uint64_t v19 = v17[4];
            int v20 = *((_DWORD *)v17 + 12);
            int v21 = *((_DWORD *)v17 + 13);
            id v22 = (id)v17[5];
            int v23 = DYMTLGetAssociatedObject(v22, 0);
            int v24 = (void *)[v23 copy];

            [v24 setSupportArgumentBuffers:1];
            id v25 = [v22 device];
            id v48 = (id)[v25 newSamplerStateWithDescriptor:v24];

            [(MTLArgumentEncoder *)self->_dummyArgumentEncoder setSamplerState:v48 atIndex:1];
            LODWORD(v26) = v20;
            LODWORD(v27) = v21;
            [v16 setSamplerState:v48 lodMinClamp:v19 lodMaxClamp:v26 atIndex:v27];
            unint64_t v28 = [(DYMTLFunctionPlayer *)self->_player keyForOriginalObject:v22];
            v61 = &v48;
            std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v48, (uint64_t)&std::piecewise_construct, &v61)[5] = v28;

            double v29 = (uint64_t *)v17[1];
            if (v29)
            {
              do
              {
                double v30 = v29;
                double v29 = (uint64_t *)*v29;
              }
              while (v29);
            }
            else
            {
              do
              {
                double v30 = (uint64_t *)v17[2];
                BOOL v31 = *v30 == (void)v17;
                BOOL v17 = v30;
              }
              while (!v31);
            }
            BOOL v17 = v30;
          }
          while (v30 != v18);
        }
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_4;
        v45[3] = &unk_265339120;
        id v32 = v16;
        id v46 = v32;
        v47 = self;
        [v32 enumerateBuffersUsingBlock:v45];
        p_p1 = &self->_bytesBufferReplacements.__table_.__p1_;
        uint64_t v8 = v42;
        uint64_t v11 = v39;
        uint64_t v9 = v40;
        unint64_t v13 = v38;
        while (1)
        {
          p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)p_p1->__value_.__next_;
          if (!p_p1) {
            break;
          }
          [v32 setBuffer:p_p1[3].__value_.__next_ offset:0 atIndex:p_p1[2].__value_.__next_];
        }

        _Block_object_dispose(&v50, 8);
        std::__tree<BufferEntry>::destroy((uint64_t)&v56, v57[0]);

        BOOL v35 = 1;
        id v6 = v41;
      }
      else
      {
        BOOL v35 = 0;
      }
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    errorStr = self->_errorStr;
    self->_errorStr = (NSString *)@"kDYMTLShaderDebuggerLibraryId library not found in object map";

    BOOL v35 = 0;
  }

  return v35;
}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_kernelBindingNeedsPlaceholderResource:computeCommandEncoder:"))
  {
    uint64_t v3 = [v5 type];
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        objc_msgSend(*(id *)(a1 + 40), "setTexture:atIndex:", v4, objc_msgSend(v5, "index"));
      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setSamplerState:atIndex:", *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setBuffer:offset:atIndex:", *(void *)(*(void *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }
}

uint64_t __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setTexture:a2 atIndex:0];
}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_3(uint64_t a1, void **a2, unint64_t a3)
{
  unint64_t v7 = a3;
  id v5 = DYMTLGetAssociatedObject(*a2, 0);
  if (([v5 supportArgumentBuffers] & 1) == 0)
  {
    id v6 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    uint64_t v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }
}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v13 = a3;
  if (!*a2 && a2[1])
  {
    id v5 = [*(id *)(a1 + 32) device];
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a2[1];
    if (!*a2)
    {
      if (v8) {
        uint64_t v7 = a2[2];
      }
    }
    uint64_t v9 = [v5 newBufferWithBytes:v8 length:v7 options:0];

    uint64_t v10 = *(void *)(a1 + 40) + 136;
    uint64_t v14 = &v13;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    uint64_t v12 = (void *)v11[3];
    v11[3] = v9;
  }
}

- (id)_generateConstantSamplerReflectionWithUniqueIdentifiers:(id)a3 descriptors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = [v5 count];
  if (v8 == [v6 count])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __105__DYMTLShaderDebuggerTraceGenerator__generateConstantSamplerReflectionWithUniqueIdentifiers_descriptors___block_invoke;
    v13[3] = &unk_265339148;
    id v14 = v5;
    id v9 = v7;
    id v15 = v9;
    [v6 enumerateObjectsUsingBlock:v13];
    uint64_t v10 = v15;
    id v11 = v9;
  }
  return v7;
}

void __105__DYMTLShaderDebuggerTraceGenerator__generateConstantSamplerReflectionWithUniqueIdentifiers_descriptors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GPUTools::MTL::CaptureHelper::SaveObject();
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
}

- (BOOL)_createAndSetInstrumentedRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4 roiType:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 device];
  id v22 = 0;
  id v23 = 0;
  id v11 = (void *)[v10 newRenderPipelineStateWithDescriptor:v8 options:0x200000 reflection:&v23 error:&v22];
  id v12 = v23;
  id v13 = v22;

  if (v11)
  {
    DYMTLSetAssociatedObject(v11, 0, v8);
    DYMTLSetAssociatedObject(v11, 2u, v12);
    traceBuffer = self->_traceBuffer;
    if (a5 == 2) {
      objc_msgSend(v9, "setFragmentBuffer:offset:atIndex:", traceBuffer, 0, objc_msgSend(v12, "traceBufferIndex"));
    }
    else {
      objc_msgSend(v9, "setVertexBuffer:offset:atIndex:", traceBuffer, 0, objc_msgSend(v12, "traceBufferIndex"));
    }
    [v9 setRenderPipelineState:v11];
    id v16 = [v12 constantSamplerUniqueIdentifiers];
    errorStr = [v12 constantSamplerDescriptors];
    uint64_t v19 = [(DYMTLShaderDebuggerTraceGenerator *)self _generateConstantSamplerReflectionWithUniqueIdentifiers:v16 descriptors:errorStr];
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v19;
  }
  else
  {
    id v15 = NSString;
    id v16 = [v13 description];
    BOOL v17 = [v15 stringWithFormat:@"Error creating instrumented render pipeline state: %@", v16];
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v11 != 0;
}

- (BOOL)_createAndSetInstrumentedComputePipelineStateWithDescriptor:(id)a3 computeCommandEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 device];
  id v19 = 0;
  id v20 = 0;
  id v9 = (void *)[v8 newComputePipelineStateWithDescriptor:v6 options:0x200000 reflection:&v20 error:&v19];
  id v10 = v20;
  id v11 = v19;

  if (v9)
  {
    DYMTLSetAssociatedObject(v9, 0, v6);
    DYMTLSetAssociatedObject(v9, 2u, v10);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_traceBuffer, 0, objc_msgSend(v10, "traceBufferIndex"));
    [v7 setComputePipelineState:v9];
    id v12 = [v10 constantSamplerUniqueIdentifiers];
    errorStr = [v10 constantSamplerDescriptors];
    id v14 = [(DYMTLShaderDebuggerTraceGenerator *)self _generateConstantSamplerReflectionWithUniqueIdentifiers:v12 descriptors:errorStr];
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v14;
  }
  else
  {
    id v16 = NSString;
    id v12 = [v11 description];
    BOOL v17 = [v16 stringWithFormat:@"Error creating instrumented compute pipeline state: %@", v12];
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v9 != 0;
}

- (BOOL)_createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 device];
  id v19 = 0;
  id v20 = 0;
  id v9 = (void *)[v8 newRenderPipelineStateWithTileDescriptor:v6 options:0x200000 reflection:&v20 error:&v19];
  id v10 = v20;
  id v11 = v19;

  if (v9)
  {
    DYMTLSetAssociatedObject(v9, 0, v6);
    DYMTLSetAssociatedObject(v9, 2u, v10);
    objc_msgSend(v7, "setTileBuffer:offset:atIndex:", self->_traceBuffer, 0, objc_msgSend(v10, "traceBufferIndex"));
    [v7 setRenderPipelineState:v9];
    id v12 = [v10 constantSamplerUniqueIdentifiers];
    errorStr = [v10 constantSamplerDescriptors];
    id v14 = [(DYMTLShaderDebuggerTraceGenerator *)self _generateConstantSamplerReflectionWithUniqueIdentifiers:v12 descriptors:errorStr];
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v14;
  }
  else
  {
    id v16 = NSString;
    id v12 = [v11 description];
    BOOL v17 = [v16 stringWithFormat:@"Error creating instrumented render pipeline state: %@", v12];
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v9 != 0;
}

- (id)_createInstrumentedFunctionWithInstrumentedLibrary:(id)a3 originalFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::onceToken != -1) {
    dispatch_once(&-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::onceToken, &__block_literal_global_0);
  }
  if (!-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded)
  {
    errorStr = self->_errorStr;
    self->_errorStr = (NSString *)@"Shader Debugger is not supported in this system configuration. Please install an Xcode with an SDK that is aligned to your OS version.";

    id v13 = 0;
    goto LABEL_17;
  }
  id v8 = DYMTLGetNullableAssociatedObject(v7, 4u);
  if (v8)
  {
    id v9 = [v7 name];
    id v21 = 0;
    id v10 = (void *)[v6 newFunctionWithName:v9 constantValues:v8 error:&v21];
    id v11 = v21;

    if (v10) {
      goto LABEL_6;
    }
LABEL_11:
    id v16 = NSString;
    id v12 = [v11 description];
    BOOL v17 = [v16 stringWithFormat:@"Error creating instrumented function: %@", v12];
    id v18 = self->_errorStr;
    self->_errorStr = v17;
LABEL_15:

    id v13 = 0;
    goto LABEL_16;
  }
  id v15 = [v7 name];
  id v10 = (void *)[v6 newFunctionWithName:v15];

  id v11 = 0;
  if (!v10) {
    goto LABEL_11;
  }
LABEL_6:
  id v12 = [v10 bitcodeData];
  if (!v12)
  {
    id v18 = self->_errorStr;
    id v19 = @"Shader bitcode not found.";
LABEL_14:
    self->_errorStr = &v19->isa;
    goto LABEL_15;
  }
  if (!self->_metadata)
  {
    id v18 = self->_errorStr;
    id v19 = @"Could not generate shader metadata. Please update your target device to the latest OS version";
    goto LABEL_14;
  }
  id v13 = v10;
LABEL_16:

LABEL_17:
  return v13;
}

char *__105__DYMTLShaderDebuggerTraceGenerator__createInstrumentedFunctionWithInstrumentedLibrary_originalFunction___block_invoke()
{
  uint64_t result = (char *)_dyld_image_count();
  if (result)
  {
    uint32_t v1 = 0;
    int v2 = result - 1;
    do
    {
      image_name = (char *)_dyld_get_image_name(v1);
      uint64_t result = strstr(image_name, "libLLVM.dylib");
      -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded |= result != 0;
      if (-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = v2 == v1;
      }
      ++v1;
    }
    while (!v4);
  }
  return result;
}

- (BOOL)_createTraceBufferWithGenerationOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:*MEMORY[0x263F3FD40]];
  int v6 = [v5 unsignedIntValue];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FD88]];
  id v8 = v7;
  if ((v6 & 0xFFFFFFFD) != 0) {
    uint64_t v9 = 0x200000;
  }
  else {
    uint64_t v9 = 0x4000000;
  }
  if (v7) {
    uint64_t v9 = [v7 unsignedIntegerValue];
  }
  id v10 = [(DYMTLFunctionPlayer *)self->_player device];
  id v11 = (MTLBuffer *)[v10 newBufferWithLength:v9 options:0];
  traceBuffer = self->_traceBuffer;
  self->_traceBuffer = v11;

  BOOL v13 = self->_traceBuffer != 0;
  return v13;
}

- (BOOL)_prepareTraceBufferWithGenerationOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:*MEMORY[0x263F3FD40]];
  int v6 = [v5 unsignedIntValue];

  switch(v6)
  {
    case 0:
      uint64_t v7 = *MEMORY[0x263F3FD18];
      id v8 = [v4 objectForKey:*MEMORY[0x263F3FD18]];

      if (!v8) {
        goto LABEL_31;
      }
      uint64_t v9 = *MEMORY[0x263F3FD20];
      id v10 = [v4 objectForKey:*MEMORY[0x263F3FD20]];

      if (!v10) {
        goto LABEL_31;
      }
      uint64_t v11 = *MEMORY[0x263F3FD28];
      id v12 = [v4 objectForKey:*MEMORY[0x263F3FD28]];

      if (!v12) {
        goto LABEL_31;
      }
      uint64_t v13 = *MEMORY[0x263F3FCE8];
      id v14 = [v4 objectForKey:*MEMORY[0x263F3FCE8]];

      if (!v14) {
        goto LABEL_31;
      }
      uint64_t v15 = *MEMORY[0x263F3FCF0];
      id v16 = [v4 objectForKey:*MEMORY[0x263F3FCF0]];

      if (!v16) {
        goto LABEL_31;
      }
      uint64_t v17 = *MEMORY[0x263F3FCF8];
      id v18 = [v4 objectForKey:*MEMORY[0x263F3FCF8]];

      if (!v18) {
        goto LABEL_31;
      }
      id v19 = [v4 objectForKeyedSubscript:v7];
      id v20 = [v4 objectForKeyedSubscript:v9];
      id v21 = [v4 objectForKeyedSubscript:v11];
      id v22 = [v4 objectForKeyedSubscript:v13];
      id v23 = [v4 objectForKeyedSubscript:v15];
      int v24 = [v4 objectForKeyedSubscript:v17];
      self->_traceType = 2;
      uint64_t v25 = [(MTLBuffer *)self->_traceBuffer contents];
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, v25, self->_traceBufferVersion);
      v91 = &unk_2700F0088;
      id v94 = (_DWORD *)v25;
      _DWORD *v92 = 1;
      int v26 = [(MTLBuffer *)self->_traceBuffer length];
      v92[1] = v26;
      int v27 = [v19 unsignedIntValue];
      LODWORD(v25) = [v20 unsignedIntValue];
      int v28 = [v21 unsignedIntValue];
      v94[4] = v27;
      v94[5] = v25;
      v94[6] = v28;
      int v29 = [v22 unsignedIntValue];
      LODWORD(v25) = [v23 unsignedIntValue];
      int v30 = [v24 unsignedIntValue];
      BOOL v31 = v94;
      v94[8] = v29;
      v31[9] = v25;
      v31[10] = v30;
      int HeaderSize = ShaderDebugger::KernelTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::KernelTraceBufferVersionedHeader *)&v91);
      v92[2] = HeaderSize;
      DispatchMPSMethod(&v91);
      goto LABEL_26;
    case 1:
      uint64_t v33 = *MEMORY[0x263F3FCC8];
      BOOL v34 = [v4 objectForKey:*MEMORY[0x263F3FCC8]];

      if (!v34) {
        goto LABEL_31;
      }
      uint64_t v35 = *MEMORY[0x263F3FD48];
      v36 = [v4 objectForKey:*MEMORY[0x263F3FD48]];

      if (!v36) {
        goto LABEL_31;
      }
      self->_traceType = 0;
      id v19 = [v4 objectForKeyedSubscript:v33];
      id v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FCC0]];
      id v21 = [v4 objectForKeyedSubscript:v35];
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, [(MTLBuffer *)self->_traceBuffer contents], self->_traceBufferVersion);
      v91 = &unk_2700F0038;
      _DWORD *v92 = 1;
      int v37 = [(MTLBuffer *)self->_traceBuffer length];
      v92[1] = v37;
      int v38 = [v21 count];
      if (v93 - 1 >= 2)
      {
        if (v93)
        {
          BOOL v40 = 0;
        }
        else
        {
          v77 = v92;
          v92[4] = v38;
          BOOL v40 = v77 + 5;
        }
      }
      else
      {
        v39 = v92;
        v92[5] = v38;
        BOOL v40 = v39 + 6;
      }
      for (unint64_t i = 0; i < [v21 count]; ++i)
      {
        v80 = [v21 objectAtIndexedSubscript:i];
        v40[i] = [v80 unsignedIntegerValue];
      }
      int v81 = [v19 unsignedIntegerValue];
      if (v93 - 1 < 2 || !v93) {
        v92[3] = v81;
      }
      int v82 = [v20 unsignedIntegerValue];
      if (v93 - 1 <= 1) {
        v92[4] = v82;
      }
      int v83 = ShaderDebugger::VertexTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::VertexTraceBufferVersionedHeader *)&v91);
      goto LABEL_56;
    case 2:
      uint64_t v41 = *MEMORY[0x263F3FD00];
      v42 = [v4 objectForKey:*MEMORY[0x263F3FD00]];

      if (!v42) {
        goto LABEL_31;
      }
      uint64_t v43 = *MEMORY[0x263F3FD08];
      v44 = [v4 objectForKey:*MEMORY[0x263F3FD08]];

      if (!v44) {
        goto LABEL_31;
      }
      uint64_t v45 = *MEMORY[0x263F3FCD0];
      id v46 = [v4 objectForKey:*MEMORY[0x263F3FCD0]];

      if (!v46) {
        goto LABEL_31;
      }
      uint64_t v47 = *MEMORY[0x263F3FCD8];
      id v48 = [v4 objectForKey:*MEMORY[0x263F3FCD8]];

      if (!v48) {
        goto LABEL_31;
      }
      uint64_t v49 = *MEMORY[0x263F3FD10];
      uint64_t v50 = [v4 objectForKey:*MEMORY[0x263F3FD10]];

      if (!v50) {
        goto LABEL_31;
      }
      uint64_t v51 = *MEMORY[0x263F3FCE0];
      uint64_t v52 = [v4 objectForKey:*MEMORY[0x263F3FCE0]];

      if (!v52) {
        goto LABEL_31;
      }
      id v19 = [v4 objectForKeyedSubscript:v41];
      id v20 = [v4 objectForKeyedSubscript:v43];
      id v21 = [v4 objectForKeyedSubscript:v45];
      id v22 = [v4 objectForKeyedSubscript:v47];
      id v23 = [v4 objectForKeyedSubscript:v49];
      int v24 = [v4 objectForKeyedSubscript:v51];
      v53 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FD38]];
      self->_traceType = 1;
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, [(MTLBuffer *)self->_traceBuffer contents], self->_traceBufferVersion);
      v91 = &unk_2700F0060;
      _DWORD *v92 = 1;
      int v54 = [(MTLBuffer *)self->_traceBuffer length];
      v92[1] = v54;
      [v19 floatValue];
      unsigned int v89 = v55;
      [v20 floatValue];
      double v56 = (const float *)&unk_24F7320E0;
      float32x4_t v57 = vld1q_dup_f32(v56);
      v57.i64[0] = __PAIR64__(v58, v89);
      float32x4_t v95 = v57;
      objc_msgSend(v21, "floatValue", ShaderDebugger::FragmentTraceBufferVersionedHeader::setPositionMin((uint64_t)&v91, (unsigned __int32 *)&v95).n128_f64[0]);
      unsigned int v90 = v59;
      [v22 floatValue];
      id v60 = (const float *)"(knN";
      float32x4_t v61 = vld1q_dup_f32(v60);
      v61.i64[0] = __PAIR64__(v62, v90);
      float32x4_t v95 = v61;
      int v63 = objc_msgSend(v23, "unsignedIntValue", ShaderDebugger::FragmentTraceBufferVersionedHeader::setPositionMax((uint64_t)&v91, (unsigned __int32 *)&v95).n128_f64[0]);
      if (v93 <= 2) {
        v92[12] = v63;
      }
      int v64 = [v24 unsignedIntValue];
      if (v93 <= 2) {
        v92[13] = v64;
      }
      int v65 = [v53 unsignedIntValue];
      if (v93 == 2) {
        v92[14] = v65;
      }
      int v66 = ShaderDebugger::FragmentTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::FragmentTraceBufferVersionedHeader *)&v91);
      v92[2] = v66;
      DispatchMPSMethod(&v91);

LABEL_26:
      goto LABEL_57;
    case 3:
      uint64_t v67 = *MEMORY[0x263F3FCC8];
      int v68 = [v4 objectForKey:*MEMORY[0x263F3FCC8]];

      if (v68
        && (uint64_t v69 = *MEMORY[0x263F3FD30],
            [v4 objectForKey:*MEMORY[0x263F3FD30]],
            id v70 = objc_claimAutoreleasedReturnValue(),
            v70,
            v70))
      {
        self->_traceType = 3;
        id v19 = [v4 objectForKeyedSubscript:v67];
        id v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FCC0]];
        id v21 = [v4 objectForKeyedSubscript:v69];
        ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, [(MTLBuffer *)self->_traceBuffer contents], self->_traceBufferVersion);
        v91 = &unk_2700F00B0;
        _DWORD *v92 = 1;
        int v71 = [(MTLBuffer *)self->_traceBuffer length];
        v92[1] = v71;
        int v72 = [v21 count];
        if (v93 - 1 >= 2)
        {
          if (v93)
          {
            double v74 = 0;
          }
          else
          {
            v78 = v92;
            v92[4] = v72;
            double v74 = v78 + 5;
          }
        }
        else
        {
          v73 = v92;
          v92[5] = v72;
          double v74 = v73 + 6;
        }
        for (unint64_t j = 0; j < [v21 count]; ++j)
        {
          v85 = [v21 objectAtIndexedSubscript:j];
          v74[j] = [v85 unsignedIntegerValue];
        }
        int v86 = [v19 unsignedIntegerValue];
        if (v93 - 1 < 2 || !v93) {
          v92[3] = v86;
        }
        int v87 = [v20 unsignedIntegerValue];
        if (v93 - 1 <= 1) {
          v92[4] = v87;
        }
        int v83 = ShaderDebugger::PostTessellationVertexTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::PostTessellationVertexTraceBufferVersionedHeader *)&v91);
LABEL_56:
        v92[2] = v83;
        DispatchMPSMethod(&v91);
LABEL_57:

LABEL_58:
        BOOL v76 = 1;
      }
      else
      {
LABEL_31:
        errorStr = self->_errorStr;
        self->_errorStr = (NSString *)@"Incorrect ROI parameters";

        BOOL v76 = 0;
      }

      return v76;
    default:
      goto LABEL_58;
  }
}

- (void)prepareCommandEncoderForInstrumentedCall:(unint64_t)a3 generationOptions:(id)a4
{
  id v15 = a4;
  int v6 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a3];
  uint64_t v7 = *MEMORY[0x263F3FD40];
  id v8 = [v15 objectForKey:*MEMORY[0x263F3FD40]];

  if (v8
    && ([v15 objectForKey:*MEMORY[0x263F3FCB0]],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9)
    && ([v15 objectForKey:*MEMORY[0x263F3FCA8]],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    if ([(DYMTLShaderDebuggerTraceGenerator *)self _createTraceBufferWithGenerationOptions:v15])
    {
      uint64_t v11 = [v15 valueForKey:v7];
      int v12 = [v11 unsignedIntValue];

      std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::destroy((uint64_t)&self->_replacedSamplerStates, (void *)self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_);
      self->_replacedSamplerStates.__tree_.__begin_node_ = &self->_replacedSamplerStates.__tree_.__pair1_;
      self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_ = 0;
      self->_replacedSamplerStates.__tree_.__pair3_.__value_ = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_bytesBufferReplacements);
      switch(v12)
      {
        case 0:
          if (([v6 conformsToProtocol:&unk_27010D688] & 1) == 0
            && ([v6 conformsToProtocol:&unk_27010CFE8] & 1) == 0)
          {
            errorStr = self->_errorStr;
            id v14 = @"Invalid command encoder for Kernel ROI type";
            break;
          }
          if ([v6 conformsToProtocol:&unk_27010D688])
          {
            [(DYMTLShaderDebuggerTraceGenerator *)self _prepareComputeCommandEncoder:v6 generationOptions:v15];
            goto LABEL_22;
          }
          if (![v6 conformsToProtocol:&unk_27010CFE8]) {
            goto LABEL_22;
          }
          goto LABEL_21;
        case 1:
        case 3:
          if ([v6 conformsToProtocol:&unk_27010CFE8]) {
            goto LABEL_21;
          }
          errorStr = self->_errorStr;
          id v14 = @"Invalid command encoder for Vertex ROI type";
          break;
        case 2:
          if (([v6 conformsToProtocol:&unk_27010CFE8] & 1) == 0)
          {
            errorStr = self->_errorStr;
            id v14 = @"Invalid command encoder for Fragment ROI type";
            break;
          }
LABEL_21:
          [(DYMTLShaderDebuggerTraceGenerator *)self _prepareRenderCommandEncoder:v6 generationOptions:v15];
LABEL_22:
          if ([(DYMTLShaderDebuggerTraceGenerator *)self _prepareTraceBufferWithGenerationOptions:v15])
          {
            goto LABEL_10;
          }
          errorStr = self->_errorStr;
          id v14 = @"Error while preparing trace buffer.";
          break;
        default:
          goto LABEL_22;
      }
    }
    else
    {
      errorStr = self->_errorStr;
      id v14 = @"Unable to create trace buffer.";
    }
  }
  else
  {
    errorStr = self->_errorStr;
    id v14 = @"Incorrect ROI parameters";
  }
  self->_errorStr = &v14->isa;

LABEL_10:
}

- (id)_generateResourceResolutionRemappingTables
{
  v56[5] = *MEMORY[0x263EF8340];
  uint64_t v49 = [MEMORY[0x263EFF9A0] dictionary];
  id v46 = [MEMORY[0x263EFF9A0] dictionary];
  id v48 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v47 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v45 = [(DYMTLFunctionPlayer *)self->_player indirectArgumentManager];
  uint64_t v3 = (void *)[v45 bufferVitualAddressMap];
  id v5 = v3 + 1;
  id v4 = (void *)*v3;
  if ((void *)*v3 != v3 + 1)
  {
    do
    {
      int v6 = (const void *)v4[5];
      uint64_t v50 = v4[4];
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v51 = 0;
      std::vector<DYMTLOriginalProcessBuffer>::__init_with_size[abi:ne180100]<DYMTLOriginalProcessBuffer*,DYMTLOriginalProcessBuffer*>(&v51, v6, v4[6], (uint64_t)(v4[6] - (void)v6) >> 4);
      id v8 = v51;
      uint64_t v7 = v52;
      if (v51 != v52)
      {
        do
        {
          uint64_t v9 = [(DYMTLFunctionPlayer *)self->_player objectMap];
          int v54 = v8;
          id v10 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v9, v8, (uint64_t)&std::piecewise_construct, &v54);
          uint64_t v11 = DYMTLGetOriginalObject((objc_object *)v10[3]);
          uint64_t v12 = [v11 gpuAddress];
          uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v12];
          id v14 = [NSNumber numberWithUnsignedLongLong:v50];
          [v49 setObject:v13 forKeyedSubscript:v14];

          v8 += 2;
        }
        while (v8 != v7);
        id v8 = v51;
      }
      if (v8)
      {
        uint64_t v52 = v8;
        operator delete(v8);
      }
      id v15 = (void *)v4[1];
      if (v15)
      {
        do
        {
          id v16 = v15;
          id v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          id v16 = (void *)v4[2];
          BOOL v17 = *v16 == (void)v4;
          id v4 = v16;
        }
        while (!v17);
      }
      id v4 = v16;
    }
    while (v16 != v5);
  }
  id v18 = *(uint64_t ***)([(DYMTLFunctionPlayer *)self->_player objectMap] + 16);
  if (v18)
  {
    while (1)
    {
      uint64_t v19 = (uint64_t)v18[2];
      id v20 = v18[3];
      id v21 = DYMTLGetOriginalObject(v20);
      if ([v21 conformsToProtocol:&unk_27010DBE0]) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [v21 uniqueIdentifier];
        id v23 = [NSNumber numberWithUnsignedLongLong:v19];
        int v24 = [NSNumber numberWithUnsignedLongLong:v25];
        [v48 setObject:v23 forKeyedSubscript:v24];
        goto LABEL_18;
      }
LABEL_19:

      id v18 = (uint64_t **)*v18;
      if (!v18) {
        goto LABEL_20;
      }
    }
    uint64_t v22 = [v21 uniqueIdentifier];
    id v23 = [NSNumber numberWithUnsignedLongLong:v19];
    int v24 = [NSNumber numberWithUnsignedLongLong:v22];
    [v46 setObject:v23 forKeyedSubscript:v24];
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
  begin_node = (DYMTLShaderDebuggerTraceGenerator *)self->_replacedSamplerStates.__tree_.__begin_node_;
  if (begin_node != (DYMTLShaderDebuggerTraceGenerator *)&self->_replacedSamplerStates.__tree_.__pair1_)
  {
    do
    {
      int v27 = begin_node->_errorStr;
      placeholderBuffer = begin_node->_placeholderBuffer;
      int v29 = DYMTLGetOriginalObject(v27);
      uint64_t v30 = [v29 uniqueIdentifier];
      BOOL v31 = [NSNumber numberWithUnsignedLongLong:placeholderBuffer];
      id v32 = [NSNumber numberWithUnsignedLongLong:v30];
      [v48 setObject:v31 forKeyedSubscript:v32];

      player = begin_node->_player;
      if (player)
      {
        do
        {
          indirectArgumentManager = (DYMTLShaderDebuggerTraceGenerator *)player;
          player = (DYMTLCommonDebugFunctionPlayer *)player->super.super.super.super.isa;
        }
        while (player);
      }
      else
      {
        do
        {
          indirectArgumentManager = (DYMTLShaderDebuggerTraceGenerator *)begin_node->_indirectArgumentManager;
          BOOL v17 = indirectArgumentManager->super.isa == (Class)begin_node;
          begin_node = indirectArgumentManager;
        }
        while (!v17);
      }
      begin_node = indirectArgumentManager;
    }
    while (indirectArgumentManager != (DYMTLShaderDebuggerTraceGenerator *)&self->_replacedSamplerStates.__tree_.__pair1_);
  }
  for (unint64_t i = (objc_object *)self->_bytesBufferReplacements.__table_.__p1_.__value_.__next_; i; unint64_t i = (objc_object *)i->isa)
  {
    v36 = DYMTLGetOriginalObject((objc_object *)i[3].isa);
    uint64_t v37 = [v36 gpuAddress];
    int v38 = [NSNumber numberWithUnsignedLongLong:v37];
    v39 = [NSNumber numberWithUnsignedLong:i[2].isa];
    [v47 setObject:v38 forKeyedSubscript:v39];
  }
  uint64_t v40 = *MEMORY[0x263F3FD78];
  v55[0] = *MEMORY[0x263F3FD58];
  v55[1] = v40;
  v56[0] = v49;
  v56[1] = v46;
  uint64_t v41 = *MEMORY[0x263F3FD68];
  v55[2] = *MEMORY[0x263F3FD70];
  v55[3] = v41;
  constantSamplerReflection = self->_constantSamplerReflection;
  v56[2] = v48;
  v56[3] = constantSamplerReflection;
  v55[4] = *MEMORY[0x263F3FD60];
  v56[4] = v47;
  uint64_t v43 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];

  return v43;
}

- (id)notifyReplayFinishedAndGenerateTraceContainer
{
  v24[4] = *MEMORY[0x263EF8340];
  id v16 = self;
  errorStr = self->_errorStr;
  if (errorStr)
  {
    uint64_t v22 = *MEMORY[0x263F3FC98];
    id v23 = errorStr;
    id v4 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v5 = self->_errorStr;
    self->_errorStr = 0;
  }
  else
  {
    v21[3] = 0;
    v24[0] = &unk_2700EFF18;
    v24[1] = &v16;
    v24[3] = v24;
    std::__function::__value_func<void ()(void)>::swap[abi:ne180100](v24, v21);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v24);
    uint64_t v6 = [(MTLBuffer *)v16->_traceBuffer contents];
    if (*(_DWORD *)(v6 + 8) <= *(_DWORD *)(v6 + 4))
    {
      id v8 = [MEMORY[0x263EFF990] dataWithBytes:&v16->_traceType length:4];
      uint64_t v7 = v8;
      unsigned int v10 = *(_DWORD *)(v6 + 4);
      unsigned int v9 = *(_DWORD *)(v6 + 8);
      if (v10 >= v9) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v10;
      }
      objc_msgSend(v8, "appendBytes:length:", v6, v11, v16);
      uint64_t v12 = [(DYMTLShaderDebuggerTraceGenerator *)v16 _generateResourceResolutionRemappingTables];
      metadata = v16->_metadata;
      uint64_t v14 = *MEMORY[0x263F3FD80];
      v17[0] = *MEMORY[0x263F3FCB8];
      v17[1] = v14;
      v18[0] = metadata;
      v18[1] = v7;
      v17[2] = *MEMORY[0x263F3FD50];
      v18[2] = v12;
      id v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    }
    else
    {
      v19[0] = *MEMORY[0x263F3FD88];
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      v19[1] = *MEMORY[0x263F3FC98];
      v20[0] = v7;
      v20[1] = @"Trace buffer not big enough. Retry with new size.";
      id v4 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    }

    dy_defer::~dy_defer((dy_defer *)v21);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlineSrc, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_bytesBufferReplacements);
  objc_storeStrong((id *)&self->_constantSamplerReflection, 0);
  std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::destroy((uint64_t)&self->_replacedSamplerStates, (void *)self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_dummyArgumentBuffer, 0);
  objc_storeStrong((id *)&self->_dummyArgumentEncoder, 0);
  std::__tree<std::__value_type<MTLTextureType,objc_object  {objcproto10MTLTexture}* {__strong}>,std::__map_value_compare<MTLTextureType,objc_object  {objcproto10MTLTexture}* {__strong},std::less<MTLTextureType>,true>,std::allocator<objc_object  {objcproto10MTLTexture}* {__strong}>>::destroy((uint64_t)&self->_placeholderTextures, (void *)self->_placeholderTextures.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_placeholderSamplerState, 0);
  objc_storeStrong((id *)&self->_placeholderTexture, 0);
  objc_storeStrong((id *)&self->_placeholderBuffer, 0);
  objc_storeStrong((id *)&self->_errorStr, 0);
  objc_storeStrong((id *)&self->_traceBuffer, 0);
  objc_storeStrong((id *)&self->_indirectArgumentManager, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = (char *)self + 72;
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

- (void)notifyReplayFinishedAndGenerateTraceContainer
{
  uint64_t v2 = **(void **)(a1 + 8);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = **(void **)(a1 + 8);
  id v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = 0;

  uint64_t v6 = **(void **)(a1 + 8);
  uint64_t v7 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = 0;
}

- (uint64_t)notifyReplayFinishedAndGenerateTraceContainer
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2700EFF18;
  a2[1] = v2;
  return result;
}

@end