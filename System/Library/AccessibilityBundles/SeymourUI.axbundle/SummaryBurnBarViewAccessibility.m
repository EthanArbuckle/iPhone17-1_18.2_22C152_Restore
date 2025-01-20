@interface SummaryBurnBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (int64_t)_positionForPersonalScore:(float)a3 low:(float)a4 lowMiddle:(float)a5 highMiddle:(float)a6 high:(float)a7;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateBurnBarAccessibility:(id)a3 personalScore:(float)a4 low:(float)a5 lowMiddle:(float)a6 highMiddle:(float)a7 high:(float)a8;
@end

@implementation SummaryBurnBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SummaryBurnBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8[2] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)SummaryBurnBarViewAccessibility;
  [(SummaryBurnBarViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  v3 = accessibilityLocalizedString(@"burn.bar.title");
  v4 = accessibilityLocalizedString(@"no.data");
  v8[0] = v3;
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = AXLabelForElements();
  [(SummaryBurnBarViewAccessibility *)self setAccessibilityLabel:v6];
}

- (void)updateBurnBarAccessibility:(id)a3 personalScore:(float)a4 low:(float)a5 lowMiddle:(float)a6 highMiddle:(float)a7 high:(float)a8
{
  v32.receiver = self;
  v32.super_class = (Class)SummaryBurnBarViewAccessibility;
  id v14 = a3;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  *(float *)&double v17 = a6;
  *(float *)&double v18 = a7;
  *(float *)&double v19 = a8;
  [(SummaryBurnBarViewAccessibility *)&v32 updateBurnBarAccessibility:v14 personalScore:v15 low:v16 lowMiddle:v17 highMiddle:v18 high:v19];
  v20 = accessibilityLocalizedString(@"burn.bar.title");
  *(float *)&double v21 = a4;
  *(float *)&double v22 = a5;
  *(float *)&double v23 = a6;
  *(float *)&double v24 = a7;
  *(float *)&double v25 = a8;
  v26 = _accessibilityStringForBurnBarPosition([(SummaryBurnBarViewAccessibility *)self _positionForPersonalScore:v21 low:v22 lowMiddle:v23 highMiddle:v24 high:v25], 0);
  v27 = NSString;
  v28 = accessibilityLocalizedString(@"burn.bar.community.scores");
  v29 = objc_msgSend(v27, "stringWithFormat:", v28, (int)a5, (int)a8, (int)a6, (int)a7, v32.receiver, v32.super_class);

  v30 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v20, v14, v26, v29);

  v31 = AXLabelForElements();
  [(SummaryBurnBarViewAccessibility *)self setAccessibilityLabel:v31];
}

- (int64_t)_positionForPersonalScore:(float)a3 low:(float)a4 lowMiddle:(float)a5 highMiddle:(float)a6 high:(float)a7
{
  if (a3 < a4) {
    return 0;
  }
  if (a3 < a5) {
    return 1;
  }
  if (a3 < a6) {
    return 2;
  }
  if (a3 >= a7) {
    return 4 * (a3 >= a7);
  }
  return 3;
}

@end