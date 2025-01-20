@interface UIViewController(AppleMediaServices)
- (id)ams_backgroundColor;
- (id)ams_frontmostController;
- (id)ams_navigationController;
- (id)ams_navigationItemViewController;
- (id)ams_parentViewControllerOfClass:()AppleMediaServices;
- (uint64_t)ams_hasDescendentChildViewController:()AppleMediaServices;
- (uint64_t)ams_navigationIndex;
- (uint64_t)ams_parentContainer;
- (void)ams_dismissViewControllerAnimated:()AppleMediaServices includePresented:completion:;
- (void)ams_removeFromParentViewController;
- (void)ams_setBackgroundColor:()AppleMediaServices;
- (void)ams_setChildViewController:()AppleMediaServices;
- (void)ams_transitionFromViewController:()AppleMediaServices toViewController:completionHandler:;
@end

@implementation UIViewController(AppleMediaServices)

- (id)ams_backgroundColor
{
  v1 = [a1 view];
  v2 = objc_msgSend(v1, "ams_backgroundColor");

  return v2;
}

- (id)ams_frontmostController
{
  id v1 = a1;
  v2 = [v1 presentedViewController];

  if (v2)
  {
    do
    {
      v3 = [v1 presentedViewController];

      v4 = [v3 presentedViewController];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (id)ams_navigationController
{
  v2 = [a1 navigationController];

  if (v2) {
    [a1 navigationController];
  }
  else {
  v3 = objc_msgSend(a1, "ams_parentViewControllerOfClass:", objc_opt_class());
  }
  return v3;
}

- (uint64_t)ams_navigationIndex
{
  id v1 = objc_msgSend(a1, "ams_navigationItemViewController");
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "ams_navigationController");
    v4 = [v3 viewControllers];
    uint64_t v5 = [v4 indexOfObject:v2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)ams_parentContainer
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "ams_parentViewControllerOfClass:", v2);
}

- (id)ams_parentViewControllerOfClass:()AppleMediaServices
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 parentViewController];

      id v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

- (id)ams_navigationItemViewController
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (v1)
    {
      v3 = [v1 parentViewController];
      if (v3)
      {
        while (1)
        {
          v4 = v3;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }

          v3 = [v4 parentViewController];
          id v1 = v4;
          if (!v3) {
            goto LABEL_9;
          }
        }
        v3 = v4;
      }
LABEL_9:
    }
    id v1 = v1;
    uint64_t v2 = v1;
  }

  return v2;
}

- (void)ams_setBackgroundColor:()AppleMediaServices
{
  id v4 = a3;
  id v5 = [a1 view];
  objc_msgSend(v5, "ams_setBackgroundColor:", v4);
}

- (void)ams_dismissViewControllerAnimated:()AppleMediaServices includePresented:completion:
{
  id v8 = a5;
  id v9 = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__UIViewController_AppleMediaServices__ams_dismissViewControllerAnimated_includePresented_completion___block_invoke;
  aBlock[3] = &unk_2643E5DE8;
  char v22 = a3;
  id v10 = v9;
  id v20 = v10;
  id v11 = v8;
  id v21 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v13 addObject:v10];
  if (a4)
  {
    uint64_t v14 = [v10 presentedViewController];
    if (v14)
    {
      v15 = (void *)v14;
      do
      {
        [v13 addObject:v15];
        uint64_t v16 = [v15 presentedViewController];

        v15 = (void *)v16;
      }
      while (v16);
    }
  }
  uint64_t v17 = [v13 count] - 1;
  if (v17 >= 0)
  {
    do
    {
      v18 = [v13 objectAtIndexedSubscript:v17];
      v12[2](v12, v18);

      --v17;
    }
    while (v17 != -1);
  }
}

- (uint64_t)ams_hasDescendentChildViewController:()AppleMediaServices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "childViewControllers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        if (v10 == v4 || (objc_msgSend(v10, "ams_hasDescendentChildViewController:", v4) & 1) != 0)
        {
          uint64_t v11 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v11 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)ams_removeFromParentViewController
{
  uint64_t v2 = [a1 parentViewController];

  if (v2)
  {
    objc_msgSend(a1, "ams_willMoveToParentViewController:", 0);
    v3 = [a1 view];
    [v3 removeFromSuperview];

    [a1 removeFromParentViewController];
  }
}

- (void)ams_setChildViewController:()AppleMediaServices
{
  id v6 = a3;
  objc_msgSend(v6, "ams_removeFromParentViewController");
  [a1 addChildViewController:v6];
  id v4 = [a1 view];
  id v5 = [v6 view];
  [v4 addSubview:v5];

  objc_msgSend(v6, "ams_didMoveToParentViewController:", a1);
}

- (void)ams_transitionFromViewController:()AppleMediaServices toViewController:completionHandler:
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __108__UIViewController_AppleMediaServices__ams_transitionFromViewController_toViewController_completionHandler___block_invoke_2;
  v10[3] = &unk_2643E45B8;
  id v11 = v8;
  id v9 = v8;
  [a1 transitionFromViewController:a3 toViewController:a4 duration:5242880 options:&__block_literal_global_35 animations:v10 completion:0.3];
}

@end