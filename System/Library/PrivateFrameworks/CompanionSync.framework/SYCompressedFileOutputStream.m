@interface SYCompressedFileOutputStream
- (BOOL)hasSpaceAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSProgress)progress;
- (SYCompressedFileOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (_SYStreamGuts)_internal;
- (id)delegate;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)onBytesAvailable;
- (id)onClose;
- (id)onEndOfFile;
- (id)onError;
- (id)onOpenComplete;
- (id)onSpaceAvailable;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)compressionLevel;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)bytesThroughput;
- (unint64_t)streamStatus;
- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4;
- (void)_postEventToDelegate:(unint64_t)a3;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setCompressionLevel:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setOnBytesAvailable:(id)a3;
- (void)setOnClose:(id)a3;
- (void)setOnEndOfFile:(id)a3;
- (void)setOnError:(id)a3;
- (void)setOnOpenComplete:(id)a3;
- (void)setOnSpaceAvailable:(id)a3;
- (void)setProgress:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation SYCompressedFileOutputStream

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSURL;
  v7 = [a3 stringByStandardizingPath];
  v8 = [v6 fileURLWithPath:v7];
  v9 = [(SYCompressedFileOutputStream *)self initWithURL:v8 append:v4];

  return v9;
}

- (SYCompressedFileOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYCompressedFileOutputStream;
  v7 = [(SYCompressedFileOutputStream *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_fd = -1;
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v8->_append = a4;
    v8->_level = -1;
    v8->_internalLock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v8->_internalLock);
    uint64_t v11 = objc_opt_new();
    internal = v8->_internal;
    v8->_internal = (_SYStreamGuts *)v11;

    objc_storeWeak((id *)&v8->_internal->_delegate, v8);
    os_unfair_lock_unlock(&v8->_internalLock);
    v13 = v8;
  }

  return v8;
}

- (void)dealloc
{
  [(SYCompressedFileOutputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SYCompressedFileOutputStream;
  [(SYCompressedFileOutputStream *)&v3 dealloc];
}

- (_SYStreamGuts)_internal
{
  return self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  [WeakRetained stream:self handleEvent:a3];

  os_unfair_lock_unlock(p_internalLock);
}

- (id)delegate
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  os_unfair_lock_unlock(p_internalLock);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  BOOL v4 = (SYCompressedFileOutputStream *)a3;
  if (!v4) {
    BOOL v4 = self;
  }
  obj = v4;
  os_unfair_lock_lock(&self->_internalLock);
  objc_storeWeak((id *)&self->_internal->_delegate, obj);
  os_unfair_lock_unlock(&self->_internalLock);
}

- (id)streamError
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  BOOL v4 = self->_internal->_error;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (unint64_t)streamStatus
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  unint64_t status = self->_internal->_status;
  os_unfair_lock_unlock(p_internalLock);
  return status;
}

- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4
{
  p_internalLock = &self->_internalLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_internalLock);
  [(_SYStreamGuts *)self->_internal setEventHandler:v7 queue:v8];

  os_unfair_lock_unlock(p_internalLock);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v12 = a3;
  id v6 = (__CFString *)a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  internal = self->_internal;
  if (!internal->_runloopSource) {
    [(_SYStreamGuts *)internal createRunloopSourceForStream:self];
  }
  uint64_t v9 = (__CFRunLoop *)[v12 getCFRunLoop];
  runloopSource = self->_internal->_runloopSource;
  if ([(__CFString *)v6 isEqualToString:*MEMORY[0x263EFF478]]) {
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE88];
  }
  else {
    CFStringRef v11 = v6;
  }
  CFRunLoopAddSource(v9, runloopSource, v11);
  os_unfair_lock_unlock(p_internalLock);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  id v11 = a3;
  id v6 = (__CFString *)a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  if (self->_internal->_runloopSource)
  {
    id v8 = (__CFRunLoop *)[v11 getCFRunLoop];
    runloopSource = self->_internal->_runloopSource;
    if ([(__CFString *)v6 isEqualToString:*MEMORY[0x263EFF478]]) {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE88];
    }
    else {
      CFStringRef v10 = v6;
    }
    CFRunLoopRemoveSource(v8, runloopSource, v10);
    os_unfair_lock_unlock(p_internalLock);
  }
}

- (void)open
{
  if ([(SYCompressedFileOutputStream *)self streamStatus]) {
    return;
  }
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  if (self->_append) {
    BOOL v4 = @"a";
  }
  else {
    BOOL v4 = @"w";
  }
  v5 = (void *)[v3 initWithString:v4];
  int64_t level = self->_level;
  id v22 = v5;
  if (level != -1) {
    objc_msgSend(v5, "appendFormat:", @"%ld", level);
  }
  id v7 = [(NSURL *)self->_url filePathURL];
  id v8 = [v7 absoluteURL];
  uint64_t v9 = (const char *)[v8 fileSystemRepresentation];

  if (self->_append) {
    int v10 = 522;
  }
  else {
    int v10 = 514;
  }
  int v11 = self->_class;
  if (v11)
  {
    self->_int fd = open_dprotected_np(v9, v10, v11, 0, 436);
  }
  else
  {
    id v12 = [(NSURL *)self->_url filePathURL];
    id v13 = [v12 absoluteURL];
    self->_int fd = open((const char *)[v13 fileSystemRepresentation], v10, 436);
  }
  os_unfair_lock_lock(&self->_internalLock);
  int fd = self->_fd;
  if (fd == -1)
  {
    p_internal = &self->_internal;
    internal = self->_internal;
    goto LABEL_17;
  }
  objc_super v15 = gzdopen(fd, (const char *)[v22 UTF8String]);
  self->_file = v15;
  p_internal = &self->_internal;
  internal = self->_internal;
  if (!v15)
  {
LABEL_17:
    internal->_unint64_t status = 7;
    id v19 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = [v19 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    error = (*p_internal)->_error;
    (*p_internal)->_error = (NSError *)v20;

    uint64_t v18 = 8;
    goto LABEL_18;
  }
  internal->_unint64_t status = 2;
  [(_SYStreamGuts *)*p_internal postStreamEvent:1 forStream:self];
  uint64_t v18 = 4;
LABEL_18:
  [(_SYStreamGuts *)*p_internal postStreamEvent:v18 forStream:self];
  os_unfair_lock_unlock(&self->_internalLock);
}

- (void)close
{
  v2 = self;
  objc_sync_enter(v2);
  file = v2->_file;
  if (file)
  {
    gzclose(v2->_file);
    v2->_int fd = -1;
    v2->_file = 0;
    os_unfair_lock_lock(&v2->_internalLock);
    v2->_internal->_unint64_t status = 6;
    os_unfair_lock_unlock(&v2->_internalLock);
    uint64_t v7 = MEMORY[0x21D4B17C0](v2->_onClose);
    id onClose = v2->_onClose;
    v2->_id onClose = 0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_sync_exit(v2);

  v5 = (void *)v7;
  if (file) {
    BOOL v6 = v7 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    (*(void (**)(uint64_t, SYCompressedFileOutputStream *))(v7 + 16))(v7, v2);
    v5 = (void *)v7;
  }
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  unsigned int v4 = a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  internal = self->_internal;
  if (internal->_status == 2)
  {
    internal->_unint64_t status = 4;
    int v9 = gzwrite(self->_file, a3, v4);
    self->_internal->_unint64_t status = 2;
    if (v9)
    {
      int v10 = v9;
      if ([(SYCompressedFileOutputStream *)self hasSpaceAvailable]) {
        [(_SYStreamGuts *)self->_internal postStreamEvent:4 forStream:self];
      }
      if (v10 >= 1)
      {
        self->_byteCount += v10;
        progress = self->_progress;
        if (progress) {
          -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
        }
      }
      int64_t v12 = v10;
    }
    else
    {
      uint64_t v13 = CreateGzfileError(self->_file);
      v14 = self->_internal;
      error = v14->_error;
      v14->_error = (NSError *)v13;

      self->_internal->_unint64_t status = 7;
      [(_SYStreamGuts *)self->_internal postStreamEvent:8 forStream:self];
      int64_t v12 = -1;
    }
  }
  else
  {
    int64_t v12 = 0;
  }
  os_unfair_lock_unlock(p_internalLock);
  return v12;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"protection-class"])
  {
    int v15 = -1;
    int fd = self->_fd;
    if (fd == -1)
    {
      int v9 = [(NSURL *)self->_url filePathURL];
      id v10 = [v9 absoluteURL];
      int v11 = (const char *)[v10 fileSystemRepresentation];

      uint64_t v16 = 0;
      v17[1] = 0;
      v17[2] = 0;
      v17[0] = 0x4000000000000005;
      int v12 = getattrlist(v11, v17, &v16, 8uLL, 1u);
      int v6 = HIDWORD(v16);
      if (v12) {
        int v6 = -1;
      }
      int v15 = v6;
    }
    else
    {
      fcntl(fd, 63, &v15);
      int v6 = v15;
    }
    unsigned int v13 = v6 - 1;
    if (v13 > 3) {
      id v8 = 0;
    }
    else {
      id v8 = **((id **)&unk_264422B20 + (int)v13);
    }
  }
  else
  {
    p_internalLock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    id v8 = [(_SYStreamGuts *)self->_internal propertyForKey:v4];
    os_unfair_lock_unlock(p_internalLock);
  }

  return v8;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v7 isEqualToString:@"protection-class"])
  {
    os_unfair_lock_lock(&self->_internalLock);
    [(_SYStreamGuts *)self->_internal storeProperty:v6 forKey:v7];
    os_unfair_lock_unlock(&self->_internalLock);
LABEL_7:
    BOOL v9 = 1;
    goto LABEL_9;
  }
  if (![v6 isNSString])
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  if (self->_fd == -1)
  {
    int v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v15 = *MEMORY[0x263F080A8];
    v16[0] = v6;
    BOOL v9 = 1;
    int v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    unsigned int v13 = [(NSURL *)self->_url path];
    char v14 = [v11 setAttributes:v12 ofItemAtPath:v13 error:0];

    if (v14) {
      goto LABEL_9;
    }
    self->_class = _SYProtectionClassFromString(v6);
    goto LABEL_7;
  }
  uint64_t v8 = _SYProtectionClassFromString(v6);
  if (!v8) {
    goto LABEL_8;
  }
  BOOL v9 = fcntl(self->_fd, 64, v8) == 0;
LABEL_9:

  return v9;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = (SYCompressedFileOutputStream *)a3;
  id v7 = v6;
  if (v6 == self)
  {
    switch(a4)
    {
      case 1uLL:
        uint64_t v8 = 192;
        goto LABEL_11;
      case 2uLL:
        uint64_t v8 = 200;
        goto LABEL_11;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        uint64_t v8 = 208;
        goto LABEL_11;
      case 8uLL:
        uint64_t v8 = 224;
        goto LABEL_11;
      default:
        if (a4 != 16) {
          break;
        }
        uint64_t v8 = 216;
LABEL_11:
        uint64_t v9 = *(uint64_t *)((char *)&v6->super.super.super.isa + v8);
        if (v9) {
          (*(void (**)(uint64_t, SYCompressedFileOutputStream *))(v9 + 16))(v9, v7);
        }
        break;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[SYCompressedFileInputStream stream:handleEvent:]();
  }
}

- (id)onOpenComplete
{
  return self->_onOpenComplete;
}

- (void)setOnOpenComplete:(id)a3
{
}

- (id)onBytesAvailable
{
  return self->_onBytesAvailable;
}

- (void)setOnBytesAvailable:(id)a3
{
}

- (id)onSpaceAvailable
{
  return self->_onSpaceAvailable;
}

- (void)setOnSpaceAvailable:(id)a3
{
}

- (id)onEndOfFile
{
  return self->_onEndOfFile;
}

- (void)setOnEndOfFile:(id)a3
{
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (unint64_t)bytesThroughput
{
  return self->_byteCount;
}

- (int64_t)compressionLevel
{
  return self->_level;
}

- (void)setCompressionLevel:(int64_t)a3
{
  self->_int64_t level = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_onClose, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onEndOfFile, 0);
  objc_storeStrong(&self->_onSpaceAvailable, 0);
  objc_storeStrong(&self->_onBytesAvailable, 0);
  objc_storeStrong(&self->_onOpenComplete, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end