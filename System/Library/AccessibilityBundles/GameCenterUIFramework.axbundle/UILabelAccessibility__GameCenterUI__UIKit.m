@interface UILabelAccessibility__GameCenterUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation UILabelAccessibility__GameCenterUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIColor", @"alpha", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UILabelAccessibility__GameCenterUI__UIKit *)self safeValueForKey:@"color"];
  [v3 safeCGFloatForKey:@"alpha"];
  double v5 = v4;

  v7.receiver = self;
  v7.super_class = (Class)UILabelAccessibility__GameCenterUI__UIKit;
  BOOL result = [(UILabelAccessibility__GameCenterUI__UIKit *)&v7 isAccessibilityElement];
  if (v5 <= 0.0) {
    return 0;
  }
  return result;
}

@end