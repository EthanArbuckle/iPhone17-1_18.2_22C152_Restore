@interface FEFocusEnvironmentInheritedFocusMovementStyle
@end

@implementation FEFocusEnvironmentInheritedFocusMovementStyle

void ___FEFocusEnvironmentInheritedFocusMovementStyle_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v6 _focusPreferredMovementStyle];
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
}

@end