@interface UIViewController(HUPresentation)
- (id)hu_dismissViewControllerAnimated:()HUPresentation;
- (id)hu_performDismissalRequest:()HUPresentation;
- (id)hu_performPresentationRequest:()HUPresentation;
@end

@implementation UIViewController(HUPresentation)

- (id)hu_performPresentationRequest:()HUPresentation
{
  id v5 = a3;
  v6 = [v5 viewController];

  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"UIViewController+HUPresentation.m", 21, @"Invalid parameter not satisfying: %@", @"presentationRequest.viewController != nil" object file lineNumber description];
  }
  v7 = [v5 viewController];
  uint64_t v8 = [v5 animated];
  uint64_t v9 = [v5 preferredPresentationType];
  if (!v9) {
    goto LABEL_16;
  }
  if (v9 != 1)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "preferredPresentationType"));
    [v15 handleFailureInMethod:a2, a1, @"UIViewController+HUPresentation.m", 41, @"Unknown presentation type %@", v16 object file lineNumber description];

    v17 = (void *)MEMORY[0x1E4F7A0D8];
    v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_internalErrorWithDescription:", @"Unknown presentation type");
    v19 = [v17 futureWithError:v18];

    goto LABEL_17;
  }
  objc_opt_class();
  id v10 = a1;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = v10;

    BOOL v14 = v13 == 0;
  }
  else
  {
    uint64_t v20 = [v10 navigationController];
    if (!v20)
    {
      NSLog(&cfstr_RequestedNavig.isa, v7, v10);
      goto LABEL_16;
    }
    id v13 = (id)v20;
    BOOL v14 = 0;
  }
  v19 = objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v7, v8);

  if (v14)
  {
LABEL_16:
    v19 = objc_msgSend(a1, "hu_presentPreloadableViewController:animated:", v7, v8);
  }
LABEL_17:

  return v19;
}

- (id)hu_performDismissalRequest:()HUPresentation
{
  id v4 = a3;
  id v5 = [v4 viewController];
  uint64_t v6 = [v4 animated];

  objc_opt_class();
  id v7 = a1;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = v7;
  }
  else
  {
    id v10 = [v7 navigationController];
    if (!v10) {
      goto LABEL_10;
    }
  }
  v11 = [v10 viewControllers];
  uint64_t v12 = [v11 indexOfObject:v5];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12)
    {
      v21 = [v10 viewControllers];
      v22 = [v21 objectAtIndexedSubscript:v12 - 1];

      v23 = (void *)MEMORY[0x1E4F7A0D8];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke;
      v31[3] = &unk_1E63864C8;
      id v10 = v10;
      id v32 = v10;
      id v33 = v22;
      char v34 = v6;
      id v24 = v22;
      v15 = [v23 futureWithBlock:v31];
    }
    else
    {
      NSLog(&cfstr_AttemptingToDi.isa, v5, v10);
      id v13 = (void *)MEMORY[0x1E4F7A0D8];
      BOOL v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_internalErrorWithDescription:", @"Invalid dismiss request for %@", v5);
      v15 = [v13 futureWithError:v14];
    }
    goto LABEL_15;
  }
LABEL_10:
  v16 = [v7 presentedViewController];
  v17 = [v16 childViewControllers];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke_2;
  v29 = &unk_1E63864F0;
  id v18 = v5;
  id v30 = v18;
  char v19 = objc_msgSend(v17, "na_any:", &v26);

  id v20 = [v7 presentedViewController];

  if ((v19 & 1) == 0 && v20 != v18) {
    NSLog(&cfstr_AttemptingToDi_0.isa, v18, v7, v26, v27, v28, v29);
  }
  v15 = objc_msgSend(v7, "hu_dismissViewControllerAnimated:", v6);

LABEL_15:

  return v15;
}

- (id)hu_dismissViewControllerAnimated:()HUPresentation
{
  id v5 = [a1 presentedViewController];

  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke;
    v11[3] = &unk_1E6386518;
    v11[4] = a1;
    char v12 = a3;
    uint64_t v6 = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke((uint64_t)v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_76;
    v9[3] = &unk_1E6386540;
    v9[4] = a1;
    char v10 = a3;
    id v7 = [v6 flatMap:v9];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v7;
}

@end