@interface HDAddUniquenessChecksumToOriginalFHIRResourceEntity
@end

@implementation HDAddUniquenessChecksumToOriginalFHIRResourceEntity

uint64_t ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = HDSQLiteColumnAsInt64();
  v7 = MEMORY[0x1C1879F20](a2, 1);
  id v25 = 0;
  v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v25];
  id v9 = v25;
  if (v8)
  {
    id v24 = v9;
    v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:10 error:&v24];
    id v11 = v24;

    if (v10)
    {
      v12 = v10;
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v11;
        _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "HDDatabaseMigrator (Sydney) failed to encode JSON object: %@", buf, 0xCu);
      }
      v12 = v7;
    }
    v14 = objc_msgSend(v12, "hk_MD5");
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v9;
    _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "HDDatabaseMigrator (Sydney) failed to decode JSON data: %@", buf, 0xCu);
    if (v7) {
      goto LABEL_6;
    }
LABEL_14:
    v10 = [MEMORY[0x1E4F1C9B8] data];
    v14 = objc_msgSend(v10, "hk_MD5");
    id v11 = v9;
LABEL_11:

    id v9 = v11;
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_14;
  }
LABEL_6:
  v14 = objc_msgSend(v7, "hk_MD5");
LABEL_12:
  v17 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke_1325;
  v21[3] = &unk_1E62F33F8;
  id v22 = v14;
  uint64_t v23 = v6;
  id v18 = v14;
  uint64_t v19 = [v17 executeSQL:v16 error:a3 bindingHandler:v21 enumerationHandler:0];

  return v19;
}

uint64_t ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke_1325(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end