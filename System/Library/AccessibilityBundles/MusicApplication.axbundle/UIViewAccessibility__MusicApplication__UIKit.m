@interface UIViewAccessibility__MusicApplication__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axViewContainsSwitch;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UIViewAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.LibraryRecommendationBannerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityCloseButton", "@", 0);
}

- (id)_axViewContainsSwitch
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(UIViewAccessibility__MusicApplication__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXPublicPlaylistSwitchContainerView"];

  if (v4)
  {
    [(UIViewAccessibility__MusicApplication__UIKit *)self subviews];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          MEMORY[0x2456584B0](@"UISwitch");
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_13:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UIViewAccessibility__MusicApplication__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXPublicPlaylistSwitchContainerView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
  return [(UIViewAccessibility__MusicApplication__UIKit *)&v6 isAccessibilityElement];
}

- (id)accessibilityValue
{
  id v3 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];

  if (v3)
  {
    char v4 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];
    id v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    id v5 = [(UIViewAccessibility__MusicApplication__UIKit *)&v7 accessibilityValue];
  }

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];

  if (v3)
  {
    char v4 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    [(UIViewAccessibility__MusicApplication__UIKit *)&v11 accessibilityActivationPoint];
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];

  if (v3)
  {
    char v4 = [(UIViewAccessibility__MusicApplication__UIKit *)self _axViewContainsSwitch];
    unint64_t v5 = [v4 accessibilityTraits];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    return [(UIViewAccessibility__MusicApplication__UIKit *)&v7 accessibilityTraits];
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  char v4 = [(UIViewAccessibility__MusicApplication__UIKit *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"AXRecommendationBannerView"];

  if (v5)
  {
    double v6 = [(UIViewAccessibility__MusicApplication__UIKit *)self _accessibilityFindViewAncestor:&__block_literal_global_11 startWithSelf:1];
    objc_super v7 = [v6 _accessibilityViewController];

    double v8 = [v7 safeValueForKey:@"accessibilityCloseButton"];
    double v9 = accessibilityMusicLocalizedString(@"close.recommendation.button");
    [v8 setAccessibilityLabel:v9];

    if (v8) {
      [v3 axSafelyAddObject:v8];
    }
  }

  return v3;
}

@end