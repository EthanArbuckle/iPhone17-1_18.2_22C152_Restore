@interface DYMTLDebugWireframeRenderer
- (BOOL)_currentRenderPipelineHasBufferOrTextureReadWrite:(id)a3 encoder:(id)a4;
- (BOOL)createSolidRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3 commandBufferId:(unint64_t)a4 commandEncoderId:(unint64_t)a5 parallelEncoderId:(unint64_t)a6;
- (BOOL)createWireframeRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3;
- (BOOL)currentRenderPipelineHasBufferOrTextureReadWrite:(unint64_t)a3;
- (DYMTLDebugWireframeRenderer)initWithDebugFunctionPlayer:(id)a3;
- (MTLTexture)outlineTexture;
- (MTLTexture)solidTexture;
- (MTLTexture)wireframeTexture;
- (int64_t)_prepareWireframeTextureWithEncoder:(id)a3 commandBuffer:(id)a4 pipelineState:(id)a5 parallelEncoder:(id)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7;
- (int64_t)prepareWireframeTextureWithCommandBufferId:(unint64_t)a3 commandEncoderId:(unint64_t)a4 parallelEncoderId:(unint64_t)a5 pipelineId:(unint64_t)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7;
- (void)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5;
- (void)createOutlineTexture;
@end

@implementation DYMTLDebugWireframeRenderer

- (DYMTLDebugWireframeRenderer)initWithDebugFunctionPlayer:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)DYMTLDebugWireframeRenderer;
  v6 = [(DYMTLDebugWireframeRenderer *)&v40 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_player, a3),
        [(DYMTLFunctionPlayer *)v7->_player device],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v36 = 0;
    goto LABEL_8;
  }
  v9 = [(DYMTLFunctionPlayer *)v7->_player device];
  objc_msgSend(NSString, "stringWithUTF8String:", "\n        #include <metal_graphics>\n        #include <metal_texture>\n\n        using namespace metal;\n"
    "    \n"
    "        fragment vec<float, 4> wireframeCreationFragment()\n"
    "        {\n"
    "            return vec<float, 4>(1.0, 1.0, 1.0, 1.0);\n"
    "        }\n"
    "    \n"
    "        kernel void createOutlineTexture(texture2d<half, access::read> solid [[texture(0)]], texture2d<half, access:"
    ":write> outline [[texture(1)]], uint2 gridPosition [[thread_position_in_grid]])\n"
    "        {\n"
    "            uint width = solid.get_width();\n"
    "            uint height = solid.get_height();\n"
    "            if (gridPosition.x < width && gridPosition.y < height)\n"
    "            {\n"
    "                auto currentColor = solid.read(gridPosition).r;\n"
    "                outline.write(vec<half, 4>(0.0, 0.0, 0.0, 0.0), gridPosition);\n"
    "                \n"
    "                if (abs(currentColor - 0.0) <= 0.0001)\n"
    "                {\n"
    "                    auto left = solid.read(uint2(gridPosition.x - 1, gridPosition.y)).r;\n"
    "                    auto right = solid.read(uint2(gridPosition.x + 1, gridPosition.y)).r;\n"
    "                    auto up = solid.read(uint2(gridPosition.x, gridPosition.y + 1)).r;\n"
    "                    auto down = solid.read(uint2(gridPosition.x, gridPosition.y - 1)).r;\n"
    "                    if (left == 1 || right == 1 || up == 1 || down == 1)\n"
    "                    {\n"
    "                        // pixel is part of the outline\n"
    "                        outline.write(vec<half, 4>(1.0, 1.0, 1.0, 1.0), gridPosition);\n"
    "                    }\n"
    "                }\n"
    "                else if (abs(currentColor - 1.0) <= 0.0001 && (gridPosition.x == 0 || gridPosition.y == 0 || gridPos"
    "ition.x == width - 1 || gridPosition.y == height - 1))\n"
    "                {\n"
    "                     outline.write(vec<half, 4>(1.0, 1.0, 1.0, 1.0), gridPosition);\n"
    "                }\n"
    "            }\n"
    "        }\n"
  v10 = "    ");
  id v39 = 0;
  uint64_t v11 = [v9 newLibraryWithSource:v10 options:0 error:&v39];
  id v12 = v39;
  wireframeLibrary = v7->_wireframeLibrary;
  v7->_wireframeLibrary = (MTLLibrary *)v11;

  v14 = v7->_wireframeLibrary;
  if (!v14)
  {
    v38 = "_wireframeLibrary != nil";
    goto LABEL_12;
  }
  uint64_t v15 = [(MTLLibrary *)v14 newFunctionWithName:@"wireframeCreationFragment"];
  wireframeCreationFragmentFunction = v7->_wireframeCreationFragmentFunction;
  v7->_wireframeCreationFragmentFunction = (MTLFunction *)v15;

  if (!v7->_wireframeCreationFragmentFunction)
  {
    v38 = "_wireframeCreationFragmentFunction != nil";
    goto LABEL_12;
  }
  uint64_t v17 = [(MTLLibrary *)v7->_wireframeLibrary newFunctionWithName:@"createOutlineTexture"];
  outlinePostProcessFunction = v7->_outlinePostProcessFunction;
  v7->_outlinePostProcessFunction = (MTLFunction *)v17;

  if (!v7->_outlinePostProcessFunction)
  {
    v38 = "_outlinePostProcessFunction != nil";
LABEL_12:
    __assert_rtn("-[DYMTLDebugWireframeRenderer initWithDebugFunctionPlayer:]", "", 0, v38);
  }
  uint64_t v19 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:10 width:1 height:1 mipmapped:0];
  wireframeTextureDescriptor = v7->_wireframeTextureDescriptor;
  v7->_wireframeTextureDescriptor = (MTLTextureDescriptor *)v19;

  [(MTLTextureDescriptor *)v7->_wireframeTextureDescriptor setUsage:[(MTLTextureDescriptor *)v7->_wireframeTextureDescriptor usage] | 5];
  uint64_t v21 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:10 width:1 height:1 mipmapped:0];
  outlineTextureDescriptor = v7->_outlineTextureDescriptor;
  v7->_outlineTextureDescriptor = (MTLTextureDescriptor *)v21;

  [(MTLTextureDescriptor *)v7->_outlineTextureDescriptor setUsage:[(MTLTextureDescriptor *)v7->_outlineTextureDescriptor usage] | 7];
  uint64_t v23 = [MEMORY[0x263F12998] renderPassDescriptor];
  wireframeRenderPassDescriptor = v7->_wireframeRenderPassDescriptor;
  v7->_wireframeRenderPassDescriptor = (MTLRenderPassDescriptor *)v23;

  v25 = [(MTLRenderPassDescriptor *)v7->_wireframeRenderPassDescriptor colorAttachments];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];
  wireframeRenderPassColorAttachmentDescriptor = v7->_wireframeRenderPassColorAttachmentDescriptor;
  v7->_wireframeRenderPassColorAttachmentDescriptor = (MTLRenderPassColorAttachmentDescriptor *)v26;

  [(MTLRenderPassColorAttachmentDescriptor *)v7->_wireframeRenderPassColorAttachmentDescriptor setLoadAction:2];
  [(MTLRenderPassColorAttachmentDescriptor *)v7->_wireframeRenderPassColorAttachmentDescriptor setStoreAction:1];
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:](v7->_wireframeRenderPassColorAttachmentDescriptor, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v28 = [MEMORY[0x263F12998] renderPassDescriptor];
  solidRenderPassDescriptor = v7->_solidRenderPassDescriptor;
  v7->_solidRenderPassDescriptor = (MTLRenderPassDescriptor *)v28;

  v30 = [(MTLRenderPassDescriptor *)v7->_solidRenderPassDescriptor colorAttachments];
  uint64_t v31 = [v30 objectAtIndexedSubscript:0];
  solidRenderPassColorAttachmentDescriptor = v7->_solidRenderPassColorAttachmentDescriptor;
  v7->_solidRenderPassColorAttachmentDescriptor = (MTLRenderPassColorAttachmentDescriptor *)v31;

  [(MTLRenderPassColorAttachmentDescriptor *)v7->_solidRenderPassColorAttachmentDescriptor setLoadAction:2];
  [(MTLRenderPassColorAttachmentDescriptor *)v7->_solidRenderPassColorAttachmentDescriptor setStoreAction:1];
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:](v7->_solidRenderPassColorAttachmentDescriptor, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  v33 = [v5 device];
  v7->_BOOL supports_tessellation = [v33 supportsFeatureSet:7];

  BOOL supports_tessellation = v7->_supports_tessellation;
  v35 = objc_opt_new();
  NSSelectorFromString(&cfstr_Tessellationco.isa);
  v7->_BOOL supports_tessellation = supports_tessellation & objc_opt_respondsToSelector();

  v36 = v7;
LABEL_8:

  return v36;
}

- (void)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v7 width])
  {
    if ([v7 height])
    {
      objc_msgSend(v9, "setWidth:", objc_msgSend(v7, "width"));
      objc_msgSend(v9, "setHeight:", objc_msgSend(v7, "height"));
      if (a5)
      {
        if (a5->renderTargetArrayLength + 1 >= 3)
        {
          id v8 = objc_alloc_init(MEMORY[0x263F12998]);
          if (objc_opt_respondsToSelector())
          {
            [v9 setTextureType:3];
            [v9 setArrayLength:a5->renderTargetArrayLength];
          }
        }
      }
    }
  }
}

- (int64_t)_prepareWireframeTextureWithEncoder:(id)a3 commandBuffer:(id)a4 pipelineState:(id)a5 parallelEncoder:(id)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id obj = a6;
  id v15 = a6;
  p_wireframeTexture = &self->_wireframeTexture;
  wireframeTexture = self->_wireframeTexture;
  self->_wireframeTexture = 0;

  int64_t v18 = 3;
  if (v12 && v13 && v14)
  {
    uint64_t v19 = DYMTLGetNullableAssociatedObject(v14, 0);
    if (([v19 isRasterizationEnabled] & 1) == 0) {
      goto LABEL_19;
    }
    [(DYMTLDebugWireframeRenderer *)self _updateTextureDescriptor:self->_wireframeTextureDescriptor usingEncoder:v12 renderPassDescriptor:a7];
    v20 = [(DYMTLFunctionPlayer *)self->_player device];
    DYMTLNewTexture(v20, self->_wireframeTextureDescriptor);
    uint64_t v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v22 = self->_wireframeTexture;
    self->_wireframeTexture = v21;

    [(DYMTLDebugWireframeRenderer *)self _updateTextureDescriptor:self->_outlineTextureDescriptor usingEncoder:v12 renderPassDescriptor:a7];
    uint64_t v23 = [(DYMTLFunctionPlayer *)self->_player device];
    DYMTLNewTexture(v23, self->_outlineTextureDescriptor);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    outlineTexture = self->_outlineTexture;
    self->_outlineTexture = v24;

    uint64_t v26 = [(DYMTLFunctionPlayer *)self->_player device];
    DYMTLNewTexture(v26, self->_wireframeTextureDescriptor);
    v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    solidTexture = self->_solidTexture;
    self->_solidTexture = v27;

    if (!self->_wireframeTexture)
    {
LABEL_19:
      int64_t v18 = 3;
      goto LABEL_20;
    }
    id v53 = v15;
    id v54 = v13;
    v52 = v19;
    id v29 = v19;
    v30 = objc_opt_new();
    uint64_t v31 = [v29 vertexDescriptor];
    [v30 setVertexDescriptor:v31];

    v32 = [v29 vertexFunction];
    [v30 setVertexFunction:v32];

    [v30 setFragmentFunction:self->_wireframeCreationFragmentFunction];
    v33 = [v30 colorAttachments];
    v34 = [v33 objectAtIndexedSubscript:0];
    [v34 setPixelFormat:10];

    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v30, "setInputPrimitiveTopology:", objc_msgSend(v29, "inputPrimitiveTopology"));
    }
    if (self->_supports_tessellation)
    {
      objc_msgSend(v30, "setTessellationFactorFormat:", objc_msgSend(v29, "tessellationFactorFormat"));
      objc_msgSend(v30, "setTessellationPartitionMode:", objc_msgSend(v29, "tessellationPartitionMode"));
      objc_msgSend(v30, "setTessellationOutputWindingOrder:", objc_msgSend(v29, "tessellationOutputWindingOrder"));
      objc_msgSend(v30, "setTessellationFactorScaleEnabled:", objc_msgSend(v29, "isTessellationFactorScaleEnabled"));
      objc_msgSend(v30, "setTessellationFactorStepFunction:", objc_msgSend(v29, "tessellationFactorStepFunction"));
      objc_msgSend(v30, "setMaxTessellationFactor:", objc_msgSend(v29, "maxTessellationFactor"));
      objc_msgSend(v30, "setTessellationControlPointIndexType:", objc_msgSend(v29, "tessellationControlPointIndexType"));
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v30, "setVertexAmplificationMode:", objc_msgSend(v29, "vertexAmplificationMode"));
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v30, "setMaxVertexAmplificationCount:", objc_msgSend(v29, "maxVertexAmplificationCount"));
    }
    v35 = [(DYMTLFunctionPlayer *)self->_player device];
    id v58 = 0;
    v36 = (MTLRenderPipelineState *)[v35 newRenderPipelineStateWithDescriptor:v30 error:&v58];
    id v37 = v58;
    wireframeRenderPipelineState = self->_wireframeRenderPipelineState;
    self->_wireframeRenderPipelineState = v36;

    DYMTLSetAssociatedObject(self->_wireframeRenderPipelineState, 0, v30);
    if (self->_wireframeRenderPipelineState)
    {

      id v39 = [(DYMTLFunctionPlayer *)self->_player device];
      outlinePostProcessFunction = self->_outlinePostProcessFunction;
      id v57 = 0;
      v41 = (MTLComputePipelineState *)[v39 newComputePipelineStateWithFunction:outlinePostProcessFunction error:&v57];
      id v37 = v57;
      p_wireframeTexture = &self->_outlineComputePipelineState;
      outlineComputePipelineState = self->_outlineComputePipelineState;
      self->_outlineComputePipelineState = v41;

      if (!v37)
      {
        objc_storeStrong((id *)&self->_originalCommandBuffer, a4);
        objc_storeStrong((id *)&self->_originalEncoder, a3);
        objc_storeStrong((id *)&self->_originalParallelEncoder, obj);
        v47 = [v12 device];
        v48 = [v12 descriptor];
        DYMTLNewStatefulRenderCommandEncoder(v47, v48);
        v49 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
        savedVertexState = self->_savedVertexState;
        self->_savedVertexState = v49;

        [(DYMTLStatefulRenderCommandEncoder *)self->_savedVertexState setRenderPipelineState:self->_wireframeRenderPipelineState];
        [v12 applyVertexStateToEncoder:self->_savedVertexState rawBytesBlock:&__block_literal_global];
        v45 = v51;
        if ([(DYMTLDebugWireframeRenderer *)self _currentRenderPipelineHasBufferOrTextureReadWrite:v14 encoder:v12])
        {
          [(DYMTLDebugWireframeRenderer *)self createWireframeRenderCommandEncoder:a7];
          int64_t v18 = 1;
        }
        else
        {
          int64_t v18 = 0;
        }
        goto LABEL_18;
      }
      v43 = self->_outlineTexture;
      self->_outlineTexture = 0;
    }
    v44 = *p_wireframeTexture;
    *p_wireframeTexture = 0;

    int64_t v18 = 3;
    v45 = v51;
LABEL_18:

    id v15 = v53;
    id v13 = v54;
    uint64_t v19 = v52;
LABEL_20:
  }
  return v18;
}

uint64_t __132__DYMTLDebugWireframeRenderer__prepareWireframeTextureWithEncoder_commandBuffer_pipelineState_parallelEncoder_renderPassDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)currentRenderPipelineHasBufferOrTextureReadWrite:(unint64_t)a3
{
  v3 = self;
  v4 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a3];
  id v5 = [v4 renderPipelineState];
  LOBYTE(v3) = [(DYMTLDebugWireframeRenderer *)v3 _currentRenderPipelineHasBufferOrTextureReadWrite:v5 encoder:v4];

  return (char)v3;
}

- (BOOL)_currentRenderPipelineHasBufferOrTextureReadWrite:(id)a3 encoder:(id)a4
{
  return 0;
}

- (BOOL)createWireframeRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3
{
  id v5 = [(DYFunctionPlayer *)self->_player engine];
  [v5 wireframeLineWidth];

  if ((*(_DWORD *)[(DYFunctionPlayer *)self->_player function] + 16147) < 4)
  {
    v6 = [(DYFunctionPlayer *)self->_player engine];
    [v6 tessellationWireframeLineWidth];
  }
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder endEncoding];
  originalParallelEncoder = self->_originalParallelEncoder;
  if (originalParallelEncoder) {
    [(DYMTLStatefulParallelRenderCommandEncoder *)originalParallelEncoder endEncoding];
  }
  [(MTLRenderPassColorAttachmentDescriptor *)self->_wireframeRenderPassColorAttachmentDescriptor setTexture:self->_wireframeTexture];
  if ((objc_opt_respondsToSelector() & 1) != 0 && a3->renderTargetArrayLength != -1) {
    -[MTLRenderPassDescriptor setRenderTargetArrayLength:](self->_wireframeRenderPassDescriptor, "setRenderTargetArrayLength:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && a3->rasterizationRateMap)
  {
    id v8 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
    [(MTLRenderPassDescriptor *)self->_wireframeRenderPassDescriptor setRasterizationRateMap:v8];
  }
  id v9 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_wireframeRenderPassDescriptor);
  [v9 setRenderPipelineState:self->_wireframeRenderPipelineState];
  savedVertexState = self->_savedVertexState;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke;
  v21[3] = &unk_265338F78;
  v21[4] = self;
  [(DYMTLStatefulRenderCommandEncoder *)savedVertexState applyVertexStateToEncoder:v9 rawBytesBlock:v21];
  uint64_t v11 = self->_savedVertexState;
  self->_savedVertexState = 0;

  originalEncoder = self->_originalEncoder;
  self->_originalEncoder = 0;

  id v13 = [(DYMTLFunctionPlayer *)self->_player device];
  id v14 = objc_opt_new();
  id v15 = (void *)[v13 newDepthStencilStateWithDescriptor:v14];

  [v9 setDepthStencilState:v15];
  [v9 setTriangleFillMode:1];
  [(DYMTLFunctionPlayer *)self->_player setObject:v9 forKey:self->_originalCommandEncoderId];
  v16 = [v9 device];
  uint64_t v17 = [v9 descriptor];
  DYMTLNewStatefulRenderCommandEncoder(v16, v17);
  int64_t v18 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = self->_savedVertexState;
  self->_savedVertexState = v18;

  [(DYMTLStatefulRenderCommandEncoder *)self->_savedVertexState setRenderPipelineState:self->_wireframeRenderPipelineState];
  [v9 applyVertexStateToEncoder:self->_savedVertexState rawBytesBlock:&__block_literal_global_68];

  return 1;
}

uint64_t __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

uint64_t __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)createSolidRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3 commandBufferId:(unint64_t)a4 commandEncoderId:(unint64_t)a5 parallelEncoderId:(unint64_t)a6
{
  solidTexture = self->_solidTexture;
  if (solidTexture)
  {
    self->_originalCommandEncoderId = a5;
    uint64_t v11 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a4];
    originalCommandBuffer = self->_originalCommandBuffer;
    self->_originalCommandBuffer = v11;

    id v13 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a5];
    originalEncoder = self->_originalEncoder;
    self->_originalEncoder = v13;

    id v15 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a6];
    originalParallelEncoder = self->_originalParallelEncoder;
    self->_originalParallelEncoder = v15;

    [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder endEncoding];
    uint64_t v17 = self->_originalParallelEncoder;
    if (v17) {
      [(DYMTLStatefulParallelRenderCommandEncoder *)v17 endEncoding];
    }
    [(MTLRenderPassColorAttachmentDescriptor *)self->_solidRenderPassColorAttachmentDescriptor setTexture:self->_solidTexture];
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3->renderTargetArrayLength != -1) {
      -[MTLRenderPassDescriptor setRenderTargetArrayLength:](self->_solidRenderPassDescriptor, "setRenderTargetArrayLength:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3->rasterizationRateMap)
    {
      int64_t v18 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
      [(MTLRenderPassDescriptor *)self->_solidRenderPassDescriptor setRasterizationRateMap:v18];
    }
    uint64_t v19 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_solidRenderPassDescriptor);
    [v19 setRenderPipelineState:self->_wireframeRenderPipelineState];
    savedVertexState = self->_savedVertexState;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __114__DYMTLDebugWireframeRenderer_createSolidRenderCommandEncoder_commandBufferId_commandEncoderId_parallelEncoderId___block_invoke;
    v24[3] = &unk_265338F78;
    v24[4] = self;
    [(DYMTLStatefulRenderCommandEncoder *)savedVertexState applyVertexStateToEncoder:v19 rawBytesBlock:v24];
    uint64_t v21 = self->_savedVertexState;
    self->_savedVertexState = 0;

    v22 = self->_originalEncoder;
    self->_originalEncoder = 0;

    [(DYMTLFunctionPlayer *)self->_player setObject:v19 forKey:self->_originalCommandEncoderId];
  }
  return solidTexture != 0;
}

uint64_t __114__DYMTLDebugWireframeRenderer_createSolidRenderCommandEncoder_commandBufferId_commandEncoderId_parallelEncoderId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (void)createOutlineTexture
{
  if (self->_outlineComputePipelineState && self->_solidTexture)
  {
    v3 = [(DYMTLFunctionPlayer *)self->_player objectForKey:self->_originalCommandEncoderId];
    [v3 endEncoding];

    [(DYMTLFunctionPlayer *)self->_player removeObjectForKey:self->_originalCommandEncoderId];
    v4 = DYMTLNewStatefulComputeCommandEncoder(self->_originalCommandBuffer, 0);
    unint64_t v5 = [(MTLTexture *)self->_solidTexture width];
    unint64_t v6 = [(MTLTexture *)self->_solidTexture height];
    [v4 setComputePipelineState:self->_outlineComputePipelineState];
    unint64_t v7 = vcvtps_u32_f32((float)v5 * 0.0625);
    unint64_t v8 = vcvtps_u32_f32((float)v6 * 0.0625);
    if ([(MTLTexture *)self->_solidTexture textureType] == 3)
    {
      unint64_t v9 = 0;
      int64x2_t v12 = vdupq_n_s64(0x10uLL);
      while (v9 < [(MTLTexture *)self->_solidTexture arrayLength])
      {
        v10 = DYMTLNewTextureView(self->_solidTexture, [(MTLTexture *)self->_solidTexture pixelFormat], 2, 0, [(MTLTexture *)self->_solidTexture mipmapLevelCount], v9, 1uLL);
        uint64_t v11 = DYMTLNewTextureView(self->_outlineTexture, [(MTLTexture *)self->_outlineTexture pixelFormat], 2, 0, [(MTLTexture *)self->_outlineTexture mipmapLevelCount], v9, 1uLL);
        [v4 setTexture:v10 atIndex:0];
        [v4 setTexture:v11 atIndex:1];
        v18[0] = v7;
        v18[1] = v8;
        v18[2] = 1;
        int64x2_t v16 = v12;
        uint64_t v17 = 1;
        [v4 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];

        ++v9;
      }
    }
    else
    {
      [v4 setTexture:self->_solidTexture atIndex:0];
      [v4 setTexture:self->_outlineTexture atIndex:1];
      v15[0] = v7;
      v15[1] = v8;
      v15[2] = 1;
      int64x2_t v13 = vdupq_n_s64(0x10uLL);
      uint64_t v14 = 1;
      [v4 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
    }
    [v4 endEncoding];
  }
}

- (int64_t)prepareWireframeTextureWithCommandBufferId:(unint64_t)a3 commandEncoderId:(unint64_t)a4 parallelEncoderId:(unint64_t)a5 pipelineId:(unint64_t)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7
{
  int64x2_t v12 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a3];
  self->_originalCommandEncoderId = a4;
  int64x2_t v13 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a4];
  if (a5)
  {
    a5 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a5];
  }
  uint64_t v14 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a6];
  int64_t v15 = [(DYMTLDebugWireframeRenderer *)self _prepareWireframeTextureWithEncoder:v13 commandBuffer:v12 pipelineState:v14 parallelEncoder:a5 renderPassDescriptor:a7];

  return v15;
}

- (MTLTexture)wireframeTexture
{
  return self->_wireframeTexture;
}

- (MTLTexture)outlineTexture
{
  return self->_outlineTexture;
}

- (MTLTexture)solidTexture
{
  return self->_solidTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalParallelEncoder, 0);
  objc_storeStrong((id *)&self->_originalEncoder, 0);
  objc_storeStrong((id *)&self->_originalCommandBuffer, 0);
  objc_storeStrong((id *)&self->_savedVertexState, 0);
  objc_storeStrong((id *)&self->_outlineComputePipelineState, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_solidRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_solidRenderPassColorAttachmentDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPassColorAttachmentDescriptor, 0);
  objc_storeStrong((id *)&self->_solidTexture, 0);
  objc_storeStrong((id *)&self->_outlineTexture, 0);
  objc_storeStrong((id *)&self->_wireframeTexture, 0);
  objc_storeStrong((id *)&self->_outlineTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_outlinePostProcessFunction, 0);
  objc_storeStrong((id *)&self->_wireframeCreationFragmentFunction, 0);
  objc_storeStrong((id *)&self->_wireframeLibrary, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end