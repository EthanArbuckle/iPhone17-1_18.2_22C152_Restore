@interface AWClientPollWaiter
- (AWClientPollWaiter)initWithClient:(id)a3 timeout:(unint64_t)a4 queue:(id)a5 block:(id)a6;
- (void)cancel;
- (void)invalidate;
- (void)invokeClientBlock:(unint64_t)a3 event:(id)a4;
- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4;
@end

@implementation AWClientPollWaiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_clientBlock, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_client);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AWClientPollWaiter_invalidate__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__AWClientPollWaiter_invalidate__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = 3;
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40));
}

- (void)cancel
{
}

- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AWClientPollWaiter_notifyPollEventType_event___block_invoke;
  block[3] = &unk_1E606ABD8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __48__AWClientPollWaiter_notifyPollEventType_event___block_invoke(void *a1)
{
  v2 = (_DWORD *)a1[4];
  int v3 = v2[12];
  if (v3 == 2)
  {
    uint64_t v6 = 4;
    uint64_t v7 = 0;
  }
  else
  {
    if (v3 != 1)
    {
      if (v3) {
        goto LABEL_12;
      }
      [v2 invokeClientBlock:a1[6] event:a1[5]];
      uint64_t v4 = a1[6];
      uint64_t v5 = a1[4];
      if (v4 == 1) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v6 = a1[6];
    if (v6 == 1) {
      goto LABEL_12;
    }
    uint64_t v7 = a1[5];
  }
  [v2 invokeClientBlock:v6 event:v7];
  uint64_t v5 = a1[4];
LABEL_10:
  LODWORD(v4) = 3;
LABEL_11:
  *(_DWORD *)(v5 + 48) = v4;
LABEL_12:
  uint64_t v8 = a1[4];
  if (*(_DWORD *)(v8 + 48) == 3)
  {
    v9 = *(NSObject **)(v8 + 40);
    dispatch_source_cancel(v9);
  }
}

- (void)invokeClientBlock:(unint64_t)a3 event:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AWClientPollWaiter_invokeClientBlock_event___block_invoke;
  block[3] = &unk_1E606ABD8;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(clientQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  +[AWSampleLogger client:WeakRetained pollEventType:a3 event:v8];
}

uint64_t __46__AWClientPollWaiter_invokeClientBlock_event___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 32) + 16))(*(void *)(a1[4] + 32), a1[6], a1[5]);
}

- (AWClientPollWaiter)initWithClient:(id)a3 timeout:(unint64_t)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)AWClientPollWaiter;
  v13 = [(AWClientPollWaiter *)&v30 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_client, v10);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.AttentionAwareness.pollWaiterQueue", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.AttentionAwareness.clientPollQueue", 0);
    clientQueue = v14->_clientQueue;
    v14->_clientQueue = (OS_dispatch_queue *)v17;

    dispatch_set_target_queue((dispatch_object_t)v14->_clientQueue, v11);
    uint64_t v19 = [v12 copy];
    id clientBlock = v14->_clientBlock;
    v14->_id clientBlock = (id)v19;

    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v14->_queue);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v21;

    v23 = v14->_timer;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__AWClientPollWaiter_initWithClient_timeout_queue_block___block_invoke;
    v27[3] = &unk_1E606AC98;
    v28 = v14;
    id v29 = v10;
    dispatch_source_set_event_handler(v23, v27);
    v24 = v14->_timer;
    dispatch_time_t v25 = dispatch_time(0, a4);
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)v14->_timer);
  }
  return v14;
}

uint64_t __57__AWClientPollWaiter_initWithClient_timeout_queue_block___block_invoke(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 48) != 3) {
    return [*(id *)(result + 40) notifyPollEventType:3 event:0];
  }
  return result;
}

@end