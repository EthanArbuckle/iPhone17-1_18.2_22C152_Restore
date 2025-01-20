@interface MTKMeshBuffer
- (MDLMeshBufferType)type;
- (MTKMeshBufferAllocator)allocator;
- (NSString)name;
- (NSUInteger)length;
- (NSUInteger)offset;
- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8;
- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5;
- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5;
- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6;
- (id)_newMap;
- (id)buffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (id)zone;
- (void)dealloc;
- (void)fillData:(id)a3 offset:(unint64_t)a4;
- (void)setName:(id)a3;
@end

@implementation MTKMeshBuffer

- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6
{
  uint64_t v11 = [a5 allocator];

  return [(MTKMeshBuffer *)self _initWithBytes:0 length:a3 offset:a4 allocator:v11 zone:a5 type:a6];
}

- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5
{
  return [(MTKMeshBuffer *)self _initWithBytes:0 length:a3 offset:0 allocator:a4 zone:0 type:a5];
}

- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5
{
  uint64_t v9 = [a3 bytes];
  uint64_t v10 = [a3 length];

  return [(MTKMeshBuffer *)self _initWithBytes:v9 length:v10 offset:0 allocator:a4 zone:0 type:a5];
}

- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8
{
  v18.receiver = self;
  v18.super_class = (Class)MTKMeshBuffer;
  id result = [(MTKMeshBuffer *)&v18 init];
  if (result)
  {
    v15 = result;
    unint64_t v16 = objc_msgSend((id)objc_msgSend(a6, "device"), "maxBufferLength");
    id result = 0;
    if (a8 - 3 >= 0xFFFFFFFFFFFFFFFELL && a4 - 1 < v16)
    {
      v15[2] = a4;
      v15[3] = a6;
      v15[1] = a7;
      v15[5] = a5;
      v15[6] = a8;
      if (a7) {
        id v17 = (id)[a7 buffer];
      }
      else {
        id v17 = (id)objc_msgSend((id)objc_msgSend(a6, "device"), "newBufferWithLength:options:", a4, 0);
      }
      v15[4] = v17;
      if (a3) {
        memcpy((void *)[v17 contents], a3, a4);
      }
      return v15;
    }
  }
  return result;
}

- (void)dealloc
{
  [(MTKMeshBufferZone *)self->_zone destroyBuffer:self];

  v3.receiver = self;
  v3.super_class = (Class)MTKMeshBuffer;
  [(MTKMeshBuffer *)&v3 dealloc];
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  if (self->_length >= a4)
  {
    uint64_t v7 = [a3 length];
    unint64_t length = self->_length;
    unint64_t v9 = v7 + a4 - length;
    if (v7 + a4 < length) {
      unint64_t v9 = 0;
    }
    size_t v10 = v9 + v7;
    uint64_t v11 = (void *)([(MTLBuffer *)self->_buffer contents] + self->_offset + a4);
    v12 = (const void *)[a3 bytes];
    memcpy(v11, v12, v10);
  }
}

- (id)_newMap
{
  objc_super v3 = self->_buffer;
  id v4 = objc_alloc(getMDLMeshBufferMapClass());
  unint64_t v5 = [(MTLBuffer *)v3 contents] + self->_offset;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__MTKMeshBuffer__newMap__block_invoke;
  v7[3] = &unk_264255380;
  v7[4] = v3;
  return (id)[v4 initWithBytes:v5 deallocator:v7];
}

void __24__MTKMeshBuffer__newMap__block_invoke(uint64_t a1)
{
}

- (id)map
{
  id v2 = [(MTKMeshBuffer *)self _newMap];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[MTKMeshBuffer alloc] _initWithLength:self->_length allocator:self->_allocator type:self->_type];
  memcpy((void *)[v4[4] contents], (const void *)-[MTLBuffer contents](self->_buffer, "contents"), self->_length);
  return v4;
}

- (NSString)name
{
  return (NSString *)[(MTLBuffer *)self->_buffer label];
}

- (void)setName:(id)a3
{
}

- (id)zone
{
  return self->_zone;
}

- (NSUInteger)length
{
  return self->_length;
}

- (MTKMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (id)buffer
{
  return self->_buffer;
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (MDLMeshBufferType)type
{
  return self->_type;
}

@end