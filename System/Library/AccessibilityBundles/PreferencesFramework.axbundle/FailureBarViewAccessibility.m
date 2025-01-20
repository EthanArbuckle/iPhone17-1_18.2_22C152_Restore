@interface FailureBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)setFailureCount:(int)a3;
@end

@implementation FailureBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FailureBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setFailureCount:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FailureBarViewAccessibility;
  [(FailureBarViewAccessibility *)&v6 setFailureCount:*(void *)&a3];
  v4 = [(FailureBarViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = [v4 accessibilityLabel];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (id)accessibilityLabel
{
  v2 = [(FailureBarViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end