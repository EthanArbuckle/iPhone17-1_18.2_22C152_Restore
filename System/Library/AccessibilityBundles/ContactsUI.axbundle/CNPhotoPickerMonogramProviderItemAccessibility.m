@interface CNPhotoPickerMonogramProviderItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (NSString)_axColorVariantName;
@end

@implementation CNPhotoPickerMonogramProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerMonogramProviderItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (NSString)_axColorVariantName
{
  objc_opt_class();
  v3 = [(CNPhotoPickerMonogramProviderItemAccessibility *)self safeValueForKey:@"backgroundColor"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4) {
    AXColorStringForColor();
  }
  else {
  v5 = accessibilityLocalizedString(@"default.background.color");
  }

  return (NSString *)v5;
}

@end