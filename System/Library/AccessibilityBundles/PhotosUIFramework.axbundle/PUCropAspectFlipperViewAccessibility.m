@interface PUCropAspectFlipperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setAspectRatioOrientation:(int64_t)a3;
@end

@implementation PUCropAspectFlipperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCropAspectFlipperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUCropAspectFlipperView" hasInstanceVariable:@"_horizontalAspectButton" withType:"UIButton"];
  [v3 validateClass:@"PUCropAspectFlipperView" hasInstanceVariable:@"_verticalAspectButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectFlipperView", @"setAspectRatioOrientation:", "v", "q", 0);
  [v3 validateClass:@"PUCropToolController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspectViewController", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityPULocalizedString(@"aspect.ratio.flipper");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)PUCropAspectFlipperViewAccessibility;
  [(PUCropAspectFlipperViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PUCropAspectFlipperViewAccessibility *)self safeValueForKey:@"_horizontalAspectButton"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 _setAccessibilityLabelBlock:&__block_literal_global_5];
  objc_opt_class();
  v5 = [(PUCropAspectFlipperViewAccessibility *)self safeValueForKey:@"_verticalAspectButton"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 _setAccessibilityLabelBlock:&__block_literal_global_330];
}

id __82__PUCropAspectFlipperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(@"horizontal.aspect.button");
}

id __82__PUCropAspectFlipperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityPULocalizedString(@"vertical.aspect.button");
}

- (void)setAspectRatioOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUCropAspectFlipperViewAccessibility;
  [(PUCropAspectFlipperViewAccessibility *)&v7 setAspectRatioOrientation:a3];
  v4 = [(PUCropAspectFlipperViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_338 startWithSelf:1];
  v5 = [v4 _accessibilityViewController];
  v6 = [v5 safeValueForKey:@"cropAspectViewController"];
  [(PUCropAspectFlipperViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  [v6 _accessibilityLoadAccessibilityInformation];
}

uint64_t __66__PUCropAspectFlipperViewAccessibility_setAspectRatioOrientation___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Pucroptoolcont_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end