@interface OSLogEventBacktrace
- (NSArray)frames;
- (OSLogEventBacktrace)initWithBacktrace:(os_log_backtrace_s *)a3;
- (OSLogEventBacktrace)initWithFrames:(id)a3;
- (OSLogEventBacktrace)initWithSingleFrame:(id)a3;
- (void)dealloc;
@end

@implementation OSLogEventBacktrace

- (NSArray)frames
{
  return self->_frames;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OSLogEventBacktrace;
  [(OSLogEventBacktrace *)&v3 dealloc];
}

- (OSLogEventBacktrace)initWithSingleFrame:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSLogEventBacktrace;
  v4 = [(OSLogEventBacktrace *)&v6 init];
  if (v4) {
    v4->_frames = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a3, 0);
  }
  return v4;
}

- (OSLogEventBacktrace)initWithFrames:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSLogEventBacktrace;
  v4 = [(OSLogEventBacktrace *)&v6 init];
  if (v4) {
    v4->_frames = (NSArray *)a3;
  }
  return v4;
}

- (OSLogEventBacktrace)initWithBacktrace:(os_log_backtrace_s *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OSLogEventBacktrace;
  objc_super v3 = [(OSLogEventBacktrace *)&v8 init];
  if (v3)
  {
    LODWORD(v4) = os_log_backtrace_get_length();
    uint64_t frames = os_log_backtrace_get_frames();
    objc_super v6 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(int)v4];
    if ((int)v4 >= 1)
    {
      uint64_t v4 = v4;
      do
      {
        [(NSArray *)v6 addObject:[[OSLogEventBacktraceFrame alloc] initWithUUIDBytes:frames andOffset:*(unsigned int *)(frames + 16)]];
        frames += 20;
        --v4;
      }
      while (v4);
    }
    v3->_uint64_t frames = v6;
  }
  return v3;
}

@end