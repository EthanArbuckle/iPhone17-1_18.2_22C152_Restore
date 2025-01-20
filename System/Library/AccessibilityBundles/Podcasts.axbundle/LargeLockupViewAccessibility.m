@interface LargeLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation LargeLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.LargeLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupView", @"accessibilityOrdinalLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupView", @"accessibilityPrimaryTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupView", @"accessibilitySecondaryTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupView", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupView", @"accessibilityArtworkContainer", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LargeLockupViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(LargeLockupViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)[(LargeLockupViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityOrdinalLabel, accessibilityPrimaryTitleLabel, accessibilitySecondaryTitleLabel, accessibilitySubtitleLabel"];
}

- (id)accessibilityUserInputLabels
{
  objc_super v3 = [(LargeLockupViewAccessibility *)self safeValueForKey:@"accessibilityPrimaryTitleLabel"];
  v4 = [v3 accessibilityLabel];

  if (!v4)
  {
    objc_opt_class();
    v5 = [(LargeLockupViewAccessibility *)self safeValueForKey:@"accessibilitySecondaryTitleLabel"];
    v6 = __UIAccessibilityCastAsClass();

    v4 = __UIAXStringForVariables();
  }
  v7 = MEMORY[0x24565B6D0](v4);

  return v7;
}

@end