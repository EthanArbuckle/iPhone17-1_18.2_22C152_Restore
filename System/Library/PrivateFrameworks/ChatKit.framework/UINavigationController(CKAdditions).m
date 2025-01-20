@interface UINavigationController(CKAdditions)
- (id)__ck_popToRootViewControllerAnimated:()CKAdditions completion:;
- (id)__ck_popToViewController:()CKAdditions animated:completion:;
- (id)__ck_popViewControllerAnimated:()CKAdditions completion:;
- (void)__ck_callDelegateBlocks;
- (void)__ck_enqueueCompletionBlock:()CKAdditions;
- (void)__ck_pushViewController:()CKAdditions animated:completion:;
@end

@implementation UINavigationController(CKAdditions)

- (void)__ck_callDelegateBlocks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_getAssociatedObject(a1, &key);
  objc_setAssociatedObject(a1, &key, 0, (void *)0x301);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)__ck_enqueueCompletionBlock:()CKAdditions
{
  id v5 = a3;
  if (v5)
  {
    aBlock = v5;
    uint64_t v6 = [a1 delegate];

    if (!v6)
    {
      long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v10 = NSStringFromSelector(a2);
      [v9 handleFailureInMethod:a2, a1, @"UINavigationController_CKAdditions.m", 18, @"Calling %@ on a navigation controller with no delegate is incorrect usage.", v10 object file lineNumber description];
    }
    uint64_t v7 = objc_getAssociatedObject(a1, &key);
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      objc_setAssociatedObject(a1, &key, v7, (void *)0x301);
    }
    long long v8 = _Block_copy(aBlock);
    [v7 addObject:v8];

    id v5 = aBlock;
  }
}

- (void)__ck_pushViewController:()CKAdditions animated:completion:
{
  id v8 = a3;
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", a5);
  [a1 pushViewController:v8 animated:a4];
}

- (id)__ck_popViewControllerAnimated:()CKAdditions completion:
{
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __81__UINavigationController_CKAdditions____ck_popViewControllerAnimated_completion___block_invoke;
  v15 = &unk_1E562C008;
  v17 = &v18;
  uint64_t v7 = (void (**)(void))v6;
  id v16 = v7;
  id v8 = _Block_copy(&v12);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v8, v12, v13, v14, v15);
  uint64_t v9 = [a1 popViewControllerAnimated:a3];
  long long v10 = (void *)v9;
  *((unsigned char *)v19 + 24) = v9 != 0;
  if (v7 && !v9) {
    v7[2](v7);
  }

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)__ck_popToViewController:()CKAdditions animated:completion:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __84__UINavigationController_CKAdditions____ck_popToViewController_animated_completion___block_invoke;
  uint64_t v18 = &unk_1E562C008;
  uint64_t v20 = &v21;
  long long v10 = (void (**)(void))v9;
  id v19 = v10;
  long long v11 = _Block_copy(&v15);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v11, v15, v16, v17, v18);
  uint64_t v12 = [a1 popToViewController:v8 animated:a4];
  uint64_t v13 = [v12 count];
  *((unsigned char *)v22 + 24) = v13 != 0;
  if (v10 && !v13) {
    v10[2](v10);
  }

  _Block_object_dispose(&v21, 8);

  return v12;
}

- (id)__ck_popToRootViewControllerAnimated:()CKAdditions completion:
{
  id v6 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __87__UINavigationController_CKAdditions____ck_popToRootViewControllerAnimated_completion___block_invoke;
  uint64_t v15 = &unk_1E562C008;
  v17 = &v18;
  uint64_t v7 = (void (**)(void))v6;
  id v16 = v7;
  id v8 = _Block_copy(&v12);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v8, v12, v13, v14, v15);
  id v9 = [a1 popToRootViewControllerAnimated:a3];
  uint64_t v10 = [v9 count];
  *((unsigned char *)v19 + 24) = v10 != 0;
  if (v7 && !v10) {
    v7[2](v7);
  }

  _Block_object_dispose(&v18, 8);

  return v9;
}

@end