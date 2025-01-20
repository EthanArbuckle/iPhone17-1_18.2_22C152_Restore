@interface CRKNoOpKeychain
- (id)addCertificate:(id)a3 toAccessGroup:(id)a4;
- (id)addIdentity:(id)a3 toAccessGroup:(id)a4;
- (id)addPrivateKey:(id)a3 toAccessGroup:(id)a4;
- (id)certificateWithPersistentID:(id)a3;
- (id)identityWithPersistentID:(id)a3;
- (id)makeCertificateWithData:(id)a3;
- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4;
- (id)makeIdentityWithConfiguration:(id)a3;
- (id)makePrivateKeyWithData:(id)a3;
- (id)passwordForService:(id)a3;
- (id)privateKeyWithPersistentID:(id)a3;
@end

@implementation CRKNoOpKeychain

- (id)addCertificate:(id)a3 toAccessGroup:(id)a4
{
  return 0;
}

- (id)addIdentity:(id)a3 toAccessGroup:(id)a4
{
  return 0;
}

- (id)addPrivateKey:(id)a3 toAccessGroup:(id)a4
{
  return 0;
}

- (id)certificateWithPersistentID:(id)a3
{
  return 0;
}

- (id)identityWithPersistentID:(id)a3
{
  return 0;
}

- (id)makeCertificateWithData:(id)a3
{
  return 0;
}

- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4
{
  return 0;
}

- (id)makeIdentityWithConfiguration:(id)a3
{
  return 0;
}

- (id)makePrivateKeyWithData:(id)a3
{
  return 0;
}

- (id)passwordForService:(id)a3
{
  return 0;
}

- (id)privateKeyWithPersistentID:(id)a3
{
  return 0;
}

@end