@interface UIWebSelectSinglePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
@end

@implementation UIWebSelectSinglePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebSelectSinglePicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end