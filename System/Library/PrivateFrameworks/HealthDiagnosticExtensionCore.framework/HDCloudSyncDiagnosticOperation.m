@interface HDCloudSyncDiagnosticOperation
- (BOOL)_reportCloudSyncStatusWithHealthStore:(id)a3;
- (id)reportFilename;
- (void)_reportCloudSyncDescriptionWithHealthStore:(id)a3;
- (void)_reportCloudSyncErrors;
- (void)_reportCloudSyncJournalStats;
- (void)_reportCloudSyncKeyValuesWithDatabase:(id)a3;
- (void)_reportCloudSyncStoreDetailsWithDatabase:(id)a3;
- (void)_reportCloudSyncStoreDetailsWithSyncProvenance:(int64_t)a3 storeUUID:(id)a4 database:(id)a5;
- (void)_reportCurrentSyncIdentityWithDatabase:(id)a3;
- (void)run;
@end

@implementation HDCloudSyncDiagnosticOperation

- (id)reportFilename
{
  return @"HealthCloudSync.txt";
}

- (void)run
{
  id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
  if (-[HDCloudSyncDiagnosticOperation _reportCloudSyncStatusWithHealthStore:](self, "_reportCloudSyncStatusWithHealthStore:"))
  {
    v3 = [(HDDiagnosticOperation *)self healthDirectoryURL];
    v4 = [v3 URLByAppendingPathComponent:@"healthdb.sqlite" isDirectory:0];

    v5 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v4];
    [(HDCloudSyncDiagnosticOperation *)self _reportCurrentSyncIdentityWithDatabase:v5];
    [(HDCloudSyncDiagnosticOperation *)self _reportCloudSyncJournalStats];
    [(HDCloudSyncDiagnosticOperation *)self _reportCloudSyncErrors];
    [(HDCloudSyncDiagnosticOperation *)self _reportCloudSyncStoreDetailsWithDatabase:v5];
    [(HDCloudSyncDiagnosticOperation *)self _reportCloudSyncKeyValuesWithDatabase:v5];
    [(HDCloudSyncDiagnosticOperation *)self _reportCloudSyncDescriptionWithHealthStore:v6];
    [v5 close];
  }
}

- (BOOL)_reportCloudSyncStatusWithHealthStore:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F0A1B0]) initWithHealthStore:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncStatusWithHealthStore___block_invoke;
  v11[3] = &unk_264866CA8;
  v13 = &v14;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  [v6 fetchCloudSyncStatusWithCompletion:v11];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting collect Cloud Sync status"];
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncStatusWithHealthStore___block_invoke(uint64_t a1, char a2, void *a3, void *a4, int a5, void *a6)
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (a2)
  {
    [*(id *)(a1 + 32) appendFormat:@"CloudSync Status:"];
    v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v13 stringFromDate:v20];
    [v13 appendFormat:@"\tLast successful push: %@", v14];

    v15 = *(void **)(a1 + 32);
    uint64_t v16 = [v15 stringFromDate:v11];
    [v15 appendFormat:@"\tLast successful pull: %@", v16];

    char v17 = "NO";
    if (a5) {
      char v17 = "YES";
    }
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tSync in-progress: %s", v17);
  }
  else
  {
    v18 = *(void **)(a1 + 32);
    if (v12) {
      [v18 log:@"ERROR: Failed to fetch Cloud Sync status: %@", v12];
    }
    else {
      objc_msgSend(v18, "log:", @"Cloud Sync disabled", v19);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportCurrentSyncIdentityWithDatabase:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F430A0];
  id v14 = 0;
  dispatch_semaphore_t v5 = [MEMORY[0x263F433E8] _rawValuesForKeys:0 domain:v4 category:0 database:a3 error:&v14];
  id v6 = v14;
  v7 = v6;
  if (v5)
  {
    dispatch_time_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    BOOL v9 = [v8 objectForKey:*MEMORY[0x263F43130]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      BOOL v9 = 0;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__HDCloudSyncDiagnosticOperation__reportCurrentSyncIdentityWithDatabase___block_invoke;
    v13[3] = &unk_264866CD0;
    v13[4] = self;
    v10 = (void (**)(void, void, void))MEMORY[0x22A6B8EE0](v13);
    [(HDDiagnosticOperation *)self appendFormat:@"Current Sync Identity:"];
    ((void (**)(void, __CFString *, void *))v10)[2](v10, @"HardwareIdentifier", v9);
    id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F43090]];
    ((void (**)(void, __CFString *, void *))v10)[2](v10, @"DatabaseIdentifier", v11);

    id v12 = [v5 objectForKeyedSubscript:*MEMORY[0x263F43098]];
    ((void (**)(void, __CFString *, void *))v10)[2](v10, @"InstanceDiscriminator", v12);
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"ERROR: Failed to get key value pairs for domain \"%@\": %@", v4, v6];
  }
}

void __73__HDCloudSyncDiagnosticOperation__reportCurrentSyncIdentityWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    dispatch_semaphore_t v5 = (void *)MEMORY[0x263F08C38];
    id v6 = a2;
    objc_msgSend(v5, "hk_UUIDWithData:", a3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v8 UUIDString];
    [v3 appendFormat:@"%@: %@", v6, v7];
  }
  else
  {
    id v8 = a2;
    [v3 appendFormat:@"%@: %@", v8, @"(null)"];
  }
}

- (void)_reportCloudSyncJournalStats
{
  v3 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  uint64_t v4 = [v3 URLByAppendingPathComponent:@"CloudSyncJournals" isDirectory:1];

  uint64_t v13 = 0;
  double v14 = 0.0;
  uint64_t v12 = 0;
  unint64_t v5 = [(HDDiagnosticOperation *)self getFileStatisticsForDirectoryWithURL:v4 earliestModificationDate:&v14 totalFileSize:&v13 maxFileSize:&v12];
  if (v5)
  {
    unint64_t v6 = v5;
    [(HDDiagnosticOperation *)self appendNewline];
    v7 = [v4 lastPathComponent];
    double v8 = (double)v13 * 0.0009765625;
    double v9 = (double)v12 * 0.0009765625;
    v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v14];
    id v11 = [(HDDiagnosticOperation *)self stringFromDate:v10];
    [(HDDiagnosticOperation *)self appendFormat:@"%@: Found %ld unprocessed journal chapters (total %0.2lfkb, max %0.2lfkb). The oldest file was last modified %@", v7, v6, *(void *)&v8, *(void *)&v9, v11];
  }
  else
  {
    v7 = [v4 lastPathComponent];
    [(HDDiagnosticOperation *)self appendFormat:@"%@: No outstanding unprocessed journal chapters.", v7];
  }
}

- (void)_reportCloudSyncKeyValuesWithDatabase:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F43480];
  id v15 = 0;
  unint64_t v5 = [MEMORY[0x263F433E8] _rawValuesForKeys:0 domain:v4 category:0 database:a3 error:&v15];
  id v6 = v15;
  v7 = v6;
  if (v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke;
    v14[3] = &unk_264866CD0;
    v14[4] = self;
    double v8 = (void (**)(void, void, void))MEMORY[0x22A6B8EE0](v14);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke_2;
    v13[3] = &unk_264866CD0;
    v13[4] = self;
    double v9 = (void (**)(void, void, void))MEMORY[0x22A6B8EE0](v13);
    [(HDDiagnosticOperation *)self appendNewline];
    v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F43470]];
    ((void (**)(void, __CFString *, void *))v8)[2](v8, @"Last push forward progress", v10);

    id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F43468]];
    ((void (**)(void, __CFString *, void *))v9)[2](v9, @"Has pull applied change", v11);

    uint64_t v12 = [v5 objectForKeyedSubscript:*MEMORY[0x263F42FC8]];
    ((void (**)(void, __CFString *, void *))v8)[2](v8, @"Restore complete date", v12);
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"ERROR: Failed to get key value pairs for domain \"%@\": %@", v4, v6];
  }
}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    uint64_t v6 = [v4 stringFromDate:a3];
    [v4 appendFormat:@"%@: %@", v8, v6];

    v7 = (void *)v6;
  }
  else
  {
    [v4 appendFormat:@"%@: %@", v5, @"(null)"];
    v7 = v8;
  }
}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    uint64_t v6 = [a3 description];
    [v4 appendFormat:@"%@: %@", v8, v6];

    v7 = (void *)v6;
  }
  else
  {
    [v4 appendFormat:@"%@: %@", v5, @"(null)"];
    v7 = v8;
  }
}

- (void)_reportCloudSyncErrors
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (void *)CFPreferencesCopyValue((CFStringRef)*MEMORY[0x263F43048], (CFStringRef)*MEMORY[0x263F0AD48], (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);
  if ([v3 count])
  {
    [(HDDiagnosticOperation *)self appendNewline];
    [(HDDiagnosticOperation *)self appendString:@"Recent Periodic Sync Errors:"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(HDDiagnosticOperation *)self appendFormat:@"\t%@", *(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_reportCloudSyncStoreDetailsWithDatabase:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F434A0] predicateWithProperty:*MEMORY[0x263F430A8] equalToValue:&unk_26DD8D6A0];
  uint64_t v6 = [MEMORY[0x263F433D8] queryWithDatabase:v4 predicate:v5];
  uint64_t v7 = *MEMORY[0x263F430B0];
  v15[0] = *MEMORY[0x263F43488];
  v15[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v14 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithDatabase___block_invoke;
  v12[3] = &unk_264866CF8;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  char v10 = [v6 enumerateProperties:v8 error:&v14 enumerationHandler:v12];
  id v11 = v14;

  if ((v10 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Failed to query for Cloud Sync stores: %@", v11];
  }
}

uint64_t __75__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithDatabase___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = MEMORY[0x22A6B8A00](a3, 1);
  [*(id *)(a1 + 32) _reportCloudSyncStoreDetailsWithSyncProvenance:v5 storeUUID:v6 database:*(void *)(a1 + 40)];

  return 1;
}

- (void)_reportCloudSyncStoreDetailsWithSyncProvenance:(int64_t)a3 storeUUID:(id)a4 database:(id)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263F43190];
  id v35 = 0;
  id v10 = a5;
  id v11 = [v9 persistedStateForStoreUUID:v8 database:v10 error:&v35];
  id v12 = v35;
  if (!v11)
  {
    id v13 = [v8 UUIDString];
    [(HDDiagnosticOperation *)self log:@"ERROR: Failed to get persistent state for Cloud Sync store %@: %@", v13, v12];
  }
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  id v14 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:0];
  id v15 = [v8 UUIDString];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v15, v14, @"Cloud Sync Store:", v15);

  uint64_t v16 = [NSNumber numberWithLongLong:a3];
  char v17 = [v16 description];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v17, v14, @"Sync Provenance:", v17);

  v18 = [v11 ownerIdentifier];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v18, v14, @"Owner Identifier:", v18);

  uint64_t v19 = [v11 syncIdentity];
  id v20 = [v19 description];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v20, v14, @"Sync Identity:", v20);

  v21 = [v11 containerIdentifier];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v21, v14, @"Container Identifier:", v21);

  v22 = [v11 serverChangeToken];
  v23 = [v22 description];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v23, v14, @"Change Token:", v23);

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "baselineEpoch"));
  v25 = [v24 description];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v25, v14, @"Baseline Epoch:", v25);

  v26 = [v11 rebaseDeadline];
  v27 = [(HDDiagnosticOperation *)self stringFromDate:v26];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v27, v14, @"Rebase Deadline:", v27);

  v28 = [v11 lastSyncDate];
  v29 = [(HDDiagnosticOperation *)self stringFromDate:v28];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v29, v14, @"Last Sync Date:", v29);

  v30 = [v11 lastCheckDate];
  v31 = [(HDDiagnosticOperation *)self stringFromDate:v30];
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v31, v14, @"Last Check Date:", v31);

  uint64_t v32 = [v11 hasEncounteredGapInCurrentEpoch];
  if (v32) {
    v33 = @"YES";
  }
  else {
    v33 = @"NO";
  }
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke(v32, v14, @"Has Encountered Gap:", v33);
  v34 = [v14 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v34];

  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendNewline];
  objc_msgSend(MEMORY[0x263F433C0], "hde_reportSyncAnchorsForSyncProvenance:diagnosticOperation:database:", a3, self, v10);
}

void __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke(uint64_t a1, void *a2, void *a3, __CFString *a4)
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = @"(null)";
  if (a4) {
    uint64_t v7 = a4;
  }
  v14[0] = a3;
  v14[1] = v7;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = v7;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = [v8 arrayWithObjects:v14 count:2];

  [v12 appendRow:v13];
}

- (void)_reportCloudSyncDescriptionWithHealthStore:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F0A1B0]) initWithHealthStore:v4];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __77__HDCloudSyncDiagnosticOperation__reportCloudSyncDescriptionWithHealthStore___block_invoke_2;
  id v12 = &unk_264866D40;
  id v13 = self;
  uint64_t v7 = v5;
  id v14 = v7;
  [v6 fetchCloudDescriptionWithProgress:&__block_literal_global_419 completion:&v9];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting collect Cloud Sync description", v9, v10, v11, v12, v13];
  }
}

void __77__HDCloudSyncDiagnosticOperation__reportCloudSyncDescriptionWithHealthStore___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [v9 appendNewline];
    [*(id *)(a1 + 32) appendNewline];
    [*(id *)(a1 + 32) appendStrongSeparator];
    [*(id *)(a1 + 32) appendString:@"Cloud Description:"];
    [*(id *)(a1 + 32) appendString:v7];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
          [*(id *)(a1 + 32) appendString:@"\n"];
          uint64_t v16 = *(void **)(a1 + 32);
          char v17 = [v15 fullDescription];
          [v16 appendString:v17];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [v9 log:@"ERROR: Failed to get Cloud Sync description: %@", a4];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end