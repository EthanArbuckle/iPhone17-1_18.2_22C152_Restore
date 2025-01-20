@interface ATXStableContactRepresentationDatabase
- (ATXStableContactRepresentationDatabase)init;
- (BOOL)_runMigrationSteps:(id)a3;
- (BOOL)migrate;
- (id)cnContactId:(id)a3;
- (id)deleteAllData;
- (id)stableContactIdentifier:(id)a3;
- (int64_t)latestVersion;
- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4;
@end

@implementation ATXStableContactRepresentationDatabase

- (ATXStableContactRepresentationDatabase)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXStableContactRepresentationDatabase;
  return [(ATXAbstractVersionedDatabase *)&v3 initWithDefaultPath:@"stableContactRepresentationDB.db"];
}

- (int64_t)latestVersion
{
  return 2;
}

- (BOOL)migrate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(ATXAbstractVersionedDatabase *)self currentSchemaVersion];
  if (v3 == [(ATXStableContactRepresentationDatabase *)self latestVersion]) {
    return 1;
  }
  if (v3 == 1) {
    goto LABEL_5;
  }
  if (v3) {
    return 1;
  }
  v10[0] = @"CREATE TABLE IF NOT EXISTS canonicalContactRepresentation( cnContactId TEXT PRIMARY KEY,   canonicalCnContactId TEXT NOT NULL) WITHOUT ROWID";
  v10[1] = @"CREATE TABLE IF NOT EXISTS contactInfo( canonicalCnContactId TEXT PRIMARY KEY,   firstName TEXT,   lastName TEXT,   email1 TEXT,   email2 TEXT,   email3 TEXT,   phoneNumber1 TEXT,   phoneNumber2 TEXT,   phoneNumber3 TEXT) WITHOUT ROWID";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  BOOL v5 = [(ATXStableContactRepresentationDatabase *)self _runMigrationSteps:v4];

  if (v5)
  {
LABEL_5:
    v9[0] = @"DROP TABLE IF EXISTS canonicalContactRepresentation";
    v9[1] = @"CREATE TABLE IF NOT EXISTS cnContactIdToStableContactIdentifier( cnContactId TEXT PRIMARY KEY,   stableContactIdentifier TEXT NOT NULL) WITHOUT ROWID";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    BOOL v7 = [(ATXStableContactRepresentationDatabase *)self _runMigrationSteps:v6];

    if (v7) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)_runMigrationSteps:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v8 = [(ATXAbstractVersionedDatabase *)self db];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke;
        v12[3] = &unk_1E68AD188;
        v12[4] = v7;
        v12[5] = &v17;
        [v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }

  BOOL v9 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->super._queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke;
  v11[3] = &unk_1E68AC320;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync_notxn(queue, v11);
}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_2;
  v6[3] = &unk_1E68AD1B0;
  id v7 = a1[5];
  id v8 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3;
  v3[3] = &unk_1E68AD1D8;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO cnContactIdToStableContactIdentifier VALUES (:cnContactId, :stableContactIdentifier)", v6, 0, v3 onPrep onRow onError];
}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":cnContactId" toNSString:v3];
  [v4 bindNamedParam:":stableContactIdentifier" toNSString:*(void *)(a1 + 40)];
}

uint64_t __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3_cold_1(a1, v3, v4);
  }

  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (id)stableContactIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__11;
  queue = self->super._queue;
  long long v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke;
  v9[3] = &unk_1E68AD278;
  v9[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync_notxn(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT stableContactIdentifier FROM cnContactIdToStableContactIdentifier WHERE cnContactId = :cnContactId" onPrep:v6 onRow:v5 onError:v3];
}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cnContactId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnAlias:"stableContactIdentifier"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4_cold_1(a1, v3);
  }

  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (id)cnContactId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__11;
  queue = self->super._queue;
  long long v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke;
  v9[3] = &unk_1E68AD278;
  v9[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync_notxn(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT cnContactId FROM cnContactIdToStableContactIdentifier WHERE stableContactIdentifier = :stableContactIdentifier" onPrep:v6 onRow:v5 onError:v3];
}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":stableContactIdentifier" toNSString:*(void *)(a1 + 32)];
}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnAlias:"cnContactId"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4_cold_1(a1, v3);
  }

  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (id)deleteAllData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  queue = self->super._queue;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke;
  v5[3] = &unk_1E68AD2C8;
  v5[4] = self;
  void v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2;
  v3[3] = &unk_1E68AD2A0;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM cnContactIdToStableContactIdentifier" onPrep:0 onRow:0 onError:v3];
}

uint64_t __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2_cold_1(a1);
  }

  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

void __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Error running migration query: %@ %@", (uint8_t *)&v4, 0x16u);
}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  __int16 v6 = [a2 localizedDescription];
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "Error inserting cnContactId %@, stableContactIdentifier %@: %@", (uint8_t *)&v7, 0x20u);
}

void __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error fetching stableContactIdentifier for cnContactId %@: %@", v5, v6, v7, v8, v9);
}

void __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error fetching cnContactId for stableContactIdentifier %@: %@", v5, v6, v7, v8, v9);
}

void __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v2, v3, "Error deleting cnContactIdToStableContactIdentifier in %@. Error: %@", v4, v5, v6, v7, 2u);
}

@end