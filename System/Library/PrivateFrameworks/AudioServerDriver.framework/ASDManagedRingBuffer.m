@interface ASDManagedRingBuffer
- (ASDManagedRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5;
- (BOOL)readerRunning;
- (BOOL)writerRunning;
- (void)setReaderRunning:(BOOL)a3;
- (void)setWriterRunning:(BOOL)a3;
- (void)startReader;
- (void)startWriter;
- (void)stopReader;
- (void)stopWriter;
@end

@implementation ASDManagedRingBuffer

- (ASDManagedRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASDManagedRingBuffer;
  v10 = [(ASDRingBuffer *)&v16 initWithFrameCapacity:a3 writeFormat:v8 readFormat:v9];
  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

- (void)startReader
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDManagedRingBuffer_startReader__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__ASDManagedRingBuffer_startReader__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReaderRunning:1];
  uint64_t result = [*(id *)(a1 + 32) writerRunning];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 allocate];
  }
  return result;
}

- (void)stopReader
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDManagedRingBuffer_stopReader__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__ASDManagedRingBuffer_stopReader__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReaderRunning:0];
  uint64_t result = [*(id *)(a1 + 32) writerRunning];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 deallocate];
  }
  return result;
}

- (void)startWriter
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDManagedRingBuffer_startWriter__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__ASDManagedRingBuffer_startWriter__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWriterRunning:1];
  uint64_t result = [*(id *)(a1 + 32) readerRunning];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 allocate];
  }
  return result;
}

- (void)stopWriter
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDManagedRingBuffer_stopWriter__block_invoke;
  block[3] = &unk_264772D28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__ASDManagedRingBuffer_stopWriter__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWriterRunning:0];
  uint64_t result = [*(id *)(a1 + 32) readerRunning];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 deallocate];
  }
  return result;
}

- (BOOL)readerRunning
{
  return self->_readerRunning;
}

- (void)setReaderRunning:(BOOL)a3
{
  self->_readerRunning = a3;
}

- (BOOL)writerRunning
{
  return self->_writerRunning;
}

- (void)setWriterRunning:(BOOL)a3
{
  self->_writerRunning = a3;
}

- (void).cxx_destruct
{
}

@end