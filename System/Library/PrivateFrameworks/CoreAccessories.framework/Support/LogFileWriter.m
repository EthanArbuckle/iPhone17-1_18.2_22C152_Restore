@interface LogFileWriter
- (BOOL)_log:(id)a3;
- (id)initFor:(id)a3;
- (id)initFor:(id)a3 fileLabel:(id)a4;
- (void)_flush;
- (void)createFilePath;
- (void)dealloc;
- (void)flush;
- (void)log:(id)a3;
- (void)log:(id)a3 data:(id)a4;
- (void)log:(id)a3 data:(id)a4 limit:(unint64_t)a5;
- (void)logRawData:(id)a3;
- (void)scheduleFlush;
- (void)timerFlush:(id)a3;
- (void)unscheduleFlush;
@end

@implementation LogFileWriter

- (id)initFor:(id)a3 fileLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LogFileWriter;
  v9 = [(LogFileWriter *)&v15 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    logData = v9->_logData;
    v9->_logData = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessoryd.LogWriter", 0);
    logQueue = v9->_logQueue;
    v9->_logQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_filenamePrefix, a3);
    objc_storeStrong((id *)&v9->_fileLabel, a4);
  }

  return v9;
}

- (id)initFor:(id)a3
{
  return [(LogFileWriter *)self initFor:a3 fileLabel:0];
}

- (void)dealloc
{
  [(LogFileWriter *)self unscheduleFlush];
  filenamePrefix = self->_filenamePrefix;
  self->_filenamePrefix = 0;

  filePath = self->_filePath;
  self->_filePath = 0;

  flushTimer = self->_flushTimer;
  self->_flushTimer = 0;

  logData = self->_logData;
  self->_logData = 0;

  fileLabel = self->_fileLabel;
  self->_fileLabel = 0;

  v8.receiver = self;
  v8.super_class = (Class)LogFileWriter;
  [(LogFileWriter *)&v8 dealloc];
}

- (void)logRawData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__LogFileWriter_logRawData___block_invoke;
  block[3] = &unk_1002158F0;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  v9 = &v10;
  dispatch_sync(logQueue, block);
  if (*((unsigned char *)v11 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }

  _Block_object_dispose(&v10, 8);
}

id __28__LogFileWriter_logRawData___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) += [*(id *)(a1 + 40) length];
  id result = [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 40) >> 10 > 4uLL;
  return result;
}

- (BOOL)_log:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  v5 = v4;
  if (v4)
  {
    self->_logDataSize += (unint64_t)[v4 length];
    [(NSMutableArray *)self->_logData addObject:v5];
    BOOL v6 = self->_logDataSize >> 10 > 4;
  }
  else
  {
    NSLog(@"ERROR!!!: _log: dataUsingEncoding returned nil!");
    BOOL v6 = 0;
  }

  return v6;
}

- (void)log:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ"];
  BOOL v6 = +[NSDate date];
  id v7 = [v5 stringFromDate:v6];

  id v8 = +[NSString stringWithFormat:@"%@ %@\n", v7, v4];

  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __21__LogFileWriter_log___block_invoke;
  block[3] = &unk_100215918;
  char v13 = &v14;
  block[4] = self;
  id v10 = v8;
  id v12 = v10;
  dispatch_sync(logQueue, block);
  if (*((unsigned char *)v15 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }

  _Block_object_dispose(&v14, 8);
}

id __21__LogFileWriter_log___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _log:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

- (void)log:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LogFileWriter log:data:limit:](self, "log:data:limit:", v7, v6, [v6 length]);
}

- (void)log:(id)a3 data:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v10 = objc_alloc_init((Class)NSDateFormatter);
  [v10 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ"];
  v11 = +[NSDate date];
  id v12 = [v10 stringFromDate:v11];

  logQueue = self->_logQueue;
  char v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = __32__LogFileWriter_log_data_limit___block_invoke;
  v20 = &unk_100215940;
  id v14 = v12;
  id v21 = v14;
  id v15 = v8;
  v25 = &v27;
  id v22 = v15;
  v23 = self;
  id v16 = v9;
  id v24 = v16;
  unint64_t v26 = a5;
  dispatch_sync(logQueue, &v17);
  if (*((unsigned char *)v28 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }

  _Block_object_dispose(&v27, 8);
}

void __32__LogFileWriter_log_data_limit___block_invoke(uint64_t a1)
{
  v2 = +[NSString stringWithFormat:@"%@ %@<", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:v2];
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    id v4 = (unsigned __int8 *)[v3 bytes];
    id v5 = (char *)[*(id *)(a1 + 56) length];
    unint64_t v6 = (unint64_t)v5;
    unint64_t v7 = *(void *)(a1 + 72);
    if ((unint64_t)v5 >= v7) {
      id v8 = *(char **)(a1 + 72);
    }
    else {
      id v8 = v5;
    }
    if (v8)
    {
      do
      {
        unsigned int v9 = *v4++;
        id v14 = +[NSString stringWithFormat:@"%02x ", v9];

        unsigned __int8 v10 = [*(id *)(a1 + 48) _log:v14];
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
        char v12 = *(unsigned char *)(v11 + 24) | v10;
        id v13 = v14;
        *(unsigned char *)(v11 + 24) = v12;
        v2 = v14;
        --v8;
      }
      while (v8);
    }
    else
    {
      id v13 = v2;
    }
    id v15 = v13;
    if (v6 > v7) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:@"... "];
    }
  }
  else
  {
    id v15 = v2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:@">\n"];
}

- (void)createFilePath
{
  filePath = self->_filePath;
  self->_filePath = 0;

  id v4 = NSHomeDirectory();
  id v12 = [v4 stringByAppendingPathComponent:@"Library/Logs/CrashReporter/"];

  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  unint64_t v6 = +[NSDate date];
  unint64_t v7 = [v5 stringFromDate:v6];

  CFStringRef fileLabel = (const __CFString *)self->_fileLabel;
  if (!fileLabel) {
    CFStringRef fileLabel = @"packets";
  }
  unsigned int v9 = +[NSString stringWithFormat:@"%@-%@-%@.log.ips", self->_filenamePrefix, fileLabel, v7];
  unsigned __int8 v10 = [v12 stringByAppendingPathComponent:v9];
  uint64_t v11 = self->_filePath;
  self->_filePath = v10;
}

- (void)_flush
{
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __23__LogFileWriter__flush__block_invoke;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __23__LogFileWriter__flush__block_invoke(uint64_t a1)
{
  v3 = +[NSFileManager defaultManager];
  id v4 = *(void **)(a1 + 32);
  if (v4[3])
  {
    if (objc_msgSend(v3, "fileExistsAtPath:")) {
      goto LABEL_6;
    }
    id v4 = *(void **)(a1 + 32);
  }
  [v4 createFilePath];
  id v5 = fopen((const char *)[*(id *)(*(void *)(a1 + 32) + 24) fileSystemRepresentation], "a");
  if (v5) {
    fclose(v5);
  }
LABEL_6:
  unint64_t v6 = +[NSFileHandle fileHandleForWritingAtPath:*(void *)(*(void *)(a1 + 32) + 24)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 8);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
        objc_msgSend(v6, "seekToEndOfFile", (void)v13);
        [v6 writeData:v12];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
}

- (void)flush
{
  [(LogFileWriter *)self _flush];

  [(LogFileWriter *)self unscheduleFlush];
}

- (void)scheduleFlush
{
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __30__LogFileWriter_scheduleFlush__block_invoke;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __30__LogFileWriter_scheduleFlush__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", 3.0);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    Main = CFRunLoopGetMain();
    unint64_t v6 = *(__CFRunLoopTimer **)(*(void *)(a1 + 32) + 48);
    CFRunLoopAddTimer(Main, v6, kCFRunLoopCommonModes);
  }
}

- (void)unscheduleFlush
{
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __32__LogFileWriter_unscheduleFlush__block_invoke;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __32__LogFileWriter_unscheduleFlush__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveTimer(Main, *(CFRunLoopTimerRef *)(*(void *)(a1 + 32) + 48), kCFRunLoopCommonModes);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;
  }
}

- (void)timerFlush:(id)a3
{
  id v4 = a3;
  logQueue = self->_logQueue;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = __28__LogFileWriter_timerFlush___block_invoke;
  uint64_t v10 = &unk_100215968;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  dispatch_sync(logQueue, &v7);
  -[LogFileWriter performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", "_flush", 0, v7, v8, v9, v10);
}

uint64_t __28__LogFileWriter_timerFlush___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 48))
  {
    *(void *)(v1 + 48) = 0;
    return _objc_release_x1();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_fileLabel, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_filenamePrefix, 0);

  objc_storeStrong((id *)&self->_logData, 0);
}

@end