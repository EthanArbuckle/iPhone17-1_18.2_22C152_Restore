@interface TKPickerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation TKPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TKPickerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TKPickerTableViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TKPickerTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end