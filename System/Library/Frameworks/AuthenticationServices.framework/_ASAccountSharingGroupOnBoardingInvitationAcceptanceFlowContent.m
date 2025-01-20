@interface _ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent
+ (NSString)firstBulletDescriptionForWelcomeView;
+ (NSString)firstBulletImageNameForWelcomeView;
+ (NSString)firstBulletTitleForWelcomeView;
+ (NSString)headerImageNameForMovingCredentialsToGroup;
+ (NSString)headerImageNameForRemovingDuplicateCredentialsInGroup;
+ (NSString)headerImageNameForWelcomeView;
+ (NSString)headerTitleForMovingCredentialsToGroup;
+ (NSString)headerTitleForRemovingDuplicateCredentialsInGroup;
+ (NSString)secondBulletDescriptionForWelcomeView;
+ (NSString)secondBulletImageNameForWelcomeView;
+ (NSString)secondBulletTitleForWelcomeView;
+ (NSString)thirdBulletDescriptionForWelcomeView;
+ (NSString)thirdBulletImageNameForWelcomeView;
+ (NSString)thirdBulletTitleForWelcomeView;
+ (UIImage)firstBulletImageForWelcomeView;
+ (UIImage)headerImageForMovingCredentialsToGroup;
+ (UIImage)headerImageForRemovingDuplicateCredentialsInGroup;
+ (UIImage)headerImageForWelcomeView;
+ (UIImage)secondBulletImageForWelcomeView;
+ (UIImage)thirdBulletImageForWelcomeView;
+ (id)_bulletListItemImageConfiguration;
+ (id)_headerImageForString:(id)a3;
+ (id)descriptionForMovingCredentialsToGroup:(id)a3;
+ (id)descriptionForRemovingDuplicateCredentialsInGroup:(id)a3;
+ (id)headerSubtitleForRemovingDuplicateCredentialsInGroup:(id)a3;
+ (id)headerTitleForWelcomeViewWithGroupName:(id)a3;
@end

@implementation _ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent

+ (NSString)headerImageNameForWelcomeView
{
  return (NSString *)@"person.2.badge.key.fill";
}

+ (UIImage)headerImageForWelcomeView
{
  v3 = [a1 headerImageNameForWelcomeView];
  v4 = [a1 _headerImageForString:v3];

  return (UIImage *)v4;
}

+ (id)headerTitleForWelcomeViewWithGroupName:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

+ (NSString)firstBulletImageNameForWelcomeView
{
  return (NSString *)@"rectangle.and.pencil.and.ellipsis";
}

+ (UIImage)firstBulletImageForWelcomeView
{
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [a1 firstBulletImageNameForWelcomeView];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)firstBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletImageNameForWelcomeView
{
  return (NSString *)@"checklist";
}

+ (UIImage)secondBulletImageForWelcomeView
{
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [a1 secondBulletImageNameForWelcomeView];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)secondBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletImageNameForWelcomeView
{
  return (NSString *)@"switch.2";
}

+ (UIImage)thirdBulletImageForWelcomeView
{
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [a1 thirdBulletImageNameForWelcomeView];
  v5 = [v3 systemImageNamed:v4];
  v6 = [a1 _bulletListItemImageConfiguration];
  v7 = [v5 imageWithConfiguration:v6];

  return (UIImage *)v7;
}

+ (NSString)thirdBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)_bulletListItemImageConfiguration
{
  if (_bulletListItemImageConfiguration_onceToken_0 != -1) {
    dispatch_once(&_bulletListItemImageConfiguration_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)_bulletListItemImageConfiguration_imageConfiguration_0;

  return v2;
}

+ (NSString)headerTitleForMovingCredentialsToGroup
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)descriptionForMovingCredentialsToGroup:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);

  return v6;
}

+ (NSString)headerImageNameForMovingCredentialsToGroup
{
  return (NSString *)@"person.2.badge.key.fill";
}

+ (UIImage)headerImageForMovingCredentialsToGroup
{
  v3 = [a1 headerImageNameForMovingCredentialsToGroup];
  id v4 = [a1 _headerImageForString:v3];

  return (UIImage *)v4;
}

+ (NSString)headerTitleForRemovingDuplicateCredentialsInGroup
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)descriptionForRemovingDuplicateCredentialsInGroup:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);

  return v6;
}

+ (NSString)headerImageNameForRemovingDuplicateCredentialsInGroup
{
  return (NSString *)@"doc.on.doc.fill";
}

+ (UIImage)headerImageForRemovingDuplicateCredentialsInGroup
{
  v3 = [a1 headerImageNameForRemovingDuplicateCredentialsInGroup];
  id v4 = [a1 _headerImageForString:v3];

  return (UIImage *)v4;
}

+ (id)headerSubtitleForRemovingDuplicateCredentialsInGroup:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);

  return v6;
}

+ (id)_headerImageForString:(id)a3
{
  v3 = (void *)MEMORY[0x263F82818];
  id v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  v6 = [v4 tintColor];
  v7 = [v3 configurationWithHierarchicalColor:v6];

  v8 = [MEMORY[0x263F82818] configurationWithPointSize:48.0];
  v9 = [v7 configurationByApplyingConfiguration:v8];

  v10 = [MEMORY[0x263F827E8] _systemImageNamed:v5];

  v11 = [v10 imageWithConfiguration:v9];

  return v11;
}

@end