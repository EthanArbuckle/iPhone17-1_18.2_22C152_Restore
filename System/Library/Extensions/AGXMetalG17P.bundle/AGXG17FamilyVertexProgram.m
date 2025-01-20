@interface AGXG17FamilyVertexProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyVertexProgram

- (id).cxx_construct
{
  self->_impl.variants.initial_chunk.values[3].message = (NSString *)VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::VertexProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  LODWORD(self->_impl.variants.initial_chunk.values[3].pipeline_archiver_id) = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[3].needsReattempt = 0u;
  *(_OWORD *)self->_impl.variants.__r.__words = 0u;
  *(_OWORD *)((char *)&self->_impl.variants.__r.__words[1] + 2) = 0u;
  self->_impl.variants.initial_chunk.values[3].error = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].stream.__begin_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].cs.colorMaskState.var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[0].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[4].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].cs.pcf.var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].ds.encoded.__elems_[0].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].ds.encoded.__elems_[4].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].ds.var0.var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].dynamic_libraries.dynamic_libraries_hash.__begin_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].dynamic_libraries.dynamic_libraries_hash.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].visible_functions.visible_functions_hash.__end_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].non_reflection_pipeline_options = 0u;
  self[1]._impl.variants.initial_chunk.keys[1].stream.__begin_ = (unsigned int *)&self[1]._impl;
  LODWORD(self[1]._impl.variants.initial_chunk.keys[1].stream.__end_) = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].streamType = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].stream.__end_cap_.__value_ = 0u;
  LODWORD(self[1]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers) = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.var0 = 0;
  bzero(self[1]._impl.variants.initial_chunk.keys[1].cs.blendState, 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  begin = self[1]._impl.variants.initial_chunk.keys[1].stream.__begin_;
  if (begin)
  {
    unint64_t v5 = (unint64_t)LODWORD(self[1]._impl.variants.initial_chunk.keys[1].stream.__end_) << 32;
    while (1)
    {
      while (1)
      {
        v6 = *(NSObject **)&begin[6 * v5 + 36];
        if (v6) {
          dispatch_release(v6);
        }
        uint64_t v7 = (v5 + 1);
        if (v7 < HIDWORD(v5)) {
          break;
        }
        begin = (unsigned int *)*((void *)begin + 28);
        unint64_t v5 = 0x400000000;
        if (!begin) {
          goto LABEL_9;
        }
      }
      unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!begin)
      {
LABEL_9:
        if (!v5) {
          break;
        }
      }
    }
  }
  uint64_t v8 = 0;
  v9 = (unsigned int *)&self[1]._impl;
  do
  {
    uint64_t v10 = *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[v8].var0;
    if (v10)
    {
      if ((*(unsigned char *)v10 & 1) == 0) {
        operator delete(*(void **)(v10 + 8), 16 * *(unsigned int *)(v10 + 16), (std::align_val_t)8uLL);
      }
      MEMORY[0x24566ED90](v10, 0x1000C406FAD1563);
    }
    v8 += 2;
  }
  while (v8 != 256);
  v11 = self[1]._impl.variants.initial_chunk.keys[1].stream.__begin_;
  if (v11 != v9)
  {
    do
    {
      v12 = (unsigned int *)*((void *)v11 + 28);
      MEMORY[0x24566ED90]();
      self[1]._impl.variants.initial_chunk.keys[1].stream.__begin_ = v12;
      v11 = v12;
    }
    while (v12 != v9);
  }
  message = self->_impl.variants.initial_chunk.values[3].message;
  if (message != (NSString *)p_impl)
  {
    do
    {
      v14 = (NSString *)message[128];
      VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::VertexProgramVariant>,4u>::Chunk::~Chunk((uint64_t)message);
      MEMORY[0x24566ED90]();
      self->_impl.variants.initial_chunk.values[3].message = v14;
      message = v14;
    }
    while (v14 != (NSString *)p_impl);
  }
  v15 = *(NSObject **)&self->_impl.variants.initial_chunk.values[3].needsReattempt;
  if (v15) {
    dispatch_release(v15);
  }
  next = self->_impl.variants.initial_chunk.next;
  if (next) {
    (*((void (**)(Chunk *))next->keys[0]._vptr$ProgramKey + 1))(next);
  }

  VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::VertexProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end