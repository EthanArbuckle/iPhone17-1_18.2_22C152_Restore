@interface VUILibraryEpisodeListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLabelAggregateElement;
- (id)accessibilityElements;
- (void)_accessibilitySetLabelAggregateElement:(id)a3;
@end

@implementation VUILibraryEpisodeListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUILibraryEpisodeListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeListCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeListCell", @"releaseDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeListCell", @"durationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeListCell", @"downloadButton", "@", 0);
}

- (id)_accessibilityLabelAggregateElement
{
}

- (void)_accessibilitySetLabelAggregateElement:(id)a3
{
}

- (id)accessibilityElements
{
  id v3 = [(VUILibraryEpisodeListCellAccessibility *)self _accessibilityLabelAggregateElement];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = [(VUILibraryEpisodeListCellAccessibility *)self safeValueForKey:@"titleLabel"];
    v6 = [(VUILibraryEpisodeListCellAccessibility *)self safeValueForKey:@"releaseDateLabel"];
    v7 = [(VUILibraryEpisodeListCellAccessibility *)self safeValueForKey:@"durationLabel"];
    v8 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 3, v5, v6, v7);

    v9 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v8];
    [v9 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    [(VUILibraryEpisodeListCellAccessibility *)self _accessibilitySetLabelAggregateElement:v9];
  }
  v10 = (void *)MEMORY[0x263EFF8C0];
  v11 = [(VUILibraryEpisodeListCellAccessibility *)self _accessibilityLabelAggregateElement];
  v12 = [(VUILibraryEpisodeListCellAccessibility *)self safeValueForKey:@"downloadButton"];
  v13 = objc_msgSend(v10, "axArrayByIgnoringNilElementsWithCount:", 2, v11, v12);

  return v13;
}

@end