@interface SYCompressedFileInputStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSProgress)progress;
- (SYCompressedFileInputStream)initWithData:(id)a3;
- (SYCompressedFileInputStream)initWithFileAtPath:(id)a3;
- (SYCompressedFileInputStream)initWithURL:(id)a3;
- (_SYStreamGuts)_internal;
- (id)delegate;
- (id)onBytesAvailable;
- (id)onClose;
- (id)onEndOfFile;
- (id)onError;
- (id)onOpenComplete;
- (id)onSpaceAvailable;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)bytesThroughput;
- (unint64_t)streamStatus;
- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4;
- (void)_postEventToDelegate:(unint64_t)a3;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
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

@implementation SYCompressedFileInputStream

- (SYCompressedFileInputStream)initWithData:(id)a3
{
  return 0;
}

- (SYCompressedFileInputStream)initWithFileAtPath:(id)a3
{
  v4 = [NSURL fileURLWithPath:a3];
  v5 = [(SYCompressedFileInputStream *)self initWithURL:v4];

  return v5;
}

- (SYCompressedFileInputStream)initWithURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYCompressedFileInputStream;
  v5 = [(SYCompressedFileInputStream *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = objc_opt_new();
    internal = v5->_internal;
    v5->_internal = (_SYStreamGuts *)v8;

    objc_storeWeak((id *)&v5->_internal->_delegate, v5);
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(SYCompressedFileInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SYCompressedFileInputStream;
  [(SYCompressedFileInputStream *)&v3 dealloc];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = (SYCompressedFileInputStream *)a3;
  if (!v4) {
    id v4 = self;
  }
  v5 = v4;
  objc_storeWeak((id *)&self->_internal->_delegate, v4);
}

- (id)streamError
{
  return self->_internal->_error;
}

- (unint64_t)streamStatus
{
  return self->_internal->_status;
}

- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4
{
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (__CFString *)a4;
  internal = self->_internal;
  if (!internal->_runloopSource) {
    [(_SYStreamGuts *)internal createRunloopSourceForStream:self];
  }
  uint64_t v8 = (__CFRunLoop *)[v11 getCFRunLoop];
  runloopSource = self->_internal->_runloopSource;
  if ([(__CFString *)v6 isEqualToString:*MEMORY[0x263EFF478]]) {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE88];
  }
  else {
    CFStringRef v10 = v6;
  }
  CFRunLoopAddSource(v8, runloopSource, v10);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  v9 = (__CFString *)a4;
  if (self->_internal->_runloopSource)
  {
    uint64_t v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    runloopSource = self->_internal->_runloopSource;
    if ([(__CFString *)v9 isEqualToString:*MEMORY[0x263EFF478]]) {
      CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE88];
    }
    else {
      CFStringRef v8 = v9;
    }
    CFRunLoopRemoveSource(v6, runloopSource, v8);
  }
}

- (_SYStreamGuts)_internal
{
  return self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  [WeakRetained stream:self handleEvent:a3];
}

- (void)open
{
  if (self->_internal->_status) {
    return;
  }
  objc_super v3 = [(NSURL *)self->_url filePathURL];
  id v4 = [v3 absoluteURL];
  self->_file = gzopen((const char *)[v4 fileSystemRepresentation], "r");

  internal = self->_internal;
  if (self->_file)
  {
    internal->_status = 2;
    [(_SYStreamGuts *)self->_internal postStreamEvent:1 forStream:self];
    file = self->_file;
    if (file->have)
    {
      --file->have;
      next = file->next;
      uint64_t v8 = file->pos + 1;
      file->next = next + 1;
      file->pos = v8;
      int v9 = *next;
    }
    else
    {
      int v9 = gzgetc(file);
      if (v9 == -1)
      {
        if (gzeof(self->_file))
        {
          uint64_t v14 = 16;
          goto LABEL_8;
        }
        int v9 = -1;
      }
    }
    gzungetc(v9, self->_file);
    uint64_t v14 = 2;
  }
  else
  {
    internal->_status = 7;
    id v10 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v11 = [v10 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    objc_super v12 = self->_internal;
    error = v12->_error;
    v12->_error = (NSError *)v11;

    uint64_t v14 = 8;
  }
LABEL_8:
  v15 = self->_internal;
  [(_SYStreamGuts *)v15 postStreamEvent:v14 forStream:self];
}

- (void)close
{
  v2 = self;
  objc_sync_enter(v2);
  file = v2->_file;
  if (file)
  {
    gzclose(v2->_file);
    v2->_file = 0;
    v2->_internal->_status = 6;
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
    (*(void (**)(uint64_t, SYCompressedFileInputStream *))(v7 + 16))(v7, v2);
    v5 = (void *)v7;
  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unsigned int v4 = a4;
  BOOL v6 = self;
  objc_sync_enter(v6);
  internal = v6->_internal;
  if (internal->_status != 2)
  {
    int64_t v9 = 0;
    goto LABEL_14;
  }
  internal->_status = 3;
  int v8 = gzread(v6->_file, a3, v4);
  LODWORD(v9) = v8;
  v6->_internal->_status = 2;
  if (!v8) {
    goto LABEL_7;
  }
  if (v8 == -1)
  {
    uint64_t v10 = CreateGzfileError(v6->_file);
    uint64_t v11 = v6->_internal;
    error = v11->_error;
    v11->_error = (NSError *)v10;

    v6->_internal->_status = 7;
    [(_SYStreamGuts *)v6->_internal postStreamEvent:8 forStream:v6];
    int64_t v9 = -1;
    goto LABEL_14;
  }
  if (gzeof(v6->_file) == 1)
  {
LABEL_7:
    v6->_internal->_status = 5;
    [(_SYStreamGuts *)v6->_internal postStreamEvent:16 forStream:v6];
  }
  if ((int)v9 >= 1)
  {
    v6->_byteCount += v9;
    progress = v6->_progress;
    if (progress) {
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
    }
  }
  if ([(SYCompressedFileInputStream *)v6 hasBytesAvailable]) {
    [(_SYStreamGuts *)v6->_internal postStreamEvent:2 forStream:v6];
  }
  int64_t v9 = (int)v9;
LABEL_14:
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_internal->_status != 2 || gzeof(v2->_file) == 1) {
    goto LABEL_3;
  }
  file = v2->_file;
  if (file->have)
  {
    --file->have;
    next = file->next;
    uint64_t v6 = file->pos + 1;
    file->next = next + 1;
    file->pos = v6;
    int v7 = *next;
LABEL_7:
    gzungetc(v7, v2->_file);
    BOOL v3 = 1;
    goto LABEL_8;
  }
  int v7 = gzgetc(file);
  if (v7 != -1) {
    goto LABEL_7;
  }
LABEL_3:
  BOOL v3 = 0;
LABEL_8:
  objc_sync_exit(v2);

  return v3;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v6 = (SYCompressedFileInputStream *)a3;
  int v7 = v6;
  if (v6 == self)
  {
    switch(a4)
    {
      case 1uLL:
        uint64_t v8 = 160;
        goto LABEL_11;
      case 2uLL:
        uint64_t v8 = 168;
        goto LABEL_11;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        uint64_t v8 = 176;
        goto LABEL_11;
      case 8uLL:
        uint64_t v8 = 192;
        goto LABEL_11;
      default:
        if (a4 != 16) {
          break;
        }
        uint64_t v8 = 184;
LABEL_11:
        uint64_t v9 = *(uint64_t *)((char *)&v6->super.super.super.isa + v8);
        if (v9) {
          (*(void (**)(uint64_t, SYCompressedFileInputStream *))(v9 + 16))(v9, v7);
        }
        break;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[SYCompressedFileInputStream stream:handleEvent:]();
  }
}

- (id)propertyForKey:(id)a3
{
  return [(_SYStreamGuts *)self->_internal propertyForKey:a3];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 1;
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

- (void)stream:handleEvent:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_21C7C9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown stream %{public}@ is sending me (%{public}@) delegate messages...", v0, 0x16u);
}

@end