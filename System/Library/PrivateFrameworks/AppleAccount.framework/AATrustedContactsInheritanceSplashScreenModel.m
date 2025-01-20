@interface AATrustedContactsInheritanceSplashScreenModel
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
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setIsWalrusEnabled:(BOOL)a3;
@end

@implementation AATrustedContactsInheritanceSplashScreenModel

- (id)bullets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AATrustedContactsInheritanceSplashScreenModel_bullets__block_invoke;
  block[3] = &unk_1E5A48358;
  block[4] = self;
  if (bullets_onceToken != -1) {
    dispatch_once(&bullets_onceToken, block);
  }
  return (id)bullets_bullets;
}

void __56__AATrustedContactsInheritanceSplashScreenModel_bullets__block_invoke(uint64_t a1)
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
  v16 = (void *)bullets_bullets;
  bullets_bullets = v15;
}

- (NSString)secondaryButton
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_CANCEL_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)primaryButton
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_CONTINUE_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"appleaccount-legacycontact-onboarding";
}

- (NSString)imageName
{
  return 0;
}

- (id)_firstBulletPointDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_FIRST_BULLET_DESCRIPTION" value:0 table:@"Localizable"];

  return v3;
}

- (id)_firstBulletPointSymbolName
{
  return @"person.2.fill";
}

- (id)_firstBulletPointTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_FIRST_BULLET_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_secondBulletPointDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_SECOND_BULLET_DESCRIPTION" value:0 table:@"Localizable"];

  return v3;
}

- (id)_secondBulletPointSymbolName
{
  return @"key.fill";
}

- (id)_secondBulletPointTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_SECOND_BULLET_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_thirdBulletPointDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_THIRD_BULLET_DESCRIPTION" value:0 table:@"Localizable"];

  return v3;
}

- (id)_thirdBulletPointSymbolName
{
  return @"doc.fill";
}

- (id)_thirdBulletPointTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"INHERITANCE_SPLASH_SCREEN_THIRD_BULLET_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
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
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);

  objc_storeStrong((id *)&self->_detailText, 0);
}

@end