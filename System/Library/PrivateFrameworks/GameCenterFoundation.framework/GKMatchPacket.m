@interface GKMatchPacket
- (BOOL)valid;
- (GKMatchPacket)init;
- (GKMatchPacket)initWithMessage:(id)a3;
- (NSData)data;
- (id)message;
- (unsigned)checksum;
- (unsigned)packetType;
- (unsigned)sequenceNumber;
- (unsigned)totalLength;
- (unsigned)version;
- (void)setChecksum:(unsigned __int16)a3;
- (void)setData:(id)a3;
- (void)setPacketType:(unsigned __int8)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setTotalLength:(unsigned int)a3;
- (void)setValid:(BOOL)a3;
- (void)setVersion:(unsigned __int8)a3;
@end

@implementation GKMatchPacket

- (GKMatchPacket)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKMatchPacket;
  result = [(GKMatchPacket *)&v3 init];
  if (result) {
    result->_version = 1;
  }
  return result;
}

- (GKMatchPacket)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [(GKMatchPacket *)self init];
  v6 = v5;
  if (v5)
  {
    [(GKMatchPacket *)v5 setValid:1];
    id v7 = v4;
    v8 = (unsigned __int8 *)[v7 bytes];
    if ((unint64_t)[v7 length] <= 0xB) {
      [(GKMatchPacket *)v6 setValid:0];
    }
    if ([(GKMatchPacket *)v6 valid])
    {
      [(GKMatchPacket *)v6 setVersion:*v8];
      [(GKMatchPacket *)v6 setPacketType:v8[1]];
      [(GKMatchPacket *)v6 setSequenceNumber:*(unsigned int *)(v8 + 2)];
      [(GKMatchPacket *)v6 setTotalLength:*(unsigned int *)(v8 + 6)];
      unsigned int v9 = [(GKMatchPacket *)v6 totalLength];
      if ([v7 length] != v9) {
        [(GKMatchPacket *)v6 setValid:0];
      }
      v10 = (unsigned __int16 *)[v7 bytes];
      unsigned int v11 = 0;
      int v12 = 12;
      do
      {
        int v13 = *v10++;
        v11 += v13;
        v12 -= 2;
      }
      while ((_WORD)v12);
      if (v11 >= 0x10000)
      {
        do
          unsigned int v11 = HIWORD(v11) + (unsigned __int16)v11;
        while (HIWORD(v11));
      }
      if (v11 != 0xFFFF) {
        [(GKMatchPacket *)v6 setValid:0];
      }
      v8 += 12;
    }
    if ([(GKMatchPacket *)v6 valid])
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v8, -[GKMatchPacket totalLength](v6, "totalLength") - 12);
      [(GKMatchPacket *)v6 setData:v14];
    }
    else
    {
      [(GKMatchPacket *)v6 setData:v7];
    }
  }

  return v6;
}

- (id)message
{
  self->_totalLength = [(NSData *)self->_data length] + 12;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:");
  [v3 appendBytes:&self->_version length:1];
  [v3 appendBytes:&self->_packetType length:1];
  [v3 appendBytes:&self->_sequenceNumber length:4];
  [v3 appendBytes:&self->_totalLength length:4];
  id v4 = v3;
  v5 = (unsigned __int16 *)[v4 bytes];
  unsigned int v6 = 0;
  int v7 = 10;
  do
  {
    int v8 = *v5++;
    v6 += v8;
    v7 -= 2;
  }
  while ((_WORD)v7);
  if (v6 >= 0x10000)
  {
    do
      unsigned int v6 = HIWORD(v6) + (unsigned __int16)v6;
    while (HIWORD(v6));
  }
  __int16 v10 = ~(_WORD)v6;
  [v4 appendBytes:&v10 length:2];
  [v4 appendData:self->_data];

  return v4;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned __int8)a3
{
  self->_packetType = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)totalLength
{
  return self->_totalLength;
}

- (void)setTotalLength:(unsigned int)a3
{
  self->_totalLength = a3;
}

- (unsigned)checksum
{
  return self->_checksum;
}

- (void)setChecksum:(unsigned __int16)a3
{
  self->_checksum = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end