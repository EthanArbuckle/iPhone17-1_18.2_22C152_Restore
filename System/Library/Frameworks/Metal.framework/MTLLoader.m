@interface MTLLoader
+ (BOOL)ReadHashTable:(unint64_t)a3 begin:(unsigned int)a4 end:(unsigned int)a5 hashList:(void *)a6 reader:(id)a7 errorHandler:(id)a8 handler:(id)a9;
+ (BOOL)airNTMachOEmpty:(uint64_t)a3 type:;
+ (BOOL)deserializeHashesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8;
+ (BOOL)deserializeObjectFromAIRNTHeaderAtSection:(id *)a3 reader:(id)a4 errorHandler:(id)a5 handler:(id)a6;
+ (BOOL)deserializePipelinesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8;
+ (BOOL)isAIRHeaderExtLoadCommand:(const void *)a3 headerOffset:(unint64_t *)a4 headerSize:(unint64_t *)a5 headerSection:(unsigned int *)a6;
+ (BOOL)machOConformsToAIRNTFormat:(uint64_t)a3 type:;
+ deserializeAIRNTToolsVersionForSlice:(uint64_t)a3 sliceOffset:(uint64_t)a4 version:(uint64_t)a5 reader:;
+ readMachOHeader:(uint64_t)a3 type:;
+ (uint64_t)canonicalURL:(uint64_t)a1;
+ (uint64_t)deserializeAirntMachOContainerWithHandler:(uint64_t)a3 objectHandler:(uint64_t)a4 pipelineHandler:(uint64_t)a5 errorHandler:(uint64_t)a6 reader:;
+ (uint64_t)deserializeMachOContainerWithHandler:(uint64_t)a3 reader:;
+ (uint64_t)deserializeMachOContainerWithHandlerInternal:(int)a3 expectAIRNTFormat:(uint64_t)a4 objectHandler:(uint64_t)a5 pipelineHandler:(uint64_t)a6 errorHandler:(uint64_t)a7 reader:;
+ (uint64_t)deserializeMachOWrapperWithType:(uint64_t)a3 payloadHandler:(uint64_t)a4 reader:;
+ (uint64_t)deserializeUniversalBinaryHeaderWithHandler:(uint64_t)a3 reader:(uint64_t)a4 bytes:;
+ (uint64_t)readLoadCommands:(unsigned int)a3 ncmds:(uint64_t)a4 sizeofcmds:(uint64_t)a5 handler:;
+ (uint64_t)serializeMachOContainerWithSlice:(uint64_t)a3 payload:(unsigned int)a4 count:(void *)a5 writer:;
+ (uint64_t)serializeMachOWrapperWithType:(uint64_t)a3 slice:(uint64_t)a4 payload:(void *)a5 writer:;
+ (uint64_t)serializePaddingForOffset:(uint64_t)a3 writer:;
+ (uint64_t)serializeUniversalBinaryHeaderWithSlice:(_DWORD *)a3 offset:(_DWORD *)a4 length:(unsigned int)a5 count:(uint64_t)a6 writer:;
+ (uint64_t)sliceIDForAIR:(uint64_t)a1;
+ (uint64_t)sliceIDForAIRVersion:(uint64_t)a1;
+ (uint64_t)sliceIDForDescriptors;
+ (unint64_t)serializeMachOContainerWithSlice:(unint64_t *)result payload:(unint64_t *)a2 count:(uint64_t)a3 writer:(char)a4;
+ (unint64_t)sliceIDForDevice:(void *)a3 andDriverVersion:;
+ (unint64_t)sliceIDForDevice:(void *)a3 legacyDriverVersion:(_DWORD *)a4 airntDriverVersion:;
- (MTLLoader)init;
- (id).cxx_construct;
- (id)loadLibrariesWithDevice:(_MTLFunction *)a3 function:(void *)a4 insertLibraries:(uint64_t)a5 options:(id *)a6 error:;
- (uint64_t)associateLoadedFile:(uint64_t)a3 withObject:;
- (uint64_t)loadFileWithURL:(NSError *)a3 error:(NSString *)a4 errorDomain:(uint64_t)a5 invalidFileErrorCode:;
- (void)dealloc;
- (void)disassociateLoadedFile:(uint64_t)a1 withObject:(MTLLoadedFile *)a2;
- (void)executeBlockForLoadedFile:(int)a3 withAssociatedObject:(dispatch_block_t)block block:;
- (void)releaseLoadedFile:(uint64_t)a1;
@end

@implementation MTLLoader

+ (uint64_t)canonicalURL:(uint64_t)a1
{
  self;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a2 isDirectory:0];
  uint64_t v4 = [v3 standardizedURL];

  return v4;
}

- (MTLLoader)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLoader;
  v2 = [(MTLLoader *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MTLLoader device cache queue", 0);
    v2->_claimQueue = (OS_dispatch_queue *)v3;
    if (v3)
    {
      if (getGlobalState(void)::_loaderGlobalsOnce != -1) {
        dispatch_once(&getGlobalState(void)::_loaderGlobalsOnce, &__block_literal_global_146);
      }
      v2->_global = (void *)getGlobalState(void)::_loaderGlobalState;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)loadLibrariesWithDevice:(_MTLFunction *)a3 function:(void *)a4 insertLibraries:(uint64_t)a5 options:(id *)a6 error:
{
  if (!a1) {
    return 0;
  }
  v12 = (void *)MEMORY[0x18530C9F0]();
  v17[0] = *(void *)(a1 + 8);
  v17[1] = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(v20, 0, 25);
  LoaderContext::setInsertLibraries(v17, a4);
  if (LoaderContext::load((LoaderContext *)v17, a3, a5, a6))
  {
    id v13 = LoaderContext::finish((LoaderContext *)v17, a5, a6);
    if (!a6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
    if (!a6)
    {
LABEL_9:
      v21 = (void **)v20;
      std::vector<std::unique_ptr<LoaderContext::Image>>::__destroy_vector::operator()[abi:ne180100](&v21);
      return v13;
    }
  }
  if (v13) {
    goto LABEL_9;
  }
  id v14 = *a6;
  v21 = (void **)v20;
  std::vector<std::unique_ptr<LoaderContext::Image>>::__destroy_vector::operator()[abi:ne180100](&v21);
  id v15 = *a6;
  return 0;
}

+ deserializeAIRNTToolsVersionForSlice:(uint64_t)a3 sliceOffset:(uint64_t)a4 version:(uint64_t)a5 reader:
{
  self;
  result = (_DWORD *)(*(uint64_t (**)(uint64_t, void, uint64_t))(a5 + 16))(a5, 0, 32);
  if (result)
  {
    if (*result == -17958193
      && ((int v8 = result[1], (v8 - 16777235) <= 4) ? (v9 = v8 == 16777238) : (v9 = 1),
          v9 ? (BOOL v10 = v8 == -1) : (BOOL v10 = 1),
          v10
       && ((v11 = result[3], v12 = v11 > 0xE, int v13 = (1 << v11) & 0x6144, !v12) ? (v14 = v13 == 0) : (v14 = 1), !v14)))
    {
      unsigned int v15 = result[4];
      uint64_t v16 = result[5];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __77__MTLLoader_deserializeAIRNTToolsVersionForSlice_sliceOffset_version_reader___block_invoke;
      v17[3] = &__block_descriptor_40_e32_B24__0r__load_command_II_8I16I20l;
      v17[4] = a4;
      return (_DWORD *)+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a5, v15, v16, (uint64_t)v17);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (uint64_t)deserializeUniversalBinaryHeaderWithHandler:(uint64_t)a3 reader:(uint64_t)a4 bytes:
{
  self;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, 0, 8);
  if (!result) {
    return result;
  }
  int v8 = (int *)result;
  uint64_t result = 0;
  int v9 = *v8;
  if (*v8 > -17958194)
  {
    if (v9 == -17958193)
    {
      uint64_t v16 = *(void *)((*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, 0, 28) + 4);
      v17 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(a2 + 16);
      return v17(a2, v16, 0, a4);
    }
    if (v9 != 1112298573) {
      return result;
    }
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a2 + 16))(a2, 16777239, 0, a4);
    return 1;
  }
  unsigned int v10 = v8[1];
  unsigned int v11 = bswap32(v10);
  if ((v9 + 1095041334) < 2)
  {
    if (v10)
    {
      for (unsigned int i = 8; ; i += 20)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, i, 20);
        if (!result) {
          break;
        }
        unsigned int v13 = *(_DWORD *)(result + 12);
        if (!v13) {
          return 0;
        }
        (*(void (**)(uint64_t, unint64_t, void, void))(a2 + 16))(a2, bswap64(*(unsigned int *)(result + 4) | ((unint64_t)*(unsigned int *)result << 32)), bswap32(*(_DWORD *)(result + 8)), bswap32(v13));
        if (!--v11) {
          return 1;
        }
      }
      return result;
    }
    return 1;
  }
  if (v9 != -1078264118) {
    return result;
  }
  if (!v10) {
    return 1;
  }
  unsigned int v14 = 8;
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, v14, 32);
    if (!result) {
      break;
    }
    unint64_t v15 = *(void *)(result + 16);
    if (!v15) {
      return 0;
    }
    (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(a2 + 16))(a2, bswap64(*(unsigned int *)(result + 4) | ((unint64_t)*(unsigned int *)result << 32)), bswap64(*(void *)(result + 8)), bswap64(v15));
    v14 += 32;
    uint64_t result = 1;
    --v11;
  }
  while (v11);
  return result;
}

+ (BOOL)airNTMachOEmpty:(uint64_t)a3 type:
{
  self;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_super v5 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a2, a3);
  if (!v5)
  {
    BOOL v11 = 0;
    goto LABEL_15;
  }
  unsigned int v6 = v5[4];
  uint64_t v7 = v5[5];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3812000000;
  long long v19 = __Block_byref_object_copy__54;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  v20 = __Block_byref_object_dispose__55;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__MTLLoader_airNTMachOEmpty_type___block_invoke;
  v15[3] = &unk_1E5220DA0;
  v15[4] = &v16;
  v15[5] = &v23;
  if (+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a2, v6, v7, (uint64_t)v15)&& *((unsigned char *)v24 + 24))
  {
    int v8 = (void *)v17[6];
    if (v8[1])
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *v8);
      if (v9)
      {
        int v10 = *(_DWORD *)(v9 + 60);
LABEL_11:
        BOOL v11 = v10 == 0;
        goto LABEL_13;
      }
    }
    else if (v8[10])
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v8[9]);
      if (v12)
      {
        int v10 = *(_DWORD *)(v12 + 8);
        goto LABEL_11;
      }
    }
  }
  BOOL v11 = 0;
LABEL_13:
  _Block_object_dispose(&v16, 8);
  uint64_t v13 = v22;
  uint64_t v22 = 0;
  if (v13) {
    MEMORY[0x18530C120](v13, 0x1000C800CE834B2);
  }
LABEL_15:
  _Block_object_dispose(&v23, 8);
  return v11;
}

+ (uint64_t)readLoadCommands:(unsigned int)a3 ncmds:(uint64_t)a4 sizeofcmds:(uint64_t)a5 handler:
{
  self;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 16))(a2, 32, a4);
  if (result)
  {
    int v10 = a3 != 0;
    if (a3)
    {
      uint64_t v11 = result;
      uint64_t v12 = 0;
      uint64_t v13 = (_DWORD *)result;
      uint64_t v14 = a4;
      do
      {
        if (v14 < 8) {
          return 0;
        }
        unsigned int v15 = v13[1];
        if (v14 < v15) {
          return 0;
        }
        if (*v13 == 49)
        {
          (*(void (**)(uint64_t, _DWORD *, uint64_t, uint64_t))(a5 + 16))(a5, v13, v12, v14);
          unsigned int v15 = v13[1];
        }
        uint64_t v13 = (_DWORD *)((char *)v13 + v15);
        uint64_t v14 = v14 - v15;
        uint64_t v12 = (v12 + 1);
      }
      while (a3 != v12);
      if (a4 >= 8)
      {
        uint64_t v17 = 0;
        int v10 = 1;
        while (1)
        {
          unsigned int v18 = *(_DWORD *)(v11 + 4);
          if (a4 < v18) {
            break;
          }
          if (v10)
          {
            int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(a5, v11, v17, a4);
            unsigned int v18 = *(_DWORD *)(v11 + 4);
          }
          else
          {
            int v10 = 0;
          }
          uint64_t v17 = (v17 + 1);
          BOOL v16 = v17 >= a3;
          if (v17 < a3)
          {
            v11 += v18;
            a4 = a4 - v18;
            if (a4 > 7) {
              continue;
            }
          }
          return v16 & v10;
        }
      }
      BOOL v16 = 0;
    }
    else
    {
      BOOL v16 = 1;
    }
    return v16 & v10;
  }
  return result;
}

uint64_t __77__MTLLoader_deserializeAIRNTToolsVersionForSlice_sliceOffset_version_reader___block_invoke(uint64_t a1, int32x2_t *a2)
{
  if (a2->i32[0] != 50) {
    return 1;
  }
  uint64_t v2 = a2->u32[1];
  if (v2 >= 0x18)
  {
    dispatch_queue_t v3 = *(int32x2_t **)(a1 + 32);
    int32x2_t *v3 = vrev64_s32(a2[1]);
    uint64_t v4 = a2[2].u32[1];
    v3[1].i32[0] = a2[2].i32[0];
    if (8 * v4 + 24 == v2)
    {
      if (v4)
      {
        objc_super v5 = v3 + 2;
        unsigned int v6 = (int32x2_t *)((char *)v3 + 12);
        for (unsigned int i = (__int32 *)&a2[3] + 1; ; i += 2)
        {
          int v8 = *(i - 1);
          uint64_t v9 = v6;
          if (v8 == 1026) {
            goto LABEL_9;
          }
          if (v8 == 1027) {
            break;
          }
LABEL_10:
          if (!--v4) {
            return 1;
          }
        }
        uint64_t v9 = v5;
LABEL_9:
        v9->i32[0] = *i;
        goto LABEL_10;
      }
      return 1;
    }
  }
  return 0;
}

uint64_t __45__MTLLoader_machOConformsToAIRNTFormat_type___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  int v4 = 0;
  if (+[MTLLoader isAIRHeaderExtLoadCommand:a2 headerOffset:&v6 headerSize:&v5 headerSection:&v4])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __34__MTLLoader_airNTMachOEmpty_type___block_invoke(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 49)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)) {
      operator new[]();
    }
    long long v6 = 0uLL;
    uint64_t v7 = 0;
    if (+[MTLLoader isAIRHeaderExtLoadCommand:a2 headerOffset:&v6 headerSize:(char *)&v6 + 8 headerSection:&v7])
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 24 * v7;
      long long v4 = v6;
      *(void *)(v3 + 16) = v7;
      *(_OWORD *)uint64_t v3 = v4;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return 1;
}

+ (BOOL)isAIRHeaderExtLoadCommand:(const void *)a3 headerOffset:(unint64_t *)a4 headerSize:(unint64_t *)a5 headerSection:(unsigned int *)a6
{
  return isAIRHeaderExtensionCommand((const load_command *)a3, a4, a5, a6);
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int v6 = *(_DWORD *)a2;
  if (*(int *)a2 <= 41)
  {
    if (v6 == 2)
    {
      if (*(_DWORD *)(a2 + 4) != 24) {
        return 0;
      }
      *(_DWORD *)(*(void *)(a1[13] + 8) + 24) = *(_DWORD *)(a2 + 12);
      *(void *)(*(void *)(a1[14] + 8) + 48) = *(unsigned int *)(a2 + 8);
      *(void *)(*(void *)(a1[14] + 8) + 56) = 16 * *(unsigned int *)(*(void *)(a1[13] + 8) + 24);
      if (*(void *)(*(void *)(a1[14] + 8) + 56) + *(void *)(*(void *)(a1[14] + 8) + 48) > *(void *)(*(void *)(a1[8] + 8) + 24)) {
        return 0;
      }
      *(void *)(*(void *)(a1[15] + 8) + 48) = *(unsigned int *)(a2 + 16);
      *(void *)(*(void *)(a1[15] + 8) + 56) = *(unsigned int *)(a2 + 20);
      if (*(void *)(*(void *)(a1[15] + 8) + 56) + *(void *)(*(void *)(a1[15] + 8) + 48) > *(void *)(*(void *)(a1[8] + 8) + 24)) {
        return 0;
      }
    }
    else if (v6 == 25)
    {
      if (a4 < 0x48) {
        return 0;
      }
      unsigned int v12 = *(_DWORD *)(a2 + 64);
      if (80 * (unint64_t)v12 + 72 > a4) {
        return 0;
      }
      uint64_t v13 = (void *)(a2 + 8);
      int v36 = strcmp("__DATA", (const char *)(a2 + 8));
      int v35 = strcmp("__TEXT", (const char *)(a2 + 8));
      if (v12)
      {
        unint64_t v14 = 0;
        uint64_t v15 = a2 + 72;
        do
        {
          uint64_t v16 = v15 + 80 * v14;
          BOOL v17 = *(void *)(v16 + 16) == *v13 && *(void *)(v16 + 24) == *(void *)(a2 + 16);
          if (v17)
          {
            unsigned int v18 = operator new(0x38uLL);
            uint64_t v19 = 0;
            *unsigned int v18 = xmmword_1E5220FE0;
            v18[1] = *(_OWORD *)&off_1E5220FF0;
            v18[2] = xmmword_1E5221000;
            *((void *)v18 + 6) = "__object";
            do
            {
              int v20 = strncmp((const char *)v16, *(const char **)((char *)v18 + v19), 0x10uLL);
              if (!v20) {
                break;
              }
              BOOL v17 = v19 == 48;
              v19 += 8;
            }
            while (!v17);
            operator delete(v18);
            if (!(v20 | v35))
            {
              uint64_t v21 = v15 + 80 * v14;
              uint64_t v22 = *(unsigned int *)(v21 + 48);
              uint64_t v23 = *(void *)(v21 + 40);
              *(void *)&long long v37 = v22;
              *((void *)&v37 + 1) = v23;
              uint64_t v38 = 0;
              uint64_t v24 = a1[5];
              LODWORD(v38) = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
              uint64_t v25 = *(void *)(v24 + 8) + 48;
              v39 = &v37;
              char v26 = std::__hash_table<std::__hash_value_type<unsigned long long,SectionData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SectionData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SectionData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SectionData>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v25, (unint64_t *)&v37, (uint64_t)&std::piecewise_construct, (uint64_t **)&v39);
              *(_OWORD *)(v26 + 3) = v37;
              v26[5] = v38;
            }
            if (!v36 && !strcmp("__data", (const char *)v16))
            {
              uint64_t v27 = *(void *)(a1[6] + 8);
              if (*(void *)(v27 + 48)) {
                return 0;
              }
              uint64_t v28 = v15 + 80 * v14;
              *(void *)(v27 + 48) = *(unsigned int *)(v28 + 48);
              *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(v28 + 32);
              *(void *)(*(void *)(a1[6] + 8) + 56) = *(void *)(v28 + 40);
              *(_DWORD *)(*(void *)(a1[6] + 8) + 64) = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
            }
          }
          ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
          ++v14;
        }
        while (v14 < *(unsigned int *)(a2 + 64));
      }
      uint64_t v29 = *(void *)(a1[8] + 8);
      unint64_t v30 = *(void *)(v29 + 24);
      if (v30 <= *(void *)(a2 + 48) + *(void *)(a2 + 40)) {
        unint64_t v30 = *(void *)(a2 + 48) + *(void *)(a2 + 40);
      }
      *(void *)(v29 + 24) = v30;
    }
    return 1;
  }
  if (v6 == 42)
  {
    if (*(_DWORD *)(a2 + 4) != 16 || *(unsigned char *)(*(void *)(a1[11] + 8) + 24)) {
      return 0;
    }
    *(void *)(*(void *)(a1[12] + 8) + 24) = *(void *)(a2 + 8);
    uint64_t v31 = a1[11];
LABEL_48:
    *(unsigned char *)(*(void *)(v31 + 8) + 24) = 1;
    return 1;
  }
  if (v6 == 49)
  {
    if (!*(void *)(*(void *)(a1[9] + 8) + 48)) {
      operator new[]();
    }
    long long v37 = 0uLL;
    uint64_t v38 = 0;
    if (!+[MTLLoader isAIRHeaderExtLoadCommand:a2 headerOffset:&v37 headerSize:(char *)&v37 + 8 headerSection:&v38])return 1; {
    uint64_t v32 = *(void *)(*(void *)(a1[9] + 8) + 48) + 24 * v38;
    }
    long long v33 = v37;
    *(void *)(v32 + 16) = v38;
    *(_OWORD *)uint64_t v32 = v33;
    uint64_t v31 = a1[10];
    goto LABEL_48;
  }
  if (v6 != 50) {
    return 1;
  }
  uint64_t v7 = *(unsigned int *)(a2 + 4);
  if (v7 >= 0x18)
  {
    uint64_t v8 = *(unsigned int *)(a2 + 20);
    if (8 * v8 + 24 == v7)
    {
      if (v8)
      {
        for (unsigned int i = (_DWORD *)(a2 + 28); ; i += 2)
        {
          int v10 = *(i - 1);
          if (v10 == 1026) {
            break;
          }
          if (v10 == 1027)
          {
            uint64_t v11 = (uint64_t **)&v39;
LABEL_13:
            *(_DWORD *)uint64_t v11 = *i;
          }
          if (!--v8) {
            return 1;
          }
        }
        uint64_t v11 = (uint64_t **)&v37;
        goto LABEL_13;
      }
      return 1;
    }
  }
  return 0;
}

+ readMachOHeader:(uint64_t)a3 type:
{
  self;
  uint64_t v5 = (_DWORD *)(*(uint64_t (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, 0, 32);
  int v6 = v5;
  if (a3)
  {
    if ((validateMachHeader(v5, 6) & 1) != 0 || validateMachHeader(v6, 14)) {
      return v6;
    }
    return 0;
  }
  if ((validateMachHeader(v5, 2) & 1) == 0 && (validateMachHeader(v6, 13) & 1) == 0) {
    return 0;
  }
  return v6;
}

+ (BOOL)deserializeObjectFromAIRNTHeaderAtSection:(id *)a3 reader:(id)a4 errorHandler:(id)a5 handler:(id)a6
{
  if (!a3->var1)
  {
    if (!a3[3].var1) {
      goto LABEL_17;
    }
    uint64_t v25 = (*((uint64_t (**)(id, unint64_t))a4 + 2))(a4, a3[3].var0);
    if (!v25) {
      goto LABEL_17;
    }
    int v41 = *(_DWORD *)(v25 + 8);
    uint64_t v42 = *(void *)v25;
    uint64_t v26 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[8].var0, a3[8].var1);
    if (!v26) {
      goto LABEL_17;
    }
    uint64_t v27 = *(void *)v26;
    unsigned int v46 = *(_DWORD *)(v26 + 8);
    uint64_t v28 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[2].var0, a3[2].var1);
    if (!v28) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)v28;
    unsigned int v29 = *(_DWORD *)(v28 + 8);
    unint64_t v30 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[7].var0, a3[7].var1);
    if (!v30) {
      goto LABEL_17;
    }
    unsigned int v48 = v29;
    v44 = (void (**)(id, stat *))a6;
    v45 = (void (**)(id, uint64_t))a5;
    uint64_t v16 = *v30;
    uint64_t v15 = v30[1];
    uint64_t v11 = (char *)a4;
    uint64_t v31 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[1].var0, a3[1].var1);
    if (!v31) {
      goto LABEL_17;
    }
    uint64_t v18 = *(void *)v31;
    unsigned int v20 = *(_DWORD *)(v31 + 8);
    if (a3[4].var1)
    {
      uint64_t v32 = (*((uint64_t (**)(char *, unint64_t))v11 + 2))(v11, a3[4].var0);
      if (!v32) {
        goto LABEL_17;
      }
      uint64_t v47 = *(void *)v32;
      unsigned int v12 = *(_DWORD *)(v32 + 8);
    }
    else
    {
      uint64_t v47 = 0;
      unsigned int v12 = 0;
    }
    int v14 = v41;
    uint64_t v17 = v27;
    unsigned int v19 = v46;
    goto LABEL_4;
  }
  uint64_t v10 = (*((uint64_t (**)(id, unint64_t))a4 + 2))(a4, a3->var0);
  if (!v10)
  {
LABEL_17:
    char v33 = 0;
    return v33 & 1;
  }
  uint64_t v11 = (char *)a4;
  v44 = (void (**)(id, stat *))a6;
  v45 = (void (**)(id, uint64_t))a5;
  uint64_t v47 = 0;
  unsigned int v12 = 0;
  uint64_t v13 = *(void *)(v10 + 16);
  uint64_t v42 = *(void *)(v10 + 24);
  int v14 = *(_DWORD *)(v10 + 60);
  unsigned int v48 = *(_DWORD *)(v10 + 56);
  uint64_t v16 = *(void *)(v10 + 80);
  uint64_t v15 = *(void *)(v10 + 88);
  uint64_t v17 = *(void *)v10;
  uint64_t v18 = *(void *)(v10 + 8);
  unsigned int v19 = *(_DWORD *)(v10 + 48);
  unsigned int v20 = *(_DWORD *)(v10 + 52);
LABEL_4:
  int v40 = v14;
  if (!v14)
  {
    unsigned int v21 = v19;
    v45[2](v45, 3);
    unsigned int v19 = v21;
  }
  uint64_t v22 = v11;
  uint64_t v24 = (void (*)(char *, uint64_t, uint64_t))*((void *)v11 + 2);
  uint64_t v23 = (uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v24(v22, v17, 40 * v19);
  uint64_t v43 = (*v23)(v22, v13, 56 * v48);
  (*v23)(v22, v18, 40 * v20);
  (*v23)(v22, v16, v15);
  if (v12) {
    (*((void (**)(char *, uint64_t, uint64_t))v22 + 2))(v22, v47, 24 * v12);
  }
  char v34 = v40;
  if (v40)
  {
    char v35 = 0;
    uint64_t v36 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v22 + 2))(v22, v42, 36);
    if (v36 || (v37 = ((uint64_t (*)(id, uint64_t))v45[2])(v45, 5), uint64_t v36 = 0, v37))
    {
      int v38 = *(_DWORD *)(v43 + 56 * *(unsigned int *)(v36 + 4) + 48);
      if ((v38 & 0x20) == 0) {
        operator new();
      }
      memset(&v49, 0, 80);
      memset(&v49.st_birthtimespec.tv_nsec, 0, 24);
      LODWORD(v49.st_birthtimespec.tv_sec) = v38;
      v44[2](v44, &v49);
      MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)&v49);
      char v34 = 1;
    }
    else
    {
      char v34 = 0;
    }
  }
  else
  {
    char v35 = 1;
  }
  char v33 = v35 | v34;
  return v33 & 1;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_3(uint64_t a1)
{
  return 1;
}

+ (BOOL)ReadHashTable:(unint64_t)a3 begin:(unsigned int)a4 end:(unsigned int)a5 hashList:(void *)a6 reader:(id)a7 errorHandler:(id)a8 handler:(id)a9
{
  int v14 = (unsigned int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a7 + 2))(a7, a3, 8);
  if (!v14 && !(*((unsigned int (**)(id, void))a8 + 2))(a8, 0)) {
    return 0;
  }
  uint64_t v15 = *v14;
  if (v15)
  {
    unint64_t v16 = a3 + 8;
    uint64_t v17 = (*((uint64_t (**)(id, unint64_t, uint64_t))a7 + 2))(a7, a3 + 8, v15 << 7);
    if (v17 || (*((unsigned int (**)(id, uint64_t))a8 + 2))(a8, 1))
    {
      v67 = (unsigned int (**)(id, uint64_t))a8;
      if (a5 | a4) {
        unint64_t v18 = a5;
      }
      else {
        unint64_t v18 = v15;
      }
      if (v18 > a4)
      {
        BOOL v19 = 0;
        unint64_t v63 = (v15 << 7) + v16;
        v64 = (char *)a6 + 16;
        uint64_t v20 = a4;
        while (1)
        {
          uint64_t v21 = v17 + (v20 << 7);
          uint64_t v22 = (uint64_t *)*((void *)a6 + 1);
          if ((*(_DWORD *)(v21 + 108) & 0x3FFFFFFF) != 0)
          {
            uint64_t v23 = (char *)malloc_type_malloc(96 * (((uint64_t)v22 - *(void *)a6) >> 3) + 96, 0x1000040E0EAB150uLL);
            uint64_t v24 = malloc_type_malloc(12 * ((uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3) + 12, 0x100004052888210uLL);
            uint64_t v25 = v24;
            uint64_t v26 = *(char **)a6;
            if (*((void *)a6 + 1) == *(void *)a6)
            {
              unsigned int v28 = 0;
            }
            else
            {
              unint64_t v27 = 0;
              unsigned int v28 = 0;
              unsigned int v29 = 1;
              do
              {
                unint64_t v30 = *(_OWORD **)&v26[8 * v27];
                uint64_t v31 = &v23[32 * v28];
                long long v32 = v30[1];
                *(_OWORD *)uint64_t v31 = *v30;
                *((_OWORD *)v31 + 1) = v32;
                uint64_t v33 = v28 + 1;
                char v34 = &v23[32 * v33];
                uint64_t v35 = *(void *)(*(void *)a6 + 8 * v27);
                long long v36 = *(_OWORD *)(v35 + 48);
                *(_OWORD *)char v34 = *(_OWORD *)(v35 + 32);
                *((_OWORD *)v34 + 1) = v36;
                uint64_t v37 = v28 + 2;
                uint64_t v38 = *(void *)(*(void *)a6 + 8 * v27);
                v39 = &v23[32 * v37];
                long long v40 = *(_OWORD *)(v38 + 80);
                *(_OWORD *)v39 = *(_OWORD *)(v38 + 64);
                *((_OWORD *)v39 + 1) = v40;
                uint64_t v26 = *(char **)a6;
                uint64_t v41 = *((void *)a6 + 1);
                uint64_t v42 = *(_DWORD **)(*(void *)a6 + 8 * v27);
                *((_DWORD *)v24 + v28) = v42[24];
                *((_DWORD *)v24 + v33) = v42[25];
                *((_DWORD *)v24 + v37) = v42[26];
                v28 += v42[27] >> 30;
                unint64_t v27 = v29++;
              }
              while (v27 < (v41 - (uint64_t)v26) >> 3);
            }
            v44 = &v23[32 * v28];
            long long v45 = *(_OWORD *)(v21 + 16);
            *(_OWORD *)v44 = *(_OWORD *)v21;
            *((_OWORD *)v44 + 1) = v45;
            uint64_t v46 = v28 + 1;
            uint64_t v47 = &v23[32 * v46];
            long long v48 = *(_OWORD *)(v21 + 48);
            *(_OWORD *)uint64_t v47 = *(_OWORD *)(v21 + 32);
            *((_OWORD *)v47 + 1) = v48;
            uint64_t v49 = v28 + 2;
            v50 = &v23[32 * v49];
            long long v51 = *(_OWORD *)(v21 + 80);
            *(_OWORD *)v50 = *(_OWORD *)(v21 + 64);
            *((_OWORD *)v50 + 1) = v51;
            v52 = (_DWORD *)(v17 + (v20 << 7));
            *((_DWORD *)v24 + v28) = v52[24];
            *((_DWORD *)v24 + v46) = v52[25];
            *((_DWORD *)v24 + v49) = v52[26];
            (*((void (**)(id, char *, void *, void, void, void, void, void))a9 + 2))(a9, v23, v24, v28 + (*(_DWORD *)(v21 + 108) >> 30), v52[28], v52[29], v52[30], v52[31]);
            free(v23);
            free(v25);
          }
          else
          {
            if ((unint64_t)v22 >= *v64)
            {
              uint64_t v53 = ((uint64_t)v22 - *(void *)a6) >> 3;
              if ((unint64_t)(v53 + 1) >> 61) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v54 = *v64 - *(void *)a6;
              uint64_t v55 = v54 >> 2;
              if (v54 >> 2 <= (unint64_t)(v53 + 1)) {
                uint64_t v55 = v53 + 1;
              }
              if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v56 = v55;
              }
              if (v56) {
                v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)v64, v56);
              }
              else {
                v57 = 0;
              }
              v58 = (uint64_t *)&v57[8 * v53];
              uint64_t *v58 = v21;
              uint64_t v43 = v58 + 1;
              v60 = *(char **)a6;
              v59 = (char *)*((void *)a6 + 1);
              if (v59 != *(char **)a6)
              {
                do
                {
                  uint64_t v61 = *((void *)v59 - 1);
                  v59 -= 8;
                  *--v58 = v61;
                }
                while (v59 != v60);
                v59 = *(char **)a6;
              }
              *(void *)a6 = v58;
              *((void *)a6 + 1) = v43;
              *((void *)a6 + 2) = &v57[8 * v56];
              if (v59) {
                operator delete(v59);
              }
            }
            else
            {
              *uint64_t v22 = v21;
              uint64_t v43 = v22 + 1;
            }
            *((void *)a6 + 1) = v43;
            if (([a1 ReadHashTable:v63 begin:*(unsigned int *)(v17 + (v20 << 7) + 112) end:*(unsigned int *)(v17 + (v20 << 7) + 116) hashList:a6 reader:a7 errorHandler:v67 handler:a9] & 1) == 0)
            {
              *((void *)a6 + 1) -= 8;
              if (!v67[2](v67, 1)) {
                return v19;
              }
            }
            *((void *)a6 + 1) -= 8;
          }
          BOOL v19 = ++v20 >= v18;
          if (v20 == v18) {
            return v19;
          }
        }
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6) {
    return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0, a4, a2, a3, 32, a5, a6, a7, a8);
  }
  else {
    return 0;
  }
}

uint64_t __105__MTLLoader_deserializeAirntMachOContainerWithHandler_objectHandler_pipelineHandler_errorHandler_reader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  if (a7 == 32) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  else {
    return 0;
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

+ (unint64_t)sliceIDForDevice:(void *)a3 legacyDriverVersion:(_DWORD *)a4 airntDriverVersion:
{
  uint64_t v7 = self;
  uint64_t v8 = (void *)MEMORY[0x18530C9F0](v7);
  uint64_t v13 = (void *)[a2 targetDeviceArchitecture];
  if (v13)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  MTLReportFailure(0, "+[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]", 685, @"Target device architecture is nil", v9, v10, v11, v12, v17);
  if (a3) {
LABEL_3:
  }
    *a3 = [v13 driverVersion];
LABEL_4:
  if (a4) {
    *a4 = [v13 versionCombined];
  }
  unsigned int v14 = [v13 cpuType];
  uint64_t v15 = [v13 subType];
  return v14 | (unint64_t)(v15 << 32);
}

- (uint64_t)loadFileWithURL:(NSError *)a3 error:(NSString *)a4 errorDomain:(uint64_t)a5 invalidFileErrorCode:
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    if (a3)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is nil" forKey:*MEMORY[0x1E4F28568]];
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      *a3 = (NSError *)(id)[v9 initWithDomain:*MEMORY[0x1E4F289A0] code:-1100 userInfo:v8];
    }
    return 0;
  }
  int v6 = *(LoaderGlobalState **)(a1 + 8);

  return LoaderGlobalState::loadFile(v6, a2, a3, a4, a5);
}

+ (unint64_t)sliceIDForDevice:(void *)a3 andDriverVersion:
{
  self;

  return +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a2, a3, 0);
}

+ (uint64_t)sliceIDForDescriptors
{
  return -1;
}

+ (uint64_t)sliceIDForAIRVersion:(uint64_t)a1
{
  return (mapAirVersionToMachOSubType(a2) << 32) | 0x1000017;
}

+ (BOOL)machOConformsToAIRNTFormat:(uint64_t)a3 type:
{
  self;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a2, a3);
  BOOL v8 = v5
    && (unsigned int v6 = v5[4],
        uint64_t v7 = v5[5],
        v10[0] = MEMORY[0x1E4F143A8],
        v10[1] = 3221225472,
        v10[2] = __45__MTLLoader_machOConformsToAIRNTFormat_type___block_invoke,
        v10[3] = &unk_1E5220DC8,
        v10[4] = &v11,
        +[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a2, v6, v7, (uint64_t)v10))&& *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (uint64_t)deserializeAirntMachOContainerWithHandler:(uint64_t)a3 objectHandler:(uint64_t)a4 pipelineHandler:(uint64_t)a5 errorHandler:(uint64_t)a6 reader:
{
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__MTLLoader_deserializeAirntMachOContainerWithHandler_objectHandler_pipelineHandler_errorHandler_reader___block_invoke;
  v12[3] = &unk_1E5220F20;
  v12[4] = a2;
  return +[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v12, 1, a3, a4, a5, a6);
}

+ (uint64_t)deserializeMachOContainerWithHandlerInternal:(int)a3 expectAIRNTFormat:(uint64_t)a4 objectHandler:(uint64_t)a5 pipelineHandler:(uint64_t)a6 errorHandler:(uint64_t)a7 reader:
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v13 = (_DWORD *)(*(uint64_t (**)(uint64_t, void, uint64_t))(a7 + 16))(a7, 0, 32);
  if (!v13 || *v13 != -17958193) {
    goto LABEL_56;
  }
  uint64_t v14 = v13[1];
  BOOL v15 = (v14 - 16777235) > 4 || v14 == 16777238;
  if (v15 && v14 != -1) {
    goto LABEL_56;
  }
  int v17 = v13[3];
  uint64_t v76 = v13[2];
  if (v17 != 2 && v17 != 8)
  {
    if (v17 != 13)
    {
LABEL_56:
      LOBYTE(a3) = 0;
      return a3 & 1;
    }
    if (!a3) {
      return a3 & 1;
    }
  }
  uint64_t v75 = a2;
  unsigned int v19 = v13[4];
  uint64_t v20 = v13[5];
  uint64_t v138 = 0;
  v139 = &v138;
  uint64_t v140 = 0x4812000000;
  v141 = __Block_byref_object_copy__57;
  v142 = __Block_byref_object_dispose__58;
  v143 = &unk_1828FE28A;
  uint64_t v145 = 0;
  uint64_t v146 = 0;
  uint64_t v144 = 0;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x2020000000;
  uint64_t v137 = 0;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x4812000000;
  v128 = __Block_byref_object_copy__57;
  v129 = __Block_byref_object_dispose__58;
  v130 = &unk_1828FE28A;
  uint64_t v133 = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x4812000000;
  v119 = __Block_byref_object_copy__57;
  v120 = __Block_byref_object_dispose__58;
  v121 = &unk_1828FE28A;
  uint64_t v124 = 0;
  uint64_t v122 = 0;
  uint64_t v123 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  int v115 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x2020000000;
  char v111 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3812000000;
  v106 = __Block_byref_object_copy__54;
  uint64_t v109 = 0;
  v107 = __Block_byref_object_dispose__55;
  uint64_t v108 = 0;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x5812000000;
  v101[3] = __Block_byref_object_copy__76;
  memset(&v101[5], 0, 40);
  v101[4] = __Block_byref_object_dispose__77;
  int v102 = 1065353216;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  int v100 = 1;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = v20 + 32;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke;
  v86[3] = &unk_1E5220E80;
  v86[4] = v99;
  v86[5] = v101;
  v86[6] = &v138;
  v86[7] = &v134;
  v86[8] = &v87;
  v86[9] = &v103;
  v86[10] = v110;
  v86[11] = &v95;
  v86[12] = &v91;
  v86[13] = &v112;
  v86[14] = &v125;
  v86[15] = &v116;
  if ((+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a7, v19, v20, (uint64_t)v86) & 1) == 0)goto LABEL_128; {
  if (a3)
  }
  {
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(v104[6] + 8);
    a3 = 1;
    while (1)
    {
      uint64_t v23 = (uint64_t *)v104[6];
      if (v22)
      {
        if ((a3 & 1) == 0) {
          goto LABEL_128;
        }
        uint64_t v24 = v23 + 1;
      }
      else
      {
        int v25 = v23[v21 + 2];
        int v26 = (v25 != 6) & a3;
        if (v25 != 6 || ((a3 ^ 1) & 1) != 0) {
          goto LABEL_29;
        }
        uint64_t v24 = &v23[v21 + 1];
        uint64_t v23 = (uint64_t *)((char *)v23 + v21 * 8);
      }
      uint64_t v27 = *v23;
      uint64_t v28 = *v24;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_2;
      v83[3] = &unk_1E5220EA8;
      v83[4] = a2;
      int v84 = v14;
      int v85 = v76;
      int v26 = +[MTLLoader deserializeHashesFromAIRNTHeaderAtOffset:v27 headerSize:v28 singleHeaderExpected:v22 != 0 reader:a7 errorHandler:a6 handler:v83];
      if (v22)
      {
        if (!v26) {
          goto LABEL_128;
        }
        uint64_t v23 = (uint64_t *)v104[6];
        goto LABEL_36;
      }
      uint64_t v23 = (uint64_t *)v104[6];
      int v25 = v23[v21 + 2];
LABEL_29:
      if (v25 == 3) {
        int v29 = 0;
      }
      else {
        int v29 = v26;
      }
      if (v25 != 3 || v26 == 0) {
        goto LABEL_40;
      }
LABEL_36:
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_3;
      v82[3] = &unk_1E5220ED0;
      v82[4] = a4;
      BOOL v31 = +[MTLLoader deserializeObjectFromAIRNTHeaderAtSection:v23 reader:a7 errorHandler:a6 handler:v82];
      int v29 = v31;
      if (!v22)
      {
        uint64_t v23 = (uint64_t *)v104[6];
        int v25 = v23[v21 + 2];
LABEL_40:
        if (v25 == 5) {
          a3 = 0;
        }
        else {
          a3 = v29;
        }
        if (v25 != 5 || v29 == 0) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      if (!v31) {
        goto LABEL_128;
      }
      uint64_t v23 = (uint64_t *)v104[6];
LABEL_47:
      uint64_t v33 = &v23[v21];
      uint64_t v34 = v23[v21];
      uint64_t v35 = v33[1];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_4;
      v81[3] = &unk_1E5220EF8;
      v81[4] = a5;
      a3 = +[MTLLoader deserializePipelinesFromAIRNTHeaderAtOffset:v34 headerSize:v35 singleHeaderExpected:v22 != 0 reader:a7 errorHandler:a6 handler:v81];
LABEL_48:
      if (!v22)
      {
        if (a3)
        {
          BOOL v15 = v21 == 24;
          v21 += 3;
          if (!v15) {
            continue;
          }
        }
      }
      goto LABEL_129;
    }
  }
  int v80 = 1027;
  if (v17 == 2 && *((unsigned char *)v96 + 24))
  {
    char v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int *, void, void, uint64_t, void, void))(a2 + 16))(a2, v14 | (v76 << 32), v92[3], 1, &+[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]::dummy, &v80, 0, 0, v88[3], 0, 0);
LABEL_73:
    LOBYTE(a3) = v37;
    goto LABEL_129;
  }
  if (!v139[6]) {
    goto LABEL_128;
  }
  if (v126[6]) {
    BOOL v38 = v126[7] != 0;
  }
  else {
    BOOL v38 = 0;
  }
  if (v117[6]) {
    BOOL v39 = v117[7] != 0;
  }
  else {
    BOOL v39 = 0;
  }
  if (v14 != -1) {
    BOOL v38 = 1;
  }
  if (!v38 && !v39)
  {
    char v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int *, void))(a2 + 16))(a2, (v76 << 32) | 0xFFFFFFFFLL, v92[3], 1, &+[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]::dummy, &v80, 0);
    goto LABEL_73;
  }
  if (!*((unsigned char *)v96 + 24) || (unint64_t v40 = *((unsigned int *)v113 + 6), !v40))
  {
LABEL_128:
    LOBYTE(a3) = 0;
    goto LABEL_129;
  }
  __p = 0;
  v78 = 0;
  v79 = 0;
  std::vector<nlist_64>::reserve(&__p, v40);
  uint64_t v41 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a7 + 16))(a7, v126[6], v126[7]);
  if (!v41) {
    goto LABEL_132;
  }
  if (*((_DWORD *)v113 + 6))
  {
    unint64_t v42 = 0;
    uint64_t v43 = v78;
    do
    {
      v44 = (_OWORD *)(v41 + 16 * v42);
      if (v43 >= v79)
      {
        uint64_t v45 = (v43 - (unsigned char *)__p) >> 4;
        if ((unint64_t)(v45 + 1) >> 60) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v46 = (v79 - (unsigned char *)__p) >> 3;
        if (v46 <= v45 + 1) {
          unint64_t v46 = v45 + 1;
        }
        if ((unint64_t)(v79 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v47 = v46;
        }
        if (v47) {
          long long v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)&v79, v47);
        }
        else {
          long long v48 = 0;
        }
        uint64_t v49 = &v48[16 * v45];
        *(_OWORD *)uint64_t v49 = *v44;
        long long v51 = (char *)__p;
        v50 = v78;
        v52 = v49;
        if (v78 != __p)
        {
          do
          {
            *((_OWORD *)v52 - 1) = *((_OWORD *)v50 - 1);
            v52 -= 16;
            v50 -= 16;
          }
          while (v50 != v51);
          v50 = (char *)__p;
        }
        uint64_t v43 = v49 + 16;
        __p = v52;
        v78 = v49 + 16;
        v79 = &v48[16 * v47];
        if (v50) {
          operator delete(v50);
        }
      }
      else
      {
        *(_OWORD *)uint64_t v43 = *v44;
        v43 += 16;
      }
      v78 = v43;
      ++v42;
    }
    while (v42 < *((unsigned int *)v113 + 6));
  }
  uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a7 + 16))(a7, v117[6], v117[7]);
  if (v53)
  {
    uint64_t v55 = (unsigned int *)__p;
    uint64_t v54 = (unsigned int *)v78;
    if (__p != v78)
    {
      LOBYTE(a3) = 1;
      uint64_t v56 = v14 | (v76 << 32);
      while (1)
      {
        if ((~*((unsigned __int8 *)v55 + 4) & 0xE) == 0)
        {
          v57 = v139;
          if (*((_DWORD *)v139 + 16) == *((unsigned __int8 *)v55 + 5))
          {
            unint64_t v58 = *v55;
            unint64_t v59 = v117[7];
            if (v59 <= v58) {
              goto LABEL_132;
            }
            v60 = (const char *)(v53 + v58);
            unsigned int v61 = v59 - v58;
            size_t v62 = v61 >= 0x41 ? 65 : v61;
            unsigned int v63 = strnlen(v60, v62);
            if (v63) {
              goto LABEL_132;
            }
            unint64_t v64 = v63 >> 1;
            if (v63 < 2) {
              goto LABEL_107;
            }
            uint64_t v66 = 0;
            uint64_t v67 = v64 <= 1 ? 1 : v63 >> 1;
            do
            {
              uint64_t v68 = 0;
              char v69 = 0;
              char v70 = 1;
              do
              {
                char v71 = v70;
                int v72 = v60[v68];
                char v73 = v72 - 48;
                if ((v72 - 48) >= 0xA)
                {
                  if ((v72 - 65) > 5)
                  {
                    if ((v72 - 97) > 5) {
                      goto LABEL_132;
                    }
                    char v73 = v72 - 87;
                  }
                  else
                  {
                    char v73 = v72 - 55;
                  }
                }
                char v70 = 0;
                char v69 = v73 + 16 * v69;
                ++v68;
              }
              while ((v71 & 1) != 0);
              v147[v66++] = v69;
              v60 += 2;
            }
            while (v66 != v67);
            if (v63 <= 0x3F)
            {
LABEL_107:
              unint64_t v65 = 31 - v64;
              if (v64 > 0x1F) {
                unint64_t v65 = 0;
              }
              bzero(&v147[v64], v65 + 1);
            }
            if (a3) {
              LOBYTE(a3) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *, int *, unint64_t, uint64_t, void, void, void))(v75 + 16))(v75, v56, v92[3], 1, v147, &v80, v64, *((void *)v55 + 1) - v135[3] + v57[6], 0, 0, 0);
            }
            else {
              LOBYTE(a3) = 0;
            }
          }
        }
        v55 += 4;
        if (v55 == v54) {
          goto LABEL_133;
        }
      }
    }
    LOBYTE(a3) = 1;
    if (!__p) {
      goto LABEL_129;
    }
  }
  else
  {
LABEL_132:
    LOBYTE(a3) = 0;
LABEL_133:
    uint64_t v55 = (unsigned int *)__p;
    if (!__p) {
      goto LABEL_129;
    }
  }
  v78 = (char *)v55;
  operator delete(v55);
LABEL_129:
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v101[6]);
  _Block_object_dispose(&v103, 8);
  uint64_t v74 = v109;
  uint64_t v109 = 0;
  if (v74) {
    MEMORY[0x18530C120](v74, 0x1000C800CE834B2);
  }
  _Block_object_dispose(v110, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v138, 8);
  return a3 & 1;
}

+ (BOOL)deserializePipelinesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8
{
  BOOL v10 = a5;
  uint64_t v11 = (*((uint64_t (**)(id, unint64_t, unint64_t))a6 + 2))(a6, a3, a4);
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      int v13 = (*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 10);
      if (!v13) {
        return v13;
      }
    }
    uint64_t v14 = (unsigned int *)(v12 + 8);
    v12 += 4;
  }
  else
  {
    if (!v11)
    {
      int v13 = (*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 10);
      if (!v13) {
        return v13;
      }
    }
    uint64_t v14 = (unsigned int *)(v12 + 1);
  }
  uint64_t v15 = *v14;
  (*((void (**)(id, void, uint64_t))a6 + 2))(a6, *v12, 4 * v15);
  if (v15) {
    operator new();
  }
  LOBYTE(v13) = 1;
  return v13;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)deserializeHashesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8
{
  BOOL v10 = a5;
  uint64_t v12 = (*((uint64_t (**)(id, unint64_t, unint64_t))a6 + 2))(a6, a3, a4);
  int v13 = (void *)v12;
  if (!v10)
  {
    if (v12 || (*((unsigned int (**)(id, void))a7 + 2))(a7, 0))
    {
      uint64_t v14 = (int *)(v13 + 1);
      goto LABEL_8;
    }
    return 0;
  }
  if (!v12 && !(*((unsigned int (**)(id, void))a7 + 2))(a7, 0)) {
    return 0;
  }
  uint64_t v14 = (int *)v13 + 17;
  v13 += 5;
LABEL_8:
  int v15 = *v14;
  if (*v13) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16) {
    return objc_msgSend(a1, "ReadHashTable:begin:end:hashList:reader:errorHandler:handler:", a8);
  }
  (*((void (**)(id, uint64_t))a7 + 2))(a7, 3);
  return 1;
}

- (void)releaseLoadedFile:(uint64_t)a1
{
  if (a1) {
    LoaderGlobalState::releaseFile(*(LoaderGlobalState **)(a1 + 8), a2);
  }
}

- (void)dealloc
{
  claimQueue = self->_claimQueue;
  if (claimQueue) {
    dispatch_release(claimQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLLoader;
  [(MTLLoader *)&v4 dealloc];
}

- (uint64_t)associateLoadedFile:(uint64_t)a3 withObject:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3052000000;
  BOOL v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  uint64_t v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MTLLoader_associateLoadedFile_withObject___block_invoke;
  v6[3] = &unk_1E5220D78;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = &v7;
  dispatch_sync(v3, v6);
  uint64_t v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__44__MTLLoader_associateLoadedFile_withObject___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t result = std::__hash_table<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::__unordered_map_hasher<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::hash<MTLFunctionStitchingFunctionNode *>,std::equal_to<MTLFunctionStitchingFunctionNode *>,true>,std::__unordered_map_equal<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::equal_to<MTLFunctionStitchingFunctionNode *>,std::hash<MTLFunctionStitchingFunctionNode *>,true>,std::allocator<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>>>::find<MTLFunctionStitchingFunctionNode *>((void *)(a1[4] + 24), a1 + 5);
  if (result)
  {
    uint64_t result = (id)result[3];
    *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  }
  else
  {
    uint64_t v4 = a1[6];
    if (v4)
    {
      uint64_t v5 = a1[4] + 24;
      *(void *)&long long v6 = *v2;
      *((void *)&v6 + 1) = v4;
      return std::__hash_table<std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::__unordered_map_hasher<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::hash<MTLLoadedFile *>,std::equal_to<MTLLoadedFile *>,true>,std::__unordered_map_equal<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::equal_to<MTLLoadedFile *>,std::hash<MTLLoadedFile *>,true>,std::allocator<std::__hash_value_type<MTLLoadedFile *,objc_object *>>>::__emplace_unique_key_args<MTLLoadedFile *,std::pair<MTLLoadedFile *,objc_object *>>(v5, &v6, &v6);
    }
  }
  return result;
}

- (void)disassociateLoadedFile:(uint64_t)a1 withObject:(MTLLoadedFile *)a2
{
  uint64_t v5 = a2;
  if (a1)
  {
    uint64_t v3 = (void *)(a1 + 24);
    uint64_t v4 = std::__hash_table<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::__unordered_map_hasher<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::hash<MTLFunctionStitchingFunctionNode *>,std::equal_to<MTLFunctionStitchingFunctionNode *>,true>,std::__unordered_map_equal<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::equal_to<MTLFunctionStitchingFunctionNode *>,std::hash<MTLFunctionStitchingFunctionNode *>,true>,std::allocator<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>>>::find<MTLFunctionStitchingFunctionNode *>((void *)(a1 + 24), &v5);
    std::__hash_table<std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::__unordered_map_hasher<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::hash<MTLLoadedFile *>,std::equal_to<MTLLoadedFile *>,true>,std::__unordered_map_equal<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::equal_to<MTLLoadedFile *>,std::hash<MTLLoadedFile *>,true>,std::allocator<std::__hash_value_type<MTLLoadedFile *,objc_object *>>>::erase(v3, v4);
    LoaderGlobalState::releaseFile(*(LoaderGlobalState **)(a1 + 8), v5);
  }
}

- (void)executeBlockForLoadedFile:(int)a3 withAssociatedObject:(dispatch_block_t)block block:
{
  if (a1) {
    dispatch_sync(*(dispatch_queue_t *)(a1 + 16), block);
  }
}

+ (uint64_t)sliceIDForAIR:(uint64_t)a1
{
  uint64_t v3 = 16777239;
  self;
  if (a2)
  {
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
    return (mapAirVersionToMachOSubType(v4) << 32) | 0x1000017;
  }
  return v3;
}

+ (uint64_t)deserializeMachOWrapperWithType:(uint64_t)a3 payloadHandler:(uint64_t)a4 reader:
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v7 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a4, a2);
  if (!v7) {
    return 0;
  }
  unsigned int v44 = v7[5];
  unsigned int v45 = v7[4];
  uint64_t v42 = *(void *)(v7 + 1);
  uint64_t v43 = a3;
  uint64_t v99 = 0;
  int v100 = &v99;
  uint64_t v101 = 0x4812000000;
  int v102 = __Block_byref_object_copy__57;
  uint64_t v103 = __Block_byref_object_dispose__58;
  v104 = &unk_1828FE28A;
  uint64_t v107 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v90 = 0;
  uint64_t v91 = &v90;
  uint64_t v92 = 0x4812000000;
  uint64_t v93 = __Block_byref_object_copy__57;
  uint64_t v94 = __Block_byref_object_dispose__58;
  uint64_t v95 = &unk_1828FE28A;
  uint64_t v98 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  uint64_t v86 = 0;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x2020000000;
  int v89 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  int v85 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v70 = 0;
  char v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  uint64_t v110 = 0;
  char v111 = &v110;
  uint64_t v112 = 0xA012000000;
  v113 = __Block_byref_object_copy__61_0;
  uint64_t v114 = __Block_byref_object_dispose__62_0;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  int v69 = 1;
  uint64_t v64 = 0;
  unint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  uint64_t v60 = 0;
  unsigned int v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = v7[5] + 32;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3812000000;
  v52 = __Block_byref_object_copy__54;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v53 = __Block_byref_object_dispose__55;
  *(void *)&long long v120 = objc_opt_new();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke;
  v48[3] = &unk_1E5220DF0;
  v48[6] = v68;
  v48[7] = &v90;
  v48[8] = &v56;
  v48[9] = &v110;
  v48[10] = &v64;
  v48[11] = &v60;
  v48[12] = &v86;
  v48[13] = &v78;
  v48[4] = a4;
  v48[5] = &v99;
  v48[14] = &v74;
  v48[15] = &v82;
  v48[17] = &v49;
  v48[18] = a2;
  v48[16] = &v70;
  if ((+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a4, v45, v44, (uint64_t)v48) & 1) == 0|| a2 == 1 && !v111[13]|| !*((unsigned char *)v65 + 24)|| !v100[6])
  {
    goto LABEL_44;
  }
  if (*((unsigned char *)v61 + 24))
  {
    uint64_t v8 = *(void *)(v50[6] + 8);
    uint64_t v9 = 16;
    do
    {
      uint64_t v10 = v50[6];
      if (v8 || *(_DWORD *)(v10 + v9) == 3)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_3;
        v46[3] = &unk_1E5220E38;
        v46[4] = &v110;
        BOOL v11 = +[MTLLoader deserializeObjectFromAIRNTHeaderAtSection:v10 reader:a4 errorHandler:&__block_literal_global_14 handler:v46];
        if (v8) {
          goto LABEL_30;
        }
      }
      else
      {
        BOOL v11 = 1;
      }
      if (!v11) {
        break;
      }
      BOOL v18 = v9 == 208;
      v9 += 24;
    }
    while (!v18);
    goto LABEL_30;
  }
  if (v71[3])
  {
    uint64_t v13 = v57[3] - 56;
    uint64_t v14 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, 56, v13);
    if (!v14) {
      goto LABEL_44;
    }
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, v14, v13);
    CC_SHA256_Final(md, &c);
    int v15 = (uint64_t *)v71[3];
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    BOOL v18 = *(void *)md == v17 && v109 == v16;
    if (!v18) {
      goto LABEL_44;
    }
    *((unsigned char *)v111 + 88) = 1;
  }
  if (v91[6])
  {
    if ((unint64_t)v91[7] >= 0x20)
    {
      unsigned int v19 = (_OWORD *)(*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
      if (v19)
      {
        uint64_t v20 = v111;
        long long v21 = v19[1];
        *(_OWORD *)(v111 + 7) = *v19;
        *(_OWORD *)(v20 + 9) = v21;
LABEL_30:
        uint64_t v22 = objc_opt_new();
        v111[16] = v22;
        uint64_t v23 = objc_opt_new();
        v111[17] = v23;
        uint64_t v24 = objc_opt_new();
        int v25 = v111;
        v111[15] = v24;
        int v26 = v87;
        if (*((_DWORD *)v87 + 6))
        {
          uint64_t v27 = 0;
          unint64_t v28 = 0;
          do
          {
            uint64_t v29 = v79[3];
            unint64_t v30 = (unsigned int *)(v29 + v27);
            if (*(unsigned char *)(v29 + v27 + 4))
            {
              BOOL v31 = (void *)v24;
              if ((*(unsigned char *)(v29 + v27 + 4) & 0xE) == 0
                || (*(unsigned char *)(v29 + v27 + 4) & 0xE) == 0xE
                && ((v32 = *(unsigned __int8 *)(v29 + v27 + 5), BOOL v31 = (void *)v22, *((_DWORD *)v100 + 16) == v32)
                 || (BOOL v31 = (void *)v23, *((_DWORD *)v91 + 16) == v32)))
              {
                uint64_t v33 = *v30;
                unsigned int v34 = *((_DWORD *)v83 + 6);
                if (v34 <= v33) {
                  goto LABEL_44;
                }
                size_t v35 = strnlen((const char *)(v75[3] + v33), v34 - v33);
                id v36 = [NSString alloc];
                char v37 = (void *)[v36 initWithBytes:v75[3] + v33 length:v35 encoding:4];
                [v31 addObject:v37];

                int v26 = v87;
              }
            }
            ++v28;
            v27 += 16;
          }
          while (v28 < *((unsigned int *)v26 + 6));
          int v25 = v111;
        }
        uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))(v43 + 16))(v43, v42, v25 + 6, v100[6], v100[7], v57[3]);
        BOOL v38 = (id *)v111;
        BOOL v39 = v111[6];
        if (v39) {
          dispatch_release(v39);
        }

        goto LABEL_45;
      }
    }
  }
LABEL_44:
  uint64_t v12 = 0;
LABEL_45:
  _Block_object_dispose(&v49, 8);
  uint64_t v40 = v55;
  uint64_t v55 = 0;
  if (v40) {
    MEMORY[0x18530C120](v40, 0x1000C800CE834B2);
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v99, 8);
  return v12;
}

size_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  size_t result = 0;
  int v7 = *(_DWORD *)a2;
  if (*(int *)a2 <= 26)
  {
    if (v7 <= 11)
    {
      if (v7 == 2)
      {
        if (*(_DWORD *)(a2 + 4) == 24)
        {
          *(_DWORD *)(*(void *)(a1[12] + 8) + 24) = *(_DWORD *)(a2 + 12);
          *(void *)(*(void *)(a1[13] + 8) + 24) = (*(uint64_t (**)(void))(a1[4] + 16))();
          *(void *)(*(void *)(a1[14] + 8) + 24) = (*(uint64_t (**)(void))(a1[4] + 16))();
          *(_DWORD *)(*(void *)(a1[15] + 8) + 24) = *(_DWORD *)(a2 + 20);
          if (*(void *)(*(void *)(a1[13] + 8) + 24))
          {
            if (*(void *)(*(void *)(a1[14] + 8) + 24)) {
              return 1;
            }
          }
        }
      }
      else
      {
        if (v7 != 11) {
          return result;
        }
        if (a1[18] == 1 && *(_DWORD *)(a2 + 4) == 80) {
          return 1;
        }
      }
      return 0;
    }
    if ((v7 - 12) < 2)
    {
      if (a4 < 0x18) {
        return 0;
      }
      size_t result = 0;
      uint64_t v8 = *(unsigned int *)(a2 + 8);
      if (v8 >= 0x18)
      {
        unsigned int v9 = *(_DWORD *)(a2 + 4);
        if (v9 > v8)
        {
          uint64_t v10 = a2 + v8;
          size_t result = strnlen((const char *)(a2 + v8), v9 - v8);
          if (result)
          {
            id v11 = (id)[[NSString alloc] initWithBytes:v10 length:result encoding:4];
            uint64_t v12 = *(void *)(a1[9] + 8);
            if (*(_DWORD *)a2 != 13)
            {
              [*(id *)(v12 + 112) addObject:v11];
              return 1;
            }
            if (!*(void *)(v12 + 104))
            {
              *(void *)(*(void *)(a1[9] + 8) + 104) = v11;
              return 1;
            }
            return 0;
          }
        }
      }
      return result;
    }
    if (v7 != 25) {
      return result;
    }
    if (a4 < 0x48) {
      return 0;
    }
    unsigned int v19 = *(_DWORD *)(a2 + 64);
    if (80 * (unint64_t)v19 + 72 > a4) {
      return 0;
    }
    uint64_t v20 = (void *)(a2 + 8);
    int v38 = strcmp("__TEXT", (const char *)(a2 + 8));
    int v37 = strcmp("__DATA", (const char *)(a2 + 8));
    if (v19)
    {
      unint64_t v21 = 0;
      uint64_t v22 = a2 + 72;
      do
      {
        uint64_t v23 = v22 + 80 * v21;
        BOOL v24 = *(void *)(v23 + 16) == *v20 && *(void *)(v23 + 24) == *(void *)(a2 + 16);
        if (v24)
        {
          if (!strcmp((const char *)(v22 + 80 * v21), "__text"))
          {
            BOOL v28 = 1;
          }
          else
          {
            int v25 = operator new(0x38uLL);
            uint64_t v26 = 0;
            *int v25 = xmmword_1E5220FE0;
            v25[1] = *(_OWORD *)&off_1E5220FF0;
            v25[2] = xmmword_1E5221000;
            *((void *)v25 + 6) = "__object";
            do
            {
              int v27 = strncmp((const char *)(v22 + 80 * v21), *(const char **)((char *)v25 + v26), 0x10uLL);
              BOOL v28 = v27 == 0;
              if (!v27) {
                break;
              }
              BOOL v24 = v26 == 48;
              v26 += 8;
            }
            while (!v24);
            operator delete(v25);
          }
          if (!v38 && v28)
          {
            uint64_t v29 = *(void *)(a1[5] + 8);
            if (*(void *)(v29 + 48)) {
              return 0;
            }
            uint64_t v30 = v22 + 80 * v21;
            *(void *)(v29 + 48) = *(unsigned int *)(v30 + 48);
            *(void *)(*(void *)(a1[5] + 8) + 56) = *(void *)(v30 + 40);
            *(_DWORD *)(*(void *)(a1[5] + 8) + 64) = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
          }
          if (!v37 && !strcmp("__data", (const char *)(v22 + 80 * v21)))
          {
            uint64_t v31 = *(void *)(a1[7] + 8);
            if (*(void *)(v31 + 48)) {
              return 0;
            }
            uint64_t v32 = v22 + 80 * v21;
            *(void *)(v31 + 48) = *(unsigned int *)(v32 + 48);
            *(void *)(*(void *)(a1[7] + 8) + 56) = *(void *)(v32 + 40);
            *(_DWORD *)(*(void *)(a1[7] + 8) + 64) = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
          }
        }
        ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
        ++v21;
      }
      while (v21 < *(unsigned int *)(a2 + 64));
    }
    uint64_t v33 = *(void *)(a1[8] + 8);
    unint64_t v34 = *(void *)(v33 + 24);
    if (v34 <= *(void *)(a2 + 48) + *(void *)(a2 + 40)) {
      unint64_t v34 = *(void *)(a2 + 48) + *(void *)(a2 + 40);
    }
LABEL_64:
    *(void *)(v33 + 24) = v34;
    return 1;
  }
  if (v7 > 48)
  {
    if (v7 == 49)
    {
      if (!*(void *)(*(void *)(a1[17] + 8) + 48)) {
        operator new[]();
      }
      long long v39 = 0uLL;
      uint64_t v40 = 0;
      if (+[MTLLoader isAIRHeaderExtLoadCommand:a2 headerOffset:&v39 headerSize:(char *)&v39 + 8 headerSection:&v40])
      {
        uint64_t v35 = *(void *)(*(void *)(a1[17] + 8) + 48) + 24 * v40;
        long long v36 = v39;
        *(void *)(v35 + 16) = v40;
        *(_OWORD *)uint64_t v35 = v36;
        *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(a1[9] + 8) + 89) = 1;
      }
      return 1;
    }
    if (v7 != 50) {
      return result;
    }
    uint64_t v14 = *(unsigned int *)(a2 + 4);
    if (v14 < 0x18) {
      return 0;
    }
    unsigned int v41 = 0;
    uint64_t v15 = *(unsigned int *)(a2 + 20);
    if (8 * v15 + 24 != v14) {
      return 0;
    }
    if (!v15)
    {
      uint64_t v13 = 0;
LABEL_81:
      *(void *)(*(void *)(a1[9] + 8) + 96) = v13;
      *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
      return 1;
    }
    uint64_t v16 = (unsigned int *)(a2 + 28);
    while (1)
    {
      int v17 = *(v16 - 1);
      if (v17 == 1026) {
        break;
      }
      if (v17 == 1027)
      {
        BOOL v18 = &v41;
LABEL_28:
        *BOOL v18 = *v16;
      }
      v16 += 2;
      if (!--v15)
      {
        uint64_t v13 = v41;
        goto LABEL_81;
      }
    }
    BOOL v18 = (unsigned int *)&v39;
    goto LABEL_28;
  }
  if (v7 != 27)
  {
    if (v7 != 42) {
      return result;
    }
    if (*(unsigned char *)(*(void *)(a1[11] + 8) + 24)) {
      return 1;
    }
    if (*(_DWORD *)(a2 + 4) == 16 && !*(unsigned char *)(*(void *)(a1[10] + 8) + 24))
    {
      uint64_t v13 = *(void *)(a2 + 8);
      goto LABEL_81;
    }
    return 0;
  }
  if (a4 < 0x18) {
    return 0;
  }
  if (*(unsigned char *)(*(void *)(a1[11] + 8) + 24)) {
    return 1;
  }
  if (*(_DWORD *)(a2 + 4) != 24) {
    return 0;
  }
  size_t result = 0;
  if (!a3)
  {
    uint64_t v33 = *(void *)(a1[16] + 8);
    if (!*(void *)(v33 + 24))
    {
      unint64_t v34 = a2 + 8;
      goto LABEL_64;
    }
  }
  return result;
}

uint64_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_2()
{
  return 0;
}

uint64_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_3(uint64_t a1, MTLAirNTObject *this)
{
  uint64_t v3 = **(uint64_t ***)this;
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 144) = v5;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 152) = v4;
  MTLAirNTObject::~MTLAirNTObject(this);
  MEMORY[0x18530C140](this, 0x10D0C40EB84C869);
  return 1;
}

+ (uint64_t)deserializeMachOContainerWithHandler:(uint64_t)a3 reader:
{
  self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke;
  v6[3] = &unk_1E5220F20;
  v6[4] = a2;
  return +[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v6, 0, 0, 0, (uint64_t)&__block_literal_global_82, a3);
}

uint64_t __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 <= 1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return 0;
  }
}

uint64_t __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke_2()
{
  return 0;
}

+ (uint64_t)serializeMachOWrapperWithType:(uint64_t)a3 slice:(uint64_t)a4 payload:(void *)a5 writer:
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  self;
  memset(&v117, 0, sizeof(v117));
  if (a2 == 1)
  {
    uint64_t v8 = *(void **)(a4 + 56);
    unsigned int v9 = [v8 lengthOfBytesUsingEncoding:4];
    LODWORD(__src) = 13;
    HIDWORD(__src) = (v9 & 0xFFFFFFF8) + 32;
    long long v120 = xmmword_1828F0E00;
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, (char *)&__src, (char *)v121, 24);
    uint64_t v10 = (char *)[v8 UTF8String];
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, v10, &v10[v9], v9);
    unint64_t v11 = (LODWORD(v117.__end_) - LODWORD(v117.__begin_) + 8) & 0xFFFFFFF8;
    __x[0] = 0;
    if (v11 <= v117.__end_ - v117.__begin_)
    {
      if (v11 < v117.__end_ - v117.__begin_) {
        v117.__end_ = &v117.__begin_[v11];
      }
    }
    else
    {
      std::vector<char>::__append(&v117, v11 - (v117.__end_ - v117.__begin_), __x);
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v13 = *(void **)(a4 + 64);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v113 objects:v174 count:16];
  int v81 = v12;
  uint64_t v77 = a3;
  uint64_t v80 = a4;
  if (v14)
  {
    uint64_t v15 = *(void *)v114;
    do
    {
      uint64_t v16 = 0;
      v81 += v14;
      do
      {
        if (*(void *)v114 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = *(void **)(*((void *)&v113 + 1) + 8 * v16);
        unsigned int v18 = [v17 lengthOfBytesUsingEncoding:4];
        LODWORD(__src) = 12;
        HIDWORD(__src) = (v18 & 0xFFFFFFF8) + 32;
        long long v120 = xmmword_1828F0E00;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, (char *)&__src, (char *)v121, 24);
        unsigned int v19 = (char *)[v17 UTF8String];
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, v19, &v19[v18], v18);
        unint64_t v20 = (LODWORD(v117.__end_) - LODWORD(v117.__begin_) + 8) & 0xFFFFFFF8;
        __x[0] = 0;
        if (v20 <= v117.__end_ - v117.__begin_)
        {
          if (v20 < v117.__end_ - v117.__begin_) {
            v117.__end_ = &v117.__begin_[v20];
          }
        }
        else
        {
          std::vector<char>::__append(&v117, v20 - (v117.__end_ - v117.__begin_), __x);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v113 objects:v174 count:16];
    }
    while (v14);
  }
  char v111 = 0;
  __p = 0;
  uint64_t v112 = 0;
  uint64_t v107 = 0;
  __dst = 0;
  uint64_t v109 = 0;
  unint64_t v21 = operator new(1uLL);
  uint64_t v78 = a2;
  *unint64_t v21 = 32;
  __dst = v21 + 1;
  uint64_t v109 = v21 + 1;
  uint64_t v107 = v21;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = *(void **)(v80 + 80);
  uint64_t v22 = [obj countByEnumeratingWithState:&v103 objects:v173 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v104 != v23) {
          objc_enumerationMutation(obj);
        }
        int v25 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        int v26 = [v25 lengthOfBytesUsingEncoding:4];
        int v27 = (int)__dst;
        int v28 = (int)v107;
        uint64_t v29 = (char *)[v25 UTF8String];
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v29, &v29[v26 + 1], (v26 + 1));
        LODWORD(__src) = v27 - v28;
        HIDWORD(__src) = 1179919;
        *(void *)&long long v120 = 0x100000000;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v103 objects:v173 count:16];
    }
    while (v22);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obja = *(void **)(v80 + 88);
  uint64_t v30 = [obja countByEnumeratingWithState:&v99 objects:v172 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v100 != v31) {
          objc_enumerationMutation(obja);
        }
        uint64_t v33 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        int v34 = [v33 lengthOfBytesUsingEncoding:4];
        int v35 = (int)__dst;
        int v36 = (int)v107;
        int v37 = (char *)[v33 UTF8String];
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v37, &v37[v34 + 1], (v34 + 1));
        LODWORD(__src) = v35 - v36;
        HIDWORD(__src) = 1180175;
        *(void *)&long long v120 = 0x200000000;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      uint64_t v30 = [obja countByEnumeratingWithState:&v99 objects:v172 count:16];
    }
    while (v30);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  int v38 = *(void **)(v80 + 72);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v171 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v96;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v96 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v42 = *(void **)(*((void *)&v95 + 1) + 8 * k);
        int v43 = [v42 lengthOfBytesUsingEncoding:4];
        int v44 = (int)__dst;
        int v45 = (int)v107;
        unint64_t v46 = (char *)[v42 UTF8String];
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v46, &v46[v43 + 1], (v43 + 1));
        LODWORD(__src) = v44 - v45;
        HIDWORD(__src) = 1;
        *(void *)&long long v120 = 0;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v171 count:16];
    }
    while (v39);
  }
  uint64_t v47 = v80;
  size_t size = dispatch_data_get_size(*(dispatch_data_t *)v80);
  int v49 = [*(id *)(v80 + 80) count];
  int v50 = [*(id *)(v80 + 88) count];
  int v51 = [*(id *)(v80 + 72) count];
  p_srCC_SHA256_CTX c = &__src;
  int v53 = *(unsigned __int8 *)(v80 + 40);
  uint64_t v54 = 552;
  if (!*(unsigned char *)(v80 + 40)) {
    uint64_t v54 = 528;
  }
  uint64_t v55 = -80;
  if (v78 == 1) {
    uint64_t v55 = 0;
  }
  uint64_t objb = v54 + v55;
  int64_t v56 = v117.__end_ - v117.__begin_ + v54 + v55;
  size_t v57 = v56 + size;
  uint64_t v58 = (v56 + size + 39) & 0xFFFFFFF8;
  uint64_t v59 = v107;
  if ((unint64_t)(v58 + (unsigned char *)v111 - (unsigned char *)__p + (unsigned char *)__dst - v107) >> 32)
  {
    uint64_t v60 = 0;
    if (!v107) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  v167[0] = -17958193;
  v167[1] = v77;
  if (v78 == 1) {
    int v62 = 6;
  }
  else {
    int v62 = 1;
  }
  if (v78 == 1) {
    int v63 = 6;
  }
  else {
    int v63 = 5;
  }
  if (v78 == 1) {
    int v64 = 1048580;
  }
  else {
    int v64 = 260;
  }
  if (!v78) {
    int v62 = 2;
  }
  v167[2] = HIDWORD(v77);
  v167[3] = v62;
  v167[4] = v63 + v81 + v53;
  v167[5] = v56 - 32;
  v167[6] = v64;
  uint64_t v168 = 0x1B00000000;
  int v169 = 24;
  long long v170 = 0uLL;
  __srCC_SHA256_CTX c = 0x9800000019;
  long long v120 = *(_OWORD *)"__TEXT";
  v121[0] = 0x100000000;
  v121[1] = v56 + size;
  v121[2] = 0;
  v121[3] = v56 + size;
  long long v122 = xmmword_1828F0E10;
  long long v123 = *(_OWORD *)"__text";
  long long v124 = *(_OWORD *)"__TEXT";
  int64_t v125 = v56 + 0x100000000;
  size_t v126 = size;
  long long v128 = xmmword_1828F0E20;
  long long v129 = xmmword_1828F0E30;
  int v127 = v56;
  int v130 = 152;
  long long v131 = *(_OWORD *)"__DATA";
  size_t v65 = v58 - v57;
  uint64_t v132 = 0x200000000;
  size_t v133 = v58 - v57;
  size_t v134 = v56 + size;
  size_t v135 = v58 - v57;
  long long v136 = xmmword_1828F0E40;
  long long v137 = *(_OWORD *)"__data";
  long long v138 = *(_OWORD *)"__DATA";
  long long v139 = xmmword_1828F0E50;
  int v140 = v56 + size;
  uint64_t v142 = 0;
  uint64_t v141 = 0;
  uint64_t v143 = 0;
  int v144 = 0;
  uint64_t v145 = 0x4800000019;
  long long v146 = *(_OWORD *)"__LINKEDIT";
  uint64_t v147 = 0x300000000;
  uint64_t v148 = (char *)((unsigned char *)v111 - (unsigned char *)__p + (unsigned char *)__dst - v107);
  uint64_t v149 = (v56 + size + 39) & 0xFFFFFFF8;
  v150 = v148;
  long long v151 = xmmword_1828F0E60;
  uint64_t v152 = 0x100000002ALL;
  uint64_t v153 = *(void *)(v80 + 48);
  uint64_t v154 = 0x1800000002;
  int v155 = (v56 + size + 39) & 0xFFFFFFF8;
  int v156 = v51 + v50 + v49;
  int v157 = v58 + v111 - __p;
  int v158 = __dst - v107;
  long long v165 = 0u;
  long long v164 = 0u;
  uint64_t v163 = 0;
  long long v160 = 0u;
  uint64_t v166 = 0;
  uint64_t v159 = 0x500000000BLL;
  HIDWORD(v160) = v50 + v49;
  int v161 = v50 + v49;
  int v162 = v51;
  *(void *)__x = 0;
  int v89 = __x;
  uint64_t v90 = 0x9812000000;
  uint64_t v91 = __Block_byref_object_copy__88;
  uint64_t v92 = __Block_byref_object_dispose__89;
  uint64_t v93 = &unk_1828FE28A;
  if (v53) {
    CC_SHA256_Init(&v94);
  }
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v87[0] = __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke;
  v87[1] = &unk_1E5220F48;
  v87[2] = __x;
  uint64_t v66 = v65 - 32;
  char v67 = 1;
  LOBYTE(v60) = 1;
  while (1)
  {
    while (1)
    {
      char v68 = v67;
      if ((v67 & 1) == 0) {
        break;
      }
      char v67 = 0;
      if (*(unsigned char *)(v47 + 40))
      {
        uint64_t v69 = 0;
        uint64_t v70 = -56;
        char v71 = v86;
        if ((v60 & 1) == 0) {
          goto LABEL_69;
        }
        goto LABEL_77;
      }
    }
    if (*(unsigned char *)(v47 + 40)) {
      uint64_t v69 = 56;
    }
    else {
      uint64_t v69 = 32;
    }
    if (*(unsigned char *)(v47 + 40)) {
      uint64_t v70 = -56;
    }
    else {
      uint64_t v70 = -32;
    }
    char v71 = a5;
    if ((v60 & 1) == 0)
    {
LABEL_69:
      int v72 = 0;
      goto LABEL_87;
    }
LABEL_77:
    if (v68) {
      uint64_t v73 = v87;
    }
    else {
      uint64_t v73 = a5 + 2;
    }
    int v72 = ((uint64_t (*)(void *, _DWORD *, uint64_t, uint64_t *))*v73)(v71, v167, v69, p_src);
    if (v72)
    {
      int v72 = ((uint64_t (*)(void *, uint64_t *, uint64_t))*v73)(v71, &__src, v70 + objb);
      if (v72)
      {
        int v72 = ((uint64_t (*)(void *, std::vector<char>::pointer, void))*v73)(v71, v117.__begin_, (LODWORD(v117.__end_) - LODWORD(v117.__begin_)));
        if (v72)
        {
          uint64_t v47 = v80;
          uint64_t v74 = *(NSObject **)v80;
          applier[0] = MEMORY[0x1E4F143A8];
          applier[1] = 3221225472;
          applier[2] = __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke_2;
          applier[3] = &unk_1E5220F70;
          applier[4] = v71;
          int v72 = dispatch_data_apply(v74, applier);
          if (v72) {
            int v72 = ((uint64_t (*)(void *, uint64_t, uint64_t))*v73)(v71, v80 + 8, 32);
          }
          if (!v66) {
            goto LABEL_93;
          }
          goto LABEL_88;
        }
      }
    }
LABEL_87:
    uint64_t v47 = v80;
    if (!v66) {
      goto LABEL_93;
    }
LABEL_88:
    if (!v72) {
      break;
    }
    uint64_t v75 = (v68 & 1) != 0 ? v87 : a5 + 2;
    int v72 = ((uint64_t (*)(void *, void *, uint64_t))*v75)(v71, &+[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]::kPadding, v66);
LABEL_93:
    if (!v72) {
      break;
    }
    uint64_t v76 = (v68 & 1) != 0 ? v87 : a5 + 2;
    if (!((unsigned int (*)(void *, void *, int64_t))*v76)(v71, __p, (unsigned char *)v111 - (unsigned char *)__p)) {
      break;
    }
    uint64_t v60 = ((uint64_t (*)(void *, unsigned char *, int64_t))*v76)(v71, v107, (unsigned char *)__dst - v107);
    if ((v68 & 1) == 0) {
      goto LABEL_102;
    }
LABEL_101:
    CC_SHA256_Final((unsigned __int8 *)&md, (CC_SHA256_CTX *)(v89 + 48));
    char v67 = 0;
    long long v170 = md;
  }
  uint64_t v60 = 0;
  if (v68) {
    goto LABEL_101;
  }
LABEL_102:
  _Block_object_dispose(__x, 8);
  uint64_t v59 = v107;
  if (v107)
  {
LABEL_46:
    __dst = v59;
    operator delete(v59);
  }
LABEL_47:
  if (__p)
  {
    char v111 = __p;
    operator delete(__p);
  }
  if (v117.__begin_)
  {
    v117.__end_ = v117.__begin_;
    operator delete(v117.__begin_);
  }
  return v60;
}

uint64_t __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return 1;
}

uint64_t __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (uint64_t)serializeMachOContainerWithSlice:(uint64_t)a3 payload:(unsigned int)a4 count:(void *)a5 writer:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v9 = 0;
  if (!a3 || !a4) {
    return v9;
  }
  if (((a2 - 16777235) > 4 || a2 == 16777238) && a2 != -1) {
    return 0;
  }
  if (a4 == 1)
  {
    return +[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, a2, a3, a5);
  }
  int v62 = a5;
  __p = 0;
  int v72 = 0;
  unsigned int v61 = a4;
  uint64_t v11 = a4;
  uint64_t v73 = 0;
  std::vector<MTLSerializer::ObjectRef>::reserve(&__p, a4);
  uint64_t v12 = 0;
  uint64_t v63 = a2;
  unint64_t v60 = HIDWORD(a2);
  uint64_t v13 = v72;
  do
  {
    uint64_t v14 = a3 + 112 * v12;
    if (v13 >= v73)
    {
      uint64_t v15 = (v13 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v15 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v16 = (v73 - (unsigned char *)__p) >> 2;
      if (v16 <= v15 + 1) {
        unint64_t v16 = v15 + 1;
      }
      if ((unint64_t)(v73 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17) {
        unsigned int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v73, v17);
      }
      else {
        unsigned int v18 = 0;
      }
      unsigned int v19 = &v18[8 * v15];
      *(void *)unsigned int v19 = v14;
      uint64_t v13 = v19 + 8;
      unint64_t v21 = (char *)__p;
      unint64_t v20 = v72;
      if (v72 != __p)
      {
        do
        {
          uint64_t v22 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v19 - 1) = v22;
          v19 -= 8;
        }
        while (v20 != v21);
        unint64_t v20 = (char *)__p;
      }
      __p = v19;
      int v72 = v13;
      uint64_t v73 = &v18[8 * v17];
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *(void *)uint64_t v13 = v14;
      v13 += 8;
    }
    int v72 = v13;
    ++v12;
  }
  while (v12 != a4);
  unint64_t v23 = 126 - 2 * __clz((v13 - (unsigned char *)__p) >> 3);
  if (v13 == __p) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v23;
  }
  std::__introsort<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**,false>((unint64_t **)__p, (unint64_t **)v13, v24, 1);
  uint64_t v25 = 0;
  unsigned int v26 = 0;
  int v27 = (char *)__p;
  uint64_t v28 = *(void *)__p;
  uint64_t v29 = *(void *)(*(void *)__p + 48);
  while (v25 != a4 - 1)
  {
    ++v25;
    uint64_t v30 = *((void *)__p + v25);
    uint64_t v31 = v28 + 8;
    uint64_t v32 = v28 + 40;
    uint64_t v33 = 8;
    while (*(unsigned __int8 *)(v28 + v33) == *(unsigned __int8 *)(v30 + v33))
    {
      if (++v33 == 40) {
        goto LABEL_38;
      }
    }
    uint64_t v32 = v28 + v33;
LABEL_38:
    int v34 = v32 - v31;
    if (v32 - v31 != 32)
    {
      if (v26 <= v34 + 1) {
        unsigned int v26 = v34 + 1;
      }
      uint64_t v28 = *((void *)__p + v25);
      if (*(void *)(v30 + 48) == v29) {
        continue;
      }
    }
    uint64_t v9 = 0;
    if (__p) {
      goto LABEL_78;
    }
    return v9;
  }
  if (v26 + 1 < 0x20) {
    uint64_t v35 = v26 + 1;
  }
  else {
    uint64_t v35 = 32;
  }
  memset(&v70, 0, sizeof(v70));
  uint64_t v36 = (2 * v35) | 1u;
  std::vector<unsigned char>::__append(&v70, a4 * (unint64_t)v36 + 1);
  uint64_t v37 = 0;
  std::vector<char>::pointer begin = v70.__begin_;
  *v70.__begin_ = 32;
  std::vector<char>::pointer v39 = begin + 2;
  do
  {
    if (v35)
    {
      uint64_t v40 = 0;
      std::vector<char>::pointer v41 = v39;
      do
      {
        unint64_t v42 = *(unsigned __int8 *)(*((void *)__p + v37) + v40 + 8);
        *(v41 - 1) = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kHex[v42 >> 4];
        *std::vector<char>::pointer v41 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kHex[v42 & 0xF];
        v41 += 2;
        ++v40;
      }
      while (v35 != v40);
    }
    ++v37;
    v39 += v36;
  }
  while (v37 != a4);
  memset(&v69, 0, sizeof(v69));
  std::vector<unsigned char>::reserve(&v69, 16 * a4);
  uint64_t v59 = 16 * a4;
  uint64_t v43 = 0;
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 8 * a4;
  unsigned int v46 = 1;
  uint64_t v47 = 296;
  do
  {
    uint64_t v74 = 0;
    *(void *)uint64_t v75 = &v74;
    *(void *)&v75[8] = 0x2020000000;
    *(void *)&v75[16] = 0;
    uint64_t v48 = *(void *)((char *)__p + v43);
    v68[0] = v44;
    v68[1] = 3221225472;
    v68[2] = __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke;
    void v68[3] = &unk_1E5220F48;
    v68[4] = &v74;
    if ((+[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, v63, v48, v68) & 1) == 0)
    {
      _Block_object_dispose(&v74, 8);
      goto LABEL_70;
    }
    __srCC_SHA256_CTX c = v46 | 0x2011E00000000;
    p_srCC_SHA256_CTX c = (uint64_t *)(v47 + 4294967000);
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v69, v69.__end_, (char *)&__src, (char *)v67, 16);
    int v49 = *(_DWORD *)(*(void *)v75 + 24) + v47;
    _Block_object_dispose(&v74, 8);
    uint64_t v47 = (v49 + 7) & 0xFFFFFFF8;
    v43 += 8;
    v46 += v36;
  }
  while (v45 != v43);
  if ((unint64_t)(v70.__end_ - v70.__begin_ + v47 + v59) >> 32)
  {
LABEL_70:
    uint64_t v9 = 0;
    goto LABEL_73;
  }
  LODWORD(v74) = -17958193;
  HIDWORD(v74) = v63;
  *(_OWORD *)&v75[4] = xmmword_1828F0E70;
  *(void *)&v75[20] = 0x1900000000;
  *(_DWORD *)uint64_t v75 = v60;
  int v76 = 152;
  long long v77 = *(_OWORD *)"__DATA";
  uint64_t v78 = 0x100000000;
  uint64_t v79 = v47;
  uint64_t v80 = 0;
  uint64_t v81 = v47;
  long long v82 = xmmword_1828F0E80;
  long long v83 = *(_OWORD *)"__data";
  long long v84 = *(_OWORD *)"__DATA";
  uint64_t v85 = 0x100000000;
  uint64_t v86 = v47 - 296;
  uint64_t v87 = 0x300000128;
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v91 = 0x100000002ALL;
  uint64_t v92 = v29;
  uint64_t v93 = 0x4800000019;
  long long v94 = *(_OWORD *)"__LINKEDIT";
  uint64_t v95 = 0x200000000;
  int64_t v96 = v70.__end_ - v70.__begin_ + v59;
  uint64_t v97 = v47;
  int64_t v98 = v96;
  long long v99 = xmmword_1828F0E60;
  uint64_t v100 = 0x1800000002;
  int v101 = v47;
  unsigned int v102 = v61;
  int v103 = v47 + v59;
  int v104 = LODWORD(v70.__end_) - LODWORD(v70.__begin_);
  unsigned __int8 v50 = ((uint64_t (*)(void *, uint64_t *, uint64_t))v62[2])(v62, &v74, 296);
  uint64_t v51 = 0;
  __srCC_SHA256_CTX c = 0;
  p_srCC_SHA256_CTX c = &__src;
  v67[0] = 0x2020000000;
  uint64_t v52 = 296;
  v67[1] = 296;
  uint64_t v53 = 8 * v11;
  while (1)
  {
    uint64_t v54 = (v52 + 7) & 0xFFFFFFF8;
    uint64_t v56 = v54 - v52;
    BOOL v55 = v54 == v52;
    int v57 = (v54 == v52) & v50;
    if (!v55 && (v50 & 1) != 0) {
      int v57 = ((uint64_t (*)(void *, void *, uint64_t))v62[2])(v62, &+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kPadding, v56);
    }
    if (v53 == v51) {
      break;
    }
    p_src[3] = v54;
    if (v57)
    {
      uint64_t v58 = *(void *)((char *)__p + v51);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke_3;
      v64[3] = &unk_1E5220F98;
      v64[4] = v62;
      v64[5] = &__src;
      unsigned __int8 v50 = +[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, v63, v58, v64);
      uint64_t v54 = p_src[3];
    }
    else
    {
      unsigned __int8 v50 = 0;
    }
    v51 += 8;
    uint64_t v52 = v54;
  }
  if (v57
    && ((unsigned int (*)(void *, std::vector<char>::pointer, int64_t))v62[2])(v62, v69.__begin_, v69.__end_ - v69.__begin_))
  {
    uint64_t v9 = ((uint64_t (*)(void *, std::vector<char>::pointer, int64_t))v62[2])(v62, v70.__begin_, v70.__end_ - v70.__begin_);
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_object_dispose(&__src, 8);
LABEL_73:
  if (v69.__begin_)
  {
    v69.__end_ = v69.__begin_;
    operator delete(v69.__begin_);
  }
  if (v70.__begin_)
  {
    v70.__end_ = v70.__begin_;
    operator delete(v70.__begin_);
  }
  int v27 = (char *)__p;
  if (__p)
  {
LABEL_78:
    int v72 = v27;
    operator delete(v27);
  }
  return v9;
}

uint64_t __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a3;
  return 1;
}

uint64_t __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (uint64_t)serializeUniversalBinaryHeaderWithSlice:(_DWORD *)a3 offset:(_DWORD *)a4 length:(unsigned int)a5 count:(uint64_t)a6 writer:
{
  self;
  if (a5)
  {
    if (a5 == 1) {
      return 1;
    }
    v26[0] = -1095041334;
    v26[1] = bswap32(a5);
    LODWORD(result) = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a6 + 16))(a6, v26, 8);
    uint64_t v12 = a5;
    unint64_t v13 = 20 * a5 + 8;
    uint64_t v14 = (unsigned int *)(a2 + 4);
    uint64_t v15 = a4;
    for (uint64_t i = a3; ; i += 2)
    {
      unsigned int v17 = *(v14 - 1);
      if ((v17 - 16777235 > 4 || v17 == 16777238) && v17 != -1) {
        return 0;
      }
      int v20 = (a3 == 0) & result;
      if (a3 && ((result ^ 1) & 1) == 0) {
        int v20 = i[1] == 0;
      }
      if (a4) {
        BOOL v21 = 0;
      }
      else {
        BOOL v21 = v20;
      }
      if (a4 && v20) {
        BOOL v21 = v15[1] == 0;
      }
      unsigned int v22 = bswap32(*v14);
      v25[0] = bswap32(v17);
      v25[1] = v22;
      unsigned int v23 = a3 ? *i : 0;
      v25[2] = bswap32(v23);
      unsigned int v24 = a4 ? *v15 : 0;
      v25[3] = bswap32(v24);
      v25[4] = 50331648;
      if (a3)
      {
        if (*(void *)i < v13) {
          return 0;
        }
      }
      if (a4 && !*(void *)v15) {
        return 0;
      }
      if (a3)
      {
        if ((*(void *)i & 7) != 0) {
          LOBYTE(v21) = 0;
        }
        if (!v21)
        {
          uint64_t result = 0;
          if ((*(void *)i & 7) != 0) {
            return result;
          }
          goto LABEL_41;
        }
      }
      else if (!v21)
      {
        uint64_t result = 0;
        goto LABEL_41;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a6 + 16))(a6, v25, 20);
LABEL_41:
      v14 += 2;
      v15 += 2;
      if (!--v12) {
        return result;
      }
    }
  }
  return 0;
}

+ (uint64_t)serializePaddingForOffset:(uint64_t)a3 writer:
{
  self;
  unsigned int v5 = (a2 + 7) & 0xFFFFFFF8;
  if (v5 == a2) {
    return 1;
  }
  long long v6 = *(uint64_t (**)(uint64_t, void *, void))(a3 + 16);

  return v6(a3, &+[MTLLoader serializePaddingForOffset:writer:]::kPadding, v5 - a2);
}

- (void).cxx_destruct
{
}

+ (unint64_t)serializeMachOContainerWithSlice:(unint64_t *)result payload:(unint64_t *)a2 count:(uint64_t)a3 writer:(char)a4
{
  uint64_t v9 = result;
  while (2)
  {
    uint64_t v10 = a2 - 1;
    uint64_t v11 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v9 = v11;
          uint64_t v12 = (char *)a2 - (char *)v11;
          unint64_t v13 = a2 - v11;
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                long long v83 = *(a2 - 1);
                long long v84 = *v11;
                unint64_t v85 = bswap64(v83[1]);
                unint64_t v86 = bswap64((*v11)[1]);
                if (v85 == v86
                  && (unint64_t v85 = bswap64(v83[2]), v86 = bswap64(v84[2]), v85 == v86)
                  && (unint64_t v85 = bswap64(v83[3]), v86 = bswap64(v84[3]), v85 == v86)
                  && (unint64_t v85 = bswap64(v83[4]), v86 = bswap64(v84[4]), v85 == v86))
                {
                  int v87 = 0;
                }
                else if (v85 < v86)
                {
                  int v87 = -1;
                }
                else
                {
                  int v87 = 1;
                }
                if (v87 < 0)
                {
                  *uint64_t v11 = v83;
                  *(a2 - 1) = v84;
                }
                break;
              case 3uLL:
                uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v11, v11 + 1, a2 - 1);
                break;
              case 4uLL:
                uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v11, v11 + 1, v11 + 2, a2 - 1);
                break;
              case 5uLL:
                uint64_t v88 = v11 + 1;
                uint64_t v89 = v11 + 2;
                uint64_t v90 = v11 + 3;
                uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v11, v11 + 1, v11 + 2, v11 + 3);
                uint64_t v91 = *(a2 - 1);
                uint64_t v92 = v11[3];
                unint64_t v93 = bswap64(v91[1]);
                unint64_t v94 = bswap64(v92[1]);
                if (v93 == v94
                  && (unint64_t v93 = bswap64(v91[2]), v94 = bswap64(v92[2]), v93 == v94)
                  && (unint64_t v93 = bswap64(v91[3]), v94 = bswap64(v92[3]), v93 == v94)
                  && (unint64_t v93 = bswap64(v91[4]), v94 = bswap64(v92[4]), v93 == v94))
                {
                  int v95 = 0;
                }
                else if (v93 < v94)
                {
                  int v95 = -1;
                }
                else
                {
                  int v95 = 1;
                }
                if (v95 < 0)
                {
                  *uint64_t v90 = v91;
                  *(a2 - 1) = v92;
                  long long v160 = *v90;
                  int v161 = *v89;
                  unint64_t v162 = bswap64((*v90)[1]);
                  unint64_t v163 = bswap64((*v89)[1]);
                  if (v162 != v163) {
                    goto LABEL_318;
                  }
                  unint64_t v162 = bswap64(v160[2]);
                  unint64_t v163 = bswap64(v161[2]);
                  if (v162 == v163
                    && (unint64_t v162 = bswap64(v160[3]), v163 = bswap64(v161[3]), v162 == v163)
                    && (unint64_t v162 = bswap64(v160[4]), v163 = bswap64(v161[4]), v162 == v163))
                  {
                    int v164 = 0;
                  }
                  else
                  {
LABEL_318:
                    int v164 = v162 < v163 ? -1 : 1;
                  }
                  if (v164 < 0)
                  {
                    *uint64_t v89 = v160;
                    *uint64_t v90 = v161;
                    v174 = *v88;
                    unint64_t v175 = bswap64(v160[1]);
                    unint64_t v176 = bswap64((*v88)[1]);
                    if (v175 != v176) {
                      goto LABEL_327;
                    }
                    unint64_t v175 = bswap64(v160[2]);
                    unint64_t v176 = bswap64(v174[2]);
                    if (v175 == v176
                      && (unint64_t v175 = bswap64(v160[3]), v176 = bswap64(v174[3]), v175 == v176)
                      && (unint64_t v175 = bswap64(v160[4]), v176 = bswap64(v174[4]), v175 == v176))
                    {
                      int v177 = 0;
                    }
                    else
                    {
LABEL_327:
                      int v177 = v175 < v176 ? -1 : 1;
                    }
                    if (v177 < 0)
                    {
                      v11[1] = v160;
                      v11[2] = v174;
                      v178 = *v11;
                      unint64_t v179 = bswap64(v160[1]);
                      unint64_t v180 = bswap64((*v11)[1]);
                      if (v179 != v180) {
                        goto LABEL_336;
                      }
                      unint64_t v179 = bswap64(v160[2]);
                      unint64_t v180 = bswap64(v178[2]);
                      if (v179 == v180
                        && (unint64_t v179 = bswap64(v160[3]), v180 = bswap64(v178[3]), v179 == v180)
                        && (unint64_t v179 = bswap64(v160[4]), v180 = bswap64(v178[4]), v179 == v180))
                      {
                        int v181 = 0;
                      }
                      else
                      {
LABEL_336:
                        int v181 = v179 < v180 ? -1 : 1;
                      }
                      if (v181 < 0)
                      {
                        *uint64_t v11 = v160;
                        v11[1] = v178;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 191)
          {
            int64_t v96 = v11 + 1;
            BOOL v98 = v11 == a2 || v96 == a2;
            if (a4)
            {
              if (!v98)
              {
                uint64_t v99 = 0;
                uint64_t v100 = v11;
                do
                {
                  unsigned int v102 = *v100;
                  int v101 = v100[1];
                  uint64_t v100 = v96;
                  unint64_t v103 = bswap64(v101[1]);
                  unint64_t v104 = bswap64(v102[1]);
                  if (v103 != v104
                    || (unint64_t v103 = bswap64(v101[2]), v104 = bswap64(v102[2]), v103 != v104)
                    || (unint64_t v103 = bswap64(v101[3]), v104 = bswap64(v102[3]), v103 != v104)
                    || (unint64_t v103 = bswap64(v101[4]), v104 = bswap64(v102[4]), v103 != v104))
                  {
                    int v105 = v103 < v104 ? -1 : 1;
                    if (v105 < 0)
                    {
                      uint64_t v106 = v99;
                      while (1)
                      {
                        *(unint64_t **)((char *)v11 + v106 + 8) = v102;
                        if (!v106) {
                          break;
                        }
                        unsigned int v102 = *(unint64_t **)((char *)v11 + v106 - 8);
                        unint64_t v107 = bswap64(v101[1]);
                        unint64_t v108 = bswap64(v102[1]);
                        if (v107 == v108
                          && (v107 = bswap64(v101[2]), unint64_t v108 = bswap64(v102[2]), v107 == v108)
                          && (v107 = bswap64(v101[3]), unint64_t v108 = bswap64(v102[3]), v107 == v108)
                          && (v107 = bswap64(v101[4]), unint64_t v108 = bswap64(v102[4]), v107 == v108))
                        {
                          int v109 = 0;
                        }
                        else if (v107 < v108)
                        {
                          int v109 = -1;
                        }
                        else
                        {
                          int v109 = 1;
                        }
                        v106 -= 8;
                        if ((v109 & 0x80000000) == 0)
                        {
                          uint64_t v110 = (unint64_t **)((char *)v11 + v106 + 8);
                          goto LABEL_192;
                        }
                      }
                      uint64_t v110 = v11;
LABEL_192:
                      *uint64_t v110 = v101;
                    }
                  }
                  int64_t v96 = v100 + 1;
                  v99 += 8;
                }
                while (v100 + 1 != a2);
              }
            }
            else if (!v98)
            {
              do
              {
                uint64_t v166 = *v9;
                long long v165 = v9[1];
                uint64_t v9 = v96;
                unint64_t v167 = bswap64(v165[1]);
                unint64_t v168 = bswap64(v166[1]);
                if (v167 != v168
                  || (v167 = bswap64(v165[2]), unint64_t v168 = bswap64(v166[2]), v167 != v168)
                  || (v167 = bswap64(v165[3]), unint64_t v168 = bswap64(v166[3]), v167 != v168)
                  || (v167 = bswap64(v165[4]), unint64_t v168 = bswap64(v166[4]), v167 != v168))
                {
                  int v169 = v167 < v168 ? -1 : 1;
                  if (v169 < 0)
                  {
                    long long v170 = v96;
                    do
                    {
                      *long long v170 = v166;
                      uint64_t v166 = *(v170 - 2);
                      unint64_t v171 = bswap64(v165[1]);
                      unint64_t v172 = bswap64(v166[1]);
                      if (v171 == v172
                        && (unint64_t v171 = bswap64(v165[2]), v172 = bswap64(v166[2]), v171 == v172)
                        && (unint64_t v171 = bswap64(v165[3]), v172 = bswap64(v166[3]), v171 == v172)
                        && (unint64_t v171 = bswap64(v165[4]), v172 = bswap64(v166[4]), v171 == v172))
                      {
                        int v173 = 0;
                      }
                      else if (v171 < v172)
                      {
                        int v173 = -1;
                      }
                      else
                      {
                        int v173 = 1;
                      }
                      --v170;
                    }
                    while (v173 < 0);
                    *long long v170 = v165;
                  }
                }
                int64_t v96 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v11 != a2)
            {
              int64_t v111 = (v13 - 2) >> 1;
              int64_t v112 = v111;
              do
              {
                int64_t v113 = v112;
                if (v111 >= v112)
                {
                  uint64_t v114 = (2 * v112) | 1;
                  long long v115 = &v11[v114];
                  long long v116 = *v115;
                  if (2 * v113 + 2 < (uint64_t)v13)
                  {
                    std::vector<char> v117 = v115[1];
                    unint64_t v118 = bswap64(v116[1]);
                    unint64_t v119 = bswap64(v117[1]);
                    if (v118 != v119) {
                      goto LABEL_204;
                    }
                    unint64_t v118 = bswap64(v116[2]);
                    unint64_t v119 = bswap64(v117[2]);
                    if (v118 == v119
                      && (unint64_t v118 = bswap64(v116[3]), v119 = bswap64(v117[3]), v118 == v119)
                      && (unint64_t v118 = bswap64(v116[4]), v119 = bswap64(v117[4]), v118 == v119))
                    {
                      int v120 = 0;
                    }
                    else
                    {
LABEL_204:
                      int v120 = v118 < v119 ? -1 : 1;
                    }
                    if (v120 < 0)
                    {
                      long long v116 = v115[1];
                      ++v115;
                      uint64_t v114 = 2 * v113 + 2;
                    }
                  }
                  uint64_t result = &v11[v113];
                  long long v121 = *result;
                  unint64_t v122 = bswap64(v116[1]);
                  unint64_t v123 = bswap64((*result)[1]);
                  if (v122 == v123
                    && (unint64_t v122 = bswap64(v116[2]), v123 = bswap64(v121[2]), v122 == v123)
                    && (unint64_t v122 = bswap64(v116[3]), v123 = bswap64(v121[3]), v122 == v123)
                    && (unint64_t v122 = bswap64(v116[4]), v123 = bswap64(v121[4]), v122 == v123)
                    || (v122 < v123 ? (int v124 = -1) : (int v124 = 1), (v124 & 0x80000000) == 0))
                  {
                    do
                    {
                      int64_t v125 = (unint64_t *)v115;
                      void *result = v116;
                      if (v111 < v114) {
                        break;
                      }
                      uint64_t v126 = (2 * v114) | 1;
                      long long v115 = &v11[v126];
                      uint64_t v114 = 2 * v114 + 2;
                      long long v116 = *v115;
                      if (v114 < (uint64_t)v13)
                      {
                        int v127 = v115[1];
                        unint64_t v128 = bswap64(v116[1]);
                        unint64_t v129 = bswap64(v127[1]);
                        if (v128 != v129) {
                          goto LABEL_225;
                        }
                        unint64_t v128 = bswap64(v116[2]);
                        unint64_t v129 = bswap64(v127[2]);
                        if (v128 == v129
                          && (unint64_t v128 = bswap64(v116[3]), v129 = bswap64(v127[3]), v128 == v129)
                          && (unint64_t v128 = bswap64(v116[4]), v129 = bswap64(v127[4]), v128 == v129))
                        {
                          int v130 = 0;
                        }
                        else
                        {
LABEL_225:
                          int v130 = v128 < v129 ? -1 : 1;
                        }
                        if (v130 >= 0)
                        {
                          uint64_t v114 = v126;
                        }
                        else
                        {
                          long long v116 = v115[1];
                          ++v115;
                        }
                      }
                      else
                      {
                        uint64_t v114 = v126;
                      }
                      unint64_t v131 = bswap64(v116[1]);
                      unint64_t v132 = bswap64(v121[1]);
                      if (v131 != v132) {
                        goto LABEL_236;
                      }
                      unint64_t v131 = bswap64(v116[2]);
                      unint64_t v132 = bswap64(v121[2]);
                      if (v131 == v132
                        && (unint64_t v131 = bswap64(v116[3]), v132 = bswap64(v121[3]), v131 == v132)
                        && (unint64_t v131 = bswap64(v116[4]), v132 = bswap64(v121[4]), v131 == v132))
                      {
                        int v133 = 0;
                      }
                      else
                      {
LABEL_236:
                        int v133 = v131 < v132 ? -1 : 1;
                      }
                      uint64_t result = (unint64_t **)v125;
                    }
                    while ((v133 & 0x80000000) == 0);
                    *int64_t v125 = (unint64_t)v121;
                  }
                }
                int64_t v112 = v113 - 1;
              }
              while (v113);
              uint64_t v134 = (unint64_t)v12 >> 3;
              do
              {
                uint64_t v135 = 0;
                long long v136 = *v11;
                long long v137 = v11;
                do
                {
                  long long v138 = &v137[v135];
                  uint64_t v141 = v138[1];
                  long long v139 = v138 + 1;
                  int v140 = v141;
                  uint64_t v142 = (2 * v135) | 1;
                  uint64_t v143 = 2 * v135 + 2;
                  if (v143 < v134)
                  {
                    uint64_t result = (unint64_t **)v139[1];
                    unint64_t v144 = bswap64(v140[1]);
                    unint64_t v145 = bswap64((unint64_t)result[1]);
                    if (v144 != v145) {
                      goto LABEL_250;
                    }
                    unint64_t v144 = bswap64(v140[2]);
                    unint64_t v145 = bswap64((unint64_t)result[2]);
                    if (v144 == v145
                      && (unint64_t v144 = bswap64(v140[3]), v145 = bswap64((unint64_t)result[3]), v144 == v145)
                      && (unint64_t v144 = bswap64(v140[4]), v145 = bswap64((unint64_t)result[4]), v144 == v145))
                    {
                      int v146 = 0;
                    }
                    else
                    {
LABEL_250:
                      int v146 = v144 < v145 ? -1 : 1;
                    }
                    if (v146 < 0)
                    {
                      int v140 = v139[1];
                      ++v139;
                      uint64_t v142 = v143;
                    }
                  }
                  *long long v137 = v140;
                  long long v137 = v139;
                  uint64_t v135 = v142;
                }
                while (v142 <= (uint64_t)((unint64_t)(v134 - 2) >> 1));
                if (v139 == --a2)
                {
                  uint64_t *v139 = v136;
                }
                else
                {
                  uint64_t *v139 = *a2;
                  *a2 = v136;
                  uint64_t v147 = (char *)v139 - (char *)v11 + 8;
                  if (v147 >= 9)
                  {
                    unint64_t v148 = (((unint64_t)v147 >> 3) - 2) >> 1;
                    uint64_t v149 = &v11[v148];
                    v150 = *v149;
                    long long v151 = *v139;
                    unint64_t v152 = bswap64((*v149)[1]);
                    unint64_t v153 = bswap64((*v139)[1]);
                    if (v152 != v153
                      || (unint64_t v152 = bswap64(v150[2]), v153 = bswap64(v151[2]), v152 != v153)
                      || (unint64_t v152 = bswap64(v150[3]), v153 = bswap64(v151[3]), v152 != v153)
                      || (unint64_t v152 = bswap64(v150[4]), v153 = bswap64(v151[4]), v152 != v153))
                    {
                      int v154 = v152 < v153 ? -1 : 1;
                      if (v154 < 0)
                      {
                        do
                        {
                          int v155 = v149;
                          uint64_t *v139 = v150;
                          if (!v148) {
                            break;
                          }
                          unint64_t v148 = (v148 - 1) >> 1;
                          uint64_t v149 = &v11[v148];
                          v150 = *v149;
                          unint64_t v156 = bswap64((*v149)[1]);
                          unint64_t v157 = bswap64(v151[1]);
                          if (v156 != v157) {
                            goto LABEL_274;
                          }
                          unint64_t v156 = bswap64(v150[2]);
                          unint64_t v157 = bswap64(v151[2]);
                          if (v156 == v157
                            && (unint64_t v156 = bswap64(v150[3]), v157 = bswap64(v151[3]), v156 == v157)
                            && (unint64_t v156 = bswap64(v150[4]), v157 = bswap64(v151[4]), v156 == v157))
                          {
                            int v158 = 0;
                          }
                          else
                          {
LABEL_274:
                            int v158 = v156 < v157 ? -1 : 1;
                          }
                          long long v139 = v155;
                        }
                        while (v158 < 0);
                        *int v155 = v151;
                      }
                    }
                  }
                }
              }
              while (v134-- > 2);
            }
            return result;
          }
          unint64_t v14 = v13 >> 1;
          uint64_t v15 = &v11[v13 >> 1];
          if ((unint64_t)v12 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9, &v9[v13 >> 1], a2 - 1);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9 + 1, v15 - 1, a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9 + 2, &v9[v14 + 1], a2 - 3);
            uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v15 - 1, v15, &v9[v14 + 1]);
            unint64_t v16 = *v9;
            *uint64_t v9 = *v15;
            *uint64_t v15 = v16;
          }
          else
          {
            uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(&v9[v13 >> 1], v9, a2 - 1);
          }
          --a3;
          unsigned int v17 = *v9;
          if (a4) {
            break;
          }
          unsigned int v18 = *(v9 - 1);
          unint64_t v19 = bswap64(v18[1]);
          unint64_t v20 = bswap64(v17[1]);
          if (v19 != v20) {
            goto LABEL_16;
          }
          unint64_t v19 = bswap64(v18[2]);
          unint64_t v20 = bswap64(v17[2]);
          if (v19 == v20
            && (unint64_t v19 = bswap64(v18[3]), v20 = bswap64(v17[3]), v19 == v20)
            && (unint64_t v19 = bswap64(v18[4]), v20 = bswap64(v17[4]), v19 == v20))
          {
            int v21 = 0;
          }
          else
          {
LABEL_16:
            int v21 = v19 < v20 ? -1 : 1;
          }
          if (v21 < 0) {
            break;
          }
          uint64_t v52 = *v10;
          unint64_t v53 = bswap64(v17[1]);
          unint64_t v54 = bswap64((*v10)[1]);
          if (v53 == v54
            && (unint64_t v53 = bswap64(v17[2]), v54 = bswap64(v52[2]), v53 == v54)
            && (unint64_t v53 = bswap64(v17[3]), v54 = bswap64(v52[3]), v53 == v54)
            && (unint64_t v53 = bswap64(v17[4]), v54 = bswap64(v52[4]), v53 == v54))
          {
            int v55 = 0;
          }
          else if (v53 < v54)
          {
            int v55 = -1;
          }
          else
          {
            int v55 = 1;
          }
          if (v55 < 0)
          {
            uint64_t v11 = v9;
            do
            {
              int v62 = v11[1];
              ++v11;
              unsigned int v61 = v62;
              unint64_t v63 = bswap64(v17[1]);
              unint64_t v64 = bswap64(v62[1]);
              if (v63 == v64
                && (unint64_t v63 = bswap64(v17[2]), v64 = bswap64(v61[2]), v63 == v64)
                && (unint64_t v63 = bswap64(v17[3]), v64 = bswap64(v61[3]), v63 == v64)
                && (unint64_t v63 = bswap64(v17[4]), v64 = bswap64(v61[4]), v63 == v64))
              {
                int v65 = 0;
              }
              else if (v63 < v64)
              {
                int v65 = -1;
              }
              else
              {
                int v65 = 1;
              }
            }
            while ((v65 & 0x80000000) == 0);
          }
          else
          {
            uint64_t v56 = v9 + 1;
            do
            {
              uint64_t v11 = v56;
              if (v56 >= a2) {
                break;
              }
              int v57 = *v56;
              unint64_t v58 = bswap64(v17[1]);
              unint64_t v59 = bswap64((*v11)[1]);
              if (v58 != v59) {
                goto LABEL_95;
              }
              unint64_t v58 = bswap64(v17[2]);
              unint64_t v59 = bswap64(v57[2]);
              if (v58 == v59
                && (unint64_t v58 = bswap64(v17[3]), v59 = bswap64(v57[3]), v58 == v59)
                && (unint64_t v58 = bswap64(v17[4]), v59 = bswap64(v57[4]), v58 == v59))
              {
                int v60 = 0;
              }
              else
              {
LABEL_95:
                int v60 = v58 < v59 ? -1 : 1;
              }
              uint64_t v56 = v11 + 1;
            }
            while ((v60 & 0x80000000) == 0);
          }
          uint64_t v66 = a2;
          if (v11 < a2)
          {
            uint64_t v66 = a2;
            do
            {
              char v68 = *--v66;
              char v67 = v68;
              unint64_t v69 = bswap64(v17[1]);
              unint64_t v70 = bswap64(v68[1]);
              if (v69 == v70)
              {
                unint64_t v69 = bswap64(v17[2]);
                unint64_t v70 = bswap64(v67[2]);
                if (v69 == v70)
                {
                  unint64_t v69 = bswap64(v17[3]);
                  unint64_t v70 = bswap64(v67[3]);
                  if (v69 == v70)
                  {
                    unint64_t v69 = bswap64(v17[4]);
                    unint64_t v70 = bswap64(v67[4]);
                    if (v69 == v70) {
                      break;
                    }
                  }
                }
              }
              int v71 = v69 < v70 ? -1 : 1;
            }
            while (v71 < 0);
          }
          if (v11 < v66)
          {
            int v72 = *v11;
            uint64_t v73 = *v66;
            do
            {
              *uint64_t v11 = v73;
              *uint64_t v66 = v72;
              do
              {
                do
                {
                  uint64_t v74 = v11[1];
                  ++v11;
                  int v72 = v74;
                  unint64_t v75 = bswap64(v17[1]);
                  unint64_t v76 = bswap64(v74[1]);
                  if (v75 != v76) {
                    break;
                  }
                  unint64_t v75 = bswap64(v17[2]);
                  unint64_t v76 = bswap64(v72[2]);
                  if (v75 != v76) {
                    break;
                  }
                  unint64_t v75 = bswap64(v17[3]);
                  unint64_t v76 = bswap64(v72[3]);
                  if (v75 != v76) {
                    break;
                  }
                  unint64_t v75 = bswap64(v17[4]);
                  unint64_t v76 = bswap64(v72[4]);
                }
                while (v75 == v76);
                if (v75 < v76) {
                  int v77 = -1;
                }
                else {
                  int v77 = 1;
                }
              }
              while ((v77 & 0x80000000) == 0);
              do
              {
                uint64_t v78 = *--v66;
                uint64_t v73 = v78;
                unint64_t v79 = bswap64(v17[1]);
                unint64_t v80 = bswap64(v78[1]);
                if (v79 == v80)
                {
                  unint64_t v79 = bswap64(v17[2]);
                  unint64_t v80 = bswap64(v73[2]);
                  if (v79 == v80)
                  {
                    unint64_t v79 = bswap64(v17[3]);
                    unint64_t v80 = bswap64(v73[3]);
                    if (v79 == v80)
                    {
                      unint64_t v79 = bswap64(v17[4]);
                      unint64_t v80 = bswap64(v73[4]);
                      if (v79 == v80) {
                        break;
                      }
                    }
                  }
                }
                int v81 = v79 < v80 ? -1 : 1;
              }
              while (v81 < 0);
            }
            while (v11 < v66);
          }
          long long v82 = v11 - 1;
          BOOL v4 = v11 - 1 >= v9;
          BOOL v5 = v11 - 1 == v9;
          if (v11 - 1 != v9) {
            *uint64_t v9 = *v82;
          }
          a4 = 0;
          *long long v82 = v17;
        }
        uint64_t v22 = 0;
        do
        {
          unsigned int v23 = v9[v22 + 1];
          unint64_t v24 = bswap64(v23[1]);
          unint64_t v25 = bswap64(v17[1]);
          if (v24 == v25
            && (v24 = bswap64(v23[2]), unint64_t v25 = bswap64(v17[2]), v24 == v25)
            && (v24 = bswap64(v23[3]), unint64_t v25 = bswap64(v17[3]), v24 == v25)
            && (v24 = bswap64(v23[4]), unint64_t v25 = bswap64(v17[4]), v24 == v25))
          {
            int v26 = 0;
          }
          else if (v24 < v25)
          {
            int v26 = -1;
          }
          else
          {
            int v26 = 1;
          }
          ++v22;
        }
        while (v26 < 0);
        int v27 = &v9[v22];
        uint64_t v28 = a2;
        if (v22 == 1)
        {
          uint64_t v28 = a2;
          do
          {
            if (v27 >= v28) {
              break;
            }
            uint64_t v35 = *--v28;
            int v34 = v35;
            unint64_t v36 = bswap64(v35[1]);
            unint64_t v37 = bswap64(v17[1]);
            if (v36 != v37) {
              goto LABEL_47;
            }
            unint64_t v36 = bswap64(v34[2]);
            unint64_t v37 = bswap64(v17[2]);
            if (v36 == v37
              && (unint64_t v36 = bswap64(v34[3]), v37 = bswap64(v17[3]), v36 == v37)
              && (unint64_t v36 = bswap64(v34[4]), v37 = bswap64(v17[4]), v36 == v37))
            {
              int v38 = 0;
            }
            else
            {
LABEL_47:
              int v38 = v36 < v37 ? -1 : 1;
            }
          }
          while ((v38 & 0x80000000) == 0);
        }
        else
        {
          do
          {
            do
            {
              uint64_t v30 = *--v28;
              uint64_t v29 = v30;
              unint64_t v31 = bswap64(v30[1]);
              unint64_t v32 = bswap64(v17[1]);
              if (v31 != v32) {
                break;
              }
              unint64_t v31 = bswap64(v29[2]);
              unint64_t v32 = bswap64(v17[2]);
              if (v31 != v32) {
                break;
              }
              unint64_t v31 = bswap64(v29[3]);
              unint64_t v32 = bswap64(v17[3]);
              if (v31 != v32) {
                break;
              }
              unint64_t v31 = bswap64(v29[4]);
              unint64_t v32 = bswap64(v17[4]);
            }
            while (v31 == v32);
            if (v31 < v32) {
              int v33 = -1;
            }
            else {
              int v33 = 1;
            }
          }
          while ((v33 & 0x80000000) == 0);
        }
        if (v27 >= v28)
        {
          unsigned __int8 v50 = v27 - 1;
        }
        else
        {
          std::vector<char>::pointer v39 = *v28;
          uint64_t v40 = v27;
          std::vector<char>::pointer v41 = v28;
          do
          {
            *uint64_t v40 = v39;
            *std::vector<char>::pointer v41 = v23;
            do
            {
              unint64_t v42 = v40[1];
              ++v40;
              unsigned int v23 = v42;
              unint64_t v43 = bswap64(v42[1]);
              unint64_t v44 = bswap64(v17[1]);
              if (v43 == v44)
              {
                unint64_t v43 = bswap64(v23[2]);
                unint64_t v44 = bswap64(v17[2]);
                if (v43 == v44)
                {
                  unint64_t v43 = bswap64(v23[3]);
                  unint64_t v44 = bswap64(v17[3]);
                  if (v43 == v44)
                  {
                    unint64_t v43 = bswap64(v23[4]);
                    unint64_t v44 = bswap64(v17[4]);
                    if (v43 == v44) {
                      break;
                    }
                  }
                }
              }
              int v45 = v43 < v44 ? -1 : 1;
            }
            while (v45 < 0);
            do
            {
              do
              {
                unsigned int v46 = *--v41;
                std::vector<char>::pointer v39 = v46;
                unint64_t v47 = bswap64(v46[1]);
                unint64_t v48 = bswap64(v17[1]);
                if (v47 != v48) {
                  break;
                }
                unint64_t v47 = bswap64(v39[2]);
                unint64_t v48 = bswap64(v17[2]);
                if (v47 != v48) {
                  break;
                }
                unint64_t v47 = bswap64(v39[3]);
                unint64_t v48 = bswap64(v17[3]);
                if (v47 != v48) {
                  break;
                }
                unint64_t v47 = bswap64(v39[4]);
                unint64_t v48 = bswap64(v17[4]);
              }
              while (v47 == v48);
              if (v47 < v48) {
                int v49 = -1;
              }
              else {
                int v49 = 1;
              }
            }
            while ((v49 & 0x80000000) == 0);
          }
          while (v40 < v41);
          unsigned __int8 v50 = v40 - 1;
        }
        if (v50 != v9) {
          *uint64_t v9 = *v50;
        }
        uint64_t *v50 = v17;
        if (v27 >= v28) {
          break;
        }
LABEL_78:
        uint64_t result = (unint64_t **)std::__introsort<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**,false>(v9, v50, a3, a4 & 1);
        a4 = 0;
        uint64_t v11 = v50 + 1;
      }
      BOOL v51 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9, v50);
      uint64_t v11 = v50 + 1;
      uint64_t result = (unint64_t **)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v50 + 1, a2);
      if (result) {
        break;
      }
      if (!v51) {
        goto LABEL_78;
      }
    }
    a2 = v50;
    if (!v51) {
      continue;
    }
    return result;
  }
}

@end