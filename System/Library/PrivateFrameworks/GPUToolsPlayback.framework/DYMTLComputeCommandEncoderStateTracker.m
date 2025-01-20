@interface DYMTLComputeCommandEncoderStateTracker
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (DYMTLComputeCommandEncoderStateTracker)initWithEncoder:(id)a3 dispatchType:(unint64_t)a4;
- (id).cxx_construct;
- (id)computePipelineState;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)applyToEncoder:(id)a3 rawBytesBlock:(id)a4;
- (void)enumerateBuffersUsingBlock:(id)a3;
- (void)enumerateSamplersUsingBlock:(id)a3;
- (void)enumerateTexturesUsingBlock:(id)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setComputePipelineState:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
@end

@implementation DYMTLComputeCommandEncoderStateTracker

- (DYMTLComputeCommandEncoderStateTracker)initWithEncoder:(id)a3 dispatchType:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
    v8 = [(DYMTLComputeCommandEncoderStateTracker *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_computeEncoder, a3);
      v9->_dispatchType = a4;
      v9->_hasSetStageInRegion = 0;
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
  if ([(MTLComputeCommandEncoderSPI *)self->_computeEncoder conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
    BOOL v5 = [(DYMTLComputeCommandEncoderStateTracker *)&v7 conformsToProtocol:v4];
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_computeEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
  if (-[DYMTLComputeCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)computePipelineState
{
  return self->_computePipelineState;
}

- (void)setComputePipelineState:(id)a3
{
  self->_computePipelineState = (MTLComputePipelineState *)a3;
  -[MTLComputeCommandEncoderSPI setComputePipelineState:](self->_computeEncoder, "setComputePipelineState:");
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_buffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setBytes:a3 length:a4 atIndex:a5];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  v10 = 0;
  unint64_t v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_buffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setBuffer:v8 offset:a4 atIndex:a5];
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_buffers[a4].m_offsetOrLength = a3;
  -[MTLComputeCommandEncoderSPI setBufferOffset:atIndex:](self->_computeEncoder, "setBufferOffset:atIndex:");
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length)
  {
    v10 = &self->_buffers[a5.location];
    unint64_t v11 = a3;
    objc_super v12 = a4;
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
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:withRange:](self->_computeEncoder, "setBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_textures[a4] = (MTLTexture *)a3;
  -[MTLComputeCommandEncoderSPI setTexture:atIndex:](self->_computeEncoder, "setTexture:atIndex:");
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    id v4 = &self->_textures[a4.location];
    objc_super v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      objc_super v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setTextures:a3 withRange:a4.location];
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = (char *)self + 16 * a4;
  *((void *)v4 + 230) = a3;
  *((void *)v4 + 231) = 0x447A000000000000;
  -[MTLComputeCommandEncoderSPI setSamplerState:atIndex:](self->_computeEncoder, "setSamplerState:atIndex:");
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    p_minLOD = &self->_samplers[a4.location].minLOD;
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
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSamplerStates:a3 withRange:a4.location];
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  v6 = (char *)self + 16 * a6;
  *((void *)v6 + 230) = a3;
  *((float *)v6 + 462) = a4;
  *((float *)v6 + 463) = a5;
  -[MTLComputeCommandEncoderSPI setSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_computeEncoder, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    p_maxLOD = &self->_samplers[a6.location].maxLOD;
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
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder setSamplerStates:a3 lodMinClamps:a4 lodMaxClamps:a5 withRange:a6.location];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_threadgroupMemories[a4] = a3;
  -[MTLComputeCommandEncoderSPI setThreadgroupMemoryLength:atIndex:](self->_computeEncoder, "setThreadgroupMemoryLength:atIndex:");
}

- (void)setStageInRegion:(id *)a3
{
  self->_hasSetStageInRegion = 1;
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_stageInRegion.origin.z = *(_OWORD *)&a3->var0.var2;
  *(_OWORD *)&self->_stageInRegion.size.height = v4;
  *(_OWORD *)&self->_stageInRegion.origin.x = v3;
  computeEncoder = self->_computeEncoder;
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLComputeCommandEncoderSPI *)computeEncoder setStageInRegion:v7];
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  self->_stageInRegionIndirectBuffer = (MTLBuffer *)a3;
  self->_stageInRegionIndirectBufferOffset = a4;
  -[MTLComputeCommandEncoderSPI setStageInRegionWithIndirectBuffer:indirectBufferOffset:](self->_computeEncoder, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:");
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
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder useResource:v6 usage:a4];
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
  computeEncoder = self->_computeEncoder;
  [(MTLComputeCommandEncoderSPI *)computeEncoder useResources:a3 count:a4 usage:a5];
}

- (void)useHeap:(id)a3
{
  id v4 = a3;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)&self->_usedHeaps, &v4);
  [(MTLComputeCommandEncoderSPI *)self->_computeEncoder useHeap:v4];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v7 = a3;
    unint64_t v8 = a4;
    do
    {
      std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)&self->_usedHeaps, (id *)v7++);
      --v8;
    }
    while (v8);
  }
  computeEncoder = self->_computeEncoder;
  [(MTLComputeCommandEncoderSPI *)computeEncoder useHeaps:a3 count:a4];
}

- (void)enumerateBuffersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, DYMTLBoundBufferInfo *, unint64_t, unsigned char *))a3;
  unint64_t v5 = 0;
  char v8 = 0;
  for (i = self->_buffers; ; ++i)
  {
    m_bytes = i->m_bytes;
    if (!i->m_buffer) {
      break;
    }
    if (!m_bytes) {
      goto LABEL_7;
    }
LABEL_4:
    if (v5 > 0x1D) {
      goto LABEL_10;
    }
LABEL_9:
    ++v5;
  }
  if (!m_bytes) {
    goto LABEL_4;
  }
LABEL_7:
  v4[2](v4, i, v5, &v8);
  if (!v8 && v5 < 0x1E) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)enumerateTexturesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, MTLTexture *, unint64_t, unsigned char *))a3;
  unint64_t v5 = 0;
  char v8 = 0;
  textures = self->_textures;
  while (1)
  {
    uint64_t v7 = textures[v5];
    if (v7) {
      break;
    }
    if (v5 > 0x7E) {
      goto LABEL_8;
    }
LABEL_7:
    ++v5;
  }
  v4[2](v4, v7, v5, &v8);
  if (!v8 && v5 < 0x7F) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)enumerateSamplersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, DYMTLBoundSamplerInfo *, unint64_t, unsigned char *))a3;
  unint64_t v5 = 0;
  char v8 = 0;
  for (i = self->_samplers; !i->sampler; ++i)
  {
    if (v5 > 0xE) {
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
    BOOL v7 = v5 >= 0xF;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)applyToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  begin = self->_usedHeaps.__begin_;
  var0 = self->_usedHeaps.var0;
  while (begin != var0)
  {
    v10 = *begin;
    [v6 useHeap:v10];

    ++begin;
  }
  uint64_t v11 = self->_usedResources.__begin_;
  end = self->_usedResources.__end_;
  while (v11 != end)
  {
    [v6 useResource:*(void *)v11 usage:*((void *)v11 + 1)];
    uint64_t v11 = (DYMTLUsedResourceInfo *)((char *)v11 + 16);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke;
  v28[3] = &unk_265339458;
  id v13 = v7;
  id v30 = v13;
  id v14 = v6;
  id v29 = v14;
  [(DYMTLComputeCommandEncoderStateTracker *)self enumerateBuffersUsingBlock:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_2;
  v26[3] = &unk_2653390D0;
  id v15 = v14;
  id v27 = v15;
  [(DYMTLComputeCommandEncoderStateTracker *)self enumerateTexturesUsingBlock:v26];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_3;
  v24[3] = &unk_265339480;
  id v16 = v15;
  id v25 = v16;
  [(DYMTLComputeCommandEncoderStateTracker *)self enumerateSamplersUsingBlock:v24];
  for (uint64_t i = 0; i != 31; ++i)
  {
    unint64_t v18 = self->_threadgroupMemories[i];
    if (v18) {
      [v16 setThreadgroupMemoryLength:v18 atIndex:i];
    }
  }
  if (self->_computePipelineState) {
    objc_msgSend(v16, "setComputePipelineState:");
  }
  v19 = [(MTLComputeCommandEncoderSPI *)self->_computeEncoder label];

  if (v19)
  {
    v20 = [(MTLComputeCommandEncoderSPI *)self->_computeEncoder label];
    [v16 setLabel:v20];
  }
  if (self->_hasSetStageInRegion)
  {
    long long v21 = *(_OWORD *)&self->_stageInRegion.origin.z;
    v23[0] = *(_OWORD *)&self->_stageInRegion.origin.x;
    v23[1] = v21;
    v23[2] = *(_OWORD *)&self->_stageInRegion.size.height;
    [v16 setStageInRegion:v23];
  }
  stageInRegionIndirectBuffer = self->_stageInRegionIndirectBuffer;
  if (stageInRegionIndirectBuffer) {
    [v16 setStageInRegionWithIndirectBuffer:stageInRegionIndirectBuffer indirectBufferOffset:self->_stageInRegionIndirectBufferOffset];
  }
}

void __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    [v6 setBuffer:v7 offset:v8 atIndex:a3];
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    v10 = *(void **)(a1 + 32);
    if (*(void *)a2 || !*(void *)(a2 + 8)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(a2 + 16);
    }
    [v10 setBytes:v9 length:v11 atIndex:a3];
  }
}

uint64_t __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTexture:a2 atIndex:a3];
}

uint64_t __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return [*(id *)(a1 + 32) setSamplerState:*(void *)a2 lodMinClamp:a3 lodMaxClamp:a4 atIndex:a5];
}

- (void).cxx_destruct
{
  uint64_t v3 = 744;
  do
  {
    free(*(void **)((char *)&self->_usedResources.__end_ + v3));

    v3 -= 24;
  }
  while (v3);
  begin = self->_usedResources.__begin_;
  if (begin)
  {
    self->_usedResources.__end_ = begin;
    operator delete(begin);
  }
  p_usedHeaps = &self->_usedHeaps;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_usedHeaps);
  objc_storeStrong((id *)&self->_computeEncoder, 0);
}

- (id).cxx_construct
{
  return self;
}

@end