@interface SYDecompressingInputStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSProgress)progress;
- (SYDecompressingInputStream)initWithCompressedDataStream:(id)a3;
- (SYDecompressingInputStream)initWithData:(id)a3;
- (SYDecompressingInputStream)initWithFileAtPath:(id)a3;
- (SYDecompressingInputStream)initWithURL:(id)a3;
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
- (unint64_t)inputBufferSize;
- (unint64_t)outputBufferSize;
- (unint64_t)streamStatus;
- (void)_dispatchMyEvent:(unint64_t)a3;
- (void)_handlePendingInput;
- (void)_postEventToDelegate:(unint64_t)a3;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
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

@implementation SYDecompressingInputStream

- (SYDecompressingInputStream)initWithCompressedDataStream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYDecompressingInputStream;
  v6 = [(SYDecompressingInputStream *)&v11 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    internal = v6->_internal;
    v6->_internal = (_SYZlibStreamInternal *)v7;

    objc_storeStrong((id *)&v6->_stream, a3);
    v6->_internal->super._status = 0;
    [v5 setDelegate:v6];
    [(SYDecompressingInputStream *)v6 setDelegate:v6];
    v9 = v6;
  }

  return v6;
}

- (SYDecompressingInputStream)initWithData:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF950];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  uint64_t v7 = [(SYDecompressingInputStream *)self initWithCompressedDataStream:v6];
  return v7;
}

- (SYDecompressingInputStream)initWithURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL])
  {
    id v5 = [[SYCompressedFileInputStream alloc] initWithCompressedFileAtURL:v4];
  }
  else
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF950]) initWithURL:v4];

    if (!v6)
    {
      uint64_t v7 = 0;
      id v4 = 0;
      goto LABEL_7;
    }
    id v5 = [(SYDecompressingInputStream *)self initWithCompressedDataStream:v6];
    self = (SYDecompressingInputStream *)v5;
    id v4 = (id)v6;
  }
  uint64_t v7 = (SYDecompressingInputStream *)v5;
LABEL_7:

  return v7;
}

- (SYDecompressingInputStream)initWithFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [SYCompressedFileInputStream alloc];
  uint64_t v6 = [NSURL fileURLWithPath:v4];

  uint64_t v7 = [(SYCompressedFileInputStream *)v5 initWithCompressedFileAtURL:v6];
  return v7;
}

- (void)dealloc
{
  [(SYDecompressingInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SYDecompressingInputStream;
  [(SYDecompressingInputStream *)&v3 dealloc];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal->super._delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = (SYDecompressingInputStream *)a3;
  if (!v4) {
    id v4 = self;
  }
  id v5 = v4;
  objc_storeWeak((id *)&self->_internal->super._delegate, v4);
}

- (id)streamError
{
  return self->_internal->super._error;
}

- (unint64_t)streamStatus
{
  return self->_internal->super._status;
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
  internal = self->_internal;
  if (!internal->super._status)
  {
    internal->super._status = 1;
    if (![(NSInputStream *)self->_stream streamStatus])
    {
      stream = self->_stream;
      [(NSInputStream *)stream open];
    }
  }
}

- (void)close
{
  internal = self->_internal;
  unint64_t status = internal->super._status;
  if (status) {
    BOOL v4 = status == 6;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v6 = inflateEnd(&internal->_zStream);
    if ((v6 & 0x80000000) != 0)
    {
      [(_SYZlibStreamInternal *)self->_internal setZlibError:v6 forStream:self];
      unint64_t v7 = 7;
    }
    else
    {
      unint64_t v7 = 6;
    }
    [(NSInputStream *)self->_stream close];
    self->_internal->super._unint64_t status = v7;
    id onClose = self->_onClose;
    if (onClose)
    {
      v9 = (void (*)(void))*((void *)onClose + 2);
      v9();
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
        (*(void (**)(uint64_t, SYDecompressingInputStream *))(v5 + 16))(v5, self);
      }
      return;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v6 = (SYDecompressingInputStream *)a3;
  unint64_t v7 = v6;
  if (v6 == self)
  {
    [(SYDecompressingInputStream *)v6 _dispatchMyEvent:a4];
  }
  else if ((SYDecompressingInputStream *)self->_stream == v6)
  {
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        uint64_t v17 = [(SYDecompressingInputStream *)v6 streamError];
        internal = self->_internal;
        error = internal->super._error;
        internal->super._error = (NSError *)v17;

        self->_internal->super._unint64_t status = 7;
        [(NSInputStream *)self->_stream close];
        objc_super v11 = self->_internal;
        uint64_t v12 = 8;
        goto LABEL_24;
      }
      if (a4 == 16)
      {
        v13 = self->_internal;
        if (v13->super._status != 5 && !v13->_zStream.total_out && !v13->_zStream.avail_in)
        {
          v13->super._unint64_t status = 5;
          objc_super v11 = self->_internal;
          uint64_t v12 = 16;
          goto LABEL_24;
        }
      }
    }
    else
    {
      if (a4 == 1)
      {
        v14 = self->_internal;
        if (v14->super._status == 1)
        {
          uint64_t v15 = inflateInit2_(&v14->_zStream, 47, "1.2.12", 112);
          if (v15)
          {
            uint64_t v16 = v15;
            [(NSInputStream *)self->_stream close];
            [(_SYZlibStreamInternal *)self->_internal setZlibError:v16 forStream:self];
            goto LABEL_11;
          }
          v14 = self->_internal;
        }
        v14->super._unint64_t status = 2;
        objc_super v11 = self->_internal;
        uint64_t v12 = 1;
        goto LABEL_24;
      }
      if (a4 == 2)
      {
        if ([(_SYZlibStreamInternal *)self->_internal inputRoom])
        {
          int64_t v8 = [(_SYZlibStreamInternal *)self->_internal writeInputFromStream:self->_stream];
          v9 = self->_internal;
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __49__SYDecompressingInputStream_stream_handleEvent___block_invoke;
          v20[3] = &unk_264422A88;
          v20[4] = self;
          v20[5] = v8;
          [(_SYZlibStreamInternal *)v9 synchronized:v20];
          v10 = self->_internal;
          if (v10->super._status != 7 && [(_SYZlibStreamInternal *)v10 outputAvailable] >= 1)
          {
            objc_super v11 = self->_internal;
            uint64_t v12 = 2;
LABEL_24:
            [(_SYStreamGuts *)v11 postStreamEvent:v12 forStream:self];
          }
        }
      }
    }
  }
LABEL_11:
}

uint64_t __49__SYDecompressingInputStream_stream_handleEvent___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(uint64_t *)(result + 40) > 0
    && (result = inflate((z_streamp)(*(void *)(*(void *)(result + 32) + 144) + 72), 2),
        (result & 0x80000000) != 0))
  {
    uint64_t v3 = result;
    [*(id *)(*(void *)(v1 + 32) + 136) close];
    uint64_t v4 = *(void **)(*(void *)(v1 + 32) + 144);
    return objc_msgSend(v4, "setZlibError:forStream:", v3);
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)(v1 + 32) + 144);
    if (!*(_DWORD *)(v2 + 80))
    {
      *(void *)(v2 + 72) = *(void *)(v2 + 200);
      *(void *)(*(void *)(*(void *)(v1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (__CFString *)a4;
  [(NSInputStream *)self->_stream scheduleInRunLoop:v11 forMode:v6];
  internal = self->_internal;
  if (!internal->super._runloopSource) {
    [(_SYStreamGuts *)internal createRunloopSourceForStream:self];
  }
  int64_t v8 = (__CFRunLoop *)[v11 getCFRunLoop];
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
  id v11 = (__CFString *)a4;
  stream = self->_stream;
  id v7 = a3;
  [(NSInputStream *)stream removeFromRunLoop:v7 forMode:v11];
  int64_t v8 = (__CFRunLoop *)[v7 getCFRunLoop];

  runloopSource = self->_internal->super._runloopSource;
  if ([(__CFString *)v11 isEqualToString:*MEMORY[0x263EFF478]]) {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE88];
  }
  else {
    CFStringRef v10 = v11;
  }
  CFRunLoopRemoveSource(v8, runloopSource, v10);
}

- (void)_handlePendingInput
{
  internal = self->_internal;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SYDecompressingInputStream__handlePendingInput__block_invoke;
  v3[3] = &unk_264422AB0;
  v3[4] = self;
  [(_SYZlibStreamInternal *)internal synchronized:v3];
}

uint64_t __49__SYDecompressingInputStream__handlePendingInput__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 144) + 72;
  if (*(_DWORD *)(result + 8))
  {
    int v3 = inflate((z_streamp)result, 2);
    uint64_t result = *(void *)(*(void *)(a1 + 32) + 144);
    if (v3 < 0)
    {
      objc_msgSend((id)result, "setZlibError:forStream:");
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 136);
      return [v4 close];
    }
    else if (!*(_DWORD *)(result + 80))
    {
      *(void *)(result + 72) = *(void *)(result + 200);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  internal = self->_internal;
  if (internal->super._status != 2) {
    return 0;
  }
  uint64_t v8 = [(_SYZlibStreamInternal *)internal outputAvailable];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  self->_internal->super._unint64_t status = 3;
  int64_t v10 = 0;
  if (v8 < 1 || a4 == 0)
  {
    if (v8 <= 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  do
  {
    int64_t v13 = [(_SYZlibStreamInternal *)self->_internal readOutputToBuffer:&a3[v10] length:a4];
    if (v13 == v9) {
      [(SYDecompressingInputStream *)self _handlePendingInput];
    }
    [(_SYZlibStreamInternal *)self->_internal setStatusForStream:self->_stream];
    v10 += v13;
    a4 -= v13;
    uint64_t v14 = [(_SYZlibStreamInternal *)self->_internal outputAvailable];
    uint64_t v9 = v14;
  }
  while (v14 >= 1 && a4 != 0);
  if (!v14)
  {
    if ([(NSInputStream *)self->_stream hasBytesAvailable]) {
      [(SYDecompressingInputStream *)self stream:self->_stream handleEvent:2];
    }
    goto LABEL_22;
  }
  if (v14 >= 1) {
LABEL_21:
  }
    [(_SYStreamGuts *)self->_internal postStreamEvent:2 forStream:self];
LABEL_22:
  uint64_t v16 = self->_internal;
  if (v16->super._status == 3) {
    v16->super._unint64_t status = 2;
  }
  if (v10 >= 1)
  {
    self->_byteCount += v10;
    progress = self->_progress;
    if (progress) {
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
    }
  }
  return v10;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return [(_SYZlibStreamInternal *)self->_internal outputAvailable] > 0;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSInputStream *)self->_stream propertyForKey:v4];
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
  if (([(NSInputStream *)self->_stream setProperty:v6 forKey:v7] & 1) == 0) {
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