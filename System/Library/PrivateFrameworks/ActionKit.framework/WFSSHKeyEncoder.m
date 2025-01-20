@interface WFSSHKeyEncoder
- (NSData)encodedData;
- (NSMutableData)data;
- (WFSSHKeyEncoder)init;
- (unint64_t)encodedLength;
- (void)encodeChar:(char)a3;
- (void)encodeData:(id)a3;
- (void)encodeDataWithPreceedingLength:(id)a3;
- (void)encodeInteger:(unsigned int)a3;
- (void)encodeString:(id)a3;
- (void)encodeStringWithPreceedingLength:(id)a3;
@end

@implementation WFSSHKeyEncoder

- (void).cxx_destruct
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)encodeDataWithPreceedingLength:(id)a3
{
  id v4 = a3;
  -[WFSSHKeyEncoder encodeInteger:](self, "encodeInteger:", [v4 length]);
  [(WFSSHKeyEncoder *)self encodeData:v4];
}

- (void)encodeData:(id)a3
{
}

- (void)encodeStringWithPreceedingLength:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lengthOfBytesUsingEncoding:4];
  [(WFSSHKeyEncoder *)self encodeInteger:v5];
  data = self->_data;
  v7 = [v4 dataUsingEncoding:4];

  id v8 = v7;
  -[NSMutableData appendBytes:length:](data, "appendBytes:length:", [v8 bytes], v5);
}

- (void)encodeString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lengthOfBytesUsingEncoding:4];
  data = self->_data;
  v7 = [v4 dataUsingEncoding:4];

  id v8 = v7;
  -[NSMutableData appendBytes:length:](data, "appendBytes:length:", [v8 bytes], v5);
}

- (void)encodeInteger:(unsigned int)a3
{
  unsigned int v3 = bswap32(a3);
  [(NSMutableData *)self->_data appendBytes:&v3 length:4];
}

- (void)encodeChar:(char)a3
{
  char v3 = a3;
  [(NSMutableData *)self->_data appendBytes:&v3 length:1];
}

- (NSData)encodedData
{
  v2 = [(WFSSHKeyEncoder *)self data];
  char v3 = (void *)[v2 copy];

  return (NSData *)v3;
}

- (unint64_t)encodedLength
{
  v2 = [(WFSSHKeyEncoder *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (WFSSHKeyEncoder)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSSHKeyEncoder;
  v2 = [(WFSSHKeyEncoder *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end