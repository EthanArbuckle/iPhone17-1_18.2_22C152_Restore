@interface UIViewController
@end

@implementation UIViewController

void __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48))
  {
    v2 = BSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:*(void *)(a1 + 32)];
      v5 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:*(void *)(a1 + 40)];
      int v6 = 138412546;
      v7 = v4;
      __int16 v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_1A2B0C000, v2, OS_LOG_TYPE_ERROR, "transition completion not called adding %@ to %@", (uint8_t *)&v6, 0x16u);
    }
  }
  if (*(unsigned char *)(a1 + 49)) {
    objc_msgSend(*(id *)(a1 + 40), "bs_endAppearanceTransitionForChildViewController:", *(void *)(a1 + 32));
  }
  return [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
}

void __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 isFailed] ^ 1);
}

uint64_t __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48))
  {
    v2 = BSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:*(void *)(a1 + 32)];
      int v6 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:*(void *)(a1 + 40)];
      int v7 = 138412546;
      __int16 v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_1A2B0C000, v2, OS_LOG_TYPE_ERROR, "transition completion not called removing %@ from %@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v3 = [*(id *)(a1 + 32) view];
  [v3 removeFromSuperview];

  if (*(unsigned char *)(a1 + 49)) {
    objc_msgSend(*(id *)(a1 + 40), "bs_endAppearanceTransitionForChildViewController:", *(void *)(a1 + 32));
  }
  return [*(id *)(a1 + 32) removeFromParentViewController];
}

void __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 isFailed] ^ 1);
}

uint64_t __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

@end