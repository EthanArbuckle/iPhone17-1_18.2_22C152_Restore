@interface CNContactActionDropdownMenuCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation CNContactActionDropdownMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactActionDropdownMenuCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end