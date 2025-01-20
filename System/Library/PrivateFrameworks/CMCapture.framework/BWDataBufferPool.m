@interface BWDataBufferPool
+ (void)initialize;
- (BWDataBufferPool)initWithFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6;
- (NSString)name;
- (__CFDictionary)cvDataBufferPoolAuxAttributes;
- (__CVDataBufferPool)cvDataBufferPool;
- (uint64_t)_ensurePool;
- (uint64_t)_newDataBuffer;
- (unint64_t)capacity;
- (unsigned)dataFormat;
- (void)dealloc;
- (void)enumerateSurfacesUsingBlock:(id)a3;
- (void)flushToMinimumCapacity:(unint64_t)a3;
- (void)prefetchWithCompletionHandler:(id)a3;
- (void)setCVDataBufferPool:(__CVDataBufferPool *)a3 attributes:(__CFDictionary *)a4;
- (void)setCapacity:(unint64_t)a3;
@end

@implementation BWDataBufferPool

- (BWDataBufferPool)initWithFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6
{
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"no format provided" userInfo:0]);
  }
  v11.receiver = self;
  v11.super_class = (Class)BWDataBufferPool;
  v9 = [(BWDataBufferPool *)&v11 init];
  if (v9)
  {
    v9->_format = (BWDataBufferBackedFormat *)a3;
    v9->_capacity = a4;
    v9->_name = 0;
    v9->_dataBufferPoolConfigurationLock._os_unfair_lock_opaque = 0;
    v9->_clientProvidesPool = a6;
  }
  return v9;
}

- (__CVDataBufferPool)cvDataBufferPool
{
  return self->_dataBufferPool;
}

- (uint64_t)_ensurePool
{
  v7[1] = *MEMORY[0x1E4F143B8];
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
        v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
        uint64_t v3 = [NSNumber numberWithUnsignedLong:*(void *)(v1 + 16)];
        [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F249C0]];
        [v2 setObject:&unk_1EFAFED48 forKeyedSubscript:*MEMORY[0x1E4F249B8]];
        uint64_t v4 = *(void *)(v1 + 24);
        if (v4) {
          [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F249C8]];
        }
        uint64_t v5 = [*(id *)(v1 + 8) dataBufferAttributes];
        if (*(void *)(v1 + 40))
        {
          [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
          FigCFDictionaryAddEntriesToDictionaryWithRecursion();
        }
        [*(id *)(v1 + 8) dataFormat];
        [*(id *)(v1 + 8) dataBufferSize];
        *(_DWORD *)(v1 + 72) = CVDataBufferPoolCreate();
        uint64_t v6 = *MEMORY[0x1E4F249B0];
        v7[0] = [NSNumber numberWithUnsignedLong:*(void *)(v1 + 16)];
        *(void *)(v1 + 64) = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
      return *(unsigned int *)(v1 + 72);
    }
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  dataBufferPool = self->_dataBufferPool;
  if (dataBufferPool) {
    CFRelease(dataBufferPool);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWDataBufferPool;
  [(BWDataBufferPool *)&v4 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void)setCVDataBufferPool:(__CVDataBufferPool *)a3 attributes:(__CFDictionary *)a4
{
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_super v11 = @"Can't have NULL pool";
    goto LABEL_13;
  }
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_super v11 = @"Can't have NULL attributes";
    goto LABEL_13;
  }
  if (!self->_clientProvidesPool)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_super v11 = @"Can't call when clientProvidesPool = NO";
LABEL_13:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  os_unfair_lock_lock(&self->_dataBufferPoolConfigurationLock);
  if (!self->_dataBufferPool)
  {
    self->_dataBufferPool = (__CVDataBufferPool *)CFRetain(a3);
    v7 = (NSDictionary *)CFRetain(a4);
    self->_dataBufferPoolAuxAttributes = v7;
    id v8 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F249B0]];
    if (v8) {
      [v8 intValue];
    }
  }
  os_unfair_lock_unlock(&self->_dataBufferPoolConfigurationLock);
}

- (void)prefetchWithCompletionHandler:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__BWDataBufferPool_prefetchWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C24E50;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

void __50__BWDataBufferPool_prefetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = -[BWDataBufferPool _ensurePool](*(void *)(a1 + 32));
  if (!v3) {
    uint64_t v3 = CVDataBufferPoolPrefetchPages();
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  if (self->_dataBufferPool && self->_capacity > a3)
  {
    CVDataBufferPoolSetMinBufferCount();
    CVDataBufferPoolSetMinBufferCount();
  }
}

- (uint64_t)_newDataBuffer
{
  if (result)
  {
    if (-[BWDataBufferPool _ensurePool](result) || CVDataBufferPoolCreateDataBuffer())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return 0;
  }
  return result;
}

- (void)setCapacity:(unint64_t)a3
{
  if (self->_clientProvidesPool
    || (-[BWDataBufferPool _ensurePool]((uint64_t)self), !CVDataBufferPoolSetMinBufferCount()))
  {
    self->_capacity = a3;
  }
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)dataFormat
{
  return [(BWDataBufferBackedFormat *)self->_format dataFormat];
}

- (__CFDictionary)cvDataBufferPoolAuxAttributes
{
  return (__CFDictionary *)self->_dataBufferPoolAuxAttributes;
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
}

@end