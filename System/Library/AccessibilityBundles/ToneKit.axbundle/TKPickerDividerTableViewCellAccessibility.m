@interface TKPickerDividerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation TKPickerDividerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TKPickerDividerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813E8];
}

@end