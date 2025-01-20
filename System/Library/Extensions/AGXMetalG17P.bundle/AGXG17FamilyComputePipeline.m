@interface AGXG17FamilyComputePipeline
- (AGXG17FamilyComputePipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4;
- (AGXG17FamilyComputePipeline)initWithParent:(id)a3;
- (id).cxx_construct;
- (id)functionHandleWithFunction:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)pipelineBinaries;
- (unint64_t)allocatedSize;
- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)resourceIndex;
- (unint64_t)staticThreadgroupMemoryLength;
- (unint64_t)threadExecutionWidth;
- (unint64_t)uniqueIdentifier;
- (unsigned)getComputeKernelTelemetryID;
- (void)dealloc;
@end

@implementation AGXG17FamilyComputePipeline

- (id).cxx_construct
{
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 24) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_DWORD *)self + 40) = 0;
  *((void *)self + 21) = 0;
  *((unsigned char *)self + 176) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  *(_DWORD *)((char *)self + 87) = 0;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0xFFFFFFFF00000001;
  *((void *)self + 37) = 1610612736;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((void *)self + 42) = 0;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)((char *)self + 344) = v2;
  *(_OWORD *)((char *)self + 360) = v2;
  *(_OWORD *)((char *)self + 376) = v2;
  *((_DWORD *)self + 108) = 0;
  *((_DWORD *)self + 98) = 0;
  *((unsigned char *)self + 396) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *(void *)((char *)self + 421) = 0;
  *((void *)self + 50) = 0;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 488) = 0u;
  *((_DWORD *)self + 136) = 1065353216;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *((_DWORD *)self + 146) = 1065353216;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 38) = 0u;
  *((void *)self + 78) = 0;
  *((_DWORD *)self + 158) = 1065353216;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 41) = 0u;
  *((_OWORD *)self + 42) = 0u;
  return self;
}

- (void).cxx_destruct
{
}

- (id)pipelineBinaries
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_impl = &self->_impl;
  if (!self->_impl.compute_variant) {
    return 0;
  }
  if (!AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>(*(void *)&self->_impl.heap_index_ift_map.__table_.__p3_.__value_))
  {
    v19 = @"compute";
    id v9 = objc_alloc(MEMORY[0x263F12AF0]);
    compute_variant = p_impl->compute_variant;
    if (*((char *)compute_variant + 1583) < 0)
    {
      if (*((void *)compute_variant + 196)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)compute_variant + 1583))
    {
LABEL_10:
      id v11 = objc_alloc(MEMORY[0x263EFF8F8]);
      if (*((char *)compute_variant + 1583) < 0)
      {
        v12 = (char *)*((void *)compute_variant + 195);
        uint64_t v13 = *((void *)compute_variant + 196);
      }
      else
      {
        v12 = (char *)compute_variant + 1560;
        uint64_t v13 = *((unsigned __int8 *)compute_variant + 1583);
      }
      uint64_t v17 = [v11 initWithBytes:v12 length:v13];
      compute_variant = p_impl->compute_variant;
      goto LABEL_21;
    }
    uint64_t v17 = 0;
LABEL_21:
    uint64_t v18 = [v9 initWithBinary:v17 uniqueIdentifier:*((void *)compute_variant + 139) debugIdentifier:*((unsigned int *)compute_variant + 276)];
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v20 = @"compute-dynamic-libraries";
    uint64_t PipelineBinaries = AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl->loader_runtime_state.global_binding_table_layout.global_binding_tgbuffers);
    v15 = NSDictionary;
    uint64_t v16 = 2;
    return (id)[v15 dictionaryWithObjects:&v22 forKeys:&v19 count:v16];
  }
  v19 = @"compute";
  id v3 = objc_alloc(MEMORY[0x263F12AF0]);
  v4 = p_impl->compute_variant;
  if (*((char *)v4 + 1583) < 0)
  {
    if (*((void *)v4 + 196)) {
      goto LABEL_5;
    }
  }
  else if (*((unsigned char *)v4 + 1583))
  {
LABEL_5:
    id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
    if (*((char *)v4 + 1583) < 0)
    {
      v6 = (char *)*((void *)v4 + 195);
      uint64_t v7 = *((void *)v4 + 196);
    }
    else
    {
      v6 = (char *)v4 + 1560;
      uint64_t v7 = *((unsigned __int8 *)v4 + 1583);
    }
    uint64_t v14 = [v5 initWithBytes:v6 length:v7];
    v4 = p_impl->compute_variant;
    goto LABEL_16;
  }
  uint64_t v14 = 0;
LABEL_16:
  uint64_t v18 = [v3 initWithBinary:v14 uniqueIdentifier:*((void *)v4 + 139) debugIdentifier:*((unsigned int *)v4 + 276)];
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  v20 = @"compute-dynamic-libraries";
  uint64_t PipelineBinaries = AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl->loader_runtime_state.global_binding_table_layout.global_binding_tgbuffers);
  v21 = @"compute-intersection-functions";
  uint64_t v24 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>(*(void *)&p_impl->heap_index_ift_map.__table_.__p3_.__value_);
  v15 = NSDictionary;
  uint64_t v16 = 3;
  return (id)[v15 dictionaryWithObjects:&v22 forKeys:&v19 count:v16];
}

- (unint64_t)allocatedSize
{
  if (self->_impl.supports_indirect_command_buffers) {
    int v2 = 112;
  }
  else {
    int v2 = 0;
  }
  return (v2 + *((_DWORD *)self->_impl.compute_variant + 790));
}

- (unint64_t)resourceIndex
{
  return LODWORD(self->_impl.resource_indirection_heap_allocation.buffer_.address.cpu);
}

- (unint64_t)uniqueIdentifier
{
  unint64_t result = (unint64_t)&self->_impl;
  if (*(unsigned char *)(result + 24)) {
    return *(void *)(result + 40);
  }
  return result;
}

- (unsigned)getComputeKernelTelemetryID
{
  return *((_DWORD *)self->_impl.compute_variant + 278);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id v5 = [(_MTLComputePipelineState *)self device];
  LODWORD(v7) = 0;
  return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXG17FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, [a3 functionCount], 0, *(unsigned __int8 *)(*((void *)v5 + 101) + 7805), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v5 = [(_MTLComputePipelineState *)self device];
  if ([(MTLDevice *)v5 requiresRaytracingEmulation])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F12A88]);
    objc_msgSend(v6, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
    objc_msgSend(v6, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
    objc_msgSend(v6, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
    id v7 = [(AGXG17FamilyComputePipeline *)self newVisibleFunctionTableWithDescriptor:v6];

    v8 = (void *)[objc_alloc(MEMORY[0x263F4B120]) initWithVisibleFunctionTable:v7];
    return v8;
  }
  else
  {
    if ([a3 forceResourceIndex]) {
      uint64_t v10 = [a3 resourceIndex];
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = [AGXG17FamilyUserIntersectionFunctionTable alloc];
    uint64_t v12 = [a3 functionCount];
    ptr = self->_impl.intersection_pipeline_sets.__ptr_;
    uint64_t v16 = *(void *)&self->_impl.heap_index_ift_map.__table_.__p3_.__value_;
    uint64_t v17 = ptr;
    if (ptr) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v14 = [(AGXG17FamilyUserIntersectionFunctionTable *)v11 initWithDevice:v5 numTableFnSlots:v12 pipelineSets:&v16 pipeline:self stage:0 resourceIndex:v10];
    v15 = (std::__shared_weak_count *)v17;
    if (v17)
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)v17 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    return v14;
  }
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v296 = *MEMORY[0x263EF8340];
  if (self->_cp) {
    cp = self->_cp;
  }
  else {
    cp = self;
  }
  id v7 = [[AGXG17FamilyComputePipeline alloc] initWithParent:cp];
  v247 = [(_MTLComputePipelineState *)self device];
  v8 = @"Failed to allocate a new pipeline";
  v277 = @"Failed to allocate a new pipeline";
  if (!v7) {
    goto LABEL_272;
  }
  v244 = v7;
  uint64_t p_impl = (uint64_t)&v7->_impl;
  uint64_t v10 = &self->_impl;
  *(void *)(p_impl + 16) = self->_impl.compute_variant;
  *(_DWORD *)(p_impl + 440) = self->_impl.dylib_resources.dylibs.__end_cap_.__value_;
  *(unsigned char *)(p_impl + 24) = self->_impl.supports_indirect_command_buffers;
  *(unsigned char *)(p_impl + 26) = 1;
  long long v11 = *(_OWORD *)&self->_impl.ei_state.pipeline_state_gpu_address;
  long long v12 = *(_OWORD *)&self->_impl.ei_state.allocation.buffer_.address.cpu;
  long long v13 = *(_OWORD *)&self->_impl.ei_state.allocation.resource_;
  *(void *)(p_impl + 88) = self->_impl.resource_indirection_heap_allocation.buffer_.address.gpu;
  *(_OWORD *)(p_impl + 72) = v13;
  *(_OWORD *)(p_impl + 56) = v12;
  *(_OWORD *)(p_impl + 40) = v11;
  std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::reserve(p_impl + 416, ((uint64_t)((uint64_t)self->_impl.dylib_resources.dylibs.__begin_- self->_impl.loader_runtime_state.global_binding_table_layout.global_binding_tgbuffers.mask) >> 4)+ [a3 count]);
  uint64_t v243 = p_impl + 416;
  std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<std::shared_ptr<AGX::HAL200::DynamicLibrary> const*>,std::__wrap_iter<std::shared_ptr<AGX::HAL200::DynamicLibrary> const*>>((void **)(p_impl + 416), *(void *)(p_impl + 424), (void *)self->_impl.loader_runtime_state.global_binding_table_layout.global_binding_tgbuffers.mask, (void *)self->_impl.dylib_resources.dylibs.__begin_, (uint64_t)((uint64_t)self->_impl.dylib_resources.dylibs.__begin_- self->_impl.loader_runtime_state.global_binding_table_layout.global_binding_tgbuffers.mask) >> 4);
  uint64_t v14 = *(uint64_t **)(p_impl + 416);
  v15 = *(uint64_t **)(p_impl + 424);
  while (v14 != v15)
  {
    uint64_t v16 = *v14;
    v14 += 2;
    AGX::DynamicLibrary<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::allocateCodeHeap(v16);
  }
  if (v244 != self)
  {
    *(_DWORD *)(p_impl + 480) = self->_impl.function_handle_map.__table_.__p2_.__value_;
    std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,void *> *>>((void *)(p_impl + 448), (uint64_t **)self->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  }
  unint64_t prime = vcvtps_u32_f32((float)(unint64_t)([a3 count] + *(void *)(p_impl + 472)) / *(float *)(p_impl + 480));
  if (prime == 1)
  {
    unint64_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    unint64_t prime = std::__next_prime(prime);
  }
  int8x8_t v18 = *(int8x8_t *)(p_impl + 456);
  if (prime > *(void *)&v18) {
    goto LABEL_14;
  }
  if (prime < *(void *)&v18)
  {
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(p_impl + 472) / *(float *)(p_impl + 480));
    if (*(void *)&v18 < 3uLL || (uint8x8_t v20 = (uint8x8_t)vcnt_s8(v18), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (prime <= v19) {
      unint64_t prime = v19;
    }
    if (prime < *(void *)&v18) {
LABEL_14:
    }
      std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_impl + 448, prime);
  }
  v253 = (uint64_t *)(p_impl + 576);
  ptr = (std::__shared_weak_count *)v10->intersection_pipeline_sets.__ptr_;
  v278[0] = *(void *)&v10->heap_index_ift_map.__table_.__p3_.__value_;
  v278[1] = (uint64_t)ptr;
  if (ptr) {
    atomic_fetch_add_explicit(&ptr->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v23 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v247, a3, p_impl + 448, v253, v278, v10->loader_runtime_state.total_ipr_buffer_bytes, (uint64_t *)&v277);
  int v24 = v23;
  if (ptr && !atomic_fetch_add(&ptr->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))ptr->__on_zero_shared)(ptr);
    std::__shared_weak_count::__release_weak(ptr);
    if (v24) {
      goto LABEL_30;
    }
  }
  else if (v23)
  {
LABEL_30:
    uint64_t v25 = *(void *)(p_impl + 16);
    uint64_t v249 = *(void *)&v10->heap_index_ift_map.__table_.__p3_.__value_;
    v26 = v10->intersection_pipeline_sets.__ptr_;
    if (v26) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v27 = p_impl;
    int v28 = *(unsigned __int8 *)(p_impl + 24);
    uint64_t v29 = *(void *)(v249 + 40);
    uint64_t v265 = *(void *)(v249 + 32);
    uint64_t v30 = [a3 count];
    unint64_t v241 = 4 * v30;
    uint64_t v31 = (v29 - v265) / 1304 + 4 * v30;
    unint64_t v32 = v31 + 1;
    if (v31 == -1)
    {
      v34 = 0;
      v33 = 0;
    }
    else
    {
      if (v32 > 0x2AAAAAAAAAAAAAALL) {
        abort();
      }
      v33 = (char *)operator new(96 * v32);
      v34 = &v33[96 * v32];
    }
    uint64_t v240 = v30;
    v291 = 0;
    v292 = 0;
    v293 = 0;
    unint64_t v36 = v32 + ((uint64_t)(*(void *)(p_impl + 424) - *(void *)(p_impl + 416)) >> 4);
    uint64_t v250 = (v29 - v265) / 1304;
    v242 = (std::__shared_weak_count *)v26;
    id obj = a3;
    int v239 = v28;
    uint64_t v259 = v29;
    if (v36)
    {
      v37 = v33;
      if (v36 > 0x333333333333333) {
        abort();
      }
      v38 = v34;
      v39 = (char *)operator new(80 * v36);
      v40 = v37;
      v41 = &v39[80 * v36];
      v291 = v39;
      v292 = v39;
      v293 = v41;
      v34 = v38;
    }
    else
    {
      v40 = v33;
      v41 = 0;
      v39 = 0;
    }
    uint64_t v42 = v25 + 1208;
    uint64_t v264 = v27;
    uint64_t v43 = v27 + 128;
    p_device_id obj = &v10->device_obj;
    uint64_t v45 = v25 + 8;
    long long v294 = *(_OWORD *)(v25 + 1208);
    uint64_t v295 = *(void *)(v25 + 1224);
    uint64_t v46 = *(void *)(v25 + 1464);
    uint64_t v47 = *(void *)(v25 + 1456);
    uint64_t v48 = *(void *)(v25 + 1472);
    uint64_t v49 = v25;
    uint64_t v50 = v25 + 2544;
    long long v281 = *(_OWORD *)(v49 + 2544);
    uint64_t v237 = v49;
    *(void *)&long long v282 = *(void *)(v49 + 2560);
    if (v40 >= v34)
    {
      uint64_t v254 = v48;
      uint64_t v255 = v46;
      __p = v40;
      unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((v34 - v40) >> 5);
      unint64_t v57 = 0x5555555555555556 * ((v34 - v40) >> 5);
      if (v57 <= 1) {
        unint64_t v57 = 1;
      }
      if (v56 >= 0x155555555555555) {
        unint64_t v58 = 0x2AAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v58 = v57;
      }
      if (v58 > 0x2AAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v59 = (char *)operator new(96 * v58);
      v60 = &v59[96 * v58];
      *(void *)v59 = v45;
      uint64_t v61 = *(void *)(v42 + 16);
      *(_OWORD *)(v59 + 8) = *(_OWORD *)v42;
      *((void *)v59 + 3) = v61;
      *((void *)v59 + 4) = v47;
      uint64_t v55 = v254;
      uint64_t v46 = v255;
      *((void *)v59 + 5) = v255;
      *((void *)v59 + 6) = v254;
      uint64_t v62 = *(void *)(v50 + 16);
      *(_OWORD *)(v59 + 56) = *(_OWORD *)v50;
      *((void *)v59 + 9) = v62;
      *((void *)v59 + 10) = v43;
      *((void *)v59 + 11) = p_device_obj;
      v53 = v59 + 96;
      if (__p)
      {
        operator delete(__p);
        uint64_t v46 = v255;
      }
      v54 = v59;
      v34 = v60;
    }
    else
    {
      *(void *)v40 = v45;
      uint64_t v51 = *(void *)(v42 + 16);
      *(_OWORD *)(v40 + 8) = *(_OWORD *)v42;
      *((void *)v40 + 3) = v51;
      *((void *)v40 + 4) = v47;
      *((void *)v40 + 5) = v46;
      *((void *)v40 + 6) = v48;
      uint64_t v52 = *(void *)(v50 + 16);
      *(_OWORD *)(v40 + 56) = *(_OWORD *)v50;
      *((void *)v40 + 9) = v52;
      *((void *)v40 + 10) = v43;
      *((void *)v40 + 11) = p_device_obj;
      v53 = v40 + 96;
      v54 = v40;
      uint64_t v55 = v48;
    }
    if (v39 >= v41)
    {
      unint64_t v66 = 0x999999999999999ALL * ((v41 - v39) >> 4);
      if (v66 <= 1) {
        unint64_t v66 = 1;
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((v41 - v39) >> 4) >= 0x199999999999999) {
        unint64_t v67 = 0x333333333333333;
      }
      else {
        unint64_t v67 = v66;
      }
      if (v67 > 0x333333333333333) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v68 = v46;
      v69 = v34;
      v70 = (char *)operator new(80 * v67);
      *(void *)v70 = v45;
      *(_OWORD *)(v70 + 8) = v294;
      *((void *)v70 + 3) = v295;
      *((void *)v70 + 4) = v47;
      *((void *)v70 + 5) = v68;
      *((void *)v70 + 6) = v55;
      *(_OWORD *)(v70 + 56) = v281;
      *((void *)v70 + 9) = v282;
      v63 = v70 + 80;
      v291 = v70;
      v293 = &v70[80 * v67];
      if (v39) {
        operator delete(v39);
      }
      uint64_t v64 = v264;
      unint64_t v65 = v250;
      v34 = v69;
    }
    else
    {
      *(void *)v39 = v45;
      *(_OWORD *)(v39 + 8) = v294;
      *((void *)v39 + 3) = v295;
      *((void *)v39 + 4) = v47;
      *((void *)v39 + 5) = v46;
      *((void *)v39 + 6) = v55;
      *(_OWORD *)(v39 + 56) = v281;
      v63 = v39 + 80;
      *((void *)v39 + 9) = v282;
      uint64_t v64 = v264;
      unint64_t v65 = v250;
    }
    v292 = v63;
    if (v259 != v265)
    {
      uint64_t v71 = 0;
      if (v65 <= 1) {
        unint64_t v65 = 1;
      }
      unint64_t v248 = v65;
      do
      {
        uint64_t v72 = 0;
        uint64_t v252 = v71;
        uint64_t v73 = 1304 * v71;
        uint64_t v256 = *(void *)(v249 + 32) + v73 + 112;
        uint64_t v260 = *(void *)(*v253 + 32) + v73 + 112;
        do
        {
          v76 = (uint64_t *)(v260 + 296 * v72);
          uint64_t v77 = *v76;
          if (*v76)
          {
            __pa = v54;
            uint64_t v78 = v77 + 8;
            long long v294 = *(_OWORD *)(v77 + 1160);
            uint64_t v295 = *(void *)(v77 + 1176);
            uint64_t v79 = *(void *)(v77 + 1416);
            uint64_t v80 = *(void *)(v77 + 1408);
            uint64_t v81 = *(void *)(v77 + 1424);
            long long v281 = *(_OWORD *)(v77 + 2496);
            *(void *)&long long v282 = *(void *)(v77 + 2512);
            long long v289 = *(_OWORD *)(v77 + 1160);
            v290 = *(char **)(v77 + 1176);
            v82 = v76 + 1;
            long long v287 = *(_OWORD *)(v77 + 2496);
            uint64_t v83 = v256 + 296 * v72 + 8;
            v288 = *(char **)(v77 + 2512);
            if (v53 >= v34)
            {
              unint64_t v85 = 0xAAAAAAAAAAAAAAABLL * ((v53 - __pa) >> 5) + 1;
              if (v85 > 0x2AAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * ((v34 - __pa) >> 5) > v85) {
                unint64_t v85 = 0x5555555555555556 * ((v34 - __pa) >> 5);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v34 - __pa) >> 5) >= 0x155555555555555) {
                unint64_t v86 = 0x2AAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v86 = v85;
              }
              if (v86)
              {
                if (v86 > 0x2AAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v87 = v77 + 8;
                uint64_t v88 = v80;
                uint64_t v89 = v81;
                uint64_t v90 = v79;
                unint64_t v91 = v86;
                v92 = (char *)operator new(96 * v86);
                uint64_t v79 = v90;
                uint64_t v81 = v89;
                uint64_t v80 = v88;
                uint64_t v78 = v87;
                uint64_t v83 = v256 + 296 * v72 + 8;
                unint64_t v86 = v91;
              }
              else
              {
                v92 = 0;
              }
              v93 = &v92[32 * ((v53 - __pa) >> 5)];
              *(void *)v93 = v78;
              *(_OWORD *)(v93 + 8) = v289;
              *((void *)v93 + 3) = v290;
              *((void *)v93 + 4) = v80;
              *((void *)v93 + 5) = v79;
              *((void *)v93 + 6) = v81;
              *(_OWORD *)(v93 + 56) = v287;
              *((void *)v93 + 9) = v288;
              *((void *)v93 + 10) = v82;
              *((void *)v93 + 11) = v83;
              if (v53 == __pa)
              {
                v54 = &v92[32 * ((v53 - __pa) >> 5)];
              }
              else
              {
                v94 = &v92[32 * ((v53 - __pa) >> 5)];
                do
                {
                  v54 = v94 - 96;
                  long long v95 = *((_OWORD *)v53 - 5);
                  *((_OWORD *)v94 - 6) = *((_OWORD *)v53 - 6);
                  *((_OWORD *)v94 - 5) = v95;
                  long long v96 = *((_OWORD *)v53 - 4);
                  long long v97 = *((_OWORD *)v53 - 3);
                  long long v98 = *((_OWORD *)v53 - 1);
                  *((_OWORD *)v94 - 2) = *((_OWORD *)v53 - 2);
                  *((_OWORD *)v94 - 1) = v98;
                  *((_OWORD *)v94 - 4) = v96;
                  *((_OWORD *)v94 - 3) = v97;
                  v53 -= 96;
                  v94 -= 96;
                }
                while (v53 != __pa);
              }
              v34 = &v92[96 * v86];
              v53 = v93 + 96;
              if (__pa)
              {
                v99 = &v92[96 * v86];
                uint64_t v100 = v79;
                operator delete(__pa);
                uint64_t v79 = v100;
                v34 = v99;
              }
            }
            else
            {
              *(void *)v53 = v78;
              v84 = v290;
              *(_OWORD *)(v53 + 8) = v289;
              *((void *)v53 + 3) = v84;
              *((void *)v53 + 4) = v80;
              *((void *)v53 + 5) = v79;
              *((void *)v53 + 6) = v81;
              *(_OWORD *)(v53 + 56) = v287;
              *((void *)v53 + 9) = v288;
              *((void *)v53 + 10) = v82;
              *((void *)v53 + 11) = v83;
              v53 += 96;
              v63 = v292;
              v54 = __pa;
            }
            if (v63 < v293)
            {
              *(void *)v63 = v78;
              uint64_t v74 = v295;
              *(_OWORD *)(v63 + 8) = v294;
              *((void *)v63 + 3) = v74;
              *((void *)v63 + 4) = v80;
              *((void *)v63 + 5) = v79;
              *((void *)v63 + 6) = v81;
              *(_OWORD *)(v63 + 56) = v281;
              *((void *)v63 + 9) = v282;
              v75 = v63 + 80;
              uint64_t v64 = v264;
            }
            else
            {
              v101 = (char *)v291;
              unint64_t v102 = 0xCCCCCCCCCCCCCCCDLL * ((v63 - (unsigned char *)v291) >> 4);
              unint64_t v103 = v102 + 1;
              if (v102 + 1 > 0x333333333333333) {
                abort();
              }
              v266 = v34;
              __pb = v54;
              if (0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4) > v103) {
                unint64_t v103 = 0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v293 - (unsigned char *)v291) >> 4) >= 0x199999999999999) {
                unint64_t v104 = 0x333333333333333;
              }
              else {
                unint64_t v104 = v103;
              }
              if (v104)
              {
                if (v104 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v105 = v80;
                uint64_t v106 = v81;
                uint64_t v107 = v79;
                v108 = (char *)operator new(80 * v104);
                uint64_t v79 = v107;
                uint64_t v81 = v106;
                uint64_t v80 = v105;
              }
              else
              {
                v108 = 0;
              }
              v109 = &v108[80 * v102];
              *(void *)v109 = v78;
              *(_OWORD *)(v109 + 8) = v294;
              *((void *)v109 + 3) = v295;
              *((void *)v109 + 4) = v80;
              *((void *)v109 + 5) = v79;
              *((void *)v109 + 6) = v81;
              *(_OWORD *)(v109 + 56) = v281;
              *((void *)v109 + 9) = v282;
              v110 = v109;
              if (v63 == v101)
              {
                uint64_t v64 = v264;
              }
              else
              {
                uint64_t v64 = v264;
                do
                {
                  *((_OWORD *)v110 - 5) = *((_OWORD *)v63 - 5);
                  long long v111 = *((_OWORD *)v63 - 4);
                  long long v112 = *((_OWORD *)v63 - 3);
                  long long v113 = *((_OWORD *)v63 - 1);
                  *((_OWORD *)v110 - 2) = *((_OWORD *)v63 - 2);
                  *((_OWORD *)v110 - 1) = v113;
                  *((_OWORD *)v110 - 4) = v111;
                  *((_OWORD *)v110 - 3) = v112;
                  v110 -= 80;
                  v63 -= 80;
                }
                while (v63 != v101);
                v63 = v101;
              }
              v75 = v109 + 80;
              v291 = v110;
              v293 = &v108[80 * v104];
              if (v63) {
                operator delete(v63);
              }
              v34 = v266;
              v54 = __pb;
            }
            v292 = v75;
            v63 = v75;
          }
          ++v72;
        }
        while (v72 != 4);
        uint64_t v71 = v252 + 1;
      }
      while (v252 + 1 != v248);
    }
    v114 = *(uint64_t **)(v64 + 416);
    v115 = *(uint64_t **)(v64 + 424);
    v267 = v34;
    if (v114 != v115)
    {
      while (1)
      {
        v116 = v54;
        uint64_t v117 = *v114;
        v118 = (std::__shared_weak_count *)v114[1];
        if (v118) {
          atomic_fetch_add_explicit(&v118->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v119 = v117 + 96;
        long long v294 = *(_OWORD *)(v117 + 680);
        uint64_t v295 = *(void *)(v117 + 696);
        long long v281 = *(_OWORD *)(v117 + 768);
        *(void *)&long long v282 = *(void *)(v117 + 784);
        long long v289 = *(_OWORD *)(v117 + 944);
        v290 = *(char **)(v117 + 960);
        v120 = v292;
        if (v292 >= v293) {
          break;
        }
        *(void *)v292 = v119;
        *(_OWORD *)(v120 + 8) = v294;
        *((void *)v120 + 3) = v295;
        *((_OWORD *)v120 + 2) = v281;
        *((void *)v120 + 6) = v282;
        *(_OWORD *)(v120 + 56) = v289;
        *((void *)v120 + 9) = v290;
        v54 = v116;
        v292 = v120 + 80;
        if (v118) {
          goto LABEL_136;
        }
LABEL_114:
        v114 += 2;
        if (v114 == v115) {
          goto LABEL_138;
        }
      }
      v121 = (char *)v291;
      unint64_t v122 = 0xCCCCCCCCCCCCCCCDLL * ((v292 - (unsigned char *)v291) >> 4);
      unint64_t v123 = v122 + 1;
      if (v122 + 1 > 0x333333333333333) {
        abort();
      }
      if (0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4) > v123) {
        unint64_t v123 = 0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4);
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((v293 - (unsigned char *)v291) >> 4) >= 0x199999999999999) {
        unint64_t v124 = 0x333333333333333;
      }
      else {
        unint64_t v124 = v123;
      }
      if (v124)
      {
        if (v124 > 0x333333333333333) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        v125 = (char *)operator new(80 * v124);
      }
      else
      {
        v125 = 0;
      }
      v126 = &v125[80 * v122];
      *(void *)v126 = v119;
      *(_OWORD *)(v126 + 8) = v294;
      *((void *)v126 + 3) = v295;
      *((_OWORD *)v126 + 2) = v281;
      *((void *)v126 + 6) = v282;
      *(_OWORD *)(v126 + 56) = v289;
      *((void *)v126 + 9) = v290;
      v127 = v126;
      v54 = v116;
      if (v120 != v121)
      {
        do
        {
          *((_OWORD *)v127 - 5) = *((_OWORD *)v120 - 5);
          long long v128 = *((_OWORD *)v120 - 4);
          long long v129 = *((_OWORD *)v120 - 3);
          long long v130 = *((_OWORD *)v120 - 1);
          *((_OWORD *)v127 - 2) = *((_OWORD *)v120 - 2);
          *((_OWORD *)v127 - 1) = v130;
          *((_OWORD *)v127 - 4) = v128;
          *((_OWORD *)v127 - 3) = v129;
          v127 -= 80;
          v120 -= 80;
        }
        while (v120 != v121);
        v120 = v121;
      }
      v131 = &v125[80 * v124];
      v132 = v126 + 80;
      v291 = v127;
      v293 = v131;
      if (v120) {
        operator delete(v120);
      }
      v34 = v267;
      v292 = v132;
      if (!v118) {
        goto LABEL_114;
      }
LABEL_136:
      if (!atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
        std::__shared_weak_count::__release_weak(v118);
        v34 = v267;
      }
      goto LABEL_114;
    }
LABEL_138:
    long long v289 = 0uLL;
    v290 = 0;
    if (v241)
    {
      uint64_t p_impl = v264;
      if (v241 > 0x333333333333333) {
        abort();
      }
      v133 = (char *)operator new(320 * v240);
      unint64_t v134 = v250;
      v135 = v133;
      *(void *)&long long v289 = v133;
      *((void *)&v289 + 1) = v133;
      v290 = &v133[80 * v241];
      v34 = v267;
    }
    else
    {
      v135 = 0;
      uint64_t p_impl = v264;
      unint64_t v134 = v250;
    }
    uint64_t v136 = *(void *)(*v253 + 32);
    if (v134 < 0x1F693A1C451AB30BLL * ((*(void *)(*v253 + 40) - v136) >> 3))
    {
      do
      {
        uint64_t v137 = 0;
        unint64_t v251 = v134;
        uint64_t v261 = v136 + 1304 * v134 + 112;
        do
        {
          v140 = (uint64_t *)(v261 + 296 * v137);
          uint64_t v141 = *v140;
          if (*v140)
          {
            uint64_t v142 = v141 + 8;
            long long v294 = *(_OWORD *)(v141 + 1160);
            uint64_t v295 = *(void *)(v141 + 1176);
            uint64_t v143 = *(void *)(v141 + 1416);
            uint64_t v144 = *(void *)(v141 + 1408);
            uint64_t v145 = *(void *)(v141 + 1424);
            long long v281 = *(_OWORD *)(v141 + 2496);
            *(void *)&long long v282 = *(void *)(v141 + 2512);
            long long v287 = *(_OWORD *)(v141 + 1160);
            v288 = *(char **)(v141 + 1176);
            long long v285 = *(_OWORD *)(v141 + 2496);
            v146 = v140 + 1;
            uint64_t v286 = *(void *)(v141 + 2512);
            if (v53 >= v34)
            {
              v148 = v54;
              unint64_t v149 = 0xAAAAAAAAAAAAAAABLL * ((v53 - v54) >> 5);
              unint64_t v150 = v149 + 1;
              __pc = v148;
              if (v149 + 1 > 0x2AAAAAAAAAAAAAALL) {
                abort();
              }
              unint64_t v151 = 0xAAAAAAAAAAAAAAABLL * ((v34 - v148) >> 5);
              if (2 * v151 > v150) {
                unint64_t v150 = 2 * v151;
              }
              if (v151 >= 0x155555555555555) {
                unint64_t v152 = 0x2AAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v152 = v150;
              }
              if (v152)
              {
                uint64_t v268 = v145;
                if (v152 > 0x2AAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v153 = v142;
                uint64_t v154 = v143;
                unint64_t v155 = v152;
                v156 = (char *)operator new(96 * v152);
                uint64_t v143 = v154;
                uint64_t v142 = v153;
                uint64_t v145 = v268;
                unint64_t v152 = v155;
              }
              else
              {
                v156 = 0;
              }
              v157 = &v156[96 * v149];
              *(void *)v157 = v142;
              *(_OWORD *)(v157 + 8) = v287;
              *((void *)v157 + 3) = v288;
              *((void *)v157 + 4) = v144;
              *((void *)v157 + 5) = v143;
              *((void *)v157 + 6) = v145;
              *(_OWORD *)(v157 + 56) = v285;
              *((void *)v157 + 9) = v286;
              *((void *)v157 + 10) = v146;
              *((void *)v157 + 11) = v146;
              if (v53 == __pc)
              {
                v159 = &v156[96 * v149];
              }
              else
              {
                v158 = &v156[96 * v149];
                do
                {
                  v159 = v158 - 96;
                  long long v160 = *((_OWORD *)v53 - 5);
                  *((_OWORD *)v158 - 6) = *((_OWORD *)v53 - 6);
                  *((_OWORD *)v158 - 5) = v160;
                  long long v161 = *((_OWORD *)v53 - 4);
                  long long v162 = *((_OWORD *)v53 - 3);
                  long long v163 = *((_OWORD *)v53 - 1);
                  *((_OWORD *)v158 - 2) = *((_OWORD *)v53 - 2);
                  *((_OWORD *)v158 - 1) = v163;
                  *((_OWORD *)v158 - 4) = v161;
                  *((_OWORD *)v158 - 3) = v162;
                  v53 -= 96;
                  v158 -= 96;
                }
                while (v53 != __pc);
              }
              v34 = &v156[96 * v152];
              v53 = v157 + 96;
              if (__pc)
              {
                v164 = &v156[96 * v152];
                uint64_t v165 = v145;
                uint64_t v166 = v143;
                uint64_t v167 = v142;
                operator delete(__pc);
                uint64_t v142 = v167;
                uint64_t v143 = v166;
                uint64_t v145 = v165;
                v34 = v164;
              }
              v54 = v159;
            }
            else
            {
              *(void *)v53 = v142;
              v147 = v288;
              *(_OWORD *)(v53 + 8) = v287;
              *((void *)v53 + 3) = v147;
              *((void *)v53 + 4) = v144;
              *((void *)v53 + 5) = v143;
              *((void *)v53 + 6) = v145;
              *(_OWORD *)(v53 + 56) = v285;
              *((void *)v53 + 9) = v286;
              *((void *)v53 + 10) = v146;
              *((void *)v53 + 11) = v146;
              v53 += 96;
              v135 = (char *)*((void *)&v289 + 1);
            }
            if (v135 < v290)
            {
              *(void *)v135 = v142;
              uint64_t v138 = v295;
              *(_OWORD *)(v135 + 8) = v294;
              *((void *)v135 + 3) = v138;
              *((void *)v135 + 4) = v144;
              *((void *)v135 + 5) = v143;
              *((void *)v135 + 6) = v145;
              *(_OWORD *)(v135 + 56) = v281;
              *((void *)v135 + 9) = v282;
              v139 = v135 + 80;
              uint64_t p_impl = v264;
            }
            else
            {
              __pd = v54;
              v168 = (char *)v289;
              unint64_t v169 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v135[-v289] >> 4);
              unint64_t v170 = v169 + 1;
              if (v169 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((uint64_t)&v290[-v289] >> 4) > v170) {
                unint64_t v170 = 0x999999999999999ALL * ((uint64_t)&v290[-v289] >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v290[-v289] >> 4) >= 0x199999999999999) {
                unint64_t v171 = 0x333333333333333;
              }
              else {
                unint64_t v171 = v170;
              }
              v269 = v34;
              if (v171)
              {
                uint64_t v257 = v142;
                if (v171 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v172 = v145;
                uint64_t v173 = v143;
                unint64_t v174 = v171;
                v175 = (char *)operator new(80 * v171);
                uint64_t v143 = v173;
                uint64_t v145 = v172;
                uint64_t v142 = v257;
                unint64_t v171 = v174;
              }
              else
              {
                v175 = 0;
              }
              v176 = &v175[80 * v169];
              *(void *)v176 = v142;
              *(_OWORD *)(v176 + 8) = v294;
              *((void *)v176 + 3) = v295;
              *((void *)v176 + 4) = v144;
              *((void *)v176 + 5) = v143;
              *((void *)v176 + 6) = v145;
              *(_OWORD *)(v176 + 56) = v281;
              *((void *)v176 + 9) = v282;
              v177 = v176;
              if (v135 == v168)
              {
                uint64_t p_impl = v264;
                v54 = __pd;
              }
              else
              {
                uint64_t p_impl = v264;
                v54 = __pd;
                do
                {
                  *((_OWORD *)v177 - 5) = *((_OWORD *)v135 - 5);
                  long long v178 = *((_OWORD *)v135 - 4);
                  long long v179 = *((_OWORD *)v135 - 3);
                  long long v180 = *((_OWORD *)v135 - 1);
                  *((_OWORD *)v177 - 2) = *((_OWORD *)v135 - 2);
                  *((_OWORD *)v177 - 1) = v180;
                  *((_OWORD *)v177 - 4) = v178;
                  *((_OWORD *)v177 - 3) = v179;
                  v177 -= 80;
                  v135 -= 80;
                }
                while (v135 != v168);
                v135 = v168;
              }
              v139 = v176 + 80;
              *(void *)&long long v289 = v177;
              v290 = &v175[80 * v171];
              if (v135) {
                operator delete(v135);
              }
              v34 = v269;
            }
            *((void *)&v289 + 1) = v139;
            v135 = v139;
          }
          ++v137;
        }
        while (v137 != 4);
        unint64_t v134 = v251 + 1;
        uint64_t v136 = *(void *)(*v253 + 32);
      }
      while (v251 + 1 < 0x1F693A1C451AB30BLL * ((*(void *)(*v253 + 40) - v136) >> 3));
    }
    long long v283 = 0u;
    long long v284 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    uint64_t v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v281, &v294, 16, v237);
    __pe = v54;
    if (v181)
    {
      uint64_t v270 = *(void *)v282;
      unint64_t v182 = 0x268D57000;
      while (2)
      {
        uint64_t v183 = 0;
        uint64_t v258 = v181;
        do
        {
          if (*(void *)v282 != v270) {
            objc_enumerationMutation(obj);
          }
          v184 = *(void **)(*((void *)&v281 + 1) + 8 * v183);
          if (([v247 requiresRaytracingEmulation] & 1) != 0 || objc_msgSend(v184, "functionType") != 6)
          {
            if (![v184 vendorPrivate]
              || ([v184 vendorPrivate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (uint64_t v185 = [v184 vendorPrivate], (v186 = (char *)v185) == 0))
            {
              int v35 = 0;
              goto LABEL_253;
            }
            uint64_t v187 = *(int *)(v182 + 1956);
            v188 = (__n128 *)(v185 + v187);
            unint64_t v189 = *(void *)(v185 + v187);
            v190 = *(__n128 **)(p_impl + 424);
            if ((unint64_t)v190 >= *(void *)(p_impl + 432))
            {
              v192 = std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__emplace_back_slow_path<std::shared_ptr<AGX::HAL200::DynamicLibrary>&>(v243, *v188);
              uint64_t v187 = *(int *)(v182 + 1956);
            }
            else
            {
              v190->n128_u64[0] = v189;
              unint64_t v191 = v188->n128_u64[1];
              v190->n128_u64[1] = v191;
              if (v191) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v191 + 8), 1uLL, memory_order_relaxed);
              }
              v192 = v190 + 1;
            }
            unint64_t v193 = v189 + 96;
            *(void *)(v264 + 424) = v192;
            uint64_t v194 = *(void *)&v186[v187];
            v288 = *(char **)(v194 + 696);
            long long v287 = *(_OWORD *)(v194 + 680);
            long long v285 = *(_OWORD *)(v194 + 768);
            uint64_t v286 = *(void *)(v194 + 784);
            long long v279 = *(_OWORD *)(v194 + 944);
            uint64_t v280 = *(void *)(v194 + 960);
            if (v135 >= v290)
            {
              v196 = (char *)v289;
              unint64_t v197 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v135[-v289] >> 4);
              unint64_t v198 = v197 + 1;
              if (v197 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((uint64_t)&v290[-v289] >> 4) > v198) {
                unint64_t v198 = 0x999999999999999ALL * ((uint64_t)&v290[-v289] >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v290[-v289] >> 4) >= 0x199999999999999) {
                unint64_t v199 = 0x333333333333333;
              }
              else {
                unint64_t v199 = v198;
              }
              if (v199)
              {
                v262 = v186;
                if (v199 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v200 = v183;
                uint64_t v201 = v187;
                unint64_t v202 = v193;
                unint64_t v203 = v199;
                v204 = (char *)operator new(80 * v199);
                unint64_t v193 = v202;
                uint64_t v187 = v201;
                unint64_t v199 = v203;
                uint64_t v183 = v200;
                v186 = v262;
              }
              else
              {
                v204 = 0;
              }
              v205 = &v204[80 * v197];
              *(void *)v205 = v193;
              *(_OWORD *)(v205 + 8) = v287;
              *((void *)v205 + 3) = v288;
              *((_OWORD *)v205 + 2) = v285;
              *((void *)v205 + 6) = v286;
              *(_OWORD *)(v205 + 56) = v279;
              *((void *)v205 + 9) = v280;
              if (v135 == v196)
              {
                v196 = v135;
                v206 = &v204[80 * v197];
                uint64_t v181 = v258;
                unint64_t v182 = 0x268D57000uLL;
              }
              else
              {
                v206 = &v204[80 * v197];
                uint64_t v181 = v258;
                unint64_t v182 = 0x268D57000;
                do
                {
                  *((_OWORD *)v206 - 5) = *((_OWORD *)v135 - 5);
                  long long v207 = *((_OWORD *)v135 - 4);
                  long long v208 = *((_OWORD *)v135 - 3);
                  long long v209 = *((_OWORD *)v135 - 1);
                  *((_OWORD *)v206 - 2) = *((_OWORD *)v135 - 2);
                  *((_OWORD *)v206 - 1) = v209;
                  *((_OWORD *)v206 - 4) = v207;
                  *((_OWORD *)v206 - 3) = v208;
                  v206 -= 80;
                  v135 -= 80;
                }
                while (v135 != v196);
              }
              v135 = v205 + 80;
              *(void *)&long long v289 = v206;
              *((void *)&v289 + 1) = v205 + 80;
              v290 = &v204[80 * v199];
              if (v196)
              {
                v210 = v196;
                unint64_t v211 = v193;
                operator delete(v210);
                unint64_t v193 = v211;
                uint64_t v187 = *(int *)(v182 + 1956);
              }
            }
            else
            {
              *(void *)v135 = v193;
              long long v195 = v287;
              *((void *)v135 + 3) = v288;
              *(_OWORD *)(v135 + 8) = v195;
              *((_OWORD *)v135 + 2) = v285;
              *((void *)v135 + 6) = v286;
              *(_OWORD *)(v135 + 56) = v279;
              *((void *)v135 + 9) = v280;
              v135 += 80;
            }
            *((void *)&v289 + 1) = v135;
            uint64_t v212 = *(void *)&v186[v187];
            v288 = *(char **)(v212 + 696);
            long long v287 = *(_OWORD *)(v212 + 680);
            long long v285 = *(_OWORD *)(v212 + 768);
            uint64_t v286 = *(void *)(v212 + 784);
            long long v279 = *(_OWORD *)(v212 + 944);
            uint64_t v280 = *(void *)(v212 + 960);
            v213 = v292;
            if (v292 >= v293)
            {
              v214 = (char *)v291;
              unint64_t v215 = 0xCCCCCCCCCCCCCCCDLL * ((v292 - (unsigned char *)v291) >> 4);
              unint64_t v216 = v215 + 1;
              if (v215 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4) > v216) {
                unint64_t v216 = 0x999999999999999ALL * ((v293 - (unsigned char *)v291) >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v293 - (unsigned char *)v291) >> 4) >= 0x199999999999999) {
                unint64_t v217 = 0x333333333333333;
              }
              else {
                unint64_t v217 = v216;
              }
              if (v217)
              {
                v263 = v186;
                if (v217 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v218 = v183;
                uint64_t v219 = v187;
                unint64_t v220 = v193;
                unint64_t v221 = v217;
                v222 = (char *)operator new(80 * v217);
                unint64_t v193 = v220;
                uint64_t v187 = v219;
                unint64_t v217 = v221;
                uint64_t v183 = v218;
                v186 = v263;
              }
              else
              {
                v222 = 0;
              }
              v223 = &v222[80 * v215];
              *(void *)v223 = v193;
              *(_OWORD *)(v223 + 8) = v287;
              *((void *)v223 + 3) = v288;
              *((_OWORD *)v223 + 2) = v285;
              *((void *)v223 + 6) = v286;
              *(_OWORD *)(v223 + 56) = v279;
              *((void *)v223 + 9) = v280;
              v224 = v223;
              if (v213 == v214)
              {
                uint64_t p_impl = v264;
                uint64_t v181 = v258;
              }
              else
              {
                uint64_t v181 = v258;
                do
                {
                  *((_OWORD *)v224 - 5) = *((_OWORD *)v213 - 5);
                  long long v225 = *((_OWORD *)v213 - 4);
                  long long v226 = *((_OWORD *)v213 - 3);
                  long long v227 = *((_OWORD *)v213 - 1);
                  *((_OWORD *)v224 - 2) = *((_OWORD *)v213 - 2);
                  *((_OWORD *)v224 - 1) = v227;
                  *((_OWORD *)v224 - 4) = v225;
                  *((_OWORD *)v224 - 3) = v226;
                  v224 -= 80;
                  v213 -= 80;
                }
                while (v213 != v214);
                v213 = v214;
                uint64_t p_impl = v264;
              }
              v291 = v224;
              v293 = &v222[80 * v217];
              if (v213)
              {
                operator delete(v213);
                unint64_t v182 = 0x268D57000uLL;
                uint64_t v187 = 56;
                v213 = v223;
                v54 = __pe;
              }
              else
              {
                v213 = v223;
                v54 = __pe;
                unint64_t v182 = 0x268D57000uLL;
              }
            }
            else
            {
              *(void *)v292 = v193;
              *(_OWORD *)(v213 + 8) = v287;
              *((void *)v213 + 3) = v288;
              *((_OWORD *)v213 + 2) = v285;
              *((void *)v213 + 6) = v286;
              *(_OWORD *)(v213 + 56) = v279;
              *((void *)v213 + 9) = v280;
              uint64_t p_impl = v264;
            }
            v292 = v213 + 80;
            AGX::applySPIRelocations<AGX::HAL200::ObjClasses,AGX::HAL200::DynamicLibrary>(*(void *)&v186[v187], (void *)[v186 relocations]);
          }
          ++v183;
        }
        while (v183 != v181);
        uint64_t v181 = [obj countByEnumeratingWithState:&v281 objects:&v294 count:16];
        if (v181) {
          continue;
        }
        break;
      }
    }
    long long v287 = 0uLL;
    v288 = 0;
    uint64_t v228 = v53 - v54;
    if (v53 == v54)
    {
      v229 = 0;
    }
    else
    {
      if (0xAAAAAAAAAAAAAAABLL * (v228 >> 5) > 0x2AAAAAAAAAAAAAALL) {
        abort();
      }
      v229 = (char *)operator new(v53 - v54);
      *(void *)&long long v287 = v229;
      *((void *)&v287 + 1) = v229;
      v288 = &v229[32 * (v228 >> 5)];
      size_t v230 = 96 * ((v228 - 96) / 0x60uLL) + 96;
      memcpy(v229, v54, v230);
      *((void *)&v287 + 1) = &v229[v230];
    }
    int v35 = AGX::DynamicLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::load((uint64_t)v247, (uint64_t **)&v291, (uint64_t **)&v289, (size_t *)&v287, *(_DWORD *)(v238 + 1036), 0, &v277, v239 != 0);
    if (v229)
    {
      *((void *)&v287 + 1) = v229;
      operator delete(v229);
    }
LABEL_253:
    if ((void)v289) {
      operator delete((void *)v289);
    }
    if (v291) {
      operator delete(v291);
    }
    if (v54) {
      operator delete(v54);
    }
    if (v242 && !atomic_fetch_add(&v242->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v242->__on_zero_shared)(v242);
      std::__shared_weak_count::__release_weak(v242);
    }
    goto LABEL_262;
  }
  int v35 = 0;
LABEL_262:
  if (([v247 requiresRaytracingEmulation] & 1) == 0)
  {
    uint64_t v231 = *v253;
    if (*v253)
    {
      v232 = *(unsigned int **)(v231 + 32);
      for (i = *(unsigned int **)(v231 + 40); v232 != i; v232 += 326)
      {
        AGX::IntersectionPipelineSetGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::finalize(v232);
        AGX::RayPayloadSizeAlignImpl<AGX::HAL200::Classes>::merge((unsigned int *)(p_impl + 224), v232);
      }
    }
    AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::createScsPerShaderConfigTable(p_impl);
    AGX::ComputePipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParamsForIntersection(p_impl, v247[101]);
  }
  uint64_t v234 = *(void *)(p_impl + 16);
  if ((*(unsigned char *)(v234 + 1951) & 5) != 0) {
    *(unsigned char *)(p_impl + 25) = 1;
  }
  if (v35)
  {
    AGX::ComputeProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v234);
    return v244;
  }
  v8 = v277;
  id v7 = v244;
LABEL_272:
  if (a4)
  {
    if (v8)
    {
      uint64_t v236 = [NSDictionary dictionaryWithObject:v8 forKey:*MEMORY[0x263F08320]];
      *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:1 userInfo:v236];
    }
  }

  return 0;
}

- (id)functionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_impl.max_wg_size, (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3
{
  int var1 = a3->var1;
  unsigned int v4 = (*((_DWORD *)self->_impl.compute_variant + 887) + 3) & 0xFFFFFFFC;
  if (v4 * LODWORD(a3->var0) * var1) {
    return v4 * (1 << -(char)__clz(LODWORD(a3->var0) - 1) << -(char)__clz(var1 - 1));
  }
  else {
    return 0;
  }
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  int var1 = a3->var1;
  unsigned int v4 = (*((_DWORD *)self->_impl.compute_variant + 887) + 3) & 0xFFFFFFFC;
  if (v4 * LODWORD(a3->var0) * var1) {
    return v4 * (1 << -(char)__clz(LODWORD(a3->var0) - 1) << -(char)__clz(var1 - 1));
  }
  else {
    return 0;
  }
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return *((unsigned int *)self->_impl.compute_variant + 881);
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return LODWORD(self->_impl.dylib_resources.dylibs.__end_cap_.__value_);
}

- (unint64_t)threadExecutionWidth
{
  return 32;
}

- (void)dealloc
{
  self->_impl.ift_spill_info.__cntrl_ = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyComputePipeline;
  [(_MTLComputePipelineState *)&v3 dealloc];
}

- (AGXG17FamilyComputePipeline)initWithParent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AGXG17FamilyComputePipeline;
  unsigned int v4 = -[_MTLComputePipelineState initWithParent:](&v6, sel_initWithParent_);
  if (v4) {
    v4->_cp = (AGXG17FamilyComputeProgram *)a3;
  }
  return v4;
}

- (AGXG17FamilyComputePipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AGXG17FamilyComputePipeline;
  id v5 = -[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:](&v9, sel_initWithDevice_pipelineStateDescriptor_, a3);
  if (v5)
  {
    objc_super v6 = (__shared_weak_count *)objc_msgSend((id)objc_msgSend(a4, "computeFunction"), "vendorPrivate");
    v5->_impl.ift_spill_info.__cntrl_ = v6;
    id v7 = v6;
  }
  return v5;
}

@end