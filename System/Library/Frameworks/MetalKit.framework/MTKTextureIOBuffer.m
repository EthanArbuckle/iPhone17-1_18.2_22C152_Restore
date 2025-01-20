@interface MTKTextureIOBuffer
- (MTKTextureIOBuffer)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocNotification:(id)a5 device:(id)a6 error:(id *)a7;
- (MTKTextureIOBuffer)initWithLength:(unint64_t)a3 device:(id)a4;
- (MTLBuffer)buffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
@end

@implementation MTKTextureIOBuffer

- (MTKTextureIOBuffer)initWithLength:(unint64_t)a3 device:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTKTextureIOBuffer;
  v7 = [(MTKTextureIOBuffer *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 newBufferWithLength:a3 options:0];
    buffer = v7->_buffer;
    v7->_buffer = (MTLBuffer *)v8;
  }
  return v7;
}

- (MTKTextureIOBuffer)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocNotification:(id)a5 device:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MTKTextureIOBuffer;
  v13 = [(MTKTextureIOBuffer *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 newBufferWithBytesNoCopy:a3 length:a4 options:0 deallocator:v11];
    buffer = v13->_buffer;
    v13->_buffer = (MTLBuffer *)v14;
  }
  return v13;
}

- (id)map
{
  v2 = [[MTKTextureIOBufferMap alloc] initWithContents:[(MTLBuffer *)self->_buffer contents]];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MTKTextureIOBuffer alloc];
  uint64_t v5 = [(MTLBuffer *)self->_buffer length];
  id v6 = [(MTLBuffer *)self->_buffer device];
  v7 = [(MTKTextureIOBuffer *)v4 initWithLength:v5 device:v6];

  memcpy((void *)[v7[1] contents], (const void *)-[MTLBuffer contents](self->_buffer, "contents"), -[MTLBuffer length](self->_buffer, "length"));
  return v7;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
}

@end