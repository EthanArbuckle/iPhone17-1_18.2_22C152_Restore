@interface HDSharedSummaryTransactionMetadataEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertWithTransactionID:(int64_t)a3 metadata:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (id)metadataForTransactionID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDSharedSummaryTransactionMetadataEntity

+ (id)databaseTable
{
  return @"shared_summary_transaction_metadata";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryTransactionMetadataEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"transaction_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"transaction_id";
  v4[1] = @"key";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithTransactionID:(int64_t)a3 metadata:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__111;
  v30 = __Block_byref_object_dispose__111;
  id v31 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103__HDSharedSummaryTransactionMetadataEntity_insertWithTransactionID_metadata_databaseTransaction_error___block_invoke;
  v20[3] = &unk_1E6302840;
  id v24 = a1;
  int64_t v25 = a3;
  id v13 = v11;
  id v21 = v13;
  v23 = &v26;
  id v14 = v12;
  id v22 = v14;
  [v10 enumerateKeysAndObjectsUsingBlock:v20];
  id v15 = (id)v27[5];
  v16 = v15;
  if (v15)
  {
    if (a6) {
      *a6 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v27[5]) {
    v17 = 0;
  }
  else {
    v17 = v14;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

void __103__HDSharedSummaryTransactionMetadataEntity_insertWithTransactionID_metadata_databaseTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v44[7] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  id obj = v9;
  id v10 = a2;
  id v11 = a3;
  id v12 = v6;
  id v13 = self;
  objc_opt_class();
  id v33 = v11;
  v34 = v8;
  v32 = v10;
  if (objc_opt_isKindOfClass())
  {
    id v14 = v11;
    id v15 = 0;
    id v16 = 0;
    id v17 = 0;
    uint64_t v18 = 0;
LABEL_11:
    v23 = [v12 databaseForEntityClass:v13];
    v44[0] = @"transaction_id";
    v44[1] = @"key";
    v44[2] = @"value_type";
    v44[3] = @"string_value";
    v44[4] = @"numerical_value";
    v44[5] = @"date_value";
    v44[6] = @"data_value";
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:7];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __105__HDSharedSummaryTransactionMetadataEntity__insertWithTransactionID_key_value_databaseTransaction_error___block_invoke;
    v36[3] = &unk_1E6302868;
    uint64_t v42 = v5;
    id v37 = v32;
    id v38 = v14;
    id v39 = v15;
    id v40 = v16;
    uint64_t v43 = v18;
    id v41 = v17;
    id v25 = v17;
    id v26 = v16;
    id v27 = v15;
    id v28 = v14;
    v29 = [v13 insertOrReplaceEntity:0 database:v23 properties:v24 error:&obj bindingHandler:v36];

    id v10 = v32;
    id v11 = v33;
    v8 = v34;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v11;
    id v16 = 0;
    id v17 = 0;
    id v14 = 0;
    uint64_t v18 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v11;
    id v15 = 0;
    id v17 = 0;
    id v14 = 0;
    uint64_t v18 = 2;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = NSNumber;
    id v20 = v11;
    id v21 = [v20 _unit];
    [v20 doubleValueForUnit:v21];
    objc_msgSend(v19, "numberWithDouble:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = [v20 _unit];

    id v14 = [v22 unitString];

    id v16 = 0;
    id v17 = 0;
    uint64_t v18 = 3;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v11;
    id v15 = 0;
    id v16 = 0;
    id v14 = 0;
    uint64_t v18 = 4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &obj, 3, @"Received invalid metadata value type %@ (%@)", v11, objc_opt_class());
  v29 = 0;
LABEL_12:

  objc_storeStrong(v8, obj);
  if (v29) {
    [*(id *)(a1 + 40) addObject:v29];
  }
  else {
    *a4 = 1;
  }
}

+ (id)metadataForTransactionID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = [NSNumber numberWithLongLong:a3];
  id v13 = [v11 predicateWithProperty:@"transaction_id" equalToValue:v12];

  id v14 = [v9 databaseForEntityClass:a1];

  id v15 = [a1 queryWithDatabase:v14 predicate:v13];

  v23[0] = @"key";
  v23[1] = @"value_type";
  v23[2] = @"string_value";
  v23[3] = @"numerical_value";
  v23[4] = @"date_value";
  v23[5] = @"data_value";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__HDSharedSummaryTransactionMetadataEntity_metadataForTransactionID_databaseTransaction_error___block_invoke;
  v21[3] = &unk_1E62FE2E0;
  id v22 = v10;
  id v17 = v10;
  if ([v15 enumerateProperties:v16 error:a5 enumerationHandler:v21]) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  return v19;
}

uint64_t __95__HDSharedSummaryTransactionMetadataEntity_metadataForTransactionID_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6 = HDSQLiteColumnWithNameAsString();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  switch(v7)
  {
    case 0:
      uint64_t v8 = HDSQLiteColumnWithNameAsString();
      goto LABEL_8;
    case 1:
      uint64_t v8 = HDSQLiteColumnWithNameAsNumber();
      goto LABEL_8;
    case 2:
      uint64_t v8 = HDSQLiteColumnWithNameAsDate();
      goto LABEL_8;
    case 3:
      HDSQLiteColumnWithNameAsDouble();
      double v10 = v9;
      id v11 = HDSQLiteColumnWithNameAsString();
      id v12 = (void *)MEMORY[0x1E4F2B370];
      id v13 = [MEMORY[0x1E4F2B618] unitFromString:v11];
      id v14 = [v12 quantityWithUnit:v13 doubleValue:v10];

      if (!v14) {
        goto LABEL_6;
      }
      goto LABEL_9;
    case 4:
      uint64_t v8 = HDSQLiteColumnWithNameAsData();
LABEL_8:
      id v14 = (void *)v8;
      if (!v8) {
        goto LABEL_6;
      }
LABEL_9:
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v6];
      uint64_t v16 = 1;
      break;
    default:
LABEL_6:
      id v15 = (void *)MEMORY[0x1E4F28C58];
      id v14 = [NSNumber numberWithInteger:v7];
      objc_msgSend(v15, "hk_assignError:code:format:", a4, 3, @"Read invalid metadata type %@ ", v14);
      uint64_t v16 = 0;
      break;
  }

  return v16;
}

void __105__HDSharedSummaryTransactionMetadataEntity__insertWithTransactionID_key_value_databaseTransaction_error___block_invoke(void *a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"transaction_id", a1[9]);
  MEMORY[0x1C1879EC0](a2, @"key", a1[4]);
  MEMORY[0x1C1879E80](a2, @"value_type", a1[10]);
  MEMORY[0x1C1879EC0](a2, @"string_value", a1[5]);
  MEMORY[0x1C1879EA0](a2, @"numerical_value", a1[6]);
  MEMORY[0x1C1879E40](a2, @"date_value", a1[7]);

  JUMPOUT(0x1C1879E30);
}

@end