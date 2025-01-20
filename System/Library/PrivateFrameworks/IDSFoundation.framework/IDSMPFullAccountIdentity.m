@interface IDSMPFullAccountIdentity
+ (IDSMPFullAccountIdentity)fullAccountIdentityWithError:(id *)a3;
+ (IDSMPFullAccountIdentity)identityWithData:(id)a3 error:(id *)a4;
- (NSData)publicName;
- (id)dataRepresentationWithError:(id *)a3;
- (id)publicAccountIdentityWithError:(id *)a3;
- (id)rolledAccountIdenityWithError:(id *)a3;
- (id)signData:(id)a3 withError:(id *)a4;
@end

@implementation IDSMPFullAccountIdentity

+ (IDSMPFullAccountIdentity)identityWithData:(id)a3 error:(id *)a4
{
  return 0;
}

- (NSData)publicName
{
  return 0;
}

+ (IDSMPFullAccountIdentity)fullAccountIdentityWithError:(id *)a3
{
  return 0;
}

- (id)publicAccountIdentityWithError:(id *)a3
{
  return 0;
}

- (id)rolledAccountIdenityWithError:(id *)a3
{
  return 0;
}

- (id)signData:(id)a3 withError:(id *)a4
{
  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return 0;
}

@end