@interface BWDeferredContainerPixelBufferPoolWrapper
- (BWDeferredContainerPixelBufferPoolWrapper)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5;
- (void)dealloc;
- (void)flushToMinimumCapacity:(unint64_t)a3;
- (void)newPixelBuffer;
- (void)signal;
@end

@implementation BWDeferredContainerPixelBufferPoolWrapper

- (BWDeferredContainerPixelBufferPoolWrapper)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BWDeferredContainerPixelBufferPoolWrapper;
  v8 = [(BWDeferredContainerPixelBufferPoolWrapper *)&v11 init];
  if (v8)
  {
    v9 = [[BWPixelBufferPool alloc] initWithVideoFormat:a3 capacity:a4 name:a5 memoryPool:+[BWMemoryPool sharedMemoryPool]];
    v8->_pool = v9;
    v8->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create([(BWPixelBufferPool *)v9 capacity]);
  }
  return v8;
}

- (void)newPixelBuffer
{
  if (!a1) {
    return 0;
  }
  v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v3 = *(NSObject **)(a1 + 16);
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    FigDebugAssert3();
    v5 = 0;
  }
  else
  {
    v5 = (void *)[*(id *)(a1 + 8) newPixelBuffer];
    if (v5) {

    }
    else {
      FigDebugAssert3();
    }
  }
  if (*v2 == 1) {
    kdebug_trace();
  }
  return v5;
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
}

- (void)signal
{
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  if (*v3 == 1)
  {
    kdebug_trace();
  }
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_semaphore);
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainerPixelBufferPoolWrapper;
  [(BWDeferredContainerPixelBufferPoolWrapper *)&v3 dealloc];
}

@end