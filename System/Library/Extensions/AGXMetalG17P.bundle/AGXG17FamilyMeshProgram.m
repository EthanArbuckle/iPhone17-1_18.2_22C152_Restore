@interface AGXG17FamilyMeshProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyMeshProgram

- (id).cxx_construct
{
  self->_impl.variants.__r.__words[0] = (unint64_t)VectorMap<AGX::MeshProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::MeshProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  LODWORD(self->_impl.variants.__r.__words[1]) = 0;
  *(_OWORD *)&self->_impl.variants.__r.__words[2] = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[0]._vptr$ProgramKey = 0u;
  *(_OWORD *)((char *)&self[1]._impl.variants.initial_chunk.keys[0].streamType + 2) = 0u;
  self->_impl.variants.initial_chunk.next = 0;
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
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].streamType = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].stream.__end_ = 0u;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.var0 = (char *)self + 1136;
  LODWORD(self[1]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers) = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.fragmentState.var0 = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[0].var0 = 0u;
  self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[6].key = 0;
  *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.blendState[4].var0 = 0;
  bzero(&self[1]._impl.variants.initial_chunk.keys[1].cs.pcf, 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  uint64_t v4 = *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.var0;
  if (v4)
  {
    unint64_t v5 = (unint64_t)LODWORD(self[1]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers) << 32;
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
  p_end_cap = (char *)&self[1]._impl.variants.initial_chunk.keys[0].stream.__end_cap_;
  do
  {
    uint64_t v10 = *(void *)((char *)&self[1]._impl.variants.initial_chunk.keys[1].cs.pcf.var0 + v8);
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
  v11 = *(char **)&self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.var0;
  if (v11 != p_end_cap)
  {
    do
    {
      v12 = (char *)*((void *)v11 + 28);
      MEMORY[0x24566ED90]();
      *(void *)&self[1]._impl.variants.initial_chunk.keys[1].cs.colorMaskState.var0 = v12;
      v11 = v12;
    }
    while (v12 != p_end_cap);
  }
  uint64_t v13 = self->_impl.variants.__r.__words[0];
  if ((MeshProgram *)v13 != p_impl)
  {
    do
    {
      unint64_t v14 = *(void *)(v13 + 1056);
      VectorMap<AGX::MeshProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::MeshProgramVariant>,4u>::Chunk::~Chunk(v13);
      MEMORY[0x24566ED90]();
      self->_impl.variants.__r.__words[0] = v14;
      uint64_t v13 = v14;
    }
    while ((MeshProgram *)v14 != p_impl);
  }
  v15 = self->_impl.variants.__r.__words[2];
  if (v15) {
    dispatch_release(v15);
  }
  Class isa = self[1].super.isa;
  if (isa) {
    (*(void (**)(Class))(*(void *)isa + 8))(isa);
  }

  VectorMap<AGX::MeshProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::MeshProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end