@interface BSBrand
+ (id)mockBrand;
+ (id)placeholderName;
- (BOOL)isAppleMainBrand;
- (BOOL)isAppleMakoBrand;
- (BOOL)isRCSChatBot;
- (BOOL)isVerified;
- (BSBrandMessagingDetails)messagingDetails;
- (BSBrandObjcShim)shim;
- (NSString)_primaryBrandColorHexString;
- (NSString)_secondaryBrandColorHexString;
- (NSString)brandURI;
- (NSString)localizedResponseTime;
- (NSString)name;
- (NSString)primaryPhoneNumber;
- (id)_initWithShim:(id)a3;
- (id)address;
- (id)categories;
- (id)emailAddress;
- (id)genericCSSTemplateURL;
- (id)localizedDescription;
- (id)logoFingerprint;
- (id)messageNumber;
- (id)termsAndConditionsURL;
- (id)verifiedBy;
- (id)website;
- (void)assetDataForType:(int64_t)a3 usingSim:(id)a4 completion:(id)a5;
- (void)clearCachedAssets:(id)a3;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 usingSim:(id)a5 completion:(id)a6;
- (void)logoFileURLForType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5;
- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
@end

@implementation BSBrand

- (NSString)brandURI
{
  v2 = [(BSBrand *)self shim];
  v3 = [v2 brandURI];

  return (NSString *)v3;
}

- (BOOL)isRCSChatBot
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 isRCSChatBot];

  return v3;
}

- (NSString)name
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 name];

  return (NSString *)v3;
}

- (id)categories
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 categories];

  return v3;
}

- (NSString)primaryPhoneNumber
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 primaryPhoneNumber];

  return (NSString *)v3;
}

- (BOOL)isVerified
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 isVerified];

  return v3;
}

- (BSBrandMessagingDetails)messagingDetails
{
  return self->_messagingDetails;
}

- (id)verifiedBy
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 verifiedBy];

  return v3;
}

- (id)website
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 website];

  return v3;
}

- (id)messageNumber
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 messageNumber];

  return v3;
}

- (id)emailAddress
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 emailAddress];

  return v3;
}

- (id)address
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 address];

  return v3;
}

- (id)termsAndConditionsURL
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 termsAndConditionsURL];

  return v3;
}

- (id)genericCSSTemplateURL
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 genericCSSTemplateURL];

  return v3;
}

- (id)localizedDescription
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 localizedDescription];

  return v3;
}

- (NSString)localizedResponseTime
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 localizedResponseTime];

  return (NSString *)v3;
}

- (id)logoFingerprint
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 logoFingerprint];

  return v3;
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a6;
  id v11 = [(BSBrand *)self shim];
  objc_msgSend(v11, "logoDataOfType:desiredSize:completion:", a3, v10, width, height);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = [(BSBrand *)self shim];
  objc_msgSend(v10, "logoDataOfType:desiredSize:completion:", a3, v9, width, height);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 usingSim:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(BSBrand *)self shim];
  objc_msgSend(v13, "logoDataOfType:desiredSize:usingSim:completion:", a3, v12, v11, width, height);
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(BSBrand *)self shim];
  objc_msgSend(v8, "squareLogoDataForDesiredSize:completion:", v7, width, height);
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(BSBrand *)self shim];
  objc_msgSend(v8, "wideLogoDataForDesiredSize:completion:", v7, width, height);
}

- (void)logoFileURLForType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = [(BSBrand *)self shim];
  objc_msgSend(v10, "logoFileURLOfType:desiredSize:completionHandler:", a3, v9, width, height);
}

- (void)assetDataForType:(int64_t)a3 usingSim:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(BSBrand *)self shim];
  [v10 assetDataOfType:a3 usingSim:v9 completion:v8];
}

- (void)clearCachedAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(BSBrand *)self shim];
  [v5 clearCachedAssets:v4];
}

- (NSString)_primaryBrandColorHexString
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 primaryBrandColorHexString];

  return (NSString *)v3;
}

- (NSString)_secondaryBrandColorHexString
{
  v2 = [(BSBrand *)self shim];
  char v3 = [v2 secondaryBrandColorHexString];

  return (NSString *)v3;
}

- (id)_initWithShim:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSBrand;
  v6 = [(BSBrand *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shim, a3);
  }

  return v7;
}

+ (id)mockBrand
{
  id v2 = objc_alloc((Class)a1);
  char v3 = +[BSBrandObjcShim mockBrand];
  id v4 = (void *)[v2 _initWithShim:v3];

  return v4;
}

- (BSBrandObjcShim)shim
{
  return self->_shim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
  objc_storeStrong((id *)&self->_messagingDetails, 0);
}

- (BOOL)isAppleMainBrand
{
  id v2 = [(BSBrand *)self brandURI];
  char v3 = BSBrandURIIsAppleMain(v2);

  return v3;
}

- (BOOL)isAppleMakoBrand
{
  id v2 = [(BSBrand *)self brandURI];
  char v3 = BSBrandURIIsAppleMako(v2);

  return v3;
}

+ (id)placeholderName
{
  return +[BSBrandObjcShim placeholderName];
}

@end