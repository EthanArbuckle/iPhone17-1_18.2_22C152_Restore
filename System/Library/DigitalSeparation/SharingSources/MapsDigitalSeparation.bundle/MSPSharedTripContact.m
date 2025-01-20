@interface MSPSharedTripContact
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation MSPSharedTripContact

- (int64_t)role
{
  return 2;
}

- (int64_t)permission
{
  return 1;
}

- (NSString)unifiedContactIdentifier
{
  v2 = [(MSPSharedTripContact *)self contact];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSPersonNameComponents)nameComponents
{
  return 0;
}

- (NSString)emailAddress
{
  if ([(MSPSharedTripContact *)self isPhoneNumber])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(MSPSharedTripContact *)self stringValue];
  }

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  if ([(MSPSharedTripContact *)self isPhoneNumber])
  {
    v3 = [(MSPSharedTripContact *)self stringValue];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

@end