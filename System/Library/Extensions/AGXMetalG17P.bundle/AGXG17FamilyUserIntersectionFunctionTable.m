@interface AGXG17FamilyUserIntersectionFunctionTable
- (AGXG17FamilyUserIntersectionFunctionTable)initWithDevice:(id)a3 numTableFnSlots:(int)a4 pipelineSets:(shared_ptr<const AGX:(id)a6 :(int)a7 HAL200:(unsigned int)a8 :IntersectionPipelineSets>)a5 pipeline:stage:resourceIndex:;
- (AGXG17FamilyUserIntersectionFunctionTable)initWithDevice:(id)a3 originalTable:(id)a4 cloneTableHeap:(void *)a5 slProgramsTracker:(void *)a6;
- (id)clone:(id)a3 cloneTableHeap:(void *)a4 slProgramsTracker:(void *)a5;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation AGXG17FamilyUserIntersectionFunctionTable

- (unint64_t)resourceIndex
{
  return *((unsigned int *)self->_impl + 40);
}

- (unint64_t)uniqueIdentifier
{
  return *((void *)self->_impl + 1) >> 6;
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  unint64_t result = *(void *)(*((void *)self->_impl + 10) + 8 * a3);
  if (result) {
    BOOL v4 = result == 291945216;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  return result;
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    int location = a4.location;
    char v6 = a3;
    do
    {
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setOpaqueIntersectionFunction((uint64_t)self->_impl, 1, v6, location++);
      --length;
    }
    while (length);
  }
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    int location = a4.location;
    char v6 = a3;
    do
    {
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setOpaqueIntersectionFunction((uint64_t)self->_impl, 0, v6, location++);
      --length;
    }
    while (length);
  }
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      if (location <= 0x1E)
      {
        impl = self->_impl;
        if (impl[12])
        {
          v9 = (void *)*a3;
          if (*a3) {
            v9 = (void *)[v9 resourceIndex];
          }
          *(void *)(impl[10] + 8 * location) = v9;
        }
      }
      ++location;
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  if (a4 <= 0x1E)
  {
    impl = self->_impl;
    if (impl[12])
    {
      if (a3) {
        uint64_t v6 = [a3 resourceIndex];
      }
      else {
        uint64_t v6 = 0;
      }
      *(void *)(impl[10] + 8 * v4) = v6;
    }
  }
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setFunction((uint64_t)self->_impl, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    impl = self->_impl;
    if (impl[12])
    {
      uint64_t v6 = (int *)MEMORY[0x263F4B188];
      do
      {
        uint64_t v9 = *a4++;
        uint64_t v8 = v9;
        if (LODWORD(a5.location) <= 0x1E)
        {
          if (*a3) {
            uint64_t v7 = *(void *)((char *)*a3 + *v6 + 8) + v8;
          }
          else {
            uint64_t v7 = 291945216;
          }
          *(void *)(impl[10] + 8 * LODWORD(a5.location)) = v7;
        }
        ++LODWORD(a5.location);
        ++a3;
        --a5.length;
      }
      while (a5.length);
    }
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a5 <= 0x1E)
  {
    impl = self->_impl;
    if (impl[12])
    {
      if (a3) {
        unint64_t v6 = *(void *)((char *)a3 + *MEMORY[0x263F4B188] + 8) + a4;
      }
      else {
        unint64_t v6 = 291945216;
      }
      *(void *)(impl[10] + 8 * a5) = v6;
    }
  }
}

- (void)dealloc
{
  pipelineState = (os_unfair_lock_s *)self->_pipelineState;
  if (pipelineState)
  {
    if (self->_stage)
    {
      unsigned int v4 = pipelineState + 36;
      v5 = pipelineState + 217;
      os_unfair_lock_lock(pipelineState + 217);
      unint64_t v6 = [(AGXG17FamilyUserIntersectionFunctionTable *)self resourceIndex];
      uint64_t v7 = (uint64_t *)&v4[692];
    }
    else
    {
      uint64_t v8 = pipelineState + 16;
      v5 = pipelineState + 24;
      os_unfair_lock_lock(pipelineState + 24);
      unint64_t v6 = [(AGXG17FamilyUserIntersectionFunctionTable *)self resourceIndex];
      uint64_t v7 = (uint64_t *)&v8[134];
    }
    std::__hash_table<std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,AGX::FunctionCompiledEventInfo>>>::__erase_unique<unsigned long>(v7, v6);
    os_unfair_lock_unlock(v5);

    self->_pipelineState = 0;
  }
  impl = (char *)self->_impl;
  if (impl)
  {
    v10 = (void *)*((void *)impl + 8);
    if (v10)
    {
      free(v10);
      *((void *)impl + 8) = 0;
    }
    if (*((void *)impl + 17))
    {
      bzero(*((void **)impl + 15), *((void *)impl + 16));
      if (*((void *)impl + 17))
      {
        uint64_t v11 = *((void *)impl + 18);
        v12 = *(NSObject **)(v11 + 16);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = ___ZN3AGX4HeapILb0EE14deallocateImplERKNS1_10AllocationE_block_invoke;
        block[3] = &__block_descriptor_48_e5_v8__0l;
        block[4] = v11;
        block[5] = impl + 112;
        dispatch_sync(v12, block);
        *((_OWORD *)impl + 8) = 0u;
        *((_OWORD *)impl + 9) = 0u;
        *((_OWORD *)impl + 7) = 0u;
      }
    }
    if (*((_DWORD *)impl + 40) && !impl[176])
    {
      v13 = (os_unfair_lock_s *)(*((void *)impl + 21) + 40);
      os_unfair_lock_lock(v13);
      uint64_t v14 = *((void *)impl + 21);
      uint64_t v15 = *((unsigned int *)impl + 40);
      uint64_t v16 = *(void *)(v14 + 32);
      v17 = (int *)MEMORY[0x263F4B188];
      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v14 + 24) + 8) + (int)*MEMORY[0x263F4B188] + 24) + 8 * v15) = v16;
      uint64_t v18 = v16;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v14 + 32), (unint64_t *)&v18, (v16 & 0xFFFFFFFF00000000 | v15) + 0x100000000);
      if (v18 != v16)
      {
        uint64_t v19 = v18;
        do
        {
          *(_DWORD *)(*(void *)(*(void *)(*(void *)(v14 + 24) + 8) + *v17 + 24) + 8 * v15) = v18;
          atomic_compare_exchange_strong((atomic_ullong *volatile)(v14 + 32), (unint64_t *)&v19, (v18 & 0xFFFFFFFF00000000 | v15) + 0x100000000);
          BOOL v20 = v19 == v18;
          uint64_t v18 = v19;
        }
        while (!v20);
      }
      os_unfair_lock_unlock(v13);
    }

    v21 = (std::__shared_weak_count *)*((void *)impl + 7);
    if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
    MEMORY[0x24566ED90](impl, 0x10F0C40C7DEBF42);
  }
  self->_impl = 0;
  v22.receiver = self;
  v22.super_class = (Class)AGXG17FamilyUserIntersectionFunctionTable;
  [(IOGPUMetalIntersectionFunctionTable *)&v22 dealloc];
}

- (id)clone:(id)a3 cloneTableHeap:(void *)a4 slProgramsTracker:(void *)a5
{
  uint64_t v9 = [AGXG17FamilyUserIntersectionFunctionTable alloc];

  return [(AGXG17FamilyUserIntersectionFunctionTable *)v9 initWithDevice:a3 originalTable:self cloneTableHeap:a4 slProgramsTracker:a5];
}

- (AGXG17FamilyUserIntersectionFunctionTable)initWithDevice:(id)a3 originalTable:(id)a4 cloneTableHeap:(void *)a5 slProgramsTracker:(void *)a6
{
  AGX::Heap<false>::allocateImpl(&v7, *(void *)(*((void *)a3 + 101) + 5144) + 8, ((*(_DWORD *)(*((void *)a4 + 37) + 28) << 6) + 64));
  operator new();
}

- (AGXG17FamilyUserIntersectionFunctionTable)initWithDevice:(id)a3 numTableFnSlots:(int)a4 pipelineSets:(shared_ptr<const AGX:(id)a6 :(int)a7 HAL200:(unsigned int)a8 :IntersectionPipelineSets>)a5 pipeline:stage:resourceIndex:
{
  var0 = a5.var0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  self->_stage = (int)a6;
  self->_pipelineState = a5.var1;
  uint64_t v11 = *(void *)(*((void *)a3 + 101) + 5144);
  uint64_t v12 = *((void *)var0 + 1);
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  AGX::Heap<false>::allocateImpl(&v14, v11 + 8, ((a4 << 6) + 64));
  operator new();
}

@end