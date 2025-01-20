@interface MTATimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTATimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MTATimeViewAccessibility *)self safeValueForKey:@"_timeLabel"];
  v3 = [v2 accessibilityLabel];

  v4 = AXLocalizeDurationTime();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

@end