@interface AGXG17FamilyIndirectArgumentBufferLayout
- (AGXG17FamilyIndirectArgumentBufferLayout)initWithStructType:(id)a3;
- (BOOL)bufferLayoutMatchesFrontEndLayout;
- (id).cxx_construct;
- (unint64_t)alignment;
- (unint64_t)constantOffsetAtIndex:(unint64_t)a3;
- (unint64_t)encodedLength;
- (unint64_t)uniqueIdentifierForAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForIndirectCommandBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unsigned)hashMask;
- (unsigned)hashOffset;
- (unsigned)hashSignature;
- (unsigned)hashValue;
- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
@end

@implementation AGXG17FamilyIndirectArgumentBufferLayout

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value)
  {
    if ((*(unsigned char *)value & 1) == 0) {
      operator delete(*((void **)value + 1), 16 * *((unsigned int *)value + 4), (std::align_val_t)8uLL);
    }
    JUMPOUT(0x24566ED90);
  }
}

- (unint64_t)constantOffsetAtIndex:(unint64_t)a3
{
  value = self->_impl.__ptr_.__value_;
  v4 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v5 = 16;
  }
  else
  {
    int v5 = *((_DWORD *)value + 4);
    if (!v5) {
      return 0;
    }
    v4 = (char *)*((void *)value + 1);
  }
  int v6 = v5 - 1;
  uint64_t v7 = (v5 - 1) & (37 * a3);
  int v8 = *(_DWORD *)&v4[16 * v7];
  if (v8 == a3) {
    return *(void *)&v4[16 * v7 + 8] & 0xFFFFFFFFFFFFFFLL;
  }
  int v10 = 1;
  while (v8 != -1)
  {
    int v11 = v7 + v10++;
    uint64_t v7 = v11 & v6;
    int v8 = *(_DWORD *)&v4[16 * v7];
    if (v8 == a3) {
      return *(void *)&v4[16 * v7 + 8] & 0xFFFFFFFFFFFFFFLL;
    }
  }
  return 0;
}

- (unsigned)hashSignature
{
  return -1;
}

- (unsigned)hashMask
{
  return -1;
}

- (unsigned)hashOffset
{
  return -1;
}

- (unsigned)hashValue
{
  return -1;
}

- (unint64_t)alignment
{
  return *((void *)self->_impl.__ptr_.__value_ + 34);
}

- (unint64_t)encodedLength
{
  return *((void *)self->_impl.__ptr_.__value_ + 33);
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return 1;
}

- (unint64_t)uniqueIdentifierForAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (int *)MEMORY[0x263F4B188];
  v12 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v13 = 16;
  }
  else
  {
    int v13 = *((_DWORD *)value + 4);
    if (!v13)
    {
LABEL_19:
      uint64_t v17 = 0;
      goto LABEL_7;
    }
    v12 = (char *)*((void *)value + 1);
  }
  int v14 = v13 - 1;
  uint64_t v15 = (v13 - 1) & (37 * v7);
  int v16 = *(_DWORD *)&v12[16 * v15];
  if (v16 != v7)
  {
    int v30 = 1;
    while (v16 != -1)
    {
      int v31 = v15 + v30++;
      uint64_t v15 = v31 & v14;
      int v16 = *(_DWORD *)&v12[16 * v15];
      if (v16 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_19;
  }
LABEL_6:
  uint64_t v17 = *(unsigned int *)&v12[16 * v15 + 8];
LABEL_7:
  AGX::Mempool<16u,0u,true,AGX::HAL200::BVHStateHeapElem>::Allocation::Allocation((uint64_t)&v32, (os_unfair_lock_s *)(*((void *)v9 + 101) + 6216), *(_DWORD *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v17));
  v18 = (os_unfair_lock_s *)(v33 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v33 + 40));
  uint64_t v19 = *(void *)(*(void *)(*(void *)(v33 + 8) + *v11 + 24) + 16 * v32);
  os_unfair_lock_unlock(v18);
  if (v32 && !v34)
  {
    v20 = (os_unfair_lock_s *)(v33 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(v33 + 40));
    uint64_t v21 = v33;
    uint64_t v22 = v32;
    v23 = (atomic_ullong *)(v33 + 32);
    uint64_t v24 = *(void *)(v33 + 32);
    uint64_t v25 = 16 * v32;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v33 + 24) + 8) + *v11 + 24) + v25) = v24;
    uint64_t v26 = v24;
    atomic_compare_exchange_strong(v23, (unint64_t *)&v26, (v24 & 0xFFFFFFFF00000000 | v22) + 0x100000000);
    if (v26 != v24)
    {
      uint64_t v27 = v26;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(v21 + 24) + 8) + *v11 + 24) + v25) = v26;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v21 + 32), (unint64_t *)&v27, (v26 & 0xFFFFFFFF00000000 | v22) + 0x100000000);
        BOOL v28 = v27 == v26;
        uint64_t v26 = v27;
      }
      while (!v28);
    }
    os_unfair_lock_unlock(v20);
  }
  return v19 & 0xFFFFFFFFC000;
}

- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v12 = 16;
  }
  else
  {
    int v12 = *((_DWORD *)value + 4);
    if (!v12)
    {
LABEL_12:
      uint64_t v16 = 0;
      return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6544) + (int)*MEMORY[0x263F4B188] + 24)
                       + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
    }
    int v11 = (char *)*((void *)value + 1);
  }
  int v13 = v12 - 1;
  uint64_t v14 = (v12 - 1) & (37 * v7);
  int v15 = *(_DWORD *)&v11[16 * v14];
  if (v15 != v7)
  {
    int v18 = 1;
    while (v15 != -1)
    {
      int v19 = v14 + v18++;
      uint64_t v14 = v19 & v13;
      int v15 = *(_DWORD *)&v11[16 * v14];
      if (v15 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v16 = *(unsigned int *)&v11[16 * v14 + 8];
  return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6544) + (int)*MEMORY[0x263F4B188] + 24)
                   + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
}

- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v12 = 16;
  }
  else
  {
    int v12 = *((_DWORD *)value + 4);
    if (!v12)
    {
LABEL_12:
      uint64_t v16 = 0;
      return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6480) + (int)*MEMORY[0x263F4B188] + 24)
                       + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
    }
    int v11 = (char *)*((void *)value + 1);
  }
  int v13 = v12 - 1;
  uint64_t v14 = (v12 - 1) & (37 * v7);
  int v15 = *(_DWORD *)&v11[16 * v14];
  if (v15 != v7)
  {
    int v18 = 1;
    while (v15 != -1)
    {
      int v19 = v14 + v18++;
      uint64_t v14 = v19 & v13;
      int v15 = *(_DWORD *)&v11[16 * v14];
      if (v15 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v16 = *(unsigned int *)&v11[16 * v14 + 8];
  return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6480) + (int)*MEMORY[0x263F4B188] + 24)
                   + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
}

- (unint64_t)uniqueIdentifierForIndirectCommandBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v12 = 16;
  }
  else
  {
    int v12 = *((_DWORD *)value + 4);
    if (!v12)
    {
LABEL_12:
      uint64_t v16 = 0;
      return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6416) + (int)*MEMORY[0x263F4B188] + 24)
                       + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
    }
    int v11 = (char *)*((void *)value + 1);
  }
  int v13 = v12 - 1;
  uint64_t v14 = (v12 - 1) & (37 * v7);
  int v15 = *(_DWORD *)&v11[16 * v14];
  if (v15 != v7)
  {
    int v18 = 1;
    while (v15 != -1)
    {
      int v19 = v14 + v18++;
      uint64_t v14 = v19 & v13;
      int v15 = *(_DWORD *)&v11[16 * v14];
      if (v15 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v16 = *(unsigned int *)&v11[16 * v14 + 8];
  return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6416) + (int)*MEMORY[0x263F4B188] + 24)
                   + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v12 = 16;
  }
  else
  {
    int v12 = *((_DWORD *)value + 4);
    if (!v12)
    {
LABEL_12:
      uint64_t v16 = 0;
      return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6352) + (int)*MEMORY[0x263F4B188] + 24)
                       + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
    }
    int v11 = (char *)*((void *)value + 1);
  }
  int v13 = v12 - 1;
  uint64_t v14 = (v12 - 1) & (37 * v7);
  int v15 = *(_DWORD *)&v11[16 * v14];
  if (v15 != v7)
  {
    int v18 = 1;
    while (v15 != -1)
    {
      int v19 = v14 + v18++;
      uint64_t v14 = v19 & v13;
      int v15 = *(_DWORD *)&v11[16 * v14];
      if (v15 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v16 = *(unsigned int *)&v11[16 * v14 + 8];
  return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6352) + (int)*MEMORY[0x263F4B188] + 24)
                   + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  int v7 = a3;
  v9 = [(_MTLIndirectArgumentBufferLayout *)self device];
  value = self->_impl.__ptr_.__value_;
  int v11 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v12 = 16;
  }
  else
  {
    int v12 = *((_DWORD *)value + 4);
    if (!v12)
    {
LABEL_12:
      uint64_t v16 = 0;
      return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6352) + (int)*MEMORY[0x263F4B188] + 24)
                       + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
    }
    int v11 = (char *)*((void *)value + 1);
  }
  int v13 = v12 - 1;
  uint64_t v14 = (v12 - 1) & (37 * v7);
  int v15 = *(_DWORD *)&v11[16 * v14];
  if (v15 != v7)
  {
    int v18 = 1;
    while (v15 != -1)
    {
      int v19 = v14 + v18++;
      uint64_t v14 = v19 & v13;
      int v15 = *(_DWORD *)&v11[16 * v14];
      if (v15 == v7) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v16 = *(unsigned int *)&v11[16 * v14 + 8];
  return *(void *)(*(void *)(*(void *)(*((void *)v9 + 101) + 6352) + (int)*MEMORY[0x263F4B188] + 24)
                   + 8 * *(unsigned int *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v16));
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  value = self->_impl.__ptr_.__value_;
  int v6 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v7 = 16;
  }
  else
  {
    int v7 = *((_DWORD *)value + 4);
    if (!v7)
    {
LABEL_12:
      uint64_t v11 = 0;
      return *(void *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
    }
    int v6 = (char *)*((void *)value + 1);
  }
  int v8 = v7 - 1;
  uint64_t v9 = (v7 - 1) & (37 * a3);
  int v10 = *(_DWORD *)&v6[16 * v9];
  if (v10 != a3)
  {
    int v13 = 1;
    while (v10 != -1)
    {
      int v14 = v9 + v13++;
      uint64_t v9 = v14 & v8;
      int v10 = *(_DWORD *)&v6[16 * v9];
      if (v10 == a3) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v11 = *(unsigned int *)&v6[16 * v9 + 8];
  return *(void *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  value = self->_impl.__ptr_.__value_;
  int v6 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v7 = 16;
  }
  else
  {
    int v7 = *((_DWORD *)value + 4);
    if (!v7)
    {
LABEL_12:
      uint64_t v11 = 0;
      return *(void *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
    }
    int v6 = (char *)*((void *)value + 1);
  }
  int v8 = v7 - 1;
  uint64_t v9 = (v7 - 1) & (37 * a3);
  int v10 = *(_DWORD *)&v6[16 * v9];
  if (v10 != a3)
  {
    int v13 = 1;
    while (v10 != -1)
    {
      int v14 = v9 + v13++;
      uint64_t v9 = v14 & v8;
      int v10 = *(_DWORD *)&v6[16 * v9];
      if (v10 == a3) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v11 = *(unsigned int *)&v6[16 * v9 + 8];
  return *(void *)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  value = self->_impl.__ptr_.__value_;
  int v6 = (char *)value + 8;
  if (*(unsigned char *)value)
  {
    int v7 = 16;
  }
  else
  {
    int v7 = *((_DWORD *)value + 4);
    if (!v7)
    {
LABEL_12:
      uint64_t v11 = 0;
      return *(void **)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
    }
    int v6 = (char *)*((void *)value + 1);
  }
  int v8 = v7 - 1;
  uint64_t v9 = (v7 - 1) & (37 * a3);
  int v10 = *(_DWORD *)&v6[16 * v9];
  if (v10 != a3)
  {
    int v13 = 1;
    while (v10 != -1)
    {
      int v14 = v9 + v13++;
      uint64_t v9 = v14 & v8;
      int v10 = *(_DWORD *)&v6[16 * v9];
      if (v10 == a3) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v11 = *(unsigned int *)&v6[16 * v9 + 8];
  return *(void **)(*(void *)((char *)a4 + *MEMORY[0x263F4B188] + 24) + a5 + v11);
}

- (AGXG17FamilyIndirectArgumentBufferLayout)initWithStructType:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyIndirectArgumentBufferLayout;
  if ([(_MTLIndirectArgumentBufferLayout *)&v4 init]) {
    operator new();
  }
  return 0;
}

@end