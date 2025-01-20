@interface HDConceptIndexEntity
+ (BOOL)enumerateConceptIndexEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertConceptIndexEntries:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)removeAllConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)conceptIndexEntriesForSampleUUID:(id)a3 type:(unint64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (id)joinClausesForProperty:(id)a3;
+ (id)numberOfIndexedConceptsWithProfile:(id)a3 error:(id *)a4;
+ (id)unitTesting_allConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4;
+ (int64_t)protectionClass;
@end

@implementation HDConceptIndexEntity

+ (id)databaseTable
{
  return @"concept_index";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_34;
}

+ (id)indices
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v13 = @"object_id";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v5 = (void *)[v2 initWithEntity:v3 name:@"objects" columns:v4];
  v14[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v7 = objc_opt_class();
  v12[0] = @"concept_identifier";
  v12[1] = @"key_path";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v9 = (void *)[v6 initWithEntity:v7 name:@"concept_identifier_key_paths" columns:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  return v10;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"object_id";
  id v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"uuid"])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = (void *)MEMORY[0x1E4F65D38];
    uint64_t v7 = [a1 disambiguatedDatabaseTable];
    v8 = [v6 innerJoinClauseFromTable:v7 toTargetEntity:objc_opt_class() as:0 localReference:@"object_id" targetKey:@"data_id"];
    v9 = [v5 setWithObject:v8];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___HDConceptIndexEntity;
    v9 = objc_msgSendSuper2(&v11, sel_joinClausesForProperty_, v4);
  }

  return v9;
}

+ (BOOL)insertConceptIndexEntries:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = v10;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 97, @"Invalid parameter not satisfying: %@", @"conceptIndexEntries" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 98, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [v11 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__HDConceptIndexEntity_insertConceptIndexEntries_profile_error___block_invoke;
  v18[3] = &unk_1E62F9068;
  id v19 = v9;
  id v20 = a1;
  id v13 = v9;
  char v14 = [a1 performWriteTransactionWithHealthDatabase:v12 error:a5 block:v18];

  return v14;
}

uint64_t __64__HDConceptIndexEntity_insertConceptIndexEntries_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[7] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v23 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v6 = [v25 protectedDatabase];
        id v7 = v5;
        id v8 = v6;
        id v9 = self;
        v35[0] = @"object_id";
        v35[1] = @"concept_identifier";
        v35[2] = @"version";
        v35[3] = @"key_path";
        v35[4] = @"compound_index";
        v35[5] = @"type";
        v35[6] = @"ontology_version";
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:7];
        objc_super v11 = [v7 sampleUUID];
        v12 = HDDataEntityPredicateForDataUUID();
        id v33 = 0;
        id v13 = +[HDDataEntity anyInDatabase:v8 predicate:v12 error:&v33];
        id v14 = v33;

        if (v13) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v14 == 0;
        }
        if (!v15)
        {
          if (a3) {
            *a3 = v14;
          }
          else {
            _HKLogDroppedError();
          }

LABEL_20:
          uint64_t v19 = 0;
          goto LABEL_21;
        }
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __64__HDConceptIndexEntity__insertConceptIndexEntry_database_error___block_invoke;
        v30[3] = &unk_1E62F3A88;
        id v16 = v13;
        id v31 = v16;
        id v17 = v7;
        id v32 = v17;
        v18 = [v9 insertOrReplaceEntity:1 database:v8 properties:v10 error:a3 bindingHandler:v30];

        if (!v18) {
          goto LABEL_20;
        }
      }
      uint64_t v19 = 1;
      uint64_t v23 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_21:

  return v19;
}

+ (BOOL)removeAllConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 117, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
  }
  id v8 = [v7 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __70__HDConceptIndexEntity_removeAllConceptIndexEntriesWithProfile_error___block_invoke;
  v12[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v12[4] = a1;
  char v9 = [a1 performWriteTransactionWithHealthDatabase:v8 error:a4 block:v12];

  return v9;
}

uint64_t __70__HDConceptIndexEntity_removeAllConceptIndexEntriesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = objc_opt_class();
  id v6 = [v4 protectedDatabase];

  id v7 = [v5 queryWithDatabase:v6 predicate:0];

  uint64_t v8 = [v7 deleteAllEntitiesWithError:a3];
  return v8;
}

+ (id)conceptIndexEntriesForSampleUUID:(id)a3 type:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 133, @"Invalid parameter not satisfying: %@", @"sampleUUID" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 134, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];

LABEL_3:
  id v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v11];
  BOOL v15 = (void *)MEMORY[0x1E4F65D00];
  id v16 = [NSNumber numberWithUnsignedInteger:a4];
  id v17 = [v15 predicateWithProperty:@"type" equalToValue:v16];

  v18 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v14 otherPredicate:v17];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__HDConceptIndexEntity_conceptIndexEntriesForSampleUUID_type_profile_error___block_invoke;
  v26[3] = &unk_1E62FC430;
  id v27 = v19;
  id v20 = v19;
  if ([a1 enumerateConceptIndexEntriesWithPredicate:v18 profile:v13 error:a6 enumerationHandler:v26])v21 = v20; {
  else
  }
    v21 = 0;
  id v22 = v21;

  return v22;
}

uint64_t __76__HDConceptIndexEntity_conceptIndexEntriesForSampleUUID_type_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)enumerateConceptIndexEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a4 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__HDConceptIndexEntity_enumerateConceptIndexEntriesWithPredicate_profile_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E62FB698;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __99__HDConceptIndexEntity_enumerateConceptIndexEntriesWithPredicate_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 32);
  id v6 = (__CFString *)*(id *)(a1 + 40);
  id v7 = a2;
  id v8 = v5;
  uint64_t v9 = self;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:sel__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler_, v9, @"HDConceptIndexEntity.m", 259, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler_, v9, @"HDConceptIndexEntity.m", 260, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = objc_opt_class();
  id v11 = [v7 protectedDatabase];

  id v12 = [v10 queryWithDatabase:v11 predicate:v8];

  self;
  id v19 = @"uuid";
  uint64_t v20 = @"concept_identifier";
  v21 = @"version";
  id v22 = @"key_path";
  uint64_t v23 = @"compound_index";
  v24 = @"type";
  id v25 = @"ontology_version";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:7];
  id v19 = (__CFString *)MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = (__CFString *)__93__HDConceptIndexEntity__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler___block_invoke;
  id v22 = (__CFString *)&unk_1E62F35F0;
  uint64_t v23 = v6;
  id v14 = v6;
  uint64_t v15 = [v12 enumeratePersistentIDsAndProperties:v13 error:a3 enumerationHandler:&v19];

  return v15;
}

+ (id)numberOfIndexedConceptsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__67;
  id v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  id v7 = [v6 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke;
  v11[3] = &unk_1E62FC108;
  v11[4] = &v12;
  v11[5] = a1;
  LODWORD(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v11];

  if (a4) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 protectedDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_2;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v9[4] = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_3;
  v8[3] = &unk_1E62F3640;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDConceptIndexEntityPropertyOntologyVersion_block_invoke_statementKey error:a3 SQLGenerator:v9 bindingHandler:0 enumerationHandler:v8];

  return v6;
}

id __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_2(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v4 = (void *)[v2 initWithFormat:@"SELECT COUNT(DISTINCT %@) FROM %@", @"concept_identifier", v3];

  return v4;
}

uint64_t __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (id)unitTesting_allConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDConceptIndexEntity.m", 189, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__HDConceptIndexEntity_unitTesting_allConceptIndexEntriesWithProfile_error___block_invoke;
  void v14[3] = &unk_1E62FC430;
  id v15 = v8;
  id v9 = v8;
  if ([a1 enumerateConceptIndexEntriesWithPredicate:0 profile:v7 error:a4 enumerationHandler:v14])id v10 = v9; {
  else
  }
    id v10 = 0;
  id v11 = v10;

  return v11;
}

uint64_t __76__HDConceptIndexEntity_unitTesting_allConceptIndexEntriesWithProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __64__HDConceptIndexEntity__insertConceptIndexEntry_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"object_id", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879E80](a2, @"concept_identifier", [*(id *)(a1 + 40) conceptIdentifier]);
  MEMORY[0x1C1879E80](a2, @"version", [*(id *)(a1 + 40) conceptVersion]);
  uint64_t v4 = [*(id *)(a1 + 40) keyPath];
  MEMORY[0x1C1879EC0](a2, @"key_path", v4);

  MEMORY[0x1C1879E80](a2, @"compound_index", [*(id *)(a1 + 40) compoundIndex]);
  MEMORY[0x1C1879E80](a2, @"type", [*(id *)(a1 + 40) type]);
  id v6 = [*(id *)(a1 + 40) ontologyVersion];
  v5 = [v6 string];
  MEMORY[0x1C1879EC0](a2, @"ontology_version", v5);
}

uint64_t __93__HDConceptIndexEntity__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v8 = HDSQLiteColumnWithNameAsInt64();
  id v9 = HDSQLiteColumnWithNameAsString();
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = objc_alloc(MEMORY[0x1E4F2B308]);
  id v13 = HDSQLiteColumnWithNameAsString();
  uint64_t v14 = (void *)[v12 initWithString:v13];

  id v15 = [[HDConceptIndexEntry alloc] initWithSampleUUID:v6 conceptIdentifier:v7 conceptVersion:v8 keyPath:v9 compoundIndex:v10 type:v11 ontologyVersion:v14];
  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  id v17 = 0;
  id v18 = v17;
  if ((v16 & 1) == 0)
  {
    id v19 = v17;
    uint64_t v20 = v19;
    if (v19)
    {
      if (a5) {
        *a5 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v16;
}

@end