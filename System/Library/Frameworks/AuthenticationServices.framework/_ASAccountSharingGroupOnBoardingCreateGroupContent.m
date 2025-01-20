@interface _ASAccountSharingGroupOnBoardingCreateGroupContent
+ (NSString)firstBulletDescription;
+ (NSString)firstBulletImageName;
+ (NSString)firstBulletTitle;
+ (NSString)headerImageName;
+ (NSString)headerTitle;
+ (NSString)secondBulletDescription;
+ (NSString)secondBulletImageName;
+ (NSString)secondBulletTitle;
+ (NSString)thirdBulletDescription;
+ (NSString)thirdBulletImageName;
+ (NSString)thirdBulletTitle;
+ (UIImage)firstBulletImage;
+ (UIImage)headerImage;
+ (UIImage)secondBulletImage;
+ (UIImage)thirdBulletImage;
+ (id)_bulletListItemImageConfiguration;
@end

@implementation _ASAccountSharingGroupOnBoardingCreateGroupContent

+ (NSString)headerImageName
{
  return (NSString *)@"person.2.badge.key.fill";
}

+ (UIImage)headerImage
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] tintColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = [MEMORY[0x263F82818] configurationWithPointSize:48.0];
  v7 = [v5 configurationByApplyingConfiguration:v6];

  v8 = (void *)MEMORY[0x263F827E8];
  v9 = [a1 headerImageName];
  v10 = [v8 _systemImageNamed:v9];
  v11 = [v10 imageWithConfiguration:v7];

  return (UIImage *)v11;
}

+ (NSString)headerTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletImageName
{
  return (NSString *)@"person.crop.circle.fill.badge.plus";
}

+ (UIImage)firstBulletImage
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = [a1 firstBulletImageName];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)firstBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletImageName
{
  return (NSString *)@"checklist";
}

+ (UIImage)secondBulletImage
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = [a1 secondBulletImageName];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)secondBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletImageName
{
  return (NSString *)@"switch.2";
}

+ (UIImage)thirdBulletImage
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = [a1 thirdBulletImageName];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)thirdBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)_bulletListItemImageConfiguration
{
  if (_bulletListItemImageConfiguration_onceToken != -1) {
    dispatch_once(&_bulletListItemImageConfiguration_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_bulletListItemImageConfiguration_imageConfiguration;

  return v2;
}

@end