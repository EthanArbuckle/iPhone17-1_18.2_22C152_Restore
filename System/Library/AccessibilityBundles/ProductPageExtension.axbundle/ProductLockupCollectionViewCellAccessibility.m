@interface ProductLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (ProductLockupCollectionViewCellAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityProductLockupCollectionViewCellElements;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAccessibilityProductLockupCollectionViewCellElements:(id)a3;
- (void)layoutSubviews;
- (void)resetProductLockupCellAccessibilityElements;
@end

@implementation ProductLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.ProductLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductLockupCollectionViewCellElements
{
}

- (void)_setAccessibilityProductLockupCollectionViewCellElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityArtworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityDeveloperLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityTaglineLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityOfferButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityOfferSubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityDownloadProgressLabel", "@", 0);
  [v3 validateClass:@"ProductPageExtension.ProductLockupCollectionViewCell" hasSwiftField:@"expandedOfferTitleLabel" withSwiftType:"Optional<DynamicTypeLabel>"];
  [v3 validateClass:@"ProductPageExtension.ProductLockupCollectionViewCell" hasSwiftField:@"expandedOfferSubtitleLabel" withSwiftType:"Optional<DynamicTypeLabel>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityShareButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductLockupCollectionViewCell", @"accessibilityVideoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.VideoView", @"accessibilityPlayButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.VideoView", @"accessibilityPlayerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.VideoView", @"accessibilityIsPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.VideoView", @"accessibilityShouldBePlaying", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [(ProductLockupCollectionViewCellAccessibility *)self _accessibilityProductLockupCollectionViewCellElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityVideoView"];
    v5 = [v4 safeValueForKey:@"accessibilityPlayerViewController"];
    v6 = [v5 safeUIViewForKey:@"view"];

    int v7 = [v4 safeBoolForKey:@"accessibilityIsPlaying"];
    int v8 = [v4 safeBoolForKey:@"accessibilityShouldBePlaying"];
    if ([v6 _accessibilityViewIsVisible] && v7 && v8) {
      [v3 axSafelyAddObject:v6];
    }
    v9 = [v4 safeValueForKey:@"accessibilityPlayButton"];
    if ([v9 _accessibilityViewIsVisible]) {
      [v3 axSafelyAddObject:v9];
    }
    objc_opt_class();
    v10 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
    v11 = __UIAccessibilityCastAsClass();

    [v11 setAccessibilityRespondsToUserInteraction:1];
    uint64_t v12 = [v11 accessibilityTraits];
    [v11 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v12];
    v13 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
    v14 = [v11 accessibilityLabel];
    [v13 setAccessibilityValue:v14];

    [v3 axSafelyAddObject:v13];
    [v3 axSafelyAddObject:v11];
    objc_opt_class();
    v15 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityDeveloperLabel"];
    v16 = __UIAccessibilityCastAsClass();

    v37 = v13;
    [v16 setAccessibilityRespondsToUserInteraction:1];
    v36 = v16;
    [v3 axSafelyAddObject:v16];
    objc_opt_class();
    v17 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityTaglineLabel"];
    v18 = __UIAccessibilityCastAsClass();

    v32 = v11;
    v33 = v9;
    v34 = v6;
    v35 = v4;
    [v18 setAccessibilityRespondsToUserInteraction:0];
    [v18 setAccessibilityTraits:*MEMORY[0x263F1CF48]];
    v31 = v18;
    [v3 axSafelyAddObject:v18];
    v19 = [(ProductLockupCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityBannerView"];
    [v19 setAccessibilityRespondsToUserInteraction:1];
    v30 = v19;
    [v3 axSafelyAddObject:v19];
    v20 = [(ProductLockupCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilitySecondaryBannerView"];
    [v20 setAccessibilityRespondsToUserInteraction:1];
    [v3 axSafelyAddObject:v20];
    v21 = [(ProductLockupCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"expandedOfferTitleLabel"];
    [v21 setAccessibilityRespondsToUserInteraction:1];
    [v3 axSafelyAddObject:v21];
    v22 = [(ProductLockupCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"expandedOfferSubtitleLabel"];
    [v22 setAccessibilityRespondsToUserInteraction:1];
    [v3 axSafelyAddObject:v22];
    v23 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityOfferButton"];
    [v3 axSafelyAddObject:v23];
    objc_opt_class();
    v24 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityOfferSubtitleLabel"];
    v25 = __UIAccessibilityCastAsClass();

    [v25 setAccessibilityRespondsToUserInteraction:1];
    [v3 axSafelyAddObject:v25];
    v26 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityDownloadProgressLabel"];
    [v26 setAccessibilityRespondsToUserInteraction:1];
    [v26 setAccessibilityTraits:*MEMORY[0x263F1CF68]];
    [v3 axSafelyAddObject:v26];
    v27 = [(ProductLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityShareButton"];
    v28 = accessibilityAppStoreLocalizedString(@"share.button");
    [v27 setAccessibilityLabel:v28];

    [v3 axSafelyAddObject:v27];
    [(ProductLockupCollectionViewCellAccessibility *)self _setAccessibilityProductLockupCollectionViewCellElements:v3];
  }

  return v3;
}

- (ProductLockupCollectionViewCellAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  id v3 = -[ProductLockupCollectionViewCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ProductLockupCollectionViewCellAccessibility *)v3 _setAccessibilityProductLockupCollectionViewCellElements:0];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  [(ProductLockupCollectionViewCellAccessibility *)&v3 layoutSubviews];
  [(ProductLockupCollectionViewCellAccessibility *)self _setAccessibilityProductLockupCollectionViewCellElements:0];
}

- (void)resetProductLockupCellAccessibilityElements
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  [(ProductLockupCollectionViewCellAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v3 = [(ProductLockupCollectionViewCellAccessibility *)self accessibilityHeaderElements];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAccessibilityTraits:v7];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end