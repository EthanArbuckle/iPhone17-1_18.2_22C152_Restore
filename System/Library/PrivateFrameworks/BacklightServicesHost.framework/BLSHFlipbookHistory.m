@interface BLSHFlipbookHistory
- (BLSHFlipbookHistory)initWithFrameLimit:(unint64_t)a3 memoryLimit:(unint64_t)a4;
- (NSArray)allFrames;
- (id)frameWithUUID:(id)a3;
- (unint64_t)memoryUsage;
- (void)addRenderedFrameToHistory:(id)a3;
@end

@implementation BLSHFlipbookHistory

- (BLSHFlipbookHistory)initWithFrameLimit:(unint64_t)a3 memoryLimit:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BLSHFlipbookHistory;
  v6 = [(BLSHFlipbookHistory *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_frameLimit = a3;
    v6->_memoryLimit = a4;
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    lock_frames = v7->_lock_frames;
    v7->_lock_frames = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a3];
    lock_framesDict = v7->_lock_framesDict;
    v7->_lock_framesDict = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (unint64_t)memoryUsage
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_lock_frames;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "retainedMemoryUsage", (void)v11);
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addRenderedFrameToHistory:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = +[BLSDiagnosticFlipbookFrame createWithFrame:v4];
  [(NSMutableArray *)self->_lock_frames addObject:v5];
  lock_framesDict = self->_lock_framesDict;
  unint64_t v7 = [v5 uuid];
  [(NSMutableDictionary *)lock_framesDict setObject:v5 forKey:v7];

  if ([(NSMutableArray *)self->_lock_frames count] > self->_frameLimit)
  {
    uint64_t v8 = [(NSMutableArray *)self->_lock_frames objectAtIndex:0];
    v9 = [v8 uuid];

    [(NSMutableArray *)self->_lock_frames removeObjectAtIndex:0];
    [(NSMutableDictionary *)self->_lock_framesDict removeObjectForKey:v9];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  lock_frames = self->_lock_frames;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__BLSHFlipbookHistory_addRenderedFrameToHistory___block_invoke;
  v11[3] = &unk_264533700;
  v11[4] = self;
  v11[5] = v15;
  v11[6] = v14;
  v11[7] = v12;
  [(NSMutableArray *)lock_frames enumerateObjectsWithOptions:2 usingBlock:v11];
  os_unfair_lock_unlock(&self->_lock);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

void __49__BLSHFlipbookHistory_addRenderedFrameToHistory___block_invoke(void *a1, void *a2, int a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = [v7 retainedMemoryUsage];
  if (v8)
  {
    uint64_t v9 = *(void *)(a1[5] + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      uint64_t v10 = *(void *)(a1[6] + 8);
      unint64_t v11 = *(void *)(v10 + 24) + v8;
      if (v11 <= *(void *)(a1[4] + 16))
      {
        *(void *)(v10 + 24) = v11;
        ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
      }
      else
      {
        *(unsigned char *)(v9 + 24) = 1;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if ([v7 isRetainingSurface])
    {
      [v7 stopRetainingSurface];
      long long v12 = bls_diagnostics_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = a1[4];
        int v14 = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
        v15 = [MEMORY[0x263F29A70] sharedFormatter];
        char v16 = [v15 stringFromByteCount:*(void *)(*(void *)(a1[6] + 8) + 24)];
        v17 = [MEMORY[0x263F29A70] sharedFormatter];
        v18 = [v17 stringFromByteCount:*(void *)(a1[4] + 16)];
        v19 = objc_msgSend(v7, "bls_shortLoggingString");
        int v20 = 134219266;
        uint64_t v21 = v13;
        __int16 v22 = 1024;
        int v23 = a3;
        __int16 v24 = 1024;
        int v25 = v14;
        __int16 v26 = 2114;
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v19;
        _os_log_debug_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "%p frame %u, reached memory limit (%u — %{public}@/%{public}@), purging %{public}@", (uint8_t *)&v20, 0x36u);
      }
    }
    else
    {
      *a4 = 1;
    }
  }
}

- (NSArray)allFrames
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_lock_frames bs_reverse];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)frameWithUUID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_lock_framesDict objectForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_framesDict, 0);

  objc_storeStrong((id *)&self->_lock_frames, 0);
}

@end