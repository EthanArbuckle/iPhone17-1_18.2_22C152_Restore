@interface SMDSIdentity
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (void)setEmailAddress:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setUnifiedContactIdentifier:(id)a3;
@end

@implementation SMDSIdentity

- (NSPersonNameComponents)nameComponents
{
  return self->nameComponents;
}

- (NSString)unifiedContactIdentifier
{
  return self->_unifiedContactIdentifier;
}

- (void)setUnifiedContactIdentifier:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_unifiedContactIdentifier, 0);

  objc_storeStrong((id *)&self->nameComponents, 0);
}

@end