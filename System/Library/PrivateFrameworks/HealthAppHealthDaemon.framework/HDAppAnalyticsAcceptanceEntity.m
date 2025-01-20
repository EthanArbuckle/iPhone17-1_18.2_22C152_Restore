@interface HDAppAnalyticsAcceptanceEntity
+ (BOOL)deleteAcceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)deleteAcceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)setAcceptance:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)acceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (id)acceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)allAcceptancesInTransaction:(id)a3 error:(id *)a4;
+ (id)databaseTable;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDAppAnalyticsAcceptanceEntity

+ (id)acceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v12 = [v11 databaseForEntityClass:a1];
  v13 = NSString;
  v14 = [a1 disambiguatedDatabaseTable];
  v15 = [v13 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ == ? AND %@ == ?", @"accepted", @"modification_date", v14, @"agreement", @"version"];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke;
  v24[3] = &unk_265358990;
  id v25 = v10;
  int64_t v26 = a4;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke_2;
  v20[3] = &unk_2653589B8;
  v22 = &v27;
  id v16 = v25;
  id v21 = v16;
  int64_t v23 = a4;
  if ([v12 executeSQL:v15 error:a6 bindingHandler:v24 enumerationHandler:v20]) {
    v17 = (void *)v28[5];
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v27, 8);
  return v18;
}

uint64_t __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);
  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x253387B40](a2, 0);
  double v5 = MEMORY[0x253387B50](a2, 1);
  id v6 = objc_alloc(MEMORY[0x263F42A18]);
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[6];
  v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v5];
  uint64_t v10 = [v6 initForAgreement:v7 version:v8 accepted:v4 modificationDate:v9];
  uint64_t v11 = *(void *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return 1;
}

+ (id)acceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  v12 = [v10 databaseForEntityClass:a1];

  v13 = NSString;
  v14 = [a1 disambiguatedDatabaseTable];
  v15 = [v13 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ == ? ORDER BY %@ ASC", @"accepted", @"version", @"modification_date", v14, @"agreement", @"version"];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke;
  v24[3] = &unk_2653589E0;
  id v25 = v8;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke_2;
  v21[3] = &unk_265358A08;
  id v22 = v11;
  id v23 = v25;
  id v16 = v25;
  id v17 = v11;
  if ([v12 executeSQL:v15 error:a5 bindingHandler:v24 enumerationHandler:v21]) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  return v19;
}

uint64_t __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x253387B40](a2, 0);
  uint64_t v5 = HDSQLiteColumnAsInt64();
  double v6 = MEMORY[0x253387B50](a2, 2);
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = objc_alloc(MEMORY[0x263F42A18]);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v6];
  id v11 = (void *)[v8 initForAgreement:v9 version:v5 accepted:v4 modificationDate:v10];
  [v7 addObject:v11];

  return 1;
}

+ (id)allAcceptancesInTransaction:(id)a3 error:(id *)a4
{
  double v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = [v7 databaseForEntityClass:a1];

  id v10 = NSString;
  id v11 = [a1 disambiguatedDatabaseTable];
  v12 = [v10 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ ORDER BY %@ ASC, %@ ASC", @"agreement", @"accepted", @"version", @"modification_date", v11, @"agreement", @"version"];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__HDAppAnalyticsAcceptanceEntity_allAcceptancesInTransaction_error___block_invoke;
  v17[3] = &unk_265358A30;
  id v18 = v8;
  id v13 = v8;
  if ([v9 executeSQL:v12 error:a4 bindingHandler:0 enumerationHandler:v17]) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  return v15;
}

uint64_t __68__HDAppAnalyticsAcceptanceEntity_allAcceptancesInTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x253387B70](a2, 0);
  uint64_t v5 = MEMORY[0x253387B40](a2, 1);
  uint64_t v6 = HDSQLiteColumnAsInt64();
  double v7 = MEMORY[0x253387B50](a2, 3);
  id v8 = objc_alloc(MEMORY[0x263F42A18]);
  uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v7];
  id v10 = (void *)[v8 initForAgreement:v4 version:v6 accepted:v5 modificationDate:v9];

  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v4];
  }
  [v11 addObject:v10];

  return 1;
}

+ (BOOL)setAcceptance:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = NSString;
  id v17 = [a1 disambiguatedDatabaseTable];
  id v18 = [v16 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ == ? AND %@ == ?", @"modification_date", v17, @"agreement", @"version"];

  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  id v19 = [v15 databaseForEntityClass:a1];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke;
  v37[3] = &unk_265358990;
  id v20 = v13;
  id v38 = v20;
  int64_t v39 = a5;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_2;
  v33[3] = &unk_265358A58;
  v35 = v40;
  id v21 = v14;
  id v34 = v21;
  v36 = &v42;
  if ([v19 executeSQL:v18 error:a8 bindingHandler:v37 enumerationHandler:v33])
  {
    if (*((unsigned char *)v43 + 24))
    {
      char v22 = 1;
    }
    else
    {
      id v23 = NSString;
      v24 = [a1 disambiguatedDatabaseTable];
      id v25 = [v23 stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)", v24, @"agreement", @"version", @"accepted", @"modification_date"];

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_3;
      v28[3] = &unk_265358A80;
      id v29 = v20;
      int64_t v31 = a5;
      BOOL v32 = a3;
      id v30 = v21;
      char v22 = [v19 executeSQL:v25 error:a8 bindingHandler:v28 enumerationHandler:0];
    }
  }
  else
  {
    char v22 = 0;
  }

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  return v22;
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);
  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v3 = MEMORY[0x253387B50](a2, 0);
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v3 > v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  sqlite3_bind_int(a2, 3, *(unsigned __int8 *)(a1 + 56));
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)deleteAcceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [a5 databaseForEntityClass:a1];
  v12 = NSString;
  id v13 = [a1 disambiguatedDatabaseTable];
  id v14 = [v12 stringWithFormat:@"DELETE FROM %@ WHERE %@ == ? AND %@ == ?", v13, @"agreement", @"version"];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__HDAppAnalyticsAcceptanceEntity_deleteAcceptanceForAgreement_version_transaction_error___block_invoke;
  v17[3] = &unk_265358990;
  id v18 = v10;
  int64_t v19 = a4;
  id v15 = v10;
  LOBYTE(a6) = [v11 executeSQL:v14 error:a6 bindingHandler:v17 enumerationHandler:0];

  return (char)a6;
}

uint64_t __89__HDAppAnalyticsAcceptanceEntity_deleteAcceptanceForAgreement_version_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);
  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)deleteAcceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 databaseForEntityClass:a1];
  id v10 = NSString;
  id v11 = [a1 disambiguatedDatabaseTable];
  v12 = [v10 stringWithFormat:@"DELETE FROM %@ WHERE %@ == ?", v11, @"agreement"];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__HDAppAnalyticsAcceptanceEntity_deleteAcceptancesForAgreement_transaction_error___block_invoke;
  v15[3] = &unk_2653589E0;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [v9 executeSQL:v12 error:a5 bindingHandler:v15 enumerationHandler:0];

  return (char)a5;
}

uint64_t __82__HDAppAnalyticsAcceptanceEntity_deleteAcceptancesForAgreement_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)databaseTable
{
  return @"HealthAppDatabaseSchema_app_analytics_acceptance";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $52F87C9E6B9B8AC887B293D94B864E2B *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"agreement";
  v4[1] = @"version";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end