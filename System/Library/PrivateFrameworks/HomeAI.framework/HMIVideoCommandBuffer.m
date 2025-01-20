@interface HMIVideoCommandBuffer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (HMITimeIntervalAverage)sampleBufferDelay;
- (HMIVideoCommandBuffer)initWithMaxCapacity:(unint64_t)a3;
- (HMIVideoCommandBufferDelegate)delegate;
- (NSCondition)condition;
- (OS_dispatch_queue)delegateQueue;
- (double)delay;
- (float)fillRatio;
- (unint64_t)capacity;
- (unint64_t)size;
- (void)flush;
- (void)flushAsync;
- (void)handleBlock:(id)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setSize:(unint64_t)a3;
@end

@implementation HMIVideoCommandBuffer

- (HMIVideoCommandBuffer)initWithMaxCapacity:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoCommandBuffer;
  v4 = [(HMIVideoCommandBuffer *)&v11 init];
  if (v4)
  {
    v5 = [[HMITimeIntervalAverage alloc] initWithMaxCapacity:32];
    v6 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v5;

    uint64_t v7 = MEMORY[0x263F010E0];
    *(_OWORD *)(v4 + 24) = *MEMORY[0x263F010E0];
    *((void *)v4 + 5) = *(void *)(v7 + 16);
    *((void *)v4 + 7) = a3;
    id v8 = objc_alloc_init(MEMORY[0x263F08740]);
    v9 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v8;
  }
  return (HMIVideoCommandBuffer *)v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;
}

- (float)fillRatio
{
  return fminf((float)[(HMIVideoCommandBuffer *)self size]/ (float)[(HMIVideoCommandBuffer *)self capacity], 1.0);
}

- (BOOL)isFull
{
  unint64_t v3 = [(HMIVideoCommandBuffer *)self size];
  return v3 >= [(HMIVideoCommandBuffer *)self capacity];
}

- (BOOL)isEmpty
{
  return [(HMIVideoCommandBuffer *)self size] == 0;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  size_t TotalSampleSize = CMSampleBufferGetTotalSampleSize(a3);
  v6 = [(HMIVideoCommandBuffer *)self condition];
  [v6 lock];

  if ([(HMIVideoCommandBuffer *)self isFull])
  {
    do
    {
      uint64_t v7 = [(HMIVideoCommandBuffer *)self condition];
      [v7 wait];
    }
    while ([(HMIVideoCommandBuffer *)self isFull]);
  }
  [(HMIVideoCommandBuffer *)self setSize:[(HMIVideoCommandBuffer *)self size] + TotalSampleSize];
  CFRetain(a3);
  id v8 = [MEMORY[0x263EFF910] date];
  v9 = [(HMIVideoCommandBuffer *)self delegateQueue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __44__HMIVideoCommandBuffer_handleSampleBuffer___block_invoke;
  v15 = &unk_26477E930;
  v16 = self;
  id v17 = v8;
  v18 = a3;
  size_t v19 = TotalSampleSize;
  id v10 = v8;
  dispatch_async(v9, &v12);

  objc_super v11 = [(HMIVideoCommandBuffer *)self condition];
  [v11 unlock];
}

void __44__HMIVideoCommandBuffer_handleSampleBuffer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sampleBufferDelay];
  unint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 40)];
  objc_msgSend(v2, "addValue:");

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 buffer:*(void *)(a1 + 32) willHandleSampleBuffer:*(void *)(a1 + 48)];

  CFRelease(*(CFTypeRef *)(a1 + 48));
  v5 = [*(id *)(a1 + 32) condition];
  [v5 lock];

  objc_msgSend(*(id *)(a1 + 32), "setSize:", objc_msgSend(*(id *)(a1 + 32), "size") - *(void *)(a1 + 56));
  if (([*(id *)(a1 + 32) isFull] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 32) condition];
    [v6 signal];
  }
  id v7 = [*(id *)(a1 + 32) condition];
  [v7 unlock];
}

- (void)flushAsync
{
  unint64_t v3 = [(HMIVideoCommandBuffer *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMIVideoCommandBuffer_flushAsync__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __35__HMIVideoCommandBuffer_flushAsync__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 bufferWillFlush:*(void *)(a1 + 32)];
}

- (void)flush
{
  unint64_t v3 = [(HMIVideoCommandBuffer *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMIVideoCommandBuffer_flush__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __30__HMIVideoCommandBuffer_flush__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 bufferWillFlush:*(void *)(a1 + 32)];
}

- (void)handleBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HMIVideoCommandBuffer *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMIVideoCommandBuffer_handleBlock___block_invoke;
  block[3] = &unk_26477CFC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __37__HMIVideoCommandBuffer_handleBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)delay
{
  id v2 = [(HMIVideoCommandBuffer *)self sampleBufferDelay];
  [v2 value];
  double v4 = v3;

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  objc_copyStruct(retstr, &self->_videoDuration, 24, 1, 0);
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSCondition)condition
{
  return (NSCondition *)objc_getProperty(self, a2, 64, 1);
}

- (HMITimeIntervalAverage)sampleBufferDelay
{
  return (HMITimeIntervalAverage *)objc_getProperty(self, a2, 72, 1);
}

- (HMIVideoCommandBufferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoCommandBufferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sampleBufferDelay, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end