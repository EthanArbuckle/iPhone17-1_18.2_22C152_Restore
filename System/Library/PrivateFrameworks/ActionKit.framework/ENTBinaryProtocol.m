@interface ENTBinaryProtocol
- (BOOL)readBool;
- (BOOL)strictRead;
- (BOOL)strictWrite;
- (ENTBinaryProtocol)initWithTransport:(id)a3;
- (ENTBinaryProtocol)initWithTransport:(id)a3 strictRead:(BOOL)a4 strictWrite:(BOOL)a5;
- (ENTTransport)transport;
- (double)readDouble;
- (id)readBinary;
- (id)readString;
- (id)readStringBody:(int)a3;
- (int)messageSizeLimit;
- (int)readI32;
- (int64_t)readI64;
- (signed)readI16;
- (unsigned)readByte;
- (void)readFieldBeginReturningName:(id *)a3 type:(int *)a4 fieldID:(int *)a5;
- (void)readListBeginReturningElementType:(int *)a3 size:(int *)a4;
- (void)readMapBeginReturningKeyType:(int *)a3 valueType:(int *)a4 size:(int *)a5;
- (void)readMessageBeginReturningName:(id *)a3 type:(int *)a4 sequenceID:(int *)a5;
- (void)readSetBeginReturningElementType:(int *)a3 size:(int *)a4;
- (void)readStructBeginReturningName:(id *)a3;
- (void)setMessageSizeLimit:(int)a3;
- (void)setStrictRead:(BOOL)a3;
- (void)setStrictWrite:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)writeBinary:(id)a3;
- (void)writeByte:(unsigned __int8)a3;
- (void)writeDouble:(double)a3;
- (void)writeFieldBeginWithName:(id)a3 type:(int)a4 fieldID:(int)a5;
- (void)writeFieldStop;
- (void)writeI16:(signed __int16)a3;
- (void)writeI32:(int)a3;
- (void)writeI64:(int64_t)a3;
- (void)writeListBeginWithElementType:(int)a3 size:(int)a4;
- (void)writeMapBeginWithKeyType:(int)a3 valueType:(int)a4 size:(int)a5;
- (void)writeMessageBeginWithName:(id)a3 type:(int)a4 sequenceID:(int)a5;
- (void)writeSetBeginWithElementType:(int)a3 size:(int)a4;
- (void)writeString:(id)a3;
@end

@implementation ENTBinaryProtocol

- (void).cxx_destruct
{
}

- (void)setMessageSizeLimit:(int)a3
{
  self->_messageSizeLimit = a3;
}

- (int)messageSizeLimit
{
  return self->_messageSizeLimit;
}

- (void)setStrictWrite:(BOOL)a3
{
  self->_strictWrite = a3;
}

- (BOOL)strictWrite
{
  return self->_strictWrite;
}

- (void)setStrictRead:(BOOL)a3
{
  self->_strictRead = a3;
}

- (BOOL)strictRead
{
  return self->_strictRead;
}

- (void)setTransport:(id)a3
{
}

- (ENTTransport)transport
{
  return self->_transport;
}

- (void)writeListBeginWithElementType:(int)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(ENTBinaryProtocol *)self writeByte:a3];
  [(ENTBinaryProtocol *)self writeI32:v4];
}

- (void)writeSetBeginWithElementType:(int)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(ENTBinaryProtocol *)self writeByte:a3];
  [(ENTBinaryProtocol *)self writeI32:v4];
}

- (void)writeMapBeginWithKeyType:(int)a3 valueType:(int)a4 size:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  unsigned __int8 v6 = a4;
  [(ENTBinaryProtocol *)self writeByte:a3];
  [(ENTBinaryProtocol *)self writeByte:v6];
  [(ENTBinaryProtocol *)self writeI32:v5];
}

- (void)writeFieldStop
{
}

- (void)writeBinary:(id)a3
{
  id v4 = a3;
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", [v4 length]);
  id v8 = [(ENTBinaryProtocol *)self transport];
  id v5 = v4;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];

  [v8 write:v6 offset:0 length:v7];
}

- (void)writeString:(id)a3
{
  if (a3)
  {
    id v4 = (const char *)[a3 UTF8String];
    size_t v5 = strlen(v4);
    [(ENTBinaryProtocol *)self writeI32:v5];
    id v6 = [(ENTBinaryProtocol *)self transport];
    [v6 write:v4 offset:0 length:v5];
  }
  else
  {
    -[ENTBinaryProtocol writeI32:](self, "writeI32:");
  }
}

- (void)writeDouble:(double)a3
{
}

- (void)writeI64:(int64_t)a3
{
  v3 = [(ENTBinaryProtocol *)self transport];
  [v3 write:&v4 offset:0 length:8];
}

- (void)writeI16:(signed __int16)a3
{
  __int16 v4 = bswap32(a3) >> 16;
  v3 = [(ENTBinaryProtocol *)self transport];
  [v3 write:&v4 offset:0 length:2];
}

- (void)writeI32:(int)a3
{
  unsigned int v4 = bswap32(a3);
  v3 = [(ENTBinaryProtocol *)self transport];
  [v3 write:&v4 offset:0 length:4];
}

- (void)writeFieldBeginWithName:(id)a3 type:(int)a4 fieldID:(int)a5
{
  __int16 v5 = a5;
  [(ENTBinaryProtocol *)self writeByte:a4];
  [(ENTBinaryProtocol *)self writeI16:v5];
}

- (void)writeMessageBeginWithName:(id)a3 type:(int)a4 sequenceID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  if ([(ENTBinaryProtocol *)self strictWrite])
  {
    [(ENTBinaryProtocol *)self writeI32:VERSION_1 | a4];
    [(ENTBinaryProtocol *)self writeString:v8];
  }
  else
  {
    [(ENTBinaryProtocol *)self writeString:v8];
    [(ENTBinaryProtocol *)self writeByte:a4];
  }
  [(ENTBinaryProtocol *)self writeI32:v5];
}

- (void)writeByte:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(ENTBinaryProtocol *)self transport];
  [v3 write:&v4 offset:0 length:1];
}

- (void)readListBeginReturningElementType:(int *)a3 size:(int *)a4
{
  int v7 = [(ENTBinaryProtocol *)self readByte];
  int v8 = [(ENTBinaryProtocol *)self readI32];
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = v8;
  }
}

- (void)readSetBeginReturningElementType:(int *)a3 size:(int *)a4
{
  int v7 = [(ENTBinaryProtocol *)self readByte];
  int v8 = [(ENTBinaryProtocol *)self readI32];
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = v8;
  }
}

- (void)readMapBeginReturningKeyType:(int *)a3 valueType:(int *)a4 size:(int *)a5
{
  int v9 = [(ENTBinaryProtocol *)self readByte];
  int v10 = [(ENTBinaryProtocol *)self readByte];
  int v11 = [(ENTBinaryProtocol *)self readI32];
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v11;
  }
}

- (id)readBinary
{
  size_t v3 = [(ENTBinaryProtocol *)self readI32];
  unsigned __int8 v4 = malloc_type_malloc(v3, 0x83998C40uLL);
  if (!v4)
  {
    int v9 = objc_msgSend(NSString, "stringWithFormat:", @"Out of memory.  Unable to allocate %d bytes trying to read binary data.", v3);
    id v10 = +[ENTException exceptionWithName:@"TProtocolException" reason:v9];

    objc_exception_throw(v10);
  }
  uint64_t v5 = v4;
  id v6 = [(ENTBinaryProtocol *)self transport];
  [v6 readAll:v5 offset:0 length:v3];

  int v7 = (void *)MEMORY[0x263EFF8F8];
  return (id)[v7 dataWithBytesNoCopy:v5 length:v3 freeWhenDone:1];
}

- (double)readDouble
{
  return COERCE_DOUBLE([(ENTBinaryProtocol *)self readI64]);
}

- (int64_t)readI64
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = [(ENTBinaryProtocol *)self transport];
  [v2 readAll:v4 offset:0 length:8];

  return bswap64(v4[0]);
}

- (signed)readI16
{
  v2 = [(ENTBinaryProtocol *)self transport];
  [v2 readAll:&v5 offset:0 length:2];

  return (int)bswap32(v5) >> 16;
}

- (unsigned)readByte
{
  unsigned __int8 v4 = 0;
  v2 = [(ENTBinaryProtocol *)self transport];
  [v2 readAll:&v4 offset:0 length:1];

  return v4;
}

- (BOOL)readBool
{
  return [(ENTBinaryProtocol *)self readByte] == 1;
}

- (id)readString
{
  uint64_t v3 = [(ENTBinaryProtocol *)self readI32];
  return [(ENTBinaryProtocol *)self readStringBody:v3];
}

- (int)readI32
{
  v2 = [(ENTBinaryProtocol *)self transport];
  [v2 readAll:&v4 offset:0 length:4];

  return bswap32(v4);
}

- (void)readFieldBeginReturningName:(id *)a3 type:(int *)a4 fieldID:(int *)a5
{
  if (a3) {
    *a3 = 0;
  }
  int v8 = [(ENTBinaryProtocol *)self readByte];
  if (a4) {
    *a4 = v8;
  }
  if (v8)
  {
    int v9 = [(ENTBinaryProtocol *)self readI16];
    if (a5) {
      *a5 = v9;
    }
  }
}

- (void)readStructBeginReturningName:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
}

- (void)readMessageBeginReturningName:(id *)a3 type:(int *)a4 sequenceID:(int *)a5
{
  uint64_t v9 = [(ENTBinaryProtocol *)self readI32];
  uint64_t v10 = v9;
  if ((v9 & 0x80000000) == 0)
  {
    if ([(ENTBinaryProtocol *)self strictRead])
    {
      v13 = @"Missing version in readMessageBegin, old client?";
    }
    else
    {
      if ([(ENTBinaryProtocol *)self messageSizeLimit] < 1
        || (int)v10 <= [(ENTBinaryProtocol *)self messageSizeLimit])
      {
        id v17 = [(ENTBinaryProtocol *)self readStringBody:v10];
        if (a3) {
          *a3 = v17;
        }
        int v11 = [(ENTBinaryProtocol *)self readByte];
        if (a4) {
          *a4 = v11;
        }
        goto LABEL_14;
      }
      if (v10 != 1013478509 && v10 != 1008813135)
      {
        v15 = objc_msgSend(NSString, "stringWithFormat:", @"Message too big.  Size limit is: %d Message size is: %d", -[ENTBinaryProtocol messageSizeLimit](self, "messageSizeLimit"), v10);
        id v16 = +[ENTException exceptionWithName:@"TProtocolException" reason:v15];

        objc_exception_throw(v16);
      }
      v13 = @"Service did not return a Thrift structure";
    }
LABEL_24:
    id v14 = +[ENTException exceptionWithName:@"TProtocolException" reason:v13];
    objc_exception_throw(v14);
  }
  if ((VERSION_MASK & v9) != VERSION_1)
  {
    v13 = @"Bad version in readMessageBegin";
    goto LABEL_24;
  }
  if (a4) {
    *a4 = (VERSION_MASK & v9);
  }
  id v17 = [(ENTBinaryProtocol *)self readString];
  if (a3) {
    *a3 = v17;
  }
LABEL_14:
  int v12 = [(ENTBinaryProtocol *)self readI32];
  if (a5) {
    *a5 = v12;
  }
}

- (id)readStringBody:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int16 v5 = malloc_type_malloc(a3 + 1, 0x1CBC71DBuLL);
  if (!v5)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Unable to allocate memory in %s, size: %i", "-[ENTBinaryProtocol readStringBody:]", v3];
    id v11 = +[ENTException exceptionWithName:@"TProtocolException" reason:v10];

    objc_exception_throw(v11);
  }
  id v6 = v5;
  int v7 = [(ENTBinaryProtocol *)self transport];
  [v7 readAll:v6 offset:0 length:v3];

  v6[(int)v3] = 0;
  int v8 = (void *)[[NSString alloc] initWithBytesNoCopy:v6 length:(int)v3 encoding:4 freeWhenDone:1];
  return v8;
}

- (ENTBinaryProtocol)initWithTransport:(id)a3 strictRead:(BOOL)a4 strictWrite:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENTBinaryProtocol;
  uint64_t v9 = [(ENTBinaryProtocol *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    [(ENTBinaryProtocol *)v9 setTransport:v8];
    [(ENTBinaryProtocol *)v10 setStrictRead:v6];
    [(ENTBinaryProtocol *)v10 setStrictWrite:v5];
  }

  return v10;
}

- (ENTBinaryProtocol)initWithTransport:(id)a3
{
  return [(ENTBinaryProtocol *)self initWithTransport:a3 strictRead:0 strictWrite:0];
}

@end