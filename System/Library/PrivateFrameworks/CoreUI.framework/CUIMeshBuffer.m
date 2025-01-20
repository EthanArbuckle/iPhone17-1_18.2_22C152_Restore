@interface CUIMeshBuffer
- (CUIMeshBuffer)init;
- (CUIMeshBuffer)initWithBytes:(void *)a3 andLength:(unint64_t)a4 ofType:(unint64_t)a5;
- (MDLMeshBufferAllocator)allocator;
- (MDLMeshBufferZone)zone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (unint64_t)length;
- (unint64_t)type;
- (void)dealloc;
- (void)fillData:(id)a3 offset:(unint64_t)a4;
@end

@implementation CUIMeshBuffer

- (CUIMeshBuffer)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUIMeshBuffer;
  v2 = [(CUIMeshBuffer *)&v4 init];
  if (v2) {
    v2->_data = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  }
  return v2;
}

- (CUIMeshBuffer)initWithBytes:(void *)a3 andLength:(unint64_t)a4 ofType:(unint64_t)a5
{
  v8 = [(CUIMeshBuffer *)self init];
  v9 = v8;
  if (v8)
  {
    [(NSMutableData *)v8->_data appendBytes:a3 length:a4];
    v9->_type = a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIMeshBuffer;
  [(CUIMeshBuffer *)&v3 dealloc];
}

- (unint64_t)length
{
  return [(NSMutableData *)self->_data length];
}

- (unint64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_type;
  data = self->_data;
  if (data) {
    v5[1] = [(NSMutableData *)data copyWithZone:a3];
  }
  return v5;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  data = self->_data;
  v7 = (char *)[a3 bytes] + a4;
  v8 = (char *)[a3 length] - a4;
  [(NSMutableData *)data appendBytes:v7 length:v8];
}

- (id)map
{
  id v2 = objc_msgSend(objc_alloc(getMDLMeshBufferMapClass()), "initWithBytes:deallocator:", -[NSMutableData bytes](self->_data, "bytes"), 0);
  return v2;
}

- (MDLMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (MDLMeshBufferZone)zone
{
  return self->_zone;
}

@end