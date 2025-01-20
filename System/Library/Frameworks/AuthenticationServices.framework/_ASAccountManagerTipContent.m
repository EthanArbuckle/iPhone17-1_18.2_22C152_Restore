@interface _ASAccountManagerTipContent
+ (BOOL)_familySharingTipHasBorderedImage;
+ (BOOL)_generalSharingTipHasBorderedImage;
+ (BOOL)_iCloudKeychainTipHasBorderedImage;
+ (id)_contentForFamilyTip;
+ (id)_contentForGeneralTip;
+ (id)_contentForiCloudKeychainTip;
+ (id)_familySharingTipButtonTitle;
+ (id)_familySharingTipDeclineButtonTitle;
+ (id)_familySharingTipSubtitle;
+ (id)_familySharingTipTitle;
+ (id)_generalSharingTipButtonTitle;
+ (id)_generalSharingTipDeclineButtonTitle;
+ (id)_generalSharingTipSubtitle;
+ (id)_generalSharingTipTitle;
+ (id)_iCloudKeychainTipButtonTitle;
+ (id)_iCloudKeychainTipDeclineButtonTitle;
+ (id)_iCloudKeychainTipImage;
+ (id)_iCloudKeychainTipImageName;
+ (id)_iCloudKeychainTipSubtitle;
+ (id)_iCloudKeychainTipTitle;
+ (id)_imageForSharingTips;
+ (id)_imageNameForSharingTips;
+ (id)contentForTipType:(int64_t)a3;
- (BOOL)hasBorderedImage;
- (NSString)buttonTitle;
- (NSString)declineButtonTitle;
- (NSString)imageName;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (id)_initWithImageName:(id)a3 image:(id)a4 hasBorderedImage:(BOOL)a5 title:(id)a6 subtitle:(id)a7 buttonTitle:(id)a8 declineButtonTitle:(id)a9;
@end

@implementation _ASAccountManagerTipContent

+ (id)contentForTipType:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      v3 = [a1 _contentForGeneralTip];
      break;
    case 2:
      v3 = [a1 _contentForFamilyTip];
      break;
    case 1:
      v3 = [a1 _contentForiCloudKeychainTip];
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

- (id)_initWithImageName:(id)a3 image:(id)a4 hasBorderedImage:(BOOL)a5 title:(id)a6 subtitle:(id)a7 buttonTitle:(id)a8 declineButtonTitle:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_ASAccountManagerTipContent;
  v18 = [(_ASAccountManagerTipContent *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageName, a3);
    objc_storeStrong((id *)&v19->_image, a4);
    v19->_hasBorderedImage = a5;
    objc_storeStrong((id *)&v19->_title, a6);
    objc_storeStrong((id *)&v19->_subtitle, a7);
    objc_storeStrong((id *)&v19->_buttonTitle, a8);
    objc_storeStrong((id *)&v19->_declineButtonTitle, a9);
    v20 = v19;
  }

  return v19;
}

+ (id)_contentForiCloudKeychainTip
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___ASAccountManagerTipContent__contentForiCloudKeychainTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForiCloudKeychainTip_onceToken != -1) {
    dispatch_once(&_contentForiCloudKeychainTip_onceToken, block);
  }
  v2 = (void *)_contentForiCloudKeychainTip_iCloudKeychainTipContent;

  return v2;
}

+ (id)_iCloudKeychainTipImageName
{
  return @"icloud.slash";
}

+ (id)_iCloudKeychainTipImage
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = [a1 _iCloudKeychainTipImageName];
  v4 = [v2 systemImageNamed:v3];
  v5 = [MEMORY[0x263F825C8] labelColor];
  v6 = [v4 imageWithTintColor:v5 renderingMode:2];

  return v6;
}

+ (BOOL)_iCloudKeychainTipHasBorderedImage
{
  return 0;
}

+ (id)_iCloudKeychainTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_contentForFamilyTip
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51___ASAccountManagerTipContent__contentForFamilyTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForFamilyTip_onceToken != -1) {
    dispatch_once(&_contentForFamilyTip_onceToken, block);
  }
  v2 = (void *)_contentForFamilyTip_familyTipContent;

  return v2;
}

+ (id)_contentForGeneralTip
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52___ASAccountManagerTipContent__contentForGeneralTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForGeneralTip_onceToken != -1) {
    dispatch_once(&_contentForGeneralTip_onceToken, block);
  }
  v2 = (void *)_contentForGeneralTip_generalTipContent;

  return v2;
}

+ (BOOL)_familySharingTipHasBorderedImage
{
  return 0;
}

+ (id)_familySharingTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_imageNameForSharingTips
{
  return @"person.2.fill";
}

+ (id)_imageForSharingTips
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = [a1 _imageNameForSharingTips];
  v4 = [v2 systemImageNamed:v3];
  v5 = [MEMORY[0x263F825C8] labelColor];
  v6 = [v4 imageWithTintColor:v5 renderingMode:2];

  return v6;
}

+ (BOOL)_generalSharingTipHasBorderedImage
{
  return 0;
}

+ (id)_generalSharingTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)hasBorderedImage
{
  return self->_hasBorderedImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)declineButtonTitle
{
  return self->_declineButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end