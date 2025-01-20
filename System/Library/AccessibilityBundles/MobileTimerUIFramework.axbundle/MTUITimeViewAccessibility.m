@interface MTUITimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTUITimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUITimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v5.receiver = self;
  v5.super_class = (Class)MTUITimeViewAccessibility;
  v2 = [(MTUITimeViewAccessibility *)&v5 accessibilityLabel];
  v3 = AXLocalizeDurationTime();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

@end