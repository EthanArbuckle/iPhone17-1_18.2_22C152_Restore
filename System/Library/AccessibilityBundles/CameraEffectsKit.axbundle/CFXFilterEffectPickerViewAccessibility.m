@interface CFXFilterEffectPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axFunCamFilterCarousel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXFunCamFilterCarousel:(id)a3;
- (void)layoutSubviews;
- (void)subviewsDidLoad;
@end

@implementation CFXFilterEffectPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXFilterEffectPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"isDisplayingExpandedLayout", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"cachedEffectCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"indexPathForCenterOfCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterEffectPickerView", @"compactSelectedTitleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectPickerView", @"effectIndexForCellIndex:", "Q", "Q", 0);
  [v3 validateClass:@"CFXFilterEffectPickerView" isKindOfClass:@"CFXEffectPickerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectPickerViewController", @"effectPickerView:effectAtIndex:", "@", "@", "q", 0);
}

- (id)_axFunCamFilterCarousel
{
}

- (void)_setAXFunCamFilterCarousel:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  [(CFXFilterEffectPickerViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXFilterEffectPickerViewAccessibility *)self _axFunCamFilterCarousel];
  if (!v3)
  {
    id v3 = [[AX_FunCamFilterCarousel alloc] initWithAccessibilityContainer:self];
    [(CFXFilterEffectPickerViewAccessibility *)self _setAXFunCamFilterCarousel:v3];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(CFXFilterEffectPickerViewAccessibility *)self _accessibilitySetAdditionalElements:v4];

  v5 = [(CFXFilterEffectPickerViewAccessibility *)self safeValueForKey:@"compactSelectedTitleView"];
  [v5 setIsAccessibilityElement:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  [(CFXFilterEffectPickerViewAccessibility *)&v3 layoutSubviews];
  [(CFXFilterEffectPickerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)subviewsDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  [(CFXFilterEffectPickerViewAccessibility *)&v3 subviewsDidLoad];
  [(CFXFilterEffectPickerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end