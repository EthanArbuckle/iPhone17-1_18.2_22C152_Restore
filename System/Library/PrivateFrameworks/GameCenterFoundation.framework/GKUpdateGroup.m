@interface GKUpdateGroup
+ (GKUpdateGroup)updateGroupWithName:(id)a3;
+ (GKUpdateGroup)updateGroupWithName:(id)a3 taregetQueue:(id)a4;
+ (id)updateGroup;
+ (id)updateGroupForTargetQueue:(id)a3;
- (GKUpdateGroup)initWithName:(id)a3 targetQueue:(id)a4;
- (NSError)error;
- (NSLock)lock;
- (NSMutableArray)notifiers;
- (NSString)name;
- (int64_t)updateCount;
- (void)applyUpdates;
- (void)cancelUpdates;
- (void)dealloc;
- (void)join:(id)a3;
- (void)joinAndApplyUpdates;
- (void)joinApplyUpdatesAndDo:(id)a3;
- (void)perform:(id)a3;
- (void)performOnQueue:(id)a3 block:(id)a4;
- (void)setError:(id)a3;
- (void)setLock:(id)a3;
- (void)setName:(id)a3;
- (void)setNotifiers:(id)a3;
- (void)wait;
@end

@implementation GKUpdateGroup

+ (id)updateGroup
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:0 targetQueue:MEMORY[0x1E4F14428]];

  return v2;
}

+ (GKUpdateGroup)updateGroupWithName:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:a3 targetQueue:MEMORY[0x1E4F14428]];

  return (GKUpdateGroup *)v3;
}

+ (id)updateGroupForTargetQueue:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:0 targetQueue:a3];

  return v3;
}

+ (GKUpdateGroup)updateGroupWithName:(id)a3 taregetQueue:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:a3 targetQueue:a4];

  return (GKUpdateGroup *)v4;
}

- (GKUpdateGroup)initWithName:(id)a3 targetQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKUpdateGroup;
  v6 = [(GKUpdateGroup *)&v8 init];
  if (v6)
  {
    v6->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v6->_targetQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    v6->_dispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v6->_notifiers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!a3) {
      a3 = (id)[(GKUpdateGroup *)v6 description];
    }
    [(GKUpdateGroup *)v6 setName:a3];
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_targetQueue);
  dispatch_release((dispatch_object_t)self->_dispatchGroup);

  v3.receiver = self;
  v3.super_class = (Class)GKUpdateGroup;
  [(GKUpdateGroup *)&v3 dealloc];
}

- (void)performOnQueue:(id)a3 block:(id)a4
{
  v7 = objc_alloc_init(GKUpdateGroupNotifier);
  [(NSMutableArray *)[(GKUpdateGroup *)self notifiers] addObject:v7];

  [(GKUpdateGroupNotifier *)v7 setGroup:self];
  objc_super v8 = _Block_copy(a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__GKUpdateGroup_performOnQueue_block___block_invoke;
  v9[3] = &unk_1E646E260;
  v9[4] = v7;
  v9[5] = v8;
  dispatch_async((dispatch_queue_t)a3, v9);
}

void __38__GKUpdateGroup_performOnQueue_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(const void **)(a1 + 40);

  _Block_release(v2);
}

- (void)perform:(id)a3
{
}

- (void)join:(id)a3
{
  v5 = self;
  dispatchGroup = self->_dispatchGroup;
  targetQueue = self->_targetQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__GKUpdateGroup_join___block_invoke;
  v8[3] = &unk_1E646E260;
  v8[4] = self;
  v8[5] = a3;
  dispatch_group_notify(dispatchGroup, targetQueue, v8);
}

void __22__GKUpdateGroup_join___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(void **)(a1 + 32);
}

- (void)joinApplyUpdatesAndDo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__GKUpdateGroup_joinApplyUpdatesAndDo___block_invoke;
  v3[3] = &unk_1E646E288;
  v3[4] = self;
  v3[5] = a3;
  [(GKUpdateGroup *)self join:v3];
}

uint64_t __39__GKUpdateGroup_joinApplyUpdatesAndDo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) applyUpdates];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) error];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)joinAndApplyUpdates
{
}

- (void)wait
{
}

- (void)applyUpdates
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  notifiers = self->_notifiers;
  uint64_t v4 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(notifiers);
        }
        objc_super v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "lock");
        if (!self->_error)
        {
          long long v16 = 0u;
          long long v17 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          v9 = objc_msgSend(v8, "updateQueue", 0);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v15;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v15 != v12) {
                  objc_enumerationMutation(v9);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * j) + 16))();
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v11);
          }
        }
        objc_msgSend((id)objc_msgSend(v8, "updateQueue"), "removeAllObjects");
        [v8 setGroup:0];
        objc_msgSend((id)objc_msgSend(v8, "lock"), "unlock");
      }
      uint64_t v5 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_notifiers removeAllObjects];
  [(GKUpdateGroup *)self setError:0];
  [(NSLock *)self->_lock unlock];
}

- (void)cancelUpdates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  notifiers = self->_notifiers;
  uint64_t v4 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(notifiers);
        }
        objc_super v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "lock");
        objc_msgSend((id)objc_msgSend(v8, "updateQueue"), "removeAllObjects");
        [v8 setGroup:0];
        objc_msgSend((id)objc_msgSend(v8, "lock"), "unlock");
      }
      uint64_t v5 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_notifiers removeAllObjects];
  [(GKUpdateGroup *)self setError:0];
  [(NSLock *)self->_lock unlock];
}

- (int64_t)updateCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  notifiers = self->_notifiers;
  uint64_t v4 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(notifiers);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "lock"), "lock");
        v6 += objc_msgSend((id)objc_msgSend(v9, "updateQueue"), "count");
        if ([v9 error]) {
          ++v6;
        }
        objc_msgSend((id)objc_msgSend(v9, "lock"), "unlock");
      }
      uint64_t v5 = [(NSMutableArray *)notifiers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v6;
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLock:(id)a3
{
}

- (NSMutableArray)notifiers
{
  return self->_notifiers;
}

- (void)setNotifiers:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end