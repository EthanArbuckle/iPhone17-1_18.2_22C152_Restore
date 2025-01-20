@interface SCNMTLBufferAllocator
- (SCNMTLBufferAllocator)initWithDevice:(id)a3 fixedSizeElement:(unint64_t)a4 buffersize:(unint64_t)a5 name:(id)a6;
- (id)_newSubBuffer;
- (id)newSubBufferWithBytes:(const void *)a3 length:(unint64_t)a4 renderContext:(id)a5;
- (unint64_t)bufferSize;
- (unint64_t)elementSize;
- (void)dealloc;
@end

@implementation SCNMTLBufferAllocator

- (id)newSubBufferWithBytes:(const void *)a3 length:(unint64_t)a4 renderContext:(id)a5
{
  p_elementSize = (uint64_t *)&self->_elementSize;
  if (self->_elementSize < a4)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLBufferAllocator newSubBufferWithBytes:length:renderContext:](a4, p_elementSize, v10);
    }
  }
  id v11 = [(SCNMTLBufferAllocator *)self _newSubBuffer];
  v12 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:a3 length:a4 options:1];
  objc_msgSend(*(id *)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)a5), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v12, 0, objc_msgSend(v11, "buffer"), objc_msgSend(v11, "offset"), a4);

  return v11;
}

- (id)_newSubBuffer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_allocatorLock = &self->_allocatorLock;
  os_unfair_lock_lock(&self->_allocatorLock);
  if (![(SCNFixedSizePage *)self->_currentAllocatorPage hasFreeElementsLeft])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    pages = self->_pages;
    uint64_t v5 = [(NSMutableArray *)pages countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(pages);
          }
          v9 = *(SCNFixedSizePage **)(*((void *)&v14 + 1) + 8 * i);
          if ([(SCNFixedSizePage *)v9 hasFreeElementsLeft])
          {
            self->_currentAllocatorPage = v9;
            currentAllocatorPage = v9;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(NSMutableArray *)pages countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v10 = (void *)[(MTLDevice *)self->_device newBufferWithLength:self->_bufferSize options:32];
    self->_currentAllocatorPage = [[SCNFixedSizePage alloc] initWithBuffer:v10 elementSize:self->_elementSize];

    [(NSMutableArray *)self->_pages addObject:self->_currentAllocatorPage];
  }
  currentAllocatorPage = self->_currentAllocatorPage;
LABEL_13:
  id v12 = [(SCNFixedSizePage *)currentAllocatorPage newSubBufferForAllocator:self];
  os_unfair_lock_unlock(p_allocatorLock);
  return v12;
}

- (SCNMTLBufferAllocator)initWithDevice:(id)a3 fixedSizeElement:(unint64_t)a4 buffersize:(unint64_t)a5 name:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)SCNMTLBufferAllocator;
  v10 = [(SCNMTLBufferAllocator *)&v15 init];
  v10->_device = (MTLDevice *)a3;
  uint64_t v11 = [a6 copy];
  unint64_t v12 = (a4 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v13 = a5 / a4;
  if (a4 > a5) {
    unint64_t v13 = 100;
  }
  v10->_elementSize = v12;
  v10->_name = (NSString *)v11;
  v10->_bufferSize = v13 * v12;
  v10->_pages = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  v10->_allocatorLock._os_unfair_lock_opaque = 0;
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBufferAllocator;
  [(SCNMTLBufferAllocator *)&v3 dealloc];
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void)newSubBufferWithBytes:(int)a1 length:(uint64_t *)a2 renderContext:(os_log_t)log .cold.1(int a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "length <= _elementSize";
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. subBuffer size overflow %d > %d", (uint8_t *)&v4, 0x18u);
}

@end