@interface _CSVisualizer
+ (BOOL)getUnit:(unsigned int *)a3 inTable:(unsigned int *)a4 fromURL:(id)a5;
+ (BOOL)unitDescription:(id)a3 referencesUnit:(unsigned int)a4 inTable:(unsigned int)a5;
+ (_CSVisualizer)new;
+ (_NSRange)rangeOfValueForTitle:(id)a3 inDescription:(id)a4;
+ (id)URLForUnit:(unsigned int)a3 inTable:(unsigned int)a4;
+ (id)predicateForSearchingDescriptionWithString:(id)a3 error:(id *)a4;
+ (void)breakDownTable:(const Table *)a3 inStore:(const void *)a4 buffer:(char *)a5;
+ (void)enumerateReferencesToUnitsInUnitDescription:(id)a3 block:(id)a4;
+ (void)enumerateValuesForTitlesInDescription:(id)a3 block:(id)a4;
- (NSMutableDictionary)userInfo;
- (_CSVisualizer)init;
- (_CSVisualizer)initWithStore:(__CSStore *)a3;
- (_CSVisualizer)initWithStore:(__CSStore *)a3 useStandardTableFunctions:(BOOL)a4;
- (__CSStore)store;
- (id)breakDownUsage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (id)functionsForTable:(unsigned int)a3;
- (id)functionsForTableNoCopy:(unsigned int)a3;
- (id)handlerForTable:(unsigned int)a3;
- (id)summaryOfUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (void)dealloc;
- (void)enumerateReferencesToUnit:(unsigned int)a3 inTable:(unsigned int)a4 block:(id)a5;
- (void)setFunctions:(id)a3 forTable:(unsigned int)a4;
- (void)setHandler:(id)a3 forTable:(unsigned int)a4;
- (void)setStandardTableFunctions;
@end

@implementation _CSVisualizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_functions, 0);
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (__CSStore)store
{
  return self->_store;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStore:useStandardTableFunctions:", -[_CSVisualizer store](self, "store"), 0);
  [(NSRecursiveLock *)self->_lock lock];
  [v4[1] addEntriesFromDictionary:self->_functions];
  [v4[4] addEntriesFromDictionary:self->_userInfo];
  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (void)enumerateReferencesToUnit:(unsigned int)a3 inTable:(unsigned int)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  v10 = [(_CSVisualizer *)self store];
  v11 = v10;
  if (performConstantAssertions)
  {
    uint64_t v12 = *((void *)v10 + 43);
    if (v12) {
      (*(void (**)(void))(**(void **)(v12 + 8) + 8))(*(void *)(v12 + 8));
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke;
  v14[3] = &unk_1E5D2AA90;
  unsigned int v18 = a4;
  unsigned int v19 = a3;
  v16 = (char *)v11 + 8;
  uint64_t v17 = v9;
  v14[4] = self;
  id v13 = v8;
  id v15 = v13;
  CSStore2::Store::enumerateTables((atomic_ullong *)v11 + 1, v14);
}

- (id)breakDownUsage
{
  v2 = [(_CSVisualizer *)self store];
  v3 = v2;
  if (performConstantAssertions)
  {
    uint64_t v4 = *((void *)v2 + 43);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t v6 = *((void *)v3 + 1);
  v5 = (atomic_ullong *)((char *)v3 + 8);
  uint64_t v7 = *(void *)(v6 + 8);
  size_t v8 = *(unsigned int *)(v7 + 12);
  uint64_t v9 = (char *)malloc_type_malloc(v8 + 4, 0x17BBE915uLL);
  v10 = v9 + 4;
  bzero(v9 + 4, v8);
  *((_DWORD *)v9 + 25) = 33686018;
  *(void *)&long long v11 = 0x202020202020202;
  *((void *)&v11 + 1) = 0x202020202020202;
  *(_OWORD *)(v9 + 84) = v11;
  *(_OWORD *)(v9 + 68) = v11;
  *(_OWORD *)(v9 + 52) = v11;
  *(_OWORD *)(v9 + 36) = v11;
  *(_OWORD *)(v9 + 20) = v11;
  *(_OWORD *)(v9 + 4) = v11;
  uint64_t v12 = objc_opt_class();
  [v12 breakDownTable:v7 + 20 inStore:v5 buffer:v9 + 4];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __31___CSVisualizer_breakDownUsage__block_invoke;
  v24[3] = &__block_descriptor_56_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16lu32l8;
  v24[4] = v12;
  v24[5] = v5;
  v24[6] = v9 + 4;
  CSStore2::Store::enumerateTables(v5, v24);
  size_t v13 = v8 >> 2;
  if (v8)
  {
    for (unint64_t i = 0; i != v8; ++i)
      v10[i >> 2] = v10[i];
  }
  id v15 = (void *)MEMORY[0x1AD0DB160]();
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v10 length:v8 >> 2 freeWhenDone:0];
  uint64_t v17 = [v16 compressedDataUsingAlgorithm:0 error:0];
  unsigned int v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 length];
    if (v19 < v13) {
      [v18 getBytes:v10 length:v19];
    }
  }
  else
  {
    unint64_t v19 = -1;
  }

  if (v19 >= v13)
  {
    unint64_t v20 = v13 + 4;
  }
  else
  {
    unint64_t v20 = v19 + 4;
    v21 = (char *)malloc_type_realloc(v9, v19 + 4, 0x5F69C808uLL);
    if (v21) {
      uint64_t v9 = v21;
    }
  }
  *(_DWORD *)uint64_t v9 = 1;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v9 length:v20 freeWhenDone:1];

  return v22;
}

- (id)descriptionOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = 0;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4)
    {
      uint64_t v6 = *(void *)&a3;
      size_t v8 = (void *)MEMORY[0x1AD0DB160](self, a2);
      uint64_t v9 = [(_CSVisualizer *)self functionsForTableNoCopy:v5];
      v10 = [v9 getDescription];

      if (!v10
        || (((void (**)(void, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        uint64_t v4 = _CSStoreCopyDebugDescriptionOfUnit((uint64_t)[(_CSVisualizer *)self store], v5, v6, 1);
      }
    }
  }

  return v4;
}

- (id)summaryOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = 0;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4)
    {
      uint64_t v6 = *(void *)&a3;
      size_t v8 = (void *)MEMORY[0x1AD0DB160](self, a2);
      uint64_t v9 = [(_CSVisualizer *)self functionsForTableNoCopy:v5];
      v10 = [v9 getSummary];

      if (!v10
        || (((void (**)(void, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        if ([(_CSVisualizer *)self store]) {
          int v11 = -37516;
        }
        else {
          int v11 = 0;
        }
        if (v11 == v5) {
          uint64_t v4 = (void *)_CSStoreCopyTableName((uint64_t)[(_CSVisualizer *)self store], v6);
        }
        else {
          uint64_t v4 = 0;
        }
      }
    }
  }

  return v4;
}

- (void)setStandardTableFunctions
{
  v3 = [(_CSVisualizer *)self store];
  uint64_t v4 = (atomic_ullong *)v3;
  if (performConstantAssertions)
  {
    uint64_t v5 = *((void *)v3 + 43);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  uint64_t v6 = v4 + 1;
  Table = (_DWORD *)v4[34];
  if (Table || (Table = (_DWORD *)CSStore2::Store::getTable(v4 + 1, &cfstr_Array.isa)) != 0)
  {
    size_t v8 = objc_alloc_init(_CSVisualizerTableFunctions);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke;
    v16[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v16[4] = v4 + 1;
    [(_CSVisualizerTableFunctions *)v8 setGetDescription:v16];
    [(_CSVisualizer *)self setFunctions:v8 forTable:(4 * *Table)];
  }
  uint64_t v9 = (_DWORD *)v4[35];
  if (v9 || (uint64_t v9 = (_DWORD *)CSStore2::Store::getTable(v4 + 1, &cfstr_String_0.isa)) != 0)
  {
    v10 = objc_alloc_init(_CSVisualizerTableFunctions);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_2;
    v15[3] = &__block_descriptor_40_e39___NSString_24__0___CSVisualizer_8I16I20l;
    v15[4] = v4 + 1;
    [(_CSVisualizerTableFunctions *)v10 setGetSummary:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_3;
    v14[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v14[4] = v4 + 1;
    [(_CSVisualizerTableFunctions *)v10 setGetDescription:v14];
    [(_CSVisualizer *)self setFunctions:v10 forTable:(4 * *v9)];
  }
  int v11 = (_DWORD *)v4[36];
  if (v11 || (int v11 = (_DWORD *)CSStore2::Store::getTable(v6, &cfstr_Dictionary.isa)) != 0)
  {
    uint64_t v12 = objc_alloc_init(_CSVisualizerTableFunctions);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_4;
    v13[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v13[4] = v6;
    [(_CSVisualizerTableFunctions *)v12 setGetDescription:v13];
    [(_CSVisualizer *)self setFunctions:v12 forTable:(4 * *v11)];
  }
}

- (void)setFunctions:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v6 = (void *)[v9 copy];
  functions = self->_functions;
  size_t v8 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)functions setObject:v6 forKeyedSubscript:v8];

  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)functionsForTable:(unsigned int)a3
{
  v3 = [(_CSVisualizer *)self functionsForTableNoCopy:*(void *)&a3];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)functionsForTableNoCopy:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NSRecursiveLock *)self->_lock lock];
  functions = self->_functions;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v7 = [(NSMutableDictionary *)functions objectForKeyedSubscript:v6];

  [(NSRecursiveLock *)self->_lock unlock];

  return v7;
}

- (void)dealloc
{
  CFRelease(self->_store);
  v3.receiver = self;
  v3.super_class = (Class)_CSVisualizer;
  [(_CSVisualizer *)&v3 dealloc];
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3 useStandardTableFunctions:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CSVisualizer;
  uint64_t v6 = [(_CSVisualizer *)&v14 init];
  if (v6)
  {
    v6->_store = (__CSStore *)CFRetain(a3);
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    functions = v6->_functions;
    v6->_functions = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v6->_userInfo;
    v6->_userInfo = v9;

    int v11 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v6->_lock;
    v6->_lock = v11;

    if (v4) {
      [(_CSVisualizer *)v6 setStandardTableFunctions];
    }
  }
  return v6;
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3
{
  return [(_CSVisualizer *)self initWithStore:a3 useStandardTableFunctions:1];
}

- (_CSVisualizer)init
{
}

+ (BOOL)getUnit:(unsigned int *)a3 inTable:(unsigned int *)a4 fromURL:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  size_t v8 = (void *)MEMORY[0x1AD0DB160]();
  id v9 = [v7 absoluteString];
  int v10 = [v9 getCString:v27 maxLength:1024 encoding:4];

  if (v10 && (v23 = 0, uint64_t v19 = 0, sscanf(v27, "x-csstore-vis-unit:?t=%llu&u=%llu", &v23, &v19) == 2))
  {
    if (a4) {
      *a4 = v23;
    }
    if (a3) {
      *a3 = v19;
    }
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v7 resolvingAgainstBaseURL:1];
    size_t v13 = [v12 scheme];
    if (v13
      && ([v12 scheme],
          objc_super v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v15 = [v14 caseInsensitiveCompare:@"x-csstore-vis-unit"] == 0,
          v14,
          v13,
          v15))
    {
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      uint64_t v19 = 0;
      unint64_t v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v16 = [v12 queryItems];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke;
      v18[3] = &unk_1E5D2AB30;
      v18[4] = &v23;
      v18[5] = &v19;
      v18[6] = a4;
      v18[7] = a3;
      [v16 enumerateObjectsUsingBlock:v18];

      if (*((unsigned char *)v24 + 24)) {
        BOOL v11 = *((unsigned char *)v20 + 24) != 0;
      }
      else {
        BOOL v11 = 0;
      }
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (id)URLForUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  BOOL v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"x-csstore-vis-unit:?t=%llu&u=%llu", a4, a3);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];

  return v5;
}

+ (BOOL)unitDescription:(id)a3 referencesUnit:(unsigned int)a4 inTable:(unsigned int)a5
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke;
  v7[3] = &unk_1E5D2AB08;
  unsigned int v8 = a5;
  unsigned int v9 = a4;
  v7[4] = &v10;
  [a1 enumerateReferencesToUnitsInUnitDescription:a3 block:v7];
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (void)enumerateReferencesToUnitsInUnitDescription:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke;
  v10[3] = &unk_1E5D2AAE0;
  id v7 = v6;
  id v11 = v7;
  unsigned int v8 = (void *)MEMORY[0x1AD0DB340](v10);
  unsigned int v9 = (void *)MEMORY[0x1AD0DB160]();
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v5, "length"), 0x100000, v8);
}

+ (void)breakDownTable:(const Table *)a3 inStore:(const void *)a4 buffer:(char *)a5
{
  id v5 = a5;
  if (a3)
  {
    uint64_t v8 = *(void *)a4;
    if (*(void *)a4) {
      unint64_t v9 = *(void *)(v8 + 8);
    }
    else {
      unint64_t v9 = 0;
    }
    int v10 = -1;
    BOOL v11 = (unint64_t)a3 >= v9;
    unint64_t v12 = (unint64_t)a3 - v9;
    if (v11 && !HIDWORD(v12))
    {
      if ((v12 + 1) > *(_DWORD *)(*(void *)(v8 + 8) + 12) || v12 == -1) {
        int v10 = -1;
      }
      else {
        int v10 = v12;
      }
    }
  }
  else
  {
    int v10 = -1;
  }
  objc_super v14 = &a5[v10];
  *(void *)&long long v15 = 0x404040404040404;
  *((void *)&v15 + 1) = 0x404040404040404;
  *((_OWORD *)v14 + 3) = v15;
  *((_OWORD *)v14 + 4) = v15;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v15;
  *(_OWORD *)objc_super v14 = v15;
  v16 = a3 + 1;
  uint64_t v17 = *(void *)a4;
  if (*(void *)a4) {
    unint64_t v18 = *(void *)(v17 + 8);
  }
  else {
    unint64_t v18 = 0;
  }
  int v19 = -1;
  BOOL v11 = (unint64_t)v16 >= v18;
  unint64_t v20 = (unint64_t)v16 - v18;
  if (v11 && !HIDWORD(v20))
  {
    if ((v20 + 1) > *(_DWORD *)(*(void *)(v17 + 8) + 12) || v20 == -1) {
      int v19 = -1;
    }
    else {
      int v19 = v20;
    }
  }
  memset(&a5[v19], 68, a3->var0.var2 - 72);
  uint64_t var5 = a3->var5;
  if (var5 != -1)
  {
    unint64_t v24 = *(void *)(*(void *)a4 + 8);
    unsigned int v25 = *(_DWORD *)(v24 + 12);
    if (v25 > var5)
    {
      char v26 = (_DWORD *)(v24 + var5);
      BOOL v27 = v24 + var5 < v24;
      BOOL v28 = (int)var5 + 1 > v25 || var5 == -1;
      uint64_t v29 = a3->var5;
      if (v27 || v28) {
        uint64_t v29 = 0xFFFFFFFFLL;
      }
      *(_DWORD *)&v5[v29] = 134744072;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v97 = ___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke;
      v98 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      char v100 = 4;
      v92 = v5;
      v99 = v5;
      v30 = v96;
      v31 = v30;
      LOBYTE(v101[0]) = 0;
      v32 = v26 + 1;
      uint64_t v33 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v34 = *(void *)(v33 + 8);
      }
      else {
        unint64_t v34 = 0;
      }
      uint64_t v35 = 0xFFFFFFFFLL;
      BOOL v11 = (unint64_t)v32 >= v34;
      unint64_t v36 = (unint64_t)v32 - v34;
      if (v11 && !HIDWORD(v36))
      {
        if ((v36 + 1) > *(_DWORD *)(*(void *)(v33 + 8) + 12) || v36 == -1) {
          uint64_t v35 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v35 = v36;
        }
      }
      ((void (*)(void *, uint64_t, void, uint64_t, uint64_t, void *))v97)(v30, v35, (8 * *v26), 1, 1, v101);
      unint64_t v38 = *v26;
      if (v38 && !LOBYTE(v101[0]))
      {
        unint64_t v39 = 0;
        do
        {
          v40 = &v26[2 * v39];
          uint64_t v41 = v40[2];
          if (v41 == -1)
          {
            unint64_t v45 = 0;
          }
          else
          {
            uint64_t v42 = *(void *)(*(void *)a4 + 8);
            BOOL v43 = *(_DWORD *)(v42 + 12) > v41;
            unint64_t v44 = v42 + v41;
            if (v43) {
              unint64_t v45 = v44;
            }
            else {
              unint64_t v45 = 0;
            }
          }
          v46 = v40 + 1;
          int v47 = v40[1];
          if (v47)
          {
            v48 = (_DWORD *)(v45 + 4);
            unint64_t v49 = 1;
            do
            {
              if (*(v48 - 1)) {
                BOOL v50 = *v48 != -1;
              }
              else {
                BOOL v50 = 0;
              }
              uint64_t v51 = *(void *)a4;
              if (*(void *)a4) {
                unint64_t v52 = *(void *)(v51 + 8);
              }
              else {
                unint64_t v52 = 0;
              }
              uint64_t v53 = 0xFFFFFFFFLL;
              BOOL v11 = v45 >= v52;
              unint64_t v54 = v45 - v52;
              if (v11 && !HIDWORD(v54))
              {
                if ((v54 + 1) > *(_DWORD *)(*(void *)(v51 + 8) + 12) || v54 == -1) {
                  uint64_t v53 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v53 = v54;
                }
              }
              ((void (*)(void *, uint64_t, uint64_t, void, BOOL, void *))v97)(v31, v53, 8, 0, v50, v101);
              int v47 = LOBYTE(v101[0]);
              if (v49 >= *v46) {
                break;
              }
              ++v49;
              v48 += 2;
              v45 += 8;
            }
            while (!LOBYTE(v101[0]));
            unint64_t v38 = *v26;
          }
          ++v39;
        }
        while (v39 < v38 && !v47);
      }

      id v5 = v92;
    }
  }
  Table = (const Table *)*((void *)a4 + 34);
  if (!Table) {
    Table = (const Table *)CSStore2::Store::getTable((atomic_ullong *)a4, &cfstr_String_0.isa);
  }
  if (Table == a3)
  {
    unint64_t StringCache = CSStore2::getStringCache((CSStore2 *)a4, v22);
    if (StringCache)
    {
      v61 = (_DWORD *)StringCache;
      uint64_t v62 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v63 = *(void *)(v62 + 8);
      }
      else {
        unint64_t v63 = 0;
      }
      uint64_t v64 = 0xFFFFFFFFLL;
      BOOL v11 = StringCache >= v63;
      unint64_t v65 = StringCache - v63;
      if (v11 && !HIDWORD(v65))
      {
        BOOL v66 = (v65 + 1) > *(_DWORD *)(*(void *)(v62 + 8) + 12) || v65 == -1;
        uint64_t v64 = v65;
        if (v66) {
          uint64_t v64 = 0xFFFFFFFFLL;
        }
      }
      *(_DWORD *)&v5[v64] = 168430090;
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v102 = ___ZN8CSStore27HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
      v103 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      char v105 = 5;
      v93 = v5;
      v104 = v5;
      v67 = v101;
      v68 = v67;
      v106[0] = 0;
      v69 = v61 + 1;
      uint64_t v70 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v71 = *(void *)(v70 + 8);
      }
      else {
        unint64_t v71 = 0;
      }
      uint64_t v72 = 0xFFFFFFFFLL;
      BOOL v11 = (unint64_t)v69 >= v71;
      unint64_t v73 = (unint64_t)v69 - v71;
      if (v11 && !HIDWORD(v73))
      {
        if ((v73 + 1) > *(_DWORD *)(*(void *)(v70 + 8) + 12) || v73 == -1) {
          uint64_t v72 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v72 = v73;
        }
      }
      ((void (*)(void *, uint64_t, void, uint64_t, uint64_t, unsigned char *))v102)(v67, v72, (8 * *v61), 1, 1, v106);
      unint64_t v75 = *v61;
      if (v75 && !v106[0])
      {
        unint64_t v76 = 0;
        do
        {
          v77 = &v61[2 * v76];
          uint64_t v78 = v77[2];
          if (v78 == -1)
          {
            unint64_t v81 = 0;
          }
          else
          {
            uint64_t v79 = *(void *)(*(void *)a4 + 8);
            BOOL v43 = *(_DWORD *)(v79 + 12) > v78;
            unint64_t v80 = v79 + v78;
            if (v43) {
              unint64_t v81 = v80;
            }
            else {
              unint64_t v81 = 0;
            }
          }
          v82 = v77 + 1;
          int v83 = v77[1];
          if (v83)
          {
            v84 = (_DWORD *)(v81 + 4);
            unint64_t v85 = 1;
            do
            {
              if (*(v84 - 1)) {
                BOOL v86 = *v84 != 0;
              }
              else {
                BOOL v86 = 0;
              }
              uint64_t v87 = *(void *)a4;
              if (*(void *)a4) {
                unint64_t v88 = *(void *)(v87 + 8);
              }
              else {
                unint64_t v88 = 0;
              }
              uint64_t v89 = 0xFFFFFFFFLL;
              BOOL v11 = v81 >= v88;
              unint64_t v90 = v81 - v88;
              if (v11 && !HIDWORD(v90))
              {
                if ((v90 + 1) > *(_DWORD *)(*(void *)(v87 + 8) + 12) || v90 == -1) {
                  uint64_t v89 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v89 = v90;
                }
              }
              ((void (*)(void *, uint64_t, uint64_t, void, BOOL, unsigned char *))v102)(v68, v89, 8, 0, v86, v106);
              int v83 = v106[0];
              if (v85 >= *v82) {
                break;
              }
              ++v85;
              v84 += 2;
              v81 += 8;
            }
            while (!v106[0]);
            unint64_t v75 = *v61;
          }
          ++v76;
        }
        while (v76 < v75 && !v83);
      }

      char v59 = 6;
      id v5 = v93;
    }
    else
    {
      char v59 = 6;
    }
  }
  else
  {
    v57 = (const Table *)*((void *)a4 + 33);
    if (!v57) {
      v57 = (const Table *)CSStore2::Store::getTable((atomic_ullong *)a4, &cfstr_Array.isa);
    }
    if (v57 == a3)
    {
      char v59 = 7;
    }
    else
    {
      v58 = (const Table *)*((void *)a4 + 35);
      if (!v58) {
        v58 = (const Table *)CSStore2::Store::getTable((atomic_ullong *)a4, &cfstr_Dictionary.isa);
      }
      if (v58 == a3) {
        char v59 = 8;
      }
      else {
        char v59 = 3;
      }
    }
  }
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke;
  v94[3] = &__block_descriptor_49_e30_v24__0r__Unit_b30b2I_0c__8_B16l;
  char v95 = v59;
  v94[4] = a4;
  v94[5] = v5;
  CSStore2::Store::enumerateUnits((atomic_ullong *)a4, (unsigned int *)a3, v94);
}

+ (id)predicateForSearchingDescriptionWithString:(id)a3 error:(id *)a4
{
  BOOL v4 = +[_CSVisualizerPredicate predicateWithFormatString:a3 error:a4];

  return v4;
}

+ (void)enumerateValuesForTitlesInDescription:(id)a3 block:(id)a4
{
  id v5 = a3;
  uint64_t v41 = (void (**)(id, void *, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t *))a4;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x4812000000;
  v60 = __Block_byref_object_copy__44;
  v61 = __Block_byref_object_dispose__45;
  uint64_t v62 = "";
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  unint64_t v63 = 0;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke;
  v54[3] = &unk_1E5D2A9D8;
  id v6 = v5;
  id v55 = v6;
  v56 = &v57;
  uint64_t v7 = MEMORY[0x1AD0DB340](v54);
  uint64_t v8 = (void *)MEMORY[0x1AD0DB160]();
  unint64_t v45 = v6;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", @"_CSVOutputType", 0, objc_msgSend(v6, "length"), 0, v7);
  uint64_t v39 = v7;
  unint64_t v9 = (uint64_t *)v58[6];
  context = (uint64_t *)v58[7];
  if (v9 == context)
  {
    int v10 = 0;
    BOOL v11 = 0;
  }
  else
  {
    int v10 = 0;
    BOOL v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v14 = *v9;
      uint64_t v15 = v9[1];
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x4012000000;
      BOOL v50 = __Block_byref_object_copy__692;
      uint64_t v51 = __Block_byref_object_dispose__693;
      unint64_t v52 = "";
      long long v53 = xmmword_1A7DE45C0;
      v46[0] = v13;
      v46[1] = 3221225472;
      v46[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_50;
      v46[3] = &unk_1E5D2AA00;
      v46[4] = &v47;
      v16 = (void *)MEMORY[0x1AD0DB340](v46);
      uint64_t v17 = (void *)MEMORY[0x1AD0DB160](v16);
      objc_msgSend(v45, "enumerateAttributesInRange:options:usingBlock:", v15 + v14, objc_msgSend(v45, "length", v39) - (v15 + v14), 0, v16);
      unint64_t v18 = v48 + 6;
      if ((unint64_t)v11 >= v12)
      {
        uint64_t v19 = (v11 - v10) >> 4;
        unint64_t v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 60) {
          abort();
        }
        if ((uint64_t)(v12 - (void)v10) >> 3 > v20) {
          unint64_t v20 = (uint64_t)(v12 - (void)v10) >> 3;
        }
        if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21) {
          unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v21);
        }
        else {
          uint64_t v22 = 0;
        }
        uint64_t v23 = (_OWORD *)(v21 + 16 * v19);
        *uint64_t v23 = *v18;
        if (v11 == v10)
        {
          unsigned int v25 = (char *)(v21 + 16 * v19);
        }
        else
        {
          unint64_t v24 = v21 + 16 * v19;
          do
          {
            unsigned int v25 = (char *)(v24 - 16);
            *(_OWORD *)(v24 - 16) = *((_OWORD *)v11 - 1);
            v11 -= 16;
            v24 -= 16;
          }
          while (v11 != v10);
        }
        unint64_t v12 = v21 + 16 * v22;
        BOOL v11 = (char *)(v23 + 1);
        if (v10) {
          operator delete(v10);
        }
        int v10 = v25;
      }
      else
      {
        *(_OWORD *)BOOL v11 = *v18;
        v11 += 16;
      }

      _Block_object_dispose(&v47, 8);
      v9 += 2;
    }
    while (v9 != context);
  }
  uint64_t v42 = objc_msgSend(v45, "string", v39);
  uint64_t v26 = v58[7] - v58[6];
  if ((v11 - v10) >> 4 >= (unint64_t)(v26 >> 4)) {
    unint64_t v27 = v26 >> 4;
  }
  else {
    unint64_t v27 = (v11 - v10) >> 4;
  }
  LOBYTE(v47) = 0;
  if (v27)
  {
    uint64_t v28 = 0;
    unint64_t v29 = 1;
    do
    {
      v30 = (void *)MEMORY[0x1AD0DB160]();
      uint64_t v31 = v58[6];
      uint64_t v32 = *(void *)(v31 + v28);
      uint64_t v33 = *(void *)&v10[v28];
      if (v32 != 0x7FFFFFFFFFFFFFFFLL && v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        contexta = v30;
        uint64_t v35 = *(void *)&v10[v28 + 8];
        uint64_t v36 = *(void *)(v31 + v28 + 8);
        v37 = objc_msgSend(v42, "substringWithRange:", v32, v36);
        unint64_t v38 = objc_msgSend(v45, "attributedSubstringFromRange:", v33, v35);
        v41[2](v41, v37, v32, v36, v38, v33, v35, &v47);

        v30 = contexta;
      }
      if (v29 >= v27) {
        break;
      }
      ++v29;
      v28 += 16;
    }
    while (!(_BYTE)v47);
  }
  else
  {

    if (!v10) {
      goto LABEL_40;
    }
  }
  operator delete(v10);
LABEL_40:

  _Block_object_dispose(&v57, 8);
  if (v63)
  {
    uint64_t v64 = v63;
    operator delete(v63);
  }
}

+ (_NSRange)rangeOfValueForTitle:(id)a3 inDescription:(id)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x4012000000;
  unint64_t v18 = __Block_byref_object_copy__692;
  uint64_t v19 = __Block_byref_object_dispose__693;
  unint64_t v20 = "";
  long long v21 = xmmword_1A7DE45C0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke;
  v12[3] = &unk_1E5D2A9B0;
  id v13 = v6;
  uint64_t v14 = &v15;
  id v7 = v6;
  [a1 enumerateValuesForTitlesInDescription:a4 block:v12];
  NSUInteger v8 = v16[6];
  NSUInteger v9 = v16[7];

  _Block_object_dispose(&v15, 8);
  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

+ (_CSVisualizer)new
{
}

- (void)setHandler:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(_CSVisualizerTableFunctions);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke;
    v15[3] = &unk_1E5D2ABA8;
    id v8 = v6;
    id v16 = v8;
    [(_CSVisualizerTableFunctions *)v7 setGetSummary:v15];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    unint64_t v12 = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2;
    id v13 = &unk_1E5D2ABD0;
    id v14 = v8;
    [(_CSVisualizerTableFunctions *)v7 setGetDescription:&v10];

    NSUInteger v9 = v7;
  }
  else
  {
    NSUInteger v9 = 0;
  }
  -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v9, v4, v10, v11, v12, v13);
}

- (id)handlerForTable:(unsigned int)a3
{
  id v5 = -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:");
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45___CSVisualizer_Deprecated__handlerForTable___block_invoke;
    v10[3] = &unk_1E5D2AB80;
    id v11 = v5;
    unint64_t v12 = self;
    unsigned int v13 = a3;
    id v7 = (void *)MEMORY[0x1AD0DB340](v10);
  }
  else
  {
    id v7 = 0;
  }

  id v8 = (void *)MEMORY[0x1AD0DB340](v7);

  return v8;
}

@end