@interface BPSWindower
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BOOL)completed;
- (BPSPublisher)upstream;
- (BPSWindowAssigner)assigner;
- (BPSWindower)initWithUpstream:(id)a3 key:(id)a4 assigner:(id)a5;
- (NSArray)bookmarkableUpstreams;
- (NSMutableDictionary)windows;
- (id)firstCompletedWindow;
- (id)firstCompletedWindowShouldRemove:(BOOL)a3;
- (id)key;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (void)reset;
- (void)setKey:(id)a3;
- (void)setWindows:(id)a3;
- (void)subscribe:(id)a3;
- (void)updateWindowsWithEvent:(id)a3;
@end

@implementation BPSWindower

- (BPSWindower)initWithUpstream:(id)a3 key:(id)a4 assigner:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BPSWindower;
  v12 = [(BPSWindower *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    uint64_t v14 = [v10 copy];
    id key = v13->_key;
    v13->_id key = (id)v14;

    objc_storeStrong((id *)&v13->_assigner, a5);
    uint64_t v16 = objc_opt_new();
    windows = v13->_windows;
    v13->_windows = (NSMutableDictionary *)v16;
  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v6 = [[_BPSWindowerInner alloc] initWithDownstream:v4 key:self->_key assigner:self->_assigner];

  v5 = [(BPSWindower *)self upstream];
  [v5 subscribe:v6];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSWindower *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)updateWindowsWithEvent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (*((void (**)(void))self->_key + 2))();
  v6 = (void *)[v5 copyWithZone:0];

  v7 = [(BPSWindower *)self windows];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [(BPSWindower *)self windows];
    id v10 = [v9 objectForKeyedSubscript:v6];
  }
  else
  {
    id v9 = objc_opt_new();
    id v11 = [(BPSWindower *)self windows];
    [v11 setObject:v9 forKeyedSubscript:v6];

    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  v12 = [(BPSWindower *)self assigner];
  v22 = v4;
  v13 = [v12 updateAndReturnNewWindowStates:v10 input:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([v10 containsObject:v19] & 1) == 0)
        {
          v20 = [(BPSWindower *)self windows];
          v21 = [v20 objectForKeyedSubscript:v6];
          [v21 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }
}

- (id)firstCompletedWindow
{
  return [(BPSWindower *)self firstCompletedWindowShouldRemove:1];
}

- (id)firstCompletedWindowShouldRemove:(BOOL)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__2;
  long long v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v5 = [(BPSWindower *)self windows];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke;
  v12[3] = &unk_1E5E765D8;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  BOOL v13 = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  if (v15[5] && v21[5])
  {
    v6 = [BPSWindowerInput alloc];
    v7 = [(id)v15[5] aggregate];
    uint64_t v8 = v21[5];
    id v9 = [(id)v15[5] metadata];
    id v10 = [(BPSWindowerInput *)v6 initWithAggregate:v7 key:v8 metadata:v9];
  }
  else
  {
    id v10 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke_2;
  v11[3] = &unk_1E5E765B0;
  v11[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 40);
  id v9 = v7;
  id v12 = v9;
  uint64_t v14 = &v15;
  [v8 enumerateObjectsUsingBlock:v11];
  id v10 = (void *)v16[5];
  if (v10)
  {
    if (*(unsigned char *)(a1 + 56)) {
      objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
    }
    *a4 = 1;
  }

  _Block_object_dispose(&v15, 8);
}

void __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if (([v13 completed] & 1) != 0
    || ([*(id *)(a1 + 32) upstream],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 completed],
        v8,
        v9))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (id)nextEvent
{
  v3 = [(BPSWindower *)self firstCompletedWindow];
  if (v3) {
    goto LABEL_2;
  }
  v6 = [(BPSWindower *)self upstream];
  id v7 = [v6 nextEvent];

  if (v7)
  {
    while (1)
    {
      [(BPSWindower *)self updateWindowsWithEvent:v7];
      id v8 = [(BPSWindower *)self firstCompletedWindow];
      if (v8) {
        break;
      }
      int v9 = [(BPSWindower *)self upstream];
      uint64_t v10 = [v9 nextEvent];

      id v7 = (void *)v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    id v4 = v8;
  }
  else
  {
LABEL_9:
    uint64_t v11 = [(BPSWindower *)self upstream];
    int v12 = [v11 completed];

    if (v12)
    {
      v3 = [(BPSWindower *)self firstCompletedWindow];
      if (v3)
      {
LABEL_2:
        id v4 = v3;
        goto LABEL_3;
      }
    }
    id v4 = 0;
  }
LABEL_3:

  return v4;
}

- (BOOL)completed
{
  v3 = [(BPSWindower *)self firstCompletedWindowShouldRemove:0];

  BOOL result = 0;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BPSWindower;
    return [(BPSPublisher *)&v5 completed];
  }
  return result;
}

- (void)reset
{
  v3 = objc_opt_new();
  [(BPSWindower *)self setWindows:v3];

  v4.receiver = self;
  v4.super_class = (Class)BPSWindower;
  [(BPSPublisher *)&v4 reset];
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    id v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_super v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BPSWindowAssigner)assigner
{
  return self->_assigner;
}

- (NSMutableDictionary)windows
{
  return self->_windows;
}

- (void)setWindows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BPSWindower alloc];
  int v9 = [v7 objectAtIndexedSubscript:0];

  uint64_t v10 = [v6 key];
  uint64_t v11 = [v6 assigner];
  int v12 = [(BPSWindower *)v8 initWithUpstream:v9 key:v10 assigner:v11];

  return v12;
}

- (NSArray)bookmarkableUpstreams
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(BPSWindower *)self upstream];

  if (v3)
  {
    objc_super v4 = [(BPSWindower *)self upstream];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    objc_super v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BPSWindower(BMBookmarkOperators) bookmarkableUpstreams](v4);
    }
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

@end