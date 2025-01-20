@interface UIWebSelectMultiplePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
@end

@implementation UIWebSelectMultiplePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebSelectMultiplePicker";
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