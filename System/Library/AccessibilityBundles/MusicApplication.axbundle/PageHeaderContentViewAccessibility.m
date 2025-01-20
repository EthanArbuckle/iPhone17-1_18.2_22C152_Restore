@interface PageHeaderContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PageHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PageHeaderContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PageHeaderContentView", @"accessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PageHeaderContentView", @"supertitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PageHeaderContentView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PageHeaderContentView", @"subtitle", "@", 0);
  [v3 validateClass:@"MusicApplication.JSListenNowTabViewController"];
  [v3 validateClass:@"MusicApplication.PageHeaderPlayButton"];
}

- (id)accessibilityLabel
{
  return (id)[(PageHeaderContentViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"supertitle, title, subtitle"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PageHeaderContentViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(PageHeaderContentViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(PageHeaderContentViewAccessibility *)self safeUIViewForKey:@"accessoryView"];
  [v4 setIsAccessibilityElement:1];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  MEMORY[0x2456584B0](@"MusicApplication.PageHeaderPlayButton");
  if (objc_opt_isKindOfClass())
  {
    [v4 _setAccessibilityLabelBlock:&__block_literal_global_13];
    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    [v3 addObject:v4];
    goto LABEL_8;
  }
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_300];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_3;
  v7[3] = &__block_descriptor_40_e36__CGRect__CGPoint_dd__CGSize_dd__8__0lu32l8;
  v7[4] = v4;
  [v4 _setAccessibilityFrameBlock:v7];
  v5 = [v4 _accessibilityFindAncestor:&__block_literal_global_308_0 startWithSelf:1];
  if (v5) {
    [MEMORY[0x263F8C6D0] accessibilityAttributesForAccountButtonInAccessoryView:v4];
  }

  if (v4) {
    goto LABEL_7;
  }
LABEL_8:

  return v3;
}

id __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityMusicLocalizedString(@"play.button");
}

id __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2()
{
  return accessibilityMusicLocalizedString(@"account");
}

double __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v9) accessibilityFrame];
        v23.origin.double x = v10;
        v23.origin.CGFloat y = v11;
        v23.size.CGFloat width = v12;
        v23.size.CGFloat height = v13;
        v21.origin.double x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        CGRect v22 = CGRectUnion(v21, v23);
        double x = v22.origin.x;
        CGFloat y = v22.origin.y;
        CGFloat width = v22.size.width;
        CGFloat height = v22.size.height;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return x;
}

uint64_t __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicApplication.JSListenNowTabViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end