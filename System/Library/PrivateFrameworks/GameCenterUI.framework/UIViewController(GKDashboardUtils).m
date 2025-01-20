@interface UIViewController(GKDashboardUtils)
- (id)_gkExtensionViewController;
- (id)_gkOriginatingViewController;
- (id)_gkOriginatingViewControllerAutoDetermined;
- (uint64_t)_gkPushViewController:()GKDashboardUtils animated:;
- (void)_gkDismissViewController:()GKDashboardUtils animated:;
- (void)_gkModifyTopConstraintToLayoutGuideForSubview:()GKDashboardUtils;
- (void)_gkPopViewControllerAnimated:()GKDashboardUtils;
- (void)_gkPresentViewController:()GKDashboardUtils animated:;
- (void)_gkPresentViewController:()GKDashboardUtils asPopoverFromView:animated:;
- (void)_gkPushViewController:()GKDashboardUtils replaceCurrent:animated:;
- (void)_gkRemoveViewController:()GKDashboardUtils animated:;
- (void)_gkSetOriginatingViewController:()GKDashboardUtils;
- (void)_gkShowViewController:()GKDashboardUtils;
@end

@implementation UIViewController(GKDashboardUtils)

- (id)_gkExtensionViewController
{
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1F0861208])
  {
    id v2 = a1;
    if (v2)
    {
LABEL_3:
      id v3 = v2;
      goto LABEL_18;
    }
  }
  else
  {
    v4 = [a1 navigationController];
    v5 = [v4 parentViewController];

    if ([(id)objc_opt_class() conformsToProtocol:&unk_1F0861208])
    {
      id v2 = v5;
    }
    else
    {
      v6 = [a1 parentViewController];
      v7 = [v6 navigationController];
      v8 = [v7 parentViewController];

      if ([(id)objc_opt_class() conformsToProtocol:&unk_1F0861208]) {
        id v2 = v8;
      }
      else {
        id v2 = 0;
      }
    }
    if (v2) {
      goto LABEL_3;
    }
  }
  v9 = [a1 extensionContext];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 _principalObject];
    if ([(id)objc_opt_class() conformsToProtocol:&unk_1F0861208]) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v3 = v12;

LABEL_18:

  return v3;
}

- (void)_gkModifyTopConstraintToLayoutGuideForSubview:()GKDashboardUtils
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 view];
  v6 = [v5 constraints];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "firstItem", (void)v22);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v4)
        {
          uint64_t v14 = [v12 firstAttribute];

          if (v14 == 3)
          {
            v15 = [v4 topAnchor];
            v16 = [a1 view];
            v17 = [v16 safeAreaLayoutGuide];
            v18 = [v17 bottomAnchor];
            [v12 constant];
            v19 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18);

            v20 = [a1 view];
            [v20 removeConstraint:v12];

            v21 = [a1 view];
            [v21 addConstraint:v19];

            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_gkShowViewController:()GKDashboardUtils
{
  id v4 = a3;
  [a1 showViewController:v4 sender:a1];
  [v4 _gkSetOriginatingViewController:a1];
}

- (void)_gkRemoveViewController:()GKDashboardUtils animated:
{
  id v14 = a3;
  [v14 _gkSetOriginatingViewController:0];
  v5 = [v14 navigationController];
  v6 = [v5 viewControllers];
  uint64_t v7 = [v6 indexOfObject:v14];

  uint64_t v8 = v7 - 1;
  if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v11 = [v14 presentingViewController];
    [v11 dismissViewControllerAnimated:a4 completion:0];
  }
  else
  {
    uint64_t v9 = [v14 navigationController];
    uint64_t v10 = [v9 viewControllers];
    v11 = [v10 objectAtIndexedSubscript:v8];

    id v12 = [v14 navigationController];
    id v13 = (id)[v12 popToViewController:v11 animated:a4];
  }
}

- (void)_gkSetOriginatingViewController:()GKDashboardUtils
{
}

- (id)_gkOriginatingViewController
{
  id v2 = objc_getAssociatedObject(a1, @"GKOriginatingViewControllerKey");
  if (!v2)
  {
    id v2 = [a1 _gkOriginatingViewControllerAutoDetermined];
  }

  return v2;
}

- (id)_gkOriginatingViewControllerAutoDetermined
{
  id v2 = [a1 navigationController];
  id v3 = [v2 viewControllers];

  uint64_t v4 = [v3 indexOfObject:a1];
  uint64_t v5 = v4 - 1;
  if (v4 < 1 || ([v3 objectAtIndex:v5], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = objc_msgSend(a1, "presentingViewController", v5);
  }

  return v6;
}

- (void)_gkPresentViewController:()GKDashboardUtils animated:
{
  id v6 = a3;
  [a1 presentViewController:v6 animated:a4 completion:0];
  [v6 _gkSetOriginatingViewController:a1];
}

- (void)_gkPresentViewController:()GKDashboardUtils asPopoverFromView:animated:
{
  id v20 = a4;
  id v8 = a3;
  if (v20)
  {
    [v8 setModalPresentationStyle:7];
    uint64_t v9 = [v20 superview];
    uint64_t v10 = [v8 popoverPresentationController];
    [v10 setSourceView:v9];

    [v20 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v8 popoverPresentationController];
    objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

    [a1 presentViewController:v8 animated:a5 completion:0];
    [v8 _gkSetOriginatingViewController:a1];
  }
  else
  {
    [a1 _gkPresentViewController:v8 animated:a5];
  }
}

- (void)_gkDismissViewController:()GKDashboardUtils animated:
{
  id v5 = a3;
  id v6 = [v5 presentingViewController];
  [v5 _gkSetOriginatingViewController:0];

  [v6 dismissViewControllerAnimated:a4 completion:0];
}

- (uint64_t)_gkPushViewController:()GKDashboardUtils animated:
{
  return [a1 _gkPushViewController:a3 replaceCurrent:0 animated:a4];
}

- (void)_gkPushViewController:()GKDashboardUtils replaceCurrent:animated:
{
  id v13 = a3;
  id v8 = [a1 navigationController];
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = [v8 viewControllers];
    double v11 = (void *)[v10 mutableCopy];

    double v12 = [v11 lastObject];
    [v12 _gkSetOriginatingViewController:0];

    [v11 removeLastObject];
    [v11 addObject:v13];
    [v9 setViewControllers:v11 animated:a5];
  }
  else
  {
    [v8 pushViewController:v13 animated:a5];
  }

  [v13 _gkSetOriginatingViewController:a1];
}

- (void)_gkPopViewControllerAnimated:()GKDashboardUtils
{
  id v5 = [a1 navigationController];
  id v6 = [v5 topViewController];
  [v6 _gkSetOriginatingViewController:0];

  id v8 = [a1 navigationController];
  id v7 = (id)[v8 popViewControllerAnimated:a3];
}

@end