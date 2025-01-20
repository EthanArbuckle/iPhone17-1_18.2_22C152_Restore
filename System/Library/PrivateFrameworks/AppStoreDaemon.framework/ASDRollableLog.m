@interface ASDRollableLog
- (ASDLogFileOptions)logOptions;
- (ASDRollableLog)initWithLogOptions:(id)a3;
- (id)_activeLogFilePath;
- (id)_logFilePathWithIndex:(uint64_t)a1;
- (void)_closeLogFile;
- (void)_openLogFile;
- (void)dealloc;
- (void)writeString:(id)a3;
@end

@implementation ASDRollableLog

- (ASDRollableLog)initWithLogOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRollableLog;
  v5 = [(ASDRollableLog *)&v12 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemon.ASFRollableLog", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    v5->_lastFileStatTime = -1.79769313e308;
    uint64_t v9 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASDLogFileOptions *)v9;

    -[ASDRollableLog _openLogFile]((uint64_t)v5);
  }

  return v5;
}

- (void)_openLogFile
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v3 = [*(id *)(a1 + 40) logDirectoryPath];
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

    -[ASDRollableLog _activeLogFilePath](a1);
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v5 = open((const char *)[v4 fileSystemRepresentation], 522, 384);

    if ((v5 & 0x80000000) == 0)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:1];
      dispatch_queue_t v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      [*(id *)(a1 + 24) seekToEndOfFile];
      int v8 = dup(v5);
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F144A8], v8, 0x61uLL, *(dispatch_queue_t *)(a1 + 8));
      v10 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v9;

      v11 = *(NSObject **)(a1 + 32);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __30__ASDRollableLog__openLogFile__block_invoke;
      handler[3] = &unk_1E58B2EB8;
      handler[4] = a1;
      dispatch_source_set_event_handler(v11, handler);
      objc_super v12 = *(NSObject **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __30__ASDRollableLog__openLogFile__block_invoke_2;
      v13[3] = &__block_descriptor_36_e5_v8__0l;
      int v14 = v8;
      dispatch_source_set_cancel_handler(v12, v13);
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ASDRollableLog;
  [(ASDRollableLog *)&v2 dealloc];
}

- (ASDLogFileOptions)logOptions
{
  objc_super v2 = (void *)[(ASDLogFileOptions *)self->_options copy];
  return (ASDLogFileOptions *)v2;
}

- (void)writeString:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ASDRollableLog_writeString___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __30__ASDRollableLog_writeString___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) || (-[ASDRollableLog _openLogFile](*(void *)(a1 + 32)), (uint64_t v2 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v3 = [*(id *)(v2 + 40) maxLogFileSize];
    if (v3)
    {
      unint64_t v4 = v3;
      if ([*(id *)(v2 + 40) maxNumberOfLogFiles] >= 2
        && CFAbsoluteTimeGetCurrent() - *(double *)(v2 + 16) >= 60.0)
      {
        memset(&v15, 0, sizeof(v15));
        -[ASDRollableLog _activeLogFilePath](v2);
        id v5 = objc_claimAutoreleasedReturnValue();
        int v6 = stat((const char *)[v5 fileSystemRepresentation], &v15);

        if (!v6 && v15.st_size >= v4)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
          -[ASDRollableLog _closeLogFile](v2);
          uint64_t v8 = [*(id *)(v2 + 40) maxNumberOfLogFiles];
          dispatch_source_t v9 = -[ASDRollableLog _logFilePathWithIndex:](v2, v8 - 1);
          [v7 removeItemAtPath:v9 error:0];

          uint64_t v10 = v8 - 2;
          if (v8 >= 2)
          {
            do
            {
              uint64_t v11 = v10;
              objc_super v12 = -[ASDRollableLog _logFilePathWithIndex:](v2, v10);
              v13 = -[ASDRollableLog _logFilePathWithIndex:](v2, v11 + 1);
              [v7 moveItemAtPath:v12 toPath:v13 error:0];

              uint64_t v10 = v11 - 1;
            }
            while (v11);
          }
          -[ASDRollableLog _openLogFile](v2);
        }
      }
    }
  }
  id v14 = [*(id *)(a1 + 40) dataUsingEncoding:4];
  [*(id *)(*(void *)(a1 + 32) + 24) writeData:v14];
}

- (void)_closeLogFile
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 32);
    if (v2)
    {
      dispatch_source_cancel(v2);
      uint64_t v3 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    unint64_t v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (id)_activeLogFilePath
{
  v1 = -[ASDRollableLog _logFilePathWithIndex:](a1, 0);
  return v1;
}

- (id)_logFilePathWithIndex:(uint64_t)a1
{
  unint64_t v4 = [*(id *)(a1 + 40) logFileBaseName];
  id v5 = [v4 pathExtension];
  if ([(__CFString *)v5 length])
  {
    if (a2 < 1) {
      goto LABEL_8;
    }
    int v6 = [v4 stringByDeletingPathExtension];

    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a2);
    unint64_t v4 = [v6 stringByAppendingPathExtension:v7];

    uint64_t v8 = v4;
    dispatch_source_t v9 = v5;
  }
  else
  {
    if (a2 >= 1)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a2);
      uint64_t v11 = [v4 stringByAppendingPathExtension:v10];

      unint64_t v4 = (void *)v11;
    }
    dispatch_source_t v9 = @"log";
    uint64_t v8 = v4;
  }
  uint64_t v12 = [v8 stringByAppendingPathExtension:v9];

  unint64_t v4 = (void *)v12;
LABEL_8:
  v13 = [*(id *)(a1 + 40) logDirectoryPath];
  id v14 = [v13 stringByAppendingPathComponent:v4];

  return v14;
}

uint64_t __30__ASDRollableLog__openLogFile__block_invoke(uint64_t a1)
{
  -[ASDRollableLog _closeLogFile](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  return -[ASDRollableLog _openLogFile](v2);
}

uint64_t __30__ASDRollableLog__openLogFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_fileObserverSource, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end