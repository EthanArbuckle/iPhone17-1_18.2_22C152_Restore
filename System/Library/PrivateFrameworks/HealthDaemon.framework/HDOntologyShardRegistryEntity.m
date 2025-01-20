@interface HDOntologyShardRegistryEntity
+ (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)insertEntry:(id)a3 database:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)nextAvailableSlotInAllowedRange:(_NSRange)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)uniquedColumns;
- (HDOntologyShardRegistryEntity)init;
@end

@implementation HDOntologyShardRegistryEntity

- (HDOntologyShardRegistryEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)insertEntry:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([v10 isWriter] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDOntologyShardRegistryEntity.m", 85, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HDOntologyShardRegistryEntity_insertEntry_database_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v9;
  id v11 = v9;
  v12 = [a1 insertOrReplaceEntity:1 database:v10 properties:&unk_1F17E8FD0 error:a5 bindingHandler:v15];

  return v12 != 0;
}

void __60__HDOntologyShardRegistryEntity_insertEntry_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  MEMORY[0x1C1879EC0](a2, @"identifier", v4);

  v5 = [*(id *)(a1 + 32) schemaType];
  MEMORY[0x1C1879EC0](a2, @"schema_type", v5);

  MEMORY[0x1C1879E80](a2, @"schema_version", [*(id *)(a1 + 32) schemaVersion]);
  MEMORY[0x1C1879E80](a2, @"settings", [*(id *)(a1 + 32) settings]);
  MEMORY[0x1C1879E80](a2, @"slot", [*(id *)(a1 + 32) slot]);
  MEMORY[0x1C1879E80](a2, @"desired_state", [*(id *)(a1 + 32) desiredState]);
  v6 = [*(id *)(a1 + 32) desiredStateDate];
  MEMORY[0x1C1879E40](a2, @"desired_state_date", v6);

  MEMORY[0x1C1879E80](a2, @"current_version", [*(id *)(a1 + 32) currentVersion]);
  v7 = [*(id *)(a1 + 32) currentVersionDate];
  MEMORY[0x1C1879E40](a2, @"current_version_date", v7);

  v8 = [*(id *)(a1 + 32) currentRegion];
  MEMORY[0x1C1879EC0](a2, @"current_region", v8);

  id v9 = [*(id *)(a1 + 32) currentRegionDate];
  MEMORY[0x1C1879E40](a2, @"current_region_date", v9);

  id v10 = [*(id *)(a1 + 32) currentLocale];
  MEMORY[0x1C1879EC0](a2, @"current_locale", v10);

  id v11 = [*(id *)(a1 + 32) currentLocaleDate];
  MEMORY[0x1C1879E40](a2, @"current_locale_date", v11);

  MEMORY[0x1C1879E80](a2, @"available_version", [*(id *)(a1 + 32) availableVersion]);
  v12 = [*(id *)(a1 + 32) availableVersionDate];
  MEMORY[0x1C1879E40](a2, @"available_version_date", v12);

  v13 = [*(id *)(a1 + 32) availableRegion];
  MEMORY[0x1C1879EC0](a2, @"available_region", v13);

  v14 = [*(id *)(a1 + 32) availableRegionDate];
  MEMORY[0x1C1879E40](a2, @"available_region_date", v14);

  v15 = [*(id *)(a1 + 32) availableLocale];
  MEMORY[0x1C1879EC0](a2, @"available_locale", v15);

  id v16 = [*(id *)(a1 + 32) availableLocaleDate];
  MEMORY[0x1C1879E40](a2, @"available_locale_date", v16);

  v17 = [*(id *)(a1 + 32) availableURL];
  v18 = [v17 absoluteString];
  MEMORY[0x1C1879EC0](a2, @"available_url", v18);

  v19 = [*(id *)(a1 + 32) availableURLDate];
  MEMORY[0x1C1879E40](a2, @"available_url_date", v19);

  v20 = [*(id *)(a1 + 32) availableChecksum];
  MEMORY[0x1C1879EC0](a2, @"available_checksum", v20);

  v21 = [*(id *)(a1 + 32) availableChecksumDate];
  MEMORY[0x1C1879E40](a2, @"available_checksum_date", v21);

  MEMORY[0x1C1879E80](a2, @"available_size", [*(id *)(a1 + 32) availableSize]);
  v22 = [*(id *)(a1 + 32) availableSizeDate];
  MEMORY[0x1C1879E40](a2, @"available_size_date", v22);

  MEMORY[0x1C1879E80](a2, @"available_state", [*(id *)(a1 + 32) availableState]);
  id v23 = [*(id *)(a1 + 32) availableStateDate];
  MEMORY[0x1C1879E40](a2, @"available_state_date", v23);
}

+ (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v11 = a7;
  v12 = +[HDSQLiteEntity queryWithDatabase:a5 predicate:a3 limit:0 orderingTerms:a4 groupBy:0];
  self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__HDOntologyShardRegistryEntity_enumerateEntriesWithPredicate_orderingTerms_database_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E62F35F0;
  id v16 = v11;
  id v13 = v11;
  LOBYTE(a6) = [v12 enumeratePersistentIDsAndProperties:&unk_1F17E8FD0 error:a6 enumerationHandler:v15];

  return (char)a6;
}

uint64_t __111__HDOntologyShardRegistryEntity_enumerateEntriesWithPredicate_orderingTerms_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = HDSQLiteColumnWithNameAsString();
  v27 = (void *)v1;
  if (v1) {
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v1];
  }
  else {
    v34 = 0;
  }
  id v25 = objc_alloc(MEMORY[0x1E4F2B2F8]);
  v33 = HDSQLiteColumnWithNameAsString();
  v24 = HDSQLiteColumnWithNameAsString();
  uint64_t v23 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v22 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v21 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v20 = HDSQLiteColumnWithNameAsInt64();
  v32 = HDSQLiteColumnWithNameAsDate();
  uint64_t v19 = HDSQLiteColumnWithNameAsInt64();
  v31 = HDSQLiteColumnWithNameAsDate();
  v18 = HDSQLiteColumnWithNameAsString();
  v17 = HDSQLiteColumnWithNameAsDate();
  v30 = HDSQLiteColumnWithNameAsString();
  id v16 = HDSQLiteColumnWithNameAsDate();
  uint64_t v15 = HDSQLiteColumnWithNameAsInt64();
  v29 = HDSQLiteColumnWithNameAsDate();
  id v13 = HDSQLiteColumnWithNameAsString();
  v14 = HDSQLiteColumnWithNameAsDate();
  v12 = HDSQLiteColumnWithNameAsString();
  id v11 = HDSQLiteColumnWithNameAsDate();
  v2 = HDSQLiteColumnWithNameAsDate();
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsDate();
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsDate();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  v8 = HDSQLiteColumnWithNameAsDate();
  v26 = objc_msgSend(v25, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v33, v24, v23, v22, v21, v20, v32, v19, v31, v18, v17, v30, v16,
                  v15,
                  v29,
                  v13,
                  v14,
                  v12,
                  v11,
                  v34,
                  v2,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v9;
}

+ (id)nextAvailableSlotInAllowedRange:(_NSRange)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v13 setEntityClass:a1];
  [v13 setPredicate:v11];
  v33[0] = @"slot";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v15 = [v13 selectSQLForProperties:v14];

  id v16 = (void *)[[NSString alloc] initWithFormat:@"%@ SELECT MIN(value) FROM generate_series WHERE value NOT IN (%@)", @"WITH RECURSIVE generate_series(value) AS (SELECT ? UNION ALL SELECT value+1 FROM generate_series WHERE value+1<=?)", v15];
  uint64_t v17 = length + location - 1;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke;
  v23[3] = &unk_1E62F3618;
  NSUInteger v25 = location;
  uint64_t v26 = v17;
  id v18 = v13;
  id v24 = v18;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke_2;
  v22[3] = &unk_1E62F3640;
  v22[4] = &v27;
  if ([v12 executeSQL:v16 error:a6 bindingHandler:v23 enumerationHandler:v22])
  {
    uint64_t v19 = (void *)v28[5];
    if (v19)
    {
      id v20 = v19;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 118, @"No slot is available in range (%ld, %ld) matching predicate %@", location, v17, v11);
  }
  id v20 = 0;
LABEL_6:

  _Block_object_dispose(&v27, 8);

  return v20;
}

uint64_t __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  int v5 = 3;
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  return [*(id *)(a1 + 32) bindToSelectStatement:a2 bindingIndex:&v5];
}

uint64_t __90__HDOntologyShardRegistryEntity_nextAvailableSlotInAllowedRange_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

+ (id)databaseTable
{
  return @"shard_registry";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 28;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"identifier";
  v4[1] = @"schema_type";
  v4[2] = @"schema_version";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

@end