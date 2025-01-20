@interface IDSSocketPairEncryptedMessage
- (IDSSocketPairEncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairEncryptedMessage)initWithData:(id)a3;
- (NSData)data;
- (unsigned)command;
@end

@implementation IDSSocketPairEncryptedMessage

- (IDSSocketPairEncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IDSSocketPairEncryptedMessage;
  return [(IDSSocketPairMessage *)&v5 initWithCommand:a3 underlyingData:a4];
}

- (IDSSocketPairEncryptedMessage)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSocketPairEncryptedMessage;
  v6 = [(IDSSocketPairEncryptedMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (unsigned)command
{
  return 5;
}

- (NSData)data
{
  data = self->_data;
  if (data)
  {
    id v5 = data;
  }
  else
  {
    objc_msgSend__existingUnderlyingData(self, a2, v2, v3);
    id v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end