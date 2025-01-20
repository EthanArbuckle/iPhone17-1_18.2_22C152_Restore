@interface SCNFixedSizePage
- (BOOL)hasFreeElementsLeft;
- (BOOL)isFull;
- (MTLBuffer)buffer;
- (SCNFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4;
- (id)newSubBufferForAllocator:(id)a3;
- (unint64_t)_allocateElement;
- (void)_allocateElement;
- (void)dealloc;
- (void)deallocateElementAtOffset:(unint64_t)a3;
@end

@implementation SCNFixedSizePage

- (id)newSubBufferForAllocator:(id)a3
{
  v4 = [[SCNMTLBufferAllocatorSubBuffer alloc] initWithPage:self allocator:a3];
  [(SCNMTLBuffer *)v4 setBuffer:self->_buffer];
  [(SCNMTLBuffer *)v4 setOffset:[(SCNFixedSizePage *)self _allocateElement]];
  if ([(SCNMTLBuffer *)v4 offset] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCNFixedSizePage newSubBufferForAllocator:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return v4;
}

- (unint64_t)_allocateElement
{
  if (![(NSMutableIndexSet *)self->_freeIndices count])
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      [(SCNFixedSizePage *)v3 _allocateElement];
    }
  }
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSMutableIndexSet *)self->_freeIndices count])
  {
    uint64_t v12 = [(NSMutableIndexSet *)self->_freeIndices firstIndex];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(SCNFixedSizePage *)v13 _allocateElement];
      }
    }
    [(NSMutableIndexSet *)self->_freeIndices removeIndex:v12];
    return self->_elementSize * v12;
  }
  return v11;
}

- (BOOL)hasFreeElementsLeft
{
  return [(NSMutableIndexSet *)self->_freeIndices count] != 0;
}

- (SCNFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCNFixedSizePage;
  uint64_t v6 = [(SCNFixedSizePage *)&v10 init];
  unint64_t v7 = [a3 length] / a4;
  v6->_buffer = (MTLBuffer *)a3;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, v7);
  v6->_elementSize = a4;
  v6->_freeIndices = (NSMutableIndexSet *)v8;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNFixedSizePage;
  [(SCNFixedSizePage *)&v3 dealloc];
}

- (BOOL)isFull
{
  return [(NSMutableIndexSet *)self->_freeIndices count] == 0;
}

- (void)deallocateElementAtOffset:(unint64_t)a3
{
  unint64_t elementSize = self->_elementSize;
  unint64_t v5 = a3 / elementSize;
  if (a3 % elementSize)
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNFixedSizePage deallocateElementAtOffset:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  [(NSMutableIndexSet *)self->_freeIndices addIndex:v5];
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)_allocateElement
{
}

- (void)deallocateElementAtOffset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newSubBufferForAllocator:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end