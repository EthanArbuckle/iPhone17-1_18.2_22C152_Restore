@interface AGXG17FamilyFragmentProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyFragmentProgram

- (id).cxx_construct
{
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.fragmentState.var0 = VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::FragmentProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.key = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[2].var0 = 0u;
  *(_OWORD *)((char *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[4].key + 2) = 0u;
  self[1]._impl.variants.initial_chunk.keys[1].stream.__end_cap_.__value_ = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].cs.var0.var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].ds.encoded.__elems_[2].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].ds.encoded.__elems_[6].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].ts.maxTotalThreadsPerThreadgroup = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].dynamic_libraries.dynamic_libraries_hash.__end_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].visible_functions.visible_functions_hash.__begin_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].visible_functions.visible_functions_hash.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].stream.__begin_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].cs.colorMaskState.var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].cs.blendState[0].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].cs.blendState[4].var0 = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].cs.pcf.var0 = 0u;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[2].var0 = (char *)self + 1424;
  self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[4].key = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[0].var0 = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[6].var0 = 0u;
  LODWORD(self[1]._impl.variants.initial_chunk.keys[2].dynamic_libraries.dynamic_libraries_hash.__begin_) = 0;
  self[1]._impl.variants.initial_chunk.keys[2].ts = 0;
  bzero(&self[1]._impl.variants.initial_chunk.keys[2].dynamic_libraries.dynamic_libraries_hash.__end_, 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  uint64_t v4 = *(void *)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[2].var0;
  if (v4)
  {
    unint64_t v5 = (unint64_t)self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[4].key << 32;
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
  p_var0 = (char *)&self[1]._impl.variants.initial_chunk.keys[1].cs.var0;
  do
  {
    uint64_t v10 = *(uint64_t *)((char *)&self[1]._impl.variants.initial_chunk.keys[2].dynamic_libraries.dynamic_libraries_hash.__end_
                     + v8);
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
  v11 = *(char **)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[2].var0;
  if (v11 != p_var0)
  {
    do
    {
      v12 = (char *)*((void *)v11 + 28);
      MEMORY[0x24566ED90]();
      *(void *)&self[1]._impl.variants.initial_chunk.keys[2].ds.encoded.__elems_[2].var0 = v12;
      v11 = v12;
    }
    while (v12 != p_var0);
  }
  uint64_t v13 = *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.fragmentState.var0;
  if ((FragmentProgram *)v13 != p_impl)
  {
    do
    {
      v14 = *(FragmentProgram **)(v13 + 1344);
      uint64_t v15 = VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::FragmentProgramVariant>,4u>::Chunk::~Chunk(v13);
      MEMORY[0x24566ED90](v15, 0x10B2C40D3941106);
      *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.fragmentState.var0 = v14;
      uint64_t v13 = (uint64_t)v14;
    }
    while (v14 != p_impl);
  }
  mutableBuffers = self[1]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers;
  if (mutableBuffers) {
    dispatch_release(mutableBuffers);
  }
  uint64_t v17 = *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[0].var0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }

  VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::FragmentProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end