@interface HFMutablePriorityQueue
- (HFMutablePriorityQueue)init;
- (NAQueue)queue;
- (id)dequeue;
- (id)drain;
- (id)enqueue:(id)a3;
- (unint64_t)count;
- (void)_operateOnMatchingObjects:(id)a3 removingMatched:(BOOL)a4 lockedOperationBlock:(id)a5;
- (void)_prioritizeObjects:(id)a3 priorityBlock:(id)a4;
- (void)prioritizeObjects:(id)a3;
- (void)prioritizeObjects:(id)a3 increment:(int64_t)a4;
- (void)removeAllObjectsMatchingObjects:(id)a3;
- (void)removeFirstOfObjects:(id)a3;
- (void)removeObjectsWithEntries:(id)a3;
- (void)resetPriorityForObjects:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HFMutablePriorityQueue

uint64_t __30__HFMutablePriorityQueue_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 priority];
  if (v6 <= [v5 priority])
  {
    unint64_t v8 = [v5 priority];
    uint64_t v7 = v8 > [v4 priority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)enqueue:(id)a3
{
  id v4 = a3;
  id v5 = [[HFMutablePriorityQueueEntry alloc] initWithValue:v4];

  os_unfair_lock_lock(&self->_lock);
  [(NAQueue *)self->_queue enqueue:v5];
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)dequeue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NAQueue *)self->_queue dequeue];
  id v5 = [v4 value];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)prioritizeObjects:(id)a3
{
}

- (void)removeObjectsWithEntries:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(HFMutablePriorityQueue *)self queue];
        [v11 dequeueObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NAQueue)queue
{
  return (NAQueue *)objc_getProperty(self, a2, 16, 1);
}

id __89__HFMutablePriorityQueue__operateOnMatchingObjects_removingMatched_lockedOperationBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 addObject:a2];
  return v4;
}

- (void)prioritizeObjects:(id)a3 increment:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__HFMutablePriorityQueue_prioritizeObjects_increment___block_invoke;
  v4[3] = &__block_descriptor_40_e37_Q16__0__HFMutablePriorityQueueEntry_8l;
  v4[4] = a4;
  [(HFMutablePriorityQueue *)self _prioritizeObjects:a3 priorityBlock:v4];
}

- (void)_prioritizeObjects:(id)a3 priorityBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HFMutablePriorityQueue__prioritizeObjects_priorityBlock___block_invoke;
  v8[3] = &unk_26408DD48;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HFMutablePriorityQueue *)self _operateOnMatchingObjects:a3 removingMatched:1 lockedOperationBlock:v8];
}

- (void)_operateOnMatchingObjects:(id)a3 removingMatched:(BOOL)a4 lockedOperationBlock:(id)a5
{
  BOOL v23 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = objc_alloc_init(MEMORY[0x263F08760]);
  v22 = v7;
  uint64_t v10 = objc_msgSend(v7, "na_reduceWithInitialValue:reducer:", v9, &__block_literal_global_34);

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = [(HFMutablePriorityQueue *)self queue];
  long long v12 = [v11 allObjects];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 value];
        int v19 = [v10 containsObject:v18];

        if (v19)
        {
          v8[2](v8, v17);
          if (v23)
          {
            v20 = [v17 value];
            [v10 removeObject:v20];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(lock);
}

- (HFMutablePriorityQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFMutablePriorityQueue;
  v2 = [(HFMutablePriorityQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F581B0] priorityQueueWithComparator:&__block_literal_global_10];
    queue = v2->_queue;
    v2->_queue = (NAQueue *)v3;
  }
  return v2;
}

- (unint64_t)count
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NAQueue *)self->_queue count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeFirstOfObjects:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__HFMutablePriorityQueue_removeFirstOfObjects___block_invoke;
  v3[3] = &unk_26408DCA0;
  v3[4] = self;
  [(HFMutablePriorityQueue *)self _operateOnMatchingObjects:a3 removingMatched:1 lockedOperationBlock:v3];
}

void __47__HFMutablePriorityQueue_removeFirstOfObjects___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 queue];
  [v4 dequeueObject:v3];
}

- (void)removeAllObjectsMatchingObjects:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__HFMutablePriorityQueue_removeAllObjectsMatchingObjects___block_invoke;
  v3[3] = &unk_26408DCA0;
  v3[4] = self;
  [(HFMutablePriorityQueue *)self _operateOnMatchingObjects:a3 removingMatched:0 lockedOperationBlock:v3];
}

void __58__HFMutablePriorityQueue_removeAllObjectsMatchingObjects___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 queue];
  [v4 dequeueObject:v3];
}

- (id)drain
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HFMutablePriorityQueue *)self queue];
  id v5 = [v4 drain];
  objc_super v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_26);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __31__HFMutablePriorityQueue_drain__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __54__HFMutablePriorityQueue_prioritizeObjects_increment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32) + [v3 priority];
  [v3 setPriority:v4];

  return v4;
}

- (void)resetPriorityForObjects:(id)a3
{
}

uint64_t __50__HFMutablePriorityQueue_resetPriorityForObjects___block_invoke()
{
  return 0;
}

void __59__HFMutablePriorityQueue__prioritizeObjects_priorityBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 queue];
  [v5 dequeueObject:v4];

  [v4 setPriority:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  id v6 = [*(id *)(a1 + 32) queue];
  [v6 enqueue:v4];
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end