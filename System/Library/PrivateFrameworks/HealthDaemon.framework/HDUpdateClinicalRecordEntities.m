@interface HDUpdateClinicalRecordEntities
@end

@implementation HDUpdateClinicalRecordEntities

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v7 = 1;
  v8 = MEMORY[0x1C1879F80](a2, 1);
  if (v8)
  {
    v9 = [*(id *)(a1 + 32) unprotectedDatabase];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___HDUpdateClinicalRecordEntities_block_invoke_2;
    v14[3] = &unk_1E62F43C8;
    v14[4] = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___HDUpdateClinicalRecordEntities_block_invoke_3;
    v11[3] = &unk_1E62F3D60;
    id v12 = *(id *)(a1 + 32);
    v13 = v6;
    uint64_t v7 = [v9 executeSQL:@"SELECT sources.ROWID FROM sources             JOIN logical_sources ON logical_sources.ROWID = sources.logical_source_id             WHERE REPLACE(REPLACE(logical_sources.bundle_id, 'com.apple.public.health.clinical.', ''), '-', '') = HEX(hk_MD5(?))", a3, v14, v11 error bindingHandler enumerationHandler];
  }
  return v7;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F70](a2, 0);
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) protectedDatabase];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___HDUpdateClinicalRecordEntities_block_invoke_4;
    v14[3] = &unk_1E62F43C8;
    v14[4] = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___HDUpdateClinicalRecordEntities_block_invoke_5;
    v11[3] = &unk_1E62F3D60;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    uint64_t v9 = [v6 executeSQL:@"SELECT clinical_record_samples.ROWID, fhir_resource_resource_type, fhir_resource_identifier FROM clinical_record_samples                 JOIN objects ON clinical_record_samples.data_id = objects.data_id                 JOIN data_provenances ON data_provenances.ROWID = objects.provenance                 WHERE data_provenances.source_id = ? AND clinical_record_samples.original_signed_clinical_data_rowid IS NULL", a3, v14, v11 error bindingHandler enumerationHandler];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_4()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = MEMORY[0x1C1879F70](a2, 0);
  MEMORY[0x1C1879F80](a2, 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1C1879F80](a2, 2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (![v8 containsString:@"#"]) {
    goto LABEL_4;
  }
  uint64_t v9 = [v8 componentsSeparatedByString:@"#"];
  v10 = [v9 firstObject];
  v11 = [v10 componentsSeparatedByString:@"/"];

  if ([v11 count] == 2)
  {
    uint64_t v12 = [v11 firstObject];

    uint64_t v13 = [v11 lastObject];

    id v8 = (id)v13;
    id v7 = (id)v12;
LABEL_4:
    v14 = [*(id *)(a1 + 32) protectedDatabase];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___HDUpdateClinicalRecordEntities_block_invoke_877;
    v21[3] = &unk_1E62F2DF0;
    v21[4] = *(void *)(a1 + 40);
    id v7 = v7;
    id v22 = v7;
    id v8 = v8;
    id v23 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___HDUpdateClinicalRecordEntities_block_invoke_2_878;
    v18[3] = &unk_1E62F3D60;
    id v19 = *(id *)(a1 + 32);
    v20 = v6;
    uint64_t v15 = [v14 executeSQL:@"SELECT ROWID FROM original_fhir_resources WHERE                          account_id = ? AND type = ? AND id = ?" error:a3 bindingHandler:v21 enumerationHandler:v18];

    goto LABEL_8;
  }
  _HKInitializeLogging();
  v16 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v8;
    _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "UpdateClinicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = 0;
LABEL_8:

  return v15;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_877()
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_2_878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = MEMORY[0x1C1879F70](a2, 0);
  v6 = [*(id *)(a1 + 32) protectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDUpdateClinicalRecordEntities_block_invoke_3_882;
  v10[3] = &unk_1E62F2900;
  uint64_t v7 = *(void *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  uint64_t v8 = [v6 executeSQL:@"UPDATE clinical_record_samples SET original_fhir_resource_ROWID = ?                              WHERE ROWID = ?" error:a3 bindingHandler:v10 enumerationHandler:0];

  return v8;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_3_882()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

@end