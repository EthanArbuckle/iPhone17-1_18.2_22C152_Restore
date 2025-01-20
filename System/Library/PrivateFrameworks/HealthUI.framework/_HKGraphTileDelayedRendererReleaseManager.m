@interface _HKGraphTileDelayedRendererReleaseManager
+ (id)singleton;
+ (void)handleDelayedRendererRelease:(id)a3 lastAssignmentTime:(double)a4;
- (NSMutableArray)delayedEntries;
- (_HKGraphTileDelayedRendererReleaseManager)init;
- (os_unfair_lock_s)entriesLock;
- (void)addRenderForDelayedRelease:(id)a3 lastAssignmentTime:(double)a4;
- (void)releaseExpiredImageRenderers:(double)a3;
- (void)setDelayedEntries:(id)a3;
@end

@implementation _HKGraphTileDelayedRendererReleaseManager

- (_HKGraphTileDelayedRendererReleaseManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKGraphTileDelayedRendererReleaseManager;
  v2 = [(_HKGraphTileDelayedRendererReleaseManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_entriesLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    delayedEntries = v3->_delayedEntries;
    v3->_delayedEntries = v4;
  }
  return v3;
}

+ (void)handleDelayedRendererRelease:(id)a3 lastAssignmentTime:(double)a4
{
  id v7 = a3;
  v5 = +[_HKGraphTileDelayedRendererReleaseManager singleton];
  double v6 = CACurrentMediaTime();
  if (v6 - a4 < 3.0) {
    [v5 addRenderForDelayedRelease:v7 lastAssignmentTime:a4];
  }
  [v5 releaseExpiredImageRenderers:v6];
}

+ (id)singleton
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___HKGraphTileDelayedRendererReleaseManager_singleton__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleton_pred != -1) {
    dispatch_once(&singleton_pred, block);
  }
  v2 = (void *)singleton_singletonDelayedRendererReleaseManager;
  return v2;
}

- (void)addRenderForDelayedRelease:(id)a3 lastAssignmentTime:(double)a4
{
  id v6 = a3;
  v9 = [[_HKGraphTileDelayedRendererEntry alloc] initWithImageRenderer:v6 lastAssignmentTime:a4];

  p_entriesLock = &self->_entriesLock;
  os_unfair_lock_lock(&self->_entriesLock);
  v8 = [(_HKGraphTileDelayedRendererReleaseManager *)self delayedEntries];
  [v8 addObject:v9];

  os_unfair_lock_unlock(p_entriesLock);
}

- (void)releaseExpiredImageRenderers:(double)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_entriesLock = &self->_entriesLock;
  os_unfair_lock_lock(&self->_entriesLock);
  id v6 = [(_HKGraphTileDelayedRendererReleaseManager *)self delayedEntries];
  uint64_t v7 = [v6 count];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [(_HKGraphTileDelayedRendererReleaseManager *)self delayedEntries];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = v7 - 45;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v15 = v11 + v10;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v8);
        }
        if (v11 < v12 || ([*(id *)(*((void *)&v27 + 1) + 8 * v14) expiredAtTime:a3] & 1) != 0)
        {

          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v16 = [(_HKGraphTileDelayedRendererReleaseManager *)self delayedEntries];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = 0;
            uint64_t v20 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v24 != v20) {
                  objc_enumerationMutation(v16);
                }
                if (v19 + i >= v12)
                {
                  v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
                  if (([v22 expiredAtTime:a3] & 1) == 0) {
                    [v8 addObject:v22];
                  }
                }
              }
              v19 += v18;
              uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v18);
          }

          [(_HKGraphTileDelayedRendererReleaseManager *)self setDelayedEntries:v8];
          goto LABEL_22;
        }
        ++v14;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t v11 = v15;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  os_unfair_lock_unlock(p_entriesLock);
}

- (os_unfair_lock_s)entriesLock
{
  return self->_entriesLock;
}

- (NSMutableArray)delayedEntries
{
  return self->_delayedEntries;
}

- (void)setDelayedEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end