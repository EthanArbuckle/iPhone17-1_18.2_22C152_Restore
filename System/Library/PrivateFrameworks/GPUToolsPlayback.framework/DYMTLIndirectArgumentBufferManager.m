@interface DYMTLIndirectArgumentBufferManager
- (DYMTLIndirectArgumentBufferManager)initWithFunctionPlayer:(id)a3;
- (__n128)findStructTypeForArgumentIndex:inStructType:;
- (id).cxx_construct;
- (id)argumentEncoderForDecodingOperation:(const void *)a3 reflectionStructType:(id *)a4;
- (id)blitBufferFromGPU:(id)a3;
- (id)device;
- (id)findStructTypeForArgumentIndex:(unint64_t)a3 inStructType:(id)a4;
- (id)findStructTypeForArgumentIndex:inStructType:;
- (id)objectWithId:(unint64_t)a3;
- (id)queue;
- (void)bufferVitualAddressMap;
- (void)decodeReplayerIAB:(id)a3 offset:(unint64_t)a4 function:(id)a5 argument:(id)a6;
- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4;
- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4 decodingMap:(void *)a5;
- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 decodingMap:(void *)a4;
- (void)executeIABDecodingOp:(const void *)a3 bufferId:(unint64_t)a4 data:(void *)a5 indirectDecodingMap:(void *)a6;
- (void)findAncestorsForBuffer:(unint64_t)a3 commandBufferIndex:(unint64_t)a4 commandEncoderIndex:(unint64_t)a5 callIndex:(unint64_t)a6 ancestors:(void *)a7;
- (void)findStructTypeForArgumentIndex:inStructType:;
- (void)initializeResourcePatchingTypes;
- (void)notifyReplayerTargetCommandBuffersFinished;
- (void)notifyReplayerTargetIndirectArgumentBuffers:(void *)a3;
- (void)processAncestorMapData:(const void *)a3;
- (void)processCommandBuffer:(unint64_t)a3 functionIndex:(unsigned int)a4 ancestorMapData:(const void *)a5 indirectArgumentBuffersData:(const void *)a6 resourceMapsData:(const void *)a7 driverDecodingData:(id)a8;
- (void)processIndirectArgumentBuffersData:(const void *)a3;
- (void)processResourceMapsData:(const void *)a3;
- (void)readPatchingTable:(id)a3;
- (void)replayerBufferBaseVirtualAddressMap;
- (void)replayerSamplerMap;
- (void)replayerTextureMap;
- (void)resolveIABDecodingOperations;
- (void)samplerMap;
- (void)textureMap;
- (void)uploadDriverDecodingData:(id)a3;
- (void)writePatchingTableAsJson:(id)a3;
@end

@implementation DYMTLIndirectArgumentBufferManager

- (DYMTLIndirectArgumentBufferManager)initWithFunctionPlayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLIndirectArgumentBufferManager;
  v6 = [(DYMTLIndirectArgumentBufferManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v7->_resourcePatchingTypesInitialized = 0;
  }

  return v7;
}

- (void)initializeResourcePatchingTypes
{
  if (!self->_resourcePatchingTypesInitialized)
  {
    self->_resourcePatchingTypesInitialized = 1;
    v3 = [(DYMTLIndirectArgumentBufferManager *)self device];
    DYMTLGetOriginalObject(v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = 0;
    resourcePatchingType = self->_resourcePatchingType;
    do
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = [v7 resourcePatchingTypeForResourceType:v4];
      }
      else {
        uint64_t v6 = 2;
      }
      resourcePatchingType[v4++] = v6;
    }
    while (v4 != 6);
  }
}

- (void)writePatchingTableAsJson:(id)a3
{
}

- (void)readPatchingTable:(id)a3
{
}

- (void)processCommandBuffer:(unint64_t)a3 functionIndex:(unsigned int)a4 ancestorMapData:(const void *)a5 indirectArgumentBuffersData:(const void *)a6 resourceMapsData:(const void *)a7 driverDecodingData:(id)a8
{
  id v15 = a8;
  [(DYMTLIndirectArgumentBufferManager *)self initializeResourcePatchingTypes];
  self->_currentCommandBuffer = a3;
  self->_currentCommandBufferFunctionIndex = a4;
  objc_storeStrong((id *)&self->_currentDeviceDecodingData, a8);
  v36.objectId = a3;
  *(void *)&v36.functionIndex = a4 + 1;
  begin = self->_commandBufferIds.__begin_;
  end = self->_commandBufferIds.__end_;
  p_commandBufferIds = &self->_commandBufferIds;
  if (begin == end)
  {
    v19 = self->_commandBufferIds.__begin_;
    v20 = v19;
  }
  else
  {
    while (!DYCommandBufferUID::operator==((uint64_t)begin, (uint64_t)&v36))
    {
      if (++begin == end)
      {
        begin = end;
        break;
      }
    }
    v19 = self->_commandBufferIds.__end_;
    v20 = begin;
    begin = v19;
  }
  if (v20 == begin)
  {
    value = self->_commandBufferIds.__end_cap_.__value_;
    if (begin >= value)
    {
      uint64_t v23 = v19 - p_commandBufferIds->__begin_;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 60) {
        std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v25 = (char *)value - (char *)p_commandBufferIds->__begin_;
      if (v25 >> 3 > v24) {
        unint64_t v24 = v25 >> 3;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v26) {
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_commandBufferIds.__end_cap_, v26);
      }
      else {
        v27 = 0;
      }
      v28 = (DYCommandBufferUID *)&v27[16 * v23];
      v29 = (DYCommandBufferUID *)&v27[16 * v26];
      DYCommandBufferUID *v28 = v36;
      v22 = v28 + 1;
      v31 = self->_commandBufferIds.__begin_;
      v30 = self->_commandBufferIds.__end_;
      if (v30 != v31)
      {
        do
        {
          v28[-1] = v30[-1];
          --v28;
          --v30;
        }
        while (v30 != v31);
        v30 = p_commandBufferIds->__begin_;
      }
      self->_commandBufferIds.__begin_ = v28;
      self->_commandBufferIds.__end_ = v22;
      self->_commandBufferIds.__end_cap_.__value_ = v29;
      if (v30) {
        operator delete(v30);
      }
    }
    else
    {
      DYCommandBufferUID *begin = v36;
      v22 = begin + 1;
    }
    self->_commandBufferIds.__end_ = v22;
    -[DYMTLIndirectArgumentBufferManager uploadDriverDecodingData:](self, "uploadDriverDecodingData:", v15, v36);
    [(DYMTLIndirectArgumentBufferManager *)self processAncestorMapData:a5];
    [(DYMTLIndirectArgumentBufferManager *)self processIndirectArgumentBuffersData:a6];
    [(DYMTLIndirectArgumentBufferManager *)self processResourceMapsData:a7];
    [(DYMTLIndirectArgumentBufferManager *)self resolveIABDecodingOperations];
    begin_node = (DYMTLIndirectArgumentBufferManager *)self->_deviceResourcesBuffers.__tree_.__begin_node_;
    if (begin_node != (DYMTLIndirectArgumentBufferManager *)&self->_deviceResourcesBuffers.__tree_.__pair1_)
    {
      do
      {
        [(DYMTLIndirectArgumentBufferManager *)self encodeIndirectArgumentsForBuffer:begin_node->_currentDeviceDecodingData decodingMap:&self->_decodingMap];
        player = begin_node->_player;
        if (player)
        {
          do
          {
            currentCommandBuffer = (DYMTLIndirectArgumentBufferManager *)player;
            player = (DYMTLFunctionPlayer *)player->super.super.isa;
          }
          while (player);
        }
        else
        {
          do
          {
            currentCommandBuffer = (DYMTLIndirectArgumentBufferManager *)begin_node->_currentCommandBuffer;
            BOOL v35 = currentCommandBuffer->super.isa == (Class)begin_node;
            begin_node = currentCommandBuffer;
          }
          while (!v35);
        }
        begin_node = currentCommandBuffer;
      }
      while (currentCommandBuffer != (DYMTLIndirectArgumentBufferManager *)&self->_deviceResourcesBuffers.__tree_.__pair1_);
    }
  }
  else
  {
    self->_traceProcessed = 1;
  }
}

- (id)device
{
  return [(DYMTLFunctionPlayer *)self->_player device];
}

- (id)queue
{
  return [(DYMTLFunctionPlayer *)self->_player commandQueue];
}

- (id)objectWithId:(unint64_t)a3
{
  unint64_t v6 = a3;
  v3 = [(DYMTLFunctionPlayer *)self->_player objectMap];
  id v7 = &v6;
  uint64_t v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v3, &v6, (uint64_t)&std::piecewise_construct, &v7)[3];
  return v4;
}

- (void)uploadDriverDecodingData:(id)a3
{
  id v4 = a3;
  if (v4 && v4 != (id)MEMORY[0x263EF8388])
  {
    id v7 = v4;
    id v5 = [(DYMTLIndirectArgumentBufferManager *)self device];
    unint64_t v6 = DYMTLGetOriginalObject(v5);

    if (objc_opt_respondsToSelector()) {
      [v6 setIndirectArgumentBufferDecodingData:v7];
    }

    id v4 = v7;
  }
}

- (void)processAncestorMapData:(const void *)a3
{
  memset(v4, 0, sizeof(v4));
  GPUTools::MTL::Utils::MakeDYMTLMutableBufferAncestorMaps();
  std::vector<std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>::push_back[abi:ne180100]((uint64_t *)&self->_ancestorMaps, (uint64_t)v4);
  id v5 = (void **)v4;
  std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

- (void)processIndirectArgumentBuffersData:(const void *)a3
{
  memset(v4, 0, sizeof(v4));
  GPUTools::MTL::Utils::MakeDYMTLIndirectArgumentBufferInfos();
  std::vector<std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>>::push_back[abi:ne180100]((uint64_t *)&self->_indirectArgumentBuffers, (uint64_t)v4);
  id v5 = (void **)v4;
  std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

- (void)processResourceMapsData:(const void *)a3
{
  unsigned int v58 = *(_DWORD *)a3;
  v3 = (uint64_t *)((char *)a3 + 16);
  uint64_t v4 = *((void *)a3 + 1);
  if (v4)
  {
    uint64_t v5 = 0;
    p_bufferVitualAddressMap = (uint64_t **)&self->_bufferVitualAddressMap;
    p_bufferLengthMap = &self->_bufferLengthMap;
    do
    {
      uint64_t v8 = *v3;
      uint64_t v60 = v3[1];
      *(void *)&long long v61 = v8;
      *((void *)&v61 + 1) = v3[2];
      v62 = (unint64_t *)&v60;
      objc_super v9 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(p_bufferVitualAddressMap, (unint64_t *)&v60, (uint64_t)&std::piecewise_construct, (uint64_t **)&v62);
      v10 = (_OWORD *)v9[6];
      unint64_t v11 = v9[7];
      if ((unint64_t)v10 >= v11)
      {
        uint64_t v13 = v9[5];
        uint64_t v14 = ((uint64_t)v10 - v13) >> 4;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 60) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v11 - v13;
        if (v16 >> 3 > v15) {
          unint64_t v15 = v16 >> 3;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17) {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)(v9 + 7), v17);
        }
        else {
          v18 = 0;
        }
        v19 = &v18[16 * v14];
        *(_OWORD *)v19 = v61;
        v21 = (char *)v9[5];
        v20 = (char *)v9[6];
        v22 = v19;
        if (v20 != v21)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 -= 16;
            v20 -= 16;
          }
          while (v20 != v21);
          v20 = (char *)v9[5];
        }
        v12 = v19 + 16;
        v9[5] = (uint64_t)v22;
        v9[6] = (uint64_t)(v19 + 16);
        v9[7] = (uint64_t)&v18[16 * v17];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        _OWORD *v10 = v61;
        v12 = v10 + 1;
      }
      v3 += 3;
      v9[6] = (uint64_t)v12;
      uint64_t v23 = *((void *)&v61 + 1);
      v62 = (unint64_t *)&v61;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_bufferLengthMap, (unint64_t *)&v61, (uint64_t)&std::piecewise_construct, &v62)[3] = v23;
      ++v5;
    }
    while (v5 != v4);
  }
  unint64_t v24 = v3 + 1;
  uint64_t v25 = *v3;
  if (*v3)
  {
    do
    {
      uint64_t v27 = *v24;
      unint64_t v26 = (uint64_t *)v24[1];
      v24 += 2;
      v62 = (unint64_t *)v26;
      *(void *)&long long v61 = &v62;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_textureMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (void **)&v61)[3] = v27;
      --v25;
    }
    while (v25);
    v3 = v24 - 1;
  }
  uint64_t v28 = *v24;
  v29 = v3 + 2;
  if (v28)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      uint64_t v32 = v3[2];
      v31 = (uint64_t *)v3[3];
      v3 = v29;
      v62 = (unint64_t *)v31;
      *(void *)&long long v61 = &v62;
      v33 = std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_samplerMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (uint64_t **)&v61);
      v34 = v33;
      BOOL v35 = (char *)v33[4];
      uint64_t v36 = (uint64_t)(v33 + 5);
      unint64_t v37 = v33[5];
      if ((unint64_t)v35 >= v37)
      {
        v39 = (char *)v33[3];
        uint64_t v40 = (v35 - v39) >> 3;
        if ((unint64_t)(v40 + 1) >> 61) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v41 = v37 - (void)v39;
        unint64_t v42 = (uint64_t)(v37 - (void)v39) >> 2;
        if (v42 <= v40 + 1) {
          unint64_t v42 = v40 + 1;
        }
        if (v41 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v43 = v42;
        }
        if (v43)
        {
          v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v36, v43);
          v39 = (char *)v34[3];
          BOOL v35 = (char *)v34[4];
        }
        else
        {
          v44 = 0;
        }
        v45 = &v44[8 * v40];
        *(void *)v45 = v32;
        v38 = v45 + 8;
        while (v35 != v39)
        {
          uint64_t v46 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v45 - 1) = v46;
          v45 -= 8;
        }
        v34[3] = v45;
        v34[4] = v38;
        v34[5] = &v44[8 * v43];
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        *(void *)BOOL v35 = v32;
        v38 = v35 + 8;
      }
      v34[4] = v38;
      v29 = v3 + 2;
    }
  }
  if (v58 > 0x16)
  {
    v47 = v29 + 1;
    uint64_t v48 = *v29;
    if (*v29)
    {
      do
      {
        uint64_t v50 = *v47;
        v49 = (uint64_t *)v47[1];
        v47 += 2;
        v62 = (unint64_t *)v49;
        *(void *)&long long v61 = &v62;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_renderPipelineMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (void **)&v61)[3] = v50;
        --v48;
      }
      while (v48);
      v29 = v47 - 1;
    }
    uint64_t v51 = *v47;
    for (j = v29 + 2; v51; --v51)
    {
      uint64_t v54 = *j;
      v53 = (uint64_t *)j[1];
      j += 2;
      v62 = (unint64_t *)v53;
      *(void *)&long long v61 = &v62;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_computePipelineMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (void **)&v61)[3] = v54;
    }
    uint64_t v55 = *j;
    if (*j)
    {
      v56 = (uint64_t **)(j + 2);
      do
      {
        uint64_t v57 = (uint64_t)*(v56 - 1);
        v62 = (unint64_t *)*v56;
        *(void *)&long long v61 = &v62;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_indirectCommandBufferMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (void **)&v61)[3] = v57;
        v56 += 2;
        --v55;
      }
      while (v55);
    }
  }
}

- (void)resolveIABDecodingOperations
{
  end = self->_indirectArgumentBuffers.__end_;
  uint64_t v4 = *(end - 3);
  uint64_t v3 = *(end - 2);
  if (v3 != v4)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + 24 * v5;
      id v7 = *(void **)v6;
      uint64_t v65 = v5;
      v66 = *(void **)(v6 + 8);
      if (*(void **)v6 != v66)
      {
        do
        {
          if (v7[2])
          {
            __p = 0;
            v75 = 0;
            v76 = 0;
            long long v72 = *(_OWORD *)(v7 + 1);
            objc_super v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v76, 1uLL);
            v10 = (char *)__p;
            unint64_t v11 = v75;
            *(void *)objc_super v9 = v7[3];
            v12 = v9 + 8;
            uint64_t v13 = v9;
            while (v11 != v10)
            {
              uint64_t v14 = *((void *)v11 - 1);
              v11 -= 8;
              *((void *)v13 - 1) = v14;
              v13 -= 8;
            }
            __p = v13;
            v75 = v9 + 8;
            v76 = &v9[8 * v8];
            if (v10) {
              operator delete(v10);
            }
            v75 = v12;
            LOBYTE(v73) = 1;
            v69 = v7;
            unint64_t v15 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_decodingMap, v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v69);
            std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v15 + 3, (uint64_t)&v72, (uint64_t)&v72);
            if (__p)
            {
              v75 = (char *)__p;
              operator delete(__p);
            }
            v70 = 0;
            unint64_t v71 = 0;
            v69 = &v70;
            -[DYMTLIndirectArgumentBufferManager findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:](self, "findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:", *v7, -1- 0x5555555555555555* (((char *)self->_indirectArgumentBuffers.__end_ - (char *)self->_indirectArgumentBuffers.__begin_) >> 3), v65, v7[4], &v69, end);
            uint64_t v16 = (char *)v69;
            if (v69 != &v70)
            {
              do
              {
                unint64_t v68 = *((void *)v16 + 4);
                __p = 0;
                v75 = 0;
                v76 = 0;
                uint64_t v17 = v7[2];
                *(void *)&long long v72 = 0;
                *((void *)&v72 + 1) = v17;
                v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v76, 1uLL);
                v20 = (char *)__p;
                v21 = v75;
                *(void *)v19 = v7[3];
                v22 = v19 + 8;
                uint64_t v23 = v19;
                while (v21 != v20)
                {
                  uint64_t v24 = *((void *)v21 - 1);
                  v21 -= 8;
                  *((void *)v23 - 1) = v24;
                  v23 -= 8;
                }
                __p = v23;
                v75 = v19 + 8;
                v76 = &v19[8 * v18];
                if (v20) {
                  operator delete(v20);
                }
                v75 = v22;
                LOBYTE(v73) = 0;
                v77 = &v68;
                uint64_t v25 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_decodingMap, &v68, (uint64_t)&std::piecewise_construct, (uint64_t **)&v77);
                std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v25 + 3, (uint64_t)&v72, (uint64_t)&v72);
                if (__p)
                {
                  v75 = (char *)__p;
                  operator delete(__p);
                }
                unint64_t v26 = (char *)*((void *)v16 + 1);
                if (v26)
                {
                  do
                  {
                    uint64_t v27 = (char **)v26;
                    unint64_t v26 = *(char **)v26;
                  }
                  while (v26);
                }
                else
                {
                  do
                  {
                    uint64_t v27 = (char **)*((void *)v16 + 2);
                    BOOL v28 = *v27 == v16;
                    uint64_t v16 = (char *)v27;
                  }
                  while (!v28);
                }
                uint64_t v16 = (char *)v27;
              }
              while (v27 != &v70);
            }
            std::__tree<BufferEntry>::destroy((uint64_t)&v69, v70);
          }
          v7 += 5;
        }
        while (v7 != v66);
        uint64_t v4 = *(end - 3);
        uint64_t v3 = *(end - 2);
      }
      uint64_t v5 = v65 + 1;
    }
    while (v65 + 1 < 0xAAAAAAAAAAAAAAABLL * ((v3 - v4) >> 3));
  }
  for (uint64_t i = self->_decodingMap.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    *((void *)&v72 + 1) = 0;
    uint64_t v73 = 0;
    unint64_t v71 = 0;
    *(void *)&long long v72 = (char *)&v72 + 8;
    v69 = 0;
    v70 = 0;
    v30 = (void *)i[3];
    if (v30 != i + 4)
    {
      v31 = 0;
      unint64_t v32 = 0;
      do
      {
        v33 = v30 + 4;
        if (v31
          && v30[5] == v31[1]
          && (v34 = (const void *)v30[7],
              size_t v35 = v30[8] - (void)v34,
              uint64_t v36 = (const void *)v31[3],
              v35 == v31[4] - (void)v36)
          && !memcmp(v34, v36, v35))
        {
          uint64_t v51 = (uint64_t *)v69;
          if (v70 == v69)
          {
LABEL_62:
            std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>((uint64_t **)&v72, (uint64_t)(v30 + 4), (uint64_t)(v30 + 4));
            uint64_t v54 = v70;
            if ((unint64_t)v70 >= v71)
            {
              v56 = (char *)v69;
              int64_t v57 = (v70 - (unsigned char *)v69) >> 3;
              unint64_t v58 = v57 + 1;
              if ((unint64_t)(v57 + 1) >> 61) {
                std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v59 = v71 - (void)v69;
              if ((uint64_t)(v71 - (void)v69) >> 2 > v58) {
                unint64_t v58 = v59 >> 2;
              }
              if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v60 = v58;
              }
              if (v60)
              {
                long long v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v71, v60);
                v56 = (char *)v69;
                uint64_t v54 = v70;
              }
              else
              {
                long long v61 = 0;
              }
              v62 = &v61[8 * v57];
              *(void *)v62 = *v33;
              uint64_t v55 = v62 + 8;
              while (v54 != v56)
              {
                uint64_t v63 = *((void *)v54 - 1);
                v54 -= 8;
                *((void *)v62 - 1) = v63;
                v62 -= 8;
              }
              v69 = v62;
              v70 = v55;
              unint64_t v71 = (unint64_t)&v61[8 * v60];
              if (v56) {
                operator delete(v56);
              }
            }
            else
            {
              *(void *)v70 = *v33;
              uint64_t v55 = v54 + 8;
            }
            v70 = v55;
          }
          else
          {
            unint64_t v52 = (v70 - (unsigned char *)v69) >> 3;
            if (v52 <= 1) {
              unint64_t v52 = 1;
            }
            while (1)
            {
              uint64_t v53 = *v51++;
              if (!((*v33 - v53) % v32)) {
                break;
              }
              if (!--v52) {
                goto LABEL_62;
              }
            }
          }
        }
        else
        {
          id v67 = 0;
          unint64_t v37 = -[DYMTLIndirectArgumentBufferManager argumentEncoderForDecodingOperation:reflectionStructType:](self, "argumentEncoderForDecodingOperation:reflectionStructType:", v30 + 4, &v67, end);
          id v38 = v67;
          unint64_t v32 = [v37 encodedLength];
          std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>((uint64_t **)&v72, (uint64_t)(v30 + 4), (uint64_t)(v30 + 4));
          v39 = (char *)v69;
          v70 = (char *)v69;
          if ((unint64_t)v69 >= v71)
          {
            unint64_t v41 = (uint64_t)(v71 - (void)v69) >> 2;
            if (v41 <= 1) {
              unint64_t v41 = 1;
            }
            if (v71 - (unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v42 = v41;
            }
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v71, v42);
            v45 = (char *)v69;
            uint64_t v46 = v70;
            *(void *)v44 = *v33;
            uint64_t v40 = v44 + 8;
            v47 = v44;
            while (v46 != v45)
            {
              uint64_t v48 = *((void *)v46 - 1);
              v46 -= 8;
              *((void *)v47 - 1) = v48;
              v47 -= 8;
            }
            v69 = v47;
            v70 = v44 + 8;
            unint64_t v71 = (unint64_t)&v44[8 * v43];
            if (v45) {
              operator delete(v45);
            }
          }
          else
          {
            *(void *)v69 = *v33;
            uint64_t v40 = v39 + 8;
          }
          v70 = v40;

          v31 = v30 + 4;
        }
        v49 = (void *)v30[1];
        if (v49)
        {
          do
          {
            uint64_t v50 = v49;
            v49 = (void *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            uint64_t v50 = (void *)v30[2];
            BOOL v28 = *v50 == (void)v30;
            v30 = v50;
          }
          while (!v28);
        }
        v30 = v50;
      }
      while (v50 != i + 4);
    }
    std::__tree<DYMTLIABDecodingOp>::swap(i + 3, (uint64_t)&v72);
    if (v69)
    {
      v70 = (char *)v69;
      operator delete(v69);
    }
    std::__tree<DYMTLIABDecodingOp>::destroy((uint64_t)&v72, *((void **)&v72 + 1));
  }
}

- (void)findAncestorsForBuffer:(unint64_t)a3 commandBufferIndex:(unint64_t)a4 commandEncoderIndex:(unint64_t)a5 callIndex:(unint64_t)a6 ancestors:(void *)a7
{
  unint64_t v27 = a3;
  if (a4)
  {
    v12 = (char *)a7 + 8;
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (char *)self->_ancestorMaps.__begin_ + 24 * v13;
      uint64_t v15 = v14[1] - *v14;
      if (v15)
      {
        unint64_t v16 = -1 - 0x3333333333333333 * (v15 >> 3);
        for (unint64_t i = v13 == a4 ? a5 : v16; i; --i)
        {
          uint64_t v18 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((void *)(*v14 + 40 * i), &v27);
          if (v18)
          {
            v19 = (void *)v18[5];
            if (v13 == a4 && i == a5)
            {
              for (; v19; v19 = (void *)*v19)
              {
                if (v19[3] <= a6)
                {
                  v20 = v19 + 2;
                  v21 = (void *)*v12;
                  if (!*v12) {
                    goto LABEL_24;
                  }
                  unint64_t v22 = *v20;
                  uint64_t v23 = v12;
                  do
                  {
                    unint64_t v24 = v21[4];
                    BOOL v25 = v24 >= v22;
                    if (v24 >= v22) {
                      unint64_t v26 = v21;
                    }
                    else {
                      unint64_t v26 = v21 + 1;
                    }
                    if (v25) {
                      uint64_t v23 = v21;
                    }
                    v21 = (void *)*v26;
                  }
                  while (*v26);
                  if (v23 == v12 || v22 < v23[4])
                  {
LABEL_24:
                    std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)a7, v20, v19 + 2);
                    [(DYMTLIndirectArgumentBufferManager *)self findAncestorsForBuffer:v19[2] commandBufferIndex:a4 commandEncoderIndex:a5 callIndex:v19[3] ancestors:a7];
                  }
                }
              }
            }
            else
            {
              for (; v19; v19 = (void *)*v19)
              {
                std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)a7, v19 + 2, v19 + 2);
                [(DYMTLIndirectArgumentBufferManager *)self findAncestorsForBuffer:v19[2] commandBufferIndex:v13 commandEncoderIndex:i callIndex:v19[3] ancestors:a7];
              }
            }
          }
        }
      }
      --v13;
    }
    while (v13);
  }
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 decodingMap:(void *)a4
{
  unint64_t v19 = a3;
  if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a4, &v19))
  {
    uint64_t v6 = [(DYMTLIndirectArgumentBufferManager *)self objectWithId:v19];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 storageMode];
      if (!v8)
      {
        id v14 = 0;
        uint64_t v15 = [v7 contents];
        if (v15) {
          goto LABEL_11;
        }
LABEL_8:

        return;
      }
      if (v8 == 2)
      {
        objc_super v9 = [(DYMTLIndirectArgumentBufferManager *)self queue];
        v10 = [v9 commandBuffer];
        unint64_t v11 = [v10 blitCommandEncoder];
        v12 = [v7 device];
        unint64_t v13 = objc_msgSend(v12, "newBufferWithLength:options:", objc_msgSend(v7, "length"), 0);

        objc_msgSend(v11, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v7, 0, v13, 0, objc_msgSend(v7, "length"));
        [v11 endEncoding];
        [v10 commit];
        [v10 waitUntilCompleted];
        id v14 = v13;
        uint64_t v15 = [v14 contents];

        if (!v15) {
          goto LABEL_8;
        }
LABEL_11:
        [(DYMTLIndirectArgumentBufferManager *)self encodeIndirectArgumentsForBuffer:v19 data:v15 decodingMap:a4];
        if ([v7 storageMode] == 2)
        {
          unint64_t v16 = [(DYMTLIndirectArgumentBufferManager *)self queue];
          uint64_t v17 = [v16 commandBuffer];
          uint64_t v18 = [v17 blitCommandEncoder];
          objc_msgSend(v18, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v14, 0, v7, 0, objc_msgSend(v7, "length"));
          [v18 endEncoding];
          [v17 commit];
          [v17 waitUntilCompleted];
        }
        goto LABEL_8;
      }
    }
    id v14 = 0;
    goto LABEL_8;
  }
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4
{
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4 decodingMap:(void *)a5
{
  unint64_t v47 = a3;
  if (self->_currentCommandBuffer)
  {
    id v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a5, &v47);
    if (v7)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      int v46 = 1065353216;
      uint64_t v8 = (void *)v7[3];
      objc_super v9 = v7 + 4;
      if (v8 != v7 + 4)
      {
        do
        {
          v10 = (void *)MEMORY[0x253362620]();
          [(DYMTLIndirectArgumentBufferManager *)self executeIABDecodingOp:v8 + 4 bufferId:v47 data:a4 indirectDecodingMap:&v44];
          unint64_t v11 = (void *)v8[1];
          if (v11)
          {
            do
            {
              v12 = v11;
              unint64_t v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              v12 = (void *)v8[2];
              BOOL v13 = *v12 == (void)v8;
              uint64_t v8 = v12;
            }
            while (!v13);
          }
          uint64_t v8 = v12;
        }
        while (v12 != v9);
      }
      if (!self->_traceProcessed)
      {
        begin = self->_commandBufferIds.__begin_;
        if (self->_commandBufferIds.__end_ == begin)
        {
          unint64_t v16 = 0;
        }
        else
        {
          uint64_t v15 = 0;
          unint64_t v16 = 0;
          do
          {
            *(void *)&long long v33 = self->_currentCommandBuffer;
            DWORD2(v33) = self->_currentCommandBufferFunctionIndex;
            if (DYCommandBufferUID::operator==((uint64_t)&begin[v15], (uint64_t)&v33)) {
              break;
            }
            ++v16;
            begin = self->_commandBufferIds.__begin_;
            ++v15;
          }
          while (v16 < self->_commandBufferIds.__end_ - begin);
        }
        long long v41 = 0u;
        long long v42 = 0u;
        int v43 = 1065353216;
        uint64_t v17 = (void *)v45;
        if ((void)v45)
        {
          do
          {
            uint64_t v18 = v17[2];
            v40[0] = 0;
            v40[1] = 0;
            v39 = v40;
            [(DYMTLIndirectArgumentBufferManager *)self findAncestorsForBuffer:v18 commandBufferIndex:v16 commandEncoderIndex:-1- 0x5555555555555555* ((uint64_t)(*((void *)self->_indirectArgumentBuffers.__begin_ + 3 * v16 + 1)- *((void *)self->_indirectArgumentBuffers.__begin_ + 3 * v16)) >> 3) callIndex:-1 ancestors:&v39];
            unint64_t v19 = v39;
            if (v39 != v40)
            {
              v20 = v17 + 4;
              do
              {
                unint64_t v38 = v19[4];
                v21 = (void *)v17[3];
                if (v21 != v20)
                {
                  do
                  {
                    long long v33 = *((_OWORD *)v21 + 2);
                    char v34 = *((unsigned char *)v21 + 48);
                    uint64_t v36 = 0;
                    uint64_t v37 = 0;
                    __p = 0;
                    std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&__p, (const void *)v21[7], v21[8], (uint64_t)(v21[8] - v21[7]) >> 3);
                    char v34 = 0;
                    uint64_t v48 = &v38;
                    unint64_t v22 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v41, &v38, (uint64_t)&std::piecewise_construct, (uint64_t **)&v48);
                    std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v22 + 3, (uint64_t)&v33, (uint64_t)&v33);
                    if (__p)
                    {
                      uint64_t v36 = __p;
                      operator delete(__p);
                    }
                    uint64_t v23 = (void *)v21[1];
                    if (v23)
                    {
                      do
                      {
                        unint64_t v24 = v23;
                        uint64_t v23 = (void *)*v23;
                      }
                      while (v23);
                    }
                    else
                    {
                      do
                      {
                        unint64_t v24 = (void *)v21[2];
                        BOOL v13 = *v24 == (void)v21;
                        v21 = v24;
                      }
                      while (!v13);
                    }
                    v21 = v24;
                  }
                  while (v24 != v20);
                }
                BOOL v25 = (void *)v19[1];
                if (v25)
                {
                  do
                  {
                    unint64_t v26 = (void **)v25;
                    BOOL v25 = (void *)*v25;
                  }
                  while (v25);
                }
                else
                {
                  do
                  {
                    unint64_t v26 = (void **)v19[2];
                    BOOL v13 = *v26 == v19;
                    unint64_t v19 = v26;
                  }
                  while (!v13);
                }
                unint64_t v19 = v26;
              }
              while (v26 != v40);
            }
            std::__tree<BufferEntry>::destroy((uint64_t)&v39, v40[0]);
            uint64_t v17 = (void *)*v17;
          }
          while (v17);
          for (unint64_t i = (unint64_t *)v42; i; unint64_t i = (unint64_t *)*i)
          {
            *(void *)&long long v33 = i + 2;
            BOOL v28 = std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v44, i + 2, (uint64_t)&std::piecewise_construct, (uint64_t **)&v33);
            std::set<DYMTLIABDecodingOp>::insert[abi:ne180100]<std::__tree_const_iterator<DYMTLIABDecodingOp,std::__tree_node<DYMTLIABDecodingOp,void *> *,long>>(v28 + 3, (void *)i[3], i + 4);
          }
          v29 = (void *)v45;
          if ((void)v45)
          {
            do
            {
              [(DYMTLIndirectArgumentBufferManager *)self encodeIndirectArgumentsForBuffer:v29[2] decodingMap:&v44];
              v29 = (void *)*v29;
            }
            while (v29);
            v30 = (unint64_t *)v45;
            if ((void)v45)
            {
              p_decodingMap = &self->_decodingMap;
              do
              {
                *(void *)&long long v33 = v30 + 2;
                unint64_t v32 = std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_decodingMap, v30 + 2, (uint64_t)&std::piecewise_construct, (uint64_t **)&v33);
                std::set<DYMTLIABDecodingOp>::insert[abi:ne180100]<std::__tree_const_iterator<DYMTLIABDecodingOp,std::__tree_node<DYMTLIABDecodingOp,void *> *,long>>(v32 + 3, (void *)v30[3], v30 + 4);
                v30 = (unint64_t *)*v30;
              }
              while (v30);
            }
          }
        }
        std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&v41);
      }
      std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&v44);
    }
  }
  else
  {
    std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)&self->_deviceResourcesBuffers, &v47, (uint64_t *)&v47);
  }
}

- (void)executeIABDecodingOp:(const void *)a3 bufferId:(unint64_t)a4 data:(void *)a5 indirectDecodingMap:(void *)a6
{
  id v38 = 0;
  unint64_t v39 = a4;
  objc_super v9 = [(DYMTLIndirectArgumentBufferManager *)self argumentEncoderForDecodingOperation:a3 reflectionStructType:&v38];
  id v10 = v38;
  unint64_t v11 = v10;
  uint64_t v37 = v9;
  if (v9)
  {
    if (v10)
    {
      v12 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_bufferLengthMap.__table_.__bucket_list_.__ptr_.__value_, &v39);
      if (v12)
      {
        BOOL v13 = DYMTLGetOriginalObject(v9);
        char v34 = [v13 layout];

        uint64_t v14 = [(objc_object *)v9 encodedLength];
        size_t v15 = v12[3];
        if (v14 - 1 >= v15)
        {
LABEL_22:

          goto LABEL_23;
        }
        unint64_t v29 = v14;
        long long v33 = v11;
        v31 = [(DYMTLFunctionPlayer *)self->_player objectMap];
        unint64_t v16 = [(DYMTLIndirectArgumentBufferManager *)self device];
        unint64_t v32 = (void *)[v16 newBufferWithBytes:a5 length:v15 options:0];

        unsigned int v17 = [v34 hashOffset];
        uint64_t v18 = [(DYMTLIndirectArgumentBufferManager *)self device];
        char v36 = [v18 supportsArgumentBuffersTier2];

        int v30 = [v34 hashValue];
        unint64_t v19 = v29;
        unint64_t v27 = a5;
        if (!*((unsigned char *)a3 + 16))
        {
          unint64_t v24 = 0;
          BOOL v25 = (char *)a5 + v17;
          do
          {
            if ((v36 & 1) != 0 || *(_DWORD *)&v25[v24] == v30) {
              rencodeBufferData(v39, v37, v34, v33, (uint64_t)a6, (uint64_t)&self->_bufferVitualAddressMap, (uint64_t)&self->_textureMap, (uint64_t)&self->_samplerMap, (uint64_t)&self->_usedSamplersMap, (uint64_t)&self->_renderPipelineMap, (uint64_t)&self->_computePipelineMap, (uint64_t)&self->_indirectCommandBufferMap, (uint64_t)v31, (uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (uint64_t)&self->_replayerTextureMap, (uint64_t)&self->_replayerSamplerMap, (uint64_t)&self->_replayerRenderPipelineMap, (uint64_t)&self->_replayerComputePipelineMap, (uint64_t)&self->_replayerIndirectCommandBufferMap,
            }
                (uint64_t)a3,
                (uint64_t)&self->_encodedResourcesMap,
                v32,
                v24,
                (uint64_t)self->_resourcePatchingType,
                self->_patcher,
                self->_currentCommandBuffer,
                self->_currentCommandBufferFunctionIndex);
            ++v24;
          }
          while (v24 <= v15 - v29);
          goto LABEL_21;
        }
        unint64_t v20 = *(void *)a3;
        if (*(void *)a3)
        {
          unint64_t v21 = v20 % v29;
          unint64_t v22 = v15 - v29;
          if (v20 % v29 > v15 - v29)
          {
LABEL_21:
            id v26 = v32;
            unint64_t v11 = v33;
            memcpy(v27, (const void *)[v26 contents], v15);
            [(objc_object *)v37 setArgumentBuffer:0 offset:0];

            goto LABEL_22;
          }
          unsigned int v23 = v17;
        }
        else
        {
          unsigned int v23 = v17;
          unint64_t v21 = 0;
          unint64_t v22 = v15 - v29;
        }
        BOOL v28 = (char *)a5 + v23;
        do
        {
          if ((v36 & 1) != 0 || *(_DWORD *)&v28[v21] == v30)
          {
            rencodeBufferData(v39, v37, v34, v33, (uint64_t)a6, (uint64_t)&self->_bufferVitualAddressMap, (uint64_t)&self->_textureMap, (uint64_t)&self->_samplerMap, (uint64_t)&self->_usedSamplersMap, (uint64_t)&self->_renderPipelineMap, (uint64_t)&self->_computePipelineMap, (uint64_t)&self->_indirectCommandBufferMap, (uint64_t)v31, (uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (uint64_t)&self->_replayerTextureMap, (uint64_t)&self->_replayerSamplerMap, (uint64_t)&self->_replayerRenderPipelineMap, (uint64_t)&self->_replayerComputePipelineMap, (uint64_t)&self->_replayerIndirectCommandBufferMap,
              (uint64_t)a3,
              (uint64_t)&self->_encodedResourcesMap,
              v32,
              v21,
              (uint64_t)self->_resourcePatchingType,
              self->_patcher,
              self->_currentCommandBuffer,
              self->_currentCommandBufferFunctionIndex);
            unint64_t v19 = v29;
          }
          v21 += v19;
        }
        while (v21 <= v22);
        goto LABEL_21;
      }
    }
  }
LABEL_23:
}

- (id)findStructTypeForArgumentIndex:(unint64_t)a3 inStructType:(id)a4
{
  v11[4] = *MEMORY[0x263EF8340];
  unint64_t v8 = a3;
  id v4 = a4;
  v10[3] = 0;
  v9[0] = &unk_2700EFE68;
  v9[1] = v10;
  v9[2] = v9;
  v9[3] = v9;
  uint64_t v5 = operator new(0x20uLL);
  *uint64_t v5 = &unk_2700EFEB0;
  v5[1] = &v8;
  v5[2] = v10;
  v5[3] = v9;
  v11[3] = v5;
  std::__function::__value_func<MTLStructType * ()(MTLStructType *,unsigned long)>::swap[abi:ne180100](v11, v10);
  std::__function::__value_func<MTLStructType * ()(MTLStructType *,unsigned long)>::~__value_func[abi:ne180100](v11);
  uint64_t v6 = std::function<MTLStructType * ()(MTLStructType *,unsigned long)>::operator()((uint64_t)v10, v4, 0);
  std::__function::__value_func<MTLStructType * ()(MTLArrayType *,unsigned long)>::~__value_func[abi:ne180100](v9);
  std::__function::__value_func<MTLStructType * ()(MTLStructType *,unsigned long)>::~__value_func[abi:ne180100](v10);

  return v6;
}

- (id)argumentEncoderForDecodingOperation:(const void *)a3 reflectionStructType:(id *)a4
{
  id v7 = [(DYMTLIndirectArgumentBufferManager *)self device];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [(DYMTLIndirectArgumentBufferManager *)self objectWithId:*((void *)a3 + 1)];
    if (!v8 || (objc_super v9 = (uint64_t *)*((void *)a3 + 3), v10 = (uint64_t *)*((void *)a3 + 4), v9 == v10))
    {
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v11 = 0;
      do
      {
        if (!v11)
        {
          uint64_t v12 = *v9;
          id v17 = 0;
          unint64_t v11 = (void *)[v8 newArgumentEncoderWithBufferIndex:v12 reflection:&v17];
          id v13 = v17;
          uint64_t v14 = [v13 bufferStructType];
          size_t v15 = v14;
          if (v14) {
            *a4 = v14;
          }
        }
        ++v9;
      }
      while (v9 != v10);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)notifyReplayerTargetIndirectArgumentBuffers:(void *)a3
{
  uint64_t v3 = (char *)a3 + 8;
  id v4 = *(char **)a3;
  if (*(void **)a3 != (char *)a3 + 8)
  {
    p_end_cap = &self->_replayerIABs.__end_cap_;
    p_replayerIABs = (uint64_t *)&self->_replayerIABs;
    do
    {
      long long v21 = 0u;
      long long v22 = 0u;
      *(void *)&long long v21 = *((id *)v4 + 4);
      uint64_t v7 = *((void *)v4 + 5);
      uint64_t v8 = *((void *)v4 + 6);
      while (v7 != v8)
      {
        id v19 = 0;
        id v20 = 0;
        objc_super v9 = *(void **)(v7 + 8);
        uint64_t v18 = *(void ***)v7;
        id v19 = v9;
        objc_storeStrong(&v20, *(id *)(v7 + 16));
        long long v10 = v22;
        if ((unint64_t)v22 >= *((void *)&v22 + 1))
        {
          uint64_t v11 = std::vector<DYMTLReplayerIAB::Usage>::__push_back_slow_path<DYMTLReplayerIAB::Usage const&>((uint64_t *)&v21 + 1, (uint64_t)&v18);
        }
        else
        {
          *(void *)long long v22 = v18;
          *(void *)(v10 + 8) = v19;
          *(void *)(v10 + 16) = v20;
          uint64_t v11 = v10 + 24;
        }
        *(void *)&long long v22 = v11;

        v7 += 24;
      }
      end = self->_replayerIABs.__end_;
      if (end >= self->_replayerIABs.__end_cap_.__value_)
      {
        id v13 = (DYMTLReplayerIAB *)std::vector<DYMTLReplayerIAB>::__push_back_slow_path<DYMTLReplayerIAB const&>(p_replayerIABs, (uint64_t)&v21);
      }
      else
      {
        std::allocator<DYMTLReplayerIAB>::construct[abi:ne180100]<DYMTLReplayerIAB,DYMTLReplayerIAB const&>((uint64_t)p_end_cap, self->_replayerIABs.__end_, (uint64_t)&v21);
        id v13 = (DYMTLReplayerIAB *)((char *)end + 32);
        self->_replayerIABs.__end_ = (DYMTLReplayerIAB *)((char *)end + 32);
      }
      self->_replayerIABs.__end_ = v13;
      uint64_t v18 = (void **)&v21 + 1;
      std::vector<DYMTLReplayerIAB::Usage>::__destroy_vector::operator()[abi:ne180100](&v18);

      uint64_t v14 = (char *)*((void *)v4 + 1);
      if (v14)
      {
        do
        {
          size_t v15 = v14;
          uint64_t v14 = *(char **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          size_t v15 = (char *)*((void *)v4 + 2);
          BOOL v16 = *(void *)v15 == (void)v4;
          id v4 = v15;
        }
        while (!v16);
      }
      id v4 = v15;
    }
    while (v15 != v3);
  }
}

- (void)notifyReplayerTargetCommandBuffersFinished
{
  p_replayerIABs = &self->_replayerIABs;
  begin = self->_replayerIABs.__begin_;
  end = self->_replayerIABs.__end_;
  if (begin != end)
  {
    do
    {
      uint64_t v6 = [(DYMTLIndirectArgumentBufferManager *)self blitBufferFromGPU:*(void *)begin];
      uint64_t v7 = (void *)*((void *)begin + 1);
      uint64_t v8 = (void *)*((void *)begin + 2);
      while (v7 != v8)
      {
        [(DYMTLIndirectArgumentBufferManager *)self decodeReplayerIAB:v6 offset:*v7 function:v7[1] argument:v7[2]];
        v7 += 3;
      }

      begin = (DYMTLReplayerIAB *)((char *)begin + 32);
    }
    while (begin != end);
    begin = p_replayerIABs->__begin_;
  }
  std::vector<DYMTLReplayerIAB>::__base_destruct_at_end[abi:ne180100]((uint64_t)p_replayerIABs, (uint64_t)begin);
}

- (id)blitBufferFromGPU:(id)a3
{
  id v4 = a3;
  if ([v4 storageMode])
  {
    uint64_t v5 = [v4 device];
    id v6 = (id)objc_msgSend(v5, "newBufferWithLength:options:", objc_msgSend(v4, "length"), 0);
    uint64_t v7 = [(DYMTLIndirectArgumentBufferManager *)self queue];
    uint64_t v8 = [v7 commandBuffer];
    objc_super v9 = [v8 blitCommandEncoder];
    objc_msgSend(v9, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v4, 0, v6, 0, objc_msgSend(v4, "length"));
    [v9 endEncoding];
    [v8 commit];
    [v8 waitUntilCompleted];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)decodeReplayerIAB:(id)a3 offset:(unint64_t)a4 function:(id)a5 argument:(id)a6
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  v83 = (objc_object *)a3;
  id v10 = a5;
  id v82 = a6;
  v69 = v10;
  v70 = (objc_object *)objc_msgSend(v10, "newArgumentEncoderWithBufferIndex:", objc_msgSend(v82, "index"));
  uint64_t v11 = DYMTLGetOriginalObject(v70);
  v81 = [v11 layout];

  unint64_t v80 = [(objc_object *)v70 encodedLength];
  unint64_t v79 = [(objc_object *)v83 length];
  unint64_t v71 = [(objc_object *)v83 device];
  if (self->_currentDeviceDecodingData && (objc_opt_respondsToSelector() & 1) != 0) {
    [v71 setIndirectArgumentBufferDecodingData:0];
  }
  uint64_t v86 = 0;
  v87 = 0;
  unint64_t v88 = 0;
  id v67 = [(DYMTLFunctionPlayer *)self->_player objectMap];
  unint64_t v68 = self;
  unint64_t v12 = a4 % v80;
  if (a4 % v80 < v79)
  {
    p_replayerBufferBaseVirtualAddressMap = &self->_replayerBufferBaseVirtualAddressMap;
    p_bufferVitualAddressMap = &self->_bufferVitualAddressMap;
    p_replayerSamplerMap = &self->_replayerSamplerMap;
    p_replayerTextureMap = &self->_replayerTextureMap;
    p_replayerComputePipelineMap = &self->_replayerComputePipelineMap;
    p_replayerRenderPipelineMap = &self->_replayerRenderPipelineMap;
    p_replayerIndirectCommandBufferMap = &self->_replayerIndirectCommandBufferMap;
    do
    {
      DYMTLGetOriginalObject(v83);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v90 = (id)v12;
      id v91 = v13;
      v89 = v81;
      id v14 = v82;
      v92 = (uint64_t *)&v89;
      v93 = &v91;
      v94 = &v90;
      v95 = p_replayerBufferBaseVirtualAddressMap;
      v96 = p_bufferVitualAddressMap;
      v97 = p_replayerTextureMap;
      v98 = p_replayerSamplerMap;
      v99 = p_replayerRenderPipelineMap;
      v100 = p_replayerComputePipelineMap;
      v101 = p_replayerIndirectCommandBufferMap;
      uint64_t v105 = 0;
      size_t v15 = operator new(0x20uLL);
      *size_t v15 = &unk_2700EFD48;
      v15[1] = v104;
      v15[2] = v102;
      v15[3] = &v92;
      v103 = v15;
      BOOL v16 = (id *)operator new(0x20uLL);
      *BOOL v16 = &unk_2700EFD90;
      v16[1] = v104;
      v16[2] = v102;
      v16[3] = &v92;
      v109 = v16;
      std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::swap[abi:ne180100](&v106, v104);
      std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::~__value_func[abi:ne180100](&v106);
      v85[0] = 0;
      v85[1] = 0;
      v84 = v85;
      id v17 = [v14 bufferStructType];
      uint64_t v18 = [v17 members];
      std::function<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::operator()((uint64_t)v104, v18, (uint64_t)&v84, 0);

      std::__function::__value_func<void ()(MTLArrayType *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::~__value_func[abi:ne180100](v102);
      std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::~__value_func[abi:ne180100](v104);

      v106 = (id *)v12;
      std::map<unsigned long long,unsigned long long>::map[abi:ne180100]((uint64_t *)&v107, (uint64_t)&v84);
      id v19 = v87;
      if ((unint64_t)v87 >= v88)
      {
        uint64_t v23 = ((uint64_t)v87 - v86) >> 5;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 59) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v25 = v88 - v86;
        if ((uint64_t)(v88 - v86) >> 4 > v24) {
          unint64_t v24 = v25 >> 4;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v26 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        v96 = (map<unsigned long long, std::vector<DYMTLOriginalProcessBuffer>, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::vector<DYMTLOriginalProcessBuffer>>>> *)&v88;
        unint64_t v27 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYMTLReplayerIAB>>((uint64_t)&v88, v26);
        BOOL v28 = (id *)&v27[4 * v23];
        v92 = v27;
        v93 = v28;
        v95 = (map<unsigned long long, unsigned long long, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *)&v27[4 * v29];
        id *v28 = v106;
        v28[1] = v107;
        int v30 = v108;
        v28[2] = v108;
        v31 = v28 + 2;
        unint64_t v32 = v109;
        v28[3] = v109;
        if (v32)
        {
          v30[2] = v31;
          v107 = (id *)&v108;
          v108 = 0;
          v109 = 0;
        }
        else
        {
          v28[1] = v31;
        }
        v94 = v28 + 4;
        std::vector<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::__swap_out_circular_buffer(&v86, &v92);
        long long v33 = v87;
        std::__split_buffer<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::~__split_buffer((void **)&v92);
      }
      else
      {
        *v87 = v106;
        v19[1] = v107;
        id v20 = v108;
        v19[2] = v108;
        long long v21 = v19 + 2;
        long long v22 = v109;
        v19[3] = v109;
        if (v22)
        {
          v20[2] = v21;
          v107 = (id *)&v108;
          v108 = 0;
          v109 = 0;
        }
        else
        {
          v19[1] = (id *)v21;
        }
        long long v33 = v19 + 4;
      }
      v87 = v33;
      std::__tree<BufferEntry>::destroy((uint64_t)&v107, v108);
      std::__tree<BufferEntry>::destroy((uint64_t)&v84, v85[0]);
      v12 += v80;
    }
    while (v12 < v79);
  }
  if (v68->_currentDeviceDecodingData)
  {
    if (objc_opt_respondsToSelector())
    {
      [v71 setIndirectArgumentBufferDecodingData:v68->_currentDeviceDecodingData];
      char v34 = (void **)v86;
      size_t v35 = (void **)v87;
      if ((id **)v86 != v87)
      {
        do
        {
          char v36 = DYMTLGetOriginalObject(v83);
          id v38 = *v34;
          uint64_t v37 = v34 + 1;
          unint64_t v39 = v36;
          v84 = v39;
          id v91 = v38;
          id v90 = v81;
          id v40 = v82;
          v89 = v37;
          uint64_t v105 = 0;
          v106 = (id *)&v89;
          v107 = &v90;
          v108 = (id *)&v84;
          v109 = &v91;
          long long v41 = operator new(0x20uLL);
          *long long v41 = &unk_2700EFDD8;
          v41[1] = v104;
          v41[2] = v102;
          v41[3] = &v106;
          v103 = v41;
          long long v42 = (map<unsigned long long, unsigned long long, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *)operator new(0x20uLL);
          v42->__tree_.__begin_node_ = &unk_2700EFE20;
          v42->__tree_.__pair1_.__value_.__left_ = v104;
          v42->__tree_.__pair3_.__value_ = (unint64_t)v102;
          v42[1].__tree_.__begin_node_ = &v106;
          v95 = v42;
          std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,unsigned long)>::swap[abi:ne180100](&v92, v104);
          std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,unsigned long)>::~__value_func[abi:ne180100](&v92);
          int v43 = [v40 bufferStructType];
          long long v44 = [v43 members];
          std::function<void ()(NSArray<MTLStructMember *> *,unsigned long)>::operator()((uint64_t)v104, v44, 0);

          std::__function::__value_func<void ()(MTLArrayType *,unsigned long)>::~__value_func[abi:ne180100](v102);
          std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,unsigned long)>::~__value_func[abi:ne180100](v104);

          char v34 = v37 + 3;
        }
        while (v34 != v35);
      }
    }
  }
  v106 = 0;
  uint64_t v45 = [v69 functionType];
  switch(v45)
  {
    case 1:
      uint64_t v46 = [v82 index];
      unint64_t v47 = (void *)MEMORY[0x263F3FC90];
      break;
    case 2:
      uint64_t v46 = [v82 index];
      unint64_t v47 = (void *)MEMORY[0x263F3FC60];
      break;
    case 3:
      uint64_t v46 = [v82 index];
      unint64_t v47 = (void *)MEMORY[0x263F3FC68];
      break;
    default:
      goto LABEL_33;
  }
  v106 = (id *)(v46 + *v47);
LABEL_33:
  uint64_t v48 = v86;
  v49 = v87;
  if ((id **)v86 == v87)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(v67, (unint64_t *)&v106);
  }
  else
  {
    uint64_t v50 = *(void *)(v86 + 24);
    uint64_t v51 = [(objc_object *)v83 device];
    unint64_t v52 = (void *)[v51 newBufferWithLength:8 * (v50 + (((uint64_t)v49 - v48) >> 5) * v50 + (((uint64_t)v49 - v48) >> 5)) + 16 options:0];

    id v53 = v52;
    uint64_t v54 = (uint64_t *)[v53 contents];
    v56 = (id **)v86;
    uint64_t v55 = v87;
    *uint64_t v54 = ((uint64_t)v87 - v86) >> 5;
    int64_t v57 = (id **)(v54 + 2);
    v54[1] = (uint64_t)v56[3];
    unint64_t v58 = (id **)v56[1];
    if (v58 != v56 + 2)
    {
      do
      {
        *v57++ = v58[4];
        uint64_t v59 = v58[1];
        if (v59)
        {
          do
          {
            unint64_t v60 = (id **)v59;
            uint64_t v59 = (id *)*v59;
          }
          while (v59);
        }
        else
        {
          do
          {
            unint64_t v60 = (id **)v58[2];
            BOOL v61 = *v60 == (id *)v58;
            unint64_t v58 = v60;
          }
          while (!v61);
        }
        unint64_t v58 = v60;
      }
      while (v60 != v56 + 2);
    }
    while (v56 != v55)
    {
      *v57++ = *v56;
      v62 = (id **)v56[1];
      if (v62 != v56 + 2)
      {
        do
        {
          *int64_t v57 = v62[5];
          uint64_t v63 = v62[1];
          if (v63)
          {
            do
            {
              v64 = (id **)v63;
              uint64_t v63 = (id *)*v63;
            }
            while (v63);
          }
          else
          {
            do
            {
              v64 = (id **)v62[2];
              BOOL v61 = *v64 == (id *)v62;
              v62 = v64;
            }
            while (!v61);
          }
          ++v57;
          v62 = v64;
        }
        while (v64 != v56 + 2);
      }
      v56 += 4;
    }
    v92 = (uint64_t *)&v106;
    uint64_t v65 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v67, (unint64_t *)&v106, (uint64_t)&std::piecewise_construct, &v92);
    v66 = (void *)v65[3];
    v65[3] = v53;
  }
  v92 = &v86;
  std::vector<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
}

- (void)bufferVitualAddressMap
{
  return &self->_bufferVitualAddressMap;
}

- (void)textureMap
{
  return &self->_textureMap;
}

- (void)samplerMap
{
  return &self->_samplerMap;
}

- (void)replayerBufferBaseVirtualAddressMap
{
  return &self->_replayerBufferBaseVirtualAddressMap;
}

- (void)replayerTextureMap
{
  return &self->_replayerTextureMap;
}

- (void)replayerSamplerMap
{
  return &self->_replayerSamplerMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patcher, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerIndirectCommandBufferMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerComputePipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerRenderPipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerSamplerMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerTextureMap);
  std::__tree<BufferEntry>::destroy((uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (void *)self->_replayerBufferBaseVirtualAddressMap.__tree_.__pair1_.__value_.__left_);
  p_begin = (void **)&self->_replayerIABs.__begin_;
  std::vector<DYMTLReplayerIAB>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  std::__tree<BufferEntry>::destroy((uint64_t)&self->_deviceResourcesBuffers, (void *)self->_deviceResourcesBuffers.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&self->_decodingMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>>::~__hash_table((uint64_t)&self->_encodedResourcesMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_usedSamplersMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_indirectCommandBufferMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_computePipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_renderPipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>>>::~__hash_table((uint64_t)&self->_samplerMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_textureMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_bufferLengthMap);
  std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::destroy((uint64_t)&self->_bufferVitualAddressMap, (void *)self->_bufferVitualAddressMap.__tree_.__pair1_.__value_.__left_);
  p_begin = &self->_indirectArgumentBuffers.__begin_;
  std::vector<std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_ancestorMaps.__begin_;
  std::vector<std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  begin = self->_commandBufferIds.__begin_;
  if (begin)
  {
    self->_commandBufferIds.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentDeviceDecodingData, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = (char *)self + 120;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_DWORD *)self + 72) = 1065353216;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_DWORD *)self + 82) = 1065353216;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_DWORD *)self + 92) = 1065353216;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *((_DWORD *)self + 102) = 1065353216;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_DWORD *)self + 112) = 1065353216;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *((_DWORD *)self + 122) = 1065353216;
  *(_OWORD *)((char *)self + 504) = 0u;
  *((void *)self + 62) = (char *)self + 504;
  *((void *)self + 67) = 0;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((void *)self + 68) = (char *)self + 552;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *((_DWORD *)self + 150) = 1065353216;
  *((_OWORD *)self + 38) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *((_DWORD *)self + 160) = 1065353216;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 664) = 0u;
  *((_DWORD *)self + 170) = 1065353216;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_DWORD *)self + 180) = 1065353216;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((_DWORD *)self + 190) = 1065353216;
  return self;
}

- (void)findStructTypeForArgumentIndex:inStructType:
{
}

- (__n128)findStructTypeForArgumentIndex:inStructType:
{
  *(void *)a2 = &unk_2700EFEB0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (id)findStructTypeForArgumentIndex:inStructType:
{
  id v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  size_t v15 = __Block_byref_object_copy__1;
  BOOL v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v6 = [v4 members];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZZ82__DYMTLIndirectArgumentBufferManager_findStructTypeForArgumentIndex_inStructType__ENK3__1clEP13MTLStructTypem_block_invoke;
  v9[3] = &unk_265339030;
  void v9[4] = &v12;
  v9[5] = v5;
  long long v10 = *(_OWORD *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 24);
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end