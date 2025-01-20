@interface UIViewController(BaseBoardUI)
+ (id)bs_nextViewControllerForView:()BaseBoardUI;
- (BOOL)bs_endAppearanceTransition;
- (BOOL)bs_isAppearingOrAppeared;
- (BOOL)bs_isDisappearingOrDisappeared;
- (id)bs_presentationContextDefiningViewController;
- (id)bs_presentedViewControllerIncludingAncestors;
- (id)bs_topPresentedViewController;
- (uint64_t)bs_addChildViewController:()BaseBoardUI;
- (uint64_t)bs_addChildViewController:()BaseBoardUI animated:transitionBlock:;
- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:;
- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:animated:transitionBlock:;
- (uint64_t)bs_beginAppearanceTransition:()BaseBoardUI animated:;
- (uint64_t)bs_beginAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:animated:;
- (uint64_t)bs_endAppearanceTransition:()BaseBoardUI;
- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI;
- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:;
- (uint64_t)bs_removeChildViewController:()BaseBoardUI;
- (uint64_t)bs_removeChildViewController:()BaseBoardUI animated:transitionBlock:;
- (void)bs_traitCollectionDidChange:()BaseBoardUI forManagedTraitEnvironment:;
@end

@implementation UIViewController(BaseBoardUI)

- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:
{
  id v6 = a3;
  objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v6, a4, 0);
  uint64_t v7 = objc_msgSend(a1, "bs_endAppearanceTransitionForChildViewController:", v6);

  return v7;
}

- (uint64_t)bs_endAppearanceTransition:()BaseBoardUI
{
  objc_msgSend(a1, "bs_beginAppearanceTransition:animated:", a3, 0);

  return objc_msgSend(a1, "bs_endAppearanceTransition");
}

- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1 == v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"self != childController"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v14 = v10;
      __int16 v15 = 2114;
      v16 = v12;
      __int16 v17 = 2048;
      id v18 = a1;
      __int16 v19 = 2114;
      v20 = @"UIViewController+BaseBoardUI.m";
      __int16 v21 = 1024;
      int v22 = 83;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B10160);
  }
  if (([a1 shouldAutomaticallyForwardAppearanceMethods] & 1) == 0
    && ([v5 parentViewController],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == a1))
  {
    uint64_t v7 = objc_msgSend(v5, "bs_endAppearanceTransition");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)bs_beginAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:animated:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a1 == v9)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"self != childController"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      id v18 = v14;
      __int16 v19 = 2114;
      v20 = v16;
      __int16 v21 = 2048;
      id v22 = a1;
      __int16 v23 = 2114;
      v24 = @"UIViewController+BaseBoardUI.m";
      __int16 v25 = 1024;
      int v26 = 68;
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B10378);
  }
  if (([a1 shouldAutomaticallyForwardAppearanceMethods] & 1) != 0
    || ([v9 parentViewController],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        v10,
        v10 != a1)
    || a4 && ![a1 _appearState])
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", a4, a5);
  }

  return v11;
}

- (BOOL)bs_endAppearanceTransition
{
  int v2 = [a1 _appearState] & 0xFFFFFFFD;
  if (v2 == 1) {
    [a1 endAppearanceTransition];
  }
  return v2 == 1;
}

- (uint64_t)bs_beginAppearanceTransition:()BaseBoardUI animated:
{
  if (a3)
  {
    if ((objc_msgSend(a1, "bs_isDisappearingOrDisappeared") & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = objc_msgSend(a1, "bs_isAppearingOrAppeared");
    if (!result) {
      return result;
    }
  }
  [a1 beginAppearanceTransition:a3 animated:a4];
  return 1;
}

- (BOOL)bs_isDisappearingOrDisappeared
{
  int v1 = [a1 _appearState];
  return !v1 || v1 == 3;
}

- (BOOL)bs_isAppearingOrAppeared
{
  return [a1 _appearState] - 1 < 2;
}

+ (id)bs_nextViewControllerForView:()BaseBoardUI
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    do
    {
      id v6 = [a1 viewControllerForView:v5];
      uint64_t v7 = [v5 superview];

      if (!v7) {
        break;
      }
      id v5 = v7;
    }
    while (!v6);
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = 0;
  }

  return v6;
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, 0, 0, 0);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI animated:transitionBlock:
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, 0, a4, a5);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, a4, 0, 0);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:animated:transitionBlock:
{
  id v10 = a3;
  id v11 = a4;
  v12 = a6;
  if (v10
    && [a1 isViewLoaded]
    && ([v10 parentViewController],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13 != a1))
  {
    [v10 loadViewIfNeeded];
    [a1 addChildViewController:v10];
    char v14 = objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v10, 1, a5);
    if (v11)
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [a1 view];
    }
    id v18 = v15;
    __int16 v19 = [v10 view];
    v20 = [v19 superview];
    __int16 v21 = v20;
    if (!v20 || ([v20 isDescendantOfView:v18] & 1) == 0) {
      [v18 addSubview:v19];
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke;
    v32[3] = &unk_1E5ABD6D0;
    id v33 = v10;
    v34 = a1;
    char v35 = v14;
    id v22 = (void (**)(void, void))MEMORY[0x1A623AF30](v32);
    __int16 v23 = v22;
    if (v12)
    {
      v24 = (void *)MEMORY[0x1E4F4F6B8];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_11;
      v30[3] = &unk_1E5ABD6F8;
      v31 = v22;
      __int16 v25 = [v24 sentinelWithCompletion:v30];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2_13;
      v28[3] = &unk_1E5ABD3B0;
      id v29 = v25;
      int v26 = (void (*)(void *, void *))v12[2];
      id v27 = v25;
      v26(v12, v28);
    }
    else
    {
      v22[2](v22, 1);
    }

    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (uint64_t)bs_removeChildViewController:()BaseBoardUI
{
  return objc_msgSend(a1, "bs_removeChildViewController:animated:transitionBlock:", a3, 0, 0);
}

- (uint64_t)bs_removeChildViewController:()BaseBoardUI animated:transitionBlock:
{
  id v8 = a3;
  id v9 = a5;
  if (v8
    && ([v8 parentViewController],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10 == a1))
  {
    [v8 willMoveToParentViewController:0];
    char v12 = objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v8, 0, a4);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke;
    v24[3] = &unk_1E5ABD6D0;
    id v25 = v8;
    int v26 = a1;
    char v27 = v12;
    v13 = (void (**)(void, void))MEMORY[0x1A623AF30](v24);
    char v14 = v13;
    if (v9)
    {
      id v15 = (void *)MEMORY[0x1E4F4F6B8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_14;
      v22[3] = &unk_1E5ABD6F8;
      __int16 v23 = v13;
      uint64_t v16 = [v15 sentinelWithCompletion:v22];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2_15;
      v20[3] = &unk_1E5ABD3B0;
      id v21 = v16;
      __int16 v17 = (void (*)(void *, void *))v9[2];
      id v18 = v16;
      v17(v9, v20);
    }
    else
    {
      v13[2](v13, 1);
    }

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)bs_presentedViewControllerIncludingAncestors
{
  int v2 = [a1 presentedViewController];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [a1 parentViewController];
    objc_msgSend(v5, "bs_presentedViewControllerIncludingAncestors");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)bs_presentationContextDefiningViewController
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    for (i = v1; ; i = (void *)v7)
    {
      char v4 = [v2 definesPresentationContext];
      char v5 = i ? v4 : 1;
      if (v5) {
        break;
      }
      id v6 = i;

      uint64_t v7 = [v6 parentViewController];

      int v2 = v6;
    }
  }
  else
  {
    i = 0;
  }

  return v2;
}

- (id)bs_topPresentedViewController
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    v3 = v1;
    do
    {
      char v4 = v2;
      id v2 = v3;

      v3 = [v2 presentedViewController];
    }
    while (v3);
  }

  return v2;
}

- (void)bs_traitCollectionDidChange:()BaseBoardUI forManagedTraitEnvironment:
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 parentViewController];
  objc_msgSend(v7, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v8, v6);
}

@end