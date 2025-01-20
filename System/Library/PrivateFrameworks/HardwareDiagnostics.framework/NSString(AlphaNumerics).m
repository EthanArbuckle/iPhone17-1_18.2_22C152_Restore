@interface NSString(AlphaNumerics)
- (BOOL)isAlphaNumeric;
@end

@implementation NSString(AlphaNumerics)

- (BOOL)isAlphaNumeric
{
  v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

@end