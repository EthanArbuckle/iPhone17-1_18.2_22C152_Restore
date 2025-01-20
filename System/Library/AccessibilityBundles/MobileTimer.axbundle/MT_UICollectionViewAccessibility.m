@interface MT_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
@end

@implementation MT_UICollectionViewAccessibility

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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"moveItemAtIndexPath: toIndexPath:", "v", "@", "@", 0);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MT_UICollectionViewAccessibility;
  [(MT_UICollectionViewAccessibility *)&v12 moveItemAtIndexPath:v6 toIndexPath:v7];
  v8 = [(MT_UICollectionViewAccessibility *)self accessibilityIdentifier];
  int v9 = [v8 isEqualToString:@"AXMTWorldClockCollectionView"];

  if (v9)
  {
    objc_opt_class();
    v10 = [(MT_UICollectionViewAccessibility *)self safeValueForKey:@"_dataSource"];
    v11 = __UIAccessibilityCastAsSafeCategory();

    [v11 movedItemAtIndexPath:v6 toIndexPath:v7];
  }
}

@end