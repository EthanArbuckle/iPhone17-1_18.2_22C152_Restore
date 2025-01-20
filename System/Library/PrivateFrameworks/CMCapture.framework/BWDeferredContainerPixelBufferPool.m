@interface BWDeferredContainerPixelBufferPool
+ (void)initialize;
- (BWDeferredContainerPixelBufferPool)initWithAttributes:(id)a3 capacity:(unint64_t)a4 name:(id)a5;
- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5;
- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9;
- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6;
- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9;
- (BWVideoFormat)videoFormat;
- (__CFDictionary)cvPixelBufferPoolAuxAttributes;
- (__CVBuffer)newPixelBuffer;
- (__CVPixelBufferPool)cvPixelBufferPool;
- (int)preallocate;
- (void)dealloc;
- (void)enumerateSurfacesUsingBlock:(id)a3;
- (void)flush;
- (void)flushToMinimumCapacity:(unint64_t)a3;
- (void)flushWithCompletionHandler:(id)a3;
- (void)preallocateWithCompletionHandler:(id)a3;
- (void)prefetchWithCompletionHandler:(id)a3;
- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4;
- (void)setCapacity:(unint64_t)a3;
@end

@implementation BWDeferredContainerPixelBufferPool

+ (void)initialize
{
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BWDeferredContainerPixelBufferPool;
  char v8 = 0;
  v6 = [(BWPixelBufferPool *)&v9 initWithVideoFormat:a3 capacity:a4 name:a5 clientProvidesPool:0 memoryPool:0 providesBackPressure:0 reportSlowBackPressureAllocations:v8];
  if (v6)
  {
    v6->_videoFormat = (BWVideoFormat *)a3;
    [+[BWDeferredCaptureContainerManager sharedInstance] addBufferPool:v6];
  }
  return v6;
}

- (BWDeferredContainerPixelBufferPool)initWithAttributes:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = [[BWVideoFormatRequirements alloc] initWithPixelBufferAttributes:a3];
  return -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:](self, "initWithVideoFormat:capacity:name:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]), a4, a5);
}

- (__CVBuffer)newPixelBuffer
{
  v3 = +[BWDeferredCaptureContainerManager sharedInstance];
  return [(BWDeferredCaptureContainerManager *)v3 newPixelBuffer:self];
}

- (void)dealloc
{
  [+[BWDeferredCaptureContainerManager sharedInstance] removeBufferPool:self];

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainerPixelBufferPool;
  [(BWPixelBufferPool *)&v3 dealloc];
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6
{
}

- (BWDeferredContainerPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
}

- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4
{
}

- (void)preallocateWithCompletionHandler:(id)a3
{
}

- (void)flushWithCompletionHandler:(id)a3
{
}

- (void)prefetchWithCompletionHandler:(id)a3
{
}

- (int)preallocate
{
}

- (void)setCapacity:(unint64_t)a3
{
}

- (void)flush
{
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  v5 = +[BWDeferredCaptureContainerManager sharedInstance];
  [(BWDeferredCaptureContainerManager *)v5 flush:self toMinimumCapacity:a3];
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
}

- (__CVPixelBufferPool)cvPixelBufferPool
{
}

- (__CFDictionary)cvPixelBufferPoolAuxAttributes
{
}

- (BWVideoFormat)videoFormat
{
  return self->_videoFormat;
}

@end