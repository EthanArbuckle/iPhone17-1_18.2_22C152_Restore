@interface NSDate(AccessibilityUtilities)
- (id)_accessibilityTimeString;
- (uint64_t)_accessibilityYearlessDayString;
@end

@implementation NSDate(AccessibilityUtilities)

- (id)_accessibilityTimeString
{
  v0 = (void *)MEMORY[0x263F21660];
  v1 = AXDateStringForFormat();
  v2 = [v0 axAttributedStringWithString:v1];

  [v2 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21708]];

  return v2;
}

- (uint64_t)_accessibilityYearlessDayString
{
  return AXDateStringForFormat();
}

@end