@interface HDAttachmentReferenceEntity
+ (BOOL)deleteReferences:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateReferencesForAttachmentIdentifier:(id)a3 type:(int64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)enumerateReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)enumerateReferencesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)filteredNonTombstoneReferences:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertReference:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)insertTombstones:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)setCloudStatus:(int64_t)a3 references:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)setCloudStatus:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertIfDoesNotExistReference:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_insertReference:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)_propertiesForEntity;
+ (id)anyReferenceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)referenceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDAttachmentReferenceEntity

+ (id)databaseTable
{
  return @"attachment_references";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDAttachmentEntityColumnDefinitions_0;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 metadata];
  if (v9
    && (v10 = (void *)v9,
        [v7 metadata],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend(v11, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v11,
        v10,
        !v12))
  {
    BOOL v14 = 0;
  }
  else
  {
    v13 = [[HDInsertAttachmentReferenceOperation alloc] initWithReference:v7];
    BOOL v14 = [(HDJournalableOperation *)v13 performOrJournalWithProfile:v8 error:a5];
  }
  return v14;
}

+ (id)anyReferenceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__201;
  v22 = __Block_byref_object_dispose__201;
  id v23 = 0;
  v10 = [v9 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E62F6778;
  id v17 = a1;
  id v11 = v8;
  id v15 = v11;
  v16 = &v18;
  [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [v5 databaseForEntityClass:objc_opt_class()];

  id v7 = [*(id *)(a1 + 48) anyInDatabase:v6 predicate:*(void *)(a1 + 32) error:a3];
  if (v7)
  {
    id v8 = +[HDAttachmentReferenceEntity _propertiesForEntity]();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke_2;
    v11[3] = &unk_1E62F8848;
    v11[4] = *(void *)(a1 + 40);
    uint64_t v9 = [v7 getValuesForProperties:v8 database:v6 error:a3 handler:v11];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (id)_propertiesForEntity
{
  v2[10] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"identifier";
  v2[1] = @"schema_identifier";
  v2[2] = @"schema_version";
  v2[3] = @"object_identifier";
  v2[4] = @"attachment_identifier";
  v2[5] = @"creation_date";
  v2[6] = @"options";
  v2[7] = @"metadata";
  v2[8] = @"type";
  v2[9] = @"cloud_status";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];

  return v0;
}

void __71__HDAttachmentReferenceEntity_anyReferenceWithPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsUUID();
  id v17 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:v3 schemaVersion:v4 objectIdentifier:v5 attachmentIdentifier:v6];

  id v7 = [HDAttachmentReference alloc];
  id v8 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v9 = HDSQLiteColumnWithNameAsDate();
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  id v11 = HDSQLiteColumnWithNameAsData();
  id v12 = +[HDCodableMetadataDictionary decodeMetadataFromData:v11];
  uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v14 = [(HDAttachmentReference *)v7 initWithIdentifier:v8 schemaIdentifier:v17 creationDate:v9 options:v10 metadata:v12 type:v13 cloudStatus:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

+ (id)referenceWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  uint64_t v10 = [v8 predicateWithProperty:@"identifier" equalToValue:a3];
  id v11 = [a1 anyReferenceWithPredicate:v10 profile:v9 error:a5];

  return v11;
}

+ (BOOL)enumerateReferencesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 databaseForEntityClass:a1];
  uint64_t v13 = [a1 queryWithDatabase:v12 predicate:v11];

  uint64_t v14 = +[HDAttachmentReferenceEntity _propertiesForEntity]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__HDAttachmentReferenceEntity_enumerateReferencesWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E62F4138;
  id v18 = v10;
  id v15 = v10;
  LOBYTE(a5) = [v13 enumerateProperties:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

uint64_t __101__HDAttachmentReferenceEntity_enumerateReferencesWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsUUID();
  id v7 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:v3 schemaVersion:v4 objectIdentifier:v5 attachmentIdentifier:v6];

  id v8 = [HDAttachmentReference alloc];
  id v9 = HDSQLiteColumnWithNameAsUUID();
  id v10 = HDSQLiteColumnWithNameAsDate();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = HDSQLiteColumnWithNameAsData();
  uint64_t v13 = +[HDCodableMetadataDictionary decodeMetadataFromData:v12];
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  id v15 = [(HDAttachmentReference *)v8 initWithIdentifier:v9 schemaIdentifier:v7 creationDate:v10 options:v11 metadata:v13 type:v14 cloudStatus:HDSQLiteColumnWithNameAsInt64()];

  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)enumerateReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = NSString;
  id v16 = a5;
  id v17 = [a1 disambiguatedDatabaseTable];
  id v18 = [v15 stringWithFormat:@"SELECT %@,%@,%@,%@,%@,%@,%@,%@,%@,%@ FROM %@ WHERE %@ = ? AND %@ = ?", @"identifier", @"schema_identifier", @"schema_version", @"object_identifier", @"attachment_identifier", @"creation_date", @"options", @"metadata", @"type", @"cloud_status", v17, @"object_identifier", @"schema_identifier"];

  v19 = [v16 databaseForEntityClass:a1];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke;
  v26[3] = &unk_1E62F2900;
  id v27 = v12;
  id v28 = v13;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke_2;
  v24[3] = &unk_1E62F33D0;
  id v25 = v14;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  LOBYTE(a6) = [v19 executeSQL:v18 error:a6 bindingHandler:v26 enumerationHandler:v24];

  return (char)a6;
}

uint64_t __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke()
{
  HDSQLiteBindStringToStatement();

  return HDSQLiteBindStringToStatement();
}

uint64_t __124__HDAttachmentReferenceEntity_enumerateReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsUUID();
  id v7 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:v3 schemaVersion:v4 objectIdentifier:v5 attachmentIdentifier:v6];

  id v8 = [HDAttachmentReference alloc];
  id v9 = HDSQLiteColumnWithNameAsUUID();
  id v10 = HDSQLiteColumnWithNameAsDate();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = HDSQLiteColumnWithNameAsData();
  id v13 = +[HDCodableMetadataDictionary decodeMetadataFromData:v12];
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  id v15 = [(HDAttachmentReference *)v8 initWithIdentifier:v9 schemaIdentifier:v7 creationDate:v10 options:v11 metadata:v13 type:v14 cloudStatus:HDSQLiteColumnWithNameAsInt64()];

  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)enumerateReferencesForAttachmentIdentifier:(id)a3 type:(int64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = NSString;
  id v15 = a5;
  uint64_t v16 = [a1 disambiguatedDatabaseTable];
  id v17 = [v14 stringWithFormat:@"SELECT %@,%@,%@,%@,%@,%@,%@,%@,%@,%@ FROM %@ WHERE %@ = ? AND %@ = ?", @"identifier", @"schema_identifier", @"schema_version", @"object_identifier", @"attachment_identifier", @"creation_date", @"options", @"metadata", @"type", @"cloud_status", v16, @"attachment_identifier", @"type"];

  id v18 = [v15 databaseForEntityClass:a1];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke;
  v28[3] = &unk_1E62F59C8;
  id v29 = v17;
  id v24 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_2;
  v25[3] = &unk_1E62F33F8;
  id v26 = v12;
  int64_t v27 = a4;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_3;
  v23[3] = &unk_1E62F33D0;
  id v19 = v13;
  id v20 = v12;
  id v21 = v17;
  LOBYTE(a6) = [v18 executeCachedStatementForKey:&enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler__lookupKey error:a6 SQLGenerator:v28 bindingHandler:v25 enumerationHandler:v23];

  return (char)a6;
}

id __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __116__HDAttachmentReferenceEntity_enumerateReferencesForAttachmentIdentifier_type_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsUUID();
  id v7 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:v3 schemaVersion:v4 objectIdentifier:v5 attachmentIdentifier:v6];

  id v8 = [HDAttachmentReference alloc];
  id v9 = HDSQLiteColumnWithNameAsUUID();
  id v10 = HDSQLiteColumnWithNameAsDate();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = HDSQLiteColumnWithNameAsData();
  id v13 = +[HDCodableMetadataDictionary decodeMetadataFromData:v12];
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  id v15 = [(HDAttachmentReference *)v8 initWithIdentifier:v9 schemaIdentifier:v7 creationDate:v10 options:v11 metadata:v13 type:v14 cloudStatus:HDSQLiteColumnWithNameAsInt64()];

  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)setCloudStatus:(int64_t)a3 references:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = [a5 databaseForEntityClass:a1];
  id v12 = (void *)MEMORY[0x1E4F65D10];
  id v13 = objc_msgSend(v10, "hk_map:", &__block_literal_global_241);

  uint64_t v14 = [v12 containsPredicateWithProperty:@"identifier" values:v13];

  v18[0] = @"cloud_status";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke_2;
  v17[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  void v17[4] = a3;
  LOBYTE(a6) = +[HDSQLiteEntity updateProperties:v15 predicate:v14 database:v11 error:a6 bindingHandler:v17];

  return (char)a6;
}

uint64_t __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __75__HDAttachmentReferenceEntity_setCloudStatus_references_transaction_error___block_invoke_2()
{
}

+ (BOOL)setCloudStatus:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = [a4 protectedDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke_2;
  v9[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v9[4] = a3;
  LOBYTE(a5) = [v7 executeCachedStatementForKey:&setCloudStatus_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_360_1 bindingHandler:v9 enumerationHandler:0];

  return (char)a5;
}

id __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"UPDATE %@ SET %@ = ?", v1, @"cloud_status"];

  return v2;
}

uint64_t __64__HDAttachmentReferenceEntity_setCloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (BOOL)filteredNonTombstoneReferences:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a4 databaseForEntityClass:a1];
  id v13 = objc_msgSend(v10, "hk_map:", &__block_literal_global_366_0);
  uint64_t v14 = [v13 componentsJoinedByString:@", "];

  id v15 = NSString;
  uint64_t v16 = [a1 disambiguatedDatabaseTable];
  id v17 = [v15 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ IN (%@)", @"identifier", @"schema_identifier", @"schema_version", @"object_identifier", @"attachment_identifier", @"creation_date", @"options", @"metadata", @"type", @"cloud_status", v16, @"type", @"identifier", v14, 0];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_2;
  v23[3] = &unk_1E62F43C8;
  id v24 = v10;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_4;
  v21[3] = &unk_1E62F33D0;
  id v22 = v11;
  id v18 = v11;
  id v19 = v10;
  LOBYTE(a5) = [v12 executeSQL:v17 error:a5 bindingHandler:v23 enumerationHandler:v21];

  return (char)a5;
}

__CFString *__99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke()
{
  return @"?";
}

void __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_377);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();
}

uint64_t __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __99__HDAttachmentReferenceEntity_filteredNonTombstoneReferences_transaction_error_enumerationHandler___block_invoke_4(uint64_t a1)
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  id v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsUUID();
  id v7 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:v3 schemaVersion:v4 objectIdentifier:v5 attachmentIdentifier:v6];

  id v8 = [HDAttachmentReference alloc];
  id v9 = HDSQLiteColumnWithNameAsUUID();
  id v10 = HDSQLiteColumnWithNameAsDate();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = HDSQLiteColumnWithNameAsData();
  id v13 = +[HDCodableMetadataDictionary decodeMetadataFromData:v12];
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  id v15 = [(HDAttachmentReference *)v8 initWithIdentifier:v9 schemaIdentifier:v7 creationDate:v10 options:v11 metadata:v13 type:v14 cloudStatus:HDSQLiteColumnWithNameAsInt64()];

  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v16;
}

+ (BOOL)insertTombstones:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v10 databaseForEntityClass:a1];
  id v12 = objc_msgSend(v9, "hk_map:", &__block_literal_global_379_0);
  id v13 = [v12 componentsJoinedByString:@", "];

  uint64_t v14 = NSString;
  id v45 = a1;
  id v15 = [a1 disambiguatedDatabaseTable];
  uint64_t v16 = [v14 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ IN (%@)", @"identifier", v15, @"type", @"identifier", v13, 0];

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v63 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_2;
  v61[3] = &unk_1E62F43C8;
  id v18 = v9;
  id v62 = v18;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_4;
  v59[3] = &unk_1E62F3D38;
  id v19 = v17;
  id v60 = v19;
  v47 = v11;
  LOBYTE(v9) = [v11 executeSQL:v16 error:&v63 bindingHandler:v61 enumerationHandler:v59];
  id v20 = v63;
  id v21 = v20;
  if (v9)
  {
    id v43 = v20;
    v40 = a6;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_5;
    v57[3] = &unk_1E63018B0;
    id v22 = v19;
    id v58 = v22;
    id v23 = objc_msgSend(v18, "hk_filter:", v57);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_6;
    v55[3] = &unk_1E63018B0;
    id v56 = v22;
    id v42 = v18;
    uint64_t v41 = objc_msgSend(v18, "hk_filter:", v55);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v23;
    uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
LABEL_4:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v52 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v51 + 1) + 8 * v27);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_7;
        v49[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v49[4] = v45;
        id v50 = 0;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_8;
        v48[3] = &unk_1E62F33F8;
        v48[4] = v28;
        v48[5] = a4;
        char v29 = [v47 executeCachedStatementForKey:&insertTombstones_cloudStatus_transaction_error__insertKey error:&v50 SQLGenerator:v49 bindingHandler:v48 enumerationHandler:0];
        id v30 = v50;
        v31 = v30;
        if ((v29 & 1) == 0)
        {
          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to insert tombstones.");
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            if (v37) {
              goto LABEL_24;
            }
            v31 = 0;
            char v38 = 1;
            id v18 = v42;
            v33 = (void *)v41;
LABEL_28:

            BOOL v34 = v38;
LABEL_29:

            v32 = obj;
            goto LABEL_30;
          }
          if ((objc_msgSend(v30, "hd_isConstraintViolation") & 1) == 0)
          {
            id v37 = v31;
LABEL_24:
            v33 = (void *)v41;
            if (v40) {
              id *v40 = v37;
            }
            else {
              _HKLogDroppedError();
            }
            id v18 = v42;

            char v38 = 0;
            BOOL v34 = 0;
            if (!v31) {
              goto LABEL_28;
            }
            goto LABEL_29;
          }
        }

        if (v25 == ++v27)
        {
          uint64_t v25 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
          if (v25) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    v32 = obj;

    v33 = (void *)v41;
    BOOL v34 = +[HDAttachmentReferenceEntity setCloudStatus:a4 references:v41 transaction:v10 error:v40];
    id v18 = v42;
LABEL_30:

    id v35 = v58;
    id v21 = v43;
    goto LABEL_31;
  }
  if (v20)
  {
    id v35 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to fetch filtered non-tombstone references.");
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      BOOL v34 = 1;
LABEL_31:

      BOOL v36 = v34;
      goto LABEL_32;
    }
  }
  if (a6) {
    *a6 = v35;
  }
  else {
    _HKLogDroppedError();
  }

  BOOL v34 = 0;
  BOOL v36 = 0;
  if (!v21) {
    goto LABEL_31;
  }
LABEL_32:

  return v36;
}

__CFString *__78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke()
{
  return @"?";
}

void __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_385);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDSQLiteColumnWithNameAsUUID();
  [v1 addObject:v2];

  return 1;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_7(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v2, @"identifier", @"schema_identifier", @"schema_version", @"object_identifier", @"attachment_identifier", @"creation_date", @"options", @"metadata", @"type", @"cloud_status", 0];

  return v3;
}

uint64_t __78__HDAttachmentReferenceEntity_insertTombstones_cloudStatus_transaction_error___block_invoke_8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 0);
  HDSQLiteBindFoundationValueToStatement();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  HDSQLiteBindFoundationValueToStatement();

  v6 = [*(id *)(a1 + 32) creationDate];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 7, 0);
  sqlite3_bind_null(a2, 8);
  sqlite3_bind_int64(a2, 9, 1);
  sqlite3_int64 v7 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 10, v7);
}

+ (BOOL)deleteReferences:(id)a3 cloudStatus:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a5 databaseForEntityClass:a1];
  id v12 = objc_msgSend(v10, "hk_map:", &__block_literal_global_400_1);
  id v13 = [v12 componentsJoinedByString:@", "];

  uint64_t v14 = NSString;
  id v15 = [a1 disambiguatedDatabaseTable];
  uint64_t v16 = [v14 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ? WHERE %@ IN (%@)", v15, @"schema_identifier", @"schema_version", @"object_identifier", @"attachment_identifier", @"creation_date", @"options", @"metadata", @"type", @"cloud_status", @"identifier", v13, 0];

  id v27 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_2;
  v24[3] = &unk_1E62F33F8;
  int64_t v26 = a4;
  id v17 = v10;
  id v25 = v17;
  LOBYTE(v14) = [v11 executeSQL:v16 error:&v27 bindingHandler:v24 enumerationHandler:0];
  id v18 = v27;
  id v19 = v18;
  if (v14)
  {
    BOOL v20 = 1;
    goto LABEL_13;
  }
  if (v18)
  {
    id v21 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to update references to tombstones.");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      char v22 = 1;
LABEL_12:

      BOOL v20 = v22;
      goto LABEL_13;
    }
  }
  if (a6) {
    *a6 = v21;
  }
  else {
    _HKLogDroppedError();
  }

  char v22 = 0;
  BOOL v20 = 0;
  if (!v19) {
    goto LABEL_12;
  }
LABEL_13:

  return v20;
}

__CFString *__78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke()
{
  return @"?";
}

void __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, 0);
  HDSQLiteBindFoundationValueToStatement();
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  HDSQLiteBindFoundationValueToStatement();

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 6, 0);
  sqlite3_bind_null(a2, 7);
  sqlite3_bind_int64(a2, 8, 1);
  sqlite3_bind_int64(a2, 9, *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_406_2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValuesToStatement();
}

uint64_t __78__HDAttachmentReferenceEntity_deleteReferences_cloudStatus_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)_insertReference:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 metadata];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [v8 metadata];
    int v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5);

    if (!v13)
    {
      BOOL v20 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v14 = [v9 databaseForEntityClass:a1];
  id v15 = [v8 attachmentIdentifier];
  id v24 = 0;
  uint64_t v16 = +[HDAttachmentEntity attachmentWithIdentifier:v15 transaction:v9 error:&v24];
  id v17 = v24;

  if ([v8 type] || v16)
  {
    +[HDAttachmentReferenceEntity _propertiesForEntity]();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__HDAttachmentReferenceEntity__insertReference_databaseTransaction_error___block_invoke;
    v22[3] = &unk_1E62F35C8;
    id v23 = v8;
    uint64_t v19 = [a1 insertOrReplaceEntity:0 database:v14 properties:v18 error:a5 bindingHandler:v22];
  }
  else
  {
    if (v17)
    {
      id v18 = v17;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Attachment does not exist for reference: %@", v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
LABEL_10:
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }

      uint64_t v19 = 0;
      BOOL v20 = 0;
      if (v17) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    uint64_t v19 = 0;
  }
LABEL_16:

  BOOL v20 = (void *)v19;
LABEL_17:

LABEL_18:

  return v20;
}

void __74__HDAttachmentReferenceEntity__insertReference_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  MEMORY[0x1C1879EF0](a2, @"identifier", v4);

  id v5 = [*(id *)(a1 + 32) schemaIdentifier];
  MEMORY[0x1C1879EC0](a2, @"schema_identifier", v5);

  MEMORY[0x1C1879E80](a2, @"schema_version", [*(id *)(a1 + 32) schemaVersion]);
  id v6 = [*(id *)(a1 + 32) objectIdentifier];
  MEMORY[0x1C1879EC0](a2, @"object_identifier", v6);

  sqlite3_int64 v7 = [*(id *)(a1 + 32) attachmentIdentifier];
  MEMORY[0x1C1879EF0](a2, @"attachment_identifier", v7);

  id v8 = [*(id *)(a1 + 32) creationDate];
  MEMORY[0x1C1879E40](a2, @"creation_date", v8);

  MEMORY[0x1C1879E80](a2, @"options", [*(id *)(a1 + 32) options]);
  id v9 = [*(id *)(a1 + 32) metadata];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) metadata];
    id v12 = objc_msgSend(v11, "hk_codableMetadata");
    int v13 = [v12 data];
    MEMORY[0x1C1879E30](a2, @"metadata", v13);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"metadata");
  }
  MEMORY[0x1C1879E80](a2, @"type", [*(id *)(a1 + 32) type]);
  [*(id *)(a1 + 32) cloudStatus];

  JUMPOUT(0x1C1879E80);
}

+ (id)_insertIfDoesNotExistReference:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 metadata];
  if (!v10
    || (uint64_t v11 = (void *)v10,
        [v8 metadata],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        v13))
  {
    uint64_t v14 = [v8 identifier];
    id v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"identifier" equalToValue:v14];

    uint64_t v16 = [v9 databaseForEntityClass:objc_opt_class()];
    id v23 = 0;
    id v17 = [a1 anyInDatabase:v16 predicate:v15 error:&v23];
    id v18 = v23;
    uint64_t v19 = v18;
    if (v17)
    {
      id v20 = v17;
    }
    else
    {
      if (v18)
      {
        if (a5)
        {
          id v21 = 0;
          *a5 = v18;
        }
        else
        {
          _HKLogDroppedError();
          id v21 = 0;
        }
        goto LABEL_6;
      }
      id v20 = [a1 _insertReference:v8 databaseTransaction:v9 error:a5];
    }
    id v21 = v20;
LABEL_6:

    goto LABEL_8;
  }
  id v21 = 0;
LABEL_8:

  return v21;
}

@end