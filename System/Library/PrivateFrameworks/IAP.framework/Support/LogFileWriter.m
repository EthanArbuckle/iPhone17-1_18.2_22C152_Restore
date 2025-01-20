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
- (void)logRawData:(id)a3;
- (void)scheduleFlush;
- (void)timerFlush:(id)a3;
- (void)unscheduleFlush;
@end

@implementation LogFileWriter

- (id)initFor:(id)a3 fileLabel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)LogFileWriter;
  v6 = [(LogFileWriter *)&v8 init];
  if (!v6) {
    return v6;
  }
  id result = objc_alloc_init((Class)NSMutableArray);
  if ((((_BYTE)v6 + 8) & 7) == 0)
  {
    v6->_logData = (NSMutableArray *)result;
    id result = dispatch_queue_create("com.apple.iapLogWriter", 0);
    if ((((_BYTE)v6 + 56) & 7) == 0)
    {
      v6->_logQueue = (OS_dispatch_queue *)result;
      if ((((_BYTE)v6 + 16) & 7) == 0)
      {
        v6->_filenamePrefix = (NSString *)a3;
        if (((unint64_t)&v6->_fileLabel & 7) == 0)
        {
          v6->_fileLabel = (NSString *)a4;
          return v6;
        }
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (id)initFor:(id)a3
{
  return [(LogFileWriter *)self initFor:a3 fileLabel:0];
}

- (void)dealloc
{
  [(LogFileWriter *)self unscheduleFlush];
  if ((((_BYTE)self + 16) & 7) != 0
    || (self->_filenamePrefix = 0, (((_BYTE)self + 24) & 7) != 0)
    || (self->_filePath = 0, (((_BYTE)self + 48) & 7) != 0)
    || (self->_flushTimer = 0, (((_BYTE)self + 8) & 7) != 0)
    || (self->_logData = 0, (((_BYTE)self + 32) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    self->_fileLabel = 0;
    v3.receiver = self;
    v3.super_class = (Class)LogFileWriter;
    [(LogFileWriter *)&v3 dealloc];
  }
}

- (void)logRawData:(id)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }
  v5 = *p_logQueue;
  if (!*p_logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EFE7C;
  block[3] = &unk_100124648;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(v5, block);
  if (*((unsigned __int8 *)v8 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }
  if (*((unsigned char *)v8 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }
  _Block_object_dispose(&v7, 8);
}

- (BOOL)_log:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  if (!v4)
  {
    NSLog(@"ERROR!!!: _log: dataUsingEncoding returned nil!");
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  id v5 = v4;
  id v6 = [v4 length];
  p_logDataSize = &self->_logDataSize;
  if (((unint64_t)&self->_logDataSize & 7) != 0) {
    goto LABEL_7;
  }
  if (__CFADD__(*p_logDataSize, v6))
  {
LABEL_8:
    __break(0x5500u);
    return (char)v6;
  }
  self->_logDataSize = (unint64_t)v6 + *p_logDataSize;
  if (((unint64_t)&self->_logData & 7) != 0)
  {
LABEL_7:
    __break(0x5516u);
    goto LABEL_8;
  }
  [(NSMutableArray *)self->_logData addObject:v5];
  LOBYTE(v6) = *p_logDataSize >> 10 > 4;
  return (char)v6;
}

- (void)log:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ"];
  id v6 = objc_msgSend(v5, "stringFromDate:", +[NSDate date](NSDate, "date"));

  uint64_t v7 = +[NSString stringWithFormat:@"%@ %@\n", v6, a3];
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }
  logQueue = self->_logQueue;
  if (!logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0120;
  block[3] = &unk_1001244C8;
  block[5] = v7;
  block[6] = &v10;
  block[4] = self;
  dispatch_sync(logQueue, block);
  if (*((unsigned __int8 *)v11 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }
  if (*((unsigned char *)v11 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }
  _Block_object_dispose(&v10, 8);
}

- (void)log:(id)a3 data:(id)a4
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ"];
  id v8 = objc_msgSend(v7, "stringFromDate:", +[NSDate date](NSDate, "date"));

  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }
  uint64_t v10 = *p_logQueue;
  if (!*p_logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F02B8;
  block[3] = &unk_10012A368;
  block[4] = v8;
  block[5] = a3;
  void block[7] = a4;
  block[8] = &v12;
  block[6] = self;
  dispatch_sync(v10, block);
  if (*((unsigned __int8 *)v13 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }
  if (*((unsigned char *)v13 + 24)) {
    [(LogFileWriter *)self flush];
  }
  else {
    [(LogFileWriter *)self scheduleFlush];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)createFilePath
{
  p_filePath = &self->_filePath;
  if (((unint64_t)&self->_filePath & 7) != 0
    || (self->_filePath,
        id v4 = -[NSString stringByAppendingPathComponent:](NSHomeDirectory(), "stringByAppendingPathComponent:", @"Library/Logs/CrashReporter/"), v5 = objc_alloc_init((Class)NSDateFormatter), [v5 setDateFormat:@"yyyy-MM-dd-HHmmss"], v6 = objc_msgSend(v5, "stringFromDate:", +[NSDate date](NSDate, "date")), ((unint64_t)&self->_filenamePrefix & 7) != 0)|| ((unint64_t)&self->_fileLabel & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    CFStringRef fileLabel = (const __CFString *)self->_fileLabel;
    if (!fileLabel) {
      CFStringRef fileLabel = @"packets";
    }
    *p_filePath = [(NSString *)v4 stringByAppendingPathComponent:+[NSString stringWithFormat:@"%@-%@-%@.log.ips", self->_filenamePrefix, fileLabel, v6]];

    id v8 = *p_filePath;
    uint64_t v9 = v8;
  }
}

- (void)_flush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    logQueue = self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F057C;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)flush
{
  [(LogFileWriter *)self _flush];
  [(LogFileWriter *)self unscheduleFlush];
}

- (void)scheduleFlush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    logQueue = self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F0824;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)unscheduleFlush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    logQueue = self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F0964;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)timerFlush:(id)a3
{
  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = *p_logQueue;
    if (*p_logQueue)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000F0A9C;
      v6[3] = &unk_100124568;
      v6[4] = a3;
      v6[5] = self;
      dispatch_sync(v5, v6);
      [(LogFileWriter *)self performSelectorInBackground:"_flush" withObject:0];
      return;
    }
  }
  __break(0x5510u);
}

@end