@interface HDInsertPrimaryActivityForRowAndMetadata
@end

@implementation HDInsertPrimaryActivityForRowAndMetadata

__CFString *___HDInsertPrimaryActivityForRowAndMetadata_block_invoke()
{
  return @"SELECT key_id, numerical_value, string_value FROM metadata_values WHERE object_id = ? AND key_id IN (?, ?, ?)";
}

uint64_t ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_bind_int64(a2, 3, a1[6]);
  sqlite3_int64 v4 = a1[7];

  return sqlite3_bind_int64(a2, 4, v4);
}

uint64_t ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  if (v4 == a1[7])
  {
    if (MEMORY[0x1C1879F40](a2, 1) == 1.0) {
      *(void *)(*(void *)(a1[4] + 8) + 24) = 2;
    }
  }
  else if (v4 == a1[8])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = (uint64_t)MEMORY[0x1C1879F40](a2, 1);
  }
  else if (v4 == a1[9])
  {
    double v5 = MEMORY[0x1C1879F40](a2, 1);
    v6 = MEMORY[0x1C1879F80](a2, 2);
    v7 = (void *)MEMORY[0x1E4F2B370];
    v8 = [MEMORY[0x1E4F2B618] unitFromString:v6];
    uint64_t v9 = [v7 quantityWithUnit:v8 doubleValue:v5];
    uint64_t v10 = *(void *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return 1;
}

__CFString *___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_4()
{
  return @"INSERT INTO workout_activities (uuid, owner_id, is_primary_activity, activity_type, location_type, swimming_location_type, lap_length, start_date, end_date, duration) VALUES (?, ?, 1, ?, ?, ?, ?, ?, ?, ?)";
}

void ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 64));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  sqlite3_bind_int64(a2, 5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) requiringSecureCoding:1 error:0];
  sqlite3_bind_blob64(a2, 6, (const void *)[v4 bytes], objc_msgSend(v4, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_double(a2, 7, *(double *)(a1 + 80));
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 88));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 96));
}

@end