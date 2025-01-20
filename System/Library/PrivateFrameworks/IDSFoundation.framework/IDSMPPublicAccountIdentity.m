@interface IDSMPPublicAccountIdentity
+ (id)publicAccountIdentitywithDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 ofData:(id)a4 error:(id *)a5;
- (NSData)publicName;
- (id)dataRepresentationWithError:(id *)a3;
@end

@implementation IDSMPPublicAccountIdentity

- (NSData)publicName
{
  return 0;
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return 0;
}

+ (id)publicAccountIdentitywithDataRepresentation:(id)a3 error:(id *)a4
{
  return 0;
}

@end