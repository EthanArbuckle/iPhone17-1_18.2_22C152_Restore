@interface MediaControlsRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MediaControlsRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MediaControlsRoundButton" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsRoundButton", @"assetView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUAssetView", @"packageView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MediaControlsRoundButtonAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(MediaControlsRoundButtonAccessibility *)self safeValueForKey:@"assetView"];
  id v3 = [v2 safeUIViewForKey:@"packageView"];
  [v3 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoundButtonAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(MediaControlsRoundButtonAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF20];
}

@end