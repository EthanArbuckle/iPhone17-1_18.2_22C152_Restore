@interface DYIABPatcher
- (BOOL)patchBuffer:(unint64_t)a3 bufferData:(void *)a4 bufferLength:(unint64_t)a5 objectMap:(const void *)a6;
- (BOOL)patchBuffers:(DYCommandBufferUID)a3 objectMap:(const void *)a4 commandQueue:(id)a5;
- (BOOL)readPatchingTable:(id)a3;
- (BOOL)writePatchingTableAsJson:(id)a3;
- (DYIABPatcher)initWithPatchingMode:(int)a3;
- (id).cxx_construct;
- (int)patchingMode;
- (void)findPatchingRequest:(DYCommandBufferUID)a3;
- (void)insertPatchingOp:(DYIABPatchingOp *)a3 commandBufferUid:(DYCommandBufferUID)a4;
@end

@implementation DYIABPatcher

- (DYIABPatcher)initWithPatchingMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYIABPatcher;
  result = [(DYIABPatcher *)&v5 init];
  if (result) {
    result->_patchingMode = a3;
  }
  return result;
}

- (BOOL)readPatchingTable:(id)a3
{
  v37[16] = *(uint64_t **)MEMORY[0x263EF8340];
  id v4 = a3;
  v28 = self;
  v29 = v4;
  if (self->_patchingMode == 2)
  {
    id v35 = 0;
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4 options:0 error:&v35];
    id v6 = v35;
    v7 = v6;
    v26 = (void *)v5;
    if (v5)
    {
      id v34 = v6;
      v27 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v34];
      id v25 = v34;

      if (v27)
      {
        std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::clear((uint64_t)&v28->_perfectPatchingTable);
        memset(v33, 0, sizeof(v33));
        id obj = v27;
        if ([obj countByEnumeratingWithState:v33 objects:v36 count:16])
        {
          v8 = (NSString *)**((void **)&v33[0] + 1);
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          uint64_t v31 = CommandBufferUIDFromString(v8);
          uint64_t v32 = v9;
          v37[0] = &v31;
          std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v28->_optimizedPatchingMap, (unint64_t *)&v31, (uint64_t)&std::piecewise_construct, v37);
          [obj objectForKeyedSubscript:v8];
          (id)objc_claimAutoreleasedReturnValue();
          operator new();
        }

        for (i = v28->_optimizedPatchingMap.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
        {
          uint64_t v11 = i[3];
          uint64_t v12 = i[4];
          uint64_t v13 = v11;
          if (v11 != v12)
          {
            do
            {
              for (j = *(void **)(*(void *)(v11 + 8) + 16); j; j = (void *)*j)
              {
                for (k = (void *)j[7]; k; k = (void *)*k)
                {
                  v16 = (unint64_t *)k[3];
                  v17 = (unint64_t *)k[4];
                  unint64_t v18 = 126 - 2 * __clz(((char *)v17 - (char *)v16) >> 4);
                  if (v17 == v16) {
                    uint64_t v19 = 0;
                  }
                  else {
                    uint64_t v19 = v18;
                  }
                  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,OffsetPair *,false>(v16, v17, (uint64_t)v37, v19, 1);
                }
              }
              v11 += 16;
            }
            while (v11 != v12);
            uint64_t v13 = i[3];
            uint64_t v11 = i[4];
          }
          unint64_t v20 = 126 - 2 * __clz((v11 - v13) >> 4);
          if (v11 == v13) {
            uint64_t v21 = 0;
          }
          else {
            uint64_t v21 = v20;
          }
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,PatchingRequest *,false>(v13, (int *)v11, (uint64_t)v37, v21, 1);
        }
        BOOL v22 = 1;
        v27 = obj;
      }
      else
      {
        v23 = [v25 localizedDescription];
        NSLog(&cfstr_ErrorWhenParsi.isa, v29, v23);

        BOOL v22 = 0;
      }
      v7 = v25;
    }
    else
    {
      v27 = [v6 localizedDescription];
      NSLog(&cfstr_ErrorWhenReadi.isa, v29, v27);
      BOOL v22 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_ReadingPatchin.isa);
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)writePatchingTableAsJson:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (i = self->_perfectPatchingTable.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = (void *)i[4];
    if (v6 != i + 5)
    {
      do
      {
        v25[0] = @"pointer";
        v7 = DictionaryFromBufferAndOffset(v6 + 4);
        v25[1] = @"pointee";
        v26[0] = v7;
        v8 = DictionaryFromBufferAndOffset(v6 + 6);
        v26[1] = v8;
        uint64_t v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

        [v5 addObject:v9];
        v10 = (void *)v6[1];
        if (v10)
        {
          do
          {
            uint64_t v11 = v10;
            v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            uint64_t v11 = (void *)v6[2];
            BOOL v12 = *v11 == (void)v6;
            id v6 = v11;
          }
          while (!v12);
        }
        id v6 = v11;
      }
      while (v11 != i + 5);
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%llu-%u", i[2], *((unsigned int *)i + 6));
    [v23 setObject:v5 forKey:v13];
  }
  id v24 = 0;
  v14 = [MEMORY[0x263F08900] dataWithJSONObject:v23 options:3 error:&v24];
  id v15 = v24;
  v16 = v15;
  if (!v14)
  {
    unint64_t v20 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToGenera.isa, v20);

LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }
  v17 = [NSURL fileURLWithPath:v22];
  char v18 = [v14 writeToURL:v17 atomically:1];

  if ((v18 & 1) == 0)
  {
    NSLog(&cfstr_FailedToWriteP.isa, v22);
    goto LABEL_15;
  }
  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (void)insertPatchingOp:(DYIABPatchingOp *)a3 commandBufferUid:(DYCommandBufferUID)a4
{
  DYCommandBufferUID v7 = a4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  v8 = &v7;
  id v5 = (uint64_t **)std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::__emplace_unique_key_args<DYCommandBufferUID,std::piecewise_construct_t const&,std::tuple<DYCommandBufferUID const&>,std::tuple<>>((uint64_t)&self->_perfectPatchingTable, (uint64_t)&v7, (uint64_t)&std::piecewise_construct, (_OWORD **)&v8);
  std::__tree<BufferEntry>::__emplace_unique_key_args<BufferEntry,BufferEntry const&>(v5 + 4, (unint64_t *)v6, v6);
}

- (void)findPatchingRequest:(DYCommandBufferUID)a3
{
  DYCommandBufferUID v8 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_optimizedPatchingMap.__table_.__bucket_list_.__ptr_.__value_, &v8.objectId);
  if (result)
  {
    id v4 = (unsigned int *)*((void *)result + 3);
    id v5 = (unsigned int *)*((void *)result + 4);
    if (v4 == v5)
    {
      return 0;
    }
    else
    {
      int v6 = 0;
      DYCommandBufferUID v7 = (unsigned int *)*((void *)result + 3);
      while (*v7 <= v8.functionIndex)
      {
        v7 += 4;
        --v6;
        if (v7 == v5) {
          return &v4[4 * (-v6 - 1)];
        }
      }
      if (!v6) {
        return 0;
      }
      return &v4[4 * (-v6 - 1)];
    }
  }
  return result;
}

- (BOOL)patchBuffers:(DYCommandBufferUID)a3 objectMap:(const void *)a4 commandQueue:(id)a5
{
  uint64_t v6 = *(void *)&a3.functionIndex;
  unint64_t objectId = a3.objectId;
  id v9 = a5;
  if (self->_patchingMode != 2)
  {
    NSLog(&cfstr_PatchingIsOnly.isa);
    goto LABEL_7;
  }
  self->_lastProcessedCommandBufferUid.unint64_t objectId = objectId;
  *(void *)&self->_lastProcessedCommandBufferUid.functionIndex = v6;
  v10 = -[DYIABPatcher findPatchingRequest:](self, "findPatchingRequest:", objectId, v6);
  uint64_t v11 = v10;
  if (!v10)
  {
    NSLog(&cfstr_UnableToFindAM.isa, objectId, v6);
    goto LABEL_7;
  }
  if (!*((unsigned char *)v10 + 4))
  {
    uint64_t v14 = v10[1];
    if (!v14)
    {
      BOOL v12 = 1;
      goto LABEL_8;
    }
    id v15 = v9;
    v16 = *(void **)(v14 + 16);
    if (!v16)
    {
LABEL_21:

      BOOL v12 = 1;
      *((unsigned char *)v11 + 4) = 1;
      goto LABEL_8;
    }
    while (1)
    {
      v17 = GetMTLBufferFromObjectMap(a4, v16[2]);
      if (v17) {
        break;
      }
      NSLog(&cfstr_PointerBufferL.isa, v16[2]);
LABEL_20:

      v16 = (void *)*v16;
      if (!v16) {
        goto LABEL_21;
      }
    }
    CPUAccessibleMTLBufferData::CPUAccessibleMTLBufferData((uint64_t)v21, v17, v15);
    if (v22)
    {
      uint64_t v18 = [v22 storageMode];
      BOOL v19 = &v22;
      if (!v18)
      {
LABEL_16:
        uint64_t v20 = [*v19 contents];
LABEL_19:
        ProcessPerBufferPatchingRequest((uint64_t)(v16 + 3), v20, [v22 length], a4);
        CPUAccessibleMTLBufferData::~CPUAccessibleMTLBufferData((CPUAccessibleMTLBufferData *)v21);
        goto LABEL_20;
      }
      if (v18 == 2)
      {
        BOOL v19 = (id *)&v23;
        goto LABEL_16;
      }
    }
    uint64_t v20 = 0;
    goto LABEL_19;
  }
  NSLog(&cfstr_PatchingReques.isa);
LABEL_7:
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)patchBuffer:(unint64_t)a3 bufferData:(void *)a4 bufferLength:(unint64_t)a5 objectMap:(const void *)a6
{
  unint64_t v12 = a3;
  if (self->_patchingMode != 2)
  {
    NSLog(&cfstr_PatchingIsOnly.isa, a2, a3, a4, a5, a6);
    goto LABEL_7;
  }
  unint64_t objectId = self->_lastProcessedCommandBufferUid.objectId;
  if (!objectId)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v10 = -[DYIABPatcher findPatchingRequest:](self, "findPatchingRequest:", objectId, *(void *)&self->_lastProcessedCommandBufferUid.functionIndex);
  if (v10)
  {
    v10 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((void *)v10[1], &v12);
    if (v10)
    {
      ProcessPerBufferPatchingRequest((uint64_t)(v10 + 3), (uint64_t)a4, a5, a6);
      LOBYTE(v10) = 1;
    }
  }
  return (char)v10;
}

- (int)patchingMode
{
  return self->_patchingMode;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>>>::~__hash_table((uint64_t)&self->_optimizedPatchingMap);
  std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::~__hash_table((uint64_t)&self->_perfectPatchingTable);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end