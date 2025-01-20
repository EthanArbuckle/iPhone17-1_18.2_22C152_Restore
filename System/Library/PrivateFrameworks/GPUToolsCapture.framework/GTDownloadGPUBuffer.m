@interface GTDownloadGPUBuffer
- (GTDownloadGPUBuffer)initWithTracking:(unint64_t *)a3;
- (MTLBuffer)buffer;
- (unint64_t)offset;
- (unint64_t)size;
- (void)dealloc;
- (void)setBuffer:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation GTDownloadGPUBuffer

- (void).cxx_destruct
{
}

- (void)setSize:(unint64_t)a3
{
  self->size = a3;
}

- (unint64_t)size
{
  return self->size;
}

- (void)setOffset:(unint64_t)a3
{
  self->offset = a3;
}

- (unint64_t)offset
{
  return self->offset;
}

- (void)setBuffer:(id)a3
{
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)dealloc
{
  usedGPUMemory = self->_usedGPUMemory;
  if (usedGPUMemory) {
    atomic_fetch_add((atomic_ullong *volatile)usedGPUMemory, -(uint64_t)[(MTLBuffer *)self->_buffer length]);
  }
  v4.receiver = self;
  v4.super_class = (Class)GTDownloadGPUBuffer;
  [(GTDownloadGPUBuffer *)&v4 dealloc];
}

- (GTDownloadGPUBuffer)initWithTracking:(unint64_t *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTDownloadGPUBuffer;
  result = [(GTDownloadGPUBuffer *)&v5 init];
  if (result) {
    result->_usedGPUMemory = a3;
  }
  return result;
}

@end