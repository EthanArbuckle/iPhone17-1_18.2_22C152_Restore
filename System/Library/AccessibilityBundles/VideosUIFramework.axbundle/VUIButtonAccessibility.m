@interface VUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axContainedInMediaShowcasingMetadataView;
- (BOOL)_axIsFavoriteBarButton;
- (BOOL)_axIsOpenInAppleSportsBarButton;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_axAssetName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_axButtonType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIButton" hasProperty:@"textContentView" withType:"@"];
  [v3 validateClass:@"VUILabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"VUIMediaTagsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIButton", @"_buttonTapped:", "v", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
  [v3 validateClass:@"VUIButton" hasProperty:@"buttonType" withType:"Q"];
}

- (BOOL)_axContainedInMediaShowcasingMetadataView
{
  v2 = [(VUIButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __67__VUIButtonAccessibility__axContainedInMediaShowcasingMetadataView__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  uint64_t v2 = [v1 axContainsString:@"MediaShowcasingButtonsView"];

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)VUIButtonAccessibility;
  [(VUIButtonAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  BOOL v3 = [(VUIButtonAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_318];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
  [v4 setAccessibilityRespondsToUserInteraction:0];
}

uint64_t __68__VUIButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  MEMORY[0x245669780](@"VideosUI.SeeAllButton", a2);
  BOOL result = 1;
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(VUIButtonAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245669780](@"VideosUI.CollectionHeaderView")];

    if (v3) {
      return 0;
    }
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIButtonAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __47__VUIButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buttonTapped:*(void *)(a1 + 32)];
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(VUIButtonAccessibility *)self _accessibilityGetBlockForAttribute:1];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
LABEL_3:
    v6 = (__CFString *)v5;
    goto LABEL_19;
  }
  if ([(VUIButtonAccessibility *)self _axIsFavoriteBarButton])
  {
    v6 = &stru_26F829E60;
  }
  else
  {
    if ([(VUIButtonAccessibility *)self _axIsOpenInAppleSportsBarButton])
    {
      uint64_t v5 = accessibilityLocalizedString(@"sports.openIn");
      goto LABEL_3;
    }
    v6 = [(VUIButtonAccessibility *)self _atvaccessibilityITMLAccessibilityContent];
    if (![(__CFString *)v6 length])
    {
      char v19 = 0;
      objc_opt_class();
      v7 = [(VUIButtonAccessibility *)self safeValueForKey:@"textContentView"];
      v8 = __UIAccessibilityCastAsClass();

      v9 = [v8 text];

      if ([v9 length])
      {
        v10 = [(VUIButtonAccessibility *)self accessibilityIdentifier];
        int v11 = [v10 isEqualToString:@"BrandLinkButton"];

        if (v11)
        {
          v12 = NSString;
          v13 = accessibilityLocalizedString(@"brand.link.button");
          objc_msgSend(v12, "stringWithFormat:", v13, v9);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          AXAttributedStringForBetterPronuciation();
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v9;
      }
      else
      {
        v14 = [(VUIButtonAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_344];
        v15 = [v14 accessibilityLabel];

        if ([v15 length])
        {
          v16 = v15;
        }
        else
        {
          v18.receiver = self;
          v18.super_class = (Class)VUIButtonAccessibility;
          v16 = [(VUIButtonAccessibility *)&v18 accessibilityLabel];
        }
        v6 = v16;
      }
    }
  }
LABEL_19:

  return v6;
}

uint64_t __44__VUIButtonAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  if ([(VUIButtonAccessibility *)self _axIsFavoriteBarButton])
  {
    uint64_t v3 = [(VUIButtonAccessibility *)self _axAssetName];
    if ([v3 containsString:@"fill"]) {
      v4 = @"sports.favorites.unfavorited";
    }
    else {
      v4 = @"sports.favorites.isFavorited";
    }
    uint64_t v5 = accessibilityLocalizedString(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  v18.receiver = self;
  v18.super_class = (Class)VUIButtonAccessibility;
  [(VUIButtonAccessibility *)&v18 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  int v11 = [(VUIButtonAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_360 startWithSelf:0];

  if (v11)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGFloat v12 = CGRectGetWidth(v19) * -0.75;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat v13 = CGRectGetHeight(v20) * -0.75;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectInset(v21, v12, v13);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

uint64_t __44__VUIButtonAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"_UINavigationBarContentView");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    uint64_t v3 = [v5 axContainsString:@"MediaShowcasingToolbar"];
  }
  return v3;
}

- (unint64_t)_axButtonType
{
  return [(VUIButtonAccessibility *)self safeIntegerForKey:@"buttonType"];
}

- (id)_axAssetName
{
  id v2 = [(VUIButtonAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_368];
  uint64_t v3 = [v2 safeValueForKeyPath:@"image._imageAsset"];
  v4 = [v3 safeStringForKey:@"assetName"];

  return v4;
}

uint64_t __38__VUIButtonAccessibility__axAssetName__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsFavoriteBarButton
{
  if ([(VUIButtonAccessibility *)self _axButtonType] != 6) {
    return 0;
  }
  uint64_t v3 = [(VUIButtonAccessibility *)self _axAssetName];
  char v4 = [v3 containsString:@"star.circle"];

  return v4;
}

- (BOOL)_axIsOpenInAppleSportsBarButton
{
  if ([(VUIButtonAccessibility *)self _axButtonType] != 6) {
    return 0;
  }
  uint64_t v3 = [(VUIButtonAccessibility *)self _axAssetName];
  char v4 = [v3 containsString:@"sportscourt"];

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIButtonAccessibility;
  [(VUIButtonAccessibility *)&v3 layoutSubviews];
  [(VUIButtonAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end