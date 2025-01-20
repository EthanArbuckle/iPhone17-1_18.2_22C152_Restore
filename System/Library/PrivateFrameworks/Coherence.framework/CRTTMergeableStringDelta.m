@interface CRTTMergeableStringDelta
- (BOOL)saveToEncoder:(id)a3 error:(id *)a4;
- (CRTTMergeableStringDelta)initWithDecoder:(id)a3 error:(id *)a4;
- (CRTTMergeableStringDelta)initWithDeltasTo:(id)a3 from:(id)a4 compareElements:(id)a5;
- (CRTTMergeableStringStorage)attributedString;
- (ObjCVersion)addedByVersion;
- (ObjCVersion)fromAddedByVersion;
- (ObjCVersion)fromVersion;
- (ObjCVersion)version;
- (id).cxx_construct;
- (id)dotDescription:(unint64_t)a3;
- (int64_t)renameGeneration;
- (void)addChildTo:(const void *)a3 child:(const void *)a4 deltaCharMap:(void *)a5;
- (void)addStorageTo:(void *)a3 fromStorage:(id)a4 range:(_NSRange)a5;
- (void)addSubstring:(const TopoIDRange *)a3 requiresExactLength:(BOOL)a4 deltaCharMap:(void *)a5;
- (void)compareSameSubstring:(const void *)a3 toSubstring:(const void *)a4 from:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9;
- (void)compareSubstring:(const void *)a3 toSubstring:(const void *)a4 fromString:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9;
- (void)dealloc;
- (void)findAndCompareSubstring:(const void *)a3 from:(id)a4 toString:(id)a5 charMap:(const void *)a6 deltaCharMap:(void *)a7 compareElements:(id)a8;
- (void)openTapToRadar;
- (void)openURL:(id)a3;
- (void)orderedSubstrings;
- (void)setAddedByVersion:(id)a3;
- (void)setFromAddedByVersion:(id)a3;
- (void)setFromVersion:(id)a3;
- (void)setRenameGeneration:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation CRTTMergeableStringDelta

- (CRTTMergeableStringDelta)initWithDeltasTo:(id)a3 from:(id)a4 compareElements:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v71 = a5;
  v84.receiver = self;
  v84.super_class = (Class)CRTTMergeableStringDelta;
  v10 = [(CRTTMergeableStringDelta *)&v84 init];
  v11 = [v9 version];
  v12 = [v8 version];
  if ([v11 hasDeltaTo:v12])
  {

    BOOL v13 = v71 != 0;
    int v70 = 1;
LABEL_6:
    long long v81 = 0u;
    long long v82 = 0u;
    int v83 = 1065353216;
    v79 = 0;
    uint64_t v80 = 0;
    v78 = &v79;
    v18 = [v8 attributedString];
    BOOL v68 = v13;
    uint64_t v19 = objc_msgSend(v18, "cr_emptyCopy");
    attributedString = v10->_attributedString;
    location = (id *)&v10->_attributedString;
    v10->_attributedString = (CRTTMergeableStringStorage *)v19;

    uint64_t v21 = [v9 orderedSubstrings];
    v23 = *(long long ***)v21;
    v22 = *(long long ***)(v21 + 8);
    while (v23 != v22)
    {
      v24 = *v23;
      v25 = v79;
      v26 = (void **)&v79;
      v27 = &v79;
      if (!v79) {
        goto LABEL_25;
      }
      v26 = (void **)&v79;
      while (1)
      {
        while (1)
        {
          v27 = (uint64_t **)v25;
          unsigned int v28 = *((_DWORD *)v24 + 4);
          int v29 = *((_DWORD *)v24 + 5);
          *(_OWORD *)v85 = *v24;
          int v30 = *((_DWORD *)v24 + 6);
          *(_OWORD *)v87.replica.uuid = *((_OWORD *)v27 + 2);
          unsigned int v31 = *((_DWORD *)v27 + 12);
          int v32 = *((_DWORD *)v27 + 13);
          BOOL v33 = v30 != 0;
          int v34 = v30 - 1;
          if (!v33) {
            int v34 = 0;
          }
          unsigned int v35 = v34 + v29;
          int v36 = *((_DWORD *)v27 + 14);
          *(void *)&v85[16] = __PAIR64__(v35, v28);
          int v37 = v36 - 1;
          if (!v36) {
            int v37 = 0;
          }
          v87.replica.index = v31;
          v87.clock = v37 + v32;
          if (!TopoID::lessThanOrderingReplicaFirst((TopoID *)v85, &v87)) {
            break;
          }
          v25 = *v27;
          v26 = (void **)v27;
          if (!*v27) {
            goto LABEL_25;
          }
        }
        *(_OWORD *)v85 = *((_OWORD *)v27 + 2);
        *(_DWORD *)&v85[16] = *((_DWORD *)v27 + 12);
        int v38 = *((_DWORD *)v27 + 13);
        int v39 = *((_DWORD *)v27 + 14);
        unsigned int v40 = *((_DWORD *)v24 + 4);
        int v41 = *((_DWORD *)v24 + 5);
        *(_OWORD *)v87.replica.uuid = *v24;
        BOOL v33 = v39 != 0;
        int v42 = v39 - 1;
        if (!v33) {
          int v42 = 0;
        }
        int v43 = v42 + v38;
        int v44 = *((_DWORD *)v24 + 6);
        *(_DWORD *)&v85[20] = v43;
        int v45 = v44 - 1;
        if (!v44) {
          int v45 = 0;
        }
        v87.replica.index = v40;
        v87.clock = v45 + v41;
        if (!TopoID::lessThanOrderingReplicaFirst((TopoID *)v85, &v87)) {
          break;
        }
        v26 = (void **)(v27 + 1);
        v25 = v27[1];
        if (!v25) {
          goto LABEL_25;
        }
      }
      v46 = *v26;
      if (!*v26)
      {
LABEL_25:
        v46 = operator new(0x48uLL);
        long long v47 = *v24;
        *(_OWORD *)((char *)v46 + 44) = *(long long *)((char *)v24 + 12);
        v46[2] = v47;
        *((void *)v46 + 8) = 0;
        *(void *)v46 = 0;
        *((void *)v46 + 1) = 0;
        *((void *)v46 + 2) = v27;
        *v26 = v46;
        v48 = (uint64_t *)v46;
        if (*v78)
        {
          v78 = (uint64_t **)*v78;
          v48 = (uint64_t *)*v26;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v79, v48);
        ++v80;
      }
      *((void *)v46 + 8) = v24;
      ++v23;
    }
    for (uint64_t i = *(void *)([v8 orderedSubstrings] + 8);
          i != *(void *)[v8 orderedSubstrings];
          i -= 8)
    {
      uint64_t v50 = *(void *)(i - 8);
      [(CRTTMergeableStringDelta *)v10 findAndCompareSubstring:v50 from:v9 toString:v8 charMap:&v78 deltaCharMap:&v81 compareElements:v71];
    }
    *(void *)v87.replica.uuid = 0;
    *(void *)&v87.replica.uuid[8] = &v87;
    *(void *)&v87.replica.index = 0x2020000000;
    char v88 = 1;
    memset(v85, 0, sizeof(v85));
    int v86 = 1065353216;
    v51 = [v8 attributedString];
    v52 = objc_msgSend(v51, "cr_emptyCopy");

    std::vector<TopoSubstring *>::reserve((void **)&v10->orderedSubstrings.__begin_, *((unint64_t *)&v82 + 1));
    for (j = (void *)v82; j; j = (void *)*j)
    {
      uint64_t v54 = j[5];
      if (!*(_DWORD *)(v54 + 80))
      {
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke;
        v72[3] = &unk_1E64C1A58;
        v73 = v10;
        id v74 = v9;
        id v75 = v8;
        v77 = &v87;
        id v76 = v52;
        traverseIterative(v54, v85, v72);
      }
    }
    objc_storeStrong(location, v52);
    if (*(unsigned char *)(*(void *)&v87.replica.uuid[8] + 24))
    {
      int v55 = v70;
      if (v10->orderedSubstrings.__end_ != v10->orderedSubstrings.__begin_) {
        int v55 = 1;
      }
      if (v55 == 1)
      {
        if (!v68 || [*location length])
        {
LABEL_42:
          uint64_t v56 = [v9 version];
          fromVersion = v10->_fromVersion;
          v10->_fromVersion = (ObjCVersion *)v56;

          uint64_t v58 = [v9 addedByVersion];
          fromAddedByVersion = v10->_fromAddedByVersion;
          v10->_fromAddedByVersion = (ObjCVersion *)v58;

          uint64_t v60 = [v8 version];
          version = v10->_version;
          v10->_version = (ObjCVersion *)v60;

          uint64_t v62 = [v8 addedByVersion];
          addedByVersion = v10->_addedByVersion;
          v10->_addedByVersion = (ObjCVersion *)v62;

          v10->_renameGeneration = +[CRGlobalContextObjC renameGeneration];
          v64 = v10;
LABEL_49:

          std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v85);
          _Block_object_dispose(&v87, 8);
          std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v79);
          std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v81);
          v16 = v71;
          goto LABEL_50;
        }
        begin = v10->orderedSubstrings.__begin_;
        end = v10->orderedSubstrings.__end_;
        if (begin != end)
        {
          while (*((void *)*begin + 5) == *((void *)*begin + 4))
          {
            v64 = 0;
            if (++begin == end) {
              goto LABEL_49;
            }
          }
          goto LABEL_42;
        }
      }
    }
    v64 = 0;
    goto LABEL_49;
  }
  v14 = [v9 addedByVersion];
  v15 = [v8 addedByVersion];
  int v70 = [v14 hasDeltaTo:v15];

  v16 = v71;
  BOOL v13 = v71 != 0;
  char v17 = v70;
  if (v71) {
    char v17 = 1;
  }
  if (v17) {
    goto LABEL_6;
  }
  v64 = 0;
LABEL_50:

  return v64;
}

void __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v4[2];
  unint64_t v6 = v4[3];
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = v4[1];
    uint64_t v9 = ((uint64_t)v5 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - v8;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      BOOL v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v4 + 3), v12);
    }
    else {
      BOOL v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(void *)v14 = a2;
    v7 = v14 + 8;
    char v17 = (char *)v4[1];
    v16 = (char *)v4[2];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = (char *)v4[1];
    }
    v4[1] = v14;
    v4[2] = v7;
    v4[3] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    void *v5 = a2;
    v7 = v5 + 1;
  }
  v4[2] = v7;
  uint64_t v19 = *(unsigned int *)(a2 + 24);
  if (v19)
  {
    uint64_t v20 = *(unsigned int *)(a2 + 84);
    if (v20 != -1)
    {
      uint64_t v21 = [*(id *)(a1 + 32) attributedString];
      unint64_t v22 = [v21 length];

      if (v20 + v19 <= v22)
      {
        int v25 = [*(id *)(a1 + 56) length];
        v26 = *(void **)(a1 + 56);
        v27 = [*(id *)(a1 + 32) attributedString];
        objc_msgSend(v26, "cr_appendStorage:fromRange:", v27, *(unsigned int *)(a2 + 84), *(unsigned int *)(a2 + 24));

        *(_DWORD *)(a2 + 84) = v25;
      }
      else
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        id v29 = *(id *)(a1 + 40);
        id v30 = *(id *)(a1 + 48);
        os_state_add_handler();
        v23 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
          __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_cold_1();
        }
        os_state_remove_handler();
        if (os_variant_has_internal_diagnostics()) {
          objc_msgSend(*(id *)(a1 + 32), "openTapToRadar", v28, 3221225472, __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_2, &unk_1E64C1A30, v29, v30);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
  }
}

char *__66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_2(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1C87816C0]();
  v3 = (void *)MEMORY[0x1E4F28F98];
  v10[0] = @"from";
  v4 = [*(id *)(a1 + 32) dotDescription:0];
  v10[1] = @"to";
  v11[0] = v4;
  v5 = [*(id *)(a1 + 40) dotDescription:1];
  v11[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v7 = [v3 dataWithPropertyList:v6 format:200 options:0 error:0];

  uint64_t v8 = (char *)malloc_type_malloc([v7 length] + 200, 0x8CA7AFCCuLL);
  *(_DWORD *)uint64_t v8 = 1;
  *((_DWORD *)v8 + 1) = [v7 length];
  objc_msgSend(v7, "getBytes:range:", v8 + 200, 0, objc_msgSend(v7, "length"));
  strlcpy(v8 + 136, (const char *)[@"CRTTMergeableStringDelta.init" UTF8String], 0x40uLL);

  return v8;
}

- (void)dealloc
{
  begin = self->orderedSubstrings.__begin_;
  end = self->orderedSubstrings.__end_;
  while (begin != end)
  {
    v5 = *begin;
    if (*begin)
    {
      unint64_t v6 = (void *)*((void *)v5 + 7);
      if (v6)
      {
        *((void *)v5 + 8) = v6;
        operator delete(v6);
      }
      v7 = (void *)*((void *)v5 + 4);
      if (v7)
      {
        *((void *)v5 + 5) = v7;
        operator delete(v7);
      }
      MEMORY[0x1C8781440](v5, 0x10A0C409FE6E197);
    }
    ++begin;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRTTMergeableStringDelta;
  [(CRTTMergeableStringDelta *)&v8 dealloc];
}

- (void)openTapToRadar
{
  if ((-[CRTTMergeableStringDelta openTapToRadar]::hasAlreadyFiled & 1) == 0)
  {
    -[CRTTMergeableStringDelta openTapToRadar]::hasAlreadyFiled = 1;
    id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v12 setScheme:@"tap-to-radar"];
    [v12 setHost:@"new"];
    v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"Coherence"];
    [v3 addObject:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"all"];
    [v3 addObject:v5];

    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"941619"];
    [v3 addObject:v6];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"AutoDiagnostics" value:@"1"];
    [v3 addObject:v7];

    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:@"CRTTMergeableStringDelta Fatal Failure"];
    [v3 addObject:v8];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Crash/Hang/Data Loss"];
    [v3 addObject:v9];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Not Applicable"];
    [v3 addObject:v10];

    [v12 setQueryItems:v3];
    uint64_t v11 = [v12 URL];
    [(CRTTMergeableStringDelta *)self openURL:v11];
  }
}

- (void)openURL:(id)a3
{
  id v13 = a3;
  v3 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F1CA18];
    unint64_t v6 = [v3 methodSignatureForSelector:sel_openURL_options_completionHandler_];
    v7 = [v5 invocationWithMethodSignature:v6];

    [v7 setSelector:sel_openURL_options_completionHandler_];
    [v7 setArgument:&v13 atIndex:2];
    [v7 invokeWithTarget:v4];
  }
  objc_super v8 = [NSClassFromString(&cfstr_Nsworkspace.isa) sharedWorkspace];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA18];
    uint64_t v11 = [v8 methodSignatureForSelector:sel_openURL_];
    id v12 = [v10 invocationWithMethodSignature:v11];

    [v12 setSelector:sel_openURL_];
    [v12 setArgument:&v13 atIndex:2];
    [v12 invokeWithTarget:v9];
  }
}

- (void)orderedSubstrings
{
  return &self->orderedSubstrings;
}

- (CRTTMergeableStringDelta)initWithDecoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRTTMergeableStringDelta;
  v7 = [(CRTTMergeableStringDelta *)&v24 init];
  uint64_t v8 = [v6 storageWithError:a4];
  attributedString = v7->_attributedString;
  v7->_attributedString = (CRTTMergeableStringStorage *)v8;

  if (!v7->_attributedString) {
    goto LABEL_12;
  }
  v7->_renameGeneration = +[CRGlobalContextObjC renameGeneration];
  uint64_t v10 = [v6 versionWithError:a4];
  version = v7->_version;
  v7->_version = (ObjCVersion *)v10;

  uint64_t v12 = [v6 addedByVersionWithError:a4];
  addedByVersion = v7->_addedByVersion;
  v7->_addedByVersion = (ObjCVersion *)v12;

  uint64_t v14 = [v6 fromVersionWithError:a4];
  fromVersion = v7->_fromVersion;
  v7->_fromVersion = (ObjCVersion *)v14;

  uint64_t v16 = [v6 fromAddedByVersionWithError:a4];
  fromAddedByVersion = v7->_fromAddedByVersion;
  v7->_fromAddedByVersion = (ObjCVersion *)v16;

  if (!v7->_version) {
    goto LABEL_12;
  }
  if (v7->_addedByVersion && v7->_fromVersion && v7->_fromAddedByVersion)
  {
    unsigned int v23 = [v6 substringCount];
    std::vector<TopoSubstring *>::reserve((void **)&v7->orderedSubstrings.__begin_, v23);
    if (v23) {
      operator new();
    }
    uint64_t v18 = [(CRTTMergeableStringDelta *)v7 attributedString];
    BOOL v19 = decodeSubstrings(v23, [v18 length], v6, (uint64_t *)&v7->orderedSubstrings, 0, 0, (uint64_t)a4);

    if (v19) {
      uint64_t v20 = v7;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = v20;
  }
  else
  {
LABEL_12:
    uint64_t v21 = 0;
  }

  return v21;
}

- (BOOL)saveToEncoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  memset(v32, 0, sizeof(v32));
  int v33 = 1065353216;
  v7 = [(CRTTMergeableStringDelta *)self orderedSubstrings];
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  if (*v7 != v9)
  {
    int v10 = 0;
    do
    {
      uint64_t v31 = 0;
      uint64_t v31 = *v8;
      int v34 = &v31;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v32, &v31, (uint64_t)&std::piecewise_construct, &v34)+ 6) = v10++;
      ++v8;
    }
    while (v8 != v9);
  }
  uint64_t v11 = [(CRTTMergeableStringDelta *)self orderedSubstrings];
  uint64_t v12 = (void *)*v11;
  id v13 = (void *)v11[1];
  if ((void *)*v11 != v13)
  {
    while (1)
    {
      uint64_t v14 = *v12;
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*v12];
      [v6 setCharWithId:v15 clock:*(unsigned int *)(v14 + 20)];
      [v6 setWithLength:*(unsigned int *)(v14 + 24)];
      if (*(_DWORD *)(v14 + 84) == -1) {
        break;
      }
      if (*(void *)(v14 + 40) == *(void *)(v14 + 32))
      {
        uint64_t v16 = 1;
LABEL_9:
        [v6 setWithContentOptions:v16];
      }
      uint64_t v18 = *(void *)(v14 + 32);
      uint64_t v17 = *(void *)(v14 + 40);
      while (v18 != v17)
      {
        if (*(_DWORD *)(v18 + 16) == -1)
        {
          BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v18];
          [v6 addRemovedAddedById:v19 clock:*(unsigned int *)(v18 + 20)];
        }
        else
        {
          BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v18];
          [v6 addAddedById:v19 clock:*(unsigned int *)(v18 + 20)];
        }

        v18 += 24;
      }
      uint64_t v20 = *(uint64_t ***)(v14 + 56);
      uint64_t v21 = *(uint64_t ***)(v14 + 64);
      while (v20 != v21)
      {
        int v34 = 0;
        int v34 = *v20;
        unint64_t v22 = std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(v32, &v34);
        if (!v22) {
          __assert_rtn("-[CRTTMergeableStringDelta saveToEncoder:error:]", "CRTTMergeableStringDelta.mm", 293, "it != substringIndexes.end()");
        }
        [v6 addChildWithId:*((unsigned int *)v22 + 6)];
        ++v20;
      }
      [v6 finishSubstring];

      if (++v12 == v13) {
        goto LABEL_21;
      }
    }
    uint64_t v16 = 2;
    goto LABEL_9;
  }
LABEL_21:
  unsigned int v23 = [(CRTTMergeableStringDelta *)self attributedString];
  [v6 setStorage:v23 error:v30];

  if (v30 && *v30)
  {
    BOOL v24 = 0;
  }
  else
  {
    int v25 = [(CRTTMergeableStringDelta *)self version];
    [v6 setWithVersion:v25];

    v26 = [(CRTTMergeableStringDelta *)self addedByVersion];
    [v6 setWithAddedByVersion:v26];

    v27 = [(CRTTMergeableStringDelta *)self fromVersion];
    [v6 setFromVersion:v27];

    uint64_t v28 = [(CRTTMergeableStringDelta *)self fromAddedByVersion];
    [v6 setFromAddedByVersion:v28];

    BOOL v24 = 1;
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v32);

  return v24;
}

- (void)addSubstring:(const TopoIDRange *)a3 requiresExactLength:(BOOL)a4 deltaCharMap:(void *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::find<TopoID>(a5, (uint64_t)a3);
  if (!v8) {
    operator new();
  }
  uint64_t v9 = v8;
  uint64_t v10 = v8[5];
  if (v6 && TopoIDRange::operator!=((unsigned __int8 *)v8[5], a3->charID.replica.uuid))
  {
    if (*(void *)(v10 + 40) != *(void *)(v10 + 32) || *(void *)(v10 + 64) != *(void *)(v10 + 56)) {
      -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:]();
    }
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(a5, v9);
    long long v11 = *(_OWORD *)&a3->charID.replica.uuid[12];
    *(_OWORD *)uint64_t v10 = *(_OWORD *)a3->charID.replica.uuid;
    *(_OWORD *)(v10 + 12) = v11;
    id v13 = (_OWORD *)v10;
    *((void *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)a5, v10, (uint64_t)&std::piecewise_construct, &v13)+ 5) = v10;
  }
  return (void *)v10;
}

- (void)addChildTo:(const void *)a3 child:(const void *)a4 deltaCharMap:(void *)a5
{
  uint64_t v8 = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1);
  uint64_t v9 = [(CRTTMergeableStringDelta *)self addSubstring:a4 requiresExactLength:0 deltaCharMap:a5];
  TopoSubstring::addChild(v8, v9);
}

- (void)findAndCompareSubstring:(const void *)a3 from:(id)a4 toString:(id)a5 charMap:(const void *)a6 deltaCharMap:(void *)a7 compareElements:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v35 = a8;
  int v36 = v15;
  long long v46 = *(_OWORD *)a3;
  unsigned int v47 = *((_DWORD *)a3 + 4);
  uint64_t v16 = *((void *)a6 + 1);
  if (!v16) {
    goto LABEL_12;
  }
  unsigned int v17 = *((_DWORD *)a3 + 5);
  uint64_t v18 = (unsigned __int8 **)((char *)a6 + 8);
  do
  {
    *(_OWORD *)int v37 = *(_OWORD *)(v16 + 32);
    int v19 = *(_DWORD *)(v16 + 48);
    int v20 = *(_DWORD *)(v16 + 52);
    int v21 = *(_DWORD *)(v16 + 56);
    *(_OWORD *)v48.replica.uuid = v46;
    BOOL v22 = v21 != 0;
    int v23 = v21 - 1;
    if (!v22) {
      int v23 = 0;
    }
    *(_DWORD *)&v37[16] = v19;
    *(_DWORD *)&v37[20] = v23 + v20;
    v48.replica.index = v47;
    v48.clock = v17;
    BOOL v24 = TopoID::lessThanOrderingReplicaFirst((TopoID *)v37, &v48);
    int v25 = (uint64_t *)(v16 + 8);
    if (!v24)
    {
      int v25 = (uint64_t *)v16;
      uint64_t v18 = (unsigned __int8 **)v16;
    }
    uint64_t v16 = *v25;
  }
  while (*v25);
  if (v18 == (unsigned __int8 **)((char *)a6 + 8)
    || TopoIDRange::operator!=(v18[8], (unsigned __int8 *)a3)
    && !TopoIDRange::intersects((TopoIDRange *)v18[8], (const TopoIDRange *)a3))
  {
LABEL_12:
    id v34 = v14;
    v26 = [(CRTTMergeableStringDelta *)self addSubstring:a3 requiresExactLength:1 deltaCharMap:a7];
    v27 = v26;
    if (v26 != a3) {
      std::vector<TopoID>::__assign_with_size[abi:ne180100]<TopoID*,TopoID*>(v26 + 32, *((char **)a3 + 4), *((void *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 5) - *((void *)a3 + 4)) >> 3));
    }
    std::vector<TopoSubstring *>::reserve((void **)v27 + 7, (uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 3);
    uint64_t v28 = (long long **)*((void *)a3 + 7);
    for (uint64_t i = (long long **)*((void *)a3 + 8); v28 != i; ++v28)
    {
      id v30 = *v28;
      long long v31 = **v28;
      *(_OWORD *)&v37[12] = *(long long *)((char *)*v28 + 12);
      *(_OWORD *)int v37 = v31;
      int v39 = 0;
      uint64_t v40 = 0;
      int v38 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v38, *((const void **)v30 + 4), *((void *)v30 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v30 + 5) - *((void *)v30 + 4)) >> 3));
      __p = 0;
      int v42 = 0;
      int v44 = 0;
      uint64_t v43 = 0;
      int v45 = *((_DWORD *)v30 + 21);
      [(CRTTMergeableStringDelta *)self addChildTo:a3 child:v37 deltaCharMap:a7];
      if (__p)
      {
        int v42 = __p;
        operator delete(__p);
      }
      if (v38)
      {
        int v39 = v38;
        operator delete(v38);
      }
    }
    id v14 = v34;
    id v15 = v36;
    if (*((void *)a3 + 5) != *((void *)a3 + 4))
    {
      int v32 = [v36 attributedString];
      if (*((void *)a3 + 5) == *((void *)a3 + 4)) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = *((unsigned int *)a3 + 6);
      }
      -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", v27, v32, *((unsigned int *)a3 + 21), v33);
    }
  }
  else
  {
    [(CRTTMergeableStringDelta *)self compareSubstring:a3 toSubstring:v18[8] fromString:v14 toString:v15 charMap:a6 deltaCharMap:a7 compareElements:v35];
  }
}

- (void)addStorageTo:(void *)a3 fromStorage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  *((_DWORD *)a3 + 21) = CRTTBoundedCheckedCastNSUIntegerToUInt32([(CRTTMergeableStringStorage *)self->_attributedString length]);
  -[CRTTMergeableStringStorage cr_appendStorage:fromRange:](self->_attributedString, "cr_appendStorage:fromRange:", v9, location, length);
}

- (void)compareSameSubstring:(const void *)a3 toSubstring:(const void *)a4 from:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v79 = a5;
  id v82 = a6;
  id v78 = a9;
  if (*((_DWORD *)a4 + 6))
  {
    id v14 = (void *)*((void *)a4 + 4);
    id v13 = (void *)*((void *)a4 + 5);
    obuint64_t j = v14;
    for (uint64_t i = 0; v14 != v13; v14 += 3)
    {
      long long v16 = *(_OWORD *)v14;
      *(void *)&src[16] = v14[2];
      *(_OWORD *)src = v16;
      if (std::__find_impl[abi:ne180100]<TopoID const*,TopoID const*,TopoID,std::__identity>(*((unsigned __int8 **)a3 + 4), *((unsigned __int8 **)a3 + 5), src) == *((unsigned __int8 **)a3 + 5))
      {
        unsigned int v17 = [v82 addedByVersion];
        uint64_t v18 = TopoID::objc((TopoID *)src);
        int v19 = [v17 contains:v18];

        if (v19)
        {
          if (!i) {
            uint64_t i = [(CRTTMergeableStringDelta *)self addSubstring:a3 requiresExactLength:1 deltaCharMap:a8];
          }
          int v99 = -1;
          uuid_copy(dst, src);
          int v20 = *(_DWORD *)&src[20];
          long long v100 = *(_OWORD *)dst;
          int v101 = v99;
          unint64_t v21 = i[6];
          unint64_t v22 = i[5];
          if (v22 >= v21)
          {
            uint64_t v25 = i[4];
            unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - v25) >> 3);
            unint64_t v27 = v26 + 1;
            if (v26 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - v25) >> 3);
            if (2 * v28 > v27) {
              unint64_t v27 = 2 * v28;
            }
            if (v28 >= 0x555555555555555) {
              unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v29 = v27;
            }
            if (v29) {
              id v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoID>>((uint64_t)(i + 6), v29);
            }
            else {
              id v30 = 0;
            }
            long long v31 = &v30[24 * v26];
            *((_DWORD *)v31 + 4) = v101;
            *(_OWORD *)long long v31 = v100;
            *((_DWORD *)v31 + 5) = v20;
            uint64_t v33 = (char *)i[4];
            int v32 = (char *)i[5];
            id v34 = v31;
            if (v32 != v33)
            {
              do
              {
                long long v35 = *(_OWORD *)(v32 - 24);
                *((void *)v34 - 1) = *((void *)v32 - 1);
                *(_OWORD *)(v34 - 24) = v35;
                v34 -= 24;
                v32 -= 24;
              }
              while (v32 != v33);
              int v32 = (char *)i[4];
            }
            BOOL v24 = v31 + 24;
            i[4] = v34;
            i[5] = v31 + 24;
            i[6] = &v30[24 * v29];
            if (v32) {
              operator delete(v32);
            }
          }
          else
          {
            int v23 = v99;
            *(_OWORD *)unint64_t v22 = *(_OWORD *)dst;
            *(_DWORD *)(v22 + 16) = v23;
            *(_DWORD *)(v22 + 20) = v20;
            BOOL v24 = (char *)(v22 + 24);
          }
          i[5] = v24;
        }
      }
    }
    int v37 = (long long *)*((void *)a3 + 4);
    int v36 = (long long *)*((void *)a3 + 5);
    if (v37 != v36)
    {
      do
      {
        long long v38 = *v37;
        *(void *)&src[16] = *((void *)v37 + 2);
        *(_OWORD *)src = v38;
        if (std::__find_impl[abi:ne180100]<TopoID const*,TopoID const*,TopoID,std::__identity>(*((unsigned __int8 **)a4 + 4), *((unsigned __int8 **)a4 + 5), src) == *((unsigned __int8 **)a4 + 5))
        {
          int v39 = [v79 addedByVersion];
          uint64_t v40 = TopoID::objc((TopoID *)src);
          char v41 = [v39 contains:v40];

          if ((v41 & 1) == 0)
          {
            if (!i) {
              uint64_t i = [(CRTTMergeableStringDelta *)self addSubstring:a3 requiresExactLength:1 deltaCharMap:a8];
            }
            unint64_t v42 = i[6];
            unint64_t v43 = i[5];
            if (v43 >= v42)
            {
              uint64_t v46 = i[4];
              unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - v46) >> 3);
              unint64_t v48 = v47 + 1;
              if (v47 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v42 - v46) >> 3);
              if (2 * v49 > v48) {
                unint64_t v48 = 2 * v49;
              }
              if (v49 >= 0x555555555555555) {
                unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v50 = v48;
              }
              if (v50) {
                v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoID>>((uint64_t)(i + 6), v50);
              }
              else {
                v51 = 0;
              }
              v52 = &v51[24 * v47];
              long long v53 = *(_OWORD *)src;
              *((void *)v52 + 2) = *(void *)&src[16];
              *(_OWORD *)v52 = v53;
              int v55 = (char *)i[4];
              uint64_t v54 = (char *)i[5];
              uint64_t v56 = v52;
              if (v54 != v55)
              {
                do
                {
                  long long v57 = *(_OWORD *)(v54 - 24);
                  *((void *)v56 - 1) = *((void *)v54 - 1);
                  *(_OWORD *)(v56 - 24) = v57;
                  v56 -= 24;
                  v54 -= 24;
                }
                while (v54 != v55);
                uint64_t v54 = (char *)i[4];
              }
              int v45 = v52 + 24;
              i[4] = v56;
              i[5] = v52 + 24;
              i[6] = &v51[24 * v50];
              if (v54) {
                operator delete(v54);
              }
            }
            else
            {
              long long v44 = *(_OWORD *)src;
              *(void *)(v43 + 16) = *(void *)&src[16];
              *(_OWORD *)unint64_t v43 = v44;
              int v45 = (char *)(v43 + 24);
            }
            i[5] = v45;
          }
        }
        int v37 = (long long *)((char *)v37 + 24);
      }
      while (v37 != v36);
      if (*((void *)a3 + 5) != *((void *)a3 + 4))
      {
        if (v13 == obj)
        {
          if (!i) {
            uint64_t i = [(CRTTMergeableStringDelta *)self addSubstring:a3 requiresExactLength:1 deltaCharMap:a8];
          }
          [v82 attributedString];
          -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", i, objc_claimAutoreleasedReturnValue());
        }
        else
        {
          if (!v78) {
            goto LABEL_69;
          }
          v77 = (*((void (**)(id, void, void, void, void))v78 + 2))(v78, *((unsigned int *)a3 + 21), *((unsigned int *)a3 + 6), *((unsigned int *)a4 + 21), *((unsigned int *)a4 + 6));
          if ([v77 count] && i)
          {
            id v58 = [v82 attributedString];
            if (*((void *)a3 + 5) == *((void *)a3 + 4)) {
              uint64_t v59 = 0;
            }
            else {
              uint64_t v59 = *((unsigned int *)a3 + 6);
            }
            -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", i, v58, *((unsigned int *)a3 + 21), v59);
          }
          else
          {
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            id v58 = v77;
            id obja = v58;
            uint64_t v60 = [v58 countByEnumeratingWithState:&v84 objects:v97 count:16];
            if (v60)
            {
              uint64_t v61 = *(void *)v85;
              do
              {
                for (uint64_t j = 0; j != v60; ++j)
                {
                  if (*(void *)v85 != v61) {
                    objc_enumerationMutation(obja);
                  }
                  uint64_t v63 = [*(id *)(*((void *)&v84 + 1) + 8 * j) rangeValue];
                  uint64_t v65 = v64;
                  int v66 = *((_DWORD *)a3 + 4);
                  int v67 = v63 - *((_DWORD *)a3 + 21) + *((_DWORD *)a3 + 5);
                  *(_OWORD *)src = *(_OWORD *)a3;
                  *(_DWORD *)&src[16] = v66;
                  *(_DWORD *)&src[20] = v67;
                  *(_DWORD *)&src[24] = v64;
                  BOOL v68 = [(CRTTMergeableStringDelta *)self addSubstring:src requiresExactLength:1 deltaCharMap:a8];
                  v69 = [v82 attributedString];
                  -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", v68, v69, v63, v65);
                }
                id v58 = obja;
                uint64_t v60 = [obja countByEnumeratingWithState:&v84 objects:v97 count:16];
              }
              while (v60);
            }
          }
        }
      }
    }
  }
LABEL_69:
  int v70 = (long long **)*((void *)a3 + 7);
  for (k = (long long **)*((void *)a3 + 8); v70 != k; ++v70)
  {
    v72 = *v70;
    v73 = (uint64_t *)*((void *)a4 + 7);
    id v74 = (uint64_t *)*((void *)a4 + 8);
    while (v73 != v74)
    {
      uint64_t v75 = *v73;
      if (*((_DWORD *)v72 + 5) == *(_DWORD *)(*v73 + 20)
        && *((_DWORD *)v72 + 4) == *(_DWORD *)(v75 + 16)
        && !uuid_compare((const unsigned __int8 *)v72, (const unsigned __int8 *)v75))
      {
        goto LABEL_80;
      }
      ++v73;
    }
    long long v76 = *v72;
    *(_OWORD *)&src[12] = *(long long *)((char *)v72 + 12);
    *(_OWORD *)src = v76;
    v90 = 0;
    uint64_t v91 = 0;
    uint64_t v89 = 0;
    std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v89, *((const void **)v72 + 4), *((void *)v72 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v72 + 5) - *((void *)v72 + 4)) >> 3));
    __p = 0;
    v93 = 0;
    int v95 = 0;
    uint64_t v94 = 0;
    int v96 = *((_DWORD *)v72 + 21);
    [(CRTTMergeableStringDelta *)self addChildTo:a3 child:src deltaCharMap:a8];
    if (__p)
    {
      v93 = __p;
      operator delete(__p);
    }
    if (v89)
    {
      v90 = v89;
      operator delete(v89);
    }
LABEL_80:
    ;
  }
}

- (void)compareSubstring:(const void *)a3 toSubstring:(const void *)a4 fromString:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  if (TopoIDRange::operator==((unsigned __int8 *)a4, (unsigned __int8 *)a3))
  {
    [(CRTTMergeableStringDelta *)self compareSameSubstring:a3 toSubstring:a4 from:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
  }
  else
  {
    unsigned int v18 = *((_DWORD *)a4 + 5);
    unsigned int v19 = *((_DWORD *)a3 + 5);
    if (v18 == v19)
    {
      if (*((_DWORD *)a4 + 6) <= *((_DWORD *)a3 + 6))
      {
        *(_OWORD *)unint64_t v27 = *(_OWORD *)a3;
        *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a3 + 12);
        unint64_t v29 = 0;
        uint64_t v30 = 0;
        unint64_t v28 = 0;
        std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a3 + 4), *((void *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 5) - *((void *)a3 + 4)) >> 3));
        long long v31 = 0;
        int v32 = 0;
        uint64_t v33 = 0;
        std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a3 + 7), *((void *)a3 + 8), (uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 3);
        uint64_t v34 = *((void *)a3 + 10);
        int v21 = 0;
        uuid_clear(uu);
        int v22 = 0;
        *(_OWORD *)int v23 = 0u;
        *(_OWORD *)__p = 0u;
        long long v25 = 0u;
        int v26 = 0;
        TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a4 + 6), (TopoSubstring *)uu);
        [(CRTTMergeableStringDelta *)self compareSubstring:v27 toSubstring:a4 fromString:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
        [(CRTTMergeableStringDelta *)self findAndCompareSubstring:uu from:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
      }
      else
      {
        *(_OWORD *)unint64_t v27 = *(_OWORD *)a4;
        *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a4 + 12);
        unint64_t v29 = 0;
        uint64_t v30 = 0;
        unint64_t v28 = 0;
        std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a4 + 4), *((void *)a4 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 5) - *((void *)a4 + 4)) >> 3));
        long long v31 = 0;
        int v32 = 0;
        uint64_t v33 = 0;
        std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a4 + 7), *((void *)a4 + 8), (uint64_t)(*((void *)a4 + 8) - *((void *)a4 + 7)) >> 3);
        uint64_t v34 = *((void *)a4 + 10);
        int v21 = 0;
        uuid_clear(uu);
        int v22 = 0;
        *(_OWORD *)int v23 = 0u;
        *(_OWORD *)__p = 0u;
        long long v25 = 0u;
        int v26 = 0;
        TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a3 + 6), (TopoSubstring *)uu);
        [(CRTTMergeableStringDelta *)self compareSubstring:a3 toSubstring:v27 fromString:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
      }
    }
    else if (v18 >= v19)
    {
      *(_OWORD *)unint64_t v27 = *(_OWORD *)a3;
      *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a3 + 12);
      unint64_t v29 = 0;
      uint64_t v30 = 0;
      unint64_t v28 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a3 + 4), *((void *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 5) - *((void *)a3 + 4)) >> 3));
      long long v31 = 0;
      int v32 = 0;
      uint64_t v33 = 0;
      std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a3 + 7), *((void *)a3 + 8), (uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 3);
      uint64_t v34 = *((void *)a3 + 10);
      int v21 = 0;
      uuid_clear(uu);
      int v22 = 0;
      *(_OWORD *)int v23 = 0u;
      *(_OWORD *)__p = 0u;
      long long v25 = 0u;
      int v26 = 0;
      TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a4 + 5) - *((_DWORD *)a3 + 5), (TopoSubstring *)uu);
      [(CRTTMergeableStringDelta *)self findAndCompareSubstring:v27 from:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
      [(CRTTMergeableStringDelta *)self compareSubstring:uu toSubstring:a4 fromString:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
    }
    else
    {
      *(_OWORD *)unint64_t v27 = *(_OWORD *)a4;
      *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a4 + 12);
      unint64_t v29 = 0;
      uint64_t v30 = 0;
      unint64_t v28 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a4 + 4), *((void *)a4 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 5) - *((void *)a4 + 4)) >> 3));
      long long v31 = 0;
      int v32 = 0;
      uint64_t v33 = 0;
      std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a4 + 7), *((void *)a4 + 8), (uint64_t)(*((void *)a4 + 8) - *((void *)a4 + 7)) >> 3);
      uint64_t v34 = *((void *)a4 + 10);
      int v21 = 0;
      uuid_clear(uu);
      int v22 = 0;
      *(_OWORD *)int v23 = 0u;
      *(_OWORD *)__p = 0u;
      long long v25 = 0u;
      int v26 = 0;
      TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a3 + 5) - *((_DWORD *)a4 + 5), (TopoSubstring *)uu);
      [(CRTTMergeableStringDelta *)self compareSubstring:a3 toSubstring:uu fromString:v15 toString:v16 charMap:a7 deltaCharMap:a8 compareElements:v17];
    }
    if (__p[1])
    {
      *(void **)&long long v25 = __p[1];
      operator delete(__p[1]);
    }
    if (v23[0])
    {
      v23[1] = v23[0];
      operator delete(v23[0]);
    }
    if (v31)
    {
      int v32 = v31;
      operator delete(v31);
    }
    if (v28)
    {
      unint64_t v29 = v28;
      operator delete(v28);
    }
  }
}

- (id)dotDescription:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  BOOL v6 = [(CRTTMergeableStringDelta *)self fromVersion];
  v7 = [(CRTTMergeableStringDelta *)self version];
  objc_msgSend(v5, "appendFormat:", @"subgraph cluster_%ld%p_%ld from:%@ to:%@ {\n  rankdir=\"LR\";\n",
    a3,
    self,
    a3,
    v6,
    v7);

  uint64_t v8 = [(CRTTMergeableStringDelta *)self attributedString];
  id v9 = [v8 description];

  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

  [v5 appendFormat:@"  label=\"'%@'\"\n", v10];
  [v5 appendFormat:@"  color=lightgrey;\n"];
  long long v31 = (void *)v10;
  begin = self->orderedSubstrings.__begin_;
  int v32 = self;
  end = self->orderedSubstrings.__end_;
  if (begin != end)
  {
    while (1)
    {
      uint64_t v12 = *begin;
      BOOL isStartNode = TopoSubstring::isStartNode(*begin);
      id v14 = @"  N%ld%p [label=\"Start\"];\n";
      if (!isStartNode)
      {
        BOOL isEndNode = TopoSubstring::isEndNode(v12);
        id v14 = @"  N%ld%p [label=\"End\"];\n";
        if (!isEndNode) {
          break;
        }
      }
      objc_msgSend(v5, "appendFormat:", v14, a3, v12);
LABEL_16:
      unint64_t v28 = (void *)*((void *)v12 + 7);
      unint64_t v29 = (void *)*((void *)v12 + 8);
      while (v28 != v29)
        objc_msgSend(v5, "appendFormat:", @"  N%ld%p -> N%ld%p;\n", a3, v12, a3, *v28++);
      if (++begin == end) {
        goto LABEL_20;
      }
    }
    if (*((_DWORD *)v12 + 21) == -1)
    {
      uint64_t v33 = &stru_1F1FA37D8;
      goto LABEL_12;
    }
    if (objc_opt_respondsToSelector())
    {
      id v16 = NSString;
      id v17 = [(CRTTMergeableStringStorage *)v32->_attributedString string];
      unsigned int v18 = objc_msgSend(v17, "substringWithRange:", *((unsigned int *)v12 + 21), *((unsigned int *)v12 + 6));
      uint64_t v33 = [v16 stringWithFormat:@"%@", v18];
    }
    else
    {
      objc_opt_class();
      uint64_t v33 = @"?";
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      unsigned int v19 = NSString;
      id v17 = -[CRTTMergeableStringStorage substringWithRange:](v32->_attributedString, "substringWithRange:", *((unsigned int *)v12 + 21), *((unsigned int *)v12 + 6));
      uint64_t v33 = [v19 stringWithFormat:@"%@", v17];
    }

LABEL_12:
    id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    int v21 = (long long *)*((void *)v12 + 4);
    int v22 = (long long *)*((void *)v12 + 5);
    while (v21 != v22)
    {
      long long v23 = *v21;
      uint64_t v36 = *((void *)v21 + 2);
      long long v35 = v23;
      BOOL v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v35];
      long long v25 = [v24 CRTTShortDescription];
      [v20 appendFormat:@"%@.%d,%d ", v25, v36, HIDWORD(v36)];

      int v21 = (long long *)((char *)v21 + 24);
    }
    int v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v12];
    unint64_t v27 = [v26 CRTTShortDescription];
    objc_msgSend(v5, "appendFormat:", @"  N%ld%p [label=\"%@ %@.%d,%d-%u (%@)\"];\n",
      a3,
      v12,
      v33,
      v27,
      *((unsigned int *)v12 + 4),
      *((unsigned int *)v12 + 5),
      (*((_DWORD *)v12 + 5) + *((_DWORD *)v12 + 6) - 1),
      v20);

    goto LABEL_16;
  }
LABEL_20:
  [v5 appendString:@"}\n"];

  return v5;
}

- (CRTTMergeableStringStorage)attributedString
{
  return self->_attributedString;
}

- (ObjCVersion)fromVersion
{
  return self->_fromVersion;
}

- (void)setFromVersion:(id)a3
{
}

- (ObjCVersion)fromAddedByVersion
{
  return self->_fromAddedByVersion;
}

- (void)setFromAddedByVersion:(id)a3
{
}

- (ObjCVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (ObjCVersion)addedByVersion
{
  return self->_addedByVersion;
}

- (void)setAddedByVersion:(id)a3
{
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedByVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fromAddedByVersion, 0);
  objc_storeStrong((id *)&self->_fromVersion, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  begin = self->orderedSubstrings.__begin_;
  if (begin)
  {
    self->orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

void __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C3F4F000, MEMORY[0x1E4F14500], (os_log_type_t)0x90u, "Failed to generate mergeable string delta.", v0, 2u);
}

- (void)addSubstring:requiresExactLength:deltaCharMap:.cold.1()
{
  __assert_rtn("-[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:]", "CRTTMergeableStringDelta.mm", 330, "newSubstring->addedBy.size() == 0 && newSubstring->children.size() == 0");
}

@end