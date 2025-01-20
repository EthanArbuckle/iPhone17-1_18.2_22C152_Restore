@interface VUIProductLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakableLabelForBadgeName:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupBadgeViews;
- (void)didMoveToWindow;
@end

@implementation VUIProductLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIProductLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIProductLockupView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIProductLockupView", @"mediaBadgeTagsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIProductLockupView", @"badgeResources", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIProductBadgeResource", @"name", "@", 0);
}

- (id)_accessibilitySpeakableLabelForBadgeName:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (_accessibilitySpeakableLabelForBadgeName__onceToken == -1)
  {
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_accessibilitySpeakableLabelForBadgeName__onceToken, &__block_literal_global_15);
    if (!v4) {
      goto LABEL_6;
    }
  }
  v5 = [(id)_accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = v5;
    v7 = accessibilityLocalizedString(v5);

    goto LABEL_7;
  }
LABEL_6:
  v7 = 0;
LABEL_7:

  return v7;
}

void __78__VUIProductLockupViewAccessibility__accessibilitySpeakableLabelForBadgeName___block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = @"cc_mask";
  v2[1] = @"itunes-extras-badge";
  v3[0] = @"lockup.attribute.CC";
  v3[1] = @"lockup.attribute.iTunes.extras";
  v2[2] = @"hd_mask";
  v2[3] = @"hdr_mask";
  v3[2] = @"lockup.attribute.HD";
  v3[3] = @"lockup.attribute.HDR";
  v2[4] = @"4k_mask";
  v2[5] = @"dolbyvision_mask";
  v3[4] = @"lockup.attribute.4k";
  v3[5] = @"lockup.attribute.dolby.vision";
  v2[6] = @"dolby-atmos";
  v3[6] = @"lockup.attribute.dolby.atmos";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)_accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap;
  _accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap = v0;
}

- (void)_accessibilityMarkupBadgeViews
{
  v15 = [(VUIProductLockupViewAccessibility *)self safeUIViewForKey:@"mediaBadgeTagsView"];
  id v3 = [v15 subviews];
  objc_opt_class();
  v4 = [(VUIProductLockupViewAccessibility *)self safeValueForKey:@"badgeResources"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 axFilterObjectsUsingBlock:&__block_literal_global_334];

  uint64_t v7 = [v6 count];
  if (v7 == [v3 count] && objc_msgSend(v3, "count"))
  {
    unint64_t v8 = 0;
    uint64_t v9 = ~*MEMORY[0x263F1CF00];
    do
    {
      objc_opt_class();
      v10 = [v3 objectAtIndexedSubscript:v8];
      v11 = __UIAccessibilityCastAsClass();

      v12 = [v6 objectAtIndexedSubscript:v8];
      v13 = [v12 safeValueForKey:@"name"];
      v14 = [(VUIProductLockupViewAccessibility *)self _accessibilitySpeakableLabelForBadgeName:v13];

      if (v14)
      {
        [v11 setIsAccessibilityElement:1];
        [v11 setAccessibilityLabel:v14];
        objc_msgSend(v11, "setAccessibilityTraits:", objc_msgSend(v11, "accessibilityTraits") & v9);
      }

      ++v8;
    }
    while (v8 < [v3 count]);
  }
}

BOOL __67__VUIProductLockupViewAccessibility__accessibilityMarkupBadgeViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __UIAccessibilitySafeClass();
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VUIProductLockupViewAccessibility;
  [(VUIProductLockupViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VUIProductLockupViewAccessibility *)self _accessibilityMarkupBadgeViews];
}

- (void)didMoveToWindow
{
  [(VUIProductLockupViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v3.receiver = self;
  v3.super_class = (Class)VUIProductLockupViewAccessibility;
  [(VUIProductLockupViewAccessibility *)&v3 didMoveToWindow];
}

@end