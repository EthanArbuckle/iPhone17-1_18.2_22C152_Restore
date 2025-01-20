@interface GLKMeshBufferZone
- (GLKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4;
- (MDLMeshBufferAllocator)allocator;
- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4;
- (unint64_t)capacity;
- (unsigned)glBufferName;
- (void)dealloc;
- (void)destroyBuffer:(id)a3;
@end

@implementation GLKMeshBufferZone

- (GLKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GLKMeshBufferZone;
  v8 = [(GLKMeshBufferZone *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_allocator, a4);
    v9->_capacity = a3;
    uint64_t v10 = objc_opt_new();
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableOrderedSet *)v10;

    glGenBuffers(1, &v9->_glBufferName);
    glBindBuffer(0x8892u, v9->_glBufferName);
    glBufferData(0x8892u, a3, 0, 0x88E4u);
    v9->_destroyInvoked = 0;
  }

  return v9;
}

- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v7 = 256;
  }
  else
  {
    if (a4 != 2) {
      return 0;
    }
    uint64_t v7 = 1;
  }
  buffers = self->_buffers;
  if (self->_destroyInvoked)
  {
    if ([(NSMutableOrderedSet *)buffers count])
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = v7 - 1;
      uint64_t v12 = ~v7;
      while (1)
      {
        objc_super v13 = [(NSMutableOrderedSet *)self->_buffers objectAtIndexedSubscript:v9];
        v14 = [v13 buffer];

        if ([v14 offset] - v10 >= a3) {
          break;
        }
        uint64_t v15 = [v14 offset];
        uint64_t v10 = (v11 + v15 + [v14 length]) & v12;

        if (++v9 >= (unint64_t)[(NSMutableOrderedSet *)self->_buffers count]) {
          goto LABEL_14;
        }
      }
      id v19 = [[GLKMeshBuffer alloc] _initWithLength:a3 offset:v10 zone:self type:a4];
      v20 = objc_opt_new();
      [v20 setBuffer:v19];
      [(NSMutableOrderedSet *)self->_buffers insertObject:v20 atIndex:v9];

      if (v19) {
        return v19;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    v16 = [(NSMutableOrderedSet *)buffers lastObject];
    v17 = [v16 buffer];

    uint64_t v18 = [v17 offset];
    uint64_t v10 = (v7 + v18 + [v17 length] - 1) & -v7;
  }
LABEL_14:
  if (self->_capacity - v10 < a3) {
    return 0;
  }
  id v19 = [[GLKMeshBuffer alloc] _initWithLength:a3 offset:v10 zone:self type:a4];
  if (v19)
  {
    v21 = objc_opt_new();
    [v21 setBuffer:v19];
    [(NSMutableOrderedSet *)self->_buffers addObject:v21];
  }
  return v19;
}

- (void)destroyBuffer:(id)a3
{
  id v7 = a3;
  if ((GLKMeshBufferZone *)objc_claimAutoreleasedReturnValue() ! = [v7 zone]; {
    -[GLKMeshBufferZone destroyBuffer:]();
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

- (void)dealloc
{
  glDeleteBuffers(1, &self->_glBufferName);
  v3.receiver = self;
  v3.super_class = (Class)GLKMeshBufferZone;
  [(GLKMeshBufferZone *)&v3 dealloc];
}

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)glBufferName
{
  return self->_glBufferName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);

  objc_storeStrong((id *)&self->_buffers, 0);
}

- (void)destroyBuffer:.cold.1()
{
  __assert_rtn("-[GLKMeshBufferZone destroyBuffer:]", "GLKModel.m", 199, "destroyedBuffer.zone == self");
}

@end