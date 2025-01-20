@interface HDOriginalSignedClinicalDataRecordEntity
+ (BOOL)enumerateActiveCodableRecordsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)enumerateActiveEntitiesForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)enumerateActiveRecordsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)insertCodableOriginalRecords:(id)a3 shouldReplace:(BOOL)a4 syncProvenance:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)insertCodableOriginalRecordsFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)replaceOriginalRecordWithSyncIdentifier:(id)a3 newSignatureStatus:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)validateCodableRecord:(id)a3 error:(id *)a4;
+ (HDOriginalSignedClinicalDataRecordEntity)entityWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_lookUpAccountByGatewayExternalID:(id)a3 gatewayExternalIDToAccountMap:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)_lookUpAccountByIssuerIdentifier:(id)a3 issuerIdentifierToAccountMap:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)_predicateForUndeletedRecordsOnAccountEntity:(id)a3;
+ (id)_predicateForUnextractedOriginalRecordsWithExtractionVersion:(int64_t)a3 ignoreExtractionVersion:(BOOL)a4;
+ (id)accountEntityForCodableRecord:(id)a3 issuerIdentifierToAccountMap:(id)a4 gatewayExternalIDToAccountMap:(id)a5 database:(id)a6 error:(id *)a7;
+ (id)codableOriginalRecordForHKRecord:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)existingDerivedVerifiableClinicalRecordsForRecordWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)existingEntityBackingMedicalRecord:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)existingEntityWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)existingEntityWithUniquenessChecksum:(id)a3 account:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)insertCodableRecord:(id)a3 shouldReplace:(BOOL)a4 accountPersistentID:(int64_t)a5 syncProvenance:(int64_t)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (id)newCompatibleCodableSignedClinicalDataRecord;
+ (id)unextractedOriginalRecordsOnProfile:(id)a3 extractionVersion:(int64_t)a4 ignoreExtractionVersion:(BOOL)a5 error:(id *)a6;
- (BOOL)_deleteDerivedRecordsWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)deleteDerivedRecordsOnProfile:(id)a3 error:(id *)a4;
- (BOOL)deleteOriginalAndDerivedRecordsOnProfile:(id)a3 error:(id *)a4;
- (BOOL)storeSignedClinicalDataItem:(id)a3 account:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)codableInDatabase:(id)a3 error:(id *)a4;
- (id)existingDerivedClinicalRecordsOnProfile:(id)a3 error:(id *)a4;
- (id)existingDerivedMedicalRecordsOnProfile:(id)a3 error:(id *)a4;
- (id)existingDerivedMedicalRecordsOnProfile:(id)a3 excludeMainRecord:(BOOL)a4 error:(id *)a5;
- (id)existingDerivedVerifiableClinicalRecordsOnProfile:(id)a3 error:(id *)a4;
- (id)rawContentOnProfile:(id)a3 error:(id *)a4;
- (id)signedClinicalDataRecordWithProfile:(id)a3 error:(id *)a4;
- (id)syncIdentifierWithProfile:(id)a3 error:(id *)a4;
- (int64_t)updateUniquenessChecksumIfNecessaryWithItem:(id)a3 database:(id)a4 error:(id *)a5;
@end

@implementation HDOriginalSignedClinicalDataRecordEntity

+ (id)newCompatibleCodableSignedClinicalDataRecord
{
  id v2 = objc_alloc_init((Class)HDCodableOriginalSignedClinicalDataRecord);
  id v3 = objc_alloc_init((Class)HDCodableMessageVersion);
  [v2 setMessageVersion:v3];

  v4 = [v2 messageVersion];
  [v4 setCompatibilityVersion:0];

  v5 = [v2 messageVersion];
  [v5 setEntityVersion:1];

  return v2;
}

+ (id)codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  if (!a3)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"HDOriginalSignedClinicalDataRecordEntity+HealthRecordsPlugin.m", 85, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v6 = +[HDOriginalSignedClinicalDataRecordEntity newCompatibleCodableSignedClinicalDataRecord];
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  if (v7 == 2)
  {
    v8 = [v6 messageVersion];
    [v8 setCompatibilityVersion:1];
  }
  v9 = HDSQLiteColumnWithNameAsData();
  [v6 setSyncIdentifier:v9];

  v10 = HDSQLiteColumnWithNameAsString();
  [v6 setGatewayExternalID:v10];

  v11 = HDSQLiteColumnWithNameAsString();
  [v6 setIssuerIdentifier:v11];

  v12 = HDSQLiteColumnWithNameAsString();
  [v6 setSourceURL:v12];

  [v6 setSourceType:v7];
  v13 = HDSQLiteColumnWithNameAsData();
  [v6 setRawContent:v13];

  v14 = HDSQLiteColumnWithNameAsData();
  [v6 setUniquenessChecksum:v14];

  [v6 setSignatureStatus:HDSQLiteColumnWithNameAsInt64()];
  v15 = HDSQLiteColumnWithNameAsString();
  v16 = [v15 componentsSeparatedByString:@" "];
  v17 = +[NSMutableArray arrayWithArray:v16];
  [v6 setTypes:v17];

  v18 = HDSQLiteColumnWithNameAsData();
  id v19 = [objc_alloc((Class)HDCodableMetadataDictionary) initWithData:v18];
  [v6 setMetadata:v19];

  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v6, "setReceivedDate:");
  v20 = HDSQLiteColumnWithNameAsString();
  [v6 setReceivedDateTimeZoneName:v20];

  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v6, "setFirstSeenDate:");
  v21 = HDSQLiteColumnWithNameAsString();
  [v6 setFirstSeenDateTimeZoneName:v21];

  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v6, "setLastModifiedDate:");
  [v6 setDeleted:HDSQLiteColumnWithNameAsBoolean()];
  if ([a1 validateCodableRecord:v6 error:a4]) {
    id v22 = v6;
  }
  else {
    id v22 = 0;
  }

  return v22;
}

+ (BOOL)validateCodableRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v5 hasMessageVersion])
  {
    uint64_t v7 = [v5 messageVersion];
    int v8 = [v7 compatibilityVersion];

    if (v8 >= 2)
    {
      v9 = [v5 messageVersion];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"compatibility version is higher (%lu) than what we support (%lu)", (int)[v9 compatibilityVersion], 1);
      [v6 addObject:v10];
    }
  }
  else
  {
    [v6 addObject:@"no compatibility version"];
  }
  v11 = [v5 syncIdentifier];
  id v12 = [v11 length];

  if (v12)
  {
    v13 = [v5 syncIdentifier];
    v14 = +[NSUUID hk_UUIDWithData:v13];

    if (v14) {
      goto LABEL_10;
    }
    CFStringRef v15 = @"invalid sync identifier bytes (not a UUID)";
  }
  else
  {
    CFStringRef v15 = @"no sync identifier";
  }
  [v6 addObject:v15];
LABEL_10:
  if (([v5 hasSourceType] & 1) == 0) {
    [v6 addObject:@"no source type"];
  }
  v16 = [v5 gatewayExternalID];
  id v17 = [v16 length];
  v18 = [v5 issuerIdentifier];
  id v19 = (char *)[v18 length];

  if (!&v19[(void)v17]) {
    [v6 addObject:@"neither gateway external ID nor issuer ID are present"];
  }
  if (([v5 hasRawContent] & 1) == 0 && !objc_msgSend(v5, "deleted")
    || [v5 hasRawContent] && objc_msgSend(v5, "deleted"))
  {
    [v6 addObject:@"raw content and deleted should be mutually exclusive"];
  }
  v20 = [v5 uniquenessChecksum];
  id v21 = [v20 length];

  if (!v21) {
    [v6 addObject:@"no uniqueness checksum"];
  }
  id v22 = [v5 types];
  id v23 = [v22 count];

  if (!v23) {
    [v6 addObject:@"no types"];
  }
  if (([v5 hasFirstSeenDate] & 1) == 0) {
    [v6 addObject:@"no first seen date"];
  }
  v24 = [v5 firstSeenDateTimeZoneName];
  id v25 = [v24 length];

  if (!v25) {
    [v6 addObject:@"no first seen date timezone name"];
  }
  if (([v5 hasReceivedDate] & 1) == 0) {
    [v6 addObject:@"no received date"];
  }
  v26 = [v5 receivedDateTimeZoneName];
  id v27 = [v26 length];

  if (!v27) {
    [v6 addObject:@"no received date timezone name"];
  }
  if (([v5 hasSignatureStatus] & 1) == 0) {
    [v6 addObject:@"no signature status"];
  }
  if (([v5 hasLastModifiedDate] & 1) == 0) {
    [v6 addObject:@"no last modified date"];
  }
  id v28 = [v6 count];
  if (v28)
  {
    v29 = [v6 componentsJoinedByString:@"; "];
    +[NSError hk_assignError:a4, 3, @"codable signed clinical data record is invalid: %@", v29 code format];
  }
  return v28 == 0;
}

+ (id)insertCodableRecord:(id)a3 shouldReplace:(BOOL)a4 accountPersistentID:(int64_t)a5 syncProvenance:(int64_t)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  uint64_t v12 = a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v69 = 0;
  LOBYTE(a8) = [a1 validateCodableRecord:v14 error:&v69];
  id v17 = v69;
  v18 = v17;
  if (a8)
  {
    id v55 = v17;
    id v19 = [v15 syncIdentityManager];
    id v20 = [v19 legacySyncIdentity];

    v57 = v16;
    if (![v14 hasSyncIdentity])
    {
      id v52 = v15;
      goto LABEL_12;
    }
    unsigned int v53 = v12;
    id v21 = [v14 syncIdentity];
    id v68 = 0;
    id v22 = +[HDSyncIdentity syncIdentityWithCodable:v21 error:&v68];
    id v23 = v68;

    if (v22)
    {
      v24 = [v15 syncIdentityManager];
      id v67 = v23;
      uint64_t v25 = [v24 concreteIdentityForIdentity:v22 shouldCreate:1 transaction:v16 error:&v67];
      id v26 = v67;

      if (v25)
      {
        id v52 = v15;

        id v20 = (id)v25;
        uint64_t v12 = v53;
LABEL_12:
        id v32 = objc_alloc((Class)NSUUID);
        id v33 = [v14 syncIdentifier];
        id v34 = objc_msgSend(v32, "initWithUUIDBytes:", objc_msgSend(v33, "bytes"));

        v35 = [v14 types];
        v36 = [v35 componentsJoinedByString:@" "];

        if ([v14 hasDeleted]) {
          unsigned __int8 v37 = [v14 deleted];
        }
        else {
          unsigned __int8 v37 = 0;
        }
        v38 = [v57 protectedDatabase];
        v39 = [a1 allColumns];
        id v66 = 0;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_6D320;
        v58[3] = &unk_113F48;
        id v54 = v34;
        id v59 = v54;
        id v60 = v14;
        id v40 = v36;
        id v61 = v40;
        int64_t v63 = a6;
        int64_t v64 = a5;
        unsigned __int8 v65 = v37;
        id v20 = v20;
        id v62 = v20;
        v31 = [a1 insertOrReplaceEntity:v12 database:v38 properties:v39 error:&v66 bindingHandler:v58];
        id v41 = v66;

        if (v31)
        {
          id v42 = v31;
          id v15 = v52;
          v18 = v55;
        }
        else
        {
          _HKInitializeLogging();
          v43 = (void *)HKLogHealthRecords;
          id v15 = v52;
          v18 = v55;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v49 = v43;
            v50 = HKStringFromBool();
            v51 = [v41 localizedDescription];
            *(_DWORD *)buf = 138543874;
            id v71 = a1;
            __int16 v72 = 2114;
            v73 = v50;
            __int16 v74 = 2114;
            v75 = v51;
            _os_log_error_impl(&dword_0, v49, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert (or replace: %{public}@) SCD record: %{public}@", buf, 0x20u);

            v18 = v55;
          }
          if (objc_msgSend(v41, "hd_sqliteExtendedErrorCode") == 2067)
          {
            +[NSError hk_assignError:a9 code:115 description:@"this original signed clinical data record is already present for this account" underlyingError:v41];
          }
          else
          {
            id v46 = v41;
            if (v46)
            {
              if (a9) {
                *a9 = v46;
              }
              else {
                _HKLogDroppedError();
              }
            }
          }
        }

        goto LABEL_42;
      }
      id v54 = v22;
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B1B28();
      }
      id v47 = v26;
      id v40 = v47;
      if (!v47)
      {
        id v20 = 0;
        v31 = 0;
        id v41 = 0;
        v18 = v55;
        goto LABEL_42;
      }
      v18 = v55;
      if (a9)
      {
        id v45 = v47;
        id v40 = v45;
        id v20 = 0;
        v31 = 0;
        *a9 = v45;
        goto LABEL_36;
      }
      _HKLogDroppedError();
      id v20 = 0;
    }
    else
    {
      id v54 = 0;
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B1AB4();
      }
      id v44 = v23;
      id v40 = v44;
      v18 = v55;
      if (v44)
      {
        if (a9)
        {
          id v45 = v44;
          id v40 = v45;
          v31 = 0;
          *a9 = v45;
LABEL_36:
          id v41 = v45;
LABEL_42:

          id v16 = v57;
          goto LABEL_43;
        }
        _HKLogDroppedError();
      }
    }
    v31 = 0;
    id v41 = v40;
    goto LABEL_42;
  }
  _HKInitializeLogging();
  id v27 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v27;
    v29 = [v18 localizedDescription];
    *(_DWORD *)buf = 138543618;
    id v71 = a1;
    __int16 v72 = 2114;
    v73 = v29;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ validation failed, not inserting codable SCD record: %{public}@", buf, 0x16u);
  }
  id v30 = v18;
  id v20 = v30;
  if (v30)
  {
    if (a9)
    {
      id v20 = v30;
      v31 = 0;
      *a9 = v20;
      goto LABEL_43;
    }
    _HKLogDroppedError();
  }
  v31 = 0;
LABEL_43:

  return v31;
}

+ (BOOL)insertCodableOriginalRecordsFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if ([v10 count])
  {
    uint64_t v12 = [v11 database];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_6D7B0;
    v19[3] = &unk_1128D8;
    id v20 = v10;
    id v21 = v11;
    id v22 = a1;
    int64_t v23 = a4;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_6DCA8;
    v15[3] = &unk_112900;
    id v16 = v20;
    int64_t v18 = a4;
    id v17 = v21;
    unsigned __int8 v13 = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v19 inaccessibilityHandler:v15];
  }
  else
  {
    unsigned __int8 v13 = 1;
  }

  return v13;
}

+ (BOOL)insertCodableOriginalRecords:(id)a3 shouldReplace:(BOOL)a4 syncProvenance:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if ([v12 count])
  {
    _HKInitializeLogging();
    id v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      id v18 = [v12 count];
      id v19 = HKStringFromBool();
      *(_DWORD *)buf = 138543874;
      v35 = v17;
      __int16 v36 = 2048;
      id v37 = v18;
      __int16 v38 = 2114;
      v39 = v19;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to insert %lu codable original signed clinical data records, shouldReplace: %{public}@", buf, 0x20u);
    }
    id v20 = [v13 database];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_6DF98;
    v28[3] = &unk_113F70;
    id v31 = a1;
    BOOL v33 = a4;
    id v29 = v12;
    int64_t v32 = a5;
    id v30 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_6E478;
    v23[3] = &unk_113F98;
    BOOL v27 = a4;
    id v24 = v29;
    int64_t v26 = a5;
    id v25 = v30;
    unsigned __int8 v21 = [a1 performWriteTransactionWithHealthDatabase:v20 error:a7 block:v28 inaccessibilityHandler:v23];
  }
  else
  {
    unsigned __int8 v21 = 1;
  }

  return v21;
}

+ (id)accountEntityForCodableRecord:(id)a3 issuerIdentifierToAccountMap:(id)a4 gatewayExternalIDToAccountMap:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a3;
  id v16 = [v15 gatewayExternalID];

  if (v16)
  {
    id v17 = [v15 gatewayExternalID];

    [a1 _lookUpAccountByGatewayExternalID:v17 gatewayExternalIDToAccountMap:v13 database:v14 error:a7];
  }
  else
  {
    id v17 = [v15 issuerIdentifier];

    [a1 _lookUpAccountByIssuerIdentifier:v17 issuerIdentifierToAccountMap:v12 database:v14 error:a7];
  id v18 = };

  return v18;
}

+ (id)_lookUpAccountByIssuerIdentifier:(id)a3 issuerIdentifierToAccountMap:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 objectForKeyedSubscript:v10];
  if (!v13)
  {
    id v24 = 0;
    id v13 = +[HDClinicalAccountEntity existingAccountEntityForSignedClinicalDataIssuerWithIdentifier:v10 database:v12 error:&v24];
    id v14 = v24;
    if (v13)
    {
      [v11 setObject:v13 forKeyedSubscript:v10];
    }
    else
    {
      _HKInitializeLogging();
      id v15 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v18 = v15;
        id v19 = (objc_class *)objc_opt_class();
        id v20 = NSStringFromClass(v19);
        unsigned __int8 v21 = NSStringFromSelector(a2);
        id v22 = HKSensitiveLogItem();
        int64_t v23 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138544130;
        int64_t v26 = v20;
        __int16 v27 = 2114;
        id v28 = v21;
        __int16 v29 = 2114;
        id v30 = v22;
        __int16 v31 = 2114;
        int64_t v32 = v23;
        _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to retrieve account for issuer %{public}@ with error: %{public}@", buf, 0x2Au);
      }
      id v16 = v14;
      if (v16)
      {
        if (a6) {
          *a6 = v16;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v13 = 0;
    }
  }

  return v13;
}

+ (id)_lookUpAccountByGatewayExternalID:(id)a3 gatewayExternalIDToAccountMap:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 objectForKeyedSubscript:v10];
  if (!v13)
  {
    id v24 = 0;
    id v13 = +[HDClinicalAccountEntity existingAccountEntityForGatewayWithExternalID:v10 database:v12 error:&v24];
    id v14 = v24;
    if (v13)
    {
      [v11 setObject:v13 forKeyedSubscript:v10];
    }
    else
    {
      _HKInitializeLogging();
      id v15 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v18 = v15;
        id v19 = (objc_class *)objc_opt_class();
        id v20 = NSStringFromClass(v19);
        unsigned __int8 v21 = NSStringFromSelector(a2);
        id v22 = HKSensitiveLogItem();
        int64_t v23 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138544130;
        int64_t v26 = v20;
        __int16 v27 = 2114;
        id v28 = v21;
        __int16 v29 = 2114;
        id v30 = v22;
        __int16 v31 = 2114;
        int64_t v32 = v23;
        _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to retrieve account for gateway %{public}@ with error: %{public}@", buf, 0x2Au);
      }
      id v16 = v14;
      if (v16)
      {
        if (a6) {
          *a6 = v16;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v13 = 0;
    }
  }

  return v13;
}

- (BOOL)storeSignedClinicalDataItem:(id)a3 account:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v115 = a3;
  id v112 = a4;
  v106 = self;
  id v113 = a5;
  v111 = a6;
  v117 = -[HDOriginalSignedClinicalDataRecordEntity syncIdentifierWithProfile:error:](self, "syncIdentifierWithProfile:error:");
  if (!v117) {
    goto LABEL_28;
  }
  id v10 = [v115 originalRecord];
  id v11 = [v10 syncIdentifier];
  unsigned __int8 v12 = [v117 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    CFStringRef v46 = @"original signed clinical data record's sync identifier does not match the entity's sync identifier";
LABEL_27:
    +[NSError hk_assignError:v111 code:3 description:v46];
LABEL_28:
    BOOL v47 = 0;
    goto LABEL_29;
  }
  id v13 = [v115 mainRecord];
  id v14 = [v13 originIdentifier];
  id v15 = [v14 signedClinicalDataRecordIdentifier];
  unsigned __int8 v16 = [v117 isEqual:v15];

  if ((v16 & 1) == 0)
  {
    CFStringRef v46 = @"signed clinical data record's origin does not match original record's sync identifier";
    goto LABEL_27;
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v17 = [v115 medicalRecords];
  id v18 = [v17 countByEnumeratingWithState:&v149 objects:v159 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v150;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v150 != v19) {
          objc_enumerationMutation(v17);
        }
        unsigned __int8 v21 = [*(id *)(*((void *)&v149 + 1) + 8 * i) originIdentifier];
        id v22 = [v21 signedClinicalDataRecordIdentifier];
        unsigned __int8 v23 = [v117 isEqual:v22];

        if ((v23 & 1) == 0)
        {
          +[NSError hk_assignError:v111 code:3 description:@"medical record's origin does not match original record's sync identifier"];

          goto LABEL_28;
        }
      }
      id v18 = [v17 countByEnumeratingWithState:&v149 objects:v159 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v24 = [v115 clinicalRecords];
  id v25 = [v24 countByEnumeratingWithState:&v145 objects:v158 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v146;
    uint64_t v27 = _HKPrivateMetadataKeyOriginalSignedClinicalDataRecordSyncIdentifier;
    while (2)
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v146 != v26) {
          objc_enumerationMutation(v24);
        }
        __int16 v29 = *(void **)(*((void *)&v145 + 1) + 8 * (void)j);
        id v30 = [v117 UUIDString];
        __int16 v31 = [v29 metadata];
        int64_t v32 = [v31 objectForKeyedSubscript:v27];
        unsigned __int8 v33 = [v30 isEqualToString:v32];

        if ((v33 & 1) == 0)
        {
          +[NSError hk_assignError:v111 code:3 description:@"clinical record's origin metadata entry does not match original record's sync identifier"];

          goto LABEL_28;
        }
      }
      id v25 = [v24 countByEnumeratingWithState:&v145 objects:v158 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v34 = [v115 verifiableClinicalRecord];
  v35 = [v34 originIdentifier];
  unsigned __int8 v36 = [v117 isEqual:v35];

  if ((v36 & 1) == 0)
  {
    +[NSError hk_assignError:v111 code:3 description:@"verifiable record's origin does not match original record's sync identifier"];
    goto LABEL_28;
  }
  id v37 = [v115 mainRecord];
  v157 = v37;
  __int16 v38 = +[NSArray arrayWithObjects:&v157 count:1];
  v39 = [v115 medicalRecords];
  v103 = [v38 arrayByAddingObjectsFromArray:v39];

  v104 = [(HDOriginalSignedClinicalDataRecordEntity *)v106 existingDerivedMedicalRecordsOnProfile:v113 error:v111];
  if (v104)
  {
    id v40 = objc_alloc_init((Class)NSMutableDictionary);
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_6F7B4;
    v142[3] = &unk_113FC0;
    id v41 = v103;
    id v143 = v41;
    id v114 = v40;
    id v144 = v114;
    v101 = objc_msgSend(v104, "hk_filter:", v142);
    v140[0] = _NSConcreteStackBlock;
    v140[1] = 3221225472;
    v140[2] = sub_6F944;
    v140[3] = &unk_113FE8;
    id v42 = v104;
    id v141 = v42;
    v99 = objc_msgSend(v41, "hk_filter:", v140);
    if ([v114 count])
    {
      v43 = objc_msgSend(v99, "hk_firstObjectPassingTest:", &stru_114028);
      id v44 = v43;
      if (v43)
      {
        id v45 = v43;
      }
      else
      {
        objc_msgSend(v42, "hk_firstObjectPassingTest:", &stru_114048);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      v49 = v45;

      v50 = [v49 items];
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_6FA94;
      v138[3] = &unk_114070;
      id v139 = v114;
      v51 = objc_msgSend(v50, "hk_map:", v138);
      [v49 _setItems:v51];
    }
    id v52 = [v115 clinicalRecords];
    id v116 = [v52 mutableCopy];

    v100 = [(HDOriginalSignedClinicalDataRecordEntity *)v106 existingDerivedClinicalRecordsOnProfile:v113 error:v111];
    if (v100)
    {
      id v108 = objc_alloc_init((Class)NSMutableArray);
      id v105 = objc_alloc_init((Class)NSMutableDictionary);
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      id obj = v100;
      id v53 = [obj countByEnumeratingWithState:&v134 objects:v156 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v135;
        do
        {
          for (k = 0; k != v53; k = (char *)k + 1)
          {
            if (*(void *)v135 != v54) {
              objc_enumerationMutation(obj);
            }
            uint64_t v56 = *(void *)(*((void *)&v134 + 1) + 8 * (void)k);
            v133[0] = _NSConcreteStackBlock;
            v133[1] = 3221225472;
            v133[2] = sub_6FB24;
            v133[3] = &unk_114098;
            v133[4] = v56;
            id v57 = [v116 indexOfObjectPassingTest:v133];
            if (v57 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              [v108 addObject:v56];
            }
            else
            {
              v58 = [v116 objectAtIndex:v57];
              [v116 removeObjectAtIndex:v57];
              id v59 = objc_msgSend(v58, "hrplug_medicalRecordUUIDFromPrivateMetadata");
              if (v59)
              {
                uint64_t v60 = [v114 objectForKeyedSubscript:v59];
                id v61 = (void *)v60;
                if (v60) {
                  id v62 = (void *)v60;
                }
                else {
                  id v62 = v59;
                }
                id v63 = v62;

                [v105 setObject:v63 forKeyedSubscript:v56];
              }
            }
          }
          id v53 = [obj countByEnumeratingWithState:&v134 objects:v156 count:16];
        }
        while (v53);
      }

      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v64 = v116;
      id v65 = [v64 countByEnumeratingWithState:&v129 objects:v155 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v130;
        do
        {
          for (m = 0; m != v65; m = (char *)m + 1)
          {
            if (*(void *)v130 != v66) {
              objc_enumerationMutation(v64);
            }
            id v68 = *(void **)(*((void *)&v129 + 1) + 8 * (void)m);
            id v69 = objc_msgSend(v68, "hrplug_medicalRecordUUIDFromPrivateMetadata");
            if (v69)
            {
              v70 = [v114 objectForKeyedSubscript:v69];
              id v71 = v70;
              if (v70 && ([v70 isEqual:v69] & 1) == 0) {
                objc_msgSend(v68, "hrplug_updateMedicalRecordUUIDInPrivateMetadataToUUID:", v71);
              }
            }
          }
          id v65 = [v64 countByEnumeratingWithState:&v129 objects:v155 count:16];
        }
        while (v65);
      }

      id v98 = [v64 copy];
      id obja = [v101 arrayByAddingObjectsFromArray:v108];

      __int16 v72 = [(HDOriginalSignedClinicalDataRecordEntity *)v106 existingDerivedVerifiableClinicalRecordsOnProfile:v113 error:v111];
      v73 = v72;
      if (v72)
      {
        uint64_t v125 = 0;
        v126 = &v125;
        uint64_t v127 = 0x2020000000;
        char v128 = 1;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_6FB30;
        v122[3] = &unk_1140C0;
        id v97 = v115;
        id v123 = v97;
        v124 = &v125;
        v102 = objc_msgSend(v72, "hk_filter:", v122);
        __int16 v74 = [obja arrayByAddingObjectsFromArray:v102];
        v107 = v74;
        if ([v74 count])
        {
          v75 = [v113 dataManager];
          unsigned __int8 v76 = [v75 deleteDataObjects:v74 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:v111];

          if ((v76 & 1) == 0) {
            goto LABEL_89;
          }
        }
        if ([v99 count])
        {
          v77 = [v112 identifier];
          unsigned __int8 v78 = +[HDMedicalRecordEntity _insertMedicalRecords:v99 accountIdentifier:v77 profile:v113 error:v111];

          if ((v78 & 1) == 0) {
            goto LABEL_89;
          }
        }
        if ([v98 count])
        {
          v79 = [v112 gateway];
          v80 = [v79 externalID];
          v81 = v80;
          if (!v80)
          {
            id v65 = [v112 signedClinicalDataIssuer];
            v81 = [v65 identifier];
          }
          unsigned __int8 v82 = +[HDClinicalRecordEntity _insertClinicalRecords:v98 clinicalExternalID:v81 profile:v113 error:v111];
          if (!v80)
          {
          }
          __int16 v74 = v107;
          if ((v82 & 1) == 0) {
            goto LABEL_89;
          }
        }
        if ([v105 count])
        {
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          v83 = [v105 keyEnumerator];
          id v84 = [v83 countByEnumeratingWithState:&v118 objects:v154 count:16];
          if (v84)
          {
            uint64_t v85 = *(void *)v119;
            uint64_t v86 = _HKPrivateMetadataKeyMedicalRecordUUID;
            while (2)
            {
              for (n = 0; n != v84; n = (char *)n + 1)
              {
                if (*(void *)v119 != v85) {
                  objc_enumerationMutation(v83);
                }
                uint64_t v88 = *(void *)(*((void *)&v118 + 1) + 8 * (void)n);
                v89 = [v105 objectForKeyedSubscript:v88];
                v90 = [v113 metadataManager];
                v91 = [v89 UUIDString];
                LOBYTE(v88) = [v90 updateMetadataValue:v91 forKey:v86 object:v88 error:v111];

                if ((v88 & 1) == 0)
                {

                  BOOL v47 = 0;
                  __int16 v74 = v107;
                  goto LABEL_90;
                }
              }
              id v84 = [v83 countByEnumeratingWithState:&v118 objects:v154 count:16];
              if (v84) {
                continue;
              }
              break;
            }
          }

          __int16 v74 = v107;
        }
        if (!*((unsigned char *)v126 + 24)) {
          goto LABEL_87;
        }
        v92 = [v97 verifiableClinicalRecord];
        v153 = v92;
        v93 = +[NSArray arrayWithObjects:&v153 count:1];
        v94 = [v112 gateway];
        v95 = [v94 externalID];
        unsigned __int8 v96 = +[HDVerifiableClinicalRecordEntity insertRecords:v93 gatewayExternalID:v95 profile:v113 error:v111];

        __int16 v74 = v107;
        if ((v96 & 1) == 0) {
LABEL_89:
        }
          BOOL v47 = 0;
        else {
LABEL_87:
        }
          BOOL v47 = 1;
LABEL_90:

        _Block_object_dispose(&v125, 8);
        v73 = v72;
      }
      else
      {
        BOOL v47 = 0;
      }

      v101 = obja;
    }
    else
    {
      BOOL v47 = 0;
    }
  }
  else
  {
    BOOL v47 = 0;
  }

LABEL_29:
  return v47;
}

- (id)syncIdentifierWithProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = HDOriginalSignedClinicalDataRecordEntityPropertySyncIdentifier;
  uint64_t v7 = [a3 database];
  id v14 = 0;
  int v8 = [(HDOriginalSignedClinicalDataRecordEntity *)self valueForProperty:v6 healthDatabase:v7 error:&v14];
  id v9 = v14;

  if (v8)
  {
    id v10 = +[NSUUID hk_UUIDWithData:v8];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      +[NSError hk_assignError:a4, 100, @"unable to construct UUID from data %@", v8 code format];
    }

    goto LABEL_12;
  }
  if (v9)
  {
    if (a4)
    {
      id v11 = 0;
      *a4 = v9;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else
  {
    +[NSError hk_assignError:a4, 118, @"sync identifier for %@ not found", self code format];
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

+ (HDOriginalSignedClinicalDataRecordEntity)entityWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_6FE50;
  unsigned __int8 v23 = sub_6FE60;
  id v24 = 0;
  id v10 = [v9 database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6FE68;
  v15[3] = &unk_1128B0;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return (HDOriginalSignedClinicalDataRecordEntity *)v13;
}

+ (id)existingEntityWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  id v9 = [a1 entityWithSyncIdentifier:v8 profile:a4 error:&v14];
  id v10 = v14;
  id v11 = v10;
  if (v9)
  {
    id v12 = v9;
  }
  else if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }
  else
  {
    +[NSError hk_assignError:a5, 118, @"original signed clinical data record with sync identifier %@ not found", v8 code format];
  }

  return v9;
}

+ (id)existingEntityWithUniquenessChecksum:(id)a3 account:(id)a4 database:(id)a5 error:(id *)a6
{
  uint64_t v9 = HDOriginalSignedClinicalDataRecordEntityPropertyAccountROWID;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a4 persistentID]);
  id v13 = +[HDSQLiteComparisonPredicate predicateWithProperty:v9 equalToValue:v12];

  id v14 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDOriginalSignedClinicalDataRecordEntityPropertyUniquenessChecksum equalToValue:v11];

  v20[0] = v13;
  v20[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v20 count:2];
  id v16 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  id v17 = +[HDOriginalSignedClinicalDataRecordEntity anyInDatabase:v10 predicate:v16 error:a6];

  if (v17) {
    id v18 = v17;
  }
  else {
    +[NSError hk_assignError:a6 code:118 description:@"No entity with the given uniqueness checksum found"];
  }

  return v17;
}

+ (id)existingEntityBackingMedicalRecord:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 originIdentifier];
  id v11 = [v10 signedClinicalDataRecordIdentifier];

  if (v11)
  {
    id v12 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithSyncIdentifier:v11 profile:v9 error:a5];
    id v13 = v12;
    if (v12)
    {
      id v13 = v12;
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    NSStringFromClass((Class)a1);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [v8 UUID];
    id v16 = [v8 originIdentifier];
    +[NSError hk_assignError:a5, 3, @"%@.existingEntityBackingMedicalRecord can only accept medical records backed by an SCD record, %@ however is backed by %@", v13, v15, v16 code format];

    id v14 = 0;
  }

  return v14;
}

- (id)signedClinicalDataRecordWithProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = HDMedicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID;
  id v7 = a3;
  id v8 = +[NSNumber numberWithLongLong:[(HDOriginalSignedClinicalDataRecordEntity *)self persistentID]];
  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 equalToValue:v8];

  id v10 = +[HKSignedClinicalDataRecordType signedClinicalDataRecordType];
  id v11 = +[HDSignedClinicalDataRecordEntity samplesWithType:v10 profile:v7 encodingOptions:0 predicate:v9 limit:kHDSQLiteQueryNoLimit anchor:0 error:a4];

  if (v11)
  {
    id v12 = [v11 firstObject];
    if (v12)
    {
      if ((unint64_t)[v11 count] >= 2)
      {
        _HKInitializeLogging();
        id v13 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_B1B9C(v13, self);
        }
      }
      id v14 = v12;
    }
    else
    {
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      +[NSError hk_assignError:a4, 118, @"%@ was unable to find any HKSignedClinicalDataRecord associated with persistent ID %lu", v16, [(HDOriginalSignedClinicalDataRecordEntity *)self persistentID] code format];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_predicateForUnextractedOriginalRecordsWithExtractionVersion:(int64_t)a3 ignoreExtractionVersion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[NSNumber numberWithInteger:a3];
  id v7 = [a1 disambiguatedDatabaseTable];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = HDMedicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID;
  uint64_t v10 = +[HDSQLiteJoinClause leftJoinClauseFromTable:v7 toTargetEntity:v8 as:0 localReference:HDSQLEntityPropertyPersistentID targetKey:HDMedicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID];

  id v11 = +[HDMedicalRecordEntity disambiguatedDatabaseTable];
  uint64_t v12 = +[HDSQLiteJoinClause leftJoinClauseFromTable:v11 toTargetEntity:objc_opt_class() as:0 localReference:HDDataEntityPropertyDataID targetKey:HDDataEntityPropertyDataID];

  unsigned __int8 v36 = (void *)v12;
  id v37 = (void *)v10;
  id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v12, 0);
  v35 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v13];

  id v14 = +[HDSQLiteNullPredicate isNullPredicateWithProperty:v9];
  id v15 = +[HDSignedClinicalDataRecordEntity disambiguatedDatabaseTable];
  uint64_t v16 = +[NSString stringWithFormat:@"%@.%@", v15, HDSignedClinicalDataRecordEntityPropertyIssuerIdentifier];

  id v34 = (void *)v16;
  id v17 = +[HDSQLiteNullPredicate isNotNullPredicateWithProperty:v16];
  id v18 = v17;
  uint64_t v19 = HDExtractionResultItem_ptr;
  id v20 = (void *)v6;
  if (v4)
  {
    id v21 = v17;
  }
  else
  {
    id v22 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalRecordEntityPropertyExtractionVersion value:v6 comparisonType:3];
    v41[0] = v22;
    v41[1] = v18;
    unsigned __int8 v23 = +[NSArray arrayWithObjects:v41 count:2];
    uint64_t v19 = HDExtractionResultItem_ptr;
    id v21 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v23];
  }
  id v24 = v19[33];
  v40[0] = v14;
  v40[1] = v21;
  id v25 = +[NSArray arrayWithObjects:v40 count:2];
  uint64_t v26 = [v24 predicateMatchingAnyPredicates:v25];

  uint64_t v27 = [v26 SQLForEntityClass:objc_opt_class()];
  if (v4)
  {
    id v28 = +[HDSQLiteRawPredicate predicateWithSQL:v27 overProperties:&__NSArray0__struct values:&__NSArray0__struct];
  }
  else
  {
    v39 = v20;
    __int16 v29 = +[NSArray arrayWithObjects:&v39 count:1];
    id v28 = +[HDSQLiteRawPredicate predicateWithSQL:v27 overProperties:&__NSArray0__struct values:v29];
  }
  id v30 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDOriginalSignedClinicalDataRecordEntityPropertyDeleted notEqualToValue:&__kCFBooleanTrue];
  v38[0] = v30;
  v38[1] = v28;
  v38[2] = v35;
  __int16 v31 = +[NSArray arrayWithObjects:v38 count:3];
  int64_t v32 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v31];

  return v32;
}

+ (id)unextractedOriginalRecordsOnProfile:(id)a3 extractionVersion:(int64_t)a4 ignoreExtractionVersion:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v12 = [v10 database];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_709E0;
  v17[3] = &unk_1140E8;
  id v19 = a1;
  int64_t v20 = a4;
  BOOL v21 = a5;
  id v18 = v11;
  id v13 = v11;
  LODWORD(a6) = [a1 performReadTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)rawContentOnProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = HDOriginalSignedClinicalDataRecordEntityPropertyRawContent;
  id v7 = [a3 database];
  id v14 = 0;
  uint64_t v8 = [(HDOriginalSignedClinicalDataRecordEntity *)self valueForProperty:v6 healthDatabase:v7 error:&v14];
  id v9 = v14;

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      goto LABEL_11;
    }
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    +[NSError hk_assignError:a4, 100, @"raw content for %@ is not NSData but %@", self, v12 code format];
  }
  else if (v9)
  {
    if (a4)
    {
      id v10 = 0;
      *a4 = v9;
      goto LABEL_11;
    }
    _HKLogDroppedError();
  }
  else
  {
    +[NSError hk_assignError:a4, 118, @"no raw content found for %@", self code format];
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)codableOriginalRecordForHKRecord:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  int64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_6FE50;
  unsigned __int8 v23 = sub_6FE60;
  id v24 = 0;
  id v9 = [v8 database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_70E3C;
  v15[3] = &unk_112EB0;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v18 = &v19;
  LODWORD(a5) = +[HDOriginalSignedClinicalDataRecordEntity performReadTransactionWithHealthDatabase:v9 error:a5 block:v15];

  if (a5) {
    uint64_t v12 = (void *)v20[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)codableInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() propertiesForCodable];
  uint64_t v19 = 0;
  int64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_6FE50;
  unsigned __int8 v23 = sub_6FE60;
  id v24 = 0;
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = sub_6FE50;
  v17[3] = sub_6FE60;
  id v18 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_71174;
  v15[3] = &unk_1133D0;
  void v15[4] = self;
  v15[5] = &v19;
  v15[6] = &v16;
  unsigned int v8 = [(HDOriginalSignedClinicalDataRecordEntity *)self getValuesForProperties:v7 database:v6 handler:v15];
  if (!v20[5])
  {
    _HKInitializeLogging();
    id v9 = HKLogHealthRecords;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_B1C34((uint64_t)v17, buf, (uint64_t)[(HDOriginalSignedClinicalDataRecordEntity *)self persistentID], v9);
    }

    id v10 = *(id *)(v17[0] + 40);
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v8) {
    uint64_t v12 = (void *)v20[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v19, 8);

  return v13;
}

+ (id)_predicateForUndeletedRecordsOnAccountEntity:(id)a3
{
  uint64_t v3 = HDOriginalSignedClinicalDataRecordEntityPropertyAccountROWID;
  BOOL v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  id v6 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDOriginalSignedClinicalDataRecordEntityPropertyDeleted equalToValue:&__kCFBooleanFalse];
  v10[0] = v5;
  v10[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  unsigned int v8 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (BOOL)enumerateActiveEntitiesForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a4 database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_71418;
  v16[3] = &unk_114138;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

+ (BOOL)enumerateActiveRecordsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7179C;
  v13[3] = &unk_114160;
  id v14 = a4;
  id v15 = a6;
  id v10 = v15;
  id v11 = v14;
  LOBYTE(a5) = [a1 enumerateActiveEntitiesForAccountIdentifier:a3 profile:v11 error:a5 block:v13];

  return (char)a5;
}

+ (BOOL)enumerateActiveCodableRecordsForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_718BC;
  v12[3] = &unk_114188;
  id v13 = a6;
  id v10 = v13;
  LOBYTE(a5) = [a1 enumerateActiveEntitiesForAccountIdentifier:a3 profile:a4 error:a5 block:v12];

  return (char)a5;
}

+ (BOOL)replaceOriginalRecordWithSyncIdentifier:(id)a3 newSignatureStatus:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v11 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_71A88;
  v20[3] = &unk_1128D8;
  id v21 = v10;
  id v22 = v11;
  int64_t v23 = a4;
  id v24 = a1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_71CBC;
  v16[3] = &unk_112900;
  id v18 = v22;
  int64_t v19 = a4;
  id v17 = v21;
  id v13 = v22;
  id v14 = v21;
  LOBYTE(a6) = +[HDOriginalSignedClinicalDataRecordEntity performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

- (int64_t)updateUniquenessChecksumIfNecessaryWithItem:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = HDOriginalSignedClinicalDataRecordEntityPropertyUniquenessChecksum;
  id v11 = [(HDOriginalSignedClinicalDataRecordEntity *)self valueForProperty:HDOriginalSignedClinicalDataRecordEntityPropertyUniquenessChecksum database:v9];
  if (v11)
  {
    objc_opt_class();
    uint64_t v12 = HKSafeObject();
    if (v12)
    {
      id v13 = [v8 uniquenessChecksum];
      unsigned __int8 v14 = [v12 isEqual:v13];

      if (v14)
      {
        int64_t v15 = 2;
      }
      else
      {
        uint64_t v20 = v10;
        uint64_t v16 = +[NSArray arrayWithObjects:&v20 count:1];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_71F2C;
        v18[3] = &unk_111B40;
        id v19 = v8;
        LODWORD(v15) = [(HDOriginalSignedClinicalDataRecordEntity *)self updateProperties:v16 database:v9 error:a5 bindingHandler:v18];

        int64_t v15 = v15;
      }
    }
    else
    {
      int64_t v15 = 0;
    }
  }
  else
  {
    +[NSError hk_assignError:a5, 118, @"there is no uniqueness checksum on original record with ROWID %llu", [(HDOriginalSignedClinicalDataRecordEntity *)self persistentID] code format];
    int64_t v15 = 0;
  }

  return v15;
}

- (BOOL)_deleteDerivedRecordsWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(HDOriginalSignedClinicalDataRecordEntity *)self existingDerivedMedicalRecordsOnProfile:v7 error:a5];
  if (v8
    && ([v7 dataManager],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 deleteDataObjects:v8 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a5], v9, v10))
  {
    id v11 = [(HDOriginalSignedClinicalDataRecordEntity *)self existingDerivedClinicalRecordsOnProfile:v7 error:a5];
    if (v11
      && ([v7 dataManager],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 deleteDataObjects:v11 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a5], v12, v13))
    {
      unsigned __int8 v14 = [(HDOriginalSignedClinicalDataRecordEntity *)self existingDerivedVerifiableClinicalRecordsOnProfile:v7 error:a5];
      if (v14)
      {
        int64_t v15 = [v7 dataManager];
        unsigned __int8 v16 = [v15 deleteDataObjects:v14 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a5];
      }
      else
      {
        unsigned __int8 v16 = 0;
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)deleteDerivedRecordsOnProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 database];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_721C4;
  v10[3] = &unk_1141B0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a4) = +[HDOriginalSignedClinicalDataRecordEntity performWriteTransactionWithHealthDatabase:v7 error:a4 block:v10];

  return (char)a4;
}

- (BOOL)deleteOriginalAndDerivedRecordsOnProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 database];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_722AC;
  v10[3] = &unk_1141B0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a4) = +[HDOriginalSignedClinicalDataRecordEntity performWriteTransactionWithHealthDatabase:v7 error:a4 block:v10];

  return (char)a4;
}

- (id)existingDerivedMedicalRecordsOnProfile:(id)a3 error:(id *)a4
{
  return [(HDOriginalSignedClinicalDataRecordEntity *)self existingDerivedMedicalRecordsOnProfile:a3 excludeMainRecord:0 error:a4];
}

- (id)existingDerivedMedicalRecordsOnProfile:(id)a3 excludeMainRecord:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = HDMedicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID;
  unsigned int v10 = +[NSNumber numberWithLongLong:[(HDOriginalSignedClinicalDataRecordEntity *)self persistentID]];
  id v11 = +[HDSQLiteComparisonPredicate predicateWithProperty:v9 equalToValue:v10];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_6FE50;
  id v28 = sub_6FE60;
  id v29 = 0;
  uint64_t v12 = objc_opt_class();
  unsigned int v13 = [v8 database];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_72658;
  v18[3] = &unk_1141D8;
  id v22 = &v24;
  id v14 = v11;
  BOOL v23 = a4;
  id v19 = v14;
  uint64_t v20 = self;
  id v15 = v8;
  id v21 = v15;
  LOBYTE(a5) = [v12 performReadTransactionWithHealthDatabase:v13 error:a5 block:v18];

  if (a5) {
    id v16 = (id)v25[5];
  }
  else {
    id v16 = 0;
  }

  _Block_object_dispose(&v24, 8);

  return v16;
}

- (id)existingDerivedClinicalRecordsOnProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = HDClinicalRecordEntityPropertyOriginalSignedClinicalDataRecordROWID;
  id v7 = a3;
  id v8 = +[NSNumber numberWithLongLong:[(HDOriginalSignedClinicalDataRecordEntity *)self persistentID]];
  uint64_t v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 equalToValue:v8];

  unsigned int v10 = +[HDClinicalRecordEntity _clinicalRecordsWithPredicate:v9 profile:v7 error:a4];

  return v10;
}

- (id)existingDerivedVerifiableClinicalRecordsOnProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDOriginalSignedClinicalDataRecordEntity *)self syncIdentifierWithProfile:v6 error:a4];
  if (v7)
  {
    id v8 = [(id)objc_opt_class() existingDerivedVerifiableClinicalRecordsForRecordWithSyncIdentifier:v7 profile:v6 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)existingDerivedVerifiableClinicalRecordsForRecordWithSyncIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v7 = HDVerifiableClinicalRecordEntityPropertyOriginIdentifier;
  id v8 = a4;
  uint64_t v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v7 equalToValue:a3];
  unsigned int v10 = +[HKVerifiableClinicalRecordType verifiableClinicalRecordType];
  id v11 = +[HDVerifiableClinicalRecordEntity samplesWithType:v10 profile:v8 encodingOptions:0 predicate:v9 limit:kHDSQLiteQueryNoLimit anchor:0 error:a5];

  return v11;
}

@end