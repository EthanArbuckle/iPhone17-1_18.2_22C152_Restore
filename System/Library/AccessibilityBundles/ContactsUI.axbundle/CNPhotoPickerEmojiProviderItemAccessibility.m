@interface CNPhotoPickerEmojiProviderItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (NSString)_axColorVariantName;
- (NSString)_axStringRepresentation;
@end

@implementation CNPhotoPickerEmojiProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerEmojiProviderItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem" hasProperty:@"stringRepresentation" withType:"@"];
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem" hasProperty:@"backgroundColorVariant" withType:"@"];
}

- (NSString)_axStringRepresentation
{
  v2 = [(CNPhotoPickerEmojiProviderItemAccessibility *)self safeStringForKey:@"stringRepresentation"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return (NSString *)v3;
}

- (NSString)_axColorVariantName
{
  objc_opt_class();
  id v3 = [(CNPhotoPickerEmojiProviderItemAccessibility *)self safeValueForKey:@"backgroundColorVariant"];
  id v4 = [v3 safeValueForKey:@"color"];
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