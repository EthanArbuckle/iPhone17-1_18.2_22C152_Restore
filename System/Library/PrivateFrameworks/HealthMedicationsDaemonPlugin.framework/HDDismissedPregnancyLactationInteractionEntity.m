@interface HDDismissedPregnancyLactationInteractionEntity
+ (BOOL)_insertDismissedPregnancyLactationInteraction:(void *)a3 transaction:(uint64_t)a4 error:;
+ (BOOL)enumerateDismissedPregnancyLactationInteractionsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertDismissedPregnancyLactationInteraction:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDDismissedPregnancyLactationInteractionEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"medication_dismissed_pregnancy_lactation_interactions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__HDDismissedPregnancyLactationInteractionEntityColumnDefinitions;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"medication_identifier";
  v4[1] = @"interaction_type";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (BOOL)enumerateDismissedPregnancyLactationInteractionsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [a4 databaseForEntityClass:a1];
  v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v14 = +[HDDismissedPregnancyLactationInteractionEntity _propertiesForEntity]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __149__HDDismissedPregnancyLactationInteractionEntity_enumerateDismissedPregnancyLactationInteractionsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6337AB8;
  id v18 = v10;
  id v15 = v10;
  LOBYTE(a5) = [v13 enumerateProperties:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

+ (id)_propertiesForEntity
{
  v2[3] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"medication_identifier";
  v2[1] = @"interaction_type";
  v2[2] = @"creation_date";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  return v0;
}

uint64_t __149__HDDismissedPregnancyLactationInteractionEntity_enumerateDismissedPregnancyLactationInteractionsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  v4 = HDSQLiteColumnWithNameAsDate();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F66AA8]) _initWithMedicationIdentifier:v2 interactionType:v3 creationDate:v4];
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

+ (BOOL)insertDismissedPregnancyLactationInteraction:(id)a3 profile:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [HDDismissedPregnancyLactationInteractionInsertOperation alloc];
  v13[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v11 = [(HDDismissedPregnancyLactationInteractionInsertOperation *)v9 initWithDismissedPregnancyLactationInteractions:v10];
  LOBYTE(a5) = [(HDJournalableOperation *)v11 performOrJournalWithProfile:v7 error:a5];

  return (char)a5;
}

+ (BOOL)_insertDismissedPregnancyLactationInteraction:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = self;
  v9 = [v7 databaseForEntityClass:v8];

  id v10 = +[HDDismissedPregnancyLactationInteractionEntity _propertiesForEntity]();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__HDDismissedPregnancyLactationInteractionEntity__insertDismissedPregnancyLactationInteraction_transaction_error___block_invoke;
  v15[3] = &unk_1E6337AE0;
  id v16 = v6;
  id v11 = v6;
  v12 = [v8 insertOrReplaceEntity:1 database:v9 properties:v10 error:a4 bindingHandler:v15];
  BOOL v13 = v12 != 0;

  return v13;
}

void __114__HDDismissedPregnancyLactationInteractionEntity__insertDismissedPregnancyLactationInteraction_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) medicationIdentifier];
  MEMORY[0x1C187CE20](a2, @"medication_identifier", [v4 rawIdentifier]);

  MEMORY[0x1C187CE20](a2, @"interaction_type", [*(id *)(a1 + 32) interactionType]);
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C187CDF0](a2, @"creation_date", v5);
}

@end