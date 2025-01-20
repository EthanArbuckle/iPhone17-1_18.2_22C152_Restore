@interface CAMDescriptionOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation CAMDescriptionOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDescriptionOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_descriptionTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_infoTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_infoLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_primaryVibrancyEffectView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_acknowledgmentButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_detailButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDescriptionOverlayView", @"_isVisible", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  if ([(CAMDescriptionOverlayViewAccessibility *)self safeBoolForKey:@"_isVisible"]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  return [(CAMDescriptionOverlayViewAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  return (id)[(CAMDescriptionOverlayViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _descriptionTitleLabel, _descriptionLabel, _infoTitleLabel, _infoLabel"];
}

- (CGRect)accessibilityFrame
{
  v2 = [(CAMDescriptionOverlayViewAccessibility *)self safeValueForKey:@"_primaryVibrancyEffectView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityViewIsModal
{
  if ([(CAMDescriptionOverlayViewAccessibility *)self safeBoolForKey:@"_isVisible"]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  return [(CAMDescriptionOverlayViewAccessibility *)&v4 accessibilityViewIsModal];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v12.receiver = self;
  v12.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  double v3 = [(CAMDescriptionOverlayViewAccessibility *)&v12 _accessibilitySupplementaryFooterViews];
  objc_super v4 = (void *)[v3 mutableCopy];

  if (!v4) {
    objc_super v4 = objc_opt_new();
  }
  double v5 = [(CAMDescriptionOverlayViewAccessibility *)self safeValueForKey:@"_detailButton"];
  double v6 = __UIAccessibilitySafeClass();
  int v7 = [v6 _accessibilityViewIsVisible];

  if (v7) {
    [v4 axSafelyAddObject:v5];
  }
  double v8 = [(CAMDescriptionOverlayViewAccessibility *)self safeValueForKey:@"_acknowledgmentButton"];
  double v9 = __UIAccessibilitySafeClass();
  int v10 = [v9 _accessibilityViewIsVisible];

  if (v10) {
    [v4 axSafelyAddObject:v8];
  }

  return v4;
}

@end