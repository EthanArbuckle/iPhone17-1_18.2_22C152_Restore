@interface NSObject(AXPrivate)
- (uint64_t)_accessibilityContentLanguage;
@end

@implementation NSObject(AXPrivate)

- (uint64_t)_accessibilityContentLanguage
{
  return 0;
}

@end