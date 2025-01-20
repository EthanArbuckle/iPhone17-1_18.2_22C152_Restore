@interface UIButtonBarButtonAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (UIButtonBarButtonAccessibility__Music__UIKit)initWithVisualProvider:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIButtonBarButtonAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIButtonBarButton" hasInstanceVariable:@"_visualProvider" withType:"_UIButtonBarButtonVisualProvider"];
  [v3 validateClass:@"_UIButtonBarButtonVisualProviderIOS" hasInstanceVariable:@"_titleButton" withType:"_UIModernBarButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIButtonBarButton", @"initWithVisualProvider:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIButtonBarButton", @"visualProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIButtonBarButtonVisualProvider", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImage", @"imageAsset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  v8.receiver = self;
  v8.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  id v3 = [(UIButtonBarButtonAccessibility__Music__UIKit *)&v8 accessibilityLabel];
  if (![v3 length])
  {
    v4 = [(UIButtonBarButtonAccessibility__Music__UIKit *)self safeValueForKeyPath:@"visualProvider.contentView.imageView.image.imageAsset"];
    v5 = [v4 safeStringForKey:@"assetName"];

    if ([v5 isEqualToString:@"Artist-Page-Context"])
    {
      uint64_t v6 = accessibilityMusicLocalizedString(@"more.button");

      id v3 = (void *)v6;
    }
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UIButtonBarButtonAccessibility__Music__UIKit *)self accessibilityLabel];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
    BOOL v4 = [(UIButtonBarButtonAccessibility__Music__UIKit *)&v6 isAccessibilityElement];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  [(UIButtonBarButtonAccessibility__Music__UIKit *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(UIButtonBarButtonAccessibility__Music__UIKit *)self safeValueForKey:@"_visualProvider"];
  BOOL v4 = [v3 safeValueForKey:@"_titleButton"];

  v5 = [v4 accessibilityLabel];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__UIButtonBarButtonAccessibility__Music__UIKit__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_26513CCC8;
  id v8 = v5;
  id v6 = v5;
  [v4 _setIsAccessibilityElementBlock:v7];
}

- (UIButtonBarButtonAccessibility__Music__UIKit)initWithVisualProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  id v3 = [(UIButtonBarButtonAccessibility__Music__UIKit *)&v5 initWithVisualProvider:a3];
  [(UIButtonBarButtonAccessibility__Music__UIKit *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end