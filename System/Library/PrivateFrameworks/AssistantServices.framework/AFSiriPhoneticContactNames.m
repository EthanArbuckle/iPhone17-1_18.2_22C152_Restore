@interface AFSiriPhoneticContactNames
- (NSString)familyName;
- (NSString)givenName;
- (NSString)languageCode;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)organizationName;
- (id)spokenName;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
@end

@implementation AFSiriPhoneticContactNames

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (id)spokenName
{
  if ([(NSString *)self->_givenName length] && [(NSString *)self->_familyName length])
  {
    v3 = AFRingtoneLocalizedString(@"SPOKEN_CONTACT_FULL", self->_languageCode);
    v4 = objc_msgSend([NSString alloc], "initWithFormat:", v3, self->_givenName, self->_familyName);
  }
  else
  {
    v4 = 0;
  }
  if (![v4 length])
  {
    uint64_t v5 = [(NSString *)self->_givenName copy];

    v4 = (void *)v5;
  }
  if (![v4 length])
  {
    uint64_t v6 = [(NSString *)self->_familyName copy];

    v4 = (void *)v6;
  }
  if (![v4 length])
  {
    uint64_t v7 = [(NSString *)self->_nickname copy];

    v4 = (void *)v7;
  }
  if (![v4 length])
  {
    uint64_t v8 = [(NSString *)self->_middleName copy];

    v4 = (void *)v8;
  }
  if (![v4 length])
  {
    uint64_t v9 = [(NSString *)self->_organizationName copy];

    v4 = (void *)v9;
  }
  if ([v4 length]) {
    v10 = v4;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end