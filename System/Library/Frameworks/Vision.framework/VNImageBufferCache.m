@interface VNImageBufferCache
+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5;
+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 cropRect:(CGRect)a6;
- (VNImageBufferCache)init;
- (__CVBuffer)cachedBufferWithKey:(id)a3;
- (void)cacheBuffer:(__CVBuffer *)a3 forCacheKey:(id)a4;
- (void)dealloc;
- (void)purgeCacheRepresentationsForOriginalBuffer:(__CVBuffer *)a3;
- (void)removeCachedBufferWithKey:(id)a3;
@end

@implementation VNImageBufferCache

- (void)purgeCacheRepresentationsForOriginalBuffer:(__CVBuffer *)a3
{
  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  int v6 = CFDictionaryContainsValue(self->_pixelBufferReps, a3);
  if (v6) {
    CVPixelBufferRetain(a3);
  }
  CFDictionaryRemoveAllValues(self->_pixelBufferReps);
  if (v6)
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    size_t Width = CVPixelBufferGetWidth(a3);
    v9 = +[VNImageBufferCache cacheKeyWithBufferFormat:PixelFormatType width:Width height:CVPixelBufferGetHeight(a3)];
    CFDictionaryAddValue(self->_pixelBufferReps, v9, a3);
    CVPixelBufferRelease(a3);
  }

  os_unfair_lock_unlock(p_pixelBufferRepsLock);
}

- (void)removeCachedBufferWithKey:(id)a3
{
  id key = a3;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  CFDictionaryRemoveValue(self->_pixelBufferReps, key);
  os_unfair_lock_unlock(&self->_pixelBufferRepsLock);
}

- (__CVBuffer)cachedBufferWithKey:(id)a3
{
  id v4 = a3;
  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  Value = (__CVBuffer *)CFDictionaryGetValue(self->_pixelBufferReps, v4);
  CVPixelBufferRetain(Value);
  os_unfair_lock_unlock(p_pixelBufferRepsLock);

  return Value;
}

- (void)cacheBuffer:(__CVBuffer *)a3 forCacheKey:(id)a4
{
  id key = a4;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  CFDictionaryAddValue(self->_pixelBufferReps, key, a3);
  os_unfair_lock_unlock(&self->_pixelBufferRepsLock);
}

- (void)dealloc
{
  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  pixelBufferReps = self->_pixelBufferReps;
  if (pixelBufferReps)
  {
    CFRelease(pixelBufferReps);
    self->_pixelBufferReps = 0;
  }
  os_unfair_lock_unlock(p_pixelBufferRepsLock);
  v5.receiver = self;
  v5.super_class = (Class)VNImageBufferCache;
  [(VNImageBufferCache *)&v5 dealloc];
}

- (VNImageBufferCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageBufferCache;
  v2 = [(VNImageBufferCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_pixelBufferRepsLock._os_unfair_lock_opaque = 0;
    v2->_pixelBufferReps = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v4 = v3;
  }

  return v3;
}

+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "cacheKeyWithBufferFormat:width:height:cropRect:", *(void *)&a3, 0.0, 0.0, (double)a4, (double)a5);
}

+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = [NSString alloc];
  uint64_t v14 = a3;
  v15 = VNHumanReadableCGRect(x, y, width, height);
  v16 = (void *)[v13 initWithFormat:@"format=%lu_width=%lu_height=%lu_cropRect=%@", v14, a4, a5, v15];

  return v16;
}

@end