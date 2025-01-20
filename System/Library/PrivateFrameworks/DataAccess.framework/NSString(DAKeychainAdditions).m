@interface NSString(DAKeychainAdditions)
- (__CFString)stringByURLQuoting;
@end

@implementation NSString(DAKeychainAdditions)

- (__CFString)stringByURLQuoting
{
  v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, &stru_1F13DB4B0, @"?", 0x8000100u);
  v3 = v2;
  if (!v2) {
    v2 = originalString;
  }
  v4 = v2;

  return v4;
}

@end