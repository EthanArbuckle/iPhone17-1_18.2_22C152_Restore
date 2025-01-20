@interface LACSecureData
+ (id)secureDataWithBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)secureDataWithData:(id)a3;
+ (id)secureDataWithString:(id)a3;
+ (void)resetBytes:(void *)a3 length:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeLastCharacter;
- (LACSecureData)init;
- (LACSecureData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (LACSecureData)initWithData:(id)a3;
- (LACSecureData)initWithString:(id)a3;
- (const)bytes;
- (id)data;
- (id)nullTerminatedCopy;
- (unint64_t)length;
- (void)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)appendData:(id)a3;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)prepareBuffer:(unint64_t)a3;
- (void)reset;
@end

@implementation LACSecureData

- (void)dealloc
{
  [(LACSecureData *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)LACSecureData;
  [(LACSecureData *)&v3 dealloc];
}

- (void)prepareBuffer:(unint64_t)a3
{
  unint64_t allocatedLength = self->_allocatedLength;
  if (allocatedLength >= a3)
  {
    +[LACSecureData resetBytes:(char *)self->_bytes + a3 length:allocatedLength - a3];
  }
  else
  {
    v6 = malloc_type_malloc(a3, 0x91F2B9A8uLL);
    if (!v6)
    {
      id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v10);
    }
    v7 = v6;
    +[LACSecureData resetBytes:v6 length:a3];
    bytes = self->_bytes;
    if (bytes)
    {
      size_t bytesLength = self->_bytesLength;
      if (bytesLength)
      {
        memcpy(v7, bytes, bytesLength);
        [(LACSecureData *)self reset];
      }
    }
    self->_unint64_t allocatedLength = a3;
    self->_bytes = v7;
  }
  self->_size_t bytesLength = a3;
}

- (LACSecureData)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-init is not a valid initializer for the class LACSecureData" userInfo:0];
  objc_exception_throw(v2);
}

- (LACSecureData)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACSecureData;
  v5 = [(LACSecureData *)&v8 init];
  if (v5)
  {
    uint64_t v7 = 0;
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0, &v7, 4, 0, 0, objc_msgSend(v4, "length"), 0);
    [(LACSecureData *)v5 prepareBuffer:v7];
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5->_bytes, v5->_bytesLength, &v7, 4, 0, 0, objc_msgSend(v4, "length"), 0);
  }

  return v5;
}

- (LACSecureData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)LACSecureData;
  v6 = [(LACSecureData *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(LACSecureData *)v6 prepareBuffer:a4];
    memcpy(v7->_bytes, a3, a4);
  }
  return v7;
}

- (LACSecureData)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return [(LACSecureData *)self initWithBytes:v5 length:v6];
}

+ (id)secureDataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  id v4 = [[LACSecureData alloc] initWithBytes:a3 length:a4];
  return v4;
}

+ (id)secureDataWithString:(id)a3
{
  id v3 = a3;
  id v4 = [[LACSecureData alloc] initWithString:v3];

  return v4;
}

+ (id)secureDataWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[LACSecureData alloc] initWithData:v3];

  return v4;
}

- (id)nullTerminatedCopy
{
  id v2 = +[LACSecureData secureDataWithBytes:[(LACSecureData *)self bytes] length:[(LACSecureData *)self length]];
  char v4 = 0;
  [v2 appendBytes:&v4 length:1];
  return v2;
}

+ (void)resetBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)reset
{
  bytes = self->_bytes;
  if (bytes)
  {
    +[LACSecureData resetBytes:bytes length:self->_bytesLength];
    free(self->_bytes);
    self->_unint64_t allocatedLength = 0;
    self->_bytes = 0;
    self->_size_t bytesLength = 0;
  }
}

- (const)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return self->_bytesLength;
}

- (id)data
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:self->_bytes length:self->_bytesLength];
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t bytesLength = self->_bytesLength;
  [(LACSecureData *)self prepareBuffer:bytesLength + a4];
  objc_super v8 = (char *)self->_bytes + bytesLength;
  memcpy(v8, a3, a4);
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  [(LACSecureData *)self appendBytes:v5 length:v6];
}

- (void)appendString:(id)a3
{
  id v4 = +[LACSecureData secureDataWithString:a3];
  [(LACSecureData *)self appendData:v4];
}

- (BOOL)removeLastCharacter
{
  bytes = (char *)self->_bytes;
  if (bytes)
  {
    unint64_t bytesLength = self->_bytesLength;
    if (bytesLength)
    {
      if (bytesLength == 1)
      {
        unint64_t v4 = 1;
LABEL_13:
        [(LACSecureData *)self resize:bytesLength - v4];
        LOBYTE(bytes) = 1;
        return (char)bytes;
      }
      uint64_t v5 = &bytes[bytesLength];
      uint64_t v6 = bytes - 1;
      unint64_t v4 = 1;
      while ((v6[bytesLength] & 0xC0) == 0x80)
      {
        --v6;
        if (bytesLength == ++v4)
        {
          unint64_t v4 = self->_bytesLength;
          break;
        }
      }
      if (v4 < 2) {
        goto LABEL_13;
      }
      LOBYTE(bytes) = 0;
      if (v4 <= 6 && v5[-v4] >= 0xC0u) {
        goto LABEL_13;
      }
    }
    else
    {
      LOBYTE(bytes) = 0;
    }
  }
  return (char)bytes;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LACSecureData *)self length];
  BOOL v6 = v5 == [v4 length]
    && timingsafe_bcmp(-[LACSecureData bytes](self, "bytes"), (const void *)[v4 bytes], -[LACSecureData length](self, "length")) == 0;

  return v6;
}

@end