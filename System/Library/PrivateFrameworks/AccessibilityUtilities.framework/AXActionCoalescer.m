@interface AXActionCoalescer
+ (id)mainQueueCoalescerWithBlock:(id)a3;
- (AXActionCoalescer)initWithQueue:(id)a3 block:(id)a4;
- (void)performCoalescedAsynchronously;
@end

@implementation AXActionCoalescer

- (AXActionCoalescer)initWithQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXActionCoalescer;
  v9 = [(AXActionCoalescer *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetQueue, a3);
    uint64_t v11 = [v8 copy];
    id block = v10->_block;
    v10->_id block = (id)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.accessibility.AXRunloopCoalescer", 0);
    consistencyQueue = v10->_consistencyQueue;
    v10->_consistencyQueue = (OS_dispatch_queue *)v13;

    v10->_coalescing = 0;
  }

  return v10;
}

+ (id)mainQueueCoalescerWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)[v5 initWithQueue:MEMORY[0x1E4F14428] block:v4];

  return v6;
}

- (void)performCoalescedAsynchronously
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  consistencyQueue = self->_consistencyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke;
  block[3] = &unk_1E5586520;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(consistencyQueue, block);
  if (!*((unsigned char *)v8 + 24))
  {
    targetQueue = self->_targetQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_2;
    v5[3] = &unk_1E5585F48;
    v5[4] = self;
    dispatch_async(targetQueue, v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32)) {
    *(unsigned char *)(v1 + 32) = 1;
  }
  return result;
}

void __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_3;
  block[3] = &unk_1E5585F48;
  block[4] = v2;
  dispatch_sync(v3, block);
}

uint64_t __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consistencyQueue, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end