@interface HDDiagnosticOperation
+ (id)operationWithAttachmentDirectoryURL:(id)a3;
- (BOOL)_copyDatabase:(sqlite3 *)a3 toDatabase:(sqlite3 *)a4;
- (BOOL)copyDatabaseFromURL:(id)a3 toURL:(id)a4;
- (HDDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3;
- (HDDiagnosticOperationDelegate)delegate;
- (NSArray)attachments;
- (NSMutableString)reportContents;
- (NSString)reportFilename;
- (NSURL)attachmentDirectoryURL;
- (NSURL)healthDirectoryURL;
- (OS_dispatch_queue)queue;
- (double)absoluteTimeForTimespec:(timespec)a3;
- (id)_fileAttributesAtURL:(id)a3;
- (id)_headerString;
- (id)fileCreationDateForURL:(id)a3;
- (id)fileModificationDateForURL:(id)a3;
- (id)openReadOnlyDatabaseAtURL:(id)a3;
- (id)prettyPrintFileSize:(int64_t)a3;
- (id)stringFromDate:(id)a3;
- (int64_t)_reportCountOfObjectsForEntityClass:(Class)a3 database:(id)a4;
- (int64_t)_reportCountOfObjectsInTable:(id)a3 database:(id)a4;
- (int64_t)fileSizeForURL:(id)a3;
- (unint64_t)getFileStatisticsForDirectoryWithURL:(id)a3 earliestModificationDate:(double *)a4 totalFileSize:(int64_t *)a5 maxFileSize:(int64_t *)a6;
- (void)_appendString:(id)a3 newLine:(BOOL)a4;
- (void)_queue_submitAttachment:(id)a3;
- (void)appendFormat:(id)a3;
- (void)appendNewline;
- (void)appendSeparator;
- (void)appendString:(id)a3;
- (void)appendStrongSeparator;
- (void)checkSchemaVersionForDatabase:(id)a3 currentSchema:(int)a4 futureSchema:(int)a5;
- (void)log:(id)a3;
- (void)main;
- (void)reportCountsForDatabase:(id)a3 entityClasses:(id)a4;
- (void)reportIntegrityForDatabase:(id)a3;
- (void)reportStatsForDatabaseAtURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReportContents:(id)a3;
- (void)submitAttachment:(id)a3;
- (void)submitAttachments:(id)a3;
- (void)verifyPermissionsForFileAtURL:(id)a3;
@end

@implementation HDDiagnosticOperation

- (HDDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDiagnosticOperation;
  v5 = [(HDDiagnosticOperation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attachmentDirectoryURL = v5->_attachmentDirectoryURL;
    v5->_attachmentDirectoryURL = (NSURL *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

+ (id)operationWithAttachmentDirectoryURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAttachmentDirectoryURL:v4];

  return v5;
}

- (NSArray)attachments
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__HDDiagnosticOperation_attachments__block_invoke;
  v5[3] = &unk_264867160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __36__HDDiagnosticOperation_attachments__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 248) copy];
  return MEMORY[0x270F9A758]();
}

- (NSURL)healthDirectoryURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/var/mobile/Library/Health" isDirectory:1];
}

- (NSString)reportFilename
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@.txt", v4];

  return (NSString *)v5;
}

- (void)main
{
  [(HDDiagnosticOperation *)self log:@"Running..."];
  [(HDDiagnosticOperation *)self run];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HDDiagnosticOperation_main__block_invoke;
  block[3] = &unk_264867188;
  block[4] = self;
  dispatch_sync(queue, block);
  [(HDDiagnosticOperation *)self log:@"Finished running %@", objc_opt_class()];
}

void __29__HDDiagnosticOperation_main__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reportContents];
  uint64_t v3 = [v2 length];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = [v4 reportFilename];
    uint64_t v6 = [*(id *)(a1 + 32) attachmentDirectoryURL];
    v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:0];

    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 path];
    [v8 log:@"Writing %@...", v9];

    id v14 = 0;
    LOBYTE(v9) = [v2 writeToURL:v7 atomically:1 encoding:4 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0)
    {
      id v11 = *(void **)(a1 + 32);
      v12 = [v7 path];
      [v11 log:@"ERROR: Failed to write %@: %@", v12, v10];
    }
    v13 = [MEMORY[0x263F089D8] string];
    [*(id *)(a1 + 32) setReportContents:v13];
  }
  else
  {
    [v4 log:@"No report"];
  }
}

- (void)appendString:(id)a3
{
}

- (void)appendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(HDDiagnosticOperation *)self _appendString:v6 newLine:1];
}

- (void)appendNewline
{
}

- (void)_appendString:(id)a3 newLine:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HDDiagnosticOperation__appendString_newLine___block_invoke;
  block[3] = &unk_2648671B0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __47__HDDiagnosticOperation__appendString_newLine___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 280);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 280);
    *(void *)(v4 + 280) = v3;

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[35];
    id v8 = [v6 _headerString];
    [v7 appendString:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 280);
  }
  uint64_t result = [v2 appendString:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    id v10 = *(void **)(*(void *)(a1 + 32) + 280);
    return [v10 appendString:@"\n"];
  }
  return result;
}

- (id)_headerString
{
  id v3 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v4 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [(HDDiagnosticOperation *)self stringFromDate:v5];
  uint64_t v7 = [v3 currentDeviceClass];
  id v8 = [v3 currentInternalDeviceModel];
  uint64_t v9 = [v3 currentDeviceDisplayName];
  id v10 = [v3 currentDeviceName];
  BOOL v11 = [v3 currentOSName];
  v12 = [v3 currentOSBuild];
  v13 = [v4 stringWithFormat:@"Date:    %@\nDevice:  %@ %@\nName:    %@ (%@)\nBuild:   %@ %@\n\n\n", v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (void)appendSeparator
{
}

- (void)appendStrongSeparator
{
  [(HDDiagnosticOperation *)self appendFormat:@"=========================================================================================="];
}

- (void)submitAttachment:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HDDiagnosticOperation_submitAttachment___block_invoke;
  v7[3] = &unk_2648671D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __42__HDDiagnosticOperation_submitAttachment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAttachment:", *(void *)(a1 + 40));
}

- (void)submitAttachments:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HDDiagnosticOperation_submitAttachments___block_invoke;
  v7[3] = &unk_2648671D8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__HDDiagnosticOperation_submitAttachments___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_queue_submitAttachment:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_queue_submitAttachment:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  id v8 = v4;
  if (!attachments)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v7 = self->_attachments;
    self->_attachments = v6;

    id v4 = v8;
    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v4];
}

- (void)log:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  long long v7 = [(HDDiagnosticOperation *)self delegate];
  [v7 diagnosticOperation:self logMessage:v6];
}

- (BOOL)copyDatabaseFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ppDb = 0;
  id v8 = v6;
  uint64_t v9 = sqlite3_open_v2((const char *)[v8 fileSystemRepresentation], &ppDb, 1, 0);
  if (v9)
  {
    [(HDDiagnosticOperation *)self log:@"Could not open original database at '%@'. %s (%d)\n", v8, sqlite3_errmsg(ppDb), v9];
  }
  else
  {
    v15 = 0;
    id v10 = v7;
    uint64_t v11 = sqlite3_open_v2((const char *)[v10 fileSystemRepresentation], &v15, 6, 0);
    if (!v11)
    {
      BOOL v13 = [(HDDiagnosticOperation *)self _copyDatabase:ppDb toDatabase:v15];
      sqlite3_close(ppDb);
      sqlite3_close(v15);
      goto LABEL_6;
    }
    uint64_t v12 = v11;
    sqlite3_close(ppDb);
    [(HDDiagnosticOperation *)self log:@"Could not open destination database at '%@'. %s (%d)\n", v10, sqlite3_errmsg(ppDb), v12];
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

- (id)openReadOnlyDatabaseAtURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F434B8]) initWithDatabaseURL:v4];
  id v11 = 0;
  int v6 = [v5 openForReadingWithError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    [(HDDiagnosticOperation *)self log:@"Failed to open database at '%@': %@", v4, v7];
    [v5 close];
    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (int64_t)fileSizeForURL:(id)a3
{
  memset(&v4, 0, sizeof(v4));
  if (stat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v4))
  {
    return -1;
  }
  else
  {
    return v4.st_size;
  }
}

- (id)fileCreationDateForURL:(id)a3
{
  uint64_t v3 = [(HDDiagnosticOperation *)self _fileAttributesAtURL:a3];
  stat v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08008]];

  return v4;
}

- (id)fileModificationDateForURL:(id)a3
{
  uint64_t v3 = [(HDDiagnosticOperation *)self _fileAttributesAtURL:a3];
  stat v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08048]];

  return v4;
}

- (id)_fileAttributesAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v4 path];
  id v11 = 0;
  id v7 = [v5 attributesOfItemAtPath:v6 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    id v9 = [v4 path];
    [(HDDiagnosticOperation *)self log:@"Failed to get file attributes at path \"%@\": %@", v9, v8];
  }
  return v7;
}

- (id)stringFromDate:(id)a3
{
  return (id)HKDiagnosticStringFromDate();
}

- (double)absoluteTimeForTimespec:(timespec)a3
{
  return (double)a3.tv_nsec / 1000000000.0 + (double)a3.tv_sec - *MEMORY[0x263EFFAF8];
}

- (id)prettyPrintFileSize:(int64_t)a3
{
  if (a3 > 1023)
  {
    if ((unint64_t)a3 >> 20)
    {
      double v3 = (double)a3;
      if ((unint64_t)a3 >> 30) {
        objc_msgSend(NSString, "stringWithFormat:", @"%0.3lfG (%lld bytes)", v3 * 9.31322575e-10, a3);
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%0.3lfM (%lld bytes)", v3 * 0.000000953674316, a3);
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%0.3lfK (%lld bytes)", (double)a3 * 0.0009765625, a3);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld bytes", a3, v6);
  id v4 = };
  return v4;
}

- (unint64_t)getFileStatisticsForDirectoryWithURL:(id)a3 earliestModificationDate:(double *)a4 totalFileSize:(int64_t *)a5 maxFileSize:(int64_t *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v41 = 0;
  id v11 = [MEMORY[0x263F43210] journalChaptersForURL:v10 error:&v41];
  id v12 = v41;
  if (!v11)
  {
    v29 = [v10 path];
    [(HDDiagnosticOperation *)self log:@"Failed to retrieve contents of %@ directory: %@", v29, v12];
LABEL_18:

    unint64_t v30 = 0;
    goto LABEL_27;
  }
  if (![v11 count])
  {
    v29 = [v10 path];
    [(HDDiagnosticOperation *)self log:@"No files in %@", v29, v32];
    goto LABEL_18;
  }
  v33 = a5;
  v34 = a6;
  v35 = a4;
  id v36 = v12;
  BOOL v13 = [MEMORY[0x263EFF910] distantPast];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v38;
    double v22 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v16);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v25 = [v24 size];
        if ([v24 size] > v20) {
          uint64_t v20 = [v24 size];
        }
        [v24 modificationTime];
        if (v26 != v15)
        {
          [v24 modificationTime];
          if (v27 < v22)
          {
            [v24 modificationTime];
            double v22 = v28;
          }
        }
        v19 += v25;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v18);
  }
  else
  {
    int64_t v19 = 0;
    uint64_t v20 = 0;
    double v22 = 1.79769313e308;
  }

  if (v33) {
    int64_t *v33 = v19;
  }
  id v12 = v36;
  if (v34) {
    int64_t *v34 = v20;
  }
  if (v35) {
    double *v35 = v22;
  }
  unint64_t v30 = [v16 count];
LABEL_27:

  return v30;
}

- (void)reportStatsForDatabaseAtURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F08850]);
  uint64_t v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [v4 path];
    [(HDDiagnosticOperation *)self appendFormat:@"SQLite database %@:", v8];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__HDDiagnosticOperation_reportStatsForDatabaseAtURL___block_invoke;
    v14[3] = &unk_264867200;
    v14[4] = self;
    id v9 = (void (**)(void, void))MEMORY[0x22A6B8EE0](v14);
    ((void (**)(void, id))v9)[2](v9, v4);
    id v10 = [v4 pathExtension];
    id v11 = [NSString stringWithFormat:@"%@-wal", v10];
    id v12 = [v4 URLByDeletingPathExtension];
    BOOL v13 = [v12 URLByAppendingPathExtension:v11];

    ((void (**)(void, void *))v9)[2](v9, v13);
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"No file present at %@.", v4];
  }
}

void __53__HDDiagnosticOperation_reportStatsForDatabaseAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fileSizeForURL:");
  id v4 = *(void **)(a1 + 32);
  if (v3 < 0)
  {
    BOOL v13 = [v16 path];
    double v15 = __error();
    [v4 log:@"Failed to get file size for \"%@\": %s", v13, strerror(*v15)];
  }
  else
  {
    uint64_t v5 = v3;
    uint64_t v6 = [v16 lastPathComponent];
    [v4 appendFormat:@"\t%@:", v6];

    char v7 = *(void **)(a1 + 32);
    id v8 = [v7 prettyPrintFileSize:v5];
    [v7 appendFormat:@"\t\tSize:\t\t%@", v8];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v9 fileCreationDateForURL:v16];
    id v11 = [v9 stringFromDate:v10];
    [v9 appendFormat:@"\t\tCreated:\t%@", v11];

    id v12 = *(void **)(a1 + 32);
    BOOL v13 = [v12 fileModificationDateForURL:v16];
    double v14 = [v12 stringFromDate:v13];
    [v12 appendFormat:@"\t\tModified:\t%@", v14];
  }
}

- (void)verifyPermissionsForFileAtURL:(id)a3
{
  memset(&v12, 0, sizeof(v12));
  id v4 = a3;
  if (stat((const char *)[v4 fileSystemRepresentation], &v12))
  {
    uint64_t v5 = [v4 path];
    uint64_t v6 = __error();
    char v7 = strerror(*v6);
    [(HDDiagnosticOperation *)self log:@"Failed to stat '%@' when verifying permissions: %s", v5, v7, *(void *)&v12.st_dev, v12.st_ino];
LABEL_9:

    goto LABEL_10;
  }
  if (v12.st_uid != 501)
  {
    pw_name = getpwuid(v12.st_uid)->pw_name;
    id v9 = [v4 path];
    [(HDDiagnosticOperation *)self appendFormat:@"ERROR: Unexpected owner (%s) of file at %@", pw_name, v9, *(void *)&v12.st_dev, v12.st_ino];
  }
  char st_mode = v12.st_mode;
  if ((v12.st_mode & 0x100) == 0)
  {
    id v11 = [v4 path];
    [(HDDiagnosticOperation *)self appendFormat:@"ERROR: Owner lacks read permission for file at %@", v11];

    char st_mode = v12.st_mode;
  }
  if ((st_mode & 0x80) == 0)
  {
    uint64_t v5 = [v4 path];
    [(HDDiagnosticOperation *)self appendFormat:@"ERROR: Owner lacks write permission for file at %@", v5];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)reportIntegrityForDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fileURL];
  uint64_t v6 = [v5 path];
  [(HDDiagnosticOperation *)self log:@"Checking integrity for %@...", v6];

  id v16 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke;
  v15[3] = &unk_264866D68;
  v15[4] = self;
  LOBYTE(v6) = [v4 executeSQL:@"PRAGMA INTEGRITY_CHECK" error:&v16 bindingHandler:0 enumerationHandler:v15];
  id v7 = v16;
  if ((v6 & 1) == 0)
  {
    id v8 = [v4 fileURL];
    id v9 = [v8 path];
    [(HDDiagnosticOperation *)self log:@"\tERROR: Failed to perform integrity check on %@: %@", v9, v7];
  }
  id v10 = [v4 fileURL];
  uint64_t v11 = [v10 path];
  [(HDDiagnosticOperation *)self log:@"Checking foreign keys for %@...", v11];

  v13[4] = self;
  id v14 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke_2;
  v13[3] = &unk_264866D68;
  LOBYTE(v11) = [v4 executeSQL:@"PRAGMA FOREIGN_KEY_CHECK" error:&v14 bindingHandler:0 enumerationHandler:v13];
  id v12 = v14;

  if ((v11 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"\tERROR: Failed to perform foreign key check: %@", v12];
  }
}

uint64_t __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = MEMORY[0x22A6B89F0](a2, 0);
  if (([v4 isEqualToString:@"ok"] & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = MEMORY[0x22A6B89F0](a2, 0);
    [v5 appendFormat:@"\tINTEGRITY_CHECK: %@", v6];
  }
  return 1;
}

uint64_t __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = MEMORY[0x22A6B89F0](a2, 0);
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = MEMORY[0x22A6B89F0](a2, 2);
  id v7 = MEMORY[0x22A6B89F0](a2, 3);
  [v3 appendFormat:@"\tFOREIGN_KEY_CHECK: %@ row %lld has invalid reference to %@ (%@)", v4, v5, v6, v7];

  return 1;
}

- (void)checkSchemaVersionForDatabase:(id)a3 currentSchema:(int)a4 futureSchema:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  v29[4] = &v31;
  id v30 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __82__HDDiagnosticOperation_checkSchemaVersionForDatabase_currentSchema_futureSchema___block_invoke;
  v29[3] = &unk_264867228;
  char v9 = objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", @"PRAGMA USER_VERSION;",
         &v30,
         0,
         v29);
  id v10 = v30;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = [v8 fileURL];
    id v12 = [v11 path];
    [(HDDiagnosticOperation *)self log:@"Failed to check schema version for %@ database: %@", v12, v10];
  }
  uint64_t v13 = v32[3];
  if (v13 == (int)v6)
  {
    id v14 = @"Database has current schema version %lld";
LABEL_7:
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", v14, v32[3]);
    goto LABEL_19;
  }
  if (v13 == (int)v5)
  {
    id v14 = @"Database has future migrations enabled with schema version %lld";
    goto LABEL_7;
  }
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", @"ERROR: database has unexpected schema version %lld; current is %d, future is %d",
    v13,
    v6,
    v5);
  id v28 = v10;
  double v15 = [v8 dumpSchemaWithError:&v28];
  id v23 = v28;

  if (v15)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          [(HDDiagnosticOperation *)self appendFormat:@"Schema for %@:", v20];
          uint64_t v21 = [v16 objectForKeyedSubscript:v20];
          [(HDDiagnosticOperation *)self appendFormat:@"%@", v21];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v17);
    }
  }
  else
  {
    id v16 = [v8 fileURL];
    double v22 = [v16 path];
    [(HDDiagnosticOperation *)self log:@"Failed to extract schema for %@ database: %@", v22, v23];
  }
  id v10 = v23;
LABEL_19:
  _Block_object_dispose(&v31, 8);
}

uint64_t __82__HDDiagnosticOperation_checkSchemaVersionForDatabase_currentSchema_futureSchema___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (void)reportCountsForDatabase:(id)a3 entityClasses:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDDiagnosticOperation *)self _reportCountOfObjectsForEntityClass:*(void *)(*((void *)&v12 + 1) + 8 * v11++) database:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_copyDatabase:(sqlite3 *)a3 toDatabase:(sqlite3 *)a4
{
  uint64_t v6 = sqlite3_file_control(a4, 0, 102, a3);
  if (v6)
  {
    [(HDDiagnosticOperation *)self log:@"Could not perform database copy: %s (%d)", sqlite3_errmsg(a4), v6];
    return 0;
  }
  uint64_t v7 = sqlite3_exec(a4, "PRAGMA wal_checkpoint(RESTART);", 0, 0, 0);
  if (v7)
  {
    [(HDDiagnosticOperation *)self log:@"Could not checkpoint copied SQLite file: %s (%d)", sqlite3_errmsg(a4), v7];
    return 0;
  }
  return 1;
}

- (int64_t)_reportCountOfObjectsForEntityClass:(Class)a3 database:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(objc_class *)a3 databaseTable];
  int64_t v8 = [(HDDiagnosticOperation *)self _reportCountOfObjectsInTable:v7 database:v6];

  return v8;
}

- (int64_t)_reportCountOfObjectsInTable:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  int64_t v8 = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", v6];
  uint64_t v20 = &v22;
  id v21 = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __63__HDDiagnosticOperation__reportCountOfObjectsInTable_database___block_invoke;
  uint64_t v17 = &unk_264867110;
  uint64_t v18 = self;
  id v9 = v6;
  id v19 = v9;
  char v10 = [v7 executeSQL:v8 error:&v21 bindingHandler:0 enumerationHandler:&v14];
  id v11 = v21;

  if ((v10 & 1) == 0) {
    [(HDDiagnosticOperation *)self log:@"Failed to count rows in table '%@': %@", v9, v11, v14, v15, v16, v17, v18];
  }
  int64_t v12 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v12;
}

uint64_t __63__HDDiagnosticOperation__reportCountOfObjectsInTable_database___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  [*(id *)(a1 + 32) appendFormat:@"\t%lld %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 40)];
  return 0;
}

- (HDDiagnosticOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HDDiagnosticOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)attachmentDirectoryURL
{
  return self->_attachmentDirectoryURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableString)reportContents
{
  return self->_reportContents;
}

- (void)setReportContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportContents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attachmentDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end