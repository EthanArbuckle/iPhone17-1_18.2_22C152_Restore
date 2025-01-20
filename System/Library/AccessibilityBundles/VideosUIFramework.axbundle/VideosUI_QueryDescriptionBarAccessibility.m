@interface VideosUI_QueryDescriptionBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_QueryDescriptionBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.QueryDescriptionBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.QueryDescriptionBar" hasSwiftField:@"queryDescriptionBannerText" withSwiftType:"Optional<PlatformView>"];
  [v3 validateClass:@"VideosUI.QueryDescriptionBar" hasSwiftField:@"additionalInformationView" withSwiftType:"Optional<PlatformView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.QueryDescriptionBar", @"singlePressWithGesture:", "B", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(VideosUI_QueryDescriptionBarAccessibility *)self safeSwiftValueForKey:@"queryDescriptionBannerText"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(VideosUI_QueryDescriptionBarAccessibility *)self safeSwiftValueForKey:@"additionalInformationView"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v4 accessibilityLabel];
  v10 = [v6 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

@end