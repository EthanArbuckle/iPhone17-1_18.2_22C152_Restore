@interface UIView
@end

@implementation UIView

uint64_t __64__UIView_GKAdditionsAdditional___gkRecursivelyApplyBlock_depth___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _gkRecursivelyApplyBlock:*(void *)(a1 + 32) depth:*(void *)(a1 + 40)];
}

void __69__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForKey_depth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  NSSelectorFromString(*(NSString **)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    v5 = [v6 valueForKey:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) appendFormat:@"%*s<%@ %p>: %@\n", a3, "", objc_opt_class(), v6, v5];
  }
}

uint64_t __78__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForValue_forKey_depth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  NSSelectorFromString(*(NSString **)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    v5 = [v7 valueForKey:*(void *)(a1 + 32)];
    if ([v5 isEqual:*(void *)(a1 + 40)]) {
      [*(id *)(a1 + 48) appendFormat:@"%*s<%@ %p>: %@\n", a3, "", objc_opt_class(), v7, v5];
    }
  }

  return MEMORY[0x1F41817F8]();
}

@end