@interface TKDataSource
- (BOOL)bytesSafeToRead:(int64_t)a3;
- (NSData)data;
- (TKDataSource)initWithData:(id)a3;
- (const)end;
- (const)ptr;
- (id)dataFromPtr:(const char *)a3;
- (id)fetchDataWithLength:(int64_t)a3;
- (unsigned)fetchByte;
@end

@implementation TKDataSource

- (BOOL)bytesSafeToRead:(int64_t)a3
{
  v3 = &self->_ptr[a3];
  return v3 <= [(TKDataSource *)self end];
}

- (const)end
{
  v3 = [(NSData *)self->_data bytes];
  return &v3[[(NSData *)self->_data length]];
}

- (id)fetchDataWithLength:(int64_t)a3
{
  if (-[TKDataSource bytesSafeToRead:](self, "bytesSafeToRead:"))
  {
    v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_ptr length:a3];
    self->_ptr += a3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TKDataSource)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKDataSource;
  v6 = [(TKDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_ptr = (const char *)[v5 bytes];
  }

  return v7;
}

- (id)dataFromPtr:(const char *)a3
{
  if ([(NSData *)self->_data bytes] > a3 || self->_ptr < a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid argument ptr"];
  }
  data = self->_data;
  v6 = &a3[-(uint64_t)[(NSData *)data bytes]];
  int64_t v7 = self->_ptr - a3;

  return -[NSData subdataWithRange:](data, "subdataWithRange:", v6, v7);
}

- (const)ptr
{
  return self->_ptr;
}

- (unsigned)fetchByte
{
  ptr = self->_ptr;
  self->_ptr = ptr + 1;
  return *ptr;
}

- (NSData)data
{
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(NSData *)self->_data bytes];
  ptr = self->_ptr;
  v6 = &ptr[-(uint64_t)[(NSData *)self->_data bytes]];

  return (NSData *)[v3 dataWithBytes:v4 length:v6];
}

- (void).cxx_destruct
{
}

@end