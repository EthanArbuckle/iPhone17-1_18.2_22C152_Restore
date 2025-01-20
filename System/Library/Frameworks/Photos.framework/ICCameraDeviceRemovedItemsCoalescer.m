@interface ICCameraDeviceRemovedItemsCoalescer
- (ICCameraDeviceRemovedItemsCoalescer)initWithSource:(id)a3 block:(id)a4;
- (void)coalesceItems:(id)a3;
@end

@implementation ICCameraDeviceRemovedItemsCoalescer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_lastNotify, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)coalesceItems:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke;
  v7[3] = &unk_1E5848DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 8))
  {
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v2 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v6, v7, 0x5F5E100uLL, 0);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke_2;
    handler[3] = &unk_1E5848578;
    handler[4] = v8;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return [*(id *)(v2 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
}

void __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count]
    && (id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24)),
        WeakRetained,
        WeakRetained))
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;
  }
  else
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8));
    uint64_t v6 = *(void *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = 0;
  }
}

- (ICCameraDeviceRemovedItemsCoalescer)initWithSource:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICCameraDeviceRemovedItemsCoalescer;
  uint64_t v8 = [(ICCameraDeviceRemovedItemsCoalescer *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_source, v6);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ICCameraFileRemovedItemsCoalescer", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    items = v9->_items;
    v9->_items = (NSMutableArray *)v13;

    uint64_t v15 = [v7 copy];
    id block = v9->_block;
    v9->_id block = (id)v15;
  }
  return v9;
}

@end