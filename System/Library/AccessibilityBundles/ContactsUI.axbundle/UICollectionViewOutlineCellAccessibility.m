@interface UICollectionViewOutlineCellAccessibility
@end

@implementation UICollectionViewOutlineCellAccessibility

uint64_t __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a3 = 1;
  }
  return isKindOfClass & 1;
}

void __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke_298(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _accessibilityIndexPath];
  uint64_t v3 = [v2 itemIdentifierForIndexPath:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end