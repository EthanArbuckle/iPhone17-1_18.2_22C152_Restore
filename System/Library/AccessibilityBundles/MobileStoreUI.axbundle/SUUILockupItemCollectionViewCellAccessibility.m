@interface SUUILockupItemCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestReverseOrder;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation SUUILockupItemCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUILockupItemCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SUUILockupItemCollectionViewCellAccessibility *)self safeValueForKey:@"_layout"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (int64_t)accessibilityElementCount
{
  v2 = [(SUUILockupItemCollectionViewCellAccessibility *)self accessibilityElements];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v4 = [(SUUILockupItemCollectionViewCellAccessibility *)self accessibilityElements];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  v5 = [(SUUILockupItemCollectionViewCellAccessibility *)self accessibilityElements];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)accessibilityElements
{
  int64_t v3 = (void *)MEMORY[0x263F81490];
  id v4 = [(SUUILockupItemCollectionViewCellAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    [(SUUILockupItemCollectionViewCellAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v5 setAccessibilityDelegate:self];
    [v4 addObject:v5];
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUILockupItemCollectionViewCellAccessibility;
  int64_t v6 = [(SUUILockupItemCollectionViewCellAccessibility *)&v11 accessibilityElements];
  id v7 = v4;
  v8 = v7;
  v9 = v7;
  if (v6)
  {
    v9 = [v7 arrayByAddingObjectsFromArray:v6];
  }

  return v9;
}

@end