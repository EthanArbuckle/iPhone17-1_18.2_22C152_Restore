@interface NTKUpNextCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityStartInteractionAnimated:(BOOL)a3;
- (CGRect)_accessibilityFrameForSorting;
- (id)_accessibilityFirstOpaqueElement;
- (id)_accessibilityLastOpaqueElement;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation NTKUpNextCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKUpNextCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKDigitalFaceView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKDigitalFaceView", @"viewMode", "q", 0);
  [v3 validateClass:@"NTKUpNextFaceView" isKindOfClass:@"NTKDigitalFaceView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKUpNextFaceView", @"_switchViewModeForCurrentMode:animated:", "v", "q", "B", 0);
  [v3 validateClass:@"NTKUpNextFaceView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"didUpdateFocusInContext:withAnimationCoordinator:", "v", "@", "@", 0);
  [v3 validateClass:@"NTKUpNextBaseCell"];
  [v3 validateClass:@"NTKUpNextBaseCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"NTKUpNextCollectionView" isKindOfClass:@"UICollectionView"];
  [v3 validateClass:@"NTKUpNextFaceView" hasInstanceVariable:@"_layout" withType:"NTKUpNextCollectionViewFlowLayout"];
  [v3 validateClass:@"NTKUpNextCollectionViewFlowLayout" hasInstanceVariable:@"_indexPathToSnapTo" withType:"NSIndexPath"];
}

- (CGRect)_accessibilityFrameForSorting
{
  id v2 = [(NTKUpNextCollectionViewAccessibility *)self accessibilityFrame];
  v6.n128_f64[0] = v6.n128_f64[0] + v6.n128_f64[0] * -0.25;
  v7.n128_u64[0] = v3.n128_u64[0];
  v8.n128_u64[0] = v4.n128_u64[0];
  v9.n128_u64[0] = v5.n128_u64[0];

  _UIRectCenteredYInRect(v2, v3, v4, v5, v6, v7, v8, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_accessibilityFirstOpaqueElement
{
  [(NTKUpNextCollectionViewAccessibility *)self _accessibilityStartInteractionAnimated:0];
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewAccessibility;
  __n128 v3 = [(NTKUpNextCollectionViewAccessibility *)&v5 _accessibilityFirstOpaqueElement];

  return v3;
}

- (id)_accessibilityLastOpaqueElement
{
  [(NTKUpNextCollectionViewAccessibility *)self _accessibilityStartInteractionAnimated:0];
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewAccessibility;
  __n128 v3 = [(NTKUpNextCollectionViewAccessibility *)&v5 _accessibilityLastOpaqueElement];

  return v3;
}

- (BOOL)_accessibilityStartInteractionAnimated:(BOOL)a3
{
  if (_accessibilityStartInteractionAnimated__onceToken != -1) {
    dispatch_once(&_accessibilityStartInteractionAnimated__onceToken, &__block_literal_global);
  }
  __n128 v4 = [(NTKUpNextCollectionViewAccessibility *)self _accessibilityViewAncestorIsKindOf:_accessibilityStartInteractionAnimated__FaceViewClass];
  uint64_t v8 = 0;
  __n128 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (![v4 safeUnsignedIntegerForKey:@"viewMode"])
  {
    id v7 = v4;
    AXPerformSafeBlock();
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __79__NTKUpNextCollectionViewAccessibility__accessibilityStartInteractionAnimated___block_invoke(id a1)
{
  _accessibilityStartInteractionAnimated__FaceViewClass = AXSafeClassFromString();
}

id __79__NTKUpNextCollectionViewAccessibility__accessibilityStartInteractionAnimated___block_invoke_2(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _switchViewModeForCurrentMode:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NTKUpNextCollectionViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    uint64_t v8 = [v6 nextFocusedItem];
    AXSafeClassFromString();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_opt_class();
      uint64_t v10 = [v6 nextFocusedItem];
      char v11 = __UIAccessibilityCastAsClass();

      char v19 = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __89__NTKUpNextCollectionViewAccessibility_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
      v15[3] = &unk_205E0;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = v11;
      v18 = self;
      id v12 = v11;
      id v13 = v16;
      [v7 addCoordinatedAnimations:v15 completion:0];
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextCollectionViewAccessibility;
  [(NTKUpNextCollectionViewAccessibility *)&v14 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
}

void __89__NTKUpNextCollectionViewAccessibility_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    && *(void *)(a1 + 40)
    && ([*(id *)(a1 + 48) _accessibilityStartInteractionAnimated:1] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) scrollToItemAtIndexPath:v2 atScrollPosition:1 animated:1];
  }
}

@end