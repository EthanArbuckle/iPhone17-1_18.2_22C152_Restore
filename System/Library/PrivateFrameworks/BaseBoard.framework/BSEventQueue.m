@interface BSEventQueue
- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4;
- (BOOL)hasEventWithName:(id)a3;
- (BOOL)hasEventWithPrefix:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isLocked;
- (BSEventQueue)init;
- (BSEventQueue)initWithName:(id)a3 onQueue:(id)a4;
- (BSEventQueueEvent)executingEvent;
- (NSArray)pendingEvents;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)acquireLockForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_addEventQueueLock:(id *)a1;
- (void)_processNextEvent;
- (void)_removeEventQueueLock:(id *)a1;
- (void)cancelEventsWithName:(id)a3;
- (void)executeOrInsertEvent:(id)a3 atPosition:(int)a4;
- (void)executeOrInsertEvents:(id)a3 atPosition:(int)a4;
- (void)flushAllEvents;
- (void)flushEvents:(id)a3;
- (void)flushPendingEvents;
- (void)relinquishLock:(id)a3;
@end

@implementation BSEventQueue

- (BSEventQueueEvent)executingEvent
{
  return self->_executingEvent;
}

- (BOOL)isLocked
{
  return [(NSHashTable *)self->_eventQueueLocks count] != 0;
}

- (void)executeOrInsertEvent:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(BSEventQueue *)self executeOrInsertEvents:v6 atPosition:v4];
}

- (void)executeOrInsertEvents:(id)a3 atPosition:(int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v4 = *(void *)&a4;
    if (![a3 count])
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__executeOrPendEvents_position_ object:self file:@"BSEventQueue.m" lineNumber:50 description:@"Must have something to execute"];
    }
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = a3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([(BSEventQueue *)self _shouldProcessEvent:v12 enqueuedDuringExecutionOfEvent:self->_executingEvent])
          {
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    [(BSEventQueue *)self _noteWillPendEvents:v7 atPosition:v4];
    if (v4 == 1)
    {
      [(NSMutableArray *)self->_eventQueue addObjectsFromArray:v7];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v13 = objc_msgSend(v7, "reverseObjectEnumerator", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v13);
            }
            [(NSMutableArray *)self->_eventQueue insertObject:*(void *)(*((void *)&v18 + 1) + 8 * j) atIndex:0];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v14);
      }
    }
    -[BSEventQueue _processNextEvent]((uint64_t)self);
  }
}

- (void)_processNextEvent
{
  if (a1 && !*(unsigned char *)(a1 + 24))
  {
    v3 = (void *)(a1 + 48);
    uint64_t v2 = *(void *)(a1 + 48);
    *(unsigned char *)(a1 + 24) = 1;
    if (!v2)
    {
      do
      {
        if ([*(id *)(a1 + 8) count] || !objc_msgSend(*(id *)(a1 + 16), "count")) {
          break;
        }
        uint64_t v4 = [*(id *)(a1 + 16) objectAtIndex:0];
        if (v4)
        {
          objc_storeStrong((id *)(a1 + 48), v4);
          v5 = [(id)a1 acquireLockForReason:@"ExecutingEvent"];
          [*(id *)(a1 + 16) removeObjectAtIndex:0];
          [(id)a1 _noteWillExecuteEvent:v4];
          uint64_t v6 = v4[1];
          if (v6) {
            (*(void (**)(void))(v6 + 16))();
          }
          [(id)a1 relinquishLock:v5];
          v7 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = 0;

          if (![*(id *)(a1 + 16) count]) {
            [(id)a1 _noteQueueDidDrain];
          }
        }
      }
      while (!*v3);
    }
    *(unsigned char *)(a1 + 24) = 0;
  }
}

- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4
{
  return 1;
}

- (void)_removeEventQueueLock:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 queue];
    BSDispatchQueueAssert(v4);

    if (a2)
    {
      [a1[1] removeObject:a2];
      if (![a1[1] count]) {
        [a1 _noteQueueDidUnlock];
      }
      -[BSEventQueue _processNextEvent]((uint64_t)a1);
    }
  }
}

- (id)acquireLockForReason:(id)a3
{
  v3 = [[BSEventQueueLock alloc] initWithEventQueue:self reason:a3];
  return v3;
}

- (void)_addEventQueueLock:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 queue];
    BSDispatchQueueAssert(v4);

    if (a2)
    {
      if (([a1[1] containsObject:a2] & 1) == 0)
      {
        [a1[1] addObject:a2];
        if ([a1[1] count] == 1)
        {
          [a1 _noteQueueDidLock];
        }
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)relinquishLock:(id)a3
{
  if (a3) {
    uint64_t v6 = (void *)*((void *)a3 + 3);
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = v6;

  if (v7 != self)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BSEventQueue.m", 93, @"Invalid parameter not satisfying: %@", @"[lock eventQueue] == self" object file lineNumber description];
  }
  [a3 relinquish];
}

- (NSArray)pendingEvents
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_eventQueue copy];
  return (NSArray *)v2;
}

- (void)flushAllEvents
{
  if ([(NSMutableArray *)self->_eventQueue count])
  {
    id v5 = [(BSEventQueue *)self acquireLockForReason:@"FlushAllEvents"];
    while ([(NSMutableArray *)self->_eventQueue count])
    {
      v3 = [(NSMutableArray *)self->_eventQueue firstObject];
      if (v3)
      {
        [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
        [(BSEventQueue *)self _noteWillExecuteEvent:v3];
        uint64_t v4 = v3[1];
        if (v4) {
          (*(void (**)(void))(v4 + 16))();
        }
      }
    }
    [v5 relinquish];
  }
}

- (BSEventQueue)initWithName:(id)a3 onQueue:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)BSEventQueue;
  uint64_t v6 = [(BSEventQueue *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [a3 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    objc_storeStrong((id *)&v6->_queue, a4);
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventQueue = v6->_eventQueue;
    v6->_eventQueue = v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    eventQueueLocks = v6->_eventQueueLocks;
    v6->_eventQueueLocks = (NSHashTable *)v11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingEvent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventQueueLocks, 0);
}

- (void)cancelEventsWithName:(id)a3
{
  if ([(NSMutableArray *)self->_eventQueue count])
  {
    eventQueue = self->_eventQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __37__BSEventQueue_cancelEventsWithName___block_invoke;
    v7[3] = &unk_1E5445E78;
    v7[4] = a3;
    uint64_t v6 = [(NSMutableArray *)eventQueue indexesOfObjectsPassingTest:v7];
    if ([v6 count])
    {
      -[BSEventQueue _noteWillCancelEventsWithName:count:](self, "_noteWillCancelEventsWithName:count:", a3, [v6 count]);
      [(NSMutableArray *)self->_eventQueue removeObjectsAtIndexes:v6];
    }
  }
}

- (void)flushEvents:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    objc_super v14 = [(BSEventQueue *)self acquireLockForReason:@"FlushEvents"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = a3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [(NSMutableArray *)self->_eventQueue indexOfObjectIdenticalTo:v9];
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v11 = BSLogCommon();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v13 = [(BSEventQueue *)self succinctDescription];
              *(_DWORD *)buf = 138543618;
              long long v20 = v13;
              __int16 v21 = 2114;
              uint64_t v22 = v9;
              _os_log_error_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Provided event is not a member. Ignoring: %{public}@", buf, 0x16u);
            }
          }
          else
          {
            [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:v10];
            [(BSEventQueue *)self _noteWillExecuteEvent:v9];
            if (v9)
            {
              uint64_t v12 = *(void *)(v9 + 8);
              if (v12) {
                (*(void (**)(void))(v12 + 16))();
              }
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v6);
    }

    [v14 relinquish];
  }
}

- (BSEventQueue)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSEventQueue.m" lineNumber:25 description:@"wrong initializer"];

  return self;
}

- (NSString)description
{
  return (NSString *)[(BSEventQueue *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_eventQueue count] == 0;
}

- (void)flushPendingEvents
{
  id v3 = (id)[(NSMutableArray *)self->_eventQueue copy];
  -[BSEventQueue flushEvents:](self, "flushEvents:");
}

uint64_t __37__BSEventQueue_cancelEventsWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasEventWithPrefix:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_eventQueue;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
        char v9 = [v8 hasPrefix:a3];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasEventWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_eventQueue;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
        char v9 = [v8 isEqualToString:a3];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)succinctDescription
{
  uint64_t v2 = [(BSEventQueue *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:0 skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSEventQueue *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [(BSEventQueue *)self succinctDescriptionBuilder];
  if ([(NSHashTable *)self->_eventQueueLocks count]
    || [(NSMutableArray *)self->_eventQueue count]
    || self->_executingEvent)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__BSEventQueue_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E54456B8;
    id v10 = v5;
    uint64_t v11 = self;
    [v10 appendBodySectionWithName:0 multilinePrefix:a3 block:v9];
  }
  else
  {
    id v7 = (id)[v5 appendObject:@"(none)" withName:@"locks"];
    id v8 = (id)[v5 appendObject:@"(none)" withName:@"pending events"];
  }
  return v5;
}

void __54__BSEventQueue_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"executingEvent"];
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"queued events" skipIfEmpty:1];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) allObjects];
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:");
}

- (NSString)name
{
  return self->_name;
}

@end