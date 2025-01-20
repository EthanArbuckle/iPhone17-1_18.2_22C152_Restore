@interface BKOSLogTranscriptTarget
- (BKOSLogTranscriptTarget)initWithOSLog:(id)a3;
- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5;
- (void)writeString:(id)a3;
@end

@implementation BKOSLogTranscriptTarget

- (void).cxx_destruct
{
}

- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  CFStringRef v9 = CFStringCreateWithFormatAndArguments(0, 0, (CFStringRef)a4, a5);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2114;
    CFStringRef v14 = v9;
    _os_log_impl(&dword_1CFDE2000, log, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v11, 0x16u);
  }
  CFRelease(v9);
}

- (void)writeString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1CFDE2000, log, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (BKOSLogTranscriptTarget)initWithOSLog:(id)a3
{
  id v5 = a3;
  int v6 = [(BKOSLogTranscriptTarget *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_log, a3);
  }

  return v7;
}

@end