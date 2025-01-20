@interface IDSMPFullServiceIdentityAdmin
+ (id)fullServiceIdentityWithFullAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
+ (id)identityWithData:(id)a3 accountIdentity:(id)a4 error:(id *)a5;
- (NSString)identityServiceTypeName;
- (id)dataRepresentationWithError:(id *)a3;
- (id)publicServiceIdentityAdminWithError:(id *)a3;
- (int64_t)identityServiceType;
@end

@implementation IDSMPFullServiceIdentityAdmin

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

- (id)publicServiceIdentityAdminWithError:(id *)a3
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