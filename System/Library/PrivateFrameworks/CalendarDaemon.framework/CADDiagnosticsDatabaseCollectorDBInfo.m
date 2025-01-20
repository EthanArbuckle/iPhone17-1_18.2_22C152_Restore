@interface CADDiagnosticsDatabaseCollectorDBInfo
- (BOOL)backupDatabaseFromPath:(id)a3 toPath:(id)a4 context:(id)a5;
- (BOOL)collectMovedAsideDatabaseWithoutRedacting:(id)a3;
- (BOOL)redactAndCollectMovedAsideDatabase:(id)a3;
- (BOOL)redactAndCompress:(id)a3 context:(id)a4;
- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 auxDatabase:(void *)a4 context:(id)a5;
- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 context:(id)a4;
- (CADDiagnosticsDatabaseCollectorDBInfo)initWithPossiblyUnmigratedDatabaseDirectory:(id)a3 context:(id)a4;
- (void)collect:(id)a3;
- (void)collectMovedAsideDatabase:(id)a3;
- (void)collectStandardDatabase:(id)a3;
- (void)dealloc;
- (void)determineExpectedOutputFiles:(id)a3;
@end

@implementation CADDiagnosticsDatabaseCollectorDBInfo

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 context:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  v7 = [(CADDiagnosticsDatabaseCollectorDBInfo *)&v12 init];
  if (v7)
  {
    if ([v6 redactLogs]) {
      v8 = @"Calendar-redacted.sqlitedb.gz";
    }
    else {
      v8 = @"Calendar.sqlitedb.gz";
    }
    uint64_t v9 = [v6 temporaryFileForName:v8];
    outputURL = v7->_outputURL;
    v7->_outputURL = (NSURL *)v9;

    v7->_mainDatabase = a3;
    CFRetain(a3);
  }

  return v7;
}

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 auxDatabase:(void *)a4 context:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  uint64_t v9 = [(CADDiagnosticsDatabaseCollectorDBInfo *)&v16 init];
  if (v9)
  {
    uint64_t UID = CalAuxDatabaseGetUID();
    if ([v8 redactLogs]) {
      v11 = @"Calendar-aux%i-redacted.sqlitedb.gz";
    }
    else {
      v11 = @"Calendar-aux%i.sqlitedb.gz";
    }
    objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", v11, UID);
    uint64_t v13 = [v8 temporaryFileForName:v12];
    outputURL = v9->_outputURL;
    v9->_outputURL = (NSURL *)v13;

    v9->_mainDatabase = a3;
    CFRetain(a3);
    v9->_auxDatabase = a4;
    CFRetain(a4);
  }
  return v9;
}

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithPossiblyUnmigratedDatabaseDirectory:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  id v8 = [(CADDiagnosticsDatabaseCollectorDBInfo *)&v36 init];
  if (v8)
  {
    uint64_t v9 = CalDatabaseMovedAsideDatabaseFilePathInDirectory();
    objc_storeStrong((id *)&v8->_movedAsideDatabasePath, v9);
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (![v10 fileExistsAtPath:v9])
    {
LABEL_17:
      uint64_t v13 = v8;
LABEL_27:

      goto LABEL_28;
    }
    [v7 log:@"Found moved aside database at %@", v9];
    v11 = [v6 lastPathComponent];
    if (([v11 isEqualToString:@"Calendar"] & 1) != 0
      || ([v11 isEqualToString:@"Calendars"] & 1) != 0)
    {
      objc_super v12 = &stru_1F1509B08;
    }
    else
    {
      objc_super v12 = [NSString stringWithFormat:@"%@-", v11];
    }
    if ([v7 redactLogs])
    {
      ppDb = 0;
      id v14 = v9;
      if (sqlite3_open_v2((const char *)[v14 fileSystemRepresentation], &ppDb, 1, 0) || !ppDb)
      {
        [v7 logError:@"Couldn't open database at path %@", v14, v33];
      }
      else
      {
        ppStmt = 0;
        uint64_t v15 = sqlite3_prepare_v2(ppDb, "SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion'", -1, &ppStmt, 0);
        if (v15 || !ppStmt)
        {
          [v7 logError:@"Couldn't check moved-aside database version at path %@: %i", v14, v15];
          sqlite3_close(ppDb);
        }
        else
        {
          uint64_t v16 = sqlite3_step(ppStmt);
          if (v16 == 100)
          {
            uint64_t v17 = sqlite3_column_int(ppStmt, 0);
          }
          else
          {
            objc_msgSend(v7, "logError:", @"Unexpectedly got result %i for sqlite3_step", v16);
            uint64_t v17 = 0;
          }
          sqlite3_finalize(ppStmt);
          uint64_t v28 = sqlite3_close(ppDb);
          if (v28) {
            objc_msgSend(v7, "logError:", @"Error closing database: %i", v28);
          }
          if (v17 == 18010)
          {
            v29 = [NSString stringWithFormat:@"Calendar-unableToMigrate-%@redacted.sqlitedb.gz", v12];
            uint64_t v30 = [v7 temporaryFileForName:v29];
            outputURL = v8->_outputURL;
            v8->_outputURL = (NSURL *)v30;

            goto LABEL_16;
          }
          objc_msgSend(v7, "logError:", @"Cannot attach moved aside database because it is version %i and the current version is %i", v17, 18010);
        }
      }

      uint64_t v13 = 0;
      goto LABEL_27;
    }
    v18 = NSString;
    v19 = [v9 lastPathComponent];
    v20 = [v18 stringWithFormat:@"%@%@", v12, v19];

    v21 = [v20 stringByAppendingString:@"-wal"];
    v22 = [v20 stringByAppendingPathExtension:@"gz"];
    uint64_t v23 = [v7 temporaryFileForName:v22];
    v24 = v8->_outputURL;
    v8->_outputURL = (NSURL *)v23;

    v25 = [v21 stringByAppendingPathExtension:@"gz"];
    uint64_t v26 = [v7 temporaryFileForName:v25];
    walOutputURL = v8->_walOutputURL;
    v8->_walOutputURL = (NSURL *)v26;

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v13 = 0;
LABEL_28:

  return v13;
}

- (void)dealloc
{
  auxDatabase = self->_auxDatabase;
  if (auxDatabase) {
    CFRelease(auxDatabase);
  }
  mainDatabase = self->_mainDatabase;
  if (mainDatabase) {
    CFRelease(mainDatabase);
  }
  v5.receiver = self;
  v5.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  [(CADDiagnosticsDatabaseCollectorDBInfo *)&v5 dealloc];
}

- (void)determineExpectedOutputFiles:(id)a3
{
  id v4 = a3;
  [v4 setStatus:0 forFile:self->_outputURL];
  if (self->_walOutputURL) {
    objc_msgSend(v4, "setStatus:forFile:", 0);
  }
}

- (void)collect:(id)a3
{
  id v4 = a3;
  if (([v4 canceled] & 1) == 0)
  {
    if (self->_movedAsideDatabasePath) {
      [(CADDiagnosticsDatabaseCollectorDBInfo *)self collectMovedAsideDatabase:v4];
    }
    else {
      [(CADDiagnosticsDatabaseCollectorDBInfo *)self collectStandardDatabase:v4];
    }
  }
}

- (void)collectStandardDatabase:(id)a3
{
  id v14 = a3;
  if (self->_mainDatabase)
  {
    p_outputURL = &self->_outputURL;
    if (self->_auxDatabase) {
      objc_super v5 = @"an auxiliary";
    }
    else {
      objc_super v5 = @"the main";
    }
    id v6 = [(NSURL *)self->_outputURL lastPathComponent];
    [v14 log:@"Collecting %@ database (for output file %@)", v5, v6];

    id v7 = [(NSURL *)*p_outputURL lastPathComponent];
    id v8 = [v7 stringByDeletingPathExtension];

    uint64_t v9 = [v14 temporaryFileForName:v8];
    uint64_t mainDatabase = (uint64_t)self->_mainDatabase;
    if (self->_auxDatabase)
    {
      uint64_t mainDatabase = CalDatabaseCreateWithAuxDatabaseRef();
      v11 = (const void *)mainDatabase;
    }
    else
    {
      v11 = 0;
    }

    if (mainDatabase)
    {
      if (CalDatabaseBackupDatabaseFile())
      {
        if (v11) {
          CFRelease(v11);
        }
        if ([(CADDiagnosticsDatabaseCollectorDBInfo *)self redactAndCompress:v9 context:v14])
        {
          uint64_t v13 = 2;
          goto LABEL_19;
        }
      }
      else
      {
        [v14 logError:@"Unable to backup database"];
        if (v11) {
          CFRelease(v11);
        }
      }
    }
    else
    {
      [v14 logError:@"Unable to create database"];
    }
  }
  else
  {
    objc_super v12 = [(NSURL *)self->_outputURL lastPathComponent];
    [v14 logError:@"No main database; can't collect %@", v12];

    uint64_t v9 = 0;
  }
  p_outputURL = &self->_outputURL;
  uint64_t v13 = 3;
LABEL_19:
  [v14 setStatus:v13 forFile:*p_outputURL];
}

- (void)collectMovedAsideDatabase:(id)a3
{
  id v5 = a3;
  if ([v5 redactLogs])
  {
    if ([(CADDiagnosticsDatabaseCollectorDBInfo *)self redactAndCollectMovedAsideDatabase:v5])
    {
LABEL_3:
      uint64_t v4 = 2;
      goto LABEL_6;
    }
  }
  else if ([(CADDiagnosticsDatabaseCollectorDBInfo *)self collectMovedAsideDatabaseWithoutRedacting:v5])
  {
    goto LABEL_3;
  }
  uint64_t v4 = 3;
LABEL_6:
  [v5 setStatus:v4 forFile:self->_outputURL];
}

- (BOOL)backupDatabaseFromPath:(id)a3 toPath:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v23 = 0;
  ppDb = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__CADDiagnosticsDatabaseCollectorDBInfo_backupDatabaseFromPath_toPath_context___block_invoke;
  v18[3] = &unk_1E624F400;
  uint64_t v20 = 0;
  id v9 = v8;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  id v19 = v9;
  id v10 = a3;
  v11 = (void (**)(void))MEMORY[0x1C1867AB0](v18);
  id v12 = v10;
  uint64_t v13 = (const char *)[v12 fileSystemRepresentation];

  BOOL v14 = 0;
  if (!sqlite3_open_v2(v13, &ppDb, 1, 0))
  {
    if (ppDb)
    {
      BOOL v14 = 0;
      if (!sqlite3_open_v2((const char *)[v7 fileSystemRepresentation], &v23, 6, 0))
      {
        if (v23)
        {
          uint64_t v15 = sqlite3_backup_init(v23, "main", ppDb, "main");
          if (v15)
          {
            uint64_t v16 = sqlite3_backup_step(v15, -1);
            if (v16 != 101) {
              objc_msgSend(v9, "logError:", @"Unexpected result to sqlite3_backup_step: %i", v16);
            }
            BOOL v14 = 1;
          }
          else
          {
            BOOL v14 = 0;
          }
        }
      }
    }
  }
  v11[2](v11);

  return v14;
}

sqlite3 *__79__CADDiagnosticsDatabaseCollectorDBInfo_backupDatabaseFromPath_toPath_context___block_invoke(uint64_t a1)
{
  v2 = *(sqlite3_backup **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = sqlite3_backup_finish(v2);
    if (v3) {
      objc_msgSend(*(id *)(a1 + 32), "logError:", @"Error finishing the backup: %i", v3);
    }
  }
  uint64_t v4 = *(sqlite3 **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = sqlite3_close(v4);
    if (v5) {
      objc_msgSend(*(id *)(a1 + 32), "logError:", @"Error closing source db in backup: %i", v5);
    }
  }
  result = *(sqlite3 **)(a1 + 56);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    if (result) {
      return (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "logError:", @"Error closing destination db in backup: %i", result);
    }
  }
  return result;
}

- (BOOL)redactAndCollectMovedAsideDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 temporaryFileForName:@"moved-aside-copy-for-redacting.sqlitedb"];
  movedAsideDatabasePath = self->_movedAsideDatabasePath;
  id v7 = [v5 absoluteURL];
  id v8 = [v7 path];
  LOBYTE(movedAsideDatabasePath) = [(CADDiagnosticsDatabaseCollectorDBInfo *)self backupDatabaseFromPath:movedAsideDatabasePath toPath:v8 context:v4];

  if (movedAsideDatabasePath)
  {
    BOOL v9 = [(CADDiagnosticsDatabaseCollectorDBInfo *)self redactAndCompress:v5 context:v4];
  }
  else
  {
    [v4 logError:@"Unable to backup database"];
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)collectMovedAsideDatabaseWithoutRedacting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_movedAsideDatabasePath];
  BOOL v6 = +[CADDiagnosticsUtils compressFileAt:v5 to:self->_outputURL context:v4];
  if (v6)
  {
    id v7 = [(NSString *)self->_movedAsideDatabasePath stringByAppendingString:@"-wal"];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    if (+[CADDiagnosticsUtils compressFileAt:v8 to:self->_walOutputURL context:v4])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 3;
    }
    [v4 setStatus:v9 forFile:self->_walOutputURL];
  }
  else
  {
    [v4 setStatus:3 forFile:self->_walOutputURL];
  }

  return v6;
}

- (BOOL)redactAndCompress:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 redactLogs] && (objc_msgSend(v7, "canceled") & 1) == 0)
  {
    uint64_t v9 = [[CADCalendarDatabaseRedactor alloc] initWithPath:v6 context:v7];
    int v8 = [(CADCalendarDatabaseRedactor *)v9 redact];
    if ((v8 & 1) == 0) {
      [v7 logError:@"Calendar database redaction failed; calendar database will not be attached."];
    }
  }
  else
  {
    int v8 = 1;
  }
  int v10 = [v7 canceled];
  BOOL v11 = 0;
  if (v8 && !v10)
  {
    if (!+[CADDiagnosticsUtils compressFileAt:v6 to:self->_outputURL context:v7])
    {
      [v7 logError:@"Error compressing database file"];
      [v7 deleteTemporaryFile:self->_outputURL];
      BOOL v11 = 0;
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    BOOL v11 = 1;
  }
  if (v6) {
LABEL_12:
  }
    [v7 deleteTemporaryFile:v6];
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedAsideDatabasePath, 0);
  objc_storeStrong((id *)&self->_walOutputURL, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
}

@end