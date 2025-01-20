@interface BWIOSurfaceTracking
+ (uint64_t)defaultSurfaceTracking;
+ (void)initialize;
+ (void)noteSurfaceIDInUse:(unsigned int)a3 byClient:(id)a4;
+ (void)noteSurfaceIDNoLongerInUse:(unsigned int)a3 byClient:(id)a4;
+ (void)trackPixelBuffer:(__CVBuffer *)a3 surfaceUseCountIsZeroHandler:(id)a4;
- (BWIOSurfaceTracking)init;
- (os_unfair_lock_s)noteSurfaceIDNoLongerInUse:(os_unfair_lock_s *)result;
- (void)dealloc;
- (void)noteSurfaceIDInUse:(uint64_t)a1;
- (void)trackPixelBuffer:(uint64_t)a3 surfaceUseCountIsZeroHandler:;
@end

@implementation BWIOSurfaceTracking

+ (void)initialize
{
}

+ (void)trackPixelBuffer:(__CVBuffer *)a3 surfaceUseCountIsZeroHandler:(id)a4
{
  if (a4)
  {
    if (CVPixelBufferGetIOSurface(a3))
    {
      uint64_t v6 = +[BWIOSurfaceTracking defaultSurfaceTracking]();
      -[BWIOSurfaceTracking trackPixelBuffer:surfaceUseCountIsZeroHandler:](v6, a3, (uint64_t)a4);
    }
    else
    {
      v7 = (void (*)(id))*((void *)a4 + 2);
      v7(a4);
    }
  }
}

+ (uint64_t)defaultSurfaceTracking
{
  if (defaultSurfaceTracking_sOnceToken != -1) {
    dispatch_once(&defaultSurfaceTracking_sOnceToken, &__block_literal_global_65_0);
  }
  return defaultSurfaceTracking_sDefaultSurfaceTracking;
}

- (void)trackPixelBuffer:(uint64_t)a3 surfaceUseCountIsZeroHandler:
{
  if (a1)
  {
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    v7 = [[BWTrackedSurface alloc] initWithSurface:IOSurface handler:a3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    [*(id *)(a1 + 16) addObject:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__BWIOSurfaceTracking_trackPixelBuffer_surfaceUseCountIsZeroHandler___block_invoke;
    v8[3] = &unk_1E5C2CA80;
    v8[4] = a1;
    v8[5] = v7;
    v8[6] = a3;
    v8[7] = IOSurface;
    +[BWObjectLifetimeTracker trackAttachmentBearer:pixelBuffer deallocHandler:v8];
  }
}

+ (void)noteSurfaceIDInUse:(unsigned int)a3 byClient:(id)a4
{
  uint64_t v5 = +[BWIOSurfaceTracking defaultSurfaceTracking]();
  -[BWIOSurfaceTracking noteSurfaceIDInUse:](v5, a3);
}

- (void)noteSurfaceIDInUse:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = *(void **)(a1 + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (IOSurfaceGetID((IOSurfaceRef)[v10 surface]) == a2) {
            objc_msgSend(v10, "setClientUseCount:", objc_msgSend(v10, "clientUseCount") + 1);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    os_unfair_lock_unlock(v4);
  }
}

+ (void)noteSurfaceIDNoLongerInUse:(unsigned int)a3 byClient:(id)a4
{
  uint64_t v5 = (os_unfair_lock_s *)+[BWIOSurfaceTracking defaultSurfaceTracking]();
  -[BWIOSurfaceTracking noteSurfaceIDNoLongerInUse:](v5, a3);
}

- (os_unfair_lock_s)noteSurfaceIDNoLongerInUse:(os_unfair_lock_s *)result
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = result;
    lock = result + 2;
    os_unfair_lock_lock(result + 2);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v4 = *(void **)&v3[4]._os_unfair_lock_opaque;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v4);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (IOSurfaceGetID((IOSurfaceRef)[v11 surface]) == a2)
          {
            objc_msgSend(v11, "setClientUseCount:", objc_msgSend(v11, "clientUseCount") - 1);
            if ([v11 owningPixelBufferDeallocated]
              && ![v11 clientUseCount])
            {
              if (!v7) {
                uint64_t v7 = (void *)[MEMORY[0x1E4F28E60] indexSet];
              }
              [v7 addIndex:v8 + i];
            }
            if (![v11 clientUseCount]) {
              [v11 owningPixelBufferDeallocated];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        v8 += i;
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    if ([v7 count])
    {
      long long v12 = (void *)[*(id *)&v3[4]._os_unfair_lock_opaque objectsAtIndexes:v7];
      [*(id *)&v3[4]._os_unfair_lock_opaque removeObjectsAtIndexes:v7];
    }
    else
    {
      long long v12 = 0;
    }
    os_unfair_lock_unlock(lock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    result = (os_unfair_lock_s *)[v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (result)
    {
      long long v13 = result;
      uint64_t v14 = *(void *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v15);
          if (IOSurfaceIsInUse((IOSurfaceRef)[v16 surface])) {
            +[BWIOSurfacePoller trackSurface:useCountIsZeroHandler:](BWIOSurfacePoller, "trackSurface:useCountIsZeroHandler:", [v16 surface], objc_msgSend(v16, "handler"));
          }
          else {
            (*(void (**)(void))([v16 handler] + 16))();
          }
          v15 = (os_unfair_lock_s *)((char *)v15 + 1);
        }
        while (v13 != v15);
        result = (os_unfair_lock_s *)[v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        long long v13 = result;
      }
      while (result);
    }
  }
  return result;
}

BWIOSurfaceTracking *__45__BWIOSurfaceTracking_defaultSurfaceTracking__block_invoke()
{
  result = objc_alloc_init(BWIOSurfaceTracking);
  defaultSurfaceTracking_sDefaultSurfaceTracking = (uint64_t)result;
  return result;
}

- (BWIOSurfaceTracking)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWIOSurfaceTracking;
  v2 = [(BWIOSurfaceTracking *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_trackedSurfacesLock._os_unfair_lock_opaque = 0;
    v2->_trackedSurfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfaceTracking;
  [(BWIOSurfaceTracking *)&v3 dealloc];
}

void __69__BWIOSurfaceTracking_trackPixelBuffer_surfaceUseCountIsZeroHandler___block_invoke(uint64_t a1)
{
  int v2 = IOSurfaceIsInUse(*(IOSurfaceRef *)(a1 + 56));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 40) setOwningPixelBufferDeallocated:1];
  int v3 = [*(id *)(a1 + 40) clientUseCount];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v2) {
    BOOL v5 = v3 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int v6 = v3;
    [*(id *)(v4 + 16) removeObjectIdenticalTo:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    if (v2)
    {
      if (v6 <= 0)
      {
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 56);
        +[BWIOSurfacePoller trackSurface:v8 useCountIsZeroHandler:v9];
      }
    }
    else
    {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v7();
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
}

@end