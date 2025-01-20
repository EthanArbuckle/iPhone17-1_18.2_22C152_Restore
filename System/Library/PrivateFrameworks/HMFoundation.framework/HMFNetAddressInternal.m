@interface HMFNetAddressInternal
- (NSString)addressString;
- (id)dataUsingEncoding:(unint64_t)a3;
- (unint64_t)addressFamily;
@end

@implementation HMFNetAddressInternal

- (id)dataUsingEncoding:(unint64_t)a3
{
  return 0;
}

- (unint64_t)addressFamily
{
  return self->_addressFamily;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void).cxx_destruct
{
}

@end