@interface BWPixelBufferPool
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- (BOOL)isPixelBufferAvailable;
- (BOOL)prefetch:(int)a3 lastEmittedSurfaceID:(unsigned int)a4;
- (BOOL)usesMemoryPool;
- (BOOL)waitForAvailablePixelBuffer;
- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5;
- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9;
- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6;
- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9;
- (CVPixelBufferRef)_newPixelBuffer;
- (NSString)description;
- (NSString)name;
- (__CFDictionary)cvPixelBufferPoolAuxAttributes;
- (__CVPixelBufferPool)cvPixelBufferPool;
- (int)preallocate;
- (uint64_t)_ensurePool;
- (uint64_t)_waitForBackPressureSemaphoreIfNeededAndReportIfWaited:(uint64_t)a1;
- (unint64_t)capacity;
- (unint64_t)height;
- (unint64_t)sliceCount;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (void)dealloc;
- (void)enumerateSurfacesUsingBlock:(id)a3;
- (void)flushToMinimumCapacity:(unint64_t)a3;
- (void)preallocateWithCompletionHandler:(id)a3;
- (void)prefetchWithCompletionHandler:(id)a3;
- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4;
- (void)setCapacity:(unint64_t)a3;
@end

@implementation BWPixelBufferPool

- (void)dealloc
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool) {
    CFRelease(pixelBufferPool);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWPixelBufferPool;
  [(BWPixelBufferPool *)&v4 dealloc];
}

- (void)preallocateWithCompletionHandler:(id)a3
{
  if (!self->_clientProvidesPool)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__BWPixelBufferPool_preallocateWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5C24E50;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(global_queue, v6);
  }
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6
{
  LOBYTE(v7) = 0;
  return [(BWPixelBufferPool *)self initWithVideoFormat:a3 capacity:a4 name:a5 clientProvidesPool:0 memoryPool:a6 providesBackPressure:0 reportSlowBackPressureAllocations:v7];
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"no format provided" userInfo:0]);
  }
  BOOL v9 = a8;
  v16.receiver = self;
  v16.super_class = (Class)BWPixelBufferPool;
  v14 = [(BWPixelBufferPool *)&v16 init];
  if (v14)
  {
    v14->_videoFormat = (BWVideoFormat *)a3;
    v14->_capacity = a4;
    v14->_name = 0;
    v14->_pixelBufferPoolConfigurationLock._os_unfair_lock_opaque = 0;
    v14->_clientProvidesPool = a6;
    v14->_memoryPool = (BWMemoryPool *)a7;
    v14->_providesBackPressure = v9;
    v14->_reportSlowBackPressureAllocations = a9;
    if (v9) {
      v14->_backPressureSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a4);
    }
  }
  return v14;
}

- (__CVPixelBufferPool)cvPixelBufferPool
{
  return self->_pixelBufferPool;
}

- (CVPixelBufferRef)_newPixelBuffer
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CVPixelBufferRef pixelBufferOut = 0;
    if (-[BWPixelBufferPool _ensurePool]((uint64_t)result)) {
      goto LABEL_8;
    }
    -[BWPixelBufferPool _waitForBackPressureSemaphoreIfNeededAndReportIfWaited:](v1, *(unsigned __int8 *)(v1 + 97));
    CVReturn v2 = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CVPixelBufferPoolRef *)(v1 + 56), *(CFDictionaryRef *)(v1 + 64), &pixelBufferOut);
    if (*(unsigned char *)(v1 + 96))
    {
      uint64_t v3 = *(void *)(v1 + 104);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __36__BWPixelBufferPool__newPixelBuffer__block_invoke;
      v4[3] = &unk_1E5C24430;
      v4[4] = v3;
      +[BWIOSurfaceTracking trackPixelBuffer:pixelBufferOut surfaceUseCountIsZeroHandler:v4];
    }
    if (v2) {
LABEL_8:
    }
      FigDebugAssert3();
    return pixelBufferOut;
  }
  return result;
}

- (uint64_t)_ensurePool
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 32))
    {
      if (*(void *)(result + 56))
      {
        return 0;
      }
      else
      {
        return FigSignalErrorAt();
      }
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(result + 48));
      if (!*(void *)(v1 + 56))
      {
        CVReturn v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
        uint64_t v3 = [NSNumber numberWithUnsignedLong:*(void *)(v1 + 16)];
        [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F24D90]];
        [v2 setObject:&unk_1EFAFE190 forKeyedSubscript:*MEMORY[0x1E4F24D88]];
        uint64_t v4 = *(void *)(v1 + 24);
        if (v4) {
          [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F24D98]];
        }
        v5 = (void *)[*(id *)(v1 + 8) pixelBufferAttributes];
        if (*(void *)(v1 + 88) && ([*(id *)(v1 + 8) memoryPoolUseAllowed] & 1) != 0
          || *(void *)(v1 + 40)
          || [*(id *)(v1 + 8) colorSpaceProperties])
        {
          v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
          if (*(void *)(v1 + 40)) {
            FigCFDictionaryAddEntriesToDictionaryWithRecursion();
          }
          if ([*(id *)(v1 + 8) colorSpaceProperties])
          {
            id v6 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", [*(id *)(v1 + 8) colorSpaceProperties]);
            [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F24990]];
          }
          if ([*(id *)(v1 + 8) memoryPoolUseAllowed]) {
            [*(id *)(v1 + 88) enableForPixelBufferAttributes:v5];
          }
        }
        *(_DWORD *)(v1 + 80) = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)v2, (CFDictionaryRef)v5, (CVPixelBufferPoolRef *)(v1 + 56));
        uint64_t v7 = *MEMORY[0x1E4F24D80];
        v8[0] = [NSNumber numberWithUnsignedLong:*(void *)(v1 + 16)];
        *(void *)(v1 + 64) = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
      return *(unsigned int *)(v1 + 80);
    }
  }
  return result;
}

- (uint64_t)_waitForBackPressureSemaphoreIfNeededAndReportIfWaited:(uint64_t)a1
{
  if (a1 && *(unsigned char *)(a1 + 96))
  {
    uint64_t v3 = *(NSObject **)(a1 + 104);
    if (v3)
    {
      if (a2)
      {
        atomic_fetch_add((atomic_ullong *volatile)(a1 + 112), 1uLL);
        if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 104), 0))
        {
          uint64_t v4 = *(NSObject **)(a1 + 104);
          int64_t v5 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds ? 1000000000 : 0;
          dispatch_time_t v6 = dispatch_time(0, v5);
          if (dispatch_semaphore_wait(v4, v6))
          {
            uint64_t v7 = 0;
            do
            {
              int v8 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds;
              if (kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds) {
                uint64_t v9 = 1000;
              }
              else {
                uint64_t v9 = 0;
              }
              v7 += v9;
              if (dword_1EB4C55D0)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                int v8 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds;
              }
              v11 = *(NSObject **)(a1 + 104);
              if (v8) {
                int64_t v12 = 1000000000;
              }
              else {
                int64_t v12 = 0;
              }
              dispatch_time_t v13 = dispatch_time(0, v12);
            }
            while (dispatch_semaphore_wait(v11, v13));
            if (dword_1EB4C55D0)
            {
              v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
      else
      {
        dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
  return 0;
}

- (void)setCapacity:(unint64_t)a3
{
  if (self->_clientProvidesPool)
  {
    self->_capacity = a3;
  }
  else
  {
    -[BWPixelBufferPool _ensurePool]((uint64_t)self);
    if (!CVPixelBufferPoolSetMinBufferCount())
    {
      self->_capacity = a3;
      id v5 = (id)[(NSDictionary *)self->_pixelBufferPoolAuxAttributes mutableCopy];
      uint64_t v6 = [NSNumber numberWithUnsignedLong:a3];
      [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F24D80]];

      self->_pixelBufferPoolAuxAttributes = (NSDictionary *)[v5 copy];
    }
  }
}

- (int)preallocate
{
  if (!self->_clientProvidesPool)
  {
    uint64_t v4 = (void *)MEMORY[0x1A6272C70]();
    int v5 = -[BWPixelBufferPool _ensurePool]((uint64_t)self);
    if (v5)
    {
      int v2 = v5;
    }
    else
    {
      int v2 = CVPixelBufferPoolPreAllocate();
      if (!v2)
      {
LABEL_5:
        return v2;
      }
    }
    FigDebugAssert3();
    goto LABEL_5;
  }
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds = 1;
  }
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  LOBYTE(v12) = a9;
  v10 = [(BWPixelBufferPool *)self initWithVideoFormat:a3 capacity:a4 name:a5 clientProvidesPool:0 memoryPool:a6 providesBackPressure:a8 reportSlowBackPressureAllocations:v12];
  if (v10) {
    v10->_additionalPixelBufferAttributes = (NSDictionary *)[a7 copy];
  }
  return v10;
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  return [(BWPixelBufferPool *)self initWithVideoFormat:a3 capacity:a4 name:a5 memoryPool:0];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"Can't have NULL pool";
    goto LABEL_22;
  }
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"Can't have NULL attributes";
    goto LABEL_22;
  }
  if (!self->_clientProvidesPool)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"Can't call when clientProvidesPool = NO";
LABEL_22:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v17 userInfo:0]);
  }
  p_pixelBufferPoolConfigurationLock = &self->_pixelBufferPoolConfigurationLock;
  os_unfair_lock_lock(&self->_pixelBufferPoolConfigurationLock);
  if (!self->_pixelBufferPool)
  {
    self->_pixelBufferPool = (__CVPixelBufferPool *)CFRetain(a3);
    int v8 = (NSDictionary *)CFRetain(a4);
    self->_pixelBufferPoolAuxAttributes = v8;
    id v9 = [(NSDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F24D80]];
    if (v9) {
      [v9 intValue];
    }
    if ([(BWVideoFormat *)self->_videoFormat colorSpaceProperties])
    {
      uint64_t v10 = [(__CFDictionary *)CVPixelBufferPoolGetPixelBufferAttributes(a3) objectForKeyedSubscript:*MEMORY[0x1E4F24990]];
      if (v10)
      {
        v11 = (void *)v10;
        id v12 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:[(BWVideoFormat *)self->_videoFormat colorSpaceProperties]];
        uint64_t v13 = 0;
        do
        {
          if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *(uint64_t *)((char *)&v18 + v13)), "isEqual:", objc_msgSend(v12, "objectForKeyedSubscript:", *(uint64_t *)((char *)&v18 + v13))))BOOL v14 = v13 == 16; {
          else
          }
            BOOL v14 = 1;
          v13 += 8;
        }
        while (!v14);
      }
    }
  }
  os_unfair_lock_unlock(p_pixelBufferPoolConfigurationLock);
}

void __54__BWPixelBufferPool_preallocateWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = -[BWPixelBufferPool _ensurePool](*(void *)(a1 + 32));
  if (!v3) {
    uint64_t v3 = CVPixelBufferPoolPreAllocate();
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
}

- (BOOL)prefetch:(int)a3 lastEmittedSurfaceID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4) {
    -[NSMutableSet addObject:](self->_prefetchedSurfaceIDs, "addObject:", [NSNumber numberWithUnsignedInt:*(void *)&a4]);
  }
  int capacity = self->_capacity;
  if ((int)(capacity - [(NSMutableSet *)self->_prefetchedSurfaceIDs count]) <= (int)v4)
  {
    int v7 = self->_capacity;
    uint64_t v4 = v7 - [(NSMutableSet *)self->_prefetchedSurfaceIDs count];
  }
  if ((int)v4 < 1) {
    return (int)v4 < 1;
  }
  unint64_t v8 = 8 * v4;
  id v9 = (CVPixelBufferRef *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0));
  if (v8 >= 0x200) {
    size_t v10 = 512;
  }
  else {
    size_t v10 = 8 * v4;
  }
  bzero((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0), v10);
  if (!-[BWPixelBufferPool _ensurePool]((uint64_t)self))
  {
    uint64_t v22 = (uint64_t)&v22;
    uint64_t v23 = v4;
    uint64_t v11 = v4;
    CFDictionaryRef v12 = (const __CFDictionary *)(id)[(NSDictionary *)self->_pixelBufferPoolAuxAttributes mutableCopy];
    uint64_t v13 = *MEMORY[0x1E4F24DA0];
    CFDictionaryRef v24 = v12;
    [(__CFDictionary *)v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
    bzero((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0), 8 * v4);
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v15 = v4;
    uint64_t v16 = v9;
    do
    {
      CVReturn PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(v14, self->_pixelBufferPool, v24, v16);
      if (PixelBufferWithAuxAttributes) {
        break;
      }
      if (!self->_prefetchedSurfaceIDs) {
        self->_prefetchedSurfaceIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
      uint64_t v18 = *v16++;
      IOSurface = CVPixelBufferGetIOSurface(v18);
      uint64_t ID = IOSurfaceGetID(IOSurface);
      -[NSMutableSet containsObject:](self->_prefetchedSurfaceIDs, "containsObject:", [NSNumber numberWithUnsignedInt:ID]);
      -[NSMutableSet addObject:](self->_prefetchedSurfaceIDs, "addObject:", [NSNumber numberWithUnsignedInt:ID]);
      --v15;
    }
    while (v15);
    LODWORD(v4) = v23;
    do
    {
      if (*v9) {
        CVPixelBufferRelease(*v9);
      }
      ++v9;
      --v11;
    }
    while (v11);
    if (PixelBufferWithAuxAttributes == -6689 || PixelBufferWithAuxAttributes == -6662) {
      return 1;
    }
    return (int)v4 < 1;
  }
  FigDebugAssert3();
  return 0;
}

- (void)prefetchWithCompletionHandler:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__BWPixelBufferPool_prefetchWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C24E50;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

void __51__BWPixelBufferPool_prefetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = -[BWPixelBufferPool _ensurePool](*(void *)(a1 + 32));
  if (!v3) {
    uint64_t v3 = CVPixelBufferPoolPrefetchPages();
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  if (self->_pixelBufferPool && self->_capacity > a3)
  {
    CVPixelBufferPoolSetMinBufferCount();
    CVPixelBufferPoolSetMinBufferCount();
  }
}

intptr_t __36__BWPixelBufferPool__newPixelBuffer__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)waitForAvailablePixelBuffer
{
  if (!self->_providesBackPressure) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Not callable when initialized with _providesBackPressure=NO" userInfo:0]);
  }
  char v3 = -[BWPixelBufferPool _waitForBackPressureSemaphoreIfNeededAndReportIfWaited:]((uint64_t)self, 1);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_backPressureSemaphore);
  return v3;
}

- (BOOL)isPixelBufferAvailable
{
  if (!self->_providesBackPressure) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Not callable when initialized with _providesBackPressure=NO" userInfo:0]);
  }
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_backPressureSemaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_backPressureSemaphore);
  }
  return v3 == 0;
}

- (unsigned)pixelFormat
{
  return [(BWVideoFormat *)self->_videoFormat pixelFormat];
}

- (unint64_t)width
{
  return [(BWVideoFormat *)self->_videoFormat width];
}

- (unint64_t)height
{
  return [(BWVideoFormat *)self->_videoFormat height];
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3 = [(BWVideoFormat *)self->_videoFormat width];
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)[(BWVideoFormat *)self->_videoFormat height] << 32));
}

- (unint64_t)sliceCount
{
  return [(BWVideoFormat *)self->_videoFormat sliceCount];
}

- (__CFDictionary)cvPixelBufferPoolAuxAttributes
{
  return (__CFDictionary *)self->_pixelBufferPoolAuxAttributes;
}

- (BOOL)usesMemoryPool
{
  return self->_memoryPool && [(BWVideoFormat *)self->_videoFormat memoryPoolUseAllowed];
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
}

@end