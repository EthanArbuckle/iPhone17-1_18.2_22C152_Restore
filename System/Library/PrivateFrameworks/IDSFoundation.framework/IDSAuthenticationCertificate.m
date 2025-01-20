@interface IDSAuthenticationCertificate
- (IDSAuthenticationCertificate)initWithBackingCertificate:(id)a3;
- (IDSAuthenticationCertificate)initWithDataRepresentation:(id)a3;
- (IDSServerCertificate)backingCertificate;
- (NSData)dataRepresentation;
- (id)description;
@end

@implementation IDSAuthenticationCertificate

- (IDSAuthenticationCertificate)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [IDSServerCertificate alloc];
  v8 = objc_msgSend_initWithDataRepresentation_(v5, v6, (uint64_t)v4, v7);

  v11 = (IDSAuthenticationCertificate *)objc_msgSend_initWithBackingCertificate_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (IDSAuthenticationCertificate)initWithBackingCertificate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAuthenticationCertificate;
  v6 = [(IDSAuthenticationCertificate *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingCertificate, a3);
  }

  return v7;
}

- (NSData)dataRepresentation
{
  id v4 = objc_msgSend_backingCertificate(self, a2, v2, v3);
  v8 = objc_msgSend_dataRepresentation(v4, v5, v6, v7);

  return (NSData *)v8;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_backingCertificate(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p cert: %@>", v10, v4, self, v8);

  return v11;
}

- (IDSServerCertificate)backingCertificate
{
  return self->_backingCertificate;
}

- (void).cxx_destruct
{
}

@end