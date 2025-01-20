@interface CCPBMutableData
- (CCPBMutableData)initWithCapacity:(unint64_t)a3;
- (const)bytes;
- (unint64_t)length;
- (void)_pb_growCapacityBy:(void *)a1;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation CCPBMutableData

- (void)dealloc
{
  free(self->buffer);
  v3.receiver = self;
  v3.super_class = (Class)CCPBMutableData;
  [(CCPBMutableData *)&v3 dealloc];
}

- (const)bytes
{
  return self->buffer;
}

- (CCPBMutableData)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCPBMutableData;
  v4 = [(CCPBMutableData *)&v6 init];
  -[CCPBMutableData _pb_growCapacityBy:](v4, a3);
  return v4;
}

- (void)_pb_growCapacityBy:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 length];
    v5 = (void *)a1[2];
    size_t v6 = a1[3] - (void)v5 + a2;
    v7 = (char *)malloc_type_realloc(v5, v6, 0x182F6B92uLL);
    if (!v7)
    {
      v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:0 userInfo:0];
      [v8 raise];
    }
    a1[2] = v7;
    a1[3] = &v7[v6];
    a1[1] = &v7[v4];
  }
}

- (unint64_t)length
{
  return self->p - self->buffer;
}

- (void)setLength:(unint64_t)a3
{
  buffer = self->buffer;
  size_t v6 = (char *)(self->end - buffer);
  if (a3 > (unint64_t)v6)
  {
    -[CCPBMutableData _pb_growCapacityBy:](self, a3 - (void)v6);
    buffer = self->buffer;
  }
  self->p = &buffer[a3];
}

- (void)mutableBytes
{
  return self->buffer;
}

@end