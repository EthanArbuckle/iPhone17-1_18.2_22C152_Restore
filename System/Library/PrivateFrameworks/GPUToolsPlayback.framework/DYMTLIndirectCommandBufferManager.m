@interface DYMTLIndirectCommandBufferManager
- (DYMTLIndirectCommandBufferManager)initWithFunctionPlayer:(id)a3;
- (id).cxx_construct;
- (id)convertIndirectCommandBufferData:(const char *)a3 range:(_NSRange)a4 toFBufStream:(const CoreFunction *)a5;
- (id)saveComputeEncoder:(id)a3 withDescriptor:(id)a4;
- (id)saveRenderEncoder:(id)a3 withDescriptor:(id)a4;
- (pair<unsigned)bufferIdAndOffsetForGPUVirtualAddress:(unint64_t)a3;
- (unint64_t)computePipelineIdForUniqueIdentifier:(unint64_t)a3;
- (unint64_t)renderPipelineIdForUniqueIdentifier:(unint64_t)a3;
- (unint64_t)setupComputeCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6;
- (unint64_t)setupRenderCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6;
- (unsigned)executeIndirectRenderCommands:(id)a3 withData:(const char *)a4 forRange:(_NSRange)a5 forIndirectCommandBuffer:(id)a6;
- (void)_calculateGPUVirtualAddress;
- (void)addComputePipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4;
- (void)addGPUVirtualAddress:(unint64_t)a3 forObjectId:(unint64_t)a4;
- (void)addRenderPipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4;
- (void)executeIndirectComputeCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6;
- (void)executeIndirectRenderCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6;
- (void)restoreBuffer:(id)a3 optimizedRanges:(const char *)a4 commandQueue:(id)a5;
- (void)restoreBuffer:(id)a3 withData:(const char *)a4 commandQueue:(id)a5;
- (void)updateReplayerTranslationBuffer;
@end

@implementation DYMTLIndirectCommandBufferManager

- (DYMTLIndirectCommandBufferManager)initWithFunctionPlayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLIndirectCommandBufferManager;
  v6 = [(DYMTLIndirectCommandBufferManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_player, a3);
  }

  return v7;
}

- (pair<unsigned)bufferIdAndOffsetForGPUVirtualAddress:(unint64_t)a3
{
  unint64_t v3 = GPUTools::MTL::Utils::DYMTLTranslateGPUAddressToBuffer(&self->_gpuVirtualAddressArray.__begin_, a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)renderPipelineIdForUniqueIdentifier:(unint64_t)a3
{
  unint64_t v5 = a3;
  unint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_renderPipelineStateUniqueIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3) {
    return v3[3];
  }
  else {
    return -1;
  }
}

- (unint64_t)computePipelineIdForUniqueIdentifier:(unint64_t)a3
{
  unint64_t v5 = a3;
  unint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_computePipelineStateUniqueIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3) {
    return v3[3];
  }
  else {
    return -1;
  }
}

- (void)addGPUVirtualAddress:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v5 = a4;
  v6 = &v5;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_gpuVirtualAddressMap, &v5, (uint64_t)&std::piecewise_construct, &v6)[3] = a3;
  self->_recalculateVirtualAddress = 1;
}

- (void)addRenderPipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v4 = a3;
  unint64_t v5 = &v4;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_renderPipelineStateUniqueIdentifier, &v4, (uint64_t)&std::piecewise_construct, &v5)[3] = a4;
}

- (void)addComputePipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v4 = a3;
  unint64_t v5 = &v4;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_computePipelineStateUniqueIdentifier, &v4, (uint64_t)&std::piecewise_construct, &v5)[3] = a4;
}

- (void)_calculateGPUVirtualAddress
{
  if (self->_recalculateVirtualAddress)
  {
    p_gpuVirtualAddressArray = &self->_gpuVirtualAddressArray;
    self->_gpuVirtualAddressArray.__end_ = self->_gpuVirtualAddressArray.__begin_;
    std::vector<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>::reserve((void **)&self->_gpuVirtualAddressArray.__begin_, self->_gpuVirtualAddressMap.__table_.__p2_.__value_);
    value = p_gpuVirtualAddressArray[-5].__end_cap_.__value_;
    if (value)
    {
      p_end_cap = &self->_gpuVirtualAddressArray.__end_cap_;
      do
      {
        uint64_t v6 = *((void *)value + 2);
        uint64_t v5 = *((void *)value + 3);
        v7 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v6, p_end_cap);
        uint64_t v8 = [v7 length];
        uint64_t v9 = v8;
        end = self->_gpuVirtualAddressArray.__end_;
        v10 = self->_gpuVirtualAddressArray.__end_cap_.__value_;
        if (end >= v10)
        {
          begin = p_gpuVirtualAddressArray->__begin_;
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((end - p_gpuVirtualAddressArray->__begin_) >> 3);
          unint64_t v15 = v14 + 1;
          if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - begin) >> 3);
          if (2 * v16 > v15) {
            unint64_t v15 = 2 * v16;
          }
          if (v16 >= 0x555555555555555) {
            unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>>((uint64_t)p_end_cap, v17);
            begin = self->_gpuVirtualAddressArray.__begin_;
            end = self->_gpuVirtualAddressArray.__end_;
          }
          else
          {
            v18 = 0;
          }
          v19 = &v18[24 * v14];
          *(void *)v19 = v5;
          *((void *)v19 + 1) = v9;
          *((void *)v19 + 2) = v6;
          v20 = (DYMTLBufferGPUAddress *)v19;
          if (end != begin)
          {
            do
            {
              long long v21 = *(_OWORD *)((char *)end - 24);
              *((void *)v20 - 1) = *((void *)end - 1);
              *(_OWORD *)((char *)v20 - 24) = v21;
              v20 = (DYMTLBufferGPUAddress *)((char *)v20 - 24);
              end = (DYMTLBufferGPUAddress *)((char *)end - 24);
            }
            while (end != begin);
            begin = p_gpuVirtualAddressArray->__begin_;
          }
          v12 = (DYMTLBufferGPUAddress *)(v19 + 24);
          self->_gpuVirtualAddressArray.__begin_ = v20;
          self->_gpuVirtualAddressArray.__end_ = (DYMTLBufferGPUAddress *)(v19 + 24);
          self->_gpuVirtualAddressArray.__end_cap_.__value_ = (DYMTLBufferGPUAddress *)&v18[24 * v17];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *(void *)end = v5;
          *((void *)end + 1) = v8;
          v12 = (DYMTLBufferGPUAddress *)((char *)end + 24);
          *((void *)end + 2) = v6;
        }
        self->_gpuVirtualAddressArray.__end_ = v12;

        value = *(DYMTLBufferGPUAddress **)value;
      }
      while (value);
    }
    v22 = self->_gpuVirtualAddressArray.__begin_;
    v23 = (unint64_t *)self->_gpuVirtualAddressArray.__end_;
    unint64_t v24 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v22) >> 3));
    if (v23 == (unint64_t *)v22) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v24;
    }
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,GPUTools::MTL::Utils::DYMTLBufferGPUAddress *,false>((uint64_t)v22, v23, (uint64_t)&v27, v25, 1);
    self->_recalculateVirtualAddress = 0;
  }
}

- (void)executeIndirectRenderCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  v13 = DYMTLGetAssociatedObject(v11, 3u);
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, [v13 maxKernelThreadgroupMemoryBindCount], (uint64_t)v15);
  memset(v14, 0, sizeof(v14));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v15, (uint64_t)v14);
  DYMTLDrawRenderCommandEncoder(v10, a5, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v14, (void *)[(DYMTLFunctionPlayer *)self->_player objectMap], &self->_gpuVirtualAddressArray.__begin_);
}

- (unsigned)executeIndirectRenderCommands:(id)a3 withData:(const char *)a4 forRange:(_NSRange)a5 forIndirectCommandBuffer:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  id v12 = a6;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  DYMTLGetAssociatedObject(v12, 0);
  v13 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v12, 3u);
  uint64_t v20 = 0;
  unint64_t v17 = memset(v19, 0, sizeof(v19));
  MakeDYMTLIndirectCommandBufferDescriptor(v13, [v17 maxKernelThreadgroupMemoryBindCount], (uint64_t)v19);
  memset(v18, 0, sizeof(v18));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v19, (uint64_t)v18);
  unint64_t v14 = [(DYMTLIndirectCommandBufferManager *)self saveRenderEncoder:v11 withDescriptor:v13];
  if (location >= location + length)
  {
    unsigned int v15 = 0;
  }
  else
  {
    unsigned int v15 = 0;
    do
    {
      DYMTSetupRenderCommandEncoder(v11, (uint64_t)v19, location, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v18, (void *)[(DYMTLFunctionPlayer *)self->_player objectMap], self);
      v15 += DYMTLDrawRenderCommandEncoder(v11, location++, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v18, (void *)[(DYMTLFunctionPlayer *)self->_player objectMap], &self->_gpuVirtualAddressArray.__begin_);
      --length;
    }
    while (length);
  }
  [v14 restoreEncoder:v11 withDescriptor:v13];

  return v15;
}

- (void)executeIndirectComputeCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  DYMTLGetAssociatedObject(v11, 0);
  id v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  v13 = DYMTLGetAssociatedObject(v11, 3u);
  unint64_t v33 = 0;
  memset(v32, 0, sizeof(v32));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, [v13 maxKernelThreadgroupMemoryBindCount], (uint64_t)v32);
  long long v31 = 0u;
  memset(v30, 0, sizeof(v30));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v32, (uint64_t)v30);
  id v14 = v10;
  unsigned int v15 = &a4[*((void *)&v31 + 1) * a5];
  uint64_t v16 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::commandType((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
  if (v16)
  {
    ThreadgroupMemoryLength = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getThreadgroupMemoryLength((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
    if (v33)
    {
      v18 = ThreadgroupMemoryLength;
      for (unint64_t i = 0; i < v33; ++i)
        [v14 setThreadgroupMemoryLength:*(void *)&v18[8 * i] atIndex:i];
    }
    if (v16 == 32)
    {
      uint64_t v25 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::concurrentDispatchThreadgroupsArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      v26 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::indirectDispatchArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      long long v27 = *((_OWORD *)v26 + 1);
      long long v38 = *(_OWORD *)v26;
      long long v39 = v27;
      long long v40 = *((_OWORD *)v26 + 2);
      [v14 setStageInRegion:&v38];
      uint64_t v28 = *((void *)v25 + 2);
      long long v36 = *(_OWORD *)v25;
      uint64_t v37 = v28;
      uint64_t v29 = *((void *)v25 + 5);
      long long v34 = *(_OWORD *)(v25 + 24);
      uint64_t v35 = v29;
      [v14 dispatchThreadgroups:&v36 threadsPerThreadgroup:&v34];
    }
    else if (v16 == 64)
    {
      uint64_t v20 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::concurrentDispatchThreadsArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      long long v21 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::indirectDispatchArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      long long v22 = *((_OWORD *)v21 + 1);
      long long v38 = *(_OWORD *)v21;
      long long v39 = v22;
      long long v40 = *((_OWORD *)v21 + 2);
      [v14 setStageInRegion:&v38];
      uint64_t v23 = *((void *)v20 + 2);
      long long v36 = *(_OWORD *)v20;
      uint64_t v37 = v23;
      uint64_t v24 = *((void *)v20 + 5);
      long long v34 = *(_OWORD *)(v20 + 24);
      uint64_t v35 = v24;
      [v14 dispatchThreads:&v36 threadsPerThreadgroup:&v34];
    }
  }
}

- (void)restoreBuffer:(id)a3 withData:(const char *)a4 commandQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  DYMTLGetAssociatedObject(v8, 0);
  id v10 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v8 size];
  id v12 = (objc_object *)v8;
  v13 = DYMTLGetAssociatedObject(v12, 3u);
  id v14 = v12;
  if (([v13 options] & 0x20) != 0)
  {
    unsigned int v15 = [(objc_object *)v12 device];
    id v14 = (objc_object *)[v15 newIndirectCommandBufferWithDescriptor:v10 maxCommandCount:v11 options:0];
  }
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  MakeDYMTLIndirectCommandBufferDescriptor(v10, objc_msgSend(v13, "maxKernelThreadgroupMemoryBindCount", 0, 0, 0, 0, 0, 0, 0, 0, 0), (uint64_t)&v19);
  uint64_t v16 = DYMTLGetOriginalObject(v14);
  DYMTLEncodeIndirectCommandBuffer(v16, (uint64_t)&v19, v11, (uint64_t)a4, (void *)[(DYMTLFunctionPlayer *)self->_player objectMap], self);

  if (v14 != v12)
  {
    unint64_t v17 = [v9 commandBuffer];
    v18 = [v17 blitCommandEncoder];
    objc_msgSend(v18, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", v14, 0, v11, v12, 0);
    [v18 endEncoding];
    [v17 commit];
  }
}

- (void)restoreBuffer:(id)a3 optimizedRanges:(const char *)a4 commandQueue:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v10 = GPUTools::MTL::MakeIndirectCommandBufferOptimizedRangeList((GPUTools::MTL *)a4, v9);
  if ([v10 count])
  {
    uint64_t v11 = [v8 commandBuffer];
    id v12 = [v11 blitCommandEncoder];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "rangeValue", (void)v19);
          objc_msgSend(v12, "optimizeIndirectCommandBuffer:withRange:", v7, v17, v18);
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v12 endEncoding];
    [v11 commit];
  }
}

- (unint64_t)setupRenderCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  DYMTLGetAssociatedObject(v11, 0);
  id v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  id v13 = DYMTLGetAssociatedObject(v11, 3u);
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, [v13 maxKernelThreadgroupMemoryBindCount], (uint64_t)v17);
  memset(v16, 0, sizeof(v16));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v17, (uint64_t)v16);
  unint64_t v14 = DYMTSetupRenderCommandEncoder(v10, (uint64_t)v17, a5, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v16, (void *)[(DYMTLFunctionPlayer *)self->_player objectMap], self);

  return v14;
}

- (unint64_t)setupComputeCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  DYMTLGetAssociatedObject(v11, 0);
  long long v27 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  id v12 = DYMTLGetAssociatedObject(v11, 3u);
  uint64_t v32 = 0;
  long long v31 = 0u;
  memset(v30, 0, sizeof(v30));
  MakeDYMTLIndirectCommandBufferDescriptor(v27, [v12 maxKernelThreadgroupMemoryBindCount], (uint64_t)v30);
  long long v29 = 0u;
  memset(v28, 0, sizeof(v28));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v30, (uint64_t)v28);
  id v13 = [(DYMTLFunctionPlayer *)self->_player objectMap];
  id v14 = v10;
  uint64_t v15 = self;
  uint64_t v16 = &a4[*((void *)&v29 + 1) * a5];
  if (BYTE9(v30[0]))
  {
    unint64_t v17 = 0;
  }
  else
  {
    unint64_t v17 = [(DYMTLIndirectCommandBufferManager *)v15 computePipelineIdForUniqueIdentifier:GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getPipelineStateUniqueIdentifier((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v28, v16)];
    uint64_t v18 = GetObjectForKey(v13, v17);
    [v14 setComputePipelineState:v18];
  }
  if (!BYTE8(v30[0]))
  {
    KernelBuffers = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getKernelBuffers((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v28, v16);
    if ((void)v31)
    {
      long long v20 = KernelBuffers;
      unint64_t v21 = 0;
      do
      {
        unint64_t v22 = [(DYMTLIndirectCommandBufferManager *)v15 bufferIdAndOffsetForGPUVirtualAddress:*(void *)&v20[8 * v21]];
        uint64_t v24 = v23;
        uint64_t v25 = GetObjectForKey(v13, v22);
        [v14 setBuffer:v25 offset:v24 atIndex:v21];

        ++v21;
      }
      while (v21 < (unint64_t)v31);
    }
  }

  return v17;
}

- (void)updateReplayerTranslationBuffer
{
  __p = 0;
  v117 = 0;
  uint64_t v118 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  next = self->_gpuVirtualAddressMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v4 = (void *)next[2];
      uint64_t v5 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v4, v113);
      if ([v5 conformsToProtocol:&unk_27010B468])
      {
        id v6 = v5;
        id v7 = v6;
        id v8 = v114;
        if (v114 >= (void **)v115)
        {
          uint64_t v10 = ((char *)v114 - (char *)v113) >> 4;
          unint64_t v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 60) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v12 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v11) {
            unint64_t v11 = v12 >> 3;
          }
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v13 = v11;
          }
          v123 = &v115;
          id v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v13);
          uint64_t v16 = &v14[16 * v10];
          *(void *)uint64_t v16 = v4;
          *((void *)v16 + 1) = v7;
          uint64_t v18 = v113;
          unint64_t v17 = v114;
          long long v19 = (void **)v16;
          if (v114 != v113)
          {
            long long v20 = v114;
            do
            {
              unint64_t v21 = *(v20 - 2);
              v20 -= 2;
              *(v19 - 2) = v21;
              v19 -= 2;
              unint64_t v22 = v20[1];
              v20[1] = 0;
              v19[1] = v22;
            }
            while (v20 != v18);
          }
          id v9 = (void **)(v16 + 16);
          v113 = v19;
          v114 = (void **)(v16 + 16);
          uint64_t v23 = v115;
          v115 = &v14[16 * v15];
          v121 = v17;
          v122 = v23;
          v119 = v18;
          v120 = v18;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v4;
          v8[1] = v6;
          id v9 = v8 + 2;
        }
        v114 = v9;
      }

      next = (void *)*next;
    }
    while (next);
    uint64_t v25 = v113;
    uint64_t v24 = (char *)v114;
    v26 = (char *)__p;
    long long v27 = v117;
  }
  else
  {
    v26 = 0;
    long long v27 = 0;
    uint64_t v25 = 0;
    uint64_t v24 = 0;
  }
  uint64_t v28 = v27 - v26;
  if ((unint64_t)(v27 - v26) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 = v27 + 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v26 = (char *)__p;
  }
  *(void *)&v26[v28] = (v24 - (char *)v25) >> 4;
  long long v29 = v113;
  v30 = v114;
  while (v29 != v30)
  {
    long long v31 = *v29;
    uint64_t v32 = v29[1];
    unint64_t v33 = DYMTLGetOriginalObject(v32);
    long long v34 = (char *)__p;
    int64_t v35 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      long long v34 = (char *)__p;
    }
    *(void *)&v34[v35] = v31;
    uint64_t v36 = objc_msgSend(v33, "gpuAddress", v113);
    uint64_t v37 = (char *)__p;
    int64_t v38 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      uint64_t v37 = (char *)__p;
    }
    *(void *)&v37[v38] = v36;
    uint64_t v39 = [v33 length];
    long long v40 = (char *)__p;
    int64_t v41 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      long long v40 = (char *)__p;
    }
    *(void *)&v40[v41] = v39;

    v29 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v42 = self->_renderPipelineStateUniqueIdentifier.__table_.__p1_.__value_.__next_;
  if (v42)
  {
    do
    {
      v43 = (void *)v42[3];
      v44 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v43, v113);
      if ([v44 conformsToProtocol:&unk_27010B910])
      {
        id v45 = v44;
        id v46 = v45;
        v47 = v114;
        if (v114 >= (void **)v115)
        {
          uint64_t v49 = ((char *)v114 - (char *)v113) >> 4;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 60) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v51 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v50) {
            unint64_t v50 = v51 >> 3;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v50;
          }
          v123 = &v115;
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v52);
          v55 = &v53[16 * v49];
          *(void *)v55 = v43;
          *((void *)v55 + 1) = v46;
          v57 = v113;
          v56 = v114;
          v58 = (void **)v55;
          if (v114 != v113)
          {
            v59 = v114;
            do
            {
              v60 = *(v59 - 2);
              v59 -= 2;
              *(v58 - 2) = v60;
              v58 -= 2;
              v61 = v59[1];
              v59[1] = 0;
              v58[1] = v61;
            }
            while (v59 != v57);
          }
          v48 = (void **)(v55 + 16);
          v113 = v58;
          v114 = (void **)(v55 + 16);
          v62 = v115;
          v115 = &v53[16 * v54];
          v121 = v56;
          v122 = v62;
          v119 = v57;
          v120 = v57;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v43;
          v47[1] = v45;
          v48 = v47 + 2;
        }
        v114 = v48;
      }

      v42 = (void *)*v42;
    }
    while (v42);
    v64 = v113;
    v63 = (char *)v114;
  }
  else
  {
    v64 = 0;
    v63 = 0;
  }
  v65 = (char *)__p;
  int64_t v66 = v117 - (unsigned char *)__p;
  if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 += 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v65 = (char *)__p;
  }
  *(void *)&v65[v66] = (v63 - (char *)v64) >> 4;
  v67 = v113;
  v68 = v114;
  while (v67 != v68)
  {
    v69 = v67[1];
    v70 = *v67;
    v71 = (char *)__p;
    int64_t v72 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v71 = (char *)__p;
    }
    *(void *)&v71[v72] = v70;
    v73 = DYMTLGetOriginalObject(v69);
    uint64_t v74 = [v73 uniqueIdentifier];
    v75 = (char *)__p;
    int64_t v76 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v75 = (char *)__p;
    }
    *(void *)&v75[v76] = v74;

    v67 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v77 = self->_computePipelineStateUniqueIdentifier.__table_.__p1_.__value_.__next_;
  if (v77)
  {
    do
    {
      v78 = (void *)v77[3];
      v79 = -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v78, v113);
      if ([v79 conformsToProtocol:&unk_27010BBA8])
      {
        id v80 = v79;
        id v81 = v80;
        v82 = v114;
        if (v114 >= (void **)v115)
        {
          uint64_t v84 = ((char *)v114 - (char *)v113) >> 4;
          unint64_t v85 = v84 + 1;
          if ((unint64_t)(v84 + 1) >> 60) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v86 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v85) {
            unint64_t v85 = v86 >> 3;
          }
          if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v87 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v87 = v85;
          }
          v123 = &v115;
          v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v87);
          v90 = &v88[16 * v84];
          *(void *)v90 = v78;
          *((void *)v90 + 1) = v81;
          v92 = v113;
          v91 = v114;
          v93 = (void **)v90;
          if (v114 != v113)
          {
            v94 = v114;
            do
            {
              v95 = *(v94 - 2);
              v94 -= 2;
              *(v93 - 2) = v95;
              v93 -= 2;
              v96 = v94[1];
              v94[1] = 0;
              v93[1] = v96;
            }
            while (v94 != v92);
          }
          v83 = (void **)(v90 + 16);
          v113 = v93;
          v114 = (void **)(v90 + 16);
          v97 = v115;
          v115 = &v88[16 * v89];
          v121 = v91;
          v122 = v97;
          v119 = v92;
          v120 = v92;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v78;
          v82[1] = v80;
          v83 = v82 + 2;
        }
        v114 = v83;
      }

      v77 = (void *)*v77;
    }
    while (v77);
    uint64_t v98 = ((char *)v114 - (char *)v113) >> 4;
  }
  else
  {
    uint64_t v98 = 0;
  }
  v99 = (char *)__p;
  int64_t v100 = v117 - (unsigned char *)__p;
  if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 += 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v99 = (char *)__p;
  }
  *(void *)&v99[v100] = v98;
  v101 = v113;
  v102 = v114;
  while (v101 != v102)
  {
    v103 = v101[1];
    v104 = *v101;
    v105 = (char *)__p;
    int64_t v106 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v105 = (char *)__p;
    }
    *(void *)&v105[v106] = v104;
    v107 = DYMTLGetOriginalObject(v103);
    uint64_t v108 = [v107 uniqueIdentifier];
    v109 = (char *)__p;
    int64_t v110 = v117 - (unsigned char *)__p;
    if ((unint64_t)(v117 - (unsigned char *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v109 = (char *)__p;
    }
    *(void *)&v109[v110] = v108;

    v101 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  v111 = [(DYMTLFunctionPlayer *)self->_player device];
  v112 = (void *)[v111 newBufferWithBytes:__p length:v117 - (unsigned char *)__p options:0];

  [(DYMTLFunctionPlayer *)self->_player setObject:v112 forKey:*MEMORY[0x263F3FC78]];
  if (__p)
  {
    v117 = (char *)__p;
    operator delete(__p);
  }
}

- (id)convertIndirectCommandBufferData:(const char *)a3 range:(_NSRange)a4 toFBufStream:(const CoreFunction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(DYMTLIndirectCommandBufferManager *)self _calculateGPUVirtualAddress];
  char v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)a5->var6, 0);
  unint64_t v11 = [(DYMTLFunctionPlayer *)self->_player objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)&a5->var6[1], 0)];
  DYMTLGetAssociatedObject(v11, 0);
  uint64_t v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v11 size];
  id v14 = DYMTLGetAssociatedObject(v11, 3u);
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, [v14 maxKernelThreadgroupMemoryBindCount], (uint64_t)v20);
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v20, (uint64_t)v18);
  uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:*((void *)&v19 + 1) * v13 freeWhenDone:0];
  uint64_t v16 = GPUTools::MTL::Utils::DYMTLConvertIndirectCommandBufferDataToFBufStream((uint64_t)v20, v15, v10, location, length, self, a5->var1);

  return v16;
}

- (id)saveRenderEncoder:(id)a3 withDescriptor:(id)a4
{
  unint64_t v4 = +[IndirectRenderCommandEncoderState saveEncoder:a3 withDescriptor:a4 player:self->_player];
  return v4;
}

- (id)saveComputeEncoder:(id)a3 withDescriptor:(id)a4
{
  unint64_t v4 = +[IndirectComputeCommandEncoderState saveEncoder:a3 withDescriptor:a4 player:self->_player];
  return v4;
}

- (void).cxx_destruct
{
  begin = self->_gpuVirtualAddressArray.__begin_;
  if (begin)
  {
    self->_gpuVirtualAddressArray.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_computePipelineStateUniqueIdentifier);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_renderPipelineStateUniqueIdentifier);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_gpuVirtualAddressMap);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end