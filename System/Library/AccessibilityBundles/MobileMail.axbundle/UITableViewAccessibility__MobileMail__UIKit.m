@interface UITableViewAccessibility__MobileMail__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation UITableViewAccessibility__MobileMail__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
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
  v3 = [(UITableViewAccessibility__MobileMail__UIKit *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Mfvipsendersli.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility__MobileMail__UIKit;
  return [(UITableViewAccessibility__MobileMail__UIKit *)&v6 isAccessibilityElement];
}

@end