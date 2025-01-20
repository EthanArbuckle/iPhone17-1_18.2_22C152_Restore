@interface PUAdjustmentsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAdjustmentsSlider;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXAdjustmentsSlider:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PUAdjustmentsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAdjustmentsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAdjustmentsSlider
{
}

- (void)_setAXAdjustmentsSlider:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"viewDidLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"slider", "@", 0);
  [v3 validateClass:@"PUAdjustmentsViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsDataSource", @"infoForItemAtIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"selectedIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"layoutDirection", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"setSelectedIndexPath:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"_updateSliderForControlAtIndexPath:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentInfo", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentInfo", @"localizedSectionName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditBaseAdjustmentCell", @"isEnabled", "B", 0);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsViewControllerAccessibility;
  [(PUAdjustmentsViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(PUAdjustmentsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PUAdjustmentsViewControllerAccessibility;
  [(PUAdjustmentsViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PUAdjustmentsViewControllerAccessibility *)self _axAdjustmentsSlider];
  v4 = [(PUAdjustmentsViewControllerAccessibility *)self safeValueForKey:@"slider"];
  if (!v3)
  {
    objc_super v3 = [[AXPUAdjustmentSlider alloc] initWithAccessibilityContainer:self];
    [(PUAdjustmentsViewControllerAccessibility *)self _setAXAdjustmentsSlider:v3];
  }
  objc_opt_class();
  v5 = [(PUAdjustmentsViewControllerAccessibility *)self safeValueForKey:@"view"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  [v6 setAccessibilityElements:v7];
}

@end