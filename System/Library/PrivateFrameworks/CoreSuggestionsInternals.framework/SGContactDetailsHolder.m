@interface SGContactDetailsHolder
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)socialProfiles;
- (SGContactDetail)birthday;
- (SGContactDetail)photoPath;
- (void)setBirthday:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setInstantMessageAddresses:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhotoPath:(id)a3;
- (void)setPostalAddresses:(id)a3;
- (void)setSocialProfiles:(id)a3;
@end

@implementation SGContactDetailsHolder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (void)setPhotoPath:(id)a3
{
}

- (SGContactDetail)photoPath
{
  return self->_photoPath;
}

- (void)setBirthday:(id)a3
{
}

- (SGContactDetail)birthday
{
  return self->_birthday;
}

- (void)setSocialProfiles:(id)a3
{
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setInstantMessageAddresses:(id)a3
{
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPostalAddresses:(id)a3
{
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

@end