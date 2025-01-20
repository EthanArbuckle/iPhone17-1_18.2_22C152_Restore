@interface HDMigrateClinicalSources
@end

@implementation HDMigrateClinicalSources

uint64_t ___HDMigrateClinicalSources_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F80](a2, 0);
  v6 = [*(id *)(a1 + 32) protectedDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___HDMigrateClinicalSources_block_invoke_2;
  v12[3] = &unk_1E62F43C8;
  v12[4] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___HDMigrateClinicalSources_block_invoke_3;
  v9[3] = &unk_1E62F3D60;
  id v10 = *(id *)(a1 + 32);
  v11 = v5;
  uint64_t v7 = [v6 executeSQL:@"SELECT external_id FROM clinical_accounts             LEFT JOIN clinical_gateways ON clinical_accounts.gateway_id = clinical_gateways.ROWID             WHERE HEX(clinical_accounts.identifier) = ?" error:a3 bindingHandler:v12 enumerationHandler:v9];

  return v7;
}

uint64_t ___HDMigrateClinicalSources_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDMigrateClinicalSources_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F80](a2, 0);
  v6 = [*(id *)(a1 + 32) unprotectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDMigrateClinicalSources_block_invoke_4;
  v10[3] = &unk_1E62F2900;
  uint64_t v7 = *(void *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  uint64_t v8 = [v6 executeSQL:@"UPDATE public_clinical_sources SET gateway_id = ? WHERE account_id = ?" error:a3 bindingHandler:v10 enumerationHandler:0];

  return v8;
}

uint64_t ___HDMigrateClinicalSources_block_invoke_4()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDMigrateClinicalSources_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end