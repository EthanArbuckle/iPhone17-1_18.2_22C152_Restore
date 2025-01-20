@interface NSString
- (BOOL)rpccui_containsExcessiveLineHeightCharacters;
@end

@implementation NSString

- (BOOL)rpccui_containsExcessiveLineHeightCharacters
{
  v3 = +[UIFont rpccui_excessiveLineHeightChars];
  LOBYTE(self) = [(NSString *)self rangeOfCharacterFromSet:v3] != (id)0x7FFFFFFFFFFFFFFFLL;

  return (char)self;
}

@end