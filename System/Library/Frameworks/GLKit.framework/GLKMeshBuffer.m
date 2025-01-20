@interface GLKMeshBuffer
- (GLKMeshBufferAllocator)allocator;
- (GLuint)glBufferName;
- (MDLMeshBufferType)type;
- (NSUInteger)length;
- (NSUInteger)offset;
- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8;
- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5;
- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5;
- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (id)zone;
- (void)dealloc;
- (void)fillData:(id)a3 offset:(unint64_t)a4;
@end

@implementation GLKMeshBuffer

- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6
{
  id v10 = a5;
  v11 = [v10 allocator];
  id v12 = [(GLKMeshBuffer *)self _initWithBytes:0 length:a3 offset:a4 allocator:v11 zone:v10 type:a6];

  return v12;
}

- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5
{
  return [(GLKMeshBuffer *)self _initWithBytes:0 length:a3 offset:0 allocator:a4 zone:0 type:a5];
}

- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = [(GLKMeshBuffer *)self _initWithBytes:v11 length:v12 offset:0 allocator:v9 zone:0 type:a5];
  return v13;
}

- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8
{
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GLKMeshBuffer;
  v17 = [(GLKMeshBuffer *)&v22 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_10;
  }
  v17->_mapCount = 0;
  v17->_type = a8;
  objc_storeStrong((id *)&v17->_zone, a7);
  v18->_length = a4;
  objc_storeStrong((id *)&v18->_allocator, a6);
  v18->_offset = a5;
  if (a8 == 1)
  {
    int v19 = 34962;
LABEL_6:
    v18->_target = v19;
    if (v18->_zone)
    {
      v18->_glBufferName = [v16 glBufferName];
    }
    else
    {
      glGenBuffers(1, &v18->_glBufferName);
      glBindBuffer(v18->_target, v18->_glBufferName);
      glBufferData(v18->_target, a4, a3, 0x88E4u);
    }
LABEL_10:
    v20 = v18;
    goto LABEL_11;
  }
  if (a8 == 2)
  {
    int v19 = 34963;
    goto LABEL_6;
  }
  v20 = 0;
LABEL_11:

  return v20;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  if (self->_length >= a4)
  {
    id v6 = a3;
    uint64_t v7 = [v6 length];
    unint64_t length = self->_length;
    unint64_t v9 = v7 + a4 - length;
    if (v7 + a4 < length) {
      unint64_t v9 = 0;
    }
    GLsizeiptr v10 = v7 - v9;
    glBindBuffer(self->_target, self->_glBufferName);
    GLenum target = self->_target;
    GLintptr v12 = self->_offset + a4;
    id v13 = v6;
    v14 = (const GLvoid *)[v13 bytes];

    glBufferSubData(target, v12, v10, v14);
  }
}

- (id)map
{
  unsigned int mapCount = self->_mapCount;
  if (!mapCount)
  {
    glBindBuffer(self->_target, self->_glBufferName);
    self->_mapPtr = glMapBufferRange(self->_target, 0, self->_length, 1u);
    unsigned int mapCount = self->_mapCount;
  }
  self->_unsigned int mapCount = mapCount + 1;
  id v4 = objc_alloc(getMDLMeshBufferMapClass());
  v5 = (char *)self->_mapPtr + self->_offset;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __20__GLKMeshBuffer_map__block_invoke;
  v8[3] = &unk_264339F28;
  v8[4] = self;
  id v6 = (void *)[v4 initWithBytes:v5 deallocator:v8];

  return v6;
}

uint64_t __20__GLKMeshBuffer_map__block_invoke(uint64_t result)
{
  v1 = *(_DWORD **)(result + 32);
  int v2 = v1[2];
  if (v2 == 1)
  {
    uint64_t v3 = result;
    glBindBuffer(v1[6], v1[10]);
    result = glUnmapBuffer(*(_DWORD *)(*(void *)(v3 + 32) + 24));
    *(void *)(*(void *)(v3 + 32) + 16) = 0;
    v1 = *(_DWORD **)(v3 + 32);
    int v2 = v1[2];
  }
  v1[2] = v2 - 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GLKMeshBuffer);
  v5 = [(GLKMeshBuffer *)self map];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v5, "bytes"), -[GLKMeshBuffer length](self, "length"), 0);
  uint64_t v7 = [(GLKMeshBuffer *)self allocator];
  id v8 = (void *)[v7 newBufferWithData:v6 type:self->_type];

  return v8;
}

- (void)dealloc
{
  zone = self->_zone;
  if (zone) {
    [(GLKMeshBufferZone *)zone destroyBuffer:self];
  }
  else {
    glDeleteBuffers(1, &self->_glBufferName);
  }
  v4.receiver = self;
  v4.super_class = (Class)GLKMeshBuffer;
  [(GLKMeshBuffer *)&v4 dealloc];
}

- (id)zone
{
  return self->_zone;
}

- (NSUInteger)length
{
  return self->_length;
}

- (GLKMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (GLuint)glBufferName
{
  return self->_glBufferName;
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (MDLMeshBufferType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);

  objc_storeStrong((id *)&self->_zone, 0);
}

@end