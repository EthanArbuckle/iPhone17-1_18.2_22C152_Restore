@interface UIContextMenuContainerViewAccessibility
@end

@implementation UIContextMenuContainerViewAccessibility

uint64_t __93___UIContextMenuContainerViewAccessibility__axApplyTranslation_forDetentIndex_panController___block_invoke(uint64_t a1)
{
  v8 = *(void **)(a1 + 32);
  CAPoint3DMakeWithCGPoint_0();
  double v9 = v1;
  double v10 = v2;
  double v11 = v3;
  CAPoint3DMakeWithCGPoint_0();
  return objc_msgSend(v8, "_updateViewPositionsWithTranslation:location:ended:withVelocity:", 1, 0, v9, v10, v11, v4, v5, v6);
}

void __93___UIContextMenuContainerViewAccessibility_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  double v3 = *(void **)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) nextFocusedItem];
  objc_msgSend(v3, "accessibilityScrollToVisibleWithChild:");

  objc_storeStrong(location, 0);
}

@end