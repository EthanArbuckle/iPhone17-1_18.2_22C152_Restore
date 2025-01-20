@interface AGXG17FamilyComputeProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyComputeProgram

- (id).cxx_construct
{
  self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)VectorMap<AGX::ComputeProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ComputeProgramVariant>,4u>::Chunk::Chunk((uint64_t)&self->_impl);
  LODWORD(self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__end_) = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_ = 0u;
  *(_OWORD *)((char *)&self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_cap_.__value_
            + 2) = 0u;
  self->_impl.variants.initial_chunk.keys[3].ts = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].variant = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].message = 0u;
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
  *(void *)&self[1]._impl.variants.initial_chunk.keys[0].streamType = &self->_impl.variants.initial_chunk.values[0].variant;
  LODWORD(self[1]._impl.variants.initial_chunk.keys[0].stream.__begin_) = 0;
  self[1]._impl.variants.initial_chunk.keys[0]._vptr$ProgramKey = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0].stream.__end_ = 0u;
  self[1]._impl.variants.initial_chunk.keys[0].cs.colorMaskState.key = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[0].cs.fragmentState.var0 = 0;
  bzero(&self[1]._impl.variants.initial_chunk.keys[0].cs.mutableBuffers, 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  uint64_t v4 = *(void *)&self[1]._impl.variants.initial_chunk.keys[0].streamType;
  if (v4)
  {
    unint64_t v5 = (unint64_t)LODWORD(self[1]._impl.variants.initial_chunk.keys[0].stream.__begin_) << 32;
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
  p_variant = &self->_impl.variants.initial_chunk.values[0].variant;
  do
  {
    uint64_t v10 = *(unint64_t *)((char *)&self[1]._impl.variants.initial_chunk.keys[0].cs.mutableBuffers + v8);
    if (v10)
    {
      if ((*(unsigned char *)v10 & 1) == 0) {
        operator delete(*(void **)(v10 + 8), 16 * *(unsigned int *)(v10 + 16), (std::align_val_t)8uLL);
      }
      MEMORY[0x24566ED90](v10, 0x1000C406FAD1563);
    }
    v8 += 8;
  }
  while (v8 != 1024);
  v11 = *(TileProgramVariant ***)&self[1]._impl.variants.initial_chunk.keys[0].streamType;
  if (v11 != p_variant)
  {
    do
    {
      v12 = (TileProgramVariant **)v11[28];
      MEMORY[0x24566ED90]();
      *(void *)&self[1]._impl.variants.initial_chunk.keys[0].streamType = v12;
      v11 = v12;
    }
    while (v12 != p_variant);
  }
  begin = self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__begin_;
  if (begin != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)p_impl)
  {
    do
    {
      v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((void *)begin + 100);
      uint64_t v15 = VectorMap<AGX::ComputeProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ComputeProgramVariant>,4u>::Chunk::~Chunk((uint64_t)begin);
      MEMORY[0x24566ED90](v15, 0x10B2C4095AF869BLL);
      self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__begin_ = v14;
      begin = v14;
    }
    while (v14 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)p_impl);
  }
  value = self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__end_cap_.__value_;
  if (value) {
    dispatch_release(value);
  }
  v17 = self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__begin_;
  if (v17) {
    (*(void (**)($8EF4127CF77ECA3DDB612FCF233DC3A8 *))(*(void *)v17 + 8))(v17);
  }

  VectorMap<AGX::ComputeProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::ComputeProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end