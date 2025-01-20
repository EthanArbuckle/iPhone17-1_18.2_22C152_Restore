@interface ECCMSRecipient
- (ECCMSRecipient)initWithAddress:(id)a3 certificate:(__SecCertificate *)a4 capabilities:(id)a5;
- (NSArray)capabilities;
- (NSString)address;
- (__SecCertificate)certificate;
- (void)dealloc;
@end

@implementation ECCMSRecipient

- (ECCMSRecipient)initWithAddress:(id)a3 certificate:(__SecCertificate *)a4 capabilities:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ECCMSRecipient;
  v10 = [(ECCMSRecipient *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v10->_certificate = a4;
    CFRetain(a4);
    uint64_t v13 = [v9 copy];
    capabilities = v10->_capabilities;
    v10->_capabilities = (NSArray *)v13;
  }
  return v10;
}

- (void)dealloc
{
  CFRelease(self->_certificate);
  v3.receiver = self;
  v3.super_class = (Class)ECCMSRecipient;
  [(ECCMSRecipient *)&v3 dealloc];
}

- (NSString)address
{
  return self->_address;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end