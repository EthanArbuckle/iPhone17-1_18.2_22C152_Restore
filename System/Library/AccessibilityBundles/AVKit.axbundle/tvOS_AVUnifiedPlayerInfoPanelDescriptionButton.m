@interface tvOS_AVUnifiedPlayerInfoPanelDescriptionButton
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation tvOS_AVUnifiedPlayerInfoPanelDescriptionButton

+ (id)safeCategoryTargetClassName
{
  return @"_AVUnifiedPlayerInfoPanelDescriptionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_AVUnifiedPlayerInfoPanelDescriptionButton", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_AVUnifiedPlayerInfoPanelDescriptionButton", @"imageView", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(tvOS_AVUnifiedPlayerInfoPanelDescriptionButton *)self safeValueForKey:@"imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];

  v6 = [(tvOS_AVUnifiedPlayerInfoPanelDescriptionButton *)self safeValueForKey:@"label"];
  v7 = [v6 accessibilityLabel];

  if (MEMORY[0x24563F480](v5)
    && ([v5 safeValueForKey:@"_imageAsset"],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 safeStringForKey:@"assetName"],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:@"play.fill"],
        v9,
        v8,
        v10))
  {
    v11 = accessibilityLocalizedString(@"play.button");
    __AXStringForVariables();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v7;
  }

  return v12;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end