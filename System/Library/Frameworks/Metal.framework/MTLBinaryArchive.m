@interface MTLBinaryArchive
@end

@implementation MTLBinaryArchive

uint64_t __39___MTLBinaryArchive_loadFromURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) length]) {
    return [*(id *)(*(void *)(a1 + 32) + 48) bytes] + v4;
  }
  else {
    return 0;
  }
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + a2;
  }
  else {
    return 0;
  }
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a3 + a2 + *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 <= [*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + a2 + *(void *)(*(void *)(a1 + 40) + 8);
  }
  else {
    return 0;
  }
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a3 + a2 + *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 <= [*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + a2 + *(void *)(*(void *)(a1 + 40) + 8);
  }
  else {
    return 0;
  }
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_296(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) length]) {
    return [*(id *)(*(void *)(a1 + 32) + 48) bytes] + v4;
  }
  else {
    return 0;
  }
}

BOOL __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 7) <= 1) {
    return *(unsigned char *)(a1 + 40) != 0;
  }
  if (a2 != 3) {
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4_cold_1(a1);
  }
  return 1;
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a2 + 80) & 0x20) != 0)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t result = 1;
    *(unsigned char *)(v8 + 73) = 1;
  }
  else
  {
    *(void *)(a2 + 56) = *(void *)(a1 + 40);
    uint64_t v46 = 0;
    [*(id *)(a1 + 32) preloadLibrariesInAirntObject:a2 error:&v46];
    if (*(unsigned char *)(a1 + 48) || ([*(id *)(a1 + 32) getScriptsWithAIRNTObject:a2] & 1) != 0)
    {
      uint64_t v4 = (void **)(*(void *)(a1 + 32) + 216);
      unint64_t v5 = *(uint64_t **)(*(void *)(a1 + 32) + 224);
      unint64_t v6 = *(void *)(*(void *)(a1 + 32) + 232);
      if ((unint64_t)v5 >= v6)
      {
        uint64_t v10 = ((char *)v5 - (unsigned char *)*v4) >> 3;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = v6 - (void)*v4;
        uint64_t v12 = v11 >> 2;
        if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
          uint64_t v12 = v10 + 1;
        }
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(void *)(a1 + 32) + 232, v13);
        }
        else {
          v14 = 0;
        }
        v15 = &v14[8 * v10];
        v16 = &v14[8 * v13];
        *(void *)v15 = a2;
        v7 = v15 + 8;
        v18 = (char *)*v4;
        v17 = (char *)v4[1];
        if (v17 != *v4)
        {
          do
          {
            uint64_t v19 = *((void *)v17 - 1);
            v17 -= 8;
            *((void *)v15 - 1) = v19;
            v15 -= 8;
          }
          while (v17 != v18);
          v17 = (char *)*v4;
        }
        *uint64_t v4 = v15;
        v4[1] = v7;
        v4[2] = v16;
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *unint64_t v5 = a2;
        v7 = v5 + 1;
      }
      v4[1] = v7;
      if ((*(unsigned char *)(a2 + 80) & 4) != 0)
      {
        v20 = (void **)(*(void *)(a1 + 32) + 240);
        v21 = *(uint64_t **)(*(void *)(a1 + 32) + 248);
        unint64_t v22 = *(void *)(*(void *)(a1 + 32) + 256);
        if ((unint64_t)v21 >= v22)
        {
          uint64_t v24 = ((char *)v21 - (unsigned char *)*v20) >> 3;
          if ((unint64_t)(v24 + 1) >> 61) {
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v25 = v22 - (void)*v20;
          uint64_t v26 = v25 >> 2;
          if (v25 >> 2 <= (unint64_t)(v24 + 1)) {
            uint64_t v26 = v24 + 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(void *)(a1 + 32) + 256, v27);
          }
          else {
            v28 = 0;
          }
          v29 = &v28[8 * v24];
          v30 = &v28[8 * v27];
          *(void *)v29 = a2;
          v23 = v29 + 8;
          v32 = (char *)*v20;
          v31 = (char *)v20[1];
          if (v31 != *v20)
          {
            do
            {
              uint64_t v33 = *((void *)v31 - 1);
              v31 -= 8;
              *((void *)v29 - 1) = v33;
              v29 -= 8;
            }
            while (v31 != v32);
            v31 = (char *)*v20;
          }
          *v20 = v29;
          v20[1] = v23;
          v20[2] = v30;
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          uint64_t *v21 = a2;
          v23 = v21 + 1;
        }
        v20[1] = v23;
      }
      uint64_t v34 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v34 + 32) & 0x10) == 0)
      {
        unint64_t data = *(void *)(a2 + 40) + *(void *)(a1 + 40);
        uint64_t v36 = *(void *)(v34 + 216);
        uint64_t v35 = *(void *)(v34 + 224);
        *(void *)v44.count = &data;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v34 + 336, &data, (uint64_t)&std::piecewise_construct, &v44)[3] = (v35 - v36) >> 3;
        CC_SHA256_Init(&v44);
        CC_SHA256_Update(&v44, *(const void **)(**(void **)a2 + 24), 0x20u);
        CC_SHA256_Update(&v44, &data, 8u);
        CC_SHA256_Final((unsigned __int8 *)md, &v44);
        uint64_t v37 = *(void *)(a1 + 40);
        uint64_t v39 = *(unsigned int *)(a2 + 64);
        uint64_t v38 = *(unsigned int *)(a2 + 68);
        uint64_t v41 = *(unsigned int *)(a2 + 72);
        uint64_t v40 = *(unsigned int *)(a2 + 76);
        uint64_t v42 = *(void *)(a1 + 32) + 136;
        v47 = (unsigned __int8 *)md;
        v43 = std::__hash_table<std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(v42, md, (uint64_t)&std::piecewise_construct, (_OWORD **)&v47);
        v43[6] = v37 + v39;
        v43[7] = v38;
        v43[8] = v37 + v41;
        v43[9] = v40;
      }
      return 1;
    }
    else
    {
      MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)a2);
      MEMORY[0x18530C140]();
      return 0;
    }
  }
  return result;
}

uint64_t __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 376) objectForKey:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t result = *(void *)(a1 + 32);
    if (*(unsigned char *)(result + 60)) {
      return result;
    }
    uint64_t result = objc_msgSend((id)result, "updateReflectionForEntry:binaryKey:requiredReflection:");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    if ((result & 1) == 0)
    {
      *(void *)(v3 + 40) = 0;
      return result;
    }
    if (*(void *)(v3 + 40)) {
      return result;
    }
  }
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  if (v4[60])
  {
    uint64_t v5 = [*(id *)(a1 + 40) value];
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_2;
    v8[3] = &unk_1E521FDF8;
    v8[4] = v6;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_3;
    v7[3] = &unk_1E521FE20;
    v7[4] = v6;
    uint64_t result = [v4 materializeEntryForKey:v5 fileIndex:v6 + 288 containsEntry:v8 addEntry:v7];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) materializeAIRNTBlockForKey:*(void *)(a1 + 40) reflectionType:*(char *)(a1 + 56)];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

BOOL __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = a2;
  uint64_t v9 = **(void **)(a1 + 40);
  BOOL v10 = v9 != a2;
  if (v9 == a2 && (*(unsigned char *)(*(void *)(a1 + 32) + 32) & 0x10) == 0)
  {
    MTLHashKey::MTLHashKey(&v36, a4, a5, a3);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    MTLHashKey::MTLHashKey(&v31, &v36);
    uint64_t v32 = a7;
    uint64_t v33 = v16 + a6;
    uint64_t v34 = a9;
    uint64_t v35 = v16 + a8;
    std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<MTLHashKey,std::pair<MTLHashKey const,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>(v15 + 96, &v31, (uint64_t)&v31);
    MTLHashKey::~MTLHashKey(&v31);
    v17 = (void *)(*(void *)(a1 + 32) + 176);
    v31.var0.var0 = *(void *)(a1 + 48) + a6;
    v18 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(v17, &v31.var0.var0);
    if (v18)
    {
      memset(&v31, 0, 24);
      std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v31, v18[3], v18[4], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18[4] - v18[3]) >> 4));
      unint64_t var1 = v31.var0.var1;
      if (v31.var0.var1 >= *(void *)&v31.var0.var2)
      {
        unint64_t v20 = std::vector<MTLHashKey>::__push_back_slow_path<MTLHashKey const&>((uint64_t *)&v31, &v36);
      }
      else
      {
        MTLHashKey::MTLHashKey((MTLHashKey *)v31.var0.var1, &v36);
        unint64_t v20 = var1 + 80;
      }
      v31.var0.unint64_t var1 = v20;
      uint64_t v26 = &v31;
      uint64_t v24 = (void ***)&v26;
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v21 = std::vector<MTLHashKey>::__push_back_slow_path<MTLHashKey const&>((uint64_t *)&v26, &v36);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v27 = v21;
      v31.var0.var0 = v23 + a6;
      memset(&v31.var0.var1, 0, 24);
      std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v31.var0.var1, (uint64_t)v26, v21, 0xCCCCCCCCCCCCCCCDLL * ((v21 - (uint64_t)v26) >> 4));
      std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::vector<MTLHashKey>>>(v22 + 176, &v31.var0.var0, (uint64_t)&v31);
      p_unint64_t var1 = (void **)&v31.var0.var1;
      std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](&p_var1);
      v31.var0.var0 = (unint64_t)&v26;
      uint64_t v24 = (void ***)&v31;
    }
    std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](v24);
    MTLHashKey::~MTLHashKey(&v36);
  }
  return !v10;
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_3(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = (void **)(*(void *)(a1 + 32) + 264);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 272);
  unint64_t v6 = (unint64_t)v4[2];
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = ((char *)v5 - (unsigned char *)*v4) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v6 - (void)*v4;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v4 + 2), v11);
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(void *)unint64_t v13 = a2;
    v7 = v13 + 8;
    uint64_t v16 = (char *)*v4;
    uint64_t v15 = (char *)v4[1];
    if (v15 != *v4)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      uint64_t v15 = (char *)*v4;
    }
    *uint64_t v4 = v13;
    v4[1] = v7;
    v4[2] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *uint64_t v5 = a2;
    v7 = v5 + 1;
  }
  v4[1] = v7;
  unsigned int v18 = a2[2];
  if (v18 != -1)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    if (v18 <= *(_DWORD *)(v19 + 56)) {
      unsigned int v18 = *(_DWORD *)(v19 + 56);
    }
    *(_DWORD *)(v19 + 56) = v18;
  }
  unsigned int v20 = a2[4];
  if (v20 != -1)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (v20 <= *(_DWORD *)(v21 + 56)) {
      unsigned int v20 = *(_DWORD *)(v21 + 56);
    }
    *(_DWORD *)(v21 + 56) = v20;
  }
  unsigned int v22 = a2[6];
  if (v22 != -1)
  {
    uint64_t v23 = *(void *)(a1 + 32);
    if (v22 <= *(_DWORD *)(v23 + 56)) {
      unsigned int v22 = *(_DWORD *)(v23 + 56);
    }
    *(_DWORD *)(v23 + 56) = v22;
  }
  return 1;
}

void __54___MTLBinaryArchive_initWithOptions_device_url_error___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (_MTLIsInternalBuild()) {
    BOOL v0 = MTLGetEnvDefault("MTL_DEBUG_PRINT_BINARY_ARCHIVE_URL_LOAD_ERRORS", 0) != 0;
  }
  else {
    BOOL v0 = 0;
  }
  int v1 = v0 | -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL;
  -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL = v1;
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315138;
      uint64_t v3 = "MTL_DEBUG_PRINT_BINARY_ARCHIVE_URL_LOAD_ERRORS";
      _os_log_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s was set, printing errors/faults from loading from URL.", (uint8_t *)&v2, 0xCu);
    }
  }
}

uint64_t __51___MTLBinaryArchive_archiveTypeAtURL_device_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + v4;
  }
  else {
    return 0;
  }
}

uint64_t __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (_OWORD *)a1[9];
  *(void *)(*(void *)(a1[4] + 8) + 24) = a1[8] + a4;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a5;
  long long v6 = *(_OWORD *)(a3 + 24);
  *uint64_t v5 = *(_OWORD *)(a3 + 8);
  v5[1] = v6;
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void *)(a3 + 64);
  *(void *)(a3 + 64) = *(void *)(v7 + 40);
  *(void *)(v7 + 40) = v8;
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void *)(a3 + 72);
  *(void *)(a3 + 72) = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v10;
  return 1;
}

uint64_t __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) length]) {
    return [*(id *)(*(void *)(a1 + 32) + 48) bytes] + v4;
  }
  else {
    return 0;
  }
}

void __42___MTLBinaryArchive_formattedDescription___block_invoke(uint64_t a1)
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [@"\n" stringByPaddingToLength:*(void *)(a1 + 48) + 4 withString:@" " startingAtIndex:0];
  uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) retainedLabel];
  uint64_t v4 = NSString;
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)_MTLBinaryArchive;
  id v5 = objc_msgSendSuper2(&v7, sel_description);
  v8[0] = v2;
  v8[1] = @"label =";
  long long v6 = @"<none>";
  if (v3) {
    long long v6 = v3;
  }
  v8[2] = v6;
  v8[3] = v2;
  v8[4] = @"count =";
  void v8[5] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(*(void *)(a1 + 32) + 304) + objc_msgSend(*(id *)(*(void *)(a1 + 32) + 376), "count"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v4 stringWithFormat:@"%@%@", v5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 6), "componentsJoinedByString:", @" "];
}

uint64_t __63___MTLBinaryArchive_getSpecializedFunctionArchivesToSerialize___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(*(void **)(a1 + 32), (unint64_t *)a2)|| (uint64_t v6 = *(void *)(a1 + 32), v7 = *(_OWORD *)(a2 + 16), v10[0] = *(_OWORD *)a2, v10[1] = v7, v11 = a3, std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v6, (unint64_t *)v10, (uint64_t)v10), (v8 & 1) == 0))
  {
    dispatch_release(a3);
  }
  return 1;
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke(uint64_t a1)
{
  int64_t v2 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, *(void **)(*(void *)(a1 + 32) + 24), 0);
  uint64_t v3 = (std::__shared_weak_count *)operator new(0x30uLL);
  v3->__shared_weak_owners_ = 0;
  v3->__shared_owners_ = 0;
  v3[1].__vftable = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECAC4880;
  v3[1].__shared_owners_ = 0;
  v3[1].__shared_weak_owners_ = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x4812000000;
  uint64_t v37 = __Block_byref_object_copy__200;
  uint64_t v38 = __Block_byref_object_dispose__201;
  uint64_t v39 = &unk_1828FE28A;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_203;
  block[3] = &unk_1ECAC4A80;
  long long v25 = v4;
  int64_t v33 = v2;
  uint64_t v26 = &v50;
  uint64_t v27 = &v34;
  MTLHashKey v31 = v3 + 1;
  uint64_t v32 = v3;
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v28 = *(void *)(a1 + 48);
  uint64_t v29 = &v46;
  long long v30 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v51 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "path"), "stringByDeletingLastPathComponent");
    uint64_t v8 = [v7 stringByAppendingFormat:@"/%@.metallib", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")];
    uint64_t v9 = (v35[7] - v35[6]) >> 3;
    uint64_t v43 = v35[6];
    uint64_t v44 = v9;
    uint64_t v45 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) compiler];
    uint64_t v11 = v47[3];
    unsigned int v22 = v3 + 1;
    uint64_t v23 = v3;
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v12 + 704);
    unint64_t v13 = *(std::__shared_weak_count **)(v12 + 712);
    uint64_t v21 = v13;
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v12 = *(void *)(a1 + 32);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3321888768;
    v15[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_213;
    v15[3] = &unk_1ECAC4A48;
    v15[7] = v8;
    v15[8] = &v46;
    unsigned int v18 = v3 + 1;
    uint64_t v19 = v3;
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    v15[9] = &v34;
    v15[4] = v12;
    v15[5] = v6;
    uint64_t v14 = *(void *)(a1 + 48);
    v15[6] = *(void *)(a1 + 40);
    long long v16 = *(_OWORD *)(a1 + 56);
    uint64_t v17 = v14;
    [v10 generateMachOWithID:v11 binaryEntries:&v22 machOSpecializedData:&v43 machOType:0 Path:v8 platform:(v2 << 32) | (v2 >> 32) bitcodeList:&v20 completionHandler:v15];
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  _Block_object_dispose(&v34, 8);
  if (v40)
  {
    uint64_t v41 = v40;
    operator delete(v40);
  }
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

id __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_203(uint64_t a1)
{
  int64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = 392;
  long long v4 = (void *)v2[49];
  if (v4)
  {
    id result = (id)objc_msgSend(v4, "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
    int64_t v2 = *(void **)(a1 + 32);
  }
  else
  {
    id result = 0;
  }
  BOOL v6 = v2[40] == v2[39] && v2[111] == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  long long v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v7[28] != v7[27];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 216);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 224);
    if (v8 == v9) {
      char v10 = 1;
    }
    else {
      char v10 = (char)result;
    }
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      id result = (id)objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", *(void *)(*(void *)(a1 + 32) + 392)), 0, 0, 0, *(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = (_BYTE)result;
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 216);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 224);
    }
    if (v8 == v9)
    {
      id result = newErrorWithMessage(&cfstr_NothingToSeria.isa, MTLBinaryArchiveErrorCompilationFailure);
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = result;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
    return result;
  }
  uint64_t v12 = *(std::__shared_weak_count **)(a1 + 104);
  uint64_t v106 = *(void *)(a1 + 96);
  v107 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v7 materializeAirNTAllForSlice:a1 + 112 entryList:&v106];
  if (v107) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v107);
  }
  unint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(std::__shared_weak_count **)(a1 + 104);
  uint64_t v104 = *(void *)(a1 + 96);
  v105 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v13 materializeAirNTFromOnlineForSlice:a1 + 112 entryList:&v104];
  if (v105) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v105);
  }
  uint64_t v15 = *(void *)(a1 + 32);
  *(_OWORD *)__p = 0u;
  long long v102 = 0u;
  float v103 = 1.0;
  long long v16 = *(unsigned int ***)(v15 + 264);
  uint64_t v17 = *(unsigned int ***)(v15 + 272);
  if (v16 != v17)
  {
    uint64_t v100 = v15;
    while (1)
    {
      unsigned int v18 = *v16;
      unint64_t v19 = **v16;
      switch((int)v19)
      {
        case 0:
          uint64_t v20 = *((unsigned __int8 *)v18 + 32);
          if ((v20 & 0xA) == 0)
          {
            unsigned int v21 = v18[2];
            if (v21 != -1) {
              v18[2] = *(_DWORD *)(v100 + 56) + v21;
            }
          }
          if ((v20 & 9) == 0)
          {
            unsigned int v22 = v18[4];
            if (v22 != -1) {
              v18[4] = *(_DWORD *)(v100 + 56) + v22;
            }
          }
          if ((v20 & 2) != 0)
          {
            unint64_t v45 = *((void *)v18 + 1);
            unint64_t v46 = HIDWORD(v45);
            unint64_t v47 = 0x9DDFEA08EB382D69 * (((8 * v45) + 8) ^ HIDWORD(v45));
            unint64_t v23 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v46 ^ (v47 >> 47) ^ v47)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v46 ^ (v47 >> 47) ^ v47)) >> 47));
          }
          else
          {
            unint64_t v23 = v18[2];
          }
          unint64_t v48 = ((v19 << 6) + 2654435769u + (v19 >> 2) + (v20 & 0xFFFFFFFFFFFFFFF7)) ^ v19;
          unint64_t v26 = ((v48 << 6) + 2654435769u + (v48 >> 2) + v23) ^ v48;
          if (v20)
          {
            unint64_t v44 = *((void *)v18 + 2);
            goto LABEL_66;
          }
          unint64_t v27 = v18[4];
          goto LABEL_67;
        case 1:
          uint64_t v37 = *((unsigned __int8 *)v18 + 32);
          if ((v37 & 0xA) == 0)
          {
            unsigned int v38 = v18[2];
            if (v38 != -1) {
              v18[2] = *(_DWORD *)(v100 + 56) + v38;
            }
          }
          unint64_t v26 = ((v19 << 6) + 2654435769u + (v19 >> 2) + (v37 & 0xFFFFFFFFFFFFFFF7)) ^ v19;
          if ((v37 & 2) != 0)
          {
            unint64_t v49 = *((void *)v18 + 1);
            unint64_t v50 = HIDWORD(v49);
            unint64_t v51 = 0x9DDFEA08EB382D69 * (((8 * v49) + 8) ^ HIDWORD(v49));
            unint64_t v27 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v50 ^ (v51 >> 47) ^ v51)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v50 ^ (v51 >> 47) ^ v51)) >> 47));
          }
          else
          {
            unint64_t v27 = v18[2];
          }
          goto LABEL_67;
        case 2:
          uint64_t v24 = *((unsigned __int8 *)v18 + 32);
          if ((v24 & 0xA) == 0)
          {
            unsigned int v25 = v18[2];
            if (v25 != -1) {
              v18[2] = *(_DWORD *)(v100 + 56) + v25;
            }
          }
          unint64_t v26 = ((v19 << 6) + 2654435769u + (v19 >> 2) + (v24 & 0xFFFFFFFFFFFFFFF7)) ^ v19;
          if ((v24 & 2) != 0) {
            goto LABEL_60;
          }
          goto LABEL_38;
        case 3:
          uint64_t v28 = *((unsigned __int8 *)v18 + 32);
          if ((v28 & 0xA) == 0)
          {
            unsigned int v29 = v18[4];
            if (v29 != -1) {
              v18[4] = *(_DWORD *)(v100 + 56) + v29;
            }
          }
          if ((v28 & 9) == 0)
          {
            unsigned int v30 = v18[6];
            if (v30 != -1) {
              v18[6] = *(_DWORD *)(v100 + 56) + v30;
            }
          }
          if ((v28 & 0xC) == 0)
          {
            unsigned int v31 = v18[2];
            if (v31 != -1) {
              v18[2] = *(_DWORD *)(v100 + 56) + v31;
            }
          }
          if ((v28 & 2) != 0)
          {
            unint64_t v39 = *((void *)v18 + 2);
            unint64_t v40 = HIDWORD(v39);
            unint64_t v41 = 0x9DDFEA08EB382D69 * (((8 * v39) + 8) ^ HIDWORD(v39));
            unint64_t v32 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
            if (v28)
            {
LABEL_50:
              unint64_t v33 = *((void *)v18 + 3);
              unint64_t v34 = HIDWORD(v33);
              unint64_t v35 = 0x9DDFEA08EB382D69 * (((8 * v33) + 8) ^ HIDWORD(v33));
              unint64_t v36 = 0x9DDFEA08EB382D69
                  * ((0x9DDFEA08EB382D69 * (v34 ^ (v35 >> 47) ^ v35)) ^ ((0x9DDFEA08EB382D69
                                                                          * (v34 ^ (v35 >> 47) ^ v35)) >> 47));
              goto LABEL_59;
            }
          }
          else
          {
            unint64_t v32 = v18[4];
            if (v28) {
              goto LABEL_50;
            }
          }
          unint64_t v36 = v18[6];
LABEL_59:
          unint64_t v42 = ((v19 << 6) + 2654435769u + (v19 >> 2) + (v28 & 0xFFFFFFFFFFFFFFF7)) ^ v19;
          unint64_t v43 = ((v42 << 6) + 2654435769u + (v42 >> 2) + v32) ^ v42;
          unint64_t v26 = ((v43 << 6) + 2654435769u + (v43 >> 2) + v36) ^ v43;
          if ((v28 & 4) != 0)
          {
LABEL_60:
            unint64_t v44 = *((void *)v18 + 1);
LABEL_66:
            unint64_t v52 = HIDWORD(v44);
            unint64_t v53 = 0x9DDFEA08EB382D69 * (((8 * v44) + 8) ^ HIDWORD(v44));
            unint64_t v27 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v52 ^ (v53 >> 47) ^ v53)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v52 ^ (v53 >> 47) ^ v53)) >> 47));
          }
          else
          {
LABEL_38:
            unint64_t v27 = v18[2];
          }
LABEL_67:
          unint64_t v54 = ((v26 << 6) + 2654435769u + (v26 >> 2) + v27) ^ v26;
          unint64_t v55 = (unint64_t)__p[1];
          if (__p[1])
          {
            uint8x8_t v56 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
            v56.i16[0] = vaddlv_u8(v56);
            if (v56.u32[0] > 1uLL)
            {
              uint64_t v3 = ((v26 << 6) + 2654435769u + (v26 >> 2) + v27) ^ v26;
              if ((void *)v54 >= __p[1]) {
                uint64_t v3 = v54 % (unint64_t)__p[1];
              }
            }
            else
            {
              uint64_t v3 = ((unint64_t)__p[1] - 1) & v54;
            }
            v57 = (void *)*((void *)__p[0] + v3);
            if (v57)
            {
              for (i = (void *)*v57; i; i = (void *)*i)
              {
                unint64_t v59 = i[1];
                if (v59 == v54)
                {
                  uint64_t v60 = i[2];
                  if (*(_DWORD *)v60 == v19)
                  {
                    switch((int)v19)
                    {
                      case 0:
                        if ((*(unsigned char *)(v60 + 32) & 2) != 0)
                        {
                          if (*(void *)(v60 + 8) != *((void *)v18 + 1)) {
                            continue;
                          }
                        }
                        else if (*(_DWORD *)(v60 + 8) != v18[2])
                        {
                          continue;
                        }
                        if ((*(unsigned char *)(v60 + 32) & 1) == 0)
                        {
                          int v61 = *(_DWORD *)(v60 + 16);
                          unsigned int v62 = v18[4];
LABEL_79:
                          if (v61 == v62) {
                            goto LABEL_106;
                          }
                          continue;
                        }
                        uint64_t v63 = *(void *)(v60 + 16);
                        uint64_t v64 = *((void *)v18 + 2);
LABEL_105:
                        if (v63 == v64)
                        {
LABEL_106:
                          MEMORY[0x18530C140](v18, 0x1022C405FDF33A9);
                          goto LABEL_179;
                        }
                        break;
                      case 1:
                      case 2:
                        if ((*(unsigned char *)(v60 + 32) & 2) == 0) {
                          goto LABEL_78;
                        }
                        goto LABEL_104;
                      case 3:
                        if ((*(unsigned char *)(v60 + 32) & 2) != 0)
                        {
                          if (*(void *)(v60 + 16) != *((void *)v18 + 2)) {
                            continue;
                          }
                        }
                        else if (*(_DWORD *)(v60 + 16) != v18[4])
                        {
                          continue;
                        }
                        if (*(unsigned char *)(v60 + 32))
                        {
                          if (*(void *)(v60 + 24) != *((void *)v18 + 3)) {
                            continue;
                          }
                        }
                        else if (*(_DWORD *)(v60 + 24) != v18[6])
                        {
                          continue;
                        }
                        if ((*(unsigned char *)(v60 + 32) & 4) == 0)
                        {
LABEL_78:
                          int v61 = *(_DWORD *)(v60 + 8);
                          unsigned int v62 = v18[2];
                          goto LABEL_79;
                        }
LABEL_104:
                        uint64_t v63 = *(void *)(v60 + 8);
                        uint64_t v64 = *((void *)v18 + 1);
                        goto LABEL_105;
                      default:
                        continue;
                    }
                  }
                }
                else
                {
                  if (v56.u32[0] > 1uLL)
                  {
                    if ((void *)v59 >= __p[1]) {
                      v59 %= (unint64_t)__p[1];
                    }
                  }
                  else
                  {
                    v59 &= (unint64_t)__p[1] - 1;
                  }
                  if (v59 != v3) {
                    break;
                  }
                }
              }
            }
          }
          v65 = operator new(0x18uLL);
          void *v65 = 0;
          v65[1] = v54;
          v65[2] = v18;
          float v66 = (float)(unint64_t)(*((void *)&v102 + 1) + 1);
          if (v55 && (float)(v103 * (float)v55) >= v66) {
            goto LABEL_153;
          }
          BOOL v67 = (v55 & (v55 - 1)) == 0;
          if (v55 < 3) {
            BOOL v67 = 0;
          }
          unint64_t v68 = (2 * v55) | !v67;
          unint64_t v69 = vcvtps_u32_f32(v66 / v103);
          if (v68 <= v69) {
            int8x8_t prime = (int8x8_t)v69;
          }
          else {
            int8x8_t prime = (int8x8_t)v68;
          }
          if (*(void *)&prime == 1)
          {
            int8x8_t prime = (int8x8_t)2;
          }
          else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
          {
            int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            unint64_t v55 = (unint64_t)__p[1];
          }
          if (*(void *)&prime > v55) {
            goto LABEL_119;
          }
          if (*(void *)&prime >= v55) {
            goto LABEL_148;
          }
          unint64_t v77 = vcvtps_u32_f32((float)*((unint64_t *)&v102 + 1) / v103);
          if (v55 < 3 || (uint8x8_t v78 = (uint8x8_t)vcnt_s8((int8x8_t)v55), v78.i16[0] = vaddlv_u8(v78), v78.u32[0] > 1uLL))
          {
            unint64_t v77 = std::__next_prime(v77);
          }
          else
          {
            uint64_t v79 = 1 << -(char)__clz(v77 - 1);
            if (v77 >= 2) {
              unint64_t v77 = v79;
            }
          }
          if (*(void *)&prime <= v77) {
            int8x8_t prime = (int8x8_t)v77;
          }
          if (*(void *)&prime >= v55)
          {
            unint64_t v55 = (unint64_t)__p[1];
          }
          else
          {
            if (!*(void *)&prime)
            {
              v98 = __p[0];
              __p[0] = 0;
              if (v98) {
                operator delete(v98);
              }
              unint64_t v55 = 0;
              __p[1] = 0;
              goto LABEL_148;
            }
LABEL_119:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v71 = operator new(8 * *(void *)&prime);
            v72 = __p[0];
            __p[0] = v71;
            if (v72) {
              operator delete(v72);
            }
            uint64_t v73 = 0;
            __p[1] = (void *)prime;
            do
              *((void *)__p[0] + v73++) = 0;
            while (*(void *)&prime != v73);
            v74 = (void **)v102;
            if ((void)v102)
            {
              unint64_t v75 = *(void *)(v102 + 8);
              uint8x8_t v76 = (uint8x8_t)vcnt_s8(prime);
              v76.i16[0] = vaddlv_u8(v76);
              if (v76.u32[0] > 1uLL)
              {
                if (v75 >= *(void *)&prime) {
                  v75 %= *(void *)&prime;
                }
              }
              else
              {
                v75 &= *(void *)&prime - 1;
              }
              *((void *)__p[0] + v75) = &v102;
              for (j = *v74; j; unint64_t v75 = v81)
              {
                unint64_t v81 = j[1];
                if (v76.u32[0] > 1uLL)
                {
                  if (v81 >= *(void *)&prime) {
                    v81 %= *(void *)&prime;
                  }
                }
                else
                {
                  v81 &= *(void *)&prime - 1;
                }
                if (v81 != v75)
                {
                  if (!*((void *)__p[0] + v81))
                  {
                    *((void *)__p[0] + v81) = v74;
                    goto LABEL_144;
                  }
                  *v74 = (void *)*j;
                  void *j = **((void **)__p[0] + v81);
                  **((void **)__p[0] + v81) = j;
                  j = v74;
                }
                unint64_t v81 = v75;
LABEL_144:
                v74 = (void **)j;
                j = (void *)*j;
              }
            }
            unint64_t v55 = (unint64_t)prime;
          }
LABEL_148:
          if ((v55 & (v55 - 1)) != 0)
          {
            if (v54 >= v55) {
              uint64_t v3 = v54 % v55;
            }
            else {
              uint64_t v3 = v54;
            }
          }
          else
          {
            uint64_t v3 = (v55 - 1) & v54;
          }
LABEL_153:
          v82 = __p[0];
          v83 = (void *)*((void *)__p[0] + v3);
          if (v83)
          {
            void *v65 = *v83;
          }
          else
          {
            void *v65 = v102;
            *(void *)&long long v102 = v65;
            v82[v3] = &v102;
            if (!*v65) {
              goto LABEL_162;
            }
            unint64_t v84 = *(void *)(*v65 + 8);
            if ((v55 & (v55 - 1)) != 0)
            {
              if (v84 >= v55) {
                v84 %= v55;
              }
            }
            else
            {
              v84 &= v55 - 1;
            }
            v83 = (char *)__p[0] + 8 * v84;
          }
          void *v83 = v65;
LABEL_162:
          ++*((void *)&v102 + 1);
          uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
          v85 = *(unsigned int ***)(v3 + 56);
          unint64_t v86 = *(void *)(v3 + 64);
          if ((unint64_t)v85 >= v86)
          {
            uint64_t v88 = *(void *)(v3 + 48);
            uint64_t v89 = ((uint64_t)v85 - v88) >> 3;
            if ((unint64_t)(v89 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v90 = v86 - v88;
            uint64_t v91 = v90 >> 2;
            if (v90 >> 2 <= (unint64_t)(v89 + 1)) {
              uint64_t v91 = v89 + 1;
            }
            if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v92 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v92 = v91;
            }
            if (v92) {
              v93 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(v3 + 64, v92);
            }
            else {
              v93 = 0;
            }
            v94 = &v93[8 * v89];
            *(void *)v94 = v18;
            v87 = v94 + 8;
            v96 = *(char **)(v3 + 48);
            v95 = *(char **)(v3 + 56);
            if (v95 != v96)
            {
              do
              {
                uint64_t v97 = *((void *)v95 - 1);
                v95 -= 8;
                *((void *)v94 - 1) = v97;
                v94 -= 8;
              }
              while (v95 != v96);
              v95 = *(char **)(v3 + 48);
            }
            *(void *)(v3 + 48) = v94;
            *(void *)(v3 + 56) = v87;
            *(void *)(v3 + 64) = &v93[8 * v92];
            if (v95) {
              operator delete(v95);
            }
          }
          else
          {
            *v85 = v18;
            v87 = v85 + 1;
          }
          *(void *)(v3 + 56) = v87;
LABEL_179:
          if (++v16 == v17)
          {
            uint64_t v15 = *(void *)(a1 + 32);
            goto LABEL_190;
          }
          break;
        default:
          unint64_t v27 = (_BYTE)v18[8] & 0xF7;
          unint64_t v26 = **v16;
          goto LABEL_67;
      }
    }
  }
LABEL_190:
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear(v15 + 648);
  *(void *)(*(void *)(a1 + 32) + 272) = *(void *)(*(void *)(a1 + 32) + 264);
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = MTLMetalScriptBuilder::newSerializedMetalScript(*(MTLMetalScriptBuilder **)(*(void *)(a1 + 32) + 696));
  *(void *)(*(void *)(a1 + 32) + 888) = 0;
  v99 = *(const char **)(*(void *)(a1 + 32) + 64);
  if (v99)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = strdup(v99);
    free(*(void **)(*(void *)(a1 + 32) + 64));
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
  return (id)std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)__p);
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_213(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v4) {
    free(v4);
  }
  id v5 = *(uint64_t **)(a1 + 104);
  uint64_t v6 = *v5;
  if (v5[1] != *v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(NSObject **)(v6 + v7 + 32);
      if (v9) {
        dispatch_release(v9);
      }
      char v10 = *(NSObject **)(v6 + v7 + 16);
      if (v10) {
        dispatch_release(v10);
      }
      uint64_t v11 = *(NSObject **)(v6 + v7 + 24);
      if (v11) {
        dispatch_release(v11);
      }
      uint64_t v12 = *(NSObject **)(v6 + v7 + 40);
      if (v12) {
        dispatch_release(v12);
      }
      unint64_t v13 = *(MTLHashKey **)(v6 + v7 + 8);
      if (v13)
      {
        MTLHashKey::~MTLHashKey(v13);
        MEMORY[0x18530C140]();
      }
      ++v8;
      uint64_t v14 = *(uint64_t **)(a1 + 104);
      uint64_t v6 = *v14;
      v7 += 72;
    }
    while (v8 < 0x8E38E38E38E38E39 * ((v14[1] - *v14) >> 3));
  }
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void *)(v16 + 56);
  if (v17 != *(void *)(v16 + 48))
  {
    unint64_t v18 = 0;
    uint64_t v17 = *(void *)(v16 + 48);
    do
    {
      uint64_t v19 = *(void *)(v17 + 8 * v18);
      if (v19)
      {
        MEMORY[0x18530C140](v19, 0x1022C405FDF33A9);
        uint64_t v15 = *(void *)(a1 + 72);
      }
      ++v18;
      uint64_t v16 = *(void *)(v15 + 8);
      uint64_t v17 = *(void *)(v16 + 48);
    }
    while (v18 < (*(void *)(v16 + 56) - v17) >> 3);
  }
  *(void *)(v16 + 56) = v17;
  uint64_t v20 = *(void *)(a1 + 32);
  unsigned int v21 = *(NSObject **)(v20 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_2;
  block[3] = &unk_1E521FB58;
  long long v26 = *(_OWORD *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 56);
  long long v29 = *(_OWORD *)(a1 + 80);
  uint64_t v23 = *(void *)(a1 + 96);
  uint64_t v27 = v22;
  uint64_t v28 = v20;
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v30 = v23;
  uint64_t v31 = v24;
  uint64_t v32 = a2;
  dispatch_sync(v21, block);
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (*(void *)v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v3)
    {
      dispatch_release(v3);
      uint64_t v2 = *(void *)(a1 + 96);
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = newErrorWithMessage(*(NSString **)(v2 + 8), MTLBinaryArchiveErrorCompilationFailure);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", *(void *)(a1 + 48), 0), 0, 0, 0, *(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(NSObject **)(v5 + 640);
      if (v6)
      {
        dispatch_release(v6);
        uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v5 = *(void *)(a1 + 56);
      }
      *(void *)(v5 + 640) = v4;
    }
  }
  uint64_t v7 = (const std::__fs::filesystem::path *)[*(id *)(a1 + 48) UTF8String];
  remove(v7, v8);
  [*(id *)(*(void *)(a1 + 56) + 376) removeAllObjects];
  [*(id *)(*(void *)(a1 + 56) + 376) addEntriesFromDictionary:*(void *)(*(void *)(a1 + 56) + 384)];
  [*(id *)(*(void *)(a1 + 56) + 384) removeAllObjects];
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear(*(void *)(a1 + 56) + 96);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(v9 + 224);
  if (v10 != *(void *)(v9 + 216))
  {
    unint64_t v11 = 0;
    uint64_t v10 = *(void *)(v9 + 216);
    do
    {
      uint64_t v12 = *(MTLAirNTObject **)(v10 + 8 * v11);
      if (v12)
      {
        MTLAirNTObject::~MTLAirNTObject(v12);
        MEMORY[0x18530C140]();
        uint64_t v9 = *(void *)(a1 + 56);
      }
      ++v11;
      uint64_t v10 = *(void *)(v9 + 216);
    }
    while (v11 < (*(void *)(v9 + 224) - v10) >> 3);
  }
  *(void *)(v9 + 224) = v10;
  *(void *)(*(void *)(a1 + 56) + 248) = *(void *)(*(void *)(a1 + 56) + 240);
  [*(id *)(a1 + 56) clearLibCache];
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(MTLLoadedFile **)(v13 + 40);
  if (v14)
  {
    -[MTLLoader releaseLoadedFile:](*(void *)(*(void *)(v13 + 24) + 472), v14);
    uint64_t v13 = *(void *)(a1 + 56);
  }
  *(void *)(v13 + 40) = 0;

  *(void *)(*(void *)(a1 + 56) + 48) = 0;
  if (([*(id *)(a1 + 56) recompilationTarget] & 1) == 0)
  {
    uint64_t v15 = *(void *)(a1 + 56);
    if (*(_DWORD *)(v15 + 56) || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v16 = *(uint64_t **)(v15 + 264);
      uint64_t v17 = *(uint64_t **)(v15 + 272);
      if (v16 != v17)
      {
        do
        {
          uint64_t v18 = *v16;
          uint64_t v19 = *(void **)(*(void *)(a1 + 88) + 8);
          uint64_t v20 = (void *)v19[7];
          unint64_t v21 = v19[8];
          if ((unint64_t)v20 >= v21)
          {
            uint64_t v23 = v19[6];
            uint64_t v24 = ((uint64_t)v20 - v23) >> 3;
            if ((unint64_t)(v24 + 1) >> 61) {
LABEL_61:
            }
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            uint64_t v25 = v21 - v23;
            uint64_t v26 = v25 >> 2;
            if (v25 >> 2 <= (unint64_t)(v24 + 1)) {
              uint64_t v26 = v24 + 1;
            }
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v27 = v26;
            }
            if (v27) {
              uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v19 + 8), v27);
            }
            else {
              uint64_t v28 = 0;
            }
            long long v29 = &v28[8 * v24];
            *(void *)long long v29 = v18;
            uint64_t v22 = v29 + 8;
            uint64_t v31 = (char *)v19[6];
            uint64_t v30 = (char *)v19[7];
            if (v30 != v31)
            {
              do
              {
                uint64_t v32 = *((void *)v30 - 1);
                v30 -= 8;
                *((void *)v29 - 1) = v32;
                v29 -= 8;
              }
              while (v30 != v31);
              uint64_t v30 = (char *)v19[6];
            }
            v19[6] = v29;
            v19[7] = v22;
            v19[8] = &v28[8 * v27];
            if (v30) {
              operator delete(v30);
            }
          }
          else
          {
            *uint64_t v20 = v18;
            uint64_t v22 = v20 + 1;
          }
          v19[7] = v22;
          ++v16;
        }
        while (v16 != v17);
        uint64_t v15 = *(void *)(a1 + 56);
        uint64_t v16 = *(uint64_t **)(v15 + 264);
      }
      *(void *)(v15 + 272) = v16;
      *(unsigned char *)(*(void *)(a1 + 56) + 72) = 1;
      [*(id *)(a1 + 56) loadFromURL:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
      uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8);
      unint64_t v34 = *(uint64_t **)(v33 + 48);
      for (i = *(uint64_t **)(v33 + 56); v34 != i; ++v34)
      {
        uint64_t v36 = *v34;
        uint64_t v37 = (void **)(*(void *)(a1 + 56) + 264);
        unsigned int v38 = *(void **)(*(void *)(a1 + 56) + 272);
        unint64_t v39 = *(void *)(*(void *)(a1 + 56) + 280);
        if ((unint64_t)v38 >= v39)
        {
          uint64_t v41 = ((char *)v38 - (unsigned char *)*v37) >> 3;
          if ((unint64_t)(v41 + 1) >> 61) {
            goto LABEL_61;
          }
          uint64_t v42 = v39 - (void)*v37;
          uint64_t v43 = v42 >> 2;
          if (v42 >> 2 <= (unint64_t)(v41 + 1)) {
            uint64_t v43 = v41 + 1;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v43;
          }
          if (v44) {
            unint64_t v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(void *)(a1 + 56) + 280, v44);
          }
          else {
            unint64_t v45 = 0;
          }
          unint64_t v46 = &v45[8 * v41];
          *(void *)unint64_t v46 = v36;
          unint64_t v40 = v46 + 8;
          unint64_t v48 = (char *)*v37;
          unint64_t v47 = (char *)v37[1];
          if (v47 != *v37)
          {
            do
            {
              uint64_t v49 = *((void *)v47 - 1);
              v47 -= 8;
              *((void *)v46 - 1) = v49;
              v46 -= 8;
            }
            while (v47 != v48);
            unint64_t v47 = (char *)*v37;
          }
          *uint64_t v37 = v46;
          v37[1] = v40;
          v37[2] = &v45[8 * v44];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *unsigned int v38 = v36;
          unint64_t v40 = v38 + 1;
        }
        v37[1] = v40;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    unint64_t v50 = *(void **)(*(void *)(a1 + 56) + 392);
    if (v50) {

    }
    *(void *)(*(void *)(a1 + 56) + 392) = objc_msgSend([NSString alloc], "initWithString:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
  }
}

void __89___MTLBinaryArchive_newRecompiledFunctionWithAIRNTObject_index_destinationArchive_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) getLibraryInArchiveAtPos:*(void *)(a1 + 56) atIndex:*(unsigned int *)(a1 + 64) error:*(void *)(a1 + 72)];
  if (v2)
  {
    uint64_t v3 = v2;
    if (([v2 isStub] & 1) == 0)
    {
      uint64_t v4 = [v3 newFunctionWithHash:*(void *)(*(void *)(**(void **)(a1 + 56) + 8 * *(void *)(a1 + 64)) + 24)];
      if (v4)
      {
        id v5 = (id)v4;
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) recompileFunction:v4 inLibrary:v3 toArchive:*(void *)(a1 + 40) toBinary:0 error:*(void *)(a1 + 72)];
      }
      else if (*(void *)(a1 + 72))
      {
        **(void **)(a1 + 72) = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"Failed to find the requested function hash in the binary archive"], MTLBinaryArchiveErrorInvalidFile);
      }
    }
  }
}

uint64_t __55___MTLBinaryArchive_recompileStatelessToArchive_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) getLibraryInArchiveAtPos:*(void *)(a1 + 56) atIndex:0 error:*(void *)(a1 + 64)];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = [(id)result isStub];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) newFunctionWithHash:*(void *)(***(void ***)(a1 + 56) + 24)];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        if (*(void *)(a1 + 64))
        {
          uint64_t result = (uint64_t)newErrorWithMessage((NSString *)[NSString stringWithFormat:@"Failed to find the requested function hash in the binary archive"], MTLBinaryArchiveErrorInvalidFile);
          **(void **)(a1 + 64) = result;
        }
      }
    }
  }
  return result;
}

uint64_t __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  uint64_t v6 = a1[6];
  *(void *)(*(void *)(a1[5] + 8) + 24) += a3;
  uint64_t v7 = (void *)a1[4];

  return [v7 writeData:v5 error:v6];
}

uint64_t __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_278(uint64_t a1)
{
  [*(id *)(a1 + 32) materializeAll];
  [*(id *)(a1 + 32) materializeAllAIRNTLegacy];
  std::vector<MTLLoaderMachOPayload>::reserve((void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), [*(id *)(*(void *)(a1 + 32) + 376) count]);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 376);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_2;
  v4[3] = &unk_1E521FC20;
  long long v5 = *(_OWORD *)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = [a3 data];
  uint64_t v7 = (long long *)[a2 value];
  long long v31 = *v7;
  long long v32 = v7[1];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [a3 importedLibraries];
  uint64_t v10 = [a3 importedSymbols];
  int v11 = (*(unsigned __int8 *)(a1 + 48) >> 1) & 1;
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v13 = v12[7];
  unint64_t v14 = v12[8];
  if (v13 >= v14)
  {
    uint64_t v16 = v12[6];
    uint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v13 - v16) >> 4);
    unint64_t v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) > 0x249249249249249) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v19 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v14 - v16) >> 4);
    if (2 * v19 > v18) {
      unint64_t v18 = 2 * v19;
    }
    if (v19 >= 0x124924924924924) {
      unint64_t v20 = 0x249249249249249;
    }
    else {
      unint64_t v20 = v18;
    }
    if (v20) {
      unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)(v12 + 8), v20);
    }
    else {
      unint64_t v21 = 0;
    }
    uint64_t v22 = &v21[112 * v17];
    *(_OWORD *)(v22 + 8) = v31;
    uint64_t v23 = &v21[112 * v20];
    *(void *)uint64_t v22 = v6;
    *(_OWORD *)(v22 + 24) = v32;
    v22[40] = v11;
    *((_DWORD *)v22 + 11) = 0;
    *(_DWORD *)(v22 + 41) = 0;
    *((void *)v22 + 6) = v8;
    *((void *)v22 + 7) = 0;
    *((void *)v22 + 8) = v9;
    *((void *)v22 + 9) = v10;
    *((_OWORD *)v22 + 5) = 0u;
    *((_OWORD *)v22 + 6) = 0u;
    uint64_t v15 = v22 + 112;
    uint64_t v25 = (char *)v12[6];
    uint64_t v24 = (char *)v12[7];
    if (v24 != v25)
    {
      do
      {
        long long v26 = *((_OWORD *)v24 - 7);
        long long v27 = *((_OWORD *)v24 - 5);
        *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
        *((_OWORD *)v22 - 5) = v27;
        *((_OWORD *)v22 - 7) = v26;
        long long v28 = *((_OWORD *)v24 - 4);
        long long v29 = *((_OWORD *)v24 - 3);
        long long v30 = *((_OWORD *)v24 - 1);
        *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
        *((_OWORD *)v22 - 1) = v30;
        *((_OWORD *)v22 - 4) = v28;
        *((_OWORD *)v22 - 3) = v29;
        v22 -= 112;
        v24 -= 112;
      }
      while (v24 != v25);
      uint64_t v24 = (char *)v12[6];
    }
    v12[6] = v22;
    v12[7] = v15;
    v12[8] = v23;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    *(_OWORD *)(v13 + 8) = v31;
    *(void *)unint64_t v13 = v6;
    *(_OWORD *)(v13 + 24) = v32;
    *(unsigned char *)(v13 + 40) = v11;
    *(_DWORD *)(v13 + 41) = 0;
    *(_DWORD *)(v13 + 44) = 0;
    *(void *)(v13 + 48) = v8;
    *(void *)(v13 + 56) = 0;
    *(void *)(v13 + 64) = v9;
    *(void *)(v13 + 72) = v10;
    uint64_t v15 = (char *)(v13 + 112);
    *(_OWORD *)(v13 + 80) = 0u;
    *(_OWORD *)(v13 + 96) = 0u;
  }
  v12[7] = v15;
}

uint64_t __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (**(void **)(a1 + 32) != a2 || *(void *)(a1 + 40) != a3) {
    return 0;
  }
  uint64_t v6 = *(uint64_t ***)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56) + a6;
  long long v8 = a4[1];
  v10[0] = *a4;
  v10[1] = v8;
  int v11 = a5;
  uint64_t v12 = v7;
  std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t const,std::pair<unsigned int,unsigned long long>>>(v6, (unint64_t *)v10, v10);
  return 1;
}

uint64_t __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) length]) {
    return [*(id *)(*(void *)(a1 + 32) + 48) bytes] + v4;
  }
  else {
    return 0;
  }
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1[4] + 8) + 24) + a2;
  if ((unint64_t)(v3 + a3) <= a1[5]) {
    return a1[6] + v3;
  }
  else {
    return 0;
  }
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, size_t a5)
{
  if (a2 != **(void **)(a1 + 56) || a3[6] != *(void *)(a1 + 64)) {
    return 0;
  }
  uint64_t v6 = *(uint64_t **)(a1 + 72);
  if (v6)
  {
    uint64_t v7 = *v6;
    uint64_t v8 = v6[1];
    uint64_t v10 = v6[2];
    uint64_t v9 = v6[3];
    BOOL v11 = a3[1] == v7 && a3[2] == v8;
    BOOL v12 = v11 && a3[3] == v10;
    if (v12 && a3[4] == v9) {
      return 1;
    }
  }
  dispatch_data_create_subrange((dispatch_data_t)[*(id *)(a1 + 32) dispatchData], *(void *)(a1 + 80) + a4 + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), a5);
  unint64_t v14 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v14();
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 != **(void **)(a1 + 56) || *(void *)(a1 + 64) != a3) {
    return 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a6;
  return +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

id __25___MTLBinaryArchive_keys__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[60]) {
    [v2 materializeAll];
  }
  else {
    [v2 materializeAllAIRNTLegacy];
  }
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 376) allKeys];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __78___MTLBinaryArchive_MTLBinaryArchiveInternal__addArchiveEntryInternal_forKey___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 60))
  {
    if ((*(unsigned char *)(v2 + 32) & 4) != 0)
    {
      uint64_t v3 = v2 + 728;
      uint64_t v4 = *(long long **)(a1 + 48);
      uint64_t v5 = [*(id *)(a1 + 40) data];
      long long v6 = v4[1];
      long long v14 = *v4;
      long long v15 = v6;
      uint64_t v16 = v5;
      std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v3, (unint64_t *)&v14, (uint64_t)&v14);
      if (v7) {
        dispatch_retain((dispatch_object_t)[*(id *)(a1 + 40) data]);
      }
    }
  }
  else
  {
    uint64_t v8 = v2 + 560;
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(long long **)(a1 + 48);
    long long v11 = v9[1];
    long long v14 = *v9;
    long long v15 = v11;
    uint64_t v16 = v10;
    std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,MTLAirEntry *>>(v8, (unint64_t *)&v14, (uint64_t)&v14);
    if (v12)
    {
      id v13 = *(id *)(a1 + 40);
      ++*(void *)(*(void *)(a1 + 32) + 888);
    }
  }
}

void __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke(uint64_t a1)
{
  uint64_t v2 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((void *)(*(void *)(a1 + 32) + 728), *(unint64_t **)(a1 + 48));
  uint64_t v3 = *(char **)(a1 + 32);
  if (v2 && (uint64_t v4 = v2[6]) != 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4;
    uint64_t v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_retain(v5);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _OWORD v10[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_2;
    v10[3] = &unk_1E521FDF8;
    v10[4] = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_3;
    v9[3] = &unk_1E521FE20;
    v9[4] = v3;
    char v7 = (void *)[v3 materializeEntryForKey:v6 fileIndex:v3 + 768 containsEntry:v10 addEntry:v9];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v7 data];
    uint64_t v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v8) {
      dispatch_retain(v8);
    }
  }
}

BOOL __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_2(uint64_t a1, unint64_t *a2)
{
  return std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((void *)(*(void *)(a1 + 32) + 728), a2) != 0;
}

void __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_3(uint64_t a1, void *a2, _OWORD *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32) + 728;
  uint64_t v6 = [a2 data];
  long long v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  uint64_t v11 = v6;
  std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v5, (unint64_t *)v10, (uint64_t)v10);
  LOBYTE(a3) = v8;
  id v9 = a2;
  if (a3) {
    dispatch_retain((dispatch_object_t)[a2 data]);
  }
}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__addBinaryEntryInternal_forKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addBinaryEntryImpl:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 64))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    uint64_t v3 = (void *)[*(id *)(v1 + 24) compiler];
    uint64_t v4 = [*(id *)(a1 + 32) recompilationTarget];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke_2;
    v6[3] = &unk_1E521FE70;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v7;
    v6[6] = v5;
    [v3 createBinaryArchiveAsRecompileTarget:v4 completionHandler:v6];
    _Block_object_dispose(v7, 8);
  }
}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke_2(void *a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    if (*(void *)(a2 + 8)) {
      uint64_t v3 = (__CFString *)[NSString stringWithFormat:@"Failed to generate archiveID with error: %@", *(void *)(a2 + 8)];
    }
    else {
      uint64_t v3 = @"Failed to generate archiveID";
    }
    *(void *)(*(void *)(a1[6] + 8) + 40) = newErrorWithMessage(&v3->isa, MTLBinaryArchiveErrorInternalError);
  }
  else
  {
    size_t size_ptr = 0;
    uint64_t v4 = dispatch_data_create_map(*(dispatch_data_t *)(a2 + 24), (const void **)(*(void *)(a1[5] + 8) + 24), &size_ptr);
    if (size_ptr <= strlen(*(const char **)(*(void *)(a1[5] + 8) + 24))) {
      *(void *)(*(void *)(a1[6] + 8) + 40) = newErrorWithMessage(&cfstr_FailedToGenera.isa, MTLBinaryArchiveErrorInternalError);
    }
    else {
      *(void *)(a1[4] + 64) = strdup(*(const char **)(*(void *)(a1[5] + 8) + 24));
    }
    dispatch_release(v4);
  }
}

BOOL __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  MTLHashKey::MTLHashKey((uint64_t)&v6, a2);
  uint64_t v3 = [[MTLBinaryKey alloc] initWithHash:&v6];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 376) objectForKey:v3];

  MTLHashKey::~MTLHashKey(&v6);
  return v4 != 0;
}

void __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  MTLHashKey::MTLHashKey((uint64_t)&v6, a3);
  uint64_t v5 = [[MTLBinaryKey alloc] initWithHash:&v6];
  [*(id *)(*(void *)(a1 + 32) + 376) setObject:a2 forKey:v5];

  MTLHashKey::~MTLHashKey(&v6);
}

void *__76___MTLBinaryArchive_MTLBinaryArchiveInternal__findProgramObjectForFunction___block_invoke(void *a1)
{
  id result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((void *)(a1[4] + 848), a1 + 6);
  if (result) {
    uint64_t v3 = result[6];
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

void *__72___MTLBinaryArchive_MTLBinaryArchiveInternal__programObjectForFunction___block_invoke(void *a1)
{
  id result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((void *)(a1[4] + 848), a1 + 6);
  if (!result) {
    operator new();
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = result[6];
  return result;
}

void __85___MTLBinaryArchive_MTLBinaryArchiveInternal__newStitchedLibraryWithKey_descriptors___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 56);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  if (*v1 != v3)
  {
    for (unsigned int i = 0; ; ++i)
    {
      MTLHashKey v6 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((void *)(*(void *)(a1 + 32) + 480), (unint64_t *)(v2 + 8));
      uint64_t v7 = v6
         ? [(id)v6[6] newStitchedFunctionWithHash:v2 + 8]
         : [*(id *)(a1 + 32) localStitchedFunctionLookupWithDescriptor:v2];
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + 8 * i) = v7;
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v9 = !*(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + 8 * i)
        || *(unsigned char *)(v8 + 24) == 0;
      BOOL v10 = !v9;
      *(unsigned char *)(v8 + 24) = v10;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        break;
      }
      v2 += 40;
      if (v2 == v3) {
        return;
      }
    }
    if (i)
    {
      uint64_t v11 = 0;
      do
      {

        v11 += 8;
      }
      while (8 * i != v11);
    }
  }
}

void *__108___MTLBinaryArchive_MTLBinaryArchiveInternal__addStitchedLibraryWithKey_descriptors_inputFunctions_library___block_invoke(void *result)
{
  uint64_t v1 = (void *)result[6];
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)v1[1];
  if ((void *)*v1 != v3)
  {
    uint64_t v4 = result;
    p_info = MTLStitchedLibraryDescriptorSPI.info;
    do
    {
      id result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((void *)(v4[4] + 600), v2 + 1);
      if (!result)
      {
        id result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((void *)(v4[4] + 480), v2 + 1);
        if (!result)
        {
          if ((*(uint64_t (**)(void))(*(void *)v4[7] + 256))(v4[7]))
          {
            MTLHashKey v6 = p_info;
            uint64_t v7 = (void *)[(id)v4[4] getFunctionNameFromAirDescriptor:v2];
            uint64_t v8 = (void *)(*(uint64_t (**)(void, void *, void))(*(void *)v4[7] + 160))(v4[7], v7, *(void *)(v4[4] + 24));
            uint64_t v9 = [v8 libraryData];
            uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 128))(v9);

            p_info = v6;
          }
          else
          {
            uint64_t v10 = (*(uint64_t (**)(void))(*(void *)v4[7] + 128))(v4[7]);
          }
          uint64_t v11 = [objc_alloc((Class)(p_info + 116)) initWithData:v10 bitcode:0 airScript:*v2];
          [(id)v4[4] addStitchingInputsFunction:v4[5] toEntry:v11];
          uint64_t v12 = v4[4] + 600;
          id v13 = v2 + 1;
          id result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(v12, v2 + 1, (uint64_t)&std::piecewise_construct, &v13);
          result[6] = v11;
        }
      }
      v2 += 5;
    }
    while (v2 != v3);
  }
  return result;
}

void __107___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiverIdWithBinaryKey_entry_srcArchiverId_functionType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    size_t v27 = 0;
    buffer_ptr = 0;
    uint64_t v3 = dispatch_data_create_map(v2, (const void **)&buffer_ptr, &v27);
    uint64_t v4 = (long long *)buffer_ptr;
    if ((getRequiredStagesPresentMask(*(const Air::PipelineScript **)(a1 + 80)) & ~*((unsigned __int8 *)v4
                                                                                                  + 45)) == 0)
    {
      dispatch_release(v3);
      dispatch_retain(*(dispatch_object_t *)(a1 + 32));
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = *(void *)(a1 + 32);
      return;
    }
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  if ([*(id *)(a1 + 40) recompilationTarget])
  {
    uint64_t v5 = *(void **)(a1 + 48);
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 40) + 376) objectForKey:*(void *)(a1 + 56)];
    if (!v5)
    {
LABEL_9:
      [*(id *)(a1 + 40) addBinaryEntryImpl:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
      uint64_t v5 = *(void **)(a1 + 48);
    }
  }
  MTLHashKey v6 = std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>((void *)(*(void *)(a1 + 40) + 648), *(MTLHashKey **)(a1 + 88));
  uint64_t v7 = v6;
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v8 = *(int **)(a1 + 80);
    uint64_t v9 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v9 >= 9u)
    {
      uint64_t v10 = v9[4];
      if (v10)
      {
        int v11 = *((unsigned __int8 *)v8 + v10);
        if (!v6) {
          goto LABEL_14;
        }
LABEL_18:
        int v14 = 0;
        LODWORD(v15) = -1;
        goto LABEL_27;
      }
    }
  }
  int v11 = 0;
  if (v6) {
    goto LABEL_18;
  }
LABEL_14:
  if ([v5 index] == -1) {
    operator new();
  }
  unint64_t v12 = [v5 index];
  uint64_t v13 = [v5 index];
  if (v12 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v13 == -2)
    {
      uint64_t v15 = (*(void *)(*(void *)(a1 + 40) + 320) - *(void *)(*(void *)(a1 + 40) + 312)) >> 4;
      uint64_t v16 = v15 - 1;
      while (v16 != -1)
      {
        BOOL v17 = MTLHashKey::operator==(*(void **)(*(void *)(*(void *)(a1 + 40) + 312) + 16 * v16--), *(void **)(a1 + 88));
        LODWORD(v15) = v15 - 1;
        if (v17)
        {
          int v14 = 0;
          goto LABEL_26;
        }
      }
    }
    int v14 = 0;
    LODWORD(v15) = -1;
  }
  else
  {
    int v14 = 1;
    LODWORD(v15) = v13;
  }
LABEL_26:
  if (*(unsigned char *)(a1 + 104))
  {
LABEL_27:
    __int32 RequiredStagesPresentMask = getRequiredStagesPresentMask(*(const Air::PipelineScript **)(a1 + 80));
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
    unint64_t v19 = malloc_type_malloc(0x30uLL, 0x102204031A510F6uLL);
    unint64_t v21 = v19;
    if (*(void *)(a1 + 32))
    {
      long long v22 = *v4;
      long long v23 = v4[2];
      v19[1] = v4[1];
      v19[2] = v23;
      *unint64_t v19 = v22;
      if (!v3) {
        goto LABEL_30;
      }
    }
    else
    {
      v20.i32[0] = RequiredStagesPresentMask;
      unsigned __int8 v24 = vaddlv_u8((uint8x8_t)vcnt_s8(v20));
      *((void *)v19 + 4) = -1;
      *(void *)&long long v25 = -1;
      *((void *)&v25 + 1) = -1;
      *unint64_t v19 = v25;
      v19[1] = v25;
      *((_DWORD *)v19 + 10) = v11;
      *((_WORD *)v19 + 22) = v24;
      if (!v3)
      {
LABEL_30:
        switch(*(void *)(a1 + 96))
        {
          case 1:
            if (v7)
            {
              *(void *)unint64_t v21 = v7[12];
              goto LABEL_41;
            }
            *(_DWORD *)unint64_t v21 = v15;
            goto LABEL_51;
          case 2:
            if (v7)
            {
              *((void *)v21 + 3) = v7[12];
              char v26 = *((unsigned char *)v21 + 45) | 1;
            }
            else
            {
              *((_DWORD *)v21 + 6) = v15;
              char v26 = *((unsigned char *)v21 + 45) & 0xFE;
            }
            goto LABEL_53;
          case 3:
            if (v7)
            {
              *((void *)v21 + 4) = v7[12];
              goto LABEL_41;
            }
            *((_DWORD *)v21 + 8) = v15;
            goto LABEL_51;
          case 7:
            if (v7)
            {
              *((void *)v21 + 1) = v7[12];
LABEL_41:
              char v26 = *((unsigned char *)v21 + 45) | 2;
            }
            else
            {
              *((_DWORD *)v21 + 2) = v15;
LABEL_51:
              char v26 = *((unsigned char *)v21 + 45) & 0xFD;
            }
LABEL_53:
            *((unsigned char *)v21 + 45) = v26;
LABEL_54:
            if (v14) {
              *((unsigned char *)v21 + 45) |= 8u;
            }
            --*((unsigned char *)v21 + 44);
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = dispatch_data_create(v21, 0x30uLL, *(dispatch_queue_t *)(*(void *)(a1 + 40)+ 80), (dispatch_block_t)*MEMORY[0x1E4F143F0]);
            break;
          case 8:
            if (v7)
            {
              *((void *)v21 + 2) = v7[12];
              char v26 = *((unsigned char *)v21 + 45) | 4;
            }
            else
            {
              *((_DWORD *)v21 + 4) = v15;
              char v26 = *((unsigned char *)v21 + 45) & 0xFB;
            }
            goto LABEL_53;
          default:
            goto LABEL_54;
        }
        return;
      }
    }
    dispatch_release(v3);
    goto LABEL_30;
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  if (v3) {
    dispatch_release(v3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
}

void __101___MTLBinaryArchive_MTLBinaryArchiveInternal__updatePipelineWithPipelineArchiverId_key_functionType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2 && (unint64_t)(*(void *)(a1 + 56) - 5) >= 2)
  {
    size_t v11 = 0;
    buffer_ptr = 0;
    uint64_t v3 = dispatch_data_create_map(v2, (const void **)&buffer_ptr, &v11);
    uint64_t v4 = (uint64_t *)buffer_ptr;
    unint64_t v5 = *(void *)(a1 + 56) - 1;
    if (v5 > 7) {
      int v6 = 0;
    }
    else {
      int v6 = dword_1828E1DDC[v5];
    }
    uint64_t v7 = (MTLHashKey *)[*(id *)(a1 + 40) getFunctionId];
    if (!std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>((void *)(*(void *)(a1 + 48) + 648), v7))
    {
      if ((v6 & ~*((unsigned __int8 *)v4 + 45)) != 0) {
        goto LABEL_16;
      }
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = v4;
      switch(*(void *)(a1 + 56))
      {
        case 1:
          goto LABEL_13;
        case 2:
          uint64_t v10 = v4 + 3;
          goto LABEL_13;
        case 3:
          uint64_t v10 = v4 + 4;
          goto LABEL_13;
        case 7:
          uint64_t v10 = v4 + 1;
          goto LABEL_13;
        case 8:
          uint64_t v10 = v4 + 2;
LABEL_13:
          uint64_t v8 = *v10;
          break;
        default:
          break;
      }
      uint64_t v13 = v7;
      std::__hash_table<std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>>>::__emplace_unique_key_args<MTLHashKey,std::piecewise_construct_t const&,std::tuple<MTLHashKey const&>,std::tuple<>>(v9 + 648, v7, (uint64_t)&std::piecewise_construct, &v13)[12] = v8;
    }
    if ((*((unsigned char *)v4 + 45) & 0x10) != 0)
    {
LABEL_17:
      dispatch_release(v3);
      return;
    }
LABEL_16:
    if (!*((unsigned char *)v4 + 44)) {
      operator new();
    }
    goto LABEL_17;
  }
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_582(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a2;
  if (a2 == *(void *)(a1 + 72))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    *(_WORD *)uint64_t v8 = 257;
LABEL_9:
    *(void *)(v8 + 8) = a3;
    *(void *)(v8 + 16) = a4;
    goto LABEL_17;
  }
  if (v19 == *(void *)(a1 + 80))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    *(unsigned char *)(v9 + 24) = 1;
    *(void *)(v9 + 32) = a3;
    *(void *)(v9 + 40) = a4;
  }
  else if (v19 == *(void *)(a1 + 88))
  {
    if (*(_DWORD *)(a1 + 96) >= HIDWORD(a2))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      if (!*(unsigned char *)(v10 + 64) || *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < SHIDWORD(a2))
      {
        *(unsigned char *)(v10 + 64) = 1;
        *(void *)(v10 + 72) = a3;
        *(void *)(v10 + 80) = a4;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = HIDWORD(a2);
      }
    }
  }
  else if ((a2 - 16777235) >= 3)
  {
    if (a2 == 16777239)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(unsigned char *)(v11 + 64) = 1;
      *(void *)(v11 + 72) = a3;
      *(void *)(v11 + 80) = a4;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 64);
    *(unsigned char *)(v8 + 1) = 1;
    if (!*(void *)(v8 + 16) && !*(void *)(v8 + 8)) {
      goto LABEL_9;
    }
  }
LABEL_17:
  unint64_t v12 = [[MTLArchitecture alloc] initWithCPUType:a2 cpuSubtype:HIDWORD(a2)];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_2;
  v18[3] = &unk_1E521FAC0;
  uint64_t v13 = *(void *)(a1 + 64);
  v18[4] = *(void *)(a1 + 32);
  v18[5] = v13;
  if (!+[MTLLoader airNTMachOEmpty:type:]((uint64_t)MTLLoader, (uint64_t)v18, 0))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
    int v14 = (float *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
    uint64_t v17 = (a2 << 32) | (a2 >> 32);
    uint64_t v15 = std::unordered_map<unsigned long long,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<std::pair<unsigned long long const,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId>>>::operator[](v14, (unint64_t *)&v17);
    void *v15 = a3;
    v15[1] = a4;
  }

  return 1;
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *__s1, size_t __n, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = a2;
  uint64_t result = memcmp(__s1, &_MTLBinaryArchiveDescriptorUUID, __n);
  if (result) {
    return 1;
  }
  if (a3 == 1 && v21 == a1[6])
  {
    if (*(void *)(a1[5] + 48)) {
      return 0;
    }
    uint64_t v17 = 0;
    unint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_2;
    v16[3] = &unk_1E521FFD8;
    v16[4] = &v17;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_3;
    v15[3] = &unk_1E5220000;
    v15[5] = a6;
    v15[6] = a7;
    v15[4] = a1[4];
    +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, (uint64_t)v16, (uint64_t)v15);
    int v12 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v12) {
      return 0;
    }
    uint64_t v13 = (void *)a1[5];
    uint64_t v14 = v13[5] - a6;
    v13[6] = v13[4] + a6;
    v13[7] = v14;
    return 1;
  }
  return result;
}

BOOL __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[1] | a3[2] | a3[3] | a3[4];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v3 == 0;
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40) + a2;
  if ((unint64_t)(v3 + a3) <= *(void *)(a1 + 48)) {
    return [*(id *)(a1 + 32) bytes] + v3;
  }
  else {
    return 0;
  }
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 32) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + v4;
  }
  else {
    return 0;
  }
}

void __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 392) UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "No binaries found in %s ", v2, v3, v4, v5, v6);
}

@end