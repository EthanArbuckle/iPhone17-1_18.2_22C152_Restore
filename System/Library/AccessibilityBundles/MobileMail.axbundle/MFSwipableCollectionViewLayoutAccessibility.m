@interface MFSwipableCollectionViewLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
@end

@implementation MFSwipableCollectionViewLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFSwipableCollectionViewLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFSwipableCollectionViewLayout" isKindOfClass:@"UICollectionViewLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewLayout", @"initialLayoutAttributesForAppearingItemAtIndexPath:", "@", 0);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFSwipableCollectionViewLayoutAccessibility;
  id v3 = [(MFSwipableCollectionViewLayoutAccessibility *)&v5 initialLayoutAttributesForAppearingItemAtIndexPath:a3];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [v3 setAlpha:1.0];
  }

  return v3;
}

@end