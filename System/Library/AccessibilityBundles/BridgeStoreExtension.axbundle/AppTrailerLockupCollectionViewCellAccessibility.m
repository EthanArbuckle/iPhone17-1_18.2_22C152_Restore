@interface AppTrailerLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_axTaglineLabel;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AppTrailerLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.AppTrailerLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axTaglineLabel
{
  return (id)[(AppTrailerLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityTaglineLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v3 = [(AppTrailerLockupCollectionViewCellAccessibility *)self safeValueForKeyPath:@"accessibilityLockupView.accessibilityAdLabel"];
  v6 = [(AppTrailerLockupCollectionViewCellAccessibility *)self _axTaglineLabel];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(AppTrailerLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

@end