@interface HKMedicationsResolver
- (BOOL)getGenericSpecificIdForClinicalId:(uint64_t)a3 genericId:;
- (BOOL)hkt_looksLikeGenericInText:(id)a3;
- (BOOL)hkt_prepareNgramAssetWithError:(id *)a3;
- (BOOL)hkt_setUpDatabase;
- (BOOL)lineHasUsefulInfo;
- (BOOL)resetInMemoryDBWithError:(id *)a3;
- (BOOL)resetResolverWithError:(id *)a3;
- (HKMedicationsMapResult)createNgramMapsWithError:(uint64_t)a1;
- (HKMedicationsMercuryIdGroup)updateIdGroup:(unsigned int)a3 ingredientMatched:(int)a4 tradeNameMatched:(void *)a5 matchingTradeNames:;
- (HKMedicationsNumberToStringMap)ingredientsWithError:(uint64_t)a1;
- (HKMedicationsNumberToStringMap)tradenamesWithError:(uint64_t)a1;
- (HKMedicationsResolver)initWithAssetUrl:(id)a3;
- (id)abbreviate:(id *)a1;
- (id)abbreviationsWithError:(uint64_t)a1;
- (id)createNgramCountsWithError:(uint64_t)a1;
- (id)filterAndAddGenerics:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)hkt_createNgramMapsWithError:(id *)a3;
- (id)hkt_ngramsFrom:(id)a3 minLength:(int64_t)a4 maxLength:(int64_t)a5;
- (id)hkt_ngramsWithError:(id *)a3;
- (id)ngramsFrom:(uint64_t)a3 minLength:(uint64_t)a4 maxLength:;
- (id)resolveText:(id)a3 error:(id *)a4;
- (int64_t)consecutiveLCSUsingTranscript:(id)a3 prediction:(id)a4;
- (int64_t)countOfContinousDigitsInLine:(id)a3;
- (int64_t)hkt_ngramIdCountWithError:(id *)a3;
- (uint64_t)checkLCSCriterion:(void *)a1 transcripts:(void *)a2 strings:(void *)a3 normalizationType:(uint64_t)a4 tolerance:(float)a5;
- (uint64_t)createNgramAssetsWithError:(uint64_t)a1;
- (uint64_t)dropNgramAssetsWithError:(uint64_t)a1;
- (uint64_t)looksLikeGenericInText:(uint64_t)a1;
- (uint64_t)setupDatabaseWithError:(uint64_t)a1;
- (uint64_t)setupNgramTables:(uint64_t)a1;
- (void)checkNgramFrame;
- (void)dealloc;
- (void)fillNgramsForText:(uint64_t)a3 n:;
- (void)processNgramLine:(id)a3 n:(int64_t)a4;
@end

@implementation HKMedicationsResolver

- (HKMedicationsResolver)initWithAssetUrl:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationsResolver;
  v6 = [(HKMedicationsResolver *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetUrl, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F434B8]) initMemoryDatabase];
    db = v7->_db;
    v7->_db = (HDSQLiteDatabase *)v8;

    if ([(HDSQLiteDatabase *)v7->_db openWithError:0])
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x263F098F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
        -[HKMedicationsResolver initWithAssetUrl:](v10);
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  [(HDSQLiteDatabase *)self->_db close];
  v3.receiver = self;
  v3.super_class = (Class)HKMedicationsResolver;
  [(HKMedicationsResolver *)&v3 dealloc];
}

- (uint64_t)setupDatabaseWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  objc_super v3 = *(void **)(a1 + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HKMedicationsResolver_setupDatabaseWithError___block_invoke;
  v9[3] = &unk_264BC35C0;
  v9[4] = a1;
  char v4 = objc_msgSend(v3, "executeSQL:error:bindingHandler:enumerationHandler:", @"ATTACH DATABASE ? AS pbs_assets;",
         a2,
         v9,
         0);
  id v5 = (os_log_t *)MEMORY[0x263F098F8];
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[HKMedicationsResolver setupDatabaseWithError:]();
    }
  }
  uint64_t v6 = [*(id *)(a1 + 8) executeSQLStatements:&unk_26E5DD458 error:0];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[HKMedicationsResolver setupDatabaseWithError:](v7);
    }
  }
  return v6;
}

void __48__HKMedicationsResolver_setupDatabaseWithError___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) path];
  sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (uint64_t)setupNgramTables:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) executeSQLStatements:&unk_26E5DD470 error:a2];
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[HKMedicationsResolver setupNgramTables:]();
    }
  }
  return v2;
}

- (BOOL)resetResolverWithError:(id *)a3
{
  self->_numberOfNewNgrams = 0;
  self->_numberOfUsedNgrams = 0;
  return [(HKMedicationsResolver *)self resetInMemoryDBWithError:a3];
}

- (BOOL)resetInMemoryDBWithError:(id *)a3
{
  char v3 = [(HDSQLiteDatabase *)self->_db executeSQLStatements:&unk_26E5DD488 error:a3];
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[HKMedicationsResolver resetInMemoryDBWithError:]();
    }
  }
  return v3;
}

- (uint64_t)createNgramAssetsWithError:(uint64_t)a1
{
  if (!a1
    || ![*(id *)(a1 + 8) executeSQLStatements:&unk_26E5DD4A0 error:a2]
    || ![*(id *)(a1 + 8) executeSQLStatements:&unk_26E5DD4B8 error:a2])
  {
    return 0;
  }
  char v4 = *(void **)(a1 + 8);
  return [v4 executeSQLStatements:&unk_26E5DD4D0 error:a2];
}

- (uint64_t)dropNgramAssetsWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) executeSQLStatements:&unk_26E5DD4E8 error:a2];
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[HKMedicationsResolver dropNgramAssetsWithError:]();
    }
  }
  return v2;
}

- (HKMedicationsMapResult)createNgramMapsWithError:(uint64_t)a1
{
  if (a1)
  {
    char v4 = objc_alloc_init(HKMedicationsMapResult);
    id v5 = *(void **)(a1 + 8);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke;
    v36[3] = &unk_264BC35E8;
    uint64_t v6 = v4;
    v37 = v6;
    int v7 = [v5 executeSQL:@"SELECT SUM(ngram_weight) FROM ngram_id_list" error:a2 bindingHandler:0 enumerationHandler:v36];
    uint64_t v8 = 0;
    if (!v7)
    {
LABEL_15:

      goto LABEL_16;
    }
    v9 = objc_alloc_init(HKMedicationsNumberToNumberMap);
    v10 = *(void **)(a1 + 8);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_2;
    v34[3] = &unk_264BC35E8;
    v11 = v9;
    v35 = v11;
    if ([v10 executeSQL:@"SELECT hg_id, ngram_count FROM common_map", a2, 0, v34 error bindingHandler enumerationHandler])
    {
      [(HKMedicationsMapResult *)v6 setCommonDict:v11];

      objc_super v12 = objc_alloc_init(HKMedicationsNumberToNumberPairListMap);
      v13 = *(void **)(a1 + 8);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_3;
      v32[3] = &unk_264BC35E8;
      v11 = v12;
      v33 = v11;
      if ([v13 executeSQL:@"SELECT hg_id, specific_id, ngram_count FROM unique_map", a2, 0, v32 error bindingHandler enumerationHandler])
      {
        [(HKMedicationsMapResult *)v6 setUniqueDict:v11];

        v14 = objc_alloc_init(HKMedicationsNumberToNumberMap);
        v15 = *(void **)(a1 + 8);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_4;
        v30[3] = &unk_264BC35E8;
        v11 = v14;
        v31 = v11;
        if ([v15 executeSQL:@"SELECT hg_id, ngram_count FROM pbs_assets.common_ngram_count WHERE hg_id IN (SELECT hg_id FROM common_map)", a2, 0, v30 error bindingHandler enumerationHandler])
        {
          [(HKMedicationsMapResult *)v6 setCommonSetSizeDict:v11];

          v16 = objc_alloc_init(HKMedicationsNumberToNumberMap);
          v17 = *(void **)(a1 + 8);
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_5;
          v28[3] = &unk_264BC35E8;
          v11 = v16;
          v29 = v11;
          if ([v17 executeSQL:@"SELECT specific_id, ngram_count FROM pbs_assets.unique_ngram_count WHERE specific_id IN (SELECT specific_id FROM unique_map)", a2, 0, v28 error bindingHandler enumerationHandler])
          {
            [(HKMedicationsMapResult *)v6 setUniqueSetSizeDict:v11];

            id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            v19 = *(void **)(a1 + 8);
            uint64_t v23 = MEMORY[0x263EF8330];
            uint64_t v24 = 3221225472;
            v25 = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_6;
            v26 = &unk_264BC35E8;
            id v20 = v18;
            id v27 = v20;
            if ([v19 executeSQL:@"SELECT hg_id FROM (SELECT hg_id FROM common_map UNION SELECT hg_id FROM unique_map)" error:a2 bindingHandler:0 enumerationHandler:&v23])
            {
              -[HKMedicationsMapResult setDistinctHgIds:](v6, "setDistinctHgIds:", v20, v23, v24, v25, v26);

              uint64_t v8 = v6;
              goto LABEL_15;
            }

LABEL_14:
            uint64_t v8 = 0;
            goto LABEL_15;
          }
          v21 = v29;
        }
        else
        {
          v21 = v31;
        }
      }
      else
      {
        v21 = v33;
      }
    }
    else
    {
      v21 = v35;
    }

    goto LABEL_14;
  }
  uint64_t v8 = 0;
LABEL_16:
  return v8;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  [*(id *)(a1 + 32) setInteger:HDSQLiteColumnAsInt64() forKey:v2];
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  uint64_t v3 = HDSQLiteColumnAsInt64();
  [*(id *)(a1 + 32) addInteger:HDSQLiteColumnAsInt64() andInteger:v3 forKey:v2];
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  [*(id *)(a1 + 32) setInteger:HDSQLiteColumnAsInt64() forKey:v2];
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  [*(id *)(a1 + 32) setInteger:HDSQLiteColumnAsInt64() forKey:v2];
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  uint64_t v3 = *(void **)(a1 + 32);
  char v4 = [NSNumber numberWithInteger:v2];
  [v3 addObject:v4];

  return 1;
}

- (id)createNgramCountsWithError:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = objc_alloc_init(HKMedicationsNgramCounts);
    char v4 = *(void **)(a1 + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke;
    v9[3] = &unk_264BC3610;
    v9[4] = &v10;
    if ((objc_msgSend(v4, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT COUNT(*) FROM ngram_list;",
            a2,
            0,
            v9) & 1) != 0
      && (id v5 = *(void **)(a1 + 8),
          v8[0] = MEMORY[0x263EF8330],
          v8[1] = 3221225472,
          v8[2] = __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke_2,
          v8[3] = &unk_264BC3610,
          v8[4] = &v10,
          objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT COUNT(*) FROM ngram_id_list;",
                          a2,
                          0,
                          v8)))
    {
      id v6 = (id)v11[5];
    }
    else
    {
      id v6 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

uint64_t __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (BOOL)lineHasUsefulInfo
{
  if (!a1) {
    return 0;
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v1 = *(void **)(a1 + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__HKMedicationsResolver_lineHasUsefulInfo__block_invoke;
  v5[3] = &unk_264BC3638;
  v5[4] = &v19;
  v5[5] = &v15;
  v5[6] = &v11;
  v5[7] = v10;
  v5[8] = &v6;
  objc_msgSend(v1, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT COUNT(*), COUNT(ngram_id), SUM(ngram_weight), SUM(is_unit), SUM(is_number), MAX(ngram_prob) FROM ngram_list_line LEFT JOIN pbs_assets.ngram_map ON ngram_list_line.ngram = pbs_assets.ngram_map.ngram;",
    0,
    0,
    v5);
  BOOL v2 = v7[3] >= 0.6;
  if (!v12[3])
  {
    uint64_t v3 = v20[3];
    if (!v3 || (float)((float)v16[3] / (float)v3) < 0.05) {
      BOOL v2 = 0;
    }
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v2;
}

uint64_t __42__HKMedicationsResolver_lineHasUsefulInfo__block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[8] + 8) + 24) = MEMORY[0x230FCF900](a2, 5);
  return 1;
}

- (void)processNgramLine:(id)a3 n:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [MEMORY[0x263EFFA08] setWithObject:@"compare to"];
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = [v6 lowercaseString];
  uint64_t v10 = [v8 setWithObject:v9];
  char v11 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v10, v7, 2, 0.95);

  if ((v11 & 1) == 0
    && [(HKMedicationsResolver *)self countOfContinousDigitsInLine:v6] <= 5)
  {
    v30 = v7;
    uint64_t v12 = [v6 normalizeForType:2];
    uint64_t v13 = self;
    uint64_t v14 = -[HKMedicationsResolver ngramsFrom:minLength:maxLength:]((uint64_t)self, v12, 3, a4 + 1);

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          db = v13->_db;
          v33[4] = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v34 = 0;
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __44__HKMedicationsResolver_processNgramLine_n___block_invoke;
          v33[3] = &unk_264BC35C0;
          char v21 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](db, "executeSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO ngram_list_line (ngram) VALUES (?);",
                  &v34,
                  v33,
                  0);
          id v22 = v34;
          uint64_t v23 = v22;
          if ((v21 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
              -[HKMedicationsResolver processNgramLine:n:]();
            }

            id v27 = v15;
            goto LABEL_20;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if (-[HKMedicationsResolver lineHasUsefulInfo]((uint64_t)v13))
    {
      uint64_t v24 = v13->_db;
      id v32 = 0;
      char v25 = [(HDSQLiteDatabase *)v24 executeSQLStatements:&unk_26E5DD500 error:&v32];
      id v26 = v32;
      id v27 = v26;
      if ((v25 & 1) == 0)
      {
        _HKInitializeLogging();
        int v7 = v30;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
          -[HKMedicationsResolver processNgramLine:n:]();
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    v28 = v13->_db;
    id v31 = 0;
    char v29 = [(HDSQLiteDatabase *)v28 executeSQLStatements:&unk_26E5DD518 error:&v31];
    id v27 = v31;
    if (v29)
    {
LABEL_20:
      int v7 = v30;
    }
    else
    {
      _HKInitializeLogging();
      int v7 = v30;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
        -[HKMedicationsResolver processNgramLine:n:]();
      }
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (uint64_t)checkLCSCriterion:(void *)a1 transcripts:(void *)a2 strings:(void *)a3 normalizationType:(uint64_t)a4 tolerance:(float)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v9;
    uint64_t v27 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v27)
    {
      uint64_t v12 = *(void *)v34;
      uint64_t v25 = *(void *)v34;
      id v26 = v9;
      id v28 = v10;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "normalizeForType:", a4, v25);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v15 = v10;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = [*(id *)(*((void *)&v29 + 1) + 8 * j) normalizeForType:a4];
                float v21 = (float)[a1 consecutiveLCSUsingTranscript:v14 prediction:v20];
                float v22 = v21 / (float)(unint64_t)[v20 length];

                if (v22 >= a5)
                {

                  uint64_t v23 = 1;
                  id v9 = v26;
                  id v10 = v28;
                  goto LABEL_20;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v10 = v28;
          uint64_t v12 = v25;
        }
        uint64_t v23 = 0;
        id v9 = v26;
        uint64_t v27 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v27);
    }
    else
    {
      uint64_t v23 = 0;
    }
LABEL_20:
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)ngramsFrom:(uint64_t)a3 minLength:(uint64_t)a4 maxLength:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v6 = [a2 componentsSeparatedByString:@"\n"];
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[HKMedicationsNgramGenerator tokensFrom:minimumLength:maximumLength:](HKMedicationsNgramGenerator, "tokensFrom:minimumLength:maximumLength:", *(void *)(*((void *)&v15 + 1) + 8 * i), a3, a4, (void)v15);
          [v7 addObjectsFromArray:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

uint64_t __44__HKMedicationsResolver_processNgramLine_n___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (const char *)[*(id *)(a1 + 32) UTF8String];
  return sqlite3_bind_text(a2, 1, v3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)checkNgramFrame
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to insert or replace into ngram_list: %@", v5, v6, v7, v8, v9);
}

- (void)fillNgramsForText:(uint64_t)a3 n:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v5 = [a2 componentsSeparatedByString:@"\n"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) lowercaseString];
          [a1 processNgramLine:v10 n:a3];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    -[HKMedicationsResolver checkNgramFrame]((uint64_t)a1);
  }
}

- (uint64_t)looksLikeGenericInText:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    [a2 componentsSeparatedByString:@"\n"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
          uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", &unk_26E5DD560, (void)v15);
          uint64_t v10 = (void *)MEMORY[0x263EFFA08];
          long long v11 = [v8 lowercaseString];
          long long v12 = [v10 setWithObject:v11];
          char v13 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:]((void *)v2, v12, v9, 2, 0.9);

          if (v13)
          {
            uint64_t v2 = 1;
            goto LABEL_12;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    uint64_t v2 = 0;
LABEL_12:
  }
  return v2;
}

- (BOOL)getGenericSpecificIdForClinicalId:(uint64_t)a3 genericId:
{
  BOOL v3 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1 && a3)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v5 = *(void **)(a1 + 8);
    v12[4] = a2;
    id v13 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke;
    v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke_2;
    v11[3] = &unk_264BC3680;
    v11[4] = &v14;
    v11[5] = a3;
    char v6 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT specific_id FROM generic_map where clinical_id = ? LIMIT 1;",
           &v13,
           v12,
           v11);
    id v7 = v13;
    if (v6)
    {
      BOOL v3 = *((unsigned char *)v15 + 24) != 0;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v8 = (id)*MEMORY[0x263F098F8];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v10;
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_error_impl(&dword_230F1A000, v8, OS_LOG_TYPE_ERROR, "[%@] failed to find specific id for clinical id (%ld): %@", buf, 0x20u);
      }

      BOOL v3 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

uint64_t __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  **(void **)(a1 + 40) = HDSQLiteColumnAsInt64();
  return 0;
}

- (id)resolveText:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v33 = a3;
  if (!self->_dbReady)
  {
    if ((-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a4) & 1) == 0)
    {
      long long v12 = 0;
      self->_dbReady = 0;
      goto LABEL_14;
    }
    int v13 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a4);
    self->_dbReady = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  if (!-[HKMedicationsResolver dropNgramAssetsWithError:]((uint64_t)self, (uint64_t)a4))
  {
LABEL_10:
    long long v12 = 0;
    goto LABEL_14;
  }
  long long v32 = self;
  char v6 = -[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)self, (uint64_t)a4);
  id v7 = v6;
  if (v6
    && (uint64_t v8 = [v6 seen],
        uint64_t v9 = [v7 used],
        -[HKMedicationsResolver fillNgramsForText:n:](v32, v33, 5),
        -[HKMedicationsResolver createNgramAssetsWithError:]((uint64_t)v32, (uint64_t)a4))
    && (-[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)v32, (uint64_t)a4),
        long long v31 = objc_claimAutoreleasedReturnValue(),
        v7,
        (id v7 = v31) != 0))
  {
    uint64_t v10 = [v31 seen];
    uint64_t v11 = [v31 used];
    if (v11 == v9)
    {
      long long v12 = objc_alloc_init(HKMedicationsResolverResult);
    }
    else
    {
      v32->_numberOfNewNgrams = v10 - v8;
      v32->_numberOfUsedNgrams = v11 - v9;
      long long v15 = -[HKMedicationsResolver createNgramMapsWithError:]((uint64_t)v32, (uint64_t)a4);
      if (v15)
      {
        id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        obuint64_t j = [v15 distinctHgIds];
        uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v16)
        {
          uint64_t v36 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v48 != v36) {
                objc_enumerationMutation(obj);
              }
              long long v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v19 = objc_msgSend(v15, "commonDict", v31);
              uint64_t v20 = objc_msgSend(v19, "integerForKey:", objc_msgSend(v18, "integerValue"));

              uint64_t v21 = [v15 ngramCount];
              __int16 v22 = [v15 commonSetSizeDict];
              uint64_t v23 = objc_msgSend(v22, "integerForKey:", objc_msgSend(v18, "integerValue"));

              uint64_t v24 = v23 + v21;
              uint64_t v43 = 0;
              v44 = &v43;
              uint64_t v45 = 0x2020000000;
              float v46 = (float)v20 / (float)(v23 + v21 - v20);
              id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v26 = [v15 uniqueDict];
              uint64_t v27 = [v18 integerValue];
              v37[0] = MEMORY[0x263EF8330];
              v37[1] = 3221225472;
              v37[2] = __43__HKMedicationsResolver_resolveText_error___block_invoke;
              v37[3] = &unk_264BC36A8;
              uint64_t v41 = v20;
              uint64_t v42 = v24;
              id v38 = v15;
              id v28 = v25;
              id v39 = v28;
              uint64_t v40 = &v43;
              [v26 enumerateIntegersForKey:v27 block:v37];

              [v28 sortUsingComparator:&__block_literal_global];
              if (*((float *)v44 + 6) > 0.03)
              {
                long long v29 = objc_alloc_init(HKMedicationsMercuryIdGroup);
                -[HKMedicationsMercuryIdGroup setPrimaryHgId:](v29, "setPrimaryHgId:", [v18 integerValue]);
                LODWORD(v30) = *((_DWORD *)v44 + 6);
                [(HKMedicationsMercuryIdGroup *)v29 setMaxJaccardSimilarity:v30];
                [(HKMedicationsMercuryIdGroup *)v29 setSubHgIds:v28];
                [(HKMedicationsMercuryIdGroup *)v29 setIngredientMatched:0];
                [v34 addObject:v29];
              }
              _Block_object_dispose(&v43, 8);
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          }
          while (v16);
        }

        [v34 sortUsingComparator:&__block_literal_global_437];
        long long v12 = objc_alloc_init(HKMedicationsResolverResult);
        -[HKMedicationsResolverResult setLooksGeneric:](v12, "setLooksGeneric:", -[HKMedicationsResolver looksLikeGenericInText:]((uint64_t)v32, v33));
        [(HKMedicationsResolverResult *)v12 setResolvedIds:v34];
        [(HKMedicationsResolverResult *)v12 setNumberOfNewNgrams:v32->_numberOfNewNgrams];
        [(HKMedicationsResolverResult *)v12 setNumberOfUsedNgrams:v32->_numberOfUsedNgrams];
      }
      else
      {
        long long v12 = 0;
      }

      id v7 = v31;
    }
  }
  else
  {
    long long v12 = 0;
  }

LABEL_14:
  return v12;
}

void __43__HKMedicationsResolver_resolveText_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56) + a2;
  id v7 = [*(id *)(a1 + 32) uniqueSetSizeDict];
  uint64_t v8 = [v7 integerForKey:a3];

  long long v12 = objc_alloc_init(HKMedicationsMercuryId);
  [(HKMedicationsMercuryId *)v12 setHgId:a3];
  *(float *)&double v9 = (float)v6 / (float)(v5 - v6 + v8);
  [(HKMedicationsMercuryId *)v12 setJaccardSimilarity:v9];
  [(HKMedicationsMercuryId *)v12 setTradeNameMatched:0];
  [*(id *)(a1 + 40) addObject:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  float v11 = *(float *)(v10 + 24);
  if (v11 < (float)((float)v6 / (float)(v5 - v6 + v8))) {
    float v11 = (float)v6 / (float)(v5 - v6 + v8);
  }
  *(float *)(v10 + 24) = v11;
}

uint64_t __43__HKMedicationsResolver_resolveText_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 jaccardSimilarity];
  float v7 = v6;
  [v5 jaccardSimilarity];
  if (v7 >= v8)
  {
    [v4 jaccardSimilarity];
    float v11 = v10;
    [v5 jaccardSimilarity];
    if (v11 <= v12)
    {
      int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "hgId"));
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "hgId"));
      uint64_t v9 = [v13 compare:v14];
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __43__HKMedicationsResolver_resolveText_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 maxJaccardSimilarity];
  float v7 = v6;
  [v5 maxJaccardSimilarity];
  if (v7 >= v8)
  {
    [v4 maxJaccardSimilarity];
    float v11 = v10;
    [v5 maxJaccardSimilarity];
    if (v11 <= v12)
    {
      int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "primaryHgId"));
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "primaryHgId"));
      uint64_t v9 = [v13 compare:v14];
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (id)filterAndAddGenerics:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 error:(id *)a7
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = v12;
  id v81 = v13;
  long long v15 = objc_alloc_init(HKMedicationsResolverResult);
  uint64_t v16 = [v12 resolvedIds];
  unint64_t v17 = [v16 count];

  if (v17 < a6) {
    a6 = v17;
  }
  if (a5 == 0.0)
  {
    long long v18 = [v14 resolvedIds];
    uint64_t v19 = objc_msgSend(v18, "subarrayWithRange:", 0, a6);
    [(HKMedicationsResolverResult *)v15 setResolvedIds:v19];

    uint64_t v20 = [v14 ngramList];
    [(HKMedicationsResolverResult *)v15 setNgramList:v20];

    uint64_t v21 = [v14 usedNgrams];
    [(HKMedicationsResolverResult *)v15 setUsedNgrams:v21];

    __int16 v22 = v15;
    goto LABEL_60;
  }
  v70 = v15;
  if (!self->_dbReady)
  {
    if ((-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a7) & 1) == 0)
    {
      __int16 v22 = 0;
      self->_dbReady = 0;
      goto LABEL_60;
    }
    int v57 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a7);
    self->_dbReady = v57;
    if (!v57) {
      goto LABEL_59;
    }
  }
  if (!self->_ingredients)
  {
    -[HKMedicationsResolver ingredientsWithError:]((uint64_t)self, (uint64_t)a7);
    v58 = (HKMedicationsNumberToStringMap *)objc_claimAutoreleasedReturnValue();
    ingredients = self->_ingredients;
    self->_ingredients = v58;

    if (*a7) {
      goto LABEL_59;
    }
  }
  if (!self->_tradenames)
  {
    -[HKMedicationsResolver tradenamesWithError:]((uint64_t)self, (uint64_t)a7);
    v60 = (HKMedicationsNumberToStringMap *)objc_claimAutoreleasedReturnValue();
    tradenames = self->_tradenames;
    self->_tradenames = v60;

    if (*a7) {
      goto LABEL_59;
    }
  }
  if (self->_abbreviations
    || (-[HKMedicationsResolver abbreviationsWithError:]((uint64_t)self, (uint64_t)a7),
        v64 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
        abbreviations = self->_abbreviations,
        self->_abbreviations = v64,
        abbreviations,
        !*a7))
  {
    int64_t v67 = a6;
    id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v23 = [v14 resolvedIds];
    v69 = v14;
    uint64_t v24 = [v14 resolvedIds];
    unint64_t v25 = [v24 count];

    if (v25 >= 0x32) {
      uint64_t v26 = 50;
    }
    else {
      uint64_t v26 = v25;
    }
    uint64_t v27 = objc_msgSend(v23, "subarrayWithRange:", 0, v26, v67);

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = v27;
    uint64_t v74 = [obj countByEnumeratingWithState:&v92 objects:v98 count:16];
    if (v74)
    {
      uint64_t v73 = *(void *)v93;
      unint64_t v28 = 0x263EFF000uLL;
      do
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v93 != v73) {
            objc_enumerationMutation(obj);
          }
          double v30 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          id v31 = objc_alloc_init(*(Class *)(v28 + 2496));
          v79 = v30;
          long long v32 = -[HKMedicationsNumberToStringMap stringForKey:](self->_ingredients, "stringForKey:", [v30 primaryHgId]);
          id v33 = v32;
          if (!v32) {
            goto LABEL_28;
          }
          id v34 = [v32 componentsSeparatedByString:@","];
          [v31 addObjectsFromArray:v34];
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v35 = v34;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v88 objects:v97 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v89;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v89 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = -[HKMedicationsResolver abbreviate:]((id *)&self->super.isa, *(void **)(*((void *)&v88 + 1) + 8 * j));
                if (v40) {
                  [v31 addObject:v40];
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v88 objects:v97 count:16];
            }
            while (v37);
          }

          uint64_t v41 = [v31 count];
          if (v41)
          {
LABEL_28:
            v76 = v33;
            id v77 = v31;
            uint64_t v78 = i;
            unsigned int v75 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v81, v31, 2, a5);
            id v80 = objc_alloc_init(*(Class *)(v28 + 2496));
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            uint64_t v42 = [v79 subHgIds];
            uint64_t v43 = [v42 countByEnumeratingWithState:&v84 objects:v96 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              int v45 = 0;
              uint64_t v46 = *(void *)v85;
              do
              {
                for (uint64_t k = 0; k != v44; ++k)
                {
                  if (*(void *)v85 != v46) {
                    objc_enumerationMutation(v42);
                  }
                  uint64_t v48 = [*(id *)(*((void *)&v84 + 1) + 8 * k) hgId];
                  long long v49 = [(HKMedicationsNumberToStringMap *)self->_tradenames stringForKey:v48];
                  if (v49
                    && ([MEMORY[0x263EFFA08] setWithObject:v49],
                        long long v50 = objc_claimAutoreleasedReturnValue(),
                        int v51 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v81, v50, 2, a5), v50, v51))
                  {
                    uint64_t v52 = [NSNumber numberWithInteger:v48];
                    [v80 addObject:v52];

                    int v53 = 1;
                  }
                  else
                  {
                    int v53 = 0;
                  }
                  v45 |= v53;
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v84 objects:v96 count:16];
              }
              while (v44);
            }
            else
            {
              int v45 = 0;
            }

            id v33 = v76;
            if ((v75 | v45))
            {
              v54 = -[HKMedicationsResolver updateIdGroup:ingredientMatched:tradeNameMatched:matchingTradeNames:]((uint64_t)self, v79, v75, v45 & 1, v80);
              [v71 addObject:v54];
            }
            unint64_t v28 = 0x263EFF000;
            id v31 = v77;
            uint64_t i = v78;
          }
        }
        uint64_t v74 = [obj countByEnumeratingWithState:&v92 objects:v98 count:16];
      }
      while (v74);
    }

    [v71 sortUsingComparator:&__block_literal_global_442];
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke_2;
    v82[3] = &unk_264BC3710;
    v82[4] = self;
    uint64_t v14 = v69;
    id v55 = v69;
    id v83 = v55;
    [v71 enumerateObjectsUsingBlock:v82];
    if ([v71 count] <= v68)
    {
      long long v15 = v70;
      [(HKMedicationsResolverResult *)v70 setResolvedIds:v71];
    }
    else
    {
      v56 = objc_msgSend(v71, "subarrayWithRange:", 0, v68 - 1);
      long long v15 = v70;
      [(HKMedicationsResolverResult *)v70 setResolvedIds:v56];
    }
    v62 = [v55 ngramList];
    [(HKMedicationsResolverResult *)v15 setNgramList:v62];

    v63 = [v55 usedNgrams];
    [(HKMedicationsResolverResult *)v15 setUsedNgrams:v63];

    __int16 v22 = v15;
  }
  else
  {
LABEL_59:
    __int16 v22 = 0;
  }
LABEL_60:

  return v22;
}

- (HKMedicationsNumberToStringMap)ingredientsWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(HKMedicationsNumberToStringMap);
    id v5 = *(void **)(a1 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__HKMedicationsResolver_ingredientsWithError___block_invoke;
    v10[3] = &unk_264BC35E8;
    float v6 = v4;
    float v11 = v6;
    int v7 = [v5 executeSQL:@"SELECT hg_id, ingredient FROM ingredients", a2, 0, v10 error bindingHandler enumerationHandler];
    float v8 = 0;
    if (v7) {
      float v8 = v6;
    }
  }
  else
  {
    float v8 = 0;
  }
  return v8;
}

- (HKMedicationsNumberToStringMap)tradenamesWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(HKMedicationsNumberToStringMap);
    id v5 = *(void **)(a1 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__HKMedicationsResolver_tradenamesWithError___block_invoke;
    v10[3] = &unk_264BC35E8;
    float v6 = v4;
    float v11 = v6;
    int v7 = [v5 executeSQL:@"SELECT specific_id, trade_name FROM trade_names", a2, 0, v10 error bindingHandler enumerationHandler];
    float v8 = 0;
    if (v7) {
      float v8 = v6;
    }
  }
  else
  {
    float v8 = 0;
  }
  return v8;
}

- (id)abbreviationsWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = *(void **)(a1 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__HKMedicationsResolver_abbreviationsWithError___block_invoke;
    v10[3] = &unk_264BC35E8;
    id v6 = v4;
    id v11 = v6;
    int v7 = [v5 executeSQL:@"SELECT word, abbreviation FROM abbreviations", a2, 0, v10 error bindingHandler enumerationHandler];
    id v8 = 0;
    if (v7) {
      id v8 = v6;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)abbreviate:(id *)a1
{
  uint64_t v2 = a1;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a1)
  {
    BOOL v3 = [a2 lowercaseString];
    id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];

    id v6 = [v5 stringByReplacingOccurrencesOfString:@"," withString:@" "];

    int v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    double v30 = v6;
    id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v16 = [v2[8] objectForKeyedSubscript:v15];
          unint64_t v17 = (void *)v16;
          if (v16)
          {
            uint64_t v40 = v15;
            uint64_t v41 = v16;
            long long v18 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            [v9 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v9;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            unint64_t v25 = [v24 allKeys];
            uint64_t v26 = [v25 firstObject];

            uint64_t v27 = [v24 objectForKeyedSubscript:v26];
            id v28 = (id)[v3 stringByReplacingOccurrencesOfString:v26 withString:v27];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v21);
      }

      uint64_t v2 = v3;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (HKMedicationsMercuryIdGroup)updateIdGroup:(unsigned int)a3 ingredientMatched:(int)a4 tradeNameMatched:(void *)a5 matchingTradeNames:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a5;
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = [v7 subHgIds];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v16 = [v15 hgId];
          [v15 jaccardSimilarity];
          float v18 = v17;
          id v19 = [NSNumber numberWithInteger:v16];
          int v20 = [v8 containsObject:v19];

          if (v20)
          {
            float v21 = v18 + 1.0;
            if (!a3) {
              float v21 = v18;
            }
            float v22 = v21 + 1.0;
            uint64_t v23 = objc_alloc_init(HKMedicationsMercuryId);
            [(HKMedicationsMercuryId *)v23 setHgId:v16];
            *(float *)&double v24 = v22;
            [(HKMedicationsMercuryId *)v23 setJaccardSimilarity:v24];
            [(HKMedicationsMercuryId *)v23 setTradeNameMatched:1];
            [v9 addObject:v23];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }

    [v9 sortUsingComparator:&__block_literal_global_445];
    [v7 maxJaccardSimilarity];
    if (a3) {
      float v25 = v25 + 1.0;
    }
    if (a4) {
      float v26 = v25 + 1.0;
    }
    else {
      float v26 = v25;
    }
    uint64_t v27 = objc_alloc_init(HKMedicationsMercuryIdGroup);
    -[HKMedicationsMercuryIdGroup setPrimaryHgId:](v27, "setPrimaryHgId:", [v7 primaryHgId]);
    *(float *)&double v28 = v26;
    [(HKMedicationsMercuryIdGroup *)v27 setMaxJaccardSimilarity:v28];
    [(HKMedicationsMercuryIdGroup *)v27 setIngredientMatched:a3];
    [(HKMedicationsMercuryIdGroup *)v27 setSubHgIds:v9];
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

uint64_t __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 maxJaccardSimilarity];
  float v7 = v6;
  [v5 maxJaccardSimilarity];
  if (v7 >= v8)
  {
    [v4 maxJaccardSimilarity];
    float v11 = v10;
    [v5 maxJaccardSimilarity];
    if (v11 <= v12)
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "primaryHgId"));
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "primaryHgId"));
      uint64_t v9 = [v13 compare:v14];
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  if (-[HKMedicationsResolver getGenericSpecificIdForClinicalId:genericId:](*(void *)(a1 + 32), [v3 primaryHgId], (uint64_t)&v9))
  {
    id v4 = objc_alloc_init(HKMedicationsMercuryId);
    [(HKMedicationsMercuryId *)v4 setHgId:v9];
    [v3 maxJaccardSimilarity];
    *(float *)&double v6 = v5 + 1.0;
    [(HKMedicationsMercuryId *)v4 setJaccardSimilarity:v6];
    [(HKMedicationsMercuryId *)v4 setTradeNameMatched:1];
    float v7 = [v3 subHgIds];
    id v8 = (id)[v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    if ([*(id *)(a1 + 40) looksGeneric]) {
      [v8 insertObject:v4 atIndex:0];
    }
    else {
      [v8 addObject:v4];
    }
    [v3 setSubHgIds:v8];
    [(HKMedicationsMercuryId *)v4 jaccardSimilarity];
    objc_msgSend(v3, "setMaxJaccardSimilarity:");
  }
}

uint64_t __93__HKMedicationsResolver_updateIdGroup_ingredientMatched_tradeNameMatched_matchingTradeNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 jaccardSimilarity];
  float v7 = v6;
  [v5 jaccardSimilarity];
  if (v7 >= v8)
  {
    [v4 jaccardSimilarity];
    float v11 = v10;
    [v5 jaccardSimilarity];
    if (v11 <= v12)
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "hgId"));
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "hgId"));
      uint64_t v9 = [v13 compare:v14];
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __48__HKMedicationsResolver_abbreviationsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = MEMORY[0x230FCF920](a2, 0);
  id v5 = MEMORY[0x230FCF920](a2, 1);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];

  return 1;
}

uint64_t __46__HKMedicationsResolver_ingredientsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  id v5 = MEMORY[0x230FCF920](a2, 1);
  [*(id *)(a1 + 32) setString:v5 forKey:v4];

  return 1;
}

uint64_t __45__HKMedicationsResolver_tradenamesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  id v5 = MEMORY[0x230FCF920](a2, 1);
  [*(id *)(a1 + 32) setString:v5 forKey:v4];

  return 1;
}

- (int64_t)consecutiveLCSUsingTranscript:(id)a3 prediction:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  uint64_t v8 = [v6 length];
  uint64_t v19 = (uint64_t)&v19;
  size_t v9 = 8 * (v7 + 1 + (v7 + 1) * v8);
  float v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  uint64_t v21 = v7;
  if (v7 < 1)
  {
    int64_t v11 = 0;
  }
  else
  {
    int64_t v11 = 0;
    uint64_t v12 = (uint64_t)&v10[8 * v8 + 16];
    uint64_t v20 = 8 * v8 + 8;
    uint64_t v13 = 1;
    do
    {
      if (v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          int v15 = [v5 characterAtIndex:v13 - 1];
          if (v15 == [v6 characterAtIndex:i])
          {
            int64_t v16 = *(void *)&v10[8 * i];
            *(void *)(v12 + 8 * i) = v16 + 1;
            if (v16 >= v11) {
              int64_t v11 = v16 + 1;
            }
          }
          else
          {
            *(void *)(v12 + 8 * i) = 0;
          }
        }
      }
      v12 += v20;
      v10 += v20;
    }
    while (v13++ != v21);
  }

  return v11;
}

- (int64_t)countOfContinousDigitsInLine:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    int64_t v4 = 0;
    int64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unsigned int v7 = [v3 characterAtIndex:v6] - 48;
      if (v4 <= v5) {
        int64_t v8 = v5;
      }
      else {
        int64_t v8 = v4;
      }
      if (v7 < 0xA) {
        ++v5;
      }
      else {
        int64_t v5 = 0;
      }
      if (v7 >= 0xA) {
        int64_t v4 = v8;
      }
      ++v6;
    }
    while (v6 < [v3 length]);
  }
  else
  {
    int64_t v5 = 0;
    int64_t v4 = 0;
  }
  if (v4 <= v5) {
    int64_t v9 = v5;
  }
  else {
    int64_t v9 = v4;
  }

  return v9;
}

- (id)hkt_ngramsFrom:(id)a3 minLength:(int64_t)a4 maxLength:(int64_t)a5
{
  return -[HKMedicationsResolver ngramsFrom:minLength:maxLength:]((uint64_t)self, a3, a4, a5);
}

- (BOOL)hkt_prepareNgramAssetWithError:(id *)a3
{
  if (!-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a3)
    || !-[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a3))
  {
    return 0;
  }
  return -[HKMedicationsResolver createNgramAssetsWithError:]((uint64_t)self, (uint64_t)a3);
}

- (id)hkt_createNgramMapsWithError:(id *)a3
{
  return -[HKMedicationsResolver createNgramMapsWithError:]((uint64_t)self, (uint64_t)a3);
}

- (int64_t)hkt_ngramIdCountWithError:(id *)a3
{
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HKMedicationsResolver_hkt_ngramIdCountWithError___block_invoke;
  v6[3] = &unk_264BC3610;
  v6[4] = &v7;
  if ([(HDSQLiteDatabase *)db executeSQL:@"SELECT COUNT(*) FROM ngram_id_list" error:a3 bindingHandler:0 enumerationHandler:v6])int64_t v4 = v8[3]; {
  else
  }
    int64_t v4 = -1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__HKMedicationsResolver_hkt_ngramIdCountWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (id)hkt_ngramsWithError:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  db = self->_db;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HKMedicationsResolver_hkt_ngramsWithError___block_invoke;
  v8[3] = &unk_264BC3610;
  v8[4] = &v9;
  if ([(HDSQLiteDatabase *)db executeSQL:@"SELECT * from ngram_list" error:a3 bindingHandler:0 enumerationHandler:v8])id v6 = (id)v10[5]; {
  else
  }
    id v6 = 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __45__HKMedicationsResolver_hkt_ngramsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = MEMORY[0x230FCF920](a2, 0);
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return 1;
}

- (BOOL)hkt_looksLikeGenericInText:(id)a3
{
  return -[HKMedicationsResolver looksLikeGenericInText:]((uint64_t)self, a3);
}

- (BOOL)hkt_setUpDatabase
{
  id v15 = 0;
  int v3 = -[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)&v15);
  id v4 = v15;
  id v5 = v4;
  if (v3)
  {
    id v14 = v4;
    int v6 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)&v14);
    id v7 = v14;

    if (!v6)
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    id v13 = v7;
    int v8 = -[HKMedicationsResolver dropNgramAssetsWithError:]((uint64_t)self, (uint64_t)&v13);
    id v5 = v13;

    if (v8)
    {
      id v12 = v5;
      id v9 = -[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)self, (uint64_t)&v12);
      id v7 = v12;

      BOOL v10 = 1;
LABEL_7:
      id v5 = v7;
      goto LABEL_8;
    }
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviations, 0);
  objc_storeStrong((id *)&self->_tradenames, 0);
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)initWithAssetUrl:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_5(&dword_230F1A000, v2, v3, "[%@] failed to open in-memory db", v4, v5, v6, v7, 2u);
}

- (void)setupDatabaseWithError:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_5(&dword_230F1A000, v2, v3, "[%@] failed to create ngram_list", v4, v5, v6, v7, 2u);
}

- (void)setupDatabaseWithError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to attach asset db: %@", v5, v6, v7, v8, v9);
}

- (void)setupNgramTables:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to create ngram tables: %@", v5, v6, v7, v8, v9);
}

- (void)resetInMemoryDBWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to reset assets: %@", v5, v6, v7, v8, v9);
}

- (void)dropNgramAssetsWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to drop assets: %@", v5, v6, v7, v8, v9);
}

- (void)processNgramLine:n:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to delete from ngram_list_line: %@", v5, v6, v7, v8, v9);
}

- (void)processNgramLine:n:.cold.2()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to insert into ngram_list_frame: %@", v5, v6, v7, v8, v9);
}

- (void)processNgramLine:n:.cold.3()
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230F1A000, v3, v4, "[%@] failed to insert into ngram_list_line: %@", v5, v6, v7, v8, v9);
}

@end