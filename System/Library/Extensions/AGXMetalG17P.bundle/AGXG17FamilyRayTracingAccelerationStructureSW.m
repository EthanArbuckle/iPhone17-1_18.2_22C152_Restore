@interface AGXG17FamilyRayTracingAccelerationStructureSW
- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5;
- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5 resourceIndex:(unint64_t)a6;
- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6;
- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 src:(id)a4;
- (id).cxx_construct;
- (unint64_t)accelerationStructureUniqueIdentifier;
- (void)dealloc;
@end

@implementation AGXG17FamilyRayTracingAccelerationStructureSW

- (id).cxx_construct
{
  *((_DWORD *)self + 80) = 0;
  *((void *)self + 41) = 0;
  *((unsigned char *)self + 336) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  if (LODWORD(self->_impl.bvh_heap_allocation.buffer_.address.gpu)
    && !LOBYTE(self->_impl.bvh_heap_allocation.buffer_.size))
  {
    v3 = (os_unfair_lock_s *)(self->_impl.bvh_heap_allocation.buffer_.address.cpu + 40);
    os_unfair_lock_lock(v3);
    cpu = p_impl->bvh_heap_allocation.buffer_.address.cpu;
    uint64_t gpu_low = LODWORD(p_impl->bvh_heap_allocation.buffer_.address.gpu);
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

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AGXG17FamilyRayTracingAccelerationStructureSW;
  [(IOGPUMetalAccelerationStructure *)&v2 dealloc];
}

- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6
{
  result = (AGXG17FamilyRayTracingAccelerationStructureSW *)[a3 newBufferWithLength:a4 options:16 * a6];
  if (result)
  {
    BOOL v10 = result;
    v11 = [(AGXG17FamilyRayTracingAccelerationStructureSW *)self initWithBuffer:result offset:0 device:a3 resourceIndex:a5];

    return v11;
  }
  return result;
}

- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 src:(id)a4
{
  uint64_t v7 = [a4 buffer];
  uint64_t v8 = [a4 bufferOffset];
  uint64_t v9 = (int)*MEMORY[0x263F4B188];
  uint64_t v10 = *(void *)(v7 + v9 + 8);
  v11 = (os_unfair_lock_s *)(*((void *)a3 + 101) + 6280);
  uint64_t v12 = [a4 size];
  AGX::Mempool<16u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v29, v11, 0);
  uint64_t v32 = v12;
  v13 = (os_unfair_lock_s *)(v30 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v30 + 10);
  *(void *)(*(void *)(*((void *)v30 + 1) + v9 + 24) + 8 * v29) = v10;
  os_unfair_lock_unlock(v13);
  v28.receiver = self;
  v28.super_class = (Class)AGXG17FamilyRayTracingAccelerationStructureSW;
  v14 = [(IOGPUMetalAccelerationStructure *)&v28 initWithBuffer:v7 offset:v8 resourceIndex:v29];
  v15 = v14;
  if (v14)
  {
    unsigned int gpu = v14->_impl.bvh_heap_allocation.buffer_.address.gpu;
    LODWORD(v14->_impl.bvh_heap_allocation.buffer_.address.gpu) = v29;
    unsigned int v29 = gpu;
    cpu = v14->_impl.bvh_heap_allocation.buffer_.address.cpu;
    v14->_impl.bvh_heap_allocation.buffer_.address.cpu = v30;
    v30 = cpu;
    LOBYTE(cpu) = v14->_impl.bvh_heap_allocation.buffer_.size;
    LOBYTE(v14->_impl.bvh_heap_allocation.buffer_.size) = v31;
    char v31 = (char)cpu;
    v14->_impl.bvh_heap_allocation.resource_ = (_Resource *)v32;
  }
  if (v29 && !v31)
  {
    v18 = (os_unfair_lock_s *)(v30 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)v30 + 10);
    v19 = v30;
    uint64_t v20 = v29;
    v21 = (atomic_ullong *)(v30 + 32);
    uint64_t v22 = *((void *)v30 + 4);
    uint64_t v23 = 8 * v29;
    *(_DWORD *)(*(void *)(*(void *)(*((void *)v30 + 3) + 8) + v9 + 24) + v23) = v22;
    uint64_t v24 = v22;
    atomic_compare_exchange_strong(v21, (unint64_t *)&v24, (v22 & 0xFFFFFFFF00000000 | v20) + 0x100000000);
    if (v24 != v22)
    {
      uint64_t v25 = v24;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*((void *)v19 + 3) + 8) + v9 + 24) + v23) = v24;
        atomic_compare_exchange_strong((atomic_ullong *volatile)v19 + 4, (unint64_t *)&v25, (v24 & 0xFFFFFFFF00000000 | v20) + 0x100000000);
        BOOL v26 = v25 == v24;
        uint64_t v24 = v25;
      }
      while (!v26);
    }
    os_unfair_lock_unlock(v18);
  }
  return v15;
}

- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5
{
  return [(AGXG17FamilyRayTracingAccelerationStructureSW *)self initWithBuffer:a3 offset:a4 device:a5 resourceIndex:0];
}

- (AGXG17FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5 resourceIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  uint64_t v11 = (int)*MEMORY[0x263F4B188];
  uint64_t v12 = *(void *)((char *)a3 + v11 + 8);
  uint64_t v13 = [a3 length];
  AGX::Mempool<16u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v30, (os_unfair_lock_s *)(*((void *)a5 + 101) + 6280), v6);
  uint64_t v33 = v13;
  v14 = (os_unfair_lock_s *)(v31 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v31 + 10);
  *(void *)(*(void *)(*((void *)v31 + 1) + v11 + 24) + 8 * v30) = v12;
  os_unfair_lock_unlock(v14);
  v29.receiver = self;
  v29.super_class = (Class)AGXG17FamilyRayTracingAccelerationStructureSW;
  v15 = [(IOGPUMetalAccelerationStructure *)&v29 initWithBuffer:a3 offset:a4 resourceIndex:v30];
  v16 = v15;
  if (v15)
  {
    unsigned int gpu = v15->_impl.bvh_heap_allocation.buffer_.address.gpu;
    LODWORD(v15->_impl.bvh_heap_allocation.buffer_.address.gpu) = v30;
    unsigned int v30 = gpu;
    cpu = v15->_impl.bvh_heap_allocation.buffer_.address.cpu;
    v15->_impl.bvh_heap_allocation.buffer_.address.cpu = v31;
    char v31 = cpu;
    LOBYTE(cpu) = v15->_impl.bvh_heap_allocation.buffer_.size;
    LOBYTE(v15->_impl.bvh_heap_allocation.buffer_.size) = v32;
    char v32 = (char)cpu;
    v15->_impl.bvh_heap_allocation.resource_ = (_Resource *)v33;
  }
  if (v30 && !v32)
  {
    v19 = (os_unfair_lock_s *)(v31 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)v31 + 10);
    uint64_t v20 = v31;
    uint64_t v21 = v30;
    uint64_t v22 = (atomic_ullong *)(v31 + 32);
    uint64_t v23 = *((void *)v31 + 4);
    uint64_t v24 = 8 * v30;
    *(_DWORD *)(*(void *)(*(void *)(*((void *)v31 + 3) + 8) + v11 + 24) + v24) = v23;
    uint64_t v25 = v23;
    atomic_compare_exchange_strong(v22, (unint64_t *)&v25, (v23 & 0xFFFFFFFF00000000 | v21) + 0x100000000);
    if (v25 != v23)
    {
      uint64_t v26 = v25;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*((void *)v20 + 3) + 8) + v11 + 24) + v24) = v25;
        atomic_compare_exchange_strong((atomic_ullong *volatile)v20 + 4, (unint64_t *)&v26, (v25 & 0xFFFFFFFF00000000 | v21) + 0x100000000);
        BOOL v27 = v26 == v25;
        uint64_t v25 = v26;
      }
      while (!v27);
    }
    os_unfair_lock_unlock(v19);
  }
  return v16;
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  p_impl = &self->_impl;
  v3 = (os_unfair_lock_s *)(self->_impl.bvh_heap_allocation.buffer_.address.cpu + 40);
  os_unfair_lock_lock(v3);
  unint64_t v4 = *(void *)(*(void *)(*((void *)p_impl->bvh_heap_allocation.buffer_.address.cpu + 1)
                             + (int)*MEMORY[0x263F4B188]
                             + 24)
                 + 8 * LODWORD(p_impl->bvh_heap_allocation.buffer_.address.gpu));
  os_unfair_lock_unlock(v3);
  return v4;
}

@end