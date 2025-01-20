@interface LargeEventViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)layoutSubviews;
@end

@implementation LargeEventViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UpNext.LargeEventView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)LargeEventViewAccessibility;
  [(LargeEventViewAccessibility *)&v2 layoutSubviews];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end