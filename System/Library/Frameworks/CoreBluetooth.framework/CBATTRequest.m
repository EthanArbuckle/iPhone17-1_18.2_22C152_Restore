@interface CBATTRequest
- (BOOL)ignoreResponse;
- (CBATTRequest)initWithCentral:(id)a3 characteristic:(id)a4 offset:(unint64_t)a5 transactionID:(id)a6;
- (CBCentral)central;
- (CBCharacteristic)characteristic;
- (NSData)value;
- (NSNumber)transactionID;
- (NSUInteger)offset;
- (id)description;
- (unint64_t)endOffset;
- (void)appendValueData:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setIgnoreResponse:(BOOL)a3;
- (void)setValue:(NSData *)value;
@end

@implementation CBATTRequest

- (CBATTRequest)initWithCentral:(id)a3 characteristic:(id)a4 offset:(unint64_t)a5 transactionID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CBATTRequest;
  v14 = [(CBATTRequest *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_central, a3);
    objc_storeStrong((id *)&v15->_characteristic, a4);
    v15->_offset = a5;
    objc_storeStrong((id *)&v15->_transactionID, a6);
    value = v15->_value;
    v15->_value = 0;

    v15->_ignoreResponse = 0;
  }

  return v15;
}

- (unint64_t)endOffset
{
  unint64_t offset = self->_offset;
  return [(NSMutableData *)self->_value length] + offset;
}

- (void)appendValueData:(id)a3
{
  value = self->_value;
  if (value)
  {
    v9 = (NSMutableData *)a3;
    [(NSMutableData *)value appendData:v9];
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E4F1CA58];
    id v7 = a3;
    v8 = (NSMutableData *)[[v6 alloc] initWithData:v7];

    v4 = self->_value;
    self->_value = v8;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p Central = %@, Characteristic = %@, Offset = %lu, Value = %@>", objc_opt_class(), self, self->_central, self->_characteristic, self->_offset, self->_value];
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(NSData *)value
{
}

- (CBCentral)central
{
  return self->_central;
}

- (CBCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (BOOL)ignoreResponse
{
  return self->_ignoreResponse;
}

- (void)setIgnoreResponse:(BOOL)a3
{
  self->_ignoreResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_central, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end