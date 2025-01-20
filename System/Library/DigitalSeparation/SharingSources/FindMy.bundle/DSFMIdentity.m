@interface DSFMIdentity
- (NSPersonNameComponents)nameComponents;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (void)setEmailAddress:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setUnifiedContactIdentifier:(id)a3;
@end

@implementation DSFMIdentity

- (NSString)description
{
  id v3 = objc_alloc_init((Class)CNContactStore);
  v13[0] = CNContactNamePrefixKey;
  v13[1] = CNContactGivenNameKey;
  v13[2] = CNContactMiddleNameKey;
  v13[3] = CNContactFamilyNameKey;
  v13[4] = CNContactPreviousFamilyNameKey;
  v13[5] = CNContactNameSuffixKey;
  v13[6] = CNContactNicknameKey;
  v13[7] = CNContactTypeKey;
  v13[8] = CNContactOrganizationNameKey;
  v13[9] = CNContactEmailAddressesKey;
  v13[10] = CNContactPhoneNumbersKey;
  v4 = +[NSArray arrayWithObjects:v13 count:11];
  v5 = [(DSFMIdentity *)self unifiedContactIdentifier];
  v6 = [v3 unifiedContactWithIdentifier:v5 keysToFetch:v4 error:0];

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = +[CNContactFormatter stringFromContact:v6 style:0];
  v10 = [(DSFMIdentity *)self unifiedContactIdentifier];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ <%p>: %@; contact-id: %@",
    v8,
    self,
    v9,
  v11 = v10);

  return (NSString *)v11;
}

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