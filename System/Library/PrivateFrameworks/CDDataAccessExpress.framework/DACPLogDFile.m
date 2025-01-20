@interface DACPLogDFile
- (BOOL)logData:(id)a3 outDidCreateNewFile:(BOOL *)a4 outNewFilePath:(id *)a5;
- (DACPLogDFile)initWithFolder:(id)a3 baseName:(id)a4;
- (NSString)UUID;
- (NSString)baseName;
- (NSString)folder;
- (id)_filePathsMatchingPattern:(id)a3;
- (id)_getLatestMatchingFilePath;
- (id)_startNewFile;
- (id)startNewFile;
- (void)_beginWatchingFile;
- (void)_closeFileWithFileEventDispatchSource:(id)a3;
- (void)_openFileOutDidCreateNewFile:(BOOL *)a3 outNewFilePath:(id *)a4;
- (void)checkForMaximumFileSize:(int64_t)a3 wantsCompressed:(BOOL)a4 outDidCreateNewFile:(BOOL *)a5 outNewFilePath:(id *)a6;
- (void)cullFilesMaxFileCount:(int64_t)a3;
@end

@implementation DACPLogDFile

- (DACPLogDFile)initWithFolder:(id)a3 baseName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DACPLogDFile;
  v9 = [(DACPLogDFile *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeStrong((id *)&v10->_baseName, a4);
    uint64_t v11 = [NSString DACPLogMakeUUID];
    UUID = v10->_UUID;
    v10->_UUID = (NSString *)v11;

    v10->_fd = -1;
  }

  return v10;
}

- (id)_filePathsMatchingPattern:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = opendir([(NSString *)self->_folder fileSystemRepresentation]);
  if (v6)
  {
    id v7 = v6;
    id v8 = [NSString stringWithFormat:@"%@%@", self->_baseName, v4];
    uint64_t v9 = [v8 length];
    v10 = readdir(v7);
    if (v10)
    {
      uint64_t v11 = v10;
      do
      {
        if (v9 == v11->d_namlen)
        {
          id v12 = v8;
          v13 = (unsigned char *)[v12 UTF8String];
          int v14 = v11->d_name[0];
          if (v11->d_name[0])
          {
            v15 = &v11->d_name[1];
            while (1)
            {
              int v16 = *v13;
              if (v16 != 63 && (!*v13 || v14 != v16)) {
                break;
              }
              ++v13;
              int v18 = *v15++;
              int v14 = v18;
              if (!v18) {
                goto LABEL_14;
              }
            }
          }
          else
          {
LABEL_14:
            if (!*v13)
            {

              id v12 = [NSString stringWithFormat:@"%@/%s", self->_folder, v11->d_name];
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v11 = readdir(v7);
      }
      while (v11);
    }
    closedir(v7);
  }
  [v5 sortUsingComparator:&__block_literal_global_2];

  return v5;
}

uint64_t __42__DACPLogDFile__filePathsMatchingPattern___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_getLatestMatchingFilePath
{
  v2 = [(DACPLogDFile *)self _filePathsMatchingPattern:@"_????_??_??_??_??_???????.log"];
  if ([v2 count])
  {
    v3 = [v2 lastObject];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_openFileOutDidCreateNewFile:(BOOL *)a3 outNewFilePath:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(DACPLogDFile *)self _getLatestMatchingFilePath];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [NSString stringWithFormat:@"%@/.%@", self->_folder, self->_baseName];
    id v10 = v8;
    uint64_t v11 = (const char *)[v10 fileSystemRepresentation];
    id v12 = v9;
    if (link(v11, (const char *)[v12 fileSystemRepresentation]))
    {
      v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C8854000, v13, OS_LOG_TYPE_ERROR, "The log file has been deleted before we had a chance to open it.", buf, 2u);
      }
    }
    else
    {
      id v14 = v10;
      self->_int fd = open((const char *)[v14 fileSystemRepresentation], 9);
      v15 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v14;
        _os_log_impl(&dword_1C8854000, v15, OS_LOG_TYPE_INFO, "Opened existing log file for writing: %@", buf, 0xCu);
      }

      int v16 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int fd = self->_fd;
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = fd;
        _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_INFO, "FD: %d", buf, 8u);
      }

      if ((self->_fd & 0x80000000) == 0)
      {
        objc_storeStrong((id *)&self->_path, v14);
        [(DACPLogDFile *)self _beginWatchingFile];
      }
    }

    if (v12)
    {
      id v18 = v12;
      unlink((const char *)[v18 fileSystemRepresentation]);
    }
  }
  if (self->_fd < 0 || ![(NSString *)self->_path length])
  {
    v19 = [(DACPLogDFile *)self _startNewFile];
    BOOL v20 = v19 != 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v19 = 0;
  BOOL v20 = 0;
  if (a3) {
LABEL_19:
  }
    *a3 = v20;
LABEL_20:
  if (a4) {
    *a4 = v19;
  }
}

- (void)_beginWatchingFile
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    int fd = self->_fd;
    *(_DWORD *)buf = 138412546;
    dispatch_source_t v21 = (dispatch_source_t)path;
    __int16 v22 = 1024;
    int v23 = fd;
    _os_log_impl(&dword_1C8854000, v3, OS_LOG_TYPE_INFO, "Watching file: %@, FD: %d", buf, 0x12u);
  }

  uintptr_t v6 = self->_fd;
  uint64_t v7 = _fileOpsQueue();
  dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F144A8], v6, 1uLL, v7);

  objc_storeStrong((id *)&self->_fileEventDispatchSource, v8);
  uint64_t v9 = self->_path;
  int v10 = self->_fd;
  uint64_t v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    dispatch_source_t v21 = v8;
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_INFO, "Created new dispatch source %p", buf, 0xCu);
  }

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__DACPLogDFile__beginWatchingFile__block_invoke;
  handler[3] = &unk_1E6573C30;
  v17 = v9;
  id v18 = self;
  dispatch_source_t v19 = v8;
  id v12 = v8;
  v13 = v9;
  dispatch_source_set_event_handler(v12, handler);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__DACPLogDFile__beginWatchingFile__block_invoke_22;
  v14[3] = &__block_descriptor_36_e5_v8__0l;
  int v15 = v10;
  dispatch_source_set_cancel_handler(v12, v14);
  dispatch_resume(v12);
}

void __34__DACPLogDFile__beginWatchingFile__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_INFO, "Received file event for file %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    uintptr_t v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_INFO, "Log file has been deleted: %@", (uint8_t *)&v8, 0xCu);
    }

    if ([*(id *)(*(void *)(a1 + 40) + 32) isEqualToString:*(void *)(a1 + 32)])
    {
      [*(id *)(a1 + 40) _closeFileWithFileEventDispatchSource:*(void *)(a1 + 48)];
      *(unsigned char *)(*(void *)(a1 + 40) + 56) = 1;
    }
    else
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
    }
  }
}

uint64_t __34__DACPLogDFile__beginWatchingFile__block_invoke_22(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_INFO, "Closing FD %d", (uint8_t *)v5, 8u);
  }

  return close(*(_DWORD *)(a1 + 32));
}

- (void)_closeFileWithFileEventDispatchSource:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((self->_fd & 0x80000000) == 0)
  {
    id v4 = a3;
    char v5 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      int fd = self->_fd;
      int v9 = 138412546;
      uint64_t v10 = path;
      __int16 v11 = 1024;
      int v12 = fd;
      _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_INFO, "Closing file at %@, FD %d", (uint8_t *)&v9, 0x12u);
    }

    dispatch_source_cancel(v4);
    self->_int fd = -1;
    int v8 = self->_path;
    self->_path = 0;
  }
}

- (id)_startNewFile
{
  v61[1] = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v54 = 1;
  int v4 = [v3 fileExistsAtPath:self->_folder isDirectory:&v54];
  if (v4) {
    BOOL v5 = v54 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      folder = self->_folder;
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = folder;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_ERROR, "The file at path %@ is not a directory.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_32;
  }
  if ((v4 & 1) == 0)
  {
    uint64_t v60 = *MEMORY[0x1E4F28330];
    v61[0] = &unk_1F23283F0;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = self->_folder;
    id v53 = 0;
    char v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v6 error:&v53];
    id v10 = v53;

    __int16 v11 = DALoggingwithCategory(0);
    int v12 = v11;
    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_folder;
        buf.st_dev = 138412546;
        *(void *)&buf.st_mode = v30;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v10;
        _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_ERROR, "Cannot create directory %@. Error: %@", (uint8_t *)&buf, 0x16u);
      }

      goto LABEL_31;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = self->_folder;
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v13;
      _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_INFO, "Created directory at path: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v6 = [NSString stringWithFormat:@"%@/.%@", self->_folder, self->_baseName];
  if ([v3 fileExistsAtPath:v6]) {
    goto LABEL_13;
  }
  uint64_t v58 = *MEMORY[0x1E4F28330];
  v59 = &unk_1F2328408;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  if (([v3 createFileAtPath:v6 contents:0 attributes:v10] & 1) == 0)
  {
    v32 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v6;
      _os_log_impl(&dword_1C8854000, v32, OS_LOG_TYPE_ERROR, "Cannot create temporary linked file at %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_31:
LABEL_32:
    v28 = 0;
    goto LABEL_33;
  }

LABEL_13:
  uint64_t v6 = v6;
  int v14 = open((const char *)[v6 fileSystemRepresentation], 9);
  self->_int fd = v14;
  if (v14 < 0)
  {
    v31 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v6;
      _os_log_impl(&dword_1C8854000, v31, OS_LOG_TYPE_ERROR, "Cannot create temporary linked file at %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_32;
  }
  int v15 = NSString;
  int v16 = self->_folder;
  baseName = self->_baseName;
  if (_fileDateFormatter_onceToken != -1) {
    dispatch_once(&_fileDateFormatter_onceToken, &__block_literal_global_146);
  }
  id v18 = (void *)MEMORY[0x1E4F1C9C8];
  id v19 = (id)_fileDateFormatter_formatter;
  BOOL v20 = [v18 date];
  dispatch_source_t v21 = [v19 stringFromDate:v20];
  __int16 v22 = [v15 stringWithFormat:@"%@/%@_%@.log", v16, baseName, v21];
  path = self->_path;
  self->_path = v22;

  uint64_t v6 = v6;
  LODWORD(v20) = link((const char *)[v6 fileSystemRepresentation], [(NSString *)self->_path fileSystemRepresentation]);
  uint64_t v24 = DALoggingwithCategory(0);
  v25 = v24;
  if (v20)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = self->_path;
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v26;
      _os_log_impl(&dword_1C8854000, v25, OS_LOG_TYPE_ERROR, "Cannot link file to path %@", (uint8_t *)&buf, 0xCu);
    }

    v27 = self->_path;
    self->_path = 0;

    close(self->_fd);
    v28 = 0;
    self->_int fd = -1;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v34 = self->_path;
    buf.st_dev = 138412290;
    *(void *)&buf.st_mode = v34;
    _os_log_impl(&dword_1C8854000, v25, OS_LOG_TYPE_INFO, "Created new log file %@.", (uint8_t *)&buf, 0xCu);
  }

  v35 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    int fd = self->_fd;
    buf.st_dev = 67109120;
    *(_DWORD *)&buf.st_mode = fd;
    _os_log_impl(&dword_1C8854000, v35, OS_LOG_TYPE_INFO, "FD: %d", (uint8_t *)&buf, 8u);
  }

  [(DACPLogDFile *)self _beginWatchingFile];
  uint64_t v6 = v6;
  unlink((const char *)[v6 fileSystemRepresentation]);
  v37 = [NSString stringWithFormat:@"%@/%@-latest.log", self->_folder, self->_baseName];
  memset(&buf, 0, sizeof(buf));
  id v38 = v37;
  if (lstat((const char *)[v38 fileSystemRepresentation], &buf))
  {
LABEL_43:
    id v39 = [(NSString *)self->_path lastPathComponent];
    v40 = (const char *)[v39 fileSystemRepresentation];
    id v41 = v38;
    LODWORD(v40) = symlink(v40, (const char *)[v41 fileSystemRepresentation]);

    v42 = DALoggingwithCategory(0);
    v43 = v42;
    if (v40)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v44 = self->_path;
        *(_DWORD *)v55 = 138412290;
        *(void *)v56 = v44;
        v45 = "Could not create symlink to latest log file: %@";
LABEL_53:
        v51 = v43;
        uint32_t v52 = 12;
        goto LABEL_54;
      }
    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v46 = self->_path;
        *(_DWORD *)v55 = 138412546;
        *(void *)v56 = v41;
        *(_WORD *)&v56[8] = 2112;
        *(void *)&v56[10] = v46;
        _os_log_impl(&dword_1C8854000, v43, OS_LOG_TYPE_INFO, "Created symlink link: %@. Destination: %@", v55, 0x16u);
      }

      id v47 = v41;
      if (!fchmodat(0, (const char *)[v47 fileSystemRepresentation], 0x1FFu, 32)) {
        goto LABEL_56;
      }
      v43 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        int v48 = *__error();
        v49 = __error();
        v50 = strerror(*v49);
        *(_DWORD *)v55 = 67109634;
        *(_DWORD *)v56 = v48;
        *(_WORD *)&v56[4] = 2080;
        *(void *)&v56[6] = v50;
        *(_WORD *)&v56[14] = 2112;
        *(void *)&v56[16] = v47;
        v45 = "Could not chmod symlink to latest log file. Error code: %d - message: %s. Symlink: %@";
        v51 = v43;
        uint32_t v52 = 28;
LABEL_54:
        _os_log_impl(&dword_1C8854000, v51, OS_LOG_TYPE_ERROR, v45, v55, v52);
        goto LABEL_55;
      }
    }
    goto LABEL_55;
  }
  if ((~buf.st_mode & 0xA000) == 0)
  {
    unlink((const char *)[v38 fileSystemRepresentation]);
    goto LABEL_43;
  }
  v43 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v55 = 138412290;
    *(void *)v56 = v38;
    v45 = "The name of the symlink file clashes with an existing file: %@";
    goto LABEL_53;
  }
LABEL_55:

LABEL_56:
  if (self->_fileWasDeleted) {
    self->_fileWasDeleted = 0;
  }
  v28 = self->_path;

LABEL_33:

  return v28;
}

- (BOOL)logData:(id)a3 outDidCreateNewFile:(BOOL *)a4 outNewFilePath:(id *)a5
{
  id v8 = a3;
  BOOL v15 = 0;
  int fd = self->_fd;
  if (fd < 0)
  {
    id v14 = 0;
    [(DACPLogDFile *)self _openFileOutDidCreateNewFile:&v15 outNewFilePath:&v14];
    id v10 = v14;
    int fd = self->_fd;
    if (fd < 0)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v8;
  write(fd, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  if (a4) {
    *a4 = v15;
  }
  if (a5)
  {
    id v10 = v10;
    *a5 = v10;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (id)startNewFile
{
  [(DACPLogDFile *)self _closeFileWithFileEventDispatchSource:self->_fileEventDispatchSource];
  fileEventDispatchSource = self->_fileEventDispatchSource;
  self->_fileEventDispatchSource = 0;

  return [(DACPLogDFile *)self _startNewFile];
}

- (void)checkForMaximumFileSize:(int64_t)a3 wantsCompressed:(BOOL)a4 outDidCreateNewFile:(BOOL *)a5 outNewFilePath:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v44 = 0;
  if ((self->_fd & 0x80000000) == 0)
  {
    id v11 = 0;
LABEL_3:
    BOOL v12 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      *(_DWORD *)stat buf = 138412290;
      v46 = path;
      _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_INFO, "Checking size of log file at path %@", buf, 0xCu);
    }

    id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v15 = self->_path;
    id v42 = 0;
    int v16 = [v14 attributesOfItemAtPath:v15 error:&v42];
    id v17 = v42;
    if (v17)
    {
      id v18 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = self->_path;
        *(_DWORD *)stat buf = 138412546;
        v46 = v19;
        __int16 v47 = 2112;
        id v48 = v17;
        _os_log_impl(&dword_1C8854000, v18, OS_LOG_TYPE_ERROR, "Cannot get attributes of file at path %@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
      if ((a3 & 0x8000000000000000) == 0 && [v16 fileSize] > (unint64_t)a3)
      {
        v40 = self->_path;
        [(DACPLogDFile *)self _closeFileWithFileEventDispatchSource:self->_fileEventDispatchSource];
        fileEventDispatchSource = self->_fileEventDispatchSource;
        self->_fileEventDispatchSource = 0;

        uint64_t v22 = [(DACPLogDFile *)self _startNewFile];

        BOOL v44 = v22 != 0;
        if (v8)
        {
          getpid();
          proc_disable_cpumon();
          int v23 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 138412290;
            v46 = v40;
            _os_log_impl(&dword_1C8854000, v23, OS_LOG_TYPE_INFO, "Compressing file at %@", buf, 0xCu);
          }

          id v39 = [(NSString *)v40 stringByAppendingPathExtension:@"gz"];
          folder = self->_folder;
          v25 = [NSString stringWithFormat:@".%@", self->_baseName];
          v26 = [(NSString *)folder stringByAppendingPathComponent:v25];

          v27 = v40;
          v28 = fopen([(NSString *)v27 fileSystemRepresentation], "r");
          if (v28)
          {
            v29 = v28;
            id v30 = v26;
            v31 = fopen((const char *)[v30 fileSystemRepresentation], "w");
            if (v31)
            {
              v37 = v26;
              id v38 = v31;
              int v32 = CPFileCompressionZDeflate();
              if (v32)
              {
                int v33 = v32;
                v34 = DALoggingwithCategory(0);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)stat buf = 67109120;
                  LODWORD(v46) = v33;
                  _os_log_impl(&dword_1C8854000, v34, OS_LOG_TYPE_ERROR, "Could not compress file. Status: %d", buf, 8u);
                }
                v26 = v37;
              }
              else
              {
                id v41 = 0;
                [v14 moveItemAtPath:v30 toPath:v39 error:&v41];
                v36 = v41;
                if (v36)
                {
                  v35 = DALoggingwithCategory(0);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)stat buf = 138412802;
                    v46 = (NSString *)v30;
                    __int16 v47 = 2112;
                    id v48 = v39;
                    __int16 v49 = 2112;
                    v50 = v36;
                    _os_log_impl(&dword_1C8854000, v35, OS_LOG_TYPE_ERROR, "Could not move compressed file from %@ to %@. Error: %@", buf, 0x20u);
                  }

                  v34 = v36;
                }
                else
                {
                  [v14 removeItemAtPath:v27 error:0];
                  v34 = 0;
                }
              }

              fclose(v38);
            }
            fclose(v29);
          }
          getpid();
          proc_set_cpumon_defaults();
        }
        id v11 = (id)v22;
      }
      if (a5) {
        *a5 = v44;
      }
      if (a6)
      {
        id v11 = v11;
        *a6 = v11;
      }
    }

    goto LABEL_41;
  }
  id v43 = 0;
  [(DACPLogDFile *)self _openFileOutDidCreateNewFile:&v44 outNewFilePath:&v43];
  id v20 = v43;
  id v11 = v20;
  if (!v44)
  {
    if (self->_fd < 0) {
      goto LABEL_41;
    }
    goto LABEL_3;
  }
  if (a5) {
    *a5 = 1;
  }
  if (a6)
  {
    id v11 = v20;
    *a6 = v11;
  }
LABEL_41:
}

- (void)cullFilesMaxFileCount:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_opt_new();
  uint64_t v6 = [(DACPLogDFile *)self _filePathsMatchingPattern:@"_????_??_??_??_??_???????.log"];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [(DACPLogDFile *)self _filePathsMatchingPattern:@"_????_??_??_??_??_???????.log.gz"];
  [v5 addObjectsFromArray:v7];

  [v5 sortUsingComparator:&__block_literal_global_44];
  if ((a3 & 0x8000000000000000) == 0 && [v5 count] > (unint64_t)a3)
  {
    BOOL v8 = objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") + ~a3);
    char v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", self->_path, (void)v16) & 1) == 0) {
            [v9 removeItemAtPath:v15 error:0];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

uint64_t __38__DACPLogDFile_cullFilesMaxFileCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)folder
{
  return self->_folder;
}

- (NSString)baseName
{
  return self->_baseName;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileEventDispatchSource, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_baseName, 0);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end