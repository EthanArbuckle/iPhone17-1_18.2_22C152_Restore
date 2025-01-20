@interface AGXG17FamilyRayTracingAccelerationStructure
- (AGXG17FamilyRayTracingAccelerationStructure)initWithBuffer:(id)a3 device:(id)a4 length:(unint64_t)a5 resourceIndex:(unint64_t)a6;
- (AGXG17FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4;
- (AGXG17FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6;
- (id).cxx_construct;
- (unint64_t)accelerationStructureUniqueIdentifier;
- (void)dealloc;
@end

@implementation AGXG17FamilyRayTracingAccelerationStructure

- (id).cxx_construct
{
  *((void *)self + 44) = 0;
  *((unsigned char *)self + 360) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 40) = 0;
  *((_DWORD *)self + 86) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  if (LODWORD(self->_impl.bvh_state_heap_allocation.buffer_.address.gpu)
    && !LOBYTE(self->_impl.bvh_state_heap_allocation.buffer_.size))
  {
    v3 = (os_unfair_lock_s *)(self->_impl.bvh_state_heap_allocation.buffer_.address.cpu + 40);
    os_unfair_lock_lock(v3);
    cpu = p_impl->bvh_state_heap_allocation.buffer_.address.cpu;
    uint64_t gpu_low = LODWORD(p_impl->bvh_state_heap_allocation.buffer_.address.gpu);
    uint64_t v6 = *((void *)cpu + 4);
    v7 = (int *)MEMORY[0x263F4B188];
    *(_DWORD *)(*(void *)(*(void *)(*((void *)cpu + 3) + 8) + (int)*MEMORY[0x263F4B188] + 24) + 16 * gpu_low) = v6;
    uint64_t v8 = v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)cpu + 4, (unint64_t *)&v8, (v6 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000);
    if (v8 != v6)
    {
      uint64_t v9 = v8;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*((void *)cpu + 3) + 8) + *v7 + 24) + 16 * gpu_low) = v8;
        atomic_compare_exchange_strong((atomic_ullong *volatile)cpu + 4, (unint64_t *)&v9, (v8 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000);
        BOOL v10 = v9 == v8;
        uint64_t v8 = v9;
      }
      while (!v10);
    }
    os_unfair_lock_unlock(v3);
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AGXG17FamilyRayTracingAccelerationStructure;
  [(IOGPUMetalAccelerationStructure *)&v2 dealloc];
}

- (AGXG17FamilyRayTracingAccelerationStructure)initWithBuffer:(id)a3 device:(id)a4 length:(unint64_t)a5 resourceIndex:(unint64_t)a6
{
  unint64_t v31 = a5;
  uint64_t v8 = (int)*MEMORY[0x263F4B188];
  uint64_t v9 = *(char **)((char *)a3 + v8 + 24);
  v30.gpu = *(void *)((char *)a3 + v8 + 8);
  v30.cpu = v9;
  AGX::Mempool<16u,0u,true,AGX::HAL200::BVHStateHeapElem>::Allocation::Allocation((uint64_t)&v32, (os_unfair_lock_s *)(*((void *)a4 + 101) + 6216), a6);
  BOOL v10 = (os_unfair_lock_s *)(v33 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v33 + 10);
  v11 = (uint64_t *)(*(void *)(*((void *)v33 + 1) + v8 + 24) + 16 * v32);
  uint64_t *v11 = v30.gpu & 0xFFFFFFFFC000;
  v11[1] = 0;
  os_unfair_lock_unlock(v10);
  v29.receiver = self;
  v29.super_class = (Class)AGXG17FamilyRayTracingAccelerationStructure;
  v12 = [(IOGPUMetalAccelerationStructure *)&v29 initWithBuffer:a3 offset:0 resourceIndex:v32];
  v13 = v12;
  if (v12)
  {
    unint64_t size = v12->_impl.buffer.size;
    AddressView<unsigned char> address = v12->_impl.buffer.address;
    unint64_t v16 = v31;
    v12->_impl.buffer.AddressView<unsigned char> address = v30;
    v12->_impl.buffer.unint64_t size = v16;
    AddressView<unsigned char> v30 = address;
    unint64_t v31 = size;
    LODWORD(size) = v12->_impl.bvh_state_heap_allocation.buffer_.address.gpu;
    LODWORD(v12->_impl.bvh_state_heap_allocation.buffer_.address.gpu) = 0;
    cpu = v12->_impl.bvh_state_heap_allocation.buffer_.address.cpu;
    v12->_impl.bvh_state_heap_allocation.buffer_.address.cpu = 0;
    int size_low = LOBYTE(v12->_impl.bvh_state_heap_allocation.buffer_.size);
    LOBYTE(v12->_impl.bvh_state_heap_allocation.buffer_.size) = 0;
    LODWORD(v12->_impl.bvh_state_heap_allocation.buffer_.address.gpu) = v32;
    v12->_impl.bvh_state_heap_allocation.buffer_.address.cpu = v33;
    LOBYTE(v12->_impl.bvh_state_heap_allocation.buffer_.size) = v34;
    unsigned int v32 = size;
    v33 = cpu;
    unsigned __int8 v34 = size_low;
    if (!size) {
      return v13;
    }
  }
  else
  {
    int size_low = v34;
    if (!v32) {
      return v13;
    }
  }
  if (!size_low)
  {
    v19 = (os_unfair_lock_s *)(v33 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)v33 + 10);
    v20 = v33;
    uint64_t v21 = v32;
    v22 = (atomic_ullong *)(v33 + 32);
    uint64_t v23 = *((void *)v33 + 4);
    uint64_t v24 = 16 * v32;
    *(_DWORD *)(*(void *)(*(void *)(*((void *)v33 + 3) + 8) + v8 + 24) + v24) = v23;
    uint64_t v25 = v23;
    atomic_compare_exchange_strong(v22, (unint64_t *)&v25, (v23 & 0xFFFFFFFF00000000 | v21) + 0x100000000);
    if (v25 != v23)
    {
      uint64_t v26 = v25;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*((void *)v20 + 3) + 8) + v8 + 24) + v24) = v25;
        atomic_compare_exchange_strong((atomic_ullong *volatile)v20 + 4, (unint64_t *)&v26, (v25 & 0xFFFFFFFF00000000 | v21) + 0x100000000);
        BOOL v27 = v26 == v25;
        uint64_t v25 = v26;
      }
      while (!v27);
    }
    os_unfair_lock_unlock(v19);
  }
  return v13;
}

- (AGXG17FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6
{
  v11 = (void *)[(id)objc_opt_new() init];
  [v11 setResourceOptions:16 * a6];
  [v11 setLength:a4];
  [v11 setAlignment:0x4000];
  v12 = (void *)[a3 newBufferWithDescriptor:v11];

  if (!v12) {
    return 0;
  }
  v13 = [(AGXG17FamilyRayTracingAccelerationStructure *)self initWithBuffer:v12 device:a3 length:a4 resourceIndex:a5];

  return v13;
}

- (AGXG17FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4
{
  return [(AGXG17FamilyRayTracingAccelerationStructure *)self initWithDevice:a3 length:a4 resourceIndex:0 storageMode:2];
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return self->_impl.buffer.address.gpu;
}

@end