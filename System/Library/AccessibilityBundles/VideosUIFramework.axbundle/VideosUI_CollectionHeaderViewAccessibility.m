@interface VideosUI_CollectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axHeaderTextContentElement;
- (id)_axHeaderTextContentElementStorage;
- (id)accessibilityElements;
- (void)_axSetHeaderTextContentElementStorage:(id)a3;
@end

@implementation VideosUI_CollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CollectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CollectionHeaderView", @"accessibilityTitleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CollectionHeaderView", @"accessibilitySubtitleView", "@", 0);
  [v3 validateClass:@"VideosUI.CollectionHeaderView" hasSwiftField:@"titleView" withSwiftType:"Optional<PlatformView>"];
  [v3 validateClass:@"VUIVisualEffectLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIVisualEffectLabel", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CollectionHeaderView", @"accessibilityButtonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.CollectionHeaderView", @"accessibilityImageView", "@", 0);
}

- (id)_axHeaderTextContentElementStorage
{
}

- (void)_axSetHeaderTextContentElementStorage:(id)a3
{
}

- (id)_axHeaderTextContentElement
{
  id v3 = [(VideosUI_CollectionHeaderViewAccessibility *)self _axHeaderTextContentElementStorage];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke;
    v11[3] = &unk_2651663B0;
    objc_copyWeak(&v12, &location);
    [v3 _setAccessibilityFrameBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_2;
    v9[3] = &unk_2651663D8;
    objc_copyWeak(&v10, &location);
    [v3 _setAccessibilityLabelBlock:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_3;
    v7[3] = &unk_265166400;
    objc_copyWeak(&v8, &location);
    [v3 _setAccessibilityActivateBlock:v7];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_5;
    v5[3] = &unk_265166428;
    objc_copyWeak(&v6, &location);
    [v3 _setAccessibilityTraitsBlock:v5];
    [(VideosUI_CollectionHeaderViewAccessibility *)self _axSetHeaderTextContentElementStorage:v3];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)accessibilityElements
{
  if (AXDoesRequestingClientDeserveAutomation())
  {
    id v3 = [(VideosUI_CollectionHeaderViewAccessibility *)self safeArrayForKey:@"subviews"];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFF8C0];
    v5 = [(VideosUI_CollectionHeaderViewAccessibility *)self _axHeaderTextContentElement];
    id v6 = [(VideosUI_CollectionHeaderViewAccessibility *)self safeUIViewForKey:@"accessibilityButtonView"];
    id v3 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  }

  return v3;
}

@end