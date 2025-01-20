@interface AGXG17FamilyObjectProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyObjectProgram

- (id).cxx_construct
{
  self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ObjectProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  LODWORD(self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_cap_.__value_) = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].non_reflection_pipeline_options = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].variant = 0u;
  *(_OWORD *)((char *)&self->_impl.variants.initial_chunk.values[0].error + 2) = 0u;
  self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__begin_ = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].needsReattempt = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[1].variant = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[1].message = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[1].needsReattempt = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[2].variant = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[2].message = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[2].needsReattempt = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[3].variant = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[3].message = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[3].needsReattempt = 0u;
  *(_OWORD *)self->_impl.variants.__r.__words = 0u;
  *(_OWORD *)&self->_impl.variants.__r.__words[2] = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].stream.__begin_ = 0u;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.fragmentState.var0 = &self->_impl.variants.initial_chunk.values[0].needsReattempt;
  self[1]._impl.variants.initial_chunk.keys[0].cs.colorMaskState.key = 0;
  self[1]._impl.variants.initial_chunk.keys[0].stream.__end_cap_.__value_ = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].cs.mutableBuffers = 0u;
  self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[4].key = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[2].var0 = 0;
  bzero(&self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[6], 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  uint64_t v4 = *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.fragmentState.var0;
  if (v4)
  {
    unint64_t v5 = (unint64_t)self[1]._impl.variants.initial_chunk.keys[0].cs.colorMaskState.key << 32;
    while (1)
    {
      while (1)
      {
        v6 = *(NSObject **)(v4 + 24 * v5 + 144);
        if (v6) {
          dispatch_release(v6);
        }
        uint64_t v7 = (v5 + 1);
        if (v7 < HIDWORD(v5)) {
          break;
        }
        uint64_t v4 = *(void *)(v4 + 224);
        unint64_t v5 = 0x400000000;
        if (!v4) {
          goto LABEL_9;
        }
      }
      unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!v4)
      {
LABEL_9:
        if (!v5) {
          break;
        }
      }
    }
  }
  uint64_t v8 = 0;
  p_needsReattempt = &self->_impl.variants.initial_chunk.values[0].needsReattempt;
  do
  {
    uint64_t v10 = *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.blendState[v8 + 6].var0;
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
  v11 = *(BOOL **)&self[1]._impl.variants.initial_chunk.keys[0].cs.fragmentState.var0;
  if (v11 != p_needsReattempt)
  {
    do
    {
      v12 = (BOOL *)*((void *)v11 + 28);
      MEMORY[0x24566ED90]();
      *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.fragmentState.var0 = v12;
      v11 = v12;
    }
    while (v12 != p_needsReattempt);
  }
  end = self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_;
  if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)p_impl)
  {
    do
    {
      v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((void *)end + 104);
      uint64_t v15 = VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ObjectProgramVariant>,4u>::Chunk::~Chunk((uint64_t)end);
      MEMORY[0x24566ED90](v15, 0x10B2C40CE86BACFLL);
      self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_ = v14;
      end = v14;
    }
    while (v14 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)p_impl);
  }
  non_reflection_pipeline_options = self->_impl.variants.initial_chunk.keys[3].non_reflection_pipeline_options;
  if (non_reflection_pipeline_options) {
    dispatch_release(non_reflection_pipeline_options);
  }
  ve_group = self->_impl.variants.initial_chunk.values[0].ve_group;
  if (ve_group) {
    (*(void (**)(OS_dispatch_group *))(*(void *)ve_group + 8))(ve_group);
  }

  VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ObjectProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end