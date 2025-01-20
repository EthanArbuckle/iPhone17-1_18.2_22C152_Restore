@interface CTAsciiAddress
+ (id)asciiAddressWithString:(id)a3;
- (CTAsciiAddress)initWithAddress:(id)a3;
- (NSString)address;
- (id)canonicalFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedString;
@end

@implementation CTAsciiAddress

+ (id)asciiAddressWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAddress:v4];

  return v5;
}

- (CTAsciiAddress)initWithAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAsciiAddress;
  v5 = [(CTAsciiAddress *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    address = v5->_address;
    v5->_address = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTAsciiAddress allocWithZone:a3];
  address = self->_address;

  return [(CTAsciiAddress *)v4 initWithAddress:address];
}

- (id)encodedString
{
  return self->_address;
}

- (id)canonicalFormat
{
  return self->_address;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end