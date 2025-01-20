@interface DYMTLPixelHistoryDrawStatsSupport
- (BOOL)_prepareWithEncoder:(id)a3 parallelEncoder:(id)a4 pipelineState:(id)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6;
- (BOOL)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5;
- (BOOL)createNumFragmentPassesRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5;
- (BOOL)createNumTotalRenderCommandEncoderInCommandBuffer:(id)a3 originalPipeline:(id)a4;
- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10;
- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10;
- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10;
- (BOOL)prepareWithCommandEncoderId:(unint64_t)a3 parallelEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6;
- (DYMTLPixelHistoryDrawStatsSupport)initWithDebugFunctionPlayer:(id)a3;
- (MTLTexture)mockDepthTexture;
- (MTLTexture)mockStencilTexture;
- (id)getSingleUseMockColorTexture:(unint64_t)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (id)getSingleUseMockDepthTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (id)getSingleUseMockStencilTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (void)collectPixelHistoryStencilDrawStatsAtX:(unint64_t)a3 y:(unint64_t)a4 completion:(id)a5;
- (void)collectPixelHistoryVisibilityDrawStatsAtCompletion:(id)a3;
- (void)setMockDepthTexture:(id)a3;
- (void)setMockStencilTexture:(id)a3;
@end

@implementation DYMTLPixelHistoryDrawStatsSupport

- (DYMTLPixelHistoryDrawStatsSupport)initWithDebugFunctionPlayer:(id)a3
{
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DYMTLPixelHistoryDrawStatsSupport;
  v6 = [(DYMTLPixelHistoryDrawStatsSupport *)&v48 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_player, a3),
        [(DYMTLFunctionPlayer *)v7->_player device],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v44 = 0;
    goto LABEL_9;
  }
  v9 = [(DYMTLFunctionPlayer *)v7->_player device];
  objc_msgSend(NSString, "stringWithUTF8String:", "\n        #include <metal_graphics>\n        #include <metal_texture>\n\n        using namespace metal;\n"
    "\n"
    "        fragment vec<float, 4> solidCreationFragment()\n"
    "        {\n"
    "            return vec<float, 4>(1.0, 1.0, 1.0, 1.0);\n"
    "        }\n"
  v10 = "    ");
  id v47 = 0;
  uint64_t v11 = [v9 newLibraryWithSource:v10 options:0 error:&v47];
  id v12 = v47;
  solidLibrary = v7->_solidLibrary;
  v7->_solidLibrary = (MTLLibrary *)v11;

  v14 = v7->_solidLibrary;
  if (!v14)
  {
    v46 = "_solidLibrary != nil";
    goto LABEL_12;
  }
  uint64_t v15 = [(MTLLibrary *)v14 newFunctionWithName:@"solidCreationFragment"];
  solidCreationFragmentFunction = v7->_solidCreationFragmentFunction;
  v7->_solidCreationFragmentFunction = (MTLFunction *)v15;

  if (!v7->_solidCreationFragmentFunction)
  {
    v46 = "_solidCreationFragmentFunction != nil";
LABEL_12:
    __assert_rtn("-[DYMTLPixelHistoryDrawStatsSupport initWithDebugFunctionPlayer:]", "", 0, v46);
  }
  uint64_t v17 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:253 width:1 height:1 mipmapped:0];
  stencilTextureDescriptor = v7->_stencilTextureDescriptor;
  v7->_stencilTextureDescriptor = (MTLTextureDescriptor *)v17;

  [(MTLTextureDescriptor *)v7->_stencilTextureDescriptor setUsage:[(MTLTextureDescriptor *)v7->_stencilTextureDescriptor usage] | 4];
  [(MTLTextureDescriptor *)v7->_stencilTextureDescriptor setStorageMode:2];
  uint64_t v19 = objc_opt_new();
  mockColorTextureDescriptors = v7->_mockColorTextureDescriptors;
  v7->_mockColorTextureDescriptors = (NSMutableArray *)v19;

  for (uint64_t i = 0; i != 8; ++i)
  {
    v22 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:0 width:1 height:1 mipmapped:0];
    [(NSMutableArray *)v7->_mockColorTextureDescriptors setObject:v22 atIndexedSubscript:i];

    v23 = [(NSMutableArray *)v7->_mockColorTextureDescriptors objectAtIndexedSubscript:i];
    [v23 setUsage:4];

    v24 = [(NSMutableArray *)v7->_mockColorTextureDescriptors objectAtIndexedSubscript:i];
    [v24 setStorageMode:2];
  }
  uint64_t v25 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:0 width:1 height:1 mipmapped:0];
  mockStencilTextureDescriptor = v7->_mockStencilTextureDescriptor;
  v7->_mockStencilTextureDescriptor = (MTLTextureDescriptor *)v25;

  [(MTLTextureDescriptor *)v7->_mockStencilTextureDescriptor setUsage:[(MTLTextureDescriptor *)v7->_mockStencilTextureDescriptor usage] | 4];
  [(MTLTextureDescriptor *)v7->_mockStencilTextureDescriptor setStorageMode:2];
  uint64_t v27 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:0 width:1 height:1 mipmapped:0];
  mockDepthTextureDescriptor = v7->_mockDepthTextureDescriptor;
  v7->_mockDepthTextureDescriptor = (MTLTextureDescriptor *)v27;

  [(MTLTextureDescriptor *)v7->_mockDepthTextureDescriptor setUsage:[(MTLTextureDescriptor *)v7->_mockDepthTextureDescriptor usage] | 4];
  [(MTLTextureDescriptor *)v7->_mockDepthTextureDescriptor setStorageMode:2];
  uint64_t v29 = [MEMORY[0x263F12998] renderPassDescriptor];
  pixelHistoryRenderPassDescriptor = v7->_pixelHistoryRenderPassDescriptor;
  v7->_pixelHistoryRenderPassDescriptor = (MTLRenderPassDescriptor *)v29;

  v31 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryRenderPassDescriptor colorAttachments];
  v32 = [v31 objectAtIndexedSubscript:0];

  [v32 setLoadAction:0];
  [v32 setStoreAction:0];
  v33 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryRenderPassDescriptor stencilAttachment];
  [v33 setLoadAction:2];
  [v33 setStoreAction:1];
  [v33 setClearStencil:0];

  uint64_t v34 = [MEMORY[0x263F12998] renderPassDescriptor];
  pixelHistoryMockRenderPassDescriptor = v7->_pixelHistoryMockRenderPassDescriptor;
  v7->_pixelHistoryMockRenderPassDescriptor = (MTLRenderPassDescriptor *)v34;

  v36 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryMockRenderPassDescriptor depthAttachment];
  [v36 setLoadAction:1];
  [v36 setStoreAction:0];
  v37 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryMockRenderPassDescriptor stencilAttachment];
  [v37 setLoadAction:2];
  [v37 setStoreAction:1];
  [v37 setClearStencil:0];

  uint64_t v38 = [MEMORY[0x263F12998] renderPassDescriptor];
  pixelHistoryVisibilityMockRenderPassDescriptor = v7->_pixelHistoryVisibilityMockRenderPassDescriptor;
  v7->_pixelHistoryVisibilityMockRenderPassDescriptor = (MTLRenderPassDescriptor *)v38;

  v40 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryVisibilityMockRenderPassDescriptor depthAttachment];
  [v40 setLoadAction:1];
  [v40 setStoreAction:0];
  v41 = [(MTLRenderPassDescriptor *)v7->_pixelHistoryVisibilityMockRenderPassDescriptor stencilAttachment];
  [v41 setLoadAction:1];
  [v41 setStoreAction:0];

  v42 = [v5 device];
  v7->_supports_tessellation = [v42 supportsFeatureSet:7];

  LODWORD(v41) = v7->_supports_tessellation;
  v43 = objc_opt_new();
  NSSelectorFromString(&cfstr_Tessellationco.isa);
  v7->_supports_tessellation = (v41 != 0) & objc_opt_respondsToSelector();

  v44 = v7;
LABEL_9:

  return v44;
}

- (BOOL)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 width]
    && [v7 height]
    && ((uint64_t v8 = [v6 width], v8 != objc_msgSend(v7, "width"))
     || (uint64_t v9 = [v6 height], v9 != objc_msgSend(v7, "height"))))
  {
    objc_msgSend(v6, "setWidth:", objc_msgSend(v7, "width"));
    objc_msgSend(v6, "setHeight:", objc_msgSend(v7, "height"));
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)getSingleUseMockColorTexture:(unint64_t)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  uint64_t v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:");
  if ([v11 pixelFormat] != a4) {
    goto LABEL_6;
  }
  id v12 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
  if ([v12 width] != a5)
  {

LABEL_6:
    goto LABEL_7;
  }
  v13 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
  uint64_t v14 = [v13 height];

  if (v14 != a6)
  {
LABEL_7:
    uint64_t v15 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
    [v15 setPixelFormat:a4];

    v16 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
    [v16 setWidth:a5];

    uint64_t v17 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
    [v17 setHeight:a6];

    v18 = [(DYMTLFunctionPlayer *)self->_player device];
    uint64_t v19 = [(NSMutableArray *)self->_mockColorTextureDescriptors objectAtIndexedSubscript:a3];
    v20 = DYMTLNewTexture(v18, v19);
    [(NSMutableArray *)self->_mockColorTextures setObject:v20 atIndexedSubscript:a3];
  }
  mockColorTextures = self->_mockColorTextures;
  return (id)[(NSMutableArray *)mockColorTextures objectAtIndexedSubscript:a3];
}

- (id)getSingleUseMockDepthTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  if ([(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor pixelFormat] != a3
    || [(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor width] != a4
    || [(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor height] != a5)
  {
    [(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor setPixelFormat:a3];
    [(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor setWidth:a4];
    [(MTLTextureDescriptor *)self->_mockDepthTextureDescriptor setHeight:a5];
    uint64_t v9 = [(DYMTLFunctionPlayer *)self->_player device];
    DYMTLNewTexture(v9, self->_mockDepthTextureDescriptor);
    BOOL v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mockDepthTexture = self->_mockDepthTexture;
    self->_mockDepthTexture = v10;
  }
  id v12 = self->_mockDepthTexture;
  return v12;
}

- (id)getSingleUseMockStencilTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  if ([(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor pixelFormat] != a3
    || [(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor width] != a4
    || [(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor height] != a5)
  {
    [(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor setPixelFormat:a3];
    [(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor setWidth:a4];
    [(MTLTextureDescriptor *)self->_mockStencilTextureDescriptor setHeight:a5];
    uint64_t v9 = [(DYMTLFunctionPlayer *)self->_player device];
    DYMTLNewTexture(v9, self->_mockStencilTextureDescriptor);
    BOOL v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mockStencilTexture = self->_mockStencilTexture;
    self->_mockStencilTexture = v10;
  }
  id v12 = self->_mockStencilTexture;
  return v12;
}

- (BOOL)prepareWithCommandEncoderId:(unint64_t)a3 parallelEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6
{
  self->_originalCommandEncoderId = a3;
  BOOL v10 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
  if (a4)
  {
    a4 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a4];
  }
  uint64_t v11 = [(DYMTLFunctionPlayer *)self->_player objectForKey:a5];
  BOOL v12 = [(DYMTLPixelHistoryDrawStatsSupport *)self _prepareWithEncoder:v10 parallelEncoder:a4 pipelineState:v11 renderPassDescriptor:a6];

  return v12;
}

- (BOOL)_prepareWithEncoder:(id)a3 parallelEncoder:(id)a4 pipelineState:(id)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6
{
  id v11 = a3;
  id v31 = a4;
  BOOL v12 = DYMTLGetNullableAssociatedObject(a5, 0);
  char v13 = [v12 isRasterizationEnabled];
  if (v13)
  {
    v30 = [v11 descriptor];
    if ([(DYMTLPixelHistoryDrawStatsSupport *)self _updateTextureDescriptor:self->_stencilTextureDescriptor usingEncoder:v11 renderPassDescriptor:a6])
    {
      uint64_t v14 = [(DYMTLFunctionPlayer *)self->_player device];
      DYMTLNewTexture(v14, self->_stencilTextureDescriptor);
      uint64_t v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      stencilTexture = self->_stencilTexture;
      self->_stencilTexture = v15;
    }
    uint64_t v17 = [v30 stencilAttachment];
    v18 = [v17 texture];
    uint64_t v19 = v18;
    if (v18) {
      id v20 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockStencilTextureWithPixelFormat:width:height:](self, "getSingleUseMockStencilTextureWithPixelFormat:width:height:", [v18 pixelFormat], objc_msgSend(v18, "width"), objc_msgSend(v18, "height"));
    }

    v21 = [v30 depthAttachment];
    v22 = [v21 texture];
    v23 = v22;
    if (v22) {
      id v24 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockDepthTextureWithPixelFormat:width:height:](self, "getSingleUseMockDepthTextureWithPixelFormat:width:height:", [v22 pixelFormat], objc_msgSend(v22, "width"), objc_msgSend(v22, "height"));
    }

    objc_storeStrong((id *)&self->_originalEncoder, a3);
    objc_storeStrong((id *)&self->_originalParallelEncoder, a4);
    uint64_t v25 = [v11 device];
    v26 = [v11 descriptor];
    DYMTLNewStatefulRenderCommandEncoder(v25, v26);
    uint64_t v27 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
    savedVertexFragmentState = self->_savedVertexFragmentState;
    self->_savedVertexFragmentState = v27;

    [v11 applyVertexFragmentStateToEncoder:self->_savedVertexFragmentState rawBytesBlock:&__block_literal_global_2];
  }

  return v13;
}

uint64_t __108__DYMTLPixelHistoryDrawStatsSupport__prepareWithEncoder_parallelEncoder_pipelineState_renderPassDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)createNumTotalRenderCommandEncoderInCommandBuffer:(id)a3 originalPipeline:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  uint64_t v9 = DYMTLGetAssociatedObject(v8, 0);
  BOOL v10 = [(DYMTLPixelHistoryDrawStatsSupport *)self getSingleUseMockColorTexture:0 pixelFormat:10 width:[(MTLTexture *)self->_stencilTexture width] height:[(MTLTexture *)self->_stencilTexture height]];
  id v11 = [(MTLRenderPassDescriptor *)self->_pixelHistoryRenderPassDescriptor colorAttachments];
  BOOL v12 = [v11 objectAtIndexedSubscript:0];
  [v12 setTexture:v10];

  stencilTexture = self->_stencilTexture;
  uint64_t v14 = [(MTLRenderPassDescriptor *)self->_pixelHistoryRenderPassDescriptor stencilAttachment];
  [v14 setTexture:stencilTexture];
  v42 = v8;

  uint64_t v15 = objc_opt_new();
  v16 = objc_opt_new();
  for (uint64_t i = 0; i != 8; ++i)
  {
    v18 = [v9 colorAttachments];
    uint64_t v19 = [v18 objectAtIndexedSubscript:i];

    id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "pixelFormat"));
    [v15 addObject:v20];

    v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "isBlendingEnabled"));
    [v16 addObject:v21];

    [v19 setPixelFormat:0];
    [v19 setBlendingEnabled:0];
  }
  uint64_t v22 = [v9 depthAttachmentPixelFormat];
  uint64_t v23 = [v9 stencilAttachmentPixelFormat];
  v43 = [v9 fragmentFunction];
  id v24 = [v9 colorAttachments];
  uint64_t v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setPixelFormat:10];

  [v9 setDepthAttachmentPixelFormat:0];
  [v9 setStencilAttachmentPixelFormat:253];
  [v9 setFragmentFunction:self->_solidCreationFragmentFunction];
  v26 = [(DYMTLFunctionPlayer *)self->_player device];
  id v46 = 0;
  uint64_t v27 = (void *)[v26 newRenderPipelineStateWithDescriptor:v9 error:&v46];
  id v41 = v46;

  if (v27)
  {
    id v40 = v7;
    for (uint64_t j = 0; j != 8; ++j)
    {
      uint64_t v29 = objc_msgSend(v9, "colorAttachments", v40, v41, v42);
      v30 = [v29 objectAtIndexedSubscript:j];

      id v31 = [v15 objectAtIndexedSubscript:j];
      objc_msgSend(v30, "setPixelFormat:", objc_msgSend(v31, "unsignedLongLongValue"));

      v32 = [v16 objectAtIndexedSubscript:j];
      objc_msgSend(v30, "setBlendingEnabled:", objc_msgSend(v32, "unsignedLongLongValue") != 0);
    }
    [v9 setDepthAttachmentPixelFormat:v22];
    [v9 setStencilAttachmentPixelFormat:v23];
    [v9 setFragmentFunction:v43];
    v33 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryRenderPassDescriptor);
    [v33 setRenderPipelineState:v27];
    [v33 setTriangleFillMode:0];
    savedVertexFragmentState = self->_savedVertexFragmentState;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __104__DYMTLPixelHistoryDrawStatsSupport_createNumTotalRenderCommandEncoderInCommandBuffer_originalPipeline___block_invoke;
    v45[3] = &unk_265338F78;
    v45[4] = self;
    [(DYMTLStatefulRenderCommandEncoder *)savedVertexFragmentState applyVertexFragmentStateToEncoder:v33 rawBytesBlock:v45];
    v44[0] = 0;
    v44[1] = 0;
    v44[2] = [v33 width];
    v44[3] = [v33 height];
    [v33 setScissorRect:v44];
    v35 = objc_opt_new();
    [v35 setDepthStencilPassOperation:3];
    v36 = objc_opt_new();
    [v36 setFrontFaceStencil:v35];
    [v36 setBackFaceStencil:v35];
    v37 = [(DYMTLFunctionPlayer *)self->_player device];
    uint64_t v38 = (void *)[v37 newDepthStencilStateWithDescriptor:v36];

    [v33 setDepthStencilState:v38];
    [(DYMTLFunctionPlayer *)self->_player setObject:v33 forKey:self->_originalCommandEncoderId];

    id v7 = v40;
  }

  return v27 != 0;
}

uint64_t __104__DYMTLPixelHistoryDrawStatsSupport_createNumTotalRenderCommandEncoderInCommandBuffer_originalPipeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (BOOL)createNumFragmentPassesRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  v37 = v11;
  BOOL v12 = DYMTLGetAssociatedObject(v11, 0);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v14 = [v10 colorAttachments];
    uint64_t v15 = [v14 objectAtIndexedSubscript:i];

    v16 = [(MTLRenderPassDescriptor *)self->_pixelHistoryMockRenderPassDescriptor colorAttachments];
    uint64_t v17 = [v16 objectAtIndexedSubscript:i];

    [v17 setLoadAction:0];
    [v17 setStoreAction:0];
    v18 = [v15 texture];
    uint64_t v19 = v18;
    if (v18)
    {
      id v20 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, [v18 pixelFormat], objc_msgSend(v18, "width"), objc_msgSend(v18, "height"));
      [v17 setTexture:v20];
    }
    else
    {
      [v17 setTexture:0];
    }
  }
  v21 = [(MTLRenderPassDescriptor *)self->_pixelHistoryMockRenderPassDescriptor depthAttachment];
  [v21 setTexture:0];

  stencilTexture = self->_stencilTexture;
  uint64_t v23 = [(MTLRenderPassDescriptor *)self->_pixelHistoryMockRenderPassDescriptor stencilAttachment];
  [v23 setTexture:stencilTexture];

  uint64_t v24 = [v12 depthAttachmentPixelFormat];
  uint64_t v25 = [v12 stencilAttachmentPixelFormat];
  [v12 setDepthAttachmentPixelFormat:0];
  [v12 setStencilAttachmentPixelFormat:253];
  v26 = [(DYMTLFunctionPlayer *)self->_player device];
  id v39 = 0;
  uint64_t v27 = (void *)[v26 newRenderPipelineStateWithDescriptor:v12 error:&v39];
  id v28 = v39;

  if (v27)
  {
    id v36 = v9;
    [v12 setDepthAttachmentPixelFormat:v24];
    [v12 setStencilAttachmentPixelFormat:v25];
    uint64_t v29 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryMockRenderPassDescriptor);
    [v29 setRenderPipelineState:v27];
    [v29 setTriangleFillMode:0];
    savedVertexFragmentState = self->_savedVertexFragmentState;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __142__DYMTLPixelHistoryDrawStatsSupport_createNumFragmentPassesRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline___block_invoke;
    v38[3] = &unk_265338F78;
    v38[4] = self;
    [(DYMTLStatefulRenderCommandEncoder *)savedVertexFragmentState applyVertexFragmentStateToEncoder:v29 rawBytesBlock:v38];
    id v31 = objc_opt_new();
    [v31 setDepthStencilPassOperation:3];
    v32 = objc_opt_new();
    [v32 setFrontFaceStencil:v31];
    [v32 setBackFaceStencil:v31];
    v33 = [(DYMTLFunctionPlayer *)self->_player device];
    uint64_t v34 = (void *)[v33 newDepthStencilStateWithDescriptor:v32];

    [v29 setDepthStencilState:v34];
    [(DYMTLFunctionPlayer *)self->_player setObject:v29 forKey:self->_originalCommandEncoderId];

    id v9 = v36;
  }

  return v27 != 0;
}

uint64_t __142__DYMTLPixelHistoryDrawStatsSupport_createNumFragmentPassesRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  unint64_t v49 = a10;
  unint64_t v48 = a9;
  id v51 = a3;
  id v16 = a4;
  id v52 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (uint64_t i = 0; i != 8; ++i)
  {
    id v20 = objc_msgSend(v16, "colorAttachments", v48, v49);
    v21 = [v20 objectAtIndexedSubscript:i];

    uint64_t v22 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor colorAttachments];
    uint64_t v23 = [v22 objectAtIndexedSubscript:i];

    [v23 setLoadAction:0];
    [v23 setStoreAction:0];
    uint64_t v24 = [v21 texture];
    uint64_t v25 = v24;
    if (v24)
    {
      v26 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, [v24 pixelFormat], objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      [v23 setTexture:v26];
    }
    else
    {
      [v23 setTexture:0];
    }
  }
  uint64_t v27 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor depthAttachment];
  [v27 setTexture:v18];

  id v28 = [v16 stencilAttachment];
  uint64_t v29 = [v28 texture];
  v30 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor stencilAttachment];
  if (v29) {
    [v30 setTexture:v18];
  }
  else {
    [v30 setTexture:0];
  }

  id v31 = [(DYMTLFunctionPlayer *)self->_player device];
  v32 = (MTLBuffer *)[v31 newBufferWithLength:8 options:0];
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v32;

  [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor setVisibilityResultBuffer:self->_visibilityResultBuffer];
  uint64_t v34 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  [v34 setRenderPipelineState:v52];
  [v34 setTriangleFillMode:0];
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __202__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthTexture_visibilityResultMode_atX_y___block_invoke;
  v55[3] = &unk_265338F78;
  v55[4] = self;
  [(DYMTLStatefulRenderCommandEncoder *)savedVertexFragmentState applyVertexFragmentStateToEncoder:v34 rawBytesBlock:v55];
  id v36 = objc_opt_new();
  objc_msgSend(v36, "setDepthWriteEnabled:", objc_msgSend(v17, "isDepthWriteEnabled"));
  objc_msgSend(v36, "setDepthCompareFunction:", objc_msgSend(v17, "depthCompareFunction"));
  v37 = [(DYMTLFunctionPlayer *)self->_player device];
  uint64_t v38 = (void *)[v37 newDepthStencilStateWithDescriptor:v36];

  [v34 setDepthStencilState:v38];
  objc_msgSend(v34, "setDepthClipMode:", -[DYMTLStatefulRenderCommandEncoder depthClipMode](self->_originalEncoder, "depthClipMode"));
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBias];
  int v40 = v39;
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBiasSlopeScale];
  int v42 = v41;
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBiasClamp];
  LODWORD(v44) = v43;
  LODWORD(v45) = v40;
  LODWORD(v46) = v42;
  [v34 setDepthBias:v45 slopeScale:v46 clamp:v44];
  [v34 setVisibilityResultMode:a8 offset:0];
  v53[0] = v48;
  v53[1] = v49;
  int64x2_t v54 = vdupq_n_s64(1uLL);
  [v34 setScissorRect:v53];
  [(DYMTLFunctionPlayer *)self->_player setObject:v34 forKey:self->_originalCommandEncoderId];

  return 1;
}

uint64_t __202__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  unint64_t v47 = a10;
  unint64_t v46 = a9;
  id v49 = a3;
  id v16 = a4;
  id v50 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (uint64_t i = 0; i != 8; ++i)
  {
    id v20 = objc_msgSend(v16, "colorAttachments", v46, v47);
    v21 = [v20 objectAtIndexedSubscript:i];

    uint64_t v22 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor colorAttachments];
    uint64_t v23 = [v22 objectAtIndexedSubscript:i];

    [v23 setLoadAction:0];
    [v23 setStoreAction:0];
    uint64_t v24 = [v21 texture];
    uint64_t v25 = v24;
    if (v24)
    {
      v26 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, [v24 pixelFormat], objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      [v23 setTexture:v26];
    }
    else
    {
      [v23 setTexture:0];
    }
  }
  uint64_t v27 = [v16 depthAttachment];
  id v28 = [v27 texture];
  uint64_t v29 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor depthAttachment];
  if (v28) {
    [v29 setTexture:v18];
  }
  else {
    [v29 setTexture:0];
  }

  v30 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor stencilAttachment];
  [v30 setTexture:v18];

  id v31 = [(DYMTLFunctionPlayer *)self->_player device];
  v32 = (MTLBuffer *)[v31 newBufferWithLength:8 options:0];
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v32;

  [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor setVisibilityResultBuffer:self->_visibilityResultBuffer];
  uint64_t v34 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  [v34 setRenderPipelineState:v50];
  [v34 setTriangleFillMode:0];
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  void v53[2] = __204__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockStencilTexture_visibilityResultMode_atX_y___block_invoke;
  v53[3] = &unk_265338F78;
  v53[4] = self;
  [(DYMTLStatefulRenderCommandEncoder *)savedVertexFragmentState applyVertexFragmentStateToEncoder:v34 rawBytesBlock:v53];
  id v36 = objc_opt_new();
  v37 = [v17 frontFaceStencil];
  objc_msgSend(v36, "setStencilCompareFunction:", objc_msgSend(v37, "stencilCompareFunction"));

  uint64_t v38 = [v17 frontFaceStencil];
  objc_msgSend(v36, "setStencilFailureOperation:", objc_msgSend(v38, "stencilFailureOperation"));

  int v39 = objc_opt_new();
  int v40 = [v17 backFaceStencil];
  objc_msgSend(v39, "setStencilCompareFunction:", objc_msgSend(v40, "stencilCompareFunction"));

  int v41 = [v17 backFaceStencil];
  objc_msgSend(v39, "setStencilFailureOperation:", objc_msgSend(v41, "stencilFailureOperation"));

  int v42 = objc_opt_new();
  [v42 setFrontFaceStencil:v36];
  [v42 setBackFaceStencil:v39];
  int v43 = [(DYMTLFunctionPlayer *)self->_player device];
  double v44 = (void *)[v43 newDepthStencilStateWithDescriptor:v42];

  [v34 setDepthStencilState:v44];
  objc_msgSend(v34, "setStencilFrontReferenceValue:backReferenceValue:", -[DYMTLStatefulRenderCommandEncoder frontReferenceValue](self->_originalEncoder, "frontReferenceValue"), -[DYMTLStatefulRenderCommandEncoder backReferenceValue](self->_originalEncoder, "backReferenceValue"));
  [v34 setVisibilityResultMode:a8 offset:0];
  v51[0] = v46;
  v51[1] = v47;
  int64x2_t v52 = vdupq_n_s64(1uLL);
  [v34 setScissorRect:v51];
  [(DYMTLFunctionPlayer *)self->_player setObject:v34 forKey:self->_originalCommandEncoderId];

  return 1;
}

uint64_t __204__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockStencilTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  unint64_t v46 = a10;
  unint64_t v45 = a9;
  id v48 = a3;
  id v16 = a4;
  id v49 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (uint64_t i = 0; i != 8; ++i)
  {
    id v20 = objc_msgSend(v16, "colorAttachments", v45, v46);
    v21 = [v20 objectAtIndexedSubscript:i];

    uint64_t v22 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor colorAttachments];
    uint64_t v23 = [v22 objectAtIndexedSubscript:i];

    [v23 setLoadAction:0];
    [v23 setStoreAction:0];
    uint64_t v24 = [v21 texture];
    uint64_t v25 = v24;
    if (v24)
    {
      v26 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, [v24 pixelFormat], objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      [v23 setTexture:v26];
    }
    else
    {
      [v23 setTexture:0];
    }
  }
  uint64_t v27 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor depthAttachment];
  [v27 setTexture:v18];

  id v28 = [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor stencilAttachment];
  [v28 setTexture:v18];

  uint64_t v29 = [(DYMTLFunctionPlayer *)self->_player device];
  v30 = (MTLBuffer *)[v29 newBufferWithLength:8 options:0];
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v30;

  [(MTLRenderPassDescriptor *)self->_pixelHistoryVisibilityMockRenderPassDescriptor setVisibilityResultBuffer:self->_visibilityResultBuffer];
  v32 = DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  [v32 setRenderPipelineState:v49];
  [v32 setTriangleFillMode:0];
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __209__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthStencilTexture_visibilityResultMode_atX_y___block_invoke;
  v52[3] = &unk_265338F78;
  v52[4] = self;
  [(DYMTLStatefulRenderCommandEncoder *)savedVertexFragmentState applyVertexFragmentStateToEncoder:v32 rawBytesBlock:v52];
  uint64_t v34 = [(DYMTLFunctionPlayer *)self->_player device];
  v35 = (void *)[v34 newDepthStencilStateWithDescriptor:v17];

  [v32 setDepthStencilState:v35];
  objc_msgSend(v32, "setStencilFrontReferenceValue:backReferenceValue:", -[DYMTLStatefulRenderCommandEncoder frontReferenceValue](self->_originalEncoder, "frontReferenceValue"), -[DYMTLStatefulRenderCommandEncoder backReferenceValue](self->_originalEncoder, "backReferenceValue"));
  objc_msgSend(v32, "setDepthClipMode:", -[DYMTLStatefulRenderCommandEncoder depthClipMode](self->_originalEncoder, "depthClipMode"));
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBias];
  int v37 = v36;
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBiasSlopeScale];
  int v39 = v38;
  [(DYMTLStatefulRenderCommandEncoder *)self->_originalEncoder depthBiasClamp];
  LODWORD(v41) = v40;
  LODWORD(v42) = v37;
  LODWORD(v43) = v39;
  [v32 setDepthBias:v42 slopeScale:v43 clamp:v41];
  [v32 setVisibilityResultMode:a8 offset:0];
  v50[0] = v45;
  v50[1] = v46;
  int64x2_t v51 = vdupq_n_s64(1uLL);
  [v32 setScissorRect:v50];
  [(DYMTLFunctionPlayer *)self->_player setObject:v32 forKey:self->_originalCommandEncoderId];

  return 1;
}

uint64_t __209__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthStencilTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
  return [v4 vertexBytesForKey:v5];
}

- (void)collectPixelHistoryStencilDrawStatsAtX:(unint64_t)a3 y:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(DYMTLFunctionPlayer *)self->_player objectForKey:self->_originalCommandEncoderId];
  [v9 endEncoding];

  [(DYMTLFunctionPlayer *)self->_player removeObjectForKey:self->_originalCommandEncoderId];
  id v10 = (void *)MEMORY[0x263F53638];
  stencilTexture = self->_stencilTexture;
  originalCommandBuffer = self->_originalCommandBuffer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryStencilDrawStatsAtX_y_completion___block_invoke;
  v15[3] = &unk_2653394A8;
  id v13 = v8;
  id v16 = v13;
  LOBYTE(v14) = 0;
  [v10 pixelValueFromTexture:stencilTexture level:0 slice:0 depthPlane:0 atX:a3 y:a4 inCommandBuffer:originalCommandBuffer overHarvestForDepthStencil:v14 completion:v15];
}

void __89__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryStencilDrawStatsAtX_y_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(unsigned __int8 *)[v5 bytes]);
}

- (void)collectPixelHistoryVisibilityDrawStatsAtCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DYMTLFunctionPlayer *)self->_player objectForKey:self->_originalCommandEncoderId];
  [v5 endEncoding];

  [(DYMTLFunctionPlayer *)self->_player removeObjectForKey:self->_originalCommandEncoderId];
  id v6 = self->_visibilityResultBuffer;
  originalCommandBuffer = self->_originalCommandBuffer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryVisibilityDrawStatsAtCompletion___block_invoke;
  v10[3] = &unk_2653394D0;
  id v8 = v4;
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  [(MTLCommandBuffer *)originalCommandBuffer addCompletedHandler:v10];
}

uint64_t __88__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryVisibilityDrawStatsAtCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)[*(id *)(a1 + 32) contents];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (MTLTexture)mockStencilTexture
{
  return self->_mockStencilTexture;
}

- (void)setMockStencilTexture:(id)a3
{
}

- (MTLTexture)mockDepthTexture
{
  return self->_mockDepthTexture;
}

- (void)setMockDepthTexture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockDepthTexture, 0);
  objc_storeStrong((id *)&self->_mockStencilTexture, 0);
  objc_storeStrong((id *)&self->_originalParallelEncoder, 0);
  objc_storeStrong((id *)&self->_originalEncoder, 0);
  objc_storeStrong((id *)&self->_originalCommandBuffer, 0);
  objc_storeStrong((id *)&self->_savedVertexFragmentState, 0);
  objc_storeStrong((id *)&self->_pixelHistorySolidRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_pixelHistoryVisibilityMockRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pixelHistoryMockRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pixelHistoryRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_visibilityResultBuffer, 0);
  objc_storeStrong((id *)&self->_mockColorTextures, 0);
  objc_storeStrong((id *)&self->_stencilTexture, 0);
  objc_storeStrong((id *)&self->_mockDepthTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_mockStencilTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_mockColorTextureDescriptors, 0);
  objc_storeStrong((id *)&self->_stencilTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_solidCreationFragmentFunction, 0);
  objc_storeStrong((id *)&self->_solidLibrary, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end