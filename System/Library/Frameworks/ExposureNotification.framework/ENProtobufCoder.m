@interface ENProtobufCoder
- (BOOL)_skipLength:(unint64_t)a3 error:(id *)a4;
- (BOOL)_writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)readFixedDouble:(double *)a3 error:(id *)a4;
- (BOOL)readFixedFloat:(float *)a3 error:(id *)a4;
- (BOOL)readFixedSInt32:(int *)a3 error:(id *)a4;
- (BOOL)readFixedSInt64:(int64_t *)a3 error:(id *)a4;
- (BOOL)readFixedUInt32:(unsigned int *)a3 error:(id *)a4;
- (BOOL)readFixedUInt64:(unint64_t *)a3 error:(id *)a4;
- (BOOL)readType:(char *)a3 tag:(unint64_t *)a4 eofOkay:(BOOL)a5 error:(id *)a6;
- (BOOL)readVarInt:(unint64_t *)a3 eofOkay:(BOOL)a4 error:(id *)a5;
- (BOOL)readVarIntBoolean:(BOOL *)a3 error:(id *)a4;
- (BOOL)readVarIntInt32:(int *)a3 error:(id *)a4;
- (BOOL)readVarIntSInt32:(int *)a3 error:(id *)a4;
- (BOOL)readVarIntSInt64:(int64_t *)a3 error:(id *)a4;
- (BOOL)readVarIntUInt32:(unsigned int *)a3 error:(id *)a4;
- (BOOL)readVarIntUInt64:(unint64_t *)a3 error:(id *)a4;
- (BOOL)skipType:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)writeFixedDouble:(double)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeFixedFloat:(float)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeFixedSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeFixedSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeFixedUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeFixedUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeLengthDelimitedPtr:(const void *)a3 length:(unint64_t)a4 tag:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeNSData:(id)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeNSString:(id)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeVarInt:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeVarIntBoolean:(BOOL)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeVarIntSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeVarIntSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeVarIntUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeVarIntUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5;
- (ENArchive)readArchive;
- (ENProtobufCoder)init;
- (NSMutableData)bufferData;
- (__sFILE)fileHandle;
- (char)writeBase;
- (char)writeDst;
- (char)writeLim;
- (const)_readLength:(unint64_t)a3 eofOkay:(BOOL)a4 error:(id *)a5;
- (const)readBase;
- (const)readEnd;
- (const)readLengthDelimited:(unint64_t *)a3 error:(id *)a4;
- (const)readSrc;
- (id)dequeueOrCreateSubCoder;
- (id)readNSDataAndReturnError:(id *)a3;
- (id)readNSStringAndReturnError:(id *)a3;
- (unint64_t)bufferMaxSize;
- (unint64_t)bufferOffset;
- (void)enqueueSubCoder:(id)a3;
- (void)prepareForReuse;
- (void)setBufferMaxSize:(unint64_t)a3;
- (void)setBufferOffset:(unint64_t)a3;
- (void)setFileHandle:(__sFILE *)a3;
- (void)setReadArchive:(id)a3;
- (void)setReadMemory:(const void *)a3 length:(unint64_t)a4;
- (void)setWriteMemory:(void *)a3 length:(unint64_t)a4;
- (void)setWriteMutableData:(id)a3;
@end

@implementation ENProtobufCoder

- (ENProtobufCoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENProtobufCoder;
  v2 = [(ENProtobufCoder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_bufferMaxSize = 0x20000;
    v4 = v2;
  }

  return v3;
}

- (void)setReadMemory:(const void *)a3 length:(unint64_t)a4
{
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  self->_readBase = (const char *)a3;
  self->_readSrc = (const char *)a3;
  self->_readEnd = (char *)a3 + a4;
  *(_OWORD *)&self->_writeBase = 0u;
  *(_OWORD *)&self->_writeLim = 0u;
  bufferData = self->_bufferData;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setWriteMemory:(void *)a3 length:(unint64_t)a4
{
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  self->_readBase = 0;
  self->_readSrc = 0;
  self->_readEnd = 0;
  self->_writeBase = (char *)a3;
  self->_writeDst = (char *)a3;
  self->_writeLim = (char *)a3 + a4;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setWriteMutableData:(id)a3
{
  v4 = (NSMutableData *)a3;
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = v4;

  self->_bufferOffset = 0;
}

- (void)setFileHandle:(__sFILE *)a3
{
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = a3;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setReadArchive:(id)a3
{
  objc_storeStrong((id *)&self->_readArchive, a3);
  id v5 = a3;
  *(_OWORD *)&self->_readBase = 0u;
  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (id)dequeueOrCreateSubCoder
{
  v2 = [(NSMutableArray *)self->_subCoders popFirstObject];
  if (v2)
  {
    v3 = v2;
    [(ENProtobufCoder *)v2 prepareForReuse];
  }
  else
  {
    v3 = objc_alloc_init(ENProtobufCoder);
  }

  return v3;
}

- (void)enqueueSubCoder:(id)a3
{
  id v4 = a3;
  subCoders = self->_subCoders;
  id v8 = v4;
  if (!subCoders)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subCoders;
    self->_subCoders = v6;

    id v4 = v8;
    subCoders = self->_subCoders;
  }
  [(NSMutableArray *)subCoders addObject:v4];
}

- (void)prepareForReuse
{
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (BOOL)readType:(char *)a3 tag:(unint64_t *)a4 eofOkay:(BOOL)a5 error:(id *)a6
{
  unint64_t v11 = 0;
  BOOL v8 = [(ENProtobufCoder *)self readVarInt:&v11 eofOkay:a5 error:a6];
  if (v8)
  {
    char v9 = v11;
    *a4 = v11 >> 3;
    *a3 = v9 & 7;
  }
  return v8;
}

- (const)readLengthDelimited:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v9 = 0;
  if (![(ENProtobufCoder *)self readVarInt:&v9 eofOkay:0 error:a4]) {
    return 0;
  }
  v7 = self;
  result = [(ENProtobufCoder *)v7 _readLength:v9 eofOkay:0 error:a4];
  if (result) {
    *a3 = v9;
  }
  return result;
}

- (BOOL)writeLengthDelimitedPtr:(const void *)a3 length:(unint64_t)a4 tag:(unint64_t)a5 error:(id *)a6
{
  if (![(ENProtobufCoder *)self writeVarInt:(8 * a5) | 2 error:a6]
    || ![(ENProtobufCoder *)self writeVarInt:a4 error:a6])
  {
    return 0;
  }

  return [(ENProtobufCoder *)self _writeBytes:a3 length:a4 error:a6];
}

- (BOOL)skipType:(unsigned __int8)a3 error:(id *)a4
{
  id v5 = self;
  switch(a3)
  {
    case 0u:
      uint64_t v11 = 0;
      BOOL v6 = [(ENProtobufCoder *)self readVarInt:&v11 eofOkay:0 error:a4];
      LOBYTE(v7) = 0;
      if (v6) {
        goto LABEL_11;
      }
      return v7;
    case 1u:
      uint64_t v8 = 8;
      goto LABEL_10;
    case 2u:
      uint64_t v11 = 0;
      BOOL v7 = [(ENProtobufCoder *)self readVarInt:&v11 eofOkay:0 error:a4];
      if (!v7) {
        return v7;
      }
      uint64_t v8 = v11;
      self = v5;
LABEL_10:
      if ([(ENProtobufCoder *)self _skipLength:v8 error:a4]) {
LABEL_11:
      }
        LOBYTE(v7) = 1;
      else {
LABEL_12:
      }
        LOBYTE(v7) = 0;
      break;
    case 5u:
      uint64_t v8 = 4;
      goto LABEL_10;
    default:
      if (!a4) {
        goto LABEL_12;
      }
      NSErrorF();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = 0;
      *a4 = v9;
      break;
  }
  return v7;
}

- (id)readNSDataAndReturnError:(id *)a3
{
  uint64_t v11 = 0;
  if (![(ENProtobufCoder *)self readVarInt:&v11 eofOkay:0 error:a3])
  {
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (v11 == -1)
  {
    if (a3)
    {
      NSErrorF();
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  id v5 = self;
  BOOL v6 = [(ENProtobufCoder *)v5 _readLength:v11 eofOkay:0 error:a3];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v8 = (char *)[v7 initWithBytes:v6 length:v11];
    BOOL v6 = v8;
    if (v8)
    {
      id v9 = v8;
    }
    else if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:

  return v6;
}

- (BOOL)writeNSData:(id)a3 tag:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  return [(ENProtobufCoder *)self writeLengthDelimitedPtr:v9 length:v10 tag:a4 error:a5];
}

- (id)readNSStringAndReturnError:(id *)a3
{
  uint64_t v11 = 0;
  if (![(ENProtobufCoder *)self readVarInt:&v11 eofOkay:0 error:a3])
  {
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (v11 == -1)
  {
    if (a3)
    {
      NSErrorF();
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  id v5 = self;
  BOOL v6 = [(ENProtobufCoder *)v5 _readLength:v11 eofOkay:0 error:a3];
  if (v6)
  {
    id v7 = [NSString alloc];
    id v8 = (char *)[v7 initWithBytes:v6 length:v11 encoding:4];
    BOOL v6 = v8;
    if (v8)
    {
      uint64_t v9 = v8;
    }
    else if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:

  return v6;
}

- (BOOL)writeNSString:(id)a3 tag:(unint64_t)a4 error:(id *)a5
{
  id v8 = (const char *)[a3 UTF8String];
  size_t v9 = strlen(v8);

  return [(ENProtobufCoder *)self writeLengthDelimitedPtr:v8 length:v9 tag:a4 error:a5];
}

- (BOOL)readVarInt:(unint64_t *)a3 eofOkay:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  unint64_t v9 = 0;
  unint64_t v10 = -7;
  while (1)
  {
    uint64_t v11 = [(ENProtobufCoder *)self _readLength:1 eofOkay:v6 error:a5];
    if (!v11) {
      return (char)v11;
    }
    unint64_t v12 = (unint64_t)(*v11 & 0x7F) << (v10 + 7);
    if (v12 >> (v10 + 7) != (*v11 & 0x7F)) {
      break;
    }
    v9 |= v12;
    if ((*v11 & 0x80000000) == 0)
    {
      *a3 = v9;
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    v10 += 7;
    if (v10 >= 0x39)
    {
      if (a5) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
  }
  if (a5)
  {
LABEL_11:
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a5 = v13;
    return (char)v11;
  }
LABEL_12:
  LOBYTE(v11) = 0;
  return (char)v11;
}

- (BOOL)writeVarInt:(unint64_t)a3 error:(id *)a4
{
  while (a3 >= 0x80)
  {
    char v9 = a3 | 0x80;
    a3 >>= 7;
    if (![(ENProtobufCoder *)self _writeBytes:&v9 length:1 error:a4]) {
      return 0;
    }
  }
  char v8 = a3;
  return [(ENProtobufCoder *)self _writeBytes:&v8 length:1 error:a4];
}

- (BOOL)readVarIntSInt32:(int *)a3 error:(id *)a4
{
  uint64_t v7 = 0;
  BOOL v5 = [(ENProtobufCoder *)self readVarInt:&v7 eofOkay:0 error:a4];
  if (v5) {
    *a3 = -(v7 & 1) ^ ((int)v7 >> 1);
  }
  return v5;
}

- (BOOL)writeVarIntSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:8 * a4 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(ENProtobufCoder *)self writeVarInt:(2 * a3) ^ (a3 >> 31) error:a5];
  }
  return v8;
}

- (BOOL)readVarIntInt32:(int *)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  BOOL v6 = [(ENProtobufCoder *)self readVarInt:&v9 eofOkay:0 error:a4];
  if (v6)
  {
    if (v9 == (int)v9)
    {
      *a3 = v9;
      LOBYTE(v6) = 1;
    }
    else if (a4)
    {
      NSErrorF();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = 0;
      *a4 = v7;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)readVarIntUInt32:(unsigned int *)a3 error:(id *)a4
{
  unint64_t v9 = 0;
  BOOL v6 = [(ENProtobufCoder *)self readVarInt:&v9 eofOkay:0 error:a4];
  if (v6)
  {
    if (HIDWORD(v9))
    {
      if (a4)
      {
        NSErrorF();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = 0;
        *a4 = v7;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      *a3 = v9;
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)writeVarIntUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:8 * a4 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(ENProtobufCoder *)self writeVarInt:a3 error:a5];
  }
  return v8;
}

- (BOOL)readVarIntSInt64:(int64_t *)a3 error:(id *)a4
{
  uint64_t v7 = 0;
  BOOL v5 = [(ENProtobufCoder *)self readVarInt:&v7 eofOkay:0 error:a4];
  if (v5) {
    *a3 = -(v7 & 1) ^ (v7 >> 1);
  }
  return v5;
}

- (BOOL)writeVarIntSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:8 * a4 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(ENProtobufCoder *)self writeVarInt:(2 * a3) ^ (a3 >> 63) error:a5];
  }
  return v8;
}

- (BOOL)readVarIntUInt64:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v7 = 0;
  BOOL v5 = [(ENProtobufCoder *)self readVarInt:&v7 eofOkay:0 error:a4];
  if (v5) {
    *a3 = v7;
  }
  return v5;
}

- (BOOL)writeVarIntUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:8 * a4 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(ENProtobufCoder *)self writeVarInt:a3 error:a5];
  }
  return v8;
}

- (BOOL)readVarIntBoolean:(BOOL *)a3 error:(id *)a4
{
  uint64_t v7 = 0;
  BOOL v5 = [(ENProtobufCoder *)self readVarInt:&v7 eofOkay:0 error:a4];
  if (v5) {
    *a3 = v7 != 0;
  }
  return v5;
}

- (BOOL)writeVarIntBoolean:(BOOL)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:8 * a4 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(ENProtobufCoder *)self writeVarInt:v6 error:a5];
  }
  return v8;
}

- (BOOL)readFixedFloat:(float *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:4 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(float *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedFloat:(float)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 5);
  if (v8)
  {
    float v10 = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:&v10 length:4 error:a5];
  }
  return v8;
}

- (BOOL)readFixedSInt32:(int *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:4 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(_DWORD *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:(8 * a4) | 5 error:a5];
  if (v8)
  {
    int v10 = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:&v10 length:4 error:a5];
  }
  return v8;
}

- (BOOL)readFixedUInt32:(unsigned int *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:4 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(_DWORD *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:(8 * a4) | 5 error:a5];
  if (v8)
  {
    unsigned int v10 = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:&v10 length:4 error:a5];
  }
  return v8;
}

- (BOOL)readFixedDouble:(double *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:8 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(double *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedDouble:(double)a3 tag:(unint64_t)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 1);
  if (v8)
  {
    *(double *)unsigned int v10 = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:v10 length:8 error:a5];
  }
  return v8;
}

- (BOOL)readFixedSInt64:(int64_t *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:8 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(void *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:(8 * a4) | 1 error:a5];
  if (v8)
  {
    v10[0] = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:v10 length:8 error:a5];
  }
  return v8;
}

- (BOOL)readFixedUInt64:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5 = [(ENProtobufCoder *)self _readLength:8 eofOkay:0 error:a4];
  if (v5) {
    *a3 = *(void *)v5;
  }
  return v5 != 0;
}

- (BOOL)writeFixedUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v8 = [(ENProtobufCoder *)self writeVarInt:(8 * a4) | 1 error:a5];
  if (v8)
  {
    v10[0] = a3;
    LOBYTE(v8) = [(ENProtobufCoder *)self _writeBytes:v10 length:8 error:a5];
  }
  return v8;
}

- (const)_readLength:(unint64_t)a3 eofOkay:(BOOL)a4 error:(id *)a5
{
  readSrc = (char *)self->_readSrc;
  if (readSrc)
  {
    if (self->_readEnd - (const char *)readSrc < a3)
    {
      if (a5)
      {
        if (a4)
        {
          readSrc = 0;
          *a5 = 0;
          return readSrc;
        }
        NSErrorF();
        id v16 = objc_claimAutoreleasedReturnValue();
        *a5 = v16;
      }
      return 0;
    }
    self->_readSrc = &readSrc[a3];
    return readSrc;
  }
  fileHandle = self->_fileHandle;
  unint64_t v10 = self->_readArchive;
  if (!((unint64_t)fileHandle | v10))
  {
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  if (self->_bufferMaxSize < a3)
  {
    if (!a5) {
      goto LABEL_23;
    }
LABEL_13:
    NSErrorF();
    readSrc = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (a3 <= 0x100)
  {
    readSrc = (char *)self->_staticBuffer;
    if (!fileHandle) {
      goto LABEL_8;
    }
LABEL_18:
    if (fread(readSrc, 1uLL, a3, fileHandle) != a3)
    {
      if (a5)
      {
        if (feof(fileHandle))
        {
          readSrc = 0;
          *a5 = 0;
          goto LABEL_24;
        }
        __error();
        NSErrorF();
        id v14 = objc_claimAutoreleasedReturnValue();
        *a5 = v14;
      }
LABEL_23:
      readSrc = 0;
    }
LABEL_24:

    return readSrc;
  }
  uint64_t v11 = self->_bufferData;
  if (v11)
  {
    unint64_t v12 = v11;
    [(NSMutableData *)v11 setLength:a3];
  }
  else
  {
    unint64_t v12 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:a3];
    objc_storeStrong((id *)&self->_bufferData, v12);
  }
  id v13 = v12;
  readSrc = [(NSMutableData *)v13 mutableBytes];

  if (fileHandle) {
    goto LABEL_18;
  }
LABEL_8:
  if (v10)
  {
    if (([(id)v10 readDataIntoBuffer:readSrc length:a3 error:a5] & 1) == 0) {
      readSrc = 0;
    }
    goto LABEL_24;
  }
  v17 = (ENProtobufCoder *)FatalErrorF();
  return (const char *)[(ENProtobufCoder *)v17 _skipLength:v19 error:v20];
}

- (BOOL)_skipLength:(unint64_t)a3 error:(id *)a4
{
  readSrc = self->_readSrc;
  if (readSrc)
  {
    if (self->_readEnd - readSrc >= a3)
    {
      self->_readSrc = &readSrc[a3];
      return 1;
    }
    if (!a4) {
      return 0;
    }
LABEL_13:
    NSErrorF();
    char v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (self->_fileHandle)
  {
    char v7 = 1;
    if (fseeko(self->_fileHandle, a3, 1) && (!*__error() || *__error()))
    {
      if (!a4) {
        return 0;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v9 = self->_readArchive;
    unint64_t v10 = v9;
    if (v9)
    {
      char v7 = [(ENArchive *)v9 skipBytes:a3 error:a4];
    }
    else if (a4)
    {
      NSErrorF();
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  writeDst = self->_writeDst;
  if (!writeDst)
  {
    fileHandle = self->_fileHandle;
    if (fileHandle)
    {
      BOOL v10 = 1;
      if (fwrite(a3, 1uLL, a4, fileHandle) == a4) {
        return v10;
      }
      if (a5)
      {
        __error();
LABEL_14:
        NSErrorF();
        BOOL v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        return v10;
      }
      return 0;
    }
    unint64_t v12 = self->_bufferData;
    id v13 = v12;
    if (v12)
    {
      if (self->_bufferMaxSize - self->_bufferOffset >= a4)
      {
        [(NSMutableData *)v12 appendBytes:a3 length:a4];
        self->_bufferOffset += a4;
        BOOL v10 = 1;
LABEL_18:

        return v10;
      }
      if (!a5)
      {
LABEL_17:
        BOOL v10 = 0;
        goto LABEL_18;
      }
    }
    else if (!a5)
    {
      goto LABEL_17;
    }
    NSErrorF();
    BOOL v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (self->_writeLim - writeDst < a4)
  {
    if (a5) {
      goto LABEL_14;
    }
    return 0;
  }
  memcpy(self->_writeDst, a3, a4);
  self->_writeDst = &writeDst[a4];
  return 1;
}

- (ENArchive)readArchive
{
  return self->_readArchive;
}

- (const)readBase
{
  return self->_readBase;
}

- (const)readSrc
{
  return self->_readSrc;
}

- (const)readEnd
{
  return self->_readEnd;
}

- (char)writeBase
{
  return self->_writeBase;
}

- (char)writeDst
{
  return self->_writeDst;
}

- (char)writeLim
{
  return self->_writeLim;
}

- (__sFILE)fileHandle
{
  return self->_fileHandle;
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (void)setBufferOffset:(unint64_t)a3
{
  self->_bufferOffset = a3;
}

- (unint64_t)bufferMaxSize
{
  return self->_bufferMaxSize;
}

- (void)setBufferMaxSize:(unint64_t)a3
{
  self->_bufferMaxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_readArchive, 0);

  objc_storeStrong((id *)&self->_subCoders, 0);
}

@end