@interface OldIDSDSessionKeyValueDeliveryLocalEntry
- (NSData)data;
- (NSString)capability;
- (OldIDSDSessionKeyValueDeliveryLocalEntry)initWithData:(id)a3 encryption:(unsigned int)a4 capability:(id)a5;
- (unsigned)encryption;
- (void)setCapability:(id)a3;
- (void)setData:(id)a3;
- (void)setEncryption:(unsigned int)a3;
@end

@implementation OldIDSDSessionKeyValueDeliveryLocalEntry

- (OldIDSDSessionKeyValueDeliveryLocalEntry)initWithData:(id)a3 encryption:(unsigned int)a4 capability:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)OldIDSDSessionKeyValueDeliveryLocalEntry;
  v11 = [(OldIDSDSessionKeyValueDeliveryLocalEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_encryption = a4;
    objc_storeStrong((id *)&v12->_capability, a5);
  }

  return v12;
}

- (unsigned)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(unsigned int)a3
{
  self->_encryption = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (NSString)capability
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCapability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capability, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end