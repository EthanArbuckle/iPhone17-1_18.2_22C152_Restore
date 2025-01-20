@interface HDSignedClinicalDataRecordEntity
+ (id)signedClinicalDataRecordBackedByRecordWithUniquenessChecksum:(id)a3 account:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)signedClinicalRecordBackingMedicalRecord:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
@end

@implementation HDSignedClinicalDataRecordEntity

+ (id)signedClinicalRecordBackingMedicalRecord:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityBackingMedicalRecord:a3 profile:v7 error:a5];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 signedClinicalDataRecordWithProfile:v7 error:a5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)signedClinicalDataRecordBackedByRecordWithUniquenessChecksum:(id)a3 account:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a6;
  v12 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithUniquenessChecksum:a3 account:a4 database:a5 error:a7];
  v13 = [v12 signedClinicalDataRecordWithProfile:v11 error:a7];

  return v13;
}

- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HDSignedClinicalDataRecordEntity;
  BOOL v10 = [(HDSignedClinicalDataRecordEntity *)&v28 willDeleteWithProfile:v8 transaction:v9 error:a5];
  if (v10)
  {
    uint64_t v11 = HDMedicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID;
    v12 = [v9 databaseForEntity:self];
    v13 = [(HDSignedClinicalDataRecordEntity *)self valueForProperty:v11 database:v12];

    v14 = +[HDOriginalSignedClinicalDataRecordEntity entityWithPersistentID:v13];
    uint64_t v15 = HDOriginalSignedClinicalDataRecordEntityPropertySyncIdentifier;
    v16 = [v9 databaseForEntityClass:objc_opt_class()];
    v17 = [v14 valueForProperty:v15 database:v16];

    if (v17)
    {
      v18 = +[NSUUID hk_UUIDWithData:v17];
      if (v18)
      {
        v19 = [v8 healthRecordsExtension];
        v20 = v19;
        if (v19)
        {
          v21 = [v19 signedClinicalDataManager];
          unsigned __int8 v22 = [v21 isReextractingSignedClinicalDataRecordWithSyncIdentifier:v18];

          if ((v22 & 1) == 0)
          {
            v23 = [v20 createHealthRecordsIngestionServiceClient];
            [v23 willDeleteSignedClinicalDataRecordWithSyncIdentifier:v18];
          }
        }
        else
        {
          _HKInitializeLogging();
          v26 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
            sub_B3F28(v26);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v25 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_B3EE4(v25);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v24 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B3E6C((uint64_t)v13, v24);
      }
    }
  }
  return v10;
}

@end