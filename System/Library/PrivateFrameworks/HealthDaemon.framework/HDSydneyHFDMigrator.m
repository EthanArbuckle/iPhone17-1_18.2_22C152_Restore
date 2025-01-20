@interface HDSydneyHFDMigrator
- (BOOL)allowHFDMigration:(id)a3;
- (BOOL)corruptionRebuildCompleted;
- (BOOL)migrateDataForHFDataStore:(id)a3 from:(const void *)a4 to:(void *)a5 recoveryAnalytics:(id)a6 error:(id *)a7;
- (BOOL)migrateDataForHFDataStore:(id)a3 toSQLiteFrom:(const void *)a4 error:(id *)a5;
- (HDDatabaseMigrationTransaction)transaction;
- (HDSQLiteDatabase)protectedDatabase;
- (HDSydneyHFDMigrator)initWithMigrationTransaction:(id)a3;
- (NSError)migrationError;
- (NSError)verificationError;
- (id)allSeriesEntityClassesForDataStore:(id)a3;
- (int64_t)HFDataStore:(id)a3 integerForKey:(id)a4;
- (int64_t)migrateHFD:(id *)a3;
- (void)HFDataStore:(id)a3 detectedCorruptionOfType:(int64_t)a4 code:(int)a5 error:(id)a6 shouldPromptUser:(BOOL)a7 initialRebuildState:(int64_t)a8 updatedRebuildState:(int64_t)a9;
- (void)HFDataStore:(id)a3 setInteger:(int64_t)a4 forKey:(id)a5;
- (void)HFDataStoreDetectedOutOfSpace:(id)a3;
- (void)didMigrateHFDataStore:(id)a3 fromState:(int64_t)a4 toState:(int64_t)a5 success:(BOOL)a6 error:(id)a7;
- (void)requestRebuildTransactionForHFDataStore:(id)a3;
- (void)setCorruptionRebuildCompleted:(BOOL)a3;
- (void)setMigrationError:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setVerificationError:(id)a3;
@end

@implementation HDSydneyHFDMigrator

- (HDSydneyHFDMigrator)initWithMigrationTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSydneyHFDMigrator;
  v6 = [(HDSydneyHFDMigrator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v7->_corruptionRebuildCompleted = 0;
    verificationError = v7->_verificationError;
    v7->_verificationError = 0;

    migrationError = v7->_migrationError;
    v7->_migrationError = 0;
  }
  return v7;
}

- (id)allSeriesEntityClassesForDataStore:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (void)HFDataStore:(id)a3 detectedCorruptionOfType:(int64_t)a4 code:(int)a5 error:(id)a6 shouldPromptUser:(BOOL)a7 initialRebuildState:(int64_t)a8 updatedRebuildState:(int64_t)a9
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  _HKInitializeLogging();
  objc_super v11 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "%{public}@: Saw HFD corruption during migration to SQLite - %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)HFDataStoreDetectedOutOfSpace:(id)a3
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Saw out-of-space event migrating the HFD; ignoring (the migration will likely fail)",
      v4,
      2u);
  }
}

- (void)didMigrateHFDataStore:(id)a3 fromState:(int64_t)a4 toState:(int64_t)a5 success:(BOOL)a6 error:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  v13 = v12;
  if (!a6)
  {
    if (v12)
    {
      __int16 v14 = (NSError *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Migration failed at rebuild stage %ld without reporting an error.", a5);
      __int16 v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    migrationError = self->_migrationError;
    self->_migrationError = v14;
  }
  uint64_t v16 = self->_migrationError;
  v17 = [(HDDatabaseMigrationTransaction *)self->_transaction delegate];
  [v17 migrationTransaction:self->_transaction reportHFDMigrationStatus:v16 != 0 schemaVersion:a5 error:self->_migrationError];

  _HKInitializeLogging();
  v18 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    v19 = self->_migrationError;
    *(_DWORD *)buf = 138543874;
    v21 = self;
    __int16 v22 = 2048;
    int64_t v23 = a5;
    __int16 v24 = 2114;
    v25 = v19;
    _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: HFD reported migration to %ld with error: %{public}@", buf, 0x20u);
  }
}

- (BOOL)allowHFDMigration:(id)a3
{
  return 1;
}

- (void)requestRebuildTransactionForHFDataStore:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: HFD unexpectedly requested a rebuild transaction while rebuilding", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)migrateDataForHFDataStore:(id)a3 from:(const void *)a4 to:(void *)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(HDSydneyHFDMigrator *)self allSeriesEntityClassesForDataStore:a3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v17 = v9;
        int v14 = HKWithAutoreleasePool();

        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_12:

  return v15;
}

uint64_t __81__HDSydneyHFDMigrator_migrateDataForHFDataStore_from_to_recoveryAnalytics_error___block_invoke(void *a1, uint64_t a2)
{
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = [*(id *)(a1[4] + 16) protectedDatabase];
  uint64_t v8 = [v4 migrateDataFromDataStore:v5 to:v6 database:v7 recoveryAnalytics:a1[5] error:a2];

  return v8;
}

- (BOOL)migrateDataForHFDataStore:(id)a3 toSQLiteFrom:(const void *)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(HDSydneyHFDMigrator *)self allSeriesEntityClassesForDataStore:a3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        if (!HKWithAutoreleasePool())
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __68__HDSydneyHFDMigrator_migrateDataForHFDataStore_toSQLiteFrom_error___block_invoke(void *a1, uint64_t a2)
{
  v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t v5 = [*(id *)(a1[4] + 16) protectedDatabase];
  uint64_t v6 = [v4 migrateDataToSQLFromStore:v3 database:v5 error:a2];

  return v6;
}

- (void)HFDataStore:(id)a3 setInteger:(int64_t)a4 forKey:(id)a5
{
}

- (int64_t)HFDataStore:(id)a3 integerForKey:(id)a4
{
  return [(HDDatabaseMigrationTransaction *)self->_transaction HFDRebuildState];
}

- (HDSQLiteDatabase)protectedDatabase
{
  return [(HDDatabaseMigrationTransaction *)self->_transaction protectedDatabase];
}

- (int64_t)migrateHFD:(id *)a3
{
  transaction = self->_transaction;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HDSydneyHFDMigrator_migrateHFD___block_invoke;
  void v5[3] = &unk_1E63059D0;
  v5[4] = self;
  return [(HDDatabaseMigrationTransaction *)transaction accessHistoricHFDWithError:a3 block:v5];
}

uint64_t __34__HDSydneyHFDMigrator_migrateHFD___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 delegate];
  [v5 setDelegate:*(void *)(a1 + 32)];
  uint64_t v7 = [v5 rebuildWithTransaction:*(void *)(a1 + 32) error:a3];
  if ([v5 rebuildState] == 20 && (v7 == 3 || !v7) && *(void *)(*(void *)(a1 + 32) + 24))
  {
    [v5 requestHFDToSQLiteMigration];
    id v8 = *(id *)(*(void *)(a1 + 32) + 24);
    BOOL v9 = v8;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v5 setDelegate:v6];
    uint64_t v7 = 1;
  }
  else
  {
    [v5 setDelegate:v6];
  }

  return v7;
}

- (HDDatabaseMigrationTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)corruptionRebuildCompleted
{
  return self->_corruptionRebuildCompleted;
}

- (void)setCorruptionRebuildCompleted:(BOOL)a3
{
  self->_corruptionRebuildCompleted = a3;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void)setVerificationError:(id)a3
{
}

- (NSError)migrationError
{
  return self->_migrationError;
}

- (void)setMigrationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationError, 0);
  objc_storeStrong((id *)&self->_verificationError, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end