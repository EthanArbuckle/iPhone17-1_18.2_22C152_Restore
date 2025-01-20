@interface CRKInMemoryIdentity
+ (id)identityWithConfiguration:(id)a3 validityDateInterval:(id)a4;
- (CRKCertificate)certificate;
- (CRKInMemoryIdentity)initWithCertificate:(id)a3 privateKey:(id)a4;
- (CRKPrivateKey)privateKey;
- (__SecIdentity)underlyingIdentity;
@end

@implementation CRKInMemoryIdentity

- (CRKInMemoryIdentity)initWithCertificate:(id)a3 privateKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKInMemoryIdentity;
  v9 = [(CRKInMemoryIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificate, a3);
    objc_storeStrong((id *)&v10->_privateKey, a4);
  }

  return v10;
}

+ (id)identityWithConfiguration:(id)a3 validityDateInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CRKInMemoryCertificate alloc] initWithConfiguration:v7 validityDateInterval:v6];

  v9 = [[CRKInMemoryPrivateKey alloc] initWithConfiguration:v7];
  v10 = (void *)[objc_alloc((Class)a1) initWithCertificate:v8 privateKey:v9];

  return v10;
}

- (__SecIdentity)underlyingIdentity
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CRKInMemoryIdentity.m" lineNumber:41 description:@"Reconsider what you are trying to test"];

  return 0;
}

- (CRKCertificate)certificate
{
  return self->_certificate;
}

- (CRKPrivateKey)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);

  objc_storeStrong((id *)&self->_certificate, 0);
}

@end