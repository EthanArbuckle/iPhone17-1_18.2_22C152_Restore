@interface NSString(VSAdditions)
+ (__CFString)vs_trueFalseStringValueFromBool:()VSAdditions;
+ (__CFString)vs_yesNoStringValueFromBool:()VSAdditions;
+ (id)vs_localizedStringFromBool:()VSAdditions;
- (BOOL)vs_composedCharacterIsLetter;
- (BOOL)vs_composedCharacterIsWhitespace;
- (uint64_t)vs_composedCharacterIsLowercase;
- (uint64_t)vs_composedCharacterIsUppercase;
- (unint64_t)vs_unsignedLongLongValue;
@end

@implementation NSString(VSAdditions)

- (unint64_t)vs_unsignedLongLongValue
{
  v1 = (const char *)[a1 UTF8String];

  return strtoull(v1, 0, 0);
}

- (BOOL)vs_composedCharacterIsWhitespace
{
  if (![a1 length]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)vs_composedCharacterIsLetter
{
  if (![a1 length]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (uint64_t)vs_composedCharacterIsUppercase
{
  uint64_t result = objc_msgSend(a1, "vs_composedCharacterIsLetter");
  if (result)
  {
    v3 = [a1 uppercaseString];
    uint64_t v4 = [a1 isEqualToString:v3];

    return v4;
  }
  return result;
}

- (uint64_t)vs_composedCharacterIsLowercase
{
  uint64_t result = objc_msgSend(a1, "vs_composedCharacterIsLetter");
  if (result)
  {
    v3 = [a1 lowercaseString];
    uint64_t v4 = [a1 isEqualToString:v3];

    return v4;
  }
  return result;
}

+ (id)vs_localizedStringFromBool:()VSAdditions
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
  v5 = [v4 localizedStringForKey:@"STRING_REPRESENTATION_OF_YES" value:0 table:0];

  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
  v7 = [v6 localizedStringForKey:@"STRING_REPRESENTATION_OF_NO" value:0 table:0];

  if (a3) {
    v8 = v5;
  }
  else {
    v8 = v7;
  }
  id v9 = v8;

  return v9;
}

+ (__CFString)vs_yesNoStringValueFromBool:()VSAdditions
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

+ (__CFString)vs_trueFalseStringValueFromBool:()VSAdditions
{
  if (a3) {
    return @"true";
  }
  else {
    return @"false";
  }
}

@end