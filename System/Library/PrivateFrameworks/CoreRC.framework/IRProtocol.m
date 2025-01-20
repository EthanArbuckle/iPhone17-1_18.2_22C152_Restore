@interface IRProtocol
+ (BOOL)supportsSecureCoding;
+ (id)protocolWithID:(unsigned __int8)a3 options:(unsigned __int8)a4;
+ (id)protocolWithID:(unsigned __int8)a3 options:(unsigned __int8)a4 hasRepeats:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (IRProtocol)init;
- (IRProtocol)initWithCoder:(id)a3;
- (IRProtocol)initWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4;
- (double)carrierFrequency;
- (double)repeatInterval;
- (id)description;
- (unint64_t)hash;
- (unsigned)options;
- (unsigned)protocolID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRProtocol

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protocolWithID:(unsigned __int8)a3 options:(unsigned __int8)a4
{
  v4 = [[IRProtocol alloc] initWithProtocolID:a3 options:a4];
  return v4;
}

+ (id)protocolWithID:(unsigned __int8)a3 options:(unsigned __int8)a4 hasRepeats:(BOOL)a5
{
  uint64_t v5 = a4;
  if (!a5)
  {
    if ((a3 - 1) > 0xD) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = byte_24C4F74D3[(char)(a3 - 1)];
    }
    uint64_t v5 = v6 | a4;
  }
  v7 = [[IRProtocol alloc] initWithProtocolID:a3 options:v5];
  return v7;
}

- (IRProtocol)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use +protocolWithID:options:"];
  return 0;
}

- (IRProtocol)initWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IRProtocol;
  result = [(IRProtocol *)&v7 init];
  if (result)
  {
    result->_protocolID = a3;
    result->_options = a4;
  }
  return result;
}

- (IRProtocol)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IRProtocol;
  v4 = [(IRProtocol *)&v6 init];
  if (v4)
  {
    v4->_protocolID = [a3 decodeIntegerForKey:@"protocolProtocol"];
    v4->_options = [a3 decodeIntegerForKey:@"protocolOptions"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_protocolID forKey:@"protocolProtocol"];
  uint64_t options = self->_options;
  [a3 encodeInt:options forKey:@"protocolOptions"];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IRProtocol;
  id v3 = [(IRProtocol *)&v7 description];
  unsigned int v4 = [(IRProtocol *)self protocolID];
  if (v4 <= 0xF) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  return (id)objc_msgSend(v3, "stringByAppendingFormat:", @" ID: %s; Options: %u;",
               IRProtocolName_names[v5],
               [(IRProtocol *)self options]);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [(IRProtocol *)self protocolID];
  if (v5 != [a3 protocolID]) {
    return 0;
  }
  int v6 = [(IRProtocol *)self options];
  return v6 == [a3 options];
}

- (unint64_t)hash
{
  return (self->_options ^ self->_protocolID);
}

- (unsigned)protocolID
{
  return self->_protocolID;
}

- (unsigned)options
{
  return self->_options;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (double)carrierFrequency
{
  return self->_carrierFrequency;
}

@end