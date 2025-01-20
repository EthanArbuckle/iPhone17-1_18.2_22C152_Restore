@interface IMDispatchQueue
+ (id)concurrentQueueWithDispatchPriority:(int64_t)a3;
+ (id)serialQueueWithDispatchPriority:(int64_t)a3;
- (BOOL)containsOutstandingBlockForKey:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isSuspended;
- (IMDispatchQueue)init;
- (NSMutableDictionary)dispatchQueueBlocks;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)lockQueue;
- (__CFBinaryHeap)heap;
- (id)_initWithDispatchAttr:(id)a3 dispatchPriority:(int64_t)a4;
- (id)allKeysOfOutstandingBlocks;
- (int64_t)queuePriorityOfOutstandingBlockForKey:(id)a3;
- (void)addBlock:(id)a3;
- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4;
- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4 forKey:(id)a5;
- (void)dealloc;
- (void)removeAllOutstandingBlocks;
- (void)removeOutstandingBlockForKey:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatchQueueBlocks:(id)a3;
- (void)setHeap:(__CFBinaryHeap *)a3;
- (void)setLockQueue:(id)a3;
- (void)setQueuePriority:(int64_t)a3 ofOutstandingBlockForKey:(id)a4;
- (void)setSuspended:(BOOL)a3;
@end

@implementation IMDispatchQueue

- (id)_initWithDispatchAttr:(id)a3 dispatchPriority:(int64_t)a4
{
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMDispatchQueue;
  v7 = [(IMDispatchQueue *)&v19 init];
  if (v7)
  {
    callBacks.version = 0;
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x263EFFF90] + 8);
    callBacks.copyDescription = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x263EFFF90] + 24);
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))_IMDispatchQueueBlockCompare;
    CFBinaryHeapRef v8 = CFBinaryHeapCreate(0, 0, &callBacks, 0);
    objc_msgSend_setHeap_(v7, v9, (uint64_t)v8);
    CFRelease(v8);
    v10 = dispatch_queue_create(0, v6);
    v11 = dispatch_get_global_queue(a4, 0);
    dispatch_set_target_queue(v10, v11);

    objc_msgSend_setDispatchQueue_(v7, v12, (uint64_t)v10);
    dispatch_queue_t v13 = dispatch_queue_create(0, 0);
    objc_msgSend_setLockQueue_(v7, v14, (uint64_t)v13);
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setDispatchQueueBlocks_(v7, v16, (uint64_t)v15);
  }
  return v7;
}

- (void)setLockQueue:(id)a3
{
}

- (void)setHeap:(__CFBinaryHeap *)a3
{
}

- (void)setDispatchQueueBlocks:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    dispatchQueue = self->_dispatchQueue;
    if (a3) {
      dispatch_suspend(dispatchQueue);
    }
    else {
      dispatch_resume(dispatchQueue);
    }
  }
}

+ (id)serialQueueWithDispatchPriority:(int64_t)a3
{
  v4 = [IMDispatchQueue alloc];
  v6 = objc_msgSend__initWithDispatchAttr_dispatchPriority_(v4, v5, 0, a3);
  return v6;
}

+ (id)concurrentQueueWithDispatchPriority:(int64_t)a3
{
  v4 = [IMDispatchQueue alloc];
  v6 = objc_msgSend__initWithDispatchAttr_dispatchPriority_(v4, v5, MEMORY[0x263EF83A8], a3);
  return v6;
}

- (void)dealloc
{
  objc_msgSend_setSuspended_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)IMDispatchQueue;
  [(IMDispatchQueue *)&v3 dealloc];
}

- (IMDispatchQueue)init
{
  return (IMDispatchQueue *)objc_msgSend__initWithDispatchAttr_dispatchPriority_(self, a2, 0, -32768);
}

- (void)addBlock:(id)a3
{
}

- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4
{
}

- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12 = objc_msgSend_dispatchQueue(self, v10, v11);
  id v15 = objc_msgSend_lockQueue(self, v13, v14);
  v18 = objc_msgSend_heap(self, v16, v17);
  uint64_t v21 = objc_msgSend_dispatchQueueBlocks(self, v19, v20);
  v23 = (void *)v21;
  if (!v18 || !v21) {
    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v22, *MEMORY[0x263EFF498], @"Tried to add block for key %@ to a cancelled IMDispatchQueue.", v9);
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v22, *MEMORY[0x263EFF4A0], @"Tried to add block for key %@ to IMDispatchQueue with priority NSNotFound, which is reserved.", v9);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F1B9C;
  block[3] = &unk_264300738;
  id v40 = v8;
  int64_t v41 = a4;
  id v36 = v9;
  v37 = self;
  id v24 = v23;
  id v38 = v24;
  id v25 = v18;
  id v39 = v25;
  id v26 = v9;
  id v27 = v8;
  dispatch_async(v15, block);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_2180F1C70;
  v31[3] = &unk_264300788;
  v32 = v15;
  id v33 = v25;
  id v34 = v24;
  id v28 = v24;
  id v29 = v25;
  v30 = v15;
  dispatch_async(v12, v31);
}

- (void)setQueuePriority:(int64_t)a3 ofOutstandingBlockForKey:(id)a4
{
  id v6 = a4;
  id v9 = objc_msgSend_lockQueue(self, v7, v8);
  v12 = objc_msgSend_dispatchQueueBlocks(self, v10, v11);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_2180F1D98;
  id v25 = sub_2180F1DC4;
  id v26 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F1FE8;
  block[3] = &unk_264300760;
  id v13 = v12;
  id v18 = v13;
  id v14 = v6;
  id v19 = v14;
  uint64_t v20 = &v21;
  dispatch_sync(v9, block);
  objc_msgSend_removeOutstandingBlockForKey_(self, v15, (uint64_t)v14);
  objc_msgSend_addBlock_withQueuePriority_forKey_(self, v16, v22[5], a3, v14);

  _Block_object_dispose(&v21, 8);
}

- (int64_t)queuePriorityOfOutstandingBlockForKey:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_lockQueue(self, v5, v6);
  v10 = objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F2170;
  block[3] = &unk_264300760;
  id v16 = v10;
  id v17 = v4;
  id v18 = &v19;
  id v11 = v4;
  id v12 = v10;
  dispatch_sync(v7, block);
  int64_t v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)allKeysOfOutstandingBlocks
{
  id v4 = objc_msgSend_lockQueue(self, a2, v2);
  v7 = objc_msgSend_dispatchQueueBlocks(self, v5, v6);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2180F22FC;
  id v18 = sub_2180F230C;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2180F2314;
  v11[3] = &unk_2643007B0;
  id v12 = v7;
  int64_t v13 = &v14;
  id v8 = v7;
  dispatch_sync(v4, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)containsOutstandingBlockForKey:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_lockQueue(self, v5, v6);
  v10 = objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F2484;
  block[3] = &unk_264300760;
  id v16 = v10;
  id v17 = v4;
  id v18 = &v19;
  id v11 = v4;
  id v12 = v10;
  dispatch_sync(v7, block);
  char v13 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)removeOutstandingBlockForKey:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_lockQueue(self, v5, v6);
  v10 = objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2180F25B0;
  v13[3] = &unk_2643007D8;
  id v14 = v10;
  id v15 = v4;
  id v11 = v4;
  id v12 = v10;
  dispatch_async(v7, v13);
}

- (void)removeAllOutstandingBlocks
{
  id v4 = objc_msgSend_lockQueue(self, a2, v2);
  v7 = objc_msgSend_dispatchQueueBlocks(self, v5, v6);
  v10 = objc_msgSend_heap(self, v8, v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2180F26E8;
  v13[3] = &unk_2643007D8;
  id v14 = v10;
  id v15 = v7;
  id v11 = v7;
  id v12 = v10;
  dispatch_async(v4, v13);
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (__CFBinaryHeap)heap
{
  return self->_heap;
}

- (NSMutableDictionary)dispatchQueueBlocks
{
  return self->_dispatchQueueBlocks;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueBlocks, 0);
  objc_storeStrong((id *)&self->_heap, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end