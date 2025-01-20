@interface HMMTagDispatcher
- (HMMTagDispatcher)initWithWorkQueue:(id)a3;
- (HMMTagDispatcher)initWithWorkQueue:(id)a3 startTime:(int64_t)a4;
- (NSMutableDictionary)tagObservers;
- (NSPointerArray)allTagProcessors;
- (OS_dispatch_queue)workQueue;
- (int64_t)nextStaleCheckTime;
- (void)registerTagObserver:(id)a3 forTags:(id)a4;
- (void)setAllTagProcessors:(id)a3;
- (void)setNextStaleCheckTime:(int64_t)a3;
- (void)setTagObservers:(id)a3;
- (void)submitTaggedEvent:(id)a3 processorList:(id)a4;
- (void)unregisterTagObserver:(id)a3 forTags:(id)a4;
@end

@implementation HMMTagDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_allTagProcessors, 0);
  objc_storeStrong((id *)&self->_tagObservers, 0);
}

- (void)setNextStaleCheckTime:(int64_t)a3
{
  self->_nextStaleCheckTime = a3;
}

- (int64_t)nextStaleCheckTime
{
  return self->_nextStaleCheckTime;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setAllTagProcessors:(id)a3
{
}

- (NSPointerArray)allTagProcessors
{
  return self->_allTagProcessors;
}

- (void)setTagObservers:(id)a3
{
}

- (NSMutableDictionary)tagObservers
{
  return self->_tagObservers;
}

- (void)submitTaggedEvent:(id)a3 processorList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke;
  block[3] = &unk_1E69FD798;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke(id *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = [a1[4] tagTime];
  v2 = [a1[5] tagObservers];
  v3 = [a1[4] tagName];
  v4 = [v2 objectForKey:v3];

  if (v4)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v33 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v11 = a1[4];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke_2;
          v43[3] = &unk_1E69FD7C0;
          uint64_t v46 = v34;
          id v12 = a1[6];
          id v13 = a1[5];
          id v44 = v12;
          id v45 = v13;
          [v10 observeTaggedEvent:v11 addProcessorBlock:v43];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v7);
    }

    v4 = v33;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = objc_msgSend(a1[6], "processors", v33);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if ([v19 isActive])
        {
          v20 = [v19 tagProcessingBlocks];
          v21 = [a1[4] tagName];
          v22 = [v20 objectForKey:v21];

          if (v22)
          {
            ((void (**)(void, void *, id))v22)[2](v22, v19, a1[4]);
            [v19 setLastUpdate:v34];
          }
        }
        else
        {
          [a1[6] removeProcessor:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v16);
  }

  if (v34 >= [a1[5] nextStaleCheckTime])
  {
    v23 = [a1[5] allTagProcessors];
    [v23 addPointer:0];

    v24 = [a1[5] allTagProcessors];
    [v24 compact];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v25 = [a1[5] allTagProcessors];
    v26 = [v25 allObjects];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v35 + 1) + 8 * k);
          if ([v31 lastUpdate] <= v34 - 3600000)
          {
            [v31 closeForReason:2];
            v32 = [a1[5] allTagProcessors];
            objc_msgSend(v32, "hmf_removeObject:", v31);
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v28);
    }

    [a1[5] setNextStaleCheckTime:v34 + 3600000];
  }
}

void __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  [v4 setLastUpdate:v3];
  [*(id *)(a1 + 32) addProcessor:v4];
  id v5 = [*(id *)(a1 + 40) allTagProcessors];
  objc_msgSend(v5, "hmf_addObject:", v4);
}

- (void)unregisterTagObserver:(id)a3 forTags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMMTagDispatcher_unregisterTagObserver_forTags___block_invoke;
  block[3] = &unk_1E69FD798;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __50__HMMTagDispatcher_unregisterTagObserver_forTags___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "tagObservers", (void)v10);
        id v9 = [v8 objectForKey:v7];

        [v9 removeObjectIdenticalTo:*(void *)(a1 + 48)];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)registerTagObserver:(id)a3 forTags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMMTagDispatcher_registerTagObserver_forTags___block_invoke;
  block[3] = &unk_1E69FD798;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __48__HMMTagDispatcher_registerTagObserver_forTags___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "tagObservers", (void)v11);
        id v9 = [v8 objectForKey:v7];

        if (!v9)
        {
          id v9 = [MEMORY[0x1E4F1CA48] array];
          id v10 = [*(id *)(a1 + 40) tagObservers];
          [v10 setObject:v9 forKey:v7];
        }
        [v9 addObject:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (HMMTagDispatcher)initWithWorkQueue:(id)a3 startTime:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMMTagDispatcher;
  uint64_t v8 = [(HMMTagDispatcher *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    tagObservers = v8->_tagObservers;
    v8->_tagObservers = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    allTagProcessors = v8->_allTagProcessors;
    v8->_allTagProcessors = (NSPointerArray *)v11;

    objc_storeStrong((id *)&v8->_workQueue, a3);
    v8->_nextStaleCheckTime = a4 + 3600000;
  }

  return v8;
}

- (HMMTagDispatcher)initWithWorkQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTagDispatcher *)self initWithWorkQueue:v4 startTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240];

  return v5;
}

@end