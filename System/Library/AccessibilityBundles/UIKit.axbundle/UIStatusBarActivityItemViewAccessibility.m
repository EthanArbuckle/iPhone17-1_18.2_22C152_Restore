@interface UIStatusBarActivityItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarActivityItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarActivityItemView";
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
  id v3 = (id)[(UIStatusBarActivityItemViewAccessibility *)self safeValueForKey:@"_syncActivity"];
  char v4 = [v3 BOOLValue];

  if (v4) {
    id v5 = accessibilityLocalizedString(@"status.synching.inprogress");
  }
  else {
    id v5 = accessibilityLocalizedString(@"status.network.connection.inprogress");
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarActivityItemViewAccessibility;
  return [(UIStatusBarActivityItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end