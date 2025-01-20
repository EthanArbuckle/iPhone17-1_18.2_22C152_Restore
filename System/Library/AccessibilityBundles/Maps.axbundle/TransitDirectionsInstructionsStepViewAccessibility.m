@interface TransitDirectionsInstructionsStepViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TransitDirectionsInstructionsStepViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransitDirectionsInstructionsStepView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TransitDirectionsInstructionsStepView", @"_detailButtonTapped:", "v", "@", 0);
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_primaryLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_secondaryLabel" withType:"MKMultiPartLabel"];
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_primaryAccessoryLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_secondaryAccessoryLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_tertiaryLabel" withType:"MKMultiPartLabel"];
  [v3 validateClass:@"TransitDirectionsInstructionsStepView" hasInstanceVariable:@"_platformArtworkImageView" withType:"MKArtworkImageView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TransitDirectionsInstructionsStepViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)accessibilityLabel
{
  return (id)[(TransitDirectionsInstructionsStepViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_primaryLabel, _secondaryLabel, _primaryAccessoryLabel, _secondaryAccessoryLabel, _tertiaryLabel, _platformArtworkImageView"];
}

@end