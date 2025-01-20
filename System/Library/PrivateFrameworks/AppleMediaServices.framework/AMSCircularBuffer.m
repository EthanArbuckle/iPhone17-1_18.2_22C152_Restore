@interface AMSCircularBuffer
+ (id)_rearrangeObjects:(id)a3 forCurrentIndex:(unint64_t)a4;
- (AMSCircularBuffer)init;
- (AMSCircularBuffer)initWithMaxSize:(unint64_t)a3;
- (NSArray)allObjects;
- (NSMutableArray)buffer;
- (OS_dispatch_queue)accessQueue;
- (id)_flush;
- (id)description;
- (id)flush;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (unint64_t)maxSize;
- (void)addObject:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setMaxSize:(unint64_t)a3;
@end

@implementation AMSCircularBuffer

uint64_t __26__AMSCircularBuffer_flush__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _flush];
  return MEMORY[0x1F41817F8]();
}

- (id)_flush
{
  v3 = [(AMSCircularBuffer *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(AMSCircularBuffer *)self buffer];
  unint64_t v5 = [(AMSCircularBuffer *)self currentIndex];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_maxSize];
  [(AMSCircularBuffer *)self setBuffer:v6];

  [(AMSCircularBuffer *)self setCurrentIndex:0];
  v7 = +[AMSCircularBuffer _rearrangeObjects:v4 forCurrentIndex:v5];

  return v7;
}

- (void)setBuffer:(id)a3
{
}

+ (id)_rearrangeObjects:(id)a3 forCurrentIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      if (a4 == [v5 count]) {
        a4 = 0;
      }
      v8 = [v5 objectAtIndexedSubscript:a4];
      [v6 addObject:v8];

      ++a4;
      ++v7;
    }
    while (v7 < [v5 count]);
  }

  return v6;
}

void __31__AMSCircularBuffer_addObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    unint64_t v2 = [WeakRetained currentIndex];
    v3 = [WeakRetained buffer];
    unint64_t v4 = [v3 count];

    if (v2 < v4)
    {
      id v5 = [WeakRetained buffer];
      [v5 removeObjectAtIndex:v2];
    }
    id v6 = [WeakRetained buffer];
    [v6 insertObject:*(void *)(a1 + 40) atIndex:v2];

    if (v2 + 1 < *(void *)(*(void *)(a1 + 32) + 8)) {
      unint64_t v7 = v2 + 1;
    }
    else {
      unint64_t v7 = 0;
    }
    [WeakRetained setCurrentIndex:v7];
  }
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AMSCircularBuffer *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__AMSCircularBuffer_addObject___block_invoke;
  v7[3] = &unk_1E55A1108;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (id)flush
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  v3 = [(AMSCircularBuffer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__AMSCircularBuffer_flush__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (AMSCircularBuffer)init
{
  return [(AMSCircularBuffer *)self initWithMaxSize:10];
}

- (AMSCircularBuffer)initWithMaxSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AMSCircularBuffer;
  id v4 = [(AMSCircularBuffer *)&v10 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppleMediaServices.AMSCircularBuffer.access", 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    buffer = v4->_buffer;
    v4->_buffer = (NSMutableArray *)v7;

    v4->_currentIndex = 0;
    v4->_maxSize = a3;
  }
  return v4;
}

- (NSArray)allObjects
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [(AMSCircularBuffer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AMSCircularBuffer_allObjects__block_invoke;
  block[3] = &unk_1E55A10B8;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(v3, block);

  id v4 = +[AMSCircularBuffer _rearrangeObjects:v12[5] forCurrentIndex:v8[3]];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

uint64_t __31__AMSCircularBuffer_allObjects__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) buffer];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t result = [*(id *)(a1 + 32) currentIndex];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AMSCircularBuffer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__AMSCircularBuffer_count__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __26__AMSCircularBuffer_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buffer];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (unint64_t)maxSize
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AMSCircularBuffer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__AMSCircularBuffer_maxSize__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __28__AMSCircularBuffer_maxSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setMaxSize:(unint64_t)a3
{
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(AMSCircularBuffer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__AMSCircularBuffer_setMaxSize___block_invoke;
  v6[3] = &unk_1E55A10E0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async(v5, v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __32__AMSCircularBuffer_setMaxSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 48) != *(void *)(*(void *)(a1 + 32) + 8))
  {
    id v11 = WeakRetained;
    uint64_t v3 = [WeakRetained _flush];
    uint64_t v4 = [v3 count];
    for (unint64_t i = (v4 - *(void *)(a1 + 48)) & ~((v4 - *(void *)(a1 + 48)) >> 63); i < [v3 count]; ++i)
    {
      id v6 = [v11 buffer];
      uint64_t v7 = [v3 objectAtIndexedSubscript:i];
      [v6 addObject:v7];
    }
    unint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8 > *(void *)(v9 + 8))
    {
      uint64_t v10 = [v11 buffer];
      objc_msgSend(v11, "setCurrentIndex:", objc_msgSend(v10, "count"));

      unint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    *(void *)(v9 + 8) = v8;

    id WeakRetained = v11;
  }
}

- (id)description
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__18;
  id v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  uint64_t v3 = [(AMSCircularBuffer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__AMSCircularBuffer_description__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__AMSCircularBuffer_description__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) buffer];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end