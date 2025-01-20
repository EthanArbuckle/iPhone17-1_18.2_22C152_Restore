@interface MapsUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
@end

@implementation MapsUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SteppingPageViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"accessibilityCollectionViewBehavesLikeUIViewAccessibility", "B", 0);
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  id v3 = [(MapsUICollectionViewAccessibility *)self delegate];
  MEMORY[0x245653010](@"SteppingPageViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsUICollectionViewAccessibility;
  return [(MapsUICollectionViewAccessibility *)&v6 accessibilityCollectionViewBehavesLikeUIViewAccessibility];
}

@end