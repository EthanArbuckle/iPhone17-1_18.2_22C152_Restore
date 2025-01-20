@interface VideosUISeasonPickerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityMultipleSeasonsAvailable;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUISeasonPickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SeasonPickerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.SeasonPickerButton" hasProperty:@"accessibilityCurrentLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.SeasonPickerButton" hasProperty:@"accessibilityAltLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.SeasonPickerButton" hasProperty:@"accessibilityHeaderTitles" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(VideosUISeasonPickerButtonAccessibility *)self safeValueForKey:@"accessibilityCurrentLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];
  objc_opt_class();
  v6 = [(VideosUISeasonPickerButtonAccessibility *)self safeValueForKey:@"accessibilityAltLabel"];
  v7 = __UIAccessibilityCastAsClass();

  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(VideosUISeasonPickerButtonAccessibility *)self _accessibilityMultipleSeasonsAvailable];
  id v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CEF8];
  }
  return *v3;
}

- (id)accessibilityHint
{
  if ([(VideosUISeasonPickerButtonAccessibility *)self _accessibilityMultipleSeasonsAvailable])
  {
    id v3 = accessibilityLocalizedString(@"season.picker.button.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosUISeasonPickerButtonAccessibility;
    id v3 = [(VideosUISeasonPickerButtonAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (BOOL)_accessibilityMultipleSeasonsAvailable
{
  BOOL v2 = [(VideosUISeasonPickerButtonAccessibility *)self safeArrayForKey:@"accessibilityHeaderTitles"];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

@end