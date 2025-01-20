@interface PSSegmentableSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
@end

@implementation PSSegmentableSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSegmentableSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSSegmentableSlider", @"numberOfTicks", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSSegmentableSlider", @"offsetBetweenTicksForNumberOfTicks:", "f", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSSegmentableSlider", @"locksToSegment", "B", 0);
  [v3 validateClass:@"PSSegmentableSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"minimumValue", "f", 0);
  [v3 validateClass:@"PSSegmentableSlider" hasInstanceVariable:@"_segmented" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"value", "f", 0);
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PSSegmentableSliderAccessibility *)self safeValueForKey:@"numberOfTicks"];
  uint64_t v6 = [v5 integerValue];

  v7 = [(PSSegmentableSliderAccessibility *)self safeValueForKey:@"minimumValue"];
  [v7 floatValue];
  float v9 = v8;

  uint64_t v22 = 0;
  v23 = (float *)&v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  AXPerformSafeBlock();
  float v10 = v23[6];
  _Block_object_dispose(&v22, 8);
  v11 = [(PSSegmentableSliderAccessibility *)self safeValueForKey:@"value"];
  [v11 floatValue];
  float v13 = v12;

  if ([(PSSegmentableSliderAccessibility *)self safeBoolForKey:@"_segmented"]
    && [(PSSegmentableSliderAccessibility *)self safeBoolForKey:@"locksToSegment"])
  {
    unint64_t v14 = llroundf((float)(v13 - v9) / v10);
    if (v3) {
      uint64_t v15 = v14 + 1;
    }
    else {
      uint64_t v15 = v14 - 1;
    }
    if (v6 - 1 < v15) {
      uint64_t v15 = v6 - 1;
    }
    return (float)(v9 + (float)(v10 * (float)(v15 & ~(v15 >> 63))));
  }
  else
  {
    v17 = [(PSSegmentableSliderAccessibility *)self safeValueForKey:@"maximumValue"];
    [v17 floatValue];
    float v19 = v18;

    float v20 = (float)(v19 - v9) / 10.0;
    if (!v3) {
      float v20 = -v20;
    }
    return (float)(v13 + v20);
  }
}

uint64_t __65__PSSegmentableSliderAccessibility__accessibilityIncreaseAmount___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) offsetBetweenTicksForNumberOfTicks:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

@end