@interface HDUserDomainMedicalCodingStringEntity
+ (BOOL)enumerateMedicalCodingStringsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)persistentIDForString:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)stringForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDUserDomainMedicalCodingStringEntity

+ (id)databaseTable
{
  return @"user_domain_medical_coding_strings";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_27;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)persistentIDForString:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 protectedDatabase];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__55;
  v23 = __Block_byref_object_dispose__55;
  id v24 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_2;
  v17[3] = &unk_1E62F43C8;
  id v10 = v7;
  id v18 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_3;
  v16[3] = &unk_1E62F3640;
  v16[4] = &v19;
  if ([v9 executeCachedStatementForKey:&persistentIDForString_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_61 bindingHandler:v17 enumerationHandler:v16])
  {
    v11 = (void *)v20[5];
    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_5;
      v14[3] = &unk_1E62F43C8;
      id v15 = v10;
      if ([v9 executeCachedStatementForKey:&persistentIDForString_transaction_error__insertKey error:a5 SQLGenerator:&__block_literal_global_302_1 bindingHandler:v14 enumerationHandler:0])
      {
        id v12 = [v9 lastInsertRowID];
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v12;
}

__CFString *__81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke()
{
  return @"SELECT ROWID FROM user_domain_medical_coding_strings WHERE string = ?";
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

__CFString *__81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_4()
{
  return @"INSERT INTO user_domain_medical_coding_strings (string) VALUES (?)";
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_5()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)stringForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 protectedDatabase];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__55;
  uint64_t v21 = __Block_byref_object_dispose__55;
  id v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_2;
  v15[3] = &unk_1E62F43C8;
  id v10 = v7;
  id v16 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_3;
  v14[3] = &unk_1E62F3640;
  void v14[4] = &v17;
  if ([v9 executeCachedStatementForKey:&stringForPersistentID_transaction_error__statementKey error:a5 SQLGenerator:&__block_literal_global_307 bindingHandler:v15 enumerationHandler:v14])
  {
    v11 = (void *)v18[5];
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 118, @"String not found for persistentID %@", v10);
      v11 = (void *)v18[5];
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v17, 8);

  return v12;
}

__CFString *__81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke()
{
  return @"SELECT string FROM user_domain_medical_coding_strings WHERE ROWID = ?";
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)enumerateMedicalCodingStringsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 databaseForEntityClass:a1];
  v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__HDUserDomainMedicalCodingStringEntity_enumerateMedicalCodingStringsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E62F35F0;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 enumeratePersistentIDsAndProperties:&unk_1F17E9498 error:a5 enumerationHandler:v16];

  return (char)a5;
}

uint64_t __121__HDUserDomainMedicalCodingStringEntity_enumerateMedicalCodingStringsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = MEMORY[0x1C1879F80](a4, 0);
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

@end