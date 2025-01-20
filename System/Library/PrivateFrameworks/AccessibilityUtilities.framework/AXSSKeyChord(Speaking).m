@interface AXSSKeyChord(Speaking)
- (id)_accessibilitySpeakableDisplayValueWithStyle:()Speaking isUSKeyboard:;
- (id)accessibilitySpeakableDisplayValueWithStyle:()Speaking;
- (uint64_t)accessibilitySpeakableDisplayValue;
- (uint64_t)fkaSpeakableDisplayValue;
@end

@implementation AXSSKeyChord(Speaking)

- (uint64_t)accessibilitySpeakableDisplayValue
{
  return [a1 accessibilitySpeakableDisplayValueWithStyle:0];
}

- (id)accessibilitySpeakableDisplayValueWithStyle:()Speaking
{
  v5 = BKSHIDServicesGetHardwareKeyboardLanguage();
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 isEqualToString:@"U.S."];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 localeIdentifier];

    uint64_t v7 = [v9 isEqualToString:@"en_US"];
  }
  v10 = [a1 _accessibilitySpeakableDisplayValueWithStyle:a3 isUSKeyboard:v7];

  return v10;
}

- (id)_accessibilitySpeakableDisplayValueWithStyle:()Speaking isUSKeyboard:
{
  v1 = (void *)MEMORY[0x1E4F488F0];
  v2 = objc_msgSend(a1, "displayValueWithStyle:isUSKeyboard:");
  v3 = [v1 axAttributedStringWithString:v2];

  [v3 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F48B08]];

  return v3;
}

- (uint64_t)fkaSpeakableDisplayValue
{
  return [a1 accessibilitySpeakableDisplayValueWithStyle:1];
}

@end