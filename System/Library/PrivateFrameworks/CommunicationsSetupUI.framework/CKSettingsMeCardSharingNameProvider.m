@interface CKSettingsMeCardSharingNameProvider
+ (id)nameProviderForNickname:(id)a3;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)nickname;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
@end

@implementation CKSettingsMeCardSharingNameProvider

+ (id)nameProviderForNickname:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKSettingsMeCardSharingNameProvider);
    if (v4)
    {
      v5 = [v3 firstName];
      [(CKSettingsMeCardSharingNameProvider *)v4 setGivenName:v5];

      v6 = [v3 lastName];
      [(CKSettingsMeCardSharingNameProvider *)v4 setFamilyName:v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end