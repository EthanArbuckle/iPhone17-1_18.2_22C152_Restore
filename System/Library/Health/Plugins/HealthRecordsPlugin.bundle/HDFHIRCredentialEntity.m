@interface HDFHIRCredentialEntity
+ (BOOL)_insertCodableCredentialFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_shouldReplaceCurrentCredential:(id)a3 withIncomingCredential:(id)a4 account:(id)a5 profile:(id)a6 recordEvent:(id *)a7 error:(id *)a8;
+ (BOOL)insertCodableCredentialsFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)_credentialWithRow:(HDSQLiteRow *)a3;
+ (id)_insertCodableCredential:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (id)_insertCredential:(id)a3 receivedDate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)allProperties;
+ (id)codableCredentialWithAccountSyncIdentifier:(id)a3 persistentID:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)codableWithRow:(HDSQLiteRow *)a3 accountSyncIdentifier:(id)a4;
+ (id)credentialWithPersistentID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)insertCredential:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
- (id)credentialInDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDFHIRCredentialEntity

+ (id)allProperties
{
  v4[0] = HDFHIRCredentialEntityPropertyIdentifier;
  v4[1] = HDFHIRCredentialEntityPropertySyncProvenance;
  v4[2] = HDFHIRCredentialEntityPropertyCreationDate;
  v4[3] = HDFHIRCredentialEntityPropertyExpirationDate;
  v4[4] = HDFHIRCredentialEntityPropertyRequestedScope;
  v4[5] = HDFHIRCredentialEntityPropertyScope;
  v4[6] = HDFHIRCredentialEntityPropertyPatientID;
  v4[7] = HDFHIRCredentialEntityPropertyDeleted;
  v4[8] = HDFHIRCredentialEntityPropertySyncIdentity;
  v2 = +[NSArray arrayWithObjects:v4 count:9];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return HDFHIRCredentialEntityPropertySyncProvenance;
}

+ (id)propertyForSyncIdentity
{
  return HDFHIRCredentialEntityPropertySyncIdentity;
}

+ (id)_credentialWithRow:(HDSQLiteRow *)a3
{
  if (!a3)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDFHIRCredentialEntity+HealthRecordsPlugin.m", 61, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  v3 = HDSQLiteColumnWithNameAsUUID();
  v4 = HDSQLiteColumnWithNameAsDate();
  v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsString();
  v7 = HDSQLiteColumnWithNameAsString();
  v8 = [[HDFHIRCredential alloc] initWithIdentifier:v3 requestedScopeString:v7 expiration:v4 scopeString:v5 patientID:v6];

  return v8;
}

+ (id)codableWithRow:(HDSQLiteRow *)a3 accountSyncIdentifier:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HDFHIRCredentialEntity+HealthRecordsPlugin.m", 79, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v16 = +[NSAssertionHandler currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"HDFHIRCredentialEntity+HealthRecordsPlugin.m", 80, @"Invalid parameter not satisfying: %@", @"accountSyncIdentifier != nil" object file lineNumber description];

LABEL_3:
  v9 = [a1 _credentialWithRow:a3];
  v10 = HDSQLiteColumnWithNameAsDate();
  int v11 = HDSQLiteColumnWithNameAsBoolean();
  v12 = [v9 asNewCodableForAccountSyncIdentifier:v8 receivedDate:v10];
  v13 = v12;
  if (v11) {
    [v12 setDeleted:1];
  }

  return v13;
}

+ (id)codableCredentialWithAccountSyncIdentifier:(id)a3 persistentID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[HDFHIRCredentialEntity entityWithPersistentID:v11];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_57658;
  v30 = sub_57668;
  id v31 = 0;
  v14 = [(id)objc_opt_class() allProperties];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_57670;
  v22 = &unk_113928;
  v24 = &v26;
  id v25 = a1;
  id v15 = v10;
  id v23 = v15;
  LOBYTE(v10) = [v13 getValuesForProperties:v14 database:v12 handler:&v19];

  if (v10)
  {
    id v16 = (id)v27[5];
  }
  else
  {
    id v17 = [v13 persistentID];
    +[NSError hk_assignError:a6, 100, @"Failed to populate FHIR credential object from credential entity %lld", v17, v19, v20, v21, v22 code format];
    id v16 = 0;
  }

  _Block_object_dispose(&v26, 8);

  return v16;
}

- (id)credentialInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_57658;
  id v16 = sub_57668;
  id v17 = 0;
  id v7 = [(id)objc_opt_class() allProperties];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_57854;
  v11[3] = &unk_112888;
  v11[4] = self;
  v11[5] = &v12;
  unsigned __int8 v8 = [(HDFHIRCredentialEntity *)self getValuesForProperties:v7 database:v6 handler:v11];

  if (v8)
  {
    id v9 = (id)v13[5];
  }
  else
  {
    +[NSError hk_assignError:a4, 100, @"Failed to populate FHIR credential object from credential entity %lld", [(HDFHIRCredentialEntity *)self persistentID] code format];
    id v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)credentialWithPersistentID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a4;
  unsigned __int8 v8 = +[HDFHIRCredentialEntity entityWithPersistentID:a3];
  id v9 = [v8 credentialInDatabase:v7 error:a5];

  return v9;
}

+ (BOOL)insertCodableCredentialsFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v11 healthRecordsExtension];
  v13 = [v12 accountManager];

  if (v13)
  {
    uint64_t v26 = v13;
    id v27 = v10;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v18);
          id v30 = 0;
          unsigned __int8 v20 = objc_msgSend(a1, "_insertCodableCredentialFromSync:syncProvenance:profile:error:", v19, a4, v11, &v30, v26, v27);
          id v21 = v30;
          if ((v20 & 1) == 0)
          {
            _HKInitializeLogging();
            v22 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              log = v22;
              id v23 = (objc_class *)objc_opt_class();
              uint64_t v28 = NSStringFromClass(v23);
              v24 = [v19 accountSyncIdentifier];
              *(_DWORD *)buf = 138543874;
              v36 = v28;
              __int16 v37 = 2114;
              v38 = v24;
              __int16 v39 = 2114;
              id v40 = v21;
              _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ did not insert incoming credential for account with sync identifier %{public}@, ignoring. Error: %{public}@", buf, 0x20u);
            }
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v16);
    }

    v13 = v26;
    id v10 = v27;
  }
  else
  {
    +[NSError hk_assignError:a6 code:127 format:@"Credential sync is not supported for profiles without a clinical account manager."];
  }

  return v13 != 0;
}

+ (BOOL)_insertCodableCredentialFromSync:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v30[0] = 0;
  uint64_t v12 = +[HDFHIRCredential credentialFromCodable:v10 accountSyncIdentifier:v30 ifValidWithError:0];
  id v13 = v30[0];
  id v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AF84C();
    }
    unsigned __int8 v17 = 1;
  }
  else
  {
    id v16 = [v11 database];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_57DA8;
    v23[3] = &unk_113950;
    id v28 = a1;
    id v24 = v14;
    id v25 = v10;
    id v26 = v11;
    id v27 = v12;
    int64_t v29 = a4;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_583FC;
    v19[3] = &unk_112900;
    id v20 = v25;
    int64_t v22 = a4;
    id v21 = v26;
    unsigned __int8 v17 = [a1 performWriteTransactionWithHealthDatabase:v16 error:a6 block:v23 inaccessibilityHandler:v19];
  }
  return v17;
}

+ (BOOL)_shouldReplaceCurrentCredential:(id)a3 withIncomingCredential:(id)a4 account:(id)a5 profile:(id)a6 recordEvent:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [a6 healthRecordsExtension];
  unsigned __int8 v17 = [v16 accountManager];

  if (v17)
  {
    v18 = [v17 credentialFromCodableCredential:v14];
    if (v13)
    {
      v19 = [v17 credentialFromCodableCredential:v13];
    }
    else
    {
      v19 = 0;
    }
    if ([v14 hasDeleted] && objc_msgSend(v14, "deleted"))
    {
      a8 = (id *)objc_alloc((Class)HKClinicalAccountEvent);
      [v15 identifier];
      id v87 = v15;
      id v91 = v14;
      id v83 = v13;
      v21 = id v20 = v18;
      int64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 335, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
      id v23 = +[NSDate date];
      uint64_t v24 = [v20 fetchRefreshTokenWithError:0];
      v96 = v19;
      uint64_t v25 = [v19 fetchRefreshTokenWithError:0];
      id v26 = (id *)v24;
      id v27 = [a8 initWithAccountIdentifier:v21 type:2 caller:v22 timestamp:v23 eventDescription:@"E01: The incoming credential was marked as deleted." incomingToken:v24 currentToken:v25];
      LOBYTE(a8) = 0;
      *a7 = v27;
      id v28 = (void *)v25;
      int64_t v29 = (void *)v21;
      v18 = v20;
      id v13 = v83;
      id v15 = v87;
      id v14 = v91;
LABEL_27:

      v19 = v96;
      goto LABEL_28;
    }
    unsigned __int8 v30 = [v18 hasRefreshTokenWithError:a8];
    if (*a8)
    {
LABEL_10:
      LOBYTE(a8) = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (v30)
    {
      if (!v13)
      {
        id v84 = objc_alloc((Class)HKClinicalAccountEvent);
        uint64_t v31 = [v15 identifier];
        uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 363, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
        +[NSDate date];
        id v88 = v15;
        id v92 = v14;
        id v33 = 0;
        v35 = long long v34 = v18;
        a8 = [v34 fetchRefreshTokenWithError:0];
        v96 = v19;
        uint64_t v36 = [v19 fetchRefreshTokenWithError:0];
        uint64_t v75 = v36;
        CFStringRef v37 = @"E03: Using incoming credential from sync because the account currently has no credential.";
        goto LABEL_26;
      }
      if ([v13 hasDeleted] && objc_msgSend(v13, "deleted"))
      {
        id v84 = objc_alloc((Class)HKClinicalAccountEvent);
        uint64_t v31 = [v15 identifier];
        uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 374, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
        +[NSDate date];
        id v88 = v15;
        id v92 = v14;
        id v33 = v13;
        v35 = long long v34 = v18;
        a8 = [v34 fetchRefreshTokenWithError:0];
        v96 = v19;
        uint64_t v36 = [v19 fetchRefreshTokenWithError:0];
        uint64_t v75 = v36;
        CFStringRef v37 = @"E04: Using incoming credential from sync because the account currently has a credential that was marked as deleted.";
LABEL_26:
        id v26 = a8;
        *a7 = [v84 initWithAccountIdentifier:v31 type:1 caller:v32 timestamp:v35 eventDescription:v37 incomingToken:a8 currentToken:v75];
        id v28 = (void *)v36;
        int64_t v29 = (void *)v31;
        int64_t v22 = (void *)v32;
        id v23 = (void *)v35;
        v18 = v34;
        id v13 = v33;
        id v15 = v88;
        id v14 = v92;
        LOBYTE(a8) = 1;
        goto LABEL_27;
      }
      unsigned __int8 v46 = [v19 hasRefreshTokenWithError:a8];
      if (*a8) {
        goto LABEL_10;
      }
      unsigned __int8 v47 = v46;
      if ([v15 credentialState] == (char *)&dword_0 + 1) {
        unsigned __int8 v48 = 0;
      }
      else {
        unsigned __int8 v48 = v47;
      }
      v96 = v19;
      if ((v48 & 1) == 0)
      {
        id v84 = objc_alloc((Class)HKClinicalAccountEvent);
        uint64_t v31 = [v15 identifier];
        uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 390, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
        +[NSDate date];
        id v88 = v15;
        id v92 = v14;
        id v33 = v13;
        v35 = long long v34 = v18;
        a8 = [v34 fetchRefreshTokenWithError:0];
        uint64_t v36 = [v19 fetchRefreshTokenWithError:0];
        uint64_t v75 = v36;
        CFStringRef v37 = @"E05: Using incoming credential from sync because the account is either marked as needing relogin, or the refresh token is missing in keychain.";
        goto LABEL_26;
      }
      if (![v15 credentialHasOutdatedScopes:v18])
      {
        v86 = a7;
        if ([v15 credentialState] == (char *)&dword_0 + 2
          || [v15 currentCredentialHasOutdatedScopes])
        {
          id v81 = objc_alloc((Class)HKClinicalAccountEvent);
          int64_t v29 = [v15 identifier];
          int64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 417, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
          id v23 = +[NSDate date];
          uint64_t v94 = [v18 fetchRefreshTokenWithError:0];
          uint64_t v90 = [v19 fetchRefreshTokenWithError:0];
          LOBYTE(a8) = 1;
          id v26 = (id *)v94;
          id *v86 = [v81 initWithAccountIdentifier:v29 type:1 caller:v22 timestamp:v23 eventDescription:@"E07: Using incoming credential from sync because the account is either marked as needing scope upgrade incomingToken:or the current credential has outdated scopes." currentToken:v90];
        }
        else
        {
          v50 = [v18 scopes];
          uint64_t v51 = +[HKOAuth2ScopeSet scopeSetWithScopes:v50];

          v52 = [v19 scopes];
          uint64_t v53 = +[HKOAuth2ScopeSet scopeSetWithScopes:v52];

          v77 = (void *)v51;
          v54 = (void *)v51;
          int64_t v22 = (void *)v53;
          unint64_t v55 = (unint64_t)[v54 compareTo:v53];
          [v13 receivedDate];
          double v57 = v56;
          [v14 receivedDate];
          BOOL v60 = v57 <= v58 && (v55 & 0xFFFFFFFFFFFFFFFELL) != 2;
          [v14 receivedDate];
          double v62 = v61;
          [v13 receivedDate];
          LODWORD(a8) = (v62 > v63 || v55 == 1) && v60;
          id v78 = objc_alloc((Class)HKClinicalAccountEvent);
          id v23 = [v15 identifier];
          v65 = v19;
          if (a8 == 1)
          {
            uint64_t v95 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 461, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
            uint64_t v90 = +[NSDate date];
            uint64_t v66 = HKStringFromBool();
            v80 = HKStringFromBool();
            v82 = (void *)v66;
            v67 = +[NSString stringWithFormat:@"E08: Using incoming credential from sync even though the current credential is viable because the incoming credential is also viable and it was deemed better (WorseAtNothing: %@, BetterAtSomething: %@).", v66, v80];
            uint64_t v68 = [v18 fetchRefreshTokenWithError:0];
            v69 = v65;
            v70 = (void *)v68;
            v79 = [v69 fetchRefreshTokenWithError:0];
            id v71 = [v78 initWithAccountIdentifier:v23 type:1 caller:v95 timestamp:v90 eventDescription:v67 incomingToken:v70 currentToken:v79];
          }
          else
          {
            uint64_t v95 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 470, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
            uint64_t v90 = +[NSDate date];
            uint64_t v72 = HKStringFromBool();
            v80 = HKStringFromBool();
            v82 = (void *)v72;
            v67 = +[NSString stringWithFormat:@"E09: Both the current and incoming credentials are viable and the incoming credential was not deemed better (WorseAtNothing: %@, BetterAtSomething: %@).", v72, v80];
            uint64_t v73 = [v18 fetchRefreshTokenWithError:0];
            v74 = v65;
            v70 = (void *)v73;
            v79 = [v74 fetchRefreshTokenWithError:0];
            id v71 = [v78 initWithAccountIdentifier:v23 type:2 caller:v95 timestamp:v90 eventDescription:v67 incomingToken:v70 currentToken:v79];
          }
          id *v86 = v71;

          int64_t v29 = v77;
          id v26 = (id *)v95;
        }
        id v28 = (void *)v90;
        goto LABEL_27;
      }
      id v85 = objc_alloc((Class)HKClinicalAccountEvent);
      uint64_t v38 = [v15 identifier];
      uint64_t v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 406, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
      +[NSDate date];
      id v89 = v15;
      id v93 = v14;
      id v40 = v13;
      uint64_t v42 = v41 = v18;
      a8 = [v41 fetchRefreshTokenWithError:0];
      uint64_t v43 = [v19 fetchRefreshTokenWithError:0];
      uint64_t v76 = v43;
      CFStringRef v44 = @"E06: The current credential did not need relogin and the incoming credential had outdated scope.";
    }
    else
    {
      id v85 = objc_alloc((Class)HKClinicalAccountEvent);
      uint64_t v38 = [v15 identifier];
      uint64_t v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "+[HDFHIRCredentialEntity(HealthRecordsPlugin) _shouldReplaceCurrentCredential:withIncomingCredential:account:profile:recordEvent:error:]", 352, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDFHIRCredentialEntity+HealthRecordsPlugin.m");
      +[NSDate date];
      id v89 = v15;
      id v93 = v14;
      id v40 = v13;
      uint64_t v42 = v41 = v18;
      a8 = [v41 fetchRefreshTokenWithError:0];
      v96 = v19;
      uint64_t v43 = [v19 fetchRefreshTokenWithError:0];
      uint64_t v76 = v43;
      CFStringRef v44 = @"E02: The refresh token for the incoming credential was not found in the keychain.";
    }
    id v26 = a8;
    id v45 = [v85 initWithAccountIdentifier:v38 type:2 caller:v39 timestamp:v42 eventDescription:v44 incomingToken:a8 currentToken:v76];
    LOBYTE(a8) = 0;
    *a7 = v45;
    id v28 = (void *)v43;
    int64_t v29 = (void *)v38;
    int64_t v22 = (void *)v39;
    id v23 = (void *)v42;
    v18 = v41;
    id v13 = v40;
    id v15 = v89;
    id v14 = v93;
    goto LABEL_27;
  }
  +[NSError hk_assignError:a8 code:127 format:@"Credential sync is not supported for profiles without a clinical account manager."];
  LOBYTE(a8) = 0;
LABEL_29:

  return (char)a8;
}

+ (id)_insertCodableCredential:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  unsigned int v14 = +[HDFHIRCredential validateInsertableCodableCredential:v12 error:a7];
  id v15 = [v12 identifier];
  id v16 = +[NSUUID hk_UUIDWithData:v15];

  if (v14) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    id v20 = 0;
  }
  else
  {
    v18 = [v13 protectedDatabase];
    v19 = [a1 allProperties];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_59088;
    v22[3] = &unk_113978;
    id v23 = v16;
    int64_t v25 = a4;
    id v24 = v12;
    int64_t v26 = a5;
    id v20 = [a1 insertOrReplaceEntity:0 database:v18 properties:v19 error:a7 bindingHandler:v22];
  }

  return v20;
}

+ (id)insertCredential:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[NSDate date];
  unsigned int v14 = [a1 _insertCredential:v12 receivedDate:v13 profile:v11 transaction:v10 error:a6];

  return v14;
}

+ (id)_insertCredential:(id)a3 receivedDate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  unsigned int v14 = [a3 asNewCodableForAccountSyncIdentifier:0 receivedDate:a4];
  id v15 = [v13 currentSyncIdentityPersistentID];

  id v16 = [a1 _insertCodableCredential:v14 syncProvenance:0 syncIdentity:v15 transaction:v12 error:a7];

  return v16;
}

@end