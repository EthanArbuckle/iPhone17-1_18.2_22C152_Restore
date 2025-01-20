@interface NSNumberFormatter(BatteryCenterUIAdditions)
+ (id)bcui_newPercentChargeFormatter;
- (uint64_t)bcui_isPercentSymbolEnabled;
- (uint64_t)bcui_setPercentSymbolEnabled:()BatteryCenterUIAdditions;
@end

@implementation NSNumberFormatter(BatteryCenterUIAdditions)

+ (id)bcui_newPercentChargeFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v0 setNumberStyle:3];
  [v0 _setUsesCharacterDirection:1];
  [v0 setMultiplier:&unk_1F35180A8];

  return v0;
}

- (uint64_t)bcui_isPercentSymbolEnabled
{
  v1 = [a1 percentSymbol];
  uint64_t v2 = [v1 isEqualToString:&stru_1F35146C8];

  return v2;
}

- (uint64_t)bcui_setPercentSymbolEnabled:()BatteryCenterUIAdditions
{
  if (a3) {
    v3 = 0;
  }
  else {
    v3 = &stru_1F35146C8;
  }
  return [a1 setPercentSymbol:v3];
}

@end