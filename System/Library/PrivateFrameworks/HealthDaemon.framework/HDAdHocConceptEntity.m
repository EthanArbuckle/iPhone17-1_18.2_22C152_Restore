@interface HDAdHocConceptEntity
+ (BOOL)deleteNonIndexedConceptsWithTransaction:(id)a3 error:(id *)a4;
+ (BOOL)enumerateAdHocConceptWithRawIdentifiers:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_adHocConceptForCodingCollection:(uint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)_conceptForRow:(uint64_t)a3 options:;
+ (id)adHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)adHocConceptForIdentifier:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)generateAdHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDAdHocConceptEntity

+ (id)databaseTable
{
  return @"ad_hoc_concepts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_79;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)adHocConceptForIdentifier:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  v26 = __Block_byref_object_dispose__156;
  id v27 = 0;
  v12 = [v11 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HDAdHocConceptEntity_adHocConceptForIdentifier_options_profile_error___block_invoke;
  v17[3] = &unk_1E6307BE8;
  v19 = &v22;
  id v20 = a1;
  id v13 = v10;
  id v18 = v13;
  unint64_t v21 = a4;
  LODWORD(a6) = [a1 performReadTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6) {
    v14 = (void *)v23[5];
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

BOOL __72__HDAdHocConceptEntity_adHocConceptForIdentifier_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = self;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__156;
  v25 = __Block_byref_object_dispose__156;
  id v26 = 0;
  id v10 = [v8 protectedDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v20[4] = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_2;
  v18[3] = &unk_1E62F43C8;
  id v11 = v7;
  id v19 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_3;
  v17[3] = &unk_1E6307C38;
  void v17[4] = &v21;
  v17[5] = v9;
  v17[6] = v6;
  LOBYTE(v9) = [v10 executeCachedStatementForKey:&_adHocConceptForIdentifier_options_transaction_error__statementKey error:a3 SQLGenerator:v20 bindingHandler:v18 enumerationHandler:v17];

  if (v9)
  {
    v12 = (void *)v22[5];
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 118, @"No adHoc concept found for identifier %@", v11);
      v12 = (void *)v22[5];
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  _Block_object_dispose(&v21, 8);
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)adHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  id v26 = __Block_byref_object_dispose__156;
  id v27 = 0;
  v12 = [v11 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HDAdHocConceptEntity_adHocConceptForCodingCollection_options_profile_error___block_invoke;
  v17[3] = &unk_1E6307BE8;
  id v19 = &v22;
  id v20 = a1;
  id v13 = v10;
  id v18 = v13;
  unint64_t v21 = a4;
  LODWORD(a6) = [a1 performReadTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6) {
    uint64_t v14 = (void *)v23[5];
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

BOOL __78__HDAdHocConceptEntity_adHocConceptForCodingCollection_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = +[HDAdHocConceptEntity _adHocConceptForCodingCollection:options:transaction:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), *(void *)(a1 + 56), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_adHocConceptForCodingCollection:(uint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = [MEMORY[0x1E4F2AE18] adHocCodingForCodingCollection:v8];
  v12 = [v11 code];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  id v26 = __Block_byref_object_dispose__156;
  id v27 = 0;
  id v13 = [v9 protectedDatabase];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v21[4] = v10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_2;
  v19[3] = &unk_1E62F43C8;
  id v14 = v12;
  id v20 = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_3;
  v18[3] = &unk_1E6307C38;
  void v18[4] = &v22;
  v18[5] = v10;
  v18[6] = a3;
  LOBYTE(a3) = [v13 executeCachedStatementForKey:&_adHocConceptForCodingCollection_options_transaction_error__statementKey error:a5 SQLGenerator:v21 bindingHandler:v19 enumerationHandler:v18];

  if (a3)
  {
    id v15 = (void *)v23[5];
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 118, @"No adHoc concept found for code %@", v14);
      id v15 = (void *)v23[5];
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v22, 8);

  return v16;
}

+ (id)generateAdHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  id v26 = __Block_byref_object_dispose__156;
  id v27 = 0;
  v12 = [v11 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__HDAdHocConceptEntity_generateAdHocConceptForCodingCollection_options_profile_error___block_invoke;
  v17[3] = &unk_1E6307BE8;
  id v19 = &v22;
  id v20 = a1;
  id v13 = v10;
  id v18 = v13;
  unint64_t v21 = a4;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6) {
    id v14 = (void *)v23[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

BOOL __86__HDAdHocConceptEntity_generateAdHocConceptForCodingCollection_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = self;
  id v10 = (void *)MEMORY[0x1E4F2AE18];
  id v11 = [MEMORY[0x1E4F2ADE8] inMemoryConceptIdentifier];
  v12 = [v10 synthesizeConceptWithIdentifier:v11 forCodingCollection:v7];

  id v13 = v12;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = [v14 protectedDatabase];

  id v23 = v13;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke;
  v24[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v24[4] = v15;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke_2;
  v22[3] = &unk_1E62F43C8;
  id v17 = v13;
  LODWORD(v15) = [v16 executeCachedStatementForKey:&_insertAdHocConcept_transaction_error__statementKey error:a3 SQLGenerator:v24 bindingHandler:v22 enumerationHandler:0];

  uint64_t v18 = 0;
  if (v15)
  {
    uint64_t v18 = +[HDAdHocConceptEntity _adHocConceptForCodingCollection:options:transaction:error:](v9, v7, v6, v14, a3);
  }

  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (BOOL)enumerateAdHocConceptWithRawIdentifiers:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a7;
  id v13 = (void *)MEMORY[0x1E4F65D10];
  id v14 = a5;
  uint64_t v15 = [v13 containsPredicateWithProperty:@"concept_identifier" values:a3];
  id v16 = [v14 database];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__HDAdHocConceptEntity_enumerateAdHocConceptWithRawIdentifiers_options_profile_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E6307C10;
  id v20 = v12;
  id v21 = a1;
  unint64_t v22 = a4;
  id v17 = v12;
  LOBYTE(a6) = [a1 enumerateProperties:&unk_1F17EA668 withPredicate:v15 healthDatabase:v16 error:a6 enumerationHandler:v19];

  return (char)a6;
}

uint64_t __105__HDAdHocConceptEntity_enumerateAdHocConceptWithRawIdentifiers_options_profile_error_enumerationHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a1[4];
  id v7 = +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a4, a1[6]);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, a5);

  return v8;
}

+ (id)_conceptForRow:(uint64_t)a3 options:
{
  self;
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = MEMORY[0x1C1879F80](a2, 1);
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v8 = MEMORY[0x1C1879F80](a2, 3);
  uint64_t v9 = MEMORY[0x1C1879F80](a2, 4);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE0]) initWithType:2 value:v6 version:v7 deleted:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE0]) initWithType:959 value:v8 version:v7 deleted:0];
  id v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, 0);

  if (v9)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE0]) initWithType:1012 value:v9 version:v7 deleted:0];
    [v13 addObject:v14];
  }
  id v15 = objc_alloc(MEMORY[0x1E4F2ADD8]);
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:v5];
  id v17 = (void *)[v15 initWithIdentifier:v16 attributes:v13 relationships:MEMORY[0x1E4F1CBF0] version:v7 deleted:0 options:a3];

  return v17;
}

+ (BOOL)deleteNonIndexedConceptsWithTransaction:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 protectedDatabase];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HDAdHocConceptEntity_deleteNonIndexedConceptsWithTransaction_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a1;
  LOBYTE(a4) = [v6 executeCachedStatementForKey:&deleteNonIndexedConceptsWithTransaction_error__statementKey error:a4 SQLGenerator:v8 bindingHandler:0 enumerationHandler:0];

  return (char)a4;
}

id __70__HDAdHocConceptEntity_deleteNonIndexedConceptsWithTransaction_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v5 = [*(id *)(a1 + 32) disambiguatedSQLForProperty:@"concept_identifier"];
  uint64_t v6 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:0x1F173B440];
  uint64_t v7 = (void *)[v2 initWithFormat:@"DELETE FROM %@ WHERE NOT EXISTS (SELECT 1 FROM %@ WHERE %@ = %@)", v3, v4, v5, v6];

  return v7;
}

id __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = (void *)[v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"concept_identifier", @"code", @"version", @"valid_regions", @"display_name", v3, @"concept_identifier"];

  return v4;
}

uint64_t __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) rawIdentifier];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a2, a1[6]);
  uint64_t v4 = *(void *)(a1[4] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

id __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = (void *)[v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"concept_identifier", @"code", @"version", @"valid_regions", @"display_name", v3, @"code"];

  return v4;
}

uint64_t __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a2, a1[6]);
  uint64_t v4 = *(void *)(a1[4] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

id __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v5 = (void *)[v2 initWithFormat:@"INSERT OR IGNORE INTO %@ (%@, %@, %@, %@, %@, %@) VALUES ((COALESCE((SELECT MAX(%@) + 1 FROM %@), %lld)), ?, ?, ?, ?, ?)", v3, @"concept_identifier", @"code", @"version", @"valid_regions", @"display_name", @"creation_date", @"concept_identifier", v4, 0x1000000000000];

  return v5;
}

uint64_t __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) adHocCode];
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) version]);
  uint64_t v5 = [*(id *)(a1 + 32) firstAttributeForType:959];
  uint64_t v6 = [v5 stringValue];
  HDSQLiteBindStringToStatement();

  uint64_t v7 = [*(id *)(a1 + 32) preferredName];
  HDSQLiteBindFoundationValueToStatement();

  double Current = CFAbsoluteTimeGetCurrent();

  return sqlite3_bind_double(a2, 5, Current);
}

@end