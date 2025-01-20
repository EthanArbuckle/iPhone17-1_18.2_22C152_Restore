@interface UICollectionViewOrthogonalScrollViewAccessibility
@end

@implementation UICollectionViewOrthogonalScrollViewAccessibility

id __131___UICollectionViewOrthogonalScrollViewAccessibility__ShareSheet__UIKit_accessibilityApplyScrollContent_sendScrollStatus_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 57);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)_UICollectionViewOrthogonalScrollViewAccessibility__ShareSheet__UIKit;
  return objc_msgSendSuper2(&v4, sel_accessibilityApplyScrollContent_sendScrollStatus_animated_, v1, v2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __131___UICollectionViewOrthogonalScrollViewAccessibility__ShareSheet__UIKit_accessibilityApplyScrollContent_sendScrollStatus_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:", *(unsigned __int8 *)(a1 + 68), *(unsigned int *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end