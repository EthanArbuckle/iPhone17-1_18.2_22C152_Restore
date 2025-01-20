@interface HKMedicationsDemoSearchAssetInterface
- (HKMedicationsDemoSearchAssetInterface)initWithAssetPath:(id)a3;
- (NSString)assetPath;
- (OS_dispatch_queue)queue;
- (id)expandedGenericMedicationSearchResult:(id)a3 error:(id *)a4;
- (id)genericMedicationsFromTokens:(id)a3 error:(id *)a4;
- (id)medicationFromNDCCode:(id)a3 error:(id *)a4;
- (int)openAsset;
- (void)close;
- (void)setAssetPath:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HKMedicationsDemoSearchAssetInterface

- (HKMedicationsDemoSearchAssetInterface)initWithAssetPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsDemoSearchAssetInterface;
  v5 = [(HKMedicationsDemoSearchAssetInterface *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(HKMedicationsDemoSearchAssetInterface *)v5 setAssetPath:v4];
    dispatch_queue_t v7 = dispatch_queue_create("HKMedicationsDemoSearchAssetInterface", 0);
    [(HKMedicationsDemoSearchAssetInterface *)v6 setQueue:v7];

    v6->_interruptionLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int)openAsset
{
  p_db = &self->_db;
  if (self->_db) {
    return 0;
  }
  p_interruptionLock = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  int v6 = sqlite3_open([(NSString *)self->_assetPath fileSystemRepresentation], p_db);
  os_unfair_lock_unlock(p_interruptionLock);
  return v6;
}

- (void)close
{
  p_interruptionLock = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  os_unfair_lock_unlock(p_interruptionLock);
}

- (id)medicationFromNDCCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  dispatch_queue_t v7 = [(HKMedicationsDemoSearchAssetInterface *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HKMedicationsDemoSearchAssetInterface_medicationFromNDCCode_error___block_invoke;
  block[3] = &unk_264BC3520;
  v17 = v24;
  v18 = &v20;
  block[4] = self;
  id v8 = v6;
  id v16 = v8;
  v19 = &v26;
  dispatch_sync(v7, block);

  if (v21[3])
  {
    objc_super v9 = (void *)MEMORY[0x263F087E8];
    id v10 = [NSString alloc];
    v11 = (void *)[v10 initWithUTF8String:v21[3]];
    objc_msgSend(v9, "hk_assignError:code:description:", a4, 100, v11);

LABEL_3:
    id v12 = 0;
    goto LABEL_6;
  }
  v13 = (void *)v27[5];
  if (!v13)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 11, @"No medication matching NDC was found");
    goto LABEL_3;
  }
  id v12 = v13;
LABEL_6:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

const char *__69__HKMedicationsDemoSearchAssetInterface_medicationFromNDCCode_error___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 8), (const char *)objc_msgSend(@"SELECT pr.product_id, pr.generic_name, pr.brand_name, pa.package_ndc, pa.description         FROM packaging AS pa         JOIN product_packaging AS pp ON pa.package_id=pp.packaging_id         JOIN product AS pr ON pp.product_id=pr.product_id         WHERE pa.package_ndc_11=? OR pa.package_ndc_10=?", "UTF8String"), -1, &ppStmt, 0);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || sqlite3_bind_text(ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_7;
  }
  if (sqlite3_step(ppStmt) == 100)
  {
    v2 = sqlite3_column_text(ppStmt, 0);
    v3 = sqlite3_column_text(ppStmt, 1);
    id v4 = sqlite3_column_text(ppStmt, 2);
    v5 = sqlite3_column_text(ppStmt, 3);
    id v6 = sqlite3_column_text(ppStmt, 4);
    dispatch_queue_t v7 = [HKFullMedicationSearchResult alloc];
    id v8 = [NSString stringWithUTF8String:v2];
    objc_super v9 = [NSString stringWithUTF8String:v6];
    id v10 = [NSString stringWithUTF8String:v5];
    v11 = [NSString stringWithUTF8String:v4];
    id v12 = [NSString stringWithUTF8String:v3];
    uint64_t v13 = [(HKFullMedicationSearchResult *)v7 initWithProductId:v8 packagingName:v9 packagingNDC:v10 productBrandName:v11 productGenericName:v12 route:0 doseForm:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  result = (const char *)sqlite3_finalize(ppStmt);
  if (result)
  {
LABEL_7:
    result = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

- (id)genericMedicationsFromTokens:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  dispatch_queue_t v7 = [(HKMedicationsDemoSearchAssetInterface *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HKMedicationsDemoSearchAssetInterface_genericMedicationsFromTokens_error___block_invoke;
  block[3] = &unk_264BC3548;
  id v8 = v6;
  id v15 = v8;
  id v16 = self;
  v17 = v24;
  v18 = &v20;
  v19 = &v26;
  dispatch_sync(v7, block);

  if (v21[3])
  {
    objc_super v9 = (void *)MEMORY[0x263F087E8];
    id v10 = [NSString alloc];
    v11 = (void *)[v10 initWithUTF8String:v21[3]];
    objc_msgSend(v9, "hk_assignError:code:description:", a4, 100, v11);

    id v12 = 0;
  }
  else
  {
    id v12 = [(id)v27[5] allObjects];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __76__HKMedicationsDemoSearchAssetInterface_genericMedicationsFromTokens_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v14 = *(void *)v17;
    uint64_t v4 = MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        ppStmt = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 40) + 8), (const char *)objc_msgSend(@"SELECT DISTINCT gm.generic_medication_id, gm.name             FROM token AS tk             LEFT JOIN ingredient_token AS ing_tk ON tk.token_id=ing_tk.token_id             LEFT JOIN ingredient_strength AS ingstr ON ingstr.component_id=ing_tk.ingredient_id             LEFT JOIN ingredient AS ing ON ingstr.ingredient_id=ing.ingredient_id             LEFT JOIN generic_medication_ingredient AS gmi ON gmi.ingredient_id=ing.ingredient_id             LEFT JOIN generic_medication AS gm ON gm.generic_medication_id=gmi.generic_medication_id             WHERE tk.token LIKE ? AND gm.generic_medication_id IS NOT NULL", "UTF8String"), -1, &ppStmt, 0);
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          || sqlite3_bind_text(ppStmt, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          goto LABEL_14;
        }
        while (sqlite3_step(ppStmt) == 100)
        {
          uint64_t v7 = sqlite3_column_int(ppStmt, 0);
          id v8 = sqlite3_column_text(ppStmt, 1);
          objc_super v9 = [HKGenericMedicationSearchResult alloc];
          id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v7);
          v11 = [NSString stringWithUTF8String:v8];
          id v12 = [(HKGenericMedicationSearchResult *)v9 initWithGenericMedicationId:v10 genericMedicationName:v11 brandName:0 ingredients:v4];

          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v12];
        }
        if (sqlite3_finalize(ppStmt))
        {
LABEL_14:
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
          goto LABEL_15;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)expandedGenericMedicationSearchResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 genericMedicationId];
  if (v7
    && (id v8 = (void *)v7,
        [v6 ingredients],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        !v10))
  {
    uint64_t v24 = 0;
    int v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = v6;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    int v23 = 0;
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v12 = [(HKMedicationsDemoSearchAssetInterface *)self queue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __85__HKMedicationsDemoSearchAssetInterface_expandedGenericMedicationSearchResult_error___block_invoke;
    v17[3] = &unk_264BC3570;
    v17[4] = self;
    v17[5] = v22;
    v17[6] = &v18;
    v17[7] = &v24;
    dispatch_sync(v12, v17);

    if (v19[3])
    {
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      id v14 = [NSString alloc];
      id v15 = (void *)[v14 initWithUTF8String:v19[3]];
      objc_msgSend(v13, "hk_assignError:code:description:", a4, 100, v15);

      id v11 = 0;
    }
    else
    {
      id v11 = (id)v25[5];
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

void __85__HKMedicationsDemoSearchAssetInterface_expandedGenericMedicationSearchResult_error___block_invoke(void *a1)
{
  ppStmt = 0;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 8), (const char *)objc_msgSend(@"SELECT ing.ingredient_id, ing.name         FROM generic_medication AS gm         LEFT JOIN generic_medication_ingredient AS gmi ON gm.generic_medication_id=gmi.generic_medication_id         LEFT JOIN ingredient AS ing ON gmi.ingredient_id=ing.ingredient_id         WHERE gm.generic_medication_id=?", "UTF8String"), -1, &ppStmt, 0);
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24)
    || (uint64_t v2 = ppStmt,
        [*(id *)(*(void *)(a1[7] + 8) + 40) genericMedicationId],
        id v3 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v2) = sqlite3_bind_text(v2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), v3, v2))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = sqlite3_errmsg(*(sqlite3 **)(a1[4] + 8));
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v5 = sqlite3_column_int(ppStmt, 0);
      id v6 = sqlite3_column_text(ppStmt, 1);
      uint64_t v7 = [HKIngredientSearchResult alloc];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v5);
      objc_super v9 = [NSString stringWithUTF8String:v6];
      uint64_t v10 = [(HKIngredientSearchResult *)v7 initWithIngredientId:v8 ingredientName:v9 strengthQuantity:0 strengthUnit:0];

      [v4 addObject:v10];
    }
    uint64_t v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) copyByReplacingWithIngredients:v4];
    uint64_t v12 = *(void *)(a1[7] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

@end