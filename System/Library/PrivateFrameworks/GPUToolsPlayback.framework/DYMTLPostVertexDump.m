@interface DYMTLPostVertexDump
+ (id)internalPipelineStateLabel;
- (BOOL)createAndSetPostVertexDumpPipelineState:(unint64_t)a3 commandEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5;
- (DYMTLPostVertexDump)initWithDebugFunctionPlayer:(id)a3;
- (MTLBuffer)postVertexDumpBuffer;
- (void)_reservePostVertexDumpBufferWithLength:(unint64_t)a3;
- (void)notifyReplayerTargetCommandBuffersFinished;
@end

@implementation DYMTLPostVertexDump

- (DYMTLPostVertexDump)initWithDebugFunctionPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLPostVertexDump;
  v6 = [(DYMTLPostVertexDump *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = [(DYMTLFunctionPlayer *)v7->_player device];

    if (!v8)
    {

      v7 = 0;
    }
  }

  return v7;
}

+ (id)internalPipelineStateLabel
{
  return @"GPUToolsInternalPostTransformPipelineStateLabel";
}

- (BOOL)createAndSetPostVertexDumpPipelineState:(unint64_t)a3 commandEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  p_player = &self->_player;
  v9 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a3];
  objc_super v10 = [(DYMTLFunctionPlayer *)*p_player objectForKey:a4];
  uint64_t v11 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a5];
  v12 = (void *)v11;
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v11 == 0)
  {
    BOOL v15 = 0;
  }
  else
  {
    v16 = objc_opt_new();
    char v17 = objc_opt_respondsToSelector();
    if (v17)
    {
      v18 = DYMTLGetAssociatedObject(v12, 0);
      for (unsigned int i = 0; ; ++i)
      {
        v20 = [(DYMTLFunctionPlayer *)self->_player device];
        unint64_t v21 = [v20 maxColorAttachments];

        if (v21 <= i) {
          break;
        }
        v22 = [v18 colorAttachments];
        v23 = [v22 objectAtIndexedSubscript:i];
        v24 = [v16 colorAttachments];
        [v24 setObject:v23 atIndexedSubscript:i];
      }
      v25 = [(id)objc_opt_class() internalPipelineStateLabel];
      [v16 setLabel:v25];

      objc_msgSend(v16, "setDepthAttachmentPixelFormat:", objc_msgSend(v18, "depthAttachmentPixelFormat"));
      objc_msgSend(v16, "setStencilAttachmentPixelFormat:", objc_msgSend(v18, "stencilAttachmentPixelFormat"));
      v26 = [v18 vertexDescriptor];
      [v16 setVertexDescriptor:v26];

      v27 = [v18 vertexFunction];
      [v16 setVertexFunction:v27];

      [v16 setRasterizationEnabled:0];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v16, "setInputPrimitiveTopology:", objc_msgSend(v18, "inputPrimitiveTopology"));
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v16, "setTessellationFactorFormat:", objc_msgSend(v18, "tessellationFactorFormat"));
        [v16 setTessellationPartitionMode:1];
        objc_msgSend(v16, "setTessellationOutputWindingOrder:", objc_msgSend(v18, "tessellationOutputWindingOrder"));
        objc_msgSend(v16, "setTessellationFactorScaleEnabled:", objc_msgSend(v18, "isTessellationFactorScaleEnabled"));
        objc_msgSend(v16, "setTessellationFactorStepFunction:", objc_msgSend(v18, "tessellationFactorStepFunction"));
        [v16 setMaxTessellationFactor:1];
        objc_msgSend(v16, "setTessellationControlPointIndexType:", objc_msgSend(v18, "tessellationControlPointIndexType"));
        objc_msgSend(v16, "setSampleCount:", objc_msgSend(v18, "sampleCount"));
        objc_msgSend(v16, "setSampleMask:", objc_msgSend(v18, "sampleMask"));
        [v16 setTessellationFactorScaleEnabled:1];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v16, "setMaxVertexAmplificationCount:", objc_msgSend(v18, "maxVertexAmplificationCount"));
        objc_msgSend(v16, "setVertexAmplificationMode:", objc_msgSend(v18, "vertexAmplificationMode"));
      }
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __91__DYMTLPostVertexDump_createAndSetPostVertexDumpPipelineState_commandEncoderId_pipelineId___block_invoke;
      v47[3] = &unk_265338FC8;
      v47[4] = &v48;
      [v10 enumerateVertexBuffersUsingBlock:v47];
      v28 = [(DYMTLFunctionPlayer *)self->_player device];
      unint64_t v29 = [v28 maxVertexBuffers];

      if (v49[3] >= v29)
      {
        BOOL v15 = 0;
      }
      else
      {
        objc_msgSend(v16, "setPostVertexDumpBufferIndex:");
        v30 = [(DYMTLFunctionPlayer *)self->_player device];
        id v45 = 0;
        id v46 = 0;
        v44 = (void *)[v30 newRenderPipelineStateWithDescriptor:v16 options:524291 reflection:&v46 error:&v45];
        id v31 = v46;
        id v43 = v45;

        DYMTLSetAssociatedObject(v44, 0, v16);
        BOOL v15 = v44 != 0;
        if (v44)
        {
          [(DYMTLPostVertexDump *)self _reservePostVertexDumpBufferWithLength:0x1000000];
          v42 = [v31 postVertexDumpOutputs];
          id v41 = v31;
          MEMORY[0x253362100](v52);
          v32 = (_DWORD *)[(MTLBuffer *)self->_postVertexDumpBuffer contents];
          [v31 postVertexDumpStride];
          unint64_t v33 = vcvtpd_u64_f64((double)(unint64_t)(GPUTools::MTL::CaptureHelper::SaveObject() + 4) * 0.00390625) << 8;
          self->_unint64_t reflectionSizeAligned256 = v33;
          _DWORD *v32 = v33;
          self->_unint64_t reflectionPostVertexDumpStride = [v31 postVertexDumpStride];
          uint64_t v34 = [(MTLBuffer *)self->_postVertexDumpBuffer length];
          unint64_t reflectionSizeAligned256 = self->_reflectionSizeAligned256;
          unint64_t reflectionPostVertexDumpStride = self->_reflectionPostVertexDumpStride;
          v37 = (_DWORD *)([(MTLBuffer *)self->_postVertexDumpBuffer contents]
                         + (reflectionSizeAligned256 & 0xFFFFFFFFFFFFFFFCLL));
          _DWORD *v37 = 0;
          v37[1] = (v34 - reflectionSizeAligned256 - 8) / reflectionPostVertexDumpStride;
          id v31 = v41;
          v38 = [(DYMTLFunctionPlayer *)self->_player device];
          LODWORD(reflectionPostVertexDumpStride) = [v38 supportsFeatureSet:7];

          if (reflectionPostVertexDumpStride)
          {
            LODWORD(v39) = 925353388;
            [v10 setTessellationFactorScale:v39];
          }
          [v10 setRenderPipelineState:v44];
          [v10 setVertexBuffer:self->_postVertexDumpBuffer offset:self->_reflectionSizeAligned256 atIndex:v49[3]];
          MEMORY[0x253362110](v52);
        }
      }
      _Block_object_dispose(&v48, 8);
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

uint64_t __91__DYMTLPostVertexDump_createAndSetPostVertexDumpPipelineState_commandEncoderId_pipelineId___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v4 + 24) == a3) {
    *(void *)(v4 + 24) = a3 + 1;
  }
  else {
    *a4 = 1;
  }
  return result;
}

- (void)notifyReplayerTargetCommandBuffersFinished
{
  p_postVertexDumpBuffer = &self->_postVertexDumpBuffer;
  postVertexDumpBuffer = self->_postVertexDumpBuffer;
  if (postVertexDumpBuffer && self->_reflectionSizeAligned256 && self->_reflectionPostVertexDumpStride)
  {
    uint64_t v5 = [(MTLBuffer *)postVertexDumpBuffer contents];
    unint64_t reflectionSizeAligned256 = self->_reflectionSizeAligned256;
    v7 = (unsigned int *)(v5 + (reflectionSizeAligned256 & 0xFFFFFFFFFFFFFFFCLL));
    unsigned int v9 = *v7;
    unsigned int v8 = v7[1];
    unint64_t reflectionPostVertexDumpStride = self->_reflectionPostVertexDumpStride;
    uint64_t v11 = [(DYMTLFunctionPlayer *)self->_player device];
    uint64_t v12 = [(MTLBuffer *)self->_postVertexDumpBuffer contents];
    if (v8 >= v9) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = v8;
    }
    v14 = (void *)[v11 newBufferWithBytes:v12 length:(reflectionSizeAligned256 + reflectionPostVertexDumpStride * v13 + 263) & 0xFFFFFFFFFFFFFF00 options:0];

    objc_storeStrong((id *)p_postVertexDumpBuffer, v14);
    BOOL v15 = self->_postVertexDumpBuffer;
    v16 = [(DYMTLFunctionPlayer *)self->_player objectMap];
    v18 = (void *)MEMORY[0x263F3FC70];
    char v17 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v16, MEMORY[0x263F3FC70], (uint64_t)&std::piecewise_construct, &v18);
    objc_storeStrong(v17 + 3, v15);
    self->_unint64_t reflectionSizeAligned256 = 0;
    self->_unint64_t reflectionPostVertexDumpStride = 0;
  }
}

- (void)_reservePostVertexDumpBufferWithLength:(unint64_t)a3
{
  if ([(MTLBuffer *)self->_postVertexDumpBuffer length] < a3)
  {
    uint64_t v5 = [(DYMTLFunctionPlayer *)self->_player device];
    v6 = (MTLBuffer *)[v5 newBufferWithLength:a3 options:0];
    postVertexDumpBuffer = self->_postVertexDumpBuffer;
    self->_postVertexDumpBuffer = v6;

    unsigned int v8 = self->_postVertexDumpBuffer;
    unsigned int v9 = [(DYMTLFunctionPlayer *)self->_player objectMap];
    uint64_t v11 = (void *)MEMORY[0x263F3FC70];
    objc_super v10 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v9, MEMORY[0x263F3FC70], (uint64_t)&std::piecewise_construct, &v11);
    objc_storeStrong(v10 + 3, v8);
  }
}

- (MTLBuffer)postVertexDumpBuffer
{
  return self->_postVertexDumpBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postVertexDumpBuffer, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end