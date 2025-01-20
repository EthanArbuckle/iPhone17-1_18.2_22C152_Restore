@interface UITextFieldAccessibility__HealthKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation UITextFieldAccessibility__HealthKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v3 = [(UITextFieldAccessibility__HealthKit__UIKit *)self text];
  v4 = AXBloodTypeStringFromString(v3, v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextFieldAccessibility__HealthKit__UIKit;
    id v6 = [(UITextFieldAccessibility__HealthKit__UIKit *)&v9 accessibilityValue];
  }
  v7 = v6;

  return v7;
}

@end