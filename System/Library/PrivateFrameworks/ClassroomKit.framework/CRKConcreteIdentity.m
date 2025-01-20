@interface CRKConcreteIdentity
+ (id)identityWithCertificate:(id)a3 privateKey:(id)a4;
+ (id)identityWithConfiguration:(id)a3;
- (CRKCertificate)certificate;
- (CRKConcreteIdentity)initWithIdentity:(__SecIdentity *)a3;
- (CRKPrivateKey)privateKey;
- (NSString)description;
- (__SecIdentity)underlyingIdentity;
- (void)dealloc;
@end

@implementation CRKConcreteIdentity

- (void)dealloc
{
  CFRelease(self->_underlyingIdentity);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteIdentity;
  [(CRKConcreteIdentity *)&v3 dealloc];
}

- (CRKConcreteIdentity)initWithIdentity:(__SecIdentity *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteIdentity;
  v4 = [(CRKConcreteIdentity *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingIdentity = a3;
  }
  return v4;
}

+ (id)identityWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[CRKIdentityRefFactory alloc] initWithConfiguration:v4];

  id v11 = 0;
  objc_super v6 = [(CRKIdentityRefFactory *)v5 makeIdentityRefWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithIdentity:v6];
    CFRelease(v6);
  }
  else
  {
    v9 = _CRKLogGeneral_12();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CRKConcreteIdentity identityWithConfiguration:](v7, v9);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)identityWithCertificate:(id)a3 privateKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 underlyingCertificate];
  id v8 = v7;
  [v8 underlyingPrivateKey];

  uint64_t v9 = SecIdentityCreate();
  if (v9)
  {
    v10 = (const void *)v9;
    id v11 = (void *)[objc_alloc((Class)a1) initWithIdentity:v9];
    CFRelease(v10);
  }
  else
  {
    v12 = _CRKLogGeneral_12();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CRKConcreteIdentity identityWithCertificate:privateKey:](v12);
    }

    id v11 = 0;
  }

  return v11;
}

- (CRKCertificate)certificate
{
  SecCertificateRef certificateRef = 0;
  v2 = 0;
  if (!SecIdentityCopyCertificate([(CRKConcreteIdentity *)self underlyingIdentity], &certificateRef))
  {
    objc_super v3 = [CRKConcreteCertificate alloc];
    v2 = [(CRKConcreteCertificate *)v3 initWithCertificate:certificateRef];
    CFRelease(certificateRef);
  }

  return (CRKCertificate *)v2;
}

- (CRKPrivateKey)privateKey
{
  SecKeyRef privateKeyRef = 0;
  v2 = 0;
  if (!SecIdentityCopyPrivateKey([(CRKConcreteIdentity *)self underlyingIdentity], &privateKeyRef))
  {
    objc_super v3 = [CRKConcretePrivateKey alloc];
    v2 = [(CRKConcretePrivateKey *)v3 initWithPrivateKey:privateKeyRef];
    CFRelease(privateKeyRef);
  }

  return (CRKPrivateKey *)v2;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = self;
  return (NSString *)[v3 stringWithFormat:@"<%@: %p { underlyingIdentity = %@ }>", v4, v5, -[CRKConcreteIdentity underlyingIdentity](v5, "underlyingIdentity")];
}

- (__SecIdentity)underlyingIdentity
{
  return self->_underlyingIdentity;
}

+ (void)identityWithConfiguration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 verboseDescription];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to create identity ref: %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)identityWithCertificate:(os_log_t)log privateKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Error creating the identity from certificate and private key", v1, 2u);
}

@end