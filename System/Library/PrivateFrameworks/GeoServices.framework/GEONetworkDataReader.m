@interface GEONetworkDataReader
- (BOOL)hasUnreadData;
- (BOOL)readUnsignedInt:(unsigned int *)a3;
- (BOOL)readUnsignedShort:(unsigned __int16 *)a3;
- (GEONetworkDataReader)initWithData:(id)a3;
- (id)allData;
- (id)readData:(unsigned int)a3;
- (id)readString;
- (void)appendNetworkData:(id)a3;
- (void)dealloc;
- (void)markOffset;
- (void)seekToMarkedOffset;
@end

@implementation GEONetworkDataReader

- (GEONetworkDataReader)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONetworkDataReader;
  v5 = [(GEONetworkDataReader *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;

    id v8 = v4;
    v5->_bytes = (const void *)[v8 bytes];
    v5->_dataLength = [v8 length];
  }

  return v5;
}

- (void)dealloc
{
  data = self->_data;
  self->_data = 0;

  self->_bookmarkOffset = -1;
  self->_offset = -1;
  self->_dataLength = 0;
  self->_bytes = 0;
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkDataReader;
  [(GEONetworkDataReader *)&v4 dealloc];
}

- (id)allData
{
  return self->_data;
}

- (void)appendNetworkData:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [(NSMutableData *)data appendData:v5];
  uint64_t v6 = [v5 length];

  v7 = self->_data;
  self->_dataLength += v6;
  self->_bytes = (const void *)[(NSMutableData *)v7 bytes];
}

- (id)readString
{
  unsigned __int16 v6 = 0;
  if ([(GEONetworkDataReader *)self readUnsignedShort:&v6]
    && v6
    && self->_offset + v6 <= self->_dataLength)
  {
    id v5 = [NSString alloc];
    v3 = (void *)[v5 initWithBytes:(char *)self->_bytes + self->_offset length:v6 encoding:1];
    self->_offset += v6;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)readUnsignedShort:(unsigned __int16 *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t offset = self->_offset;
  if (offset + 2 > self->_dataLength) {
    return 0;
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)self->_bytes + offset);
  *a3 = v5;
  self->_offset += 2;
  *a3 = bswap32(v5) >> 16;
  return 1;
}

- (BOOL)readUnsignedInt:(unsigned int *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t offset = self->_offset;
  if (offset + 4 > self->_dataLength) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)((char *)self->_bytes + offset);
  *a3 = v5;
  self->_offset += 4;
  *a3 = bswap32(v5);
  return 1;
}

- (id)readData:(unsigned int)a3
{
  if (self->_offset + a3 <= self->_dataLength)
  {
    uint64_t v5 = a3;
    v3 = -[NSMutableData subdataWithRange:](self->_data, "subdataWithRange:");
    self->_offset += v5;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)markOffset
{
  self->_bookmarkOffset = self->_offset;
}

- (void)seekToMarkedOffset
{
  self->_unint64_t offset = self->_bookmarkOffset;
}

- (BOOL)hasUnreadData
{
  return self->_offset < self->_dataLength;
}

- (void).cxx_destruct
{
}

@end