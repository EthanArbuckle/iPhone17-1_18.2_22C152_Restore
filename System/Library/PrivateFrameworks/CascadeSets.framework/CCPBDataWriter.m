@interface CCPBDataWriter
- (BOOL)writeData:(id)a3;
- (CCPBDataWriter)init;
- (CCPBDataWriter)initWithInitialCapacity:(unint64_t)a3;
- (id)immutableData;
- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4;
- (void)writeData:(id)a3 forTag:(unsigned int)a4;
- (void)writeDouble:(double)a3 forTag:(unsigned int)a4;
- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4;
- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4;
- (void)writeFloat:(float)a3 forTag:(unsigned int)a4;
- (void)writeInt32:(int)a3 forTag:(unsigned int)a4;
- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4;
- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeSint32:(int)a3 forTag:(unsigned int)a4;
- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeString:(id)a3 forTag:(unsigned int)a4;
- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4;
- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4;
@end

@implementation CCPBDataWriter

- (id)immutableData
{
  return self->_data;
}

- (void).cxx_destruct
{
}

- (CCPBDataWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CCPBDataWriter;
  v2 = [(CCPBDataWriter *)&v6 init];
  if (v2)
  {
    v3 = [[CCPBMutableData alloc] initWithCapacity:256];
    data = v2->_data;
    v2->_data = v3;
  }
  return v2;
}

- (CCPBDataWriter)initWithInitialCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CCPBDataWriter;
  v4 = [(CCPBDataWriter *)&v10 init];
  if (v4)
  {
    v5 = [CCPBMutableData alloc];
    if (a3 <= 0x100) {
      unint64_t v6 = 256;
    }
    else {
      unint64_t v6 = a3;
    }
    uint64_t v7 = [(CCPBMutableData *)v5 initWithCapacity:v6];
    data = v4->_data;
    v4->_data = (CCPBMutableData *)v7;
  }
  return v4;
}

- (void)writeInt32:(int)a3 forTag:(unsigned int)a4
{
}

- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4
{
}

- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4
{
}

- (void)writeSint32:(int)a3 forTag:(unsigned int)a4
{
}

- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4
{
  int64_t v7 = 2 * a3;
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  if ((char *)end < data->p + 16)
  {
    unint64_t v10 = end - (unint64_t)data->buffer;
    if (v10 <= 0x10) {
      uint64_t v11 = 16;
    }
    else {
      uint64_t v11 = v10;
    }
    -[CCPBMutableData _pb_growCapacityBy:](data, v11);
    data = self->_data;
  }
  unint64_t v12 = v7 ^ (a3 >> 63);
  if (a4 != -1)
  {
    unint64_t v13 = 8 * a4;
    p = data->p;
    if (v13 < 0x80)
    {
      LOBYTE(v15) = 8 * a4;
    }
    else
    {
      do
      {
        *p++ = v13 | 0x80;
        unint64_t v15 = v13 >> 7;
        unint64_t v16 = v13 >> 14;
        v13 >>= 7;
      }
      while (v16);
    }
    char *p = v15;
    self->_data->p = p + 1;
    data = self->_data;
  }
  v17 = data->p;
  if (v12 < 0x80)
  {
    int64_t v18 = v7 ^ (a3 >> 63);
  }
  else
  {
    do
    {
      *v17++ = v12 | 0x80;
      int64_t v18 = v12 >> 7;
      unint64_t v19 = v12 >> 14;
      v12 >>= 7;
    }
    while (v19);
  }
  char *v17 = v18;
  self->_data->p = v17 + 1;
}

- (void)writeDouble:(double)a3 forTag:(unsigned int)a4
{
}

- (void)writeFloat:(float)a3 forTag:(unsigned int)a4
{
}

- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4
{
}

- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4
{
}

- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeString:(id)a3 forTag:(unsigned int)a4
{
}

- (void)writeData:(id)a3 forTag:(unsigned int)a4
{
  if (a3) {
    CCPBDataWriterWriteDataField((uint64_t)self, a3, a4);
  }
}

- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  data = self->_data;
  unint64_t end = data->end;
  p = data->p;
  if (end < &p[a4])
  {
    if (end - data->buffer <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = end - data->buffer;
    }
    -[CCPBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  memcpy(p, a3, a4);
  self->_data->p += a4;
  return a4;
}

- (BOOL)writeData:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 length];
  data = self->_data;
  unint64_t end = data->end;
  p = data->p;
  if (end < &p[v5])
  {
    size_t v9 = end - data->buffer;
    if (v9 <= v5) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v9;
    }
    -[CCPBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  id v11 = v4;
  memcpy(p, (const void *)[v11 bytes], v5);
  self->_data->p += v5;

  return 1;
}

@end