@interface CCDatabaseSetEnumerator
+ (id)defaultEnumeratorWithUseCase:(id)a3;
- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5;
- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6;
- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 usingBlock:(id)a5;
- (CCDatabaseSetEnumerator)initWithReadAccess:(id)a3;
- (id)allSets:(id *)a3;
- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4;
- (id)allSetsWithOptions:(unsigned __int16)a3 error:(id *)a4;
- (id)allSetsWithOptions:(unsigned __int16)a3 itemType:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation CCDatabaseSetEnumerator

+ (id)defaultEnumeratorWithUseCase:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = +[CCDataResourceReadAccess defaultInstanceWithUseCase:v3];

  v6 = (void *)[v4 initWithReadAccess:v5];

  return v6;
}

- (CCDatabaseSetEnumerator)initWithReadAccess:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseSetEnumerator;
  v6 = [(CCDatabaseSetEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_readAccess, a3);
  }

  return v7;
}

- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4
{
  return [(CCDatabaseSetEnumerator *)self enumerateAllSets:a3 withOptions:0 itemType:(unsigned __int16)CCTypeIdentifierUnknown usingBlock:a4];
}

- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 usingBlock:(id)a5
{
  return [(CCDatabaseSetEnumerator *)self enumerateAllSets:a3 withOptions:a4 itemType:(unsigned __int16)CCTypeIdentifierUnknown usingBlock:a5];
}

- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5
{
  return [(CCDatabaseSetEnumerator *)self enumerateAllSets:a3 withOptions:0 itemType:a4 usingBlock:a5];
}

- (BOOL)enumerateAllSets:(id *)a3 withOptions:(unsigned __int16)a4 itemType:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6 = a5;
  uint64_t v7 = a4;
  id v10 = a6;
  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x2020000000;
  v19[2] = 0;
  readAccess = self->_readAccess;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__CCDatabaseSetEnumerator_enumerateAllSets_withOptions_itemType_usingBlock___block_invoke;
  v15[3] = &unk_265279FA0;
  id v12 = v10;
  id v16 = v12;
  v17 = &v18;
  [(CCDataResourceReadAccess *)readAccess enumerateReadableSets:a3 withOptions:v7 itemType:v6 usingBlock:v15];
  v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CCDatabaseSetEnumerator enumerateAllSets:withOptions:itemType:usingBlock:]((uint64_t)v19, v13);
  }

  _Block_object_dispose(&v18, 8);
  return 1;
}

void __76__CCDatabaseSetEnumerator_enumerateAllSets_withOptions_itemType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x24C5B1100]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)allSets:(id *)a3
{
  return [(CCDatabaseSetEnumerator *)self allSetsWithOptions:0 itemType:(unsigned __int16)CCTypeIdentifierUnknown error:a3];
}

- (id)allSetsWithOptions:(unsigned __int16)a3 error:(id *)a4
{
  return [(CCDatabaseSetEnumerator *)self allSetsWithOptions:a3 itemType:(unsigned __int16)CCTypeIdentifierUnknown error:a4];
}

- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4
{
  return [(CCDatabaseSetEnumerator *)self allSetsWithOptions:0 itemType:a3 error:a4];
}

- (id)allSetsWithOptions:(unsigned __int16)a3 itemType:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__CCDatabaseSetEnumerator_allSetsWithOptions_itemType_error___block_invoke;
  v13[3] = &unk_265279C98;
  id v10 = v9;
  id v14 = v10;
  LODWORD(a5) = [(CCDatabaseSetEnumerator *)self enumerateAllSets:a5 withOptions:v7 itemType:v6 usingBlock:v13];

  if (a5) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

uint64_t __61__CCDatabaseSetEnumerator_allSetsWithOptions_itemType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
}

- (void)enumerateAllSets:(uint64_t)a1 withOptions:(NSObject *)a2 itemType:usingBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Enumerated %lu total set(s)", (uint8_t *)&v3, 0xCu);
}

@end