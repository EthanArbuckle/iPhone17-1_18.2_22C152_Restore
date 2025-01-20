@interface MTUIGlyphTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation MTUIGlyphTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIGlyphTimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(MTUIGlyphTimeViewAccessibility *)self safeUIViewForKey:@"timeLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end