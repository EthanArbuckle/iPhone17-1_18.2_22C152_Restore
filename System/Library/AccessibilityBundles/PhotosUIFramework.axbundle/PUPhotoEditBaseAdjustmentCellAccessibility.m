@interface PUPhotoEditBaseAdjustmentCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isEligibleForFocusInteraction;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PUPhotoEditBaseAdjustmentCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditBaseAdjustmentCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"maxValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"minValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"value", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"identityValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"isEnabled", "B", 0);
  [v3 validateClass:@"PUPhotoEditBaseAdjustmentCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isEligibleForFocusInteraction", "B", 0);
}

- (id)accessibilityLabel
{
  [(PUPhotoEditBaseAdjustmentCellAccessibility *)self safeCGFloatForKey:@"maxValue"];
  double v4 = v3;
  [(PUPhotoEditBaseAdjustmentCellAccessibility *)self safeCGFloatForKey:@"minValue"];
  double v6 = v5;
  [(PUPhotoEditBaseAdjustmentCellAccessibility *)self safeCGFloatForKey:@"value"];
  double v8 = v7;
  [(PUPhotoEditBaseAdjustmentCellAccessibility *)self safeCGFloatForKey:@"identityValue"];
  v10.n128_f64[0] = AXScaledSliderValues(v8, v6, v4, v9);
  v10.n128_f32[0] = v10.n128_f64[0];

  return (id)MEMORY[0x270F09240](0, v10);
}

- (id)accessibilityValue
{
  if ([(PUPhotoEditBaseAdjustmentCellAccessibility *)self safeBoolForKey:@"isEnabled"])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityPULocalizedString(@"adjustments.tool.off");
  }

  return v2;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ([(PUPhotoEditBaseAdjustmentCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PUPhotoEditBaseAdjustmentCellAccessibility;
  return [(PUPhotoEditBaseAdjustmentCellAccessibility *)&v4 _isEligibleForFocusInteraction];
}

@end