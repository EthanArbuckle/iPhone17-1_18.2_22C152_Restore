@interface HDDatabaseDiagnosticOperation
- (BOOL)_captureUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4 reason:(id)a5;
- (BOOL)_reportStatisticsForUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4;
- (BOOL)allowsSensitiveAttachments;
- (id)reportFilename;
- (void)_reportJournalStatisticsInSubdirectory:(id)a3 profileDirectory:(id)a4;
- (void)_reportMedicalIDStatistics;
- (void)_reportMissingSourceOrderEntriesWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4;
- (void)_reportSizeForHFDAtURL:(id)a3;
- (void)run;
@end

@implementation HDDatabaseDiagnosticOperation

- (id)reportFilename
{
  return @"HealthDatabase.txt";
}

- (void)run
{
  [(HDDiagnosticOperation *)self log:@"Analyzing health database...\n"];
  id v6 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  v3 = [v6 URLByAppendingPathComponent:@"healthdb.sqlite" isDirectory:0];
  v4 = [v6 URLByAppendingPathComponent:@"healthdb_secure.sqlite" isDirectory:0];
  v5 = [v6 URLByAppendingPathComponent:@"healthdb_secure.hfd" isDirectory:0];
  [(HDDiagnosticOperation *)self reportStatsForDatabaseAtURL:v3];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self reportStatsForDatabaseAtURL:v4];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDatabaseDiagnosticOperation *)self _reportSizeForHFDAtURL:v5];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDatabaseDiagnosticOperation *)self _reportJournalStatisticsInSubdirectory:@"Journals" profileDirectory:v6];
  [(HDDatabaseDiagnosticOperation *)self _reportJournalStatisticsInSubdirectory:@"CloudSyncJournals" profileDirectory:v6];
  [(HDDatabaseDiagnosticOperation *)self _reportMedicalIDStatistics];
  if ([(HDDatabaseDiagnosticOperation *)self _reportStatisticsForUnprotectedDatabaseAtURL:v3 protectedDatabaseAtURL:v4]&& ![(HDDatabaseDiagnosticOperation *)self _captureUnprotectedDatabaseAtURL:v3 protectedDatabaseAtURL:v4 reason:@"analysis result"])
  {
    [(HDDiagnosticOperation *)self log:@"Failed to capture databases"];
  }
}

- (BOOL)allowsSensitiveAttachments
{
  return 0;
}

- (BOOL)_captureUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4 reason:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HDDatabaseDiagnosticOperation *)self allowsSensitiveAttachments])
  {
    id v24 = v10;
    [(HDDiagnosticOperation *)self log:@"Capturing Health database for reason: %@", v10];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v9;
    id v26 = v8;
    v31[0] = v8;
    v31[1] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v18 = [(HDDiagnosticOperation *)self attachmentDirectoryURL];
          v19 = [v17 lastPathComponent];
          v20 = [v18 URLByAppendingPathComponent:v19 isDirectory:0];

          if ([(HDDiagnosticOperation *)self copyDatabaseFromURL:v17 toURL:v20])
          {
            ++v14;
          }
          else
          {
            v21 = [v17 path];
            [(HDDiagnosticOperation *)self log:@"Failed to collect database at path %@", v21];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    BOOL v22 = v14 > 0;
    id v9 = v25;
    id v8 = v26;
    id v10 = v24;
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"Sensitive attachments disabled. Skipping database capture for: %@", v10];
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_reportMedicalIDStatistics
{
  id v9 = objc_alloc_init(MEMORY[0x263F08850]);
  v3 = [NSURL URLWithString:@"/var/mobile/Library"];
  v4 = [v3 URLByAppendingPathComponent:@"MedicalID"];
  v5 = [v4 URLByAppendingPathComponent:@"MedicalIDData.archive" isDirectory:0];

  id v6 = [v5 path];
  int v7 = [v9 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [(HDDiagnosticOperation *)self prettyPrintFileSize:[(HDDiagnosticOperation *)self fileSizeForURL:v5]];
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", @"Medical ID has been set up; archive is %@",
      v8);
  }
  else
  {
    [(HDDiagnosticOperation *)self appendFormat:@"No medical ID present."];
  }
}

- (BOOL)_reportStatisticsForUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4
{
  v18[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  id v8 = [v7 path];
  [(HDDiagnosticOperation *)self appendFormat:@"Unprotected Database (%@):\n", v8];

  [(HDDiagnosticOperation *)self verifyPermissionsForFileAtURL:v7];
  id v9 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v7];

  if (v9)
  {
    [(HDDiagnosticOperation *)self log:@"Analyzing unprotected database..."];
    [(HDDiagnosticOperation *)self reportIntegrityForDatabase:v9];
    [(HDDiagnosticOperation *)self checkSchemaVersionForDatabase:v9 currentSchema:18201 futureSchema:100002];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
    [(HDDiagnosticOperation *)self reportCountsForDatabase:v9 entityClasses:v10];
  }
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  v11 = [v6 path];
  [(HDDiagnosticOperation *)self appendFormat:@"Protected Database (%@):\n", v11];

  [(HDDiagnosticOperation *)self verifyPermissionsForFileAtURL:v6];
  uint64_t v12 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v6];

  if (v12)
  {
    [(HDDiagnosticOperation *)self log:@"Analyzing protected database..."];
    uint64_t v13 = [v12 fileURL];
    uint64_t v14 = [v13 path];
    [(HDDiagnosticOperation *)self log:@"Skip integrity check for %@", v14];

    [(HDDiagnosticOperation *)self checkSchemaVersionForDatabase:v12 currentSchema:18006 futureSchema:100017];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    v17[8] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:9];
    [(HDDiagnosticOperation *)self reportCountsForDatabase:v12 entityClasses:v15];

    if (v9) {
      [(HDDatabaseDiagnosticOperation *)self _reportMissingSourceOrderEntriesWithUnprotectedDatabase:v9 protectedDatabase:v12];
    }
  }
  [v12 close];
  [v9 close];

  return 0;
}

- (void)_reportSizeForHFDAtURL:(id)a3
{
  id v16 = a3;
  v4 = [v16 path];
  [(HDDiagnosticOperation *)self appendFormat:@"HFD database %@:", v4];

  id v5 = objc_alloc_init(MEMORY[0x263F08850]);
  id v6 = [v16 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    int64_t v8 = [(HDDiagnosticOperation *)self fileSizeForURL:v16];
    if ((v8 & 0x8000000000000000) == 0)
    {
      int64_t v9 = v8;
      id v10 = [v16 lastPathComponent];
      [(HDDiagnosticOperation *)self appendFormat:@"\t%@:", v10];

      v11 = [(HDDiagnosticOperation *)self prettyPrintFileSize:v9];
      [(HDDiagnosticOperation *)self appendFormat:@"\t\tSize:\t\t%@", v11];

      uint64_t v12 = [(HDDiagnosticOperation *)self fileCreationDateForURL:v16];
      uint64_t v13 = [(HDDiagnosticOperation *)self stringFromDate:v12];
      [(HDDiagnosticOperation *)self appendFormat:@"\t\tCreated:\t%@", v13];

      uint64_t v14 = [(HDDiagnosticOperation *)self fileModificationDateForURL:v16];
      uint64_t v15 = [(HDDiagnosticOperation *)self stringFromDate:v14];
      [(HDDiagnosticOperation *)self appendFormat:@"\t\tModified:\t%@", v15];
    }
  }
  else
  {
    [(HDDiagnosticOperation *)self appendFormat:@"\tNo HFD store"];
  }
}

- (void)_reportJournalStatisticsInSubdirectory:(id)a3 profileDirectory:(id)a4
{
  id v6 = a3;
  int v7 = [a4 URLByAppendingPathComponent:v6 isDirectory:1];
  uint64_t v15 = 0;
  double v16 = 0.0;
  uint64_t v14 = 0;
  unint64_t v8 = [(HDDiagnosticOperation *)self getFileStatisticsForDirectoryWithURL:v7 earliestModificationDate:&v16 totalFileSize:&v15 maxFileSize:&v14];
  if (v8)
  {
    unint64_t v9 = v8;
    double v10 = (double)v15 * 0.0009765625;
    double v11 = (double)v14 * 0.0009765625;
    uint64_t v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v16];
    uint64_t v13 = [(HDDiagnosticOperation *)self stringFromDate:v12];
    [(HDDiagnosticOperation *)self appendFormat:@"%@: Found %ld unprocessed journal chapters (total %0.2lfkb, max %0.2lfkb). The oldest file was last modified %@", v6, v9, *(void *)&v10, *(void *)&v11, v13];
  }
  else
  {
    [(HDDiagnosticOperation *)self appendFormat:@"%@: No outstanding unprocessed journal chapters.", v6];
  }
}

- (void)_reportMissingSourceOrderEntriesWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HDDiagnosticOperation *)self log:@"Checking for missing source order entries..."];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v9 = NSString;
  uint64_t v10 = *MEMORY[0x263F43038];
  uint64_t v11 = *MEMORY[0x263F43040];
  uint64_t v12 = [MEMORY[0x263F43240] databaseTable];
  uint64_t v13 = *MEMORY[0x263F43488];
  uint64_t v14 = [v9 stringWithFormat:@"SELECT %@, %@ FROM %@ ORDER BY %@ ASC, %@ ASC", v10, v11, v12, v10, *MEMORY[0x263F43488]];

  v40[0] = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke;
  v38[3] = &unk_264866D68;
  id v15 = v8;
  id v39 = v15;
  LOBYTE(v12) = [v7 executeSQL:v14 error:v40 bindingHandler:0 enumerationHandler:v38];

  id v16 = v40[0];
  v17 = v16;
  if (v12)
  {
    v31 = NSString;
    uint64_t v18 = *MEMORY[0x263F43078];
    uint64_t v19 = *MEMORY[0x263F42FF0];
    long long v30 = [MEMORY[0x263F43318] databaseTable];
    long long v29 = [MEMORY[0x263F431C8] databaseTable];
    uint64_t v28 = *MEMORY[0x263F42FE0];
    [MEMORY[0x263F431D8] databaseTable];
    v20 = uint64_t v33 = v6;
    [MEMORY[0x263F431C8] databaseTable];
    v21 = v32 = self;
    BOOL v22 = v15;
    uint64_t v23 = *MEMORY[0x263F42FE8];
    uint64_t v24 = [MEMORY[0x263F431D8] databaseTable];
    uint64_t v27 = v23;
    id v15 = v22;
    uint64_t v25 = [v31 stringWithFormat:@"SELECT %@, %@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ ON %@.%@=%@.%@ GROUP BY %@, %@", v18, v19, v30, v29, v28, v20, v21, v27, v24, v13, v18, v19];

    id v6 = v33;
    id v37 = 0;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke_2;
    v34[3] = &unk_264866D90;
    id v35 = v22;
    v36 = v32;
    LOBYTE(v24) = [v33 executeSQL:v25 error:&v37 bindingHandler:0 enumerationHandler:v34];
    id v26 = v37;
    v17 = v26;
    if ((v24 & 1) == 0) {
      [(HDDiagnosticOperation *)v32 log:@"Failed to enumerate data_type/source_id combinations: %@", v26];
    }

    uint64_t v14 = (void *)v25;
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"Unable to look up source order information: %@", v16];
  }
}

uint64_t __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = MEMORY[0x22A6B89E0](a2, 0);
  id v5 = MEMORY[0x22A6B89E0](a2, 1);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
  }
  [v6 addObject:v5];

  return 1;
}

uint64_t __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = MEMORY[0x22A6B89E0](a2, 0);
  id v5 = MEMORY[0x22A6B89E0](a2, 1);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6 && ([v6 containsObject:v5] & 1) == 0) {
    [*(id *)(a1 + 40) appendFormat:@"WARNING: Source order for data type %@ is missing entry for source %@", v4, v5];
  }

  return 1;
}

@end