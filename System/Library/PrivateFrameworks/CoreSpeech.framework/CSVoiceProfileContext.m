@interface CSVoiceProfileContext
- (CSVoiceProfileContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6 sharedHomeId:(id)a7 userName:(id)a8;
- (NSNumber)version;
- (NSString)homeId;
- (NSString)languageCode;
- (NSString)productCategory;
- (NSString)profileId;
- (NSString)userName;
- (id)description;
- (unint64_t)onboardType;
- (void)setHomeId:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setOnboardType:(unint64_t)a3;
- (void)setProductCategory:(id)a3;
- (void)setProfileId:(id)a3;
- (void)setUserName:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CSVoiceProfileContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_homeId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_profileId, 0);
}

- (void)setUserName:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setHomeId:(id)a3
{
}

- (NSString)homeId
{
  return self->_homeId;
}

- (void)setOnboardType:(unint64_t)a3
{
  self->_onboardType = a3;
}

- (unint64_t)onboardType
{
  return self->_onboardType;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setProductCategory:(id)a3
{
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setProfileId:(id)a3
{
}

- (NSString)profileId
{
  return self->_profileId;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[profileId: %@, language: %@, product: %@, version: %@, homeId: %@, name: %@]", self->_profileId, self->_languageCode, self->_productCategory, self->_version, self->_homeId, self->_userName];
}

- (CSVoiceProfileContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6 sharedHomeId:(id)a7 userName:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSVoiceProfileContext;
  v18 = [(CSVoiceProfileContext *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_profileId, a3);
    objc_storeStrong((id *)&v19->_languageCode, a4);
    objc_storeStrong((id *)&v19->_productCategory, a5);
    objc_storeStrong((id *)&v19->_version, a6);
    objc_storeStrong((id *)&v19->_homeId, a7);
    objc_storeStrong((id *)&v19->_userName, a8);
  }

  return v19;
}

@end