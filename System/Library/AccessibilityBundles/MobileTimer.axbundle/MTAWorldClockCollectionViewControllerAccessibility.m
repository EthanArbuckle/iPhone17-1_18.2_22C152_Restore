@interface MTAWorldClockCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)nameForWorldClockCell:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModifyCollectionView;
- (void)_axModifyReorderingGesture;
- (void)_installReorderingGestureIfNecessary;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)movedItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MTAWorldClockCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTAWorldClockCollectionCell"];
  [v3 validateClass:@"MTAWorldClockView"];
  [v3 validateClass:@"WorldClockCity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewController", @"collectionView", "@", 0);
  [v3 validateClass:@"MTAWorldClockCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockCollectionCell", @"worldClockView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"city", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WorldClockCity", @"name", "@", 0);
  [v3 validateClass:@"UICollectionViewController" hasInstanceVariable:@"_reorderingGesture" withType:"UILongPressGestureRecognizer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewController", @"_installReorderingGestureIfNecessary", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  [(MTAWorldClockCollectionViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTAWorldClockCollectionViewControllerAccessibility *)self _axModifyReorderingGesture];
  [(MTAWorldClockCollectionViewControllerAccessibility *)self _axModifyCollectionView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  [(MTAWorldClockCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  [(MTAWorldClockCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)nameForWorldClockCell:(id)a3
{
  id v3 = a3;
  if (v3 && (MEMORY[0x245657200](@"MTAWorldClockCollectionCell"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 safeValueForKey:@"worldClockView"];
    v5 = [v4 safeValueForKey:@"city"];
    objc_opt_class();
    v6 = [v5 safeValueForKey:@"name"];
    v7 = __UIAccessibilityCastAsClass();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  [(MTAWorldClockCollectionViewControllerAccessibility *)&v28 collectionView:v8 moveItemAtIndexPath:v9 toIndexPath:v10];
  uint64_t v11 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v10, "section"));
  if (v11 >= 2)
  {
    uint64_t v12 = v11;
    objc_opt_class();
    v13 = [v8 cellForItemAtIndexPath:v10];
    v14 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v15 = [v8 cellForItemAtIndexPath:v9];
    v16 = __UIAccessibilityCastAsClass();

    if (!v14 || !v16) {
      goto LABEL_10;
    }
    v17 = [(MTAWorldClockCollectionViewControllerAccessibility *)self nameForWorldClockCell:v14];
    if ([v10 row] == v12 - 1)
    {
      objc_opt_class();
      v18 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") - 1, objc_msgSend(v10, "section"));
      v19 = [v8 cellForItemAtIndexPath:v18];
      v20 = __UIAccessibilityCastAsClass();

      v21 = @"clock.moved.after";
      if (!v20) {
        goto LABEL_9;
      }
    }
    else
    {
      objc_opt_class();
      v22 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, objc_msgSend(v10, "section"));
      v23 = [v8 cellForItemAtIndexPath:v22];
      v20 = __UIAccessibilityCastAsClass();

      v21 = @"clock.moved.before";
      if (!v20)
      {
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    v24 = [(MTAWorldClockCollectionViewControllerAccessibility *)self nameForWorldClockCell:v20];
    v25 = NSString;
    v26 = accessibilityLocalizedString(v21);
    v27 = objc_msgSend(v25, "stringWithFormat:", v26, v17, v24);
    UIAccessibilitySpeak();

    goto LABEL_9;
  }
LABEL_11:
}

- (void)movedItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 row];
  uint64_t v9 = [v7 row];
  id v10 = @"clock.moving.before";
  if (v8 < v9) {
    id v10 = @"clock.moving.after";
  }
  uint64_t v11 = v10;
  uint64_t v12 = [(MTAWorldClockCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  objc_opt_class();
  v13 = [v12 cellForItemAtIndexPath:v7];
  v14 = __UIAccessibilityCastAsClass();

  if (v14)
  {
    v15 = NSString;
    v16 = accessibilityLocalizedString(v11);
    v17 = [(MTAWorldClockCollectionViewControllerAccessibility *)self nameForWorldClockCell:v14];
    v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
    UIAccessibilitySpeak();
  }
}

- (void)_installReorderingGestureIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  [(MTAWorldClockCollectionViewControllerAccessibility *)&v3 _installReorderingGestureIfNecessary];
  [(MTAWorldClockCollectionViewControllerAccessibility *)self _axModifyReorderingGesture];
}

- (void)_axModifyReorderingGesture
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    objc_super v3 = [(MTAWorldClockCollectionViewControllerAccessibility *)self safeValueForKey:@"_reorderingGesture"];
    v4 = __UIAccessibilityCastAsClass();

    [v4 setMinimumPressDuration:0.1];
  }
}

- (void)_axModifyCollectionView
{
  id v3 = [(MTAWorldClockCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v2 = accessibilityLocalizedString(@"world.clocks");
  [v3 setAccessibilityLabel:v2];

  [v3 setAccessibilityContainerType:4];
  [v3 setIsAccessibilityElement:0];
  [v3 setAccessibilityIdentifier:@"AXMTWorldClockCollectionView"];
}

@end