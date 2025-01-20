@interface NSObject(AXUtilsPrivate)
- (uint64_t)_accessibilityInterposesAsSystemApplication;
@end

@implementation NSObject(AXUtilsPrivate)

- (uint64_t)_accessibilityInterposesAsSystemApplication
{
  return 0;
}

@end