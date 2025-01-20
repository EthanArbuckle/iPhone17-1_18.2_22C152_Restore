@interface CADDiagnosticsDatabaseCollector
- (void)collect:(id)a3;
- (void)determineExpectedOutputFiles:(id)a3;
@end

@implementation CADDiagnosticsDatabaseCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [CADDiagnosticsDatabaseCollectorDBInfo alloc];
  v7 = (void *)CalDatabaseCopyDirectoryPath();
  v8 = [(CADDiagnosticsDatabaseCollectorDBInfo *)v6 initWithPossiblyUnmigratedDatabaseDirectory:v7 context:v4];

  if (v8) {
    [v5 addObject:v8];
  }
  uint64_t v9 = CalDatabaseCreateWithOptions();
  if (v9)
  {
    v10 = (const void *)v9;
    v24 = self;
    v25 = v8;
    v23 = [[CADDiagnosticsDatabaseCollectorDBInfo alloc] initWithMainDatabase:v9 context:v4];
    objc_msgSend(v5, "addObject:");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = (id)CalDatabaseCopyAllAuxDatabases();
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = [[CADDiagnosticsDatabaseCollectorDBInfo alloc] initWithMainDatabase:v10 auxDatabase:*(void *)(*((void *)&v31 + 1) + 8 * v14) context:v4];
          [v5 addObject:v15];
          v16 = (void *)CalAuxDatabaseCopyPath();
          v17 = [[CADDiagnosticsDatabaseCollectorDBInfo alloc] initWithPossiblyUnmigratedDatabaseDirectory:v16 context:v4];
          if (v17) {
            [v5 addObject:v17];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v12);
    }

    CFRelease(v10);
    self = v24;
    v8 = v25;
  }
  else
  {
    [v4 logError:@"Couldn't open main database; not going to be able to collect any databases."];
  }
  objc_storeStrong((id *)&self->_dbInfos, v5);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v18 = self->_dbInfos;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v22++) determineExpectedOutputFiles:v4];
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

- (void)collect:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_dbInfos;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "collect:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end