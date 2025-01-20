@interface UITableViewAccessibility__Preferences__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDynamicTypeTable;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFooterElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)accessibilityElementCount;
@end

@implementation UITableViewAccessibility__Preferences__UIKit

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
  id v3 = a3;
  [v3 validateClass:@"UITableViewCellAccessibilityElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibilityElement", @"realTableViewCell", "@", 0);
}

- (BOOL)_axIsDynamicTypeTable
{
  v2 = [(UITableViewAccessibility__Preferences__UIKit *)self accessibilityIdentifier];
  char v3 = [v2 isEqualToString:@"DynamicTypeTable"];

  return v3;
}

- (int64_t)accessibilityElementCount
{
  if ([(UITableViewAccessibility__Preferences__UIKit *)self _axIsDynamicTypeTable]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  return [(UITableViewAccessibility__Preferences__UIKit *)&v4 accessibilityElementCount];
}

- (BOOL)isAccessibilityElement
{
  if ([(UITableViewAccessibility__Preferences__UIKit *)self _axIsDynamicTypeTable]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  return [(UITableViewAccessibility__Preferences__UIKit *)&v4 isAccessibilityElement];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  v5 = -[UITableViewAccessibility__Preferences__UIKit _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  if ([(UITableViewAccessibility__Preferences__UIKit *)self _axIsDynamicTypeTable])
  {
    NSClassFromString(&cfstr_Uitableviewcel_2.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 safeValueForKey:@"realTableViewCell"];

      v5 = (void *)v6;
    }
  }

  return v5;
}

- (id)_accessibilityFooterElement
{
  char v3 = [(UITableViewAccessibility__Preferences__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"KeychainSynchTable"];

  if (v4)
  {
    v5 = [(UITableViewAccessibility__Preferences__UIKit *)self _accessibilityValueForKey:@"Footer"];
    if ([v5 _accessibilityViewIsVisible]) {
      goto LABEL_5;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  v5 = [(UITableViewAccessibility__Preferences__UIKit *)&v7 _accessibilityFooterElement];
LABEL_5:

  return v5;
}

@end