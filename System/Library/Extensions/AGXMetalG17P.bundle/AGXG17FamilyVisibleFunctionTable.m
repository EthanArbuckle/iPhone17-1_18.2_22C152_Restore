@interface AGXG17FamilyVisibleFunctionTable
- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 clonedResourceIndex:(unint64_t)a7 clonedVisibleFunctionHeap:(void *)a8 type:(int)a9;
- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 stage:(unint64_t)a9;
- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 type:(int)a9;
- (id).cxx_construct;
- (id)clone:(id)a3 clonedResourceIndex:(unint64_t)a4 clonedVisibleFunctionHeap:(void *)a5 cloneHandleMap:(void *)a6;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)gpuAddress;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation AGXG17FamilyVisibleFunctionTable

- (id).cxx_construct
{
  *((_DWORD *)self + 88) = 0;
  *((void *)self + 45) = 0;
  *((unsigned char *)self + 368) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  if (LODWORD(self->_impl.resource_indirection_heap_allocation.buffer_.address.gpu)
    && !LOBYTE(self->_impl.resource_indirection_heap_allocation.buffer_.size))
  {
    v3 = (os_unfair_lock_s *)(self->_impl.resource_indirection_heap_allocation.buffer_.address.cpu + 40);
    os_unfair_lock_lock(v3);
    cpu = p_impl->resource_indirection_heap_allocation.buffer_.address.cpu;
    uint64_t gpu_low = LODWORD(p_impl->resource_indirection_heap_allocation.buffer_.address.gpu);
    uint64_t v6 = *((void *)cpu + 4);
    v7 = (int *)MEMORY[0x263F4B188];
    *(_DWORD *)(*(void *)(*(void *)(*((void *)cpu + 3) + 8) + (int)*MEMORY[0x263F4B188] + 24) + 8 * gpu_low) = v6;
    uint64_t v8 = v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)cpu + 4, (unint64_t *)&v8, (v6 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000);
    if (v8 != v6)
    {
      uint64_t v9 = v8;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*((void *)cpu + 3) + 8) + *v7 + 24) + 8 * gpu_low) = v8;
        atomic_compare_exchange_strong((atomic_ullong *volatile)cpu + 4, (unint64_t *)&v9, (v8 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000);
        BOOL v10 = v9 == v8;
        uint64_t v8 = v9;
      }
      while (!v10);
    }
    os_unfair_lock_unlock(v3);
  }
}

- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.super._allocationType + (int)*MEMORY[0x263F4B188])
       + 256;
    if (a4.length <= 9)
    {
      NSUInteger v5 = 0;
LABEL_9:
      NSUInteger v10 = a4.length - v5;
      NSUInteger v11 = a4.location + v5;
      do
      {
        *(void *)(v4 + 8 * v11++) = a3;
        --v10;
      }
      while (v10);
      return;
    }
    NSUInteger v5 = 0;
    if (__CFADD__(a4.location, LODWORD(a4.length) - 1)) {
      goto LABEL_9;
    }
    if ((a4.length - 1) >> 32) {
      goto LABEL_9;
    }
    NSUInteger v5 = a4.length & 0xFFFFFFFFFFFFFFFCLL;
    int64x2_t v6 = vdupq_n_s64(a3);
    NSUInteger location = a4.location;
    NSUInteger v8 = a4.length & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      uint64_t v9 = (int64x2_t *)(v4 + 8 * location);
      *uint64_t v9 = v6;
      v9[1] = v6;
      location += 4;
      v8 -= 4;
    }
    while (v8);
    if (a4.length != v5) {
      goto LABEL_9;
    }
  }
}

- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
  *(void *)(*(unint64_t *)((char *)&self->super.super.super.super.super._allocationType
                                  + (int)*MEMORY[0x263F4B188])
            + 8 * a4
            + 256) = a3;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    uint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.super._allocationType + (int)*MEMORY[0x263F4B188]);
    do
    {
      if (*a3) {
        uint64_t v5 = *((unsigned int *)*a3 + 88);
      }
      else {
        uint64_t v5 = 291945216;
      }
      *(void *)(v4 + 8 * LODWORD(a4.location) + 8) = v5;
      ++a4.location;
      ++a3;
      --a4.length;
    }
    while (a4.length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 88);
  }
  else {
    uint64_t v4 = 291945216;
  }
  *(void *)(*(unint64_t *)((char *)&self->super.super.super.super.super._allocationType
                                  + (int)*MEMORY[0x263F4B188])
            + 8 * a4
            + 8) = v4;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    uint64_t v5 = (int)*MEMORY[0x263F4B188];
    uint64_t v6 = *(unint64_t *)((char *)&self->super.super.super.super.super._allocationType + v5);
    do
    {
      if (*a3) {
        unint64_t v7 = *(void *)((char *)*a3 + v5 + 8) + *a4;
      }
      else {
        unint64_t v7 = 291945216;
      }
      *(void *)(v6 + 8 * LODWORD(a5.location) + 8) = v7;
      ++a4;
      ++a5.location;
      ++a3;
      --a5.length;
    }
    while (a5.length);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5 = (int)*MEMORY[0x263F4B188];
  uint64_t v6 = *(unint64_t *)((char *)&self->super.super.super.super.super._allocationType + v5);
  if (a3) {
    unint64_t v7 = *(void *)((char *)a3 + v5 + 8) + a4;
  }
  else {
    unint64_t v7 = 291945216;
  }
  *(void *)(v6 + 8 * a5 + 8) = v7;
}

- (unint64_t)gpuAddress
{
  return LODWORD(self->_impl.resource_indirection_heap_allocation.buffer_.address.gpu);
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  if (*(void *)(*(unint64_t *)((char *)&self->super.super.super.super.super._allocationType
                                       + (int)*MEMORY[0x263F4B188])
                 + 8 * a3
                 + 8) == 291945216)
    return 0;
  else {
    return *(void *)(*(unint64_t *)((char *)&self->super.super.super.super.super._allocationType
  }
                                           + (int)*MEMORY[0x263F4B188])
                     + 8 * a3
                     + 8);
}

- (unint64_t)resourceIndex
{
  return LODWORD(self->_impl.resource_indirection_heap_allocation.buffer_.address.gpu);
}

- (unint64_t)uniqueIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super._label + (int)*MEMORY[0x263F4B188]);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.super._allocationType + (int)*MEMORY[0x263F4B188])
       + 256;
    do
    {
      uint64_t v5 = *a3;
      if (*a3) {
        uint64_t v5 = (void *)v5[5];
      }
      *(void *)(v4 + 8 * LODWORD(a4.location)) = v5;
      ++a4.location;
      ++a3;
      --a4.length;
    }
    while (a4.length);
  }
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((void *)a3 + 5);
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(*(unint64_t *)((char *)&self->super.super.super.super.super._allocationType
                                  + (int)*MEMORY[0x263F4B188])
            + 8 * a4
            + 256) = v4;
}

- (void)dealloc
{
  heap = (os_unfair_lock_s *)self->_impl.resource_indirection_heap_allocation.heap_;
  if (heap)
  {
    if (LODWORD(self->_impl.resource_indirection_heap_allocation.resource_))
    {
      uint64_t v4 = heap + 36;
      uint64_t v5 = heap + 216;
      os_unfair_lock_lock(heap + 216);
      unint64_t v6 = [(AGXG17FamilyVisibleFunctionTable *)self resourceIndex];
      unint64_t v7 = (uint64_t *)&v4[680];
    }
    else
    {
      NSUInteger v8 = heap + 16;
      uint64_t v5 = heap + 23;
      os_unfair_lock_lock(heap + 23);
      unint64_t v6 = [(AGXG17FamilyVisibleFunctionTable *)self resourceIndex];
      unint64_t v7 = (uint64_t *)&v8[122];
    }
    std::__hash_table<std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>>>::__erase_unique<unsigned long>(v7, v6);
    os_unfair_lock_unlock(v5);
  }
  v9.receiver = self;
  v9.super_class = (Class)AGXG17FamilyVisibleFunctionTable;
  [(IOGPUMetalBuffer *)&v9 dealloc];
}

- (id)clone:(id)a3 clonedResourceIndex:(unint64_t)a4 clonedVisibleFunctionHeap:(void *)a5 cloneHandleMap:(void *)a6
{
  uint64_t v11 = (int)*MEMORY[0x263F4B188];
  v12 = (const void **)((char *)&self->super.super.super.super.super.super.super.isa + v11);
  uint64_t v13 = **(unsigned int **)((char *)&self->super.super.super.super.super._allocationType + v11);
  v14 = [AGXG17FamilyVisibleFunctionTable alloc];
  LODWORD(v40) = self->_impl.resource_indirection_heap_allocation.resource_;
  v41 = [(AGXG17FamilyVisibleFunctionTable *)v14 initWithDevice:a3 functionCount:v13 options:0 isSuballocDisabled:*(unsigned __int8 *)(*((void *)a3 + 101) + 7805) clonedResourceIndex:a4 clonedVisibleFunctionHeap:a5 type:v40];
  v15 = (char *)v41 + v11;
  memcpy(*(void **)((char *)&v41->super.super.super.super.super._allocationType + v11), v12[3], 8 * v13 + 256);
  *v12 = 0;
  v12[2] = (const void *)((unint64_t)v12[2] & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000);
  if (v13)
  {
    uint64_t v16 = 0;
    v17 = (char *)a6 + 16;
    while (1)
    {
      uint64_t v18 = *((void *)v15 + 3);
      unint64_t v19 = *(void *)(v18 + 8 * v16 + 256);
      if (v19) {
        break;
      }
LABEL_4:
      if (++v16 == v13) {
        return v41;
      }
    }
    unint64_t v20 = *((void *)a6 + 1);
    if (v20)
    {
      uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        a3 = *(id *)(v18 + 8 * v16 + 256);
        if (v19 >= v20) {
          a3 = (id)(v19 % v20);
        }
      }
      else
      {
        a3 = (id)((v20 - 1) & v19);
      }
      v22 = *(void ***)(*(void *)a6 + 8 * (void)a3);
      if (v22)
      {
        v23 = *v22;
        if (*v22)
        {
          if (v21.u32[0] < 2uLL)
          {
            while (1)
            {
              unint64_t v25 = v23[1];
              if (v25 == v19)
              {
                if (v23[2] == v19) {
                  goto LABEL_64;
                }
              }
              else if ((id)(v25 & (v20 - 1)) != a3)
              {
                goto LABEL_26;
              }
              v23 = (void *)*v23;
              if (!v23) {
                goto LABEL_26;
              }
            }
          }
          do
          {
            unint64_t v24 = v23[1];
            if (v24 == v19)
            {
              if (v23[2] == v19) {
                goto LABEL_64;
              }
            }
            else
            {
              if (v24 >= v20) {
                v24 %= v20;
              }
              if ((id)v24 != a3) {
                break;
              }
            }
            v23 = (void *)*v23;
          }
          while (v23);
        }
      }
    }
LABEL_26:
    v23 = operator new(0x20uLL);
    void *v23 = 0;
    v23[1] = v19;
    v23[2] = v19;
    v23[3] = 0;
    float v26 = (float)(unint64_t)(*((void *)a6 + 3) + 1);
    float v27 = *((float *)a6 + 8);
    if (!v20 || (float)(v27 * (float)v20) < v26)
    {
      BOOL v28 = (v20 & (v20 - 1)) != 0;
      if (v20 < 3) {
        BOOL v28 = 1;
      }
      unint64_t v29 = v28 | (2 * v20);
      unint64_t v30 = vcvtps_u32_f32(v26 / v27);
      if (v29 <= v30) {
        size_t prime = v30;
      }
      else {
        size_t prime = v29;
      }
      if (prime == 1)
      {
        size_t prime = 2;
      }
      else if ((prime & (prime - 1)) != 0)
      {
        size_t prime = std::__next_prime(prime);
        unint64_t v20 = *((void *)a6 + 1);
      }
      if (prime > v20) {
        goto LABEL_38;
      }
      if (prime < v20)
      {
        unint64_t v32 = vcvtps_u32_f32((float)*((unint64_t *)a6 + 3) / *((float *)a6 + 8));
        if (v20 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
        {
          unint64_t v32 = std::__next_prime(v32);
        }
        else
        {
          uint64_t v34 = 1 << -(char)__clz(v32 - 1);
          if (v32 >= 2) {
            unint64_t v32 = v34;
          }
        }
        if (prime <= v32) {
          size_t prime = v32;
        }
        if (prime < v20) {
LABEL_38:
        }
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)a6, prime);
      }
      unint64_t v20 = *((void *)a6 + 1);
      if ((v20 & (v20 - 1)) != 0)
      {
        if (v19 >= v20) {
          a3 = (id)(v19 % v20);
        }
        else {
          a3 = (id)v19;
        }
      }
      else
      {
        a3 = (id)((v20 - 1) & v19);
      }
    }
    uint64_t v35 = *(void *)a6;
    v36 = *(void **)(*(void *)a6 + 8 * (void)a3);
    if (v36)
    {
      void *v23 = *v36;
    }
    else
    {
      void *v23 = *v17;
      void *v17 = v23;
      *(void *)(v35 + 8 * (void)a3) = v17;
      if (!*v23) {
        goto LABEL_63;
      }
      unint64_t v37 = *(void *)(*v23 + 8);
      if ((v20 & (v20 - 1)) != 0)
      {
        if (v37 >= v20) {
          v37 %= v20;
        }
      }
      else
      {
        v37 &= v20 - 1;
      }
      v36 = (void *)(*(void *)a6 + 8 * v37);
    }
    void *v36 = v23;
LABEL_63:
    ++*((void *)a6 + 3);
    uint64_t v18 = *((void *)v15 + 3);
LABEL_64:
    uint64_t v38 = v23[3];
    if (v38) {
      uint64_t v38 = *(void *)(v38 + 40);
    }
    *(void *)(v18 + 8 * v16 + 256) = v38;
    goto LABEL_4;
  }
  return v41;
}

- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 clonedResourceIndex:(unint64_t)a7 clonedVisibleFunctionHeap:(void *)a8 type:(int)a9
{
  unsigned int v10 = a7;
  int v11 = a4;
  v32[11] = 0;
  v12 = initializeWithDevice<AGXG17FamilyVisibleFunctionTable>(self, a3, 8 * a4 + 256, a5, a6, (uint64_t)v32);
  uint64_t v13 = (int)*MEMORY[0x263F4B188];
  v14 = &v12[v13];
  v15 = *(_DWORD **)&v12[v13 + 24];
  AGX::Mempool<32u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v33, (os_unfair_lock_s *)a8, v10);
  unsigned int v16 = *((_DWORD *)v12 + 88);
  *((_DWORD *)v12 + 88) = v33;
  unsigned int v33 = v16;
  v17 = (os_unfair_lock_s *)*((void *)v12 + 45);
  uint64_t v18 = v34;
  *((void *)v12 + 45) = v34;
  uint64_t v34 = v17;
  int v19 = v12[368];
  v12[368] = v35;
  char v35 = v19;
  if (v16) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    uint8x8_t v21 = v17 + 10;
    os_unfair_lock_lock(v17 + 10);
    v22 = v34;
    uint64_t v23 = v33;
    unint64_t v24 = (atomic_ullong *)&v34[8];
    uint64_t v25 = *(void *)&v34[8]._os_unfair_lock_opaque;
    uint64_t v26 = 8 * v33;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)&v34[6]._os_unfair_lock_opaque + 8) + v13 + 24) + v26) = v25;
    uint64_t v27 = v25;
    atomic_compare_exchange_strong(v24, (unint64_t *)&v27, (v25 & 0xFFFFFFFF00000000 | v23) + 0x100000000);
    if (v27 != v25)
    {
      uint64_t v28 = v27;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)&v22[6]._os_unfair_lock_opaque + 8) + v13 + 24) + v26) = v27;
        atomic_compare_exchange_strong((atomic_ullong *volatile)&v22[8], (unint64_t *)&v28, (v27 & 0xFFFFFFFF00000000 | v23) + 0x100000000);
        BOOL v20 = v28 == v27;
        uint64_t v27 = v28;
      }
      while (!v20);
    }
    os_unfair_lock_unlock(v21);
    uint64_t v18 = (os_unfair_lock_s *)*((void *)v12 + 45);
  }
  uint64_t v29 = *((void *)v14 + 1);
  unint64_t v30 = v18 + 10;
  os_unfair_lock_lock(v18 + 10);
  *(void *)(*(void *)(*(void *)(*((void *)v12 + 45) + 8) + v13 + 24) + 8 * *((unsigned int *)v12 + 88)) = v29;
  os_unfair_lock_unlock(v30);
  _DWORD *v15 = v11;
  memset_pattern16(v15 + 2, &unk_242EA8900, 0xF8uLL);
  *((_DWORD *)v12 + 94) = a9;
  *((void *)v12 + 48) = 0;
  *(void *)&v12[v13] = 0;
  *((void *)v14 + 2) = *((void *)v14 + 2) & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000;
  return (AGXG17FamilyVisibleFunctionTable *)v12;
}

- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 stage:(unint64_t)a9
{
  if ((a9 & (a9 - 1)) != 0) {
    return 0;
  }
  else {
    return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:](self, "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", a3, a4, a5, a6, a7, a8);
  }
}

- (AGXG17FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 type:(int)a9
{
  unsigned int v10 = a7;
  int v11 = a4;
  uint64_t v42 = 0;
  uint64_t v13 = initializeWithDevice<AGXG17FamilyVisibleFunctionTable>(self, a3, 8 * a4 + 256, a5, a6, (uint64_t)v41);
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  uint64_t v38 = __125__AGXG17FamilyVisibleFunctionTable_initWithDevice_functionCount_options_isSuballocDisabled_resourceIndex_pipelineState_type___block_invoke;
  v39 = &unk_265170D78;
  id v40 = a3;
  if (-[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]::once != -1) {
    dispatch_once(&-[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]::once, &v36);
  }
  uint64_t v14 = (int)*MEMORY[0x263F4B188];
  v15 = &v13[v14];
  unsigned int v16 = *(_DWORD **)&v13[v14 + 24];
  AGX::Mempool<32u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v43, (os_unfair_lock_s *)(*((void *)a3 + 101) + 6472), v10);
  int v17 = *((_DWORD *)v13 + 88);
  *((_DWORD *)v13 + 88) = v43;
  LODWORD(v43) = v17;
  uint64_t v18 = (os_unfair_lock_s *)*((void *)v13 + 45);
  int v19 = v44;
  *((void *)v13 + 45) = v44;
  v44 = v18;
  int v20 = v13[368];
  v13[368] = v45;
  char v45 = v20;
  if (v17 && !v20)
  {
    uint8x8_t v21 = v18 + 10;
    os_unfair_lock_lock(v18 + 10);
    v22 = v44;
    uint64_t v23 = v43;
    uint64_t v24 = *(void *)&v44[8]._os_unfair_lock_opaque;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)&v44[6]._os_unfair_lock_opaque + 8) + v14 + 24)
              + 8 * v43) = v24;
    uint64_t v25 = v24;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&v22[8], (unint64_t *)&v25, (v24 & 0xFFFFFFFF00000000 | v23) + 0x100000000);
    if (v25 != v24)
    {
      uint64_t v26 = v25;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)&v22[6]._os_unfair_lock_opaque + 8) + v14 + 24) + 8 * v23) = v25;
        atomic_compare_exchange_strong((atomic_ullong *volatile)&v22[8], (unint64_t *)&v26, (v25 & 0xFFFFFFFF00000000 | v23) + 0x100000000);
        BOOL v27 = v26 == v25;
        uint64_t v25 = v26;
      }
      while (!v27);
    }
    os_unfair_lock_unlock(v21);
    int v19 = (os_unfair_lock_s *)*((void *)v13 + 45);
  }
  uint64_t v28 = *((void *)v15 + 1);
  uint64_t v29 = v19 + 10;
  os_unfair_lock_lock(v19 + 10);
  *(void *)(*(void *)(*(void *)(*((void *)v13 + 45) + 8) + v14 + 24) + 8 * *((unsigned int *)v13 + 88)) = v28;
  os_unfair_lock_unlock(v29);
  *unsigned int v16 = v11;
  memset_pattern16(v16 + 2, &unk_242EA8900, 0xF8uLL);
  *((_DWORD *)v13 + 94) = a9;
  unint64_t v30 = (os_unfair_lock_s *)a8;
  *((void *)v13 + 48) = v30;
  if (*((_DWORD *)v13 + 94))
  {
    v31 = v30 + 36;
    unint64_t v32 = v30 + 216;
    os_unfair_lock_lock(v30 + 216);
    unint64_t v43 = objc_msgSend(v13, "resourceIndex", v36, v37, v38, v39, v40);
    unsigned int v33 = std::__hash_table<std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v31[680], v43, &v43);
  }
  else
  {
    uint64_t v34 = v30 + 16;
    unint64_t v32 = v30 + 23;
    os_unfair_lock_lock(v30 + 23);
    unint64_t v43 = objc_msgSend(v13, "resourceIndex", v36, v37, v38, v39, v40);
    unsigned int v33 = std::__hash_table<std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXG17FamilyVisibleFunctionTable *>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v34[122], v43, &v43);
  }
  v33[3] = v13;
  os_unfair_lock_unlock(v32);
  *(void *)v15 = 0;
  *((void *)v15 + 2) = *((void *)v15 + 2) & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000;
  return (AGXG17FamilyVisibleFunctionTable *)v13;
}

void __125__AGXG17FamilyVisibleFunctionTable_initWithDevice_functionCount_options_isSuballocDisabled_resourceIndex_pipelineState_type___block_invoke(uint64_t a1)
{
  v1 = *(uint64_t **)(*(void *)(a1 + 32) + 808);
  v2 = (unsigned char *)v1[825];
  v3 = (unsigned char *)v1[826];
  if (v2 != v3)
  {
    AGX::Mempool<32u,0u,true,unsigned long long>::AtomicList::reserve(v1 + 812, v2, (v3 - v2) >> 3);
    v1[826] = v1[825];
  }
}

@end