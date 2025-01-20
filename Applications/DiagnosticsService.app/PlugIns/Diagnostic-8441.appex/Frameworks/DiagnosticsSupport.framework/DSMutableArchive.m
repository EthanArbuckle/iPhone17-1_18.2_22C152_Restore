@interface DSMutableArchive
+ (BOOL)extractArchive:(id)a3 toDirectory:(id)a4;
+ (BOOL)extractEntry:(archive *)a3 toArchive:(archive *)a4;
+ (id)archive;
- (BOOL)_addDirectoryToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6;
- (BOOL)_addFile:(id)a3 archive:(archive *)a4 error:(id *)a5;
- (BOOL)_addPathToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6;
- (BOOL)_writeArchive:(archive *)a3 error:(id *)a4;
- (BOOL)addURL:(id)a3 error:(id *)a4;
- (BOOL)addURL:(id)a3 prefix:(id)a4 error:(id *)a5;
- (BOOL)addURL:(id)a3 prefix:(id)a4 flatten:(BOOL)a5 error:(id *)a6;
- (BOOL)archiveAsFile:(id)a3 error:(id *)a4;
- (BOOL)archiveAsFileUsingDescriptor:(int)a3 error:(id *)a4;
- (DSMutableArchive)init;
- (NSMutableArray)tableOfContents;
- (NSMutableData)dataBuffer;
- (id)archiveAsDataWithError:(id *)a3;
- (id)archiveAsTempDirectoryWithName:(id)a3 error:(id *)a4;
- (id)archiveAsTempFileWithTemplate:(id)a3 directory:(id)a4 suffix:(id)a5 error:(id *)a6;
- (id)archiveAsTempFileWithTemplate:(id)a3 error:(id *)a4;
- (id)archiveAsTempFileWithTemplate:(id)a3 suffix:(id)a4 error:(id *)a5;
- (int64_t)format;
- (void)_setFormatOnArchive:(archive *)a3;
- (void)setDataBuffer:(id)a3;
- (void)setFormat:(int64_t)a3;
- (void)setTableOfContents:(id)a3;
@end

@implementation DSMutableArchive

+ (id)archive
{
  v2 = objc_alloc_init(DSMutableArchive);

  return v2;
}

- (DSMutableArchive)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSMutableArchive;
  v2 = [(DSMutableArchive *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    tableOfContents = v2->_tableOfContents;
    v2->_tableOfContents = (NSMutableArray *)v3;

    v2->_format = 0;
  }
  return v2;
}

- (BOOL)addURL:(id)a3 error:(id *)a4
{
  return [(DSMutableArchive *)self addURL:a3 prefix:0 error:a4];
}

- (BOOL)addURL:(id)a3 prefix:(id)a4 error:(id *)a5
{
  return [(DSMutableArchive *)self addURL:a3 prefix:a4 flatten:0 error:a5];
}

- (BOOL)addURL:(id)a3 prefix:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (__CFString *)a4;
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &stru_1C970;
  }
  v13 = +[NSMutableArray array];
  v14 = +[DSArchivePath archivePathWithSource:v10 prefix:v12 root:1];
  [v13 addObject:v14];

  do
  {
    v15 = [v13 objectAtIndex:0];
    [v13 removeObjectAtIndex:0];
    BOOL v16 = [(DSMutableArchive *)self _addPathToContents:v15 searchQueue:v13 flatten:v7 error:a6];
  }
  while (v16 && [v13 count]);

  return v16;
}

- (BOOL)_addPathToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  char v20 = 0;
  v12 = +[NSFileManager defaultManager];
  v13 = [v10 sourceUrl];
  v14 = [v13 path];
  unsigned int v15 = [v12 fileExistsAtPath:v14 isDirectory:&v20];

  if (v15)
  {
    if (v20)
    {
      BOOL v16 = [(DSMutableArchive *)self _addDirectoryToContents:v10 searchQueue:v11 flatten:v7 error:a6];
    }
    else
    {
      v18 = [(DSMutableArchive *)self tableOfContents];
      [v18 addObject:v10];

      BOOL v16 = 1;
    }
  }
  else
  {
    if (a6)
    {
      *a6 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:6 userInfo:0];
    }
    v17 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive _addPathToContents:searchQueue:flatten:error:](v10);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_addDirectoryToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = +[NSFileManager defaultManager];
  v12 = [v9 sourceUrl];
  id v31 = 0;
  v13 = [v11 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:0 options:0 error:&v31];
  id v14 = v31;

  if (v13)
  {
    unsigned int v15 = [v9 prefix];
    id v26 = v14;
    if (([v9 root] & 1) == 0 && !a5)
    {
      BOOL v16 = [v9 sourceUrl];
      v17 = [v16 lastPathComponent];
      uint64_t v18 = [v15 stringByAppendingPathComponent:v17];

      unsigned int v15 = v18;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v13;
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = +[DSArchivePath archivePathWithSource:*(void *)(*((void *)&v27 + 1) + 8 * (void)v23) prefix:v15 root:0];
          [v10 addObject:v24];

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }

    id v14 = v26;
  }
  else
  {
    if (a6)
    {
      *a6 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:5 userInfo:0];
    }
    unsigned int v15 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive _addDirectoryToContents:searchQueue:flatten:error:](v9);
    }
  }

  return v13 != 0;
}

- (BOOL)_addFile:(id)a3 archive:(archive *)a4 error:(id *)a5
{
  id v6 = a3;
  objc_msgSend(v6, "sourceUrl", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  BOOL v7 = 0);
  v8 = [v7 path];

  id v9 = [v6 prefix];
  id v10 = [v6 sourceUrl];
  id v11 = [v10 lastPathComponent];
  v12 = [v9 stringByAppendingPathComponent:v11];

  v13 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    long long v28 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Archiving [%@] as [%@]", buf, 0x16u);
  }

  id v14 = v8;
  int v15 = open((const char *)[v14 UTF8String], 0);
  if (v15 == -1)
  {
    BOOL v16 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:3 userInfo:0];
    id v21 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive _addFile:archive:error:].cold.4();
    }

    if (v16)
    {
      BOOL v20 = 0;
      goto LABEL_29;
    }
  }
  if (fstat(v15, &v24))
  {
    BOOL v16 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:2 userInfo:0];
    v17 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive _addFile:archive:error:]();
    }

    if (v16) {
      goto LABEL_26;
    }
  }
  uint64_t v18 = archive_entry_new();
  if (!v18)
  {
    BOOL v16 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:8 userInfo:0];
    uint64_t v22 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive _addFile:archive:error:](v22);
    }

    if (v16)
    {
LABEL_26:
      BOOL v20 = 0;
      goto LABEL_27;
    }
  }
  archive_entry_copy_stat();
  [v12 UTF8String];
  archive_entry_set_pathname();
  if (!archive_write_header()) {
    goto LABEL_19;
  }
  BOOL v16 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:9 userInfo:0];
  id v19 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[DSMutableArchive _addFile:archive:error:]();
  }

  if (!v16)
  {
LABEL_19:
    bzero(buf, 0x2000uLL);
    if (read(v15, buf, 0x2000uLL) >= 1)
    {
      do
        archive_write_data();
      while (read(v15, buf, 0x2000uLL) > 0);
    }
    BOOL v16 = 0;
    BOOL v20 = 1;
    if (!v18) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  BOOL v20 = 0;
  if (v18) {
LABEL_22:
  }
    archive_entry_free();
LABEL_27:
  if ((v15 & 0x80000000) == 0) {
    close(v15);
  }
LABEL_29:
  if (a5) {
    *a5 = v16;
  }

  return v20;
}

- (void)_setFormatOnArchive:(archive *)a3
{
  int64_t v4 = [(DSMutableArchive *)self format];
  if (v4 == 2)
  {
    archive_write_add_filter_gzip();
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    archive_write_add_filter_compress();
LABEL_5:
    _archive_write_set_format_cpio(a3);
    return;
  }
  archive_write_add_filter_gzip();

  _archive_write_set_format_ustar(a3);
}

- (BOOL)_writeArchive:(archive *)a3 error:(id *)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = [(DSMutableArchive *)self tableOfContents];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![(DSMutableArchive *)self _addFile:v12 archive:a3 error:a4])
        {
          int v15 = DiagnosticLogHandleForCategory(3);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[DSMutableArchive _writeArchive:error:](v12, v15);
          }

          goto LABEL_17;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int v13 = archive_write_free();
  if (!v13) {
    return 1;
  }
  int v14 = v13;
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:10 userInfo:0];
  }
  BOOL v7 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[DSMutableArchive _writeArchive:error:](v14, v7);
  }
LABEL_17:

  return 0;
}

- (id)archiveAsDataWithError:(id *)a3
{
  uint64_t v5 = archive_write_new();
  [(DSMutableArchive *)self _setFormatOnArchive:v5];
  if (archive_write_open())
  {
    id v6 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive archiveAsDataWithError:]();
    }

    if (a3)
    {
      id v7 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:1 userInfo:0];
      id v8 = 0;
      *a3 = v7;
      goto LABEL_9;
    }
  }
  else if ([(DSMutableArchive *)self _writeArchive:v5 error:a3])
  {
    id v8 = [(DSMutableArchive *)self dataBuffer];
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (id)archiveAsTempDirectoryWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = DiagnosticLogHandleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Archiving as temp directory with name %@", buf, 0xCu);
  }

  id v8 = +[NSFileManager defaultManager];
  id v9 = NSTemporaryDirectory();
  uint64_t v10 = +[NSURL fileURLWithPath:v9];

  id v11 = [v10 URLByAppendingPathComponent:v6];

  v12 = [v11 path];
  unsigned int v13 = [v8 fileExistsAtPath:v12];

  if (!v13) {
    goto LABEL_10;
  }
  int v14 = DiagnosticLogHandleForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v11;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Cleaning up prior temp directory archive at [%@]", buf, 0xCu);
  }

  [v8 removeItemAtURL:v11 error:a4];
  if (*a4)
  {
    int v15 = DiagnosticLogHandleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive archiveAsTempDirectoryWithName:error:]((uint64_t)v11, a4);
    }

    id v16 = 0;
  }
  else
  {
LABEL_10:
    [v8 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a4];
    if (!*a4)
    {
      v38 = v8;
      id v35 = v6;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obj = self->_tableOfContents;
      id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v37 = *(void *)v40;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v40 != v37) {
              objc_enumerationMutation(obj);
            }
            long long v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v21 = [v20 prefix];
            uint64_t v22 = v11;
            v23 = [v11 URLByAppendingPathComponent:v21];
            stat v24 = [v20 sourceUrl];
            v25 = [v24 lastPathComponent];
            id v26 = [v23 URLByAppendingPathComponent:v25];

            __int16 v27 = [v26 URLByDeletingLastPathComponent];
            [v38 createDirectoryAtURL:v27 withIntermediateDirectories:1 attributes:0 error:a4];

            long long v28 = [v20 sourceUrl];
            if (*a4) {
              long long v29 = 0;
            }
            else {
              long long v29 = a4;
            }
            unsigned __int8 v30 = [v38 copyItemAtURL:v28 toURL:v26 error:v29];

            if ((v30 & 1) == 0)
            {
              id v31 = DiagnosticLogHandleForCategory(0);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = [v20 sourceUrl];
                v33 = [*a4 description];
                *(_DWORD *)buf = 138412802;
                id v44 = v32;
                __int16 v45 = 2112;
                v46 = v26;
                __int16 v47 = 2112;
                v48 = v33;
                _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Failed to copy file in archive to temp directory from [%@] to [%@]. Error: [%@]", buf, 0x20u);
              }
            }

            id v11 = v22;
          }
          id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v49 count:16];
        }
        while (v18);
      }

      id v6 = v35;
      id v8 = v38;
    }
    id v16 = v11;
  }

  return v16;
}

- (id)archiveAsTempFileWithTemplate:(id)a3 error:(id *)a4
{
  return [(DSMutableArchive *)self archiveAsTempFileWithTemplate:a3 suffix:0 error:a4];
}

- (id)archiveAsTempFileWithTemplate:(id)a3 suffix:(id)a4 error:(id *)a5
{
  return [(DSMutableArchive *)self archiveAsTempFileWithTemplate:a3 directory:0 suffix:a4 error:a5];
}

- (id)archiveAsTempFileWithTemplate:(id)a3 directory:(id)a4 suffix:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    unsigned int v13 = NSTemporaryDirectory();
    id v11 = +[NSURL fileURLWithPath:v13];
  }
  int v14 = [v11 URLByAppendingPathComponent:v10];
  int v15 = [v14 path];

  if (v12)
  {
    uint64_t v16 = [v15 stringByAppendingString:v12];

    int v17 = [v12 length];
    int v15 = (void *)v16;
  }
  else
  {
    int v17 = 0;
  }
  id v18 = v15;
  long long v19 = (const char *)[v18 fileSystemRepresentation];
  size_t v20 = strlen(v19);
  id v21 = (char *)malloc_type_malloc(v20 + 1, 0x1BDC3ABBuLL);
  if (v21)
  {
    uint64_t v22 = v21;
    v23 = strcpy(v21, v19);
    uint64_t v24 = mkstemps(v23, v17);
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    unsigned __int8 v30 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:]();
    }

    uint64_t v31 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:4 userInfo:0];
    if (!v31)
    {
LABEL_29:
      if ([(DSMutableArchive *)self archiveAsFileUsingDescriptor:v24 error:a6])
      {
        v25 = +[NSFileManager defaultManager];
        id v26 = [v25 stringWithFileSystemRepresentation:v22 length:strlen(v22)];

        __int16 v27 = +[NSURL fileURLWithPath:v26];
      }
      else
      {
        __int16 v27 = 0;
      }
      free(v22);
      if ((v24 & 0x80000000) == 0) {
        close(v24);
      }
      id v29 = 0;
      goto LABEL_24;
    }
    id v29 = (id)v31;
    free(v22);
  }
  else
  {
    long long v28 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:]();
    }

    id v29 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:7 userInfo:0];
  }
  __int16 v27 = 0;
  if (a6 && v29)
  {
    id v29 = v29;
    __int16 v27 = 0;
    *a6 = v29;
  }
LABEL_24:

  return v27;
}

- (BOOL)archiveAsFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = archive_write_new();
  [(DSMutableArchive *)self _setFormatOnArchive:v7];
  id v8 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 path];
    int v15 = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to [%@]", (uint8_t *)&v15, 0xCu);
  }
  id v10 = [v6 path];
  [v10 UTF8String];
  int v11 = archive_write_open_filename();

  if (v11)
  {
    id v12 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DSMutableArchive archiveAsDataWithError:]();
    }

    if (a4)
    {
      +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:1 userInfo:0];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = [(DSMutableArchive *)self _writeArchive:v7 error:a4];
  }

  return v13;
}

- (BOOL)archiveAsFileUsingDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v6 = archive_write_new();
  [(DSMutableArchive *)self _setFormatOnArchive:v6];
  uint64_t v7 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to file descriptor.", v11, 2u);
  }

  if (!archive_write_open_fd()) {
    return [(DSMutableArchive *)self _writeArchive:v6 error:a4];
  }
  id v8 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[DSMutableArchive archiveAsDataWithError:]();
  }

  if (!a4) {
    return 0;
  }
  id v9 = +[NSError errorWithDomain:@"com.apple.Diagnostics.DSMutableArchive" code:1 userInfo:0];
  BOOL result = 0;
  *a4 = v9;
  return result;
}

+ (BOOL)extractEntry:(archive *)a3 toArchive:(archive *)a4
{
  while (1)
  {
    int data_block = archive_read_data_block();
    if (data_block) {
      break;
    }
    if (archive_write_data_block() < 0) {
      return 0;
    }
  }
  return data_block == 1;
}

+ (BOOL)extractArchive:(id)a3 toDirectory:(id)a4
{
  uint64_t v5 = (char *)a3;
  id v6 = a4;
  uint64_t v7 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v30 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Opening archive for extraction: %@", buf, 0xCu);
  }

  uint64_t v8 = archive_read_new();
  uint64_t v9 = archive_write_disk_new();
  archive_write_disk_set_options();
  archive_write_disk_set_standard_lookup();
  archive_read_support_format_all();
  archive_read_support_filter_all();
  id v10 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  [v5 getFileSystemRepresentation:v10 maxLength:1024];
  int v11 = (const char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  [v6 getFileSystemRepresentation:v11 maxLength:1024];
  size_t v12 = strlen(v11);
  if (v12 + 1 > 0x3FF)
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[DSMutableArchive extractArchive:toDirectory:].cold.7();
    }

    char v15 = 0;
    BOOL v13 = (char *)v11;
  }
  else
  {
    v11[v12] = 47;
    v11[v12 + 1] = 0;
    BOOL v13 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    __strcpy_chk();
    if (archive_read_open_filename())
    {
      int v14 = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[DSMutableArchive extractArchive:toDirectory:].cold.6();
      }
    }
    else
    {
      char v15 = 1;
      while (1)
      {
        int next_header = archive_read_next_header();
        if (next_header) {
          break;
        }
        long long v19 = (const char *)archive_entry_pathname();
        size_t v20 = strlen(v11);
        strcpy(&v13[v20], v19);
        archive_entry_set_pathname();
        id v21 = DiagnosticLogHandleForCategory(3);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          unsigned __int8 v30 = v13;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Extracting %s", buf, 0xCu);
        }

        if ((archive_write_header() & 0x80000000) != 0)
        {
          id v26 = DiagnosticLogHandleForCategory(3);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[DSMutableArchive extractArchive:toDirectory:].cold.4();
          }

          int v14 = DiagnosticLogHandleForCategory(3);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_31:
            +[DSMutableArchive extractArchive:toDirectory:]();
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        unsigned int v22 = +[DSMutableArchive extractEntry:v8 toArchive:v9];
        char v15 = v22;
        if (!v22 || archive_write_finish_entry())
        {
          v23 = DiagnosticLogHandleForCategory(3);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unsigned __int8 v30 = v5;
            _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Failed to extract %@", buf, 0xCu);
          }

          uint64_t v24 = DiagnosticLogHandleForCategory(3);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[DSMutableArchive extractArchive:&v28 toDirectory:v24];
          }
        }
      }
      if (next_header == 1)
      {
        int v14 = DiagnosticLogHandleForCategory(3);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned __int8 v30 = v5;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Finished extracting %@", buf, 0xCu);
        }
        goto LABEL_8;
      }
      v25 = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[DSMutableArchive extractArchive:toDirectory:]();
      }

      int v14 = DiagnosticLogHandleForCategory(3);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
    }
LABEL_7:
    char v15 = 0;
LABEL_8:

    archive_read_close();
    archive_read_free();
    archive_write_close();
    archive_write_free();
    free(v10);
    id v10 = (void *)v11;
  }
  free(v10);
  free(v13);

  return v15 & 1;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (NSMutableData)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
}

- (NSMutableArray)tableOfContents
{
  return self->_tableOfContents;
}

- (void)setTableOfContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContents, 0);

  objc_storeStrong((id *)&self->_dataBuffer, 0);
}

- (void)_addPathToContents:(void *)a1 searchQueue:flatten:error:.cold.1(void *a1)
{
  v1 = [a1 sourceUrl];
  v2 = [v1 path];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_0, v3, v4, "File or directory does not exist: [%@]", v5, v6, v7, v8, v9);
}

- (void)_addDirectoryToContents:(void *)a1 searchQueue:flatten:error:.cold.1(void *a1)
{
  v1 = [a1 sourceUrl];
  v2 = [v1 path];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_0, v3, v4, "Could not enumerate directory: [%@]: %@", v5, v6, v7, v8, v9);
}

- (void)_addFile:archive:error:.cold.1()
{
  archive_error_string();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_0, v0, v1, "Error writing header: %s", v2, v3, v4, v5, v6);
}

- (void)_addFile:(os_log_t)log archive:error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error creating entry.", v1, 2u);
}

- (void)_addFile:archive:error:.cold.3()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v1, v2, "Error during stat of file %@: %s", v3, v4, v5, v6, v7);
}

- (void)_addFile:archive:error:.cold.4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v1, v2, "Error opening file %@: %s", v3, v4, v5, v6, v7);
}

- (void)_writeArchive:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed to write completed archive to storage with archive status: %d", (uint8_t *)v2, 8u);
}

- (void)_writeArchive:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 sourceUrl];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed to add file to archive: %@", v4, 0xCu);
}

- (void)archiveAsDataWithError:.cold.1()
{
  archive_error_string();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_0, v0, v1, "Error creating archive: %s", v2, v3, v4, v5, v6);
}

- (void)archiveAsTempDirectoryWithName:(uint64_t)a1 error:(id *)a2 .cold.1(uint64_t a1, id *a2)
{
  uint64_t v8 = [*a2 description];
  OUTLINED_FUNCTION_3_0(&dword_0, v2, v3, "Failed to clean up up prior temp directory archive at [%@]. Error: [%@]", v4, v5, v6, v7, 2u);
}

- (void)archiveAsTempFileWithTemplate:directory:suffix:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_0, v0, v1, "Could not allocate %lu bytes.", v2);
}

- (void)archiveAsTempFileWithTemplate:directory:suffix:error:.cold.2()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_0, v1, v2, "Could not create temp file: %s", v3, v4, v5, v6, v7);
}

+ (void)extractArchive:toDirectory:.cold.1()
{
  archive_error_string();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_0, v0, v1, "Extract error: %s", v2, v3, v4, v5, v6);
}

+ (void)extractArchive:toDirectory:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_0, v0, v1, "Failed to extract %@", v2);
}

+ (void)extractArchive:toDirectory:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_0, v0, v1, "Failed to extract from %@", v2);
}

+ (void)extractArchive:(uint64_t *)a3 toDirectory:(NSObject *)a4 .cold.5(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = archive_error_string();
  *(_DWORD *)a1 = 136315138;
  *a3 = v7;
  _os_log_error_impl(&dword_0, a4, OS_LOG_TYPE_ERROR, "Extract error: %s", a1, 0xCu);
}

+ (void)extractArchive:toDirectory:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_0, v0, v1, "Failed to open archive for extraction: %@", v2);
}

+ (void)extractArchive:toDirectory:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_0, v0, v1, "The extract destination path %@ is too long to use as the extraction destination!", v2);
}

@end