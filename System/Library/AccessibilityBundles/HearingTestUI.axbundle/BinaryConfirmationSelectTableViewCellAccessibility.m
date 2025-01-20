@interface BinaryConfirmationSelectTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation BinaryConfirmationSelectTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.BinaryConfirmationSelectTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  if ([(BinaryConfirmationSelectTableViewCellAccessibility *)self safeSwiftBoolForKey:@"accessoryIsSelected"])
  {
    v5.receiver = self;
    v5.super_class = (Class)BinaryConfirmationSelectTableViewCellAccessibility;
    return *MEMORY[0x263F1CF38] | [(BinaryConfirmationSelectTableViewCellAccessibility *)&v5 accessibilityTraits];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)BinaryConfirmationSelectTableViewCellAccessibility;
    return [(BinaryConfirmationSelectTableViewCellAccessibility *)&v4 accessibilityTraits];
  }
}

@end