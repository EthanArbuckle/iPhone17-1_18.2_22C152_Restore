@interface ACAccount(AppleAccountUI)
- (BOOL)aaui_compositeNameFormat;
- (id)aaui_compositeName;
@end

@implementation ACAccount(AppleAccountUI)

- (id)aaui_compositeName
{
  v2 = objc_msgSend(a1, "aa_firstName");
  v3 = objc_msgSend(a1, "aa_lastName");
  v4 = AAUICopyCompositeName(v2, v3);

  return v4;
}

- (BOOL)aaui_compositeNameFormat
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A68]);
  v3 = objc_msgSend(a1, "aa_firstName");
  [v2 setGivenName:v3];

  v4 = objc_msgSend(a1, "aa_lastName");
  [v2 setFamilyName:v4];

  BOOL v5 = [MEMORY[0x263F08A78] _nameOrderWithOverridesForComponents:v2 options:0] == 2;
  return v5;
}

@end