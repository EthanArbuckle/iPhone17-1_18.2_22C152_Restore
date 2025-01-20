@interface HDSeriesBuilderEntity
+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (Class)seriesEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)createPersistentEntityForBuilderIdentifier:(id)a3 seriesType:(id)a4 state:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (id)databaseTable;
+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)persistentEntityForBuilderIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)insertMetadata:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setBuilderState:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
- (id)metadataWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)stateWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDSeriesBuilderEntity

+ (Class)seriesEntityClass
{
  return 0;
}

+ (id)persistentEntityForBuilderIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  v10 = [v8 predicateWithProperty:@"uuid" equalToValue:a3];
  v11 = [v9 database];

  v12 = [a1 anyWithPredicate:v10 healthDatabase:v11 error:a5];

  return v12;
}

+ (id)createPersistentEntityForBuilderIdentifier:(id)a3 seriesType:(id)a4 state:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v26[0] = @"uuid";
  v26[1] = @"state";
  v26[2] = @"series_type";
  v14 = (void *)MEMORY[0x1E4F1C978];
  id v15 = a6;
  v16 = [v14 arrayWithObjects:v26 count:3];
  v17 = [v15 database];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__HDSeriesBuilderEntity_createPersistentEntityForBuilderIdentifier_seriesType_state_profile_error___block_invoke;
  v22[3] = &unk_1E62F3388;
  id v24 = v13;
  int64_t v25 = a5;
  id v23 = v12;
  id v18 = v13;
  id v19 = v12;
  v20 = [a1 insertOrReplaceEntity:0 healthDatabase:v17 properties:v16 error:a7 bindingHandler:v22];

  return v20;
}

void __99__HDSeriesBuilderEntity_createPersistentEntityForBuilderIdentifier_seriesType_state_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"state", *(void *)(a1 + 48));
  [*(id *)(a1 + 40) code];

  JUMPOUT(0x1C1879E80);
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__99;
  v31 = __Block_byref_object_dispose__99;
  id v32 = 0;
  id v13 = [v12 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__HDSeriesBuilderEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke;
  v21[3] = &unk_1E62FD8C8;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  int64_t v25 = &v27;
  id v26 = a1;
  char v17 = [a1 performReadTransactionWithHealthDatabase:v13 error:a6 block:v21];

  if ((v17 & 1) != 0
    && ([(id)v28[5] performOrJournalWithProfile:v15 error:a6] & 1) != 0
    && [a1 discardBuilderWithIdentifier:v14 profile:v15 error:a6])
  {
    id v18 = (void *)v28[5];
    if (v18) {
      id v18 = (void *)v18[5];
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  _Block_object_dispose(&v27, 8);

  return v19;
}

BOOL __75__HDSeriesBuilderEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  v6 = +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = [v6 metadataWithTransaction:v5 error:a3];
    id v9 = (void *)v8;
    uint64_t v10 = *a3;
    BOOL v11 = *a3 == 0;
    if (!v10)
    {
      if (v8) {
        [v7 addEntriesFromDictionary:v8];
      }
      if (*(void *)(a1 + 48)) {
        objc_msgSend(v7, "addEntriesFromDictionary:");
      }
      id v12 = [HDFreezeSeriesOperation alloc];
      id v13 = *(void **)(a1 + 32);
      id v14 = (void *)[*(id *)(a1 + 64) seriesEntityClass];
      id v15 = v13;
      id v16 = v7;
      if (v12)
      {
        v24.receiver = v12;
        v24.super_class = (Class)HDFreezeSeriesOperation;
        id v12 = (HDFreezeSeriesOperation *)objc_msgSendSuper2(&v24, sel_init);
        if (v12)
        {
          uint64_t v17 = [v15 copy];
          identifier = v12->_identifier;
          v12->_identifier = (NSUUID *)v17;

          uint64_t v19 = [v16 copy];
          metadata = v12->_metadata;
          v12->_metadata = (NSDictionary *)v19;

          objc_storeStrong((id *)&v12->_entityClass, v14);
        }
      }

      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v12;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)discardBuilderWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  uint64_t v10 = [v8 predicateWithProperty:@"uuid" equalToValue:a3];
  BOOL v11 = [v9 database];

  LOBYTE(a5) = [a1 deleteEntitiesWithPredicate:v10 healthDatabase:v11 error:a5];
  return (char)a5;
}

- (int64_t)stateWithTransaction:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16[0] = @"state";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v8 = objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HDSeriesBuilderEntity_stateWithTransaction_error___block_invoke;
  v11[3] = &unk_1E62F8848;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v11];

  int64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __52__HDSeriesBuilderEntity_stateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result = HDSQLiteColumnWithNameAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)setBuilderState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = @"state";
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  uint64_t v10 = [v8 arrayWithObjects:v14 count:1];
  BOOL v11 = objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HDSeriesBuilderEntity_setBuilderState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v13];

  return (char)a5;
}

void __59__HDSeriesBuilderEntity_setBuilderState_transaction_error___block_invoke()
{
}

- (id)metadataWithTransaction:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__99;
  id v16 = __Block_byref_object_dispose__99;
  id v17 = 0;
  v18[0] = @"metadata";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v8 = objc_msgSend(v6, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HDSeriesBuilderEntity_metadataWithTransaction_error___block_invoke;
  v11[3] = &unk_1E62F8848;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __55__HDSeriesBuilderEntity_metadataWithTransaction_error___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsData();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = +[HDCodableMetadataDictionary decodeMetadataFromData:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)insertMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HDSeriesBuilderEntity *)self metadataWithTransaction:v9 error:a5];
  BOOL v11 = v10;
  if (*a5)
  {
    BOOL v12 = 0;
  }
  else
  {
    id v13 = (void *)[v10 mutableCopy];
    uint64_t v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v16 = v15;

    [v16 addEntriesFromDictionary:v8];
    id v17 = (id)[v16 copy];
    if (self)
    {
      v25[0] = @"metadata";
      id v18 = (void *)MEMORY[0x1E4F1C978];
      id v19 = v9;
      v20 = [v18 arrayWithObjects:v25 count:1];
      uint64_t v21 = [v19 databaseForEntity:self];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__HDSeriesBuilderEntity__setMetadata_transaction_error___block_invoke;
      v23[3] = &unk_1E62F35C8;
      id v24 = v17;
      BOOL v12 = [(HDSQLiteEntity *)self updateProperties:v20 database:v21 error:a5 bindingHandler:v23];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

void __56__HDSeriesBuilderEntity__setMetadata_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (![*(id *)(a1 + 32) count])
  {
    JUMPOUT(0x1C1879E90);
  }
  objc_msgSend(*(id *)(a1 + 32), "hk_codableMetadata");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v5 data];
  MEMORY[0x1C1879E30](a2, @"metadata", v4);
}

+ (id)databaseTable
{
  return @"series_builders";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_53;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end