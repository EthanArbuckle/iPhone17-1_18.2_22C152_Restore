@interface CNPhotoPickerAnimojiProviderItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (NSString)_axColorVariantName;
@end

@implementation CNPhotoPickerAnimojiProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerAnimojiProviderItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerAnimojiProviderItem", @"backgroundColorVariant", "@", 0);
  [v3 validateClass:@"CNPhotoPickerColorVariant"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerColorVariant", @"color", "@", 0);
}

- (NSString)_axColorVariantName
{
  objc_opt_class();
  id v3 = [(CNPhotoPickerAnimojiProviderItemAccessibility *)self safeValueForKey:@"backgroundColorVariant"];
  v4 = [v3 safeValueForKey:@"color"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5) {
    AXColorStringForColor();
  }
  else {
  v6 = accessibilityLocalizedString(@"default.background.color");
  }

  return (NSString *)v6;
}

@end