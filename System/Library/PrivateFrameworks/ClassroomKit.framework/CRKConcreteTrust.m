@interface CRKConcreteTrust
- (CRKCertificate)leafCertificate;
- (CRKConcreteTrust)initWithTrust:(__SecTrust *)a3;
- (NSString)description;
- (__SecTrust)underlyingTrust;
- (void)dealloc;
@end

@implementation CRKConcreteTrust

- (void)dealloc
{
  CFRelease(self->_underlyingTrust);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteTrust;
  [(CRKConcreteTrust *)&v3 dealloc];
}

- (CRKConcreteTrust)initWithTrust:(__SecTrust *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteTrust;
  v4 = [(CRKConcreteTrust *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingTrust = a3;
  }
  return v4;
}

- (CRKCertificate)leafCertificate
{
  CFArrayRef v2 = SecTrustCopyCertificateChain([(CRKConcreteTrust *)self underlyingTrust]);
  if ([(__CFArray *)v2 count])
  {
    objc_super v3 = [(__CFArray *)v2 firstObject];
    v4 = [[CRKConcreteCertificate alloc] initWithCertificate:v3];
  }
  else
  {
    v4 = 0;
  }

  return (CRKCertificate *)v4;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = self;
  return (NSString *)[v3 stringWithFormat:@"<%@: %p { underlyingTrust = %@ }", v4, v5, -[CRKConcreteTrust underlyingTrust](v5, "underlyingTrust")];
}

- (__SecTrust)underlyingTrust
{
  return self->_underlyingTrust;
}

@end