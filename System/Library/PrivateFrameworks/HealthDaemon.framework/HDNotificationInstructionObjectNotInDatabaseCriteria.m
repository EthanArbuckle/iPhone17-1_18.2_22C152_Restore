@interface HDNotificationInstructionObjectNotInDatabaseCriteria
+ (id)criteriaIdentifier;
- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDNotificationInstructionObjectNotInDatabaseCriteria

+ (id)criteriaIdentifier
{
  return @"HDNotificationInstructionObjectNotInDatabaseCriteria";
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 1;
  v7 = [v6 databaseForEntityClass:objc_opt_class()];
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 6, @"Protected database is inaccessible");
    goto LABEL_5;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__HDNotificationInstructionObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2;
  v12[3] = &unk_1E62F43C8;
  v12[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__HDNotificationInstructionObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3;
  v11[3] = &unk_1E62F3640;
  v11[4] = &v13;
  if (![v7 executeCachedStatementForKey:&isValidWithDatabaseTransaction_error__lookupKey_0 error:a4 SQLGenerator:&__block_literal_global_194 bindingHandler:v12 enumerationHandler:v11])
  {
LABEL_5:
    int64_t v9 = 0;
    goto LABEL_6;
  }
  int64_t v9 = v14[3];
LABEL_6:

  _Block_object_dispose(&v13, 8);
  return v9;
}

id __93__HDNotificationInstructionObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1", v1, @"uuid"];

  return v2;
}

void __93__HDNotificationInstructionObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __93__HDNotificationInstructionObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
  return 0;
}

@end