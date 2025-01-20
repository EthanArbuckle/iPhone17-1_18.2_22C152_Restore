@interface VUIBaseCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityStackingView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIBaseCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIBaseCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)accessibilityLabel
{
  MEMORY[0x245669780](@"VideosUI.FlowcaseViewCell", a2);
  if (objc_opt_isKindOfClass())
  {
    v3 = [(VUIBaseCollectionViewCellAccessibility *)self _accessibilityStackingView];
    v4 = [v3 accessibilityLabel];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIBaseCollectionViewCellAccessibility;
    v4 = [(VUIBaseCollectionViewCellAccessibility *)&v6 accessibilityLabel];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIBaseCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIBaseCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityStackingView
{
  uint64_t v3 = MEMORY[0x245669780](@"VideosUI.VerticalStackView", a2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__VUIBaseCollectionViewCellAccessibility__accessibilityStackingView__block_invoke;
  v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v6[4] = v3;
  v4 = [(VUIBaseCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendant:v6];

  return v4;
}

uint64_t __68__VUIBaseCollectionViewCellAccessibility__accessibilityStackingView__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end