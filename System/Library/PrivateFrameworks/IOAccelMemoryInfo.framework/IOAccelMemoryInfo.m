uint64_t classIsIOAF2(NSString *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;

  v1 = a1;
  if ([(__CFString *)v1 isEqualToString:@"OSObject"])
  {
    v2 = 0;
  }
  else
  {
    v3 = v1;
    while (1)
    {
      v2 = [(__CFString *)v3 isEqualToString:@"IOGraphicsAccelerator2"];
      if (v2) {
        break;
      }
      v1 = (__CFString *)IOObjectCopySuperclassForClass(v3);

      v3 = v1;
      if ([(__CFString *)v1 isEqualToString:@"OSObject"]) {
        goto LABEL_8;
      }
    }
    v1 = v3;
  }
LABEL_8:

  return v2;
}

uint64_t classIsIOGPUFamily(NSString *a1)
{
  v1 = a1;
  if ([(__CFString *)v1 isEqualToString:@"OSObject"])
  {
    uint64_t v2 = 0;
  }
  else
  {
    v3 = v1;
    while (1)
    {
      uint64_t v2 = [(__CFString *)v3 isEqualToString:@"IOGPU"];
      if (v2) {
        break;
      }
      v1 = (__CFString *)IOObjectCopySuperclassForClass(v3);

      v3 = v1;
      if ([(__CFString *)v1 isEqualToString:@"OSObject"]) {
        goto LABEL_8;
      }
    }
    v1 = v3;
  }
LABEL_8:

  return v2;
}

uint64_t pid2name(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)v7 = 0xE00000001;
  int v8 = 1;
  int v9 = a1;
  size_t v4 = 648;
  if (sysctl(v7, 4u, v5, &v4, 0, 0) || v4 != 648) {
    return objc_msgSend(NSString, "stringWithFormat:", @"Unknown Process.%d", a1, v3);
  }
  else {
    return objc_msgSend(NSString, "stringWithFormat:", @"%s.%d", v6, a1);
  }
}

void sub_21D84A624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,void *a42)
{
}

void validateArray(NSDictionary *a1, NSString *a2, objc_class *a3, int a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = [(NSDictionary *)a1 objectForKey:a2];
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      validateArray();
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            validateArray();
          }
          if ([v7 containsObject:v13])
          {
            if (a4)
            {
              [v8 addObject:v13];
            }
            else if ([v7 containsObject:v13])
            {
              validateArray();
            }
          }
          [v7 addObject:v13];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v6, "indexOfObject:", *(void *)(*((void *)&v18 + 1) + 8 * v17++)));
        }
        while (v15 != v17);
        uint64_t v15 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

uint64_t **std::__tree<int>::__emplace_unique_key_args<int,int const&>(uint64_t **a1, int *a2, _DWORD *a3)
{
  v6 = a1 + 1;
  id v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        id v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        id v5 = *v8;
        v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      id v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v10 + 7) = *a3;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<int>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *id v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t validateAllocationList(NSArray *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = [(NSArray *)a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(a1);
        }
        +[IOAccelMemoryInfo validateDictionary:*(void *)(*((void *)&v6 + 1) + 8 * v5++)];
      }
      while (v3 != v5);
      uint64_t result = [(NSArray *)a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t addIdentifiersInEntryToSet(NSMutableSet *a1, NSDictionary *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(NSDictionary *)a2 objectForKey:@"AllocationIdentifiers"];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMutableSet *)a1 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

NSMutableDictionary *createMergedEntry(NSDictionary *a1, NSDictionary *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Memorypool.isa, a1, a2, v5);
  uint64_t v6 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Size.isa, a1, a2, v6);
  uint64_t v7 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Dirtysize.isa, a1, a2, v7);
  long long v8 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Residentsize.isa, a1, a2, v8);
  long long v9 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Pageoffrequire.isa, a1, a2, v9);
  long long v10 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Purgeable.isa, a1, a2, v10);
  long long v11 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Wired.isa, a1, a2, v11);
  uint64_t v12 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Cachedcopy.isa, a1, a2, v12);
  uint64_t v13 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Iosurfaceid.isa, a1, a2, v13);
  uint64_t v14 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Ioaccelsurface.isa, a1, a2, v14);
  uint64_t v15 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Ioaccelsurface_0.isa, a1, a2, v15);
  uint64_t v16 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Ioaccelsurface_1.isa, a1, a2, v16);
  uint64_t v17 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Ioaccelsurface_2.isa, a1, a2, v17);
  long long v18 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, &cfstr_Ioaccelsurface_3.isa, a1, a2, v18);
  insertMergedArray(v4, &cfstr_Allocationiden.isa, a1, a2);
  insertMergedArray(v4, &cfstr_Resources.isa, a1, a2);
  insertMergedArray(v4, &cfstr_Devices.isa, a1, a2);
  insertMergedArray(v4, &cfstr_Descriptions.isa, a1, a2);
  id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = [(NSDictionary *)a1 objectForKey:@"Processes"];
  obuint64_t j = [(NSDictionary *)a2 objectForKey:@"Processes"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKey:@"PID"];
        if (!v25) {
          createMergedEntry();
        }
        [v19 addObject:v25];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v22);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = [*(id *)(*((void *)&v48 + 1) + 8 * j) objectForKey:@"PID"];
        if (!v30) {
          createMergedEntry();
        }
        [v19 addObject:v30];
      }
      uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v27);
  }
  v42 = v4;
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v32 = [v19 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v19);
        }
        v36 = *(NSNumber **)(*((void *)&v44 + 1) + 8 * k);
        DictForPID = (NSDictionary *)getDictForPID(v20, v36);
        v38 = (NSDictionary *)getDictForPID(obj, v36);
        v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        [(NSMutableDictionary *)v39 setValue:v36 forKey:@"PID"];
        insertMergedArray(v39, &cfstr_Openglobjects.isa, DictForPID, v38);
        insertMergedArray(v39, &cfstr_Openclobjects.isa, DictForPID, v38);
        insertMergedArray(v39, &cfstr_Mappings.isa, DictForPID, v38);
        [v31 addObject:v39];
      }
      uint64_t v33 = [v19 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v33);
  }
  v40 = v42;
  [(NSMutableDictionary *)v42 setObject:v31, @"Processes", v42 forKey];

  return v40;
}

uint64_t insertEitherValue(NSMutableDictionary *a1, NSString *a2, NSDictionary *a3, NSDictionary *a4, objc_class *a5)
{
  uint64_t v8 = [(NSDictionary *)a3 valueForKey:a2];
  uint64_t result = [(NSDictionary *)a4 valueForKey:a2];
  if (!v8 || result)
  {
    if (v8 || !result)
    {
      if (!(v8 | result)) {
        return result;
      }
      uint64_t result = [(id)v8 isEqual:result];
      if (!v8) {
        return result;
      }
    }
    else
    {
      uint64_t v8 = result;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    insertEitherValue();
  }

  return [(NSMutableDictionary *)a1 setValue:v8 forKey:a2];
}

void insertMergedArray(NSMutableDictionary *a1, NSString *a2, NSDictionary *a3, NSDictionary *a4)
{
  uint64_t v7 = [(NSDictionary *)a3 objectForKey:a2];
  uint64_t v8 = [(NSDictionary *)a4 objectForKey:a2];
  if (v7 | v8)
  {
    uint64_t v9 = v8;
    if (!v7 || v8)
    {
      if (v7 || !v8)
      {
        long long v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v7];
        [v10 addObjectsFromArray:v9];
        uint64_t v7 = [v10 allObjects];

        if (!v7) {
          return;
        }
      }
      else
      {
        uint64_t v7 = v8;
      }
    }
    [(NSMutableDictionary *)a1 setValue:v7 forKey:a2];
  }
}

id getDictForPID(NSArray *a1, NSNumber *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke;
  v5[3] = &unk_264461638;
  v5[4] = a2;
  NSUInteger v3 = [(NSArray *)a1 indexOfObjectPassingTest:v5];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return [(NSArray *)a1 objectAtIndex:v3];
  }
}

uint64_t ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:@"PID"];
  if (!v3) {
    ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke_cold_1();
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 isEqualToNumber:v4];
}

void std::__tree<int>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<int>::destroy(a1, *a2);
    std::__tree<int>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void validateArray()
{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 268, "[found_values containsObject: obj] == FALSE");
}

{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 261, "[obj isKindOfClass: expected_type]");
}

{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 254, "[array isKindOfClass: [NSArray class]]");
}

void createMergedEntry()
{
}

{
  __assert_rtn("createMergedEntry", "IOAccelMemoryInfo.mm", 414, "pid_num");
}

void insertEitherValue()
{
}

void ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke_cold_1()
{
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

CFStringRef IOObjectCopySuperclassForClass(CFStringRef classname)
{
  return (CFStringRef)MEMORY[0x270EF47F8](classname);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x270EDA290](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}