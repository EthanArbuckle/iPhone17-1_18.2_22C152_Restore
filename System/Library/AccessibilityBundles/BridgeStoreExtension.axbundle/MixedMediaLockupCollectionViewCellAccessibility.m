@interface MixedMediaLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockupView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MixedMediaLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.MixedMediaLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.MixedMediaLockupCollectionViewCell", @"accessibilityLockupView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.MixedMediaLockupCollectionViewCell", @"accessibilityTaglineLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.MixedMediaLockupCollectionViewCell", @"accessibilityVideoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.MixedMediaLockupCollectionViewCell", @"accessibilityMediaView", "@", 0);
}

- (id)_axLockupView
{
  return (id)[(MixedMediaLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MixedMediaLockupCollectionViewCellAccessibility *)self _axLockupView];
  char v3 = [v2 isAccessibilityElement];

  return v3;
}

- (id)accessibilityLabel
{
  return (id)[(MixedMediaLockupCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTaglineLabel, accessibilityLockupView"];
}

- (unint64_t)accessibilityTraits
{
  v2 = [(MixedMediaLockupCollectionViewCellAccessibility *)self _axLockupView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(MixedMediaLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityVideoView"];
  if ([v4 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v4];
  }
  v5 = [(MixedMediaLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityMediaView"];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }
  v6 = [(MixedMediaLockupCollectionViewCellAccessibility *)self _axLockupView];
  v7 = [v6 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v7];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MixedMediaLockupCollectionViewCellAccessibility *)self _axLockupView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end