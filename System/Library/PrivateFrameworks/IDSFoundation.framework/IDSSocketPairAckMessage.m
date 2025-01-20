@interface IDSSocketPairAckMessage
- (IDSSocketPairAckMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairAckMessage)initWithSequenceNumber:(unsigned int)a3;
- (id)_nonHeaderData;
- (unsigned)command;
- (unsigned)sequenceNumber;
- (void)setSequenceNumber:(unsigned int)a3;
@end

@implementation IDSSocketPairAckMessage

- (IDSSocketPairAckMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSSocketPairAckMessage;
  v8 = [(IDSSocketPairMessage *)&v12 initWithCommand:v4 underlyingData:v6];
  if (v8)
  {
    unsigned int v11 = -1431655766;
    objc_msgSend_getBytes_range_(v6, v7, (uint64_t)&v11, v9, 0, 4);
    *(_DWORD *)(&v8->super._wasWrittenToConnection + 2) = bswap32(v11);
  }

  return v8;
}

- (IDSSocketPairAckMessage)initWithSequenceNumber:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSSocketPairAckMessage;
  result = [(IDSSocketPairAckMessage *)&v5 init];
  if (result) {
    *(_DWORD *)(&result->super._wasWrittenToConnection + 2) = a3;
  }
  return result;
}

- (unsigned)command
{
  return 1;
}

- (id)_nonHeaderData
{
  objc_super v5 = objc_msgSend_data(MEMORY[0x1E4F1CA58], a2, v2, v3);
  unsigned int v12 = bswap32(objc_msgSend_sequenceNumber(self, v6, v7, v8));
  objc_msgSend_appendBytes_length_(v5, v9, (uint64_t)&v12, v10, 4);
  return v5;
}

- (unsigned)sequenceNumber
{
  return *(_DWORD *)(&self->super._wasWrittenToConnection + 2);
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_DWORD *)(&self->super._wasWrittenToConnection + 2) = a3;
}

@end