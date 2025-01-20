@interface VUIOfferViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIOfferViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIOfferView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIOfferView" hasProperty:@"titleLabel" withType:"@"];
  [v3 validateClass:@"VUIOfferView" hasProperty:@"subtitleLabel" withType:"@"];
  [v3 validateClass:@"VUIOfferView" hasProperty:@"textLabel" withType:"@"];
  [v3 validateClass:@"VUIOfferView" hasProperty:@"versionsButton" withType:"@"];
  [v3 validateClass:@"VUIOfferView" hasProperty:@"imageView" withType:"@"];
  [v3 validateClass:@"VUIOfferView" hasProperty:@"appIconView" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(VUIOfferViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"imageView, appIconView, titleLabel, textLabel, subtitleLabel, versionsButton"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIOfferViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIOfferViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v16.receiver = self;
  v16.super_class = (Class)VUIOfferViewAccessibility;
  v4 = [(VUIOfferViewAccessibility *)&v16 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(VUIOfferViewAccessibility *)self safeValueForKey:@"versionsButton"];
  if (v5)
  {
    objc_initWeak(&location, v5);
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"mls.versions");
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __55__VUIOfferViewAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_2651660B8;
    objc_copyWeak(&v14, &location);
    v8 = (void *)[v6 initWithName:v7 actionHandler:&v10];

    objc_msgSend(v3, "axSafelyAddObject:", v8, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __55__VUIOfferViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

@end