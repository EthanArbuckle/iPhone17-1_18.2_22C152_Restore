@interface BWIntermediateJPEGCompressedBufferAssociatedSemaphore
- (BWIntermediateJPEGCompressedBufferAssociatedSemaphore)initWithSemaphore:(id)a3 name:(id)a4 presentationTimeStamp:(id *)a5;
- (void)dealloc;
@end

@implementation BWIntermediateJPEGCompressedBufferAssociatedSemaphore

- (BWIntermediateJPEGCompressedBufferAssociatedSemaphore)initWithSemaphore:(id)a3 name:(id)a4 presentationTimeStamp:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWIntermediateJPEGCompressedBufferAssociatedSemaphore;
  v7 = [(BWIntermediateJPEGCompressedBufferAssociatedSemaphore *)&v10 init];
  if (v7)
  {
    *((void *)v7 + 1) = a3;
    *((void *)v7 + 2) = *((id *)v7 + 2);
    int64_t var3 = a5->var3;
    *(_OWORD *)(v7 + 24) = *(_OWORD *)&a5->var0;
    *((void *)v7 + 5) = var3;
  }
  return (BWIntermediateJPEGCompressedBufferAssociatedSemaphore *)v7;
}

- (void)dealloc
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

  v3.receiver = self;
  v3.super_class = (Class)BWIntermediateJPEGCompressedBufferAssociatedSemaphore;
  [(BWIntermediateJPEGCompressedBufferAssociatedSemaphore *)&v3 dealloc];
}

@end