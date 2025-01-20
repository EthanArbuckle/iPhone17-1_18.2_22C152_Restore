@interface AGXG17FamilyIntersectionProgram
- (id).cxx_construct;
@end

@implementation AGXG17FamilyIntersectionProgram

- (id).cxx_construct
{
  self->_impl.variants.initial_chunk.keys[3]._vptr$ProgramKey = (void **)VectorMap<AGX::UserIntersectionProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::IntersectionProgramVariant>,4u>::Chunk::Chunk((uint64_t)&self->_impl);
  self->_impl.variants.initial_chunk.keys[3].streamType = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].stream.__begin_ = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)((char *)&self->_impl.variants.initial_chunk.keys[3].cs.fragmentState.key + 2) = 0u;
  self->_impl.variants.initial_chunk.keys[2].non_reflection_pipeline_options = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].cs.blendState[0].var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].cs.blendState[4].var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].cs.pcf.var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].ds.encoded.__elems_[0].var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].ds.encoded.__elems_[4].var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].ds.var0.var0 = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__begin_ = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].dynamic_libraries.dynamic_libraries_hash.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].visible_functions.visible_functions_hash.__end_ = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.keys[3].non_reflection_pipeline_options = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].variant = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].message = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[0].needsReattempt = 0u;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[1].variant = 0u;
  self->_impl.variants.initial_chunk.values[1].pipeline_archiver_id = (OS_dispatch_data *)self->_impl.variants.initial_chunk.keys[3].cs.blendState;
  *(_DWORD *)&self->_impl.variants.initial_chunk.values[1].needsReattempt = 0;
  self->_impl.variants.initial_chunk.values[1].message = 0;
  *(_OWORD *)&self->_impl.variants.initial_chunk.values[2].ve_group = 0u;
  LODWORD(self->_impl.variants.initial_chunk.values[2].message) = 0;
  self->_impl.variants.initial_chunk.values[2].error = 0;
  bzero(&self->_impl.variants.initial_chunk.values[2].pipeline_archiver_id, 0x401uLL);
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  pipeline_archiver_id = self->_impl.variants.initial_chunk.values[1].pipeline_archiver_id;
  if (pipeline_archiver_id)
  {
    unint64_t v5 = (unint64_t)*(unsigned int *)&self->_impl.variants.initial_chunk.values[1].needsReattempt << 32;
    while (1)
    {
      while (1)
      {
        v6 = *((void *)pipeline_archiver_id + 3 * v5 + 18);
        if (v6) {
          dispatch_release(v6);
        }
        uint64_t v7 = (v5 + 1);
        if (v7 < HIDWORD(v5)) {
          break;
        }
        pipeline_archiver_id = (OS_dispatch_data *)*((void *)pipeline_archiver_id + 28);
        unint64_t v5 = 0x400000000;
        if (!pipeline_archiver_id) {
          goto LABEL_9;
        }
      }
      unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!pipeline_archiver_id)
      {
LABEL_9:
        if (!v5) {
          break;
        }
      }
    }
  }
  uint64_t v8 = 0;
  blendState = self->_impl.variants.initial_chunk.keys[3].cs.blendState;
  do
  {
    uint64_t v10 = *(uint64_t *)((char *)&self->_impl.variants.initial_chunk.values[2].pipeline_archiver_id + v8);
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
  v11 = self->_impl.variants.initial_chunk.values[1].pipeline_archiver_id;
  if (v11 != (OS_dispatch_data *)blendState)
  {
    do
    {
      v12 = (OS_dispatch_data *)*((void *)v11 + 28);
      MEMORY[0x24566ED90]();
      self->_impl.variants.initial_chunk.values[1].pipeline_archiver_id = v12;
      v11 = v12;
    }
    while (v12 != (OS_dispatch_data *)blendState);
  }
  v13 = self->_impl.variants.initial_chunk.keys[3]._vptr$ProgramKey;
  if (v13 != (void **)p_impl)
  {
    do
    {
      v14 = (void **)v13[80];
      uint64_t v15 = VectorMap<AGX::UserIntersectionProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::IntersectionProgramVariant>,4u>::Chunk::~Chunk((uint64_t)v13);
      MEMORY[0x24566ED90](v15, 0x10B0C4051A67AE5);
      self->_impl.variants.initial_chunk.keys[3]._vptr$ProgramKey = v14;
      v13 = v14;
    }
    while (v14 != (void **)p_impl);
  }
  begin = self->_impl.variants.initial_chunk.keys[3].stream.__begin_;
  if (begin) {
    dispatch_release((dispatch_object_t)begin);
  }
  end = self->_impl.variants.initial_chunk.keys[3].stream.__end_;
  if (end) {
    (*(void (**)(unsigned int *))(*(void *)end + 8))(end);
  }

  VectorMap<AGX::UserIntersectionProgramKey,AGX::ProgramVariantEntry<AGX::HAL200::IntersectionProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

@end