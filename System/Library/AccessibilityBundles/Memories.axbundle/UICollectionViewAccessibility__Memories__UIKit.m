@interface UICollectionViewAccessibility__Memories__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (double)_accessibilityScrollWidthDistance;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElements;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation UICollectionViewAccessibility__Memories__UIKit

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
  [v3 validateClass:@"MiroEditorFlowLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroEditorFlowLayout", @"_sizeForItemAtIndexPath:", "{CGSize=dd}", "@", 0);
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  id v3 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return [(UICollectionViewAccessibility__Memories__UIKit *)&v6 accessibilityCollectionViewBehavesLikeUIViewAccessibility];
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  id v3 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return [(UICollectionViewAccessibility__Memories__UIKit *)&v6 isAccessibilityOpaqueElementProvider];
}

- (double)_accessibilityScrollWidthDistance
{
  id v3 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v4)
  {
    v5 = self;
    objc_super v6 = [(UICollectionViewAccessibility__Memories__UIKit *)v5 collectionViewLayout];
    MEMORY[0x2455E2920](@"MiroEditorFlowLayout");
    if (objc_opt_isKindOfClass())
    {
      [(UICollectionViewAccessibility__Memories__UIKit *)v5 contentSize];
      double v8 = v7;
      uint64_t v10 = v9;
      uint64_t v34 = 0;
      v35 = (double *)&v34;
      uint64_t v36 = 0x3010000000;
      v37 = &unk_2401EF453;
      v11 = (double *)MEMORY[0x263F001B0];
      long long v38 = *MEMORY[0x263F001B0];
      uint64_t v30 = 0;
      v31 = (double *)&v30;
      uint64_t v32 = 0x2020000000;
      unint64_t v33 = 0xBFF0000000000000;
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __83__UICollectionViewAccessibility__Memories__UIKit__accessibilityScrollWidthDistance__block_invoke;
      v23 = &unk_2650A3700;
      v26 = &v34;
      id v12 = v6;
      id v24 = v12;
      v13 = v5;
      v25 = v13;
      v27 = &v30;
      double v28 = v8;
      uint64_t v29 = v10;
      AXPerformSafeBlock();
      double v14 = v35[4];
      if (v14 != *v11) {
        goto LABEL_6;
      }
      if (v35[5] == v11[1])
      {
        BOOL v15 = 1;
      }
      else
      {
LABEL_6:
        double v16 = v31[3];
        double v8 = v14 + v16;
        BOOL v15 = v16 < 0.0;
      }

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v34, 8);
      if (!v15)
      {

        return v8;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  [(UICollectionViewAccessibility__Memories__UIKit *)&v19 _accessibilityScrollWidthDistance];
  return v17;
}

- (int64_t)accessibilityElementCount
{
  id v3 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return [(UICollectionViewAccessibility__Memories__UIKit *)&v6 accessibilityElementCount];
}

- (id)accessibilityElements
{
  id v3 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v4)
  {
    v5 = self;
    objc_super v6 = [(UICollectionViewAccessibility__Memories__UIKit *)v5 collectionViewLayout];
    MEMORY[0x2455E2920](@"MiroEditorFlowLayout");
    if (objc_opt_isKindOfClass())
    {
      char v14 = 0;
      objc_opt_class();
      double v7 = [v6 safeValueForKey:@"snappedIndexPath"];
      double v8 = __UIAccessibilityCastAsClass();

      uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v10 = [(UICollectionViewAccessibility__Memories__UIKit *)v5 cellForItemAtIndexPath:v8];
      v11 = objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);

      goto LABEL_6;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  v11 = [(UICollectionViewAccessibility__Memories__UIKit *)&v13 accessibilityElements];
LABEL_6:

  return v11;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v5 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  int v6 = [v5 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v6)
  {
    double v7 = self;
    double v8 = [(UICollectionViewAccessibility__Memories__UIKit *)v7 collectionViewLayout];
    MEMORY[0x2455E2920](@"MiroEditorFlowLayout");
    if (objc_opt_isKindOfClass())
    {
      char v14 = 0;
      objc_opt_class();
      uint64_t v9 = [v8 safeValueForKey:@"snappedIndexPath"];
      uint64_t v10 = __UIAccessibilityCastAsClass();

      v11 = [(UICollectionViewAccessibility__Memories__UIKit *)v7 cellForItemAtIndexPath:v10];

      goto LABEL_6;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  v11 = [(UICollectionViewAccessibility__Memories__UIKit *)&v13 accessibilityElementAtIndex:a3];
LABEL_6:

  return v11;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  v5 = [(UICollectionViewAccessibility__Memories__UIKit *)self accessibilityIdentification];
  char v6 = [v5 isEqualToString:@"AccessibilityMiroUICollectionView"];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
    id v7 = [(UICollectionViewAccessibility__Memories__UIKit *)&v9 indexOfAccessibilityElement:v4];
  }

  return (int64_t)v7;
}

@end