@interface CADDiagnosticsCollectionOperation
- (BOOL)redactLogs;
- (CADDiagnosticsCollectionOperation)initWithConnection:(id)a3 token:(unsigned int)a4 options:(int64_t)a5 trafficLogsCollectionMode:(unint64_t)a6;
- (id)_createLogDirectory;
- (id)_createLogFile;
- (id)_randomString;
- (id)finalFileForFile:(id)a3;
- (id)loadLogCollectors;
- (id)temporaryFileForName:(id)a3;
- (unsigned)token;
- (void)batch:(id)a3;
- (void)deleteTemporaryFile:(id)a3;
- (void)determineExpectedOutputFiles:(id)a3;
- (void)finish;
- (void)log:(id)a3;
- (void)logError:(id)a3;
- (void)logWithLevel:(unsigned __int8)a3 formatString:(id)a4 arguments:(char *)a5;
- (void)main;
- (void)reportFileStatusChangesToClient;
- (void)setStatus:(unint64_t)a3 forFile:(id)a4;
@end

@implementation CADDiagnosticsCollectionOperation

- (CADDiagnosticsCollectionOperation)initWithConnection:(id)a3 token:(unsigned int)a4 options:(int64_t)a5 trafficLogsCollectionMode:(unint64_t)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CADDiagnosticsCollectionOperation;
  v12 = [(CADDiagnosticsCollectionOperation *)&v47 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conn, a3);
    v13->_token = a4;
    v13->_options = a5;
    v13->_trafficLogsCollectionMode = a6;
    uint64_t v14 = objc_opt_new();
    files = v13->_files;
    v13->_files = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    changedFiles = v13->_changedFiles;
    v13->_changedFiles = (NSMutableSet *)v16;

    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [(CADDiagnosticsCollectionOperation *)v13 _createLogDirectory];
    logDirectoryURL = v13->_logDirectoryURL;
    v13->_logDirectoryURL = (NSURL *)v18;

    uint64_t v20 = [(NSURL *)v13->_logDirectoryURL URLByAppendingPathComponent:@"Incoming/"];
    incomingLogDirectoryURL = v13->_incomingLogDirectoryURL;
    v13->_incomingLogDirectoryURL = (NSURL *)v20;

    uint64_t v22 = [(NSURL *)v13->_logDirectoryURL URLByAppendingPathComponent:@"Completed/"];
    completedLogDirectoryURL = v13->_completedLogDirectoryURL;
    v13->_completedLogDirectoryURL = (NSURL *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    temporaryFileNames = v13->_temporaryFileNames;
    v13->_temporaryFileNames = v24;

    uint64_t v26 = [(CADDiagnosticsCollectionOperation *)v13 _createLogFile];
    logFileURL = v13->_logFileURL;
    v13->_logFileURL = (NSURL *)v26;

    v28 = v13->_logFileURL;
    if (v28)
    {
      v29 = fopen([(NSURL *)v28 fileSystemRepresentation], "w");
      v13->_logFile = v29;
      if (v29)
      {
        v30 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        dateFormatter = v13->_dateFormatter;
        v13->_dateFormatter = v30;

        [(NSDateFormatter *)v13->_dateFormatter setDateFormat:@"yyyy-MM-dd' 'HH:mm:ss.SSSSSZZZ"];
        v32 = [MEMORY[0x1E4F28CB8] defaultManager];
        v33 = v13->_incomingLogDirectoryURL;
        id v46 = 0;
        char v34 = [v32 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:0 error:&v46];
        id v35 = v46;
        v36 = v35;
        if ((v34 & 1) == 0) {
          [(CADDiagnosticsCollectionOperation *)v13 logError:@"Unable to create incoming directory:%@", v35];
        }
        v37 = v13->_completedLogDirectoryURL;
        id v45 = v36;
        char v38 = [v32 createDirectoryAtURL:v37 withIntermediateDirectories:1 attributes:0 error:&v45];
        id v39 = v45;

        if ((v38 & 1) == 0) {
          [(CADDiagnosticsCollectionOperation *)v13 logError:@"Unable to create completed directory:%@", v39];
        }

        goto LABEL_9;
      }
      v41 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v42 = v41;
        int v43 = *__error();
        *(_DWORD *)buf = 67109120;
        int v49 = v43;
        _os_log_impl(&dword_1BBC88000, v42, OS_LOG_TYPE_ERROR, "Unable to open log file: %{errno}i", buf, 8u);
      }
    }
    v40 = 0;
    goto LABEL_13;
  }
LABEL_9:
  v40 = v13;
LABEL_13:

  return v40;
}

- (id)loadLogCollectors
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  if (self->_trafficLogsCollectionMode)
  {
    v4 = objc_alloc_init(CADDiagnosticsCalDAVTrafficLogCollector);
    v5 = v4;
    if (self->_trafficLogsCollectionMode == 1) {
      [(CADDiagnosticsCalDAVTrafficLogCollector *)v4 setLimitedLogs:1];
    }
    [v3 addObject:v5];
  }
  v11[0] = self;
  v6 = objc_alloc_init(CADDiagnosticsCalDAVSpotlightLogCollector);
  v11[1] = v6;
  v7 = objc_alloc_init(CADDiagnosticsDatabaseCollector);
  v11[2] = v7;
  v8 = objc_alloc_init(CADDiagnosticsDiagnosticDatabaseCollector);
  v11[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  [v3 addObjectsFromArray:v9];

  return v3;
}

- (void)main
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(CADDiagnosticsCollectionOperation *)self log:@"Started collecting diagnostics"];
  v3 = [(CADDiagnosticsCollectionOperation *)self loadLogCollectors];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__CADDiagnosticsCollectionOperation_main__block_invoke;
  v16[3] = &unk_1E624E580;
  id v4 = v3;
  id v17 = v4;
  uint64_t v18 = self;
  [(CADDiagnosticsCollectionOperation *)self batch:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if ([(CADDiagnosticsCollectionOperation *)self isCancelled]) {
        break;
      }
      [(CADDiagnosticsCollectionOperation *)self log:@"Asking %@ to collect logs", objc_opt_class()];
      [v10 collect:self];
      [(CADDiagnosticsCollectionOperation *)self log:@"%@ has fininshed collecting logs", objc_opt_class()];
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([(CADDiagnosticsCollectionOperation *)self isCancelled]) {
    id v11 = @"Diagnostics collection canceled";
  }
  else {
    id v11 = @"Finished collecting diagnostics";
  }
  [(CADDiagnosticsCollectionOperation *)self log:v11];
  [(CADDiagnosticsCollectionOperation *)self finish];
}

void __41__CADDiagnosticsCollectionOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
      if ([*(id *)(a1 + 40) isCancelled]) {
        break;
      }
      [*(id *)(a1 + 40) log:@"Asking %@ to determine what logs it will produce", objc_opt_class()];
      uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 280) count];
      [v7 determineExpectedOutputFiles:*(void *)(a1 + 40)];
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 280) count] - v8;
      [*(id *)(a1 + 40) log:@"%@ expects to produce %lu logs", objc_opt_class(), v9, (void)v10];
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)determineExpectedOutputFiles:(id)a3
{
}

- (id)_createLogDirectory
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"CalendarDiagnosticAttachmentsXXXXXX"];
  uint64_t v4 = strdup((const char *)[v3 fileSystemRepresentation]);
  if (mkdtemp(v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
    free(v4);
  }
  else
  {
    uint64_t v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v6;
      int v8 = *__error();
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "Unable to create log directory: %{errno}i", (uint8_t *)v10, 8u);
    }
    free(v4);
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_randomString
{
  for (uint64_t i = 0; i != 6; ++i)
  {
    int v3 = (int)random() % 36;
    if (v3 >= 10) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    v7[i] = v4 + v3;
  }
  v7[6] = 0;
  uint64_t v5 = [NSString stringWithUTF8String:v7];
  return v5;
}

- (id)temporaryFileForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ([(NSMutableSet *)self->_temporaryFileNames containsObject:v4])
  {
    uint64_t v6 = v4;
    do
    {
      uint64_t v7 = [v4 pathExtension];
      int v8 = [v4 stringByDeletingPathExtension];
      uint64_t v9 = [(CADDiagnosticsCollectionOperation *)self _randomString];
      long long v10 = [NSString stringWithFormat:@"%@-%@", v8, v9];
      uint64_t v5 = [v10 stringByAppendingPathExtension:v7];

      uint64_t v6 = v5;
    }
    while (([(NSMutableSet *)self->_temporaryFileNames containsObject:v5] & 1) != 0);
  }
  [(NSMutableSet *)self->_temporaryFileNames addObject:v5];
  uint64_t v11 = [(NSURL *)self->_incomingLogDirectoryURL URLByAppendingPathComponent:v5];

  return v11;
}

- (void)deleteTemporaryFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 path];
  uint64_t v6 = [(NSURL *)self->_incomingLogDirectoryURL path];
  char v7 = [v5 hasPrefix:v6];

  if (v7)
  {
    int v8 = [v4 lastPathComponent];
    if ([(NSMutableSet *)self->_temporaryFileNames containsObject:v8])
    {
      [(NSMutableSet *)self->_temporaryFileNames removeObject:v8];
      uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v12 = 0;
      char v10 = [v9 removeItemAtURL:v4 error:&v12];
      id v11 = v12;

      if ((v10 & 1) == 0) {
        [(CADDiagnosticsCollectionOperation *)self logError:@"Error removing %@: %@", v4, v11];
      }
    }
    else
    {
      [(CADDiagnosticsCollectionOperation *)self logError:@"Ignoring attempt to delete file %@, which wasn't returned by -temporaryFileForName:!", v8];
    }
  }
  else
  {
    [(CADDiagnosticsCollectionOperation *)self logError:@"Ignoring attempt to delete URL %@, which is not in the log directory %@!", v4, self->_incomingLogDirectoryURL];
  }
}

- (id)_createLogFile
{
  return [(NSURL *)self->_logDirectoryURL URLByAppendingPathComponent:@"CalendarDiagnosticExtensionLogs.txt"];
}

- (void)log:(id)a3
{
  [(CADDiagnosticsCollectionOperation *)self logWithLevel:0 formatString:a3 arguments:&v3];
}

- (void)logError:(id)a3
{
  [(CADDiagnosticsCollectionOperation *)self logWithLevel:16 formatString:a3 arguments:&v3];
}

- (void)logWithLevel:(unsigned __int8)a3 formatString:(id)a4 arguments:(char *)a5
{
  int v6 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v8 = (objc_class *)NSString;
  id v9 = a4;
  char v10 = (void *)[[v8 alloc] initWithFormat:v9 arguments:a5];

  id v11 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, (os_log_type_t)v6))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1BBC88000, v11, (os_log_type_t)v6, "%{public}@", buf, 0xCu);
  }
  dateFormatter = self->_dateFormatter;
  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  long long v14 = [(NSDateFormatter *)dateFormatter stringFromDate:v13];

  uint64_t v15 = 0;
  if (v6 <= 1)
  {
    if (v6)
    {
      if (v6 == 1) {
        uint64_t v15 = @"Info";
      }
    }
    else
    {
      uint64_t v15 = @"Default";
    }
  }
  else
  {
    switch(v6)
    {
      case 17:
        uint64_t v15 = @"Fault";
        break;
      case 16:
        uint64_t v15 = @"Error";
        break;
      case 2:
        uint64_t v15 = @"Debug";
        break;
    }
  }
  uint64_t v16 = [NSString stringWithFormat:@"%@ %@: %@\n", v14, v15, v10];
  id v17 = [v16 dataUsingEncoding:4];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_logFile)
  {
    id v19 = v17;
    if (fwrite((const void *)[v19 bytes], objc_msgSend(v19, "length"), 1uLL, self->_logFile) != 1)
    {
      uint64_t v20 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        int v22 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v22;
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Error writing to log file %{errno}i", buf, 8u);
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v23 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1BBC88000, v23, OS_LOG_TYPE_ERROR, "Dropping message because log file is closed: \"%@\"", buf, 0xCu);
    }
  }
}

- (void)finish
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  logFile = self->_logFile;
  if (logFile)
  {
    fclose(logFile);
    self->_logFile = 0;
    os_unfair_lock_unlock(p_lock);
    self->_finished = 1;
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    incomingLogDirectoryURL = self->_incomingLogDirectoryURL;
    id v10 = 0;
    char v7 = [v5 removeItemAtURL:incomingLogDirectoryURL error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0) {
      [(CADDiagnosticsCollectionOperation *)self logError:@"Couldn't remove incoming direrctory: %@", v8];
    }
    [(CADDiagnosticsCollectionOperation *)self setStatus:2 forFile:self->_logFileURL];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "Finish called without an open log file. Called more than once?", buf, 2u);
    }
  }
}

- (void)batch:(id)a3
{
  ++self->_batchDepth;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  int v4 = self->_batchDepth - 1;
  self->_batchDepth = v4;
  if (!v4)
  {
    [(CADDiagnosticsCollectionOperation *)self reportFileStatusChangesToClient];
  }
}

- (id)finalFileForFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 path];
  int v6 = [(NSURL *)self->_incomingLogDirectoryURL path];
  if ([v5 hasPrefix:v6])
  {
    completedLogDirectoryURL = self->_completedLogDirectoryURL;
    id v8 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    id v9 = [(NSURL *)completedLogDirectoryURL URLByAppendingPathComponent:v8];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)setStatus:(unint64_t)a3 forFile:(id)a4
{
  id v6 = a4;
  id v7 = [(CADDiagnosticsCollectionOperation *)self finalFileForFile:v6];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v7];
    id v9 = v8;
    if (!v8 || [v8 unsignedIntegerValue] != a3)
    {
      id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)self->_files setObject:v10 forKeyedSubscript:v7];

      [(NSMutableSet *)self->_changedFiles addObject:v7];
      if (a3 == 2 && v7 != v6)
      {
        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v14 = 0;
        char v12 = [v11 moveItemAtURL:v6 toURL:v7 error:&v14];
        id v13 = v14;

        if ((v12 & 1) == 0) {
          [(CADDiagnosticsCollectionOperation *)self logError:@"Error moving incoming file %@ to %@: %@", v6, v7, v13];
        }
      }
      if (!self->_batchDepth) {
        [(CADDiagnosticsCollectionOperation *)self reportFileStatusChangesToClient];
      }
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F29060] callStackSymbols];
    [(CADDiagnosticsCollectionOperation *)self logError:@"No key found for file %@ %@", v6, v9];
  }
}

- (void)reportFileStatusChangesToClient
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_changedFiles count] || self->_finished)
  {
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_changedFiles, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = self->_changedFiles;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v8];
          if (v9)
          {
            uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v8 readonly:0];
            id v11 = (void *)v10;
            if (v10)
            {
              v23[0] = @"file";
              v23[1] = @"status";
              v24[0] = v10;
              v24[1] = v9;
              char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
              [v16 addObject:v12];
            }
            else
            {
              [(CADDiagnosticsCollectionOperation *)self logError:@"Couldn't create sandbox extension for %@, so this won't be attached.", v8];
            }
          }
          else
          {
            id v13 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = v8;
              _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "No status for file: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_changedFiles removeAllObjects];
    id v14 = [(ClientConnection *)self->_conn remoteObjectProxyWithErrorHandler:&__block_literal_global_25];
    uint64_t v15 = (void *)[v16 copy];
    [v14 CADClientReceiveDiagnosticsCollectionResults:v15 forToken:self->_token finished:self->_finished];
  }
}

void __68__CADDiagnosticsCollectionOperation_reportFileStatusChangesToClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_ERROR, "Error sending diagnostic file results: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)redactLogs
{
  return (self->_options & 1) == 0;
}

- (unsigned)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
  objc_storeStrong((id *)&self->_completedLogDirectoryURL, 0);
  objc_storeStrong((id *)&self->_incomingLogDirectoryURL, 0);
  objc_storeStrong((id *)&self->_logDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryFileNames, 0);
  objc_storeStrong((id *)&self->_changedFiles, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end