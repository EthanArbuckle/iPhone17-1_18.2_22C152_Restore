@interface UIContentUnavailableConfiguration(AppleAccountUI)
+ (id)_appleIDImage;
+ (id)signInNotAvailable;
@end

@implementation UIContentUnavailableConfiguration(AppleAccountUI)

+ (id)signInNotAvailable
{
  v2 = [MEMORY[0x263F82600] emptyConfiguration];
  v3 = [a1 _appleIDImage];
  [v2 setImage:v3];

  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v5 = [v4 localizedStringForKey:@"SIGN_IN_GUEST_MODE_RESTRICTED" value:&stru_26BD39CD8 table:@"Localizable"];
  [v2 setText:v5];

  v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v7 = [v6 localizedStringForKey:@"SIGN_IN_GUEST_MODE_SECONDARY_TEXT" value:&stru_26BD39CD8 table:@"Localizable"];
  [v2 setSecondaryText:v7];

  v8 = [MEMORY[0x263F825C8] labelColor];
  v9 = [v2 textProperties];
  [v9 setColor:v8];

  [v2 setAlignment:0];
  return v2;
}

+ (id)_appleIDImage
{
  v10[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F825C8] whiteColor];
  v1 = [MEMORY[0x263F825C8] labelColor];
  v2 = [MEMORY[0x263F82818] configurationWithHierarchicalColor:v0];
  v3 = (void *)MEMORY[0x263F82818];
  v10[0] = v0;
  v10[1] = v1;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v5 = [v3 configurationWithPaletteColors:v4];
  v6 = [v2 configurationByApplyingConfiguration:v5];

  v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"apple.id"];
  v8 = [v7 imageByApplyingSymbolConfiguration:v6];

  return v8;
}

@end