void sub_18287C194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t MTLPipelineCollection::functionWasCollected(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 1;
  }
  v3 = (_OWORD *)[a2 bitCodeHash];
  long long v4 = v3[1];
  v8[0] = *v3;
  v8[1] = v4;
  HashToString((uint64_t)v8, &__p);
  if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((void *)(a1 + 80), (unsigned __int8 *)&__p))
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((void *)(a1 + 184), (unsigned __int8 *)&__p) != 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v5;
}

void sub_18287C2F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
}

void MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash(MTLPipelineDescriptorHash *this)
{
  v2 = (id *)*((void *)this + 5);
  v3 = (id *)*((void *)this + 6);
  if (v2 != v3)
  {
    do

    while (v2 != v3);
    v2 = (id *)*((void *)this + 5);
  }
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }

  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::~__hash_table((uint64_t)this);
}

uint64_t MTLPipelineDescriptorHash::addPipelineDescriptor(MTLPipelineDescriptorHash *this, NSObject *a2)
{
  uint64_t v41 = [a2 hash];
  long long v4 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(this, (unint64_t *)&v41);
  if (v4)
  {
    BOOL v5 = v4;
    v7 = (id *)v4[3];
    v8 = (id *)v4[4];
    v6 = (char **)(v4 + 3);
    while (v7 != v8)
    {
      uint64_t result = [*v7 isEqual:a2];
      if (result) {
        return result;
      }
      ++v7;
    }
    unint64_t v10 = v5[5];
    v11 = (void *)v5[4];
    if ((unint64_t)v11 >= v10)
    {
      uint64_t v14 = ((char *)v11 - *v6) >> 3;
      if ((unint64_t)(v14 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = v10 - (void)*v6;
      uint64_t v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
        uint64_t v16 = v14 + 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17) {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v5 + 5), v17);
      }
      else {
        v18 = 0;
      }
      v19 = &v18[8 * v14];
      v20 = &v18[8 * v17];
      *(void *)v19 = a2;
      v12 = v19 + 8;
      v22 = (char *)v5[3];
      v21 = (char *)v5[4];
      if (v21 != v22)
      {
        do
        {
          uint64_t v23 = *((void *)v21 - 1);
          v21 -= 8;
          *((void *)v19 - 1) = v23;
          v19 -= 8;
        }
        while (v21 != v22);
        v21 = *v6;
      }
      v5[3] = v19;
      v5[4] = v12;
      v5[5] = v20;
      if (v21) {
        operator delete(v21);
      }
    }
    else
    {
      void *v11 = a2;
      v12 = v11 + 1;
    }
    v5[4] = v12;
  }
  else
  {
    v13 = operator new(8uLL);
    std::string __p = v13;
    void *v13 = a2;
    v39 = v13 + 1;
    v40 = v13 + 1;
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::vector<NSObject *>>((uint64_t)this, (unint64_t *)&v41, &v41, (uint64_t)&__p);
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
  }
  unint64_t v24 = *((void *)this + 7);
  v25 = (void *)*((void *)this + 6);
  if ((unint64_t)v25 >= v24)
  {
    uint64_t v27 = *((void *)this + 5);
    uint64_t v28 = ((uint64_t)v25 - v27) >> 3;
    if ((unint64_t)(v28 + 1) >> 61) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v29 = v24 - v27;
    uint64_t v30 = v29 >> 2;
    if (v29 >> 2 <= (unint64_t)(v28 + 1)) {
      uint64_t v30 = v28 + 1;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v30;
    }
    if (v31) {
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)this + 56, v31);
    }
    else {
      v32 = 0;
    }
    v33 = &v32[8 * v28];
    v34 = &v32[8 * v31];
    *(void *)v33 = a2;
    v26 = v33 + 8;
    v36 = (char *)*((void *)this + 5);
    v35 = (char *)*((void *)this + 6);
    if (v35 != v36)
    {
      do
      {
        uint64_t v37 = *((void *)v35 - 1);
        v35 -= 8;
        *((void *)v33 - 1) = v37;
        v33 -= 8;
      }
      while (v35 != v36);
      v35 = (char *)*((void *)this + 5);
    }
    *((void *)this + 5) = v33;
    *((void *)this + 6) = v26;
    *((void *)this + 7) = v34;
    if (v35) {
      operator delete(v35);
    }
  }
  else
  {
    void *v25 = a2;
    v26 = v25 + 1;
  }
  *((void *)this + 6) = v26;
  return (uint64_t)a2;
}

void sub_18287C5B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void MTLPipelineCollection::addRenderPipeline(MTLPipelineCollection *this, MTLRenderPipelineDescriptor *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v4 = [(MTLRenderPipelineDescriptor *)a2 vertexPreloadedLibraries];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v20 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  uint64_t v9 = [(MTLRenderPipelineDescriptor *)a2 fragmentPreloadedLibraries];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
  uint64_t v14 = *((void *)this + 36);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___ZN21MTLPipelineCollection17addRenderPipelineEP27MTLRenderPipelineDescriptor_block_invoke;
  v15[3] = &unk_1E5220270;
  v15[4] = a2;
  v15[5] = this;
  dispatch_sync(v14, v15);
}

void ___ZN21MTLPipelineCollection17addRenderPipelineEP27MTLRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) copy];
  [v2 setBinaryArchives:0];
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 vertexFunction])&& MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 fragmentFunction]))
  {
    MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 296), v2);
  }
}

void MTLPipelineCollection::addComputePipeline(MTLPipelineCollection *this, MTLComputePipelineDescriptor *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v4 = [(MTLComputePipelineDescriptor *)a2 preloadedLibraries];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  uint64_t v9 = *((void *)this + 36);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN21MTLPipelineCollection18addComputePipelineEP28MTLComputePipelineDescriptor_block_invoke;
  v10[3] = &unk_1E5220270;
  v10[4] = a2;
  v10[5] = this;
  dispatch_sync(v9, v10);
}

void ___ZN21MTLPipelineCollection18addComputePipelineEP28MTLComputePipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) copy];
  [v2 setBinaryArchives:0];
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 computeFunction]))MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 360), v2); {
}
  }

void MTLPipelineCollection::addTileRenderPipeline(MTLPipelineCollection *this, MTLTileRenderPipelineDescriptor *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v4 = [(MTLTileRenderPipelineDescriptor *)a2 preloadedLibraries];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  uint64_t v9 = *((void *)this + 36);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN21MTLPipelineCollection21addTileRenderPipelineEP31MTLTileRenderPipelineDescriptor_block_invoke;
  v10[3] = &unk_1E5220270;
  v10[4] = a2;
  v10[5] = this;
  dispatch_sync(v9, v10);
}

void ___ZN21MTLPipelineCollection21addTileRenderPipelineEP31MTLTileRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) copy];
  [v2 setBinaryArchives:0];
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 tileFunction]))MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 424), v2); {
}
  }

void MTLPipelineCollection::addMeshRenderPipeline(MTLPipelineCollection *this, MTLMeshRenderPipelineDescriptor *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [(MTLMeshRenderPipelineDescriptor *)a2 objectPreloadedLibraries];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v29 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }
  id v9 = [(MTLMeshRenderPipelineDescriptor *)a2 meshPreloadedLibraries];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v25 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v11);
  }
  id v14 = [(MTLMeshRenderPipelineDescriptor *)a2 fragmentPreloadedLibraries];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((void *)&v21 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v16);
  }
  long long v19 = *((void *)this + 36);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___ZN21MTLPipelineCollection21addMeshRenderPipelineEP31MTLMeshRenderPipelineDescriptor_block_invoke;
  v20[3] = &unk_1E5220270;
  v20[4] = a2;
  v20[5] = this;
  dispatch_sync(v19, v20);
}

void ___ZN21MTLPipelineCollection21addMeshRenderPipelineEP31MTLMeshRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) copy];
  [v2 setBinaryArchives:0];
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 objectFunction])&& MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 meshFunction])&& MTLPipelineCollection::functionWasCollected(v1, (void *)[v2 fragmentFunction]))
  {
    MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 488), v2);
  }
}

__n128 MTLPipelineCollection::getFunctionData(uint64_t a1, __n128 *a2, __n128 *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_OWORD *)(*(uint64_t (**)(unint64_t))(*(void *)a2->n128_u64[0] + 296))(a2->n128_u64[0]);
  long long v7 = v6[1];
  v14[0] = *v6;
  v14[1] = v7;
  uint64_t v12 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(a1 + 224, (unsigned int *)v14);
  if ((uint64_t *)(a1 + 232) == v12) {
    MTLReportFailure(0, "getFunctionData", 540, @"library was not collected for function %@", v8, v9, v10, v11, a2->n128_i64[1]);
  }
  a3->n128_u32[0] = v12[8];
  a3->n128_u64[1] = a2->n128_u64[1];
  __n128 result = a2[1];
  a3[1] = result;
  return result;
}

void MTLPipelineCollection::getFunctionData(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_OWORD *)[a2 bitCodeHash];
  long long v7 = v6[1];
  v31[0] = *v6;
  v31[1] = v7;
  HashToString((uint64_t)v31, &v28);
  uint64_t v8 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>((void *)(a1 + 80), (unsigned __int8 *)&v28);
  if (v8)
  {
    uint64_t v9 = (_OWORD *)(*(uint64_t (**)(void))(***((void ***)v8 + 5) + 296))(**((void **)v8 + 5));
    long long v10 = v9[1];
    v30[0] = *v9;
    v30[1] = v10;
    uint64_t v11 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(a1 + 224, (unsigned int *)v30);
    if ((uint64_t *)(a1 + 232) == v11)
    {
      uint64_t v22 = [a2 name];
      MTLReportFailure(0, "getFunctionData", 568, @"library was not collected for function %@", v23, v24, v25, v26, v22);
    }
    *(_DWORD *)a3 = v11[8];
    *(void *)(a3 + 8) = [a2 name];
    *(void *)(a3 + 16) = [a2 options];
  }
  else
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
    uint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1 + 184, (unsigned __int8 *)&v28, (uint64_t)&std::piecewise_construct, (long long **)&__p);
    std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map((uint64_t)v30, (uint64_t)(v12 + 40));
    uint64_t v13 = (_OWORD *)[a2 functionConstantSpecializationHash];
    long long v14 = v13[1];
    v29[0] = *v13;
    v29[1] = v14;
    HashToString((uint64_t)v29, &__p);
    uint64_t v15 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v30, (unsigned __int8 *)&__p);
    if (v15)
    {
      uint64_t v16 = *((void *)v15 + 5);
      *(_DWORD *)a3 = -1;
      *(void *)(a3 + 8) = *(void *)(v16 + 40);
    }
    else
    {
      uint64_t v17 = [a2 name];
      MTLReportFailure(0, "getFunctionData", 593, @"function %@ was not collected but it is referenced in the descriptor", v18, v19, v20, v21, v17);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v30);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
}

void sub_18287D1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&a27);
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void MTLPipelineCollection::dumpLibraries(MTLPipelineCollection *this, NSString *a2)
{
  v2 = *((void *)this + 36);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ZN21MTLPipelineCollection13dumpLibrariesEP8NSString_block_invoke;
  v3[3] = &unk_1E5220270;
  v3[4] = a2;
  v3[5] = this;
  dispatch_sync(v2, v3);
}

void ___ZN21MTLPipelineCollection13dumpLibrariesEP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = (void *)MEMORY[0x18530C9F0]();
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *(void **)(v2 + 32);
  if (v5 != (void *)(v2 + 40))
  {
    uint64_t v6 = (void *)v4;
    do
    {
      uint64_t v7 = v5[8];
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t v9 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v8];
      if (([v6 fileExistsAtPath:v9] & 1) == 0)
      {
        long long v14 = *(void **)(v7 + 24);
        if (!v14) {
          MTLReportFailure(0, "dumpLibraries_block_invoke", 668, @"unable to load library data for %@", v10, v11, v12, v13, v8);
        }
        uint64_t v22 = 0;
        if (([v14 writeToFile:v9 options:0 error:&v22] & 1) == 0) {
          MTLReportFailure(0, "dumpLibraries_block_invoke", 672, @"unable to write library data to %@: %@", v15, v16, v17, v18, v9);
        }
      }
      uint64_t v19 = (void *)v5[1];
      if (v19)
      {
        do
        {
          uint64_t v20 = v19;
          uint64_t v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          uint64_t v20 = (void *)v5[2];
          BOOL v21 = *v20 == (void)v5;
          uint64_t v5 = v20;
        }
        while (!v21);
      }
      uint64_t v5 = v20;
    }
    while (v20 != (void *)(v2 + 40));
  }
}

uint64_t MTLPipelineCollection::JSONData(MTLPipelineCollection *this)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__12;
  uint64_t v9 = __Block_byref_object_dispose__12;
  uint64_t v10 = 0;
  uint64_t v1 = *((void *)this + 36);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN21MTLPipelineCollection8JSONDataEv_block_invoke;
  v4[3] = &unk_1E5220298;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void ___ZN21MTLPipelineCollection8JSONDataEv_block_invoke(uint64_t a1)
{
}

void MTLPipelineCollection::JSONDataNoSync(MTLPipelineCollection *this)
{
  v1[4] = *MEMORY[0x1E4F143B8];
  if ((*((void *)this + 3) & 0x18) != 0)
  {
    v1[0] = &unk_1ECAC7158;
    v1[1] = this;
    v1[3] = v1;
    MTLPipelineLibrarySerializer::PipelineLibrarySerializerInterface::createMetalScriptSerializer();
  }
  operator new();
}

void sub_18287ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
}

void MTLPipelineCollection::writeJSONToFile(MTLPipelineCollection *this, NSString *a2)
{
  uint64_t v2 = *((void *)this + 36);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ZN21MTLPipelineCollection15writeJSONToFileEP8NSString_block_invoke;
  v3[3] = &unk_1E5220270;
  v3[4] = a2;
  v3[5] = this;
  dispatch_sync(v2, v3);
}

void ___ZN21MTLPipelineCollection15writeJSONToFileEP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(MTLPipelineCollection **)(a1 + 40);
  MEMORY[0x18530C9F0]();
  MTLPipelineCollection::JSONDataNoSync(v1);
}

void MTLPipelineLibrarySerializer::ComputePipelineDescriptor::~ComputePipelineDescriptor(MTLPipelineLibrarySerializer::ComputePipelineDescriptor *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    *((void *)this + 7) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 3);
  if (v4)
  {
    *((void *)this + 4) = v4;
    operator delete(v4);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void MTLPipelineLibrarySerializer::RenderPipelineDescriptor::~RenderPipelineDescriptor(MTLPipelineLibrarySerializer::RenderPipelineDescriptor *this)
{
  uint64_t v2 = (void *)*((void *)this + 21);
  if (v2)
  {
    *((void *)this + 22) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((void *)this + 18);
  if (v3)
  {
    *((void *)this + 19) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 6);
  if (v4)
  {
    *((void *)this + 7) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 3);
  if (v5)
  {
    *((void *)this + 4) = v5;
    operator delete(v5);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void MTLPipelineLibrarySerializer::MeshRenderPipelineDescriptor::~MeshRenderPipelineDescriptor(MTLPipelineLibrarySerializer::MeshRenderPipelineDescriptor *this)
{
  uint64_t v2 = (void *)*((void *)this + 28);
  if (v2)
  {
    *((void *)this + 29) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((void *)this + 25);
  if (v3)
  {
    *((void *)this + 26) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 22);
  if (v4)
  {
    *((void *)this + 23) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 6);
  if (v5)
  {
    *((void *)this + 7) = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 3);
  if (v6)
  {
    *((void *)this + 4) = v6;
    operator delete(v6);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

std::string *std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map((uint64_t)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_18287F284(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::~MTLSpecializedFunctionDescriptor(id *this)
{
  MTLPipelineLibrarySerializer::FunctionDescriptor::~FunctionDescriptor(this);
}

void MTLPipelineLibrarySerializer::LibraryDescriptor::~LibraryDescriptor(id *this)
{
}

void MTLPipelineLibrarySerializer::StitchedLibraryDescriptor::~StitchedLibraryDescriptor(id *this)
{
}

MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::MTLSpecializedFunctionDescriptor(MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *this, MTLLibraryData *a2, NSString *a3, MTLFunctionConstantValues *a4, NSString *a5, NSString *a6, MTLFunctionType a7, uint64_t a8)
{
  uint64_t v12 = MTLPipelineLibrarySerializer::FunctionDescriptor::FunctionDescriptor(this, a2, a3, a7, a8);
  *((void *)v12 + 4) = 0;
  *((void *)v12 + 5) = 0;
  *((void *)v12 + 6) = 0;
  *((void *)v12 + 4) = [(MTLFunctionConstantValues *)a4 copy];
  *((void *)this + 5) = [(NSString *)a5 copy];
  *((void *)this + 6) = [(NSString *)a6 copy];
  return this;
}

void sub_18287F3E4(_Unwind_Exception *a1)
{
  MTLPipelineLibrarySerializer::FunctionDescriptor::~FunctionDescriptor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      v3 = (void *)*v2;
      long long v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_18287F5B0(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    uint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2))return i; {
        }
          }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_18287F824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v8[4] = *(void *)(a3 + 16);
  }
  v8[5] = *(void *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_18287F8D8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    long long v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2))return i; {
        }
          }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_18287FB68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_18287FC1C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    long long v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2))return i; {
        }
          }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_18287FEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_18287FF60(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    long long v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2))return i; {
        }
          }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_182880200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x50uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  double result = 0.0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *((_DWORD *)v8 + 18) = 1065353216;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1828802B0(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2))return i; {
        }
          }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  size_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_18288057C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v8[4] = *(void *)(a3 + 16);
  }
  v8[5] = *(void *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_182880630(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::vector<NSObject *>>(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    uint8x8_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      unint64_t v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = *((void *)v12 + 1);
          if (v13 == v8)
          {
            if (*((void *)v12 + 2) == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          unint64_t v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  long long v14 = (void *)(a1 + 16);
  unint64_t v12 = (char *)operator new(0x30uLL);
  *(void *)unint64_t v12 = 0;
  *((void *)v12 + 1) = v8;
  *((void *)v12 + 2) = *a3;
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a4;
  *((void *)v12 + 5) = *(void *)(a4 + 16);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  size_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *(void *)unint64_t v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }
  *(void *)unint64_t v12 = *v14;
  *long long v14 = v12;
  *(void *)(v21 + 8 * v4) = v14;
  if (*(void *)v12)
  {
    unint64_t v23 = *(void *)(*(void *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    size_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_182880894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::~__func()
{
}

void *std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_1ECAC7158;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1ECAC7158;
  a2[1] = v2;
  return result;
}

void std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::operator()(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 8);
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  MTLPipelineCollection::getFunctionData(v4, v3, a3);
}

uint64_t std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::target_type()
{
}

void *std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<MTLSerializer::ObjectSerializer *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_182880A60(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__CFString *MTLCompareFunctionString(unint64_t a1)
{
  if (a1 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E5222068[a1];
  }
}

__CFString *MTLCommandEncoderErrorStateToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_1E5222190 + a1);
  }
}

void sub_18288621C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _doMTLSyncDispatch(uint64_t a1, void **a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    size_t v8 = 0;
    do
    {
      unint64_t v9 = (void *)*v4;
      if (((*(uint64_t (**)(void))(v4[1] + 16))() & 1) != 0 || (*a4 & 0xFFFFFFFE) == 2)
      {
        _Block_release((const void *)v4[1]);
        if (v8) {
          uint8x8_t v10 = v8;
        }
        else {
          uint8x8_t v10 = a2;
        }
        *uint8x8_t v10 = v9;
        if (!v9) {
          *a3 = v8;
        }
        free(v4);
      }
      else
      {
        size_t v8 = v4;
      }
      uint64_t v4 = v9;
    }
    while (v9);
  }
}

void validateMTLAttributeFormat(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1 >= 0x38) {
    _MTLMessageContextPush_(a2, 4, @"format is not a valid MTLVertexFormat / MTLAttributeFormat.", a4, a5, a6, a7, a8, a9);
  }
}

uint64_t MTLAttributeFormatAlignment(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized)) {
    return qword_1828F2CD0[a1];
  }
  MTLReportFailure(0, "MTLAttributeFormatAlignment", 156, @"format is not a valid MTLVertexFormat / MTLAttributeFormat.", a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t MTLAttributeFormatComponentCount(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized)) {
    return qword_1828F2E90[a1];
  }
  MTLReportFailure(0, "MTLAttributeFormatComponentCount", 173, @"format is not a valid MTLVertexFormat / MTLAttributeFormat.", a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t MTLAttributeFormatSize(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized)) {
    return qword_1828F3050[a1];
  }
  MTLReportFailure(0, "MTLAttributeFormatSize", 202, @"format is not a valid MTLVertexFormat / MTLAttributeFormat.", a5, a6, a7, a8, vars0);
  return 0;
}

__CFString *MTLAttributeFormatString(MTLAttributeFormat a1)
{
  if (a1 > MTLAttributeFormatFloatRGB9E5) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_1E52221B8 + a1);
  }
}

uint64_t isVertexFormatInteger(MTLAttributeFormat a1, int *a2, BOOL *a3)
{
  uint64_t v3 = a1 - 1;
  int v4 = 1;
  BOOL v5 = 1;
  uint64_t result = 1;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 44:
      BOOL v5 = 0;
      break;
    case 3:
    case 4:
    case 5:
    case 45:
      break;
    case 12:
    case 13:
    case 14:
    case 48:
      BOOL v5 = 0;
      goto LABEL_4;
    case 15:
    case 16:
    case 17:
    case 49:
LABEL_4:
      int v4 = 2;
      break;
    case 31:
    case 32:
    case 33:
    case 34:
      goto LABEL_6;
    case 35:
    case 36:
    case 37:
    case 38:
      BOOL v5 = 0;
LABEL_6:
      int v4 = 4;
      break;
    default:
      int v4 = 0;
      BOOL v5 = 0;
      uint64_t result = 0;
      break;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t MTLVertexDescriptorEquivalent(MTLVertexDescriptorInternal *a1, MTLVertexDescriptorInternal *a2)
{
  if (a1 == a2 || _isDefaultVertexDescriptor(a1) && _isDefaultVertexDescriptor(a2)) {
    return 1;
  }

  return [(MTLVertexDescriptorInternal *)a1 isEqual:a2];
}

BOOL _isDefaultVertexDescriptor(MTLVertexDescriptorInternal *a1)
{
  if (a1)
  {
    for (uint64_t i = 0; i != 31; ++i)
    {
      uint64_t v2 = a1->_vertexBufferArray->_descriptors[i];
      if (v2 && (v2->_stride || v2->_stepFunction != 1 || v2->_instanceStepRate != 1)) {
        return 0;
      }
    }
    unint64_t v3 = 0;
    BOOL v4 = 0;
    do
    {
      BOOL v5 = a1->_attributeArray->_descriptors[v3];
      if (v5 && (v5->_vertexFormat || v5->_bufferIndex || v5->_offset)) {
        break;
      }
      BOOL v4 = v3++ > 0x1D;
    }
    while (v3 != 31);
  }
  else
  {
    return 1;
  }
  return v4;
}

void _submitAvailableCommandBuffers(void *a1)
{
  [a1 _submitAvailableCommandBuffers];
}

char *mdb_strerror(int a1)
{
  if (!a1) {
    return "Successful return: 0";
  }
  if ((a1 + 30799) > 0x14) {
    return strerror(a1);
  }
  return mdb_errstr[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 24);
  if (v4 == mdb_cmp_int)
  {
    if (*a3 == 8) {
      return mdb_cmp_cint(a3, a4);
    }
    BOOL v4 = mdb_cmp_int;
  }
  return v4((uint64_t)a3, a4);
}

uint64_t mdb_cmp_int(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = **(_DWORD **)(a1 + 8);
  unsigned int v3 = **(_DWORD **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_cmp_cint(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = *a1 - 2;
  BOOL v4 = (unsigned __int16 *)(v2 + v3);
  BOOL v5 = (unsigned __int16 *)(*(void *)(a2 + 8) + v3);
  uint64_t v6 = v4;
  do
  {
    int v8 = *v6--;
    int v7 = v8;
    int v9 = *v5--;
    uint64_t result = (v7 - v9);
    BOOL v11 = v7 == v9 && (unint64_t)v4 > v2;
    BOOL v4 = v6;
  }
  while (v11);
  return result;
}

uint64_t mdb_env_sync0(uint64_t a1, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x20000) != 0) {
    return 13;
  }
  if (!a2 && (v3 & 0x10000) != 0) {
    return 0;
  }
  if ((v3 & 0x80000) == 0)
  {
    uint64_t result = fsync(*(_DWORD *)a1);
    if (!result) {
      return result;
    }
    return *__error();
  }
  if (((a2 == 0) & ((v3 & 0x100000u) >> 20)) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = 16;
  }
  uint64_t result = msync(*(void **)(a1 + 56), *(unsigned int *)(a1 + 16) * a3, v5);
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  return mdb_env_sync0(a1, a2, *(void *)(*(void *)(a1+ 72+ 8* ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72)+ 128) < *(void *)(*(void *)(a1 + 80) + 128))))+ 120)+ 1);
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0) {
    return 22;
  }
  else {
    return mdb_txn_renew0(a1);
  }
}

uint64_t mdb_txn_renew0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 128));
      if (v5) {
        return v5;
      }
      uint64_t v6 = *(void *)(v3 + 8);
      uint64_t v7 = *(void *)(v2 + 8 * (v6 & 1) + 72);
    }
    else
    {
      uint64_t v7 = *(void *)(v2
                     + 72
                     + 8
                     * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128))));
      uint64_t v6 = *(void *)(v7 + 128);
    }
    *(void *)(a1 + 24) = v6 + 1;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    int v9 = *(void **)(v2 + 208);
    *(void *)(a1 + 72) = v9;
    *int v9 = 0;
    uint8x8_t v10 = *(void **)(v2 + 200);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = 0;
    *uint8x8_t v10 = 0;
    *(void *)(a1 + 64) = 0;
    *(void *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4 * *(unsigned int *)(v2 + 36));
    int v11 = 0;
    goto LABEL_35;
  }
  if (!v3)
  {
    int v11 = 0;
    uint64_t v7 = *(void *)(v2
                   + 72
                   + 8
                   * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128))));
    *(void *)(a1 + 24) = *(void *)(v7 + 128);
    *(void *)(a1 + 72) = 0;
LABEL_35:
    unint64_t v24 = *(_OWORD **)(a1 + 88);
    long long v25 = *(_OWORD *)(v7 + 40);
    *unint64_t v24 = *(_OWORD *)(v7 + 24);
    v24[1] = v25;
    long long v26 = *(_OWORD *)(v7 + 56);
    long long v27 = *(_OWORD *)(v7 + 72);
    long long v28 = *(_OWORD *)(v7 + 104);
    v24[4] = *(_OWORD *)(v7 + 88);
    v24[5] = v28;
    v24[2] = v26;
    v24[3] = v27;
    *(void *)(a1 + 16) = *(void *)(v7 + 120) + 1;
    LODWORD(v24) = *(_DWORD *)(v2 + 32);
    *(_DWORD *)(a1 + 120) = v24;
    *(_DWORD *)(a1 + 124) = v4 & 0x20000;
    if (v24 >= 3)
    {
      unint64_t v29 = 2;
      uint64_t v30 = 100;
      do
      {
        int v31 = *(__int16 *)(*(void *)(v2 + 144) + 2 * v29);
        *(_WORD *)(*(void *)(a1 + 88) + v30) = *(_WORD *)(*(void *)(v2 + 144) + 2 * v29) & 0x7FFF;
        if (v31 < 0) {
          char v32 = 26;
        }
        else {
          char v32 = 0;
        }
        *(unsigned char *)(*(void *)(a1 + 112) + v29++) = v32;
        v30 += 48;
      }
      while (v29 < *(unsigned int *)(a1 + 120));
    }
    *(unsigned char *)(*(void *)(a1 + 112) + 1) = 24;
    **(unsigned char **)(a1 + 112) = 8;
    if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
    {
      uint64_t v5 = 4294936501;
    }
    else
    {
      if (*(void *)(v2 + 128) >= *(void *)(a1 + 16)) {
        return 0;
      }
      uint64_t v5 = 4294936511;
    }
    mdb_txn_end((unsigned int *)a1, v11 | 5);
    return v5;
  }
  if ((*(unsigned char *)(v2 + 14) & 0x20) != 0)
  {
    int v8 = *(_DWORD **)(a1 + 72);
    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    int v8 = pthread_getspecific(*(void *)(v2 + 160));
    if (v8)
    {
LABEL_8:
      if (v8[2] != *(_DWORD *)(v2 + 40) || *(void *)v8 != -1) {
        return 4294936513;
      }
      goto LABEL_32;
    }
  }
  int v12 = *(_DWORD *)(v2 + 40);
  pthread_t v13 = pthread_self();
  uint64_t v14 = *(void *)(v2 + 64);
  if (!*(_DWORD *)(v2 + 224))
  {
    uint64_t v5 = mdb_reader_pid(v2, 8, v12);
    if (v5) {
      return v5;
    }
    *(_DWORD *)(v2 + 224) = 1;
  }
  float v15 = (pthread_mutex_t *)(v14 + 24);
  uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 24));
  if (!v5)
  {
    int v16 = *(_DWORD *)(v3 + 16);
    if (v16)
    {
      unsigned int v17 = 0;
      unint64_t v18 = (int *)(v3 + 200);
      while (1)
      {
        int v19 = *v18;
        v18 += 16;
        if (!v19) {
          break;
        }
        if (v16 == ++v17)
        {
          unsigned int v17 = *(_DWORD *)(v3 + 16);
          break;
        }
      }
    }
    else
    {
      unsigned int v17 = 0;
    }
    if (v17 == *(_DWORD *)(v2 + 24))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 24));
      return 4294936506;
    }
    uint64_t v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 200) = 0;
    *(void *)(v20 + 192) = -1;
    int v8 = (_DWORD *)(v20 + 192);
    *((void *)v8 + 2) = v13;
    if (v17 == v16) {
      *(_DWORD *)(v3 + 16) = ++v16;
    }
    *(_DWORD *)(v2 + 28) = v16;
    _OWORD v8[2] = v12;
    pthread_mutex_unlock(v15);
    int v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      int v11 = v21 & 0x200000;
      goto LABEL_33;
    }
    uint64_t v22 = pthread_setspecific(*(void *)(v2 + 160), v8);
    if (v22)
    {
      uint64_t v5 = v22;
      _OWORD v8[2] = 0;
      return v5;
    }
LABEL_32:
    int v11 = 0;
    do
LABEL_33:
      *(void *)int v8 = *(void *)(v3 + 8);
    while (*(void *)v8 != *(void *)(v3 + 8));
    uint64_t v23 = *(void *)v8;
    *(void *)(a1 + 24) = *(void *)v8;
    *(void *)(a1 + 72) = v8;
    uint64_t v7 = *(void *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_35;
  }
  return v5;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0) {
    return 13;
  }
  int v10 = v4 & 0x80000 | a3 & 0x70000;
  if (a2)
  {
    int v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0) {
        return 22;
      }
      else {
        return 4294936514;
      }
    }
    int v13 = 152;
    int v14 = 57;
    uint64_t v15 = 19;
  }
  else
  {
    if ((a3 & 0x20000) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 104);
      goto LABEL_28;
    }
    uint64_t v15 = 17;
    int v14 = 49;
    int v13 = 136;
  }
  size_t v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  unsigned int v17 = malloc_type_calloc(1uLL, v16, 0xC111C8FuLL);
  if (!v17) {
    return 12;
  }
  uint64_t v12 = (uint64_t)v17;
  v17[10] = *(void *)(a1 + 136);
  v17[11] = &v17[v15];
  uint64_t v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (a2)
  {
    v17[12] = *(void *)(a2 + 96);
    v17[13] = &v17[6 * v18 + v15];
    int v19 = malloc_type_malloc(0x200000uLL, 0x108004057E67DB5uLL);
    *(void *)(v12 + 72) = v19;
    if (v19)
    {
      uint64_t v20 = mdb_midl_alloc(0x1FFFF);
      *(void *)(v12 + 40) = v20;
      int v19 = *(void **)(v12 + 72);
      if (v20)
      {
        *(_DWORD *)(v12 + 128) = *(_DWORD *)(a2 + 128);
        void *v19 = 0;
        *(void *)(v12 + 64) = 0;
        *(_OWORD *)(v12 + 16) = *(_OWORD *)(a2 + 16);
        uint64_t v21 = *(unsigned int *)(a2 + 120);
        *(_DWORD *)(a2 + 124) |= 0x10u;
        *(void *)(a2 + 8) = v12;
        *(void *)uint64_t v12 = a2;
        *(_DWORD *)(v12 + 120) = v21;
        memcpy(*(void **)(v12 + 88), *(const void **)(a2 + 88), 48 * v21);
        if (*(_DWORD *)(v12 + 120))
        {
          unint64_t v22 = 0;
          do
          {
            *(unsigned char *)(*(void *)(v12 + 112) + v22) = *(unsigned char *)(*(void *)(a2 + 112) + v22) & 0xFB;
            ++v22;
          }
          while (v22 < *(unsigned int *)(v12 + 120));
        }
        *(_OWORD *)(v12 + 136) = *(_OWORD *)(a1 + 176);
        uint64_t v23 = *(int **)(a1 + 176);
        if (v23)
        {
          int v24 = *v23;
          long long v25 = mdb_midl_alloc(*v23);
          *(void *)(a1 + 176) = v25;
          if (!v25)
          {
            uint64_t v5 = 12;
LABEL_31:
            mdb_txn_end((unsigned int *)v12, 6);
            goto LABEL_32;
          }
          memcpy(v25, *(const void **)(v12 + 136), 8 * v24 + 8);
        }
        uint64_t v5 = mdb_cursor_shadow(a2, (void *)v12);
        if (!v5) {
          goto LABEL_29;
        }
        goto LABEL_31;
      }
    }
    free(v19);
    free((void *)v12);
    return 12;
  }
  v17[12] = *(void *)(a1 + 152);
LABEL_28:
  uint64_t v5 = mdb_txn_renew0(v12);
  if (!v5)
  {
LABEL_29:
    uint64_t v5 = 0;
    *(_DWORD *)(v12 + 124) |= v10;
    *a4 = v12;
    return v5;
  }
LABEL_32:
  if (v12 != *(void *)(a1 + 104)) {
    free((void *)v12);
  }
  return v5;
}

uint64_t mdb_cursor_shadow(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 < 1) {
    return 0;
  }
  while (1)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 104) + 8 * (v2 - 1));
    if (v5) {
      break;
    }
LABEL_10:
    if (v2-- <= 1) {
      return 0;
    }
  }
  uint64_t v6 = (v2 - 1);
  if (v5[2]) {
    size_t v7 = 888;
  }
  else {
    size_t v7 = 392;
  }
  while (1)
  {
    int v8 = (void **)malloc_type_malloc(v7, 0xC8AE77B4uLL);
    if (!v8) {
      return 12;
    }
    int v9 = v8;
    memcpy(v8, v5, 0x188uLL);
    v5[1] = v9;
    v5[5] = a2[11] + 48 * (v2 - 1);
    v5[3] = a2;
    v5[7] = a2[14] + v6;
    uint64_t v10 = v5[2];
    if (v10)
    {
      memcpy(v9 + 49, (const void *)v5[2], 0x1F0uLL);
      *(void *)(v10 + 24) = a2;
    }
    uint64_t v11 = a2[13];
    *uint64_t v5 = *(void *)(v11 + 8 * v6);
    *(void *)(v11 + 8 * v6) = v5;
    uint64_t v5 = *v9;
    if (!*v9) {
      goto LABEL_10;
    }
  }
}

void mdb_txn_end(unsigned int *a1, int a2)
{
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = a1[30];
  if ((int)v5 >= 3)
  {
    uint64_t v6 = *((void *)a1 + 14);
    unint64_t v7 = v5 + 1;
    do
    {
      uint64_t v8 = (v7 - 2);
      if ((*(unsigned char *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((void *)a1 + 11) + 48 * v8 + 4) | 0x8000;
        }
        else
        {
          uint64_t v9 = *(void *)(v4 + 136);
          uint64_t v10 = *(void **)(v9 + 48 * v8 + 8);
          if (v10)
          {
            uint64_t v11 = (void *)(v9 + 48 * v8);
            void *v11 = 0;
            v11[1] = 0;
            uint64_t v12 = *(void *)(v4 + 152);
            *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }
      --v7;
    }
    while (v7 > 3);
  }
  if ((a2 & 0x10) != 0 && *(_DWORD *)(v4 + 32) < v5) {
    *(_DWORD *)(v4 + 32) = v5;
  }
  unsigned int v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    unint64_t v22 = (void *)*((void *)a1 + 9);
    if (v22)
    {
      void *v22 = -1;
      if ((*(unsigned char *)(v4 + 14) & 0x20) == 0)
      {
LABEL_31:
        *((void *)a1 + 9) = 0;
        goto LABEL_32;
      }
      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((void *)a1 + 9) + 8) = 0;
        goto LABEL_31;
      }
    }
LABEL_32:
    int v23 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v23;
LABEL_33:
    if ((a2 & 0x20) == 0) {
      return;
    }
    goto LABEL_39;
  }
  if (v13) {
    goto LABEL_33;
  }
  uint64_t v15 = (_OWORD *)(v4 + 176);
  uint64_t v14 = *(void *)(v4 + 176);
  if ((a2 & 0x10) == 0) {
    mdb_cursors_close((uint64_t)a1, 0);
  }
  if ((*(unsigned char *)(v4 + 14) & 8) == 0)
  {
    size_t v16 = (unsigned int *)*((void *)a1 + 9);
    unsigned int v17 = *v16;
    if (*v16)
    {
      uint64_t v18 = *((void *)a1 + 4);
      unsigned int v19 = 1;
      do
      {
        uint64_t v20 = *(void **)&v16[4 * v19 + 2];
        if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
        {
          free(v20);
        }
        else
        {
          void *v20 = *(void *)(v18 + 192);
          *(void *)(v18 + 192) = v20;
        }
        ++v19;
      }
      while (v19 <= v17);
    }
    *(void *)size_t v16 = 0;
  }
  *((void *)a1 + 15) = 0x100000000;
  uint64_t v21 = *(void *)a1;
  if (*(void *)a1)
  {
    *(void *)(v21 + 8) = 0;
    *(_DWORD *)(v21 + 124) &= ~0x10u;
    *uint64_t v15 = *(_OWORD *)(a1 + 34);
    mdb_midl_free(*((void *)a1 + 5));
    free(*((void **)a1 + 9));
  }
  else
  {
    mdb_midl_shrink((uint64_t *)a1 + 5);
    *(void *)(v4 + 200) = *((void *)a1 + 5);
    *(void *)(v4 + 96) = 0;
    *(void *)uint64_t v15 = 0;
    *(void *)(v4 + 184) = 0;
    int v24 = *(pthread_mutex_t **)(v4 + 64);
    if (v24) {
      pthread_mutex_unlock(v24 + 2);
    }
    LOBYTE(a2) = 0;
  }
  mdb_midl_free(*((void *)a1 + 8));
  mdb_midl_free(v14);
  if ((a2 & 0x20) != 0)
  {
LABEL_39:
    free(a1);
  }
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
      mdb_txn_end((unsigned int *)a1, 3);
    }
  }
}

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      mdb_txn_abort();
    }
    mdb_txn_end((unsigned int *)a1, 2097186);
  }
}

uint64_t mdb_txn_commit(uint64_t a1)
{
  if (!a1) {
    return 22;
  }
  if (*(void *)(a1 + 8))
  {
    uint64_t appended = mdb_txn_commit();
    if (appended) {
      goto LABEL_9;
    }
  }
  int v3 = 2097201;
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0) {
    goto LABEL_53;
  }
  uint64_t v5 = *(void *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5) {
      *(_DWORD *)(v5 + 124) |= 2u;
    }
    uint64_t appended = 4294936514;
LABEL_9:
    mdb_txn_abort(a1);
    return appended;
  }
  if (!v5)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(v20 + 96) != a1)
    {
      uint64_t appended = 22;
      goto LABEL_9;
    }
    mdb_cursors_close(a1, 0);
    if (**(void **)(a1 + 72) || (*(unsigned char *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        uint64_t v62 = 0;
        memset(v61, 0, sizeof(v61));
        long long v60 = xmmword_1828F3220;
        mdb_cursor_init((uint64_t)v61, a1, 1u, 0);
        unint64_t v21 = *(unsigned int *)(a1 + 120);
        if (v21 >= 3)
        {
          unint64_t v22 = 2;
          uint64_t v23 = 96;
          do
          {
            if (*(unsigned char *)(*(void *)(a1 + 112) + v22))
            {
              if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * v22) != *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152)
                                                                            + 4 * v22))
              {
                uint64_t appended = 4294936516;
                goto LABEL_9;
              }
              uint64_t v24 = *(void *)(a1 + 80);
              *((void *)&v60 + 1) = *(void *)(a1 + 88) + v23;
              uint64_t v25 = mdb_cursor_put((uint64_t)v61, (size_t *)(v24 + v23), (uint64_t)&v60, 2);
              if (v25)
              {
                uint64_t appended = v25;
                goto LABEL_9;
              }
              unint64_t v21 = *(unsigned int *)(a1 + 120);
            }
            ++v22;
            v23 += 48;
          }
          while (v22 < v21);
        }
      }
      uint64_t appended = mdb_freelist_save(a1);
      if (appended) {
        goto LABEL_9;
      }
      mdb_midl_free(*(void *)(v20 + 176));
      *(void *)(v20 + 176) = 0;
      mdb_midl_shrink((uint64_t *)(a1 + 40));
      uint64_t appended = mdb_page_flush(a1, 0);
      if (appended) {
        goto LABEL_9;
      }
      if ((*(unsigned char *)(a1 + 126) & 1) == 0)
      {
        uint64_t appended = mdb_env_sync0(v20, 0, *(void *)(a1 + 16));
        if (appended) {
          goto LABEL_9;
        }
      }
      uint64_t appended = mdb_env_write_meta(a1);
      if (appended) {
        goto LABEL_9;
      }
      int v26 = *(_DWORD *)(v20 + 12);
      if ((v26 & 0x2000000) != 0)
      {
        if ((v26 & 0x400000) == 0)
        {
          uint64_t appended = mdb_env_share_locks(v20, (int *)v61);
          if (appended) {
            goto LABEL_9;
          }
          int v26 = *(_DWORD *)(v20 + 12);
        }
        *(_DWORD *)(v20 + 12) = v26 ^ 0x2000000;
      }
      int v3 = 16;
    }
LABEL_53:
    mdb_txn_end((unsigned int *)a1, v3);
    return 0;
  }
  uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if (appended) {
    goto LABEL_9;
  }
  mdb_midl_free(*(void *)(a1 + 40));
  *(void *)(v5 + 16) = *(void *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  mdb_cursors_close(a1, 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48 * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(unsigned char **)(v5 + 112) = **(unsigned char **)(a1 + 112);
  *(unsigned char *)(*(void *)(v5 + 112) + 1) = *(unsigned char *)(*(void *)(a1 + 112) + 1);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    unint64_t v6 = 2;
    do
    {
      *(unsigned char *)(*(void *)(v5 + 112) + v6) = *(unsigned char *)(*(void *)(a1 + 112) + v6) | *(unsigned char *)(*(void *)(v5 + 112)
                                                                                                 + v6) & 4;
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 120));
  }
  unint64_t v7 = *(unsigned int **)(v5 + 64);
  uint64_t v9 = *(unsigned int **)(v5 + 72);
  uint64_t v8 = (int **)(v5 + 64);
  uint64_t v10 = *(unsigned int **)(a1 + 72);
  if (v7)
  {
    unsigned int v11 = *v7;
    if (*v7)
    {
      *(void *)unint64_t v7 = -1;
      unsigned int v12 = *v10;
      if (*v10)
      {
        if (v12 + 1 > 2) {
          uint64_t v13 = v12 + 1;
        }
        else {
          uint64_t v13 = 2;
        }
        uint64_t v14 = 1;
        unsigned int v15 = v11;
        int v16 = v11;
        do
        {
          unint64_t v17 = 2 * *(void *)&v10[4 * v14];
          do
          {
            int v18 = v16;
            unint64_t v19 = *(void *)&v7[2 * v16--];
          }
          while (v17 > v19);
          if (v17 == v19)
          {
            *(void *)&v7[2 * v18] = 1;
            unsigned int v15 = v16;
          }
          else
          {
            ++v16;
          }
          ++v14;
        }
        while (v14 != v13);
      }
      else
      {
        unsigned int v15 = v11;
      }
      for (unsigned int i = v15 + 1; i <= v11; ++i)
      {
        uint64_t v29 = *(void *)&v7[2 * i];
        if ((v29 & 1) == 0) {
          *(void *)&v7[2 * ++v15] = v29;
        }
      }
      *(void *)unint64_t v7 = v15;
    }
  }
  uint64_t v30 = *(unint64_t **)(a1 + 64);
  if (v30 && *v30)
  {
    unint64_t v31 = 1;
    do
    {
      unint64_t v32 = v30[v31];
      if ((v32 & 1) == 0)
      {
        unint64_t v33 = v32 >> 1;
        unsigned int v34 = mdb_mid2l_search(v9, v32 >> 1);
        if (*(void *)v9 >= (unint64_t)v34)
        {
          unint64_t v35 = v34;
          if (*(void *)&v9[4 * v34] == v33)
          {
            free(*(void **)&v9[4 * v34 + 2]);
            uint64_t v36 = *(void *)v9;
            if (*(void *)v9 > v35)
            {
              unsigned int v37 = v35 + 1;
              do
              {
                *(_OWORD *)&v9[4 * v35] = *(_OWORD *)&v9[4 * v37];
                unint64_t v35 = v37;
                uint64_t v36 = *(void *)v9;
              }
              while (*(void *)v9 > (unint64_t)v37++);
            }
            *(void *)uint64_t v9 = v36 - 1;
          }
        }
      }
      unint64_t v31 = (v31 + 1);
      uint64_t v30 = *(unint64_t **)(a1 + 64);
    }
    while (*v30 >= v31);
  }
  uint64_t v39 = *(void *)v9;
  *(void *)uint64_t v9 = 0;
  if (*(void *)v5)
  {
    unsigned int v40 = *v10 + v39;
    int v41 = mdb_mid2l_search(v10, *(void *)&v9[4 * v39] + 1);
    int v42 = v41 - 1;
    if (v41 != 1 && v39 != 0)
    {
      int v44 = v39;
      do
      {
        unint64_t v45 = *(void *)&v10[4 * v42];
        int v46 = v44 + 1;
        do
          unint64_t v47 = *(void *)&v9[4 * --v46];
        while (v45 < v47);
        int v48 = v45 == v47;
        v40 -= v48;
        if (!--v42) {
          break;
        }
        int v44 = v46 - v48;
      }
      while (v44);
    }
  }
  else
  {
    unsigned int v40 = 0x1FFFF - *(_DWORD *)(a1 + 128);
  }
  uint64_t v49 = *v10;
  if (*v10)
  {
    unsigned int v50 = v40;
    do
    {
      v51 = &v10[4 * v49];
      unint64_t v52 = *(void *)v51;
      v53 = &v9[4 * v39];
      uint64_t v54 = *(void *)v53;
      if (*(void *)v51 >= *(void *)v53)
      {
        uint64_t v55 = v39;
      }
      else
      {
        do
        {
          *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v53;
          uint64_t v39 = (v39 - 1);
          v53 = &v9[4 * v39];
          uint64_t v54 = *(void *)v53;
        }
        while (v52 < *(void *)v53);
        uint64_t v55 = v39;
      }
      if (v52 == v54)
      {
        LODWORD(v39) = v39 - 1;
        free(*(void **)&v9[4 * v55 + 2]);
      }
      *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v51;
      --v49;
    }
    while (v49);
  }
  *(void *)uint64_t v9 = v40;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  v56 = *(uint64_t **)(a1 + 64);
  if (v56)
  {
    if (*v8)
    {
      uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v56);
      if (appended) {
        *(_DWORD *)(v5 + 124) |= 2u;
      }
      mdb_midl_free(*(void *)(a1 + 64));
      mdb_midl_sort(*v8);
    }
    else
    {
      uint64_t appended = 0;
      _DWORD *v8 = (int *)v56;
    }
  }
  else
  {
    uint64_t appended = 0;
  }
  v57 = (void *)(v5 + 48);
  do
  {
    v58 = v57;
    uint64_t v59 = *v57;
    v57 = (void *)(*v57 + 48);
  }
  while (v59);
  void *v58 = *(void *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(void *)(v5 + 8) = 0;
  mdb_midl_free(*(void *)(a1 + 136));
  free((void *)a1);
  return appended;
}

void mdb_cursors_close(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 >= 1)
  {
    uint64_t v4 = *(void *)(a1 + 104);
    do
    {
      uint64_t v5 = *(void **)(v4 + 8 * (v2 - 1));
      while (v5)
      {
        unint64_t v6 = v5;
        uint64_t v5 = (void *)*v5;
        unint64_t v7 = (void *)v6[1];
        if (v7)
        {
          if (a2)
          {
            *(_OWORD *)unint64_t v6 = *(_OWORD *)v7;
            v6[3] = v7[3];
            v6[5] = v7[5];
            v6[7] = v7[7];
            uint64_t v8 = v6[2];
            if (v8) {
              *(void *)(v8 + 24) = v7[3];
            }
          }
          else
          {
            memcpy(v6, (const void *)v6[1], 0x188uLL);
            uint64_t v9 = (void *)v6[2];
            if (v9) {
              memcpy(v9, v7 + 49, 0x1F0uLL);
            }
          }
        }
        else
        {
          unint64_t v7 = v6;
        }
        free(v7);
      }
      *(void *)(v4 + 8 * (v2 - 1)) = 0;
    }
    while (v2-- > 1);
  }
}

uint64_t mdb_cursor_init(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = a3;
  *(void *)(result + 24) = a2;
  uint64_t v4 = *(void *)(a2 + 80) + 48 * a3;
  *(void *)(result + 40) = *(void *)(a2 + 88) + 48 * a3;
  *(void *)(result + 48) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(a2 + 112) + a3);
  *(void *)(result + 56) = v5;
  *(_DWORD *)(result + 64) = 0;
  *(void *)(result + 72) = 0;
  *(_WORD *)(result + 328) = 0;
  int v6 = *(_DWORD *)(a2 + 124) & 0xA0000;
  *(_DWORD *)(result + 68) = v6;
  if ((*(unsigned char *)(*(void *)(a2 + 88) + 48 * a3 + 4) & 4) != 0)
  {
    *(void *)(result + 16) = a4;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = a2;
    *(void *)(a4 + 40) = a4 + 392;
    *(void *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(void *)(a4 + 56) = a4 + 488;
    *(_DWORD *)(a4 + 64) = 0;
    *(_DWORD *)(a4 + 68) = v6 | 4;
    *(void *)(a4 + 440) = 0;
    *(void *)(a4 + 448) = 0;
    uint64_t v7 = *(void *)(result + 48);
    uint64_t v5 = *(unsigned char **)(result + 56);
    uint64_t v9 = *(void *)(v7 + 24);
    uint64_t v8 = *(void *)(v7 + 32);
    *(void *)(a4 + 456) = v9;
    *(void *)(a4 + 464) = 0;
    *(void *)(a4 + 472) = v8;
  }
  else
  {
    *(void *)(result + 16) = 0;
  }
  if ((*v5 & 2) != 0) {
    return mdb_page_search();
  }
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  v126 = 0;
  uint64_t result = 22;
  if (!a1 || !a2) {
    return result;
  }
  uint64_t v124 = 0;
  v125 = 0;
  size_t v122 = 0;
  v123 = 0;
  size_t v120 = 0;
  v121 = 0;
  long long v119 = 0u;
  memset(v118, 0, sizeof(v118));
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v9 + 32);
  if ((a4 & 0x80000) != 0)
  {
    unsigned int v11 = *(_DWORD *)(a3 + 16);
    *(void *)(a3 + 16) = 0;
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
      return 4294936512;
    }
  }
  else
  {
    unsigned int v11 = 0;
  }
  int v12 = *(_DWORD *)(v9 + 124);
  if ((v12 & 0x20013) != 0)
  {
    if ((v12 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if (*a2 - 512 < 0xFFFFFFFFFFFFFE01) {
    return 4294936515;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  unint64_t v14 = 511;
  if ((*(_WORD *)(v13 + 4) & 4) == 0) {
    unint64_t v14 = 0xFFFFFFFFLL;
  }
  if (*(void *)a3 > v14) {
    return 4294936515;
  }
  size_t v122 = 0;
  if ((a4 & 0x40) != 0)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68);
    if ((v17 & 1) == 0) {
      return result;
    }
    LODWORD(v16) = 0;
  }
  else if (*(void *)(v13 + 40) == -1)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v17;
    LODWORD(v16) = -30769;
  }
  else
  {
    int v117 = 0;
    long long v116 = 0uLL;
    if ((a4 & 0x20000) != 0)
    {
      v115[0] = 0;
      v115[1] = 0;
      uint64_t v16 = mdb_cursor_last(a1, v115, &v116);
      if (!v16)
      {
        if ((*(int (**)(size_t *, char **))(*(void *)(a1 + 48) + 16))(a2, v115) < 1)
        {
          uint64_t v16 = 4294936497;
        }
        else
        {
          uint64_t v18 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
          ++*(_WORD *)(v18 + 328);
          uint64_t v16 = 4294936498;
        }
      }
    }
    else
    {
      uint64_t v15 = mdb_cursor_set(a1, a2, &v116, 15, &v117);
      uint64_t v16 = v15;
      if ((a4 & 0x10) != 0 && !v15)
      {
        *(_OWORD *)a3 = v116;
        return 4294936497;
      }
    }
    if (v16 != -30798 && v16) {
      return v16;
    }
    unsigned int v17 = *(_DWORD *)(a1 + 68);
  }
  if ((v17 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v17 ^ 8;
  }
  if ((a4 & 0x8000) == 0)
  {
    unint64_t v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      uint64_t v124 = *(void *)a3 * v11;
      unint64_t v19 = &v124;
    }
    uint64_t result = mdb_page_spill(a1, a2, v19);
    if (result) {
      return result;
    }
  }
  unsigned int v20 = a4 & 0xFFFF7FFF;
  if (v16 == -30769)
  {
    *(void *)&long long v116 = 0;
    uint64_t result = mdb_page_new(a1, 2, 1, (char **)&v116);
    if (result) {
      return result;
    }
    uint64_t v21 = v116;
    uint64_t v22 = *(unsigned __int16 *)(a1 + 64);
    if (v22 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v22 + 1;
      *(_WORD *)(a1 + 66) = v22;
      *(void *)(a1 + 8 * v22 + 72) = v21;
      *(_WORD *)(a1 + 2 * v22 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    }
    uint64_t v24 = *(void *)(a1 + 40);
    *(void *)(v24 + 40) = *(void *)v21;
    ++*(_WORD *)(v24 + 6);
    **(unsigned char **)(a1 + 56) |= 1u;
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4);
    if ((v23 & 0x14) == 0x10) {
      *(_WORD *)(v21 + 10) |= 0x20u;
    }
    *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
    if ((v23 & 4) == 0 || *a2 + *(void *)a3 + 8 <= *(unsigned int *)(v10 + 220))
    {
      v109 = 0;
      int v110 = 0;
      uint64_t v27 = 0;
      long long v28 = (size_t *)a3;
      goto LABEL_128;
    }
    int v112 = v16;
    int v110 = 0;
    uint64_t v25 = *(char **)(v10 + 88);
    *((_WORD *)v25 + 4) = *(void *)a3;
    *((_DWORD *)v25 + 3) = 1048592;
    size_t v120 = 16;
    __int16 v26 = 18;
    goto LABEL_111;
  }
  uint64_t result = mdb_cursor_touch(a1);
  if (result) {
    return result;
  }
  if (v16)
  {
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4);
    goto LABEL_51;
  }
  uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
  unint64_t v31 = *(unsigned int **)(a1 + 40);
  if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
  {
    uint64_t v32 = *v31;
    size_t v33 = *a2;
    if (*a2 == v32)
    {
      unsigned int v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
      unint64_t v35 = (const void *)a2[1];
LABEL_59:
      memcpy(v34, v35, v33);
      uint64_t v36 = *(unsigned __int16 *)(a1 + 66);
      if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
      {
        int v37 = v36 - 1;
        *(_WORD *)(a1 + 66) = v36 - 1;
        if ((_WORD)v36 == 1)
        {
          LOWORD(v37) = 0;
          LOWORD(v36) = 1;
        }
        else
        {
          __int16 v38 = 1;
          while (!*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
          {
            *(_WORD *)(a1 + 66) = --v37;
            ++v38;
            if (!(_WORD)v37)
            {
              LOWORD(v37) = 0;
              goto LABEL_68;
            }
          }
          LOWORD(v36) = v38;
        }
LABEL_68:
        if (*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
        {
          uint64_t result = mdb_update_key(a1, (uint64_t)a2);
          *(_WORD *)(a1 + 66) += v36;
          if (result) {
            return result;
          }
        }
        else
        {
          *(_WORD *)(a1 + 66) = v37 + v36;
        }
      }
      return 0;
    }
    return 4294936515;
  }
  unsigned int v114 = a4 & 0xFFFF7FFF;
  v109 = 0;
  int v110 = 0;
  uint64_t v27 = 0;
  while (1)
  {
    uint64_t v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
    size_t v120 = *v39;
    v121 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
    if ((v31[1] & 4) != 0)
    {
      unsigned int v40 = *(char **)(v10 + 88);
      v125 = v40;
      v126 = v40;
      *(void *)unsigned int v40 = *(void *)v30;
      __int16 v41 = *((_WORD *)v39 + 2);
      if ((v41 & 4) != 0)
      {
        if ((v41 & 2) != 0)
        {
          unsigned int v108 = v27;
          int v113 = 0;
          unsigned int v20 = v114 | 6;
          goto LABEL_161;
        }
        uint64_t v25 = v121;
        if (v114 == 64) {
          goto LABEL_201;
        }
        if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
        {
          unsigned int v62 = *((unsigned __int16 *)v121 + 4);
          if (v62 <= (unsigned __int16)(*((_WORD *)v121 + 7) - *((_WORD *)v121 + 6)))
          {
LABEL_201:
            unsigned int v108 = v27;
            int v113 = 0;
            *((_WORD *)v121 + 5) |= 0x10u;
            *(_WORD *)uint64_t v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(void *)(*(void *)(a1 + 16) + 72) = v25;
            unsigned int v20 = v114 | 4;
            goto LABEL_161;
          }
          unsigned int v48 = 4 * v62;
        }
        else
        {
          unsigned int v48 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
        }
        size_t v60 = v120;
        size_t v61 = v120 + v48;
        uint64_t v124 = v61;
        __int16 v26 = *((_WORD *)v121 + 5);
        goto LABEL_109;
      }
      if (v114 != 64)
      {
        int v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
        if (v120 == 8 && v42 == mdb_cmp_int) {
          int v42 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
        }
        if (v42(a3, (uint64_t)&v120))
        {
          size_t v44 = v120;
          size_t v122 = v120;
          memcpy(v40 + 24, v121, v120);
          v123 = v40 + 24;
          *((_WORD *)v40 + 5) = 82;
          *((_WORD *)v40 + 6) = 16;
          uint64_t v45 = *(void *)a3;
          uint64_t v46 = v44 + *(void *)a3 + 16;
          if ((*(unsigned char *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
          {
            __int16 v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            uint64_t v47 = 2 * v45;
          }
          else
          {
            uint64_t v47 = ((*(void *)a3 & 1) + (v44 & 1)) | 0x14;
            __int16 v26 = 82;
          }
          LOWORD(v48) = 0;
          size_t v60 = v47 + v46;
          uint64_t v124 = v60;
          *((_WORD *)v40 + 7) = v60;
          size_t v120 = v60;
          size_t v61 = v60;
          uint64_t v25 = v40;
LABEL_109:
          int v112 = 0;
          if (*((unsigned __int16 *)v39 + 3) + v61 + 8 <= *(unsigned int *)(v10 + 220))
          {
            int v65 = v114;
          }
          else
          {
            int v112 = 0;
            v26 &= ~0x40u;
            unsigned int v20 = v114;
LABEL_111:
            uint64_t v63 = *(void *)(a1 + 40);
            if ((*(_WORD *)(v63 + 4) & 0x10) != 0)
            {
              v26 |= 0x20u;
              LODWORD(v118[0]) = *((unsigned __int16 *)v25 + 4);
              WORD2(v118[0]) = 16;
              if ((*(_WORD *)(v63 + 4) & 0x20) != 0) {
                __int16 v64 = 24;
              }
              else {
                __int16 v64 = 16;
              }
              WORD2(v118[0]) = v64;
            }
            else
            {
              LODWORD(v118[0]) = 0;
              WORD2(v118[0]) = 0;
            }
            WORD3(v118[0]) = 1;
            *(_OWORD *)((char *)v118 + 8) = xmmword_1828E1E20;
            *((void *)&v118[1] + 1) = 0;
            *(void *)&long long v119 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
            uint64_t v124 = 48;
            v125 = (const char *)v118;
            uint64_t result = mdb_page_alloc(a1, 1, &v126);
            if (result) {
              return result;
            }
            size_t v60 = v120;
            unsigned int v48 = *(_DWORD *)(v10 + 16) - v120;
            int v65 = v20 | 6;
            unsigned int v40 = v126;
            *((void *)&v119 + 1) = *(void *)v126;
            v109 = v126;
          }
          if (v40 != v25)
          {
            *((_WORD *)v40 + 5) = v26 | 0x10;
            *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
            *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
            unsigned __int16 v66 = *((_WORD *)v25 + 7) + v48;
            *((_WORD *)v40 + 7) = v66;
            if ((v26 & 0x20) != 0)
            {
              memcpy(v40 + 16, v25 + 16, ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
            }
            else
            {
              memcpy(&v40[v66], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
              memcpy(v40 + 16, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
              if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
              {
                unint64_t v67 = 0;
                do
                  *(_WORD *)&v40[2 * v67++ + 16] += v48;
                while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
              }
            }
          }
          unsigned int v20 = v65 | 4;
          uint64_t v27 = 1;
          long long v28 = (size_t *)&v124;
          LODWORD(v16) = v112;
          if (!v112)
          {
            mdb_node_del((void *)a1, 0);
            long long v28 = (size_t *)&v124;
          }
          goto LABEL_128;
        }
        if ((v114 & 0x40020) != 0) {
          return 4294936497;
        }
      }
    }
    int v49 = *((unsigned __int16 *)v39 + 2);
    if (((v114 ^ v49) & 2) != 0) {
      return 4294936512;
    }
    if ((v49 & 1) == 0)
    {
      size_t v50 = *(void *)a3;
      if (*(void *)a3 == v120)
      {
        if ((v114 & 0x10000) != 0)
        {
          uint64_t result = 0;
          v105 = v121;
LABEL_216:
          *(void *)(a3 + 8) = v105;
          return result;
        }
        if ((*(unsigned char *)(a1 + 68) & 4) != 0)
        {
          size_t v33 = *a2;
          unint64_t v35 = (const void *)a2[1];
          unsigned int v34 = v39 + 2;
          goto LABEL_59;
        }
        v51 = v121;
        unint64_t v52 = *(const void **)(a3 + 8);
        goto LABEL_219;
      }
      goto LABEL_103;
    }
    uint64_t v53 = v27;
    v115[0] = 0;
    int v117 = 0;
    uint64_t v54 = *(void *)a3;
    unint64_t v55 = *(unsigned int *)(v10 + 16);
    unint64_t v56 = *(void *)v121;
    uint64_t result = mdb_page_get(a1, *(void *)v121, (unint64_t *)v115, &v117);
    if (result) {
      return result;
    }
    int v57 = (v54 + 15) / v55 + 1;
    v58 = v115[0];
    uint64_t v59 = *((int *)v115[0] + 3);
    if ((int)v59 >= v57)
    {
      if ((*((_WORD *)v115[0] + 5) & 0x10) != 0) {
        break;
      }
      if (v117 || (*(unsigned char *)(v10 + 14) & 8) != 0)
      {
        uint64_t result = mdb_page_unspill(*(void *)(a1 + 24), (uint64_t)v115[0], v115);
        if (result) {
          return result;
        }
        int v117 = 0;
        v58 = v115[0];
        if ((*((_WORD *)v115[0] + 5) & 0x10) != 0) {
          break;
        }
      }
    }
    uint64_t result = mdb_ovpage_free(a1, (uint64_t)v58);
    uint64_t v27 = v53;
    if (result) {
      return result;
    }
LABEL_103:
    mdb_node_del((void *)a1, 0);
    LODWORD(v16) = 0;
    long long v28 = (size_t *)a3;
    unsigned int v20 = v114;
LABEL_128:
    uint64_t v68 = *(unsigned __int16 *)(a1 + 66);
    v69 = *(_WORD **)(a1 + 8 * v68 + 72);
    unint64_t v70 = *a2;
    if ((v69[5] & 0x20) == 0)
    {
      unint64_t v71 = v70 + *v28 + 8;
      uint64_t v72 = 8 - *v28;
      if (v71 <= *(unsigned int *)(v10 + 220)) {
        uint64_t v72 = 0;
      }
      unint64_t v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
    {
      uint64_t result = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0, v20 & 0x30006);
      if (result) {
        goto LABEL_206;
      }
      v75 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v75)
      {
        uint64_t v76 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v77 = *(void *)(a1 + 8 * v76 + 72);
        int v78 = *(_DWORD *)(a1 + 68);
        do
        {
          v79 = v75;
          if ((v78 & 4) != 0) {
            v79 = (void *)v75[2];
          }
          if (v79 != (void *)a1
            && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
            && v79[v76 + 9] == v77)
          {
            v80 = (char *)v79 + 2 * v76;
            unsigned int v81 = *((unsigned __int16 *)v80 + 164);
            if (v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
            {
              LOWORD(v81) = v81 + 1;
              *((_WORD *)v80 + 164) = v81;
            }
            uint64_t v82 = v79[2];
            if (v82)
            {
              if ((*(unsigned char *)(v82 + 68) & 1) != 0
                && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
              {
                uint64_t v83 = v77 + *(unsigned __int16 *)(v77 + 2 * (unsigned __int16)v81 + 16);
                if ((*(_WORD *)(v83 + 4) & 6) == 4) {
                  *(void *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
                }
              }
            }
          }
          v75 = (void *)*v75;
        }
        while (v75);
      }
    }
    else
    {
      if ((v20 & 6) == 4) {
        int v73 = v20 & 0x10006;
      }
      else {
        int v73 = v20 & 0x30006;
      }
      if (v16) {
        int v74 = v73;
      }
      else {
        int v74 = v73 | 0x40000;
      }
      uint64_t result = mdb_page_split(a1, (uint64_t)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
      if (result) {
        goto LABEL_206;
      }
    }
    if (!v27)
    {
      uint64_t result = 0;
      int v98 = v16;
      goto LABEL_192;
    }
    int v113 = v16;
    unsigned int v108 = 1;
LABEL_161:
    uint64_t v124 = 0;
    v125 = "";
    uint64_t v111 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
         + *(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
                               + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                               + 16);
    uint64_t v84 = 32832;
    if ((v20 & 0x40040) != 0x40)
    {
      mdb_xcursor_init1(a1, v111);
      if ((v20 & 0x20) != 0) {
        uint64_t v84 = 32784;
      }
      else {
        uint64_t v84 = 0x8000;
      }
    }
    if (v109) {
      *(void *)(*(void *)(a1 + 16) + 72) = v109;
    }
    int v107 = v122;
    if (v122)
    {
      LODWORD(result) = mdb_cursor_put(*(void *)(a1 + 16), &v122, &v124, v84);
      if (result) {
        goto LABEL_203;
      }
      size_t v122 = 0;
    }
    if (v109 || (*(_WORD *)(v111 + 4) & 2) == 0)
    {
      uint64_t v85 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v85)
      {
        uint64_t v86 = *(void *)(a1 + 16);
        uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v88 = *(void *)(a1 + 8 * v87 + 72);
        do
        {
          if (v85 != a1
            && *(unsigned __int16 *)(v85 + 64) >= *(unsigned __int16 *)(a1 + 64)
            && (*(unsigned char *)(v85 + 68) & 1) != 0
            && *(void *)(v85 + 8 * v87 + 72) == v88)
          {
            unsigned int v89 = *(unsigned __int16 *)(v85 + 2 * v87 + 328);
            if (v89 == *(unsigned __int16 *)(a1 + 2 * v87 + 328))
            {
              unsigned int v106 = v11;
              uint64_t v90 = v84;
              uint64_t v91 = v88;
              mdb_xcursor_init2(v85, v86, v107);
              uint64_t v88 = v91;
              uint64_t v84 = v90;
              unsigned int v11 = v106;
            }
            else if (!v113)
            {
              uint64_t v92 = *(void *)(v85 + 16);
              if (v92)
              {
                if ((*(unsigned char *)(v92 + 68) & 1) != 0 && v89 < (*(unsigned __int16 *)(v88 + 12) - 16) >> 1)
                {
                  uint64_t v93 = v88 + *(unsigned __int16 *)(v88 + 2 * *(unsigned __int16 *)(v85 + 2 * v87 + 328) + 16);
                  if ((*(_WORD *)(v93 + 4) & 6) == 4) {
                    *(void *)(v92 + 72) = v93 + *(unsigned __int16 *)(v93 + 6) + 8;
                  }
                }
              }
            }
          }
          uint64_t v85 = *(void *)v85;
        }
        while (v85);
      }
    }
    uint64_t v94 = *(void *)(a1 + 16);
    uint64_t v16 = *(void *)(v94 + 424);
    uint64_t result = mdb_cursor_put(v94, a3, &v124, v84 | (v20 >> 1) & 0x20000);
    if ((v20 & 2) != 0)
    {
      uint64_t v95 = v111 + *(unsigned __int16 *)(v111 + 6);
      long long v97 = *(_OWORD *)(*(void *)(a1 + 16) + 408);
      long long v96 = *(_OWORD *)(*(void *)(a1 + 16) + 424);
      *(_OWORD *)(v95 + 8) = *(_OWORD *)(*(void *)(a1 + 16) + 392);
      *(_OWORD *)(v95 + 24) = v97;
      *(_OWORD *)(v95 + 40) = v96;
    }
    int v98 = *(_DWORD *)(*(void *)(a1 + 16) + 424) - v16;
    LODWORD(v16) = v113;
    uint64_t v27 = v108;
LABEL_192:
    if (v98) {
      ++*(void *)(*(void *)(a1 + 40) + 32);
    }
    if (v16)
    {
      if (result)
      {
LABEL_203:
        if (result == -30799) {
          uint64_t result = 4294936517;
        }
        else {
          uint64_t result = result;
        }
LABEL_206:
        *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
        return result;
      }
      *(_DWORD *)(a1 + 68) |= 1u;
    }
    if ((v20 & 0x80000) == 0 || result) {
      return result;
    }
    uint64_t v99 = (v110 + 1);
    *(void *)(a3 + 16) = v99;
    if (v99 >= v11) {
      return 0;
    }
    ++v110;
    unsigned int v114 = v20;
    *(void *)(a3 + 8) += *(void *)a3;
    uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
    unint64_t v31 = *(unsigned int **)(a1 + 40);
  }
  if (v117 <= 1)
  {
    int v104 = v114 & 0x10000;
    v102 = v58;
    goto LABEL_214;
  }
  uint64_t v100 = *(unsigned int *)(v10 + 16);
  v101 = mdb_page_malloc(*(void *)(a1 + 24), v59);
  if (v101)
  {
    v102 = v101;
    size_t v103 = v100 * v59;
    *(void *)&long long v116 = v56;
    *((void *)&v116 + 1) = v101;
    mdb_mid2l_insert(*(unsigned int **)(*(void *)(a1 + 24) + 72), (unint64_t *)&v116);
    int v104 = v114 & 0x10000;
    if ((v114 & 0x10000) == 0)
    {
      memcpy(&v102[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], &v58[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], v103 - ((*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16));
      size_t v103 = 16;
    }
    memcpy(v102, v58, v103);
LABEL_214:
    size_t v50 = *(void *)a3;
    unsigned int *v39 = *(void *)a3;
    v105 = v102 + 16;
    if (v104)
    {
      uint64_t result = 0;
      goto LABEL_216;
    }
    unint64_t v52 = *(const void **)(a3 + 8);
    v51 = v102 + 16;
LABEL_219:
    memcpy(v51, v52, v50);
    return 0;
  }
  return 12;
}

uint64_t mdb_freelist_save(uint64_t a1)
{
  uint64_t v53 = 0;
  memset(v52, 0, sizeof(v52));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(int *)(v2 + 216);
  unint64_t v51 = 0;
  mdb_cursor_init((uint64_t)v52, a1, 0, 0);
  uint64_t v4 = (uint64_t **)(v2 + 176);
  if (!*(void *)(v2 + 176)) {
    goto LABEL_95;
  }
  uint64_t result = mdb_page_search((uint64_t)v52, 0, 5);
  if (result && result != -30798) {
    return result;
  }
  if (!*v4)
  {
LABEL_95:
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t result = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
      if (result) {
        return result;
      }
      do
      {
        uint64_t v8 = *(uint64_t **)(a1 + 40);
        uint64_t v9 = *v8 + 1;
        uint64_t *v8 = v9;
        v8[v9] = *(void *)v6;
        if ((*(unsigned char *)(a1 + 126) & 8) != 0)
        {
          if (*(void *)v7)
          {
            unint64_t v10 = 1;
            do
            {
              if (*(void *)(v7 + 16 * v10) == *(void *)v6) {
                break;
              }
              unint64_t v10 = (v10 + 1);
            }
            while (*(void *)v7 >= v10);
          }
          else
          {
            LODWORD(v10) = 1;
          }
        }
        else
        {
          LODWORD(v10) = mdb_mid2l_search((unsigned int *)v7, *(void *)v6);
          if ((*(_WORD *)(v6 + 10) & 4) != 0 && *(_DWORD *)(v6 + 12) != 1)
          {
            free((void *)v6);
          }
          else
          {
            *(void *)uint64_t v6 = *(void *)(v2 + 192);
            *(void *)(v2 + 192) = v6;
          }
        }
        *(void *)(v7 + 16 * v10 + 8) = 0;
        uint64_t v6 = *(void *)(v6 + 48);
      }
      while (v6);
      unint64_t v11 = *(void *)v7;
      if (*(void *)(v7 + 24))
      {
        unint64_t v12 = 1;
        while (v11 >= v12)
        {
          unint64_t v12 = (v12 + 1);
          unsigned int v13 = v12;
          if (!*(void *)(v7 + 16 * v12 + 8)) {
            goto LABEL_27;
          }
        }
        unsigned int v13 = v12;
      }
      else
      {
        unsigned int v13 = 1;
        unint64_t v12 = 1;
      }
LABEL_27:
      if (v11 >= v12)
      {
        LODWORD(v15) = v13;
        while (1)
        {
          do
          {
            unint64_t v15 = (v15 + 1);
            if (*(void *)(v7 + 16 * v15 + 8)) {
              BOOL v16 = 0;
            }
            else {
              BOOL v16 = v11 >= v15;
            }
          }
          while (v16);
          if (v11 < v15) {
            break;
          }
          *(_OWORD *)(v7 + 16 * v13++) = *(_OWORD *)(v7 + 16 * v15);
          unint64_t v11 = *(void *)v7;
        }
        uint64_t v14 = v13 - 1;
      }
      else
      {
        uint64_t v14 = 0;
      }
      *(void *)uint64_t v7 = v14;
      *(void *)(a1 + 48) = 0;
      *(_DWORD *)(a1 + 56) = 0;
    }
  }
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = *(_DWORD *)(v2 + 12) & 0x1080000;
  int v45 = 1;
  while (1)
  {
LABEL_39:
    size_t v49 = 0;
    size_t v50 = 0;
    size_t v47 = 0;
    unsigned int v48 = 0;
    if (v17 < *(void *)(v2 + 184))
    {
      while (1)
      {
        uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, 0);
        if (result) {
          return result;
        }
        unint64_t v17 = *v50;
        unint64_t v51 = *v50;
        uint64_t result = mdb_cursor_del((uint64_t)v52, 0);
        if (result) {
          return result;
        }
        if (v17 >= *(void *)(v2 + 184))
        {
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          break;
        }
      }
    }
    if (v18 < **(void **)(a1 + 40))
    {
      if (v18 || (uint64_t result = mdb_page_search((uint64_t)v52, 0, 9), !result) || result == -30798)
      {
        uint64_t v22 = *(unint64_t **)(a1 + 40);
        size_t v49 = 8;
        size_t v50 = (unint64_t *)(a1 + 24);
        unint64_t v23 = *v22;
        while (1)
        {
          unint64_t v18 = v23;
          size_t v47 = 8 * v23 + 8;
          uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
          if (result) {
            break;
          }
          uint64_t v24 = *(unint64_t **)(a1 + 40);
          unint64_t v23 = *v24;
          if (v18 >= *v24)
          {
            mdb_midl_sort(*(int **)(a1 + 40));
            memcpy(v48, v24, v47);
            goto LABEL_39;
          }
        }
      }
      return result;
    }
    uint64_t v25 = *v4;
    uint64_t v26 = v21;
    uint64_t v27 = *v4 ? *v25 : 0;
    uint64_t v28 = *(int *)(a1 + 56);
    uint64_t v29 = v27 + v28;
    if (v20 >= v27 + v28) {
      break;
    }
    unint64_t v30 = v51;
    if (v19 >= v3 && v51 >= 2)
    {
      uint64_t v19 = 0;
      unint64_t v30 = --v51;
    }
LABEL_64:
    uint64_t v32 = v20 - v19;
    uint64_t v33 = v29 - (v20 - v19);
    if (v33 > v3 && v30 >= 2) {
      uint64_t v19 = v3 + (uint64_t)(v33 / v30) / ((int)v3 + 1) * ((int)v3 + 1);
    }
    else {
      uint64_t v19 = v33 & ~(v33 >> 63);
    }
    uint64_t v21 = v26;
    size_t v49 = 8;
    size_t v50 = &v51;
    size_t v47 = 8 * v19 + 8;
    uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
    if (result) {
      return result;
    }
    if (v19 > v3 && v21 == 0) {
      uint64_t v36 = v19;
    }
    else {
      uint64_t v36 = 0;
    }
    bzero(&v48[v36 & (v36 >> 63)], 8 * (v36 - (v36 & (v36 >> 63))) + 8);
    uint64_t v20 = v19 + v32;
  }
  if (v20 != v27 + v28 && v45 >= 1)
  {
    --v45;
    unint64_t v30 = v51;
    goto LABEL_64;
  }
  int v37 = *(void **)(a1 + 48);
  if (v37)
  {
    uint64_t v38 = *(unsigned int *)(a1 + 56);
    uint64_t result = mdb_midl_need((_DWORD **)(v2 + 176), (2 * v28) | 1);
    if (result) {
      return result;
    }
    uint64_t v25 = *v4;
    uint64_t v39 = (int *)&(*v4)[*(*v4 - 1) - v38];
    unsigned int v40 = 1;
    do
    {
      unsigned int v41 = v40;
      *(void *)&v39[2 * v40] = *v37;
      int v37 = (void *)v37[6];
      ++v40;
    }
    while (v37);
    *(void *)uint64_t v39 = v41;
    mdb_midl_sort(v39);
    mdb_midl_xmerge(v25, (uint64_t *)v39);
    *(void *)(a1 + 48) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    uint64_t v29 = *v25;
  }
  if (!v29) {
    return 0;
  }
  size_t v49 = 0;
  size_t v50 = 0;
  size_t v47 = 0;
  unsigned int v48 = 0;
  uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, &v47);
  if (!result)
  {
    int v42 = &v25[v29];
    do
    {
      unint64_t v46 = 0;
      unint64_t v46 = *v50;
      int64_t v43 = (v47 >> 3) - 1;
      size_t v50 = &v46;
      if (v43 > v29)
      {
        size_t v47 = 8 * v29 + 8;
        int64_t v43 = v29;
      }
      v42 -= v43;
      unsigned int v48 = v42;
      int64_t v44 = *v42;
      *int v42 = v43;
      uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 64);
      *int v42 = v44;
      if (result) {
        break;
      }
      v29 -= v43;
      if (!v29) {
        break;
      }
      uint64_t result = mdb_cursor_next((uint64_t)v52, &v49, &v47, 8);
    }
    while (!result);
  }
  return result;
}

uint64_t mdb_page_flush(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(uint64_t **)(a1 + 72);
  uint64_t v5 = *v4;
  if ((*(unsigned char *)(v3 + 14) & 8) == 0)
  {
    uint64_t v39 = *(void *)(a1 + 32);
    unint64_t v6 = 0;
    off_t v7 = 0;
    uint64_t v8 = 0;
    size_t v9 = 0;
    off_t v10 = 0;
    int v11 = 0;
    unint64_t v12 = *(unsigned int *)(v3 + 16);
    int v13 = *(_DWORD *)v3;
    uint64_t v45 = (int)v5;
    int v40 = v5 + 1;
    uint64_t v14 = 1;
    int v41 = 1 - v5;
    uint64_t v42 = *v4;
    int v37 = a2;
    int v15 = a2;
    int64_t v43 = *(uint64_t **)(a1 + 72);
    while (1)
    {
      if (v15 >= (int)v5)
      {
        BOOL v19 = 0;
        int v20 = v15++;
      }
      else
      {
        uint64_t v16 = v15 + 1;
        unint64_t v17 = &v4[2 * v16];
        uint64_t v8 = v17[1];
        unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          uint64_t v16 = 0;
          while (1)
          {
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *unint64_t v17 = 0;
            if (!(v41 + v15 + v16)) {
              break;
            }
            uint64_t v8 = v17[3];
            unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
            v17 += 2;
            ++v16;
            if (v18 < 0x4000)
            {
              uint64_t v21 = v15 + v16;
              BOOL v19 = v21 < v45;
              int v20 = v15 + v16;
              LODWORD(v16) = v21 + 1;
              goto LABEL_11;
            }
          }
          BOOL v19 = v15 + v16 + 1 < v45;
          int v20 = v15 + v16 + 1;
          int v15 = v40;
        }
        else
        {
          BOOL v19 = 1;
          int v20 = v15;
LABEL_11:
          int v15 = v16;
          uint64_t v22 = *v17;
          *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
          off_t v7 = v22 * v12;
          if ((v18 & 4) != 0) {
            unint64_t v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
          }
          else {
            unint64_t v6 = v12;
          }
        }
      }
      if (v7 != v14 || v11 == 64 || v6 + v9 >= 0x40000001)
      {
        int v44 = v20;
        if (v11)
        {
          unint64_t v23 = v12;
          while (1)
          {
            if (v11 == 1)
            {
              ssize_t v24 = pwrite(v13, __buf[0].iov_base, v9, v10);
            }
            else
            {
              while (lseek(v13, v10, 0) == -1)
              {
                uint64_t result = *__error();
                if (result != 4) {
                  return result;
                }
              }
              ssize_t v24 = writev(v13, __buf, v11);
            }
            LODWORD(v5) = v42;
            uint64_t v4 = v43;
            unint64_t v12 = v23;
            if (v24 == v9) {
              break;
            }
            if ((v24 & 0x8000000000000000) == 0) {
              return 5;
            }
            uint64_t result = *__error();
            if (result != 4) {
              return result;
            }
          }
        }
        if (!v19)
        {
          if ((*(unsigned char *)(v39 + 14) & 8) != 0)
          {
            unsigned int v27 = v37;
            a2 = v44;
          }
          else
          {
            a2 = v37;
            if ((int)v5 <= v37)
            {
              unsigned int v27 = v37;
            }
            else
            {
              unsigned int v27 = v37;
              uint64_t v32 = v4 + 2;
              int v33 = v37;
              do
              {
                uint64_t v34 = v33;
                unint64_t v35 = &v32[2 * v33];
                while (1)
                {
                  uint64_t v36 = (uint64_t *)v35[1];
                  if (!*v35) {
                    break;
                  }
                  if ((*((_WORD *)v36 + 5) & 4) != 0 && *((_DWORD *)v36 + 3) != 1)
                  {
                    free(v36);
                    LODWORD(v5) = v42;
                    uint64_t v4 = v43;
                  }
                  else
                  {
                    uint64_t *v36 = *(void *)(v39 + 192);
                    *(void *)(v39 + 192) = v36;
                  }
                  ++v34;
                  v35 += 2;
                  if (v34 >= v45)
                  {
                    a2 = v34;
                    goto LABEL_59;
                  }
                }
                int v33 = v34 + 1;
                *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)v35;
                v4[2 * v27] = *v36;
              }
              while ((int)v34 + 1 < (int)v5);
              a2 = v34 + 1;
            }
          }
LABEL_59:
          uint64_t v2 = a1;
          goto LABEL_41;
        }
        size_t v9 = 0;
        int v11 = 0;
        off_t v10 = v7;
      }
      uint64_t v26 = &__buf[v11];
      v26->iov_base = (void *)v8;
      v26->iov_len = v6;
      uint64_t v14 = v7 + v6;
      v9 += v6;
      ++v11;
    }
  }
  if ((int)v5 <= a2)
  {
    unsigned int v27 = a2;
  }
  else
  {
    unsigned int v27 = a2;
    do
    {
      uint64_t v28 = a2;
      uint64_t v29 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        uint64_t v30 = *(void *)v29;
        unsigned int v31 = *(unsigned __int16 *)(*(void *)v29 + 10);
        if (v31 >= 0x4000) {
          break;
        }
        ++v28;
        *(_WORD *)(v30 + 10) = v31 & 0xFFEF;
        v29 += 16;
        if (v28 >= (int)v5)
        {
          a2 = v28;
          goto LABEL_41;
        }
      }
      a2 = v28 + 1;
      *(_WORD *)(v30 + 10) = v31 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)(v29 - 8);
    }
    while ((int)v28 + 1 < (int)v5);
  }
LABEL_41:
  uint64_t result = 0;
  *(_DWORD *)(v2 + 128) += a2 - v27;
  *uint64_t v4 = v27;
  return result;
}

uint64_t mdb_env_write_meta(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 12) | *(_DWORD *)(a1 + 124);
  uint64_t v5 = *(void *)(v3 + 72 + 8 * (v2 & 1));
  unint64_t v6 = *(void *)(*(void *)(v3 + 72 + 8 * !(v2 & 1)) + 16);
  if (v6 <= *(void *)(v3 + 112)) {
    unint64_t v6 = *(void *)(v3 + 112);
  }
  if ((v4 & 0x80000) == 0)
  {
    uint64_t v28 = *(void *)(v5 + 128);
    uint64_t v7 = *(void *)(v5 + 120);
    unint64_t v29 = v6;
    uint64_t v8 = *(long long **)(a1 + 88);
    long long v9 = *v8;
    long long v10 = v8[2];
    long long v31 = v8[1];
    long long v32 = v10;
    long long v30 = v9;
    long long v12 = v8[4];
    long long v11 = v8[5];
    long long v33 = v8[3];
    long long v34 = v12;
    long long v35 = v11;
    uint64_t v36 = *(void *)(a1 + 16) - 1;
    uint64_t v37 = v2;
    off_t v13 = v5 - *(void *)(v3 + 56) + 16;
    int v14 = *(_DWORD *)(v3 + 8 * ((v4 & 0x50000) == 0));
    while (1)
    {
      int v15 = pwrite(v14, &v29, 0x78uLL, v13);
      if (v15 == 120) {
        goto LABEL_10;
      }
      if ((v15 & 0x80000000) == 0)
      {
        uint64_t v16 = 5;
LABEL_19:
        uint64_t v36 = v7;
        uint64_t v37 = v28;
        pwrite(*(_DWORD *)v3, &v29, 0x78uLL, v13);
        goto LABEL_20;
      }
      uint64_t v16 = *__error();
      if (v16 != 4) {
        goto LABEL_19;
      }
    }
  }
  *(void *)(v5 + 16) = v6;
  unint64_t v17 = *(long long **)(a1 + 88);
  long long v18 = *v17;
  long long v19 = v17[1];
  *(_OWORD *)(v5 + 56) = v17[2];
  *(_OWORD *)(v5 + 40) = v19;
  *(_OWORD *)(v5 + 24) = v18;
  int v20 = *(_OWORD **)(a1 + 88);
  long long v21 = v20[3];
  long long v22 = v20[4];
  *(_OWORD *)(v5 + 104) = v20[5];
  *(_OWORD *)(v5 + 88) = v22;
  *(_OWORD *)(v5 + 72) = v21;
  *(void *)(v5 + 120) = *(void *)(a1 + 16) - 1;
  *(void *)(v5 + 128) = *(void *)(a1 + 24);
  if ((v4 & 0x50000) != 0
    || ((*(_DWORD *)(v3 + 12) & 0x100000) != 0 ? (int v24 = 1) : (int v24 = 16),
        uint64_t v25 = v5 - 16,
        int v26 = (*(_DWORD *)(v3 + 20) - 1) & (v25 - *(_DWORD *)(v3 + 56)),
        !msync((void *)(v25 - v26), (v26 + *(_DWORD *)(v3 + 16)), v24)))
  {
LABEL_10:
    uint64_t v23 = *(void *)(v3 + 64);
    uint64_t v16 = 0;
    if (v23) {
      *(void *)(v23 + 8) = *(void *)(a1 + 24);
    }
    return v16;
  }
  uint64_t v16 = *__error();
LABEL_20:
  *(_DWORD *)(v3 + 12) |= 0x80000000;
  return v16;
}

uint64_t mdb_cmp_long(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = **(void **)(a1 + 8);
  unint64_t v3 = **(void **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  int v9 = 0;
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v12 = 0;
          memset(v11, 0, sizeof(v11));
          memset(v10, 0, sizeof(v10));
          if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
            {
              return 4294936514;
            }
            else
            {
              mdb_cursor_init((uint64_t)v11, a1, a2, (uint64_t)v10);
              return mdb_cursor_set((uint64_t)v11, a3, a4, 15, &v9);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_set(uint64_t a1, void *a2, void *a3, int a4, int *a5)
{
  if (!*a2) {
    return 4294936515;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10) {
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  }
  if ((*(unsigned char *)(a1 + 68) & 1) == 0)
  {
    *(void *)(a1 + 72) = 0;
LABEL_6:
    uint64_t result = mdb_page_search(a1, a2, 0);
    if (result) {
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }
  long long v35 = 0uLL;
  uint64_t v15 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v14 = 0;
    uint64_t v16 = **(unsigned int **)(a1 + 40);
    unint64_t v17 = v12 + 8;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    uint64_t v16 = *(unsigned __int16 *)(v14 + 6);
    unint64_t v17 = (_WORD *)(v14 + 8);
  }
  *(void *)&long long v35 = v16;
  *((void *)&v35 + 1) = v17;
  int v18 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }
  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }
  unsigned int v19 = (unsigned __int16)v12[6] - 16;
  unsigned int v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    uint64_t v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      uint64_t v24 = 0;
      while (((*(unsigned __int16 *)(*(void *)(a1 + 328 + 8 * v24 - 256) + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if (v24 == v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498;
    }
LABEL_41:
    if (!v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5) {
        return 4294936498;
      }
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
    uint64_t v21 = v14 + 8;
  }
  *((void *)&v35 + 1) = v21;
  int v23 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }
  if ((v23 & 0x80000000) == 0) {
    goto LABEL_33;
  }
  uint64_t v33 = *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      uint64_t v34 = (uint64_t)v12 + v35 * v33 + 16;
    }
    else
    {
      uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
      uint64_t v34 = v14 + 8;
    }
    *((void *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35))
    {
LABEL_27:
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_46;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  off_t v13 = mdb_node_search(a1, a2, a5);
  uint64_t v14 = (uint64_t)v13;
  if (a5 && !*a5) {
    return 4294936498;
  }
  if (!v13)
  {
    uint64_t result = mdb_cursor_sibling(a1, 1);
    if (result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }
LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t result = 0;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      uint64_t v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }
    return result;
  }
  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v14);
    if ((a4 - 15) > 2)
    {
      LODWORD(v35) = 0;
      if (a4 == 2) {
        long long v31 = &v35;
      }
      else {
        long long v31 = 0;
      }
      uint64_t result = mdb_cursor_set(*(void *)(a1 + 16), a3, 0, 17, v31);
      if (!result) {
        goto LABEL_79;
      }
      return result;
    }
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
LABEL_79:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }
    return result;
  }
  if (!a3)
  {
    uint64_t result = 0;
    goto LABEL_79;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    long long v35 = 0uLL;
    uint64_t result = mdb_node_read(a1, (unsigned int *)v14, &v35);
    if (result) {
      return result;
    }
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
    if ((void)v35 == 8 && v25 == mdb_cmp_int) {
      uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
    }
    int v27 = v25((uint64_t)a3, (uint64_t)&v35);
    BOOL v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      uint64_t result = 0;
      *(_OWORD *)a3 = v35;
      goto LABEL_79;
    }
    return 4294936498;
  }
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32) {
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
  if (!result) {
    goto LABEL_79;
  }
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, void *a2, void *a3, int a4)
{
  int v29 = 0;
  if (!a1) {
    return 22;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
    return 4294936514;
  }
  uint64_t v7 = (uint64_t (*)(void))mdb_cursor_first;
  switch(a4)
  {
    case 0:
      uint64_t result = mdb_cursor_first(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3) {
        goto LABEL_58;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_47;
      }
LABEL_10:
      if (!a2) {
        goto LABEL_58;
      }
      if (a4 == 17) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = &v29;
      }
      uint64_t result = mdb_cursor_set(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
      unsigned int v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      unsigned int v12 = v11 >> 1;
      if (v11 < 2 || (uint64_t v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }
      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }
      else
      {
        uint64_t v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0) {
            goto LABEL_39;
          }
          uint64_t result = mdb_cursor_get(*(void *)(a1 + 16), a3, 0, 4);
        }
        else
        {
LABEL_29:
          uint64_t result = 0;
        }
      }
      break;
    case 5:
      if (!a3 || (*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1) {
        goto LABEL_29;
      }
      goto LABEL_54;
    case 6:
      uint64_t result = mdb_cursor_last(a1, a2, a3);
      break;
    case 7:
      uint64_t v7 = (uint64_t (*)(void))mdb_cursor_last;
LABEL_32:
      if (!a3) {
        goto LABEL_58;
      }
      int v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v17 = *(void *)(a1 + 16);
      if (!v17) {
        goto LABEL_47;
      }
      uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v19 = a1 + 2 * v18;
      uint64_t v20 = *(unsigned __int16 *)(v19 + 328);
      uint64_t v21 = *(void *)(a1 + 8 * v18 + 72);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }
      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      uint64_t v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if (*(unsigned char *)(v17 + 68)) {
          uint64_t result = v7();
        }
        else {
LABEL_58:
        }
          uint64_t result = 22;
      }
      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
LABEL_39:
        uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
      }
      break;
    case 8:
    case 9:
    case 11:
      uint64_t result = mdb_cursor_next(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t result = mdb_cursor_next(a1, a2, a3, 9);
      if (result) {
        break;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(unsigned char *)(v15 + 68) & 1) == 0) {
        goto LABEL_56;
      }
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      uint64_t result = mdb_cursor_prev(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 68) & 1) != 0 || (uint64_t result = mdb_cursor_last(a1, a2, a3), !result))
        {
          uint64_t v23 = *(void *)(a1 + 16);
          if (*(unsigned char *)(v23 + 68))
          {
            uint64_t result = mdb_cursor_sibling(v23, 0);
            if (!result)
            {
              uint64_t v15 = *(void *)(a1 + 16);
LABEL_54:
              uint64_t result = 0;
              uint64_t v24 = *(unsigned __int16 *)(v15 + 66);
              uint64_t v25 = v15 + 8 * v24;
              uint64_t v26 = *(void *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(void *)(v25 + 72) + 12)
                                                + 131056) >> 1)
                                              - 1;
            }
          }
          else
          {
LABEL_56:
            uint64_t result = 4294936498;
          }
        }
      }
      else
      {
LABEL_47:
        uint64_t result = 4294936512;
      }
      break;
    default:
      goto LABEL_58;
  }
  int v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  }
  return result;
}

uint64_t mdb_node_read(uint64_t a1, unsigned int *a2, void *a3)
{
  if (a2[1])
  {
    unint64_t v6 = 0;
    *a3 = *a2;
    uint64_t result = mdb_page_get(a1, *(void *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8), &v6, 0);
    if (result) {
      return result;
    }
    uint64_t v4 = v6 + 16;
  }
  else
  {
    *a3 = *a2;
    uint64_t v4 = (uint64_t)a2 + *((unsigned __int16 *)a2 + 3) + 8;
  }
  uint64_t result = 0;
  a3[1] = v4;
  return result;
}

uint64_t mdb_cursor_next(uint64_t a1, void *a2, void *a3, int a4)
{
  int v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0) {
    return 4294936498;
  }
  if (v8)
  {
    uint64_t v10 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v11 = *(void *)(a1 + 8 * v10 + 72);
    if ((v8 & 2) != 0)
    {
      if (((*(unsigned __int16 *)(v11 + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 2 * v10 + 328)) {
        return 4294936498;
      }
      *(_DWORD *)(a1 + 68) = v8 ^ 2;
    }
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) == 0) {
      goto LABEL_19;
    }
    uint64_t v12 = v11 + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) != 0)
    {
      if ((a4 & 0xFFFFFFFE) == 8)
      {
        uint64_t result = mdb_cursor_next(*(void *)(a1 + 16), a3, 0, 8);
        if (a4 != 8 || result != -30798)
        {
          if (!a2 || result) {
            return result;
          }
          uint64_t v17 = *(unsigned __int16 *)(v12 + 6);
          unint64_t v18 = v12 + 8;
LABEL_38:
          *a2 = v17;
          a2[1] = v18;
          return result;
        }
      }
LABEL_19:
      int v13 = *(_DWORD *)(a1 + 68);
      if ((v13 & 8) != 0)
      {
        *(_DWORD *)(a1 + 68) = v13 ^ 8;
      }
      else
      {
        uint64_t v14 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
        unsigned int v15 = *(unsigned __int16 *)(v14 + 328) + 1;
        if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
        {
          uint64_t result = mdb_cursor_sibling(a1, 1);
          if (result)
          {
            *(_DWORD *)(a1 + 68) |= 2u;
            return result;
          }
          uint64_t v11 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
        }
        else
        {
          *(_WORD *)(v14 + 328) = v15;
        }
      }
      if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v17 = **(unsigned int **)(a1 + 40);
        unint64_t v18 = v11
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v17
            + 16;
      }
      else
      {
        uint64_t v16 = v11
            + *(unsigned __int16 *)(v11
                                  + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                                  + 16);
        if ((*(_WORD *)(v16 + 4) & 4) != 0)
        {
          mdb_xcursor_init1(a1, v11+ *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
          uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
          if (result) {
            return result;
          }
        }
        else if (a3)
        {
          uint64_t result = mdb_node_read(a1, (unsigned int *)(v11+ *(unsigned __int16 *)(v11+ 2* *(unsigned __int16 *)(a1+ 2 * *(unsigned __int16 *)(a1 + 66)+ 328)+ 16)), a3);
          if (result) {
            return result;
          }
        }
        uint64_t result = 0;
        if (!a2) {
          return result;
        }
        uint64_t v17 = *(unsigned __int16 *)(v16 + 6);
        unint64_t v18 = v16 + 8;
      }
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
    if (a4 != 9) {
      goto LABEL_19;
    }
    return 4294936498;
  }

  return mdb_cursor_first(a1, a2, a3);
}

uint64_t mdb_cursor_last(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = mdb_page_search(a1, 0, 8);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  unsigned int v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      uint64_t v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      unint64_t v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      uint64_t result = 0;
      a2[1] = v14;
      return result;
    }
    return 0;
  }
  uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v12);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      unint64_t v14 = v12 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v12, a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_cursor_sibling(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2) {
    return 4294936498;
  }
  int v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  unsigned __int16 v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  uint64_t v7 = v6;
  int v8 = (_WORD *)(a1 + 2 * v6 + 328);
  int v9 = (unsigned __int16)*v8;
  if (a2)
  {
    if (++v9 >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 12) - 16) >> 1) {
      goto LABEL_9;
    }
LABEL_8:
    _WORD *v8 = v9;
    goto LABEL_12;
  }
  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }
LABEL_9:
  uint64_t result = mdb_cursor_sibling(a1, a2);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 66);
  if (result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  unint64_t v13 = 0;
  uint64_t v10 = (unsigned int *)(*(void *)(a1 + 8 * v7 + 72)
                       + *(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 2 * (unsigned __int16)v9 + 16));
  uint64_t result = mdb_page_get(a1, *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0);
  if (result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }
  else
  {
    unint64_t v11 = v13;
    uint64_t v12 = *(unsigned __int16 *)(a1 + 64);
    if (v12 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v12 + 1;
      *(_WORD *)(a1 + 66) = v12;
      *(void *)(a1 + 8 * v12 + 72) = v11;
      *(_WORD *)(a1 + 2 * v12 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    }
    uint64_t result = 0;
    if (!v4) {
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v11 + 12)
    }
                                                                    + 131056) >> 1)
                                                                  - 1;
  }
  return result;
}

uint64_t mdb_cursor_prev(uint64_t a1, void *a2, void *a3, int a4)
{
  if (*(unsigned char *)(a1 + 68))
  {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
  }
  else
  {
    uint64_t result = mdb_cursor_last(a1, a2, a3);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0)
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          uint64_t result = mdb_cursor_prev(*(void *)(a1 + 16), a3, 0, 12);
          if (a4 != 12 || result != -30798)
          {
            if (!result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }
              uint64_t result = 0;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }
            return result;
          }
          uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
        if (a4 == 13) {
          return 4294936498;
        }
      }
    }
  }
  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  uint64_t v13 = a1 + 2 * v9;
  __int16 v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    unsigned int v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    *unsigned int v15 = v14 - 1;
  }
  else
  {
    uint64_t result = mdb_cursor_sibling(a1, 0);
    if (result) {
      return result;
    }
    uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v10 = *(void *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }
  __int16 v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0) {
    return 4294936500;
  }
  if ((v16 & 0x20) != 0)
  {
    uint64_t result = 0;
    uint64_t v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + (unsigned __int16)v13 * (unint64_t)v19 + 16;
    return result;
  }
  uint64_t v17 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v17);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
    goto LABEL_27;
  }
  if (!a3 || (uint64_t result = mdb_node_read(a1, (unsigned int *)v17, a3), !result))
  {
LABEL_27:
    uint64_t result = 0;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }
  return result;
}

uint64_t mdb_cursor_first(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = mdb_page_search(a1, 0, 4);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  uint64_t v11 = v10 + 16;
  uint64_t v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      uint64_t result = 0;
      a2[1] = v11;
      return result;
    }
    return 0;
  }
  uint64_t v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v10 + v12);
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      uint64_t v11 = v13 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)(v10 + v12), a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_page_spill(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(*(void *)(a1 + 40) + 6);
  if (*(_DWORD *)(a1 + 32) >= 2u) {
    v5 += *(unsigned __int16 *)(*(void *)(v4 + 88) + 54);
  }
  if (a2)
  {
    unint64_t v6 = *(unsigned int *)(*(void *)(v4 + 32) + 16);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }
  if (*(_DWORD *)(v4 + 128) > (2 * v5)) {
    return 0;
  }
  int v8 = *(_DWORD **)(v4 + 72);
  uint64_t v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    int v10 = *v9;
    if (*v9)
    {
      unsigned int v11 = 0;
      if ((v10 + 1) > 2) {
        uint64_t v12 = (v10 + 1);
      }
      else {
        uint64_t v12 = 2;
      }
      uint64_t v13 = (uint64_t *)(v9 + 2);
      uint64_t v14 = v12 - 1;
      do
      {
        uint64_t v16 = *v13++;
        uint64_t v15 = v16;
        if ((v16 & 1) == 0) {
          *(void *)&v9[2 * ++v11] = v15;
        }
        --v14;
      }
      while (v14);
    }
    else
    {
      unsigned int v11 = 0;
    }
    *(void *)uint64_t v9 = v11;
  }
  else
  {
    uint64_t v17 = mdb_midl_alloc(0x1FFFF);
    *(void *)(v4 + 64) = v17;
    if (!v17) {
      return 12;
    }
  }
  uint64_t result = mdb_pages_xkeep(a1, 16, 1);
  if (!result)
  {
    uint64_t v18 = *v8;
    if (*v8)
    {
      if ((2 * v5) < 0x4000) {
        int v19 = 0x3FFF;
      }
      else {
        int v19 = 2 * v5;
      }
      do
      {
        uint64_t v20 = &v8[4 * v18];
        uint64_t v21 = v20[1];
        if ((*(_WORD *)(v21 + 10) & 0xC000) == 0)
        {
          unint64_t v22 = 2 * *v20;
          uint64_t v23 = *(void **)v4;
          if (*(void *)v4)
          {
            while (1)
            {
              uint64_t v24 = (unsigned int *)v23[8];
              if (v24)
              {
                unsigned int v25 = mdb_midl_search(v24, v22);
                uint64_t v26 = (void *)v23[8];
                if (*v26 >= (unint64_t)v25 && v26[v25] == v22) {
                  break;
                }
              }
              uint64_t v23 = (void *)*v23;
              if (!v23) {
                goto LABEL_33;
              }
            }
            *(_WORD *)(v21 + 10) |= 0x8000u;
          }
          else
          {
LABEL_33:
            uint64_t result = mdb_midl_append((unint64_t **)(v4 + 64), v22);
            if (result) {
              goto LABEL_41;
            }
            --v19;
          }
        }
        --v18;
      }
      while (v18 && v19);
    }
    mdb_midl_sort(*(int **)(v4 + 64));
    uint64_t result = mdb_page_flush(v4, v18);
    if (!result) {
      uint64_t result = mdb_pages_xkeep(a1, 32784, v18);
    }
  }
LABEL_41:
  if (result) {
    int v27 = 2;
  }
  else {
    int v27 = 8;
  }
  *(_DWORD *)(v4 + 124) |= v27;
  return result;
}

uint64_t mdb_page_new(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  int v10 = 0;
  uint64_t result = mdb_page_alloc(a1, a3, &v10);
  if (!result)
  {
    uint64_t v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16);
    if (a2)
    {
      ++*(void *)(*(void *)(a1 + 40) + 8);
    }
    else if ((a2 & 2) != 0)
    {
      ++*(void *)(*(void *)(a1 + 40) + 16);
    }
    else if ((a2 & 4) != 0)
    {
      *(void *)(*(void *)(a1 + 40) + 24) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_cursor_touch(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(unsigned char **)(a1 + 56) & 0x21) == 0)
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    memset(v7, 0, sizeof(v7));
    uint64_t v6 = *(void *)(a1 + 24);
    if (*(_DWORD *)(*(void *)(v6 + 96) + 4 * v2) != *(_DWORD *)(*(void *)(*(void *)(v6 + 32) + 152) + 4 * v2)) {
      return 4294936516;
    }
    mdb_cursor_init((uint64_t)v8, v6, 1u, (uint64_t)v7);
    uint64_t result = mdb_page_search((uint64_t)v8, *(void **)(a1 + 48), 1);
    if (result) {
      return result;
    }
    **(unsigned char **)(a1 + 56) |= 1u;
  }
  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64)) {
    return 0;
  }
  do
  {
    uint64_t result = mdb_page_touch(a1);
    unsigned int v4 = *(unsigned __int16 *)(a1 + 64);
    if (result) {
      break;
    }
    unsigned __int16 v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }
  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t mdb_update_key(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  unsigned __int16 v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  unsigned int v8 = v5[8];
  int v7 = v5 + 8;
  uint64_t v6 = v8;
  uint64_t v9 = (unsigned __int16 *)((char *)v4 + v8);
  size_t v10 = *(void *)a2;
  int v11 = (*(void *)a2 + 1) & 0xFFFFFFFE;
  int v12 = v9[3];
  int v13 = (v12 + 1) & 0x1FFFE;
  int v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      int v15 = v4[6];
    }
    else
    {
      int v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        size_t v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        mdb_node_del((void *)a1, 0);
        return mdb_page_split(a1, a2, 0, v17, 0x40000);
      }
    }
    uint64_t v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      uint64_t v20 = v4 + 8;
      do
      {
        unsigned int v21 = (unsigned __int16)*v20;
        if (v21 <= v6) {
          _WORD *v20 = v21 - v14;
        }
        ++v20;
        --v19;
      }
      while (v19);
    }
    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    uint64_t v9 = (unsigned __int16 *)((char *)v4 + *v7);
    int v12 = v9[3];
    size_t v10 = *(void *)a2;
  }
  if (v10 != v12) {
    v9[3] = v10;
  }
  if (v10) {
    memcpy(v9 + 4, *(const void **)(a2 + 8), v10);
  }
  return 0;
}

uint64_t mdb_page_alloc(uint64_t a1, signed int a2, char **a3)
{
  signed int v3 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v4 + 32);
  int v7 = (uint64_t **)(v5 + 176);
  uint64_t v6 = *(uint64_t **)(v5 + 176);
  if (v6) {
    unsigned int v8 = *(_DWORD *)v6;
  }
  else {
    unsigned int v8 = 0;
  }
  unint64_t v40 = 0;
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  uint64_t v9 = (a2 - 1);
  if (a2 == 1 && (uint64_t v10 = *(void *)(v4 + 48)) != 0)
  {
    uint64_t result = 0;
    *(void *)(v4 + 48) = *(void *)(v10 + 48);
    --*(_DWORD *)(v4 + 56);
    *a3 = (char *)v10;
  }
  else
  {
    *a3 = 0;
    if (*(_DWORD *)(v4 + 128))
    {
      unint64_t oldest = 0;
      uint64_t v13 = 0;
      int v35 = 0;
      char v14 = 1;
      int v15 = 1 - a2;
      int v33 = 60 * a2;
      while (1)
      {
        uint64_t v41 = 0;
        uint64_t v42 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if (v8 > v9)
        {
          uint64_t v16 = v7;
          unsigned int v17 = v8;
          unsigned int v18 = v8;
          while (1)
          {
            uint64_t v19 = v6[v18];
            if (v6[v15 + v18] == v19 + v9) {
              goto LABEL_41;
            }
            if (--v18 <= v9)
            {
              signed int v3 = a2;
              BOOL v20 = v33-- < 1;
              unsigned int v8 = v17;
              if (v20) {
                goto LABEL_39;
              }
              int v7 = v16;
              break;
            }
          }
        }
        if (v14)
        {
          unint64_t v40 = *(void *)(v5 + 184);
          unint64_t oldest = *(void *)(v5 + 168);
          mdb_cursor_init((uint64_t)v38, v4, 0, 0);
          unint64_t v21 = v40;
          if (v40)
          {
            uint64_t v42 = (char *)&v40;
            uint64_t v41 = 8;
            uint64_t v13 = 17;
          }
          else
          {
            uint64_t v13 = 0;
          }
        }
        else
        {
          unint64_t v21 = v40;
        }
        unint64_t v22 = v21 + 1;
        unint64_t v40 = v22;
        if (oldest <= v22)
        {
          if (!v35)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v22 = v40;
          }
          if (oldest <= v22) {
            goto LABEL_39;
          }
          int v35 = 1;
        }
        uint64_t result = mdb_cursor_get(v38, &v41, 0, v13);
        if (result) {
          break;
        }
        unint64_t v23 = *(void *)v42;
        unint64_t v40 = v23;
        if (oldest <= v23)
        {
          if (!v35)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v23 = v40;
          }
          if (oldest <= v23) {
            goto LABEL_39;
          }
          int v35 = 1;
        }
        uint64_t result = mdb_node_read((uint64_t)v38, (unsigned int *)(*((void *)&v38[4] + WORD1(v38[4]) + 1)+ *(unsigned __int16 *)(*((void *)&v38[4] + WORD1(v38[4]) + 1)+ 2 * *((unsigned __int16 *)&v38[20] + WORD1(v38[4]) + 4)+ 16)), &v36);
        if (result) {
          goto LABEL_55;
        }
        uint64_t v24 = (uint64_t *)v37;
        if (v6)
        {
          uint64_t result = mdb_midl_need((_DWORD **)v7, *v37);
          if (result) {
            goto LABEL_55;
          }
          uint64_t v6 = *v7;
        }
        else
        {
          uint64_t v6 = mdb_midl_alloc(*v37);
          unsigned __int16 *v7 = v6;
          if (!v6) {
            goto LABEL_43;
          }
        }
        *(void *)(v5 + 184) = v40;
        mdb_midl_xmerge(v6, v24);
        char v14 = 0;
        unsigned int v8 = *(_DWORD *)v6;
        uint64_t v13 = 8;
      }
      if (result != -30798) {
        goto LABEL_55;
      }
LABEL_39:
      unsigned int v17 = v8;
      uint64_t v19 = *(void *)(v4 + 16);
      if ((unint64_t)(v19 + v3) >= *(void *)(v5 + 128))
      {
        uint64_t result = 4294936504;
        goto LABEL_55;
      }
      unsigned int v18 = 0;
LABEL_41:
      if ((*(unsigned char *)(v5 + 14) & 8) != 0)
      {
        unsigned int v25 = (char *)(*(void *)(v5 + 56) + v19 * *(unsigned int *)(v5 + 16));
      }
      else
      {
        unsigned int v25 = mdb_page_malloc(v4, a2);
        if (!v25)
        {
LABEL_43:
          uint64_t result = 12;
          goto LABEL_55;
        }
      }
      if (v18)
      {
        uint64_t v26 = v17 - a2;
        *uint64_t v6 = v26;
        unsigned int v27 = v18 - a2;
        if (v18 - a2 < v26)
        {
          uint64_t v28 = v26 - v27;
          int v29 = &v6[v27 + 1];
          unsigned int v30 = v18 + 1;
          do
          {
            *v29++ = v6[v30++];
            --v28;
          }
          while (v28);
        }
      }
      else
      {
        *(void *)(v4 + 16) = v19 + a2;
      }
      *(void *)unsigned int v25 = v19;
      long long v31 = (void (*)(void, uint64_t *))mdb_mid2l_append;
      if ((*(_DWORD *)(v4 + 124) & 0x80000) == 0) {
        long long v31 = (void (*)(void, uint64_t *))mdb_mid2l_insert;
      }
      uint64_t v41 = v19;
      uint64_t v42 = v25;
      v31(*(void *)(v4 + 72), &v41);
      uint64_t result = 0;
      --*(_DWORD *)(v4 + 128);
      *a3 = v25;
    }
    else
    {
      uint64_t result = 4294936508;
LABEL_55:
      *(_DWORD *)(v4 + 124) |= 2u;
    }
  }
  return result;
}

void *mdb_node_del(void *result, int a2)
{
  uint64_t v2 = *((unsigned __int16 *)result + 33);
  signed int v3 = (_WORD *)result[v2 + 9];
  uint64_t v4 = *((unsigned __int16 *)result + v2 + 164);
  uint64_t v5 = (unsigned __int16)v3[6];
  unint64_t v6 = v5 + 131056;
  __int16 v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    __int16 v12 = a2;
    int v13 = ~v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      char v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      uint64_t result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }
    __int16 v17 = v3[7];
    int v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    __int16 v18 = v12 - 2;
  }
  else
  {
    uint64_t v8 = (unsigned __int16)v3[v4 + 8];
    uint64_t v9 = (char *)v3 + v8;
    int v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    int v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if (*((_WORD *)v9 + 2)) {
        int v11 = v10 + 16;
      }
      else {
        v11 += *(_DWORD *)v9;
      }
    }
    unsigned int v16 = (v11 + 1) & 0xFFFFFFFE;
    uint64_t v19 = (unsigned __int16)(v6 >> 1);
    if (v19)
    {
      unsigned __int16 v20 = 0;
      unint64_t v21 = v3 + 8;
      do
      {
        if (v4)
        {
          __int16 v22 = *v21;
          unint64_t v23 = &v3[v20];
          v23[8] = *v21;
          uint64_t v24 = v23 + 8;
          if (*v21 < v8) {
            *uint64_t v24 = v22 + v16;
          }
          ++v20;
        }
        ++v21;
        --v4;
        --v19;
      }
      while (v19);
    }
    uint64_t result = memmove((char *)v3 + (unsigned __int16)v3[7] + v16, (char *)v3 + (unsigned __int16)v3[7], v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    __int16 v18 = v3[7];
    int v15 = v3 + 7;
  }
  *int v15 = v18 + v16;
  return result;
}

uint64_t mdb_page_get(uint64_t a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 70) & 0xA) != 0)
  {
LABEL_10:
    if (*(void *)(v7 + 16) <= a2)
    {
      *(_DWORD *)(v7 + 124) |= 2u;
      return 4294936499;
    }
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = 2 * a2;
    int v9 = 1;
    int v10 = *(void **)(a1 + 24);
    while (1)
    {
      int v11 = (unsigned int *)v10[8];
      __int16 v12 = (unsigned int *)v10[9];
      if (v11)
      {
        unsigned int v13 = mdb_midl_search(v11, 2 * a2);
        char v14 = (void *)v10[8];
        if (*v14 >= (unint64_t)v13 && v14[v13] == v8) {
          break;
        }
      }
      if (*(void *)v12)
      {
        unsigned int v15 = mdb_mid2l_search(v12, a2);
        if (*(void *)v12 >= (unint64_t)v15 && *(void *)&v12[4 * v15] == a2)
        {
          unint64_t v16 = *(void *)&v12[4 * v15 + 2];
          goto LABEL_13;
        }
      }
      ++v9;
      int v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_10;
      }
    }
  }
  unint64_t v16 = *(void *)(*(void *)(v7 + 32) + 56) + *(unsigned int *)(*(void *)(v7 + 32) + 16) * a2;
LABEL_13:
  *a3 = v16;
  uint64_t result = 0;
  if (a4) {
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_page_unspill(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = 2 * *(void *)a2;
  uint64_t v8 = (void *)a1;
  while (1)
  {
    int v9 = (unsigned int *)v8[8];
    if (v9)
    {
      unsigned int v10 = mdb_midl_search(v9, v7);
      int v11 = (void *)v8[8];
      if (*v11 >= (unint64_t)v10)
      {
        uint64_t v12 = v10;
        if (v11[v10] == v7) {
          break;
        }
      }
    }
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      return 0;
    }
  }
  if (!*(_DWORD *)(a1 + 128)) {
    return 4294936508;
  }
  if ((*(_WORD *)(a2 + 10) & 4) != 0) {
    signed int v14 = *(_DWORD *)(a2 + 12);
  }
  else {
    signed int v14 = 1;
  }
  if ((*(unsigned char *)(v6 + 14) & 8) != 0)
  {
    unint64_t v16 = (char *)a2;
  }
  else
  {
    unsigned int v15 = mdb_page_malloc(a1, v14);
    if (!v15) {
      return 12;
    }
    unint64_t v16 = v15;
    int v17 = *(_DWORD *)(v6 + 16);
    if (v14 < 2) {
      mdb_page_copy(v15, (_WORD *)a2, v17);
    }
    else {
      memcpy(v15, (const void *)a2, (v17 * v14));
    }
  }
  if (v8 == (void *)a1)
  {
    __int16 v18 = *(void **)(a1 + 64);
    if (*v18 == v12) {
      void *v18 = v12 - 1;
    }
    else {
      v18[v12] |= 1uLL;
    }
  }
  uint64_t v19 = mdb_mid2l_append;
  if ((*(_DWORD *)(a1 + 124) & 0x80000) == 0) {
    uint64_t v19 = mdb_mid2l_insert;
  }
  v20[0] = *(void *)v16;
  v20[1] = v16;
  ((void (*)(void, void *))v19)(*(void *)(a1 + 72), v20);
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v16 + 5) |= 0x10u;
  *a3 = v16;
  return result;
}

char *mdb_page_malloc(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  size_t v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    uint64_t v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(void *)(v3 + 192) = *(void *)v5;
      return v5;
    }
    size_t v7 = v4 - 16;
    uint64_t v6 = 16;
  }
  else
  {
    uint64_t v6 = v4 * (unint64_t)a2 - v4;
    size_t v7 = *(unsigned int *)(v3 + 16);
    size_t v4 = v4 * (unint64_t)a2;
  }
  uint64_t v8 = (char *)malloc_type_malloc(v4, 0x19F3F053uLL);
  uint64_t v5 = v8;
  if (v8)
  {
    if ((*(unsigned char *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }
  return v5;
}

uint64_t mdb_ovpage_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v6 = *(void *)(v3 + 32);
  size_t v7 = (unsigned int **)(v6 + 176);
  if (!*(void *)(v6 + 176) || *(void *)v3)
  {
LABEL_3:
    uint64_t result = mdb_midl_append_range((uint64_t **)(v3 + 40), v4, v5);
    if (result) {
      return result;
    }
    goto LABEL_4;
  }
  unsigned int v10 = *(void **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    unsigned int v12 = 0;
  }
  else
  {
    if (!v10) {
      goto LABEL_3;
    }
    unsigned int v11 = mdb_midl_search(*(unsigned int **)(v3 + 64), 2 * v4);
    if (*v10 < (unint64_t)v11) {
      goto LABEL_3;
    }
    unsigned int v12 = v11;
    if (v10[v11] != 2 * v4) {
      goto LABEL_3;
    }
  }
  uint64_t result = mdb_midl_need(v7, v5);
  if (!result)
  {
    if ((*(_WORD *)(a2 + 10) & 0x10) == 0)
    {
      if (*v10 == v12) {
        *unsigned int v10 = v12 - 1;
      }
      else {
        v10[v12] |= 1uLL;
      }
LABEL_23:
      unint64_t v23 = *v7;
      unsigned int v24 = **v7;
      if (v24)
      {
        while (1)
        {
          unsigned int v25 = v5 + v24;
          unint64_t v26 = *(void *)&v23[2 * v24];
          if (v26 >= v4) {
            break;
          }
          *(void *)&v23[2 * v25] = v26;
          if (!--v24)
          {
            unsigned int v25 = v5;
            break;
          }
        }
      }
      else
      {
        unsigned int v25 = v5;
      }
      if (v25 > v24)
      {
        unsigned int v27 = &v23[2 * v25];
        do
        {
          *(void *)unsigned int v27 = v4;
          v27 -= 2;
          ++v4;
          --v25;
        }
        while (v24 < v25);
      }
      *(void *)v23 += v5;
LABEL_4:
      uint64_t result = 0;
      *(void *)(*(void *)(a1 + 40) + 24) -= v5;
      return result;
    }
    unsigned int v13 = *(uint64_t **)(v3 + 72);
    uint64_t v14 = (*v13)--;
    unsigned int v15 = &v13[2 * v14];
    uint64_t v16 = v15[1];
    if (v16 == a2)
    {
LABEL_20:
      ++*(_DWORD *)(v3 + 128);
      if ((*(unsigned char *)(v6 + 14) & 8) == 0) {
        mdb_dpage_free(v6, (void *)a2);
      }
      goto LABEL_23;
    }
    uint64_t v17 = v14;
    uint64_t v18 = *v15;
    uint64_t v19 = v17 + 1;
    unsigned __int16 v20 = &v13[2 * v17 - 1];
    while ((unint64_t)--v19 >= 2)
    {
      uint64_t v21 = *(v20 - 1);
      uint64_t v22 = *v20;
      *(v20 - 1) = v18;
      uint64_t *v20 = v16;
      v20 -= 2;
      uint64_t v16 = v22;
      uint64_t v18 = v21;
      if (v22 == a2) {
        goto LABEL_20;
      }
    }
    uint64_t v28 = *v13 + 1;
    uint64_t *v13 = v28;
    int v29 = &v13[2 * v28];
    *int v29 = v18;
    v29[1] = v16;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936517;
  }
  return result;
}

uint64_t mdb_page_split(uint64_t a1, uint64_t a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10 = *(void *)(*(void *)(a1 + 24) + 32);
  v216[0] = 0uLL;
  size_t v214 = 0;
  v215 = 0;
  uint64_t v212 = 0;
  v213 = 0;
  v210 = 0;
  v211 = 0;
  uint64_t v209 = 0;
  memset(v208, 0, sizeof(v208));
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  uint64_t v11 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
  unsigned int v13 = (void *)(a1 + 328);
  uint64_t v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  int v15 = *(unsigned __int16 *)(v12 + 12);
  uint64_t result = mdb_page_new(a1, *(_WORD *)(v12 + 10), 1, &v211);
  if (result) {
    return result;
  }
  v173 = a3;
  v177 = v211;
  uint64_t v178 = a2;
  *((_WORD *)v211 + 4) = *(_WORD *)(v12 + 8);
  int v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    size_t v170 = a4;
    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v175 = v14;
    unsigned int v20 = 0;
    unsigned int v21 = v17 - 1;
  }
  else
  {
    uint64_t result = mdb_page_new(a1, 1, 1, &v210);
    if (result) {
      goto LABEL_177;
    }
    size_t v170 = a4;
    uint64_t v31 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      unint64_t v32 = v31 + 1;
      int v33 = (void *)(a1 + 8 * v31 + 72);
      uint64_t v34 = (_WORD *)(a1 + 2 * v31 + 328);
      int v35 = v33;
      uint64_t v36 = v34;
      do
      {
        uint64_t v37 = *--v35;
        void *v33 = v37;
        LOWORD(v37) = *--v36;
        _WORD *v34 = v37;
        --v32;
        uint64_t v34 = v36;
        int v33 = v35;
      }
      while (v32 > 1);
    }
    uint64_t v38 = v210;
    *(void *)(a1 + 72) = v210;
    *(_WORD *)(a1 + 328) = 0;
    uint64_t v39 = *(void *)(a1 + 40);
    *(void *)(v39 + 40) = *(void *)v38;
    unsigned int v20 = *(unsigned __int16 *)(v39 + 6);
    *(_WORD *)(v39 + 6) = v20 + 1;
    uint64_t result = mdb_node_add(a1, 0, 0, 0, *(void *)v12, 0);
    if (result)
    {
      *(void *)(a1 + 72) = *(void *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      uint64_t v40 = *(void *)(a1 + 40);
      *(void *)(v40 + 40) = *(void *)v12;
      --*(_WORD *)(v40 + 6);
      goto LABEL_177;
    }
    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v175 = v14;
    unsigned int v21 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }
  mdb_cursor_copy(a1, (uint64_t)&v204);
  *(void *)&long long v205 = 0;
  uint64_t v22 = WORD1(v208[0]);
  unint64_t v23 = (size_t *)v177;
  *((void *)v208 + WORD1(v208[0]) + 1) = v177;
  unsigned int v24 = (char *)&v204 + 2 * v21;
  *((_WORD *)v24 + 164) = *(_WORD *)(a1 + 2 * v21 + 328) + 1;
  unsigned int v171 = v21;
  unsigned int v169 = v20;
  if ((v18 & 0x20000) != 0)
  {
    unsigned int v41 = v21;
    unsigned int v174 = 0;
    uint64_t v42 = 0;
    *((_WORD *)&v208[16] + v22 + 4) = 0;
    v216[0] = *(_OWORD *)v178;
    size_t v43 = *(void *)&v216[0];
    signed int v44 = v175;
    signed int v172 = v175;
    uint64_t v28 = v19;
    int v45 = v18;
    goto LABEL_71;
  }
  unsigned int v25 = v15 - 16;
  unsigned int v26 = v25 >> 1;
  unsigned int v27 = ((v25 >> 1) + 1) >> 1;
  uint64_t v28 = v19;
  unsigned int v174 = v25 >> 1;
  v165 = v24;
  if ((*((_WORD *)v177 + 5) & 0x20) == 0)
  {
    unsigned int v29 = (v26 + 1) >> 1;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      unint64_t v53 = *(void *)v178 + *v173 + 8;
      uint64_t v54 = 8 - *v173;
      if (v53 <= *(unsigned int *)(v28 + 220)) {
        LODWORD(v54) = 0;
      }
      LODWORD(v30) = (v53 + v54 + 3) & 0xFFFFFFFE;
    }
    else if (v178)
    {
      uint64_t v30 = *(void *)v178 + 10;
    }
    else
    {
      LODWORD(v30) = 10;
    }
    int v58 = *(_DWORD *)(v28 + 16);
    uint64_t v59 = mdb_page_malloc(*(void *)(a1 + 24), 1u);
    if (v59)
    {
      uint64_t v42 = v59;
      int v60 = v58 - 16;
      int v61 = (v30 + 1) & 0xFFFFFFFE;
      *(void *)uint64_t v59 = *(void *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v28 + 16);
      if (v25 > 1)
      {
        int v66 = 0;
        unsigned int v62 = v25 >> 1;
        if (v174 <= 1) {
          uint64_t v67 = 1;
        }
        else {
          uint64_t v67 = v174;
        }
        uint64_t v68 = (__int16 *)(v12 + 16);
        signed int v44 = v175;
        uint64_t v69 = v175;
        unsigned int v65 = v29;
        do
        {
          if (!v69)
          {
            unint64_t v70 = &v59[2 * v66++];
            *((_WORD *)v70 + 8) = 0;
          }
          __int16 v71 = *v68++;
          uint64_t v72 = &v59[2 * v66++];
          *((_WORD *)v72 + 8) = v71;
          --v69;
          --v67;
        }
        while (v67);
        if (v60 >= 0) {
          int v73 = v58 - 16;
        }
        else {
          int v73 = v58 - 1;
        }
        BOOL v63 = v174 > v175;
        unsigned int v41 = v171;
        unint64_t v23 = (size_t *)v177;
        __int16 v64 = (size_t *)v178;
        if (v25 >= 0x40 && v61 <= v73 >> 4 && v174 > v175)
        {
          int v45 = v18;
          goto LABEL_68;
        }
      }
      else
      {
        signed int v44 = v175;
        unint64_t v23 = (size_t *)v177;
        unsigned int v62 = v25 >> 1;
        BOOL v63 = v174 > v175;
        unsigned int v41 = v171;
        __int16 v64 = (size_t *)v178;
        unsigned int v65 = v29;
      }
      if (v65 < v44 && v63)
      {
        int v74 = v65 - 1;
        int v75 = -1;
        BOOL v63 = 1;
        LODWORD(v76) = v62;
      }
      else
      {
        if (v63)
        {
          BOOL v63 = 0;
          LODWORD(v76) = 0;
          int v74 = v65 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          int v75 = 1;
          int v45 = v18;
          goto LABEL_54;
        }
        LODWORD(v76) = 0;
        int v75 = 1;
        int v74 = v62;
      }
      int v45 = v18;
      if (v76 != v74)
      {
LABEL_54:
        signed int v77 = 0;
        uint64_t v78 = v75;
        uint64_t v79 = v74 - v75;
        int v80 = -(int)v76;
        int v81 = -v74;
        uint64_t v76 = v76;
        while (1)
        {
          if (v44 == v76)
          {
            v77 += v61;
          }
          else
          {
            uint64_t v82 = v12 + *(unsigned __int16 *)&v42[2 * v76 + 16];
            int v83 = v77 + *(unsigned __int16 *)(v82 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if (*(_WORD *)(v82 + 4)) {
                v83 += 8;
              }
              else {
                v83 += *(_DWORD *)v82;
              }
            }
            signed int v77 = (v83 + 1) & 0xFFFFFFFE;
          }
          if (v77 > v60 || v79 == v76) {
            break;
          }
          v76 += v78;
          v80 -= v78;
          if (v81 == v80) {
            goto LABEL_67;
          }
        }
        unsigned int v65 = v63 - v80;
LABEL_67:
        unint64_t v23 = (size_t *)v177;
      }
LABEL_68:
      unsigned int v24 = v165;
      if (v65 == v44)
      {
        size_t v43 = *v64;
        size_t v84 = v64[1];
        *(void *)&v216[0] = *v64;
        *((void *)&v216[0] + 1) = v84;
        signed int v172 = v44;
      }
      else
      {
        signed int v172 = v65;
        uint64_t v85 = v12 + *(unsigned __int16 *)&v42[2 * v65 + 16];
        size_t v43 = *(unsigned __int16 *)(v85 + 6);
        *(void *)&v216[0] = v43;
        *((void *)&v216[0] + 1) = v85 + 8;
      }
      goto LABEL_71;
    }
    uint64_t result = 12;
LABEL_177:
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return result;
  }
  int v46 = *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v17 + 328);
  int v47 = v46 - v27;
  size_t v43 = **(unsigned int **)(a1 + 40);
  uint64_t v48 = v12 + 16 + v43 * v27;
  size_t v49 = v43 * (v26 - v27);
  *(_WORD *)(v12 + 12) -= 2 * (v26 - v27);
  *((_WORD *)v177 + 6) += 2 * (v26 - v27);
  __int16 v50 = v43 * (v26 - v27) - 2 * (v26 - v27);
  *(_WORD *)(v12 + 14) += v50;
  *((_WORD *)v177 + 7) -= v50;
  *(void *)&v216[0] = v43;
  uint64_t v51 = v48;
  if (v27 == v175) {
    uint64_t v51 = *(void *)(v178 + 8);
  }
  *((void *)&v216[0] + 1) = v51;
  uint64_t v163 = v28;
  signed int v172 = ((v25 >> 1) + 1) >> 1;
  if (v47 < 0)
  {
    unint64_t v55 = (char *)(v12 + 16 + v43 * *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
    memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), v49);
    *((void *)&v216[0] + 1) = v177 + 16;
    memmove(&v55[v43], v55, ((((v25 >> 1) + 1) >> 1) - *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)))* v43);
    unint64_t v56 = v55;
    uint64_t v28 = v163;
    memcpy(v56, *(const void **)(v178 + 8), v43);
    signed int v44 = v175;
    unint64_t v23 = (size_t *)v177;
    unsigned int v41 = v171;
    uint64_t v42 = 0;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v43 + 2;
    int v45 = v18;
    unsigned int v24 = v165;
  }
  else
  {
    uint64_t v52 = (v47 * v43);
    if (v46 != v27)
    {
      memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), (v47 * v43));
      unint64_t v23 = (size_t *)v177;
    }
    int v57 = (char *)v23 + v52 + 16;
    memcpy(v57, *(const void **)(v178 + 8), v43);
    memcpy(&v57[v43], (const void *)(v48 + v52), (v49 - v52));
    unint64_t v23 = (size_t *)v177;
    uint64_t v42 = 0;
    *((_WORD *)v177 + 6) += 2;
    *((_WORD *)v177 + 7) = *((_WORD *)v177 + 7) - v43 + 2;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v47;
    uint64_t v28 = v163;
    unsigned int v24 = v165;
    int v45 = v18;
    signed int v44 = v175;
    unsigned int v41 = v171;
  }
LABEL_71:
  uint64_t v86 = *((void *)v208 + v41 + 1);
  unsigned __int16 v87 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
  unint64_t v168 = v43 + 10;
  if (v43 + 10 <= v87)
  {
    unsigned __int16 v167 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
    --WORD1(v208[0]);
    LODWORD(result) = mdb_node_add((uint64_t)&v204, *((unsigned __int16 *)v24 + 164), (const void **)v216, 0, *v23, 0);
    ++WORD1(v208[0]);
    size_t v99 = v170;
    uint64_t v100 = (const void **)v178;
    if (!result) {
      goto LABEL_91;
    }
    goto LABEL_82;
  }
  signed int v176 = v44;
  uint64_t v88 = v28;
  unsigned int v166 = *(unsigned __int16 *)(a1 + 64);
  --LOWORD(v208[0]);
  --WORD1(v208[0]);
  uint64_t v203 = 0;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  uint64_t v89 = *(void *)(*((void *)&v205 + 1) + 104);
  uint64_t v90 = v206;
  uint64_t v91 = &v204;
  if ((BYTE4(v208[0]) & 4) != 0)
  {
    DWORD1(v183) = 1;
    *(void *)&long long v180 = &v204;
    uint64_t v91 = &v179;
  }
  *(void *)uint64_t v91 = *(void *)(v89 + 8 * v206);
  *(void *)(v89 + 8 * v90) = v91;
  uint64_t result = mdb_page_split(&v204, v216, 0, *v23, 0);
  *(void *)(v89 + 8 * v90) = *(void *)v91;
  uint64_t v28 = v88;
  if (result) {
    goto LABEL_174;
  }
  unsigned __int16 v167 = v87;
  if (*(unsigned __int16 *)(a1 + 64) <= v166) {
    unint64_t v92 = v171;
  }
  else {
    unint64_t v92 = v171 + 1;
  }
  uint64_t v93 = *((void *)v208 + v92 + 1);
  uint64_t v94 = a1 + 8 * v92;
  uint64_t v97 = *(void *)(v94 + 72);
  uint64_t v95 = (void *)(v94 + 72);
  uint64_t v96 = v97;
  unsigned int v171 = v92;
  if (v93 == v97)
  {
    signed int v44 = v176;
    size_t v99 = v170;
    uint64_t v100 = (const void **)v178;
    goto LABEL_91;
  }
  uint64_t v98 = a1 + 2 * v92;
  size_t v99 = v170;
  uint64_t v100 = (const void **)v178;
  if (*(unsigned __int16 *)(v98 + 328) < (*(unsigned __int16 *)(v96 + 12) - 16) >> 1)
  {
    signed int v44 = v176;
    goto LABEL_91;
  }
  if ((int)v92 >= 1)
  {
    unint64_t v101 = 0;
    uint64_t v102 = a1 + 328;
    do
    {
      *(void *)(v102 + 8 * v101 - 256) = *((void *)v208 + v101 + 1);
      *(_WORD *)(v102 + 2 * v101) = *((_WORD *)&v208[16] + v101 + 4);
      ++v101;
    }
    while (v101 < v92);
  }
  size_t v103 = (_WORD *)(v98 + 328);
  *uint64_t v95 = v93;
  signed int v44 = v176;
  if (*((_WORD *)&v208[16] + v92 + 4))
  {
    *size_t v103 = *((_WORD *)&v208[16] + v92 + 4) - 1;
    goto LABEL_91;
  }
  *size_t v103 = 0;
  LODWORD(result) = mdb_cursor_sibling(a1, 0);
  if (result)
  {
LABEL_82:
    if (result == -30798) {
      uint64_t result = 4294936517;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_174;
  }
LABEL_91:
  if ((v45 & 0x20000) != 0)
  {
    uint64_t v123 = *(unsigned __int16 *)(a1 + 66);
    *(void *)(a1 + 8 * v123 + 72) = v177;
    *(_WORD *)(a1 + 2 * v123 + 328) = 0;
    uint64_t result = mdb_node_add(a1, 0, v100, v173, v99, v45);
    unsigned __int16 v116 = v167;
    if (result) {
      goto LABEL_174;
    }
    unsigned int v115 = v169;
    unsigned int v122 = v171;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, (char *)&v208[16] + 8, 2 * *(unsigned __int16 *)(a1 + 66));
      unsigned int v122 = v171;
    }
    goto LABEL_139;
  }
  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    unsigned int v115 = v169;
    unsigned int v122 = v171;
    unsigned __int16 v116 = v167;
    if (v172 <= v44)
    {
      *(void *)(a1 + 72 + 8 * *(unsigned __int16 *)(a1 + 66)) = v177;
      uint64_t v124 = a1 + 2 * v171;
      unsigned __int16 v125 = *(_WORD *)(v124 + 328) + 1;
      *(_WORD *)(v124 + 328) = v125;
      uint64_t v126 = *(void *)(a1 + 72 + 8 * v171);
      if (*((void *)v208 + v171 + 1) != v126
        && (*(unsigned __int16 *)(v126 + 12) - 16) >> 1 <= v125
        && (v171 & 0x80000000) == 0)
      {
        uint64_t v127 = 0;
        do
        {
          *(void *)(a1 + 8 * v127 + 72) = *((void *)v208 + v127 + 1);
          *(_WORD *)(a1 + 2 * v127 + 328) = *((_WORD *)&v208[16] + v127 + 4);
          ++v127;
        }
        while (v171 + 1 != v127);
      }
    }
LABEL_139:
    v134 = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (!v134)
    {
LABEL_173:
      uint64_t result = 0;
      goto LABEL_174;
    }
    unsigned int v135 = *(unsigned __int16 *)(v12 + 12) - 16;
    unsigned int v136 = v135 >> 1;
    int v137 = *(_DWORD *)(a1 + 68);
    v138 = v211;
    uint64_t v139 = 2 * v115 + 330;
    uint64_t v140 = 8 * v115 + 80;
    while (1)
    {
      v141 = v134;
      if ((v137 & 4) != 0) {
        v141 = (uint64_t *)v134[2];
      }
      if (v141 == (uint64_t *)a1 || (*((_DWORD *)v134 + 17) & *((_DWORD *)v141 + 17) & 1) == 0) {
        goto LABEL_172;
      }
      if (!v115) {
        break;
      }
      if (v141[9] == v12)
      {
        v142 = (_WORD *)((char *)v141 + v139);
        v143 = (uint64_t *)((char *)v141 + v140);
        uint64_t v144 = v115 + 1;
        v145 = (_WORD *)((char *)v141 + v139);
        v146 = (uint64_t *)((char *)v141 + v140);
        do
        {
          __int16 v147 = *--v145;
          _WORD *v142 = v147;
          uint64_t v148 = *--v146;
          void *v143 = v148;
          v143 = v146;
          v142 = v145;
        }
        while (v144-- > 1);
        *((_WORD *)v141 + 164) = v136 <= *((unsigned __int16 *)v141 + 164);
        v141[9] = *(void *)(a1 + 72);
        ++*((_WORD *)v141 + 32);
        unsigned __int16 v150 = *((_WORD *)v141 + 33) + 1;
        *((_WORD *)v141 + 33) = v150;
        goto LABEL_152;
      }
LABEL_172:
      v134 = (uint64_t *)*v134;
      if (!v134) {
        goto LABEL_173;
      }
    }
    unsigned __int16 v150 = *((_WORD *)v141 + 33);
LABEL_152:
    uint64_t v151 = *(unsigned __int16 *)(a1 + 66);
    if (v151 <= v150 && v141[v151 + 9] == v12)
    {
      uint64_t v154 = (uint64_t)v141 + 2 * v151;
      unsigned int v155 = *(unsigned __int16 *)(v154 + 328);
      if ((v45 & 0x40000) == 0 && v155 >= v44)
      {
        *(_WORD *)(v154 + 328) = v155 + 1;
        uint64_t v151 = *(unsigned __int16 *)(a1 + 66);
        unsigned int v155 = *((unsigned __int16 *)v141 + v151 + 164);
      }
      if (v136 <= v155)
      {
        v141[v151 + 9] = (uint64_t)v138;
        *((_WORD *)v141 + v151 + 164) = v155 - (v135 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          unint64_t v156 = 0;
          v157 = v141 + 41;
          do
          {
            *((_WORD *)v157 + v156) = *((_WORD *)&v208[16] + v156 + 4);
            v157[v156 - 32] = *((void *)v208 + v156 + 1);
            ++v156;
          }
          while (v156 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }
    else if (v168 <= v116 && (int)v122 <= v150 && v141[v122 + 9] == *(void *)(a1 + 8 * v122 + 72))
    {
      uint64_t v152 = (uint64_t)v141 + 2 * v122;
      unsigned int v153 = *(unsigned __int16 *)(v152 + 328);
      if (v153 >= *(unsigned __int16 *)(a1 + 2 * v122 + 328)) {
        *(_WORD *)(v152 + 328) = v153 + 1;
      }
    }
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      uint64_t v158 = v141[2];
      if (v158)
      {
        if (*(unsigned char *)(v158 + 68))
        {
          uint64_t v159 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v160 = v141[v159 + 9];
          uint64_t v161 = *((unsigned __int16 *)v141 + v159 + 164);
          if (v161 < (*(unsigned __int16 *)(v160 + 12) - 16) >> 1)
          {
            uint64_t v162 = v160 + *(unsigned __int16 *)(v160 + 2 * v161 + 16);
            if ((*(_WORD *)(v162 + 4) & 6) == 4) {
              *(void *)(v158 + 72) = v162 + *(unsigned __int16 *)(v162 + 6) + 8;
            }
          }
        }
      }
    }
    goto LABEL_172;
  }
  uint64_t v164 = v28;
  size_t v104 = 0;
  int v105 = 0;
  *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v177;
  unsigned int v106 = (size_t *)&v212;
  signed int v107 = v172;
  while (1)
  {
    if (v107 == v44)
    {
      unsigned int v108 = *(unsigned int **)(v178 + 8);
      size_t v214 = *(void *)v178;
      v215 = v108;
      if ((*(_WORD *)(v12 + 10) & 2) != 0) {
        unsigned int v106 = v173;
      }
      else {
        size_t v104 = v99;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v105;
      __int16 v109 = *(_WORD *)(v12 + 10);
      LODWORD(v110) = v45;
    }
    else
    {
      uint64_t v111 = (unsigned int *)(v12 + *(unsigned __int16 *)&v42[2 * v107 + 16]);
      v215 = v111 + 2;
      int v112 = (char *)*((unsigned __int16 *)v111 + 3);
      size_t v214 = (size_t)v112;
      __int16 v109 = *(_WORD *)(v12 + 10);
      if ((v109 & 2) != 0)
      {
        uint64_t v212 = *v111;
        v213 = &v112[(void)(v111 + 2)];
        LODWORD(v110) = *((unsigned __int16 *)v111 + 2);
        unsigned int v106 = (size_t *)&v212;
      }
      else
      {
        uint64_t v110 = *((unsigned __int16 *)v111 + 2);
        size_t v104 = *v111 | (unint64_t)(v110 << 32);
      }
    }
    if (!(v109 & 2 | v105)) {
      size_t v214 = 0;
    }
    uint64_t result = mdb_node_add(a1, (unsigned __int16)v105, (const void **)&v214, v106, v104, v110);
    if (result) {
      break;
    }
    if (v107 == v174)
    {
      signed int v107 = 0;
      int v105 = 0;
      *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v42;
    }
    else
    {
      ++v107;
      ++v105;
    }
    if (v107 == v172)
    {
      LODWORD(v113) = *((unsigned __int16 *)v42 + 6);
      unsigned int v114 = (v113 - 16) >> 1;
      uint64_t v28 = v164;
      unsigned int v115 = v169;
      unsigned __int16 v116 = v167;
      if ((v113 - 16) >= 2)
      {
        if (v114 <= 1) {
          uint64_t v117 = 1;
        }
        else {
          uint64_t v117 = v114;
        }
        v118 = (__int16 *)(v42 + 16);
        long long v119 = (_WORD *)(v12 + 16);
        do
        {
          __int16 v120 = *v118++;
          *v119++ = v120;
          --v117;
        }
        while (v117);
        uint64_t v113 = *((unsigned __int16 *)v42 + 6);
      }
      *(_WORD *)(v12 + 12) = v113;
      *(_WORD *)(v12 + 14) = *((_WORD *)v42 + 7);
      memcpy((void *)(v12 + *(unsigned __int16 *)(v12 + 2 * v114 - 2 + 16)), &v42[*(unsigned __int16 *)&v42[2 * v114 + 14]], *(_DWORD *)(v164 + 16) - *((unsigned __int16 *)v42 + 7));
      if (v172 <= v44)
      {
        uint64_t v121 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 72 + 8 * v121) = v211;
        unsigned int v122 = v171;
        uint64_t v128 = a1 + 2 * v171;
        unsigned __int16 v129 = *(_WORD *)(v128 + 328) + 1;
        *(_WORD *)(v128 + 328) = v129;
        uint64_t v130 = *(void *)(a1 + 72 + 8 * v171);
        if (*((void *)v208 + v171 + 1) != v130
          && (*(unsigned __int16 *)(v130 + 12) - 16) >> 1 <= v129
          && (v171 & 0x80000000) == 0)
        {
          uint64_t v131 = 0;
          do
          {
            *(void *)(a1 + 8 * v131 + 72) = *((void *)v208 + v131 + 1);
            *(_WORD *)(a1 + 2 * v131 + 328) = *((_WORD *)&v208[16] + v131 + 4);
            ++v131;
          }
          while (v171 + 1 != v131);
        }
      }
      else
      {
        uint64_t v121 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v121 + 72) = v12;
        unsigned int v122 = v171;
      }
      if ((v45 & 0x10000) != 0)
      {
        uint64_t v132 = *(void *)(a1 + 8 * v121 + 72);
        uint64_t v133 = v132
             + *(unsigned __int16 *)(v132 + 2 * *(unsigned __int16 *)(a1 + 2 * v121 + 328) + 16);
        if ((*(_WORD *)(v133 + 4) & 1) == 0) {
          v173[1] = v133 + *(unsigned __int16 *)(v133 + 6) + 8;
        }
      }
      goto LABEL_139;
    }
  }
  uint64_t v28 = v164;
LABEL_174:
  if (v42)
  {
    *(void *)uint64_t v42 = *(void *)(v28 + 192);
    *(void *)(v28 + 192) = v42;
  }
  if (result) {
    goto LABEL_177;
  }
  return result;
}

uint64_t mdb_node_add(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  uint64_t v8 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  int v35 = 0;
  __int16 v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    size_t v15 = **(int **)(a1 + 40);
    int v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1) {
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    }
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    uint64_t result = 0;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }
  int v10 = a6;
  int v13 = (unsigned __int16)v8[6];
  if (a3) {
    uint64_t v14 = (uint64_t)*a3 + 8;
  }
  else {
    uint64_t v14 = 8;
  }
  uint64_t v18 = (unsigned __int16)(v8[7] - v13) - 2;
  if ((v9 & 2) == 0)
  {
    unint64_t v19 = v14;
    goto LABEL_16;
  }
  if (a6)
  {
    unint64_t v19 = v14 + 8;
LABEL_16:
    int64_t v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      uint64_t v20 = *(void *)(a1 + 24);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v19 = *a4 + v14;
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(v20 + 32);
  if (v19 <= *(unsigned int *)(v21 + 220)) {
    goto LABEL_16;
  }
  int64_t v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510;
  }
  uint64_t result = mdb_page_new(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if (result) {
    return result;
  }
  v10 |= 1u;
  int v13 = (unsigned __int16)v8[6];
LABEL_19:
  unsigned int v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    unsigned int v24 = &v8[v23 + 8];
    unsigned int v25 = &v8[v23 + 7];
    do
    {
      --v23;
      __int16 v26 = *v25--;
      *v24-- = v26;
    }
    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }
  unsigned __int16 v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  uint64_t v28 = (char *)v8 + v27;
  if (a3) {
    unsigned __int16 v29 = *(_WORD *)a3;
  }
  else {
    unsigned __int16 v29 = 0;
  }
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0) {
    a5 = *a4;
  }
  else {
    *((_WORD *)v28 + 2) = WORD2(a5);
  }
  *(_DWORD *)uint64_t v28 = a5;
  if (a3) {
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  }
  if ((v8[5] & 2) != 0)
  {
    uint64_t v30 = &v28[v29 + 8];
    if (v35)
    {
      uint64_t v31 = v35 + 16;
      *(void *)uint64_t v30 = *(void *)v35;
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v31;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = v31;
    }
    else
    {
      if (v10)
      {
        uint64_t result = 0;
        *(void *)uint64_t v30 = *(void *)a4[1];
        return result;
      }
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v30;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = &v28[v29 + 8];
    }
    memcpy(v34, v32, v33);
  }
  return 0;
}

uint64_t mdb_xcursor_init1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  int v3 = *(_DWORD *)(v2 + 68) & 0xA0004;
  *(_DWORD *)(v2 + 68) = v3;
  if ((*(unsigned char *)(a2 + 4) & 2) != 0)
  {
    uint64_t v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    long long v9 = *(_OWORD *)(v8 + 8);
    long long v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(void *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 64) = 0;
  }
  else
  {
    uint64_t v4 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(void *)(v2 + 392) = 0x1000000000000;
    __int16 v6 = *(_WORD *)(v4 + 8);
    uint64_t v5 = (_WORD *)(v4 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_1828E1E20;
    *(void *)(v2 + 416) = 0;
    *(void *)(v2 + 424) = ((unsigned __int16)v5[6] - 16) >> 1;
    *(_WORD *)(v2 + 432) = v6;
    *(_WORD *)(v2 + 434) = v5[1];
    *(_WORD *)(v2 + 436) = v5[2];
    *(_WORD *)(v2 + 438) = v5[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = v3 | 1;
    *(void *)(v2 + 72) = v5;
    *(_WORD *)(v2 + 328) = 0;
    uint64_t v7 = *(void *)(result + 40);
    if ((*(unsigned char *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v5[4];
      if ((*(unsigned char *)(v7 + 4) & 0x20) != 0) {
        *(_WORD *)(v2 + 396) = 24;
      }
    }
  }
  *(unsigned char *)(v2 + 488) = 56;
  if (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 456) == mdb_cmp_int && *(_DWORD *)(v2 + 392) == 8) {
    *(void *)(v2 + 456) = mdb_cmp_cint;
  }
  return result;
}

__n128 mdb_xcursor_init2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a3)
  {
    int v4 = *(_DWORD *)(v3 + 68) | 1;
    *(_DWORD *)(v3 + 64) = 1;
    *(_DWORD *)(v3 + 68) = v4;
    *(_WORD *)(v3 + 328) = 0;
    *(unsigned char *)(v3 + 488) = 56;
    *(void *)(v3 + 456) = *(void *)(a2 + 456);
  }
  else if ((*(unsigned char *)(v3 + 68) & 1) == 0)
  {
    return result;
  }
  __n128 result = *(__n128 *)(a2 + 392);
  long long v6 = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(v3 + 424) = v6;
  *(__n128 *)(v3 + 392) = result;
  *(void *)(v3 + 72) = *(void *)(a2 + 72);
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 124);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
    return 22;
  }
  if (*(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                                - 16) >> 1)
    return 4294936498;
  if ((a2 & 0x8000) != 0 || (uint64_t result = mdb_page_spill(a1, 0, 0), !result))
  {
    uint64_t result = mdb_cursor_touch(a1);
    if (!result)
    {
      uint64_t v6 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v7 = *(void *)(a1 + 8 * v6 + 72);
      __int16 v8 = *(_WORD *)(v7 + 10);
      if ((v8 & 2) == 0) {
        return 4294936500;
      }
      if ((v8 & 0x20) != 0)
      {
LABEL_42:
        return mdb_cursor_del0(a1);
      }
      uint64_t v9 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 2 * v6 + 328) + 16);
      int v10 = *(unsigned __int16 *)(v9 + 4);
      if ((v10 & 4) == 0)
      {
        if (((v10 ^ a2) & 2) != 0)
        {
          uint64_t result = 4294936512;
LABEL_47:
          *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
          return result;
        }
        goto LABEL_41;
      }
      if ((a2 & 0x20) != 0)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        *(void *)(*(void *)(a1 + 40) + 32) = *(void *)(*(void *)(a1 + 40) + 32)
                                                 - *(void *)(v11 + 424)
                                                 + 1;
        *(_DWORD *)(v11 + 68) &= ~1u;
        if ((v10 & 2) == 0) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }
      if ((v10 & 2) == 0) {
        *(void *)(*(void *)(a1 + 16) + 72) = v9 + *(unsigned __int16 *)(v9 + 6) + 8;
      }
      uint64_t result = mdb_cursor_del(*(void *)(a1 + 16), 0x8000);
      if (!result)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        if (*(void *)(v11 + 424))
        {
          if ((*(_WORD *)(v9 + 4) & 2) != 0)
          {
            uint64_t v18 = v9 + *(unsigned __int16 *)(v9 + 6);
            long long v20 = *(_OWORD *)(v11 + 408);
            long long v19 = *(_OWORD *)(v11 + 424);
            *(_OWORD *)(v18 + 8) = *(_OWORD *)(v11 + 392);
            *(_OWORD *)(v18 + 24) = v20;
            *(_OWORD *)(v18 + 40) = v19;
          }
          else
          {
            mdb_node_shrink((char *)v7, *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
            uint64_t v12 = *(unsigned __int16 *)(a1 + 66);
            uint64_t v13 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 328 + 2 * v12) + 16);
            *(void *)(*(void *)(a1 + 16) + 72) = v13 + *(unsigned __int16 *)(v13 + 6) + 8;
            for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
                  i;
                  unsigned int i = (uint64_t *)*i)
            {
              if (i != (uint64_t *)a1
                && *((unsigned __int16 *)i + 32) >= *(unsigned __int16 *)(a1 + 64)
                && (*((unsigned char *)i + 68) & 1) != 0
                && i[v12 + 9] == v7)
              {
                uint64_t v15 = i[2];
                if (v15)
                {
                  if (*(unsigned char *)(v15 + 68))
                  {
                    uint64_t v16 = *((unsigned __int16 *)i + v12 + 164);
                    if (v16 < (*(unsigned __int16 *)(v7 + 12) - 16) >> 1)
                    {
                      uint64_t v17 = v7 + *(unsigned __int16 *)(v7 + 2 * v16 + 16);
                      if ((*(_WORD *)(v17 + 4) & 6) == 4) {
                        *(void *)(v15 + 72) = v17 + *(unsigned __int16 *)(v17 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t result = 0;
          --*(void *)(*(void *)(a1 + 40) + 32);
          return result;
        }
        *(_DWORD *)(v11 + 68) &= ~1u;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_41:
          if (v10)
          {
            uint64_t v21 = 0;
            uint64_t result = mdb_page_get(a1, *(void *)(v9 + *(unsigned __int16 *)(v9 + 6) + 8), (unint64_t *)&v21, 0);
            if (result) {
              goto LABEL_47;
            }
            uint64_t result = mdb_ovpage_free(a1, v21);
            if (result) {
              goto LABEL_47;
            }
          }
          goto LABEL_42;
        }
LABEL_38:
        uint64_t result = mdb_drop0(v11, 0);
        if (result) {
          goto LABEL_47;
        }
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        goto LABEL_41;
      }
    }
  }
  return result;
}

char *mdb_node_shrink(char *result, int a2)
{
  int v2 = result;
  uint64_t v3 = &result[2 * a2];
  int v5 = *((unsigned __int16 *)v3 + 8);
  int v4 = (unsigned __int16 *)(v3 + 16);
  uint64_t v6 = &result[v5];
  uint64_t v7 = &v6[*((unsigned __int16 *)v6 + 3)];
  __int16 v8 = v7 + 8;
  int v9 = *((unsigned __int16 *)v7 + 10);
  unsigned __int16 v10 = *((_WORD *)v7 + 11) - v9;
  __int16 v11 = *(_WORD *)v6 - v10;
  if ((*((_WORD *)v7 + 9) & 0x20) != 0)
  {
    if (v11) {
      return result;
    }
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    uint64_t v13 = (unsigned __int16)(*(_WORD *)v6 - v10);
  }
  else
  {
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    if ((v9 - 16) >= 2)
    {
      unint64_t v14 = ((v9 - 16) >> 1) + 1;
      uint64_t v13 = 16;
      do
      {
        *(_WORD *)((char *)&v8[(v14 - 2) + 8] + v10) = v8[(v14 - 2) + 8] - v10;
        --v14;
      }
      while (v14 > 1);
    }
    else
    {
      uint64_t v13 = 16;
    }
  }
  v8[7] = v9;
  *(void *)__int16 v8 = *(void *)result;
  *(_WORD *)uint64_t v6 = v11;
  *((_WORD *)v6 + 1) = 0;
  uint64_t result = (char *)memmove(&result[*((unsigned __int16 *)result + 7) + v12], &result[*((unsigned __int16 *)result + 7)], (char *)v8 + v13 - &result[*((unsigned __int16 *)result + 7)]);
  unsigned int v15 = *((unsigned __int16 *)v2 + 6) - 16;
  if (v15 >= 2)
  {
    unsigned int v16 = *v4;
    unint64_t v17 = (v15 >> 1) + 1;
    do
    {
      uint64_t v18 = &v2[2 * (v17 - 2)];
      unsigned int v21 = *((unsigned __int16 *)v18 + 8);
      long long v19 = v18 + 16;
      __int16 v20 = v21;
      if (v21 <= v16) {
        _WORD *v19 = v20 + v10;
      }
      --v17;
    }
    while (v17 > 1);
  }
  *((_WORD *)v2 + 7) += v10;
  return result;
}

uint64_t mdb_drop0(uint64_t a1, int a2)
{
  LODWORD(result) = mdb_page_search(a1, 0, 4);
  if (result)
  {
    if (result == -30798) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_61;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  int v6 = *(_DWORD *)(a1 + 68);
  if (((v6 & 4) != 0 || !a2 && !*(void *)(*(void *)(a1 + 40) + 24)) && *(_WORD *)(a1 + 64))
  {
    __int16 v7 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v7;
    if (v7) {
      --*(_WORD *)(a1 + 66);
    }
    else {
      *(_DWORD *)(a1 + 68) = v6 & 0xFFFFFFFE;
    }
  }
  mdb_cursor_copy(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64)) {
    goto LABEL_58;
  }
  uint64_t v31 = v5;
  unint64_t v32 = (uint64_t **)(v5 + 40);
  uint64_t v8 = a1 + 330;
  while (1)
  {
    int v9 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v10 = (unsigned __int16)v9[6] - 16;
    unsigned int v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        uint64_t v13 = 0;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        do
        {
          uint64_t v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          __int16 v15 = *(_WORD *)(v14 + 4);
          if (v15)
          {
            unint64_t v33 = 0;
            unint64_t v16 = *(void *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            uint64_t result = mdb_page_get(a1, v16, &v33, 0);
            if (result
              || (v17 = v33, uint64_t result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), result))
            {
LABEL_55:
              uint64_t v5 = v31;
              goto LABEL_60;
            }
            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v19 = *(void *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(void *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              uint64_t v5 = v31;
              goto LABEL_47;
            }
          }
          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              mdb_xcursor_init1(a1, v14);
              uint64_t result = mdb_drop0(*(void *)(a1 + 16), 0);
              if (result) {
                goto LABEL_55;
              }
            }
          }
          ++v13;
        }
        while (v12 != v13);
        uint64_t v5 = v31;
        if (a2) {
          goto LABEL_42;
        }
LABEL_35:
        if (!*(void *)(*(void *)(a1 + 40) + 24)) {
          goto LABEL_47;
        }
        goto LABEL_42;
      }
      LOWORD(v12) = 0;
      if (!a2) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if (result) {
        goto LABEL_60;
      }
      if (v10 >= 2)
      {
        __int16 v20 = *v32;
        uint64_t v21 = v11 <= 1 ? 1 : v11;
        LOWORD(v12) = v21;
        int64_t v22 = v9 + 8;
        do
        {
          unsigned int v23 = *v22++;
          unint64_t v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          uint64_t v25 = *v20 + 1;
          uint64_t *v20 = v25;
          v20[v25] = v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        LOWORD(v12) = 0;
      }
    }
LABEL_42:
    if (!*(_WORD *)(a1 + 66)) {
      goto LABEL_58;
    }
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    uint64_t result = mdb_cursor_sibling(a1, 1);
    if (result != -30798)
    {
      if (result) {
        goto LABEL_59;
      }
      int v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }
LABEL_47:
    __int16 v27 = *(_WORD *)(a1 + 64);
    if (!v27) {
      goto LABEL_57;
    }
    unsigned __int16 v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1) {
      break;
    }
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    int v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v28 - 1;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(void *)(v8 + 8 * v29 - 250) = *((void *)v35 + v29);
        ++v29;
      }
      while (v30 != v29);
      int v26 = 1;
    }
LABEL_53:
    if (!v26) {
      goto LABEL_58;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  uint64_t result = mdb_midl_append((unint64_t **)(v5 + 40), *(void *)(*(void *)(a1 + 40) + 40));
LABEL_59:
  if (result) {
LABEL_60:
  }
    *(_DWORD *)(v5 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

uint64_t mdb_cursor_del0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 *)(a1 + 2 * v3 + 328);
  uint64_t v5 = *(void *)(a1 + 8 * v3 + 72);
  mdb_node_del((void *)a1, **(_DWORD **)(a1 + 40));
  --*(void *)(*(void *)(a1 + 40) + 32);
  for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v2); i; unsigned int i = (uint64_t *)*i)
  {
    __int16 v7 = i;
    if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
      __int16 v7 = (uint64_t *)i[2];
    }
    if (v7 != (uint64_t *)a1)
    {
      int v8 = *((_DWORD *)v7 + 17);
      if ((*((_DWORD *)i + 17) & v8 & 1) != 0
        && *((unsigned __int16 *)v7 + 32) >= *(unsigned __int16 *)(a1 + 64))
      {
        uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        if (v7[v9 + 9] == v5)
        {
          uint64_t v10 = (uint64_t)v7 + 2 * v9;
          unsigned int v11 = *(unsigned __int16 *)(v10 + 328);
          if (v11 == v4)
          {
            *((_DWORD *)v7 + 17) = v8 | 8;
            if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0) {
              *(_DWORD *)(v7[2] + 68) &= 0xFFFFFFFC;
            }
          }
          else
          {
            if (v11 > v4) {
              *(_WORD *)(v10 + 328) = v11 - 1;
            }
            uint64_t v12 = v7[2];
            if (v12)
            {
              if (*(unsigned char *)(v12 + 68))
              {
                uint64_t v13 = *((unsigned __int16 *)v7 + *(unsigned __int16 *)(a1 + 66) + 164);
                if (v13 < (*(unsigned __int16 *)(v5 + 12) - 16) >> 1)
                {
                  uint64_t v14 = v5 + *(unsigned __int16 *)(v5 + 2 * v13 + 16);
                  if ((*(_WORD *)(v14 + 4) & 6) == 4) {
                    *(void *)(v12 + 72) = v14 + *(unsigned __int16 *)(v14 + 6) + 8;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t result = mdb_rebalance(a1);
  if (!result)
  {
    if (!*(_WORD *)(a1 + 64))
    {
      uint64_t result = 0;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      goto LABEL_22;
    }
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v2);
    if (!v18)
    {
LABEL_47:
      uint64_t result = 0;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      int v17 = 8;
      goto LABEL_48;
    }
    uint64_t v19 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v20 = (*(unsigned __int16 *)(v19 + 12) - 16) >> 1;
    while (1)
    {
      uint64_t v21 = v18;
      if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
        uint64_t v21 = *(void *)(v18 + 16);
      }
      int64_t v22 = (unsigned char *)(v21 + 68);
      if ((*(_DWORD *)(v18 + 68) & *(_DWORD *)(v21 + 68) & 1) == 0) {
        goto LABEL_46;
      }
      if (*(unsigned __int16 *)(v21 + 64) < *(unsigned __int16 *)(a1 + 64)) {
        goto LABEL_46;
      }
      uint64_t v23 = *(unsigned __int16 *)(a1 + 66);
      if (*(void *)(v21 + 8 * v23 + 72) != v19) {
        goto LABEL_46;
      }
      unsigned int v24 = *(unsigned __int16 *)(v21 + 2 * v23 + 328);
      if (v24 < *(unsigned __int16 *)(a1 + 2 * v23 + 328)) {
        goto LABEL_46;
      }
      if (v20 <= v24)
      {
        uint64_t result = mdb_cursor_sibling(v21, 1);
        if (result == -30798)
        {
          int v28 = 2;
          goto LABEL_45;
        }
        if (result) {
          break;
        }
      }
      uint64_t v25 = *(void *)(v21 + 16);
      if (!v25 || (*v22 & 2) != 0) {
        goto LABEL_46;
      }
      uint64_t v26 = *(void *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
          + *(unsigned __int16 *)(*(void *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
                                + 2 * *(unsigned __int16 *)(v21 + 2 * *(unsigned __int16 *)(v21 + 66) + 328)
                                + 16);
      __int16 v27 = *(_WORD *)(v26 + 4);
      if ((v27 & 4) != 0)
      {
        if (*(unsigned char *)(v25 + 68))
        {
          if ((v27 & 2) == 0) {
            *(void *)(v25 + 72) = v26 + *(unsigned __int16 *)(v26 + 6) + 8;
          }
        }
        else
        {
          mdb_xcursor_init1(v21, v26);
          uint64_t result = mdb_cursor_first(*(void *)(v21 + 16), 0, 0);
          if (result) {
            break;
          }
        }
      }
      int64_t v22 = (unsigned char *)(*(void *)(v21 + 16) + 68);
      int v28 = 8;
LABEL_45:
      *(_DWORD *)v22 |= v28;
LABEL_46:
      uint64_t v18 = *(void *)v18;
      if (!v18) {
        goto LABEL_47;
      }
    }
  }
  unint64_t v16 = (_DWORD *)(*(void *)(a1 + 24) + 124);
LABEL_22:
  int v17 = 2;
LABEL_48:
  *v16 |= v17;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 22;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514;
    }
    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) != 0) {
        size_t v8 = 888;
      }
      else {
        size_t v8 = 392;
      }
      uint64_t v9 = malloc_type_malloc(v8, 0xBC8215E7uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        mdb_cursor_init((uint64_t)v9, a1, a2, (uint64_t)(v9 + 98));
        uint64_t v11 = *(void *)(a1 + 104);
        if (v11)
        {
          *(void *)uint64_t v10 = *(void *)(v11 + 8 * a2);
          *(void *)(v11 + 8 * a2) = v10;
          v10[17] |= 0x40u;
        }
        uint64_t result = 0;
        *a3 = v10;
      }
      else
      {
        return 12;
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(unsigned char *)(*(void *)(a1 + 112) + v4) & 8) == 0
      || (*(unsigned char *)(a2 + 68) & 0x40) != 0
      || *(void *)(a1 + 104))
    {
      return 22;
    }
    else if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514;
    }
    else
    {
      mdb_cursor_init(a2, a1, v4, *(void *)(a2 + 16));
      return 0;
    }
  }
  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (!v3) {
      return 4294936512;
    }
    if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
      return 4294936514;
    }
    int v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0) {
      return 22;
    }
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
        unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }
      unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2 * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(unsigned char *)(v3 + 68) & 1) == 0) {
            return 22;
          }
          uint64_t v8 = *(void *)(v3 + 424);
        }
        else
        {
          uint64_t v8 = 1;
        }
        uint64_t v2 = 0;
        *a2 = v8;
        return v2;
      }
    }
    return 4294936498;
  }
  return v2;
}

void mdb_cursor_close(void *a1)
{
  if (a1 && !*((void *)a1 + 1))
  {
    if ((*((unsigned char *)a1 + 68) & 0x40) != 0)
    {
      uint64_t v1 = *(void *)(*((void *)a1 + 3) + 104);
      if (v1)
      {
        uint64_t v2 = (void *)(v1 + 8 * *((unsigned int *)a1 + 8));
        do
        {
          uint64_t v3 = v2;
          uint64_t v2 = (void *)*v2;
          if (v2) {
            BOOL v4 = v2 == a1;
          }
          else {
            BOOL v4 = 1;
          }
        }
        while (!v4);
        if (v2 == a1) {
          void *v3 = *(void *)a1;
        }
      }
    }
    free(a1);
  }
}

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, void *a3, long long *a4)
{
  uint64_t v4 = 22;
  if (!a1 || !a3) {
    return v4;
  }
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  int v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) == 0) {
    a4 = 0;
  }
  return mdb_del0(a1, a2, a3, a4, 0);
}

uint64_t mdb_del0(uint64_t a1, unsigned int a2, void *a3, long long *a4, int a5)
{
  memset(v17, 0, 392);
  memset(v16, 0, sizeof(v16));
  long long v15 = 0uLL;
  int v14 = 0;
  mdb_cursor_init((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    long long v15 = *a4;
    uint64_t v10 = &v15;
    int v11 = 2;
  }
  else
  {
    uint64_t v10 = 0;
    a5 |= 0x20u;
    int v11 = 15;
  }
  uint64_t result = mdb_cursor_set((uint64_t)v17, a3, v10, v11, &v14);
  if (!result)
  {
    uint64_t v13 = *(void *)(a1 + 104);
    v17[0] = *(void *)(v13 + 8 * a2);
    *(void *)(v13 + 8 * a2) = v17;
    uint64_t result = mdb_cursor_del((uint64_t)v17, a5);
    *(void *)(*(void *)(a1 + 104) + 8 * a2) = v17[0];
  }
  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v15 = 0;
          memset(v14, 0, sizeof(v14));
          memset(v13, 0, sizeof(v13));
          if ((a5 & 0xFFF8FFCF) == 0 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            int v10 = *(_DWORD *)(a1 + 124);
            if ((v10 & 0x20013) != 0)
            {
              if ((v10 & 0x20000) != 0) {
                return 13;
              }
              else {
                return 4294936514;
              }
            }
            else
            {
              uint64_t v11 = a2;
              mdb_cursor_init((uint64_t)v14, a1, a2, (uint64_t)v13);
              uint64_t v12 = *(void *)(a1 + 104);
              *(void *)&v14[0] = *(void *)(v12 + 8 * v11);
              *(void *)(v12 + 8 * v11) = v14;
              uint64_t result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
              *(void *)(*(void *)(a1 + 104) + 8 * v11) = *(void *)&v14[0];
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  if ((a3 & 0xFFFBFF81) != 0) {
    return 22;
  }
  if ((*(unsigned char *)(a1 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      uint64_t v17 = *(void *)(a1 + 88);
      int v18 = *(unsigned __int16 *)(v17 + 52);
      int v19 = a3 & 0x7FFF | v18;
      if (v19 != v18)
      {
        *(_WORD *)(v17 + 52) = v19;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }
    mdb_default_cmp(a1, 1u);
    return 0;
  }
  if (!*(void *)(*(void *)(a1 + 80) + 64)) {
    mdb_default_cmp(a1, 1u);
  }
  uint64_t v69 = 0;
  unint64_t v70 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  size_t v10 = strlen(__s);
  uint64_t v11 = *(unsigned int *)(a1 + 120);
  if (v11 < 3) {
    goto LABEL_20;
  }
  unsigned int v12 = 0;
  uint64_t v13 = (const char **)(*(void *)(a1 + 80) + 104);
  for (uint64_t i = 2; i != v11; ++i)
  {
    uint64_t v15 = (uint64_t)*(v13 - 1);
    if (v15)
    {
      if (v10 == v15 && !strncmp(__s, *v13, v10))
      {
        uint64_t v4 = 0;
        *a4 = i;
        return v4;
      }
    }
    else if (!v12)
    {
      unsigned int v12 = i;
    }
    v13 += 6;
  }
  if (v12)
  {
    int v16 = 0;
  }
  else
  {
LABEL_20:
    if (v11 >= *(_DWORD *)(*(void *)(a1 + 32) + 36)) {
      return 4294936505;
    }
    unsigned int v12 = 0;
    int v16 = 1;
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 52) & 0xC) == 0)
  {
    int v59 = 0;
    v71[0] = v10;
    v71[1] = (size_t)__s;
    mdb_cursor_init((uint64_t)&v63, a1, 1u, 0);
    uint64_t v20 = mdb_cursor_set((uint64_t)&v63, v71, &v69, 15, &v59);
    if (v20 == -30798)
    {
      if ((a3 & 0x40000) == 0) {
        return 4294936498;
      }
      if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
        return 13;
      }
      uint64_t v29 = strdup(__s);
      if (v29)
      {
        int64_t v22 = v29;
        uint64_t v69 = 48;
        unint64_t v70 = &v60;
        long long v60 = 0u;
        long long v61 = 0u;
        *(void *)&long long v62 = 0;
        *((void *)&v62 + 1) = -1;
        WORD2(v60) = a3 & 0x7FFF;
        uint64_t v58 = 0;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v30 = *(void *)(*((void *)&v64 + 1) + 104);
        uint64_t v31 = v65;
        unint64_t v32 = &v63;
        if ((BYTE4(v67[0]) & 4) != 0)
        {
          DWORD1(v38) = 1;
          *(void *)&long long v35 = &v63;
          unint64_t v32 = &v34;
        }
        *(void *)unint64_t v32 = *(void *)(v30 + 8 * v65);
        *(void *)(v30 + 8 * v31) = v32;
        uint64_t v33 = mdb_cursor_put((uint64_t)&v63, v71, (uint64_t)&v69, 2);
        *(void *)(v30 + 8 * v31) = *(void *)v32;
        if (v33)
        {
          uint64_t v4 = v33;
          free(v22);
          return v4;
        }
        char v23 = 29;
        if (!v16)
        {
LABEL_38:
          unsigned int v24 = (size_t *)(*(void *)(a1 + 80) + 48 * v12);
          *unsigned int v24 = v10;
          v24[1] = (size_t)v22;
          v24[4] = 0;
          *(unsigned char *)(*(void *)(a1 + 112) + v12) = v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 152);
          LODWORD(v24) = *(_DWORD *)(v25 + 4 * v12) + 1;
          *(_DWORD *)(v25 + 4 * v12) = v24;
          *(_DWORD *)(*(void *)(a1 + 96) + 4 * v12) = v24;
          uint64_t v26 = (_OWORD *)(*(void *)(a1 + 88) + 48 * v12);
          long long v27 = *v70;
          long long v28 = v70[2];
          v26[1] = v70[1];
          v26[2] = v28;
          _OWORD *v26 = v27;
          *a4 = v12;
          mdb_default_cmp(a1, v12);
          if (v16)
          {
            uint64_t v4 = 0;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }
          return 0;
        }
LABEL_37:
        unsigned int v12 = *(_DWORD *)(a1 + 120);
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v4 = v20;
      if (v20) {
        return v4;
      }
      if ((*(_WORD *)(*((void *)v67 + WORD1(v67[0]) + 1)
                     + *(unsigned __int16 *)(*((void *)v67 + WORD1(v67[0]) + 1)
                                           + 2 * *((unsigned __int16 *)&v67[16] + WORD1(v67[0]) + 4)
                                           + 16)
                     + 4) & 6) != 2)
        return 4294936512;
      uint64_t v21 = strdup(__s);
      if (v21)
      {
        int64_t v22 = v21;
        char v23 = 28;
        if (!v16) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    return 12;
  }
  if ((a3 & 0x40000) != 0) {
    return 4294936512;
  }
  else {
    return 4294936498;
  }
}

uint64_t mdb_default_cmp(uint64_t result, unsigned int a2)
{
  __int16 v2 = *(_WORD *)(*(void *)(result + 88) + 48 * a2 + 4);
  uint64_t v3 = mdb_cmp_cint;
  if ((v2 & 8) == 0) {
    uint64_t v3 = mdb_cmp_memn;
  }
  if ((v2 & 2) != 0) {
    uint64_t v3 = mdb_cmp_memnr;
  }
  uint64_t v4 = *(void *)(result + 80);
  *(void *)(v4 + 48 * a2 + 16) = v3;
  if ((v2 & 4) != 0)
  {
    if ((v2 & 0x20) != 0)
    {
      BOOL v6 = (v2 & 0x10) == 0;
      uint64_t v5 = mdb_cmp_int;
      unsigned int v7 = mdb_cmp_cint;
    }
    else
    {
      BOOL v6 = (v2 & 0x40) == 0;
      uint64_t v5 = mdb_cmp_memnr;
      unsigned int v7 = mdb_cmp_memn;
    }
    if (v6) {
      uint64_t v5 = v7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)(v4 + 48 * a2 + 24) = v5;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    uint64_t v2 = *(void *)(a1 + 136);
    uint64_t v3 = *(void **)(v2 + 48 * a2 + 8);
    if (v3)
    {
      uint64_t v4 = (void *)(v2 + 48 * a2);
      *uint64_t v4 = 0;
      v4[1] = 0;
      uint64_t v5 = *(void *)(a1 + 152);
      *(_WORD *)(*(void *)(a1 + 144) + 2 * a2) = 0;
      ++*(_DWORD *)(v5 + 4 * a2);
      free(v3);
    }
  }
}

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *a3 = *(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = 22;
  if (a1)
  {
    if (a3 <= 1 && *(_DWORD *)(a1 + 120) > a2)
    {
      unsigned int v12 = 0;
      if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 126) & 2) != 0)
        {
          return 13;
        }
        else if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * a2) == *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152) {
                                                                            + 4 * a2))
        }
        {
          uint64_t v3 = mdb_cursor_open(a1, a2, &v12);
          if (!v3)
          {
            uint64_t v7 = mdb_drop0((uint64_t)v12, *(_WORD *)(v12[5] + 4) & 4);
            uint64_t v3 = v7;
            for (uint64_t i = *(uint64_t **)(*(void *)(a1 + 104) + 8 * a2); i; uint64_t i = (uint64_t *)*i)
              *((_DWORD *)i + 17) &= 0xFFFFFFFC;
            if (v7) {
              goto LABEL_20;
            }
            if (a2 >= 2 && a3)
            {
              uint64_t v3 = mdb_del0(a1, 1u, (void *)v12[6], 0, 2);
              if (!v3)
              {
                *(unsigned char *)(*(void *)(a1 + 112) + a2) = 2;
                mdb_dbi_close(*(void *)(a1 + 32), a2);
                goto LABEL_20;
              }
              int v9 = *(_DWORD *)(a1 + 124) | 2;
            }
            else
            {
              uint64_t v3 = 0;
              *(unsigned char *)(*(void *)(a1 + 112) + a2) |= 1u;
              uint64_t v10 = *(void *)(a1 + 88) + 48 * a2;
              *(_WORD *)(v10 + 38) = 0;
              *(_OWORD *)(v10 + 22) = 0u;
              *(_OWORD *)(v10 + 6) = 0u;
              *(void *)(v10 + 40) = -1;
              int v9 = *(_DWORD *)(a1 + 124) | 4;
            }
            *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
            mdb_cursor_close(v12);
          }
        }
        else
        {
          return 4294936516;
        }
      }
    }
  }
  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 40) = a3;
  return result;
}

uint64_t mdb_reader_pid(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = a3;
  long long v11 = xmmword_1828F1510;
  WORD6(v11) = 3;
  for (int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    uint64_t result = *__error();
    if (result != 4) {
      return result;
    }
    uint64_t v10 = v5;
    long long v11 = xmmword_1828F1510;
    WORD6(v11) = 3;
  }
  int v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

void mdb_dpage_free(uint64_t a1, void *a2)
{
  if ((*((_WORD *)a2 + 5) & 4) != 0 && *((_DWORD *)a2 + 3) != 1)
  {
    free(a2);
  }
  else
  {
    *a2 = *(void *)(a1 + 192);
    *(void *)(a1 + 192) = a2;
  }
}

uint64_t mdb_page_search(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(v4 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  if ((**(unsigned char **)(a1 + 56) & 2) == 0) {
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (*(_DWORD *)(*(void *)(v4 + 96) + 4 * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 152)
                                                                                         + 4
                                                                                         * *(unsigned int *)(a1 + 32)))
    return 4294936516;
  mdb_cursor_init((uint64_t)v17, v4, 1u, 0);
  uint64_t result = mdb_page_search(v17, *(void *)(a1 + 48), 0);
  if (!result)
  {
    uint64_t v15 = 0;
    int v16 = 0;
    int v14 = 0;
    uint64_t v10 = mdb_node_search((uint64_t)v17, *(void **)(a1 + 48), &v14);
    if (!v14) {
      return 4294936498;
    }
    if ((*((_WORD *)v10 + 2) & 6) != 2) {
      return 4294936512;
    }
    uint64_t result = mdb_node_read((uint64_t)v17, (unsigned int *)v10, &v15);
    if (result) {
      return result;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2)) {
      return 4294936512;
    }
    long long v12 = *v16;
    long long v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)uint64_t v11 = v12;
    **(unsigned char **)(a1 + 56) &= ~2u;
LABEL_5:
    unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v8 != -1)
    {
      int v9 = *(void **)(a1 + 72);
      if (v9 && *v9 == v8 || (uint64_t result = mdb_page_get(a1, v8, (unint64_t *)(a1 + 72), 0), !result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (uint64_t result = mdb_page_touch(a1), !result))
        {
          if ((a3 & 2) != 0) {
            return 0;
          }
          else {
            return mdb_page_search_root(a1, a2, a3);
          }
        }
      }
      return result;
    }
    return 4294936498;
  }
  return result;
}

char *mdb_node_search(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(unsigned __int16 **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unsigned int v6 = v5[6] - 16;
  unsigned int v7 = v6 >> 1;
  unsigned int v8 = v5[5];
  unsigned int v9 = ((v8 >> 1) & 1) == 0;
  int v10 = (v6 >> 1) - 1;
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))(*(void *)(a1 + 48) + 16);
  if (v11 == mdb_cmp_cint)
  {
    if (v8)
    {
      if (*(unsigned __int16 *)((char *)v5 + v5[9] + 6) == 8) {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))mdb_cmp_long;
      }
      else {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))mdb_cmp_int;
      }
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v11 = mdb_cmp_cint;
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
  }
  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      int v19 = v5[6] - 16;
      long long v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v10 + v9) >> 1;
        int v14 = (char *)v5 + v5[v13 + 8];
        uint64_t v20 = *((unsigned __int16 *)v14 + 3);
        uint64_t v21 = (uint64_t)(v14 + 8);
        int v15 = v11(a2, (uint64_t)&v20);
        if (!v15) {
          break;
        }
        if (v15 <= 0) {
          int v10 = v13 - 1;
        }
        else {
          unsigned int v9 = v13 + 1;
        }
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }
      int v16 = 1;
      a3 = v12;
LABEL_43:
      unsigned int v6 = v19;
      if (!a3) {
        goto LABEL_36;
      }
LABEL_33:
      if (v6 <= 1) {
        int v16 = 0;
      }
      *a3 = v16;
      goto LABEL_36;
    }
    LODWORD(v13) = 0;
    int v14 = 0;
LABEL_32:
    int v16 = 1;
    if (!a3) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  uint64_t v20 = **(unsigned int **)(a1 + 40);
  int v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }
  int v19 = v6;
  uint64_t v18 = a3;
  do
  {
    uint64_t v13 = ((int)(v10 + v9) >> 1);
    uint64_t v21 = (uint64_t)v5 + v20 * v13 + 16;
    int v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      int v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }
    if (v15 <= 0) {
      int v10 = v13 - 1;
    }
    else {
      unsigned int v9 = v13 + 1;
    }
  }
  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  unsigned int v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    int v16 = 0;
    if (a3) {
      goto LABEL_33;
    }
  }
  else
  {
    int v16 = 0;
    int v14 = (char *)v5 + v5[v13 + 8];
    if (a3) {
      goto LABEL_33;
    }
  }
LABEL_36:
  *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  if (v13 >= v7) {
    return 0;
  }
  else {
    return v14;
  }
}

uint64_t mdb_page_touch(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  __dst = 0;
  uint64_t v3 = *(void *)(a1 + 24);
  __int16 v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(unsigned char *)(v3 + 124) & 8) != 0)
    {
      uint64_t result = mdb_page_unspill(*(void *)(a1 + 24), v2, (char **)&__dst);
      if (result) {
        goto LABEL_15;
      }
      unsigned int v7 = (char *)__dst;
      if (__dst)
      {
LABEL_20:
        uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v17 + 72) = v7;
        uint64_t v18 = *(uint64_t **)(*(void *)(v3 + 104) + 8 * *(unsigned int *)(a1 + 32));
        if ((*(unsigned char *)(a1 + 68) & 4) != 0)
        {
          if (v18)
          {
            unsigned int v26 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              uint64_t v27 = v18[2];
              if (*(unsigned __int16 *)(v27 + 64) >= v26)
              {
                uint64_t v28 = v27 + 8 * v17;
                uint64_t v30 = *(void *)(v28 + 72);
                uint64_t v29 = (char **)(v28 + 72);
                if (v30 == v2) {
                  *uint64_t v29 = v7;
                }
              }
              uint64_t v18 = (uint64_t *)*v18;
            }
            while (v18);
          }
        }
        else if (v18)
        {
          unsigned int v19 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v18 != (uint64_t *)a1 && *((unsigned __int16 *)v18 + 32) >= v19)
            {
              uint64_t v20 = &v18[v17];
              uint64_t v22 = v20[9];
              uint64_t v21 = (char **)(v20 + 9);
              if (v22 == v2)
              {
                char *v21 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  uint64_t v23 = v18[2];
                  if (v23)
                  {
                    if (*(unsigned char *)(v23 + 68))
                    {
                      uint64_t v24 = *((unsigned __int16 *)v18 + v17 + 164);
                      if (v24 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        uint64_t v25 = &v7[*(unsigned __int16 *)&v7[2 * v24 + 16]];
                        if ((*((_WORD *)v25 + 2) & 6) == 4) {
                          *(void *)(v23 + 72) = &v25[*((unsigned __int16 *)v25 + 3) + 8];
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v18 = (uint64_t *)*v18;
          }
          while (v18);
        }
        return 0;
      }
    }
    uint64_t v5 = (uint64_t **)(v3 + 40);
    uint64_t result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!result)
    {
      uint64_t result = mdb_page_alloc(a1, 1, (char **)&__dst);
      if (!result)
      {
        unsigned int v7 = (char *)__dst;
        unint64_t v8 = *(void *)__dst;
        unsigned int v9 = *v5;
        uint64_t v10 = **v5 + 1;
        *unsigned int v9 = v10;
        v9[v10] = *(void *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          unsigned int v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
          uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 2 * *(unsigned __int16 *)(a1 + 2 * v11 + 328) + 16);
          *(_DWORD *)uint64_t v13 = v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }
        else
        {
          *(void *)(*(void *)(a1 + 40) + 40) = v8;
        }
        goto LABEL_18;
      }
    }
LABEL_15:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  uint64_t result = 0;
  if ((v4 & 0x40) == 0 && *(void *)v3)
  {
    int v14 = *(unsigned int **)(v3 + 72);
    unint64_t v8 = *(void *)v2;
    if (*(void *)v14)
    {
      unsigned int v15 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(void *)v2);
      if (*(void *)v14 >= (unint64_t)v15 && *(void *)&v14[4 * v15] == v8)
      {
        if (v2 != *(void *)&v14[4 * v15 + 2])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936517;
        }
        return 0;
      }
    }
    int v16 = mdb_page_malloc(v3, 1u);
    if (v16)
    {
      unsigned int v7 = v16;
      v31[0] = v8;
      v31[1] = (unint64_t)v16;
      mdb_mid2l_insert(v14, v31);
LABEL_18:
      mdb_page_copy(v7, (_WORD *)v2, *(_DWORD *)(*(void *)(v3 + 32) + 16));
      *(void *)unsigned int v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }
    return 12;
  }
  return result;
}

uint64_t mdb_page_search_root(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
  unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
  unint64_t v14 = v5;
  __int16 v6 = *(_WORD *)(v5 + 10);
  if (v6)
  {
    int v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(unsigned char *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
            unint64_t v14 = v5;
            if (a3) {
              goto LABEL_16;
            }
            goto LABEL_18;
          }
        }
        else
        {
          LOWORD(v10) = 0;
        }
      }
      else
      {
        int v13 = 0;
        if (mdb_node_search(a1, a2, &v13)) {
          LOWORD(v10) = *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
        }
        else {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
        }
      }
      unsigned int v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2 * (unsigned __int16)v10 + 16));
      uint64_t result = mdb_page_get(a1, *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0);
      if (result) {
        return result;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
        return 4294936509;
      }
      unint64_t v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(void *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if (a3)
      {
LABEL_16:
        uint64_t result = mdb_page_touch(a1);
        if (result) {
          return result;
        }
        unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
        unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
        unint64_t v14 = v5;
      }
LABEL_18:
      __int16 v6 = *(_WORD *)(v5 + 10);
    }
    while ((v6 & 1) != 0);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

void *mdb_page_copy(char *__dst, _WORD *__src, int a3)
{
  unint64_t v4 = __src;
  unint64_t v5 = __dst;
  unsigned __int16 v6 = __src[7];
  int v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    size_t v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }
  else
  {
    uint64_t v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    size_t v9 = (a3 - v8);
  }

  return memcpy(__dst, __src, v9);
}

uint64_t mdb_env_reader_dest(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  uint64_t result = getpid();
  if (v2 == result) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t mdb_pages_xkeep(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v27 = 0;
  int v26 = 0;
  unsigned int v6 = *(_DWORD *)(v5 + 120);
  uint64_t v7 = a1;
  unsigned int v8 = v6;
  do
  {
LABEL_2:
    if (*(unsigned char *)(v7 + 68))
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *(unsigned __int16 *)(v12 + 64);
        if (*(_WORD *)(v12 + 64))
        {
          uint64_t v14 = 0;
          do
          {
            uint64_t v15 = *(void *)(v12 + 72 + 8 * v14);
            __int16 v16 = *(_WORD *)(v15 + 10);
            if ((v16 & 0xC050) == a2) {
              *(_WORD *)(v15 + 10) = v16 ^ 0x8000;
            }
            ++v14;
          }
          while (v13 != v14);
          unsigned int v17 = v14 - 1;
        }
        else
        {
          uint64_t v15 = 0;
          unsigned int v17 = -1;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        if (!v18) {
          break;
        }
        if (!v15) {
          break;
        }
        if ((*(_DWORD *)(v18 + 68) & 1) == 0) {
          break;
        }
        if ((*(_WORD *)(v15 + 10) & 2) == 0) {
          break;
        }
        __int16 v19 = *(_WORD *)(v15 + *(unsigned __int16 *)(v15 + 2 * *(unsigned __int16 *)(v12 + 2 * v17 + 328) + 16) + 4);
        uint64_t v12 = *(void *)(v12 + 16);
      }
      while ((v19 & 2) != 0);
    }
    uint64_t v7 = *(void *)v7;
    if (v7) {
      BOOL v9 = v7 == a1;
    }
    else {
      BOOL v9 = 1;
    }
  }
  while (!v9);
  uint64_t v10 = 8 * v8 - 8;
  while (v10 != -8)
  {
    uint64_t v7 = *(void *)(*(void *)(v5 + 104) + v10);
    v10 -= 8;
    --v8;
    if (v7) {
      BOOL v11 = v7 == a1;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      goto LABEL_2;
    }
  }
  uint64_t result = 0;
  if (a3 && v6)
  {
    unint64_t v21 = 0;
    uint64_t v22 = 40;
    do
    {
      if (*(unsigned char *)(*(void *)(v5 + 112) + v21))
      {
        unint64_t v23 = *(void *)(*(void *)(v5 + 88) + v22);
        if (v23 != -1)
        {
          uint64_t result = mdb_page_get(a1, v23, &v27, &v26);
          if (result) {
            return result;
          }
          __int16 v24 = *(_WORD *)(v27 + 10);
          if ((v24 & 0xC050) == a2 && v26 <= 1) {
            *(_WORD *)(v27 + 10) = v24 ^ 0x8000;
          }
        }
      }
      ++v21;
      v22 += 48;
    }
    while (v21 < *(unsigned int *)(v5 + 120));
    return 0;
  }
  return result;
}

unint64_t mdb_find_oldest(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t result = *(void *)(a1 + 24) - 1;
  uint64_t v3 = *(void *)(v1 + 64);
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(v3 + 16);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = v3 + 192;
      unint64_t v6 = v4 + 1;
      do
      {
        uint64_t v7 = v5 + ((unint64_t)(v6 - 2) << 6);
        if (*(_DWORD *)(v7 + 8))
        {
          unint64_t v8 = *(void *)v7;
          if (result >= v8) {
            unint64_t result = v8;
          }
        }
        --v6;
      }
      while (v6 > 1);
    }
  }
  return result;
}

uint64_t mdb_rebalance(uint64_t a1)
{
  uint64_t v121 = 0;
  memset(v120, 0, sizeof(v120));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  int v2 = (unint64_t *)(a1 + 72);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if (v4[5]) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  if (v4[5]) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 250;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = (*(_DWORD *)(*(void *)(v7 + 32) + 16) - 16);
  __int16 v9 = v4[7];
  int v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    mdb_cursor_copy(a1, (uint64_t)&v116);
    int v20 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    int v21 = *(unsigned __int16 *)(a1 + 328 + 2 * (v3 - 1));
    *(void *)&long long v117 = 0;
    uint64_t v22 = (unsigned __int16 *)&v120[16] + (v3 - 1) + 4;
    unsigned __int16 v23 = *v22;
    __int16 v24 = (void *)(a1 + 8 * (v3 - 1) + 72);
    if (v21)
    {
      unsigned __int16 v25 = v23 - 1;
      unsigned __int16 *v22 = v25;
      int v26 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v25 + 16));
      uint64_t updated = mdb_page_get(a1, *v26 | ((unint64_t)*((unsigned __int16 *)v26 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if (updated) {
        return updated;
      }
      uint64_t v27 = WORD1(v120[0]);
      uint64_t v28 = *((void *)v120 + WORD1(v120[0]) + 1);
      unsigned int v29 = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }
    else
    {
      unsigned __int16 v30 = v23 + 1;
      unsigned __int16 *v22 = v30;
      uint64_t v31 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v30 + 16));
      uint64_t updated = mdb_page_get(a1, *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if (updated) {
        return updated;
      }
      LOWORD(v29) = 0;
      uint64_t v27 = WORD1(v120[0]);
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = 0;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                   + 131056) >> 1;
      uint64_t v28 = *((void *)v120 + v27 + 1);
    }
    unint64_t v32 = (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16) - 16);
    __int16 v33 = *(_WORD *)(v28 + 14);
    int v34 = *(unsigned __int16 *)(v28 + 12);
    if (1000 * (unint64_t)(v32 - (unsigned __int16)(v33 - v34)) / v32 < v6
      || v5 >= (v34 - 16) >> 1)
    {
      if (v21)
      {
        long long v45 = &v116;
        *((_WORD *)&v120[16] + v27 + 4) = *(_WORD *)(a1 + 2 * v27 + 328) + v29 + 1;
        uint64_t v171 = 0;
        long long v170 = 0u;
        long long v169 = 0u;
        v20 += (v34 + 131056) >> 1;
        long long v168 = 0u;
        long long v167 = 0u;
        long long v166 = 0u;
        long long v165 = 0u;
        long long v164 = 0u;
        long long v163 = 0u;
        long long v162 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v147 = 0u;
        uint64_t v46 = *(void *)(*((void *)&v117 + 1) + 104);
        uint64_t v47 = v118;
        if ((BYTE4(v120[0]) & 4) != 0)
        {
          DWORD1(v151) = 1;
          *(void *)&long long v148 = &v116;
          long long v45 = &v147;
        }
        *(void *)long long v45 = *(void *)(v46 + 8 * v118);
        *(void *)(v46 + 8 * v47) = v45;
        uint64_t updated = mdb_page_merge(a1, (uint64_t)&v116);
        *(void *)(v46 + 8 * v47) = *(void *)v45;
        mdb_cursor_copy((uint64_t)&v116, a1);
      }
      else
      {
        uint64_t updated = mdb_page_merge((uint64_t)&v116, a1);
      }
      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }
    uint64_t updated = mdb_page_touch((uint64_t)&v116);
    if (updated) {
      goto LABEL_117;
    }
    uint64_t updated = mdb_page_touch(a1);
    if (updated) {
      goto LABEL_117;
    }
    unint64_t v174 = 0;
    uint64_t v175 = 0;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v171 = 0;
    uint64_t v35 = *((void *)v120 + WORD1(v120[0]) + 1);
    __int16 v36 = *(_WORD *)(v35 + 10);
    if ((v36 & 0x20) != 0)
    {
      size_t v56 = 0;
      LODWORD(v39) = 0;
      unint64_t v57 = v35
          + *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4)
          * (unint64_t)**((_DWORD **)&v118 + 1)
          + 16;
      unint64_t v174 = **((_DWORD **)&v118 + 1);
      uint64_t v175 = (unsigned int *)v57;
      size_t v172 = 0;
      uint64_t v173 = 0;
    }
    else
    {
      long long v37 = (unsigned int *)(v35
                           + *(unsigned __int16 *)(v35 + 2 * *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4) + 16));
      uint64_t v38 = *v37;
      uint64_t v39 = *((unsigned __int16 *)v37 + 2);
      if ((v36 & 1) == 0 || *((_WORD *)&v120[16] + WORD1(v120[0]) + 4))
      {
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
        unint64_t v174 = v58;
        uint64_t v175 = v37 + 2;
      }
      else
      {
        __int16 v40 = v120[0];
        uint64_t updated = mdb_page_search_lowest((uint64_t)&v116);
        if (updated) {
          goto LABEL_117;
        }
        uint64_t v41 = *((void *)v120 + WORD1(v120[0]) + 1);
        if ((*(_WORD *)(v41 + 10) & 0x20) != 0)
        {
          unint64_t v43 = **((_DWORD **)&v118 + 1);
          long long v44 = (unsigned int *)(v41 + 16);
        }
        else
        {
          uint64_t v42 = v41 + *(unsigned __int16 *)(v41 + 16);
          unint64_t v43 = *(unsigned __int16 *)(v42 + 6);
          long long v44 = (unsigned int *)(v42 + 8);
        }
        unint64_t v174 = v43;
        uint64_t v175 = v44;
        LOWORD(v120[0]) = v40;
        WORD1(v120[0]) = v40 - 1;
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
      }
      size_t v56 = v38 | (v39 << 32);
      size_t v172 = *v37;
      uint64_t v173 = (uint64_t)v37 + v58 + 8;
    }
    *(void *)&long long v148 = 0;
    uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(void *)(a1 + 8 * v59 + 72) + 10) & 1) != 0 && !*(_WORD *)(a1 + 2 * v59 + 328))
    {
      int v77 = *(unsigned __int16 *)(a1 + 64);
      long long v122 = 0uLL;
      mdb_cursor_copy(a1, (uint64_t)&v147);
      uint64_t v78 = mdb_page_search_lowest((uint64_t)&v147);
      if (v78)
      {
        uint64_t updated = v78;
        goto LABEL_117;
      }
      uint64_t v104 = *((void *)&v151 + WORD1(v151) + 1);
      if ((*(_WORD *)(v104 + 10) & 0x20) != 0)
      {
        uint64_t v106 = **((_DWORD **)&v149 + 1);
        uint64_t v107 = v104 + 16;
      }
      else
      {
        uint64_t v105 = v104 + *(unsigned __int16 *)(v104 + 16);
        uint64_t v106 = *(unsigned __int16 *)(v105 + 6);
        uint64_t v107 = v105 + 8;
      }
      *(void *)&long long v122 = v106;
      *((void *)&v122 + 1) = v107;
      LOWORD(v151) = v77;
      WORD1(v151) = v77 - 1;
      *((_WORD *)&v167 + (v77 - 1) + 4) = 0;
      uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v122);
      if (updated)
      {
LABEL_117:
        if (v21) {
          LOWORD(v20) = v20 + 1;
        }
LABEL_119:
        *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20;
        return updated;
      }
      uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    }
    uint64_t updated = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v59 + 328), (const void **)&v174, &v172, v56, v39);
    if (!updated)
    {
      mdb_node_del(&v116, v174);
      uint64_t v60 = *((void *)v120 + WORD1(v120[0]) + 1);
      if (v21)
      {
        long long v61 = *(long long **)(*(void *)(*((void *)&v117 + 1) + 104) + 8 * v118);
        if (v61)
        {
          uint64_t v62 = *(void *)(a1 + 8 * WORD1(v120[0]) + 72);
          char v63 = BYTE4(v120[0]);
          do
          {
            long long v64 = v61;
            if ((v63 & 4) != 0) {
              long long v64 = (long long *)*((void *)v61 + 2);
            }
            if ((*((unsigned char *)v64 + 68) & 1) != 0 && *((unsigned __int16 *)v64 + 33) >= WORD1(v120[0]))
            {
              if (v64 != (long long *)a1 && *((void *)v64 + WORD1(v120[0]) + 9) == v62)
              {
                long long v65 = (char *)v64 + 2 * WORD1(v120[0]);
                unsigned int v66 = *((unsigned __int16 *)v65 + 164);
                if (v66 >= *(unsigned __int16 *)(a1 + 2 * WORD1(v120[0]) + 328)) {
                  *((_WORD *)v65 + 164) = v66 + 1;
                }
              }
              if (v64 != &v116)
              {
                uint64_t v67 = (void *)v64 + WORD1(v120[0]);
                uint64_t v69 = v67[9];
                uint64_t v68 = v67 + 9;
                if (v69 == v60)
                {
                  unint64_t v70 = (char *)v64 + 2 * WORD1(v120[0]);
                  if (*((unsigned __int16 *)v70 + 164) == *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4))
                  {
                    __int16 v71 = v70 + 328;
                    uint64_t v72 = *(unsigned __int16 *)(a1 + 66);
                    *uint64_t v68 = *(void *)(a1 + 8 * v72 + 72);
                    *__int16 v71 = *(_WORD *)(a1 + 2 * v72 + 328);
                    ++*((_WORD *)v64 + WORD1(v120[0]) + 163);
                  }
                }
              }
              if ((*(_WORD *)(v60 + 10) & 2) != 0)
              {
                uint64_t v73 = *((void *)v64 + 2);
                if (v73)
                {
                  if (*(unsigned char *)(v73 + 68))
                  {
                    uint64_t v74 = *((void *)v64 + WORD1(v120[0]) + 9);
                    uint64_t v75 = *((unsigned __int16 *)v64 + WORD1(v120[0]) + 164);
                    if (v75 < (*(unsigned __int16 *)(v74 + 12) - 16) >> 1)
                    {
                      uint64_t v76 = v74 + *(unsigned __int16 *)(v74 + 2 * v75 + 16);
                      if ((*(_WORD *)(v76 + 4) & 6) == 4) {
                        *(void *)(v73 + 72) = v76 + *(unsigned __int16 *)(v76 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            long long v61 = *(long long **)v61;
          }
          while (v61);
        }
      }
      else
      {
        uint64_t v79 = *(long long **)(*(void *)(*((void *)&v117 + 1) + 104) + 8 * v118);
        if (v79)
        {
          char v80 = BYTE4(v120[0]);
          do
          {
            int v81 = v79;
            if ((v80 & 4) != 0) {
              int v81 = (long long *)*((void *)v79 + 2);
            }
            if (v81 != &v116
              && (*((unsigned char *)v81 + 68) & 1) != 0
              && *((unsigned __int16 *)v81 + 33) >= WORD1(v120[0]))
            {
              uint64_t v82 = (void *)v81 + WORD1(v120[0]);
              uint64_t v84 = v82[9];
              int v83 = v82 + 9;
              if (v84 == v60)
              {
                uint64_t v85 = (__int16 *)v81 + WORD1(v120[0]) + 164;
                __int16 v86 = *v85;
                if (!*v85)
                {
                  uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
                  *int v83 = *(void *)(a1 + 8 * v87 + 72);
                  *uint64_t v85 = *(_WORD *)(a1 + 2 * v87 + 328);
                  uint64_t v85 = (__int16 *)v81 + WORD1(v120[0]) + 163;
                  __int16 v86 = *v85;
                }
                *uint64_t v85 = v86 - 1;
                if ((*(_WORD *)(v60 + 10) & 2) != 0)
                {
                  uint64_t v88 = *((void *)v81 + 2);
                  if (v88)
                  {
                    if (*(unsigned char *)(v88 + 68))
                    {
                      uint64_t v89 = *((void *)v81 + WORD1(v120[0]) + 9);
                      uint64_t v90 = *((unsigned __int16 *)v81 + WORD1(v120[0]) + 164);
                      if (v90 < (*(unsigned __int16 *)(v89 + 12) - 16) >> 1)
                      {
                        uint64_t v91 = v89 + *(unsigned __int16 *)(v89 + 2 * v90 + 16);
                        if ((*(_WORD *)(v91 + 4) & 6) == 4) {
                          *(void *)(v88 + 72) = v91 + *(unsigned __int16 *)(v91 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v79 = *(long long **)v79;
          }
          while (v79);
        }
      }
      uint64_t v92 = WORD1(v120[0]);
      uint64_t v93 = (char *)&v116 + 2 * WORD1(v120[0]);
      if (!*((_WORD *)v93 + 164))
      {
        if (*((_WORD *)v93 + 163))
        {
          uint64_t v97 = *((void *)v120 + WORD1(v120[0]) + 1);
          if ((*(_WORD *)(v97 + 10) & 0x20) != 0)
          {
            size_t v99 = (unsigned int *)(v97 + 16);
          }
          else
          {
            uint64_t v98 = v97 + *(unsigned __int16 *)(v97 + 16);
            unint64_t v174 = *(unsigned __int16 *)(v98 + 6);
            size_t v99 = (unsigned int *)(v98 + 8);
          }
          uint64_t v175 = v99;
          unsigned int v108 = &v147;
          mdb_cursor_copy((uint64_t)&v116, (uint64_t)&v147);
          LOWORD(v151) = v151 - 1;
          --WORD1(v151);
          uint64_t v146 = 0;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          uint64_t v109 = *(void *)(*((void *)&v148 + 1) + 104);
          uint64_t v110 = v149;
          if ((BYTE4(v151) & 4) != 0)
          {
            DWORD1(v126) = 1;
            *(void *)&long long v123 = &v147;
            unsigned int v108 = &v122;
          }
          *(void *)unsigned int v108 = *(void *)(v109 + 8 * v149);
          *(void *)(v109 + 8 * v110) = v108;
          uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
          *(void *)(v109 + 8 * v110) = *(void *)v108;
          if (updated) {
            goto LABEL_117;
          }
          uint64_t v92 = WORD1(v120[0]);
        }
        if (*(_WORD *)(*((void *)v120 + v92 + 1) + 10))
        {
          __int16 v111 = *((_WORD *)&v120[16] + v92 + 4);
          long long v122 = 0uLL;
          *((_WORD *)&v120[16] + v92 + 4) = 0;
          mdb_update_key((uint64_t)&v116, (uint64_t)&v122);
          LODWORD(v92) = WORD1(v120[0]);
          *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = v111;
        }
      }
      uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v95 = a1 + 2 * v94;
      if (*(_WORD *)(v95 + 328)) {
        goto LABEL_116;
      }
      if (*(_WORD *)(v95 + 326))
      {
        __int16 v100 = *(_WORD *)(*((void *)v120 + v92 + 1) + 10);
        uint64_t v101 = *(void *)(a1 + 8 * v94 + 72);
        if ((v100 & 0x20) != 0)
        {
          size_t v103 = (unsigned int *)(v101 + 16);
        }
        else
        {
          uint64_t v102 = v101 + *(unsigned __int16 *)(v101 + 16);
          unint64_t v174 = *(unsigned __int16 *)(v102 + 6);
          size_t v103 = (unsigned int *)(v102 + 8);
        }
        uint64_t v175 = v103;
        int v112 = &v147;
        mdb_cursor_copy(a1, (uint64_t)&v147);
        LOWORD(v151) = v151 - 1;
        --WORD1(v151);
        uint64_t v146 = 0;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        uint64_t v113 = *(void *)(*((void *)&v148 + 1) + 104);
        uint64_t v114 = v149;
        if ((BYTE4(v151) & 4) != 0)
        {
          DWORD1(v126) = 1;
          *(void *)&long long v123 = &v147;
          int v112 = &v122;
        }
        *(void *)int v112 = *(void *)(v113 + 8 * v149);
        *(void *)(v113 + 8 * v114) = v112;
        uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
        *(void *)(v113 + 8 * v114) = *(void *)v112;
        if (updated) {
          goto LABEL_117;
        }
        uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      }
      if ((*(_WORD *)(*(void *)(a1 + 8 * v94 + 72) + 10) & 1) == 0)
      {
LABEL_116:
        uint64_t updated = 0;
      }
      else
      {
        __int16 v115 = *(_WORD *)(a1 + 328 + 2 * v94);
        long long v122 = 0uLL;
        *(_WORD *)(a1 + 328 + 2 * v94) = 0;
        mdb_update_key(a1, (uint64_t)&v122);
        uint64_t updated = 0;
        *(_WORD *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)) = v115;
      }
    }
    goto LABEL_117;
  }
  unint64_t v11 = *v2;
  __int16 v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0) {
    return 0;
  }
  unsigned int v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(void *)(v14 + 40) = -1;
    *(_WORD *)(v14 + 6) = 0;
    *(void *)(v14 + 16) = 0;
    uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
    if (updated) {
      return updated;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    unsigned int v17 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        uint64_t v18 = v17;
        if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
          uint64_t v18 = (void *)v17[2];
        }
        int v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }
        uint64_t updated = 0;
        unsigned int v17 = (void *)*v17;
      }
      while (v17);
      return updated;
    }
    return 0;
  }
  uint64_t updated = 0;
  if ((v12 & 1) == 0) {
    return updated;
  }
  if ((v13 & 0xFFFFFFFE) != 2) {
    return updated;
  }
  uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
  if (updated) {
    return updated;
  }
  unint64_t v48 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(void *)(*(void *)(a1 + 40) + 40) = v48;
  uint64_t updated = mdb_page_get(a1, v48, v2, 0);
  if (updated) {
    return updated;
  }
  uint64_t v49 = *(void *)(a1 + 40);
  --*(_WORD *)(v49 + 6);
  --*(void *)(v49 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v49 + 6) >= 2u)
  {
    uint64_t v50 = 0;
    do
    {
      *(void *)(a1 + 8 * v50 + 80) = *(void *)(a1 + 8 * v50 + 88);
      *(_WORD *)(a1 + 2 * v50 + 330) = *(_WORD *)(a1 + 2 * v50 + 332);
      unint64_t v51 = v50 + 2;
      ++v50;
    }
    while (v51 < *(unsigned __int16 *)(v49 + 6));
  }
  long long v52 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
  if (!v52) {
    return 0;
  }
  int v53 = *(_DWORD *)(a1 + 68);
  do
  {
    long long v54 = v52;
    if ((v53 & 4) != 0) {
      long long v54 = (void *)v52[2];
    }
    if (v54 != (void *)a1 && (*((unsigned char *)v54 + 68) & 1) != 0 && v54[9] == v11)
    {
      if (*(_WORD *)(v49 + 6))
      {
        unint64_t v55 = 0;
        do
        {
          v54[v55 + 9] = v54[v55 + 10];
          *((_WORD *)v54 + v55 + 164) = *((_WORD *)v54 + v55 + 165);
          uint64_t v49 = *(void *)(a1 + 40);
          ++v55;
        }
        while (v55 < *(unsigned __int16 *)(v49 + 6));
      }
      --*((_WORD *)v54 + 32);
      --*((_WORD *)v54 + 33);
    }
    uint64_t updated = 0;
    long long v52 = (void *)*v52;
  }
  while (v52);
  return updated;
}

uint64_t mdb_cursor_copy(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    unint64_t v2 = 0;
    uint64_t v3 = result + 328;
    uint64_t v4 = a2 + 328;
    do
    {
      __int16 v5 = *(_WORD *)(v3 + 2 * v2);
      *(void *)(v4 + 8 * v2 - 256) = *(void *)(v3 + 8 * v2 - 256);
      *(_WORD *)(v4 + 2 * v2++) = v5;
    }
    while (v2 < *(unsigned __int16 *)(result + 64));
  }
  return result;
}

uint64_t mdb_page_merge(uint64_t a1, uint64_t a2)
{
  size_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v4 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_touch(a2);
  if (result) {
    return result;
  }
  unint64_t v53 = 0;
  long long v54 = 0;
  uint64_t v6 = *(void *)(a2 + 8 * *(unsigned __int16 *)(a2 + 66) + 72);
  unsigned int v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(unsigned char *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      unsigned __int16 v8 = 0;
      unsigned int v9 = v7 >> 1;
      do
      {
        int v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2 * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          uint64_t v50 = 0;
          memset(v49, 0, sizeof(v49));
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          mdb_cursor_copy(a1, (uint64_t)&v45);
          *(void *)&long long v46 = 0;
          uint64_t result = mdb_page_search_lowest((uint64_t)&v45);
          if (result) {
            return result;
          }
          uint64_t v12 = *((void *)v49 + WORD1(v49[0]) + 1);
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            unint64_t v53 = **((_DWORD **)&v47 + 1);
            uint64_t v14 = (unsigned int *)(v12 + 16);
          }
          else
          {
            uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            unint64_t v53 = *(unsigned __int16 *)(v13 + 6);
            uint64_t v14 = (unsigned int *)(v13 + 8);
          }
          long long v54 = v14;
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
        }
        else
        {
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
          unint64_t v53 = v11;
          long long v54 = v10 + 2;
        }
        size_t v51 = *v10;
        uint64_t v52 = (uint64_t)v10 + v11 + 8;
        uint64_t result = mdb_node_add(a2, (unsigned __int16)v9, (const void **)&v53, &v51, v51 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), *((unsigned __int16 *)v10 + 2));
        if (result) {
          return result;
        }
        ++v8;
        LOWORD(v9) = v9 + 1;
      }
      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }
LABEL_21:
    --*(_WORD *)(a1 + 66);
    mdb_node_del((void *)a1, 0);
    uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v17 + 328))
    {
      unint64_t v53 = 0;
      uint64_t result = mdb_update_key(a1, (uint64_t)&v53);
      LOWORD(v17) = *(_WORD *)(a1 + 66);
      if (result)
      {
        *(_WORD *)(a1 + 66) = v17 + 1;
        return result;
      }
    }
    unsigned __int16 v18 = v17 + 1;
    *(_WORD *)(a1 + 66) = v18;
    uint64_t v19 = *(void *)(a1 + 8 * v18 + 72);
    unint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(a1 + 24);
    __int16 v22 = *(_WORD *)(v19 + 10);
    if ((v22 & 0x10) != 0 && *(_DWORD *)(a1 + 32))
    {
      if (!*(void *)v21)
      {
LABEL_35:
        *(void *)(v19 + 48) = *(void *)(v21 + 48);
        *(void *)(v21 + 48) = v19;
        ++*(_DWORD *)(v21 + 56);
        __int16 v25 = v22 | 0x4000;
        *(_WORD *)(v19 + 10) = v25;
LABEL_36:
        BOOL v26 = (v25 & 2) == 0;
        uint64_t v27 = 16;
        if (v26) {
          uint64_t v27 = 8;
        }
        --*(void *)(*(void *)(a1 + 40) + v27);
        uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
          int v30 = *(_DWORD *)(a1 + 68);
          uint64_t v31 = (v29 - 1);
          do
          {
            unint64_t v32 = v28;
            if ((v30 & 4) != 0) {
              unint64_t v32 = (void *)v28[2];
            }
            if (v32 != (void *)a1 && *((unsigned __int16 *)v32 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              __int16 v33 = &v32[v29];
              uint64_t v36 = v33[9];
              uint64_t v35 = v33 + 9;
              uint64_t v34 = v36;
              if (v36 == v19)
              {
                void *v35 = v6;
                *((_WORD *)v32 + v29 + 164) += v7 >> 1;
                *((_WORD *)v32 + v31 + 164) = *(_WORD *)(a2 + 2 * v31 + 328);
                uint64_t v34 = v6;
              }
              else if (v32[v31 + 9] == *(void *)(a1 + 8 * v31 + 72))
              {
                long long v37 = (char *)v32 + 2 * v31;
                unsigned int v38 = *((unsigned __int16 *)v37 + 164);
                if (v38 > *(unsigned __int16 *)(a1 + 2 * v31 + 328)) {
                  *((_WORD *)v37 + 164) = v38 - 1;
                }
              }
              if ((*(_WORD *)(v19 + 10) & 2) != 0)
              {
                uint64_t v39 = v32[2];
                if (v39)
                {
                  if (*(unsigned char *)(v39 + 68))
                  {
                    uint64_t v40 = *((unsigned __int16 *)v32 + v29 + 164);
                    if (v40 < (*(unsigned __int16 *)(v34 + 12) - 16) >> 1)
                    {
                      uint64_t v41 = v34 + *(unsigned __int16 *)(v34 + 2 * v40 + 16);
                      if ((*(_WORD *)(v41 + 4) & 6) == 4) {
                        *(void *)(v39 + 72) = v41 + *(unsigned __int16 *)(v41 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            uint64_t v28 = (void *)*v28;
          }
          while (v28);
        }
        __int16 v42 = *(_WORD *)(a2 + 64);
        __int16 v43 = *(_WORD *)(*(void *)(a2 + 40) + 6);
        if (v42)
        {
          *(_WORD *)(a2 + 64) = v42 - 1;
          if (v42 == 1) {
            *(_DWORD *)(a2 + 68) &= ~1u;
          }
          else {
            --*(_WORD *)(a2 + 66);
          }
        }
        uint64_t result = mdb_rebalance(a2);
        __int16 v44 = *(_WORD *)(*(void *)(a2 + 40) + 6) - v43 + v42;
        *(_WORD *)(a2 + 64) = v44;
        *(_WORD *)(a2 + 66) = v44 - 1;
        return result;
      }
      unsigned __int16 v23 = *(void **)(v21 + 72);
      if (*v23)
      {
        unsigned int v24 = mdb_mid2l_search(*(unsigned int **)(v21 + 72), *(void *)v19);
        if (*v23 >= (unint64_t)v24 && v23[2 * v24] == v20)
        {
          if (v23[2 * v24 + 1] != v19)
          {
            *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
            *(_DWORD *)(v21 + 124) |= 2u;
            return 4294936517;
          }
          __int16 v22 = *(_WORD *)(v19 + 10);
          goto LABEL_35;
        }
      }
    }
    uint64_t result = mdb_midl_append((unint64_t **)(v21 + 40), v20);
    if (result) {
      return result;
    }
    __int16 v25 = *(_WORD *)(v19 + 10);
    goto LABEL_36;
  }
  unint64_t v53 = **(unsigned int **)(a1 + 40);
  long long v54 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10) {
    goto LABEL_21;
  }
  int v15 = 0;
  unsigned int v16 = v7 >> 1;
  while (1)
  {
    uint64_t result = mdb_node_add(a2, (unsigned __int16)v16, (const void **)&v53, 0, 0, 0);
    if (result) {
      return result;
    }
    long long v54 = (unsigned int *)((char *)v54 + v53);
    ++v15;
    LOWORD(v16) = v16 + 1;
    if ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 <= (unsigned __int16)v15) {
      goto LABEL_21;
    }
  }
}

uint64_t mdb_page_search_lowest(uint64_t a1)
{
  unint64_t v5 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_get(a1, *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32), &v5, 0);
  if (!result)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    uint64_t v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 < 0x20)
    {
      unint64_t v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(void *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return mdb_page_search_root(a1, 0, 4);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
      return 4294936509;
    }
  }
  return result;
}

uint64_t mdb_cmp_memnr(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = v2 + *a1;
  uint64_t v4 = *a1 - *a2;
  unint64_t v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *a1 - *a2;
  }
  unsigned int v7 = (unsigned __int8 *)(*a2 + a2[1] - 1);
  while (v3 > v5)
  {
    int v9 = *(unsigned __int8 *)--v3;
    int v8 = v9;
    int v10 = *v7--;
    uint64_t result = (v8 - v10);
    if (v8 != v10) {
      return result;
    }
  }
  if (v6 < 0) {
    return -1;
  }
  else {
    return v6;
  }
}

uint64_t mdb_cmp_memn(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = (const void *)a1[1];
  uint64_t v5 = *a2;
  uint64_t v4 = (const void *)a2[1];
  int v7 = v3 - v5;
  BOOL v6 = v3 <= v5;
  if (v3 < v5) {
    int v7 = -1;
  }
  if (v3 > v5) {
    LODWORD(v3) = v5;
  }
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  LODWORD(result) = memcmp(v2, v4, v3);
  if (result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 <= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

void *mdb_midl_alloc(int a1)
{
  unsigned int v2 = malloc_type_malloc(8 * (a1 + 2), 0x100004000313F17uLL);
  if (!v2) {
    return 0;
  }
  v2[1] = 0;
  int v3 = v2 + 1;
  void *v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1) {
    free((void *)(a1 - 8));
  }
}

void *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (void *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    uint64_t result = malloc_type_realloc(result, 0x100008uLL, 0x100004000313F17uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }
  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  int v3 = *a1;
  unint64_t v4 = (*v3 + a2);
  unint64_t v6 = *((void *)v3 - 1);
  uint64_t v5 = v3 - 2;
  if (v6 >= v4) {
    return 0;
  }
  uint64_t v7 = (v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  unsigned int v8 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
  if (!v8) {
    return 12;
  }
  int v9 = v8;
  uint64_t result = 0;
  *int v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  int v3 = *a1;
  unint64_t v4 = **a1;
  if (v4 >= *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, 0x1FFFF)) {
      return 12;
    }
    int v3 = *a1;
    unint64_t v4 = **a1;
  }
  uint64_t result = 0;
  unint64_t v7 = v4 + 1;
  unint64_t *v3 = v7;
  v3[v7] = a2;
  return result;
}

uint64_t mdb_midl_grow(void *a1, int a2)
{
  unint64_t v4 = malloc_type_realloc((void *)(*a1 - 8), 8 * (*(void *)(*a1 - 8) + a2) + 16, 0x100004000313F17uLL);
  if (!v4) {
    return 12;
  }
  uint64_t v5 = v4;
  uint64_t result = 0;
  *v5 += a2;
  *a1 = v5 + 1;
  return result;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = **a1;
  uint64_t v5 = *a2;
  if (v5 + v4 >= (unint64_t)*(*a1 - 1))
  {
    if (mdb_midl_grow(a1, v5)) {
      return 12;
    }
    int v3 = *a1;
    uint64_t v4 = **a1;
    uint64_t v5 = *a2;
  }
  memcpy(&v3[v4 + 1], a2 + 1, 8 * v5);
  uint64_t result = 0;
  *v3 += *a2;
  return result;
}

uint64_t mdb_midl_append_range(uint64_t **a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = **a1;
  unint64_t v7 = v6 + a3;
  if (v7 > *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, a3 | 0x1FFFF)) {
      return 12;
    }
    uint64_t v5 = *a1;
  }
  *uint64_t v5 = v7;
  if (a3)
  {
    uint64_t v10 = a3;
    int64_t v11 = &v5[v6];
    do
      v11[v10--] = a2++;
    while (v10);
  }
  return 0;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *result;
  uint64_t v4 = *result + *a2;
  *uint64_t result = -1;
  if (v2)
  {
    unint64_t v5 = result[v3];
    uint64_t v6 = v4;
    do
    {
      unint64_t v7 = a2[v2];
      if (v5 >= v7)
      {
        uint64_t v9 = v3;
        uint64_t v8 = v6;
      }
      else
      {
        do
        {
          uint64_t v8 = v6 - 1;
          result[v6] = v5;
          uint64_t v9 = v3 - 1;
          unint64_t v5 = result[v3 - 1];
          --v6;
          --v3;
        }
        while (v5 < v7);
      }
      uint64_t v6 = v8 - 1;
      result[v8] = v7;
      uint64_t v3 = v9;
      --v2;
    }
    while (v2);
  }
  *uint64_t result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  LODWORD(v1) = 0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    uint64_t v4 = (int)v3 + 1;
    while (v2 - (int)v3 > 7)
    {
      int v5 = (v2 + (int)v3) >> 1;
      unint64_t v6 = *(void *)&result[2 * v5];
      *(void *)&result[2 * v5] = *(void *)&result[2 * v4];
      *(void *)&result[2 * v4] = v6;
      unint64_t v7 = *(void *)&result[2 * (int)v3];
      unint64_t v8 = *(void *)&result[2 * v2];
      if (v7 < v8)
      {
        *(void *)&result[2 * (int)v3] = v8;
        *(void *)&result[2 * v2] = v7;
        unint64_t v6 = *(void *)&result[2 * v4];
        unint64_t v8 = v7;
      }
      if (v6 < v8)
      {
        *(void *)&result[2 * v4] = v8;
        *(void *)&result[2 * v2] = v6;
        unint64_t v6 = *(void *)&result[2 * v4];
      }
      unint64_t v9 = *(void *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(void *)&result[2 * (int)v3] = v6;
        *(void *)&result[2 * v4] = v9;
        unint64_t v6 = v9;
      }
      int v10 = v3 + 1;
      int v11 = v2;
      while (1)
      {
        uint64_t v12 = &result[2 * v10 + 2];
        do
        {
          unint64_t v14 = *(void *)v12;
          v12 += 2;
          unint64_t v13 = v14;
          ++v10;
        }
        while (v14 > v6);
        int v15 = &result[2 * v11];
        do
        {
          unint64_t v17 = *((void *)v15 - 1);
          v15 -= 2;
          unint64_t v16 = v17;
          --v11;
        }
        while (v17 < v6);
        if (v11 + 1 <= v10) {
          break;
        }
        *((void *)v12 - 1) = v16;
        *(void *)int v15 = v13;
      }
      *(void *)&result[2 * v4] = v16;
      *(void *)int v15 = v6;
      uint64_t v18 = (int)v1;
      uint64_t v1 = (int)v1 + 2;
      if (v2 - v10 + 1 < v11 - (int)v3)
      {
        v23[(int)v1] = v11 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v10;
        goto LABEL_2;
      }
      v23[v1] = v2;
      v23[v18 + 1] = v10;
      int v2 = v11 - 1;
    }
    if (v2 > (int)v3)
    {
      uint64_t v3 = (int)v3;
      do
      {
        uint64_t v19 = v3++;
        unint64_t v20 = *(void *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            unint64_t v21 = *(void *)&result[2 * v19];
            if (v21 >= v20) {
              break;
            }
            *(void *)&result[2 * (v19 + 1)] = v21;
            BOOL v22 = __OFSUB__(v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | (v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }
        *(void *)&result[2 * (int)v19 + 2] = v20;
      }
      while (v3 != v2);
    }
    if (v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      int v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }
    return result;
  }
}

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 >= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

__n128 mdb_mid2l_insert(unsigned int *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  unsigned int v5 = mdb_mid2l_search(a1, *a2);
  if (v5)
  {
    unint64_t v7 = *(void *)a1;
    if ((*(void *)a1 < (unint64_t)v5 || *(void *)&a1[4 * v5] != v4) && v7 <= 0x1FFFE)
    {
      unsigned int v8 = v7 + 1;
      *(void *)a1 = v7 + 1;
      if (v5 < (int)v7 + 1)
      {
        unint64_t v9 = &a1[4 * v7 + 4];
        int v10 = &a1[4 * v7];
        do
        {
          long long v11 = *(_OWORD *)v10;
          v10 -= 4;
          *(_OWORD *)unint64_t v9 = v11;
          v9 -= 4;
          --v8;
        }
        while (v5 < v8);
      }
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)&a1[4 * v5] = *(_OWORD *)a2;
    }
  }
  return result;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    uint64_t v2 = *a1 + 1;
    *a1 = v2;
    __n128 result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }
  return result;
}

void MTLArchiveUsageDB::store(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "mdb_put error: %s", buf, 0xCu);
}

void MTLArchiveUsageDB::prune(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "mdb_cursor_open error: %s", buf, 0xCu);
}

void MultiLevelCacheBase::initialize()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The primary shader cache is null. No shaders will be cached. This should not occur on a live system.", v0, 2u);
}

void makeShaderCacheWritableByAllUsers_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void setShaderCacheMainFolder_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x20u);
}

void MTLCompilerFSCache::openSync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1826F6000, MEMORY[0x1E4F14500], a3, "fscache_open returned a NULL pointer but no error.", a5, a6, a7, a8, 0);
}

void MTLCompilerFSCache::copyShaderCache(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Path set to copy Metal shader cache (%s) is not a directory", buf, 0xCu);
}

{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Path set to copy Metal shader cache (%s) does not exist", buf, 0xCu);
}

void MTLCompilerFSCache::copyShaderCache(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to create %s directory in shader cache at location: %s", buf, 0x16u);
}

void MTLCompilerFSCache::flushElement(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  os_log_type_t v2 = "flushElement";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "@ %s(): fscache_element_get_data() failed with error = %d\n", (uint8_t *)&v1, 0x12u);
}

void MTLPipelineDataCache::open(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_1826F6000, log, OS_LOG_TYPE_ERROR, "Mapping the pipeline data cache failed, errno %d", buf, 8u);
}

{
  int v3;

  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_1826F6000, log, OS_LOG_TYPE_ERROR, "fstat failed for the pipeline data cache, errno %d", buf, 8u);
}

void MTLPipelineDataCache::parseDataFileHeader()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1826F6000, v0, v1, "The pipeline data cache is empty", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1826F6000, v0, v1, "The pipeline data cache has an invalid data section", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1826F6000, v0, v1, "The pipeline data cache has an invalid number of entries", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1826F6000, v0, v1, "The pipeline data cache is not valid for the given system", v2, v3, v4, v5, v6);
}

uint64_t MTLPipelineDataCache::parseDataFileHeader(uint64_t a1, unsigned __int8 *a2)
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1826F6000, v3, v4, "The pipeline data cache has an invalid entry", v5, v6, v7, v8, v10);
  return *a2 >> 7;
}

void getCacheMainFolder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_1826F6000, MEMORY[0x1E4F14500], a3, "Failed to get cache main folder: caches directory path was nil", a5, a6, a7, a8, 0);
}

void getCacheMainFolder()
{
  __error();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0xCu);
}

void getCacheMainFolder(uint64_t a1, const char *a2)
{
  __error();
  strnlen(a2, 0x400uLL);
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v3, v4, v5, v6, v7, 0x22u);
}

uint64_t std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void _MTLCompilerWarningLog(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "localizedDescription"), "description"), "UTF8String");
  _os_log_error_impl(&dword_1826F6000, a2, OS_LOG_TYPE_ERROR, "Warning: %s", (uint8_t *)&v3, 0xCu);
}

void _MTLAddCompileLibraryPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _MTLAddCompileDynamicLibraryPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _MTLAddCompileBinaryFunctionPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initProgressTracking]::$_1 &&>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_1826F6000, MEMORY[0x1E4F14500], a3, "[NSBundle bundleWithIdentifier:@\"com.apple.Metal\"] failed", a5, a6, a7, a8, 0);
}

void ___ZN21XPCCompilerConnection24DispatchLogReplayRequestEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectb_block_invoke_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "MTLCompilerService: log replay resulted in %u error", (uint8_t *)v1, 8u);
}

void XPCCompilerConnection::checkConnectionActive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

float XPCCompilerConnection::checkConnectionActive(double a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float v1 = a1;
  v3[0] = 67109376;
  v3[1] = 10;
  __int16 v4 = 2048;
  double v5 = v1;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "MTLCompiler: failed to ping the compiler service %u times over %f ms", (uint8_t *)v3, 0x12u);
  return result;
}

void XPCCompilerConnection::checkConnectionActive(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MTLCompiler: Compiler encountered XPC_ERROR_CONNECTION_INVALID: %s (is the OS shutting down?)", (uint8_t *)&v1, 0xCu);
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 96) + 1;
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2080;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MTLCompiler: Compilation failed with XPC_ERROR_CONNECTION_INVALID on %d try: %s (is the OS shutting down?)", (uint8_t *)v3, 0x12u);
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN28MonolithicCompilerConnection24DispatchLogReplayRequestEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObject_block_invoke_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "MTLCompilerService log replay resulted in %u error", (uint8_t *)v1, 8u);
}

void MTLCompilerConnectionManagerPrivate::buildRequest(int a1, std::__shared_weak_count **a2)
{
  _Block_object_dispose(a2, 8);
  uint64_t v3 = a2[7];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void CompilerPluginInterface::CompilerPluginInterface(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to dlopen MTLCompiler framework with error: %s", (uint8_t *)&v1, 0xCu);
}

void __MTLCreateSimulatorDevice_block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "could not open MTLSimDriver!", v0, 2u);
}

void __MTLCreateSimulatorDevice_block_invoke_cold_2()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "could not find symbol MTLCreateSimulatorDevice", v0, 2u);
}

void MTLVersionedDB::openDB(int a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "db version mismatch: file %u, current %u", (uint8_t *)v2, 0xEu);
}

void MTLVersionedDB::openDB(char *a1, void *a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*a1 >= 0) {
    __int16 v3 = a2;
  }
  else {
    __int16 v3 = (void *)*a2;
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = mdb_strerror(a3);
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "mdb_env_open(\"%s\") error: %s", (uint8_t *)&v4, 0x16u);
}

void MTLVersionedDB::openDB(int a1)
{
  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "mdb_env_create error: %s", v2, v3, v4, v5, 2u);
}

void MTLVersionedDB::MTLVersionedDB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MTLVersionedDB::MTLVersionedDB()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Database invalid - resetting", v0, 2u);
}

void MTLVersionedDB::Transaction::Transaction(int a1)
{
  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "mdb_dbi_open error: %s", v2, v3, v4, v5, 2u);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "mdb_txn_begin error: %s", v2, v3, v4, v5, 2u);
}

void MTLVersionedDB::Transaction::~Transaction(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "mdb_txn_commit error: %s", buf, 0xCu);
}

void MTLArchiveMapDB::store(char *a1, void *a2, uint64_t *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = (uint64_t *)*a3;
  }
  int v5 = 136315394;
  __int16 v6 = v3;
  __int16 v7 = 2080;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "storeArchive('%s', '%s') invalid payload", (uint8_t *)&v5, 0x16u);
}

void MTLLibraryDataWithArchive::parseDynamicHeaderSection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MTLLibraryDataWithArchive::getFunctionAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLLibraryBuilder18newLibraryWithFileEPU19objcproto9MTLDevice11objc_objectP8NSStringPP7NSError_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to open metal library with error: %s", (uint8_t *)&v1, 0xCu);
}

void MTLCompilerMachORequest::CreateMachOFile(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot open mach-O (%s) with error:%i", (uint8_t *)&v3, 0x12u);
}

void SerializedLibraryInfo::deserializeStringArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t std::shared_ptr<MTLCompilerCache>::shared_ptr[abi:ne180100]<MTLCompilerCache,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<pixelFormatTypeMap(void)::$_0 &&>>(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 9) < 0) {
      operator delete(*(void **)(a1 - 32));
    }
    if (*(char *)(a1 - 41) < 0) {
      operator delete(*(void **)(a1 - 64));
    }
    a1 -= 64;
  }
  while (a1 != a2);
}

void MTLFailureTypeGetErrorModeType_cold_1()
{
}

void MTLFailureTypeSetErrorModeType_cold_1()
{
}

void MTLReportFailure_cold_1(void *a1, const char *a2, int a3)
{
}

void MTLGetEnvCase<MTLErrorModeType>(const char *a1, const char ***a2, const char ***a3)
{
  __int16 v5 = (FILE **)MEMORY[0x1E4F143C8];
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "Invalid option for %s, valid options are:\n", a1);
  int v6 = *a2;
  uint64_t v7 = *a3;
  while (v6 != v7)
  {
    uint64_t v8 = *v6;
    v6 += 2;
    fprintf(*v5, "\t%s\n", v8);
  }
  __assert_rtn("MTLGetEnvCase", "MTLUtils_Internal.h", 65, "0");
}

void MTLIOAccelCommandBufferStorageGrowSegmentList_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0xCu);
}

void MTLIOAccelCommandBufferStorageGrowSegmentList_cold_2()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x22u);
}

void MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x28u);
}

void MTLIOAccelCommandBufferStorageAllocResourceAtIndex_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x12u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x1F40D77C0]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

uint64_t FPCommandBufferCommitted()
{
  return MEMORY[0x1F4119F10]();
}

uint64_t FPCommandBufferCompleted()
{
  return MEMORY[0x1F4119F18]();
}

uint64_t FPCommandBufferCreated()
{
  return MEMORY[0x1F4119F20]();
}

uint64_t FPCommandBufferScheduled()
{
  return MEMORY[0x1F4119F28]();
}

uint64_t IOAccelCommandQueueCreateWithQoS()
{
  return MEMORY[0x1F4124848]();
}

uint64_t IOAccelCommandQueueGetGlobalTraceObjectID()
{
  return MEMORY[0x1F4124850]();
}

uint64_t IOAccelCommandQueueRelease()
{
  return MEMORY[0x1F4124858]();
}

uint64_t IOAccelCommandQueueSetDispatchQueue()
{
  return MEMORY[0x1F4124860]();
}

uint64_t IOAccelCommandQueueSetPriorityAndBackground()
{
  return MEMORY[0x1F4124868]();
}

uint64_t IOAccelCommandQueueSubmitCommandBuffers()
{
  return MEMORY[0x1F4124870]();
}

uint64_t IOAccelDeviceCreateWithAPIProperty()
{
  return MEMORY[0x1F4124878]();
}

uint64_t IOAccelDeviceGetConfig64()
{
  return MEMORY[0x1F4124880]();
}

uint64_t IOAccelDeviceGetGlobalTraceObjectID()
{
  return MEMORY[0x1F4124888]();
}

uint64_t IOAccelDeviceGetMaxResourceSize()
{
  return MEMORY[0x1F4124890]();
}

uint64_t IOAccelDeviceGetNextGlobalTraceID()
{
  return MEMORY[0x1F4124898]();
}

uint64_t IOAccelDeviceGetSharedMemorySize()
{
  return MEMORY[0x1F41248A0]();
}

uint64_t IOAccelDeviceTraceEvent()
{
  return MEMORY[0x1F41248A8]();
}

uint64_t IOAccelDeviceTraceObjectLabel()
{
  return MEMORY[0x1F41248B0]();
}

uint64_t IOAccelInitCommPage()
{
  return MEMORY[0x1F41248B8]();
}

uint64_t IOAccelResourceCreate()
{
  return MEMORY[0x1F41248D0]();
}

uint64_t IOAccelResourceCreateAllocationIdentifierSet()
{
  return MEMORY[0x1F41248D8]();
}

uint64_t IOAccelResourceGetClientShared()
{
  return MEMORY[0x1F41248E8]();
}

uint64_t IOAccelResourceGetDataBytes()
{
  return MEMORY[0x1F41248F0]();
}

uint64_t IOAccelResourceGetGPUVirtualAddress()
{
  return MEMORY[0x1F41248F8]();
}

uint64_t IOAccelResourceGetGlobalTraceObjectID()
{
  return MEMORY[0x1F4124900]();
}

uint64_t IOAccelResourceGetResidentDataSize()
{
  return MEMORY[0x1F4124910]();
}

uint64_t IOAccelResourceListAddResource()
{
  return MEMORY[0x1F4124918]();
}

uint64_t IOAccelResourceListDestroy()
{
  return MEMORY[0x1F4124920]();
}

uint64_t IOAccelResourceListInit()
{
  return MEMORY[0x1F4124928]();
}

uint64_t IOAccelResourceListReset()
{
  return MEMORY[0x1F4124930]();
}

uint64_t IOAccelResourceRelease()
{
  return MEMORY[0x1F4124938]();
}

uint64_t IOAccelResourceSetPurgeable()
{
  return MEMORY[0x1F4124940]();
}

uint64_t IOAccelResourceTestEvent()
{
  return MEMORY[0x1F4124948]();
}

uint64_t IOAccelSharedAllocateFenceMemory()
{
  return MEMORY[0x1F4124950]();
}

uint64_t IOAccelSharedCreate()
{
  return MEMORY[0x1F4124958]();
}

uint64_t IOAccelSharedCreateDeviceShmem()
{
  return MEMORY[0x1F4124960]();
}

uint64_t IOAccelSharedDestroyDeviceShmem()
{
  return MEMORY[0x1F4124968]();
}

uint64_t IOAccelSharedGetAllocatedSize()
{
  return MEMORY[0x1F4124970]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1F40E8F68](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E92E0](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9318](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9398](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9408](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9558](*(void *)&port);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1F40E95D8](buffer, *(void *)&newState, oldState);
}

uint64_t IOSurfaceSharedEventAddEventListener()
{
  return MEMORY[0x1F40E9600]();
}

uint64_t IOSurfaceSharedEventNotifyEventListener()
{
  return MEMORY[0x1F40E9610]();
}

uint64_t IOSurfaceSharedEventRemoveEventListener()
{
  return MEMORY[0x1F40E9618]();
}

uint64_t MTLGPUCompilerHashFunctionScript()
{
  return MEMORY[0x1F411A488]();
}

uint64_t MTLGPUCompilerTimeStamp()
{
  return MEMORY[0x1F411A490]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _CFXPreferencesRegisterDefaultValues()
{
  return MEMORY[0x1F40D9470]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t flatbuffers::GenerateText()
{
  return MEMORY[0x1F4180848]();
}

uint64_t flatbuffers::Parser::Deserialize(flatbuffers::Parser *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F4180860](this, a2);
}

uint64_t flatbuffers::Parser::Parse(flatbuffers::Parser *this, const char *a2, const char **a3, const char *a4)
{
  return MEMORY[0x1F4180868](this, a2, a3, a4);
}

std::string::size_type std::string::copy(const std::string *this, std::string::value_type *__s, std::string::size_type __n, std::string::size_type __pos)
{
  return MEMORY[0x1F417E370](this, __s, __n, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return MEMORY[0x1F417E428]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5E0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E678](this, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
}

uint64_t std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>()
{
  return MEMORY[0x1F417EC78]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1F417EE98](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int asprintf_l(char **a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1F40CA448](a1, a2, a3);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1F40CB388]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA30](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA38](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x1F40CBDC0](__path);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fprintf_l(FILE *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1F40CC1E0](a1, a2, a3);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

uint64_t fscache_close()
{
  return MEMORY[0x1F40F4688]();
}

uint64_t fscache_element_get_data()
{
  return MEMORY[0x1F40F4690]();
}

uint64_t fscache_find_and_retain()
{
  return MEMORY[0x1F40F4698]();
}

uint64_t fscache_get_cache_keys()
{
  return MEMORY[0x1F40F46A0]();
}

uint64_t fscache_insert_and_retain()
{
  return MEMORY[0x1F40F46A8]();
}

uint64_t fscache_open_with_key()
{
  return MEMORY[0x1F40F46B0]();
}

uint64_t fscache_release()
{
  return MEMORY[0x1F40F46B8]();
}

uint64_t fscache_remove_all()
{
  return MEMORY[0x1F40F46C0]();
}

uint64_t fscache_remove_and_release()
{
  return MEMORY[0x1F40F46C8]();
}

uint64_t fscache_sync_element()
{
  return MEMORY[0x1F40F46D0]();
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1F40CC398](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1F40CC708]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE78](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return MEMORY[0x1F40CDA48](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAB8](a1, *(void *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1F40CDB80](*(void *)&a1, a2, a3);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

int sigwait(const sigset_t *a1, int *a2)
{
  return MEMORY[0x1F40CE050](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1E8](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

void uuid_generate(uuid_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1F40CEB98]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

uint64_t xpc_connection_kill()
{
  return MEMORY[0x1F40CEC28]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_instance()
{
  return MEMORY[0x1F40CECA8]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1F40CF0B8](*(void *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1F40CF1C0]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1F40CF1C8]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a2) {
    *a2 = 9;
  }
  if (a3) {
    *a3 = 70;
  }
  return "LMDB 0.9.70: (December 19, 2015)";
}

uint64_t mdb_env_share_locks(uint64_t a1, int *a2)
{
  *(void *)(*(void *)(a1 + 64) + 8) = *(void *)(*(void *)(a1
                                                                  + 72
                                                                  + 8
                                                                  * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))))
                                                      + 128);
  uint64_t v7 = 0x100000000;
  long long v6 = xmmword_1828E1E20;
  do
  {
    uint64_t result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!result) {
      break;
    }
    uint64_t result = *__error();
  }
  while (result == 4);
  if (result) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t mdb_env_create(void *a1)
{
  os_log_type_t v2 = malloc_type_calloc(1uLL, 0xF8uLL, 0x10B004020E85D84uLL);
  if (!v2) {
    return 12;
  }
  int v3 = v2;
  v2[6] = 126;
  *((void *)v2 + 4) = 0x200000002;
  *(void *)os_log_type_t v2 = -1;
  _DWORD v2[2] = -1;
  v2[10] = getpid();
  int v4 = sysconf(29);
  uint64_t result = 0;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(void **)(a1 + 56);
  if (!v4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 96)) {
    return 22;
  }
  uint64_t v6 = *(void *)(a1
                 + 72
                 + 8
                 * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))));
  if (!a2) {
    unint64_t v2 = *(void *)(v6 + 16);
  }
  unint64_t v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(void *)(v6 + 120);
  if (v2 <= v7) {
    unint64_t v2 = v7;
  }
  munmap(v4, *(void *)(a1 + 112));
  *(void *)(a1 + 112) = v2;
  uint64_t v8 = (*(unsigned char *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0;
  uint64_t result = mdb_env_map(a1, v8);
  if (!result)
  {
LABEL_12:
    *(void *)(a1 + 112) = v2;
    unint64_t v9 = *(unsigned int *)(a1 + 16);
    uint64_t result = 0;
    if (v9) {
      *(void *)(a1 + 128) = v2 / v9;
    }
  }
  return result;
}

uint64_t mdb_env_map(uint64_t a1, char *a2)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(void *)(a1 + 112)) < 0) {
      return *__error();
    }
    int v5 = 3;
  }
  else
  {
    int v5 = 1;
  }
  uint64_t v6 = (char *)mmap(a2, *(void *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0);
  *(void *)(a1 + 56) = v6;
  if (v6 == (char *)-1)
  {
    *(void *)(a1 + 56) = 0;
    return *__error();
  }
  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(void *)(a1 + 112), 1);
    uint64_t v6 = *(char **)(a1 + 56);
  }
  if (a2 && v6 != a2) {
    return 16;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(void *)(a1 + 72) = v6 + 16;
  *(void *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56)) {
    return 22;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result = 22;
  if (a2)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }
  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }
  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, unsigned int a4)
{
  int v26 = -1;
  uint64_t v4 = 22;
  if ((a3 & 0xFC00BFFE) != 0) {
    return v4;
  }
  if (*(_DWORD *)a1 != -1) {
    return v4;
  }
  uint64_t v24 = 0;
  __int16 v25 = 0;
  int v8 = *(_DWORD *)(a1 + 12) | a3;
  uint64_t v4 = mdb_fname_init(a2, v8, (uint64_t)&v24);
  if (v4) {
    return v4;
  }
  unsigned int v9 = v8 | 0x20000000;
  if ((v8 & 0x20000) != 0)
  {
    unsigned int v9 = v8 & 0xDFF7FFFF | 0x20000000;
  }
  else
  {
    uint8_t v10 = mdb_midl_alloc(0x1FFFF);
    *(void *)(a1 + 200) = v10;
    if (!v10
      || (long long v11 = malloc_type_calloc(0x20000uLL, 0x10uLL, 0x108004057E67DB5uLL), (*(void *)(a1 + 208) = v11) == 0))
    {
      *(_DWORD *)(a1 + 12) = v9;
LABEL_35:
      uint64_t v4 = 12;
      goto LABEL_36;
    }
  }
  *(_DWORD *)(a1 + 12) = v9;
  *(void *)(a1 + 48) = strdup(a2);
  *(void *)(a1 + 136) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 0x30uLL, 0x1080040226B62D8uLL);
  *(void *)(a1 + 144) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 2uLL, 0x1000040BDFB0063uLL);
  uint64_t v12 = malloc_type_calloc(*(unsigned int *)(a1 + 36), 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a1 + 136);
  if (!v13 || !*(void *)(a1 + 48)) {
    goto LABEL_35;
  }
  uint64_t v4 = 12;
  if (!*(void *)(a1 + 144) || !v12) {
    goto LABEL_36;
  }
  *(void *)(v13 + 16) = mdb_cmp_long;
  if ((v9 & 0x420000) == 0)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_36;
    }
    if ((v9 & 0x2000000) != 0 && !v26)
    {
      uint64_t v4 = 35;
      goto LABEL_36;
    }
  }
  int v14 = v9 & 0x20000;
  if ((v9 & 0x20000) != 0) {
    int v15 = 0;
  }
  else {
    int v15 = 514;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, v15, a4, (int *)a1);
  if (v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x420000) == 0x20000)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_36;
    }
  }
  uint64_t v4 = mdb_env_open2(a1, v9 & 0x2000000);
  if (v4) {
    goto LABEL_36;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, 20971521, a4, (int *)(a1 + 8));
  if (v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x2000000) != 0 || v26 < 1)
  {
    if (v14)
    {
      uint64_t v4 = 0;
      goto LABEL_37;
    }
LABEL_32:
    int v17 = *(_DWORD *)(a1 + 36);
    uint64_t v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a1 + 16), 0x78DA1B97uLL);
    *(void *)(a1 + 88) = v18;
    if (v18)
    {
      uint64_t v19 = malloc_type_calloc(1uLL, 61 * v17 + 136, 0xC025CA4FuLL);
      if (v19)
      {
        uint64_t v4 = 0;
        v19[11] = v19 + 17;
        uint64_t v20 = *(unsigned int *)(a1 + 36);
        uint64_t v21 = (uint64_t)&v19[6 * v20 + 17];
        uint64_t v22 = v21 + 8 * v20;
        v19[12] = v22;
        v19[13] = v21;
        v19[14] = v22 + 4 * v20;
        v19[4] = a1;
        v19[10] = *(void *)(a1 + 136);
        *((_DWORD *)v19 + 31) = 1;
        *(void *)(a1 + 104) = v19;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  uint64_t v16 = mdb_env_share_locks(a1, &v26);
  if (!(v16 | v14)) {
    goto LABEL_32;
  }
  uint64_t v4 = v16;
  if (v16) {
LABEL_36:
  }
    mdb_env_close1(a1);
LABEL_37:
  if (HIDWORD(v24)) {
    free(v25);
  }
  return v4;
}

uint64_t mdb_fname_init(const char *a1, int a2, uint64_t a3)
{
  int v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  int v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    int v8 = (char *)malloc_type_malloc(v6 + 10, 0x2E9E0525uLL);
    *(void *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a3 + 8) = a1;
  }
  return result;
}

uint64_t mdb_env_setup_locks(uint64_t a1, int *a2, unsigned __int16 a3, int *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = (int *)(a1 + 4);
  uint64_t v7 = mdb_fopen((unsigned int *)a1, a2, 16777734, a3, (int *)(a1 + 4));
  if (!v7)
  {
    if ((*(unsigned char *)(a1 + 14) & 0x20) == 0)
    {
      uint64_t v8 = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))mdb_env_reader_dest);
      if (v8) {
        return v8;
      }
      *(_DWORD *)(a1 + 12) |= 0x10000000u;
    }
    uint64_t v16 = 0x300000000;
    pthread_mutexattr_t v15 = (pthread_mutexattr_t)xmmword_1828E1E20;
    do
    {
      if (!fcntl(*v6, 8, &v15)) {
        goto LABEL_12;
      }
      int v9 = *__error();
    }
    while (v9 == 4);
    if (v9)
    {
      WORD2(v16) = 1;
      do
      {
        if (!fcntl(*v6, 9, &v15))
        {
          LODWORD(v8) = 0;
          goto LABEL_13;
        }
        uint64_t v8 = *__error();
      }
      while (v8 == 4);
      if (!v8) {
        goto LABEL_13;
      }
      return v8;
    }
LABEL_12:
    LODWORD(v8) = 1;
LABEL_13:
    *a4 = v8;
    off_t v10 = lseek(*v6, 0, 2);
    if (v10 != -1)
    {
      int64_t v11 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256;
      if (v10 >= v11 || *a4 < 1)
      {
        *(_DWORD *)(a1 + 24) = ((unint64_t)(v10 + 0x3FFFFFFF00) >> 6) + 1;
        int64_t v11 = v10;
      }
      else if (ftruncate(*v6, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256))
      {
        return *__error();
      }
      uint64_t v12 = (char *)mmap(0, v11, 3, 1, *v6, 0);
      if (v12 != (char *)-1)
      {
        *(void *)(a1 + 64) = v12;
        if (*a4 < 1)
        {
          if (*(_DWORD *)v12 != -1091583778) {
            return 4294936503;
          }
          if (*((_DWORD *)v12 + 1) != 774479874) {
            return 4294936502;
          }
          uint64_t v8 = *__error();
          if (v8 <= 0x23 && ((1 << v8) & 0x800002001) != 0) {
            return 0;
          }
        }
        else
        {
          v15.__sig = 0;
          *(void *)v15.__opaque = 0;
          *(_OWORD *)(v12 + 24) = 0u;
          *(_OWORD *)(v12 + 40) = 0u;
          *(_OWORD *)(v12 + 56) = 0u;
          *(_OWORD *)(v12 + 72) = 0u;
          uint64_t v13 = *(_OWORD **)(a1 + 64);
          v13[8] = 0u;
          v13[9] = 0u;
          v13[10] = 0u;
          v13[11] = 0u;
          uint64_t v8 = pthread_mutexattr_init(&v15);
          if (!v8)
          {
            uint64_t v8 = pthread_mutexattr_setpshared(&v15, 1);
            if (v8
              || (uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 24), &v15), v8))
            {
              pthread_mutexattr_destroy(&v15);
            }
            else
            {
              uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 128), &v15);
              pthread_mutexattr_destroy(&v15);
              if (!v8)
              {
                **(_DWORD **)(a1 + 64) = -1091583778;
                *(_DWORD *)(*(void *)(a1 + 64) + 4) = 774479874;
                *(void *)(*(void *)(a1 + 64) + 8) = 0;
                *(_DWORD *)(*(void *)(a1 + 64) + 16) = 0;
              }
            }
          }
        }
        return v8;
      }
    }
    return *__error();
  }
  uint64_t v8 = v7;
  if (v7 == 30)
  {
    if ((*(unsigned char *)(a1 + 14) & 2) == 0) {
      return 30;
    }
    return 0;
  }
  return v8;
}

uint64_t mdb_fopen(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  if (a2[1]) {
    strcpy((char *)(*((void *)a2 + 1) + *a2), (&(&mdb_suffixes)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  }
  int v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  int v11 = v10;
  if (v10 == -1)
  {
    uint64_t result = *__error();
  }
  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5]) {
      fcntl(v10, 48, 1);
    }
    uint64_t result = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t mdb_env_open2(uint64_t a1, int a2)
{
  int v4 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)(a1 + 12);
  memset(v18, 0, 136);
  unint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v6 = 1;
  long long __buf = 0u;
  while (1)
  {
    char v7 = v6;
    int v8 = pread(*(_DWORD *)a1, &__buf, 0x98uLL, v4);
    if (v8 != 152) {
      break;
    }
    uint64_t result = 4294936503;
    if ((BYTE10(__buf) & 8) == 0 || v20 != -1091583778) {
      goto LABEL_20;
    }
    if (DWORD1(v20) != 1)
    {
      uint64_t result = 4294936502;
      goto LABEL_20;
    }
    if (!v4) {
      goto LABEL_9;
    }
    if (!a2)
    {
      if (v28 <= *(void *)&v18[8]) {
        goto LABEL_10;
      }
LABEL_9:
      v18[0] = v20;
      v18[4] = v24;
      v18[3] = v23;
      v18[2] = v22;
      v18[1] = v21;
      *(void *)&v18[8] = v28;
      v18[7] = v27;
      v18[6] = v26;
      v18[5] = v25;
      goto LABEL_10;
    }
    if (v28 < *(void *)&v18[8]) {
      goto LABEL_9;
    }
LABEL_10:
    char v6 = 0;
    unsigned int v10 = DWORD2(v18[1]);
    v4 += DWORD2(v18[1]);
    if ((v7 & 1) == 0) {
      goto LABEL_44;
    }
  }
  if (!(v4 | v8))
  {
    uint64_t result = 2;
    goto LABEL_20;
  }
  if ((v8 & 0x80000000) == 0)
  {
    uint64_t result = 4294936503;
    goto LABEL_20;
  }
  uint64_t result = *__error();
  if (result)
  {
LABEL_20:
    if (result != 2) {
      return result;
    }
    char v11 = 0;
    unsigned int v10 = *(_DWORD *)(a1 + 20);
    if (v10 >= 0x8000) {
      unsigned int v10 = 0x8000;
    }
    *(_DWORD *)(a1 + 16) = v10;
    memset((char *)&v18[1] + 8, 0, 112);
    *(_OWORD *)((char *)v18 + 8) = 0u;
    *(void *)&v18[0] = 0x1BEEFC0DELL;
    WORD6(v18[1]) = *(_WORD *)(a1 + 12) | 8;
    *(void *)&v18[4] = -1;
    *(void *)&v18[1] = 0x100000;
    unint64_t v12 = *(void *)(a1 + 112);
    DWORD2(v18[1]) = v10;
    v18[7] = xmmword_1828D4A30;
    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
    unsigned int v10 = DWORD2(v18[1]);
LABEL_44:
    *(_DWORD *)(a1 + 16) = v10;
    unint64_t v12 = *(void *)(a1 + 112);
    char v11 = 1;
    if (!v12)
    {
LABEL_24:
      unint64_t v12 = *(void *)&v18[1];
      *(void *)(a1 + 112) = *(void *)&v18[1];
    }
  }
  unint64_t v13 = v10 * *((void *)&v18[7] + 1) + v10;
  if (v12 < v13)
  {
    *(void *)(a1 + 112) = v13;
    unint64_t v12 = v13;
  }
  *(void *)&v18[1] = v12;
  int v14 = v5 & 1;
  if (v11)
  {
LABEL_28:
    char v15 = 1;
LABEL_33:
    if (v14) {
      uint64_t v16 = (char *)*((void *)&v18[0] + 1);
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t result = mdb_env_map(a1, v16);
    if (!result)
    {
      if (v15) {
        goto LABEL_41;
      }
      if (v14) {
        *((void *)&v18[0] + 1) = *(void *)(a1 + 56);
      }
      uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
      if (!result)
      {
LABEL_41:
        uint64_t result = 0;
        unint64_t v17 = *(unsigned int *)(a1 + 16);
        *(_DWORD *)(a1 + 216) = ((v17 - 16) >> 3) - 1;
        *(_DWORD *)(a1 + 220) = (((v17 - 16) >> 1) & 0x7FFFFFFE) - 2;
        *(void *)(a1 + 128) = *(void *)(a1 + 112) / v17;
      }
    }
  }
  else
  {
    if (v5)
    {
      char v15 = 0;
      int v14 = 1;
      goto LABEL_33;
    }
    uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
    if (!result)
    {
      int v14 = 0;
      goto LABEL_28;
    }
  }
  return result;
}

uint64_t mdb_env_close1(uint64_t result)
{
  if ((*(unsigned char *)(result + 15) & 0x20) != 0)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void **)(result + 136);
    if (v2)
    {
      uint64_t v3 = *(unsigned int *)(v1 + 36);
      if ((int)v3 >= 3)
      {
        unint64_t v4 = v3 + 1;
        do
          free(*(void **)(*(void *)(v1 + 136) + 48 * (v4-- - 2) + 8));
        while (v4 > 3);
        unint64_t v2 = *(void **)(v1 + 136);
      }
      free(v2);
    }
    free(*(void **)(v1 + 88));
    free(*(void **)(v1 + 152));
    free(*(void **)(v1 + 144));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 208));
    free(*(void **)(v1 + 104));
    mdb_midl_free(*(void *)(v1 + 200));
    if ((*(unsigned char *)(v1 + 15) & 0x10) != 0) {
      pthread_key_delete(*(void *)(v1 + 160));
    }
    int v5 = *(void **)(v1 + 56);
    if (v5) {
      munmap(v5, *(void *)(v1 + 112));
    }
    int v6 = *(_DWORD *)(v1 + 8);
    if (v6 != -1) {
      close(v6);
    }
    if (*(_DWORD *)v1 != -1) {
      close(*(_DWORD *)v1);
    }
    if (*(void *)(v1 + 64))
    {
      pid_t v7 = getpid();
      uint64_t v8 = *(unsigned int *)(v1 + 28);
      if ((int)v8 >= 1)
      {
        unint64_t v9 = v8 + 1;
        do
        {
          unint64_t v10 = *(void *)(v1 + 64) + ((unint64_t)(v9 - 2) << 6);
          int v12 = *(_DWORD *)(v10 + 200);
          char v11 = (_DWORD *)(v10 + 200);
          if (v12 == v7) {
            _DWORD *v11 = 0;
          }
          --v9;
        }
        while (v9 > 1);
      }
      munmap(*(void **)(v1 + 64), ((unint64_t)(*(_DWORD *)(v1 + 24) - 1) << 6) + 256);
    }
    uint64_t result = *(unsigned int *)(v1 + 4);
    if (result != -1) {
      uint64_t result = close(result);
    }
    *(_DWORD *)(v1 + 12) &= 0xCFFFFFFF;
  }
  return result;
}

void mdb_env_close(void *a1)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v2 = (void *)a1[24];
      if (!v2) {
        break;
      }
      a1[24] = *v2;
      free(v2);
    }
    mdb_env_close1((uint64_t)a1);
    free(a1);
  }
}

size_t mdb_env_copyfd2(int *a1, int a2, char a3)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v73 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    *(_OWORD *)uint64_t v69 = 0u;
    long long v70 = 0u;
    memset(&v68, 0, sizeof(v68));
    *(_OWORD *)unsigned int v66 = 0u;
    memset(&v67, 0, sizeof(v67));
    pthread_t v64 = 0;
    long long v65 = 0;
    size_t v5 = pthread_mutex_init(&v67, 0);
    if (v5) {
      return v5;
    }
    size_t v9 = pthread_cond_init(&v68, 0);
    if (v9)
    {
      size_t v5 = v9;
      pthread_mutex_destroy(&v67);
      return v5;
    }
    *(void *)&memptr.st_dev = 0;
    size_t v14 = malloc_type_posix_memalign((void **)&memptr, a1[5], 0x200000uLL, 0xA3EC04BCuLL);
    if (v14)
    {
      size_t v5 = v14;
      goto LABEL_59;
    }
    uint64_t v15 = *(void *)&memptr.st_dev;
    v69[0] = *(void **)&memptr.st_dev;
    bzero(*(void **)&memptr.st_dev, 0x200000uLL);
    *(void *)&long long v72 = 2;
    v69[1] = (void *)(v15 + 0x100000);
    v66[0] = a1;
    DWORD2(v72) = a2;
    size_t v5 = pthread_create(&v64, 0, (void *(__cdecl *)(void *))mdb_env_copythr, v66);
    if (v5)
    {
LABEL_59:
      free(v69[0]);
      pthread_cond_destroy(&v68);
      pthread_mutex_destroy(&v67);
      if (!v5) {
        return HIDWORD(v73);
      }
      return v5;
    }
    unint64_t v63 = 0;
    int v16 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)&v65);
    if (v16)
    {
      unint64_t v17 = v65;
      goto LABEL_57;
    }
    long long v26 = v69[0];
    bzero(v69[0], (2 * a1[4]));
    *(void *)long long v26 = 0;
    v26[5] = 8;
    *((void *)v26 + 2) = 0x1BEEFC0DELL;
    *((void *)v26 + 4) = *((void *)a1 + 14);
    uint64_t v27 = a1[4];
    *((_DWORD *)v26 + 10) = v27;
    v26[22] = *((_WORD *)a1 + 6) | 8;
    *((void *)v26 + 10) = -1;
    *((_OWORD *)v26 + 8) = xmmword_1828D4A30;
    *((void *)v26 + 3) = *(void *)(*((void *)a1 + 9) + 8);
    unint64_t v28 = (char *)v69[0] + v27;
    *(void *)unint64_t v28 = 1;
    *((_WORD *)v28 + 5) = 8;
    *((_OWORD *)v28 + 1) = *((_OWORD *)v26 + 1);
    long long v29 = *((_OWORD *)v26 + 2);
    long long v30 = *((_OWORD *)v26 + 3);
    long long v31 = *((_OWORD *)v26 + 4);
    *((_OWORD *)v28 + 5) = *((_OWORD *)v26 + 5);
    *((_OWORD *)v28 + 4) = v31;
    *((_OWORD *)v28 + 3) = v30;
    *((_OWORD *)v28 + 2) = v29;
    long long v32 = *((_OWORD *)v26 + 6);
    long long v33 = *((_OWORD *)v26 + 7);
    long long v34 = *((_OWORD *)v26 + 8);
    *((void *)v28 + 18) = *((void *)v26 + 18);
    *((_OWORD *)v28 + 8) = v34;
    *((_OWORD *)v28 + 7) = v33;
    *((_OWORD *)v28 + 6) = v32;
    unint64_t v17 = v65;
    uint64_t v35 = v65[11];
    unint64_t v63 = *(void *)(v35 + 88);
    if (v63 == -1)
    {
      int v42 = *(unsigned __int16 *)(v35 + 52);
      *((_WORD *)v28 + 46) = v42;
      uint64_t v38 = -1;
      if (!v42) {
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v62 = 0;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      memset(&memptr, 0, sizeof(memptr));
      v45[0] = 0;
      v45[1] = 0;
      uint64_t v43 = 0;
      __int16 v44 = 0;
      mdb_cursor_init((uint64_t)&memptr, (uint64_t)v65, 0, 0);
      for (uint64_t i = 0; ; i += *v44)
      {
        int v16 = mdb_cursor_get((uint64_t)&memptr, v45, &v43, 8);
        if (v16) {
          break;
        }
      }
      if (v16 != -30798) {
        goto LABEL_57;
      }
      uint64_t v37 = v17[11];
      uint64_t v38 = v17[2] + ~(*(void *)(v37 + 8) + i + *(void *)(v37 + 16) + *(void *)(v37 + 24));
      *((void *)v28 + 17) = v38;
      long long v39 = *(_OWORD *)(v37 + 48);
      long long v40 = *(_OWORD *)(v37 + 64);
      uint64_t v41 = *(void *)(v37 + 80);
      *(_OWORD *)(v28 + 104) = v40;
      *(_OWORD *)(v28 + 88) = v39;
      *((void *)v28 + 15) = v41;
      *((void *)v28 + 16) = v38;
    }
    *((void *)v28 + 18) = 1;
LABEL_54:
    LODWORD(v71) = 2 * a1[4];
    v66[1] = v17;
    int v16 = mdb_env_cwalk((uint64_t)v66, &v63, 0);
    if (!v16)
    {
      if (v63 == v38)
      {
LABEL_58:
        mdb_env_cthr_toggle((uint64_t)v66, 17);
        size_t v5 = pthread_join(v64, 0);
        mdb_txn_abort((uint64_t)v17);
        goto LABEL_59;
      }
      int v16 = -30784;
    }
LABEL_57:
    HIDWORD(v73) = v16;
    goto LABEL_58;
  }
  v66[0] = 0;
  size_t v5 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)v66);
  if (!v5)
  {
    if (*((void *)a1 + 8))
    {
      int v6 = v66[0];
      mdb_txn_end((unsigned int *)v66[0], 4);
      pid_t v7 = (pthread_mutex_t *)(*((void *)a1 + 8) + 128);
      size_t v5 = pthread_mutex_lock(v7);
      if (v5)
      {
LABEL_28:
        mdb_txn_abort((uint64_t)v66[0]);
        return v5;
      }
      uint64_t v8 = mdb_txn_renew0((uint64_t)v6);
      if (v8)
      {
        size_t v5 = v8;
        pthread_mutex_unlock(v7);
        goto LABEL_28;
      }
    }
    else
    {
      pid_t v7 = 0;
    }
    int v10 = a1[4];
    uint64_t v11 = (2 * v10);
    int v12 = (char *)*((void *)a1 + 7);
    if (v11)
    {
      size_t v5 = (2 * v10);
      while (1)
      {
        ssize_t v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_25;
        }
        if (!v13) {
          break;
        }
        v12 += v13;
        v5 -= v13;
        if (!v5) {
          goto LABEL_25;
        }
      }
      size_t v5 = 5;
    }
    else
    {
      size_t v5 = 0;
    }
LABEL_25:
    if (v7) {
      pthread_mutex_unlock(v7);
    }
    if (v5) {
      goto LABEL_28;
    }
    uint64_t v19 = *((void *)v66[0] + 2);
    uint64_t v20 = a1[4];
    int v21 = *a1;
    memset(&memptr, 0, sizeof(memptr));
    if (fstat(v21, &memptr))
    {
      size_t v5 = *__error();
      if (v5) {
        goto LABEL_28;
      }
      off_t st_size = 0;
    }
    else
    {
      off_t st_size = v19 * v20;
      if ((unint64_t)(v19 * v20) >= memptr.st_size) {
        off_t st_size = memptr.st_size;
      }
    }
    unint64_t v23 = st_size - v11;
    if (st_size == v11)
    {
      size_t v5 = 0;
    }
    else
    {
      while (1)
      {
        if (v23 >= 0x40000000) {
          size_t v24 = 0x40000000;
        }
        else {
          size_t v24 = v23;
        }
        ssize_t v25 = write(a2, v12, v24);
        if (v25 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_28;
        }
        if (!v25) {
          break;
        }
        size_t v5 = 0;
        v12 += v25;
        v23 -= v25;
        if (!v23) {
          goto LABEL_28;
        }
      }
      size_t v5 = 5;
    }
    goto LABEL_28;
  }
  return v5;
}

size_t mdb_env_copyfd(int *a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  uint64_t v9 = 0;
  int v10 = 0;
  int v8 = -1;
  size_t v5 = mdb_fname_init(a2, a1[3] | 0x400000, (uint64_t)&v9);
  if (!v5)
  {
    size_t v5 = mdb_fopen(a1, (int *)&v9, 16779777, 0x1B6u, &v8);
    if (HIDWORD(v9)) {
      free(v10);
    }
    if (!v5)
    {
      int v6 = v8;
      size_t v5 = mdb_env_copyfd2((int *)a1, v8, a3);
      if (close(v6) < 0 && !v5) {
        return *__error();
      }
    }
  }
  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  if ((a2 & 0xFEEAFFFF) != 0) {
    return 22;
  }
  uint64_t result = 0;
  if (a3) {
    int v5 = *(_DWORD *)(a1 + 12) | a2;
  }
  else {
    int v5 = *(_DWORD *)(a1 + 12) & ~a2;
  }
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 12) & 0x3FF4001;
    }
  }
  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(a1 + 232) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t mdb_env_get_path(uint64_t a1, void *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 48);
    }
  }
  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(void *)(a1
                     + 72
                     + 8
                     * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))));
      int v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      __n128 result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }
  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v3 = a1 + 72;
    int v6 = *(void **)(v3
                    + 8
                    * ((*(_DWORD *)(v3 - 60) >> 25) & 1 ^ (*(void *)(v4 + 128) < *(void *)(v5 + 128))));
    *(void *)a2 = v6[1];
    *(void *)(a2 + 16) = v6[15];
    *(void *)(a2 + 24) = v6[16];
    *(void *)(a2 + 8) = *(void *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    uint64_t v7 = *(void *)(v3 - 8);
    if (v7) {
      int v8 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v8 = 0;
    }
    uint64_t v2 = 0;
    *(_DWORD *)(a2 + 36) = v8;
  }
  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0
    && (*(unsigned char *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 2) != 0)
    {
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      mdb_cursor_init((uint64_t)v10, a1, a2, (uint64_t)v9);
    }
    uint64_t v6 = *(void *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = v6 + 48 * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    __n128 result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }
  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 16);
        if (!v8) {
          return v6("(no active readers)\n", a3);
        }
        uint64_t result = 0;
        uint64_t v9 = v7 + 208;
        int v10 = 1;
        do
        {
          if (*(_DWORD *)(v9 - 8))
          {
            if (*(void *)(v9 - 16) == -1) {
              snprintf(__str, 0x40uLL, "%10d %zx -\n");
            }
            else {
              snprintf(__str, 0x40uLL, "%10d %zx %zu\n");
            }
            if (v10)
            {
              uint64_t result = a2("    pid     thread     txnid\n", a3);
              if ((result & 0x80000000) != 0) {
                return result;
              }
            }
            uint64_t result = a2(__str, a3);
            if ((result & 0x80000000) != 0) {
              return result;
            }
            int v10 = 0;
            uint64_t v6 = a2;
          }
          v9 += 64;
          --v8;
        }
        while (v8);
        if (v10) {
          return v6("(no active readers)\n", a3);
        }
      }
      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }
  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 22;
  }
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(unsigned int *)(v4 + 16);
  uint64_t v6 = (unsigned int *)malloc_type_malloc(4 * (v5 + 1), 0x100004052888210uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  *uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    int v10 = (pthread_mutex_t *)(v4 + 24);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = v11 + 192;
    uint64_t v29 = v11 + 200;
    while (1)
    {
      int v13 = *(_DWORD *)(v12 + (v8 << 6) + 8);
      if (v13 && v13 != *(_DWORD *)(a1 + 40))
      {
        uint64_t v14 = *v7;
        if (v14)
        {
          unsigned int v15 = 0;
          unsigned int v16 = *v7;
          do
          {
            while (1)
            {
              unsigned int v17 = v16 >> 1;
              unsigned int v18 = v15 + (v16 >> 1) + 1;
              int v19 = v13 - v7[v18];
              if (v19 >= 0) {
                break;
              }
              v16 >>= 1;
              if (!v17) {
                goto LABEL_17;
              }
            }
            if (!v19) {
              goto LABEL_36;
            }
            v16 += ~v17;
            unsigned int v15 = v18;
          }
          while (v16);
LABEL_17:
          unsigned int v20 = v19 <= 0 ? v18 : v18 + 1;
        }
        else
        {
          unsigned int v20 = 1;
        }
        uint64_t v21 = (v14 + 1);
        unsigned int *v7 = v21;
        if (v21 > v20)
        {
          uint64_t v22 = v21;
          do
            v7[v22--] = v7[v14--];
          while (v20 < (int)v14 + 1);
          uint64_t v21 = v14 + 1;
        }
        v7[v21] = v13;
        if (!mdb_reader_pid(a1, 7, v13))
        {
          uint64_t v23 = pthread_mutex_lock(v10);
          if (v23)
          {
            uint64_t v27 = v23;
            goto LABEL_43;
          }
          if (mdb_reader_pid(a1, 7, v13)) {
            uint64_t v24 = v5;
          }
          else {
            uint64_t v24 = v8;
          }
          if (v24 < v5)
          {
            int v25 = v5 - v24;
            long long v26 = (_DWORD *)(v29 + (v24 << 6));
            do
            {
              if (*v26 == v13)
              {
                _DWORD *v26 = 0;
                ++v9;
              }
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          pthread_mutex_unlock(v10);
        }
      }
LABEL_36:
      if (++v8 == v5) {
        goto LABEL_42;
      }
    }
  }
  int v9 = 0;
LABEL_42:
  uint64_t v27 = 0;
LABEL_43:
  free(v7);
  if (a2) {
    *a2 = v9;
  }
  return v27;
}

uint64_t mdb_env_init_meta(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(unsigned int *)(a1 + 16);
  uint64_t v5 = (char *)malloc_type_calloc(2uLL, v4, 0xB4D7345BuLL);
  if (!v5) {
    return 12;
  }
  uint64_t v6 = v5;
  *(void *)uint64_t v5 = 0;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  long long v10 = *(_OWORD *)(a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 112);
  *((void *)v5 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  int v13 = &v5[v4];
  *(void *)int v13 = 1;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v15 = *(_OWORD *)(a2 + 32);
  long long v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  long long v17 = *(_OWORD *)(a2 + 80);
  long long v18 = *(_OWORD *)(a2 + 96);
  long long v19 = *(_OWORD *)(a2 + 112);
  *((void *)v13 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  size_t v20 = (2 * v4);
  while (1)
  {
    int v21 = pwrite(*(_DWORD *)a1, v6, v20, 0);
    if (v21 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_11;
    }
  }
  if (v21 < 0)
  {
LABEL_11:
    uint64_t v22 = *__error();
    goto LABEL_12;
  }
  if (v20 == v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = 28;
  }
LABEL_12:
  free(v6);
  return v22;
}

uint64_t mdb_env_copythr(uint64_t a1)
{
  sigset_t v18 = 4096;
  int v2 = pthread_sigmask(1, &v18, 0);
  if (v2) {
    *(_DWORD *)(a1 + 196) = v2;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (uint64_t i = 0; ; i ^= 1uLL)
  {
    while (1)
    {
      int v4 = *(_DWORD *)(a1 + 192);
      if (v4) {
        break;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }
    if (v4 == 16) {
      break;
    }
    uint64_t v5 = a1 + 4 * i;
    int v8 = *(_DWORD *)(v5 + 160);
    uint64_t v6 = (_DWORD *)(v5 + 160);
    int v7 = v8;
    uint64_t v9 = a1 + 8 * i;
    long long v10 = *(char **)(v9 + 128);
    long long v11 = v6 + 2;
    long long v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196)) {
            goto LABEL_20;
          }
          unsigned int v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0) {
            break;
          }
          if (!v13)
          {
            int v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }
          v10 += v13;
          BOOL v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0)) {
            goto LABEL_20;
          }
        }
        int v15 = *__error();
        if (!v15) {
          goto LABEL_20;
        }
        if (v15 == 32)
        {
          int v17 = 0;
          sigwait(&v18, &v17);
          int v15 = 32;
        }
        goto LABEL_19;
      }
LABEL_20:
      int v7 = *v11;
      if (!*v11) {
        break;
      }
      long long v10 = (char *)*v12;
      int *v11 = 0;
    }
    *uint64_t v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t mdb_env_cwalk(uint64_t a1, unint64_t *a2, char a3)
{
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v4 = *a2;
  if (v4 == -1) {
    return 0;
  }
  LOWORD(v69[0]) = 1;
  *((void *)&v66 + 1) = *(void *)(a1 + 8);
  DWORD1(v69[0]) = *(_DWORD *)(*((void *)&v66 + 1) + 124) & 0xA0000;
  uint64_t v7 = mdb_page_get((uint64_t)&v65, v4, (unint64_t *)v69 + 1, 0);
  if (!v7)
  {
    uint64_t v7 = mdb_page_search_root((uint64_t)&v65, 0, 4);
    if (!v7)
    {
      int v8 = malloc_type_malloc(*(_DWORD *)(*(void *)a1 + 16) * LOWORD(v69[0]), 0xFFCC827BuLL);
      if (v8)
      {
        uint64_t v9 = v8;
        unsigned __int16 v10 = WORD1(v69[0]);
        if (WORD1(v69[0]))
        {
          unint64_t v11 = 0;
          LODWORD(v12) = *(_DWORD *)(*(void *)a1 + 16);
          unsigned int v13 = (char *)v8;
          do
          {
            mdb_page_copy(v13, *((_WORD **)v69 + v11 + 1), v12);
            *((void *)v69 + v11 + 1) = v13;
            uint64_t v12 = *(unsigned int *)(*(void *)a1 + 16);
            v13 += v12;
            ++v11;
            unsigned __int16 v10 = WORD1(v69[0]);
          }
          while (v11 < WORD1(v69[0]));
        }
        else
        {
          unsigned int v13 = (char *)v8;
        }
        if (LOWORD(v69[0]))
        {
          long long v58 = v9;
          int v15 = *(_DWORD *)(a1 + 188);
          int v59 = a3 & 4;
          while (1)
          {
            long long v16 = (_WORD *)*((void *)v69 + v10 + 1);
            pthread_t v64 = v16;
            unsigned int v17 = (unsigned __int16)v16[6] - 16;
            unsigned int v18 = v17 >> 1;
            __int16 v19 = v16[5];
            if ((v19 & 2) != 0)
            {
              if (v19 & 0x20 | v59) {
                BOOL v27 = 0;
              }
              else {
                BOOL v27 = v17 >= 2;
              }
              if (v27)
              {
                if (v18 <= 1) {
                  uint64_t v28 = 1;
                }
                else {
                  uint64_t v28 = v18;
                }
                uint64_t v29 = -v28;
                uint64_t v30 = 8;
                uint64_t v60 = -v28;
                do
                {
                  long long v31 = v64;
                  long long v32 = (char *)v64 + *((unsigned __int16 *)v64 + v30);
                  __int16 v33 = *((_WORD *)v32 + 2);
                  if (v33)
                  {
                    __src[0] = 0;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    long long v40 = &v32[*((unsigned __int16 *)v32 + 3)];
                    unint64_t v41 = *((void *)v40 + 1);
                    *((void *)v40 + 1) = *(void *)(a1 + 176);
                    uint64_t v23 = mdb_page_get((uint64_t)&v65, v41, (unint64_t *)__src, 0);
                    if (v23) {
                      goto LABEL_59;
                    }
                    int v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    if (v42 < 0x100000)
                    {
                      uint64_t v43 = v15;
                    }
                    else
                    {
                      uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      int v15 = *(_DWORD *)(a1 + 188);
                      uint64_t v43 = v15;
                      int v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    }
                    uint64_t v44 = a1 + 8 * v43;
                    uint64_t v45 = a1 + 4 * v43;
                    long long v46 = (void *)(*(void *)(v44 + 128) + v42);
                    long long v47 = (unsigned int *)__src[0];
                    memcpy(v46, __src[0], *(unsigned int *)(*(void *)a1 + 16));
                    *long long v46 = *(void *)(a1 + 176);
                    *(void *)(a1 + 176) += v47[3];
                    uint64_t v48 = *(void *)a1;
                    *(_DWORD *)(v45 + 160) += *(_DWORD *)(*(void *)a1 + 16);
                    unsigned int v49 = v47[3];
                    if (v49 >= 2)
                    {
                      *(_DWORD *)(v45 + 168) = *(_DWORD *)(v48 + 16) * (v49 - 1);
                      *(void *)(v44 + 144) = (char *)v47 + *(unsigned int *)(v48 + 16);
                      uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      int v15 = *(_DWORD *)(a1 + 188);
                    }
                    uint64_t v29 = v60;
                  }
                  else if ((v33 & 2) != 0)
                  {
                    long long v62 = 0u;
                    long long v63 = 0u;
                    *(_OWORD *)__src = 0u;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    long long v34 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    long long v35 = *(_OWORD *)v34;
                    long long v36 = *((_OWORD *)v34 + 2);
                    long long v62 = *((_OWORD *)v34 + 1);
                    long long v63 = v36;
                    *(_OWORD *)__src = v35;
                    *(_DWORD *)(a1 + 188) = v15;
                    uint64_t v23 = mdb_env_cwalk(a1, (char *)&v63 + 8, *((_WORD *)v32 + 2) & 4);
                    if (v23) {
                      goto LABEL_59;
                    }
                    int v15 = *(_DWORD *)(a1 + 188);
                    uint64_t v37 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    long long v39 = v62;
                    long long v38 = v63;
                    *(_OWORD *)uint64_t v37 = *(_OWORD *)__src;
                    *((_OWORD *)v37 + 1) = v39;
                    *((_OWORD *)v37 + 2) = v38;
                  }
                  ++v30;
                }
                while (v29 + v30 != 8);
              }
            }
            else
            {
              size_t v20 = (char *)&v65 + 2 * v10;
              unsigned __int16 v21 = *((_WORD *)v20 + 164) + 1;
              *((_WORD *)v20 + 164) = v21;
              if (v18 > v21)
              {
                for (uint64_t i = (char *)v16 + (unsigned __int16)v16[v21 + 8];
                      ;
                      uint64_t i = &v25[*(unsigned __int16 *)&v25[2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 4) + 16]])
                {
                  uint64_t v23 = mdb_page_get((uint64_t)&v65, *(unsigned int *)i | ((unint64_t)*((unsigned __int16 *)i + 2) << 32), (unint64_t *)&v64, 0);
                  if (v23) {
                    break;
                  }
                  unsigned __int16 v10 = WORD1(v69[0]) + 1;
                  WORD1(v69[0]) = v10;
                  __int16 v24 = ++LOWORD(v69[0]);
                  *((_WORD *)&v69[16] + v10 + 4) = 0;
                  int v25 = (char *)v64;
                  long long v26 = (char **)v69 + v10 + 1;
                  if ((*((unsigned char *)v64 + 10) & 1) == 0)
                  {
                    _DWORD *v26 = (char *)v64;
                    goto LABEL_56;
                  }
                  mdb_page_copy(*v26, v64, *(_DWORD *)(*(void *)a1 + 16));
                }
LABEL_59:
                uint64_t v7 = v23;
                goto LABEL_60;
              }
            }
            int v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            if (v50 < 0x100000)
            {
              uint64_t v51 = v15;
            }
            else
            {
              uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
              if (v23) {
                goto LABEL_59;
              }
              int v15 = *(_DWORD *)(a1 + 188);
              uint64_t v51 = v15;
              int v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            }
            uint64_t v52 = a1 + 4 * v51;
            uint64_t v53 = *(void *)(a1 + 8 * v51 + 128) + v50;
            mdb_page_copy((char *)v53, v64, *(_DWORD *)(*(void *)a1 + 16));
            uint64_t v54 = *(void *)(a1 + 176);
            *(void *)(a1 + 176) = v54 + 1;
            *(void *)uint64_t v53 = v54;
            *(_DWORD *)(v52 + 160) += *(_DWORD *)(*(void *)a1 + 16);
            __int16 v55 = WORD1(v69[0]);
            if (!WORD1(v69[0]))
            {
              uint64_t v7 = 0;
              *a2 = *(void *)v53;
              goto LABEL_60;
            }
            uint64_t v56 = *((void *)v69 + WORD1(v69[0]));
            uint64_t v57 = v56
                + *(unsigned __int16 *)(v56
                                      + 2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 3)
                                      + 16);
            *(_DWORD *)uint64_t v57 = *(void *)v53;
            *(_WORD *)(v57 + 4) = *(_DWORD *)(v53 + 4);
            if (!LOWORD(v69[0])) {
              goto LABEL_63;
            }
            if (!--LOWORD(v69[0])) {
              break;
            }
            unsigned __int16 v10 = v55 - 1;
            WORD1(v69[0]) = v10;
            __int16 v24 = 1;
LABEL_56:
            if (!v24)
            {
LABEL_63:
              uint64_t v7 = 0;
              goto LABEL_60;
            }
          }
          uint64_t v7 = 0;
          DWORD1(v69[0]) &= ~1u;
LABEL_60:
          uint64_t v9 = v58;
        }
        else
        {
          uint64_t v7 = 0;
        }
        free(v9);
      }
      else
      {
        return 12;
      }
    }
  }
  return v7;
}

uint64_t mdb_env_cthr_toggle(uint64_t a1, int a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(unsigned char *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  int v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4 * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}