@interface WFSSHKeyDecoder
- (NSData)data;
- (WFSSHKeyDecoder)initWithData:(id)a3;
- (const)currentPointer;
- (id)decodeDataWithLength:(unint64_t)a3;
- (id)decodeDataWithPrecedingLength;
- (id)decodeStringWithLength:(unint64_t)a3;
- (id)decodeStringWithPrecedingLength;
- (unint64_t)length;
- (unint64_t)offset;
- (unsigned)decodeInteger;
- (void)advanceBy:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
@end

@implementation WFSSHKeyDecoder

- (void).cxx_destruct
{
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (NSData)data
{
  return self->_data;
}

- (id)decodeDataWithPrecedingLength
{
  uint64_t v3 = [(WFSSHKeyDecoder *)self decodeInteger];
  return [(WFSSHKeyDecoder *)self decodeDataWithLength:v3];
}

- (id)decodeDataWithLength:(unint64_t)a3
{
  if (self->_offset + a3 <= self->_length)
  {
    v6 = [(WFSSHKeyDecoder *)self data];
    uint64_t v3 = objc_msgSend(v6, "subdataWithRange:", -[WFSSHKeyDecoder offset](self, "offset"), a3);

    [(WFSSHKeyDecoder *)self advanceBy:a3];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)decodeStringWithPrecedingLength
{
  uint64_t v3 = [(WFSSHKeyDecoder *)self decodeInteger];
  return [(WFSSHKeyDecoder *)self decodeStringWithLength:v3];
}

- (id)decodeStringWithLength:(unint64_t)a3
{
  if (self->_offset + a3 <= self->_length)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", -[WFSSHKeyDecoder currentPointer](self, "currentPointer"), a3, 4);
    [(WFSSHKeyDecoder *)self advanceBy:a3];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (unsigned)decodeInteger
{
  if (self->_offset + 4 > self->_length) {
    return 0;
  }
  unsigned int v2 = bswap32(*(_DWORD *)[(WFSSHKeyDecoder *)self currentPointer]);
  [(WFSSHKeyDecoder *)self advanceBy:4];
  return v2;
}

- (void)advanceBy:(unint64_t)a3
{
  unint64_t length = self->_offset + a3;
  if (length >= self->_length) {
    unint64_t length = self->_length;
  }
  self->_offset = length;
}

- (const)currentPointer
{
  id v3 = [(WFSSHKeyDecoder *)self data];
  v4 = (const char *)([v3 bytes] + self->_offset);

  return v4;
}

- (WFSSHKeyDecoder)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSSHKeyDecoder;
  v5 = [(WFSSHKeyDecoder *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_offset = 0;
    v5->_unint64_t length = [v4 length];
    v8 = v5;
  }

  return v5;
}

@end