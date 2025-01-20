@interface IDSMPFullServiceIdentitySigning
+ (id)fullServiceIdentityWithFullAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
+ (id)identityWithData:(id)a3 accountIdentity:(id)a4 error:(id *)a5;
- (NSString)identityServiceTypeName;
- (id)dataRepresentationWithError:(id *)a3;
- (id)publicServiceIdentitySigningWithError:(id *)a3;
- (int64_t)identityServiceType;
@end

@implementation IDSMPFullServiceIdentitySigning

- (int64_t)identityServiceType
{
  return 0;
}

- (NSString)identityServiceTypeName
{
  return 0;
}

+ (id)fullServiceIdentityWithFullAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  return 0;
}

- (id)publicServiceIdentitySigningWithError:(id *)a3
{
  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return 0;
}

+ (id)identityWithData:(id)a3 accountIdentity:(id)a4 error:(id *)a5
{
  return 0;
}

@end