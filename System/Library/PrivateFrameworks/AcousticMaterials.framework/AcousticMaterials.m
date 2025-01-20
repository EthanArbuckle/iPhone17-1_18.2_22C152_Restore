sqlite3 **DBIOOpenDatabaseFromURL(void *a1, void *a2)
{
  id v3;
  sqlite3 **v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void v12[2];

  v12[1] = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = (sqlite3 **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  *v4 = 0;
  v5 = [v3 path];

  v6 = v5;
  LODWORD(v5) = sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], v4, 1, 0);

  if (v5)
  {
    sqlite3_close(*v4);
    if (a2)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to open SQLite database: '%s'.", sqlite3_errmsg(*v4));
      v8 = (void *)MEMORY[0x263F087E8];
      v11 = *MEMORY[0x263F08320];
      v12[0] = v7;
      v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a2 = [v8 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:10 userInfo:v9];
    }
    free(v4);
    return 0;
  }
  return v4;
}

uint64_t DBIOCloseDatabase(void **a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!*a1) {
    return 1;
  }
  if (!sqlite3_close(*(sqlite3 **)*a1))
  {
    *(void *)*a1 = 0;
    free(*a1);
    *a1 = 0;
    return 1;
  }
  if (a2)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to close SQLite database [%s]", sqlite3_errmsg(*(sqlite3 **)*a1));
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a2 = [v5 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:10 userInfo:v6];
  }
  return 0;
}

uint64_t DBIODatabaseValidatedWithoutError(sqlite3 **a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  v4 = DBIOFetchDatabaseResults(a1, @"pragma integrity_check", a2);
  v5 = [v4 objectForKey:@"integrity_check"];
  uint64_t v6 = [v5 isEqualToString:@"ok"];

  if (a2 && (v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Database integrity test failed: %s", sqlite3_errmsg(*a1), v11);
    v12[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a2 = [v7 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:10 userInfo:v9];
  }
  return v6;
}

void *DBIOFetchDatabaseResults(sqlite3 **a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x263EF8340];
  ppStmt = 0;
  id v5 = a2;
  if (sqlite3_prepare_v2(*a1, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
  {
    if (a3)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to prepare query statement: '%s'.", sqlite3_errmsg(*a1));
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = v6;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a3 = [v7 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v8];
LABEL_29:

      a3 = 0;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v25 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  if (sqlite3_step(ppStmt) == 100)
  {
    uint64_t v9 = 0;
    while (sqlite3_column_count(ppStmt) < 1)
    {
LABEL_20:
      if (sqlite3_step(ppStmt) != 100) {
        goto LABEL_21;
      }
    }
    int v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      if (sqlite3_column_type(ppStmt, v10) == 1)
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, v10));
      }
      else if (sqlite3_column_type(ppStmt, v10) == 2)
      {
        v13 = NSNumber;
        double v14 = sqlite3_column_double(ppStmt, v10);
        *(float *)&double v14 = v14;
        uint64_t v12 = [v13 numberWithFloat:v14];
      }
      else
      {
        if (!sqlite3_column_text(ppStmt, v10))
        {

          uint64_t v11 = &stru_26DB344D0;
          goto LABEL_15;
        }
        uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, v10));
      }
      v15 = (__CFString *)v12;

      uint64_t v11 = v15;
      if (!v15)
      {
        a3 = v25;
        if (v25)
        {
          v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v29 = *MEMORY[0x263F08320];
          uint64_t v8 = [NSString stringWithFormat:@"Database query [%@] did not return any results", v5];
          v30 = v8;
          v20 = NSDictionary;
          v21 = &v30;
          v22 = &v29;
          goto LABEL_28;
        }
        goto LABEL_30;
      }
LABEL_15:
      v16 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(ppStmt, v10));
      v17 = [v6 objectForKeyedSubscript:v16];

      if (v17)
      {
        uint64_t v18 = [NSString stringWithFormat:@"%@(%d)", v16, v9];

        uint64_t v9 = (v9 + 1);
        v16 = (void *)v18;
      }
      [v6 setObject:v11 forKey:v16];

      if (++v10 >= sqlite3_column_count(ppStmt))
      {

        goto LABEL_20;
      }
    }
  }
LABEL_21:
  sqlite3_finalize(ppStmt);
  if ([v6 count])
  {
    a3 = (void *)[v6 copy];
    goto LABEL_30;
  }
  a3 = v25;
  if (v25)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v8 = [NSString stringWithFormat:@"Database query did not return any results"];
    v28 = v8;
    v20 = NSDictionary;
    v21 = &v28;
    v22 = &v27;
LABEL_28:
    v23 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    *a3 = [v19 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v23];

    goto LABEL_29;
  }
LABEL_30:

LABEL_31:
  return a3;
}

id DBIOFetchDatabaseResultsExt(sqlite3 **a1, id a2, void *a3)
{
  v29[1] = *MEMORY[0x263EF8340];
  ppStmt = 0;
  if (sqlite3_prepare_v2(*a1, (const char *)[a2 UTF8String], -1, &ppStmt, 0))
  {
    if (a3)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to prepare query statement: '%s'.", sqlite3_errmsg(*a1));
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      v29[0] = v5;
      v7 = NSDictionary;
      uint64_t v8 = (void **)v29;
      uint64_t v9 = &v28;
LABEL_23:
      int v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
      [v6 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v10];
      uint64_t v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
    if (a3)
    {
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      id v5 = [NSString stringWithFormat:@"Database query did not return any results"];
      uint64_t v27 = v5;
      v7 = NSDictionary;
      uint64_t v8 = &v27;
      uint64_t v9 = &v26;
      goto LABEL_23;
    }
LABEL_25:
    uint64_t v18 = 0;
    goto LABEL_26;
  }
  id v5 = [MEMORY[0x263EFF980] arrayWithCapacity:sqlite3_column_count(ppStmt)];
  int v10 = [MEMORY[0x263EFF980] array];
  do
  {
    if (sqlite3_column_count(ppStmt) < 1) {
      goto LABEL_18;
    }
    int v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v13 = v12;
      if (sqlite3_column_type(ppStmt, v11) == 1)
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, v11));
LABEL_14:
        uint64_t v12 = (__CFString *)v14;
        goto LABEL_15;
      }
      if (sqlite3_column_type(ppStmt, v11) == 2)
      {
        v15 = NSNumber;
        double v16 = sqlite3_column_double(ppStmt, v11);
        *(float *)&double v16 = v16;
        uint64_t v14 = [v15 numberWithFloat:v16];
        goto LABEL_14;
      }
      if (sqlite3_column_text(ppStmt, v11))
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, v11));
        goto LABEL_14;
      }
      uint64_t v12 = &stru_26DB344D0;
LABEL_15:

      [v5 addObject:v12];
      ++v11;
    }
    while (v11 < sqlite3_column_count(ppStmt));

LABEL_18:
    v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    [v10 addObject:v17];

    [v5 removeAllObjects];
  }
  while (sqlite3_step(ppStmt) == 100);
  sqlite3_finalize(ppStmt);
  if ([v10 count])
  {
    uint64_t v18 = (void *)[v10 copy];
  }
  else
  {
    if (a3)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      v21 = [NSString stringWithFormat:@"Database query did not return any results"];
      v25 = v21;
      v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a3 = [v20 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v22];
    }
    uint64_t v18 = 0;
  }
LABEL_24:

LABEL_26:
  return v18;
}

BOOL operator==(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void sub_227028308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, materialsForPair *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _Unwind_Resume(a1);
}

void *AbsorptionTable::get(AbsorptionTable *this)
{
  {
    AbsorptionTable::AbsorptionTable((AbsorptionTable *)&AbsorptionTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))AbsorptionTable::~AbsorptionTable, &AbsorptionTable::get(void)::instance, &dword_227025000);
  }
  return &AbsorptionTable::get(void)::instance;
}

void sub_227028484(_Unwind_Exception *a1)
{
}

uint64_t *materialCachedTable<AMAbsorption>::getMaterial(void *a1, void *a2, uint64_t *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v11 = [[AMAbsorption alloc] initWithMaterialName:v5];
  uint64_t v6 = std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::find<AMAbsorption * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    uint64_t v8 = [NSString stringWithFormat:@"Material %@ is not found in %@", v5, a1[5]];
    v13[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v7 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:4 userInfo:v9];

    a3 = 0;
  }

  return a3;
}

void sub_2270285FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void *ScatteringTable::get(ScatteringTable *this)
{
  {
    ScatteringTable::ScatteringTable((ScatteringTable *)&ScatteringTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))ScatteringTable::~ScatteringTable, &ScatteringTable::get(void)::instance, &dword_227025000);
  }
  return &ScatteringTable::get(void)::instance;
}

void sub_2270286C0(_Unwind_Exception *a1)
{
}

uint64_t *materialCachedTable<AMScattering>::getMaterial(void *a1, void *a2, uint64_t *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v11 = [[AMScattering alloc] initWithMaterialName:v5];
  uint64_t v6 = std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::find<AMScattering * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    uint64_t v8 = [NSString stringWithFormat:@"Material %@ is not found in %@", v5, a1[5]];
    v13[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v7 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:4 userInfo:v9];

    a3 = 0;
  }

  return a3;
}

void sub_227028838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void *SoundReductionTable::get(SoundReductionTable *this)
{
  {
    SoundReductionTable::SoundReductionTable((SoundReductionTable *)&SoundReductionTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))SoundReductionTable::~SoundReductionTable, &SoundReductionTable::get(void)::instance, &dword_227025000);
  }
  return &SoundReductionTable::get(void)::instance;
}

void sub_2270288FC(_Unwind_Exception *a1)
{
}

uint64_t *materialCachedTable<AMSoundReductionIndex>::getMaterial(void *a1, void *a2, uint64_t *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v11 = [[AMSoundReductionIndex alloc] initWithMaterialName:v5];
  uint64_t v6 = std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::find<AMSoundReductionIndex * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    uint64_t v8 = [NSString stringWithFormat:@"Material %@ is not found in %@", v5, a1[5]];
    v13[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v7 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:4 userInfo:v9];

    a3 = 0;
  }

  return a3;
}

void sub_227028A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void materialsForPair::~materialsForPair(materialsForPair *this)
{
}

void sub_227028C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_227028D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_227028D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void __assign_helper_atomic_property_(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *> *>>((void *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void __assign_helper_atomic_property__45(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>((void *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void __assign_helper_atomic_property__47(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>((void *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void sub_2270290CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void materialCachedTable<AMAbsorption>::readTable(uint64_t a1, void *a2)
{
  v4 = [NSString stringWithFormat:@"SELECT * FROM [%@]", *(void *)(a1 + 40)];
  id v5 = DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, [v5 count]);
    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      v7 = [v5 objectAtIndexedSubscript:i];
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v7 forKeys:*(void *)(a1 + 48)];
      uint64_t v9 = [[AMAbsorption alloc] initWithValues:v8 error:a2];
      std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__emplace_unique_key_args<AMAbsorption * {__strong},AMAbsorption * const {__strong}&>(a1, (void **)&v9, (id *)&v9);
    }
  }
}

void sub_227029240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void materialCachedTable<AMScattering>::readTable(uint64_t a1, void *a2)
{
  v4 = [NSString stringWithFormat:@"SELECT * FROM [%@]", *(void *)(a1 + 40)];
  id v5 = DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, [v5 count]);
    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      v7 = [v5 objectAtIndexedSubscript:i];
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v7 forKeys:*(void *)(a1 + 48)];
      uint64_t v9 = [[AMScattering alloc] initWithValues:v8 error:a2];
      std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::__emplace_unique_key_args<AMScattering * {__strong},AMScattering * const {__strong}&>(a1, (void **)&v9, (id *)&v9);
    }
  }
}

void sub_2270293C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void materialCachedTable<AMSoundReductionIndex>::readTable(uint64_t a1, void *a2)
{
  v4 = [NSString stringWithFormat:@"SELECT * FROM [%@]", *(void *)(a1 + 40)];
  id v5 = DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, [v5 count]);
    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      v7 = [v5 objectAtIndexedSubscript:i];
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v7 forKeys:*(void *)(a1 + 48)];
      uint64_t v9 = [[AMSoundReductionIndex alloc] initWithValues:v8 error:a2];
      std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::__emplace_unique_key_args<AMSoundReductionIndex * {__strong},AMSoundReductionIndex * const {__strong}&>(a1, (void **)&v9, (id *)&v9);
    }
  }
}

void sub_227029550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void materialCachedTable<AMAbsorption>::applyAbsFilter(uint64_t a1, void *a2)
{
  id v19 = a2;
  for (unint64_t i = *(uint64_t ***)(a1 + 16); i; unint64_t i = (uint64_t **)*i)
  {
    unint64_t v4 = [v19 count];
    id v5 = [i[2] absorptionUserData];
    unint64_t v6 = [v5 count];

    if (v4 <= v6)
    {
      id v7 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v8 = [i[2] absorptionUserData];
      uint64_t v9 = (void *)[v7 initWithArray:v8];

      for (unint64_t j = 0; [v19 count] > j; ++j)
      {
        int v11 = NSNumber;
        uint64_t v12 = [v9 objectAtIndexedSubscript:j];
        [v12 doubleValue];
        double v14 = v13;
        v15 = [v19 objectAtIndexedSubscript:j];
        [v15 doubleValue];
        double v17 = v14 * v16;
        if (v17 < 0.0) {
          double v17 = 0.0;
        }
        if (v17 > 1.0) {
          double v17 = 1.0;
        }
        uint64_t v18 = [v11 numberWithDouble:v17];
        [v9 setObject:v18 atIndexedSubscript:j];
      }
      [i[2] setAbsorptionUserData:v9];
    }
  }
}

void sub_2270297A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2270298C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_227029A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id materialCachedTable<AMAbsorption>::materialNames(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  for (unint64_t i = *(uint64_t ***)(a1 + 16); i; unint64_t i = (uint64_t **)*i)
  {
    unint64_t v4 = [i[2] materialName];
    [v2 addObject:v4];
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

void sub_227029B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id materialCachedTable<AMScattering>::materialNames(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  for (unint64_t i = *(uint64_t ***)(a1 + 16); i; unint64_t i = (uint64_t **)*i)
  {
    unint64_t v4 = [i[2] materialName];
    [v2 addObject:v4];
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

void sub_227029BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id materialCachedTable<AMSoundReductionIndex>::materialNames(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  for (unint64_t i = *(uint64_t ***)(a1 + 16); i; unint64_t i = (uint64_t **)*i)
  {
    unint64_t v4 = [i[2] materialName];
    [v2 addObject:v4];
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

void sub_227029CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_227029D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_227029F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22702A680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void AbsorptionTable::~AbsorptionTable(id *this)
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void AbsorptionTable::AbsorptionTable(AbsorptionTable *this)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((void *)this + 5) = @"acoustic absorption";
  *((void *)this + 6) = 0;
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"materialName", @"materialDescription", @"frequencyBands", @"absorptionUserData", @"absorptionReferenceData", @"uncertaintyReferenceData", @"numDataPointsReferenceData", @"totalNumDataSetsReferenceData", 0);
  v3 = (void *)*((void *)this + 6);
  *((void *)this + 6) = v2;
}

void sub_22702A880(_Unwind_Exception *a1)
{
  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

uint64_t materialCachedTable<AMAbsorption>::~materialCachedTable(uint64_t a1)
{
  return std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void ScatteringTable::~ScatteringTable(id *this)
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void ScatteringTable::ScatteringTable(ScatteringTable *this)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((void *)this + 5) = @"acoustic scattering";
  *((void *)this + 6) = 0;
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"materialName", @"materialDescription", @"frequencyBands", @"scatteringUserData", @"scatteringReferenceData", @"uncertaintyReferenceData", @"numDataPointsReferenceData", @"totalNumDataSetsReferenceData", 0);
  v3 = (void *)*((void *)this + 6);
  *((void *)this + 6) = v2;
}

void sub_22702AA64(_Unwind_Exception *a1)
{
  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

void SoundReductionTable::~SoundReductionTable(id *this)
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void SoundReductionTable::SoundReductionTable(SoundReductionTable *this)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((void *)this + 5) = @"acoustic sound reduction index";
  *((void *)this + 6) = 0;
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"materialName", @"materialDescription", @"frequencyBands", @"soundReductionIndexUserData", @"soundReductionIndexReferenceData", @"uncertaintyReferenceData", @"numDataPointsReferenceData", @"averageSoundReductionIndex", @"totalNumDataSetsReferenceData", @"materialDepth", @"uncertaintyMaterialDepth", 0);
  v3 = (void *)*((void *)this + 6);
  *((void *)this + 6) = v2;
}

void sub_22702AB90(_Unwind_Exception *a1)
{
  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<semantic_pair,materialsForPair>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (unint64_t i = *(long long **)(a2 + 16); i; unint64_t i = *(long long **)i)
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::pair<semantic_pair const,materialsForPair> const&>(a1, (void *)i + 2, i + 1);
  return a1;
}

void sub_22702AC04(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::pair<semantic_pair const,materialsForPair> const&>(uint64_t a1, void *a2, long long *a3)
{
  unint64_t v6 = a2[2];
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2[2];
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void **)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      int v10 = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == *a2 && v10[3] == a2[1]) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          int v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  double v14 = operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *double v14 = 0;
  v14[1] = v6;
  std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100]((uint64_t)(v14 + 2), a3);
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    void *v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v3) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v22 >= v7) {
          v22 %= v7;
        }
      }
      else
      {
        v22 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  int v10 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v24, 0);
  return v10;
}

void sub_22702B0E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100](uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((id *)a2 + 3);
  *(void *)(a1 + 32) = *((id *)a2 + 4);
  *(void *)(a1 + 40) = *((id *)a2 + 5);
  return a1;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  long long v4 = (long long *)a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint8x8_t v8 = (void *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      int v10 = v8;
    }
    else
    {
      do
      {
        v14[0] = (uint64_t)(v8 + 2);
        v14[1] = (uint64_t)(v8 + 5);
        std::pair<semantic_pair &,materialsForPair &>::operator=[abi:ne180100]<semantic_pair const,materialsForPair,(void *)0>(v14, v4 + 1);
        int v10 = (void *)*v8;
        unint64_t v11 = v8[4];
        v8[1] = v11;
        inserted = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare((uint64_t)a1, v11, v8 + 2);
        std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, v8, inserted);
        long long v4 = *(long long **)v4;
        if (v10) {
          BOOL v13 = v4 == (long long *)a3;
        }
        else {
          BOOL v13 = 1;
        }
        uint8x8_t v8 = v10;
      }
      while (!v13);
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != (long long *)a3)
  {
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_multi<std::pair<semantic_pair const,materialsForPair> const&>(a1, v4 + 1);
    long long v4 = *(long long **)v4;
  }
}

void sub_22702B36C(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_22702B384(_Unwind_Exception *a1)
{
}

uint64_t *std::pair<semantic_pair &,materialsForPair &>::operator=[abi:ne180100]<semantic_pair const,materialsForPair,(void *)0>(uint64_t *a1, long long *a2)
{
  uint64_t v4 = *a1;
  long long v5 = *a2;
  *(void *)(v4 + 16) = *((void *)a2 + 2);
  *(_OWORD *)uint64_t v4 = v5;
  uint64_t v6 = (id *)a1[1];
  objc_storeStrong(v6, *((id *)a2 + 3));
  objc_storeStrong(v6 + 1, *((id *)a2 + 4));
  objc_storeStrong(v6 + 2, *((id *)a2 + 5));
  return a1;
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<false>(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  float v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    result = v16;
    float v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    if (v19 == a2)
    {
      BOOL v21 = v16[2] == *a3 && v16[3] == a3[1];
      BOOL v22 = v21;
    }
    else
    {
      BOOL v22 = 0;
    }
    int v23 = v17 & !v22;
    v17 |= v22;
  }
  while (v23 != 1);
  return result;
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
              if (!v13) {
                break;
              }
            }
            while (i[2] == v13[2] && i[3] == v13[3]);
            void *v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_multi<std::pair<semantic_pair const,materialsForPair> const&>(void *a1, long long *a2)
{
  int8x8_t v4 = a1 + 2;
  unint64_t v5 = operator new(0x40uLL);
  v9[0] = v5;
  v9[1] = v4;
  void *v5 = 0;
  v5[1] = 0;
  std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100]((uint64_t)(v5 + 2), a2);
  char v10 = 1;
  unint64_t v6 = v5[4];
  v5[1] = v6;
  inserted = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare((uint64_t)a1, v6, v5 + 2);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, v5, inserted);
  v9[0] = 0;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  return v5;
}

void sub_22702B94C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<NSString * {__strong},long long>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(id **)(a2 + 16); i; uint64_t i = (id *)*i)
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},long long> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_22702B9C4(_Unwind_Exception *a1)
{
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},long long> const&>(uint64_t a1, id *a2, uint64_t a3)
{
  unint64_t v7 = [*a2 hash];
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(void **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if ([*((id *)i + 2) isEqualToString:*a2]) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t v15 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v8;
  id v16 = *(id *)a3;
  uint64_t v17 = *(void *)(a3 + 8);
  *((void *)i + 2) = v16;
  *((void *)i + 3) = v17;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v23);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v24 = *(void *)a1;
  char v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *(void *)uint64_t i = *v25;
LABEL_38:
    void *v25 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v15;
  void *v15 = i;
  *(void *)(v24 + 8 * v3) = v15;
  if (*(void *)i)
  {
    unint64_t v26 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9) {
        v26 %= v9;
      }
    }
    else
    {
      v26 &= v9 - 1;
    }
    char v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_22702BC28(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  int8x8_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    unint64_t v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint8x8_t v10 = v8;
    }
    else
    {
      do
      {
        objc_storeStrong(v8 + 2, (id)v4[2]);
        v8[3] = (id)v4[3];
        uint8x8_t v10 = (id *)*v8;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(a1, v8);
        int8x8_t v4 = (uint64_t *)*v4;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        unint64_t v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_multi<std::pair<NSString * const {__strong},long long> const&>(a1, (uint64_t)(v4 + 2));
    int8x8_t v4 = (uint64_t *)*v4;
  }
}

void sub_22702BD70(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_22702BD88(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(void *a1, void *a2)
{
  int8x8_t v4 = a2 + 2;
  unint64_t v5 = [(id)a2[2] hash];
  a2[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, a2, inserted);
  return a2;
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      size_t v12 = v11;
    }
    else {
      size_t v12 = v10;
    }
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__rehash<false>(a1, v12);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v13.i16[0] = vaddlv_u8(v13);
  unint64_t v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  id v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (v16)
  {
    uint64_t v17 = (void *)*v16;
    if (*v16)
    {
      int v18 = 0;
      do
      {
        unint64_t v19 = v17[1];
        if (v14 > 1)
        {
          unint64_t v20 = v17[1];
          if (v19 >= v6) {
            unint64_t v20 = v19 % v6;
          }
        }
        else
        {
          unint64_t v20 = v19 & (v6 - 1);
        }
        if (v20 != v15) {
          break;
        }
        int v21 = v19 == a2 ? [(id)v17[2] isEqualToString:*a3] : 0;
        if (v18 & (v21 ^ 1)) {
          break;
        }
        v18 |= v21;
        id v16 = (void *)*v16;
        uint64_t v17 = (void *)*v16;
      }
      while (*v16);
    }
  }
  return v16;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      unint64_t v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v13 = *(void *)(i + 8);
        if (v10 > 1)
        {
          if (v13 >= a2) {
            v13 %= a2;
          }
        }
        else
        {
          v13 &= a2 - 1;
        }
        if (v13 == v8)
        {
          uint64_t v7 = (uint64_t *)i;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          unint64_t v14 = *(void **)i;
          unint64_t v15 = (void *)i;
          if (*(void *)i)
          {
            while (1)
            {
              int v16 = [*(id *)(i + 16) isEqualToString:v14[2]];
              uint64_t v17 = (void *)*v15;
              if (!v16) {
                break;
              }
              unint64_t v14 = (void *)*v17;
              unint64_t v15 = (void *)*v15;
              if (!*v17) {
                goto LABEL_30;
              }
            }
            unint64_t v14 = (void *)*v15;
            uint64_t v17 = v15;
          }
          else
          {
            uint64_t v17 = (void *)i;
          }
LABEL_30:
          uint64_t *v7 = (uint64_t)v14;
          void *v17 = **(void **)(*(void *)a1 + 8 * v13);
          **(void **)(*(void *)a1 + 8 * v13) = i;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          uint64_t v7 = (uint64_t *)i;
          unint64_t v8 = v13;
        }
      }
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    *(void *)a1 = 0;
    if (v11) {
      operator delete(v11);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_multi<std::pair<NSString * const {__strong},long long> const&>(void *a1, uint64_t a2)
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__construct_node<std::pair<NSString * const {__strong},long long> const&>((uint64_t)a1, a2, (uint64_t)&v4);
  return std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(a1, v4);
}

void sub_22702C240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11)
{
  if (a10) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__construct_node<std::pair<NSString * const {__strong},long long> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  uint64_t v6 = operator new(0x20uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  void *v6 = 0;
  v6[1] = 0;
  id v7 = *(id *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  v6[2] = v7;
  v6[3] = v8;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t result = [v7 hash];
  v6[1] = result;
  return result;
}

void sub_22702C2D8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::find<AMAbsorption * {__strong}>(void *a1, void **a2)
{
  unint64_t v4 = material_hash<AMAbsorption * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if (material_equal_to<AMAbsorption * {__strong}>::operator()(v12, v11[2], *a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMAbsorption * {__strong}>::operator()(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 materialName];
  uint64_t v3 = [v2 hash];

  return v3;
}

void sub_22702C438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMAbsorption * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int8x8_t v5 = [a2 materialName];
  unint64_t v6 = [v4 materialName];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

void sub_22702C4B8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::find<AMScattering * {__strong}>(void *a1, void **a2)
{
  unint64_t v4 = material_hash<AMScattering * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if (material_equal_to<AMScattering * {__strong}>::operator()(v12, v11[2], *a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMScattering * {__strong}>::operator()(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 materialName];
  uint64_t v3 = [v2 hash];

  return v3;
}

void sub_22702C628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMScattering * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int8x8_t v5 = [a2 materialName];
  unint64_t v6 = [v4 materialName];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

void sub_22702C6A8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::find<AMSoundReductionIndex * {__strong}>(void *a1, void **a2)
{
  unint64_t v4 = material_hash<AMSoundReductionIndex * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if (material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(v12, v11[2], *a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMSoundReductionIndex * {__strong}>::operator()(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 materialName];
  uint64_t v3 = [v2 hash];

  return v3;
}

void sub_22702C818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int8x8_t v5 = [a2 materialName];
  unint64_t v6 = [v4 materialName];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

void sub_22702C898(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(uint64_t a1, id *a2, uint64_t a3, id **a4)
{
  unint64_t v8 = [*a2 hash];
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = v8;
      if (v8 >= v10) {
        unint64_t v4 = v8 % v10;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if ([*((id *)i + 2) isEqualToString:*a2]) {
            return i;
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
          if (v15 != v4) {
            break;
          }
        }
      }
    }
  }
  int v16 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  *((void *)i + 2) = **a4;
  *((void *)i + 3) = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)uint64_t i = *v24;
LABEL_38:
    *uint64_t v24 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v16;
  void *v16 = i;
  *(void *)(v23 + 8 * v4) = v16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    uint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_22702CB10(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::piecewise_construct_t const&,std::tuple<semantic_pair const&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[2];
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[2];
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint8x8_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1]) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint8x8_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v14 = a1 + 16;
  unint64_t v15 = operator new(0x40uLL);
  v26[0] = v15;
  v26[1] = a1 + 16;
  void *v15 = 0;
  v15[1] = v7;
  uint64_t v16 = *((void *)*a4 + 2);
  *((_OWORD *)v15 + 1) = **a4;
  v15[4] = v16;
  v15[5] = 0;
  v15[6] = 0;
  v15[7] = 0;
  char v27 = 1;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    void *v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = v14;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v24 >= v8) {
          v24 %= v8;
        }
      }
      else
      {
        v24 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint8x8_t v11 = (void *)v26[0];
  v26[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return v11;
}

void sub_22702CD84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::find<NSString * {__strong}>(void *a1, id *a2)
{
  unint64_t v4 = [*a2 hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (uint64_t i = *v10; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if ([i[2] isEqualToString:*a2]) {
        return i;
      }
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }
      else
      {
        v12 &= *(void *)&v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

void *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::find<semantic_pair>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = a2[2];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a2[2];
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1]) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void *std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__emplace_unique_key_args<AMAbsorption * {__strong},AMAbsorption * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = material_hash<AMAbsorption * {__strong}>::operator()(a1 + 24, *a2);
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
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (material_equal_to<AMAbsorption * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2)) {
            return i;
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
  uint64_t v16 = (void *)(a1 + 16);
  uint64_t i = operator new(0x18uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  *((void *)i + 2) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
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
  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)uint64_t i = *v24;
LABEL_38:
    *unint64_t v24 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v16;
  void *v16 = i;
  *(void *)(v23 + 8 * v3) = v16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_22702D20C(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::__emplace_unique_key_args<AMScattering * {__strong},AMScattering * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = material_hash<AMScattering * {__strong}>::operator()(a1 + 24, *a2);
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
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (material_equal_to<AMScattering * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2)) {
            return i;
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
  uint64_t v16 = (void *)(a1 + 16);
  uint64_t i = operator new(0x18uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  *((void *)i + 2) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
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
  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)uint64_t i = *v24;
LABEL_38:
    *unint64_t v24 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v16;
  void *v16 = i;
  *(void *)(v23 + 8 * v3) = v16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_22702D488(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::__emplace_unique_key_args<AMSoundReductionIndex * {__strong},AMSoundReductionIndex * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = material_hash<AMSoundReductionIndex * {__strong}>::operator()(a1 + 24, *a2);
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
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2)) {
            return i;
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
  uint64_t v16 = (void *)(a1 + 16);
  uint64_t i = operator new(0x18uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  *((void *)i + 2) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
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
  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)uint64_t i = *v24;
LABEL_38:
    *unint64_t v24 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v16;
  void *v16 = i;
  *(void *)(v23 + 8 * v3) = v16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_22702D704(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

BOOL valueIsBetween(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = ([v6 compare:v5] == -1 || !objc_msgSend(v6, "compare:", v5))
    && ([v7 compare:v5] == 1 || !objc_msgSend(v7, "compare:", v5));

  return v8;
}

id decimalValuesFromCSV(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  unint64_t v12 = v1;
  unint64_t v3 = [v1 componentsSeparatedByString:@","];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 isEqualToString:@"NaN"])
        {
          [MEMORY[0x263EFF9D0] null];
        }
        else
        {
          unint64_t v9 = NSNumber;
          [v8 doubleValue];
          objc_msgSend(v9, "numberWithDouble:");
        unint64_t v10 = };
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

id clampArrayValues(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "doubleValue", (void)v23);
        double v16 = v15;
        [v6 doubleValue];
        id v17 = v6;
        if (v16 >= v18)
        {
          objc_msgSend(v14, "doubleValue", v6);
          double v20 = v19;
          [v7 doubleValue];
          if (v20 <= v21) {
            id v17 = v14;
          }
          else {
            id v17 = v7;
          }
        }
        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  return v8;
}

id integerValuesFromCSV(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = v1;
  unint64_t v3 = [v1 componentsSeparatedByString:@","];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isEqualToString:@"NaN"]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue"));
        }
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::terminate(void)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}