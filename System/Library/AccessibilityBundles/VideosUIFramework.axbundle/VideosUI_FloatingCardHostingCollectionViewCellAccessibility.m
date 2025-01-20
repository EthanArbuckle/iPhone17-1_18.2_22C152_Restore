@interface VideosUI_FloatingCardHostingCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axNode;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_FloatingCardHostingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.FloatingCardHostingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_axNode
{
  return (id)[(VideosUI_FloatingCardHostingCollectionViewCellAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_21];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = MEMORY[0x245669780](@"VideosUI.TimedMetadataViewController", a2);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__VideosUI_FloatingCardHostingCollectionViewCellAccessibility_accessibilityTraits__block_invoke;
  v10[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v10[4] = v3;
  v4 = [(VideosUI_FloatingCardHostingCollectionViewCellAccessibility *)self _accessibilityFindViewAncestor:v10 startWithSelf:0];

  v5 = [(VideosUI_FloatingCardHostingCollectionViewCellAccessibility *)self _axNode];
  uint64_t v6 = [v5 accessibilityTraits];
  uint64_t v7 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 | v6;

  return v8;
}

- (id)accessibilityLabel
{
  v2 = [(VideosUI_FloatingCardHostingCollectionViewCellAccessibility *)self _axNode];
  uint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

@end