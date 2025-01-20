@interface JPSignatureVerifier
+ (id)defaultSignatureVerifier;
+ (id)signatureVerifierWithCertificate:(id)a3;
+ (id)unsafeIgnoreSignatureVerifier;
- (BOOL)releaseBackingOnDealloc;
- (JPSignatureVerifier)initWithBacking:(JetPackSignatureVerifier *)a3 releaseOnDealloc:(BOOL)a4;
- (JetPackSignatureVerifier)backing;
- (void)dealloc;
- (void)setBacking:(JetPackSignatureVerifier *)a3;
@end

@implementation JPSignatureVerifier

+ (id)unsafeIgnoreSignatureVerifier
{
  v2 = [[JPSignatureVerifier alloc] initWithBacking:JetPackSignatureVerifierCreateUnsafeIgnoreSignatureVerifier(a1, a2) releaseOnDealloc:1];
  return v2;
}

+ (id)defaultSignatureVerifier
{
}

- (JPSignatureVerifier)initWithBacking:(JetPackSignatureVerifier *)a3 releaseOnDealloc:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JPSignatureVerifier;
  result = [(JPSignatureVerifier *)&v7 init];
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

- (void)dealloc
{
  if ([(JPSignatureVerifier *)self releaseBackingOnDealloc]) {
    JetPackSignatureVerifierDestroy((uint64_t)[(JPSignatureVerifier *)self backing]);
  }
  v3.receiver = self;
  v3.super_class = (Class)JPSignatureVerifier;
  [(JPSignatureVerifier *)&v3 dealloc];
}

- (JetPackSignatureVerifier)backing
{
  return self->_backing;
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

+ (id)signatureVerifierWithCertificate:(id)a3
{
  id v3 = a3;
  v4 = (const void *)[v3 bytes];
  size_t v5 = [v3 length];

  JetPackSignatureVerifierCreateWithCertificateData(v4, v5);
}

- (void)setBacking:(JetPackSignatureVerifier *)a3
{
  self->_backing = a3;
}

@end