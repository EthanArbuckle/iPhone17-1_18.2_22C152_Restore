@interface HMDHH2MigrationStateLogger
+ (BOOL)doesLogEventExistOnDisk;
+ (id)allowedValues;
+ (id)autoMigrationAttempt;
+ (id)migrationLogEventRecord;
+ (int64_t)migrationAttempt;
+ (void)commitMigrationLogEventToDisk:(id)a3;
+ (void)commitMigrationLogEventToDiskWithKey:(id)a3 value:(id)a4;
+ (void)incrementAutoMigrationAttempt;
+ (void)incrementMigrationAttempt;
+ (void)recordIsDryRun:(BOOL)a3;
+ (void)recordMigrationEnd:(BOOL)a3;
+ (void)recordMigrationEndTimeWithValue:(unint64_t)a3;
+ (void)recordMigrationFailedWithError:(id)a3 withReason:(id)a4;
+ (void)recordMigrationStart:(BOOL)a3 isDryRun:(BOOL)a4;
+ (void)recordMigrationStartTimeWithValue:(unint64_t)a3;
+ (void)removeMigrationLogEventRecordFromDisk;
+ (void)setAutoMigration:(BOOL)a3;
+ (void)setMigrationSuccessful:(BOOL)a3;
- (BOOL)isAutoMigration;
- (BOOL)isDryRun;
- (BOOL)isMigrationSuccessful;
- (BOOL)shouldSubmitLogEvent;
- (HMDHH2MigrationStateLogger)init;
- (NSDictionary)logEventRecord;
- (id)migrationDetailsLogEventFromDisk;
- (id)migrationEndLogEventFromDisk;
- (id)migrationError;
- (int64_t)migrationEndTime;
- (int64_t)migrationStartTime;
- (int64_t)totalTimeTakenForMigration;
- (void)populateTotalMigrationTime;
- (void)resetStoredMigrationState;
- (void)setLogEventRecord:(id)a3;
@end

@implementation HMDHH2MigrationStateLogger

- (void).cxx_destruct
{
}

- (void)setLogEventRecord:(id)a3
{
}

- (NSDictionary)logEventRecord
{
  return self->_logEventRecord;
}

- (int64_t)totalTimeTakenForMigration
{
  return self->_totalTimeTakenForMigration;
}

- (BOOL)isMigrationSuccessful
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v3 = objc_msgSend(v2, "hmf_numberForKey:", @"migrationSuccess");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)migrationEndTime
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v3 = objc_msgSend(v2, "hmf_numberForKey:", @"migrationEndTime");
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)migrationStartTime
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v3 = objc_msgSend(v2, "hmf_numberForKey:", @"migrationStartTime");
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)isDryRun
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  char v3 = objc_msgSend(v2, "hmf_BOOLForKey:", @"isDryRun");

  return v3;
}

- (BOOL)isAutoMigration
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  char v3 = objc_msgSend(v2, "hmf_BOOLForKey:", @"isAutoMigration");

  return v3;
}

- (id)migrationError
{
  v2 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  char v3 = objc_msgSend(v2, "hmf_errorForKey:", @"migrationError");

  return v3;
}

- (void)populateTotalMigrationTime
{
  int64_t v3 = [(HMDHH2MigrationStateLogger *)self migrationEndTime];
  self->_totalTimeTakenForMigration = v3 - [(HMDHH2MigrationStateLogger *)self migrationStartTime];
}

- (BOOL)shouldSubmitLogEvent
{
  v2 = objc_opt_class();
  return [v2 doesLogEventExistOnDisk];
}

- (id)migrationDetailsLogEventFromDisk
{
  [(HMDHH2MigrationStateLogger *)self populateTotalMigrationTime];
  v19 = [HMDHH2MigrationLogEvent alloc];
  BOOL v18 = [(HMDHH2MigrationStateLogger *)self isAutoMigration];
  BOOL v17 = [(HMDHH2MigrationStateLogger *)self isDryRun];
  BOOL v16 = [(HMDHH2MigrationStateLogger *)self isMigrationSuccessful];
  int64_t v15 = [(HMDHH2MigrationStateLogger *)self totalTimeTakenForMigration];
  uint64_t v3 = [(id)objc_opt_class() migrationAttempt];
  int64_t v4 = [(HMDHH2MigrationStateLogger *)self migrationError];
  v5 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v6 = [v5 objectForKeyedSubscript:@"migrationFailureReason"];
  v7 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v8 = [v7 objectForKeyedSubscript:@"validationEntityClassName"];
  v9 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v10 = [v9 objectForKeyedSubscript:@"validationAttributeName"];
  v11 = [(HMDHH2MigrationStateLogger *)self logEventRecord];
  v12 = [v11 objectForKeyedSubscript:@"localizedDescription"];
  v13 = [(HMDHH2MigrationLogEvent *)v19 initWithAutoMigration:v18 isDryRun:v17 migrationSuccessful:v16 totalMigrationTime:v15 totalMigrationAttempt:v3 migrationError:v4 failureReason:v6 coreDataValidationEntityClassName:v8 coreDataValidationAttributeName:v10 localizedErrorDescription:v12];

  return v13;
}

- (id)migrationEndLogEventFromDisk
{
  if ([(HMDHH2MigrationStateLogger *)self isAutoMigration])
  {
    uint64_t v3 = [(id)objc_opt_class() autoMigrationAttempt];
  }
  else
  {
    uint64_t v3 = 0;
  }
  int64_t v4 = [HMDHH2MigrationDailyTotalsLogEvent alloc];
  BOOL v5 = [(HMDHH2MigrationStateLogger *)self isAutoMigration];
  BOOL v6 = [(HMDHH2MigrationStateLogger *)self isDryRun];
  v7 = [(HMDHH2MigrationStateLogger *)self migrationError];
  id v8 = [(HMDHH2MigrationDailyTotalsLogEvent *)v4 initEndWithAutoMigration:v5 dryRun:v6 attemptCount:v3 error:v7];

  return v8;
}

- (void)resetStoredMigrationState
{
  if ([(HMDHH2MigrationStateLogger *)self isMigrationSuccessful])
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v2 removeObjectForKey:@"migrationAttemptCount"];
  }
  uint64_t v3 = objc_opt_class();
  [v3 removeMigrationLogEventRecordFromDisk];
}

- (HMDHH2MigrationStateLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHH2MigrationStateLogger;
  v2 = [(HMDHH2MigrationStateLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() migrationLogEventRecord];
    logEventRecord = v2->_logEventRecord;
    v2->_logEventRecord = (NSDictionary *)v3;

    [(HMDHH2MigrationStateLogger *)v2 populateTotalMigrationTime];
  }
  return v2;
}

+ (void)removeMigrationLogEventRecordFromDisk
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (id)hh2MigrationLogEventPath;
  int64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v16];
  id v6 = v16;

  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1;
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v18 = v11;
      v12 = "%{public}@Successfully deleted the HH2 migration log event record from disk";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    v12 = "%{public}@Failed to delete the HH2 migration log event record from disk : %@";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_6;
  }
}

+ (id)migrationLogEventRecord
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() doesLogEventExistOnDisk])
  {
    id v3 = (id)hh2MigrationLogEventPath;
    id v34 = 0;
    int64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:2 error:&v34];
    id v5 = v34;
    if (v4)
    {
      id v6 = (void *)MEMORY[0x1E4F28DC0];
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v35 = objc_opt_class();
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      v9 = [v7 setWithArray:v8];
      v10 = [(id)objc_opt_class() allowedValues];
      id v33 = 0;
      v11 = [v6 unarchivedDictionaryWithKeysOfClasses:v9 objectsOfClasses:v10 fromData:v4 error:&v33];
      id v12 = v33;

      if (v11)
      {
        id v13 = v11;
        objc_opt_class();
        int v14 = objc_opt_isKindOfClass() & 1;
        if (v14) {
          uint32_t v15 = v13;
        }
        else {
          uint32_t v15 = 0;
        }
        id v16 = v15;

        if (v14)
        {
          id v17 = v13;
        }
        else
        {
          v27 = (void *)MEMORY[0x1D9452090]();
          id v28 = a1;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = v32 = v27;
            *(_DWORD *)buf = 138543618;
            v37 = v30;
            __int16 v38 = 2112;
            id v39 = v13;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the migration log event record from archive data: %@", buf, 0x16u);

            v27 = v32;
          }

          id v17 = [MEMORY[0x1E4F1C9E8] dictionary];
        }
        BOOL v18 = v17;
      }
      else
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = a1;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v37 = v26;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive migration log event record from archive data: %@", buf, 0x16u);
        }
        BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
    }
    else
    {
      __int16 v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        __int16 v38 = 2112;
        id v39 = v5;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the migration log event record due to an error: [%@]", buf, 0x16u);
      }
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v18;
}

+ (BOOL)doesLogEventExistOnDisk
{
  id v2 = (id)hh2MigrationLogEventPath;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  return v4;
}

+ (id)allowedValues
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  char v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (void)commitMigrationLogEventToDisk:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)hh2MigrationLogEventPath;
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v20 = 138543618;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Going to write migration log event : [%@]", (uint8_t *)&v20, 0x16u);
  }
  v10 = encodeRootObject();
  v11 = v10;
  if (!v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v19 = v7;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      id v23 = v5;
      id v16 = "%{public}@Unable to write migration log event at location : %@";
      id v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (([v10 writeToFile:v5 atomically:1] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v7;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      int v20 = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v5;
      id v16 = "%{public}@Unable to write migration log event [%@] to location : %@";
      id v17 = v14;
      uint32_t v18 = 32;
LABEL_9:
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
}

+ (void)commitMigrationLogEventToDiskWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() migrationLogEventRecord];
  id v9 = (id)[v8 mutableCopy];

  [v9 setObject:v6 forKeyedSubscript:v7];
  [a1 commitMigrationLogEventToDisk:v9];
}

+ (void)incrementAutoMigrationAttempt
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [MEMORY[0x1E4F65548] productInfo];
  id v5 = [v4 softwareVersion];
  id v6 = [v5 buildVersion];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() autoMigrationAttempt];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
      v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = a1;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v28 = v13;
        __int16 v29 = 2114;
        v30 = v9;
        __int16 v31 = 2114;
        v32 = v6;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Incrementing auto migration attempt to %{public}@ for build %{public}@", buf, 0x20u);
      }
      id v25 = v6;
      uint64_t v26 = v9;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v3 setObject:v14 forKey:@"autoMigrationAttemptCount"];
    }
    else
    {
      id v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        v30 = v6;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Initializing first auto migration attempt for build %{public}@", buf, 0x16u);
      }
      id v23 = v6;
      __int16 v24 = &unk_1F2DC8200;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v3 setObject:v9 forKey:@"autoMigrationAttemptCount"];
    }
  }
  else
  {
    uint32_t v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = a1;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint32_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_FAULT, "%{public}@Should not get here, skipping incrementing auto migration attempt due to missing build version", buf, 0xCu);
    }
  }
}

+ (id)autoMigrationAttempt
{
  id v2 = [MEMORY[0x1E4F65548] productInfo];
  id v3 = [v2 softwareVersion];
  id v4 = [v3 buildVersion];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v6 = [v5 dictionaryForKey:@"autoMigrationAttemptCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 objectForKey:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (int64_t)migrationAttempt
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"migrationAttemptCount"];

  return v3;
}

+ (void)incrementMigrationAttempt
{
  uint64_t v2 = [(id)objc_opt_class() migrationAttempt];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setInteger:v2 + 1 forKey:@"migrationAttemptCount"];
}

+ (void)setMigrationSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithBool:v3];
  [v4 commitMigrationLogEventToDiskWithKey:@"migrationSuccess" value:v5];
}

+ (void)recordMigrationEndTimeWithValue:(unint64_t)a3
{
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 commitMigrationLogEventToDiskWithKey:@"migrationEndTime" value:v5];
}

+ (void)recordMigrationStartTimeWithValue:(unint64_t)a3
{
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 commitMigrationLogEventToDiskWithKey:@"migrationStartTime" value:v5];
}

+ (void)setAutoMigration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithBool:v3];
  [v4 commitMigrationLogEventToDiskWithKey:@"isAutoMigration" value:v5];
}

+ (void)recordMigrationFailedWithError:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() migrationLogEventRecord];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__89452;
  id v28 = __Block_byref_object_dispose__89453;
  id v9 = v5;
  id v29 = v9;
  v10 = [v9 userInfo];

  if (v10)
  {
    id v11 = [(id)v25[5] userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28230]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__HMDHH2MigrationStateLogger_recordMigrationFailedWithError_withReason___block_invoke;
    v23[3] = &unk_1E6A0E088;
    v23[4] = &v24;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    [(id)objc_opt_class() _addInfoFromCoreDataError:v25[5] logEvent:v8];
  }
  uint32_t v15 = [(id)v25[5] domain];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v17 = [(id)v25[5] domain];
    uint32_t v18 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, objc_msgSend((id)v25[5], "code"), 0);
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = [(id)v25[5] code];
    uint64_t v21 = *MEMORY[0x1E4F2D140];
    __int16 v22 = [v19 errorWithDomain:*MEMORY[0x1E4F2D140] code:v20 userInfo:0];
    [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint32_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v21 code:2717 userInfo:v17];
  }
  [v8 setObject:v18 forKeyedSubscript:@"migrationError"];
  [v8 setObject:v6 forKeyedSubscript:@"migrationFailureReason"];
  [(id)objc_opt_class() commitMigrationLogEventToDisk:v8];

  _Block_object_dispose(&v24, 8);
}

void __72__HMDHH2MigrationStateLogger_recordMigrationFailedWithError_withReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (void)recordIsDryRun:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithBool:v3];
  [v4 commitMigrationLogEventToDiskWithKey:@"isDryRun" value:v5];
}

+ (void)recordMigrationEnd:(BOOL)a3
{
  [(id)objc_opt_class() setMigrationSuccessful:a3];
  BOOL v3 = objc_opt_class();
  mach_absolute_time();
  uint64_t v4 = UpTicksToSeconds();
  [v3 recordMigrationEndTimeWithValue:v4];
}

+ (void)recordMigrationStart:(BOOL)a3 isDryRun:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(id)objc_opt_class() removeMigrationLogEventRecordFromDisk];
  [(id)objc_opt_class() setAutoMigration:v5];
  [(id)objc_opt_class() incrementMigrationAttempt];
  id v6 = objc_opt_class();
  mach_absolute_time();
  [v6 recordMigrationStartTimeWithValue:UpTicksToSeconds()];
  id v7 = objc_opt_class();
  [v7 recordIsDryRun:v4];
}

@end