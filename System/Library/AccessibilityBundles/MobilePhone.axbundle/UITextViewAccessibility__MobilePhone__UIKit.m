@interface UITextViewAccessibility__MobilePhone__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityActivateTextViewLink:(id)a3;
@end

@implementation UITextViewAccessibility__MobilePhone__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityActivateTextViewLink:(id)a3
{
  id v4 = a3;
  v5 = [(UITextViewAccessibility__MobilePhone__UIKit *)self accessibilityContainer];
  char v6 = [v5 _accessibilityActivateTextViewLink:v4];

  return v6;
}

@end