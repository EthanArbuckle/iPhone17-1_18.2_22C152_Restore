@interface MTUIDateLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MTUIDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIDateLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(MTUIDateLabelAccessibility *)self safeValueForKey:@"_dateLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 containsString:@":"])
  {
    v4 = [MEMORY[0x263F21660] axAttributedStringWithString:v3];

    [v4 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21708]];
    v3 = v4;
  }

  return v3;
}

@end