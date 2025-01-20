@interface HUTitleValueDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation HUTitleValueDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTitleValueDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end