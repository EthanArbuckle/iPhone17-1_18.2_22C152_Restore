@interface IDSMPFullDeviceIdentity
+ (IDSMPFullDeviceIdentity)deviceIdentityWithFullAdminServiceIdentity:(id)a3 error:(id *)a4;
+ (id)deviceIdentityFromDataRepresentation:(id)a3 publicAdminServiceIdentity:(id)a4 error:(id *)a5;
- (BOOL)purgeFromKeychain:(id *)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (id)publicDeviceIdentityWithError:(id *)a3;
@end

@implementation IDSMPFullDeviceIdentity

+ (id)deviceIdentityFromDataRepresentation:(id)a3 publicAdminServiceIdentity:(id)a4 error:(id *)a5
{
  return 0;
}

+ (IDSMPFullDeviceIdentity)deviceIdentityWithFullAdminServiceIdentity:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)purgeFromKeychain:(id *)a3
{
  return 0;
}

- (id)publicDeviceIdentityWithError:(id *)a3
{
  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return 0;
}

@end