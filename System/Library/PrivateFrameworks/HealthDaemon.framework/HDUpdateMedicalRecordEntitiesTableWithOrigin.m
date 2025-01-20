@interface HDUpdateMedicalRecordEntitiesTableWithOrigin
@end

@implementation HDUpdateMedicalRecordEntitiesTableWithOrigin

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = MEMORY[0x1C1879F70](a2, 0);
  v7 = MEMORY[0x1C1879F80](a2, 1);
  v8 = [*(id *)(a1 + 32) unprotectedDatabase];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2;
  v14[3] = &unk_1E62F43C8;
  v14[4] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3;
  v11[3] = &unk_1E62FA460;
  v11[4] = v7;
  id v12 = *(id *)(a1 + 40);
  v13 = v6;
  uint64_t v9 = [v8 executeSQL:@"SELECT sources.ROWID FROM sources             JOIN logical_sources ON logical_sources.ROWID = sources.logical_source_id             WHERE (REPLACE(REPLACE(logical_sources.bundle_id, 'com.apple.private.health.clinical.', ''), '-', '') = ?)", a3, v14, v11 error bindingHandler enumerationHandler];

  return v9;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MEMORY[0x1C1879F70](a2, 0);
  if (v3)
  {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v3];
  }
  else
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_fault_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: private source ROWID is nil for account %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

  return 1;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_963(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1C1879F70](a2, 0);
  int v7 = MEMORY[0x1C1879F80](a2, 1);
  uint64_t v8 = MEMORY[0x1C1879F70](a2, 2);
  uint64_t v9 = [v7 componentsSeparatedByString:@"/"];
  if ([v9 count] != 2)
  {
    if ([v9 count] == 3)
    {
      v10 = [v9 objectAtIndexedSubscript:1];
      id v12 = [v9 lastObject];
      if (![v12 containsString:@"#"])
      {
        v11 = 0;
        goto LABEL_10;
      }
      v13 = [v12 componentsSeparatedByString:@"#"];
      if ([v13 count] == 2)
      {
        v11 = [v13 firstObject];

LABEL_10:
        goto LABEL_11;
      }
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v7;
        _os_log_fault_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v7;
        _os_log_fault_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v17 = 1;
    goto LABEL_21;
  }
  v10 = [v9 firstObject];
  v11 = [v9 lastObject];
LABEL_11:
  v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (v15)
  {
    v16 = [*(id *)(a1 + 40) protectedDatabase];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_967;
    v24[3] = &unk_1E62F2DF0;
    id v25 = v15;
    id v26 = v10;
    id v27 = v11;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2_968;
    v21[3] = &unk_1E62F3D60;
    id v22 = *(id *)(a1 + 40);
    v23 = v6;
    uint64_t v17 = [v16 executeSQL:@"SELECT ROWID FROM original_fhir_resources WHERE                   account_id = ? AND type = ? AND id = ?" error:a3 bindingHandler:v24 enumerationHandler:v21];
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_fault_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: nil account ROWID associated with private source ROWID %{public}@", buf, 0xCu);
    }
    uint64_t v17 = 1;
  }

LABEL_21:
  return v17;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_967()
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2_968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v6 = [*(id *)(a1 + 32) protectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3_972;
  v10[3] = &unk_1E62F2900;
  uint64_t v7 = *(void *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  uint64_t v8 = [v6 executeSQL:@"INSERT INTO medical_records_new (data_id, note, entered_in_error, modified_date, fhir_identifier, original_fhir_resource_rowid, locale, extraction_version, sort_date, sort_date_key_path, country, state) SELECT data_id, note, entered_in_error, modified_date, fhir_identifier, ?, locale, extraction_version, sort_date, sort_date_key_path, country, state from medical_records where ROWID = ?", a3, v10, 0 error bindingHandler enumerationHandler];

  return v8;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3_972()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

@end