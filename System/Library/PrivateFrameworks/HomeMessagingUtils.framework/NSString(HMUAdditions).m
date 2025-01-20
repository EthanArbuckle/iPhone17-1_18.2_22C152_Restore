@interface NSString(HMUAdditions)
- (BOOL)hmu_isPhoneNumber;
- (uint64_t)hmu_isEmail;
@end

@implementation NSString(HMUAdditions)

- (BOOL)hmu_isPhoneNumber
{
  v2 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"+()-"];
  v3 = [MEMORY[0x263F08708] controlCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v2 formUnionWithCharacterSet:v4];

  v5 = [a1 componentsSeparatedByCharactersInSet:v2];
  v6 = [v5 componentsJoinedByString:&stru_26D1C0E50];

  BOOL v7 = [v6 length] == 0;
  return v7;
}

- (uint64_t)hmu_isEmail
{
  if (hmu_isEmail_onceToken != -1) {
    dispatch_once(&hmu_isEmail_onceToken, &__block_literal_global);
  }
  v2 = (void *)hmu_isEmail_emailPredicate;
  return [v2 evaluateWithObject:a1];
}

@end