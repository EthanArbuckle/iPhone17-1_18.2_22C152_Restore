@interface SBHClockApplicationIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation SBHClockApplicationIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHClockApplicationIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v2 = [MEMORY[0x263EFF910] date];
  v3 = AXDateStringForFormat();

  v4 = [MEMORY[0x263F21660] axAttributedStringWithString:v3];
  [v4 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];

  return v4;
}

@end