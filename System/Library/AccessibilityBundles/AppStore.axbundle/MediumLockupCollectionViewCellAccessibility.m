@interface MediumLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityScrollParentForComparingByXAxis;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation MediumLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.MediumLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MediumLockupCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MediumLockupCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MediumLockupCollectionViewCell", @"accessibilityOfferButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MediumLockupCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)MediumLockupCollectionViewCellAccessibility;
  v4 = [(MediumLockupCollectionViewCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(MediumLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityOfferButton"];
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  uint64_t v3 = objc_opt_class();

  return (id)[(MediumLockupCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  uint64_t v3 = [(MediumLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = __UIAXStringForVariables();
  v6 = MEMORY[0x245641140](v5);

  return v6;
}

@end