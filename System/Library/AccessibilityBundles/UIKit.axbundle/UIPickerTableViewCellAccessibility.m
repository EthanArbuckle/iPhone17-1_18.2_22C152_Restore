@interface UIPickerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation UIPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPickerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end