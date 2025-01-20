@interface SCNMTLRenderPipeline
- (BOOL)matchesRenderPassDescriptor:(id)a3;
- (MTLFunction)fragmentFunction;
- (MTLFunction)vertexFunction;
- (MTLRenderPipelineState)state;
- (MTLVertexDescriptor)vertexDescriptor;
- (NSArray)frameBufferBindings;
- (NSArray)lightBufferBindings;
- (NSArray)nodeBufferBindings;
- (NSArray)passBufferBindings;
- (NSArray)shadableBufferBindings;
- (SCNMTLRenderPipeline)init;
- (id)description;
- (unsigned)vertexBuffersUsageMask;
- (void)_computeUsageForArguments:(id)a3 function:(id)a4;
- (void)dealloc;
- (void)setFragmentFunction:(id)a3;
- (void)setFrameBufferBindings:(id)a3;
- (void)setLightBufferBindings:(id)a3;
- (void)setNodeBufferBindings:(id)a3;
- (void)setPassBufferBindings:(id)a3;
- (void)setShadableBufferBindings:(id)a3;
- (void)setState:(id)a3;
- (void)setVertexDescriptor:(id)a3;
- (void)setVertexFunction:(id)a3;
@end

@implementation SCNMTLRenderPipeline

- (void)_computeUsageForArguments:(id)a3 function:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v6 = SCNMTLFunctionTypeToProgramStage([a4 functionType]);
  if (v6 >= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderPipeline _computeUsageForArguments:function:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = (char *)self + 4 * v6;
  *((_DWORD *)v15 + 34) = 0;
  v16 = v15 + 136;
  *((_DWORD *)v16 - 4) = 0;
  *((_DWORD *)v16 - 2) = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(a3);
        }
        v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v21 isActive])
        {
          uint64_t v22 = [v21 type];
          v23 = v16 - 16;
          if (!v22) {
            goto LABEL_15;
          }
          if (v22 == 3)
          {
            v23 = v16;
LABEL_15:
            *(_DWORD *)v23 |= 1 << [v21 index];
            continue;
          }
          v23 = v16 - 8;
          if (v22 == 2) {
            goto LABEL_15;
          }
        }
      }
      uint64_t v18 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)setState:(id)a3
{
}

- (MTLFunction)vertexFunction
{
  return self->_vertexFunction;
}

- (MTLFunction)fragmentFunction
{
  return self->_fragmentFunction;
}

- (void)setVertexFunction:(id)a3
{
}

- (void)setVertexDescriptor:(id)a3
{
}

- (void)setShadableBufferBindings:(id)a3
{
}

- (void)setNodeBufferBindings:(id)a3
{
}

- (void)setFrameBufferBindings:(id)a3
{
}

- (void)setFragmentFunction:(id)a3
{
}

- (SCNMTLRenderPipeline)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLRenderPipeline;
  result = [(SCNMTLRenderPipeline *)&v3 init];
  if (result) {
    result->_sceneBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  }
  return result;
}

- (MTLRenderPipelineState)state
{
  return self->_state;
}

- (NSArray)passBufferBindings
{
  return self->_passBufferBindings;
}

- (NSArray)nodeBufferBindings
{
  return self->_nodeBufferBindings;
}

- (NSArray)frameBufferBindings
{
  return self->_frameBufferBindings;
}

- (NSArray)lightBufferBindings
{
  return self->_lightBufferBindings;
}

- (NSArray)shadableBufferBindings
{
  return self->_shadableBufferBindings;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLRenderPipeline;
  [(SCNMTLRenderPipeline *)&v3 dealloc];
}

- (id)description
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@: %p>", NSStringFromClass(v4), self];
  [v3 appendFormat:@"<state: %@>", self->_state];
  if (self->_frameBufferBindings)
  {
    [v3 appendString:@"\n\tFrameBuffer bindings:\n"];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    frameBufferBindings = self->_frameBufferBindings;
    uint64_t v6 = [(NSArray *)frameBufferBindings countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v53 != v8) {
            objc_enumerationMutation(frameBufferBindings);
          }
          uint64_t v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          [v3 appendString:@"\t\t"];
          objc_msgSend(v3, "appendString:", objc_msgSend(v10, "name"));
        }
        uint64_t v7 = [(NSArray *)frameBufferBindings countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v7);
    }
  }
  if (self->_nodeBufferBindings)
  {
    [v3 appendString:@"\n\tNode bindings:\n"];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    nodeBufferBindings = self->_nodeBufferBindings;
    uint64_t v12 = [(NSArray *)nodeBufferBindings countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(nodeBufferBindings);
          }
          v16 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          [v3 appendString:@"\t\t"];
          objc_msgSend(v3, "appendString:", objc_msgSend(v16, "name"));
        }
        uint64_t v13 = [(NSArray *)nodeBufferBindings countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v13);
    }
  }
  if (self->_passBufferBindings)
  {
    [v3 appendString:@"\n\tPass bindings:\n"];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    passBufferBindings = self->_passBufferBindings;
    uint64_t v18 = [(NSArray *)passBufferBindings countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(passBufferBindings);
          }
          uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8 * k);
          [v3 appendString:@"\t\t"];
          objc_msgSend(v3, "appendString:", objc_msgSend(v22, "name"));
        }
        uint64_t v19 = [(NSArray *)passBufferBindings countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v19);
    }
  }
  if (self->_shadableBufferBindings)
  {
    [v3 appendString:@"\n\tShadable bindings:\n"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    shadableBufferBindings = self->_shadableBufferBindings;
    uint64_t v24 = [(NSArray *)shadableBufferBindings countByEnumeratingWithState:&v40 objects:v57 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t m = 0; m != v25; ++m)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(shadableBufferBindings);
          }
          v28 = *(void **)(*((void *)&v40 + 1) + 8 * m);
          [v3 appendString:@"\t\t"];
          objc_msgSend(v3, "appendString:", objc_msgSend(v28, "name"));
        }
        uint64_t v25 = [(NSArray *)shadableBufferBindings countByEnumeratingWithState:&v40 objects:v57 count:16];
      }
      while (v25);
    }
  }
  if (self->_lightBufferBindings)
  {
    [v3 appendString:@"\n\tLight bindings:\n"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    lightBufferBindings = self->_lightBufferBindings;
    uint64_t v30 = [(NSArray *)lightBufferBindings countByEnumeratingWithState:&v36 objects:v56 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t n = 0; n != v31; ++n)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(lightBufferBindings);
          }
          v34 = *(void **)(*((void *)&v36 + 1) + 8 * n);
          [v3 appendString:@"\t\t"];
          objc_msgSend(v3, "appendString:", objc_msgSend(v34, "name"));
        }
        uint64_t v31 = [(NSArray *)lightBufferBindings countByEnumeratingWithState:&v36 objects:v56 count:16];
      }
      while (v31);
    }
  }
  return v3;
}

- (BOOL)matchesRenderPassDescriptor:(id)a3
{
  uint64_t v5 = 0;
  p_renderPassDesc = &self->_renderPassDesc;
  while (1)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", v5), "texture");
    unint64_t v8 = p_renderPassDesc->colorFormat[v5];
    if (v8 != [v7 pixelFormat]) {
      break;
    }
    if (v7)
    {
      uint64_t sampleCount = self->_renderPassDesc.sampleCount;
      if ([v7 sampleCount] != sampleCount) {
        break;
      }
    }
    if (++v5 == 8)
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "depthAttachment"), "texture");
      unint64_t depthFormat = self->_renderPassDesc.depthFormat;
      if (depthFormat == [v10 pixelFormat])
      {
        if (!v10 || (uint64_t v12 = self->_renderPassDesc.sampleCount, [v10 sampleCount] == v12))
        {
          uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "stencilAttachment"), "texture");
          unint64_t stencilFormat = self->_renderPassDesc.stencilFormat;
          if (stencilFormat == [v13 pixelFormat])
          {
            if (!v13) {
              return 1;
            }
            uint64_t v15 = self->_renderPassDesc.sampleCount;
            if ([v13 sampleCount] == v15) {
              return 1;
            }
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

- (unsigned)vertexBuffersUsageMask
{
  return self->_buffersUsageMask[0];
}

- (MTLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (void)setLightBufferBindings:(id)a3
{
}

- (void)setPassBufferBindings:(id)a3
{
}

- (void)_computeUsageForArguments:(uint64_t)a3 function:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end