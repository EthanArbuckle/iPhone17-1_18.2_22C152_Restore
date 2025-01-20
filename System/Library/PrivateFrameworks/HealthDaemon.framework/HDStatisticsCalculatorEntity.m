@interface HDStatisticsCalculatorEntity
+ (BOOL)enumerateStatisticsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)setCalculator:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)setStatistics:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (Class)ownerEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)calculatorForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)ownerEntityReferenceColumn;
+ (id)statisticsForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDStatisticsCalculatorEntity

+ (id)statisticsForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__121;
  v34 = __Block_byref_object_dispose__121;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__121;
  v28 = __Block_byref_object_dispose__121;
  id v29 = 0;
  v36[0] = @"anchor";
  v36[1] = @"statistics";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v16 = _HDPredicateForOwnerAndType(v12, v13);
  v17 = [v14 databaseForEntityClass:a1];
  v18 = [a1 queryWithDatabase:v17 predicate:v16];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__HDStatisticsCalculatorEntity_statisticsForOwner_type_anchor_transaction_error___block_invoke;
  v23[3] = &unk_1E6303C50;
  v23[4] = &v24;
  v23[5] = &v30;
  int v19 = [v18 enumerateProperties:v15 error:a7 enumerationHandler:v23];
  if (a5) {
    *a5 = (id) v25[5];
  }
  if (v19) {
    v20 = (void *)v31[5];
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

uint64_t __81__HDStatisticsCalculatorEntity_statisticsForOwner_type_anchor_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_opt_class();
  uint64_t v5 = HDSQLiteColumnWithNameAsObject();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

+ (id)calculatorForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__121;
  v34 = __Block_byref_object_dispose__121;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__121;
  v28 = __Block_byref_object_dispose__121;
  id v29 = 0;
  v36[0] = @"anchor";
  v36[1] = @"calculator";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v16 = _HDPredicateForOwnerAndType(v12, v13);
  v17 = [v14 databaseForEntityClass:a1];
  v18 = [a1 queryWithDatabase:v17 predicate:v16];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__HDStatisticsCalculatorEntity_calculatorForOwner_type_anchor_transaction_error___block_invoke;
  v23[3] = &unk_1E6303C50;
  v23[4] = &v30;
  v23[5] = &v24;
  int v19 = [v18 enumerateProperties:v15 error:a7 enumerationHandler:v23];
  if (a5) {
    *a5 = (id) v31[5];
  }
  if (v19) {
    v20 = (void *)v25[5];
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

BOOL __81__HDStatisticsCalculatorEntity_calculatorForOwner_type_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = HDSQLiteColumnWithNameAsData();
  BOOL v13 = 1;
  if (v9)
  {
    uint64_t v10 = +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:v9 error:a4];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)setStatistics:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v28[0] = @"owner_id";
  v28[1] = @"quantity_type";
  v28[2] = @"anchor";
  v28[3] = @"statistics";
  v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a6;
  v17 = [v15 arrayWithObjects:v28 count:4];
  v18 = [v16 databaseForEntityClass:a1];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__HDStatisticsCalculatorEntity_setStatistics_forOwner_anchor_transaction_error___block_invoke;
  v24[3] = &unk_1E6303C78;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v22 = [a1 insertOrReplaceEntity:1 database:v18 properties:v17 error:a7 bindingHandler:v24];

  return v22 != 0;
}

void __80__HDStatisticsCalculatorEntity_setStatistics_forOwner_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) quantityType];
  MEMORY[0x1C1879E80](a2, @"owner_id", [*(id *)(a1 + 40) persistentID]);
  MEMORY[0x1C1879E80](a2, @"quantity_type", [v4 code]);
  MEMORY[0x1C1879EA0](a2, @"anchor", *(void *)(a1 + 48));
  HDSQLiteBindSecureCodingObjectToProperty();
}

+ (BOOL)setCalculator:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [v12 archivedRepresentationWithError:a7];
  if (v16)
  {
    v27[0] = @"owner_id";
    v27[1] = @"quantity_type";
    v27[2] = @"anchor";
    v27[3] = @"calculator";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    v18 = [v15 databaseForEntityClass:a1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__HDStatisticsCalculatorEntity_setCalculator_forOwner_anchor_transaction_error___block_invoke;
    v22[3] = &unk_1E6303CA0;
    id v23 = v12;
    id v24 = v13;
    id v25 = v14;
    id v26 = v16;
    id v19 = [a1 insertOrReplaceEntity:1 database:v18 properties:v17 error:a7 bindingHandler:v22];

    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

void __80__HDStatisticsCalculatorEntity_setCalculator_forOwner_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) quantityType];
  MEMORY[0x1C1879E80](a2, @"owner_id", [*(id *)(a1 + 40) persistentID]);
  MEMORY[0x1C1879E80](a2, @"quantity_type", [v4 code]);
  MEMORY[0x1C1879EA0](a2, @"anchor", *(void *)(a1 + 48));
  MEMORY[0x1C1879E30](a2, @"calculator", *(void *)(a1 + 56));
}

+ (BOOL)enumerateStatisticsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v26[0] = @"quantity_type";
  v26[1] = @"anchor";
  v26[2] = @"statistics";
  v26[3] = @"calculator";
  uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 arrayWithObjects:v26 count:4];
  id v15 = (void *)MEMORY[0x1E4F65D00];
  id v16 = NSNumber;
  uint64_t v17 = [v13 persistentID];

  v18 = [v16 numberWithLongLong:v17];
  id v19 = [v15 predicateWithProperty:@"owner_id" equalToValue:v18];

  BOOL v20 = [v12 databaseForEntityClass:a1];

  id v21 = [a1 queryWithDatabase:v20 predicate:v19];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__HDStatisticsCalculatorEntity_enumerateStatisticsForOwner_transaction_error_block___block_invoke;
  v24[3] = &unk_1E62F4138;
  id v25 = v10;
  id v22 = v10;
  LOBYTE(a5) = [v21 enumerateProperties:v14 error:a5 enumerationHandler:v24];

  return (char)a5;
}

uint64_t __84__HDStatisticsCalculatorEntity_enumerateStatisticsForOwner_transaction_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:v6];
  if (v7)
  {
    v8 = HDSQLiteColumnWithNameAsNumber();
    objc_opt_class();
    v9 = HDSQLiteColumnWithNameAsObject();
    id v10 = HDSQLiteColumnWithNameAsData();
    if (v10)
    {
      uint64_t v11 = +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:v10 error:a4];
      if (!v11)
      {
        uint64_t v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    uint64_t v12 = 1;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to deserialize statistics with improper quantity type code %lld", v6);
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

+ (id)databaseTable
{
  return 0;
}

+ (Class)ownerEntityClass
{
  return 0;
}

+ (id)ownerEntityReferenceColumn
{
  return 0;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_61;
}

+ (id)foreignKeys
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"owner_id";
  id v3 = objc_alloc(MEMORY[0x1E4F65D20]);
  uint64_t v4 = [a1 ownerEntityClass];
  uint64_t v5 = [a1 ownerEntityReferenceColumn];
  uint64_t v6 = (void *)[v3 initWithEntityClass:v4 property:v5 deletionAction:2];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"owner_id";
  v4[1] = @"quantity_type";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

@end