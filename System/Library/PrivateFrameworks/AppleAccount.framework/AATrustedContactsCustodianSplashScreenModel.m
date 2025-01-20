@interface AATrustedContactsCustodianSplashScreenModel
- (BOOL)isWalrusEnabled;
- (NSString)accessibilityIdentifier;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)primaryButton;
- (NSString)secondaryButton;
- (NSString)title;
- (id)_firstBulletPointDescription;
- (id)_firstBulletPointSymbolName;
- (id)_firstBulletPointTitle;
- (id)_secondBulletPointDescription;
- (id)_secondBulletPointSymbolName;
- (id)_secondBulletPointTitle;
- (id)_thirdBulletPointDescription;
- (id)_thirdBulletPointSymbolName;
- (id)_thirdBulletPointTitle;
- (id)bullets;
- (void)setDetailText:(id)a3;
- (void)setIsWalrusEnabled:(BOOL)a3;
@end

@implementation AATrustedContactsCustodianSplashScreenModel

- (id)bullets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AATrustedContactsCustodianSplashScreenModel_bullets__block_invoke;
  block[3] = &unk_1E5A48358;
  block[4] = self;
  if (bullets_onceToken_0 != -1) {
    dispatch_once(&bullets_onceToken_0, block);
  }
  return (id)bullets_bullets_0;
}

void __54__AATrustedContactsCustodianSplashScreenModel_bullets__block_invoke(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v2 = [AAOBBulletPointModel alloc];
  v18 = [*(id *)(a1 + 32) _firstBulletPointSymbolName];
  v17 = [*(id *)(a1 + 32) _firstBulletPointTitle];
  v3 = [*(id *)(a1 + 32) _firstBulletPointDescription];
  v4 = [(AAOBBulletPointModel *)v2 initWithSymbolNamed:v18 title:v17 description:v3];
  v19[0] = v4;
  v5 = [AAOBBulletPointModel alloc];
  v6 = [*(id *)(a1 + 32) _secondBulletPointSymbolName];
  v7 = [*(id *)(a1 + 32) _secondBulletPointTitle];
  v8 = [*(id *)(a1 + 32) _secondBulletPointDescription];
  v9 = [(AAOBBulletPointModel *)v5 initWithSymbolNamed:v6 title:v7 description:v8];
  v19[1] = v9;
  v10 = [AAOBBulletPointModel alloc];
  v11 = [*(id *)(a1 + 32) _thirdBulletPointSymbolName];
  v12 = [*(id *)(a1 + 32) _thirdBulletPointTitle];
  v13 = [*(id *)(a1 + 32) _thirdBulletPointDescription];
  v14 = [(AAOBBulletPointModel *)v10 initWithSymbolNamed:v11 title:v12 description:v13];
  v19[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v16 = (void *)bullets_bullets_0;
  bullets_bullets_0 = v15;
}

- (NSString)secondaryButton
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_CANCEL_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)primaryButton
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_CONTINUE_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"appleaccount-recoverycontact-onboarding";
}

- (NSString)imageName
{
  return 0;
}

- (id)_firstBulletPointDescription
{
  v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v4 = [v3 primaryAuthKitAccount];
  v5 = [v2 ageOfMajorityForAccount:v4];
  v6 = [v5 stringValue];

  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v6 = [v7 localizedStringForKey:@"CUSTODIAN_DEFAULT_AGE_OF_MAJORITY" value:0 table:@"Localizable"];
  }
  v8 = NSString;
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v10 = [v9 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_FIRST_BULLET_DESCRIPTION" value:0 table:@"Localizable"];
  v11 = objc_msgSend(v8, "stringWithFormat:", v10, v6);

  return v11;
}

- (id)_firstBulletPointSymbolName
{
  return @"person.2.fill";
}

- (id)_firstBulletPointTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_FIRST_BULLET_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_secondBulletPointDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_SECOND_BULLET_DESCRIPTION" value:0 table:@"Localizable"];

  return v3;
}

- (id)_secondBulletPointSymbolName
{
  return @"phone.fill";
}

- (id)_secondBulletPointTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_SPLASH_SCREEN_SECOND_BULLET_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_thirdBulletPointDescription
{
  if (+[AAPreferences isSignInSecurityRedesignEnabled]
    || +[AAPreferences isSignInSecurityRedesignMacOSEnabled])
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v3 = v2;
    v4 = @"CUSTODIAN_SPLASH_SCREEN_THIRD_BULLET_DESCRIPTION_NEW";
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v3 = v2;
    v4 = @"CUSTODIAN_SPLASH_SCREEN_THIRD_BULLET_DESCRIPTION";
  }
  v5 = [v2 localizedStringForKey:v4 value:0 table:@"Localizable"];

  return v5;
}

- (id)_thirdBulletPointSymbolName
{
  return @"checkmark.circle.fill";
}

- (id)_thirdBulletPointTitle
{
  if (+[AAPreferences isSignInSecurityRedesignEnabled]
    || +[AAPreferences isSignInSecurityRedesignMacOSEnabled])
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v3 = v2;
    v4 = @"CUSTODIAN_SPLASH_SCREEN_THIRD_BULLET_TITLE_NEW";
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v3 = v2;
    v4 = @"CUSTODIAN_SPLASH_SCREEN_THIRD_BULLET_TITLE";
  }
  v5 = [v2 localizedStringForKey:v4 value:0 table:@"Localizable"];

  return v5;
}

- (NSString)helpLinkTitle
{
  return 0;
}

- (NSString)helpLinkURL
{
  return 0;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (void).cxx_destruct
{
}

@end