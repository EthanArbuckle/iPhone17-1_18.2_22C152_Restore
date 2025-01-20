@interface HDNanoSyncDiagnosticOperation
- (id)_reportDetailsForDevice:(id)a3 database:(id)a4;
- (id)_sortedPairedDevices;
- (id)nanoSyncDatabaseURL;
- (id)reportFilename;
- (int64_t)_countOfMessagesForDeviceIdentifier:(id)a3 description:(id)a4 predicateSQL:(id)a5 date:(id)a6 database:(id)a7;
- (void)_collectNanoSyncMessageDatabase;
- (void)_reportIDSSummaryForDeviceIdentifier:(id)a3 database:(id)a4;
- (void)_reportMostRecentMessageDateWithDeviceIdentifier:(id)a3 description:(id)a4 field:(id)a5 predicateSQL:(id)a6 database:(id)a7;
- (void)_reportMostRecentMessageErrorsWithDeviceIdentifier:(id)a3 database:(id)a4;
- (void)_reportQuickSwitchSummaryWithDevicesByPairingID:(id)a3;
- (void)_reportSummaryWithDevices:(id)a3;
- (void)run;
@end

@implementation HDNanoSyncDiagnosticOperation

- (id)nanoSyncDatabaseURL
{
  v2 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"NanoSync" isDirectory:1];

  v4 = [v3 URLByAppendingPathComponent:@"com.apple.private.alloy.health.sync.db" isDirectory:0];

  return v4;
}

- (id)reportFilename
{
  return @"HealthNanoSync.txt";
}

- (void)run
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(HDNanoSyncDiagnosticOperation *)self _collectNanoSyncMessageDatabase];
  v3 = [(HDNanoSyncDiagnosticOperation *)self _sortedPairedDevices];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    uint64_t v9 = *MEMORY[0x263F57620];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = [v11 valueForProperty:v9];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    -[HDDiagnosticOperation log:](self, "log:", @"Found %lu paired devices", [v5 count]);
    [(HDNanoSyncDiagnosticOperation *)self _reportSummaryWithDevices:v5];
    [(HDNanoSyncDiagnosticOperation *)self _reportQuickSwitchSummaryWithDevicesByPairingID:v4];
    v13 = [(HDDiagnosticOperation *)self healthDirectoryURL];
    uint64_t v14 = [v13 URLByAppendingPathComponent:@"healthdb.sqlite" isDirectory:0];

    v26 = (void *)v14;
    v15 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v14];
    v16 = [(HDNanoSyncDiagnosticOperation *)self nanoSyncDatabaseURL];
    v17 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v16];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          [(HDDiagnosticOperation *)self appendNewline];
          [(HDDiagnosticOperation *)self appendStrongSeparator];
          if (v15)
          {
            uint64_t v24 = [(HDNanoSyncDiagnosticOperation *)self _reportDetailsForDevice:v23 database:v15];
            v25 = (void *)v24;
            if (v17 && v24) {
              [(HDNanoSyncDiagnosticOperation *)self _reportIDSSummaryForDeviceIdentifier:v24 database:v17];
            }
          }
          else
          {
            v25 = 0;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }

    [v15 close];
    [v17 close];
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"No paired devices"];
  }
}

- (void)_collectNanoSyncMessageDatabase
{
  id v10 = [(HDNanoSyncDiagnosticOperation *)self nanoSyncDatabaseURL];
  id v3 = objc_alloc_init(MEMORY[0x263F08850]);
  id v4 = [v10 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    [(HDDiagnosticOperation *)self log:@"Collecting and analyzing NanoSync message database..."];
    uint64_t v6 = [(HDDiagnosticOperation *)self attachmentDirectoryURL];
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"com.apple.private.alloy.health.sync.db" isDirectory:0];

    if ([(HDDiagnosticOperation *)self copyDatabaseFromURL:v10 toURL:v7]) {
      goto LABEL_6;
    }
    uint64_t v8 = @"Failed to collect NanoSync message database.";
  }
  else
  {
    uint64_t v7 = [v10 path];
    uint64_t v9 = v7;
    uint64_t v8 = @"No NanoSync message database present at %@; skipping sync collection and analysis.";
  }
  -[HDDiagnosticOperation log:](self, "log:", v8, v9);
LABEL_6:
}

- (id)_sortedPairedDevices
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [v2 getSetupCompletedDevices];

  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_1];

  return v4;
}

uint64_t __53__HDNanoSyncDiagnosticOperation__sortedPairedDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x263F575A8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 valueForProperty:v4];
  uint64_t v8 = [v5 valueForProperty:v4];
  uint64_t v9 = *MEMORY[0x263F575D8];
  id v10 = [v6 valueForProperty:*MEMORY[0x263F575D8]];

  v11 = [v5 valueForProperty:v9];

  if ([v7 isEqualToNumber:v8])
  {
    v12 = v11;
    v13 = v10;
  }
  else
  {
    v12 = v8;
    v13 = v7;
  }
  uint64_t v14 = [v12 compare:v13];

  return v14;
}

- (void)_reportSummaryWithDevices:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", @"%lu Paired Devices:", [v4 count]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v29 = *(void *)v31;
    uint64_t v28 = *MEMORY[0x263F575A8];
    uint64_t v27 = *MEMORY[0x263F57658];
    uint64_t v26 = *MEMORY[0x263F57628];
    uint64_t v24 = *MEMORY[0x263F575D8];
    uint64_t v25 = *MEMORY[0x263F57610];
    uint64_t v23 = *MEMORY[0x263F575E0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v9 = [v8 valueForProperty:v28];
        int v10 = [v9 BOOLValue];

        v11 = [v8 valueForProperty:v27];
        v12 = [v8 valueForProperty:v26];
        v13 = [v8 valueForProperty:v25];
        uint64_t v14 = [v8 valueForProperty:v24];
        v15 = [(HDDiagnosticOperation *)self stringFromDate:v14];

        v16 = [v8 valueForProperty:v23];
        v17 = [(HDDiagnosticOperation *)self stringFromDate:v16];

        if (v10)
        {
          [NSString stringWithFormat:@"(active since %@)", v15, v21];
        }
        else
        {
          id v18 = &stru_26DD8B888;
          if (v15) {
            uint64_t v19 = v15;
          }
          else {
            uint64_t v19 = &stru_26DD8B888;
          }
          if (v17) {
            id v18 = v17;
          }
          [NSString stringWithFormat:@"(last active %@ - %@)", v19, v18];
        uint64_t v20 = };
        [(HDDiagnosticOperation *)self appendFormat:@"\t\"%@\" %@ %@ %@", v13, v12, v11, v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
}

- (void)_reportQuickSwitchSummaryWithDevicesByPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F57730] sharedInstance];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  [v5 switchIndex];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__HDNanoSyncDiagnosticOperation__reportQuickSwitchSummaryWithDevicesByPairingID___block_invoke;
  v7[3] = &unk_264867070;
  uint64_t v9 = v10;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 getSwitchEventsFromIndex:0 inlineCallback:v7];

  _Block_object_dispose(v10, 8);
}

void __81__HDNanoSyncDiagnosticOperation__reportQuickSwitchSummaryWithDevicesByPairingID___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a3;
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) appendFormat:@"\nQuick Switch Events:"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 valueForProperty:*MEMORY[0x263F57610]];
  }
  else
  {
    uint64_t v9 = @"Unknown";
  }
  int v10 = [*(id *)(a1 + 32) stringFromDate:v13];
  char v11 = *(void **)(a1 + 32);
  v12 = [v6 UUIDString];
  [v11 appendFormat:@"\tSwitched to %@ \"%@\" at %@", v12, v9, v10];
}

- (id)_reportDetailsForDevice:(id)a3 database:(id)a4
{
  v57[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F57620];
  id v8 = a3;
  uint64_t v9 = [v8 valueForProperty:v7];
  int v10 = [v8 valueForProperty:*MEMORY[0x263F575A8]];
  int v47 = [v10 BOOLValue];

  char v11 = [v8 valueForProperty:*MEMORY[0x263F57658]];
  v12 = [v8 valueForProperty:*MEMORY[0x263F57628]];
  id v13 = [v8 valueForProperty:*MEMORY[0x263F57610]];
  uint64_t v14 = [v8 valueForProperty:*MEMORY[0x263F575D8]];
  uint64_t v15 = [(HDDiagnosticOperation *)self stringFromDate:v14];

  v16 = [v8 valueForProperty:*MEMORY[0x263F575E0]];
  v50 = [(HDDiagnosticOperation *)self stringFromDate:v16];

  v17 = [v8 valueForProperty:*MEMORY[0x263F57618]];

  id v18 = [(HDDiagnosticOperation *)self stringFromDate:v17];

  id v51 = 0;
  id v48 = v6;
  uint64_t v19 = [MEMORY[0x263F43280] nanoPairingEntityWithRegistryUUID:v9 database:v6 error:&v51];
  id v20 = v51;
  uint64_t v21 = v20;
  v49 = (void *)v15;
  if (v19)
  {
    id v45 = v20;
    v22 = " (inactive)";
    if (v47) {
      v22 = "";
    }
    v46 = v12;
    if (v47) {
      uint64_t v23 = @"    Active:";
    }
    else {
      uint64_t v23 = @"    Was Active:";
    }
    [(HDDiagnosticOperation *)self appendFormat:@"\"%@\" %@ %@%s", v13, v12, v11, v22];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:0];
    v57[0] = v23;
    uint64_t v25 = (void *)v15;
    if ((v47 & 1) == 0)
    {
      uint64_t v25 = [NSString stringWithFormat:@"%@ - %@", v15, v50];
    }
    v57[1] = v25;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
    [v24 appendRow:v26];

    uint64_t v27 = v48;
    if ((v47 & 1) == 0) {

    }
    v56[0] = @"    Pairing ID:";
    uint64_t v28 = [v9 UUIDString];
    v56[1] = v28;
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
    [v24 appendRow:v29];

    v55[0] = @"    IDS ID:";
    uint64_t v30 = [v19 deviceIdentifier];
    long long v31 = (void *)v30;
    if (v30) {
      long long v32 = (__CFString *)v30;
    }
    else {
      long long v32 = @"(null)";
    }
    v55[1] = v32;
    long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    [v24 appendRow:v33];

    v54[0] = @"    Paired:";
    v54[1] = v18;
    long long v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
    [v24 appendRow:v34];

    v53[0] = @"    Source:";
    uint64_t v35 = [v19 defaultSourceBundleIdentifier];
    v36 = (void *)v35;
    if (v35) {
      uint64_t v37 = (__CFString *)v35;
    }
    else {
      uint64_t v37 = @"(null)";
    }
    v53[1] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
    [v24 appendRow:v38];

    v52[0] = @"    Restore Complete:";
    int v39 = [v19 isRestoreComplete];
    v40 = @"NO";
    if (v39) {
      v40 = @"YES";
    }
    v52[1] = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    [v24 appendRow:v41];

    [(HDDiagnosticOperation *)self appendNewline];
    v42 = [v24 formattedTable];
    [(HDDiagnosticOperation *)self appendString:v42];

    [(HDDiagnosticOperation *)self appendNewline];
    [(HDDiagnosticOperation *)self appendNewline];
    objc_msgSend(MEMORY[0x263F433C0], "hde_reportSyncAnchorsForSyncProvenance:diagnosticOperation:database:", objc_msgSend(v19, "syncProvenance"), self, v48);
    v43 = [v19 deviceIdentifier];

    v12 = v46;
    uint64_t v21 = v45;
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"Failed to find sync store for NRDevice %@: %@", v9, v20];
    v43 = 0;
    uint64_t v27 = v48;
  }

  return v43;
}

- (void)_reportIDSSummaryForDeviceIdentifier:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendFormat:@"IDS Message Statistics (last 7 days):"];
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  int v10 = objc_msgSend(v8, "hk_dateBySubtractingDays:fromDate:", 7, v9);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke;
  v21[3] = &unk_264867098;
  v21[4] = self;
  id v11 = v6;
  id v22 = v11;
  id v23 = v10;
  id v12 = v7;
  id v24 = v12;
  id v13 = v10;
  uint64_t v14 = (void (**)(void, void, void))MEMORY[0x22A6B8EE0](v21);
  ((void (**)(void, __CFString *, __CFString *))v14)[2](v14, @"received", @"outgoing = 0");
  ((void (**)(void, __CFString *, __CFString *))v14)[2](v14, @"sent", @"outgoing = 1 AND send_timestamp IS NOT NULL");
  ((void (**)(void, __CFString *, __CFString *))v14)[2](v14, @"pending", @"outgoing = 1 AND send_timestamp IS NULL AND error_code IS NULL");
  ((void (**)(void, __CFString *, __CFString *))v14)[2](v14, @"failed", @"outgoing = 1 AND error_code IS NOT NULL");
  [(HDDiagnosticOperation *)self appendNewline];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke_2;
  v18[3] = &unk_2648670C0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v15 = v12;
  id v16 = v11;
  v17 = (void (**)(void, void, void, void))MEMORY[0x22A6B8EE0](v18);
  ((void (**)(void, __CFString *, __CFString *, __CFString *))v17)[2](v17, @"Last message received", @"timestamp", @"outgoing = 0");
  ((void (**)(void, __CFString *, __CFString *, __CFString *))v17)[2](v17, @"Last message sent", @"send_timestamp", @"outgoing = 1 AND send_timestamp IS NOT NULL");
  ((void (**)(void, __CFString *, __CFString *, __CFString *))v17)[2](v17, @"Last message failed", @"error_timestamp", @"outgoing = 1 AND error_code IS NOT NULL");
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendFormat:@"Recent IDS Errors:"];
  [(HDNanoSyncDiagnosticOperation *)self _reportMostRecentMessageErrorsWithDeviceIdentifier:v16 database:v15];
}

uint64_t __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _countOfMessagesForDeviceIdentifier:*(void *)(a1 + 40) description:a2 predicateSQL:a3 date:*(void *)(a1 + 48) database:*(void *)(a1 + 56)];
}

uint64_t __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _reportMostRecentMessageDateWithDeviceIdentifier:*(void *)(a1 + 40) description:a2 field:a3 predicateSQL:a4 database:*(void *)(a1 + 48)];
}

- (int64_t)_countOfMessagesForDeviceIdentifier:(id)a3 description:(id)a4 predicateSQL:(id)a5 date:(id)a6 database:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v17 = [NSString stringWithFormat:@"SELECT COUNT(*) FROM message_records WHERE device_id LIKE ? AND timestamp > ? AND %@", v14];
  id v32 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke;
  v29[3] = &unk_2648670E8;
  id v18 = v12;
  id v30 = v18;
  id v19 = v15;
  id v31 = v19;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke_2;
  v26[3] = &unk_264867110;
  uint64_t v28 = &v33;
  v26[4] = self;
  id v20 = v13;
  id v27 = v20;
  char v21 = [v16 executeSQL:v17 error:&v32 bindingHandler:v29 enumerationHandler:v26];
  id v22 = v32;
  id v23 = v22;
  if ((v21 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"Failed to count rows in table 'message_records': %@", v22];
  }
  int64_t v24 = v34[3];

  _Block_object_dispose(&v33, 8);
  return v24;
}

uint64_t __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  return sqlite3_bind_double(a2, 2, v4);
}

uint64_t __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1) {
    [*(id *)(a1 + 32) appendFormat:@"\t%lld %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 40)];
  }
  return 0;
}

- (void)_reportMostRecentMessageDateWithDeviceIdentifier:(id)a3 description:(id)a4 field:(id)a5 predicateSQL:(id)a6 database:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = NSString;
  id v16 = a7;
  v17 = [v15 stringWithFormat:@"SELECT %@ FROM message_records WHERE device_id LIKE ? AND %@ ORDER BY %@ DESC LIMIT 1", v14, a6, v14];
  id v26 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke;
  v24[3] = &unk_264867138;
  id v18 = v12;
  id v25 = v18;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke_2;
  v22[3] = &unk_264866D90;
  v22[4] = self;
  id v19 = v13;
  id v23 = v19;
  LOBYTE(v12) = [v16 executeSQL:v17 error:&v26 bindingHandler:v24 enumerationHandler:v22];

  id v20 = v26;
  char v21 = v20;
  if ((v12 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"Failed to get latest %@ value in table 'message_records': %@", v14, v20];
  }
}

uint64_t __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = MEMORY[0x22A6B89C0](a2, 0);
  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v4 stringFromDate:v3];
    [v4 appendFormat:@"\t%@ %@", v5, v6];
  }
  return 0;
}

- (void)_reportMostRecentMessageErrorsWithDeviceIdentifier:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v14 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke;
  v12[3] = &unk_264867138;
  id v7 = v6;
  id v13 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke_2;
  v11[3] = &unk_264866D68;
  v11[4] = self;
  char v8 = [a4 executeSQL:@"SELECT uuid, timestamp, error_domain, error_code FROM message_records WHERE device_id LIKE ? AND error_code IS NOT NULL ORDER BY error_timestamp DESC LIMIT 5", &v14, v12, v11 error bindingHandler enumerationHandler];
  id v9 = v14;
  int v10 = v9;
  if ((v8 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"Failed to get latest errors in table 'message_records': %@", v9];
  }
}

uint64_t __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = MEMORY[0x22A6B89F0](a2, 0);
  uint64_t v5 = MEMORY[0x22A6B89C0](a2, 1);
  id v6 = MEMORY[0x22A6B89F0](a2, 2);
  uint64_t v7 = HDSQLiteColumnAsInt64();
  char v8 = *(void **)(a1 + 32);
  id v9 = [v8 stringFromDate:v5];
  [v8 appendFormat:@"\t%@ %@ code: %lld (sent %@)", v4, v6, v7, v9];

  return 0;
}

@end