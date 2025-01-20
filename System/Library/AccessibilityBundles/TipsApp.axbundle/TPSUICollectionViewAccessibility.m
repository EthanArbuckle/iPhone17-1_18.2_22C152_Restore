@interface TPSUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsTipsCollectionView;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (id)_accessibilityFirstVisibleItem;
- (id)_accessibilityScrollStatus;
@end

@implementation TPSUICollectionViewAccessibility

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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"visibleCells", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_accessibilityScrollStatus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSBaseTipCollectionViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityFirstVisibleItem", "@", 0);
  [v3 validateClass:@"TPSPageControl" isKindOfClass:@"UIPageControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSTipsViewController", @"pageControl", "@", 0);
  [v3 validateClass:@"TPSTipsViewController"];
}

- (BOOL)_axIsTipsCollectionView
{
  v2 = [(TPSUICollectionViewAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x245667560](@"TPSTipsViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityFirstVisibleItem
{
  if ([(TPSUICollectionViewAccessibility *)self _axIsTipsCollectionView])
  {
    id v3 = [(TPSUICollectionViewAccessibility *)self safeArrayForKey:@"visibleCells"];
    v4 = [v3 firstObject];
    v5 = [v4 safeValueForKey:@"titleLabel"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TPSUICollectionViewAccessibility;
    v5 = [(TPSUICollectionViewAccessibility *)&v7 _accessibilityFirstVisibleItem];
  }

  return v5;
}

- (id)_accessibilityScrollStatus
{
  if ([(TPSUICollectionViewAccessibility *)self _axIsTipsCollectionView])
  {
    char v12 = 0;
    id v3 = [(TPSUICollectionViewAccessibility *)self safeValueForKey:@"visibleCells"];
    v4 = __UIAccessibilitySafeClass();

    if ([v4 count])
    {
      char v12 = 0;
      objc_opt_class();
      v5 = [(TPSUICollectionViewAccessibility *)self delegate];
      v6 = [v5 safeValueForKey:@"pageControl"];
      objc_super v7 = __UIAccessibilityCastAsClass();

      if (v7)
      {
        v8 = [v7 accessibilityValue];
        v9 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
        [v9 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21A70]];

        goto LABEL_7;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TPSUICollectionViewAccessibility;
  v9 = [(TPSUICollectionViewAccessibility *)&v11 _accessibilityScrollStatus];
LABEL_7:

  return v9;
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  if ([(TPSUICollectionViewAccessibility *)self _axIsTipsCollectionView]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TPSUICollectionViewAccessibility;
  return [(TPSUICollectionViewAccessibility *)&v4 accessibilityCollectionViewBehavesLikeUIViewAccessibility];
}

@end