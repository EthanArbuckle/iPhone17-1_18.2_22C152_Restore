@interface UITraitCollection
@end

@implementation UITraitCollection

uint64_t __81__UITraitCollection_ITK__itk_traitCollectionClampedToNonaccessibilityContentSize__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredContentSizeCategory:*MEMORY[0x263F83440]];
}

uint64_t __61__UITraitCollection_ITK__itk_traitCollectionWithContentSize___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredContentSizeCategory:*(void *)(a1 + 32)];
}

uint64_t __58__UITraitCollection_ITKUtilities__appearanceClassForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayScale:*(double *)(a1 + 32)];
}

@end