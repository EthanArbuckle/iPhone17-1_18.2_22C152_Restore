@interface HDUpdateSDKVersionTokenFieldOnSubscriptionsTable
@end

@implementation HDUpdateSDKVersionTokenFieldOnSubscriptionsTable

uint64_t ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  HKBitPatternCastSignedToUnsignedInt64();
  uint64_t v6 = HKBitPatternCastUnsignedToSignedInt64();
  v7 = [*(id *)(a1 + 32) unprotectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke_2;
  v10[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = v6;
  v10[5] = v5;
  uint64_t v8 = [v7 executeSQL:@"UPDATE subscription_app_launch SET sdk_version = ? WHERE ROWID = ?" error:a3 bindingHandler:v10 enumerationHandler:0];

  return v8;
}

uint64_t ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end