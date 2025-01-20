@interface SYCompressingOutputStream
- (BOOL)hasSpaceAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSProgress)progress;
- (SYCompressingOutputStream)initWithDestinationStream:(id)a3;
- (SYCompressingOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (_SYStreamGuts)_internal;
- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)initToMemory;
- (id)onBytesAvailable;
- (id)onClose;
- (id)onEndOfFile;
- (id)onError;
- (id)onOpenComplete;
- (id)onSpaceAvailable;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int)_handlePendingInput;
- (int64_t)compressionLevel;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)bytesThroughput;
- (unint64_t)inputBufferSize;
- (unint64_t)outputBufferSize;
- (unint64_t)streamStatus;
- (void)_dispatchMyEvent:(unint64_t)a3;
- (void)_postEventToDelegate:(unint64_t)a3;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setCompressionLevel:(int64_t)a3;
- (void)setInputBufferSize:(unint64_t)a3;
- (void)setOnBytesAvailable:(id)a3;
- (void)setOnClose:(id)a3;
- (void)setOnEndOfFile:(id)a3;
- (void)setOnError:(id)a3;
- (void)setOnOpenComplete:(id)a3;
- (void)setOnSpaceAvailable:(id)a3;
- (void)setOutputBufferSize:(unint64_t)a3;
- (void)setProgress:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation SYCompressingOutputStream

- (SYCompressingOutputStream)initWithDestinationStream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYCompressingOutputStream;
  v6 = [(SYCompressingOutputStream *)&v11 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    internal = v6->_internal;
    v6->_internal = (_SYZlibStreamInternal *)v7;

    objc_storeStrong((id *)&v6->_stream, a3);
    [(NSOutputStream *)v6->_stream setDelegate:v6];
    objc_storeWeak((id *)&v6->_internal->super._delegate, v6);
    v6->_level = -1;
    v9 = v6;
  }

  return v6;
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToBuffer:a3 capacity:a4];
  v6 = [(SYCompressingOutputStream *)self initWithDestinationStream:v5];

  return v6;
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [SYCompressedFileOutputStream alloc];
  v8 = [NSURL fileURLWithPath:v6];

  id v9 = [(SYCompressedFileOutputStream *)v7 initToCompressedFileAtURL:v8 shouldAppend:v4];
  return v9;
}

- (SYCompressingOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [[SYCompressedFileOutputStream alloc] initToCompressedFileAtURL:v6 shouldAppend:v4];

  return v7;
}

- (id)initToMemory
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToMemory];
  BOOL v4 = [(SYCompressingOutputStream *)self initWithDestinationStream:v3];

  return v4;
}

- (void)dealloc
{
  [(SYCompressingOutputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SYCompressingOutputStream;
  [(SYCompressingOutputStream *)&v3 dealloc];
}

- (id)streamError
{
  return self->_internal->super._error;
}

- (unint64_t)streamStatus
{
  return self->_internal->super._status;
}

- (void)setCompressionLevel:(int64_t)a3
{
  if (!self->_internal->super._status) {
    self->_level = a3;
  }
}

- (unint64_t)inputBufferSize
{
  return self->_internal->_inputSize;
}

- (void)setInputBufferSize:(unint64_t)a3
{
  internal = self->_internal;
  if (!internal->super._status) {
    internal->_inputSize = a3;
  }
}

- (unint64_t)outputBufferSize
{
  return self->_internal->_outputSize;
}

- (void)setOutputBufferSize:(unint64_t)a3
{
  internal = self->_internal;
  if (!internal->super._status) {
    internal->_outputSize = a3;
  }
}

- (void)open
{
  if (!self->_internal->super._status)
  {
    if (![(NSOutputStream *)self->_stream streamStatus]) {
      [(NSOutputStream *)self->_stream open];
    }
    self->_internal->super._status = 1;
  }
}

- (void)close
{
  internal = self->_internal;
  if (internal->super._status - 6 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    uint64_t v4 = deflateEnd(&internal->_zStream);
    if ((v4 & 0x80000000) != 0)
    {
      [(_SYZlibStreamInternal *)self->_internal setZlibError:v4 forStream:self];
      unint64_t v5 = 7;
    }
    else
    {
      unint64_t v5 = 6;
    }
    [(NSOutputStream *)self->_stream close];
    self->_internal->super._status = v5;
    id onClose = self->_onClose;
    if (onClose)
    {
      uint64_t v7 = (void (*)(void))*((void *)onClose + 2);
      v7();
    }
  }
}

- (_SYStreamGuts)_internal
{
  return (_SYStreamGuts *)self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->super._delegate);
  [WeakRetained stream:self handleEvent:a3];
}

- (int)_handlePendingInput
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  internal = self->_internal;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SYCompressingOutputStream__handlePendingInput__block_invoke;
  v5[3] = &unk_264422AD8;
  v5[4] = self;
  v5[5] = &v6;
  [(_SYZlibStreamInternal *)internal synchronized:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SYCompressingOutputStream__handlePendingInput__block_invoke(uint64_t a1)
{
  uint64_t result = deflate((z_streamp)(*(void *)(*(void *)(a1 + 32) + 144) + 72), 2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x80000000) != 0)
  {
    [*(id *)(v3 + 136) close];
    unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 144);
    uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return objc_msgSend(v5, "setZlibError:forStream:", v6);
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 144);
    if (!*(_DWORD *)(v4 + 80))
    {
      *(void *)(v4 + 72) = *(void *)(v4 + 200);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 144) + 80) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
}

- (void)_dispatchMyEvent:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v4 = 152;
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = 160;
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      uint64_t v4 = 168;
      goto LABEL_8;
    case 8uLL:
      uint64_t v4 = 184;
      goto LABEL_8;
    default:
      if (a3 != 16) {
        return;
      }
      uint64_t v4 = 176;
LABEL_8:
      uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa + v4);
      if (v5) {
        (*(void (**)(uint64_t, SYCompressingOutputStream *))(v5 + 16))(v5, self);
      }
      return;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v6 = (uint64_t)a3;
  uint64_t v7 = v6;
  if ((SYCompressingOutputStream *)v6 == self)
  {
    uint64_t v22 = v6;
    uint64_t v6 = [(id)v6 _dispatchMyEvent:a4];
LABEL_13:
    uint64_t v7 = v22;
    goto LABEL_14;
  }
  if (self->_stream != (NSOutputStream *)v6) {
    goto LABEL_14;
  }
  if ((uint64_t)a4 > 7)
  {
    if (a4 != 8)
    {
      if (a4 != 16) {
        goto LABEL_14;
      }
      goto LABEL_27;
    }
    uint64_t v22 = v6;
    uint64_t v14 = [(id)v6 streamError];
    internal = self->_internal;
    error = internal->super._error;
    internal->super._error = (NSError *)v14;

    self->_internal->super._status = 7;
    [(NSOutputStream *)self->_stream close];
    v17 = self->_internal;
    uint64_t v18 = 8;
    goto LABEL_37;
  }
  if (a4 == 1)
  {
    uint64_t v22 = v6;
    objc_super v11 = self->_internal;
    if (v11->super._status == 1)
    {
      uint64_t v12 = deflateInit2_(&v11->_zStream, self->_level, 8, 31, 8, 0, "1.2.12", 112);
      if (v12)
      {
        uint64_t v13 = v12;
        [(NSOutputStream *)self->_stream close];
        uint64_t v6 = [(_SYZlibStreamInternal *)self->_internal setZlibError:v13 forStream:self];
        goto LABEL_13;
      }
      objc_super v11 = self->_internal;
    }
    v11->super._status = 2;
    [(_SYStreamGuts *)self->_internal postStreamEvent:1 forStream:self];
    uint64_t v6 = [(_SYZlibStreamInternal *)self->_internal inputRoom];
    uint64_t v7 = v22;
    if (v6 < 1) {
      goto LABEL_14;
    }
    v17 = self->_internal;
    uint64_t v18 = 4;
LABEL_37:
    v20 = self;
LABEL_38:
    uint64_t v6 = [(_SYStreamGuts *)v17 postStreamEvent:v18 forStream:v20];
    goto LABEL_13;
  }
  if (a4 == 4)
  {
    uint64_t v21 = v6;
    if ([(_SYZlibStreamInternal *)self->_internal outputAvailable]
      || !self->_internal->_zStream.avail_in
      || (uint64_t v6 = [(SYCompressingOutputStream *)self _handlePendingInput],
          uint64_t v7 = v21,
          (v6 & 0x80000000) == 0))
    {
      while (1)
      {
        uint64_t v8 = [(_SYZlibStreamInternal *)self->_internal outputAvailable];
        int v9 = self->_internal;
        if (v8 < 1) {
          break;
        }
        [(_SYZlibStreamInternal *)v9 readOutputToStream:self->_stream];
        BOOL v10 = [(NSOutputStream *)self->_stream hasSpaceAvailable];
        int v9 = self->_internal;
        if (!v10 || !v9->_zStream.avail_in) {
          break;
        }
        uint64_t v6 = [(SYCompressingOutputStream *)self _handlePendingInput];
        uint64_t v7 = v21;
        if ((v6 & 0x80000000) != 0) {
          goto LABEL_14;
        }
      }
      uint64_t v6 = [(_SYZlibStreamInternal *)v9 inputRoom];
      if (v6 >= 1) {
        uint64_t v6 = [(_SYStreamGuts *)self->_internal postStreamEvent:4 forStream:self];
      }
      uint64_t v7 = v21;
LABEL_27:
      v19 = self->_internal;
      if (v19->super._status == 5 || v19->_zStream.total_out || v19->_zStream.avail_in) {
        goto LABEL_14;
      }
      v19->super._status = 5;
      v17 = self->_internal;
      uint64_t v18 = 16;
      v20 = self;
      uint64_t v22 = v7;
      goto LABEL_38;
    }
  }
LABEL_14:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (__CFString *)a4;
  [(NSOutputStream *)self->_stream scheduleInRunLoop:v11 forMode:v6];
  internal = self->_internal;
  if (!internal->super._runloopSource) {
    [(_SYStreamGuts *)internal createRunloopSourceForStream:self];
  }
  uint64_t v8 = (__CFRunLoop *)[v11 getCFRunLoop];
  runloopSource = self->_internal->super._runloopSource;
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
  id v10 = a3;
  uint64_t v6 = (__CFString *)a4;
  [(NSOutputStream *)self->_stream removeFromRunLoop:v10 forMode:v6];
  if (self->_internal->super._runloopSource)
  {
    uint64_t v7 = (__CFRunLoop *)[v10 getCFRunLoop];
    runloopSource = self->_internal->super._runloopSource;
    if ([(__CFString *)v6 isEqualToString:*MEMORY[0x263EFF478]]) {
      CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE88];
    }
    else {
      CFStringRef v9 = v6;
    }
    CFRunLoopRemoveSource(v7, runloopSource, v9);
  }
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  if (![(_SYZlibStreamInternal *)self->_internal inputRoom]) {
    return 0;
  }
  internal = self->_internal;
  if (internal->super._status != 2) {
    return 0;
  }
  internal->super._status = 4;
  int64_t v8 = [(_SYZlibStreamInternal *)self->_internal writeInputFromBuffer:a3 length:a4];
  self->_internal->super._status = 2;
  if ([(NSOutputStream *)self->_stream hasSpaceAvailable]) {
    [(SYCompressingOutputStream *)self stream:self->_stream handleEvent:4];
  }
  if (v8 >= 1)
  {
    self->_byteCount += v8;
    progress = self->_progress;
    if (progress) {
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
    }
  }
  return v8;
}

- (BOOL)hasSpaceAvailable
{
  return [(_SYZlibStreamInternal *)self->_internal inputRoom] > 0;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSOutputStream *)self->_stream propertyForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [(_SYStreamGuts *)self->_internal propertyForKey:v4];
  }

  return v5;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(NSOutputStream *)self->_stream setProperty:v6 forKey:v7] & 1) == 0) {
    [(_SYStreamGuts *)self->_internal storeProperty:v6 forKey:v7];
  }

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

- (int64_t)compressionLevel
{
  return self->_level;
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
  objc_storeStrong((id *)&self->_stream, 0);
}

@end