@interface MTKMeshBufferZone
- (MDLMeshBufferAllocator)allocator;
- (MTKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4;
- (MTLBuffer)buffer;
- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4;
- (unint64_t)capacity;
- (void)destroyBuffer:(id)a3;
@end

@implementation MTKMeshBufferZone

- (MTKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MTKMeshBufferZone;
  v8 = [(MTKMeshBufferZone *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_allocator, a4);
    v9->_unint64_t capacity = a3;
    v10 = [(MTKMeshBufferAllocator *)v9->_allocator device];
    unint64_t capacity = v9->_capacity;
    if (capacity > [v10 maxBufferLength] || !v9->_capacity)
    {

      v17 = 0;
      goto LABEL_7;
    }
    v12 = [v7 device];
    uint64_t v13 = [v12 newBufferWithLength:v9->_capacity options:0];
    buffer = v9->_buffer;
    v9->_buffer = (MTLBuffer *)v13;

    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    buffers = v9->_buffers;
    v9->_buffers = v15;

    v9->_destroyInvoked = 0;
  }
  v17 = v9;
LABEL_7:

  return v17;
}

- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4
{
  if (a4 == 1)
  {
    id v7 = [(MTKMeshBufferAllocator *)self->_allocator device];
    uint64_t v8 = [v7 minConstantBufferAlignmentBytes];
  }
  else
  {
    uint64_t v8 = 1;
  }
  buffers = self->_buffers;
  if (!self->_destroyInvoked)
  {
    v17 = [(NSMutableOrderedSet *)buffers lastObject];
    v18 = [v17 buffer];

    uint64_t v19 = [v18 offset];
    uint64_t v10 = (v8 + v19 + [v18 length] - 1) & -v8;

    goto LABEL_11;
  }
  uint64_t v10 = 0;
  if (![(NSMutableOrderedSet *)buffers count])
  {
LABEL_11:
    uint64_t v20 = [(MTLBuffer *)self->_buffer length];
LABEL_12:
    if (v20 - v10 < (uint64_t)a3) {
      return 0;
    }
    id v21 = [[MTKMeshBuffer alloc] _initWithLength:a3 offset:v10 zone:self type:a4];
    if (v21)
    {
      v22 = objc_opt_new();
      [v22 setBuffer:v21];
      [(NSMutableOrderedSet *)self->_buffers addObject:v22];
    }
    return v21;
  }
  uint64_t v11 = 0;
  uint64_t v12 = v8 - 1;
  uint64_t v13 = -v8;
  while (1)
  {
    v14 = [(NSMutableOrderedSet *)self->_buffers objectAtIndexedSubscript:v11];
    v15 = [v14 buffer];

    if ([v15 offset] - v10 >= a3) {
      break;
    }
    uint64_t v16 = [v15 offset];
    uint64_t v10 = (v12 + v16 + [v15 length]) & v13;

    if (++v11 >= (unint64_t)[(NSMutableOrderedSet *)self->_buffers count]) {
      goto LABEL_11;
    }
  }
  id v21 = [[MTKMeshBuffer alloc] _initWithLength:a3 offset:v10 zone:self type:a4];
  v23 = objc_opt_new();
  [v23 setBuffer:v21];
  [(NSMutableOrderedSet *)self->_buffers insertObject:v23 atIndex:v11];

  uint64_t v20 = [(MTLBuffer *)self->_buffer length];
  if (!v21) {
    goto LABEL_12;
  }
  return v21;
}

- (void)destroyBuffer:(id)a3
{
  id v7 = a3;
  if ((MTKMeshBufferZone *)objc_claimAutoreleasedReturnValue() ! = [v7 zone]; {
    -[MTKMeshBufferZone destroyBuffer:]();
  }

  self->_destroyInvoked = 1;
  if ([(NSMutableOrderedSet *)self->_buffers count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [(NSMutableOrderedSet *)self->_buffers objectAtIndexedSubscript:v4];
      id v6 = [v5 buffer];

      if (v6 == v7) {
        break;
      }

      if (++v4 >= (unint64_t)[(NSMutableOrderedSet *)self->_buffers count]) {
        goto LABEL_8;
      }
    }
    [(NSMutableOrderedSet *)self->_buffers removeObjectAtIndex:v4];
  }
LABEL_8:
}

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_allocator, 0);

  objc_storeStrong((id *)&self->_buffers, 0);
}

- (void)destroyBuffer:.cold.1()
{
  __assert_rtn("-[MTKMeshBufferZone destroyBuffer:]", "MTKMeshBufferZone.m", 109, "destroyedBuffer.zone == self");
}

@end