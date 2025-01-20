@interface APSProtocolMessage
- (APSProtocolMessage)initWithCommand:(int)a3;
- (id)copyMessageData;
- (void)_appendEightBytes:(unint64_t)a3;
- (void)_appendFourBytes:(unsigned int)a3;
- (void)_appendOneByte:(unsigned __int8)a3;
- (void)_appendTwoBytes:(unsigned __int16)a3;
- (void)appendEightByteItem:(unsigned __int8)a3 bytes:(unint64_t)a4;
- (void)appendFourByteItem:(unsigned __int8)a3 bytes:(unsigned int)a4;
- (void)appendItem:(unsigned __int8)a3 data:(id)a4;
- (void)appendItem:(unsigned __int8)a3 string:(id)a4;
- (void)appendOneByteItem:(unsigned __int8)a3 byte:(unsigned __int8)a4;
- (void)appendTwoByteItem:(unsigned __int8)a3 bytes:(unsigned __int16)a4;
@end

@implementation APSProtocolMessage

- (APSProtocolMessage)initWithCommand:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)APSProtocolMessage;
  v4 = [(APSProtocolMessage *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_command = a3;
    v6 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    data = v5->_data;
    v5->_data = v6;
  }
  return v5;
}

- (void)_appendOneByte:(unsigned __int8)a3
{
  data = self->_data;
  unsigned __int8 v4 = a3;
  [(NSMutableData *)data appendBytes:&v4 length:1];
}

- (void)_appendTwoBytes:(unsigned __int16)a3
{
  data = self->_data;
  __int16 v4 = __rev16(a3);
  [(NSMutableData *)data appendBytes:&v4 length:2];
}

- (void)_appendFourBytes:(unsigned int)a3
{
  data = self->_data;
  unsigned int v4 = bswap32(a3);
  [(NSMutableData *)data appendBytes:&v4 length:4];
}

- (void)_appendEightBytes:(unint64_t)a3
{
  data = self->_data;
  unint64_t v4 = bswap64(a3);
  [(NSMutableData *)data appendBytes:&v4 length:8];
}

- (void)appendItem:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  [(APSProtocolMessage *)self _appendOneByte:v4];
  -[APSProtocolMessage _appendTwoBytes:](self, "_appendTwoBytes:", (unsigned __int16)[v6 length]);
  [(NSMutableData *)self->_data appendData:v6];
}

- (void)appendItem:(unsigned __int8)a3 string:(id)a4
{
  uint64_t v4 = a3;
  id v6 = [a4 dataUsingEncoding:4];
  [(APSProtocolMessage *)self appendItem:v4 data:v6];
}

- (void)appendOneByteItem:(unsigned __int8)a3 byte:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  [(APSProtocolMessage *)self _appendOneByte:a3];
  [(APSProtocolMessage *)self _appendTwoBytes:1];
  [(APSProtocolMessage *)self _appendOneByte:v4];
}

- (void)appendTwoByteItem:(unsigned __int8)a3 bytes:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(APSProtocolMessage *)self _appendOneByte:a3];
  [(APSProtocolMessage *)self _appendTwoBytes:2];
  [(APSProtocolMessage *)self _appendTwoBytes:v4];
}

- (void)appendFourByteItem:(unsigned __int8)a3 bytes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(APSProtocolMessage *)self _appendOneByte:a3];
  [(APSProtocolMessage *)self _appendTwoBytes:4];
  [(APSProtocolMessage *)self _appendFourBytes:v4];
}

- (void)appendEightByteItem:(unsigned __int8)a3 bytes:(unint64_t)a4
{
  [(APSProtocolMessage *)self _appendOneByte:a3];
  [(APSProtocolMessage *)self _appendTwoBytes:8];
  [(APSProtocolMessage *)self _appendEightBytes:a4];
}

- (id)copyMessageData
{
  id v3 = objc_alloc_init((Class)NSMutableData);
  char command = self->_command;
  [v3 appendBytes:&command length:1];
  unsigned int v6 = bswap32([(NSMutableData *)self->_data length]);
  [v3 appendBytes:&v6 length:4];
  [v3 appendData:self->_data];
  return v3;
}

- (void).cxx_destruct
{
}

@end