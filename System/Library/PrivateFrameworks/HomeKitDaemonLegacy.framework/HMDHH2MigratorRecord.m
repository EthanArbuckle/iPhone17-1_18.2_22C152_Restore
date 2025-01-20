@interface HMDHH2MigratorRecord
+ (BOOL)recordMigrationFailureWithError:(id)a3;
+ (id)archiveMigratorDict:(id)a3;
+ (id)lastMigrationFailure;
+ (id)logCategory;
+ (id)prepareDictionary:(BOOL)a3 attempt:(unsigned int)a4 skipKeyRoll:(BOOL)a5 forceFailForTesting:(BOOL)a6 migrateFromTestDirectory:(BOOL)a7 dryRun:(BOOL)a8;
+ (id)prepareDictionary:(id)a3;
+ (id)singleRecord;
+ (id)unarchiveMigratorDict:(id)a3;
+ (void)removeMigrationFailureRecord;
- (BOOL)beginMigration;
- (BOOL)dryRun;
- (BOOL)finishMigration;
- (BOOL)forceMigrationFailureForTesting;
- (BOOL)isMaximumMigrationAttemptReached;
- (BOOL)isMigrationInProgress;
- (BOOL)migrateFromTestDirectory;
- (BOOL)shouldSkipKeyRollOperations;
- (BOOL)writeMigratorRecord:(id)a3;
- (BOOL)writeNewMigrationRecord;
- (BOOL)writeToDisk;
- (HMDHH2MigratorRecord)initWithLocalStorePath:(id)a3;
- (NSString)hh2MigratorRecordDataStorePath;
- (id)attributeDescriptions;
- (unsigned)currentMigrationAttempt;
- (void)readMigratorRecord;
- (void)setCurrentMigrationAttempt:(unsigned int)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setForceMigrationFailureForTesting:(BOOL)a3;
- (void)setHh2MigratorRecordDataStorePath:(id)a3;
- (void)setIsMigrationInProgress:(BOOL)a3;
- (void)setMigrateFromTestDirectory:(BOOL)a3;
- (void)setShouldSkipKeyRollOperations:(BOOL)a3;
- (void)unarchiveRecordFromData:(id)a3;
- (void)updateValuesFromDict:(id)a3;
@end

@implementation HMDHH2MigratorRecord

+ (id)lastMigrationFailure
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDHH2MigratorRecord_lastMigrationFailure__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lastMigrationFailure_onceToken != -1) {
    dispatch_once(&lastMigrationFailure_onceToken, block);
  }
  v2 = (void *)lastMigrationFailure_migrationError;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHh2MigratorRecordDataStorePath:(id)a3
{
}

- (NSString)hh2MigratorRecordDataStorePath
{
  return self->_hh2MigratorRecordDataStorePath;
}

- (void)setMigrateFromTestDirectory:(BOOL)a3
{
  self->_migrateFromTestDirectory = a3;
}

- (BOOL)migrateFromTestDirectory
{
  return self->_migrateFromTestDirectory;
}

- (void)setForceMigrationFailureForTesting:(BOOL)a3
{
  self->_forceMigrationFailureForTesting = a3;
}

- (BOOL)forceMigrationFailureForTesting
{
  return self->_forceMigrationFailureForTesting;
}

- (void)setShouldSkipKeyRollOperations:(BOOL)a3
{
  self->_shouldSkipKeyRollOperations = a3;
}

- (BOOL)shouldSkipKeyRollOperations
{
  return self->_shouldSkipKeyRollOperations;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setCurrentMigrationAttempt:(unsigned int)a3
{
  self->_currentMigrationAttempt = a3;
}

- (unsigned)currentMigrationAttempt
{
  return self->_currentMigrationAttempt;
}

- (void)setIsMigrationInProgress:(BOOL)a3
{
  self->_isMigrationInProgress = a3;
}

- (BOOL)isMigrationInProgress
{
  return self->_isMigrationInProgress;
}

- (BOOL)finishMigration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(HMDHH2MigratorRecord *)self hh2MigratorRecordDataStorePath];
  id v13 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v13];
  id v6 = v13;

  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HMDHH2MigratorRecord *)v8 hh2MigratorRecordDataStorePath];
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove migration record from disk %@ (%@)", buf, 0x20u);
    }
  }

  return v5;
}

- (BOOL)isMaximumMigrationAttemptReached
{
  return [(HMDHH2MigratorRecord *)self currentMigrationAttempt] != 0;
}

- (BOOL)beginMigration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(HMDHH2MigratorRecord *)self isMigrationInProgress])
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v10;
      v11 = "%{public}@Cannot increment the migration attempt as this device is not the migrator";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:

    return 0;
  }
  if ([(HMDHH2MigratorRecord *)self migrateFromTestDirectory])
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    v4 = self;
    char v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Not enforcing the migration attempt as we are doing migration from test directory", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_13;
  }
  if ([(HMDHH2MigratorRecord *)self isMaximumMigrationAttemptReached])
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v10;
      v11 = "%{public}@Maximum migration attempt reached";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_13:
  id v13 = (void *)MEMORY[0x1D9452090]([(HMDHH2MigratorRecord *)self setCurrentMigrationAttempt:[(HMDHH2MigratorRecord *)self currentMigrationAttempt] + 1]);
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    unsigned int v17 = [(HMDHH2MigratorRecord *)v14 currentMigrationAttempt];
    int v18 = 138543618;
    id v19 = v16;
    __int16 v20 = 1024;
    unsigned int v21 = v17;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Increased migration attempt to %u", (uint8_t *)&v18, 0x12u);
  }
  return [(HMDHH2MigratorRecord *)v14 writeToDisk];
}

- (BOOL)writeToDisk
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend((id)objc_opt_class(), "prepareDictionary:attempt:skipKeyRoll:forceFailForTesting:migrateFromTestDirectory:dryRun:", -[HMDHH2MigratorRecord isMigrationInProgress](self, "isMigrationInProgress"), -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt"), -[HMDHH2MigratorRecord shouldSkipKeyRollOperations](self, "shouldSkipKeyRollOperations"), -[HMDHH2MigratorRecord forceMigrationFailureForTesting](self, "forceMigrationFailureForTesting"), -[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory"), -[HMDHH2MigratorRecord dryRun](self, "dryRun"));
  if (v3)
  {
    BOOL v4 = [(HMDHH2MigratorRecord *)self writeMigratorRecord:v3];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare HH2 migrator record dictionary", (uint8_t *)&v10, 0xCu);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)writeMigratorRecord:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(id)objc_opt_class() archiveMigratorDict:v4];
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v19 = 138543618;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to create an archive of the HH2 migrator record : %@", (uint8_t *)&v19, 0x16u);
LABEL_9:
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  id v6 = [(HMDHH2MigratorRecord *)self hh2MigratorRecordDataStorePath];
  char v7 = [v5 writeToFile:v6 atomically:1];

  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  v11 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      unsigned int v17 = [(HMDHH2MigratorRecord *)v9 hh2MigratorRecordDataStorePath];
      int v19 = 138543618;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to write the HH2 migrator record to %@", (uint8_t *)&v19, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v12 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    v14 = [(HMDHH2MigratorRecord *)v9 hh2MigratorRecordDataStorePath];
    int v19 = 138543874;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully written HH2 migrator record to disk: %@ : %@", (uint8_t *)&v19, 0x20u);
  }
LABEL_11:

  return v12;
}

- (BOOL)writeNewMigrationRecord
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![(HMDHH2MigratorRecord *)self isMigrationInProgress])
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "prepareDictionary:attempt:skipKeyRoll:forceFailForTesting:migrateFromTestDirectory:dryRun:", 1, 0, -[HMDHH2MigratorRecord shouldSkipKeyRollOperations](self, "shouldSkipKeyRollOperations"), -[HMDHH2MigratorRecord forceMigrationFailureForTesting](self, "forceMigrationFailureForTesting"), -[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory"), -[HMDHH2MigratorRecord dryRun](self, "dryRun"));
    if (v4)
    {
      if ([(HMDHH2MigratorRecord *)self writeMigratorRecord:v4])
      {
        [(HMDHH2MigratorRecord *)self updateValuesFromDict:v4];
        BOOL v3 = 1;
LABEL_10:

        return v3;
      }
    }
    else
    {
      char v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = self;
      char v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = HMFGetLogIdentifier();
        int v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare HH2 migrator record", (uint8_t *)&v10, 0xCu);
      }
    }
    BOOL v3 = 0;
    goto LABEL_10;
  }
  return 1;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHH2MigratorRecord *)self isMigrationInProgress];
  int v19 = HMFBooleanToString();
  id v4 = (void *)[v3 initWithName:@"isMigrationInProgress" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt"));
  char v7 = (void *)[v5 initWithName:@"migrationAttempt" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHH2MigratorRecord *)self shouldSkipKeyRollOperations];
  v9 = HMFBooleanToString();
  int v10 = (void *)[v8 initWithName:@"skipKeyRoll" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHH2MigratorRecord *)self forceMigrationFailureForTesting];
  uint64_t v12 = HMFBooleanToString();
  id v13 = (void *)[v11 initWithName:@"forceMigrationFailure" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHH2MigratorRecord *)self migrateFromTestDirectory];
  v15 = HMFBooleanToString();
  __int16 v16 = (void *)[v14 initWithName:@"migrateFromTestDirectory" value:v15];
  v20[4] = v16;
  unsigned int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return v17;
}

- (void)updateValuesFromDict:(id)a3
{
  id v10 = a3;
  id v4 = [v10 objectForKeyedSubscript:@"HH2.MG.migrator"];
  -[HMDHH2MigratorRecord setIsMigrationInProgress:](self, "setIsMigrationInProgress:", [v4 BOOLValue]);

  id v5 = [v10 objectForKeyedSubscript:@"HH2.MG.attempt"];
  -[HMDHH2MigratorRecord setCurrentMigrationAttempt:](self, "setCurrentMigrationAttempt:", [v5 unsignedIntValue]);

  id v6 = [v10 objectForKeyedSubscript:@"HH2.MG.dry.run"];
  -[HMDHH2MigratorRecord setDryRun:](self, "setDryRun:", [v6 BOOLValue]);

  if (isInternalBuild())
  {
    char v7 = [v10 objectForKeyedSubscript:@"HH2.MG.skip.key.roll"];
    -[HMDHH2MigratorRecord setShouldSkipKeyRollOperations:](self, "setShouldSkipKeyRollOperations:", [v7 BOOLValue]);

    id v8 = [v10 objectForKeyedSubscript:@"HH2.MG.simulate.migration.failure"];
    -[HMDHH2MigratorRecord setForceMigrationFailureForTesting:](self, "setForceMigrationFailureForTesting:", [v8 BOOLValue]);

    v9 = [v10 objectForKeyedSubscript:@"HH2.MG.migrate.test.directory"];
    -[HMDHH2MigratorRecord setMigrateFromTestDirectory:](self, "setMigrateFromTestDirectory:", [v9 BOOLValue]);
  }
}

- (void)unarchiveRecordFromData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() unarchiveMigratorDict:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]([(HMDHH2MigratorRecord *)self updateValuesFromDict:v5]);
    char v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      id v10 = [(HMDHH2MigratorRecord *)v7 attributeDescriptions];
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully got the HH2 Migrator record : %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the valid HH2 Migrator record from stored archive.", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)readMigratorRecord
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    char v7 = [(HMDHH2MigratorRecord *)v4 hh2MigratorRecordDataStorePath];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to read migrator record from : %@", buf, 0x16u);
  }
  id v8 = [(HMDHH2MigratorRecord *)v4 hh2MigratorRecordDataStorePath];
  id v15 = 0;
  v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:2 error:&v15];
  id v10 = v15;
  if (v10 || !v9)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v4;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Current device is not the migrator: %@", buf, 0x16u);
    }
  }
  else
  {
    [(HMDHH2MigratorRecord *)v4 unarchiveRecordFromData:v9];
  }
}

- (HMDHH2MigratorRecord)initWithLocalStorePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHH2MigratorRecord;
  id v6 = [(HMDHH2MigratorRecord *)&v9 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hh2MigratorRecordDataStorePath, a3);
    v7->_isMigrationInProgress = 0;
    [(HMDHH2MigratorRecord *)v7 readMigratorRecord];
  }

  return v7;
}

+ (void)removeMigrationFailureRecord
{
  id v2 = (id)hh2MigrationFailureRecordStorePath;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = 0;
  [v3 removeItemAtPath:v2 error:&v4];
}

void __44__HMDHH2MigratorRecord_lastMigrationFailure__block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = (id)hh2MigrationFailureRecordStorePath;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v8;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v2;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Found migration failure record on disk at %@. Going to read it.", buf, 0x16u);
    }
    id v51 = 0;
    objc_super v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2 options:2 error:&v51];
    id v10 = v51;
    if (v9)
    {
      id v11 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v53 = objc_opt_class();
      int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      id v14 = [v12 setWithArray:v13];
      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v52 = objc_opt_class();
      __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      uint64_t v17 = [v15 setWithArray:v16];
      id v50 = 0;
      __int16 v18 = [v11 unarchivedDictionaryWithKeysOfClasses:v14 objectsOfClasses:v17 fromData:v9 error:&v50];
      id v19 = v50;

      if (v18)
      {
        id v20 = v18;
        objc_opt_class();
        int v21 = objc_opt_isKindOfClass() & 1;
        if (v21) {
          id v22 = v20;
        }
        else {
          id v22 = 0;
        }
        id v23 = v22;

        if (v21)
        {
          v24 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F2D448]];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          id v26 = v25;

          v27 = (void *)lastMigrationFailure_migrationError;
          lastMigrationFailure_migrationError = (uint64_t)v26;

          v28 = (void *)MEMORY[0x1D9452090]();
          id v29 = *(id *)(a1 + 32);
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v31 = v48 = v28;
            *(_DWORD *)buf = 138543618;
            v55 = v31;
            __int16 v56 = 2112;
            uint64_t v57 = lastMigrationFailure_migrationError;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully read the migration failure record %@", buf, 0x16u);

            v28 = v48;
          }
        }
        else
        {
          v42 = (void *)MEMORY[0x1D9452090]();
          id v43 = *(id *)(a1 + 32);
          v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = v49 = v42;
            *(_DWORD *)buf = 138543618;
            v55 = v45;
            __int16 v56 = 2112;
            uint64_t v57 = (uint64_t)v20;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the migration failure record from archive data: %@", buf, 0x16u);

            v42 = v49;
          }

          uint64_t v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          v47 = (void *)lastMigrationFailure_migrationError;
          lastMigrationFailure_migrationError = v46;
        }
      }
      else
      {
        v37 = (void *)MEMORY[0x1D9452090]();
        id v38 = *(id *)(a1 + 32);
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v55 = v40;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v19;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive migration failure record from archive data: %@", buf, 0x16u);
        }
        id v41 = v19;
        id v23 = (id)lastMigrationFailure_migrationError;
        lastMigrationFailure_migrationError = (uint64_t)v41;
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = *(id *)(a1 + 32);
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v55 = v35;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v10;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the migration failure record due to an error: [%@]", buf, 0x16u);
      }
      id v36 = v10;
      id v19 = (id)lastMigrationFailure_migrationError;
      lastMigrationFailure_migrationError = (uint64_t)v36;
    }
  }
}

+ (BOOL)recordMigrationFailureWithError:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2D448]];
  id v7 = (id)hh2MigrationFailureRecordStorePath;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v27 = 138543874;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to write migration failure record : [%@] -> [%@]", (uint8_t *)&v27, 0x20u);
  }
  uint64_t v12 = encodeRootObject();
  int v13 = v12;
  if (!v12)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v21 = v9;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v22;
      __int16 v29 = 2112;
      id v30 = v7;
      id v23 = "%{public}@Unable to write migration failure record at location : %@";
      v24 = v18;
      uint32_t v25 = 22;
LABEL_13:
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, v25);
    }
LABEL_14:
    BOOL v20 = 0;
    goto LABEL_15;
  }
  char v14 = [v12 writeToFile:v7 atomically:1];
  id v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = v9;
  uint64_t v17 = HMFGetOSLogHandle();
  __int16 v18 = v17;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v27 = 138543874;
      v28 = v22;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v7;
      id v23 = "%{public}@Unable to write migration failure record [%@] to location : %@";
      v24 = v18;
      uint32_t v25 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = HMFGetLogIdentifier();
    int v27 = 138543874;
    v28 = v19;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully written migration failure record on disk : %@, %@", (uint8_t *)&v27, 0x20u);
  }
  BOOL v20 = 1;
LABEL_15:

  return v20;
}

+ (id)unarchiveMigratorDict:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v28[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v8 = [v6 setWithArray:v7];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  id v11 = [v9 setWithArray:v10];
  id v22 = 0;
  uint64_t v12 = [v5 unarchivedDictionaryWithKeysOfClasses:v8 objectsOfClasses:v11 fromData:v4 error:&v22];
  id v13 = v22;

  if (!v12)
  {
    char v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive HMDHH2MigratorRecord from archive data: %@", buf, 0x16u);
    }
  }
  id v18 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  return v20;
}

+ (id)archiveMigratorDict:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to archive : %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = encodeRootObject();

  return v9;
}

+ (id)prepareDictionary:(BOOL)a3 attempt:(unsigned int)a4 skipKeyRoll:(BOOL)a5 forceFailForTesting:(BOOL)a6 migrateFromTestDirectory:(BOOL)a7 dryRun:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a4;
  BOOL v13 = a3;
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = [NSNumber numberWithBool:v13];
  [v14 setObject:v15 forKeyedSubscript:@"HH2.MG.migrator"];

  id v16 = [NSNumber numberWithUnsignedInt:v12];
  [v14 setObject:v16 forKeyedSubscript:@"HH2.MG.attempt"];

  uint64_t v17 = [NSNumber numberWithBool:v8];
  [v14 setObject:v17 forKeyedSubscript:@"HH2.MG.dry.run"];

  if (isInternalBuild())
  {
    id v18 = [NSNumber numberWithBool:v11];
    [v14 setObject:v18 forKeyedSubscript:@"HH2.MG.skip.key.roll"];

    id v19 = [NSNumber numberWithBool:v10];
    [v14 setObject:v19 forKeyedSubscript:@"HH2.MG.simulate.migration.failure"];

    id v20 = [NSNumber numberWithBool:v9];
    [v14 setObject:v20 forKeyedSubscript:@"HH2.MG.migrate.test.directory"];
  }
  return v14;
}

+ (id)prepareDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v5 = [v3 isMigrationInProgress];
  uint64_t v6 = [v3 currentMigrationAttempt];
  uint64_t v7 = [v3 shouldSkipKeyRollOperations];
  uint64_t v8 = [v3 forceMigrationFailureForTesting];
  uint64_t v9 = [v3 migrateFromTestDirectory];
  uint64_t v10 = [v3 dryRun];

  return (id)[v4 prepareDictionary:v5 attempt:v6 skipKeyRoll:v7 forceFailForTesting:v8 migrateFromTestDirectory:v9 dryRun:v10];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_82834 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_82834, &__block_literal_global_19_82835);
  }
  id v2 = (void *)logCategory__hmf_once_v5_82836;
  return v2;
}

uint64_t __35__HMDHH2MigratorRecord_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_82836;
  logCategory__hmf_once_v5_82836 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)singleRecord
{
  if (singleRecord_onceToken != -1) {
    dispatch_once(&singleRecord_onceToken, &__block_literal_global_82841);
  }
  id v2 = (void *)singleRecord_singleMigratorRecord;
  return v2;
}

void __36__HMDHH2MigratorRecord_singleRecord__block_invoke()
{
  uint64_t v0 = [HMDHH2MigratorRecord alloc];
  id v3 = (id)hh2MigratorRecordStorePath;
  uint64_t v1 = [(HMDHH2MigratorRecord *)v0 initWithLocalStorePath:v3];
  id v2 = (void *)singleRecord_singleMigratorRecord;
  singleRecord_singleMigratorRecord = v1;
}

@end