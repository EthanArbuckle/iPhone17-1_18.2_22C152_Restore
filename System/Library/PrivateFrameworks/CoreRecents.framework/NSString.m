@interface NSString
@end

@implementation NSString

uint64_t __70__NSString_CoreRecentsUtilities__cr_lowercaseStringWithStandardLocale__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  cr_lowercaseStringWithStandardLocale__someLocale = result;
  return result;
}

@end