@interface HealthDigitalSeparationEntry
- (HKSummarySharingEntry)sharingEntry;
- (HealthDigitalSeparationEntry)initWithSharingEntry:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (int64_t)permission;
- (int64_t)role;
- (void)setSharingEntry:(id)a3;
@end

@implementation HealthDigitalSeparationEntry

- (HealthDigitalSeparationEntry)initWithSharingEntry:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HealthDigitalSeparationEntry;
  v5 = [(HealthDigitalSeparationEntry *)&v9 init];
  if (v5)
  {
    v6 = (HKSummarySharingEntry *)[v4 copy];
    sharingEntry = v5->_sharingEntry;
    v5->_sharingEntry = v6;
  }
  return v5;
}

- (int64_t)role
{
  return 2;
}

- (int64_t)permission
{
  return 2;
}

- (NSString)unifiedContactIdentifier
{
  return (NSString *)[(HKSummarySharingEntry *)self->_sharingEntry CNContactIdentifier];
}

- (NSPersonNameComponents)nameComponents
{
  id v3 = objc_alloc_init((Class)NSPersonNameComponents);
  id v4 = [(HKSummarySharingEntry *)self->_sharingEntry firstName];
  [v3 setGivenName:v4];

  v5 = [(HKSummarySharingEntry *)self->_sharingEntry lastName];
  [v3 setFamilyName:v5];

  return (NSPersonNameComponents *)v3;
}

- (NSString)emailAddress
{
  id v3 = [(HKSummarySharingEntry *)self->_sharingEntry primaryContactIdentifier];
  unsigned int v4 = [v3 _appearsToBeEmail];

  if (v4)
  {
    v5 = [(HKSummarySharingEntry *)self->_sharingEntry primaryContactIdentifier];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)phoneNumber
{
  id v3 = [(HKSummarySharingEntry *)self->_sharingEntry primaryContactIdentifier];
  unsigned int v4 = [v3 _appearsToBePhoneNumber];

  if (v4)
  {
    v5 = [(HKSummarySharingEntry *)self->_sharingEntry primaryContactIdentifier];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (HKSummarySharingEntry)sharingEntry
{
  return self->_sharingEntry;
}

- (void)setSharingEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end