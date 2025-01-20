@interface TPSTipCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityProvidesScannerGroupElements;
- (TPSTipCollectionViewCellAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityScannerGroupElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setTip:(id)a3 withCellAppearance:(id)a4;
@end

@implementation TPSTipCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSTipCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TPSTipCollectionViewCell" isKindOfClass:@"TPSBaseTipCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSBaseTipCollectionViewCell", @"tip", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSTip", @"fullContentAssets", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSAssets", @"alt", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSBaseTipCollectionViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSBaseTipCollectionViewCell", @"heroAssetView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSImageAssetView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSVideoAssetView", @"videoPath", "@", 0);
}

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"heroAssetView"];
  v4 = [v3 safeUIViewForKey:@"imageView"];

  if (v4)
  {
    v10 = v4;
    v11[0] = @"GroupElements";
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    v11[1] = @"GroupTraits";
    v12[0] = v5;
    v12[1] = &unk_26F814DA8;
    v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    v13[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSTipCollectionViewCellAccessibility;
    v7 = [(TPSTipCollectionViewCellAccessibility *)&v9 _accessibilityScannerGroupElements];
  }

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  [(TPSTipCollectionViewCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"_contentScrollView"];
  [v3 setIsAccessibilityScrollAncestor:0];

  objc_opt_class();
  v4 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 accessibilityTraits];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v6];
  v7 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"tip"];
  v8 = __UIAccessibilitySafeClass();

  objc_super v9 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"heroAssetView"];
  v10 = [v9 safeUIViewForKey:@"imageView"];

  v11 = [(TPSTipCollectionViewCellAccessibility *)self safeValueForKey:@"heroAssetView"];
  v12 = [v11 safeValueForKey:@"videoPath"];

  [v10 setIsAccessibilityElement:1];
  v13 = [v8 safeValueForKey:@"fullContentAssets"];
  v14 = [v13 safeStringForKey:@"alt"];

  if (v12)
  {
    [v10 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
    v15 = accessibilityLocalizedString(@"video.role");
    v16 = __UIAXStringForVariables();
    objc_msgSend(v10, "setAccessibilityLabel:", v16, v14, @"__AXStringForVariablesSentinel");
  }
  else
  {
    [v10 _accessibilitySetRoleDescription:0];
    [v10 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
    [v10 setAccessibilityLabel:v14];
    [v10 setAccessibilityHint:0];
  }
}

- (TPSTipCollectionViewCellAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  id v3 = -[TPSTipCollectionViewCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TPSTipCollectionViewCellAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)setTip:(id)a3 withCellAppearance:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  [(TPSTipCollectionViewCellAccessibility *)&v5 setTip:a3 withCellAppearance:a4];
  [(TPSTipCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end