@interface HDInsertECGSymptomsAndCreateAssociationWithECGSamples
@end

@implementation HDInsertECGSymptomsAndCreateAssociationWithECGSamples

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  double v4 = *(double *)(a1 + 48);

  return sqlite3_bind_double(a2, 3, v4);
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (int)[*(id *)(a1 + 32) intValue]);
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 48));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 56));
  sqlite3_int64 v4 = (int)[*(id *)(a1 + 40) intValue];

  return sqlite3_bind_int64(a2, 4, v4);
}

void ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (int)[*(id *)(a1 + 32) intValue]);
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  sqlite3_bind_int64(a2, 2, (int)[v4 intValue]);
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_6(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, (int)[*(id *)(a1 + 32) intValue]);
  sqlite3_int64 v4 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, 3, v4);
}

@end