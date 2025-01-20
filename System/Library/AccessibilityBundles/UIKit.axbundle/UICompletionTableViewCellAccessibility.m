@interface UICompletionTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UICompletionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICompletionTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v3 = (id)[(UICompletionTableViewCellAccessibility *)self safeValueForKey:@"_tableCell"];
  char v4 = [v3 isAccessibilityElement];

  return v4 & 1;
}

- (id)accessibilityLabel
{
  id v3 = (id)[(UICompletionTableViewCellAccessibility *)self safeValueForKey:@"_tableCell"];
  id v4 = (id)[v3 _accessibilityAXAttributedLabel];

  return v4;
}

- (id)accessibilityValue
{
  id v3 = (id)[(UICompletionTableViewCellAccessibility *)self safeValueForKey:@"_tableCell"];
  id v4 = (id)[v3 _accessibilityAXAttributedValue];

  return v4;
}

@end