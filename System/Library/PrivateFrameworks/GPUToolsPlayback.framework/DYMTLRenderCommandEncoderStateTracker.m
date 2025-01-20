@interface DYMTLRenderCommandEncoderStateTracker
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (DYMTLRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4;
- (DYMTLRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4;
- (float)depthBias;
- (float)depthBiasClamp;
- (float)depthBiasSlopeScale;
- (id).cxx_construct;
- (id)depthStencilState;
- (id)descriptor;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)renderPipelineState;
- (unint64_t)depthClipMode;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)backReferenceValue;
- (unsigned)frontReferenceValue;
- (vector<MTLViewport,)viewports;
- (void)_applyFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)_applyHeapsAndResourcesToEncoder:(id)a3;
- (void)_applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4;
- (void)applyAllStateToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)applyVertexFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)enumerateFragmentBuffersUsingBlock:(id)a3;
- (void)enumerateFragmentSamplersUsingBlock:(id)a3;
- (void)enumerateFragmentTexturesUsingBlock:(id)a3;
- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3;
- (void)enumerateTileBuffersUsingBlock:(id)a3;
- (void)enumerateTileSamplersUsingBlock:(id)a3;
- (void)enumerateTileTexturesUsingBlock:(id)a3;
- (void)enumerateVertexBuffersUsingBlock:(id)a3;
- (void)enumerateVertexSamplersUsingBlock:(id)a3;
- (void)enumerateVertexTexturesUsingBlock:(id)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLineWidth:(float)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
@end

@implementation DYMTLRenderCommandEncoderStateTracker

- (DYMTLRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    v9 = [(DYMTLRenderCommandEncoderStateTracker *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_renderEncoder, a3);
      v11 = [v7 device];
      [(DYMTLRenderCommandEncoderStateTracker *)v10 _setDefaultsWithDescriptor:v8 device:v11];

      DYMTLSetAssociatedObject(v10, 0, v8);
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DYMTLRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    id v8 = [(DYMTLRenderCommandEncoderStateTracker *)&v12 init];
    v9 = v8;
    if (v8)
    {
      [(DYMTLRenderCommandEncoderStateTracker *)v8 _setDefaultsWithDescriptor:v7 device:v6];
      DYMTLSetAssociatedObject(v9, 0, v7);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if ([(MTLRenderCommandEncoderSPI *)self->_renderEncoder conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    BOOL v5 = [(DYMTLRenderCommandEncoderStateTracker *)&v7 conformsToProtocol:v4];
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_renderEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
  if (-[DYMTLRenderCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_width = (uint64x2_t *)&self->_width;
  [v6 validate:v7 width:&self->_width height:&self->_height];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v6 rasterizationRateMap];
    if (!v9)
    {
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v10 = [v6 renderTargetWidth];
    uint64_t v11 = [v6 renderTargetHeight];
    unint64_t v12 = v11;
    if (v10)
    {
      if (!v11) {
        goto LABEL_7;
      }
    }
    else
    {
      [v9 screenSize];
      uint64_t v10 = *(void *)&v14[0];
      if (!v12)
      {
LABEL_7:
        [v9 screenSize];
        unint64_t v12 = *((void *)&v14[0] + 1);
      }
    }
    p_width->i64[0] = v10;
    self->_height = v12;
    goto LABEL_9;
  }
LABEL_10:
  v14[0] = 0uLL;
  v14[1] = (__int128)vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(*p_width)));
  v14[2] = xmmword_24F732160;
  std::vector<MTLViewport>::assign((char **)&self->_viewports, 1uLL, v14);
  self->_frontFacingWinding = 0;
  self->_cullMode = 0;
  self->_depthClipMode = 0;
  self->_lineWidth = 1.0;
  *(void *)&self->_depthBias = 0;
  self->_depthBiasClamp = 0.0;
  v13[0] = 0uLL;
  v13[1] = *p_width;
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects, 1uLL, v13);
  self->_triangleFillMode = 0;
  self->_visibilityResultMode = 0;
  *(_OWORD *)&self->_amplificationMode = xmmword_24F732170;
  self->_amplificationModeSet = 0;
  self->_frontStencilRef = 0;
  self->_backStencilRef = 0;
  *(void *)&self->_blendColorRed = 0;
  *(void *)&self->_blendColorBlue = 0;
  self->_visibilityResultOffset = 0;
  self->_tessellationFactorBufferOffset = 0;
  self->_tessellationFactorBufferInstanceStride = 0;
  self->_tessellationFactorBuffer = 0;
  self->_tessellationFactorScale = 1.0;
  self->_tessellationFactorSet = 0;
}

- (void)setRenderPipelineState:(id)a3
{
  id v4 = (MTLRenderPipelineState *)a3;
  objc_super v5 = v4;
  id v7 = v4;
  if (self->_amplificationCountSet)
  {
    id v6 = DYMTLGetAssociatedObject(v4, 0);
    if ([v6 maxVertexAmplificationCount] < self->_amplificationCount) {
      self->_amplificationCountSet = 0;
    }

    objc_super v5 = v7;
  }
  self->_renderPipelineState = v5;
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setRenderPipelineState:v5];
}

- (id)renderPipelineState
{
  return self->_renderPipelineState;
}

- (id)descriptor
{
  return DYMTLGetAssociatedObject(self, 0);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_vertexBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setVertexBytes:a3 length:a4 atIndex:a5];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  uint64_t v10 = 0;
  unint64_t v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_vertexBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setVertexBuffer:v8 offset:a4 atIndex:a5];
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_vertexBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setVertexBufferOffset:atIndex:](self->_renderEncoder, "setVertexBufferOffset:atIndex:");
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length)
  {
    uint64_t v10 = &self->_vertexBuffers[a5.location];
    unint64_t v11 = a3;
    unint64_t v12 = a4;
    NSUInteger v13 = a5.length;
    do
    {
      uint64_t v14 = *v12++;
      id v15 = (id)*v11;
      v16 = 0;
      uint64_t v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:withRange:](self->_renderEncoder, "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_vertexTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setVertexTexture:atIndex:](self->_renderEncoder, "setVertexTexture:atIndex:");
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    id v4 = &self->_vertexTextures[a4.location];
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      id v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setVertexTextures:a3 withRange:a4.location];
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = (char *)self + 16 * a4;
  *((void *)v4 + 250) = a3;
  *((void *)v4 + 251) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:atIndex:](self->_renderEncoder, "setVertexSamplerState:atIndex:");
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    p_minLOD = &self->_vertexSamplers[a4.location].minLOD;
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (uint64_t)*v5++;
      *((void *)p_minLOD - 1) = v7;
      *(void *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setVertexSamplerStates:a3 withRange:a4.location];
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v6 = (char *)self + 16 * a6;
  *((void *)v6 + 250) = a3;
  *((float *)v6 + 502) = a4;
  *((float *)v6 + 503) = a5;
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    p_maxLOD = &self->_vertexSamplers[a6.location].maxLOD;
    uint64_t v7 = a3;
    id v8 = a4;
    id v9 = a5;
    NSUInteger length = a6.length;
    do
    {
      uint64_t v12 = (uint64_t)*v7++;
      uint64_t v11 = v12;
      *(float *)&uint64_t v12 = *v8++;
      int v13 = v12;
      *(float *)&uint64_t v12 = *v9++;
      *(void *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setVertexSamplerStates:a3 lodMinClamps:a4 lodMaxClamps:a5 withRange:a6.location];
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_fragmentBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setFragmentBytes:a3 length:a4 atIndex:a5];
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  uint64_t v10 = 0;
  unint64_t v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_fragmentBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setFragmentBuffer:v8 offset:a4 atIndex:a5];
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_fragmentBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setFragmentBufferOffset:atIndex:](self->_renderEncoder, "setFragmentBufferOffset:atIndex:");
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length)
  {
    uint64_t v10 = &self->_fragmentBuffers[a5.location];
    unint64_t v11 = a3;
    uint64_t v12 = a4;
    NSUInteger v13 = a5.length;
    do
    {
      uint64_t v14 = *v12++;
      id v15 = (id)*v11;
      v16 = 0;
      uint64_t v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setFragmentBuffers:offsets:withRange:](self->_renderEncoder, "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_fragmentTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atIndex:](self->_renderEncoder, "setFragmentTexture:atIndex:");
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    id v4 = &self->_fragmentTextures[a4.location];
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setFragmentTextures:a3 withRange:a4.location];
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = (char *)self + 16 * a4;
  *((void *)v4 + 503) = a3;
  *((void *)v4 + 504) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:atIndex:](self->_renderEncoder, "setFragmentSamplerState:atIndex:");
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    p_minLOD = &self->_fragmentSamplers[a4.location].minLOD;
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (uint64_t)*v5++;
      *((void *)p_minLOD - 1) = v7;
      *(void *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setFragmentSamplerStates:a3 withRange:a4.location];
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v6 = (char *)self + 16 * a6;
  *((void *)v6 + 503) = a3;
  *((float *)v6 + 1008) = a4;
  *((float *)v6 + 1009) = a5;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    p_maxLOD = &self->_fragmentSamplers[a6.location].maxLOD;
    uint64_t v7 = a3;
    id v8 = a4;
    id v9 = a5;
    NSUInteger length = a6.length;
    do
    {
      uint64_t v12 = (uint64_t)*v7++;
      uint64_t v11 = v12;
      *(float *)&uint64_t v12 = *v8++;
      int v13 = v12;
      *(float *)&uint64_t v12 = *v9++;
      *(void *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setFragmentSamplerStates:a3 lodMinClamps:a4 lodMaxClamps:a5 withRange:a6.location];
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  self->_fragmentTextures[a4] = (MTLTexture *)a3;
  id v6 = (char *)self + 16 * a6;
  *((void *)v6 + 503) = a5;
  *((void *)v6 + 504) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:](self->_renderEncoder, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:");
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_tileBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setTileBytes:a3 length:a4 atIndex:a5];
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  uint64_t v10 = 0;
  unint64_t v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_tileBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setTileBuffer:v8 offset:a4 atIndex:a5];
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_tileBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setTileBufferOffset:atIndex:](self->_renderEncoder, "setTileBufferOffset:atIndex:");
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length)
  {
    uint64_t v10 = &self->_tileBuffers[a5.location];
    unint64_t v11 = a3;
    uint64_t v12 = a4;
    NSUInteger v13 = a5.length;
    do
    {
      uint64_t v14 = *v12++;
      id v15 = (id)*v11;
      v16 = 0;
      uint64_t v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setTileBuffers:offsets:withRange:](self->_renderEncoder, "setTileBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_tileTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setTileTexture:atIndex:](self->_renderEncoder, "setTileTexture:atIndex:");
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    id v4 = &self->_tileTextures[a4.location];
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setTileTextures:a3 withRange:a4.location];
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = (char *)self + 16 * a4;
  *((void *)v4 + 756) = a3;
  *((void *)v4 + 757) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setTileSamplerState:atIndex:](self->_renderEncoder, "setTileSamplerState:atIndex:");
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    p_minLOD = &self->_tileSamplers[a4.location].minLOD;
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (uint64_t)*v5++;
      *((void *)p_minLOD - 1) = v7;
      *(void *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setTileSamplerStates:a3 withRange:a4.location];
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v6 = (char *)self + 16 * a6;
  *((void *)v6 + 756) = a3;
  *((float *)v6 + 1514) = a4;
  *((float *)v6 + 1515) = a5;
  -[MTLRenderCommandEncoderSPI setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    p_maxLOD = &self->_tileSamplers[a6.location].maxLOD;
    uint64_t v7 = a3;
    id v8 = a4;
    id v9 = a5;
    NSUInteger length = a6.length;
    do
    {
      uint64_t v12 = (uint64_t)*v7++;
      uint64_t v11 = v12;
      *(float *)&uint64_t v12 = *v8++;
      int v13 = v12;
      *(float *)&uint64_t v12 = *v9++;
      *(void *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setTileSamplerStates:a3 lodMinClamps:a4 lodMaxClamps:a5 withRange:a6.location];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_super v5 = (char *)self + 16 * a5;
  *((void *)v5 + 788) = a3;
  *((void *)v5 + 789) = a4;
  -[MTLRenderCommandEncoderSPI setThreadgroupMemoryLength:offset:atIndex:](self->_renderEncoder, "setThreadgroupMemoryLength:offset:atIndex:");
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6 = a3;
  value = self->_usedResources.__end_cap_.__value_;
  end = self->_usedResources.__end_;
  id v21 = v6;
  if (end >= value)
  {
    begin = self->_usedResources.__begin_;
    uint64_t v11 = (end - begin) >> 4;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = value - begin;
    if (v13 >> 3 > v12) {
      unint64_t v12 = v13 >> 3;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    id v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v14);
    v16 = &v15[16 * v11];
    v18 = (DYMTLUsedResourceInfo *)&v15[16 * v17];
    *(void *)v16 = v21;
    *((void *)v16 + 1) = a4;
    id v9 = (DYMTLUsedResourceInfo *)(v16 + 16);
    v20 = self->_usedResources.__begin_;
    v19 = self->_usedResources.__end_;
    if (v19 != v20)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v19 - 1);
        v16 -= 16;
        v19 = (DYMTLUsedResourceInfo *)((char *)v19 - 16);
      }
      while (v19 != v20);
      v19 = self->_usedResources.__begin_;
    }
    self->_usedResources.__begin_ = (DYMTLUsedResourceInfo *)v16;
    self->_usedResources.__end_ = v9;
    self->_usedResources.__end_cap_.__value_ = v18;
    if (v19) {
      operator delete(v19);
    }
    id v6 = v21;
  }
  else
  {
    *(void *)end = v6;
    *((void *)end + 1) = a4;
    id v9 = (DYMTLUsedResourceInfo *)((char *)end + 16);
  }
  self->_usedResources.__end_ = v9;
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder useResource:v6 usage:a4];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (a4)
  {
    uint64_t v9 = 0;
    p_usedResources = &self->_usedResources;
    p_end_cap = &self->_usedResources.__end_cap_;
    end = self->_usedResources.__end_;
    do
    {
      if (end >= p_end_cap->__value_)
      {
        uint64_t v13 = (end - p_usedResources->__begin_) >> 4;
        if ((unint64_t)(v13 + 1) >> 60) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = p_end_cap->__value_ - p_usedResources->__begin_;
        uint64_t v15 = v14 >> 3;
        if (v14 >> 3 <= (unint64_t)(v13 + 1)) {
          uint64_t v15 = v13 + 1;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v15;
        }
        uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v16);
        v19 = &v17[16 * v13];
        *(void *)v19 = a3[v9];
        *((void *)v19 + 1) = a5;
        begin = self->_usedResources.__begin_;
        v20 = self->_usedResources.__end_;
        v22 = (DYMTLUsedResourceInfo *)v19;
        if (v20 != begin)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 = (DYMTLUsedResourceInfo *)((char *)v22 - 16);
            v20 = (DYMTLUsedResourceInfo *)((char *)v20 - 16);
          }
          while (v20 != begin);
          v20 = p_usedResources->__begin_;
        }
        end = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__begin_ = v22;
        self->_usedResources.__end_ = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__end_cap_.__value_ = (DYMTLUsedResourceInfo *)&v17[16 * v18];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(void *)end = a3[v9];
        *((void *)end + 1) = a5;
        end = (DYMTLUsedResourceInfo *)((char *)end + 16);
      }
      self->_usedResources.__end_ = end;
      ++v9;
    }
    while (v9 != a4);
  }
  renderEncoder = self->_renderEncoder;
  [(MTLRenderCommandEncoderSPI *)renderEncoder useResources:a3 count:a4 usage:a5];
}

- (void)useHeap:(id)a3
{
  id v4 = (__end_ *)a3;
  value = self->_usedHeaps.var1.__value_;
  var0 = self->_usedHeaps.var0;
  v19 = v4;
  if (var0 >= (__end_cap_ **)value)
  {
    begin = self->_usedHeaps.__begin_;
    uint64_t v9 = var0 - begin;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = (char *)value - (char *)begin;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_usedHeaps.var1, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = (__end_ **)&v13[8 * v9];
    uint64_t v15 = (id *)&v13[8 * v12];
    *uint64_t v14 = v19;
    uint64_t v7 = v14 + 1;
    uint64_t v17 = self->_usedHeaps.__begin_;
    unint64_t v16 = self->_usedHeaps.var0;
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *--v16;
        *--uint64_t v14 = v18;
      }
      while (v16 != v17);
      unint64_t v16 = self->_usedHeaps.__begin_;
    }
    self->_usedHeaps.__begin_ = v14;
    self->_usedHeaps.var0 = v7;
    self->_usedHeaps.var1.__value_ = v15;
    if (v16) {
      operator delete(v16);
    }
    id v4 = v19;
  }
  else
  {
    *var0 = v4;
    uint64_t v7 = var0 + 1;
  }
  self->_usedHeaps.var0 = v7;
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder useHeap:v4];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v7 = 0;
    p_usedHeaps = &self->_usedHeaps;
    p_var1 = &self->_usedHeaps.var1;
    var0 = self->_usedHeaps.var0;
    do
    {
      if ((id *)var0 >= p_var1->__value_)
      {
        uint64_t v11 = var0 - p_usedHeaps->__begin_;
        if ((unint64_t)(v11 + 1) >> 61) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = (char *)p_var1->__value_ - (char *)p_usedHeaps->__begin_;
        uint64_t v13 = v12 >> 2;
        if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
          uint64_t v13 = v11 + 1;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_usedHeaps.var1, v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (__end_ **)&v15[8 * v11];
        char *v16 = (__end_ *)a3[v7];
        var0 = v16 + 1;
        begin = self->_usedHeaps.__begin_;
        uint64_t v17 = self->_usedHeaps.var0;
        if (v17 != begin)
        {
          do
          {
            v19 = *--v17;
            *--unint64_t v16 = v19;
          }
          while (v17 != begin);
          uint64_t v17 = p_usedHeaps->__begin_;
        }
        self->_usedHeaps.__begin_ = v16;
        self->_usedHeaps.var0 = var0;
        self->_usedHeaps.var1.__value_ = (id *)&v15[8 * v14];
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *var0++ = (__end_cap_ *)a3[v7];
      }
      self->_usedHeaps.var0 = var0;
      ++v7;
    }
    while (v7 != a4);
  }
  renderEncoder = self->_renderEncoder;
  [(MTLRenderCommandEncoderSPI *)renderEncoder useHeaps:a3 count:a4];
}

- (void)setViewport:(id *)a3
{
  std::vector<MTLViewport>::assign((char **)&self->_viewports, 1uLL, (long long *)a3);
  renderEncoder = self->_renderEncoder;
  long long v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var4;
  [(MTLRenderCommandEncoderSPI *)renderEncoder setViewport:v7];
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  p_viewports = (char *)&self->_viewports;
  if (a3 && a4)
  {
    std::vector<MTLViewport>::__assign_with_size[abi:ne180100]<MTLViewport const*,MTLViewport const*>(p_viewports, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v9 = 0;
    uint64_t v10 = 0x3FF0000000000000;
    std::vector<MTLViewport>::assign((char **)p_viewports, 1uLL, v8);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setViewports:a3 count:a4];
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  self->_frontFacingWinding = a3;
  -[MTLRenderCommandEncoderSPI setFrontFacingWinding:](self->_renderEncoder, "setFrontFacingWinding:");
}

- (void)setCullMode:(unint64_t)a3
{
  self->_cullMode = a3;
  -[MTLRenderCommandEncoderSPI setCullMode:](self->_renderEncoder, "setCullMode:");
}

- (void)setDepthClipMode:(unint64_t)a3
{
  self->_depthClipMode = a3;
  -[MTLRenderCommandEncoderSPI setDepthClipModeSPI:](self->_renderEncoder, "setDepthClipModeSPI:");
}

- (unint64_t)depthClipMode
{
  return self->_depthClipMode;
}

- (void)setLineWidth:(float)a3
{
  self->_lineWidth = a3;
  -[MTLRenderCommandEncoderSPI setLineWidth:](self->_renderEncoder, "setLineWidth:");
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  self->_depthBias = a3;
  self->_depthBiasSlopeScale = a4;
  self->_depthBiasClamp = a5;
  -[MTLRenderCommandEncoderSPI setDepthBias:slopeScale:clamp:](self->_renderEncoder, "setDepthBias:slopeScale:clamp:");
}

- (float)depthBias
{
  return self->_depthBias;
}

- (float)depthBiasSlopeScale
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBiasClamp
{
  return self->_depthBiasClamp;
}

- (void)setScissorRect:(id *)a3
{
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects, 1uLL, a3);
  renderEncoder = self->_renderEncoder;
  long long v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  [(MTLRenderCommandEncoderSPI *)renderEncoder setScissorRect:v7];
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  p_scissorRects = (char *)&self->_scissorRects;
  if (a3 && a4)
  {
    std::vector<MTLScissorRect>::__assign_with_size[abi:ne180100]<MTLScissorRect const*,MTLScissorRect const*>(p_scissorRects, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    std::vector<MTLScissorRect>::assign((char **)p_scissorRects, 1uLL, v8);
  }
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setScissorRects:a3 count:a4];
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  self->_amplificationMode = a3;
  self->_amplificationValue = a4;
  self->_amplificationModeSet = 1;
  -[MTLRenderCommandEncoderSPI setVertexAmplificationMode:value:](self->_renderEncoder, "setVertexAmplificationMode:value:");
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  self->_triangleFillMode = a3;
  -[MTLRenderCommandEncoderSPI setTriangleFillMode:](self->_renderEncoder, "setTriangleFillMode:");
}

- (void)setDepthStencilState:(id)a3
{
  self->_depthStencilState = (MTLDepthStencilState *)a3;
  -[MTLRenderCommandEncoderSPI setDepthStencilState:](self->_renderEncoder, "setDepthStencilState:");
}

- (id)depthStencilState
{
  return self->_depthStencilState;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  self->_frontStencilRef = a3;
  self->_backStencilRef = a3;
  -[MTLRenderCommandEncoderSPI setStencilReferenceValue:](self->_renderEncoder, "setStencilReferenceValue:");
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  self->_frontStencilRef = a3;
  self->_backStencilRef = a4;
  -[MTLRenderCommandEncoderSPI setStencilFrontReferenceValue:backReferenceValue:](self->_renderEncoder, "setStencilFrontReferenceValue:backReferenceValue:");
}

- (unsigned)frontReferenceValue
{
  return self->_frontStencilRef;
}

- (unsigned)backReferenceValue
{
  return self->_backStencilRef;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v6 = a4;
  uint64_t v7 = &v6;
  std::__hash_table<std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,DYMTLStoreInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t)&self->_colorStoreInfos, &v6, (uint64_t)&std::piecewise_construct, &v7)[3] = a3;
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setColorStoreAction:a3 atIndex:v6];
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  self->_depthStoreInfo.action = a3;
  -[MTLRenderCommandEncoderSPI setDepthStoreAction:](self->_renderEncoder, "setDepthStoreAction:");
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  self->_stencilStoreInfo.action = a3;
  -[MTLRenderCommandEncoderSPI setStencilStoreAction:](self->_renderEncoder, "setStencilStoreAction:");
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v6 = a4;
  uint64_t v7 = &v6;
  std::__hash_table<std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,DYMTLStoreInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t)&self->_colorStoreInfos, &v6, (uint64_t)&std::piecewise_construct, &v7)[4] = a3;
  [(MTLRenderCommandEncoderSPI *)self->_renderEncoder setColorStoreActionOptions:a3 atIndex:v6];
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  self->_depthStoreInfo.options = a3;
  -[MTLRenderCommandEncoderSPI setDepthStoreActionOptions:](self->_renderEncoder, "setDepthStoreActionOptions:");
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  self->_stencilStoreInfo.options = a3;
  -[MTLRenderCommandEncoderSPI setStencilStoreActionOptions:](self->_renderEncoder, "setStencilStoreActionOptions:");
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  self->_visibilityResultMode = a3;
  self->_visibilityResultOffset = a4;
  -[MTLRenderCommandEncoderSPI setVisibilityResultMode:offset:](self->_renderEncoder, "setVisibilityResultMode:offset:");
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  self->_blendColorRed = a3;
  self->_blendColorGreen = a4;
  self->_blendColorBlue = a5;
  self->_blendColorAlpha = a6;
  -[MTLRenderCommandEncoderSPI setBlendColorRed:green:blue:alpha:](self->_renderEncoder, "setBlendColorRed:green:blue:alpha:");
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  self->_tessellationFactorSet = 1;
  self->_tessellationFactorBuffer = (MTLBuffer *)a3;
  self->_tessellationFactorBufferOffset = a4;
  self->_tessellationFactorBufferInstanceStride = a5;
  -[MTLRenderCommandEncoderSPI setTessellationFactorBuffer:offset:instanceStride:](self->_renderEncoder, "setTessellationFactorBuffer:offset:instanceStride:");
}

- (void)setTessellationFactorScale:(float)a3
{
  self->_tessellationFactorSet = 1;
  self->_tessellationFactorScale = a3;
  -[MTLRenderCommandEncoderSPI setTessellationFactorScale:](self->_renderEncoder, "setTessellationFactorScale:");
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  self->_amplificationCountSet = 1;
  self->_amplificationCount = a3;
  begin = self->_amplificationViewMappings.__begin_;
  self->_amplificationViewMappings.__end_ = begin;
  if (a4 && a3)
  {
    uint64_t v8 = 0;
    p_amplificationViewMappings = &self->_amplificationViewMappings;
    p_end_cap = &self->_amplificationViewMappings.__end_cap_;
    do
    {
      if (begin >= p_end_cap->__value_)
      {
        uint64_t v11 = (begin - p_amplificationViewMappings->__begin_) >> 3;
        if ((unint64_t)(v11 + 1) >> 61) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = p_end_cap->__value_ - p_amplificationViewMappings->__begin_;
        uint64_t v13 = v12 >> 2;
        if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
          uint64_t v13 = v11 + 1;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_amplificationViewMappings.__end_cap_, v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[8 * v11];
        *($85CD2974BE96D4886BB301820D1C36C2 *)unint64_t v16 = a4[v8];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 + 8);
        end = self->_amplificationViewMappings.__end_;
        uint64_t v18 = self->_amplificationViewMappings.__begin_;
        if (end != v18)
        {
          do
          {
            uint64_t v19 = *((void *)end - 1);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 8);
            *((void *)v16 - 1) = v19;
            unint64_t v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 - 8);
          }
          while (end != v18);
          end = p_amplificationViewMappings->__begin_;
        }
        self->_amplificationViewMappings.__begin_ = v16;
        self->_amplificationViewMappings.__end_ = begin;
        self->_amplificationViewMappings.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[8 * v14];
        if (end) {
          operator delete(end);
        }
      }
      else
      {
        *($85CD2974BE96D4886BB301820D1C36C2 *)begin = a4[v8];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      }
      self->_amplificationViewMappings.__end_ = begin;
      ++v8;
    }
    while (v8 != a3);
  }
  renderEncoder = self->_renderEncoder;
  [(MTLRenderCommandEncoderSPI *)renderEncoder setVertexAmplificationCount:a3 viewMappings:a4];
}

- (void)_applyHeapsAndResourcesToEncoder:(id)a3
{
  id v9 = a3;
  begin = self->_usedHeaps.__begin_;
  var0 = self->_usedHeaps.var0;
  while (begin != var0)
  {
    unint64_t v6 = *begin;
    [v9 useHeap:v6];

    ++begin;
  }
  uint64_t v8 = self->_usedResources.__begin_;
  end = self->_usedResources.__end_;
  while (v8 != end)
  {
    [v9 useResource:*(void *)v8 usage:*((void *)v8 + 1)];
    uint64_t v8 = (DYMTLUsedResourceInfo *)((char *)v8 + 16);
  }
}

- (void)_applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v6, "setViewports:count:");
  objc_msgSend(v6, "setScissorRects:count:");
  [v6 setFrontFacingWinding:self->_frontFacingWinding];
  [v6 setCullMode:self->_cullMode];
  if (self->_amplificationModeSet) {
    [v6 setVertexAmplificationMode:self->_amplificationMode value:self->_amplificationValue];
  }
  if (self->_amplificationCountSet)
  {
    if (self->_amplificationViewMappings.__begin_ == self->_amplificationViewMappings.__end_) {
      begin = 0;
    }
    else {
      begin = self->_amplificationViewMappings.__begin_;
    }
    [v6 setVertexAmplificationCount:self->_amplificationCount viewMappings:begin];
  }
  if (self->_tessellationFactorSet)
  {
    *(float *)&double v8 = self->_tessellationFactorScale;
    [v6 setTessellationFactorScale:v8];
    [v6 setTessellationFactorBuffer:self->_tessellationFactorBuffer offset:self->_tessellationFactorBufferOffset instanceStride:self->_tessellationFactorBufferInstanceStride];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke;
  v18[3] = &unk_265339458;
  id v10 = v7;
  id v20 = v10;
  id v11 = v6;
  id v19 = v11;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateVertexBuffersUsingBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_2;
  v16[3] = &unk_2653390D0;
  id v12 = v11;
  id v17 = v12;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateVertexTexturesUsingBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_3;
  long long v14[3] = &unk_265339480;
  id v13 = v12;
  id v15 = v13;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateVertexSamplersUsingBlock:v14];
}

void __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2 || !*(void *)(a2 + 8))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)a2;
    if (*(void *)a2 && !*(void *)(a2 + 8)) {
      uint64_t v8 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    id v12 = v7;
    [v6 setVertexBuffer:v7 offset:v8 atIndex:a3];
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v10 = *(void **)(a1 + 32);
    if (*(void *)a2 || !*(void *)(a2 + 8)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(a2 + 16);
    }
    [v10 setVertexBytes:v9 length:v11 atIndex:a3];
  }
}

uint64_t __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setVertexTexture:a2 atIndex:a3];
}

uint64_t __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return [*(id *)(a1 + 32) setVertexSamplerState:*(void *)a2 lodMinClamp:a3 lodMaxClamp:a4 atIndex:a5];
}

- (void)_applyFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke;
  v16[3] = &unk_265339458;
  id v8 = v7;
  id v18 = v8;
  id v9 = v6;
  id v17 = v9;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateFragmentBuffersUsingBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_2;
  long long v14[3] = &unk_2653390D0;
  id v10 = v9;
  id v15 = v10;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateFragmentTexturesUsingBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_3;
  v12[3] = &unk_265339480;
  id v11 = v10;
  id v13 = v11;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateFragmentSamplersUsingBlock:v12];
}

void __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2 || !*(void *)(a2 + 8))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)a2;
    if (*(void *)a2 && !*(void *)(a2 + 8)) {
      uint64_t v8 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    id v12 = v7;
    [v6 setFragmentBuffer:v7 offset:v8 atIndex:a3];
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v10 = *(void **)(a1 + 32);
    if (*(void *)a2 || !*(void *)(a2 + 8)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(a2 + 16);
    }
    [v10 setFragmentBytes:v9 length:v11 atIndex:a3];
  }
}

uint64_t __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setFragmentTexture:a2 atIndex:a3];
}

uint64_t __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return [*(id *)(a1 + 32) setFragmentSamplerState:*(void *)a2 lodMinClamp:a3 lodMaxClamp:a4 atIndex:a5];
}

- (void)applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyHeapsAndResourcesToEncoder:v7];
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyVertexStateToEncoder:v7 rawBytesBlock:v6];
}

- (void)applyVertexFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyHeapsAndResourcesToEncoder:v7];
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyVertexStateToEncoder:v7 rawBytesBlock:v6];
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyFragmentStateToEncoder:v7 rawBytesBlock:v6];
}

- (void)applyAllStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_renderPipelineState) {
    objc_msgSend(v6, "setRenderPipelineState:");
  }
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyHeapsAndResourcesToEncoder:v6];
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyVertexStateToEncoder:v6 rawBytesBlock:v7];
  [(DYMTLRenderCommandEncoderStateTracker *)self _applyFragmentStateToEncoder:v6 rawBytesBlock:v7];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke;
  v26[3] = &unk_265339458;
  id v8 = v7;
  id v28 = v8;
  id v9 = v6;
  id v27 = v9;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateTileBuffersUsingBlock:v26];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_2;
  v24[3] = &unk_2653390D0;
  id v10 = v9;
  id v25 = v10;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateTileTexturesUsingBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_3;
  v22[3] = &unk_265339480;
  id v11 = v10;
  id v23 = v11;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateTileSamplersUsingBlock:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_4;
  v20[3] = &unk_2653394F8;
  id v12 = v11;
  id v21 = v12;
  [(DYMTLRenderCommandEncoderStateTracker *)self enumerateThreadgroupMemoryUsingBlock:v20];
  if (self->_depthStencilState) {
    objc_msgSend(v12, "setDepthStencilState:");
  }
  *(float *)&double v13 = self->_blendColorRed;
  *(float *)&double v14 = self->_blendColorGreen;
  *(float *)&double v15 = self->_blendColorBlue;
  *(float *)&double v16 = self->_blendColorAlpha;
  [v12 setBlendColorRed:v13 green:v14 blue:v15 alpha:v16];
  [v12 setDepthClipMode:self->_depthClipMode];
  *(float *)&double v17 = self->_depthBias;
  *(float *)&double v18 = self->_depthBiasSlopeScale;
  *(float *)&double v19 = self->_depthBiasClamp;
  [v12 setDepthBias:v17 slopeScale:v18 clamp:v19];
  [v12 setStencilFrontReferenceValue:self->_frontStencilRef backReferenceValue:self->_backStencilRef];
  [v12 setTriangleFillMode:self->_triangleFillMode];
  [v12 setVisibilityResultMode:self->_visibilityResultMode offset:self->_visibilityResultOffset];
}

void __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2 || !*(void *)(a2 + 8))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)a2;
    if (*(void *)a2 && !*(void *)(a2 + 8)) {
      uint64_t v8 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    id v12 = v7;
    [v6 setTileBuffer:v7 offset:v8 atIndex:a3];
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v10 = *(void **)(a1 + 32);
    if (*(void *)a2 || !*(void *)(a2 + 8)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(a2 + 16);
    }
    [v10 setTileBytes:v9 length:v11 atIndex:a3];
  }
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTileTexture:a2 atIndex:a3];
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return [*(id *)(a1 + 32) setTileSamplerState:*(void *)a2 lodMinClamp:a3 lodMaxClamp:a4 atIndex:a5];
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setThreadgroupMemoryLength:*a2 offset:a2[1] atIndex:a3];
}

- (void)enumerateVertexBuffersUsingBlock:(id)a3
{
}

- (void)enumerateVertexTexturesUsingBlock:(id)a3
{
}

- (void)enumerateVertexSamplersUsingBlock:(id)a3
{
}

- (void)enumerateFragmentBuffersUsingBlock:(id)a3
{
}

- (void)enumerateFragmentTexturesUsingBlock:(id)a3
{
}

- (void)enumerateFragmentSamplersUsingBlock:(id)a3
{
}

- (void)enumerateTileBuffersUsingBlock:(id)a3
{
}

- (void)enumerateTileTexturesUsingBlock:(id)a3
{
}

- (void)enumerateTileSamplersUsingBlock:(id)a3
{
}

- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3
{
  id v4 = (void (**)(id, DYMTLThreadgroupMemoryInfo *, unint64_t, unsigned char *))a3;
  unint64_t v5 = 0;
  char v8 = 0;
  for (i = self->_threadgroupMemories; !i->length; ++i)
  {
    if (v5 > 0x1D) {
      goto LABEL_11;
    }
LABEL_10:
    ++v5;
  }
  v4[2](v4, i, v5, &v8);
  if (v8) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 >= 0x1E;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (vector<MTLViewport,)viewports
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<MTLViewport, std::allocator<MTLViewport>> *)std::vector<MTLViewport>::__init_with_size[abi:ne180100]<MTLViewport*,MTLViewport*>(retstr, self->_viewports.__begin_, (uint64_t)self->_viewports.__end_, 0xAAAAAAAAAAAAAAABLL* ((self->_viewports.__end_ - self->_viewports.__begin_) >> 4));
}

- (void).cxx_destruct
{
  begin = self->_viewports.__begin_;
  if (begin)
  {
    self->_viewports.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_colorStoreInfos);
  id v4 = self->_amplificationViewMappings.__begin_;
  if (v4)
  {
    self->_amplificationViewMappings.__end_ = v4;
    operator delete(v4);
  }
  for (unint64_t i = 0; i != -744; i -= 24)
  {
    free(self->_tileBuffers[i / 0x18 + 30].m_bytes);
  }
  for (unint64_t j = 0; j != -744; j -= 24)
  {
    free(self->_fragmentBuffers[j / 0x18 + 30].m_bytes);
  }
  uint64_t v7 = 744;
  do
  {
    free(*(void **)((char *)&self->_usedResources.__end_ + v7));

    v7 -= 24;
  }
  while (v7);
  char v8 = self->_usedResources.__begin_;
  if (v8)
  {
    self->_usedResources.__end_ = v8;
    operator delete(v8);
  }
  uint64_t v9 = self->_usedHeaps.__begin_;
  if (v9)
  {
    self->_usedHeaps.var0 = v9;
    operator delete(v9);
  }
  id v10 = self->_scissorRects.__begin_;
  if (v10)
  {
    self->_scissorRects.__end_ = v10;
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_renderEncoder, 0);
}

- (id).cxx_construct
{
  self->_scissorRects.__end_cap_.__value_ = 0;
  *(_OWORD *)&self->_scissorRects.__begin_ = 0u;
  p_usedHeaps = &self->_usedHeaps;
  bzero(self->_fragmentBuffers, 0x2E8uLL);
  bzero(self->_tileBuffers, 0x2E8uLL);
  self->_amplificationViewMappings.__end_cap_.__value_ = 0;
  *(_OWORD *)&self->_amplificationViewMappings.__begin_ = 0u;
  self->_colorStoreInfos.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_colorStoreInfos.__table_.__p1_.__value_.__next_ = 0u;
  bzero(p_usedHeaps, 0x318uLL);
  self->_colorStoreInfos.__table_.__p3_.__value_ = 1.0;
  self->_viewports.__begin_ = 0;
  self->_viewports.__end_cap_.__value_ = 0;
  self->_viewports.__end_ = 0;
  return self;
}

@end