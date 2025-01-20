@interface UIViewController(AuthenticationServicesExtras)
- (id)_as_applicationBackgroundBlock;
- (id)_as_presentedViewControllerStackForPasswordManagerUpToClasses:()AuthenticationServicesExtras;
- (id)_as_viewControllerToPresentFrom;
- (void)_as_restorePresentedViewControllerStackForPasswordManager:()AuthenticationServicesExtras;
- (void)_as_setApplicationBackgroundBlock:()AuthenticationServicesExtras;
@end

@implementation UIViewController(AuthenticationServicesExtras)

- (id)_as_applicationBackgroundBlock
{
  v1 = objc_getAssociatedObject(a1, (const void *)applicationBackgroundBlockKey);
  v2 = v1;
  if (v1)
  {
    v3 = [v1 block];
    v4 = (void *)MEMORY[0x21D484070]();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_as_setApplicationBackgroundBlock:()AuthenticationServicesExtras
{
  id v4 = a3;
  v5 = (const void *)applicationBackgroundBlockKey;
  id v7 = v4;
  if (v4)
  {
    v6 = [[ASBackgroundObserver alloc] initWithViewController:a1 block:v4];
    objc_setAssociatedObject(a1, v5, v6, (void *)1);
  }
  else
  {
    objc_setAssociatedObject(a1, (const void *)applicationBackgroundBlockKey, 0, (void *)1);
  }
}

- (id)_as_viewControllerToPresentFrom
{
  id v1 = a1;
  v2 = [v1 presentedViewController];
  if (v2)
  {
    while (1)
    {
      v3 = v2;
      if ([v2 isBeingDismissed]) {
        break;
      }

      v2 = [v3 presentedViewController];
      id v1 = v3;
      if (!v2)
      {
        id v1 = v3;
        v3 = 0;
        break;
      }
    }
  }

  return v1;
}

- (id)_as_presentedViewControllerStackForPasswordManagerUpToClasses:()AuthenticationServicesExtras
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 presentedViewController];

  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      v10 = (void *)MEMORY[0x263EFFA68];
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = objc_msgSend(a1, "presentedViewController", (void)v18);
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          break;
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v10 = [MEMORY[0x263EFF980] array];
      v14 = [a1 presentedViewController];
      [v10 addObject:v14];

      v15 = [a1 presentedViewController];
      v16 = objc_msgSend(v15, "_as_presentedViewControllerStackForPasswordManagerUpToClasses:", v6);
      [v10 addObjectsFromArray:v16];

      id v6 = v15;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (void)_as_restorePresentedViewControllerStackForPasswordManager:()AuthenticationServicesExtras
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 firstObject];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __108__UIViewController_AuthenticationServicesExtras___as_restorePresentedViewControllerStackForPasswordManager___block_invoke;
    v7[3] = &unk_264395428;
    id v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [a1 presentViewController:v6 animated:0 completion:v7];
  }
}

@end