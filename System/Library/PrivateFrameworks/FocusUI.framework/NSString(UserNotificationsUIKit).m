@interface NSString(UserNotificationsUIKit)
- (BOOL)fcui_containsExcessiveLineHeightCharacters;
@end

@implementation NSString(UserNotificationsUIKit)

- (BOOL)fcui_containsExcessiveLineHeightCharacters
{
  v2 = objc_msgSend(MEMORY[0x263F81708], "fcui_excessiveLineHeightChars");
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end