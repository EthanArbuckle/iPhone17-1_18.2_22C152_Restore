@interface HDDismissedDrugInteractionResultEntity
+ (BOOL)_insertDismissedDrugInteractionResult:(void *)a3 transaction:(uint64_t)a4 error:;
+ (BOOL)enumerateDismissedDrugInteractionResultsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertDismissedDrugInteractionResult:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDDismissedDrugInteractionResultEntity

+ (id)databaseTable
{
  return @"medication_dismissed_interactions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__HDDismissedDrugInteractionResultEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"interaction_identifier";
  v4[1] = @"first_drug_class_identifier";
  v4[2] = @"first_drug_class_ancestor_identifier";
  v4[3] = @"second_drug_class_identifier";
  v4[4] = @"second_drug_class_ancestor_identifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

+ (BOOL)enumerateDismissedDrugInteractionResultsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [a4 databaseForEntityClass:a1];
  v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v14 = +[HDDismissedDrugInteractionResultEntity _propertiesForEntity]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __133__HDDismissedDrugInteractionResultEntity_enumerateDismissedDrugInteractionResultsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6337AB8;
  id v18 = v10;
  id v15 = v10;
  LOBYTE(a5) = [v13 enumerateProperties:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

+ (id)_propertiesForEntity
{
  v2[6] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"interaction_identifier";
  v2[1] = @"first_drug_class_identifier";
  v2[2] = @"first_drug_class_ancestor_identifier";
  v2[3] = @"second_drug_class_identifier";
  v2[4] = @"second_drug_class_ancestor_identifier";
  v2[5] = @"creation_date";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  return v0;
}

uint64_t __133__HDDismissedDrugInteractionResultEntity_enumerateDismissedDrugInteractionResultsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  v7 = HDSQLiteColumnWithNameAsDate();
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F66AA0]) _initWithInteractionIdentifier:v2 firstDrugClassIdentifier:v3 firstDrugClassAncestorIdentifier:v4 secondDrugClassIdentifier:v5 secondDrugClassAncestorIdentifier:v6 creationDate:v7];
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v9;
}

+ (BOOL)insertDismissedDrugInteractionResult:(id)a3 profile:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [HDDismissedDrugInteractionResultInsertOperation alloc];
  v13[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v11 = [(HDDismissedDrugInteractionResultInsertOperation *)v9 initWithDismissedDrugInteractionResults:v10];
  LOBYTE(a5) = [(HDJournalableOperation *)v11 performOrJournalWithProfile:v7 error:a5];

  return (char)a5;
}

+ (BOOL)_insertDismissedDrugInteractionResult:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = self;
  uint64_t v9 = [v7 databaseForEntityClass:v8];

  id v10 = +[HDDismissedDrugInteractionResultEntity _propertiesForEntity]();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__HDDismissedDrugInteractionResultEntity__insertDismissedDrugInteractionResult_transaction_error___block_invoke;
  v15[3] = &unk_1E6337AE0;
  id v16 = v6;
  id v11 = v6;
  v12 = [v8 insertOrReplaceEntity:1 database:v9 properties:v10 error:a4 bindingHandler:v15];
  BOOL v13 = v12 != 0;

  return v13;
}

void __98__HDDismissedDrugInteractionResultEntity__insertDismissedDrugInteractionResult_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) interactionIdentifier];
  MEMORY[0x1C187CE20](a2, @"interaction_identifier", [v4 rawIdentifier]);

  v5 = [*(id *)(a1 + 32) firstDrugClassIdentifier];
  MEMORY[0x1C187CE20](a2, @"first_drug_class_identifier", [v5 rawIdentifier]);

  id v6 = [*(id *)(a1 + 32) firstDrugClassAncestorIdentifier];
  MEMORY[0x1C187CE20](a2, @"first_drug_class_ancestor_identifier", [v6 rawIdentifier]);

  id v7 = [*(id *)(a1 + 32) secondDrugClassIdentifier];
  MEMORY[0x1C187CE20](a2, @"second_drug_class_identifier", [v7 rawIdentifier]);

  id v8 = [*(id *)(a1 + 32) secondDrugClassAncestorIdentifier];
  MEMORY[0x1C187CE20](a2, @"second_drug_class_ancestor_identifier", [v8 rawIdentifier]);

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C187CDF0](a2, @"creation_date", v9);
}

@end